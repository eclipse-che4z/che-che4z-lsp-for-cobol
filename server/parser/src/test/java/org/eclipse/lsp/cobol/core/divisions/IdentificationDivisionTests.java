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
package org.eclipse.lsp.cobol.core.divisions;

import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;
import org.eclipse.lsp.cobol.core.hw.ParseResult;
import org.eclipse.lsp.cobol.core.hw.ParserSettings;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Parser test for identification division
 */
class IdentificationDivisionTests {
  //  https://www.ibm.com/docs/en/cobol-zos/6.4?topic=division-program-id-paragraph
  @Test
  void test() {
    String source = "IDENTIFICATION DIVISION.\n"
            + "PROGRAM-ID. PRG IS COMMON.";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult parseResult = cobolParser.parse();
    String reconstructed = parseResult.getSourceUnit().toText();
    assertEquals(0, parseResult.getDiagnostics().size(), parseResult.getDiagnostics().toString());
    assertEquals(source, reconstructed);

  }
}
