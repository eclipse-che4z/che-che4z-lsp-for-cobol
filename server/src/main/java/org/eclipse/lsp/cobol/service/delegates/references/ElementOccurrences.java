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
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.tree.Context;
import org.eclipse.lsp.cobol.core.model.tree.Node;
import org.eclipse.lsp.cobol.core.semantics.outline.RangeUtils;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp4j.*;

import javax.annotation.Nullable;
import java.util.*;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.eclipse.lsp.cobol.service.PredefinedCopybooks.PREF_IMPLICIT;
import static org.eclipse.lsp.cobol.service.utils.SyntaxTreeUtil.findNodeByPosition;

/**
 * This occurrences provider resolves the requests for the semantic elements based on its positions.
 */
public class ElementOccurrences implements Occurrences {
    @Override
    public @NonNull List<Location> findDefinitions(@Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
        if (document == null) return Collections.emptyList();
        return findElementByPosition(document, position).definitions;
    }

    @Override
    public @NonNull List<Location> findReferences(@Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position, @NonNull ReferenceContext context) {
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
    public @NonNull List<DocumentHighlight> findHighlights(@Nullable CobolDocumentModel document, @NonNull TextDocumentPositionParams position) {
        if (document == null) return Collections.emptyList();
        return findReferences(document, position, new ReferenceContext(true)).stream()
                .filter(byUri(position))
                .map(toDocumentHighlight())
                .collect(Collectors.toList());
    }

    private static Element findElementByPosition(CobolDocumentModel document, TextDocumentPositionParams position) {
        AnalysisResult result = document.getAnalysisResult();
        Optional<Element> fromTree = Optional.ofNullable(result.getRootNode())
            .flatMap(rootNode -> findNodeByPosition(rootNode, position))
            .filter(node -> node instanceof Context)
            .map(Context.class::cast)
            .map(ElementOccurrences::convertToElement)
            .map(ElementOccurrences::constructElementsExcludingImplicits);
        return fromTree.orElseGet(() -> Stream.<Supplier<Optional<Element>>>of(
                () -> findElementByPosition(result.getParagraphDefinitions(), result.getParagraphUsages(), position),
                () -> findElementByPosition(result.getSectionDefinitions(), result.getSectionUsages(), position),
                () -> findElementByPosition(result.getConstantDefinitions(), result.getConstantUsages(), position),
                () -> findElementByPosition(result.getCopybookDefinitions(), result.getCopybookUsages(), position),
                () -> findElementByPosition(result.getSubroutineDefinitions(), result.getSubroutineUsages(), position))
            .map(Supplier::get)
            .filter(Optional::isPresent)
            .map(Optional::get)
            .map(ElementOccurrences::constructElementsExcludingImplicits)
            .findFirst().orElse(new Element(Collections.emptyList(), Collections.emptyList())));
    }

    private static Element constructElementsExcludingImplicits(Element e) {
        List<Location> definitions = e.definitions.stream().filter(uriNotImplicit()).collect(Collectors.toList());
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

    private static Optional<Element> findElementByPosition(
            Map<String, List<Location>> definitions,
            Map<String, List<Location>> usages,
            TextDocumentPositionParams position) {
        return Stream.concat(definitions.entrySet().stream(), usages.entrySet().stream())
                .filter(entry -> entry.getValue().stream().anyMatch(location -> RangeUtils.isInside(position, location)))
                .findFirst()
                .map(Map.Entry::getKey)
                .map(name -> new Element(
                    definitions.getOrDefault(name, Collections.emptyList()),
                    usages.getOrDefault(name, Collections.emptyList())));
    }

    private static Element convertToElement(Context contextNode) {
        return new Element(convertToLocations(contextNode.getDefinitions()),
            convertToLocations(contextNode.getUsages()));
    }

    private static List<Location> convertToLocations(List<? extends Node> nodes) {
        return nodes.stream()
            .map(Node::getLocality)
            .map(Locality::toLocation)
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
}
