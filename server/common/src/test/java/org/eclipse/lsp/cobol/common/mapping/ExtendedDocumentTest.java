/*
 * Copyright (c) 2023 Broadcom.
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
package org.eclipse.lsp.cobol.common.mapping;

import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Test for ExtendedDocument
 */
class ExtendedDocumentTest {
  private static final String TEXT =
      "        IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.\n"
          + "        COPY CPY.\n"
          + "        PROCEDURE DIVISION.";

  private static final String COPYBOOK = "        COPYBOOK LINE 0\n"
      + "        COPYBOOK LINE 1\n"
      + "        COPYBOOK LINE 2\n"
      + "        COPYBOOK LINE 3\n";

  private static final String ONE_LINE_COPY = "        COPYBOOK LINE 0";

  private String documentUri;
  private String copybookUri;
  private ExtendedDocument document;
  private ExtendedText copybook;

  @BeforeEach
  void init() {
    documentUri = UUID.randomUUID().toString();
    copybookUri = UUID.randomUUID().toString();
    document = new ExtendedDocument(TEXT, documentUri);
    copybook = new ExtendedText(COPYBOOK, copybookUri);
  }

  @Test
  void testConstructor() {
    assertFalse(document.isDirty());
    assertEquals(TEXT, document.toString());
    assertEquals(TEXT, document.getOriginalText());
    assertEquals(documentUri, document.getUri());
  }

  @Test
  void testOneLineCopybook() {
    copybook = new ExtendedText(ONE_LINE_COPY, copybookUri);

    Range statementRange = new Range(new Position(4, 8), new Position(4, 15));
    document.insertCopybook(statementRange, copybook);
    assertEquals("        IDENTIFICATION DIVISION.\n"
        + "        PROGRAM-ID. test1.\n"
        + "        DATA DIVISION.\n"
        + "        WORKING-STORAGE SECTION.\n"
        + "        \n"
        + "        COPYBOOK LINE 0\n"
        + "        .\n"
        + "        PROCEDURE DIVISION.",
        document.getCurrentText().toString());
  }

  @Test
  void testInsertCopybookFromStatement() {
    Range statementRange = new Range(new Position(4, 8), new Position(4, 15));
    document.insertCopybook(statementRange, copybook);

    assertTrue(document.isDirty());
    document.commitTransformations();
    assertFalse(document.isDirty());

    Location location = document.mapLocation(new Range(new Position(6, 8), new Position(6, 16)));
    assertEquals(new Range(new Position(1, 8), new Position(1, 16)).toString(), location.getRange().toString());
    assertEquals(copybookUri, location.getUri());

    location = document.mapLocation(new Range(new Position(10, 8), new Position(10, 16)));
    assertEquals(new Range(new Position(5, 8), new Position(5, 16)).toString(), location.getRange().toString());
    assertEquals(documentUri, location.getUri());
  }

  @Test
  void testInsertCopybookAfterLine() {
    document.insertCopybook(5, copybook);

    assertTrue(document.isDirty());
    document.commitTransformations();
    assertFalse(document.isDirty());

    Location location = document.mapLocation(new Range(new Position(6, 8), new Position(6, 16)));
    assertEquals(new Range(new Position(1, 8), new Position(1, 16)).toString(), location.getRange().toString());
    assertEquals(copybookUri, location.getUri());

    location = document.mapLocation(new Range(new Position(9, 8), new Position(9, 16)));
    assertEquals(new Range(new Position(5, 8), new Position(5, 16)).toString(), location.getRange().toString());
    assertEquals(documentUri, location.getUri());
  }


}
