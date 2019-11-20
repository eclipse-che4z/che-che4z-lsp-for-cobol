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

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.ca.lsp.core.cobol.AbstractCobolLinePreprocessorTest;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;

/**
 * This test checks the continuation line transformation logic.
 *
 * @author zacan01, teman02
 */
public class ContinuationLineTransformationTest extends AbstractCobolLinePreprocessorTest {

  @Before
  public void eraseListener() {
    super.eraseListener();
  }

  /** POSITIVE TEXT: No text allowed in the content area A */
  @Test
  public void testNoContentAreaAInContinuationLine() {
    String line = "000010-    NO CONTENT AREA ON THIS LINE";
    runTransformation(line);
    checkNoErrorsFound();
  }

  /**
   * NEGATIVE TEXT: Text in the content area A when there is a continuation line. Should throw a
   * syntax error
   */
  @Test
  public void testContentAreaAInContinuationLine() {
    String line = "000010-THERE IS CONTENT AREA DEFINED HERE";
    runTransformation(line);
    assertEquals(1, listener.getErrorsPipe().size());
  }

  /**
   * [CASE1]: Content defined till the end of comment area with a continuation line - Expected
   * result: 0 Syntax Error
   */
  @Test
  public void testContinuationLineCasePositive() {
    List<String> lines = new ArrayList<String>();
    lines.add("000000 IDENTIFICATION DIVISION.                                         23323232");
    lines.add("000010 PROGRAM-ID. test1.                                               23323232");
    lines.add("000020 AUTHOR. TESTER                                                   23323232");
    lines.add("000030 DATA DIVISION.                                                   22221112");
    lines.add("000330 WORKING-STORAGE SECTION.                                         23323232");
    lines.add("000500    01 WS-CONST-CREATE PIC X(134) VALUE 'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    lines.add("000251-    'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD'.");

    runTransformation(reduceLines(lines));
    checkNoErrorsFound();
  }

  /**
   * [CASE1]: Content defined till the end of comment area without closing quotes and without a
   * continuation line - Expected result: 1 Syntax Error
   */
  @Test
  public void testContinuationLineCaseNegative() {

    List<String> lines = new ArrayList<String>();
    lines.add("000000 IDENTIFICATION DIVISION.                                         23323232");
    lines.add("000010 PROGRAM-ID. test1.                                               23323232");
    lines.add("000020 AUTHOR. TESTER                                                   23323232");
    lines.add("000030 DATA DIVISION.                                                   22221112");
    lines.add("000330 WORKING-STORAGE SECTION.                                         23323232");
    lines.add("000500    01 WS-CONST-CREATE PIC X(134) VALUE 'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    lines.add("000251     'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD'.");

    runTransformation(reduceLines(lines));

    assertEquals(1, listener.getErrorsPipe().size());
  }

  @Test
  public void testQuotesInsideStringNotCauseError() {
    List<String> lines = new ArrayList<String>();

    lines.add("       VALUE 'DFHCOMMAREA xmlns=\"http://www.BKP92S1O.com/schem'.");
    lines.add("       VALUE 'as/BKP92S1OInterface\"'.");
    lines.add("       \"'\"");
    lines.add("       '\"'");

    runTransformation(reduceLines(lines));

    assertEquals(0, listener.getErrorsPipe().size());
  }

  private void runTransformation(String text) {
    List<CobolLine> lines = convertToCobolLines(text);

    ContinuationLineTransformation transformation = new ContinuationLineTransformation(listener, null);
    transformation.transformLines(lines);
  }

  private List<CobolLine> convertToCobolLines(String text) {
    return super.processText(text);
  }
}
