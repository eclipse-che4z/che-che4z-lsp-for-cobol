/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service.mocks;

import com.google.gson.JsonObject;
import java.util.Collections;
import java.util.concurrent.CompletableFuture;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDto;
import org.eclipse.lsp.cobol.lsp.jrpc.ExtendedApi;
import org.eclipse.lsp4j.TextDocumentIdentifier;

/**
 * Hand-written implementation of the extended API. Only for testing purposes. It must not be a
 * Mockito mock: the generated class repeats the JSON-RPC annotations, so lsp4j registers every
 * method twice and fails with "Duplicate RPC method".
 */
public class MockExtendedApi implements ExtendedApi {
  private TextDocumentIdentifier lastDocument;

  @Override
  public CompletableFuture<ExtendedApiResult> analysis(JsonObject json) {
    return CompletableFuture.completedFuture(new ExtendedApiResult(Collections.emptyList(), ""));
  }

  @Override
  public CompletableFuture<AnalysisResultDto> analysisResult(
      TextDocumentIdentifier textDocumentIdentifier) {
    lastDocument = textDocumentIdentifier;
    return CompletableFuture.completedFuture(
        new AnalysisResultDto(Collections.emptyMap(), Collections.emptyList()));
  }

  /**
   * Get the document passed to the last analysisResult request
   *
   * @return the document identifier, or null if there was no request
   */
  public TextDocumentIdentifier getLastDocument() {
    return lastDocument;
  }
}
