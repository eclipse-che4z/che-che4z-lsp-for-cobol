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

package org.eclipse.lsp.cobol.dialects.ibm;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.eclipse.lsp.cobol.common.CleanerPreprocessor;
import org.eclipse.lsp.cobol.common.error.SyntaxError;
import org.eclipse.lsp.cobol.common.message.MessageService;
import org.eclipse.lsp.cobol.service.settings.layout.CodeLayoutStore;
import org.junit.jupiter.api.Test;

/** This test checks multiple comment entries are parsed and cleaned up correctly */
class TestCommentLines {
  public static final String DOCUMENT_URI = "file:///c:/workspace/document.cbl";
  private static final String TEXT =
      "      * Copyright (c) 2021 Broadcom.\n"
          + "      * The term Broadcom  refers to Broadcom Inc. and/or its subsidiaries.\n"
          + "000010 IDENTIFICATION DIVISION.                                         qweasdzx\n"
          + "000020*    Comment line                                                 qweasdzx\n"
          + "\n"
          + "000022*> Floating comment                                               qweasdzx\n"
          + "000025 *> 25 Floating comment  w/o space      qweasdzx\n"
          + "000030 PROGRAM-ID. comments.    *> Floating comment\n";

  private static final String EXPECTED =
      "       \n"
          + "       \n"
          + "       IDENTIFICATION DIVISION.\n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       \n"
          + "       PROGRAM-ID. comments.    ";

  @Test
  void test() {
    List<SyntaxError> accumulatedErrors = new ArrayList<>();
    MessageService messageService = mock(MessageService.class);
    CodeLayoutStore store = mock(CodeLayoutStore.class);
    when(store.getCodeLayout()).thenReturn(Optional.empty());

    CleanerPreprocessor textPreprocessor =
        new IbmTextPreprocessor(messageService, store);
    String actual =
        textPreprocessor.cleanUpCode(DOCUMENT_URI, TEXT).unwrap(accumulatedErrors::addAll).toString();
    assertEquals(EXPECTED, actual);
    assertTrue(accumulatedErrors.isEmpty());
  }
}
