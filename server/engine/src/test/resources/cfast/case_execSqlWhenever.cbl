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
        PROCEDURE DIVISION.
           EXEC SQL  WHENEVER SQLERROR GOTO HANDLER  END-EXEC.
           EXEC SQL  WHENEVER SQLWARNING GO TO HANDLER  END-EXEC.
           EXEC SQL  WHENEVER SQLERROR CONTINUE  END-EXEC.
           EXEC SQL  WHENEVER NOT FOUND GO TO HANDLER END-EXEC.

           EXEC SQL
               SELECT ABC FROM XYZ;
           END-EXEC.
           EXEC SQL  WHENEVER SQLERROR GOTO : HANDLER  END-EXEC.
           EXEC SQL  WHENEVER SQLERROR GO TO : HANDLER  END-EXEC.

        HANDLER.
            DISPLAY "HANDLER".
