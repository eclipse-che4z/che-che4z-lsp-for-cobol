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

import static java.util.Collections.emptyList;
import static org.eclipse.lsp.cobol.test.engine.UseCaseUtils.DOCUMENT_URI;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Inject;
import com.google.inject.Injector;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.function.Predicate;
import org.eclipse.lsp.cobol.ClientServerTestModule;
import org.eclipse.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.domain.modules.DatabusModule;
import org.eclipse.lsp.cobol.lsp.CobolTextDocumentService;
import org.eclipse.lsp.cobol.lsp.CobolWorkspaceServiceImpl;
import org.eclipse.lsp.cobol.lsp.DisposableLSPStateService;
import org.eclipse.lsp.cobol.lsp.LspEventConsumer;
import org.eclipse.lsp.cobol.lsp.LspMessageBroker;
import org.eclipse.lsp.cobol.lsp.events.queries.CodeActionQuery;
import org.eclipse.lsp.cobol.lsp.handlers.text.CodeActionHandler;
import org.eclipse.lsp.cobol.service.mocks.MockLanguageClient;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.*;

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
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   {$*outer1}. \n"
          + "        02   {$*inner1}      PIC 9(4) Binary. \n"
          + "        02   {$*inner2}      PIC X(10).\n"
          + "       01   {$*outer2}.\n"
          + "        02   {$*inner1}      PIC 9(4) Binary. \n"
          + "        02   {$*inner2}      PIC X(10).\n"
          + "       02   {$*Str}          PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       {#*000-Main-Logic}.\n"
          + "           Perform {#100-Test}.\n"
          + "           Stop Run.\n"
          + "       {#*100-Test}.\n"
          + "           Move {$inner1} of {$outer1} to {$Str}.\n"
          + "           Move {$inner2} of {$outer1} to {$Str}.\n"
          + "           Move {$inner1} of {$outer2} to {$Str}.\n"
          + "           Move {$inner2} of {$outer2} to {$Str}.\n"
          + "       {_COPY {~CPYBK1|1}.|3_}\n"
          + "       {_COPY {~CPYBK2|2}.|3_}\n"
          + "       {_COPY {~CPYBK1|1}.|3_}\n"
          + "       End program ProgramId.";
  @Inject TextDocumentService service;
  @Inject
  LspMessageBroker lspMessageBroker;
  @Inject MockLanguageClient client;
  @Inject LspEventConsumer lspEventConsumer;
  @Inject
  DisposableLSPStateService stateService;

  @BeforeAll
  void setup() {
    lspEventConsumer.startConsumer();
  }
  @AfterAll
  void tearDown() throws InterruptedException {
    lspMessageBroker.stop();
  }

  /**
   * This method tests that after a shutdown request, {@link TextDocumentService} always return
   * SHUTDOWN_RESPONSE
   *
   * @throws ExecutionException
   * @throws InterruptedException
   */
  @Test
  @Disabled("Asserts are not valid anymore")
  void whenShutdownIsFired_ThenNewRequestReturnInvalidResponse()
      throws ExecutionException, InterruptedException {

    stateService.shutdown();
    assertEquals(0, stateService.getExitCode());

    CodeActionParams params =
        new CodeActionParams(new TextDocumentIdentifier(DOCUMENT_URI), new Range(), new CodeActionContext());
    CompletionParams completionParams =
        new CompletionParams(new TextDocumentIdentifier(DOCUMENT_URI), new Position(0, 8));

    Position position = new Position(0, 2);
    TextDocumentIdentifier testTextDocumentIdentifier = new TextDocumentIdentifier(DOCUMENT_URI);
    DocumentHighlightParams documentHighlightParams =
            new DocumentHighlightParams(testTextDocumentIdentifier, position);
    DefinitionParams definitionParams = new DefinitionParams(testTextDocumentIdentifier, position);
    ReferenceParams referenceParams = mock(ReferenceParams.class);
    // params.getTextDocument().getUri()
    TextDocumentIdentifier mockTextIdentifier = mock(TextDocumentIdentifier.class);
    when(mockTextIdentifier.getUri()).thenReturn("<TEST-URI>");
    when(referenceParams.getTextDocument()).thenReturn(mockTextIdentifier);

    DocumentFormattingParams mockFormattingParam = mock(DocumentFormattingParams.class);
    when(mockFormattingParam.getTextDocument()).thenReturn(mockTextIdentifier);

    assertEquals(SHUTDOWN_RESPONSE, service.codeAction(params).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.definition(definitionParams).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.completion(completionParams).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.references(referenceParams).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.documentHighlight(documentHighlightParams).get()); // NOSONAR
    assertEquals(SHUTDOWN_RESPONSE, service.formatting(mockFormattingParam).get()); // NOSONAR

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
  // FIXME: enable me back
  @Disabled
  void testFindMultipleCopybookReferences() throws ExecutionException, InterruptedException {
    client.clean();
    Injector injector = createInjector();
    LspMessageBroker lspMessageBroker = injector.getInstance(LspMessageBroker.class);
    TextDocumentService textService = injector.getInstance(TextDocumentService.class);
    AnalysisService analysisService = injector.getInstance(AnalysisService.class);
    LspEventConsumer lspEventConsumer = injector.getInstance(LspEventConsumer.class);
    analysisService.setExtensionConfig(ImmutableList.of());

    lspEventConsumer.startConsumer();

    textService.didOpen(
        new DidOpenTextDocumentParams(new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT)));
    List<? extends Location> locations = invokeReferencesRequest(TEST_COPYBOOK1, true, textService);
    CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery = waitingQuery(lspMessageBroker);
    waitingQuery.join();
    lspMessageBroker.stop();
    assertEquals(4, locations.size());

    assertContainsRange(locations, range(20, 12, COPY_LENGTH));
    assertContainsRange(locations, range(22, 12, COPY_LENGTH));
  }

  @Test
  @Disabled("freezes the test run")
  void testFindSingleCopybookReference() throws ExecutionException, InterruptedException {
    client.clean();
    Injector injector = createInjector();
    AnalysisService analysisService = injector.getInstance(AnalysisService.class);
    TextDocumentService textService = injector.getInstance(TextDocumentService.class);
    LspMessageBroker lspMessageBroker = injector.getInstance(LspMessageBroker.class);
    LspEventConsumer lspEventConsumer = injector.getInstance(LspEventConsumer.class);
    lspEventConsumer.startConsumer();
    analysisService.setExtensionConfig(ImmutableList.of());
    CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery = waitingQuery(lspMessageBroker);
    textService.didOpen(
        new DidOpenTextDocumentParams(new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT)));
    List<? extends Location> locations = invokeReferencesRequest(TEST_COPYBOOK2, true, textService);
    waitingQuery.join();
    lspMessageBroker.stop();
    assertEquals(3, locations.size());

    assertContainsRange(locations, range(21, 12, COPY_LENGTH));
  }

  private Injector createInjector() {
    return Guice.createInjector(
        new DatabusModule(),
        new ClientServerTestModule(),
        new AbstractModule() {
          @Override
          protected void configure() {
            bind(LanguageEngineFacade.class).to(ClientServerIntegrationTestImpl.class);
            bind(TextDocumentService.class).to(CobolTextDocumentService.class);
            bind(LspEventConsumer.class).to(CobolWorkspaceServiceImpl.class);
          }
        });
  }

  private void assertContainsRange(List<? extends Location> locations, Predicate<Range> range) {
    assertTrue(locations.stream().map(Location::getRange).anyMatch(range));
  }

  private Predicate<Range> range(int line, int character, int length) {
    return it ->
        it.equals(new Range(new Position(line, character), new Position(line, character + length)));
  }

  private List<? extends Location> invokeReferencesRequest(
      Position position, boolean includeDeclaration, TextDocumentService textService)
      throws ExecutionException, InterruptedException {
    ReferenceParams referenceParams = new ReferenceParams(new ReferenceContext(includeDeclaration));
    referenceParams.setPosition(position);
    referenceParams.setTextDocument(new TextDocumentIdentifier(DOCUMENT_URI));
    return textService.references(referenceParams).get();
  }

  private static CompletableFuture<List<Either<Command, CodeAction>>> waitingQuery(LspMessageBroker lspMessageBroker) {
    CodeActionParams params = mock(CodeActionParams.class);
    CodeActionHandler codeActionHandler = mock(CodeActionHandler.class);
    when(codeActionHandler.codeAction(params)).thenReturn(emptyList());
    CodeActionQuery codeActionQuery = new CodeActionQuery(params, codeActionHandler);
    lspMessageBroker.query(codeActionQuery);
    return codeActionQuery.getResult();
  }
}
