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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.CobolDocumentModel;
import org.eclipse.lsp.cobol.service.delegates.references.ElementOccurrences;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseEngine;
import org.eclipse.lsp4j.*;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Test Go to Definition works on a COPY statement that is at the end of a file, and the copybook
 * has more lines than the document.
 */
class TestDefinitionOnLongCopybooks {
  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. VSAMTEST.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       COPY {~ABCD}. \n";

  private static final String COPYBOOK_CONTENT =
      "       01 {$*ABCD0}.\n"
          + "           05 {$*ABCD1} PIC 9.\n"
          + "           05 {$*ABCD2} PIC 9.\n"
          + "           05 {$*ABCD3} PIC 9.\n"
          + "           05 {$*ABCD4} PIC 9.\n"
          + "           05 {$*ABCD5} PIC 9.\n"
          + "           05 {$*ABCD6} PIC 9.\n"
          + "           05 {$*ABCD7} PIC 9.\n"
          + "           05 {$*ABCD8} PIC 9.";

  @Test
  void test() {
    AnalysisResult result =
        UseCaseEngine.runTest(
            TEXT, ImmutableList.of(new CobolText("ABCD", COPYBOOK_CONTENT)), ImmutableMap.of());
    List<Location> definitions =
        new ElementOccurrences()
            .findDefinitions(
                new CobolDocumentModel(TEXT, result),
                new TextDocumentPositionParams(
                    new TextDocumentIdentifier(DOCUMENT_URI), new Position(4, 15)));

    assertEquals(1, definitions.size());
    assertEquals(
        new Location(
            "file:///c%3A/workspace/.c4z/.copybooks/ABCD.cpy",
            new Range(new Position(), new Position())),
        definitions.get(0));
  }
}
