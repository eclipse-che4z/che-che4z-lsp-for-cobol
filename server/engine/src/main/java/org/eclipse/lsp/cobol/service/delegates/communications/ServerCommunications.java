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

import static java.util.concurrent.CompletableFuture.runAsync;
import static java.util.stream.Collectors.toList;
import static org.eclipse.lsp4j.MessageType.Info;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import com.google.inject.Provider;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.ExecuteCommandOptions;
import org.eclipse.lsp4j.MessageParams;
import org.eclipse.lsp4j.MessageType;
import org.eclipse.lsp4j.ProgressParams;
import org.eclipse.lsp4j.PublishDiagnosticsParams;
import org.eclipse.lsp4j.Registration;
import org.eclipse.lsp4j.RegistrationParams;
import org.eclipse.lsp4j.Unregistration;
import org.eclipse.lsp4j.UnregistrationParams;
import org.eclipse.lsp4j.WorkDoneProgressBegin;
import org.eclipse.lsp4j.WorkDoneProgressCreateParams;
import org.eclipse.lsp4j.WorkDoneProgressEnd;
import org.eclipse.lsp4j.WorkDoneProgressReport;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

/**
 * This class serves the communications between server and client. It also allows sending delayable
 * messages. Notice, that all the messages that are going to be sent from server to client should be
 * cleaned by removing line breaks to prevent incorrect parsing.
 */
@Slf4j
public class ServerCommunications implements Communications {

  private final Set<String> uriInProgress = new HashSet<>();
  private final MessageService messageService;
  private final Provider<CobolLanguageClient> provider;
  private final FileSystemService files;
  private final UriDecodeService uriDecodeService;

  @Inject
  public ServerCommunications(
          Provider<CobolLanguageClient> provider,
          FileSystemService files,
          MessageService messageService,
          UriDecodeService uriDecodeService) {
    this.provider = provider;
    this.files = files;
    this.messageService = messageService;
    this.uriDecodeService = uriDecodeService;
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
                                    "Communications.noSyntaxError",
                                    files.getNameFromURI(files.decodeURI(uri)))));
  }

  /**
   * show a supplied message to the client with the supplied {@link MessageType}
   *
   * @param messageType {@link MessageType}
   * @param message     to be displayed at client end.
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
            (uri, diagnostic) -> {
              PublishDiagnosticsParams diagnostics1 = new PublishDiagnosticsParams(uriDecodeService.getOriginalUri(uri), clean(diagnostic));
              LOG.debug("publishDiagnostics " + diagnostics1);
              getClient().publishDiagnostics(diagnostics1);
            }
    );
  }


  @Override
  public void notifyProgressBegin(String uri) {
    synchronized (uriInProgress) {
      handleDanglingProgressNotifications(uri);
      createProgressWindow(uri);
      notifyWorkProgressBegin(uri);
      uriInProgress.add(uri);
      notifyWorkProgress(uri);
    }
  }

  private void handleDanglingProgressNotifications(String uri) {
    if (uriInProgress.contains(uri)) {
      notifyProgressEnd(uri);
      uriInProgress.remove(uri);
    }
  }

  private void notifyWorkProgress(String uri) {
    WorkDoneProgressReport workDoneProgressReport = new WorkDoneProgressReport();
    ProgressParams params = new ProgressParams(Either.forLeft(uri), Either.forLeft(workDoneProgressReport));
    getClient().notifyProgress(params);
  }

  private void createProgressWindow(String uri) {
    getClient().createProgress(new WorkDoneProgressCreateParams(Either.forLeft(uri)));
  }

  private void notifyWorkProgressBegin(String uri) {
    ProgressParams params = new ProgressParams();
    params.setToken(uri);
    WorkDoneProgressBegin workDoneProgressBegin = new WorkDoneProgressBegin();
    workDoneProgressBegin.setTitle(messageService.getMessage(
            "Communications.syntaxAnalysisInProgressTitle",
            files.getNameFromURI(uri)));
    params.setValue(Either.forLeft(workDoneProgressBegin));
    getClient().notifyProgress(params);
  }

  @Override
  public void notifyProgressReport(String uri) {
    ProgressParams params =
            new ProgressParams(Either.forLeft(uri), Either.forLeft(new WorkDoneProgressReport()));
    getClient().notifyProgress(params);
  }

  @Override
  public void notifyProgressEnd(String uri) {
    synchronized (uriInProgress) {
      if (uriInProgress.contains(uri)) {
        ProgressParams params =
                new ProgressParams(Either.forLeft(uri), Either.forLeft(new WorkDoneProgressEnd()));
        getClient().notifyProgress(params);
        uriInProgress.remove(uri);
      }
    }
  }

  @Override
  public void registerExecuteCommandCapability(List<String> capabilities, String id) {
    Registration registrations =
            new Registration(id, "workspace/executeCommand", new ExecuteCommandOptions(capabilities));
    RegistrationParams params = new RegistrationParams(ImmutableList.of(registrations));
    getClient().registerCapability(params);
  }

  @Override
  public void unregisterExecuteCommandCapability(String id) {
    UnregistrationParams unregistrationParams =
            new UnregistrationParams(
                    ImmutableList.of(new Unregistration(id, "workspace/executeCommand")));
    getClient().unregisterCapability(unregistrationParams);
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
