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

import com.google.common.collect.ImmutableList;
import lombok.Getter;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.eclipse.lsp.cobol.core.*;
import org.eclipse.lsp.cobol.core.IdmsParser.CobolWordContext;
import org.eclipse.lsp.cobol.core.IdmsParser.DataNameContext;
import org.eclipse.lsp.cobol.core.IdmsParser.IdmsControlSectionContext;
import org.eclipse.lsp.cobol.core.IdmsParser.IdmsIfConditionContext;
import org.eclipse.lsp.cobol.core.IdmsParser.IdmsIfStatementContext;
import org.eclipse.lsp.cobol.core.IdmsParser.IdmsSectionsContext;
import org.eclipse.lsp.cobol.core.IdmsParser.IdmsStatementsContext;
import org.eclipse.lsp.cobol.core.IdmsParser.CopyIdmsStatementContext;
import org.eclipse.lsp.cobol.core.IdmsParser.Idms_db_entity_nameContext;
import org.eclipse.lsp.cobol.core.IdmsParser.Idms_map_nameContext;
import org.eclipse.lsp.cobol.core.IdmsParser.Idms_map_name_definitionContext;
import org.eclipse.lsp.cobol.core.IdmsParser.Idms_procedure_nameContext;
import org.eclipse.lsp.cobol.core.IdmsParser.MapClauseContext;
import org.eclipse.lsp.cobol.core.IdmsParser.MapSectionContext;
import org.eclipse.lsp.cobol.core.IdmsParser.QualifiedDataNameContext;
import org.eclipse.lsp.cobol.core.IdmsParser.SchemaSectionContext;
import org.eclipse.lsp.cobol.core.IdmsParser.VariableUsageNameContext;
import org.eclipse.lsp.cobol.core.engine.dialects.CobolDialect;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectUtils;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.SectionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;
import org.eclipse.lsp.cobol.core.model.variables.SectionType;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.function.Function;

import static java.util.Optional.ofNullable;
import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.LEVEL_MAP_NAME;

/**
 *  This extension of {@link IdmsParserBaseVisitor} applies the semantic analysis based on the
 *  abstract syntax tree built by {@link IdmsParser}.
 */
class IdmsVisitor extends IdmsParserBaseVisitor<List<Node>> {
  private static final String IF = "_IF_ ";
  private final String programDocumentUri;
  private final DialectProcessingContext context;

  @Getter private final IdmsRecordsDescriptor recordsDescriptor = new IdmsRecordsDescriptor();
  @Getter private final List<SyntaxError> errors = new LinkedList<>();

  IdmsVisitor(DialectProcessingContext context) {
    this.programDocumentUri = context.getExtendedSource().getUri();
    this.context = context;
  }

  @Override
  public List<Node> visitIdmsStatements(IdmsStatementsContext ctx) {
    addReplacementContext(ctx, "");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIdmsSections(IdmsSectionsContext ctx) {
    addReplacementContext(ctx, "");
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIdmsIfStatement(IdmsIfStatementContext ctx) {
    addReplacementContext(ctx, IF);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitIdmsIfCondition(IdmsIfConditionContext ctx) {
    addReplacementContext(ctx, "");
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
    return addTreeNode(ctx, locality -> new VariableUsageNode(VisitorHelper.getName(ctx), locality));
  }

  @Override
  public List<Node> visitMapSection(MapSectionContext ctx) {
    recordsDescriptor.setMapSectionExists(true);
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
  public List<Node> visitIdmsRecordLocationParagraph(IdmsParser.IdmsRecordLocationParagraphContext ctx) {
    if (ctx.withinClause() != null) {
      if (ctx.withinClause().withinEntry() != null && ctx.withinClause().withinEntry().children.size() > 1) {
        recordsDescriptor.setRecordsWithinPlacement(ctx.withinClause().withinEntry().getChild(1).getText().toUpperCase());
      } else if ("MANUAL".equalsIgnoreCase(ctx.withinClause().getText())) {
        recordsDescriptor.setRecordsManualExists(true);
      }
    }
    return visitChildren(ctx);
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

  private int getLevel(CopyIdmsStatementContext ctx) {
    return Optional.ofNullable(ctx.LEVEL_NUMBER())
        .map(ParseTree::getText)
        .map(Integer::parseInt)
        .orElse(0);
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
    Location location = context.getExtendedSource().mapLocationUnsafe(DialectUtils.constructRange(ctx));
    return Locality.builder()
        .uri(location.getUri())
        .range(location.getRange())
        .build();
  }

  private void addReplacementContext(ParserRuleContext ctx, String prefix) {
    String newText = prefix + context.getExtendedSource().getText()
            .substring(ctx.start.getStartIndex(), ctx.stop.getStopIndex() + 1)
            .replaceAll("[^ \n]", CobolDialect.FILLER);
    context.getExtendedSource().replace(DialectUtils.constructRange(ctx), newText);
  }

}
