/*
 * Copyright (c) 2019 Broadcom.
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
package com.ca.lsp.cobol.utils;

import java.util.function.Predicate;

/** @author teman02 */
public class Filters {
  private Filters() {
    throw new AssertionError("Suppress default constructor for noninstantiability");
  }

  /**
   * Returns predicate which may be used to filter strings that starts with a given string ignoring
   * case. Code example: list.stream().filter(Filters.startsWithIgnoreCase("string");
   *
   * @param token - The string that the checking string should start with
   * @return Predicate that may be used in Stream.filter()
   */
  public static Predicate<String> startsWithIgnoreCase(String token) {
    return word -> word.regionMatches(true, 0, token, 0, token.length());
  }
}
