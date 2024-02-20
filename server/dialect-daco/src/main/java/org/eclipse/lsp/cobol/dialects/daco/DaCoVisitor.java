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
package org.eclipse.lsp.cobol.dialects.daco;

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.dialects.daco.nodes.SortTableNode;
import org.eclipse.lsp.cobol.dialects.daco.DaCoParser.DacoStatementsContext;
import org.eclipse.lsp.cobol.dialects.daco.DaCoParser.QualifiedDataNameContext;
import org.eclipse.lsp.cobol.dialects.daco.DaCoParser.VariableUsageNameContext;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

/**
 * This extension of {@link DaCoParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link DaCoParser}.
 */
@Slf4j
public class DaCoVisitor extends DaCoParserBaseVisitor<List<Node>> {
  private final List<SyntaxError> errors = new ArrayList<>();
  DialectProcessingContext context;

  public DaCoVisitor(DialectProcessingContext context) {
    this.context = context;
  }

  @Override
  public List<Node> visitDacoStatements(DacoStatementsContext ctx) {
    if (ctx.dfldRcu() == null) {
      addReplacementContext(ctx);
    } else {
      addReplacementContext(ctx.dfldRcu().ON());
      addReplacementContext(ctx.dfldRcu().RCU());
    }
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitDacoSections(DaCoParser.DacoSectionsContext ctx) {
    addReplacementContext(ctx);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitSortTableStatement(DaCoParser.SortTableStatementContext ctx) {
    return addTreeNode(ctx, SortTableNode::new);
  }

  @Override
  public List<Node> visitQualifiedDataName(QualifiedDataNameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitVariableUsageName(VariableUsageNameContext ctx) {
    return addTreeNode(
        ctx, locality -> new VariableUsageNode(VisitorHelper.getName(ctx), locality));
  }

  @Override
  protected List<Node> defaultResult() {
    return ImmutableList.of();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    List<Node> result = new ArrayList<>(aggregate.size() + nextResult.size());
    result.addAll(aggregate);
    result.addAll(nextResult);
    return result;
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Node node = nodeConstructor.apply(constructLocality(ctx));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private Locality constructLocality(ParserRuleContext ctx) {
    Location location = context.getExtendedDocument().mapLocation(DialectUtils.constructRange(ctx));
    return Locality.builder().uri(context.getExtendedDocument().getUri()).range(location.getRange()).build();
  }

  public List<SyntaxError> getErrors() {
    return errors;
  }

  private void addReplacementContext(TerminalNode token) {
    String newText = context.getExtendedDocument().toString()
            .substring(token.getSymbol().getStartIndex(), token.getSymbol().getStopIndex() + 1)
            .replaceAll("[^ \n]", " ");
    Range range = DialectUtils.constructRange(token);
    context.getExtendedDocument().replace(range, newText);
  }
  private void addReplacementContext(ParserRuleContext ctx) {
    String newText = context.getExtendedDocument().toString()
            .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
            .replaceAll("[^ \n]", CobolDialect.FILLER);
    Range range = DialectUtils.constructRange(ctx);
    context.getExtendedDocument().replace(range, newText);
  }
}
