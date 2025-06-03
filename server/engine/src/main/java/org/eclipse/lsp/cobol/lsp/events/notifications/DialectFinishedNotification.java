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
package org.eclipse.lsp.cobol.lsp.events.notifications;

import static java.util.Optional.ofNullable;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.Value;
import org.eclipse.lsp.cobol.core.engine.dialects.v2.DialectProcessingManager;
import org.eclipse.lsp.cobol.lsp.LspNotification;
import org.eclipse.lsp.cobol.lsp.jrpc.DocumentReplacement;

/** Dialect Finish Processing Notification * */
public class DialectFinishedNotification implements LspNotification {

  @Value
  private static class FinishEvent {
    String dialectName;
    String programUri;
    DocumentReplacement[] replacements;
  }

  private final DialectProcessingManager dialectProcessingManager;
  private final FinishEvent event;

  public DialectFinishedNotification(
      JsonObject params, DialectProcessingManager dialectProcessingManager) {
    this.dialectProcessingManager = dialectProcessingManager;
    this.event =
        ofNullable(
                new Gson()
                    .fromJson(params.toString(), DialectFinishedNotification.FinishEvent.class))
            .orElseGet(
                () ->
                    new DialectFinishedNotification.FinishEvent(
                        "", "", new DocumentReplacement[0]));
  }

  @Override
  public void execute() {
    dialectProcessingManager.finish(
        event.getDialectName(), event.getProgramUri(), event.getReplacements());
  }
}
