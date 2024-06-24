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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
import org.eclipse.lsp.cobol.common.copybook.CopybookService;
import org.eclipse.lsp.cobol.common.dialects.CobolDialect;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.model.tree.variable.*;
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
    private final CopybookService copybookService;
    private static final Pattern DOUBLE_DASH_SQL_COMMENT =
            Pattern.compile("--\\s[^\\r\\n]*", Pattern.MULTILINE);

    @Getter
    private final List<SyntaxError> errors = new LinkedList<>();

    @Override
    public List<Node> visitDbs_host_variable(Db2SqlParser.Dbs_host_variableContext ctx) {
        return addTreeNode(ctx, QualifiedReferenceNode::new);
    }

    @Override
    public List<Node> visitExecRule(Db2SqlParser.ExecRuleContext ctx) {
        addReplacementContext(ctx);
        return super.visitExecRule(ctx);
    }

    @Override
    public List<Node> visitResult_set_locator_host_variable(
            Db2SqlParser.Result_set_locator_host_variableContext ctx) {
        addReplacementContext(ctx);
        Locality statementLocality =
                getLocality(this.context.getExtendedDocument().mapLocation(constructRange(ctx)));

        // semantics node just checks that the statement is present at right location
        Db2WorkingAndLinkageSectionNode semanticsNode =
                new Db2WorkingAndLinkageSectionNode(statementLocality);

        // variable definition node
        VariableDefinitionNode variableDefinitionNode =
                VariableDefinitionNode.builder()
                        .level(Integer.parseInt(ctx.dbs_level_01().getText()))
                        .levelLocality(
                                getLocality(
                                        this.context.getExtendedDocument().mapLocation(constructRange(ctx.dbs_level_01()))))
                        .statementLocality(statementLocality)
                        .variableNameAndLocality(
                                new VariableNameAndLocality(
                                        VisitorHelper.getName(ctx.entry_name()),
                                        getLocality(
                                                this.context
                                                        .getExtendedDocument()
                                                        .mapLocation(constructRange(ctx.entry_name())))))
                        .usageClauses(ImmutableList.of(UsageFormat.DISPLAY))
                        .build();
        variableDefinitionNode.addChild(semanticsNode);
        return ImmutableList.of(variableDefinitionNode);
    }

    @Override
    public List<Node> visitBinary_host_variable(Db2SqlParser.Binary_host_variableContext ctx) {
        addReplacementContext(ctx);
        Locality statementLocality = getLocality(this.context.getExtendedDocument().mapLocation(constructRange(ctx)));

        Db2WorkingAndLinkageSectionNode semanticsNode = new Db2WorkingAndLinkageSectionNode(statementLocality);

        VariableDefinitionNode variableDefinitionNode =
                VariableDefinitionNode.builder()
                        .level(Integer.parseInt(ctx.dbs_level_01().getText()))
                        .levelLocality(
                                getLocality(
                                        this.context.getExtendedDocument().mapLocation(constructRange(ctx.entry_name()))))
                        .statementLocality(statementLocality)
                        .variableNameAndLocality(
                                new VariableNameAndLocality(
                                        VisitorHelper.getName(ctx.entry_name()),
                                        getLocality(
                                                this.context
                                                        .getExtendedDocument()
                                                        .mapLocation(constructRange(ctx.entry_name())))))
                        .usageClauses(ImmutableList.of(UsageFormat.DISPLAY))
                        .build();
        if (ctx.binary_host_variable_type().VARBINARY() != null) {
            generateVarbinVariables(variableDefinitionNode, ctx.binary_host_variable_type().binary_host_variable_varbinary_size().getText());
        }
        variableDefinitionNode.addChild(semanticsNode);
        return ImmutableList.of(variableDefinitionNode);
    }

    private void generateVarbinVariables(VariableDefinitionNode variableDefinitionNode, String len) {
        int generatedVariableLevel = 49;
        VariableNode variableLenNode = new ElementaryItemNode(variableDefinitionNode.getLevelLocality(),
                generatedVariableLevel,
                variableDefinitionNode.getVariableName().getName() + "-LEN",
                false, "S9(4)", "",
                UsageFormat.BINARY, false, false, false);

        VariableNode variableTextNode = new ElementaryItemNode(variableDefinitionNode.getLevelLocality(),
                generatedVariableLevel,
                variableDefinitionNode.getVariableName().getName() + "-TEXT",
                false, "X(" + len + ")", "",
                UsageFormat.UNDEFINED, false, false, false);

        variableLenNode.getChildren().add(new VariableDefinitionNameNode(
                variableDefinitionNode.getVariableName().getLocality(), variableLenNode.getName()));
        variableTextNode.getChildren().add(new VariableDefinitionNameNode(
                variableDefinitionNode.getVariableName().getLocality(), variableTextNode.getName()));

        variableDefinitionNode.addChild(variableLenNode);
        variableDefinitionNode.addChild(variableTextNode);
    }

    private Locality getLocality(Location location) {
        Locality.LocalityBuilder builder =
                Locality.builder().uri(location.getUri()).range(location.getRange());
        String docUri = context.getExtendedDocument().getUri();
        if (!docUri.equals(location.getUri())) {
            copybookService.getCopybookUsage(docUri).stream()
                    .filter(model -> model.getUri().equals(location.getUri()))
                    .findFirst()
                    .ifPresent(model -> builder.copybookId(model.getCopybookName().getDisplayName()));
        }
        return builder.build();
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
        Position start =
                new Position(ctx.getSymbol().getLine() - 1, ctx.getSymbol().getCharPositionInLine());
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
        String sqlCode = preProcessSqlComment(ctx);
        List<Node> nodes = this.visitStartSqlRule(parseSQL(sqlCode, ctx));
        Db2SqlVisitorHelper.adjustNodeLocations(ctx, context, nodes);
        return nodes;
    }

    private String preProcessSqlComment(Db2SqlParser.SqlCodeContext ctx) {
        String sqlCode = VisitorHelper.getIntervalText(ctx);
        Matcher matcher = DOUBLE_DASH_SQL_COMMENT.matcher(sqlCode);
        while (matcher.find()) {
            Position start = findPosition(sqlCode, matcher.start());
            Position end = findPosition(sqlCode, matcher.end() - 1);
            String replace = StringUtils.repeat(CobolDialect.FILLER, matcher.end() - matcher.start() - 1);
            start = Db2SqlVisitorHelper.getAdjustedStartPosition(ctx, start);
            end = Db2SqlVisitorHelper.getAdjustedEndPosition(ctx, end);
            context.getExtendedDocument().replace(new Range(start, end), replace);
        }
        sqlCode = matcher.replaceAll("");
        return sqlCode;
    }

    private static Position findPosition(String text, int pos) {
        int c = 1;
        int line = 0;
        int col = 1;
        while (c <= pos) {
            if (text.charAt(c) == '\n') {
                ++line;
                col = 1;
            } else {
                ++col;
            }
            c++;
        }
        return new Position(line, col);
    }

    @Override
    public List<Node> visitRulesAllowedInWorkingStorageAndLinkageSection(
            Db2SqlParser.RulesAllowedInWorkingStorageAndLinkageSectionContext ctx) {
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
    public List<Node> visitRulesAllowedInDataDivisionAndProcedureDivision(
            Db2SqlParser.RulesAllowedInDataDivisionAndProcedureDivisionContext ctx) {
        return addTreeNode(ctx, Db2DataAndProcedureDivisionNode::new);
    }

    private Db2SqlParser.StartSqlRuleContext parseSQL(
            String sqlCode, Db2SqlParser.SqlCodeContext sqlCodeContext) {
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
