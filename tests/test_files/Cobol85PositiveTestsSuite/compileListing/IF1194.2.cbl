1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:26   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:26   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1194.2
   000002         000200 PROGRAM-ID.                                                      IF1194.2
   000003         000300     IF119A.                                                      IF1194.2
   000004         000400                                                                  IF1194.2
   000005         000600*                                                         *       IF1194.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1194.2
   000007         000800* It contains tests for the Intrinsic Function MAX.       *       IF1194.2
   000008         000900*                                                         *       IF1194.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1194.2
   000010         001200 CONFIGURATION SECTION.                                           IF1194.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1194.2
   000012         001400     XXXXX082.                                                    IF1194.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1194.2
   000014         001600     XXXXX083                                                     IF1194.2
   000015         001700     PROGRAM COLLATING SEQUENCE IS PRG-COLL-SEQ.                  IF1194.2 17
   000016         001800 SPECIAL-NAMES.                                                   IF1194.2
   000017         001900     ALPHABET PRG-COLL-SEQ IS                                     IF1194.2
   000018         002000     STANDARD-2.                                                  IF1194.2
   000019         002100 INPUT-OUTPUT SECTION.                                            IF1194.2
   000020         002200 FILE-CONTROL.                                                    IF1194.2
   000021         002300     SELECT PRINT-FILE ASSIGN TO                                  IF1194.2 25
   000022         002400     XXXXX055.                                                    IF1194.2
   000023         002500 DATA DIVISION.                                                   IF1194.2
   000024         002600 FILE SECTION.                                                    IF1194.2
   000025         002700 FD  PRINT-FILE.                                                  IF1194.2

 ==000025==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000026         002800 01  PRINT-REC PICTURE X(120).                                    IF1194.2
   000027         002900 01  DUMMY-RECORD PICTURE X(120).                                 IF1194.2
   000028         003000 WORKING-STORAGE SECTION.                                         IF1194.2
   000029         003200* Variables specific to the Intrinsic Function Test IF119A*       IF1194.2
   000030         003400 01  A                   PIC S9(10)          VALUE 5.             IF1194.2
   000031         003500 01  B                   PIC S9(10)          VALUE 7.             IF1194.2
   000032         003600 01  C                   PIC S9(10)          VALUE -4.            IF1194.2
   000033         003700 01  D                   PIC S9(10)          VALUE 10.            IF1194.2
   000034         003800 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1194.2
   000035         003900 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1194.2
   000036         004000 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1194.2
   000037         004100 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1194.2
   000038         004200 01  I                   PIC X               VALUE "R".           IF1194.2
   000039         004300 01  J                   PIC X               VALUE "U".           IF1194.2
   000040         004400 01  M                   PIC S9(10)          VALUE 1.             IF1194.2
   000041         004500 01  N                   PIC S9(10)          VALUE 3.             IF1194.2
   000042         004600 01  O                   PIC S9(10)          VALUE 5.             IF1194.2
   000043         004700 01  ARG1                PIC S9(10)          VALUE 1.             IF1194.2
   000044         004800 01  ARR                                     VALUE "40537".       IF1194.2
   000045         004900     02  IND OCCURS 5 TIMES PIC 9.                                IF1194.2
   000046         005000 01  TEMP                PIC S9(10).                              IF1194.2
   000047         005100 01  WS-NUM              PIC S9(6)V9(6).                          IF1194.2
   000048         005200 01  WS-ANUM             PIC X.                                   IF1194.2
   000049         005300 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1194.2
   000050         005400 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1194.2
   000051         005500*                                                                 IF1194.2
   000052         005700*                                                                 IF1194.2
   000053         005800 01  TEST-RESULTS.                                                IF1194.2
   000054         005900     02 FILLER                   PIC X      VALUE SPACE.          IF1194.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1194.2 IMP
   000056         006100     02 FILLER                   PIC X      VALUE SPACE.          IF1194.2 IMP
   000057         006200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1194.2 IMP
   000058         006300     02 FILLER                   PIC X      VALUE SPACE.          IF1194.2 IMP
   000059         006400     02  PAR-NAME.                                                IF1194.2
   000060         006500       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1194.2 IMP
   000061         006600       03  PARDOT-X              PIC X      VALUE SPACE.          IF1194.2 IMP
   000062         006700       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1194.2 IMP
   000063         006800     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1194.2 IMP
   000064         006900     02 RE-MARK                  PIC X(61).                       IF1194.2
   000065         007000 01  TEST-COMPUTED.                                               IF1194.2
   000066         007100     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1194.2 IMP
   000067         007200     02 FILLER                   PIC X(17)  VALUE                 IF1194.2
   000068         007300            "       COMPUTED=".                                   IF1194.2
   000069         007400     02 COMPUTED-X.                                               IF1194.2
   000070         007500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1194.2 IMP
   000071         007600     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1194.2 70
   000072         007700                                 PIC -9(9).9(9).                  IF1194.2
   000073         007800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1194.2 70
   000074         007900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1194.2 70
   000075         008000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1194.2 70
   000076         008100     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1194.2 70
   000077         008200         04 COMPUTED-18V0                    PIC -9(18).          IF1194.2
   000078         008300         04 FILLER                           PIC X.               IF1194.2
   000079         008400     03 FILLER PIC X(50) VALUE SPACE.                             IF1194.2 IMP
   000080         008500 01  TEST-CORRECT.                                                IF1194.2
   000081         008600     02 FILLER PIC X(30) VALUE SPACE.                             IF1194.2 IMP
   000082         008700     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1194.2
   000083         008800     02 CORRECT-X.                                                IF1194.2
   000084         008900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1194.2 IMP
   000085         009000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1194.2 84
   000086         009100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1194.2 84
   000087         009200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1194.2 84
   000088         009300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1194.2 84
   000089         009400     03      CR-18V0 REDEFINES CORRECT-A.                         IF1194.2 84
   000090         009500         04 CORRECT-18V0                     PIC -9(18).          IF1194.2
   000091         009600         04 FILLER                           PIC X.               IF1194.2
   000092         009700     03 FILLER PIC X(2) VALUE SPACE.                              IF1194.2 IMP
   000093         009800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1194.2 IMP
   000094         009900 01  TEST-CORRECT-MIN.                                            IF1194.2
   000095         010000     02 FILLER PIC X(30) VALUE SPACE.                             IF1194.2 IMP
   000096         010100     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1194.2
   000097         010200     02 CORRECTMI-X.                                              IF1194.2
   000098         010300     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1194.2 IMP
   000099         010400     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1194.2 98
   000100         010500     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1194.2 98
   000101         010600     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1194.2 98
   000102         010700     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1194.2 98
   000103         010800     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1194.2 98
   000104         010900         04 CORRECTMI-18V0                     PIC -9(18).        IF1194.2
   000105         011000         04 FILLER                           PIC X.               IF1194.2
   000106         011100     03 FILLER PIC X(2) VALUE SPACE.                              IF1194.2 IMP
   000107         011200     03 FILLER                           PIC X(48) VALUE SPACE.   IF1194.2 IMP
   000108         011300 01  TEST-CORRECT-MAX.                                            IF1194.2
   000109         011400     02 FILLER PIC X(30) VALUE SPACE.                             IF1194.2 IMP
   000110         011500     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1194.2
   000111         011600     02 CORRECTMA-X.                                              IF1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1194.2 IMP
   000113         011800     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1194.2 112
   000114         011900     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1194.2 112
   000115         012000     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1194.2 112
   000116         012100     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1194.2 112
   000117         012200     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1194.2 112
   000118         012300         04 CORRECTMA-18V0                     PIC -9(18).        IF1194.2
   000119         012400         04 FILLER                           PIC X.               IF1194.2
   000120         012500     03 FILLER PIC X(2) VALUE SPACE.                              IF1194.2 IMP
   000121         012600     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1194.2 IMP
   000122         012700 01  CCVS-C-1.                                                    IF1194.2
   000123         012800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1194.2
   000124         012900-    "SS  PARAGRAPH-NAME                                          IF1194.2
   000125         013000-    "       REMARKS".                                            IF1194.2
   000126         013100     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1194.2 IMP
   000127         013200 01  CCVS-C-2.                                                    IF1194.2
   000128         013300     02 FILLER                     PIC X        VALUE SPACE.      IF1194.2 IMP
   000129         013400     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1194.2
   000130         013500     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1194.2 IMP
   000131         013600     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1194.2
   000132         013700     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1194.2 IMP
   000133         013800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1194.2 IMP
   000134         013900 01  REC-CT                        PIC 99       VALUE ZERO.       IF1194.2 IMP
   000135         014000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1194.2 IMP
   000136         014100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1194.2 IMP
   000137         014200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1194.2 IMP
   000138         014300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1194.2 IMP
   000139         014400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1194.2 IMP
   000140         014500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1194.2 IMP
   000141         014600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1194.2 IMP
   000142         014700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1194.2 IMP
   000143         014800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1194.2 IMP
   000144         014900 01  CCVS-H-1.                                                    IF1194.2
   000145         015000     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1194.2 IMP
   000146         015100     02  FILLER                    PIC X(42)    VALUE             IF1194.2
   000147         015200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1194.2
   000148         015300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1194.2 IMP
   000149         015400 01  CCVS-H-2A.                                                   IF1194.2
   000150         015500   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1194.2 IMP
   000151         015600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1194.2
   000152         015700   02  FILLER                        PIC XXXX   VALUE             IF1194.2
   000153         015800     "4.2 ".                                                      IF1194.2
   000154         015900   02  FILLER                        PIC X(28)  VALUE             IF1194.2
   000155         016000            " COPY - NOT FOR DISTRIBUTION".                       IF1194.2
   000156         016100   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1194.2 IMP
   000157         016200                                                                  IF1194.2
   000158         016300 01  CCVS-H-2B.                                                   IF1194.2
   000159         016400   02  FILLER                        PIC X(15)  VALUE             IF1194.2
   000160         016500            "TEST RESULT OF ".                                    IF1194.2
   000161         016600   02  TEST-ID                       PIC X(9).                    IF1194.2
   000162         016700   02  FILLER                        PIC X(4)   VALUE             IF1194.2
   000163         016800            " IN ".                                               IF1194.2
   000164         016900   02  FILLER                        PIC X(12)  VALUE             IF1194.2
   000165         017000     " HIGH       ".                                              IF1194.2
   000166         017100   02  FILLER                        PIC X(22)  VALUE             IF1194.2
   000167         017200            " LEVEL VALIDATION FOR ".                             IF1194.2
   000168         017300   02  FILLER                        PIC X(58)  VALUE             IF1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1194.2
   000170         017500 01  CCVS-H-3.                                                    IF1194.2
   000171         017600     02  FILLER                      PIC X(34)  VALUE             IF1194.2
   000172         017700            " FOR OFFICIAL USE ONLY    ".                         IF1194.2
   000173         017800     02  FILLER                      PIC X(58)  VALUE             IF1194.2
   000174         017900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1194.2
   000175         018000     02  FILLER                      PIC X(28)  VALUE             IF1194.2
   000176         018100            "  COPYRIGHT   1985 ".                                IF1194.2
   000177         018200 01  CCVS-E-1.                                                    IF1194.2
   000178         018300     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1194.2 IMP
   000179         018400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1194.2
   000180         018500     02 ID-AGAIN                     PIC X(9).                    IF1194.2
   000181         018600     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1194.2 IMP
   000182         018700 01  CCVS-E-2.                                                    IF1194.2
   000183         018800     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1194.2 IMP
   000184         018900     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1194.2 IMP
   000185         019000     02 CCVS-E-2-2.                                               IF1194.2
   000186         019100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1194.2 IMP
   000187         019200         03 FILLER                   PIC X      VALUE SPACE.      IF1194.2 IMP
   000188         019300         03 ENDER-DESC               PIC X(44)  VALUE             IF1194.2
   000189         019400            "ERRORS ENCOUNTERED".                                 IF1194.2
   000190         019500 01  CCVS-E-3.                                                    IF1194.2
   000191         019600     02  FILLER                      PIC X(22)  VALUE             IF1194.2
   000192         019700            " FOR OFFICIAL USE ONLY".                             IF1194.2
   000193         019800     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1194.2 IMP
   000194         019900     02  FILLER                      PIC X(58)  VALUE             IF1194.2
   000195         020000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1194.2
   000196         020100     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1194.2 IMP
   000197         020200     02 FILLER                       PIC X(15)  VALUE             IF1194.2
   000198         020300             " COPYRIGHT 1985".                                   IF1194.2
   000199         020400 01  CCVS-E-4.                                                    IF1194.2
   000200         020500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1194.2 IMP
   000201         020600     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1194.2
   000202         020700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1194.2 IMP
   000203         020800     02 FILLER                       PIC X(40)  VALUE             IF1194.2
   000204         020900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1194.2
   000205         021000 01  XXINFO.                                                      IF1194.2
   000206         021100     02 FILLER                       PIC X(19)  VALUE             IF1194.2
   000207         021200            "*** INFORMATION ***".                                IF1194.2
   000208         021300     02 INFO-TEXT.                                                IF1194.2
   000209         021400       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1194.2 IMP
   000210         021500       04 XXCOMPUTED                 PIC X(20).                   IF1194.2
   000211         021600       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1194.2 IMP
   000212         021700       04 XXCORRECT                  PIC X(20).                   IF1194.2
   000213         021800     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1194.2
   000214         021900 01  HYPHEN-LINE.                                                 IF1194.2
   000215         022000     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1194.2 IMP
   000216         022100     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1194.2
   000217         022200-    "*****************************************".                 IF1194.2
   000218         022300     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1194.2
   000219         022400-    "******************************".                            IF1194.2
   000220         022500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1194.2
   000221         022600     "IF119A".                                                    IF1194.2
   000222         022700 PROCEDURE DIVISION.                                              IF1194.2
   000223         022800 CCVS1 SECTION.                                                   IF1194.2
   000224         022900 OPEN-FILES.                                                      IF1194.2
   000225         023000     OPEN     OUTPUT PRINT-FILE.                                  IF1194.2 25
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1194.2 220 161 220 180
   000227         023200     MOVE    SPACE TO TEST-RESULTS.                               IF1194.2 IMP 53
   000228         023300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1194.2 251 256
   000229         023400     GO TO CCVS1-EXIT.                                            IF1194.2 344
   000230         023500 CLOSE-FILES.                                                     IF1194.2
   000231         023600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1194.2 260 280 25
   000232         023700 TERMINATE-CCVS.                                                  IF1194.2
   000233         023800     STOP     RUN.                                                IF1194.2
   000234         023900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1194.2 57 137
   000235         024000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1194.2 57 138
   000236         024100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1194.2 57 136
   000237         024200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1194.2 57 135
   000238         024300     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1194.2 64
   000239         024400 PRINT-DETAIL.                                                    IF1194.2
   000240         024500     IF REC-CT NOT EQUAL TO ZERO                                  IF1194.2 134 IMP
   000241      1  024600             MOVE "." TO PARDOT-X                                 IF1194.2 61
   000242      1  024700             MOVE REC-CT TO DOTVALUE.                             IF1194.2 134 62
   000243         024800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1194.2 53 26 292
   000244         024900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1194.2 57 292
   000245      1  025000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1194.2 313 333
   000246      1  025100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1194.2 334 343
   000247         025200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1194.2 IMP 57 IMP 69
   000248         025300     MOVE SPACE TO CORRECT-X.                                     IF1194.2 IMP 83
   000249         025400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1194.2 134 IMP IMP 59
   000250         025500     MOVE     SPACE TO RE-MARK.                                   IF1194.2 IMP 64
   000251         025600 HEAD-ROUTINE.                                                    IF1194.2
   000252         025700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1194.2 144 27 292
   000253         025800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1194.2 149 27 292
   000254         025900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1194.2 158 27 292
   000255         026000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1194.2 170 27 292
   000256         026100 COLUMN-NAMES-ROUTINE.                                            IF1194.2
   000257         026200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1194.2 122 27 292
   000258         026300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1194.2 127 27 292
   000259         026400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1194.2 214 27 292
   000260         026500 END-ROUTINE.                                                     IF1194.2
   000261         026600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1194.2 214 27 292
   000262         026700 END-RTN-EXIT.                                                    IF1194.2
   000263         026800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1194.2 177 27 292
   000264         026900 END-ROUTINE-1.                                                   IF1194.2
   000265         027000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1194.2 136 140 137
   000266         027100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1194.2 140 135 140
   000267         027200      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1194.2 138 140
   000268         027300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1194.2 138 200
   000269         027400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1194.2 140 202
   000270         027500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1194.2 199 185
   000271         027600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1194.2 182 27 292
   000272         027700  END-ROUTINE-12.                                                 IF1194.2
   000273         027800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1194.2 188
   000274         027900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1194.2 136 IMP
   000275      1  028000         MOVE "NO " TO ERROR-TOTAL                                IF1194.2 186
   000276         028100         ELSE                                                     IF1194.2
   000277      1  028200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1194.2 136 186
   000278         028300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1194.2 182 27
   000279         028400     PERFORM WRITE-LINE.                                          IF1194.2 292
   000280         028500 END-ROUTINE-13.                                                  IF1194.2
   000281         028600     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1194.2 135 IMP
   000282      1  028700         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1194.2 186
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1194.2 135 186
   000284         028900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1194.2 188
   000285         029000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1194.2 182 27 292
   000286         029100      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1194.2 137 IMP
   000287      1  029200          MOVE "NO " TO ERROR-TOTAL                               IF1194.2 186
   000288      1  029300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1194.2 137 186
   000289         029400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1194.2 188
   000290         029500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1194.2 182 27 292
   000291         029600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1194.2 190 27 292
   000292         029700 WRITE-LINE.                                                      IF1194.2
   000293         029800     ADD 1 TO RECORD-COUNT.                                       IF1194.2 142
   000294         029900     IF RECORD-COUNT GREATER 42                                   IF1194.2 142
   000295      1  030000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1194.2 27 141
   000296      1  030100         MOVE SPACE TO DUMMY-RECORD                               IF1194.2 IMP 27
   000297      1  030200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1194.2 27
   000298      1  030300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1194.2 144 27 308
   000299      1  030400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1194.2 149 27 308
   000300      1  030500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1194.2 158 27 308
   000301      1  030600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1194.2 170 27 308
   000302      1  030700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1194.2 122 27 308
   000303      1  030800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1194.2 127 27 308
   000304      1  030900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1194.2 214 27 308
   000305      1  031000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1194.2 141 27
   000306      1  031100         MOVE ZERO TO RECORD-COUNT.                               IF1194.2 IMP 142
   000307         031200     PERFORM WRT-LN.                                              IF1194.2 308
   000308         031300 WRT-LN.                                                          IF1194.2
   000309         031400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1194.2 27
   000310         031500     MOVE SPACE TO DUMMY-RECORD.                                  IF1194.2 IMP 27
   000311         031600 BLANK-LINE-PRINT.                                                IF1194.2
   000312         031700     PERFORM WRT-LN.                                              IF1194.2 308
   000313         031800 FAIL-ROUTINE.                                                    IF1194.2
   000314         031900     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1194.2 69 IMP
   000315      1  032000            GO TO FAIL-ROUTINE-WRITE.                             IF1194.2 322
   000316         032100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1194.2 83 IMP 322
   000317         032200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1194.2 143 213
   000318         032300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1194.2 208
   000319         032400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1194.2 205 27 292
   000320         032500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1194.2 IMP 213
   000321         032600     GO TO  FAIL-ROUTINE-EX.                                      IF1194.2 333
   000322         032700 FAIL-ROUTINE-WRITE.                                              IF1194.2
   000323         032800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1194.2 65 26 292
   000324         032900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1194.2 143 93
   000325         033000                              CORMA-ANSI-REFERENCE.               IF1194.2 121
   000326         033100     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1194.2 99 IMP
   000327      1  033200           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1194.2 94 26 292
   000328      1  033300           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1194.2 108 26 292
   000329         033400     ELSE                                                         IF1194.2
   000330      1  033500           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1194.2 80 26 292
   000331         033600     PERFORM WRITE-LINE.                                          IF1194.2 292
   000332         033700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1194.2 IMP 93
   000333         033800 FAIL-ROUTINE-EX. EXIT.                                           IF1194.2
   000334         033900 BAIL-OUT.                                                        IF1194.2
   000335         034000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1194.2 70 IMP 337
   000336         034100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1194.2 84 IMP 343
   000337         034200 BAIL-OUT-WRITE.                                                  IF1194.2
   000338         034300     MOVE CORRECT-A TO XXCORRECT.                                 IF1194.2 84 212
   000339         034400     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1194.2 70 210
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1194.2 143 213
   000341         034600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1194.2 205 27 292
   000342         034700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1194.2 IMP 213
   000343         034800 BAIL-OUT-EX. EXIT.                                               IF1194.2
   000344         034900 CCVS1-EXIT.                                                      IF1194.2
   000345         035000     EXIT.                                                        IF1194.2
   000346         035200*                                                      *          IF1194.2
   000347         035300*    Intrinsic Function Tests         IF119A - MAX     *          IF1194.2
   000348         035400*                                                      *          IF1194.2
   000349         035600 SECT-IF119A SECTION.                                             IF1194.2
   000350         035700 F-MAX-INFO.                                                      IF1194.2
   000351         035800     MOVE     "See ref. A-52 2.23" TO ANSI-REFERENCE.             IF1194.2 143
   000352         035900     MOVE     "MAX Function" TO FEATURE.                          IF1194.2 55
   000353         036100 F-MAX-01.                                                        IF1194.2
   000354         036200     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000355         036300 F-MAX-TEST-01.                                                   IF1194.2
   000356         036400     COMPUTE WS-NUM = FUNCTION MAX(5, 6, 10, 3, 7).               IF1194.2 47 IFN
   000357         036500     IF WS-NUM = 10 THEN                                          IF1194.2 47
   000358      1  036600                    PERFORM PASS                                  IF1194.2 235
   000359         036700     ELSE                                                         IF1194.2
   000360      1  036800                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000361      1  036900                    MOVE 10 TO CORRECT-N                          IF1194.2 85
   000362      1  037000                    PERFORM FAIL.                                 IF1194.2 236
   000363         037100     GO TO F-MAX-WRITE-01.                                        IF1194.2 367
   000364         037200 F-MAX-DELETE-01.                                                 IF1194.2
   000365         037300     PERFORM  DE-LETE.                                            IF1194.2 237
   000366         037400     GO TO    F-MAX-WRITE-01.                                     IF1194.2 367
   000367         037500 F-MAX-WRITE-01.                                                  IF1194.2
   000368         037600     MOVE "F-MAX-01" TO PAR-NAME.                                 IF1194.2 59
   000369         037700     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000370         037900 F-MAX-02.                                                        IF1194.2
   000371         038000     EVALUATE FUNCTION MAX(-4, 7, 304, 3, -8)                     IF1194.2 IFN
   000372         038100     WHEN 304                                                     IF1194.2
   000373      1  038200                    PERFORM PASS                                  IF1194.2 235
   000374         038300     WHEN OTHER                                                   IF1194.2
   000375      1  038400                    PERFORM FAIL.                                 IF1194.2 236
   000376         038500     GO TO F-MAX-WRITE-02.                                        IF1194.2 380
   000377         038600 F-MAX-DELETE-02.                                                 IF1194.2
   000378         038700     PERFORM  DE-LETE.                                            IF1194.2 237
   000379         038800     GO TO    F-MAX-WRITE-02.                                     IF1194.2 380
   000380         038900 F-MAX-WRITE-02.                                                  IF1194.2
   000381         039000     MOVE "F-MAX-02" TO PAR-NAME.                                 IF1194.2 59
   000382         039100     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000383         039300 F-MAX-03.                                                        IF1194.2
   000384         039400     IF (FUNCTION MAX(4.3, 2.6, 7.3, 9.1) >= 9.09982) AND         IF1194.2 IFN
   000385         039500        (FUNCTION MAX(4.3, 2.6, 7.3, 9.1) <= 9.10018)             IF1194.2 IFN
   000386      1  039600                    PERFORM PASS                                  IF1194.2 235
   000387         039700     ELSE                                                         IF1194.2
   000388      1  039800                    PERFORM FAIL.                                 IF1194.2 236
   000389         039900     GO TO F-MAX-WRITE-03.                                        IF1194.2 393
   000390         040000 F-MAX-DELETE-03.                                                 IF1194.2
   000391         040100     PERFORM  DE-LETE.                                            IF1194.2 237
   000392         040200     GO TO    F-MAX-WRITE-03.                                     IF1194.2 393
   000393         040300 F-MAX-WRITE-03.                                                  IF1194.2
   000394         040400     MOVE "F-MAX-03" TO PAR-NAME.                                 IF1194.2 59
   000395         040500     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000396         040700 F-MAX-04.                                                        IF1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040800     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000398         040900 F-MAX-TEST-04.                                                   IF1194.2
   000399         041000     COMPUTE WS-NUM = FUNCTION MAX(-4.3, 10.2, -0.7, 3.9).        IF1194.2 47 IFN
   000400         041100     IF (WS-NUM >= 10.1998) AND                                   IF1194.2 47
   000401         041200        (WS-NUM <= 10.2002)                                       IF1194.2 47
   000402      1  041300                    PERFORM PASS                                  IF1194.2 235
   000403         041400     ELSE                                                         IF1194.2
   000404      1  041500                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000405      1  041600                    MOVE 10.2 TO CORRECT-N                        IF1194.2 85
   000406      1  041700                    PERFORM FAIL.                                 IF1194.2 236
   000407         041800     GO TO F-MAX-WRITE-04.                                        IF1194.2 411
   000408         041900 F-MAX-DELETE-04.                                                 IF1194.2
   000409         042000     PERFORM  DE-LETE.                                            IF1194.2 237
   000410         042100     GO TO    F-MAX-WRITE-04.                                     IF1194.2 411
   000411         042200 F-MAX-WRITE-04.                                                  IF1194.2
   000412         042300     MOVE "F-MAX-04" TO PAR-NAME.                                 IF1194.2 59
   000413         042400     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000414         042600 F-MAX-05.                                                        IF1194.2
   000415         042700     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000416         042800 F-MAX-TEST-05.                                                   IF1194.2
   000417         042900     COMPUTE WS-NUM = FUNCTION MAX(A, B, D).                      IF1194.2 47 IFN 30 31 33
   000418         043000     IF WS-NUM = 10 THEN                                          IF1194.2 47
   000419      1  043100                    PERFORM PASS                                  IF1194.2 235
   000420         043200     ELSE                                                         IF1194.2
   000421      1  043300                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000422      1  043400                    MOVE 10 TO CORRECT-N                          IF1194.2 85
   000423      1  043500                    PERFORM FAIL.                                 IF1194.2 236
   000424         043600     GO TO F-MAX-WRITE-05.                                        IF1194.2 428
   000425         043700 F-MAX-DELETE-05.                                                 IF1194.2
   000426         043800     PERFORM  DE-LETE.                                            IF1194.2 237
   000427         043900     GO TO    F-MAX-WRITE-05.                                     IF1194.2 428
   000428         044000 F-MAX-WRITE-05.                                                  IF1194.2
   000429         044100     MOVE "F-MAX-05" TO PAR-NAME.                                 IF1194.2 59
   000430         044200     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000431         044400 F-MAX-06.                                                        IF1194.2
   000432         044500     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000433         044600 F-MAX-TEST-06.                                                   IF1194.2
   000434         044700     COMPUTE WS-NUM = FUNCTION MAX(A, B, C).                      IF1194.2 47 IFN 30 31 32
   000435         044800     IF WS-NUM = 7 THEN                                           IF1194.2 47
   000436      1  044900                    PERFORM PASS                                  IF1194.2 235
   000437         045000     ELSE                                                         IF1194.2
   000438      1  045100                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000439      1  045200                    MOVE 7 TO CORRECT-N                           IF1194.2 85
   000440      1  045300                    PERFORM FAIL.                                 IF1194.2 236
   000441         045400     GO TO F-MAX-WRITE-06.                                        IF1194.2 445
   000442         045500 F-MAX-DELETE-06.                                                 IF1194.2
   000443         045600     PERFORM  DE-LETE.                                            IF1194.2 237
   000444         045700     GO TO    F-MAX-WRITE-06.                                     IF1194.2 445
   000445         045800 F-MAX-WRITE-06.                                                  IF1194.2
   000446         045900     MOVE "F-MAX-06" TO PAR-NAME.                                 IF1194.2 59
   000447         046000     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000448         046200 F-MAX-07.                                                        IF1194.2
   000449         046300     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000450         046400 F-MAX-TEST-07.                                                   IF1194.2
   000451         046500     COMPUTE WS-NUM = FUNCTION MAX(E, G).                         IF1194.2 47 IFN 34 36
   000452         046600     IF (WS-NUM >= 34.2593) AND                                   IF1194.2 47
   000453         046700        (WS-NUM <= 34.2607)                                       IF1194.2 47
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  046800                    PERFORM PASS                                  IF1194.2 235
   000455         046900     ELSE                                                         IF1194.2
   000456      1  047000                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000457      1  047100                    MOVE 34.26 TO CORRECT-N                       IF1194.2 85
   000458      1  047200                    PERFORM FAIL.                                 IF1194.2 236
   000459         047300     GO TO F-MAX-WRITE-07.                                        IF1194.2 463
   000460         047400 F-MAX-DELETE-07.                                                 IF1194.2
   000461         047500     PERFORM  DE-LETE.                                            IF1194.2 237
   000462         047600     GO TO    F-MAX-WRITE-07.                                     IF1194.2 463
   000463         047700 F-MAX-WRITE-07.                                                  IF1194.2
   000464         047800     MOVE "F-MAX-07" TO PAR-NAME.                                 IF1194.2 59
   000465         047900     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000466         048100 F-MAX-08.                                                        IF1194.2
   000467         048200     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000468         048300 F-MAX-TEST-08.                                                   IF1194.2
   000469         048400     COMPUTE WS-NUM = FUNCTION MAX(F, G, H).                      IF1194.2 47 IFN 35 36 37
   000470         048500     IF (WS-NUM >= 4.07992) AND                                   IF1194.2 47
   000471         048600        (WS-NUM <= 4.08008)                                       IF1194.2 47
   000472      1  048700                    PERFORM PASS                                  IF1194.2 235
   000473         048800     ELSE                                                         IF1194.2
   000474      1  048900                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000475      1  049000                    MOVE 4.08 TO CORRECT-N                        IF1194.2 85
   000476      1  049100                    PERFORM FAIL.                                 IF1194.2 236
   000477         049200     GO TO F-MAX-WRITE-08.                                        IF1194.2 481
   000478         049300 F-MAX-DELETE-08.                                                 IF1194.2
   000479         049400     PERFORM  DE-LETE.                                            IF1194.2 237
   000480         049500     GO TO    F-MAX-WRITE-08.                                     IF1194.2 481
   000481         049600 F-MAX-WRITE-08.                                                  IF1194.2
   000482         049700     MOVE "F-MAX-08" TO PAR-NAME.                                 IF1194.2 59
   000483         049800     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000484         050000 F-MAX-09.                                                        IF1194.2
   000485         050100     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000486         050200 F-MAX-TEST-09.                                                   IF1194.2
   000487         050300     COMPUTE WS-NUM = FUNCTION MAX(A, 4, 8, -10, C, 0).           IF1194.2 47 IFN 30 32
   000488         050400     IF WS-NUM = 8 THEN                                           IF1194.2 47
   000489      1  050500                    PERFORM PASS                                  IF1194.2 235
   000490         050600     ELSE                                                         IF1194.2
   000491      1  050700                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000492      1  050800                    MOVE 8 TO CORRECT-N                           IF1194.2 85
   000493      1  050900                    PERFORM FAIL.                                 IF1194.2 236
   000494         051000     GO TO F-MAX-WRITE-09.                                        IF1194.2 498
   000495         051100 F-MAX-DELETE-09.                                                 IF1194.2
   000496         051200     PERFORM  DE-LETE.                                            IF1194.2 237
   000497         051300     GO TO    F-MAX-WRITE-09.                                     IF1194.2 498
   000498         051400 F-MAX-WRITE-09.                                                  IF1194.2
   000499         051500     MOVE "F-MAX-09" TO PAR-NAME.                                 IF1194.2 59
   000500         051600     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000501         051800 F-MAX-10.                                                        IF1194.2
   000502         051900     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000503         052000 F-MAX-TEST-10.                                                   IF1194.2
   000504         052100     COMPUTE WS-NUM = FUNCTION MAX(4, D, H, 6.3, -2.0).           IF1194.2 47 IFN 33 37
   000505         052200     IF (WS-NUM >= 9.9998) AND                                    IF1194.2 47
   000506         052300        (WS-NUM <= 10.0002)                                       IF1194.2 47
   000507      1  052400                    PERFORM PASS                                  IF1194.2 235
   000508         052500     ELSE                                                         IF1194.2
   000509      1  052600                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000510      1  052700                    MOVE 10  TO CORRECT-N                         IF1194.2 85
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  052800                    PERFORM FAIL.                                 IF1194.2 236
   000512         052900     GO TO F-MAX-WRITE-10.                                        IF1194.2 516
   000513         053000 F-MAX-DELETE-10.                                                 IF1194.2
   000514         053100     PERFORM  DE-LETE.                                            IF1194.2 237
   000515         053200     GO TO    F-MAX-WRITE-10.                                     IF1194.2 516
   000516         053300 F-MAX-WRITE-10.                                                  IF1194.2
   000517         053400     MOVE "F-MAX-10" TO PAR-NAME.                                 IF1194.2 59
   000518         053500     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000519         053700 F-MAX-11.                                                        IF1194.2
   000520         053800     MOVE SPACES TO WS-ANUM.                                      IF1194.2 IMP 48
   000521         053900 F-MAX-TEST-11.                                                   IF1194.2
   000522         054000     MOVE FUNCTION MAX("R", I, "I", "a") TO WS-ANUM.              IF1194.2 IFN 38 48
   000523         054100     IF WS-ANUM = "a" THEN                                        IF1194.2 48
   000524      1  054200                    PERFORM PASS                                  IF1194.2 235
   000525         054300     ELSE                                                         IF1194.2
   000526      1  054400                    MOVE WS-ANUM TO COMPUTED-A                    IF1194.2 48 70
   000527      1  054500                    MOVE "a" TO CORRECT-A                         IF1194.2 84
   000528      1  054600                    PERFORM FAIL.                                 IF1194.2 236
   000529         054700     GO TO F-MAX-WRITE-11.                                        IF1194.2 533
   000530         054800 F-MAX-DELETE-11.                                                 IF1194.2
   000531         054900     PERFORM  DE-LETE.                                            IF1194.2 237
   000532         055000     GO TO    F-MAX-WRITE-11.                                     IF1194.2 533
   000533         055100 F-MAX-WRITE-11.                                                  IF1194.2
   000534         055200     MOVE "F-MAX-11" TO PAR-NAME.                                 IF1194.2 59
   000535         055300     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000536         055500 F-MAX-12.                                                        IF1194.2
   000537         055600     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000538         055700 F-MAX-TEST-12.                                                   IF1194.2
   000539         055800     MOVE FUNCTION MAX("A", J, "J") TO WS-ANUM.                   IF1194.2 IFN 39 48
   000540         055900     IF WS-ANUM = "U" THEN                                        IF1194.2 48
   000541      1  056000                    PERFORM PASS                                  IF1194.2 235
   000542         056100     ELSE                                                         IF1194.2
   000543      1  056200                    MOVE WS-ANUM TO COMPUTED-A                    IF1194.2 48 70
   000544      1  056300                    MOVE "U" TO CORRECT-A                         IF1194.2 84
   000545      1  056400                    PERFORM FAIL.                                 IF1194.2 236
   000546         056500     GO TO F-MAX-WRITE-12.                                        IF1194.2 550
   000547         056600 F-MAX-DELETE-12.                                                 IF1194.2
   000548         056700     PERFORM  DE-LETE.                                            IF1194.2 237
   000549         056800     GO TO    F-MAX-WRITE-12.                                     IF1194.2 550
   000550         056900 F-MAX-WRITE-12.                                                  IF1194.2
   000551         057000     MOVE "F-MAX-12" TO PAR-NAME.                                 IF1194.2 59
   000552         057100     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000553         057300 F-MAX-13.                                                        IF1194.2
   000554         057400     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000555         057500 F-MAX-TEST-13.                                                   IF1194.2
   000556         057600     COMPUTE WS-NUM = FUNCTION MAX(IND(M), IND(N), IND(O)).       IF1194.2 47 IFN 45 40 45 41 45 42
   000557         057700     IF WS-NUM = 7 THEN                                           IF1194.2 47
   000558      1  057800                    PERFORM PASS                                  IF1194.2 235
   000559         057900     ELSE                                                         IF1194.2
   000560      1  058000                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000561      1  058100                    MOVE 7 TO CORRECT-N                           IF1194.2 85
   000562      1  058200                    PERFORM FAIL.                                 IF1194.2 236
   000563         058300     GO TO F-MAX-WRITE-13.                                        IF1194.2 567
   000564         058400 F-MAX-DELETE-13.                                                 IF1194.2
   000565         058500     PERFORM  DE-LETE.                                            IF1194.2 237
   000566         058600     GO TO    F-MAX-WRITE-13.                                     IF1194.2 567
   000567         058700 F-MAX-WRITE-13.                                                  IF1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058800     MOVE "F-MAX-13" TO PAR-NAME.                                 IF1194.2 59
   000569         058900     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000570         059100 F-MAX-14.                                                        IF1194.2
   000571         059200     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000572         059300 F-MAX-TEST-14.                                                   IF1194.2
   000573         059400     COMPUTE WS-NUM = FUNCTION MAX(IND(1), IND(2), IND(3)).       IF1194.2 47 IFN 45 45 45
   000574         059500     IF WS-NUM = 5 THEN                                           IF1194.2 47
   000575      1  059600                    PERFORM PASS                                  IF1194.2 235
   000576         059700     ELSE                                                         IF1194.2
   000577      1  059800                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000578      1  059900                    MOVE 5 TO CORRECT-N                           IF1194.2 85
   000579      1  060000                    PERFORM FAIL.                                 IF1194.2 236
   000580         060100     GO TO F-MAX-WRITE-14.                                        IF1194.2 584
   000581         060200 F-MAX-DELETE-14.                                                 IF1194.2
   000582         060300     PERFORM  DE-LETE.                                            IF1194.2 237
   000583         060400     GO TO    F-MAX-WRITE-14.                                     IF1194.2 584
   000584         060500 F-MAX-WRITE-14.                                                  IF1194.2
   000585         060600     MOVE "F-MAX-14" TO PAR-NAME.                                 IF1194.2 59
   000586         060700     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000587         060900 F-MAX-15.                                                        IF1194.2
   000588         061000     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000589         061100 F-MAX-TEST-15.                                                   IF1194.2
   000590         061200     COMPUTE WS-NUM = FUNCTION MAX(IND(ALL)).                     IF1194.2 47 IFN 45
   000591         061300     IF WS-NUM = 7 THEN                                           IF1194.2 47
   000592      1  061400                    PERFORM PASS                                  IF1194.2 235
   000593         061500     ELSE                                                         IF1194.2
   000594      1  061600                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000595      1  061700                    MOVE 7       TO CORRECT-N                     IF1194.2 85
   000596      1  061800                    PERFORM FAIL.                                 IF1194.2 236
   000597         061900     GO TO F-MAX-WRITE-15.                                        IF1194.2 601
   000598         062000 F-MAX-DELETE-15.                                                 IF1194.2
   000599         062100     PERFORM  DE-LETE.                                            IF1194.2 237
   000600         062200     GO TO    F-MAX-WRITE-15.                                     IF1194.2 601
   000601         062300 F-MAX-WRITE-15.                                                  IF1194.2
   000602         062400     MOVE "F-MAX-15" TO PAR-NAME.                                 IF1194.2 59
   000603         062500     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000604         062700 F-MAX-17.                                                        IF1194.2
   000605         062800     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000606         062900 F-MAX-TEST-17.                                                   IF1194.2
   000607         063000     COMPUTE WS-NUM =                                             IF1194.2 47
   000608         063100         FUNCTION MAX(31000, 310001, 78000, 29000, 12000).        IF1194.2 IFN
   000609         063200     IF WS-NUM = 310001 THEN                                      IF1194.2 47
   000610      1  063300                    PERFORM PASS                                  IF1194.2 235
   000611         063400     ELSE                                                         IF1194.2
   000612      1  063500                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000613      1  063600                    MOVE 310001 TO CORRECT-N                      IF1194.2 85
   000614      1  063700                    PERFORM FAIL.                                 IF1194.2 236
   000615         063800     GO TO F-MAX-WRITE-17.                                        IF1194.2 619
   000616         063900 F-MAX-DELETE-17.                                                 IF1194.2
   000617         064000     PERFORM  DE-LETE.                                            IF1194.2 237
   000618         064100     GO TO    F-MAX-WRITE-17.                                     IF1194.2 619
   000619         064200 F-MAX-WRITE-17.                                                  IF1194.2
   000620         064300     MOVE "F-MAX-17" TO PAR-NAME.                                 IF1194.2 59
   000621         064400     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000622         064600 F-MAX-18.                                                        IF1194.2
   000623         064700     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000624         064800     MOVE  34.9993 TO MIN-RANGE.                                  IF1194.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064900     MOVE  35.0007 TO MAX-RANGE.                                  IF1194.2 50
   000626         065000 F-MAX-TEST-18.                                                   IF1194.2
   000627         065100     COMPUTE WS-NUM = FUNCTION MAX(A * B, (C + 1) / 2, 3 + 4).    IF1194.2 47 IFN 30 31 32
   000628         065200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1194.2 47 49
   000629         065300        (WS-NUM <= MAX-RANGE) THEN                                IF1194.2 47 50
   000630      1  065400                    PERFORM PASS                                  IF1194.2 235
   000631         065500     ELSE                                                         IF1194.2
   000632      1  065600                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000633      1  065700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1194.2 49 99
   000634      1  065800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1194.2 50 113
   000635      1  065900                    PERFORM FAIL.                                 IF1194.2 236
   000636         066000     GO TO F-MAX-WRITE-18.                                        IF1194.2 640
   000637         066100 F-MAX-DELETE-18.                                                 IF1194.2
   000638         066200     PERFORM  DE-LETE.                                            IF1194.2 237
   000639         066300     GO TO    F-MAX-WRITE-18.                                     IF1194.2 640
   000640         066400 F-MAX-WRITE-18.                                                  IF1194.2
   000641         066500     MOVE "F-MAX-18" TO PAR-NAME.                                 IF1194.2 59
   000642         066600     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000643         066800 F-MAX-19.                                                        IF1194.2
   000644         066900     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000645         067000     MOVE  38.2592 TO MIN-RANGE.                                  IF1194.2 49
   000646         067100     MOVE  38.2608 TO MAX-RANGE.                                  IF1194.2 50
   000647         067200 F-MAX-TEST-19.                                                   IF1194.2
   000648         067300     COMPUTE WS-NUM = FUNCTION MAX(E + 4, H * 2, 5 + A).          IF1194.2 47 IFN 34 37 30
   000649         067400     IF (WS-NUM >= MIN-RANGE) AND                                 IF1194.2 47 49
   000650         067500        (WS-NUM <= MAX-RANGE) THEN                                IF1194.2 47 50
   000651      1  067600                    PERFORM PASS                                  IF1194.2 235
   000652         067700     ELSE                                                         IF1194.2
   000653      1  067800                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000654      1  067900                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1194.2 49 99
   000655      1  068000                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1194.2 50 113
   000656      1  068100                    PERFORM FAIL.                                 IF1194.2 236
   000657         068200     GO TO F-MAX-WRITE-19.                                        IF1194.2 661
   000658         068300 F-MAX-DELETE-19.                                                 IF1194.2
   000659         068400     PERFORM  DE-LETE.                                            IF1194.2 237
   000660         068500     GO TO    F-MAX-WRITE-19.                                     IF1194.2 661
   000661         068600 F-MAX-WRITE-19.                                                  IF1194.2
   000662         068700     MOVE "F-MAX-19" TO PAR-NAME.                                 IF1194.2 59
   000663         068800     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000664         069000 F-MAX-20.                                                        IF1194.2
   000665         069100     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000666         069200     MOVE -7.00014 TO MIN-RANGE.                                  IF1194.2 49
   000667         069300     MOVE -6.99986 TO MAX-RANGE.                                  IF1194.2 50
   000668         069400 F-MAX-TEST-20.                                                   IF1194.2
   000669         069500     COMPUTE WS-NUM = FUNCTION MAX(-7, -9 + 2, -7).               IF1194.2 47 IFN
   000670         069600     IF (WS-NUM >= MIN-RANGE) AND                                 IF1194.2 47 49
   000671         069700        (WS-NUM <= MAX-RANGE) THEN                                IF1194.2 47 50
   000672      1  069800                    PERFORM PASS                                  IF1194.2 235
   000673         069900     ELSE                                                         IF1194.2
   000674      1  070000                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000675      1  070100                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1194.2 49 99
   000676      1  070200                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1194.2 50 113
   000677      1  070300                    PERFORM FAIL.                                 IF1194.2 236
   000678         070400     GO TO F-MAX-WRITE-20.                                        IF1194.2 682
   000679         070500 F-MAX-DELETE-20.                                                 IF1194.2
   000680         070600     PERFORM  DE-LETE.                                            IF1194.2 237
   000681         070700     GO TO    F-MAX-WRITE-20.                                     IF1194.2 682
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070800 F-MAX-WRITE-20.                                                  IF1194.2
   000683         070900     MOVE "F-MAX-20" TO PAR-NAME.                                 IF1194.2 59
   000684         071000     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000685         071200 F-MAX-21.                                                        IF1194.2
   000686         071300     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000687         071400     MOVE 49.9990 TO MIN-RANGE.                                   IF1194.2 49
   000688         071500     MOVE 50.0001 TO MAX-RANGE.                                   IF1194.2 50
   000689         071600 F-MAX-TEST-21.                                                   IF1194.2
   000690         071700     COMPUTE WS-NUM = FUNCTION MAX(FUNCTION MAX(14, A), E, 50).   IF1194.2 47 IFN IFN 30 34
   000691         071800                                                                  IF1194.2
   000692         071900                                                                  IF1194.2
   000693         072000     IF (WS-NUM >= MIN-RANGE) AND                                 IF1194.2 47 49
   000694         072100        (WS-NUM <= MAX-RANGE) THEN                                IF1194.2 47 50
   000695      1  072200                    PERFORM PASS                                  IF1194.2 235
   000696         072300     ELSE                                                         IF1194.2
   000697      1  072400                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000698      1  072500                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1194.2 49 99
   000699      1  072600                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1194.2 50 113
   000700      1  072700                    PERFORM FAIL.                                 IF1194.2 236
   000701         072800     GO TO F-MAX-WRITE-21.                                        IF1194.2 705
   000702         072900 F-MAX-DELETE-21.                                                 IF1194.2
   000703         073000     PERFORM  DE-LETE.                                            IF1194.2 237
   000704         073100     GO TO    F-MAX-WRITE-21.                                     IF1194.2 705
   000705         073200 F-MAX-WRITE-21.                                                  IF1194.2
   000706         073300     MOVE "F-MAX-21" TO PAR-NAME.                                 IF1194.2 59
   000707         073400     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000708         073600 F-MAX-22.                                                        IF1194.2
   000709         073700     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000710         073800     MOVE 36.2593 TO MIN-RANGE.                                   IF1194.2 49
   000711         073900     MOVE 36.2607 TO MAX-RANGE.                                   IF1194.2 50
   000712         074000 F-MAX-TEST-22.                                                   IF1194.2
   000713         074100     COMPUTE WS-NUM = FUNCTION MAX(4, B, E) + 2.                  IF1194.2 47 IFN 31 34
   000714         074200     IF (WS-NUM >= MIN-RANGE) AND                                 IF1194.2 47 49
   000715         074300        (WS-NUM <= MAX-RANGE) THEN                                IF1194.2 47 50
   000716      1  074400                    PERFORM PASS                                  IF1194.2 235
   000717         074500     ELSE                                                         IF1194.2
   000718      1  074600                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000719      1  074700                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1194.2 49 99
   000720      1  074800                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1194.2 50 113
   000721      1  074900                    PERFORM FAIL.                                 IF1194.2 236
   000722         075000     GO TO F-MAX-WRITE-22.                                        IF1194.2 726
   000723         075100 F-MAX-DELETE-22.                                                 IF1194.2
   000724         075200     PERFORM  DE-LETE.                                            IF1194.2 237
   000725         075300     GO TO    F-MAX-WRITE-22.                                     IF1194.2 726
   000726         075400 F-MAX-WRITE-22.                                                  IF1194.2
   000727         075500     MOVE "F-MAX-22" TO PAR-NAME.                                 IF1194.2 59
   000728         075600     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000729         075800 F-MAX-23.                                                        IF1194.2
   000730         075900     MOVE ZERO TO WS-NUM.                                         IF1194.2 IMP 47
   000731         076000     MOVE 11.9998 TO MIN-RANGE.                                   IF1194.2 49
   000732         076100     MOVE 12.0002 TO MAX-RANGE.                                   IF1194.2 50
   000733         076200 F-MAX-TEST-23.                                                   IF1194.2
   000734         076300     COMPUTE WS-NUM = FUNCTION MAX(A, G) +                        IF1194.2 47 IFN 30 36
   000735         076400                      FUNCTION MAX(B, 0).                         IF1194.2 IFN 31
   000736         076500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1194.2 47 49
   000737         076600        (WS-NUM <= MAX-RANGE) THEN                                IF1194.2 47 50
   000738      1  076700                    PERFORM PASS                                  IF1194.2 235
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         076800     ELSE                                                         IF1194.2
   000740      1  076900                    MOVE WS-NUM TO COMPUTED-N                     IF1194.2 47 71
   000741      1  077000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1194.2 49 99
   000742      1  077100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1194.2 50 113
   000743      1  077200                    PERFORM FAIL.                                 IF1194.2 236
   000744         077300     GO TO F-MAX-WRITE-23.                                        IF1194.2 748
   000745         077400 F-MAX-DELETE-23.                                                 IF1194.2
   000746         077500     PERFORM  DE-LETE.                                            IF1194.2 237
   000747         077600     GO TO    F-MAX-WRITE-23.                                     IF1194.2 748
   000748         077700 F-MAX-WRITE-23.                                                  IF1194.2
   000749         077800     MOVE "F-MAX-23" TO PAR-NAME.                                 IF1194.2 59
   000750         077900     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000751         078100 F-MAX-24.                                                        IF1194.2
   000752         078200     PERFORM F-MAX-TEST-24                                        IF1194.2 756
   000753         078300       UNTIL FUNCTION MAX(ARG1, 1) > 5.                           IF1194.2 IFN 43
   000754         078400     PERFORM PASS.                                                IF1194.2 235
   000755         078500     GO TO F-MAX-WRITE-24.                                        IF1194.2 761
   000756         078600 F-MAX-TEST-24.                                                   IF1194.2
   000757         078700     COMPUTE ARG1 = ARG1 + 1.                                     IF1194.2 43 43
   000758         078800 F-MAX-DELETE-24.                                                 IF1194.2
   000759         078900     PERFORM  DE-LETE.                                            IF1194.2 237
   000760         079000     GO TO    F-MAX-WRITE-24.                                     IF1194.2 761
   000761         079100 F-MAX-WRITE-24.                                                  IF1194.2
   000762         079200     MOVE "F-MAX-24" TO PAR-NAME.                                 IF1194.2 59
   000763         079300     PERFORM  PRINT-DETAIL.                                       IF1194.2 239
   000764         079500 CCVS-EXIT SECTION.                                               IF1194.2
   000765         079600 CCVS-999999.                                                     IF1194.2
   000766         079700     GO TO CLOSE-FILES.                                           IF1194.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       30   A. . . . . . . . . . . . . . .  417 434 487 627 648 690 734
      143   ANSI-REFERENCE . . . . . . . .  317 324 340 M351
       43   ARG1 . . . . . . . . . . . . .  753 M757 757
       44   ARR
       31   B. . . . . . . . . . . . . . .  417 434 627 713 735
       32   C. . . . . . . . . . . . . . .  434 487 627
      122   CCVS-C-1 . . . . . . . . . . .  257 302
      127   CCVS-C-2 . . . . . . . . . . .  258 303
      177   CCVS-E-1 . . . . . . . . . . .  263
      182   CCVS-E-2 . . . . . . . . . . .  271 278 285 290
      185   CCVS-E-2-2 . . . . . . . . . .  M270
      190   CCVS-E-3 . . . . . . . . . . .  291
      199   CCVS-E-4 . . . . . . . . . . .  270
      200   CCVS-E-4-1 . . . . . . . . . .  M268
      202   CCVS-E-4-2 . . . . . . . . . .  M269
      144   CCVS-H-1 . . . . . . . . . . .  252 298
      149   CCVS-H-2A. . . . . . . . . . .  253 299
      158   CCVS-H-2B. . . . . . . . . . .  254 300
      170   CCVS-H-3 . . . . . . . . . . .  255 301
      220   CCVS-PGM-ID. . . . . . . . . .  226 226
       76   CM-18V0
       70   COMPUTED-A . . . . . . . . . .  71 73 74 75 76 335 339 M526 M543
       71   COMPUTED-N . . . . . . . . . .  M360 M404 M421 M438 M456 M474 M491 M509 M560 M577 M594 M612 M632 M653 M674 M697
                                            M718 M740
       69   COMPUTED-X . . . . . . . . . .  M247 314
       73   COMPUTED-0V18
       75   COMPUTED-14V4
       77   COMPUTED-18V0
       74   COMPUTED-4V14
       93   COR-ANSI-REFERENCE . . . . . .  M324 M332
      121   CORMA-ANSI-REFERENCE . . . . .  M325
       84   CORRECT-A. . . . . . . . . . .  85 86 87 88 89 336 338 M527 M544
      113   CORRECT-MAX. . . . . . . . . .  M634 M655 M676 M699 M720 M742
       99   CORRECT-MIN. . . . . . . . . .  326 M633 M654 M675 M698 M719 M741
       85   CORRECT-N. . . . . . . . . . .  M361 M405 M422 M439 M457 M475 M492 M510 M561 M578 M595 M613
       83   CORRECT-X. . . . . . . . . . .  M248 316
       86   CORRECT-0V18
       88   CORRECT-14V4
       90   CORRECT-18V0
       87   CORRECT-4V14
      112   CORRECTMA-A. . . . . . . . . .  113 114 115 116 117
      111   CORRECTMA-X
      114   CORRECTMA-0V18
      116   CORRECTMA-14V4
      118   CORRECTMA-18V0
      115   CORRECTMA-4V14
       98   CORRECTMI-A. . . . . . . . . .  99 100 101 102 103
       97   CORRECTMI-X
      100   CORRECTMI-0V18
      102   CORRECTMI-14V4
      104   CORRECTMI-18V0
      101   CORRECTMI-4V14
       89   CR-18V0
      103   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    18
0 Defined   Cross-reference of data names   References

0     117   CR-18V0
       33   D. . . . . . . . . . . . . . .  417 504
      135   DELETE-COUNTER . . . . . . . .  M237 266 281 283
       62   DOTVALUE . . . . . . . . . . .  M242
      141   DUMMY-HOLD . . . . . . . . . .  M295 305
       27   DUMMY-RECORD . . . . . . . . .  M252 M253 M254 M255 M257 M258 M259 M261 M263 M271 M278 M285 M290 M291 295 M296
                                            297 M298 M299 M300 M301 M302 M303 M304 M305 309 M310 M319 M341
       34   E. . . . . . . . . . . . . . .  451 648 690 713
      188   ENDER-DESC . . . . . . . . . .  M273 M284 M289
      136   ERROR-COUNTER. . . . . . . . .  M236 265 274 277
      140   ERROR-HOLD . . . . . . . . . .  M265 M266 M266 M267 269
      186   ERROR-TOTAL. . . . . . . . . .  M275 M277 M282 M283 M287 M288
       35   F. . . . . . . . . . . . . . .  469
       55   FEATURE. . . . . . . . . . . .  M352
       36   G. . . . . . . . . . . . . . .  451 469 734
       37   H. . . . . . . . . . . . . . .  469 504 648
      214   HYPHEN-LINE. . . . . . . . . .  259 261 304
       38   I. . . . . . . . . . . . . . .  522
      180   ID-AGAIN . . . . . . . . . . .  M226
       45   IND. . . . . . . . . . . . . .  556 556 556 573 573 573 590
      213   INF-ANSI-REFERENCE . . . . . .  M317 M320 M340 M342
      208   INFO-TEXT. . . . . . . . . . .  M318
      137   INSPECT-COUNTER. . . . . . . .  M234 265 286 288
       39   J. . . . . . . . . . . . . . .  539
       40   M. . . . . . . . . . . . . . .  556
       50   MAX-RANGE. . . . . . . . . . .  M625 629 634 M646 650 655 M667 671 676 M688 694 699 M711 715 720 M732 737 742
       49   MIN-RANGE. . . . . . . . . . .  M624 628 633 M645 649 654 M666 670 675 M687 693 698 M710 714 719 M731 736 741
       41   N. . . . . . . . . . . . . . .  556
       42   O. . . . . . . . . . . . . . .  556
       57   P-OR-F . . . . . . . . . . . .  M234 M235 M236 M237 244 M247
       59   PAR-NAME . . . . . . . . . . .  M249 M368 M381 M394 M412 M429 M446 M464 M482 M499 M517 M534 M551 M568 M585 M602
                                            M620 M641 M662 M683 M706 M727 M749 M762
       61   PARDOT-X . . . . . . . . . . .  M241
      138   PASS-COUNTER . . . . . . . . .  M235 267 268
       17   PRG-COLL-SEQ . . . . . . . . .  15
       25   PRINT-FILE . . . . . . . . . .  21 225 231
       26   PRINT-REC. . . . . . . . . . .  M243 M323 M327 M328 M330
       64   RE-MARK. . . . . . . . . . . .  M238 M250
      134   REC-CT . . . . . . . . . . . .  240 242 249
      133   REC-SKL-SUB
      142   RECORD-COUNT . . . . . . . . .  M293 294 M306
       46   TEMP
       65   TEST-COMPUTED. . . . . . . . .  323
       80   TEST-CORRECT . . . . . . . . .  330
      108   TEST-CORRECT-MAX . . . . . . .  328
       94   TEST-CORRECT-MIN . . . . . . .  327
      161   TEST-ID. . . . . . . . . . . .  M226
       53   TEST-RESULTS . . . . . . . . .  M227 243
      139   TOTAL-ERROR
       48   WS-ANUM. . . . . . . . . . . .  M520 M522 523 526 M539 540 543
       47   WS-NUM . . . . . . . . . . . .  M354 M356 357 360 M397 M399 400 401 404 M415 M417 418 421 M432 M434 435 438 M449
                                            M451 452 453 456 M467 M469 470 471 474 M485 M487 488 491 M502 M504 505 506 509
                                            M537 M554 M556 557 560 M571 M573 574 577 M588 M590 591 594 M605 M607 609 612
                                            M623 M627 628 629 632 M644 M648 649 650 653 M665 M669 670 671 674 M686 M690 693
                                            694 697 M709 M713 714 715 718 M730 M734 736 737 740
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    19
0 Defined   Cross-reference of data names   References

0     210   XXCOMPUTED . . . . . . . . . .  M339
      212   XXCORRECT. . . . . . . . . . .  M338
      205   XXINFO . . . . . . . . . . . .  319 341
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    20
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

      334   BAIL-OUT . . . . . . . . . . .  P246
      343   BAIL-OUT-EX. . . . . . . . . .  E246 G336
      337   BAIL-OUT-WRITE . . . . . . . .  G335
      311   BLANK-LINE-PRINT
      764   CCVS-EXIT
      765   CCVS-999999
      223   CCVS1
      344   CCVS1-EXIT . . . . . . . . . .  G229
      230   CLOSE-FILES. . . . . . . . . .  G766
      256   COLUMN-NAMES-ROUTINE . . . . .  E228
      237   DE-LETE. . . . . . . . . . . .  P365 P378 P391 P409 P426 P443 P461 P479 P496 P514 P531 P548 P565 P582 P599 P617
                                            P638 P659 P680 P703 P724 P746 P759
      260   END-ROUTINE. . . . . . . . . .  P231
      264   END-ROUTINE-1
      272   END-ROUTINE-12
      280   END-ROUTINE-13 . . . . . . . .  E231
      262   END-RTN-EXIT
      364   F-MAX-DELETE-01
      377   F-MAX-DELETE-02
      390   F-MAX-DELETE-03
      408   F-MAX-DELETE-04
      425   F-MAX-DELETE-05
      442   F-MAX-DELETE-06
      460   F-MAX-DELETE-07
      478   F-MAX-DELETE-08
      495   F-MAX-DELETE-09
      513   F-MAX-DELETE-10
      530   F-MAX-DELETE-11
      547   F-MAX-DELETE-12
      564   F-MAX-DELETE-13
      581   F-MAX-DELETE-14
      598   F-MAX-DELETE-15
      616   F-MAX-DELETE-17
      637   F-MAX-DELETE-18
      658   F-MAX-DELETE-19
      679   F-MAX-DELETE-20
      702   F-MAX-DELETE-21
      723   F-MAX-DELETE-22
      745   F-MAX-DELETE-23
      758   F-MAX-DELETE-24
      350   F-MAX-INFO
      355   F-MAX-TEST-01
      398   F-MAX-TEST-04
      416   F-MAX-TEST-05
      433   F-MAX-TEST-06
      450   F-MAX-TEST-07
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    21
0 Defined   Cross-reference of procedures   References

0     468   F-MAX-TEST-08
      486   F-MAX-TEST-09
      503   F-MAX-TEST-10
      521   F-MAX-TEST-11
      538   F-MAX-TEST-12
      555   F-MAX-TEST-13
      572   F-MAX-TEST-14
      589   F-MAX-TEST-15
      606   F-MAX-TEST-17
      626   F-MAX-TEST-18
      647   F-MAX-TEST-19
      668   F-MAX-TEST-20
      689   F-MAX-TEST-21
      712   F-MAX-TEST-22
      733   F-MAX-TEST-23
      756   F-MAX-TEST-24. . . . . . . . .  P752
      367   F-MAX-WRITE-01 . . . . . . . .  G363 G366
      380   F-MAX-WRITE-02 . . . . . . . .  G376 G379
      393   F-MAX-WRITE-03 . . . . . . . .  G389 G392
      411   F-MAX-WRITE-04 . . . . . . . .  G407 G410
      428   F-MAX-WRITE-05 . . . . . . . .  G424 G427
      445   F-MAX-WRITE-06 . . . . . . . .  G441 G444
      463   F-MAX-WRITE-07 . . . . . . . .  G459 G462
      481   F-MAX-WRITE-08 . . . . . . . .  G477 G480
      498   F-MAX-WRITE-09 . . . . . . . .  G494 G497
      516   F-MAX-WRITE-10 . . . . . . . .  G512 G515
      533   F-MAX-WRITE-11 . . . . . . . .  G529 G532
      550   F-MAX-WRITE-12 . . . . . . . .  G546 G549
      567   F-MAX-WRITE-13 . . . . . . . .  G563 G566
      584   F-MAX-WRITE-14 . . . . . . . .  G580 G583
      601   F-MAX-WRITE-15 . . . . . . . .  G597 G600
      619   F-MAX-WRITE-17 . . . . . . . .  G615 G618
      640   F-MAX-WRITE-18 . . . . . . . .  G636 G639
      661   F-MAX-WRITE-19 . . . . . . . .  G657 G660
      682   F-MAX-WRITE-20 . . . . . . . .  G678 G681
      705   F-MAX-WRITE-21 . . . . . . . .  G701 G704
      726   F-MAX-WRITE-22 . . . . . . . .  G722 G725
      748   F-MAX-WRITE-23 . . . . . . . .  G744 G747
      761   F-MAX-WRITE-24 . . . . . . . .  G755 G760
      353   F-MAX-01
      370   F-MAX-02
      383   F-MAX-03
      396   F-MAX-04
      414   F-MAX-05
      431   F-MAX-06
      448   F-MAX-07
      466   F-MAX-08
      484   F-MAX-09
      501   F-MAX-10
      519   F-MAX-11
      536   F-MAX-12
      553   F-MAX-13
      570   F-MAX-14
      587   F-MAX-15
      604   F-MAX-17
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    22
0 Defined   Cross-reference of procedures   References

0     622   F-MAX-18
      643   F-MAX-19
      664   F-MAX-20
      685   F-MAX-21
      708   F-MAX-22
      729   F-MAX-23
      751   F-MAX-24
      236   FAIL . . . . . . . . . . . . .  P362 P375 P388 P406 P423 P440 P458 P476 P493 P511 P528 P545 P562 P579 P596 P614
                                            P635 P656 P677 P700 P721 P743
      313   FAIL-ROUTINE . . . . . . . . .  P245
      333   FAIL-ROUTINE-EX. . . . . . . .  E245 G321
      322   FAIL-ROUTINE-WRITE . . . . . .  G315 G316
      251   HEAD-ROUTINE . . . . . . . . .  P228
      234   INSPT
      224   OPEN-FILES
      235   PASS . . . . . . . . . . . . .  P358 P373 P386 P402 P419 P436 P454 P472 P489 P507 P524 P541 P558 P575 P592 P610
                                            P630 P651 P672 P695 P716 P738 P754
      239   PRINT-DETAIL . . . . . . . . .  P369 P382 P395 P413 P430 P447 P465 P483 P500 P518 P535 P552 P569 P586 P603 P621
                                            P642 P663 P684 P707 P728 P750 P763
      349   SECT-IF119A
      232   TERMINATE-CCVS
      292   WRITE-LINE . . . . . . . . . .  P243 P244 P252 P253 P254 P255 P257 P258 P259 P261 P263 P271 P279 P285 P290 P291
                                            P319 P323 P327 P328 P330 P331 P341
      308   WRT-LN . . . . . . . . . . . .  P298 P299 P300 P301 P302 P303 P304 P307 P312
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    23
0 Defined   Cross-reference of programs     References

        3   IF119A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF119A    Date 06/04/2022  Time 11:57:26   Page    24
0LineID  Message code  Message text

     25  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF119A:
 *    Source records = 766
 *    Data Division statements = 103
 *    Procedure Division statements = 425
 *    Generated COBOL statements = 0
 *    Program complexity factor = 437
0End of compilation 1,  program IF119A,  highest severity 0.
0Return code 0
