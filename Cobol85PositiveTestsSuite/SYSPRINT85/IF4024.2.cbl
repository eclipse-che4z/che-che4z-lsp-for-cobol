1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:54   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:54   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF402M    Date 06/04/2022  Time 11:56:54   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF4024.2
   000002         000200 PROGRAM-ID.                                                      IF4024.2
   000003         000300      IF402M.                                                     IF4024.2
   000004         000400                                                                  IF4024.2
   000005         000500                                                                  IF4024.2
   000006         000600*THIS PROGRAM TESTS THE FLAGGING OF HIGH SUBSET INTRINSIC FUNCTIONIF4024.2
   000007         000700*FEATURES.                                                        IF4024.2
   000008         000900*    THIS PROGRAMS CONTAINS TESTS FOR THE FOLLOWING INTRINSIC    *IF4024.2
   000009         001000*    FUNCTIONS:  LENGTH, LOG, LOG10, LOWER-CASE, MAX, MEAN,      *IF4024.2
   000010         001100*                MEDIAN, MIDRANGE, MIN, MOD, NUMVAL, NUMVAL-C,   *IF4024.2
   000011         001200*                ORD, ORD-MAX  AND ORD-MIN.                      *IF4024.2
   000012         001400                                                                  IF4024.2
   000013         001500 ENVIRONMENT DIVISION.                                            IF4024.2
   000014         001600 CONFIGURATION SECTION.                                           IF4024.2
   000015         001700 SOURCE-COMPUTER.                                                 IF4024.2
   000016         001800     XXXXX082.                                                    IF4024.2
   000017         001900 OBJECT-COMPUTER.                                                 IF4024.2
   000018         002000     XXXXX083.                                                    IF4024.2
   000019         002100                                                                  IF4024.2
   000020         002200 DATA DIVISION.                                                   IF4024.2
   000021         002300 FILE SECTION.                                                    IF4024.2
   000022         002400 WORKING-STORAGE SECTION.                                         IF4024.2
   000023         002500 01  WS-AN-TEMP   PICTURE    X(3).                                IF4024.2
   000024         002600 01  WS-TABLE-VALUE   PICTURE X(27)                               IF4024.2
   000025         002700                      VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ ".        IF4024.2
   000026         002800 01  WS-TABLE-TOTAL REDEFINES WS-TABLE-VALUE.                     IF4024.2 24
   000027         002900     05  WS-TABLE-LV3 OCCURS 3 TIMES.                             IF4024.2
   000028         003000         10  WS-TABLE-LV2 OCCURS 3 TIMES.                         IF4024.2
   000029         003100             15  WS-TABLE PICTURE X OCCURS 3 TIMES.               IF4024.2
   000030         003200                                                                  IF4024.2
   000031         003300 PROCEDURE DIVISION.                                              IF4024.2
   000032         003400 IF402M-LENGTH.                                                   IF4024.2
   000033         003500     IF FUNCTION LENGTH ("ABC") = FUNCTION LENGTH ("ABC")         IF4024.2 IFN IFN
   000034      1  003600                 CONTINUE.                                        IF4024.2
   000035         003700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000036         003800                                                                  IF4024.2
   000037         003900 IF402M-LOG.                                                      IF4024.2
   000038         004000     IF FUNCTION LOG (1.0) = FUNCTION LOG (1.0)                   IF4024.2 IFN IFN
   000039      1  004100                 CONTINUE.                                        IF4024.2
   000040         004200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000041         004300                                                                  IF4024.2
   000042         004400 IF402M-LOG10.                                                    IF4024.2
   000043         004500     IF FUNCTION LOG10 (1.0) = FUNCTION LOG10 (1.0)               IF4024.2 IFN IFN
   000044      1  004600                 CONTINUE.                                        IF4024.2
   000045         004700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000046         004800                                                                  IF4024.2
   000047         004900 IF402M-LOWER-CASE.                                               IF4024.2
   000048         005000     MOVE FUNCTION LOWER-CASE ("ABC") TO WS-AN-TEMP.              IF4024.2 IFN 23
   000049         005100*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000050         005200                                                                  IF4024.2
   000051         005300 IF402M-MAX.                                                      IF4024.2
   000052         005400     IF FUNCTION MAX (5, 6, 10, 3, 7) =                           IF4024.2 IFN
   000053         005500        FUNCTION MAX (5, 6, 10, 3, 7)                             IF4024.2 IFN
   000054      1  005600                 CONTINUE.                                        IF4024.2
   000055         005700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000056         005800                                                                  IF4024.2
   000057         005900     MOVE FUNCTION MAX (WS-TABLE (ALL, ALL, ALL)) TO WS-AN-TEMP.  IF4024.2 IFN 29 23
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF402M    Date 06/04/2022  Time 11:56:54   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000058         006000*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000059         006100                                                                  IF4024.2
   000060         006200 IF402M-MEAN.                                                     IF4024.2
   000061         006300     IF FUNCTION MEAN (5, -2, -14, 0) =                           IF4024.2 IFN
   000062         006400        FUNCTION MEAN (5, -2, -14, 0)                             IF4024.2 IFN
   000063      1  006500                 CONTINUE.                                        IF4024.2
   000064         006600*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000065         006700                                                                  IF4024.2
   000066         006800 IF402M-MEDIAN.                                                   IF4024.2
   000067         006900     IF FUNCTION MEDIAN (5, -2, -14, 0) =                         IF4024.2 IFN
   000068         007000        FUNCTION MEDIAN (5, -2, -14, 0)                           IF4024.2 IFN
   000069      1  007100                 CONTINUE.                                        IF4024.2
   000070         007200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000071         007300                                                                  IF4024.2
   000072         007400 IF402M-MIDRANGE.                                                 IF4024.2
   000073         007500     IF FUNCTION MIDRANGE (5, -2, -14, 0) =                       IF4024.2 IFN
   000074         007600        FUNCTION MIDRANGE (5, -2, -14, 0)                         IF4024.2 IFN
   000075      1  007700                 CONTINUE.                                        IF4024.2
   000076         007800*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000077         007900                                                                  IF4024.2
   000078         008000 IF402M-MIN.                                                      IF4024.2
   000079         008100     IF FUNCTION MIN (5, 6, 10, 3, 7) =                           IF4024.2 IFN
   000080         008200        FUNCTION MIN (5, 6, 10, 3, 7)                             IF4024.2 IFN
   000081      1  008300                 CONTINUE.                                        IF4024.2
   000082         008400*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000083         008500                                                                  IF4024.2
   000084         008600     MOVE FUNCTION MIN (WS-TABLE (ALL, ALL, ALL)) TO WS-AN-TEMP.  IF4024.2 IFN 29 23
   000085         008700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000086         008800                                                                  IF4024.2
   000087         008900 IF402M-MOD.                                                      IF4024.2
   000088         009000     IF FUNCTION MOD (6, 6) = FUNCTION MOD (6, 6)                 IF4024.2 IFN IFN
   000089      1  009100                 CONTINUE.                                        IF4024.2
   000090         009200*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000091         009300                                                                  IF4024.2
   000092         009400 IF402M-NUMVAL.                                                   IF4024.2
   000093         009500     IF FUNCTION NUMVAL ("4738") = FUNCTION NUMVAL ("4738")       IF4024.2 IFN IFN
   000094      1  009600                 CONTINUE.                                        IF4024.2
   000095         009700*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000096         009800                                                                  IF4024.2
   000097         009900 IF402M-NUMVAL-C.                                                 IF4024.2
   000098         010000     IF FUNCTION NUMVAL-C ("-$1,234.56") =                        IF4024.2 IFN
   000099         010100        FUNCTION NUMVAL-C ("-$1,234.56")                          IF4024.2 IFN
   000100      1  010200                 CONTINUE.                                        IF4024.2
   000101         010300*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000102         010400                                                                  IF4024.2
   000103         010500 IF402M-ORD.                                                      IF4024.2
   000104         010600     IF FUNCTION ORD ("A") = FUNCTION ORD ("A")                   IF4024.2 IFN IFN
   000105      1  010700                 CONTINUE.                                        IF4024.2
   000106         010800*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000107         010900                                                                  IF4024.2
   000108         011000 IF402M-ORD-MAX.                                                  IF4024.2
   000109         011100     IF FUNCTION ORD-MAX (5, 3, 2, 8, 3, 1) =                     IF4024.2 IFN
   000110         011200        FUNCTION ORD-MAX (5, 3, 2, 8, 3, 1)                       IF4024.2 IFN
   000111      1  011300                 CONTINUE.                                        IF4024.2
   000112         011400*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000113         011500                                                                  IF4024.2
   000114         011600 IF402M-ORD-MIN.                                                  IF4024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF402M    Date 06/04/2022  Time 11:56:54   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000115         011700     IF FUNCTION ORD-MIN (5, 3, 2, 8, 3, 1) =                     IF4024.2 IFN
   000116         011800        FUNCTION ORD-MIN (5, 3, 2, 8, 3, 1)                       IF4024.2 IFN
   000117      1  011900                 CONTINUE.                                        IF4024.2
   000118         012000*MESSAGE EXPECTED FOR ABOVE STATEMENT: NON-CONFORMING STANDARD    IF4024.2
   000119         012100                                                                  IF4024.2
   000120         012200 IF402M-END.                                                      IF4024.2
   000121         012300                                                                  IF4024.2
   000122         012400*TOTAL NUMBER OF FLAGS EXPECTED = 17.                             IF4024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF402M    Date 06/04/2022  Time 11:56:54   Page     6
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       23   WS-AN-TEMP . . . . . . . . . .  M48 M57 M84
       29   WS-TABLE . . . . . . . . . . .  57 84
       28   WS-TABLE-LV2
       27   WS-TABLE-LV3
       26   WS-TABLE-TOTAL
       24   WS-TABLE-VALUE . . . . . . . .  26
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF402M    Date 06/04/2022  Time 11:56:54   Page     7
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

      120   IF402M-END
       32   IF402M-LENGTH
       37   IF402M-LOG
       42   IF402M-LOG10
       47   IF402M-LOWER-CASE
       51   IF402M-MAX
       60   IF402M-MEAN
       66   IF402M-MEDIAN
       72   IF402M-MIDRANGE
       78   IF402M-MIN
       87   IF402M-MOD
       92   IF402M-NUMVAL
       97   IF402M-NUMVAL-C
      103   IF402M-ORD
      108   IF402M-ORD-MAX
      114   IF402M-ORD-MIN
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF402M    Date 06/04/2022  Time 11:56:54   Page     8
0 Defined   Cross-reference of programs     References

        3   IF402M
-* Statistics for COBOL program IF402M:
 *    Source records = 122
 *    Data Division statements = 6
 *    Procedure Division statements = 31
 *    Generated COBOL statements = 0
 *    Program complexity factor = 31
0End of compilation 1,  program IF402M,  no statements flagged.
0Return code 0
