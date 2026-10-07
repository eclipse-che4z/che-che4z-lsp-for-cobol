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
package org.eclipse.lsp.cobol.lsp.events.queries;

import com.google.common.collect.ImmutableList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDto;
import org.eclipse.lsp.cobol.core.model.extendedapi.analysisresult.AnalysisResultDtoMapper;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.analysis.AsyncAnalysisService;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.DocumentModelService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp4j.MessageType;

/** Analysis result Language Server event */
public class AnalysisResultQuery implements LspQuery<AnalysisResultDto> {
  private final DocumentModelService documentModelService;
  private final AsyncAnalysisService asyncAnalysisService;
  private final Communications communications;
  private final String uri;
  private final CompletableFuture<AnalysisResultDto> result;

  public AnalysisResultQuery(
      String uri,
      DocumentModelService documentModelService,
      AsyncAnalysisService asyncAnalysisService,
      Communications communications) {
    this.documentModelService = documentModelService;
    this.uri = uri;
    this.asyncAnalysisService = asyncAnalysisService;
    this.communications = communications;
    result = new CompletableFuture<>();
  }

  @Override
  public AnalysisResultDto query() throws ExecutionException, InterruptedException {
    CobolDocumentModel doc = documentModelService.get(uri);
    if (doc == null) {
      communications.notifyGeneralMessage(MessageType.Info, "Unable to retrieve document model");
      return null;
    }
    return Optional.ofNullable(doc.getLastAnalysisResult())
        .map(AnalysisResultDtoMapper::map)
        .orElse(null);
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return ImmutableList.of(asyncAnalysisService.createDependencyOn(this.uri));
  }

  @Override
  public CompletableFuture<AnalysisResultDto> getResult() {
    return result;
  }
}
