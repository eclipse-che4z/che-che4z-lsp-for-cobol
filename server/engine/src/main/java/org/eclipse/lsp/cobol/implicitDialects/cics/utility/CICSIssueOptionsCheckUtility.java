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

import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_issue;

/** Checks CICS Issue rules for required and invalid options */
public class CICSIssueOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_issue;

  public CICSIssueOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors);
  }

  /**
   * Entrypoint to check CICS Issue rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getClass() == CICSParser.Cics_issue_abendContext.class)
      checkAbend((CICSParser.Cics_issue_abendContext) ctx);
  }

  private void checkAbend(CICSParser.Cics_issue_abendContext ctx) {
    checkHasMandatoryOptions(ctx.ABEND(), ctx, "ABEND");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ABEND(), "ABEND"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkAbort(CICSParser.Cics_issue_abortContext ctx) {
    checkHasMandatoryOptions(ctx.ABORT(), ctx, "ABORT");

    int volumeSubArgCount =
        ctx.CONSOLE().size()
            + ctx.PRINT().size()
            + ctx.CARD().size()
            + ctx.WPMEDIA1().size()
            + ctx.WPMEDIA2().size()
            + ctx.WPMEDIA3().size()
            + ctx.WPMEDIA4().size();

    if (!ctx.DESTID().isEmpty()) {
      checkHasIllegalOptions(ctx.SUBADDR(), "SUBADDR with DESTID");
      checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE with DESTID");
      checkHasIllegalOptions(ctx.PRINT(), "PRINT with DESTID");
      checkHasIllegalOptions(ctx.CARD(), "CARD with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3 with DESTID");
      checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4 with DESTID");
    } else {
      checkHasIllegalOptions(ctx.DESTIDLENG(), "DESTIDLENG without DESTID");
      if (volumeSubArgCount > 1) {
        checkHasIllegalOptions(ctx.CONSOLE(), "CONSOLE");
        checkHasIllegalOptions(ctx.PRINT(), "PRINT");
        checkHasIllegalOptions(ctx.CARD(), "CARD");
        checkHasIllegalOptions(ctx.WPMEDIA1(), "WPMEDIA1");
        checkHasIllegalOptions(ctx.WPMEDIA2(), "WPMEDIA2");
        checkHasIllegalOptions(ctx.WPMEDIA3(), "WPMEDIA3");
        checkHasIllegalOptions(ctx.WPMEDIA4(), "WPMEDIA4");
      }
    }
    if (ctx.VOLUME().isEmpty())
      checkHasIllegalOptions(ctx.VOLUMELENG(), "VOLUMELENG without VOLUME");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ABORT(), "ABORT"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.SUBADDR(), "SUBADDR"));
    contexts.add(new RuleContextData(ctx.PRINT(), "PRINT"));
    contexts.add(new RuleContextData(ctx.CARD(), "CARD"));
    contexts.add(new RuleContextData(ctx.CONSOLE(), "CONSOLE"));
    contexts.add(new RuleContextData(ctx.WPMEDIA1(), "WPMEDIA1"));
    contexts.add(new RuleContextData(ctx.WPMEDIA2(), "WPMEDIA2"));
    contexts.add(new RuleContextData(ctx.WPMEDIA3(), "WPMEDIA3"));
    contexts.add(new RuleContextData(ctx.WPMEDIA4(), "WPMEDIA4"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }
}
