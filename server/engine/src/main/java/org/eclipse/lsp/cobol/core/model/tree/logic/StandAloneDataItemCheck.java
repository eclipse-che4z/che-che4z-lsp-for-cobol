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
import org.eclipse.lsp.cobol.core.engine.processor.Processor;
import org.eclipse.lsp.cobol.core.messages.MessageTemplate;
import org.eclipse.lsp.cobol.core.model.tree.variables.StandAloneDataItemNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.UsageFormat;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.EMPTY_STRUCTURE_MSG;

/** StandAloneDataItemNode processor */
public class StandAloneDataItemCheck implements Processor<StandAloneDataItemNode> {
  @Override
  public void accept(StandAloneDataItemNode node, ProcessingContext ctx) {
    if (node.getPicClause().isEmpty() && node.getUsageFormat() != UsageFormat.INDEX) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, node.getName())));
    }
  }
}
