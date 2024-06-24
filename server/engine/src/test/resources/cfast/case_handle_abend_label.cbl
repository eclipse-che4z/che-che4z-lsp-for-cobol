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
        PROGRAM-ID.    CBACT01C.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 PRG.
            05 WK1 PIC X.
        PROCEDURE DIVISION.
           EXEC CICS HANDLE ABEND LABEL(SEC1)
           END-EXEC.
        SEC1 SECTION.

