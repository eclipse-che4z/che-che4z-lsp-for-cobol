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
package org.eclipse.lsp.cobol.positive;

import org.eclipse.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullSource;

import java.util.List;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name logged.
 */
@Slf4j
class PositiveTest extends ConfigurableTest {
  private static List<CobolText> copybooks;

  /**
   * Retrieve the files to be analyzed by Language Server from {@link CobolTextRegistry} using
   * file-based implementation.
   *
   * @return a collection of objects that would be passed to the constructor one by one.
   */
  private static Stream<CobolText> retrieveTextsToTest() {
    CobolTextRegistry cobolTextRegistry = retrieveTextsRegistry();
    copybooks = cobolTextRegistry.getCopybooks();
    return cobolTextRegistry.getPositives().stream();
  }

  @ParameterizedTest
  @MethodSource("retrieveTextsToTest")
  @DisplayName("Parameterized - positive tests")
  @NullSource
  void test(CobolText text) {
    if (text == null) {
      return;
    }
    LOG.debug("Processing: " + text.getFileName());
    assertNoSyntaxErrorsFound(
        UseCaseUtils.analyzeForErrors(text.getFileName(), text.getFullText(), copybooks), text);
  }

  private void assertNoSyntaxErrorsFound(List<Diagnostic> diagnostics, CobolText text) {
    assertEquals(0, diagnostics.size(), createErrorMessage(diagnostics, text));
  }

  private String createErrorMessage(List<Diagnostic> diagnostics, CobolText text) {
    StringBuilder result = new StringBuilder(text.getFileName());
    result.append(" contains syntax errors:\r\n");
    diagnostics.forEach(
        it -> {
          result.append(it.getRange().getStart().getLine() + 1);
          result.append(":");
          result.append(it.getRange().getStart().getCharacter());
          result.append(" - ");
          result.append(it.getRange().getEnd().getLine() + 1);
          result.append(":");
          result.append(it.getRange().getEnd().getCharacter());
          result.append(" : ");
          result.append(it.getMessage());
          result.append("\r\n");
        });
    return result.toString();
  }
}
