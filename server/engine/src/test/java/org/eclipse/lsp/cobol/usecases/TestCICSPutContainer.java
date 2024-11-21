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
 * Test CICS PUT CONTAINER commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-put-container-bts">PUT CONTAINER Command</a>
 *
 * <p>This class tests all variations of the PUT CONTAINER command: BTS and CHANNEL.
 */
public class TestCICSPutContainer {
  private static final String PUT_CONTAINER_BTS_VALID_ONE =
          "PUT CONTAINER({$varOne}) ACTIVITY({$varTwo}) FROM({$varThree}) FLENGTH({$varFour})";

  private static final String PUT_CONTAINER_BTS_VALID_TWO =
          "PUT CONTAINER({$varOne}) ACQPROCESS FROM({$varTwo})";

  private static final String PUT_CONTAINER_BTS_INVALID_ONE =
          "PUT {_ACTIVITY({$varTwo}) FROM({$varThree}) FLENGTH(123)|errorOne_}";

  private static final String PUT_CONTAINER_BTS_INVALID_TWO =
          "PUT CONTAINER({$varOne}) {ACTIVITY|errorOne}({$varTwo}) {ACQACTIVITY|errorTwo} FROM({$varThree})";

  private static final String PUT_CONTAINER_CHANNEL_VALID_ONE =
          "PUT CONTAINER({$varOne}) CHANNEL({$varTwo}) FROM({$varThree}) FLENGTH({$varFour}) BIT";

  private static final String PUT_CONTAINER_CHANNEL_VALID_TWO =
          "PUT CONTAINER({$varOne}) CHANNEL({$varTwo}) FROM({$varThree}) DATATYPE({$varThree}) FROMCCSID({$varFour}) APPEND";

  private static final String PUT_CONTAINER_CHANNEL_INVALID_ONE =
          "PUT {_CONTAINER({$varOne}) CHANNEL({$varTwo}) FLENGTH(123)|errorOne_}";

  private static final String PUT_CONTAINER_CHANNEL_INVALID_TWO =
          "PUT CONTAINER({$varOne}) CHANNEL({$varTwo}) FROM({$varThree}) {BIT|errorOne} {CHAR|errorTwo}";

  private static final String PUT_CONTAINER_CHANNEL_INVALID_THREE =
          "PUT CONTAINER({$varOne}) CHANNEL({$varTwo}) FROM({$varThree}) {APPEND|errorOne} {PREPEND|errorTwo}";

  @Test
  void testPutContainerBtsValidOne() {
    CICSTestUtils.noErrorTest(PUT_CONTAINER_BTS_VALID_ONE);
  }

  @Test
  void testPutContainerBtsValidTwo() {
    CICSTestUtils.noErrorTest(PUT_CONTAINER_BTS_VALID_TWO);
  }

  @Test
  void testPutContainerBtsInvalidOne() {
    CICSTestUtils.errorTest(
            PUT_CONTAINER_BTS_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: CONTAINER",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testPutContainerBtsInvalidTwo() {
    CICSTestUtils.errorTest(
            PUT_CONTAINER_BTS_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY or PROCESS or ACQPROCESS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY or PROCESS or ACQPROCESS",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testPutContainerChannelValidOne() {
    CICSTestUtils.noErrorTest(PUT_CONTAINER_CHANNEL_VALID_ONE);
  }

  @Test
  void testPutContainerChannelValidTwo() {
    CICSTestUtils.noErrorTest(PUT_CONTAINER_CHANNEL_VALID_TWO);
  }

  @Test
  void testPutContainerChannelInvalidOne() {
    CICSTestUtils.errorTest(
            PUT_CONTAINER_CHANNEL_INVALID_ONE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: FROM",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testPutContainerChannelInvalidTwo() {
    CICSTestUtils.errorTest(
            PUT_CONTAINER_CHANNEL_INVALID_TWO,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: BIT or DATATYPE or CHAR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: BIT or DATATYPE or CHAR",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }

  @Test
  void testPutContainerChannelInvalidThree() {
    CICSTestUtils.errorTest(
            PUT_CONTAINER_CHANNEL_INVALID_THREE,
            ImmutableMap.of(
                    "errorOne",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: APPEND or PREPEND",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "errorTwo",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: APPEND or PREPEND",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText())));
  }
}
