1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:13   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:13   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF403M    Date 06/04/2022  Time 11:57:13   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF4034.2
   000002         000200 PROGRAM-ID.                                                      IF4034.2
   000003         000300      IF403M.                                                     IF4034.2
   000004         000400                                                                  IF4034.2
   000005         000500                                                                  IF4034.2
   000006         000600*THIS PROGRAM TESTS THE FLAGGING OF HIGH SUBSET INTRINSIC FUNCTIONIF4034.2
   000007         000700*FEATURES.                                                        IF4034.2
   000008         000900*    THIS PROGRAMS CONTAINS TESTS FOR THE FOLLOWING INTRINSIC    *IF4034.2
   000009         001000*    FUNCTIONS:  PRESENT-VALUE, RANDOM, RANGE, REM, REVERSE,     *IF4034.2
   000010         001100*                SIN, SQRT, STANDARD-DEVIATION, SUM, TAN,        *IF4034.2
   000011         001200*                UPPER-CASE, VARIANCE AND WHEN-COMPILED.         *IF4034.2
   000012         001400                                                                  IF4034.2
   000013         001500 ENVIRONMENT DIVISION.                                            IF4034.2
   000014         001600 CONFIGURATION SECTION.                                           IF4034.2
   000015         001700 SOURCE-COMPUTER.                                                 IF4034.2
   000016         001800     XXXXX082.                                                    IF4034.2
   000017         001900 OBJECT-COMPUTER.                                                 IF4034.2
   000018         002000     XXXXX083.                                                    IF4034.2
   000019         002100                                                                  IF4034.2
   000020         002200 DATA DIVISION.                                                   IF4034.2
   000021         002300 FILE SECTION.                                                    IF4034.2
   000022         002400 WORKING-STORAGE SECTION.                                         IF4034.2
   000023         002500 01  WS-AN-TEMP   PICTURE    X(21).                               IF4034.2
   000024         002600                                                                  IF4034.2
   000025         002700 PROCEDURE DIVISION.                                              IF4034.2
   000026         002800 IF403M-PRESENT-VALUE.                                            IF4034.2
   000027         002900     IF FUNCTION PRESENT-VALUE (0, 23, 12, 9) =                   IF4034.2 IFN
   000028         003000        FUNCTION PRESENT-VALUE (0, 23, 12, 9)                     IF4034.2 IFN
   000029      1  003100                 CONTINUE.                                        IF4034.2
   000030         003200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000031         003300                                                                  IF4034.2
   000032         003400 IF403M-RANDOM.                                                   IF4034.2
   000033         003500     IF FUNCTION RANDOM (1) = FUNCTION RANDOM (1)                 IF4034.2 IFN IFN
   000034      1  003600                 CONTINUE.                                        IF4034.2
   000035         003700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000036         003800                                                                  IF4034.2
   000037         003900 IF403M-RANGE.                                                    IF4034.2
   000038         004000     IF FUNCTION RANGE (5, -2, -14, 0) =                          IF4034.2 IFN
   000039         004100        FUNCTION RANGE (5, -2, -14, 0)                            IF4034.2 IFN
   000040      1  004200                 CONTINUE.                                        IF4034.2
   000041         004300*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000042         004400                                                                  IF4034.2
   000043         004500 IF403M-REM.                                                      IF4034.2
   000044         004600     IF FUNCTION REM (0, 20) = FUNCTION REM (0, 20)               IF4034.2 IFN IFN
   000045      1  004700                 CONTINUE.                                        IF4034.2
   000046         004800*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000047         004900                                                                  IF4034.2
   000048         005000 IF403M-REVERSE.                                                  IF4034.2
   000049         005100     MOVE FUNCTION REVERSE ("ABC") TO WS-AN-TEMP.                 IF4034.2 IFN 23
   000050         005200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000051         005300                                                                  IF4034.2
   000052         005400 IF403M-SIN.                                                      IF4034.2
   000053         005500     IF FUNCTION SIN (1.0) = FUNCTION SIN (1.0)                   IF4034.2 IFN IFN
   000054      1  005600                 CONTINUE.                                        IF4034.2
   000055         005700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000056         005800                                                                  IF4034.2
   000057         005900 IF403M-SQRT.                                                     IF4034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF403M    Date 06/04/2022  Time 11:57:13   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000     IF FUNCTION SQRT (0) = FUNCTION SQRT (0)                     IF4034.2 IFN IFN
   000059      1  006100                 CONTINUE.                                        IF4034.2
   000060         006200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000061         006300                                                                  IF4034.2
   000062         006400 IF403M-STANDARD-DEVIATION.                                       IF4034.2
   000063         006500     IF FUNCTION STANDARD-DEVIATION (5, -2, -14, 0) =             IF4034.2 IFN
   000064         006600        FUNCTION STANDARD-DEVIATION (5, -2, -14, 0)               IF4034.2 IFN
   000065      1  006700                 CONTINUE.                                        IF4034.2
   000066         006800*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000067         006900                                                                  IF4034.2
   000068         007000 IF403M-SUM.                                                      IF4034.2
   000069         007100     IF FUNCTION SUM (5, -2, -14, 0) =                            IF4034.2 IFN
   000070         007200        FUNCTION SUM (5, -2, -14, 0)                              IF4034.2 IFN
   000071      1  007300                 CONTINUE.                                        IF4034.2
   000072         007400*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000073         007500                                                                  IF4034.2
   000074         007600 IF403M-TAN.                                                      IF4034.2
   000075         007700     IF FUNCTION TAN (1.0) = FUNCTION TAN (1.0)                   IF4034.2 IFN IFN
   000076      1  007800                 CONTINUE.                                        IF4034.2
   000077         007900*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000078         008000                                                                  IF4034.2
   000079         008100 IF403M-UPPER-CASE.                                               IF4034.2
   000080         008200     MOVE FUNCTION UPPER-CASE ("abc") TO WS-AN-TEMP.              IF4034.2 IFN 23
   000081         008300*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000082         008400                                                                  IF4034.2
   000083         008500 IF403M-VARIANCE.                                                 IF4034.2
   000084         008600     IF FUNCTION VARIANCE (5, -2, -14, 0) =                       IF4034.2 IFN
   000085         008700        FUNCTION VARIANCE (5, -2, -14, 0)                         IF4034.2 IFN
   000086      1  008800                 CONTINUE.                                        IF4034.2
   000087         008900*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000088         009000                                                                  IF4034.2
   000089         009100 IF403M-WHEN-COMPILED.                                            IF4034.2
   000090         009200     MOVE FUNCTION WHEN-COMPILED TO WS-AN-TEMP.                   IF4034.2 IFN 23
   000091         009300*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4034.2
   000092         009400                                                                  IF4034.2
   000093         009500 IF403M-END.                                                      IF4034.2
   000094         009600                                                                  IF4034.2
   000095         009700*TOTAL NUMBER OF FLAGS EXPECTED = 13.                             IF4034.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF403M    Date 06/04/2022  Time 11:57:13   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       23   WS-AN-TEMP . . . . . . . . . .  M49 M80 M90
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF403M    Date 06/04/2022  Time 11:57:13   Page     6
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

       93   IF403M-END
       26   IF403M-PRESENT-VALUE
       32   IF403M-RANDOM
       37   IF403M-RANGE
       43   IF403M-REM
       48   IF403M-REVERSE
       52   IF403M-SIN
       57   IF403M-SQRT
       62   IF403M-STANDARD-DEVIATION
       68   IF403M-SUM
       74   IF403M-TAN
       79   IF403M-UPPER-CASE
       83   IF403M-VARIANCE
       89   IF403M-WHEN-COMPILED
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF403M    Date 06/04/2022  Time 11:57:13   Page     7
0 Defined   Cross-reference of programs     References

        3   IF403M
-* Statistics for COBOL program IF403M:
 *    Source records = 95
 *    Data Division statements = 1
 *    Procedure Division statements = 23
 *    Generated COBOL statements = 0
 *    Program complexity factor = 23
0End of compilation 1,  program IF403M,  no statements flagged.
0Return code 0
