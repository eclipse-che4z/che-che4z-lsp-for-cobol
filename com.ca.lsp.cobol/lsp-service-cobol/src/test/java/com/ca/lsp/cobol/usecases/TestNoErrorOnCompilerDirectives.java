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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.usecases;

import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;
import org.junit.Ignore;
import org.junit.Test;

import java.util.List;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyzeForErrors;
import static org.junit.Assert.assertEquals;

/**
 * Compiler directives should not raise a format error.
 *
 * <p>The CBL (PROCESS) statement can be preceded by a sequence number in columns 1 through 6. The
 * first character of the sequence number must be numeric, and CBL or PROCESS can begin in column 8
 * or after; if a sequence number not specified, CBL or PROCESS can begin in column 1 or after.
 *
 * <p>The CBL (PROCESS) statement must end before or at column 72, and options cannot be continued
 * across multiple CBL (PROCESS) statements. However, you can use more than one CBL (PROCESS)
 * statement. Multiple CBL (PROCESS) statements must follow one another with no intervening
 * statements of any other type.
 *
 * <p>The CBL (PROCESS) statement must be placed before any comment lines or other
 * compiler-directing statements.
 */
public class TestNoErrorOnCompilerDirectives extends PositiveUseCase {
  public TestNoErrorOnCompilerDirectives() {
    super(null);
  }

  private static final String CBL_WITHOUT_NUMBERS = "  cbl LIB,QUOTE,NODYNAM,TEST(SEP)\r\n";

  private static final String CBL_WITH_NUMBER = "012345 CBL DATA(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITHOUT_NUMBER = "PROCESS DATA(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITH_NUMBER = "012345 PROCESS DATA(24),RMODE(24),NODYNAM\r\n";

  private static final String PROCESS_WITHOUT_NUMBER_TYPO = "PROESS DATA(24),RMODE(24),NODYNAM\r\n";

  private static final String CBL_WITH_LONG_LINE =
      "  CBL LIB,QUOTE,NODYNAM,TEST(SEP)                                       00010003\r\n";

  private static final String PROCESS_WITH_NUMBER_TYPO =
      "012345 PROESS DATA(24),RMODE(24),NODYNAM\r\n";

  private static final String FOLLOWING_TEXT =
      "000000 Identification DIVISION.                                         23323232\r\n"
          + "002800 Program-ID.                                                      23323232\r\n"
          + "002800  HELLOWORLD.                                                     23323232\r\n"
          + "024200 PROCEDURE DIVISION .                                             CM1014.2\r\n";

  @Test
  public void testCorrectText() {
    setText("" + FOLLOWING_TEXT);
    super.test();
  }

  @Test
  public void testCblWithoutNumbers() {
    setText(CBL_WITHOUT_NUMBERS + FOLLOWING_TEXT);
    super.test();
  }

  @Test
  public void testCblWithNumbers() {
    setText(CBL_WITH_NUMBER + FOLLOWING_TEXT);
    super.test();
  }

  @Test
  public void testProcessWithoutNumbers() {
    setText(PROCESS_WITHOUT_NUMBER + FOLLOWING_TEXT);
    super.test();
  }

  @Test
  public void testProcessWithNumbers() {
    setText(PROCESS_WITH_NUMBER + FOLLOWING_TEXT);
    super.test();
  }

  @Test
  public void testCblWithLongLine() {
    setText(CBL_WITH_LONG_LINE + FOLLOWING_TEXT);
    super.test();
  }

  @Test
  public void testProcessWithoutNumbersWithTypo() {
    Range range = retrieveRange(analyzeForErrors(PROCESS_WITHOUT_NUMBER_TYPO + FOLLOWING_TEXT));
    // TODO: Update this test when the compiler directives fully supported
    //  to check the correct position
    assertEquals("Diagnostic start line", 0, range.getStart().getLine());
    assertEquals("Diagnostic start character", 7, range.getStart().getCharacter());
    assertEquals("Diagnostic end line", 0, range.getEnd().getLine());
    assertEquals("Diagnostic end character", 11, range.getEnd().getCharacter());
  }

  @Test
  public void testProcessWithNumbersWithTypo() {
    Range range = retrieveRange(analyzeForErrors(PROCESS_WITH_NUMBER_TYPO + FOLLOWING_TEXT));

    assertEquals("Diagnostic start line", 0, range.getStart().getLine());
    assertEquals("Diagnostic start character", 7, range.getStart().getCharacter());
    assertEquals("Diagnostic end line", 0, range.getEnd().getLine());
    assertEquals("Diagnostic end character", 11, range.getEnd().getCharacter());
  }

  @Ignore("Feature is not yet supported")
  @Test
  public void testLinesBeforeCblNotAllowed() {
    Range range = retrieveRange(analyzeForErrors(FOLLOWING_TEXT + CBL_WITH_NUMBER));

    assertEquals(1, range.getStart().getLine());
    assertEquals(7, range.getStart().getCharacter());
  }

  private Range retrieveRange(List<Diagnostic> diagnostics) {
    assertEquals(1, diagnostics.size());
    Diagnostic diagnostic = diagnostics.get(0);
    return diagnostic.getRange();
  }
}
