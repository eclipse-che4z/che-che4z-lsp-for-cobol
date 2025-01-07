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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_startbr;

/** Checks CICS STARTBR rules for required and invalid options */
public class CICSStartbrOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_startbr;

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
              put(CICSLexer.DEBKEY, ErrorSeverity.WARNING);
              put(CICSLexer.DEBREC, ErrorSeverity.WARNING);
              put(CICSLexer.RBA, ErrorSeverity.WARNING);
              put(CICSLexer.RRN, ErrorSeverity.WARNING);
              put(CICSLexer.XRBA, ErrorSeverity.WARNING);
              put(CICSLexer.GTEQ, ErrorSeverity.WARNING);
              put(CICSLexer.EQUAL, ErrorSeverity.WARNING);
            }
          };

  public CICSStartbrOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS STARTBR rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx instanceof CICSParser.Cics_startbr_optionsContext) {
      checkStartbr((CICSParser.Cics_startbr_optionsContext) ctx);
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkStartbr(CICSParser.Cics_startbr_optionsContext ctx) {
    checkHasExactlyOneOption("FILE or DATASET", ctx, ctx.FILE(), ctx.DATASET());
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
    checkHasMutuallyExclusiveOptions("DEBKEY, DEBREC, RBA, RRN, or XRBA",
            ctx.DEBKEY(), ctx.DEBREC(), ctx.RBA(), ctx.RRN(), ctx.XRBA());
    checkHasMutuallyExclusiveOptions("GTEQ or EQUAL", ctx.GTEQ(), ctx.EQUAL());
    if (!ctx.GENERIC().isEmpty()) {
      checkHasMandatoryOptions(ctx.KEYLENGTH(), ctx, "KEYLENGTH");
    }
    if (!ctx.SYSID().isEmpty()) {
      checkHasExactlyOneOption("KEYLENGTH, RBA, RRN, or XRBA", ctx, ctx.KEYLENGTH(), ctx.RBA(), ctx.RRN(), ctx.XRBA());
    }
  }
}
