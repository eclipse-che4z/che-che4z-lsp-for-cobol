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
package com.broadcom.lsp.cobol.negative;

import com.broadcom.lsp.cobol.ConfigurableTest;
import com.broadcom.lsp.cobol.positive.CobolText;
import com.broadcom.lsp.cobol.service.delegates.validations.UseCaseUtils;
import org.eclipse.lsp4j.Diagnostic;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * This class is an abstract negative test case and should be instantiated with specifying concrete
 * Cobol files to test. Every heir should also override checkErrors() method to assert the
 * presenting of required errors.
 *
 * <p>The description provided with inherited tests should contain a list of errors that was
 * returned by the actual compiler. The name pattern of compiler error contains the level of
 * severity:
 *
 * <p>W - warning
 *
 * <p>E - Error
 *
 * <p>S - Severe
 */
public abstract class NegativeTest extends ConfigurableTest {

  private static final List<CobolText> TEXTS = retrieveTextsRegistry().getNegatives();
  private String fileName;
  private String text;
  private int expectedErrorsNumber;
  private List<CobolText> copybooks;

  NegativeTest(String fileName, int expectedErrorsNumber, List<CobolText> copybooks) {
    this.fileName = fileName;
    this.expectedErrorsNumber = expectedErrorsNumber;
    this.text = lookupFile(fileName);
    this.copybooks = copybooks;
  }

  protected void test() {

    List<Diagnostic> diagnostics = UseCaseUtils.analyzeForErrors(fileName, text, copybooks);

    assertErrorNumber(diagnostics);

    checkErrors(diagnostics);
  }

  /**
   * Should be overridden to verify the presence of all the required errors.
   *
   * @param diagnostics - the errors to be checked
   */
  protected void checkErrors(List<Diagnostic> diagnostics) {
    diagnostics.forEach(System.out::println);
  }

  private String lookupFile(String fileName) {
    return TEXTS.stream()
        .filter(it -> it.getFileName().equals(fileName))
        .map(CobolText::getFullText)
        .findFirst()
        .orElseThrow(
            () ->
                new IllegalArgumentException(
                    "The specified file " + fileName + " does not exist in the given archive"));
  }

  private void assertErrorNumber(List<Diagnostic> diagnostics) {
    assertEquals(expectedErrorsNumber, diagnostics.size());
  }
}
