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
import java.util.stream.Collectors;

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
          put("MAXLENGTH", ErrorSeverity.ERROR);
          put("MAXFLENGTH", ErrorSeverity.ERROR);
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

  public CICSReceiveOptionsCheckUtility(
      DialectProcessingContext context, List<SyntaxError> errors) {
    super(context, errors, DUPLICATE_CHECK_OPTIONS);
  }

  /**
   * Entrypoint to check CICS RECEIVE rule options 0
   *
   * @param ctx ParserRuleContext subclass containging options
   * @param <E> A subclass of ParserRuleContext
   */
  public <E extends ParserRuleContext> void checkOptions(E ctx) {
    if (ctx.getClass() == CICSParser.Cics_receive_group_oneContext.class) {
      checkGroupOne((CICSParser.Cics_receive_group_oneContext) ctx);
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
    checkHasMutuallyExclusiveOptions("INTO or SET", ctx.INTO(), ctx.SET());
    if (!ctx.SET().isEmpty())
      checkHasExactlyOneOption("LENGTH or FLENGTH", ctx, ctx.cics_length_flength());
    checkMaxLength(ctx.cics_maxlength());
  }

  private void checkPartn(CICSParser.Cics_receive_partnContext ctx) {
    checkHasMandatoryOptions(ctx.PARTN(), ctx, "PARTN");
    checkHasExactlyOneOption("INTO or SET", ctx, ctx.cics_into_set());
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");
  }

  private void checkMap(CICSParser.Cics_receive_mapContext ctx) {
    if (ctx.FROM().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), "LENGTH without FROM");
    checkIntoSet(ctx.cics_into_set());
  }

  private void checkMapMappingDev(CICSParser.Cics_receive_map_mappingdevContext ctx) {
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");
    checkIntoSet(ctx.cics_into_set());
  }

  private void checkIntoSet(List<CICSParser.Cics_into_setContext> ctx) {
    checkHasMutuallyExclusiveOptions(
        "INTO or SET",
        ctx.stream().map(CICSParser.Cics_into_setContext::INTO).collect(Collectors.toList()),
        ctx.stream().map(CICSParser.Cics_into_setContext::SET).collect(Collectors.toList()));
  }

  private void checkMaxLength(List<CICSParser.Cics_maxlengthContext> ctx) {
    checkHasMutuallyExclusiveOptions(
        "MAXLENGTH or MAXFLENGTH",
        ctx.stream().map(CICSParser.Cics_maxlengthContext::MAXLENGTH).collect(Collectors.toList()),
        ctx.stream()
            .map(CICSParser.Cics_maxlengthContext::MAXFLENGTH)
            .collect(Collectors.toList()));
  }
}
