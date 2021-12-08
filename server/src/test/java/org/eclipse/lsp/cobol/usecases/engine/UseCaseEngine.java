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

package org.eclipse.lsp.cobol.usecases.engine;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.Multimap;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.model.tree.SubroutineNameNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Stream;

import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.*;
import static org.eclipse.lsp.cobol.core.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.SUBROUTINE_NAME_NODE;
import static org.eclipse.lsp.cobol.core.semantics.outline.OutlineNodeNames.FILLER_NAME;
import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.PREF_IMPLICIT;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.analyze;
import static org.junit.jupiter.api.Assertions.assertEquals;

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
 * <li>^ - Replacement
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
 *     engine, you may mark it with '^' character with the result specified after. For example,
 *     {$*:TAG:-ID^CSTOUT-ID} will return ':TAG:-ID' as the text, and CSTOUT-ID as a variable
 *     definition. The position will be calculated as for the replacement.
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
        AnalysisConfig.defaultConfig(new CopybookConfig(CopybookProcessingMode.ENABLED, SQLBackend.DB2_SERVER)));
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
   * @param analysisConfig - analysis settings: copybook processing mode and the SQL backend for the analysis
   * @return analysis result object
   */
  public AnalysisResult runTest(
      String text,
      List<CobolText> copybooks,
      Map<String, Diagnostic> expectedDiagnostics,
      List<String> subroutineNames,
      AnalysisConfig analysisConfig) {

    PreprocessedDocument document =
        AnnotatedDocumentCleaning.prepareDocument(
            text, copybooks, subroutineNames, expectedDiagnostics, analysisConfig.getCopybookConfig().getSqlBackend());
    AnalysisResult actual =
        analyze(
            UseCase.builder()
                .fileName(DOCUMENT_URI)
                .text(document.getText())
                .copybooks(document.getCopybooks())
                .subroutines(subroutineNames)
                .sqlBackend(analysisConfig.getCopybookConfig().getSqlBackend())
                .copybookProcessingMode(analysisConfig.getCopybookConfig().getCopybookProcessingMode())
                .features(analysisConfig.getFeatures())
                .build());
    TestData expected = document.getTestData();
    assertResultEquals(actual, expected);
    return actual;
  }

  private static void assertResultEquals(AnalysisResult actual, TestData expected) {
    assertDiagnostics(expected.getDiagnostics(), actual.getDiagnostics());

    assertResult(
        "Copybook definitions:",
        expected.getCopybookDefinitions(),
        actual.getCopybookDefinitions());
    assertResult("Copybook usages:", expected.getCopybookUsages(), actual.getCopybookUsages());

    assertResult(
        "Variable definition:",
        expected.getVariableDefinitions(),
        extractVariableDefinitions(actual));
    assertResult("Variable usages:", expected.getVariableUsages(), extractVariableUsages(actual));

    assertResult(
        "Paragraph definition:",
        expected.getParagraphDefinitions(),
        actual.getParagraphDefinitions());
    assertResult("Paragraph usages:", expected.getParagraphUsages(), actual.getParagraphUsages());

    assertResult(
        "Section definition:", expected.getSectionDefinitions(), actual.getSectionDefinitions());
    assertResult("Section usages:", expected.getSectionUsages(), actual.getSectionUsages());

    assertResult(
        "Subroutine definitions: ",
        expected.getSubroutineDefinitions(),
        extractSubroutineDefinitions(actual));
    assertResult(
        "Subroutine usage:", expected.getSubroutineUsages(), extractSubroutineUsages(actual));
  }

  private Map<String, List<Location>> extractVariableDefinitions(AnalysisResult result) {
    return getVariableStream(result)
        .filter(it -> !it.getLocality().getUri().startsWith(PREF_IMPLICIT))
        .collect(groupingBy(VariableNode::getName))
        .entrySet()
        .stream()
        .collect(
            toMap(
                Entry::getKey,
                entry ->
                    entry.getValue().stream()
                        .map(VariableNode::getDefinitions)
                        .flatMap(List::stream)
                        .distinct()
                        .collect(toList())));
  }

  private Map<String, List<Location>> extractVariableUsages(AnalysisResult result) {
    return getVariableStream(result)
        .filter(variable -> !variable.getUsages().isEmpty())
        .collect(groupingBy(VariableNode::getName))
        .entrySet()
        .stream()
        .collect(
            toMap(
                Entry::getKey,
                entry ->
                    entry.getValue().stream()
                        .map(VariableNode::getUsages)
                        .flatMap(List::stream)
                        .collect(toList())));
  }

  private Stream<VariableNode> getVariableStream(AnalysisResult result) {
    return result
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(PROGRAM))
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getVariables)
        .map(Multimap::values)
        .flatMap(Collection::stream)
        .filter(it -> !FILLER_NAME.equals(it.getName()));
  }

  private Map<String, List<Location>> extractSubroutineDefinitions(AnalysisResult result) {
    return result
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(SUBROUTINE_NAME_NODE))
        .map(SubroutineNameNode.class::cast)
        .filter(it -> !it.getDefinition().getLocation().getUri().startsWith(PREF_IMPLICIT))
        .collect(groupingBy(SubroutineNameNode::getSubroutineName))
        .entrySet()
        .stream()
        .collect(
            toMap(
                Entry::getKey,
                entry ->
                    entry.getValue().stream()
                        .map(SubroutineNameNode::getDefinitions)
                        .flatMap(List::stream)
                        .distinct()
                        .collect(toList())));
  }

  private static Map<String, List<Location>> extractSubroutineUsages(AnalysisResult result) {
    return result
        .getRootNode()
        .getDepthFirstStream()
        .filter(hasType(SUBROUTINE_NAME_NODE))
        .map(SubroutineNameNode.class::cast)
        .filter(it -> !it.getUsages().isEmpty())
        .collect(groupingBy(SubroutineNameNode::getSubroutineName))
        .entrySet()
        .stream()
        .collect(
            toMap(
                Entry::getKey,
                entry ->
                    entry.getValue().stream()
                        .map(SubroutineNameNode::getUsages)
                        .flatMap(List::stream)
                        .distinct()
                        .collect(toList())));
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

  private final Comparator<Position> positionComparator =
      comparing(Position::getLine).thenComparing(Position::getCharacter);

  private final Comparator<Range> rangeComparator =
      comparing(Range::getStart, positionComparator)
          .thenComparing(Range::getEnd, positionComparator);

  private final Comparator<Diagnostic> diagnosticComparator =
      comparing(Diagnostic::getRange, rangeComparator).thenComparing(Diagnostic::getMessage);

  private void assertResult(
      String message, Map<String, List<Location>> expected, Map<String, List<Location>> actual) {
    assertEquals(expected.keySet(), actual.keySet(), message);
    expected.forEach(
        (key, value) ->
            assertEquals(
                value.stream().sorted(getLocationComparator()).collect(toList()),
                actual.get(key).stream().sorted(getLocationComparator()).collect(toList()),
                message));
  }

  private Comparator<Location> getLocationComparator() {
    return comparing(Location::getUri)
        .thenComparingInt(location -> location.getRange().getStart().getLine())
        .thenComparing(location -> location.getRange().getStart().getCharacter());
  }
}
