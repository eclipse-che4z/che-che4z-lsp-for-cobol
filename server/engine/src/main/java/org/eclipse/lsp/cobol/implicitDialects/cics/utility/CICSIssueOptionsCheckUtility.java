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
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParserListener;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParserVisitor;

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
    else if (ctx.getClass() == CICSParser.Cics_issue_abortContext.class)
      checkAbort((CICSParser.Cics_issue_abortContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_addContext.class)
      checkAdd((CICSParser.Cics_issue_addContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_confirmationContext.class)
      checkConfirmation((CICSParser.Cics_issue_confirmationContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_copyContext.class)
      checkCopy((CICSParser.Cics_issue_copyContext) ctx);
    else if (ctx.getClass() == CICSParser.Cics_issue_disconnectContext.class)
      checkDisconnect((CICSParser.Cics_issue_disconnectContext) ctx);
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
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ABORT(), "ABORT"));
    checkIssueCommonSubAddr(ctx, contexts);
  }

  private void checkAdd(CICSParser.Cics_issue_addContext ctx) {
    checkHasMandatoryOptions(ctx.ADD(), ctx, "ADD");
    checkHasMandatoryOptions(ctx.DESTID(), ctx, "DESTID");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    if (ctx.RIDFLD().isEmpty()) checkHasIllegalOptions(ctx.RRN(), "RRN without RIDFLD");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.ADD(), "ADD"));
    contexts.add(new RuleContextData(ctx.DESTID(), "DESTID"));
    contexts.add(new RuleContextData(ctx.DESTIDLENG(), "DESTIDLENG"));
    contexts.add(new RuleContextData(ctx.VOLUME(), "VOLUME"));
    contexts.add(new RuleContextData(ctx.VOLUMELENG(), "VOLUMELENG"));
    contexts.add(new RuleContextData(ctx.FROM(), "FROM"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.NUMREC(), "NUMREC"));
    contexts.add(new RuleContextData(ctx.DEFRESP(), "DEFRESP"));
    contexts.add(new RuleContextData(ctx.NOWAIT(), "NOWAIT"));
    contexts.add(new RuleContextData(ctx.RIDFLD(), "RIDFLD"));
    contexts.add(new RuleContextData(ctx.RRN(), "RRN"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkConfirmation(CICSParser.Cics_issue_confirmationContext ctx) {
    checkHasMandatoryOptions(ctx.CONFIRMATION(), ctx, "CONFIRMATION");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.CONFIRMATION(), "CONFIRMATION"));
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkCopy(CICSParser.Cics_issue_copyContext ctx) {
    checkHasMandatoryOptions(ctx.COPY(), ctx, "COPY");
    checkHasMandatoryOptions(ctx.TERMID(), ctx, "TERMID");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.COPY(), "COPY"));
    contexts.add(new RuleContextData(ctx.TERMID(), "TERMID"));
    contexts.add(new RuleContextData(ctx.CTLCHAR(), "CTLCHAR"));
    contexts.add(new RuleContextData(ctx.WAIT(), "WAIT"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkDisconnect(CICSParser.Cics_issue_disconnectContext ctx) {
    checkHasMandatoryOptions(ctx.DISCONNECT(), ctx, "DISCONNECT");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.DISCONNECT(), "DISCONNECT"));
    contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkEnd(CICSParser.Cics_issue_endContext ctx) {
    checkHasMandatoryOptions(ctx.END(), ctx, "END");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.END(), "END"));
    checkIssueCommonSubAddr(ctx, contexts);
  }

  private <E extends ParserRuleContext> void checkIssueCommonSubAddr(
      E context, List<RuleContextData> contexts) {
    CommonIssueContext ctx = (CommonIssueContext) context;
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
      int subArgCount =
          ctx.CONSOLE().size()
              + ctx.PRINT().size()
              + ctx.CARD().size()
              + ctx.WPMEDIA1().size()
              + ctx.WPMEDIA2().size()
              + ctx.WPMEDIA3().size()
              + ctx.WPMEDIA4().size();
      if (subArgCount > 1 || (ctx.SUBADDR().isEmpty() && subArgCount > 0)) {
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

    contexts.add(new RuleContextData(ctx.END(), "END"));
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

  public static class CommonIssueContext extends ParserRuleContext {
    public List<TerminalNode> END() {
      return getTokens(CICSParser.END);
    }

    public TerminalNode END(int i) {
      return getToken(CICSParser.END, i);
    }

    public List<CICSParser.Cics_data_valueContext> cics_data_value() {
      return getRuleContexts(CICSParser.Cics_data_valueContext.class);
    }

    public CICSParser.Cics_data_valueContext cics_data_value(int i) {
      return getRuleContext(CICSParser.Cics_data_valueContext.class, i);
    }

    public List<TerminalNode> CONSOLE() {
      return getTokens(CICSParser.CONSOLE);
    }

    public TerminalNode CONSOLE(int i) {
      return getToken(CICSParser.CONSOLE, i);
    }

    public List<TerminalNode> PRINT() {
      return getTokens(CICSParser.PRINT);
    }

    public TerminalNode PRINT(int i) {
      return getToken(CICSParser.PRINT, i);
    }

    public List<TerminalNode> CARD() {
      return getTokens(CICSParser.CARD);
    }

    public TerminalNode CARD(int i) {
      return getToken(CICSParser.CARD, i);
    }

    public List<TerminalNode> WPMEDIA1() {
      return getTokens(CICSParser.WPMEDIA1);
    }

    public TerminalNode WPMEDIA1(int i) {
      return getToken(CICSParser.WPMEDIA1, i);
    }

    public List<TerminalNode> WPMEDIA2() {
      return getTokens(CICSParser.WPMEDIA2);
    }

    public TerminalNode WPMEDIA2(int i) {
      return getToken(CICSParser.WPMEDIA2, i);
    }

    public List<TerminalNode> WPMEDIA3() {
      return getTokens(CICSParser.WPMEDIA3);
    }

    public TerminalNode WPMEDIA3(int i) {
      return getToken(CICSParser.WPMEDIA3, i);
    }

    public List<TerminalNode> WPMEDIA4() {
      return getTokens(CICSParser.WPMEDIA4);
    }

    public TerminalNode WPMEDIA4(int i) {
      return getToken(CICSParser.WPMEDIA4, i);
    }

    public List<CICSParser.Cics_handle_responseContext> cics_handle_response() {
      return getRuleContexts(CICSParser.Cics_handle_responseContext.class);
    }

    public CICSParser.Cics_handle_responseContext cics_handle_response(int i) {
      return getRuleContext(CICSParser.Cics_handle_responseContext.class, i);
    }

    public List<TerminalNode> DESTID() {
      return getTokens(CICSParser.DESTID);
    }

    public TerminalNode DESTID(int i) {
      return getToken(CICSParser.DESTID, i);
    }

    public List<TerminalNode> DESTIDLENG() {
      return getTokens(CICSParser.DESTIDLENG);
    }

    public TerminalNode DESTIDLENG(int i) {
      return getToken(CICSParser.DESTIDLENG, i);
    }

    public List<TerminalNode> SUBADDR() {
      return getTokens(CICSParser.SUBADDR);
    }

    public TerminalNode SUBADDR(int i) {
      return getToken(CICSParser.SUBADDR, i);
    }

    public List<TerminalNode> VOLUME() {
      return getTokens(CICSParser.VOLUME);
    }

    public TerminalNode VOLUME(int i) {
      return getToken(CICSParser.VOLUME, i);
    }

    public List<TerminalNode> VOLUMELENG() {
      return getTokens(CICSParser.VOLUMELENG);
    }

    public TerminalNode VOLUMELENG(int i) {
      return getToken(CICSParser.VOLUMELENG, i);
    }
  }
}
