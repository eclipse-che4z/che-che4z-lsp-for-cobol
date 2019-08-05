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

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.junit.Before;
import org.junit.Test;

import com.ca.lsp.cobol.utils.Filters;

/** @author teman02 */
public class FiltersTest {

  private List<String> listToFilter = Arrays.asList("aaa", "aba", "bb", "Aaa", "Baa", "ABa");

  @Before
  public void createListToFilter() {}

  @Test
  public void testStartsWithIgnoreCaseOneChar() {
    List<String> expectedForOneChar = Arrays.asList("aaa", "aba", "Aaa", "ABa");
    innerTestStartsWithIgnoreCase("a", expectedForOneChar);
    innerTestStartsWithIgnoreCase("A", expectedForOneChar);
  }

  @Test
  public void testStartsWithIgnoreCaseMoreChars() {
    List<String> expectedForMoreChars = Arrays.asList("aba", "ABa");
    innerTestStartsWithIgnoreCase("ab", expectedForMoreChars);
    innerTestStartsWithIgnoreCase("AB", expectedForMoreChars);
  }

  private void innerTestStartsWithIgnoreCase(String token, List<String> expected) {
    assertEquals(
        expected,
        listToFilter
            .stream()
            .filter(Filters.startsWithIgnoreCase(token))
            .collect(Collectors.toList()));
  }
}
