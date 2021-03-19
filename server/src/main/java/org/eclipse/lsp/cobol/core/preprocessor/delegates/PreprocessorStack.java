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

package org.eclipse.lsp.cobol.core.preprocessor.delegates;

import lombok.NonNull;

import java.util.Deque;
import java.util.Objects;

import static java.util.Optional.ofNullable;

/**
 * Provides a contract and default implementation of various stack operation. To be used while
 * assembling the {@link org.eclipse.lsp.cobol.core.model.ExtendedDocument} from pre-processors.
 */
public interface PreprocessorStack {

  /** @return A stack of accumulated text while preprocessing. */
  Deque<StringBuilder> getTextAccumulator();

  /** @return pops and return string from accumulatedText stack. */
  default String pop() {
    return getTextAccumulator().pop().toString();
  }

  /** push a new empty element on top of accumulated text stack. */
  default void push() {
    getTextAccumulator().push(new StringBuilder());
  }

  /** @return peeks and returns a {@link StringBuilder} from top of accumulatedText stack. */
  @NonNull
  default StringBuilder peek() {
    return ofNullable(getTextAccumulator().peek())
        .orElseThrow(() -> new IllegalStateException("Document structure corrupted"));
  }

  /** @param text append the passed text to the top of accumulatedText stack. */
  default void write(@NonNull String text) {
    peek().append(text);
  }

  /** @return string from top of the accumulatedText stack without removing the element. */
  default String read() {
    return peek().toString();
  }

  /**
   * Accumulates and returns a string created by collapsing stack.
   *
   * @return an accumulated text from stack
   */
  default String accumulate() {
    while (Objects.nonNull(getTextAccumulator().peek()) && needsCollapsing()) {
      write(pop());
    }
    return read();
  }

  /**
   * Check if collapsing is necessary while accumulating text from the text. Collapsing is needed,
   * if there are more than one element.
   *
   * @return true if stack has more than one element, false otherwise.
   */
  default boolean needsCollapsing() {
    return getTextAccumulator().size() > 1;
  }

  /**
   * Merge the top 2 elements of the stack.
   *
   * <p>For example,
   *
   * <table>
   *   <col width="50%"/>
   *   <col width="50%"/>
   *   <thead>
   *     <tr><th>Initially</th>  <th>After <code>mergeAndUpdateTopTwoElement("elementN")</code></th></tr>
   *   <thead>
   *   <tbody>
   *      <tr><td>|... element1 ...|</td><td></td></tr>
   *      <tr><td>|... element2 ...|</td><td>|... element2 elementN ...|</td></tr>
   *      <tr><td>|... element3 ...|</td><td>|... element3 ...|</td></tr>
   *   </tbody>
   * </table>
   *
   * <p>NOTE:
   *
   * <ul>
   *   <li>1. In case of only single element in stack, element would be updated by passed value.
   *   <li>2. In case stack is empty, an element would be added with passed value.
   * </ul>
   *
   * @param content value to be updated with.
   */
  default void mergeAndUpdateTopTwoElement(String content) {
    if (!getTextAccumulator().isEmpty()) pop();
    if (getTextAccumulator().isEmpty()) push();
    write(content);
  }
}
