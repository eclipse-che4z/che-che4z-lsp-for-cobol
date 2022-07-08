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
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       01 WS-NUM2 PIC 9(9).
       01 WS-NUM3 PIC 9(5).
       01 WS-NUM4 PIC 9(6).

       PROCEDURE DIVISION.
       A000-PARA.
           MOVE 25 TO WS-NUM1 WS-NUM3.
           MOVE 15 TO WS-NUM2 WS-NUM4.
   
           IF WS-NUM1 > WS-NUM2 THEN
               DISPLAY 'IN LOOP 1 - IF BLOCK'
      
               IF WS-NUM3 = WS-NUM4 THEN
                   DISPLAY 'IN LOOP 2 - IF BLOCK'
               ELSE
                   DISPLAY 'IN LOOP 2 - ELSE BLOCK'
               END-IF
           ELSE
               GO TO A001-PARA
           END-IF.
       A001-PARA.
           STOP RUN.