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
package com.broadcom.lsp.cobol.core.preprocessor.delegates.reader;

import com.broadcom.lsp.cobol.core.model.CobolLine;
import com.broadcom.lsp.cobol.core.model.ResultWithErrors;

import lombok.NonNull;
import java.util.List;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entity; analyzes and
 * processes line indicators.
 */
public interface CobolLineReader {
  /**
   * Convert String with COBOL code into CobolLines that are used further in the parsing.
   *
   * @param uri - URI of the currently open document
   * @param lines - a String to be converted into CobolLine list
   * @return List of COBOL lines with a list of errors if found, or an empty list
   */
  @NonNull
  ResultWithErrors<List<CobolLine>> processLines(@NonNull String uri, @NonNull String lines);
}
