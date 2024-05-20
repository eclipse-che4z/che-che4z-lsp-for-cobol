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
import org.eclipse.lsp.cobol.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.cst.procedure.Section;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/**
 * Error recovery test
 */
@Disabled("Waiting to be finished")
class BrokenTest {
  @Test
  void test() {
    ParseResult result = new CobolParser(new CobolLexer("       identification division.\n"
            + "       program-id. DUMMY.\n"
            + "       author. COBOL-Test.\n"
            + "       environment division.\n"
            + "       data division.\n"
            + "       procedure division.\n"
            + "       A-MAIN         section.\n"
            + "           perform B-SEC\n"
            + "           goback\n"
            + "           .\n"
            + "       \n"
            + "       B-SEC              section.\n"
            + "           display 'Hello'\n"
            + "           exit section\n"
            + "           display '(... but no goodbye)'\n"
            + "           ."), new ParserSettings()).parse();
    ProgramUnit pu = (ProgramUnit) result.getSourceUnit().getChildren().get(1);
    ProcedureDivision pd = (ProcedureDivision) pu.getChildren().get(5);
    Section s1 = (Section) pd.getChildren().get(6);
    Section s2 = (Section) pd.getChildren().get(7);
    System.out.println(s1.toText());
  }
}
