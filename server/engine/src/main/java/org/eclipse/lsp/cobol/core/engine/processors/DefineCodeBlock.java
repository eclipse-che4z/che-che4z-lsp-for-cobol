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
package org.eclipse.lsp.cobol.core.engine.processors;

import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.NodeType;
import org.eclipse.lsp.cobol.common.model.tree.ParagraphsNode;
import org.eclipse.lsp.cobol.common.model.tree.ProcedureDivisionBodyNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolAccumulatorService;

import java.util.List;
import java.util.Optional;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.common.model.tree.Node.hasType;

/** Processor for ProcedureDivisionBodyNode and ParagraphsNode nodes */
public class DefineCodeBlock implements Processor<Node> {
  private final SymbolAccumulatorService symbolAccumulatorService;

  public DefineCodeBlock(SymbolAccumulatorService symbolAccumulatorService) {
    this.symbolAccumulatorService = symbolAccumulatorService;
  }

  @Override
  public void accept(Node node, ProcessingContext ctx) {
    if ((node instanceof ProcedureDivisionBodyNode) || (node instanceof ParagraphsNode)) {
      List<SyntaxError> c =
          node.getChildren().stream()
              .filter(hasType(NodeType.PARAGRAPH).or(hasType(NodeType.PROCEDURE_SECTION)))
              .map(CodeBlockDefinitionNode.class::cast)
              .map(this::register)
              .filter(Optional::isPresent)
              .map(Optional::get)
              .collect(toList());
      ctx.getErrors().addAll(c);
    }
  }

  private Optional<SyntaxError> register(CodeBlockDefinitionNode node) {
    node.getProgram().ifPresent(programNode -> symbolAccumulatorService.registerCodeBlock(programNode, node));
    return Optional.empty();
  }
}
