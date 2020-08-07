/*
 * Copyright (c) 2020 Broadcom.
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

import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.core.cobol.model.CopybookSemanticContext;
import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.PreprocessedInput;
import com.ca.lsp.core.cobol.model.ResultWithErrors;
import com.ca.lsp.core.cobol.preprocessor.CobolPreprocessor;
import com.ca.lsp.core.cobol.semantics.SemanticContext;
import com.google.inject.Inject;
import com.google.inject.assistedinject.Assisted;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.RecursiveTask;

import static java.util.Collections.emptyList;
import static java.util.Collections.unmodifiableList;
import static java.util.Optional.ofNullable;

/**
 * Represent the ForkJoinTask that is executed in parallel for address copybooks duties It uses a
 * {@link DataBusBroker} to communicate with other modules
 */
@Slf4j
public class AnalyseCopybookTask extends RecursiveTask<ResultWithErrors<CopybookSemanticContext>>
    implements EventObserver<FetchedCopybookEvent> {

  private transient DataBusBroker databus;
  private final String copyBookName;
  private String documentUri;
  private transient CopybookUsage copybookUsage;
  private transient List<CopybookUsage> copybookUsageTracker;
  private transient CompletableFuture<String> waitForResolving;
  private String copybookProcessingMode;
  private transient CobolPreprocessor preprocessor;

  @Inject
  public AnalyseCopybookTask(
      DataBusBroker databus,
      CobolPreprocessor preprocessor,
      @Assisted("documentUri") String documentUri,
      @Assisted("copybookUsage") CopybookUsage copybookUsage,
      @Assisted("copybookUsageTracker") List<CopybookUsage> copybookUsageTracker,
      @Assisted("copybookProcessingMode") String copybookProcessingMode) {
    this.documentUri = documentUri;
    this.copybookUsage = copybookUsage;
    copyBookName = copybookUsage.getName();
    this.copybookUsageTracker = copybookUsageTracker;
    this.copybookProcessingMode = copybookProcessingMode;
    this.preprocessor = preprocessor;
    waitForResolving = new CompletableFuture<>();
    this.databus = databus;
  }

  /**
   * Check if copybook name already presents in the cache. If presents, grab the content from the
   * cache and parse without involving the workspace manager. If not present - post a scan event on
   * the data bus for workspace manager to retrieve the content and post fetch event on data bus to
   * populate the cache with the retrieved content.
   *
   * @return SemanticContext with errors (if found) populated for copybooks.
   */
  @Override
  public ResultWithErrors<CopybookSemanticContext> compute() {
    ResultWithErrors<SemanticContext> semanticContext;

    if (isCopybookInCache(copyBookName)) {
      semanticContext = parseCopybookFromCache();
    } else {
      Object subscriber = databus.subscribe(DataEventType.FETCHED_COPYBOOK_EVENT, this);
      databus.postData(
          RequiredCopybookEvent.builder()
              .name(copyBookName)
              .documentUri(documentUri)
              .copybookProcessingMode(copybookProcessingMode)
              .build());
      semanticContext = parseCopybook();
      databus.unSubscribe(subscriber);
    }

    return new ResultWithErrors<>(
        new CopybookSemanticContext(
            copyBookName,
            ofNullable(semanticContext).map(ResultWithErrors::getResult).orElse(null)),
        ofNullable(semanticContext).map(ResultWithErrors::getErrors).orElse(emptyList()));
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

    // populate the cache with content retrieved while analysis
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
        preprocessor.process(
            copybookUsage.getUri(),
            content,
            new SemanticContext(unmodifiableList(nextTrackerIteration)),
            copybookProcessingMode);
    return new ResultWithErrors<>(
        preprocessedInput.getResult().getSemanticContext(), preprocessedInput.getErrors());
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
