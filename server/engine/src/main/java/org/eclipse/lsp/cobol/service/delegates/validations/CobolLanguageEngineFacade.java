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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.service.AnalysisConfig;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.function.Function;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.*;
import static org.eclipse.lsp.cobol.core.model.tree.Node.hasType;
import static org.eclipse.lsp.cobol.core.model.tree.NodeType.COPY;

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
   * @param analysisConfig contains analysis processing features info and copybook config with
   *     following information: target backend sql server, copybook processing mode which reflect
   *     the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return a model containing full analysis result, e.g. errors and semantic elements
   */
  @Override
  public AnalysisResult analyze(String uri, String text, AnalysisConfig analysisConfig) {
    if (isEmpty(text)) {
      return AnalysisResult.builder().build();
    }
    return toAnalysisResult(engine.run(uri, text, analysisConfig), uri);
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

  private AnalysisResult toAnalysisResult(ResultWithErrors<Node> result, String uri) {
    Node rootNode = result.getResult();
    return AnalysisResult.builder()
        .diagnostics(
            collectDiagnosticsForAffectedDocuments(
                convertErrors(result.getErrors()),
                rootNode
                    .getDepthFirstStream()
                    .filter(hasType(COPY))
                    .map(CopyNode.class::cast)
                    .map(CopyNode::getDefinitions)
                    .flatMap(Collection::stream)
                    .map(Location::getUri)
                    .filter(it -> !ImplicitCodeUtils.isImplicit(it))
                    .collect(toList()),
                uri))
        .rootNode(rootNode)
        .build();
  }

  /**
   * Collect diagnostics for each document, used in the analysis - the main COBOL file and all the
   * copybooks. If there were no errors for some URI, then provide an empty list to clean-up the
   * errors after the previous analysis.
   *
   * @param diagnostics - list of found syntax and semantic errors
   * @param copybookUris - URIs of copybook definitions used in this analysis
   * @param uri - current document URI
   * @return map with file URI as a key, and lists of diagnostics as values
   */
  private Map<String, List<Diagnostic>> collectDiagnosticsForAffectedDocuments(
      Map<String, List<Diagnostic>> diagnostics, List<String> copybookUris, String uri) {
    Map<String, List<Diagnostic>> result = new HashMap<>(diagnostics);
    copybookUris.forEach(it -> result.putIfAbsent(it, emptyList()));
    result.putIfAbsent(uri, emptyList());
    return result;
  }

  private static Map<String, List<Diagnostic>> convertErrors(List<SyntaxError> errors) {
    return errors.stream()
        .filter(e -> Objects.nonNull(e.getLocality()))
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
}
