1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:41   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:41   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1404.2
   000002         000200 PROGRAM-ID.                                                      NC1404.2
   000003         000300     NC140A.                                                      NC1404.2
   000004         000500*                                                              *  NC1404.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1404.2
   000006         000700*                                                              *  NC1404.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1404.2
   000008         000900*                                                              *  NC1404.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1404.2
   000010         001100*                                                              *  NC1404.2
   000011         001300*                                                              *  NC1404.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1404.2
   000013         001500*                                                              *  NC1404.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1404.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1404.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1404.2
   000017         001900*                                                              *  NC1404.2
   000018         002100*                                                                 NC1404.2
   000019         002200*    PROGRAM NC140A TESTS FORMAT 2 OF THE "SET" STATEMENT         NC1404.2
   000020         002300*    USING A VARIETY OF DATA-NAMES CONTAINING POSITIVE AND        NC1404.2
   000021         002400*    NEGATIVE VALUES, AS WELL AS POSITIVE AND NEGATIVE INTEGERS.  NC1404.2
   000022         002500*                                                                 NC1404.2
   000023         002700 ENVIRONMENT DIVISION.                                            NC1404.2
   000024         002800 CONFIGURATION SECTION.                                           NC1404.2
   000025         002900 SOURCE-COMPUTER.                                                 NC1404.2
   000026         003000     XXXXX082.                                                    NC1404.2
   000027         003100 OBJECT-COMPUTER.                                                 NC1404.2
   000028         003200     XXXXX083.                                                    NC1404.2
   000029         003300 INPUT-OUTPUT SECTION.                                            NC1404.2
   000030         003400 FILE-CONTROL.                                                    NC1404.2
   000031         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1404.2 35
   000032         003600     XXXXX055.                                                    NC1404.2
   000033         003700 DATA DIVISION.                                                   NC1404.2
   000034         003800 FILE SECTION.                                                    NC1404.2
   000035         003900 FD  PRINT-FILE.                                                  NC1404.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         004000 01  PRINT-REC PICTURE X(120).                                    NC1404.2
   000037         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1404.2
   000038         004200 WORKING-STORAGE SECTION.                                         NC1404.2
   000039         004300 01  GRP-TABLE1.                                                  NC1404.2
   000040         004400     02  ELEM1  PIC S999    OCCURS 100 TIMES                      NC1404.2
   000041         004500              INDEXED BY INDEX1.                                  NC1404.2
   000042         004600*    TWO DIMENSIONAL TABLE.                                       NC1404.2
   000043         004700 01  GRP-TABLE2.                                                  NC1404.2
   000044         004800     02  GROUP1    OCCURS 10 TIMES                                NC1404.2
   000045         004900              INDEXED BY IN1.                                     NC1404.2
   000046         005000         03  ELEM2  PIC S9999                                     NC1404.2
   000047         005100              USAGE IS COMPUTATIONAL                              NC1404.2
   000048         005200              OCCURS 10 TIMES                                     NC1404.2
   000049         005300              INDEXED BY IN2.                                     NC1404.2
   000050         005400*    SUBSCRIPTS FOR TABLE REFERENCES.                             NC1404.2
   000051         005500 01  GRP-SUB.                                                     NC1404.2
   000052         005600     02  S1  PIC  S999  VALUE 1.                                  NC1404.2
   000053         005700     02  S21 PIC  S999  VALUE 1.                                  NC1404.2
   000054         005800     02  S22 PIC  S999  VALUE 1.                                  NC1404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900*    DATA ITEMS USED IN SET STATEMENTS, FORMAT 2.                 NC1404.2
   000056         006000 77  CS-3     PICTURE S999    COMPUTATIONAL   VALUE ZERO.         NC1404.2 IMP
   000057         006100 77  CU-3     PICTURE  999    COMPUTATIONAL   VALUE ZERO.         NC1404.2 IMP
   000058         006200 77  DS-3     PICTURE S999    DISPLAY         VALUE ZERO.         NC1404.2 IMP
   000059         006300 77  DU-3     PICTURE  999    DISPLAY         VALUE ZERO.         NC1404.2 IMP
   000060         006400 77  DS-LS-3  PICTURE S999    SIGN IS LEADING SEPARATE CHARACTER  NC1404.2
   000061         006500              VALUE ZERO.                                         NC1404.2 IMP
   000062         006600 77  DS-TS-3  PICTURE S999    SIGN IS TRAILING SEPARATE           NC1404.2
   000063         006700               CHARACTER  VALUE ZERO.                             NC1404.2 IMP
   000064         006800 77  EXPECTED-VALUE  PIC S999.                                    NC1404.2
   000065         006900 77  TEMP  PICTURE S999.                                          NC1404.2
   000066         007000 77  WRK1   PIC   S999   VALUE ZERO.                              NC1404.2 IMP
   000067         007100 01  TEST-RESULTS.                                                NC1404.2
   000068         007200     02 FILLER                   PIC X      VALUE SPACE.          NC1404.2 IMP
   000069         007300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1404.2 IMP
   000070         007400     02 FILLER                   PIC X      VALUE SPACE.          NC1404.2 IMP
   000071         007500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1404.2 IMP
   000072         007600     02 FILLER                   PIC X      VALUE SPACE.          NC1404.2 IMP
   000073         007700     02  PAR-NAME.                                                NC1404.2
   000074         007800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1404.2 IMP
   000075         007900       03  PARDOT-X              PIC X      VALUE SPACE.          NC1404.2 IMP
   000076         008000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1404.2 IMP
   000077         008100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1404.2 IMP
   000078         008200     02 RE-MARK                  PIC X(61).                       NC1404.2
   000079         008300 01  TEST-COMPUTED.                                               NC1404.2
   000080         008400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1404.2 IMP
   000081         008500     02 FILLER                   PIC X(17)  VALUE                 NC1404.2
   000082         008600            "       COMPUTED=".                                   NC1404.2
   000083         008700     02 COMPUTED-X.                                               NC1404.2
   000084         008800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1404.2 IMP
   000085         008900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1404.2 84
   000086         009000                                 PIC -9(9).9(9).                  NC1404.2
   000087         009100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1404.2 84
   000088         009200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1404.2 84
   000089         009300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1404.2 84
   000090         009400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1404.2 84
   000091         009500         04 COMPUTED-18V0                    PIC -9(18).          NC1404.2
   000092         009600         04 FILLER                           PIC X.               NC1404.2
   000093         009700     03 FILLER PIC X(50) VALUE SPACE.                             NC1404.2 IMP
   000094         009800 01  TEST-CORRECT.                                                NC1404.2
   000095         009900     02 FILLER PIC X(30) VALUE SPACE.                             NC1404.2 IMP
   000096         010000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1404.2
   000097         010100     02 CORRECT-X.                                                NC1404.2
   000098         010200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1404.2 IMP
   000099         010300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1404.2 98
   000100         010400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1404.2 98
   000101         010500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1404.2 98
   000102         010600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1404.2 98
   000103         010700     03      CR-18V0 REDEFINES CORRECT-A.                         NC1404.2 98
   000104         010800         04 CORRECT-18V0                     PIC -9(18).          NC1404.2
   000105         010900         04 FILLER                           PIC X.               NC1404.2
   000106         011000     03 FILLER PIC X(2) VALUE SPACE.                              NC1404.2 IMP
   000107         011100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1404.2 IMP
   000108         011200 01  CCVS-C-1.                                                    NC1404.2
   000109         011300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1404.2
   000110         011400-    "SS  PARAGRAPH-NAME                                          NC1404.2
   000111         011500-    "       REMARKS".                                            NC1404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1404.2 IMP
   000113         011700 01  CCVS-C-2.                                                    NC1404.2
   000114         011800     02 FILLER                     PIC X        VALUE SPACE.      NC1404.2 IMP
   000115         011900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1404.2
   000116         012000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1404.2 IMP
   000117         012100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1404.2
   000118         012200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1404.2 IMP
   000119         012300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1404.2 IMP
   000120         012400 01  REC-CT                        PIC 99       VALUE ZERO.       NC1404.2 IMP
   000121         012500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1404.2 IMP
   000122         012600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1404.2 IMP
   000123         012700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1404.2 IMP
   000124         012800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1404.2 IMP
   000125         012900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1404.2 IMP
   000126         013000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1404.2 IMP
   000127         013100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1404.2 IMP
   000128         013200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1404.2 IMP
   000129         013300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1404.2 IMP
   000130         013400 01  CCVS-H-1.                                                    NC1404.2
   000131         013500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1404.2 IMP
   000132         013600     02  FILLER                    PIC X(42)    VALUE             NC1404.2
   000133         013700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1404.2
   000134         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1404.2 IMP
   000135         013900 01  CCVS-H-2A.                                                   NC1404.2
   000136         014000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1404.2 IMP
   000137         014100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1404.2
   000138         014200   02  FILLER                        PIC XXXX   VALUE             NC1404.2
   000139         014300     "4.2 ".                                                      NC1404.2
   000140         014400   02  FILLER                        PIC X(28)  VALUE             NC1404.2
   000141         014500            " COPY - NOT FOR DISTRIBUTION".                       NC1404.2
   000142         014600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1404.2 IMP
   000143         014700                                                                  NC1404.2
   000144         014800 01  CCVS-H-2B.                                                   NC1404.2
   000145         014900   02  FILLER                        PIC X(15)  VALUE             NC1404.2
   000146         015000            "TEST RESULT OF ".                                    NC1404.2
   000147         015100   02  TEST-ID                       PIC X(9).                    NC1404.2
   000148         015200   02  FILLER                        PIC X(4)   VALUE             NC1404.2
   000149         015300            " IN ".                                               NC1404.2
   000150         015400   02  FILLER                        PIC X(12)  VALUE             NC1404.2
   000151         015500     " HIGH       ".                                              NC1404.2
   000152         015600   02  FILLER                        PIC X(22)  VALUE             NC1404.2
   000153         015700            " LEVEL VALIDATION FOR ".                             NC1404.2
   000154         015800   02  FILLER                        PIC X(58)  VALUE             NC1404.2
   000155         015900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1404.2
   000156         016000 01  CCVS-H-3.                                                    NC1404.2
   000157         016100     02  FILLER                      PIC X(34)  VALUE             NC1404.2
   000158         016200            " FOR OFFICIAL USE ONLY    ".                         NC1404.2
   000159         016300     02  FILLER                      PIC X(58)  VALUE             NC1404.2
   000160         016400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1404.2
   000161         016500     02  FILLER                      PIC X(28)  VALUE             NC1404.2
   000162         016600            "  COPYRIGHT   1985 ".                                NC1404.2
   000163         016700 01  CCVS-E-1.                                                    NC1404.2
   000164         016800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1404.2 IMP
   000165         016900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1404.2
   000166         017000     02 ID-AGAIN                     PIC X(9).                    NC1404.2
   000167         017100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1404.2 IMP
   000168         017200 01  CCVS-E-2.                                                    NC1404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1404.2 IMP
   000170         017400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1404.2 IMP
   000171         017500     02 CCVS-E-2-2.                                               NC1404.2
   000172         017600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1404.2 IMP
   000173         017700         03 FILLER                   PIC X      VALUE SPACE.      NC1404.2 IMP
   000174         017800         03 ENDER-DESC               PIC X(44)  VALUE             NC1404.2
   000175         017900            "ERRORS ENCOUNTERED".                                 NC1404.2
   000176         018000 01  CCVS-E-3.                                                    NC1404.2
   000177         018100     02  FILLER                      PIC X(22)  VALUE             NC1404.2
   000178         018200            " FOR OFFICIAL USE ONLY".                             NC1404.2
   000179         018300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1404.2 IMP
   000180         018400     02  FILLER                      PIC X(58)  VALUE             NC1404.2
   000181         018500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1404.2
   000182         018600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1404.2 IMP
   000183         018700     02 FILLER                       PIC X(15)  VALUE             NC1404.2
   000184         018800             " COPYRIGHT 1985".                                   NC1404.2
   000185         018900 01  CCVS-E-4.                                                    NC1404.2
   000186         019000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1404.2 IMP
   000187         019100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1404.2
   000188         019200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1404.2 IMP
   000189         019300     02 FILLER                       PIC X(40)  VALUE             NC1404.2
   000190         019400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1404.2
   000191         019500 01  XXINFO.                                                      NC1404.2
   000192         019600     02 FILLER                       PIC X(19)  VALUE             NC1404.2
   000193         019700            "*** INFORMATION ***".                                NC1404.2
   000194         019800     02 INFO-TEXT.                                                NC1404.2
   000195         019900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1404.2 IMP
   000196         020000       04 XXCOMPUTED                 PIC X(20).                   NC1404.2
   000197         020100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1404.2 IMP
   000198         020200       04 XXCORRECT                  PIC X(20).                   NC1404.2
   000199         020300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1404.2
   000200         020400 01  HYPHEN-LINE.                                                 NC1404.2
   000201         020500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1404.2 IMP
   000202         020600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1404.2
   000203         020700-    "*****************************************".                 NC1404.2
   000204         020800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1404.2
   000205         020900-    "******************************".                            NC1404.2
   000206         021000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1404.2
   000207         021100     "NC140A".                                                    NC1404.2
   000208         021200 PROCEDURE DIVISION.                                              NC1404.2
   000209         021300 CCVS1 SECTION.                                                   NC1404.2
   000210         021400 OPEN-FILES.                                                      NC1404.2
   000211         021500     OPEN     OUTPUT PRINT-FILE.                                  NC1404.2 35
   000212         021600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1404.2 206 147 206 166
   000213         021700     MOVE    SPACE TO TEST-RESULTS.                               NC1404.2 IMP 67
   000214         021800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1404.2 239 244
   000215         021900     GO TO CCVS1-EXIT.                                            NC1404.2 326
   000216         022000 CLOSE-FILES.                                                     NC1404.2
   000217         022100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1404.2 248 269 35
   000218         022200 TERMINATE-CCVS.                                                  NC1404.2
   000219         022300     EXIT PROGRAM.                                                NC1404.2
   000220         022400 TERMINATE-CALL.                                                  NC1404.2
   000221         022500     STOP     RUN.                                                NC1404.2
   000222         022600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1404.2 71 123
   000223         022700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1404.2 71 124
   000224         022800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1404.2 71 122
   000225         022900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1404.2 71 121
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1404.2 78
   000227         023100 PRINT-DETAIL.                                                    NC1404.2
   000228         023200     IF REC-CT NOT EQUAL TO ZERO                                  NC1404.2 120 IMP
   000229      1  023300             MOVE "." TO PARDOT-X                                 NC1404.2 75
   000230      1  023400             MOVE REC-CT TO DOTVALUE.                             NC1404.2 120 76
   000231         023500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1404.2 67 36 281
   000232         023600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1404.2 71 281
   000233      1  023700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1404.2 302 316
   000234      1  023800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1404.2 317 325
   000235         023900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1404.2 IMP 71 IMP 83
   000236         024000     MOVE SPACE TO CORRECT-X.                                     NC1404.2 IMP 97
   000237         024100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1404.2 120 IMP IMP 73
   000238         024200     MOVE     SPACE TO RE-MARK.                                   NC1404.2 IMP 78
   000239         024300 HEAD-ROUTINE.                                                    NC1404.2
   000240         024400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1404.2 130 37 281
   000241         024500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1404.2 135 37 281
   000242         024600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1404.2 144 37 281
   000243         024700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1404.2 156 37 281
   000244         024800 COLUMN-NAMES-ROUTINE.                                            NC1404.2
   000245         024900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1404.2 108 37 281
   000246         025000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1404.2 113 37 281
   000247         025100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1404.2 200 37 281
   000248         025200 END-ROUTINE.                                                     NC1404.2
   000249         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1404.2 200 37 281
   000250         025400 END-RTN-EXIT.                                                    NC1404.2
   000251         025500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1404.2 163 37 281
   000252         025600 END-ROUTINE-1.                                                   NC1404.2
   000253         025700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1404.2 122 126 123
   000254         025800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1404.2 126 121 126
   000255         025900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1404.2 124 126
   000256         026000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1404.2
   000257         026100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1404.2 124 186
   000258         026200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1404.2 126 188
   000259         026300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1404.2 185 171
   000260         026400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1404.2 168 37 281
   000261         026500  END-ROUTINE-12.                                                 NC1404.2
   000262         026600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1404.2 174
   000263         026700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1404.2 122 IMP
   000264      1  026800         MOVE "NO " TO ERROR-TOTAL                                NC1404.2 172
   000265         026900         ELSE                                                     NC1404.2
   000266      1  027000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1404.2 122 172
   000267         027100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1404.2 168 37
   000268         027200     PERFORM WRITE-LINE.                                          NC1404.2 281
   000269         027300 END-ROUTINE-13.                                                  NC1404.2
   000270         027400     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1404.2 121 IMP
   000271      1  027500         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1404.2 172
   000272      1  027600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1404.2 121 172
   000273         027700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1404.2 174
   000274         027800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1404.2 168 37 281
   000275         027900      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1404.2 123 IMP
   000276      1  028000          MOVE "NO " TO ERROR-TOTAL                               NC1404.2 172
   000277      1  028100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1404.2 123 172
   000278         028200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1404.2 174
   000279         028300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1404.2 168 37 281
   000280         028400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1404.2 176 37 281
   000281         028500 WRITE-LINE.                                                      NC1404.2
   000282         028600     ADD 1 TO RECORD-COUNT.                                       NC1404.2 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     IF RECORD-COUNT GREATER 42                                   NC1404.2 128
   000284      1  028800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1404.2 37 127
   000285      1  028900         MOVE SPACE TO DUMMY-RECORD                               NC1404.2 IMP 37
   000286      1  029000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1404.2 37
   000287      1  029100         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1404.2 130 37 297
   000288      1  029200         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1404.2 135 37 297
   000289      1  029300         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1404.2 144 37 297
   000290      1  029400         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1404.2 156 37 297
   000291      1  029500         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1404.2 108 37 297
   000292      1  029600         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1404.2 113 37 297
   000293      1  029700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1404.2 200 37 297
   000294      1  029800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1404.2 127 37
   000295      1  029900         MOVE ZERO TO RECORD-COUNT.                               NC1404.2 IMP 128
   000296         030000     PERFORM WRT-LN.                                              NC1404.2 297
   000297         030100 WRT-LN.                                                          NC1404.2
   000298         030200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1404.2 37
   000299         030300     MOVE SPACE TO DUMMY-RECORD.                                  NC1404.2 IMP 37
   000300         030400 BLANK-LINE-PRINT.                                                NC1404.2
   000301         030500     PERFORM WRT-LN.                                              NC1404.2 297
   000302         030600 FAIL-ROUTINE.                                                    NC1404.2
   000303         030700     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1404.2 83 IMP
   000304      1  030800            GO TO FAIL-ROUTINE-WRITE.                             NC1404.2 311
   000305         030900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1404.2 97 IMP 311
   000306         031000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1404.2 129 199
   000307         031100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1404.2 194
   000308         031200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1404.2 191 37 281
   000309         031300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1404.2 IMP 199
   000310         031400     GO TO  FAIL-ROUTINE-EX.                                      NC1404.2 316
   000311         031500 FAIL-ROUTINE-WRITE.                                              NC1404.2
   000312         031600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1404.2 79 36 281
   000313         031700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1404.2 129 107
   000314         031800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1404.2 94 36 281
   000315         031900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1404.2 IMP 107
   000316         032000 FAIL-ROUTINE-EX. EXIT.                                           NC1404.2
   000317         032100 BAIL-OUT.                                                        NC1404.2
   000318         032200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1404.2 84 IMP 320
   000319         032300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1404.2 98 IMP 325
   000320         032400 BAIL-OUT-WRITE.                                                  NC1404.2
   000321         032500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1404.2 98 198 84 196
   000322         032600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1404.2 129 199
   000323         032700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1404.2 191 37 281
   000324         032800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1404.2 IMP 199
   000325         032900 BAIL-OUT-EX. EXIT.                                               NC1404.2
   000326         033000 CCVS1-EXIT.                                                      NC1404.2
   000327         033100     EXIT.                                                        NC1404.2
   000328         033300*STATEMENT DELETION INSTRUCTIONS                                  NC1404.2
   000329         033400*       IF THE COMPILER REJECTS ANY SET STATEMENTS IN THESE TESTS,NC1404.2
   000330         033500*    DELETE THAT LINE OF CODE BY PLACING AN * IN COLUMN 7.  LEAVE NC1404.2
   000331         033600*    THE PERFORM ... THRU STATEMENT.  THE TEST DELETED APPEARS AS NC1404.2
   000332         033700*    A FAILURE ON THE OUTPUT REPORT.                              NC1404.2
   000333         033900 SECT-NC140A-0001 SECTION.                                        NC1404.2
   000334         034000 NC140A-0001.                                                     NC1404.2
   000335         034100     MOVE "VI-127 6.22.4" TO ANSI-REFERENCE.                      NC1404.2 129
   000336         034200*    THIS SECTION STORES VALUES IN THE TWO TABLES                 NC1404.2
   000337         034300*    USED IN TESTING THE INDEX VALUES.                            NC1404.2
   000338         034400 MOVE-VALUE.                                                      NC1404.2
   000339         034500     ADD 1 TO WRK1.                                               NC1404.2 66
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034600     MOVE WRK1 TO ELEM1 (S1) ELEM2 (S21 S22).                     NC1404.2 66 40 52 46 53 54
   000341         034700     IF WRK1 IS EQUAL TO 100                                      NC1404.2 66
   000342      1  034800              GO TO SECT-TH111-0002.                              NC1404.2 351
   000343         034900 INCRE-SUBS.                                                      NC1404.2
   000344         035000     ADD 1 TO S1.                                                 NC1404.2 52
   000345         035100     ADD 1 TO S22.                                                NC1404.2 54
   000346         035200     IF S22 LESS THAN 11                                          NC1404.2 54
   000347      1  035300              GO TO MOVE-VALUE.                                   NC1404.2 338
   000348         035400     MOVE 1 TO S22.                                               NC1404.2 54
   000349         035500     ADD 1 TO S21.                                                NC1404.2 53
   000350         035600     GO TO MOVE-VALUE.                                            NC1404.2 338
   000351         035700 SECT-TH111-0002 SECTION.                                         NC1404.2
   000352         035800 SET-INIT-001.                                                    NC1404.2
   000353         035900     MOVE ZERO TO REC-CT.                                         NC1404.2 IMP 120
   000354         036000*        THIS TEST VERIFIES THAT THE SET INDEX-NAME UP BY INTEGER NC1404.2
   000355         036100*    FUNCTIONS CORRECTLY. THE INTEGER MAY BE POSITIVE, NEGATIVE,  NC1404.2
   000356         036200*    OR UNSIGNED.                                                 NC1404.2
   000357         036300     MOVE ZERO TO TEMP.                                           NC1404.2 IMP 65
   000358         036400     MOVE 6 TO EXPECTED-VALUE.                                    NC1404.2 64
   000359         036500     MOVE "SET IN UP BY INTEGER" TO FEATURE.                      NC1404.2 69
   000360         036600     MOVE "SET-TEST-001" TO PAR-NAME.                             NC1404.2 73
   000361         036700 SET-TEST-001-01.                                                 NC1404.2
   000362         036800     SET INDEX1 TO 1.                                             NC1404.2 41
   000363         036900     SET INDEX1 UP BY 5.                                          NC1404.2 41
   000364         037000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000365         037100 SET-TEST-001-02.                                                 NC1404.2
   000366         037200     SET INDEX1 TO 1.                                             NC1404.2 41
   000367         037300     SET INDEX1 UP BY +5.                                         NC1404.2 41
   000368         037400     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000369         037500 SET-TEST-001-03.                                                 NC1404.2
   000370         037600     SET INDEX1 TO 11.                                            NC1404.2 41
   000371         037700     SET INDEX1 UP BY -5.                                         NC1404.2 41
   000372         037800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000373         037900 SET-TEST-001-04.                                                 NC1404.2
   000374         038000     SET IN1 TO 1.                                                NC1404.2 45
   000375         038100     SET IN2 INDEX1 TO 2.                                         NC1404.2 49 41
   000376         038200     SET IN2 INDEX1 UP BY 4.                                      NC1404.2 49 41
   000377         038300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000378         038400 SET-TEST-001-05.                                                 NC1404.2
   000379         038500     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000380         038600 SET-TEST-001-06.                                                 NC1404.2
   000381         038700     SET IN2 INDEX1 TO 2.                                         NC1404.2 49 41
   000382         038800     SET IN2 INDEX1 UP BY +4.                                     NC1404.2 49 41
   000383         038900     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000384         039000 SET-TEST-001-07.                                                 NC1404.2
   000385         039100     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000386         039200 SET-TEST-001-08.                                                 NC1404.2
   000387         039300     SET IN2 INDEX1 TO 10.                                        NC1404.2 49 41
   000388         039400     SET IN2 INDEX1 UP BY -4.                                     NC1404.2 49 41
   000389         039500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000390         039600 SET-TEST-001-09.                                                 NC1404.2
   000391         039700     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000392         039800 SET-TEST-001-10.                                                 NC1404.2
   000393         039900     SET IN1 TO 5.                                                NC1404.2 45
   000394         040000     SET IN2 TO 10.                                               NC1404.2 49
   000395         040100     SET IN1 IN2 UP BY -4.                                        NC1404.2 45 49
   000396         040200     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040300 SET-TEST-001-11.                                                 NC1404.2
   000398         040400     SET IN2 INDEX1 TO 10.                                        NC1404.2 49 41
   000399         040500     SET IN1 TO 5.                                                NC1404.2 45
   000400         040600     SET IN1 IN2 INDEX1 UP BY -4.                                 NC1404.2 45 49 41
   000401         040700     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000402         040800 SET-TEST-001-12.                                                 NC1404.2
   000403         040900     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000404         041000     GO TO SET-INIT-002.                                          NC1404.2 408
   000405         041100 SET-DELETE-001.                                                  NC1404.2
   000406         041200     PERFORM DE-LETE.                                             NC1404.2 225
   000407         041300     PERFORM TEST-WRITE.                                          NC1404.2 738
   000408         041400 SET-INIT-002.                                                    NC1404.2
   000409         041500     MOVE ZERO TO REC-CT.                                         NC1404.2 IMP 120
   000410         041600     MOVE "SET-TEST-002" TO PAR-NAME.                             NC1404.2 73
   000411         041700     MOVE ZERO TO TEMP.                                           NC1404.2 IMP 65
   000412         041800     MOVE 54 TO EXPECTED-VALUE.                                   NC1404.2 64
   000413         041900     MOVE "SET IN DOWN BY INTEG" TO FEATURE.                      NC1404.2 69
   000414         042000*       THIS TEST VERIFIES THAT THE SET INDEX-NAME DOWN BY        NC1404.2
   000415         042100*    INTEGER FUNCTIONS CORRECTLY.  THE INTEGER MAY BE POSITIVE,   NC1404.2
   000416         042200*    NEGATIVE, OR UNSIGNED.                                       NC1404.2
   000417         042300 SET-TEST-002-01.                                                 NC1404.2
   000418         042400     SET INDEX1 TO 95.                                            NC1404.2 41
   000419         042500     SET INDEX1 DOWN BY 41.                                       NC1404.2 41
   000420         042600     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000421         042700 SET-TEST-002-02.                                                 NC1404.2
   000422         042800     SET INDEX1 TO 95.                                            NC1404.2 41
   000423         042900     SET INDEX1 DOWN BY +41.                                      NC1404.2 41
   000424         043000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000425         043100 SET-TEST-002-03.                                                 NC1404.2
   000426         043200     SET INDEX1 TO 21.                                            NC1404.2 41
   000427         043300     SET INDEX1 DOWN BY -33.                                      NC1404.2 41
   000428         043400     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000429         043500 SET-TEST-002-04.                                                 NC1404.2
   000430         043600     SET IN1 TO 9.                                                NC1404.2 45
   000431         043700     SET IN2 TO 4.                                                NC1404.2 49
   000432         043800     SET INDEX1 TO 57.                                            NC1404.2 41
   000433         043900     SET IN1 INDEX1 DOWN BY 3.                                    NC1404.2 45 41
   000434         044000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000435         044100 SET-TEST-002-05.                                                 NC1404.2
   000436         044200     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000437         044300 SET-TEST-002-06.                                                 NC1404.2
   000438         044400     SET IN1 TO 9.                                                NC1404.2 45
   000439         044500     SET INDEX1 TO 57.                                            NC1404.2 41
   000440         044600     SET IN1 INDEX1 DOWN BY +3.                                   NC1404.2 45 41
   000441         044700     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000442         044800 SET-TEST-002-07.                                                 NC1404.2
   000443         044900     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000444         045000 SET-TEST-002-08.                                                 NC1404.2
   000445         045100     SET IN1 TO 3.                                                NC1404.2 45
   000446         045200     SET INDEX1 TO 51.                                            NC1404.2 41
   000447         045300     SET INDEX1 IN1 DOWN BY -3.                                   NC1404.2 41 45
   000448         045400     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000449         045500 SET-TEST-002-09.                                                 NC1404.2
   000450         045600     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000451         045700 SET-TEST-002-10.                                                 NC1404.2
   000452         045800     SET IN1 TO 4.                                                NC1404.2 45
   000453         045900     SET IN2 TO 2.                                                NC1404.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046000     SET IN1 IN2 DOWN BY -2.                                      NC1404.2 45 49
   000455         046100     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000456         046200 SET-TEST-002-11.                                                 NC1404.2
   000457         046300     SET IN1 TO 5.                                                NC1404.2 45
   000458         046400     SET IN2 TO 3.                                                NC1404.2 49
   000459         046500     SET INDEX1 TO 53.                                            NC1404.2 41
   000460         046600     SET IN1 IN2 INDEX1 DOWN BY -1.                               NC1404.2 45 49 41
   000461         046700     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000462         046800 SET-TEST-002-12.                                                 NC1404.2
   000463         046900     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000464         047000     GO TO SET-INIT-003.                                          NC1404.2 468
   000465         047100 SET-DELETE-002.                                                  NC1404.2
   000466         047200     PERFORM DE-LETE.                                             NC1404.2 225
   000467         047300     PERFORM TEST-WRITE.                                          NC1404.2 738
   000468         047400 SET-INIT-003.                                                    NC1404.2
   000469         047500     MOVE ZERO TO REC-CT.                                         NC1404.2 IMP 120
   000470         047600     MOVE "SET-TEST-003" TO PAR-NAME.                             NC1404.2 73
   000471         047700     MOVE ZERO TO TEMP.                                           NC1404.2 IMP 65
   000472         047800     MOVE 39 TO EXPECTED-VALUE.                                   NC1404.2 64
   000473         047900     MOVE "SET IN UP BY DATA-NM" TO FEATURE.                      NC1404.2 69
   000474         048000*        THIS TEST VERIFIES THAT THE SET INDEX-NAME UP BY         NC1404.2
   000475         048100*    DATA-NAME FUNCTIONS CORRECTLY.  THE VALUE STORED IN DATA-NAMENC1404.2
   000476         048200*    MAY BE POSITIVE, NEGATIVE OR ZERO.  VARIOUS DATA TYPES ARE   NC1404.2
   000477         048300*    USED IN THE TEST.                                            NC1404.2
   000478         048400 SET-TEST-003-01.                                                 NC1404.2
   000479         048500     SET INDEX1 TO 21.                                            NC1404.2 41
   000480         048600     MOVE +18 TO CS-3.                                            NC1404.2 56
   000481         048700     SET INDEX1 UP BY CS-3.                                       NC1404.2 41 56
   000482         048800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000483         048900 SET-TEST-003-02.                                                 NC1404.2
   000484         049000     SET INDEX1 TO 21.                                            NC1404.2 41
   000485         049100     MOVE +18 TO DS-3.                                            NC1404.2 58
   000486         049200     SET INDEX1 UP BY DS-3.                                       NC1404.2 41 58
   000487         049300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000488         049400 SET-TEST-003-03.                                                 NC1404.2
   000489         049500     SET INDEX1 TO 21.                                            NC1404.2 41
   000490         049600     MOVE +18 TO DS-LS-3.                                         NC1404.2 60
   000491         049700     SET INDEX1  UP BY DS-LS-3.                                   NC1404.2 41 60
   000492         049800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000493         049900 SET-TEST-003-04.                                                 NC1404.2
   000494         050000     SET INDEX1 TO 21.                                            NC1404.2 41
   000495         050100     MOVE +18 TO DS-TS-3.                                         NC1404.2 62
   000496         050200     SET INDEX1 UP BY DS-TS-3.                                    NC1404.2 41 62
   000497         050300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000498         050400 SET-TEST-003-05.                                                 NC1404.2
   000499         050500     SET INDEX1 TO 21.                                            NC1404.2 41
   000500         050600     MOVE 18 TO CU-3.                                             NC1404.2 57
   000501         050700     SET INDEX1 UP BY CU-3.                                       NC1404.2 41 57
   000502         050800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000503         050900 SET-TEST-003-06.                                                 NC1404.2
   000504         051000     SET INDEX1 TO 21.                                            NC1404.2 41
   000505         051100     MOVE 18 TO DU-3.                                             NC1404.2 59
   000506         051200     SET INDEX1 UP BY DU-3.                                       NC1404.2 41 59
   000507         051300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000508         051400 SET-TEST-003-07.                                                 NC1404.2
   000509         051500     SET INDEX1 TO 39.                                            NC1404.2 41
   000510         051600     MOVE 0 TO CS-3.                                              NC1404.2 56
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051700     SET INDEX1 UP BY CS-3.                                       NC1404.2 41 56
   000512         051800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000513         051900 SET-TEST-003-08.                                                 NC1404.2
   000514         052000     SET INDEX1 TO 39.                                            NC1404.2 41
   000515         052100     MOVE ZERO TO DS-3.                                           NC1404.2 IMP 58
   000516         052200     SET INDEX1 UP BY DS-3.                                       NC1404.2 41 58
   000517         052300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000518         052400 SET-TEST-003-09.                                                 NC1404.2
   000519         052500     SET INDEX1 TO 39.                                            NC1404.2 41
   000520         052600     MOVE 0 TO DS-LS-3.                                           NC1404.2 60
   000521         052700     SET INDEX1 UP BY DS-LS-3.                                    NC1404.2 41 60
   000522         052800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000523         052900 SET-TEST-003-10.                                                 NC1404.2
   000524         053000     SET INDEX1 TO 39.                                            NC1404.2 41
   000525         053100     MOVE ZERO TO DS-TS-3.                                        NC1404.2 IMP 62
   000526         053200     SET INDEX1 UP BY DS-TS-3.                                    NC1404.2 41 62
   000527         053300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000528         053400 SET-TEST-003-11.                                                 NC1404.2
   000529         053500     SET INDEX1 TO 39.                                            NC1404.2 41
   000530         053600     MOVE 0 TO CU-3.                                              NC1404.2 57
   000531         053700     SET INDEX1 UP BY CU-3.                                       NC1404.2 41 57
   000532         053800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000533         053900 SET-TEST-003-12.                                                 NC1404.2
   000534         054000     SET INDEX1 TO 39.                                            NC1404.2 41
   000535         054100     MOVE ZERO TO DU-3.                                           NC1404.2 IMP 59
   000536         054200     SET INDEX1 UP BY DU-3.                                       NC1404.2 41 59
   000537         054300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000538         054400 SET-TEST-003-13.                                                 NC1404.2
   000539         054500     SET INDEX1 TO 70.                                            NC1404.2 41
   000540         054600     MOVE -31 TO CS-3.                                            NC1404.2 56
   000541         054700     SET INDEX1 UP BY CS-3.                                       NC1404.2 41 56
   000542         054800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000543         054900 SET-TEST-003-14.                                                 NC1404.2
   000544         055000     SET INDEX1 TO 70.                                            NC1404.2 41
   000545         055100     MOVE -31 TO DS-3.                                            NC1404.2 58
   000546         055200     SET INDEX1 UP BY DS-3.                                       NC1404.2 41 58
   000547         055300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000548         055400 SET-TEST-003-15.                                                 NC1404.2
   000549         055500     SET INDEX1 TO 70.                                            NC1404.2 41
   000550         055600     MOVE -31 TO DS-LS-3.                                         NC1404.2 60
   000551         055700     SET INDEX1 UP BY DS-LS-3.                                    NC1404.2 41 60
   000552         055800     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000553         055900 SET-TEST-003-16.                                                 NC1404.2
   000554         056000     SET INDEX1 TO 70.                                            NC1404.2 41
   000555         056100     MOVE -31 TO DS-TS-3.                                         NC1404.2 62
   000556         056200     SET INDEX1 UP BY DS-TS-3.                                    NC1404.2 41 62
   000557         056300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000558         056400 SET-TEST-003-17.                                                 NC1404.2
   000559         056500     SET IN1 TO 1.                                                NC1404.2 45
   000560         056600     SET IN2 TO 6.                                                NC1404.2 49
   000561         056700     MOVE +3 TO DS-LS-3.                                          NC1404.2 60
   000562         056800     SET IN1 IN2 UP BY DS-LS-3.                                   NC1404.2 45 49 60
   000563         056900     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000564         057000 SET-TEST-003-18.                                                 NC1404.2
   000565         057100     SET IN1 TO 1.                                                NC1404.2 45
   000566         057200     SET IN2 TO 6.                                                NC1404.2 49
   000567         057300     MOVE +3 TO CS-3.                                             NC1404.2 56
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057400     SET INDEX1 TO 36.                                            NC1404.2 41
   000569         057500     SET IN1 IN2 INDEX1 UP BY CS-3.                               NC1404.2 45 49 41 56
   000570         057600     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000571         057700 SET-TEST-003-19.                                                 NC1404.2
   000572         057800     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000573         057900 SET-TEST-003-20.                                                 NC1404.2
   000574         058000     SET IN1 TO 5.                                                NC1404.2 45
   000575         058100     SET IN2 TO 10.                                               NC1404.2 49
   000576         058200     SET INDEX1 TO 40.                                            NC1404.2 41
   000577         058300     MOVE -1 TO DS-TS-3.                                          NC1404.2 62
   000578         058400     SET IN1 IN2 INDEX1 UP BY DS-TS-3.                            NC1404.2 45 49 41 62
   000579         058500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000580         058600 SET-TEST-003-21.                                                 NC1404.2
   000581         058700     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000582         058800 SET-TEST-003-22.                                                 NC1404.2
   000583         058900     SET IN1 TO 4.                                                NC1404.2 45
   000584         059000     SET IN2 TO 9.                                                NC1404.2 49
   000585         059100     SET INDEX1 TO 39.                                            NC1404.2 41
   000586         059200     MOVE ZERO TO CU-3.                                           NC1404.2 IMP 57
   000587         059300     SET IN1 IN2 INDEX1 UP BY CU-3.                               NC1404.2 45 49 41 57
   000588         059400     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000589         059500 SET-TEST-003-23.                                                 NC1404.2
   000590         059600     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000591         059700     GO TO SET-INIT-004.                                          NC1404.2 595
   000592         059800 SET-DELETE-003.                                                  NC1404.2
   000593         059900     PERFORM DE-LETE.                                             NC1404.2 225
   000594         060000     PERFORM TEST-WRITE.                                          NC1404.2 738
   000595         060100 SET-INIT-004.                                                    NC1404.2
   000596         060200     MOVE ZERO TO REC-CT.                                         NC1404.2 IMP 120
   000597         060300     MOVE "SET-TEST-004" TO PAR-NAME.                             NC1404.2 73
   000598         060400     MOVE ZERO TO TEMP.                                           NC1404.2 IMP 65
   000599         060500     MOVE 77 TO EXPECTED-VALUE.                                   NC1404.2 64
   000600         060600     MOVE "SET IN DOWN BY DNAME" TO FEATURE.                      NC1404.2 69
   000601         060700*        THIS TEST VERIFIES THAT THE SET INDEX-NAME DOWN BY       NC1404.2
   000602         060800*    DATA-NAME FUNCTIONS CORRECTLY.  THE VALUE STORED IN DATA-NAMENC1404.2
   000603         060900*    MAY BE POSITIVE, NEGATIVE OR ZERO.  VARIOUS DATA TYPES ARE   NC1404.2
   000604         061000*    USED IN THE TEST.                                            NC1404.2
   000605         061100 SET-TEST-004-01.                                                 NC1404.2
   000606         061200     SET INDEX1 TO 100.                                           NC1404.2 41
   000607         061300     MOVE +23 TO CS-3.                                            NC1404.2 56
   000608         061400     SET INDEX1 DOWN BY CS-3.                                     NC1404.2 41 56
   000609         061500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000610         061600 SET-TEST-004-02.                                                 NC1404.2
   000611         061700     SET INDEX1 TO 100.                                           NC1404.2 41
   000612         061800     MOVE +23 TO DS-3.                                            NC1404.2 58
   000613         061900     SET INDEX1 DOWN BY DS-3.                                     NC1404.2 41 58
   000614         062000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000615         062100 SET-TEST-004-03.                                                 NC1404.2
   000616         062200     SET INDEX1 TO 100.                                           NC1404.2 41
   000617         062300     MOVE +23 TO DS-LS-3.                                         NC1404.2 60
   000618         062400     SET INDEX1 DOWN BY DS-LS-3.                                  NC1404.2 41 60
   000619         062500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000620         062600 SET-TEST-004-04.                                                 NC1404.2
   000621         062700     SET INDEX1 TO 100.                                           NC1404.2 41
   000622         062800     MOVE +23 TO DS-TS-3.                                         NC1404.2 62
   000623         062900     SET INDEX1 DOWN BY DS-TS-3.                                  NC1404.2 41 62
   000624         063000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         063100 SET-TEST-004-05.                                                 NC1404.2
   000626         063200     SET INDEX1 TO 100.                                           NC1404.2 41
   000627         063300     MOVE 23 TO CU-3.                                             NC1404.2 57
   000628         063400     SET INDEX1 DOWN BY CU-3.                                     NC1404.2 41 57
   000629         063500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000630         063600 SET-TEST-004-06.                                                 NC1404.2
   000631         063700     SET INDEX1 TO 100.                                           NC1404.2 41
   000632         063800     MOVE 23 TO DU-3.                                             NC1404.2 59
   000633         063900     SET INDEX1 DOWN BY DU-3.                                     NC1404.2 41 59
   000634         064000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000635         064100 SET-TEST-004-07.                                                 NC1404.2
   000636         064200     MOVE ZERO TO CS-3.                                           NC1404.2 IMP 56
   000637         064300     SET INDEX1 TO 77.                                            NC1404.2 41
   000638         064400     SET INDEX1 DOWN BY CS-3.                                     NC1404.2 41 56
   000639         064500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000640         064600 SET-TEST-004-08.                                                 NC1404.2
   000641         064700     MOVE 0 TO DS-3.                                              NC1404.2 58
   000642         064800     SET INDEX1 TO 77.                                            NC1404.2 41
   000643         064900     SET INDEX1 DOWN BY DS-3.                                     NC1404.2 41 58
   000644         065000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000645         065100 SET-TEST-004-09.                                                 NC1404.2
   000646         065200     MOVE 0 TO DS-LS-3.                                           NC1404.2 60
   000647         065300     SET INDEX1 TO 77.                                            NC1404.2 41
   000648         065400     SET INDEX1 DOWN BY DS-LS-3.                                  NC1404.2 41 60
   000649         065500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000650         065600 SET-TEST-004-10.                                                 NC1404.2
   000651         065700     MOVE ZERO TO DS-TS-3.                                        NC1404.2 IMP 62
   000652         065800     SET INDEX1 TO 77.                                            NC1404.2 41
   000653         065900     SET INDEX1 DOWN BY DS-TS-3.                                  NC1404.2 41 62
   000654         066000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000655         066100 SET-TEST-004-11.                                                 NC1404.2
   000656         066200     MOVE 0 TO CU-3.                                              NC1404.2 57
   000657         066300     SET INDEX1 TO 77.                                            NC1404.2 41
   000658         066400     SET INDEX1 DOWN BY CU-3.                                     NC1404.2 41 57
   000659         066500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000660         066600 SET-TEST-004-12.                                                 NC1404.2
   000661         066700     MOVE ZERO TO DU-3.                                           NC1404.2 IMP 59
   000662         066800     SET INDEX1 TO 77.                                            NC1404.2 41
   000663         066900     SET INDEX1 DOWN BY DU-3.                                     NC1404.2 41 59
   000664         067000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000665         067100 SET-TEST-004-13.                                                 NC1404.2
   000666         067200     SET INDEX1 TO 2.                                             NC1404.2 41
   000667         067300     MOVE -75 TO CS-3.                                            NC1404.2 56
   000668         067400     SET INDEX1 DOWN BY CS-3.                                     NC1404.2 41 56
   000669         067500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000670         067600 SET-TEST-004-14.                                                 NC1404.2
   000671         067700     SET INDEX1 TO 2.                                             NC1404.2 41
   000672         067800     MOVE -75 TO DS-3.                                            NC1404.2 58
   000673         067900     SET INDEX1 DOWN BY DS-3.                                     NC1404.2 41 58
   000674         068000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000675         068100 SET-TEST-004-15.                                                 NC1404.2
   000676         068200     SET INDEX1 TO 2.                                             NC1404.2 41
   000677         068300     MOVE -75 TO DS-LS-3.                                         NC1404.2 60
   000678         068400     SET INDEX1 DOWN BY DS-LS-3.                                  NC1404.2 41 60
   000679         068500     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000680         068600 SET-TEST-004-16.                                                 NC1404.2
   000681         068700     SET INDEX1 TO 2.                                             NC1404.2 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068800     MOVE -75 TO DS-TS-3.                                         NC1404.2 62
   000683         068900     SET INDEX1 DOWN BY DS-TS-3.                                  NC1404.2 41 62
   000684         069000     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000685         069100 SET-TEST-004-17.                                                 NC1404.2
   000686         069200     SET IN1 TO 10.                                               NC1404.2 45
   000687         069300     SET IN2 TO 9.                                                NC1404.2 49
   000688         069400     MOVE +2 TO DS-TS-3.                                          NC1404.2 62
   000689         069500     SET IN1 IN2 DOWN BY DS-TS-3.                                 NC1404.2 45 49 62
   000690         069600     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000691         069700 SET-TEST-004-18.                                                 NC1404.2
   000692         069800     SET IN1 TO 10.                                               NC1404.2 45
   000693         069900     SET IN2 TO 9.                                                NC1404.2 49
   000694         070000     SET INDEX1 TO 79.                                            NC1404.2 41
   000695         070100     MOVE 2 TO CU-3.                                              NC1404.2 57
   000696         070200     SET IN1 IN2 INDEX1 DOWN BY CU-3.                             NC1404.2 45 49 41 57
   000697         070300     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000698         070400 SET-TEST-004-19.                                                 NC1404.2
   000699         070500     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000700         070600 SET-TEST-004-20.                                                 NC1404.2
   000701         070700     SET IN1 TO 3.                                                NC1404.2 45
   000702         070800     SET IN2 TO 2.                                                NC1404.2 49
   000703         070900     SET INDEX1 TO 72.                                            NC1404.2 41
   000704         071000     MOVE -5 TO DS-3.                                             NC1404.2 58
   000705         071100     SET INDEX1 IN1 IN2 DOWN BY DS-3.                             NC1404.2 41 45 49 58
   000706         071200     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000707         071300 SET-TEST-004-21.                                                 NC1404.2
   000708         071400     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000709         071500 SET-TEST-004-22.                                                 NC1404.2
   000710         071600     MOVE ZERO TO DS-TS-3.                                        NC1404.2 IMP 62
   000711         071700     SET IN1 TO 8.                                                NC1404.2 45
   000712         071800     SET IN2 TO 7.                                                NC1404.2 49
   000713         071900     SET INDEX1 TO 77.                                            NC1404.2 41
   000714         072000     SET IN1 IN2 INDEX1 DOWN BY DS-TS-3.                          NC1404.2 45 49 41 62
   000715         072100     PERFORM TEST-CHECK1 THRU TEST-WRITE.                         NC1404.2 724 738
   000716         072200 SET-TEST-004-23.                                                 NC1404.2
   000717         072300     PERFORM TEST-CHECK2 THRU TEST-WRITE.                         NC1404.2 727 738
   000718         072400     GO TO CCVS-EXIT.                                             NC1404.2 741
   000719         072500 SET-DELETE-004.                                                  NC1404.2
   000720         072600     PERFORM DE-LETE.                                             NC1404.2 225
   000721         072700     PERFORM TEST-WRITE.                                          NC1404.2 738
   000722         072800     GO TO CCVS-EXIT.                                             NC1404.2 741
   000723         072900 SECT-TH111-0003 SECTION.                                         NC1404.2
   000724         073000 TEST-CHECK1.                                                     NC1404.2
   000725         073100     MOVE ELEM1 (INDEX1) TO TEMP.                                 NC1404.2 40 41 65
   000726         073200     GO TO TEST-CHECK.                                            NC1404.2 729
   000727         073300 TEST-CHECK2.                                                     NC1404.2
   000728         073400     MOVE ELEM2 (IN1 IN2) TO TEMP.                                NC1404.2 46 45 49 65
   000729         073500 TEST-CHECK.                                                      NC1404.2
   000730         073600     ADD 1 TO REC-CT.                                             NC1404.2 120
   000731         073700     IF TEMP IS EQUAL TO EXPECTED-VALUE                           NC1404.2 65 64
   000732      1  073800          PERFORM PASS                                            NC1404.2 223
   000733      1  073900          GO TO TEST-WRITE.                                       NC1404.2 738
   000734         074000 TEST-FAIL.                                                       NC1404.2
   000735         074100     PERFORM FAIL.                                                NC1404.2 224
   000736         074200     MOVE TEMP TO COMPUTED-18V0.                                  NC1404.2 65 91
   000737         074300     MOVE EXPECTED-VALUE TO CORRECT-18V0.                         NC1404.2 64 104
   000738         074400 TEST-WRITE.                                                      NC1404.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074500     PERFORM PRINT-DETAIL.                                        NC1404.2 227
   000740         074600     MOVE ZERO TO TEMP.                                           NC1404.2 IMP 65
   000741         074700 CCVS-EXIT SECTION.                                               NC1404.2
   000742         074800 CCVS-999999.                                                     NC1404.2
   000743         074900     GO TO CLOSE-FILES.                                           NC1404.2 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      129   ANSI-REFERENCE . . . . . . . .  306 313 322 M335
      108   CCVS-C-1 . . . . . . . . . . .  245 291
      113   CCVS-C-2 . . . . . . . . . . .  246 292
      163   CCVS-E-1 . . . . . . . . . . .  251
      168   CCVS-E-2 . . . . . . . . . . .  260 267 274 279
      171   CCVS-E-2-2 . . . . . . . . . .  M259
      176   CCVS-E-3 . . . . . . . . . . .  280
      185   CCVS-E-4 . . . . . . . . . . .  259
      186   CCVS-E-4-1 . . . . . . . . . .  M257
      188   CCVS-E-4-2 . . . . . . . . . .  M258
      130   CCVS-H-1 . . . . . . . . . . .  240 287
      135   CCVS-H-2A. . . . . . . . . . .  241 288
      144   CCVS-H-2B. . . . . . . . . . .  242 289
      156   CCVS-H-3 . . . . . . . . . . .  243 290
      206   CCVS-PGM-ID. . . . . . . . . .  212 212
       90   CM-18V0
       84   COMPUTED-A . . . . . . . . . .  85 87 88 89 90 318 321
       85   COMPUTED-N
       83   COMPUTED-X . . . . . . . . . .  M235 303
       87   COMPUTED-0V18
       89   COMPUTED-14V4
       91   COMPUTED-18V0. . . . . . . . .  M736
       88   COMPUTED-4V14
      107   COR-ANSI-REFERENCE . . . . . .  M313 M315
       98   CORRECT-A. . . . . . . . . . .  99 100 101 102 103 319 321
       99   CORRECT-N
       97   CORRECT-X. . . . . . . . . . .  M236 305
      100   CORRECT-0V18
      102   CORRECT-14V4
      104   CORRECT-18V0 . . . . . . . . .  M737
      101   CORRECT-4V14
      103   CR-18V0
       56   CS-3 . . . . . . . . . . . . .  M480 481 M510 511 M540 541 M567 569 M607 608 M636 638 M667 668
       57   CU-3 . . . . . . . . . . . . .  M500 501 M530 531 M586 587 M627 628 M656 658 M695 696
      121   DELETE-COUNTER . . . . . . . .  M225 254 270 272
       76   DOTVALUE . . . . . . . . . . .  M230
       60   DS-LS-3. . . . . . . . . . . .  M490 491 M520 521 M550 551 M561 562 M617 618 M646 648 M677 678
       62   DS-TS-3. . . . . . . . . . . .  M495 496 M525 526 M555 556 M577 578 M622 623 M651 653 M682 683 M688 689 M710
                                            714
       58   DS-3 . . . . . . . . . . . . .  M485 486 M515 516 M545 546 M612 613 M641 643 M672 673 M704 705
       59   DU-3 . . . . . . . . . . . . .  M505 506 M535 536 M632 633 M661 663
      127   DUMMY-HOLD . . . . . . . . . .  M284 294
       37   DUMMY-RECORD . . . . . . . . .  M240 M241 M242 M243 M245 M246 M247 M249 M251 M260 M267 M274 M279 M280 284 M285
                                            286 M287 M288 M289 M290 M291 M292 M293 M294 298 M299 M308 M323
       40   ELEM1. . . . . . . . . . . . .  M340 725
       46   ELEM2. . . . . . . . . . . . .  M340 728
      174   ENDER-DESC . . . . . . . . . .  M262 M273 M278
      122   ERROR-COUNTER. . . . . . . . .  M224 253 263 266
      126   ERROR-HOLD . . . . . . . . . .  M253 M254 M254 M255 258
      172   ERROR-TOTAL. . . . . . . . . .  M264 M266 M271 M272 M276 M277
       64   EXPECTED-VALUE . . . . . . . .  M358 M412 M472 M599 731 737
       69   FEATURE. . . . . . . . . . . .  M359 M413 M473 M600
       44   GROUP1
       51   GRP-SUB
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    18
0 Defined   Cross-reference of data names   References

0      39   GRP-TABLE1
       43   GRP-TABLE2
      200   HYPHEN-LINE. . . . . . . . . .  247 249 293
      166   ID-AGAIN . . . . . . . . . . .  M212
       41   INDEX1 . . . . . . . . . . . .  M362 M363 M366 M367 M370 M371 M375 M376 M381 M382 M387 M388 M398 M400 M418 M419
                                            M422 M423 M426 M427 M432 M433 M439 M440 M446 M447 M459 M460 M479 M481 M484 M486
                                            M489 M491 M494 M496 M499 M501 M504 M506 M509 M511 M514 M516 M519 M521 M524 M526
                                            M529 M531 M534 M536 M539 M541 M544 M546 M549 M551 M554 M556 M568 M569 M576 M578
                                            M585 M587 M606 M608 M611 M613 M616 M618 M621 M623 M626 M628 M631 M633 M637 M638
                                            M642 M643 M647 M648 M652 M653 M657 M658 M662 M663 M666 M668 M671 M673 M676 M678
                                            M681 M683 M694 M696 M703 M705 M713 M714 725
      199   INF-ANSI-REFERENCE . . . . . .  M306 M309 M322 M324
      194   INFO-TEXT. . . . . . . . . . .  M307
      123   INSPECT-COUNTER. . . . . . . .  M222 253 275 277
       45   IN1. . . . . . . . . . . . . .  M374 M393 M395 M399 M400 M430 M433 M438 M440 M445 M447 M452 M454 M457 M460 M559
                                            M562 M565 M569 M574 M578 M583 M587 M686 M689 M692 M696 M701 M705 M711 M714 728
       49   IN2. . . . . . . . . . . . . .  M375 M376 M381 M382 M387 M388 M394 M395 M398 M400 M431 M453 M454 M458 M460 M560
                                            M562 M566 M569 M575 M578 M584 M587 M687 M689 M693 M696 M702 M705 M712 M714 728
       71   P-OR-F . . . . . . . . . . . .  M222 M223 M224 M225 232 M235
       73   PAR-NAME . . . . . . . . . . .  M237 M360 M410 M470 M597
       75   PARDOT-X . . . . . . . . . . .  M229
      124   PASS-COUNTER . . . . . . . . .  M223 255 257
       35   PRINT-FILE . . . . . . . . . .  31 211 217
       36   PRINT-REC. . . . . . . . . . .  M231 M312 M314
       78   RE-MARK. . . . . . . . . . . .  M226 M238
      120   REC-CT . . . . . . . . . . . .  228 230 237 M353 M409 M469 M596 M730
      119   REC-SKL-SUB
      128   RECORD-COUNT . . . . . . . . .  M282 283 M295
       52   S1 . . . . . . . . . . . . . .  340 M344
       53   S21. . . . . . . . . . . . . .  340 M349
       54   S22. . . . . . . . . . . . . .  340 M345 346 M348
       65   TEMP . . . . . . . . . . . . .  M357 M411 M471 M598 M725 M728 731 736 M740
       79   TEST-COMPUTED. . . . . . . . .  312
       94   TEST-CORRECT . . . . . . . . .  314
      147   TEST-ID. . . . . . . . . . . .  M212
       67   TEST-RESULTS . . . . . . . . .  M213 231
      125   TOTAL-ERROR
       66   WRK1 . . . . . . . . . . . . .  M339 340 341
      196   XXCOMPUTED . . . . . . . . . .  M321
      198   XXCORRECT. . . . . . . . . . .  M321
      191   XXINFO . . . . . . . . . . . .  308 323
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    19
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

      317   BAIL-OUT . . . . . . . . . . .  P234
      325   BAIL-OUT-EX. . . . . . . . . .  E234 G319
      320   BAIL-OUT-WRITE . . . . . . . .  G318
      300   BLANK-LINE-PRINT
      741   CCVS-EXIT. . . . . . . . . . .  G718 G722
      742   CCVS-999999
      209   CCVS1
      326   CCVS1-EXIT . . . . . . . . . .  G215
      216   CLOSE-FILES. . . . . . . . . .  G743
      244   COLUMN-NAMES-ROUTINE . . . . .  E214
      225   DE-LETE. . . . . . . . . . . .  P406 P466 P593 P720
      248   END-ROUTINE. . . . . . . . . .  P217
      252   END-ROUTINE-1
      261   END-ROUTINE-12
      269   END-ROUTINE-13 . . . . . . . .  E217
      250   END-RTN-EXIT
      224   FAIL . . . . . . . . . . . . .  P735
      302   FAIL-ROUTINE . . . . . . . . .  P233
      316   FAIL-ROUTINE-EX. . . . . . . .  E233 G310
      311   FAIL-ROUTINE-WRITE . . . . . .  G304 G305
      239   HEAD-ROUTINE . . . . . . . . .  P214
      343   INCRE-SUBS
      222   INSPT
      338   MOVE-VALUE . . . . . . . . . .  G347 G350
      334   NC140A-0001
      210   OPEN-FILES
      223   PASS . . . . . . . . . . . . .  P732
      227   PRINT-DETAIL . . . . . . . . .  P739
      333   SECT-NC140A-0001
      351   SECT-TH111-0002. . . . . . . .  G342
      723   SECT-TH111-0003
      405   SET-DELETE-001
      465   SET-DELETE-002
      592   SET-DELETE-003
      719   SET-DELETE-004
      352   SET-INIT-001
      408   SET-INIT-002 . . . . . . . . .  G404
      468   SET-INIT-003 . . . . . . . . .  G464
      595   SET-INIT-004 . . . . . . . . .  G591
      361   SET-TEST-001-01
      365   SET-TEST-001-02
      369   SET-TEST-001-03
      373   SET-TEST-001-04
      378   SET-TEST-001-05
      380   SET-TEST-001-06
      384   SET-TEST-001-07
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    20
0 Defined   Cross-reference of procedures   References

0     386   SET-TEST-001-08
      390   SET-TEST-001-09
      392   SET-TEST-001-10
      397   SET-TEST-001-11
      402   SET-TEST-001-12
      417   SET-TEST-002-01
      421   SET-TEST-002-02
      425   SET-TEST-002-03
      429   SET-TEST-002-04
      435   SET-TEST-002-05
      437   SET-TEST-002-06
      442   SET-TEST-002-07
      444   SET-TEST-002-08
      449   SET-TEST-002-09
      451   SET-TEST-002-10
      456   SET-TEST-002-11
      462   SET-TEST-002-12
      478   SET-TEST-003-01
      483   SET-TEST-003-02
      488   SET-TEST-003-03
      493   SET-TEST-003-04
      498   SET-TEST-003-05
      503   SET-TEST-003-06
      508   SET-TEST-003-07
      513   SET-TEST-003-08
      518   SET-TEST-003-09
      523   SET-TEST-003-10
      528   SET-TEST-003-11
      533   SET-TEST-003-12
      538   SET-TEST-003-13
      543   SET-TEST-003-14
      548   SET-TEST-003-15
      553   SET-TEST-003-16
      558   SET-TEST-003-17
      564   SET-TEST-003-18
      571   SET-TEST-003-19
      573   SET-TEST-003-20
      580   SET-TEST-003-21
      582   SET-TEST-003-22
      589   SET-TEST-003-23
      605   SET-TEST-004-01
      610   SET-TEST-004-02
      615   SET-TEST-004-03
      620   SET-TEST-004-04
      625   SET-TEST-004-05
      630   SET-TEST-004-06
      635   SET-TEST-004-07
      640   SET-TEST-004-08
      645   SET-TEST-004-09
      650   SET-TEST-004-10
      655   SET-TEST-004-11
      660   SET-TEST-004-12
      665   SET-TEST-004-13
      670   SET-TEST-004-14
      675   SET-TEST-004-15
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    21
0 Defined   Cross-reference of procedures   References

0     680   SET-TEST-004-16
      685   SET-TEST-004-17
      691   SET-TEST-004-18
      698   SET-TEST-004-19
      700   SET-TEST-004-20
      707   SET-TEST-004-21
      709   SET-TEST-004-22
      716   SET-TEST-004-23
      220   TERMINATE-CALL
      218   TERMINATE-CCVS
      729   TEST-CHECK . . . . . . . . . .  G726
      724   TEST-CHECK1. . . . . . . . . .  P364 P368 P372 P377 P383 P389 P401 P420 P424 P428 P434 P441 P448 P461 P482 P487
                                            P492 P497 P502 P507 P512 P517 P522 P527 P532 P537 P542 P547 P552 P557 P563 P570
                                            P579 P588 P609 P614 P619 P624 P629 P634 P639 P644 P649 P654 P659 P664 P669 P674
                                            P679 P684 P697 P706 P715
      727   TEST-CHECK2. . . . . . . . . .  P379 P385 P391 P396 P403 P436 P443 P450 P455 P463 P572 P581 P590 P690 P699 P708
                                            P717
      734   TEST-FAIL
      738   TEST-WRITE . . . . . . . . . .  E364 E368 E372 E377 E379 E383 E385 E389 E391 E396 E401 E403 P407 E420 E424 E428
                                            E434 E436 E441 E443 E448 E450 E455 E461 E463 P467 E482 E487 E492 E497 E502 E507
                                            E512 E517 E522 E527 E532 E537 E542 E547 E552 E557 E563 E570 E572 E579 E581 E588
                                            E590 P594 E609 E614 E619 E624 E629 E634 E639 E644 E649 E654 E659 E664 E669 E674
                                            E679 E684 E690 E697 E699 E706 E708 E715 E717 P721 G733
      281   WRITE-LINE . . . . . . . . . .  P231 P232 P240 P241 P242 P243 P245 P246 P247 P249 P251 P260 P268 P274 P279 P280
                                            P308 P312 P314 P323
      297   WRT-LN . . . . . . . . . . . .  P287 P288 P289 P290 P291 P292 P293 P296 P301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    22
0 Defined   Cross-reference of programs     References

        3   NC140A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC140A    Date 06/04/2022  Time 11:59:41   Page    23
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC140A:
 *    Source records = 743
 *    Data Division statements = 81
 *    Procedure Division statements = 439
 *    Generated COBOL statements = 0
 *    Program complexity factor = 449
0End of compilation 1,  program NC140A,  highest severity 0.
0Return code 0
