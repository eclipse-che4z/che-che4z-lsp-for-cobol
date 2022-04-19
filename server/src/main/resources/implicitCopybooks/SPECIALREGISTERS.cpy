      * Copyright (c) 2021 Broadcom.
      * The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
      *
      * This program and the accompanying materials are made
      * available under the terms of the Eclipse Public License 2.0
      * which is available at https://www.eclipse.org/legal/epl-2.0/
      *
      * SPDX-License-Identifier: EPL-2.0
      *
      * Contributors:
      * Broadcom, Inc. - initial API and implementation
       01 DEBUG-ITEM.
             02 DEBUG-LINE PIC X(6).
             02 FILLER PIC X VALUE SPACE.
             02 DEBUG-NAME PIC X(30).
             02 FILLER PIC X VALUE SPACE.
             02 DEBUG-SUB-1  PIC S9999  SIGN IS
                  LEADING SEPARATE CHARACTER.
             02 FILLER PIC X VALUE SPACE.
             02 DEBUG-SUB-2  PIC S9999  SIGN IS
                  LEADING SEPARATE CHARACTER.
             02 FILLER PIC X.
             02 DEBUG-SUB-3  PIC S9999  SIGN IS
                  LEADING SEPARATE CHARACTER.
             02 FILLER PIC X VALUE SPACE.
             02 DEBUG-CONTENTS PIC X(999).
       01 JNIENVPTR  POINTER.
       01 JSON-CODE PIC S9(9) BINARY.
       01 JSON-STATUS PIC S9(9) BINARY.
       01 XML-INFORMATION PIC S9(9) BINARY.
       01 XML-NAMESPACE PIC S9(9) BINARY.
       01 XML-NNAMESPACE PIC S9(9) BINARY.
       01 XML-NAMESPACE-PREFIX PIC S9(9) BINARY.
       01 XML-NNAMESPACE-PREFIX PIC S9(9) BINARY.
       01 XML-CODE PIC S9(9) BINARY.
       01 XML-TEXT DISPLAY PIC X(30) VALUE SPACE.
       01 XML-NTEXT DISPLAY PIC X(30) VALUE SPACE.
       01 LINE-COUNTER PIC S9(9) COMP SYNC.
       01 PAGE-COUNTER PIC S9(9) COMP SYNC.
       01 RETURN-CODE GLOBAL PIC S9(4) BINARY.
       01 SHIFT-OUT GLOBAL PIC X(1) DISPLAY VALUE X"0E".
       01 SHIFT-IN GLOBAL PIC X(1) DISPLAY VALUE X"0F".
       01 SORT-CONTROL GLOBAL PIC X(8) DISPLAY VALUE X"IGZSRTCD".
       01 SORT-CORE-SIZE GLOBAL PIC S9(8) BINARY VALUE X"ZERO".
       01 SORT-FILE-SIZE GLOBAL PIC S9(8) BINARY VALUE X"ZERO".
       01 SORT-MESSAGE GLOBAL PIC X(8) DISPLAY VALUE X"SYSOUT".
       01 SORT-MODE-SIZE GLOBAL PIC S9(5) USAGE BINARY VALUE ZERO.
       01 SORT-RETURN GLOBAL PIC S9(4) USAGE BINARY VALUE ZERO.
       01 TALLY GLOBAL PIC 9(5) USAGE BINARY VALUE ZERO.
       01 WHEN-COMPILED GLOBAL PIC X(16) USAGE DISPLAY.
       01 DAY PIC 9(7).
       01 DATE PIC 9(8).
       01 DAY-OF-WEEK PIC 9(1).
       01 TIME PIC 9(8).