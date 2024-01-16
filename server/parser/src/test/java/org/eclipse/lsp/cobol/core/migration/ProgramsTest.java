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
import org.eclipse.lsp.cobol.core.hw.AntlrAdapter;
import org.eclipse.lsp.cobol.core.hw.CobolLexer;
import org.eclipse.lsp.cobol.core.hw.CobolParser;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

/**
 * Test antlr composition
 */
class ProgramsTest {
  @Test
  void test() {
    final String nestedProgram = "ID DIVISION. PROGRAM-ID. Pr2.\n"
            + "END PROGRAM Pr2.\n";
    final String program = "ID DIVISION. PROGRAM-ID. Pr1.\n"
            + nestedProgram
            + "END PROGRAM Pr1.\n";

    SourceUnit su = new CobolParser(new CobolLexer(program)).parse().getSourceUnit();
    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext migrated = new AntlrAdapter(
            mock(BaseErrorListener.class),
            mock(DefaultErrorStrategy.class),
            mock(ParseTreeListener.class)).sourceUnitToStartRule(su);


    org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext antlr = antlrParse(program);
    assertEquals(antlr.children.size(), migrated.children.size());
    assertEquals(antlr.children.get(0).getChildCount(), migrated.children.get(0).getChildCount());
    ParseTree antlrPu = antlr.getChild(0).getChild(0);
    ParseTree migratedPu = migrated.getChild(0).getChild(0);
    assertEquals(antlrPu.getChildCount(), migratedPu.getChildCount());
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
//    antlrParser.setErrorHandler(errorStrategy);
//    antlrParser.addParseListener(treeListener);
    return antlrParser.startRule();
  }
}
