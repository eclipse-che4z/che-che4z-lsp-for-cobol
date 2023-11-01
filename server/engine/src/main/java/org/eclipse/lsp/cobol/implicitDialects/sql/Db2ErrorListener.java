/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.implicitDialects.sql;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Error Listener
 */
@Slf4j
public class Db2ErrorListener extends BaseErrorListener {
  private final String uri;

  @Getter private final List<SyntaxError> errors = new ArrayList<>();

  Db2ErrorListener(String uri) {
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

    int offendingSymbolSize =
        offendingSymbol instanceof String
            ? getOffendingSymbolSize((String) offendingSymbol)
            : getOffendingSymbolSize(offendingSymbol);
    int offendingSymbolRelativeLine =
        offendingSymbol instanceof String
            ? ((String) offendingSymbol).split("\\r?\\n").length - 1
            : 0;

    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(
                Locality.builder()
                    .uri(uri)
                    .range(
                        new Range(
                            new Position(line - 1, charPositionInLine),
                            new Position(
                                line - 1 + offendingSymbolRelativeLine,
                                offendingSymbolRelativeLine == 0
                                    ? charPositionInLine + offendingSymbolSize
                                    : offendingSymbolSize - 1)))
                    .build()
                    .toOriginalLocation())
            .suggestion(msg)
            .severity(ErrorSeverity.ERROR)
            .build();
    LOG.debug("Syntax error by ParserListener " + error.toString());
    errors.add(error);
  }

  private int getOffendingSymbolSize(Object offendingSymbol) {
    return Optional.ofNullable(offendingSymbol)
        .filter(t -> t instanceof CommonToken)
        .map(CommonToken.class::cast)
        .map(token -> token.getStopIndex() - token.getStartIndex() + 1)
        .orElse(0);
  }

  private int getOffendingSymbolSize(String offendingSymbol) {
    String[] split = offendingSymbol.split("\\r?\\n");
    if (split.length == 1) return offendingSymbol.length();
    return split[split.length - 1].length();
  }
}
