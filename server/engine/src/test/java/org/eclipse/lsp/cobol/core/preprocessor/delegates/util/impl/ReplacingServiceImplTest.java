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

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

import com.google.common.collect.ImmutableList;
import java.util.Collections;
import org.apache.commons.lang3.tuple.ImmutablePair;
import org.apache.commons.lang3.tuple.Pair;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplaceData;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingService;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.ReplacingServiceImpl;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.replacement.SearchPattern;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

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
    replacingService.applyReplacing(
        dm1,
        new ReplaceData(
            ImmutableList.of(
                Pair.of("(?<=[\\.\\s\\r\\n])01(?=[\\.\\s\\r\\n])", "05"), // .
                Pair.of("CHILD1", "CHILD2")),
            "",
            new Range()));
    assertEquals("   05\n.   .CHILD201\n.", dm1.toString());

    ExtendedDocument dm2 = new ExtendedDocument("01 ABC.", "");
    replacingService.applyReplacing(
        dm2, new ReplaceData(ImmutableList.of(Pair.of("", "")), "", new Range()));
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
            Pair.of("01(?<=(?:^|[.,;]?\\s)01)(?=[,;]?\\s|\\.|$)", "BY"), Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern(
            ImmutablePair.of("  01  ", " BY   "),
            locality,
            CobolLanguageId.COBOL,
            SearchPattern.EXACT));
    assertEquals(
        new ResultWithErrors<>(
            Pair.of("(?<=(?:^|[.,;]?\\s))(?=[,;]?\\s|\\.|$)", ""), Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern(
            ImmutablePair.of("", ""), locality, CobolLanguageId.COBOL, SearchPattern.EXACT));
    assertEquals(
        new ResultWithErrors<>(
            Pair.of(
                "a\\s{1,999}b\\s{1,999}c(?<=(?:^|[.,;]?\\s)a\\s{1,999}b\\s{1,999}c)(?=[,;]?\\s|\\.|$)",
                ""),
            Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern(
            ImmutablePair.of("a   b  \nc", ""),
            locality,
            CobolLanguageId.COBOL,
            SearchPattern.EXACT));
    assertEquals(
        new ResultWithErrors<>(
            Pair.of("BY(?<=(?:^|[.,;]?\\s)BY)(?=[,;]?\\s|\\.|$)", ""), Collections.emptyList()),
        replacingService.retrievePseudoTextReplacingPattern(
            ImmutablePair.of("BY", "\n" + "      \n" + "   "),
            locality,
            CobolLanguageId.COBOL,
            SearchPattern.EXACT));
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
        Pair.of("01(?<=(?:^|[.,;]?\\s)01)(?=[,;]?\\s|\\.|$)", "05"),
        replacingService.retrieveTokenReplacingPattern(Pair.of("01", "05"), CobolLanguageId.COBOL));
    assertEquals(
        Pair.of("(?<=(?:^|[.,;]?\\s))(?=[,;]?\\s|\\.|$)", ""),
        replacingService.retrieveTokenReplacingPattern(Pair.of("", ""), CobolLanguageId.COBOL));
    assertEquals(
        Pair.of("IDENTIFICATION(?<=(?:^|[.,;]?\\s)IDENTIFICATION)(?=[,;]?\\s|\\.|$)", "DIVISION"),
        replacingService.retrieveTokenReplacingPattern(
            Pair.of("IDENTIFICATION", "DIVISION"), CobolLanguageId.COBOL));
    assertEquals(
        Pair.of("\\s{1,999}A(?<=(?:^|[.,;]?\\s)\\s{1,999}A)(?=[,;]?\\s|\\.|$)", "B"),
        replacingService.retrieveTokenReplacingPattern(
            Pair.of("\n" + "A", "\n" + "  B "), CobolLanguageId.COBOL));
  }
}
