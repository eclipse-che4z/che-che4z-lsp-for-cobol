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

import com.ca.lsp.core.cobol.parser.CobolLexer;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

/**
 * This test check if the language keywords file contains all the words that the Cobol Lexer uses.
 *
 * @author teman02
 */
public class KeywordsTest {

  private static final String PATH_TO_KEYWORDS_FILE =
      "src/main/resources/com/ca/lsp/cobol/service/LanguageKeywords.txt";

  @Test
  public void testAllLexerWordsAreMapped() {
    List<String> expected = retriveExpectedWords();
    List<String> actual = retrieveActualWords();
    assertAllTheWordsArePresent(expected, actual);
  }

  private List<String> retriveExpectedWords() {
    final CobolLexer lexer = new CobolLexer(null);
    List<String> ruleNames = Arrays.asList(lexer.getRuleNames());

    return ruleNames.stream().filter(it -> it.length() > 1).collect(Collectors.toList());
  }

  private List<String> retrieveActualWords() {
    List<String> actualWords = new ArrayList<>();

    File file = new File(PATH_TO_KEYWORDS_FILE);
    if (!file.exists()) {
      fail("Keywords file not found");
    }
    try (FileInputStream fis = new FileInputStream(file)) {

      String currentLine;
      try (Scanner sc = new Scanner(fis)) {
        while (sc.hasNextLine()) {
          currentLine = sc.nextLine();
          if (currentLine.startsWith("#")) continue;
          StringTokenizer st = new StringTokenizer(currentLine, "=", false);
          actualWords.add(st.nextToken().replaceAll("-", "_"));
        }
      }
    } catch (IOException e) {
      fail(e.getMessage());
    }
    return actualWords;
  }

  private void assertAllTheWordsArePresent(List<String> expected, List<String> actual) {
    List<String> expectedWithoutActual = new ArrayList<>(expected);
    expectedWithoutActual.removeAll(actual);

    List<String> actualWithoutExpected = new ArrayList<>(actual);
    actualWithoutExpected.removeAll(expected);

    assertEquals(expectedWithoutActual.toString(), 0, expectedWithoutActual.size());
    assertEquals(actualWithoutExpected.toString(), 0, actualWithoutExpected.size());
  }
}
