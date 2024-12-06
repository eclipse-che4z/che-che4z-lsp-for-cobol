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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_waitcics;

/** Checks CICS WAITCICS rules for required and invalid options */
public class CICSWaitCicsOptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_waitcics;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.WAITCICS, ErrorSeverity.ERROR);
          put(CICSLexer.ECBLIST, ErrorSeverity.ERROR);
          put(CICSLexer.NUMEVENTS, ErrorSeverity.ERROR);
          put(CICSLexer.PURGEABILITY, ErrorSeverity.ERROR);
          put(CICSLexer.PURGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NOTPURGEABLE, ErrorSeverity.ERROR);
          put(CICSLexer.NAME, ErrorSeverity.ERROR);
        }
      };

  public CICSWaitCicsOptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS WAITCICS rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getParent().getRuleIndex() == CICSParser.RULE_cics_waitcics) {
      checkWaitCics((CICSParser.Cics_waitcicsContext) ctx.getParent());
    }
    checkDuplicates(ctx.getParent());
  }

  @SuppressWarnings("unchecked")
  private void checkWaitCics(CICSParser.Cics_waitcicsContext ctx) {
    checkHasMandatoryOptions(ctx.ECBLIST(), ctx, "ECBLIST");
    checkHasMandatoryOptions(ctx.NUMEVENTS(), ctx, "NUMEVENTS");
    checkHasMutuallyExclusiveOptions("PURGEABLE or NOTPURGEABLE or PURGEABILITY", ctx.PURGEABLE(), ctx.NOTPURGEABLE(), ctx.PURGEABILITY());
  }
}
