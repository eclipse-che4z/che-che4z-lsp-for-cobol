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

import java.util.Map;

/**
 * Test CICS EXTRACT commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-allocate-appc">EXTRACT Command</a>
 *
 * <p>This class tests all variations of the EXTRACT command found in the link above.
 */
public class TestCICSExtract {

  private static final String EXTRACT_ATTACH_ALL_OPTIONS_VALID_ONE =
      "EXTRACT ATTACH ATTACHID({$varOne}) PROCESS({$varTwo}) RESOURCE({$varThree}) RPROCESS({$varFour}) RRESOURCE({$varFive}) QUEUE({$varSix}) IUTYPE({$varSix}) DATASTR({$varSix}) RECFM({$varSix})";

  private static final String EXTRACT_ATTACH_PARTIAL_VALID_ONE =
      "EXTRACT ATTACH PROCESS({$varOne})";

  private static final String EXTRACT_ATTRIBUTES_ALL_OPTIONS_VALID_ONE =
      "EXTRACT ATTRIBUTES CONVID({$varOne}) STATE({$varTwo})";

  private static final String EXTRACT_ATTRIBUTES_PARTIAL_VALID_ONE =
      "EXTRACT ATTRIBUTES STATE({$varOne})";

  private static final String EXTRACT_ATTRIBUTES_INVALID_ONE =
      "EXTRACT {_ATTRIBUTES CONVID(100)|errorOne_}";

  private static final String EXTRACT_CERTIFICATE_ALL_OPTIONS_VALID_ONE =
      "EXTRACT CERTIFICATE({$varOne}) LENGTH({$varOne}) SERIALNUM({$varOne}) SERIALNUMLEN({$varOne}) USERID({$varOne}) OWNER COMMONNAME({$varOne}) COMMONNAMLEN({$varOne}) COUNTRY({$varOne}) COUNTRYLEN({$varOne}) STATE({$varOne}) STATELEN({$varOne}) LOCALITY({$varOne}) LOCALITYLEN({$varOne}) ORGANIZATION({$varOne}) ORGANIZATLEN({$varOne}) ORGUNIT({$varOne}) ORGUNITLEN({$varOne})";

  private static final String EXTRACT_CERTIFICATE_PARTIAL_VALID_ONE =
      "EXTRACT CERTIFICATE({$varOne}) COMMONNAME({$varOne}) ORGUNITLEN({$varOne})";

  private static final String EXTRACT_CERTIFICATE_INVALID_ONE =
      "EXTRACT CERTIFICATE(100) {OWNER|errorOne} {ISSUER|errorTwo}";

  private static final String EXTRACT_LOGONMSG_ALL_OPTIONS_VALID_ONE =
      "EXTRACT LOGONMSG INTO({$varOne}) LENGTH({$varTwo})";

  private static final String EXTRACT_LOGONMSG_ALL_OPTIONS_VALID_TWO =
      "EXTRACT LOGONMSG SET({$varOne}) LENGTH({$varOne})";

  private static final String EXTRACT_LOGONMSG_INVALID_ONE =
      "EXTRACT {_LOGONMSG SET(100)|errorOne_}";

  private static final String EXTRACT_LOGONMSG_INVALID_TWO =
      "EXTRACT LOGONMSG {INTO|errorOne}(100) {SET|errorTwo}(100) LENGTH(100)";

  private static final String EXTRACT_LOGONMSG_INVALID_THREE =
      "EXTRACT {_LOGONMSG LENGTH(100)|errorOne_}";

  private static final String EXTRACT_LOGONMSG_INVALID_FOUR =
      "EXTRACT LOGONMSG {INTO|errorOne}(100) RESP(100) RESP2(101) {SET|errorTwo}(100) LENGTH(100)";

  private static final String EXTRACT_PROCESS_ALL_OPTIONS_VALID_ONE =
      "EXTRACT PROCESS PROCNAME({$varOne}) PROCLENGTH({$varOne}) MAXPROCLEN({$varOne}) CONVID({$varOne}) SYNCLEVEL({$varOne}) PIPLIST({$varOne}) PIPLENGTH({$varOne})";

  private static final String EXTRACT_PROCESS_PARTIAL_VALID_ONE =
      "EXTRACT PROCESS SYNCLEVEL({$varOne})";

  private static final String EXTRACT_PROCESS_INVALID_ONE =
      "EXTRACT PROCESS {MAXPROCLEN|errorOne}(100)";

  private static final String EXTRACT_TCPIP_ALL_OPTIONS_VALID_ONE =
      "EXTRACT TCPIP AUTHENTICATE({$varOne}) CLIENTNAME({$varOne}) CNAMELENGTH({$varOne}) SERVERNAME({$varOne}) SNAMELENGTH({$varOne}) CLIENTADDR({$varOne}) CADDRLENGTH({$varOne}) CLNTIPFAMILY({$varOne}) CLIENTADDRNU({$varOne}) CLNTADDR6NU({$varOne}) SERVERADDR({$varOne}) SADDRLENGTH({$varOne}) SRVRIPFAMILY({$varOne}) SERVERADDRNU({$varOne}) SRVRADDR6NU({$varOne}) SSLTYPE({$varOne}) TCPIPSERVICE({$varOne}) PORTNUMBER({$varOne}) PORTNUMNU({$varOne}) PRIVACY({$varOne}) MAXDATALEN({$varOne})";

  private static final String EXTRACT_TCPIP_PARTIAL_VALID_ONE =
      "EXTRACT TCPIP CLIENTADDR({$varOne}) CADDRLENGTH({$varOne}) MAXDATALEN({$varOne})";

  private static final String EXTRACT_TCPIP_INVALID_ONE =
      "EXTRACT TCPIP AUTHENTICATE(100) {SADDRLENGTH|errorOne}(100)";

  private static final String EXTRACT_TCT_ALL_OPTIONS_VALID_ONE =
      "EXTRACT TCT NETNAME({$varOne}) SYSID({$varOne})";

  private static final String EXTRACT_TCT_PARTIAL_VALID_ONE = "EXTRACT TCT NETNAME({$varOne})";

  private static final String EXTRACT_TCT_INVALID_ONE = "EXTRACT {_TCT SYSID(100)|errorOne_}";

  private static final String EXTRACT_WEB_SERVER_ALL_OPTIONS_VALID_ONE =
      "EXTRACT WEB SCHEME({$varOne}) HOST({$varOne}) HOSTLENGTH({$varOne}) HOSTTYPE({$varOne}) HTTPMETHOD({$varOne}) METHODLENGTH({$varOne}) HTTPVERSION({$varOne}) VERSIONLEN({$varOne}) PATH({$varOne}) PATHLENGTH({$varOne}) PORTNUMBER({$varOne}) QUERYSTRING({$varOne}) QUERYSTRLEN({$varOne}) REQUESTTYPE({$varOne}) URIMAP({$varOne})";

  private static final String EXTRACT_WEB_SERVER_PARTIAL_ONE =
      "EXTRACT WEB SCHEME({$varOne}) PORTNUMBER({$varOne})";

  private static final String EXTRACT_WEB_SERVER_INVALID_ONE =
      "EXTRACT WEB {HOSTTYPE|errorOne}(100)";

  private static final String EXTRACT_WEB_CLIENT_ALL_OPTIONS_VALID_ONE =
      "EXTRACT WEB SESSTOKEN({$varOne}) SCHEME({$varOne}) HOST({$varOne}) HOSTLENGTH({$varOne}) HOSTTYPE({$varOne}) HTTPVERSION({$varOne}) VERSIONLEN({$varOne}) PATH({$varOne}) PATHLENGTH({$varOne}) PORTNUMBER({$varOne}) URIMAP({$varOne}) REALM({$varOne}) REALMLEN({$varOne})";

  private static final String EXTRACT_WEB_CLIENT_PARTIAL_ONE =
      "EXTRACT WEB SESSTOKEN({$varOne}) SCHEME({$varOne}) PORTNUMBER({$varOne})";

  private static final String EXTRACT_WEB_CLIENT_INVALID_ONE =
      "EXTRACT WEB SESSTOKEN(100) {REALMLEN|errorOne}(100)";

  @Test
  void testExtractAttachAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_ATTACH_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractAttachPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_ATTACH_PARTIAL_VALID_ONE);
  }

  @Test
  void testExtractAttributesAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_ATTRIBUTES_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractAttributesPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_ATTRIBUTES_PARTIAL_VALID_ONE);
  }

  @Test
  void testExtractAttributesInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: STATE",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_ATTRIBUTES_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testExtractCertificateAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_CERTIFICATE_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractCertificatePartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_CERTIFICATE_PARTIAL_VALID_ONE);
  }

  @Test
  void testExtractCertificateInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ISSUER or OWNER",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: ISSUER or OWNER",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_CERTIFICATE_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testExtractLogonmsgAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_LOGONMSG_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractLogonmsgAllOptionsValidTwo() {
    CICSTestUtils.noErrorTest(EXTRACT_LOGONMSG_ALL_OPTIONS_VALID_TWO);
  }

  @Test
  void testExtractLogonmsgInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: LENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_LOGONMSG_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testExtractLogonmsgInvalidTwo() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: INTO or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: INTO or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_LOGONMSG_INVALID_TWO, expectedDiagnostics);
  }

  @Test
  void testExtractLogonmsgInvalidThree() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, none provided: INTO or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_LOGONMSG_INVALID_THREE, expectedDiagnostics);
  }

  @Test
  void testExtractLogonmsgInvalidFour() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: INTO or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()),
            "errorTwo",
            new Diagnostic(
                new Range(),
                "Exactly one option required, options are mutually exclusive: INTO or SET",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_LOGONMSG_INVALID_FOUR, expectedDiagnostics);
  }

  @Test
  void testExtractProcessAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_PROCESS_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractProcessPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_PROCESS_PARTIAL_VALID_ONE);
  }

  @Test
  void testExtractProcessInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: MAXPROCLEN without PROCNAME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_PROCESS_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testExtractTCPIOAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_TCPIP_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractTCPIPPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_TCPIP_PARTIAL_VALID_ONE);
  }

  @Test
  void testExtractTCPIPInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: SADDRLENGTH without SERVERADDR",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_TCPIP_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testExtractTCTAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_TCT_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractTCTPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_TCT_PARTIAL_VALID_ONE);
  }

  @Test
  void testExtractTCTInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Missing required option: NETNAME",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_TCT_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testExtractWebServerAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_WEB_SERVER_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractWebServerPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_WEB_SERVER_PARTIAL_ONE);
  }

  @Test
  void testExtractWebServerInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: HOSTTYPE without HOSTLENGTH",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_WEB_SERVER_INVALID_ONE, expectedDiagnostics);
  }

  @Test
  void testExtractWebClientAllOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_WEB_CLIENT_ALL_OPTIONS_VALID_ONE);
  }

  @Test
  void testExtractWebClientPartialOptionsValidOne() {
    CICSTestUtils.noErrorTest(EXTRACT_WEB_CLIENT_PARTIAL_ONE);
  }

  @Test
  void testExtractWebClientInvalidOne() {
    Map<String, Diagnostic> expectedDiagnostics =
        ImmutableMap.of(
            "errorOne",
            new Diagnostic(
                new Range(),
                "Invalid option provided: REALMLEN without REALM",
                DiagnosticSeverity.Error,
                ErrorSource.PARSING.getText()));
    CICSTestUtils.errorTest(EXTRACT_WEB_CLIENT_INVALID_ONE, expectedDiagnostics);
  }
}
