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

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.CopyStatementModifier;
import org.eclipse.lsp.cobol.core.model.CopybookUsage;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplaceData;
import org.eclipse.lsp4j.Range;

import java.util.*;
import java.util.function.BiConsumer;
import java.util.function.Function;

import static java.util.stream.Collectors.toList;

/**
 * This value class tracks moving in copybook hierarchy and replacing while preprocessor analysis.
 * Is not thread-safe.
 */
public class CopybookHierarchy {
  private final List<Pair<String, String>> copyReplacingClauses = new ArrayList<>();
  private final Deque<ReplaceData> textReplacing = new ArrayDeque<>();
  private final Deque<CopybookUsage> copybookStack = new ArrayDeque<>();
  private final Deque<ReplaceData> recursiveReplaceStmtStack = new ArrayDeque<>();

  @Setter @Getter private CopyStatementModifier modifier = null;

  /**
   * Check if the replacing is required
   *
   * @return true if there are not applied replacing patterns
   */
  public boolean requiresReplacing() {
    return !textReplacing.isEmpty() && !textReplacing.peek().getReplacePatterns().isEmpty();
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
   * @param uri The url of original document
   * @param range   a range to replace text in
   */
  public void addTextReplacing(Pair<String, String> pattern, String uri, Range range) {
    ReplaceData data = textReplacing.peek();
    if (data != null && getLastTextReplacing().getRange(uri) == range) {
      data.getReplacePatterns().add(pattern);
    } else {
      List<Pair<String, String>> replacePatterns = new ArrayList<>();
      replacePatterns.add(pattern);
      textReplacing.add(new ReplaceData(replacePatterns, uri, range));
    }
  }

  /**
   * Check if there already is a copybook with the given name in the hierarchy
   *
   * @param name CopybookName to check
   * @return true if a copybook with this name is already in the stack
   */
  public boolean hasRecursion(CopybookName name) {
    return copybookStack.stream().map(CopybookUsage::getName).anyMatch(name::equals);
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

  /** Move all the copy replacing clauses to the recursive replacement stack
   * @param uri document uri
   */
  public void prepareCopybookReplacement(String uri) {
    if (!copyReplacingClauses.isEmpty()) {
      recursiveReplaceStmtStack.add(new ReplaceData(new ArrayList<>(copyReplacingClauses), uri, new Range()));
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
   * @param copybook copybook extended document
   * @param accumulator a function for applying the replacing
   * @param errors errors collection
   */
  public void replaceCopybook(
      ExtendedDocument copybook, BiConsumer<ExtendedDocument, ReplaceData> accumulator,
      List<SyntaxError> errors) {
    for (ReplaceData replaceData : recursiveReplaceStmtStack) {
      accumulator.accept(copybook, replaceData);
    }
  }

  /**
   * Apply replacements the documentMap using the internal state of the hierarchy
   *
   * @param extendedDocument an extended document to replace
   * @param accumulator a consumer for applying the replacing
   */
  public void replaceText(ExtendedDocument extendedDocument, BiConsumer<ExtendedDocument, ReplaceData> accumulator) {
    textReplacing.forEach(tr -> accumulator.accept(extendedDocument, tr));
    textReplacing.clear();
  }

  /**
   * Get last text replacing data.
   *
   * @return Last text replacing data
   */
  public ReplaceData getLastTextReplacing() {
    return textReplacing.peek();
  }
}
