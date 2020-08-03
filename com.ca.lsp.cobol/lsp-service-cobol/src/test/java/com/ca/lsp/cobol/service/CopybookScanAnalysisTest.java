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
 *   Broadcom, Inc. - initial API and implementation
 */
package com.ca.lsp.cobol.service;

import org.junit.Test;

import static com.ca.lsp.cobol.service.CopybookScanAnalysis.*;
import static org.junit.Assert.assertEquals;

public class CopybookScanAnalysisTest {
  private static final String EXT_SRC_DOC_URI = "file://.c4z/.extsrc/EXTSRC.cbl";
  private static final String DOC_URI = "file://EXTSRC.cbl";

  /**
   * This test verify that when the input COBOL file is an extended document copybook analysis is
   * disabled, indipendetly if the file is opened in {@link TextDocumentSyncType#DID_OPEN} or {@link
   * TextDocumentSyncType#DID_CHANGE}.
   */
  @Test
  public void disableCopybookOnExtendedDocument() {
    assertEquals(DISABLED, getCopybookScanAnalysis(EXT_SRC_DOC_URI, "DID_OPEN"));
    assertEquals(DISABLED, getCopybookScanAnalysis(EXT_SRC_DOC_URI, "DID_CHANGE"));
  }

  @Test
  public void enableCopybookOnNonExtendedDocumentInDidOpen() {
    assertEquals(ENABLED, getCopybookScanAnalysis(DOC_URI, "DID_OPEN"));
  }

  @Test
  public void disableCopybookOnNonExtendedDocumentInDidChange() {
    assertEquals(DISABLED, getCopybookScanAnalysis(DOC_URI, "DID_CHANGE"));
  }
}
