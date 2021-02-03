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
       Identification Division.
       Program-id. HELLO-WORLD.
       Data Division.
       Working-Storage Section.
       01 SUBNAME PIC 9(9).
       01 Variable PIC 9(9).
       Procedure Division.
           call SUBNAME  using VARIABLE.
           call SUBNAME using by VALUE Variable.
           call SUBNAME  using by content VARIABLE.
           call SUBNAME  using by reference VARIABLE.
       End program HELLO-WORLD.