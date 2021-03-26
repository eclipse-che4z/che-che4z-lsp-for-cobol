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

package org.eclipse.lsp.cobol.service.delegates.communications;

import com.google.inject.Inject;
import com.google.inject.Provider;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.MessageParams;
import org.eclipse.lsp4j.MessageType;
import org.eclipse.lsp4j.PublishDiagnosticsParams;

import java.util.*;
import java.util.function.Function;

import static java.util.concurrent.CompletableFuture.runAsync;
import static java.util.concurrent.TimeUnit.SECONDS;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp4j.MessageType.Info;

/**
 * This class serves the communications between server and client. It also allows sending delayable
 * messages. Notice, that all the messages that are going to be sent from server to client should be
 * cleaned by removing line breaks to prevent incorrect parsing.
 */
@Slf4j
public class ServerCommunications implements Communications {

  private CustomThreadPoolExecutor customExecutor;
  private final Set<String> uriInProgress = new HashSet<>();
  private MessageService messageService;
  private Provider<CobolLanguageClient> provider;
  private FileSystemService files;

  @Inject
  public ServerCommunications(
      Provider<CobolLanguageClient> provider,
      FileSystemService files,
      MessageService messageService,
      CustomThreadPoolExecutor customExecutor) {
    this.provider = provider;
    this.files = files;
    this.messageService = messageService;
    this.customExecutor = customExecutor;
  }

  /**
   * The "work in progress" message should be shown after 3 seconds if the analysis not finished
   * yet. If cancelProgressNotification was invoked then the message won't be shown on the client.
   *
   * @param uri - uri of the document that is currently processed
   */
  @Override
  public void notifyThatLoadingInProgress(String uri) {
    String decodedUri = files.decodeURI(uri);
    uriInProgress.add(decodedUri);
    customExecutor
        .getScheduledThreadPoolExecutor()
        .schedule(
            () -> {
              if (uriInProgress.remove(decodedUri)) {
                showMessage(
                    Info,
                    messageService.getMessage(
                        "Communications.syntaxAnalysisInProgress", retrieveFileName(decodedUri)));
              }
            },
            3,
            SECONDS);
  }

  /**
   * Show a message that analysis finished if there were no errors found
   *
   * @param uri - uri of the document that is currently processed
   */
  @Override
  public void notifyThatDocumentAnalysed(String uri) {
    runAsync(
        () ->
            logMessage(
                Info,
                messageService.getMessage(
                    "Communications.noSyntaxError", retrieveFileName(files.decodeURI(uri)))));
  }

  /**
   * show a supplied message to the client with the supplied {@link MessageType}
   *
   * @param messageType {@link MessageType}
   * @param message to be displayed at client end.
   */
  @Override
  public void notifyGeneralMessage(MessageType messageType, String message) {
    runAsync(() -> showMessage(messageType, message));
  }

  /**
   * This method raise a diagnostic message to the client with syntax error retrieved by the COBOL
   * LSP server for related files.
   *
   * @param diagnostics map of URIs and errors populated by the language engine
   */
  public void publishDiagnostics(Map<String, List<Diagnostic>> diagnostics) {
    diagnostics.forEach(
        (uri, diagnostic) ->
            getClient()
                .publishDiagnostics(
                    new PublishDiagnosticsParams(files.decodeURI(uri), clean(diagnostic))));
  }

  /**
   * Destroy the popup notification that alert the user that the cobol analysis is still ongoing
   *
   * @param uri document open in the client
   */
  @Override
  public void cancelProgressNotification(String uri) {
    uriInProgress.remove(files.decodeURI(uri));
  }

  private void showMessage(MessageType type, String message) {
    getClient().showMessage(new MessageParams(type, clean(message)));
  }

  private void logMessage(MessageType type, String message) {
    getClient().logMessage(new MessageParams(type, clean(message)));
  }

  private CobolLanguageClient getClient() {
    return provider.get();
  }

  private String retrieveFileName(String uri) {
    if (uri.indexOf('/') == -1) return uri;
    return uri.substring(uri.lastIndexOf('/') + 1);
  }

  private List<Diagnostic> clean(Collection<Diagnostic> diagnostics) {
    return diagnostics.stream().map(clean()).collect(toList());
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
