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
package org.eclipse.lsp.cobol.lsp.events.queries;

import static java.util.Optional.ofNullable;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.domain.event.model.AnalysisResultEvent;
import org.eclipse.lsp.cobol.lsp.LspEventDependency;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.handlers.extended.AnalysisHandler;

/**
 * Analysis request event triggered by custom cobol LS request supplied by {@link org.eclipse.lsp.cobol.lsp.jrpc.ExtendedApi}
 */
public class AnalysisQuery implements LspQuery<ExtendedApiResult> {
  final AnalysisResultEvent analysisResultEvent;
  final CompletableFuture<ExtendedApiResult> result;
  private final AnalysisHandler analysisHandler;
  private final JsonObject params;

  public AnalysisQuery(JsonObject params, AnalysisHandler analysisHandler) {
    this.params = params;
    this.analysisHandler = analysisHandler;
    result = new CompletableFuture<>();
    analysisResultEvent =
        ofNullable(new Gson().fromJson(params.toString(), AnalysisResultEvent.class))
            .orElseGet(() -> new AnalysisResultEvent("", ""));
  }

  @Override
  public List<LspEventDependency> getDependencies() {
    return analysisHandler.getDependencies(params);
  }

  @Override
  public CompletableFuture<ExtendedApiResult> getResult() {
    return result;
  }

  @Override
  public ExtendedApiResult query() throws ExecutionException, InterruptedException {
    return analysisHandler.analysis(analysisResultEvent);
  }
}
