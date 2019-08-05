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
package com.ca.lsp.core.cobol.preprocessor.sub.line.writer.impl;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.ca.lsp.core.cobol.AbstractCobolLinePreprocessorTest;
import com.ca.lsp.core.cobol.preprocessor.sub.CobolLine;
import com.ca.lsp.core.cobol.preprocessor.sub.line.writer.CobolLineWriter;

public class CobolLineWriterImplTest extends AbstractCobolLinePreprocessorTest {
  private static final String TEXT_TO_TEST =
      "078087                 PERFORM BBAB-MOVE-TO-DETAIL-MAP\r\n"
          + "078088                 MOVE -1 TO SNAMEDL\r\n"
          + "078089                 MOVE 'PRESS \"CLEAR\" OR \"ENTER\" TO RETURN TO THE M\r\n"
          + "078089-                     'ENU WHEN \r\n"
          + "078089-                     'FINISHED'\r\n"
          + "078089                 MOVE \"PRESS 'CLEAR' OR 'ENTER' TO RETURN TO THE M\r\n"
          + "078089-                     \"ENU WHEN FINISHED\"\r\n"
          + "078089                 MOVE 'asd' \r\n"
          + "078089-                     NEXT LINE\r\n";

  private static final String EXPECTED =
      "                       PERFORM BBAB-MOVE-TO-DETAIL-MAP\r\n"
          + "                       MOVE -1 TO SNAMEDL\r\n"
          + "                       MOVE 'PRESS \"CLEAR\" OR \"ENTER\" TO RETURN TO THE MENU WHEN FINISHED'\r\n"
          + "\r\n"
          + "\r\n"
          + "                       MOVE \"PRESS 'CLEAR' OR 'ENTER' TO RETURN TO THE MENU WHEN FINISHED\"\r\n"
          + "\r\n"
          + "                       MOVE 'asd' NEXT LINE\r\n";

  @Before
  public void eraseListener() {
    super.eraseListener();
  }

  @Test
  public void test() {
    List<CobolLine> cobolLines = super.processText(TEXT_TO_TEST);
    CobolLineWriter writer = new CobolLineWriterImpl();
    assertEquals(EXPECTED, writer.serialize(cobolLines));
  }
}
