      * Copyright (c) 2025 Broadcom.                                 *
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
       COPY COPYBOOK.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. mainfile1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.
        01 A PIC X.
        LINKAGE SECTION.
       PROCEDURE DIVISION.
        MAIN-PROCESSING SECTION.
         MAINLINE-PARAGRAPH.
            MOVE FUNCTION FUNC1 to A.
             
             STOP RUN.
       COPY PARS.