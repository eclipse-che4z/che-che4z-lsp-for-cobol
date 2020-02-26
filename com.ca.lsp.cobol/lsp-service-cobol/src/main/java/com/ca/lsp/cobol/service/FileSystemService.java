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

import java.io.IOException;
import java.util.List;

public interface FileSystemService extends EventObserver<RequiredCopybookEvent> {
  String getContentByCopybookName(String copybookName, String profile, List<String> datasetList)
      throws IOException;

  void setWorkspaceFolders(List<WorkspaceFolder> workspaceFolders);
}
