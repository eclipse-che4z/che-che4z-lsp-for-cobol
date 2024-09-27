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
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_allocate;

/** Checks CICS Allocate rules for required and invalid options */
public class CICSAllocateOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_allocate;

  private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<String, ErrorSeverity>() {
        {
          put("ALLOCATE", ErrorSeverity.ERROR);
          put("SYSID", ErrorSeverity.ERROR);
          put("PROFILE", ErrorSeverity.ERROR);
          put("STATE", ErrorSeverity.ERROR);
          put("SESSION", ErrorSeverity.ERROR);
          put("PARTNER", ErrorSeverity.ERROR);
          put("ASIS", ErrorSeverity.WARNING);
          put("BUFFER", ErrorSeverity.WARNING);
          put("LEAVEKB", ErrorSeverity.WARNING);
          put("NOTRUNCATE", ErrorSeverity.WARNING);
          put("NOQUEUE", ErrorSeverity.WARNING);
          put("NOTRUNCATE", ErrorSeverity.WARNING);
          put("TERMINAL", ErrorSeverity.WARNING);
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
    if (ctx.getClass() == CICSParser.Cics_allocate_appc_partnerContext.class) {
      checkAppcPartner((CICSParser.Cics_allocate_appc_partnerContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_allocate_appc_mro_lut61_sysidContext.class) {
      checkAppcMroLut61Sysid((CICSParser.Cics_allocate_appc_mro_lut61_sysidContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_allocate_lut61_sessionContext.class) {
      checkLut61Session((CICSParser.Cics_allocate_lut61_sessionContext) ctx);
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
