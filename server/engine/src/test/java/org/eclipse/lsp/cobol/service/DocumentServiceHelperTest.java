/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Set;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.*;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.implicitDialects.cics.nodes.ExecCicsReturnNode;
import org.eclipse.lsp4j.FoldingRange;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/** Tests {@link DocumentServiceHelper} */
class DocumentServiceHelperTest {
  private static final Locality LOCALITY = Locality.builder().build();
  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";

  @Test
  @Disabled("No longer valid")
  void getFoldingRange_whenRootNodelIsNull() {
    Set<FoldingRange> foldingRange = DocumentServiceHelper.getFoldingRange(null, DOCUMENT_URI);
    assertEquals(0, foldingRange.size());
  }

  @Test
  void getFoldingRange_whenRootNodeIsPresent() {
    Set<FoldingRange> foldingRange =
        DocumentServiceHelper.getFoldingRange(getRootNode(), DOCUMENT_URI);
    assertEquals(1, foldingRange.size());
  }

  @Test
  void getFoldingRange_whenRootNodeIsPresent2() {
    Node rootNode = getRootNode();
    rootNode.addChild(
        new ExitNode(
            Locality.builder()
                .range(new Range(new Position(3, 7), new Position(9, 7)))
                .uri(DOCUMENT_URI)
                .build()));
    Set<FoldingRange> foldingRange = DocumentServiceHelper.getFoldingRange(rootNode, DOCUMENT_URI);
    assertEquals(1, foldingRange.size());
  }

  @Test
  void getFoldingRange_whenNoConditionalNodePresent() {
    Node rootNode = new RootNode(LOCALITY);
    rootNode.addChild(
        new ExitNode(
            Locality.builder().range(new Range(new Position(1, 0), new Position(3, 0))).build()));
    Set<FoldingRange> foldingRange = DocumentServiceHelper.getFoldingRange(rootNode, DOCUMENT_URI);
    assertEquals(0, foldingRange.size());
  }

  @Test
  void getFoldingRange_whenEvaluateStatementIsPresent() {
    RootNode rootNode = new RootNode(LOCALITY);
    EvaluateNode evaluateNode = new EvaluateNode(Locality.builder()
            .range(new Range(new Position(0, 0), new Position(10, 10)))
            .uri(DOCUMENT_URI).build());
    EvaluateWhenNode evaluateWhenNode = new EvaluateWhenNode(Locality.builder()
            .range(new Range(new Position(2, 0), new Position(4, 10)))
            .uri(DOCUMENT_URI).build());
    EvaluateWhenNode evaluateWhenNode2 = new EvaluateWhenNode(Locality.builder()
            .range(new Range(new Position(5, 0), new Position(6, 10)))
            .uri(DOCUMENT_URI).build());
    IfNode ifNode = new IfNode(Locality.builder()
            .range(new Range(new Position(3, 0), new Position(4, 10)))
            .uri(DOCUMENT_URI).build());
    ifNode.addChild(new QualifiedReferenceNode(Locality.builder()
            .range(new Range(new Position(3, 0), new Position(4, 10)))
            .uri(DOCUMENT_URI).build()));
    CopyNode copyNode = new CopyNode(
            Locality.builder()
                    .range(new Range(new Position(5, 0), new Position(5, 10)))
                    .uri(DOCUMENT_URI)
                    .build(),
            new Location(),
            "",
            "");
    PerformNode performNode = new PerformNode(Locality.builder()
            .range(new Range(new Position(0, 0), new Position(12, 10)))
            .uri("file:///c:/workspace/copy.cpy")
            .build());
    copyNode.addChild(performNode);
    ifNode.addChild(performNode);
    ifNode.addChild(copyNode);
    evaluateWhenNode.addChild(ifNode);
    evaluateNode.addChild(evaluateWhenNode);
    evaluateNode.addChild(evaluateWhenNode2);
    rootNode.addChild(evaluateNode);
    Set<FoldingRange> foldingRange = DocumentServiceHelper.getFoldingRange(rootNode, DOCUMENT_URI);
    assertEquals(4, foldingRange.size());
    assertTrue(foldingRange.contains(new FoldingRange(5, 9))); // evaluateWhenNode2
    assertTrue(foldingRange.contains(new FoldingRange(0, 10))); // evaluateNode
    assertTrue(foldingRange.contains(new FoldingRange(3, 5))); // if node
    assertTrue(foldingRange.contains(new FoldingRange(2, 4))); // evaluateWhenNode
  }

  @Test
  void getFoldingRange_whenEvaluateStatementHasADialectNode() {
    RootNode rootNode = new RootNode(LOCALITY);
    EvaluateNode evaluateNode = new EvaluateNode(Locality.builder()
            .range(new Range(new Position(0, 0), new Position(10, 10)))
            .uri(DOCUMENT_URI).build());
    EvaluateWhenNode evaluateWhenNode = new EvaluateWhenNode(Locality.builder()
            .range(new Range(new Position(2, 0), new Position(2, 10)))
            .uri(DOCUMENT_URI).build());
    EvaluateWhenNode evaluateWhenNode2 = new EvaluateWhenNode(Locality.builder()
            .range(new Range(new Position(5, 0), new Position(5, 10)))
            .uri(DOCUMENT_URI).build());
    EvaluateWhenOtherNode evaluateWhenOtherNode = new EvaluateWhenOtherNode(Locality.builder()
            .range(new Range(new Position(7, 0), new Position(7, 10)))
            .uri(DOCUMENT_URI).build());
    IfNode ifNode = new IfNode(Locality.builder()
            .range(new Range(new Position(3, 0), new Position(4, 10)))
            .uri(DOCUMENT_URI).build());
    ifNode.addChild(new QualifiedReferenceNode(Locality.builder()
            .range(new Range(new Position(3, 0), new Position(4, 10)))
            .uri(DOCUMENT_URI).build()));
    ExecCicsReturnNode execCicsNode = new ExecCicsReturnNode(Locality.builder()
            .range(new Range(new Position(6, 0), new Position(6, 10)))
            .uri(DOCUMENT_URI).build());
    evaluateWhenNode.addChild(ifNode);
    evaluateNode.addChild(evaluateWhenNode);
    evaluateNode.addChild(evaluateWhenNode2);
    evaluateNode.addChild(evaluateWhenOtherNode);
    evaluateNode.addChild(execCicsNode);
    rootNode.addChild(evaluateNode);
    Set<FoldingRange> foldingRange = DocumentServiceHelper.getFoldingRange(rootNode, DOCUMENT_URI);
    assertEquals(5, foldingRange.size());
    assertTrue(foldingRange.contains(new FoldingRange(3, 4))); // if node -> 3,4
    assertTrue(foldingRange.contains(new FoldingRange(0, 10))); // evaluate -> 0, 10
    assertTrue(foldingRange.contains(new FoldingRange(2, 4))); // 1st when node -> 2, 4
    assertTrue(foldingRange.contains(new FoldingRange(5, 6))); // 2nd when node -> 5, 6
    assertTrue(foldingRange.contains(new FoldingRange(7, 9))); // when other -> 7, 9
  }

  private static Node getRootNode() {
    Node rootNode = new RootNode(LOCALITY);
    Node ifNode =
        new IfNode(
            Locality.builder()
                .range(new Range(new Position(1, 0), new Position(3, 0)))
                .uri(DOCUMENT_URI)
                .build());
    rootNode.addChild(ifNode);
    return rootNode;
  }
}
