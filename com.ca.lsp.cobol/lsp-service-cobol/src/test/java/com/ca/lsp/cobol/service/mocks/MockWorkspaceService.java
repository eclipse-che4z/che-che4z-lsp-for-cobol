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
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.cobol.service.mocks;

import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import lombok.Setter;
import org.eclipse.lsp4j.DidChangeConfigurationParams;
import org.eclipse.lsp4j.DidChangeWatchedFilesParams;
import org.eclipse.lsp4j.services.WorkspaceService;

/**
 * This class is used to mock the actual behavior of {@link
 * org.eclipse.lsp4j.services.WorkspaceService} by returning the predefined values. It requires the
 * {@link CobolTextRegistry} as a provider of copybooks. This class is a singleton to allow external
 * configuration after injecting using DI.
 *
 * <p>Notice: singleton implementation with the shared state may cause some dirty-environment
 * problems, so remember to re-configure the instance if you are working on some test case with
 * copybooks
 */
@Singleton
public class MockWorkspaceService implements WorkspaceService {
  @Setter private CopybooksMock copybooks;
  private final DataBusBroker dataBus;

  @Inject
  public MockWorkspaceService(DataBusBroker dataBus) {
    this.dataBus = dataBus;
  }

  @Override
  public void didChangeConfiguration(DidChangeConfigurationParams didChangeConfigurationParams) {}

  @Override
  public void didChangeWatchedFiles(DidChangeWatchedFilesParams didChangeWatchedFilesParams) {}
}
