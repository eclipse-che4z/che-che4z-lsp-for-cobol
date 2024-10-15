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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_allocate;

/** Checks CICS Allocate rules for required and invalid options */
public class CICSAllocateOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_allocate;

  private static final Map<Integer, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<Integer, ErrorSeverity>() {
        {
          put(CICSLexer.ALLOCATE, ErrorSeverity.ERROR);
          put(CICSLexer.SYSID, ErrorSeverity.ERROR);
          put(CICSLexer.PROFILE, ErrorSeverity.ERROR);
          put(CICSLexer.STATE, ErrorSeverity.ERROR);
          put(CICSLexer.SESSION, ErrorSeverity.ERROR);
          put(CICSLexer.PARTNER, ErrorSeverity.ERROR);
          put(CICSLexer.ASIS, ErrorSeverity.WARNING);
          put(CICSLexer.BUFFER, ErrorSeverity.WARNING);
          put(CICSLexer.LEAVEKB, ErrorSeverity.WARNING);
          put(CICSLexer.NOTRUNCATE, ErrorSeverity.WARNING);
          put(CICSLexer.NOQUEUE, ErrorSeverity.WARNING);
          put(CICSLexer.NOTRUNCATE, ErrorSeverity.WARNING);
          put(CICSLexer.TERMINAL, ErrorSeverity.WARNING);
        }
      };

  public CICSAllocateOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS Allocate rule options
   *
   * @param ctx ParserRuleContext subclass containing options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    switch (ctx.getRuleIndex()) {
      case CICSParser.RULE_cics_allocate_appc_partner:
        checkAppcPartner((CICSParser.Cics_allocate_appc_partnerContext) ctx);
        break;
      case CICSParser.RULE_cics_allocate_appc_mro_lut61_sysid:
        checkAppcMroLut61Sysid((CICSParser.Cics_allocate_appc_mro_lut61_sysidContext) ctx);
        break;
      case CICSParser.RULE_cics_allocate_lut61_session:
        checkLut61Session((CICSParser.Cics_allocate_lut61_sessionContext) ctx);
        break;
      default:
        break;
    }
    checkDuplicates(ctx);
  }

  private void checkAppcPartner(CICSParser.Cics_allocate_appc_partnerContext ctx) {
    checkHasMandatoryOptions(ctx.PARTNER(), ctx, "PARTNER");
  }

  private void checkAppcMroLut61Sysid(CICSParser.Cics_allocate_appc_mro_lut61_sysidContext ctx) {
    checkHasMandatoryOptions(ctx.SYSID(), ctx, "SYSID");
  }

  private void checkLut61Session(CICSParser.Cics_allocate_lut61_sessionContext ctx) {
    checkHasMandatoryOptions(ctx.SESSION(), ctx, "SESSION");
  }
}
