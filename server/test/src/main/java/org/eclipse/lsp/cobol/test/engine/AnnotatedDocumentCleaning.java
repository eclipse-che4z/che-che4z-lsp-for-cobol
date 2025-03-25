/*
 * Copyright (c) 2021 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package org.eclipse.lsp.cobol.test.engine;

import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.CharStreams.fromString;
import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;
import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.toURI;

import com.google.common.collect.ImmutableList;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.utils.PredefinedCopybooks;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.usecase.UseCasePreprocessorLexer;
import org.eclipse.usecase.UseCasePreprocessorParser;

/**
 * This utility class cleans up annotated texts for use cases and prepares the text and expected
 * semantic context
 */
@UtilityClass
public class AnnotatedDocumentCleaning {
  /**
   * Clean up and extract the semantic context from the annotated text. The implicit copybooks
   * should not present in the list of explicit ones
   *
   * @param text text to clean up
   * @param explicitCopybooks list of explicitly defined copybooks
   * @param subroutineNames list of subroutine names
   * @param expectedDiagnostics diagnostics that should present in the document after the analysis
   * @param sqlBackend sql backend for the analysis
   * @param compilerOptions compiler options
   * @return PreprocessedDocument for the further analysis
   */
  public PreprocessedDocument prepareDocument(
      String text,
      List<CobolText> explicitCopybooks,
      List<String> subroutineNames,
      Map<String, Diagnostic> expectedDiagnostics,
      SQLBackend sqlBackend,
      List<String> compilerOptions) {
    TestData testData =
        processDocument(
            text,
            null,
            DOCUMENT_URI,
            subroutineNames,
            expectedDiagnostics,
            explicitCopybooks.stream()
                .findFirst()
                .map(CobolText::getDialectType)
                .orElse(null), null);

      List<CobolText> copybooks = collectCopybooks(explicitCopybooks, testData.getCopybookUsages(), sqlBackend, compilerOptions)
              .map(c -> {
                  TestData test = processDocument(
                          c.getFullText(),
                          c.getFileName(),
                          toURI(c.getFileName(), c.getDialectType()),
                          ImmutableList.of(),
                          expectedDiagnostics,
                          c.getDialectType(),
                          testData.getCopybookEnterSectionNames().get(c.getFileName()));
                  mergeTestData(testData, test);
                  return new CobolText(test.getCopybookName(), test.getDialectType(), test.getText(), c.getUrl(), c.isPreprocess());
              }).collect(toList());
      return new PreprocessedDocument(testData.getText(), copybooks, testData);
  }

    private static void mergeTestData(TestData testData, TestData test) {
        mergeMaps(testData.getCopybookDefinitions(), test.getCopybookDefinitions());
        mergeMaps(testData.getCopybookUsages(), test.getCopybookUsages());
        mergeMaps(testData.getProcedureDefinitions(), test.getProcedureDefinitions());
        mergeMaps(testData.getProcedureUsages(), test.getProcedureUsages());
        mergeMaps(testData.getSubroutineDefinitions(), test.getSubroutineDefinitions());
        mergeMaps(testData.getSubroutineUsages(), test.getSubroutineUsages());
        mergeMaps(testData.getVariableDefinitions(), test.getVariableDefinitions());
        mergeMaps(testData.getVariableUsages(), test.getVariableUsages());
        mergeMaps(testData.getDiagnostics(), test.getDiagnostics());
    }

    private Stream<CobolText> collectCopybooks(
      List<CobolText> explicitCopybooks,
      Map<String, List<Location>> usedCopybooks,
      SQLBackend sqlBackend,
      List<String> compilerOptions) {
    return Stream.concat(
        explicitCopybooks.stream(),
        collectUsedPredefinedCopybooks(
            usedCopybooks.keySet(),
            explicitCopybooks.stream().map(CobolText::getFileName).collect(Collectors.toList()),
            sqlBackend, compilerOptions));
  }

  private Stream<CobolText> collectUsedPredefinedCopybooks(
      Set<String> copybookUsages, List<String> explicitCopybooks, SQLBackend sqlBackend, List<String> compilerOptions) {
    return PredefinedCopybooks.getNames().stream()
        .filter(copybookUsages::contains)
        .filter(it -> !explicitCopybooks.contains(it))
        .map(PredefinedCopybookUtils.toCobolText(sqlBackend, compilerOptions));
  }

    private TestData processDocument(
          String text,
          String documentName,
          String uri,
          List<String> subroutineNames,
          Map<String, Diagnostic> expectedDiagnostics,
          String dialectType,
          String sectionName) {
    int numberOfLines = text.split("\\R").length;

    UseCasePreprocessorLexer lexer = new UseCasePreprocessorLexer(fromString(text));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    UseCasePreprocessorParser parser = new UseCasePreprocessorParser(tokens);
    parser.removeErrorListeners();

    UseCasePreprocessorParser.StartRuleContext startRule = parser.startRule();

    UseCasePreprocessorListener listener =
        new UseCasePreprocessorListener(
            tokens,
            documentName,
            uri,
            numberOfLines,
            subroutineNames,
            expectedDiagnostics,
            dialectType,
            sectionName);
    new ParseTreeWalker().walk(listener, startRule);
    return listener.getProcessingResult();
  }

  private <K, V> void mergeMaps(Map<K, List<V>> to, Map<K, List<V>> from) {
    from.forEach(
        (key, value) -> {
          if (to.containsKey(key)) {
            List<V> list = new LinkedList<>(to.get(key));
            list.addAll(value);
            to.put(key, list);
          } else to.put(key, value);
        });
  }
}
