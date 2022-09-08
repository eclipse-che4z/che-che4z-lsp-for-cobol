1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:31   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:31   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL401M    Date 06/04/2022  Time 11:56:31   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         RL4014.2
   000002         000200 PROGRAM-ID.                                                      RL4014.2
   000003         000300      RL401M.                                                     RL4014.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF                      RL4014.2
   000005         000500*HIGH SUBSET FEATURES THAT ARE USED IN RELATIVE                   RL4014.2
   000006         000600*INPUT-OUTPUT.                                                    RL4014.2
   000007         000700 ENVIRONMENT DIVISION.                                            RL4014.2
   000008         000800 CONFIGURATION SECTION.                                           RL4014.2
   000009         000900 SOURCE-COMPUTER.                                                 RL4014.2
   000010         001000     XXXXX082.                                                    RL4014.2
   000011         001100 OBJECT-COMPUTER.                                                 RL4014.2
   000012         001200     XXXXX083.                                                    RL4014.2
   000013         001300 INPUT-OUTPUT SECTION.                                            RL4014.2
   000014         001400 FILE-CONTROL.                                                    RL4014.2
   000015         001500     SELECT OPTIONAL TFIL ASSIGN                                  RL4014.2 35
   000016         001600*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000017         001700     XXXXX021                                                     RL4014.2
   000018         001800         RESERVE 2 AREAS                                          RL4014.2
   000019         001900*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000020         002000         ORGANIZATION IS RELATIVE                                 RL4014.2
   000021         002100         ACCESS MODE IS DYNAMIC                                   RL4014.2
   000022         002200*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000023         002300         RELATIVE KEY IS RKEY.                                    RL4014.2 48
   000024         002400                                                                  RL4014.2
   000025         002500     SELECT TFIL2 ASSIGN                                          RL4014.2 43
   000026         002600     XXXXX022                                                     RL4014.2
   000027         002700         ORGANIZATION IS RELATIVE.                                RL4014.2
   000028         002800                                                                  RL4014.2
   000029         002900 I-O-CONTROL.                                                     RL4014.2
   000030         003000     SAME RECORD AREA FOR TFIL2, TFIL.                            RL4014.2 43 35
   000031         003100*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000032         003200                                                                  RL4014.2
   000033         003300 DATA DIVISION.                                                   RL4014.2
   000034         003400 FILE SECTION.                                                    RL4014.2
   000035         003500 FD TFIL                                                          RL4014.2
   000036         003600     RECORD IS VARYING IN SIZE FROM 1 TO 8 CHARACTERS.            RL4014.2
   000037         003700*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000038         003800                                                                  RL4014.2
   000039         003900 01 FREC.                                                         RL4014.2
   000040         004000     03 GUBBINS PIC 9(8).                                         RL4014.2
   000041         004100                                                                  RL4014.2
   000042         004200                                                                  RL4014.2
   000043         004300 FD TFIL2.                                                        RL4014.2
   000044         004400 01 FREC2.                                                        RL4014.2
   000045         004500     03 RKEY2 PIC 9(8).                                           RL4014.2
   000046         004600                                                                  RL4014.2
   000047         004700 WORKING-STORAGE SECTION.                                         RL4014.2
   000048         004800 01 RKEY PIC 9(8) VALUE ZERO.                                     RL4014.2 IMP
   000049         004900                                                                  RL4014.2
   000050         005000 PROCEDURE DIVISION.                                              RL4014.2
   000051         005100                                                                  RL4014.2
   000052         005200 RL401M-CONTROL.                                                  RL4014.2
   000053         005300     OPEN INPUT TFIL.                                             RL4014.2 35
   000054         005400     PERFORM RL401M-CLOSE THRU RL401M-START.                      RL4014.2 59 73
   000055         005500     CLOSE TFIL.                                                  RL4014.2 35
   000056         005600     CLOSE TFIL2.                                                 RL4014.2 43
   000057         005700     STOP RUN.                                                    RL4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL401M    Date 06/04/2022  Time 11:56:31   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005800                                                                  RL4014.2
   000059         005900 RL401M-CLOSE.                                                    RL4014.2
   000060         006000     CLOSE TFIL WITH LOCK.                                        RL4014.2 35
   000061         006100*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000062         006200     OPEN INPUT TFIL.                                             RL4014.2 35
   000063         006300                                                                  RL4014.2
   000064         006400 RL401M-OPENEXT.                                                  RL4014.2
   000065         006500     OPEN EXTEND TFIL2.                                           RL4014.2 43
   000066         006600*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000067         006700                                                                  RL4014.2
   000068         006800 RL401M-READNEXT.                                                 RL4014.2
   000069         006900     READ TFIL NEXT RECORD                                        RL4014.2 35
   000070      1  007000         AT END DISPLAY "AT END".                                 RL4014.2
   000071         007100*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000072         007200                                                                  RL4014.2
   000073         007300 RL401M-START.                                                    RL4014.2
   000074         007400     START TFIL KEY IS EQUAL TO RKEY                              RL4014.2 35 48
   000075      1  007500         INVALID KEY STOP RUN.                                    RL4014.2
   000076         007600*Message expected for above statement: NON-CONFORMING STANDARD    RL4014.2
   000077         007700                                                                  RL4014.2
   000078         007800*TOTAL NUMBER OF FLAGS EXPECTED = 9.                              RL4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL401M    Date 06/04/2022  Time 11:56:31   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       39   FREC
       44   FREC2
       40   GUBBINS
       48   RKEY . . . . . . . . . . . . .  23 74
       45   RKEY2
       35   TFIL . . . . . . . . . . . . .  15 30 53 55 60 62 69 74
       43   TFIL2. . . . . . . . . . . . .  25 30 56 65
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL401M    Date 06/04/2022  Time 11:56:31   Page     6
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

       59   RL401M-CLOSE . . . . . . . . .  P54
       52   RL401M-CONTROL
       64   RL401M-OPENEXT
       68   RL401M-READNEXT
       73   RL401M-START . . . . . . . . .  E54
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       RL401M    Date 06/04/2022  Time 11:56:31   Page     7
0 Defined   Cross-reference of programs     References

        3   RL401M
-* Statistics for COBOL program RL401M:
 *    Source records = 78
 *    Data Division statements = 5
 *    Procedure Division statements = 12
 *    Generated COBOL statements = 0
 *    Program complexity factor = 12
0End of compilation 1,  program RL401M,  no statements flagged.
0Return code 0
