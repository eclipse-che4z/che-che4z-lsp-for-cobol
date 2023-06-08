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

package org.eclipse.lsp.cobol.core.preprocessor.delegates.util.impl;

import com.google.common.collect.ImmutableList;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplaceData;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingServiceImpl;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Collections;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/** This test checks the logic of {@link ReplacingServiceImpl} */
class ReplacingServiceImplTest {

  private final MessageService messageService = mock(MessageService.class);
  private final Locality locality = Locality.builder().build();
  /**
   * Test the service applies replacing for the given text by provided patterns. The left value in
   * the pattern pair is a regex for replaceable, and the right one is a replacement text. Here:
   * check only the '01' wrapped with space, line break, or a dot replaced by 05; CHILD1 should be
   * replaced by CHILD2 even if it is a part of another token. If the given pattern is empty, the
   * text shouldn't change.
   */
  @Test
  void testApplyReplacing() {
    ReplacingService replacingService = new ReplacingServiceImpl(messageService);
    ExtendedDocument dm1 = new ExtendedDocument("   01\n.   .CHILD101\n.", "");
    replacingService.applyReplacing(dm1, new ReplaceData(ImmutableList.of(
            Pair.of("(?<=[\\.\\s\\r\\n])01(?=[\\.\\s\\r\\n])", "05"), // .
            Pair.of("CHILD1", "CHILD2")), "", new Range()));
    assertEquals("   05\n.   .CHILD201\n.", dm1.toString());

    ExtendedDocument dm2 = new ExtendedDocument("01 ABC.", "");
    replacingService.applyReplacing(dm2,
            new ReplaceData(ImmutableList.of(Pair.of("", "")), "", new Range()));
    assertEquals("01 ABC.", dm2.toString());
  }

  /**
   * Test the way service retrieves the replacing pattern from the pseudo text. It should remove all
   * the equals chars and provide a trimmed regex that matches expected token sequence ignoring the
   * number of whitespaces. If the pseudo text consist of whitespaces, or is empty, the empty
   * pattern should return. The "BY" pattern separator should be case-insensitive.
   */
  @Test
  void retrievePseudoTextReplacingPattern() {
    ReplacingService replacingService = new ReplacingServiceImpl(messageService);
    assertEquals(
        new ResultWithErrors<>(
            Pair.of(
                "(\\(|:|[,;]\\s)?(?<=^|[.,;]\\s|\\s|[\\(:])01(?=[\\):]|[,;]\\s|\\.\\s*|\\s|$)[\\):,;]?",
                "BY"),
            Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern("==  01  == BY == BY   ==", locality));
    assertEquals(
        new ResultWithErrors<>(Pair.of("", ""), Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern("", locality));
    assertEquals(
        new ResultWithErrors<>(
            Pair.of(
                "(\\(|:|[,;]\\s)?(?<=^|[.,;]\\s|\\s|[\\(:])a\\s*b\\s*\\s*c(?=[\\):]|[,;]\\s|\\.\\s*|\\s|$)[\\):,;]?",
                ""),
            Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern("==a   b  \nc== bY ====", locality));
    assertEquals(
        new ResultWithErrors<>(
            Pair.of(
                "(\\(|:|[,;]\\s)?(?<=^|[.,;]\\s|\\s|[\\(:])BY(?=[\\):]|[,;]\\s|\\.\\s*|\\s|$)[\\):,;]?",
                ""),
            Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern(
            "==BY== by ==\n      \r\n   ==", locality));
  }

  /**
   * Test the way service retrieves the replacing pattern from the literal REPLACING statement text.
   * It should provide a trimmed regex that matches expected token if it is wrapped with
   * whitespaces, line breaks or dots. The "BY" pattern separator should be case-insensitive.
   */
  @Test
  void testRetrieveTokenReplacingPattern() {
    ReplacingService replacingService = new ReplacingServiceImpl(messageService);
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
