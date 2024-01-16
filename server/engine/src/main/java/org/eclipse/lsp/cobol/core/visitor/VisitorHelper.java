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
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.misc.ParseCancellationException;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.CobolDataDivisionParser;
import org.eclipse.lsp.cobol.common.model.tree.variable.ValueInterval;
import org.eclipse.lsp.cobol.common.model.tree.variable.UsageFormat;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nonnull;
import java.util.*;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.CobolDataDivisionParser.*;
import static org.eclipse.lsp.cobol.common.OutlineNodeNames.FILLER_NAME;

/** Utility class for visitor and delegates classes with useful methods */
@Slf4j
//@UtilityClass
public class VisitorHelper {

  /**
   * Get variable level from TerminalNode object
   *
   * @param terminalNode is a TerminalNode
   * @return a level of defined variable
   */
  public static int getLevel(TerminalNode terminalNode) {
    String levelNumber = terminalNode.getText();
    return Integer.parseInt(levelNumber);
  }

  /**
   * Get name of the EntryNameContext
   *
   * @param context is a statement context object
   * @return a text of the statement
   */
  public static String getName(EntryNameContext context) {
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
  public static String getName(ParserRuleContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse("");
  }

  /**
   * Get interval position of 2 localities
   *
   * @param start is a start position
   * @param stop is end position
   * @return Locality with interval position
   */
  static Locality getIntervalPosition(Locality start, Locality stop) {
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
  public static List<String> retrievePicTexts(List<DataPictureClauseContext> clauses) {
    return clauses.stream()
            .map(clause -> clause.getText().replaceAll(clause.getStart().getText(), "").trim())
            .collect(toList());
  }
  /**
   * Extract picture texts
   *
   * @param clauses a list of ANTLR picture clauses
   * @return the list of picture texts
   */
  public static List<String> retrievePicTextsOld(List<org.eclipse.lsp.cobol.core.CobolParser.DataPictureClauseContext> clauses) {
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
  public static List<ValueInterval> retrieveValueIntervals(List<DataValueIntervalContext> contexts) {
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
   * Extract value intervals. It's also applicable for raw values. In case of just a value `to`
   * field will be `null`.
   *
   * @param contexts a list of ANTLR value intervals
   * @return the list of value intervals
   */
  public static List<ValueInterval> retrieveValueIntervalsOld(List<org.eclipse.lsp.cobol.core.CobolParser.DataValueIntervalContext> contexts) {
    return contexts.stream()
            .map(
                    context ->
                            new ValueInterval(
                                    context.dataValueIntervalFrom().getText(),
                                    ofNullable(context.dataValueIntervalTo())
                                            .map(org.eclipse.lsp.cobol.core.CobolParser.DataValueIntervalToContext::literal)
                                            .map(ParserRuleContext::getText)
                                            .map(String::toUpperCase)
                                            .orElse(null),
                                    ofNullable(context.dataValueIntervalTo())
                                            .map(org.eclipse.lsp.cobol.core.CobolParser.DataValueIntervalToContext::thruToken)
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
  public static List<UsageFormat> retrieveUsageFormat(List<DataUsageClauseContext> contexts) {
    return contexts.stream()
            .map(DataUsageClauseContext::usageFormat)
            .filter(Objects::nonNull)
            .map(UsageFormatContext::getStart)
            .map(Token::getText)
            .map(UsageFormat::of)
            .collect(toList());
  }
  /**
   * Extract usage format from ANTLR usage clause
   *
   * @param contexts a list of ANTLR usage clauses
   * @return the list of usage formats
   */
  public static List<UsageFormat> retrieveUsageFormatOld(List<org.eclipse.lsp.cobol.core.CobolParser.DataUsageClauseContext> contexts) {
    return contexts.stream()
            .map(org.eclipse.lsp.cobol.core.CobolParser.DataUsageClauseContext::usageFormat)
            .filter(Objects::nonNull)
            .map(org.eclipse.lsp.cobol.core.CobolParser.UsageFormatContext::getStart)
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
  public static Integer getInteger(IntegerLiteralContext context) {
    return ofNullable(context)
            .map(ParserRuleContext::getText)
            .filter(it -> !it.isEmpty())
            .map(Integer::parseInt)
            .orElse(null);
  }

  /**
   * Convert IntegerLiteralContext into an Integer
   *
   * @param context the IntegerLiteralContext, may be null
   * @return converted Integer or null if the context is empty
   */
  public static Integer getIntegerOld(CobolParser.IntegerLiteralContext context) {
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
  public static String getIntervalText(ParserRuleContext ctx) {
    return ofNullable(ctx).map(VisitorHelper::retrieveIntervalText).orElse("");
  }

  private static String retrieveIntervalText(@Nonnull ParserRuleContext ctx) {
    int start = ctx.getStart().getStartIndex();
    int stop = ctx.getStop().getStopIndex();
    return stop < start ? "" : ctx.getStart().getInputStream().getText(new Interval(start, stop));
  }

  /**
   * Retrieve a locality from the given context with a range from the start to the end
   *
   * @param ctx ParserRuleContext to extract locality
   * @return locality which has a range from the start to the end of the rule
   */
  public static Optional<Range> retrieveRangeLocality(ParserRuleContext ctx) {
    if (ctx == null) {
      return Optional.empty();
    }
    return Optional.of(constructRange(ctx));
  }

  /**
   * Construct the range from ANTLR context
   *
   * @param ctx the ANTLR context
   * @return the range
   */
  public static Range constructRange(ParserRuleContext ctx) {
    Token start = ctx.start;
    Token end = ctx.stop;

    if (start.getLine() > end.getLine()) {
      start = ctx.stop;
      end = ctx.start;
    }

    return new Range(
        new Position(
            start.getLine() - 1,
            start.getCharPositionInLine()),
        new Position(
            end.getLine() - 1,
            end.getCharPositionInLine() + end.getStopIndex() - end.getStartIndex() + 1)
    );
  }

  /**
   * Construct for the locality using the node constructor and child nodes
   *
   * @param nodeConstructor function to construct a node
   * @param children list of child nodes of the parser rule
   * @return a node for semantic analysis
   */
  static Function<Locality, List<Node>> constructNode(
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
  public static void checkInterruption() {
    if (Thread.interrupted()) {
      LOG.debug("Parsing interrupted by user");
      throw new ParseCancellationException("Parsing interrupted by user");
    }
  }

  /**
   * Gets a value from DataOccursClauseContext context
   * @param ctx a context object
   * @return extracted value
   */
  public static Optional<Integer> retrieveOccursToValue(CobolDataDivisionParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.dataOccursTo())
        .map(CobolDataDivisionParser.DataOccursToContext::integerLiteral)
        .map(VisitorHelper::getInteger);
  }

  /**
   * Gets a value from DataOccursClauseContext context
   * @param ctx a context object
   * @return extracted value
   */
  public static Optional<Integer> retrieveOccursToValueOld(CobolParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.dataOccursTo())
            .map(CobolParser.DataOccursToContext::integerLiteral)
            .map(VisitorHelper::getIntegerOld);
  }

  /**
   * Gets value from ValueIsTokenContext context
   * @param ctx a context object
   * @return extracted value
   */
  public static String retrieveValueToken(ValueIsTokenContext ctx) {
    return ctx.valueToken().getText().toUpperCase()
            + Optional.ofNullable(ctx.isAreToken())
            .map(ParserRuleContext::getText)
            .map(String::toUpperCase)
            .map(" "::concat)
            .orElse("");
  }

  /**
   * Gets value from ValueIsTokenContext context
   * @param ctx a context object
   * @return extracted value
   */
  public static String retrieveValueTokenOld(CobolParser.ValueIsTokenContext ctx) {
    return ctx.valueToken().getText().toUpperCase()
            + Optional.ofNullable(ctx.isAreToken())
            .map(ParserRuleContext::getText)
            .map(String::toUpperCase)
            .map(" "::concat)
            .orElse("");
  }

  /**
   * Builds context name locality based on the name and uri of the document
   * @param ctx is a parse rule context
   * @param name is a name of the entity
   * @param uri is an uri of the document
   * @return locality object
   */
  public static Locality buildNameRangeLocality(ParserRuleContext ctx, String name, String uri) {
    Range range = new Range(
        new Position(ctx.start.getLine() - 1, ctx.start.getCharPositionInLine()),
        new Position(ctx.stop.getLine() - 1, ctx.start.getCharPositionInLine() + name.length()));

    return Locality.builder()
        .uri(uri)
        .range(range)
        .build();
  }

  /**
   * Builds context name locality based on the name and uri of the document
   * @param token is a token
   * @return range object
   */
  public static Range buildTokenRange(Token token) {
    return new Range(
        new Position(token.getLine() - 1, token.getCharPositionInLine()),
        new Position(token.getLine() - 1, token.getCharPositionInLine() + token.getText().length()));
  }

}
