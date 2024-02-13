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
package org.eclipse.lsp.cobol.core.hw.antlradapter;

import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.ParserRuleContext;
import org.eclipse.lsp.cobol.core.cst.base.CstNode;
import org.eclipse.lsp.cobol.core.hw.Token;
import org.eclipse.lsp.cobol.core.hw.TokenType;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.antlr.v4.runtime.Token.HIDDEN_CHANNEL;

/**
 * Token related utilities.
 */
public class Utils {
  /**
   * Transform cst token into antlr one.
   *
   * @param token cst token node.
   * @return antlr token.
   */
  public static CommonToken toAntlrToken(Token token) {
    CommonToken commonToken = new CommonToken(0, token.toText());
    commonToken.setLine(token.getLine() + 1);
    commonToken.setCharPositionInLine(token.getStartPositionInLine());
    commonToken.setStartIndex(token.getIndex());
    commonToken.setStopIndex(token.getIndex() + token.getLexeme().length());
    if (token.getType() == TokenType.WHITESPACE || token.getType() == TokenType.NEW_LINE) {
      commonToken.setChannel(HIDDEN_CHANNEL);
    }
    return commonToken;
  }

  /**
   * Find the first token in CST.
   * @param cstNode a CST node.
   * @return Optionally token.
   */
  public static Optional<Token> findStartToken(CstNode cstNode) {
    return firstToken(cstNode.getChildren());
  }

  /**
   * Initialize antlr node by CST node.
   * @param cstNode the CST node.
   * @param node tha ANTLR node to setup.
   */
  public static void initNode(CstNode cstNode, ParserRuleContext node) {
    node.start = findStartToken(cstNode).map(Utils::toAntlrToken).orElse(null);
    node.stop = findStopToken(cstNode).map(Utils::toAntlrToken).orElse(null);
    node.children = new ArrayList<>();
  }

  /**
   * Find the first token in CST.
   * @param cstNode a CST node.
   * @return Optionally token.
   */
  public static Optional<Token> findStopToken(CstNode cstNode) {
    return lastToken(cstNode.getChildren());
  }

  private static Optional<Token> firstToken(List<CstNode> cstNodes) {
    CstNode cstNode = cstNodes.get(0);
    if (cstNode instanceof Token) {
      return Optional.of((Token) cstNode);
    } else {
      return firstToken(cstNode.getChildren());
    }
  }

  private static Optional<Token> lastToken(List<CstNode> cstNodes) {
    CstNode cstNode = cstNodes.get(cstNodes.size() - 1);
    if (cstNode instanceof Token) {
      return Optional.of((Token) cstNode);
    } else {
      return lastToken(cstNode.getChildren());
    }
  }
}
