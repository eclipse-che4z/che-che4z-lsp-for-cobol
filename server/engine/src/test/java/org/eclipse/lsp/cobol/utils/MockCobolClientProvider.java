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
package org.eclipse.lsp.cobol.utils;

import com.google.inject.Provider;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp4j.MessageActionItem;
import org.eclipse.lsp4j.MessageParams;
import org.eclipse.lsp4j.PublishDiagnosticsParams;
import org.eclipse.lsp4j.ShowMessageRequestParams;

import java.util.concurrent.CompletableFuture;

public class MockCobolClientProvider implements Provider<CobolLanguageClient> {

  @Override
  public CobolLanguageClient get() {
    return new CobolLanguageClient() {
      @Override
      public void telemetryEvent(Object o) {

      }

      @Override
      public void publishDiagnostics(PublishDiagnosticsParams publishDiagnosticsParams) {

      }

      @Override
      public void showMessage(MessageParams messageParams) {

      }

      @Override
      public CompletableFuture<MessageActionItem> showMessageRequest(ShowMessageRequestParams showMessageRequestParams) {
        return null;
      }

      @Override
      public void logMessage(MessageParams messageParams) {

      }

      @Override
      public void cfastReady(ExtendedApiResult result) {

      }
    };
  }
}
