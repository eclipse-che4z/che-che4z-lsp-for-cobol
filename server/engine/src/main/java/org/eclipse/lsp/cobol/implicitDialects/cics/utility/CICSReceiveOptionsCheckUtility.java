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
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser.RULE_cics_receive;

/** Checks CICS Receive rules for required and invalid options */
public class CICSReceiveOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

  public static final int RULE_INDEX = RULE_cics_receive;

  public static final Map<String, Pair<ErrorSeverity, String>> SUBGROUPS =
      new HashMap<String, Pair<ErrorSeverity, String>>() {
        {
          put("Cics_into_setContext", new ImmutablePair<>(ErrorSeverity.ERROR, "INTO or SET"));
          put(
              "Cics_length_flengthContext",
              new ImmutablePair<>(ErrorSeverity.ERROR, "LENGTH or FLENGTH"));
        }
      };

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
    checkResponseHandlers(ctx.cics_handle_response());
    checkDuplicates(ctx, SUBGROUPS);
  }

  private void checkGroupTwo(CICSParser.Cics_receive_group_twoContext ctx) {
    checkHasMandatoryOptions(ctx.cics_length_flength(), ctx, "LENGTH or FLENGTH");
    checkHasMandatoryOptions(ctx.cics_into_set(), ctx, "INTO or SET");

    checkResponseHandlers(ctx.cics_handle_response());
    checkDuplicates(ctx, SUBGROUPS);
  }

  private void checkGroupThree(CICSParser.Cics_receive_group_threeContext ctx) {
    checkHasMandatoryOptions(ctx.cics_length_flength(), ctx, "LENGTH or FLENGTH");

    checkResponseHandlers(ctx.cics_handle_response());
    checkDuplicates(ctx, SUBGROUPS);
  }

  private void checkPartn(CICSParser.Cics_receive_partnContext ctx) {
    checkHasMandatoryOptions(ctx.cics_into_set(), ctx, "INTO or SET");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");

    checkResponseHandlers(ctx.cics_handle_response());
    checkDuplicates(ctx, SUBGROUPS);
  }

  private void checkMap(CICSParser.Cics_receive_mapContext ctx) {
    if (ctx.FROM().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), "LENGTH");
    if (ctx.TERMINAL().isEmpty()) checkHasIllegalOptions(ctx.INPARTN(), "INPARTN");

    checkResponseHandlers(ctx.cics_handle_response());
    checkDuplicates(ctx, SUBGROUPS);
  }

  private void checkMapMappingDev(CICSParser.Cics_receive_map_mappingdevContext ctx) {
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    checkResponseHandlers(ctx.cics_handle_response());
    checkDuplicates(ctx, SUBGROUPS);
  }
}
