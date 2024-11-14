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

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.error.ErrorSource;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.eclipse.lsp4j.Diagnostic;
import org.eclipse.lsp4j.DiagnosticSeverity;
import org.eclipse.lsp4j.Range;
import org.junit.jupiter.api.Test;

import java.util.*;

/**
 * Test CICS WEB command. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-receive-zos-communications-server-default">WEB
 * Command</a>
 *
 * <p>This class tests all variations of the WEB command found in the link above.
 */

public class TestCicsWebStatement {
    // Main Building Blocks
    private static final String BASE_TEXT =
            "       IDENTIFICATION DIVISION.\n"
                    + "       PROGRAM-ID. ABCDEF.\n"
                    + "       DATA DIVISION.\n"
                    + "       WORKING-STORAGE SECTION.\n"
                    + "       01 {$*fromVar} PIC S9 VALUE +100.\n"
                    + "       01 {$*fromLen} PIC S9 VALUE +10.\n"
                    + "       01 {$*maxLen} PIC S9 VALUE +10.\n"
                    + "       01 {$*toLen} PIC S9 VALUE +10.\n"
                    + "       01 {$*intoVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*sessVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*mediaType} PIC S9 VALUE +1000.\n"
                    + "       01 {$*queryStr} PIC S9 VALUE +1000.\n"
                    + "       01 {$*ctlCharVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*ldcVar} PIC S9 VALUE +1000.\n"
                    + "       01 {$*lineAddrVar} PIC S9 VALUE +1000.\n"
                    + "       PROCEDURE DIVISION.\n"
                    + "            EXEC CICS \n"
                    + "            END-EXEC.";

    private static final String WEB = "WEB ";

    private static final String WEB_AUTH = "BASICAUTH USERNAME(123) USERNAMELEN(3) PASSWORD(1234) PASSWORDLEN(4) ";
    private static final String HOST_LEN_TYPE = "HOST(123) HOSTLENGTH(123) HOSTTYPE(1) ";

    // Test Strings
    private static final String CLOSE_VALID = WEB + "CLOSE SESSTOKEN({$sessVar})";

    private static final String CONVERSE_VALID_1 = WEB + "CONVERSE SESSTOKEN({$sessVar}) PATH(123) PATHLENGTH(123) GET MEDIATYPE({$mediaType}) QUERYSTRING({$queryStr}) QUERYSTRLEN(10) "
            + "DOCTOKEN(123) DOCDELETE EXPECT CLOSE " + WEB_AUTH + "INTO({$intoVar}) TOLENGTH({$toLen}) MAXLENGTH({$maxLen}) "
            + "NOTRUNCATE STATUSCODE(123) STATUSTEXT(123) STATUSLEN(123) CHARACTERSET(1) NOINCONVERT BODYCHARSET(123)";
    private static final String CONVERSE_VALID_2 = WEB + "CONVERSE SESSTOKEN({$sessVar}) GET TOLENGTH({$toLen})";

    private static final String ENDBROWSE_VALID = WEB + "ENDBROWSE FORMFIELD";

    private static final String EXTRACT_SERVER_VALID = WEB + "EXTRACT SCHEME(123) HOST(123) HOSTLENGTH(123) HOSTTYPE(1) HTTPMETHOD(1) METHODLENGTH(123) "
            + "HTTPVERSION(2) VERSIONLEN(1) PATH(123) PATHLENGTH(123) PORTNUMBER(80) QUERYSTRING(123) QUERYSTRLEN(10) REQUESTTYPE(123) URIMAP(1)";
    private static final String EXTRACT_CLIENT_VALID = WEB + "EXTRACT SESSTOKEN({$sessVar}) SCHEME(123) " + HOST_LEN_TYPE + "HTTPVERSION(2) VERSIONLEN(1) PATH(123) PATHLENGTH(123) PORTNUMBER(80)";

    private static final String OPEN_VALID = WEB + "OPEN HOST(123) HOSTLENGTH(123) PORTNUMBER(80) SCHEME(123) CERTIFICATE(123) CODEPAGE(12) "
            + "SESSTOKEN({$sessVar}) HTTPVNUM(123) HTTPRNUM(123) CIPHERS(123) NUMCIPHERS(123)";

    private static final String PARSE_URL_VALID = WEB + "PARSE URL(123) URLLENGTH(123) SCHEMENAME(123) " + HOST_LEN_TYPE + " PORTNUMBER(80) PATH(123) PATHLENGTH(123) QUERYSTRING(123) QUERYSTRLEN(10)";

    private static final String WEB_READ = WEB + "READ ";
    private static final String READ_FORMFIELD_VALID = WEB_READ + "FORMFIELD(123) NAMELENGTH(123) VALUE(123) VALUELENGTH(123) CHARACTERSET(1) HOSTCODEPAGE(1) ";
    private static final String READ_QUERYPARM_VALID = WEB_READ + "QUERYPARM(123) NAMELENGTH(123) VALUE(123) VALUELENGTH(123) HOSTCODEPAGE(1) ";
    private static final String READ_HTTPHEADER_VALID = WEB_READ + "HTTPHEADER(123) NAMELENGTH(123) VALUE(123) VALUELENGTH(123)";

    private static final String WEB_READNEXT = WEB + "READNEXT ";
    private static final String READNEXT_FORMFIELD_VALID = WEB_READNEXT + "FORMFIELD(123) NAMELENGTH(123) VALUE(123) VALUELENGTH(123)";
    private static final String READNEXT_QUERYPARM_VALID = WEB_READNEXT + "QUERYPARM(123) NAMELENGTH(123) VALUE(123) VALUELENGTH(123)";
    private static final String READNEXT_HTTPHEADER_VALID = WEB_READNEXT + "HTTPHEADER(123) NAMELENGTH(123) SESSTOKEN({$sessVar}) VALUE(123) VALUELENGTH(123)";

    private static final String RECEIVE_SERVER_BUFFER_VALID = WEB + "RECEIVE INTO(123) LENGTH(123) MAXLENGTH(123) NOTRUNCATE TYPE(1) SRVCONVERT CHARACTERSET(1) HOSTCODEPAGE(123) BODYCHARSET(123) MEDIATYPE(123)";
    private static final String RECEIVE_SERVER_CONTAINER_VALID = WEB + "RECEIVE TOCONTAINER(123) TOCHANNEL(3) TYPE(1) CHARACTERSET(1) BODYCHARSET(123) MEDIATYPE(123)";

    private static final String RECEIVE_BODY = WEB + "RECEIVE SESSTOKEN({$sessVar}) MEDIATYPE(123) STATUSCODE(1) STATUSTEXT(1) STATUSLEN(123) ";
    private static final String RECEIVE_CLIENT_BUFFER_VALID = RECEIVE_BODY + "INTO(123) LENGTH(123) MAXLENGTH(123) NOTRUNCATE CLICONVERT BODYCHARSET(1)";
    private static final String RECEIVE_CLIENT_CONTAINER_VALID = RECEIVE_BODY + "TOCONTAINER(1) TOCHANNEL(3) BODYCHARSET(1)";

    private static final String RETRIEVE_VALID = WEB + "RETRIEVE DOCTOKEN(123)";

    private static final String SEND_SERVER_VALID_1 = WEB + "SEND DOCTOKEN(123) NODOCDELETE MEDIATYPE(123) SRVCONVERT CHARACTERSET(1) STATUSCODE(123) STATUSTEXT(123) STATUSLEN(123) IMMEDIATE NOCLOSE";
    private static final String SEND_SERVER_VALID_2 = WEB + "SEND FROM(123) FROMLENGTH(123) CHUNKNO HOSTCODEPAGE(123) MEDIATYPE(123) SRVCONVERT CHARACTERSET(1) STATUSCODE(123) STATUSTEXT(123) STATUSLEN(123) IMMEDIATE NOCLOSE";
    private static final String SEND_SERVER_VALID_3 = WEB + "SEND CONTAINER(1) CHANNEL(3) MEDIATYPE(123) SRVCONVERT CHARACTERSET(1) STATUSCODE(123) STATUSTEXT(123) STATUSLEN(123) EVENTUAL CLOSE";

    private static final String SEND_CLIENT_VALID_1 = WEB + "SEND SESSTOKEN({$sessVar}) GET PATH(123) PATHLENGTH(123) QUERYSTRING(123) QUERYSTRLEN(123) DOCTOKEN(123) DOCDELETE CLICONVERT CHARACTERSET(1)"
            + " EXPECT NOCLOSE BASICAUTH USERNAME(123) USERNAMELEN(3) PASSWORD(1234) PASSWORDLEN(4)";
    private static final String SEND_CLIENT_VALID_2 = WEB + "SEND SESSTOKEN({$sessVar}) FROM(123) FROMLENGTH(3) CHUNKYES GET PATH(123) PATHLENGTH(123) QUERYSTRING(123) QUERYSTRLEN(123) CLICONVERT CHARACTERSET(1) EXPECT NOCLOSE BASICAUTH USERNAME(123) USERNAMELEN(3) PASSWORD(1234) PASSWORDLEN(4)";

    private static final String STARTBROWSE_FORMFIELD_VALID = WEB + "STARTBROWSE FORMFIELD(123) NAMELENGTH(123) CHARACTERSET(123) HOSTCODEPAGE(123)";
    private static final String STARTBROWSE_HTTPHEADER_VALID = WEB + "STARTBROWSE HTTPHEADER SESSTOKEN({$sessVar})";
    private static final String STARTBROWSE_QUERYPARM_VALID = WEB + "STARTBROWSE QUERYPARM(123) NAMELENGTH(123) HOSTCODEPAGE(123)";

    private static final String WRITE_HTTPHEADER_VALID = WEB + "WRITE HTTPHEADER(123) NAMELENGTH(123) SESSTOKEN({$sessVar}) VALUE(123) VALUELENGTH(123)";

    // Invalid use cases
    private static final String CLOSE_INVALID = WEB + "{CLOSE|errorOne} {FROM|errorTwo}(123) SESSTOKEN(123)";
    private static final String READ_QUERYPARM_INVALID = WEB_READ + "QUERYPARM(123) NAMELENGTH(123) {SESSTOKEN|errorOne}(123) VALUE(123) VALUELENGTH(123)";
    private static final String READNEXT_QUERYPARM_INVALID = WEB_READNEXT + "QUERYPARM(123) NAMELENGTH(123) {SESSTOKEN|errorOne}(123) VALUE(123) VALUELENGTH(123)";
    private static final String SEND_SERVER_INVALID = WEB + "SEND DOCTOKEN(123) {FROM(123)|errorOne} NODOCDELETE MEDIATYPE(123) SRVCONVERT CHARACTERSET(1) STATUSCODE(123) STATUSTEXT(123) STATUSLEN(123) IMMEDIATE NOCLOSE";



    // Utility Functions
    private static void noErrorTest(String newCommand) {
        UseCaseEngine.runTest(getTestString(newCommand), ImmutableList.of(), ImmutableMap.of());
    }

    private static String getTestString(String newCommand) {
        List<String> instances = Arrays.asList(newCommand.split("\\s"));
        instances.replaceAll(String.join("", Collections.nCopies(12, " "))::concat);
        ArrayList<String> base = new ArrayList<String>(Arrays.asList(BASE_TEXT.split("\n")));
        base.addAll(base.size() - 1, instances);
        return String.join("\n", base);
    }

    // Test Functions
    @Test
    void testCloseValid() {
        noErrorTest(CLOSE_VALID);
    }

    @Test
    void testCloseInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Missing required option: SESSTOKEN", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        expectedDiagnostics.put("errorTwo", new Diagnostic(new Range(), "Syntax error on 'FROM'", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(CLOSE_INVALID, expectedDiagnostics);
    }

    @Test
    void testConverseValid() {
        noErrorTest(CONVERSE_VALID_1);
        noErrorTest(CONVERSE_VALID_2);
    }

    @Test
    void testEndbrowseValid() {
        noErrorTest(ENDBROWSE_VALID);
    }

    @Test
    void testExtractServer() {
        noErrorTest(EXTRACT_SERVER_VALID);
    }

    @Test
    void testExtractClient() {
        noErrorTest(EXTRACT_CLIENT_VALID);
    }

    @Test
    void testOpenValid() {
        noErrorTest(OPEN_VALID);
    }

    @Test
    void testParseUrlValid() {
        noErrorTest(PARSE_URL_VALID);
    }

    @Test
    void testReadValid() {
        noErrorTest(READ_FORMFIELD_VALID);
        noErrorTest(READ_QUERYPARM_VALID);
        noErrorTest(READ_HTTPHEADER_VALID);
    }

    @Test
    void testReadInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Invalid option provided: SESSTOKEN", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READ_QUERYPARM_INVALID, expectedDiagnostics);
    }

    @Test
    void testReadnextValid() {
        noErrorTest(READNEXT_FORMFIELD_VALID);
        noErrorTest(READNEXT_QUERYPARM_VALID);
        noErrorTest(READNEXT_HTTPHEADER_VALID);
    }

    @Test
    void testReadNextInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Extraneous input SESSTOKEN", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(READNEXT_QUERYPARM_INVALID, expectedDiagnostics);
    }

    @Test
    void testReceiveServerValid() {
        noErrorTest(RECEIVE_SERVER_BUFFER_VALID);
        noErrorTest(RECEIVE_SERVER_CONTAINER_VALID);
    }

    @Test
    void testReceiveClientValid() {
        noErrorTest(RECEIVE_CLIENT_BUFFER_VALID);
        noErrorTest(RECEIVE_CLIENT_CONTAINER_VALID);
    }

    @Test
    void testRetrieveValid() {
        noErrorTest(RETRIEVE_VALID);
    }

    @Test
    void testSendServerValid() {
        noErrorTest(SEND_SERVER_VALID_1);
        noErrorTest(SEND_SERVER_VALID_2);
        noErrorTest(SEND_SERVER_VALID_3);
    }

    @Test
    void testSendServerInvalid() {
        HashMap<String, Diagnostic> expectedDiagnostics = new HashMap<>();
        expectedDiagnostics.put("errorOne", new Diagnostic(new Range(), "Options \"DOCTOKEN, FROM or CONTAINER\" are mutually exclusive.", DiagnosticSeverity.Error, ErrorSource.PARSING.getText()));
        CICSTestUtils.errorTest(SEND_SERVER_INVALID, expectedDiagnostics);
    }

    @Test
    void testSendClientValid() {
        noErrorTest(SEND_CLIENT_VALID_1);
        noErrorTest(SEND_CLIENT_VALID_2);
    }

    @Test
    void testStartBrowseValid() {
        noErrorTest(STARTBROWSE_FORMFIELD_VALID);
        noErrorTest(STARTBROWSE_HTTPHEADER_VALID);
        noErrorTest(STARTBROWSE_QUERYPARM_VALID);
    }

    @Test
    void testWriteHTTPHeaderValid() {
        noErrorTest(WRITE_HTTPHEADER_VALID);
    }
}
