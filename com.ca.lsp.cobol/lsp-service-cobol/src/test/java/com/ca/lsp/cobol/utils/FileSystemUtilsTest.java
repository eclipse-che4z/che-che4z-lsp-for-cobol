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
 *
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.utils;

import com.ca.lsp.cobol.service.utils.FileSystemService;
import com.ca.lsp.cobol.service.utils.WorkspaceFileService;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

/** This class contains unit test about utility methods provided for other components */
public class FileSystemUtilsTest {

  /**
   * This unit test verify that for a given URI with encoded special character, the decode operation
   * will return the original URI before the client encode it.
   */
  @Test
  public void documentUriDecodingTest() {
    String decodedURI = "file:///user/COBOL/HLQ0001.DEMO.COBOL(MEMBFILE).cbl";
    FileSystemService service = new WorkspaceFileService();
    assertEquals(
        decodedURI, service.decodeURI("file:///user/COBOL/HLQ0001.DEMO.COBOL%28MEMBFILE%29.cbl"));
  }
}
