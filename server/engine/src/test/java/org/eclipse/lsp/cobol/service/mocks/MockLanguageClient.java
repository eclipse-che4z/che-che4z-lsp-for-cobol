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
 *    Broadcom, Inc. - initial API and implementation
 *
 */
package org.eclipse.lsp.cobol.service.mocks;

import com.google.common.collect.ImmutableList;
import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.inject.Singleton;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp4j.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 * Mock implementation of language client. Only for testing purposes. Collects the received messages
 * from the server. May respond on the showMessageRequest using the given messages in the Iterator.
 */
@Singleton
public class MockLanguageClient implements CobolLanguageClient {
  private List<Object> receivedTelemetry = new ArrayList<>();
  private List<PublishDiagnosticsParams> receivedDiagnostics = new ArrayList<>();
  private List<MessageParams> messagesToShow = new ArrayList<>();
  private List<MessageParams> messagesToLog = new ArrayList<>();

  private Iterator<MessageActionItem> responseIterator = null;

  @Override
  public void telemetryEvent(Object object) {
    receivedTelemetry.add(object);
  }

  @Override
  public void publishDiagnostics(PublishDiagnosticsParams diagnostics) {
    receivedDiagnostics.add(diagnostics);
  }

  @Override
  public CompletableFuture<Void> createProgress(WorkDoneProgressCreateParams params) {
    return CompletableFuture.completedFuture(null);
  }

  @Override
  public void notifyProgress(ProgressParams params) {
  }

  @Override
  public void showMessage(MessageParams messageParams) {
    messagesToShow.add(messageParams);
  }

  @Override
  public CompletableFuture<MessageActionItem> showMessageRequest(
      ShowMessageRequestParams requestParams) {
    MessageActionItem item = null;
    if (responseIterator != null) {
      item = responseIterator.next();
    }
    return CompletableFuture.completedFuture(item);
  }

  @Override
  public void logMessage(MessageParams message) {
    messagesToLog.add(message);
  }

  /**
   * Returns mock-config values used in server integration test
   *
   * @param configurationParams
   * @return - config value
   */
  public CompletableFuture<List<Object>> configuration(ConfigurationParams configurationParams) {
      return CompletableFuture.completedFuture(ImmutableList.of("",
          new JsonObject(),
          new JsonArray(),
          new JsonNull(),
          new JsonNull(),
          new JsonArray(), ""));
  }

  /** Clean the client state. */
  public void clean() {
    receivedTelemetry.clear();
    receivedDiagnostics.clear();
    messagesToShow.clear();
    messagesToLog.clear();
    responseIterator = null;
  }
}
