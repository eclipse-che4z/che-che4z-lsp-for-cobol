/*
 * Copyright (c) 2023 Broadcom.
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

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/***
 * Utility class for CICS antlr visitor
 */
@UtilityClass
public class VisitorUtility {
  /**
   * Construct locality
   * @param ctx
   * @param context
   * @return locality
   */
  public Locality constructLocality(ParserRuleContext ctx, DialectProcessingContext context) {
    Location location = context.getExtendedDocument().mapLocation(constructRange(ctx));
    return Locality.builder()
        .uri(location.getUri())
        .range(location.getRange())
        .build();
  }

  /**
   * Construct range
   * @param ctx
   * @return range
   */
  public Range constructRange(ParserRuleContext ctx) {
    return new Range(
        new Position(ctx.start.getLine() - 1, ctx.start.getCharPositionInLine()),
        new Position(
            ctx.stop.getLine() - 1,
            ctx.stop.getCharPositionInLine()
                + ctx.stop.getStopIndex()
                - ctx.stop.getStartIndex()
                + 1));
  }

  /**
   * Construct range
   * @param token
   * @return range
   */
  public Range constructRange(TerminalNode token) {
    int line = token.getSymbol().getLine();
    int inLine = token.getSymbol().getCharPositionInLine();
    return new Range(
        new Position(line - 1, inLine),
        new Position(
            line - 1,
            inLine + token.getSymbol().getStopIndex() - token.getSymbol().getStartIndex() + 1));
  }
}
