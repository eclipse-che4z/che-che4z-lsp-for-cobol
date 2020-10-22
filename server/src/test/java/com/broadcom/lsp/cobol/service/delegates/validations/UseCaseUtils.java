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
package com.broadcom.lsp.cobol.service.delegates.validations;

import com.broadcom.lsp.cobol.core.messages.MessageService;
import com.broadcom.lsp.cobol.core.model.CopybookModel;
import com.broadcom.lsp.cobol.domain.modules.DatabusModule;
import com.broadcom.lsp.cobol.domain.modules.EngineModule;
import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.service.CopybookProcessingMode;
import com.broadcom.lsp.cobol.service.CopybookService;
import com.broadcom.lsp.cobol.service.CopybookServiceImpl;
import com.broadcom.lsp.cobol.service.SettingsService;
import com.broadcom.lsp.cobol.service.mocks.TestLanguageClient;
import com.broadcom.lsp.cobol.service.utils.FileSystemService;
import com.broadcom.lsp.cobol.usecases.engine.UseCaseEngine;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Provider;
import lombok.experimental.UtilityClass;
import org.awaitility.Awaitility;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;
import org.eclipse.lsp4j.TextDocumentItem;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;

import static java.util.Collections.emptyList;
import static java.util.Optional.ofNullable;
import static java.util.concurrent.TimeUnit.MILLISECONDS;
import static java.util.stream.Collectors.toList;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.matches;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/** This utility class provides methods to run use cases with COBOL code examples. */
@UtilityClass
public class UseCaseUtils {
  public static final String DOCUMENT_URI = "file:///c%3A/workspace/document.cbl";
  public static final String DOCUMENT_2_URI = "file:///c%3A/workspace/document2.cbl";

  private static final String CPY_URI_PREFIX = "file:///c%3A/workspace/.c4z/.copybooks/";
  private static final String CPY_URI_SUFFIX = ".cpy";
  private static final String LANGUAGE = "cbl";

  private static final long MAX_TIME_TO_WAIT = 60000L;
  private static final long TIME_TO_POLL = 10L;
  private static final TimeUnit TIME_UNIT = MILLISECONDS;

  public static String toURI(String name) {
    return CPY_URI_PREFIX + name + CPY_URI_SUFFIX;
  }

  /**
   * Perform validation of the given text on the service.
   *
   * @param service - TextDocumentService instance to validate the text
   * @param text - COBOL text to be tested
   * @deprecated - try using analyze, analyzeForErrors, or {@link UseCaseEngine}
   */
  @Deprecated
  public static void runTextValidation(TextDocumentService service, String text) {
    service.didOpen(
        new DidOpenTextDocumentParams(new TextDocumentItem(DOCUMENT_URI, LANGUAGE, 1, text)));
  }

  /**
   * Await when the client will receive the needed message. Uses Supplier to check if the event
   * occurred. WARNING: use only in the thread that has been used to run the server. This
   * implementation uses the default time to await. Checker example: await( () -> { return
   * !client.getReceivedDiagnostics().isEmpty(); });
   *
   * @param checker - Lambda returning boolean, that will be used to check if the event occurred.
   *     Should return false if result has not appeared.
   * @deprecated - try using analyze, analyzeForErrors, or {@link UseCaseEngine}
   */
  @Deprecated
  public static void await(Callable<Boolean> checker) {
    await(checker, MAX_TIME_TO_WAIT, "");
  }

  /**
   * Await when the client will receive the needed message. Uses Supplier to check if the event
   * occurred. WARNING: use only in the thread that has been used to run the server. This
   * implementation uses the default time to await. Checker example: await( () -> { return
   * !client.getReceivedDiagnostics().isEmpty(); });
   *
   * @param checker - Lambda returning boolean, that will be used to check if the event occurred.
   *     Should return false if result has not appeared.
   * @param description - the TestLanguageClient that should receive the diagnostics
   * @deprecated - try using analyze, analyzeForErrors, or {@link UseCaseEngine}
   */
  @Deprecated
  private static void await(Callable<Boolean> checker, String description) {
    await(checker, MAX_TIME_TO_WAIT, description);
  }

  /**
   * Await when the client will receive the needed message. Uses Supplier to check if the event
   * occurred. WARNING: use only in the thread that has been used to run the server. Checker
   * example: await( () -> { return !client.getReceivedDiagnostics().isEmpty(); });
   *
   * @param checker - Lambda returning boolean, that will be used to check if the event occurred.
   *     Should return false if result has not appeared.
   * @param time - the maximum time to wait
   * @param description - the TestLanguageClient that should receive the diagnostics
   * @deprecated - try using analyze, analyzeForErrors, or {@link UseCaseEngine}
   */
  @Deprecated
  private static void await(Callable<Boolean> checker, Long time, String description) {
    Awaitility.await(description)
        .pollDelay(TIME_TO_POLL, TIME_UNIT)
        .atMost(time, TIME_UNIT)
        .until(checker);
  }

  /**
   * Await when the client will receive the diagnostics in case if there are some syntax or format
   * errors.
   *
   * @param client - the TestLanguageClient that should receive the diagnostics
   * @deprecated - try using analyze, analyzeForErrors, or {@link UseCaseEngine}
   */
  @Deprecated
  public static void waitForDiagnostics(TestLanguageClient client) {
    await(() -> !client.getReceivedDiagnostics().isEmpty(), "");
  }

  /**
   * Analyze the given text using a real language engine leaving only the diagnostics with the
   * severe (level 1) errors.
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @return list of diagnostics with only severe errors
   */
  public static List<Diagnostic> analyzeForErrors(String fileName, String text) {
    return analyzeForErrors(fileName, text, emptyList());
  }

  /**
   * Analyze the given text using a real language engine leaving only the diagnostics with the
   * severe (level 1) errors providing copybooks required for the analysis
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @return list of diagnostics with only severe errors
   */
  public static List<Diagnostic> analyzeForErrors(
      String fileName, String text, List<CobolText> copybooks) {
    return ofNullable(analyze(fileName, text, copybooks).getDiagnostics().get(fileName))
        .map(
            diagnostics ->
                diagnostics.stream()
                    .filter(it -> it.getSeverity() == DiagnosticSeverity.Error)
                    .collect(toList()))
        .orElse(emptyList());
  }

  /**
   * Analyze the given text using a real language engine providing copybooks required for the
   * analysis
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @return the entire analysis result
   */
  public static AnalysisResult analyze(String fileName, String text, List<CobolText> copybooks) {
    return analyze(fileName, text, copybooks, CopybookProcessingMode.ENABLED);
  }

  /**
   * Analyze the given text using a real language engine providing copybooks required for the
   * analysis with the required sync type
   *
   * @param fileName - name of the processing file
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @param copybookProcessingMode - sync type for the analysis
   * @return the entire analysis result
   */
  @SuppressWarnings("unchecked")
  public static AnalysisResult analyze(
      String fileName,
      String text,
      List<CobolText> copybooks,
      CopybookProcessingMode copybookProcessingMode) {
    SettingsService mockSettingsService = mock(SettingsService.class);
    when(mockSettingsService.getConfiguration(any()))
        .thenReturn(CompletableFuture.completedFuture(List.of()));

    LanguageClient languageClient = mock(LanguageClient.class);
    FileSystemService mockFileSystemService = mock(FileSystemService.class);
    when(mockFileSystemService.getNameFromURI(any())).thenReturn("");
    Injector injector =
        Guice.createInjector(
            new EngineModule(),
            new DatabusModule(),
            new AbstractModule() {
              @Override
              protected void configure() {
                bind(CopybookService.class).to(CopybookServiceImpl.class);
                bind(SettingsService.class).toInstance(mockSettingsService);
                bind(FileSystemService.class).toInstance(mockFileSystemService);
                bind(LanguageClient.class).toInstance(languageClient);
              }
            });

    CopybookService copybookService = injector.getInstance(CopybookService.class);
    copybooks.stream().map(UseCaseUtils::toCopybookModel).forEach(copybookService::store);

    return injector
        .getInstance(CobolLanguageEngineFacade.class)
        .analyze(fileName, text, copybookProcessingMode);
  }

  public static CopybookModel toCopybookModel(CobolText cobolText) {
    return new CopybookModel(
        cobolText.getFileName(), toURI(cobolText.getFileName()), cobolText.getFullText());
  }
}
