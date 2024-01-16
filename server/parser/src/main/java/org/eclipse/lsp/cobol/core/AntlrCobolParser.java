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

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.DefaultErrorStrategy;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * ANTLR Parser Wrapper
 */
public class AntlrCobolParser implements AstBuilder {
  private final CommonTokenStream tokens;
  private final CobolParser antlrParser;

  public AntlrCobolParser(CharStream input, BaseErrorListener listener, DefaultErrorStrategy errorStrategy, ParseTreeListener treeListener) {
    CobolLexer antlrLexer = new CobolLexer(input);
    antlrLexer.removeErrorListeners();
    tokens = new CommonTokenStream(antlrLexer);
    antlrLexer.addErrorListener(listener);
    antlrParser = new CobolParser(tokens);
    antlrParser.removeErrorListeners();
    antlrParser.addErrorListener(listener);
    antlrParser.setErrorHandler(errorStrategy);
    antlrParser.addParseListener(treeListener);
  }
  @Override
  public CobolParser.StartRuleContext runParser() {
    return antlrParser.startRule();
  }

  @Override
  public CommonTokenStream getTokens() {
    return tokens;
  }
}
