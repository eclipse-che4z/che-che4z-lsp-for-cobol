      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      ******************************************************************
           03 CA-REQUEST-ID            PIC X(6).
           03 CA-RETURN-CODE           PIC 9(2).
           03 CA-CUSTOMER-NUM          PIC 9(10).
           03 CA-POLICY-NUM            PIC 9(10).
      *       Common policy details
           03 CA-ISSUE-DATE            PIC X(10).
           03 CA-EXPIRY-DATE           PIC X(10).
           03 CA-LASTCHANGED           PIC X(26).
           03 CA-BROKERID              PIC 9(10).
           03 CA-BROKERSREF            PIC X(10).
           03 CA-PAYMENT               PIC 9(6).
      *       House policy description
           03 CA-H-PROPERTY-TYPE       PIC X(15).
           03 CA-H-BEDROOMS            PIC 9(3).
           03 CA-H-VALUE               PIC 9(8).
           03 CA-H-HOUSE-NAME          PIC X(20).
           03 CA-H-HOUSE-NUMBER        PIC X(4).
           03 CA-H-POSTCODE            PIC X(8).
           03 CA-H-FILLER              PIC X(30000).
      *    Reduce size to below 32K for WSIM support
