/*
 * Copyright (c) 2020 Broadcom.
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

import com.broadcom.lsp.domain.common.model.Position;
import com.ca.lsp.core.cobol.model.SyntaxError;
import org.antlr.v4.runtime.*;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class VerboseListener extends BaseErrorListener {
  private final List<SyntaxError> errorspipe;
  private final String documentUri;

  public VerboseListener(List<SyntaxError> errors, String documentUri) {
    errorspipe = errors;
    this.documentUri = documentUri;
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
              documentUri,
              wrongToken.getStartIndex(),
              wrongToken.getStopIndex(),
              wrongToken.getLine(),
              wrongToken.getCharPositionInLine());
      errorspipe.add(
          SyntaxError.syntaxError()
              .position(position)
              .ruleStack(stack)
              .suggestion(msg)
              .severity(1)
              .build());
    }
    if (recognizer instanceof Lexer) {
      stack.add(((Lexer) recognizer).getText());
      Position position =
          new Position(
              documentUri, charPositionInLine, charPositionInLine, line, charPositionInLine);
      errorspipe.add(
          SyntaxError.syntaxError()
              .position(position)
              .ruleStack(stack)
              .suggestion(msg.concat(" on ").concat(stack.get(stack.size() - 1)))
              .severity(1)
              .build());
    }
  }
}
