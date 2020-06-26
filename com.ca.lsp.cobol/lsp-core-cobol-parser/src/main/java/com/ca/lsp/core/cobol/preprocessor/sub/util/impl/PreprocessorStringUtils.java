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
package com.ca.lsp.core.cobol.preprocessor.sub.util.impl;

import lombok.experimental.UtilityClass;

import javax.annotation.Nonnull;

/** This utility class provides functions that are useful for pre-processing a COBOL document */
@UtilityClass
public class PreprocessorStringUtils {
  /**
   * Remove leading quote char from the string
   *
   * @param line - string to process
   * @return a string without leading quote char
   */
  @Nonnull
  public String trimQuotes(@Nonnull String line) {
    return line.replaceAll("^[\"']|[\"']$", "");
  }
}
