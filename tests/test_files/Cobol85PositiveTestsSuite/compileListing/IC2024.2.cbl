1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:48   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:48   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC202A    Date 06/04/2022  Time 11:56:48   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2024.2
   000002         000200 PROGRAM-ID.                                                      IC2024.2
   000003         000300     IC202A.                                                      IC2024.2
   000004         000500*                                                              *  IC2024.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2024.2
   000006         000700*                                                              *  IC2024.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2024.2
   000008         000900*                                                              *  IC2024.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2024.2
   000010         001100*                                                              *  IC2024.2
   000011         001300*                                                              *  IC2024.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2024.2
   000013         001500*                                                              *  IC2024.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2024.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2024.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2024.2
   000017         001900*                                                              *  IC2024.2
   000018         002100*        THE SUBPROGRAM IC202 IS CALLED BY THE PROGRAM IC201.  *  IC2024.2
   000019         002200*    THE SUBPROGRAM HAS FOUR OPERANDS IN THE USING PHRASE      *  IC2024.2
   000020         002300*    OF THE PROCEDURE DIVISION HEADER.                         *  IC2024.2
   000021         002500 ENVIRONMENT DIVISION.                                            IC2024.2
   000022         002600 CONFIGURATION SECTION.                                           IC2024.2
   000023         002700 SOURCE-COMPUTER.                                                 IC2024.2
   000024         002800     XXXXX082.                                                    IC2024.2
   000025         002900 OBJECT-COMPUTER.                                                 IC2024.2
   000026         003000     XXXXX083.                                                    IC2024.2
   000027         003100 INPUT-OUTPUT SECTION.                                            IC2024.2
   000028         003200 FILE-CONTROL.                                                    IC2024.2
   000029         003300     SELECT PRINT-FILE ASSIGN TO                                  IC2024.2 33
   000030         003400     XXXXX055.                                                    IC2024.2
   000031         003500 DATA DIVISION.                                                   IC2024.2
   000032         003600 FILE SECTION.                                                    IC2024.2
   000033         003700 FD  PRINT-FILE.                                                  IC2024.2

 ==000033==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000034         003800 01  PRINT-REC PICTURE X(120).                                    IC2024.2
   000035         003900 01  DUMMY-RECORD PICTURE X(120).                                 IC2024.2
   000036         004000 WORKING-STORAGE SECTION.                                         IC2024.2
   000037         004100 77  WS1 PICTURE S999.                                            IC2024.2
   000038         004200 77  WS2 PICTURE S999                                             IC2024.2
   000039         004300         USAGE COMPUTATIONAL, VALUE ZERO.                         IC2024.2 IMP
   000040         004400 LINKAGE SECTION.                                                 IC2024.2
   000041         004500 77  DN1 PICTURE S99.                                             IC2024.2
   000042         004600 77  DN2 PICTURE S99 USAGE COMPUTATIONAL.                         IC2024.2
   000043         004700 77  DN3 PICTURE S99.                                             IC2024.2
   000044         004800 77  DN4 PICTURE S99 USAGE COMPUTATIONAL.                         IC2024.2
   000045         004900 PROCEDURE DIVISION USING DN1, DN2, DN3, DN4.                     IC2024.2 41 42 43 44
   000046         005000 SECT-IC202-0001 SECTION.                                         IC2024.2
   000047         005100 CALL-TEST-001.                                                   IC2024.2
   000048         005200     MOVE DN1 TO WS1.                                             IC2024.2 41 37
   000049         005300     ADD 1 TO WS1.                                                IC2024.2 37
   000050         005400     ADD 1 TO WS2.                                                IC2024.2 38
   000051         005500     MOVE WS1 TO DN3.                                             IC2024.2 37 43
   000052         005600     MOVE WS2 TO DN4.                                             IC2024.2 38 44
   000053         005700 CALL-EXIT-001.                                                   IC2024.2
   000054         005800     EXIT PROGRAM.                                                IC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC202A    Date 06/04/2022  Time 11:56:48   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       41   DN1. . . . . . . . . . . . . .  45 48
       42   DN2. . . . . . . . . . . . . .  45
       43   DN3. . . . . . . . . . . . . .  45 M51
       44   DN4. . . . . . . . . . . . . .  45 M52
       35   DUMMY-RECORD
       33   PRINT-FILE . . . . . . . . . .  29
       34   PRINT-REC
       37   WS1. . . . . . . . . . . . . .  M48 M49 51
       38   WS2. . . . . . . . . . . . . .  M50 52
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC202A    Date 06/04/2022  Time 11:56:48   Page     5
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

       53   CALL-EXIT-001
       47   CALL-TEST-001
       46   SECT-IC202-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC202A    Date 06/04/2022  Time 11:56:48   Page     6
0 Defined   Cross-reference of programs     References

        3   IC202A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC202A    Date 06/04/2022  Time 11:56:48   Page     7
0LineID  Message code  Message text

     33  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC202A:
 *    Source records = 54
 *    Data Division statements = 8
 *    Procedure Division statements = 6
 *    Generated COBOL statements = 0
 *    Program complexity factor = 6
0End of compilation 1,  program IC202A,  highest severity 0.
0Return code 0
