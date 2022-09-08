1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:08   Page     1
0Options in effect:
  NOADATA
    ADV
    AFP(NOVOLATILE)
    QUOTE
    ARCH(8)
    ARITH(COMPAT)
  NOAWO
  NOBLOCK0
    BUFSIZE(4096)
  NOCICS
    CODEPAGE(1140)
  NOCOMPILE(S)
  NOCOPYLOC
  NOCOPYRIGHT
  NOCURRENCY
    DATA(31)
    DBCS
  NODECK
  NODEFINE
  NODIAGTRUNC
    DISPSIGN(COMPAT)
  NODLL
  NODUMP
  NODYNAM
  NOEXIT
  NOEXPORTALL
  NOFASTSRT
    FLAG(I,I)
  NOFLAGSTD
    HGPR(PRESERVE)
  NOINITCHECK
  NOINITIAL
    INLINE
    INTDATE(ANSI)
  NOINVDATA
    LANGUAGE(EN)
    LINECOUNT(60)
  NOLIST
    LP(32)
  NOMAP
    MAXPCF(100000)
  NOMDECK
  NONAME
    NSYMBOL(NATIONAL)
  NONUMBER
  NONUMCHECK
    NUMPROC(NOPFD)
    OBJECT
  NOOFFSET
    OPTIMIZE(0)
    OUTDD(SYSOUT)
  NOPARMCHECK
    PGMNAME(COMPAT)
    QUALIFY(COMPAT)
    RENT
    RMODE(AUTO)
  NORULES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:08   Page     2
0 NOSERVICE
    SEQUENCE
    SOURCE(DEC)
    SPACE(1)
  NOSQL
    SQLCCSID
  NOSQLIMS
  NOSSRANGE
  NOSTGOPT
    SUPPRESS
  NOTERM
  NOTEST(NODWARF,NOSOURCE,NOSEPARATE)
  NOTHREAD
    TRUNC(STD)
    TUNE(8)
  NOVBREF
    VLR(STANDARD)
    VSAMOPENFS(COMPAT)
  NOWORD
    XMLPARSE(XMLSS)
    XREF(FULL)
    ZWB
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC1A    Date 06/04/2022  Time 11:57:08   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         OBIC14.2
   000002         000200 PROGRAM-ID.                                                      OBIC14.2
   000003         000300     OBIC1A.                                                      OBIC14.2
   000004         000500*                                                              *  OBIC14.2
   000005         000600*    VALIDATION FOR:-                                          *  OBIC14.2
   000006         000700*                                                              *  OBIC14.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".OBIC14.2
   000008         000900*                                                              *  OBIC14.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".OBIC14.2
   000010         001100*                                                              *  OBIC14.2
   000011         001300*                                                              *  OBIC14.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  OBIC14.2
   000013         001500*                                                              *  OBIC14.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  OBIC14.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  OBIC14.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  OBIC14.2
   000017         001900*                                                              *  OBIC14.2
   000018         002100*                                                                 OBIC14.2
   000019         002200*        THE MAIN PROGRAM IC218 CALLS THE SUBPROGRAM IC219 WHICH  OBIC14.2
   000020         002300*    CONTAINS A SORT STATEMENT AND A STOP RUN STATEMENT.  THE     OBIC14.2
   000021         002400*    PURPOSE OF THESE PROGRAMS IS TO VERIFY THAT A SORT STATEMENT OBIC14.2
   000022         002500*    FUNCTIONS CORRECTLY IN A SUBPROGRAM.  THE FIRST NON-DECLARA- OBIC14.2
   000023         002600*    TIVE PORTION OF THE SUBPROGRAM, THE SORT INPUT PROCEDURE AND OBIC14.2
   000024         002700*    THE SORT OUTPUT PROCEDURE ARE CONTAINED IN DIFFERENT SUBPRO- OBIC14.2
   000025         002800*    GRAM SEGMENTS.                                               OBIC14.2
   000026         002900*                                                                 OBIC14.2
   000027         003000*        A CALL IS MADE TO THE SUBPROGRAM IC219.  CONTROL SHOULD  OBIC14.2
   000028         003100*    NOT BE RETURNED TO THIS PROGRAM SINCE IC219 CONTAINS A STOP  OBIC14.2
   000029         003200*    RUN STATEMENT.  THE SUBPROGRAM IC220 CONTAINS THE PRINTER FD OBIC14.2
   000030         003300*    AND PRINTS OUT THE REPORT SHOWING THE TEST RESULTS.          OBIC14.2
   000031         003400*                                                                 OBIC14.2
   000032         003500*    REFERENCE - AMERICAN NATIONAL STANDARD PROGRAMMING LANGUAGE  OBIC14.2
   000033         003600*                COBOL, X3.23-1985                                OBIC14.2
   000034         003700*                                                                 OBIC14.2
   000035         003900 ENVIRONMENT DIVISION.                                            OBIC14.2
   000036         004000 CONFIGURATION SECTION.                                           OBIC14.2
   000037         004100 SOURCE-COMPUTER.                                                 OBIC14.2
   000038         004200     XXXXX082.                                                    OBIC14.2
   000039         004300 OBJECT-COMPUTER.                                                 OBIC14.2
   000040         004400     XXXXX083.                                                    OBIC14.2
   000041         004500 DATA DIVISION.                                                   OBIC14.2
   000042         004600 WORKING-STORAGE SECTION.                                         OBIC14.2
   000043         004700 01  SORT-LINK               PICTURE 9.                           OBIC14.2
   000044         004800 01  PRINT-LINE-VALUES.                                           OBIC14.2
   000045         004900     02  PASS-OR-FAIL        PICTURE X(5).                        OBIC14.2
   000046         005000     02  R-COUNT             PICTURE 99.                          OBIC14.2
   000047         005100     02  FEATURE-TESTED      PICTURE X(20).                       OBIC14.2
   000048         005200     02  COMPUTED-SORT-KEY   PICTURE X(20).                       OBIC14.2
   000049         005300     02  CORRECT-SORT-KEY    PICTURE X(20).                       OBIC14.2
   000050         005400     02  PARAGRAPH-NAME      PICTURE X(12).                       OBIC14.2
   000051         005500 01  PRINT-FLAG              PICTURE 9.                           OBIC14.2
   000052         005600 PROCEDURE DIVISION.                                              OBIC14.2
   000053         005700 SECT-IC218-0001 SECTION.                                         OBIC14.2
   000054         005800 CALL-IC219.                                                      OBIC14.2
   000055         005900     MOVE 0 TO SORT-LINK.                                         OBIC14.2 43
   000056         006000     CALL "OBIC2A" USING SORT-LINK.                               OBIC14.2 EXT 43
   000057         006100 CALL-FAIL.                                                       OBIC14.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC1A    Date 06/04/2022  Time 11:57:08   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200*                                                                 OBIC14.2
   000059         006300*    CONTROL SHOULD NOT RETURN TO THE MAIN PROGRAM FROM THE SUB-  OBIC14.2
   000060         006400*    PROGRAM SINCE THE SUBPROGRAM CONTAINS A STOP RUN STATEMENT.  OBIC14.2
   000061         006500*                                                                 OBIC14.2
   000062         006600     MOVE 2 TO PRINT-FLAG.                                        OBIC14.2 51
   000063         006700     MOVE "CALL-MAIN-IC" TO PARAGRAPH-NAME.                       OBIC14.2 50
   000064         006800     MOVE "CONTROL RETURNED" TO FEATURE-TESTED.                   OBIC14.2 47
   000065         006900     MOVE "FAIL " TO PASS-OR-FAIL.                                OBIC14.2 45
   000066         007000     MOVE 0 TO R-COUNT.                                           OBIC14.2 46
   000067         007100     MOVE SORT-LINK TO COMPUTED-SORT-KEY.                         OBIC14.2 43 48
   000068         007200     MOVE SPACE TO CORRECT-SORT-KEY.                              OBIC14.2 IMP 49
   000069         007300     CALL "OBIC3A" USING PRINT-LINE-VALUES  PRINT-FLAG.           OBIC14.2 EXT 44 51
   000070         007400     MOVE 3 TO PRINT-FLAG.                                        OBIC14.2 51
   000071         007500     CALL "OBIC3A" USING PRINT-LINE-VALUES  PRINT-FLAG.           OBIC14.2 EXT 44 51
   000072         007600*                                                                 OBIC14.2
   000073         007700*        NO STOP RUN STATEMENT APPEARS IN THIS PROGRAM.           OBIC14.2
   000074         007800*                                                                 OBIC14.2
   000075         007900 END-OF-PROGRAM.                                                  OBIC14.2
   000076         008000     EXIT PROGRAM.                                                OBIC14.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC1A    Date 06/04/2022  Time 11:57:08   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       48   COMPUTED-SORT-KEY. . . . . . .  M67
       49   CORRECT-SORT-KEY . . . . . . .  M68
       47   FEATURE-TESTED . . . . . . . .  M64
       50   PARAGRAPH-NAME . . . . . . . .  M63
       45   PASS-OR-FAIL . . . . . . . . .  M65
       51   PRINT-FLAG . . . . . . . . . .  M62 69 M70 71
       44   PRINT-LINE-VALUES. . . . . . .  69 71
       46   R-COUNT. . . . . . . . . . . .  M66
       43   SORT-LINK. . . . . . . . . . .  M55 56 67
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC1A    Date 06/04/2022  Time 11:57:08   Page     6
0Context usage is indicated by the letter preceding a procedure-name reference.
 These letters and their meanings are:
     A = ALTER (procedure-name)
     D = GO TO (procedure-name) DEPENDING ON
     E = End of range of (PERFORM) through (procedure-name)
     G = GO TO (procedure-name)
     P = PERFORM (procedure-name)
     T = (ALTER) TO PROCEED TO (procedure-name)
     U = USE FOR DEBUGGING (procedure-name)

  Defined   Cross-reference of procedures   References

       57   CALL-FAIL
       54   CALL-IC219
       75   END-OF-PROGRAM
       53   SECT-IC218-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       OBIC1A    Date 06/04/2022  Time 11:57:08   Page     7
0 Defined   Cross-reference of programs     References

        3   OBIC1A
 EXTERNAL   OBIC2A . . . . . . . . . . . .  56
 EXTERNAL   OBIC3A . . . . . . . . . . . .  69 71
-* Statistics for COBOL program OBIC1A:
 *    Source records = 76
 *    Data Division statements = 9
 *    Procedure Division statements = 13
 *    Generated COBOL statements = 0
 *    Program complexity factor = 13
0End of compilation 1,  program OBIC1A,  no statements flagged.
0Return code 0
