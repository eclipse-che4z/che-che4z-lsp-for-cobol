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

import com.ca.lsp.cobol.service.CobolWorkspaceServiceImpl;
import com.ca.lsp.core.cobol.LanguageEngineFactory;
import com.ca.lsp.core.cobol.engine.CobolLanguageEngine;
import com.ca.lsp.core.cobol.model.Position;
import com.ca.lsp.core.cobol.model.ProcessingResult;
import com.ca.lsp.core.cobol.model.SyntaxError;
import com.ca.lsp.core.cobol.semantics.SubContext;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.stream.Collectors;

@Slf4j
public class CobolLanguageEngineFacade implements LanguageEngineFacade {
  private static final int FIRST_LINE_SEQ_AND_EXTRA_OP = 8;
  private static final String COBOL_LANG_SUPPORT_LABEL = "COBOL Language Support";
  private static final String ERROR_SRC_LABEL = "E";
  private static final String WARNING_SRC_LABEL = "W";
  private static final String INFO_SRC_LABEL = "I";
  private static final String HINT_SRC_LABEL = "H";

  // Access should be package-private
  CobolLanguageEngineFacade() {}

  private static Range convertRange(Position position) {
    return new Range(
        new org.eclipse.lsp4j.Position((position.getLine() - 1), position.getCharPositionInLine()),
        new org.eclipse.lsp4j.Position(
            (position.getLine() - 1),
            ((position.getStopPosition() - position.getStartPosition())
                + position.getCharPositionInLine()
                + 1)));
  }

  private static boolean isEmpty(String text) {
    return text.length() <= FIRST_LINE_SEQ_AND_EXTRA_OP;
  }

  private static List<Diagnostic> convertErrors(List<SyntaxError> errors) {
    return errors.stream()
        .peek(e -> log.info(e.toString()))
        .map(toDiagnostic())
        .collect(Collectors.toList());
  }

  private static Function<? super SyntaxError, ? extends Diagnostic> toDiagnostic() {
    return err -> {
      Diagnostic diagnostic = new Diagnostic();
      diagnostic.setSeverity(checkSeverity(err.getSeverity()));
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

  @Override
  public AnalysisResult analyze(String text) {
    if (isEmpty(text)) {
      return AnalysisResult.empty();
    }

    CobolLanguageEngine engine = LanguageEngineFactory.fixedFormatCobolLanguageEngine();
    engine.setCopybookList(CobolWorkspaceServiceImpl.getInstance().getCopybookList());
      return toAnalysisResult(engine.run(text));
  }
    private AnalysisResult toAnalysisResult(ProcessingResult result) {
        return new AnalysisResult(
                convertErrors(result.getErrors()),
                retrieveDefinitions(result.getSemanticContext().getVariables()),
                retrieveUsages(result.getSemanticContext().getVariables()),
                retrieveDefinitions(result.getSemanticContext().getParagraphs()),
                retrieveUsages(result.getSemanticContext().getParagraphs()));
    }


  private Map<String, List<Range>> retrieveDefinitions(SubContext<?> context) {
    return retrieveMap(context.getDefinitions().asMap());
  }

  private Map<String, List<Range>> retrieveUsages(SubContext<?> context) {
    return retrieveMap(context.getUsages().asMap());
  }

  private Map<String, List<Range>> retrieveMap(Map<String, Collection<Position>> map) {
    return map.entrySet().stream()
        .collect(
            Collectors.toMap(
                Entry::getKey,
                entry ->
                    entry.getValue().stream()
                        .map(CobolLanguageEngineFacade::convertRange)
                        .collect(Collectors.toList())));
  }
}
