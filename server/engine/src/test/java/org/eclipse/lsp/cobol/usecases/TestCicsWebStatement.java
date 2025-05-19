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
public class TestCicsWebStatement {

  private static final String WEB = "WEB ";

  private static final String WEB_AUTH =
      "BASICAUTH USERNAME({$varOne}) USERNAMELEN({$varOne}) PASSWORD({$varOne})"
          + " PASSWORDLEN({$varOne}) ";
  private static final String HOST_LEN_TYPE =
      "HOST({$varOne}) HOSTLENGTH({$varOne}) HOSTTYPE({$varOne}) ";

  // Test Strings
  private static final String CLOSE_VALID = WEB + "CLOSE SESSTOKEN({$varOne})";

  private static final String CONVERSE_VALID_1 =
      WEB
          + "CONVERSE SESSTOKEN({$varOne}) PATH({$varOne}) PATHLENGTH({$varOne}) GET"
          + " MEDIATYPE({$varOne}) QUERYSTRING({$varOne}) QUERYSTRLEN({$varOne})"
          + " DOCTOKEN({$varOne}) DOCDELETE EXPECT CLOSE "
          + WEB_AUTH
          + "INTO({$varOne}) TOLENGTH({$varOne}) MAXLENGTH({$varOne}) NOTRUNCATE"
          + " STATUSCODE({$varOne}) STATUSTEXT({$varOne}) STATUSLEN({$varOne})"
          + " CHARACTERSET({$varOne}) NOINCONVERT BODYCHARSET({$varOne})";
  private static final String CONVERSE_VALID_2 =
      WEB + "CONVERSE SESSTOKEN({$varOne}) GET SET({$varOne}) TOLENGTH({$varOne})";

  private static final String ENDBROWSE_VALID = WEB + "ENDBROWSE FORMFIELD";

  private static final String EXTRACT_SERVER_VALID =
      WEB
          + "EXTRACT SCHEME({$varOne}) HOST({$varOne}) HOSTLENGTH({$varOne}) HOSTTYPE({$varOne})"
          + " HTTPMETHOD({$varOne}) METHODLENGTH({$varOne}) HTTPVERSION({$varOne})"
          + " VERSIONLEN({$varOne}) PATH({$varOne}) PATHLENGTH({$varOne}) PORTNUMBER({$varOne})"
          + " QUERYSTRING({$varOne}) QUERYSTRLEN({$varOne}) REQUESTTYPE({$varOne})"
          + " URIMAP({$varOne})";
  private static final String EXTRACT_CLIENT_VALID =
      WEB
          + "EXTRACT SESSTOKEN({$varOne}) SCHEME({$varOne}) "
          + HOST_LEN_TYPE
          + " HTTPVERSION({$varOne}) VERSIONLEN({$varOne}) PATH({$varOne}) PATHLENGTH({$varOne})"
          + " PORTNUMBER({$varOne})";

  private static final String OPEN_VALID =
      WEB
          + "OPEN HOST({$varOne}) HOSTLENGTH({$varOne}) PORTNUMBER({$varOne}) SCHEME({$varOne})"
          + " CERTIFICATE({$varOne}) CODEPAGE({$varOne}) SESSTOKEN({$varOne}) HTTPVNUM({$varOne})"
          + " HTTPRNUM({$varOne}) CIPHERS({$varOne}) NUMCIPHERS({$varOne})";

  private static final String PARSE_URL_VALID =
      WEB
          + "PARSE URL({$varOne}) URLLENGTH({$varOne}) SCHEMENAME({$varOne}) "
          + HOST_LEN_TYPE
          + " PORTNUMBER({$varOne}) PATH({$varOne}) PATHLENGTH({$varOne}) QUERYSTRING({$varOne})"
          + " QUERYSTRLEN({$varOne})";

  private static final String WEB_READ = WEB + "READ ";
  private static final String READ_FORMFIELD_VALID =
      WEB_READ
          + "FORMFIELD({$varOne}) NAMELENGTH({$varOne}) VALUE({$varOne}) VALUELENGTH({$varOne})"
          + " CHARACTERSET({$varOne}) HOSTCODEPAGE({$varOne}) ";
  private static final String READ_QUERYPARM_VALID =
      WEB_READ
          + "QUERYPARM({$varOne}) NAMELENGTH({$varOne}) VALUE({$varOne}) VALUELENGTH({$varOne})"
          + " HOSTCODEPAGE({$varOne}) ";
  private static final String READ_HTTPHEADER_VALID =
      WEB_READ
          + "HTTPHEADER({$varOne}) NAMELENGTH({$varOne}) VALUE({$varOne}) VALUELENGTH({$varOne})";

  private static final String WEB_READNEXT = WEB + "READNEXT ";
  private static final String READNEXT_FORMFIELD_VALID =
      WEB_READNEXT
          + "FORMFIELD({$varOne}) NAMELENGTH({$varOne}) VALUE({$varOne}) VALUELENGTH({$varOne})";
  private static final String READNEXT_QUERYPARM_VALID =
      WEB_READNEXT
          + "QUERYPARM({$varOne}) NAMELENGTH({$varOne}) VALUE({$varOne}) VALUELENGTH({$varOne})";
  private static final String READNEXT_HTTPHEADER_VALID =
      WEB_READNEXT
          + "HTTPHEADER({$varOne}) NAMELENGTH({$varOne}) SESSTOKEN({$varOne}) VALUE({$varOne})"
          + " VALUELENGTH({$varOne})";

  private static final String RECEIVE_SERVER_BUFFER_VALID =
      WEB
          + "RECEIVE INTO({$varOne}) LENGTH({$varOne}) MAXLENGTH({$varOne}) NOTRUNCATE"
          + " TYPE({$varOne}) SRVCONVERT CHARACTERSET({$varOne}) HOSTCODEPAGE({$varOne})"
          + " BODYCHARSET({$varOne}) MEDIATYPE({$varOne})";
  private static final String RECEIVE_SERVER_CONTAINER_VALID =
      WEB
          + "RECEIVE TOCONTAINER({$varOne}) TOCHANNEL({$varOne}) TYPE({$varOne})"
          + " CHARACTERSET({$varOne}) BODYCHARSET({$varOne}) MEDIATYPE({$varOne})";

  private static final String RECEIVE_BODY =
      WEB
          + "RECEIVE SESSTOKEN({$varOne}) MEDIATYPE({$varOne}) STATUSCODE({$varOne})"
          + " STATUSTEXT({$varOne}) STATUSLEN({$varOne}) ";
  private static final String RECEIVE_CLIENT_BUFFER_VALID =
      RECEIVE_BODY
          + "INTO({$varOne}) LENGTH({$varOne}) MAXLENGTH({$varOne}) NOTRUNCATE CLICONVERT"
          + " BODYCHARSET({$varOne})";
  private static final String RECEIVE_CLIENT_CONTAINER_VALID =
      RECEIVE_BODY + "TOCONTAINER({$varOne}) TOCHANNEL({$varOne}) BODYCHARSET({$varOne})";

  private static final String RETRIEVE_VALID = WEB + "RETRIEVE DOCTOKEN({$varOne})";

  private static final String SEND_SERVER_VALID_1 =
      WEB
          + "SEND DOCTOKEN({$varOne}) NODOCDELETE MEDIATYPE({$varOne}) SRVCONVERT"
          + " CHARACTERSET({$varOne}) STATUSCODE({$varOne}) STATUSTEXT({$varOne})"
          + " STATUSLEN({$varOne}) IMMEDIATE NOCLOSE";
  private static final String SEND_SERVER_VALID_2 =
      WEB
          + "SEND FROM({$varOne}) FROMLENGTH({$varOne}) CHUNKNO HOSTCODEPAGE({$varOne})"
          + " MEDIATYPE({$varOne}) SRVCONVERT CHARACTERSET({$varOne}) STATUSCODE({$varOne})"
          + " STATUSTEXT({$varOne}) STATUSLEN({$varOne}) IMMEDIATE NOCLOSE";
  private static final String SEND_SERVER_VALID_3 =
      WEB
          + "SEND CONTAINER({$varOne}) CHANNEL({$varOne}) MEDIATYPE({$varOne}) SRVCONVERT"
          + " CHARACTERSET({$varOne}) STATUSCODE({$varOne}) STATUSTEXT({$varOne})"
          + " STATUSLEN({$varOne}) EVENTUAL CLOSE";

  private static final String SEND_CLIENT_VALID_1 =
      WEB
          + "SEND SESSTOKEN({$varOne}) GET PATH({$varOne}) PATHLENGTH({$varOne})"
          + " QUERYSTRING({$varOne}) MEDIATYPE({$varOne}) QUERYSTRLEN({$varOne})"
          + " DOCTOKEN({$varOne}) DOCDELETE CLICONVERT CHARACTERSET({$varOne}) EXPECT NOCLOSE"
          + " BASICAUTH USERNAME({$varOne}) USERNAMELEN({$varOne}) PASSWORD({$varOne})"
          + " PASSWORDLEN({$varOne})";
  private static final String SEND_CLIENT_VALID_2 =
      WEB
          + "SEND SESSTOKEN({$varOne}) CHUNKYES GET PATH({$varOne}) PATHLENGTH({$varOne})"
          + " QUERYSTRING({$varOne}) QUERYSTRLEN({$varOne}) CLICONVERT CHARACTERSET({$varOne})"
          + " EXPECT NOCLOSE BASICAUTH USERNAME({$varOne}) USERNAMELEN({$varOne})"
          + " PASSWORD({$varOne}) PASSWORDLEN({$varOne})";

  private static final String STARTBROWSE_FORMFIELD_VALID =
      WEB
          + "STARTBROWSE FORMFIELD({$varOne}) NAMELENGTH({$varOne}) CHARACTERSET({$varOne})"
          + " HOSTCODEPAGE({$varOne})";
  private static final String STARTBROWSE_HTTPHEADER_VALID =
      WEB + "STARTBROWSE HTTPHEADER SESSTOKEN({$varOne})";
  private static final String STARTBROWSE_QUERYPARM_VALID =
      WEB + "STARTBROWSE QUERYPARM({$varOne}) NAMELENGTH({$varOne}) HOSTCODEPAGE({$varOne})";

  private static final String WRITE_HTTPHEADER_VALID =
      WEB
          + "WRITE HTTPHEADER({$varOne}) NAMELENGTH({$varOne}) SESSTOKEN({$varOne})"
          + " VALUE({$varOne}) VALUELENGTH({$varOne})";

  // Invalid use cases
  private static final String CLOSE_INVALID = WEB + "{CLOSE|errorOne}";
  private static final String READ_QUERYPARM_INVALID =
      WEB_READ
          + "QUERYPARM({$varOne}) NAMELENGTH({$varOne}) {SESSTOKEN|errorOne}({$varOne})"
          + " VALUE({$varOne}) VALUELENGTH({$varOne})";
  private static final String READNEXT_QUERYPARM_INVALID =
      WEB_READNEXT
          + "QUERYPARM({$varOne}) NAMELENGTH({$varOne}) {SESSTOKEN|errorOne}({$varOne})"
          + " VALUE({$varOne}) VALUELENGTH({$varOne})";
  private static final String SEND_SERVER_INVALID =
      WEB
          + "SEND DOCTOKEN({$varOne}) {FROM|errorOne}({$varOne}) FROMLENGTH({$varOne}) NODOCDELETE"
          + " MEDIATYPE({$varOne}) SRVCONVERT CHARACTERSET({$varOne}) STATUSCODE({$varOne})"
          + " STATUSTEXT({$varOne}) STATUSLEN({$varOne}) IMMEDIATE NOCLOSE";

  private static final String WEB_CONVERSE_TOLENGTH_WITHOUT_REQUIRED_OPTION =
      "WEB {_CONVERSE SESSTOKEN({$varOne}) TOLENGTH({$varTwo}) PUT|errorOne_}";

  private static final String WEB_CONVERSE_STATUSCODE_WITHOUT_STATUSTEXT =
      "WEB {_CONVERSE SESSTOKEN({$varOne}) TOLENGTH({$varTwo}) PUT SET({$varThree})"
          + " STATUSCODE({$varThree})|errorOne_}";

  private static final String WEB_SEND_USERNAME_PASSWORD_INVALID =
      "WEB {_SEND SESSTOKEN({$varOne}) USERNAME({$varTwo}) PASSWORD({$varThree})|errorOne_}";

  // Test Functions
  @Test
  void testCloseValid() {
    CICSTestUtils.noErrorTest(CLOSE_VALID);
  }

  @Test
  void testCloseInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Missing required option: SESSTOKEN",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(CLOSE_INVALID, expectedDiagnostics);
  }

  @Test
  void testConverseValid() {
    CICSTestUtils.noErrorTest(CONVERSE_VALID_1);
    CICSTestUtils.noErrorTest(CONVERSE_VALID_2);
  }

  @Test
  void testEndbrowseValid() {
    CICSTestUtils.noErrorTest(ENDBROWSE_VALID);
  }

  @Test
  void testExtractServer() {
    CICSTestUtils.noErrorTest(EXTRACT_SERVER_VALID);
  }

  @Test
  void testExtractClient() {
    CICSTestUtils.noErrorTest(EXTRACT_CLIENT_VALID);
  }

  @Test
  void testOpenValid() {
    CICSTestUtils.noErrorTest(OPEN_VALID);
  }

  @Test
  void testParseUrlValid() {
    CICSTestUtils.noErrorTest(PARSE_URL_VALID);
  }

  @Test
  void testReadValid() {
    CICSTestUtils.noErrorTest(READ_FORMFIELD_VALID);
    CICSTestUtils.noErrorTest(READ_QUERYPARM_VALID);
    CICSTestUtils.noErrorTest(READ_HTTPHEADER_VALID);
  }

  @Test
  void testReadInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Invalid option provided: SESSTOKEN",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(READ_QUERYPARM_INVALID, expectedDiagnostics);
  }

  @Test
  void testReadnextValid() {
    CICSTestUtils.noErrorTest(READNEXT_FORMFIELD_VALID);
    CICSTestUtils.noErrorTest(READNEXT_QUERYPARM_VALID);
    CICSTestUtils.noErrorTest(READNEXT_HTTPHEADER_VALID);
  }

  @Test
  void testReadNextInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Invalid option provided: SESSTOKEN",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(READNEXT_QUERYPARM_INVALID, expectedDiagnostics);
  }

  @Test
  void testReceiveServerValid() {
    CICSTestUtils.noErrorTest(RECEIVE_SERVER_BUFFER_VALID);
    CICSTestUtils.noErrorTest(RECEIVE_SERVER_CONTAINER_VALID);
  }

  @Test
  void testReceiveClientValid() {
    CICSTestUtils.noErrorTest(RECEIVE_CLIENT_BUFFER_VALID);
    CICSTestUtils.noErrorTest(RECEIVE_CLIENT_CONTAINER_VALID);
  }

  @Test
  void testRetrieveValid() {
    CICSTestUtils.noErrorTest(RETRIEVE_VALID);
  }

  @Test
  void testSendServerValid() {
    CICSTestUtils.noErrorTest(SEND_SERVER_VALID_1);
    CICSTestUtils.noErrorTest(SEND_SERVER_VALID_2);
    CICSTestUtils.noErrorTest(SEND_SERVER_VALID_3);
  }

  @Test
  void testSendServerInvalid() {
    HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
    expectedDiagnostics.put(
        "errorOne",
        new Diagnostic(
            new Range(),
            "Options \"DOCTOKEN, FROM or CONTAINER\" are mutually exclusive.",
            DiagnosticSeverity.Error,
            ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(SEND_SERVER_INVALID, expectedDiagnostics);
  }

  @Test
  void testSendClientValid() {
    CICSTestUtils.noErrorTest(SEND_CLIENT_VALID_1);
    CICSTestUtils.noErrorTest(SEND_CLIENT_VALID_2);
  }

  @Test
  void testStartBrowseValid() {
    CICSTestUtils.noErrorTest(STARTBROWSE_FORMFIELD_VALID);
    CICSTestUtils.noErrorTest(STARTBROWSE_HTTPHEADER_VALID);
    CICSTestUtils.noErrorTest(STARTBROWSE_QUERYPARM_VALID);
  }

  @Test
  void testWriteHTTPHeaderValid() {
    CICSTestUtils.noErrorTest(WRITE_HTTPHEADER_VALID);
  }

  @Test
  void testTolengthWithoutRequiredOption() {
    CICSTestUtils.errorTest(
        WEB_CONVERSE_TOLENGTH_WITHOUT_REQUIRED_OPTION,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: INTO or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testStatusCodeWithoutStatusTextSetOption() {
    CICSTestUtils.errorTest(
        WEB_CONVERSE_STATUSCODE_WITHOUT_STATUSTEXT,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "If one option is specified, all options must be present: STATUSCODE, STATUSTEXT,"
                    + " STATUSLEN",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }

  @Test
  void testSendUsernamePasswordInvalid() {
    CICSTestUtils.errorTest(
        WEB_SEND_USERNAME_PASSWORD_INVALID,
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: NONE, BASICAUTH, AUTHENTICATE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText())));
  }
}
