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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.util;

import lombok.NonNull;
import lombok.experimental.UtilityClass;

/** This utility class provides functions that are useful for pre-processing a COBOL document */
@UtilityClass
public class PreprocessorStringUtils {
  /**
   * Remove leading quote char from the string
   *
   * @param line - string to process
   * @return a string without leading quote char
   */
  @NonNull
  public String trimQuotes(@NonNull String line) {
    return line.replaceAll("(?:^[\"'])|(?:[\"']$)", "");
  }

  /**
   * Return a text by replacing all characters by mask char, preserving the relative position of
   * each character's previous position. Preserves a new line. A substitution of a partial text
   * returned by this method in a document, would not disturb the token mapping for rest of the
   * document.
   *
   * <p>For example, getMaskedTextPreservingNewLine(""abc\n" + "xyz\n" + "klm"", "*") would return
   *
   * <p>***
   *
   * <p>***
   *
   * <p>***
   *
   * @param text Reference text
   * @param mask text mask
   * @return a masked text
   */
  @NonNull
  public String getMaskedTextPreservingNewLine(@NonNull String text, @NonNull String mask) {
    return text.replaceAll("[^" + System.lineSeparator() + "]", mask);
  }
}
