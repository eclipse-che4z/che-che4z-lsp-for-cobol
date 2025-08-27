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

import org.eclipse.lsp.cobol.common.error.SyntaxError;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.eclipse.lsp.cobol.common.error.ErrorSeverity.WARNING;
import static org.eclipse.lsp.cobol.core.preprocessor.cbl.CblNodeTypes.*;

/** CBL Parser */
public class CblParser {
  private final CblLexer lexer;
  private final List<SyntaxError> diagnostics;

  public CblParser(CblLexer lexer, List<SyntaxError> diagnostics) {
    this.lexer = lexer;
    this.diagnostics = diagnostics;
  }

  /**
   * Parse CBL
   *
   * @return CBL node
   */
  public CblNode cbl() {
    List<CblNode> children = new ArrayList<>();
    try {
      children.add(or("CBL", "PROCESS"));
      while (lexer.hasMore()) {
        children.add(parseFragment());
      }
    } catch (CblDiagnosticException e) {
      diagnostics.add(e.toSyntaxError());
    }
    return new CblNode(new CblNode(children, CBL), ROOT);
  }

  private CblNode parseFragment() throws CblDiagnosticException {
    CblToken first = lexer.peek();

    if (first.getText().equalsIgnoreCase("XOPTS") || first.getText().equalsIgnoreCase("XOPT")) {
      return parseXOpts();
    }

    if (first.getText().equalsIgnoreCase("CICS")) {
      return parseCics();
    }
    return parseOption();
  }

  private CblNode parseCics() throws CblDiagnosticException {
    List<CblNode> children = new ArrayList<>();
    children.add(one("CICS"));
    if (isNext("(")) {
      parseCicsOptions(children, true);
      return new CblNode(children, CICS_CONTAINER);
    }
    return new CblNode(children, UNKNOWN);
  }

  private CblNode parseXOpts() throws CblDiagnosticException {
    List<CblNode> children = new ArrayList<>();
    children.add(or("XOPT", "XOPTS"));
    parseCicsOptions(children, false);
    return new CblNode(children, XOPTS);
  }

  private void parseCicsOptions(List<CblNode> children, boolean force)
      throws CblDiagnosticException {
    children.add(one("("));
    boolean inApostrophes = isNext("'");
    if (inApostrophes) {
      children.add(one("'"));
    }
    while (lexer.hasMore() && !(inApostrophes && isNext("'")) && !isNext(")")) {
      if (isNext("\"")) {
        semanticError(lexer.next(), "Invalid option string:- '\"' ignored");
      }
      List<CblNode> nodeChildren = new ArrayList<>();
      if (isNext("FLAG") || isNext("F")) {
        nodeChildren.add(or("FLAG", "F"));
        nodeChildren.add(one("("));
        nodeChildren.add(or("E", "I", "S", "U", "W"));
        if (isNext(",")) {
          nodeChildren.add(one(","));
          nodeChildren.add(or("E", "I", "S", "U", "W"));
        }
        nodeChildren.add(one(")"));
        opt(",").ifPresent(nodeChildren::add);
        children.add(new CblNode(nodeChildren, FLAG));
      } else if (isNext("LINECOUNT") || isNext("LC")) {
        nodeChildren.add(or("LINECOUNT", "LC"));
        nodeChildren.add(one("("));
        CblToken next = lexer.next();
        int i = checkIntegerLiteral(next);
        nodeChildren.add(next);
        nodeChildren.add(one(")"));
        opt(",").ifPresent(nodeChildren::add);
        children.add(new CblNode(nodeChildren, LINECOUNT));
        if (isLineNumberWrong(i)) {
          semanticError(next, "LINECOUNT must be an integer between 10 and 255, or 0.");
        }
      } else if (isNext("SPACE")) {
        nodeChildren.add(one("SPACE"));
        nodeChildren.add(one("("));
        CblToken next = lexer.next();
        int i = checkIntegerLiteral(next);
        if (i != 1 && i != 2 && i != 3) {
          semanticError(next, "SPACE must be 1, 2 or 3.");
        }
        nodeChildren.add(next);
        nodeChildren.add(one(")"));
        children.add(new CblNode(nodeChildren, SPACE));
      } else if (isNext("NATLANG")) {
        nodeChildren.add(one("NATLANG"));
        nodeChildren.add(one("("));
        nodeChildren.add(or("CS", "EN", "KA"));
        nodeChildren.add(one(")"));
        opt(",").ifPresent(nodeChildren::add);
        children.add(new CblNode(nodeChildren, NATLANG));
      } else {
        try {
          CblToken next =
              or(
                  "APOST",
                  "QUOTE",
                  "CBLCARD",
                  "NOCBLCARD",
                  "COBOL2",
                  "COBOL3",
                  "CICS",
                  "CPSM",
                  "NOCPSM",
                  "DBCS",
                  "DEBUG",
                  "NODEBUG",
                  "DLI",
                  "EDF",
                  "NOEDF",
                  "EXCI",
                  "FEPI",
                  "NOFEPI",
                  "LENGTH",
                  "NOLENGTH",
                  "LINKAGE",
                  "NOLINKAGE",
                  "NUM",
                  "NONUM",
                  "OPTIONS",
                  "NOOPTIONS",
                  "SEQ",
                  "NOSEQ",
                  "SP",
                  "SPIE",
                  "NOSPIE",
                  "SYSEIB",
                  "VBREF",
                  "NOVBREF");
          nodeChildren.add(next);
          opt(",").ifPresent(nodeChildren::add);
          children.add(new CblNode(nodeChildren, valueOf(next.getText())));
        } catch (CblDiagnosticException e) {
          if (force) {
            throw e;
          } else {
            nodeChildren.add(e.getToken());
            nodeChildren.addAll(parseOption().getChildren());
            children.add(new CblNode(nodeChildren, UNKNOWN));
          }
        }
      }
    }
    if (inApostrophes) {
      children.add(one("'"));
    }
    children.add(one(")"));
    opt(",").ifPresent(children::add);
  }

  private void semanticError(CblToken next, String message) {
    diagnostics.add(new CblDiagnosticException(next, WARNING, message).toSyntaxError());
  }

  private boolean isLineNumberWrong(int nnn) {
    // nnn must be an integer between 10 and 255, or 0.
    if (nnn == 0) {
      return false;
    }
    if (nnn < 10) {
      return true;
    }
    return nnn > 255;
  }

  private int checkIntegerLiteral(CblToken next) throws CblDiagnosticException {
    try {
      return Integer.parseInt(next.getText());
    } catch (NumberFormatException e) {
      throw CblDiagnosticException.expect(next, "integer");
    }
  }

  private CblNode parseOpts() throws CblDiagnosticException {
    return parseOption();
  }

  private CblNode parseOption() {
    List<CblNode> children = new ArrayList<>();
    int depth = 0;
    while (lexer.hasMore()) {
      if (depth == 0 && (isNext(")") || isNext(","))) {
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
    return lexer.hasMore() && lexer.peek().getText().equalsIgnoreCase(expected);
  }

  private CblToken or(String... variants) throws CblDiagnosticException {
    CblToken token = lexer.next();
    for (String text : variants) {
      if (text.equalsIgnoreCase(token.getText())) {
        return token;
      }
    }
    throw CblDiagnosticException.expect(token, variants);
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
