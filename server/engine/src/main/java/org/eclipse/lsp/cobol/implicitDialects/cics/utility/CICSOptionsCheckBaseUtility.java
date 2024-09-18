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

  private final Map<String, ErrorSeverity> baseDuplicateOptions =
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
    this.baseDuplicateOptions.putAll(duplicateOptions);
    this.subGroups.putAll(subGroups);
  }

  public CICSOptionsCheckBaseUtility(
      DialectProcessingContext context,
      List<SyntaxError> errors,
      Map<String, ErrorSeverity> duplicateOptions) {
    this.context = context;
    this.errors = errors;
    this.baseDuplicateOptions.putAll(duplicateOptions);
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
   * Iterates over the provided response handlers, extracts what is provided, and validates there is
   * not RESP2 without RESP
   *
   * @param ruleHandlers Response handlers from parser rule
   */
  protected void checkResponseHandlers(CICSParser.Cics_handle_responseContext ruleHandlers) {
    boolean respFound = false;
    List<TerminalNode> respTwoResponseHandlers = new ArrayList<>();
    if (ruleHandlers.cics_inline_handle_exception() != null) {
      List<CICSParser.Cics_respContext> rules =
          ruleHandlers.cics_inline_handle_exception().cics_resp();
      for (CICSParser.Cics_respContext rule : rules) {
        if (rule.RESP() != null) respFound = true;
        if (rule.RESP2() != null) respTwoResponseHandlers.add(rule.RESP2());
      }
    }
    if (!respFound) {
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

  /**
   * Checks context passed as parameter for duplicate options by traversing the Parse Tree. Also
   * iterates over the response handler by calling checkResponseHandler(), if the
   * Cics_handle_response context is found, to ensure there is not a RESP2 option provided without a
   * RESP option
   *
   * @param ctx ParserRuleContext To evaluate
   * @param duplicateOptions Custom duplicate options to evaluate against
   */
  private void checkDuplicateEntries(
      ParserRuleContext ctx, Set<String> entries, Map<String, ErrorSeverity> duplicateOptions) {

    if (ctx.getChildCount() == 0) return;

    for (ParseTree entry : ctx.children) {
      String option = entry.getText().toUpperCase();
      if (duplicateOptions.containsKey(option)) {
        if (!entries.add(option)) {
          throwException(
              duplicateOptions.get(option),
              getLocality(entry),
              "Excessive options provided for: ",
              option);
        }
      } else if (ParserRuleContext.class.isAssignableFrom(entry.getClass())) {
        String className = entry.getClass().getSimpleName();
        Pair<String, ErrorSeverity> subGroup = subGroups.getOrDefault(className, null);
        if (className.equals("Cics_handle_responseContext"))
          checkResponseHandlers((CICSParser.Cics_handle_responseContext) entry);
        if (subGroup != null && !entries.add(className)) {
          throwException(
              subGroup.getRight(),
              getLocality(entry),
              "Excessive options provided for: ",
              subGroup.getLeft());
        } else checkDuplicateEntries((ParserRuleContext) entry, entries, duplicateOptions);
      }
    }
  }

  /**
   * Client accessible entrypoint to check for duplicates.
   *
   * @param ctx Higher order context as ParserRuleContext to traverse for duplicates
   */
  protected void checkDuplicates(ParserRuleContext ctx) {
    Set<String> foundEntries = new HashSet<>();
    checkDuplicateEntries(ctx, foundEntries, baseDuplicateOptions);
  }

  /**
   * Additional check duplicates method that can utilize custom duplicate error severity options not
   * used for the whole command set
   *
   * @param ctx ParserRuleContext To evaluate
   * @param customDuplicateOptions Custom duplicate options to evaluate against
   */
  protected void checkDuplicates(
      ParserRuleContext ctx, Map<String, ErrorSeverity> customDuplicateOptions) {
    Set<String> foundEntries = new HashSet<>();
    Map<String, ErrorSeverity> updatedDuplicateOptions = new HashMap<>(baseDuplicateOptions);
    updatedDuplicateOptions.putAll(customDuplicateOptions);
    checkDuplicateEntries(ctx, foundEntries, updatedDuplicateOptions);
  }

  /**
   * Flags errors for rule lists passed as parameters if there are multiple instances of mutually
   * exclusive options.
   *
   * @param options Options checked to insert into error message
   * @param rules Lists of TerminalNode to iterate through
   * @return Number of TerminalNode instances found
   */
  protected int checkHasMutuallyExclusiveOptions(String options, List<TerminalNode>... rules) {
    int tokenType = -1;
    int occurances = 0;
    for (List<TerminalNode> option : rules) {
      if (option.isEmpty()) continue;
      for (TerminalNode rule : option) {
        if (rule == null) continue;
        if (tokenType < 0) {
          tokenType = rule.getSymbol().getType();
          occurances++;
          continue;
        }
        // Flag only options that do NOT match the first option encountered.
        // If the option is the same then this is already flagged by checkDuplicates
        if (tokenType != rule.getSymbol().getType()) {
          throwException(
              ErrorSeverity.ERROR,
              getLocality(rule),
              "Exactly one option required, options are mutually exclusive: ",
              options);
        }
        occurances++;
      }
    }
    return occurances;
  }

  protected <E extends ParseTree> void checkHasExactlyOneOption(
      String options, ParserRuleContext parentCtx, List<E>... rules) {
    List<TerminalNode> children = new ArrayList<>();
    for (List<E> rule : rules) {
      if (!rule.isEmpty()) {
        if (TerminalNode.class.isAssignableFrom(rule.get(0).getClass()))
          children.addAll((List<TerminalNode>) rule);
        else {
          for (E context : rule) {
            getAllTokenChildren((ParserRuleContext) context, children);
          }
        }
      }
    }
    if (checkHasMutuallyExclusiveOptions(options, children) == 0) {
      throwException(
          ErrorSeverity.ERROR,
          getLocality(parentCtx),
          "Exactly one option required, none provided: ",
          options);
    }
  }

  private void getAllTokenChildren(ParserRuleContext ctx, List<TerminalNode> children) {
    for (ParseTree child : ctx.children) {
      if (TerminalNode.class.isAssignableFrom(child.getClass())
          && baseDuplicateOptions.containsKey(child.getText().toUpperCase()))
        children.add((TerminalNode) child);
      else if (ParserRuleContext.class.isAssignableFrom(child.getClass()))
        getAllTokenChildren((ParserRuleContext) child, children);
    }
  }
}
