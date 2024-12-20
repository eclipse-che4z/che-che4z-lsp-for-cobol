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

import lombok.Setter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;

/**
 * Manages traffic for CICS parser options checking
 */
public class CICSOptionsCheckUtility {
    private final Map<Integer, CICSOptionsCheckBaseUtility> optionsMap = new HashMap<>();

  private final Map<Integer, CICSOptionsCheckBaseUtility> spOptionsMap = new HashMap<>();

  @Setter
  private static boolean exciOptionsEnabled = false;

  @Setter
  private static boolean spOptionsEnabled = false;

  public CICSOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    optionsMap.put(
        CICSReceiveOptionsCheckUtility.RULE_INDEX,
        new CICSReceiveOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSAllocateOptionsCheckUtility.RULE_INDEX,
        new CICSAllocateOptionsCheckUtility(context, errors));
    optionsMap.put(
      CICSBifOptionsCheckUtility.RULE_INDEX,
        new CICSBifOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSAsktimeOptionsCheckUtility.RULE_INDEX,
        new CICSAsktimeOptionsCheckUtility(context, errors));
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
        CICSAssignOptionsCheckUtility.RULE_INDEX,
        new CICSAssignOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSCancelOptionsCheckUtility.RULE_INDEX,
        new CICSCancelOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSSendOptionsCheckUtility.RULE_INDEX,
        new CICSSendOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSConnectProcessOptionsCheckUtility.RULE_INDEX,
        new CICSConnectProcessOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSCheckOptionsUtility.RULE_INDEX,
        new CICSCheckOptionsUtility(context, errors));
    optionsMap.put(
        CICSChangeOptionsCheckUtility.RULE_INDEX,
        new CICSChangeOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSWebOptionsCheckUtility.RULE_INDEX,
        new CICSWebOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSEndBrowseOptionsUtility.RULE_ENDBR_INDEX,
        new CICSEndBrowseOptionsUtility(context, errors));
    optionsMap.put(
        CICSEndBrowseOptionsUtility.RULE_ENDBROWSE_INDEX,
        new CICSEndBrowseOptionsUtility(context, errors));
    optionsMap.put(
        CICSDeleteOptionsCheckUtility.RULE_INDEX,
        new CICSDeleteOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSDeleteqDeqOptionsCheckUtility.RULE_INDEX_DELETEQ,
        new CICSDeleteqDeqOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSDeleteqDeqOptionsCheckUtility.RULE_INDEX_DEQ,
        new CICSDeleteqDeqOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSReadNextReadPrevOptionsUtility.RULE_INDEX,
        new CICSReadNextReadPrevOptionsUtility(context, errors));
    optionsMap.put(
        CICSForceOptionsCheckUtility.RULE_INDEX,
        new CICSForceOptionsCheckUtility(context, errors));
    optionsMap.put(
       CICSEnterTracenumOptionsCheckUtility.RULE_INDEX,
       new CICSEnterTracenumOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSDumpTransactionOptionsCheckUtility.RULE_INDEX,
        new CICSDumpTransactionOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSGetOptionsCheckUtility.RULE_INDEX,
        new CICSGetOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSFreeMainOptionsCheckUtility.RULE_INDEX,
        new CICSFreeMainOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSAddressOptionsCheckUtility.RULE_INDEX,
        new CICSAddressOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSWriteqOptionsCheckUtility.RULE_INDEX,
        new CICSWriteqOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSLinkOptionsCheckUtility.RULE_INDEX,
        new CICSLinkOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSFormatTimeOptionsCheckUtility.RULE_INDEX,
        new CICSFormatTimeOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSDelayOptionsCheckUtility.RULE_INDEX,
        new CICSDelayOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSReadqOptionsCheckUtility.RULE_INDEX,
        new CICSReadqOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSConvertTimeOptionsCheckUtility.RULE_INDEX,
        new CICSConvertTimeOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSEnqOptionsCheckUtility.RULE_INDEX,
        new CICSEnqOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSWriteOptionsCheckUtility.RULE_INDEX,
        new CICSWriteOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSRetrieveOptionsCheckUtility.RULE_INDEX,
        new CICSRetrieveOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSInvokeOptionsCheckUtility.RULE_INDEX,
        new CICSInvokeOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSWSAEPRUtility.RULE_INDEX,
        new CICSWSAEPRUtility(context, errors));
    optionsMap.put(
        CICSWaitCicsOptionsUtility.RULE_INDEX,
        new CICSWaitCicsOptionsUtility(context, errors));
    optionsMap.put(
        CICSTestOptionsUtility.RULE_INDEX,
        new CICSTestOptionsUtility(context, errors));
    optionsMap.put(
        CICSUnlockOptionsUtility.RULE_INDEX,
        new CICSUnlockOptionsUtility(context, errors));
    optionsMap.put(
        CICSMoveOptionsCheckUtility.RULE_INDEX,
        new CICSMoveOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSQueryOptionsCheckUtility.RULE_INDEX,
        new CICSQueryOptionsCheckUtility(context, errors));
    optionsMap.put(
        CICSRunOptionsCheckUtility.RULE_INDEX,
        new CICSRunOptionsCheckUtility(context, errors));
      optionsMap.put(
        CICSXctlOptionsUtility.RULE_INDEX,
        new CICSXctlOptionsUtility(context, errors));
      optionsMap.put(
        CICSSuspendOptionsUtility.RULE_INDEX,
        new CICSSuspendOptionsUtility(context, errors));
      optionsMap.put(
        CICSGetMainOptionsUtility.RULE_INDEX,
        new CICSGetMainOptionsUtility(context, errors));
      optionsMap.put(
        CICSGetMain64OptionsUtility.RULE_INDEX,
        new CICSGetMain64OptionsUtility(context, errors));
      optionsMap.put(
        CICSInquireOptionsCheckUtility.RULE_INDEX,
        new CICSInquireOptionsCheckUtility(context, errors));
      spOptionsMap.put(
         CICSInquireSPOptionsCheckUtility.RULE_INDEX,
         new CICSInquireSPOptionsCheckUtility(context, errors));

  }

    /**
     * Entrypoint to check CICS rule options
     *
     * @param ctx ParserRuleContext subclass containing options
     * @param <E> A subclass of ParserRuleContext
     */
    public <E extends ParserRuleContext> void checkOptions(E ctx) {
        CICSOptionsCheckBaseUtility utility = optionsMap.get(ctx.parent.getRuleIndex());
        CICSOptionsCheckBaseUtility spOptions = spOptionsMap.get(ctx.parent.getRuleIndex());
        if (utility != null) utility.checkOptions(ctx);
        else if (spOptions != null) {
            if (spOptionsEnabled) spOptions.checkOptions(ctx);
            else spOptions.throwIfMissingTranslatorOption(ctx, "\"SP\"");
        }
    }
}
