/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 *
 */

package com.ca.lsp.cobol.service.delegates.communications;

import com.google.inject.Inject;
import com.google.inject.Provider;
import lombok.extern.slf4j.Slf4j;
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

import static com.ca.lsp.cobol.service.utils.FileSystemUtils.decodeURI;

/**
 * This class serves the communications between server and client. It also allows to send delayable
 * messages. Notice, that all the messages that are going to be sent from server to client should be
 * cleaned by removing line breaks to prevent incorrect parsing.
 */
@Slf4j
public class ServerCommunications implements Communications {
  private final ScheduledExecutorService executor = Executors.newScheduledThreadPool(5);
  private final Set<String> uriInProgress = new HashSet<>();

  private Provider<LanguageClient> provider;

  @Inject
  public ServerCommunications(Provider<LanguageClient> provider) {
    this.provider = provider;
  }

  /**
   * This method raise a notification message back to the client if is unable to found a language
   * engine for a given document id
   *
   * @param languageType enum that represent the langugage type
   */
  @Override
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
  @Override
  public void notifyThatLoadingInProgress(String uri) {
    String decodedUri = decodeURI(uri);
    uriInProgress.add(decodedUri);
    executor.schedule(
        () -> {
          if (uriInProgress.remove(decodedUri)) {
            showMessage(
                MessageType.Info, retrieveFileName(decodedUri) + ": Syntax analysis in progress");
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
  @Override
  public void notifyThatDocumentAnalysed(String uri) {
    CompletableFuture.runAsync(
        () ->
            showMessage(
                MessageType.Info,
                "No syntax errors detected in " + retrieveFileName(decodeURI(uri))));
  }

  /**
   * Show a message that the document with the given extension cannot be parsed.
   *
   * @param extension - the given document extension
   */
  @Override
  public void notifyThatExtensionIsUnsupported(String extension) {
    CompletableFuture.runAsync(
        () ->
            showMessage(
                MessageType.Error, "The given document extension is unsupported: " + extension));
  }

  /**
   * This method raise a popup message back to the user with a message customized by the enumeration
   * class
   *
   * @param copybookMessageInfo the enum kind that represent the event that will be shown to the
   *     user
   */
  @Override
  public void notifyCopybookMessageInfo(CopybookMessageInfo copybookMessageInfo) {
    CompletableFuture.runAsync(
        () ->
            showMessage(
                MessageType.Error,
                "Error during the copybook analysis, reason: " + copybookMessageInfo.getMessage()));
  }

  @Override
  public void notifyLogMessageInfo(CopybookMessageInfo copybookMessageInfo) {
    CompletableFuture.runAsync(
        () ->
            getClient()
                .logMessage(new MessageParams(MessageType.Info, copybookMessageInfo.getMessage())));
  }

  /**
   * This method raise a diagnostic message to the client with syntax error retrivied by the Cobol
   * LSP server
   *
   * @param uri document opened in the client
   * @param diagnostics list populated by the language engine
   */
  @Override
  public void publishDiagnostics(String uri, List<Diagnostic> diagnostics) {
    getClient()
        .publishDiagnostics(new PublishDiagnosticsParams(decodeURI(uri), clean(diagnostics)));
  }

  /**
   * Destroy the popup notification that alert the user that the cobol analysis is still ongoing
   *
   * @param uri document open in the client
   */
  @Override
  public void cancelProgressNotification(String uri) {
    uriInProgress.remove(decodeURI(uri));
  }

  private void showMessage(MessageType type, String message) {
    getClient().showMessage(new MessageParams(type, clean(message)));
  }

  private LanguageClient getClient() {
    return provider.get();
  }

  private String retrieveFileName(String uri) {
    if (uri.indexOf('/') == -1) return uri;
    return uri.substring(uri.lastIndexOf('/') + 1);
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
