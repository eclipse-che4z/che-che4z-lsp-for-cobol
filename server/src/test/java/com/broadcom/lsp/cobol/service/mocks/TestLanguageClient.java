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
package com.broadcom.lsp.cobol.service.mocks;

import com.broadcom.lsp.cobol.jrpc.CobolLanguageClient;
import com.google.inject.Singleton;
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
public class TestLanguageClient implements CobolLanguageClient {
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
   * Clean the client state.
   */
  public void clean() {
    receivedTelemetry.clear();
    receivedDiagnostics.clear();
    messagesToShow.clear();
    messagesToLog.clear();
    responseIterator = null;
  }
}
