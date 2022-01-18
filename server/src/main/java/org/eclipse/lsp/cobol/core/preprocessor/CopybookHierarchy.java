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

package org.eclipse.lsp.cobol.core.preprocessor;

import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;

import java.util.*;
import java.util.function.BiFunction;
import java.util.function.Function;

import static java.util.stream.Collectors.toList;

/**
 * This value class tracks moving in copybook hierarchy and replacing while preprocessor analysis.
 * Is not thread-safe.
 */
public class CopybookHierarchy {
  List<Pair<String, String>> copyReplacingClauses = new ArrayList<>();
  List<Pair<String, String>> textReplacingClauses = new ArrayList<>();
  Deque<CopybookUsage> copybookStack = new ArrayDeque<>();
  Deque<List<Pair<String, String>>> recursiveReplaceStmtStack = new ArrayDeque<>();

  /**
   * Check if the replacing is required
   *
   * @return true if there are not applied replacing patterns
   */
  public boolean requiresReplacing() {
    return !textReplacingClauses.isEmpty();
  }

  /**
   * Get the id of the copybook from the top of the stack or null if absent
   *
   * @return the current copybook id
   */
  public String getCurrentCopybookId() {
    return Optional.ofNullable(copybookStack.peek()).map(CopybookUsage::getCopybookId).orElse(null);
  }

  /**
   * Add a new copybook to the top of the stack
   *
   * @param copybook a copybook to be processed
   */
  public void push(CopybookUsage copybook) {
    copybookStack.push(copybook);
  }

  /** Remove the copybook from the top of the stack */
  public void pop() {
    copybookStack.pop();
    recursiveReplaceStmtStack.pollFirst();
  }

  /**
   * Add a pattern for replacing from COPY statement
   *
   * @param pattern a pattern to be applied to the copybook content
   */
  public void addCopyReplacing(Pair<String, String> pattern) {
    copyReplacingClauses.add(pattern);
  }

  /**
   * Add a pattern for replacing from REPLACE statement
   *
   * @param pattern a pattern to be applied to the document content
   */
  public void addTextReplacing(Pair<String, String> pattern) {
    textReplacingClauses.add(pattern);
  }

  /**
   * Check if there already is a copybook with the given name in the hierarchy
   *
   * @param copybookName name to check
   * @return true if a copybook with this name is already in the stack
   */
  public boolean hasRecursion(String copybookName) {
    return copybookStack.stream().map(CopybookUsage::getName).anyMatch(copybookName::equals);
  }

  /**
   * Apply the given function to the copybooks in the stack. Doesn't change the state of the stack
   * and of the copybooks
   *
   * @param function a function to be applied to the copybooks
   * @param <R> the type parameter of the result of the function
   * @return a list of R
   */
  public <R> List<R> mapCopybooks(Function<CopybookUsage, R> function) {
    return copybookStack.stream().map(function).collect(toList());
  }

  /** Move all the copy replacing clauses to the recursive replacement stack */
  public void prepareCopybookReplacement() {
    if (!copyReplacingClauses.isEmpty()) {
      recursiveReplaceStmtStack.add(new ArrayList<>(copyReplacingClauses));
      copyReplacingClauses.clear();
    }
  }

  /**
   * Check if there is a recursive replacement
   *
   * @return true the there is a recursion
   */
  public boolean containsRecursiveReplacement() {
    return recursiveReplaceStmtStack.size() > 1 && !copybookStack.isEmpty();
  }

  /**
   * Replace the copybook text using the internal state of the hierarchy
   *
   * @param copybookText text to replace
   * @param accumulator a function for applying the replacing
   * @return replaced text
   */
  public String replaceCopybook(
      String copybookText, BiFunction<String, List<Pair<String, String>>, String> accumulator) {
    return recursiveReplaceStmtStack.stream().reduce(copybookText, accumulator, (raw, res) -> res);
  }

  /**
   * Replace the text using the internal state of the hierarchy
   *
   * @param text text to replace
   * @param accumulator a function for applying the replacing
   * @return replaced text
   */
  public String replaceText(
      String text, BiFunction<String, List<Pair<String, String>>, String> accumulator) {
    String result = accumulator.apply(text, textReplacingClauses);
    textReplacingClauses.clear();
    return result;
  }
}
