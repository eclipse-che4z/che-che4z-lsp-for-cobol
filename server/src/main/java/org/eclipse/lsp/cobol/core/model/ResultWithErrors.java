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

import com.google.common.collect.ImmutableList;
import lombok.NonNull;
import lombok.Value;

import java.util.ArrayList;
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
   * Type variable = result.unpack(syntaxErrorList::addAll);</code>
   *
   * @param errorsConsumer a Consumer to accept errors
   * @return the processing result
   */
  public T unwrap(Consumer<List<SyntaxError>> errorsConsumer) {
    errorsConsumer.accept(errors);
    return result;
  }

  /**
   * Process result if no errors found or consume the errors
   *
   * @param resultConsumer consumer that accepts the results if no errors found
   * @param errorsConsumer consumer that accepts errors if found
   */
  public void processIfNoErrorsFound(
      Consumer<T> resultConsumer, Consumer<List<SyntaxError>> errorsConsumer) {
    if (errors.isEmpty()) resultConsumer.accept(result);
    else errorsConsumer.accept(errors);
  }

  /**
   * Create a ResultWithErrors of a given result without errors.
   *
   * @param <T> the type of the wrapped value
   * @param result the value to be wrapped
   * @return new ResultWithErrors with empty list of errors
   */
  public static <T> ResultWithErrors<T> of(T result) {
    return new ResultWithErrors<>(result, ImmutableList.of());
  }

  /**
   * Add the given errors to this result. Helpful then several methods return results and errors,
   * and the last one should accumulate them.
   *
   * @param externalErrors external syntax errors that should be returned with this result
   * @return this including given errors
   */
  public ResultWithErrors<T> accumulateErrors(List<SyntaxError> externalErrors) {
    final ArrayList<SyntaxError> allErrors = new ArrayList<>(errors);
    allErrors.addAll(externalErrors);
    return new ResultWithErrors<>(result, allErrors);
  }
}
