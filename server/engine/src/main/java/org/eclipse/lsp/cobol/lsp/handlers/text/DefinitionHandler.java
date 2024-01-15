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
import java.util.List;
import java.util.concurrent.ExecutionException;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.lsp.AsyncAnalysisService;
import org.eclipse.lsp.cobol.lsp.LspEvent;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp4j.DefinitionParams;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.LocationLink;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * LSP Definition Handler
 */
@Slf4j
public class DefinitionHandler {
  private final AsyncAnalysisService asyncAnalysisService;
  private final DocumentModelService documentModelService;
  private final Occurrences occurrences;
  private final UriDecodeService uriDecodeService;

  @Inject
  public DefinitionHandler(AsyncAnalysisService asyncAnalysisService, DocumentModelService documentModelService, Occurrences occurrences, UriDecodeService uriDecodeService) {
    this.asyncAnalysisService = asyncAnalysisService;
    this.documentModelService = documentModelService;
    this.occurrences = occurrences;
    this.uriDecodeService = uriDecodeService;
  }

  /**
   * Handle definition LSP }request.
   *
   * @param params DefinitionParams.
   * @return Either list of locations or list of location links.
   * @throws ExecutionException   forward exception.
   * @throws InterruptedException forward exception.
   */
  public Either<List<? extends Location>, List<? extends LocationLink>> definition(DefinitionParams params) throws ExecutionException, InterruptedException {
    CobolDocumentModel doc = documentModelService.get(uriDecodeService.decode(params.getTextDocument().getUri()));
    List<Location> definitions = occurrences.findDefinitions(doc, params);
    return Either.forLeft(HandlerUtility.mapToOriginalLocation(definitions, uriDecodeService));
  }

  /**
   * Create definition LSP request event.
   *
   * @param params DefinitionParams.
   * @return LspEvent.
   */
  public LspEvent<Either<List<? extends Location>, List<? extends LocationLink>>> createEvent(DefinitionParams params) {
    return new LspEvent<Either<List<? extends Location>, List<? extends LocationLink>>>() {
      final List<LspEventDependency> lspEventDependencies = ImmutableList.of(
              asyncAnalysisService.createDependencyOn(uriDecodeService.decode(params.getTextDocument().getUri())));
      @Override
      public List<LspEventDependency> getDependencies() {
        return lspEventDependencies;
      }

      @Override
      public Either<List<? extends Location>, List<? extends LocationLink>> execute() throws ExecutionException, InterruptedException {
        return DefinitionHandler.this.definition(params);
      }
    };
  }
}
