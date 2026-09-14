       IDENTIFICATION DIVISION.
       PROGRAM-ID.    TEST1.
       ENVIRONMENT DIVISION.
       IDMS-CONTROL SECTION.
           PROTOCOL. MODE ABC.
           IDMS-RECORDS MANUAL
       DATA DIVISION.
       WORKING-STORAGE SECTION.
001800 WORKING-STORAGE SECTION.
001900 01  WS-AREA.                                                       D00000
002000     03 AREA-XW1.                                                   D00000
003200       05 DPRSRT-XW1             PIC X(2)    VALUE SPACE.           D00030
003700     03 AREA-XW2.                                                   D00066
004100       05 OPTOKEIND-XW2          PIC X.                             D0006B
004200     03 AREA-XW3.                                                   D0006C
004500       05 GEWKLSKOD-XW3.                                            D0006E
004600         07 GEWKLSKOD-NW3        PIC 9(2)    VALUE ZERO.            D0006E
004700     03 AREA-XW4.                                                   D00070
004800       05 RUSOPT-BW4             PIC S9(4)   VALUE ZERO  COMP.      D00070
004900       05 TBLOPT-XW4.                                               D00072
005000         07 ROWOPT-XW4                       OCCURS 1000.           D00072
005100           09 OPTIDE-NW4         PIC 9(6)    VALUE ZERO.            D00072
005200           09 BSSOPTIND-XW4      PIC X.                             D00078
005300           09 BSSTSTIND-XW4      PIC X.                             D00079
005400           09 TBLCRI-XW4.                                           D0007A
005500             11 RUSCRI-BW4       PIC S9(2)   VALUE ZERO  COMP.      D0007A
005600             11 ROWCRI-XW4                   OCCURS 40.             D0007C
005700               13 COPY MAID POLCRI-XRI WRK.
005800     03 AREA-XW5.                                                   D0FB82
005900       05 INCEXCKOD-XW5          PIC X.                             D0FB82
006000       05 CRI-BW5                PIC S9(2)   VALUE ZERO  COMP.      D0FB83
006100       05 TBLCRI-XW5  COPY-FROM W4.
006200     03 AREA-XW6.                                                   D10807
006300       05 TBLCRI-XW6  COPY-FROM W4.
     1 01  POLCRI-XRI.                                                      80
     2     03 VLGNUM-BRI               PIC S9(4)   VALUE ZERO  COMP.         1
       PROCEDURE DIVISION.
034400     MOVE POLCRI-XRI             TO POLCRI-XW5.                     P01AA8
           DISPLAY NOT_EXISTING.
