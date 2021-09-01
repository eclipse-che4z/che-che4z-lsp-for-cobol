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

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.core.engine.CobolLanguageEngine;
import org.eclipse.lsp.cobol.core.model.*;
import org.eclipse.lsp.cobol.core.model.tree.CodeBlockDefinitionNode;
import org.eclipse.lsp.cobol.core.model.tree.NodeType;
import org.eclipse.lsp.cobol.core.semantics.SemanticContext;
import org.eclipse.lsp.cobol.service.CopybookConfig;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Location;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.*;
import static org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult.empty;

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
   * @param copybookConfig - contains config info like: copybook processing mode, target backend sql
   *     server
   * @return a model containing full analysis result, e.g. errors and semantic elements
   */
  @Override
  public AnalysisResult analyze(String uri, String text, CopybookConfig copybookConfig) {
    if (isEmpty(text)) {
      return empty();
    }
    return toAnalysisResult(engine.run(uri, text, copybookConfig), uri);
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
    final List<CodeBlockDefinitionNode> paragraphNodes =
        collectCodeBlockNodes(context, NodeType.PARAGRAPH);
    final List<CodeBlockDefinitionNode> sectionNodes =
        collectCodeBlockNodes(context, NodeType.PROCEDURE_SECTION);
    return AnalysisResult.builder()
        .diagnostics(
            collectDiagnosticsForAffectedDocuments(
                convertErrors(result.getErrors()), context.getCopybookDefinitions(), uri))
        .variableDefinitions(convertEntities(context.getVariableDefinitions()))
        .variableUsages(convertEntities(context.getVariableUsages()))
        .constantDefinitions(convertEntities(context.getConstants().getDefinitions().asMap()))
        .constantUsages(convertEntities(context.getConstants().getUsages().asMap()))
        .copybookDefinitions(convertEntities(context.getCopybookDefinitions()))
        .copybookUsages(convertEntities(context.getCopybookUsages()))
        .subroutineDefinitions(convertEntities(context.getSubroutinesDefinitions()))
        .subroutineUsages(convertEntities(context.getSubroutinesUsages()))
        .paragraphDefinitions(retrieveDefinitions(paragraphNodes))
        .paragraphUsages(retrieveUsages(paragraphNodes))
        .sectionDefinitions(retrieveDefinitions(sectionNodes))
        .sectionUsages(retrieveUsages(sectionNodes))
        .outlineTree(context.getOutlineTree())
        .variables(context.getVariables())
        .rootNode(context.getRootNode())
        .build();
  }

  private List<CodeBlockDefinitionNode> collectCodeBlockNodes(
          SemanticContext context, NodeType nodeType) {
    return Objects.isNull(context.getRootNode()) ? emptyList() : context
            .getRootNode()
            .getDepthFirstStream()
            .filter(it -> it.getNodeType().equals(nodeType))
            .map(CodeBlockDefinitionNode.class::cast)
            .collect(toList());
  }

  private Map<String, List<Location>> retrieveDefinitions(List<CodeBlockDefinitionNode> nodes) {
    return nodes.stream()
        .collect(
            Collectors.toMap(
                CodeBlockDefinitionNode::getName,
                it -> ImmutableList.of(it.getDefinition().toLocation()),
                (x, y) -> Stream.concat(x.stream(), y.stream()).collect(toList())));
  }

  private Map<String, List<Location>> retrieveUsages(List<CodeBlockDefinitionNode> node) {
    return node.stream()
        .filter(it -> !it.getUsages().isEmpty())
        .collect(
            Collectors.toMap(
                CodeBlockDefinitionNode::getName,
                it -> it.getUsages().stream().map(Locality::toLocation).collect(toList()),
                (x, y) -> Stream.concat(x.stream(), y.stream()).collect(toList())));
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
