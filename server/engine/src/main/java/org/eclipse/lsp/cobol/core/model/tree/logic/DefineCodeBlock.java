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
package org.eclipse.lsp.cobol.core.model.tree.logic;

import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.ParagraphsNode;
import org.eclipse.lsp.cobol.core.model.tree.ProcedureDivisionBodyNode;
import org.eclipse.lsp.cobol.core.semantics.CodeBlockDefinitionUtils;

import java.util.function.BiConsumer;

/** Processor for ProcedureDivisionBodyNode and ParagraphsNode nodes */
public class DefineCodeBlock implements BiConsumer<Node, ProcessingContext> {
  @Override
  public void accept(Node node, ProcessingContext ctx) {
    if ((node instanceof ProcedureDivisionBodyNode) || (node instanceof ParagraphsNode)) {
      ctx.getErrors().addAll(CodeBlockDefinitionUtils.defineCodeBlock(node));
    }
  }
}
