       PROCESS SQL
      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2021                             *
      *                                                                *
      *                    Inquire Policy                              *
      *                                                                *
      *   To obtain full details of an individual policy:              *
      *     Endowment, House, Motor, Commercial                        *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGIPDB01.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.

       WORKING-STORAGE SECTION.

        01 TSAREA.
          03  TSAREAPOSTCODE           Pic X(8).
          03  Filler                   Pic X Value Spaces.
          03  TSAREACUSTNUM            Pic 9(10).
          03  Filler                   Pic X Value Spaces.
          03  TSAREAPOLNUM             Pic 9(10).
          03  Filler                   Pic X Value Spaces.
      *----------------------------------------------------------------*
      * Common defintions                                              *
      *----------------------------------------------------------------*
      * Run time (debug) infomation for this invocation
        01  WS-HEADER.
           03 WS-EYECATCHER            PIC X(16)
                                        VALUE 'LGIPOL01------WS'.
           03 WS-TRANSID               PIC X(4).
           03 WS-TERMID                PIC X(4).
           03 WS-TASKNUM               PIC 9(7).
           03 WS-FILLER                PIC X.
           03 WS-ADDR-DFHCOMMAREA      USAGE is POINTER.
           03 WS-CALEN                 PIC S9(4) COMP.

      * Variables for time/date processing
       01  ABS-TIME                    PIC S9(8) COMP VALUE +0.
       01  TIME1                       PIC X(8)  VALUE SPACES.
       01  DATE1                       PIC X(10) VALUE SPACES.

      * Error Message structure
       01  ERROR-MSG.
           03 EM-DATE                  PIC X(8)  VALUE SPACES.
           03 FILLER                   PIC X     VALUE SPACES.
           03 EM-TIME                  PIC X(6)  VALUE SPACES.
           03 FILLER                   PIC X(9)  VALUE ' LGIPOL01'.
           03 EM-VARIABLE.
             05 FILLER                 PIC X(6)  VALUE ' CNUM='.
             05 EM-CUSNUM              PIC X(10)  VALUE SPACES.
             05 FILLER                 PIC X(6)  VALUE ' PNUM='.
             05 EM-POLNUM              PIC X(10)  VALUE SPACES.
             05 EM-SQLREQ              PIC X(16) VALUE SPACES.
             05 FILLER                 PIC X(9)  VALUE ' SQLCODE='.
             05 EM-SQLRC               PIC +9(5) USAGE DISPLAY.

       01  CA-ERROR-MSG.
           03 FILLER                   PIC X(9)  VALUE 'COMMAREA='.
           03 CA-DATA                  PIC X(90) VALUE SPACES.
      *----------------------------------------------------------------*

      *----------------------------------------------------------------*
      * Definitions required for data manipulation                     *
      *----------------------------------------------------------------*
       01 MINUS-ONE                    PIC S9(4) COMP VALUE -1.

       01  WS-COMMAREA-LENGTHS.
           03 WS-CA-HEADERTRAILER-LEN  PIC S9(4) COMP VALUE +33.
           03 WS-REQUIRED-CA-LEN       PIC S9(4)      VALUE +0.

      * Position of first char in commarea after end of policy data
      * for use when placing end of data indicator
       01  END-POLICY-POS              PIC S9(4) COMP VALUE +1.

       01  ICOM-Record-Count           PIC S9(4) COMP.
       01  ICOM-Length                 PIC S9(8) COMP Value 32767.
       01  ICOM-Data-Length            PIC S9(8) binary.
       01  ICOM-Pointer                Usage is Pointer.
       01  ICOM-Pointer-Start          Usage is Pointer.
       01  ICOM-Container              Pic X(16) Value 'ICOM-Data'.
       01  ICOM-Channel                Pic X(16) Value 'ICOM'.
       01  WS-Request-ID               Pic X(6).
       01  WS-Resp                     Pic S9(8) Comp.

      *----------------------------------------------------------------*
      *    DB2 CONTROL
      *----------------------------------------------------------------*
      *----------------------------------------------------------------*
      * Declare Cursors
      *----------------------------------------------------------------*
           EXEC SQL
             DECLARE Cust_Cursor Insensitive Scroll Cursor For
             SELECT
                   CustomerNumber,
                   Policy.PolicyNumber,
                   RequestDate,
                   StartDate,
                   RenewalDate,
                   Address,
                   Zipcode,
                   LatitudeN,
                   LongitudeW,
                   Customer,
                   PropertyType,
                   FirePeril,
                   FirePremium,
                   CrimePeril,
                   CrimePremium,
                   FloodPeril,
                   FloodPremium,
                   WeatherPeril,
                   WeatherPremium,
                   Status,
                   RejectionReason
             FROM  POLICY,COMMERCIAL
             WHERE ( POLICY.POLICYNUMBER =
                        Commercial.POLICYNUMBER AND
                     Policy.CustomerNumber =
                        :DB2-CUSTOMERNUM-INT  )
           END-EXEC.
      *----------------------------------------------------------------*
           EXEC SQL
             DECLARE Zip_Cursor Insensitive Scroll Cursor For
             SELECT
                   CustomerNumber,
                   Policy.PolicyNumber,
                   RequestDate,
                   StartDate,
                   RenewalDate,
                   Address,
                   Zipcode,
                   LatitudeN,
                   LongitudeW,
                   Customer,
                   PropertyType,
                   FirePeril,
                   FirePremium,
                   CrimePeril,
                   CrimePremium,
                   FloodPeril,
                   FloodPremium,
                   WeatherPeril,
                   WeatherPremium,
                   Status,
                   RejectionReason
             FROM  POLICY,COMMERCIAL
             WHERE ( POLICY.POLICYNUMBER =
                        Commercial.POLICYNUMBER   AND
                     Commercial.Zipcode =
                        :CA-B-POSTCODE  )
           END-EXEC.
      *----------------------------------------------------------------*
           EXEC SQL
             DECLARE CusClaim_Cursor Insensitive Scroll Cursor For
             SELECT
                   POLICY.CustomerNumber,
                   ClaimNumber,
                   CLAIM.PolicyNumber,
                   ClaimDate,
                   Paid,
                   Value,
                   Cause,
                   Observations
             FROM  POLICY,CLAIM
             WHERE ( POLICY.POLICYNUMBER =
                        CLAIM.POLICYNUMBER   AND
                     POLICY.CustomerNumber =
                        :DB2-CUSTOMERNUM-INT)
           END-EXEC.

      * SQLCA DB2 communications area
           EXEC SQL
               INCLUDE SQLCA
           END-EXEC.


      *----------------------------------------------------------------*
      * Definitions required by SQL statement                          *
      *   DB2 datatypes to COBOL equivalents                           *
      *     SMALLINT    :   PIC S9(4) COMP                             *
      *     INTEGER     :   PIC S9(9) COMP                             *
      *     DATE        :   PIC X(10)                                  *
      *     TIMESTAMP   :   PIC X(26)                                  *
      *----------------------------------------------------------------*
      * Host variables for input to DB2 integer types
       01 DB2-IN-INTEGERS.
           03 DB2-CUSTOMERNUM-INT      PIC S9(9) COMP VALUE +0.
           03 DB2-POLICYNUM-INT        PIC S9(9) COMP VALUE +0.
           03 DB2-CLAIMNUM-INT         PIC S9(9) COMP VALUE +0.
       01 DB2-OUT-INTEGERS.
           03 DB2-BROKERID-INT         PIC S9(9) COMP.
           03 DB2-PAYMENT-INT          PIC S9(9) COMP.
           03 DB2-E-TERM-SINT          PIC S9(4) COMP.
           03 DB2-E-SUMASSURED-INT     PIC S9(9) COMP.
           03 DB2-E-PADDING-LEN        PIC S9(9) COMP.
           03 DB2-H-BEDROOMS-SINT      PIC S9(4) COMP.
           03 DB2-H-VALUE-INT          PIC S9(9) COMP.
           03 DB2-M-VALUE-INT          PIC S9(9) COMP.
           03 DB2-M-CC-SINT            PIC S9(4) COMP.
           03 DB2-M-PREMIUM-INT        PIC S9(9) COMP.
           03 DB2-M-ACCIDENTS-INT      PIC S9(9) COMP.
           03 DB2-B-FirePeril-Int      PIC S9(4) COMP.
           03 DB2-B-FirePremium-Int    PIC S9(9) COMP.
           03 DB2-B-CrimePeril-Int     PIC S9(4) COMP.
           03 DB2-B-CrimePremium-Int   PIC S9(9) COMP.
           03 DB2-B-FloodPeril-Int     PIC S9(4) COMP.
           03 DB2-B-FloodPremium-Int   PIC S9(9) COMP.
           03 DB2-B-WeatherPeril-Int   PIC S9(4) COMP.
           03 DB2-B-WeatherPremium-Int PIC S9(9) COMP.
           03 DB2-B-Status-Int         PIC S9(4) COMP.
           03 DB2-C-Paid-int           PIC S9(9) COMP.
           03 DB2-C-Value-int          PIC S9(9) COMP.

      * Policy descriptions to receive output from DB2
      * Must be an SQL INCLUDE so available to SQL pre-compiler
           EXEC SQL
             INCLUDE LGPOLICY
           END-EXEC.

      * Indicator variables for columns which could return nulls
      *   if these are not specified and SQL FETCH tries to return
      *   null value for a listed column it will FAIL with SQLCODE=-305
       77  IND-BROKERID                PIC S9(4) COMP.
       77  IND-BROKERSREF              PIC S9(4) COMP.
       77  IND-PAYMENT                 PIC S9(4) COMP.
       77  IND-E-PADDINGDATA           PIC S9(4) COMP.
       77  IND-E-PADDINGDATAL          PIC S9(4) COMP.

      *----------------------------------------------------------------*


      ******************************************************************
      *    L I N K A G E     S E C T I O N
      ******************************************************************
       LINKAGE SECTION.

       01  DFHCOMMAREA.
           EXEC SQL
             INCLUDE LGCMAREA
           END-EXEC.

       01  ICOM-Record                 Pic X(1202).

      ******************************************************************
      *    P R O C E D U R E S
      ******************************************************************
       PROCEDURE DIVISION.

      *----------------------------------------------------------------*
       MAINLINE SECTION.

      *----------------------------------------------------------------*
      * Common code                                                    *
      *----------------------------------------------------------------*
      * initialize working storage variables
           INITIALIZE WS-HEADER.
      * set up general variable
           MOVE EIBTRNID TO WS-TRANSID.
           MOVE EIBTRMID TO WS-TERMID.
           MOVE EIBTASKN TO WS-TASKNUM.
      *----------------------------------------------------------------*
      * initialize DB2 host variables
           INITIALIZE DB2-IN-INTEGERS.
           INITIALIZE DB2-OUT-INTEGERS.
           INITIALIZE DB2-POLICY.

      *---------------------------------------------------------------*

           Exec Cics Get Container(ICOM-Container)
                         Channel(ICOM-Channel)
                         Flength(ICOM-Data-Length)
                         Set(ICOM-Pointer)
                         Resp(WS-RESP)
           End-Exec.
           If WS-RESP = DFHRESP(NORMAL)
             Set ICOM-Pointer-Start   To ICOM-Pointer
             Set Address Of DFHCOMMAREA To ICOM-Pointer
             Move CA-Request-ID    To WS-Request-ID
             Move CA-Customer-Num  To DB2-Customernum-Int
           Else
      *---------------------------------------------------------------*
      * Check commarea and obtain required details                    *
      *---------------------------------------------------------------*
      * If NO commarea received issue an ABEND
             IF EIBCALEN IS EQUAL TO ZERO
               MOVE ' NO COMMAREA RECEIVED' TO EM-VARIABLE
               PERFORM WRITE-ERROR-MESSAGE
               EXEC CICS ABEND ABCODE('LGCA') NODUMP END-EXEC
             END-IF

      * initialize commarea return code to zero
             MOVE '00' TO CA-RETURN-CODE
             MOVE EIBCALEN TO WS-CALEN
             SET WS-ADDR-DFHCOMMAREA TO ADDRESS OF DFHCOMMAREA

      * Convert commarea customer & policy nums to DB2 integer format
             MOVE CA-CUSTOMER-NUM TO DB2-CUSTOMERNUM-INT
             MOVE CA-POLICY-NUM   TO DB2-POLICYNUM-INT
      * and save in error msg field incase required
             MOVE CA-CUSTOMER-NUM TO EM-CUSNUM
             MOVE CA-POLICY-NUM   TO EM-POLNUM

      *----------------------------------------------------------------*
      * Check which policy type is being requested                     *
      * This is not actually required whilst only endowment policy     *
      * inquires are supported, but will make future expansion simpler *
      *----------------------------------------------------------------*
      * Upper case value passed in Request Id field                    *
             MOVE FUNCTION UPPER-CASE(CA-REQUEST-ID) TO WS-REQUEST-ID
           End-If

           EVALUATE WS-REQUEST-ID

             WHEN '01IEND'
               INITIALIZE DB2-ENDOWMENT
               PERFORM GET-ENDOW-DB2-INFO

             WHEN '01IHOU'
               INITIALIZE DB2-HOUSE
               PERFORM GET-HOUSE-DB2-INFO

             WHEN '01IMOT'
               INITIALIZE DB2-MOTOR
               PERFORM GET-MOTOR-DB2-INFO

             WHEN '01ICOM'
               INITIALIZE DB2-COMMERCIAL
               PERFORM GET-COMMERCIAL-DB2-INFO-1

             WHEN '02ICOM'
               INITIALIZE DB2-COMMERCIAL
               PERFORM GET-COMMERCIAL-DB2-INFO-2

             WHEN '03ICOM'
               INITIALIZE DB2-COMMERCIAL
               PERFORM GET-COMMERCIAL-DB2-INFO-3

             WHEN '05ICOM'
               INITIALIZE DB2-COMMERCIAL
               PERFORM GET-COMMERCIAL-DB2-INFO-5

             WHEN '01ICLM'
               INITIALIZE DB2-CLAIM
               MOVE CA-C-Num        TO DB2-CLAIMNUM-INT
               PERFORM GET-CLAIM-DB2-INFO-1

             WHEN '02ICLM'
               INITIALIZE DB2-CLAIM
               PERFORM GET-CLAIM-DB2-INFO-2

             WHEN OTHER
               MOVE '99' TO CA-RETURN-CODE

           END-EVALUATE.

       End-Program.
           EXEC CICS RETURN END-EXEC.

       MAINLINE-EXIT.
           EXIT.
      *----------------------------------------------------------------*


      *================================================================*
      * Use Select on join of Policy and Endowment tables to obtain    *
      * single row that matches customer and policy number requested.  *
      * NOTE: because we do not know length of varchar yet - we must   *
      *      put output of DB2 SELECT into working storage to avoid    *
      *      risk of overwriting CICS storage beyond commarea.         *
      *================================================================*
       GET-ENDOW-DB2-INFO.

           MOVE ' SELECT ENDOW ' TO EM-SQLREQ
           EXEC SQL
             SELECT  ISSUEDATE,
                     EXPIRYDATE,
                     LASTCHANGED,
                     BROKERID,
                     BROKERSREFERENCE,
                     PAYMENT,
                     WITHPROFITS,
                     EQUITIES,
                     MANAGEDFUND,
                     FUNDNAME,
                     TERM,
                     SUMASSURED,
                     LIFEASSURED,
                     PADDINGDATA,
                     LENGTH(PADDINGDATA)
             INTO  :DB2-ISSUEDATE,
                   :DB2-EXPIRYDATE,
                   :DB2-LASTCHANGED,
                   :DB2-BROKERID-INT INDICATOR :IND-BROKERID,
                   :DB2-BROKERSREF INDICATOR :IND-BROKERSREF,
                   :DB2-PAYMENT-INT INDICATOR :IND-PAYMENT,
                   :DB2-E-WITHPROFITS,
                   :DB2-E-EQUITIES,
                   :DB2-E-MANAGEDFUND,
                   :DB2-E-FUNDNAME,
                   :DB2-E-TERM-SINT,
                   :DB2-E-SUMASSURED-INT,
                   :DB2-E-LIFEASSURED,
                   :DB2-E-PADDINGDATA INDICATOR :IND-E-PADDINGDATA,
                   :DB2-E-PADDING-LEN INDICATOR :IND-E-PADDINGDATAL
             FROM  POLICY,ENDOWMENT
             WHERE ( POLICY.POLICYNUMBER =
                        ENDOWMENT.POLICYNUMBER   AND
                     POLICY.CUSTOMERNUMBER =
                        :DB2-CUSTOMERNUM-INT             AND
                     POLICY.POLICYNUMBER =
                        :DB2-POLICYNUM-INT               )
           END-EXEC

           IF SQLCODE = 0
      *      Select was successful

      *      Calculate size of commarea required to return all data
             ADD WS-CA-HEADERTRAILER-LEN TO WS-REQUIRED-CA-LEN
             ADD WS-FULL-ENDOW-LEN       TO WS-REQUIRED-CA-LEN

      *----------------------------------------------------------------*
      *      Specific code to allow for length of VACHAR data
      *      check whether PADDINGDATA field is non-null
      *        and calculate length of endowment policy
      *        and position of free space in commarea after policy data
      *----------------------------------------------------------------*
             IF IND-E-PADDINGDATAL NOT EQUAL MINUS-ONE
               ADD DB2-E-PADDING-LEN TO WS-REQUIRED-CA-LEN
               ADD DB2-E-PADDING-LEN TO END-POLICY-POS
             END-IF

      *      if commarea received is not large enough ...
      *        set error return code and return to caller
             IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
               MOVE '98' TO CA-RETURN-CODE
               EXEC CICS RETURN END-EXEC
             ELSE
      *        Length is sufficent so move data to commarea
      *        Move Integer fields to required length numerics
      *        Don't move null fields
               IF IND-BROKERID NOT EQUAL MINUS-ONE
                 MOVE DB2-BROKERID-INT    TO DB2-BROKERID
               END-IF
               IF IND-PAYMENT NOT EQUAL MINUS-ONE
                 MOVE DB2-PAYMENT-INT TO DB2-PAYMENT
               END-IF
      *----------------------------------------------------------------*
               MOVE DB2-E-TERM-SINT       TO DB2-E-TERM
               MOVE DB2-E-SUMASSURED-INT  TO DB2-E-SUMASSURED

               MOVE DB2-POLICY-COMMON     TO CA-POLICY-COMMON
               MOVE DB2-ENDOW-FIXED
                   TO CA-ENDOWMENT(1:WS-ENDOW-LEN)
               IF IND-E-PADDINGDATA NOT EQUAL MINUS-ONE
                 MOVE DB2-E-PADDINGDATA TO
                     CA-E-PADDING-DATA(1:DB2-E-PADDING-LEN)
               END-IF
             END-IF

      *      Mark the end of the policy data
             MOVE 'FINAL' TO CA-E-PADDING-DATA(END-POLICY-POS:5)

           ELSE
      *      Non-zero SQLCODE from first SQL FETCH statement
             IF SQLCODE EQUAL 100
      *        No rows found - invalid customer / policy number
               MOVE '01' TO CA-RETURN-CODE
             ELSE
      *        something has gone wrong
               MOVE '90' TO CA-RETURN-CODE
      *        Write error message to TD QUEUE(CSMT)
               PERFORM WRITE-ERROR-MESSAGE
             END-IF

           END-IF.
           EXIT.

      *================================================================*
      * Use Select on join of Policy and House tables to obtain        *
      * single row that matches customer and policy number requested.  *
      * NOTE: because we do not know length of varchar yet - we must   *
      *      put output of DB2 SELECT into working storage to avoid    *
      *      risk of overwriting CICS storage beyond commarea.         *
      *================================================================*
       GET-HOUSE-DB2-INFO.

           MOVE ' SELECT HOUSE ' TO EM-SQLREQ
           EXEC SQL
             SELECT  ISSUEDATE,
                     EXPIRYDATE,
                     LASTCHANGED,
                     BROKERID,
                     BROKERSREFERENCE,
                     PAYMENT,
                     PROPERTYTYPE,
                     BEDROOMS,
                     VALUE,
                     HOUSENAME,
                     HOUSENUMBER,
                     POSTCODE
             INTO  :DB2-ISSUEDATE,
                   :DB2-EXPIRYDATE,
                   :DB2-LASTCHANGED,
                   :DB2-BROKERID-INT INDICATOR :IND-BROKERID,
                   :DB2-BROKERSREF INDICATOR :IND-BROKERSREF,
                   :DB2-PAYMENT-INT INDICATOR :IND-PAYMENT,
                   :DB2-H-PROPERTYTYPE,
                   :DB2-H-BEDROOMS-SINT,
                   :DB2-H-VALUE-INT,
                   :DB2-H-HOUSENAME,
                   :DB2-H-HOUSENUMBER,
                   :DB2-H-POSTCODE
             FROM  POLICY,HOUSE
             WHERE ( POLICY.POLICYNUMBER =
                        HOUSE.POLICYNUMBER   AND
                     POLICY.CUSTOMERNUMBER =
                        :DB2-CUSTOMERNUM-INT             AND
                     POLICY.POLICYNUMBER =
                        :DB2-POLICYNUM-INT               )
           END-EXEC

           IF SQLCODE = 0
      *      Select was successful

      *      Calculate size of commarea required to return all data
             ADD WS-CA-HEADERTRAILER-LEN TO WS-REQUIRED-CA-LEN
             ADD WS-FULL-HOUSE-LEN       TO WS-REQUIRED-CA-LEN

      *      if commarea received is not large enough ...
      *        set error return code and return to caller
             IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
               MOVE '98' TO CA-RETURN-CODE
               EXEC CICS RETURN END-EXEC
             ELSE
      *        Length is sufficent so move data to commarea
      *        Move Integer fields to required length numerics
      *        Don't move null fields
               IF IND-BROKERID NOT EQUAL MINUS-ONE
                 MOVE DB2-BROKERID-INT  TO DB2-BROKERID
               END-IF
               IF IND-PAYMENT NOT EQUAL MINUS-ONE
                 MOVE DB2-PAYMENT-INT TO DB2-PAYMENT
               END-IF
               MOVE DB2-H-BEDROOMS-SINT TO DB2-H-BEDROOMS
               MOVE DB2-H-VALUE-INT     TO DB2-H-VALUE

               MOVE DB2-POLICY-COMMON   TO CA-POLICY-COMMON
               MOVE DB2-HOUSE           TO CA-HOUSE(1:WS-HOUSE-LEN)
             END-IF

      *      Mark the end of the policy data
             MOVE 'FINAL' TO CA-H-FILLER(1:5)

           ELSE
      *      Non-zero SQLCODE from first SQL FETCH statement
             IF SQLCODE EQUAL 100
      *        No rows found - invalid customer / policy number
               MOVE '01' TO CA-RETURN-CODE
             ELSE
      *        something has gone wrong
               MOVE '90' TO CA-RETURN-CODE
      *        Write error message to TD QUEUE(CSMT)
               PERFORM WRITE-ERROR-MESSAGE
             END-IF

           END-IF.
           EXIT.

      *================================================================*
      * Use Select on join of Policy and Motor tables to obtain        *
      * single row that matches customer and policy number requested.  *
      *================================================================*
       GET-MOTOR-DB2-INFO.

           MOVE ' SELECT MOTOR ' TO EM-SQLREQ
           EXEC SQL
             SELECT  ISSUEDATE,
                     EXPIRYDATE,
                     LASTCHANGED,
                     BROKERID,
                     BROKERSREFERENCE,
                     PAYMENT,
                     MAKE,
                     MODEL,
                     VALUE,
                     REGNUMBER,
                     COLOUR,
                     CC,
                     YEAROFMANUFACTURE,
                     PREMIUM,
                     ACCIDENTS
             INTO  :DB2-ISSUEDATE,
                   :DB2-EXPIRYDATE,
                   :DB2-LASTCHANGED,
                   :DB2-BROKERID-INT INDICATOR :IND-BROKERID,
                   :DB2-BROKERSREF INDICATOR :IND-BROKERSREF,
                   :DB2-PAYMENT-INT INDICATOR :IND-PAYMENT,
                   :DB2-M-MAKE,
                   :DB2-M-MODEL,
                   :DB2-M-VALUE-INT,
                   :DB2-M-REGNUMBER,
                   :DB2-M-COLOUR,
                   :DB2-M-CC-SINT,
                   :DB2-M-MANUFACTURED,
                   :DB2-M-PREMIUM-INT,
                   :DB2-M-ACCIDENTS-INT
             FROM  POLICY,MOTOR
             WHERE ( POLICY.POLICYNUMBER =
                        MOTOR.POLICYNUMBER   AND
                     POLICY.CUSTOMERNUMBER =
                        :DB2-CUSTOMERNUM-INT             AND
                     POLICY.POLICYNUMBER =
                        :DB2-POLICYNUM-INT               )
           END-EXEC

           IF SQLCODE = 0
      *      Select was successful

      *      Calculate size of commarea required to return all data
             ADD WS-CA-HEADERTRAILER-LEN TO WS-REQUIRED-CA-LEN
             ADD WS-FULL-MOTOR-LEN       TO WS-REQUIRED-CA-LEN

      *      if commarea received is not large enough ...
      *        set error return code and return to caller
             IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
               MOVE '98' TO CA-RETURN-CODE
               EXEC CICS RETURN END-EXEC
             ELSE
      *        Length is sufficent so move data to commarea
      *        Move Integer fields to required length numerics
      *        Don't move null fields
               IF IND-BROKERID NOT EQUAL MINUS-ONE
                 MOVE DB2-BROKERID-INT TO DB2-BROKERID
               END-IF
               IF IND-PAYMENT NOT EQUAL MINUS-ONE
                 MOVE DB2-PAYMENT-INT    TO DB2-PAYMENT
               END-IF
               MOVE DB2-M-CC-SINT      TO DB2-M-CC
               MOVE DB2-M-VALUE-INT    TO DB2-M-VALUE
               MOVE DB2-M-PREMIUM-INT  TO DB2-M-PREMIUM
               MOVE DB2-M-ACCIDENTS-INT TO DB2-M-ACCIDENTS
               MOVE DB2-M-PREMIUM-INT  TO CA-M-PREMIUM
               MOVE DB2-M-ACCIDENTS-INT TO CA-M-ACCIDENTS

               MOVE DB2-POLICY-COMMON  TO CA-POLICY-COMMON
               MOVE DB2-MOTOR          TO CA-MOTOR(1:WS-MOTOR-LEN)
             END-IF

      *      Mark the end of the policy data
             MOVE 'FINAL' TO CA-M-FILLER(1:5)

           ELSE
      *      Non-zero SQLCODE from first SQL FETCH statement
             IF SQLCODE EQUAL 100
      *        No rows found - invalid customer / policy number
               MOVE '01' TO CA-RETURN-CODE
             ELSE
      *        something has gone wrong
               MOVE '90' TO CA-RETURN-CODE
      *        Write error message to TD QUEUE(CSMT)
               PERFORM WRITE-ERROR-MESSAGE
             END-IF

           END-IF.
           EXIT.

      *================================================================*
      * Use Select on join of Policy and Commer table to obtain        *
      * single row that matches customer and policy number requested.  *
      *================================================================*
       GET-Commercial-DB2-INFO-1.

           MOVE ' SELECT Commercial ' TO EM-SQLREQ

           EXEC SQL
             SELECT
                   RequestDate,
                   StartDate,
                   RenewalDate,
                   Address,
                   Zipcode,
                   LatitudeN,
                   LongitudeW,
                   Customer,
                   PropertyType,
                   FirePeril,
                   FirePremium,
                   CrimePeril,
                   CrimePremium,
                   FloodPeril,
                   FloodPremium,
                   WeatherPeril,
                   WeatherPremium,
                   Status,
                   RejectionReason
             INTO  :DB2-LASTCHANGED,
                   :DB2-ISSUEDATE,
                   :DB2-EXPIRYDATE,
                   :DB2-B-Address,
                   :DB2-B-Postcode,
                   :DB2-B-Latitude,
                   :DB2-B-Longitude,
                   :DB2-B-Customer,
                   :DB2-B-PropType,
                   :DB2-B-FirePeril-Int,
                   :DB2-B-FirePremium-Int,
                   :DB2-B-CrimePeril-Int,
                   :DB2-B-CrimePremium-Int,
                   :DB2-B-FloodPeril-Int,
                   :DB2-B-FloodPremium-Int,
                   :DB2-B-WeatherPeril-Int,
                   :DB2-B-WeatherPremium-Int,
                   :DB2-B-Status-Int,
                   :DB2-B-RejectReason
             FROM  POLICY,COMMERCIAL
             WHERE ( POLICY.POLICYNUMBER =
                        COmmercial.POLICYNUMBER   AND
                     POLICY.CUSTOMERNUMBER =
                        :DB2-CUSTOMERNUM-INT             AND
                     POLICY.POLICYNUMBER =
                        :DB2-POLICYNUM-INT               )
           END-EXEC

           IF SQLCODE = 0
      *      Select was successful

      *      Calculate size of commarea required to return all data
             ADD WS-CA-HEADERTRAILER-LEN TO WS-REQUIRED-CA-LEN
             ADD WS-FULL-COMM-LEN        TO WS-REQUIRED-CA-LEN

      *      if commarea received is not large enough ...
      *        set error return code and return to caller
             IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
               MOVE '98' TO CA-RETURN-CODE
               EXEC CICS RETURN END-EXEC
             ELSE
               MOVE DB2-B-FirePeril-Int      TO DB2-B-FirePeril
               MOVE DB2-B-FirePremium-Int    TO DB2-B-FirePremium
               MOVE DB2-B-CrimePeril-Int     TO DB2-B-CrimePeril
               MOVE DB2-B-CrimePremium-Int   TO DB2-B-CrimePremium
               MOVE DB2-B-FloodPeril-Int     TO DB2-B-FloodPeril
               MOVE DB2-B-FloodPremium-Int   TO DB2-B-FloodPremium
               MOVE DB2-B-WeatherPeril-Int   TO DB2-B-WeatherPeril
               MOVE DB2-B-WeatherPremium-Int TO DB2-B-WeatherPremium
               MOVE DB2-B-Status-Int         TO DB2-B-Status
      *
               MOVE DB2-POLICY-COMMON  TO CA-POLICY-COMMON
               MOVE DB2-COMMERCIAL     TO CA-COMMERCIAL(1:WS-COMM-LEN)
             END-IF

      *      Mark the end of the policy data
             MOVE 'FINAL' TO CA-B-FILLER(1:5)

           ELSE
      *      Non-zero SQLCODE from first SQL FETCH statement
             IF SQLCODE EQUAL 100
      *        No rows found - invalid customer / policy number
               MOVE '01' TO CA-RETURN-CODE
             ELSE
      *        something has gone wrong
               MOVE '90' TO CA-RETURN-CODE
      *        Write error message to TD QUEUE(CSMT)
               PERFORM WRITE-ERROR-MESSAGE
             END-IF
           END-IF.


           EXIT.

      *================================================================*
      * Use Select on Policy number only to obtain                     *
      * single row that matches the requested ploicy.                  *
      *================================================================*
       GET-Commercial-DB2-INFO-2.

           MOVE ' SELECT Commercial ' TO EM-SQLREQ

           EXEC SQL
             SELECT
                   CustomerNumber,
                   RequestDate,
                   StartDate,
                   RenewalDate,
                   Address,
                   Zipcode,
                   LatitudeN,
                   LongitudeW,
                   Customer,
                   PropertyType,
                   FirePeril,
                   FirePremium,
                   CrimePeril,
                   CrimePremium,
                   FloodPeril,
                   FloodPremium,
                   WeatherPeril,
                   WeatherPremium,
                   Status,
                   RejectionReason
             INTO
                   :DB2-CUSTOMERNUM-INT,
                   :DB2-LASTCHANGED,
                   :DB2-ISSUEDATE,
                   :DB2-EXPIRYDATE,
                   :DB2-B-Address,
                   :DB2-B-Postcode,
                   :DB2-B-Latitude,
                   :DB2-B-Longitude,
                   :DB2-B-Customer,
                   :DB2-B-PropType,
                   :DB2-B-FirePeril-Int,
                   :DB2-B-FirePremium-Int,
                   :DB2-B-CrimePeril-Int,
                   :DB2-B-CrimePremium-Int,
                   :DB2-B-FloodPeril-Int,
                   :DB2-B-FloodPremium-Int,
                   :DB2-B-WeatherPeril-Int,
                   :DB2-B-WeatherPremium-Int,
                   :DB2-B-Status-Int,
                   :DB2-B-RejectReason
             FROM  POLICY,COMMERCIAL
             WHERE ( POLICY.POLICYNUMBER =
                        COmmercial.POLICYNUMBER   AND
                     POLICY.POLICYNUMBER =
                        :DB2-POLICYNUM-INT               )
           END-EXEC

           IF SQLCODE = 0
      *      Select was successful

      *      Calculate size of commarea required to return all data
             ADD WS-CA-HEADERTRAILER-LEN TO WS-REQUIRED-CA-LEN
             ADD WS-FULL-COMM-LEN        TO WS-REQUIRED-CA-LEN

      *      if commarea received is not large enough ...
      *        set error return code and return to caller
             IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
               MOVE '98' TO CA-RETURN-CODE
               EXEC CICS RETURN END-EXEC
             ELSE
               MOVE DB2-CustomerNum-Int      TO CA-Customer-Num
               MOVE DB2-B-FirePeril-Int      TO DB2-B-FirePeril
               MOVE DB2-B-FirePremium-Int    TO DB2-B-FirePremium
               MOVE DB2-B-CrimePeril-Int     TO DB2-B-CrimePeril
               MOVE DB2-B-CrimePremium-Int   TO DB2-B-CrimePremium
               MOVE DB2-B-FloodPeril-Int     TO DB2-B-FloodPeril
               MOVE DB2-B-FloodPremium-Int   TO DB2-B-FloodPremium
               MOVE DB2-B-WeatherPeril-Int   TO DB2-B-WeatherPeril
               MOVE DB2-B-WeatherPremium-Int TO DB2-B-WeatherPremium
               MOVE DB2-B-Status-Int         TO DB2-B-Status
      *
               MOVE DB2-POLICY-COMMON  TO CA-POLICY-COMMON
               MOVE DB2-COMMERCIAL     TO CA-COMMERCIAL(1:WS-COMM-LEN)
             END-IF

      *      Mark the end of the policy data
             MOVE 'FINAL' TO CA-B-FILLER(1:5)

           ELSE
      *      Non-zero SQLCODE from first SQL FETCH statement
             IF SQLCODE EQUAL 100
      *        No rows found - invalid customer / policy number
               MOVE '01' TO CA-RETURN-CODE
             ELSE
      *        something has gone wrong
               MOVE '90' TO CA-RETURN-CODE
      *        Write error message to TD QUEUE(CSMT)
               PERFORM WRITE-ERROR-MESSAGE
             END-IF
           END-IF.


           EXIT.

      *================================================================*
      * Use Cursor to obtain matching customer policy records          *
      * from commercial table                                          *
      *================================================================*
       GET-Commercial-DB2-INFO-3.

           MOVE ' SELECT Commercial ' TO EM-SQLREQ
           Move 0 To ICOM-Record-Count

           EXEC SQL
             OPEN Cust_Cursor
           END-EXEC.
           IF SQLCODE NOT EQUAL 0
             MOVE '89' TO CA-RETURN-CODE
             PERFORM WRITE-ERROR-MESSAGE
             PERFORM END-PROGRAM
           END-IF.

           Perform GET-Commercial-DB2-INFO-3-Cur
                     With Test after Until SQLCODE > 0

           EXEC SQL
             Close Cust_Cursor
           END-EXEC.
           IF SQLCODE NOT EQUAL 0
             MOVE '88' TO CA-RETURN-CODE
             PERFORM WRITE-ERROR-MESSAGE
             PERFORM END-PROGRAM
           END-IF.

           Set Address Of ICOM-Record To ICOM-Pointer-Start
      *    If ICOM-Record-Count > 0
      *      Move ICOM-Record  To DFHCOMMAREA
      *      Move '00' To CA-RETURN-CODE
      *    Else
      *      Move '66' To CA-RETURN-CODE
      *    End-If

           Multiply ICOM-Record-Count By 1202 Giving ICOM-Data-Length
           Exec CICS Put Container('ICOM-Data')
                         Channel('ICOM')
                         From(ICOM-Record)
                         Flength(ICOM-Data-Length)
           End-Exec.
           Exec CICS Put Container('ICOM-Count')
                         Channel('ICOM')
                         From(ICOM-Record-Count)
                         Flength(2)
           End-Exec.

           Exit.

       GET-Commercial-DB2-INFO-3-Cur.

           Set Address Of DFHCOMMAREA To ICOM-Pointer

           EXEC SQL
             Fetch Cust_Cursor
             INTO
                   :DB2-CUSTOMERNUM-INT,
                   :DB2-POLICYNUM-INT,
                   :DB2-LASTCHANGED,
                   :DB2-ISSUEDATE,
                   :DB2-EXPIRYDATE,
                   :DB2-B-Address,
                   :DB2-B-Postcode,
                   :DB2-B-Latitude,
                   :DB2-B-Longitude,
                   :DB2-B-Customer,
                   :DB2-B-PropType,
                   :DB2-B-FirePeril-Int,
                   :DB2-B-FirePremium-Int,
                   :DB2-B-CrimePeril-Int,
                   :DB2-B-CrimePremium-Int,
                   :DB2-B-FloodPeril-Int,
                   :DB2-B-FloodPremium-Int,
                   :DB2-B-WeatherPeril-Int,
                   :DB2-B-WeatherPremium-Int,
                   :DB2-B-Status-Int,
                   :DB2-B-RejectReason
           END-EXEC

           If SQLCODE = 0
             MOVE DB2-B-FirePeril-Int      TO DB2-B-FirePeril
             MOVE DB2-B-FirePremium-Int    TO DB2-B-FirePremium
             MOVE DB2-B-CrimePeril-Int     TO DB2-B-CrimePeril
             MOVE DB2-B-CrimePremium-Int   TO DB2-B-CrimePremium
             MOVE DB2-B-FloodPeril-Int     TO DB2-B-FloodPeril
             MOVE DB2-B-FloodPremium-Int   TO DB2-B-FloodPremium
             MOVE DB2-B-WeatherPeril-Int   TO DB2-B-WeatherPeril
             MOVE DB2-B-WeatherPremium-Int TO DB2-B-WeatherPremium
             MOVE DB2-B-Status-Int         TO DB2-B-Status
             MOVE DB2-CustomerNum-Int      TO CA-CUSTOMER-NUM
             MOVE DB2-PolicyNum-Int        TO CA-POLICY-NUM
             MOVE DB2-POLICY-COMMON        TO CA-POLICY-COMMON
             MOVE DB2-COMMERCIAL     TO CA-COMMERCIAL(1:WS-COMM-LEN)

             Add 1 To ICOM-Record-Count
             Set icom-pointer to address of CA-B-FILLER
             If ICOM-Record-Count > 20
               Move 17 To SQLCODE
             End-If
           End-If


           EXIT.

      *================================================================*
      * Use Cursor to obtain matching rows                             *
      * from commercial table                                          *
      *================================================================*
       GET-Commercial-DB2-INFO-5.

           MOVE ' SELECT Commercial ' TO EM-SQLREQ

           EXEC SQL
             OPEN Zip_Cursor
           END-EXEC.
           IF SQLCODE NOT EQUAL 0
             MOVE '89' TO CA-RETURN-CODE
             PERFORM WRITE-ERROR-MESSAGE
             PERFORM END-PROGRAM
           END-IF.

           Perform GET-Commercial-DB2-INFO-5-Cur
                     With Test after Until SQLCODE > 0

           EXEC SQL
             Close Zip_Cursor
           END-EXEC.
           IF SQLCODE NOT EQUAL 0
             MOVE '88' TO CA-RETURN-CODE
             PERFORM WRITE-ERROR-MESSAGE
             PERFORM END-PROGRAM
           END-IF.

           Exit.

       GET-Commercial-DB2-INFO-5-Cur.
           EXEC SQL
             Fetch Zip_Cursor
             INTO
                   :DB2-CUSTOMERNUM-INT,
                   :DB2-POLICYNUM-INT,
                   :DB2-LASTCHANGED,
                   :DB2-ISSUEDATE,
                   :DB2-EXPIRYDATE,
                   :DB2-B-Address,
                   :DB2-B-Postcode,
                   :DB2-B-Latitude,
                   :DB2-B-Longitude,
                   :DB2-B-Customer,
                   :DB2-B-PropType,
                   :DB2-B-FirePeril-Int,
                   :DB2-B-FirePremium-Int,
                   :DB2-B-CrimePeril-Int,
                   :DB2-B-CrimePremium-Int,
                   :DB2-B-FloodPeril-Int,
                   :DB2-B-FloodPremium-Int,
                   :DB2-B-WeatherPeril-Int,
                   :DB2-B-WeatherPremium-Int,
                   :DB2-B-Status-Int,
                   :DB2-B-RejectReason
           END-EXEC

           If SQLCODE = 0
             MOVE DB2-B-FirePeril-Int      TO DB2-B-FirePeril
             MOVE DB2-B-FirePremium-Int    TO DB2-B-FirePremium
             MOVE DB2-B-CrimePeril-Int     TO DB2-B-CrimePeril
             MOVE DB2-B-CrimePremium-Int   TO DB2-B-CrimePremium
             MOVE DB2-B-FloodPeril-Int     TO DB2-B-FloodPeril
             MOVE DB2-B-FloodPremium-Int   TO DB2-B-FloodPremium
             MOVE DB2-B-WeatherPeril-Int   TO DB2-B-WeatherPeril
             MOVE DB2-B-WeatherPremium-Int TO DB2-B-WeatherPremium
             MOVE DB2-B-Status-Int         TO DB2-B-Status
             MOVE DB2-CustomerNum-Int      TO CA-CUSTOMER-NUM
             MOVE DB2-PolicyNum-Int        TO CA-POLICY-NUM
             MOVE DB2-POLICY-COMMON        TO CA-POLICY-COMMON
             MOVE DB2-COMMERCIAL     TO CA-COMMERCIAL(1:WS-COMM-LEN)
           End-If


           EXIT.

      *================================================================*
      * Use Select on Claim to return a
      * single row that matches the claim number
      *================================================================*
       GET-Claim-DB2-INFO-1.

           MOVE ' SELECT Claim ' TO EM-SQLREQ

           EXEC SQL
             SELECT
                   POLICY.CustomerNumber,
                   ClaimNumber,
                   CLAIM.PolicyNumber,
                   ClaimDate,
                   Paid,
                   Value,
                   Cause,
                   Observations
             INTO  :DB2-Customernum-int,
                   :DB2-Claimnum-int,
                   :DB2-POLICYNUM-INT,
                   :DB2-C-Date,
                   :DB2-C-Paid-Int,
                   :DB2-C-Value-Int,
                   :DB2-C-Cause,
                   :DB2-C-Observations
             FROM  POLICY,CLAIM
             WHERE ( POLICY.POLICYNUMBER =
                        CLAIM.POLICYNUMBER   AND
                     CLAIM.ClaimNumber =
                        :DB2-ClaimNum-INT             )
           END-EXEC

           IF SQLCODE = 0
      *      Select was successful

      *      Calculate size of commarea required to return all data
             ADD WS-CA-HEADERTRAILER-LEN TO WS-REQUIRED-CA-LEN
             ADD WS-FULL-CLAIM-LEN       TO WS-REQUIRED-CA-LEN

      *      if commarea received is not large enough ...
      *        set error return code and return to caller
             IF EIBCALEN IS LESS THAN WS-REQUIRED-CA-LEN
               MOVE '98' TO CA-RETURN-CODE
               EXEC CICS RETURN END-EXEC
             ELSE
               MOVE DB2-Customernum-int      TO CA-CUSTOMER-NUM
               MOVE DB2-PolicyNum-int        TO CA-POLICY-NUM
               MOVE DB2-Claimnum-int         TO DB2-C-Num
               MOVE DB2-C-Paid-Int           TO DB2-C-Paid
               MOVE DB2-C-Value-Int          TO DB2-C-Value
      *
               MOVE DB2-POLICY-COMMON  TO CA-POLICY-COMMON
               MOVE DB2-Claim          TO CA-Claim(1:WS-COMM-LEN)
             END-IF

      *      Mark the end of the policy data
             MOVE 'FINAL' TO CA-C-FILLER(1:5)

           ELSE
      *      Non-zero SQLCODE from first SQL FETCH statement
             IF SQLCODE EQUAL 100
      *        No rows found - invalid customer / policy number
               MOVE '01' TO CA-RETURN-CODE
             ELSE
      *        something has gone wrong
               MOVE '90' TO CA-RETURN-CODE
      *        Write error message to TD QUEUE(CSMT)
               PERFORM WRITE-ERROR-MESSAGE
             END-IF
           END-IF.


           EXIT.

      *================================================================*
      * Use Select on Claim to return rows
      * that matches the customer number
      *================================================================*
       GET-Claim-DB2-INFO-2.

           MOVE ' SELECT Claim ' TO EM-SQLREQ

           EXEC SQL
             OPEN CusClaim_Cursor
           END-EXEC.
           IF SQLCODE NOT EQUAL 0
             MOVE '89' TO CA-RETURN-CODE
             PERFORM WRITE-ERROR-MESSAGE
             PERFORM END-PROGRAM
           END-IF.

           Perform GET-Claim-DB2-INFO-2-Cur
                     With Test after Until SQLCODE > 0

           EXEC SQL
             Close CusClaim_Cursor
           END-EXEC.
           IF SQLCODE NOT EQUAL 0
             MOVE '88' TO CA-RETURN-CODE
             PERFORM WRITE-ERROR-MESSAGE
             PERFORM END-PROGRAM
           END-IF.

           Exit.

       GET-Claim-DB2-INFO-2-Cur.

           EXEC SQL
             Fetch CusClaim_Cursor
             INTO
                   :DB2-Customernum-int,
                   :DB2-Claimnum-int,
                   :DB2-POLICYNUM-INT,
                   :DB2-C-Date,
                   :DB2-C-Paid-Int,
                   :DB2-C-Value-Int,
                   :DB2-C-Cause,
                   :DB2-C-Observations
           END-EXEC

           IF SQLCODE = 0
               MOVE DB2-Customernum-int  TO CA-CUSTOMER-NUM
               MOVE DB2-PolicyNum-int    TO CA-POLICY-NUM
               MOVE DB2-Claimnum-int     TO DB2-C-Num
               MOVE DB2-C-Paid-Int       TO DB2-C-Paid
               MOVE DB2-C-Value-Int      TO DB2-C-Value
               MOVE DB2-POLICY-COMMON    TO CA-POLICY-COMMON
               MOVE DB2-Claim            TO CA-Claim(1:WS-COMM-LEN)
               MOVE 'FINAL'              TO CA-C-FILLER(1:5)
           END-IF.


           EXIT.

      *================================================================*
      * Procedure to write error message to TD QUEUE(CSMT)             *
      *   message will include Date, Time, Program Name, Customer      *
      *   Number, Policy Number and SQLCODE.                           *
      *================================================================*
       WRITE-ERROR-MESSAGE.
      * Save SQLCODE in message
           MOVE SQLCODE TO EM-SQLRC
      * Obtain and format current time and date
           EXEC CICS ASKTIME ABSTIME(ABS-TIME)
           END-EXEC
           EXEC CICS FORMATTIME ABSTIME(ABS-TIME)
                     MMDDYYYY(DATE1)
                     TIME(TIME1)
           END-EXEC
           MOVE DATE1 TO EM-DATE
           MOVE TIME1 TO EM-TIME
      * Write output message to TDQ
           EXEC CICS LINK PROGRAM('LGSTSQ')
                     COMMAREA(ERROR-MSG)
                     LENGTH(LENGTH OF ERROR-MSG)
           END-EXEC.
      * Write 90 bytes or as much as we have of commarea to TDQ
           IF EIBCALEN > 0 THEN
             IF EIBCALEN < 91 THEN
               MOVE DFHCOMMAREA(1:EIBCALEN) TO CA-DATA
               EXEC CICS LINK PROGRAM('LGSTSQ')
                         COMMAREA(CA-ERROR-MSG)
                         LENGTH(LENGTH OF CA-ERROR-MSG)
               END-EXEC
             ELSE
               MOVE DFHCOMMAREA(1:90) TO CA-DATA
               EXEC CICS LINK PROGRAM('LGSTSQ')
                         COMMAREA(CA-ERROR-MSG)
                         LENGTH(LENGTH OF CA-ERROR-MSG)
               END-EXEC
             END-IF
           END-IF.
           EXIT.
