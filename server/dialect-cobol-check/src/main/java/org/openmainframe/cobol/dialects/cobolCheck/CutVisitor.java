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
package org.openmainframe.cobol.dialects.cobolCheck;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

/** Visitor to collect all CUT */
public class CutVisitor extends CutParserBaseVisitor<List<Node>> {

  private final DialectProcessingContext context;
  @Getter private final List<SyntaxError> errors = new LinkedList<>();

  public CutVisitor(DialectProcessingContext context) {
    this.context = context;
  }

  @Override
  protected List<Node> defaultResult() {
    return new ArrayList<>();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    return Stream.concat(aggregate.stream(), nextResult.stream()).collect(toList());
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitBeforeEachStatements(CutParser.BeforeEachStatementsContext ctx) {
    addReplacementContext(ctx.BEFORE());
    addReplacementContext(ctx.EACH());
    addReplacementContext(ctx.END_BEFORE());
    return visitChildren(ctx);
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitAfterEachStatements(CutParser.AfterEachStatementsContext ctx) {
    addReplacementContext(ctx.AFTER());
    addReplacementContext(ctx.EACH());
    addReplacementContext(ctx.END_AFTER());
    return visitChildren(ctx);
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitTestSuiteStatements(CutParser.TestSuiteStatementsContext ctx) {
    addReplacementContext(ctx);
    return visitChildren(ctx);
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitTestCaseStatements(CutParser.TestCaseStatementsContext ctx) {
    addReplacementContext(ctx.TESTCASE());
    addReplacementContext(ctx.literal());
    return visitChildren(ctx);
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitAssertStatements(CutParser.AssertStatementsContext ctx) {
    if (Objects.nonNull(ctx.EXPECT())) addReplacementContext(ctx.EXPECT());
    if (Objects.nonNull(ctx.VERIFY())) addReplacementContext(ctx.VERIFY());
    addReplacementContext(ctx.assertValue());
    return visitChildren(ctx);
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitMockStatements(CutParser.MockStatementsContext ctx) {
    //    addReplacementContext(ctx.MOCK());
    //    addReplacementContext(ctx.END_MOCK());
    addReplacementContext(ctx);
    return visitChildren(ctx);
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitQualifiedVariableDataName(CutParser.QualifiedVariableDataNameContext ctx) {
    addReplacementContext(ctx);
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  /**
   * {@inheritDoc}
   *
   * <p>The default implementation returns the result of calling {@link #visitChildren} on {@code
   * ctx}.
   *
   * @param ctx
   */
  @Override
  public List<Node> visitVariable(CutParser.VariableContext ctx) {
    return addTreeNode(ctx, locality -> new VariableUsageNode(getName(ctx), locality));
  }

  private void addReplacementContext(ParserRuleContext ctx) {
    String newText =
        context
            .getExtendedSource()
            .getText()
            .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
            .replaceAll("[^ \n]", CobolDialect.FILLER);
    Range range = constructRange(ctx);
    context.getExtendedSource().replace(range, newText);
  }

  private void addReplacementContext(TerminalNode token) {
    String newText =
        context
            .getExtendedSource()
            .getText()
            .substring(token.getSymbol().getStartIndex(), token.getSymbol().getStopIndex() + 1)
            .replaceAll("[^ \n]", " ");
    Range range = constructRange(token);
    context.getExtendedSource().replace(range, newText);
  }

  private Range constructRange(ParserRuleContext ctx) {
    return new Range(
        new Position(ctx.start.getLine() - 1, ctx.start.getCharPositionInLine()),
        new Position(
            ctx.stop.getLine() - 1,
            ctx.stop.getCharPositionInLine()
                + ctx.stop.getStopIndex()
                - ctx.stop.getStartIndex()
                + 1));
  }

  private Range constructRange(TerminalNode token) {
    int line = token.getSymbol().getLine();
    int inLine = token.getSymbol().getCharPositionInLine();
    return new Range(
        new Position(line - 1, inLine),
        new Position(
            line - 1,
            inLine + token.getSymbol().getStopIndex() - token.getSymbol().getStartIndex() + 1));
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Node node = nodeConstructor.apply(constructLocality(ctx));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private Locality constructLocality(ParserRuleContext ctx) {
    Location location =
        context.getExtendedSource().getMainMap().mapLocation(constructRange(ctx), false);
    return Locality.builder()
        .uri(context.getExtendedSource().getUri())
        .range(location.getRange())
        .build();
  }

  /**
   * Get name of the ParserRuleContext
   *
   * @param context is a statement context
   * @return a text of statement context
   */
  private String getName(ParserRuleContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse("");
  }
}
