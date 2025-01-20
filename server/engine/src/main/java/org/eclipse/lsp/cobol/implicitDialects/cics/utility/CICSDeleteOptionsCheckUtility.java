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

import java.util.*;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_delete;

/** Checks CICS Delete rules for required and invalid options */
public class CICSDeleteOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_delete;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.DELETE, ErrorSeverity.ERROR);
              put(CICSLexer.FILE, ErrorSeverity.ERROR);
              put(CICSLexer.TOKEN, ErrorSeverity.ERROR);
              put(CICSLexer.RIDFLD, ErrorSeverity.ERROR);
              put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.NUMREC, ErrorSeverity.ERROR);
              put(CICSLexer.SYSID, ErrorSeverity.ERROR);
              put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
              put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
              put(CICSLexer.CONTAINER, ErrorSeverity.ERROR);
              put(CICSLexer.COUNTER, ErrorSeverity.ERROR);
              put(CICSLexer.DCOUNTER, ErrorSeverity.ERROR);
              put(CICSLexer.POOL, ErrorSeverity.ERROR);
              put(CICSLexer.EVENT, ErrorSeverity.ERROR);
              put(CICSLexer.TIMER, ErrorSeverity.ERROR);
              put(CICSLexer.GENERIC, ErrorSeverity.WARNING);
              put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
              put(CICSLexer.RBA, ErrorSeverity.WARNING);
              put(CICSLexer.RRN, ErrorSeverity.WARNING);
              put(CICSLexer.ACQACTIVITY, ErrorSeverity.WARNING);
              put(CICSLexer.PROCESS, ErrorSeverity.WARNING);
              put(CICSLexer.ACQPROCESS, ErrorSeverity.WARNING);
            }
          };

  public CICSDeleteOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS DELETE rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_delete_group_one:
        checkDeleteGroupOne((CICSParser.Cics_delete_group_oneContext) ctx);
        break;
      case CICSParser.RULE_cics_delete_group_two:
        checkDeleteGroupTwo((CICSParser.Cics_delete_group_twoContext) ctx);
        break;
      case CICSParser.RULE_cics_delete_group_three:
        checkDeleteGroupThree((CICSParser.Cics_delete_group_threeContext) ctx);
        break;
      case CICSParser.RULE_cics_delete_group_four:
        checkDeleteGroupFour((CICSParser.Cics_delete_group_fourContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkDeleteGroupOne(CICSParser.Cics_delete_group_oneContext ctx) {
    checkHasMandatoryOptions(ctx.cics_file_name(), ctx, "FILE");
    List<TerminalNode> file = ctx.cics_file_name().stream().map(CICSParser.Cics_file_nameContext::FILE).collect(Collectors.toList());
    List<TerminalNode> dataset = ctx.cics_file_name().stream().map(CICSParser.Cics_file_nameContext::DATASET).collect(Collectors.toList());
    checkHasMutuallyExclusiveOptions("FILE or DATASET", file, dataset);

    checkHasMutuallyExclusiveOptions("TOKEN or RIDFLD", ctx.TOKEN(), ctx.RIDFLD());

    if (ctx.RIDFLD().isEmpty()) checkHasIllegalOptions(ctx.cics_keylength(), "KEYLENGTH");
    if (ctx.cics_keylength().isEmpty())  checkHasIllegalOptions(ctx.GENERIC(), "GENERIC");
    if (ctx.GENERIC().isEmpty())  checkHasIllegalOptions(ctx.NUMREC(), "NUMREC");

    checkHasMutuallyExclusiveOptions("RBA or RRN", ctx.RBA(), ctx.RRN());
  }

  @SuppressWarnings("unchecked")
  private void checkDeleteGroupTwo(CICSParser.Cics_delete_group_twoContext ctx) {
    checkHasExactlyOneOption("CHANNEL or EVENT or TIMER", ctx, ctx.CHANNEL(), ctx.EVENT(), ctx.TIMER());
  }

  @SuppressWarnings("unchecked")
  private void checkDeleteGroupThree(CICSParser.Cics_delete_group_threeContext ctx) {
    checkHasMandatoryOptions(ctx.CONTAINER(), ctx, "CONTAINER");
    checkHasMutuallyExclusiveOptions("ACTIVITY or ACQACTIVITY or PROCESS or ACQPROCESS or CHANNEL",
            ctx.ACTIVITY(), ctx.ACQACTIVITY(), ctx.PROCESS(), ctx.ACQPROCESS(), ctx.CHANNEL());
  }

  @SuppressWarnings("unchecked")
  private void checkDeleteGroupFour(CICSParser.Cics_delete_group_fourContext ctx) {
    checkHasExactlyOneOption("COUNTER or DCOUNTER", ctx, ctx.cics_counter_dcounter());
  }
}
