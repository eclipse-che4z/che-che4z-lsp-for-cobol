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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.core.cobol.preprocessor.sub.document;

import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.ExtendedDocument;
import com.ca.lsp.core.cobol.model.ResultWithErrors;

import javax.annotation.Nonnull;
import java.util.Deque;

/** This interface represents service to build the extended document */
public interface GrammarPreprocessor {

  /**
   * Build extended document using its COPY statements, excluding non-processable statements,
   * applying related semantic analysis
   *
   * @param uri - the URI of the processing document
   * @param code - COBOL program text to analyse
   * @param copybookStack - stack, representing the hierarchy of nesting copybooks
   * @param textDocumentSyncType - reflect the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return extended document with copybooks and related errors
   */
  @Nonnull
  ResultWithErrors<ExtendedDocument> buildExtendedDocument(
      @Nonnull String uri,
      @Nonnull String code,
      @Nonnull Deque<CopybookUsage> copybookStack,
      @Nonnull String textDocumentSyncType);
}
