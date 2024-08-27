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
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.List;

/** Checks CICS Receive rules for required and invalid options */
public class CICSReceiveOptionsCheckUtility extends CICSOptionsCheckBaseUtility {

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
      checkHasIllegalOptions(ctx.LEAVEKB(), ctx, "LEAVEKB");
    }
    List<Pair<List<?>, String>> contexts = new ArrayList<>();
    contexts.add(new ImmutablePair<>(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new ImmutablePair<>(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
    contexts.add(new ImmutablePair<>(ctx.ASIS(), "ASIS"));
    contexts.add(new ImmutablePair<>(ctx.BUFFER(), "BUFFER"));
    contexts.add(new ImmutablePair<>(ctx.NOTRUNCATE(), "NOTRUNCATE"));
    contexts.add(new ImmutablePair<>(ctx.LEAVEKB(), "LEAVEKB"));
    checkDuplicates(contexts, ctx);
  }

  private void checkGroupTwo(CICSParser.Cics_receive_group_twoContext ctx) {
    checkHasMandatoryOptions(ctx.cics_length_flength(), ctx, "LENGTH or FLENGTH");
    checkHasMandatoryOptions(ctx.cics_into_set(), ctx, "INTO or SET");

    List<Pair<List<?>, String>> contexts = new ArrayList<>();
    contexts.add(new ImmutablePair<>(ctx.CONVID(), "CONVID"));
    contexts.add(new ImmutablePair<>(ctx.SESSION(), "SESSION"));
    contexts.add(new ImmutablePair<>(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new ImmutablePair<>(ctx.cics_length_flength(), "LENGTH or FLENGTH"));
    contexts.add(new ImmutablePair<>(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
    contexts.add(new ImmutablePair<>(ctx.NOTRUNCATE(), "NOTRUNCATE"));
    contexts.add(new ImmutablePair<>(ctx.STATE(), "STATE"));
    checkDuplicates(contexts, ctx);
  }

  private void checkGroupThree(CICSParser.Cics_receive_group_threeContext ctx) {
    checkHasMandatoryOptions(ctx.cics_length_flength(), ctx, "LENGTH or FLENGTH");

    List<Pair<List<?>, String>> contexts = new ArrayList<>();
    contexts.add(new ImmutablePair<>(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new ImmutablePair<>(ctx.cics_length_flength(), "LENGTH or FLENGTH"));
    contexts.add(new ImmutablePair<>(ctx.cics_maxlength(), "MAXLENGTH or MAXFLENGTH"));
    contexts.add(new ImmutablePair<>(ctx.NOTRUNCATE(), "NOTRUNCATE"));
    contexts.add(new ImmutablePair<>(ctx.PASSBK(), "PASSBK"));
    contexts.add(new ImmutablePair<>(ctx.ASIS(), "ASIS"));
    checkDuplicates(contexts, ctx);
  }

  private void checkPartn(CICSParser.Cics_receive_partnContext ctx) {
    checkHasMandatoryOptions(ctx.cics_into_set(), ctx, "INTO or SET");
    checkHasMandatoryOptions(ctx.LENGTH(), ctx, "LENGTH");

    List<Pair<List<?>, String>> contexts = new ArrayList<>();
    contexts.add(new ImmutablePair<>(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new ImmutablePair<>(ctx.LENGTH(), "LENGTH"));
    contexts.add(new ImmutablePair<>(ctx.ASIS(), "ASIS"));
    checkDuplicates(contexts, ctx);
  }

  private void checkMap(CICSParser.Cics_receive_mapContext ctx) {
    if (ctx.FROM().isEmpty()) checkHasIllegalOptions(ctx.LENGTH(), ctx, "LENGTH");
    if (ctx.TERMINAL().isEmpty()) checkHasIllegalOptions(ctx.INPARTN(), ctx, "INPARTN");

    List<Pair<List<?>, String>> contexts = new ArrayList<>();
    contexts.add(new ImmutablePair<>(ctx.MAPSET(), "MAPSET"));
    contexts.add(new ImmutablePair<>(ctx.cics_into_set(), "INTO or SET"));
    contexts.add(new ImmutablePair<>(ctx.FROM(), "FROM"));
    contexts.add(new ImmutablePair<>(ctx.LENGTH(), "LENGTH"));
    contexts.add(new ImmutablePair<>(ctx.TERMINAL(), "TERMINAL"));
    contexts.add(new ImmutablePair<>(ctx.ASIS(), "ASIS"));
    contexts.add(new ImmutablePair<>(ctx.INPARTN(), "INPARTN"));
    checkDuplicates(contexts, ctx);
  }

  private void checkMapMappingDev(CICSParser.Cics_receive_map_mappingdevContext ctx) {
    checkHasMandatoryOptions(ctx.FROM(), ctx, "FROM");

    List<Pair<List<?>, String>> contexts = new ArrayList<>();
    contexts.add(new ImmutablePair<>(ctx.MAPPINGDEV(), "MAPPINGDEV"));
    contexts.add(new ImmutablePair<>(ctx.FROM(), "FROM"));
    contexts.add(new ImmutablePair<>(ctx.LENGTH(), "LENGTH"));
    contexts.add(new ImmutablePair<>(ctx.MAPSET(), "MAPSET"));
    contexts.add(new ImmutablePair<>(ctx.cics_into_set(), "INTO or SET"));
    checkDuplicates(contexts, ctx);
  }
}
