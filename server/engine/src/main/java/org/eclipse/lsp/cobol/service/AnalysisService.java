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
package org.eclipse.lsp.cobol.service;

import com.google.common.collect.ImmutableList;
import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.google.inject.name.Named;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.common.AnalysisConfig;
import org.eclipse.lsp.cobol.common.AnalysisResult;
import org.eclipse.lsp.cobol.common.LanguageEngineFacade;
import org.eclipse.lsp.cobol.common.copybook.CopybookProcessingMode;
import org.eclipse.lsp.cobol.common.model.tree.Node;
import org.eclipse.lsp.cobol.common.utils.ThreadInterruptionUtil;
import org.eclipse.lsp.cobol.domain.databus.api.DataBusBroker;
import org.eclipse.lsp.cobol.domain.databus.model.AnalysisFinishedEvent;
import org.eclipse.lsp.cobol.service.copybooks.CopybookIdentificationService;
import org.eclipse.lsp.cobol.service.delegates.communications.Communications;
import org.eclipse.lsp.cobol.service.delegates.completions.Completions;
import org.eclipse.lsp.cobol.service.delegates.formations.Formations;
import org.eclipse.lsp.cobol.service.delegates.hover.HoverProvider;
import org.eclipse.lsp.cobol.service.delegates.references.Occurrences;
import org.eclipse.lsp.cobol.service.settings.ConfigurationService;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.jsonrpc.messages.Either;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CountDownLatch;

import static java.lang.String.format;
import static java.util.stream.Collectors.toList;

/**
 * Provides async document analysis functionality
 */
@Slf4j
@Singleton
class AnalysisService {
  private static final String GIT_FS_URI = "gitfs:/";
  private static final String GIT_URI = "git:/";
  private static final String GITFS_URI_NOT_SUPPORTED = "GITFS URI not supported";
  private final Communications communications;
  private final LanguageEngineFacade engine;
  private final DataBusBroker dataBus;
  private final ConfigurationService configurationService;
  private final SyncProvider syncProvider;
  private final CopybookIdentificationService copybookIdentificationService;
  private final CountDownLatch waitConfig = new CountDownLatch(1);
  private List<String> copybookExtensions;
  private final Completions completions;
  private final Occurrences occurrences;
  private final Formations formations;
  private final HoverProvider hoverProvider;

  private final DocumentModelService documentService;

  private final DocumentContentCache contentCache;

  @Inject
  AnalysisService(Communications communications,
                  LanguageEngineFacade engine,
                  DataBusBroker dataBus,
                  ConfigurationService configurationService,
                  SyncProvider syncProvider,
                  @Named("combinedStrategy") CopybookIdentificationService copybookIdentificationService,
                  Completions completions,
                  Occurrences occurrences,
                  Formations formations,
                  HoverProvider hoverProvider,
                  DocumentModelService documentService,
                  DocumentContentCache contentCache) {
    this.communications = communications;
    this.engine = engine;
    this.dataBus = dataBus;
    this.configurationService = configurationService;
    this.syncProvider = syncProvider;
    this.copybookIdentificationService = copybookIdentificationService;
    this.completions = completions;
    this.occurrences = occurrences;
    this.formations = formations;
    this.hoverProvider = hoverProvider;
    this.documentService = documentService;
    this.contentCache = contentCache;
  }

  /**
   * Check if given document is copybook or not
   * @param uri - document uri
   * @param text - document text
   * @return true for copybook and false otherwise
   */
  @SneakyThrows
  public boolean isCopybook(String uri, String text) {
    waitConfig.await();
    return copybookIdentificationService.isCopybook(uri, text, copybookExtensions);
  }

  /**
   * Set extension config
   * @param config - extension config
   */
  public void setExtensionConfig(List<String> config) {
    this.copybookExtensions = Collections.unmodifiableList(config);
    this.waitConfig.countDown();
  }

  public Either<List<CompletionItem>, CompletionList> findCompletion(String uri, CompletionParams params) {
    return Either.forRight(completions.collectFor(documentService.get(uri), params));
  }

  public Either<List<? extends Location>, List<? extends LocationLink>> findDefinition(String uri, DefinitionParams params) {
    List<Location> definitions =
        documentService.isDocumentSynced(uri)
            ? occurrences.findDefinitions(documentService.get(uri), params)
            : Collections.emptyList();
    return Either.forLeft(definitions);
  }

  public List<? extends Location> findReferences(String uri, ReferenceParams params) {
    return documentService.isDocumentSynced(uri)
        ? occurrences.findReferences(documentService.get(uri), params, params.getContext())
        : Collections.emptyList();
  }

  public List<? extends DocumentHighlight> findHighlights(String uri, DocumentHighlightParams params) {
    return documentService.isDocumentSynced(uri)
        ? occurrences.findHighlights(
        documentService.get(uri), params)
        : Collections.emptyList();
  }

  public List<? extends TextEdit> findFormatting(String uri) {
    return formations.format(documentService.get(uri));
  }

  public void analyzeDocument(String uri, String text) {
    // git FS URIs are not currently supported
    if (uri.startsWith(GIT_FS_URI) || uri.startsWith(GIT_URI)) {
      LOG.warn(String.join(" ", GITFS_URI_NOT_SUPPORTED, uri));
      return;
    }
    contentCache.store(uri, text);
    documentService.openDocument(uri, text);
    communications.logGeneralMessage(MessageType.Log, now() + "[analyzeDocument] Document " + uri + " opened");

    if (isCopybook(uri, text)) {
      communications.logGeneralMessage(MessageType.Log, now() + "[analyzeDocument] Document " + uri + " treated as a copy");
      communications.publishDiagnostics(documentService.getOpenedDiagnostic());
      communications.logGeneralMessage(MessageType.Log, now() + "[analyzeDocument] Publish diagnostics: " + documentService.getOpenedDiagnostic());
    } else {
      communications.logGeneralMessage(MessageType.Log, now() + "[analyzeDocument] Document " + uri + " treated as a program, start analyzing");
      analyzeDocumentWithCopybooks(uri, text);
    }
  }

  public void reanalyzeDocument(String uri, String text) {
    // git FS URIs are not currently supported
    if (uri.startsWith(GIT_FS_URI) || uri.startsWith(GIT_URI)) {
      LOG.warn(String.join(" ", GITFS_URI_NOT_SUPPORTED, uri));
      return;
    }
    contentCache.store(uri, text);
    documentService.updateDocument(uri, text);
    communications.logGeneralMessage(MessageType.Log, now() + "[reanalyzeDocument] Document " + uri + " updated");

    if (isCopybook(uri, text)) {
      communications.logGeneralMessage(MessageType.Log, now() + "[reanalyzeDocument] Document " + uri + " treated as a copy");
      Set<String> affectedOpenedPrograms = documentService.findAffectedDocumentsForCopybook(uri, (d) -> !isCopybook(d.getUri(), d.getText()));
      reanalysePrograms(affectedOpenedPrograms);
    } else {
      communications.logGeneralMessage(MessageType.Log, now() + "[reanalyzeDocument] Document " + uri + " treated as a program");
      analyzeDocumentWithCopybooks(uri, text);
    }
  }

  public void stopAnalysis(String uri) {
    CobolDocumentModel documentModel = documentService.get(uri);

    contentCache.invalidate(uri);
    documentService.closeDocument(uri);
    communications.logGeneralMessage(MessageType.Log, now() + "[stopAnalysis] Document " + uri + " closed");

    communications.notifyProgressEnd(uri);
    communications.logGeneralMessage(MessageType.Log, now() + "[stopAnalysis] Document " + uri + " publish diagnostic: " + documentService.getOpenedDiagnostic());
    communications.publishDiagnostics(documentService.getOpenedDiagnostic());
    if (documentModel != null && !isCopybook(uri, documentModel.getText())) {
      documentService.removeDocument(uri);
    }
    syncProvider.remove(uri);
  }

  public List<Either<SymbolInformation, DocumentSymbol>> findDocumentSymbol(String uri) {
    List<DocumentSymbol> symbols =
        documentService.isDocumentSynced(uri)
            ? documentService.get(uri).getOutlineResult()
            : Collections.emptyList();
    try {
      return createDocumentSymbols(symbols);
    } finally {
      communications.notifyProgressEnd(uri);
    }
  }

  public Node retrieveAnalysis(String uri, String text) {
    CobolDocumentModel documentModel = documentService.get(uri);
    communications.logGeneralMessage(MessageType.Log, now() + "[retrieveAnalysis] Document " + uri);

    if (!documentModel.isDocumentSynced()) {
      analyzeDocumentWithCopybooks(uri, text);
    }
    return documentService.get(uri).getAnalysisResult().getRootNode();
  }

  public Hover findHover(String uri, HoverParams params) {
    return hoverProvider.getHover(documentService.get(uri), params);
  }

  public List<FoldingRange> findFoldingRange(String uri) {
    List<DocumentSymbol> symbols =
        documentService.isDocumentSynced(uri)
            ? documentService.get(uri).getOutlineResult()
            : Collections.emptyList();
    return DocumentServiceHelper.getFoldingRangeFromDocumentSymbol(symbols);
  }

  /**
   * Asynchronously analyze document with copybooks
   * @param uri - document uri
   * @param text - document text
   */
  private void analyzeDocumentWithCopybooks(String uri, String text) {
    try {
      if (isCopybook(uri, text)) {
        return;
      }
      communications.logGeneralMessage(MessageType.Log, now() + "[analyzeDocumentWithCopybooks] Start analysis: " + uri);
      communications.notifyProgressBegin(uri);
      doAnalysis(uri, text);
    } catch (Throwable th) {
      LOG.error("Error while processing file: {}, {}", uri, th.getMessage());
    } finally {
      communications.notifyProgressEnd(uri);
    }
  }

  private void notifyAnalysisFinished(
      String uri, List<String> copybooks, CopybookProcessingMode copybookProcessingMode) {
    dataBus.postData(
        AnalysisFinishedEvent.builder()
            .documentUri(uri)
            .copybookUris(copybooks)
            .copybookProcessingMode(copybookProcessingMode)
            .build());
  }

  private void doAnalysis(String uri, String text) {
    synchronized (syncProvider.getSync(uri)) {
      try {
        if (isCopybook(uri, text)) {
          return;
        }
        CopybookProcessingMode processingMode =
            CopybookProcessingMode.getCopybookProcessingMode(uri, CopybookProcessingMode.ENABLED);
        AnalysisConfig config = configurationService.getConfig(uri, processingMode);
        AnalysisResult result = engine.analyze(uri, text, config);
        ThreadInterruptionUtil.checkThreadInterrupted();

        documentService.processAnalysisResult(uri, result);
        notifyAnalysisFinished(uri, DocumentServiceHelper.extractCopybookUris(result), processingMode);

        communications.logGeneralMessage(MessageType.Log, now() + "[doAnalysis] Document " + uri + " analyzed: " + result.getDiagnostics());
        communications.publishDiagnostics(documentService.getOpenedDiagnostic());
        communications.logGeneralMessage(MessageType.Log, now() + "[doAnalysis] Document " + uri + " diagnostic published: " + documentService.getOpenedDiagnostic());
      } catch (Exception e) {
        communications.logGeneralMessage(MessageType.Error, createDescriptiveErrorMessage("analysis", uri));

        LOG.error(createDescriptiveErrorMessage("analysis", uri), e);
        throw e;
      }
    }
  }

  public void reanalyseOpenedPrograms() {
    documentService.getAllOpened()
        .stream().filter(d -> !isCopybook(d.getUri(), d.getText()))
        .forEach(doc -> analyzeDocumentWithCopybooks(doc.getUri(), doc.getText()));
  }

  private void reanalysePrograms(Set<String> programs) {
    documentService.getAll(programs)
        .stream().filter(d -> !isCopybook(d.getUri(), d.getText()))
        .forEach(doc -> analyzeDocumentWithCopybooks(doc.getUri(), doc.getText()));
  }

  private String createDescriptiveErrorMessage(String action, String uri) {
    return format("An exception thrown while applying %s for %s:", action, uri);
  }

  private List<Either<SymbolInformation, DocumentSymbol>> createDocumentSymbols(List<DocumentSymbol> documentSymbols) {
    return documentSymbols == null ? ImmutableList.of()
        : documentSymbols.stream()
        .map(Either::<SymbolInformation, DocumentSymbol>forRight)
        .collect(toList());
  }

  private String now() {
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
    LocalDateTime now = LocalDateTime.now();
    return dtf.format(now) + " ";
  }
}
