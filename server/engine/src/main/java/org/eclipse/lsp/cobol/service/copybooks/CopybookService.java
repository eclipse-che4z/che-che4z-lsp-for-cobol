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
package org.eclipse.lsp.cobol.service.copybooks;

import org.eclipse.lsp.cobol.core.model.CopybookModel;

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.CopybookName;

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
   * @param programDocumentUri - the currently processing program document
   * @param documentUri - the currently processing document that contains the copy statement
   * @param copybookConfig - contains config info like: copybook processing mode, target backend sql server
   * @param preprocess - indicates if copybook needs to be preprocessed after resolving
   * @return a CopybookModel that contains copybook name, its URI and the content
   */
  CopybookModel resolve(
      @NonNull CopybookName copybookName,
      @NonNull String programDocumentUri,
      @NonNull String documentUri,
      @NonNull CopybookConfig copybookConfig,
      boolean preprocess);

  /**
   * Store the copybookModel in cache. Copybook depends on a document from where it is imported.
   *
   * @param copybookModel the copybook model
   * @param documentUri is a URI of a document from where the copybook is imported.
   */
  void store(CopybookModel copybookModel, String documentUri);
}
