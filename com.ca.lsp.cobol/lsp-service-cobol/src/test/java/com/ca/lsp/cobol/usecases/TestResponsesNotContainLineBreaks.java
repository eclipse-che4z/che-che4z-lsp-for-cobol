/*
 *
 *  Copyright (c) 2020 Broadcom.
 *  The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
 *
 *  This program and the accompanying materials are made
 *  available under the terms of the Eclipse Public License 2.0
 *  which is available at https://www.eclipse.org/legal/epl-2.0/
 *
 *  SPDX-License-Identifier: EPL-2.0
 *
 *  Contributors:
 *    Broadcom, Inc. - initial API and implementation
 *
 */

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import org.junit.Test;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.startServerAndRunValidation;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.waitForDiagnostics;
import static java.util.Optional.ofNullable;
import static org.junit.Assert.assertFalse;

/**
 * This test verifies that all the responses from server escaped from line breaks to prevent
 * incorrect parsing on the client side.
 */
public class TestResponsesNotContainLineBreaks extends ConfigurableTest {

  private static final String TEXT =
      "        IDENTIFICATION DIVISION. \n"
          + "        PROGRAM-ID. test1.\n"
          + "        DATA DIVISION.\n"
          + "        WORKING-STORAGE SECTION.   \n"
          + "        PROCEDURE DIVISION.\n"
          + "           PERFORM VARYING A FROM 10 BY 10 UNTIL  > 40\n" // May contain line break in
          // a diagnostic message between 40 and PERFORM
          + "               PERFORM VARYING b FROM 1 BY 1 UNTIL B > 4\n"
          + "               END-PERFORM\n"
          + "            END-PERFORM.\n"
          + "            STOP RUN.";

  @Test
  public void test() {
    TestLanguageClient client = startServerAndRunValidation(TEXT);
    waitForDiagnostics(client);

    client.getDiagnostics().forEach(it -> assertStringWithoutLineBreaks(it.getMessage()));
    client.getDiagnostics().forEach(it -> assertStringWithoutLineBreaks(it.getCode()));
    client.getDiagnostics().forEach(it -> assertStringWithoutLineBreaks(it.getSource()));

    client.getMessagesToLog().forEach(it -> assertStringWithoutLineBreaks(it.getMessage()));
    client.getMessagesToShow().forEach(it -> assertStringWithoutLineBreaks(it.getMessage()));
  }

  private void assertStringWithoutLineBreaks(String str) {
    ofNullable(str)
        .ifPresent(
            it -> {
              assertFalse(it, it.contains("\r\n"));
              assertFalse(it, it.contains("\n"));
              assertFalse(it, it.contains("\r"));
            });
  }
}
