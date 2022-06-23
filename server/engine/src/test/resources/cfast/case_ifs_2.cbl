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
       PROGRAM-ID. CONDS2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1 PIC 9(9).
       01 WS-NUM2 PIC 9(9).

       PROCEDURE DIVISION.
       A000-PARA.
           IF NOT WS-NUM1 > WS-NUM2
              DISPLAY 'HELLO'
              IF WS-NUM1 > WS-NUM2
                  GO TO A000-PARA
              END-IF
           END-IF
           PERFORM A000-PARA.
           STOP RUN.