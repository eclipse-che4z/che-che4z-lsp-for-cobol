/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.core.model.tree;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.ToString;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.visitor.CICSVisitor;
import org.eclipse.lsp.cobol.core.visitor.Db2SqlVisitor;

import java.util.List;
import java.util.Map;

import static org.eclipse.lsp.cobol.core.model.tree.NodeType.EMBEDDED_CODE;

/** This class represents embedded code parts in COBOL program, e.g. EXEC CICS and EXEC SQL */
@Getter
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class EmbeddedCodeNode extends Node {
  TokenStream tokens;
  ParserRuleContext tree;
  Language lang;
  private final SymbolService symbolService;

  public EmbeddedCodeNode(
          Locality location, TokenStream tokens, ParserRuleContext tree, Language lang, SymbolService symbolService) {
    super(location, EMBEDDED_CODE);
    this.tokens = tokens;
    this.tree = tree;
    this.lang = lang;
    this.symbolService = symbolService;
  }

  /**
   * Apply language-specific visitor to the node content and replace it with the actual semantic
   * content of the code part.
   *
   * @param mapping a map with actual token localities
   */
  public void analyzeTree(Map<Token, Locality> mapping) {
    getParent().removeChild(this);
    instanceVisitor(mapping, lang).visit(tree).forEach(getParent()::addChild);
  }

  /**
   * Instance AST visitor for provided language
   * @param positions mapping data
   * @param lang the languate
   * @return a visitor
   */
  public ParseTreeVisitor<List<Node>> instanceVisitor(Map<Token, Locality> positions, Language lang) {
    if (Language.CICS == lang) {
      return new CICSVisitor(positions, symbolService);
    }

    if (Language.SQL == lang) {
      return new Db2SqlVisitor(positions);
    }
    throw new RuntimeException("Unknown language " + lang);
  }

  /** This enum holds all the supported embedded languages that require a separate parsing */
  public enum Language {
    SQL,
    CICS;
  }
}
