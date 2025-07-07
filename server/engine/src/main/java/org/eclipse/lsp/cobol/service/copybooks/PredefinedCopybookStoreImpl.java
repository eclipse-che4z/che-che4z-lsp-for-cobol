/*
 * Copyright (c) 2025 Broadcom.
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

import java.util.*;
import javax.inject.Singleton;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.*;
import org.eclipse.lsp.cobol.common.error.SyntaxError;

/**
 * This storage service processes predefined copybook requests and returns content by its name. The
 * service caches' copybook.
 */
@Singleton
public class PredefinedCopybookStoreImpl implements PredefinedCopybookStore {
  private final Map<String, CopybookModel> preDefinedCopybookCache = new HashMap<>();
  private final Map<String, List<SyntaxError>> predefinedCopybookErrors = new HashMap<>();

  private static CopybookModel getDefaultCopybook(CopybookName copybookName, String programUri) {
    return new CopybookModel(copybookName.toCopybookId(programUri), copybookName, null, null);
  }

  /**
   * Resolves a predefined {@link CopybookName} into a {@link CopybookModel} wrapped under {@link
   * ResultWithErrors}
   *
   * @param copybookName - the name of the copybook to be retrieved
   * @param programDocumentUri - the currently processing program document
   * @return a {@link CopybookModel} wrapped under {@link ResultWithErrors}
   */
  @Override
  public ResultWithErrors<CopybookModel> resolve(
      @NonNull CopybookName copybookName, @NonNull String programDocumentUri) {
    return getPredefinedCopybooks(copybookName, programDocumentUri);
  }

  /**
   * @param copybookModel the copybook model
   */
  @Override
  public void store(CopybookModel copybookModel) {
    preDefinedCopybookCache.putIfAbsent(
        copybookModel.getCopybookName().getDisplayName().toUpperCase(), copybookModel);
  }

  /**
   * @param copybookModel the copybook model
   * @param preprocessor - Cleanup preprocessor that will be used for new copybooks or null
   */
  @Override
  public void store(CopybookModel copybookModel, CleanerPreprocessor preprocessor) {
    if (preprocessor != null) {
      ResultWithErrors<CopybookModel> processedCopybook =
          CopybookUtility.cleanupCopybook(copybookModel, preprocessor);
      copybookModel = processedCopybook.getResult();
      predefinedCopybookErrors.put(copybookModel.getUri(), processedCopybook.getErrors());
    }
    store(copybookModel);
  }

  private ResultWithErrors<CopybookModel> getPredefinedCopybooks(
      @NonNull CopybookName copybookName, @NonNull String programUri) {
    CopybookModel model =
        preDefinedCopybookCache.getOrDefault(
            copybookName.getDisplayName().toUpperCase(),
            getDefaultCopybook(copybookName, programUri));
    return new ResultWithErrors<>(
        model, predefinedCopybookErrors.getOrDefault(model.getUri(), Collections.emptyList()));
  }
}
