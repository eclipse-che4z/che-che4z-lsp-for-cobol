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

  private static final Map<String, ErrorSeverity> DUPLICATE_CHECK_OPTIONS =
      new HashMap<String, ErrorSeverity>() {
        {
          put("RECEIVE", ErrorSeverity.ERROR);
          put("INTO", ErrorSeverity.ERROR);
          put("SET", ErrorSeverity.ERROR);
          put("LENGTH", ErrorSeverity.ERROR);
          put("FLENGTH", ErrorSeverity.ERROR);
          put("CONVID", ErrorSeverity.ERROR);
          put("SESSION", ErrorSeverity.ERROR);
          put("STATE", ErrorSeverity.ERROR);
          put("MAP", ErrorSeverity.ERROR);
          put("MAPSET", ErrorSeverity.ERROR);
          put("INPARTN", ErrorSeverity.ERROR);
          put("MAPPINGDEV", ErrorSeverity.ERROR);
          put("ASIS", ErrorSeverity.WARNING);
          put("BUFFER", ErrorSeverity.WARNING);
          put("LEAVEKB", ErrorSeverity.WARNING);
          put("PASSBK", ErrorSeverity.WARNING);
          put("NOTRUNCATE", ErrorSeverity.WARNING);
          put("NOQUEUE", ErrorSeverity.WARNING);
          put("TERMINAL", ErrorSeverity.WARNING);
        }
      };

  public static final Map<String, Pair<String, ErrorSeverity>> SUBGROUPS =
      new HashMap<String, Pair<String, ErrorSeverity>>() {
        {
          put("Cics_into_setContext", new ImmutablePair<>("INTO or SET", ErrorSeverity.ERROR));
          put(
              "Cics_length_flengthContext",
              new ImmutablePair<>("LENGTH or FLENGTH", ErrorSeverity.ERROR));
        }
      };

  public CICSReceiveOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS, SUBGROUPS);
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
    } else if (ctx.getClass() == CICSParser.Cics_receive_partnContext.class) {
      checkPartn((CICSParser.Cics_receive_partnContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_receive_mapContext.class) {
      checkMap((CICSParser.Cics_receive_mapContext) ctx);
    } else if (ctx.getClass() == CICSParser.Cics_receive_map_mappingdevContext.class) {
      checkMapMappingDev((CICSParser.Cics_receive_map_mappingdevContext) ctx);
    }
    checkDuplicates(ctx);
  }

  private void checkGroupOne(CICSParser.Cics_receive_group_oneContext ctx) {
    checkHasExactlyOneOption("LENGTH or FLENGTH", ctx, ctx.cics_length_flength());
    checkHasMutuallyExclusiveOptions("INTO or SET", ctx.cics_into_set());
    checkHasMutuallyExclusiveOptions("MAXLENGTH or MAXFLENGTH", ctx.cics_maxlength());
    if (!ctx.ASIS().isEmpty() || !ctx.BUFFER().isEmpty()) {
      checkHasIllegalOptions(ctx.LEAVEKB(), "LEAVEKB");
    }
  }

  private void checkGroupTwo(CICSParser.Cics_receive_group_twoContext ctx) {
    checkHasExactlyOneOption("INTO or SET", ctx, ctx.cics_into_set());
    checkHasExactlyOneOption("LENGTH or FLENGTH", ctx, ctx.cics_length_flength());
    checkHasMutuallyExclusiveOptions("MAXLENGTH or MAXFLENGTH", ctx.cics_maxlength());
  }

  private void checkPartn(CICSParser.Cics_receive_partnContext ctx) {
    checkHasMandatoryOptions(ctx.PARTN(), ctx, "PARTN");
    checkHasExactlyOneOption("INTO or SET", ctx, ctx.cics_into_set());
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
  }

  private void checkMap(CICSParser.Cics_receive_mapContext ctx) {
    if (ctx.FROM().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), "LENGTH without FROM");
    if (ctx.TERMINAL().isEmpty()) checkHasIllegalOptions(ctx.INPARTN(), "INPARTN without TERMINAL");
    checkHasMutuallyExclusiveOptions("INTO or SET", ctx.cics_into_set());
  }

  private void checkMapMappingDev(CICSParser.Cics_receive_map_mappingdevContext ctx) {
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    checkHasMutuallyExclusiveOptions("INTO or SET", ctx.cics_into_set());
  }
}
