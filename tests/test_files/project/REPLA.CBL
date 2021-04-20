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
       COPY MORECOOL.
       01  PARENT.
       PROCEDURE DIVISION.
       MAINLINE.
           MOVE 0 TO XYZ-ID.
           MOVE 0 TO ABC-ID.
           MOVE 0 TO DEF-ID.
       COPY NEW REPLACING ==:NAME2:== BY ==NAME3== .
           GOBACK. 