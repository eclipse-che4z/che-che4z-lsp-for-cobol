/*
 * Copyright (c) 2025 Broadcom.
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
 * Test CICS CSD System Commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=commands-csd-add">CSD System Commands</a>
 *
 * <p>This class tests all variations of the Perform System Commands found in the link above.
 */
public class TestCICSCsdSP {

  private static Stream<String> getValidOptions() {
    return Stream.of(
        "CSD ADD GROUP({$varFour}) LIST({$varFour}) BEFORE({$varFour})",
        "CSD ADD GROUP({$varFour}) LIST({$varFour}) AFTER({$varFour})",
        "CSD DJAR ALTER RESID({$varFour}) GROUP({$varFour}) ATTRIBUTES({$varFour})"
            + " ATTRLEN({$varFour}) COMPAT",
        "CSD PROGRAM ALTER RESID({$varFour}) GROUP({$varFour}) NOCOMPAT ATTRIBUTES({$varFour})",
        "CSD TDQUEUE ALTER RESID({$varFour}) ATTRIBUTES({$varFour}) GROUP({$varFour})"
            + " COMPATMODE({$varOne})",
        "CSD APPEND LIST({$varFour}) TO({$varFour}) NOHANDLE",
        "CSD NOHANDLE TO({$varFour}) COPY GROUP({$varFour}) DUPERROR ",
        "CSD NOHANDLE ATOMSERVICE AS({$varFour}) RESID({$varFour}) GROUP({$varFour}) COPY"
            + " DUPNOREPLACE ",
        "CSD DEFINE BUNDLE RESID({$varFour}) GROUP({$varFour}) ATTRIBUTES({$varFour})",
        "CSD DELETE GROUP({$varFour}) REMOVE",
        "CSD RESTYPE({$varFour}) DELETE RESID({$varFour}) GROUP({$varFour}) LISTACTION({$varOne})",
        "CSD DISCONNECT",
        "CSD ENDBRGROUP LIST",
        "CSD ENDBRLIST",
        "CSD ENDBRRSRCE",
        "CSD GETNEXTGROUP GROUP({$varFour}) LIST({$varFour})",
        "CSD GETNEXTLIST LIST({$varFour})",
        "CSD GETNEXTRSRCE RESTYPE({$varOne}) RESID({$varFour}) GROUP({$varFour})"
            + " ATTRIBUTES({$varFour}) ATTRLEN({$varFour})",
        "CSD INQUIREGROUP GROUP({$varFour}) LIST({$varFour})",
        "CSD INQUIRELIST LIST({$varFour})",
        "CSD INQUIRERSRCE DUMPCODE RESID({$varFour}) GROUP({$varFour}) ATTRIBUTES({$varFour})",
        "CSD INSTALL MAPSET RESID({$varFour}) GROUP({$varFour})",
        "CSD LOCK LIST({$varFour})",
        "CSD GROUP({$varFour}) LOCK",
        "CSD LIST({$varFour}) GROUP({$varFour}) REMOVE",
        "CSD RENAME RESID({$varFour}) LIBRARY GROUP({$varFour}) AS({$varFour})",
        "CSD RENAME MQCONN GROUP({$varFour}) RESID({$varFour}) AS({$varFour})",
        "CSD STARTBRGROUP LIST({$varFour})",
        "CSD STARTBRLIST",
        "CSD STARTBRRSRCE GROUP({$varFour})",
        "CSD UNLOCK LIST({$varFour})",
        "CSD UNLOCK GROUP({$varFour})",
        "CSD COMPAT USERDEFINE RESID({$varFour}) GROUP({$varFour}) ATTRIBUTES({$varFour}) NOHANDLE"
            + " PIPELINE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) ATOMSERVICE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) BUNDLE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) CONNECTION",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) CORBASERVER",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) DB2CONN",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) DB2ENTRY",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) DB2TRAN",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) DJAR",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) DOCTEMPLATE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) DUMPCODE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) ENQMODEL",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) FILE",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) IPCONN",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) JOURNALMODEL",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) JVMSERVER",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) LIBRARY",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) LSRPOOL",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) MAPSET",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) MQCONN",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) MQMONITOR",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) PARTITIONSET",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) PARTNER",
        "CSD RENAME RESID({$varFour})GROUP({$varFour}) AS({$varFour}) PIPELINE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) PROCESSTYPE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) PROFILE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) PROGRAM",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) REQUESTMODEL",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) SESSIONS",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) TCPIPSERVICE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) TDQUEUE",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) TERMINAL",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) TRANCLASS",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) TRANSACTION",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) TSMODEL",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) TYPETERM",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) URIMAP",
        "CSD RENAME RESID({$varFour}) GROUP({$varFour}) AS({$varFour}) WEBSERVICE");
  }

  private static final String CSD_CVDA_MISSING =
      "Missing required option: RESTYPE or ATOMSERVICE or BUNDLE or CONNECTION or CORBASERVER or"
          + " DB2CONN or DB2ENTRY or DB2TRAN or DJAR or DOCTEMPLATE or DUMPCODE or ENQMODEL or FILE"
          + " or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL or MAPSET or MQCONN or"
          + " MQMONITOR or PARTITIONSET or PARTNER or PIPELINE or PROCESSTYPE or PROFILE or PROGRAM"
          + " or REQUESTMODEL or SESSIONS or TCPIPSERVICE or TDQUEUE or TERMINAL or TRANCLASS or"
          + " TRANSACTION or TSMODEL or TYPETERM or URIMAP or WEBSERVICE";
  private static final String CSD_ADD_INVALID = "CSD {ADD|error|error2}";
  private static final String CDS_ALTER_INVALID = "CSD {ALTER|error|error2|error3|error4}";
  private static final String CDS_ALTER_MUTUALEX_INVALID =
      "CSD ALTER CONNECTION RESID({$varFour}) GROUP({$varFour}) ATTRIBUTES({$varFour})"
          + " {NOCOMPAT|error} {COMPAT|error2}";
  private static final String CDS_ALTER_MUTUALEX2_INVALID =
      "CSD ALTER CONNECTION {NOCOMPAT|error} RESID({$varFour}) GROUP({$varFour})"
          + " ATTRIBUTES({$varFour}) {COMPAT|error2}";
  private static final String CDS_APPEND_INVALID = "CSD {APPEND|error|error2}";
  private static final String CDS_COPY_INVALID =
      "CSD {_COPY ATOMSERVICE RESID({$varFour}) AS({$varFour}) DUPERROR |error_}";
  private static final String CDS_COPY_RESID_INVALID =
      "CSD {_COPY PARTNER GROUP({$varFour}) TO({$varFour})|error_}";
  private static final String CDS_COPY_MUTUALEX_INVALID =
      "CSD COPY PARTNER GROUP({$varFour}) RESID({$varFour}) TO({$varFour}) {DUPNOREPLACE|error}"
          + " {DUPERROR|error2}";
  private static final String CDS_COPY_MUTUALEX_ASTO_INVALID =
      "CSD COPY TSMODEL GROUP({$varFour}) RESID({$varFour}) {TO|error}({$varFour})"
          + " {AS|error2}({$varFour})";
  private static final String CDS_DEFINE_INVALID = "CSD {DEFINE|error|error2|error3|error4}";
  private static final String CDS_DELETE_INVALID = "CSD {DELETE|error}";
  private static final String CDS_DELETE_MUTUALEX_INVALID =
      "CSD DELETE GROUP({$varFour}) {REMOVE|error} {LISTACTION|error2}({$varOne})";
  private static final String CDS_GETNEXTGROUP_INVALID = "CSD {GETNEXTGROUP|error}";
  private static final String CDS_GETNEXTLIST_INVALID = "CSD {GETNEXTLIST|error}";
  private static final String CDS_GETNEXTRSRCE_INVALID = "CSD {GETNEXTRSRCE|error|error2|error3}";
  private static final String CDS_INQUIREGROUP_INVALID = "CSD {INQUIREGROUP|error}";
  private static final String CDS_INQUIRELIST_INVALID = "CSD {INQUIRELIST|error}";
  private static final String CDS_INQUIRERSRCE_INVALID =
      "CSD {INQUIRERSRCE|error|error2|error3|error4}";
  private static final String CDS_INQUIRERSRCE_MUTUALEX_INVALID =
      "CSD INQUIRERSRCE BUNDLE RESID({$varFour}) GROUP({$varFour}) {ATTRIBUTES|error}({$varFour})"
          + " {SET|error}({$varFour})";
  private static final String CDS_INSTALL_INVALID = "CSD {INSTALL|error}";
  private static final String CDS_INSTALL_CVDA_INVALID =
      "CSD {_INSTALL GROUP({$varFour}) LSRPOOL|error_}";

  private static final String CDS_LOCK_INVALID =
      "CSD LOCK {LIST|error}({$varFour}) {GROUP|error2}({$varFour})";
  private static final String CDS_REMOVE_INVALID = "CSD {_LIST({$varFour}) REMOVE|error_}";
  private static final String CDS_RENAME_INVALID =
      "CSD {_RESID({$varFour}) RENAME|error|error2|error3_}";
  private static final String CDS_STARTBRRSRCE_INVALID = "CSD {STARTBRRSRCE|error}";
  private static final String CDS_UNLOCK_INVALID = "CSD {UNLOCK|error}";
  private static final String CDS_USERDEFINE_INVALID =
      "CSD {USERDEFINE|error|error2|error3|error4}";
  private static final String GETNEXTRSRCE_SET_INVALID =
      "CSD {_GETNEXTRSRCE RESTYPE({$varFour}) RESID({$varFour}) GROUP({$varFour})"
          + " SET({$varFour})|error_}";
  private static final String INQUIRERSRCE_SET_INVALID =
      "CSD {_INQUIRERSRCE RESTYPE({$varFour}) RESID({$varFour}) GROUP({$varFour})"
          + " SET({$varFour})|error_}";
  private static final String REMOVE_PRIOR_INVALID = "CSD {_REMOVE GROUP({$varFour})|error_}";
  private static final String DELETE_LIST_INVALID =
      "CSD INSTALL LIST({$varFour}) {RESID|error}({$varFour}) {ATOMSERVICE|error2}";

  @ParameterizedTest
  @MethodSource("getValidOptions")
  void testPerformSpAllValid(String valid) {
    CICSTestUtils.noErrorTest(valid, "SP");
  }

  @Test
  void testAddSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: LIST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CSD_ADD_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsAlterSPInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: RESID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "Missing required option: ATTRIBUTES",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error4",
            new Diagnostic(
                new Range(),
                CSD_CVDA_MISSING,
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_ALTER_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsAlterSPMutualExInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: NOCOMPAT or"
                    + " COMPATMODE or COMPAT",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: NOCOMPAT or"
                    + " COMPATMODE or COMPAT",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_ALTER_MUTUALEX_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsAlterSPMutualEx2Invalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: NOCOMPAT or"
                    + " COMPATMODE or COMPAT",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: NOCOMPAT or"
                    + " COMPATMODE or COMPAT",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_ALTER_MUTUALEX2_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsAppendSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: LIST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: TO",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_APPEND_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsCopySpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_COPY_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsCopySpResIdInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: RESID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_COPY_RESID_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsCopySpMutualExInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: DUPERROR or DUPACTION"
                    + " or DUPNOREPLACE or DUPREPLACE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: DUPERROR or DUPACTION"
                    + " or DUPNOREPLACE or DUPREPLACE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_COPY_MUTUALEX_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsCopySpAsToMutualExInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: AS or TO",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: AS or TO",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_COPY_MUTUALEX_ASTO_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsDefineSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: RESID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "Missing required option: ATTRIBUTES",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error4",
            new Diagnostic(
                new Range(),
                CSD_CVDA_MISSING,
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_DEFINE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsDeleteSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_DELETE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsDeleteMutualExSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LISTACTION or REMOVE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LISTACTION or REMOVE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_DELETE_MUTUALEX_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsGetNextGroupSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_GETNEXTGROUP_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsGetNextListSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: LIST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_GETNEXTLIST_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsGetNextRsrceSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: RESTYPE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: RESID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_GETNEXTRSRCE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsInquireGroupSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_INQUIREGROUP_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsInquireListSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: LIST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_INQUIRELIST_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsInquireRsrceSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                CSD_CVDA_MISSING,
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: RESID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error4",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: ATTRIBUTES or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));

    CICSTestUtils.errorTest(CDS_INQUIRERSRCE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsInquireRsrceMutualExSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ATTRIBUTES or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_INQUIRERSRCE_MUTUALEX_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsInstallSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: LIST or GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_INSTALL_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsInstallResIdSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "If one option is specified, all options must be present: RESID and any of RESTYPE"
                    + " or ATOMSERVICE or BUNDLE or CONNECTION or CORBASERVER or DB2CONN or"
                    + " DB2ENTRY or DB2TRAN or DJAR or DOCTEMPLATE or DUMPCODE or ENQMODEL or FILE"
                    + " or IPCONN or JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL or MAPSET or"
                    + " MQCONN or MQMONITOR or PARTITIONSET or PARTNER or PIPELINE or PROCESSTYPE"
                    + " or PROFILE or PROGRAM or REQUESTMODEL or SESSIONS or TCPIPSERVICE or"
                    + " TDQUEUE or TERMINAL or TRANCLASS or TRANSACTION or TSMODEL or TYPETERM or"
                    + " URIMAP or WEBSERVICE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_INSTALL_CVDA_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsLockMutualExSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LIST or GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: LIST or GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_LOCK_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsRemoveSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_REMOVE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsRenameInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: AS",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                CSD_CVDA_MISSING,
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_RENAME_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsStartbrRsrceSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_STARTBRRSRCE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsUnlockSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: LIST or GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_UNLOCK_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsUserDefineSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: RESID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Missing required option: GROUP",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error3",
            new Diagnostic(
                new Range(),
                "Missing required option: ATTRIBUTES",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error4",
            new Diagnostic(
                new Range(),
                CSD_CVDA_MISSING,
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CDS_USERDEFINE_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsGetNextRsrceSetAttrlenSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "If one option is specified, all options must be present: SET, ATTRLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(GETNEXTRSRCE_SET_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsInquireRsrceSetAttrlenSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "If one option is specified, all options must be present: SET, ATTRLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(INQUIRERSRCE_SET_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testRemovePriorSpInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Missing required option: LIST",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(REMOVE_PRIOR_INVALID, expectedDiagnostic, "SP");
  }

  @Test
  void testCdsDeleteListSPInvalid() {
    Map<String, Diagnostic> expectedDiagnostic =
        ImmutableMap.of(
            "error",
            new Diagnostic(
                new Range(),
                "Invalid option provided: RESID",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "error2",
            new Diagnostic(
                new Range(),
                "Invalid option provided: RESTYPE or ATOMSERVICE or BUNDLE or "
                    + "CONNECTION or CORBASERVER or DB2CONN or DB2ENTRY or DB2TRAN or "
                    + "DJAR or DOCTEMPLATE or DUMPCODE or ENQMODEL or FILE or IPCONN or "
                    + "JOURNALMODEL or JVMSERVER or LIBRARY or LSRPOOL or MAPSET or MQCONN or "
                    + "MQMONITOR or PARTITIONSET or PARTNER or PIPELINE or PROCESSTYPE or "
                    + "PROFILE or PROGRAM or REQUESTMODEL or SESSIONS or TCPIPSERVICE or "
                    + "TDQUEUE or TERMINAL or TRANCLASS or TRANSACTION or TSMODEL or "
                    + "TYPETERM or URIMAP or WEBSERVICE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(DELETE_LIST_INVALID, expectedDiagnostic, "SP");
  }
}
