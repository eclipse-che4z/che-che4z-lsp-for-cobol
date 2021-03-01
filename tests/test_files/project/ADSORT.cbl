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
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADSORT.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WORK-VARIABLES.
           05  INSERT-NUM     PIC S9(8) COMP SYNC.

       01  ARRAY-SUBSCRIPTS.
           05  MOVE-FROM      PIC S9(8) COMP SYNC.
           05  INSERT-TO      PIC S9(8) COMP SYNC.

       01  MODULE-NAME-1     PIC X(8) VALUE 'STRLTH'.
       01  XCTL1             PIC X(8) VALUE 'DTEVAL'.

       LINKAGE SECTION.
       01  ARRAY-SIZE         PIC S9(8) COMP.
       01  ARRAY-OF-NUMBERS.
           05  NUM            PIC S9(8) COMP
                     OCCURS 0 TO 1000 TIMES DEPENDING ON ARRAY-SIZE.

       PROCEDURE DIVISION USING ARRAY-SIZE, ARRAY-OF-NUMBERS.

      * PASS THROUGH THE ARRAY FROM FRONT TO BACK
      * MOVE-FROM IS THE LOCATION OF THE ITEM CURRENTLY BEING SORTED

           PERFORM VARYING MOVE-FROM FROM 2 BY 1
             UNTIL ( MOVE-FROM > ARRAY-SIZE )
      *          ***INSERT-NUM IS THE NEXT ITEM TO BE SORTED
               MOVE NUM(MOVE-FROM) TO INSERT-NUM
      *          ***WORK BACKWARDS THROUGH ARRAY, FIND WHERE TO INSERT
               COMPUTE INSERT-TO = MOVE-FROM - 1
               PERFORM  UNTIL (   (NUM(INSERT-TO) <= INSERT-NUM)
                               OR (INSERT-TO <= 0) )
                   MOVE NUM(INSERT-TO) TO NUM(INSERT-TO + 1)
                   COMPUTE INSERT-TO = INSERT-TO - 1
               END-PERFORM
      *          ***INSERT THIS ITEM INTO CORRECT SLOT
               MOVE INSERT-NUM     TO NUM(INSERT-TO + 1)
           END-PERFORM.

      * Calls
           CALL 'TRTMNT'.
           CALL MODULE-NAME-1.
           EXEC CICS XCTL PROGRAM (XCTL1) END-EXEC.
           GOBACK.