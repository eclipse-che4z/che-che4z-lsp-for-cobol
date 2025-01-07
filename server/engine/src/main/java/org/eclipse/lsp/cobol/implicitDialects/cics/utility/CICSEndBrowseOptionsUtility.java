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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_endbrowse;
import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_endbrowse_opts;

/** Checks CICS Extract rules for required and invalid options */
public class CICSEndBrowseOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_endbrowse;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ACTIVITY, ErrorSeverity.WARNING);
          put(CICSLexer.BROWSETOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.CONTAINER, ErrorSeverity.WARNING);
          put(CICSLexer.EVENT, ErrorSeverity.WARNING);
          put(CICSLexer.PROCESS, ErrorSeverity.WARNING);
          put(CICSLexer.TIMER, ErrorSeverity.WARNING);
          put(CICSLexer.RETCODE, ErrorSeverity.ERROR);
        }
      };

  public CICSEndBrowseOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Extract rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
      if (ctx.getRuleIndex() == RULE_cics_endbrowse_opts) {
          checkEndBrowse((CICSParser.Cics_endbrowse_optsContext) ctx);
      }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkEndBrowse(CICSParser.Cics_endbrowse_optsContext ctx) {
    checkHasExactlyOneOption("ACTIVITY or CONTAINER or EVENT or PROCESS or TIMER", ctx,
            ctx.ACTIVITY(), ctx.CONTAINER(), ctx.EVENT(), ctx.PROCESS(), ctx.TIMER());

    checkHasMandatoryOptions(ctx.BROWSETOKEN(), ctx, "BROWSETOKEN");
//    TODO: https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/pull/2596 (RETCODE is only mandatory in the EXCI mode.)
//    if (!ctx.CONTAINER().isEmpty()) {
//      checkHasMandatoryOptions(ctx.RETCODE(), ctx, "RETCODE");
//    }
  }
}
