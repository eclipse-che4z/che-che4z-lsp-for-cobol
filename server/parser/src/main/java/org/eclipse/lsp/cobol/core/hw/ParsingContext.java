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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.core.hw;

import lombok.Getter;
import org.eclipse.lsp.cobol.core.cst.base.CstNode;

import java.util.LinkedList;

/**
 * Parsing context
 */
public class ParsingContext {
  @Getter
  private final CobolLexer lexer;
  private final LinkedList<CstNode> nodeStack = new LinkedList<>();

  public ParsingContext(CobolLexer lexer) {
    this.lexer = lexer;
  }

  /**
   * Put on stack current node
   * @param node a node to stack
   */
  public void push(CstNode node) {
    nodeStack.push(node);
  }

  /**
   * Remove a node from the tome of the stack
   * @return the node
   */
  public CstNode pop() {
    return nodeStack.pop();
  }

  /**
   * Remove a node from the tome of the stack and make it a child of the new stack top
   * @return the node
   */
  public CstNode popAndAttach() {
    CstNode node = pop();
    peek().getChildren().add(node);
    return node;
  }

  /**
   * Take a look at the top of the stack
   * @return the nedo on the top
   */
  public CstNode peek() {
    return nodeStack.peek();
  }
}
