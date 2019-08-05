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

import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
import org.eclipse.lsp4j.Diagnostic;

import static com.ca.lsp.cobol.usecases.UseCaseUtils.startServerAndRunValidation;
import static com.ca.lsp.cobol.usecases.UseCaseUtils.waitForDiagnostics;
import static org.junit.Assert.assertEquals;

public abstract class PositiveUseCase {
  private String text;

  PositiveUseCase(String text) {
    this.text = text;
  }

  protected String getText() {
    return text;
  }

  protected void setText(String text) {
    this.text = text;
  }

  protected void test() {
    TestLanguageClient client = startServerAndRunValidation(text);

    waitForDiagnostics(client);

    assertEquals(createMessage(client), 0, client.getDiagnostics().size());
  }

  private String createMessage(TestLanguageClient client) {
    return client
        .getDiagnostics()
        .stream()
        .map(Diagnostic::getMessage)
        .reduce((x, y) -> x + "\r\n" + y)
        .orElse("");
  }
}
