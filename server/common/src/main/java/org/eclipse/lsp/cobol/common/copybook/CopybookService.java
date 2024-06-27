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

import java.util.Collection;
import java.util.Set;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;

/**
 * Provide API definition to search for copybooks files. The service also caches copybook to reduce
 * filesystem load.
 */
public interface CopybookService {
  String FILE_BASENAME_VARIABLE = "${fileBasenameNoExtension}";
  /** Remove all the stored copybook. */
  void invalidateCache(boolean onlyNonImplicit);

  void invalidateCache(CopybookId copybookId);

  /**
   * Retrieve and return the copybook by its name.
   * Returns a CopybookModel and preprocessed errors for the resolved copybook wrapped inside {@link ResultWithErrors}.
   *
   * @param copybookId         - the id of the copybook to be retrieved
   * @param copybookName       - the name of the copybook to be retrieved
   * @param programDocumentUri - the currently processing program document
   * @param documentUri        - the currently processing document that contains the copy statement
   * @param preprocessor       - Cleanup preprocessor that will be used for new copybooks or null
   * @return a CopybookModel wrapped inside {@link ResultWithErrors} which contains copybook name, its URI and the content.
   * Wrapped errors are preprocessed errors for the returned CopybookModel.
   */
  ResultWithErrors<CopybookModel> resolve(
          @NonNull CopybookId copybookId,
          @NonNull CopybookName copybookName,
          @NonNull String programDocumentUri,
          @NonNull String documentUri,
          CleanerPreprocessor preprocessor);

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
   * @param preprocessor       - Cleanup preprocessor that will be used for new copybooks or null
   */
  void store(CopybookModel copybookModel, CleanerPreprocessor preprocessor);

  /**
   * Send downloading requests to the Client for copybooks not presented locally, if any.
   *
   * @param documentUri current document uri.
   * @param copybookUris collection of copybook uris.
   * @param processingMode copybook processing mode.
   */
  void sendCopybookDownloadRequest(String documentUri, Collection<String> copybookUris, CopybookProcessingMode processingMode);

  /**
   * Get the list of copybook used by a document
   *
   * @param documentUri  current document uri.
   * @return Set of all the {@link CopybookModel} used by the passed document
   */
  Set<CopybookModel> getCopybookUsage(String documentUri);

}
