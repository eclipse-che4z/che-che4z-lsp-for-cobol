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

import java.util.*;
import java.util.function.BiConsumer;

/**
 * AST processor. This class contains node type specific processors and handles abstract syntax tree
 * processing.
 */
public class AstProcessor {
  private final Map<
          ProcessingPhase,
          Map<Class<? extends Node>, List<BiConsumer<? extends Node, ProcessingContext>>>>
      processors = new HashMap<>();

  /**
   * The entry point to AST processing
   *
   * @param rootNode the root node of AST
   * @return a list of errors
   */
  public List<SyntaxError> processSyntaxTree(Node rootNode) {
    ProcessingContext ctx = new ProcessingContext(new ArrayList<>());
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
    findProcessors(phase, node.getClass()).forEach(p -> p.accept(node, ctx));
    node.getChildren().forEach(n -> process(phase, n, ctx));
  }

  private List<BiConsumer<Node, ProcessingContext>> findProcessors(
      ProcessingPhase phase, Class<? extends Node> nodeClass) {
    List<BiConsumer<Node, ProcessingContext>> result = new ArrayList<>();
    if (!processors.containsKey(phase)) {
      return result;
    }
    processors
        .get(phase)
        .forEach(
            (key, value) -> {
              if (key.isAssignableFrom(nodeClass)) {
                value.forEach(v -> result.add((BiConsumer<Node, ProcessingContext>) v));
              }
            });
    return result;
  }

  /**
   * Register node type processor
   *
   * @param nodeClass the node class
   * @param phase In what phase the processor will be called.
   * @param processor Processor itself.
   * @param <T> Specific node type
   */
  public <T extends Node> void register(
      Class<? extends T> nodeClass,
      ProcessingPhase phase,
      BiConsumer<? extends Node, ProcessingContext> processor) {
    processors
        .computeIfAbsent(phase, v -> new LinkedHashMap<>())
        .computeIfAbsent(nodeClass, v -> new ArrayList<>())
        .add(processor);
  }
}
