      * Copyright (c) 2022 Broadcom.                                 *
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
       IDENTIFICATION DIVISION.
        PROGRAM-ID. VSAMTEST.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TEST-ITEM-FIRST.
       05 TEST-RENAME-FIRST PIC X(5).
       66 TEST-RENAME-SECOND RENAMES TEST-RENAME-FIRST.
       01 TEST-ITEM-SECOND REDEFINES TEST-ITEM-FIRST PIC X(5).
       01 COPY MAID ABCD.
       PROCEDURE DIVISION. 
           COPY MAID ABCD.
           MOVE 0 TO TEST-ITEM-FIRST.
           DISPLAY ABCD1.