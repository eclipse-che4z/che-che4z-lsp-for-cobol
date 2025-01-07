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
 * Test CICS POST command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-post">POST Command</a>
 *
 * <p>This class tests the POST command.
 */
public class TestCICSPost {
  private static final String POST_VALID_INTERVAL =
          "POST INTERVAL(0) SET({$varOne}) REQID({$varTwo})";

  private static final String POST_VALID_TIME =
          "POST TIME(120000) SET({$varOne})";

  private static final String POST_VALID_AFTER =
          "POST AFTER HOURS({$varOne}) MINUTES({$varTwo}) SECONDS({$varThree}) SET({$varOne})";

  private static final String POST_VALID_AT =
          "POST AT HOURS({$varOne}) MINUTES({$varTwo}) SECONDS({$varThree}) SET({$varOne})";

  private static final String POST_INVALID_NO_OPTION =
          "POST {_AT SET(123)|errorOne_}";

  private static final String POST_INVALID_MULTIPLE_OPTIONS =
          "POST {INTERVAL|errorOne}(0) {TIME|errorTwo}(120000) SET({$varOne})";

  private static final String POST_INVALID_AFTER_NO_TIME =
          "POST {_AFTER SET(123)|errorOne_}";

  @Test
  void testPostValidInterval() {
    CICSTestUtils.noErrorTest(POST_VALID_INTERVAL);
  }

  @Test
  void testPostValidTime() {
    CICSTestUtils.noErrorTest(POST_VALID_TIME);
  }

  @Test
  void testPostValidAfter() {
    CICSTestUtils.noErrorTest(POST_VALID_AFTER);
  }

  @Test
  void testPostValidAt() {
    CICSTestUtils.noErrorTest(POST_VALID_AT);
  }

  @Test
  void testPostInvalidNoOption() {
    CICSTestUtils.errorTest(
            POST_INVALID_NO_OPTION,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: HOURS or MINUTES or SECONDS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testPostInvalidMultipleOptions() {
    CICSTestUtils.errorTest(
            POST_INVALID_MULTIPLE_OPTIONS,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTERVAL or TIME or AFTER or AT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: INTERVAL or TIME or AFTER or AT",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testPostInvalidAfterNoTime() {
    CICSTestUtils.errorTest(
            POST_INVALID_AFTER_NO_TIME,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: HOURS or MINUTES or SECONDS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
