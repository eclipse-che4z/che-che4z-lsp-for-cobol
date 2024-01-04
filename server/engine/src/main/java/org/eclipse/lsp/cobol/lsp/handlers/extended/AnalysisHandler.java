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

import static java.util.Optional.ofNullable;

import com.google.common.collect.ImmutableList;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.inject.Inject;
import java.util.List;
import java.util.concurrent.ExecutionException;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisResultEvent;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.AnalysisQuery;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp4j.MessageType;

/**
 * Our Extension to LSP Analysis Handler
 */
@Slf4j
public class AnalysisHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final AnalysisService analysisService;
  private final CFASTBuilder cfastBuilder;
  private final Communications communications;
  private final DocumentModelService documentModelService;
  private final UriDecodeService uriDecodeService;

  @Inject
  public AnalysisHandler(AsyncAnalysisService asyncAnalysisService, AnalysisService analysisService, CFASTBuilder cfastBuilder, Communications communications, DocumentModelService documentModelService, UriDecodeService uriDecodeService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.analysisService = analysisService;
    this.cfastBuilder = cfastBuilder;
    this.communications = communications;
    this.documentModelService = documentModelService;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle analysis request from our LSP extension
   *
   * @param analysisResultEvent request params
   * @return ExtendedApiResult
   * @throws ExecutionException   forward the exception
   * @throws InterruptedException forward the exception
   */
  public ExtendedApiResult analysis(AnalysisResultEvent analysisResultEvent) throws ExecutionException, InterruptedException {
    String uri = uriDecodeService.decode(analysisResultEvent.getUri());
    CobolDocumentModel doc = documentModelService.get(uri);
    if (analysisService.isCopybook(uri, analysisResultEvent.getText())) {
      communications.notifyGeneralMessage(MessageType.Info, "Cannot retrieve outline tree because file was treated as a copybook");
      return new ExtendedApiResult(ImmutableList.of());
    }
    Node rootNode = doc.getLastAnalysisResult().getRootNode();
    return cfastBuilder.build(rootNode);
  }

  /**
   * Create LSP analysis event.
   *
   * @param params request params
   * @return LspNotification.
   */
  public LspQuery<ExtendedApiResult> createEvent(JsonObject params) {
    return new AnalysisQuery(params, this);
  }

  /**
   * Dependency data for {@link AnalysisQuery} event. Allow to postpone the execution.
   * @param params
   * @return list of {@link LspEventDependency}
   */
  public List<LspEventDependency> getDependencies(JsonObject params) {
    AnalysisResultEvent analysisResultEvent = ofNullable(new Gson().fromJson(params.toString(), AnalysisResultEvent.class))
            .orElseGet(() -> new AnalysisResultEvent("", ""));
    String uri = uriDecodeService.decode(analysisResultEvent.getUri());
    if (documentModelService.get(uri) == null) {
      asyncAnalysisService.scheduleAnalysis(uri, analysisResultEvent.getText(), true);
    }
    return ImmutableList.of(
            asyncAnalysisService.createDependencyOn(uriDecodeService.decode(analysisResultEvent.getUri())));
  }

}
