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

import com.google.inject.Inject;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.utils.UriHelper;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.ReferenceParams;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * LSP References Handler
 */
public class ReferencesHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final Occurrences occurrences;

  @Inject
  public ReferencesHandler(AsyncAnalysisService asyncAnalysisService, Occurrences occurrences) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.occurrences = occurrences;
  }

  /**
   * LSP References Handler logic.
   * @param params LSP ReferenceParams object.
   * @return List of references.
   * @throws ExecutionException forward exception
   * @throws InterruptedException forward exception
   */
  public List<? extends Location> references(ReferenceParams params) throws ExecutionException, InterruptedException {
    String uri = UriHelper.decode(params.getTextDocument().getUri());
    Optional<CompletableFuture<CobolDocumentModel>> optional = asyncAnalysisService.fetchLastResultOrAnalyzeDocument(uri);
    if (!optional.isPresent()) {
      return Collections.emptyList();
    }
    return occurrences.findReferences(optional.get().get(), params, params.getContext());
  }
}
