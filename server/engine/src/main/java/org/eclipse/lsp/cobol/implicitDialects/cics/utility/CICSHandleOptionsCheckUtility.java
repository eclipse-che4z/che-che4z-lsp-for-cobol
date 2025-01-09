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
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_handle;

/** Checks CICS HANDLE rules for required and invalid options */
public class CICSHandleOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_handle;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.CONDITION, ErrorSeverity.WARNING);
              put(CICSLexer.ABEND, ErrorSeverity.ERROR);
              put(CICSLexer.CANCEL, ErrorSeverity.WARNING);
              put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
              put(CICSLexer.LABEL, ErrorSeverity.ERROR);
              put(CICSLexer.RESET, ErrorSeverity.WARNING);
              put(CICSLexer.AID, ErrorSeverity.WARNING);
              put(CICSLexer.ANYKEY, ErrorSeverity.ERROR);
              put(CICSLexer.CLEAR, ErrorSeverity.ERROR);
              put(CICSLexer.CLRPARTN, ErrorSeverity.ERROR);
              put(CICSLexer.ENTER, ErrorSeverity.ERROR);
              put(CICSLexer.LIGHTPEN, ErrorSeverity.ERROR);
              put(CICSLexer.OPERID, ErrorSeverity.ERROR);
              put(CICSLexer.PA1, ErrorSeverity.ERROR);
              put(CICSLexer.PA2, ErrorSeverity.ERROR);
              put(CICSLexer.PA3, ErrorSeverity.ERROR);
              put(CICSLexer.PF1, ErrorSeverity.ERROR);
              put(CICSLexer.PF2, ErrorSeverity.ERROR);
              put(CICSLexer.PF3, ErrorSeverity.ERROR);
              put(CICSLexer.PF4, ErrorSeverity.ERROR);
              put(CICSLexer.PF5, ErrorSeverity.ERROR);
              put(CICSLexer.PF6, ErrorSeverity.ERROR);
              put(CICSLexer.PF7, ErrorSeverity.ERROR);
              put(CICSLexer.PF8, ErrorSeverity.ERROR);
              put(CICSLexer.PF9, ErrorSeverity.ERROR);
              put(CICSLexer.PF10, ErrorSeverity.ERROR);
              put(CICSLexer.PF11, ErrorSeverity.ERROR);
              put(CICSLexer.PF12, ErrorSeverity.ERROR);
              put(CICSLexer.PF13, ErrorSeverity.ERROR);
              put(CICSLexer.PF14, ErrorSeverity.ERROR);
              put(CICSLexer.PF15, ErrorSeverity.ERROR);
              put(CICSLexer.PF16, ErrorSeverity.ERROR);
              put(CICSLexer.PF17, ErrorSeverity.ERROR);
              put(CICSLexer.PF18, ErrorSeverity.ERROR);
              put(CICSLexer.PF19, ErrorSeverity.ERROR);
              put(CICSLexer.PF20, ErrorSeverity.ERROR);
              put(CICSLexer.PF21, ErrorSeverity.ERROR);
              put(CICSLexer.PF22, ErrorSeverity.ERROR);
              put(CICSLexer.PF23, ErrorSeverity.ERROR);
              put(CICSLexer.PF24, ErrorSeverity.ERROR);
              put(CICSLexer.TRIGGER, ErrorSeverity.ERROR);
              put(CICSLexer.NORMAL, ErrorSeverity.ERROR);
              put(CICSLexer.ERROR, ErrorSeverity.ERROR);
              put(CICSLexer.RDATT, ErrorSeverity.ERROR);
              put(CICSLexer.WRBRK, ErrorSeverity.ERROR);
              put(CICSLexer.EOF, ErrorSeverity.ERROR);
              put(CICSLexer.EODS, ErrorSeverity.ERROR);
              put(CICSLexer.EOC, ErrorSeverity.ERROR);
              put(CICSLexer.INBFMH, ErrorSeverity.ERROR);
              put(CICSLexer.ENDINPT, ErrorSeverity.ERROR);
              put(CICSLexer.NONVAL, ErrorSeverity.ERROR);
              put(CICSLexer.NOSTART, ErrorSeverity.ERROR);
              put(CICSLexer.TERMIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.FILENOTFOUND, ErrorSeverity.ERROR);
              put(CICSLexer.NOTFND, ErrorSeverity.ERROR);
              put(CICSLexer.DUPREC, ErrorSeverity.ERROR);
              put(CICSLexer.DUPKEY, ErrorSeverity.ERROR);
              put(CICSLexer.INVREQ, ErrorSeverity.ERROR);
              put(CICSLexer.IOERR, ErrorSeverity.ERROR);
              put(CICSLexer.NOSPACE, ErrorSeverity.ERROR);
              put(CICSLexer.NOTOPEN, ErrorSeverity.ERROR);
              put(CICSLexer.ENDFILE, ErrorSeverity.ERROR);
              put(CICSLexer.ILLOGIC, ErrorSeverity.ERROR);
              put(CICSLexer.LENGERR, ErrorSeverity.ERROR);
              put(CICSLexer.QZERO, ErrorSeverity.ERROR);
              put(CICSLexer.SIGNAL, ErrorSeverity.ERROR);
              put(CICSLexer.QBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.ITEMERR, ErrorSeverity.ERROR);
              put(CICSLexer.PGMIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.TRANSIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.ENDDATA, ErrorSeverity.ERROR);
              put(CICSLexer.INVTSREQ, ErrorSeverity.ERROR);
              put(CICSLexer.EXPIRED, ErrorSeverity.ERROR);
              put(CICSLexer.RETPAGE, ErrorSeverity.ERROR);
              put(CICSLexer.RTEFAIL, ErrorSeverity.ERROR);
              put(CICSLexer.RTESOME, ErrorSeverity.ERROR);
              put(CICSLexer.TSIOERR, ErrorSeverity.ERROR);
              put(CICSLexer.MAPFAIL, ErrorSeverity.ERROR);
              put(CICSLexer.INVERRTERM, ErrorSeverity.ERROR);
              put(CICSLexer.INVMPSZ, ErrorSeverity.ERROR);
              put(CICSLexer.IGREQID, ErrorSeverity.ERROR);
              put(CICSLexer.OVERFLOW, ErrorSeverity.ERROR);
              put(CICSLexer.INVLDC, ErrorSeverity.ERROR);
              put(CICSLexer.NOSTG, ErrorSeverity.ERROR);
              put(CICSLexer.JIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.QIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.NOJBUFSP, ErrorSeverity.ERROR);
              put(CICSLexer.DSSTAT, ErrorSeverity.ERROR);
              put(CICSLexer.SELNERR, ErrorSeverity.ERROR);
              put(CICSLexer.FUNCERR, ErrorSeverity.ERROR);
              put(CICSLexer.UNEXPIN, ErrorSeverity.ERROR);
              put(CICSLexer.NOPASSBKRD, ErrorSeverity.ERROR);
              put(CICSLexer.NOPASSBKWR, ErrorSeverity.ERROR);
              put(CICSLexer.SEGIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.SYSIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.ISCINVREQ, ErrorSeverity.ERROR);
              put(CICSLexer.ENQBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.ENVDEFERR, ErrorSeverity.ERROR);
              put(CICSLexer.IGREQCD, ErrorSeverity.ERROR);
              put(CICSLexer.SESSIONERR, ErrorSeverity.ERROR);
              put(CICSLexer.SYSBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.SESSBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.NOTALLOC, ErrorSeverity.ERROR);
              put(CICSLexer.CBIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.INVEXITREQ, ErrorSeverity.ERROR);
              put(CICSLexer.INVPARTNSET, ErrorSeverity.ERROR);
              put(CICSLexer.INVPARTN, ErrorSeverity.ERROR);
              put(CICSLexer.PARTNFAIL, ErrorSeverity.ERROR);
              put(CICSLexer.USERIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.NOTAUTH, ErrorSeverity.ERROR);
              put(CICSLexer.VOLIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.SUPPRESSED, ErrorSeverity.ERROR);
              put(CICSLexer.RESIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.NOSPOOL, ErrorSeverity.ERROR);
              put(CICSLexer.TERMERR, ErrorSeverity.ERROR);
              put(CICSLexer.ROLLEDBACK, ErrorSeverity.ERROR);
              put(CICSLexer.END, ErrorSeverity.ERROR);
              put(CICSLexer.DISABLED, ErrorSeverity.ERROR);
              put(CICSLexer.ALLOCERR, ErrorSeverity.ERROR);
              put(CICSLexer.STRELERR, ErrorSeverity.ERROR);
              put(CICSLexer.OPENERR, ErrorSeverity.ERROR);
              put(CICSLexer.SPOLBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.SPOLERR, ErrorSeverity.ERROR);
              put(CICSLexer.NODEIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.TASKIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.TCIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.DSNNOTFOUND, ErrorSeverity.ERROR);
              put(CICSLexer.LOADING, ErrorSeverity.ERROR);
              put(CICSLexer.MODELIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.OUTDESCRERR, ErrorSeverity.ERROR);
              put(CICSLexer.PARTNERIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.PROFILEIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.NETNAMEIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.LOCKED, ErrorSeverity.ERROR);
              put(CICSLexer.RECORDBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.UOWNOTFOUND, ErrorSeverity.ERROR);
              put(CICSLexer.UOWLNOTFOUND, ErrorSeverity.ERROR);
              put(CICSLexer.LINKABEND, ErrorSeverity.ERROR);
              put(CICSLexer.CHANGED, ErrorSeverity.ERROR);
              put(CICSLexer.PROCESSBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.ACTIVITYBUSY, ErrorSeverity.ERROR);
              put(CICSLexer.PROCESSERR, ErrorSeverity.ERROR);
              put(CICSLexer.ACTIVITYERR, ErrorSeverity.ERROR);
              put(CICSLexer.CONTAINERERR, ErrorSeverity.ERROR);
              put(CICSLexer.EVENTERR, ErrorSeverity.ERROR);
              put(CICSLexer.TOKENERR, ErrorSeverity.ERROR);
              put(CICSLexer.NOTFINISHED, ErrorSeverity.ERROR);
              put(CICSLexer.POOLERR, ErrorSeverity.ERROR);
              put(CICSLexer.TIMERERR, ErrorSeverity.ERROR);
              put(CICSLexer.SYMBOLERR, ErrorSeverity.ERROR);
              put(CICSLexer.TEMPLATERR, ErrorSeverity.ERROR);
              put(CICSLexer.NOTSUPERUSER, ErrorSeverity.ERROR);
              put(CICSLexer.CSDERR, ErrorSeverity.ERROR);
              put(CICSLexer.DUPRES, ErrorSeverity.ERROR);
              put(CICSLexer.RESUNAVAIL, ErrorSeverity.ERROR);
              put(CICSLexer.CHANNELERR, ErrorSeverity.ERROR);
              put(CICSLexer.CCSIDERR, ErrorSeverity.ERROR);
              put(CICSLexer.TIMEDOUT, ErrorSeverity.ERROR);
              put(CICSLexer.CODEPAGEERR, ErrorSeverity.ERROR);
              put(CICSLexer.INCOMPLETE, ErrorSeverity.ERROR);
              put(CICSLexer.APPNOTFOUND, ErrorSeverity.ERROR);
              put(CICSLexer.BUSY, ErrorSeverity.ERROR);
            }
          };

  public CICSHandleOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Handle rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_handle_abend:
        checkHandleAbend((CICSParser.Cics_handle_abendContext) ctx);
        break;
      case CICSParser.RULE_cics_handle_aid:
        checkHandleAid((CICSParser.Cics_handle_aidContext) ctx);
        break;
      case CICSParser.RULE_cics_handle_condition:
        checkHandleCondition((CICSParser.Cics_handle_conditionContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkHandleAbend(CICSParser.Cics_handle_abendContext ctx) {
    checkHasMandatoryOptions(ctx.ABEND(), ctx, "ABEND");
    checkHasMutuallyExclusiveOptions("CANCEL or PROGRAM or LABEL or RESET", ctx.CANCEL(), ctx.PROGRAM(), ctx.LABEL(), ctx.RESET());
  }

  private void checkHandleAid(CICSParser.Cics_handle_aidContext ctx) {
    checkHasMandatoryOptions(ctx.AID(), ctx, "AID");
    checkHasTooManyOptions(ctx);
  }

  private void checkHandleCondition(CICSParser.Cics_handle_conditionContext ctx) {
    checkHasMandatoryOptions(ctx.CONDITION(), ctx, "CONDITION");
  }

  private void checkHasTooManyOptions(ParserRuleContext parentCtx) {
    if (parentCtx.children == null)
      return;
    long commandOptionsCount = parentCtx.children.stream()
            .filter(node -> node instanceof TerminalNode)
            .map(TerminalNode.class::cast)
            .filter(node -> node.getSymbol().getType() != CICSLexer.AID)
            .count();
    if (commandOptionsCount > 16) {
      throwException(ErrorSeverity.ERROR, getLocality(parentCtx), "Too many options provided for: ", "HANDLE AID");
    }
  }
}
