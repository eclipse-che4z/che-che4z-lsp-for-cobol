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
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.visitor;

import com.ca.lsp.core.cobol.model.SyntaxError;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

import java.util.ArrayList;
import java.util.List;

import static com.ca.lsp.core.cobol.model.ErrorSeverity.ERROR;

/** This error listener registers syntax errors found by the COBOL parser. */
@Slf4j
public class ParserListener extends BaseErrorListener {

  @Getter private List<SyntaxError> errors = new ArrayList<>();

  @Override
  public void syntaxError(
      Recognizer<?, ?> recognizer,
      Object offendingSymbol,
      int line,
      int charPositionInLine,
      String msg,
      RecognitionException e) {

    SyntaxError error =
        SyntaxError.syntaxError()
            .offendedToken((CommonToken) offendingSymbol)
            .suggestion(msg)
            .severity(ERROR)
            .build();
    LOG.debug("Syntax error by CobolParser: " + error.toString());
    errors.add(error);
  }
}
