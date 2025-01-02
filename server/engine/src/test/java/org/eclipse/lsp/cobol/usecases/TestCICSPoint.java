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

/**
 * Test CICS POINT command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-point">POINT Command</a>
 *
 * <p>This class tests the POINT command.
 */
public class TestCICSPoint {
  private static final String POINT_VALID =
          "POINT";

  private static final String POINT_VALID_CONVID =
          "POINT CONVID({$varOne})";

  private static final String POINT_VALID_SESSION =
          "POINT SESSION({$varOne})";

  private static final String POINT_INVALID_DUPLICATE_SESSION =
          "POINT  SESSION({$varOne}) {SESSION|errorOne}({$varTwo})";

  private static final String POINT_INVALID_BOTH_OPTIONS =
          "POINT {CONVID|errorOne}({$varOne}) {SESSION|errorTwo}({$varTwo})";

  @Test
  void testPointValid() {
    CICSTestUtils.noErrorTest(POINT_VALID);
  }

  @Test
  void testPointValidConvid() {
    CICSTestUtils.noErrorTest(POINT_VALID_CONVID);
  }

  @Test
  void testPointValidSession() {
    CICSTestUtils.noErrorTest(POINT_VALID_SESSION);
  }

  @Test
  void testPointInvalidDuplicateSession() {
    CICSTestUtils.errorTest(
            POINT_INVALID_DUPLICATE_SESSION,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: SESSION",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testPointInvalidBothOptions() {
    CICSTestUtils.errorTest(
            POINT_INVALID_BOTH_OPTIONS,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: CONVID or SESSION",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: CONVID or SESSION",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
