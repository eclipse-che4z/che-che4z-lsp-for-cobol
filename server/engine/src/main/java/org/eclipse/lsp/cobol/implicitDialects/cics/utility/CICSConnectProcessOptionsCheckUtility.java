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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_connect;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS Connect Process rules for required and invalid options */
public class CICSConnectProcessOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_connect;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.CONNECT, ErrorSeverity.ERROR);
          put(CICSLexer.PROCESS, ErrorSeverity.ERROR);
          put(CICSLexer.CONVID, ErrorSeverity.ERROR);
          put(CICSLexer.SESSION, ErrorSeverity.ERROR);
          put(CICSLexer.PROCNAME, ErrorSeverity.ERROR);
          put(CICSLexer.PROCLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.PARTNER, ErrorSeverity.ERROR);
          put(CICSLexer.PIPLIST, ErrorSeverity.ERROR);
          put(CICSLexer.PIPLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.SYNCLEVEL, ErrorSeverity.ERROR);
          put(CICSLexer.STATE, ErrorSeverity.ERROR);
        }
      };

  public CICSConnectProcessOptionsCheckUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      CICSCheckUtilityParameters params) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS, params);
  }

  /**
   * Entrypoint to check CICS Connect Process rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == CICSParser.RULE_cics_connect_process) {
      checkConnectProcessOptions((CICSParser.Cics_connect_processContext) ctx);
    }
    checkDuplicates(ctx);
  }

  private void checkConnectProcessOptions(CICSParser.Cics_connect_processContext ctx) {
    checkHasExactlyOneOption("CONVID or SESSION", ctx, ctx.CONVID(), ctx.SESSION());

    if (!ctx.CONVID().isEmpty() || !ctx.SESSION().isEmpty())
      checkHasExactlyOneOption("PROCNAME or PARTNER", ctx, ctx.PROCNAME(), ctx.PARTNER());

    if (!ctx.SESSION().isEmpty()) {
      checkHasIllegalOptions(ctx.PARTNER(), "PARTNER");
      checkHasMandatoryOptions(ctx.PROCNAME(), ctx, "PROCNAME");
    }
    checkHasMandatoryOptions(ctx.SYNCLEVEL(), ctx, "SYNCLEVEL");
    checkOptionalWithLength(ctx.PROCNAME(), ctx.PROCLENGTH(), ctx, "PROCNAME", "PROCLENGTH");
    checkOptionalWithLength(ctx.PIPLIST(), ctx.PIPLENGTH(), ctx, "PIPLIST", "PIPLENGTH");
  }
}
