/*
 * Copyright (c) 2021 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.flavors;

import com.google.common.collect.ImmutableMap;
import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Flavor utility class */
@UtilityClass
public class FlavorUtils {
  private static final Map<String, CobolFlavor> FLAVOR_SUPPLIERS = ImmutableMap.of(
      CobolFlavorImpl.NAME, CobolFlavorImpl::processText
  );

  /**
   * Process the text with flavors
   * @param uri
   * @param text
   * @param flavors
   * @return the flavor outcome
   */
  public ResultWithErrors<FlavorOutcome> process(String uri, String text, List<String> flavors) {
    List<Node> nodes = new ArrayList<>();
    List<SyntaxError> errors = new ArrayList<>();
    for (String flavorName: flavors) {
      CobolFlavor flavor = FLAVOR_SUPPLIERS.getOrDefault(flavorName, EmptyFlavor::processText);
      FlavorOutcome result = flavor.processText(uri, text).unwrap(errors::addAll);
      text = result.getText();
      nodes.addAll(result.getFlavorNodes());
    }
    return new ResultWithErrors<>(new FlavorOutcome(text, nodes), errors);
  }

  /**
   * Construct the range from ANTLR context
   * @param ctx the ANTLR context
   * @return the range
   */
  public Range constructRange(ParserRuleContext ctx) {
    return constructRange(ctx.start, ctx.stop);
  }

  /**
   * Construct the range from ANTLR terminal node
   * @param terminalNode the ANTLR terminal node
   * @return the range
   */
  public Range constructRange(TerminalNode terminalNode) {
    return constructRange(terminalNode.getSymbol(), terminalNode.getSymbol());
  }

  /**
   * Construct the range from start and end tokens
   * @param start the ANTLR token
   * @param stop the ANTLR token
   * @return the range
   */
  public Range constructRange(Token start, Token stop) {
    return new Range(
        new Position(start.getLine() - 1, start.getCharPositionInLine()),
        new Position(stop.getLine() - 1, stop.getCharPositionInLine() + stop.getStopIndex() - stop.getStartIndex() + 1)
    );
  }
}
