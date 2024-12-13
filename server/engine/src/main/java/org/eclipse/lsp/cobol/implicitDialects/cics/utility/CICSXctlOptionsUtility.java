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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_xctl;

/** Checks CICS XCTL rules for required and invalid options */
public class CICSXctlOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_xctl;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
          put(CICSLexer.COMMAREA, ErrorSeverity.ERROR);
          put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.INPUTMSG, ErrorSeverity.ERROR);
          put(CICSLexer.INPUTMSGLEN, ErrorSeverity.ERROR);
        }
      };

  public CICSXctlOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS XCTL rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getParent().getRuleIndex() == CICSParser.RULE_cics_xctl) {
      checkXctl((CICSParser.Cics_xctlContext) ctx.getParent());
    }
    checkDuplicates(ctx.getParent());
  }

  @SuppressWarnings("unchecked")
  private void checkXctl(CICSParser.Cics_xctlContext ctx) {
    checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");
    checkHasMutuallyExclusiveOptions("COMMAREA or CHANNEL", ctx.COMMAREA(), ctx.CHANNEL());

    if (ctx.COMMAREA().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), "LENGTH without COMMAREA");
    if (ctx.INPUTMSG().isEmpty()) checkHasIllegalOptions(ctx.INPUTMSGLEN(), "INPUTMSGLEN without INPUTMSG");
  }
}
