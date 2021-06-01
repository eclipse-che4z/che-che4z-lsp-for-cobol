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

package org.eclipse.lsp.cobol.service;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import org.eclipse.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp.cobol.positive.CobolText;
import org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.eclipse.lsp.cobol.service.mocks.TestLanguageClient;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.LanguageServer;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.function.Predicate;

import static org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Test the LSP specification for shutdown request
 *
 * <p>Doc ref: https://microsoft.github.io/language-server-protocol/specification#shutdown
 */
public class ClientServerIntegrationTest extends ConfigurableTest {

  private static final String SHUTDOWN_RESPONSE = "InvalidRequest";
  private static final String INCORRECT_TEXT_EXAMPLE = "       IDENTIFICATION DIVISIONs.";
  private static final String LANGUAGE = "COBOL";
  private static final Position TEST_COPYBOOK1 = new Position(20, 14);
  private static final Position TEST_COPYBOOK2 = new Position(21, 14);
  private static final int COPY_LENGTH = "CPYBK1".length();
  private static final String COPYBOOK1 = "       COPY CPYBK1.";
  private static final String COPYBOOK2 = "       COPY CPYBK2.";
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
  @Inject TextDocumentService service;
  @Inject LanguageServer server;
  @Inject TestLanguageClient client;
  @Inject CopybookService copybookService;
  @Inject DisposableLSPStateService stateService;

  /**
   * This method tests that after a shutdown request, {@link TextDocumentService} always return
   * SHUTDOWN_RESPONSE
   *
   * @throws ExecutionException
   * @throws InterruptedException
   */
  @Test
  void whenShutdownIsFired_ThenNewRequestReturnInvalidResponse()
      throws ExecutionException, InterruptedException {

    stateService.shutdown();
    ((CobolTextDocumentService) service).setDisposableLSPStateService(stateService);
    assertEquals(0, stateService.getExitCode());

    CodeActionParams params =
        new CodeActionParams(new TextDocumentIdentifier(DOCUMENT_URI), null, null);
    CompletionParams completionParams =
        new CompletionParams(new TextDocumentIdentifier(DOCUMENT_URI), new Position(0, 8));

    Position position = new Position(0, 2);
    TextDocumentIdentifier testTextDocumentIdentifier = new TextDocumentIdentifier(DOCUMENT_URI);
    TextDocumentPositionParams positionParams =
        new TextDocumentPositionParams(testTextDocumentIdentifier, position);
    ReferenceParams referenceParams = mock(ReferenceParams.class);
    //params.getTextDocument().getUri()
    TextDocumentIdentifier mockTextIdentifier = mock(TextDocumentIdentifier.class);
    when(mockTextIdentifier.getUri()).thenReturn("<TEST-URI>");
    when(referenceParams.getTextDocument()).thenReturn(mockTextIdentifier);

    DocumentFormattingParams mockFormattingParam = mock(DocumentFormattingParams.class);
    when(mockFormattingParam.getTextDocument()).thenReturn(mockTextIdentifier);


    assertEquals(SHUTDOWN_RESPONSE, service.codeAction(params).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.definition(positionParams).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.completion(completionParams).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.references(referenceParams).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.documentHighlight(positionParams).get()); // NOSONAR
    assertEquals(
        SHUTDOWN_RESPONSE, service.formatting(mockFormattingParam).get()); // NOSONAR

    List<TextDocumentContentChangeEvent> textEdits = new ArrayList<>();
    textEdits.add(new TextDocumentContentChangeEvent(INCORRECT_TEXT_EXAMPLE));
    service.didChange(
        new DidChangeTextDocumentParams(
            new VersionedTextDocumentIdentifier(DOCUMENT_URI, 0), textEdits));

    service.didClose(new DidCloseTextDocumentParams(new TextDocumentIdentifier(DOCUMENT_URI)));

    stateService.revokeShutdown();
    assertEquals(1, stateService.getExitCode());
  }

  @Test
  void testFindMultipleCopybookReferences() throws ExecutionException, InterruptedException {
    setUpCopybook();
    List<? extends Location> locations = invokeReferencesRequest(TEST_COPYBOOK1, true);
    assertEquals(4, locations.size());

    assertContainsRange(locations, range(20, 12, COPY_LENGTH));
    assertContainsRange(locations, range(22, 12, COPY_LENGTH));
  }

  @Test
  void testFindSingleCopybookReference() throws ExecutionException, InterruptedException {
    setUpCopybook();
    List<? extends Location> locations = invokeReferencesRequest(TEST_COPYBOOK2, true);
    assertEquals(3, locations.size());

    assertContainsRange(locations, range(21, 12, COPY_LENGTH));
  }

  private void setUpCopybook() throws ExecutionException, InterruptedException {
    client.clean();
    ImmutableList.of(new CobolText("CPYBK1", COPYBOOK1), new CobolText("CPYBK2", COPYBOOK2)).stream()
        .map(UseCaseUtils::toCopybookModel)
        .forEach(copybookService::store);
    service.didOpen(
        new DidOpenTextDocumentParams(new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT)));
    ((CobolTextDocumentService) service).getFutureMap().get(DOCUMENT_URI).get();
  }

  private void assertContainsRange(List<? extends Location> locations, Predicate<Range> range) {
    assertTrue(locations.stream().map(Location::getRange).anyMatch(range));
  }

  private Predicate<Range> range(int line, int character, int length) {
    return it ->
        it.equals(new Range(new Position(line, character), new Position(line, character + length)));
  }

  private List<? extends Location> invokeReferencesRequest(
      Position position, boolean includeDeclaration)
      throws ExecutionException, InterruptedException {
    ReferenceParams referenceParams = new ReferenceParams(new ReferenceContext(includeDeclaration));
    referenceParams.setPosition(position);
    referenceParams.setTextDocument(new TextDocumentIdentifier(DOCUMENT_URI));
    return service.references(referenceParams).get();
  }
}
