/*
 * Copyright (c) 2020 Broadcom.
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

package com.ca.lsp.cobol.usecases;

import com.ca.lsp.cobol.usecases.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

/**
 * This test checks the positive scenario of using CONTAINER in EXEC CICS statement. Note, the order
 * of parameters inside the grammar relaxed comparing to the CICS specification to avoid
 * false-positive errors caused by CICS preprocessor.
 */
class TestExecCicsContainerStatementsArgumentsOrder {

  private static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "        PROGRAM-ID. 'TEST1'.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       1 {$*COMMAND-RESP} PIC 9(9) BINARY.\n"
          + "       1 {$*COMMAND-RESP2} PIC 9(9) BINARY.\n"
          + "       1 {$*xml-cont} PIC 9(9) BINARY.\n"
          + "       1 {$*outbound-channel} PIC 9(9) BINARY.\n"
          + "       1 {$*DFH-BODY}.\n"
          + "           05 {$*Scratch-len} PIC 9(15).\n"
          + "           05 {$*DFH-BODY-LEN} PIC 9(9) BINARY.\n"
          + "           05 {$*DFH-BODY-PTR} PIC 9(9) BINARY.\n"
          + "       1 {$*xmltransformF} PIC 9(9) BINARY.\n"
          + "       1 {$*XMLTRANSFORMT} PIC 9(9) BINARY.\n"
          + "       1 {$*data-cont} PIC 9(9) BINARY.\n"
          + "       1 {$*DATA-CONT-PTR} PIC 9(9) BINARY.\n"
          + "       1 {$*COMPANYA} PIC 9(9) BINARY.\n"
          + "       1 {$*RESULT-LENGTH} PIC 9(9).\n"
          + "       PROCEDURE DIVISION.\n"
          + "       {#*MAINLINE}.\n"
          + "           exec cics put container({$xml-cont})\n"
          + "                         channel({$outbound-channel})\n"
          + "                         from(DFH-BODY(15:{$Scratch-len}))\n"
          + "                         flength({$Scratch-len})\n"
          + "                         resp({$COMMAND-RESP})\n"
          + "                         resp2({$COMMAND-RESP2})\n"
          + "           end-exec\n"
          + "           exec cics transform xmltodata\n"
          + "                         xmltransform({$xmltransformF})\n"
          + "                         channel({$outbound-channel})\n"
          + "                         xmlcontainer({$xml-cont})\n"
          + "                         datcontainer({$data-cont})\n"
          + "                         resp({$COMMAND-RESP})\n"
          + "                         resp2({$COMMAND-RESP2})\n"
          + "           end-exec\n"
          + "           Display {$COMMAND-RESP}\n"
          + "           Display {$COMMAND-RESP2}\n"
          + "           EXEC CICS GET CONTAINER({$data-cont})\n"
          + "                         channel({$outbound-channel})\n"
          + "                         SET({$data-cont-ptr})\n"
          + "                         FLENGTH({$Scratch-len})\n"
          + "                         resp({$COMMAND-RESP})\n"
          + "                         resp2({$COMMAND-RESP2})\n"
          + "           END-EXEC\n"
          + "           exec cics delete container({$xml-cont})\n"
          + "                         channel({$outbound-channel})\n"
          + "                         resp({$command-resp})\n"
          + "                         resp2({$command-resp2})\n"
          + "           end-exec.\n"
          + "           exec cics put container({$data-cont})\n"
          + "                         channel({$outbound-channel})\n"
          + "                         from({$COMPANYA})\n"
          + "                         flength({$RESULT-LENGTH})\n"
          + "                         resp({$COMMAND-RESP})\n"
          + "                         resp2({$COMMAND-RESP2})\n"
          + "           end-exec\n"
          + "           exec cics transform datatoxml\n"
          + "                         xmltransform({$xmltransformT})\n"
          + "                         channel({$outbound-channel})\n"
          + "                         xmlcontainer({$xml-cont})\n"
          + "                         datcontainer({$data-cont})\n"
          + "                         resp({$COMMAND-RESP})\n"
          + "                         resp2({$COMMAND-RESP2})\n"
          + "           end-exec\n"
          + "           EXEC CICS GET CONTAINER({$xml-cont})\n"
          + "                         channel({$outbound-channel})\n"
          + "                         SET({$DFH-BODY-PTR})\n"
          + "                         FLENGTH({$DFH-BODY-LEN})\n"
          + "                         resp({$COMMAND-RESP})\n"
          + "                         resp2({$COMMAND-RESP2})\n"
          + "           END-EXEC\n"
          + "           Display {$COMMAND-RESP}\n"
          + "           Display {$COMMAND-RESP2}.";

  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, List.of(), Map.of());
  }
}
