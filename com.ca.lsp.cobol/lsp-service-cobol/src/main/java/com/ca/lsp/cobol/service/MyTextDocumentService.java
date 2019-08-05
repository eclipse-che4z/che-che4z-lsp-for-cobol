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

import com.ca.lsp.cobol.service.delegates.Completions;
import com.ca.lsp.cobol.service.delegates.Formations;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngines;
import com.ca.lsp.cobol.service.delegates.validations.Validation;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;

/** @author zacan01 */
public class MyTextDocumentService implements TextDocumentService {
  private static final Logger LOG = LogManager.getLogger(MyTextDocumentService.class);
  private static final Keywords KEYWORDS = new Keywords();

  private final Map<String, MyDocumentModel> docs = Collections.synchronizedMap(new HashMap<>());
  private final IMyLanguageServer myServer;

  public MyTextDocumentService(IMyLanguageServer myServer) {
    this.myServer = myServer;
  }

  Map<String, MyDocumentModel> getDocs() {
    return new HashMap<>(docs);
  }

  @Override
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion(
      CompletionParams params) {
    Completions.checkCompletionParams(params);
    MyDocumentModel model = docs.get(params.getTextDocument().getUri());
    String token = model.getToken(params.getPosition());
    LOG.info("Invoked completion for token [{}]", token);

    return Completions.collectFor(token, KEYWORDS);
  }

  @Override
  public CompletableFuture<CompletionItem> resolveCompletionItem(CompletionItem unresolved) {
    LOG.info("Invoked resolving completion for [{}]", unresolved.getLabel());

    return CompletableFuture.supplyAsync(
        () -> Completions.resolveDocumentationFor(unresolved, KEYWORDS));
  }

  @Override
  public CompletableFuture<Hover> hover(TextDocumentPositionParams position) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<SignatureHelp> signatureHelp(TextDocumentPositionParams position) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<List<? extends Location>> definition(
      TextDocumentPositionParams position) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
      TextDocumentPositionParams position) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<List<? extends CodeLens>> codeLens(CodeLensParams params) {

    return CompletableFuture.completedFuture(Collections.emptyList());
  }

  @Override
  public CompletableFuture<CodeLens> resolveCodeLens(CodeLens unresolved) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> formatting(DocumentFormattingParams params) {
    MyDocumentModel model = docs.get(params.getTextDocument().getUri());
    return CompletableFuture.supplyAsync(() -> Formations.format(model));
  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> rangeFormatting(
      DocumentRangeFormattingParams params) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> onTypeFormatting(
      DocumentOnTypeFormattingParams params) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public CompletableFuture<WorkspaceEdit> rename(RenameParams params) {
    return CompletableFuture.supplyAsync(() -> null);
  }

  @Override
  public void didOpen(DidOpenTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    String text = params.getTextDocument().getText();
    String langId = params.getTextDocument().getLanguageId();

    MyDocumentModel model = new MyDocumentModel(text);
    docs.put(uri, model);
    registerEngineAndRunValidation(uri, langId, text);
  }

  @Override
  public void didChange(DidChangeTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    String text = params.getContentChanges().get(0).getText();

    MyDocumentModel model = new MyDocumentModel(text);
    docs.put(uri, model);
    performValidation(uri, text);
  }

  @Override
  public void didClose(DidCloseTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    LOG.info("Document closing invoked");
    docs.remove(uri);
    Validation.unregisterEngine(uri);
  }

  @Override
  public void didSave(DidSaveTextDocumentParams params) {
    LOG.info("Document saved...");
  }

  private void registerEngineAndRunValidation(String uri, String languageType, String text) {
    if (LanguageEngines.getLanguageEngineById(languageType) != null) {
      Validation.registerEngine(uri, languageType);
      performValidation(uri, text);
    } else {
      notifyClientAboutEngineNotFound(languageType);
    }
  }

  private void performValidation(String uri, String text) {
    CompletableFuture.runAsync(
        () ->
            myServer
                .getClient()
                .publishDiagnostics(
                    new PublishDiagnosticsParams(uri, Validation.validate(uri, text))));
  }

  private void notifyClientAboutEngineNotFound(String languageType) {
    CompletableFuture.runAsync(
        () ->
            myServer
                .getClient()
                .showMessage(
                    new MessageParams(
                        MessageType.Error,
                        "Cannot find a language engine for the given language ID: "
                            + languageType)));
  }
}
