/*
 * Copyright (c) 2020 Broadcom.
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

import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;
import static org.eclipse.lsp.cobol.common.model.NodeType.*;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;
import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.analyze;
import static org.junit.jupiter.api.Assertions.assertEquals;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Multimap;
import com.google.gson.JsonElement;
import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.copybook.SQLBackend;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.symbols.SymbolTable;
import org.eclipse.lsp.cobol.common.utils.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.test.CobolText;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * This class applies syntax and semantic analysis for COBOL texts using the actual Language Engine.
 * For test purpose, it is required to mark all the syntax and semantic elements (i.e. errors,
 * variables, paragraphs, and copybooks) in the text. The affected token should be wrapped with
 * curly braces {} with special tags. Diagnostic ID is optional for the elements. Without special
 * tags token inside curly braces considered as a diagnostic of syntax error.
 *
 * <p>Tags:
 * <li>$ - Variable
 * <li># - Paragraph
 * <li>@ - Section
 * <li>~ - Copybook
 * <li>* - Definition
 * <li>| - Diagnostic
 * <li>^ - Replacement that calculates the position of the element after the replacement
 * <li>` - Replacement that calculates the position of the element before the replacement
 * <li>& - Constant (predefined variable)
 * <li>% - Subroutine
 * <li>{_ _} - Multi-token error
 *
 *     <p>By default, tags treated as an element usage. With '*' specified the occurrence will be
 *     treated as a definition. For example, {$*VAR1} is a definition for VAR1, and {#PAR2} is a
 *     usage of PAR2. Copybook definitions are optional, by default they point to the beginning of
 *     the copybook. Predefined variables definitions are implicit, so they will present in the
 *     according list by default. You may find this list in {@link UseCasePreprocessorListener}, so
 *     don't forget to update it once new predefined variables added.
 *
 *     <p>Diagnostic is optional for semantic elements. To specify a semantic error, add '|', and
 *     the ID of the expected diagnostic at this position: {$CHILD|InvalidDefinition}. In this case,
 *     there should be an according to key-value pair inside expected diagnostics.
 *
 *     <p>Syntax error may defined as follows: {DIVISIONs|1}. So, map of expected tokens should
 *     contain '1' as a key, and a diagnostic with message "Syntax error on 'DIVISIONs' expected
 *     DIVISION". The position of the diagnostic should be null. This pattern you may use only for
 *     one-token syntax or semantic errors.
 *
 *     <p>To show that the token will be replaced during the pre-processing on the actual language
 *     engine, you may mark it with '^' or '`' characters with the result specified after. For
 *     example, {$*:TAG:-ID^CSTOUT-ID} will return ':TAG:-ID' as the text, and CSTOUT-ID as a
 *     variable definition. The position will be calculated as for the replacement. If you specify
 *     {~CPYNM`CPYNM_ABC}, the result will be 'CPYNM' as the text and the 'CPYNM_ABC' as a copybook
 *     usage name. The position will be calculated as for the original text.
 *
 *     <p>Some semantic errors may consist of several tokens. In order to show this, you may use
 *     multi-token error declaration: {_{$CHILD} OF {$PARENT}|id_}. The included semantic elements
 *     will be also processed as usual.
 *
 *     <p>All the tags will be removed during the processing, so "MOVE 00 TO {_{$CHILD} OF
 *     {$PARENT}|id_}." will be treated as "MOVE 00 TO CHILD OF PARENT." with positions according to
 *     the resulting text.
 *
 *     <p>After the analysis finished, the AnalysisResult of the actual Language engine will be
 *     compared with expected one. Notice, that while checking lists, the order of elements doesn't
 *     matter.
 */
@UtilityClass
public class UseCaseEngine {
  private final Comparator<Position> positionComparator =
      comparing(Position::getLine).thenComparing(Position::getCharacter);
  private final Comparator<Range> rangeComparator =
      comparing(Range::getStart, positionComparator)
          .thenComparing(Range::getEnd, positionComparator);
  private final Comparator<Diagnostic> diagnosticComparator =
      comparing(Diagnostic::getRange, rangeComparator).thenComparing(Diagnostic::getMessage);

  /**
   * Check if the language engine applies required syntax and semantic checks. All the semantic
   * elements in the given text, as well as syntax errors, should be wrapped with according tags.
   * The same extraction operation applied also for the given copybooks. Copybooks processing
   * enabled.
   *
   * <p>Expected diagnostics should contain the full of list of syntax and semantic
   * errors/warnings/info messages for the document and copybooks. Existing positions, if they are,
   * for the diagnostics will be dropped and replaced with ones extracted by engine by their IDs.
   *
   * @param text - COBOL text to analyse. It will be cleaned up before analysis to exclude all the
   *     technical tokens and collect syntax and semantic elements
   * @param copybooks - list of the copybooks used in the document
   * @param expectedDiagnostics - map of IDs and diagnostics that are expected to appear in the
   *     document or copybooks. IDs are the same as in the diagnostic sections inside the text.
   * @return analysis result object
   */
  public AnalysisResult runTest(
      String text, List<CobolText> copybooks, Map<String, Diagnostic> expectedDiagnostics) {
    return runTest(text, copybooks, expectedDiagnostics, ImmutableList.of());
  }

  /**
   * Check if the language engine applies required syntax and semantic checks. All the semantic
   * elements in the given text, as well as syntax errors, should be wrapped with according tags.
   * The same extraction operation applied also for the given copybooks. The copybook processing
   * mode relies on processingMode parameter.
   *
   * <p>Expected diagnostics should contain the full of list of syntax and semantic
   * errors/warnings/info messages for the document and copybooks. Existing positions, if they are,
   * for the diagnostics will be dropped and replaced with ones extracted by engine by their IDs.
   *
   * @param text - COBOL text to analyse. It will be cleaned up before analysis to exclude all the
   *     technical tokens and collect syntax and semantic elements
   * @param copybooks - list of the copybooks used in the document
   * @param expectedDiagnostics - map of IDs and diagnostics that are expected to appear in the
   *     document or copybooks. IDs are the same as in the diagnostic sections inside the text.
   * @param subroutineNames - list of subroutine names used in the document
   * @return analysis result object
   */
  public AnalysisResult runTest(
      String text,
      List<CobolText> copybooks,
      Map<String, Diagnostic> expectedDiagnostics,
      List<String> subroutineNames) {
    return runTest(
        text,
        copybooks,
        expectedDiagnostics,
        subroutineNames,
        AnalysisConfig.defaultConfig(CopybookProcessingMode.ENABLED));
  }

  /**
   * Check if the language engine applies required syntax and semantic checks. All the semantic
   * elements in the given text, as well as syntax errors, should be wrapped with according tags.
   * The same extraction operation applied also for the given copybooks. The copybook configuration
   * is built from processingMode and sqlBackend parameters.
   *
   * <p>Expected diagnostics should contain the full of list of syntax and semantic
   * errors/warnings/info messages for the document and copybooks. Existing positions, if they are,
   * for the diagnostics will be dropped and replaced with ones extracted by engine by their IDs.
   *
   * @param text - COBOL text to analyse. It will be cleaned up before analysis to exclude all the
   *     technical tokens and collect syntax and semantic elements
   * @param copybooks - list of the copybooks used in the document
   * @param expectedDiagnostics - map of IDs and diagnostics that are expected to appear in the
   *     document or copybooks. IDs are the same as in the diagnostic sections inside the text.
   * @param subroutineNames - list of subroutine names used in the document
   * @param analysisConfig - analysis settings: copybook processing mode and the SQL backend for the
   *     analysis
   * @return analysis result object
   */
  public AnalysisResult runTest(
      String text,
      List<CobolText> copybooks,
      Map<String, Diagnostic> expectedDiagnostics,
      List<String> subroutineNames,
      AnalysisConfig analysisConfig) {

    SQLBackend sqlBackendSetting = Optional.ofNullable(analysisConfig.getDialectsSettings()
            .get("target-sql-backend"))
            .map(JsonElement::getAsString)
            .map(SQLBackend::valueOf)
            .orElse(SQLBackend.DB2_SERVER);
    PreprocessedDocument document =
        AnnotatedDocumentCleaning.prepareDocument(
            text,
            copybooks,
            subroutineNames,
            expectedDiagnostics,
            sqlBackendSetting);
    AnalysisResult actual =
        analyze(
            UseCase.builder()
                .documentUri(DOCUMENT_URI)
                .text(document.getText())
                .copybooks(document.getCopybooks())
                .subroutines(subroutineNames)
                .cicsTranslator(analysisConfig.isCicsTranslatorEnabled())
                .copybookProcessingMode(
                    analysisConfig.getCopybookProcessingMode())
                .dialects(analysisConfig.getDialects())
                .sqlBackend(sqlBackendSetting)
                .dialectsSettings(analysisConfig.getDialectsSettings())
                .compilerOptions(analysisConfig.getCompilerOptions())
                .build());
    assertResultEquals(actual, document.getTestData());
    return actual;
  }

  /**
   * Run test and check only diagnostic, other errors will be ignored
   * @param text - COBOL text to analyse. It will be cleaned up before analysis to exclude all the
   *     technical tokens and collect syntax and semantic elements
   * @param copybooks - list of the copybooks used in the document
   * @param expectedDiagnostics - map of IDs and diagnostics that are expected to appear in the
   *     document or copybooks. IDs are the same as in the diagnostic sections inside the text.
   * @param subroutineNames - list of subroutine names used in the document
   * @param analysisConfig - analysis settings: copybook processing mode and the SQL backend for the
   *     analysis
   * @return analysis result object
   */
  public AnalysisResult runTestForDiagnostics(String text,
                                    List<CobolText> copybooks,
                                    Map<String, Diagnostic> expectedDiagnostics,
                                    List<String> subroutineNames,
                                    AnalysisConfig analysisConfig) {
    SQLBackend sqlBackendSetting = Optional.ofNullable(analysisConfig.getDialectsSettings().get("target-sql-backend"))
            .map(JsonElement::getAsString)
            .map(SQLBackend::valueOf)
            .orElse(SQLBackend.DB2_SERVER);

    PreprocessedDocument document =
        AnnotatedDocumentCleaning.prepareDocument(
            text,
            copybooks,
            subroutineNames,
            expectedDiagnostics,
                sqlBackendSetting);
    AnalysisResult actual =
        analyze(
            UseCase.builder()
                .documentUri(DOCUMENT_URI)
                .text(document.getText())
                .copybooks(document.getCopybooks())
                .subroutines(subroutineNames)
                .cicsTranslator(analysisConfig.isCicsTranslatorEnabled())
                .copybookProcessingMode(
                    analysisConfig.getCopybookProcessingMode())
                .dialects(analysisConfig.getDialects())
                .dialectsSettings(analysisConfig.getDialectsSettings())
                .build());

    assertDiagnostics(document.getTestData().getDiagnostics(), actual.getDiagnostics());
    return actual;
  }

  private static void assertResultEquals(AnalysisResult actual, TestData expected) {
    assertDiagnostics(expected.getDiagnostics(), actual.getDiagnostics());

    assertResult(
        "Copybook definitions:",
        expected.getCopybookDefinitions(),
        extractDefinitions(actual, COPY));
    assertResult("Copybook usages:", expected.getCopybookUsages(), extractUsages(actual, COPY));

    assertResult(
        "Variable definition:",
        expected.getVariableDefinitions(),
        extractVariableDefinitions(actual));
    assertResult("Variable usages:", expected.getVariableUsages(), extractVariableUsages(actual));

    assertResult(
        "Paragraph definition:",
        expected.getParagraphDefinitions(),
        extractDefinitions(actual, PARAGRAPH_NAME_NODE));
    assertResult(
        "Paragraph usages:",
        expected.getParagraphUsages(),
        extractUsages(actual, PARAGRAPH_NAME_NODE));

    assertResult(
        "Section definition:",
        expected.getSectionDefinitions(),
        extractDefinitions(actual, SECTION_NAME_NODE));
    assertResult(
        "Section usages:", expected.getSectionUsages(), extractUsages(actual, SECTION_NAME_NODE));

    assertResult(
        "Subroutine definitions: ",
        expected.getSubroutineDefinitions(),
        extractDefinitions(actual, SUBROUTINE_NAME_NODE));
    assertResult(
        "Subroutine usage:",
        expected.getSubroutineUsages(),
        extractUsages(actual, SUBROUTINE_NAME_NODE));
  }

  private Map<String, List<Location>> extractVariableDefinitions(AnalysisResult result) {
    return extractVariables(
        result,
        it -> !ImplicitCodeUtils.isImplicit(it.getLocality().getUri()),
        DefinedAndUsedStructure::getDefinitions);
  }

  private Map<String, List<Location>> extractVariableUsages(AnalysisResult result) {
    return extractVariables(
        result, variable -> !variable.getUsages().isEmpty(), DefinedAndUsedStructure::getUsages);
  }

  private Map<String, List<Location>> extractVariables(
      AnalysisResult result,
      Predicate<VariableNode> predicate,
      Function<DefinedAndUsedStructure, List<Location>> extractor) {

    return result
            .getRootNode()
            .getDepthFirstStream()
            .filter(hasType(PROGRAM))
            .map(ProgramNode.class::cast)
            .map(p -> result.getSymbolTableMap().get(SymbolTable.generateKey(p)))
            .filter(Objects::nonNull)
            .map(SymbolTable::getVariables)
            .map(Multimap::values)
            .flatMap(Collection::stream)
            .filter(it -> !FILLER_NAME.equals(it.getName()))
            .filter(predicate)
            .collect(toMap(extractor, PROGRAM));
  }

  private Map<String, List<Location>> extractDefinitions(AnalysisResult result, NodeType nodeType) {
    return extract(
        result,
        nodeType,
        DefinedAndUsedStructure::getDefinitions,
        context ->
            !(context.getDefinitions().isEmpty()
                || ImplicitCodeUtils.isImplicit(context.getDefinitions().get(0).getUri())));
  }

  private Map<String, List<Location>> extractUsages(AnalysisResult result, NodeType nodeType) {
    return extract(result, nodeType, DefinedAndUsedStructure::getUsages, context -> !context.getUsages().isEmpty());
  }

  private Map<String, List<Location>> extract(
      AnalysisResult result,
      NodeType nodeType,
      Function<DefinedAndUsedStructure, List<Location>> extractor,
      Predicate<DefinedAndUsedStructure> predicate) {
    return result
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(nodeType))
        .map(DefinedAndUsedStructure.class::cast)
        .filter(predicate)
        .collect(toMap(extractor, nodeType));
  }

  private Collector<DefinedAndUsedStructure, ?, Map<String, List<Location>>> toMap(
          Function<DefinedAndUsedStructure, List<Location>> extractor, NodeType nodeType) {
    return Collectors.toMap(
        ctx -> {
          if (nodeType != COPY) {
            return ctx.getName().toUpperCase();
          }
          String dialect = ((CopyNode) ctx).getDialect();
          return (dialect == null ? ctx.getName() : ctx.getName() + '!' + dialect).toUpperCase();
        },
        extractor,
        (l1, l2) -> Stream.concat(l1.stream(), l2.stream()).distinct().collect(toList()));
  }

  private void assertDiagnostics(
      Map<String, List<Diagnostic>> expected, Map<String, List<Diagnostic>> actual) {
    assertEquals(expected.keySet(), actual.keySet(), "Diagnostic documents are not the same");
    for (String documentUri : expected.keySet()) {
      List<Diagnostic> expectedDiagnostic =
          expected.get(documentUri).stream().sorted(diagnosticComparator).collect(toList());
      List<Diagnostic> actualDiagnostic =
          actual.get(documentUri).stream().sorted(diagnosticComparator).collect(toList());
      assertEquals(
          expectedDiagnostic, actualDiagnostic, "Different diagnostics for: " + documentUri);
    }
  }

  private void assertResult(
      String message, Map<String, List<Location>> expected, Map<String, List<Location>> actual) {
    assertEquals(expected.keySet(), actual.keySet(), message);
    expected.forEach(
        (key, value) ->
            assertEquals(
                value.stream().sorted(getLocationComparator()).collect(toList()),
                actual.get(key).stream().sorted(getLocationComparator()).collect(toList()),
                message + " for " + key));
  }

  private Comparator<Location> getLocationComparator() {
    return comparing(Location::getUri)
        .thenComparingInt(location -> location.getRange().getStart().getLine())
        .thenComparing(location -> location.getRange().getStart().getCharacter());
  }
}
