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
              put(CICSLexer.HANDLE, ErrorSeverity.ERROR);
              put(CICSLexer.ABEND, ErrorSeverity.ERROR);
              put(CICSLexer.CANCEL, ErrorSeverity.WARNING);
              put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
              put(CICSLexer.LABEL, ErrorSeverity.ERROR);
              put(CICSLexer.RESET, ErrorSeverity.WARNING);
              put(CICSLexer.AID, ErrorSeverity.ERROR);
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
              put(CICSLexer.CONDITION, ErrorSeverity.ERROR);
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
    checkHasMandatoryOptions(ctx.cics_conditions(), ctx, "CICS CONDITION");
  }
}
