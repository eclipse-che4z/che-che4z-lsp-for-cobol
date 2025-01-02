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
 * Test CICS GET commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-get-container-bts">GET Command</a>
 *
 * <p>This class tests all variations of the GET command: CONTAINER BTS, CONTAINER CHANNEL, and COUNTER/DCOUNTER.
 */
public class TestCICSGet {
  private static final String CONTAINER_BTS_VALID_ONE =
      "GET CONTAINER({$varOne}) INTO({$varTwo}) FLENGTH({$varThree})";

  private static final String CONTAINER_BTS_VALID_TWO =
      "GET CONTAINER({$varOne}) ACTIVITY({$varOne}) NODATA FLENGTH({$varTwo})";

  private static final String CONTAINER_BTS_INVALID_ONE =
      "GET CONTAINER({$varOne}) ACTIVITY({$varOne}) INTO(100) {INTO|errorOne}(100) ";

  private static final String CONTAINER_BTS_INVALID_TWO =
      "GET CONTAINER(100)  {ACQACTIVITY|errorOne} {PROCESS|errorTwo} {ACQPROCESS|errorThree} SET({$varTwo})";

  private static final String CONTAINER_CHANNEL_VALID_ONE =
      "GET CONTAINER({$varOne}) CHANNEL({$varTwo}) INTO({$varThree}) FLENGTH({$varFour})";

  private static final String CONTAINER_CHANNEL_VALID_TWO =
      "GET CONTAINER({$varOne}) INTO({$varTwo}) INTOCCSID({$varThree})";

  private static final String CONTAINER_CHANNEL_INVALID_ONE =
      "GET CONTAINER(100) {CONTAINER|errorTwo}(100) INTO({$varFour})";

  private static final String CONTAINER_CHANNEL_INVALID_TWO =
      "GET CONTAINER(10) INTO({$varFour}) {INTOCCSID|errorOne}(100) {INTOCODEPAGE|errorTwo}(100)";

  private static final String COUNTER_VALID_ONE =
      "GET COUNTER({$varOne}) POOL({$varTwo}) VALUE({$varThree}) INCREMENT({$varFour}) WRAP";

  private static final String DCOUNTER_VALID_ONE =
      "GET DCOUNTER({$varOne}) VALUE({$varTwo}) COMPAREMIN({$varThree})";

  private static final String COUNTER_INVALID_ONE =
      "GET {COUNTER|errorOne}(100) {DCOUNTER|errorTwo}(100) VALUE({$varTwo})";

  private static final String COUNTER_INVALID_TWO =
      "GET COUNTER({$varFour}) VALUE(100) INCREMENT(100) {INCREMENT|errorOne}(100)";

  private static final String COUNTER_INVALID_THREE =
      "GET {_COUNTER({$varFour}) VALUE(100) REDUCE|errorOne_}";

  @Test
  void testContainerBTSValidOne() {
    CICSTestUtils.noErrorTest(CONTAINER_BTS_VALID_ONE);
  }

  @Test
  void testContainerBTSValidTwo() {
    CICSTestUtils.noErrorTest(CONTAINER_BTS_VALID_TWO);
  }

  @Test
  void testContainerBTSInvalidOne() {
    CICSTestUtils.errorTest(
        CONTAINER_BTS_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: INTO",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testContainerBTSInvalidTwo() {
    CICSTestUtils.errorTest(
        CONTAINER_BTS_INVALID_TWO,
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
                ErrorSource.PARSING.getText()),
            "errorThree",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ACTIVITY or ACQACTIVITY or PROCESS or ACQPROCESS",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testContainerChannelValidOne() {
    CICSTestUtils.noErrorTest(CONTAINER_CHANNEL_VALID_ONE);
  }

  @Test
  void testContainerChannelValidTwo() {
    CICSTestUtils.noErrorTest(CONTAINER_CHANNEL_VALID_TWO);
  }

  @Test
  void testContainerChannelInvalidOne() {
    CICSTestUtils.errorTest(
        CONTAINER_CHANNEL_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: INTO or SET or NODATA",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: CONTAINER",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testContainerChannelInvalidTwo() {
    CICSTestUtils.errorTest(
        CONTAINER_CHANNEL_INVALID_TWO,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: INTOCCSID or INTOCODEPAGE or CONVERTST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: INTOCCSID or INTOCODEPAGE or CONVERTST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testCounterValidOne() {
    CICSTestUtils.noErrorTest(COUNTER_VALID_ONE);
  }

  @Test
  void testDCounterValidOne() {
    CICSTestUtils.noErrorTest(DCOUNTER_VALID_ONE);
  }

  @Test
  void testCounterInvalidOne() {
    CICSTestUtils.errorTest(
        COUNTER_INVALID_ONE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: COUNTER or DCOUNTER",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: COUNTER or DCOUNTER",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testCounterInvalidTwo() {
    CICSTestUtils.errorTest(
        COUNTER_INVALID_TWO,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: INCREMENT",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testCounterInvalidThree() {
    CICSTestUtils.errorTest(
        COUNTER_INVALID_THREE,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: INCREMENT",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
