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

import org.junit.jupiter.api.Test;

import static com.ca.lsp.cobol.service.CopybookProcessingMode.*;
import static org.junit.Assert.assertEquals;

class CopybookProcessingModeTest {
  private static final String EXT_SRC_DOC_URI = "file:///c%3A/.c4z/.extsrcs/EXTSRC.cbl";
  private static final String WRONG_EXT_SRC_DOC_URI = "file:///c%3A/.extsrcs/EXTSRC.cbl";
  private static final String FAKE_EXT_SRC_DOC_URI =
      "file:///c%3A/workspace/c4z.extsrcs.EXTSRC.cbl";
  private static final String DOC_URI = "file:///c%3A/EXTSRC.cbl";

  /**
   * This test verifies that when the input COBOL file is an extended document copybook analysis
   * disabled, independently if the file opened in {@link TextDocumentSyncType#DID_OPEN} or {@link
   * TextDocumentSyncType#DID_CHANGE}.
   */
  @Test
  void disableCopybookOnExtendedDocument() {
    assertEquals(DISABLED, getCopybookProcessingMode(EXT_SRC_DOC_URI, "DID_OPEN"));
    assertEquals(DISABLED, getCopybookProcessingMode(EXT_SRC_DOC_URI, "DID_CHANGE"));
  }

  @Test
  void enableCopybookOnNonExtendedDocumentInDidOpen() {
    assertEquals(ENABLED, getCopybookProcessingMode(DOC_URI, "DID_OPEN"));
  }

  @Test
  void disableCopybookOnNonExtendedDocumentInDidChange() {
    assertEquals(DISABLED, getCopybookProcessingMode(DOC_URI, "DID_CHANGE"));
  }

  /**
   * This test verifies that a document that have a name that simulate the presence in the .extsrc
   * folder (but is actually not included in any folder) is not recognized as an extended source
   * file, and the copybook analysis enabled.
   */
  @Test
  void enableCopybookOnFakeURI() {
    assertEquals(ENABLED, getCopybookProcessingMode(FAKE_EXT_SRC_DOC_URI, "DID_OPEN"));
  }

  /**
   * This test verifies that if the document defined in a bad structure (that not respect the
   * requirements to be defined under .c4z/.extsrcs copybook analysis not disabled
   */
  @Test
  void enableCopybookOnBadExtendedSourceFolders() {
    assertEquals(ENABLED, getCopybookProcessingMode(WRONG_EXT_SRC_DOC_URI, "DID_OPEN"));
  }
}
