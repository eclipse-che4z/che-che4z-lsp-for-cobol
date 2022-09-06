1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:04   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:04   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2454.2
   000002         000200 PROGRAM-ID.                                                      NC2454.2
   000003         000300     NC245A.                                                      NC2454.2
   000004         000500*                                                              *  NC2454.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2454.2
   000006         000700*                                                              *  NC2454.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2454.2
   000008         000900*                                                              *  NC2454.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2454.2
   000010         001100*                                                              *  NC2454.2
   000011         001300*                                                              *  NC2454.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2454.2
   000013         001500*                                                              *  NC2454.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2454.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2454.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2454.2
   000017         001900*                                                              *  NC2454.2
   000018         002100*                                                              *  NC2454.2
   000019         002200*    PROGRAM NC245A TESTS THE USE OF THE COMMA, SEMI-COLON AND *  NC2454.2
   000020         002300*    SPACE SEPARATORS WHEN SPECIFYING SUBSCRIPTS AND INDICES   *  NC2454.2
   000021         002400*    TO ACCESS TWO AND THREE-DIMENSIONAL TABLES                *  NC2454.2
   000022         002500*    RELATIVE INDEXING IS ALSO USED.                           *  NC2454.2
   000023         002600*                                                              *  NC2454.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2454.2
   000025         002900 CONFIGURATION SECTION.                                           NC2454.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2454.2
   000027         003100     XXXXX082.                                                    NC2454.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2454.2
   000029         003300     XXXXX083.                                                    NC2454.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2454.2
   000031         003500 FILE-CONTROL.                                                    NC2454.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2454.2 36
   000033         003700     XXXXX055.                                                    NC2454.2
   000034         003800 DATA DIVISION.                                                   NC2454.2
   000035         003900 FILE SECTION.                                                    NC2454.2
   000036         004000 FD  PRINT-FILE.                                                  NC2454.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2454.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2454.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2454.2
   000040         004400 77  WRK1 PIC S999; COMPUTATIONAL, VALUE ZERO.                    NC2454.2 IMP
   000041         004500 77  EXPECTED-VALUE,   PIC    S999999.                            NC2454.2
   000042         004600 77  TEMP; PIC S999999.                                           NC2454.2
   000043         004700*    TWO DIMENSIONAL TABLE; 15 X 10.                              NC2454.2
   000044         004800 01  GRP-TAB2.                                                    NC2454.2
   000045         004900     02  GRP-LEV2-0015F; OCCURS 15 TIMES;                         NC2454.2
   000046         005000         INDEXED BY IN1,  INDEX1,                                 NC2454.2
   000047         005100         USAGE IS COMPUTATIONAL.                                  NC2454.2
   000048         005200         03  ELEM2 PIC S999999; OCCURS 10 TIMES;                  NC2454.2
   000049         005300                INDEXED BY IN2; INDEX2.                           NC2454.2
   000050         005400*    THREE DIMENSIONAL TABLE; 10 X 5 X 3.                         NC2454.2
   000051         005500 01  GRP-TAB3.                                                    NC2454.2
   000052         005600     02  GRP-LEV2-0003F; OCCURS 3 TIMES;                          NC2454.2
   000053         005700         INDEXED BY INAME1, IN-NAME-1,                            NC2454.2
   000054         005800         USAGE IS COMPUTATIONAL.                                  NC2454.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900         03  GRP-LEV3-0005F; OCCURS 5 TIMES;                      NC2454.2
   000056         006000             INDEXED BY INAME2; IN-NAME-2.                        NC2454.2
   000057         006100             04  ELEM3 PIC S999999; OCCURS 10 TIMES;              NC2454.2
   000058         006200                 INDEXED BY INAME3; IN-NAME-3.                    NC2454.2
   000059         006300*    SUBSCRIPTS FOR REFERENCING TABLE ITEMS                       NC2454.2
   000060         006400 01  SUBSCRIPT-TABLE; USAGE COMPUTATIONAL.                        NC2454.2
   000061         006500     02  S21  PIC S999; VALUE IS 1.                               NC2454.2
   000062         006600     02  S22  PIC S999; VALUE IS 1.                               NC2454.2
   000063         006700     02  S31  PIC S999; VALUE IS 1.                               NC2454.2
   000064         006800     02  S32  PIC S999; VALUE IS 1.                               NC2454.2
   000065         006900     02  S33  PIC S999; VALUE IS 1.                               NC2454.2
   000066         007000 01  TEST-RESULTS.                                                NC2454.2
   000067         007100     02 FILLER                   PIC X      VALUE SPACE.          NC2454.2 IMP
   000068         007200     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2454.2 IMP
   000069         007300     02 FILLER                   PIC X      VALUE SPACE.          NC2454.2 IMP
   000070         007400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2454.2 IMP
   000071         007500     02 FILLER                   PIC X      VALUE SPACE.          NC2454.2 IMP
   000072         007600     02  PAR-NAME.                                                NC2454.2
   000073         007700       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2454.2 IMP
   000074         007800       03  PARDOT-X              PIC X      VALUE SPACE.          NC2454.2 IMP
   000075         007900       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2454.2 IMP
   000076         008000     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2454.2 IMP
   000077         008100     02 RE-MARK                  PIC X(61).                       NC2454.2
   000078         008200 01  TEST-COMPUTED.                                               NC2454.2
   000079         008300     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2454.2 IMP
   000080         008400     02 FILLER                   PIC X(17)  VALUE                 NC2454.2
   000081         008500            "       COMPUTED=".                                   NC2454.2
   000082         008600     02 COMPUTED-X.                                               NC2454.2
   000083         008700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2454.2 IMP
   000084         008800     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2454.2 83
   000085         008900                                 PIC -9(9).9(9).                  NC2454.2
   000086         009000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2454.2 83
   000087         009100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2454.2 83
   000088         009200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2454.2 83
   000089         009300     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2454.2 83
   000090         009400         04 COMPUTED-18V0                    PIC -9(18).          NC2454.2
   000091         009500         04 FILLER                           PIC X.               NC2454.2
   000092         009600     03 FILLER PIC X(50) VALUE SPACE.                             NC2454.2 IMP
   000093         009700 01  TEST-CORRECT.                                                NC2454.2
   000094         009800     02 FILLER PIC X(30) VALUE SPACE.                             NC2454.2 IMP
   000095         009900     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2454.2
   000096         010000     02 CORRECT-X.                                                NC2454.2
   000097         010100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2454.2 IMP
   000098         010200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2454.2 97
   000099         010300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2454.2 97
   000100         010400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2454.2 97
   000101         010500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2454.2 97
   000102         010600     03      CR-18V0 REDEFINES CORRECT-A.                         NC2454.2 97
   000103         010700         04 CORRECT-18V0                     PIC -9(18).          NC2454.2
   000104         010800         04 FILLER                           PIC X.               NC2454.2
   000105         010900     03 FILLER PIC X(2) VALUE SPACE.                              NC2454.2 IMP
   000106         011000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2454.2 IMP
   000107         011100 01  CCVS-C-1.                                                    NC2454.2
   000108         011200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2454.2
   000109         011300-    "SS  PARAGRAPH-NAME                                          NC2454.2
   000110         011400-    "       REMARKS".                                            NC2454.2
   000111         011500     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2454.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  CCVS-C-2.                                                    NC2454.2
   000113         011700     02 FILLER                     PIC X        VALUE SPACE.      NC2454.2 IMP
   000114         011800     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2454.2
   000115         011900     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2454.2 IMP
   000116         012000     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2454.2
   000117         012100     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2454.2 IMP
   000118         012200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2454.2 IMP
   000119         012300 01  REC-CT                        PIC 99       VALUE ZERO.       NC2454.2 IMP
   000120         012400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2454.2 IMP
   000121         012500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2454.2 IMP
   000122         012600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2454.2 IMP
   000123         012700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2454.2 IMP
   000124         012800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2454.2 IMP
   000125         012900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2454.2 IMP
   000126         013000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2454.2 IMP
   000127         013100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2454.2 IMP
   000128         013200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2454.2 IMP
   000129         013300 01  CCVS-H-1.                                                    NC2454.2
   000130         013400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2454.2 IMP
   000131         013500     02  FILLER                    PIC X(42)    VALUE             NC2454.2
   000132         013600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2454.2
   000133         013700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2454.2 IMP
   000134         013800 01  CCVS-H-2A.                                                   NC2454.2
   000135         013900   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2454.2 IMP
   000136         014000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2454.2
   000137         014100   02  FILLER                        PIC XXXX   VALUE             NC2454.2
   000138         014200     "4.2 ".                                                      NC2454.2
   000139         014300   02  FILLER                        PIC X(28)  VALUE             NC2454.2
   000140         014400            " COPY - NOT FOR DISTRIBUTION".                       NC2454.2
   000141         014500   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2454.2 IMP
   000142         014600                                                                  NC2454.2
   000143         014700 01  CCVS-H-2B.                                                   NC2454.2
   000144         014800   02  FILLER                        PIC X(15)  VALUE             NC2454.2
   000145         014900            "TEST RESULT OF ".                                    NC2454.2
   000146         015000   02  TEST-ID                       PIC X(9).                    NC2454.2
   000147         015100   02  FILLER                        PIC X(4)   VALUE             NC2454.2
   000148         015200            " IN ".                                               NC2454.2
   000149         015300   02  FILLER                        PIC X(12)  VALUE             NC2454.2
   000150         015400     " HIGH       ".                                              NC2454.2
   000151         015500   02  FILLER                        PIC X(22)  VALUE             NC2454.2
   000152         015600            " LEVEL VALIDATION FOR ".                             NC2454.2
   000153         015700   02  FILLER                        PIC X(58)  VALUE             NC2454.2
   000154         015800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2454.2
   000155         015900 01  CCVS-H-3.                                                    NC2454.2
   000156         016000     02  FILLER                      PIC X(34)  VALUE             NC2454.2
   000157         016100            " FOR OFFICIAL USE ONLY    ".                         NC2454.2
   000158         016200     02  FILLER                      PIC X(58)  VALUE             NC2454.2
   000159         016300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2454.2
   000160         016400     02  FILLER                      PIC X(28)  VALUE             NC2454.2
   000161         016500            "  COPYRIGHT   1985 ".                                NC2454.2
   000162         016600 01  CCVS-E-1.                                                    NC2454.2
   000163         016700     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2454.2 IMP
   000164         016800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2454.2
   000165         016900     02 ID-AGAIN                     PIC X(9).                    NC2454.2
   000166         017000     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2454.2 IMP
   000167         017100 01  CCVS-E-2.                                                    NC2454.2
   000168         017200     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2454.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2454.2 IMP
   000170         017400     02 CCVS-E-2-2.                                               NC2454.2
   000171         017500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2454.2 IMP
   000172         017600         03 FILLER                   PIC X      VALUE SPACE.      NC2454.2 IMP
   000173         017700         03 ENDER-DESC               PIC X(44)  VALUE             NC2454.2
   000174         017800            "ERRORS ENCOUNTERED".                                 NC2454.2
   000175         017900 01  CCVS-E-3.                                                    NC2454.2
   000176         018000     02  FILLER                      PIC X(22)  VALUE             NC2454.2
   000177         018100            " FOR OFFICIAL USE ONLY".                             NC2454.2
   000178         018200     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2454.2 IMP
   000179         018300     02  FILLER                      PIC X(58)  VALUE             NC2454.2
   000180         018400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2454.2
   000181         018500     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2454.2 IMP
   000182         018600     02 FILLER                       PIC X(15)  VALUE             NC2454.2
   000183         018700             " COPYRIGHT 1985".                                   NC2454.2
   000184         018800 01  CCVS-E-4.                                                    NC2454.2
   000185         018900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2454.2 IMP
   000186         019000     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2454.2
   000187         019100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2454.2 IMP
   000188         019200     02 FILLER                       PIC X(40)  VALUE             NC2454.2
   000189         019300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2454.2
   000190         019400 01  XXINFO.                                                      NC2454.2
   000191         019500     02 FILLER                       PIC X(19)  VALUE             NC2454.2
   000192         019600            "*** INFORMATION ***".                                NC2454.2
   000193         019700     02 INFO-TEXT.                                                NC2454.2
   000194         019800       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2454.2 IMP
   000195         019900       04 XXCOMPUTED                 PIC X(20).                   NC2454.2
   000196         020000       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2454.2 IMP
   000197         020100       04 XXCORRECT                  PIC X(20).                   NC2454.2
   000198         020200     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2454.2
   000199         020300 01  HYPHEN-LINE.                                                 NC2454.2
   000200         020400     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2454.2 IMP
   000201         020500     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2454.2
   000202         020600-    "*****************************************".                 NC2454.2
   000203         020700     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2454.2
   000204         020800-    "******************************".                            NC2454.2
   000205         020900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2454.2
   000206         021000     "NC245A".                                                    NC2454.2
   000207         021100 PROCEDURE DIVISION.                                              NC2454.2
   000208         021200 CCVS1 SECTION.                                                   NC2454.2
   000209         021300 OPEN-FILES.                                                      NC2454.2
   000210         021400     OPEN     OUTPUT PRINT-FILE.                                  NC2454.2 36
   000211         021500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2454.2 205 146 205 165
   000212         021600     MOVE    SPACE TO TEST-RESULTS.                               NC2454.2 IMP 66
   000213         021700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2454.2 238 243
   000214         021800     GO TO CCVS1-EXIT.                                            NC2454.2 320
   000215         021900 CLOSE-FILES.                                                     NC2454.2
   000216         022000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2454.2 247 268 36
   000217         022100 TERMINATE-CCVS.                                                  NC2454.2
   000218         022200     EXIT PROGRAM.                                                NC2454.2
   000219         022300 TERMINATE-CALL.                                                  NC2454.2
   000220         022400     STOP     RUN.                                                NC2454.2
   000221         022500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2454.2 70 122
   000222         022600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2454.2 70 123
   000223         022700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2454.2 70 121
   000224         022800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2454.2 70 120
   000225         022900     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2454.2 77
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 PRINT-DETAIL.                                                    NC2454.2
   000227         023100     IF REC-CT NOT EQUAL TO ZERO                                  NC2454.2 119 IMP
   000228      1  023200             MOVE "." TO PARDOT-X                                 NC2454.2 74
   000229      1  023300             MOVE REC-CT TO DOTVALUE.                             NC2454.2 119 75
   000230         023400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2454.2 66 37 280
   000231         023500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2454.2 70 280
   000232      1  023600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2454.2 297 310
   000233      1  023700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2454.2 311 319
   000234         023800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2454.2 IMP 70 IMP 82
   000235         023900     MOVE SPACE TO CORRECT-X.                                     NC2454.2 IMP 96
   000236         024000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2454.2 119 IMP IMP 72
   000237         024100     MOVE     SPACE TO RE-MARK.                                   NC2454.2 IMP 77
   000238         024200 HEAD-ROUTINE.                                                    NC2454.2
   000239         024300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2454.2 129 38 280
   000240         024400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2454.2 134 38 280
   000241         024500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2454.2 143 38 280
   000242         024600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2454.2 155 38 280
   000243         024700 COLUMN-NAMES-ROUTINE.                                            NC2454.2
   000244         024800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2454.2 107 38 280
   000245         024900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2454.2 112 38 280
   000246         025000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2454.2 199 38 280
   000247         025100 END-ROUTINE.                                                     NC2454.2
   000248         025200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2454.2 199 38 280
   000249         025300 END-RTN-EXIT.                                                    NC2454.2
   000250         025400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2454.2 162 38 280
   000251         025500 END-ROUTINE-1.                                                   NC2454.2
   000252         025600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2454.2 121 125 122
   000253         025700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2454.2 125 120 125
   000254         025800      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2454.2 123 125
   000255         025900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2454.2
   000256         026000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2454.2 123 185
   000257         026100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2454.2 125 187
   000258         026200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2454.2 184 170
   000259         026300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2454.2 167 38 280
   000260         026400  END-ROUTINE-12.                                                 NC2454.2
   000261         026500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2454.2 173
   000262         026600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2454.2 121 IMP
   000263      1  026700         MOVE "NO " TO ERROR-TOTAL                                NC2454.2 171
   000264         026800         ELSE                                                     NC2454.2
   000265      1  026900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2454.2 121 171
   000266         027000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2454.2 167 38
   000267         027100     PERFORM WRITE-LINE.                                          NC2454.2 280
   000268         027200 END-ROUTINE-13.                                                  NC2454.2
   000269         027300     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2454.2 120 IMP
   000270      1  027400         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2454.2 171
   000271      1  027500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2454.2 120 171
   000272         027600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2454.2 173
   000273         027700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2454.2 167 38 280
   000274         027800      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2454.2 122 IMP
   000275      1  027900          MOVE "NO " TO ERROR-TOTAL                               NC2454.2 171
   000276      1  028000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2454.2 122 171
   000277         028100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2454.2 173
   000278         028200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2454.2 167 38 280
   000279         028300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2454.2 175 38 280
   000280         028400 WRITE-LINE.                                                      NC2454.2
   000281         028500     ADD 1 TO RECORD-COUNT.                                       NC2454.2 127
   000282         028600     IF RECORD-COUNT GREATER 50                                   NC2454.2 127
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2454.2 38 126
   000284      1  028800         MOVE SPACE TO DUMMY-RECORD                               NC2454.2 IMP 38
   000285      1  028900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2454.2 38
   000286      1  029000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2454.2 107 38 292
   000287      1  029100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2454.2 112 38 292
   000288      1  029200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2454.2 199 38 292
   000289      1  029300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2454.2 126 38
   000290      1  029400         MOVE ZERO TO RECORD-COUNT.                               NC2454.2 IMP 127
   000291         029500     PERFORM WRT-LN.                                              NC2454.2 292
   000292         029600 WRT-LN.                                                          NC2454.2
   000293         029700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2454.2 38
   000294         029800     MOVE SPACE TO DUMMY-RECORD.                                  NC2454.2 IMP 38
   000295         029900 BLANK-LINE-PRINT.                                                NC2454.2
   000296         030000     PERFORM WRT-LN.                                              NC2454.2 292
   000297         030100 FAIL-ROUTINE.                                                    NC2454.2
   000298         030200     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2454.2 82 IMP 305
   000299         030300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2454.2 96 IMP 305
   000300         030400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2454.2 128 198
   000301         030500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2454.2 193
   000302         030600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2454.2 190 38 280
   000303         030700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2454.2 IMP 198
   000304         030800     GO TO  FAIL-ROUTINE-EX.                                      NC2454.2 310
   000305         030900 FAIL-ROUTINE-WRITE.                                              NC2454.2
   000306         031000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2454.2 78 37 280
   000307         031100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2454.2 128 106
   000308         031200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2454.2 93 37 280
   000309         031300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2454.2 IMP 106
   000310         031400 FAIL-ROUTINE-EX. EXIT.                                           NC2454.2
   000311         031500 BAIL-OUT.                                                        NC2454.2
   000312         031600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2454.2 83 IMP 314
   000313         031700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2454.2 97 IMP 319
   000314         031800 BAIL-OUT-WRITE.                                                  NC2454.2
   000315         031900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2454.2 97 197 83 195
   000316         032000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2454.2 128 198
   000317         032100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2454.2 190 38 280
   000318         032200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2454.2 IMP 198
   000319         032300 BAIL-OUT-EX. EXIT.                                               NC2454.2
   000320         032400 CCVS1-EXIT.                                                      NC2454.2
   000321         032500     EXIT.                                                        NC2454.2
   000322         032600*        SECTION 2.1.6 ON PAGE IV-3 OF AMERICAN NATIONAL          NC2454.2
   000323         032700*    STANDARD COBOL, X3.23 - 1985 STATES THAT COMMA AND           NC2454.2
   000324         032800*    SEMICOLON ARE OPTIONAL WHERE SHOWN IN THE FORMATS AND        NC2454.2
   000325         032900*    ARE INTERCHANGEABLE.  EITHER ONE MAY BE USED ANYWHERE        NC2454.2
   000326         033000*    ONE OF THEM IS SHOWN IN THE LANGUAGE FORMATS.                NC2454.2
   000327         033100*                                                                 NC2454.2
   000328         033200*        THIS ROUTINE TESTS THE USE OF SEMICOLON IN PLACE OF      NC2454.2
   000329         033300*    COMMA AS SEPARATORS FOR SUBSCRIPTS AND INDEXES IN            NC2454.2
   000330         033400*    REFERENCING TABLE ITEMS.                                     NC2454.2
   000331         033600*STATEMENT DELETION INSTRUCTIONS                                  NC2454.2
   000332         033700*        IF THE COMPILER REJECTS ANY TABLE REFERENCE IN THESE     NC2454.2
   000333         033800*    TESTS, DELETE THAT LINE OF CODE BY PLACING AN * IN COLUMN 7. NC2454.2
   000334         033900*    LEAVE THE PERFORM ... THRU STATEMENT.  THE TEST DELETED      NC2454.2
   000335         034000*    APPEARS AS A FAILURE ON THE OUTPUT REPORT.                   NC2454.2
   000336         034200 SECT-NC245A-001 SECTION.                                         NC2454.2
   000337         034300*        THIS SECTION STORES THE VALUES 1 THRU 150 IN THE         NC2454.2
   000338         034400*    TWO TABLES USED IN THE TESTS OF SEMICOLON AS SUBSCRIPT       NC2454.2
   000339         034500*    AND INDEX SEPARATOR.                                         NC2454.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034600 BUILD-TABLE.                                                     NC2454.2
   000341         034700     ADD 1 TO WRK1.                                               NC2454.2 40
   000342         034800     MOVE WRK1 TO ELEM2 (S21, S22)                                NC2454.2 40 48 61 62
   000343         034900                  ELEM3 (S31, S32, S33).                          NC2454.2 57 63 64 65
   000344         035000     IF WRK1 EQUAL TO 150 GO TO SECT-TH219-0002.                  NC2454.2 40 354
   000345         035100 INCRE-SUBS.                                                      NC2454.2
   000346         035200     ADD 1 TO S22, S33.                                           NC2454.2 62 65
   000347         035300     IF S22 LESS THAN 11 GO TO BUILD-TABLE.                       NC2454.2 62 340
   000348         035400     MOVE 1 TO S22, S33.                                          NC2454.2 62 65
   000349         035500     ADD 1 TO S21, S32.                                           NC2454.2 61 64
   000350         035600     IF S32 LESS THAN 6 GO TO BUILD-TABLE.                        NC2454.2 64 340
   000351         035700     MOVE 1 TO S32.                                               NC2454.2 64
   000352         035800     ADD 1 TO S31.                                                NC2454.2 63
   000353         035900     GO TO BUILD-TABLE.                                           NC2454.2 340
   000354         036000 SECT-TH219-0002 SECTION.                                         NC2454.2
   000355         036100*        THIS SECTION CONTAINS THE TESTS ON THE USE OF SEMICOLON  NC2454.2
   000356         036200*    AS A SEPARATOR IN REFERENCING TABLE ITEMS.                   NC2454.2
   000357         036300 SEP-INIT-008.                                                    NC2454.2
   000358         036400     MOVE "SEP-TEST-008" TO PAR-NAME.                             NC2454.2 72
   000359         036500     MOVE "SEMICLN AS SEPARATOR" TO FEATURE.                      NC2454.2 68
   000360         036600     MOVE 0 TO REC-CT.                                            NC2454.2 119
   000361         036700     MOVE 0 TO TEMP.                                              NC2454.2 42
   000362         036800     MOVE 6 TO EXPECTED-VALUE.                                    NC2454.2 41
   000363         036900     MOVE 1 TO S21.                                               NC2454.2 61
   000364         037000     MOVE 6 TO S22.                                               NC2454.2 62
   000365         037100*        THIS TEST USES SPACES AND SEMICOLONS IN REFERENCING      NC2454.2
   000366         037200*    TWO DIMENSIONAL TABLE ELEMENTS WITH SUBSCRIPTS.              NC2454.2
   000367         037300 SEP-TEST-008-01.                                                 NC2454.2
   000368         037400     MOVE ELEM2 (S21; S22) TO TEMP.                               NC2454.2 48 61 62 42
   000369         037500     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000370         037600 SEP-TEST-008-02.                                                 NC2454.2
   000371         037700     MOVE ELEM2(S21; S22) TO TEMP.                                NC2454.2 48 61 62 42
   000372         037800     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000373         037900 SEP-TEST-008-03.                                                 NC2454.2
   000374         038000     ADD ELEM2 (S21 ; S22) TO TEMP.                               NC2454.2 48 61 62 42
   000375         038100     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000376         038200 SEP-TEST-008-04.                                                 NC2454.2
   000377         038300     MOVE ELEM2( S21; S22 ) TO TEMP.                              NC2454.2 48 61 62 42
   000378         038400     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000379         038500 SEP-TEST-008-05.                                                 NC2454.2
   000380         038600     MOVE ELEM2 ( S21;  S22  ) TO TEMP.                           NC2454.2 48 61 62 42
   000381         038700     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000382         038800     GO TO SEP-INIT-009.                                          NC2454.2 386
   000383         038900 SEP-DELETE-008.                                                  NC2454.2
   000384         039000     PERFORM DE-LETE.                                             NC2454.2 224
   000385         039100     PERFORM TEST-WRITE.                                          NC2454.2 526
   000386         039200 SEP-INIT-009.                                                    NC2454.2
   000387         039300     MOVE "SEP-TEST-009" TO PAR-NAME.                             NC2454.2 72
   000388         039400     MOVE 0 TO REC-CT.                                            NC2454.2 119
   000389         039500     MOVE 0 TO TEMP.                                              NC2454.2 42
   000390         039600     MOVE 150 TO EXPECTED-VALUE.                                  NC2454.2 41
   000391         039700     MOVE 3 TO S31.                                               NC2454.2 63
   000392         039800     MOVE 5 TO S32.                                               NC2454.2 64
   000393         039900     MOVE 10 TO S33.                                              NC2454.2 65
   000394         040000*        THIS TEST USES SEMICOLONS, COMMAS, AND SPACES IN         NC2454.2
   000395         040100*    REFERENCING THREE DIMENSIONAL TABLE ELEMENTS WITH SUBSCRIPTS.NC2454.2
   000396         040200 SEP-TEST-009-01.                                                 NC2454.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040300     MOVE ELEM3 (S31; S32; S33) TO TEMP.                          NC2454.2 57 63 64 65 42
   000398         040400     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000399         040500 SEP-TEST-009-02.                                                 NC2454.2
   000400         040600     MOVE ELEM3(S31; S32; S33) TO TEMP.                           NC2454.2 57 63 64 65 42
   000401         040700     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000402         040800 SEP-TEST-009-03.                                                 NC2454.2
   000403         040900     ADD ELEM3 (S31, S32; S33) TO TEMP.                           NC2454.2 57 63 64 65 42
   000404         041000     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000405         041100 SEP-TEST-009-04.                                                 NC2454.2
   000406         041200     MOVE     300 TO TEMP.                                        NC2454.2 42
   000407         041300     SUBTRACT ELEM3 (S31; S32 S33) FROM TEMP.                     NC2454.2 57 63 64 65 42
   000408         041400     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000409         041500 SEP-TEST-009-05.                                                 NC2454.2
   000410         041600     MOVE ELEM3 (S31 ; S32 ; S33) TO TEMP.                        NC2454.2 57 63 64 65 42
   000411         041700     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000412         041800 SEP-TEST-009-06.                                                 NC2454.2
   000413         041900     MOVE ELEM3( S31   S32; S33) TO TEMP.                         NC2454.2 57 63 64 65 42
   000414         042000     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000415         042100     GO TO SEP-INIT-010.                                          NC2454.2 420
   000416         042200 SEP-DELETE-009.                                                  NC2454.2
   000417         042300     PERFORM DE-LETE.                                             NC2454.2 224
   000418         042400     PERFORM TEST-WRITE.                                          NC2454.2 526
   000419         042500*                                                                 NC2454.2
   000420         042600 SEP-INIT-010.                                                    NC2454.2
   000421         042700     MOVE "SEP-TEST-010" TO PAR-NAME.                             NC2454.2 72
   000422         042800     MOVE 0 TO REC-CT.                                            NC2454.2 119
   000423         042900     MOVE 0 TO TEMP.                                              NC2454.2 42
   000424         043000     MOVE 150 TO EXPECTED-VALUE.                                  NC2454.2 41
   000425         043100*        THIS TEST USES SEMICOLONS, SPACES AND COMMAS IN          NC2454.2
   000426         043200*    REFERENCING TABLE ELEMENTS WITH LITERAL SUBSCRIPTS.          NC2454.2
   000427         043300 SEP-TEST-010-01.                                                 NC2454.2
   000428         043400     MOVE ELEM2 (15; 10) TO TEMP.                                 NC2454.2 48 42
   000429         043500     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000430         043600 SEP-TEST-010-02.                                                 NC2454.2
   000431         043700     MOVE ELEM2 ( 15; 10 ) TO TEMP.                               NC2454.2 48 42
   000432         043800     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000433         043900 SEP-TEST-010-03.                                                 NC2454.2
   000434         044000     ADD ELEM2(15; 10) TO TEMP.                                   NC2454.2 48 42
   000435         044100     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000436         044200 SEP-TEST-010-04.                                                 NC2454.2
   000437         044300     MOVE ELEM2 (+15; 10) TO TEMP.                                NC2454.2 48 42
   000438         044400     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000439         044500 SEP-TEST-010-05.                                                 NC2454.2
   000440         044600     ADD ELEM3 (3; 5; 10) TO TEMP.                                NC2454.2 57 42
   000441         044700     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000442         044800 SEP-TEST-010-06.                                                 NC2454.2
   000443         044900     MOVE ELEM3( +3; +5, +10) TO TEMP.                            NC2454.2 57 42
   000444         045000     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000445         045100 SEP-TEST-010-07.                                                 NC2454.2
   000446         045200     MOVE ELEM3 (+3, 5; 10) TO TEMP.                              NC2454.2 57 42
   000447         045300     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000448         045400     GO TO SEP-INIT-011.                                          NC2454.2 453
   000449         045500 SEP-DELETE-010.                                                  NC2454.2
   000450         045600     PERFORM DE-LETE.                                             NC2454.2 224
   000451         045700     PERFORM TEST-WRITE.                                          NC2454.2 526
   000452         045800*                                                                 NC2454.2
   000453         045900 SEP-INIT-011.                                                    NC2454.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         046000     MOVE "SEP-TEST-011" TO PAR-NAME.                             NC2454.2 72
   000455         046100     MOVE 0 TO TEMP; REC-CT.                                      NC2454.2 42 119
   000456         046200     MOVE 135 TO EXPECTED-VALUE.                                  NC2454.2 41
   000457         046300*        THIS TEST USES SEMICOLON, COMMA AND SPACE IN             NC2454.2
   000458         046400*    REFERENCING 2 AND 3-DIM. TABLES WITH INDEXING.               NC2454.2
   000459         046500 SEP-TEST-011-01.                                                 NC2454.2
   000460         046600     SET IN1 TO 14.                                               NC2454.2 46
   000461         046700     SET IN2 TO  5.                                               NC2454.2 49
   000462         046800     MOVE ELEM2 (IN1; IN2) TO TEMP.                               NC2454.2 48 46 49 42
   000463         046900     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000464         047000 SEP-TEST-011-02.                                                 NC2454.2
   000465         047100     SET INAME1 TO 3.                                             NC2454.2 53
   000466         047200     SET INAME2 TO 4.                                             NC2454.2 56
   000467         047300     SET INAME3 TO 5.                                             NC2454.2 58
   000468         047400     MOVE ELEM3 (INAME1; INAME2; INAME3) TO TEMP.                 NC2454.2 57 53 56 58 42
   000469         047500     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000470         047600 SEP-TEST-011-03.                                                 NC2454.2
   000471         047700     MOVE ELEM3 (INAME1, INAME2; INAME3) TO TEMP.                 NC2454.2 57 53 56 58 42
   000472         047800     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000473         047900 SEP-TEST-011-04.                                                 NC2454.2
   000474         048000     MOVE ELEM3 (INAME1; INAME2 INAME3) TO TEMP.                  NC2454.2 57 53 56 58 42
   000475         048100     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000476         048200 SEP-TEST-011-05.                                                 NC2454.2
   000477         048300     MOVE ELEM3 (3; INAME2; 5) TO TEMP.                           NC2454.2 57 56 42
   000478         048400     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000479         048500 SEP-TEST-011-06.                                                 NC2454.2
   000480         048600     MOVE ELEM3 (3, INAME2; 5) TO TEMP.                           NC2454.2 57 56 42
   000481         048700     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000482         048800     GO TO SEP-INIT-012.                                          NC2454.2 487
   000483         048900 SEP-DELETE-011.                                                  NC2454.2
   000484         049000     PERFORM DE-LETE.                                             NC2454.2 224
   000485         049100     PERFORM TEST-WRITE.                                          NC2454.2 526
   000486         049200*                                                                 NC2454.2
   000487         049300 SEP-INIT-012.                                                    NC2454.2
   000488         049400     MOVE "SEP-TEST-012" TO PAR-NAME.                             NC2454.2 72
   000489         049500     MOVE ZERO TO TEMP; REC-CT.                                   NC2454.2 IMP 42 119
   000490         049600     MOVE 123 TO EXPECTED-VALUE.                                  NC2454.2 41
   000491         049700*        THIS TEST USES SEMICOLON, COMMA AND SPACE AS             NC2454.2
   000492         049800*    SEPARATORS IN REFERENCING 3-DIMENSIONAL TABLE                NC2454.2
   000493         049900*    ITEMS WITH RELATIVE INDEXING.                                NC2454.2
   000494         050000 SEP-TEST-012-01.                                                 NC2454.2
   000495         050100     SET INAME1; INAME2; INAME3 TO 3.                             NC2454.2 53 56 58
   000496         050200     SET IN-NAME-1; IN-NAME-2; IN-NAME-3 TO 1.                    NC2454.2 53 56 58
   000497         050300     MOVE ELEM3 (IN-NAME-1 + 2; INAME2; 3) TO TEMP.               NC2454.2 57 53 56 42
   000498         050400     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000499         050500 SEP-TEST-012-02.                                                 NC2454.2
   000500         050600     MOVE ELEM3 (IN-NAME-1 + 2; IN-NAME-2 + 2;                    NC2454.2 57 53 56
   000501         050700         IN-NAME-3 + 2) TO TEMP.                                  NC2454.2 58 42
   000502         050800     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000503         050900 SEP-TEST-012-03.                                                 NC2454.2
   000504         051000     MOVE ELEM3 (INAME1; IN-NAME-2 + 2; IN-NAME-3 + 2)            NC2454.2 57 53 56 58
   000505         051100         TO TEMP.                                                 NC2454.2 42
   000506         051200     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000507         051300 SEP-TEST-012-04.                                                 NC2454.2
   000508         051400     MOVE ELEM3 (+3, INAME2; IN-NAME-3 + 2) TO TEMP.              NC2454.2 57 56 58 42
   000509         051500     PERFORM TEST-CHECK THRU TEST-WRITE.                          NC2454.2 517 526
   000510         051600     GO TO CCVS-EXIT.                                             NC2454.2 529
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051700 SEP-DELETE-012.                                                  NC2454.2
   000512         051800     PERFORM DE-LETE.                                             NC2454.2 224
   000513         051900     PERFORM TEST-WRITE.                                          NC2454.2 526
   000514         052000*                                                                 NC2454.2
   000515         052100 SECT-TH219-0003 SECTION.                                         NC2454.2
   000516         052200*                                                                 NC2454.2
   000517         052300 TEST-CHECK.                                                      NC2454.2
   000518         052400     ADD 1 TO REC-CT.                                             NC2454.2 119
   000519         052500     IF TEMP IS EQUAL TO EXPECTED-VALUE                           NC2454.2 42 41
   000520      1  052600         PERFORM PASS                                             NC2454.2 222
   000521      1  052700         GO TO TEST-WRITE.                                        NC2454.2 526
   000522         052800 TEST-FAIL.                                                       NC2454.2
   000523         052900     PERFORM FAIL.                                                NC2454.2 223
   000524         053000     MOVE TEMP TO COMPUTED-18V0.                                  NC2454.2 42 90
   000525         053100     MOVE EXPECTED-VALUE TO CORRECT-18V0.                         NC2454.2 41 103
   000526         053200 TEST-WRITE.                                                      NC2454.2
   000527         053300     PERFORM PRINT-DETAIL.                                        NC2454.2 226
   000528         053400     MOVE 0 TO TEMP.                                              NC2454.2 42
   000529         053500 CCVS-EXIT SECTION.                                               NC2454.2
   000530         053600 CCVS-999999.                                                     NC2454.2
   000531         053700     GO TO CLOSE-FILES.                                           NC2454.2 215
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      128   ANSI-REFERENCE . . . . . . . .  300 307 316
      107   CCVS-C-1 . . . . . . . . . . .  244 286
      112   CCVS-C-2 . . . . . . . . . . .  245 287
      162   CCVS-E-1 . . . . . . . . . . .  250
      167   CCVS-E-2 . . . . . . . . . . .  259 266 273 278
      170   CCVS-E-2-2 . . . . . . . . . .  M258
      175   CCVS-E-3 . . . . . . . . . . .  279
      184   CCVS-E-4 . . . . . . . . . . .  258
      185   CCVS-E-4-1 . . . . . . . . . .  M256
      187   CCVS-E-4-2 . . . . . . . . . .  M257
      129   CCVS-H-1 . . . . . . . . . . .  239
      134   CCVS-H-2A. . . . . . . . . . .  240
      143   CCVS-H-2B. . . . . . . . . . .  241
      155   CCVS-H-3 . . . . . . . . . . .  242
      205   CCVS-PGM-ID. . . . . . . . . .  211 211
       89   CM-18V0
       83   COMPUTED-A . . . . . . . . . .  84 86 87 88 89 312 315
       84   COMPUTED-N
       82   COMPUTED-X . . . . . . . . . .  M234 298
       86   COMPUTED-0V18
       88   COMPUTED-14V4
       90   COMPUTED-18V0. . . . . . . . .  M524
       87   COMPUTED-4V14
      106   COR-ANSI-REFERENCE . . . . . .  M307 M309
       97   CORRECT-A. . . . . . . . . . .  98 99 100 101 102 313 315
       98   CORRECT-N
       96   CORRECT-X. . . . . . . . . . .  M235 299
       99   CORRECT-0V18
      101   CORRECT-14V4
      103   CORRECT-18V0 . . . . . . . . .  M525
      100   CORRECT-4V14
      102   CR-18V0
      120   DELETE-COUNTER . . . . . . . .  M224 253 269 271
       75   DOTVALUE . . . . . . . . . . .  M229
      126   DUMMY-HOLD . . . . . . . . . .  M283 289
       38   DUMMY-RECORD . . . . . . . . .  M239 M240 M241 M242 M244 M245 M246 M248 M250 M259 M266 M273 M278 M279 283 M284
                                            285 M286 M287 M288 M289 293 M294 M302 M317
       48   ELEM2. . . . . . . . . . . . .  M342 368 371 374 377 380 428 431 434 437 462
       57   ELEM3. . . . . . . . . . . . .  M343 397 400 403 407 410 413 440 443 446 468 471 474 477 480 497 500 504 508
      173   ENDER-DESC . . . . . . . . . .  M261 M272 M277
      121   ERROR-COUNTER. . . . . . . . .  M223 252 262 265
      125   ERROR-HOLD . . . . . . . . . .  M252 M253 M253 M254 257
      171   ERROR-TOTAL. . . . . . . . . .  M263 M265 M270 M271 M275 M276
       41   EXPECTED-VALUE . . . . . . . .  M362 M390 M424 M456 M490 519 525
       68   FEATURE. . . . . . . . . . . .  M359
       52   GRP-LEV2-0003F
       45   GRP-LEV2-0015F
       55   GRP-LEV3-0005F
       44   GRP-TAB2
       51   GRP-TAB3
      199   HYPHEN-LINE. . . . . . . . . .  246 248 288
      165   ID-AGAIN . . . . . . . . . . .  M211
       53   IN-NAME-1. . . . . . . . . . .  M496 497 500
       56   IN-NAME-2. . . . . . . . . . .  M496 500 504
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    14
0 Defined   Cross-reference of data names   References

0      58   IN-NAME-3. . . . . . . . . . .  M496 501 504 508
       53   INAME1 . . . . . . . . . . . .  M465 468 471 474 M495 504
       56   INAME2 . . . . . . . . . . . .  M466 468 471 474 477 480 M495 497 508
       58   INAME3 . . . . . . . . . . . .  M467 468 471 474 M495
       46   INDEX1
       49   INDEX2
      198   INF-ANSI-REFERENCE . . . . . .  M300 M303 M316 M318
      193   INFO-TEXT. . . . . . . . . . .  M301
      122   INSPECT-COUNTER. . . . . . . .  M221 252 274 276
       46   IN1. . . . . . . . . . . . . .  M460 462
       49   IN2. . . . . . . . . . . . . .  M461 462
       70   P-OR-F . . . . . . . . . . . .  M221 M222 M223 M224 231 M234
       72   PAR-NAME . . . . . . . . . . .  M236 M358 M387 M421 M454 M488
       74   PARDOT-X . . . . . . . . . . .  M228
      123   PASS-COUNTER . . . . . . . . .  M222 254 256
       36   PRINT-FILE . . . . . . . . . .  32 210 216
       37   PRINT-REC. . . . . . . . . . .  M230 M306 M308
       77   RE-MARK. . . . . . . . . . . .  M225 M237
      119   REC-CT . . . . . . . . . . . .  227 229 236 M360 M388 M422 M455 M489 M518
      118   REC-SKL-SUB
      127   RECORD-COUNT . . . . . . . . .  M281 282 M290
       60   SUBSCRIPT-TABLE
       61   S21. . . . . . . . . . . . . .  342 M349 M363 368 371 374 377 380
       62   S22. . . . . . . . . . . . . .  342 M346 347 M348 M364 368 371 374 377 380
       63   S31. . . . . . . . . . . . . .  343 M352 M391 397 400 403 407 410 413
       64   S32. . . . . . . . . . . . . .  343 M349 350 M351 M392 397 400 403 407 410 413
       65   S33. . . . . . . . . . . . . .  343 M346 M348 M393 397 400 403 407 410 413
       42   TEMP . . . . . . . . . . . . .  M361 M368 M371 M374 M377 M380 M389 M397 M400 M403 M406 M407 M410 M413 M423 M428
                                            M431 M434 M437 M440 M443 M446 M455 M462 M468 M471 M474 M477 M480 M489 M497 M501
                                            M505 M508 519 524 M528
       78   TEST-COMPUTED. . . . . . . . .  306
       93   TEST-CORRECT . . . . . . . . .  308
      146   TEST-ID. . . . . . . . . . . .  M211
       66   TEST-RESULTS . . . . . . . . .  M212 230
      124   TOTAL-ERROR
       40   WRK1 . . . . . . . . . . . . .  M341 342 344
      195   XXCOMPUTED . . . . . . . . . .  M315
      197   XXCORRECT. . . . . . . . . . .  M315
      190   XXINFO . . . . . . . . . . . .  302 317
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    15
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

      311   BAIL-OUT . . . . . . . . . . .  P233
      319   BAIL-OUT-EX. . . . . . . . . .  E233 G313
      314   BAIL-OUT-WRITE . . . . . . . .  G312
      295   BLANK-LINE-PRINT
      340   BUILD-TABLE. . . . . . . . . .  G347 G350 G353
      529   CCVS-EXIT. . . . . . . . . . .  G510
      530   CCVS-999999
      208   CCVS1
      320   CCVS1-EXIT . . . . . . . . . .  G214
      215   CLOSE-FILES. . . . . . . . . .  G531
      243   COLUMN-NAMES-ROUTINE . . . . .  E213
      224   DE-LETE. . . . . . . . . . . .  P384 P417 P450 P484 P512
      247   END-ROUTINE. . . . . . . . . .  P216
      251   END-ROUTINE-1
      260   END-ROUTINE-12
      268   END-ROUTINE-13 . . . . . . . .  E216
      249   END-RTN-EXIT
      223   FAIL . . . . . . . . . . . . .  P523
      297   FAIL-ROUTINE . . . . . . . . .  P232
      310   FAIL-ROUTINE-EX. . . . . . . .  E232 G304
      305   FAIL-ROUTINE-WRITE . . . . . .  G298 G299
      238   HEAD-ROUTINE . . . . . . . . .  P213
      345   INCRE-SUBS
      221   INSPT
      209   OPEN-FILES
      222   PASS . . . . . . . . . . . . .  P520
      226   PRINT-DETAIL . . . . . . . . .  P527
      336   SECT-NC245A-001
      354   SECT-TH219-0002. . . . . . . .  G344
      515   SECT-TH219-0003
      383   SEP-DELETE-008
      416   SEP-DELETE-009
      449   SEP-DELETE-010
      483   SEP-DELETE-011
      511   SEP-DELETE-012
      357   SEP-INIT-008
      386   SEP-INIT-009 . . . . . . . . .  G382
      420   SEP-INIT-010 . . . . . . . . .  G415
      453   SEP-INIT-011 . . . . . . . . .  G448
      487   SEP-INIT-012 . . . . . . . . .  G482
      367   SEP-TEST-008-01
      370   SEP-TEST-008-02
      373   SEP-TEST-008-03
      376   SEP-TEST-008-04
      379   SEP-TEST-008-05
      396   SEP-TEST-009-01
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    16
0 Defined   Cross-reference of procedures   References

0     399   SEP-TEST-009-02
      402   SEP-TEST-009-03
      405   SEP-TEST-009-04
      409   SEP-TEST-009-05
      412   SEP-TEST-009-06
      427   SEP-TEST-010-01
      430   SEP-TEST-010-02
      433   SEP-TEST-010-03
      436   SEP-TEST-010-04
      439   SEP-TEST-010-05
      442   SEP-TEST-010-06
      445   SEP-TEST-010-07
      459   SEP-TEST-011-01
      464   SEP-TEST-011-02
      470   SEP-TEST-011-03
      473   SEP-TEST-011-04
      476   SEP-TEST-011-05
      479   SEP-TEST-011-06
      494   SEP-TEST-012-01
      499   SEP-TEST-012-02
      503   SEP-TEST-012-03
      507   SEP-TEST-012-04
      219   TERMINATE-CALL
      217   TERMINATE-CCVS
      517   TEST-CHECK . . . . . . . . . .  P369 P372 P375 P378 P381 P398 P401 P404 P408 P411 P414 P429 P432 P435 P438 P441
                                            P444 P447 P463 P469 P472 P475 P478 P481 P498 P502 P506 P509
      522   TEST-FAIL
      526   TEST-WRITE . . . . . . . . . .  E369 E372 E375 E378 E381 P385 E398 E401 E404 E408 E411 E414 P418 E429 E432 E435
                                            E438 E441 E444 E447 P451 E463 E469 E472 E475 E478 E481 P485 E498 E502 E506 E509
                                            P513 G521
      280   WRITE-LINE . . . . . . . . . .  P230 P231 P239 P240 P241 P242 P244 P245 P246 P248 P250 P259 P267 P273 P278 P279
                                            P302 P306 P308 P317
      292   WRT-LN . . . . . . . . . . . .  P286 P287 P288 P291 P296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    17
0 Defined   Cross-reference of programs     References

        3   NC245A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC245A    Date 06/04/2022  Time 11:59:04   Page    18
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC245A:
 *    Source records = 531
 *    Data Division statements = 79
 *    Procedure Division statements = 254
 *    Generated COBOL statements = 0
 *    Program complexity factor = 263
0End of compilation 1,  program NC245A,  highest severity 0.
0Return code 0
