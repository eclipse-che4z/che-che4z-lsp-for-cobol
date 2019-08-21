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
import org.eclipse.lsp4j.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

abstract class AbstractReferences {

  private AbstractReferences nextProvider = null;

  void setNextProvider(AbstractReferences nextProvider) {
    this.nextProvider = nextProvider;
  }

  List<Location> resolveDefinition(MyDocumentModel document, TextDocumentPositionParams position) {
    String token = retrieveToken(document, position);

    if (!providerContainsToken(document, token) && nextProvider != null) {
      return nextProvider.resolveDefinition(document, position);
    }
    return retrieveDefinitionRanges(document, token).stream()
        .map(convertToLocation(position))
        .collect(Collectors.toList());
  }

  List<Location> collectReferences(
      MyDocumentModel document, TextDocumentPositionParams params, ReferenceContext context) {

    String token = retrieveToken(document, params);

    if (!providerContainsToken(document, token) && nextProvider != null) {
      return nextProvider.collectReferences(document, params, context);
    }
    List<Location> result = new ArrayList<>();
    if (context.isIncludeDeclaration()) {
      result.addAll(
          retrieveDefinitionRanges(document, token).stream()
              .map(convertToLocation(params))
              .collect(Collectors.toList()));
    }
    result.addAll(
        retrieveReferenceRanges(document, token).stream()
            .map(convertToLocation(params))
            .collect(Collectors.toList()));
    return result;
  }

  List<Range> retrieveRanges(Map<String, List<Range>> ranges, String token) {
    return ranges.entrySet().stream()
        .filter(it -> it.getKey().equalsIgnoreCase(token))
        .map(Map.Entry::getValue)
        .flatMap(List::stream)
        .collect(Collectors.toList());
  }

  abstract List<Range> retrieveReferenceRanges(MyDocumentModel document, String token);

  abstract List<Range> retrieveDefinitionRanges(MyDocumentModel document, String token);

  abstract boolean providerContainsToken(MyDocumentModel document, String token);

  private String retrieveToken(MyDocumentModel document, TextDocumentPositionParams position) {
    return document.getFullTokenAtPosition(position.getPosition());
  }

  private Function<Range, Location> convertToLocation(TextDocumentPositionParams position) {
    return it -> new Location(position.getTextDocument().getUri(), it);
  }
}
