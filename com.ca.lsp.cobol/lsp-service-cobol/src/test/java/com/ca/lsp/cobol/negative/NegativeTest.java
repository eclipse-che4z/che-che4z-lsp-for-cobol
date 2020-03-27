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
package com.ca.lsp.cobol.negative;

import com.broadcom.lsp.cdi.LangServerCtx;
import com.ca.lsp.cobol.ConfigurableTest;
import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import org.eclipse.lsp4j.Diagnostic;

import java.util.List;

import static com.ca.lsp.cobol.service.delegates.validations.UseCaseUtils.analyzeForErrors;
import static org.junit.Assert.assertEquals;
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
  private static final List<CobolText> TEXTS =
      LangServerCtx.getInjector().getInstance(CobolTextRegistry.class).getNegatives();

  private String text;
  private int expectedErrorsNumber;

  NegativeTest(String fileName, int expectedErrorsNumber) {
    this.expectedErrorsNumber = expectedErrorsNumber;
    this.text = lookupFile(fileName);
  }

  protected void test() {

    List<Diagnostic> diagnostics = analyzeForErrors(text);

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
                    "The specfied file " + fileName + " does not exist in the given archive"));
  }

  private void assertErrorNumber(List<Diagnostic> diagnostics) {
    assertEquals(expectedErrorsNumber, diagnostics.size());
  }
}
