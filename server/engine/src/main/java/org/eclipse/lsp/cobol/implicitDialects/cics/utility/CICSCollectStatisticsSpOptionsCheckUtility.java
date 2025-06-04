/*
 * Copyright (c) 2025 Broadcom.
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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS COLLECT STATISTICS rules for required and invalid options */
public class CICSCollectStatisticsSpOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_collect_statistics;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.STATISTICS, ErrorSeverity.WARNING);
          put(CICSLexer.LASTRESET, ErrorSeverity.ERROR);
          put(CICSLexer.LASTRESETHRS, ErrorSeverity.ERROR);
          put(CICSLexer.LASTRESETMIN, ErrorSeverity.ERROR);
          put(CICSLexer.LASTRESETSEC, ErrorSeverity.ERROR);
          put(CICSLexer.AUTOINSTALL, ErrorSeverity.WARNING);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.CONNECTION, ErrorSeverity.ERROR);
          put(CICSLexer.DB2ENTRY, ErrorSeverity.ERROR);
          put(CICSLexer.FILE, ErrorSeverity.ERROR);
          put(CICSLexer.JVMPROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.JOURNALNAME, ErrorSeverity.ERROR);
          put(CICSLexer.JOURNALNUM, ErrorSeverity.ERROR);
          put(CICSLexer.POOL, ErrorSeverity.ERROR);
          put(CICSLexer.LSRPOOL, ErrorSeverity.ERROR);
          put(CICSLexer.TARGET, ErrorSeverity.ERROR);
          put(CICSLexer.STORAGE, ErrorSeverity.ERROR);
          put(CICSLexer.SUBPOOL, ErrorSeverity.ERROR);
          put(CICSLexer.NODE, ErrorSeverity.ERROR);
          put(CICSLexer.TCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.TCPIPSERVICE, ErrorSeverity.ERROR);
          put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
          put(CICSLexer.TRANCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.DB2CONN, ErrorSeverity.WARNING);
          put(CICSLexer.DISPATCHER, ErrorSeverity.WARNING);
          put(CICSLexer.ENQUEUE, ErrorSeverity.WARNING);
          put(CICSLexer.MONITOR, ErrorSeverity.ERROR);
          put(CICSLexer.MVSTCB, ErrorSeverity.ERROR);
          put(CICSLexer.PROGAUTO, ErrorSeverity.WARNING);
          put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.RECOVERY, ErrorSeverity.WARNING);
          put(CICSLexer.STATS, ErrorSeverity.WARNING);
          put(CICSLexer.STREAMNAME, ErrorSeverity.ERROR);
          put(CICSLexer.SYSDUMPCODE, ErrorSeverity.ERROR);
          put(CICSLexer.TABLEMGR, ErrorSeverity.WARNING);
          put(CICSLexer.TASKSUBPOOL, ErrorSeverity.WARNING);
          put(CICSLexer.TCPIP, ErrorSeverity.WARNING);
          put(CICSLexer.TDQUEUE, ErrorSeverity.ERROR);
          put(CICSLexer.TRANDUMPCODE, ErrorSeverity.ERROR);
          put(CICSLexer.TRANSACTION, ErrorSeverity.ERROR);
          put(CICSLexer.TSQUEUE, ErrorSeverity.WARNING);
          put(CICSLexer.VTAM, ErrorSeverity.WARNING);
        }
      };

  public CICSCollectStatisticsSpOptionsCheckUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      CICSCheckUtilityParameters params) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS, params);
  }

  /**
   * Entrypoint to check CICS COLLECT STATISTICS system command rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == RULE_cics_collect_statistics_opts)
      checkOpts((CICSParser.Cics_collect_statistics_optsContext) ctx);

    checkDuplicates(ctx);
  }

  private void checkOpts(CICSParser.Cics_collect_statistics_optsContext ctx) {
    checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
    checkHasMutuallyExclusiveOptions(
        "LASTRESET or LASTRESETHRS", ctx.LASTRESET(), ctx.LASTRESETHRS());
    checkAllOptionsArePresentOrAbsent(
        "LASTRESETHRS, LASTRESETMIN, LASTRESETSEC",
        ctx,
        ctx.LASTRESETHRS(),
        ctx.LASTRESETMIN(),
        ctx.LASTRESETSEC());
    checkHasMutuallyExclusiveOptions(
        "AUTOINSTALL or  CONNECTION or  DB2CONN or "
            + "DB2ENTRY or  DISPATCHER or  ENQUEUE or  FILE or  JOURNALNAME or  JOURNALNUM or "
            + "JVMPROGRAM or  LSRPOOL or  MONITOR or  MVSTCB or POOL or "
            + "PROGAUTO or  PROGRAM or  RECOVERY or  STATS or  STORAGE or  STREAMNAME or "
            + "SUBPOOL or  SYSDUMPCODE or  TABLEMGR or NODE or TASKSUBPOOL or "
            + "TCLASS or  TCPIP or  TCPIPSERVICE or  TDQUEUE or  TERMINAL or  TRANCLASS or "
            + "TRANDUMPCODE or  TRANSACTION or  TSQUEUE or  VTAM",
        ctx.AUTOINSTALL(),
        ctx.CONNECTION(),
        ctx.DB2CONN(),
        ctx.DB2ENTRY(),
        ctx.DISPATCHER(),
        ctx.ENQUEUE(),
        ctx.FILE(),
        ctx.JOURNALNAME(),
        ctx.JOURNALNUM(),
        ctx.JVMPROGRAM(),
        ctx.LSRPOOL(),
        ctx.MONITOR(),
        ctx.MVSTCB(),
        ctx.POOL(),
        ctx.PROGAUTO(),
        ctx.PROGRAM(),
        ctx.RECOVERY(),
        ctx.STATS(),
        ctx.STORAGE(),
        ctx.STREAMNAME(),
        ctx.SUBPOOL(),
        ctx.SYSDUMPCODE(),
        ctx.TABLEMGR(),
        ctx.NODE(),
        ctx.TASKSUBPOOL(),
        ctx.TCLASS(),
        ctx.TCPIP(),
        ctx.TCPIPSERVICE(),
        ctx.TDQUEUE(),
        ctx.TERMINAL(),
        ctx.TRANCLASS(),
        ctx.TRANDUMPCODE(),
        ctx.TRANSACTION(),
        ctx.TSQUEUE(),
        ctx.VTAM());
    if (ctx.POOL().isEmpty()) {
      checkAllOptionsArePresentOrAbsent("NODE and TARGET", ctx, ctx.NODE(), ctx.TARGET());
    }
  }
}
