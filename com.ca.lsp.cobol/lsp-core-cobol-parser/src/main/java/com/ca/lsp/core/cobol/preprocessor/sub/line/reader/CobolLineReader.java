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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.line.reader;

import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.List;

/**
 * Preprocessor, which converts strings with COBOL code into a specific entities; analyzes and
 * processes line indicators.
 */
public interface CobolLineReader {
  /**
   * Convert String with COBOL code into CobolLines that are used further in the parsing.
   *
   * @param uri - URI of the currently open document
   * @param lines - a String to be converted into CobolLine list
   * @return List of COBOL lines with a list of errors if found or an empty list
   */
  @Nonnull
  ResultWithErrors<List<CobolLine>> processLines(@Nullable String uri, @Nonnull String lines);
}
