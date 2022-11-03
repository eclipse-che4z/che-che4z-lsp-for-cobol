/*
 * Copyright (c) 2022 Broadcom.
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
package org.eclipse.lsp.cobol.service.copybooks;

import com.google.common.collect.ImmutableList;
import org.eclipse.lsp4j.TextDocumentItem;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

/** Tests @{@link CopybookIdentificationServiceBasedOnContent} */
class CopybookIdentificationServiceBasedOnContentTest {

  @Test
  void WhenCobolThenReturnFalse() {
    String content =
        "      *RETRIEVAL                                                        00340200\n"
            + "      *DMLIST                                                           00340301\n"
            + "       IDENTIFICATION DIVISION.                                         00340401\n"
            + "      /PROGRAM-ID.    EMPRPT.                                           00340501\n"
            + "       PROGRAM-ID.    EMPRPT.                                           00340501\n"
            + "      * REMARKS.      THIS PROGRAM PRODUCES A REPORT OF INFO            00340601";
    CopybookIdentificationService service = new CopybookIdentificationServiceBasedOnContent();
    TextDocumentItem doc = new TextDocumentItem();
    doc.setText(content);
    Assertions.assertFalse(service.isCopybook(doc.getUri(), doc.getText(), ImmutableList.of()));
  }

  @Test
  void WhenProgramIDCommentedThenReturnTrue() {
    String content =
        "      *RETRIEVAL                                                        00340200\n"
            + "      *DMLIST                                                           00340301\n"
            + "       IDENTIFICATION DIVISION.                                         00340401\n"
            + "      /PROGRAM-ID.    EMPRPT.                                           00340501\n"
            + "      *PROGRAM-ID.    EMPRPT.                                           00340501\n"
            + "      * REMARKS.      THIS PROGRAM PRODUCES A REPORT OF INFO            00340601";
    CopybookIdentificationService service = new CopybookIdentificationServiceBasedOnContent();
    TextDocumentItem doc = new TextDocumentItem();
    doc.setText(content);
    Assertions.assertTrue(service.isCopybook(doc.getUri(), doc.getText(), ImmutableList.of()));
  }

  @Test
  void WhenNoProgramIDCommentedThenReturnTrue() {
    String content =
        "      *RETRIEVAL                                                        00340200\n"
            + "      *DMLIST                                                           00340301\n"
            + "       IDENTIFICATION DIVISION.                                         00340401\n"
            + "      * REMARKS.      THIS PROGRAM PRODUCES A REPORT OF INFO            00340601";
    CopybookIdentificationService service = new CopybookIdentificationServiceBasedOnContent();
    TextDocumentItem doc = new TextDocumentItem();
    doc.setText(content);
    Assertions.assertTrue(service.isCopybook(doc.getUri(), doc.getText(), ImmutableList.of()));
  }
}
