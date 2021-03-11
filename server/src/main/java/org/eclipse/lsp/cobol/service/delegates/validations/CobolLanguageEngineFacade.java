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
package org.eclipse.lsp.cobol.service.delegates.validations;

import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp.cobol.core.model.ErrorCode;
import org.eclipse.lsp.cobol.core.model.ErrorSeverity;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.model.SyntaxError;
import org.eclipse.lsp.cobol.core.semantics.SemanticContext;
import org.eclipse.lsp.cobol.service.CopybookProcessingMode;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.function.Function;

import static org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult.empty;
import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.*;

/**
 * This class is a facade that maps the result of the syntax and semantic analysis to a model
 * consumed by the LSP, i.e. convert {@link SyntaxError} to {@link Diagnostic} and adjust semantic
 * context.
 */
@Singleton
public class CobolLanguageEngineFacade implements LanguageEngineFacade {
  private static final int FIRST_LINE_SEQ_AND_EXTRA_OP = 8;

  private final CobolLanguageEngine engine;

  @Inject
  CobolLanguageEngineFacade(CobolLanguageEngine engine) {
    this.engine = engine;
  }

  /**
   * Analyze the document using the COBOL language engine and find syntax/semantic errors,
   * variables, paragraphs etc.
   *
   * @param uri - URI of the processing document to define positions and errors properly
   * @param text of document opened in the client editor
   * @param copybookProcessingMode reflect the copybook processing status of the document (ENABLED,
   *     DISABLED, SKIP)
   * @return a model containing full analysis result, e.g. errors and semantic elements
   */
  @Override
  public AnalysisResult analyze(
      String uri, String text, CopybookProcessingMode copybookProcessingMode) {
    if (isEmpty(text)) {
      return empty();
    }
    return toAnalysisResult(engine.run(uri, text, copybookProcessingMode), uri);
  }

  /**
   * Don't analyze the document if it is empty or contains only sequence area
   *
   * @param text - document to analyze
   * @return true if the document is empty from the engine point of view
   */
  private static boolean isEmpty(String text) {
    return text.length() <= FIRST_LINE_SEQ_AND_EXTRA_OP;
  }

  private AnalysisResult toAnalysisResult(ResultWithErrors<SemanticContext> result, String uri) {
    SemanticContext context = result.getResult();
    return new AnalysisResult(
        collectDiagnosticsForAffectedDocuments(
            convertErrors(result.getErrors()), context.getCopybookDefinitions(), uri),
        convertEntities(context.getVariableDefinitions()),
        convertEntities(context.getVariableUsages()),
        convertEntities(context.getParagraphDefinitions()),
        convertEntities(context.getParagraphUsages()),
        convertEntities(context.getParagraphRanges()),
        convertEntities(context.getSectionDefinitions()),
        convertEntities(context.getSectionUsages()),
        convertEntities(context.getSectionRanges()),
        convertEntities(context.getConstantDefinitions()),
        convertEntities(context.getConstantUsages()),
        convertEntities(context.getCopybookDefinitions()),
        convertEntities(context.getCopybookUsages()),
        convertEntities(context.getSubroutinesDefinitions()),
        convertEntities(context.getSubroutinesUsages()),
        context.getOutlineTree(),
        context.getVariables());
  }

  /**
   * Collect diagnostics for each document, used in the analysis - the main COBOL file and all the
   * copybooks. If there were no errors for some URI, then provide an empty list to clean-up the
   * errors after the previous analysis.
   *
   * @param diagnostics - list of found syntax and semantic errors
   * @param copybookDefinitions - list of copybook definitions used in this analysis
   * @param uri - current document URI
   * @return map with file URI as a key, and lists of diagnostics as values
   */
  private Map<String, List<Diagnostic>> collectDiagnosticsForAffectedDocuments(
      Map<String, List<Diagnostic>> diagnostics,
      Map<String, Collection<Location>> copybookDefinitions,
      String uri) {
    Map<String, List<Diagnostic>> result = new HashMap<>(diagnostics);
    copybookDefinitions.values().stream()
        .flatMap(Collection::stream)
        .map(Location::getUri)
        .forEach(it -> result.putIfAbsent(it, emptyList()));
    result.putIfAbsent(uri, emptyList());
    return result;
  }

  private static Map<String, List<Diagnostic>> convertErrors(List<SyntaxError> errors) {
    return errors.stream()
        .collect(groupingBy(err -> err.getLocality().getUri(), mapping(toDiagnostic(), toList())));
  }

  private static Function<SyntaxError, Diagnostic> toDiagnostic() {
    return err -> {
      Diagnostic diagnostic = new Diagnostic();
      diagnostic.setSeverity(checkSeverity(err.getSeverity()));
      diagnostic.setSource(setupSourceInfo(err.getSeverity()));
      diagnostic.setMessage(err.getSuggestion());
      diagnostic.setRange(err.getLocality().getRange());
      diagnostic.setCode(ofNullable(err.getErrorCode()).map(ErrorCode::name).orElse(null));
      return diagnostic;
    };
  }

  private static String setupSourceInfo(ErrorSeverity severity) {
    return SourceInfoLevels.values()[severity.ordinal()].getText();
  }

  private static DiagnosticSeverity checkSeverity(ErrorSeverity severity) {
    return DiagnosticSeverity.forValue(severity.ordinal() + 1);
  }

  private <T> Map<String, List<T>> convertEntities(Map<String, Collection<T>> source) {
    return source.entrySet().stream()
        .collect(toMap(Map.Entry::getKey, it -> new ArrayList<>(it.getValue())));
  }
}
