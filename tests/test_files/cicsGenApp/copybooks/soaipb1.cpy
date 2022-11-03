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
      *       Commericial policy description
           03 CA-B-Address         PIC X(255).
           03 CA-B-Postcode        PIC X(8).
           03 CA-B-Latitude        PIC X(11).
           03 CA-B-Longitude       PIC X(11).
           03 CA-B-Customer        PIC X(255).
           03 CA-B-PropType        PIC X(255).
           03 CA-B-FirePeril       PIC x(4).
           03 CA-B-FirePremium     PIC x(8).
           03 CA-B-CrimePeril      PIC x(4).
           03 CA-B-CrimePremium    PIC x(8).
           03 CA-B-FloodPeril      PIC x(4).
           03 CA-B-FloodPremium    PIC x(8).
           03 CA-B-WeatherPeril    PIC x(4).
           03 CA-B-WeatherPremium  PIC x(8).
           03 CA-B-Status          PIC x(4).
           03 CA-B-RejectReason    PIC X(255).
           03 CA-B-FILLER          PIC X(30000).
      *    Reduce size to below 32K for WSIM support
