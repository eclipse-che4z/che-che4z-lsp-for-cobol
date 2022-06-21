1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:01   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:01   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF401M    Date 06/04/2022  Time 11:57:01   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF4014.2
   000002         000200 PROGRAM-ID.                                                      IF4014.2
   000003         000300      IF401M.                                                     IF4014.2
   000004         000400                                                                  IF4014.2
   000005         000500                                                                  IF4014.2
   000006         000600*THIS PROGRAM TESTS THE FLAGGING OF HIGH SUBSET INTRINSIC FUNCTIONIF4014.2
   000007         000700*FEATURES.                                                        IF4014.2
   000008         000900*    THIS PROGRAMS CONTAINS TESTS FOR THE FOLLOWING INTRINSIC    *IF4014.2
   000009         001000*    FUNCTIONS:  ACOS, ANNUITY, ASIN, ATAN, CHAR, COS,           *IF4014.2
   000010         001100*                CURRENT-DATE, DATE-OF-INTEGER, DAY-OF-INTEGER,  *IF4014.2
   000011         001200*                FACTORIAL, INTEGER, INTEGER-OF-DATE,            *IF4014.2
   000012         001300*                INTEGER-OF-DAY AND INTEGER-PART.                *IF4014.2
   000013         001500                                                                  IF4014.2
   000014         001600 ENVIRONMENT DIVISION.                                            IF4014.2
   000015         001700 CONFIGURATION SECTION.                                           IF4014.2
   000016         001800 SOURCE-COMPUTER.                                                 IF4014.2
   000017         001900     XXXXX082.                                                    IF4014.2
   000018         002000 OBJECT-COMPUTER.                                                 IF4014.2
   000019         002100     XXXXX083.                                                    IF4014.2
   000020         002200                                                                  IF4014.2
   000021         002300 DATA DIVISION.                                                   IF4014.2
   000022         002400 FILE SECTION.                                                    IF4014.2
   000023         002500 WORKING-STORAGE SECTION.                                         IF4014.2
   000024         002600 01  TEMP1        PICTURE    X(21).                               IF4014.2
   000025         002700 01  WS-ANUM      PICTURE    X.                                   IF4014.2
   000026         002800                                                                  IF4014.2
   000027         002900 PROCEDURE DIVISION.                                              IF4014.2
   000028         003000 IF401M-ACOS.                                                     IF4014.2
   000029         003100     IF FUNCTION ACOS (1.0) = FUNCTION ACOS (1.0)                 IF4014.2 IFN IFN
   000030      1  003200                 CONTINUE.                                        IF4014.2
   000031         003300*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000032         003400                                                                  IF4014.2
   000033         003500 IF401M-ANNUITY.                                                  IF4014.2
   000034         003600     IF FUNCTION ANNUITY (0, 4) = FUNCTION ANNUITY (0, 4)         IF4014.2 IFN IFN
   000035      1  003700                 CONTINUE.                                        IF4014.2
   000036         003800*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000037         003900                                                                  IF4014.2
   000038         004000 IF401M-ASIN.                                                     IF4014.2
   000039         004100     IF FUNCTION ASIN (1.0) = FUNCTION ASIN (1.0)                 IF4014.2 IFN IFN
   000040      1  004200                 CONTINUE.                                        IF4014.2
   000041         004300*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000042         004400                                                                  IF4014.2
   000043         004500 IF401M-ATAN.                                                     IF4014.2
   000044         004600     IF FUNCTION ATAN (1.0) = FUNCTION ATAN (1.0)                 IF4014.2 IFN IFN
   000045      1  004700                 CONTINUE.                                        IF4014.2
   000046         004800*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000047         004900                                                                  IF4014.2
   000048         005000 IF401M-CHAR.                                                     IF4014.2
   000049         005100     MOVE FUNCTION CHAR (37) TO WS-ANUM.                          IF4014.2 IFN 25
   000050         005200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000051         005300                                                                  IF4014.2
   000052         005400 IF401M-COS.                                                      IF4014.2
   000053         005500     IF FUNCTION COS (1.0) = FUNCTION COS (1.0)                   IF4014.2 IFN IFN
   000054      1  005600                 CONTINUE.                                        IF4014.2
   000055         005700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000056         005800                                                                  IF4014.2
   000057         005900 IF401M-CURRENT-DATE.                                             IF4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF401M    Date 06/04/2022  Time 11:57:01   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000     MOVE FUNCTION CURRENT-DATE TO TEMP1.                         IF4014.2 IFN 24
   000059         006100*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000060         006200                                                                  IF4014.2
   000061         006300 IF401M-DATE-OF-INTEGER.                                          IF4014.2
   000062         006400     IF FUNCTION DATE-OF-INTEGER (1) =                            IF4014.2 IFN
   000063         006500        FUNCTION DATE-OF-INTEGER (1)                              IF4014.2 IFN
   000064      1  006600                 CONTINUE.                                        IF4014.2
   000065         006700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000066         006800                                                                  IF4014.2
   000067         006900 IF401M-DAY-OF-INTEGER.                                           IF4014.2
   000068         007000     IF FUNCTION DAY-OF-INTEGER (1) = FUNCTION DAY-OF-INTEGER (1) IF4014.2 IFN IFN
   000069      1  007100                 CONTINUE.                                        IF4014.2
   000070         007200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000071         007300                                                                  IF4014.2
   000072         007400 IF401M-FACTORIAL.                                                IF4014.2
   000073         007500     IF FUNCTION FACTORIAL (1) = FUNCTION FACTORIAL (1)           IF4014.2 IFN IFN
   000074      1  007600                 CONTINUE.                                        IF4014.2
   000075         007700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000076         007800                                                                  IF4014.2
   000077         007900 IF401M-INTEGER.                                                  IF4014.2
   000078         008000     IF FUNCTION INTEGER (1.0) = FUNCTION INTEGER (1.0)           IF4014.2 IFN IFN
   000079      1  008100                 CONTINUE.                                        IF4014.2
   000080         008200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000081         008300                                                                  IF4014.2
   000082         008400 IF401M-INTEGER-OF-DATE.                                          IF4014.2
   000083         008500     IF FUNCTION INTEGER-OF-DATE (16010101) =                     IF4014.2 IFN
   000084         008600        FUNCTION INTEGER-OF-DATE (16010101)                       IF4014.2 IFN
   000085      1  008700                 CONTINUE.                                        IF4014.2
   000086         008800*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000087         008900                                                                  IF4014.2
   000088         009000 IF401M-INTEGER-OF-DAY.                                           IF4014.2
   000089         009100     IF FUNCTION INTEGER-OF-DAY (1601001) =                       IF4014.2 IFN
   000090         009200        FUNCTION INTEGER-OF-DAY (1601001)                         IF4014.2 IFN
   000091      1  009300                 CONTINUE.                                        IF4014.2
   000092         009400*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000093         009500                                                                  IF4014.2
   000094         009600 IF401M-INTEGER-PART.                                             IF4014.2
   000095         009700     IF FUNCTION INTEGER-PART (4.578) =                           IF4014.2 IFN
   000096         009800        FUNCTION INTEGER-PART (4.578)                             IF4014.2 IFN
   000097      1  009900                 CONTINUE.                                        IF4014.2
   000098         010000*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4014.2
   000099         010100                                                                  IF4014.2
   000100         010200 IF401M-END.                                                      IF4014.2
   000101         010300                                                                  IF4014.2
   000102         010400*TOTAL NUMBER OF FLAGS EXPECTED = 14.                             IF4014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF401M    Date 06/04/2022  Time 11:57:01   Page     5
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       24   TEMP1. . . . . . . . . . . . .  M58
       25   WS-ANUM. . . . . . . . . . . .  M49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF401M    Date 06/04/2022  Time 11:57:01   Page     6
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

       28   IF401M-ACOS
       33   IF401M-ANNUITY
       38   IF401M-ASIN
       43   IF401M-ATAN
       48   IF401M-CHAR
       52   IF401M-COS
       57   IF401M-CURRENT-DATE
       61   IF401M-DATE-OF-INTEGER
       67   IF401M-DAY-OF-INTEGER
      100   IF401M-END
       72   IF401M-FACTORIAL
       77   IF401M-INTEGER
       82   IF401M-INTEGER-OF-DATE
       88   IF401M-INTEGER-OF-DAY
       94   IF401M-INTEGER-PART
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF401M    Date 06/04/2022  Time 11:57:01   Page     7
0 Defined   Cross-reference of programs     References

        3   IF401M
-* Statistics for COBOL program IF401M:
 *    Source records = 102
 *    Data Division statements = 2
 *    Procedure Division statements = 26
 *    Generated COBOL statements = 0
 *    Program complexity factor = 26
0End of compilation 1,  program IF401M,  no statements flagged.
0Return code 0
