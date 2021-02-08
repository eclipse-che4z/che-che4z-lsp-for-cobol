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
       01 Variable PIC 9(9).
       01 Name PIC 9(9).
       Procedure Division.
           call 'SUB1'.
           call 'SUB2'.
           call 'SUB3'.
       End program HELLO-WORLD.