/*
 * Copyright (c) 2024 Broadcom.
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

package org.eclipse.lsp.cobol.implicitDialects.cics.utility;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Common facilities for checking CICS parser options */
@Slf4j
public abstract class CICSOptionsCheckBaseUtility {

  private final DialectProcessingContext context;

  private final List<SyntaxError> errors;

  public CICSOptionsCheckBaseUtility(DialectProcessingContext context, List<SyntaxError> errors) {
    this.context = context;
    this.errors = errors;
  }

  /**
   * General entrypoint to check CICS rule options
   *
   * @param ctx ParserRuleContext subclass containging options
   * @param <E> A subclass of ParserRuleContext
   */
  public abstract <E extends ParserRuleContext> void checkOptions(E ctx);

  /**
   * Checks for duplicate option entries
   *
   * @param options Lists of Target rule List and String pairs to check for duplicates of where
   *     String is the name of the option to check for and the rule list is the context to check for
   *     duplicates
   */
  protected void checkDuplicates(List<RuleContextData> options) {
    for (RuleContextData option : options) {
      if (option.rules.size() >= 2) {
        option
            .rules
            .subList(1, option.rules.size())
            .forEach(
                error ->
                    throwException(
                        option.ruleName,
                        getLocality(error),
                        "Excessive options provided for: ",
                        option.severity));
      }
    }
  }

  /**
   * Helper method to collect analysis errors if the rule context does not contain mandatory options
   *
   * @param rules Generic list of rules to check. Will either be a collection of ParserRuleContext
   *     or TerminalNode
   * @param ctx Context to extrapolate locality against
   * @param options Options checked to insert into error message
   */
  protected void checkHasMandatoryOptions(List<?> rules, ParserRuleContext ctx, String options) {
    if (rules.isEmpty()) {
      throwException(
          options,
          VisitorUtility.constructLocality(ctx, context),
          "Missing required option: ",
          ErrorSeverity.ERROR);
    }
  }

  /**
   * Helper method to collect analysis errors if the rule context contains illegal options
   *
   * @param rules Generic list of rules to check. Will either be a collection of ParserRuleContext
   *     or TerminalNode
   * @param options Options checked to insert into error message
   */
  protected void checkHasIllegalOptions(List<?> rules, String options) {
    if (!rules.isEmpty()) {
      rules.forEach(
          error ->
              throwException(
                  options, getLocality(error), "Invalid option provided: ", ErrorSeverity.ERROR));
    }
  }

  /**
   * Iterates over the provided response handlers, extracts what is provided, and validates
   *
   * @param ruleHandlers
   * @return List of Rule Context Data
   */
  protected void checkResponseHandlers(List<CICSParser.Cics_handle_responseContext> ruleHandlers) {

    List<TerminalNode> respResponseHandlers = new ArrayList<>();
    List<TerminalNode> respTwoResponseHandlers = new ArrayList<>();
    ruleHandlers.forEach(
        optionOne -> {
          if (optionOne.cics_inline_handle_exception() != null) {
            optionOne
                .cics_inline_handle_exception()
                .cics_resp()
                .forEach(
                    optionTwo -> {
                      if (optionTwo.RESP() != null) respResponseHandlers.add(optionTwo.RESP());
                      if (optionTwo.RESP2() != null) respTwoResponseHandlers.add(optionTwo.RESP2());
                    });
          }
        });

    if (respResponseHandlers.isEmpty()) {
      checkHasIllegalOptions(respTwoResponseHandlers, "RESP2");
    }
  }

  private <E> Locality getLocality(E rule) {
    if (ParserRuleContext.class.isAssignableFrom(rule.getClass()))
      return VisitorUtility.constructLocality((ParserRuleContext) rule, context);
    else return VisitorUtility.constructLocality((TerminalNode) rule, context);
  }

  private void throwException(
      String wrongToken, @NonNull Locality locality, String message, ErrorSeverity errorSeverity) {
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(locality.toOriginalLocation())
            .suggestion(message + wrongToken)
            .severity(errorSeverity)
            .build();

    LOG.debug("Syntax error by CobolVisitor#throwException: {}", error);
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  private void checkDuplicateEntries(
      ParserRuleContext ctx,
      Map<Integer, TerminalNode> entries,
      Map<String, ErrorSeverity> specialSeverities) {
    if (ctx.getChildCount() != 0) {
      for (ParseTree entry : ctx.children) {
        if (entry.getChildCount() == 0) {
          TerminalNode current = (TerminalNode) entry;
          if (current.getSymbol().getType() < 897) {
            if (entries.containsKey(current.getSymbol().getType())) {
              ErrorSeverity severity = ErrorSeverity.ERROR;
              if (specialSeverities.containsKey(current.getText())) {
                severity = specialSeverities.get(current.getText());
              }
              throwException(
                  current.getText(),
                  getLocality(current),
                  "Excessive options provided for: ",
                  severity);
            } else entries.put(current.getSymbol().getType(), current);
          }

        } else checkDuplicateEntries((ParserRuleContext) entry, entries, specialSeverities);
      }
    }
  }

  protected void checkDuplicates(
      ParserRuleContext ctx, Map<String, ErrorSeverity> specialSeverities) {
    Map<Integer, TerminalNode> entries = new HashMap<>();
    checkDuplicateEntries(ctx, entries, specialSeverities);
  }

  protected void checkDuplicates(ParserRuleContext ctx) {
    checkDuplicates(ctx, new HashMap<String, ErrorSeverity>());
  }

  /** Container to store rule context data */
  @AllArgsConstructor
  @NoArgsConstructor
  @RequiredArgsConstructor
  public class RuleContextData {
    @lombok.NonNull public List<?> rules;
    @lombok.NonNull public String ruleName;
    public ErrorSeverity severity = ErrorSeverity.ERROR;
  }
}
