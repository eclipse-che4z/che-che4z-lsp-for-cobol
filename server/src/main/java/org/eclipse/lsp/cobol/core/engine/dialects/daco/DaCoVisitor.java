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
package org.eclipse.lsp.cobol.core.engine.dialects.daco;

import com.google.common.collect.ImmutableList;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.DaCoParser;
import org.eclipse.lsp.cobol.core.DaCoParser.DacoStatementsContext;
import org.eclipse.lsp.cobol.core.DaCoParser.QualifiedDataNameContext;
import org.eclipse.lsp.cobol.core.DaCoParser.VariableUsageNameContext;
import org.eclipse.lsp.cobol.core.DaCoParserBaseVisitor;
import org.eclipse.lsp.cobol.core.engine.dialects.DialectUtils;
import org.eclipse.lsp.cobol.core.engine.dialects.TextReplacement;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.SortTableNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;
import org.eclipse.lsp.cobol.core.visitor.VisitorHelper;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import static org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionUtil.AREA_A_FINISH;

/**
 *  This extension of {@link DaCoParserBaseVisitor} applies the semantic analysis based on the
 *  abstract syntax tree built by {@link DaCoParser}.
 */
@Slf4j
public class DaCoVisitor extends DaCoParserBaseVisitor<List<Node>> {
  private final List<SyntaxError> errors = new ArrayList<>();
  private final String uri;
  private final TextReplacement textReplacement;
  private final MessageService messageService;

  public DaCoVisitor(String uri, String text, MessageService messageService) {
    this.uri = uri;
    this.messageService = messageService;
    textReplacement = new TextReplacement(text);
  }

  public String getResultedText() {
    return textReplacement.getResultingText();
  }

  @Override
  public List<Node> visitDacoStatements(DacoStatementsContext ctx) {
    textReplacement.addReplacementContext(ctx);
    return visitChildren(ctx);
  }

  @Override
  public List<Node> visitStatementPrefix(DaCoParser.StatementPrefixContext ctx) {
    areaAWarning(ctx);
    textReplacement.addReplacementContext(ctx, "",  " ");
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
    return addTreeNode(ctx, locality -> new VariableUsageNode(VisitorHelper.getName(ctx), locality));
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
  private void areaAWarning(ParserRuleContext ctx) {
    Locality locality = constructLocality(ctx);
    if (locality.getRange().getStart().getCharacter() > AREA_A_FINISH) {
      SyntaxError error =
              SyntaxError.syntaxError()
                      .locality(locality)
                      .suggestion(messageService.getMessage("DaCoVisitor.AreaAWarningMsg") + ctx.getStart().getText())
                      .severity(ErrorSeverity.WARNING)
                      .build();
      LOG.debug("Syntax error by DaCoVisitor#throwException: {}", error);
      if (!errors.contains(error)) {
        errors.add(error);
      }
    }
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    Node node = nodeConstructor.apply(constructLocality(ctx));
    visitChildren(ctx).forEach(node::addChild);
    return ImmutableList.of(node);
  }

  private Locality constructLocality(ParserRuleContext ctx) {
    return Locality.builder()
        .uri(uri)
        .range(DialectUtils.constructRange(ctx))
        .build();
  }

  public List<SyntaxError> getErrors() {
    return errors;
  }
}
