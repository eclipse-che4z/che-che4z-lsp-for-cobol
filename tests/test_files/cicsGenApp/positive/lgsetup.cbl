      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      * Delete TSQ GENACNTL and put new low/high customer values       *
      *  to match DB2 restored database                                *
      *                                                                *
      * Recreate Named Counter GENACUSTNUM for next available customer *
      *  number.                                                       *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGSETUP.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-FLAG-TSQE              PIC X.
       01  WS-FLAG-TSQH              PIC X.
       01  WS-FLAG-TSQL              PIC X.
       01  WS-FLAG                   PIC X.
       01  WS-RESP                   PIC S9(8) COMP.
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

       01  WRITE-MSG.
         03 WRITE-MSG-E            PIC X(20) Value '**** GENAPP CNTL'.
         03 WRITE-MSG-L              PIC X(13) Value 'LOW CUSTOMER='.
         03 WRITE-MSG-LOW            PIC 9(10).
         03 FILLER                   PIC X.
         03 WRITE-MSG-H              PIC X(14) Value 'HIGH CUSTOMER='.
         03 WRITE-MSG-High           PIC 9(10).
         03 FILLER                   Pic X(60).
      *
       01  FrstCustNum               PIC S9(8)  Value +0000001.
       01  LastCustNum               PIC S9(8)  Value +0000011 COMP.
       01  GENAcount                 PIC X(16) Value 'GENACUSTNUM'.
       01  GENApool                  PIC X(8)  Value 'GENA'.
       01  STSQ-STRT                 PIC X(8)  Value 'GENASTRT'.
       01  STSQ-STAT                 PIC X(8)  Value 'GENASTAT'.
       01  STSQ-ERRS                 PIC X(8)  Value 'GENAERRS'.
       01  GENACNT100                PIC X(16) Value 'GENA01ICUS00'.
       01  GENACNT199                PIC X(16) Value 'GENA01ICUS99'.
       01  GENACNT200                PIC X(16) Value 'GENA01ACUS00'.
       01  GENACNT299                PIC X(16) Value 'GENA01ACUS99'.
       01  GENACNT300                PIC X(16) Value 'GENA01IMOT00'.
       01  GENACNT399                PIC X(16) Value 'GENA01IMOT99'.
       01  GENACNT400                PIC X(16) Value 'GENA01AMOT00'.
       01  GENACNT499                PIC X(16) Value 'GENA01AMOT99'.
       01  GENACNT500                PIC X(16) Value 'GENA01DMOT00'.
       01  GENACNT599                PIC X(16) Value 'GENA01DMOT99'.
       01  GENACNT600                PIC X(16) Value 'GENA01UMOT00'.
       01  GENACNT699                PIC X(16) Value 'GENA01UMOT99'.
       01  GENACNT700                PIC X(16) Value 'GENA01IEND00'.
       01  GENACNT799                PIC X(16) Value 'GENA01IEND99'.
       01  GENACNT800                PIC X(16) Value 'GENA01AEND00'.
       01  GENACNT899                PIC X(16) Value 'GENA01AEND99'.
       01  GENACNT900                PIC X(16) Value 'GENA01DEND00'.
       01  GENACNT999                PIC X(16) Value 'GENA01DEND99'.
       01  GENACNTA00                PIC X(16) Value 'GENA01UEND00'.
       01  GENACNTA99                PIC X(16) Value 'GENA01UEND99'.
       01  GENACNTB00                PIC X(16) Value 'GENA01IHOU00'.
       01  GENACNTB99                PIC X(16) Value 'GENA01IHOU99'.
       01  GENACNTC00                PIC X(16) Value 'GENA01AHOU00'.
       01  GENACNTC99                PIC X(16) Value 'GENA01AHOU99'.
       01  GENACNTD00                PIC X(16) Value 'GENA01DHOU00'.
       01  GENACNTD99                PIC X(16) Value 'GENA01DHOU99'.
       01  GENACNTE00                PIC X(16) Value 'GENA01UHOU00'.
       01  GENACNTE99                PIC X(16) Value 'GENA01UHOU99'.
       01  GENACNTF00                PIC X(16) Value 'GENA01ICOM00'.
       01  GENACNTF99                PIC X(16) Value 'GENA01ICOM99'.
       01  GENACNTG00                PIC X(16) Value 'GENA01ACOM00'.
       01  GENACNTG99                PIC X(16) Value 'GENA01ACOM99'.
       01  GENACNTH00                PIC X(16) Value 'GENA01DCOM00'.
       01  GENACNTH99                PIC X(16) Value 'GENA01DCOM99'.
       01  GENACNTI00                PIC X(16) Value 'GENA01UCUS00'.
       01  GENACNTI99                PIC X(16) Value 'GENA01UCUS99'.
       01  STSQ.
         03  STSQ-NAME                 PIC X(8) Value 'GENACNTL'.
       01  FILLER REDEFINES STSQ.
         03 FILLER                   PIC X(4).
         03 STSQ-EXT                 PIC X(4).

       01 TEMPO                      PIC X(90) VALUE SPACES.
       01 CA-AREA.
         03  CA-CUSTOMER-NUM         Pic X(10).
         03  Filler                  Pic X(72).
      *
       77 MSGEND                     PIC X(24) VALUE
                                        'Transaction ended      '.
       77 F82                        Pic S9(4) Comp Value 82.
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
           EXEC CICS RECEIVE INTO(WS-RECV)
               LENGTH(WS-RECV-LEN)
               RESP(WS-RESP)
           END-EXEC
           If WS-RECV-LEN > 5
             Subtract 5 From WS-RECV-LEN
             Move WS-RECV-DATA(1:WS-RECV-LEN)  To LastCustNum
           End-if
      *
      **************************************************
           Exec CICS DeleteQ TS Queue(STSQ-ERRS)
                     Resp(WS-RESP)
           End-Exec.
      **************************************************
           Exec CICS DeleteQ TS Queue(STSQ-STRT)
                     Resp(WS-RESP)
           End-Exec.
      **************************************************
           Exec CICS DeleteQ TS Queue(STSQ-STAT)
                     Resp(WS-RESP)
           End-Exec.
      **************************************************
           Exec CICS DeleteQ TS Queue(STSQ-NAME)
                     Resp(WS-RESP)
           End-Exec.

           Move FrstCustNum  to WRITE-MSG-LOW
           Move LastCustNum  to WRITE-MSG-HIGH

             EXEC CICS WRITEQ TS QUEUE(STSQ-NAME)
                       FROM(WRITE-MSG-E)
                       RESP(WS-RESP)
                       NOSUSPEND
                       LENGTH(20)
             END-EXEC

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
      *
      **************************************************
           Exec CICS Delete Counter(GENAcount)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENAcount)
                            Pool(GENApool)
                            Value(LastCustNum)
                            Resp(WS-RESP)
           End-Exec.
      *
           Exec CICS Delete Counter(GENACNT100)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT100)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT199)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT199)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT200)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT200)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT299)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT299)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
      *
           Exec CICS Delete Counter(GENACNT300)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT300)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT399)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT399)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT400)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT400)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT499)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT499)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT500)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT500)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT599)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT599)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT600)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT600)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT699)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT699)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
      *
           Exec CICS Delete Counter(GENACNT700)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT700)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT799)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT799)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT800)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT800)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT899)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT899)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT900)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT900)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNT999)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNT999)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTA00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTA00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTA99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTA99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
      *
           Exec CICS Delete Counter(GENACNTB00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTB00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTB99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTB99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTC00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTC00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTC99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTC99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTD00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTD00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTD99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTD99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTE00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTE00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTE99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTE99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
      *
           Exec CICS Delete Counter(GENACNTF00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTF00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTF99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTF99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTG00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTG00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTG99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTG99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTH00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTH00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTH99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTH99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTI00)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTI00)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Delete Counter(GENACNTI99)
                            Pool(GENApool)
                            Resp(WS-RESP)
           End-Exec.
           Exec CICS Define Counter(GENACNTI99)
                            Pool(GENApool)
                            Value(0)
                            Resp(WS-RESP)
           End-Exec.

      *

             EXEC CICS SEND TEXT FROM(WRITE-MSG-H)
              WAIT
              ERASE
              LENGTH(24)
              FREEKB
             END-EXEC

           EXEC CICS RETURN
           END-EXEC.

       A-EXIT.
           EXIT.
           GOBACK.

