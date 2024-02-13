/*
 * Copyright (c) 2024 Broadcom.
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
 *    DAF Trucks NV – implementation of DaCo COBOL statements
 *    and DAF development standards
 *
 */
package org.eclipse.lsp.cobol.core;

import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;
import org.eclipse.lsp.cobol.core.hw.ParseResult;
import org.eclipse.lsp.cobol.core.hw.ParserSettings;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Parser test
 */
class EndNotTheEndTest {
  @Test
  void test() {
    String source = "       ID DIVISION. PROGRAM-ID. Pr1.\n"
            + "       PROCEDURE DIVISION.\n"
            + "       PAR1.\n"
            + "           SEARCH B VARYING IDX-1 AT END\n"
            + "               PERFORM PASS\n"
            + "               GO TO A\n"
            + "           WHEN V EQUAL TO \"A\"\n"
            + "               GO TO B.";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult parseResult = cobolParser.parse();
    String reconstructed = parseResult.getSourceUnit().toText();
    assertEquals(0, parseResult.getDiagnostics().size(), parseResult.getDiagnostics().toString());
    assertEquals(source, reconstructed);
  }
}
