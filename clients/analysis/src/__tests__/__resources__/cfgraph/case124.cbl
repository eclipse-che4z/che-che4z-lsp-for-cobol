       IDENTIFICATION DIVISION.
       PROGRAM-ID. tets67.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
        FILE SECTION.
        WORKING-STORAGE SECTION.
        01 var pic x.
        LINKAGE SECTION.
       PROCEDURE DIVISION.
       SEC1  SECTION.
           PERFORM SEC2
           GOBACK
          .
       SECTION-END.
           EXIT.   
       SEC2  SECTION.
           IF  VAR    = 'BLAH'
              GO TO SECTION-END
           END-IF  .
       SECTION-END.
           EXIT.
       SEC3  SECTION.