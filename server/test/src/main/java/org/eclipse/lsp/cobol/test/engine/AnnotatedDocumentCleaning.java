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
import java.util.function.Function;
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
class AnnotatedDocumentCleaning {
  /**
   * Clean up and extract the semantic context from the annotated text. The implicit copybooks
   * should not present in the list of explicit ones
   *
   * @param text text to clean up
   * @param explicitCopybooks list of explicitly defined copybooks
   * @param expectedDiagnostics diagnostics that should present in the document after the analysis
   * @return PreprocessedDocument for the further analysis
   */
  PreprocessedDocument prepareDocument(
      String text,
      List<CobolText> explicitCopybooks,
      List<String> subroutineNames,
      Map<String, Diagnostic> expectedDiagnostics,
      SQLBackend sqlBackend) {
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
                .orElse(null));

    return new PreprocessedDocument(
        testData.getText(),
        processCopybooks(
            collectCopybooks(explicitCopybooks, testData.getCopybookUsages(), sqlBackend),
            expectedDiagnostics,
            testData),
        testData);
  }

  private Stream<CobolText> collectCopybooks(
      List<CobolText> explicitCopybooks,
      Map<String, List<Location>> usedCopybooks,
      SQLBackend sqlBackend) {
    return Stream.concat(
        explicitCopybooks.stream(),
        collectUsedPredefinedCopybooks(
            usedCopybooks.keySet(),
            explicitCopybooks.stream().map(CobolText::getFileName).collect(Collectors.toList()),
            sqlBackend));
  }

  private Stream<CobolText> collectUsedPredefinedCopybooks(
      Set<String> copybookUsages, List<String> explicitCopybooks, SQLBackend sqlBackend) {
    return PredefinedCopybooks.getNames().stream()
        .filter(copybookUsages::contains)
        .filter(it -> !explicitCopybooks.contains(it))
        .map(PredefinedCopybookUtils.toCobolText(sqlBackend));
  }

  private List<CobolText> processCopybooks(
      Stream<CobolText> copybooks,
      Map<String, Diagnostic> expectedDiagnostics,
      TestData testData) {
    return copybooks
        .map(c -> {
          TestData test = processCopybook(expectedDiagnostics).apply(c);
          test = collectDataFromCopybooks(testData).apply(test);
          return new CobolText(test.getCopybookName(), test.getDialectType(), test.getText(), c.getUrl(), c.isPreprocess());
        }).collect(toList());
  }

  private Function<CobolText, TestData> processCopybook(Map<String, Diagnostic> expectedDiagnostics) {
    return it -> processDocument(
        it.getFullText(),
        it.getFileName(),
        toURI(it.getFileName(), it.getDialectType()),
        ImmutableList.of(),
        expectedDiagnostics,
        it.getDialectType());
  }

  private TestData processDocument(
      String text,
      String documentName,
      String uri,
      List<String> subroutineNames,
      Map<String, Diagnostic> expectedDiagnostics,
      String dialectType) {
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
            dialectType);
    new ParseTreeWalker().walk(listener, startRule);
    return listener.getProcessingResult();
  }

  private Function<TestData, TestData> collectDataFromCopybooks(TestData accumulator) {
    return copybookTestData -> {
      mergeMaps(accumulator.getCopybookDefinitions(), copybookTestData.getCopybookDefinitions());
      mergeMaps(accumulator.getCopybookUsages(), copybookTestData.getCopybookUsages());
      mergeMaps(accumulator.getParagraphDefinitions(), copybookTestData.getParagraphDefinitions());
      mergeMaps(accumulator.getParagraphUsages(), copybookTestData.getParagraphUsages());
      mergeMaps(accumulator.getSectionDefinitions(), copybookTestData.getSectionDefinitions());
      mergeMaps(accumulator.getSectionUsages(), copybookTestData.getSectionUsages());
      mergeMaps(
          accumulator.getSubroutineDefinitions(), copybookTestData.getSubroutineDefinitions());
      mergeMaps(accumulator.getSubroutineUsages(), copybookTestData.getSubroutineUsages());
      mergeMaps(accumulator.getVariableDefinitions(), copybookTestData.getVariableDefinitions());
      mergeMaps(accumulator.getVariableUsages(), copybookTestData.getVariableUsages());
      mergeMaps(accumulator.getDiagnostics(), copybookTestData.getDiagnostics());
      return copybookTestData;
    };
  }

  private <T> void mergeMaps(Map<String, List<T>> to, Map<String, List<T>> from) {
    from.forEach(
        (key, value) -> {
          if (to.containsKey(key)) {
            List<T> list = new LinkedList<>(to.get(key));
            list.addAll(value);
            to.put(key, list);
          } else to.put(key, value);
        });
  }
}
