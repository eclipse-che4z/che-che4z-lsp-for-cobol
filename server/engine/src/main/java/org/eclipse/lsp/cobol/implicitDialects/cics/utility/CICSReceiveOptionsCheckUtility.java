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

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_receive;

/** Checks CICS Receive rules for required and invalid options */
public class CICSReceiveOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_receive;

  public CICSReceiveOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors);
  }

  /**
   * Entrypoint to check CICS RECEIVE rule options
   *
   * @param ctx ParserRuleContext subclass containging options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getClass() == CICSParser.Cics_receive_group_oneContext.class) {
      checkGroupOne((CICSParser.Cics_receive_group_oneContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_receive_group_twoContext.class) {
      checkGroupTwo((CICSParser.Cics_receive_group_twoContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_receive_group_threeContext.class) {
      checkGroupThree((CICSParser.Cics_receive_group_threeContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_receive_partnContext.class) {
      checkPartn((CICSParser.Cics_receive_partnContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_receive_mapContext.class) {
      checkMap((CICSParser.Cics_receive_mapContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_receive_map_mappingdevContext.class) {
      checkMapMappingDev((CICSParser.Cics_receive_map_mappingdevContext) ctx);
    }
  }

  private void checkGroupOne(CICSParser.Cics_receive_group_oneContext ctx) {
    checkHasMandatoryOptions(ctx.cics_length_flength(), ctx, "LENGTH or FLENGTH");
    if (!ctx.ASIS().isEmpty() || !ctx.BUFFER().isEmpty()) {
      checkHasIllegalOptions(ctx.LEAVEKB(), "LEAVEKB");
    }

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new RuleContextData(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
    contexts.add(new RuleContextData(ctx.ASIS(), "ASIS", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.BUFFER(), "BUFFER", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.NOTRUNCATE(), "NOTRUNCATE", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.LEAVEKB(), "LEAVEKB", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkGroupTwo(CICSParser.Cics_receive_group_twoContext ctx) {
    checkHasMandatoryOptions(ctx.cics_length_flength(), ctx, "LENGTH or FLENGTH");
    checkHasMandatoryOptions(ctx.cics_into_set(), ctx, "INTO or SET");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.CONVID(), "CONVID"));
    contexts.add(new RuleContextData(ctx.SESSION(), "SESSION"));
    contexts.add(new RuleContextData(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new RuleContextData(ctx.cics_length_flength(), "LENGTH or FLENGTH"));
    contexts.add(new RuleContextData(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
    contexts.add(new RuleContextData(ctx.NOTRUNCATE(), "NOTRUNCATE", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.STATE(), "STATE"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkGroupThree(CICSParser.Cics_receive_group_threeContext ctx) {
    checkHasMandatoryOptions(ctx.cics_length_flength(), ctx, "LENGTH or FLENGTH");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new RuleContextData(ctx.cics_length_flength(), "LENGTH or FLENGTH"));
    contexts.add(new RuleContextData(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
    contexts.add(new RuleContextData(ctx.NOTRUNCATE(), "NOTRUNCATE", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.PASSBK(), "PASSBK", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkPartn(CICSParser.Cics_receive_partnContext ctx) {
    checkHasMandatoryOptions(ctx.cics_into_set(), ctx, "INTO or SET");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.ASIS(), "ASIS", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkMap(CICSParser.Cics_receive_mapContext ctx) {
    if (ctx.FROM().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), "LENGTH");
    if (ctx.TERMINAL().isEmpty()) checkHasIllegalOptions(ctx.INPARTN(), "INPARTN");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.MAPSET(), "MAPSET"));
    contexts.add(new RuleContextData(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new RuleContextData(ctx.FROM(), "FROM"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.TERMINAL(), "TERMINAL", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.ASIS(), "ASIS", ErrorSeverity.WARNING));
    contexts.add(new RuleContextData(ctx.INPARTN(), "INPARTN"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }

  private void checkMapMappingDev(CICSParser.Cics_receive_map_mappingdevContext ctx) {
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    List<RuleContextData> contexts = new ArrayList<>();
    contexts.add(new RuleContextData(ctx.MAPPINGDEV(), "MAPPINGDEV"));
    contexts.add(new RuleContextData(ctx.FROM(), "FROM"));
    contexts.add(new RuleContextData(ctx.LENGTH(), "LENGTH"));
    contexts.add(new RuleContextData(ctx.MAPSET(), "MAPSET"));
    contexts.add(new RuleContextData(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new RuleContextData(ctx.cics_handle_response(), "RESPONSE HANDLER"));
    harvestResponseHandlers(ctx.cics_handle_response(), contexts);
    checkDuplicates(contexts);
  }
}
