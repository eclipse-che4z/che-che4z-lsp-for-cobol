/*
 * Copyright (c) 2021 Broadcom.
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

package org.eclipse.lsp.cobol.service.utils;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/** This test checks the logic File Service methods that do not interact with the file system */
class WorkspaceFileServiceTest {
  @Test
  void getNameFromURIWithExtension() {
    assertEquals(
        "ACTSOAPI.cbl",
        new WorkspaceFileService()
            .getNameFromURI("file:///c%3A/workspace/POSITIVE_TESTS/positive/ACTSOAPI.cbl"));
  }

  @Test
  void getNameFromURIWithoutExtension() {
    assertEquals(
        "ACTSOAPI",
        new WorkspaceFileService()
            .getNameFromURI("file:///c%3A/workspace/POSITIVE_TESTS/positive/ACTSOAPI"));
  }

  @Test
  void getNameFromURIEmpty() {
    assertEquals("", new WorkspaceFileService().getNameFromURI(""));
  }

  @Test
  void getNameFromURIOnlyNameWithExtension() {
    assertEquals("document.cbl", new WorkspaceFileService().getNameFromURI("document.cbl"));
  }

  @Test
  void getNameFromURIOnlyName() {
    assertEquals("document", new WorkspaceFileService().getNameFromURI("document"));
  }

  @Test
  void getNameFromURIDataset() {
    assertEquals(
        "AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl",
        new WorkspaceFileService()
            .getNameFromURI(
                "file:///c%3A/workspace/POSITIVE_TESTS/.e4e/AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl"));
  }

  @Test
  void getNameFromURIWithQuery() {
    assertEquals(
        "CAWA02-version-0133ED5400EA4E17.cbl",
        new WorkspaceFileService()
            .getNameFromURI(
                "file:///c%3A/workspace/POSITIVE_TESTS/.e4e/CAWA02-version-0133ED5400EA4E17.cbl?%7B%22service%22%3A%7B%22credential%22%3A%7B%22"));
  }

  @Test
  void getNameFromURIWithQueryDataset() {
    assertEquals(
        "AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl",
        new WorkspaceFileService()
            .getNameFromURI(
                "file:///c%3A/workspace/POSITIVE_TESTS/.e4e/AD1DEV.PUBLIC.COTPA01.COBOL(TSTJUST).cbl?%7B%22service%22%3A%7B%22credential%22%3A%7B%22"));
  }
}
