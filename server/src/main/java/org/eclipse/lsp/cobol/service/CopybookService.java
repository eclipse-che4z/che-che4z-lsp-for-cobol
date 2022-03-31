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
package org.eclipse.lsp.cobol.service;

import org.eclipse.lsp.cobol.core.model.CopybookModel;

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.copybooks.analysis.CopybookName;

/**
 * Provide API definition to search for copybooks files. The service also caches copybook to reduce
 * filesystem load.
 */
public interface CopybookService {
  /** Remove all the stored copybook. */
  void invalidateCache();

  /**
   * Retrieve and return the copybook by its name.
   *
   * @param copybookName - the name of the copybook to be retrieved
   * @param documentUri - the currently processing document that contains the copy statement
   * @param copybookConfig - contains config info like: copybook processing mode, target backend sql server
   * @return a CopybookModel that contains copybook name, its URI and the content
   */
  CopybookModel resolve(
      @NonNull CopybookName copybookName,
      @NonNull String documentUri,
      @NonNull CopybookConfig copybookConfig);

  /**
   * Store the copybookModel in cache.
   *
   * @param copybookModel the copybook model
   */
  void store(CopybookModel copybookModel);
}
