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

/** @author zacan01 */
@Slf4j
public class MyTextDocumentService implements TextDocumentService {
  private final Map<String, MyDocumentModel> docs = Collections.synchronizedMap(new HashMap<>());
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
    registerDocument(uri, new MyDocumentModel(text, AnalysisResult.empty()));
    //
    //    // test to verify object for databus is successfully created...
    //    String testCopyFile = "CPBTEST";
    //
    //    CobolWorkspaceServiceImpl workspaceService =
    //        (CobolWorkspaceServiceImpl) server.getWorkspaceService();
    //
    //    if (workspaceService.getURIByFileName(testCopyFile) == null)
    //      communications.notifyCopybookNotFound(testCopyFile);

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
    if (fileExtension != null
        && !"".equals(fileExtension)
        && !isValidFileExtension(fileExtension)) {
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
    return Arrays.asList("cobol", "cbl", "cob", "COBOL").contains(fileExtension);
  }

  private String extractExtension(String uri) {
    String extension = null;
    if (uri != null) {
      extension = uri.substring(uri.lastIndexOf('.') + 1, uri.length());
    }

    return extension;
  }

  private void analyzeDocumentFirstTime(String uri, String text) {
    CompletableFuture.runAsync(
        () -> {
          AnalysisResult result = Analysis.run(uri, text);
          docs.get(uri).setAnalysisResult(result);
          publishResult(uri, result);
        });
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
