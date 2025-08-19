/*
 * Copyright (c) 2025 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.cbl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.eclipse.lsp.cobol.core.preprocessor.cbl.CblNode.TYPE_UNKNOWN;

/** CBL Parser */
public class CblParser {
  private final CblLexer lexer;

  public CblParser(CblLexer lexer) {
    this.lexer = lexer;
  }

  /**
   * Parse CBL
   *
   * @return CBL node
   */
  public CblNode cbl() {
    try {
      List<CblNode> children = new ArrayList<CblNode>();
      children.add(or("CBL", "PROCESS"));
      while (lexer.hasMore()) {
        children.add(parseFragment());
      }
      return new CblNode(children);
    } catch (CblDiagnosticException e) {
      // todo stuff
      e.printStackTrace();
      return null;
    }
  }

  private CblNode parseFragment() throws CblDiagnosticException {
    CblToken first = lexer.peek();

    if (first.getText().equalsIgnoreCase("XOPTS") || first.getText().equalsIgnoreCase("XOPT")) {
      return parseOpts(CblNode.TYPE_XOPTS);
    }

    if (first.getText().equalsIgnoreCase("CICS")) {
      return parseOpts(CblNode.TYPE_CICS);
    }

    return parseOpts();
  }

  private CblNode parseCics() throws CblDiagnosticException {
    lexer.next();
    one("(");
    one(")");
    return new CblNode(0, 0);
  }

  private CblNode parseOpts() throws CblDiagnosticException {
    return parseOpts(TYPE_UNKNOWN);
  }
  private CblNode parseOpts(String optType) throws CblDiagnosticException {
    if (TYPE_UNKNOWN.equalsIgnoreCase(optType)) {
      return parseMaybeCicsOption();
    }
    List<CblNode> children = new ArrayList<>();
    children.add(lexer.next());
    children.add(one("("));


    while (lexer.hasMore() && !isNext(")")) {
      children.add(parseMaybeCicsOption());
    }
    children.add(one(")"));
    opt(",").ifPresent(children::add);
    return new CblNode(children, optType);
  }

  private CblNode parseMaybeCicsOption() {
    List<CblNode> children = new ArrayList<>();
    int depth = 0;
    while (lexer.hasMore()) {
      if (depth == 0
              && (isNext(")") || isNext(","))) {
        break;
      }
      CblToken next = lexer.next();
      children.add(next);
      if (next.getText().equalsIgnoreCase("(")) {
        depth++;
      } else if (next.getText().equalsIgnoreCase(")")) {
        depth--;
      }
    }
    opt(",").ifPresent(children::add);
    return new CblNode(children);
  }

  private boolean isNext(String expected) {
    return lexer.peek().getText().equalsIgnoreCase(expected);
  }

  private CblToken or(String... variants) throws CblDiagnosticException {
    CblToken token = lexer.next();
    for (String text : variants) {
      if (text.equalsIgnoreCase(token.getText())) {
        return token;
      }
    }
    throw CblDiagnosticException.expect(variants);
  }

  private Optional<CblToken> opt(String expected) {
    if (!lexer.hasMore()) {
      return Optional.empty();
    }
    CblToken token = lexer.peek();
    if (token.getText().equalsIgnoreCase(expected)) {
      return Optional.of(lexer.next());
    }
    return Optional.empty();
  }

  private CblToken one(String expected) throws CblDiagnosticException {
    return or(expected);
  }
}
