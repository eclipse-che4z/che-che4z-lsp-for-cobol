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
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.RuleNode;
import org.eclipse.lsp.cobol.core.Db2SqlParser;
import org.eclipse.lsp.cobol.core.Db2SqlParserBaseVisitor;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.logic.QualifiedReferenceUpdateVariableUsage;
import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;

import java.util.List;
import java.util.Map;
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
public class Db2SqlVisitor extends Db2SqlParserBaseVisitor<List<Node>> {
  private final Map<Token, Locality> positions;

  @Override
  public List<Node> visitDbs_host_variable(Dbs_host_variableContext ctx) {
    return addTreeNode(ctx, loc -> {
      QualifiedReferenceNode node = new QualifiedReferenceNode(loc);
      node.addProcessStep(c -> new QualifiedReferenceUpdateVariableUsage().accept(node, c));
      return node;
    });
  }

  @Override
  public List<Node> visitDbs_rs_locator_variable(Dbs_rs_locator_variableContext ctx) {
    return addTreeNode(ctx, loc -> {
      QualifiedReferenceNode node = new QualifiedReferenceNode(loc);
      node.addProcessStep(c -> new QualifiedReferenceUpdateVariableUsage().accept(node, c));
      return node;
    });
  }

  @Override
  public List<Node> visitDbs_host_variable_val(Db2SqlParser.Dbs_host_variable_valContext ctx) {

    return addTreeNode(ctx, loc -> {
      QualifiedReferenceNode node = new QualifiedReferenceNode(loc);
      node.addProcessStep(c -> new QualifiedReferenceUpdateVariableUsage().accept(node, c));
      return node;
    });
  }

  @Override
  public List<Node> visitDbs_host_var_identifier(Db2SqlParser.Dbs_host_var_identifierContext ctx) {
    return addTreeNode(
            ctx,
            locality -> new VariableUsageNode(VisitorHelper.getName(ctx.dbs_host_names()), locality)
    );
  }

  @Override
  public List<Node> visitDbs_sql_identifier(Db2SqlParser.Dbs_sql_identifierContext ctx) {
    return addTreeNode(
        ctx,
        locality -> new VariableUsageNode(VisitorHelper.getName(ctx), locality)
    );
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

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    return VisitorHelper.createTreeNode(positions, visitChildren(ctx), ctx, nodeConstructor);
  }
}
