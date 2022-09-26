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
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.model.tree.SectionNameNode;

import java.util.Optional;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.PROCEDURE_SECTION;

/** SectionNameNode processor */
public class SectionNameRegister implements Processor<SectionNameNode> {
  @Override
  public void accept(SectionNameNode node, ProcessingContext ctx) {
    if (node.getParent().getNodeType() != PROCEDURE_SECTION) {
      // TODO: register usage
      return;
    }
    ctx.getErrors()
        .addAll(
            node.getProgram()
                .flatMap(
                    program ->
                        program
                            .verifySectionNodeDuplication(node, node.getMessageService())
                            .map(Optional::of)
                            .orElse(program.registerSectionNameNode(node)))
                .map(ImmutableList::of)
                .orElseGet(ImmutableList::of));
  }
}
