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
package org.eclipse.lsp.cobol.service.mocks;

import com.google.common.collect.ImmutableList;
import lombok.NonNull;
import org.eclipse.lsp.cobol.common.ResultWithErrors;
import org.eclipse.lsp.cobol.common.copybook.CopybookConfig;
import org.eclipse.lsp.cobol.common.mapping.TextTransformations;
import org.eclipse.lsp.cobol.core.model.OldExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.preprocessor.TextPreprocessor;

import static org.mockito.Mockito.mock;

/**
 * Mock Text Processor class
 */
public class MockTextPreprocessor implements TextPreprocessor {
  @Override
  public ResultWithErrors<TextTransformations> cleanUpCode(String documentUri, String cobolCode) {
    return new ResultWithErrors<>(TextTransformations.of(cobolCode, documentUri), ImmutableList.of());
  }

  @Override
  public ResultWithErrors<OldExtendedDocument> processCleanCode(@NonNull String documentUri, @NonNull String cobolCode, @NonNull CopybookConfig copybookConfig, @NonNull CopybookHierarchy hierarchy) {
    return new ResultWithErrors<>(mock(OldExtendedDocument.class), ImmutableList.of());
  }
}
