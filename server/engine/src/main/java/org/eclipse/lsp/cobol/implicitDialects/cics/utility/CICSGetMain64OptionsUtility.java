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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_getmain64;

/** Checks CICS GETMAIN64 rules for required and invalid options */
public class CICSGetMain64OptionsUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_getmain64;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.LOCATION, ErrorSeverity.ERROR);
          put(CICSLexer.EXECUTABLE, ErrorSeverity.WARNING);
          put(CICSLexer.SHARED, ErrorSeverity.WARNING);
          put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
          put(CICSLexer.USERDATAKEY, ErrorSeverity.WARNING);
          put(CICSLexer.CICSDATAKEY, ErrorSeverity.WARNING);
        }
      };

  public CICSGetMain64OptionsUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS GETMAIN64 rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getParent().getRuleIndex() == CICSParser.RULE_cics_getmain64) {
      checkGetMain((CICSParser.Cics_getmain64Context) ctx.getParent());
    }
    checkDuplicates(ctx.getParent());
  }

  @SuppressWarnings("unchecked")
  private void checkGetMain(CICSParser.Cics_getmain64Context ctx) {
    checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
    checkHasMandatoryOptions(ctx.FLENGTH(), ctx, "FLENGTH");
    if (ctx.LOCATION().isEmpty()) checkHasIllegalOptions(ctx.EXECUTABLE(), "EXECUTABLE without LOCATION");
    checkHasMutuallyExclusiveOptions("USERDATAKEY or CICSDATAKEY", ctx.USERDATAKEY(), ctx.CICSDATAKEY());
  }
}
