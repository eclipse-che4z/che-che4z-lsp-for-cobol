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
package com.broadcom.lsp.cobol.usecases;

import com.broadcom.lsp.cobol.ConfigurableTest;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.broadcom.lsp.cobol.service.mocks.TestLanguageClient;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

class TestFormatTrim extends ConfigurableTest {
  private static final String ID = "id";

  private TextDocumentService service;
  private TestLanguageClient client;

  private static final Pattern RTRIM = Pattern.compile("\\s+$");

  private static final String TEXT =
      "000000 Identification DIVISION.                                         23323232\r\n"
          + "002800 Program-ID.                                                      23323232  \r\n"
          + "002800  HELLOWORLD.                                                     233232322@\t                                          \r\n"
          + "223d3& AUTHOR.\r\n"
          + "002800 INPUT-OUTPUT SECTION.                                            23323232  ";

  @BeforeEach
  void createService() {
    service = injector.getInstance(TextDocumentService.class);
    client = injector.getInstance(TestLanguageClient.class);
    client.clean();
    service.didOpen(new DidOpenTextDocumentParams(new TextDocumentItem(ID, "COBOL", 1, TEXT)));
  }

  @Test
  void testTrimming() {
    UseCaseUtils.waitForDiagnostics(client);
    CompletableFuture<List<? extends TextEdit>> formatting =
        service.formatting(
            new DocumentFormattingParams(
                new TextDocumentIdentifier(ID), new FormattingOptions(1, false)));

    try {
      assertEquals(trim(TEXT), formatting.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  @Test
  void testTrimmingBeforeDidOpenFinished() {
    CompletableFuture<List<? extends TextEdit>> formatting =
        service.formatting(
            new DocumentFormattingParams(
                new TextDocumentIdentifier("nonExistingId"), new FormattingOptions(1, false)));

    try {
      assertEquals(Collections.emptyList(), formatting.get());
    } catch (InterruptedException | ExecutionException e) {
      fail(e.getMessage());
    }
  }

  private List<TextEdit> trim(String text) {
    try (BufferedReader bufReader = new BufferedReader(new StringReader(text))) {
      String line;
      int k = 0;
      List<TextEdit> array = new ArrayList<>();
      while ((line = bufReader.readLine()) != null) {
        String newLine = rtrim(line);
        array.add(
            new TextEdit(new Range(new Position(k, 0), new Position(k, line.length())), newLine));
        k++;
      }
      return array;
    } catch (IOException e) {
      fail(e.getMessage());
    }
    return List.of();
  }

  private static String rtrim(String s) {
    return RTRIM.matcher(s).replaceAll("");
  }
}
