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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_resetbr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS RESETBR rules for required and invalid options */
public class CICSResetbrOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_resetbr;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.FILE, ErrorSeverity.ERROR);
          put(CICSLexer.DATASET, ErrorSeverity.ERROR);
          put(CICSLexer.RIDFLD, ErrorSeverity.ERROR);
          put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.GENERIC, ErrorSeverity.WARNING);
          put(CICSLexer.REQID, ErrorSeverity.ERROR);
          put(CICSLexer.SYSID, ErrorSeverity.ERROR);
          put(CICSLexer.GTEQ, ErrorSeverity.WARNING);
          put(CICSLexer.EQUAL, ErrorSeverity.WARNING);
          put(CICSLexer.RBA, ErrorSeverity.WARNING);
          put(CICSLexer.RRN, ErrorSeverity.WARNING);
          put(CICSLexer.XRBA, ErrorSeverity.WARNING);
        }
      };

  public CICSResetbrOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS RESETBR rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleConteCics_resetbr_optionsContextxt
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx instanceof CICSParser.Cics_resetbr_optionsContext) {
      checkResetbr((CICSParser.Cics_resetbr_optionsContext) ctx);
    }
    checkDuplicates(ctx);
  }

  private void checkResetbr(CICSParser.Cics_resetbr_optionsContext ctx) {
    checkHasExactlyOneOption("FILE or DATASET", ctx, ctx.FILE(), ctx.DATASET());
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
    checkHasMutuallyExclusiveOptions(
        "RBA, RRN, XRBA or KEYLENGTH", ctx.RBA(), ctx.RRN(), ctx.XRBA(), ctx.KEYLENGTH());
    checkHasMutuallyExclusiveOptions("GTEQ or EQUAL", ctx.GTEQ(), ctx.EQUAL());
    checkPrerequisiteIsMet(ctx.KEYLENGTH(), ctx.GENERIC(), ctx, "GENERIC");
    if (!ctx.SYSID().isEmpty())
      checkHasExactlyOneOption(
          "RBA, RRN, XRBA or KEYLENGTH", ctx, ctx.RBA(), ctx.RRN(), ctx.XRBA(), ctx.KEYLENGTH());
  }
}
