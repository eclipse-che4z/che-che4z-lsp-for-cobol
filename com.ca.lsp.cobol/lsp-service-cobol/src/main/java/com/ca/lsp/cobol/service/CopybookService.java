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

import com.broadcom.lsp.domain.cobol.event.api.EventObserver;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import org.eclipse.lsp4j.WorkspaceFolder;

import java.nio.file.Path;
import java.util.List;

/**
 * Provide API definition to search for copybooks files and define the workspace folder opened in
 * the client when the LSP server is triggered.
 */
public interface CopybookService extends EventObserver<RequiredCopybookEvent> {
  Path findCopybook(String fileName);

  Path findCopybook(String filename, List<String> paths);

  void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders);
}
