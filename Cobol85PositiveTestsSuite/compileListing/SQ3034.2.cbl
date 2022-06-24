1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:46   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:46   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SQ303M    Date 06/04/2022  Time 11:56:46   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         SQ3034.2
   000002         000200 PROGRAM-ID.                                                      SQ3034.2
   000003         000300     SQ303M.                                                      SQ3034.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF                      SQ3034.2
   000005         000500*OBSOLETE FEATURES THAT ARE USED IN HIGH SUBSET SEQUENTIAL        SQ3034.2
   000006         000600*INPUT-OUTPUT.                                                    SQ3034.2
   000007         000700 ENVIRONMENT DIVISION.                                            SQ3034.2
   000008         000800 CONFIGURATION SECTION.                                           SQ3034.2
   000009         000900 SOURCE-COMPUTER.                                                 SQ3034.2
   000010         001000     XXXXX082.                                                    SQ3034.2
   000011         001100 OBJECT-COMPUTER.                                                 SQ3034.2
   000012         001200     XXXXX083.                                                    SQ3034.2
   000013         001300 INPUT-OUTPUT SECTION.                                            SQ3034.2
   000014         001400 FILE-CONTROL.                                                    SQ3034.2
   000015         001500     SELECT TFIL ASSIGN                                           SQ3034.2 31
   000016         001600     XXXXX014                                                     SQ3034.2
   000017         001700         ORGANIZATION IS SEQUENTIAL                               SQ3034.2
   000018         001800         ACCESS MODE IS SEQUENTIAL.                               SQ3034.2
   000019         001900                                                                  SQ3034.2
   000020         002000     SELECT TFIL2 ASSIGN                                          SQ3034.2 35
   000021         002100     XXXXX008                                                     SQ3034.2
   000022         002200         ORGANIZATION IS SEQUENTIAL                               SQ3034.2
   000023         002300         ACCESS MODE IS SEQUENTIAL.                               SQ3034.2
   000024         002400                                                                  SQ3034.2
   000025         002500 I-O-CONTROL.                                                     SQ3034.2
   000026         002600     MULTIPLE FILE TAPE CONTAINS TFIL2.                           SQ3034.2
   000027         002700*Message expected for above statement: OBSOLETE                   SQ3034.2
   000028         002800                                                                  SQ3034.2
   000029         002900 DATA DIVISION.                                                   SQ3034.2
   000030         003000 FILE SECTION.                                                    SQ3034.2
   000031         003100 FD TFIL.                                                         SQ3034.2

 ==000031==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TFIL".

   000032         003200 01 FREC.                                                         SQ3034.2
   000033         003300     03 RKEY PIC 9(8).                                            SQ3034.2
   000034         003400                                                                  SQ3034.2
   000035         003500 FD TFIL2.                                                        SQ3034.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TFIL2".

   000036         003600 01 FREC2.                                                        SQ3034.2
   000037         003700     03 RKEY2 PIC 9(8).                                           SQ3034.2
   000038         003800                                                                  SQ3034.2
   000039         003900 PROCEDURE DIVISION.                                              SQ3034.2
   000040         004000                                                                  SQ3034.2
   000041         004100 SQ303M-CONTROL.                                                  SQ3034.2
   000042         004200     OPEN INPUT TFIL REVERSED.                                    SQ3034.2 31
   000043         004300*Message expected for above statement: OBSOLETE                   SQ3034.2
   000044         004400                                                                  SQ3034.2
   000045         004500     CLOSE TFIL.                                                  SQ3034.2 31
   000046         004600     STOP RUN.                                                    SQ3034.2
   000047         004700                                                                  SQ3034.2
   000048         004800                                                                  SQ3034.2
   000049         004900*TOTAL NUMBER OF FLAGS EXPECTED = 2.                              SQ3034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SQ303M    Date 06/04/2022  Time 11:56:46   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       32   FREC
       36   FREC2
       33   RKEY
       37   RKEY2
       31   TFIL . . . . . . . . . . . . .  15 42 45
       35   TFIL2. . . . . . . . . . . . .  20
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SQ303M    Date 06/04/2022  Time 11:56:46   Page     5
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

       41   SQ303M-CONTROL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SQ303M    Date 06/04/2022  Time 11:56:46   Page     6
0 Defined   Cross-reference of programs     References

        3   SQ303M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       SQ303M    Date 06/04/2022  Time 11:56:46   Page     7
0LineID  Message code  Message text

     31  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TFIL".

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TFIL2".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program SQ303M:
 *    Source records = 49
 *    Data Division statements = 4
 *    Procedure Division statements = 3
 *    Generated COBOL statements = 0
 *    Program complexity factor = 3
0End of compilation 1,  program SQ303M,  highest severity 0.
0Return code 0
