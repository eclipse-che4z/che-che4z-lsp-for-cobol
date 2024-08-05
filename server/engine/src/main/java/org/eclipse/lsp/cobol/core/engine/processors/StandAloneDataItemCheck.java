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

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.common.model.tree.variable.StandAloneDataItemNode;

import java.util.List;

import static org.eclipse.lsp.cobol.common.VariableConstants.EMPTY_STRUCTURE_MSG;

/** StandAloneDataItemNode processor */
public class StandAloneDataItemCheck implements Processor<StandAloneDataItemNode> {
  private static final List<UsageFormat> USAGE_FOR_NO_MANDATORY_PIC_CLAUSE =
      ImmutableList.of(
          UsageFormat.INDEX,
          UsageFormat.POINTER,
          UsageFormat.POINTER_32,
          UsageFormat.PROCEDURE_POINTER,
          UsageFormat.FUNCTION_POINTER,
          UsageFormat.OBJECT_REFERENCE,
          UsageFormat.COMPUTATIONAL_1,
          UsageFormat.COMP_1,
          UsageFormat.COMPUTATIONAL_2,
          UsageFormat.COMP_2);

  @Override
  public void accept(StandAloneDataItemNode node, ProcessingContext ctx) {
    if (node.getPicClause().isEmpty()
        && !USAGE_FOR_NO_MANDATORY_PIC_CLAUSE.contains(node.getUsageFormat())) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(EMPTY_STRUCTURE_MSG, node.getName())));
    }
  }
}
