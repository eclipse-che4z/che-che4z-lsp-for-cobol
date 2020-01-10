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
package com.ca.lsp.core.cobol.preprocessor.sub.line.transformer;

import com.ca.lsp.core.cobol.AbstractCobolLinePreprocessorTest;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;

/** This test checks the continuation line transformation logic. */
public class ContinuationLineTransformationTest extends AbstractCobolLinePreprocessorTest {

  /** POSITIVE TEXT: No text allowed in the content area A */
  @Test
  public void testNoContentAreaAInContinuationLine() {
    String line = "000010-    NO CONTENT AREA ON THIS LINE";
    List<SyntaxError> errors = runTransformation(line);
    assertEquals(0, errors.size());
  }

  /**
   * NEGATIVE TEXT: Text in the content area A when there is a continuation line. Should throw a
   * syntax error
   */
  @Test
  public void testContentAreaAInContinuationLine() {
    String line = "000010-THERE IS CONTENT AREA DEFINED HERE";
    List<SyntaxError> errors = runTransformation(line);
    assertEquals(1, errors.size());
  }

  /**
   * [CASE1]: Content defined till the end of comment area with a continuation line - Expected
   * result: 0 Syntax Error
   */
  @Test
  public void testContinuationLineCasePositive() {
    List<String> lines = new ArrayList<>();
    lines.add("000000 IDENTIFICATION DIVISION.                                         23323232");
    lines.add("000010 PROGRAM-ID. test1.                                               23323232");
    lines.add("000020 AUTHOR. TESTER                                                   23323232");
    lines.add("000030 DATA DIVISION.                                                   22221112");
    lines.add("000330 WORKING-STORAGE SECTION.                                         23323232");
    lines.add("000500    01 WS-CONST-CREATE PIC X(134) VALUE 'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    lines.add("000251-    'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD'.");

    List<SyntaxError> errors = runTransformation(reduceLines(lines));
    assertEquals(0, errors.size());
  }

  /**
   * [CASE1]: Content defined till the end of comment area without closing quotes and without a
   * continuation line - Expected result: 1 Syntax Error
   */
  @Test
  public void testContinuationLineCaseNegative() {

    List<String> lines = new ArrayList<>();
    lines.add("000000 IDENTIFICATION DIVISION.                                         23323232");
    lines.add("000010 PROGRAM-ID. test1.                                               23323232");
    lines.add("000020 AUTHOR. TESTER                                                   23323232");
    lines.add("000030 DATA DIVISION.                                                   22221112");
    lines.add("000330 WORKING-STORAGE SECTION.                                         23323232");
    lines.add("000500    01 WS-CONST-CREATE PIC X(134) VALUE 'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    lines.add("000251     'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD'.");

    List<SyntaxError> errors = runTransformation(reduceLines(lines));

    assertEquals(1, errors.size());
  }

  @Test
  public void testQuotesInsideStringNotCauseError() {
    List<String> lines = new ArrayList<>();

    lines.add("       VALUE 'DFHCOMMAREA xmlns=\"http://www.BKP92S1O.com/schem'.");
    lines.add("       VALUE 'as/BKP92S1OInterface\"'.");
    lines.add("       \"'\"");
    lines.add("       '\"'");

    List<SyntaxError> errors = runTransformation(reduceLines(lines));

    assertEquals(0, errors.size());
  }

  private List<SyntaxError> runTransformation(String text) {
    List<CobolLine> lines = convertToCobolLines(text);

    ContinuationLineTransformation transformation = new ContinuationLineTransformation(null);
    return transformation.transformLines(lines).getErrors();
  }

  private List<CobolLine> convertToCobolLines(String text) {
    return super.processText(text).getResult();
  }
}
