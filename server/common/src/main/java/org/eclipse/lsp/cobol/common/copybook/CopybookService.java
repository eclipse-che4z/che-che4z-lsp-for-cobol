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
package org.eclipse.lsp.cobol.common.copybook;

import lombok.NonNull;
import org.eclipse.lsp.cobol.common.ResultWithErrors;

/**
 * Provide API definition to search for copybooks files. The service also caches copybook to reduce
 * filesystem load.
 */
public interface CopybookService {
  String FILE_BASENAME_VARIABLE = "${fileBasenameNoExtension}";
  /** Remove all the stored copybook. */
  void invalidateCache();

  /**
   * Retrieve and return the copybook by its name.
   * Returns a CopybookModel and preprocessed errors for the resolved copybook wrapped inside {@link ResultWithErrors}.
   *
   * @param copybookId - the id of the copybook to be retrieved
   * @param copybookName - the name of the copybook to be retrieved
   * @param programDocumentUri - the currently processing program document
   * @param documentUri - the currently processing document that contains the copy statement
   * @param copybookConfig - contains config info like: copybook processing mode, target backend sql
   *     server
   * @param preprocess - indicates if copybook needs to be preprocessed after resolving
   * @return a CopybookModel wrapped inside {@link ResultWithErrors} which contains copybook name, its URI and the content.
   *         Wrapped errors are preprocessed errors for the returned CopybookModel.
   */
  ResultWithErrors<CopybookModel> resolve(
      @NonNull CopybookId copybookId,
      @NonNull CopybookName copybookName,
      @NonNull String programDocumentUri,
      @NonNull String documentUri,
      @NonNull CopybookConfig copybookConfig,
      boolean preprocess);

  /**
   * Store the copybookModel in cache. Copybook depends on a document from where it is imported.
   *
   * @param copybookModel the copybook model
   */
  void store(CopybookModel copybookModel);

  /**
   * Store the copybookModel in cache. Copybook depends on a document from where it is imported.
   *
   * @param copybookModel the copybook model
   * @param doCleanUp is copybook clean up required before storing copybookModel.
   */
  void store(CopybookModel copybookModel, boolean doCleanUp);
}
