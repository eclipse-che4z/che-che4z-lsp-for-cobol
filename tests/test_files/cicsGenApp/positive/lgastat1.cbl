      ******************************************************************
      *                                                                *
      * (C) Copyright IBM Corp. 2011, 2020                             *
      *                                                                *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LGASTAT1.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *
       DATA DIVISION.

       WORKING-STORAGE SECTION.

      * Run time (debug) infomation for this invocation
        01  WS-ABSTIME                 PIC S9(8) COMP VALUE +0.
        01  WS-TIME                    Pic X(8).
        01  WS-DATE                    Pic X(10).
        01  WS-QAREA.
          03  WS-Area-D                Pic X(8).
          03  Filler                   Pic XX Value spaces.
          03  WS-Area-T                Pic X(6).
        01  WS-Qname                   Pic X(8) value 'GENASTRT'.
        01  WS-CONTname        Pic X(16) value 'DFHEP.CCECONTEXT'.
        01  WS-CHANname        Pic X(16) value 'DFHEP.EVENT'.
        01  WS-CHANname1       Pic X(16) value 'DFHEP.DATA.00001'.
        01  WS-CHANname2       Pic X(16) value 'DFHEP.DATA.00002'.
        01  WS-Data-Req                Pic X(6).
        01  WS-Data-RC                 Pic X(2).
        01  WS-HEADER.
           03 WS-EYECATCHER            PIC X(16)
                                        VALUE 'LGASTAT1------WS'.
           03 WS-TRANSID               PIC X(4).
           03 WS-TERMID                PIC X(4).
           03 WS-TASKNUM               PIC 9(7).
           03 WS-CALEN                 PIC 9(7).
       01  WS-RESP                     PIC S9(8) COMP.
       01  GENAcount.
         03 Filler                     Pic X(4) Value 'GENA'.
         03 GENAcounter                Pic X(6).
         03 GENAtype                   Pic X(2).
         03 Filler                     Pic X(4) Value '    '.
       01  Trancount                   Pic S9(8) COMP.

      *
       01  WS-COMMAREA-LENGTHS.
           03 WS-CA-HEADER-LEN         PIC S9(4) COMP VALUE +18.
           03 WS-REQUIRED-CA-LEN       PIC S9(4)      VALUE +0.
       77  LGACDB01                    PIC X(8)       VALUE 'LGACDB01'.
       77  LGACVS01                    PIC X(8)       VALUE 'LGACVS01'.
       77  ATRANID                     PIC X(4)       VALUE 'DSC1'.
       77  GENApool                    PIC X(8)  Value 'GENA'.
       77  STSQ-name                   PIC X(8)  Value 'STEWSTEW'.
       77  GENAOTHER                   PIC X(9)  Value 'GENAOTHER'.

      ******************************************************************
      *    L I N K A G E     S E C T I O N
      ******************************************************************
       LINKAGE SECTION.
      *
       01  DFHCOMMAREA.
             COPY LGCMAREA.

      ******************************************************************
      *    P R O C E D U R E S
      ******************************************************************
       PROCEDURE DIVISION.

       MAINLINE SECTION.

      *
           INITIALIZE WS-HEADER.
      *
           MOVE EIBTRNID TO WS-TRANSID.
           MOVE EIBTRMID TO WS-TERMID.
           MOVE EIBTASKN TO WS-TASKNUM.
           MOVE EIBCALEN TO WS-CALEN.
      *
           Exec CICS Get Container(WS-CHANname1)
                         Into(WS-Data-Req)
                         Resp(WS-RESP)
           End-Exec.
      *
           Exec CICS Get Container(WS-CHANname2)
                         Into(WS-Data-RC)
                         Resp(WS-RESP)
           End-Exec.
      *
           If WS-RESP = DFHRESP(NORMAL)
             Move WS-Data-REQ  To  GENACounter
             Move WS-Data-RC   To  GENAType
           Else
             IF EIBCALEN IS EQUAL TO ZERO
                 EXEC CICS RETURN END-EXEC
             Else
               Move CA-REQUEST-ID  To GENAcounter
               Move CA-RETURN-CODE To GENAtype
             End-if
           End-if.
      *
           Exec Cics ReadQ TS Queue(WS-Qname)
                     Into(WS-Qarea)
                     Length(Length of WS-Qarea)
                     Resp(WS-RESP)
           End-Exec.
           If WS-RESP     = DFHRESP(QIDERR) Then
             EXEC CICS ASKTIME ABSTIME(WS-ABSTIME)
             END-EXEC
             EXEC CICS FORMATTIME ABSTIME(WS-ABSTIME)
                       DDMMYYYY(WS-DATE)
                       TIME(WS-TIME)
             END-EXEC
             Move WS-Date To WS-area-D
             Move WS-Time To WS-area-T
             Exec Cics WriteQ TS Queue(WS-Qname)
                       From(WS-Qarea)
                       Length(Length of WS-Qarea)
                       Resp(WS-RESP)
             End-Exec
           End-if
      *
           If GENAcounter = '02ACUS'
                                     Move '01ACUS' to GENAcounter.
           If GENAcounter = '02ICOM' or
              GENAcounter = '03ICOM' or
              GENAcounter = '05ICOM' Move '01ICOM' to GENAcounter.
           If GENAType Not = '00' Move '99' To GENAtype.

               Exec CICS Get Counter(GENAcount)
                             Pool(GENApool)
                             Value(Trancount)
                             Resp(WS-RESP)
               End-Exec

           EXEC CICS RETURN END-EXEC.

       MAINLINE-EXIT.
           EXIT.
      *----------------------------------------------------------------*

