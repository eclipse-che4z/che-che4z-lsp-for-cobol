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
package org.eclipse.lsp.cobol.positive;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.tree.CodeBlockReference;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.model.tree.ProgramNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNode;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Location;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullSource;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.ENABLED;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name logged.
 */
@Slf4j
class PositiveTest extends FileBasedTest {
  @ParameterizedTest
  @MethodSource("org.eclipse.lsp.cobol.positive.FileBasedTest#getTextsToTest")
  @DisplayName("Parameterized - positive tests")
  @NullSource
  void test(CobolText text) {
    if (text == null) {
      return;
    }
    String fileName = text.getFileName();
    Map<ReportSection, List<SysprintSnap>> dataNameRefs = getDataNameRefs(fileName);
    LOG.debug("Processing: " + fileName);
    AnalysisConfig analysisConfig = AnalysisConfig.defaultConfig(ENABLED);
    UseCase useCase =
        UseCase.builder()
            .fileName(fileName)
            .text(text.getFullText())
            .copybooks(getCopybooks())
            .sqlBackend(analysisConfig.getCopybookConfig().getSqlBackend())
            .copybookProcessingMode(analysisConfig.getCopybookConfig().getCopybookProcessingMode())
            .features(analysisConfig.getFeatures())
            .dialects(analysisConfig.getDialects())
            .predefinedParagraphs(analysisConfig.getCopybookConfig().getPredefinedParagraphs())
            .build();
    AnalysisResult analyze = UseCaseUtils.analyze(useCase);
    assetDefinitionsNReferencesFromSnap(dataNameRefs, analyze.getRootNode());
    assertNoError(fileName, analyze);
  }

    private void assertNoError(String fileName, AnalysisResult analyze) {
        List<Diagnostic> diagnostic = ofNullable(analyze.getDiagnostics().get(fileName))
                .map(
                        diagnostics ->
                                diagnostics.stream()
                                        .filter(it -> it.getSeverity() == DiagnosticSeverity.Error)
                                        .collect(toList()))
                .orElse(emptyList());
        assertNoSyntaxErrorsFound(diagnostic, fileName);
    }

    private void assetDefinitionsNReferencesFromSnap(Map<ReportSection, List<SysprintSnap>> dataNameRefs, Node rootNode) {
    Multimap<String, Node> variableDefinitionFromLSPEngine = ArrayListMultimap.create();
    Multimap<String, CodeBlockReference> paragraphDefFromLSPEngine = ArrayListMultimap.create();
    Multimap<String, Node> programDefinitionFromLSPEngine = ArrayListMultimap.create();

    fetchReferencesFromLSPEngine(rootNode, variableDefinitionFromLSPEngine, paragraphDefFromLSPEngine, programDefinitionFromLSPEngine);
    assertDataName(dataNameRefs.getOrDefault(ReportSection.DATA_NAMES, Collections.emptyList()), variableDefinitionFromLSPEngine);
    assertProcedures(dataNameRefs.getOrDefault(ReportSection.PROCEDURES, Collections.emptyList()), paragraphDefFromLSPEngine);
    assertPrograms(dataNameRefs.getOrDefault(ReportSection.PROGRAMS, emptyList()), programDefinitionFromLSPEngine);
  }

    private void assertPrograms(List<SysprintSnap> allProgRef, Multimap<String, Node> programDefinitionFromLSPEngine) {
        allProgRef.forEach(prog -> {
            String dataName = prog.getDataName();
            Optional<Node> progNode = programDefinitionFromLSPEngine.get(dataName).stream().findFirst();
            Assertions.assertTrue(progNode.isPresent(), "Program definition not found for " + dataName);
            //TODO: Do not match line number as program Node always starts from 0 for LSP
            // Assertions.assertEquals(prog.getDefinedLineNo(), progNode.get().getLocality().getRange().getStart().getLine() + 1);
        });
    }

    private void assertProcedures(
      List<SysprintSnap> sysprintSnaps,
      Multimap<String, CodeBlockReference> paragraphDefFromLSPEngine) {
    sysprintSnaps.forEach(
        snap -> {
          String dataName = snap.getDataName();
          int definedLineNo = snap.getDefinedLineNo();
          List<Integer> references = snap.getReferences();
          Optional<Map.Entry<List<Location>, List<Location>>> foundElementFromLSPEngine =
              paragraphDefFromLSPEngine.get(dataName).stream()
                  .map(node -> Collections.singletonMap(node.getDefinitions(), node.getUsage()))
                  .map(Map::entrySet)
                  .flatMap(Collection::stream)
                  .filter(
                      ref ->
                          ref.getKey().stream()
                              .anyMatch(
                                  node ->
                                      node.getRange().getStart().getLine() + 1 == definedLineNo))
                  .findFirst();
          Assertions.assertTrue(foundElementFromLSPEngine.isPresent(), "Procedure definition for " + dataName + " not found in LSP engine");
          List<Location> nodes = foundElementFromLSPEngine.get().getValue();
          assertReferencesByProcedures(dataName, references, nodes);
        });
  }

  private void assertReferencesByProcedures(
      String dataName, List<Integer> snapReferences, List<Location> lspNodes) {
    List<Integer> referencesFromLSPEngine =
        lspNodes.stream()
            .map(loc -> loc.getRange().getStart().getLine() + 1)
            .collect(Collectors.toList());
    snapReferences.forEach(ref -> Assertions.assertTrue(referencesFromLSPEngine.contains(ref), "Procedure snapReferences for " + dataName + " not found at line no: " + ref));
  }

  private void assertDataName(
      List<SysprintSnap> dataNameRefs, Multimap<String, Node> variableDefinitionFromLSPEngine) {
    dataNameRefs.forEach(
        snap -> {
          String dataName = snap.getDataName();
          int definedLineNo = snap.getDefinedLineNo();
          List<Integer> references = snap.getReferences();
          Collection<Node> nodes = variableDefinitionFromLSPEngine.get(dataName);
          assertReferencesByDataName(dataName, definedLineNo, references, nodes);
        });
  }

  private void assertReferencesByDataName(
      String dataName, int definedLineNo, List<Integer> references, Collection<Node> nodes) {
    Optional<VariableNode> foundVariableNodeInLSP =
        nodes.stream()
            .filter(
                node ->
                    node.getLocality().toLocation().getRange().getStart().getLine() + 1
                        == definedLineNo)
            .findFirst()
            .filter(VariableNode.class::isInstance)
            .map(VariableNode.class::cast);
    Assertions.assertTrue(
        foundVariableNodeInLSP.isPresent(),
        "Data name definition for " + dataName + " not found in LSP engine");
    foundVariableNodeInLSP.ifPresent(
        node -> {
          List<Object> usagesFromEngine =
              node.getUsages().stream()
                  .map(usage -> usage.getRange().getStart().getLine() + 1)
                  .collect(Collectors.toList());

          List<Integer> unmatchedReferences =
              references.stream()
                  .filter(lineNo -> !usagesFromEngine.contains(lineNo))
                  .collect(Collectors.toList());

          Assertions.assertEquals(
              0,
              unmatchedReferences.size(),
              "References are not found for "
                  + dataName
                  + ", at: "
                  + unmatchedReferences.stream()
                      .map(Object::toString)
                      .collect(Collectors.joining(" ,")));
        });
  }

  private void fetchReferencesFromLSPEngine(
      Node rootNode,
      Multimap<String, Node> variableDefinitionFromLSPEngine,
      Multimap<String, CodeBlockReference> paragraphDefFromLSPEngine,
      Multimap<String, Node> programDefinitionFromLSPEngine) {
    rootNode
        .getDepthFirstStream()
        .filter(node -> node.getNodeType() == NodeType.PROGRAM)
        .map(ProgramNode.class::cast)
        .forEach(
            programNode -> {
              Stream.of(programNode.getParagraphMap(), programNode.getSectionMap())
                  .flatMap(entry -> entry.entrySet().stream())
                  .forEach(
                      entry -> paragraphDefFromLSPEngine.put(entry.getKey(), entry.getValue()));

              programNode.getVariables().values().stream()
                  .flatMap(Node::getDepthFirstStream)
                  .filter(VariableNode.class::isInstance)
                  .map(VariableNode.class::cast)
                  .forEach(
                      entry -> variableDefinitionFromLSPEngine.put(entry.getName(), entry));
              programDefinitionFromLSPEngine.put(programNode.getProgramName().toUpperCase(Locale.ROOT), programNode);
            });
  }
}
