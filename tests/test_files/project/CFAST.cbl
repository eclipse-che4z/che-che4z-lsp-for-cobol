      * Copyright (c) 2024 Broadcom.                                 *
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
       Program-id. MAIN.
       Procedure Division.
           DISPLAY "MAIN".
       
       Identification Division.
       Program-id. NESTED1.
       Procedure Division.
           DISPLAY "NESTED1".
       End program NESTED1.
       
       End program MAIN.


       Identification Division.
       Program-id. MAIN2.
       Procedure Division.
           DISPLAY "MAIN2".
       End program MAIN2.
