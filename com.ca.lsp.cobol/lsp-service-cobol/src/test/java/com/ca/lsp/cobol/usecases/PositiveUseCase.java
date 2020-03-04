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

import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;

import java.util.List;

import static java.util.Collections.emptyList;
import static org.junit.Assert.assertEquals;

/**
 * This class is a base for use cases that check the if some text does not contain any syntax
 * errors.
 */
public abstract class PositiveUseCase extends ConfigurableTest {
  private String text;

  PositiveUseCase(String text) {
    this.text = text;
  }

  void setText(String text) {
    this.text = text;
  }

  protected void test() {
    test(emptyList());
  }

  protected void test(List<CobolText> copybooks) {
    List<Diagnostic> diagnostics = UseCaseUtils.analyzeForErrors(text, copybooks);

    assertEquals(createMessage(diagnostics), 0, diagnostics.size());
  }

  private String createMessage(List<Diagnostic> diagnostics) {
    return diagnostics.stream()
        .map(Diagnostic::getMessage)
        .reduce((x, y) -> x + "\r\n" + y)
        .orElse("");
  }
}
