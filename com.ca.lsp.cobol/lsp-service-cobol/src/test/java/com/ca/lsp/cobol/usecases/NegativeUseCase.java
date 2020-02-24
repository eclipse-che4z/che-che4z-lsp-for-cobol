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
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.Range;

import java.util.List;
import java.util.stream.Collectors;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.*;
import static org.junit.Assert.fail;

/** This class is a base for use cases that check the if some text contains syntax errors. */
@Slf4j
public abstract class NegativeUseCase extends ConfigurableTest {

  protected String text;

  NegativeUseCase(String text) {
    this.text = text;
  }

  protected void test() {
    List<Range> ranges = retrieveRanges(analyzeForErrors(text));
    if (ranges.isEmpty()) {
      fail("No diagnostics received");
    }
    assertRanges(ranges);
  }

  protected abstract void assertRanges(List<Range> range);

  private List<Range> retrieveRanges(List<Diagnostic> diagnostics) {
    if (diagnostics.isEmpty()) {
      fail("No diagnostics received");
    }
    return diagnostics.stream()
        .peek(it -> log.info(it.toString()))
        .map(Diagnostic::getRange)
        .collect(Collectors.toList());
  }
}
