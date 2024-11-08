/*
 * Copyright (c) 2024 Broadcom.
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
package org.eclipse.lsp.cobol.usecases;

import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.Map;

/**
 * Test CICS ABEND command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-abend">ABEND Command</a>
 *
 * <p>This class tests all variations of the ABEND command found in the link above.
 */
public class TestCICSAbend {
  private static final String ABEND_VALID =
      "ABEND";
  private static final String ABEND_VALID_ABCODE =
          "ABEND ABCODE({$varFour})";
  private static final String ABEND_VALID_ABCODE_CANCEL_NODUMP =
          "ABEND ABCODE({$varFour}) CANCEL NODUMP";
  private static final String ABEND_INVALID_ABCODE =
          "ABEND ABCODE {END-EXEC | error}(100)";

  @Test
  void testAbendValid() {
    CICSTestUtils.noErrorTest(ABEND_VALID);
  }
  @Test
  void testAbendValidAbcode() {
    CICSTestUtils.noErrorTest(ABEND_VALID_ABCODE);
  }
  @Test
  void testAbendValidAbcodeNoDump() {
    CICSTestUtils.noErrorTest(ABEND_VALID_ABCODE_CANCEL_NODUMP);
  }
  @Test
  void testAbendInvalidAbcode() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error",
                    new Diagnostic(
                            new Range(),
                            "Extraneous input END-EXEC",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(ABEND_INVALID_ABCODE, expectedDiagnostic);
  }
}
