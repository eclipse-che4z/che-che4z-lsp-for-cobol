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
import org.eclipse.lsp.cobol.common.dialects.DialectProcessingContext;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.implicitDialects.cics.CICSParser;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/** Common facilities for checking CICS parser options */
@Slf4j
public abstract class CICSOptionsCheckBaseUtility {

  private final DialectProcessingContext context;

  private final List<SyntaxError> errors;

  private final Map<String, ErrorSeverity> baseDuplicateOptions =
          new HashMap<String, ErrorSeverity>() {
            {
              put("ASIS", ErrorSeverity.WARNING);
              put("BUFFER", ErrorSeverity.WARNING);
              put("LEAVEKB", ErrorSeverity.WARNING);
              put("NOTRUNCATE", ErrorSeverity.WARNING);
              put("NOQUEUE", ErrorSeverity.WARNING);
              put("NOTRUNCATE", ErrorSeverity.WARNING);
              // handle response options
              put("RESP", ErrorSeverity.ERROR);
              put("RESP2", ErrorSeverity.ERROR);
              put("WAIT", ErrorSeverity.ERROR);
              put("NOHANDLE", ErrorSeverity.ERROR);
            }
          };

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
   * @return true if mandatory option found
   */
  protected boolean checkHasMandatoryOptions(List<?> rules, ParserRuleContext ctx, String options) {
    if (rules.isEmpty()) {
      throwException(
              ErrorSeverity.ERROR,
              VisitorUtility.constructLocality(ctx, context),
              "Missing required option: ",
              options);
      return false;
    }
    return true;
  }

  protected void checkHasMandatoryOptions(TerminalNode rules, ParserRuleContext ctx, String options) {
    ArrayList<TerminalNode> tempList = new ArrayList<>();
    tempList.add(rules);
    checkHasMandatoryOptions(tempList, ctx, options);
  }

  /**
   *
   * @param requiredContext - The rule that is required
   * @param optionalContext - The rule that is optional
   * @param options - String of the element that is required.
   */
  protected void checkHasRequiredOption(ParserRuleContext requiredContext, ParserRuleContext optionalContext, String options) {
    checkHasRequiredOptionFromString(requiredContext.getText(), optionalContext.getText(), optionalContext, options);
  }

  /**
   *
   * @param requiredContext - The rule that is required
   * @param optionalContext - The rule that is optional
   * @param ctx - The overall context.
   * @param options - String of the element that is required.
   */
  protected void checkHasRequiredOption(List<TerminalNode> requiredContext, List<TerminalNode> optionalContext, ParserRuleContext ctx, String options) {
    checkHasRequiredOptionFromString(
            (requiredContext.isEmpty() ? "" : requiredContext.get(0).getText()),
            (optionalContext.isEmpty() ? "" : optionalContext.get(0).getText()),
            ctx, options);
  }

  protected void checkHasRequiredOption(TerminalNode requiredContext, TerminalNode optionalContext, ParserRuleContext ctx, String options) {
    checkHasRequiredOptionFromString(requiredContext.getText(), optionalContext.getText(), ctx, options);
  }

  protected void checkHasRequiredOption(ParserRuleContext requiredContext, TerminalNode optionalContext, ParserRuleContext ctx, String options) {
    checkHasRequiredOptionFromString(requiredContext.getText(), optionalContext.getText(), ctx, options);
  }

  protected void checkHasRequiredOption(TerminalNode requiredContext, ParserRuleContext optionalContext, ParserRuleContext ctx, String options) {
    checkHasRequiredOptionFromString(requiredContext.getText(), optionalContext.getText(), ctx, options);
  }

  protected void checkHasRequiredOption(TerminalNode requiredContext, List<TerminalNode> optionalContext, ParserRuleContext ctx, String options) {
    checkHasRequiredOptionFromString(requiredContext.getText(), (optionalContext.isEmpty() ? "" : optionalContext.get(0).getText()), ctx, options);
  }

  protected void checkHasRequiredOption(List<TerminalNode> requiredContext, TerminalNode optionalContext, ParserRuleContext ctx, String options) {
    checkHasRequiredOptionFromString((requiredContext.isEmpty() ? "" : requiredContext.get(0).getText()), optionalContext.getText(), ctx, options);
  }


  private void checkHasRequiredOptionFromString(String requiredContextText, String optionalContextText, ParserRuleContext ctx, String options) {
    if (requiredContextText.isEmpty() && !optionalContextText.isEmpty()) {
      throwException(
              ErrorSeverity.ERROR,
              VisitorUtility.constructLocality(ctx, context),
              "Missing required option \"" + options + "\" for " + optionalContextText,
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

  /**
   * Gets the locality of an element passed as a generic type. Only supports ParserRuleContext and
   * TerminalNode.
   *
   * @param rule Rule to construct locality for
   * @return The locality of the rule
   * @param <E> Generic locality source type
   */
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
    List<TerminalNode> children = new ArrayList<>();
    getAllTokenChildren(ctx, children, true);
    children.forEach(
            child -> {
              String option = child.getText().toUpperCase();
              if (duplicateOptions.containsKey(option)) {
                if (!entries.add(option)) {
                  throwException(
                          duplicateOptions.get(option),
                          getLocality(child),
                          "Excessive options provided for: ",
                          option);
                }
              }
            });
  }

  /**
   * Client accessible entrypoint to check for duplicates.
   *
   * @param ctx Higher order context as ParserRuleContext to traverse for duplicates
   */
  protected void checkDuplicates(ParserRuleContext ctx) {
    checkDuplicates(ctx, null);
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
    if (customDuplicateOptions != null) updatedDuplicateOptions.putAll(customDuplicateOptions);
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
    List<TerminalNode> nodes =
            Stream.of(rules)
                    .filter(rule -> !rule.isEmpty())
                    .flatMap(Collection::stream)
                    .collect(Collectors.toList());
    nodes.removeIf(Objects::isNull);

    // Only raise error if this validates mutual exclusivity and is not an artifact of duplicate
    // options
    if (!nodes.stream()
            .allMatch(e -> e.getSymbol().getType() == nodes.get(0).getSymbol().getType())) {
      nodes.forEach(
              node -> {
                throwException(
                        ErrorSeverity.ERROR,
                        getLocality(node),
                        "Exactly one option required, options are mutually exclusive: ",
                        options);
              });
    }
    return nodes.size();
  }

  /**
   * Helper method to collect analysis errors if the rule context contains illegal options
   *
   * @param rule Generic rule to check
   * @param options Options checked to insert into error message
   */
  protected void checkHasIllegalOptions(TerminalNode rule, String options) {
    if (!rule.getText().isEmpty()) {
      throwException(ErrorSeverity.ERROR, getLocality(rule), "Invalid option provided: ", options);
    }
  }

  /**
   * Helper function to check and see if more than one rule was visited out of a set provided.
   *
   * @param options Options checked to insert into error message
   * @param rules Generic list of rules to check. Will be a collection of ParserRuleContext and/or TerminalNode objects.
   * @param <E> Generic type to allow cross-rule context collection.
   */
  @SafeVarargs
  protected final <E> void checkMutuallyExclusiveOptions(String options, E... rules) {
    if (rules.length <= 1) {
      return;
    }

    int rulesSeen = 0;

    for (E rule : rules) {
      if (ParserRuleContext.class.isAssignableFrom(rule.getClass())) {
        if (!((ParserRuleContext) rule).isEmpty()) {
          rulesSeen++;
        }
      } else if (TerminalNode.class.isAssignableFrom(rule.getClass())) {
        if (!((TerminalNode) rule).getText().isEmpty()) {
          rulesSeen++;
        }
      }

      if (rulesSeen > 1) {
        throwException(ErrorSeverity.ERROR, getLocality(rule), "Options \"" + options + "\" are mutually exclusive, ", "");
        break;
      }
    }
  }



  protected <E extends ParseTree> void checkHasExactlyOneOption(
          String options, ParserRuleContext parentCtx, List<E>... rules) {

    List<TerminalNode> children = new ArrayList<>();

    Stream.of(rules)
            .filter(rule -> !rule.isEmpty())
            .forEach(
                    rule -> {
                      rule.removeIf(Objects::isNull);
                      if (TerminalNode.class.isAssignableFrom(rule.get(0).getClass()))
                        children.addAll((List<TerminalNode>) rule);
                      else
                        rule.forEach(
                                context -> getAllTokenChildren((ParserRuleContext) context, children, false));
                    });

    if (checkHasMutuallyExclusiveOptions(options, children) == 0) {
      throwException(
              ErrorSeverity.ERROR,
              getLocality(parentCtx),
              "Exactly one option required, none provided: ",
              options);
    }
  }

  private void getAllTokenChildren(
          ParserRuleContext ctx, List<TerminalNode> children, boolean validateResponseHandler) {
    if (ctx.children == null) return;
    ctx.children.forEach(
            child -> {
              if (TerminalNode.class.isAssignableFrom(child.getClass())
                      && baseDuplicateOptions.containsKey(child.getText().toUpperCase()))
                children.add((TerminalNode) child);
              else if (ParserRuleContext.class.isAssignableFrom(child.getClass())) {
                if (validateResponseHandler
                        && child.getClass().getSimpleName().equals("Cics_handle_responseContext"))
                  checkResponseHandlers((CICSParser.Cics_handle_responseContext) child);
                getAllTokenChildren((ParserRuleContext) child, children, validateResponseHandler);
              }
            });
  }
}
