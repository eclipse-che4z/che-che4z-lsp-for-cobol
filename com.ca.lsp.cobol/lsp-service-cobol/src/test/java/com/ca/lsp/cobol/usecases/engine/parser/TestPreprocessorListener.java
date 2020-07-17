/*
 * Copyright (c) 2020 Broadcom.
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
package com.ca.lsp.cobol.usecases.engine.parser;
// Generated from .\TestPreprocessor.g4 by ANTLR 4.7.2

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by {@link
 * TestPreprocessorParser}.
 */
public interface TestPreprocessorListener extends ParseTreeListener {
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#startRule}.
   *
   * @param ctx the parse tree
   */
  void enterStartRule(TestPreprocessorParser.StartRuleContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#startRule}.
   *
   * @param ctx the parse tree
   */
  void exitStartRule(TestPreprocessorParser.StartRuleContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#multiTokenError}.
   *
   * @param ctx the parse tree
   */
  void enterMultiTokenError(TestPreprocessorParser.MultiTokenErrorContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#multiTokenError}.
   *
   * @param ctx the parse tree
   */
  void exitMultiTokenError(TestPreprocessorParser.MultiTokenErrorContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#multiToken}.
   *
   * @param ctx the parse tree
   */
  void enterMultiToken(TestPreprocessorParser.MultiTokenContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#multiToken}.
   *
   * @param ctx the parse tree
   */
  void exitMultiToken(TestPreprocessorParser.MultiTokenContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#errorStatement}.
   *
   * @param ctx the parse tree
   */
  void enterErrorStatement(TestPreprocessorParser.ErrorStatementContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#errorStatement}.
   *
   * @param ctx the parse tree
   */
  void exitErrorStatement(TestPreprocessorParser.ErrorStatementContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#copybookStatement}.
   *
   * @param ctx the parse tree
   */
  void enterCopybookStatement(TestPreprocessorParser.CopybookStatementContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#copybookStatement}.
   *
   * @param ctx the parse tree
   */
  void exitCopybookStatement(TestPreprocessorParser.CopybookStatementContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#copybookUsage}.
   *
   * @param ctx the parse tree
   */
  void enterCopybookUsage(TestPreprocessorParser.CopybookUsageContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#copybookUsage}.
   *
   * @param ctx the parse tree
   */
  void exitCopybookUsage(TestPreprocessorParser.CopybookUsageContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#copybookDefinition}.
   *
   * @param ctx the parse tree
   */
  void enterCopybookDefinition(TestPreprocessorParser.CopybookDefinitionContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#copybookDefinition}.
   *
   * @param ctx the parse tree
   */
  void exitCopybookDefinition(TestPreprocessorParser.CopybookDefinitionContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#variableStatement}.
   *
   * @param ctx the parse tree
   */
  void enterVariableStatement(TestPreprocessorParser.VariableStatementContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#variableStatement}.
   *
   * @param ctx the parse tree
   */
  void exitVariableStatement(TestPreprocessorParser.VariableStatementContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#variableUsage}.
   *
   * @param ctx the parse tree
   */
  void enterVariableUsage(TestPreprocessorParser.VariableUsageContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#variableUsage}.
   *
   * @param ctx the parse tree
   */
  void exitVariableUsage(TestPreprocessorParser.VariableUsageContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#variableDefinition}.
   *
   * @param ctx the parse tree
   */
  void enterVariableDefinition(TestPreprocessorParser.VariableDefinitionContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#variableDefinition}.
   *
   * @param ctx the parse tree
   */
  void exitVariableDefinition(TestPreprocessorParser.VariableDefinitionContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#paragraphStatement}.
   *
   * @param ctx the parse tree
   */
  void enterParagraphStatement(TestPreprocessorParser.ParagraphStatementContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#paragraphStatement}.
   *
   * @param ctx the parse tree
   */
  void exitParagraphStatement(TestPreprocessorParser.ParagraphStatementContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#paragraphUsage}.
   *
   * @param ctx the parse tree
   */
  void enterParagraphUsage(TestPreprocessorParser.ParagraphUsageContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#paragraphUsage}.
   *
   * @param ctx the parse tree
   */
  void exitParagraphUsage(TestPreprocessorParser.ParagraphUsageContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#paragraphDefinition}.
   *
   * @param ctx the parse tree
   */
  void enterParagraphDefinition(TestPreprocessorParser.ParagraphDefinitionContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#paragraphDefinition}.
   *
   * @param ctx the parse tree
   */
  void exitParagraphDefinition(TestPreprocessorParser.ParagraphDefinitionContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#diagnostic}.
   *
   * @param ctx the parse tree
   */
  void enterDiagnostic(TestPreprocessorParser.DiagnosticContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#diagnostic}.
   *
   * @param ctx the parse tree
   */
  void exitDiagnostic(TestPreprocessorParser.DiagnosticContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#word}.
   *
   * @param ctx the parse tree
   */
  void enterWord(TestPreprocessorParser.WordContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#word}.
   *
   * @param ctx the parse tree
   */
  void exitWord(TestPreprocessorParser.WordContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#replacement}.
   *
   * @param ctx the parse tree
   */
  void enterReplacement(TestPreprocessorParser.ReplacementContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#replacement}.
   *
   * @param ctx the parse tree
   */
  void exitReplacement(TestPreprocessorParser.ReplacementContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#identifier}.
   *
   * @param ctx the parse tree
   */
  void enterIdentifier(TestPreprocessorParser.IdentifierContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#identifier}.
   *
   * @param ctx the parse tree
   */
  void exitIdentifier(TestPreprocessorParser.IdentifierContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#cpyIdentifier}.
   *
   * @param ctx the parse tree
   */
  void enterCpyIdentifier(TestPreprocessorParser.CpyIdentifierContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#cpyIdentifier}.
   *
   * @param ctx the parse tree
   */
  void exitCpyIdentifier(TestPreprocessorParser.CpyIdentifierContext ctx);
  /**
   * Enter a parse tree produced by {@link TestPreprocessorParser#cpyName}.
   *
   * @param ctx the parse tree
   */
  void enterCpyName(TestPreprocessorParser.CpyNameContext ctx);
  /**
   * Exit a parse tree produced by {@link TestPreprocessorParser#cpyName}.
   *
   * @param ctx the parse tree
   */
  void exitCpyName(TestPreprocessorParser.CpyNameContext ctx);
}
