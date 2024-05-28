/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.parser;

import lombok.Getter;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.DefaultErrorStrategy;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.tree.ParseTreeListener;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.core.CobolParser;
import org.eclipse.lsp.cobol.cst.SourceUnit;
import org.eclipse.lsp.cobol.parser.hw.ParserSettings;
import org.eclipse.lsp.cobol.parser.hw.lexer.CobolLexer;
import org.eclipse.lsp.cobol.parser.hw.antlradapter.AntlrAdapter;
import org.eclipse.lsp.cobol.parser.hw.Diagnostic;
import org.eclipse.lsp.cobol.parser.hw.ParseResult;

import java.util.List;

/**
 * COBOL parser class.
 */
public class SplitParser implements AstBuilder {
  @Getter
  private final CommonTokenStream tokens;
  private final List<Diagnostic> diagnostics;

  org.eclipse.lsp.cobol.core.CobolParser.StartRuleContext root;
  public SplitParser(CharStream input, BaseErrorListener listener, DefaultErrorStrategy errorStrategy, ParseTreeListener treeListener) {
    CobolLexer lexer = new CobolLexer(
            input.getText(Interval.of(0, input.size())));
    ParserSettings settings = new ParserSettings();
    ParseResult parseResult = new org.eclipse.lsp.cobol.parser.hw.CobolParser(lexer, settings).parse();
    SourceUnit su = parseResult.getSourceUnit();
    diagnostics = parseResult.getDiagnostics();
    AntlrAdapter antlrAdapter = new AntlrAdapter(listener, errorStrategy, treeListener);
    tokens = antlrAdapter.adaptTokens(su);
    root = antlrAdapter.sourceUnitToStartRule(su);
  }

  /**
   * Produce AST of the source
   *
   * @return the AST root node
   */
  @Override
  public CobolParser.StartRuleContext runParser() {
    ThreadInterruptionUtil.checkThreadInterrupted();
    return root;
  }

  @Override
  public List<Diagnostic> diagnostics() {
    return diagnostics;
  }
}
