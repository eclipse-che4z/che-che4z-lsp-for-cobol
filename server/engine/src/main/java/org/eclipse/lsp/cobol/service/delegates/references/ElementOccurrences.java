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
package org.eclipse.lsp.cobol.service.delegates.references;

import com.google.common.collect.Streams;
import com.google.inject.Inject;
import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.model.DefinedAndUsedStructure;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.*;

/**
 * This occurrences provider resolves the requests for the semantic elements based on its positions.
 */
@Slf4j
public class ElementOccurrences implements Occurrences {
  private final SourceUnitGraph sourceUnitGraph;

  @Inject
  public ElementOccurrences(SourceUnitGraph sourceUnitGraph) {
    this.sourceUnitGraph = sourceUnitGraph;
  }

  @Override
  public @NonNull List<Location> findDefinitions(
      @NonNull CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    String uri = position.getTextDocument().getUri();
    return SymbolsRepository.findElementByPosition(
            uri, document.getLastAnalysisResult(), position.getPosition())
        .stream()
        .map(DefinedAndUsedStructure::getDefinitions)
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }

  private List<Location> getCopybookLocation(TextDocumentPositionParams position, String uri) {
    List<Location> result = new ArrayList<>();
    List<SourceUnitGraph.NodeV> injectedCopybookNode =
        sourceUnitGraph.getInjectedCopybookNode(uri, position.getPosition());
    for (SourceUnitGraph.NodeV nodeV : injectedCopybookNode) {
      Location location =
          new Location(nodeV.getUri(), new Range(new Position(0, 0), new Position(0, 0)));
      result.add(location);
    }
    return result;
  }

  @Override
  public @NonNull List<Location> findReferences(
      @NonNull CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      @NonNull ReferenceContext refCtx) {
    Set<DefinedAndUsedStructure> element =
        SymbolsRepository.findElementByPosition(
            position.getTextDocument().getUri(),
            document.getAnalysisResult(),
            position.getPosition());
    if (element.isEmpty()) {
      return Collections.emptyList();
    }
    List<Location> references =
        element.stream()
            .map(DefinedAndUsedStructure::getUsages)
            .flatMap(List::stream)
            .collect(Collectors.toList());
    if (refCtx.isIncludeDeclaration()) {
      references.addAll(
          element.stream()
              .map(DefinedAndUsedStructure::getDefinitions)
              .flatMap(List::stream)
              .collect(Collectors.toList()));
    }
    return references;
  }

  @Override
  public @NonNull List<DocumentHighlight> findHighlights(
      AnalysisResult analysisResult, @NonNull TextDocumentPositionParams position) {
    return SymbolsRepository.findElementByPosition(
            position.getTextDocument().getUri(), analysisResult, position.getPosition())
        .stream()
        .map(
            context ->
                Streams.concat(context.getUsages().stream(), context.getDefinitions().stream())
                    .filter(byUri(position))
                    .map(toDocumentHighlight())
                    .collect(Collectors.toList()))
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }

  @NonNull
  private Predicate<Location> byUri(@NonNull TextDocumentPositionParams position) {
    return location -> Objects.equals(location.getUri(), position.getTextDocument().getUri());
  }

  @NonNull
  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return location -> new DocumentHighlight(location.getRange(), DocumentHighlightKind.Text);
  }
}
