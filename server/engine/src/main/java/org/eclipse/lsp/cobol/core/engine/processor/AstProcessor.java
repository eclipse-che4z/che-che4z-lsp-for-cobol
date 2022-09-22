/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.processor;

import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;

import java.util.ArrayList;
import java.util.List;

/**
 * AST processor. This class contains node type specific processors and handles abstract syntax tree
 * processing.
 */
public class AstProcessor {

  /**
   * The entry point to AST processing
   *
   * @param ctx processing context
   * @param rootNode the root node of AST
   * @return a list of errors
   */
  public List<SyntaxError> processSyntaxTree(ProcessingContext ctx, Node rootNode) {
    for (ProcessingPhase phase : ProcessingPhase.values()) {
      process(phase, rootNode, ctx);
    }
    return ctx.getErrors();
  }

  /**
   * Process tree node and its children after tree construction.
   *
   * @param phase processing phase
   * @param node a node to process
   * @param ctx processing context
   */
  public void process(ProcessingPhase phase, Node node, ProcessingContext ctx) {
    findProcessors(ctx, phase, node.getClass()).forEach(p -> p.accept(node, ctx));
    node.getChildren().forEach(n -> process(phase, n, ctx));
  }

  private List<Processor<Node>> findProcessors(ProcessingContext ctx,
      ProcessingPhase phase, Class<? extends Node> nodeClass) {
    List<Processor<Node>> result = new ArrayList<>();
    if (!ctx.getProcessors().containsKey(phase)) {
      return result;
    }
    ctx.getProcessors()
        .get(phase)
        .forEach(
            (key, value) -> {
              if (key.isAssignableFrom(nodeClass)) {
                value.forEach(v -> result.add((Processor<Node>) v));
              }
            });
    return result;
  }
}
