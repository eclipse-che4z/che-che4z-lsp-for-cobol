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
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableWithLevelNode;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.*;

/** VariableWithLevelNode processor */
public class VariableWithLevelCheckLevel implements Processor<VariableWithLevelNode> {
  @Override
  public void accept(VariableWithLevelNode node, ProcessingContext ctx) {
    if ((node.getLevel() == LEVEL_01 || node.getLevel() == LEVEL_77)
        && node.getLocality().getRange().getStart().getCharacter() > AREA_A_FINISH) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(AREA_A_WARNING, node.getName())));
    }

    if (node.isSpecifiedGlobal() && node.getLevel() != LEVEL_01) {
      ctx.getErrors().add(node.getError(MessageTemplate.of(GLOBAL_NON_01_LEVEL_MSG)));
    }
  }
}
