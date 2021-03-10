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
000010 IDENTIFICATION DIVISION.
000020 PROGRAM-ID.            VARIABLES.
000030 ENVIRONMENT DIVISION.
000040 CONFIGURATION SECTION.
000050 SPECIAL-NAMES.               C01 IS TOP-OF-PAGE.
000060 INPUT-OUTPUT SECTION.
000070 FILE-CONTROL.
000080     SELECT TRANS-FILE-IN
000090           ASSIGN TO SOMETHING-ELSE.
000100 DATA DIVISION.
000110 FILE SECTION.
000120 FD  TRANS-FILE-IN
000130     LABEL RECORDS ARE STANDARD
000140     DATA RECORD IS FILE-RECORD.
000150 01  FILE-RECORD                             PIC X(113).
000160 01  TERMS-RECORD.
000170     05  TERMS-KEY                           Pic 9(3).
000180     05  filler                              PIC X(68).
000190 WORKING-STORAGE SECTION.
000200 01  TERMS-RECORD.
000210     05  TERMS-KEY                           Pic 9(3).
000220     05  filler                              PICTURE X(69).
000230 01 SOMETHING.
000240     03 ADFSF OCCURS 30 TIMES INDEXED BY INDX.
000250     05 OL-NO PIC X(8).
000260 01  REC-1.
000270         05  REC-1-1  PIC  9(6).
000280         05  REC-1-2.
000290         10  REC-1-2-1  PIC 9.
000300             88  HEADER    VALUE 1 THRU  4.                       adsfasdf
000310             88  SUPPLr    value 2 THROUGH 4.
000320             88  WREHOUSE  VALUE 3.
000330 PROCEDURE DIVISION.
000340     SET INDX TO 1.
000350     MOVE 'asdf' TO REC-1-2-1.