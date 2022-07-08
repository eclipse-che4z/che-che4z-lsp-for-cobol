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
package org.eclipse.lsp.cobol.core.preprocessor.delegates;

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.core.preprocessor.CopybookHierarchy;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/** This interface represents service to build the extended document */
public interface GrammarPreprocessor {

  /**
   * Build extended document using its COPY statements, excluding non-processable statements,
   * applying related semantic analysis
   *
   * @param uri - the URI of the processing document
   * @param code - COBOL program text to analyse
   * @param copybookConfig - contains config info like: copybook processing mode, target backend sql
   *     server
   * @param hierarchy the hierarchy of the copybooks
   * @return extended document with copybooks and related errors
   */
  @NonNull
  ResultWithErrors<ExtendedDocument> buildExtendedDocument(
      @NonNull String uri,
      @NonNull String code,
      @NonNull CopybookConfig copybookConfig,
      @NonNull CopybookHierarchy hierarchy);
}
