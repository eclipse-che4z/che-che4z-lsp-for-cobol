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

import java.util.List;
import java.util.Optional;
import org.eclipse.lsp.cobol.core.model.CopybookName;

/** Provide API definition to resolve for copybooks files present in CopyBook setting path. */
public interface CopybookNameService {

  /**
   * Get the resolved copybook names across the open workspace and copybook paths defined in
   * settings
   *
   * @return List of resolved copybook names
   */
  List<CopybookName> getNames();

  /**
   * Check if URI belongs to copybooks (defined by extension list)
   * and list of copybook folder (defined by copybook folder list)
   *
   * @param uri an attribute to check
   * @return true if URI belongs to known copybooks.
   */
  boolean isCopybook(String uri);

  /**
   * Find a first copybook in the list of copybookNames
   * that ordered by SettingsParametersEnum.CPY_EXTENSIONS list from client config
   * in the open workspace that match displayName
   * @param displayName an attribute to find by
   * @return optional CopybookName
   */
  Optional<CopybookName> findFirstByName(String displayName);

  /** Resolves the paths defined in Settings.json for cobol-lsp.cpy-manager.paths-local */
  void collectLocalCopybookNames();
}
