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
package com.ca.lsp.cobol.service.delegates.completions;

import com.ca.lsp.cobol.service.MyDocumentModel;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionItemKind;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.MarkupContent;

import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@Slf4j
abstract class AbstractCompletion {
  private AbstractCompletion nextCompletionProvider;

  /**
   * Set the completion provider that will continue the completion process after this one
   *
   * @param completionProvider - the following provider
   */
  void setNextCompletionProvider(AbstractCompletion completionProvider) {
    nextCompletionProvider = completionProvider;
  }

  /**
   * Retrieve a collection of string that a going to be converted into completion items
   *
   * @param document - object that contains text and analysis output
   * @return collection of strings to be converted into completion items
   */
  abstract Collection<String> getCompletionSource(MyDocumentModel document);

  /**
   * Try to resolve the documentation for the completion item by its label
   *
   * @param label - A code part user typed in the IDE to be completed
   * @return the description for the label or null if not resolved
   */
  abstract String tryResolve(String label);

  /**
   * Get a prefix for the completion item to apply sort with the expected order
   *
   * @return a string containing number for proper sorting
   */
  protected abstract String getSortOrderPrefix();

  /**
   * Get kind for the completion items to add specific icons on the client side.
   *
   * @return CompletionItemKind for the provided completions
   */
  protected abstract CompletionItemKind getKind();

  CompletionItem resolveDocumentation(CompletionItem unresolved) {
    String desc = tryResolve(unresolved.getLabel());
    if (needToContinue(desc)) {
      return nextCompletionProvider.resolveDocumentation(unresolved);
    }
    unresolved.setDocumentation(wrapWithMarkup(desc));
    log.debug("The documentation for [{}] is [{}]", unresolved.getLabel(), desc);
    return unresolved;
  }

  List<CompletionItem> collectCompletions(MyDocumentModel document, CompletionParams params) {
    String token = retrieveToken(document, params);
    List<CompletionItem> result =
        getCompletionSource(document)
            .parallelStream()
            .filter(startsWithIgnoreCase(token))
            .peek(logCompletion(token))
            .map(convertToCompletionItem())
            .collect(Collectors.toList());
    Optional.ofNullable(nextCompletionProvider)
        .ifPresent(it -> result.addAll(it.collectCompletions(document, params)));
    return result;
  }

  /**
   * If the documentation was not resolved by this provider, it may be resolved by the following
   * provider if it exists
   *
   * @param desc - Description for the Completion Item
   * @return try if it is needed to pass the resolving process to the following provider
   */
  private boolean needToContinue(String desc) {
    return desc == null && nextCompletionProvider != null;
  }

  private MarkupContent wrapWithMarkup(String desc) {
    MarkupContent markupContent = new MarkupContent();
    markupContent.setKind("markdown");
    markupContent.setValue(desc);
    return markupContent;
  }

  private String retrieveToken(MyDocumentModel document, CompletionParams params) {
    return Optional.ofNullable(document).map(it -> it.getTokenBeforePosition(params.getPosition())).orElse("");
  }

  private Consumer<String> logCompletion(String token) {
    return completion ->
        log.debug("[{}] has been added to a completion list for [{}]", completion, token);
  }

  /**
   * Returns predicate which may be used to filter strings that starts with a given string ignoring
   * case. Code example: list.stream().filter(CompletionUtils.startsWithIgnoreCase("string");
   *
   * @param token - The string that the checking string should start with
   * @return Predicate that may be used in Stream.filter()
   */
  private Predicate<String> startsWithIgnoreCase(String token) {
    return word -> word.regionMatches(true, 0, token, 0, token.length());
  }

  private Function<String, CompletionItem> convertToCompletionItem() {
    return word -> {
      CompletionItem item = new CompletionItem();
      item.setLabel(word);
      item.setInsertText(word);
      item.setKind(getKind());
      item.setSortText(getSortText(word));
      return customize(item);
    };
  }

  protected CompletionItem customize(CompletionItem item) {
    return item;
  }

  private String getSortText(String word) {
    return getSortOrderPrefix() + word;
  }
}
