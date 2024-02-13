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

import org.eclipse.lsp.cobol.core.cst.SourceUnit;
import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;
import org.eclipse.lsp.cobol.core.hw.ParseResult;
import org.eclipse.lsp.cobol.core.hw.ParserSettings;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Error handling test
 */
class HwParserErrorTest {

  @Test
  void testIdDivisionMissingDot() {
    final String source = "ID DIVISION PROGRAM-ID. Pr1."; // It should have '.' after ID DIVISION
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult parseResult = cobolParser.parse();
    SourceUnit su = parseResult.getSourceUnit();
    // One error for '.' and one fot unknown input after '.'
    // TODO: better recovery for IDENTIFICATION DIVISION
    assertEquals(2, parseResult.getDiagnostics().size());
    assertEquals(4, su.getChildren().size());
    assertEquals(source, su.toText());
  }

  @Test
  void testTwoProgramsIdDivisionMissingDot() {
    final String source = "ID DIVISION PROGRAM-ID. Pr1.\nID DIVISION. PROGRAM-ID. Pr1.\n"; // It should have '.' after ID DIVISION
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult parseResult = cobolParser.parse();
    SourceUnit su = parseResult.getSourceUnit();

    //    assertEquals(2, parseResult.getDiagnostics().size());
    assertEquals(6, su.getChildren().size());
    assertEquals(source, su.toText());
  }
}
