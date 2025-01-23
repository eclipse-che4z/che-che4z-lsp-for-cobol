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
 * Test CICS DISCARD commands. Documentation link: <a
 * href="https://www.ibm.com/docs/en/search/discard?scope=SSJL4D_6.x">DISCARD
 * Command</a>
 *
 * <p>This class tests all variations of the DISCARD command .
 */
public class TestCicsDiscard {

  private static final String DISCARD_ATOMSERVICE_VALID = "DISCARD ATOMSERVICE({$varFour})";
  private static final String DISCARD_AUTINSTMODEL_VALID = "DISCARD AUTINSTMODEL({$varFour}) RESP({$varOne})";
  private static final String DISCARD_BUNDLE_VALID = "DISCARD BUNDLE({$varFour})";
  private static final String DISCARD_CONNECTION_VALID = "DISCARD RESP({$varOne}) CONNECTION({$varFour})";
  private static final String DISCARD_DB2CONN_VALID = "DISCARD DB2CONN";
  private static final String DISCARD_DB2ENTRY_VALID = "DISCARD DB2ENTRY({$varFour}) NOHANDLE";
  private static final String DISCARD_DB2TRAN_VALID = "DISCARD DB2TRAN({$varFour})";
  private static final String DISCARD_DOCTEMPLATE_VALID = "DISCARD NOHANDLE DOCTEMPLATE({$varFour}) RESP({$varOne})";
  private static final String DISCARD_ENQMODEL_VALID = "DISCARD ENQMODEL({$varFour})";
  private static final String DISCARD_FILE_VALID = "DISCARD FILE({$varFour})";
  private static final String DISCARD_IPCONN_VALID = "DISCARD IPCONN({$varFour})";
  private static final String DISCARD_JOURNALMODEL_VALID = "DISCARD JOURNALMODEL({$varFour})";
  private static final String DISCARD_JOURNALNAME_VALID = "DISCARD JOURNALNAME({$varFour})";
  private static final String DISCARD_JVMSERVER_VALID = "DISCARD NOHANDLE JVMSERVER({$varFour})";
  private static final String DISCARD_LIBRARY_VALID = "DISCARD LIBRARY({$varFour})";
  private static final String DISCARD_MQCONN_VALID = "DISCARD MQCONN RESP({$varOne})";
  private static final String DISCARD_MQMONITOR_VALID = "DISCARD MQMONITOR({$varFour})";
  private static final String DISCARD_PARTNER_VALID = "DISCARD PARTNER({$varFour})";
  private static final String DISCARD_PIPELINE_VALID = "DISCARD RESP({$varOne}) PIPELINE({$varFour})";
  private static final String DISCARD_PROCESSTYPE_VALID = "DISCARD PROCESSTYPE({$varFour})";
  private static final String DISCARD_PROFILE_VALID = "DISCARD PROFILE({$varFour})";
  private static final String DISCARD_PROGRAM_VALID = "DISCARD PROGRAM({$varFour}) RESP({$varOne})";
  private static final String DISCARD_TCPIPSERVICE_VALID = "DISCARD TCPIPSERVICE({$varFour})";
  private static final String DISCARD_TDQUEUE_VALID = "DISCARD TDQUEUE({$varFour})";
  private static final String DISCARD_TERMINAL_VALID = "DISCARD RESP({$varOne}) TERMINAL({$varFour})";
  private static final String DISCARD_TRANCLASS_VALID = "DISCARD TRANCLASS({$varFour}) NOHANDLE";
  private static final String DISCARD_TRANSACTION_VALID = "DISCARD TRANSACTION({$varFour})";
  private static final String DISCARD_TSMODEL_VALID = "DISCARD TSMODEL({$varFour})";
  private static final String DISCARD_URIMAP_VALID = "DISCARD URIMAP({$varFour})";
  private static final String DISCARD_WEBSERVICE_VALID = "DISCARD WEBSERVICE({$varFour})";

  private static final String DISCARD_DUPLICATE_INVALID = "DISCARD ATOMSERVICE({$varFour}) {ATOMSERVICE|error}(ignored)";

  @Test
  void testDiscardAtomService() {
    CICSTestUtils.noErrorTest(DISCARD_ATOMSERVICE_VALID, "SP");
  }

  @Test
  void testDiscardAutInstModel() {
    CICSTestUtils.noErrorTest(DISCARD_AUTINSTMODEL_VALID, "SP");
  }

  @Test
  void testDiscardBundle() {
    CICSTestUtils.noErrorTest(DISCARD_BUNDLE_VALID, "SP");
  }

  @Test
  void testDiscardConnection() {
    CICSTestUtils.noErrorTest(DISCARD_CONNECTION_VALID, "SP");
  }

  @Test
  void testDiscardDb2Conn() {
    CICSTestUtils.noErrorTest(DISCARD_DB2CONN_VALID, "SP");
  }

  @Test
  void testDiscardDb2Entry() {
    CICSTestUtils.noErrorTest(DISCARD_DB2ENTRY_VALID, "SP");
  }

  @Test
  void testDiscardDb2Tran() {
    CICSTestUtils.noErrorTest(DISCARD_DB2TRAN_VALID, "SP");
  }

  @Test
  void testDiscardDocTemplate() {
    CICSTestUtils.noErrorTest(DISCARD_DOCTEMPLATE_VALID, "SP");
  }

  @Test
  void testDiscardEnqModel() {
    CICSTestUtils.noErrorTest(DISCARD_ENQMODEL_VALID, "SP");
  }

  @Test
  void testDiscardFile() {
    CICSTestUtils.noErrorTest(DISCARD_FILE_VALID, "SP");
  }

  @Test
  void testDiscardIpConn() {
    CICSTestUtils.noErrorTest(DISCARD_IPCONN_VALID, "SP");
  }

  @Test
  void testDiscardJournalModel() {
    CICSTestUtils.noErrorTest(DISCARD_JOURNALMODEL_VALID, "SP");
  }

  @Test
  void testDiscardJournalName() {
    CICSTestUtils.noErrorTest(DISCARD_JOURNALNAME_VALID, "SP");
  }

  @Test
  void testDiscardJvmServer() {
    CICSTestUtils.noErrorTest(DISCARD_JVMSERVER_VALID, "SP");
  }

  @Test
  void testDiscardLibrary() {
    CICSTestUtils.noErrorTest(DISCARD_LIBRARY_VALID, "SP");
  }

  @Test
  void testDiscardMqConn() {
    CICSTestUtils.noErrorTest(DISCARD_MQCONN_VALID, "SP");
  }

  @Test
  void testDiscardMqMonitor() {
    CICSTestUtils.noErrorTest(DISCARD_MQMONITOR_VALID, "SP");
  }

  @Test
  void testDiscardPartner() {
    CICSTestUtils.noErrorTest(DISCARD_PARTNER_VALID, "SP");
  }

  @Test
  void testDiscardPipeline() {
    CICSTestUtils.noErrorTest(DISCARD_PIPELINE_VALID, "SP");
  }

  @Test
  void testDiscardProcessType() {
    CICSTestUtils.noErrorTest(DISCARD_PROCESSTYPE_VALID, "SP");
  }

  @Test
  void testDiscardProfile() {
    CICSTestUtils.noErrorTest(DISCARD_PROFILE_VALID, "SP");
  }

  @Test
  void testDiscardProgram() {
    CICSTestUtils.noErrorTest(DISCARD_PROGRAM_VALID, "SP");
  }

  @Test
  void testDiscardTcpIpService() {
    CICSTestUtils.noErrorTest(DISCARD_TCPIPSERVICE_VALID, "SP");
  }

  @Test
  void testDiscardTdQueue() {
    CICSTestUtils.noErrorTest(DISCARD_TDQUEUE_VALID, "SP");
  }

  @Test
  void testDiscardTerminal() {
    CICSTestUtils.noErrorTest(DISCARD_TERMINAL_VALID, "SP");
  }

  @Test
  void testDiscardTransClass() {
    CICSTestUtils.noErrorTest(DISCARD_TRANCLASS_VALID, "SP");
  }

  @Test
  void testDiscardTransaction() {
    CICSTestUtils.noErrorTest(DISCARD_TRANSACTION_VALID, "SP");
  }

  @Test
  void testDiscardTsmodel() {
    CICSTestUtils.noErrorTest(DISCARD_TSMODEL_VALID, "SP");
  }

  @Test
  void testDiscardUrimap() {
    CICSTestUtils.noErrorTest(DISCARD_URIMAP_VALID, "SP");
  }

  @Test
  void testDiscardWebservice() {
    CICSTestUtils.noErrorTest(DISCARD_WEBSERVICE_VALID, "SP");
  }

  @Test
  void testDiscardDuplicate() {
    CICSTestUtils.errorTest(DISCARD_DUPLICATE_INVALID, ImmutableMap.of(
        "error",
            new Diagnostic(
                    new Range(),
                    "Extraneous input ATOMSERVICE",
                    DiagnosticSeverity.Error,
                    ErrorSource.PARSING.getText()
            )
    ),  "SP");
  }

}
