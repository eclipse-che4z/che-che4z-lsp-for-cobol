/*
 * Copyright (c) 2025 Broadcom.
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
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import lombok.Value;
import org.eclipse.lsp.cobol.core.engine.dialects.v2.DialectProcessingManager;
import org.eclipse.lsp.cobol.lsp.LspQuery;
import org.eclipse.lsp.cobol.lsp.jrpc.CopybookResult;
import org.eclipse.lsp4j.Location;

/** Dialect Resolve Copybook Query **/
public class DialectResolveCopybookQuery implements LspQuery<CopybookResult> {
  private final DialectProcessingManager dialectProcessingManager;
  private final CompletableFuture<CopybookResult> result;
  private final DialectResolveCopybookEvent event;

  @Value
  private static class DialectResolveCopybookEvent {
    String dialectName;
    String programUri;
    String copybookName;
    Location statementLocation;
  }

  public DialectResolveCopybookQuery(
      JsonObject params, DialectProcessingManager dialectProcessingManager) {
    this.dialectProcessingManager = dialectProcessingManager;
    this.result = new CompletableFuture<>();
    this.event =
        ofNullable(new Gson().fromJson(params.toString(), DialectResolveCopybookEvent.class))
            .orElseGet(() -> new DialectResolveCopybookEvent("", "", "", new Location()));
  }

  @Override
  public CopybookResult query() throws ExecutionException, InterruptedException {
    return dialectProcessingManager.resolveCopybook(
        event.getDialectName(),
        event.getProgramUri(),
        event.getCopybookName(),
        event.getStatementLocation());
  }

  @Override
  public CompletableFuture<CopybookResult> getResult() {
    return result;
  }
}
