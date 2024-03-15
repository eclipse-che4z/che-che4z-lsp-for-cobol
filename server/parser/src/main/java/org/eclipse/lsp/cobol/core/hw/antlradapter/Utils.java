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

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.TokenSource;
import org.antlr.v4.runtime.misc.Pair;
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
   * @param token      cst token node.
   * @param charStream the stream of program characters.
   * @return antlr token.
   */
  public static CommonToken toAntlrToken(Token token, CharStream charStream) {
//    , int type, int channel, int start, int stop
    Pair<TokenSource, CharStream> source = new Pair<>(null, charStream);
    int channel = token.getType() == TokenType.WHITESPACE || token.getType() == TokenType.NEW_LINE ? HIDDEN_CHANNEL : 0;
    CommonToken commonToken = new CommonToken(source, 0, channel, token.getIndex(), token.getIndex() + token.getLexeme().length() - 1);
    commonToken.setLine(token.getLine() + 1);
    commonToken.setCharPositionInLine(token.getStartPositionInLine());
    commonToken.setText(token.toText());
    return commonToken;
  }

  /**
   * Find the first token in CST.
   *
   * @param cstNode a CST node.
   * @return Optionally token.
   */
  public static Optional<Token> findStartToken(CstNode cstNode) {
    if (cstNode.getChildren().isEmpty()) {
      return Optional.of((Token) cstNode);
    }
    return firstToken(cstNode.getChildren());
  }

  /**
   * Initialize antlr node by CST node.
   *
   * @param cstNode    the CST node.
   * @param node       tha ANTLR node to set up.
   * @param charStream the stream of program characters.
   * @param <T>        the type of ANTLR node
   * @return node reference.
   */
  public static <T extends ParserRuleContext> T initNode(CstNode cstNode, T node, CharStream charStream) {
    node.start = findStartToken(cstNode).map(token -> toAntlrToken(token, charStream)).orElse(null);
    node.stop = findStopToken(cstNode, true).map(token -> toAntlrToken(token, charStream)).orElse(null);
    node.children = new ArrayList<>();
    return node;
  }

  /**
   * Find the last token in CST.
   *
   * @param cstNode a CST node.
   * @return Optionally token.
   */
  public static Optional<Token> findStopToken(CstNode cstNode) {
    if (cstNode.getChildren().isEmpty()) {
      return Optional.of((Token) cstNode);
    }
    return lastToken(cstNode.getChildren(), false);
  }

  /**
   * Find the last token in CST.
   *
   * @param cstNodes          a CST node list.
   * @param ignoreWhitespaces set to true if you want to ignore whitespace tokens
   * @return Optionally token.
   */
  public static Optional<Token> findStopToken(List<CstNode> cstNodes, boolean ignoreWhitespaces) {
    for (int i = cstNodes.size() - 1; i >= 0; i--) {
      CstNode cstNode = cstNodes.get(i);
      if (cstNode instanceof Token) {
        if (((Token)cstNode).getType() != TokenType.WHITESPACE) {
          return Optional.of((Token) cstNode);
        }
      } else {
        Optional<Token> result = lastToken(cstNode.getChildren(), ignoreWhitespaces);
        if(result.isPresent()) {
          return result;
        }
      }
    }
    return Optional.empty();
  }

  /**
   * Find the last token in CST.
   *
   * @param cstNode           a CST node.
   * @param ignoreWhitespaces set to true if you want to ignore whitespace tokens
   * @return Optionally token.
   */
  public static Optional<Token> findStopToken(CstNode cstNode, boolean ignoreWhitespaces) {
    if (cstNode.getChildren().isEmpty()) {
      return Optional.of((Token) cstNode);
    }
    return lastToken(cstNode.getChildren(), ignoreWhitespaces);
  }

  private static Optional<Token> firstToken(List<CstNode> cstNodes) {
    CstNode cstNode = cstNodes.get(0);
    if (cstNode instanceof Token) {
      return Optional.of((Token) cstNode);
    } else {
      return firstToken(cstNode.getChildren());
    }
  }

  /**
   * Find the last token in CST.
   *
   * @param cstNodes          a list of nodes to check (ignore whitespaces)
   * @param ignoreWhitespaces set to true if you want to ignore whitespace tokens
   * @return possible the end node.
   */
  public static Optional<Token> lastToken(List<CstNode> cstNodes, boolean ignoreWhitespaces) {
    int i = 1;
    if (ignoreWhitespaces) {
      while (i < cstNodes.size()) {
        CstNode n = cstNodes.get(cstNodes.size() - i);
        if (!(n instanceof Token)) {
          break;
        }
        if (((Token) n).getType() != TokenType.WHITESPACE) {
          break;
        }
        i++;
      }
    }

    CstNode cstNode = cstNodes.get(cstNodes.size() - i);
    if (cstNode instanceof Token) {
      return Optional.of((Token) cstNode);
    } else {
      return lastToken(cstNode.getChildren(), ignoreWhitespaces);
    }
  }
}
