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
       01  PARENT PIC 9.
       01  CHILD1 PIC 9.
       PROCEDURE DIVISION.
       MAINLINE.
           MOVE 0 TO   CHILD1   OF   PARENT.
           MOVE 0 TO   CHILD2   OF    PARENT.
           GOBACK.

