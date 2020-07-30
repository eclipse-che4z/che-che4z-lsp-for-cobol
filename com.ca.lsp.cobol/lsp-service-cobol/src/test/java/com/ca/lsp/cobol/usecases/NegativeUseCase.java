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
package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.positive.CobolText;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Diagnostic;

import java.util.List;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.DOCUMENT_URI;
import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyzeForErrors;
import static java.util.Collections.emptyList;
import static org.junit.jupiter.api.Assertions.fail;

/** This class is a base for use cases that check the if some text contains syntax errors. */
@Slf4j
public abstract class NegativeUseCase {

  protected String text;

  NegativeUseCase(String text) {
    this.text = text;
  }

  protected void test() {
    test(emptyList());
  }

  protected void test(List<CobolText> copybooks) {
    List<Diagnostic> diagnostics = analyzeForErrors(DOCUMENT_URI, text, copybooks);
    if (diagnostics.isEmpty()) {
      fail("No diagnostics received");
    }
    assertDiagnostics(diagnostics);
  }

  protected abstract void assertDiagnostics(List<Diagnostic> range);
}
