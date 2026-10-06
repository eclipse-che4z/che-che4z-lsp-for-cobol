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
package org.eclipse.lsp.cobol.lsp.jrpc;

import com.google.gson.JsonObject;

import java.util.concurrent.CompletableFuture;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDto;
import org.eclipse.lsp.cobol.lsp.LspMessageBroker;
import org.eclipse.lsp.cobol.lsp.handlers.extended.AnalysisHandler;
import org.eclipse.lsp.cobol.lsp.handlers.extended.AnalysisResultHandler;
import org.eclipse.lsp4j.TextDocumentIdentifier;

/**
 * Extended services
 */
@Slf4j
@Singleton
public class ExtendedApiService implements ExtendedApi {

  private final AnalysisHandler analysisHandler;
  private final AnalysisResultHandler analysisResultHandler;
  private final LspMessageBroker lspMessageBroker;

  @Inject
  public ExtendedApiService(
      AnalysisHandler analysisHandler,
      AnalysisResultHandler analysisResultHandler,
      LspMessageBroker lspMessageBroker) {
    this.analysisHandler = analysisHandler;
    this.analysisResultHandler = analysisResultHandler;
    this.lspMessageBroker = lspMessageBroker;
  }

  /**
   * @param json represents the request object in the json format
   * @return
   */
  @Override
  public CompletableFuture<ExtendedApiResult> analysis(@NonNull JsonObject json) {
    return lspMessageBroker.query(analysisHandler.createEvent(json));
  }

  /**
   * @param textDocumentIdentifier object with the document uri
   * @return
   */
  @Override
  public CompletableFuture<AnalysisResultDto> analysisResult(
      @NonNull TextDocumentIdentifier textDocumentIdentifier) {
    return lspMessageBroker.query(
        analysisResultHandler.createAnalysisEvent(textDocumentIdentifier.getUri()));
  }
}
