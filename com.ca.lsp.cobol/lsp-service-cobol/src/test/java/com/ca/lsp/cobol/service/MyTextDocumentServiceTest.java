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

import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.DataEventType;
import com.broadcom.lsp.domain.cobol.event.model.RunAnalysisEvent;
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.service.delegates.actions.CodeActions;
import com.ca.lsp.cobol.service.delegates.communications.Communications;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.internal.stubbing.answers.AnswersWithDelay;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.function.Function;

import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_CHANGE;
import static com.ca.lsp.cobol.service.TextDocumentSyncType.DID_OPEN;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/** This test checks the entry points of the {@link TextDocumentService} implementation. */
public class MyTextDocumentServiceTest extends ConfigurableTest {

  private static final String LANGUAGE = "COBOL";
  private static final String CPY_DOCUMENT_URI = "file:///.copybooks/CPYTEST.cpy";
  private static final String CPY_EXTENSION = "cpy";
  private static final String TEXT_EXAMPLE = "       IDENTIFICATION DIVISION.";
  private static final String INCORRECT_TEXT_EXAMPLE = "       IDENTIFICATION DIVISIONs.";
  private static final String DOCUMENT_WITH_ERRORS_URI =
      "file:///c%3A/workspace/incorrect_document.cbl";

  private TextDocumentService service;
  private TestLanguageClient client;

  @Before
  public void createService() {
    service = LangServerCtx.getInjector().getInstance(TextDocumentService.class);
    client = LangServerCtx.getInjector().getInstance(TestLanguageClient.class);
    client.clean();
  }

  @Test
  public void testCompletion() {
    openAndAwait();
    CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion =
        service.completion(
            new CompletionParams(
                new TextDocumentIdentifier(DOCUMENT_URI), new Position(0, 8))); // The
    // position of "Identification division"
    assertCompletionCorrect(completion);
  }

  @Test
  public void testDidChange() {
    List<TextDocumentContentChangeEvent> textEdits = new ArrayList<>();
    textEdits.add(new TextDocumentContentChangeEvent(INCORRECT_TEXT_EXAMPLE));
    service.didChange(
        new DidChangeTextDocumentParams(
            new VersionedTextDocumentIdentifier(DOCUMENT_URI, 0), textEdits));
    UseCaseUtils.waitForDiagnostics(client);
    Range range = retrieveRange(client);
    assertRange(range);
  }

  @Test
  public void testDidChangeOnCpyFiles() {
    List<TextDocumentContentChangeEvent> textEdits = new ArrayList<>();
    textEdits.add(new TextDocumentContentChangeEvent(INCORRECT_TEXT_EXAMPLE));
    MyTextDocumentService spyService = spy((MyTextDocumentService) service);
    spyService.didChange(
        new DidChangeTextDocumentParams(
            new VersionedTextDocumentIdentifier(CPY_DOCUMENT_URI, 0), textEdits));
    verify(spyService, never()).analyzeChanges(any(), any());
  }

  @Test
  public void testDidClose() {
    openAndAwait();
    assertEquals(1, closeGetter(service).size());
    TextDocumentIdentifier testDocument = new TextDocumentIdentifier(DOCUMENT_URI);
    DidCloseTextDocumentParams closedDocument = new DidCloseTextDocumentParams(testDocument);
    service.didClose(closedDocument);
    assertEquals(Collections.EMPTY_MAP, closeGetter(service));
  }

  @Test
  public void testDidSave() {
    TextDocumentIdentifier saveDocumentIdentifier = new TextDocumentIdentifier(DOCUMENT_URI);
    DidSaveTextDocumentParams saveDocumentParams =
        new DidSaveTextDocumentParams(saveDocumentIdentifier);
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
    service.didSave(saveDocumentParams);
    assertTrue(closeGetter(service).containsKey(DOCUMENT_URI));
  }

  @Test
  public void testIncorrectLanguageId() {
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, "incorrectId", 1, TEXT_EXAMPLE)));
    await(() -> !client.getMessagesToShow().isEmpty());
    assertTrue(
        client.getMessagesToShow().stream()
            .map((Function<MessageParams, Object>) MessageParams::getMessage)
            .anyMatch(
                it ->
                    it.toString()
                        .equals(
                            "Cannot find a language engine for the given language ID: incorrectId")));
  }

  @Test
  public void testNotAllowedFileExtensionAnalysis() {
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(CPY_DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
    await(() -> !client.getMessagesToShow().isEmpty());
    assertTrue(
        client.getMessagesToShow().stream()
            .map((Function<MessageParams, Object>) MessageParams::getMessage)
            .anyMatch(
                it ->
                    it.toString()
                        .equals("The given document extension is unsupported: " + CPY_EXTENSION)));
  }

  /**
   * This test checks that {@link MyTextDocumentService} is subscribed to the databus events and may
   * re-run analysis of the open documents if it receives a notification.
   */
  @Test
  public void observerCallback() {

    // configured mock object and diagnostic stubs
    Communications communications = mock(Communications.class);
    LanguageEngineFacade engine = mock(LanguageEngineFacade.class);
    DataBusBroker broker = mock(DataBusBroker.class);
    List<Diagnostic> diagnosticsNoErrors = Collections.emptyList();
    List<Diagnostic> diagnosticsWithErrors = createDefaultDiagnostics();

    // created two dummy analysis result, one with error and another without
    // those object will be used as result of dynamic stubbing stage
    AnalysisResult resultNoErrors =
        new AnalysisResult(diagnosticsNoErrors, null, null, null, null, null, null);
    AnalysisResult resultWithErrors =
        new AnalysisResult(diagnosticsWithErrors, null, null, null, null, null, null);

    /*
     * Defined dynamic response based on the possible combinations available when the document analyzed:
     *  - text document sync state: [DID_OPEN|DID_CHANGE]
     *  - document URI [correct|incorrect]
     */

    // dynamic stubbing for did open event
    when(engine.analyze(DOCUMENT_URI, TEXT_EXAMPLE, DID_OPEN)).thenReturn(resultNoErrors);
    when(engine.analyze(DOCUMENT_WITH_ERRORS_URI, INCORRECT_TEXT_EXAMPLE, DID_OPEN))
        .thenReturn(resultWithErrors);

    // dynamic stubbing for did change event
    when(engine.analyze(DOCUMENT_URI, TEXT_EXAMPLE, DID_CHANGE)).thenReturn(resultNoErrors);
    when(engine.analyze(DOCUMENT_WITH_ERRORS_URI, INCORRECT_TEXT_EXAMPLE, DID_CHANGE))
        .thenReturn(resultWithErrors);

    // create a service and verify is subscribed to the required event
    MyTextDocumentService service = verifyServiceStart(communications, engine, broker);

    // simulate the call to the didOpen for two different document one with and one without errors
    verifyDidOpen(communications, engine, diagnosticsNoErrors, service, TEXT_EXAMPLE, DOCUMENT_URI);
    verifyDidOpen(
        communications,
        engine,
        diagnosticsWithErrors,
        service,
        INCORRECT_TEXT_EXAMPLE,
        DOCUMENT_WITH_ERRORS_URI);

    // after the simulation for triggering the observer callback verify that the analysis method
    // (more in general the document analysis stage) is triggered
    service.observerCallback(new RunAnalysisEvent());

    /* After sending a message on the data bus we'll verify that the document analyzed by the preprocessor.
    More in detail we'll check:
            - analysis invoked two times (because two documents opened previously)
            - the diagnostic published exactly 2 times after the syntax/semantic analysis invoked.
            */
    verifyCallback(communications, engine, diagnosticsNoErrors, TEXT_EXAMPLE, DOCUMENT_URI);
    verifyCallback(
        communications,
        engine,
        diagnosticsWithErrors,
        INCORRECT_TEXT_EXAMPLE,
        DOCUMENT_WITH_ERRORS_URI);
  }

  /**
   * Test on the textDocument/codeAction request the {@link CodeActions} delegate called. The
   * specific logic tested in {@link com.ca.lsp.cobol.service.delegates.actions.CodeActionsTest},
   * here it is only to verify that the {@link MyTextDocumentService#codeAction(CodeActionParams)}
   * calls the {@link CodeActions#collect(CodeActionParams)}
   */
  @Test
  public void testCodeActionsEndpoint() {
    DataBusBroker broker = mock(DataBusBroker.class);
    CodeActions actions = mock(CodeActions.class);

    CodeActionParams params =
        new CodeActionParams(new TextDocumentIdentifier(DOCUMENT_URI), null, null);
    List<Either<Command, CodeAction>> expected = emptyList();

    when(actions.collect(params)).thenReturn(expected);

    MyTextDocumentService service =
        new MyTextDocumentService(null, null, null, null, null, broker, actions);
    try {
      assertEquals(expected, service.codeAction(params).get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    verify(actions).collect(params);
  }

  private List<Diagnostic> createDefaultDiagnostics() {
    return singletonList(
        new Diagnostic(
            new Range(new Position(0, 0), new Position(0, INCORRECT_TEXT_EXAMPLE.length())),
            INCORRECT_TEXT_EXAMPLE));
  }

  private MyTextDocumentService verifyServiceStart(
      Communications communications, LanguageEngineFacade engine, DataBusBroker broker) {
    MyTextDocumentService service =
        new MyTextDocumentService(communications, engine, null, null, null, broker, null);

    verify(broker).subscribe(DataEventType.RUN_ANALYSIS_EVENT, service);
    return service;
  }

  private void verifyDidOpen(
      Communications communications,
      LanguageEngineFacade engine,
      List<Diagnostic> diagnostics,
      MyTextDocumentService service,
      String textToAnalyse,
      String uri) {
    service.didOpen(
        new DidOpenTextDocumentParams(new TextDocumentItem(uri, LANGUAGE, 0, textToAnalyse)));
    verify(communications).notifyThatLoadingInProgress(uri);
    verify(engine, timeout(10000)).analyze(uri, textToAnalyse, DID_OPEN);
    verify(communications, timeout(10000)).cancelProgressNotification(uri);
    verify(communications, timeout(10000)).publishDiagnostics(uri, diagnostics);
  }

  private void verifyCallback(
      Communications communications,
      LanguageEngineFacade engine,
      List<Diagnostic> diagnostics,
      String text,
      String uri) {

    verify(engine, timeout(10000).times(2)).analyze(uri, text, DID_OPEN);
    verify(communications, times(2)).publishDiagnostics(uri, diagnostics);
  }

  /**
   * Check there were no NullPointerException thrown if a {@link
   * TextDocumentService#didClose(DidCloseTextDocumentParams)} is invoked when {@link
   * TextDocumentService#didOpen(DidOpenTextDocumentParams)} processing is not finished yet. If it
   * was thrown then async task inside the service falls and {@link
   * Communications#cancelProgressNotification(String)} is not called.
   */
  @Test
  public void testImmediateClosingOfDocumentDoNotCauseNPE() {
    DataBusBroker broker = mock(DataBusBroker.class);
    Communications communications = mock(Communications.class);
    LanguageEngineFacade engine = mock(LanguageEngineFacade.class);

    doAnswer(new AnswersWithDelay(1000, invocation -> AnalysisResult.empty()))
        .when(engine)
        .analyze(DOCUMENT_URI, TEXT_EXAMPLE, DID_OPEN);

    MyTextDocumentService service =
        new MyTextDocumentService(communications, engine, null, null, null, broker, null);

    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));

    assertEquals(1, service.getDocs().size());

    service.didClose(new DidCloseTextDocumentParams(new TextDocumentIdentifier(DOCUMENT_URI)));
    assertEquals(0, service.getDocs().size());

    verify(communications, timeout(2000)).cancelProgressNotification(DOCUMENT_URI);
  }

  @Ignore("Not implemented yet")
  @Test
  public void testHover() {
    TextDocumentItem testHoverDocument =
        new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE);
    service.didOpen(new DidOpenTextDocumentParams(testHoverDocument));
    Position testHoverPosition = new Position(0, 2);
    TextDocumentIdentifier testTextDocumentIdentifier = new TextDocumentIdentifier(DOCUMENT_URI);
    TextDocumentPositionParams testHoverPositionParams =
        new TextDocumentPositionParams(testTextDocumentIdentifier, testHoverPosition);
    try {
      assertNotNull(service.hover(testHoverPositionParams).get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  private void openAndAwait() {
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
    waitForDiagnostics(client);
  }

  private void assertCompletionCorrect(
      CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion) {
    try {
      Either<List<CompletionItem>, CompletionList> either = completion.get();
      CompletionList right = either.getRight();
      assertFalse(right.getItems().isEmpty());

      right.getItems().forEach(it -> assertTrue(it.getLabel().toLowerCase().startsWith("i")));
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  private Range retrieveRange(TestLanguageClient client) {
    List<Diagnostic> diagnostics = client.getDiagnostics();
    if (diagnostics.isEmpty()) {
      fail("No diagnostics received");
    }
    Diagnostic diagnostic = diagnostics.get(0);
    return diagnostic.getRange();
  }

  private void assertRange(Range range) {
    assertEquals(22, range.getStart().getCharacter());
    assertEquals(31, range.getEnd().getCharacter());
  }

  private Map<String, MyDocumentModel> closeGetter(TextDocumentService service) {
    return ((MyTextDocumentService) service).getDocs();
  }
}
