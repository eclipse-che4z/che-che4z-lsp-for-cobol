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

import org.eclipse.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.NullSource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.fail;

/**
 * This test checks that the files in the positive test set don't produce any {@link
 * RuntimeException} while analyzing them char by char. Disabled by default, to enable provide
 * <code>-Dtests.typing=true
 * </code> as a system property for the run configuration.
 */
class TypingTest extends FileBasedTest {
  private static final String MODE_PROPERTY_NAME = "tests.typing";
  private static final String TEST_MODE = System.getProperty(MODE_PROPERTY_NAME);

  @ParameterizedTest
  @MethodSource("org.eclipse.lsp.cobol.positive.FileBasedTest#getTextsToTest")
  @DisplayName("Typing test")
  @NullSource
  void typingTest(CobolText text) {
    if (!Boolean.TRUE.toString().equals(TEST_MODE) || text == null) return;

    String name = text.getFileName();
    String fullText = text.getFullText();

    StringBuilder currentText = new StringBuilder();
    List<Diagnostic> result = new ArrayList<>();
    try {
      for (char c : fullText.toCharArray()) {
        currentText.append(c);
        if (c == ' ') continue;
        UseCaseUtils.analyzeForErrors(name, currentText.toString(), getCopybooks());
      }
    } catch (RuntimeException e) {
      fail(String.format("Text that produced the error:\n%s", currentText), e);
    }
  }
}
