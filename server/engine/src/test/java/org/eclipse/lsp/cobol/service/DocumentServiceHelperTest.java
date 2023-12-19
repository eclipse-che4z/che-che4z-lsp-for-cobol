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
import org.eclipse.lsp.cobol.common.model.tree.ExitNode;
import org.eclipse.lsp.cobol.common.model.tree.IfNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.RootNode;
import org.eclipse.lsp4j.FoldingRange;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/** Tests {@link DocumentServiceHelper} */
class DocumentServiceHelperTest {
  private static final Locality LOCALITY = Locality.builder().build();
  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";

  @Test
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
