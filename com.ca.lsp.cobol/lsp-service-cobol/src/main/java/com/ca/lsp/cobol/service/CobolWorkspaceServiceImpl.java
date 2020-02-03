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
package com.ca.lsp.cobol.service;

import com.broadcom.lsp.domain.cobol.databus.impl.DefaultDataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RunAnalysisEvent;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;

import javax.annotation.Nonnull;
import java.io.IOException;

@Slf4j
@Singleton
public class CobolWorkspaceServiceImpl implements CobolWorkspaceService {
  private final DefaultDataBusBroker dataBus;

  @Inject
  public CobolWorkspaceServiceImpl(DefaultDataBusBroker dataBus) {
    this.dataBus = dataBus;
    dataBus.subscribe(DataEventType.REQUIRED_COPYBOOK_EVENT, this);
  }

  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams params) {
    throw new UnsupportedOperationException("Functionality not implemented yet");
  }

  @Override
  public void didChangeWatchedFiles(@Nonnull DidChangeWatchedFilesParams params) {
    dataBus.invalidateCache();
    log.info("Cache invalidated due to a copybooks file watcher was triggered");
    dataBus.postData(new RunAnalysisEvent());
  }

  // TODO: Should be removed due to a change of responsability for this class..
  @Override
  public String getContentByCopybookName(String copybookName) throws IOException {
    return null;
  }

  // TODO: Should be removed due to a change of responsability for this class..
  @Override
  public void observerCallback(RequiredCopybookEvent adaptedDataEvent) {}
}
