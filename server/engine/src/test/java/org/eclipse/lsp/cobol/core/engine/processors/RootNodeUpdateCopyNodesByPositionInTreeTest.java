/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.processors;

import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.statements.StatementNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.symbols.VariableAccumulator;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.Collections;
import java.util.Objects;
import java.util.stream.Collectors;

import static org.mockito.Mockito.mock;

/**
 * Tests {@link RootNodeUpdateCopyNodesByPositionInTreeTest}
 */
class RootNodeUpdateCopyNodesByPositionInTreeTest {

  public static final String DOC_URI = "uri";
  public static final String COPYBOOK_NAME = "copybook-A";

  @Test
  void accept() {
    RootNodeUpdateCopyNodesByPositionInTree copyNodesProcessor =
        new RootNodeUpdateCopyNodesByPositionInTree();
    RootNode rootNode = getMockedRootNode();

    Node copyNode =
        new CopyNode(
            Locality.builder()
                .uri(DOC_URI)
                .range(new Range(new Position(2, 3), new Position(2, COPYBOOK_NAME.length() + 3)))
                .build(),
            new Location(
                DOC_URI,
                new Range(new Position(2, 5), new Position(2, COPYBOOK_NAME.length() + 3))),
            COPYBOOK_NAME,
            DOC_URI);
    rootNode.addChild(copyNode);

    VariableAccumulator variableAccumulator = mock(VariableAccumulator.class);
    copyNodesProcessor.accept(
        rootNode,
        new ProcessingContext(
            Collections.emptyList(), variableAccumulator, Collections.emptyMap()));

    Assertions.assertEquals(getStructure(getExpectedRootNode(copyNode)), getStructure(rootNode));
  }

  private static String getStructure(RootNode rootNode) {
    return rootNode
        .getDepthFirstStream()
        .map(Node::getNodeType)
        .map(Objects::toString)
        .collect(Collectors.joining("-->"));
  }

  private RootNode getExpectedRootNode(Node copyNode) {
    RootNode rootNode = new RootNode();
    Node programNode =
        new ProgramNode(
            Locality.builder()
                .uri(DOC_URI)
                .range(new Range(new Position(1, 0), new Position(5, 7)))
                .build(), ProgramSubtype.Program, 0);
    SectionNode sectionNode =
        new SectionNode(
            Locality.builder()
                .uri(DOC_URI)
                .range(new Range(new Position(2, 2), new Position(5, 7)))
                .build(),
            SectionType.PROCEDURE);
    // expect to get the copynode adjusted at right location
    sectionNode.addChild(copyNode);
    sectionNode.addChild(
        new StatementNode(
            Locality.builder()
                .uri(DOC_URI)
                .range(new Range(new Position(3, 2), new Position(4, 7)))
                .build()));
    programNode.addChild(sectionNode);
    rootNode.addChild(programNode);
    return rootNode;
  }

  private RootNode getMockedRootNode() {
    RootNode rootNode = new RootNode();
    Node programNode =
        new ProgramNode(
            Locality.builder()
                .uri(DOC_URI)
                .range(new Range(new Position(1, 0), new Position(5, 7)))
                .build(), ProgramSubtype.Program, 0);
    SectionNode sectionNode =
        new SectionNode(
            Locality.builder()
                .uri(DOC_URI)
                .range(new Range(new Position(2, 2), new Position(5, 7)))
                .build(),
            SectionType.PROCEDURE);
    sectionNode.addChild(
        new StatementNode(
            Locality.builder()
                .uri(DOC_URI)
                .range(new Range(new Position(3, 2), new Position(4, 7)))
                .build()));
    programNode.addChild(sectionNode);
    rootNode.addChild(programNode);
    return rootNode;
  }
}
