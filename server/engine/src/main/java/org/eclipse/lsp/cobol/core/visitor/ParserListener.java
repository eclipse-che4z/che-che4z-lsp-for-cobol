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
package org.eclipse.lsp.cobol.core.visitor;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.CommonToken;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import org.eclipse.lsp.cobol.common.error.ErrorSeverity;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.common.model.Locality;
import org.eclipse.lsp.cobol.core.WarningRecognitionException;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

/** This error listener registers syntax errors found by the COBOL parser. */
@Slf4j
@RequiredArgsConstructor
public class ParserListener extends BaseErrorListener {

  private final ExtendedDocument extendedDocument;
  private final CopybooksRepository copybooksRepository;
  @Getter private final List<SyntaxError> errors = new ArrayList<>();

  @Override
  public void syntaxError(
      Recognizer<?, ?> recognizer,
      Object offendingSymbol,
      int line,
      int charPositionInLine,
      String msg,
      RecognitionException e) {

    Range range = new Range(
        new Position(line - 1, charPositionInLine), new Position(line - 1,
        charPositionInLine + getOffendingSymbolSize(offendingSymbol)));

    if ("token recognition error at: '\\n'".equals(msg)) {
      return;
    }

    Location location = extendedDocument.mapLocation(range);
    SyntaxError error =
        SyntaxError.syntaxError()
            .errorSource(ErrorSource.PARSING)
            .location(
                Locality.builder()
                    .uri(location.getUri())
                    .range(location.getRange())
                    .copybookId(copybooksRepository.getCopybookIdByUri(location.getUri()))
                    .build().toOriginalLocation())
            .suggestion(msg)
            .severity(getErrorSeverity(e))
            .build();
    LOG.debug("Syntax error by ParserListener " + error.toString());
    errors.add(error);
  }

  private static ErrorSeverity getErrorSeverity(RecognitionException e) {
    ErrorSeverity severity = ErrorSeverity.ERROR;
    if (e instanceof WarningRecognitionException) {
      severity = ErrorSeverity.WARNING;
    }
    return severity;
  }

  private int getOffendingSymbolSize(Object offendingSymbol) {
    return Optional.ofNullable(offendingSymbol)
        .filter(t -> t instanceof CommonToken)
        .map(CommonToken.class::cast)
        .map(token -> token.getStopIndex() - token.getStartIndex() + 1)
        .orElse(0);
  }
}
