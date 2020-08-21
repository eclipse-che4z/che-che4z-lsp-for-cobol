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

package com.ca.lsp.cobol.service.delegates.communications;

import com.ca.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp4j.MessageParams;
import org.eclipse.lsp4j.MessageType;
import org.eclipse.lsp4j.services.LanguageClient;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentCaptor.forClass;
import static org.mockito.Mockito.*;

/** This unit tests verifies the capabilities of {@link ServerCommunications} */
class ServerCommunicationsTest {
  // TODO: Cover the rest of the methods
  /**
   * Method {@link ServerCommunications#notifyThatDocumentAnalysed(String)} should asynchronously
   * call logging on the client for a specific message with a document name retrieved from uri
   */
  @Test
  void testNotifyThatDocumentAnalysed() {
    assertDocumentAnalysedNotification(DOCUMENT_URI, "document.cbl");
    assertDocumentAnalysedNotification("document.cbl", "document.cbl");
    assertDocumentAnalysedNotification("", "");
  }

  private void assertDocumentAnalysedNotification(String uri, String fileName) {
    LanguageClient client = mock(LanguageClient.class);
    FileSystemService files = mock(FileSystemService.class);
    when(files.decodeURI(uri)).thenReturn(uri);
    ServerCommunications communications = new ServerCommunications(() -> client, files);
    ArgumentCaptor<MessageParams> captor = forClass(MessageParams.class);

    communications.notifyThatDocumentAnalysed(uri);
    verify(client, timeout(10000).times(1)).logMessage(captor.capture());
    assertEquals(
        new MessageParams(MessageType.Info, "No syntax errors detected in " + fileName),
        captor.getValue());
  }
}
