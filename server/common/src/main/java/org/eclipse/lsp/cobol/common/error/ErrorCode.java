/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.common.error;

/** Functional interface for the ErrorCodes used by {@link SyntaxError} */
@FunctionalInterface
public interface ErrorCode {
  /**
   * Gives label of the Error Code. This is used by client to show errors.
   *
   * @return label of the Error Code
   */
  String getLabel();
}
