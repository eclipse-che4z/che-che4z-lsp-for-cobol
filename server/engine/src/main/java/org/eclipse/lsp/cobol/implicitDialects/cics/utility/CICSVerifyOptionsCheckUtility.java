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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_verify;

/** Checks CICS VERIFY rules for required and invalid options */
public class CICSVerifyOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_verify;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.PASSWORD, ErrorSeverity.ERROR);
              put(CICSLexer.USERID, ErrorSeverity.ERROR);
              put(CICSLexer.GROUPID, ErrorSeverity.ERROR);
              put(CICSLexer.CHANGETIME, ErrorSeverity.ERROR);
              put(CICSLexer.DAYSLEFT, ErrorSeverity.ERROR);
              put(CICSLexer.ESMREASON, ErrorSeverity.ERROR);
              put(CICSLexer.ESMRESP, ErrorSeverity.ERROR);
              put(CICSLexer.EXPIRYTIME, ErrorSeverity.ERROR);
              put(CICSLexer.INVALIDCOUNT, ErrorSeverity.ERROR);
              put(CICSLexer.LASTUSETIME, ErrorSeverity.ERROR);
              put(CICSLexer.PHRASE, ErrorSeverity.ERROR);
              put(CICSLexer.PHRASELEN, ErrorSeverity.ERROR);
              put(CICSLexer.TOKEN, ErrorSeverity.ERROR);
              put(CICSLexer.TOKENLEN, ErrorSeverity.ERROR);
              put(CICSLexer.TOKENTYPE, ErrorSeverity.ERROR);
              put(CICSLexer.ISUSERID, ErrorSeverity.ERROR);
              put(CICSLexer.DATATYPE, ErrorSeverity.ERROR);
              put(CICSLexer.ENCRYPTKEY, ErrorSeverity.ERROR);
              put(CICSLexer.OUTTOKEN, ErrorSeverity.ERROR);
              put(CICSLexer.OUTTOKENLEN, ErrorSeverity.ERROR);
              put(CICSLexer.BASICAUTH, ErrorSeverity.WARNING);
              put(CICSLexer.JWT, ErrorSeverity.WARNING);
              put(CICSLexer.KERBEROS, ErrorSeverity.WARNING);
              put(CICSLexer.BIT, ErrorSeverity.WARNING);
              put(CICSLexer.BASE64, ErrorSeverity.WARNING);
            }
          };
  public CICSVerifyOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Verify rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_verify_password:
        checkVerifyPassword((CICSParser.Cics_verify_passwordContext) ctx);
        break;
      case CICSParser.RULE_cics_verify_phrase:
        checkVerifyPhrase((CICSParser.Cics_verify_phraseContext) ctx);
        break;
      case CICSParser.RULE_cics_verify_token:
        checkVerifyToken((CICSParser.Cics_verify_tokenContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkVerifyPassword(CICSParser.Cics_verify_passwordContext ctx) {
    checkHasMandatoryOptions(ctx.PASSWORD(), ctx, "PASSWORD");
    checkHasMandatoryOptions(ctx.USERID(), ctx, "USERID");
  }

  private void checkVerifyPhrase(CICSParser.Cics_verify_phraseContext ctx) {
    checkHasMandatoryOptions(ctx.PHRASE(), ctx, "PHRASE");
    checkHasMandatoryOptions(ctx.PHRASELEN(), ctx, "PHRASELEN");
    checkHasMandatoryOptions(ctx.USERID(), ctx, "USERID");
  }

  @SuppressWarnings("unchecked")
  private void checkVerifyToken(CICSParser.Cics_verify_tokenContext ctx) {
    checkHasMandatoryOptions(ctx.TOKEN(), ctx, "TOKEN");
    checkHasMandatoryOptions(ctx.TOKENLEN(), ctx, "TOKENLEN");
    checkHasExactlyOneOption("TOKENTYPE or BASICAUTH or JWT or KERBEROS", ctx, ctx.TOKENTYPE(), ctx.BASICAUTH(), ctx.JWT(), ctx.KERBEROS());
    checkHasMutuallyExclusiveOptions("BIT or DATATYPE or BASE64", ctx.BIT(), ctx.DATATYPE(), ctx.BASE64());
    if (!ctx.OUTTOKENLEN().isEmpty()) {
      checkHasMandatoryOptions(ctx.OUTTOKEN(), ctx, "OUTTOKEN");
    }
    if (!ctx.OUTTOKEN().isEmpty()) {
      checkHasMandatoryOptions(ctx.OUTTOKENLEN(), ctx, "OUTTOKENLEN");
    }
  }
}
