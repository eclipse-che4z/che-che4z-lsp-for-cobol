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
package org.eclipse.lsp.cobol.divisions.procedure;

import org.eclipse.lsp.cobol.cst.ProgramUnit;
import org.eclipse.lsp.cobol.cst.procedure.Paragraph;
import org.eclipse.lsp.cobol.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.cst.procedure.Statement;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Test that HW parser can understand end of program.
 */
class EndProgramTest {
  @Test
  void test() {
    String source = "ID DIVISION. PROGRAM-ID. str1.\n"
            + "       PROCEDURE DIVISION.\n"
            + "           DISPLAY 'OUT'.\n"
            + "       PARAG1.\n"
            + "           DISPLAY 'PARAG1'.\n"
            + "       PARAG2.\n"
            + "           DISPLAY 'PARAG2'.\n"
            + "       END PROGRAM str1.\n";

    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    assertTrue(parseResult.getDiagnostics().isEmpty());
    ProgramUnit pu = (ProgramUnit) parseResult.getSourceUnit().getChildren().get(0);
    ProcedureDivision pd = pu.list(ProcedureDivision.class).get(0);
    assertEquals(2, pd.getChildren().stream().filter(Paragraph.class::isInstance).count());
    List<Paragraph> paragraphs = pd.list(Paragraph.class);
    Paragraph p1 = paragraphs.get(0);
    Paragraph p2 = paragraphs.get(1);
    assertEquals(1, pd.getChildren().stream().filter(Statement.class::isInstance).count());
    assertEquals(1, p1.getChildren().stream().filter(Statement.class::isInstance).count());
    assertEquals(1, p2.getChildren().stream().filter(Statement.class::isInstance).count());
    // TODO: check if everything is in the place

    assertEquals(source, parseResult.getSourceUnit().toText());
  }
}
