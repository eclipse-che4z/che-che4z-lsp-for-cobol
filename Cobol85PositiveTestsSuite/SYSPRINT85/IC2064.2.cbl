1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:46   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:46   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC206A    Date 06/04/2022  Time 11:57:46   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2064.2
   000002         000200 PROGRAM-ID.                                                      IC2064.2
   000003         000300     IC206A.                                                      IC2064.2
   000004         000500*                                                              *  IC2064.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2064.2
   000006         000700*                                                              *  IC2064.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2064.2
   000008         000900*                                                              *  IC2064.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2064.2
   000010         001100*                                                              *  IC2064.2
   000011         001300*                                                              *  IC2064.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2064.2
   000013         001500*                                                              *  IC2064.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2064.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2064.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2064.2
   000017         001900*                                                              *  IC2064.2
   000018         002100*        THE SUBPROGRAM IC206 IS CALLED BY THE SUBPROGRAM         IC2064.2
   000019         002200*    IC205.  THE SUBPROGRAM IS THEN CANCELED AND CALLED           IC2064.2
   000020         002300*    AGAIN.  THE PROGRAM IC205 CHECKS IF IC206 WAS IN ITS         IC2064.2
   000021         002400*    INITIAL STATE ON THE FIRST CALL AFTER THE PROGRAM WAS        IC2064.2
   000022         002500*    CANCELED.                                                    IC2064.2
   000023         002600*        THE LINKAGE PARAMETER DN1 CONTAINS THE NUMBER OF         IC2064.2
   000024         002700*    TIMES IC206 HAS BEEN CALLED SINCE INITIALIZATION WHEN        IC2064.2
   000025         002800*    CONTROL IS RETURNED TO THE CALLING PROGRAM.                  IC2064.2
   000026         003000 ENVIRONMENT DIVISION.                                            IC2064.2
   000027         003100 CONFIGURATION SECTION.                                           IC2064.2
   000028         003200 SOURCE-COMPUTER.                                                 IC2064.2
   000029         003300     XXXXX082.                                                    IC2064.2
   000030         003400 OBJECT-COMPUTER.                                                 IC2064.2
   000031         003500     XXXXX083.                                                    IC2064.2
   000032         003600 INPUT-OUTPUT SECTION.                                            IC2064.2
   000033         003700 FILE-CONTROL.                                                    IC2064.2
   000034         003800     SELECT PRINT-FILE ASSIGN TO                                  IC2064.2 38
   000035         003900     XXXXX055.                                                    IC2064.2
   000036         004000 DATA DIVISION.                                                   IC2064.2
   000037         004100 FILE SECTION.                                                    IC2064.2
   000038         004200 FD  PRINT-FILE.                                                  IC2064.2

 ==000038==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000039         004300 01  PRINT-REC PICTURE X(120).                                    IC2064.2
   000040         004400 01  DUMMY-RECORD PICTURE X(120).                                 IC2064.2
   000041         004500 WORKING-STORAGE SECTION.                                         IC2064.2
   000042         004600 77  WS1 PICTURE S9(8) USAGE COMPUTATIONAL                        IC2064.2
   000043         004700         VALUE ZERO.                                              IC2064.2 IMP
   000044         004800 LINKAGE SECTION.                                                 IC2064.2
   000045         004900 01  DN1 PICTURE S9(8)  USAGE COMPUTATIONAL.                      IC2064.2
   000046         005000 PROCEDURE DIVISION USING DN1.                                    IC2064.2 45
   000047         005100 SECT-IC206-0001 SECTION.                                         IC2064.2
   000048         005200 TEST-PARAGRAPH.                                                  IC2064.2
   000049         005300     ADD 1 TO WS1.                                                IC2064.2 42
   000050         005400     MOVE WS1 TO DN1.                                             IC2064.2 42 45
   000051         005500 EXIT-IC206.                                                      IC2064.2
   000052         005600     EXIT PROGRAM.                                                IC2064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC206A    Date 06/04/2022  Time 11:57:46   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       45   DN1. . . . . . . . . . . . . .  46 M50
       40   DUMMY-RECORD
       38   PRINT-FILE . . . . . . . . . .  34
       39   PRINT-REC
       42   WS1. . . . . . . . . . . . . .  M49 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC206A    Date 06/04/2022  Time 11:57:46   Page     5
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

       51   EXIT-IC206
       47   SECT-IC206-0001
       48   TEST-PARAGRAPH
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC206A    Date 06/04/2022  Time 11:57:46   Page     6
0 Defined   Cross-reference of programs     References

        3   IC206A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC206A    Date 06/04/2022  Time 11:57:46   Page     7
0LineID  Message code  Message text

     38  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC206A:
 *    Source records = 52
 *    Data Division statements = 4
 *    Procedure Division statements = 3
 *    Generated COBOL statements = 0
 *    Program complexity factor = 3
0End of compilation 1,  program IC206A,  highest severity 0.
0Return code 0
