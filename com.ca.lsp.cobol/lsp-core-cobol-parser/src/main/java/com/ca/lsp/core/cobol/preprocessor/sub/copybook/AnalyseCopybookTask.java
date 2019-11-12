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
import com.broadcom.lsp.domain.cobol.databus.api.ICpyRepository;
import com.broadcom.lsp.domain.cobol.databus.api.IDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.api.IDataBusObserver;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.*;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.preprocessor.sub.util.impl.MultiMapSerializableHelper;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;
import java.util.Set;
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

  public AnalyseCopybookTask(String copyBookName, CobolPreprocessor.CobolSourceFormatEnum format) {

    this.copyBookName = copyBookName;
    this.format = format;
    waitForResolving = new CompletableFuture<>();
  }

  /**
   * - check if copybook name is already present in cache. If present grab the content from the
   * cache and create a new fetcher event with the content populated without involve the workspace
   * manager. involved - if not present - post scan event on the databus -- workspace manager
   * retrieve the content + create fetcher event on databus - populate the cache with retrived
   * content
   *
   * @return SemanticContext populated for copybooks
   */
  @Override
  public CopybookSemanticContext compute() {
    SemanticContext semanticContext;
    DATABUS.subscribe(DataEventType.CBLFETCH_EVENT, this);
    boolean isCopybookInCache = isCopybookInCache(copyBookName);

    if (isCopybookInCache) {
      semanticContext = parseCopybookFromCache();
    } else {
      DATABUS.postData(CblScanEvent.builder().name(copyBookName).build());
      semanticContext = parseCopybook();
    }
    return new CopybookSemanticContext(copyBookName, semanticContext);
  }

  private SemanticContext parseCopybook() {
    SemanticContext semanticContext = null;
    String content = null;
    try {
      content = waitForResolving.get();
      if (content != null) {
        semanticContext = parseCopybook(content);
      }

    } catch (InterruptedException | ExecutionException e) {
      LOG.error("Error copybooks analysis for: " + copyBookName, e);
      Thread.currentThread().interrupt();
    }

    // populate cache with content retrived from scan analysis
    if (semanticContext != null) {
      populateCacheWithCopybookContents(
          copyBookName,
          content,
          MultiMapSerializableHelper.serializeInHashMap(
              semanticContext.getParagraphs().getDefinitions()));
    }
    return semanticContext;
  }

  private void populateCacheWithCopybookContents(
      String copyBookName, String content, Map<String, Set<Position>> mapPraragraphDefinitions) {
    DATABUS.storeData(
        CpyStorable.builder()
            .name(copyBookName)
            .content(content)
            .paragraphPosition(mapPraragraphDefinitions)
            .build());
  }

  private SemanticContext parseCopybookFromCache() {
    return parseCopybook(getContentFromCache());
  }

  private String getContentFromCache() {
    return DATABUS
        .getData(ICpyRepository.calculateUUID(new StringBuilder(copyBookName)))
        .getContent();
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

  private boolean isCopybookInCache(String copyBookName) {
    return DATABUS.isStored(ICpyRepository.calculateUUID(new StringBuilder(copyBookName)));
  }
}
