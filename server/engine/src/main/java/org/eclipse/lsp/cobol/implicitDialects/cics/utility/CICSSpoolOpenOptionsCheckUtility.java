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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_spoolopen;

/** Checks CICS SPOOLOPEN rules for required and invalid options */
public class CICSSpoolOpenOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_spoolopen;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.INPUT, ErrorSeverity.ERROR);
              put(CICSLexer.OUTPUT, ErrorSeverity.ERROR);
              put(CICSLexer.TOKEN, ErrorSeverity.ERROR);
              put(CICSLexer.USERID, ErrorSeverity.ERROR);
              put(CICSLexer.CLASS, ErrorSeverity.ERROR);
              put(CICSLexer.NOHANDLE, ErrorSeverity.WARNING);
              put(CICSLexer.NODE, ErrorSeverity.ERROR);
              put(CICSLexer.OUTDESCR, ErrorSeverity.ERROR);
              put(CICSLexer.NOCC, ErrorSeverity.WARNING);
              put(CICSLexer.ASA, ErrorSeverity.WARNING);
              put(CICSLexer.MCC, ErrorSeverity.WARNING);
              put(CICSLexer.PRINT, ErrorSeverity.WARNING);
              put(CICSLexer.PUNCH, ErrorSeverity.WARNING);
              put(CICSLexer.RECORDLENGTH, ErrorSeverity.ERROR);
            }
          };

  public CICSSpoolOpenOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS SpoolOpen rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_spoolopen_input:
        checkSpoolopenInput((CICSParser.Cics_spoolopen_inputContext) ctx);
        break;
      case CICSParser.RULE_cics_spoolopen_output:
        checkSpoolopenOutput((CICSParser.Cics_spoolopen_outputContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkSpoolopenInput(CICSParser.Cics_spoolopen_inputContext ctx) {
    checkHasMandatoryOptions(ctx.INPUT(), ctx, "INPUT");
    checkHasMandatoryOptions(ctx.TOKEN(), ctx, "TOKEN");
    checkHasMandatoryOptions(ctx.USERID(), ctx, "USERID");
  }

  @SuppressWarnings("unchecked")
  private void checkSpoolopenOutput(CICSParser.Cics_spoolopen_outputContext ctx) {
    checkHasMandatoryOptions(ctx.OUTPUT(), ctx, "OUTPUT");
    checkHasMandatoryOptions(ctx.TOKEN(), ctx, "TOKEN");
    checkHasMandatoryOptions(ctx.USERID(), ctx, "USERID");
    checkHasMandatoryOptions(ctx.NODE(), ctx, "NODE");
    checkHasMutuallyExclusiveOptions("NOCC, ASA, or MCC", ctx.NOCC(), ctx.ASA(), ctx.MCC());
    checkHasMutuallyExclusiveOptions("PRINT or PUNCH", ctx.PRINT(), ctx.PUNCH());
    if (!ctx.RECORDLENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.PRINT(), ctx, "PRINT");
    }
  }
}
