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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cli.command.CliUtils;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.ProcessingPhase;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.engine.analysis.AnalysisContext;

import java.util.List;
import java.util.Map;

/**
 * AST processor. This class contains node type specific processors and handles abstract syntax tree
 * processing.
 */
@Slf4j
public class AstProcessor {

  /**
   * The entry point to AST processing
   *
   * @param analysisConfig
   * @param ctx             processing context
   * @param analysisContext
   * @param rootNode        the root node of AST
   * @return a list of errors
   */
  public List<SyntaxError> processSyntaxTree(AnalysisConfig analysisConfig, ProcessingContext ctx, AnalysisContext analysisContext, Node rootNode) {
    if (analysisConfig.isCollectAstChanges()) {
      analysisContext.logAst(null, CliUtils.GSON.toJsonTree(rootNode));
    }
    for (ProcessingPhase phase : ProcessingPhase.values()) {
      ThreadInterruptionUtil.checkThreadInterrupted();
      process(phase, rootNode, ctx);
      if (analysisConfig.isCollectAstChanges()) {
        analysisContext.logAst(phase, CliUtils.GSON.toJsonTree(rootNode));
      }
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
    Map<Class<? extends Node>, List<Processor<? extends Node>>> processors = ctx.getProcessors().get(phase);
    if (processors != null)
      process(processors, node, ctx);
  }

  /**
   * Process tree node and its children after tree construction.
   *
   * @param processor list of available processors
   * @param node a node to process
   * @param ctx processing context
   */
  private void process(Map<Class<? extends Node>, List<Processor<? extends Node>>> processors,
      Node node, ProcessingContext ctx) {
    ThreadInterruptionUtil.checkThreadInterrupted();
    final Class<? extends Node> nodeClass = node.getClass();
    processors.forEach((key, value) -> {
      if (!key.isAssignableFrom(nodeClass))
        return;
      for (Processor<? extends Node> p : value)
        ((Processor<Node>) p).accept(node, ctx);
    });
    node.getChildren().forEach(n -> process(processors, n, ctx));
  }
}
