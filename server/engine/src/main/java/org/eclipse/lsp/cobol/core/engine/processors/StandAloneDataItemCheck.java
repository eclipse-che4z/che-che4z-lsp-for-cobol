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

import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.variable.StandAloneDataItemNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;

import static org.eclipse.lsp.cobol.common.VariableConstants.EMPTY_STRUCTURE_MSG;

/** StandAloneDataItemNode processor */
public class StandAloneDataItemCheck implements Processor<StandAloneDataItemNode> {
  @Override
  public void accept(StandAloneDataItemNode node, ProcessingContext ctx) {
    if (node.getPicClause().isEmpty() && node.getUsageFormat() != UsageFormat.INDEX) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, node.getName())));
    }
  }
}
