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

import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;
import static org.eclipse.lsp4j.MessageType.Info;
import static org.mockito.Mockito.*;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.inject.Provider;
import java.lang.reflect.Field;
import java.util.*;
import org.eclipse.lsp.cobol.common.file.FileSystemService;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.lsp.jrpc.CobolLanguageClient;
import org.eclipse.lsp.cobol.service.UriDecodeService;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
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

  @Mock private UriDecodeService uriDecodeService;

  @Mock private MessageService messageService;

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
    when(uriDecodeService.getOriginalUri(anyString())).thenReturn(uri);

    communications.publishDiagnostics(ImmutableMap.of(uri, diagnostics));

    // Check that cleanup was performed for Diagnostic message
    diagnostic.setMessage("test");
    verify(client, times(1)).publishDiagnostics(eq(new PublishDiagnosticsParams(uri, diagnostics)));
  }

  @Test
  void testNotifyProgressBegin() throws NoSuchFieldException {
    String uri = UUID.randomUUID().toString();
    when(files.getNameFromURI(uri)).thenReturn(uri);
    when(messageService.getMessage("Communications.syntaxAnalysisInProgressTitle", uri)).thenReturn("TITLE");
    setUpProgressDataStructure(uri);
    ProgressParams expectedNotifyBeginParams = new ProgressParams();
    expectedNotifyBeginParams.setToken(uri);
    WorkDoneProgressBegin workDoneProgressBegin = new WorkDoneProgressBegin();
    workDoneProgressBegin.setTitle("TITLE");
    expectedNotifyBeginParams.setValue(Either.forLeft(workDoneProgressBegin));

    communications.notifyProgressBegin(uri);
    verify(client).notifyProgress(expectedNotifyBeginParams);
    verify(client).notifyProgress(new ProgressParams(Either.forLeft(uri), Either.forLeft(new WorkDoneProgressReport())));
  }

  @Test
  void testNotifyProgressEnd() throws NoSuchFieldException {
    String uri = UUID.randomUUID().toString();
    setUpProgressDataStructure(uri);
    communications.notifyProgressEnd(uri);
    verify(client).notifyProgress(new ProgressParams(Either.forLeft(uri), Either.forLeft(new WorkDoneProgressEnd())));
  }

  @Test
  void testNotifyProgressReport() {
    String uri = UUID.randomUUID().toString();
    communications.notifyProgressReport(uri);
    verify(client).notifyProgress(new ProgressParams(Either.forLeft(uri), Either.forLeft(new WorkDoneProgressReport())));
  }

  @Test
  void testRegisterExecuteCommandCapability() {
    String capabilityID = "test";
    communications.registerExecuteCommandCapability(Collections.emptyList(), capabilityID);
    Registration registrations =
            new Registration(capabilityID, "workspace/executeCommand", new ExecuteCommandOptions(Collections.emptyList()));
    RegistrationParams params = new RegistrationParams(ImmutableList.of(registrations));
    verify(client).registerCapability(params);
  }

  @Test
  void testUnregisterExecuteCommandCapability() {
    String capabilityID = "test";
    UnregistrationParams unregistrationParams =
            new UnregistrationParams(
                    ImmutableList.of(new Unregistration(capabilityID, "workspace/executeCommand")));
    communications.unregisterExecuteCommandCapability(capabilityID);
    verify(client).unregisterCapability(unregistrationParams);
  }

  private void setUpProgressDataStructure(String data) throws NoSuchFieldException {
    HashSet<String> uriInProgress = new HashSet<>();
    uriInProgress.add(data);
    Field f = communications.getClass().getDeclaredField("uriInProgress");
    f.setAccessible(true);
    try {
      f.set(communications, uriInProgress);
    } catch (IllegalAccessException e) {
      throw new RuntimeException(e);
    }
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
