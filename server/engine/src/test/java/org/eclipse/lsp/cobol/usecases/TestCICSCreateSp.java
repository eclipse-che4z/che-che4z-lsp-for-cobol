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
import java.util.Map;
import java.util.stream.Stream;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

/**
 * Test CICS Create System Command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-create-atomservice">Create System
 * Commands</a>
 *
 * <p>This class tests all variations of the Create System Commands found in the link above.
 */
public class TestCICSCreateSp {

  private static Stream<String> getValidOptions() {
    return Stream.of(
        "CREATE ATOMSERVICE({$varFour}) NOLOG ATTRLEN({$varFour}) ATTRIBUTES({$varFour})",
        "CREATE BUNDLE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE CONNECTION({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE DB2CONN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE DB2ENTRY({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE DB2TRAN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE DOCTEMPLATE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE DUMPCODE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE ENQMODEL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE FILE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE IPCONN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE JOURNALMODEL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE JVMSERVER({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE LIBRARY({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE LSRPOOL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE MAPSET({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE MQCONN({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE MQMONITOR({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE PARTITIONSET({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE PARTNER({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE PIPELINE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE PROCESSTYPE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE PROFILE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE PROGRAM({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE TCPIPSERVICE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE TDQUEUE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE TRANCLASS({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE TRANSACTION({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE TSMODEL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE TYPETERM({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE URIMAP({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE WEBSERVICE({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE SESSIONS({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE TERMINAL({$varFour}) NOLOG ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE CONNECTION({$varFour}) ATTRLEN({$varOne}) ATTRIBUTES({$varFour}) NOLOG",
        "CREATE CONNECTION COMPLETE NOHANDLE",
        "CREATE NOHANDLE TERMINAL DISCARD");
  }

  private static Stream<String> getInValidSubOperandOptions() {
    return Stream.of(
        "CREATE {TERMINAL|error} ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE {CONNECTION|error} ATTRLEN({$varOne}) ATTRIBUTES({$varFour})",
        "CREATE ATTRIBUTES({$varFour}) {TERMINAL|error}");
  }

  private static final String CREATE_INVALID =
      "CREATE {CONNECTION|errorSubOperand}({$varFour})"
          + "{ATTRIBUTES|errorInvalidDiscard}(1)"
          + "{DISCARD|errorInvalidDiscard2}";
  private static final String CREATE_BUNDLE_MISSING_ATTRIBUTES_INVALID =
      "CREATE {_BUNDLE({$varFour}) NOLOG |error_}";
  private static final String CREATE_CONNECTION_MUTUALEX_INVALID =
      "CREATE CONNECTION {COMPLETE|error} {DISCARD|error2}";
  private static final String CREATE_DB2CONN_MUTUALEX_INVALID =
      "CREATE DB2CONN({$varFour}) ATTRIBUTES({$varFour}) {LOG|error} {NOLOG|error2}";
  private static final String CREATE_DB2ENTRY_DISCARD_INVALID =
      "CREATE DB2ENTRY({$varFour}) ATTRIBUTES({$varFour}) {DISCARD|error}";
  private static final String CREATE_DB2ENTRY_FILE_INVALID =
      "CREATE NOHANDLE {DB2ENTRY|error}({$varFour}) ATTRIBUTES({$varFour})"
          + " {FILE|error2}({$varFour})";
  private static final String CREATE_DB2ENTRY_FILE_CASE_SENSITIVE_INVALID =
      "CREATE NOHANDLE {DB2ENTRY|error}({$varFour}) ATTRIBUTES({$varFour})"
          + " {FILE|error2}({$varFour}){FiLe|error3|error4}({$varFour})";
  private static final String CREATE_TERMINAL_SUBOPERAND_INVALID =
      "CREATE {TERMINAL|error}({$varFour}) DISCARD";

  @ParameterizedTest
  @MethodSource("getValidOptions")
  void testCreateSpAllValid(String valid) {
    CICSTestUtils.noErrorTest(valid, "SP");
  }

  @ParameterizedTest
  @MethodSource("getInValidSubOperandOptions")
  void testCreateSubOperandSpInValid(String invalid) {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Operand value required",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(invalid, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "errorSubOperand",
            new Diagnostic(
                new Range(),
                "Operand value not allowed",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorInvalidDiscard",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or"
                    + " COMPLETE or DISCARD",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorInvalidDiscard2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or"
                    + " COMPLETE or DISCARD",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CREATE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateBundleSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: ATTRIBUTES",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CREATE_BUNDLE_MISSING_ATTRIBUTES_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateConnectionSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or"
                    + " COMPLETE or DISCARD",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or"
                    + " COMPLETE or DISCARD",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(CREATE_CONNECTION_MUTUALEX_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateDb2ConnSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "errorOperand",
            new Diagnostic(
                new Range(),
                "Invalid option or parameter provided: Sub Operand",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LOG or NOLOG or"
                    + " LOGMESSAGE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LOG or NOLOG or"
                    + " LOGMESSAGE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(CREATE_DB2CONN_MUTUALEX_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateDb2EntrySpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Invalid option provided: DISCARD",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(CREATE_DB2ENTRY_DISCARD_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateMutualExSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATOMSERVICE or BUNDLE"
                    + " or DB2CONN or DB2ENTRY or DB2TRAN or DOCTEMPLATE or DUMPCODE or ENQMODEL or"
                    + " FILEPIPELINE or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL"
                    + " or MAPSET or MQCONN or MQMONITOR or PARTITIONSET or PARTNERPROCESSTYPE or"
                    + " PROFILE or PROGRAM or TCPIPSERVICE or TDQUEUE or TRANCLASS or TRANSACTION"
                    + " or TSMODEL or TYPETERM or URIMAP or WEBSERVICESESSIONS or TERMINAL or"
                    + " CONNECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATOMSERVICE or BUNDLE"
                    + " or DB2CONN or DB2ENTRY or DB2TRAN or DOCTEMPLATE or DUMPCODE or ENQMODEL or"
                    + " FILEPIPELINE or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL"
                    + " or MAPSET or MQCONN or MQMONITOR or PARTITIONSET or PARTNERPROCESSTYPE or"
                    + " PROFILE or PROGRAM or TCPIPSERVICE or TDQUEUE or TRANCLASS or TRANSACTION"
                    + " or TSMODEL or TYPETERM or URIMAP or WEBSERVICESESSIONS or TERMINAL or"
                    + " CONNECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(CREATE_DB2ENTRY_FILE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateMutualExCaseSensitiveSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATOMSERVICE or BUNDLE"
                    + " or DB2CONN or DB2ENTRY or DB2TRAN or DOCTEMPLATE or DUMPCODE or ENQMODEL or"
                    + " FILEPIPELINE or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL"
                    + " or MAPSET or MQCONN or MQMONITOR or PARTITIONSET or PARTNERPROCESSTYPE or"
                    + " PROFILE or PROGRAM or TCPIPSERVICE or TDQUEUE or TRANCLASS or TRANSACTION"
                    + " or TSMODEL or TYPETERM or URIMAP or WEBSERVICESESSIONS or TERMINAL or"
                    + " CONNECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATOMSERVICE or BUNDLE"
                    + " or DB2CONN or DB2ENTRY or DB2TRAN or DOCTEMPLATE or DUMPCODE or ENQMODEL or"
                    + " FILEPIPELINE or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL"
                    + " or MAPSET or MQCONN or MQMONITOR or PARTITIONSET or PARTNERPROCESSTYPE or"
                    + " PROFILE or PROGRAM or TCPIPSERVICE or TDQUEUE or TRANCLASS or TRANSACTION"
                    + " or TSMODEL or TYPETERM or URIMAP or WEBSERVICESESSIONS or TERMINAL or"
                    + " CONNECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "Excessive options provided for: FiLe",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error4",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATOMSERVICE or BUNDLE"
                    + " or DB2CONN or DB2ENTRY or DB2TRAN or DOCTEMPLATE or DUMPCODE or ENQMODEL or"
                    + " FILEPIPELINE or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL"
                    + " or MAPSET or MQCONN or MQMONITOR or PARTITIONSET or PARTNERPROCESSTYPE or"
                    + " PROFILE or PROGRAM or TCPIPSERVICE or TDQUEUE or TRANCLASS or TRANSACTION"
                    + " or TSMODEL or TYPETERM or URIMAP or WEBSERVICESESSIONS or TERMINAL or"
                    + " CONNECTION",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(CREATE_DB2ENTRY_FILE_CASE_SENSITIVE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCreateTerminalSubOperandSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Operand value not allowed",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(CREATE_TERMINAL_SUBOPERAND_INVALID, expectedDiagnostic, "SP");
  }
}
