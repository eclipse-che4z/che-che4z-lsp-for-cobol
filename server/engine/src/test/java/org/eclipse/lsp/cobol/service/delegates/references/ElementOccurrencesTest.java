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
package org.eclipse.lsp.cobol.service.delegates.references;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import java.util.List;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNameNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.model.tree.variables.MnemonicNameNode;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

/** Test {@link ElementOccurrences} */
class ElementOccurrencesTest {
  private static final String URI = "uri";
  private static final String URI2 = "uri2";
  private static final String ELEMENT_NAME = "foo";
  private UriDecodeService uriDecodeService = new UriDecodeService();

  static Stream<Arguments> variousData() {
    Location definition = new Location(URI, new Range(new Position(1, 2), new Position(2, 5)));
    Location usage = new Location(URI, new Range(new Position(3, 0), new Position(3, 5)));

    Location usageInOtherFile =
        new Location(URI2, new Range(new Position(3, 0), new Position(3, 5)));
    Position insideDefinition = new Position(1, 5);
    Position insideUsage = new Position(3, 1);
    Locality rootLocality =
        Locality.builder()
            .uri(URI)
            .range(new Range(new Position(1, 1), new Position(5, 1)))
            .build();
    CopybooksRepository copyBook = new CopybooksRepository();
    copyBook.addUsage(
        ELEMENT_NAME, null, new Location(URI, new Range(new Position(3, 0), new Position(3, 5))));
    copyBook.define(ELEMENT_NAME, null, URI, "copybookUri");
    VariableNode variableNodeInOneFile =
        createDefinitionNode(ELEMENT_NAME, definition.getUri(), definition.getRange());
    VariableUsageNode variableUsageNodeInOneFile =
        createUsageNode(variableNodeInOneFile, usage.getUri(), usage.getRange());
    RootNode rootNodeForOneFile = new RootNode(rootLocality);
    rootNodeForOneFile.addChild(variableNodeInOneFile);
    rootNodeForOneFile.addChild(variableUsageNodeInOneFile);
    VariableNode variableNodeInTwoFiles =
        createDefinitionNode(ELEMENT_NAME, definition.getUri(), definition.getRange());
    VariableUsageNode variableUsageNodeInTwoFiles =
        createUsageNode(
            variableNodeInTwoFiles, usageInOtherFile.getUri(), usageInOtherFile.getRange());
    RootNode rootNodeForTwoFiles = new RootNode(rootLocality);
    rootNodeForTwoFiles.addChild(variableNodeInTwoFiles);
    rootNodeForTwoFiles.addChild(variableUsageNodeInTwoFiles);
    VariableNode variableNodeWithTwoUsages =
        createDefinitionNode(ELEMENT_NAME, definition.getUri(), definition.getRange());
    VariableUsageNode variableUsageNode1 =
        createUsageNode(variableNodeWithTwoUsages, usage.getUri(), usage.getRange());
    VariableUsageNode variableUsageNode2 =
        createUsageNode(
            variableNodeWithTwoUsages, usageInOtherFile.getUri(), usageInOtherFile.getRange());
    RootNode rootNodeWithTwoUsages = new RootNode(rootLocality);
    rootNodeWithTwoUsages.addChild(variableNodeWithTwoUsages);
    rootNodeWithTwoUsages.addChild(variableUsageNode1);
    rootNodeWithTwoUsages.addChild(variableUsageNode2);
    return Stream.of(
        // find variables usage by usage position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideUsage,
            ImmutableList.of(usage)),
        // find variables usage by definition position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideDefinition,
            ImmutableList.of(usage)),
        // same position from other URI
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForTwoFiles).build(),
            insideUsage,
            ImmutableList.of()),
        // find paragraph usage by usage position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideUsage,
            ImmutableList.of(usage)),
        // find paragraph usage by definition position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideDefinition,
            ImmutableList.of(usage)),
        // find section usage by usage position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideUsage,
            ImmutableList.of(usage)),
        // find section usage by definition position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideDefinition,
            ImmutableList.of(usage)),
        // find copybook usage by usage position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideUsage,
            ImmutableList.of(usage)),
        // find copybook usage by definition position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideDefinition,
            ImmutableList.of(usage)),
        // find subroutine usage by usage position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideUsage,
            ImmutableList.of(usage)),
        // find subroutine usage by definition position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideDefinition,
            ImmutableList.of(usage)),
        // find all variables usages in all files by usage position
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeWithTwoUsages).build(),
            insideUsage,
            ImmutableList.of(usage, usageInOtherFile)),
        // give only needed usage even if other kind use the same name
        Arguments.of(
            AnalysisResult.builder().rootNode(rootNodeForOneFile).build(),
            insideUsage,
            ImmutableList.of(usage)));
  }

  @Test
  void simpleCaseOfDefinitionsAndUsages() {
    VariableNode definitionNode =
        createDefinitionNode(ELEMENT_NAME, URI, new Range(new Position(1, 2), new Position(2, 5)));
    Location definition = definitionNode.getLocality().toLocation();
    CopybooksRepository copyBook = new CopybooksRepository();
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    VariableUsageNode usageNode =
        createUsageNode(definitionNode, URI, new Range(new Position(3, 0), new Position(3, 5)));
    Location usage = usageNode.getLocality().toLocation();
    Position insideUsage = new Position(3, 1);
    RootNode rootNode =
        new RootNode(
            Locality.builder()
                .uri(URI)
                .range(new Range(new Position(1, 1), new Position(5, 1)))
                .build());
    rootNode.addChild(definitionNode);
    rootNode.addChild(usageNode);
    AnalysisResult analysisResult = AnalysisResult.builder().rootNode(rootNode).build();
    CobolDocumentModel cobolDocumentModel = new CobolDocumentModel(URI, "", analysisResult);
    TextDocumentPositionParams textDocumentPositionParams =
        new TextDocumentPositionParams(new TextDocumentIdentifier(URI), insideUsage);
    ElementOccurrences elementOccurrences = new ElementOccurrences(documentGraph, uriDecodeService);
    assertEquals(
        ImmutableList.of(definition),
        elementOccurrences.findDefinitions(cobolDocumentModel, textDocumentPositionParams));
    assertEquals(
        ImmutableList.of(usage),
        elementOccurrences.findReferences(
            cobolDocumentModel, textDocumentPositionParams, new ReferenceContext(false)));
    assertEquals(
        ImmutableList.of(usage, definition),
        elementOccurrences.findReferences(
            cobolDocumentModel, textDocumentPositionParams, new ReferenceContext(true)));
  }

  @Test
  void findHighlights() {
    CopybooksRepository copybook = new CopybooksRepository();
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    Range definitionRange = new Range(new Position(1, 2), new Position(2, 5));
    VariableNode definitionNode = createDefinitionNode(ELEMENT_NAME, URI, definitionRange);
    Range usageRange = new Range(new Position(3, 0), new Position(3, 5));
    VariableUsageNode variableUsageNode = createUsageNode(definitionNode, URI, usageRange);
    VariableUsageNode variableUsageNodeInOtherFile =
        createUsageNode(definitionNode, URI2, new Range(new Position(3, 0), new Position(3, 5)));
    Position insideUsage = new Position(3, 1);
    RootNode rootNode =
        new RootNode(
            Locality.builder()
                .uri(URI)
                .range(new Range(new Position(1, 1), new Position(5, 1)))
                .build());
    rootNode.addChild(definitionNode);
    rootNode.addChild(variableUsageNode);
    rootNode.addChild(variableUsageNodeInOtherFile);
    AnalysisResult analysisResult = AnalysisResult.builder().rootNode(rootNode).build();
    List<DocumentHighlight> highlights =
        new ElementOccurrences(documentGraph, uriDecodeService)
            .findHighlights(
                analysisResult,
                new TextDocumentPositionParams(new TextDocumentIdentifier(URI), insideUsage));
    List<DocumentHighlight> expectedHighlights =
        ImmutableList.of(
            new DocumentHighlight(usageRange, DocumentHighlightKind.Text),
            new DocumentHighlight(definitionRange, DocumentHighlightKind.Text));
    assertEquals(expectedHighlights, highlights);
  }

  @ParameterizedTest
  @MethodSource("variousData")
  void variousCases(
      AnalysisResult analysisResult, Position position, List<Location> expectedLocations) {
    SourceUnitGraph documentGraph = mock(SourceUnitGraph.class);
    when(documentGraph.isCopybook(anyString())).thenReturn(false);
    List<Location> actualLocations =
        new ElementOccurrences(documentGraph, uriDecodeService)
            .findReferences(
                new CobolDocumentModel(URI, "", analysisResult),
                new TextDocumentPositionParams(new TextDocumentIdentifier(URI), position),
                new ReferenceContext(false));
    assertEquals(expectedLocations, actualLocations);
  }

  private static VariableNode createDefinitionNode(String name, String uri, Range range) {
    VariableNode definitionNode =
        new MnemonicNameNode(Locality.builder().uri(uri).range(range).build(), "systemName", name);
    VariableDefinitionNameNode varNameNode =
        new VariableDefinitionNameNode(definitionNode.getLocality(), name);
    definitionNode.addChild(varNameNode);
    return definitionNode;
  }

  private static VariableUsageNode createUsageNode(
      VariableNode variableNode, String uri, Range range) {
    VariableUsageNode usageNode =
        new VariableUsageNode(
            variableNode.getName(), Locality.builder().uri(uri).range(range).build());
    variableNode.addUsage(usageNode);
    return usageNode;
  }
}
