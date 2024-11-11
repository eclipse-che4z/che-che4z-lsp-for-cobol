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
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.*;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_deleteq;
import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_deq;

/** Checks CICS Delete rules for required and invalid options */
public class CICSDeleteqDeqOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX_DELETEQ = RULE_cics_deleteq;
  public static final int RULE_INDEX_DEQ = RULE_cics_deq;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.DELETEQ, ErrorSeverity.ERROR);
              put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
              put(CICSLexer.SYSID, ErrorSeverity.ERROR);
              put(CICSLexer.QNAME, ErrorSeverity.ERROR);
              put(CICSLexer.TD, ErrorSeverity.WARNING);
              put(CICSLexer.TS, ErrorSeverity.WARNING);
              put(CICSLexer.DEQ, ErrorSeverity.ERROR);
              put(CICSLexer.RESOURCE, ErrorSeverity.ERROR);
              put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.MAXLIFETIME, ErrorSeverity.ERROR);
              put(CICSLexer.UOW, ErrorSeverity.WARNING);
              put(CICSLexer.TASK, ErrorSeverity.WARNING);
            }
          };

  public CICSDeleteqDeqOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS DELETEQ and DEQ rule options
   *
   * @param ctx ParserRuleContext subclass containging options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_deleteq_td:
        checkDeleteqTd((CICSParser.Cics_deleteq_tdContext) ctx);
        break;
      case CICSParser.RULE_cics_deleteq_ts:
        checkDeleteqTs((CICSParser.Cics_deleteq_tsContext) ctx);
        break;
      case CICSParser.RULE_cics_deq_cmds:
        checkDeqCmds((CICSParser.Cics_deq_cmdsContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

   private void checkDeleteqTd(CICSParser.Cics_deleteq_tdContext ctx) {
    checkHasMandatoryOptions(ctx.QUEUE(), ctx, "QUEUE");
  }

  @SuppressWarnings("unchecked")
  private void checkDeleteqTs(CICSParser.Cics_deleteq_tsContext ctx) {
    checkHasExactlyOneOption("QUEUE or QNAME", ctx, ctx.cics_queue_qname());
  }

  @SuppressWarnings("unchecked")
  private void checkDeqCmds(CICSParser.Cics_deq_cmdsContext ctx) {
    checkHasMandatoryOptions(ctx.RESOURCE(), ctx, "RESOURCE");
    checkHasMutuallyExclusiveOptions("UOW or MAXLIFETIME or TASK", ctx.UOW(), ctx.MAXLIFETIME(), ctx.TASK());
  }
}
