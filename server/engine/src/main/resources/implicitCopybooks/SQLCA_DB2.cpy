******* Copyright (c) 2021 Broadcom.
******* The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
*******
******* This program and the accompanying materials are made
******* available under the terms of the Eclipse Public License 2.0
******* which is available at https://www.eclipse.org/legal/epl-2.0/
*******
******* SPDX-License-Identifier: EPL-2.0
*******
******* Contributors:
******* Broadcom, Inc. - initial API and implementation
        01 SQLCA.
                05 SQLCAID      PIC X(8).
                05 SQLCABC      PIC S9(9) COMP-5.
                05 SQLCODE      PIC S9(9) COMP-5.
                05 SQLERRM.
                49 SQLERRML  PIC S9(4) COMP-5.
                49 SQLERRMC  PIC X(70).
                05 SQLERRP      PIC X(8).
                05 SQLERRD      OCCURS 6 TIMES
                                PIC S9(9) COMP-5.
                05 SQLWARN.
                10 SQLWARN0  PIC X.
                10 SQLWARN1  PIC X.
                10 SQLWARN2  PIC X.
                10 SQLWARN3  PIC X.
                10 SQLWARN4  PIC X.
                10 SQLWARN5  PIC X.
                10 SQLWARN6  PIC X.
                10 SQLWARN7  PIC X.
                05 SQLEXT.
                10 SQLWARN8  PIC X.
                10 SQLWARN9  PIC X.
                10 SQLWARNA  PIC X.
                10 SQLSTATE  PIC X(5).
