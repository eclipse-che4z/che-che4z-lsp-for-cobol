/*
 * Copyright (c) 2019 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 */
package com.ca.lsp.core.cobol.preprocessor.sub.copybook;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.domain.cobol.databus.api.IDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CblFetchEvent;
import com.broadcom.lsp.domain.cobol.model.CblScanEvent;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CobolSemanticParser;
import com.ca.lsp.core.cobol.preprocessor.sub.document.impl.CobolSemanticParserImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.RecursiveTask;

@Slf4j
public class AnalyseCopybookTask extends RecursiveTask<SemanticContext>
    implements IDataBusObserver<CblFetchEvent> {

  private static final IDataBusBroker DATABUS =
      LangServerCtx.getInjector()
          .getInstance(DefaultDataBusBroker.class);

  private String copyBookName;
  private CobolParserParams params;
  private CobolPreprocessor.CobolSourceFormatEnum format;
  private CompletableFuture<String> waitForResolving;

  AnalyseCopybookTask(
      String copyBookName,
      CobolParserParams params,
      CobolPreprocessor.CobolSourceFormatEnum format) {

    this.copyBookName = copyBookName;
    this.params = params;
    this.format = format;
    waitForResolving = new CompletableFuture<>();
  }

  @Override
  public SemanticContext compute() {
    DATABUS.subscribe(DataEventType.CBLFETCH_EVENT, this);
    DATABUS.postData(CblScanEvent.builder().name(copyBookName).build());
    return runParsing();
  }

  private SemanticContext runParsing() {
    try {
      String content = waitForResolving.get();
      CobolSemanticParser parser = getCobolSemanticParser();
      PreprocessedInput preprocessedInput = parser.processLines(content, format, params);
      return preprocessedInput.getSemanticContext();
    } catch (InterruptedException | ExecutionException e) {
      LOG.error("Error copybooks analysis for: " + copyBookName, e);
      Thread.currentThread().interrupt();
      return new SemanticContext();
    }
  }

  private CobolSemanticParser getCobolSemanticParser() {
    return new CobolSemanticParserImpl(new SemanticContext());
  }

  @Override
  public void observerCallback(CblFetchEvent adaptedDataEvent) {
    if (!copyBookName.equals(adaptedDataEvent.getName())) {
      return;
    }
    waitForResolving.complete((adaptedDataEvent).getContent());
  }
}
