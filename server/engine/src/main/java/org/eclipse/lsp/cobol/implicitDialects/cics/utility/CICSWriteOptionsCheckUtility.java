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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_write;

/** Checks CICS Write rules for required and invalid options */
public class CICSWriteOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_write;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.WRITE, ErrorSeverity.ERROR);
              put(CICSLexer.FILE, ErrorSeverity.ERROR);
              put(CICSLexer.DATASET, ErrorSeverity.ERROR);
              put(CICSLexer.MASSINSERT, ErrorSeverity.WARNING);
              put(CICSLexer.FROM, ErrorSeverity.ERROR);
              put(CICSLexer.RIDFLD, ErrorSeverity.ERROR);
              put(CICSLexer.KEYLENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.SYSID, ErrorSeverity.ERROR);
              put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.RBA, ErrorSeverity.WARNING);
              put(CICSLexer.RRN, ErrorSeverity.WARNING);
              put(CICSLexer.XRBA, ErrorSeverity.WARNING);
              put(CICSLexer.NOSUSPEND, ErrorSeverity.WARNING);
              put(CICSLexer.JOURNALNAME, ErrorSeverity.ERROR);
              put(CICSLexer.JTYPEID, ErrorSeverity.ERROR);
              put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.REQID, ErrorSeverity.ERROR);
              put(CICSLexer.PREFIX, ErrorSeverity.ERROR);
              put(CICSLexer.PFXLENG, ErrorSeverity.ERROR);
              put(CICSLexer.WAIT, ErrorSeverity.WARNING);
              put(CICSLexer.OPERATOR, ErrorSeverity.ERROR);
              put(CICSLexer.TEXT, ErrorSeverity.ERROR);
              put(CICSLexer.TEXTLENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.ROUTECODES, ErrorSeverity.ERROR);
              put(CICSLexer.NUMROUTES, ErrorSeverity.ERROR);
              put(CICSLexer.CONSNAME, ErrorSeverity.ERROR);
              put(CICSLexer.EVENTUAL, ErrorSeverity.WARNING);
              put(CICSLexer.ACTION, ErrorSeverity.ERROR);
              put(CICSLexer.CRITICAL, ErrorSeverity.WARNING);
              put(CICSLexer.IMMEDIATE, ErrorSeverity.WARNING);
              put(CICSLexer.REPLY, ErrorSeverity.ERROR);
              put(CICSLexer.MAXLENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.REPLYLENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.TIMEOUT, ErrorSeverity.ERROR);
            }
          };

  public CICSWriteOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Write rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_write_file:
        checkWriteFile((CICSParser.Cics_write_fileContext) ctx);
        break;
      case CICSParser.RULE_cics_write_journalname:
        checkWriteJournalname((CICSParser.Cics_write_journalnameContext) ctx);
        break;
      case CICSParser.RULE_cics_write_operator:
        checkWriteOperator((CICSParser.Cics_write_operatorContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkWriteFile(CICSParser.Cics_write_fileContext ctx) {
    checkHasExactlyOneOption("FILE or DATASET", ctx, ctx.FILE(), ctx.DATASET());
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    checkHasMandatoryOptions(ctx.RIDFLD(), ctx, "RIDFLD");
    if (!ctx.SYSID().isEmpty()) {
      checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
    }
    checkHasMutuallyExclusiveOptions("RBA or RRN or XRBA", ctx.RBA(), ctx.RRN(), ctx.XRBA());
  }

  private void checkWriteJournalname(CICSParser.Cics_write_journalnameContext ctx) {
    checkHasMandatoryOptions(ctx.JOURNALNAME(), ctx, "JOURNALNAME");
    checkHasMandatoryOptions(ctx.JTYPEID(), ctx, "JTYPEID");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    if (!ctx.PFXLENG().isEmpty()) {
      checkHasMandatoryOptions(ctx.PREFIX(), ctx, "PREFIX");
    }
  }

  @SuppressWarnings("unchecked")
  private void checkWriteOperator(CICSParser.Cics_write_operatorContext ctx) {
    checkHasMandatoryOptions(ctx.OPERATOR(), ctx, "OPERATOR");
    checkHasMandatoryOptions(ctx.TEXT(), ctx, "TEXT");
    if (!ctx.NUMROUTES().isEmpty()) {
      checkHasMandatoryOptions(ctx.ROUTECODES(), ctx, "ROUTECODES");
    }
    if (!ctx.ROUTECODES().isEmpty()) {
      checkHasMandatoryOptions(ctx.NUMROUTES(), ctx, "NUMROUTES");
    }
    checkHasMutuallyExclusiveOptions("NUMROUTES or CONSNAME", ctx.NUMROUTES(), ctx.CONSNAME());
    checkHasMutuallyExclusiveOptions("ROUTECODES or CONSNAME", ctx.ROUTECODES(), ctx.CONSNAME());

    checkHasMutuallyExclusiveOptions("EVENTUAL or ACTION or CRITICAL or IMMEDIATE or REPLY",
            ctx.EVENTUAL(), ctx.ACTION(), ctx.CRITICAL(), ctx.IMMEDIATE(), ctx.REPLY());
    if (!ctx.TIMEOUT().isEmpty() || !ctx.REPLYLENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.REPLY(), ctx, "REPLY");
    }
    if (!ctx.REPLY().isEmpty()) {
      checkHasMandatoryOptions(ctx.MAXLENGTH(), ctx, "MAXLENGTH");
    }
    if (!ctx.MAXLENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.REPLY(), ctx, "REPLY");
    }
  }
}
