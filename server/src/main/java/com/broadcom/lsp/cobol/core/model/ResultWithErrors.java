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

package com.broadcom.lsp.cobol.core.model;

import lombok.Value;

import lombok.NonNull;
import java.util.List;

/**
 * This value class represents a processing result of any type that may contain syntax errors.
 *
 * @param <T> - type of the processing result
 */
@Value
public class ResultWithErrors<T> {
  @NonNull T result;
  @NonNull List<SyntaxError> errors;
}
