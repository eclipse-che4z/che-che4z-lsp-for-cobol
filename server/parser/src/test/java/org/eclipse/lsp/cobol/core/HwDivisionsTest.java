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

import org.eclipse.lsp.cobol.core.cst.*;
import org.eclipse.lsp.cobol.core.cst.IdentificationDivision;
import org.eclipse.lsp.cobol.core.cst.procedure.ProcedureDivision;
import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;
import org.eclipse.lsp.cobol.core.hw.ParserSettings;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;

/**
 * Division tests
 */
class HwDivisionsTest {

  @Test
  void testIdentificationDivision() {
    final String source = "IDENTIFICATION DIVISION.\n"
            + "PROGRAM-ID.\n"
            + "    TESTPRG.\n"
            + "AUTHOR.\n"
            + "SECURITY.\n"
            + "    NONE.";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertFalse(su.getChildren().isEmpty());
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(0);
    assertEquals("TESTPRG", pu.getName());

    IdentificationDivision id = (IdentificationDivision) pu.getChildren().get(0);
    assertEquals(source, id.toText());
    assertEquals(source, su.toText());
  }

  @Test
  void testEnvironmentDivision() {
    final String edSource = "ENVIRONMENT DIVISION.\n"
            + "CONFIGURATION SECTION.\n"
            + "SOURCE-COMPUTER.\n"
            + "    XXXXX023.\n"
            + "OBJECT-COMPUTER.\n"
            + "    XXXXX034.\n"
            + "INPUT-OUTPUT SECTION.\n"
            + "FILE-CONTROL.\n"
            + "    SELECT PRINT-FILE ASSIGN TO\n"
            + "    XXXXX035.\n";
    final String source = "ID DIVISION. PROGRAM-ID. Pr1.\n" + edSource;
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertFalse(su.getChildren().isEmpty());
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu.getName());

    EnvironmentDivision ed = (EnvironmentDivision) pu.getChildren().get(2);
    assertEquals(edSource, ed.toText());
    assertEquals(source, su.toText());
  }

  @Test
  void testDataDivision() {
    final String ddSource = "DATA DIVISION.\n"
            + "WORKING-STORAGE SECTION.\n"
            + "77  PASSWORD1 PIC X(10) VALUE XXXXX012.\n";

    final String source = "ID DIVISION. PROGRAM-ID. Pr1.\n" + ddSource;
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertFalse(su.getChildren().isEmpty());
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu.getName());

    DataDivision dd = (DataDivision) pu.getChildren().get(2);
    assertEquals(ddSource, dd.toText());
    assertEquals(source, su.toText());
  }

  @Test
  void testProcedureDivision() {
    final String pdSource = "PROCEDURE DIVISION.\n"
            + "    A-PARA.\n"
            + "    PERFORM DISPLAY 'IN A-PARA'\n"
            + "    END-PERFORM.\n"
            + "    PERFORM C-PARA THRU D-PARA.\n"
            + "    PERFORM D-PARA THRU E-PARA.\n"
            + "    B-PARA.\n"
            + "      DISPLAY 'IN B-PARA'.\n"
            + "    C-PARA.\n"
            + "      DISPLAY 'IN C-PARA'.\n"
            + "    D-PARA.\n"
            + "      DISPLAY '---------'.\n"
            + "      DISPLAY 'IN D-PARA'.\n"
            + "    E-PARA.";

    final String source = "ID DIVISION. PROGRAM-ID. Pr1.\n" + pdSource;
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertFalse(su.getChildren().isEmpty());
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu.getName());

    ProcedureDivision pd = (ProcedureDivision) pu.getChildren().get(2);
    assertEquals(pdSource, pd.toText());
    assertEquals(source, su.toText());
  }
}
