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
import org.eclipse.lsp4j.Range;

import java.util.List;

import static com.ca.lsp.cobol.usecases.UseCaseUtils.startServerAndRunValidation;
import static com.ca.lsp.cobol.usecases.UseCaseUtils.waitForDiagnostics;
import static org.junit.Assert.fail;

/**
 * This class is a base for use cases that check the if some text contains syntax errors.
 *
 * @author teman02
 */
public abstract class NegativeUseCase {

  protected String text;

  NegativeUseCase(String text) {
    this.text = text;
  }

  protected void test() {
    TestLanguageClient client = startServerAndRunValidation(text);

    waitForDiagnostics(client);

    Range range = retrieveRange(client);

    assertRange(range);
  }

  protected abstract void assertRange(Range range);

  protected Range retrieveRange(TestLanguageClient client) {
    List<Diagnostic> diagnostics = client.getDiagnostics();
    if (diagnostics.isEmpty()) {
      fail("No diagnostics received");
    }
    Diagnostic diagnostic = diagnostics.get(0);
    return diagnostic.getRange();
  }
}
