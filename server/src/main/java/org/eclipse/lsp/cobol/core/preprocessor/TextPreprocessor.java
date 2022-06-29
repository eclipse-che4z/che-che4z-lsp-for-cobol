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
package org.eclipse.lsp.cobol.core.preprocessor;

import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.ExtendedDocument;
import org.eclipse.lsp.cobol.core.engine.TextTransformations;
import org.eclipse.lsp.cobol.core.model.ResultWithErrors;
import org.eclipse.lsp.cobol.service.copybooks.CopybookConfig;

/**
 * This interface describes the text preprocessor which prepares the given string for analysis by
 * the grammar
 */
public interface TextPreprocessor {

  /**
   * Check and clean of the code as per cobol program structure.
   *
   * @param documentUri unique resource identifier of the processed document
   * @param cobolCode the content of the document that should be processed
   * @return modified code wrapped object and list of syntax error that might send back to the
   *     client
   */
  ResultWithErrors<TextTransformations> cleanUpCode(String documentUri, String cobolCode);

  /**
   * Process the given source code by removing all the unnecessary tokens and building in the nested
   * copybook content with tracking the hierarchy of the text documents
   *
   * @param documentUri unique resource identifier of the processed document
   * @param cobolCode cleaned code derived from the content of the document that should be processed
   * @param copybookConfig contains config info like: copybook processing mode, target backend sql
   *     server
   * @param hierarchy the hierarchy of the copybooks
   * @return wrapped object containing extended document and related errors
   */
  ResultWithErrors<ExtendedDocument> processCleanCode(
      @NonNull String documentUri,
      @NonNull String cobolCode,
      @NonNull CopybookConfig copybookConfig,
      @NonNull CopybookHierarchy hierarchy);

}
