1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:06   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:06   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST301M    Date 06/04/2022  Time 11:57:06   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         ST3014.2
   000002         000200 PROGRAM-ID.                                                      ST3014.2
   000003         000300      ST301M.                                                     ST3014.2
   000004         000400*The following program tests the flagging of intermediate         ST3014.2
   000005         000500*subset  features that are used in sort-merge functions           ST3014.2
   000006         000600 ENVIRONMENT DIVISION.                                            ST3014.2
   000007         000700 CONFIGURATION SECTION.                                           ST3014.2
   000008         000800 SOURCE-COMPUTER.                                                 ST3014.2
   000009         000900     XXXXX082.                                                    ST3014.2
   000010         001000 OBJECT-COMPUTER.                                                 ST3014.2
   000011         001100     XXXXX083.                                                    ST3014.2
   000012         001200 INPUT-OUTPUT SECTION.                                            ST3014.2
   000013         001300 FILE-CONTROL.                                                    ST3014.2
   000014         001400     SELECT TFIL ASSIGN                                           ST3014.2 34
   000015         001500     XXXXX027.                                                    ST3014.2
   000016         001600     SELECT TFIL-2 ASSIGN                                         ST3014.2 39
   000017         001700     XXXXX001                                                     ST3014.2
   000018         001800     ACCESS MODE IS SEQUENTIAL.                                   ST3014.2
   000019         001900     SELECT TFIL-3 ASSIGN                                         ST3014.2 43
   000020         002000     XXXXX002                                                     ST3014.2
   000021         002100     ACCESS MODE IS SEQUENTIAL.                                   ST3014.2
   000022         002200     SELECT TFIL-4 ASSIGN                                         ST3014.2 47
   000023         002300     XXXXX003                                                     ST3014.2
   000024         002400     ACCESS MODE IS SEQUENTIAL.                                   ST3014.2
   000025         002500     SELECT TFIL-5 ASSIGN                                         ST3014.2 51
   000026         002600     XXXXX004                                                     ST3014.2
   000027         002700     ACCESS MODE IS SEQUENTIAL.                                   ST3014.2
   000028         002800                                                                  ST3014.2
   000029         002900 I-O-CONTROL.                                                     ST3014.2
   000030         003000     SAME SORT-MERGE AREA FOR TFIL-5, TFIL.                       ST3014.2 51 34
   000031         003100*Message expected for above statement: NON-CONFORMING STANDARD    ST3014.2
   000032         003200 DATA DIVISION.                                                   ST3014.2
   000033         003300 FILE SECTION.                                                    ST3014.2
   000034         003400 SD  TFIL.                                                        ST3014.2
   000035         003500*Message expected for above statement: NON-CONFORMING STANDARD    ST3014.2
   000036         003600 01  FREC.                                                        ST3014.2
   000037         003700     03 DATA-1  PIC X(80).                                        ST3014.2
   000038         003800                                                                  ST3014.2
   000039         003900 FD TFIL-2.                                                       ST3014.2

 ==000039==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TFIL-2".

   000040         004000 01 FREC-2.                                                       ST3014.2
   000041         004100     03 DATA-2  PIC X(80).                                        ST3014.2
   000042         004200                                                                  ST3014.2
   000043         004300 FD TFIL-3.                                                       ST3014.2

 ==000043==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TFIL-3".

   000044         004400 01 FREC-3.                                                       ST3014.2
   000045         004500     03 DATA-3 PIC X(80).                                         ST3014.2
   000046         004600                                                                  ST3014.2
   000047         004700 FD TFIL-4.                                                       ST3014.2

 ==000047==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TFIL-4".

   000048         004800 01 FREC-4.                                                       ST3014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST301M    Date 06/04/2022  Time 11:57:06   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000049         004900     03 DATA-4 PIC X(80).                                         ST3014.2
   000050         005000                                                                  ST3014.2
   000051         005100 FD TFIL-5.                                                       ST3014.2

 ==000051==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TFIL-5".

   000052         005200 01 FREC-5.                                                       ST3014.2
   000053         005300    03  DATA-5 PIC X(80).                                         ST3014.2
   000054         005400                                                                  ST3014.2
   000055         005500 PROCEDURE DIVISION.                                              ST3014.2
   000056         005600                                                                  ST3014.2
   000057         005700 ST301M-CONTROL.                                                  ST3014.2
   000058         005800     PERFORM ST301M-MERGE THRU ST301M-SORT 1 TIMES.               ST3014.2 61 77
   000059         005900     STOP RUN.                                                    ST3014.2
   000060         006000                                                                  ST3014.2
   000061         006100 ST301M-MERGE.                                                    ST3014.2
   000062         006200     MERGE TFIL ON ASCENDING KEY DATA-1                           ST3014.2 34 37
   000063         006300     USING TFIL-2 TFIL-3                                          ST3014.2 39 43
   000064         006400     OUTPUT PROCEDURE IS ST301M-RETURN.                           ST3014.2 72
   000065         006500                                                                  ST3014.2
   000066         006600*Message expected for above statement: NON-CONFORMING STANDARD    ST3014.2
   000067         006700                                                                  ST3014.2
   000068         006800 ST301M-RELEASE.                                                  ST3014.2
   000069         006900     RELEASE FREC.                                                ST3014.2 36
   000070         007000*Message expected for above statement: NON-CONFORMING STANDARD    ST3014.2
   000071         007100                                                                  ST3014.2
   000072         007200 ST301M-RETURN.                                                   ST3014.2
   000073         007300     RETURN TFIL RECORD                                           ST3014.2 34
   000074      1  007400         AT END DISPLAY "AT END".                                 ST3014.2
   000075         007500*Message expected for above statement: NON-CONFORMING STANDARD    ST3014.2
   000076         007600                                                                  ST3014.2
   000077         007700 ST301M-SORT.                                                     ST3014.2
   000078         007800     SORT TFIL ON ASCENDING KEY DATA-1                            ST3014.2 34 37

 ==000078==> IGYPG3134-I File "TFIL-4" in the "GIVING" phrase of the "SORT" statement would have
                         been eligible for the "FASTSRT" compiler option.

   000079         007900     INPUT PROCEDURE IS ST301M-RELEASE                            ST3014.2 68
   000080         008000     GIVING TFIL-4.                                               ST3014.2 47
   000081         008100*Message expected for above statement: NON-CONFORMING STANDARD    ST3014.2
   000082         008200                                                                  ST3014.2
   000083         008300                                                                  ST3014.2
   000084         008400*TOTAL NUMBER OF FLAGS EXPECTED = 6.                              ST3014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST301M    Date 06/04/2022  Time 11:57:06   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       37   DATA-1 . . . . . . . . . . . .  62 78
       41   DATA-2
       45   DATA-3
       49   DATA-4
       53   DATA-5
       36   FREC . . . . . . . . . . . . .  69
       40   FREC-2
       44   FREC-3
       48   FREC-4
       52   FREC-5
       34   TFIL . . . . . . . . . . . . .  14 30 62 73 78
       39   TFIL-2 . . . . . . . . . . . .  16 63
       43   TFIL-3 . . . . . . . . . . . .  19 63
       47   TFIL-4 . . . . . . . . . . . .  22 M80
       51   TFIL-5 . . . . . . . . . . . .  25 30
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST301M    Date 06/04/2022  Time 11:57:06   Page     6
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

       57   ST301M-CONTROL
       61   ST301M-MERGE . . . . . . . . .  P58
       68   ST301M-RELEASE . . . . . . . .  P79
       72   ST301M-RETURN. . . . . . . . .  P64
       77   ST301M-SORT. . . . . . . . . .  E58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST301M    Date 06/04/2022  Time 11:57:06   Page     7
0 Defined   Cross-reference of programs     References

        3   ST301M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       ST301M    Date 06/04/2022  Time 11:57:06   Page     8
0LineID  Message code  Message text

     39  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TFIL-2".

     43  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TFIL-3".

     47  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TFIL-4".

     51  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TFIL-5".

     78  IGYPG3134-I   File "TFIL-4" in the "GIVING" phrase of the "SORT" statement would have been eligible for the "FASTSRT"
                       compiler option.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       5           5
-* Statistics for COBOL program ST301M:
 *    Source records = 84
 *    Data Division statements = 10
 *    Procedure Division statements = 7
 *    Generated COBOL statements = 0
 *    Program complexity factor = 7
0End of compilation 1,  program ST301M,  highest severity 0.
0Return code 0
