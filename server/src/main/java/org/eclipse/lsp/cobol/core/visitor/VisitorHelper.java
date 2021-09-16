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
package org.eclipse.lsp.cobol.core.visitor;

import com.google.common.collect.ImmutableList;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.misc.ParseCancellationException;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.ValueInterval;
import org.eclipse.lsp.cobol.core.model.variables.UsageFormat;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nonnull;
import java.util.*;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.CobolParser.*;
import static org.eclipse.lsp.cobol.core.semantics.outline.OutlineNodeNames.FILLER_NAME;

/** Utility class for visitor and delegates classes with useful methods */
@Slf4j
@UtilityClass
class VisitorHelper {

  /**
   * Get variable level from TerminalNode object
   *
   * @param terminalNode is a TerminalNode
   * @return a level of defined variable
   */
  int getLevel(TerminalNode terminalNode) {
    String levelNumber = terminalNode.getText();
    return Integer.parseInt(levelNumber);
  }

  /**
   * Get name of the EntryNameContext
   *
   * @param context is a statement context object
   * @return a text of the statement
   */
  String getName(EntryNameContext context) {
    return ofNullable(context)
        .map(EntryNameContext::dataName)
        .map(VisitorHelper::getName)
        .orElse(FILLER_NAME);
  }

  /**
   * Get name of the ParserRuleContext
   *
   * @param context is a statement context
   * @return a text of statement context
   */
  String getName(ParserRuleContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse("");
  }

  /**
   * Get interval position of 2 localities
   *
   * @param start is a start position
   * @param stop is end position
   * @return Locality with interval position
   */
  Locality getIntervalPosition(Locality start, Locality stop) {
    return Locality.builder()
        .uri(start.getUri())
        .range(new Range(start.getRange().getStart(), stop.getRange().getEnd()))
        .recognizer(VisitorHelper.class)
        .copybookId(start.getCopybookId())
        .build();
  }

  /**
   * Extract picture texts
   *
   * @param clauses a list of ANTLR picture clauses
   * @return the list of picture texts
   */
  List<String> retrievePicTexts(List<DataPictureClauseContext> clauses) {
    return clauses.stream()
        .map(clause -> clause.getText().replaceAll(clause.getStart().getText(), "").trim())
        .collect(toList());
  }

  /**
   * Extract value intervals. It's also applicable for raw values. In case of just a value `to`
   * field will be `null`.
   *
   * @param contexts a list of ANTLR value intervals
   * @return the list of value intervals
   */
  List<ValueInterval> retrieveValueIntervals(List<DataValueIntervalContext> contexts) {
    return contexts.stream()
        .map(
            context ->
                new ValueInterval(
                    context.dataValueIntervalFrom().getText(),
                    ofNullable(context.dataValueIntervalTo())
                        .map(DataValueIntervalToContext::literal)
                        .map(ParserRuleContext::getText)
                        .map(String::toUpperCase)
                        .orElse(null),
                    ofNullable(context.dataValueIntervalTo())
                        .map(DataValueIntervalToContext::thruToken)
                        .map(ParserRuleContext::getText)
                        .map(String::toUpperCase)
                        .orElse(null)))
        .collect(toList());
  }

  /**
   * Extract usage format from ANTLR usage clause
   *
   * @param contexts a list of ANTLR usage clauses
   * @return the list of usage formats
   */
  List<UsageFormat> retrieveUsageFormat(List<DataUsageClauseContext> contexts) {
    return contexts.stream()
        .map(DataUsageClauseContext::usageFormat)
        .filter(Objects::nonNull)
        .map(UsageFormatContext::getStart)
        .map(Token::getText)
        .map(UsageFormat::of)
        .collect(toList());
  }

  /**
   * Convert IntegerLiteralContext into an Integer
   *
   * @param context the IntegerLiteralContext, may be null
   * @return converted Integer or null if the context is empty
   */
  Integer getInteger(IntegerLiteralContext context) {
    return ofNullable(context)
        .map(ParserRuleContext::getText)
        .filter(it -> !it.isEmpty())
        .map(Integer::parseInt)
        .orElse(null);
  }

  /**
   * Retrieve the text in the initial representation including the hidden tokens from the start to
   * the end of the context rule.
   *
   * @param ctx the rule context that contains the required tokens
   * @return a string representation of the given context
   */
  String getIntervalText(ParserRuleContext ctx) {
    return ofNullable(ctx).map(VisitorHelper::retrieveIntervalText).orElse("");
  }

  private String retrieveIntervalText(@Nonnull ParserRuleContext ctx) {
    int start = ctx.getStart().getStartIndex();
    int stop = ctx.getStop().getStopIndex();
    return stop < start ? "" : ctx.getStart().getInputStream().getText(new Interval(start, stop));
  }

  /**
   * Retrieve a locality from the given context with a range from the start to the end
   *
   * @param context ParserRuleContext to extract locality
   * @param positions map of exact positions
   * @return locality which has a range from the start to the end of the rule
   */
  Optional<Locality> retrieveRangeLocality(
      ParserRuleContext context, Map<Token, Locality> positions) {
    return ofNullable(context)
        .flatMap(
            ctx ->
                ofNullable(positions.get(ctx.getStart()))
                    .flatMap(
                        start ->
                            ofNullable(positions.get(ctx.getStop()))
                                .map(
                                    stop ->
                                        start.toBuilder()
                                            .range(
                                                new Range(
                                                    start.getRange().getStart(),
                                                    stop.getRange().getEnd()))
                                            .build())));
  }

  /**
   * Construct for the locality using the node constructor and child nodes
   *
   * @param nodeConstructor function to construct a node
   * @param children list of child nodes of the parser rule
   * @return a node for semantic analysis
   */
  Function<Locality, List<Node>> constructNode(
      Function<Locality, Node> nodeConstructor, List<Node> children) {
    return locality -> {
      Node node = nodeConstructor.apply(locality);
      children.forEach(node::addChild);
      return ImmutableList.of(node);
    };
  }

  /**
   * Check if the current thread was interrupted and stop the further analysis by throwing a
   * specific exception
   */
  void checkInterruption() {
    if (Thread.interrupted()) {
      LOG.debug("Parsing interrupted by user");
      throw new ParseCancellationException("Parsing interrupted by user");
    }
  }

  /**
   * Create a tree node from the given context
   *
   * @param positions map of localities
   * @param children children nodes
   * @param ctx to retrieve the locality range
   * @param nodeConstructor function to create the node
   * @return list of nodes
   */
  List<Node> createTreeNode(
      Map<Token, Locality> positions,
      List<Node> children,
      ParserRuleContext ctx,
      Function<Locality, Node> nodeConstructor) {
    return retrieveRangeLocality(ctx, positions)
        .map(constructNode(nodeConstructor, children))
        .orElse(children);
  }
  /**
   * Retrieve a locality from the given mapping
   *
   * @param positions map of localities
   * @param childToken token to retrieve
   * @return optional of locality
   */
  Optional<Locality> getLocality(Map<Token, Locality> positions, Token childToken) {
    return ofNullable(positions.get(childToken));
  }
}
