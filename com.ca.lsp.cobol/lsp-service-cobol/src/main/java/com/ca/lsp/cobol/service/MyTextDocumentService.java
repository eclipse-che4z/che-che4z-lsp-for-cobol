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

import com.ca.lsp.cobol.service.delegates.Communications;
import com.ca.lsp.cobol.service.delegates.Formations;
import com.ca.lsp.cobol.service.delegates.Highlights;
import com.ca.lsp.cobol.service.delegates.completions.Completions;
import com.ca.lsp.cobol.service.delegates.references.References;
import com.ca.lsp.cobol.service.delegates.validations.Analysis;
import com.ca.lsp.cobol.service.delegates.validations.AnalysisResult;
import com.ca.lsp.cobol.service.delegates.validations.LanguageEngines;
import com.google.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;

/**
 * This class is a set of end-points to apply text operations for COBOL documents. All the requests
 * that start with "textDocument" go here. The current implementation contains only supported
 * language features. For more details, please, see the specification:
 * https://microsoft.github.io//language-server-protocol/specifications/specification-3-14/
 *
 * <p>For the maintainers: Please, add logging for exceptions if you run any asynchronous operation.
 * Also, you you perform any communication with the client, do it a using {@link Communications}
 * instance.
 */
@Slf4j
public class MyTextDocumentService implements TextDocumentService {
  private static final List<String> SUPPORTED_EXTENSIONS =
      Arrays.asList("cobol", "cbl", "cob", "COBOL");

  private final Map<String, MyDocumentModel> docs = new ConcurrentHashMap<>();
  @Inject private Communications communications;

  Map<String, MyDocumentModel> getDocs() {
    return new HashMap<>(docs);
  }

  @Override
  public CompletableFuture<Either<List<CompletionItem>, CompletionList>> completion(
      CompletionParams params) {
    Completions.checkCompletionParams(params);

    return Completions.collectFor(docs.get(params.getTextDocument().getUri()), params);
  }

  @Override
  public CompletableFuture<CompletionItem> resolveCompletionItem(CompletionItem unresolved) {
    log.info("Invoked resolving completion for [{}]", unresolved.getLabel());

    return CompletableFuture.supplyAsync(() -> Completions.resolveDocumentationFor(unresolved));
  }

  @Override
  public CompletableFuture<List<? extends Location>> definition(
      TextDocumentPositionParams position) {
    return CompletableFuture.supplyAsync(
        () -> References.findDefinition(docs.get(position.getTextDocument().getUri()), position));
  }

  @Override
  public CompletableFuture<List<? extends Location>> references(ReferenceParams params) {
    return CompletableFuture.supplyAsync(
        () ->
            References.findReferences(
                docs.get(params.getTextDocument().getUri()), params, params.getContext()));
  }

  @Override
  public CompletableFuture<List<? extends DocumentHighlight>> documentHighlight(
      TextDocumentPositionParams position) {
    return CompletableFuture.supplyAsync(
        () -> Highlights.findHighlights(docs.get(position.getTextDocument().getUri()), position));
  }

  @Override
  public CompletableFuture<List<? extends TextEdit>> formatting(DocumentFormattingParams params) {
    MyDocumentModel model = docs.get(params.getTextDocument().getUri());
    return CompletableFuture.supplyAsync(() -> Formations.format(model));
  }

  @Override
  public void didOpen(DidOpenTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    String text = params.getTextDocument().getText();
    String langId = params.getTextDocument().getLanguageId();
    registerDocument(uri, new MyDocumentModel(text, AnalysisResult.empty()));
    registerEngineAndAnalyze(uri, langId, text);
  }

  @Override
  public void didChange(DidChangeTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    String text = params.getContentChanges().get(0).getText();

    analyzeChanges(uri, text);
  }

  @Override
  public void didClose(DidCloseTextDocumentParams params) {
    String uri = params.getTextDocument().getUri();
    log.info("Document closing invoked");
    docs.remove(uri);
    Analysis.unregisterEngine(uri);
  }

  @Override
  public void didSave(DidSaveTextDocumentParams params) {
    log.info("Document saved...");
  }

  private void registerEngineAndAnalyze(String uri, String languageType, String text) {
    String fileExtension = extractExtension(uri);
    if (fileExtension != null && !isValidFileExtension(fileExtension)) {
      communications.notifyThatEngineNotFound(fileExtension);
    } else if (LanguageEngines.getLanguageEngineById(languageType) != null) {
      communications.notifyThatLoadingInProgress(uri);
      Analysis.registerEngine(uri, languageType);
      analyzeDocumentFirstTime(uri, text);

    } else {
      communications.notifyThatEngineNotFound(languageType);
    }
  }

  private boolean isValidFileExtension(String fileExtension) {
    return SUPPORTED_EXTENSIONS.contains(fileExtension);
  }

  private String extractExtension(String uri) {
    return Optional.ofNullable(uri)
        .filter(it -> it.indexOf('.') > -1)
        .map(it -> it.substring(it.lastIndexOf('.') + 1))
        .orElse(null);
  }

  private void analyzeDocumentFirstTime(String uri, String text) {
    CompletableFuture.runAsync(
            () -> {
              AnalysisResult result = Analysis.run(uri, text);
              docs.get(uri).setAnalysisResult(result);
              publishResult(uri, result);
            }).whenComplete((res,ex) -> ex.printStackTrace());
  }

  private void analyzeChanges(String uri, String text) {
    CompletableFuture.runAsync(
        () -> {
          AnalysisResult result = Analysis.run(uri, text);
          registerDocument(uri, new MyDocumentModel(text, result));
          communications.publishDiagnostics(uri, result.getDiagnostics());
        });
  }

  private void publishResult(String uri, AnalysisResult result) {
    communications.cancelProgressNotification(uri);
    communications.publishDiagnostics(uri, result.getDiagnostics());
    if (result.getDiagnostics().isEmpty()) communications.notifyThatDocumentAnalysed(uri);
  }

  private void registerDocument(String uri, MyDocumentModel document) {
    docs.put(uri, document);
  }
}
