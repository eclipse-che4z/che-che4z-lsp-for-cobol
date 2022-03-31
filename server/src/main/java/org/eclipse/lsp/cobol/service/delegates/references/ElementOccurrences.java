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

import lombok.NonNull;
import lombok.Value;
import org.eclipse.lsp.cobol.core.model.tree.Context;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;

import javax.annotation.Nullable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static org.eclipse.lsp.cobol.core.preprocessor.delegates.util.RangeUtils.findNodeByPosition;
import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.PREF_IMPLICIT;

/**
 * This occurrences provider resolves the requests for the semantic elements based on its positions.
 */
public class ElementOccurrences implements Occurrences {
  @Override
  public @NonNull List<Location> findDefinitions(
      @Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    if (document == null) return Collections.emptyList();
    return findElementByPosition(document, position).definitions;
  }

  @Override
  public @NonNull List<Location> findReferences(
      @Nullable CobolDocumentModel document,
      @NonNull TextDocumentPositionParams position,
      @NonNull ReferenceContext context) {
    if (document == null) return Collections.emptyList();
    Element element = findElementByPosition(document, position);
    List<Location> references = element.usages;
    if (context.isIncludeDeclaration()) {
      references = new ArrayList<>(references);
      references.addAll(element.definitions);
    }
    return references;
  }

  @Override
  public @NonNull List<DocumentHighlight> findHighlights(
      @Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
    if (document == null) return Collections.emptyList();
    return findReferences(document, position, new ReferenceContext(true)).stream()
        .filter(byUri(position))
        .map(toDocumentHighlight())
        .collect(Collectors.toList());
  }

  private static Element findElementByPosition(
      CobolDocumentModel document, TextDocumentPositionParams position) {
    AnalysisResult result = document.getAnalysisResult();
    return Optional.ofNullable(result.getRootNode())
        .flatMap(
            rootNode ->
                findNodeByPosition(
                    rootNode, position.getTextDocument().getUri(), position.getPosition()))
        .filter(node -> node instanceof Context)
        .map(Context.class::cast)
        .map(ElementOccurrences::convertToElement)
        .map(ElementOccurrences::constructElementsExcludingImplicits)
        .orElseGet(() -> new Element(Collections.emptyList(), Collections.emptyList()));
  }

  private static Element constructElementsExcludingImplicits(Element e) {
    List<Location> definitions =
        e.definitions.stream().filter(uriNotImplicit()).collect(Collectors.toList());
    List<Location> usages = e.usages.stream().filter(uriNotImplicit()).collect(Collectors.toList());
    return new Element(definitions, usages);
  }

  private static Predicate<Location> uriNotImplicit() {
    return i -> !i.getUri().startsWith(PREF_IMPLICIT);
  }

  @Value
  private static class Element {
    List<Location> definitions;
    List<Location> usages;
  }

  private static Element convertToElement(Context contextNode) {
    return new Element(contextNode.getDefinitions(), contextNode.getUsages());
  }

  @NonNull
  private static Predicate<Location> byUri(@NonNull TextDocumentPositionParams position) {
    return location -> location.getUri().equals(position.getTextDocument().getUri());
  }

  @NonNull
  private static Function<Location, DocumentHighlight> toDocumentHighlight() {
    return location -> new DocumentHighlight(location.getRange(), DocumentHighlightKind.Text);
  }
}
