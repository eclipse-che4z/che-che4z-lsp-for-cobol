      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      * By default queue name of GENAERRS is used if                   *
      *  parm Q=nnnn is passed then Queue name GENAnnnn is used        *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGSTSQ.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-FLAG                   PIC X.
       01  WS-RESP                   PIC S9(8) COMP.
       01  WS-STARTCODE              PIC XX Value spaces.
       01  WS-INVOKEPROG             PIC X(8) Value spaces.
       01  WS-PRINSYSID              PIC XXXX Value spaces.
       01  WS-RECV.
         03 WS-RECV-TRANID           PIC X(5).
         03 WS-RECV-DATA             PIC X(74).
       01  WS-RECV-LEN               PIC S9(4) COMP Value 80.

       01  WRITE-MSG.
         03 WRITE-MSG-SYSID          PIC X(4).
         03 FILLER-X                 PIC X Value SPACES.
         03 WRITE-MSG-MSG            PIC X(90).
       01  FILLER REDEFINES WRITE-MSG.
         03 FILLER                   PIC X(5).
         03 FILLER                   PIC X(7).
         03 WRITE-MSG-REST           PIC X(83).
       01  STSQ.
         03  STSQ-NAME                 PIC X(8).
       01  FILLER REDEFINES STSQ.
         03 FILLER                   PIC X(4).
         03 STSQ-EXT                 PIC X(4).

       01 TEMPO                      PIC X(90) VALUE SPACES.
       77 STDQ-NAME                  PIC X(4)  VALUE 'CSMT'.
       77 MSGEND                     PIC X(24) VALUE
                                        'Transaction ended      '.

      *****************************************************************
      *    L I N K A G E     S E C T I O N
      *****************************************************************
       LINKAGE SECTION.
      * Delete policy commarea description
       01  DFHCOMMAREA.
         02  COMMA-DATA              PIC X(90).

      *----------------------------------------------------------------*
      *****************************************************************
       PROCEDURE DIVISION.

      *---------------------------------------------------------------*
       MAINLINE SECTION.

           MOVE SPACES TO WRITE-MSG.
           MOVE SPACES TO WS-RECV.

           EXEC CICS ASSIGN SYSID(WRITE-MSG-SYSID)
                RESP(WS-RESP)
           END-EXEC.

           EXEC CICS ASSIGN STARTCODE(WS-STARTCODE)
                RESP(WS-RESP)
           END-EXEC.

           EXEC CICS ASSIGN PRINSYSID(WS-PRINSYSID)
                RESP(WS-RESP)
           END-EXEC.

           EXEC CICS ASSIGN INVOKINGPROG(WS-INVOKEPROG)
                RESP(WS-RESP)
           END-EXEC.
           IF WS-INVOKEPROG NOT = SPACES
              MOVE 'C' To WS-FLAG
              MOVE COMMA-DATA  TO WRITE-MSG-MSG
              MOVE EIBCALEN    TO WS-RECV-LEN
           ELSE
              EXEC CICS RECEIVE INTO(WS-RECV)
                  LENGTH(WS-RECV-LEN)
                  RESP(WS-RESP)
              END-EXEC
              MOVE 'R' To WS-FLAG
              MOVE WS-RECV-DATA  TO WRITE-MSG-MSG
              SUBTRACT 5 FROM WS-RECV-LEN
           END-IF.

           MOVE 'GENAERRS' TO STSQ-NAME.
           IF WRITE-MSG-MSG(1:2) = 'Q=' THEN
              MOVE WRITE-MSG-MSG(3:4) TO STSQ-EXT
              MOVE WRITE-MSG-REST TO TEMPO
              MOVE TEMPO          TO WRITE-MSG-MSG
              SUBTRACT 7 FROM WS-RECV-LEN
           END-IF.

           ADD 5 TO WS-RECV-LEN.

      * Write output message to TDQ CSMT
      *
           EXEC CICS WRITEQ TD QUEUE(STDQ-NAME)
                     FROM(WRITE-MSG)
                     RESP(WS-RESP)
                     LENGTH(WS-RECV-LEN)

           END-EXEC.

      * Write output message to Genapp TSQ
      * If no space is available then the task will not wait for
      *  storage to become available but will ignore the request...
      *
           EXEC CICS WRITEQ TS QUEUE(STSQ-NAME)
                     FROM(WRITE-MSG)
                     RESP(WS-RESP)
                     NOSUSPEND
                     LENGTH(WS-RECV-LEN)

           END-EXEC.

           If WS-FLAG = 'R' Then
             EXEC CICS SEND TEXT FROM(FILLER-X)
              WAIT
              ERASE
              LENGTH(1)
              FREEKB
             END-EXEC.

           EXEC CICS RETURN
           END-EXEC.

       A-EXIT.
           EXIT.
           GOBACK.

