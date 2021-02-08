      * Copyright (c) 2021 Broadcom.                                 *
      * The term "Broadcom" refers to Broadcom Inc. and/or its       *
      * subsidiaries.                                                *
      *                                                              *
      * This program and the accompanying materials are made         *
      * available under the terms of the Eclipse Public License 2.0  *
      * which is available at https://www.eclipse.org/legal/epl-2.0/ *
      *                                                              *
      * SPDX-License-Identifier: EPL-2.0                             *
      *                                                              *
      * Contributors:                                                *
      *   Broadcom, Inc. - initial API and implementation            *
      ****************************************************************
       COPY MORECOOL.

       PROGRAM-ID. TESTREPL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PARENT.
      * COPY PAYLIB REPLACING ==01 A== BY ==02 ABCD==.

      * COPY REPL REPLACING ==TAG== BY ==ABC==
      * ==TAR== by ==XYZ==.
      * COPY REPL REPLACING ==TAG== BY DEF.
       COPY PAYLIB REPLACING  A BY PAYROLL1
                         B BY PAY-CODE
                         C BY GROSS-PAY
                         D BY HOURS.

       PROCEDURE DIVISION.
       MAINLINE.
           MOVE 0 TO PAY-CODE OF PAYROLL
           PERFORM NAME3
           MOVE 0 TO ABCD OF PARENT.
           MOVE 0 TO ABC-ID.
           MOVE 0 TO DEF-ID.
       COPY NEW REPLACING ==NAME2== BY ==NAME3== .
           GOBACK.
