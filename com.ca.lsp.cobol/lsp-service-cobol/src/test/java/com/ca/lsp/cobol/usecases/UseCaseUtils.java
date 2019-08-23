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
package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.service.IMyLanguageServer;
import com.ca.lsp.cobol.service.MyTextDocumentService;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import com.ca.lsp.cobol.service.mocks.TestLanguageServer;
import org.awaitility.Awaitility;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;
import org.eclipse.lsp4j.TextDocumentItem;
import org.eclipse.lsp4j.services.LanguageClient;
import org.eclipse.lsp4j.services.TextDocumentService;

import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

/**
 * This utility class provides methods to run use cases with Cobol code examples.
 *
 * @author teman02
 */
public class UseCaseUtils {
  public static final String LANGUAGE = "cbl";
  public static final String DOCUMENT_URI = "1";

  private static final long MAX_TIME_TO_WAIT = 60000L;
  private static final long TIME_TO_POLL = 10L;
  private static final TimeUnit TIME_UNIT = TimeUnit.MILLISECONDS;

  private UseCaseUtils() {}

  /**
   * Create client, server and run services to validate given text. Plug-and-play method for the
   * following methods.
   *
   * @param text - Cobol text to be validated
   * @return TestLanguageClient instance to receive responses from the language server
   */
  public static TestLanguageClient startServerAndRunValidation(String text) {
    TestLanguageClient client = new TestLanguageClient();
    runTextValidation(createServer(client), text);
    return client;
  }

  /**
   * Create language server and TextDocumentService instance and return the last one
   *
   * @param client - The LanguageClient instance to be observed on the client side
   * @return TextDocumentService instance ready to use
   */
  public static TextDocumentService createServer(LanguageClient client) {
    IMyLanguageServer server = new TestLanguageServer(client);
    return new MyTextDocumentService(server);
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
    await(checker, MAX_TIME_TO_WAIT);
  }

  /**
   * Await when the client will receive the needed message. Uses Supplier to check if the event
   * occurred. WARNING: use only in the thread that has been used to run the server. Checker
   * example: await( () -> { return !client.getReceivedDiagnostics().isEmpty(); });
   *
   * @param checker - Lambda returning boolean, that will be used to check if the event occurred.
   *     Should return false if result has not appeared.
   * @param time - the maximum time to wait
   */
  public static void await(Callable<Boolean> checker, Long time) {
    Awaitility.await().pollDelay(TIME_TO_POLL, TIME_UNIT).atMost(time, TIME_UNIT).until(checker);
  }

  /**
   * Await when the client will receive the diagnostics in case if there are some syntax or format
   * errors.
   *
   * @param client - the TestLanguageClient that should receive the diagnostics
   */
  public static void waitForDiagnostics(TestLanguageClient client) {
    await(
        () -> !client.getReceivedDiagnostics().isEmpty());
  }
}
