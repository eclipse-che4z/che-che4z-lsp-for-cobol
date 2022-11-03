      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      ******************************************************************
      *               COPYBOOK for Policy details                      *
      *                                                                *
      *   Structures to map values obtained from DB2 tables:           *
      *   Customer, Policy, Endowment, House and Motor.                *
      *                                                                *
      *   All lengths of policy fields will be defined here so that    *
      *   if any of the DB2 table contents change the lengths will     *
      *   only need to be changed here.                                *
      *                                                                *
      ******************************************************************
       01  WS-POLICY-LENGTHS.
           03 WS-CUSTOMER-LEN          PIC S9(4) COMP VALUE +72.
           03 WS-POLICY-LEN            PIC S9(4) COMP VALUE +72.
           03 WS-ENDOW-LEN             PIC S9(4) COMP VALUE +52.
           03 WS-HOUSE-LEN             PIC S9(4) COMP VALUE +58.
           03 WS-MOTOR-LEN             PIC S9(4) COMP VALUE +65.
           03 WS-COMM-LEN              PIC S9(4) COMP VALUE +1102.
           03 WS-CLAIM-LEN             PIC S9(4) COMP VALUE +546.
           03 WS-FULL-ENDOW-LEN        PIC S9(4) COMP VALUE +124.
           03 WS-FULL-HOUSE-LEN        PIC S9(4) COMP VALUE +130.
           03 WS-FULL-MOTOR-LEN        PIC S9(4) COMP VALUE +137.
           03 WS-FULL-COMM-LEN         PIC S9(4) COMP VALUE +1174.
           03 WS-FULL-CLAIM-LEN        PIC S9(4) COMP VALUE +618.
           03 WS-SUMRY-ENDOW-LEN       PIC S9(4) COMP VALUE +25.

       01  DB2-CUSTOMER.
           03 DB2-FIRSTNAME            PIC X(10).
           03 DB2-LASTNAME             PIC X(20).
           03 DB2-DATEOFBIRTH          PIC X(10).
           03 DB2-HOUSENAME            PIC X(20).
           03 DB2-HOUSENUMBER          PIC X(4).
           03 DB2-POSTCODE             PIC X(8).
           03 DB2-PHONE-MOBILE         PIC X(20).
           03 DB2-PHONE-HOME           PIC X(20).
           03 DB2-EMAIL-ADDRESS        PIC X(100).

       01  DB2-POLICY.
           03 DB2-POLICYTYPE           PIC X.
           03 DB2-POLICYNUMBER         PIC 9(10).
           03 DB2-POLICY-COMMON.
              05 DB2-ISSUEDATE         PIC X(10).
              05 DB2-EXPIRYDATE        PIC X(10).
              05 DB2-LASTCHANGED       PIC X(26).
              05 DB2-BROKERID          PIC 9(10).
              05 DB2-BROKERSREF        PIC X(10).
              05 DB2-PAYMENT           PIC 9(6).

       01  DB2-ENDOWMENT.
           03 DB2-ENDOW-FIXED.
              05 DB2-E-WITHPROFITS      PIC X.
              05 DB2-E-EQUITIES         PIC X.
              05 DB2-E-MANAGEDFUND      PIC X.
              05 DB2-E-FUNDNAME         PIC X(10).
              05 DB2-E-TERM             PIC 9(2).
              05 DB2-E-SUMASSURED       PIC 9(6).
              05 DB2-E-LIFEASSURED      PIC X(31).
           03 DB2-E-PADDINGDATA         PIC X(32611).

       01  DB2-HOUSE.
           03 DB2-H-PROPERTYTYPE       PIC X(15).
           03 DB2-H-BEDROOMS           PIC 9(3).
           03 DB2-H-VALUE              PIC 9(8).
           03 DB2-H-HOUSENAME          PIC X(20).
           03 DB2-H-HOUSENUMBER        PIC X(4).
           03 DB2-H-POSTCODE           PIC X(8).

       01  DB2-MOTOR.
           03 DB2-M-MAKE               PIC X(15).
           03 DB2-M-MODEL              PIC X(15).
           03 DB2-M-VALUE              PIC 9(6).
           03 DB2-M-REGNUMBER          PIC X(7).
           03 DB2-M-COLOUR             PIC X(8).
           03 DB2-M-CC                 PIC 9(4).
           03 DB2-M-MANUFACTURED       PIC X(10).
           03 DB2-M-PREMIUM            PIC 9(6).
           03 DB2-M-ACCIDENTS          PIC 9(6).

       01  DB2-COMMERCIAL.
           03 DB2-B-Address            PIC X(255).
           03 DB2-B-Postcode           PIC X(8).
           03 DB2-B-Latitude           PIC X(11).
           03 DB2-B-Longitude          PIC X(11).
           03 DB2-B-Customer           PIC X(255).
           03 DB2-B-PropType           PIC X(255).
           03 DB2-B-FirePeril          PIC 9(4).
           03 DB2-B-FirePremium        PIC 9(8).
           03 DB2-B-CrimePeril         PIC 9(4).
           03 DB2-B-CrimePremium       PIC 9(8).
           03 DB2-B-FloodPeril         PIC 9(4).
           03 DB2-B-FloodPremium       PIC 9(8).
           03 DB2-B-WeatherPeril       PIC 9(4).
           03 DB2-B-WeatherPremium     PIC 9(8).
           03 DB2-B-Status             PIC 9(4).
           03 DB2-B-RejectReason       PIC X(255).

       01  DB2-CLAIM.
           03 DB2-C-Num                PIC 9(10).
           03 DB2-C-Date               PIC X(10).
           03 DB2-C-Paid               PIC 9(8).
           03 DB2-C-Value              PIC 9(8).
           03 DB2-C-Cause              PIC X(255).
           03 DB2-C-Observations       PIC X(255).
