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

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.emptyMap;
import static java.util.Collections.singletonList;
import static java.util.Collections.singletonMap;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.DISABLED;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.ENABLED;
import static org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode.SKIP;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.COPYBOOK_URI;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT2_URI;
import static org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils.DOCUMENT_URI;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasSize;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.Mockito.any;
import static org.mockito.Mockito.anyString;
import static org.mockito.Mockito.atMost;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.eq;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.spy;
import static org.mockito.Mockito.timeout;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMultimap;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.awaitility.Awaitility;
import org.eclipse.lsp.cobol.core.model.Locality;
import org.eclipse.lsp.cobol.core.model.extendedapi.ExtendedApiResult;
import org.eclipse.lsp.cobol.core.engine.symbols.CopyDefinition;
import org.eclipse.lsp.cobol.core.model.tree.CopyNode;
import org.eclipse.lsp.cobol.core.model.tree.RootNode;
import org.eclipse.lsp.cobol.core.preprocessor.delegates.injector.ImplicitCodeUtils;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.domain.databus.model.RunAnalysisEvent;
import org.eclipse.lsp.cobol.service.copybooks.CopybookProcessingMode;
import org.eclipse.lsp.cobol.service.delegates.actions.CodeActions;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.validations.AnalysisResult;
import org.eclipse.lsp.cobol.service.delegates.validations.LanguageEngineFacade;
import org.eclipse.lsp.cobol.service.mocks.MockTextDocumentService;
import org.eclipse.lsp4j.CodeAction;
import org.eclipse.lsp4j.CodeActionContext;
import org.eclipse.lsp4j.CodeActionParams;
import org.eclipse.lsp4j.Command;
import org.eclipse.lsp4j.CompletionItem;
import org.eclipse.lsp4j.CompletionList;
import org.eclipse.lsp4j.CompletionParams;
import org.eclipse.lsp4j.DefinitionParams;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DidChangeTextDocumentParams;
import org.eclipse.lsp4j.DidCloseTextDocumentParams;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;
import org.eclipse.lsp4j.DidSaveTextDocumentParams;
import org.eclipse.lsp4j.DocumentFormattingParams;
import org.eclipse.lsp4j.FormattingOptions;
import org.eclipse.lsp4j.HoverParams;
import org.eclipse.lsp4j.Location;
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.eclipse.lsp4j.ReferenceContext;
import org.eclipse.lsp4j.ReferenceParams;
import org.eclipse.lsp4j.TextDocumentContentChangeEvent;
import org.eclipse.lsp4j.TextDocumentIdentifier;
import org.eclipse.lsp4j.TextDocumentItem;
import org.eclipse.lsp4j.TextDocumentPositionParams;
import org.eclipse.lsp4j.VersionedTextDocumentIdentifier;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.internal.stubbing.answers.AnswersWithDelay;

/**
 * This test checks the entry points of the {@link TextDocumentService} implementation.
 */
class CobolTextDocumentServiceTest extends MockTextDocumentService {

  private static final String LANGUAGE = "COBOL";
  private static final String EXT_SRC_DOC_URI = "file://workspace/.c4z/.extsrcs/EXTSRC.cbl";
  private static final String PARENT_CPY_URI = "file:///.copybooks/PARENT.cpy";
  private static final String NESTED_CPY_URI = "file:///.copybooks/NESTED.cpy";
  private static final String TEXT_EXAMPLE = "       IDENTIFICATION DIVISION.";
  private static final String INCORRECT_TEXT_EXAMPLE = "       IDENTIFICATION DIVISIONs.";
  private static final String DOCUMENT_WITH_ERRORS_URI =
      "file:///c:/workspace/incorrect_document.cbl";

  private CobolTextDocumentService service;

  @BeforeEach
  void setupService() {
    service = getMockedTextDocumentServiceUsingSameThread();
  }

  @Test
  void testCompletion() throws ExecutionException, InterruptedException {
    mockSettingServiceForCopybooks(Boolean.FALSE);
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    CompletionItem completionItem = new CompletionItem();
    completionItem.setLabel("test");
    when(completions.collectFor(any(CobolDocumentModel.class), any(CompletionParams.class)))
        .thenReturn(new CompletionList(true, ImmutableList.of(completionItem)));

    service.notifyExtensionConfig(ImmutableList.of());
    openDocument(service);

    CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion =
        service.completion(
            new CompletionParams(new TextDocumentIdentifier(DOCUMENT_URI), new Position(0, 8)));
    assertCompletionCorrect(completion);
  }

  @Test
  void testDidChange() throws ExecutionException, InterruptedException {
    List<TextDocumentContentChangeEvent> textEdits = new ArrayList<>();
    textEdits.add(new TextDocumentContentChangeEvent(INCORRECT_TEXT_EXAMPLE));
    doNothing().when(communications).publishDiagnostics(anyMap());
    mockSettingServiceForCopybooks(Boolean.FALSE);
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    service.didChange(
        new DidChangeTextDocumentParams(
            new VersionedTextDocumentIdentifier(DOCUMENT_URI, 0), textEdits));
    Optional<Future<?>> opt = Optional.ofNullable(service.getFutureMap().get(DOCUMENT_URI));
    if (opt.isPresent()) {
      opt.get().get();
    }
    verify(engine).analyze(anyString(), anyString(), any(AnalysisConfig.class));
    verify(communications).publishDiagnostics(anyMap());
  }

  @Test
  void testDidClose() throws ExecutionException, InterruptedException {
    doNothing().when(communications).publishDiagnostics(anyMap());
    mockSettingServiceForCopybooks(Boolean.FALSE);
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));

    service.notifyExtensionConfig(ImmutableList.of());
    openDocument(service);
    assertEquals(1, closeGetter(service).size());
    TextDocumentIdentifier testDocument = new TextDocumentIdentifier(DOCUMENT_URI);
    DidCloseTextDocumentParams closedDocument = new DidCloseTextDocumentParams(testDocument);
    service.didClose(closedDocument);
    assertEquals(Collections.EMPTY_MAP, closeGetter(service));
  }

  @SafeVarargs
  private final Map<String, List<Diagnostic>> mergeDiagnosticMaps(
      Map<String, List<Diagnostic>>... maps) {
    return Arrays.stream(maps)
        .flatMap(m -> m.entrySet().stream())
        .collect(Collectors.toMap(
            Entry::getKey,
            Entry::getValue,
            (v1, v2) -> Stream.concat(v1.stream(), v2.stream()).collect(Collectors.toList())));
  }

  @Test
  void testDidCloseForMainProgramsAndRelatedCopybook() {
    when(configurationService.getConfig(ENABLED)).thenReturn(AnalysisConfig.defaultConfig(ENABLED));

    Map<String, List<Diagnostic>> copybookDiagnostics = new HashMap<>(createDefaultDiagnostics(COPYBOOK_URI));
    Map<String, List<Diagnostic>> programDiagnostics = mergeDiagnosticMaps(
        createDefaultDiagnostics(DOCUMENT_URI),
        copybookDiagnostics);
    Map<String, List<Diagnostic>> secondProgramDiagnostics = mergeDiagnosticMaps(
        createDefaultDiagnostics(DOCUMENT2_URI),
        copybookDiagnostics);

    doAnswer(new AnswersWithDelay(1000,
        invocation -> AnalysisResult.builder().diagnostics(copybookDiagnostics).build()))
        .when(engine)
        .analyze(COPYBOOK_URI, INCORRECT_TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED));
    doAnswer(new AnswersWithDelay(1000,
        invocation -> AnalysisResult.builder().diagnostics(programDiagnostics).build()))
        .when(engine)
        .analyze(DOCUMENT_URI, INCORRECT_TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED));
    doAnswer(new AnswersWithDelay(1000,
        invocation -> AnalysisResult.builder().diagnostics(secondProgramDiagnostics).build()))
        .when(engine)
        .analyze(DOCUMENT2_URI, INCORRECT_TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED));

    // Opens both main program and related copybook
    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, INCORRECT_TEXT_EXAMPLE)));
    // we expect 2 keys, one for mainProgram and one for related copyBook
    assertEquals(programDiagnostics, service.collectAllDiagnostics());

    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT2_URI, LANGUAGE, 0, INCORRECT_TEXT_EXAMPLE)));
    // we expect 3 keys, two for programs and one for copybook
    assertEquals(mergeDiagnosticMaps(programDiagnostics, secondProgramDiagnostics),
        service.collectAllDiagnostics());

    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(COPYBOOK_URI, LANGUAGE, 0, INCORRECT_TEXT_EXAMPLE)));
    // now we expect 3 keys, with multiple values for copybook key
    assertEquals(
        mergeDiagnosticMaps(copybookDiagnostics, programDiagnostics, secondProgramDiagnostics),
        service.collectAllDiagnostics());
    // and copybook diagnostics has more entries (duplicities)
    assertTrue(service.collectAllDiagnostics().get(COPYBOOK_URI).size()
        > copybookDiagnostics.get(COPYBOOK_URI).size());

    service.didClose(new DidCloseTextDocumentParams(new TextDocumentIdentifier(DOCUMENT2_URI)));
    service.didClose(new DidCloseTextDocumentParams(new TextDocumentIdentifier(DOCUMENT_URI)));

    // we still expect 3 keys, but both programs value is an empty List []
    assertEquals(mergeDiagnosticMaps(copybookDiagnostics,
            singletonMap(DOCUMENT_URI, emptyList()),
            singletonMap(DOCUMENT2_URI, emptyList())),
        service.collectAllDiagnostics());

    service.didClose(new DidCloseTextDocumentParams(new TextDocumentIdentifier(COPYBOOK_URI)));
    assertEquals(mergeDiagnosticMaps(singletonMap(COPYBOOK_URI, emptyList()),
            singletonMap(DOCUMENT_URI, emptyList()),
            singletonMap(DOCUMENT2_URI, emptyList())),
        service.collectAllDiagnostics());
  }

  @Test
  void testDidSave() {
    TextDocumentIdentifier saveDocumentIdentifier = new TextDocumentIdentifier(DOCUMENT_URI);
    DidSaveTextDocumentParams saveDocumentParams =
        new DidSaveTextDocumentParams(saveDocumentIdentifier);
    mockSettingServiceForCopybooks(Boolean.FALSE);
    when(engine.analyze(eq(DOCUMENT_URI), eq(TEXT_EXAMPLE), any()))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
    service.didSave(saveDocumentParams);
    assertTrue(closeGetter(service).containsKey(DOCUMENT_URI));
  }

  /**
   * This test verifies that when an extended document opened, the code analyzed, and the copybook
   * analysis disabled using {@link CopybookProcessingMode#DISABLED}
   */
  @Test
  void disableCopybookAnalysisOnExtendedDoc() throws ExecutionException, InterruptedException {
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    mockSettingServiceForCopybooks(Boolean.FALSE);
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(DISABLED));

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(EXT_SRC_DOC_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
    waitFor(service, EXT_SRC_DOC_URI);
    ArgumentCaptor<AnalysisConfig> argument = ArgumentCaptor.forClass(AnalysisConfig.class);
    verify(engine).analyze(eq(EXT_SRC_DOC_URI), anyString(), argument.capture());
    assertEquals(DISABLED, argument.getValue().getCopybookConfig().getCopybookProcessingMode());
  }

  /**
   * This test verifies that when a document opened in DID_OPEN mode, the code analyzed, and the
   * copybook analysis is enabled using {@link CopybookProcessingMode#ENABLED}
   */
  @Test
  void enableCopybooksOnDidOpenTest() throws ExecutionException, InterruptedException {
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));

    //tests when copybook dir is configured, shouldn't be analyzed
    mockSettingServiceForCopybooks(Boolean.TRUE);
    assertNull(service.getFutureMap().get(COPYBOOK_URI));
    verify(engine, never()).analyze(eq(COPYBOOK_URI), anyString(), any());

    //tests when copybook dir is NOT configured, should be analyzed
    mockSettingServiceForCopybooks(Boolean.FALSE);

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(COPYBOOK_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
    waitFor(service, COPYBOOK_URI);

    ArgumentCaptor<AnalysisConfig> argument = ArgumentCaptor.forClass(AnalysisConfig.class);
    verify(engine).analyze(eq(COPYBOOK_URI), anyString(), argument.capture());
    assertEquals(ENABLED, argument.getValue().getCopybookConfig().getCopybookProcessingMode());
  }

  /**
   * This test verifies that when a document updated in DID_CHANGE mode, the code analyzed, and the
   * copybook analysis enabled using {@link CopybookProcessingMode#ENABLED}
   */
  @Test
  void enableCopybooksOnDidChangeTest() throws ExecutionException, InterruptedException {
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(SKIP));
    doNothing().when(communications).publishDiagnostics(anyMap());

    //tests when copybook dir is configured, shouldn't be analyzed
    mockSettingServiceForCopybooks(Boolean.TRUE);
    assertNull(service.getFutureMap().get(COPYBOOK_URI));
    verify(engine, never()).analyze(eq(COPYBOOK_URI), anyString(), any());

    //tests when no copybook dir is NOT configured
    mockSettingServiceForCopybooks(Boolean.FALSE);
    service.didChange(
        new DidChangeTextDocumentParams(
            new VersionedTextDocumentIdentifier(COPYBOOK_URI, 0),
            ImmutableList.of(new TextDocumentContentChangeEvent(INCORRECT_TEXT_EXAMPLE))));
    waitFor(service, COPYBOOK_URI);
    ArgumentCaptor<AnalysisConfig> argument = ArgumentCaptor.forClass(AnalysisConfig.class);
    verify(engine).analyze(eq(COPYBOOK_URI), anyString(), argument.capture());
    assertEquals(SKIP, argument.getValue().getCopybookConfig().getCopybookProcessingMode());
  }

  /**
   * This test verifies that when a copybook document updated in DID_CHANGE mode, the analysis is triggered with updated cache
   */
  @Test
  void copybookChangeTriggerReAnalysisDidChangeTest() {
    mockSettingServiceForCopybooks(Boolean.TRUE);
    service.didChange(
            new DidChangeTextDocumentParams(
                    new VersionedTextDocumentIdentifier(COPYBOOK_URI, 0),
                    ImmutableList.of(new TextDocumentContentChangeEvent(INCORRECT_TEXT_EXAMPLE))));
    verify(broker).postData(any(RunAnalysisEvent.class));
  }

  /**
   * This test checks that {@link CobolTextDocumentService} is subscribed to the databus events and
   * may re-run analysis of the open documents if it receives a notification.
   */
  @Test
  void observerCallback() {
    Map<String, List<Diagnostic>> diagnosticsNoErrors = emptyMap();
    Map<String, List<Diagnostic>> diagnosticsWithErrors = createDefaultDiagnostics();

    // created two dummy analysis result, one with error and another without
    // those object will be used as result of dynamic stubbing stage
    AnalysisResult resultNoErrors =
        AnalysisResult.builder().diagnostics(diagnosticsNoErrors).build();
    AnalysisResult resultWithErrors =
        AnalysisResult.builder().diagnostics(diagnosticsWithErrors).build();

    /*
     * Defined dynamic response based on the possible combinations available when the document analyzed:
     *  - text document sync state: [DID_OPEN|DID_CHANGE]
     *  - document URI [correct|incorrect]
     */
    doReturn(resultNoErrors)
        .when(engine)
        .analyze(DOCUMENT_URI, TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED));
    doReturn(resultWithErrors)
        .when(engine)
        .analyze(
            DOCUMENT_WITH_ERRORS_URI,
            INCORRECT_TEXT_EXAMPLE,
            AnalysisConfig.defaultConfig(ENABLED));
    doReturn(resultNoErrors)
        .when(engine)
        .analyze(DOCUMENT_URI, TEXT_EXAMPLE, AnalysisConfig.defaultConfig(SKIP));
    doReturn(resultWithErrors)
        .when(engine)
        .analyze(
            DOCUMENT_WITH_ERRORS_URI, INCORRECT_TEXT_EXAMPLE, AnalysisConfig.defaultConfig(SKIP));
    mockSettingServiceForCopybooks(Boolean.FALSE);
    lenient().when(configurationService.getConfig(SKIP))
        .thenReturn(AnalysisConfig.defaultConfig(SKIP));
    lenient().when(configurationService.getConfig(ENABLED))
        .thenReturn(AnalysisConfig.defaultConfig(ENABLED));

    // create a service and verify is subscribed to the required event
    CobolTextDocumentService service = verifyServiceStart();
    // simulate the call to the didOpen for two different document one with and one without errors
    verifyDidOpen(
        communications, engine, broker, diagnosticsNoErrors, service, TEXT_EXAMPLE, DOCUMENT_URI);
    verifyDidChange(
        communications, engine, diagnosticsNoErrors, service, TEXT_EXAMPLE, DOCUMENT_URI);
    verifyDidOpen(
        communications,
        engine,
        broker,
        diagnosticsWithErrors,
        service,
        INCORRECT_TEXT_EXAMPLE,
        DOCUMENT_WITH_ERRORS_URI);
    verifyDidChange(
        communications,
        engine,
        diagnosticsWithErrors,
        service,
        INCORRECT_TEXT_EXAMPLE,
        DOCUMENT_WITH_ERRORS_URI);

    // after the simulation for triggering the observer callback verify that the analysis method
    // (more in general the document analysis stage) is triggered
    service.onRunAnalysisEventCallback(new RunAnalysisEvent());

    /* After sending a message on the data bus we'll verify that the document analyzed by the preprocessor.
    More in detail we'll check:
            - analysis invoked two times (because two documents opened previously)
            - the diagnostic published exactly 2 times after the syntax/semantic analysis invoked.
            */
    verifyCallback(communications, engine, diagnosticsWithErrors, TEXT_EXAMPLE, DOCUMENT_URI);
    verifyCallback(
        communications,
        engine,
        diagnosticsWithErrors,
        INCORRECT_TEXT_EXAMPLE,
        DOCUMENT_WITH_ERRORS_URI);
  }

  /**
   * Test on the textDocument/codeAction request the {@link CodeActions} delegate called. The
   * specific logic tested in CodeActionsTest, here it is only to verify that the
   * {@link CobolTextDocumentService#codeAction(CodeActionParams)} calls the
   * {@link CodeActions#collect(CodeActionParams)}
   */
  @Test
  void testCodeActionsEndpoint() {
    CodeActionParams params =
        new CodeActionParams(new TextDocumentIdentifier(DOCUMENT_URI), new Range(),
            new CodeActionContext());
    List<Either<Command, CodeAction>> expected = emptyList();
    when(actions.collect(params)).thenReturn(expected);
    try {
      assertEquals(expected, service.codeAction(params).get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
    verify(actions).collect(params);
  }

  private Map<String, List<Diagnostic>> createDefaultDiagnostics(String documentUri) {
    return singletonMap(
        documentUri,
        singletonList(
            new Diagnostic(
                new Range(new Position(), new Position(0, INCORRECT_TEXT_EXAMPLE.length())),
                INCORRECT_TEXT_EXAMPLE)));
  }

  private Map<String, List<Diagnostic>> createDefaultDiagnostics() {
    return createDefaultDiagnostics(DOCUMENT_URI);
  }

  /**
   * This test verify that when a
   * {@link CobolTextDocumentService#didClose(DidCloseTextDocumentParams)} is sent from the client
   * to dispose a document, all the related diagnostic message are disposed from the document.
   */
  @Test
  void testDidCloseDisposeDiagnostics() {
    Communications spyCommunications = spy(Communications.class);
    when(configurationService.getConfig(ENABLED)).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    doAnswer(new AnswersWithDelay(1000, invocation -> AnalysisResult.builder().build()))
        .when(engine)
        .analyze(DOCUMENT_URI, TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED));

    DidCloseTextDocumentParams closedDocument =
        new DidCloseTextDocumentParams(new TextDocumentIdentifier(DOCUMENT_URI));

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));

    service.didClose(closedDocument);

    assertEquals(Collections.EMPTY_MAP, closeGetter(service));
    verify(spyCommunications, atMost(1))
        .publishDiagnostics(ImmutableMap.of(DOCUMENT_URI, ImmutableList.of()));
  }

  /**
   * This test verify that when a {@link CobolTextDocumentService#analysis(JsonObject)}
   * (JsonObject)} is sent from the client to get analysis result, it processes properly.
   */
  @Test
  void testAnalysis() throws ExecutionException, InterruptedException {
    doAnswer(new AnswersWithDelay(1000, invocation -> AnalysisResult.builder().build()))
        .when(engine)
        .analyze(DOCUMENT_URI, TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED));
    when(configurationService.getConfig(ENABLED)).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    mockSettingServiceForCopybooks(Boolean.FALSE);

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));

    JsonObject json = new JsonObject();
    json.add("uri", new JsonPrimitive(DOCUMENT_URI));
    json.add("text", new JsonPrimitive(TEXT_EXAMPLE));

    ExtendedApiResult result = service.analysis(json).get();
    assertNotNull(result);
  }

  private CobolTextDocumentService verifyServiceStart() {
    CobolTextDocumentService service = getMockedTextDocumentServiceUsingSameThread();

    verify(broker).subscribe(service);
    return service;
  }

  private void verifyDidOpen(
      Communications communications,
      LanguageEngineFacade engine,
      DataBusBroker dataBus,
      Map<String, List<Diagnostic>> diagnostics,
      CobolTextDocumentService service,
      String textToAnalyse,
      String uri) {
    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(new TextDocumentItem(uri, LANGUAGE, 0, textToAnalyse)));
    waitFor(service, uri);
    verify(communications).notifyThatLoadingInProgress(uri);
    verify(engine).analyze(uri, textToAnalyse, AnalysisConfig.defaultConfig(ENABLED));
    verify(dataBus)
        .postData(
            AnalysisFinishedEvent.builder()
                .documentUri(uri)
                .copybookUris(emptyList())
                .copybookProcessingMode(ENABLED)
                .build());
    verify(communications).cancelProgressNotification(uri);
    verify(communications).publishDiagnostics(diagnostics);
  }

  // We don't send anything in dataBus when didChange analysis finished
  private void verifyDidChange(
      Communications communications,
      LanguageEngineFacade engine,
      Map<String, List<Diagnostic>> diagnostics,
      CobolTextDocumentService service,
      String textToAnalyse,
      String uri) {
    int newVersion = 2;
    service.didChange(
        new DidChangeTextDocumentParams(
            new VersionedTextDocumentIdentifier(uri, newVersion),
            ImmutableList.of(new TextDocumentContentChangeEvent(textToAnalyse))));

    verify(engine).analyze(uri, textToAnalyse, AnalysisConfig.defaultConfig(SKIP));
    verify(communications, times(2)).publishDiagnostics(diagnostics);
  }

  private void verifyCallback(
      Communications communications,
      LanguageEngineFacade engine,
      Map<String, List<Diagnostic>> diagnostics,
      String text,
      String uri) {

    // for didOpen and after RunAnalysisEvent
    verify(engine, times(2)).analyze(uri, text, AnalysisConfig.defaultConfig(ENABLED));
    // for didChange
    verify(engine, times(1)).analyze(uri, text, AnalysisConfig.defaultConfig(SKIP));
    // all three above produces the same diagnostics
    verify(communications, times(4)).publishDiagnostics(diagnostics);
  }

  /**
   * Check there were no NullPointerException thrown if a
   * {@link TextDocumentService#didClose(DidCloseTextDocumentParams)} is invoked when
   * {@link TextDocumentService#didOpen(DidOpenTextDocumentParams)} processing is not finished yet.
   * If it was thrown then async task inside the service falls and
   * {@link Communications#cancelProgressNotification(String)} is not called.
   */
  @Test
  void testImmediateClosingOfDocumentDoNotCauseNPE() {
    service = getMockedTextDocumentServiceUsingSeparateThread();
    lenient()
        .when(engine.analyze(DOCUMENT_URI, TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED)))
        .thenReturn(AnalysisResult.builder().build());

    lenient()
        .when(configurationService.getConfig(ENABLED))
        .thenReturn(AnalysisConfig.defaultConfig(ENABLED));

    mockSettingServiceForCopybooks(Boolean.FALSE);

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));

    assertThat(service.getDocs().entrySet(), hasSize(1));

    service.didClose(new DidCloseTextDocumentParams(new TextDocumentIdentifier(DOCUMENT_URI)));

    assertThat(service.getDocs().entrySet(), hasSize(0));
    assertThat(service.getFutureMap().entrySet(), hasSize(0));

    verify(communications, timeout(2000).atLeastOnce()).cancelProgressNotification(DOCUMENT_URI);
  }

  @Test
  void testHover() {
    service = getMockedTextDocumentServiceUsingSeparateThread();
    TextDocumentItem testHoverDocument =
        new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE);

    AnalysisResult analysisResult = AnalysisResult.builder().build();
    when(engine.analyze(eq(DOCUMENT_URI), eq(TEXT_EXAMPLE), any(AnalysisConfig.class)))
        .thenReturn(analysisResult);
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    mockSettingServiceForCopybooks(Boolean.FALSE);

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(new DidOpenTextDocumentParams(testHoverDocument));

    Position testHoverPosition = new Position(0, 2);
    TextDocumentIdentifier testTextDocumentIdentifier = new TextDocumentIdentifier(DOCUMENT_URI);
    HoverParams testHoverPositionParams = new HoverParams(testTextDocumentIdentifier,
        testHoverPosition);

    Awaitility.await()
        .until(
            () -> service.getDocs().get(DOCUMENT_URI).getAnalysisResult().equals(analysisResult));
    service.hover(testHoverPositionParams);

    verify(hoverProvider, timeout(2000))
        .getHover(new CobolDocumentModel(TEXT_EXAMPLE, analysisResult), testHoverPositionParams);
  }

  /**
   * Test {@link AnalysisFinishedEvent} sent after the analysis finished and contains all the
   * document URIs that contain nested copybooks, including the main document
   */
  @Test
  void testAnalysisFinishedNotification() throws ExecutionException, InterruptedException {
    AnalysisResult analysisResult =
        AnalysisResult.builder()
            .rootNode(new RootNode(Locality.builder().build(), ImmutableMultimap.of()))
            .build();

    RootNode rootNode = new RootNode(Locality.builder().build(), ImmutableMultimap.of());
    analysisResult.getRootNode().addChild(rootNode);
    CopyNode parent = new CopyNode(Locality.builder().uri(DOCUMENT_URI).build(), "PARENT");
    CopyNode nested = new CopyNode(Locality.builder().uri(PARENT_CPY_URI).build(), "NESTED");
    CopyNode nested2 =
        new CopyNode(Locality.builder().uri(NESTED_CPY_URI).build(), "NESTED_CPY_URI");
    CopyDefinition parentDefinition =
        new CopyDefinition(new Location(ImplicitCodeUtils.createLocation(), new Range()), "PARENT");
    parentDefinition.addUsages(parent);
    parent.setDefinition(parentDefinition);
    CopyDefinition nestedDefinition =
        new CopyDefinition(new Location(ImplicitCodeUtils.createLocation(), new Range()), "NESTED");
    nestedDefinition.addUsages(nested);
    nested.setDefinition(nestedDefinition);
    CopyDefinition nested2Definition =
        new CopyDefinition(
            new Location(ImplicitCodeUtils.createLocation(), new Range()), "NESTED_CPY_URI");
    nested2Definition.addUsages(nested2);
    nested2.setDefinition(nested2Definition);
    rootNode.addChild(parent);
    rootNode.addChild(nested);
    rootNode.addChild(nested2);
    when(engine.analyze(DOCUMENT_URI, TEXT_EXAMPLE, AnalysisConfig.defaultConfig(ENABLED)))
        .thenReturn(analysisResult);
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    mockSettingServiceForCopybooks(Boolean.FALSE);

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));
    waitFor(service, DOCUMENT_URI);
    verify(broker)
        .postData(
            AnalysisFinishedEvent.builder()
                .documentUri(DOCUMENT_URI)
                .copybookUris(asList(DOCUMENT_URI, PARENT_CPY_URI, NESTED_CPY_URI))
                .copybookProcessingMode(ENABLED)
                .build());
  }

  @Test
  void testFormatCallDelegatesToFormationsObject() throws ExecutionException, InterruptedException {
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(formations.format(any(CobolDocumentModel.class))).thenReturn(emptyList());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    mockSettingServiceForCopybooks(Boolean.FALSE);
    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));
    waitFor(service, DOCUMENT_URI);
    service
        .formatting(
            new DocumentFormattingParams(
                new TextDocumentIdentifier(DOCUMENT_URI), new FormattingOptions(1, false)))
        .get();
    verify(formations).format(any(CobolDocumentModel.class));
  }

  @Test
  void testDefinitionCallDelegatesToOccurrencesObject()
      throws ExecutionException, InterruptedException {
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    mockSettingServiceForCopybooks(Boolean.FALSE);
    when(occurrences.findDefinitions(
        any(CobolDocumentModel.class), any(TextDocumentPositionParams.class)))
        .thenReturn(emptyList());

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));
    waitFor(service, DOCUMENT_URI);
    service
        .definition(new DefinitionParams(
            new TextDocumentIdentifier(DOCUMENT_URI), new Position())).get();
    verify(occurrences)
        .findDefinitions(any(CobolDocumentModel.class), any(TextDocumentPositionParams.class));
  }

  @Test
  void testReferenceCallDelegatesToOccurrencesObject()
      throws ExecutionException, InterruptedException {
    when(engine.analyze(anyString(), anyString(), any(AnalysisConfig.class)))
        .thenReturn(AnalysisResult.builder().build());
    when(configurationService.getConfig(any())).thenReturn(AnalysisConfig.defaultConfig(ENABLED));
    mockSettingServiceForCopybooks(Boolean.FALSE);
    when(occurrences.findReferences(
        any(CobolDocumentModel.class),
        any(TextDocumentPositionParams.class),
        any(ReferenceContext.class)))
        .thenReturn(ImmutableList.of());

    service.notifyExtensionConfig(ImmutableList.of());
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 0, TEXT_EXAMPLE)));
    waitFor(service, DOCUMENT_URI);
    ReferenceParams referenceParams = new ReferenceParams();
    referenceParams.setContext(new ReferenceContext(true));
    referenceParams.setTextDocument(new TextDocumentIdentifier(DOCUMENT_URI));
    service.references(referenceParams).get();
    verify(occurrences)
        .findReferences(
            any(CobolDocumentModel.class),
            any(TextDocumentPositionParams.class),
            any(ReferenceContext.class));
  }

  public static void waitFor(CobolTextDocumentService service, String url) {
    try {
      Future<?> future = service.getFutureMap().get(DOCUMENT_URI);
      if (future != null) {
        future.get();
      }
    } catch (InterruptedException | ExecutionException e) {
      throw new RuntimeException(e);
    }
  }

  private void openDocument(CobolTextDocumentService service) throws ExecutionException, InterruptedException {
    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
    waitFor(service, DOCUMENT_URI);
  }

  private void assertCompletionCorrect(
      CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion) {
    try {
      Either<List<CompletionItem>, CompletionList> either = completion.get();
      CompletionList right = either.getRight();
      assertFalse(right.getItems().isEmpty());

      right.getItems().forEach(it -> assertEquals("test", it.getLabel().toLowerCase()));
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  private Map<String, CobolDocumentModel> closeGetter(TextDocumentService service) {
    return ((CobolTextDocumentService) service).getDocs();
  }
}
