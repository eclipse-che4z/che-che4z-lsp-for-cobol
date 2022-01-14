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

package org.eclipse.lsp.cobol.core.model;

import lombok.NonNull;
import lombok.Value;

import java.util.List;
import java.util.function.Consumer;

/**
 * This value class represents a processing result of any type that may contain syntax errors.
 *
 * @param <T> - type of the processing result
 */
@Value
public class ResultWithErrors<T> {
  @NonNull T result;
  @NonNull List<SyntaxError> errors;

  /**
   * Consume the found errors and return the result. May be used as <code>
   *  Type variable = result.unpack(syntaxErrorList::addAll);</code>
   *
   * @param errorsConsumer - a Consumer to accept errors
   * @return - the processing result
   */
  public T unwrap(Consumer<List<SyntaxError>> errorsConsumer) {
    errorsConsumer.accept(errors);
    return result;
  }

  /**
   * Process result is no errors found or consume the errors
   *
   * @param resultConsumer consumer that accepts the results if no errors found
   * @param errorsConsumer consumer that accepts errors if found
   */
  public void processIfNoErrorsFound(
      Consumer<T> resultConsumer, Consumer<List<SyntaxError>> errorsConsumer) {
    if (errors.isEmpty()) resultConsumer.accept(result);
    else errorsConsumer.accept(errors);
  }
}
