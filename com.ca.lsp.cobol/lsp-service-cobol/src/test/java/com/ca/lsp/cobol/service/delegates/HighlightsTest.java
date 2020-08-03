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
 *   Broadcom, Inc. - initial API and implementation
 */

package com.ca.lsp.cobol.service.delegates;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import org.eclipse.lsp4j.*;
import org.eclipse.lsp4j.services.TextDocumentService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.runTextValidation;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.waitForDiagnostics;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Testing Document Highlighting with a variable, position is passed in INNER1_POSITION and the
 * EXPECTED_RANGES is where the expected highlighting is to be enabled
 */
public class HighlightsTest extends ConfigurableTest {
  private static final String TEXT =
      "       Identification Division. \n"
          + "       Program-id.    ProgramId.\n"
          + "       Data Division.\n"
          + "       Working-Storage Section.\n"
          + "       01   outer1. \n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       01   outer2.\n"
          + "        02   inner1      PIC 9(4) Binary. \n"
          + "        02   inner2      PIC X(10).\n"
          + "       02   Str          PIC 9(4) Binary. \n"
          + "       Procedure Division.\n"
          + "       000-Main-Logic.\n"
          + "           Perform 100-Test.\n"
          + "           Stop Run.\n"
          + "       100-Test.\n"
          + "           Move inner1 of outer1 to Str.\n"
          + "           Move inner2 of outer1 to Str.\n"
          + "           Move inner1 of outer2 to Str.\n"
          + "           Move inner2 of outer2 to Str.\n"
          + "       End program ProgramId.";

  private static final Position INNER1_POSITION = new Position(16, 18);

  private static final List<Range> EXPECTED_RANGES = new ArrayList<>();

  static {
    EXPECTED_RANGES.add(new Range(new Position(5, 13), new Position(5, 19)));
    EXPECTED_RANGES.add(new Range(new Position(8, 13), new Position(8, 19)));
    EXPECTED_RANGES.add(new Range(new Position(16, 16), new Position(16, 22)));
    EXPECTED_RANGES.add(new Range(new Position(18, 16), new Position(18, 22)));
  }

  private TextDocumentService service;

  @BeforeEach
  void initializeService() {
    service = LangServerCtx.getInjector().getInstance(TextDocumentService.class);
    TestLanguageClient client = LangServerCtx.getInjector().getInstance(TestLanguageClient.class);
    client.clean();
    runTextValidation(service, TEXT);
    waitForDiagnostics(client);
  }

  @Test
  void findHighlightsTest() throws InterruptedException, ExecutionException {
    List<Range> documentHighlights =
        service
            .documentHighlight(
                new TextDocumentPositionParams(
                    new TextDocumentIdentifier(UseCaseUtils.DOCUMENT_URI), INNER1_POSITION))
            .get().stream()
            .map(DocumentHighlight::getRange)
            .collect(Collectors.toList());
    assertEquals(EXPECTED_RANGES.size(), documentHighlights.size());
    EXPECTED_RANGES.forEach(it -> assertTrue(documentHighlights.contains(it)));
  }
}
