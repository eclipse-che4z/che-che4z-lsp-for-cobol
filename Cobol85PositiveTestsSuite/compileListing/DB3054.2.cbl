1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:20   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:20   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB305M    Date 06/04/2022  Time 11:56:20   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         DB3054.2
   000002         000200 PROGRAM-ID.                                                      DB3054.2
   000003         000300     DB305M.                                                      DB3054.2
   000004         000400*THE FOLLOWING PROGRAM TESTS THE FLAGGING OF LEVEL 1              DB3054.2
   000005         000500*OBSOLETE FEATURES THAT ARE USED IN DEBUGGING.                    DB3054.2
   000006         000600 ENVIRONMENT DIVISION.                                            DB3054.2
   000007         000700 CONFIGURATION SECTION.                                           DB3054.2
   000008         000800 SOURCE-COMPUTER.                                                 DB3054.2
   000009         000900     XXXXX082                                                     DB3054.2
   000010         001000     WITH DEBUGGING MODE.                                         DB3054.2
   000011         001100 OBJECT-COMPUTER.                                                 DB3054.2
   000012         001200     XXXXX083.                                                    DB3054.2
   000013         001300                                                                  DB3054.2
   000014         001400 INPUT-OUTPUT SECTION.                                            DB3054.2
   000015         001500 FILE-CONTROL.                                                    DB3054.2
   000016         001600     SELECT TFIL ASSIGN                                           DB3054.2 23
   000017         001700     XXXXX014                                                     DB3054.2
   000018         001800         ORGANIZATION IS SEQUENTIAL                               DB3054.2
   000019         001900         ACCESS MODE IS SEQUENTIAL.                               DB3054.2
   000020         002000                                                                  DB3054.2
   000021         002100 DATA DIVISION.                                                   DB3054.2
   000022         002200 FILE SECTION.                                                    DB3054.2
   000023         002300 FD TFIL.                                                         DB3054.2

 ==000023==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "TFIL".

   000024         002400 01 FREC.                                                         DB3054.2
   000025         002500     03 RKEY  PIC 9(8).                                           DB3054.2
   000026         002600                                                                  DB3054.2
   000027         002700 PROCEDURE DIVISION.                                              DB3054.2
   000028         002800                                                                  DB3054.2
   000029         002900 DECLARATIVES.                                                    DB3054.2
   000030         003000                                                                  DB3054.2
   000031         003100 BUGGING SECTION.                                                 DB3054.2
   000032         003200                                                                  DB3054.2
   000033         003300     USE FOR DEBUGGING ON ALL PROCEDURES.                         DB3054.2
   000034         003400*Message expected for above statement: OBSOLETE                   DB3054.2
   000035         003500                                                                  DB3054.2
   000036         003600 END DECLARATIVES.                                                DB3054.2

 ==000036==> IGYPS2036-I A paragraph-name was missing after the "USE" statement.

   000037         003700                                                                  DB3054.2
   000038         003800 DB305-FLAGS SECTION.                                             DB3054.2
   000039         003900                                                                  DB3054.2
   000040         004000 DB305M-CONTROL.                                                  DB3054.2
   000041         004100     DISPLAY "THIS IS A DUMMY PROCEDURE".                         DB3054.2
   000042         004200     STOP RUN.                                                    DB3054.2
   000043         004300                                                                  DB3054.2
   000044         004400*TOTAL NUMBER OF FLAGS EXPECTED = 1.                              DB3054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB305M    Date 06/04/2022  Time 11:56:20   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       24   FREC
       25   RKEY
       23   TFIL . . . . . . . . . . . . .  16
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB305M    Date 06/04/2022  Time 11:56:20   Page     5
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

       31   BUGGING
       38   DB305-FLAGS
       40   DB305M-CONTROL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB305M    Date 06/04/2022  Time 11:56:20   Page     6
0 Defined   Cross-reference of programs     References

        3   DB305M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       DB305M    Date 06/04/2022  Time 11:56:20   Page     7
0LineID  Message code  Message text

     23  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "TFIL".

     36  IGYPS2036-I   A paragraph-name was missing after the "USE" statement.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program DB305M:
 *    Source records = 44
 *    Data Division statements = 2
 *    Procedure Division statements = 3
 *    Generated COBOL statements = 0
 *    Program complexity factor = 3
0End of compilation 1,  program DB305M,  highest severity 0.
0Return code 0
