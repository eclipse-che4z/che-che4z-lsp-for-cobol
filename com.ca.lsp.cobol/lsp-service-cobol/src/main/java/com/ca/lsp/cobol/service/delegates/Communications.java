/*
 *
 *  Copyright (c) 2019 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.cobol.service.delegates;

import com.ca.lsp.cobol.service.IMyLanguageServer;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.MessageParams;
import org.eclipse.lsp4j.MessageType;
import org.eclipse.lsp4j.PublishDiagnosticsParams;
import org.eclipse.lsp4j.services.LanguageClient;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * This class serves the communications between server and client. It also allows to send delayable
 * messages. Notice, that all the messages that are going to be sent from server to client should be
 * cleaned by removing line breaks to prevent incorrect parsing.
 *
 * @author teman02
 */
public class Communications {
  private final IMyLanguageServer server;
  private final ScheduledExecutorService executor = Executors.newScheduledThreadPool(5);

  private final Set<String> uriInProgress = new HashSet<>();

  public Communications(IMyLanguageServer server) {
    this.server = server;
  }

  public void notifyThatEngineNotFound(String languageType) {
    CompletableFuture.runAsync(
        () ->
            showMessage(
                MessageType.Error,
                "Cannot find a language engine for the given language ID: " + languageType));
  }

  /**
   * The "work in progress" message should be shown after 3 seconds if the analysis is not finished
   * yet. If cancelProgressNotification was invoked then the message won't be shown on the client.
   *
   * @param uri - uri of the document that is currently processed
   */
  public void notifyThatLoadingInProgress(String uri) {
    uriInProgress.add(uri);
    executor.schedule(
        () -> {
          if (uriInProgress.remove(uri)) {
            showMessage(MessageType.Info, retrieveFileName(uri) + ": Syntax analysis in progress");
          }
        },
        3,
        TimeUnit.SECONDS);
  }

  /**
   * Show a message that analysis is finished if there were no errors found
   *
   * @param uri - uri of the document that is currently processed
   */
  public void notifyThatDocumentAnalysed(String uri) {
    CompletableFuture.runAsync(
        () ->
            showMessage(MessageType.Info, "No syntax errors detected in " + retrieveFileName(uri)));
  }

  public void notifyCopybooksFound(String copybooksList) {
    CompletableFuture.runAsync(
        () ->
            getClient()
                .showMessage(
                    new MessageParams(
                        MessageType.Info,
                        "Copybooks found in the current workspace " + copybooksList)));
  }

  public void notifyURIOfCopybook(String copyName, String copybookURI) {
    CompletableFuture.runAsync(
        () ->
            getClient()
                .showMessage(
                    new MessageParams(
                        MessageType.Info,
                        "Copybooks with name " + copyName + " have path: " + copybookURI)));
  }

  public void publishDiagnostics(String uri, List<Diagnostic> diagnostics) {
    getClient().publishDiagnostics(new PublishDiagnosticsParams(uri, clean(diagnostics)));
  }

  public void cancelProgressNotification(String uri) {
    uriInProgress.remove(uri);
  }

  private void showMessage(MessageType type, String message) {
    getClient().showMessage(new MessageParams(type, clean(message)));
  }

  private String retrieveFileName(String uri) {
    if (uri.indexOf('/') == -1) return uri;
    return uri.substring(uri.lastIndexOf('/') + 1);
  }

  private LanguageClient getClient() {
    return server.getClient();
  }

  private List<Diagnostic> clean(List<Diagnostic> diagnostics) {
    return diagnostics.stream().map(clean()).collect(Collectors.toList());
  }

  private Function<Diagnostic, Diagnostic> clean() {
    return diagnostic -> {
      diagnostic.setMessage(clean(diagnostic.getMessage()));
      return diagnostic;
    };
  }

  private String clean(String source) {
    return source.replaceAll("(\\r\\n|\\r|\\n)", "");
  }
}
