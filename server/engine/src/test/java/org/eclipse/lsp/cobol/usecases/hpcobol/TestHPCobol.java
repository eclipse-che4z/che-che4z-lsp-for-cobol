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
package org.eclipse.lsp.cobol.usecases.hpcobol;

import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import org.eclipse.lsp.cobol.common.dialects.CobolLanguageId;
import org.eclipse.lsp.cobol.test.engine.UseCaseEngine;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

/** Sample test for HP Cobol language id. */
public class TestHPCobol {
  public static final String TEXT =
      "?SAVE ALL\n"
          + "?SAVEABEND\n"
          + "?SYMBOLS\n"
          + "?HEADING \"DUMMY MODULE TO SHOW USE of DOLLAR ZERO\"\n"
          + "\n"
          + " IDENTIFICATION DIVISION.\n"
          + "*************************\n"
          + "\n"
          + "    PROGRAM-ID.                  AAABCD001.\n"
          + "\n"
          + "********************************************************************************\n"
          + "*                                                                              *\n"
          + "* This is a dummy program for testing                                          *\n"
          + "*                                                                              *\n"
          + "********************************************************************************\n"
          + "\n"
          + "********************************************************************************\n"
          + "*                           PROGRAM HISTORY                                    *\n"
          + "*                                                                              *\n"
          + "* DEV/CR         DATE  INITS  DESCRIPTION                        CIS   Release *\n"
          + "*               030423  CT    Initial version.                   1.0           *\n"
          + "*               180523  CT    Comment added for    test          1.0           *\n"
          + "********************************************************************************\n"
          + "/\n"
          + " ENVIRONMENT DIVISION.\n"
          + "**********************\n"
          + "\n"
          + " CONFIGURATION SECTION.\n"
          + "\n"
          + " SOURCE-COMPUTER.                TANDEM.\n"
          + " OBJECT-COMPUTER.                TANDEM.\n"
          + "\n"
          + "\n"
          + "/\n"
          + " DATA DIVISION.\n"
          + "***************\n"
          + "\n"
          + "\n"
          + " WORKING-STORAGE SECTION.\n"
          + "\n"
          + "/\n"
          + "*LOCAL WORKING STORAGE\n"
          + "**********************\n"
          + "\n"
          + " 01 {$*W-RECEIVE-COUNT}                      PIC 9(04).\n"
          + " 01 {$*W-DOLLAR-ZERO-BUFFER-LENGTH}          PIC 9(04) COMP.\n"
          + "\n"
          + "*MODULE LINKAGES.\n"
          + "*****************\n"
          + "\n"
          + " LINKAGE SECTION.\n"
          + "\n"
          + " PROCEDURE DIVISION.\n"
          + "********************\n"
          + "\n"
          + "\n"
          + " {@*MAIN-CONTROL} SECTION.\n"
          + " {#*MAIN-0}.\n"
          + "********************************************************************************\n"
          + "*                                                                              *\n"
          + "* This section controls the overall processing within the module.              *\n"
          + "*                                                                              *\n"
          + "********************************************************************************\n"
          + "\n"
          + "     PERFORM {@A-COMMON-INITIALISATION}\n"
          + "\n"
          + "     PERFORM {@B-SPECIFIC-INITIALISATION}\n"
          + "\n"
          + "     PERFORM {@C-PROCESS-REQUEST}\n"
          + "     .\n"
          + " {#*MAIN-EXIT}.\n"
          + "     EXIT PROGRAM.\n"
          + "/\n"
          + " {@*A-COMMON-INITIALISATION} SECTION.\n"
          + " {#*A-0}.\n"
          + "********************************************************************************\n"
          + "*                                                                              *\n"
          + "* This section initialises standard control and event data.                    *\n"
          + "*                                                                              *\n"
          + "********************************************************************************\n"
          + "\n"
          + "        MOVE \"ABCDEFGHIJKLMNOQPRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWX\" TO {$W-DOLLAR-ZERO-BUFFER-LENGTH}\n"
          + " .\n"
          + "\n"
          + " {#*A-EXIT}.\n"
          + "     EXIT.\n"
          + "/\n"
          + " {@*B-SPECIFIC-INITIALISATION} SECTION.\n"
          + " {#*B-0}.\n"
          + "********************************************************************************\n"
          + "*                                                                              *\n"
          + "* This section is used to perform specific initialisation.                     *\n"
          + "*                                                                              *\n"
          + "********************************************************************************\n"
          + "\n"
          + "        CONTINUE\n"
          + " .\n"
          + " {#*B-EXIT}.\n"
          + "     EXIT.\n"
          + "/\n"
          + " {@*C-PROCESS-REQUEST} SECTION.\n"
          + " {#*C-0}.\n"
          + "********************************************************************************\n"
          + "*                                                                              *\n"
          + "* This section controls the processing of the request message received.        *\n"
          + "*                                                                              *\n"
          + "********************************************************************************\n"
          + "\n"
          + "     CONTINUE\n"
          + "     .\n"
          + " {#*C-EXIT}.\n"
          + "     EXIT.\n"
          + "/\n"
          + "\n"
          + "********************************************************************************\n"
          + "*                     E N D     O F     P R O G R A M                          *\n"
          + "********************************************************************************";

  @Disabled("HP-COBOL analysis is disabled")
  @Test
  void test() {
    UseCaseEngine.runTest(TEXT, ImmutableList.of(), ImmutableMap.of(), CobolLanguageId.HP_COBOL);
  }
}
