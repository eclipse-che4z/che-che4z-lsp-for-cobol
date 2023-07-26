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
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.model.Context;
import org.eclipse.lsp.cobol.core.engine.symbols.SymbolsRepository;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.*;

import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * This occurrences provider resolves the requests for the semantic elements based on its positions.
 */
public class ElementOccurrences implements Occurrences {

  @Override
  public @NonNull List<Location> findDefinitions(
      @NonNull CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    return SymbolsRepository.findElementByPosition(
        UriHelper.decode(position.getTextDocument().getUri()), document.getAnalysisResult(), position.getPosition())
            .map(Context::getDefinitions).orElse(Collections.emptyList());
  }

  @Override
  public @NonNull List<Location> findReferences(
      @NonNull CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      @NonNull ReferenceContext refCtx) {
    Optional<Context> element = SymbolsRepository.findElementByPosition(
        UriHelper.decode(position.getTextDocument().getUri()), document.getAnalysisResult(), position.getPosition());
    if (!element.isPresent()) {
      return Collections.emptyList();
    }
    List<Location> references = new ArrayList<>(element.get().getUsages());
    if (refCtx.isIncludeDeclaration()) {
      references.addAll(element.get().getDefinitions());
    }
    return references;
  }

  @Override
  public @NonNull List<DocumentHighlight> findHighlights(
      @NonNull CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    Optional<Context> element = SymbolsRepository.findElementByPosition(UriHelper.decode(position.getTextDocument().getUri()),
        document.getAnalysisResult(), position.getPosition());
    return element.map(context -> Streams.concat(context.getUsages().stream(), context.getDefinitions().stream())
            .filter(byUri(position))
            .map(toDocumentHighlight())
            .collect(Collectors.toList())).orElse(Collections.emptyList());
  }

  @NonNull
  private static Predicate<Location> byUri(@NonNull TextDocumentPositionParams position) {
    return location -> Objects.equals(location.getUri(), UriHelper.decode(position.getTextDocument().getUri()));
  }

  @NonNull
  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return location -> new DocumentHighlight(location.getRange(), DocumentHighlightKind.Text);
  }
}
