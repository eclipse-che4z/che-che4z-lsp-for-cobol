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

package org.eclipse.lsp.cobol.core.engine.analysis;

import com.google.common.collect.ImmutableList;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.utils.RangeUtils;
import org.eclipse.lsp.cobol.core.Db2SqlParser;
import org.eclipse.lsp.cobol.core.Db2SqlParserBaseVisitor;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp.cobol.core.Db2SqlParser.Dbs_host_variableContext;
import static org.eclipse.lsp.cobol.core.Db2SqlParser.Dbs_rs_locator_variableContext;

/**
 * This visitor analyzes the parser tree for DB2 SQL and returns its semantic context as a syntax
 * tree
 */
@Slf4j
@AllArgsConstructor
class Db2SqlVisitor extends Db2SqlParserBaseVisitor<List<Node>> {

  private final Position position;
  private final String programUri;
  private final ExtendedDocument extendedDocument;

  @Override
  public List<Node> visitDbs_host_variable(Dbs_host_variableContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitDbs_rs_locator_variable(Dbs_rs_locator_variableContext ctx) {
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

  // NOTE: Visitor is not managed by Guice DI, so can't use annotation here.
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
    Locality locality = VisitorHelper.buildNameRangeLocality(ctx, VisitorHelper.getName(ctx), programUri);
    locality.setRange(RangeUtils.shiftRangeWithPosition(position, locality.getRange()));

    Location location = extendedDocument.mapLocation(locality.getRange());

    Node node = nodeConstructor.apply(Locality.builder()
        .range(location.getRange())
        .uri(location.getUri())
        .build());
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
      Locality locality = VisitorHelper.buildNameRangeLocality(ctx, name, programUri);
      locality.setRange(RangeUtils.shiftRangeWithPosition(new Position(position.getLine(),
          position.getCharacter() + (hasColumn ? 1 : 0)), locality.getRange()));

      return Db2SqlVisitorHelper.generateGroupNodes(name, locality);
    }
    String finalName = name;
    return addTreeNode(
        ctx,
        locality -> new VariableUsageNode(finalName, locality)
    );
  }
}
