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

import com.broadcom.lsp.domain.cobol.model.Position;
import com.ca.lsp.core.cobol.engine.CobolLanguageEngine;
import com.ca.lsp.core.cobol.model.ProcessingResult;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.semantics.SubContext;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;

import javax.annotation.Nonnull;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Slf4j
@Singleton
public class CobolLanguageEngineFacade implements LanguageEngineFacade {
  private static final int FIRST_LINE_SEQ_AND_EXTRA_OP = 8;
  private static final String COBOL_LANG_SUPPORT_LABEL = "COBOL Language Support";
  private static final String ERROR_SRC_LABEL = "E";
  private static final String WARNING_SRC_LABEL = "W";
  private static final String INFO_SRC_LABEL = "I";
  private static final String HINT_SRC_LABEL = "H";
  private static final int ERR_POS_INDEX = 1;

  private CobolLanguageEngine engine;

  @Inject
  CobolLanguageEngineFacade(CobolLanguageEngine engine) {
    this.engine = engine;
  }

  @Override
  public AnalysisResult analyze(String text) {
    if (isEmpty(text)) {
      return AnalysisResult.empty();
    }
    return toAnalysisResult(engine.run(text));
  }

  private static boolean isEmpty(String text) {
    return text.length() <= FIRST_LINE_SEQ_AND_EXTRA_OP;
  }

  private static List<Diagnostic> convertErrors(List<SyntaxError> errors) {
    return errors.stream()
        .peek(e -> log.info(e.toString()))
        .filter(errorOnlyFromCurrentDocument())
        .map(toDiagnostic())
        .collect(Collectors.toList());
  }

  @Nonnull
  private static Predicate<SyntaxError> errorOnlyFromCurrentDocument() {
    return syntaxError -> syntaxError.getPosition().getDocumentURI() == null;
  }

  private static Function<? super SyntaxError, ? extends Diagnostic> toDiagnostic() {
    return err -> {
      Diagnostic diagnostic = new Diagnostic();
      diagnostic.setSeverity(checkSeverity(err.getSeverity()));
      diagnostic.setMessage(err.getSuggestion());
      diagnostic.setSource(setupSourceInfo(err.getSeverity()));
      diagnostic.setMessage(err.getSuggestion());
      diagnostic.setRange(convertRange(err.getPosition()));
      return diagnostic;
    };
  }

  private static String setupSourceInfo(int severity) {
    // if there is a syntax error source parameter will be SYNTAX_ERROR otherwise SEMANTIC_ERROR
    switch (severity) {
      case 1:
        return COBOL_LANG_SUPPORT_LABEL + " - " + ERROR_SRC_LABEL;
      case 2:
        return COBOL_LANG_SUPPORT_LABEL + " - " + WARNING_SRC_LABEL;
      case 3:
        return COBOL_LANG_SUPPORT_LABEL + " - " + INFO_SRC_LABEL;
      case 4:
        return COBOL_LANG_SUPPORT_LABEL + " - " + HINT_SRC_LABEL;
      default:
        return COBOL_LANG_SUPPORT_LABEL;
    }
  }

  private static DiagnosticSeverity checkSeverity(int severity) {
    return DiagnosticSeverity.forValue(severity);
  }

  private static Range convertRange(Position position) {
    int positionLine = position.getLine() - ERR_POS_INDEX;
    int cPosInLn = position.getCharPositionInLine();

    return new Range(
        new org.eclipse.lsp4j.Position(positionLine, cPosInLn),
        new org.eclipse.lsp4j.Position(
            positionLine,
            ((position.getStopPosition() - position.getStartPosition())
                + cPosInLn
                + ERR_POS_INDEX)));
  }

  private AnalysisResult toAnalysisResult(ProcessingResult result) {
    return new AnalysisResult(
        convertErrors(result.getErrors()),
        retrieveDefinitions(result.getSemanticContext().getVariables()),
        retrieveUsages(result.getSemanticContext().getVariables()),
        retrieveDefinitions(result.getSemanticContext().getParagraphs()),
        retrieveUsages(result.getSemanticContext().getParagraphs()));
  }

  private Map<String, List<Location>> retrieveDefinitions(SubContext<?> context) {
    return retrieveMap(context.getDefinitions().asMap());
  }

  private Map<String, List<Location>> retrieveUsages(SubContext<?> context) {
    return retrieveMap(context.getUsages().asMap());
  }

  private Map<String, List<Location>> retrieveMap(Map<String, Collection<Position>> map) {
    return map.entrySet().stream()
        .collect(
            Collectors.toMap(
                Map.Entry::getKey,
                entry ->
                    entry.getValue().stream()
                        .map(
                            position ->
                                new Location(position.getDocumentURI(), convertRange(position)))
                        .collect(Collectors.toList())));
  }
}
