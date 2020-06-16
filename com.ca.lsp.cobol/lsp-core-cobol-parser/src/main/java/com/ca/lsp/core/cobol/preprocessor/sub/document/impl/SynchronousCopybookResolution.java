/*
 * Copyright (c) 2020 Broadcom.
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

package com.ca.lsp.core.cobol.preprocessor.sub.document.impl;

import com.broadcom.lsp.domain.cobol.databus.api.CopybookRepository;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.databus.model.CopybookStorable;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.core.cobol.model.CopybookModel;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

import static com.broadcom.lsp.domain.cobol.event.model.DataEventType.FETCHED_COPYBOOK_EVENT;
import static java.lang.Thread.currentThread;
import static java.util.Optional.ofNullable;

/**
 * This class uses the data bus to retrieve the content of the given copybook. If the copybook has
 * already been retrieved, then it is taking out of the cache. The instances are disposable and
 * cannot be reused. To create an instance, use the {@link CopybookResolutionProvider}. It uses a
 * {@link CompletableFuture} to synchronize the interaction with the data bus.
 */
@Slf4j
public class SynchronousCopybookResolution
    implements CopybookResolution, EventObserver<FetchedCopybookEvent> {
  private static final String EXCEPTION_MESSAGE = "Copybook resolution instance cannot be reused";

  private DataBusBroker broker;

  private CompletableFuture<CopybookModel> waitForResolving;
  private String copybookName;

  SynchronousCopybookResolution(DataBusBroker broker) {
    this.broker = broker;
    broker.subscribe(FETCHED_COPYBOOK_EVENT, this);
  }

  /**
   * Retrieve and return the copybook by its name. Copybook may cached to limit interactions with
   * the file system.
   *
   * @param copybookName - the name of the copybook to be retrieved
   * @param documentUri - the currently processing document that contains the copy statement
   * @param syncType - text document synchronization type
   * @return a CopybookModel that contains copybook name, its URI and the content; or null in case
   *     of severe issue.
   * @throws IllegalStateException if the instance reused.
   */
  @Nullable
  @Override
  public CopybookModel resolve(
      @Nonnull String copybookName, @Nonnull String documentUri, @Nonnull String syncType) {
    checkState();

    if (isCopybookInCache(copybookName)) {
      broker.unSubscribe(this);
      return getContentFromCache(copybookName);
    }

    this.copybookName = copybookName;
    waitForResolving = new CompletableFuture<>();
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(copybookName)
            .documentUri(documentUri)
            .textDocumentSyncType(syncType)
            .build());
    try {
      return waitForResolving.get();
    } catch (InterruptedException | ExecutionException e) {
      LOG.error("Error resolving copybook: ", e);
      currentThread().interrupt();
      return null;
    }
  }

  @Override
  public void observerCallback(@Nonnull FetchedCopybookEvent event) {
    if (copybookName == null) {
      LOG.warn("A disposed instance of copybook resolver used: " + toString());
      return;
    }
    String name = event.getName();
    String uri = event.getUri();
    String content = event.getContent();

    if (!copybookName.equals(name)) {
      return;
    }
    broker.unSubscribe(this);
    ofNullable(content).ifPresent(it -> broker.storeData(new CopybookStorable(name, uri, content)));
    waitForResolving.complete(new CopybookModel(name, uri, content));
  }

  /**
   * If the waitForResolving was, then it means that this instance already used and unsubscribed
   * from the data bus, so it won't work.
   */
  private void checkState() {
    ofNullable(waitForResolving)
        .ifPresent(
            it -> {
              throw new IllegalStateException(EXCEPTION_MESSAGE);
            });
  }

  private boolean isCopybookInCache(@Nonnull String copyBookName) {
    return broker.isStored(CopybookRepository.calculateUUID(copyBookName));
  }

  @Nonnull
  private CopybookModel getContentFromCache(@Nonnull String name) {
    return convertToModel(broker.getData(CopybookRepository.calculateUUID(name)));
  }

  @Nonnull
  private CopybookModel convertToModel(@Nonnull CopybookStorable storable) {
    return new CopybookModel(storable.getName(), storable.getUri(), storable.getContent());
  }
}
