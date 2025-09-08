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

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

/** CBL parser test */
public class CblParserDiagnosticsTest {
  @Test
  void testCicsSpace() {
    CblParser cblParser = new CblParser("CICS(SPACE(4))\n", "file://document.cbl", 0, 0);
    cblParser.extractCicsOptions();
    assertEquals(1, cblParser.getDiagnostics().size());
    assertEquals("SPACE must be 1, 2 or 3.", cblParser.getDiagnostics().get(0).getSuggestion());
  }

  @Test
  void testApostrophe() {
    CblParser cblParser = new CblParser("CICS('FLAG(W)\")\n", "file://document.cbl", 0, 0);
    cblParser.extractCicsOptions();
    assertEquals(1, cblParser.getDiagnostics().size());
    assertEquals("' expected.", cblParser.getDiagnostics().get(0).getSuggestion());
  }

  @Test
  void testQuotes() {
    CblParser cblParser = new CblParser("CICS(\"FLAG(W)')\n", "file://document.cbl", 0, 0);
    cblParser.extractCicsOptions();
    assertEquals(1, cblParser.getDiagnostics().size());
    assertEquals("\" expected.", cblParser.getDiagnostics().get(0).getSuggestion());
  }
}
