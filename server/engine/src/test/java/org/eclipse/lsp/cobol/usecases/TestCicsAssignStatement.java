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
 *   Broadcom, Inc. - initial API and implementation
 */
package org.eclipse.lsp.cobol.usecases;

import org.eclipse.lsp.cobol.usecases.common.CICSTestUtils;
import org.junit.jupiter.api.Test;

/**
 * Test CICS ASSIGN command. Documentation link: <a
 * <a https://www.ibm.com/docs/en/cics-ts/6.x?topic=summary-assign Command</a>
 * <p>This class tests all variations of the CICS ASSIGN command found in the link above.
 */
public class TestCicsAssignStatement {

  private static final String ASSIGN_VALID_ALL =
          "ASSIGN ABCODE('name')\n"
          + "ABDUMP('name')\n"
          + "ABOFFSET('name')\n"
          + "ABPROGRAM('name')\n"
          + "ACTIVITY('name')\n"
          + "ACTIVITYID('name')\n"
          + "ALTSCRNHT('name')\n"
          + "ALTSCRNWD('name')\n"
          + "APLKYBD('name')\n"
          + "APLTEXT('name')\n"
          + "APPLICATION('name')\n"
          + "APPLID('name')\n"
          + "ASRAINTRPT('name')\n"
          + "ASRAKEY('name')\n"
          + "ASRAPSW('name')\n"
          + "ASRAPSW16('name')\n"
          + "ASRAREGS('name')\n"
          + "ASRAREGS64('name')\n"
          + "ASRASPC('name')\n"
          + "ASRASTG('name')\n"
          + "BRIDGE('name')\n"
          + "BTRANS('name')\n"
          + "CHANNEL('name')\n"
          + "CMDSEC('name')\n"
          + "COLOR('name')\n"
          + "CWALENG('name')\n"
          + "DEFSCRNHT('name')\n"
          + "DEFSCRNWD('name')\n"
          + "DESTCOUNT('name')\n"
          + "DESTID('name')\n"
          + "DESTIDLENG('name')\n"
          + "ERRORMSG('name')\n"
          + "ERRORMSGLEN('name')\n"
          + "EWASUPP('name')\n"
          + "FCI('name')\n"
          + "GMMI('name')\n"
          + "GMEXITOPT('name')\n"
          + "HILIGHT('name')\n"
          + "INITPARM('name')\n"
          + "INITPARMLEN('name')\n"
          + "INPARTN('name')\n"
          + "INPUTMSGLEN('name')\n"
          + "INVOKINGPROG('name')\n"
          + "KATAKANA('name')\n"
          + "LANGINUSE('name')\n"
          + "LDCMNEM('name')\n"
          + "LDCNUM('name')\n"
          + "LINKLEVEL('name')\n"
          + "LOCALCCSID('name')\n"
          + "MAJORVERSION('name')\n"
          + "MAPCOLUMN('name')\n"
          + "MAPHEIGHT('name')\n"
          + "MAPLINE('name')\n"
          + "MAPWIDTH('name')\n"
          + "MICROVERSION('name')\n"
          + "MINORVERSION('name')\n"
          + "MSRCONTROL('name')\n"
          + "NATLANGINUSE('name')\n"
          + "NETNAME('name')\n"
          + "NEXTTRANSID('name')\n"
          + "NUMTAB('name')\n"
          + "OPCLASS('name')\n"
          + "OPERKEYS('name')\n"
          + "OPID('name')\n"
          + "OPSECURITY('name')\n"
          + "ORGABCODE('name')\n"
          + "OUTLINE('name')\n"
          + "PAGENUM('name')\n"
          + "PARTNPAGE('name')\n"
          + "PARTNS('name')\n"
          + "PARTNSET('name')\n"
          + "PLATFORM('name')\n"
          + "PRINSYSID('name')\n"
          + "PROCESS('name')\n"
          + "PROCESSTYPE('name')\n"
          + "PROGRAM('name')\n"
          + "PS('name')\n"
          + "QNAME('name')\n"
          + "RESSEC('name')\n"
          + "RESTART('name')\n"
          + "RETURNPROG('name')\n"
          + "SCRNHT('name')\n"
          + "SCRNWD('name')\n"
          + "SIGDATA('name')\n"
          + "SOSI('name')\n"
          + "STARTCODE('name')\n"
          + "STATIONID('name')\n"
          + "SYSID('name')\n"
          + "TASKPRIORITY('name')\n"
          + "TCTUALENG('name')\n"
          + "TELLERID('name')\n"
          + "TERMCODE('name')\n"
          + "TERMPRIORITY('name')\n"
          + "TEXTKYBD('name')\n"
          + "TEXTPRINT('name')\n"
          + "TNADDR('name')\n"
          + "TNIPFAMILY('name')\n"
          + "TNPORT('name')\n"
          + "TRANPRIORITY('name')\n"
          + "TWALENG('name')\n"
          + "UNATTEND('name')\n"
          + "USERID('name')\n"
          + "USERNAME('name')\n"
          + "USERPRIORITY('name')\n"
          + "VALIDATION('name')";

  @Test
  void testAssignValid() {
    CICSTestUtils.noErrorTest(ASSIGN_VALID_ALL);
  }
}
