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
package org.eclipse.lsp.cobol.core.engine.flavors;

import com.google.common.collect.ImmutableList;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.eclipse.lsp.cobol.core.FlavorLexer;
import org.eclipse.lsp.cobol.core.FlavorParser;
import org.eclipse.lsp.cobol.core.FlavorParser.FlavorRuleDefineContext;
import org.eclipse.lsp.cobol.core.FlavorParser.FlavorRuleUseContext;
import org.eclipse.lsp.cobol.core.FlavorParser.FlavorRulesContext;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.tree.variables.QualifiedReferenceNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableNameAndLocality;
import org.eclipse.lsp.cobol.core.model.tree.variables.VariableUsageNode;

import java.util.ArrayList;
import java.util.List;

/**
 * Simple demo flavor with variable definition and usage rules.
 *
 * FOO BAR _IDENTIFIER_ - is equivalent to 01 _IDENTIFIER_ 9(9).
 * FOO USE _IDENTIFIER_ - is using variable named __IDENTIFIER__
 */
public final class CobolFlavorImpl {

  public static final String NAME = "flv";

  private final String uri;
  private final String text;
  private final List<Node> flavorNodes;
  private final List<SyntaxError> errors;
  private final TextReplacement textReplacement;

  private CobolFlavorImpl(String uri, String text) {
    this.uri = uri;
    this.text = text;
    flavorNodes = new ArrayList<>();
    errors = new ArrayList<>();
    textReplacement = new TextReplacement(text);
  }

  /**
   * Processing the text according to the following rules:
   *
   * FOO BAR _IDENTIFIER_ - is equivalent to 01 _IDENTIFIER_ 9(9).
   * FOO USE _IDENTIFIER_ - is using variable named __IDENTIFIER__
   *
   * @param uri document URI
   * @param text document text
   * @return the flavor processing result
   */
  public static ResultWithErrors<FlavorOutcome> processText(String uri, String text) {
    return new CobolFlavorImpl(uri, text).process();
  }

  private ResultWithErrors<FlavorOutcome> process() {
    FlavorLexer lexer = new FlavorLexer(CharStreams.fromString(text));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    FlavorParser parser = new FlavorParser(tokens);
    parser.startRule().flavorRules().stream().forEach(this::process);
    return new ResultWithErrors<>(new FlavorOutcome(textReplacement.getResultingText(), flavorNodes), errors);
  }

  private void process(FlavorRulesContext ctx) {
    if (ctx.flavorRuleDefine() != null)
      process(ctx.flavorRuleDefine());
    else
      process(ctx.flavorRuleUse());
  }

  private void process(FlavorRuleDefineContext ctx) {
    textReplacement.addReplacementContest(ctx);
    flavorNodes.add(
        VariableDefinitionNode.builder()
            .level(1)
            .variableNameAndLocality(
                new VariableNameAndLocality(
                    ctx.IDENTIFIER().getText().toUpperCase(),
                    Locality.builder()
                        .uri(uri)
                        .range(FlavorUtils.constructRange(ctx.IDENTIFIER()))
                        .build()))
            .statementLocality(Locality.builder()
                .uri(uri)
                .range(FlavorUtils.constructRange(ctx))
                .build())
            .picClauses(ImmutableList.of("9(9)"))
            .build());
  }

  private void process(FlavorRuleUseContext ctx) {
    textReplacement.addReplacementContest(ctx);
    Locality varLocality = Locality.builder()
        .uri(uri)
        .range(FlavorUtils.constructRange(ctx.IDENTIFIER()))
        .build();
    Node qualifiedRef = new QualifiedReferenceNode(varLocality);
    Node varUsage = new VariableUsageNode(ctx.IDENTIFIER().getText().toUpperCase(), varLocality);
    qualifiedRef.addChild(varUsage);
    flavorNodes.add(qualifiedRef);
  }
}
