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

import lombok.NonNull;
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
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.*;

/** Common facilities for checking CICS parser options */
@Slf4j
public abstract class CICSOptionsCheckBaseUtility {

  private final DialectProcessingContext context;

  private final List<SyntaxError> errors;

  private final Map<String, ErrorSeverity> originalDuplicateOptions =
      new HashMap<String, ErrorSeverity>() {
        { // handle response options
          put("RESP", ErrorSeverity.ERROR);
          put("RESP2", ErrorSeverity.ERROR);
          put("WAIT", ErrorSeverity.ERROR);
          put("NOHANDLE", ErrorSeverity.ERROR);
        }
      };

  private final Map<String, Pair<String, ErrorSeverity>> subGroups =
      new HashMap<String, Pair<String, ErrorSeverity>>() {
        {
          put(
              "Cics_handle_responseContext",
              new ImmutablePair<>("RESPONSE HANDLER", ErrorSeverity.ERROR));
        }
      };

  public CICSOptionsCheckBaseUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      Map<String, ErrorSeverity> duplicateOptions,
      Map<String, Pair<String, ErrorSeverity>> subGroups) {
    this.context = context;
    this.errors = errors;
    this.originalDuplicateOptions.putAll(duplicateOptions);
    this.subGroups.putAll(subGroups);
  }

  public CICSOptionsCheckBaseUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      Map<String, ErrorSeverity> duplicateOptions) {
    this.context = context;
    this.errors = errors;
    this.originalDuplicateOptions.putAll(duplicateOptions);
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
          ErrorSeverity.ERROR,
          VisitorUtility.constructLocality(ctx, context),
          "Missing required option: ",
          options);
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
                  ErrorSeverity.ERROR, getLocality(error), "Invalid option provided: ", options));
    }
  }

  /**
   * Iterates over the provided response handlers, extracts what is provided, and validates
   *
   * @param ruleHandlers Response handlers from parser rule
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
      ErrorSeverity errorSeverity, @NonNull Locality locality, String message, String wrongToken) {
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
      Map<String, ErrorSeverity> entries,
      Map<String, ErrorSeverity> duplicateOptions) {

    if (ctx.getChildCount() != 0) {
      for (ParseTree entry : ctx.children) {
        if (entry.getChildCount() == 0) {
          String option = entry.getText().toUpperCase();
          if (duplicateOptions.containsKey(option)) {
            ErrorSeverity severity =
                entries.putIfAbsent(entry.getText(), duplicateOptions.get(option));
            if (severity != null) {
              throwException(
                  severity, getLocality(entry), "Excessive options provided for: ", option);
            }
          }
        } else {
          String className = entry.getClass().getSimpleName();
          boolean errorFound = false;
          Pair<String, ErrorSeverity> subGroup = subGroups.getOrDefault(className, null);
          if (subGroup != null) {
            if (entries.putIfAbsent(className, subGroup.getRight()) != null) {
              errorFound = true;
              throwException(
                  subGroup.getRight(),
                  getLocality(entry),
                  "Excessive options provided for: ",
                  subGroup.getLeft());
            }
          }
          if (!errorFound)
            checkDuplicateEntries((ParserRuleContext) entry, entries, duplicateOptions);
        }
      }
    }
  }

  protected void checkDuplicates(ParserRuleContext ctx) {
    Map<String, ErrorSeverity> foundEntries = new HashMap<>();
    checkDuplicateEntries(ctx, foundEntries, originalDuplicateOptions);
  }

  /**
   * Additional check duplicates method that can utilize custom duplicate error severity options
   * not used for the whole command set
   *
   * @param ctx ParserRuleContext To evaluate
   * @param customDuplicateOptions Custom duplicate options to evaluate against
   */
  protected void checkDuplicates(
      ParserRuleContext ctx, Map<String, ErrorSeverity> customDuplicateOptions) {
    Map<String, ErrorSeverity> foundEntries = new HashMap<>();
    Map<String, ErrorSeverity> updatedDuplicateOptions = new HashMap<>(originalDuplicateOptions);
    updatedDuplicateOptions.putAll(customDuplicateOptions);
    checkDuplicateEntries(ctx, foundEntries, updatedDuplicateOptions);
  }
}
