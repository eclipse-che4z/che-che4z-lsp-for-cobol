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
package org.eclipse.lsp.cobol.migration;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.DefaultErrorStrategy;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.cst.ProgramUnit;
import org.eclipse.lsp.cobol.cst.SourceUnit;
import org.eclipse.lsp.cobol.cst.procedure.Paragraph;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.antlradapter.AntlrAdapter;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.eclipse.lsp.cobol.migration.SectionCompositionTest.antlrParse;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/**
 * make sure that nodes are in the right order.
 */
class ElementsOrderTest {
  @Test
  void case4() {
    String source = "       IDENTIFICATION DIVISION.\n"
            + "       PROGRAM-ID.  CASE4.\n"
            + "       PROCEDURE DIVISION.\n"
            + "           DISPLAY 'OUT'.\n"
            + "           GO TO PARAG1.\n"
            + "       PARAG1.\n"
            + "           DISPLAY 'PARAG1'.\n"
            + "           PERFORM PARAG2.\n"
            + "       PARAG2.\n"
            + "           DISPLAY 'PARAG2'.";

    SourceUnit su = new CobolParser(new CobolLexer(source), new ParserSettings()).parse().getSourceUnit();
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(1);
    List<Paragraph> paragraphs = pu.list(Paragraph.class);
    Paragraph p1 = paragraphs.get(0);
    Paragraph p2 = paragraphs.get(1);
    assertEquals("PARAG1", p1.getName());
    assertEquals("PARAG2", p2.getName());

    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext migrated =
            antlrAdapter.sourceUnitToStartRule(su);
    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlr = antlrParse(source);
    ParseTree antlrPdc = antlr.getChild(0).getChild(0).getChild(1);
    ParseTree migratedPdc = migrated.getChild(0).getChild(0).getChild(1);

    Utils.compareAll(antlrPdc, migratedPdc);

    ParseTree antlrP1 = antlrPdc.getChild(3).getChild(0).getChild(2);
    ParseTree antlrP2 = antlrPdc.getChild(3).getChild(0).getChild(3);
    ParseTree migratedP1 = migratedPdc.getChild(3).getChild(0).getChild(2);
    ParseTree migratedP2 = migratedPdc.getChild(3).getChild(0).getChild(3);
    assertEquals(antlrP1.getChildCount(), migratedP1.getChildCount());
    assertEquals(antlrP2.getChildCount(), migratedP2.getChildCount());
    Utils.compareStartStopPositions(antlrP1, migratedP1);
    Utils.compareStartStopPositions(antlrP2, migratedP2);
  }

  @Test
  void case5() {
    String source = "       IDENTIFICATION DIVISION.\n"
            + "       PROGRAM-ID.  SECTST.\n"
            + "       PROCEDURE DIVISION.\n"
            + "           DISPLAY 'OUT'.\n"
            + "           GO TO PARAG1.\n"
            + "       SECT1 SECTION.\n"
            + "       PARAG1.\n"
            + "           DISPLAY 'PARAG1'.\n"
            + "           PERFORM PARAG2 OF SECT2.\n"
            + "       SECT2 SECTION.\n"
            + "       PARAG2.\n"
            + "           DISPLAY 'PARAG2'.";

    SourceUnit su = new CobolParser(new CobolLexer(source), new ParserSettings()).parse().getSourceUnit();
    ProgramUnit pu = (ProgramUnit) su.getChildren().get(1);
    List<Paragraph> paragraphs = pu.list(Paragraph.class);
    Paragraph p1 = paragraphs.get(0);
    Paragraph p2 = paragraphs.get(1);
    assertEquals("PARAG1", p1.getName());
    assertEquals("PARAG2", p2.getName());

    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext migrated =
            antlrAdapter.sourceUnitToStartRule(su);
    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlr = antlrParse(source);
    ParseTree antlrPdc = antlr.getChild(0).getChild(0).getChild(1);
    ParseTree migratedPdc = migrated.getChild(0).getChild(0).getChild(1);
    ParseTree antlr1 = antlrPdc.getChild(3).getChild(1);
    ParseTree antlr2 = antlrPdc.getChild(3).getChild(2);
    ParseTree migrated1 = migratedPdc.getChild(3).getChild(1);
    ParseTree migrated2 = migratedPdc.getChild(3).getChild(2);
    Utils.compareStartStopPositions(antlr1, migrated1);
    Utils.compareStartStopPositions(antlr2, migrated2);
    assertEquals(antlr1.getChildCount(), migrated1.getChildCount());
    assertEquals(antlr2.getChildCount(), migrated2.getChildCount());
  }

}
