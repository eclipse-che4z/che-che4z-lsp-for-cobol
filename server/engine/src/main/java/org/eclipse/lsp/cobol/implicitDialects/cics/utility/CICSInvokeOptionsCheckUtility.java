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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_invoke;

/** Checks CICS Invoke rules for required and invalid options */
public class CICSInvokeOptionsCheckUtility extends CICSOptionsCheckBaseUtility {
  public static final int RULE_INDEX = RULE_cics_invoke;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
          new HashMap<Integer, ErrorSeverity>() {
            {
              put(CICSLexer.INVOKE, ErrorSeverity.ERROR);
              put(CICSLexer.APPLICATION, ErrorSeverity.ERROR);
              put(CICSLexer.OPERATION, ErrorSeverity.ERROR);
              put(CICSLexer.PLATFORM, ErrorSeverity.ERROR);
              put(CICSLexer.MAJORVERSION, ErrorSeverity.ERROR);
              put(CICSLexer.MINORVERSION, ErrorSeverity.ERROR);
              put(CICSLexer.EXACTMATCH, ErrorSeverity.WARNING);
              put(CICSLexer.MINIMUM, ErrorSeverity.WARNING);
              put(CICSLexer.COMMAREA, ErrorSeverity.ERROR);
              put(CICSLexer.LENGTH, ErrorSeverity.ERROR);
              put(CICSLexer.CHANNEL, ErrorSeverity.ERROR);
              put(CICSLexer.SERVICE, ErrorSeverity.ERROR);
              put(CICSLexer.WEBSERVICE, ErrorSeverity.ERROR);
              put(CICSLexer.URI, ErrorSeverity.ERROR);
              put(CICSLexer.URIMAP, ErrorSeverity.ERROR);
              put(CICSLexer.SCOPE, ErrorSeverity.ERROR);
              put(CICSLexer.SCOPELEN, ErrorSeverity.ERROR);
            }
          };

  public CICSInvokeOptionsCheckUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Invoke rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_invoke_application:
        checkInvokeApplication((CICSParser.Cics_invoke_applicationContext) ctx);
        break;
      case CICSParser.RULE_cics_invoke_service:
        checkInvokeService((CICSParser.Cics_invoke_serviceContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  @SuppressWarnings("unchecked")
  private void checkInvokeApplication(CICSParser.Cics_invoke_applicationContext ctx) {
    checkHasMandatoryOptions(ctx.APPLICATION(), ctx, "APPLICATION");
    checkHasMandatoryOptions(ctx.OPERATION(), ctx, "OPERATION");
    checkHasMutuallyExclusiveOptions("EXACTMATCH or MINIMUM", ctx.EXACTMATCH(), ctx.MINIMUM());
    if (!ctx.MINORVERSION().isEmpty()) {
      checkHasMandatoryOptions(ctx.MAJORVERSION(), ctx, "MAJORVERSION");
    }
    if (!ctx.EXACTMATCH().isEmpty() || !ctx.MINIMUM().isEmpty()) {
      checkHasMandatoryOptions(ctx.MINORVERSION(), ctx, "MINORVERSION");
    }
    if (!ctx.LENGTH().isEmpty()) {
      checkHasMandatoryOptions(ctx.COMMAREA(), ctx, "COMMAREA");
    }
  }

  @SuppressWarnings("unchecked")
  private void checkInvokeService(CICSParser.Cics_invoke_serviceContext ctx) {
    checkHasExactlyOneOption("SERVICE or WEBSERVICE", ctx, ctx.SERVICE(), ctx.WEBSERVICE());
    checkHasMandatoryOptions(ctx.CHANNEL(), ctx, "CHANNEL");
    checkHasMandatoryOptions(ctx.OPERATION(), ctx, "OPERATION");
    checkHasMutuallyExclusiveOptions("URI or URIMAP", ctx.URI(), ctx.URIMAP());
    if (!ctx.SCOPELEN().isEmpty()) {
      checkHasMandatoryOptions(ctx.SCOPE(), ctx, "SCOPE");
    }
  }
}
