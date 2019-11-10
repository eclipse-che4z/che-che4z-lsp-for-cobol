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
import lombok.experimental.UtilityClass;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * This class is used as a delegate for code completion operations.
 *
 * @author teman02
 */
@UtilityClass
public class Completions {

  private static final AbstractCompletion COMPLETION_PROVIDER = initializeCompletionsChain();

  /**
   * This class uses a chain of completion providers to implement the Chain of Responsibility
   * pattern for collecting completions and resolving documentation
   *
   * @return a variable provider that contains a link to the following providers.
   */
  private AbstractCompletion initializeCompletionsChain() {
    AbstractCompletion variableProvider = new VariableCompletion();
    AbstractCompletion paragraphProvider = new ParagraphCompletion();
    AbstractCompletion snippetProvider = new SnippetCompletion();
    AbstractCompletion keywordProvider = new KeywordCompletion();

    variableProvider.setNextCompletionProvider(paragraphProvider);
    paragraphProvider.setNextCompletionProvider(snippetProvider);
    snippetProvider.setNextCompletionProvider(keywordProvider);

    return variableProvider;
  }

  /**
   * Checks the Completion parameters to prevent NullPointerException by throwing an
   * IllegalArgumentException
   *
   * @param params - CompletionParams to be checked
   */
  public void checkCompletionParams(CompletionParams params) {
    if (params.getTextDocument() == null || params.getPosition() == null) {
      throw new IllegalArgumentException(
          "The Language Server cannot process an empty CompletionParams instance");
    }
  }

  /**
   * Retrieves a list of keywords starting with a provided token.
   *
   * @return A list of keywords that starts with token
   */
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> collectFor(
      MyDocumentModel document, CompletionParams params) {
    return CompletableFuture.supplyAsync(
        () -> Either.forRight(new CompletionList(true, collectCompletions(document, params))));
  }

  /**
   * Fills in the documentation for CompletionItem by its label
   *
   * @param unresolved - CompletionItem to be resolved
   * @return the given CompletionItem with documentation properly filled in
   */
  public CompletionItem resolveDocumentationFor(CompletionItem unresolved) {
    return COMPLETION_PROVIDER.resolveDocumentation(unresolved);
  }

  private List<CompletionItem> collectCompletions(
      MyDocumentModel document, CompletionParams params) {
    return COMPLETION_PROVIDER.collectCompletions(document, params);
  }
}
