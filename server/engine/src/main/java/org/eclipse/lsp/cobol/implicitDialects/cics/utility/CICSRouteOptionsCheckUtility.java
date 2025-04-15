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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.*;

import java.util.*;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS ROUTE rules for required and invalid options */
public class CICSRouteOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_route;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
          put(CICSLexer.TIME, ErrorSeverity.ERROR);
          put(CICSLexer.AFTER, ErrorSeverity.WARNING);
          put(CICSLexer.AT, ErrorSeverity.WARNING);
          put(CICSLexer.ERRTERM, ErrorSeverity.ERROR);
          put(CICSLexer.TITLE, ErrorSeverity.ERROR);
          put(CICSLexer.LIST, ErrorSeverity.ERROR);
          put(CICSLexer.OPCLASS, ErrorSeverity.ERROR);
          put(CICSLexer.REQID, ErrorSeverity.ERROR);
          put(CICSLexer.LDC, ErrorSeverity.ERROR);
          put(CICSLexer.NLEOM, ErrorSeverity.WARNING);
        }
      };

  public CICSRouteOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS ROUTE rules for required and invalid options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == RULE_cics_route_body) {
      checkRule((CICSParser.Cics_route_bodyContext) ctx);
      checkDuplicates(ctx);
    }
  }

  private void checkRule(CICSParser.Cics_route_bodyContext ctx) {
    checkMutuallyExclusiveOptions(
        "INTERVAL, TIME, AFTER or AT", ctx.INTERVAL(), ctx.TIME(), ctx.AFTER(), ctx.AT());

    if (!ctx.AFTER().isEmpty() || !ctx.AT().isEmpty()) {
      checkHasAtLeastOneOption(
          "HOURS, MINUTES or SECONDS", ctx, ctx.HOURS(), ctx.MINUTES(), ctx.SECONDS());
    }
  }
}
