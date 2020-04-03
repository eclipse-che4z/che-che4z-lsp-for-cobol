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
package com.ca.lsp.core.cobol.preprocessor;

import com.ca.lsp.core.cobol.model.CopybookUsage;
import com.ca.lsp.core.cobol.model.ExtendedDocument;
import com.ca.lsp.core.cobol.model.ResultWithErrors;

import java.util.Deque;

/** The CobolPreprocessor is engaged in order to process, trasform and parse the document */
public interface CobolPreprocessor {
  ResultWithErrors<ExtendedDocument> process(
      String documentUri,
      String cobolCode,
      Deque<CopybookUsage> copybookStack,
      String textDocumentSyncType);

  ResultWithErrors<ExtendedDocument> process(
      String documentUri, String cobolCode, String textDocumentSyncType);
}
