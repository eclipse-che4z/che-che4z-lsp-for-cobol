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

import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.eclipse.lsp4j.MessageType.Info;
import static org.mockito.Mockito.anyString;
import static org.mockito.Mockito.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.timeout;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.inject.Provider;
import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Executors;
import org.eclipse.lsp.cobol.core.messages.MessageService;
import org.eclipse.lsp.cobol.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.utils.CustomThreadPoolExecutor;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.MessageParams;
import org.eclipse.lsp4j.MessageType;
import org.eclipse.lsp4j.PublishDiagnosticsParams;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInfo;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

/** This unit tests verifies the capabilities of {@link ServerCommunications} */
@ExtendWith(MockitoExtension.class)
class ServerCommunicationsTest {

  private static final int TEST_TIMEOUT = 10000;

  @Mock private Provider<CobolLanguageClient> provider;

  @Mock private CobolLanguageClient client;

  @Mock private FileSystemService files;

  @Mock private HashSet<String> uriInProgress;

  @InjectMocks private ServerCommunications communications;

  @Mock private MessageService messageService;

  @Mock private CustomThreadPoolExecutor customExecutor;

  @BeforeEach
  void init(TestInfo info) {
    if (!"testCancelProgressNotification()".equals(info.getDisplayName())) {
      when(provider.get()).thenReturn(client);
    }
  }

  /**
   * Method {@link ServerCommunications#notifyThatDocumentAnalysed(String)} should asynchronously
   * call logging on the client for a specific message with a document name retrieved from uri
   */
  @Test
  void testNotifyThatDocumentAnalysed_multi_segment_uri() {
    assertDocumentAnalysedNotification(DOCUMENT_URI, "document.cbl");
    assertDocumentAnalysedNotification("document.cbl", "document.cbl");
    assertDocumentAnalysedNotification("", "");
  }

  /**
   * Method {@link ServerCommunications#notifyThatLoadingInProgress(String)} should asynchronously
   * populate message with an URI on the client
   */
  @Test
  void testNotifyThatLoadingInProgress() {
    String data = UUID.randomUUID().toString();
    when(files.decodeURI(data)).thenReturn(data);
    when(files.getNameFromURI(data)).thenReturn(data);
    when(customExecutor.getScheduledThreadPoolExecutor())
        .thenReturn(Executors.newScheduledThreadPool(5));

    when(messageService.getMessage(anyString(), anyString()))
        .thenReturn("%s : Syntax analysis in progress");

    communications.notifyThatLoadingInProgress(data);
    verify(client, timeout(TEST_TIMEOUT))
        .showMessage(
            eq(
                new MessageParams(
                    Info,
                    messageService.getMessage("Communications.syntaxAnalysisInProgress", data))));
  }

  /**
   * Method {@link ServerCommunications#notifyThatDocumentAnalysed(String)} should asynchronously
   * call logging on the client for a specific message with an URI
   */
  @Test
  void testNotifyThatDocumentAnalysed() {
    String data = UUID.randomUUID().toString();
    when(files.decodeURI(data)).thenReturn(data);
    when(files.getNameFromURI(data)).thenReturn(data);
    when(messageService.getMessage(anyString(), anyString()))
        .thenReturn("No syntax errors detected in %s");
    communications.notifyThatDocumentAnalysed(data);
    verify(client, timeout(TEST_TIMEOUT))
        .logMessage(
            eq(
                new MessageParams(
                    Info, messageService.getMessage("Communications.noSyntaxError", data))));
  }

  /**
   * Method {@link ServerCommunications#publishDiagnostics(Map)} should raise a diagnostic message
   * to the client with syntax error retrieved by the COBOL LSP server for related files.
   */
  @Test
  void testPublishDiagnostics() {
    String uri = UUID.randomUUID().toString();

    // Prepare diagnostic map
    Diagnostic diagnostic = new Diagnostic(new Range(), "\r\ntest\r\n");
    List<Diagnostic> diagnostics = ImmutableList.of(diagnostic);

    communications.publishDiagnostics(ImmutableMap.of(uri, diagnostics));

    // Check that cleanup was performed for Diagnostic message
    diagnostic.setMessage("test");
    verify(client, times(1)).publishDiagnostics(eq(new PublishDiagnosticsParams(uri, diagnostics)));
  }

  /**
   * Method {@link ServerCommunications#cancelProgressNotification(String)} should destroy the popup
   * notification that alert the user that the cobol analysis is still ongoing
   */
  @Test
  void testCancelProgressNotification() throws NoSuchFieldException {
    String uri = UUID.randomUUID().toString();
    when(files.decodeURI(uri)).thenReturn(uri);


    Field f = communications.getClass().getDeclaredField("uriInProgress");
    f.setAccessible(true);
    try {
      f.set(communications, uriInProgress);
    } catch (IllegalAccessException e) {
      throw new RuntimeException(e);
    }

    communications.cancelProgressNotification(uri);
    verify(uriInProgress, times(1)).remove(uri);
  }

  private void assertDocumentAnalysedNotification(String uri, String fileName) {
    client = mock(CobolLanguageClient.class);
    when(provider.get()).thenReturn(client);
    when(files.decodeURI(uri)).thenReturn(uri);
    when(files.getNameFromURI(uri)).thenReturn(fileName);
    when(messageService.getMessage(anyString(), anyString()))
        .thenReturn("No syntax errors detected in %s");
    communications.notifyThatDocumentAnalysed(uri);
    verify(client, timeout(TEST_TIMEOUT))
        .logMessage(
            eq(
                new MessageParams(
                    MessageType.Info,
                    messageService.getMessage("Communications.noSyntaxError", fileName))));
  }
}
