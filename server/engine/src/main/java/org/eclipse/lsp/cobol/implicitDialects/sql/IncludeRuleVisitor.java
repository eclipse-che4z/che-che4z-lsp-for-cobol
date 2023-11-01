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
package org.eclipse.lsp.cobol.implicitDialects.sql;

import static java.util.stream.Collectors.toList;

import com.google.common.collect.ImmutableList;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;
import lombok.AllArgsConstructor;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.CopyNode;
import org.eclipse.lsp.cobol.common.utils.StringUtils;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** Db2 Include statement visitor */
@AllArgsConstructor
public class IncludeRuleVisitor extends Db2SqlParserBaseVisitor<List<CopyNode>> {
  private final DialectProcessingContext context;

  @Override
  public List<CopyNode> visitCopySource(Db2SqlParser.CopySourceContext ctx) {
    String copybookName = StringUtils.trimQuotes(ctx.getText());
    Location nameLocation = new Location(context.getProgramDocumentUri(), constructRange(ctx));
    addReplacementContext(ctx);
    return addTreeNode(
        ctx,
        loc ->
            new CopyNode(
                loc,
                nameLocation,
                copybookName,
                Db2SqlDialect.DIALECT_NAME,
                context.getProgramDocumentUri()));
  }

  @Override
  public List<CopyNode> visitIncludeStatement(Db2SqlParser.IncludeStatementContext ctx) {
    getAllTerminalNodes(ctx)
        .forEach(
            node ->
                context
                    .getExtendedDocument()
                    .replace(
                        constructRange(node),
                        org.apache.commons.lang3.StringUtils.repeat(
                            CobolDialect.FILLER, node.getText().length())));
    return super.visitIncludeStatement(ctx);
  }

  private List<TerminalNode> getAllTerminalNodes(ParserRuleContext ctx) {
    List<TerminalNode> result = new ArrayList<>();
    for (int childNodes = 0; childNodes < ctx.getChildCount(); childNodes++) {
      ParseTree child = ctx.getChild(childNodes);
      if (child instanceof TerminalNode) {
        result.add((TerminalNode) child);
      } else {
        result.addAll(getAllTerminalNodes((ParserRuleContext) child));
      }
    }
    return result;
  }

  // TODO " remove these helper methods to a visitor Helper
  private void addReplacementContext(ParserRuleContext ctx) {
    String newText =
        context
            .getExtendedDocument()
            .toString()
            .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
            .replaceAll("[^ \n]", CobolDialect.FILLER);
    context.getExtendedDocument().replace(constructRange(ctx), newText);
  }

  /**
   * construct range for a Terminal Node
   *
   * @param ctx
   * @return a range of terminal nodes
   */
  public Range constructRange(TerminalNode ctx) {
    return new Range(
        new Position(ctx.getSymbol().getLine() - 1, ctx.getSymbol().getCharPositionInLine()),
        new Position(
            ctx.getSymbol().getLine() - 1,
            ctx.getSymbol().getCharPositionInLine()
                + ctx.getSymbol().getStopIndex()
                - ctx.getSymbol().getStartIndex()));
  }

  @Override
  protected List<CopyNode> aggregateResult(List<CopyNode> aggregate, List<CopyNode> nextResult) {
    return Stream.concat(aggregate.stream(), nextResult.stream()).collect(toList());
  }

  // TODO: move to utility
  private Range constructRange(ParserRuleContext ctx) {
    return new Range(
        new Position(ctx.getStart().getLine() - 1, ctx.getStart().getCharPositionInLine()),
        new Position(
            ctx.getStop().getLine() - 1,
            ctx.getStop().getCharPositionInLine()
                + ctx.getStop().getStopIndex()
                - ctx.getStop().getStartIndex()
                + 1));
  }

  @Override
  protected List<CopyNode> defaultResult() {
    return new ArrayList<>();
  }

  // TODO: extract this to an utility
  private List<CopyNode> addTreeNode(
      ParserRuleContext ctx, Function<Locality, CopyNode> nodeConstructor) {
    Locality locality =
        VisitorHelper.buildNameRangeLocality(
            ctx, VisitorHelper.getName(ctx), context.getProgramDocumentUri());
    Location location = context.getExtendedDocument().mapLocation(locality.getRange());
    CopyNode node =
        nodeConstructor.apply(
            Locality.builder().range(location.getRange()).uri(location.getUri()).build());
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }
}
