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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_signon;
import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_signon_body;
import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_signon_token_body;

import java.util.*;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

/** Checks CICS SIGNON rules for required and invalid options */
public class CICSSignonOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_signon;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.BASE64, ErrorSeverity.WARNING);
          put(CICSLexer.BIT, ErrorSeverity.WARNING);
          put(CICSLexer.CHANGETIME, ErrorSeverity.ERROR);
          put(CICSLexer.DATATYPE, ErrorSeverity.ERROR);
          put(CICSLexer.DAYSLEFT, ErrorSeverity.ERROR);
          put(CICSLexer.ESMREASON, ErrorSeverity.ERROR);
          put(CICSLexer.ESMRESP, ErrorSeverity.ERROR);
          put(CICSLexer.EXPIRYTIME, ErrorSeverity.ERROR);
          put(CICSLexer.GROUPID, ErrorSeverity.ERROR);
          put(CICSLexer.INVALIDCOUNT, ErrorSeverity.ERROR);
          put(CICSLexer.KERBEROS, ErrorSeverity.WARNING);
          put(CICSLexer.LANGINUSE, ErrorSeverity.ERROR);
          put(CICSLexer.LANGUAGECODE, ErrorSeverity.ERROR);
          put(CICSLexer.LASTUSETIME, ErrorSeverity.ERROR);
          put(CICSLexer.NATLANG, ErrorSeverity.ERROR);
          put(CICSLexer.NATLANGINUSE, ErrorSeverity.ERROR);
          put(CICSLexer.NEWPASSWORD, ErrorSeverity.ERROR);
          put(CICSLexer.NEWPHRASE, ErrorSeverity.ERROR);
          put(CICSLexer.NEWPHRASELEN, ErrorSeverity.ERROR);
          put(CICSLexer.OIDCARD, ErrorSeverity.ERROR);
          put(CICSLexer.PASSWORD, ErrorSeverity.ERROR);
          put(CICSLexer.PHRASE, ErrorSeverity.ERROR);
          put(CICSLexer.PHRASELEN, ErrorSeverity.ERROR);
          put(CICSLexer.TOKEN, ErrorSeverity.ERROR);
          put(CICSLexer.TOKENLEN, ErrorSeverity.ERROR);
          put(CICSLexer.TOKENTYPE, ErrorSeverity.ERROR);
          put(CICSLexer.USERID, ErrorSeverity.ERROR);
        }
      };

  public CICSSignonOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS SIGNON rules for required and invalid options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case RULE_cics_signon_body:
        checkMainBody((CICSParser.Cics_signon_bodyContext) ctx);
        break;
      case RULE_cics_signon_token_body:
        checkToken((CICSParser.Cics_signon_token_bodyContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkMainBody(CICSParser.Cics_signon_bodyContext ctx) {
    checkHasMandatoryOptions(ctx.USERID(), ctx, "USERID");

    checkMutuallyExclusiveOptions("LANGUAGECODE or NATLANG", ctx.LANGUAGECODE(), ctx.NATLANG());
    checkMutuallyExclusiveOptions("PASSWORD or PHRASE", ctx.PASSWORD(), ctx.PHRASE());

    checkPrerequisiteIsMet(ctx.PASSWORD(), ctx.NEWPASSWORD(), ctx, "NEWPASSWORD without PASSWORD");
    checkPrerequisiteIsMet(ctx.PHRASE(), ctx.PHRASELEN(), ctx, "PHRASELEN without PHRASE");
    checkPrerequisiteIsMet(ctx.PHRASE(), ctx.NEWPHRASE(), ctx, "NEWPHRASE without PHRASE");
    checkPrerequisiteIsMet(
        ctx.NEWPHRASE(), ctx.NEWPHRASELEN(), ctx, "NEWPHRASELEN without NEWPHRASE");
  }

  private void checkToken(CICSParser.Cics_signon_token_bodyContext ctx) {
    checkHasExactlyOneOption("TOKENTYPE or KERBEROS", ctx, ctx.TOKENTYPE(), ctx.KERBEROS());
    checkMutuallyExclusiveOptions(
        "BIT, DATATYPE or BASE64", ctx.BIT(), ctx.DATATYPE(), ctx.BASE64());
    checkMutuallyExclusiveOptions("LANGUAGECODE or NATLANG", ctx.LANGUAGECODE(), ctx.NATLANG());

    checkHasMandatoryOptions(ctx.TOKEN(), ctx, "TOKEN");
    checkHasMandatoryOptions(ctx.TOKENLEN(), ctx, "TOKENLEN");
  }
}
