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
package org.eclipse.lsp.cobol.dialects.idms;

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RuleContext;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.dialects.idms.IdmsParser.*;
import org.eclipse.lsp.cobol.common.model.tree.SectionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableDefinitionNode;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableNameAndLocality;
import org.eclipse.lsp.cobol.common.model.tree.variable.VariableUsageNode;
import org.eclipse.lsp.cobol.common.model.SectionType;
import org.eclipse.lsp4j.Location;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.common.VariableConstants.LEVEL_MAP_NAME;

/**
 * This extension of {@link IdmsParserBaseVisitor} applies the semantic analysis based on the
 * abstract syntax tree built by {@link IdmsParser}.
 */
class IdmsVisitor extends IdmsParserBaseVisitor<List<Node>> {
  private static final String IF = "_IF_ ";
  private final DialectProcessingContext context;

  @Getter private final List<SyntaxError> errors = new LinkedList<>();

  IdmsVisitor(DialectProcessingContext context) {
    this.context = context;
  }

  @Override
  public List<Node> visitIdmsStatements(IdmsStatementsContext ctx) {
    addReplacementContext(ctx);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIdmsSections(IdmsSectionsContext ctx) {
    addReplacementContext(ctx);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIdmsIfStatement(IdmsIfStatementContext ctx) {
    addReplacementContext(ctx, IF);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIdmsIfCondition(IdmsIfConditionContext ctx) {
    addReplacementContext(ctx);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitQualifiedDataName(QualifiedDataNameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitIdms_db_entity_name(Idms_db_entity_nameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitIdms_procedure_name(Idms_procedure_nameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitIdms_map_name(Idms_map_nameContext ctx) {
    return addTreeNode(ctx, QualifiedReferenceNode::new);
  }

  @Override
  public List<Node> visitVariableUsageName(VariableUsageNameContext ctx) {
    return addTreeNode(
        ctx, locality -> new VariableUsageNode(getName(ctx), locality));
  }

  @Override
  public List<Node> visitMapSection(MapSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.MAP));
  }

  @Override
  public List<Node> visitMapClause(MapClauseContext ctx) {
    return ofNullable(ctx.idms_map_name_definition())
        .map(Idms_map_name_definitionContext::dataName)
        .map(this::extractNameAndLocality)
        .map(
            varName ->
                addTreeNode(
                    VariableDefinitionNode.builder()
                        .level(LEVEL_MAP_NAME)
                        .variableNameAndLocality(varName)
                        .statementLocality(constructLocality(ctx))
                        .build(),
                    visitChildren(ctx)))
        .orElseGet(() -> visitChildren(ctx));
  }

  @Override
  public List<Node> visitIdmsControlSection(IdmsControlSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.IDMS_CONTROL));
  }

  @Override
  public List<Node> visitSchemaSection(SchemaSectionContext ctx) {
    return addTreeNode(ctx, locality -> new SectionNode(locality, SectionType.SCHEMA));
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

  private String getName(ParserRuleContext context) {
    return ofNullable(context).map(RuleContext::getText).map(String::toUpperCase).orElse("");
  }

  private List<Node> addTreeNode(Node node, List<Node> children) {
    children.forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Node node = nodeConstructor.apply(constructLocality(ctx));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private VariableNameAndLocality extractNameAndLocality(DataNameContext context) {
    return extractNameAndLocality(context.cobolWord());
  }

  private VariableNameAndLocality extractNameAndLocality(CobolWordContext context) {
    return new VariableNameAndLocality(VisitorHelper.getName(context), constructLocality(context));
  }

  private Locality constructLocality(ParserRuleContext ctx) {
    Location location =
        context.getExtendedDocument().mapLocation(DialectUtils.constructRange(ctx));
    return Locality.builder().uri(location.getUri()).range(location.getRange()).build();
  }

  private void addReplacementContext(ParserRuleContext ctx) {
    addReplacementContext(ctx, "");
  }

  private void addReplacementContext(ParserRuleContext ctx, String prefix) {
    String newText =
        prefix
            + context
                .getExtendedDocument()
                .toString()
                .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
                .replaceAll("[^ \n]", CobolDialect.FILLER);
    context.getExtendedDocument().replace(DialectUtils.constructRange(ctx), newText);
  }
}
