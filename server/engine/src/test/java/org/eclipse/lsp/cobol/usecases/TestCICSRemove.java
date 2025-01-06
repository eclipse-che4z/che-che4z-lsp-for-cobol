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
 * Test CICS REMOVE SUBEVENT command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-remove-subevent">REMOVE SUBEVENT Command</a>
 *
 * <p>This class tests the REMOVE SUBEVENT command.
 */
public class TestCICSRemove {
  private static final String REMOVE_SUBEVENT_VALID =
          "REMOVE SUBEVENT({$varOne}) EVENT({$varTwo})";

  private static final String REMOVE_SUBEVENT_INVALID_NO_SUBEVENT =
          "REMOVE {_EVENT({$varOne})|errorOne_}";

  private static final String REMOVE_SUBEVENT_INVALID_NO_EVENT =
          "REMOVE {_SUBEVENT({$varOne})|errorOne_}";

  private static final String REMOVE_SUBEVENT_INVALID_DUPLICATE_EVENT =
          "REMOVE SUBEVENT({$varOne}) EVENT({$varTwo}) {EVENT|errorOne}({$varTwo})";

  @Test
  void testRemoveSubeventValid() {
    CICSTestUtils.noErrorTest(REMOVE_SUBEVENT_VALID);
  }

  @Test
  void testRemoveSubeventInvalidNoSubevent() {
    CICSTestUtils.errorTest(
            REMOVE_SUBEVENT_INVALID_NO_SUBEVENT,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: SUBEVENT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testRemoveSubeventInvalidNoEvent() {
    CICSTestUtils.errorTest(
            REMOVE_SUBEVENT_INVALID_NO_EVENT,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: EVENT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testRemoveSubeventInvalidExtraOption() {
    CICSTestUtils.errorTest(
            REMOVE_SUBEVENT_INVALID_DUPLICATE_EVENT,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: EVENT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
