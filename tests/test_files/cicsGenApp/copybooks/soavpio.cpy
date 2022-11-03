      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      ******************************************************************
      ******************************************************************
      *             M&A Scenario - Lord General Insurance Co.          *
      *                                                                *
      *               COPYBOOK for COMMAREA structure                  *
      *                                                                *
      *     Get valid policy number output comm area                   *
      ******************************************************************
       01  COMMA-DATA.
           03  Comma-Data-Text      Pic X(11).
           03  Comma-Data-Key.
               05  Type             Pic X.
               05  Cust-Num         Pic 9(10).
               05  Pol-Num          Pic 9(10).
           03  FILLER               Pic X(48).
