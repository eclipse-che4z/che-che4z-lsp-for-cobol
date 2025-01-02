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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_address;

/** Checks CICS ADDRESS rules for required and invalid options */
public class CICSAddressOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_address;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.ADDRESS, ErrorSeverity.ERROR);
              put(CICSLexer.ACEE, ErrorSeverity.ERROR);
              put(CICSLexer.COMMAREA, ErrorSeverity.ERROR);
              put(CICSLexer.CWA, ErrorSeverity.ERROR);
              put(CICSLexer.EIB, ErrorSeverity.ERROR);
              put(CICSLexer.TCTUA, ErrorSeverity.ERROR);
              put(CICSLexer.TWA, ErrorSeverity.ERROR);
              put(CICSLexer.SET, ErrorSeverity.ERROR);
              put(CICSLexer.USING, ErrorSeverity.ERROR);
            }
          };

  public CICSAddressOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Address rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getRuleIndex() == CICSParser.RULE_cics_address_set) {
      checkAddressSet((CICSParser.Cics_address_setContext) ctx);
    }
    checkDuplicates(ctx);
  }

  private void checkAddressSet(CICSParser.Cics_address_setContext ctx) {
    checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
    checkHasMandatoryOptions(ctx.USING(), ctx, "USING");
  }
}
