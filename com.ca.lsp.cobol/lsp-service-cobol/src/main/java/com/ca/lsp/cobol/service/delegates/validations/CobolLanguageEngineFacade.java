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
package com.ca.lsp.cobol.service.delegates.validations;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;

import com.ca.lsp.core.cobol.LanguageEngineFactory;
import com.ca.lsp.core.cobol.engine.CobolLanguageEngine;
import com.ca.lsp.core.cobol.parser.error.SyntaxError;

public class CobolLanguageEngineFacade implements LanguageEngineFacade {
  private static final Logger LOG = LogManager.getLogger(CobolLanguageEngineFacade.class);
  private static final int FIRST_LINE_SEQ_AND_EXTRA_OP = 8;

  // Access should be package-private
  CobolLanguageEngineFacade() {}

  @Override
  public List<Diagnostic> performValidation(String text) {
    List<SyntaxError> errors = new ArrayList<>();
    CobolLanguageEngine cle = LanguageEngineFactory.fixedFormatCobolLanguageEngine();

    if (text.length() > FIRST_LINE_SEQ_AND_EXTRA_OP) {
      errors = cle.check(text);
    }
    return convertErrors(errors);
  }

  private static List<Diagnostic> convertErrors(List<SyntaxError> errors) {
    return errors
        .stream()
        .peek(e -> LOG.info(e.toString()))
        .map(toDiagnostic())
        .collect(Collectors.toList());
  }

  private static Function<? super SyntaxError, ? extends Diagnostic> toDiagnostic() {
    return err -> {
      Diagnostic diagnostic = new Diagnostic();
      diagnostic.setSeverity(checkSeverity(err.getSeverity()));
      diagnostic.setMessage(err.getSuggestion());
      diagnostic.setRange(createRange(err));
      return diagnostic;
    };
  }

  private static Range createRange(SyntaxError err) {
    return new Range(
        new Position((err.getPosition().getLine() - 1), err.getPosition().getCharPositionInLine()),
        new Position(
            (err.getPosition().getLine() - 1),
            ((err.getPosition().getStopPosition() - err.getPosition().getStartPosition())
                + err.getPosition().getCharPositionInLine()
                + 1)));
  }

  private static DiagnosticSeverity checkSeverity(int severity) {
    return DiagnosticSeverity.forValue(severity);
  }
}
