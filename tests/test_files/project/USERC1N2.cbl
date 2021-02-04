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
       COPY BOOK1N.
       COPY BOOK2N.
       01 BOOK2-REC.
       01 User-Num1 PIC 9(9).
       01 User-Num2 PIC 9(9).
       01 User-Address.
           05 User-City PIC X(5).
           05 User-Country PIC X(5).
           05 User-Index PIC 9(6).
           05 User-Phone PIC 9(6).

       Procedure Division.
        000-Main-Logic.
           Perform 100-Print-User.
           Stop Run.

        100-Print-User.
           Move 123456789 To User-Num1.
           Move User-Num1 To User-Num2.
           Move 'Wenceslav Square 846/1' To User-Address.
           Move 'Prague' To User-City.
           Move 'CZ' To User-Country.
           Move 11000 To User-Index.
           Move 777123456 To User-Phone.
           Move 777987654 To User-Phone-Mobile.

           Display "User-Num1     : " User-Num1.
           Display "User-Num2     : " User-Num2.
           Display "User-Address  : " User-Address.
           Display "User-City     : " User-City.
           Display "User-Country  : " User-Country.
           Display "User-Index    : " User-Index.
           Display "User-Phone    : " User-Phone.
           Display "User-Phone-M  : " User-Phone-Mobile1.

       End program HELLO-WORLD.
