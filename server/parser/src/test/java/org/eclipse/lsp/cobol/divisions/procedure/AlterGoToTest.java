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
 *
 */
package org.eclipse.lsp.cobol.divisions.procedure;

import org.eclipse.lsp.cobol.cst.ProgramUnit;
import org.eclipse.lsp.cobol.cst.procedure.Paragraph;
import org.eclipse.lsp.cobol.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** test alter go - to */
public class AlterGoToTest {
    @Test
    void test() {
        String source = "       ID DIVISION. PROGRAM-ID. str1.\n"
                + "       PROCEDURE DIVISION.\n"
                + "           DISPLAY 'OUT'.\n"
                + "       PARAG2.\n"
                + "           GO TO.\n"
                + "       PARAG2.\n"
                + "           DISPLAY 'PARAG2'.\n";
        ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
        assertTrue(parseResult.getDiagnostics().isEmpty());
        ProgramUnit pu = (ProgramUnit) parseResult.getSourceUnit().getChildren().get(1);
        ProcedureDivision pd = pu.list(ProcedureDivision.class).get(0);
        assertEquals(2, pd.getChildren().stream().filter(Paragraph.class::isInstance).count());
        assertEquals(source, parseResult.getSourceUnit().toText());
    }

}
