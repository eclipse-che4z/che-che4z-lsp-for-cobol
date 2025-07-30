/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.lsp.handlers.text;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.SourceUnitGraph;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.HoverLspQuery;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp4j.Hover;
import org.eclipse.lsp4j.HoverParams;
import org.eclipse.lsp4j.MarkedString;
import org.eclipse.lsp4j.MarkupContent;
import org.eclipse.lsp4j.MarkupKind;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/** LSP Hover Handler */
@Slf4j
public class HoverHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final Set<HoverProvider> hoverProvider;
  private final DocumentModelService documentModelService;
  private final SourceUnitGraph documentGraph;

  @Inject
  public HoverHandler(
      AsyncAnalysisService asyncAnalysisService,
      Set<HoverProvider> hoverProvider,
      DocumentModelService documentModelService,
      SourceUnitGraph documentGraph) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.hoverProvider = hoverProvider;
    this.documentModelService = documentModelService;
    this.documentGraph = documentGraph;
  }

  /**
   * Handle LSP hover request.
   *
   * @param params HoverParams.
   * @return Hover data.
   * @throws ExecutionException forward exception.
   * @throws InterruptedException forward exception.
   */
  public Hover hover(HoverParams params) throws ExecutionException, InterruptedException {
    Collection<CobolDocumentModel> docs =
        documentModelService.findMainSource(params.getTextDocument().getUri());
    Hover mergedHover = new Hover();

    for (CobolDocumentModel doc : docs) {
      for (HoverProvider provider : hoverProvider) {
        Hover currentHover = provider.getHover(doc, params, documentGraph);
        if (currentHover != null && currentHover.getContents() != null) {
          mergedHover = mergeHovers(mergedHover, currentHover);
        }
      }
    }
    return (mergedHover.getContents() == null) ? null : mergedHover;
  }

  /**
   * Create LSP hover event.
   *
   * @param params HoverParams.
   * @return LspNotification.
   */
  public LspQuery<Hover> createEvent(HoverParams params) {
    return new HoverLspQuery(params, this);
  }

  /**
   * Get dependency for this handler
   * @param params
   * @return list of {@link LspEventDependency
   */
  public ImmutableList<LspEventDependency> getDependencies(HoverParams params) {
    return ImmutableList.of(
        asyncAnalysisService.createDependencyOn(params.getTextDocument().getUri()));
  }

  /**
   * Merges two Hover objects based on the following logic: - If the first hover has no contents,
   * return the second hover. - Merge the Left (List<MarkedString>) contents by combining the lists.
   * - Merge the Right (MarkupContent) contents by concatenating their values with a newline.
   *
   * @param base
   * @param toMerge
   * @return a merged Hover object
   */
  public static Hover mergeHovers(Hover base, Hover toMerge) {
    if (base.getContents() == null) {
      return toMerge;
    }

    Either<List<Either<String, MarkedString>>, MarkupContent> baseContents = base.getContents();
    Either<List<Either<String, MarkedString>>, MarkupContent> toMergeContents =
        toMerge.getContents();
    if (baseContents.isRight() && toMergeContents.isRight()) {
      MarkupContent baseMarkup = baseContents.getRight();
      MarkupContent toMergeMarkup = toMergeContents.getRight();

      String baseValue = baseMarkup.getValue();
      String toMergeValue = toMergeMarkup.getValue();

      if (!baseValue.contains(toMergeValue)) {
        String combinedValue = baseValue + "\n\n" + toMergeValue;
        MarkupContent mergedMarkup = new MarkupContent(baseMarkup.getKind(), combinedValue);
        base.setContents(Either.forRight(mergedMarkup));
      }
      return base;
    }

    if (baseContents.isLeft() && toMergeContents.isLeft()) {
      List<Either<String, MarkedString>> mergedList = new ArrayList<>(baseContents.getLeft());
      for (Either<String, MarkedString> item : toMergeContents.getLeft()) {
        if (!mergedList.contains(item)) {
          mergedList.add(item);
        }
      }
      base.setContents(Either.forLeft(mergedList));
      return base;
    }

    if (baseContents.isLeft() && toMergeContents.isRight()) {
      return mergeContents(baseContents.getLeft(), toMerge, base);
    }

    if (baseContents.isRight() && toMergeContents.isLeft()) {
      return mergeContents(toMergeContents.getLeft(), base, base);
    }

    return base;
  }

  private static Hover mergeContents(
      List<Either<String, MarkedString>> contents, Hover hoverToAdd, Hover fallback) {
    List<Hover> hovers =
        contents.stream()
            .map(
                c ->
                    c.isLeft()
                        ? new MarkupContent(MarkupKind.PLAINTEXT, c.getLeft())
                        : new MarkupContent(
                            MarkupKind.MARKDOWN,
                            String.format(
                                "```%s\n%s\n```",
                                c.getRight().getLanguage(), c.getRight().getValue())))
            .map(Hover::new)
            .collect(Collectors.toList());
    hovers.add(hoverToAdd);
    return hovers.stream().reduce(HoverHandler::mergeHovers).orElse(fallback);
  }
}
