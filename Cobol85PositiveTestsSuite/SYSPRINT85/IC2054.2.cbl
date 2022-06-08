1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:41   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:41   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC205A    Date 06/04/2022  Time 11:58:41   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2054.2
   000002         000200 PROGRAM-ID.                                                      IC2054.2
   000003         000300     IC205A.                                                      IC2054.2
   000004         000500*                                                              *  IC2054.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2054.2
   000006         000700*                                                              *  IC2054.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2054.2
   000008         000900*                                                              *  IC2054.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2054.2
   000010         001100*                                                              *  IC2054.2
   000011         001300*                                                              *  IC2054.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2054.2
   000013         001500*                                                              *  IC2054.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2054.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2054.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2054.2
   000017         001900*                                                              *  IC2054.2
   000018         002100*        THE SUBPROGRAM IC205 TESTS THE USE OF THE CANCEL      *  IC2054.2
   000019         002200*    STATEMENT WITHIN A SUBPROGRAM.  THIS SUBPROGRAM IS        *  IC2054.2
   000020         002300*    CALLED BY IC203 AND CALLS THE SUBPROGRAMS IC204 AND IC206.*  IC2054.2
   000021         002500 ENVIRONMENT DIVISION.                                            IC2054.2
   000022         002600 CONFIGURATION SECTION.                                           IC2054.2
   000023         002700 SOURCE-COMPUTER.                                                 IC2054.2
   000024         002800     XXXXX082.                                                    IC2054.2
   000025         002900 OBJECT-COMPUTER.                                                 IC2054.2
   000026         003000     XXXXX083.                                                    IC2054.2
   000027         003100 INPUT-OUTPUT SECTION.                                            IC2054.2
   000028         003200 FILE-CONTROL.                                                    IC2054.2
   000029         003300     SELECT PRINT-FILE ASSIGN TO                                  IC2054.2 33
   000030         003400     XXXXX055.                                                    IC2054.2
   000031         003500 DATA DIVISION.                                                   IC2054.2
   000032         003600 FILE SECTION.                                                    IC2054.2
   000033         003700 FD  PRINT-FILE.                                                  IC2054.2

 ==000033==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000034         003800 01  PRINT-REC PICTURE X(120).                                    IC2054.2
   000035         003900 01  DUMMY-RECORD PICTURE X(120).                                 IC2054.2
   000036         004000 WORKING-STORAGE SECTION.                                         IC2054.2
   000037         004100 77  ID1 PICTURE X(6) VALUE "IC204A".                             IC2054.2
   000038         004200 77  DN2 PICTURE S9(8) USAGE COMP VALUE ZERO.                     IC2054.2 IMP
   000039         004300 LINKAGE SECTION.                                                 IC2054.2
   000040         004400 01  TABLE-1.                                                     IC2054.2
   000041         004500     02  T-DN1 PIC XXX.                                           IC2054.2
   000042         004600     02  T-DN2 PIC 99.                                            IC2054.2
   000043         004700     02  T-DN3 PIC X(5).                                          IC2054.2
   000044         004800 77  DN1 PICTURE S999.                                            IC2054.2
   000045         004900 01  TABLE-2.                                                     IC2054.2
   000046         005000     02  TV-1 PIC X.                                              IC2054.2
   000047         005100     02  TV-2 PIC X.                                              IC2054.2
   000048         005200 PROCEDURE DIVISION USING TABLE-1, TABLE-2, DN1.                  IC2054.2 40 45 44
   000049         005300 CNCL-TEST-05.                                                    IC2054.2
   000050         005400     CALL "IC206A" USING DN2.                                     IC2054.2 EXT 38
   000051         005500     CALL "IC206A" USING DN2.                                     IC2054.2 EXT 38
   000052         005600     CALL "IC206A" USING DN2.                                     IC2054.2 EXT 38
   000053         005700     MOVE "X" TO TV-1.                                            IC2054.2 46
   000054         005800     IF DN2 EQUAL TO 3                                            IC2054.2 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC205A    Date 06/04/2022  Time 11:58:41   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055      1  005900         MOVE "A" TO TV-1.                                        IC2054.2 46
   000056         006000     CANCEL "IC206A".                                             IC2054.2 EXT
   000057         006100     MOVE ZERO TO DN2.                                            IC2054.2 IMP 38
   000058         006200     CALL "IC206A" USING DN2.                                     IC2054.2 EXT 38
   000059         006300     IF DN2 NOT EQUAL TO 1                                        IC2054.2 38
   000060      1  006400         MOVE "Y" TO TV-2,                                        IC2054.2 47
   000061      1  006500         GO TO CNCL-TEST-06.                                      IC2054.2 63
   000062         006600     MOVE "B" TO TV-2.                                            IC2054.2 47
   000063         006700 CNCL-TEST-06.                                                    IC2054.2
   000064         006800     CANCEL ID1.                                                  IC2054.2 37
   000065         006900 EXIT-IC205.                                                      IC2054.2
   000066         007000     EXIT PROGRAM.                                                IC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC205A    Date 06/04/2022  Time 11:58:41   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       44   DN1. . . . . . . . . . . . . .  48
       38   DN2. . . . . . . . . . . . . .  50 51 52 54 M57 58 59
       35   DUMMY-RECORD
       37   ID1. . . . . . . . . . . . . .  64
       33   PRINT-FILE . . . . . . . . . .  29
       34   PRINT-REC
       41   T-DN1
       42   T-DN2
       43   T-DN3
       40   TABLE-1. . . . . . . . . . . .  48
       45   TABLE-2. . . . . . . . . . . .  48
       46   TV-1 . . . . . . . . . . . . .  M53 M55
       47   TV-2 . . . . . . . . . . . . .  M60 M62
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC205A    Date 06/04/2022  Time 11:58:41   Page     6
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

       49   CNCL-TEST-05
       63   CNCL-TEST-06 . . . . . . . . .  G61
       65   EXIT-IC205
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC205A    Date 06/04/2022  Time 11:58:41   Page     7
0 Defined   Cross-reference of programs     References

        3   IC205A
 EXTERNAL   IC206A . . . . . . . . . . . .  50 51 52 56 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC205A    Date 06/04/2022  Time 11:58:41   Page     8
0LineID  Message code  Message text

     33  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC205A:
 *    Source records = 66
 *    Data Division statements = 12
 *    Procedure Division statements = 15
 *    Generated COBOL statements = 0
 *    Program complexity factor = 15
0End of compilation 1,  program IC205A,  highest severity 0.
0Return code 0
