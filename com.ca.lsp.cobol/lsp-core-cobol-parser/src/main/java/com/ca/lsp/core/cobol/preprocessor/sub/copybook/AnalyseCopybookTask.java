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
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.extern.slf4j.Slf4j;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.RecursiveTask;

@Slf4j
public class AnalyseCopybookTask extends RecursiveTask<CopybookSemanticContext>
    implements IDataBusObserver<CblFetchEvent> {

  private static final IDataBusBroker DATABUS =
      LangServerCtx.getInjector().getInstance(DefaultDataBusBroker.class);

  private final String copyBookName;
  private final CobolPreprocessor.CobolSourceFormatEnum format;
  private final CompletableFuture<String> waitForResolving;

  AnalyseCopybookTask(String copyBookName, CobolPreprocessor.CobolSourceFormatEnum format) {

    this.copyBookName = copyBookName;
    this.format = format;
    waitForResolving = new CompletableFuture<>();
  }

  @Override
  public CopybookSemanticContext compute() {

    // TODO: Check if the semantic context is in cache or not.. if present don't engage the wsm

    DATABUS.subscribe(DataEventType.CBLFETCH_EVENT, this);
    DATABUS.postData(CblScanEvent.builder().name(copyBookName).build());
    return runParsing();
  }

  private CopybookSemanticContext runParsing() {
    SemanticContext result = null;
    try {
      String content = waitForResolving.get();
      if (content != null) {
        result = parseCopybook(content);

        // TODO: serialize paragraph definition (variable serialization is skipped for now..

        // MultiMapSerializableHelper.serialize(result.getParagraphs().getDefinitions());

        // TODO: add the result in cache

      }

    } catch (InterruptedException | ExecutionException e) {
      LOG.error("Error copybooks analysis for: " + copyBookName, e);
      Thread.currentThread().interrupt();
    }
    return new CopybookSemanticContext(copyBookName, result);
  }

  private SemanticContext parseCopybook(String content) {
    PreprocessedInput preprocessedInput =
        getParser().process(content, format, createParams(), new SemanticContext());
    return preprocessedInput.getSemanticContext();
  }

  private CobolParserParams createParams() {
    CobolParserParamsImpl cobolParserParams = new CobolParserParamsImpl();
    cobolParserParams.setIgnoreSyntaxErrors(true);
    return cobolParserParams;
  }

  private CobolPreprocessorImpl getParser() {
    return new CobolPreprocessorImpl();
  }

  @Override
  public void observerCallback(CblFetchEvent adaptedDataEvent) {
    if (!copyBookName.equals(adaptedDataEvent.getName())) {
      return;
    }
    waitForResolving.complete((adaptedDataEvent).getContent());
  }
}
