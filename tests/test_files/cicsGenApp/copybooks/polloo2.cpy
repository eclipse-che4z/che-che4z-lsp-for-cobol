      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      ******************************************************************
       01 REQUEST.
           03 CA-CUSPOL-REQUEST
           05 CA-POLICIES OCCURS 5 TIMES.
           07 CA-POLICY-NUMBER PIC 9(10) DISPLAY.
           07 CA-POLICY-TYPE PIC X(1) DISPLAY.
           03 CA-POLICY-DATA PIC X(32427).
