1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:52   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:52   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC204A    Date 06/04/2022  Time 11:57:52   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IC2044.2
   000002         000200 PROGRAM-ID.                                                      IC2044.2
   000003         000300     IC204A.                                                      IC2044.2
   000004         000500*                                                              *  IC2044.2
   000005         000600*    VALIDATION FOR:-                                          *  IC2044.2
   000006         000700*                                                              *  IC2044.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IC2044.2
   000008         000900*                                                              *  IC2044.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IC2044.2
   000010         001100*                                                              *  IC2044.2
   000011         001300*                                                              *  IC2044.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  IC2044.2
   000013         001500*                                                              *  IC2044.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  IC2044.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  IC2044.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  IC2044.2
   000017         001900*                                                              *  IC2044.2
   000018         002100*        THE SUBPROGRAM IC204 HAS TWO VARIABLES IN WORKING-       IC2044.2
   000019         002200*    STORAGE WHICH ARE INITIALIZED BY A VALUE STATEMENT.  THE     IC2044.2
   000020         002300*    DATA CONTENTS OF THESE VARIABLES ARE MODIFIED DURING         IC2044.2
   000021         002400*    EXECUTION OF THE SUBPROGRAM.  INDICATORS ARE SET FOR         IC2044.2
   000022         002500*    VARIABLES IN THE LINKAGE SECTION WHICH RELATE HOW MANY       IC2044.2
   000023         002600*    TIMES THE SUBPROGRAM HAS BEEN CALLED SINCE IT WAS            IC2044.2
   000024         002700*    INITIALIZED, AND WHETHER OR NOT THE SUBPROGRAM IS IN         IC2044.2
   000025         002800*    ITS INITIAL STATE.                                           IC2044.2
   000026         003000 ENVIRONMENT DIVISION.                                            IC2044.2
   000027         003100 CONFIGURATION SECTION.                                           IC2044.2
   000028         003200 SOURCE-COMPUTER.                                                 IC2044.2
   000029         003300     XXXXX082.                                                    IC2044.2
   000030         003400 OBJECT-COMPUTER.                                                 IC2044.2
   000031         003500     XXXXX083.                                                    IC2044.2
   000032         003600 INPUT-OUTPUT SECTION.                                            IC2044.2
   000033         003700 FILE-CONTROL.                                                    IC2044.2
   000034         003800     SELECT PRINT-FILE ASSIGN TO                                  IC2044.2 38
   000035         003900     XXXXX055.                                                    IC2044.2
   000036         004000 DATA DIVISION.                                                   IC2044.2
   000037         004100 FILE SECTION.                                                    IC2044.2
   000038         004200 FD  PRINT-FILE.                                                  IC2044.2

 ==000038==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000039         004300 01  PRINT-REC PICTURE X(120).                                    IC2044.2
   000040         004400 01  DUMMY-RECORD PICTURE X(120).                                 IC2044.2
   000041         004500 WORKING-STORAGE SECTION.                                         IC2044.2
   000042         004600 77  WS1  PICTURE 99 VALUE ZERO.                                  IC2044.2 IMP
   000043         004700 77  WS2 PICTURE X(5)   VALUE "FIRST".                            IC2044.2
   000044         004800 LINKAGE SECTION.                                                 IC2044.2
   000045         004900 77  SUB-DN1 PICTURE S999.                                        IC2044.2
   000046         005000 01  SUB-TABLE-1.                                                 IC2044.2
   000047         005100     02  SUB-DN2 PIC XXX.                                         IC2044.2
   000048         005200     02  SUB-DN3 PIC 99.                                          IC2044.2
   000049         005300     02  SUB-DN4 PIC X(5).                                        IC2044.2
   000050         005400 PROCEDURE DIVISION USING SUB-TABLE-1, SUB-DN1.                   IC2044.2 46 45
   000051         005500 SECT-IC204-0001 SECTION.                                         IC2044.2
   000052         005600 CNCL-TEST-01.                                                    IC2044.2
   000053         005700     ADD 1 TO WS1.                                                IC2044.2 42
   000054         005800     MOVE WS1 TO SUB-DN1.                                         IC2044.2 42 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC204A    Date 06/04/2022  Time 11:57:52   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 CNCL-TEST-02.                                                    IC2044.2
   000056         006000     MOVE "NO" TO SUB-DN2.                                        IC2044.2 47
   000057         006100     IF WS2 EQUAL TO "FIRST"                                      IC2044.2 43
   000058      1  006200         MOVE SPACE TO WS2                                        IC2044.2 IMP 43
   000059      1  006300         MOVE "YES" TO SUB-DN2.                                   IC2044.2 47
   000060         006400 CNCL-TEST-03.                                                    IC2044.2
   000061         006500     MOVE SPACE TO SUB-DN4.                                       IC2044.2 IMP 49
   000062         006600     IF WS1 EQUAL TO SUB-DN3                                      IC2044.2 42 48
   000063      1  006700         MOVE "EQUAL" TO SUB-DN4.                                 IC2044.2 49
   000064         006800 IC204-EXIT.                                                      IC2044.2
   000065         006900     EXIT PROGRAM.                                                IC2044.2
   000066         007000*        THE PARAMETER SUB-DN3 IS SET IN THE CALLING PROGRAM      IC2044.2
   000067         007100*    EQUAL TO THE NUMBER OF TIMES THE SUBPROGRAM HAS BEEN         IC2044.2
   000068         007200*    CALLED SINCE BEING INITIALIZED, EITHER BY THE FIRST CALL     IC2044.2
   000069         007300*    OR THE FIRST CALL AFTER A CANCEL STATEMENT.                  IC2044.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC204A    Date 06/04/2022  Time 11:57:52   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       40   DUMMY-RECORD
       38   PRINT-FILE . . . . . . . . . .  34
       39   PRINT-REC
       45   SUB-DN1. . . . . . . . . . . .  50 M54
       47   SUB-DN2. . . . . . . . . . . .  M56 M59
       48   SUB-DN3. . . . . . . . . . . .  62
       49   SUB-DN4. . . . . . . . . . . .  M61 M63
       46   SUB-TABLE-1. . . . . . . . . .  50
       42   WS1. . . . . . . . . . . . . .  M53 54 62
       43   WS2. . . . . . . . . . . . . .  57 M58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC204A    Date 06/04/2022  Time 11:57:52   Page     6
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

       52   CNCL-TEST-01
       55   CNCL-TEST-02
       60   CNCL-TEST-03
       64   IC204-EXIT
       51   SECT-IC204-0001
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC204A    Date 06/04/2022  Time 11:57:52   Page     7
0 Defined   Cross-reference of programs     References

        3   IC204A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IC204A    Date 06/04/2022  Time 11:57:52   Page     8
0LineID  Message code  Message text

     38  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IC204A:
 *    Source records = 69
 *    Data Division statements = 9
 *    Procedure Division statements = 10
 *    Generated COBOL statements = 0
 *    Program complexity factor = 10
0End of compilation 1,  program IC204A,  highest severity 0.
0Return code 0
