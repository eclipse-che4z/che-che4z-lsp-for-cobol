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
package org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.impl;

import org.eclipse.lsp.cobol.core.AbstractCobolLinePreprocessorTest;
import org.eclipse.lsp.cobol.core.model.CobolLine;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriter;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.writer.CobolLineWriterImpl;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** Test to check CobolLineWriterImpl */
class CobolLineWriterImplTest extends AbstractCobolLinePreprocessorTest {
  private static final String TEXT_TO_TEST =
      "CBL DATA(24)\r\n"
          + "078087                 PERFORM BBAB-MOVE-TO-DETAIL-MAP\r\n"
          + "078088                 MOVE -1 TO SNAMEDL\r\n"
          + "078089                 MOVE 'PRESS \"CLEAR\" OR \"ENTER\" TO RETURN TO THE M\r\n"
          + "078089-                     'ENU WHEN \r\n"
          + "078089-                     'FINISHED'\r\n"
          + "078089                 MOVE \"PRESS 'CLEAR' OR 'ENTER' TO RETURN TO THE M\r\n"
          + "078089-                     \"ENU WHEN FINISHED\"\r\n"
          + "078089                 MOVE 'asd' \r\n"
          + "078089-                     NEXT LINE\r\n";

  private static final String EXPECTED =
      "CBL DATA(24)\n"
          + "                       PERFORM BBAB-MOVE-TO-DETAIL-MAP\n"
          + "                       MOVE -1 TO SNAMEDL\n"
          + "                       MOVE 'PRESS \"CLEAR\" OR \"ENTER\" TO RETURN TO THE MENU WHEN FINISHED'\n"
          + "\n"
          + "\n"
          + "                       MOVE \"PRESS 'CLEAR' OR 'ENTER' TO RETURN TO THE MENU WHEN FINISHED\"\n"
          + "\n"
          + "                       MOVE 'asd' NEXT LINE\n";

  @Test
  void test() {
    ResultWithErrors<List<CobolLine>> result = super.processText(TEXT_TO_TEST);
    CobolLineWriter writer = new CobolLineWriterImpl();
    assertEquals(EXPECTED, writer.serialize(result.getResult()));
    assertEquals(0, result.getErrors().size());
  }
}
