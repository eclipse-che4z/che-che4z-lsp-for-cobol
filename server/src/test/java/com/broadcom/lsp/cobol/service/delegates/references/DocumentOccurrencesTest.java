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

package com.broadcom.lsp.cobol.service.delegates.references;

import com.broadcom.lsp.cobol.ConfigurableTest;
import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.service.CopybookService;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.broadcom.lsp.cobol.service.mocks.TestLanguageClient;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.function.Predicate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** This class checks the expected behavior of Go to Definition request resolving. */
class DocumentOccurrencesTest extends ConfigurableTest {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   outer1. \n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       01   outer2.\n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       02   Str          PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       000-Main-Logic.\n"
          + "           Perform 100-Test.\n"
          + "           Stop Run.\n"
          + "       100-Test.\n"
          + "           Move inner1 of outer1 to Str.\n"
          + "           Move inner2 of outer1 to Str.\n"
          + "           Move inner1 of outer2 to Str.\n"
          + "           Move inner2 of outer2 to Str.\n"
          + "       COPY CPYBK1.\n"
          + "       COPY CPYBK2.\n"
          + "       COPY CPYBK1.\n"
          + "       End program ProgramId.";

  private static final Position INNER1_POSITION = new Position(16, 18);
  private static final Position OUTER1_POSITION = new Position(16, 28);
  private static final Position MAIN_POSITION = new Position(12, 10);
  private static final Position TEST_POSITION = new Position(15, 10);
  private static final Position TEST_COPYBOOK1 = new Position(20, 14);
  private static final Position TEST_COPYBOOK2 = new Position(21, 14);
  private static final Position DIVISION_POSITION = new Position(11, 18);
  private static final int INNER1_LENGTH = "inner1".length();
  private static final int OUTER1_LENGTH = "outer1".length();
  private static final int MAIN_LENGTH = "000-Main-Logic".length();
  private static final int TEST_LENGTH = "100-Test".length();
  private static final int COPY_LENGTH = "CPYBK1".length();
  private static final String COPYBOOK1 = "       COPY CPYBK1.";
  private static final String COPYBOOK2 = "       COPY CPYBK2.";

  private TextDocumentService service;

  @BeforeEach
  void createService() {
    service = injector.getInstance(TextDocumentService.class);
    TestLanguageClient client = injector.getInstance(TestLanguageClient.class);
    client.clean();
    CopybookService copybookService = injector.getInstance(CopybookService.class);
    List.of(new CobolText("CPYBK1", COPYBOOK1), new CobolText("CPYBK2", COPYBOOK2)).stream()
        .map(UseCaseUtils::toCopybookModel)
        .forEach(copybookService::store);
    UseCaseUtils.runTextValidation(service, TEXT);
    UseCaseUtils.waitForDiagnostics(client);
  }

  @Test
  void testFindDefinitionForVariableReturnsTwoLocations()
      throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeDefinitionsRequest(INNER1_POSITION);

    assertEquals(2, locations.size());
    Assertions.assertEquals(UseCaseUtils.DOCUMENT_URI, locations.get(0).getUri());

    assertContainsRange(locations, range(5, 13, INNER1_LENGTH));
    assertContainsRange(locations, range(8, 13, INNER1_LENGTH));
  }

  @Test
  void testFindDefinitionForKeywordReturnsEmpty() throws ExecutionException, InterruptedException {
    assertEquals(0, invokeDefinitionsRequest(DIVISION_POSITION).size());
  }

  @Test
  void testFindAllReferencesForKeywordReturnsEmpty()
      throws ExecutionException, InterruptedException {
    assertEquals(0, invokeReferencesRequest(DIVISION_POSITION, true).size());
  }

  @Test
  void testFindAllReferencesIncludeDeclaration() throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeReferencesRequest(INNER1_POSITION, true);
    assertEquals(4, locations.size());

    assertContainsRange(locations, range(5, 13, INNER1_LENGTH));
    assertContainsRange(locations, range(8, 13, INNER1_LENGTH));
    assertContainsRange(locations, range(16, 16, INNER1_LENGTH));
    assertContainsRange(locations, range(18, 16, INNER1_LENGTH));
  }

  @Test
  void testFindAllReferencesExcludeDeclaration() throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeReferencesRequest(INNER1_POSITION, false);
    assertEquals(2, locations.size());
    assertContainsRange(locations, range(16, 16, INNER1_LENGTH));
    assertContainsRange(locations, range(18, 16, INNER1_LENGTH));
  }

  @Test
  void testFindAllReferencesForStructure() throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeReferencesRequest(OUTER1_POSITION, true);
    assertEquals(3, locations.size());

    assertContainsRange(locations, range(4, 12, OUTER1_LENGTH));
    assertContainsRange(locations, range(16, 26, OUTER1_LENGTH));
    assertContainsRange(locations, range(17, 26, OUTER1_LENGTH));
  }

  @Test
  void testFindAllReferencesForParagraphIncludeDeclaration()
      throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeReferencesRequest(TEST_POSITION, true);
    assertEquals(2, locations.size());

    assertContainsRange(locations, range(13, 19, TEST_LENGTH));
    assertContainsRange(locations, range(15, 7, TEST_LENGTH));
  }

  @Test
  void testFindAllReferencesForParagraphIncludeDeclarationOneOccurrence()
      throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeReferencesRequest(MAIN_POSITION, true);
    assertEquals(1, locations.size());

    assertContainsRange(locations, range(12, 7, MAIN_LENGTH));
  }

  @Test
  void testFindDeclarationForParagraph() throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeDefinitionsRequest(TEST_POSITION);
    assertEquals(1, locations.size());
    assertContainsRange(locations, range(15, 7, TEST_LENGTH));
  }

  @Test
  void testFindMultipleCopybookReferences() throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeReferencesRequest(TEST_COPYBOOK1, true);
    assertEquals(4, locations.size());

    assertContainsRange(locations, range(20, 12, COPY_LENGTH));
    assertContainsRange(locations, range(22, 12, COPY_LENGTH));
  }

  @Test
  void testFindSingleCopybookReference() throws ExecutionException, InterruptedException {
    List<? extends Location> locations = invokeReferencesRequest(TEST_COPYBOOK2, true);
    assertEquals(3, locations.size());

    assertContainsRange(locations, range(21, 12, COPY_LENGTH));
  }

  private List<? extends Location> invokeDefinitionsRequest(Position position)
      throws ExecutionException, InterruptedException {
    return service
        .definition(
            new TextDocumentPositionParams(new TextDocumentIdentifier(UseCaseUtils.DOCUMENT_URI), position))
        .get();
  }

  private List<? extends Location> invokeReferencesRequest(
      Position position, boolean includeDeclaration)
      throws ExecutionException, InterruptedException {
    ReferenceParams referenceParams = new ReferenceParams(new ReferenceContext(includeDeclaration));
    referenceParams.setPosition(position);
    referenceParams.setTextDocument(new TextDocumentIdentifier(UseCaseUtils.DOCUMENT_URI));
    return service.references(referenceParams).get();
  }

  private void assertContainsRange(List<? extends Location> locations, Predicate<Range> range) {
    assertTrue(locations.stream().map(Location::getRange).anyMatch(range));
  }

  private Predicate<Range> range(int line, int character, int length) {
    return it ->
        it.equals(new Range(new Position(line, character), new Position(line, character + length)));
  }
}
