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
package com.ca.lsp.cobol.service.delegates;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertThat;

import java.util.List;
import org.eclipse.lsp4j.Diagnostic;
import org.junit.Test;

import com.ca.lsp.cobol.service.delegates.validations.Validation;

public class ValidationTest {
  private static final String LANGUAGE = "cbl";
  private static final String INCORRECT_TEXT_EXAMPLE = "       IDENTIFICATION DIVISIONs.";
  private static final String DOCUMENT_URI = "1";

  /**
   * verify that on a cobol file the Cobol Language Engine is spawned and return a diagnostic
   * message for a given wrong cobol file as input
   */
  @Test
  public void testValidation() {

    // didOpen register the handler for a given cobol file
    Validation.registerEngine(DOCUMENT_URI, LANGUAGE);

    // based on the language engine the validation process select the correct handler (CLE in the
    // example)
    List<Diagnostic> diagnosticList = Validation.validate(DOCUMENT_URI, INCORRECT_TEXT_EXAMPLE);
    assertThat(diagnosticList.size(), is(not(0)));
  }
}
