1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:05   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:05   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC109A    Date 06/04/2022  Time 11:57:05   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1094.2
   000002         000200 PROGRAM-ID.                                                      IC1094.2
   000003         000300     IC109A.                                                      IC1094.2
   000004         000500*                                                              *  IC1094.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1094.2
   000006         000700*                                                              *  IC1094.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1094.2
   000008         000900*                                                              *  IC1094.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1094.2
   000010         001100*                                                              *  IC1094.2
   000011         001300*                                                              *  IC1094.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1094.2
   000013         001500*                                                              *  IC1094.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1094.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1094.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1094.2
   000017         001900*                                                              *  IC1094.2
   000018         002100*        THE SUBPROGRAM IC109 IS THE FIRST SUBPROGRAM IN A        IC1094.2
   000019         002200*    SEQUENCE OF CALLS WHICH START IN THE MAIN PROGRAM IC108.     IC1094.2
   000020         002300*    IC109 CALLS IC110 WITH ONE OPERAND IN THE WORKING-STORAGE    IC1094.2
   000021         002400*    SECTION AND ONE OPERAND IN THE LINKAGE SECTION.              IC1094.2
   000022         002500 ENVIRONMENT DIVISION.                                            IC1094.2
   000023         002600 CONFIGURATION SECTION.                                           IC1094.2
   000024         002700 SOURCE-COMPUTER.                                                 IC1094.2
   000025         002800     XXXXX082.                                                    IC1094.2
   000026         002900 OBJECT-COMPUTER.                                                 IC1094.2
   000027         003000     XXXXX083.                                                    IC1094.2
   000028         003100 INPUT-OUTPUT SECTION.                                            IC1094.2
   000029         003200 FILE-CONTROL.                                                    IC1094.2
   000030         003300     SELECT PRINT-FILE ASSIGN TO                                  IC1094.2 34
   000031         003400     XXXXX055.                                                    IC1094.2
   000032         003500 DATA DIVISION.                                                   IC1094.2
   000033         003600 FILE SECTION.                                                    IC1094.2
   000034         003700 FD  PRINT-FILE.                                                  IC1094.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003800 01  PRINT-REC PICTURE X(120).                                    IC1094.2
   000036         003900 01  DUMMY-RECORD PICTURE X(120).                                 IC1094.2
   000037         004000 WORKING-STORAGE SECTION.                                         IC1094.2
   000038         004100 77  WS1 PICTURE X.                                               IC1094.2
   000039         004200 LINKAGE SECTION.                                                 IC1094.2
   000040         004300 01  GRP-01.                                                      IC1094.2
   000041         004400     02  SUB-CALLED.                                              IC1094.2
   000042         004500         03  DN1  PICTURE X(6).                                   IC1094.2
   000043         004600         03  DN2  PICTURE X(6).                                   IC1094.2
   000044         004700         03  DN3  PICTURE X(6).                                   IC1094.2
   000045         004800     02  TIMES-CALLED.                                            IC1094.2
   000046         004900         03  DN4  PICTURE S999.                                   IC1094.2
   000047         005000         03  DN5  PICTURE S999.                                   IC1094.2
   000048         005100         03  DN6  PICTURE S999.                                   IC1094.2
   000049         005200     02  SPECIAL-FLAGS.                                           IC1094.2
   000050         005300         03  DN7 PICTURE X.                                       IC1094.2
   000051         005400         03  DN8 PICTURE X.                                       IC1094.2
   000052         005500         03  DN9 PICTURE X.                                       IC1094.2
   000053         005600 PROCEDURE DIVISION USING GRP-01.                                 IC1094.2 40
   000054         005700 SECT-IC109-0001 SECTION.                                         IC1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC109A    Date 06/04/2022  Time 11:57:05   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 PARA-IC109.                                                      IC1094.2
   000056         005900     MOVE "IC109A" TO DN1.                                        IC1094.2 42
   000057         006000     MOVE SPACE TO WS1.                                           IC1094.2 IMP 38
   000058         006100     CALL "IC110A" USING WS1 GRP-01.                              IC1094.2 EXT 38 40
   000059         006200     ADD 1 TO DN4.                                                IC1094.2 46
   000060         006300     MOVE WS1 TO DN9.                                             IC1094.2 38 52
   000061         006400 EXIT-IC109.                                                      IC1094.2
   000062         006500     EXIT PROGRAM.                                                IC1094.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC109A    Date 06/04/2022  Time 11:57:05   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       42   DN1. . . . . . . . . . . . . .  M56
       43   DN2
       44   DN3
       46   DN4. . . . . . . . . . . . . .  M59
       47   DN5
       48   DN6
       50   DN7
       51   DN8
       52   DN9. . . . . . . . . . . . . .  M60
       36   DUMMY-RECORD
       40   GRP-01 . . . . . . . . . . . .  53 58
       34   PRINT-FILE . . . . . . . . . .  30
       35   PRINT-REC
       49   SPECIAL-FLAGS
       41   SUB-CALLED
       45   TIMES-CALLED
       38   WS1. . . . . . . . . . . . . .  M57 58 60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC109A    Date 06/04/2022  Time 11:57:05   Page     6
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

       61   EXIT-IC109
       55   PARA-IC109
       54   SECT-IC109-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC109A    Date 06/04/2022  Time 11:57:05   Page     7
0 Defined   Cross-reference of programs     References

        3   IC109A
 EXTERNAL   IC110A . . . . . . . . . . . .  58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC109A    Date 06/04/2022  Time 11:57:05   Page     8
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC109A:
 *    Source records = 62
 *    Data Division statements = 16
 *    Procedure Division statements = 6
 *    Generated COBOL statements = 0
 *    Program complexity factor = 6
0End of compilation 1,  program IC109A,  highest severity 0.
0Return code 0
