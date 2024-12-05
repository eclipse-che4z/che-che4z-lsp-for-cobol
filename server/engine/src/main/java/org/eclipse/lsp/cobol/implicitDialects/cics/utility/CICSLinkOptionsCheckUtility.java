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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_link;

/** Checks CICS LINK rules for required and invalid options */
public class CICSLinkOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_link;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.LINK, ErrorSeverity.ERROR);
              put(CICSLexer.PROGRAM, ErrorSeverity.ERROR);
              put(CICSLexer.COMMAREA, ErrorSeverity.ERROR);
              put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.DATALENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
              put(CICSLexer.INPUTMSG, ErrorSeverity.ERROR);
              put(CICSLexer.INPUTMSGLEN, ErrorSeverity.ERROR);
              put(CICSLexer.SYSID, ErrorSeverity.ERROR);
              put(CICSLexer.SYNCONRETURN, ErrorSeverity.WARNING);
              put(CICSLexer.TRANSID, ErrorSeverity.ERROR);
              put(CICSLexer.ACQPROCESS, ErrorSeverity.ERROR);
              put(CICSLexer.INPUTEVENT, ErrorSeverity.ERROR);
              put(CICSLexer.ACTIVITY, ErrorSeverity.ERROR);
              put(CICSLexer.ACQACTIVITY, ErrorSeverity.WARNING);
            }
          };

  public CICSLinkOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }


  /**
   * Entrypoint to check CICS Link rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_link_program:
        checkLinkProgram((CICSParser.Cics_link_programContext) ctx);
        break;
      case CICSParser.RULE_cics_link_acqprocess:
        checkLinkAcqprocess((CICSParser.Cics_link_acqprocessContext) ctx);
        break;
      case CICSParser.RULE_cics_link_activity:
        checkLinkActivity((CICSParser.Cics_link_activityContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkLinkProgram(CICSParser.Cics_link_programContext ctx) {
    checkHasMandatoryOptions(ctx.PROGRAM(), ctx, "PROGRAM");
    checkHasMutuallyExclusiveOptions("COMMAREA or CHANNEL", ctx.COMMAREA(), ctx.CHANNEL());
    if (!ctx.LENGTH().isEmpty() || !ctx.DATALENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.COMMAREA(), ctx, "COMMAREA");
    }
    if (!ctx.INPUTMSGLEN().isEmpty()) {
      checkHasMandatoryOptions(ctx.INPUTMSG(), ctx, "INPUTMSG");
    }
    checkHasMutuallyExclusiveOptions("INPUTMSG or SYSID", ctx.INPUTMSG(), ctx.SYSID());
    checkHasMutuallyExclusiveOptions("INPUTMSG or SYNCONRETURN", ctx.INPUTMSG(), ctx.SYNCONRETURN());
    checkHasMutuallyExclusiveOptions("INPUTMSG or TRANSID", ctx.INPUTMSG(), ctx.TRANSID());
  }

  private void checkLinkAcqprocess(CICSParser.Cics_link_acqprocessContext ctx) {
    checkHasMandatoryOptions(ctx.ACQPROCESS(), ctx, "ACQPROCESS");
  }

  @SuppressWarnings("unchecked")
  private void checkLinkActivity(CICSParser.Cics_link_activityContext ctx) {
    checkHasExactlyOneOption("ACTIVITY or ACQACTIVITY", ctx, ctx.ACTIVITY(), ctx.ACQACTIVITY());
  }
}

