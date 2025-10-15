      * Copyright (c) 2025 Broadcom.
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
       PROGRAM-ID. PROG.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
           EXEC CICS HANDLE ABEND LABEL(CLEAN-UP)
           END-EXEC.

       MAIN-LOGIC.
           PERFORM PARAGRAPH-A
           STOP RUN.

       PARAGRAPH-A.
           PERFORM PARAGRAPH-B.

       PARAGRAPH-B.
           EXEC CICS ABEND
                ABCODE('AB01')                
           END-EXEC
           PERFORM PARAGRAPH-C.

       PARAGRAPH-C.
           PERFORM PARAGRAPH-D.

       PARAGRAPH-D.
           EXIT.

       CLEAN-UP.
           STOP RUN.