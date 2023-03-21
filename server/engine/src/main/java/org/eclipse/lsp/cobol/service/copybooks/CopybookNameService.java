/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service.copybooks;

import org.eclipse.lsp.cobol.common.copybook.CopybookName;

import javax.annotation.Nullable;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;

/** Provide API definition to resolve for copybooks files present in CopyBook setting path. */
public interface CopybookNameService {

  /**
   * Get resolved copybook names across the open workspace and copybook paths defined in
   * settings
   * @param documentUri the URI to the current document in case we will have a program name variable in path list.
   *
   * @return List of resolved copybook names
   */
  List<CopybookName> getNames(@Nullable String documentUri);

  /**
   * Get copybook folders paths based on local settings (paths, dialects etc)
   * @param documentUri URI of main program file. If it's null the method will return no file specific settings
   * @return List of copybook folders
   */
  CompletableFuture<List<String>> copybookLocalFolders(@Nullable String documentUri);

  /**
   * Find copybook in the list of unique copybookNames
   * in the open workspace that match displayName
   * @param documentUri URI of main program file
   * @param displayName an attribute to find by
   * @return optional CopybookName
   */
  Optional<CopybookName> findByName(String documentUri, String displayName);

  /** Resolves the paths defined in Settings.json for cobol-lsp.cpy-manager.paths-local */
  void collectLocalCopybookNames();
}
