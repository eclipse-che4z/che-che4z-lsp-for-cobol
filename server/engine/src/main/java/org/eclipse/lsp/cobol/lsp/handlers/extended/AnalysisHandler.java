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
package org.eclipse.lsp.cobol.lsp.handlers.extended;

import com.google.common.collect.ImmutableList;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.inject.Inject;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisResultEvent;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.MessageType;

import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static java.util.Optional.ofNullable;

/**
 * Our Extension to LSP Analysis Handler
 */
@Slf4j
public class AnalysisHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final AnalysisService analysisService;
  private final CFASTBuilder cfastBuilder;
  private final Communications communications;

  @Inject
  public AnalysisHandler(AsyncAnalysisService asyncAnalysisService, AnalysisService analysisService, CFASTBuilder cfastBuilder, Communications communications) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.analysisService = analysisService;
    this.cfastBuilder = cfastBuilder;
    this.communications = communications;
  }

  /**
   * Handle analysis request from our LSP extension
   *
   * @param json request params
   * @return ExtendedApiResult
   * @throws ExecutionException   forward the exception
   * @throws InterruptedException forward the exception
   */
  public ExtendedApiResult analysis(@NonNull JsonObject json) throws ExecutionException, InterruptedException {
    AnalysisResultEvent event =
            ofNullable(new Gson().fromJson(json.toString(), AnalysisResultEvent.class))
                    .orElseGet(() -> new AnalysisResultEvent("", ""));

    String uri = UriHelper.decode(event.getUri());
    Optional<CompletableFuture<CobolDocumentModel>> optionalDoc = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(uri);
    CobolDocumentModel doc;
    if (optionalDoc.isPresent()) {
      doc = optionalDoc.get().get();
    } else {
      doc = asyncAnalysisService.scheduleAnalysis(uri, event.getText(), 0, true).get();
    }
    return Optional.ofNullable(doc)
            .map(CobolDocumentModel::getAnalysisResult)
            .map(AnalysisResult::getRootNode)
            .map(cfastBuilder::build)
            .orElseGet(() -> {
              if (analysisService.isCopybook(uri, event.getText())) {
                communications.notifyGeneralMessage(MessageType.Info, "Cannot retrieve outline tree because file was treated as a copybook");
              }
              return new ExtendedApiResult(ImmutableList.of());
            });
  }
}
