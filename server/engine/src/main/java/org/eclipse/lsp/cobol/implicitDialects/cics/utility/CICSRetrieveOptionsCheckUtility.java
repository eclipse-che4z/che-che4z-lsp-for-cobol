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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_retrieve;

/** Checks CICS RETRIEVE rules for required and invalid options */
public class CICSRetrieveOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_retrieve;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.RETRIEVE, ErrorSeverity.ERROR);
              put(CICSLexer.INTO, ErrorSeverity.ERROR);
              put(CICSLexer.SET, ErrorSeverity.ERROR);
              put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.RTRANSID, ErrorSeverity.ERROR);
              put(CICSLexer.RTERMID, ErrorSeverity.ERROR);
              put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
              put(CICSLexer.WAIT, ErrorSeverity.WARNING);
              put(CICSLexer.REATTACH, ErrorSeverity.ERROR);
              put(CICSLexer.EVENT, ErrorSeverity.ERROR);
              put(CICSLexer.EVENTTYPE, ErrorSeverity.ERROR);
              put(CICSLexer.SUBEVENT, ErrorSeverity.ERROR);
            }
          };

  public CICSRetrieveOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Retrieve rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_retrieve_standard:
        checkRetrieveStandard((CICSParser.Cics_retrieve_standardContext) ctx);
        break;
      case CICSParser.RULE_cics_retrieve_reattach:
        checkRetrieveReattach((CICSParser.Cics_retrieve_reattachContext) ctx);
        break;
      case CICSParser.RULE_cics_retrieve_subevent:
        checkRetrieveSubevent((CICSParser.Cics_retrieve_subeventContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkRetrieveStandard(CICSParser.Cics_retrieve_standardContext ctx) {
    checkHasExactlyOneOption("INTO or SET", ctx, ctx.INTO(), ctx.SET());
  }

  private void checkRetrieveReattach(CICSParser.Cics_retrieve_reattachContext ctx) {
    checkHasMandatoryOptions(ctx.REATTACH(), ctx, "REATTACH");
    checkHasMandatoryOptions(ctx.EVENT(), ctx, "EVENT");
  }

  private void checkRetrieveSubevent(CICSParser.Cics_retrieve_subeventContext ctx) {
    checkHasMandatoryOptions(ctx.SUBEVENT(), ctx, "SUBEVENT");
    checkHasMandatoryOptions(ctx.EVENT(), ctx, "EVENT");
  }
}
