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
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.engine.symbols.Context;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * This occurrences provider resolves the requests for the semantic elements based on its positions.
 */
public class ElementOccurrences implements Occurrences {
  private final SymbolService symbolService;

  @Inject
  public ElementOccurrences(SymbolService symbolService) {
    this.symbolService = symbolService;
  }

  @Override
  public @NonNull List<Location> findDefinitions(
      @NonNull CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    return symbolService.findElementByPosition(document, position).getDefinitions();
  }

  @Override
  public @NonNull List<Location> findReferences(
      @NonNull CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      @NonNull ReferenceContext refCtx) {
    Context element = symbolService.findElementByPosition(document, position);
    List<Location> references = new ArrayList<>(element.getUsages());
    if (refCtx.isIncludeDeclaration()) {
      references.addAll(element.getDefinitions());
    }
    return references;
  }

  @Override
  public @NonNull List<DocumentHighlight> findHighlights(
      @NonNull CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    Context element = symbolService.findElementByPosition(document, position);
    return Streams.concat(element.getUsages().stream(), element.getDefinitions().stream())
        .filter(byUri(position))
        .map(toDocumentHighlight())
        .collect(Collectors.toList());
  }

  @NonNull
  private static Predicate<Location> byUri(@NonNull TextDocumentPositionParams position) {
    return location -> Objects.equals(location.getUri(), position.getTextDocument().getUri());
  }

  @NonNull
  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return location -> new DocumentHighlight(location.getRange(), DocumentHighlightKind.Text);
  }
}
