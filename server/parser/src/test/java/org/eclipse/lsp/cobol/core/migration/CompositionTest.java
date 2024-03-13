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
package org.eclipse.lsp.cobol.core.migration;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.core.cst.SourceUnit;
import org.eclipse.lsp.cobol.core.hw.ParserSettings;
import org.eclipse.lsp.cobol.core.hw.antlradapter.AntlrAdapter;
import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/**
 * Test antlr composition
 */
class CompositionTest {
  private static final String NESTED_PROGRAM = "ID DIVISION. PROGRAM-ID. Pr2.\n" + "END PROGRAM Pr2.\n";
  private static final String PROGRAM = "ID DIVISION. PROGRAM-ID. Pr1.\n" + NESTED_PROGRAM + "END PROGRAM Pr1.\n";
  private static final String PROGRAM_PARA = "ID DIVISION. PROGRAM-ID. str1.\n"
          + "PROCEDURE DIVISION.\n"
          + "           DISPLAY 'OUT'.\n"
          + "       PARAG1.\n"
          + "           DISPLAY 'PARAG1'.\n"
          + "       PARAG2.\n"
          + "           DISPLAY 'PARAG2'.\n";

  @Test
  void nestedPrograms() {
    SourceUnit su = new CobolParser(new CobolLexer(PROGRAM), new ParserSettings()).parse().getSourceUnit();
    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext migrated = new AntlrAdapter(mock(BaseErrorListener.class), mock(DefaultErrorStrategy.class), mock(ParseTreeListener.class)).sourceUnitToStartRule(su);
    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlr = antlrParse(PROGRAM);
    assertEquals(antlr.children.size(), migrated.children.size());
    assertEquals(antlr.children.get(0).getChildCount(), migrated.children.get(0).getChildCount());
    ParseTree antlrPu = antlr.getChild(0).getChild(0);
    ParseTree migratedPu = migrated.getChild(0).getChild(0);
    assertEquals(antlrPu.getChildCount(), migratedPu.getChildCount());
    ParseTree antlrNPu = antlrPu.getChild(1);
    ParseTree migratedNPu = migratedPu.getChild(1);
    assertEquals(antlrNPu.getChildCount(), migratedNPu.getChildCount());
  }

  org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlrParse(String input) {
    org.eclipse.lsp.cobol.core.CobolLexer antlrLexer = new org.eclipse.lsp.cobol.core.CobolLexer(CharStreams.fromString(input));
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
  void paragraphTest() {
    SourceUnit su = new CobolParser(new CobolLexer(PROGRAM_PARA), new ParserSettings()).parse().getSourceUnit();
  }
}
