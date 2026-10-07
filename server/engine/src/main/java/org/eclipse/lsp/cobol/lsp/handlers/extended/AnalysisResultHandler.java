/*
 * Copyright (c) 2026 Broadcom.
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 *    Broadcom - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.lsp.handlers.extended;

import javax.inject.Inject;
import lombok.NonNull;
import org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDto;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.events.queries.AnalysisResultQuery;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;

/** Handler of the extended/analysisResult request */
public class AnalysisResultHandler {
  private final DocumentModelService documentModelService;
  private final AsyncAnalysisService asyncAnalysisService;
  private final Communications communications;

  @Inject
  public AnalysisResultHandler(
      DocumentModelService documentModelService,
      AsyncAnalysisService asyncAnalysisService,
      Communications communications) {
    this.documentModelService = documentModelService;
    this.asyncAnalysisService = asyncAnalysisService;
    this.communications = communications;
  }

  /**
   * Create a query returning the last analysis result of the document
   *
   * @param uri the document uri
   * @return {@link AnalysisResultQuery}
   */
  public LspQuery<AnalysisResultDto> createAnalysisEvent(@NonNull String uri) {
    return new AnalysisResultQuery(uri, documentModelService, asyncAnalysisService, communications);
  }
}
