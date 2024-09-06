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
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSLexer;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.*;

/** Common facilities for checking CICS parser options */
@Slf4j
public abstract class CICSOptionsCheckBaseUtility {

  private final DialectProcessingContext context;

  private final List<SyntaxError> errors;

  public static final Map<String, Pair<ErrorSeverity, String>> COMMON_SUBGROUPS =
      new HashMap<String, Pair<ErrorSeverity, String>>() {
        {
          put(
              "Cics_handle_responseContext",
              new ImmutablePair<>(ErrorSeverity.ERROR, "RESPONSE HANDLER"));
        }
      };

  private static final Map<String, ErrorSeverity> SPECIAL_SEVERITIES =
      new HashMap<String, ErrorSeverity>() {
        {
          put("ASIS", ErrorSeverity.WARNING);

          put("BUFFER", ErrorSeverity.WARNING);

          put("LEAVEKB", ErrorSeverity.WARNING);

          put("NOTRUNCATE", ErrorSeverity.WARNING);

          put("NOQUEUE", ErrorSeverity.WARNING);

          put("NOTRUNCATE", ErrorSeverity.WARNING);

          put("TERMINAL", ErrorSeverity.WARNING);
        }
      };

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
      Map<String, ParseTree> entries,
      Map<String, Pair<ErrorSeverity, String>> subGroups) {

    if (ctx.getChildCount() != 0) {
      for (ParseTree entry : ctx.children) {
        if (entry.getChildCount() == 0) {
          if (Arrays.stream(CICSLexer.ruleNames)
              .anyMatch(rule -> rule.equals(entry.getText().toUpperCase()))) {
            if (entries.putIfAbsent(entry.getText(), entry) != null) {
              ErrorSeverity severity =
                  SPECIAL_SEVERITIES.getOrDefault(
                      entry.getText().toUpperCase(), ErrorSeverity.ERROR);
              throwException(
                  entry.getText(),
                  getLocality(entry),
                  "Excessive options provided for: ",
                  severity);
            }
          }
        } else {
          String className = "";
          if (entry.getClass().toString().split("\\$").length > 0) {
            className = entry.getClass().toString().split("\\$")[1];
          }
          boolean errorFound = false;
          Pair<ErrorSeverity, String> subGroup = subGroups.getOrDefault(className, null);
          if (subGroup != null) {
            if (entries.putIfAbsent(className, entry) != null) {
              errorFound = true;
              throwException(
                  subGroup.getRight(),
                  getLocality(entry),
                  "Excessive options provided for: ",
                  subGroup.getLeft());
            }
          }
          if (!errorFound) checkDuplicateEntries((ParserRuleContext) entry, entries, subGroups);
        }
      }
    }
  }

  protected void checkDuplicates(
      ParserRuleContext ctx, Map<String, Pair<ErrorSeverity, String>> subGroups) {
    Map<String, ParseTree> entries = new HashMap<>();
    subGroups.putAll(COMMON_SUBGROUPS);
    checkDuplicateEntries(ctx, entries, subGroups);
  }

  protected void checkDuplicates(ParserRuleContext ctx) {
    checkDuplicates(ctx, Collections.emptyMap());
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
