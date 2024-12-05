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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_writeq;

/** Checks CICS WRITEQ rules for required and invalid options */
public class CICSWriteqOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_writeq;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.WRITEQ, ErrorSeverity.ERROR);
              put(CICSLexer.TD, ErrorSeverity.ERROR);
              put(CICSLexer.TS, ErrorSeverity.ERROR);
              put(CICSLexer.QUEUE, ErrorSeverity.ERROR);
              put(CICSLexer.FROM, ErrorSeverity.ERROR);
              put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.SYSID, ErrorSeverity.ERROR);
              put(CICSLexer.QNAME, ErrorSeverity.ERROR);
              put(CICSLexer.NUMITEMS, ErrorSeverity.ERROR);
              put(CICSLexer.ITEM, ErrorSeverity.ERROR);
              put(CICSLexer.REWRITE, ErrorSeverity.WARNING);
              put(CICSLexer.AUXILIARY, ErrorSeverity.WARNING);
              put(CICSLexer.MAIN, ErrorSeverity.WARNING);
              put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
            }
          };

  public CICSWriteqOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Writeq rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_writeq_td:
        checkWriteqTd((CICSParser.Cics_writeq_tdContext) ctx);
        break;
      case CICSParser.RULE_cics_writeq_ts:
        checkWriteqTs((CICSParser.Cics_writeq_tsContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkWriteqTd(CICSParser.Cics_writeq_tdContext ctx) {
    checkHasMandatoryOptions(ctx.TD(), ctx, "TD");
    checkHasMandatoryOptions(ctx.QUEUE(), ctx, "QUEUE");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
  }

  @SuppressWarnings("unchecked")
  private void checkWriteqTs(CICSParser.Cics_writeq_tsContext ctx) {
    checkHasExactlyOneOption("QUEUE or QNAME", ctx, ctx.QUEUE(), ctx.QNAME());
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    checkHasMutuallyExclusiveOptions("NUMITEMS or ITEM", ctx.NUMITEMS(), ctx.ITEM());
    if (!ctx.REWRITE().isEmpty()) {
      checkHasMandatoryOptions(ctx.ITEM(), ctx, "ITEM");
    }
    checkHasMutuallyExclusiveOptions("AUXILIARY or MAIN", ctx.AUXILIARY(), ctx.MAIN());
  }
}
