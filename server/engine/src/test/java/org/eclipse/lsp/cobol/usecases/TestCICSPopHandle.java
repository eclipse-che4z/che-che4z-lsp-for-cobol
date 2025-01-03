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
 * Test CICS POP HANDLE command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-pop-handle">POP HANDLE Command</a>
 *
 * <p>This class tests the POP HANDLE command.
 */
public class TestCICSPopHandle {
  private static final String POP_VALID =
          "POP";

  private static final String POP_HANDLE_VALID =
          "POP HANDLE";

  private static final String POP_HANDLE_INVALID =
          "POP HANDLE {HANDLE|errorOne}";

  @Test
  void testPopValid() {
    CICSTestUtils.noErrorTest(POP_VALID);
  }

  @Test
  void testPopHandleValid() {
    CICSTestUtils.noErrorTest(POP_HANDLE_VALID);
  }

  @Test
  void testPopHandleInvalid() {
    CICSTestUtils.errorTest(
            POP_HANDLE_INVALID,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: HANDLE",
                            DiagnosticSeverity.Warning,
                            ErrorSource.PARSING.getText())));
  }
}
