/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.core.engine.dialects;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ErrorSource;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;

/** This error listener registers syntax errors found by dialect parser. */
@Slf4j
public class DialectParserListener extends BaseErrorListener {
  private final String uri;

  @Getter private final List<SyntaxError> errors = new ArrayList<>();

  public DialectParserListener(String uri) {
    this.uri = uri;
  }

  @Override
  public void syntaxError(
      Recognizer<?, ?> recognizer,
      Object offendingSymbol,
      int line,
      int charPositionInLine,
      String msg,
      RecognitionException e) {
    int errorLine = line - 1;
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.DIALECT)
            .offendedToken((CommonToken) offendingSymbol)
            .suggestion(msg)
            .locality(
                Locality.builder()
                    .uri(uri)
                    .range(
                        new Range(
                            new Position(errorLine, charPositionInLine),
                            new Position(
                                errorLine,
                                charPositionInLine + getOffendingSymbolSize(offendingSymbol))))
                    .build())
            .severity(ErrorSeverity.ERROR)
            .build();
    LOG.debug("Syntax error by DialectParserListener " + error.toString());
    errors.add(error);
  }

  private int getOffendingSymbolSize(Object offendingSymbol) {
    CommonToken token = (CommonToken) offendingSymbol;
    return token.getStopIndex() - token.getStartIndex() + 1;
  }
}
