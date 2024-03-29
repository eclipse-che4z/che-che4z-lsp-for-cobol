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
       PROGRAM-ID. TESTREPL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  PARENT.
       COPY REPL REPLACING ==TAG-ID== BY ==ABC-ID==
           ==TAR-ID== by ==XYZ-ID==.

       PROCEDURE DIVISION.
       MAINLINE.
           MOVE 0 TO XYZ-ID.
           MOVE 0 TO ABC-ID.
           MOVE 0 TO DEF-ID.
           GOBACK. 