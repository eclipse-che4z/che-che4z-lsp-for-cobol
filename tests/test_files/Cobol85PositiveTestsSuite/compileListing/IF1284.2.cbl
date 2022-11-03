1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:12   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:12   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1284.2
   000002         000200 PROGRAM-ID.                                                      IF1284.2
   000003         000300     IF128A.                                                      IF1284.2
   000004         000400                                                                  IF1284.2
   000005         000600*                                                         *       IF1284.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1284.2
   000007         000800* It contains tests for the Intrinsic Function ORD-MAX.   *       IF1284.2
   000008         000900*                                                         *       IF1284.2
   000009         001000*                                                         *       IF1284.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1284.2
   000011         001300 CONFIGURATION SECTION.                                           IF1284.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1284.2
   000013         001500     XXXXX082.                                                    IF1284.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1284.2
   000015         001700     XXXXX083                                                     IF1284.2
   000016         001800     PROGRAM COLLATING SEQUENCE IS PRG-COLL-SEQ.                  IF1284.2 18
   000017         001900 SPECIAL-NAMES.                                                   IF1284.2
   000018         002000     ALPHABET PRG-COLL-SEQ IS                                     IF1284.2
   000019         002100     STANDARD-2.                                                  IF1284.2
   000020         002200 INPUT-OUTPUT SECTION.                                            IF1284.2
   000021         002300 FILE-CONTROL.                                                    IF1284.2
   000022         002400     SELECT PRINT-FILE ASSIGN TO                                  IF1284.2 26
   000023         002500     XXXXX055.                                                    IF1284.2
   000024         002600 DATA DIVISION.                                                   IF1284.2
   000025         002700 FILE SECTION.                                                    IF1284.2
   000026         002800 FD  PRINT-FILE.                                                  IF1284.2

 ==000026==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000027         002900 01  PRINT-REC PICTURE X(120).                                    IF1284.2
   000028         003000 01  DUMMY-RECORD PICTURE X(120).                                 IF1284.2
   000029         003100 WORKING-STORAGE SECTION.                                         IF1284.2
   000030         003300* Variables specific to the Intrinsic Function Test IF128A*       IF1284.2
   000031         003500 01  A                   PIC S9(10)     VALUE 5.                  IF1284.2
   000032         003600 01  B                   PIC S9(10)     VALUE 7.                  IF1284.2
   000033         003700 01  C                   PIC S9(10)     VALUE 4.                  IF1284.2
   000034         003800 01  D                   PIC S9(10)     VALUE 10.                 IF1284.2
   000035         003900 01  I                   PIC X(4)       VALUE "R".                IF1284.2
   000036         004000 01  J                   PIC X(4)       VALUE "U".                IF1284.2
   000037         004100 01  P                   PIC S9(10)     VALUE 1.                  IF1284.2
   000038         004200 01  Q                   PIC S9(10)     VALUE 3.                  IF1284.2
   000039         004300 01  R                   PIC S9(10)     VALUE 5.                  IF1284.2
   000040         004400 01  ARG1                PIC S9(10)     VALUE 1.                  IF1284.2
   000041         004500 01  ARR                                VALUE "40537".            IF1284.2
   000042         004600     02 IND OCCURS 5 TIMES   PIC 9.                               IF1284.2
   000043         004700 01  TEMP                PIC S9(10).                              IF1284.2
   000044         004800 01  WS-INT              PIC S9(10).                              IF1284.2
   000045         004900*                                                                 IF1284.2
   000046         005100*                                                                 IF1284.2
   000047         005200 01  TEST-RESULTS.                                                IF1284.2
   000048         005300     02 FILLER                   PIC X      VALUE SPACE.          IF1284.2 IMP
   000049         005400     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1284.2 IMP
   000050         005500     02 FILLER                   PIC X      VALUE SPACE.          IF1284.2 IMP
   000051         005600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1284.2 IMP
   000052         005700     02 FILLER                   PIC X      VALUE SPACE.          IF1284.2 IMP
   000053         005800     02  PAR-NAME.                                                IF1284.2
   000054         005900       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1284.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000       03  PARDOT-X              PIC X      VALUE SPACE.          IF1284.2 IMP
   000056         006100       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1284.2 IMP
   000057         006200     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1284.2 IMP
   000058         006300     02 RE-MARK                  PIC X(61).                       IF1284.2
   000059         006400 01  TEST-COMPUTED.                                               IF1284.2
   000060         006500     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1284.2 IMP
   000061         006600     02 FILLER                   PIC X(17)  VALUE                 IF1284.2
   000062         006700            "       COMPUTED=".                                   IF1284.2
   000063         006800     02 COMPUTED-X.                                               IF1284.2
   000064         006900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1284.2 IMP
   000065         007000     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1284.2 64
   000066         007100                                 PIC -9(9).9(9).                  IF1284.2
   000067         007200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1284.2 64
   000068         007300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1284.2 64
   000069         007400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1284.2 64
   000070         007500     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1284.2 64
   000071         007600         04 COMPUTED-18V0                    PIC -9(18).          IF1284.2
   000072         007700         04 FILLER                           PIC X.               IF1284.2
   000073         007800     03 FILLER PIC X(50) VALUE SPACE.                             IF1284.2 IMP
   000074         007900 01  TEST-CORRECT.                                                IF1284.2
   000075         008000     02 FILLER PIC X(30) VALUE SPACE.                             IF1284.2 IMP
   000076         008100     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1284.2
   000077         008200     02 CORRECT-X.                                                IF1284.2
   000078         008300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1284.2 IMP
   000079         008400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1284.2 78
   000080         008500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1284.2 78
   000081         008600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1284.2 78
   000082         008700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1284.2 78
   000083         008800     03      CR-18V0 REDEFINES CORRECT-A.                         IF1284.2 78
   000084         008900         04 CORRECT-18V0                     PIC -9(18).          IF1284.2
   000085         009000         04 FILLER                           PIC X.               IF1284.2
   000086         009100     03 FILLER PIC X(2) VALUE SPACE.                              IF1284.2 IMP
   000087         009200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1284.2 IMP
   000088         009300 01  TEST-CORRECT-MIN.                                            IF1284.2
   000089         009400     02 FILLER PIC X(30) VALUE SPACE.                             IF1284.2 IMP
   000090         009500     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1284.2
   000091         009600     02 CORRECTMI-X.                                              IF1284.2
   000092         009700     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1284.2 IMP
   000093         009800     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1284.2 92
   000094         009900     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1284.2 92
   000095         010000     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1284.2 92
   000096         010100     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1284.2 92
   000097         010200     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1284.2 92
   000098         010300         04 CORRECTMI-18V0                     PIC -9(18).        IF1284.2
   000099         010400         04 FILLER                           PIC X.               IF1284.2
   000100         010500     03 FILLER PIC X(2) VALUE SPACE.                              IF1284.2 IMP
   000101         010600     03 FILLER                           PIC X(48) VALUE SPACE.   IF1284.2 IMP
   000102         010700 01  TEST-CORRECT-MAX.                                            IF1284.2
   000103         010800     02 FILLER PIC X(30) VALUE SPACE.                             IF1284.2 IMP
   000104         010900     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1284.2
   000105         011000     02 CORRECTMA-X.                                              IF1284.2
   000106         011100     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1284.2 IMP
   000107         011200     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1284.2 106
   000108         011300     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1284.2 106
   000109         011400     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1284.2 106
   000110         011500     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1284.2 106
   000111         011600     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1284.2 106
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700         04 CORRECTMA-18V0                     PIC -9(18).        IF1284.2
   000113         011800         04 FILLER                           PIC X.               IF1284.2
   000114         011900     03 FILLER PIC X(2) VALUE SPACE.                              IF1284.2 IMP
   000115         012000     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1284.2 IMP
   000116         012100 01  CCVS-C-1.                                                    IF1284.2
   000117         012200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1284.2
   000118         012300-    "SS  PARAGRAPH-NAME                                          IF1284.2
   000119         012400-    "       REMARKS".                                            IF1284.2
   000120         012500     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1284.2 IMP
   000121         012600 01  CCVS-C-2.                                                    IF1284.2
   000122         012700     02 FILLER                     PIC X        VALUE SPACE.      IF1284.2 IMP
   000123         012800     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1284.2
   000124         012900     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1284.2 IMP
   000125         013000     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1284.2
   000126         013100     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1284.2 IMP
   000127         013200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1284.2 IMP
   000128         013300 01  REC-CT                        PIC 99       VALUE ZERO.       IF1284.2 IMP
   000129         013400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1284.2 IMP
   000130         013500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1284.2 IMP
   000131         013600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1284.2 IMP
   000132         013700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1284.2 IMP
   000133         013800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1284.2 IMP
   000134         013900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1284.2 IMP
   000135         014000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1284.2 IMP
   000136         014100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1284.2 IMP
   000137         014200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1284.2 IMP
   000138         014300 01  CCVS-H-1.                                                    IF1284.2
   000139         014400     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1284.2 IMP
   000140         014500     02  FILLER                    PIC X(42)    VALUE             IF1284.2
   000141         014600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1284.2
   000142         014700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1284.2 IMP
   000143         014800 01  CCVS-H-2A.                                                   IF1284.2
   000144         014900   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1284.2 IMP
   000145         015000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1284.2
   000146         015100   02  FILLER                        PIC XXXX   VALUE             IF1284.2
   000147         015200     "4.2 ".                                                      IF1284.2
   000148         015300   02  FILLER                        PIC X(28)  VALUE             IF1284.2
   000149         015400            " COPY - NOT FOR DISTRIBUTION".                       IF1284.2
   000150         015500   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1284.2 IMP
   000151         015600                                                                  IF1284.2
   000152         015700 01  CCVS-H-2B.                                                   IF1284.2
   000153         015800   02  FILLER                        PIC X(15)  VALUE             IF1284.2
   000154         015900            "TEST RESULT OF ".                                    IF1284.2
   000155         016000   02  TEST-ID                       PIC X(9).                    IF1284.2
   000156         016100   02  FILLER                        PIC X(4)   VALUE             IF1284.2
   000157         016200            " IN ".                                               IF1284.2
   000158         016300   02  FILLER                        PIC X(12)  VALUE             IF1284.2
   000159         016400     " HIGH       ".                                              IF1284.2
   000160         016500   02  FILLER                        PIC X(22)  VALUE             IF1284.2
   000161         016600            " LEVEL VALIDATION FOR ".                             IF1284.2
   000162         016700   02  FILLER                        PIC X(58)  VALUE             IF1284.2
   000163         016800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1284.2
   000164         016900 01  CCVS-H-3.                                                    IF1284.2
   000165         017000     02  FILLER                      PIC X(34)  VALUE             IF1284.2
   000166         017100            " FOR OFFICIAL USE ONLY    ".                         IF1284.2
   000167         017200     02  FILLER                      PIC X(58)  VALUE             IF1284.2
   000168         017300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1284.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     02  FILLER                      PIC X(28)  VALUE             IF1284.2
   000170         017500            "  COPYRIGHT   1985 ".                                IF1284.2
   000171         017600 01  CCVS-E-1.                                                    IF1284.2
   000172         017700     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1284.2 IMP
   000173         017800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1284.2
   000174         017900     02 ID-AGAIN                     PIC X(9).                    IF1284.2
   000175         018000     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1284.2 IMP
   000176         018100 01  CCVS-E-2.                                                    IF1284.2
   000177         018200     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1284.2 IMP
   000178         018300     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1284.2 IMP
   000179         018400     02 CCVS-E-2-2.                                               IF1284.2
   000180         018500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1284.2 IMP
   000181         018600         03 FILLER                   PIC X      VALUE SPACE.      IF1284.2 IMP
   000182         018700         03 ENDER-DESC               PIC X(44)  VALUE             IF1284.2
   000183         018800            "ERRORS ENCOUNTERED".                                 IF1284.2
   000184         018900 01  CCVS-E-3.                                                    IF1284.2
   000185         019000     02  FILLER                      PIC X(22)  VALUE             IF1284.2
   000186         019100            " FOR OFFICIAL USE ONLY".                             IF1284.2
   000187         019200     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1284.2 IMP
   000188         019300     02  FILLER                      PIC X(58)  VALUE             IF1284.2
   000189         019400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1284.2
   000190         019500     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1284.2 IMP
   000191         019600     02 FILLER                       PIC X(15)  VALUE             IF1284.2
   000192         019700             " COPYRIGHT 1985".                                   IF1284.2
   000193         019800 01  CCVS-E-4.                                                    IF1284.2
   000194         019900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1284.2 IMP
   000195         020000     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1284.2
   000196         020100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1284.2 IMP
   000197         020200     02 FILLER                       PIC X(40)  VALUE             IF1284.2
   000198         020300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1284.2
   000199         020400 01  XXINFO.                                                      IF1284.2
   000200         020500     02 FILLER                       PIC X(19)  VALUE             IF1284.2
   000201         020600            "*** INFORMATION ***".                                IF1284.2
   000202         020700     02 INFO-TEXT.                                                IF1284.2
   000203         020800       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1284.2 IMP
   000204         020900       04 XXCOMPUTED                 PIC X(20).                   IF1284.2
   000205         021000       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1284.2 IMP
   000206         021100       04 XXCORRECT                  PIC X(20).                   IF1284.2
   000207         021200     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1284.2
   000208         021300 01  HYPHEN-LINE.                                                 IF1284.2
   000209         021400     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1284.2 IMP
   000210         021500     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1284.2
   000211         021600-    "*****************************************".                 IF1284.2
   000212         021700     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1284.2
   000213         021800-    "******************************".                            IF1284.2
   000214         021900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1284.2
   000215         022000     "IF128A".                                                    IF1284.2
   000216         022100 PROCEDURE DIVISION.                                              IF1284.2
   000217         022200 CCVS1 SECTION.                                                   IF1284.2
   000218         022300 OPEN-FILES.                                                      IF1284.2
   000219         022400     OPEN     OUTPUT PRINT-FILE.                                  IF1284.2 26
   000220         022500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1284.2 214 155 214 174
   000221         022600     MOVE    SPACE TO TEST-RESULTS.                               IF1284.2 IMP 47
   000222         022700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1284.2 245 250
   000223         022800     GO TO CCVS1-EXIT.                                            IF1284.2 338
   000224         022900 CLOSE-FILES.                                                     IF1284.2
   000225         023000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1284.2 254 274 26
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 TERMINATE-CCVS.                                                  IF1284.2
   000227         023200     STOP     RUN.                                                IF1284.2
   000228         023300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1284.2 51 131
   000229         023400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1284.2 51 132
   000230         023500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1284.2 51 130
   000231         023600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1284.2 51 129
   000232         023700     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1284.2 58
   000233         023800 PRINT-DETAIL.                                                    IF1284.2
   000234         023900     IF REC-CT NOT EQUAL TO ZERO                                  IF1284.2 128 IMP
   000235      1  024000             MOVE "." TO PARDOT-X                                 IF1284.2 55
   000236      1  024100             MOVE REC-CT TO DOTVALUE.                             IF1284.2 128 56
   000237         024200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1284.2 47 27 286
   000238         024300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1284.2 51 286
   000239      1  024400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1284.2 307 327
   000240      1  024500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1284.2 328 337
   000241         024600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1284.2 IMP 51 IMP 63
   000242         024700     MOVE SPACE TO CORRECT-X.                                     IF1284.2 IMP 77
   000243         024800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1284.2 128 IMP IMP 53
   000244         024900     MOVE     SPACE TO RE-MARK.                                   IF1284.2 IMP 58
   000245         025000 HEAD-ROUTINE.                                                    IF1284.2
   000246         025100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1284.2 138 28 286
   000247         025200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1284.2 143 28 286
   000248         025300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1284.2 152 28 286
   000249         025400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1284.2 164 28 286
   000250         025500 COLUMN-NAMES-ROUTINE.                                            IF1284.2
   000251         025600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1284.2 116 28 286
   000252         025700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1284.2 121 28 286
   000253         025800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1284.2 208 28 286
   000254         025900 END-ROUTINE.                                                     IF1284.2
   000255         026000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1284.2 208 28 286
   000256         026100 END-RTN-EXIT.                                                    IF1284.2
   000257         026200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1284.2 171 28 286
   000258         026300 END-ROUTINE-1.                                                   IF1284.2
   000259         026400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1284.2 130 134 131
   000260         026500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1284.2 134 129 134
   000261         026600      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1284.2 132 134
   000262         026700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1284.2 132 194
   000263         026800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1284.2 134 196
   000264         026900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1284.2 193 179
   000265         027000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1284.2 176 28 286
   000266         027100  END-ROUTINE-12.                                                 IF1284.2
   000267         027200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1284.2 182
   000268         027300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1284.2 130 IMP
   000269      1  027400         MOVE "NO " TO ERROR-TOTAL                                IF1284.2 180
   000270         027500         ELSE                                                     IF1284.2
   000271      1  027600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1284.2 130 180
   000272         027700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1284.2 176 28
   000273         027800     PERFORM WRITE-LINE.                                          IF1284.2 286
   000274         027900 END-ROUTINE-13.                                                  IF1284.2
   000275         028000     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1284.2 129 IMP
   000276      1  028100         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1284.2 180
   000277      1  028200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1284.2 129 180
   000278         028300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1284.2 182
   000279         028400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1284.2 176 28 286
   000280         028500      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1284.2 131 IMP
   000281      1  028600          MOVE "NO " TO ERROR-TOTAL                               IF1284.2 180
   000282      1  028700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1284.2 131 180
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1284.2 182
   000284         028900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1284.2 176 28 286
   000285         029000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1284.2 184 28 286
   000286         029100 WRITE-LINE.                                                      IF1284.2
   000287         029200     ADD 1 TO RECORD-COUNT.                                       IF1284.2 136
   000288         029300     IF RECORD-COUNT GREATER 42                                   IF1284.2 136
   000289      1  029400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1284.2 28 135
   000290      1  029500         MOVE SPACE TO DUMMY-RECORD                               IF1284.2 IMP 28
   000291      1  029600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1284.2 28
   000292      1  029700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1284.2 138 28 302
   000293      1  029800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1284.2 143 28 302
   000294      1  029900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1284.2 152 28 302
   000295      1  030000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1284.2 164 28 302
   000296      1  030100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1284.2 116 28 302
   000297      1  030200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1284.2 121 28 302
   000298      1  030300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1284.2 208 28 302
   000299      1  030400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1284.2 135 28
   000300      1  030500         MOVE ZERO TO RECORD-COUNT.                               IF1284.2 IMP 136
   000301         030600     PERFORM WRT-LN.                                              IF1284.2 302
   000302         030700 WRT-LN.                                                          IF1284.2
   000303         030800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1284.2 28
   000304         030900     MOVE SPACE TO DUMMY-RECORD.                                  IF1284.2 IMP 28
   000305         031000 BLANK-LINE-PRINT.                                                IF1284.2
   000306         031100     PERFORM WRT-LN.                                              IF1284.2 302
   000307         031200 FAIL-ROUTINE.                                                    IF1284.2
   000308         031300     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1284.2 63 IMP
   000309      1  031400            GO TO FAIL-ROUTINE-WRITE.                             IF1284.2 316
   000310         031500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1284.2 77 IMP 316
   000311         031600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1284.2 137 207
   000312         031700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1284.2 202
   000313         031800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1284.2 199 28 286
   000314         031900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1284.2 IMP 207
   000315         032000     GO TO  FAIL-ROUTINE-EX.                                      IF1284.2 327
   000316         032100 FAIL-ROUTINE-WRITE.                                              IF1284.2
   000317         032200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1284.2 59 27 286
   000318         032300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1284.2 137 87
   000319         032400                              CORMA-ANSI-REFERENCE.               IF1284.2 115
   000320         032500     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1284.2 93 IMP
   000321      1  032600           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1284.2 88 27 286
   000322      1  032700           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1284.2 102 27 286
   000323         032800     ELSE                                                         IF1284.2
   000324      1  032900           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1284.2 74 27 286
   000325         033000     PERFORM WRITE-LINE.                                          IF1284.2 286
   000326         033100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1284.2 IMP 87
   000327         033200 FAIL-ROUTINE-EX. EXIT.                                           IF1284.2
   000328         033300 BAIL-OUT.                                                        IF1284.2
   000329         033400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1284.2 64 IMP 331
   000330         033500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1284.2 78 IMP 337
   000331         033600 BAIL-OUT-WRITE.                                                  IF1284.2
   000332         033700     MOVE CORRECT-A TO XXCORRECT.                                 IF1284.2 78 206
   000333         033800     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1284.2 64 204
   000334         033900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1284.2 137 207
   000335         034000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1284.2 199 28 286
   000336         034100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1284.2 IMP 207
   000337         034200 BAIL-OUT-EX. EXIT.                                               IF1284.2
   000338         034300 CCVS1-EXIT.                                                      IF1284.2
   000339         034400     EXIT.                                                        IF1284.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034600*                                                      *          IF1284.2
   000341         034700*    Intrinsic Function Tests         IF128A - ORD-MAX *          IF1284.2
   000342         034800*                                                      *          IF1284.2
   000343         035000 SECT-IF128A SECTION.                                             IF1284.2
   000344         035100 F-ORD-MAX-INFO.                                                  IF1284.2
   000345         035200     MOVE     "See ref. A-61 2.32" TO ANSI-REFERENCE.             IF1284.2 137
   000346         035300     MOVE     "ORD-MAX Function"     TO FEATURE.                  IF1284.2 49
   000347         035500 F-ORD-MAX-01.                                                    IF1284.2
   000348         035600     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000349         035700 F-ORD-MAX-TEST-01.                                               IF1284.2
   000350         035800     COMPUTE WS-INT = FUNCTION ORD-MAX(5, 3, 2, 8, 3, 1).         IF1284.2 44 IFN
   000351         035900     IF WS-INT = 4 THEN                                           IF1284.2 44
   000352      1  036000                        PERFORM PASS                              IF1284.2 229
   000353         036100     ELSE                                                         IF1284.2
   000354      1  036200                        MOVE 4  TO CORRECT-N                      IF1284.2 79
   000355      1  036300                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000356      1  036400                        PERFORM FAIL.                             IF1284.2 230
   000357         036500     GO TO F-ORD-MAX-WRITE-01.                                    IF1284.2 361
   000358         036600 F-ORD-MAX-DELETE-01.                                             IF1284.2
   000359         036700     PERFORM  DE-LETE.                                            IF1284.2 231
   000360         036800     GO TO    F-ORD-MAX-WRITE-01.                                 IF1284.2 361
   000361         036900 F-ORD-MAX-WRITE-01.                                              IF1284.2
   000362         037000     MOVE "F-ORD-MAX-01" TO PAR-NAME.                             IF1284.2 53
   000363         037100     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000364         037300 F-ORD-MAX-TEST-02.                                               IF1284.2
   000365         037400     EVALUATE FUNCTION ORD-MAX(3, 2, 7, 1, 5)                     IF1284.2 IFN
   000366         037500     WHEN 3                                                       IF1284.2
   000367      1  037600                                 PERFORM PASS                     IF1284.2 229
   000368      1  037700                                 GO TO F-ORD-MAX-WRITE-02.        IF1284.2 374
   000369         037800     PERFORM FAIL.                                                IF1284.2 230
   000370         037900     GO TO F-ORD-MAX-WRITE-02.                                    IF1284.2 374
   000371         038000 F-ORD-MAX-DELETE-02.                                             IF1284.2
   000372         038100     PERFORM  DE-LETE.                                            IF1284.2 231
   000373         038200     GO TO    F-ORD-MAX-WRITE-02.                                 IF1284.2 374
   000374         038300 F-ORD-MAX-WRITE-02.                                              IF1284.2
   000375         038400     MOVE "F-ORD-MAX-02" TO PAR-NAME.                             IF1284.2 53
   000376         038500     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000377         038700 F-ORD-MAX-03.                                                    IF1284.2
   000378         038800     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000379         038900 F-ORD-MAX-TEST-03.                                               IF1284.2
   000380         039000     IF FUNCTION ORD-MAX(A, B, D) = 3 THEN                        IF1284.2 IFN 31 32 34
   000381      1  039100                        PERFORM PASS                              IF1284.2 229
   000382         039200     ELSE                                                         IF1284.2
   000383      1  039300                        PERFORM FAIL.                             IF1284.2 230
   000384         039400     GO TO F-ORD-MAX-WRITE-03.                                    IF1284.2 388
   000385         039500 F-ORD-MAX-DELETE-03.                                             IF1284.2
   000386         039600     PERFORM  DE-LETE.                                            IF1284.2 231
   000387         039700     GO TO    F-ORD-MAX-WRITE-03.                                 IF1284.2 388
   000388         039800 F-ORD-MAX-WRITE-03.                                              IF1284.2
   000389         039900     MOVE "F-ORD-MAX-03" TO PAR-NAME.                             IF1284.2 53
   000390         040000     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000391         040200 F-ORD-MAX-04.                                                    IF1284.2
   000392         040300     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000393         040400 F-ORD-MAX-TEST-04.                                               IF1284.2
   000394         040500     COMPUTE WS-INT = FUNCTION ORD-MAX(A, B, C).                  IF1284.2 44 IFN 31 32 33
   000395         040600     IF WS-INT = 2 THEN                                           IF1284.2 44
   000396      1  040700                        PERFORM PASS                              IF1284.2 229
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800     ELSE                                                         IF1284.2
   000398      1  040900                        MOVE 2   TO CORRECT-N                     IF1284.2 79
   000399      1  041000                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000400      1  041100                        PERFORM FAIL.                             IF1284.2 230
   000401         041200     GO TO F-ORD-MAX-WRITE-04.                                    IF1284.2 405
   000402         041300 F-ORD-MAX-DELETE-04.                                             IF1284.2
   000403         041400     PERFORM  DE-LETE.                                            IF1284.2 231
   000404         041500     GO TO    F-ORD-MAX-WRITE-04.                                 IF1284.2 405
   000405         041600 F-ORD-MAX-WRITE-04.                                              IF1284.2
   000406         041700     MOVE "F-ORD-MAX-04" TO PAR-NAME.                             IF1284.2 53
   000407         041800     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000408         042000 F-ORD-MAX-05.                                                    IF1284.2
   000409         042100     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000410         042200 F-ORD-MAX-TEST-05.                                               IF1284.2
   000411         042300     COMPUTE WS-INT = FUNCTION ORD-MAX(A, 4, B, 7, C, 9).         IF1284.2 44 IFN 31 32 33
   000412         042400     IF WS-INT = 6 THEN                                           IF1284.2 44
   000413      1  042500                        PERFORM PASS                              IF1284.2 229
   000414         042600     ELSE                                                         IF1284.2
   000415      1  042700                        MOVE 6    TO CORRECT-N                    IF1284.2 79
   000416      1  042800                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000417      1  042900                        PERFORM FAIL.                             IF1284.2 230
   000418         043000     GO TO F-ORD-MAX-WRITE-05.                                    IF1284.2 422
   000419         043100 F-ORD-MAX-DELETE-05.                                             IF1284.2
   000420         043200     PERFORM  DE-LETE.                                            IF1284.2 231
   000421         043300     GO TO    F-ORD-MAX-WRITE-05.                                 IF1284.2 422
   000422         043400 F-ORD-MAX-WRITE-05.                                              IF1284.2
   000423         043500     MOVE "F-ORD-MAX-05" TO PAR-NAME.                             IF1284.2 53
   000424         043600     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000425         043800 F-ORD-MAX-06.                                                    IF1284.2
   000426         043900     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000427         044000 F-ORD-MAX-TEST-06.                                               IF1284.2
   000428         044100     COMPUTE WS-INT = FUNCTION ORD-MAX(4, 9, A, 3).               IF1284.2 44 IFN 31
   000429         044200     IF WS-INT = 2 THEN                                           IF1284.2 44
   000430      1  044300                        PERFORM PASS                              IF1284.2 229
   000431         044400     ELSE                                                         IF1284.2
   000432      1  044500                        MOVE 2   TO CORRECT-N                     IF1284.2 79
   000433      1  044600                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000434      1  044700                        PERFORM FAIL.                             IF1284.2 230
   000435         044800     GO TO F-ORD-MAX-WRITE-06.                                    IF1284.2 439
   000436         044900 F-ORD-MAX-DELETE-06.                                             IF1284.2
   000437         045000     PERFORM  DE-LETE.                                            IF1284.2 231
   000438         045100     GO TO    F-ORD-MAX-WRITE-06.                                 IF1284.2 439
   000439         045200 F-ORD-MAX-WRITE-06.                                              IF1284.2
   000440         045300     MOVE "F-ORD-MAX-06" TO PAR-NAME.                             IF1284.2 53
   000441         045400     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000442         045600 F-ORD-MAX-07.                                                    IF1284.2
   000443         045700     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000444         045800 F-ORD-MAX-TEST-07.                                               IF1284.2
   000445         045900     COMPUTE WS-INT = FUNCTION ORD-MAX("A", I, "P").              IF1284.2 44 IFN 35
   000446         046000     IF WS-INT = 2 THEN                                           IF1284.2 44
   000447      1  046100                        PERFORM PASS                              IF1284.2 229
   000448         046200     ELSE                                                         IF1284.2
   000449      1  046300                        MOVE 2    TO CORRECT-N                    IF1284.2 79
   000450      1  046400                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000451      1  046500                        PERFORM FAIL.                             IF1284.2 230
   000452         046600     GO TO F-ORD-MAX-WRITE-07.                                    IF1284.2 456
   000453         046700 F-ORD-MAX-DELETE-07.                                             IF1284.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046800     PERFORM  DE-LETE.                                            IF1284.2 231
   000455         046900     GO TO    F-ORD-MAX-WRITE-07.                                 IF1284.2 456
   000456         047000 F-ORD-MAX-WRITE-07.                                              IF1284.2
   000457         047100     MOVE "F-ORD-MAX-07" TO PAR-NAME.                             IF1284.2 53
   000458         047200     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000459         047400 F-ORD-MAX-08.                                                    IF1284.2
   000460         047500     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000461         047600 F-ORD-MAX-TEST-08.                                               IF1284.2
   000462         047700     COMPUTE WS-INT = FUNCTION ORD-MAX("S", "D", J).              IF1284.2 44 IFN 36
   000463         047800     IF WS-INT = 3 THEN                                           IF1284.2 44
   000464      1  047900                        PERFORM PASS                              IF1284.2 229
   000465         048000     ELSE                                                         IF1284.2
   000466      1  048100                        MOVE 3    TO CORRECT-N                    IF1284.2 79
   000467      1  048200                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000468      1  048300                        PERFORM FAIL.                             IF1284.2 230
   000469         048400     GO TO F-ORD-MAX-WRITE-08.                                    IF1284.2 473
   000470         048500 F-ORD-MAX-DELETE-08.                                             IF1284.2
   000471         048600     PERFORM  DE-LETE.                                            IF1284.2 231
   000472         048700     GO TO    F-ORD-MAX-WRITE-08.                                 IF1284.2 473
   000473         048800 F-ORD-MAX-WRITE-08.                                              IF1284.2
   000474         048900     MOVE "F-ORD-MAX-08" TO PAR-NAME.                             IF1284.2 53
   000475         049000     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000476         049200 F-ORD-MAX-09.                                                    IF1284.2
   000477         049300     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000478         049400 F-ORD-MAX-TEST-09.                                               IF1284.2
   000479         049500     COMPUTE WS-INT = FUNCTION ORD-MAX(A, 5, 5, A).               IF1284.2 44 IFN 31 31
   000480         049600     IF WS-INT = 1 THEN                                           IF1284.2 44
   000481      1  049700                        PERFORM PASS                              IF1284.2 229
   000482         049800     ELSE                                                         IF1284.2
   000483      1  049900                        MOVE 1   TO CORRECT-N                     IF1284.2 79
   000484      1  050000                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000485      1  050100                        PERFORM FAIL.                             IF1284.2 230
   000486         050200     GO TO F-ORD-MAX-WRITE-09.                                    IF1284.2 490
   000487         050300 F-ORD-MAX-DELETE-09.                                             IF1284.2
   000488         050400     PERFORM  DE-LETE.                                            IF1284.2 231
   000489         050500     GO TO    F-ORD-MAX-WRITE-09.                                 IF1284.2 490
   000490         050600 F-ORD-MAX-WRITE-09.                                              IF1284.2
   000491         050700     MOVE "F-ORD-MAX-09" TO PAR-NAME.                             IF1284.2 53
   000492         050800     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000493         051000 F-ORD-MAX-10.                                                    IF1284.2
   000494         051100     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000495         051200 F-ORD-MAX-TEST-10.                                               IF1284.2
   000496         051300     COMPUTE WS-INT = FUNCTION ORD-MAX(IND(1), IND(2), IND(3)).   IF1284.2 44 IFN 42 42 42
   000497         051400     IF WS-INT = 3 THEN                                           IF1284.2 44
   000498      1  051500                        PERFORM PASS                              IF1284.2 229
   000499         051600     ELSE                                                         IF1284.2
   000500      1  051700                        MOVE 3    TO CORRECT-N                    IF1284.2 79
   000501      1  051800                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000502      1  051900                        PERFORM FAIL.                             IF1284.2 230
   000503         052000     GO TO F-ORD-MAX-WRITE-10.                                    IF1284.2 507
   000504         052100 F-ORD-MAX-DELETE-10.                                             IF1284.2
   000505         052200     PERFORM  DE-LETE.                                            IF1284.2 231
   000506         052300     GO TO    F-ORD-MAX-WRITE-10.                                 IF1284.2 507
   000507         052400 F-ORD-MAX-WRITE-10.                                              IF1284.2
   000508         052500     MOVE "F-ORD-MAX-10" TO PAR-NAME.                             IF1284.2 53
   000509         052600     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000510         052800 F-ORD-MAX-11.                                                    IF1284.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052900     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000512         053000 F-ORD-MAX-TEST-11.                                               IF1284.2
   000513         053100     COMPUTE WS-INT = FUNCTION ORD-MAX(IND(R), IND(P), IND(Q)).   IF1284.2 44 IFN 42 39 42 37 42 38
   000514         053200     IF WS-INT = 1 THEN                                           IF1284.2 44
   000515      1  053300                        PERFORM PASS                              IF1284.2 229
   000516         053400     ELSE                                                         IF1284.2
   000517      1  053500                        MOVE 1   TO CORRECT-N                     IF1284.2 79
   000518      1  053600                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000519      1  053700                        PERFORM FAIL.                             IF1284.2 230
   000520         053800     GO TO F-ORD-MAX-WRITE-11.                                    IF1284.2 524
   000521         053900 F-ORD-MAX-DELETE-11.                                             IF1284.2
   000522         054000     PERFORM  DE-LETE.                                            IF1284.2 231
   000523         054100     GO TO    F-ORD-MAX-WRITE-11.                                 IF1284.2 524
   000524         054200 F-ORD-MAX-WRITE-11.                                              IF1284.2
   000525         054300     MOVE "F-ORD-MAX-11" TO PAR-NAME.                             IF1284.2 53
   000526         054400     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000527         054600 F-ORD-MAX-12.                                                    IF1284.2
   000528         054700     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000529         054800 F-ORD-MAX-TEST-12.                                               IF1284.2
   000530         054900     COMPUTE WS-INT = FUNCTION ORD-MAX(IND(ALL)).                 IF1284.2 44 IFN 42
   000531         055000     IF WS-INT = 5 THEN                                           IF1284.2 44
   000532      1  055100                        PERFORM PASS                              IF1284.2 229
   000533         055200     ELSE                                                         IF1284.2
   000534      1  055300                        MOVE 5    TO CORRECT-N                    IF1284.2 79
   000535      1  055400                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000536      1  055500                        PERFORM FAIL.                             IF1284.2 230
   000537         055600     GO TO F-ORD-MAX-WRITE-12.                                    IF1284.2 541
   000538         055700 F-ORD-MAX-DELETE-12.                                             IF1284.2
   000539         055800     PERFORM  DE-LETE.                                            IF1284.2 231
   000540         055900     GO TO    F-ORD-MAX-WRITE-12.                                 IF1284.2 541
   000541         056000 F-ORD-MAX-WRITE-12.                                              IF1284.2
   000542         056100     MOVE "F-ORD-MAX-12" TO PAR-NAME.                             IF1284.2 53
   000543         056200     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000544         056400 F-ORD-MAX-13.                                                    IF1284.2
   000545         056500     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000546         056600 F-ORD-MAX-TEST-13.                                               IF1284.2
   000547         056700     COMPUTE WS-INT = FUNCTION ORD-MAX(                           IF1284.2 44 IFN
   000548         056800                           FUNCTION ORD-MAX(1, 4), 3, 1).         IF1284.2 IFN
   000549         056900     IF WS-INT = 2 THEN                                           IF1284.2 44
   000550      1  057000                        PERFORM PASS                              IF1284.2 229
   000551         057100     ELSE                                                         IF1284.2
   000552      1  057200                        MOVE 2    TO CORRECT-N                    IF1284.2 79
   000553      1  057300                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000554      1  057400                        PERFORM FAIL.                             IF1284.2 230
   000555         057500     GO TO F-ORD-MAX-WRITE-13.                                    IF1284.2 559
   000556         057600 F-ORD-MAX-DELETE-13.                                             IF1284.2
   000557         057700     PERFORM  DE-LETE.                                            IF1284.2 231
   000558         057800     GO TO    F-ORD-MAX-WRITE-13.                                 IF1284.2 559
   000559         057900 F-ORD-MAX-WRITE-13.                                              IF1284.2
   000560         058000     MOVE "F-ORD-MAX-13" TO PAR-NAME.                             IF1284.2 53
   000561         058100     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000562         058300 F-ORD-MAX-14.                                                    IF1284.2
   000563         058400     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000564         058500 F-ORD-MAX-TEST-14.                                               IF1284.2
   000565         058600     COMPUTE WS-INT = FUNCTION ORD-MAX(2, 3, C) + A.              IF1284.2 44 IFN 33 31
   000566         058700     IF WS-INT = 8 THEN                                           IF1284.2 44
   000567      1  058800                        PERFORM PASS                              IF1284.2 229
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058900     ELSE                                                         IF1284.2
   000569      1  059000                        MOVE 8    TO CORRECT-N                    IF1284.2 79
   000570      1  059100                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000571      1  059200                        PERFORM FAIL.                             IF1284.2 230
   000572         059300     GO TO F-ORD-MAX-WRITE-14.                                    IF1284.2 576
   000573         059400 F-ORD-MAX-DELETE-14.                                             IF1284.2
   000574         059500     PERFORM  DE-LETE.                                            IF1284.2 231
   000575         059600     GO TO    F-ORD-MAX-WRITE-14.                                 IF1284.2 576
   000576         059700 F-ORD-MAX-WRITE-14.                                              IF1284.2
   000577         059800     MOVE "F-ORD-MAX-14" TO PAR-NAME.                             IF1284.2 53
   000578         059900     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000579         060100 F-ORD-MAX-15.                                                    IF1284.2
   000580         060200     MOVE ZERO TO WS-INT.                                         IF1284.2 IMP 44
   000581         060300 F-ORD-MAX-TEST-15.                                               IF1284.2
   000582         060400     COMPUTE WS-INT = FUNCTION ORD-MAX(2, 3, A) +                 IF1284.2 44 IFN 31
   000583         060500                      FUNCTION ORD-MAX(1, 1).                     IF1284.2 IFN
   000584         060600     IF WS-INT = 4 THEN                                           IF1284.2 44
   000585      1  060700                        PERFORM PASS                              IF1284.2 229
   000586         060800     ELSE                                                         IF1284.2
   000587      1  060900                        MOVE 4   TO CORRECT-N                     IF1284.2 79
   000588      1  061000                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000589      1  061100                        PERFORM FAIL.                             IF1284.2 230
   000590         061200     GO TO F-ORD-MAX-WRITE-15.                                    IF1284.2 594
   000591         061300 F-ORD-MAX-DELETE-15.                                             IF1284.2
   000592         061400     PERFORM  DE-LETE.                                            IF1284.2 231
   000593         061500     GO TO    F-ORD-MAX-WRITE-15.                                 IF1284.2 594
   000594         061600 F-ORD-MAX-WRITE-15.                                              IF1284.2
   000595         061700     MOVE "F-ORD-MAX-15" TO PAR-NAME.                             IF1284.2 53
   000596         061800     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000597         062000 F-ORD-MAX-16.                                                    IF1284.2
   000598         062100     MOVE 1 TO ARG1                                               IF1284.2 40
   000599         062200     PERFORM F-ORD-MAX-TEST-16                                    IF1284.2 611
   000600         062300         UNTIL FUNCTION ORD-MAX (5, ARG1) = 2.                    IF1284.2 IFN 40
   000601         062400*                                                                 IF1284.2
   000602         062600*                                                                 IF1284.2
   000603         062700     IF ARG1 = 6 THEN                                             IF1284.2 40
   000604      1  062800                        PERFORM PASS                              IF1284.2 229
   000605         062900     ELSE                                                         IF1284.2
   000606      1  063000                        MOVE 6 TO CORRECT-N                       IF1284.2 79
   000607      1  063100                        MOVE WS-INT TO COMPUTED-N                 IF1284.2 44 65
   000608      1  063200                        PERFORM FAIL.                             IF1284.2 230
   000609         063300     GO TO F-ORD-MAX-WRITE-16.                                    IF1284.2 617
   000610         063400*                                                                 IF1284.2
   000611         063500 F-ORD-MAX-TEST-16.                                               IF1284.2
   000612         063600     COMPUTE ARG1 = ARG1 + 1.                                     IF1284.2 40 40
   000613         063700*                                                                 IF1284.2
   000614         063800 F-ORD-MAX-DELETE-16.                                             IF1284.2
   000615         063900     PERFORM  DE-LETE.                                            IF1284.2 231
   000616         064000     GO TO    F-ORD-MAX-WRITE-16.                                 IF1284.2 617
   000617         064100 F-ORD-MAX-WRITE-16.                                              IF1284.2
   000618         064200     MOVE "F-ORD-MAX-16" TO PAR-NAME.                             IF1284.2 53
   000619         064300     PERFORM  PRINT-DETAIL.                                       IF1284.2 233
   000620         064500 CCVS-EXIT SECTION.                                               IF1284.2
   000621         064600 CCVS-999999.                                                     IF1284.2
   000622         064700     GO TO CLOSE-FILES.                                           IF1284.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    14
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       31   A. . . . . . . . . . . . . . .  380 394 411 428 479 479 565 582
      137   ANSI-REFERENCE . . . . . . . .  311 318 334 M345
       40   ARG1 . . . . . . . . . . . . .  M598 600 603 M612 612
       41   ARR
       32   B. . . . . . . . . . . . . . .  380 394 411
       33   C. . . . . . . . . . . . . . .  394 411 565
      116   CCVS-C-1 . . . . . . . . . . .  251 296
      121   CCVS-C-2 . . . . . . . . . . .  252 297
      171   CCVS-E-1 . . . . . . . . . . .  257
      176   CCVS-E-2 . . . . . . . . . . .  265 272 279 284
      179   CCVS-E-2-2 . . . . . . . . . .  M264
      184   CCVS-E-3 . . . . . . . . . . .  285
      193   CCVS-E-4 . . . . . . . . . . .  264
      194   CCVS-E-4-1 . . . . . . . . . .  M262
      196   CCVS-E-4-2 . . . . . . . . . .  M263
      138   CCVS-H-1 . . . . . . . . . . .  246 292
      143   CCVS-H-2A. . . . . . . . . . .  247 293
      152   CCVS-H-2B. . . . . . . . . . .  248 294
      164   CCVS-H-3 . . . . . . . . . . .  249 295
      214   CCVS-PGM-ID. . . . . . . . . .  220 220
       70   CM-18V0
       64   COMPUTED-A . . . . . . . . . .  65 67 68 69 70 329 333
       65   COMPUTED-N . . . . . . . . . .  M355 M399 M416 M433 M450 M467 M484 M501 M518 M535 M553 M570 M588 M607
       63   COMPUTED-X . . . . . . . . . .  M241 308
       67   COMPUTED-0V18
       69   COMPUTED-14V4
       71   COMPUTED-18V0
       68   COMPUTED-4V14
       87   COR-ANSI-REFERENCE . . . . . .  M318 M326
      115   CORMA-ANSI-REFERENCE . . . . .  M319
       78   CORRECT-A. . . . . . . . . . .  79 80 81 82 83 330 332
      107   CORRECT-MAX
       93   CORRECT-MIN. . . . . . . . . .  320
       79   CORRECT-N. . . . . . . . . . .  M354 M398 M415 M432 M449 M466 M483 M500 M517 M534 M552 M569 M587 M606
       77   CORRECT-X. . . . . . . . . . .  M242 310
       80   CORRECT-0V18
       82   CORRECT-14V4
       84   CORRECT-18V0
       81   CORRECT-4V14
      106   CORRECTMA-A. . . . . . . . . .  107 108 109 110 111
      105   CORRECTMA-X
      108   CORRECTMA-0V18
      110   CORRECTMA-14V4
      112   CORRECTMA-18V0
      109   CORRECTMA-4V14
       92   CORRECTMI-A. . . . . . . . . .  93 94 95 96 97
       91   CORRECTMI-X
       94   CORRECTMI-0V18
       96   CORRECTMI-14V4
       98   CORRECTMI-18V0
       95   CORRECTMI-4V14
       83   CR-18V0
       97   CR-18V0
      111   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    15
0 Defined   Cross-reference of data names   References

0      34   D. . . . . . . . . . . . . . .  380
      129   DELETE-COUNTER . . . . . . . .  M231 260 275 277
       56   DOTVALUE . . . . . . . . . . .  M236
      135   DUMMY-HOLD . . . . . . . . . .  M289 299
       28   DUMMY-RECORD . . . . . . . . .  M246 M247 M248 M249 M251 M252 M253 M255 M257 M265 M272 M279 M284 M285 289 M290
                                            291 M292 M293 M294 M295 M296 M297 M298 M299 303 M304 M313 M335
      182   ENDER-DESC . . . . . . . . . .  M267 M278 M283
      130   ERROR-COUNTER. . . . . . . . .  M230 259 268 271
      134   ERROR-HOLD . . . . . . . . . .  M259 M260 M260 M261 263
      180   ERROR-TOTAL. . . . . . . . . .  M269 M271 M276 M277 M281 M282
       49   FEATURE. . . . . . . . . . . .  M346
      208   HYPHEN-LINE. . . . . . . . . .  253 255 298
       35   I. . . . . . . . . . . . . . .  445
      174   ID-AGAIN . . . . . . . . . . .  M220
       42   IND. . . . . . . . . . . . . .  496 496 496 513 513 513 530
      207   INF-ANSI-REFERENCE . . . . . .  M311 M314 M334 M336
      202   INFO-TEXT. . . . . . . . . . .  M312
      131   INSPECT-COUNTER. . . . . . . .  M228 259 280 282
       36   J. . . . . . . . . . . . . . .  462
       37   P. . . . . . . . . . . . . . .  513
       51   P-OR-F . . . . . . . . . . . .  M228 M229 M230 M231 238 M241
       53   PAR-NAME . . . . . . . . . . .  M243 M362 M375 M389 M406 M423 M440 M457 M474 M491 M508 M525 M542 M560 M577 M595
                                            M618
       55   PARDOT-X . . . . . . . . . . .  M235
      132   PASS-COUNTER . . . . . . . . .  M229 261 262
       18   PRG-COLL-SEQ . . . . . . . . .  16
       26   PRINT-FILE . . . . . . . . . .  22 219 225
       27   PRINT-REC. . . . . . . . . . .  M237 M317 M321 M322 M324
       38   Q. . . . . . . . . . . . . . .  513
       39   R. . . . . . . . . . . . . . .  513
       58   RE-MARK. . . . . . . . . . . .  M232 M244
      128   REC-CT . . . . . . . . . . . .  234 236 243
      127   REC-SKL-SUB
      136   RECORD-COUNT . . . . . . . . .  M287 288 M300
       43   TEMP
       59   TEST-COMPUTED. . . . . . . . .  317
       74   TEST-CORRECT . . . . . . . . .  324
      102   TEST-CORRECT-MAX . . . . . . .  322
       88   TEST-CORRECT-MIN . . . . . . .  321
      155   TEST-ID. . . . . . . . . . . .  M220
       47   TEST-RESULTS . . . . . . . . .  M221 237
      133   TOTAL-ERROR
       44   WS-INT . . . . . . . . . . . .  M348 M350 351 355 M378 M392 M394 395 399 M409 M411 412 416 M426 M428 429 433
                                            M443 M445 446 450 M460 M462 463 467 M477 M479 480 484 M494 M496 497 501 M511
                                            M513 514 518 M528 M530 531 535 M545 M547 549 553 M563 M565 566 570 M580 M582
                                            584 588 607
      204   XXCOMPUTED . . . . . . . . . .  M333
      206   XXCORRECT. . . . . . . . . . .  M332
      199   XXINFO . . . . . . . . . . . .  313 335
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    16
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

      328   BAIL-OUT . . . . . . . . . . .  P240
      337   BAIL-OUT-EX. . . . . . . . . .  E240 G330
      331   BAIL-OUT-WRITE . . . . . . . .  G329
      305   BLANK-LINE-PRINT
      620   CCVS-EXIT
      621   CCVS-999999
      217   CCVS1
      338   CCVS1-EXIT . . . . . . . . . .  G223
      224   CLOSE-FILES. . . . . . . . . .  G622
      250   COLUMN-NAMES-ROUTINE . . . . .  E222
      231   DE-LETE. . . . . . . . . . . .  P359 P372 P386 P403 P420 P437 P454 P471 P488 P505 P522 P539 P557 P574 P592 P615
      254   END-ROUTINE. . . . . . . . . .  P225
      258   END-ROUTINE-1
      266   END-ROUTINE-12
      274   END-ROUTINE-13 . . . . . . . .  E225
      256   END-RTN-EXIT
      358   F-ORD-MAX-DELETE-01
      371   F-ORD-MAX-DELETE-02
      385   F-ORD-MAX-DELETE-03
      402   F-ORD-MAX-DELETE-04
      419   F-ORD-MAX-DELETE-05
      436   F-ORD-MAX-DELETE-06
      453   F-ORD-MAX-DELETE-07
      470   F-ORD-MAX-DELETE-08
      487   F-ORD-MAX-DELETE-09
      504   F-ORD-MAX-DELETE-10
      521   F-ORD-MAX-DELETE-11
      538   F-ORD-MAX-DELETE-12
      556   F-ORD-MAX-DELETE-13
      573   F-ORD-MAX-DELETE-14
      591   F-ORD-MAX-DELETE-15
      614   F-ORD-MAX-DELETE-16
      344   F-ORD-MAX-INFO
      349   F-ORD-MAX-TEST-01
      364   F-ORD-MAX-TEST-02
      379   F-ORD-MAX-TEST-03
      393   F-ORD-MAX-TEST-04
      410   F-ORD-MAX-TEST-05
      427   F-ORD-MAX-TEST-06
      444   F-ORD-MAX-TEST-07
      461   F-ORD-MAX-TEST-08
      478   F-ORD-MAX-TEST-09
      495   F-ORD-MAX-TEST-10
      512   F-ORD-MAX-TEST-11
      529   F-ORD-MAX-TEST-12
      546   F-ORD-MAX-TEST-13
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    17
0 Defined   Cross-reference of procedures   References

0     564   F-ORD-MAX-TEST-14
      581   F-ORD-MAX-TEST-15
      611   F-ORD-MAX-TEST-16. . . . . . .  P599
      361   F-ORD-MAX-WRITE-01 . . . . . .  G357 G360
      374   F-ORD-MAX-WRITE-02 . . . . . .  G368 G370 G373
      388   F-ORD-MAX-WRITE-03 . . . . . .  G384 G387
      405   F-ORD-MAX-WRITE-04 . . . . . .  G401 G404
      422   F-ORD-MAX-WRITE-05 . . . . . .  G418 G421
      439   F-ORD-MAX-WRITE-06 . . . . . .  G435 G438
      456   F-ORD-MAX-WRITE-07 . . . . . .  G452 G455
      473   F-ORD-MAX-WRITE-08 . . . . . .  G469 G472
      490   F-ORD-MAX-WRITE-09 . . . . . .  G486 G489
      507   F-ORD-MAX-WRITE-10 . . . . . .  G503 G506
      524   F-ORD-MAX-WRITE-11 . . . . . .  G520 G523
      541   F-ORD-MAX-WRITE-12 . . . . . .  G537 G540
      559   F-ORD-MAX-WRITE-13 . . . . . .  G555 G558
      576   F-ORD-MAX-WRITE-14 . . . . . .  G572 G575
      594   F-ORD-MAX-WRITE-15 . . . . . .  G590 G593
      617   F-ORD-MAX-WRITE-16 . . . . . .  G609 G616
      347   F-ORD-MAX-01
      377   F-ORD-MAX-03
      391   F-ORD-MAX-04
      408   F-ORD-MAX-05
      425   F-ORD-MAX-06
      442   F-ORD-MAX-07
      459   F-ORD-MAX-08
      476   F-ORD-MAX-09
      493   F-ORD-MAX-10
      510   F-ORD-MAX-11
      527   F-ORD-MAX-12
      544   F-ORD-MAX-13
      562   F-ORD-MAX-14
      579   F-ORD-MAX-15
      597   F-ORD-MAX-16
      230   FAIL . . . . . . . . . . . . .  P356 P369 P383 P400 P417 P434 P451 P468 P485 P502 P519 P536 P554 P571 P589 P608
      307   FAIL-ROUTINE . . . . . . . . .  P239
      327   FAIL-ROUTINE-EX. . . . . . . .  E239 G315
      316   FAIL-ROUTINE-WRITE . . . . . .  G309 G310
      245   HEAD-ROUTINE . . . . . . . . .  P222
      228   INSPT
      218   OPEN-FILES
      229   PASS . . . . . . . . . . . . .  P352 P367 P381 P396 P413 P430 P447 P464 P481 P498 P515 P532 P550 P567 P585 P604
      233   PRINT-DETAIL . . . . . . . . .  P363 P376 P390 P407 P424 P441 P458 P475 P492 P509 P526 P543 P561 P578 P596 P619
      343   SECT-IF128A
      226   TERMINATE-CCVS
      286   WRITE-LINE . . . . . . . . . .  P237 P238 P246 P247 P248 P249 P251 P252 P253 P255 P257 P265 P273 P279 P284 P285
                                            P313 P317 P321 P322 P324 P325 P335
      302   WRT-LN . . . . . . . . . . . .  P292 P293 P294 P295 P296 P297 P298 P301 P306
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    18
0 Defined   Cross-reference of programs     References

        3   IF128A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF128A    Date 06/04/2022  Time 11:59:12   Page    19
0LineID  Message code  Message text

     26  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF128A:
 *    Source records = 622
 *    Data Division statements = 96
 *    Procedure Division statements = 330
 *    Generated COBOL statements = 0
 *    Program complexity factor = 340
0End of compilation 1,  program IF128A,  highest severity 0.
0Return code 0
