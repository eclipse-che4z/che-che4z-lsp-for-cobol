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

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks {@link StringUtils} utility functions. */
class StringUtilsTest {

  private static final String TEST_SINGLE_QUOTE_STRING =
      "\'TESTING IF ALL QUOTES WILL BE REMOVED\'";
  private static final String TEST_DOUBLE_QUOTE_STRING =
      "\"TESTING IF ALL QUOTES WILL BE REMOVED\"";
  private static final String EXPECTED_STRING = "TESTING IF ALL QUOTES WILL BE REMOVED";

  /** Test trimming leading quotes by {@link StringUtils#trimQuotes(String)} */
  @Test
  void trimQuotesTest() {
    assertEquals(EXPECTED_STRING, StringUtils.trimQuotes(TEST_SINGLE_QUOTE_STRING));
    assertEquals(EXPECTED_STRING, StringUtils.trimQuotes(TEST_DOUBLE_QUOTE_STRING));
    assertEquals(EXPECTED_STRING, StringUtils.trimQuotes(EXPECTED_STRING));
  }

  @Test
  void noTrimQuotesInsideTest() {
    assertEquals(
        "TESTING 'NO' QUOTES WILL BE REMOVED",
        StringUtils.trimQuotes("TESTING 'NO' QUOTES WILL BE REMOVED"));
    assertEquals(
        "TESTING \"NO\" QUOTES WILL BE REMOVED",
        StringUtils.trimQuotes("TESTING \"NO\" QUOTES WILL BE REMOVED"));
  }
}
