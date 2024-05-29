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
 */
package org.eclipse.lsp.cobol;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.eclipse.lsp.cobol.cst.Skipped;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.junit.jupiter.api.Test;

/** A test for skipped tokens */
class Case1Test {
  @Test
  void test() {
    String source =
        "       IDENTIFICATION DIVISION.\n"
            + "       PROGRAM-ID.\n"
            + "            IC401M IS INITIAL.\n"
            + "       ENVIRONMENT DIVISION.\n"
            + "       CONFIGURATION SECTION.\n"
            + "       SOURCE-COMPUTER.\n"
            + "           XXXXX082.\n"
            + "       OBJECT-COMPUTER.\n"
            + "           XXXXX083.\n"
            + "       DATA DIVISION.\n"
            + "       WORKING-STORAGE SECTION.\n"
            + "       01 GLOB IS GLOBAL   PIC IS X(2) VALUE IS \"HI\".\n"
            + "       01 EXTE IS EXTERNAL PIC IS X(5).\n"
            + "       PROCEDURE DIVISION.\n"
            + "       DECLARATIVES.\n"
            + "       IC401M-USE SECTION.\n"
            + "           USE GLOBAL AFTER STANDARD ERROR PROCEDURE ON I-O.\n"
            + "       END DECLARATIVES.\n"
            + "       IC401M-NONDECL SECTION.\n"
            + "       IC401M-CONTROL.\n"
            + "           PERFORM IC401M-CANCEL THRU IC401M-BYCONT.\n"
            + "           STOP RUN.\n"
            + "       IC401M-CANCEL.\n"
            + "           CANCEL \"NESTEDPROG\".\n"
            + "       IC401M-BYREF.\n"
            + "           CALL \"NESTEDPROG\" USING BY REFERENCE GLOB.\n"
            + "       IC401M-BYCONT.\n"
            + "           CALL \"FIC401M\" USING BY CONTENT GLOB.\n"
            + "       IDENTIFICATION DIVISION.\n"
            + "       PROGRAM-ID.\n"
            + "           NESTEDPROG IS COMMON.\n"
            + "       ENVIRONMENT DIVISION.\n"
            + "       DATA DIVISION.\n"
            + "       LINKAGE SECTION.\n"
            + "       01  GLOB-2  PIC X(2).\n"
            + "       PROCEDURE DIVISION USING GLOB-2.\n"
            + "       DUMMY-PARA.\n"
            + "           DISPLAY \"HELLO\".\n"
            + "       END-PARA.\n"
            + "       END PROGRAM NESTEDPROG.\n"
            + "       END PROGRAM IC401M.\n";

    ParseResult result = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    assertEquals(0, result.getDiagnostics().size(), result.getDiagnostics().toString());
    assertEquals(0, result.getSourceUnit().list(Skipped.class).size());
    assertEquals(source, result.getSourceUnit().toText());
  }
}
