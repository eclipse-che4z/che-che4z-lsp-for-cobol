/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.model.tree;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import lombok.EqualsAndHashCode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.junit.jupiter.api.Test;

/** Test for {@link Node traverse methods} */
class NodeTraverseTest {
  private static final Node ROOT = new TestNode("root");
  private static final Node NODE_1 = new TestNode("node1");
  private static final Node NODE_2 = new TestNode("node2");
  private static final Node NODE_11 = new TestNode("node11");
  private static final Node NODE_21 = new TestNode("node21");
  private static final Node NODE_22 = new TestNode("node22");
  private static final Node NODE_111 = new TestNode("node111");
  private static final Node NODE_112 = new TestNode("node112");
  private static final Node NODE_113 = new TestNode("node113");

  static {
    ROOT.addChild(NODE_1);
    ROOT.addChild(NODE_2);
    NODE_1.addChild(NODE_11);
    NODE_2.addChild(NODE_21);
    NODE_2.addChild(NODE_22);
    NODE_11.addChild(NODE_111);
    NODE_11.addChild(NODE_112);
    NODE_11.addChild(NODE_113);
  }

  @Test
  void testGetDepthFirstList() {
    List<Node> result = ROOT.getDepthFirstList((_n) -> true);
    assertArrayEquals(
        new Node[] {ROOT, NODE_1, NODE_11, NODE_111, NODE_112, NODE_113, NODE_2, NODE_21, NODE_22},
        result.toArray(),
        result.toString());
  }

  @Test
  void testFindFirstNodeInSubtree() {
    Node result =
        ROOT.findFirstNodeInSubtree(
            (n) -> n.toString().length() == 7 && n.toString().startsWith("node11"));
    assertEquals(NODE_111, result);
  }
}

/** */
@EqualsAndHashCode(callSuper = false)
class TestNode extends Node {
  private String name;

  protected TestNode(String name) {
    super(null, null, null);
    this.name = name;
  }

  @Override
  public String toString() {
    return name;
  }
}
