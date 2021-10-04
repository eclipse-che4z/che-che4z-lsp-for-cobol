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

import lombok.extern.slf4j.Slf4j;
import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullSource;

/**
 * This class provides capability to run the server for actual cobol files that are provided using
 * {@link CobolTextRegistry}. The positive test should always pass. If not, then there are some
 * regressions. The complete error description with the file name logged.
 */
@Slf4j
class PositiveTest extends FileBasedTest {
  @ParameterizedTest
  @MethodSource("org.eclipse.lsp.cobol.positive.FileBasedTest#getTextsToTest")
  @DisplayName("Parameterized - positive tests")
  @NullSource
  void test(CobolText text) {
    if (text == null) {
      return;
    }
    String fileName = text.getFileName();
    LOG.debug("Processing: " + fileName);
    assertNoSyntaxErrorsFound(
        UseCaseUtils.analyzeForErrors(
            UseCase.builder()
                .fileName(fileName)
                .text(text.getFullText())
                .copybooks(getCopybooks())
                .build()),
        fileName);
  }
}
