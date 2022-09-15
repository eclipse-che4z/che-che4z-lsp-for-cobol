1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:43   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:43   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC113A    Date 06/04/2022  Time 11:57:43   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1134.2
   000002         000200 PROGRAM-ID.                                                      IC1134.2
   000003         000300     IC113A.                                                      IC1134.2
   000004         000500*                                                              *  IC1134.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1134.2
   000006         000700*                                                              *  IC1134.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1134.2
   000008         000900*                                                              *  IC1134.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1134.2
   000010         001100*                                                              *  IC1134.2
   000011         001300*                                                              *  IC1134.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1134.2
   000013         001500*                                                              *  IC1134.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1134.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1134.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1134.2
   000017         001900*                                                              *  IC1134.2
   000018         002100*                                                                 IC1134.2
   000019         002200*         THE SUBPROGRAM IC113 IS CALLED BY THE MAIN PROGRAM IC112IC1134.2
   000020         002300*    WHICH HAS A FILE DESCRIPTION RECORD IN THE USING PHRASE OF   IC1134.2
   000021         002400*    THE CALL STATEMENT REFERENCING THIS SUBPROGRAM.  IC113 CHECKSIC1134.2
   000022         002500*    THE VALUES IN THE FILE RECORD DESCRIBED IN THE LINKAGE       IC1134.2
   000023         002600*    SECTION OF THE SUBPROGRAM.  IF ANY ERRORS ARE ENCOUNTERED    IC1134.2
   000024         002700*    THE ERROR-FLAG IS SET TO 1 AND THE RECORDS-IN-ERROR COUNTER  IC1134.2
   000025         002800*    IS INCREMENTED BY 1.                                         IC1134.2
   000026         002900*                                                                 IC1134.2
   000027         003100 ENVIRONMENT DIVISION.                                            IC1134.2
   000028         003200 CONFIGURATION SECTION.                                           IC1134.2
   000029         003300 SOURCE-COMPUTER.                                                 IC1134.2
   000030         003400     XXXXX082.                                                    IC1134.2
   000031         003500 OBJECT-COMPUTER.                                                 IC1134.2
   000032         003600     XXXXX083.                                                    IC1134.2
   000033         003700 DATA DIVISION.                                                   IC1134.2
   000034         003800 WORKING-STORAGE SECTION.                                         IC1134.2
   000035         003900 01  DUMMY-WS-ENTRY   PIC 99  VALUE 0.                            IC1134.2
   000036         004000 LINKAGE SECTION.                                                 IC1134.2
   000037         004100 01  COUNT-OF-RECORDS   PIC S9(9)   USAGE COMP.                   IC1134.2
   000038         004200 01  RECORDS-IN-ERROR   PIC S9(5)   USAGE COMP.                   IC1134.2
   000039         004300 01  ERROR-FLAG   PICTURE 9.                                      IC1134.2
   000040         004400 01  SQ-FS3-R1-G-120.                                             IC1134.2
   000041         004500     02  XFILE-NAME-GROUP.                                        IC1134.2
   000042         004600         03  FILLER   PIC X(5).                                   IC1134.2
   000043         004700         03  XFILE-NAME   PIC X(6).                               IC1134.2
   000044         004800     02  XRECORD-NAME-GROUP.                                      IC1134.2
   000045         004900         03  FILLER   PIC X(8).                                   IC1134.2
   000046         005000         03  XRECORD-NAME   PIC X(6).                             IC1134.2
   000047         005100     02  REELUNIT-NUMBER-GROUP.                                   IC1134.2
   000048         005200         03  FILLER   PIC X(1).                                   IC1134.2
   000049         005300         03  REELUNIT-NUMBER   PIC 9(1).                          IC1134.2
   000050         005400     02  FILLER   PIC X(7).                                       IC1134.2
   000051         005500     02  XRECORD-NUMBER   PIC 9(6).                               IC1134.2
   000052         005600     02  FILLER   PIC X(79).                                      IC1134.2
   000053         005700     02  XLABEL-TYPE   PIC X(1).                                  IC1134.2
   000054         005800 PROCEDURE DIVISION USING RECORDS-IN-ERROR  SQ-FS3-R1-G-120       IC1134.2 38 40
   000055         005900             ERROR-FLAG  COUNT-OF-RECORDS.                        IC1134.2 39 37
   000056         006000 SECT-IC113-0001 SECTION.                                         IC1134.2
   000057         006100 LINK-TEST-08.                                                    IC1134.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC113A    Date 06/04/2022  Time 11:57:43   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006200     ADD 1 TO COUNT-OF-RECORDS.                                   IC1134.2 37
   000059         006300     IF COUNT-OF-RECORDS NOT EQUAL TO XRECORD-NUMBER              IC1134.2 37 51
   000060      1  006400         GO TO LINK-FAIL-08.                                      IC1134.2 71
   000061         006500     IF REELUNIT-NUMBER-GROUP NOT EQUAL TO "/0"                   IC1134.2 47
   000062      1  006600         GO TO LINK-FAIL-08.                                      IC1134.2 71
   000063         006700     IF XFILE-NAME NOT EQUAL TO "SQ-FS3"                          IC1134.2 43
   000064      1  006800         GO TO LINK-FAIL-08.                                      IC1134.2 71
   000065         006900     IF XRECORD-NAME NOT EQUAL TO "R1-F-G"                        IC1134.2 46
   000066      1  007000         GO TO LINK-FAIL-08.                                      IC1134.2 71
   000067         007100     IF XLABEL-TYPE NOT EQUAL TO "S"                              IC1134.2 53
   000068      1  007200         GO TO LINK-FAIL-08.                                      IC1134.2 71
   000069         007300 LINK-EXIT-08.                                                    IC1134.2
   000070         007400     EXIT PROGRAM.                                                IC1134.2
   000071         007500 LINK-FAIL-08.                                                    IC1134.2
   000072         007600     ADD 1 TO RECORDS-IN-ERROR.                                   IC1134.2 38
   000073         007700     MOVE 1 TO ERROR-FLAG.                                        IC1134.2 39
   000074         007800     GO TO LINK-EXIT-08.                                          IC1134.2 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC113A    Date 06/04/2022  Time 11:57:43   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       37   COUNT-OF-RECORDS . . . . . . .  55 M58 59
       35   DUMMY-WS-ENTRY
       39   ERROR-FLAG . . . . . . . . . .  55 M73
       38   RECORDS-IN-ERROR . . . . . . .  54 M72
       49   REELUNIT-NUMBER
       47   REELUNIT-NUMBER-GROUP. . . . .  61
       40   SQ-FS3-R1-G-120. . . . . . . .  54
       43   XFILE-NAME . . . . . . . . . .  63
       41   XFILE-NAME-GROUP
       53   XLABEL-TYPE. . . . . . . . . .  67
       46   XRECORD-NAME . . . . . . . . .  65
       44   XRECORD-NAME-GROUP
       51   XRECORD-NUMBER . . . . . . . .  59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC113A    Date 06/04/2022  Time 11:57:43   Page     6
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

       69   LINK-EXIT-08 . . . . . . . . .  G74
       71   LINK-FAIL-08 . . . . . . . . .  G60 G62 G64 G66 G68
       57   LINK-TEST-08
       56   SECT-IC113-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC113A    Date 06/04/2022  Time 11:57:43   Page     7
0 Defined   Cross-reference of programs     References

        3   IC113A
-* Statistics for COBOL program IC113A:
 *    Source records = 74
 *    Data Division statements = 13
 *    Procedure Division statements = 15
 *    Generated COBOL statements = 0
 *    Program complexity factor = 15
0End of compilation 1,  program IC113A,  no statements flagged.
0Return code 0
