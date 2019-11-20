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
import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusObserver;
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.model.DataEventType;
import com.broadcom.lsp.domain.cobol.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.model.RequiredCopybookEvent;
import com.ca.lsp.core.cobol.model.CopybookDefinition;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.params.CobolParserParams;
import com.ca.lsp.core.cobol.params.impl.CobolParserParamsImpl;
import com.ca.lsp.core.cobol.parser.listener.PreprocessorListener;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.RecursiveTask;

@Slf4j
public class AnalyseCopybookTask extends RecursiveTask<CopybookSemanticContext>
    implements DataBusObserver<FetchedCopybookEvent> {

  private final DataBusBroker databus =
      LangServerCtx.getInjector().getInstance(DefaultDataBusBroker.class);

  private final String copyBookName;
  private final CopybookDefinition copybookDefinition;
  private final List<CopybookDefinition> copybookUsageTracker;
  private final CobolPreprocessor.CobolSourceFormatEnum format;
  private final PreprocessorListener listener;
  private final CompletableFuture<String> waitForResolving;

  public AnalyseCopybookTask(
      CopybookDefinition copybookDefinition,
      List<CopybookDefinition> copybookUsageTracker,
      CobolPreprocessor.CobolSourceFormatEnum format,
      PreprocessorListener listener) {
    this.copybookDefinition = copybookDefinition;
    copyBookName = copybookDefinition.getName();
    this.copybookUsageTracker = copybookUsageTracker;
    this.format = format;
    this.listener = listener;
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

    if (isCopybookInCache(copyBookName)) {
      semanticContext = parseCopybookFromCache();
    } else {
      databus.subscribe(DataEventType.FETCHED_COPYBOOK_EVENT, this);
      databus.postData(RequiredCopybookEvent.builder().name(copyBookName).build());
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

    // populate cache with content retrieved from scan analysis
    if (semanticContext != null) {
      populateCacheWithCopybookContents(content);
    }
    return semanticContext;
  }

  private void populateCacheWithCopybookContents(String content) {
    databus.storeData(
        CopybookStorable.builder()
            .name(copybookDefinition.getName())
            .content(content)
            .uri(copybookDefinition.getUri())
            .build());
  }

  private SemanticContext parseCopybookFromCache() {
    return parseCopybook(getContentFromCache());
  }

  private String getContentFromCache() {
    CopybookStorable cachedData =
        databus.getData(CopybookRepository.calculateUUID(new StringBuilder(copyBookName)));
    copybookDefinition.setUri(cachedData.getUri());
    return cachedData.getContent();
  }

  private SemanticContext parseCopybook(String content) {
    List<CopybookDefinition> nextTrackerIteration = new ArrayList<>(copybookUsageTracker);
    nextTrackerIteration.add(copybookDefinition);
    PreprocessedInput preprocessedInput =
        getParser()
            .process(
                content,
                format,
                createParams(),
                new SemanticContext(Collections.unmodifiableList(nextTrackerIteration)));
    return preprocessedInput.getSemanticContext();
  }

  private CobolParserParams createParams() {
    CobolParserParamsImpl cobolParserParams = new CobolParserParamsImpl();
    cobolParserParams.setIgnoreSyntaxErrors(true);
    return cobolParserParams;
  }

  private CobolPreprocessorImpl getParser() {
    CobolPreprocessorImpl cobolPreprocessor = new CobolPreprocessorImpl();
    cobolPreprocessor.setListener(listener);
    return cobolPreprocessor;
  }

  @Override
  public void observerCallback(FetchedCopybookEvent adaptedDataEvent) {
    if (!copyBookName.equals(adaptedDataEvent.getName())) {
      return;
    }
    copybookDefinition.setUri(adaptedDataEvent.getUri());
    waitForResolving.complete((adaptedDataEvent).getContent());
  }

  private boolean isCopybookInCache(String copyBookName) {
    return databus.isStored(CopybookRepository.calculateUUID(new StringBuilder(copyBookName)));
  }
}
