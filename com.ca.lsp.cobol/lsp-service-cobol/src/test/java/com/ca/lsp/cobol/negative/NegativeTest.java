/*
 * Copyright (c) 2019 Broadcom.
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

import static com.ca.lsp.cobol.usecases.UseCaseUtils.startServerAndRunValidation;
import static com.ca.lsp.cobol.usecases.UseCaseUtils.waitForDiagnostics;
import static org.junit.Assert.assertEquals;

import java.util.List;

import org.eclipse.lsp4j.Diagnostic;

import com.ca.lsp.cobol.positive.CobolText;
import com.ca.lsp.cobol.positive.CobolTextRegistry;
import com.ca.lsp.cobol.service.mocks.TestLanguageClient;
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
 *
 * @author teman02
 */
public abstract class NegativeTest {
  private static final List<CobolText> TEXTS = CobolTextRegistry.INSTANCE.getNegatives();

  private String text;
  private int expectedErrorsNumber;

  protected NegativeTest(String fileName, int expectedErrorsNumber) {
    this.expectedErrorsNumber = expectedErrorsNumber;
    this.text = lookupFile(fileName);
  }

  protected void test() {
    TestLanguageClient client = startServerAndRunValidation(text);

    waitForDiagnostics(client);

    asserErrorNumber(client);

    checkErrors(client);
  }

  /**
   * Should be overridden to verify the presence of all the required errors.
   *
   * @param client - The TestLanguageClient instance to retrieve found errors
   */
  protected void checkErrors(TestLanguageClient client) {
    List<Diagnostic> diagnostics = client.getDiagnostics();
    diagnostics.forEach(System.out::println);
  }

  private String lookupFile(String fileName) {
    return TEXTS
        .stream()
        .filter(it -> it.getFileName().equals(fileName))
        .map(text -> text.getText())
        .findFirst()
        .orElseThrow(
            () ->
                new IllegalArgumentException(
                    "The specfied file " + fileName + " does not exist in the given archive"));
  }

  private void asserErrorNumber(TestLanguageClient client) {
    assertEquals(expectedErrorsNumber, client.getDiagnostics().size());
  }
}
