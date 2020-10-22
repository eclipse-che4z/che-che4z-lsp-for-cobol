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
package com.broadcom.lsp.cobol.service.delegates.references;

import com.broadcom.lsp.cobol.service.CobolDocumentModel;
import com.google.inject.Inject;
import org.eclipse.lsp4j.*;

import lombok.NonNull;
import javax.annotation.Nullable;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * This occurrences provider resolves the requests for the semantic elements using specific
 * delegates.
 */
public class SemanticElementOccurrences implements Occurrences {

  private Set<SemanticLocations> semanticLocations;

  @Inject
  public SemanticElementOccurrences(Set<SemanticLocations> semanticLocations) {
    this.semanticLocations = semanticLocations;
  }

  @Override
  @NonNull
  public List<Location> findDefinitions(
      @Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    if (document == null) return Collections.emptyList();
    return collectLocations(document, position, it -> it.definitions(document));
  }

  @Override
  @NonNull
  public List<Location> findReferences(
      @Nullable CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      @NonNull ReferenceContext context) {
    if (document == null) return Collections.emptyList();
    List<Location> result = collectLocations(document, position, it -> it.references(document));
    if (context.isIncludeDeclaration()) {
      result.addAll(findDefinitions(document, position));
    }
    return result;
  }

  @Override
  @NonNull
  public List<DocumentHighlight> findHighlights(
      @Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    if (document == null) return Collections.emptyList();
    return findReferences(document, position, new ReferenceContext(true)).stream()
        .filter(byUri(position))
        .map(toDocumentHighlight())
        .collect(Collectors.toList());
  }

  @NonNull
  private List<Location> collectLocations(
      @NonNull CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      @NonNull Function<SemanticLocations, Map<String, List<Location>>> getOccurrences) {
    String token = retrieveToken(document, position.getPosition());
    return semanticLocations.stream()
        .filter(it -> it.containsToken(document, token))
        .map(getOccurrences)
        .map(retrieveLocationsFor(token))
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }

  @NonNull
  private Function<Map<String, List<Location>>, List<Location>> retrieveLocationsFor(
      @NonNull String token) {
    return occurrences ->
        occurrences.entrySet().stream()
            .filter(it -> it.getKey().equalsIgnoreCase(token))
            .map(Map.Entry::getValue)
            .flatMap(List::stream)
            .collect(Collectors.toList());
  }

  @NonNull
  private static Predicate<Location> byUri(@NonNull TextDocumentPositionParams position) {
    return location -> location.getUri().equals(position.getTextDocument().getUri());
  }

  @NonNull
  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return location -> new DocumentHighlight(location.getRange(), DocumentHighlightKind.Text);
  }

  @NonNull
  private String retrieveToken(@NonNull CobolDocumentModel document, @NonNull Position position) {
    return document.getFullTokenAtPosition(position);
  }
}
