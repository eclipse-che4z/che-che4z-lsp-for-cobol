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
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Test;

/**
 * Tests CICS EXCI GET CONTAINER statement. Ref:
 * https://www.ibm.com/docs/en/cics-ts/6.1?topic=interface-exec-cics-link-command-exci
 */
public class TestCicsExciGetContainerStatement {
  public static final String TEXT =
      "       IDENTIFICATION DIVISION.\n"
          + "       PROGRAM-ID. GetContainerEXCI.\n"
          + "       DATA DIVISION.\n"
          + "       WORKING-STORAGE SECTION.\n"
          + "       01  {$*CONTAINER-NAME}        PIC X(10) VALUE 'SAMPLECNT'.\n"
          + "       01  {$*CONTAINER-LENGTH}      PIC S9(4) COMP.\n"
          + "       01  {$*CONTAINER-VALUE}       PIC X(50).\n"
          + "       01  {$*RETURN-CODE}           PIC S9(8) COMP.\n"
          + "\n"
          + "       PROCEDURE DIVISION.\n"
          + "           EXEC CICS HANDLE CONDITION \n"
          + "                   ERRORS \n"
          + "                   RESP({$RETURN-CODE})\n"
          + "           END-EXEC.\n"
          + "\n"
          + "           MOVE LENGTH OF {$CONTAINER-VALUE} TO {$CONTAINER-LENGTH}.\n"
          + "\n"
          + "           EXEC CICS \n"
          + "            GET CONTAINER('container') \n"
          + "                channel ('channel')\n"
          + "                   INTO({$CONTAINER-VALUE})\n"
          + "                   FLENGTH({$CONTAINER-LENGTH})\n"
          + "                   BYTEOFFSET({$CONTAINER-LENGTH})\n"
          + "                   INTOCCSID({$CONTAINER-LENGTH})\n"
          + "                   RETCODE({$RETURN-CODE})\n"
          + "           END-EXEC.\n"
          + "\n"
          + "           IF {$RETURN-CODE} = 0\n"
          + "                   DISPLAY 'Container Value: ' {$CONTAINER-VALUE}\n"
          + "           ELSE\n"
          + "           DISPLAY 'Error getting container value. Return Code: ' \n"
          + "           {$RETURN-CODE}\n"
          + "           END-IF.\n"
          + "\n"
          + "           EXEC CICS RETURN TRANSID('EXCI') END-EXEC.\n"
          + "\n"
          + "           STOP RUN.\n";

    @Test
    void test() {
        UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of());
    }
}
