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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.cfg.CFASTBuilder;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisResultEvent;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.LspEvent;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.service.AnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.MessageType;

import java.util.List;
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
  private final DocumentModelService documentModelService;

  @Inject
  public AnalysisHandler(AsyncAnalysisService asyncAnalysisService, AnalysisService analysisService, CFASTBuilder cfastBuilder, Communications communications, DocumentModelService documentModelService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.analysisService = analysisService;
    this.cfastBuilder = cfastBuilder;
    this.communications = communications;
    this.documentModelService = documentModelService;
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
    String uri = UriHelper.decode(analysisResultEvent.getUri());
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
   * @return LspEvent.
   */
  public LspEvent<ExtendedApiResult> createEvent(JsonObject params) {
    return new LspEvent<ExtendedApiResult>() {
      final ImmutableList<LspEventDependency> lspEventDependencies;
      final AnalysisResultEvent analysisResultEvent;

      {
        analysisResultEvent = ofNullable(new Gson().fromJson(params.toString(), AnalysisResultEvent.class))
                .orElseGet(() -> new AnalysisResultEvent("", ""));
        String uri = UriHelper.decode(analysisResultEvent.getUri());
        if (documentModelService.get(uri) == null) {
          asyncAnalysisService.scheduleAnalysis(uri, analysisResultEvent.getText(), true);
        }
        lspEventDependencies = ImmutableList.of(
              asyncAnalysisService.createDependencyOn(UriHelper.decode(analysisResultEvent.getUri())));
      }

      @Override
      public List<LspEventDependency> getDependencies() {
        return lspEventDependencies;
      }

      @Override
      public ExtendedApiResult execute() throws ExecutionException, InterruptedException {
        return AnalysisHandler.this.analysis(analysisResultEvent);
      }
    };
  }

}
