1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:51   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:51   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX401M    Date 06/04/2022  Time 11:56:51   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IX4014.2
   000002         000200 PROGRAM-ID.                                                      IX4014.2
   000003         000300     IX401M.                                                      IX4014.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF HIGH                 IX4014.2
   000005         000500*SUBSET FEATURES THAT ARE USED IN INDEXED                         IX4014.2
   000006         000600*INPUT-OUTPUT.                                                    IX4014.2
   000007         000700 ENVIRONMENT DIVISION.                                            IX4014.2
   000008         000800 CONFIGURATION SECTION.                                           IX4014.2
   000009         000900 SOURCE-COMPUTER.                                                 IX4014.2
   000010         001000     XXXXX082.                                                    IX4014.2
   000011         001100 OBJECT-COMPUTER.                                                 IX4014.2
   000012         001200     XXXXX083.                                                    IX4014.2
   000013         001300 INPUT-OUTPUT SECTION.                                            IX4014.2
   000014         001400 FILE-CONTROL.                                                    IX4014.2
   000015         001500     SELECT OPTIONAL TFIL ASSIGN                                  IX4014.2 38
   000016         001600*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000017         001700                                                                  IX4014.2
   000018         001800     XXXXX025                                                     IX4014.2
   000019         001900         RESERVE 2 AREAS                                          IX4014.2
   000020         002000*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000021         002100                                                                  IX4014.2
   000022         002200         ORGANIZATION IS INDEXED                                  IX4014.2
   000023         002300         ACCESS MODE IS DYNAMIC                                   IX4014.2
   000024         002400*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000025         002500                                                                  IX4014.2
   000026         002600         RECORD KEY IS RKEY                                       IX4014.2 43
   000027         002700         ALTERNATE RECORD KEY IS BEANO.                           IX4014.2 44
   000028         002800*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000029         002900                                                                  IX4014.2
   000030         003000     SELECT TFIL2 ASSIGN                                          IX4014.2 46
   000031         003100     XXXXX026                                                     IX4014.2
   000032         003200         ORGANIZATION IS INDEXED                                  IX4014.2
   000033         003300         ACCESS MODE IS SEQUENTIAL                                IX4014.2
   000034         003400         RECORD KEY IS RKEY2.                                     IX4014.2 48
   000035         003500                                                                  IX4014.2
   000036         003600 DATA DIVISION.                                                   IX4014.2
   000037         003700 FILE SECTION.                                                    IX4014.2
   000038         003800 FD TFIL                                                          IX4014.2
   000039         003900     RECORD IS VARYING IN SIZE FROM 18 TO 36 CHARACTERS.          IX4014.2
   000040         004000*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000041         004100                                                                  IX4014.2
   000042         004200 01 FREC.                                                         IX4014.2
   000043         004300     03 RKEY PIC X(8).                                            IX4014.2
   000044         004400     03 BEANO PIC X(10).                                          IX4014.2
   000045         004500                                                                  IX4014.2
   000046         004600 FD TFIL2.                                                        IX4014.2
   000047         004700 01 FREC2.                                                        IX4014.2
   000048         004800     03 RKEY2 PIC X(8).                                           IX4014.2
   000049         004900                                                                  IX4014.2
   000050         005000 PROCEDURE DIVISION.                                              IX4014.2
   000051         005100                                                                  IX4014.2
   000052         005200 IX401M-CONTROL.                                                  IX4014.2
   000053         005300     OPEN INPUT TFIL.                                             IX4014.2 38
   000054         005400     PERFORM IX401M-CLOSE THRU IX401M-START.                      IX4014.2 59 79
   000055         005500     CLOSE TFIL.                                                  IX4014.2 38
   000056         005600     CLOSE TFIL2.                                                 IX4014.2 46
   000057         005700     STOP RUN.                                                    IX4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX401M    Date 06/04/2022  Time 11:56:51   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         005800                                                                  IX4014.2
   000059         005900 IX401M-CLOSE.                                                    IX4014.2
   000060         006000     CLOSE TFIL WITH LOCK.                                        IX4014.2 38
   000061         006100*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000062         006200                                                                  IX4014.2
   000063         006300 IX401M-OPENEXT.                                                  IX4014.2
   000064         006400     OPEN EXTEND TFIL2.                                           IX4014.2 46
   000065         006500*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000066         006600                                                                  IX4014.2
   000067         006700 IX401M-READNEXT.                                                 IX4014.2
   000068         006800     OPEN INPUT TFIL.                                             IX4014.2 38
   000069         006900     READ TFIL NEXT RECORD                                        IX4014.2 38
   000070      1  007000         AT END DISPLAY "AT END".                                 IX4014.2
   000071         007100*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000072         007200                                                                  IX4014.2
   000073         007300 IX401M-READKEY.                                                  IX4014.2
   000074         007400     READ TFIL RECORD                                             IX4014.2 38
   000075         007500         KEY IS RKEY                                              IX4014.2 43
   000076      1  007600     INVALID KEY DISPLAY "INVALID".                               IX4014.2
   000077         007700*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000078         007800                                                                  IX4014.2
   000079         007900 IX401M-START.                                                    IX4014.2
   000080         008000     START TFIL KEY IS EQUAL TO RKEY                              IX4014.2 38 43
   000081      1  008100         INVALID KEY DISPLAY "INVALID".                           IX4014.2
   000082         008200*Message expected for above statement: NON-CONFORMING STANDARD    IX4014.2
   000083         008300                                                                  IX4014.2
   000084         008400*TOTAL NUMBER OF FLAGS EXPECTED = 10.                             IX4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX401M    Date 06/04/2022  Time 11:56:51   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       44   BEANO. . . . . . . . . . . . .  27
       42   FREC
       47   FREC2
       43   RKEY . . . . . . . . . . . . .  26 75 80
       48   RKEY2. . . . . . . . . . . . .  34
       38   TFIL . . . . . . . . . . . . .  15 53 55 60 68 69 74 80
       46   TFIL2. . . . . . . . . . . . .  30 56 64
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX401M    Date 06/04/2022  Time 11:56:51   Page     6
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

       59   IX401M-CLOSE . . . . . . . . .  P54
       52   IX401M-CONTROL
       63   IX401M-OPENEXT
       73   IX401M-READKEY
       67   IX401M-READNEXT
       79   IX401M-START . . . . . . . . .  E54
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IX401M    Date 06/04/2022  Time 11:56:51   Page     7
0 Defined   Cross-reference of programs     References

        3   IX401M
-* Statistics for COBOL program IX401M:
 *    Source records = 84
 *    Data Division statements = 5
 *    Procedure Division statements = 14
 *    Generated COBOL statements = 0
 *    Program complexity factor = 14
0End of compilation 1,  program IX401M,  no statements flagged.
0Return code 0
