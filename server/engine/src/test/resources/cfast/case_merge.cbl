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
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SORT.
       DATA DIVISION.

       FILE SECTION.
       SD  SORT-WORK-FILE
           RECORD CONTAINS 80 CHARACTERS
           DATA RECORD IS SORT-WORK-REC.
       01  SORT-WORK-REC.
           05  SWF-PARTNO                      PIC  X(21).
           05  SWF-REST-OF-REC                 PIC  X(43).
           05  SWF-MODEL                       PIC  X(3).
           05  FILLER                          PIC  X(12).
           05  SWF-REC-PAY-CODE                PIC  X.

       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       PROCEDURE DIVISION.
           MERGE SORT-WORK-FILE
               ASCENDING KEY SWF-PARTNO
                   USING SORT-WORK-FILE
                   OUTPUT PROCEDURE OUTPUT-PROCEDURE OF SECTION1.
           STOP RUN.

       PAR1.
           DISPLAY "PAR1".

       PAR2.
           DISPLAY "PAR2".

       PAR3.
           DISPLAY "PAR3".

       INPUT-PAR1.
           PERFORM PAR1.

       INPUT-PAR2.
           PERFORM PAR2.

       SECTION1 SECTION.

       OUTPUT-PAR1.
           PERFORM PAR3.

