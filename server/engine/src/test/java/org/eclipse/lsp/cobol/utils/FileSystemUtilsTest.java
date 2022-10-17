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
package org.eclipse.lsp.cobol.utils;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mockStatic;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import org.eclipse.lsp.cobol.service.utils.FileSystemService;
import org.eclipse.lsp.cobol.service.utils.WorkspaceFileService;
import org.junit.jupiter.api.Test;
import org.mockito.MockedStatic;

/** This class contains unit test about utility methods provided for other components */
class FileSystemUtilsTest {

  /**
   * This unit test verify that for a given URI with encoded special character, the decode operation
   * will return the original URI before the client encode it.
   */
  @Test
  void documentUriDecodingPositiveTest() {
    String decodedURI = "file:///user/COBOL/HLQ0001.DEMO.COBOL(MEMBFILE).cbl";
    FileSystemService service = new WorkspaceFileService();
    assertEquals(
        decodedURI, service.decodeURI("file:///user/COBOL/HLQ0001.DEMO.COBOL%28MEMBFILE%29.cbl"));
  }

  @Test
  void documentUriDecodingNegativeTest() {
    String decodedURI = "file:///user/COBOL/HLQ0001.DEMO.COBOL(MEMBFILE).cbl";
    try (MockedStatic<URLDecoder> urlDecoderMock = mockStatic(URLDecoder.class)) {
      FileSystemService fileSystemService = new WorkspaceFileService();

      urlDecoderMock.when(() -> URLDecoder.decode(eq(decodedURI), anyString()))
          .thenThrow(UnsupportedEncodingException.class);

      IllegalArgumentException exception = assertThrows(IllegalArgumentException.class, () -> {
        fileSystemService.decodeURI(decodedURI);
      });

      assertEquals("UTF-8 charset is unsupported", exception.getMessage());

    }

  }
}
