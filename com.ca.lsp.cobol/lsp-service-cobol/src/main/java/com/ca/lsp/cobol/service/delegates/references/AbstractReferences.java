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
package com.ca.lsp.cobol.service.delegates.references;

import com.ca.lsp.cobol.service.MyDocumentModel;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.ReferenceContext;
import org.eclipse.lsp4j.TextDocumentPositionParams;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

abstract class AbstractReferences {

  private AbstractReferences nextProvider = null;

  void setNextProvider(AbstractReferences nextProvider) {
    this.nextProvider = nextProvider;
  }

  List<Location> resolveDefinition(MyDocumentModel document, TextDocumentPositionParams position) {
    String token = retrieveToken(document, position);
    String uri = position.getTextDocument().getUri();

    if (!providerContainsToken(document, token) && nextProvider != null) {
      return nextProvider.resolveDefinition(document, position);
    }
    return retrieveDefinitionLocations(document, token, uri);
  }

  List<Location> collectReferences(
      MyDocumentModel document, TextDocumentPositionParams params, ReferenceContext context) {

    String token = retrieveToken(document, params);
    String uri = params.getTextDocument().getUri();

    if (!providerContainsToken(document, token) && nextProvider != null) {
      return nextProvider.collectReferences(document, params, context);
    }
    List<Location> result = new ArrayList<>();
    if (context.isIncludeDeclaration()) {
      result.addAll(retrieveDefinitionLocations(document, token, uri));
    }
    result.addAll(retrieveReferenceLocations(document, token, uri));
    return result;
  }

  List<Location> retrieveLocations(
      Map<String, List<Location>> tokenOccurrence, String token, String uri) {
    return tokenOccurrence.entrySet().stream()
        .filter(it -> it.getKey().equalsIgnoreCase(token))
        .map(Map.Entry::getValue)
        .flatMap(List::stream)
        .map(fillUriIfNeeded(uri))
        .collect(Collectors.toList());
  }

  @NotNull
  private Function<Location, Location> fillUriIfNeeded(String uri) {
    return location ->
        new Location(Optional.ofNullable(location.getUri()).orElse(uri), location.getRange());
  }

  abstract List<Location> retrieveReferenceLocations(
      MyDocumentModel document, String token, String uri);

  abstract List<Location> retrieveDefinitionLocations(
      MyDocumentModel document, String token, String uri);

  abstract boolean providerContainsToken(MyDocumentModel document, String token);

  private String retrieveToken(MyDocumentModel document, TextDocumentPositionParams position) {
    return document.getFullTokenAtPosition(position.getPosition());
  }
}
