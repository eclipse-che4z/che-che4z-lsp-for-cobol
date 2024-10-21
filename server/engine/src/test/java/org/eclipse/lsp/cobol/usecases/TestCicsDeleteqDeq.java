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

import java.util.*;

/**
 * Test CICS DELETEQ and DEQ command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-deleteq-td">DELETEQ
 * Command</a>
 *  <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-deq">DEQ
  Command</a>
 *
 * <p>This class tests all variations of the DELETEQ and DEQ commands found in the links above.
 */
public class TestCicsDeleteqDeq {
  private static final String DELETEQ_TD_VALID = "DELETEQ TD QUEUE({$varFour})";

  private static final String DELETEQ_TD_SYSID_VALID = "DELETEQ TD QUEUE({$varFour}) SYSID({$varFive})";

  private static final String DELETEQ_QUEUE_VALID = "DELETEQ QUEUE({$varFour})";

  private static final String DELETEQ_QNAME_VALID = "DELETEQ QNAME({$varFour})";

  private static final String DELETEQ_TS_QUEUE_VALID = "DELETEQ TS QUEUE({$varFour})";
  private static final String DELETEQ_TS_QUEUE_INVALID = "DELETEQ TS {TS|error1} QUEUE({$varFour})";

  private static final String DELETEQ_TS_QNAME_VALID = "DELETEQ TS QNAME({$varFour})";

  private static final String DELETEQ_QUEUE_SYSID_VALID = "DELETEQ QUEUE({$varFour}) SYSID({$varFive})";

  private static final String DELETEQ_QNAME_SYSID_VALID = "DELETEQ QNAME({$varFour}) SYSID({$varFive})";
  private static final String DELETEQ_QNAME_SYSID_INVALID = "DELETEQ QNAME({$varFour}) {QNAME|error1}({$varFour}) SYSID({$varFive})";
  private static final String DELETEQ_QUEUE_QNAME_INVALID = "DELETEQ {QUEUE|error1}({$varFour}) {QNAME|error2}({$varFour}) SYSID({$varFive})";

  private static final String DELETEQ_TS_QUEUE_SYSID_VALID = "DELETEQ TS QUEUE({$varFour}) SYSID({$varFive})";

  private static final String DELETEQ_TS_QNAME_SYSID_VALID = "DELETEQ TS QNAME({$varFour}) SYSID({$varFive})";

  private static final String DEQ_RESOURCE_VALID = "DEQ RESOURCE({$varFour})";

  private static final String DEQ_RESOURCE_LENGTH_VALID = "DEQ RESOURCE({$varFour}) LENGTH({$varTwo})";

  private static final String DEQ_RESOURCE_UOW_VALID = "DEQ RESOURCE({$varFour}) UOW";

  private static final String DEQ_RESOURCE_TASK_VALID = "DEQ RESOURCE({$varFour}) TASK";

  private static final String DEQ_RESOURCE_MAXLIFETIME_VALID = "DEQ RESOURCE({$varFour}) MAXLIFETIME({$varTwo})";

  private static final String DEQ_RESOURCE_LENGTH_UOW_VALID = "DEQ RESOURCE({$varFour}) LENGTH({$varTwo}) UOW";

  private static final String DEQ_RESOURCE_LENGTH_TASK_VALID = "DEQ RESOURCE({$varFour}) LENGTH({$varTwo}) TASK";

  private static final String DEQ_RESOURCE_LENGTH_MAXLIFETIME_VALID = "DEQ RESOURCE({$varFour}) LENGTH({$varTwo}) MAXLIFETIME({$varTwo})";
  private static final String DEQ_RESOURCE_LENGTH_UOW_TASK_INVALID = "DEQ RESOURCE({$varFour}) LENGTH({$varTwo}) {UOW|error1} {TASK|error2}";

  private static final String DEQ_LENGTH_INVALID = "DEQ {LENGTH(123)|error1}";

  // DELETEQ
  @Test
  void testDeleteqTdValid() {
    CICSTestUtils.noErrorTest(DELETEQ_TD_VALID);
  }

  @Test
  void testDeleteqTdSysidValid() {
    CICSTestUtils.noErrorTest(DELETEQ_TD_SYSID_VALID);
  }

  @Test
  void testDeleteqQueueValid() {
    CICSTestUtils.noErrorTest(DELETEQ_QUEUE_VALID);
  }

  @Test
  void testDeleteqQnameValid() {
    CICSTestUtils.noErrorTest(DELETEQ_QNAME_VALID);
  }

  @Test
  void testDeleteqTsQueueValid() {
    CICSTestUtils.noErrorTest(DELETEQ_TS_QUEUE_VALID);
  }

  @Test
  void testDeleteqTsQueueInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: TS",
                            DiagnosticSeverity.Warning,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELETEQ_TS_QUEUE_INVALID, expectedDiagnostic);
  }

  @Test
  void testDeleteqTsQnameValid() {
    CICSTestUtils.noErrorTest(DELETEQ_TS_QNAME_VALID);
  }

  @Test
  void testDeleteqQueueSysidValid() {
    CICSTestUtils.noErrorTest(DELETEQ_QUEUE_SYSID_VALID);
  }

  @Test
  void testDeleteqQnameSysidValid() {
    CICSTestUtils.noErrorTest(DELETEQ_QNAME_SYSID_VALID);
  }

  @Test
  void testDeleteqTsQueueSysidValid() {
    CICSTestUtils.noErrorTest(DELETEQ_TS_QUEUE_SYSID_VALID);
  }
  @Test
  void testDeleteqTsQnameSysidValid() {
    CICSTestUtils.noErrorTest(DELETEQ_TS_QNAME_SYSID_VALID);
  }

  // DEQ
  @Test
  void testDeqResourceValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_VALID);
  }

  @Test
  void testDeqResourceLengthValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_LENGTH_VALID);
  }

  @Test
  void testDeqResourceUowValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_UOW_VALID);
  }

  @Test
  void testDeqResourceTaskValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_TASK_VALID);
  }

  @Test
  void testDeqResourceMaxlifetimeValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_MAXLIFETIME_VALID);
  }

  @Test
  void testDeqResourceLengthUowValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_LENGTH_UOW_VALID);
  }

  @Test
  void testDeqResourceLengthTaskValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_LENGTH_TASK_VALID);
  }

  @Test
  void testDeqResourceLengthMaxlifetimeValid() {
    CICSTestUtils.noErrorTest(DEQ_RESOURCE_LENGTH_MAXLIFETIME_VALID);
  }

  @Test
  void testDeqResourceLengthUowTaskInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: UOW or MAXLIFETIME or TASK",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: UOW or MAXLIFETIME or TASK",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEQ_RESOURCE_LENGTH_UOW_TASK_INVALID, expectedDiagnostic);
  }

  @Test
  void testDeqQueueQnameInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: QUEUE or QNAME",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()),
                    "error2",
                    new Diagnostic(
                            new Range(),
                            "Exactly one option required, options are mutually exclusive: QUEUE or QNAME",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELETEQ_QUEUE_QNAME_INVALID, expectedDiagnostic);
  }

  @Test
  void testDeqLengthInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Missing required option: RESOURCE",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DEQ_LENGTH_INVALID, expectedDiagnostic);
  }

  @Test
  void testDeqQnameInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
            ImmutableMap.of(
                    "error1",
                    new Diagnostic(
                            new Range(),
                            "Excessive options provided for: QNAME",
                            DiagnosticSeverity.Error,
                            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELETEQ_QNAME_SYSID_INVALID, expectedDiagnostic);
  }
}
