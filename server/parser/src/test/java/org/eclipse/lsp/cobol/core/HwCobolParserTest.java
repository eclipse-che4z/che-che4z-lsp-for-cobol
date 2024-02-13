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

import org.eclipse.lsp.cobol.core.cst.ProgramUnit;
import org.eclipse.lsp.cobol.core.cst.SourceUnit;
import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;

import static org.junit.jupiter.api.Assertions.*;

import org.eclipse.lsp.cobol.core.hw.ParseResult;
import org.eclipse.lsp.cobol.core.hw.ParserSettings;
import org.junit.jupiter.api.Test;

import java.util.Collections;

/**
 * parser test
 */
class HwCobolParserTest {

  @Test
  void testEmptyProgram() {
    CobolParser cobolParser = new CobolParser(new CobolLexer(""), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertNotNull(su);
  }

  @Test
  void oneProgram() {
    final String source = "ID DIVISION. PROGRAM-ID. Pr1.";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertFalse(su.getChildren().isEmpty());
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu.getName());
    assertEquals(source, su.toText());
  }

  @Test
  void twoPrograms() {
    final String source =
            "ID DIVISION. PROGRAM-ID. Pr1.\n"
                    + "END PROGRAM Pr1.\n"
                    + "ID DIVISION. PROGRAM-ID. Pr2.\n"
                    + "END PROGRAM Pr2.\n";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertEquals(2, su.getChildren().size());
    ProgramUnit pu1 = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu1.getName());
    ProgramUnit pu2 = (ProgramUnit) su.getChildren().get(1);
    assertEquals("Pr2", pu2.getName());

    assertEquals(source, su.toText());
  }

  @Test
  void twoProgramsOptDot() {
    final String source =
            "ID DIVISION. PROGRAM-ID Pr1.\n"
                    + "END PROGRAM Pr1.\n"
                    + "ID DIVISION. PROGRAM-ID. Pr2.\n"
                    + "END PROGRAM Pr2.\n";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult parseResult = cobolParser.parse();
    assertEquals(Collections.emptyList(), parseResult.getDiagnostics());
    SourceUnit su = parseResult.getSourceUnit();
    assertEquals(2, su.getChildren().size());
    ProgramUnit pu1 = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu1.getName());
    ProgramUnit pu2 = (ProgramUnit) su.getChildren().get(1);
    assertEquals("Pr2", pu2.getName());

    assertEquals(source, su.toText());
  }

  @Test
  void twoProgramsIsRecursive() {
    final String source =
            "ID DIVISION. PROGRAM-ID Pr1 IS RECURSIVE PROGRAM\n"
                    + "END PROGRAM Pr1.\n"
                    + "ID DIVISION. PROGRAM-ID. Pr2 IS PROGRAM.\n"
                    + "END PROGRAM Pr2.\n";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    SourceUnit su = cobolParser.parse().getSourceUnit();
    assertEquals(7, su.getChildren().size());
    ProgramUnit pu1 = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu1.getName());
    assertEquals(source, su.toText());
  }


  @Test
  void nestedPrograms() {
    final String source =
            "ID DIVISION. PROGRAM-ID. Pr1.\n"
                    + "ID DIVISION. PROGRAM-ID. Pr2.\n"
                    + "END PROGRAM Pr2.\n"
                    + "END PROGRAM Pr1.\n";
    CobolParser cobolParser = new CobolParser(new CobolLexer(source), new ParserSettings());
    ParseResult parseResult = cobolParser.parse();
    SourceUnit su = parseResult.getSourceUnit();
    assertEquals(Collections.emptyList(), parseResult.getDiagnostics());
    assertEquals(1, su.getChildren().size());
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(0);
    assertEquals("Pr1", pu.getName());
    ProgramUnit npu = (ProgramUnit) pu.getChildren().get(2); // TODO: find program node
    assertEquals("Pr2", npu.getName());

    assertEquals(source, su.toText());
  }
}
