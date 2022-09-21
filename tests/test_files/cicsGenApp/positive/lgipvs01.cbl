      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      *                    Inquire Policy                              *
      *                                                                *
      * This program will return a random Policy/customer number from  *
      *  the VSAM KSDS Policy file. Input parm of policy type will     *
      *  determine the key                                             *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGIPVS01.
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
         03 WRITE-MSG-Text           PIC X(11) Value 'Policy Key='.
         03 WRITE-MSG-Key.
           05  WRITE-Msg-Type        Pic X Value 'X'.
           05  WRITE-Msg-CustNum     Pic 9(10).
           05  WRITE-Msg-PolNum      Pic 9(10).
         03 Filler                   PIC X(48) Value Spaces.
       01  STSQ.
         03  STSQ-NAME                 PIC X(8) Value 'GENACNTL'.
       01  FILLER REDEFINES STSQ.
         03 FILLER                   PIC X(4).
         03 STSQ-EXT                 PIC X(4).

       01 TEMPO                      PIC X(90) VALUE SPACES.
       01 PART-KEY.
          03 PART-KEY-Type           PIC X.
          03 PART-KEY-Num            PIC 9(10).
       01 CA-AREA.
         03  CA-POLICY-TYPE          Pic X.
         03  CA-CUSTOMER-NUM         Pic X(10).
         03  CA-POLICY-NUM           Pic X(10).
         03  Filler                  Pic X(43).
      *
       77 MSGEND                     PIC X(24) VALUE
                                        'Transaction ended      '.
       77 F64                        Pic S9(4) Comp Value 64.
       77 F11                        Pic S9(4) Comp Value 11.

      *****************************************************************
      *    L I N K A G E     S E C T I O N
      *****************************************************************
       LINKAGE SECTION.
       01  DFHCOMMAREA.
         03  COMMA-DATA.
           05  Comma-Data-Text      Pic X(11).
           05  Comma-Data-Key       Pic X(21).
           05  FILLER               Pic X(58).

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
              MOVE 11          TO WS-RECV-LEN
              SUBTRACT 1 FROM WS-RECV-LEN
           ELSE
              EXEC CICS RECEIVE INTO(WS-RECV)
                  LENGTH(WS-RECV-LEN)
                  RESP(WS-RESP)
              END-EXEC
              MOVE 'R' To WS-FLAG
              MOVE WS-RECV-DATA  TO WS-COMMAREA
              SUBTRACT 6 FROM WS-RECV-LEN
           END-IF.
      *
           Move Spaces                      To CA-Area
           Move WS-Commarea(1:1)            To Part-Key-Type
           Move WS-Commarea(2:WS-RECV-LEN)  To Part-Key-Num
      *
           Exec CICS Read File('KSDSPOLY')
                     Into(CA-AREA)
                     Length(F64)
                     Ridfld(PART-KEY)
                     KeyLength(F11)
                     Generic
                     RESP(WS-RESP)
                     GTEQ
           End-Exec.

           If CA-Policy-Type   Not = Part-Key-Type Or
              WS-RESP NOT          = DFHRESP(NORMAL)
             Move 'Policy Bad='   To Write-Msg-Text
             Move 13              To WRITE-Msg-CustNum
             Move 13              To WRITE-Msg-PolNum
           Else
             Move CA-Area to WRITE-MSG-Key
           End-If

           If WS-FLAG = 'R' Then
             EXEC CICS SEND TEXT FROM(WRITE-MSG)
              WAIT
              ERASE
              LENGTH(80)
              FREEKB
             END-EXEC
           Else
             Move Spaces          To COMMA-Data
             Move Write-Msg-Text  To COMMA-Data-Text
             Move Write-Msg-Key   To COMMA-Data-Key
           End-If.

           EXEC CICS RETURN
           END-EXEC.

       A-EXIT.
           EXIT.
           GOBACK.

