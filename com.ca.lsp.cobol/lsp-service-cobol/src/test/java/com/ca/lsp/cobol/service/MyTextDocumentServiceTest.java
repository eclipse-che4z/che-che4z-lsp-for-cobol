/*
 * Copyright (c) 2019 Broadcom.
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
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import com.ca.lsp.cobol.usecases.UseCaseUtils;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.function.Consumer;
import java.util.function.Function;

import static com.ca.lsp.cobol.usecases.UseCaseUtils.await;
import static com.ca.lsp.cobol.usecases.UseCaseUtils.waitForDiagnostics;
import static org.junit.Assert.*;

/** @author teman02 */
public class MyTextDocumentServiceTest extends ConfigurableTest {

  private static final String LANGUAGE = "COBOL";
  private static final String DOCUMENT_URI = "1";
  private static final String TEXT_EXAMPLE = "       IDENTIFICATION DIVISION.";
  private static final String INCORRECT_TEXT_EXAMPLE = "       IDENTIFICATION DIVISIONs.";
  private TextDocumentService service;
  private TestLanguageClient client;

  @Before
  public void createService() {
    service = LangServerCtx.getInjector().getInstance(TextDocumentService.class);
    client = LangServerCtx.getInjector().getInstance(TestLanguageClient.class);
    client.clean();

    service.didOpen(
        new DidOpenTextDocumentParams(
            new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, TEXT_EXAMPLE)));
  }

  @Test(expected = IllegalArgumentException.class)
  public void testCompletionEmpty() {
    service.completion(new CompletionParams());
    fail("No exception were thrown when IllegalArgumentException is expected");
  }

  @Test
  public void testCompletion() {
    waitForDiagnostics(client);
    CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion =
        service.completion(
            new CompletionParams(
                new TextDocumentIdentifier(DOCUMENT_URI), new Position(0, 8))); // The
    // position of "Identification division"
    assertCompletionCorrect(completion);
  }

  @Test
  public void testResolveCompletionItemExisting() {
    CompletionItem unresolved = new CompletionItem("ADD");

    checkResolving(
        unresolved,
        c -> {
          assertNotNull(c.getValue());
          assertFalse(c.getValue().isEmpty());
        });
  }

  @Test
  public void testResolveCompletionItemNonExisting() {
    CompletionItem unresolved = new CompletionItem("abcd");
    checkResolving(unresolved, c -> assertNull(c.getValue()));
  }

  @Test
  public void testResolveCompletionItemEmpty() {
    CompletionItem unresolved = new CompletionItem();
    checkResolving(unresolved, c -> assertNull(c.getValue()));
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

  private void checkResolving(CompletionItem unresolved, Consumer<? super MarkupContent> consumer) {
    CompletableFuture<CompletionItem> resolveCompletionItem =
        service.resolveCompletionItem(unresolved);
    try {
      CompletionItem completionItem = resolveCompletionItem.get();
      Either<String, MarkupContent> documentation = completionItem.getDocumentation();
      MarkupContent content = documentation.getRight();
      Optional.of(content).ifPresent(consumer);
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
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

  @Test
  public void testDidClose() {
    assertEquals(1, closeGetter(service).size());
    TextDocumentIdentifier testDocument = new TextDocumentIdentifier(DOCUMENT_URI);
    DidCloseTextDocumentParams closedDocument = new DidCloseTextDocumentParams(testDocument);
    service.didClose(closedDocument);
    assertEquals(Collections.EMPTY_MAP, closeGetter(service));
  }

  private Map<String, MyDocumentModel> closeGetter(TextDocumentService service) {
    return ((MyTextDocumentService) service).getDocs();
  }

  @Test
  public void testDidSave() {
    TextDocumentIdentifier saveDocumentIdentifier = new TextDocumentIdentifier(DOCUMENT_URI);
    DidSaveTextDocumentParams saveDocumentParams =
        new DidSaveTextDocumentParams(saveDocumentIdentifier);
    service.didSave(saveDocumentParams);
  }

  @Test
  public void testIncorrectLangId() {
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
}
