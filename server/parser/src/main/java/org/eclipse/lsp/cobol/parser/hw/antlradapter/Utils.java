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
package org.eclipse.lsp.cobol.parser.hw.antlradapter;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.Interval;
import org.antlr.v4.runtime.misc.Pair;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.TerminalNodeImpl;
import org.eclipse.lsp.cobol.cst.base.CstNode;
import org.eclipse.lsp.cobol.parser.hw.lexer.Token;
import org.eclipse.lsp.cobol.parser.hw.lexer.TokenType;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.antlr.v4.runtime.Token.HIDDEN_CHANNEL;

/** Token related utilities. */
public class Utils {
  /**
   * Transform cst token into antlr one.
   *
   * @param token cst token node.
   * @param charStream the stream of program characters.
   * @return antlr token.
   */
  public static CommonToken toAntlrToken(Token token, CharStream charStream) {
    Pair<TokenSource, CharStream> source = new Pair<>(null, charStream);
    int channel = 0;
    int type = 0;
    switch (token.getType()) {
      case EOF:
        type = IntStream.EOF;
      case NEW_LINE:
      case WHITESPACE:
        channel = HIDDEN_CHANNEL;
        break;
      default:
        break;
    }
    CommonToken commonToken =
        new CommonToken(source, type, channel, token.getIndexStart(), token.getIndexStop() - 1);
    commonToken.setLine(token.getLine() + 1);
    commonToken.setCharPositionInLine(token.getStartPositionInLine());
    commonToken.setText(token.toText());
    return commonToken;
  }

  /**
   * Find the first token in CST.
   *
   * @param cstNode a CST node.
   * @param ignoreWhitespaces set to true if you want to ignore whitespace tokens
   * @return Optionally token.
   */
  public static Optional<Token> findStartToken(CstNode cstNode, boolean ignoreWhitespaces) {
    if (cstNode.getChildren().isEmpty()) {
      return Optional.of((Token) cstNode);
    }
    return firstToken(cstNode.getChildren(), ignoreWhitespaces);
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
    return firstToken(cstNode.getChildren(), false);
  }

  /**
   * Initialize antlr node by CST node.
   *
   * @param cstNode the CST node.
   * @param node tha ANTLR node to set up.
   * @param charStream the stream of program characters.
   * @param <T> the type of ANTLR node
   * @return node reference.
   */
  public static <T extends ParserRuleContext> T initNode(
      CstNode cstNode, T node, CharStream charStream) {
    node.start = findStartToken(cstNode).map(token -> toAntlrToken(token, charStream)).orElse(null);
    node.stop =
        findStopToken(cstNode, true).map(token -> toAntlrToken(token, charStream)).orElse(null);
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
   * @param cstNodes a CST node list.
   * @param ignoreWhitespaces set to true if you want to ignore whitespace tokens
   * @return Optionally token.
   */
  public static Optional<Token> findStopToken(List<CstNode> cstNodes, boolean ignoreWhitespaces) {
    for (int i = cstNodes.size() - 1; i >= 0; i--) {
      CstNode cstNode = cstNodes.get(i);
      if (cstNode instanceof Token) {
        TokenType type = ((Token) cstNode).getType();
        if ((type != TokenType.WHITESPACE
                && type != TokenType.NEW_LINE)
                || !ignoreWhitespaces) {
          return Optional.of((Token) cstNode);
        }
      } else {
        Optional<Token> result = lastToken(cstNode.getChildren(), ignoreWhitespaces);
        if (result.isPresent()) {
          return result;
        }
      }
    }
    return Optional.empty();
  }

  /**
   * Find the last token in CST.
   *
   * @param cstNode a CST node.
   * @param ignoreWhitespaces set to true if you want to ignore whitespace tokens
   * @return Optionally token.
   */
  public static Optional<Token> findStopToken(CstNode cstNode, boolean ignoreWhitespaces) {
    if (cstNode.getChildren().isEmpty()) {
      return Optional.of((Token) cstNode);
    }
    return lastToken(cstNode.getChildren(), ignoreWhitespaces);
  }

  private static Optional<Token> firstToken(List<CstNode> cstNodes, boolean ignoreWhitespaces) {
    for (CstNode cstNode : cstNodes) {
      if (cstNode instanceof Token) {
        TokenType type = ((Token) cstNode).getType();
        if (ignoreWhitespaces && (type == TokenType.WHITESPACE || type == TokenType.NEW_LINE)) {
          continue;
        }
        return Optional.of((Token) cstNode);
      } else if (cstNode instanceof AntlrAdapted) {
        return Optional.of((Token) cstNode.getChildren().get(0));
      } else {
        return firstToken(cstNode.getChildren(), ignoreWhitespaces);
      }
    }
    return Optional.empty();
  }

  /**
   * Find the last token in CST.
   *
   * @param cstNodes a list of nodes to check (ignore whitespaces)
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
        TokenType type = ((Token) n).getType();
        if (type != TokenType.WHITESPACE && type != TokenType.NEW_LINE) {
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

  static String generatePrefix(CharStream charStream, Token startToken) {
    String prefix = charStream.getText(Interval.of(0, startToken.getIndexStart() - 1));
    char[] chars = prefix.toCharArray();
    for (int i = 0; i < chars.length; i++) {
      chars[i] = chars[i] != '\n' ? ' ' : '\n';
    }
    return new String(chars);
  }

  /**
   * Remove EOF token if eny
   *
   * @param parent a node to find a EOF token.
   */
  static void removeEofNode(ParserRuleContext parent) {
    if (parent.children == null) {
      return;
    }
    ParseTree lastChild = parent.children.get(parent.children.size() - 1);
    if (lastChild instanceof TerminalNodeImpl
        && ((TerminalNodeImpl) lastChild).getSymbol().getType() == org.antlr.v4.runtime.Token.EOF) {
      parent.removeLastChild();
    }
  }
}
