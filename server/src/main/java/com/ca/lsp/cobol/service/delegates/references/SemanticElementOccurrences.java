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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service.delegates.references;

import com.ca.lsp.cobol.service.MyDocumentModel;
import com.google.inject.Inject;
import org.eclipse.lsp4j.*;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.*;
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
  @Nonnull
  public List<Location> findDefinitions(
      @Nullable MyDocumentModel document, @Nonnull TextDocumentPositionParams position) {
    if (document == null) return Collections.emptyList();
    return collectLocations(document, position, it -> it.definitions(document));
  }

  @Override
  @Nonnull
  public List<Location> findReferences(
      @Nullable MyDocumentModel document,
      @Nonnull TextDocumentPositionParams position,
      @Nonnull ReferenceContext context) {
    if (document == null) return Collections.emptyList();
    List<Location> result = collectLocations(document, position, it -> it.references(document));
    if (context.isIncludeDeclaration()) {
      result.addAll(findDefinitions(document, position));
    }
    return result;
  }

  @Override
  @Nonnull
  public List<DocumentHighlight> findHighlights(
      @Nullable MyDocumentModel document, @Nonnull TextDocumentPositionParams position) {
    if (document == null) return Collections.emptyList();
    return findReferences(document, position, new ReferenceContext(true)).stream()
        .filter(byUri(position))
        .map(toDocumentHighlight())
        .collect(Collectors.toList());
  }

  @Nonnull
  private List<Location> collectLocations(
      @Nonnull MyDocumentModel document,
      @Nonnull TextDocumentPositionParams position,
      @Nonnull Function<SemanticLocations, Map<String, List<Location>>> getOccurrences) {
    String token = retrieveToken(document, position.getPosition());
    return semanticLocations.stream()
        .filter(it -> it.containsToken(document, token))
        .map(getOccurrences)
        .map(retrieveLocationsFor(token))
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }

  @Nonnull
  private Function<Map<String, List<Location>>, List<Location>> retrieveLocationsFor(
      @Nonnull String token) {
    return occurrences ->
        occurrences.entrySet().stream()
            .filter(it -> it.getKey().equalsIgnoreCase(token))
            .map(Map.Entry::getValue)
            .flatMap(List::stream)
            .collect(Collectors.toList());
  }

  @Nonnull
  private static Predicate<Location> byUri(@Nonnull TextDocumentPositionParams position) {
    return location -> location.getUri().equals(position.getTextDocument().getUri());
  }

  @Nonnull
  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return location -> new DocumentHighlight(location.getRange(), DocumentHighlightKind.Text);
  }

  @Nonnull
  private String retrieveToken(@Nonnull MyDocumentModel document, @Nonnull Position position) {
    return document.getFullTokenAtPosition(position);
  }
}
