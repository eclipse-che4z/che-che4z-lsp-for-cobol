0      IDENTIFICATION DIVISION.
1      PROGRAM-ID. TESTREPL.
2      DATA DIVISION.
3      WORKING-STORAGE SECTION.
       01  MY-TEST4Z-COMPONENTS.
           02 FILE-IO-PROGRAM.
                COPY STRUCT.
           02 QSAM-QUICK-TEST.
                COPY REPL1.
                    10 SOME pic x.
            02 FILE-IO-PROGRAM1.
                COPY STRUCT.     
8      PROCEDURE DIVISION.