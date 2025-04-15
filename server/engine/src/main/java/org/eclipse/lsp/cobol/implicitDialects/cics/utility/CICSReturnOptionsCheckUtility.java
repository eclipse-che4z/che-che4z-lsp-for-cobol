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

/** Checks CICS RETURN rules for required and invalid options */
public class CICSReturnOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_return;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.COMMAREA, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
          put(CICSLexer.IMMEDIATE, ErrorSeverity.WARNING);
          put(CICSLexer.INPUTMSG, ErrorSeverity.ERROR);
          put(CICSLexer.INPUTMSGLEN, ErrorSeverity.ERROR);
          put(CICSLexer.ENDACTIVITY, ErrorSeverity.WARNING);
        }
      };

  public CICSReturnOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS RETURN rules for required and invalid options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == RULE_cics_return_body) {
      checkRule((CICSParser.Cics_return_bodyContext) ctx);
      checkDuplicates(ctx);
    }
  }

  private void checkRule(CICSParser.Cics_return_bodyContext ctx) {
    checkPrerequisiteIsMet(ctx.TRANSID(), ctx.COMMAREA(), ctx, "COMMAREA without TRANSID");
    checkPrerequisiteIsMet(ctx.TRANSID(), ctx.CHANNEL(), ctx, "CHANNEL without TRANSID");
    checkPrerequisiteIsMet(ctx.TRANSID(), ctx.IMMEDIATE(), ctx, "IMMEDIATE without TRANSID");

    checkMutuallyExclusiveOptions("COMMAREA or CHANNEL", ctx.COMMAREA(), ctx.CHANNEL());
    checkMutuallyExclusiveOptions("TRANSID or ENDACTIVITY", ctx.TRANSID(), ctx.ENDACTIVITY());

    checkPrerequisiteIsMet(ctx.COMMAREA(), ctx.LENGTH(), ctx, "LENGTH without COMMAREA");

    checkPrerequisiteIsMet(ctx.INPUTMSG(), ctx.INPUTMSGLEN(), ctx, "INPUTMSGLEN without INPUTMSG");
  }
}
