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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_post;

/** Checks CICS POST rules for required and invalid options */
public class CICSPostOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_post;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.INTERVAL, ErrorSeverity.ERROR);
              put(CICSLexer.TIME, ErrorSeverity.ERROR);
              put(CICSLexer.AFTER, ErrorSeverity.WARNING);
              put(CICSLexer.AT, ErrorSeverity.WARNING);
              put(CICSLexer.HOURS, ErrorSeverity.ERROR);
              put(CICSLexer.MINUTES, ErrorSeverity.ERROR);
              put(CICSLexer.SECONDS, ErrorSeverity.ERROR);
              put(CICSLexer.SET, ErrorSeverity.ERROR);
              put(CICSLexer.REQID, ErrorSeverity.ERROR);
            }
          };

  public CICSPostOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS POST rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx instanceof CICSParser.Cics_post_optionsContext) {
      checkPost((CICSParser.Cics_post_optionsContext) ctx);
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkPost(CICSParser.Cics_post_optionsContext ctx) {
    checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
    checkHasMutuallyExclusiveOptions("INTERVAL or TIME or AFTER or AT", ctx.INTERVAL(), ctx.TIME(), ctx.AFTER(), ctx.AT());
    if (!ctx.AFTER().isEmpty() || !ctx.AT().isEmpty()) {
      if (ctx.HOURS().isEmpty() && ctx.MINUTES().isEmpty() && ctx.SECONDS().isEmpty()) {
        checkHasMandatoryOptions(ctx.HOURS(), ctx, "HOURS or MINUTES or SECONDS");
      }
    }
    if (!ctx.HOURS().isEmpty() || !ctx.MINUTES().isEmpty() || !ctx.SECONDS().isEmpty()) {
      checkHasExactlyOneOption("AFTER or AT", ctx, ctx.AFTER(), ctx.AT());
    }
  }
}
