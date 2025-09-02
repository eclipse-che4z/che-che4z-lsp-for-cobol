/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import static org.eclipse.lsp.cobol.core.preprocessor.cbl.CblParserTest.parserFor;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.junit.jupiter.api.Test;

/** CBL parser test */
public class CblParserDiagnosticsTest {
  static final String URI = "file://document.cbl";

  @Test
  void testCicsSpace() {
    List<SyntaxError> diagnostics = new ArrayList<>();
    CblParser cblParser = parserFor("CBL CICS(SPACE(4))\n", diagnostics);
    CblNode cbl = cblParser.cbl().getChildren().get(0);
    assertEquals(1, diagnostics.size());
    assertEquals(18, cbl.getEnd());
    assertEquals(2, cbl.getChildren().size());
    assertEquals("SPACE must be 1, 2 or 3.", diagnostics.get(0).getSuggestion());
  }
}
