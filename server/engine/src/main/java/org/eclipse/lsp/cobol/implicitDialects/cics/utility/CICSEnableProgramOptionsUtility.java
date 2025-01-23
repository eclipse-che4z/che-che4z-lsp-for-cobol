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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_enable;
import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_enable_program;


/** Checks CICS ENABLE PROGRAM rules for required and invalid options */
public class CICSEnableProgramOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_enable;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.ENTRY, ErrorSeverity.ERROR);
          put(CICSLexer.ENTRYNAME, ErrorSeverity.ERROR);
          put(CICSLexer.EXIT, ErrorSeverity.ERROR);
          put(CICSLexer.FORMATEDF, ErrorSeverity.WARNING);
          put(CICSLexer.GALENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.GALOCATION, ErrorSeverity.ERROR);
          put(CICSLexer.GAEXECUTABLE, ErrorSeverity.WARNING);
          put(CICSLexer.GAENTRYNAME, ErrorSeverity.ERROR);
          put(CICSLexer.INDOUBTWAIT, ErrorSeverity.WARNING);
          put(CICSLexer.LINKEDITMODE, ErrorSeverity.WARNING);
          put(CICSLexer.QUASIRENT, ErrorSeverity.WARNING);
          put(CICSLexer.THREADSAFE, ErrorSeverity.WARNING);
          put(CICSLexer.OPENAPI, ErrorSeverity.WARNING);
          put(CICSLexer.REQUIRED, ErrorSeverity.WARNING);
          put(CICSLexer.PURGEABLE, ErrorSeverity.WARNING);
          put(CICSLexer.SHUTDOWN, ErrorSeverity.WARNING);
          put(CICSLexer.SPI, ErrorSeverity.WARNING);
          put(CICSLexer.START, ErrorSeverity.WARNING);
          put(CICSLexer.TALENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.TAEXECUTABLE, ErrorSeverity.WARNING);
          put(CICSLexer.TASKSTART, ErrorSeverity.WARNING);
        }
      };

  public CICSEnableProgramOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS TEST EVENT rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == RULE_cics_enable_program) {
      checkEnableProgram((CICSParser.Cics_enable_programContext) ctx);
    }
    checkDuplicates(ctx);
  }

  private void checkEnableProgram(CICSParser.Cics_enable_programContext ctx) {
    checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");
    checkHasMutuallyExclusiveOptions("GALENGTH or GAENTRYNAME", ctx.GALENGTH(), ctx.GAENTRYNAME());
    if (ctx.GALENGTH().isEmpty()) {
      checkHasIllegalOptions(ctx.GAEXECUTABLE(), "GAEXECUTABLE without GALENGTH");
      checkHasIllegalOptions(ctx.GALOCATION(), "GALOCATION without GALENGTH");
    }
    checkHasMutuallyExclusiveOptions("QUASIRENT or THREADSAFE or REQUIRED", ctx.QUASIRENT(), ctx.THREADSAFE(), ctx.REQUIRED());
    checkHasMutuallyExclusiveOptions("QUASIRENT or OPENAPI", ctx.QUASIRENT(), ctx.OPENAPI());
    if (ctx.TALENGTH().isEmpty()) {
      checkHasIllegalOptions(ctx.TAEXECUTABLE(), "TAEXECUTABLE without TALENGTH");
    }
  }
}
