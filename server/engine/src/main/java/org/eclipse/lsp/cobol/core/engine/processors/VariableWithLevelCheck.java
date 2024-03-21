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

import static org.eclipse.lsp.cobol.common.VariableConstants.*;

import org.eclipse.lsp.cobol.common.message.MessageTemplate;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableWithLevelNode;
import org.eclipse.lsp.cobol.common.processor.ProcessingContext;
import org.eclipse.lsp.cobol.common.processor.Processor;
import org.eclipse.lsp.cobol.service.settings.layout.CobolProgramLayout;

/** VariableWithLevelNode processor */
public class VariableWithLevelCheck implements Processor<VariableWithLevelNode> {
  private final CobolProgramLayout programLayout;

  public VariableWithLevelCheck(CobolProgramLayout programLayout) {
    this.programLayout = programLayout;
  }

  @Override
  public void accept(VariableWithLevelNode node, ProcessingContext ctx) {
    int areaAFinish = programLayout.getSequenceLength() + programLayout.getIndicatorLength() + programLayout.getAreaALength() - 1;
    if ((node.getLevel() == LEVEL_01 || node.getLevel() == LEVEL_77)
        && node.getLocality().getRange().getStart().getCharacter() > areaAFinish) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(AREA_A_WARNING, node.getName())));
    }

    if (node.isSpecifiedGlobal() && node.getLevel() != LEVEL_01) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(GLOBAL_NON_01_LEVEL_MSG)));
    }
  }
}
