/*
 * Copyright (c) 2021 Broadcom.
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

import org.eclipse.lsp.cobol.usecases.engine.UseCase;
import org.eclipse.lsp.cobol.usecases.engine.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullSource;

import java.util.List;

/**
 * This test collects the time that the Language Engine needs to parse the given text from the
 * positive tests set. The result outputs to the console in the form "TEST.cbl 100 10" where
 * "TEST.cbl" is a file name, "100" is the length of the file in chars and "10" is the parsing time.
 * Disabled by default, to enable provide <code>-Dtests.perf=true</code> as a system property for
 * the run configuration.
 */
class PerformanceTest extends FileBasedTest {
  private static final String MODE_PROPERTY_NAME = "tests.perf";
  private static final String TEST_MODE = System.getProperty(MODE_PROPERTY_NAME);

  @ParameterizedTest
  @MethodSource("org.eclipse.lsp.cobol.positive.FileBasedTest#getTextsToTest")
  @DisplayName("Performance test")
  @NullSource
  void performanceTest(CobolText text) {
    if (!Boolean.TRUE.toString().equals(TEST_MODE) || text == null) return;

    String name = text.getFileName();
    String fullText = text.getFullText();

    long start = System.currentTimeMillis();
    List<Diagnostic> result =
        UseCaseUtils.analyzeForErrors(
            UseCase.builder().fileName(name).text(fullText).copybooks(getCopybooks()).build());
    long stop = System.currentTimeMillis();

    assertNoSyntaxErrorsFound(result, name);
    System.out.printf("%s %d %d\n", name, fullText.length(), stop - start);
  }
}
