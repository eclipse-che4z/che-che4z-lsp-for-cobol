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

package com.ca.lsp.cobol.service.delegates.dependency;

import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;

import java.nio.file.Path;
import java.util.List;

/**
 * This interface defines the API to generate and update dependency file for copybook download
 * management
 */
public interface CopybookDependencyService {

  void invoke(RequiredCopybookEvent event, String requiredCopybookName, List<Path> targetPaths);

  boolean isFileInDidOpen(RequiredCopybookEvent event);

  void setWorkspaceFolderPaths(List<Path> workspaceFolderPaths);

  void generateDependencyFile(String cobolFileName);

  void updateDependencyList(Path dependencyFilePath, String requiredCopybookName);

  void addCopybookInDepFile(String requiredCopybookName, String documentUri);
}
