1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:21   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:21   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC102A    Date 06/04/2022  Time 11:56:21   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC1024.2
   000002         000200 PROGRAM-ID.                                                      IC1024.2
   000003         000300     IC102A.                                                      IC1024.2
   000004         000500*                                                              *  IC1024.2
   000005         000600*    VALIDATION FOR:-                                          *  IC1024.2
   000006         000700*                                                              *  IC1024.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC1024.2
   000008         000900*                                                              *  IC1024.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC1024.2
   000010         001100*                                                              *  IC1024.2
   000011         001300*                                                              *  IC1024.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC1024.2
   000013         001500*                                                              *  IC1024.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC1024.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC1024.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC1024.2
   000017         001900*                                                              *  IC1024.2
   000018         002100*        THIS PROGRAM TESTS THE USE OF THE LINKAGE SECTION        IC1024.2
   000019         002200*    AND USING PHRASE IN THE PROCEDURE DIVISION HEADER.           IC1024.2
   000020         002300 ENVIRONMENT DIVISION.                                            IC1024.2
   000021         002400 CONFIGURATION SECTION.                                           IC1024.2
   000022         002500 SOURCE-COMPUTER.                                                 IC1024.2
   000023         002600     XXXXX082.                                                    IC1024.2
   000024         002700 OBJECT-COMPUTER.                                                 IC1024.2
   000025         002800     XXXXX083.                                                    IC1024.2
   000026         002900 INPUT-OUTPUT SECTION.                                            IC1024.2
   000027         003000 FILE-CONTROL.                                                    IC1024.2
   000028         003100     SELECT PRINT-FILE ASSIGN TO                                  IC1024.2 32
   000029         003200     XXXXX055.                                                    IC1024.2
   000030         003300 DATA DIVISION.                                                   IC1024.2
   000031         003400 FILE SECTION.                                                    IC1024.2
   000032         003500 FD  PRINT-FILE.                                                  IC1024.2

 ==000032==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000033         003600 01  PRINT-REC PICTURE X(120).                                    IC1024.2
   000034         003700 01  DUMMY-RECORD PICTURE X(120).                                 IC1024.2
   000035         003800 WORKING-STORAGE SECTION.                                         IC1024.2
   000036         003900 77  DN2 PICTURE S9  VALUE ZERO.                                  IC1024.2 IMP
   000037         004000 LINKAGE SECTION.                                                 IC1024.2
   000038         004100 77  DN1 PICTURE S9.                                              IC1024.2
   000039         004200 PROCEDURE DIVISION USING DN1.                                    IC1024.2 38
   000040         004300 SECT-IC102-0001 SECTION.                                         IC1024.2
   000041         004400 CALL-TEST-001.                                                   IC1024.2
   000042         004500     ADD 1 TO DN2.                                                IC1024.2 36
   000043         004600     MOVE DN2 TO DN1.                                             IC1024.2 36 38
   000044         004700 CALL-EXIT-001.                                                   IC1024.2
   000045         004800     EXIT PROGRAM.                                                IC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC102A    Date 06/04/2022  Time 11:56:21   Page     4
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       38   DN1. . . . . . . . . . . . . .  39 M43
       36   DN2. . . . . . . . . . . . . .  M42 43
       34   DUMMY-RECORD
       32   PRINT-FILE . . . . . . . . . .  28
       33   PRINT-REC
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC102A    Date 06/04/2022  Time 11:56:21   Page     5
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

       44   CALL-EXIT-001
       41   CALL-TEST-001
       40   SECT-IC102-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC102A    Date 06/04/2022  Time 11:56:21   Page     6
0 Defined   Cross-reference of programs     References

        3   IC102A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC102A    Date 06/04/2022  Time 11:56:21   Page     7
0LineID  Message code  Message text

     32  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC102A:
 *    Source records = 45
 *    Data Division statements = 4
 *    Procedure Division statements = 3
 *    Generated COBOL statements = 0
 *    Program complexity factor = 3
0End of compilation 1,  program IC102A,  highest severity 0.
0Return code 0
