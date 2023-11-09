/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.core.preprocessor.delegates;

import lombok.NonNull;
import lombok.Value;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.mapping.ExtendedDocument;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.core.semantics.CopybooksRepository;

/**
 * Preprocessor context
 */
@Value
public class PreprocessorContext {
  @NonNull String programDocumentUri;
  @NonNull ExtendedDocument currentDocument;
  @NonNull CopybookProcessingMode copybookProcessingMode;
  @NonNull CopybookHierarchy hierarchy;
  @NonNull CopybooksRepository copybooksRepository;
}
