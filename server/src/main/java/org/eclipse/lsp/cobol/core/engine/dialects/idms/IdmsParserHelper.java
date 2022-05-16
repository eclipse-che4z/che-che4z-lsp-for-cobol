/*
 * Copyright (c) 2022 Broadcom.
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

package org.eclipse.lsp.cobol.core.engine.dialects.idms;

import lombok.experimental.UtilityClass;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.core.IdmsCopyParser;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.variables.UsageFormat;
import org.eclipse.lsp.cobol.core.model.tree.variables.ValueInterval;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import javax.annotation.Nonnull;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.semantics.outline.OutlineNodeNames.FILLER_NAME;

/** Utility class for visitor and delegates classes with useful methods */
@UtilityClass
class IdmsParserHelper {
  /**
   * Extract picture texts
   *
   * @param clauses a list of ANTLR picture clauses
   * @return the list of picture texts
   */
  public List<String> retrievePicTexts(List<IdmsCopyParser.DataPictureClauseContext> clauses) {
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
  public List<ValueInterval> retrieveValueIntervals(List<IdmsCopyParser.DataValueIntervalContext> contexts) {
    return contexts.stream()
        .map(
            context ->
                new ValueInterval(
                    context.dataValueIntervalFrom().getText(),
                    ofNullable(context.dataValueIntervalTo())
                        .map(IdmsCopyParser.DataValueIntervalToContext::literal)
                        .map(ParserRuleContext::getText)
                        .map(String::toUpperCase)
                        .orElse(null),
                    ofNullable(context.dataValueIntervalTo())
                        .map(IdmsCopyParser.DataValueIntervalToContext::thruToken)
                        .map(ParserRuleContext::getText)
                        .map(String::toUpperCase)
                        .orElse(null)))
        .collect(toList());
  }

  /**
   * Get variable level from TerminalNode object
   *
   * @param terminalNode is a TerminalNode
   * @return a level of defined variable
   */
  public int getLevel(TerminalNode terminalNode) {
    String levelNumber = terminalNode.getText();
    return Integer.parseInt(levelNumber);
  }

  /**
   * Extract usage format from ANTLR usage clause
   *
   * @param contexts a list of ANTLR usage clauses
   * @return the list of usage formats
   */
  public List<UsageFormat> retrieveUsageFormat(List<IdmsCopyParser.DataUsageClauseContext> contexts) {
    return contexts.stream()
        .map(IdmsCopyParser.DataUsageClauseContext::usageFormat)
        .filter(Objects::nonNull)
        .map(IdmsCopyParser.UsageFormatContext::getStart)
        .map(Token::getText)
        .map(UsageFormat::of)
        .collect(toList());
  }

  /**
   * Get name of the EntryNameContext
   *
   * @param context is a statement context object
   * @return a text of the statement
   */
  public String getName(IdmsCopyParser.EntryNameContext context) {
    return ofNullable(context)
        .map(IdmsCopyParser.EntryNameContext::dataName)
        .map(VisitorHelper::getName)
        .orElse(FILLER_NAME);
  }

  /**
   * Get name of the ParserRuleContext
   *
   * @param context is a statement context
   * @return a text of statement context
   */
  public String getName(ParserRuleContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse("");
  }

  /**
   * Builds context name locality based on the name and uri of the document
   * @param ctx is a parse rule context
   * @param name is a name of the entity
   * @param uri is an uri of the document
   * @return locality object
   */
  public Locality buildNameRangeLocality(ParserRuleContext ctx, String name, String uri) {
    Range range = new Range(
        new Position(ctx.start.getLine() - 1, ctx.start.getCharPositionInLine()),
        new Position(ctx.stop.getLine() - 1, ctx.start.getCharPositionInLine() + name.length()));

    return Locality.builder()
        .uri(uri)
        .range(range)
        .build();
  }

  /**
   * Gets value from ValueIsTokenContext context
   * @param ctx a context object
   * @return extracted value
   */
  public String retrieveValueToken(IdmsCopyParser.ValueIsTokenContext ctx) {
    return ctx.valueToken().getText().toUpperCase()
        + Optional.ofNullable(ctx.isAreToken())
        .map(ParserRuleContext::getText)
        .map(String::toUpperCase)
        .map(" "::concat)
        .orElse("");
  }

  /**
   * Retrieve the text in the initial representation including the hidden tokens from the start to
   * the end of the context rule.
   *
   * @param ctx the rule context that contains the required tokens
   * @return a string representation of the given context
   */
  public String getIntervalText(ParserRuleContext ctx) {
    return ofNullable(ctx).map(IdmsParserHelper::retrieveIntervalText).orElse("");
  }

  /**
   * Gets a value from DataOccursClauseContext context
   * @param ctx a context object
   * @return extracted value
   */
  public Optional<Integer> retrieveOccursToValue(IdmsCopyParser.DataOccursClauseContext ctx) {
    return ofNullable(ctx.dataOccursTo())
        .map(IdmsCopyParser.DataOccursToContext::integerLiteral)
        .map(IdmsParserHelper::getInteger);
  }

  /**
   * Convert IntegerLiteralContext into an Integer
   *
   * @param context the IntegerLiteralContext, may be null
   * @return converted Integer or null if the context is empty
   */
  public Integer getInteger(IdmsCopyParser.IntegerLiteralContext context) {
    return ofNullable(context)
        .map(ParserRuleContext::getText)
        .filter(it -> !it.isEmpty())
        .map(Integer::parseInt)
        .orElse(null);
  }

  private String retrieveIntervalText(@Nonnull ParserRuleContext ctx) {
    int start = ctx.getStart().getStartIndex();
    int stop = ctx.getStop().getStopIndex();
    return stop < start ? "" : ctx.getStart().getInputStream().getText(new Interval(start, stop));
  }

}
