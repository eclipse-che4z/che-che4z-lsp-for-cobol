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
import static org.eclipse.lsp.cobol.core.visitor.VisitorHelper.getName;

import com.google.common.collect.ImmutableList;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Stream;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.AntlrRangeUtils;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;
import org.eclipse.lsp.cobol.implicitDialects.sql.node.*;
import org.eclipse.lsp4j.Location;

/**
 * This visitor analyzes the parser tree for DB2 SQL and returns its semantic context as a syntax
 * tree
 */
@Slf4j
@AllArgsConstructor
class Db2SqlExecVisitor extends Db2SqlExecParserBaseVisitor<List<Node>> {

    private final DialectProcessingContext context;

    @Override
    public List<Node> visitDbs_procedure_name(Db2SqlExecParser.Dbs_procedure_nameContext ctx) {
        return addTreeNode(ctx, QualifiedReferenceNode::new);
    }

    @Override
    public List<Node> visitRulesAllowedInWorkingStorageAndLinkageSection(
            Db2SqlExecParser.RulesAllowedInWorkingStorageAndLinkageSectionContext ctx) {
        return addTreeNode(ctx, Db2WorkingAndLinkageSectionNode::new);
    }

    @Override
    public List<Node> visitDbs_declare_variable(Db2SqlExecParser.Dbs_declare_variableContext ctx) {
        return addTreeNode(ctx, Db2DeclareVariableNode::new);
    }

    @Override
    public List<Node> visitProcedureDivisionRules(Db2SqlExecParser.ProcedureDivisionRulesContext ctx) {
        return addTreeNode(ctx, Db2ProcedureDivisionNode::new);
    }

    @Override
    public List<Node> visitDbs_whenever(Db2SqlExecParser.Dbs_wheneverContext ctx) {
      ExecSqlWheneverNode.WheneverConditionType conditionType = Db2SqlVisitorHelper.getConditionType(ctx);
      Pair<ExecSqlWheneverNode.WheneverType, String> result = Db2SqlVisitorHelper.getWheneverType(ctx);

      return addTreeNode(ctx, location -> new ExecSqlWheneverNode(location,
          conditionType,
          result.getKey(),
          result.getValue()));
    }

    @Override
    public List<Node> visitRulesAllowedInDataDivisionAndProcedureDivision(
            Db2SqlExecParser.RulesAllowedInDataDivisionAndProcedureDivisionContext ctx) {
        return addTreeNode(ctx, Db2DataAndProcedureDivisionNode::new);
    }

    @Override
    public List<Node> visitDbs_host_identifier(Db2SqlExecParser.Dbs_host_identifierContext ctx) {
        Location location = context.getExtendedDocument().mapLocation(AntlrRangeUtils.constructRange(ctx));
        Locality locality = Locality.builder().range(location.getRange()).uri(location.getUri()).build();
        QualifiedReferenceNode groupNode = new QualifiedReferenceNode(locality);
        List<Db2SqlExecParser.Dbs_sql_identifierContext> identifiers = ctx.dbs_sql_identifier();
        for (int i = identifiers.size() - 1; i >= 0; i--) {
            addVariableUsageNode(groupNode, identifiers.get(i));
        }
        return ImmutableList.of(groupNode);
    }

    private void addVariableUsageNode(QualifiedReferenceNode groupNode, Db2SqlExecParser.Dbs_sql_identifierContext identifierCtx) {
        Location varLocation = context.getExtendedDocument().mapLocation(AntlrRangeUtils.constructRange(identifierCtx));
        Locality varLocality = Locality.builder().range(varLocation.getRange()).uri(varLocation.getUri()).build();
        groupNode.addChild(new VariableUsageNode(getName(identifierCtx), varLocality));
    }

    @Override
    public List<Node> visitDbs_sql_variable_reference(Db2SqlExecParser.Dbs_sql_variable_referenceContext ctx) {
        return addTreeNode(ctx, QualifiedReferenceNode::new);
    }

    @Override
    public List<Node> visitDbs_host_label(Db2SqlExecParser.Dbs_host_labelContext ctx) {
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

        if (ctx instanceof Db2SqlExecParser.Dbs_sql_variable_referenceContext && !isSpecialName(ctx)) {
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
        if (ctx instanceof Db2SqlExecParser.Dbs_special_nameContext) {
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
        Location location = context.getExtendedDocument().mapLocation(AntlrRangeUtils.constructRange(ctx));
        Node node =
                nodeConstructor.apply(
                        Locality.builder().range(location.getRange()).uri(location.getUri()).build());
        visitChildren(ctx).forEach(node::addChild);
        return ImmutableList.of(node);
    }

    private List<Node> addVariableUsageNodes(ParserRuleContext ctx) {
        String name = getName(ctx);
        boolean hasColumn = name.startsWith(":");
        if (hasColumn) {
            name = name.substring(1);
        }

        if (Db2SqlVisitorHelper.isGroupName(name)) {
            Locality locality =
                    VisitorHelper.buildNameRangeLocality(ctx, name, context.getExtendedDocument().getUri());

            return Db2SqlVisitorHelper.generateGroupNodes(name, locality);
        }
        String finalName = name;
        return addTreeNode(ctx, locality -> new VariableUsageNode(finalName, locality));
    }
 }
