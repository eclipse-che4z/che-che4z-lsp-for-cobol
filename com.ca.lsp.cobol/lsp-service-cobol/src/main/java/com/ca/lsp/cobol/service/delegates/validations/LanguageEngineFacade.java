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
package com.ca.lsp.cobol.service.delegates.validations;

import com.ca.lsp.cobol.service.CopybookProcessingMode;

public interface LanguageEngineFacade {
  /**
   * @param uri - URI of the processing document to define positions and errors properly
   * @param text of document opened in the client editor
   * @param copybookProcessingMode reflect the sync status of the document (DID_OPEN|DID_CHANGE)
   * @return list of LSP diagnostic object used to display errors in the editor
   */
  AnalysisResult analyze(String uri, String text, CopybookProcessingMode copybookProcessingMode);
}
