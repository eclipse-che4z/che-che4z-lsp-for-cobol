/*
 * Copyright (c) 2020 Broadcom.
 *
 * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 * This program and the accompanying materials are made
 * available under the terms of the Eclipse Public License 2.0
 * which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 * SPDX-License-Identifier: EPL-2.0
 *
 * Contributors:
 * Broadcom, Inc. - initial API and implementation
 *
 *
 */
package com.ca.lsp.cobol.service.delegates.validations;

import com.broadcom.lsp.cdi.EngineModule;
import com.broadcom.lsp.cdi.LangServerCtx;
import com.broadcom.lsp.cdi.module.databus.DatabusModule;
import com.broadcom.lsp.domain.cobol.databus.api.DataBusBroker;
import com.broadcom.lsp.domain.cobol.event.model.FetchedCopybookEvent;
import com.broadcom.lsp.domain.cobol.event.model.RequiredCopybookEvent;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.TextDocumentSyncType;
import com.ca.lsp.cobol.service.mocks.MockWorkspaceService;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import com.google.inject.Guice;
import com.google.inject.Injector;
import lombok.experimental.UtilityClass;
import org.awaitility.Awaitility;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;
import org.eclipse.lsp4j.TextDocumentItem;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

import static java.util.Collections.emptyList;
import static java.util.stream.Collectors.toList;

/** This utility class provides methods to run use cases with Cobol code examples. */
@UtilityClass
public class UseCaseUtils {
  public static final String DOCUMENT_URI = "file:///c%3A/workspace/document.cbl";
  private static final String LANGUAGE = "cbl";

  private static final long MAX_TIME_TO_WAIT = 60000L;
  private static final long TIME_TO_POLL = 10L;
  private static final TimeUnit TIME_UNIT = TimeUnit.MILLISECONDS;

  /**
   * Create client, server and run services to validate given text. Plug-and-play method for the
   * following methods.
   *
   * @param text - Cobol text to be validated
   * @return TestLanguageClient instance to receive responses from the language server
   */
  public static TestLanguageClient startServerAndRunValidation(String text) {
    TestLanguageClient client =
        (TestLanguageClient) LangServerCtx.getInjector().getInstance(LanguageClient.class);
    client.clean();
    TextDocumentService service =
        LangServerCtx.getInjector().getInstance(TextDocumentService.class);
    runTextValidation(service, text);
    return client;
  }

  /**
   * Perform validation of the given text on the service
   *
   * @param service - TextDocumentService instance to validate the text
   * @param text - Cobol text to be tested
   */
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
   */
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
   */
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
   */
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
   */
  public static void waitForDiagnostics(TestLanguageClient client) {
    await(() -> !client.getReceivedDiagnostics().isEmpty(), "");
  }

  /**
   * Await when the client will receive the diagnostics in case if there are some syntax or format
   * errors.
   *
   * @param client - the TestLanguageClient that should receive the diagnostics
   * @param description - the TestLanguageClient that should receive the diagnostics
   */
  public static void waitForDiagnostics(TestLanguageClient client, String description) {
    await(() -> !client.getReceivedDiagnostics().isEmpty(), description);
  }

  /**
   * Analyze the given text using a real language engine.
   *
   * @param text - text to analyze
   * @return the entire analysis result
   */
  public static AnalysisResult analyze(String text) {
    return analyze(text, emptyList());
  }

  /**
   * Analyze the given text using a real language engine leaving only the diagnostics with the
   * severe (level 1) errors.
   *
   * @param text - text to analyze
   * @return list of diagnostics with only severe errors
   */
  public static List<Diagnostic> analyzeForErrors(String text) {
    return analyzeForErrors(text, emptyList());
  }
  /**
   * Analyze the given text using a real language engine leaving only the diagnostics with the
   * severe (level 1) errors providing copybooks required for the analysis
   *
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @return list of diagnostics with only severe errors
   */
  public static List<Diagnostic> analyzeForErrors(String text, List<CobolText> copybooks) {
    return analyze(text, copybooks).getDiagnostics().stream()
        .filter(it -> it.getSeverity().getValue() == 1)
        .collect(toList());
  }
  /**
   * Analyze the given text using a real language engine providing copybooks required for the
   * analysis
   *
   * @param text - text to analyze
   * @param copybooks - list of copybooks required for the analysis
   * @return the entire analysis result
   */
  @SuppressWarnings("unchecked")
  public static AnalysisResult analyze(String text, List<CobolText> copybooks) {

    Injector injector = Guice.createInjector(new EngineModule(), new DatabusModule());

    DataBusBroker<FetchedCopybookEvent, RequiredCopybookEvent> broker =
        injector.getInstance(DataBusBroker.class);

    MockWorkspaceService workspaceService = new MockWorkspaceService(broker);
    workspaceService.setCopybooks(() -> copybooks);

    return injector
        .getInstance(CobolLanguageEngineFacade.class)
        .analyze(DOCUMENT_URI, text, TextDocumentSyncType.DID_OPEN);
  }
}
