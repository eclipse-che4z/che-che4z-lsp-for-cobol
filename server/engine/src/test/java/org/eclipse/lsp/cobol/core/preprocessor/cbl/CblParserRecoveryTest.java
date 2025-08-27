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

import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** CBL parser test */
public class CblParserRecoveryTest {
  static final String URI = "file://document.cbl";

  @Test
  void testDoubleQuotes() {
    CblLexer cblLexer = new CblLexer(URI, "      CBL XOPTS(\"DLI), NOADATA, XOPT(DLI)\n", 0);
    List<SyntaxError> diagnostics = new ArrayList<>();
    CblParser cblParser = new CblParser(cblLexer, diagnostics);
    cblParser.cbl();
    Assertions.assertEquals(1, diagnostics.size());
    Assertions.assertEquals(
        "Invalid option string:- '\"' ignored", diagnostics.get(0).getSuggestion());
  }

  @Test
  void testCicsSpace() {
    CblLexer cblLexer = new CblLexer(URI, "CBL CICS(SPACE(4))\n", 0);
    List<SyntaxError> diagnostics = new ArrayList<>();
    CblParser cblParser = new CblParser(cblLexer, diagnostics);
    CblNode cbl = cblParser.cbl().getChildren().get(0);
    assertEquals(1, diagnostics.size());
    assertEquals(18, cbl.getEnd());
    assertEquals(2, cbl.getChildren().size());
    assertEquals("SPACE must be 1, 2 or 3.", diagnostics.get(0).getSuggestion());
  }
}
