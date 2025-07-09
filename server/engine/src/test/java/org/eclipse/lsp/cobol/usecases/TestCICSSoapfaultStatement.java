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
import java.util.*;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

/**
 * Test CICS WEB command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">WEB
 * Command</a>
 *
 * <p>This class tests all variations of the WEB command found in the link above.
 */
public class TestCICSSoapfaultStatement {
  // Test Strings
  private static final String SOAPFAULT_DELETE_VALID = "SOAPFAULT DELETE";

  private static final String SOAPFAULT_ADD_1 =
      "SOAPFAULT ADD FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne}) NATLANG({$varOne})"
          + " FROMCCSID({$varOne})";
  private static final String SOAPFAULT_ADD_2 = "SOAPFAULT ADD FAULTSTRING({$varOne})";

  private static final String SOAPFAULT_CREATE_1 =
      "SOAPFAULT CREATE FAULTCODE({$varOne}) FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne})"
          + " NATLANG({$varOne}) ROLE({$varOne}) ROLELENGTH({$varOne}) FAULTACTOR({$varOne})"
          + " FAULTACTLEN({$varOne}) DETAIL({$varOne}) DETAILLENGTH({$varOne})"
          + " FROMCCSID({$varOne})";
  private static final String SOAPFAULT_CREATE_2 = "SOAPFAULT CREATE CLIENT FAULTSTRING({$varOne})";

  // Invalid Tests
  private static final String SOAPFAULT_DELETE_INVALID = "SOAPFAULT DELETE {CLIENT|errorOne}";
  private static final String SOAPFAULT_DELETE_INVALID_2 =
      "SOAPFAULT DELETE {DELETE|errorOne} NOHANDLE";
  private static final String SOAPFAULT_ADD_INVALID =
      "SOAPFAULT ADD {FAULTSTRING|errorOne}({$varOne}) {SUBCODESTR|errorTwo}({$varOne})";
  private static final String SOAPFAULT_CREATE_INVALID =
      "SOAPFAULT CREATE {CLIENT|errorOne} {FAULTCODESTR|errorTwo}({$varOne})"
          + " FAULTSTRING({$varOne})";
  private static final String SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID =
      "SOAPFAULT {_CREATE CLIENT FAULTSTRING({$varOne})|error_}";
  private static final String SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_2 =
      "SOAPFAULT {_CREATE  FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne})"
          + " FAULTCODESTR({$varFour})|error_}";
  private static final String SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_3 =
      "SOAPFAULT {_CREATE CLIENT FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne})"
          + " FAULTACTOR({$varFour})|error_}";
  private static final String SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_4 =
      "SOAPFAULT {_CREATE CLIENT  FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne})"
          + " DETAIL({$varFour})|error_}";
  private static final String SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_5 =
      "SOAPFAULT {_CREATE CLIENT FAULTSTRING({$varOne}) FAULTSTRLEN({$varOne})"
          + " ROLE({$varFour})|error_}";
  private static final String SOAPFAULT_ADD_NOLENGTH_INVALID =
      "SOAPFAULT {_ADD FAULTSTRING({$varOne})|error_}";

  // Valid Test Cases
  @Test
  void testDelete() {
    CICSTestUtils.noErrorTest(SOAPFAULT_DELETE_VALID);
  }

  @Test
  void testAdd() {
    CICSTestUtils.noErrorTest(SOAPFAULT_ADD_1);
    CICSTestUtils.noErrorTest(SOAPFAULT_ADD_2);
  }

  @Test
  void testCreate() {
    CICSTestUtils.noErrorTest(SOAPFAULT_CREATE_1);
    CICSTestUtils.noErrorTest(SOAPFAULT_CREATE_2);
  }

  // Invalid Tests
  @Test
  void testDeleteInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Extraneous input CLIENT",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(SOAPFAULT_DELETE_INVALID, expectedDiagnostics);
  }

  @Test
  void testDeleteInvalid2() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Excessive options provided for: DELETE",
            DiagnosticSeverity.Warning,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(SOAPFAULT_DELETE_INVALID_2, expectedDiagnostics);
  }

  @Test
  void testAddInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Exactly one option required, options are mutually exclusive: FAULTSTRING or"
                + " SUBCODESTR",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    expectedDiagnostics.put(
        "errorTwo",
        new Diagnostic(
            new Range(),
            "Exactly one option required, options are mutually exclusive: FAULTSTRING or"
                + " SUBCODESTR",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(SOAPFAULT_ADD_INVALID, expectedDiagnostics);
  }

  @Test
  void testCreateInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Exactly one option required, options are mutually exclusive: FAULTCODE, FAULTCODESTR,"
                + " CLIENT, SERVER, SENDER or RECEIVER",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    expectedDiagnostics.put(
        "errorTwo",
        new Diagnostic(
            new Range(),
            "Exactly one option required, options are mutually exclusive: FAULTCODE, FAULTCODESTR,"
                + " CLIENT, SERVER, SENDER or RECEIVER",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(SOAPFAULT_CREATE_INVALID, expectedDiagnostics);
  }

  @Test
  void testSoapFaultCreateNoLengthInvalid() {
    CICSTestUtils.errorTest(
        SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: FAULTSTRLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }

  @Test
  void testSoapFaultCreateNoLengthInvalid2() {
    CICSTestUtils.errorTest(
        SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_2,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: FAULTCODELEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }

  @Test
  void testSoapFaultCreateNoLengthInvalid3() {
    CICSTestUtils.errorTest(
        SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_3,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: FAULTACTLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }

  @Test
  void testSoapFaultCreateNoLengthInvalid4() {
    CICSTestUtils.errorTest(
        SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_4,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: DETAILLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }

  @Test
  void testSoapFaultCreateNoLengthInvalid5() {
    CICSTestUtils.errorTest(
        SOAPFAULT_CREATE_TRANS_NOLENGTH_INVALID_5,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: ROLELENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }

  @Test
  void testSoapFaultAddNoLengthInvalid() {
    CICSTestUtils.errorTest(
        SOAPFAULT_ADD_NOLENGTH_INVALID,
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: FAULTSTRLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())),
        "NOLENGTH");
  }
}
