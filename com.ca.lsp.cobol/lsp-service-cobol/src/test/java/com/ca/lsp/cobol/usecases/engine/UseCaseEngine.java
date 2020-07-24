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

package com.ca.lsp.cobol.usecases.engine;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.ca.lsp.cobol.usecases.engine.parser.TestPreprocessorLexer;
import com.ca.lsp.cobol.usecases.engine.parser.TestPreprocessorParser;
import com.ca.lsp.cobol.usecases.engine.parser.TestPreprocessorParser.StartRuleContext;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.function.Function;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.toList;
import static org.antlr.v4.runtime.CharStreams.fromString;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

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
 * <li>~ - Copybook
 * <li>* - Definition
 * <li>| - Diagnostic
 * <li>^ - Replacement
 * <li>{_ _} - Multi-token error
 *
 *     <p>By default, tags treated as an element usage. With '*' specified the occurrence will be
 *     treated as a definition. For example, {$*VAR1} is a definition for VAR1, and {#PAR2} is a
 *     usage of PAR2. Copybook definitions are optional, by default they point to the beginning of
 *     the copybook.
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
   * The same extraction operation applied also for the given copybooks.
   *
   * <p>Expected diagnostics should contain the full of list of syntax and semantic
   * errors/warnings/info messages for the document and copybooks. Existing positions, if they are,
   * for the diagnostics will be dropped and replaced with ones extracted by engine by their IDs.
   *
   * @param text - COBOL text to analyse. It will be cleaned up before analysis to exclude all the
   *     technical tokens and collect syntax and semantic elements.
   * @param copybooks - list of the copybooks used in the document
   * @param expectedDiagnostics - map of IDs and diagnostics that are expected to appear in the
   *     document or copybooks. IDs are the same as in the diagnostic sections inside the text.
   */
  public void runTest(
      String text, List<CobolText> copybooks, Map<String, Diagnostic> expectedDiagnostics) {

    PreprocessedDocument document = prepareDocument(text, copybooks, expectedDiagnostics);
    AnalysisResult actual = analyze(DOCUMENT_URI, document.getText(), document.getCopybooks());
    TestData expected = document.getTestData();

    assertResultEquals(actual, expected);
  }

  private PreprocessedDocument prepareDocument(
      String text, List<CobolText> copybooks, Map<String, Diagnostic> expectedDiagnostics) {

    TestData testData = processDocument(text, expectedDiagnostics);

    return new PreprocessedDocument(
        testData.getText(), processCopybooks(copybooks, expectedDiagnostics, testData), testData);
  }

  private List<CobolText> processCopybooks(
      List<CobolText> copybooks, Map<String, Diagnostic> expectedDiagnostics, TestData testData) {
    return copybooks.stream()
        .map(
            it ->
                processDocument(
                    it.getFullText(),
                    it.getFileName(),
                    toURI(it.getFileName()),
                    expectedDiagnostics))
        .map(collectDataFromCopybooks(testData))
        .map(it -> new CobolText(it.getCopybookName(), it.getText()))
        .collect(toList());
  }

  private TestData processDocument(String text, Map<String, Diagnostic> expectedDiagnostics) {
    return processDocument(text, null, DOCUMENT_URI, expectedDiagnostics);
  }

  private TestData processDocument(
      String text, String documentName, String uri, Map<String, Diagnostic> expectedDiagnostics) {
    int numberOfLines = text.split("\r\n|\r|\n").length;

    TestPreprocessorLexer lexer = new TestPreprocessorLexer(fromString(text));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    TestPreprocessorParser parser = new TestPreprocessorParser(tokens);
    parser.removeErrorListeners();

    StartRuleContext startRule = parser.startRule();

    ParseTreeWalker walker = new ParseTreeWalker();

    TestPreprocessorListenerImpl listener =
        new TestPreprocessorListenerImpl(
            tokens, documentName, uri, numberOfLines, expectedDiagnostics);
    walker.walk(listener, startRule);
    return listener.getProcessingResult();
  }

  private static void assertResultEquals(AnalysisResult actual, TestData expected) {
    assertDiagnostics(expected.getDiagnostics(), actual.getDiagnostics());

    assertResult(
        "Copybook definitions:",
        expected.getCopybookDefinitions(),
        actual.getCopybookDefinitions());
    assertResult("Copybook usages:", expected.getCopybookUsages(), actual.getCopybookUsages());

    assertResult(
        "Variable definition:", expected.getVariableDefinitions(), actual.getVariableDefinitions());
    assertResult("Variable usages:", expected.getVariableUsages(), actual.getVariableUsages());

    assertResult(
        "Paragraph definition:",
        expected.getParagraphDefinitions(),
        actual.getParagraphDefinitions());
    assertResult("Paragraph usage:", expected.getParagraphUsages(), actual.getParagraphUsages());
  }

  private void assertDiagnostics(
      Map<String, List<Diagnostic>> expected, Map<String, List<Diagnostic>> actual) {
    String message = "Diagnostics: " + actual.toString();
    assertEquals(message, expected.size(), actual.size());
    assertEquals(
        message,
        expected.values().stream().flatMap(Collection::stream).filter(Objects::nonNull).count(),
        actual.values().stream().mapToLong(Collection::size).sum());
    expected.forEach(
        (key, value) ->
            actual
                .get(key)
                .forEach(
                    actualDiag ->
                        assertTrue(
                            "Diagnostic not found: " + actualDiag.toString(),
                            value.contains(actualDiag))));
  }

  private void assertResult(
      String message, Map<String, List<Location>> expected, Map<String, List<Location>> actual) {
    assertEquals(message, expected.keySet(), actual.keySet());
    expected.forEach(
        (key, value) ->
            assertEquals(
                message,
                value.stream().sorted(getLocationComparator()).collect(toList()),
                actual.get(key).stream().sorted(getLocationComparator()).collect(toList())));
  }

  private Comparator<Location> getLocationComparator() {
    return comparing(Location::getUri)
        .thenComparingInt(location -> location.getRange().getStart().getLine())
        .thenComparing(location -> location.getRange().getStart().getCharacter());
  }

  private Function<TestData, TestData> collectDataFromCopybooks(TestData accumulator) {
    return copybookTestData -> {
      mergeMaps(accumulator.getCopybookDefinitions(), copybookTestData.getCopybookDefinitions());
      mergeMaps(accumulator.getCopybookUsages(), copybookTestData.getCopybookUsages());
      mergeMaps(accumulator.getParagraphDefinitions(), copybookTestData.getParagraphDefinitions());
      mergeMaps(accumulator.getParagraphUsages(), copybookTestData.getParagraphUsages());
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
            to.get(key).addAll(value);
          } else {
            to.put(key, value);
          }
        });
  }
}
