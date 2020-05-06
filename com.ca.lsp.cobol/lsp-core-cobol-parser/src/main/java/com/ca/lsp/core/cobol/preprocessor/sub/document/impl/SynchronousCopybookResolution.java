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

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.*;
import com.ca.lsp.core.cobol.model.CopybookModel;
import com.ca.lsp.core.cobol.preprocessor.sub.document.CopybookResolution;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

@Slf4j
public class SynchronousCopybookResolution
    implements CopybookResolution, EventObserver<FetchedCopybookEvent> {

  private CompletableFuture<CopybookModel> waitForResolving = null;
  private String copybookName;
  private DataBusBroker broker;

  SynchronousCopybookResolution(DataBusBroker broker) {
    this.broker = broker;
    broker.subscribe(DataEventType.FETCHED_COPYBOOK_EVENT, this);
  }

  @Nullable
  @Override
  public CopybookModel resolve(
      @Nullable String copybookName,
      @Nonnull String documentUri,
      @Nonnull String textDocumentSyncType) {
    waitForResolving = new CompletableFuture<>();
    this.copybookName = copybookName;
    broker.postData(
        RequiredCopybookEvent.builder()
            .name(copybookName)
            .documentUri(documentUri)
            .textDocumentSyncType(textDocumentSyncType)
            .build());
    broker.postData(
        CopybookDepEvent.builder()
            .copybookName(copybookName)
            .documentUri(documentUri)
            .textDocumentSync(textDocumentSyncType)
            .build());
    try {
      return waitForResolving.get();
    } catch (InterruptedException | ExecutionException e) {
      LOG.error("Error resolving copybook: ", e);
      Thread.currentThread().interrupt();
      return null;
    }
  }

  @Override
  public void observerCallback(FetchedCopybookEvent event) {
    if (!copybookName.equals(event.getName())) {
      return;
    }
    waitForResolving.complete(
        new CopybookModel(event.getName(), event.getUri(), event.getContent()));
    broker.unSubscribe(this);
  }
}
