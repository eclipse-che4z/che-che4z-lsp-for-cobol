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
package org.eclipse.lsp.cobol.lsp.handlers.text;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.LspEvent;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.ReferenceParams;

import java.util.List;
import java.util.concurrent.ExecutionException;

/**
 * LSP References Handler
 */
public class ReferencesHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final Occurrences occurrences;
  private final DocumentModelService documentModelService;

  @Inject
  public ReferencesHandler(AsyncAnalysisService asyncAnalysisService, Occurrences occurrences, DocumentModelService documentModelService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.occurrences = occurrences;
    this.documentModelService = documentModelService;
  }

  /**
   * LSP References Handler logic.
   *
   * @param params LSP ReferenceParams object.
   * @return List of references.
   * @throws ExecutionException   forward exception
   * @throws InterruptedException forward exception
   */
  public List<? extends Location> references(ReferenceParams params) throws ExecutionException, InterruptedException {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    return occurrences.findReferences(documentModelService.get(uri), params, params.getContext());
  }

  /**
   * Create LSP References event.
   *
   * @param params LSP ReferenceParams object.
   * @return LspEvent.
   */
  public LspEvent<List<? extends Location>> createEvent(ReferenceParams params) {
    return new LspEvent<List<? extends Location>>() {
      final List<LspEventDependency> lspEventDependencies = ImmutableList.of(
              asyncAnalysisService.createDependencyOn(UriHelper.decode(params.getTextDocument().getUri())));

      @Override
      public List<LspEventDependency> getDependencies() {
        return lspEventDependencies;
      }

      @Override
      public List<? extends Location> execute() throws ExecutionException, InterruptedException {
        return ReferencesHandler.this.references(params);
      }
    };
  }
}
