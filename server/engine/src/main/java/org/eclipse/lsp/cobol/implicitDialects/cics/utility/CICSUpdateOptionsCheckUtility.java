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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_update;

/** Checks CICS UPDATE COUNTER and UPDATE DCOUNTER rules for required and invalid options */
public class CICSUpdateOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_update;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.COUNTER, ErrorSeverity.ERROR);
              put(CICSLexer.DCOUNTER, ErrorSeverity.ERROR);
              put(CICSLexer.POOL, ErrorSeverity.ERROR);
              put(CICSLexer.VALUE, ErrorSeverity.ERROR);
              put(CICSLexer.COMPAREMIN, ErrorSeverity.ERROR);
              put(CICSLexer.COMPAREMAX, ErrorSeverity.ERROR);
              put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
            }
          };

  public CICSUpdateOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Update rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
      if (ctx.getRuleIndex() == CICSParser.RULE_cics_update_counter_dcounter) {
          checkUpdateCounterDcounter((CICSParser.Cics_update_counter_dcounterContext) ctx);
      }
    checkDuplicates(ctx);
  }

  private void checkUpdateCounterDcounter(CICSParser.Cics_update_counter_dcounterContext ctx) {
    checkHasExactlyOneOption("COUNTER or DCOUNTER", ctx, ctx.COUNTER(), ctx.DCOUNTER());
    checkHasMandatoryOptions(ctx.VALUE(), ctx, "VALUE");
  }
}

