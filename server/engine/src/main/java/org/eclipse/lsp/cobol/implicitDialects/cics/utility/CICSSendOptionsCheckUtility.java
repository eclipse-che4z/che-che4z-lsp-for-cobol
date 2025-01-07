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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_send;

/** Checks CICS Send rules for required and invalid options */
public class CICSSendOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_send;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.SEND, ErrorSeverity.ERROR);
          put(CICSLexer.FROM, ErrorSeverity.ERROR);
          put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.FLENGTH, ErrorSeverity.ERROR);
          put(CICSLexer.WAIT, ErrorSeverity.WARNING);
          put(CICSLexer.INVITE, ErrorSeverity.WARNING);
          put(CICSLexer.LAST, ErrorSeverity.WARNING);
          put(CICSLexer.DEFRESP, ErrorSeverity.WARNING);
          put(CICSLexer.FMH, ErrorSeverity.WARNING);
          put(CICSLexer.CTLCHAR, ErrorSeverity.ERROR);
          put(CICSLexer.ERASE, ErrorSeverity.WARNING);
          put(CICSLexer.DEFAULT, ErrorSeverity.WARNING);
          put(CICSLexer.ALTERNATE, ErrorSeverity.WARNING);
          put(CICSLexer.CNOTCOMPL, ErrorSeverity.WARNING);
          put(CICSLexer.CONVID, ErrorSeverity.ERROR);
          put(CICSLexer.CONFIRM, ErrorSeverity.WARNING);
          put(CICSLexer.STATE, ErrorSeverity.ERROR);
          put(CICSLexer.STRFIELD, ErrorSeverity.WARNING);
          put(CICSLexer.SESSION, ErrorSeverity.ERROR);
          put(CICSLexer.ATTACHID, ErrorSeverity.ERROR);
          put(CICSLexer.LDC, ErrorSeverity.ERROR);
          put(CICSLexer.LINEADDR, ErrorSeverity.ERROR);
          put(CICSLexer.LEAVEKB, ErrorSeverity.WARNING);
          put(CICSLexer.PASSBK, ErrorSeverity.WARNING);
          put(CICSLexer.CBUFF, ErrorSeverity.WARNING);
          put(CICSLexer.CONTROL, ErrorSeverity.ERROR);
          put(CICSLexer.CURSOR, ErrorSeverity.ERROR);
          put(CICSLexer.FORMFEED, ErrorSeverity.WARNING);
          put(CICSLexer.ERASEAUP, ErrorSeverity.WARNING);
          put(CICSLexer.PRINT, ErrorSeverity.WARNING);
          put(CICSLexer.FREEKB, ErrorSeverity.WARNING);
          put(CICSLexer.ALARM, ErrorSeverity.WARNING);
          put(CICSLexer.FRSET, ErrorSeverity.WARNING);
          put(CICSLexer.MSR, ErrorSeverity.ERROR);
          put(CICSLexer.OUTPARTN, ErrorSeverity.ERROR);
          put(CICSLexer.ACTPARTN, ErrorSeverity.ERROR);
          put(CICSLexer.ACCUM, ErrorSeverity.WARNING);
          put(CICSLexer.SET, ErrorSeverity.ERROR);
          put(CICSLexer.PAGING, ErrorSeverity.WARNING);
          put(CICSLexer.TERMINAL, ErrorSeverity.ERROR);
          put(CICSLexer.REQID, ErrorSeverity.ERROR);
          put(CICSLexer.HONEOM, ErrorSeverity.WARNING);
          put(CICSLexer.L40, ErrorSeverity.WARNING);
          put(CICSLexer.L64, ErrorSeverity.WARNING);
          put(CICSLexer.L80, ErrorSeverity.WARNING);
          put(CICSLexer.MAP, ErrorSeverity.ERROR);
          put(CICSLexer.MAPSET, ErrorSeverity.ERROR);
          put(CICSLexer.DATAONLY, ErrorSeverity.WARNING);
          put(CICSLexer.MAPONLY, ErrorSeverity.WARNING);
          put(CICSLexer.NLEOM, ErrorSeverity.WARNING);
          put(CICSLexer.FMHPARM, ErrorSeverity.ERROR);
          put(CICSLexer.NOFLUSH, ErrorSeverity.WARNING);
          put(CICSLexer.MAPPINGDEV, ErrorSeverity.ERROR);
          put(CICSLexer.PAGE, ErrorSeverity.ERROR);
          put(CICSLexer.RELEASE, ErrorSeverity.WARNING);
          put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
          put(CICSLexer.TRAILER, ErrorSeverity.ERROR);
          put(CICSLexer.RETAIN, ErrorSeverity.WARNING);
          put(CICSLexer.AUTOPAGE, ErrorSeverity.WARNING);
          put(CICSLexer.CURRENT, ErrorSeverity.WARNING);
          put(CICSLexer.ALL, ErrorSeverity.WARNING);
          put(CICSLexer.NOAUTOPAGE, ErrorSeverity.WARNING);
          put(CICSLexer.OPERPURGE, ErrorSeverity.WARNING);
          put(CICSLexer.PARTNSET, ErrorSeverity.ERROR);
          put(CICSLexer.TEXT, ErrorSeverity.ERROR);
          put(CICSLexer.HEADER, ErrorSeverity.ERROR);
          put(CICSLexer.JUSTIFY, ErrorSeverity.ERROR);
          put(CICSLexer.JUSFIRST, ErrorSeverity.WARNING);
          put(CICSLexer.JUSLAST, ErrorSeverity.WARNING);
          put(CICSLexer.MAPPED, ErrorSeverity.WARNING);
          put(CICSLexer.NOEDIT, ErrorSeverity.WARNING);
        }
      };


  public CICSSendOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Send rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_send_group1:
        checkGroup1((CICSParser.Cics_send_group1Context) ctx);
        break;
      case CICSParser.RULE_cics_send_control_map:
        checkControl((CICSParser.Cics_send_control_mapContext) ctx);
        break;
      case CICSParser.RULE_cics_send_mappingdev:
        checkMappingdev((CICSParser.Cics_send_mappingdevContext) ctx);
        break;
      case CICSParser.RULE_cics_send_page:
        checkPage((CICSParser.Cics_send_pageContext) ctx);
        break;
      case CICSParser.RULE_cics_send_text:
        checkText((CICSParser.Cics_send_textContext) ctx);
        break;
      case CICSParser.RULE_cics_send_text_mapped:
        checkTextMapped((CICSParser.Cics_send_text_mappedContext) ctx);
        break;
      case CICSParser.RULE_cics_send_text_noedit:
        checkTextNoedit((CICSParser.Cics_send_text_noeditContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkGroup1(CICSParser.Cics_send_group1Context ctx) {
    checkHasMutuallyExclusiveOptions("LENGTH or FLENGTH", ctx.LENGTH(), ctx.FLENGTH());
    checkHasMutuallyExclusiveOptions("INVITE or LAST", ctx.INVITE(), ctx.LAST());
    checkHasMutuallyExclusiveOptions("STRFIELD or ERASE", ctx.STRFIELD(), ctx.ERASE());
    checkHasMutuallyExclusiveOptions("DEFAULT or ALTERNATE", ctx.DEFAULT(), ctx.ALTERNATE());
    if (!ctx.LENGTH().isEmpty() || !ctx.FLENGTH().isEmpty() || !ctx.FMH().isEmpty()) {
      checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    }
    checkHasMutuallyExclusiveOptions("STRFIELD or CTLCHAR", ctx.STRFIELD(), ctx.CTLCHAR());
    checkHasMutuallyExclusiveOptions("ATTACHID  or CTLCHAR", ctx.ATTACHID(), ctx.CTLCHAR());
    checkHasMutuallyExclusiveOptions("CONFIRM or WAIT", ctx.CONFIRM(), ctx.WAIT());
    checkHasMutuallyExclusiveOptions("CNOTCOMPL or DEFRESP", ctx.CNOTCOMPL(), ctx.DEFRESP());
    checkHasMutuallyExclusiveOptions("LDC or FMH", ctx.LDC(), ctx.FMH());
    checkHasMutuallyExclusiveOptions("PASSBK or CBUFF or CNOTCOMPL ", ctx.PASSBK(), ctx.CBUFF(), ctx.CNOTCOMPL());
  }

  @SuppressWarnings("unchecked")
  private void checkControl(CICSParser.Cics_send_control_mapContext ctx) {
    checkHasExactlyOneOption("CONTROL or MAP", ctx, ctx.CONTROL(), ctx.MAP());
    checkHasMutuallyExclusiveOptions("ERASE or ERASEAUP", ctx.ERASE(), ctx.ERASEAUP());
    checkHasMutuallyExclusiveOptions("OUTPARTN or LDC", ctx.OUTPARTN(), ctx.LDC());
    checkHasMutuallyExclusiveOptions("ACTPARTN or LDC", ctx.ACTPARTN(), ctx.LDC());
    checkHasMutuallyExclusiveOptions("TERMINAL or SET or PAGING", ctx.TERMINAL(), ctx.SET(), ctx.PAGING());
    if (!ctx.WAIT().isEmpty() || !ctx.LAST().isEmpty()) {
      checkHasMandatoryOptions(ctx.TERMINAL(), ctx, "TERMINAL");
    }
    if (!ctx.LENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    }
    checkHasMutuallyExclusiveOptions("HONEOM or L40 or L64 or L80", ctx.HONEOM(), ctx.L40(), ctx.L64(), ctx.L80());
    checkHasMutuallyExclusiveOptions("DATAONLY or MAPONLY", ctx.DATAONLY(), ctx.MAPONLY());
    checkHasMutuallyExclusiveOptions("FROM or MAPONLY", ctx.FROM(), ctx.MAPONLY());
    checkHasMutuallyExclusiveOptions("LENGTH or MAPONLY", ctx.LENGTH(), ctx.MAPONLY());
    if (!ctx.MAPSET().isEmpty() || !ctx.FROM().isEmpty() || !ctx.DATAONLY().isEmpty() || !ctx.LENGTH().isEmpty()
            || !ctx.MAPONLY().isEmpty() || !ctx.NLEOM().isEmpty() || !ctx.FMHPARM().isEmpty() || !ctx.NOFLUSH().isEmpty()) {
      checkHasMandatoryOptions(ctx.MAP(), ctx, "MAP");
    }
  }

  @SuppressWarnings("unchecked")
  private void checkMappingdev(CICSParser.Cics_send_mappingdevContext ctx) {
    checkHasMandatoryOptions(ctx.MAP(), ctx, "MAP");
    checkHasMandatoryOptions(ctx.MAPPINGDEV(), ctx, "MAPPINGDEV");
    checkHasMandatoryOptions(ctx.SET(), ctx, "SET");
    checkHasMutuallyExclusiveOptions("DATAONLY or MAPONLY", ctx.DATAONLY(), ctx.MAPONLY());
    checkHasMutuallyExclusiveOptions("FROM or MAPONLY", ctx.FROM(), ctx.MAPONLY());
    checkHasMutuallyExclusiveOptions("LENGTH or MAPONLY", ctx.LENGTH(), ctx.MAPONLY());
    checkHasMutuallyExclusiveOptions("ERASE or ERASEAUP", ctx.ERASE(), ctx.ERASEAUP());
    if (!ctx.LENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    }

  }

  @SuppressWarnings("unchecked")
  private void checkPage(CICSParser.Cics_send_pageContext ctx) {
    checkHasMandatoryOptions(ctx.PAGE(), ctx, "PAGE");
    checkHasMutuallyExclusiveOptions("RELEASE or RETAIN", ctx.RELEASE(), ctx.RETAIN());
    if (!ctx.TRANSID().isEmpty()) {
      checkHasMandatoryOptions(ctx.RELEASE(), ctx, "RELEASE");
    }
    checkHasMutuallyExclusiveOptions("AUTOPAGE or NOAUTOPAGE", ctx.AUTOPAGE(), ctx.NOAUTOPAGE());
    if (!ctx.CURRENT().isEmpty() || !ctx.ALL().isEmpty()) {
      checkHasMandatoryOptions(ctx.AUTOPAGE(), ctx, "AUTOPAGE");
    }
    checkHasMutuallyExclusiveOptions("CURRENT or ALL", ctx.CURRENT(), ctx.ALL());
  }

  @SuppressWarnings("unchecked")
  private void checkText(CICSParser.Cics_send_textContext ctx) {
    checkHasMandatoryOptions(ctx.TEXT(), ctx, "TEXT");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    checkHasMutuallyExclusiveOptions("DEFAULT or ALTERNATE", ctx.DEFAULT(), ctx.ALTERNATE());
    if (!ctx.LENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    }
    checkHasMutuallyExclusiveOptions("LDC or OUTPARTN", ctx.LDC(), ctx.OUTPARTN());
    checkHasMutuallyExclusiveOptions("LDC or ACTPARTN", ctx.LDC(), ctx.ACTPARTN());
    checkHasMutuallyExclusiveOptions("TERMINAL or SET or PAGING", ctx.TERMINAL(), ctx.SET(), ctx.PAGING());
    checkHasMutuallyExclusiveOptions("JUSTIFY or JUSFIRST or JUSLAST", ctx.JUSTIFY(), ctx.JUSFIRST(), ctx.JUSLAST());
    checkHasMutuallyExclusiveOptions("HONEOM or L40 or L64 or L80", ctx.HONEOM(), ctx.L40(), ctx.L64(), ctx.L80());
  }

  @SuppressWarnings("unchecked")
  private void checkTextMapped(CICSParser.Cics_send_text_mappedContext ctx) {
    checkHasMandatoryOptions(ctx.TEXT(), ctx, "TEXT");
    checkHasMandatoryOptions(ctx.MAPPED(), ctx, "MAPPED");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    checkHasMutuallyExclusiveOptions("TERMINAL or PAGING", ctx.TERMINAL(), ctx.PAGING());
    if (!ctx.LENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    }
  }

  @SuppressWarnings("unchecked")
  private void checkTextNoedit(CICSParser.Cics_send_text_noeditContext ctx) {
    checkHasMandatoryOptions(ctx.TEXT(), ctx, "TEXT");
    checkHasMandatoryOptions(ctx.NOEDIT(), ctx, "NOEDIT");
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    checkHasMutuallyExclusiveOptions("DEFAULT or ALTERNATE", ctx.DEFAULT(), ctx.ALTERNATE());
    if (!ctx.DEFAULT().isEmpty() || !ctx.ALTERNATE().isEmpty()) {
      checkHasMandatoryOptions(ctx.ERASE(), ctx, "ERASE");
    }
    checkHasMutuallyExclusiveOptions("TERMINAL or PAGING", ctx.TERMINAL(), ctx.PAGING());
    checkHasMutuallyExclusiveOptions("HONEOM or L40 or L64 or L80", ctx.HONEOM(), ctx.L40(), ctx.L64(), ctx.L80());
    if (!ctx.LENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    }
  }
}
