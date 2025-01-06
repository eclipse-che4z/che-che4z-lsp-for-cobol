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
import org.eclipse.lsp4j.Position;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS TEST EVENT command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-test-event">TEST EVENT
 * Command</a>
 *
 * <p>This class tests all variations of the TEST EVENT command found in the link above.
 */
public class TestCicsTest {
  private static final String TEST_EVENT_VALID_ONE = "TEST EVENT({$varOne}) FIRESTATUS({$varTwo})";
  private static final String TEST_EVENT_VALID_TWO = "TEST FIRESTATUS({$varTwo}) EVENT({$varOne})";

  private static final String TEST_EVENT_INVALID_ONE = "TEST {EVENT|error1}({$varOne})";
  private static final String TEST_EVENT_INVALID_TWO = "TEST {FIRESTATUS|error1}({$varTwo})";


  @Test
  void testCicsTestValidOne() {
    CICSTestUtils.noErrorTest(TEST_EVENT_VALID_ONE);
  }

  @Test
  void testCicsTestValidTwo() {
    CICSTestUtils.noErrorTest(TEST_EVENT_VALID_TWO);
  }

  @Test
  void testCicsTestInvalidOne() {
    CICSTestUtils.errorTest(TEST_EVENT_INVALID_ONE,
            ImmutableMap.of(
            "error1",
            new Diagnostic(
                    new Range(new Position(12, 12), new Position(13, 25)),
                    "Missing required option: FIRESTATUS",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText())));
  }

  @Test
  void testCicsTestInvalidTwo() {
    CICSTestUtils.errorTest(TEST_EVENT_INVALID_TWO,
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(new Position(12, 12), new Position(13, 30)),
                            "Missing required option: EVENT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
