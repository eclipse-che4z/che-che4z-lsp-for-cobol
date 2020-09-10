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

import com.ca.lsp.core.cobol.preprocessor.sub.util.ReplacingService;
import org.apache.commons.lang3.tuple.Pair;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks the logic of {@link ReplacingServiceImpl} */
class ReplacingServiceImplTest {
  /**
   * Test the service applies replacing for the given text by provided patterns. The left value in
   * the pattern pair is a regex for replaceable, and the right one is a replacement text. Here:
   * check only the '01' wrapped with space, line break, or a dot replaced by 05; CHILD1 should be
   * replaced by CHILD2 even if it is a part of another token. If the given pattern is empty, the
   * text shouldn't change.
   */
  @Test
  void testApplyReplacing() {
    ReplacingService replacingService = new ReplacingServiceImpl();
    assertEquals(
        "   05\n\r.   .CHILD201\r\n.",
        replacingService.applyReplacing(
            "   01\n\r.   .CHILD101\r\n.",
            List.of(
                Pair.of("(?<=[\\.\\s\\r\\n])01(?=[\\.\\s\\r\\n])", "05"), // .
                Pair.of("CHILD1", "CHILD2"))));

    assertEquals("01 ABC.", replacingService.applyReplacing("01 ABC.", List.of(Pair.of("", ""))));
  }

  /**
   * Test the way service retrieves the replacing pattern from the pseudo text. It should remove all
   * the equals chars and provide a trimmed regex that matches expected token sequence ignoring the
   * number of whitespaces. If the pseudo text consist of whitespaces, or is empty, the empty
   * pattern should return. The "BY" pattern separator should be case-insensitive.
   */
  @Test
  void retrievePseudoTextReplacingPattern() {
    ReplacingService replacingService = new ReplacingServiceImpl();
    assertEquals(
        Pair.of("01", "05"),
        replacingService.retrievePseudoTextReplacingPattern("==  01  == BY == 05   =="));
    assertEquals(Pair.of("", ""), replacingService.retrievePseudoTextReplacingPattern(""));
    assertEquals(
        Pair.of("a +b +\nc", ""),
        replacingService.retrievePseudoTextReplacingPattern("==a   b  \nc== bY ===="));
    assertEquals(
        Pair.of("1", ""),
        replacingService.retrievePseudoTextReplacingPattern("==1== by ==\n      \r\n   =="));
  }

  /**
   * Test the way service retrieves the replacing pattern from the literal REPLACING statement text.
   * It should provide a trimmed regex that matches expected token if it is wrapped with
   * whitespaces, line breaks or dots. The "BY" pattern separator should be case-insensitive.
   */
  @Test
  void testRetrieveTokenReplacingPattern() {
    ReplacingService replacingService = new ReplacingServiceImpl();
    assertEquals(
        Pair.of("(?<=[\\.\\s\\r\\n])01(?=[\\.\\s\\r\\n])", "05"),
        replacingService.retrieveTokenReplacingPattern("01 BY 05"));
    assertEquals(Pair.of("", ""), replacingService.retrieveTokenReplacingPattern(""));
    assertEquals(
        Pair.of("(?<=[\\.\\s\\r\\n])IDENTIFICATION(?=[\\.\\s\\r\\n])", "DIVISION"),
        replacingService.retrieveTokenReplacingPattern("IDENTIFICATION by DIVISION"));
    assertEquals(
        Pair.of("(?<=[\\.\\s\\r\\n])A(?=[\\.\\s\\r\\n])", "B"),
        replacingService.retrieveTokenReplacingPattern("\r\nA bY \r\n  B "));
  }
}
