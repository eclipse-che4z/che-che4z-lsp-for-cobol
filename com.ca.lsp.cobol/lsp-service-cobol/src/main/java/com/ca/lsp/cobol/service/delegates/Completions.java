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
package com.ca.lsp.cobol.service.delegates;

import com.ca.lsp.cobol.service.Keywords;
import com.ca.lsp.cobol.utils.Filters;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.MarkupContent;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * This class is used as a delegate for code completion operations.
 *
 * @author teman02
 */
public class Completions {

  private Completions() {
    throw new AssertionError("Suppress default constructor for noninstantiability");
  }

  private static Logger logger = LogManager.getLogger(Completions.class);

  /**
   * Retrieves a list of keywords starting with a provided token.
   *
   * @param token - A code part user typed in the IDE to be completed
   * @param keywords - The keywords provider
   * @return A list of keywords that starts with token
   */
  public static CompletableFuture<Either<List<CompletionItem>, CompletionList>> collectFor(
      String token, Keywords keywords) {
    return CompletableFuture.supplyAsync(
        () -> Either.forRight(new CompletionList(false, collectKeywords(token, keywords))));
  }

  /**
   * Checks the Completion parameters to prevent NullPointerException by throwing an
   * IllegalArgumentException
   *
   * @param params - CompletionParams to be checked
   */
  public static void checkCompletionParams(CompletionParams params) {
    if (params.getTextDocument() == null || params.getPosition() == null) {
      throw new IllegalArgumentException(
          "The Language Server cannot process an empty CompletionParams instance");
    }
  }

  /**
   * Fills in the documentation for CompletionItem by its label
   *
   * @param unresolved - CompletionItem to be resolved
   * @param keywords - The keywords provider
   * @return the given CompletionItem with documentation properly filled in
   */
  public static CompletionItem resolveDocumentationFor(
      CompletionItem unresolved, Keywords keywords) {
    String desc = keywords.getDescriptionFor(unresolved.getLabel());
    MarkupContent markupContent = new MarkupContent();
    markupContent.setKind("markdown");
    markupContent.setValue(desc);
    unresolved.setDocumentation(markupContent);
    logger.debug("The documentation for [{}] is [{}]", unresolved.getLabel(), desc);
    return unresolved;
  }

  private static List<CompletionItem> collectKeywords(String token, Keywords keywords) {
    return keywords
        .getKeywords()
        .parallelStream()
        .filter(Filters.startsWithIgnoreCase(token))
        .peek(
            completion ->
                logger.debug(
                    "[{}] has been added to a completion list for [{}]", completion, token))
        .map(convertToCompletionItem())
        .collect(Collectors.toList());
  }

  private static Function<? super String, ? extends CompletionItem> convertToCompletionItem() {
    return word -> {
      CompletionItem item = new CompletionItem();
      item.setLabel(word);
      item.setInsertText(word);
      return item;
    };
  }
}
