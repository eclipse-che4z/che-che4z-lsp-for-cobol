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
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTreeWalker;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.model.variables.Variable;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.CopybookServiceImpl;
import org.eclipse.lsp.cobol.service.SQLBackend;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.utils.WorkspaceFileService;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.eclipse.usecase.UseCasePreprocessorLexer;
import org.eclipse.usecase.UseCasePreprocessorParser;
import org.eclipse.usecase.UseCasePreprocessorParser.StartRuleContext;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.stream.Stream;

import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.*;
import static org.antlr.v4.runtime.CharStreams.fromString;
import static org.eclipse.lsp.cobol.core.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROGRAM;
import static org.eclipse.lsp.cobol.core.semantics.outline.OutlineNodeNames.FILLER_NAME;
import static org.eclipse.lsp.cobol.service.CopybookServiceImpl.PREF_IMPLICIT;
import static org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
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
@Slf4j
@UtilityClass
public class UseCaseEngine {

  private static final String SQLCA = "SQLCA";
  private static final String SQLCA_DATACOM_PATH = "/implicitCopybooks/SQLCA_DATACOM.cpy";
  private static final String SQLCA_DB2_PATH = "/implicitCopybooks/SQLCA_DB2.cpy";
  private static final String SQLDA_DB2_PATH = "/implicitCopybooks/SQLDA.cpy";

  /**
   * Checks if language engine applies required syntax and semantic checks correctly once code
   * contains implicitly (If not content is explicitly provided for SQLCA and SQLDA) defined
   * copybooks.
   *
   * @param text COBOL text to analyse
   * @param expectedDiagnostics the map of id to the Diagnostic that should present in the analysis
   *     result
   * @param implicitCopybookNames the names of the implicit copybooks used in this test
   * @param sqlBackend the options to be used for SQL copybooks processing
   */
  public void runTest(
      String text,
      Map<String, Diagnostic> expectedDiagnostics,
      List<String> implicitCopybookNames,
      SQLBackend sqlBackend) {
    List<CobolText> copybooks = new ArrayList<>();
    implicitCopybookNames.forEach(
        i -> {
          String uri = getUriForImplicitCopybook(i, sqlBackend);
          copybooks.add(new CobolText(i, readContentForImplicitCopybook(uri)));
        });

    runTest(
        text, copybooks, expectedDiagnostics, ImmutableList.of(), CopybookProcessingMode.ENABLED);
  }

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
   */
  public void runTest(
      String text, List<CobolText> copybooks, Map<String, Diagnostic> expectedDiagnostics) {
    runTest(
        text, copybooks, expectedDiagnostics, ImmutableList.of(), CopybookProcessingMode.ENABLED);
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
   */
  public void runTest(
      String text,
      List<CobolText> copybooks,
      Map<String, Diagnostic> expectedDiagnostics,
      List<String> subroutineNames) {
    runTest(text, copybooks, expectedDiagnostics, subroutineNames, CopybookProcessingMode.ENABLED);
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
   * @param processingMode - copybook processing mode
   * @return analysis result object
   */
  public AnalysisResult runTest(
      String text,
      List<CobolText> copybooks,
      Map<String, Diagnostic> expectedDiagnostics,
      List<String> subroutineNames,
      CopybookProcessingMode processingMode) {

    PreprocessedDocument document = prepareDocument(text, copybooks, expectedDiagnostics);
    AnalysisResult actual =
        analyze(
            DOCUMENT_URI,
            document.getText(),
            document.getCopybooks(),
            subroutineNames,
            new CopybookConfig(processingMode, SQLBackend.DB2_SERVER));
    TestData expected =
        document.getTestData().toBuilder()
            .subroutineDefinitions(makeSubroutinesDefinitions(subroutineNames))
            .build();
    assertResultEquals(actual, expected);
    return actual;
  }

  private String getUriForImplicitCopybook(String copybookName, SQLBackend sqlBackend) {
    if (SQLCA.equals(copybookName)) {
      if (SQLBackend.DATACOM_SERVER.equals(sqlBackend)) {
        return SQLCA_DATACOM_PATH;
      }
      return SQLCA_DB2_PATH;
    }
    return SQLDA_DB2_PATH;
  }

  private String readContentForImplicitCopybook(String resourcePath) {
    InputStream inputStream = CopybookServiceImpl.class.getResourceAsStream(resourcePath);
    String content = null;
    try {
      content =
          new WorkspaceFileService()
              .readFromInputStream(Objects.requireNonNull(inputStream), StandardCharsets.UTF_8);
    } catch (IOException e) {
      LOG.error("Implicit copybook is not loaded. ", e);
    }
    return content;
  }

  private Map<String, List<Location>> makeSubroutinesDefinitions(List<String> subroutineNames) {
    Range fileStart = new Range(new Position(0, 0), new Position(0, 0));
    return subroutineNames.stream()
        .collect(
            toMap(
                Function.identity(),
                name -> ImmutableList.of(new Location("URI:" + name, fileStart))));
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

    UseCasePreprocessorLexer lexer = new UseCasePreprocessorLexer(fromString(text));
    lexer.removeErrorListeners();

    CommonTokenStream tokens = new CommonTokenStream(lexer);
    UseCasePreprocessorParser parser = new UseCasePreprocessorParser(tokens);
    parser.removeErrorListeners();

    StartRuleContext startRule = parser.startRule();

    ParseTreeWalker walker = new ParseTreeWalker();

    UseCasePreprocessorListener listener =
        new UseCasePreprocessorListener(
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
        "Variable definition:", expected.getVariableDefinitions(), extractVariableDefinitions(actual));
    assertResult("Variable usages:", expected.getVariableUsages(), extractVariableUsages(actual));

    assertResult(
        "Constant definition:", expected.getConstantDefinitions(), actual.getConstantDefinitions());
    assertResult("Constant usages:", expected.getConstantUsages(), actual.getConstantUsages());

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
        actual.getSubroutineDefinitions());
    assertResult("Subroutine usage:", expected.getSubroutineUsages(), actual.getSubroutineUsages());
  }

  private Map<String, List<Location>> extractVariableDefinitions(AnalysisResult result) {
    return getVariableStream(result)
        .filter(it -> !it.getDefinition().getUri().startsWith(PREF_IMPLICIT))
        .collect(groupingBy(Variable::getName))
        .entrySet()
        .stream()
        .collect(toMap(Entry::getKey,
            entry -> entry.getValue().stream()
                .map(Variable::getDefinition)
                .map(Locality::toLocation)
                .distinct()
                .collect(toList())));
  }

  private Map<String, List<Location>> extractVariableUsages(AnalysisResult result) {
    return getVariableStream(result)
        .filter(variable -> !variable.getUsages().isEmpty())
        .collect(groupingBy(Variable::getName))
        .entrySet()
        .stream()
        .collect(toMap(Entry::getKey,
            entry -> entry.getValue().stream()
                .map(Variable::getUsages)
                .flatMap(List::stream)
                .map(Locality::toLocation)
                .collect(toList())));
  }

  private Stream<Variable> getVariableStream(AnalysisResult result) {
    return result.getRootNode()
        .getDepthFirstStream()
        .filter(hasType(PROGRAM))
        .map(ProgramNode.class::cast)
        .map(ProgramNode::getDefinedVariables)
        .flatMap(Collection::stream)
        .filter(it -> !FILLER_NAME.equals(it.getName()));
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

  private Function<TestData, TestData> collectDataFromCopybooks(TestData accumulator) {
    return copybookTestData -> {
      mergeMaps(accumulator.getCopybookDefinitions(), copybookTestData.getCopybookDefinitions());
      mergeMaps(accumulator.getCopybookUsages(), copybookTestData.getCopybookUsages());
      mergeMaps(accumulator.getParagraphDefinitions(), copybookTestData.getParagraphDefinitions());
      mergeMaps(accumulator.getParagraphUsages(), copybookTestData.getParagraphUsages());
      mergeMaps(accumulator.getSectionDefinitions(), copybookTestData.getSectionDefinitions());
      mergeMaps(accumulator.getSectionUsages(), copybookTestData.getSectionUsages());
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
