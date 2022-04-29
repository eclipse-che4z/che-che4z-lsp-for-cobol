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

import org.eclipse.lsp.cobol.ConfigurableTest;
import org.eclipse.lsp4j.Diagnostic;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This abstract class encapsulates the common logic of all tests that use the positive test file
 * set.
 */
public abstract class FileBasedTest extends ConfigurableTest {
  private static final CobolTextRegistry TEXT_REGISTRY = retrieveTextsRegistry();

  /**
   * Get the files to be analyzed by Language Server from {@link CobolTextRegistry} using file-based
   * implementation.
   *
   * @return the list of objects that would be passed to the constructor one by one
   */
  protected static List<CobolText> getTextsToTest() {
    return TEXT_REGISTRY.getPositives();
  }
  /**
   * Get the copybooks to be passed to the Language Server while analyzing from {@link
   * CobolTextRegistry} using file-based implementation.
   *
   * @return the list of all defined copybooks
   */
  protected static List<CobolText> getCopybooks() {
    return TEXT_REGISTRY.getCopybooks();
  }

  /**
   * Check that there were no errors found.
   *
   * @param diagnostics list of diagnostic from the analysis result
   * @param fileName name of the file that has been tested
   */
  protected void assertNoSyntaxErrorsFound(List<Diagnostic> diagnostics, String fileName) {
    assertEquals(0, diagnostics.size(), createErrorMessage(diagnostics, fileName));
  }

  private String createErrorMessage(List<Diagnostic> diagnostics, String fileName) {
    StringBuilder result = new StringBuilder(fileName);
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
