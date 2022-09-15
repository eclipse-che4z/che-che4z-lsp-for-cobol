1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:18   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:18   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1054.2
   000002         000200 PROGRAM-ID.                                                      IF1054.2
   000003         000300     IF105A.                                                      IF1054.2
   000004         000400                                                                  IF1054.2
   000005         000600*                                                         *       IF1054.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1054.2
   000007         000800* It contains tests for the Intrinsic Function CHAR.      *       IF1054.2
   000008         000900*                                                         *       IF1054.2
   000009         001000*                                                         *       IF1054.2
   000010         001200 ENVIRONMENT DIVISION.                                            IF1054.2
   000011         001300 CONFIGURATION SECTION.                                           IF1054.2
   000012         001400 SOURCE-COMPUTER.                                                 IF1054.2
   000013         001500     XXXXX082.                                                    IF1054.2
   000014         001600 OBJECT-COMPUTER.                                                 IF1054.2
   000015         001700     XXXXX083                                                     IF1054.2
   000016         001800     PROGRAM COLLATING SEQUENCE IS PRG-COLL-SEQ.                  IF1054.2 18
   000017         001900 SPECIAL-NAMES.                                                   IF1054.2
   000018         002000     ALPHABET PRG-COLL-SEQ IS                                     IF1054.2
   000019         002100     STANDARD-2.                                                  IF1054.2
   000020         002200 INPUT-OUTPUT SECTION.                                            IF1054.2
   000021         002300 FILE-CONTROL.                                                    IF1054.2
   000022         002400     SELECT PRINT-FILE ASSIGN TO                                  IF1054.2 26
   000023         002500     XXXXX055.                                                    IF1054.2
   000024         002600 DATA DIVISION.                                                   IF1054.2
   000025         002700 FILE SECTION.                                                    IF1054.2
   000026         002800 FD  PRINT-FILE.                                                  IF1054.2

 ==000026==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000027         002900 01  PRINT-REC PICTURE X(120).                                    IF1054.2
   000028         003000 01  DUMMY-RECORD PICTURE X(120).                                 IF1054.2
   000029         003100 WORKING-STORAGE SECTION.                                         IF1054.2
   000030         003300* Variables specific to the Intrinsic Function Test IF105A*       IF1054.2
   000031         003500 01  B                   PIC S9(10)     VALUE 37.                 IF1054.2
   000032         003600 01  C                   PIC S9(10)     VALUE 2.                  IF1054.2
   000033         003700 01  D                   PIC S9(10)     VALUE 100.                IF1054.2
   000034         003800 01  ARR                 VALUE "066037100070044".                 IF1054.2
   000035         003900     02 IND OCCURS 5 TIMES PIC 9(3).                              IF1054.2
   000036         004000 01  TEMP                PIC S9(5)V9(5).                          IF1054.2
   000037         004100 01  WS-ANUM          PIC X.                                      IF1054.2
   000038         004200*                                                                 IF1054.2
   000039         004400*                                                                 IF1054.2
   000040         004500 01  TEST-RESULTS.                                                IF1054.2
   000041         004600     02 FILLER                   PIC X      VALUE SPACE.          IF1054.2 IMP
   000042         004700     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1054.2 IMP
   000043         004800     02 FILLER                   PIC X      VALUE SPACE.          IF1054.2 IMP
   000044         004900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1054.2 IMP
   000045         005000     02 FILLER                   PIC X      VALUE SPACE.          IF1054.2 IMP
   000046         005100     02  PAR-NAME.                                                IF1054.2
   000047         005200       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1054.2 IMP
   000048         005300       03  PARDOT-X              PIC X      VALUE SPACE.          IF1054.2 IMP
   000049         005400       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1054.2 IMP
   000050         005500     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1054.2 IMP
   000051         005600     02 RE-MARK                  PIC X(61).                       IF1054.2
   000052         005700 01  TEST-COMPUTED.                                               IF1054.2
   000053         005800     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1054.2 IMP
   000054         005900     02 FILLER                   PIC X(17)  VALUE                 IF1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000            "       COMPUTED=".                                   IF1054.2
   000056         006100     02 COMPUTED-X.                                               IF1054.2
   000057         006200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1054.2 IMP
   000058         006300     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1054.2 57
   000059         006400                                 PIC -9(9).9(9).                  IF1054.2
   000060         006500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1054.2 57
   000061         006600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1054.2 57
   000062         006700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1054.2 57
   000063         006800     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1054.2 57
   000064         006900         04 COMPUTED-18V0                    PIC -9(18).          IF1054.2
   000065         007000         04 FILLER                           PIC X.               IF1054.2
   000066         007100     03 FILLER PIC X(50) VALUE SPACE.                             IF1054.2 IMP
   000067         007200 01  TEST-CORRECT.                                                IF1054.2
   000068         007300     02 FILLER PIC X(30) VALUE SPACE.                             IF1054.2 IMP
   000069         007400     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1054.2
   000070         007500     02 CORRECT-X.                                                IF1054.2
   000071         007600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1054.2 IMP
   000072         007700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1054.2 71
   000073         007800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1054.2 71
   000074         007900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1054.2 71
   000075         008000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1054.2 71
   000076         008100     03      CR-18V0 REDEFINES CORRECT-A.                         IF1054.2 71
   000077         008200         04 CORRECT-18V0                     PIC -9(18).          IF1054.2
   000078         008300         04 FILLER                           PIC X.               IF1054.2
   000079         008400     03 FILLER PIC X(2) VALUE SPACE.                              IF1054.2 IMP
   000080         008500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1054.2 IMP
   000081         008600 01  TEST-CORRECT-MIN.                                            IF1054.2
   000082         008700     02 FILLER PIC X(30) VALUE SPACE.                             IF1054.2 IMP
   000083         008800     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1054.2
   000084         008900     02 CORRECTMI-X.                                              IF1054.2
   000085         009000     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1054.2 IMP
   000086         009100     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1054.2 85
   000087         009200     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1054.2 85
   000088         009300     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1054.2 85
   000089         009400     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1054.2 85
   000090         009500     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1054.2 85
   000091         009600         04 CORRECTMI-18V0                     PIC -9(18).        IF1054.2
   000092         009700         04 FILLER                           PIC X.               IF1054.2
   000093         009800     03 FILLER PIC X(2) VALUE SPACE.                              IF1054.2 IMP
   000094         009900     03 FILLER                           PIC X(48) VALUE SPACE.   IF1054.2 IMP
   000095         010000 01  TEST-CORRECT-MAX.                                            IF1054.2
   000096         010100     02 FILLER PIC X(30) VALUE SPACE.                             IF1054.2 IMP
   000097         010200     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1054.2
   000098         010300     02 CORRECTMA-X.                                              IF1054.2
   000099         010400     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1054.2 IMP
   000100         010500     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1054.2 99
   000101         010600     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1054.2 99
   000102         010700     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1054.2 99
   000103         010800     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1054.2 99
   000104         010900     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1054.2 99
   000105         011000         04 CORRECTMA-18V0                     PIC -9(18).        IF1054.2
   000106         011100         04 FILLER                           PIC X.               IF1054.2
   000107         011200     03 FILLER PIC X(2) VALUE SPACE.                              IF1054.2 IMP
   000108         011300     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1054.2 IMP
   000109         011400 01  CCVS-C-1.                                                    IF1054.2
   000110         011500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1054.2
   000111         011600-    "SS  PARAGRAPH-NAME                                          IF1054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700-    "       REMARKS".                                            IF1054.2
   000113         011800     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1054.2 IMP
   000114         011900 01  CCVS-C-2.                                                    IF1054.2
   000115         012000     02 FILLER                     PIC X        VALUE SPACE.      IF1054.2 IMP
   000116         012100     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1054.2
   000117         012200     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1054.2 IMP
   000118         012300     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1054.2
   000119         012400     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1054.2 IMP
   000120         012500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1054.2 IMP
   000121         012600 01  REC-CT                        PIC 99       VALUE ZERO.       IF1054.2 IMP
   000122         012700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1054.2 IMP
   000123         012800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1054.2 IMP
   000124         012900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1054.2 IMP
   000125         013000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1054.2 IMP
   000126         013100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1054.2 IMP
   000127         013200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1054.2 IMP
   000128         013300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1054.2 IMP
   000129         013400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1054.2 IMP
   000130         013500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1054.2 IMP
   000131         013600 01  CCVS-H-1.                                                    IF1054.2
   000132         013700     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1054.2 IMP
   000133         013800     02  FILLER                    PIC X(42)    VALUE             IF1054.2
   000134         013900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1054.2
   000135         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1054.2 IMP
   000136         014100 01  CCVS-H-2A.                                                   IF1054.2
   000137         014200   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1054.2 IMP
   000138         014300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1054.2
   000139         014400   02  FILLER                        PIC XXXX   VALUE             IF1054.2
   000140         014500     "4.2 ".                                                      IF1054.2
   000141         014600   02  FILLER                        PIC X(28)  VALUE             IF1054.2
   000142         014700            " COPY - NOT FOR DISTRIBUTION".                       IF1054.2
   000143         014800   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1054.2 IMP
   000144         014900                                                                  IF1054.2
   000145         015000 01  CCVS-H-2B.                                                   IF1054.2
   000146         015100   02  FILLER                        PIC X(15)  VALUE             IF1054.2
   000147         015200            "TEST RESULT OF ".                                    IF1054.2
   000148         015300   02  TEST-ID                       PIC X(9).                    IF1054.2
   000149         015400   02  FILLER                        PIC X(4)   VALUE             IF1054.2
   000150         015500            " IN ".                                               IF1054.2
   000151         015600   02  FILLER                        PIC X(12)  VALUE             IF1054.2
   000152         015700     " HIGH       ".                                              IF1054.2
   000153         015800   02  FILLER                        PIC X(22)  VALUE             IF1054.2
   000154         015900            " LEVEL VALIDATION FOR ".                             IF1054.2
   000155         016000   02  FILLER                        PIC X(58)  VALUE             IF1054.2
   000156         016100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1054.2
   000157         016200 01  CCVS-H-3.                                                    IF1054.2
   000158         016300     02  FILLER                      PIC X(34)  VALUE             IF1054.2
   000159         016400            " FOR OFFICIAL USE ONLY    ".                         IF1054.2
   000160         016500     02  FILLER                      PIC X(58)  VALUE             IF1054.2
   000161         016600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1054.2
   000162         016700     02  FILLER                      PIC X(28)  VALUE             IF1054.2
   000163         016800            "  COPYRIGHT   1985 ".                                IF1054.2
   000164         016900 01  CCVS-E-1.                                                    IF1054.2
   000165         017000     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1054.2 IMP
   000166         017100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1054.2
   000167         017200     02 ID-AGAIN                     PIC X(9).                    IF1054.2
   000168         017300     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1054.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400 01  CCVS-E-2.                                                    IF1054.2
   000170         017500     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1054.2 IMP
   000171         017600     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1054.2 IMP
   000172         017700     02 CCVS-E-2-2.                                               IF1054.2
   000173         017800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1054.2 IMP
   000174         017900         03 FILLER                   PIC X      VALUE SPACE.      IF1054.2 IMP
   000175         018000         03 ENDER-DESC               PIC X(44)  VALUE             IF1054.2
   000176         018100            "ERRORS ENCOUNTERED".                                 IF1054.2
   000177         018200 01  CCVS-E-3.                                                    IF1054.2
   000178         018300     02  FILLER                      PIC X(22)  VALUE             IF1054.2
   000179         018400            " FOR OFFICIAL USE ONLY".                             IF1054.2
   000180         018500     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1054.2 IMP
   000181         018600     02  FILLER                      PIC X(58)  VALUE             IF1054.2
   000182         018700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1054.2
   000183         018800     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1054.2 IMP
   000184         018900     02 FILLER                       PIC X(15)  VALUE             IF1054.2
   000185         019000             " COPYRIGHT 1985".                                   IF1054.2
   000186         019100 01  CCVS-E-4.                                                    IF1054.2
   000187         019200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1054.2 IMP
   000188         019300     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1054.2
   000189         019400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1054.2 IMP
   000190         019500     02 FILLER                       PIC X(40)  VALUE             IF1054.2
   000191         019600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1054.2
   000192         019700 01  XXINFO.                                                      IF1054.2
   000193         019800     02 FILLER                       PIC X(19)  VALUE             IF1054.2
   000194         019900            "*** INFORMATION ***".                                IF1054.2
   000195         020000     02 INFO-TEXT.                                                IF1054.2
   000196         020100       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1054.2 IMP
   000197         020200       04 XXCOMPUTED                 PIC X(20).                   IF1054.2
   000198         020300       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1054.2 IMP
   000199         020400       04 XXCORRECT                  PIC X(20).                   IF1054.2
   000200         020500     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1054.2
   000201         020600 01  HYPHEN-LINE.                                                 IF1054.2
   000202         020700     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1054.2 IMP
   000203         020800     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1054.2
   000204         020900-    "*****************************************".                 IF1054.2
   000205         021000     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1054.2
   000206         021100-    "******************************".                            IF1054.2
   000207         021200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1054.2
   000208         021300     "IF105A".                                                    IF1054.2
   000209         021400 PROCEDURE DIVISION.                                              IF1054.2
   000210         021500 CCVS1 SECTION.                                                   IF1054.2
   000211         021600 OPEN-FILES.                                                      IF1054.2
   000212         021700     OPEN     OUTPUT PRINT-FILE.                                  IF1054.2 26
   000213         021800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1054.2 207 148 207 167
   000214         021900     MOVE    SPACE TO TEST-RESULTS.                               IF1054.2 IMP 40
   000215         022000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1054.2 238 243
   000216         022100     GO TO CCVS1-EXIT.                                            IF1054.2 331
   000217         022200 CLOSE-FILES.                                                     IF1054.2
   000218         022300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1054.2 247 267 26
   000219         022400 TERMINATE-CCVS.                                                  IF1054.2
   000220         022500     STOP     RUN.                                                IF1054.2
   000221         022600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1054.2 44 124
   000222         022700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1054.2 44 125
   000223         022800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1054.2 44 123
   000224         022900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1054.2 44 122
   000225         023000     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1054.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 PRINT-DETAIL.                                                    IF1054.2
   000227         023200     IF REC-CT NOT EQUAL TO ZERO                                  IF1054.2 121 IMP
   000228      1  023300             MOVE "." TO PARDOT-X                                 IF1054.2 48
   000229      1  023400             MOVE REC-CT TO DOTVALUE.                             IF1054.2 121 49
   000230         023500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1054.2 40 27 279
   000231         023600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1054.2 44 279
   000232      1  023700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1054.2 300 320
   000233      1  023800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1054.2 321 330
   000234         023900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1054.2 IMP 44 IMP 56
   000235         024000     MOVE SPACE TO CORRECT-X.                                     IF1054.2 IMP 70
   000236         024100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1054.2 121 IMP IMP 46
   000237         024200     MOVE     SPACE TO RE-MARK.                                   IF1054.2 IMP 51
   000238         024300 HEAD-ROUTINE.                                                    IF1054.2
   000239         024400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1054.2 131 28 279
   000240         024500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1054.2 136 28 279
   000241         024600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1054.2 145 28 279
   000242         024700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1054.2 157 28 279
   000243         024800 COLUMN-NAMES-ROUTINE.                                            IF1054.2
   000244         024900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1054.2 109 28 279
   000245         025000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1054.2 114 28 279
   000246         025100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1054.2 201 28 279
   000247         025200 END-ROUTINE.                                                     IF1054.2
   000248         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1054.2 201 28 279
   000249         025400 END-RTN-EXIT.                                                    IF1054.2
   000250         025500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1054.2 164 28 279
   000251         025600 END-ROUTINE-1.                                                   IF1054.2
   000252         025700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1054.2 123 127 124
   000253         025800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1054.2 127 122 127
   000254         025900      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1054.2 125 127
   000255         026000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1054.2 125 187
   000256         026100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1054.2 127 189
   000257         026200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1054.2 186 172
   000258         026300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1054.2 169 28 279
   000259         026400  END-ROUTINE-12.                                                 IF1054.2
   000260         026500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1054.2 175
   000261         026600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1054.2 123 IMP
   000262      1  026700         MOVE "NO " TO ERROR-TOTAL                                IF1054.2 173
   000263         026800         ELSE                                                     IF1054.2
   000264      1  026900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1054.2 123 173
   000265         027000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1054.2 169 28
   000266         027100     PERFORM WRITE-LINE.                                          IF1054.2 279
   000267         027200 END-ROUTINE-13.                                                  IF1054.2
   000268         027300     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1054.2 122 IMP
   000269      1  027400         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1054.2 173
   000270      1  027500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1054.2 122 173
   000271         027600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1054.2 175
   000272         027700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1054.2 169 28 279
   000273         027800      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1054.2 124 IMP
   000274      1  027900          MOVE "NO " TO ERROR-TOTAL                               IF1054.2 173
   000275      1  028000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1054.2 124 173
   000276         028100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1054.2 175
   000277         028200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1054.2 169 28 279
   000278         028300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1054.2 177 28 279
   000279         028400 WRITE-LINE.                                                      IF1054.2
   000280         028500     ADD 1 TO RECORD-COUNT.                                       IF1054.2 129
   000281         028600     IF RECORD-COUNT GREATER 42                                   IF1054.2 129
   000282      1  028700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1054.2 28 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE SPACE TO DUMMY-RECORD                               IF1054.2 IMP 28
   000284      1  028900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1054.2 28
   000285      1  029000         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1054.2 131 28 295
   000286      1  029100         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1054.2 136 28 295
   000287      1  029200         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1054.2 145 28 295
   000288      1  029300         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1054.2 157 28 295
   000289      1  029400         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1054.2 109 28 295
   000290      1  029500         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1054.2 114 28 295
   000291      1  029600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1054.2 201 28 295
   000292      1  029700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1054.2 128 28
   000293      1  029800         MOVE ZERO TO RECORD-COUNT.                               IF1054.2 IMP 129
   000294         029900     PERFORM WRT-LN.                                              IF1054.2 295
   000295         030000 WRT-LN.                                                          IF1054.2
   000296         030100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1054.2 28
   000297         030200     MOVE SPACE TO DUMMY-RECORD.                                  IF1054.2 IMP 28
   000298         030300 BLANK-LINE-PRINT.                                                IF1054.2
   000299         030400     PERFORM WRT-LN.                                              IF1054.2 295
   000300         030500 FAIL-ROUTINE.                                                    IF1054.2
   000301         030600     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1054.2 56 IMP
   000302      1  030700            GO TO FAIL-ROUTINE-WRITE.                             IF1054.2 309
   000303         030800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1054.2 70 IMP 309
   000304         030900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1054.2 130 200
   000305         031000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1054.2 195
   000306         031100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1054.2 192 28 279
   000307         031200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1054.2 IMP 200
   000308         031300     GO TO  FAIL-ROUTINE-EX.                                      IF1054.2 320
   000309         031400 FAIL-ROUTINE-WRITE.                                              IF1054.2
   000310         031500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1054.2 52 27 279
   000311         031600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1054.2 130 80
   000312         031700                              CORMA-ANSI-REFERENCE.               IF1054.2 108
   000313         031800     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1054.2 86 IMP
   000314      1  031900           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1054.2 81 27 279
   000315      1  032000           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1054.2 95 27 279
   000316         032100     ELSE                                                         IF1054.2
   000317      1  032200           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1054.2 67 27 279
   000318         032300     PERFORM WRITE-LINE.                                          IF1054.2 279
   000319         032400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1054.2 IMP 80
   000320         032500 FAIL-ROUTINE-EX. EXIT.                                           IF1054.2
   000321         032600 BAIL-OUT.                                                        IF1054.2
   000322         032700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1054.2 57 IMP 324
   000323         032800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1054.2 71 IMP 330
   000324         032900 BAIL-OUT-WRITE.                                                  IF1054.2
   000325         033000     MOVE CORRECT-A TO XXCORRECT.                                 IF1054.2 71 199
   000326         033100     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1054.2 57 197
   000327         033200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1054.2 130 200
   000328         033300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1054.2 192 28 279
   000329         033400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1054.2 IMP 200
   000330         033500 BAIL-OUT-EX. EXIT.                                               IF1054.2
   000331         033600 CCVS1-EXIT.                                                      IF1054.2
   000332         033700     EXIT.                                                        IF1054.2
   000333         033900*                                                      *          IF1054.2
   000334         034000*    Intrinsic Function Tests         IF105A - CHAR    *          IF1054.2
   000335         034100*                                                      *          IF1054.2
   000336         034300 SECT-IF105A SECTION.                                             IF1054.2
   000337         034400 F-CHAR-INFO.                                                     IF1054.2
   000338         034500     MOVE     "See ref. A-37 2.9" TO ANSI-REFERENCE.              IF1054.2 130
   000339         034600     MOVE     "CHAR Function" TO FEATURE.                         IF1054.2 42
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034800 F-CHAR-01.                                                       IF1054.2
   000341         034900     MOVE SPACE TO WS-ANUM.                                       IF1054.2 IMP 37
   000342         035000 F-CHAR-TEST-01.                                                  IF1054.2
   000343         035100     MOVE FUNCTION CHAR(37) TO WS-ANUM.                           IF1054.2 IFN 37
   000344         035200     IF WS-ANUM = "$" THEN                                        IF1054.2 37
   000345      1  035300                        PERFORM PASS                              IF1054.2 222
   000346         035400     ELSE                                                         IF1054.2
   000347      1  035500                        MOVE  "$"  TO CORRECT-X                   IF1054.2 70
   000348      1  035600                        MOVE WS-ANUM TO COMPUTED-A                IF1054.2 37 57
   000349      1  035700                        PERFORM FAIL.                             IF1054.2 223
   000350         035800     GO TO F-CHAR-WRITE-01.                                       IF1054.2 354
   000351         035900 F-CHAR-DELETE-01.                                                IF1054.2
   000352         036000     PERFORM  DE-LETE.                                            IF1054.2 224
   000353         036100     GO TO    F-CHAR-WRITE-01.                                    IF1054.2 354
   000354         036200 F-CHAR-WRITE-01.                                                 IF1054.2
   000355         036300     MOVE "F-CHAR-01" TO PAR-NAME.                                IF1054.2 46
   000356         036400     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
   000357         036600 F-CHAR-TEST-02.                                                  IF1054.2
   000358         036700     IF FUNCTION CHAR(B) = "$" THEN                               IF1054.2 IFN 31
   000359      1  036800                                 PERFORM PASS                     IF1054.2 222
   000360         036900     ELSE                                                         IF1054.2
   000361      1  037000                                 PERFORM FAIL.                    IF1054.2 223
   000362         037100     GO TO F-CHAR-WRITE-02.                                       IF1054.2 366
   000363         037200 F-CHAR-DELETE-02.                                                IF1054.2
   000364         037300     PERFORM  DE-LETE.                                            IF1054.2 224
   000365         037400     GO TO    F-CHAR-WRITE-02.                                    IF1054.2 366
   000366         037500 F-CHAR-WRITE-02.                                                 IF1054.2
   000367         037600     MOVE "F-CHAR-02" TO PAR-NAME.                                IF1054.2 46
   000368         037700     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
   000369         037900 F-CHAR-03.                                                       IF1054.2
   000370         038000     MOVE SPACE TO WS-ANUM.                                       IF1054.2 IMP 37
   000371         038100 F-CHAR-TEST-03.                                                  IF1054.2
   000372         038200     MOVE FUNCTION CHAR(IND(5)) TO WS-ANUM.                       IF1054.2 IFN 35 37
   000373         038300     IF WS-ANUM = "+" THEN                                        IF1054.2 37
   000374      1  038400                        PERFORM PASS                              IF1054.2 222
   000375         038500     ELSE                                                         IF1054.2
   000376      1  038600                        MOVE  "+"  TO CORRECT-X                   IF1054.2 70
   000377      1  038700                        MOVE WS-ANUM TO COMPUTED-A                IF1054.2 37 57
   000378      1  038800                        PERFORM FAIL.                             IF1054.2 223
   000379         038900     GO TO F-CHAR-WRITE-03.                                       IF1054.2 383
   000380         039000 F-CHAR-DELETE-03.                                                IF1054.2
   000381         039100     PERFORM  DE-LETE.                                            IF1054.2 224
   000382         039200     GO TO    F-CHAR-WRITE-03.                                    IF1054.2 383
   000383         039300 F-CHAR-WRITE-03.                                                 IF1054.2
   000384         039400     MOVE "F-CHAR-03" TO PAR-NAME.                                IF1054.2 46
   000385         039500     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
   000386         039700 F-CHAR-04.                                                       IF1054.2
   000387         039800     MOVE SPACE TO WS-ANUM.                                       IF1054.2 IMP 37
   000388         039900 F-CHAR-TEST-04.                                                  IF1054.2
   000389         040000     MOVE FUNCTION CHAR(IND(C)) TO WS-ANUM.                       IF1054.2 IFN 35 32 37
   000390         040100     IF WS-ANUM = "$" THEN                                        IF1054.2 37
   000391      1  040200                        PERFORM PASS                              IF1054.2 222
   000392         040300     ELSE                                                         IF1054.2
   000393      1  040400                        MOVE  "$"  TO CORRECT-X                   IF1054.2 70
   000394      1  040500                        MOVE WS-ANUM TO COMPUTED-A                IF1054.2 37 57
   000395      1  040600                        PERFORM FAIL.                             IF1054.2 223
   000396         040700     GO TO F-CHAR-WRITE-04.                                       IF1054.2 400
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800 F-CHAR-DELETE-04.                                                IF1054.2
   000398         040900     PERFORM  DE-LETE.                                            IF1054.2 224
   000399         041000     GO TO    F-CHAR-WRITE-04.                                    IF1054.2 400
   000400         041100 F-CHAR-WRITE-04.                                                 IF1054.2
   000401         041200     MOVE "F-CHAR-04" TO PAR-NAME.                                IF1054.2 46
   000402         041300     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
   000403         041500 F-CHAR-05.                                                       IF1054.2
   000404         041600     MOVE SPACE TO WS-ANUM.                                       IF1054.2 IMP 37
   000405         041700 F-CHAR-TEST-05.                                                  IF1054.2
   000406         041800     MOVE FUNCTION CHAR(87) TO WS-ANUM.                           IF1054.2 IFN 37
   000407         041900     IF WS-ANUM = "V" THEN                                        IF1054.2 37
   000408      1  042000                        PERFORM PASS                              IF1054.2 222
   000409         042100     ELSE                                                         IF1054.2
   000410      1  042200                        MOVE  "V"  TO CORRECT-X                   IF1054.2 70
   000411      1  042300                        MOVE WS-ANUM TO COMPUTED-A                IF1054.2 37 57
   000412      1  042400                        PERFORM FAIL.                             IF1054.2 223
   000413         042500     GO TO F-CHAR-WRITE-05.                                       IF1054.2 417
   000414         042600 F-CHAR-DELETE-05.                                                IF1054.2
   000415         042700     PERFORM  DE-LETE.                                            IF1054.2 224
   000416         042800     GO TO    F-CHAR-WRITE-05.                                    IF1054.2 417
   000417         042900 F-CHAR-WRITE-05.                                                 IF1054.2
   000418         043000     MOVE "F-CHAR-05" TO PAR-NAME.                                IF1054.2 46
   000419         043100     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
   000420         043300 F-CHAR-06.                                                       IF1054.2
   000421         043400     MOVE SPACE TO WS-ANUM.                                       IF1054.2 IMP 37
   000422         043500 F-CHAR-TEST-06.                                                  IF1054.2
   000423         043600     MOVE FUNCTION CHAR(D) TO WS-ANUM.                            IF1054.2 IFN 33 37
   000424         043700     IF WS-ANUM = "c" THEN                                        IF1054.2 37
   000425      1  043800                        PERFORM PASS                              IF1054.2 222
   000426         043900     ELSE                                                         IF1054.2
   000427      1  044000                        MOVE  "c"  TO CORRECT-X                   IF1054.2 70
   000428      1  044100                        MOVE WS-ANUM TO COMPUTED-A                IF1054.2 37 57
   000429      1  044200                        PERFORM FAIL.                             IF1054.2 223
   000430         044300     GO TO F-CHAR-WRITE-06.                                       IF1054.2 434
   000431         044400 F-CHAR-DELETE-06.                                                IF1054.2
   000432         044500     PERFORM  DE-LETE.                                            IF1054.2 224
   000433         044600     GO TO    F-CHAR-WRITE-06.                                    IF1054.2 434
   000434         044700 F-CHAR-WRITE-06.                                                 IF1054.2
   000435         044800     MOVE "F-CHAR-06" TO PAR-NAME.                                IF1054.2 46
   000436         044900     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
   000437         045100 F-CHAR-07.                                                       IF1054.2
   000438         045200     MOVE SPACE TO WS-ANUM.                                       IF1054.2 IMP 37
   000439         045300 F-CHAR-TEST-07.                                                  IF1054.2
   000440         045400                                                                  IF1054.2
   000441         045500     IF FUNCTION ORD(FUNCTION CHAR(2)) = 2 THEN                   IF1054.2 IFN IFN
   000442      1  045600                        PERFORM PASS                              IF1054.2 222
   000443         045700     ELSE                                                         IF1054.2
   000444      1  045800                        MOVE  2  TO CORRECT-N                     IF1054.2 72
   000445      1  045900                        MOVE WS-ANUM TO COMPUTED-A                IF1054.2 37 57
   000446      1  046000                        PERFORM FAIL.                             IF1054.2 223
   000447         046100     GO TO F-CHAR-WRITE-07.                                       IF1054.2 451
   000448         046200 F-CHAR-DELETE-07.                                                IF1054.2
   000449         046300     PERFORM  DE-LETE.                                            IF1054.2 224
   000450         046400     GO TO    F-CHAR-WRITE-07.                                    IF1054.2 451
   000451         046500 F-CHAR-WRITE-07.                                                 IF1054.2
   000452         046600     MOVE "F-CHAR-07" TO PAR-NAME.                                IF1054.2 46
   000453         046700     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046900 F-CHAR-08.                                                       IF1054.2
   000455         047000     MOVE SPACE TO WS-ANUM.                                       IF1054.2 IMP 37
   000456         047100 F-CHAR-TEST-08.                                                  IF1054.2
   000457         047200     IF FUNCTION ORD(FUNCTION CHAR(4)) +                          IF1054.2 IFN IFN
   000458         047300        FUNCTION ORD(FUNCTION CHAR(7)) = 11 THEN                  IF1054.2 IFN IFN
   000459      1  047400                        PERFORM PASS                              IF1054.2 222
   000460         047500     ELSE                                                         IF1054.2
   000461      1  047600                        PERFORM FAIL.                             IF1054.2 223
   000462         047700     GO TO F-CHAR-WRITE-08.                                       IF1054.2 466
   000463         047800 F-CHAR-DELETE-08.                                                IF1054.2
   000464         047900     PERFORM  DE-LETE.                                            IF1054.2 224
   000465         048000     GO TO    F-CHAR-WRITE-08.                                    IF1054.2 466
   000466         048100 F-CHAR-WRITE-08.                                                 IF1054.2
   000467         048200     MOVE "F-CHAR-08" TO PAR-NAME.                                IF1054.2 46
   000468         048300     PERFORM  PRINT-DETAIL.                                       IF1054.2 226
   000469         048500 CCVS-EXIT SECTION.                                               IF1054.2
   000470         048600 CCVS-999999.                                                     IF1054.2
   000471         048700     GO TO CLOSE-FILES.                                           IF1054.2 217
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      130   ANSI-REFERENCE . . . . . . . .  304 311 327 M338
       34   ARR
       31   B. . . . . . . . . . . . . . .  358
       32   C. . . . . . . . . . . . . . .  389
      109   CCVS-C-1 . . . . . . . . . . .  244 289
      114   CCVS-C-2 . . . . . . . . . . .  245 290
      164   CCVS-E-1 . . . . . . . . . . .  250
      169   CCVS-E-2 . . . . . . . . . . .  258 265 272 277
      172   CCVS-E-2-2 . . . . . . . . . .  M257
      177   CCVS-E-3 . . . . . . . . . . .  278
      186   CCVS-E-4 . . . . . . . . . . .  257
      187   CCVS-E-4-1 . . . . . . . . . .  M255
      189   CCVS-E-4-2 . . . . . . . . . .  M256
      131   CCVS-H-1 . . . . . . . . . . .  239 285
      136   CCVS-H-2A. . . . . . . . . . .  240 286
      145   CCVS-H-2B. . . . . . . . . . .  241 287
      157   CCVS-H-3 . . . . . . . . . . .  242 288
      207   CCVS-PGM-ID. . . . . . . . . .  213 213
       63   CM-18V0
       57   COMPUTED-A . . . . . . . . . .  58 60 61 62 63 322 326 M348 M377 M394 M411 M428 M445
       58   COMPUTED-N
       56   COMPUTED-X . . . . . . . . . .  M234 301
       60   COMPUTED-0V18
       62   COMPUTED-14V4
       64   COMPUTED-18V0
       61   COMPUTED-4V14
       80   COR-ANSI-REFERENCE . . . . . .  M311 M319
      108   CORMA-ANSI-REFERENCE . . . . .  M312
       71   CORRECT-A. . . . . . . . . . .  72 73 74 75 76 323 325
      100   CORRECT-MAX
       86   CORRECT-MIN. . . . . . . . . .  313
       72   CORRECT-N. . . . . . . . . . .  M444
       70   CORRECT-X. . . . . . . . . . .  M235 303 M347 M376 M393 M410 M427
       73   CORRECT-0V18
       75   CORRECT-14V4
       77   CORRECT-18V0
       74   CORRECT-4V14
       99   CORRECTMA-A. . . . . . . . . .  100 101 102 103 104
       98   CORRECTMA-X
      101   CORRECTMA-0V18
      103   CORRECTMA-14V4
      105   CORRECTMA-18V0
      102   CORRECTMA-4V14
       85   CORRECTMI-A. . . . . . . . . .  86 87 88 89 90
       84   CORRECTMI-X
       87   CORRECTMI-0V18
       89   CORRECTMI-14V4
       91   CORRECTMI-18V0
       88   CORRECTMI-4V14
       76   CR-18V0
       90   CR-18V0
      104   CR-18V0
       33   D. . . . . . . . . . . . . . .  423
      122   DELETE-COUNTER . . . . . . . .  M224 253 268 270
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    13
0 Defined   Cross-reference of data names   References

0      49   DOTVALUE . . . . . . . . . . .  M229
      128   DUMMY-HOLD . . . . . . . . . .  M282 292
       28   DUMMY-RECORD . . . . . . . . .  M239 M240 M241 M242 M244 M245 M246 M248 M250 M258 M265 M272 M277 M278 282 M283
                                            284 M285 M286 M287 M288 M289 M290 M291 M292 296 M297 M306 M328
      175   ENDER-DESC . . . . . . . . . .  M260 M271 M276
      123   ERROR-COUNTER. . . . . . . . .  M223 252 261 264
      127   ERROR-HOLD . . . . . . . . . .  M252 M253 M253 M254 256
      173   ERROR-TOTAL. . . . . . . . . .  M262 M264 M269 M270 M274 M275
       42   FEATURE. . . . . . . . . . . .  M339
      201   HYPHEN-LINE. . . . . . . . . .  246 248 291
      167   ID-AGAIN . . . . . . . . . . .  M213
       35   IND. . . . . . . . . . . . . .  372 389
      200   INF-ANSI-REFERENCE . . . . . .  M304 M307 M327 M329
      195   INFO-TEXT. . . . . . . . . . .  M305
      124   INSPECT-COUNTER. . . . . . . .  M221 252 273 275
       44   P-OR-F . . . . . . . . . . . .  M221 M222 M223 M224 231 M234
       46   PAR-NAME . . . . . . . . . . .  M236 M355 M367 M384 M401 M418 M435 M452 M467
       48   PARDOT-X . . . . . . . . . . .  M228
      125   PASS-COUNTER . . . . . . . . .  M222 254 255
       18   PRG-COLL-SEQ . . . . . . . . .  16
       26   PRINT-FILE . . . . . . . . . .  22 212 218
       27   PRINT-REC. . . . . . . . . . .  M230 M310 M314 M315 M317
       51   RE-MARK. . . . . . . . . . . .  M225 M237
      121   REC-CT . . . . . . . . . . . .  227 229 236
      120   REC-SKL-SUB
      129   RECORD-COUNT . . . . . . . . .  M280 281 M293
       36   TEMP
       52   TEST-COMPUTED. . . . . . . . .  310
       67   TEST-CORRECT . . . . . . . . .  317
       95   TEST-CORRECT-MAX . . . . . . .  315
       81   TEST-CORRECT-MIN . . . . . . .  314
      148   TEST-ID. . . . . . . . . . . .  M213
       40   TEST-RESULTS . . . . . . . . .  M214 230
      126   TOTAL-ERROR
       37   WS-ANUM. . . . . . . . . . . .  M341 M343 344 348 M370 M372 373 377 M387 M389 390 394 M404 M406 407 411 M421
                                            M423 424 428 M438 445 M455
      197   XXCOMPUTED . . . . . . . . . .  M326
      199   XXCORRECT. . . . . . . . . . .  M325
      192   XXINFO . . . . . . . . . . . .  306 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    14
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

      321   BAIL-OUT . . . . . . . . . . .  P233
      330   BAIL-OUT-EX. . . . . . . . . .  E233 G323
      324   BAIL-OUT-WRITE . . . . . . . .  G322
      298   BLANK-LINE-PRINT
      469   CCVS-EXIT
      470   CCVS-999999
      210   CCVS1
      331   CCVS1-EXIT . . . . . . . . . .  G216
      217   CLOSE-FILES. . . . . . . . . .  G471
      243   COLUMN-NAMES-ROUTINE . . . . .  E215
      224   DE-LETE. . . . . . . . . . . .  P352 P364 P381 P398 P415 P432 P449 P464
      247   END-ROUTINE. . . . . . . . . .  P218
      251   END-ROUTINE-1
      259   END-ROUTINE-12
      267   END-ROUTINE-13 . . . . . . . .  E218
      249   END-RTN-EXIT
      351   F-CHAR-DELETE-01
      363   F-CHAR-DELETE-02
      380   F-CHAR-DELETE-03
      397   F-CHAR-DELETE-04
      414   F-CHAR-DELETE-05
      431   F-CHAR-DELETE-06
      448   F-CHAR-DELETE-07
      463   F-CHAR-DELETE-08
      337   F-CHAR-INFO
      342   F-CHAR-TEST-01
      357   F-CHAR-TEST-02
      371   F-CHAR-TEST-03
      388   F-CHAR-TEST-04
      405   F-CHAR-TEST-05
      422   F-CHAR-TEST-06
      439   F-CHAR-TEST-07
      456   F-CHAR-TEST-08
      354   F-CHAR-WRITE-01. . . . . . . .  G350 G353
      366   F-CHAR-WRITE-02. . . . . . . .  G362 G365
      383   F-CHAR-WRITE-03. . . . . . . .  G379 G382
      400   F-CHAR-WRITE-04. . . . . . . .  G396 G399
      417   F-CHAR-WRITE-05. . . . . . . .  G413 G416
      434   F-CHAR-WRITE-06. . . . . . . .  G430 G433
      451   F-CHAR-WRITE-07. . . . . . . .  G447 G450
      466   F-CHAR-WRITE-08. . . . . . . .  G462 G465
      340   F-CHAR-01
      369   F-CHAR-03
      386   F-CHAR-04
      403   F-CHAR-05
      420   F-CHAR-06
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    15
0 Defined   Cross-reference of procedures   References

0     437   F-CHAR-07
      454   F-CHAR-08
      223   FAIL . . . . . . . . . . . . .  P349 P361 P378 P395 P412 P429 P446 P461
      300   FAIL-ROUTINE . . . . . . . . .  P232
      320   FAIL-ROUTINE-EX. . . . . . . .  E232 G308
      309   FAIL-ROUTINE-WRITE . . . . . .  G302 G303
      238   HEAD-ROUTINE . . . . . . . . .  P215
      221   INSPT
      211   OPEN-FILES
      222   PASS . . . . . . . . . . . . .  P345 P359 P374 P391 P408 P425 P442 P459
      226   PRINT-DETAIL . . . . . . . . .  P356 P368 P385 P402 P419 P436 P453 P468
      336   SECT-IF105A
      219   TERMINATE-CCVS
      279   WRITE-LINE . . . . . . . . . .  P230 P231 P239 P240 P241 P242 P244 P245 P246 P248 P250 P258 P266 P272 P277 P278
                                            P306 P310 P314 P315 P317 P318 P328
      295   WRT-LN . . . . . . . . . . . .  P285 P286 P287 P288 P289 P290 P291 P294 P299
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    16
0 Defined   Cross-reference of programs     References

        3   IF105A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF105A    Date 06/04/2022  Time 11:58:18   Page    17
0LineID  Message code  Message text

     26  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF105A:
 *    Source records = 471
 *    Data Division statements = 89
 *    Procedure Division statements = 231
 *    Generated COBOL statements = 0
 *    Program complexity factor = 239
0End of compilation 1,  program IF105A,  highest severity 0.
0Return code 0
