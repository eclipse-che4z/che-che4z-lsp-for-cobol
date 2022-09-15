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

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.core.engine.processor.ProcessingContext;
import org.eclipse.lsp.cobol.core.model.tree.ParagraphNameNode;

import java.util.function.BiConsumer;

/** ParagraphNameNode processor */
public class ParagraphNameRegister implements BiConsumer<ParagraphNameNode, ProcessingContext> {
  @Override
  public void accept(ParagraphNameNode node, ProcessingContext ctx) {
    node.getProgram()
        .flatMap(parent -> parent.registerParagraphNameNode(node))
        .map(ImmutableList::of)
        .orElseGet(ImmutableList::of)
        .forEach(ctx.getErrors()::add);
  }
}
