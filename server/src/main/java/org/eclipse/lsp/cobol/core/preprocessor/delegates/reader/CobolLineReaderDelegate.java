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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.reader;

import lombok.NonNull;

/**
 * This interface represents a reader delegate that may apply some special operations over Strings
 */
public interface CobolLineReaderDelegate {

  /**
   * Convert the line and apply any transformations if needed.
   *
   * @param line the initial line
   * @return converting result
   */
  @NonNull
  String apply(@NonNull String line);
}
