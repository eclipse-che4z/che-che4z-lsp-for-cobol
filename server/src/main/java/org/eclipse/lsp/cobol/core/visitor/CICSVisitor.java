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
import org.eclipse.lsp.cobol.core.CICSParser;
import org.eclipse.lsp.cobol.core.CICSParserBaseVisitor;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.CodeBlockUsageNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;
import org.eclipse.lsp.cobol.core.semantics.PredefinedVariableContext;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

/**
 * This visitor analyzes the parser tree for CICS and returns its semantic context as a syntax tree
 */
@Slf4j
@AllArgsConstructor
public class CICSVisitor extends CICSParserBaseVisitor<List<Node>> {
  private final Map<Token, Locality> positions;
  private final PredefinedVariableContext constants;

  @Override
  public List<Node> visitQualifiedDataNameFormat1(CICSParser.QualifiedDataNameFormat1Context ctx) {
    return addVariableUsage(ctx.dataName(), ctx, createParentsList(ctx.inData(), ctx.inTable()));
  }

  @Override
  public List<Node> visitTableCall(CICSParser.TableCallContext ctx) {
    return addVariableUsage(ctx.dataName(), ctx);
  }

  private List<Node> addVariableUsage(
      ParserRuleContext nameContext, ParserRuleContext parentContext) {
    return addVariableUsage(nameContext, parentContext, ImmutableList.of());
  }

  private List<Node> addVariableUsage(
      ParserRuleContext nameContext,
      ParserRuleContext parentContext,
      List<VariableNameAndLocality> hierarchy) {
    String dataName = VisitorHelper.getName(nameContext);
    List<Node> result = new ArrayList<>();
    getLocality(nameContext.getStart())
        .ifPresent(
            locality -> {
              if (constants.contains(dataName)) constants.addUsage(dataName, locality.toLocation());
              else {
                result.add(new VariableUsageNode(dataName, locality, hierarchy));
              }
            });
    result.addAll(visitChildren(parentContext));
    return result;
  }

  private List<VariableNameAndLocality> createParentsList(
      List<CICSParser.InDataContext> inData, List<CICSParser.InTableContext> inTable) {
    return retrieveDataNames(inData, inTable)
        .map(
            it ->
                getLocality(it.getStart())
                    .map(loc -> new VariableNameAndLocality(VisitorHelper.getName(it), loc))
                    .orElse(null))
        .filter(Objects::nonNull)
        .collect(Collectors.toList());
  }

  private Stream<CICSParser.DataNameContext> retrieveDataNames(
      List<CICSParser.InDataContext> inData, List<CICSParser.InTableContext> inTable) {
    return Stream.concat(
        inData.stream().map(CICSParser.InDataContext::dataName),
        inTable.stream()
            .map(CICSParser.InTableContext::tableCall)
            .map(CICSParser.TableCallContext::dataName));
  }

  @Override
  public List<Node> visitParagraphNameUsage(CICSParser.ParagraphNameUsageContext ctx) {
    String name = ctx.getText().toUpperCase();
    return addTreeNode(ctx, locality -> new CodeBlockUsageNode(locality, name));
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

  private Optional<Locality> getLocality(Token childToken) {
    return ofNullable(positions.get(childToken));
  }

  private List<Node> addTreeNode(ParserRuleContext ctx, Function<Locality, Node> nodeConstructor) {
    List<Node> children = visitChildren(ctx);
    return VisitorHelper.retrieveRangeLocality(ctx, positions)
        .map(VisitorHelper.constructNode(nodeConstructor, children))
        .orElse(children);
  }
}
