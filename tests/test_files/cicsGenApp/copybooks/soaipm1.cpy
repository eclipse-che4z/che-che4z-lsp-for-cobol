      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      ******************************************************************
           03 CA-REQUEST-ID            PIC X(6).
           03 CA-RETURN-CODE           PIC 9(2).
           03 CA-CUSTOMER-NUM          PIC 9(10).
           05 CA-POLICY-NUM            PIC 9(10).
      *       Common policy details
           03 CA-ISSUE-DATE            PIC X(10).
           03 CA-EXPIRY-DATE           PIC X(10).
           03 CA-LASTCHANGED           PIC X(26).
           03 CA-BROKERID              PIC 9(10).
           03 CA-BROKERSREF            PIC X(10).
           03 CA-PAYMENT               PIC 9(6).
      *       Motor policy description
           03 CA-M-MAKE                PIC X(15).
           03 CA-M-MODEL               PIC X(15).
           03 CA-M-VALUE               PIC 9(6).
           03 CA-M-REGNUMBER           PIC X(7).
           03 CA-M-COLOUR              PIC X(8).
           03 CA-M-CC                  PIC 9(4).
           03 CA-M-MANUFACTURED        PIC X(10).
           03 CA-M-PREMIUM             PIC 9(6).
           03 CA-M-ACCIDENTS           PIC 9(6).
           03 CA-M-FILLER              PIC X(30000).
      *    Reduce size to below 32K for WSIM support
