1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:55   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:55   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1384.2
   000002         000200 PROGRAM-ID.                                                      NC1384.2
   000003         000300     NC138A.                                                      NC1384.2
   000004         000500*                                                              *  NC1384.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1384.2
   000006         000700*                                                              *  NC1384.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1384.2
   000008         000900*                                                              *  NC1384.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1384.2
   000010         001100*                                                              *  NC1384.2
   000011         001300*                                                              *  NC1384.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1384.2
   000013         001500*                                                              *  NC1384.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1384.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1384.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1384.2
   000017         001900*                                                              *  NC1384.2
   000018         002100*                                                                 NC1384.2
   000019         002200*    PROGRAM NC138A TESTS THE USE OF SPACES, COMMAS,              NC1384.2
   000020         002300*    SEMI-COLONS AND LEFT AND RIGHT PARENTHESIS AS SEPARATORS     NC1384.2
   000021         002400*    IN STATEMENTS WHICH REFERENCE TABLE ITEMS.                   NC1384.2
   000022         002500*                                                                 NC1384.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1384.2
   000024         002700 CONFIGURATION SECTION.                                           NC1384.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1384.2
   000026         002900     XXXXX082.                                                    NC1384.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1384.2
   000028         003100     XXXXX083.                                                    NC1384.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1384.2
   000030         003300 FILE-CONTROL.                                                    NC1384.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1384.2 35
   000032         003500     XXXXX055.                                                    NC1384.2
   000033         003600 DATA DIVISION.                                                   NC1384.2
   000034         003700 FILE SECTION.                                                    NC1384.2
   000035         003800 FD  PRINT-FILE.                                                  NC1384.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1384.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1384.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1384.2
   000039         004200 77  WRK1    PIC S999  VALUE ZERO.                                NC1384.2 IMP
   000040         004300 77  TEMP  PIC S9(5).                                             NC1384.2
   000041         004400 77  EXPECTED-VALUE   PIC  S9(5).                                 NC1384.2
   000042         004500*    SUBSCRIPTS FOR REFERENCING TABLE ITEMS.                      NC1384.2
   000043         004600 77  S1     PIC  S999 VALUE 1.                                    NC1384.2
   000044         004700 77  S21    PIC  S999 VALUE 1.                                    NC1384.2
   000045         004800 77  S22    PIC  S999 SIGN IS LEADING SEPARATE CHARACTER          NC1384.2
   000046         004900        VALUE 1.                                                  NC1384.2
   000047         005000 77  S31    PIC  S999 COMPUTATIONAL  VALUE 1.                     NC1384.2
   000048         005100 77  S32    PIC  S999 SYNC LEFT VALUE 1.                          NC1384.2
   000049         005200 77  S33    PIC  S999            VALUE 1.                         NC1384.2
   000050         005300*    ONE DIMENSIONAL TABLE.                                       NC1384.2
   000051         005400 01  GRP-TAB1.                                                    NC1384.2
   000052         005500     02  ELEM1  PIC 99                                            NC1384.2
   000053         005600         OCCURS 60 TIMES.                                         NC1384.2
   000054         005700*    TWO DIMENSIONAL TABLE,  12 BY 5.                             NC1384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  GRP-TAP2.                                                    NC1384.2
   000056         005900     02  GRP-LEV2-O012F    OCCURS 12 TIMES.                       NC1384.2
   000057         006000         03  ELEM2   PIC 9999  COMPUTATIONAL                      NC1384.2
   000058         006100             OCCURS 5 TIMES.                                      NC1384.2
   000059         006200*    THREE DIMENSIONAL TABLE,  4 BY 3 BY 5.                       NC1384.2
   000060         006300 01  GRP-TAB3.                                                    NC1384.2
   000061         006400     02 GRP-LEV2-00004F                                           NC1384.2
   000062         006500           OCCURS 4 TIMES                                         NC1384.2
   000063         006600           INDEXED BY WRK-IX-0001.                                NC1384.2
   000064         006700        03 GRP-LEV3-O0003F    OCCURS 3 TIMES.                     NC1384.2
   000065         006800           04 ELEM3  PICTURE IS S999                              NC1384.2
   000066         006900              USAGE IS DISPLAY SIGN IS LEADING SEPARATE CHARACTER NC1384.2
   000067         007000              OCCURS 5 TIMES.                                     NC1384.2
   000068         007100 01  TEST-RESULTS.                                                NC1384.2
   000069         007200     02 FILLER                   PIC X      VALUE SPACE.          NC1384.2 IMP
   000070         007300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1384.2 IMP
   000071         007400     02 FILLER                   PIC X      VALUE SPACE.          NC1384.2 IMP
   000072         007500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1384.2 IMP
   000073         007600     02 FILLER                   PIC X      VALUE SPACE.          NC1384.2 IMP
   000074         007700     02  PAR-NAME.                                                NC1384.2
   000075         007800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1384.2 IMP
   000076         007900       03  PARDOT-X              PIC X      VALUE SPACE.          NC1384.2 IMP
   000077         008000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1384.2 IMP
   000078         008100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1384.2 IMP
   000079         008200     02 RE-MARK                  PIC X(61).                       NC1384.2
   000080         008300 01  TEST-COMPUTED.                                               NC1384.2
   000081         008400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1384.2 IMP
   000082         008500     02 FILLER                   PIC X(17)  VALUE                 NC1384.2
   000083         008600            "       COMPUTED=".                                   NC1384.2
   000084         008700     02 COMPUTED-X.                                               NC1384.2
   000085         008800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1384.2 IMP
   000086         008900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1384.2 85
   000087         009000                                 PIC -9(9).9(9).                  NC1384.2
   000088         009100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1384.2 85
   000089         009200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1384.2 85
   000090         009300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1384.2 85
   000091         009400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1384.2 85
   000092         009500         04 COMPUTED-18V0                    PIC -9(18).          NC1384.2
   000093         009600         04 FILLER                           PIC X.               NC1384.2
   000094         009700     03 FILLER PIC X(50) VALUE SPACE.                             NC1384.2 IMP
   000095         009800 01  TEST-CORRECT.                                                NC1384.2
   000096         009900     02 FILLER PIC X(30) VALUE SPACE.                             NC1384.2 IMP
   000097         010000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1384.2
   000098         010100     02 CORRECT-X.                                                NC1384.2
   000099         010200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1384.2 IMP
   000100         010300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1384.2 99
   000101         010400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1384.2 99
   000102         010500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1384.2 99
   000103         010600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1384.2 99
   000104         010700     03      CR-18V0 REDEFINES CORRECT-A.                         NC1384.2 99
   000105         010800         04 CORRECT-18V0                     PIC -9(18).          NC1384.2
   000106         010900         04 FILLER                           PIC X.               NC1384.2
   000107         011000     03 FILLER PIC X(2) VALUE SPACE.                              NC1384.2 IMP
   000108         011100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1384.2 IMP
   000109         011200 01  CCVS-C-1.                                                    NC1384.2
   000110         011300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1384.2
   000111         011400-    "SS  PARAGRAPH-NAME                                          NC1384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500-    "       REMARKS".                                            NC1384.2
   000113         011600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1384.2 IMP
   000114         011700 01  CCVS-C-2.                                                    NC1384.2
   000115         011800     02 FILLER                     PIC X        VALUE SPACE.      NC1384.2 IMP
   000116         011900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1384.2
   000117         012000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1384.2 IMP
   000118         012100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1384.2
   000119         012200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1384.2 IMP
   000120         012300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1384.2 IMP
   000121         012400 01  REC-CT                        PIC 99       VALUE ZERO.       NC1384.2 IMP
   000122         012500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1384.2 IMP
   000123         012600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1384.2 IMP
   000124         012700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1384.2 IMP
   000125         012800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1384.2 IMP
   000126         012900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1384.2 IMP
   000127         013000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1384.2 IMP
   000128         013100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1384.2 IMP
   000129         013200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1384.2 IMP
   000130         013300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1384.2 IMP
   000131         013400 01  CCVS-H-1.                                                    NC1384.2
   000132         013500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1384.2 IMP
   000133         013600     02  FILLER                    PIC X(42)    VALUE             NC1384.2
   000134         013700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1384.2
   000135         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1384.2 IMP
   000136         013900 01  CCVS-H-2A.                                                   NC1384.2
   000137         014000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1384.2 IMP
   000138         014100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1384.2
   000139         014200   02  FILLER                        PIC XXXX   VALUE             NC1384.2
   000140         014300     "4.2 ".                                                      NC1384.2
   000141         014400   02  FILLER                        PIC X(28)  VALUE             NC1384.2
   000142         014500            " COPY - NOT FOR DISTRIBUTION".                       NC1384.2
   000143         014600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1384.2 IMP
   000144         014700                                                                  NC1384.2
   000145         014800 01  CCVS-H-2B.                                                   NC1384.2
   000146         014900   02  FILLER                        PIC X(15)  VALUE             NC1384.2
   000147         015000            "TEST RESULT OF ".                                    NC1384.2
   000148         015100   02  TEST-ID                       PIC X(9).                    NC1384.2
   000149         015200   02  FILLER                        PIC X(4)   VALUE             NC1384.2
   000150         015300            " IN ".                                               NC1384.2
   000151         015400   02  FILLER                        PIC X(12)  VALUE             NC1384.2
   000152         015500     " HIGH       ".                                              NC1384.2
   000153         015600   02  FILLER                        PIC X(22)  VALUE             NC1384.2
   000154         015700            " LEVEL VALIDATION FOR ".                             NC1384.2
   000155         015800   02  FILLER                        PIC X(58)  VALUE             NC1384.2
   000156         015900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1384.2
   000157         016000 01  CCVS-H-3.                                                    NC1384.2
   000158         016100     02  FILLER                      PIC X(34)  VALUE             NC1384.2
   000159         016200            " FOR OFFICIAL USE ONLY    ".                         NC1384.2
   000160         016300     02  FILLER                      PIC X(58)  VALUE             NC1384.2
   000161         016400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1384.2
   000162         016500     02  FILLER                      PIC X(28)  VALUE             NC1384.2
   000163         016600            "  COPYRIGHT   1985 ".                                NC1384.2
   000164         016700 01  CCVS-E-1.                                                    NC1384.2
   000165         016800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1384.2 IMP
   000166         016900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1384.2
   000167         017000     02 ID-AGAIN                     PIC X(9).                    NC1384.2
   000168         017100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1384.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  CCVS-E-2.                                                    NC1384.2
   000170         017300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1384.2 IMP
   000171         017400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1384.2 IMP
   000172         017500     02 CCVS-E-2-2.                                               NC1384.2
   000173         017600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1384.2 IMP
   000174         017700         03 FILLER                   PIC X      VALUE SPACE.      NC1384.2 IMP
   000175         017800         03 ENDER-DESC               PIC X(44)  VALUE             NC1384.2
   000176         017900            "ERRORS ENCOUNTERED".                                 NC1384.2
   000177         018000 01  CCVS-E-3.                                                    NC1384.2
   000178         018100     02  FILLER                      PIC X(22)  VALUE             NC1384.2
   000179         018200            " FOR OFFICIAL USE ONLY".                             NC1384.2
   000180         018300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1384.2 IMP
   000181         018400     02  FILLER                      PIC X(58)  VALUE             NC1384.2
   000182         018500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1384.2
   000183         018600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1384.2 IMP
   000184         018700     02 FILLER                       PIC X(15)  VALUE             NC1384.2
   000185         018800             " COPYRIGHT 1985".                                   NC1384.2
   000186         018900 01  CCVS-E-4.                                                    NC1384.2
   000187         019000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1384.2 IMP
   000188         019100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1384.2
   000189         019200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1384.2 IMP
   000190         019300     02 FILLER                       PIC X(40)  VALUE             NC1384.2
   000191         019400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1384.2
   000192         019500 01  XXINFO.                                                      NC1384.2
   000193         019600     02 FILLER                       PIC X(19)  VALUE             NC1384.2
   000194         019700            "*** INFORMATION ***".                                NC1384.2
   000195         019800     02 INFO-TEXT.                                                NC1384.2
   000196         019900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1384.2 IMP
   000197         020000       04 XXCOMPUTED                 PIC X(20).                   NC1384.2
   000198         020100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1384.2 IMP
   000199         020200       04 XXCORRECT                  PIC X(20).                   NC1384.2
   000200         020300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1384.2
   000201         020400 01  HYPHEN-LINE.                                                 NC1384.2
   000202         020500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1384.2 IMP
   000203         020600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1384.2
   000204         020700-    "*****************************************".                 NC1384.2
   000205         020800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1384.2
   000206         020900-    "******************************".                            NC1384.2
   000207         021000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1384.2
   000208         021100     "NC138A".                                                    NC1384.2
   000209         021200 PROCEDURE DIVISION.                                              NC1384.2
   000210         021300 CCVS1 SECTION.                                                   NC1384.2
   000211         021400 OPEN-FILES.                                                      NC1384.2
   000212         021500     OPEN     OUTPUT PRINT-FILE.                                  NC1384.2 35
   000213         021600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1384.2 207 148 207 167
   000214         021700     MOVE    SPACE TO TEST-RESULTS.                               NC1384.2 IMP 68
   000215         021800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1384.2 240 245
   000216         021900     GO TO CCVS1-EXIT.                                            NC1384.2 327
   000217         022000 CLOSE-FILES.                                                     NC1384.2
   000218         022100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1384.2 249 270 35
   000219         022200 TERMINATE-CCVS.                                                  NC1384.2
   000220         022300     EXIT PROGRAM.                                                NC1384.2
   000221         022400 TERMINATE-CALL.                                                  NC1384.2
   000222         022500     STOP     RUN.                                                NC1384.2
   000223         022600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1384.2 72 124
   000224         022700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1384.2 72 125
   000225         022800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1384.2 72 123
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1384.2 72 122
   000227         023000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1384.2 79
   000228         023100 PRINT-DETAIL.                                                    NC1384.2
   000229         023200     IF REC-CT NOT EQUAL TO ZERO                                  NC1384.2 121 IMP
   000230      1  023300             MOVE "." TO PARDOT-X                                 NC1384.2 76
   000231      1  023400             MOVE REC-CT TO DOTVALUE.                             NC1384.2 121 77
   000232         023500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1384.2 68 36 282
   000233         023600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1384.2 72 282
   000234      1  023700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1384.2 303 317
   000235      1  023800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1384.2 318 326
   000236         023900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1384.2 IMP 72 IMP 84
   000237         024000     MOVE SPACE TO CORRECT-X.                                     NC1384.2 IMP 98
   000238         024100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1384.2 121 IMP IMP 74
   000239         024200     MOVE     SPACE TO RE-MARK.                                   NC1384.2 IMP 79
   000240         024300 HEAD-ROUTINE.                                                    NC1384.2
   000241         024400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1384.2 131 37 282
   000242         024500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1384.2 136 37 282
   000243         024600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1384.2 145 37 282
   000244         024700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1384.2 157 37 282
   000245         024800 COLUMN-NAMES-ROUTINE.                                            NC1384.2
   000246         024900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1384.2 109 37 282
   000247         025000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1384.2 114 37 282
   000248         025100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1384.2 201 37 282
   000249         025200 END-ROUTINE.                                                     NC1384.2
   000250         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1384.2 201 37 282
   000251         025400 END-RTN-EXIT.                                                    NC1384.2
   000252         025500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1384.2 164 37 282
   000253         025600 END-ROUTINE-1.                                                   NC1384.2
   000254         025700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1384.2 123 127 124
   000255         025800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1384.2 127 122 127
   000256         025900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1384.2 125 127
   000257         026000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1384.2
   000258         026100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1384.2 125 187
   000259         026200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1384.2 127 189
   000260         026300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1384.2 186 172
   000261         026400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1384.2 169 37 282
   000262         026500  END-ROUTINE-12.                                                 NC1384.2
   000263         026600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1384.2 175
   000264         026700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1384.2 123 IMP
   000265      1  026800         MOVE "NO " TO ERROR-TOTAL                                NC1384.2 173
   000266         026900         ELSE                                                     NC1384.2
   000267      1  027000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1384.2 123 173
   000268         027100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1384.2 169 37
   000269         027200     PERFORM WRITE-LINE.                                          NC1384.2 282
   000270         027300 END-ROUTINE-13.                                                  NC1384.2
   000271         027400     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1384.2 122 IMP
   000272      1  027500         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1384.2 173
   000273      1  027600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1384.2 122 173
   000274         027700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1384.2 175
   000275         027800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1384.2 169 37 282
   000276         027900      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1384.2 124 IMP
   000277      1  028000          MOVE "NO " TO ERROR-TOTAL                               NC1384.2 173
   000278      1  028100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1384.2 124 173
   000279         028200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1384.2 175
   000280         028300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1384.2 169 37 282
   000281         028400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1384.2 177 37 282
   000282         028500 WRITE-LINE.                                                      NC1384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     ADD 1 TO RECORD-COUNT.                                       NC1384.2 129
   000284         028700     IF RECORD-COUNT GREATER 42                                   NC1384.2 129
   000285      1  028800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1384.2 37 128
   000286      1  028900         MOVE SPACE TO DUMMY-RECORD                               NC1384.2 IMP 37
   000287      1  029000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1384.2 37
   000288      1  029100         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1384.2 131 37 298
   000289      1  029200         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1384.2 136 37 298
   000290      1  029300         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1384.2 145 37 298
   000291      1  029400         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1384.2 157 37 298
   000292      1  029500         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1384.2 109 37 298
   000293      1  029600         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1384.2 114 37 298
   000294      1  029700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1384.2 201 37 298
   000295      1  029800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1384.2 128 37
   000296      1  029900         MOVE ZERO TO RECORD-COUNT.                               NC1384.2 IMP 129
   000297         030000     PERFORM WRT-LN.                                              NC1384.2 298
   000298         030100 WRT-LN.                                                          NC1384.2
   000299         030200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1384.2 37
   000300         030300     MOVE SPACE TO DUMMY-RECORD.                                  NC1384.2 IMP 37
   000301         030400 BLANK-LINE-PRINT.                                                NC1384.2
   000302         030500     PERFORM WRT-LN.                                              NC1384.2 298
   000303         030600 FAIL-ROUTINE.                                                    NC1384.2
   000304         030700     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1384.2 84 IMP
   000305      1  030800            GO TO FAIL-ROUTINE-WRITE.                             NC1384.2 312
   000306         030900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1384.2 98 IMP 312
   000307         031000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1384.2 130 200
   000308         031100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1384.2 195
   000309         031200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1384.2 192 37 282
   000310         031300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1384.2 IMP 200
   000311         031400     GO TO  FAIL-ROUTINE-EX.                                      NC1384.2 317
   000312         031500 FAIL-ROUTINE-WRITE.                                              NC1384.2
   000313         031600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1384.2 80 36 282
   000314         031700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1384.2 130 108
   000315         031800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1384.2 95 36 282
   000316         031900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1384.2 IMP 108
   000317         032000 FAIL-ROUTINE-EX. EXIT.                                           NC1384.2
   000318         032100 BAIL-OUT.                                                        NC1384.2
   000319         032200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1384.2 85 IMP 321
   000320         032300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1384.2 99 IMP 326
   000321         032400 BAIL-OUT-WRITE.                                                  NC1384.2
   000322         032500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1384.2 99 199 85 197
   000323         032600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1384.2 130 200
   000324         032700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1384.2 192 37 282
   000325         032800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1384.2 IMP 200
   000326         032900 BAIL-OUT-EX. EXIT.                                               NC1384.2
   000327         033000 CCVS1-EXIT.                                                      NC1384.2
   000328         033100     EXIT.                                                        NC1384.2
   000329         033200 SECT-NC138A-0001 SECTION.                                        NC1384.2
   000330         033300 NC138A-0001.                                                     NC1384.2
   000331         033400     MOVE "IV-4 4.2.1" TO ANSI-REFERENCE.                         NC1384.2 130
   000332         033500*    THIS SECTION STORES THE NUMBERS 1 THROUGH 60 IN THE 3 TABLES.NC1384.2
   000333         033600 MOVE-VALUE.                                                      NC1384.2
   000334         033700     ADD 1 TO WRK1.                                               NC1384.2 39
   000335         033800     MOVE WRK1 TO ELEM1 (S1)  ELEM2 (S21, S22)                    NC1384.2 39 52 43 57 44 45
   000336         033900                  ELEM3 (S31, S32, S33).                          NC1384.2 65 47 48 49
   000337         034000     IF WRK1 EQUAL TO 60   GO TO SECT-TH109-0002.                 NC1384.2 39 350
   000338         034100 INCRE-SUBS.                                                      NC1384.2
   000339         034200     ADD 1 TO S1.                                                 NC1384.2 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     ADD 1 TO S22.                                                NC1384.2 45
   000341         034400     ADD 1 TO S33.                                                NC1384.2 49
   000342         034500     IF S22 LESS THAN 6 GO TO MOVE-VALUE.                         NC1384.2 45 333
   000343         034600     MOVE 1 TO S22 S33.                                           NC1384.2 45 49
   000344         034700     ADD 1 TO S21.                                                NC1384.2 44
   000345         034800     ADD 1 TO S32.                                                NC1384.2 48
   000346         034900     IF S32 LESS THAN 4 GO TO MOVE-VALUE.                         NC1384.2 48 333
   000347         035000     MOVE 1 TO S32.                                               NC1384.2 48
   000348         035100     ADD 1 TO S31.                                                NC1384.2 47
   000349         035200     GO TO MOVE-VALUE.                                            NC1384.2 333
   000350         035300 SECT-TH109-0002 SECTION.                                         NC1384.2
   000351         035400 SECT-0002-INIT.                                                  NC1384.2
   000352         035500     MOVE "LEFT PAREN SEPARATOR" TO FEATURE.                      NC1384.2 70
   000353         035600*       THIS SECTION TESTS THE USE OF LEFT PARENTHESIS AS A       NC1384.2
   000354         035700*    SEPARATOR IN REFERENCING TABLE ITEMS.                        NC1384.2
   000355         035800 SEP-INIT-001.                                                    NC1384.2
   000356         035900     MOVE 6 TO S1.                                                NC1384.2 43
   000357         036000 SEP-TEST-001.                                                    NC1384.2
   000358         036100     IF ELEM1(S1) IS EQUAL TO 6                                   NC1384.2 52 43
   000359      1  036200             PERFORM PASS                                         NC1384.2 224
   000360      1  036300             GO TO SEP-WRITE-001.                                 NC1384.2 369
   000361         036400         PERFORM FAIL.                                            NC1384.2 225
   000362         036500         GO TO SEP-FAIL-001.                                      NC1384.2 366
   000363         036600 SEP-DELETE-001.                                                  NC1384.2
   000364         036700     PERFORM DE-LETE.                                             NC1384.2 226
   000365         036800     GO TO SEP-WRITE-001.                                         NC1384.2 369
   000366         036900 SEP-FAIL-001.                                                    NC1384.2
   000367         037000     MOVE ELEM1 (S1) TO COMPUTED-18V0.                            NC1384.2 52 43 92
   000368         037100     MOVE 6 TO CORRECT-18V0.                                      NC1384.2 105
   000369         037200 SEP-WRITE-001.                                                   NC1384.2
   000370         037300     MOVE "SEP-TEST-001" TO PAR-NAME.                             NC1384.2 74
   000371         037400     PERFORM PRINT-DETAIL.                                        NC1384.2 228
   000372         037500 SEP-INIT-002.                                                    NC1384.2
   000373         037600     MOVE 2 TO S21 S22.                                           NC1384.2 44 45
   000374         037700 SEP-TEST-002.                                                    NC1384.2
   000375         037800     MOVE ELEM2(S21, S22) TO TEMP.                                NC1384.2 57 44 45 40
   000376         037900     IF TEMP EQUAL TO 7                                           NC1384.2 40
   000377      1  038000             PERFORM PASS                                         NC1384.2 224
   000378      1  038100             GO TO SEP-WRITE-002.                                 NC1384.2 387
   000379         038200         PERFORM FAIL.                                            NC1384.2 225
   000380         038300         GO TO SEP-FAIL-002.                                      NC1384.2 384
   000381         038400 SEP-DELETE-002.                                                  NC1384.2
   000382         038500     PERFORM DE-LETE.                                             NC1384.2 226
   000383         038600     GO TO SEP-WRITE-002.                                         NC1384.2 387
   000384         038700 SEP-FAIL-002.                                                    NC1384.2
   000385         038800     MOVE TEMP TO COMPUTED-18V0.                                  NC1384.2 40 92
   000386         038900     MOVE 7 TO CORRECT-18V0.                                      NC1384.2 105
   000387         039000 SEP-WRITE-002.                                                   NC1384.2
   000388         039100     MOVE "SEP-TEST-002" TO PAR-NAME.                             NC1384.2 74
   000389         039200     PERFORM PRINT-DETAIL.                                        NC1384.2 228
   000390         039300 SEP-INIT-003.                                                    NC1384.2
   000391         039400     MOVE 3 TO S31 S32 S33.                                       NC1384.2 47 48 49
   000392         039500 SEP-TEST-003.                                                    NC1384.2
   000393         039600     MOVE ELEM3(S31, S32, S33)  TO TEMP.                          NC1384.2 65 47 48 49 40
   000394         039700     IF TEMP EQUAL TO 43                                          NC1384.2 40
   000395      1  039800             PERFORM PASS                                         NC1384.2 224
   000396      1  039900             GO TO SEP-WRITE-003.                                 NC1384.2 405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000         PERFORM FAIL.                                            NC1384.2 225
   000398         040100         GO TO SEP-FAIL-003.                                      NC1384.2 402
   000399         040200 SEP-DELETE-003.                                                  NC1384.2
   000400         040300     PERFORM DE-LETE.                                             NC1384.2 226
   000401         040400     GO TO SEP-WRITE-003.                                         NC1384.2 405
   000402         040500 SEP-FAIL-003.                                                    NC1384.2
   000403         040600     MOVE TEMP TO COMPUTED-18V0.                                  NC1384.2 40 92
   000404         040700     MOVE 43 TO CORRECT-18V0.                                     NC1384.2 105
   000405         040800 SEP-WRITE-003.                                                   NC1384.2
   000406         040900     MOVE "SEP-TEST-003" TO PAR-NAME.                             NC1384.2 74
   000407         041000     PERFORM PRINT-DETAIL.                                        NC1384.2 228
   000408         041100 SEP-INIT-004.                                                    NC1384.2
   000409         041200     MOVE "SPACES AS SEPARATOR" TO FEATURE.                       NC1384.2 70
   000410         041300     MOVE "SEP-TEST-004" TO PAR-NAME.                             NC1384.2 74
   000411         041400     MOVE 0 TO REC-CT.                                            NC1384.2 121
   000412         041500     MOVE 19 TO S1.                                               NC1384.2 43
   000413         041600*        THIS TEST USES SPACES AS SEPARATORS IN REFERENCING       NC1384.2
   000414         041700*    ONE DIMENSIONAL TABLE ELEMENTS.                              NC1384.2
   000415         041800     MOVE ZERO TO TEMP.                                           NC1384.2 IMP 40
   000416         041900     MOVE 19 TO EXPECTED-VALUE.                                   NC1384.2 41
   000417         042000 SEP-TEST-004-01.                                                 NC1384.2
   000418         042100     MOVE ELEM1 (S1 ) TO TEMP.                                    NC1384.2 52 43 40
   000419         042200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000420         042300 SEP-TEST-004-02.                                                 NC1384.2
   000421         042400     MOVE ELEM1    (S1) TO TEMP.                                  NC1384.2 52 43 40
   000422         042500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000423         042600 SEP-TEST-004-03.                                                 NC1384.2
   000424         042700     MOVE ELEM1   (S1     )   TO  TEMP.                           NC1384.2 52 43 40
   000425         042800     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000426         042900 SEP-TEST-004-04.                                                 NC1384.2
   000427         043000     MOVE ELEM1( S1) TO TEMP.                                     NC1384.2 52 43 40
   000428         043100     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000429         043200 SEP-TEST-004-05.                                                 NC1384.2
   000430         043300     MOVE ELEM1 ( S1) TO TEMP.                                    NC1384.2 52 43 40
   000431         043400     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000432         043500 SEP-TEST-004-06.                                                 NC1384.2
   000433         043600     MOVE ELEM1 ( S1 ) TO TEMP.                                   NC1384.2 52 43 40
   000434         043700     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000435         043800 SEP-TEST-004-07.                                                 NC1384.2
   000436         043900     MOVE ELEM1 ( 19) TO TEMP.                                    NC1384.2 52 40
   000437         044000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000438         044100 SEP-TEST-004-08.                                                 NC1384.2
   000439         044200     MOVE ELEM1(S1 ) TO TEMP.                                     NC1384.2 52 43 40
   000440         044300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000441         044400 SEP-TEST-004-09.                                                 NC1384.2
   000442         044500     MOVE ELEM1 (   19     )   TO  TEMP.                          NC1384.2 52 40
   000443         044600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000444         044700     GO TO SEP-INIT-005.                                          NC1384.2 453
   000445         044800*         IF THE COMPILER REJECTS ANY OF THE ABOVE TABLE          NC1384.2
   000446         044900*    REFERENCES, DELETE THAT LINE OF CODE BY PLACING              NC1384.2
   000447         045000*    AN * IN COLUMN 7.  LEAVE THE PERFORM...THRU STATEMENT.       NC1384.2
   000448         045100*    THE ELEMENT DELETED APPEARS AS A FAILURE ON THE              NC1384.2
   000449         045200*    OUTPUT REPORT.                                               NC1384.2
   000450         045300 SEP-DELETE-004.                                                  NC1384.2
   000451         045400     PERFORM DE-LETE.                                             NC1384.2 226
   000452         045500     PERFORM SYNTAX-CHECK-WRITE.                                  NC1384.2 646
   000453         045600 SEP-INIT-005.                                                    NC1384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE "SEP-TEST-005" TO PAR-NAME.                             NC1384.2 74
   000455         045800     MOVE 0 TO REC-CT.                                            NC1384.2 121
   000456         045900     MOVE 10 TO S21.                                              NC1384.2 44
   000457         046000     MOVE 03 TO S22.                                              NC1384.2 45
   000458         046100     MOVE ZERO TO TEMP.                                           NC1384.2 IMP 40
   000459         046200     MOVE 48 TO EXPECTED-VALUE.                                   NC1384.2 41
   000460         046300*        THIS TEST USES SPACES AND COMMAS AS SEPARATORS IN        NC1384.2
   000461         046400*    REFERENCING TWO DIMENSIONAL TABLE ELEMENTS.                  NC1384.2
   000462         046500 SEP-TEST-005-01.                                                 NC1384.2
   000463         046600     MOVE ELEM2 (S21 S22) TO TEMP.                                NC1384.2 57 44 45 40
   000464         046700     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000465         046800 SEP-TEST-005-02.                                                 NC1384.2
   000466         046900     MOVE ELEM2 (S21,  S22)  TO  TEMP.                            NC1384.2 57 44 45 40
   000467         047000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000468         047100 SEP-TEST-005-03.                                                 NC1384.2
   000469         047200     MOVE ELEM2 (S21, S22) TO TEMP.                               NC1384.2 57 44 45 40
   000470         047300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000471         047400 SEP-TEST-005-04.                                                 NC1384.2
   000472         047500     ADD ELEM2 ( S21   S22 ) TO TEMP.                             NC1384.2 57 44 45 40
   000473         047600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000474         047700 SEP-TEST-005-05.                                                 NC1384.2
   000475         047800     MOVE 96 TO TEMP.                                             NC1384.2 40
   000476         047900     SUBTRACT ELEM2(S21 S22) FROM TEMP.                           NC1384.2 57 44 45 40
   000477         048000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000478         048100 SEP-TEST-005-06.                                                 NC1384.2
   000479         048200     MOVE ELEM2( S21,  S22) TO TEMP.                              NC1384.2 57 44 45 40
   000480         048300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000481         048400 SEP-TEST-005-07.                                                 NC1384.2
   000482         048500     MOVE ELEM2   (   S21   S22  ) TO TEMP.                       NC1384.2 57 44 45 40
   000483         048600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000484         048700 SEP-TEST-005-08.                                                 NC1384.2
   000485         048800     MOVE ELEM2 (S21 , S22) TO TEMP.                              NC1384.2 57 44 45 40
   000486         048900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000487         049000 SEP-TEST-005-09.                                                 NC1384.2
   000488         049100     ADD ELEM2 (3 5)  ELEM2(7, 3) TO TEMP.                        NC1384.2 57 57 40
   000489         049200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000490         049300 SEP-TEST-005-10.                                                 NC1384.2
   000491         049400     ADD ELEM2( 3  5 )  ELEM2 ( 7 3    )  TO  TEMP.               NC1384.2 57 57 40
   000492         049500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000493         049600     GO TO SEP-INIT-006.                                          NC1384.2 502
   000494         049700*         IF THE COMPILER REJECTS ANY OF THE ABOVE TABLE          NC1384.2
   000495         049800*    REFERENCES, DELETE THAT LINE OF CODE BY PLACING              NC1384.2
   000496         049900*    AN ASTERISK IN COLUMN 7. LEAVE THE PERFORM...THRU STATEMENT. NC1384.2
   000497         050000*    THE ELEMENT DELETED APPEARS AS A FAILURE ON THE              NC1384.2
   000498         050100*    OUTPUT REPORT.                                               NC1384.2
   000499         050200 SEP-DELETE-005.                                                  NC1384.2
   000500         050300     PERFORM DE-LETE.                                             NC1384.2 226
   000501         050400     PERFORM SYNTAX-CHECK-WRITE.                                  NC1384.2 646
   000502         050500 SEP-INIT-006.                                                    NC1384.2
   000503         050600     MOVE "SEP-TEST-006" TO PAR-NAME.                             NC1384.2 74
   000504         050700     MOVE 0 TO REC-CT.                                            NC1384.2 121
   000505         050800     MOVE ZERO TO TEMP.                                           NC1384.2 IMP 40
   000506         050900     MOVE 3 TO S31.                                               NC1384.2 47
   000507         051000     MOVE 2 TO S32 S33.                                           NC1384.2 48 49
   000508         051100     MOVE 37 TO EXPECTED-VALUE.                                   NC1384.2 41
   000509         051200*         THIS TEST USES SPACES AND COMMAS AS SEPARATORS IN       NC1384.2
   000510         051300*    REFERENCING THREE DIMENSIONAL TABLE ELEMENTS.                NC1384.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400 SEP-TEST-006-01.                                                 NC1384.2
   000512         051500     MOVE ELEM3(S31 S32 S33) TO TEMP.                             NC1384.2 65 47 48 49 40
   000513         051600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000514         051700 SEP-TEST-006-02.                                                 NC1384.2
   000515         051800     MOVE ELEM3(S31, S32 S33)   TO TEMP.                          NC1384.2 65 47 48 49 40
   000516         051900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000517         052000 SEP-TEST-006-03.                                                 NC1384.2
   000518         052100     ADD ELEM3  (  S31  S32  S33  )   TO  TEMP.                   NC1384.2 65 47 48 49 40
   000519         052200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000520         052300 SEP-TEST-006-04.                                                 NC1384.2
   000521         052400     MOVE 74 TO TEMP.                                             NC1384.2 40
   000522         052500     SUBTRACT ELEM3(S31 , S32 , S33) FROM TEMP.                   NC1384.2 65 47 48 49 40
   000523         052600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000524         052700 SEP-TEST-006-05.                                                 NC1384.2
   000525         052800     MOVE 37 TO TEMP.                                             NC1384.2 40
   000526         052900     IF ELEM3 ( S31, S32, S33 )                                   NC1384.2 65 47 48 49
   000527         053000              NOT EQUAL TO TEMP                                   NC1384.2 40
   000528      1  053100              MOVE ZERO TO TEMP.                                  NC1384.2 IMP 40
   000529         053200     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000530         053300 SEP-TEST-006-06.                                                 NC1384.2
   000531         053400     MULTIPLY ELEM3 (3 2 2) BY 1                                  NC1384.2 65
   000532         053500              GIVING TEMP.                                        NC1384.2 40
   000533         053600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000534         053700 SEP-TEST-006-07.                                                 NC1384.2
   000535         053800     ADD ELEM3 (1, 1, 1)   ELEM3( 3  2  1 )                       NC1384.2 65 65
   000536         053900              GIVING TEMP.                                        NC1384.2 40
   000537         054000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000538         054100     GO TO SEP-INIT-007.                                          NC1384.2 547
   000539         054200*         IF THE COMPILER REJECTS ANY OF THE ABOVE TABLE          NC1384.2
   000540         054300*    REFERENCES, DELETE THAT LINE OF CODE BY PLACING              NC1384.2
   000541         054400*    AN * IN COLUMN 7.  LEAVE THE PERFORM...THRU STATEMENT.       NC1384.2
   000542         054500*    THE ELEMENT DELETED APPEARS AS A FAILURE ON THE              NC1384.2
   000543         054600*    OUTPUT REPORT.                                               NC1384.2
   000544         054700 SEP-DELETE-006.                                                  NC1384.2
   000545         054800     PERFORM DE-LETE.                                             NC1384.2 226
   000546         054900     PERFORM SYNTAX-CHECK-WRITE.                                  NC1384.2 646
   000547         055000 SEP-INIT-007.                                                    NC1384.2
   000548         055100     MOVE "SEP-TEST-007" TO PAR-NAME.                             NC1384.2 74
   000549         055200     MOVE ZERO TO REC-CT.                                         NC1384.2 IMP 121
   000550         055300     MOVE ZERO TO TEMP.                                           NC1384.2 IMP 40
   000551         055400     MOVE 12 TO EXPECTED-VALUE.                                   NC1384.2 41
   000552         055500*        THIS TEST USES SIGNED POSITIVE INTEGERS AS               NC1384.2
   000553         055600*    SUBSCRIPTS AND SPACES AND COMMAS AS SEPARATORS.              NC1384.2
   000554         055700 SEP-TEST-007-01.                                                 NC1384.2
   000555         055800     MOVE ELEM1(+12) TO TEMP.                                     NC1384.2 52 40
   000556         055900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000557         056000 SEP-TEST-007-02.                                                 NC1384.2
   000558         056100     IF ELEM2(+3 +2) EQUAL TO 12                                  NC1384.2 57
   000559      1  056200        MOVE 12 TO TEMP.                                          NC1384.2 40
   000560         056300     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000561         056400 SEP-TEST-007-03.                                                 NC1384.2
   000562         056500     ADD ELEM2 (+3, +2) TO TEMP.                                  NC1384.2 57 40
   000563         056600     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000564         056700 SEP-TEST-007-04.                                                 NC1384.2
   000565         056800     MOVE 24 TO TEMP.                                             NC1384.2 40
   000566         056900     SUBTRACT ELEM2 ( +3   +2 ) FROM TEMP.                        NC1384.2 57 40
   000567         057000     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100 SEP-TEST-007-05.                                                 NC1384.2
   000569         057200     MULTIPLY ELEM3(+1, +3, +2) BY +1                             NC1384.2 65
   000570         057300             GIVING TEMP.                                         NC1384.2 40
   000571         057400     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000572         057500 SEP-TEST-007-06.                                                 NC1384.2
   000573         057600     DIVIDE ELEM3(+1 +3 +2) BY 1                                  NC1384.2 65
   000574         057700             GIVING TEMP.                                         NC1384.2 40
   000575         057800     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000576         057900 SEP-TEST-007-07.                                                 NC1384.2
   000577         058000     MOVE ELEM3 ( +1,  +3,  +2 ) TO TEMP.                         NC1384.2 65 40
   000578         058100     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000579         058200     GO TO CCVS-EXIT.                                             NC1384.2 649
   000580         058300*         IF THE COMPILER REJECTS ANY OF THE ABOVE TABLE          NC1384.2
   000581         058400*    REFERENCES, DELETE THAT LINE OF CODE BY PLACING              NC1384.2
   000582         058500*    AN * IN COLUMN 7.  LEAVE THE PERFORM...THRU STATEMENT.       NC1384.2
   000583         058600*    THE ELEMENT DELETED APPEARS AS A FAILURE ON THE              NC1384.2
   000584         058700*    OUTPUT REPORT.                                               NC1384.2
   000585         058800 SEP-DELETE-007.                                                  NC1384.2
   000586         058900     PERFORM DE-LETE.                                             NC1384.2 226
   000587         059000     PERFORM SYNTAX-CHECK-WRITE.                                  NC1384.2 646
   000588         059100     GO TO CCVS-EXIT.                                             NC1384.2 649
   000589         059200 SEP-INIT-008.                                                    NC1384.2
   000590         059300     MOVE "IV-4 4.2.1(2)" TO ANSI-REFERENCE.                      NC1384.2 130
   000591         059400     MOVE "SEP-TEST-008" TO PAR-NAME.                             NC1384.2 74
   000592         059500     MOVE 0 TO REC-CT.                                            NC1384.2 121
   000593         059600     MOVE ZERO TO TEMP.                                           NC1384.2 IMP 40
   000594         059700     MOVE 3 TO S31.                                               NC1384.2 47
   000595         059800     MOVE 2 TO S32 S33.                                           NC1384.2 48 49
   000596         059900     MOVE 37 TO EXPECTED-VALUE.                                   NC1384.2 41
   000597         060000*         THIS TEST USES SPACES AND COMMAS AND SEMI-COLONS        NC1384.2
   000598         060100*         AS SEPARATORS IN                                        NC1384.2
   000599         060200*         REFERENCING THREE DIMENSIONAL TABLE ELEMENTS.           NC1384.2
   000600         060300 SEP-TEST-008-01.                                                 NC1384.2
   000601         060400     MOVE ELEM3(S31 S32; S33) TO TEMP.                            NC1384.2 65 47 48 49 40
   000602         060500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000603         060600 SEP-TEST-008-02.                                                 NC1384.2
   000604         060700     MOVE ELEM3(S31, S32; S33)   TO TEMP.                         NC1384.2 65 47 48 49 40
   000605         060800     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000606         060900 SEP-TEST-008-03.                                                 NC1384.2
   000607         061000     ADD ELEM3  (  S31;  S32  S33  )   TO  TEMP.                  NC1384.2 65 47 48 49 40
   000608         061100     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000609         061200 SEP-TEST-008-04.                                                 NC1384.2
   000610         061300     MOVE 74 TO TEMP.                                             NC1384.2 40
   000611         061400     SUBTRACT ELEM3(S31; S32 , S33) FROM TEMP.                    NC1384.2 65 47 48 49 40
   000612         061500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000613         061600 SEP-TEST-008-05.                                                 NC1384.2
   000614         061700     MOVE 37 TO TEMP.                                             NC1384.2 40
   000615         061800     IF ELEM3 ( S31; S32; S33 )                                   NC1384.2 65 47 48 49
   000616         061900              NOT EQUAL TO TEMP                                   NC1384.2 40
   000617      1  062000              MOVE ZERO TO TEMP.                                  NC1384.2 IMP 40
   000618         062100     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000619         062200 SEP-TEST-008-06.                                                 NC1384.2
   000620         062300     MULTIPLY ELEM3 (3; 2, 2) BY 1                                NC1384.2 65
   000621         062400              GIVING TEMP.                                        NC1384.2 40
   000622         062500     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000623         062600 SEP-TEST-008-07.                                                 NC1384.2
   000624         062700     ADD ELEM3 (1; 1, 1)   ELEM3( 3  2; 1 )                       NC1384.2 65 65
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800              GIVING TEMP.                                        NC1384.2 40
   000626         062900     PERFORM SYNTAX-CHECK THRU SYNTAX-CHECK-WRITE.                NC1384.2 637 646
   000627         063000     GO TO SEP-INIT-007.                                          NC1384.2 547
   000628         063100*         IF THE COMPILER REJECTS ANY OF THE ABOVE TABLE          NC1384.2
   000629         063200*    REFERENCES, DELETE THAT LINE OF CODE BY PLACING              NC1384.2
   000630         063300*    AN * IN COLUMN 7.  LEAVE THE PERFORM...THRU STATEMENT.       NC1384.2
   000631         063400*    THE ELEMENT DELETED APPEARS AS A FAILURE ON THE              NC1384.2
   000632         063500*    OUTPUT REPORT.                                               NC1384.2
   000633         063600 SEP-DELETE-008.                                                  NC1384.2
   000634         063700     PERFORM DE-LETE.                                             NC1384.2 226
   000635         063800     PERFORM SYNTAX-CHECK-WRITE.                                  NC1384.2 646
   000636         063900 SECT-TH109-0003 SECTION.                                         NC1384.2
   000637         064000 SYNTAX-CHECK.                                                    NC1384.2
   000638         064100     ADD 1 TO REC-CT.                                             NC1384.2 121
   000639         064200     IF TEMP EQUAL TO EXPECTED-VALUE                              NC1384.2 40 41
   000640      1  064300             PERFORM PASS                                         NC1384.2 224
   000641      1  064400             GO TO SYNTAX-CHECK-WRITE.                            NC1384.2 646
   000642         064500 SYNTAX-FAIL.                                                     NC1384.2
   000643         064600     PERFORM FAIL.                                                NC1384.2 225
   000644         064700     MOVE TEMP TO COMPUTED-18V0.                                  NC1384.2 40 92
   000645         064800     MOVE EXPECTED-VALUE TO CORRECT-18V0.                         NC1384.2 41 105
   000646         064900 SYNTAX-CHECK-WRITE.                                              NC1384.2
   000647         065000     PERFORM PRINT-DETAIL.                                        NC1384.2 228
   000648         065100     MOVE ZERO TO TEMP.                                           NC1384.2 IMP 40
   000649         065200 CCVS-EXIT SECTION.                                               NC1384.2
   000650         065300 CCVS-999999.                                                     NC1384.2
   000651         065400     GO TO CLOSE-FILES.                                           NC1384.2 217
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    15
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      130   ANSI-REFERENCE . . . . . . . .  307 314 323 M331 M590
      109   CCVS-C-1 . . . . . . . . . . .  246 292
      114   CCVS-C-2 . . . . . . . . . . .  247 293
      164   CCVS-E-1 . . . . . . . . . . .  252
      169   CCVS-E-2 . . . . . . . . . . .  261 268 275 280
      172   CCVS-E-2-2 . . . . . . . . . .  M260
      177   CCVS-E-3 . . . . . . . . . . .  281
      186   CCVS-E-4 . . . . . . . . . . .  260
      187   CCVS-E-4-1 . . . . . . . . . .  M258
      189   CCVS-E-4-2 . . . . . . . . . .  M259
      131   CCVS-H-1 . . . . . . . . . . .  241 288
      136   CCVS-H-2A. . . . . . . . . . .  242 289
      145   CCVS-H-2B. . . . . . . . . . .  243 290
      157   CCVS-H-3 . . . . . . . . . . .  244 291
      207   CCVS-PGM-ID. . . . . . . . . .  213 213
       91   CM-18V0
       85   COMPUTED-A . . . . . . . . . .  86 88 89 90 91 319 322
       86   COMPUTED-N
       84   COMPUTED-X . . . . . . . . . .  M236 304
       88   COMPUTED-0V18
       90   COMPUTED-14V4
       92   COMPUTED-18V0. . . . . . . . .  M367 M385 M403 M644
       89   COMPUTED-4V14
      108   COR-ANSI-REFERENCE . . . . . .  M314 M316
       99   CORRECT-A. . . . . . . . . . .  100 101 102 103 104 320 322
      100   CORRECT-N
       98   CORRECT-X. . . . . . . . . . .  M237 306
      101   CORRECT-0V18
      103   CORRECT-14V4
      105   CORRECT-18V0 . . . . . . . . .  M368 M386 M404 M645
      102   CORRECT-4V14
      104   CR-18V0
      122   DELETE-COUNTER . . . . . . . .  M226 255 271 273
       77   DOTVALUE . . . . . . . . . . .  M231
      128   DUMMY-HOLD . . . . . . . . . .  M285 295
       37   DUMMY-RECORD . . . . . . . . .  M241 M242 M243 M244 M246 M247 M248 M250 M252 M261 M268 M275 M280 M281 285 M286
                                            287 M288 M289 M290 M291 M292 M293 M294 M295 299 M300 M309 M324
       52   ELEM1. . . . . . . . . . . . .  M335 358 367 418 421 424 427 430 433 436 439 442 555
       57   ELEM2. . . . . . . . . . . . .  M335 375 463 466 469 472 476 479 482 485 488 488 491 491 558 562 566
       65   ELEM3. . . . . . . . . . . . .  M336 393 512 515 518 522 526 531 535 535 569 573 577 601 604 607 611 615 620
                                            624 624
      175   ENDER-DESC . . . . . . . . . .  M263 M274 M279
      123   ERROR-COUNTER. . . . . . . . .  M225 254 264 267
      127   ERROR-HOLD . . . . . . . . . .  M254 M255 M255 M256 259
      173   ERROR-TOTAL. . . . . . . . . .  M265 M267 M272 M273 M277 M278
       41   EXPECTED-VALUE . . . . . . . .  M416 M459 M508 M551 M596 639 645
       70   FEATURE. . . . . . . . . . . .  M352 M409
       56   GRP-LEV2-O012F
       61   GRP-LEV2-00004F
       64   GRP-LEV3-O0003F
       51   GRP-TAB1
       60   GRP-TAB3
       55   GRP-TAP2
      201   HYPHEN-LINE. . . . . . . . . .  248 250 294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    16
0 Defined   Cross-reference of data names   References

0     167   ID-AGAIN . . . . . . . . . . .  M213
      200   INF-ANSI-REFERENCE . . . . . .  M307 M310 M323 M325
      195   INFO-TEXT. . . . . . . . . . .  M308
      124   INSPECT-COUNTER. . . . . . . .  M223 254 276 278
       72   P-OR-F . . . . . . . . . . . .  M223 M224 M225 M226 233 M236
       74   PAR-NAME . . . . . . . . . . .  M238 M370 M388 M406 M410 M454 M503 M548 M591
       76   PARDOT-X . . . . . . . . . . .  M230
      125   PASS-COUNTER . . . . . . . . .  M224 256 258
       35   PRINT-FILE . . . . . . . . . .  31 212 218
       36   PRINT-REC. . . . . . . . . . .  M232 M313 M315
       79   RE-MARK. . . . . . . . . . . .  M227 M239
      121   REC-CT . . . . . . . . . . . .  229 231 238 M411 M455 M504 M549 M592 M638
      120   REC-SKL-SUB
      129   RECORD-COUNT . . . . . . . . .  M283 284 M296
       43   S1 . . . . . . . . . . . . . .  335 M339 M356 358 367 M412 418 421 424 427 430 433 439
       44   S21. . . . . . . . . . . . . .  335 M344 M373 375 M456 463 466 469 472 476 479 482 485
       45   S22. . . . . . . . . . . . . .  335 M340 342 M343 M373 375 M457 463 466 469 472 476 479 482 485
       47   S31. . . . . . . . . . . . . .  336 M348 M391 393 M506 512 515 518 522 526 M594 601 604 607 611 615
       48   S32. . . . . . . . . . . . . .  336 M345 346 M347 M391 393 M507 512 515 518 522 526 M595 601 604 607 611 615
       49   S33. . . . . . . . . . . . . .  336 M341 M343 M391 393 M507 512 515 518 522 526 M595 601 604 607 611 615
       40   TEMP . . . . . . . . . . . . .  M375 376 385 M393 394 403 M415 M418 M421 M424 M427 M430 M433 M436 M439 M442 M458
                                            M463 M466 M469 M472 M475 M476 M479 M482 M485 M488 M491 M505 M512 M515 M518 M521
                                            M522 M525 527 M528 M532 M536 M550 M555 M559 M562 M565 M566 M570 M574 M577 M593
                                            M601 M604 M607 M610 M611 M614 616 M617 M621 M625 639 644 M648
       80   TEST-COMPUTED. . . . . . . . .  313
       95   TEST-CORRECT . . . . . . . . .  315
      148   TEST-ID. . . . . . . . . . . .  M213
       68   TEST-RESULTS . . . . . . . . .  M214 232
      126   TOTAL-ERROR
       63   WRK-IX-0001
       39   WRK1 . . . . . . . . . . . . .  M334 335 337
      197   XXCOMPUTED . . . . . . . . . .  M322
      199   XXCORRECT. . . . . . . . . . .  M322
      192   XXINFO . . . . . . . . . . . .  309 324
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    17
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

      318   BAIL-OUT . . . . . . . . . . .  P235
      326   BAIL-OUT-EX. . . . . . . . . .  E235 G320
      321   BAIL-OUT-WRITE . . . . . . . .  G319
      301   BLANK-LINE-PRINT
      649   CCVS-EXIT. . . . . . . . . . .  G579 G588
      650   CCVS-999999
      210   CCVS1
      327   CCVS1-EXIT . . . . . . . . . .  G216
      217   CLOSE-FILES. . . . . . . . . .  G651
      245   COLUMN-NAMES-ROUTINE . . . . .  E215
      226   DE-LETE. . . . . . . . . . . .  P364 P382 P400 P451 P500 P545 P586 P634
      249   END-ROUTINE. . . . . . . . . .  P218
      253   END-ROUTINE-1
      262   END-ROUTINE-12
      270   END-ROUTINE-13 . . . . . . . .  E218
      251   END-RTN-EXIT
      225   FAIL . . . . . . . . . . . . .  P361 P379 P397 P643
      303   FAIL-ROUTINE . . . . . . . . .  P234
      317   FAIL-ROUTINE-EX. . . . . . . .  E234 G311
      312   FAIL-ROUTINE-WRITE . . . . . .  G305 G306
      240   HEAD-ROUTINE . . . . . . . . .  P215
      338   INCRE-SUBS
      223   INSPT
      333   MOVE-VALUE . . . . . . . . . .  G342 G346 G349
      330   NC138A-0001
      211   OPEN-FILES
      224   PASS . . . . . . . . . . . . .  P359 P377 P395 P640
      228   PRINT-DETAIL . . . . . . . . .  P371 P389 P407 P647
      329   SECT-NC138A-0001
      350   SECT-TH109-0002. . . . . . . .  G337
      636   SECT-TH109-0003
      351   SECT-0002-INIT
      363   SEP-DELETE-001
      381   SEP-DELETE-002
      399   SEP-DELETE-003
      450   SEP-DELETE-004
      499   SEP-DELETE-005
      544   SEP-DELETE-006
      585   SEP-DELETE-007
      633   SEP-DELETE-008
      366   SEP-FAIL-001 . . . . . . . . .  G362
      384   SEP-FAIL-002 . . . . . . . . .  G380
      402   SEP-FAIL-003 . . . . . . . . .  G398
      355   SEP-INIT-001
      372   SEP-INIT-002
      390   SEP-INIT-003
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    18
0 Defined   Cross-reference of procedures   References

0     408   SEP-INIT-004
      453   SEP-INIT-005 . . . . . . . . .  G444
      502   SEP-INIT-006 . . . . . . . . .  G493
      547   SEP-INIT-007 . . . . . . . . .  G538 G627
      589   SEP-INIT-008
      357   SEP-TEST-001
      374   SEP-TEST-002
      392   SEP-TEST-003
      417   SEP-TEST-004-01
      420   SEP-TEST-004-02
      423   SEP-TEST-004-03
      426   SEP-TEST-004-04
      429   SEP-TEST-004-05
      432   SEP-TEST-004-06
      435   SEP-TEST-004-07
      438   SEP-TEST-004-08
      441   SEP-TEST-004-09
      462   SEP-TEST-005-01
      465   SEP-TEST-005-02
      468   SEP-TEST-005-03
      471   SEP-TEST-005-04
      474   SEP-TEST-005-05
      478   SEP-TEST-005-06
      481   SEP-TEST-005-07
      484   SEP-TEST-005-08
      487   SEP-TEST-005-09
      490   SEP-TEST-005-10
      511   SEP-TEST-006-01
      514   SEP-TEST-006-02
      517   SEP-TEST-006-03
      520   SEP-TEST-006-04
      524   SEP-TEST-006-05
      530   SEP-TEST-006-06
      534   SEP-TEST-006-07
      554   SEP-TEST-007-01
      557   SEP-TEST-007-02
      561   SEP-TEST-007-03
      564   SEP-TEST-007-04
      568   SEP-TEST-007-05
      572   SEP-TEST-007-06
      576   SEP-TEST-007-07
      600   SEP-TEST-008-01
      603   SEP-TEST-008-02
      606   SEP-TEST-008-03
      609   SEP-TEST-008-04
      613   SEP-TEST-008-05
      619   SEP-TEST-008-06
      623   SEP-TEST-008-07
      369   SEP-WRITE-001. . . . . . . . .  G360 G365
      387   SEP-WRITE-002. . . . . . . . .  G378 G383
      405   SEP-WRITE-003. . . . . . . . .  G396 G401
      637   SYNTAX-CHECK . . . . . . . . .  P419 P422 P425 P428 P431 P434 P437 P440 P443 P464 P467 P470 P473 P477 P480 P483
                                            P486 P489 P492 P513 P516 P519 P523 P529 P533 P537 P556 P560 P563 P567 P571 P575
                                            P578 P602 P605 P608 P612 P618 P622 P626
      646   SYNTAX-CHECK-WRITE . . . . . .  E419 E422 E425 E428 E431 E434 E437 E440 E443 P452 E464 E467 E470 E473 E477 E480
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    19
0 Defined   Cross-reference of procedures   References

0                                           E483 E486 E489 E492 P501 E513 E516 E519 E523 E529 E533 E537 P546 E556 E560 E563
                                            E567 E571 E575 E578 P587 E602 E605 E608 E612 E618 E622 E626 P635 G641
      642   SYNTAX-FAIL
      221   TERMINATE-CALL
      219   TERMINATE-CCVS
      282   WRITE-LINE . . . . . . . . . .  P232 P233 P241 P242 P243 P244 P246 P247 P248 P250 P252 P261 P269 P275 P280 P281
                                            P309 P313 P315 P324
      298   WRT-LN . . . . . . . . . . . .  P288 P289 P290 P291 P292 P293 P294 P297 P302
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    20
0 Defined   Cross-reference of programs     References

        3   NC138A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC138A    Date 06/04/2022  Time 11:57:55   Page    21
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC138A:
 *    Source records = 651
 *    Data Division statements = 81
 *    Procedure Division statements = 336
 *    Generated COBOL statements = 0
 *    Program complexity factor = 345
0End of compilation 1,  program NC138A,  highest severity 0.
0Return code 0
