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
package org.eclipse.lsp.cobol.service.delegates.completions;

import org.eclipse.lsp.cobol.domain.modules.ServiceModule;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.MarkupContent;

import lombok.NonNull;
import javax.annotation.Nullable;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.Set;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * This class is used as a delegate for code completion operations. It requires type-specific
 * completion providers that resolve all the requests.
 *
 * <p>Due to the resolving of documentation for completion items may be time-consuming, by default
 * all the completions suggestions are sent without any documentation. To fulfill it, there is a
 * special "resolve" request.
 *
 * <p>For maintainers: If you add a new completion providers, please, specify a new dependency in
 * the DI configuration {@link ServiceModule}
 */
@Slf4j
@Singleton
public class Completions {

  private Set<Completion> providers;

  @Inject
  Completions(Set<Completion> providers) {
    this.providers = providers;
  }

  /**
   * Collect completion suggestions for a token in the document. The documentation for the
   * completion suggestion is not resolving in order to speed-up the autocomplete request
   * processing, so the list to return is marked as Incomplete. Use resolveDocumentationFor() to
   * fill-in the documentation. Document may be null if the request is invoked before the didOpen()
   * request was resolved and the document model is not stored on the server yet.
   *
   * @param document - document model that should be used to retrieve the required token. May be
   *     null.
   * @param params - request parameters that contain the position of the required token in the
   *     document
   * @return a CompletionList with completion suggestions that do not contain documentation
   */
  @NonNull
  public CompletionList collectFor(
      @Nullable CobolDocumentModel document, @NonNull CompletionParams params) {
    return new CompletionList(true, collectCompletions(document, params));
  }

  /**
   * Fills in the documentation for CompletionItem by its label. The documentation is marked-up
   * using a Markdown notation. If there is no documentation could be provided, then the
   * documentation is a {@link MarkupContent} with null as a value.
   *
   * @param unresolved - CompletionItem to be resolved
   * @return the given CompletionItem with resolved documentation
   */
  @NonNull
  public CompletionItem resolveDocumentationFor(@NonNull CompletionItem unresolved) {
    unresolved.setDocumentation(
        wrapWithMarkup(
            providers.stream()
                .map(it -> it.tryResolve(unresolved.getLabel()))
                .filter(Objects::nonNull)
                .findAny()
                .orElse(null)));

    return unresolved;
  }

  @NonNull
  private MarkupContent wrapWithMarkup(@Nullable String desc) {
    MarkupContent markupContent = new MarkupContent();
    markupContent.setKind("markdown");
    markupContent.setValue(desc);
    return markupContent;
  }

  @NonNull
  private List<CompletionItem> collectCompletions(
      @Nullable CobolDocumentModel document, @NonNull CompletionParams params) {
    String token = retrieveToken(document, params);
    return providers
        .parallelStream()
        .flatMap(
            it ->
                it.getCompletionSource(document).stream()
                    .filter(startsWithIgnoreCase(token))
                    .map(convertToCompletionItem(it)))
        .collect(Collectors.toList());
  }

  @NonNull
  private String retrieveToken(
      @Nullable CobolDocumentModel document, @NonNull CompletionParams params) {
    return Optional.ofNullable(document)
        .map(it -> it.getTokenBeforePosition(params.getPosition()))
        .orElse("");
  }
  /**
   * Returns predicate which may be used to filter strings that starts with a given string ignoring
   * case. Code example: list.stream().filter(CompletionUtils.startsWithIgnoreCase("string");
   *
   * @param token - The string that the checking string should start with
   * @return Predicate that may be used in Stream.filter()
   */
  @NonNull
  private Predicate<String> startsWithIgnoreCase(@NonNull String token) {
    return word -> word.regionMatches(true, 0, token, 0, token.length());
  }

  @NonNull
  private Function<String, CompletionItem> convertToCompletionItem(@NonNull Completion it) {
    return word -> {
      CompletionItem item = new CompletionItem();
      item.setLabel(word);
      item.setInsertText(word);
      item.setKind(it.getKind());
      item.setSortText(it.getSortOrderPrefix() + word);
      return it.customize(item);
    };
  }
}
