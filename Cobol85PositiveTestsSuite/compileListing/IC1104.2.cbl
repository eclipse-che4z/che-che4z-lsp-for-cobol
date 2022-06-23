1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:41   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:41   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC110A    Date 06/04/2022  Time 11:56:41   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1104.2
   000002         000200 PROGRAM-ID.                                                      IC1104.2
   000003         000300     IC110A.                                                      IC1104.2
   000004         000500*                                                              *  IC1104.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1104.2
   000006         000700*                                                              *  IC1104.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1104.2
   000008         000900*                                                              *  IC1104.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1104.2
   000010         001100*                                                              *  IC1104.2
   000011         001300*                                                              *  IC1104.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1104.2
   000013         001500*                                                              *  IC1104.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1104.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1104.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1104.2
   000017         001900*                                                              *  IC1104.2
   000018         002100*        THE SUBPROGRAM IC110 IS THE SECOND SUBPROGRAM IN A       IC1104.2
   000019         002200*    SEQUENCE OF CALLS WHICH START IN THE MAIN PROGRAM IC108.     IC1104.2
   000020         002300*    THIS SUBPROGRAM CALLS IC111 WITH OPERANDS IN THE LINKAGE     IC1104.2
   000021         002400*    SECTION AND IN THE WORKING-STORAGE SECTION.  THE SUBPROGRAM  IC1104.2
   000022         002500*    IC110 IS CALLED BY IC109.                                    IC1104.2
   000023         002600 ENVIRONMENT DIVISION.                                            IC1104.2
   000024         002700 CONFIGURATION SECTION.                                           IC1104.2
   000025         002800 SOURCE-COMPUTER.                                                 IC1104.2
   000026         002900     XXXXX082.                                                    IC1104.2
   000027         003000 OBJECT-COMPUTER.                                                 IC1104.2
   000028         003100     XXXXX083.                                                    IC1104.2
   000029         003200 INPUT-OUTPUT SECTION.                                            IC1104.2
   000030         003300 FILE-CONTROL.                                                    IC1104.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  IC1104.2 35
   000032         003500     XXXXX055.                                                    IC1104.2
   000033         003600 DATA DIVISION.                                                   IC1104.2
   000034         003700 FILE SECTION.                                                    IC1104.2
   000035         003800 FD  PRINT-FILE.                                                  IC1104.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    IC1104.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 IC1104.2
   000038         004100 WORKING-STORAGE SECTION.                                         IC1104.2
   000039         004200 77  WS2 PICTURE X.                                               IC1104.2
   000040         004300 LINKAGE SECTION.                                                 IC1104.2
   000041         004400 01  GRP-01.                                                      IC1104.2
   000042         004500     02  SUB-CALLED.                                              IC1104.2
   000043         004600         03  DN1 PICTURE X(6).                                    IC1104.2
   000044         004700         03  DN2 PICTURE X(6).                                    IC1104.2
   000045         004800         03  DN3 PICTURE X(6).                                    IC1104.2
   000046         004900     02  TIMES-CALLED.                                            IC1104.2
   000047         005000         03  DN4 PICTURE S999.                                    IC1104.2
   000048         005100         03  DN5 PICTURE S999.                                    IC1104.2
   000049         005200         03  DN6 PICTURE S999.                                    IC1104.2
   000050         005300     02  SPECIAL-FLAGS.                                           IC1104.2
   000051         005400         03  DN7 PICTURE X.                                       IC1104.2
   000052         005500         03  DN8 PICTURE X.                                       IC1104.2
   000053         005600         03  DN9 PICTURE X.                                       IC1104.2
   000054         005700 01  LS1 PICTURE X.                                               IC1104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC110A    Date 06/04/2022  Time 11:56:41   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 PROCEDURE DIVISION USING LS1 GRP-01.                             IC1104.2 54 41
   000056         005900 SECT-IC110-0001 SECTION.                                         IC1104.2
   000057         006000 PARA-IC110.                                                      IC1104.2
   000058         006100     MOVE "IC110A" TO DN2.                                        IC1104.2 44
   000059         006200     MOVE SPACE TO WS2.                                           IC1104.2 IMP 39
   000060         006300     CALL "IC111A" USING LS1 GRP-01 WS2.                          IC1104.2 EXT 54 41 39
   000061         006400     MOVE WS2 TO DN7.                                             IC1104.2 39 51
   000062         006500     MOVE LS1 TO DN8.                                             IC1104.2 54 52
   000063         006600     ADD 1 TO DN5.                                                IC1104.2 48
   000064         006700     MOVE "B" TO LS1.                                             IC1104.2 54
   000065         006800 EXIT-IC110.                                                      IC1104.2
   000066         006900     EXIT PROGRAM.                                                IC1104.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC110A    Date 06/04/2022  Time 11:56:41   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       43   DN1
       44   DN2. . . . . . . . . . . . . .  M58
       45   DN3
       47   DN4
       48   DN5. . . . . . . . . . . . . .  M63
       49   DN6
       51   DN7. . . . . . . . . . . . . .  M61
       52   DN8. . . . . . . . . . . . . .  M62
       53   DN9
       37   DUMMY-RECORD
       41   GRP-01 . . . . . . . . . . . .  55 60
       54   LS1. . . . . . . . . . . . . .  55 60 62 M64
       35   PRINT-FILE . . . . . . . . . .  31
       36   PRINT-REC
       50   SPECIAL-FLAGS
       42   SUB-CALLED
       46   TIMES-CALLED
       39   WS2. . . . . . . . . . . . . .  M59 60 61
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC110A    Date 06/04/2022  Time 11:56:41   Page     6
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

       65   EXIT-IC110
       57   PARA-IC110
       56   SECT-IC110-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC110A    Date 06/04/2022  Time 11:56:41   Page     7
0 Defined   Cross-reference of programs     References

        3   IC110A
 EXTERNAL   IC111A . . . . . . . . . . . .  60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC110A    Date 06/04/2022  Time 11:56:41   Page     8
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC110A:
 *    Source records = 66
 *    Data Division statements = 17
 *    Procedure Division statements = 8
 *    Generated COBOL statements = 0
 *    Program complexity factor = 8
0End of compilation 1,  program IC110A,  highest severity 0.
0Return code 0
