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

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.domain.modules.ServiceModule;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;

import javax.annotation.Nullable;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static java.util.stream.Collectors.toList;

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

  private final Set<Completion> providers;

  @Inject
  Completions(Set<Completion> providers) {
    this.providers = providers;
  }

  /**
   * Collect completion suggestions for a token in the document. Document may be null if the request
   * is invoked before the didOpen() request has been resolved, and the document model is not stored
   * on the server yet.
   *
   * @param document - document model that should be used to retrieve the required token. May be
   *                 null.
   * @param params   - request parameters that contain the position of the required token in the
   *                 document
   * @return a CompletionList with completion suggestions that do not contain documentation
   */
  @NonNull
  public CompletionList collectFor(
          @Nullable CobolDocumentModel document, @NonNull CompletionParams params) {
    List<CompletionItem> items = collectCompletions(document, params);
    return new CompletionList(false, items);
  }

  @NonNull
  private List<CompletionItem> collectCompletions(
          @Nullable CobolDocumentModel document, @NonNull CompletionParams params) {
    String token = retrieveToken(document, params);
    return providers
            .stream()
            .map(it -> it.getCompletionItems(token, document))
            .flatMap(Collection::stream)
            .distinct()
            .collect(toList());
  }

  @NonNull
  private static String retrieveToken(
          @Nullable CobolDocumentModel document, @NonNull CompletionParams params) {
    return Optional.ofNullable(document)
            .map(it -> it.getTokenBeforePosition(params.getPosition()))
            .orElse("");
  }
}
