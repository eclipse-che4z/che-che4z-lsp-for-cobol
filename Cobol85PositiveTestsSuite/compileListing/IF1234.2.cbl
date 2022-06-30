1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:34   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:56:34   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         IF1234.2
   000002         000200 PROGRAM-ID.                                                      IF1234.2
   000003         000300     IF123A.                                                      IF1234.2
   000004         000400                                                                  IF1234.2
   000005         000600*                                                         *       IF1234.2
   000006         000700* This program forms part of the CCVS85 COBOL Test Suite. *       IF1234.2
   000007         000800* It contains tests for the Intrinsic Function MIN.       *       IF1234.2
   000008         000900*                                                         *       IF1234.2
   000009         001100 ENVIRONMENT DIVISION.                                            IF1234.2
   000010         001200 CONFIGURATION SECTION.                                           IF1234.2
   000011         001300 SOURCE-COMPUTER.                                                 IF1234.2
   000012         001400     XXXXX082.                                                    IF1234.2
   000013         001500 OBJECT-COMPUTER.                                                 IF1234.2
   000014         001600     XXXXX083                                                     IF1234.2
   000015         001700     PROGRAM COLLATING SEQUENCE IS PRG-COLL-SEQ.                  IF1234.2 17
   000016         001800 SPECIAL-NAMES.                                                   IF1234.2
   000017         001900     ALPHABET PRG-COLL-SEQ IS                                     IF1234.2
   000018         002000     STANDARD-2.                                                  IF1234.2
   000019         002100 INPUT-OUTPUT SECTION.                                            IF1234.2
   000020         002200 FILE-CONTROL.                                                    IF1234.2
   000021         002300     SELECT PRINT-FILE ASSIGN TO                                  IF1234.2 25
   000022         002400     XXXXX055.                                                    IF1234.2
   000023         002500 DATA DIVISION.                                                   IF1234.2
   000024         002600 FILE SECTION.                                                    IF1234.2
   000025         002700 FD  PRINT-FILE.                                                  IF1234.2

 ==000025==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000026         002800 01  PRINT-REC PICTURE X(120).                                    IF1234.2
   000027         002900 01  DUMMY-RECORD PICTURE X(120).                                 IF1234.2
   000028         003000 WORKING-STORAGE SECTION.                                         IF1234.2
   000029         003200* Variables specific to the Intrinsic Function Test IF123A*       IF1234.2
   000030         003400 01  A                   PIC S9(10)          VALUE 5.             IF1234.2
   000031         003500 01  B                   PIC S9(10)          VALUE 7.             IF1234.2
   000032         003600 01  C                   PIC S9(10)          VALUE -4.            IF1234.2
   000033         003700 01  D                   PIC S9(10)          VALUE 10.            IF1234.2
   000034         003800 01  E                   PIC S9(5)V9(5)      VALUE 34.26.         IF1234.2
   000035         003900 01  F                   PIC S9(5)V9(5)      VALUE -8.32.         IF1234.2
   000036         004000 01  G                   PIC S9(5)V9(5)      VALUE 4.08.          IF1234.2
   000037         004100 01  H                   PIC S9(5)V9(5)      VALUE -5.3.          IF1234.2
   000038         004200 01  I                   PIC X               VALUE "R".           IF1234.2
   000039         004300 01  J                   PIC X               VALUE "U".           IF1234.2
   000040         004400 01  M                   PIC S9(10)          VALUE 1.             IF1234.2
   000041         004500 01  N                   PIC S9(10)          VALUE 3.             IF1234.2
   000042         004600 01  O                   PIC S9(10)          VALUE 5.             IF1234.2
   000043         004700 01  P                   PIC S9(10)          VALUE 1.             IF1234.2
   000044         004800 01  Q                   PIC S9(10)          VALUE 3.             IF1234.2
   000045         004900 01  R                   PIC S9(10)          VALUE 5.             IF1234.2
   000046         005000 01  ARG1                PIC S9(10)          VALUE 15.            IF1234.2
   000047         005100 01  ARR                                     VALUE "40537".       IF1234.2
   000048         005200     02  IND OCCURS 5 TIMES PIC 9.                                IF1234.2
   000049         005300 01  TEMP                PIC S9(10).                              IF1234.2
   000050         005400 01  WS-NUM              PIC S9(5)V9(6).                          IF1234.2
   000051         005500 01  WS-ANUM             PIC X.                                   IF1234.2
   000052         005600 01  MIN-RANGE           PIC S9(5)V9(7).                          IF1234.2
   000053         005700 01  MAX-RANGE           PIC S9(5)V9(7).                          IF1234.2
   000054         005800*                                                                 IF1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         006000*                                                                 IF1234.2
   000056         006100 01  TEST-RESULTS.                                                IF1234.2
   000057         006200     02 FILLER                   PIC X      VALUE SPACE.          IF1234.2 IMP
   000058         006300     02 FEATURE                  PIC X(20)  VALUE SPACE.          IF1234.2 IMP
   000059         006400     02 FILLER                   PIC X      VALUE SPACE.          IF1234.2 IMP
   000060         006500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          IF1234.2 IMP
   000061         006600     02 FILLER                   PIC X      VALUE SPACE.          IF1234.2 IMP
   000062         006700     02  PAR-NAME.                                                IF1234.2
   000063         006800       03 FILLER                 PIC X(19)  VALUE SPACE.          IF1234.2 IMP
   000064         006900       03  PARDOT-X              PIC X      VALUE SPACE.          IF1234.2 IMP
   000065         007000       03 DOTVALUE               PIC 99     VALUE ZERO.           IF1234.2 IMP
   000066         007100     02 FILLER                   PIC X(8)   VALUE SPACE.          IF1234.2 IMP
   000067         007200     02 RE-MARK                  PIC X(61).                       IF1234.2
   000068         007300 01  TEST-COMPUTED.                                               IF1234.2
   000069         007400     02 FILLER                   PIC X(30)  VALUE SPACE.          IF1234.2 IMP
   000070         007500     02 FILLER                   PIC X(17)  VALUE                 IF1234.2
   000071         007600            "       COMPUTED=".                                   IF1234.2
   000072         007700     02 COMPUTED-X.                                               IF1234.2
   000073         007800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          IF1234.2 IMP
   000074         007900     03 COMPUTED-N               REDEFINES COMPUTED-A             IF1234.2 73
   000075         008000                                 PIC -9(9).9(9).                  IF1234.2
   000076         008100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         IF1234.2 73
   000077         008200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     IF1234.2 73
   000078         008300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     IF1234.2 73
   000079         008400     03       CM-18V0 REDEFINES COMPUTED-A.                       IF1234.2 73
   000080         008500         04 COMPUTED-18V0                    PIC -9(18).          IF1234.2
   000081         008600         04 FILLER                           PIC X.               IF1234.2
   000082         008700     03 FILLER PIC X(50) VALUE SPACE.                             IF1234.2 IMP
   000083         008800 01  TEST-CORRECT.                                                IF1234.2
   000084         008900     02 FILLER PIC X(30) VALUE SPACE.                             IF1234.2 IMP
   000085         009000     02 FILLER PIC X(17) VALUE "       CORRECT =".                IF1234.2
   000086         009100     02 CORRECT-X.                                                IF1234.2
   000087         009200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         IF1234.2 IMP
   000088         009300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      IF1234.2 87
   000089         009400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         IF1234.2 87
   000090         009500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     IF1234.2 87
   000091         009600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     IF1234.2 87
   000092         009700     03      CR-18V0 REDEFINES CORRECT-A.                         IF1234.2 87
   000093         009800         04 CORRECT-18V0                     PIC -9(18).          IF1234.2
   000094         009900         04 FILLER                           PIC X.               IF1234.2
   000095         010000     03 FILLER PIC X(2) VALUE SPACE.                              IF1234.2 IMP
   000096         010100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     IF1234.2 IMP
   000097         010200 01  TEST-CORRECT-MIN.                                            IF1234.2
   000098         010300     02 FILLER PIC X(30) VALUE SPACE.                             IF1234.2 IMP
   000099         010400     02 FILLER PIC X(17) VALUE "     MIN VALUE =".                IF1234.2
   000100         010500     02 CORRECTMI-X.                                              IF1234.2
   000101         010600     03 CORRECTMI-A                 PIC X(20) VALUE SPACE.        IF1234.2 IMP
   000102         010700     03 CORRECT-MIN    REDEFINES CORRECTMI-A     PIC -9(9).9(9).  IF1234.2 101
   000103         010800     03 CORRECTMI-0V18 REDEFINES CORRECTMI-A     PIC -.9(18).     IF1234.2 101
   000104         010900     03 CORRECTMI-4V14 REDEFINES CORRECTMI-A     PIC -9(4).9(14). IF1234.2 101
   000105         011000     03 CORRECTMI-14V4 REDEFINES CORRECTMI-A     PIC -9(14).9(4). IF1234.2 101
   000106         011100     03      CR-18V0 REDEFINES CORRECTMI-A.                       IF1234.2 101
   000107         011200         04 CORRECTMI-18V0                     PIC -9(18).        IF1234.2
   000108         011300         04 FILLER                           PIC X.               IF1234.2
   000109         011400     03 FILLER PIC X(2) VALUE SPACE.                              IF1234.2 IMP
   000110         011500     03 FILLER                           PIC X(48) VALUE SPACE.   IF1234.2 IMP
   000111         011600 01  TEST-CORRECT-MAX.                                            IF1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011700     02 FILLER PIC X(30) VALUE SPACE.                             IF1234.2 IMP
   000113         011800     02 FILLER PIC X(17) VALUE "     MAX VALUE =".                IF1234.2
   000114         011900     02 CORRECTMA-X.                                              IF1234.2
   000115         012000     03 CORRECTMA-A                  PIC X(20) VALUE SPACE.       IF1234.2 IMP
   000116         012100     03 CORRECT-MAX    REDEFINES CORRECTMA-A     PIC -9(9).9(9).  IF1234.2 115
   000117         012200     03 CORRECTMA-0V18 REDEFINES CORRECTMA-A     PIC -.9(18).     IF1234.2 115
   000118         012300     03 CORRECTMA-4V14 REDEFINES CORRECTMA-A     PIC -9(4).9(14). IF1234.2 115
   000119         012400     03 CORRECTMA-14V4 REDEFINES CORRECTMA-A     PIC -9(14).9(4). IF1234.2 115
   000120         012500     03      CR-18V0 REDEFINES CORRECTMA-A.                       IF1234.2 115
   000121         012600         04 CORRECTMA-18V0                     PIC -9(18).        IF1234.2
   000122         012700         04 FILLER                           PIC X.               IF1234.2
   000123         012800     03 FILLER PIC X(2) VALUE SPACE.                              IF1234.2 IMP
   000124         012900     03 CORMA-ANSI-REFERENCE             PIC X(48) VALUE SPACE.   IF1234.2 IMP
   000125         013000 01  CCVS-C-1.                                                    IF1234.2
   000126         013100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PAIF1234.2
   000127         013200-    "SS  PARAGRAPH-NAME                                          IF1234.2
   000128         013300-    "       REMARKS".                                            IF1234.2
   000129         013400     02 FILLER                     PIC X(20)    VALUE SPACE.      IF1234.2 IMP
   000130         013500 01  CCVS-C-2.                                                    IF1234.2
   000131         013600     02 FILLER                     PIC X        VALUE SPACE.      IF1234.2 IMP
   000132         013700     02 FILLER                     PIC X(6)     VALUE "TESTED".   IF1234.2
   000133         013800     02 FILLER                     PIC X(15)    VALUE SPACE.      IF1234.2 IMP
   000134         013900     02 FILLER                     PIC X(4)     VALUE "FAIL".     IF1234.2
   000135         014000     02 FILLER                     PIC X(94)    VALUE SPACE.      IF1234.2 IMP
   000136         014100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       IF1234.2 IMP
   000137         014200 01  REC-CT                        PIC 99       VALUE ZERO.       IF1234.2 IMP
   000138         014300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       IF1234.2 IMP
   000139         014400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       IF1234.2 IMP
   000140         014500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       IF1234.2 IMP
   000141         014600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       IF1234.2 IMP
   000142         014700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       IF1234.2 IMP
   000143         014800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       IF1234.2 IMP
   000144         014900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      IF1234.2 IMP
   000145         015000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       IF1234.2 IMP
   000146         015100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     IF1234.2 IMP
   000147         015200 01  CCVS-H-1.                                                    IF1234.2
   000148         015300     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1234.2 IMP
   000149         015400     02  FILLER                    PIC X(42)    VALUE             IF1234.2
   000150         015500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 IF1234.2
   000151         015600     02  FILLER                    PIC X(39)    VALUE SPACES.     IF1234.2 IMP
   000152         015700 01  CCVS-H-2A.                                                   IF1234.2
   000153         015800   02  FILLER                        PIC X(40)  VALUE SPACE.      IF1234.2 IMP
   000154         015900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  IF1234.2
   000155         016000   02  FILLER                        PIC XXXX   VALUE             IF1234.2
   000156         016100     "4.2 ".                                                      IF1234.2
   000157         016200   02  FILLER                        PIC X(28)  VALUE             IF1234.2
   000158         016300            " COPY - NOT FOR DISTRIBUTION".                       IF1234.2
   000159         016400   02  FILLER                        PIC X(41)  VALUE SPACE.      IF1234.2 IMP
   000160         016500                                                                  IF1234.2
   000161         016600 01  CCVS-H-2B.                                                   IF1234.2
   000162         016700   02  FILLER                        PIC X(15)  VALUE             IF1234.2
   000163         016800            "TEST RESULT OF ".                                    IF1234.2
   000164         016900   02  TEST-ID                       PIC X(9).                    IF1234.2
   000165         017000   02  FILLER                        PIC X(4)   VALUE             IF1234.2
   000166         017100            " IN ".                                               IF1234.2
   000167         017200   02  FILLER                        PIC X(12)  VALUE             IF1234.2
   000168         017300     " HIGH       ".                                              IF1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017400   02  FILLER                        PIC X(22)  VALUE             IF1234.2
   000170         017500            " LEVEL VALIDATION FOR ".                             IF1234.2
   000171         017600   02  FILLER                        PIC X(58)  VALUE             IF1234.2
   000172         017700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1234.2
   000173         017800 01  CCVS-H-3.                                                    IF1234.2
   000174         017900     02  FILLER                      PIC X(34)  VALUE             IF1234.2
   000175         018000            " FOR OFFICIAL USE ONLY    ".                         IF1234.2
   000176         018100     02  FILLER                      PIC X(58)  VALUE             IF1234.2
   000177         018200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".IF1234.2
   000178         018300     02  FILLER                      PIC X(28)  VALUE             IF1234.2
   000179         018400            "  COPYRIGHT   1985 ".                                IF1234.2
   000180         018500 01  CCVS-E-1.                                                    IF1234.2
   000181         018600     02 FILLER                       PIC X(52)  VALUE SPACE.      IF1234.2 IMP
   000182         018700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              IF1234.2
   000183         018800     02 ID-AGAIN                     PIC X(9).                    IF1234.2
   000184         018900     02 FILLER                       PIC X(45)  VALUE SPACES.     IF1234.2 IMP
   000185         019000 01  CCVS-E-2.                                                    IF1234.2
   000186         019100     02  FILLER                      PIC X(31)  VALUE SPACE.      IF1234.2 IMP
   000187         019200     02  FILLER                      PIC X(21)  VALUE SPACE.      IF1234.2 IMP
   000188         019300     02 CCVS-E-2-2.                                               IF1234.2
   000189         019400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      IF1234.2 IMP
   000190         019500         03 FILLER                   PIC X      VALUE SPACE.      IF1234.2 IMP
   000191         019600         03 ENDER-DESC               PIC X(44)  VALUE             IF1234.2
   000192         019700            "ERRORS ENCOUNTERED".                                 IF1234.2
   000193         019800 01  CCVS-E-3.                                                    IF1234.2
   000194         019900     02  FILLER                      PIC X(22)  VALUE             IF1234.2
   000195         020000            " FOR OFFICIAL USE ONLY".                             IF1234.2
   000196         020100     02  FILLER                      PIC X(12)  VALUE SPACE.      IF1234.2 IMP
   000197         020200     02  FILLER                      PIC X(58)  VALUE             IF1234.2
   000198         020300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".IF1234.2
   000199         020400     02  FILLER                      PIC X(13)  VALUE SPACE.      IF1234.2 IMP
   000200         020500     02 FILLER                       PIC X(15)  VALUE             IF1234.2
   000201         020600             " COPYRIGHT 1985".                                   IF1234.2
   000202         020700 01  CCVS-E-4.                                                    IF1234.2
   000203         020800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      IF1234.2 IMP
   000204         020900     02 FILLER                       PIC X(4)   VALUE " OF ".     IF1234.2
   000205         021000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      IF1234.2 IMP
   000206         021100     02 FILLER                       PIC X(40)  VALUE             IF1234.2
   000207         021200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       IF1234.2
   000208         021300 01  XXINFO.                                                      IF1234.2
   000209         021400     02 FILLER                       PIC X(19)  VALUE             IF1234.2
   000210         021500            "*** INFORMATION ***".                                IF1234.2
   000211         021600     02 INFO-TEXT.                                                IF1234.2
   000212         021700       04 FILLER                     PIC X(8)   VALUE SPACE.      IF1234.2 IMP
   000213         021800       04 XXCOMPUTED                 PIC X(20).                   IF1234.2
   000214         021900       04 FILLER                     PIC X(5)   VALUE SPACE.      IF1234.2 IMP
   000215         022000       04 XXCORRECT                  PIC X(20).                   IF1234.2
   000216         022100     02 INF-ANSI-REFERENCE           PIC X(48).                   IF1234.2
   000217         022200 01  HYPHEN-LINE.                                                 IF1234.2
   000218         022300     02 FILLER  PIC IS X VALUE IS SPACE.                          IF1234.2 IMP
   000219         022400     02 FILLER  PIC IS X(65)    VALUE IS "************************IF1234.2
   000220         022500-    "*****************************************".                 IF1234.2
   000221         022600     02 FILLER  PIC IS X(54)    VALUE IS "************************IF1234.2
   000222         022700-    "******************************".                            IF1234.2
   000223         022800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             IF1234.2
   000224         022900     "IF123A".                                                    IF1234.2
   000225         023000 PROCEDURE DIVISION.                                              IF1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023100 CCVS1 SECTION.                                                   IF1234.2
   000227         023200 OPEN-FILES.                                                      IF1234.2
   000228         023300     OPEN     OUTPUT PRINT-FILE.                                  IF1234.2 25
   000229         023400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   IF1234.2 223 164 223 183
   000230         023500     MOVE    SPACE TO TEST-RESULTS.                               IF1234.2 IMP 56
   000231         023600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             IF1234.2 254 259
   000232         023700     GO TO CCVS1-EXIT.                                            IF1234.2 347
   000233         023800 CLOSE-FILES.                                                     IF1234.2
   000234         023900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   IF1234.2 263 283 25
   000235         024000 TERMINATE-CCVS.                                                  IF1234.2
   000236         024100     STOP     RUN.                                                IF1234.2
   000237         024200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         IF1234.2 60 140
   000238         024300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           IF1234.2 60 141
   000239         024400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          IF1234.2 60 139
   000240         024500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      IF1234.2 60 138
   000241         024600     MOVE "****TEST DELETED****" TO RE-MARK.                      IF1234.2 67
   000242         024700 PRINT-DETAIL.                                                    IF1234.2
   000243         024800     IF REC-CT NOT EQUAL TO ZERO                                  IF1234.2 137 IMP
   000244      1  024900             MOVE "." TO PARDOT-X                                 IF1234.2 64
   000245      1  025000             MOVE REC-CT TO DOTVALUE.                             IF1234.2 137 65
   000246         025100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      IF1234.2 56 26 295
   000247         025200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               IF1234.2 60 295
   000248      1  025300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 IF1234.2 316 336
   000249      1  025400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 IF1234.2 337 346
   000250         025500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              IF1234.2 IMP 60 IMP 72
   000251         025600     MOVE SPACE TO CORRECT-X.                                     IF1234.2 IMP 86
   000252         025700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         IF1234.2 137 IMP IMP 62
   000253         025800     MOVE     SPACE TO RE-MARK.                                   IF1234.2 IMP 67
   000254         025900 HEAD-ROUTINE.                                                    IF1234.2
   000255         026000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1234.2 147 27 295
   000256         026100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  IF1234.2 152 27 295
   000257         026200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1234.2 161 27 295
   000258         026300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  IF1234.2 173 27 295
   000259         026400 COLUMN-NAMES-ROUTINE.                                            IF1234.2
   000260         026500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1234.2 125 27 295
   000261         026600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1234.2 130 27 295
   000262         026700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        IF1234.2 217 27 295
   000263         026800 END-ROUTINE.                                                     IF1234.2
   000264         026900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.IF1234.2 217 27 295
   000265         027000 END-RTN-EXIT.                                                    IF1234.2
   000266         027100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1234.2 180 27 295
   000267         027200 END-ROUTINE-1.                                                   IF1234.2
   000268         027300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      IF1234.2 139 143 140
   000269         027400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               IF1234.2 143 138 143
   000270         027500      ADD PASS-COUNTER TO ERROR-HOLD.                             IF1234.2 141 143
   000271         027600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            IF1234.2 141 203
   000272         027700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              IF1234.2 143 205
   000273         027800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                IF1234.2 202 188
   000274         027900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           IF1234.2 185 27 295
   000275         028000  END-ROUTINE-12.                                                 IF1234.2
   000276         028100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        IF1234.2 191
   000277         028200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      IF1234.2 139 IMP
   000278      1  028300         MOVE "NO " TO ERROR-TOTAL                                IF1234.2 189
   000279         028400         ELSE                                                     IF1234.2
   000280      1  028500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       IF1234.2 139 189
   000281         028600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           IF1234.2 185 27
   000282         028700     PERFORM WRITE-LINE.                                          IF1234.2 295
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028800 END-ROUTINE-13.                                                  IF1234.2
   000284         028900     IF DELETE-COUNTER IS EQUAL TO ZERO                           IF1234.2 138 IMP
   000285      1  029000         MOVE "NO " TO ERROR-TOTAL  ELSE                          IF1234.2 189
   000286      1  029100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      IF1234.2 138 189
   000287         029200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   IF1234.2 191
   000288         029300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1234.2 185 27 295
   000289         029400      IF   INSPECT-COUNTER EQUAL TO ZERO                          IF1234.2 140 IMP
   000290      1  029500          MOVE "NO " TO ERROR-TOTAL                               IF1234.2 189
   000291      1  029600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   IF1234.2 140 189
   000292         029700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            IF1234.2 191
   000293         029800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          IF1234.2 185 27 295
   000294         029900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           IF1234.2 193 27 295
   000295         030000 WRITE-LINE.                                                      IF1234.2
   000296         030100     ADD 1 TO RECORD-COUNT.                                       IF1234.2 145
   000297         030200     IF RECORD-COUNT GREATER 42                                   IF1234.2 145
   000298      1  030300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          IF1234.2 27 144
   000299      1  030400         MOVE SPACE TO DUMMY-RECORD                               IF1234.2 IMP 27
   000300      1  030500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  IF1234.2 27
   000301      1  030600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1234.2 147 27 311
   000302      1  030700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   IF1234.2 152 27 311
   000303      1  030800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1234.2 161 27 311
   000304      1  030900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   IF1234.2 173 27 311
   000305      1  031000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           IF1234.2 125 27 311
   000306      1  031100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           IF1234.2 130 27 311
   000307      1  031200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          IF1234.2 217 27 311
   000308      1  031300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          IF1234.2 144 27
   000309      1  031400         MOVE ZERO TO RECORD-COUNT.                               IF1234.2 IMP 145
   000310         031500     PERFORM WRT-LN.                                              IF1234.2 311
   000311         031600 WRT-LN.                                                          IF1234.2
   000312         031700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               IF1234.2 27
   000313         031800     MOVE SPACE TO DUMMY-RECORD.                                  IF1234.2 IMP 27
   000314         031900 BLANK-LINE-PRINT.                                                IF1234.2
   000315         032000     PERFORM WRT-LN.                                              IF1234.2 311
   000316         032100 FAIL-ROUTINE.                                                    IF1234.2
   000317         032200     IF     COMPUTED-X NOT EQUAL TO SPACE                         IF1234.2 72 IMP
   000318      1  032300            GO TO FAIL-ROUTINE-WRITE.                             IF1234.2 325
   000319         032400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.IF1234.2 86 IMP 325
   000320         032500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1234.2 146 216
   000321         032600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   IF1234.2 211
   000322         032700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1234.2 208 27 295
   000323         032800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1234.2 IMP 216
   000324         032900     GO TO  FAIL-ROUTINE-EX.                                      IF1234.2 336
   000325         033000 FAIL-ROUTINE-WRITE.                                              IF1234.2
   000326         033100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE.        IF1234.2 68 26 295
   000327         033200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE                  IF1234.2 146 96
   000328         033300                              CORMA-ANSI-REFERENCE.               IF1234.2 124
   000329         033400     IF CORRECT-MIN NOT EQUAL TO SPACES THEN                      IF1234.2 102 IMP
   000330      1  033500           MOVE TEST-CORRECT-MIN TO PRINT-REC PERFORM WRITE-LINE  IF1234.2 97 26 295
   000331      1  033600           MOVE TEST-CORRECT-MAX TO PRINT-REC PERFORM WRITE-LINE  IF1234.2 111 26 295
   000332         033700     ELSE                                                         IF1234.2
   000333      1  033800           MOVE TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE.     IF1234.2 83 26 295
   000334         033900     PERFORM WRITE-LINE.                                          IF1234.2 295
   000335         034000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         IF1234.2 IMP 96
   000336         034100 FAIL-ROUTINE-EX. EXIT.                                           IF1234.2
   000337         034200 BAIL-OUT.                                                        IF1234.2
   000338         034300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   IF1234.2 73 IMP 340
   000339         034400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           IF1234.2 87 IMP 346
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034500 BAIL-OUT-WRITE.                                                  IF1234.2
   000341         034600     MOVE CORRECT-A TO XXCORRECT.                                 IF1234.2 87 215
   000342         034700     MOVE COMPUTED-A TO XXCOMPUTED.                               IF1234.2 73 213
   000343         034800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 IF1234.2 146 216
   000344         034900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   IF1234.2 208 27 295
   000345         035000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         IF1234.2 IMP 216
   000346         035100 BAIL-OUT-EX. EXIT.                                               IF1234.2
   000347         035200 CCVS1-EXIT.                                                      IF1234.2
   000348         035300     EXIT.                                                        IF1234.2
   000349         035500*                                                      *          IF1234.2
   000350         035600*    Intrinsic Function Tests         IF123A - MIN     *          IF1234.2
   000351         035700*                                                      *          IF1234.2
   000352         035900 SECT-IF123A SECTION.                                             IF1234.2
   000353         036000 F-MIN-INFO.                                                      IF1234.2
   000354         036100     MOVE     "See ref. A-56 2.27" TO ANSI-REFERENCE.             IF1234.2 146
   000355         036200     MOVE     "MIN Function" TO FEATURE.                          IF1234.2 58
   000356         036400 F-MIN-01.                                                        IF1234.2
   000357         036500     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000358         036600 F-MIN-TEST-01.                                                   IF1234.2
   000359         036700     COMPUTE WS-NUM = FUNCTION MIN(5, 6, 10, 3, 7).               IF1234.2 50 IFN
   000360         036800     IF WS-NUM = 3 THEN                                           IF1234.2 50
   000361      1  036900                    PERFORM PASS                                  IF1234.2 238
   000362         037000     ELSE                                                         IF1234.2
   000363      1  037100                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000364      1  037200                    MOVE 3 TO CORRECT-N                           IF1234.2 88
   000365      1  037300                    PERFORM FAIL.                                 IF1234.2 239
   000366         037400     GO TO F-MIN-WRITE-01.                                        IF1234.2 370
   000367         037500 F-MIN-DELETE-01.                                                 IF1234.2
   000368         037600     PERFORM  DE-LETE.                                            IF1234.2 240
   000369         037700     GO TO    F-MIN-WRITE-01.                                     IF1234.2 370
   000370         037800 F-MIN-WRITE-01.                                                  IF1234.2
   000371         037900     MOVE "F-MIN-01" TO PAR-NAME.                                 IF1234.2 62
   000372         038000     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000373         038200 F-MIN-02.                                                        IF1234.2
   000374         038300     EVALUATE FUNCTION MIN(-4, 7, 2304, 3, -8)                    IF1234.2 IFN
   000375         038400     WHEN -8                                                      IF1234.2
   000376      1  038500                    PERFORM PASS                                  IF1234.2 238
   000377         038600     WHEN OTHER                                                   IF1234.2
   000378      1  038700                    PERFORM FAIL.                                 IF1234.2 239
   000379         038800     GO TO F-MIN-WRITE-02.                                        IF1234.2 383
   000380         038900 F-MIN-DELETE-02.                                                 IF1234.2
   000381         039000     PERFORM  DE-LETE.                                            IF1234.2 240
   000382         039100     GO TO    F-MIN-WRITE-02.                                     IF1234.2 383
   000383         039200 F-MIN-WRITE-02.                                                  IF1234.2
   000384         039300     MOVE "F-MIN-02" TO PAR-NAME.                                 IF1234.2 62
   000385         039400     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000386         039600 F-MIN-03.                                                        IF1234.2
   000387         039700     IF (FUNCTION MIN(4.3, 2.6, 7.3, 9.1) >= 2.59995) AND         IF1234.2 IFN
   000388         039800        (FUNCTION MIN(4.3, 2.6, 7.3, 9.1) <= 2.60005) THEN        IF1234.2 IFN
   000389      1  039900                    PERFORM PASS                                  IF1234.2 238
   000390         040000     ELSE                                                         IF1234.2
   000391      1  040100                    PERFORM FAIL.                                 IF1234.2 239
   000392         040200     GO TO F-MIN-WRITE-03.                                        IF1234.2 396
   000393         040300 F-MIN-DELETE-03.                                                 IF1234.2
   000394         040400     PERFORM  DE-LETE.                                            IF1234.2 240
   000395         040500     GO TO    F-MIN-WRITE-03.                                     IF1234.2 396
   000396         040600 F-MIN-WRITE-03.                                                  IF1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040700     MOVE "F-MIN-03" TO PAR-NAME.                                 IF1234.2 62
   000398         040800     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000399         041000 F-MIN-04.                                                        IF1234.2
   000400         041100     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000401         041200 F-MIN-TEST-04.                                                   IF1234.2
   000402         041300     COMPUTE WS-NUM = FUNCTION MIN(-4.3, 10.2, -0.7, 3.9).        IF1234.2 50 IFN
   000403         041400     IF (WS-NUM >= -4.30009) AND                                  IF1234.2 50
   000404         041500        (WS-NUM <= -4.29991)                                      IF1234.2 50
   000405      1  041600                    PERFORM PASS                                  IF1234.2 238
   000406         041700     ELSE                                                         IF1234.2
   000407      1  041800                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000408      1  041900                    MOVE -4.3 TO CORRECT-N                        IF1234.2 88
   000409      1  042000                    PERFORM FAIL.                                 IF1234.2 239
   000410         042100     GO TO F-MIN-WRITE-04.                                        IF1234.2 414
   000411         042200 F-MIN-DELETE-04.                                                 IF1234.2
   000412         042300     PERFORM  DE-LETE.                                            IF1234.2 240
   000413         042400     GO TO    F-MIN-WRITE-04.                                     IF1234.2 414
   000414         042500 F-MIN-WRITE-04.                                                  IF1234.2
   000415         042600     MOVE "F-MIN-04" TO PAR-NAME.                                 IF1234.2 62
   000416         042700     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000417         042900 F-MIN-05.                                                        IF1234.2
   000418         043000     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000419         043100 F-MIN-TEST-05.                                                   IF1234.2
   000420         043200     COMPUTE WS-NUM = FUNCTION MIN(A, B, D).                      IF1234.2 50 IFN 30 31 33
   000421         043300     IF WS-NUM = 5 THEN                                           IF1234.2 50
   000422      1  043400                    PERFORM PASS                                  IF1234.2 238
   000423         043500     ELSE                                                         IF1234.2
   000424      1  043600                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000425      1  043700                    MOVE 5 TO CORRECT-N                           IF1234.2 88
   000426      1  043800                    PERFORM FAIL.                                 IF1234.2 239
   000427         043900     GO TO F-MIN-WRITE-05.                                        IF1234.2 431
   000428         044000 F-MIN-DELETE-05.                                                 IF1234.2
   000429         044100     PERFORM  DE-LETE.                                            IF1234.2 240
   000430         044200     GO TO    F-MIN-WRITE-05.                                     IF1234.2 431
   000431         044300 F-MIN-WRITE-05.                                                  IF1234.2
   000432         044400     MOVE "F-MIN-05" TO PAR-NAME.                                 IF1234.2 62
   000433         044500     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000434         044700 F-MIN-06.                                                        IF1234.2
   000435         044800     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000436         044900 F-MIN-TEST-06.                                                   IF1234.2
   000437         045000     COMPUTE WS-NUM = FUNCTION MIN(A, B, C, D).                   IF1234.2 50 IFN 30 31 32 33
   000438         045100     IF WS-NUM = -4 THEN                                          IF1234.2 50
   000439      1  045200                    PERFORM PASS                                  IF1234.2 238
   000440         045300     ELSE                                                         IF1234.2
   000441      1  045400                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000442      1  045500                    MOVE -4 TO CORRECT-N                          IF1234.2 88
   000443      1  045600                    PERFORM FAIL.                                 IF1234.2 239
   000444         045700     GO TO F-MIN-WRITE-06.                                        IF1234.2 448
   000445         045800 F-MIN-DELETE-06.                                                 IF1234.2
   000446         045900     PERFORM  DE-LETE.                                            IF1234.2 240
   000447         046000     GO TO    F-MIN-WRITE-06.                                     IF1234.2 448
   000448         046100 F-MIN-WRITE-06.                                                  IF1234.2
   000449         046200     MOVE "F-MIN-06" TO PAR-NAME.                                 IF1234.2 62
   000450         046300     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000451         046500 F-MIN-07.                                                        IF1234.2
   000452         046600     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000453         046700 F-MIN-TEST-07.                                                   IF1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046800     COMPUTE WS-NUM = FUNCTION MIN(E, G).                         IF1234.2 50 IFN 34 36
   000455         046900     IF (WS-NUM >= 4.07992) AND                                   IF1234.2 50
   000456         047000        (WS-NUM <= 4.08008)                                       IF1234.2 50
   000457      1  047100                    PERFORM PASS                                  IF1234.2 238
   000458         047200     ELSE                                                         IF1234.2
   000459      1  047300                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000460      1  047400                    MOVE 4.08 TO CORRECT-N                        IF1234.2 88
   000461      1  047500                    PERFORM FAIL.                                 IF1234.2 239
   000462         047600     GO TO F-MIN-WRITE-07.                                        IF1234.2 466
   000463         047700 F-MIN-DELETE-07.                                                 IF1234.2
   000464         047800     PERFORM  DE-LETE.                                            IF1234.2 240
   000465         047900     GO TO    F-MIN-WRITE-07.                                     IF1234.2 466
   000466         048000 F-MIN-WRITE-07.                                                  IF1234.2
   000467         048100     MOVE "F-MIN-07" TO PAR-NAME.                                 IF1234.2 62
   000468         048200     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000469         048400 F-MIN-08.                                                        IF1234.2
   000470         048500     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000471         048600 F-MIN-TEST-08.                                                   IF1234.2
   000472         048700     COMPUTE WS-NUM = FUNCTION MIN(E, F, G, H).                   IF1234.2 50 IFN 34 35 36 37
   000473         048800     IF (WS-NUM >= -8.32017) AND                                  IF1234.2 50
   000474         048900        (WS-NUM <= -8.31983)                                      IF1234.2 50
   000475      1  049000                    PERFORM PASS                                  IF1234.2 238
   000476         049100     ELSE                                                         IF1234.2
   000477      1  049200                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000478      1  049300                    MOVE -8.32 TO CORRECT-N                       IF1234.2 88
   000479      1  049400                    PERFORM FAIL.                                 IF1234.2 239
   000480         049500     GO TO F-MIN-WRITE-08.                                        IF1234.2 484
   000481         049600 F-MIN-DELETE-08.                                                 IF1234.2
   000482         049700     PERFORM  DE-LETE.                                            IF1234.2 240
   000483         049800     GO TO    F-MIN-WRITE-08.                                     IF1234.2 484
   000484         049900 F-MIN-WRITE-08.                                                  IF1234.2
   000485         050000     MOVE "F-MIN-08" TO PAR-NAME.                                 IF1234.2 62
   000486         050100     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000487         050300 F-MIN-09.                                                        IF1234.2
   000488         050400     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000489         050500 F-MIN-TEST-09.                                                   IF1234.2
   000490         050600     COMPUTE WS-NUM = FUNCTION MIN(A, 4, 8, -10, C, 0).           IF1234.2 50 IFN 30 32
   000491         050700     IF WS-NUM = -10 THEN                                         IF1234.2 50
   000492      1  050800                    PERFORM PASS                                  IF1234.2 238
   000493         050900     ELSE                                                         IF1234.2
   000494      1  051000                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000495      1  051100                    MOVE -10 TO CORRECT-N                         IF1234.2 88
   000496      1  051200                    PERFORM FAIL.                                 IF1234.2 239
   000497         051300     GO TO F-MIN-WRITE-09.                                        IF1234.2 501
   000498         051400 F-MIN-DELETE-09.                                                 IF1234.2
   000499         051500     PERFORM  DE-LETE.                                            IF1234.2 240
   000500         051600     GO TO    F-MIN-WRITE-09.                                     IF1234.2 501
   000501         051700 F-MIN-WRITE-09.                                                  IF1234.2
   000502         051800     MOVE "F-MIN-09" TO PAR-NAME.                                 IF1234.2 62
   000503         051900     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000504         052100 F-MIN-10.                                                        IF1234.2
   000505         052200     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000506         052300 F-MIN-TEST-10.                                                   IF1234.2
   000507         052400     COMPUTE WS-NUM = FUNCTION MIN(4, D, E, 6.3, -2.0).           IF1234.2 50 IFN 33 34
   000508         052500     IF (WS-NUM >= -2.00004) AND                                  IF1234.2 50
   000509         052600        (WS-NUM <= -1.99996)                                      IF1234.2 50
   000510      1  052700                    PERFORM PASS                                  IF1234.2 238
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         052800     ELSE                                                         IF1234.2
   000512      1  052900                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000513      1  053000                    MOVE -2.0 TO CORRECT-N                        IF1234.2 88
   000514      1  053100                    PERFORM FAIL.                                 IF1234.2 239
   000515         053200     GO TO F-MIN-WRITE-10.                                        IF1234.2 519
   000516         053300 F-MIN-DELETE-10.                                                 IF1234.2
   000517         053400     PERFORM  DE-LETE.                                            IF1234.2 240
   000518         053500     GO TO    F-MIN-WRITE-10.                                     IF1234.2 519
   000519         053600 F-MIN-WRITE-10.                                                  IF1234.2
   000520         053700     MOVE "F-MIN-10" TO PAR-NAME.                                 IF1234.2 62
   000521         053800     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000522         054000 F-MIN-11.                                                        IF1234.2
   000523         054100     MOVE SPACES TO WS-ANUM.                                      IF1234.2 IMP 51
   000524         054200 F-MIN-TEST-11.                                                   IF1234.2
   000525         054300     MOVE FUNCTION MIN("R", I, "I", "a") TO WS-ANUM.              IF1234.2 IFN 38 51
   000526         054400     IF WS-ANUM = "I" THEN                                        IF1234.2 51
   000527      1  054500                    PERFORM PASS                                  IF1234.2 238
   000528         054600     ELSE                                                         IF1234.2
   000529      1  054700                    MOVE WS-ANUM TO COMPUTED-A                    IF1234.2 51 73
   000530      1  054800                    MOVE "I" TO CORRECT-A                         IF1234.2 87
   000531      1  054900                    PERFORM FAIL.                                 IF1234.2 239
   000532         055000     GO TO F-MIN-WRITE-11.                                        IF1234.2 536
   000533         055100 F-MIN-DELETE-11.                                                 IF1234.2
   000534         055200     PERFORM  DE-LETE.                                            IF1234.2 240
   000535         055300     GO TO    F-MIN-WRITE-11.                                     IF1234.2 536
   000536         055400 F-MIN-WRITE-11.                                                  IF1234.2
   000537         055500     MOVE "F-MIN-11" TO PAR-NAME.                                 IF1234.2 62
   000538         055600     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000539         055800 F-MIN-12.                                                        IF1234.2
   000540         055900     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000541         056000 F-MIN-TEST-12.                                                   IF1234.2
   000542         056100     MOVE FUNCTION MIN("a", J, "J") TO WS-ANUM.                   IF1234.2 IFN 39 51
   000543         056200     IF WS-ANUM = "J" THEN                                        IF1234.2 51
   000544      1  056300                    PERFORM PASS                                  IF1234.2 238
   000545         056400     ELSE                                                         IF1234.2
   000546      1  056500                    MOVE WS-ANUM TO COMPUTED-A                    IF1234.2 51 73
   000547      1  056600                    MOVE "J" TO CORRECT-A                         IF1234.2 87
   000548      1  056700                    PERFORM FAIL.                                 IF1234.2 239
   000549         056800     GO TO F-MIN-WRITE-12.                                        IF1234.2 553
   000550         056900 F-MIN-DELETE-12.                                                 IF1234.2
   000551         057000     PERFORM  DE-LETE.                                            IF1234.2 240
   000552         057100     GO TO    F-MIN-WRITE-12.                                     IF1234.2 553
   000553         057200 F-MIN-WRITE-12.                                                  IF1234.2
   000554         057300     MOVE "F-MIN-12" TO PAR-NAME.                                 IF1234.2 62
   000555         057400     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000556         057600 F-MIN-13.                                                        IF1234.2
   000557         057700     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000558         057800 F-MIN-TEST-13.                                                   IF1234.2
   000559         057900     COMPUTE WS-NUM = FUNCTION MIN(IND(1), IND(2), IND(3)).       IF1234.2 50 IFN 48 48 48
   000560         058000     IF WS-NUM = 0 THEN                                           IF1234.2 50
   000561      1  058100                    PERFORM PASS                                  IF1234.2 238
   000562         058200     ELSE                                                         IF1234.2
   000563      1  058300                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000564      1  058400                    MOVE 0 TO CORRECT-N                           IF1234.2 88
   000565      1  058500                    PERFORM FAIL.                                 IF1234.2 239
   000566         058600     GO TO F-MIN-WRITE-13.                                        IF1234.2 570
   000567         058700 F-MIN-DELETE-13.                                                 IF1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         058800     PERFORM  DE-LETE.                                            IF1234.2 240
   000569         058900     GO TO    F-MIN-WRITE-13.                                     IF1234.2 570
   000570         059000 F-MIN-WRITE-13.                                                  IF1234.2
   000571         059100     MOVE "F-MIN-13" TO PAR-NAME.                                 IF1234.2 62
   000572         059200     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000573         059400 F-MIN-14.                                                        IF1234.2
   000574         059500     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000575         059600 F-MIN-TEST-14.                                                   IF1234.2
   000576         059700     COMPUTE WS-NUM = FUNCTION MIN(IND(P), IND(Q), IND(R)).       IF1234.2 50 IFN 48 43 48 44 48 45
   000577         059800     IF WS-NUM = 4 THEN                                           IF1234.2 50
   000578      1  059900                    PERFORM PASS                                  IF1234.2 238
   000579         060000     ELSE                                                         IF1234.2
   000580      1  060100                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000581      1  060200                    MOVE 4 TO CORRECT-N                           IF1234.2 88
   000582      1  060300                    PERFORM FAIL.                                 IF1234.2 239
   000583         060400     GO TO F-MIN-WRITE-14.                                        IF1234.2 587
   000584         060500 F-MIN-DELETE-14.                                                 IF1234.2
   000585         060600     PERFORM  DE-LETE.                                            IF1234.2 240
   000586         060700     GO TO    F-MIN-WRITE-14.                                     IF1234.2 587
   000587         060800 F-MIN-WRITE-14.                                                  IF1234.2
   000588         060900     MOVE "F-MIN-14" TO PAR-NAME.                                 IF1234.2 62
   000589         061000     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000590         061200 F-MIN-15.                                                        IF1234.2
   000591         061300     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000592         061400 F-MIN-TEST-15.                                                   IF1234.2
   000593         061500     COMPUTE WS-NUM = FUNCTION MIN(IND(ALL)).                     IF1234.2 50 IFN 48
   000594         061600     IF WS-NUM = 0 THEN                                           IF1234.2 50
   000595      1  061700                    PERFORM PASS                                  IF1234.2 238
   000596         061800     ELSE                                                         IF1234.2
   000597      1  061900                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000598      1  062000                    MOVE 0 TO CORRECT-N                           IF1234.2 88
   000599      1  062100                    PERFORM FAIL.                                 IF1234.2 239
   000600         062200     GO TO F-MIN-WRITE-15.                                        IF1234.2 604
   000601         062300 F-MIN-DELETE-15.                                                 IF1234.2
   000602         062400     PERFORM  DE-LETE.                                            IF1234.2 240
   000603         062500     GO TO    F-MIN-WRITE-15.                                     IF1234.2 604
   000604         062600 F-MIN-WRITE-15.                                                  IF1234.2
   000605         062700     MOVE "F-MIN-15" TO PAR-NAME.                                 IF1234.2 62
   000606         062800     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000607         063000 F-MIN-17.                                                        IF1234.2
   000608         063100     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000609         063200 F-MIN-TEST-17.                                                   IF1234.2
   000610         063300     COMPUTE WS-NUM =                                             IF1234.2 50
   000611         063400         FUNCTION MIN(31000, 310001, 78000, 29000, 12000).        IF1234.2 IFN
   000612         063500     IF WS-NUM = 12000 THEN                                       IF1234.2 50
   000613      1  063600                    PERFORM PASS                                  IF1234.2 238
   000614         063700     ELSE                                                         IF1234.2
   000615      1  063800                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000616      1  063900                    MOVE 1200 TO CORRECT-N                        IF1234.2 88
   000617      1  064000                    PERFORM FAIL.                                 IF1234.2 239
   000618         064100     GO TO F-MIN-WRITE-17.                                        IF1234.2 622
   000619         064200 F-MIN-DELETE-17.                                                 IF1234.2
   000620         064300     PERFORM  DE-LETE.                                            IF1234.2 240
   000621         064400     GO TO    F-MIN-WRITE-17.                                     IF1234.2 622
   000622         064500 F-MIN-WRITE-17.                                                  IF1234.2
   000623         064600     MOVE "F-MIN-17" TO PAR-NAME.                                 IF1234.2 62
   000624         064700     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         064900 F-MIN-18.                                                        IF1234.2
   000626         065000     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000627         065100     MOVE  1.99996 TO MIN-RANGE.                                  IF1234.2 52
   000628         065200     MOVE  2.00004 TO MAX-RANGE.                                  IF1234.2 53
   000629         065300 F-MIN-TEST-18.                                                   IF1234.2
   000630         065400     COMPUTE WS-NUM = FUNCTION MIN(A * B, (3 + 1) / 2, 3 + 4).    IF1234.2 50 IFN 30 31
   000631         065500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1234.2 50 52
   000632         065600        (WS-NUM <= MAX-RANGE) THEN                                IF1234.2 50 53
   000633      1  065700                    PERFORM PASS                                  IF1234.2 238
   000634         065800     ELSE                                                         IF1234.2
   000635      1  065900                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000636      1  066000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1234.2 52 102
   000637      1  066100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1234.2 53 116
   000638      1  066200                    PERFORM FAIL.                                 IF1234.2 239
   000639         066300     GO TO F-MIN-WRITE-18.                                        IF1234.2 643
   000640         066400 F-MIN-DELETE-18.                                                 IF1234.2
   000641         066500     PERFORM  DE-LETE.                                            IF1234.2 240
   000642         066600     GO TO    F-MIN-WRITE-18.                                     IF1234.2 643
   000643         066700 F-MIN-WRITE-18.                                                  IF1234.2
   000644         066800     MOVE "F-MIN-18" TO PAR-NAME.                                 IF1234.2 62
   000645         066900     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000646         067100 F-MIN-19.                                                        IF1234.2
   000647         067200     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000648         067300     MOVE -10.6002 TO MIN-RANGE.                                  IF1234.2 52
   000649         067400     MOVE -10.5998 TO MAX-RANGE.                                  IF1234.2 53
   000650         067500 F-MIN-TEST-19.                                                   IF1234.2
   000651         067600     COMPUTE WS-NUM = FUNCTION MIN(E + 4, H * 2, 5 + A).          IF1234.2 50 IFN 34 37 30
   000652         067700     IF (WS-NUM >= MIN-RANGE) AND                                 IF1234.2 50 52
   000653         067800        (WS-NUM <= MAX-RANGE) THEN                                IF1234.2 50 53
   000654      1  067900                    PERFORM PASS                                  IF1234.2 238
   000655         068000     ELSE                                                         IF1234.2
   000656      1  068100                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000657      1  068200                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1234.2 52 102
   000658      1  068300                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1234.2 53 116
   000659      1  068400                    PERFORM FAIL.                                 IF1234.2 239
   000660         068500     GO TO F-MIN-WRITE-19.                                        IF1234.2 664
   000661         068600 F-MIN-DELETE-19.                                                 IF1234.2
   000662         068700     PERFORM  DE-LETE.                                            IF1234.2 240
   000663         068800     GO TO    F-MIN-WRITE-19.                                     IF1234.2 664
   000664         068900 F-MIN-WRITE-19.                                                  IF1234.2
   000665         069000     MOVE "F-MIN-19" TO PAR-NAME.                                 IF1234.2 62
   000666         069100     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000667         069300 F-MIN-20.                                                        IF1234.2
   000668         069400     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000669         069500     MOVE -7.00014 TO MIN-RANGE.                                  IF1234.2 52
   000670         069600     MOVE -6.99986 TO MAX-RANGE.                                  IF1234.2 53
   000671         069700 F-MIN-TEST-20.                                                   IF1234.2
   000672         069800     COMPUTE WS-NUM = FUNCTION MIN(-7, -9 + 2, (- B)).            IF1234.2 50 IFN 31
   000673         069900     IF (WS-NUM >= MIN-RANGE) AND                                 IF1234.2 50 52
   000674         070000        (WS-NUM <= MAX-RANGE) THEN                                IF1234.2 50 53
   000675      1  070100                    PERFORM PASS                                  IF1234.2 238
   000676         070200     ELSE                                                         IF1234.2
   000677      1  070300                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000678      1  070400                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1234.2 52 102
   000679      1  070500                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1234.2 53 116
   000680      1  070600                    PERFORM FAIL.                                 IF1234.2 239
   000681         070700     GO TO F-MIN-WRITE-20.                                        IF1234.2 685
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         070800 F-MIN-DELETE-20.                                                 IF1234.2
   000683         070900     PERFORM  DE-LETE.                                            IF1234.2 240
   000684         071000     GO TO    F-MIN-WRITE-20.                                     IF1234.2 685
   000685         071100 F-MIN-WRITE-20.                                                  IF1234.2
   000686         071200     MOVE "F-MIN-20" TO PAR-NAME.                                 IF1234.2 62
   000687         071300     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000688         071500 F-MIN-21.                                                        IF1234.2
   000689         071600     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000690         071700     MOVE 4.99990 TO MIN-RANGE.                                   IF1234.2 52
   000691         071800     MOVE 5.00010 TO MAX-RANGE.                                   IF1234.2 53
   000692         071900 F-MIN-TEST-21.                                                   IF1234.2
   000693         072000     COMPUTE WS-NUM = FUNCTION MIN(FUNCTION MIN(14, A), E, 50).   IF1234.2 50 IFN IFN 30 34
   000694         072100     IF (WS-NUM >= MIN-RANGE) AND                                 IF1234.2 50 52
   000695         072200        (WS-NUM <= MAX-RANGE) THEN                                IF1234.2 50 53
   000696      1  072300                    PERFORM PASS                                  IF1234.2 238
   000697         072400     ELSE                                                         IF1234.2
   000698      1  072500                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000699      1  072600                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1234.2 52 102
   000700      1  072700                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1234.2 53 116
   000701      1  072800                    PERFORM FAIL.                                 IF1234.2 239
   000702         072900     GO TO F-MIN-WRITE-21.                                        IF1234.2 706
   000703         073000 F-MIN-DELETE-21.                                                 IF1234.2
   000704         073100     PERFORM  DE-LETE.                                            IF1234.2 240
   000705         073200     GO TO    F-MIN-WRITE-21.                                     IF1234.2 706
   000706         073300 F-MIN-WRITE-21.                                                  IF1234.2
   000707         073400     MOVE "F-MIN-21" TO PAR-NAME.                                 IF1234.2 62
   000708         073500     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000709         073700 F-MIN-22.                                                        IF1234.2
   000710         073800     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000711         073900     MOVE 8.99982 TO MIN-RANGE.                                   IF1234.2 52
   000712         074000     MOVE 9.00018 TO MAX-RANGE.                                   IF1234.2 53
   000713         074100 F-MIN-TEST-22.                                                   IF1234.2
   000714         074200     COMPUTE WS-NUM = FUNCTION MIN(4, B, E) + A.                  IF1234.2 50 IFN 31 34 30
   000715         074300     IF (WS-NUM >= MIN-RANGE) AND                                 IF1234.2 50 52
   000716         074400        (WS-NUM <= MAX-RANGE) THEN                                IF1234.2 50 53
   000717      1  074500                    PERFORM PASS                                  IF1234.2 238
   000718         074600     ELSE                                                         IF1234.2
   000719      1  074700                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000720      1  074800                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1234.2 52 102
   000721      1  074900                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1234.2 53 116
   000722      1  075000                    PERFORM FAIL.                                 IF1234.2 239
   000723         075100     GO TO F-MIN-WRITE-22.                                        IF1234.2 727
   000724         075200 F-MIN-DELETE-22.                                                 IF1234.2
   000725         075300     PERFORM  DE-LETE.                                            IF1234.2 240
   000726         075400     GO TO    F-MIN-WRITE-22.                                     IF1234.2 727
   000727         075500 F-MIN-WRITE-22.                                                  IF1234.2
   000728         075600     MOVE "F-MIN-22" TO PAR-NAME.                                 IF1234.2 62
   000729         075700     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000730         075900 F-MIN-23.                                                        IF1234.2
   000731         076000     MOVE ZERO TO WS-NUM.                                         IF1234.2 IMP 50
   000732         076100     MOVE 4.99990 TO MIN-RANGE.                                   IF1234.2 52
   000733         076200     MOVE 5.00010 TO MAX-RANGE.                                   IF1234.2 53
   000734         076300 F-MIN-TEST-23.                                                   IF1234.2
   000735         076400     COMPUTE WS-NUM = FUNCTION MIN(A, E) + FUNCTION MIN(B, 0).    IF1234.2 50 IFN 30 34 IFN 31
   000736         076500     IF (WS-NUM >= MIN-RANGE) AND                                 IF1234.2 50 52
   000737         076600        (WS-NUM <= MAX-RANGE) THEN                                IF1234.2 50 53
   000738      1  076700                    PERFORM PASS                                  IF1234.2 238
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         076800     ELSE                                                         IF1234.2
   000740      1  076900                    MOVE WS-NUM TO COMPUTED-N                     IF1234.2 50 74
   000741      1  077000                    MOVE MIN-RANGE TO CORRECT-MIN                 IF1234.2 52 102
   000742      1  077100                    MOVE MAX-RANGE TO CORRECT-MAX                 IF1234.2 53 116
   000743      1  077200                    PERFORM FAIL.                                 IF1234.2 239
   000744         077300     GO TO F-MIN-WRITE-23.                                        IF1234.2 748
   000745         077400 F-MIN-DELETE-23.                                                 IF1234.2
   000746         077500     PERFORM  DE-LETE.                                            IF1234.2 240
   000747         077600     GO TO    F-MIN-WRITE-23.                                     IF1234.2 748
   000748         077700 F-MIN-WRITE-23.                                                  IF1234.2
   000749         077800     MOVE "F-MIN-23" TO PAR-NAME.                                 IF1234.2 62
   000750         077900     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000751         078100 F-MIN-24.                                                        IF1234.2
   000752         078200     PERFORM F-MIN-TEST-24                                        IF1234.2 756
   000753         078300       UNTIL FUNCTION MIN(ARG1, 20) < 10.                         IF1234.2 IFN 46
   000754         078400     PERFORM PASS.                                                IF1234.2 238
   000755         078500     GO TO F-MIN-WRITE-24.                                        IF1234.2 761
   000756         078600 F-MIN-TEST-24.                                                   IF1234.2
   000757         078700     COMPUTE ARG1 = ARG1 - 1.                                     IF1234.2 46 46
   000758         078800 F-MIN-DELETE-24.                                                 IF1234.2
   000759         078900     PERFORM  DE-LETE.                                            IF1234.2 240
   000760         079000     GO TO    F-MIN-WRITE-24.                                     IF1234.2 761
   000761         079100 F-MIN-WRITE-24.                                                  IF1234.2
   000762         079200     MOVE "F-MIN-24" TO PAR-NAME.                                 IF1234.2 62
   000763         079300     PERFORM  PRINT-DETAIL.                                       IF1234.2 242
   000764         079500 CCVS-EXIT SECTION.                                               IF1234.2
   000765         079600 CCVS-999999.                                                     IF1234.2
   000766         079700     GO TO CLOSE-FILES.                                           IF1234.2 233
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       30   A. . . . . . . . . . . . . . .  420 437 490 630 651 693 714 735
      146   ANSI-REFERENCE . . . . . . . .  320 327 343 M354
       46   ARG1 . . . . . . . . . . . . .  753 M757 757
       47   ARR
       31   B. . . . . . . . . . . . . . .  420 437 630 672 714 735
       32   C. . . . . . . . . . . . . . .  437 490
      125   CCVS-C-1 . . . . . . . . . . .  260 305
      130   CCVS-C-2 . . . . . . . . . . .  261 306
      180   CCVS-E-1 . . . . . . . . . . .  266
      185   CCVS-E-2 . . . . . . . . . . .  274 281 288 293
      188   CCVS-E-2-2 . . . . . . . . . .  M273
      193   CCVS-E-3 . . . . . . . . . . .  294
      202   CCVS-E-4 . . . . . . . . . . .  273
      203   CCVS-E-4-1 . . . . . . . . . .  M271
      205   CCVS-E-4-2 . . . . . . . . . .  M272
      147   CCVS-H-1 . . . . . . . . . . .  255 301
      152   CCVS-H-2A. . . . . . . . . . .  256 302
      161   CCVS-H-2B. . . . . . . . . . .  257 303
      173   CCVS-H-3 . . . . . . . . . . .  258 304
      223   CCVS-PGM-ID. . . . . . . . . .  229 229
       79   CM-18V0
       73   COMPUTED-A . . . . . . . . . .  74 76 77 78 79 338 342 M529 M546
       74   COMPUTED-N . . . . . . . . . .  M363 M407 M424 M441 M459 M477 M494 M512 M563 M580 M597 M615 M635 M656 M677 M698
                                            M719 M740
       72   COMPUTED-X . . . . . . . . . .  M250 317
       76   COMPUTED-0V18
       78   COMPUTED-14V4
       80   COMPUTED-18V0
       77   COMPUTED-4V14
       96   COR-ANSI-REFERENCE . . . . . .  M327 M335
      124   CORMA-ANSI-REFERENCE . . . . .  M328
       87   CORRECT-A. . . . . . . . . . .  88 89 90 91 92 339 341 M530 M547
      116   CORRECT-MAX. . . . . . . . . .  M637 M658 M679 M700 M721 M742
      102   CORRECT-MIN. . . . . . . . . .  329 M636 M657 M678 M699 M720 M741
       88   CORRECT-N. . . . . . . . . . .  M364 M408 M425 M442 M460 M478 M495 M513 M564 M581 M598 M616
       86   CORRECT-X. . . . . . . . . . .  M251 319
       89   CORRECT-0V18
       91   CORRECT-14V4
       93   CORRECT-18V0
       90   CORRECT-4V14
      115   CORRECTMA-A. . . . . . . . . .  116 117 118 119 120
      114   CORRECTMA-X
      117   CORRECTMA-0V18
      119   CORRECTMA-14V4
      121   CORRECTMA-18V0
      118   CORRECTMA-4V14
      101   CORRECTMI-A. . . . . . . . . .  102 103 104 105 106
      100   CORRECTMI-X
      103   CORRECTMI-0V18
      105   CORRECTMI-14V4
      107   CORRECTMI-18V0
      104   CORRECTMI-4V14
       92   CR-18V0
      106   CR-18V0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    18
0 Defined   Cross-reference of data names   References

0     120   CR-18V0
       33   D. . . . . . . . . . . . . . .  420 437 507
      138   DELETE-COUNTER . . . . . . . .  M240 269 284 286
       65   DOTVALUE . . . . . . . . . . .  M245
      144   DUMMY-HOLD . . . . . . . . . .  M298 308
       27   DUMMY-RECORD . . . . . . . . .  M255 M256 M257 M258 M260 M261 M262 M264 M266 M274 M281 M288 M293 M294 298 M299
                                            300 M301 M302 M303 M304 M305 M306 M307 M308 312 M313 M322 M344
       34   E. . . . . . . . . . . . . . .  454 472 507 651 693 714 735
      191   ENDER-DESC . . . . . . . . . .  M276 M287 M292
      139   ERROR-COUNTER. . . . . . . . .  M239 268 277 280
      143   ERROR-HOLD . . . . . . . . . .  M268 M269 M269 M270 272
      189   ERROR-TOTAL. . . . . . . . . .  M278 M280 M285 M286 M290 M291
       35   F. . . . . . . . . . . . . . .  472
       58   FEATURE. . . . . . . . . . . .  M355
       36   G. . . . . . . . . . . . . . .  454 472
       37   H. . . . . . . . . . . . . . .  472 651
      217   HYPHEN-LINE. . . . . . . . . .  262 264 307
       38   I. . . . . . . . . . . . . . .  525
      183   ID-AGAIN . . . . . . . . . . .  M229
       48   IND. . . . . . . . . . . . . .  559 559 559 576 576 576 593
      216   INF-ANSI-REFERENCE . . . . . .  M320 M323 M343 M345
      211   INFO-TEXT. . . . . . . . . . .  M321
      140   INSPECT-COUNTER. . . . . . . .  M237 268 289 291
       39   J. . . . . . . . . . . . . . .  542
       40   M
       53   MAX-RANGE. . . . . . . . . . .  M628 632 637 M649 653 658 M670 674 679 M691 695 700 M712 716 721 M733 737 742
       52   MIN-RANGE. . . . . . . . . . .  M627 631 636 M648 652 657 M669 673 678 M690 694 699 M711 715 720 M732 736 741
       41   N
       42   O
       43   P. . . . . . . . . . . . . . .  576
       60   P-OR-F . . . . . . . . . . . .  M237 M238 M239 M240 247 M250
       62   PAR-NAME . . . . . . . . . . .  M252 M371 M384 M397 M415 M432 M449 M467 M485 M502 M520 M537 M554 M571 M588 M605
                                            M623 M644 M665 M686 M707 M728 M749 M762
       64   PARDOT-X . . . . . . . . . . .  M244
      141   PASS-COUNTER . . . . . . . . .  M238 270 271
       17   PRG-COLL-SEQ . . . . . . . . .  15
       25   PRINT-FILE . . . . . . . . . .  21 228 234
       26   PRINT-REC. . . . . . . . . . .  M246 M326 M330 M331 M333
       44   Q. . . . . . . . . . . . . . .  576
       45   R. . . . . . . . . . . . . . .  576
       67   RE-MARK. . . . . . . . . . . .  M241 M253
      137   REC-CT . . . . . . . . . . . .  243 245 252
      136   REC-SKL-SUB
      145   RECORD-COUNT . . . . . . . . .  M296 297 M309
       49   TEMP
       68   TEST-COMPUTED. . . . . . . . .  326
       83   TEST-CORRECT . . . . . . . . .  333
      111   TEST-CORRECT-MAX . . . . . . .  331
       97   TEST-CORRECT-MIN . . . . . . .  330
      164   TEST-ID. . . . . . . . . . . .  M229
       56   TEST-RESULTS . . . . . . . . .  M230 246
      142   TOTAL-ERROR
       51   WS-ANUM. . . . . . . . . . . .  M523 M525 526 529 M542 543 546
       50   WS-NUM . . . . . . . . . . . .  M357 M359 360 363 M400 M402 403 404 407 M418 M420 421 424 M435 M437 438 441 M452
                                            M454 455 456 459 M470 M472 473 474 477 M488 M490 491 494 M505 M507 508 509 512
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    19
0 Defined   Cross-reference of data names   References

0                                           M540 M557 M559 560 563 M574 M576 577 580 M591 M593 594 597 M608 M610 612 615
                                            M626 M630 631 632 635 M647 M651 652 653 656 M668 M672 673 674 677 M689 M693 694
                                            695 698 M710 M714 715 716 719 M731 M735 736 737 740
      213   XXCOMPUTED . . . . . . . . . .  M342
      215   XXCORRECT. . . . . . . . . . .  M341
      208   XXINFO . . . . . . . . . . . .  322 344
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    20
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

      337   BAIL-OUT . . . . . . . . . . .  P249
      346   BAIL-OUT-EX. . . . . . . . . .  E249 G339
      340   BAIL-OUT-WRITE . . . . . . . .  G338
      314   BLANK-LINE-PRINT
      764   CCVS-EXIT
      765   CCVS-999999
      226   CCVS1
      347   CCVS1-EXIT . . . . . . . . . .  G232
      233   CLOSE-FILES. . . . . . . . . .  G766
      259   COLUMN-NAMES-ROUTINE . . . . .  E231
      240   DE-LETE. . . . . . . . . . . .  P368 P381 P394 P412 P429 P446 P464 P482 P499 P517 P534 P551 P568 P585 P602 P620
                                            P641 P662 P683 P704 P725 P746 P759
      263   END-ROUTINE. . . . . . . . . .  P234
      267   END-ROUTINE-1
      275   END-ROUTINE-12
      283   END-ROUTINE-13 . . . . . . . .  E234
      265   END-RTN-EXIT
      367   F-MIN-DELETE-01
      380   F-MIN-DELETE-02
      393   F-MIN-DELETE-03
      411   F-MIN-DELETE-04
      428   F-MIN-DELETE-05
      445   F-MIN-DELETE-06
      463   F-MIN-DELETE-07
      481   F-MIN-DELETE-08
      498   F-MIN-DELETE-09
      516   F-MIN-DELETE-10
      533   F-MIN-DELETE-11
      550   F-MIN-DELETE-12
      567   F-MIN-DELETE-13
      584   F-MIN-DELETE-14
      601   F-MIN-DELETE-15
      619   F-MIN-DELETE-17
      640   F-MIN-DELETE-18
      661   F-MIN-DELETE-19
      682   F-MIN-DELETE-20
      703   F-MIN-DELETE-21
      724   F-MIN-DELETE-22
      745   F-MIN-DELETE-23
      758   F-MIN-DELETE-24
      353   F-MIN-INFO
      358   F-MIN-TEST-01
      401   F-MIN-TEST-04
      419   F-MIN-TEST-05
      436   F-MIN-TEST-06
      453   F-MIN-TEST-07
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    21
0 Defined   Cross-reference of procedures   References

0     471   F-MIN-TEST-08
      489   F-MIN-TEST-09
      506   F-MIN-TEST-10
      524   F-MIN-TEST-11
      541   F-MIN-TEST-12
      558   F-MIN-TEST-13
      575   F-MIN-TEST-14
      592   F-MIN-TEST-15
      609   F-MIN-TEST-17
      629   F-MIN-TEST-18
      650   F-MIN-TEST-19
      671   F-MIN-TEST-20
      692   F-MIN-TEST-21
      713   F-MIN-TEST-22
      734   F-MIN-TEST-23
      756   F-MIN-TEST-24. . . . . . . . .  P752
      370   F-MIN-WRITE-01 . . . . . . . .  G366 G369
      383   F-MIN-WRITE-02 . . . . . . . .  G379 G382
      396   F-MIN-WRITE-03 . . . . . . . .  G392 G395
      414   F-MIN-WRITE-04 . . . . . . . .  G410 G413
      431   F-MIN-WRITE-05 . . . . . . . .  G427 G430
      448   F-MIN-WRITE-06 . . . . . . . .  G444 G447
      466   F-MIN-WRITE-07 . . . . . . . .  G462 G465
      484   F-MIN-WRITE-08 . . . . . . . .  G480 G483
      501   F-MIN-WRITE-09 . . . . . . . .  G497 G500
      519   F-MIN-WRITE-10 . . . . . . . .  G515 G518
      536   F-MIN-WRITE-11 . . . . . . . .  G532 G535
      553   F-MIN-WRITE-12 . . . . . . . .  G549 G552
      570   F-MIN-WRITE-13 . . . . . . . .  G566 G569
      587   F-MIN-WRITE-14 . . . . . . . .  G583 G586
      604   F-MIN-WRITE-15 . . . . . . . .  G600 G603
      622   F-MIN-WRITE-17 . . . . . . . .  G618 G621
      643   F-MIN-WRITE-18 . . . . . . . .  G639 G642
      664   F-MIN-WRITE-19 . . . . . . . .  G660 G663
      685   F-MIN-WRITE-20 . . . . . . . .  G681 G684
      706   F-MIN-WRITE-21 . . . . . . . .  G702 G705
      727   F-MIN-WRITE-22 . . . . . . . .  G723 G726
      748   F-MIN-WRITE-23 . . . . . . . .  G744 G747
      761   F-MIN-WRITE-24 . . . . . . . .  G755 G760
      356   F-MIN-01
      373   F-MIN-02
      386   F-MIN-03
      399   F-MIN-04
      417   F-MIN-05
      434   F-MIN-06
      451   F-MIN-07
      469   F-MIN-08
      487   F-MIN-09
      504   F-MIN-10
      522   F-MIN-11
      539   F-MIN-12
      556   F-MIN-13
      573   F-MIN-14
      590   F-MIN-15
      607   F-MIN-17
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    22
0 Defined   Cross-reference of procedures   References

0     625   F-MIN-18
      646   F-MIN-19
      667   F-MIN-20
      688   F-MIN-21
      709   F-MIN-22
      730   F-MIN-23
      751   F-MIN-24
      239   FAIL . . . . . . . . . . . . .  P365 P378 P391 P409 P426 P443 P461 P479 P496 P514 P531 P548 P565 P582 P599 P617
                                            P638 P659 P680 P701 P722 P743
      316   FAIL-ROUTINE . . . . . . . . .  P248
      336   FAIL-ROUTINE-EX. . . . . . . .  E248 G324
      325   FAIL-ROUTINE-WRITE . . . . . .  G318 G319
      254   HEAD-ROUTINE . . . . . . . . .  P231
      237   INSPT
      227   OPEN-FILES
      238   PASS . . . . . . . . . . . . .  P361 P376 P389 P405 P422 P439 P457 P475 P492 P510 P527 P544 P561 P578 P595 P613
                                            P633 P654 P675 P696 P717 P738 P754
      242   PRINT-DETAIL . . . . . . . . .  P372 P385 P398 P416 P433 P450 P468 P486 P503 P521 P538 P555 P572 P589 P606 P624
                                            P645 P666 P687 P708 P729 P750 P763
      352   SECT-IF123A
      235   TERMINATE-CCVS
      295   WRITE-LINE . . . . . . . . . .  P246 P247 P255 P256 P257 P258 P260 P261 P262 P264 P266 P274 P282 P288 P293 P294
                                            P322 P326 P330 P331 P333 P334 P344
      311   WRT-LN . . . . . . . . . . . .  P301 P302 P303 P304 P305 P306 P307 P310 P315
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    23
0 Defined   Cross-reference of programs     References

        3   IF123A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       IF123A    Date 06/04/2022  Time 11:56:34   Page    24
0LineID  Message code  Message text

     25  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program IF123A:
 *    Source records = 766
 *    Data Division statements = 106
 *    Procedure Division statements = 425
 *    Generated COBOL statements = 0
 *    Program complexity factor = 437
0End of compilation 1,  program IF123A,  highest severity 0.
0Return code 0
