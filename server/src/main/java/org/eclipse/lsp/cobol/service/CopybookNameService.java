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
package org.eclipse.lsp.cobol.service;

import java.util.List;

/** Provide API definition to resolve for copybooks files present in CopyBook setting path. */
public interface CopybookNameService {

  /**
   * Get the resolved copybook names across the open workspace and copybook paths defined in
   * settings
   *
   * @return List of resolved copybook names
   */
  List<String> getNames();

  /** Resolves the paths defined in Settings.json for cobol-lsp.cpy-manager.paths-local */
  void collectLocalCopybookNames();
}
