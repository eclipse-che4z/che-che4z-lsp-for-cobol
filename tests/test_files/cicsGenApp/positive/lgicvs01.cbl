      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      *                    Customer Inquire                            *
      *                                                                *
      * This program will return a random customer number that is      *
      *  in the VSAM KSDS Customer dataset.                            *
      *                                                                *
      * Random seed will be obtained from a control TSQ                *
      *  and used in the read                                          *
      *                                                                *
      * Call by LINK or TRAN. Returned by Commarea or Screen display   *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGICVS01.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-FLAG-TSQE              PIC X.
       01  WS-FLAG-TSQH              PIC X.
       01  WS-FLAG-TSQL              PIC X.
       01  WS-FLAG                   PIC X.
       01  WS-RANDOM-Seed            PIC S9(4) Comp.
       01  WS-RANDOM-Number          PIC 9(8) Comp.
       01  WS-RESP                   PIC S9(8) COMP.
       01  WS-STARTCODE              PIC XX Value spaces.
       01  WS-SYSID                  PIC X(4) Value spaces.
       01  WS-Invokeprog             PIC X(8) Value spaces.
       01  WS-COMMAREA               PIC X(80).
       01  WS-RECV.
         03 WS-RECV-TRANID           PIC X(5).
         03 WS-RECV-DATA             PIC X(74).
       01  WS-RECV-LEN               PIC S9(4) COMP Value 80.
      ******************************
       01  READ-MSG.
         03 READ-MSG-MSG             PIC X(80).
       01  FILLER REDEFINES Read-MSG.
         03 FILLER                   PIC X(13).
         03 READ-CUST-LOW            PIC 9(10).
       01  FILLER REDEFINES Read-MSG.
         03 FILLER                   PIC X(14).
         03 READ-CUST-HIGH           PIC 9(10).
      ******************************
       01  WS-Cust-Low               Pic S9(10).
       01  WS-Cust-High              Pic S9(10).
       01  WS-Cust-Number            Pic X(10).
      ******************************

       01  WRITE-MSG.
         03 WRITE-MSG-E            PIC X(20) Value '**** GENAPP CNTL'.
         03 WRITE-MSG-L              PIC X(13) Value 'LOW CUSTOMER='.
         03 WRITE-MSG-LOW            PIC X(10).
         03 FILLER                   PIC X.
         03 WRITE-MSG-H              PIC X(14) Value 'HIGH CUSTOMER='.
         03 WRITE-MSG-High           PIC 9(10).
         03 FILLER                   Pic X(60).
       01  STSQ.
         03  STSQ-NAME                 PIC X(8) Value 'GENACNTL'.
       01  FILLER REDEFINES STSQ.
         03 FILLER                   PIC X(4).
         03 STSQ-EXT                 PIC X(4).

       01 TEMPO                      PIC X(90) VALUE SPACES.
       01 CA-AREA.
         03  CA-CUSTOMER-NUM         Pic X(10).
         03  Filler                  Pic X(215).
      *
       77 MSGEND                     PIC X(24) VALUE
                                        'Transaction ended      '.
       77 F82                        Pic S9(4) Comp Value 225.
       77 F10                        Pic S9(4) Comp Value 10.

      *****************************************************************
      *    L I N K A G E     S E C T I O N
      *****************************************************************
       LINKAGE SECTION.
       01  DFHCOMMAREA.
         03  COMMA-DATA.
           05 Comma-Data-H           Pic X(14).
           05 Comma-Data-High        Pic 9(10).
           05 FILLER                 Pic X(60).

      *----------------------------------------------------------------*
      *****************************************************************
       PROCEDURE DIVISION.

      *---------------------------------------------------------------*
       MAINLINE SECTION.
      *
           MOVE SPACES TO WS-RECV.

           EXEC CICS ASSIGN SYSID(WS-SYSID)
                RESP(WS-RESP)
           END-EXEC.

           EXEC CICS ASSIGN STARTCODE(WS-STARTCODE)
                RESP(WS-RESP)
           END-EXEC.

           EXEC CICS ASSIGN Invokingprog(WS-Invokeprog)
                RESP(WS-RESP)
           END-EXEC.
           IF WS-STARTCODE(1:1) = 'D' or
              WS-Invokeprog Not = Spaces
              MOVE 'C' To WS-FLAG
              MOVE COMMA-DATA  TO WS-COMMAREA
              MOVE EIBCALEN    TO WS-RECV-LEN
           ELSE
              EXEC CICS RECEIVE INTO(WS-RECV)
                  LENGTH(WS-RECV-LEN)
                  RESP(WS-RESP)
              END-EXEC
              MOVE 'R' To WS-FLAG
              MOVE WS-RECV-DATA  TO WS-COMMAREA
              SUBTRACT 5 FROM WS-RECV-LEN
           END-IF.
      *
           Move 0001000001 to WS-Cust-Low
           Move 0001000001 to WS-Cust-High
           Move 'Y'        to WS-FLAG-TSQE
           Move 'Y'        to WS-FLAG-TSQH
           Move 'Y'        to WS-FLAG-TSQL
      *
           EXEC CICS ENQ Resource(STSQ-NAME)
                         Length(Length Of STSQ-NAME)
           END-EXEC.
           Exec CICS ReadQ TS Queue(STSQ-NAME)
                     Into(READ-MSG)
                     Resp(WS-RESP)
                     Item(1)
           End-Exec.
           If WS-RESP = DFHRESP(NORMAL)
              Move Space to WS-FLAG-TSQE
              Perform With Test after Until WS-RESP > 0
                 Exec CICS ReadQ TS Queue(STSQ-NAME)
                     Into(READ-MSG)
                     Resp(WS-RESP)
                     Next
                 End-Exec
                 If WS-RESP = DFHRESP(NORMAL) And
                      Read-Msg-Msg(1:12) = 'LOW CUSTOMER'
                      Move READ-CUST-LOW to WS-Cust-Low
                      Move Space to WS-FLAG-TSQL
                 End-If
                 If WS-RESP = DFHRESP(NORMAL) And
                      Read-Msg-Msg(1:13) = 'HIGH CUSTOMER'
                      Move READ-CUST-HIGH to WS-Cust-High
                      Move Space to WS-FLAG-TSQH
                 End-If
              End-Perform
           End-If.
      *
           Move WS-Cust-Low to WRITE-MSG-LOW
           Move WS-Cust-High to WRITE-MSG-HIGH
      *
      *
           If WS-FLAG-TSQE = 'Y'
             EXEC CICS WRITEQ TS QUEUE(STSQ-NAME)
                       FROM(WRITE-MSG-E)
                       RESP(WS-RESP)
                       NOSUSPEND
                       LENGTH(20)
             END-EXEC
           End-If.
      *
           If WS-FLAG-TSQL = 'Y'
             EXEC CICS WRITEQ TS QUEUE(STSQ-NAME)
                       FROM(WRITE-MSG-L)
                       RESP(WS-RESP)
                       NOSUSPEND
                       LENGTH(23)
             END-EXEC
           End-If.
      *
           If WS-FLAG-TSQH = 'Y'
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

           Compute WS-Random-Number = Function Integer((
                     Function Random(EIBTASKN) *
                       (ws-cust-high - ws-cust-low)) +
                          WS-Cust-Low)
           Move WS-Random-Number to WRITE-MSG-HIGH

           Exec CICS Read File('KSDSCUST')
                     Into(CA-AREA)
                     Length(F82)
                     Ridfld(WRITE-MSG-HIGH)
                     KeyLength(F10)
                     RESP(WS-RESP)
                     GTEQ
           End-Exec.
           If WS-RESP = DFHRESP(NORMAL)
             Move CA-Customer-Num to WRITE-MSG-HIGH
           End-if.

           If WS-FLAG = 'R' Then
             EXEC CICS SEND TEXT FROM(WRITE-MSG-H)
              WAIT
              ERASE
              LENGTH(24)
              FREEKB
             END-EXEC
           Else
             Move Spaces To COMMA-Data
             Move Write-Msg-H    To COMMA-Data-H
             Move Write-Msg-High To COMMA-Data-High
           End-If.

           EXEC CICS RETURN
           END-EXEC.

       A-EXIT.
           EXIT.
           GOBACK.

