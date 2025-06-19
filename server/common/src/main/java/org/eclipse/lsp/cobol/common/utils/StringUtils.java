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
package org.eclipse.lsp.cobol.common.utils;

import java.util.regex.Pattern;
import lombok.NonNull;
import lombok.experimental.UtilityClass;

/** This utility class provides functions that are useful for pre-processing a COBOL document */
@UtilityClass
public class StringUtils {
  public static final Pattern QUOTE_PATTERN = Pattern.compile("(^[\"'])|([\"']$)");

  /**
   * Remove leading quote char from the string
   *
   * @param line - string to process
   * @return a string without leading quote char
   */
  @NonNull
  public String trimQuotes(@NonNull String line) {
    return QUOTE_PATTERN.matcher(line).replaceAll("");
  }

  public boolean isEnclosedInSingleQuotes(String str) {
    if (str == null || str.length() < 2) return false;
    char first = str.charAt(0);
    char last = str.charAt(str.length() - 1);
    return (first == '\'' && last == '\'');
  }

  /**
   * Generate empty (space) string of given length
   *
   * @param length - length of the string
   * @return empty string
   */
  public String generateEmptyString(int length) {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < length; i++) {
      sb.append(" ");
    }
    return sb.toString();
  }
}
