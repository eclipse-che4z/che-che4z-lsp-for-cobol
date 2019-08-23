/*
 * Copyright (c) 2019 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.parser.listener;

import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.model.Position;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

public class VerboseListener extends BaseErrorListener {
  private List<SyntaxError> errorspipe;

  public VerboseListener(List<SyntaxError> errors) {
    errorspipe = errors;
  }

  @Override
  public void syntaxError(
      Recognizer<?, ?> recognizer,
      Object offendingSymbol,
      int line,
      int charPositionInLine,
      String msg,
      RecognitionException e) {
    List<String> stack = new ArrayList<>();
    if (recognizer instanceof Parser) {
      stack = ((Parser) recognizer).getRuleInvocationStack();
      Collections.reverse(stack);
      CommonToken wrongToken = (CommonToken) offendingSymbol;
      Position position =
          new Position(
              wrongToken.getTokenIndex(),
              wrongToken.getStartIndex(),
              wrongToken.getStopIndex(),
              wrongToken.getLine(),
              wrongToken.getCharPositionInLine());
      errorspipe.add(
          SyntaxError.syntaxerror()
              .position(position)
              .ruleStack(stack)
              .suggestion(msg)
              .type(wrongToken.getType())
              .severity(1)
              .build());
    }
    if (recognizer instanceof Lexer) {
      stack.add(((Lexer) recognizer).getText());
      Position position =
          new Position(
              charPositionInLine, charPositionInLine, charPositionInLine, line, charPositionInLine);
      errorspipe.add(
          SyntaxError.syntaxerror()
              .position(position)
              .ruleStack(stack)
              .suggestion(msg.concat(" on ").concat(stack.get(stack.size() - 1)))
              .type(0)
              .severity(1)
              .build());
    }
  }
}
