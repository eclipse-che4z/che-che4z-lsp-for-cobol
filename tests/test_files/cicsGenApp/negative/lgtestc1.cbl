      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      *                    Customer menu                               *
      *                                                                *
      * Menu for Customer transactions                                 *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGTESTC1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-RESP                   PIC S9(8) COMP.
       01  WS-Item-Count             PIC S9(4) Comp.
       01  WS-FLAG-TSQH              PIC X.
       01  READ-MSG.
         03 READ-MSG-MSG             PIC X(80).
       01  FILLER REDEFINES Read-MSG.
         03 FILLER                   PIC X(14).
         03 READ-CUST-HIGH           PIC 9(10).
      ******************************
       01  WS-Cust-High              Pic S9(10).
      ******************************

       01  WRITE-MSG.
         03 WRITE-MSG-E            PIC X(20) Value '**** GENAPP CNTL'.
         03 WRITE-MSG-L              PIC X(13) Value 'LOW CUSTOMER='.
         03 WRITE-MSG-LOW            PIC 9(10).
         03 FILLER                   PIC X.
         03 WRITE-MSG-H              PIC X(14) Value 'HIGH CUSTOMER='.
         03 WRITE-MSG-High           PIC 9(10).
       01  STSQ.
         03  STSQ-NAME                 PIC X(8) Value 'GENACNTL'.
      *
       77 F24                        Pic S9(4) Comp Value 24.
       77 MSGEND                       PIC X(24) VALUE
                                        'Transaction ended      '.

        COPY SSMAP.
        01 COMM-AREA.
        COPY LGCMAREA.

      *----------------------------------------------------------------*
      *****************************************************************
       PROCEDURE DIVISION.

      *---------------------------------------------------------------*
       MAINLINE SECTION.

           IF EIBCALEN > 0
              GO TO A-GAIN.

           Initialize SSMAPC1I.
           Initialize SSMAPC1O.
           Initialize COMM-AREA.
           MOVE '0000000000'   To ENT1CNOO

      * Display Main Menu
           EXEC CICS SEND MAP ('SSMAPC1')
                     FROM(SSMAPC1O)
                     MAPSET ('SSMAP')
                     ERASE
                     END-EXEC.

       A-GAIN.

           EXEC CICS HANDLE AID
                     CLEAR(CLEARIT)
                     PF3(ENDIT) END-EXEC.
           EXEC CICS HANDLE CONDITION
                     MAPFAIL(ENDIT)
                     END-EXEC.

           EXEC CICS RECEIVE MAP('SSMAPC1')
                     INTO(SSMAPC1I) ASIS
                     MAPSET('SSMAP') END-EXEC.


           EVALUATE ENT1OPTO

             WHEN '1'
                 Move '01ICUS'   To CA-REQUEST-ID
                 Move ENT1CNOO   To CA-CUSTOMER-NUM
                 EXEC CICS LINK PROGRAM('LGICUS01')
                           COMMAREA(COMM-AREA)
                           LENGTH(32500)
                 END-EXEC

                 IF CA-RETURN-CODE > 0
                   GO TO NO-DATA
                 END-IF

                 Move CA-FIRST-NAME to ENT1FNAI
                 Move CA-LAST-NAME  to ENT1LNAI
                 Move CA-DOB        to ENT1DOBI
                 Move CA-HOUSE-NAME to ENT1HNMI
                 Move CA-HOUSE-NUM  to ENT1HNOI
                 Move CA-POSTCODE   to ENT1HPCI
                 Move CA-PHONE-HOME    to ENT1HP1I
                 Move CA-PHONE-MOBILE  to ENT1HP2I
                 Move CA-EMAIL-ADDRESS to ENT1HMOI
                 EXEC CICS SEND MAP ('SSMAPC1')
                           FROM(SSMAPC1O)
                           MAPSET ('SSMAP')
                 END-EXEC
                 GO TO ENDIT-STARTIT

             WHEN '2'
                 Move '01ACUS'   To CA-REQUEST-ID
                 Move 0          To CA-CUSTOMER-NUM
                 Move ENT1FNAI   To CA-FIRST-NAME
                 Move ENT1LNAI   To CA-LAST-NAME
                 Move ENT1DOBI   To CA-DOB
                 Move ENT1HNMI   To CA-HOUSE-NAME
                 Move ENT1HNOI   To CA-HOUSE-NUM
                 Move ENT1HPCI   To CA-POSTCODE
                 Move ENT1HP1I   To CA-PHONE-HOME
                 Move ENT1HP2I   To CA-PHONE-MOBILE
                 Move ENT1HMOI   To CA-EMAIL-ADDRESS
                 Inspect COMM-AREA Replacing All x'00'  by x'40'
                 Move Function UPPER-CASE(CA-POSTCODE)
                      TO CA-POSTCODE
                 EXEC CICS LINK PROGRAM('LGACUS01')
                           COMMAREA(COMM-AREA)
                           LENGTH(32500)
                 END-EXEC
                 IF CA-RETURN-CODE > 0
                   Exec CICS Syncpoint Rollback End-Exec
                   GO TO NO-ADD
                 END-IF

                 Perform WRITE-GENACNTL
                 Move CA-CUSTOMER-NUM To ENT1CNOI
                 Move ' '             To ENT1OPTI
                 Move 'New Customer Inserted'
                   To  ERRFLDO
                 EXEC CICS SEND MAP ('SSMAPC1')
                           FROM(SSMAPC1O)
                           MAPSET ('SSMAP')
                 END-EXEC
                 GO TO ENDIT-STARTIT

             WHEN '4'
                 Move '01ICUS'   To CA-REQUEST-ID
                 Move ENT1CNOO   To CA-CUSTOMER-NUM
                 EXEC CICS LINK PROGRAM('LGICUS01')
                           COMMAREA(COMM-AREA)
                           LENGTH(32500)
                 END-EXEC
                 IF CA-RETURN-CODE > 0
                   GO TO NO-DATA
                 END-IF

                 Move CA-FIRST-NAME to ENT1FNAI
                 Move CA-LAST-NAME  to ENT1LNAI
                 Move CA-DOB        to ENT1DOBI
                 Move CA-HOUSE-NAME to ENT1HNMI
                 Move CA-HOUSE-NUM  to ENT1HNOI
                 Move CA-POSTCODE   to ENT1HPCI
                 Move CA-PHONE-HOME    to ENT1HP1I
                 Move CA-PHONE-MOBILE  to ENT1HP2I
                 Move CA-EMAIL-ADDRESS to ENT1HMOI
                 EXEC CICS SEND MAP ('SSMAPC1')
                           FROM(SSMAPC1O)
                           MAPSET ('SSMAP')
                 END-EXEC
                 EXEC CICS RECEIVE MAP('SSMAPC1')
                           INTO(SSMAPC1I) ASIS
                           MAPSET('SSMAP') END-EXEC

                 Move '01UCUS'   To CA-REQUEST-ID
                 Move ENT1CNOI   To CA-CUSTOMER-NUM
                 Move ENT1FNAI   To CA-FIRST-NAME
                 Move ENT1LNAI   To CA-LAST-NAME
                 Move ENT1DOBI   To CA-DOB
                 Move ENT1HNMI   To CA-HOUSE-NAME
                 Move ENT1HNOI   To CA-HOUSE-NUM
                 Move ENT1HPCI   To CA-POSTCODE
                 Move ENT1HP1I   To CA-PHONE-HOME
                 Move ENT1HP2I   To CA-PHONE-MOBILE
                 Move ENT1HMOI   To CA-EMAIL-ADDRESS
                 Inspect COMM-AREA Replacing All x'00'  by x'40'
                 Move Function UPPER-CASE(CA-POSTCODE)
                      TO CA-POSTCODE
                 EXEC CICS LINK PROGRAM('LGUCUS01')
                           COMMAREA(COMM-AREA)
                           LENGTH(32500)
                 END-EXEC

                 IF CA-RETURN-CODE > 0
                   GO TO NO-UPD
                 END-IF

                 Move CA-CUSTOMER-NUM To ENT1CNOI
                 Move ' '             To ENT1OPTI
                 Move 'Customer details updated'
                   To  ERRFLDO
                 EXEC CICS SEND MAP ('SSMAPC1')
                           FROM(SSMAPC1O)
                           MAPSET ('SSMAP')
                 END-EXEC
                 GO TO ENDIT-STARTIT

             WHEN OTHER

                 Move 'Please enter a valid option'
                   To  ERRFLDO
                 Move -1 To ENT1OPTL

                 EXEC CICS SEND MAP ('SSMAPC1')
                           FROM(SSMAPC1O)
                           MAPSET ('SSMAP')
                           CURSOR
                 END-EXEC
                 GO TO ENDIT-STARTIT

           END-EVALUATE.


      *    Send message to terminal and return

           EXEC CICS RETURN
           END-EXEC.

       ENDIT-STARTIT.
           EXEC CICS RETURN
                TRANSID('SSC1')
                COMMAREA(COMM-AREA)
                END-EXEC.

       ENDIT.
           EXEC CICS SEND TEXT
                     FROM(MSGEND)
                     LENGTH(LENGTH OF MSGEND)
                     ERASE
                     FREEKB
           END-EXEC
           EXEC CICS RETURN
           END-EXEC.

       CLEARIT.

           Initialize SSMAPC1I.
           EXEC CICS SEND MAP ('SSMAPC1')
                     MAPSET ('SSMAP')
                     MAPONLY
           END-EXEC

           EXEC CICS RETURN
                TRANSID('SSC1')
                COMMAREA(COMM-AREA)
                END-EXEC.

       NO-UPD.
           Move 'Error Updating Customer'          To  ERRFLDO.
           Go To ERROR-OUT.

       NO-ADD.
           Move 'Error Adding Customer'            To  ERRFLDO.
           Go To ERROR-OUT.

       NO-DATA.
           Move 'No data was returned.'            To  ERRFLDO.
           Go To ERROR-OUT.

       ERROR-OUT.
           EXEC CICS SEND MAP ('SSMAPC1')
                     FROM(SSMAPC1O)
                     MAPSET ('SSMAP')
           END-EXEC.

           Initialize SSMAPC1I.
           Initialize SSMAPC1O.
           Initialize COMM-AREA.

           GO TO ENDIT-STARTIT.
      *--------------------------------------------------------------*
       WRITE-GENACNTL.

           EXEC CICS ENQ Resource(STSQ-NAME)
                         Length(Length Of STSQ-NAME)
           END-EXEC.
           Move 'Y' To WS-FLAG-TSQH
           Move 1   To WS-Item-Count
           Exec CICS ReadQ TS Queue(STSQ-NAME)
                     Into(READ-MSG)
                     Resp(WS-RESP)
                     Item(1)
           End-Exec.
           If WS-RESP = DFHRESP(NORMAL)
              Perform With Test after Until WS-RESP > 0
                 Exec CICS ReadQ TS Queue(STSQ-NAME)
                     Into(READ-MSG)
                     Resp(WS-RESP)
                     Next
                 End-Exec
                 Add 1 To WS-Item-Count
                 If WS-RESP = DFHRESP(NORMAL) And
                      Read-Msg-Msg(1:13) = 'HIGH CUSTOMER'
                      Move CA-Customer-Num To Write-Msg-High
                      Move Space to WS-FLAG-TSQH
                      Exec CICS WriteQ TS Queue(STSQ-NAME)
                          From(Write-Msg-H)
                          Length(F24)
                          Resp(WS-RESP)
                          ReWrite
                          Item(WS-Item-Count)
                      End-Exec
                      MOVE 99 To WS-RESP
                 End-If
              End-Perform
           End-If.
      *
      *
           If WS-FLAG-TSQH = 'Y'
             EXEC CICS WRITEQ TS QUEUE(STSQ-NAME)
                       FROM(WRITE-MSG-E)
                       RESP(WS-RESP)
                       NOSUSPEND
                       LENGTH(20)
             END-EXEC
             Move CA-Customer-Num To Write-Msg-Low
             Move CA-Customer-Num To Write-Msg-High
             EXEC CICS WRITEQ TS QUEUE(STSQ-NAME)
                       FROM(WRITE-MSG-L)
                       RESP(WS-RESP)
                       NOSUSPEND
                       LENGTH(23)
             END-EXEC
             EXEC CICS WRITEQ TS QUEUE(STSQ-NAME)
                       FROM(WRITE-MSG-H)
                       RESP(WS-RESP)
                       NOSUSPEND
                       LENGTH(24)
             END-EXEC
           End-If.

           EXEC CICS DEQ Resource(STSQ-NAME)
                         Length(Length Of STSQ-NAME)
           END-EXEC.

           EXIT.
