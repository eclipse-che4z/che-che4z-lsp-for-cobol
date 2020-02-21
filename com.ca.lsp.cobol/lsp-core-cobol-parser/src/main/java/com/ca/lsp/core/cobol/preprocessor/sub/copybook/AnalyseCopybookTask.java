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
import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.impl.CobolPreprocessorImpl;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.RecursiveTask;

@Slf4j
public class AnalyseCopybookTask extends RecursiveTask<ResultWithErrors<CopybookSemanticContext>>
    implements EventObserver<FetchedCopybookEvent> {

  private transient DataBusBroker databus =
      LangServerCtx.getInjector().getInstance(DefaultDataBusBroker.class);

  private final String copyBookName;
  private String documentUri;
  private transient CopybookUsage copybookUsage;
  private transient List<CopybookUsage> copybookUsageTracker;
  private transient CompletableFuture<String> waitForResolving;

  public AnalyseCopybookTask(
      String documentUri, CopybookUsage copybookUsage, List<CopybookUsage> copybookUsageTracker) {
    this.documentUri = documentUri;
    this.copybookUsage = copybookUsage;
    copyBookName = copybookUsage.getName();
    this.copybookUsageTracker = copybookUsageTracker;
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
  public ResultWithErrors<CopybookSemanticContext> compute() {
    ResultWithErrors<SemanticContext> semanticContext;

    if (isCopybookInCache(copyBookName)) {
      semanticContext = parseCopybookFromCache();
    } else {
      Object subscriber = databus.subscribe(DataEventType.FETCHED_COPYBOOK_EVENT, this);
      databus.postData(
          RequiredCopybookEvent.builder().name(copyBookName).documentUri(documentUri).build());
      semanticContext = parseCopybook();
      databus.unSubscribe(subscriber);
    }
    return new ResultWithErrors<>(
        new CopybookSemanticContext(
            copyBookName,
            Optional.ofNullable(semanticContext).map(ResultWithErrors::getResult).orElse(null)),
        Optional.ofNullable(semanticContext)
            .map(ResultWithErrors::getErrors)
            .orElse(Collections.emptyList()));
  }

  private ResultWithErrors<SemanticContext> parseCopybook() {
    ResultWithErrors<SemanticContext> semanticContext = null;
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
            .name(copybookUsage.getName())
            .content(content)
            .uri(copybookUsage.getUri())
            .build());
  }

  private ResultWithErrors<SemanticContext> parseCopybookFromCache() {
    return parseCopybook(getContentFromCache());
  }

  private String getContentFromCache() {
    CopybookStorable cachedData =
        databus.getData(CopybookRepository.calculateUUID(new StringBuilder(copyBookName)));
    copybookUsage.setUri(cachedData.getUri());
    return cachedData.getContent();
  }

  private ResultWithErrors<SemanticContext> parseCopybook(String content) {
    List<CopybookUsage> nextTrackerIteration = new ArrayList<>(copybookUsageTracker);
    nextTrackerIteration.add(copybookUsage);
    ResultWithErrors<PreprocessedInput> preprocessedInput =
        getParser()
            .process(
                copybookUsage.getUri(),
                content,
                new SemanticContext(Collections.unmodifiableList(nextTrackerIteration)));
    return new ResultWithErrors<>(
        preprocessedInput.getResult().getSemanticContext(), preprocessedInput.getErrors());
  }

  private CobolPreprocessorImpl getParser() {
    return new CobolPreprocessorImpl();
  }

  @Override
  public void observerCallback(FetchedCopybookEvent adaptedDataEvent) {
    if (!copyBookName.equals(adaptedDataEvent.getName())) {
      return;
    }
    copybookUsage.setUri(adaptedDataEvent.getUri());
    waitForResolving.complete((adaptedDataEvent).getContent());
  }

  private boolean isCopybookInCache(String copyBookName) {
    return databus.isStored(CopybookRepository.calculateUUID(new StringBuilder(copyBookName)));
  }
}
