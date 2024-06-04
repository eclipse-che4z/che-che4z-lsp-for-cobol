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

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.cst.SourceUnit;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.parser.hw.CobolParser;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.antlradapter.AntlrAdapter;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/**
 * Test that HW parser can understand sections.
 */
class SectionCompositionTest {
  @Test
  void test() {
    String source =
            "IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID.  SECTST.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "           DISPLAY 'OUT'.\n"
                    + "           GO TO PARAG1.\n"
                    + "       SECT1 SECTION.\n"
                    + "           DISPLAY 'SECT1'.\n"
                    + "       PARAG1.\n"
                    + "           DISPLAY 'PARAG1'.\n"
                    + "           PERFORM PARAG2 OF SECT2.\n"
                    + "       SECT2 SECTION.\n"
                    + "       PARAG2.\n"
                    + "           DISPLAY 'PARAG2'.";

    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();

    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext migrated =
            antlrAdapter.sourceUnitToStartRule(su);
    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlr = antlrParse(source);


    ParseTree antlrPd = antlr.getChild(0).getChild(0).getChild(1);
    ParseTree migratedPd = migrated.getChild(0).getChild(0).getChild(1);
    assertEquals(antlrPd.getChildCount(), migratedPd.getChildCount());

    ParseTree antlrPdb = antlrPd.getChild(3);
    ParseTree migratedPdb = migratedPd.getChild(3);

    assertEquals(antlrPdb.getChild(0).getChildCount(), migratedPdb.getChild(0).getChildCount());

    Utils.compareStartStopPositions(antlrPdb.getChild(0), migratedPdb.getChild(0));
    Utils.compareStartStopPositions(antlrPdb.getChild(1), migratedPdb.getChild(1));
    Utils.compareStartStopPositions(antlrPdb.getChild(2), migratedPdb.getChild(2));
  }

  @Test
  void testParagraphSection2() {
    String source =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. TX2.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "           GO TO PARAG1 OF SECTION-1.\n"
                    + "       PARAG1.\n"
                    + "       SECTION-1 SECTION.\n"
                    + "       PARAG1.";
    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();

    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext migrated =
            antlrAdapter.sourceUnitToStartRule(su);
    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlr = antlrParse(source);

    ParseTree antlrPd = antlr.getChild(0).getChild(0).getChild(1);
    ParseTree migratedPd = migrated.getChild(0).getChild(0).getChild(1);
    assertEquals(antlrPd.getChildCount(), migratedPd.getChildCount());
    Utils.compareStartStopPositions(antlrPd, migratedPd);

    ParseTree antlrPdb = antlrPd.getChild(3);
    ParseTree migratedPdb = migratedPd.getChild(3);
    Utils.compareStartStopPositions(antlrPdb, migratedPdb);
    assertEquals(antlrPdb.getChildCount(), migratedPdb.getChildCount());
    Utils.compareStartStopPositions(antlrPdb, migratedPdb);

    ParserRuleContext antlrPdbP1 = (ParserRuleContext) antlrPdb.getChild(0);
    ParserRuleContext migratedPdbP1 = (ParserRuleContext) migratedPdb.getChild(0);
    assertEquals(antlrPdbP1.getChildCount(), migratedPdbP1.getChildCount());
    assertEquals(antlrPdbP1.getChild(1).getChild(0).getText(), migratedPdbP1.getChild(1).getChild(0).getText());

    ParseTree antlrSection = antlrPdb.getChild(1);
    ParseTree migratedSection = migratedPdb.getChild(1);
    assertEquals(antlrSection.getChildCount(), migratedSection.getChildCount());
    ParseTree antlrSectionHeader = antlrSection.getChild(0);
    ParseTree migratedSectionHeader = migratedSection.getChild(0);
    assertEquals(antlrSectionHeader.getChildCount(), migratedSectionHeader.getChildCount());
    assertEquals(antlrSectionHeader.getText(), migratedSectionHeader.getText());

    ParseTree antlrSP = antlrSection.getChild(2).getChild(0);
    ParseTree migratedSP = migratedSection.getChild(2).getChild(0);

    assertEquals(antlrSP.getChildCount(), migratedSP.getChildCount());
    Utils.compareStartStopPositions(antlrSP, migratedSP);
    assertEquals(antlrSP.getText(), migratedSP.getText());

    assertEquals(antlrSection.getText(), migratedSection.getText());
  }

  @Test
  void testMatchPositions() {
    String source =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. MPT.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "       PARAG1.\n";
    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext migrated =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrAdapter.sourceUnitToStartRule(su).getChild(0);
    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext antlr =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrParse(source).getChild(0);
    ParserRuleContext antlrP = (ParserRuleContext) antlr.getChild(0).getChild(1).getChild(3).getChild(0).getChild(0);
    ParserRuleContext migratedP = (ParserRuleContext) migrated.getChild(0).getChild(1).getChild(3).getChild(0).getChild(0);
    assertEquals(antlrP.getStop().getCharPositionInLine(), migratedP.getStop().getCharPositionInLine());
  }

  @Test
  void testMatchPositionsPara() {
    String source =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. MPT.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "           GO TO PARAG1 OF SECTION-1.\n";
    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext migrated =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrAdapter.sourceUnitToStartRule(su).getChild(0);
    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext antlr =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrParse(source).getChild(0);
    ParserRuleContext antlrP = (ParserRuleContext) antlr.getChild(0).getChild(1).getChild(3).getChild(0)
            .getChild(0) // sentence
            .getChild(0) // statement
            .getChild(0) // goto
            .getChild(2) // procedure name
            .getChild(0); // paragraph name
    ParserRuleContext migratedP = (ParserRuleContext) migrated.getChild(0).getChild(1).getChild(3).getChild(0)
            .getChild(0) // sentence
            .getChild(0) // statement
            .getChild(0) // goto
            .getChild(2) // procedure name
            .getChild(0); // paragraph name

    Utils.compareStartStopPositions(antlrP, migratedP);
  }

  @Test
  void testMatchPositions3() {
    String source =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. AMB10.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "           GO TO PARAG1 OF SECTION-1.\n"
                    + "       PARAG1.\n"
                    + "       SECTION-1 SECTION.\n"
                    + "       PARAG1.";

    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext migrated =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrAdapter.sourceUnitToStartRule(su).getChild(0);
    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext antlr =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrParse(source).getChild(0);

    ParseTree antlrS = antlr.getChild(0).getChild(1).getChild(3).getChild(1);
    ParseTree migratedS = migrated.getChild(0).getChild(1).getChild(3).getChild(1);
    Utils.compareStartStopPositions(antlrS, migratedS);


    ParserRuleContext antlrP = (ParserRuleContext) antlr.getChild(0).getChild(1).getChild(3)
            .getChild(0) // paragraphs
            .getChild(0);
    ParserRuleContext migratedP = (ParserRuleContext) migrated.getChild(0).getChild(1).getChild(3)
            .getChild(0) // paragraphs
            .getChild(0);
    Utils.compareStartStopPositions(antlrP, migratedP);

    antlrP = (ParserRuleContext) antlr.getChild(0).getChild(1).getChild(3).getChild(1)
            .getChild(2)
            .getChild(0);
    migratedP = (ParserRuleContext) migrated.getChild(0).getChild(1).getChild(3).getChild(1)
            .getChild(2)
            .getChild(0);

    assertEquals(antlrP.getChildCount(), migratedP.getChildCount());
    Utils.compareStartStopPositions(antlrP, migratedP);
  }

  @Test
  void testMatchPositions4() {
    String source =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. AMB10.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "       SECTION-1 SECTION.\n"
                    + "           GO TO PARAG1 OF SECTION-1.\n";

    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext migrated =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrAdapter.sourceUnitToStartRule(su).getChild(0);
    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext antlr =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrParse(source).getChild(0);

    ParseTree antlrS = antlr.getChild(0).getChild(1).getChild(3).getChild(1);
    ParseTree migratedS = migrated.getChild(0).getChild(1).getChild(3).getChild(0);
    assertEquals(antlrS.getChildCount(), migratedS.getChildCount());
    Utils.compareStartStopPositions(antlrS, migratedS);
  }


  static org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlrParse(String input) {
    org.eclipse.lsp.cobol.core.CobolLexer antlrLexer =
            new org.eclipse.lsp.cobol.core.CobolLexer(CharStreams.fromString(input));
    antlrLexer.removeErrorListeners();
    ANTLRErrorListener listener = new ConsoleErrorListener();
    antlrLexer.addErrorListener(listener);
    CommonTokenStream tokens = new CommonTokenStream(antlrLexer);
    org.eclipse.lsp.cobol.core.CobolParser antlrParser = new org.eclipse.lsp.cobol.core.CobolParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(listener);
    return antlrParser.startRule();
  }

  @Test
  void testMatchSourceUnit() {
    String source =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. MPT.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "       PARAG1.\n";
    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext migrated =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrAdapter.sourceUnitToStartRule(su).getChild(0);
    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext antlr =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrParse(source).getChild(0);
    ParseTree antlrPbc = antlr.getChild(0) // PU
            .getChild(1) // DC
            .getChild(3);
    ParseTree migratedPbc = migrated.getChild(0) // PU
            .getChild(1) // DC
            .getChild(3); // Pdb

    Utils.compareAll(antlrPbc, migratedPbc);

    ParseTree antlrPc = antlrPbc.getChild(0).getChild(0); // PС
    ParseTree migratedPc = migratedPbc.getChild(0).getChild(0); // PС

    Utils.compareStartStopPositions(antlrPc, migratedPc);
  }

  @Test
  void testParagraphMatchPositions() {
    String source = "       ID DIVISION.\n"
            + "       PROGRAM-ID. TESTREPL.\n"
            + "       PROCEDURE DIViSION. \n"
            + "       MAINLINE. \n"
            + "           GOBACK.  ";
    ParseResult parseResult = new CobolParser(new CobolLexer(source), new ParserSettings()).parse();
    SourceUnit su = parseResult.getSourceUnit();
    AntlrAdapter antlrAdapter =
            new AntlrAdapter(
                    mock(BaseErrorListener.class),
                    mock(DefaultErrorStrategy.class),
                    mock(ParseTreeListener.class));

    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext migrated =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrAdapter.sourceUnitToStartRule(su).getChild(0);
    org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext antlr =
            (org.eclipse.lsp.cobol.core.CobolParser.CompilationUnitContext) antlrParse(source).getChild(0);
    Utils.compareAll(antlr.getChild(0).getChild(1), migrated.getChild(0).getChild(1));
  }

}
