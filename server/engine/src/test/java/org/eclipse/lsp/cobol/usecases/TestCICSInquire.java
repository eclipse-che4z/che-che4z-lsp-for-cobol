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
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.Map;
import java.util.stream.Stream;

/**
 * Test CICS INQUIRE commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-inquire-activityid">INQUIRE SP
 * Command</a>
 *
 * <p>This class tests all variations of the ISSUE command found in the link above.
 */
public class TestCICSInquire {
  private static Stream<String> getValidOptions() {
    return Stream.of(
        "ACTIVITYID(0) COMPSTATUS(1) MODE(2) SUSPSTATUS(3) ABCODE(4) ABPROGRAM(5) ACTIVITY(6) EVENT(7) PROCESS(8) PROCESSTYPE(9) PROGRAM(10) TRANSID(11) USERID(12)",
        "CONTAINER(0) PROCESS(2) PROCESSTYPE(3) DATALENTH(4) SET(5)",
        "EVENT(0) ACTIVITYID(1) EVENTTYPE(2) FIRESTATUS(3) PREDICATE(4) COMPOSITE(5) TIMER(6)",
        "PROCESS(0) PROCESSTYPE(1) ACTIVITYID(2)",
        "TIMER(0) ACTIVITYID(1) EVENT(2) ABSTIME(3)");
  }

  private static final String CONTAINER_INVALID =
      "CONTAINER(1) {PROCESS|errorOne}(1) {ACTIVITYID|errorTwo}(2)";

  private static final String PROCESS_INVALID = "{_PROCESS(2) ACTIVITYID(2)|errorOne_}";

  @ParameterizedTest
  @MethodSource("getValidOptions")
  void testOption(String cicsOption) {
    CICSTestUtils.noErrorTest("INQUIRE " + cicsOption);
  }

  @Test
  void testContainerInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ACTIVITYID and PROCESS",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ACTIVITYID and PROCESS",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest("INQUIRE " + CONTAINER_INVALID, expectedDiagnostics);
  }

  @Test
  void testProcessInvalid() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: PROCESSTYPE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest("INQUIRE " + PROCESS_INVALID, expectedDiagnostics);
  }
}
