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

import static java.util.stream.Collectors.toList;

import com.google.common.base.CharMatcher;
import java.util.List;
import java.util.Optional;
import lombok.experimental.UtilityClass;
import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookModel;
import org.eclipse.lsp.cobol.common.copybook.CopybookName;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.mapping.ExtendedText;
import org.eclipse.lsp.cobol.common.mapping.OriginalLocation;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

/**
 * Utility class for {@link org.eclipse.lsp.cobol.common.copybook.CopybookService} Implementations
 */
@UtilityClass
public class CopybookUtility {

  /**
   * Cleans a {@link CopybookModel} based on the passed {@link CleanerPreprocessor}
   *
   * @param dirtyCopybook dirty {@link CopybookModel}
   * @param preprocessor {@link CleanerPreprocessor} for processing the copybbok
   * @return a cleaned {@link CopybookModel} wrapped under {@link ResultWithErrors}
   */
  public ResultWithErrors<CopybookModel> cleanupCopybook(
      CopybookModel dirtyCopybook, CleanerPreprocessor preprocessor) {
    if (preprocessor == null) {
      return ResultWithErrors.of(dirtyCopybook);
    }
    ResultWithErrors<ExtendedText> textTransformationsResultWithErrors =
        preprocessor.cleanUpCode(dirtyCopybook.getUri(), dirtyCopybook.getContent());
    String cleanText =
        CharMatcher.whitespace()
            .trimTrailingFrom(textTransformationsResultWithErrors.getResult().toString());
    CopybookModel copybookModel =
        new CopybookModel(
            dirtyCopybook.getCopybookId(),
            dirtyCopybook.getCopybookName(),
            dirtyCopybook.getUri(),
            cleanText);
    return new ResultWithErrors<>(
        copybookModel,
        adjustErrorLocation(dirtyCopybook, textTransformationsResultWithErrors.getErrors()));
  }

  CopybookModel getDefaultCopybook(CopybookName copybookName, String programUri) {
    return new CopybookModel(copybookName.toCopybookId(programUri), copybookName, null, null);
  }

  private List<SyntaxError> adjustErrorLocation(
      CopybookModel dirtyCopybook, List<SyntaxError> originalErrors) {
    return originalErrors.stream()
        .map(
            error ->
                error.toBuilder().location(getErrorOriginalLocation(dirtyCopybook, error)).build())
        .collect(toList());
  }

  private OriginalLocation getErrorOriginalLocation(
      CopybookModel dirtyCopybook, SyntaxError error) {
    return new OriginalLocation(
        Optional.ofNullable(error.getLocation()).map(OriginalLocation::getLocation).orElse(null),
        CopybooksRepository.toId(
            dirtyCopybook.getCopybookName().getQualifiedName(),
            dirtyCopybook.getCopybookName().getDialectType(),
            dirtyCopybook.getUri()));
  }
}
