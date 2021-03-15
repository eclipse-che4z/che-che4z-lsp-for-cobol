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
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;

/**
 * This interface represents a reader delegate that may apply some special operations over Strings
 */
public interface CobolLineReaderDelegate {

  /**
   * @param line the initial line
   * @param uri document uri
   * @param lineNumber the lineNumber
   * @return converting result
   */
  @NonNull
  ResultWithErrors<String> apply(
      @NonNull String line, @NonNull String uri, @NonNull int lineNumber);
}
