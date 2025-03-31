       IDENTIFICATION DIVISION.
       PROGRAM-ID.  PROG.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE1 ASSIGN TO "DATA1".
           SELECT FILE2 ASSIGN TO "DATA1".
           SELECT FILE3 ASSIGN TO "DATA3".
       
       DATA DIVISION.
       FILE SECTION.
       FD FILE1.
       01 REC1.
           88  ENDREC1  VALUE HIGH-VALUES.
           02  NAMEGF       PIC X(20).
               88 ISI VALUE "VALUE1". 
       
       SD FILE2.
       01 REC2.
           88 ENDREC2 VALUE HIGH-VALUES.
           02 NAMEWF        PIC X(20).
       
       FD FILE3.
       01 FIELD1 PIC X(38).
       
       
       WORKING-STORAGE SECTION.       
       01 REC3. 
           02 FILLER  PIC X(25) VALUE "DATA1".
           02 FILLER  PIC X(8)  VALUE "DATA2".
       
       01 REC4.
           02 FILLER PIC X(3) VALUE SPACES.
           02 CNAME       PIC X(20).
           02 PVCOUNT      PIC BBBZZ,ZZ9.
              
       01 VCOUNT            PIC 9(5).
       
       PROCEDURE DIVISION.
       PAR1.
           SORT FILE2 ON ASCENDING NAMEWF
               INPUT PROCEDURE IS PAR2
               OUTPUT PROCEDURE IS PAR3.
           STOP RUN.
       
       PAR2.
           OPEN INPUT FILE1.
             READ FILE1
           AT END SET ENDREC1 TO TRUE
           END-READ
           PERFORM UNTIL ENDREC1
               IF NOT ISI
                   MOVE NAMEGF TO NAMEWF
                   RELEASE REC3
               END-IF
           READ FILE1
               AT END SET ENDREC1 TO TRUE
           END-READ
           END-PERFORM
           CLOSE FILE1.
       
       
       PAR3.
           OPEN OUTPUT FILE3
           WRITE FIELD1 FROM REC3
               AFTER ADVANCING 2 LINES
           RETURN FILE2
           AT END SET ENDREC2 TO TRUE
           END-RETURN
           PERFORM PAR4 UNTIL ENDREC2.
       
       PAR4.
           MOVE ZEROS TO VCOUNT
           PERFORM UNTIL NAMEWF NOT EQUAL TO CNAME
                         OR ENDREC2
           ADD 1 TO VCOUNT
           RETURN FILE2
               AT END SET ENDREC2 TO TRUE
           END-RETURN
           END-PERFORM
           MOVE VCOUNT TO PVCOUNT.
