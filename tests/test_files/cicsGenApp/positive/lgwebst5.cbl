      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      * Used as repeating transaction for Business Monitor.            *
      *  Obtain values from counters and place statistics data         *
      *   in shared tsq. Will to refresh every 60 seconds...           *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGWEBST5
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  CountVal                   PIC S9(8) COMP.
       01  CountSuccess               PIC S9(9) COMP.
       01  CountErrors                PIC S9(8) COMP.
       01  CountInq                   PIC S9(8) COMP.
       01  CountAdd                   PIC S9(8) COMP.
       01  CountUpd                   PIC S9(8) COMP.
       01  CountDel                   PIC S9(8) COMP.
       01  DRateVal                   PIC 9(9).
       01  NRateVal                   PIC 9(9).
       01  ORateVal                   PIC 9(9).
       01  ICountVal                  PIC 9(6).
       01  OCountVal                  PIC 9(6).
       01  NCountVal                  PIC 9(6).
       01  HHval                      PIC 9(6).
       01  MMval                      PIC 9(6).
       01  SSval                      PIC 9(6).
       01  WS-RESP                    PIC S9(8) COMP.
       01  WS-ABSTIME                 PIC S9(8) COMP VALUE +0.
       01  WS-CODE                    Pic 9(4) Comp.
       01  WS-TIME                    Pic X(8).
       01  WS-Startup                 Pic X(40) Value
                     'GENAPP Statistics collector started.'.
       01  TCPservice                Pic X(8) Value 'SSISTAT1'.
       01  TCPaddress                Pic X(15).
       01  TCPaddrLen                Pic S9(8) Comp sync.
       01  Part1                     Pic X(8).
       01  Part2                     Pic X(8).
       01  Part3                     Pic X(8).
       01  Part4                     Pic X(8).
       01  TSQpre                    Pic X(4).
       01  WS-TSQname                 Pic X(8).
       01  WS-TSQdata                 Pic X(9).
       01  WS-TSQstart                Pic X(24).
       01  WS-HHMMSS.
         03  WS-HH                    Pic X(2).
         03  WS-MM                    Pic X(2).
         03  WS-SS                    Pic X(2).
       01  WS-DATE                    PIC X(10) VALUE SPACES.
       01  StatQ                      PIC X(8)  Value 'GENASTAT'.
       01  TemplateName               PIC X(48) Value 'GENAST3TEMP'.
       01  WS-APPLID                  PIC X(8).
       01  WS-TOKEN                   PIC X(16).
       01  WS-TEXT                    PIC X(2)  Value 'OK'.
       01  WS-MTYPE                   Pic X(56) Value 'text/html'.
       01  WS-CHARSET                 Pic X(40) Value 'ISO-8859-1'.
       01  WS-OLDV.
         02 WS-OLDVHH                 Pic X(2).
         02 WS-OLDVMM                 Pic X(2).
         02 WS-OLDVSS                 Pic X(2).
       01  WS-NEWV                    PIC X(6).
       01  WRITE-MSG-H                PIC X(24) Value '  Statistics.'.
       01  WS-HEADER.
          03 WS-EYECATCHER            PIC X(16)
                                       VALUE 'LGWEBST5------WS'.
          03 WS-TRANSID               PIC X(4).
          03 WS-TERMID                PIC X(4).
          03 WS-TASKNUM               PIC 9(7).
          03 WS-CALEN                 PIC 9(7).
       01  SymbList.
          03  Filler                  Pic X(7)  Value 'APPLID='.
          03  S1                      Pic X(8)  Value Spaces.
          03  Filler                  Pic X(13) Value '&GENACount-V='.
          03  S2                      Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT100-V='.
          03  S3                      Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT199-V='.
          03  S4                      Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT200-V='.
          03  S5                      Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT299-V='.
          03  S6                      Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT300-V='.
          03  S7                      Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT399-V='.
          03  S8                      Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT400-V='.
          03  S9                      Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT499-V='.
          03  S10                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT500-V='.
          03  S11                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT599-V='.
          03  S12                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT600-V='.
          03  S13                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT699-V='.
          03  S14                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT700-V='.
          03  S15                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT799-V='.
          03  S16                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT800-V='.
          03  S17                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT899-V='.
          03  S18                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNT900-V='.
          03  S19                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNT999-V='.
          03  S20                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTA00-V='.
          03  S21                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTA99-V='.
          03  S22                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTB00-V='.
          03  S23                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTB99-V='.
          03  S24                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTC00-V='.
          03  S25                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTC99-V='.
          03  S26                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTD00-V='.
          03  S27                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTD99-V='.
          03  S28                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTE00-V='.
          03  S29                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTE99-V='.
          03  S30                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTF00-V='.
          03  S31                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTF99-V='.
          03  S32                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTG00-V='.
          03  S33                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTG99-V='.
          03  S34                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTH00-V='.
          03  S35                     Pic X(9).
          03  Filler                  Pic X(14) Value '&GENACNTH99-V='.
          03  S36                     Pic Z(8)9.
          03  Filler                  Pic X(14) Value '&GENACNTI99-V='.
          03  S37                     Pic Z(9)9.
          03  Filler                  Pic X(14) Value '&GENAsucces-V='.
          03  S38                     Pic Z(9)9.
          03  Filler                  Pic X(14) Value '&GENAerrors-V='.
          03  S39                     Pic Z(9)9.
          03  Filler                  Pic X(14) Value '&GENAstart='.
          03  S40                     Pic X(16).
       01 GENACount-V                 Pic 9(9)  Display.
       01 GENACNT100-V                Pic 9(9)  Display.
       01 GENACNT199-V                Pic 9(9)  Display.
       01 GENACNT200-V                Pic 9(9)  Display.
       01 GENACNT299-V                Pic 9(9)  Display.
       01 GENACNT300-V                Pic 9(9)  Display.
       01 GENACNT399-V                Pic 9(9)  Display.
       01 GENACNT400-V                Pic 9(9)  Display.
       01 GENACNT499-V                Pic 9(9)  Display.
       01 GENACNT500-V                Pic 9(9)  Display.
       01 GENACNT599-V                Pic 9(9)  Display.
       01 GENACNT600-V                Pic 9(9)  Display.
       01 GENACNT699-V                Pic 9(9)  Display.
       01 GENACNT700-V                Pic 9(9)  Display.
       01 GENACNT799-V                Pic 9(9)  Display.
       01 GENACNT800-V                Pic 9(9)  Display.
       01 GENACNT899-V                Pic 9(9)  Display.
       01 GENACNT900-V                Pic 9(9)  Display.
       01 GENACNT999-V                Pic 9(9)  Display.
       01 GENACNTA00-V                Pic 9(9)  Display.
       01 GENACNTA99-V                Pic 9(9)  Display.
       01 GENACNTB00-V                Pic 9(9)  Display.
       01 GENACNTB99-V                Pic 9(9)  Display.
       01 GENACNTC00-V                Pic 9(9)  Display.
       01 GENACNTC99-V                Pic 9(9)  Display.
       01 GENACNTD00-V                Pic 9(9)  Display.
       01 GENACNTD99-V                Pic 9(9)  Display.
       01 GENACNTE00-V                Pic 9(9)  Display.
       01 GENACNTE99-V                Pic 9(9)  Display.
       01 GENACNTF00-V                Pic 9(9)  Display.
       01 GENACNTF99-V                Pic 9(9)  Display.
       01 GENACNTG00-V                Pic 9(9)  Display.
       01 GENACNTG99-V                Pic 9(9)  Display.
       01 GENACNTH00-V                Pic 9(9)  Display.
       01 GENACNTH99-V                Pic 9(9)  Display.
       01 GENACNTI00-V                Pic 9(9)  Display.
       01 GENACNTI99-V                Pic 9(9)  Display.
       01 GENAsucces-V                Pic 9(9)  Display.
       01 GENAerrors-V                Pic 9(9)  Display.

       01  GENAcount                 PIC X(16) Value 'GENACUSTNUM'.
       01  GENApool                  PIC X(8)  Value 'GENA'.
       01  GENACNT100                PIC X(16) Value 'GENA01ICUS00'.
       01  GENACNT199                PIC X(32) Value 'GENA01ICUS99'.
       01  GENACNT200                PIC X(16) Value 'GENA01ACUS00'.
       01  GENACNT299                PIC X(32) Value 'GENA01ACUS99'.
       01  GENACNT300                PIC X(16) Value 'GENA01IMOT00'.
       01  GENACNT399                PIC X(32) Value 'GENA01IMOT99'.
       01  GENACNT400                PIC X(16) Value 'GENA01AMOT00'.
       01  GENACNT499                PIC X(32) Value 'GENA01AMOT99'.
       01  GENACNT500                PIC X(16) Value 'GENA01DMOT00'.
       01  GENACNT599                PIC X(32) Value 'GENA01DMOT99'.
       01  GENACNT600                PIC X(16) Value 'GENA01UMOT00'.
       01  GENACNT699                PIC X(32) Value 'GENA01UMOT99'.
       01  GENACNT700                PIC X(16) Value 'GENA01IEND00'.
       01  GENACNT799                PIC X(32) Value 'GENA01IEND99'.
       01  GENACNT800                PIC X(16) Value 'GENA01AEND00'.
       01  GENACNT899                PIC X(32) Value 'GENA01AEND99'.
       01  GENACNT900                PIC X(16) Value 'GENA01DEND00'.
       01  GENACNT999                PIC X(32) Value 'GENA01DEND99'.
       01  GENACNTA00                PIC X(16) Value 'GENA01UEND00'.
       01  GENACNTA99                PIC X(32) Value 'GENA01UEND99'.
       01  GENACNTB00                PIC X(16) Value 'GENA01IHOU00'.
       01  GENACNTB99                PIC X(32) Value 'GENA01IHOU99'.
       01  GENACNTC00                PIC X(16) Value 'GENA01AHOU00'.
       01  GENACNTC99                PIC X(32) Value 'GENA01AHOU99'.
       01  GENACNTD00                PIC X(16) Value 'GENA01DHOU00'.
       01  GENACNTD99                PIC X(32) Value 'GENA01DHOU99'.
       01  GENACNTE00                PIC X(16) Value 'GENA01UHOU00'.
       01  GENACNTE99                PIC X(32) Value 'GENA01UHOU99'.
       01  GENACNTF00                PIC X(16) Value 'GENA01ICOM00'.
       01  GENACNTF99                PIC X(32) Value 'GENA01ICOM99'.
       01  GENACNTG00                PIC X(16) Value 'GENA01ACOM00'.
       01  GENACNTG99                PIC X(32) Value 'GENA01ACOM99'.
       01  GENACNTH00                PIC X(16) Value 'GENA01DCOM00'.
       01  GENACNTH99                PIC X(32) Value 'GENA01DCOM99'.
       01  GENACNTI99                PIC X(16) Value 'GENAOTHER   '.

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
           INITIALIZE WS-HEADER.

           MOVE EIBTRNID TO WS-TRANSID.
           MOVE EIBTRMID TO WS-TERMID.
           MOVE EIBTASKN TO WS-TASKNUM.
           MOVE EIBCALEN TO WS-CALEN.
      ****************************************************************
           MOVE 'GENA'  To TSQpre
           EXEC CICS ASKTIME ABSTIME(WS-ABSTIME)
           END-EXEC
           EXEC CICS FORMATTIME ABSTIME(WS-ABSTIME)
                     MMDDYYYY(WS-DATE)
                     TIME(WS-TIME)
           END-EXEC
           Perform Tran-Rate-Interval

           Exec CICS Query Counter(GENAcount)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Move CountVal  To GENAcount-V
           Move GENAcount-V  To S3
           String TSQpre,
                  'X05V' Delimited By Spaces
                  Into WS-TSQname
           Move S3           To NRateVal
           Perform Tran-Rate-Counts
      *
           Exec CICS Query Counter(GENACNT100)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Move CountVal  To CountSuccess
           Move CountVal  To CountInq
           Move CountVal  To GENACNT100-V
           Move GENACNT100-V To S3
           String TSQpre,
                  '100V' Delimited By Spaces
                  Into WS-TSQname
           Move S3           To NRateVal
           Perform Tran-Rate-Counts

           Exec CICS Query Counter(GENACNT199)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Move CountVal  To CountErrors
           Move CountVal  To GENACNT199-V
           Move GENACNT199-V To S4
           Exec CICS Query Counter(GENACNT200)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To CountAdd
           Move CountVal  To GENACNT200-V
           Move GENACNT200-V To S5
           String TSQpre,
                  '200V' Delimited By Spaces
                  Into WS-TSQname
           Move S5           To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT299)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT299-V
           Move GENACNT299-V To S6
      *
           Exec CICS Query Counter(GENACNT300)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNT300-V
           Compute CountInq = CountInq + CountVal
           Move GENACNT300-V To S7
           String TSQpre,
                  '300V' Delimited By Spaces
                  Into WS-TSQname
           Move S7           To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT399)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT399-V
           Move GENACNT399-V To S8
           Exec CICS Query Counter(GENACNT400)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNT400-V
           Compute CountAdd = CountAdd + CountVal
           Move GENACNT400-V To S9
           String TSQpre,
                  '400V' Delimited By Spaces
                  Into WS-TSQname
           Move S9           To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT499)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT499-V
           Move GENACNT499-V To S10
           Exec CICS Query Counter(GENACNT500)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNT500-V
           Move CountVal  To CountDel
           Move GENACNT500-V To S11
           String TSQpre,
                  '500V' Delimited By Spaces
                  Into WS-TSQname
           Move S11          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT599)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT599-V
           Move GENACNT599-V To S12
           Exec CICS Query Counter(GENACNT600)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNT600-V
           Move CountVal  To CountUpd
           Move GENACNT600-V To S13
           String TSQpre,
                  '600V' Delimited By Spaces
                  Into WS-TSQname
           Move S13          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT699)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT699-V
           Move GENACNT699-V To S14
      *
           Exec CICS Query Counter(GENACNT700)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNT700-V
           Compute CountInq = CountInq + CountVal
           Move GENACNT700-V To S15
           String TSQpre,
                  '700V' Delimited By Spaces
                  Into WS-TSQname
           Move S15          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT799)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT799-V
           Move GENACNT799-V To S16
           Exec CICS Query Counter(GENACNT800)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNT800-V
           Compute CountAdd = CountAdd + CountVal
           Move GENACNT800-V To S17
           String TSQpre,
                  '800V' Delimited By Spaces
                  Into WS-TSQname
           Move S17          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT899)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT899-V
           Move GENACNT899-V To S18
           Exec CICS Query Counter(GENACNT900)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNT900-V
           Compute CountDel = CountDel + CountVal
           Move GENACNT900-V To S19
           String TSQpre,
                  '900V' Delimited By Spaces
                  Into WS-TSQname
           Move S19          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNT999)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNT999-V
           Move GENACNT999-V To S20
           Exec CICS Query Counter(GENACNTA00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTA00-V
           Compute CountUpd = CountUpd + CountVal
           Move GENACNTA00-V To S21
           String TSQpre,
                  'A00V' Delimited By Spaces
                  Into WS-TSQname
           Move S21          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTA99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTA99-V
           Move GENACNTA99-V To S22
      *
           Exec CICS Query Counter(GENACNTB00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTB00-V
           Compute CountInq = CountInq + CountVal
           Move GENACNTB00-V To S23
           String TSQpre,
                  'B00V' Delimited By Spaces
                  Into WS-TSQname
           Move S23          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTB99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTB99-V
           Move GENACNTB99-V To S24
           Exec CICS Query Counter(GENACNTC00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTC00-V
           Compute CountAdd = CountAdd + CountVal
           Move GENACNTC00-V To S25
           String TSQpre,
                  'C00V' Delimited By Spaces
                  Into WS-TSQname
           Move S25          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTC99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTC99-V
           Move GENACNTC99-V To S26
           Exec CICS Query Counter(GENACNTD00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTD00-V
           Compute CountDel = CountDel + CountVal
           Move GENACNTD00-V To S27
           String TSQpre,
                  'D00V' Delimited By Spaces
                  Into WS-TSQname
           Move S27          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTD99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTD99-V
           Move GENACNTD99-V To S28
           Exec CICS Query Counter(GENACNTE00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTE00-V
           Compute CountUpd = CountUpd + CountVal
           Move GENACNTE00-V To S29
           String TSQpre,
                  'E00V' Delimited By Spaces
                  Into WS-TSQname
           Move S29          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTE99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTE99-V
           Move GENACNTE99-V To S30
      *
           Exec CICS Query Counter(GENACNTF00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTF00-V
           Compute CountInq = CountInq + CountVal
           Move GENACNTF00-V To S31
           String TSQpre,
                  'F00V' Delimited By Spaces
                  Into WS-TSQname
           Move S31          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTF99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTF99-V
           Move GENACNTF99-V To S32
           Exec CICS Query Counter(GENACNTG00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTG00-V
           Compute CountAdd = CountAdd + CountVal
           Move GENACNTG00-V To S33
           String TSQpre,
                  'G00V' Delimited By Spaces
                  Into WS-TSQname
           Move S33          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTG99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTG99-V
           Move GENACNTG99-V To S34
           Exec CICS Query Counter(GENACNTH00)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountSuccess = CountSuccess + CountVal
           Move CountVal  To GENACNTH00-V
           Compute CountDel = CountDel + CountVal
           Move GENACNTH00-V To S35
           String TSQpre,
                  'H00V' Delimited By Spaces
                  Into WS-TSQname
           Move S35          To NRateVal
           Perform Tran-Rate-Counts
           Exec CICS Query Counter(GENACNTH99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Compute CountErrors  = CountErrors + CountVal
           Move CountVal  To GENACNTH99-V
           Move GENACNTH99-V To S36

      *
           Exec CICS Query Counter(GENACNTI99)
                            Pool(GENApool)
                            Value(CountVal)
                            Resp(WS-RESP)
           End-Exec.
           Move CountVal  To GENACNTI99-V
           Move GENACNTI99-V To S37
      *
           Move CountSuccess To GENAsucces-V
           Move Counterrors  To GENAerrors-V
           Move GENAsucces-V To S38
           Move GENAerrors-V To S39
           String TSQpre,
                  'X00V' Delimited By Spaces
                  Into WS-TSQname
           Move S38          To NRateVal
           Perform Tran-Rate-Counts
      *
           String TSQpre,
                  'X01V' Delimited By Spaces
                  Into WS-TSQname
           Move CountInq     To NRateVal
           Perform Tran-Rate-Counts
           String TSQpre,
                  'X02V' Delimited By Spaces
                  Into WS-TSQname
           Move CountAdd     To NRateVal
           Perform Tran-Rate-Counts
           String TSQpre,
                  'X03V' Delimited By Spaces
                  Into WS-TSQname
           Move CountUpd     To NRateVal
           Perform Tran-Rate-Counts
           String TSQpre,
                  'X04V' Delimited By Spaces
                  Into WS-TSQname
           Move CountDel     To NRateVal
           Perform Tran-Rate-Counts

      ****************************************************************

           EXEC CICS ASSIGN APPLID(WS-APPLID)
           END-EXEC.
           Move WS-APPLID To S1.


           EXEC CICS RETURN
           END-EXEC.

       A-EXIT.
           EXIT.
           GOBACK.

       Tran-Rate-Interval.

           String TSQpre,
                  '000V' Delimited By Spaces
                  Into WS-TSQname
           Exec Cics ReadQ TS Queue(WS-TSQname)
                     Into(WS-OLDV)
                     Item(1)
                     Length(Length of WS-OLDV)
                     Resp(WS-RESP)
           End-Exec.
           If WS-RESP Not = DFHRESP(NORMAL)
            Move '120000' To WS-OLDV.

           Exec Cics DeleteQ TS Queue(WS-TSQNAME)
                     Resp(WS-RESP)
           End-Exec.

           Move WS-TIME   To WS-HHMMSS
           Exec Cics WRITEQ TS Queue(WS-TSQNAME)
                     FROM(WS-HHMMSS)
                     Length(Length of WS-HHMMSS)
                     Resp(WS-RESP)
           End-Exec.
           Move WS-HH     To HHVal
           Move WS-MM     To MMVal
           Move WS-SS     To SSVal
           Compute NCountVal = (HHVal * 3600) +
                               (MMVal * 60)   +
                                SSVal
           Move WS-OLDVHH To HHVal
           Move WS-OLDVMM To MMVal
           Move WS-OLDVSS To SSVal
           Compute OCountVal = (HHVal * 3600) +
                               (MMVal * 60)   +
                                SSVal
           Compute ICountVal = NCountVal - OCountVal
           move ICountVal To WS-NEWV
           String TSQpre,
                  '000V' Delimited By Spaces
                  Into WS-TSQname
           Exec Cics WRITEQ TS Queue(WS-TSQNAME)
                     FROM(WS-NEWV)
                     Length(Length of WS-NEWV)
                     Resp(WS-RESP)
           End-Exec.
           Exec Cics Start Transid('SSST')
                     After
                     Minutes(1)
                     Resp(WS-RESP)
           End-Exec.

           Exit.

       Tran-Rate-Counts.

           Exec Cics ReadQ TS Queue(WS-TSQname)
                     Into(WS-TSQdata)
                     Item(1)
                     Length(Length of WS-TSQdata)
                     Resp(WS-RESP)
           End-Exec.
           Move WS-TSQdata  To ORateVal
           Exec Cics DeleteQ TS Queue(WS-TSQname)
                     Resp(WS-RESP)
           End-Exec.

           Move NRateVal  To WS-TSQdata
           Exec Cics WRITEQ TS Queue(WS-TSQname)
                     FROM(WS-TSQdata)
                     Length(Length of WS-TSQdata)
                     Resp(WS-RESP)
           End-Exec.
           Move ORateVal   To WS-TSQdata
           Exec Cics WRITEQ TS Queue(WS-TSQname)
                     FROM(WS-TSQdata)
                     Length(Length of WS-TSQdata)
                     Resp(WS-RESP)
           End-Exec.
           Compute DRateVal = NRateVal - ORateVal
           Move DRateVal   To WS-TSQdata
           Exec Cics WRITEQ TS Queue(WS-TSQname)
                     FROM(WS-TSQdata)
                     Length(Length of WS-TSQdata)
                     Resp(WS-RESP)
           End-Exec.

           Exit.
