/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.dialects.idms;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.dialects.idms.IdmsCopyParser.*;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;

/** Utility class for visitor and delegates classes with useful methods */
@Slf4j
@UtilityClass
class VisitorHelper {

  /**
   * Get variable level from TerminalNode object
   *
   * @param terminalNode is a TerminalNode
   * @return a level of defined variable
   */
  public int getLevel(TerminalNode terminalNode) {
    String levelNumber = terminalNode.getText();
    return Integer.parseInt(levelNumber);
  }

  /**
   * Get name of the EntryNameContext
   *
   * @param context is a statement context object
   * @return a text of the statement
   */
  public String getName(EntryNameContext context) {
    return ofNullable(context)
        .map(org.eclipse.lsp.cobol.dialects.idms.IdmsCopyParser.EntryNameContext::dataName)
        .map(VisitorHelper::getName)
        .orElse(FILLER_NAME);
  }

  /**
   * Get name of the ParserRuleContext
   *
   * @param context is a statement context
   * @return a text of statement context
   */
  public String getName(ParserRuleContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse("");
  }
}
