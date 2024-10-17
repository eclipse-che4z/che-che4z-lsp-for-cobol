/*
 * Copyright (c) 2024 Broadcom.
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

package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;

/** Manages traffic for CICS parser options checking */
public class CICSOptionsCheckUtility {
  private final Map<Integer, CICSOptionsCheckBaseUtility> optionsMap = new HashMap<>();

  public CICSOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    optionsMap.put(
        CICSReceiveOptionsCheckUtility.RULE_INDEX,
        new CICSReceiveOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSAllocateOptionsCheckUtility.RULE_INDEX,
        new CICSAllocateOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSAbendOptionsCheckUtility.RULE_INDEX,
        new CICSAbendOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSConverseOptionsCheckUtility.RULE_INDEX,
        new CICSConverseOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSExtractOptionsUtility.RULE_INDEX,
        new CICSExtractOptionsUtility(context, errors));
    optionsMap.put(
        CICSDefineOptionsCheckUtility.RULE_INDEX,
        new CICSDefineOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSIssueOptionsCheckUtility.RULE_INDEX,
        new CICSIssueOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSAddSubeventOptionsCheckUtility.RULE_INDEX,
        new CICSAddSubeventOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSBuildOptionsCheckUtility.RULE_INDEX,
        new CICSBuildOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSAcquireOptionsCheckUtility.RULE_INDEX,
        new CICSAcquireOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSWaitOptionsCheckUtility.RULE_INDEX,
        new CICSWaitOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSCancelOptionsCheckUtility.RULE_INDEX,
        new CICSCancelOptionsCheckUtility(context, errors));
  }

  /**
   * Entrypoint to check CICS rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    CICSOptionsCheckBaseUtility utility = optionsMap.get(ctx.parent.getRuleIndex());
    if (utility != null) utility.checkOptions(ctx);
  }
}
