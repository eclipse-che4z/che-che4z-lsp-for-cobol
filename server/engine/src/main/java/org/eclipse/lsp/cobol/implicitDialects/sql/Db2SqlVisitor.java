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
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.*;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/**
 * This visitor analyzes the parser tree for DB2 SQL and returns its semantic context as a syntax
 * tree
 */
@Slf4j
@AllArgsConstructor
class Db2SqlVisitor extends Db2SqlParserBaseVisitor<List<Node>> {

  private final DialectProcessingContext context;
  private final MessageService messageService;

  @Getter private final List<SyntaxError> errors = new LinkedList<>();

  @Override
  public List<Node> visitDbs_host_variable(Db2SqlParser.Dbs_host_variableContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitExecRule(Db2SqlParser.ExecRuleContext ctx) {
    addReplacementContext(ctx);
    return super.visitExecRule(ctx);
  }

  private void addReplacementContext(ParserRuleContext ctx) {
    getAllTerminalNodes(ctx)
        .forEach(
            node ->
                context
                    .getExtendedDocument()
                    .replace(
                        constructRange(node),
                        StringUtils.repeat(CobolDialect.FILLER, node.getText().length())));
  }

  public Range constructRange(TerminalNode ctx) {
    Position start = new Position(ctx.getSymbol().getLine() - 1, ctx.getSymbol().getCharPositionInLine());
    Position end =
        ctx.getSymbol().getStopIndex() > ctx.getSymbol().getStartIndex()
            ? new Position(
                ctx.getSymbol().getLine() - 1,
                ctx.getSymbol().getCharPositionInLine()
                    + ctx.getSymbol().getStopIndex()
                    - ctx.getSymbol().getStartIndex())
            : start;
    return new Range(start, end);
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

  public Range constructRange(ParserRuleContext ctx) {
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
  public List<Node> visitSqlCode(Db2SqlParser.SqlCodeContext ctx) {
    //    String intervalText = VisitorHelper.getIntervalText(ctx);
    List<Node> nodes = this.visitStartSqlRule(parseSQL(ctx));
    Db2SqlVisitorHelper.adjustNodeLocations(ctx, context, nodes);
    return nodes;
  }

  @Override
  public List<Node> visitRulesAllowedInWorkingStorageAndLinkageSection(Db2SqlParser.RulesAllowedInWorkingStorageAndLinkageSectionContext ctx) {
    return addTreeNode(ctx, Db2WorkingAndLinkageSectionNode::new);
  }

  @Override
  public List<Node> visitDbs_declare_variable(Db2SqlParser.Dbs_declare_variableContext ctx) {
    return addTreeNode(ctx, Db2DeclareVariableNode::new);
  }

  @Override
  public List<Node> visitProcedureDivisionRules(Db2SqlParser.ProcedureDivisionRulesContext ctx) {
    return addTreeNode(ctx, Db2ProcedureDivisionNode::new);
  }

  @Override
  public List<Node> visitDbs_whenever(Db2SqlParser.Dbs_wheneverContext ctx) {
    return addTreeNode(ctx, ExecSqlWheneverNode::new);
  }

  @Override
  public List<Node> visitRulesAllowedInDataDivisionAndProcedureDivision(Db2SqlParser.RulesAllowedInDataDivisionAndProcedureDivisionContext ctx) {
    return addTreeNode(ctx, Db2DataAndProcedureDivisionNode::new);
  }

  private Db2SqlParser.StartSqlRuleContext parseSQL(Db2SqlParser.SqlCodeContext sqlCodeContext) {
    String sqlCode = VisitorHelper.getIntervalText(sqlCodeContext);
    Db2SqlLexer lexer = new Db2SqlLexer(CharStreams.fromString(sqlCode));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    Db2SqlParser parser = new Db2SqlParser(tokens);
    Db2ErrorListener listener = new Db2ErrorListener(context.getProgramDocumentUri());
    lexer.removeErrorListeners();
    lexer.addErrorListener(listener);
    parser.removeErrorListeners();
    parser.addErrorListener(listener);
    parser.setErrorHandler(new Db2ErrorStrategy(messageService));

    Db2SqlParser.StartSqlRuleContext result = parser.startSqlRule();
    for (SyntaxError err : listener.getErrors()) {
      errors.add(
          err.toBuilder()
              .location(Db2SqlVisitorHelper.adjustLocation(err.getLocation(), sqlCodeContext))
              .build());
    }
    return result;
  }

  @Override
  public List<Node> visitDbs_rs_locator_variable(Db2SqlParser.Dbs_rs_locator_variableContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitDbs_host_names_var(Db2SqlParser.Dbs_host_names_varContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitDbs_host_name_container(Db2SqlParser.Dbs_host_name_containerContext ctx) {
    if (isVariableUsage(ctx.getParent())) {
      return addVariableUsageNodes(ctx);
    }
    return ImmutableList.of();
  }

  @Override
  public List<Node> visitChildren(RuleNode node) {
    VisitorHelper.checkInterruption();
    return super.visitChildren(node);
  }

  @Override
  protected List<Node> defaultResult() {
    return ImmutableList.of();
  }

  @Override
  protected List<Node> aggregateResult(List<Node> aggregate, List<Node> nextResult) {
    return Stream.concat(aggregate.stream(), nextResult.stream()).collect(toList());
  }

  private boolean isVariableUsage(ParserRuleContext ctx) {
    if (hasColumn(ctx)) {
      return true;
    }

    if (ctx instanceof Db2SqlParser.Dbs_host_names_varContext && !isSpecialName(ctx)) {
      return true;
    }

    for (ParseTree child : ctx.children) {
      if (child instanceof ParserRuleContext) {
        if (isVariableUsage((ParserRuleContext) child)) {
          return true;
        }
      }
    }
    return false;
  }

  private boolean hasColumn(ParserRuleContext ctx) {
    for (ParseTree child : ctx.children) {
      if (child instanceof TerminalNode && child.getText().equals(":")) {
        return true;
      }
    }
    return false;
  }

  private boolean isSpecialName(ParserRuleContext ctx) {
    if (ctx instanceof Db2SqlParser.Dbs_special_nameContext) {
      return true;
    }
    for (ParseTree child : ctx.children) {
      if (child instanceof ParserRuleContext) {
        if (isSpecialName((ParserRuleContext) child)) {
          return true;
        }
      }
    }
    return false;
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Locality locality =
        VisitorHelper.buildNameRangeLocality(
            ctx, VisitorHelper.getName(ctx), context.getProgramDocumentUri());
    //    locality.setRange(RangeUtils.shiftRangeWithPosition(position, locality.getRange()));
    //
    Location location = context.getExtendedDocument().mapLocation(locality.getRange());

    Node node =
        nodeConstructor.apply(
            Locality.builder().range(location.getRange()).uri(location.getUri()).build());
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private List<Node> addVariableUsageNodes(ParserRuleContext ctx) {
    String name = VisitorHelper.getName(ctx);
    boolean hasColumn = name.startsWith(":");
    if (hasColumn) {
      name = name.substring(1);
    }

    if (Db2SqlVisitorHelper.isGroupName(name)) {
      Locality locality =
          VisitorHelper.buildNameRangeLocality(ctx, name, context.getExtendedDocument().getUri());
      locality.setRange(
          RangeUtils.shiftRangeWithPosition(
              new Position(ctx.start.getLine() - 1, (hasColumn ? 1 : 0)), locality.getRange()));

      return Db2SqlVisitorHelper.generateGroupNodes(name, locality);
    }
    String finalName = name;
    return addTreeNode(ctx, locality -> new VariableUsageNode(finalName, locality));
  }
}
