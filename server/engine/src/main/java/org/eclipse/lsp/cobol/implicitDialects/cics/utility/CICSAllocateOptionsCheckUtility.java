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

import java.util.ArrayList;
import java.util.List;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_allocate;

/** Checks CICS Allocate rules for required and invalid options */
public class CICSAllocateOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_allocate;

  public CICSAllocateOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors);
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
  }

  private void checkAppcPartner(CICSParser.Cics_allocate_appc_partnerContext ctx) {
    checkHasMandatoryOptions(ctx.PARTNER(), ctx, "PARTNER");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.NOQUEUE(), "NOQUEUE", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkAppcMroLut61Sysid(CICSParser.Cics_allocate_appc_mro_lut61_sysidContext ctx) {
    checkHasMandatoryOptions(ctx.SYSID(), ctx, "SYSID");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.PROFILE(), "PROFILE"));
    contexts.add(new RuleContextData(ctx.NOQUEUE(), "NOQUEUE", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkLut61Session(CICSParser.Cics_allocate_lut61_sessionContext ctx) {
    checkHasMandatoryOptions(ctx.SESSION(), ctx, "SESSION");
    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.PROFILE(), "PROFILE"));
    contexts.add(new RuleContextData(ctx.NOQUEUE(), "NOQUEUE", ErrorSeverity.WARNING));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }
}
