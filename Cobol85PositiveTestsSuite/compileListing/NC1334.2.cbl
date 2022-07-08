1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:53   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:53   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1334.2
   000002         000200 PROGRAM-ID.                                                      NC1334.2
   000003         000300     NC133A.                                                      NC1334.2
   000004         000500*                                                              *  NC1334.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1334.2
   000006         000700*                                                              *  NC1334.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1334.2
   000008         000900*                                                              *  NC1334.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1334.2
   000010         001100*                                                              *  NC1334.2
   000011         001300*                                                              *  NC1334.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1334.2
   000013         001500*                                                              *  NC1334.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1334.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1334.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1334.2
   000017         001900*                                                              *  NC1334.2
   000018         002100*                                                                 NC1334.2
   000019         002200*     PROGRAM NC133A TESTS THE USE OF FORMAT 1 OF THE SET         NC1334.2
   000020         002300*     STATEMENT USING VARIOUS INTEGERS, INDEX-NAMES AND           NC1334.2
   000021         002400*     IDENTIFIERS.                                                NC1334.2
   000022         002500*     REDEFINED SINGLE LEVEL TABLES ARE USED.                     NC1334.2
   000023         002600*                                                                 NC1334.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1334.2
   000025         002800 CONFIGURATION SECTION.                                           NC1334.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1334.2
   000027         003000     XXXXX082.                                                    NC1334.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1334.2
   000029         003200     XXXXX083.                                                    NC1334.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1334.2
   000031         003400 FILE-CONTROL.                                                    NC1334.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1334.2 36
   000033         003600     XXXXX055.                                                    NC1334.2
   000034         003700 DATA DIVISION.                                                   NC1334.2
   000035         003800 FILE SECTION.                                                    NC1334.2
   000036         003900 FD  PRINT-FILE.                                                  NC1334.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1334.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1334.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1334.2
   000040         004300 77  SGN-IDX                     PIC S9(18) VALUE ZERO.           NC1334.2 IMP
   000041         004400 77  UNSGN-IDX                   PIC 9(18)  VALUE ZERO.           NC1334.2 IMP
   000042         004500 77  USE-IDX                     USAGE INDEX.                     NC1334.2
   000043         004600 77  COMP-U-IDX18  PICTURE 9(18) COMPUTATIONAL VALUE ZERO.        NC1334.2 IMP
   000044         004700 77  COMP-S-IDX18 PICTURE S9(18) COMPUTATIONAL VALUE ZERO.        NC1334.2 IMP
   000045         004800 77  COMP-U-IDX1   PICTURE 9 COMPUTATIONAL VALUE ZERO.            NC1334.2 IMP
   000046         004900 77  COMP-S-IDX1  PICTURE S9 COMPUTATIONAL VALUE ZERO.            NC1334.2 IMP
   000047         005000 01   INDEX-VALUE  PIC 9999.                                      NC1334.2
   000048         005100 01  TABLE-A-VALUES PIC X(20) VALUE "11122233344415263748".       NC1334.2
   000049         005200 01  TABLE-A.                                                     NC1334.2
   000050         005300     02  ENTRY-A-1 PICTURE XXX OCCURS 4 TIMES INDEXED IDX-1.      NC1334.2
   000051         005400     02  ENTRY-A-2  OCCURS 4 TIMES INDEXED BY IDX-2.              NC1334.2
   000052         005500         03  ENTRY-A-3  PIC X.                                    NC1334.2
   000053         005600         03  ENTRY-A-4  PIC X.                                    NC1334.2
   000054         005700 01  TABLE-A1 REDEFINES TABLE-A.                                  NC1334.2 49
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02  ENTRY-A-5  PICTURE XXX OCCURS 4 TIMES.                   NC1334.2
   000056         005900     02  ENTRY-A-6 OCCURS 4 TIMES INDEXED BY IDX-X2.              NC1334.2
   000057         006000         03  ENTRY-A-7 PIC X.                                     NC1334.2
   000058         006100         03  ENTRY-A-8 PIC X.                                     NC1334.2
   000059         006200 01  TABLE-B.                                                     NC1334.2
   000060         006300     02  ENTRY-B-1  PIC X(4) VALUE "1234".                        NC1334.2
   000061         006400     02  ENTRY-B-2 REDEFINES ENTRY-B-1 PIC 9 OCCURS 4 INDEXED     NC1334.2 60
   000062         006500              BY  IDX-3.                                          NC1334.2
   000063         006600 01  TEST-RESULTS.                                                NC1334.2
   000064         006700     02 FILLER                   PIC X      VALUE SPACE.          NC1334.2 IMP
   000065         006800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1334.2 IMP
   000066         006900     02 FILLER                   PIC X      VALUE SPACE.          NC1334.2 IMP
   000067         007000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1334.2 IMP
   000068         007100     02 FILLER                   PIC X      VALUE SPACE.          NC1334.2 IMP
   000069         007200     02  PAR-NAME.                                                NC1334.2
   000070         007300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1334.2 IMP
   000071         007400       03  PARDOT-X              PIC X      VALUE SPACE.          NC1334.2 IMP
   000072         007500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1334.2 IMP
   000073         007600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1334.2 IMP
   000074         007700     02 RE-MARK                  PIC X(61).                       NC1334.2
   000075         007800 01  TEST-COMPUTED.                                               NC1334.2
   000076         007900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1334.2 IMP
   000077         008000     02 FILLER                   PIC X(17)  VALUE                 NC1334.2
   000078         008100            "       COMPUTED=".                                   NC1334.2
   000079         008200     02 COMPUTED-X.                                               NC1334.2
   000080         008300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1334.2 IMP
   000081         008400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1334.2 80
   000082         008500                                 PIC -9(9).9(9).                  NC1334.2
   000083         008600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1334.2 80
   000084         008700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1334.2 80
   000085         008800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1334.2 80
   000086         008900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1334.2 80
   000087         009000         04 COMPUTED-18V0                    PIC -9(18).          NC1334.2
   000088         009100         04 FILLER                           PIC X.               NC1334.2
   000089         009200     03 FILLER PIC X(50) VALUE SPACE.                             NC1334.2 IMP
   000090         009300 01  TEST-CORRECT.                                                NC1334.2
   000091         009400     02 FILLER PIC X(30) VALUE SPACE.                             NC1334.2 IMP
   000092         009500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1334.2
   000093         009600     02 CORRECT-X.                                                NC1334.2
   000094         009700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1334.2 IMP
   000095         009800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1334.2 94
   000096         009900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1334.2 94
   000097         010000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1334.2 94
   000098         010100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1334.2 94
   000099         010200     03      CR-18V0 REDEFINES CORRECT-A.                         NC1334.2 94
   000100         010300         04 CORRECT-18V0                     PIC -9(18).          NC1334.2
   000101         010400         04 FILLER                           PIC X.               NC1334.2
   000102         010500     03 FILLER PIC X(2) VALUE SPACE.                              NC1334.2 IMP
   000103         010600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1334.2 IMP
   000104         010700 01  CCVS-C-1.                                                    NC1334.2
   000105         010800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1334.2
   000106         010900-    "SS  PARAGRAPH-NAME                                          NC1334.2
   000107         011000-    "       REMARKS".                                            NC1334.2
   000108         011100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1334.2 IMP
   000109         011200 01  CCVS-C-2.                                                    NC1334.2
   000110         011300     02 FILLER                     PIC X        VALUE SPACE.      NC1334.2 IMP
   000111         011400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1334.2 IMP
   000113         011600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1334.2
   000114         011700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1334.2 IMP
   000115         011800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1334.2 IMP
   000116         011900 01  REC-CT                        PIC 99       VALUE ZERO.       NC1334.2 IMP
   000117         012000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1334.2 IMP
   000118         012100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1334.2 IMP
   000119         012200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1334.2 IMP
   000120         012300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1334.2 IMP
   000121         012400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1334.2 IMP
   000122         012500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1334.2 IMP
   000123         012600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1334.2 IMP
   000124         012700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1334.2 IMP
   000125         012800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1334.2 IMP
   000126         012900 01  CCVS-H-1.                                                    NC1334.2
   000127         013000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1334.2 IMP
   000128         013100     02  FILLER                    PIC X(42)    VALUE             NC1334.2
   000129         013200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1334.2
   000130         013300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1334.2 IMP
   000131         013400 01  CCVS-H-2A.                                                   NC1334.2
   000132         013500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1334.2 IMP
   000133         013600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1334.2
   000134         013700   02  FILLER                        PIC XXXX   VALUE             NC1334.2
   000135         013800     "4.2 ".                                                      NC1334.2
   000136         013900   02  FILLER                        PIC X(28)  VALUE             NC1334.2
   000137         014000            " COPY - NOT FOR DISTRIBUTION".                       NC1334.2
   000138         014100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1334.2 IMP
   000139         014200                                                                  NC1334.2
   000140         014300 01  CCVS-H-2B.                                                   NC1334.2
   000141         014400   02  FILLER                        PIC X(15)  VALUE             NC1334.2
   000142         014500            "TEST RESULT OF ".                                    NC1334.2
   000143         014600   02  TEST-ID                       PIC X(9).                    NC1334.2
   000144         014700   02  FILLER                        PIC X(4)   VALUE             NC1334.2
   000145         014800            " IN ".                                               NC1334.2
   000146         014900   02  FILLER                        PIC X(12)  VALUE             NC1334.2
   000147         015000     " HIGH       ".                                              NC1334.2
   000148         015100   02  FILLER                        PIC X(22)  VALUE             NC1334.2
   000149         015200            " LEVEL VALIDATION FOR ".                             NC1334.2
   000150         015300   02  FILLER                        PIC X(58)  VALUE             NC1334.2
   000151         015400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1334.2
   000152         015500 01  CCVS-H-3.                                                    NC1334.2
   000153         015600     02  FILLER                      PIC X(34)  VALUE             NC1334.2
   000154         015700            " FOR OFFICIAL USE ONLY    ".                         NC1334.2
   000155         015800     02  FILLER                      PIC X(58)  VALUE             NC1334.2
   000156         015900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1334.2
   000157         016000     02  FILLER                      PIC X(28)  VALUE             NC1334.2
   000158         016100            "  COPYRIGHT   1985 ".                                NC1334.2
   000159         016200 01  CCVS-E-1.                                                    NC1334.2
   000160         016300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1334.2 IMP
   000161         016400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1334.2
   000162         016500     02 ID-AGAIN                     PIC X(9).                    NC1334.2
   000163         016600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1334.2 IMP
   000164         016700 01  CCVS-E-2.                                                    NC1334.2
   000165         016800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1334.2 IMP
   000166         016900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1334.2 IMP
   000167         017000     02 CCVS-E-2-2.                                               NC1334.2
   000168         017100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1334.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200         03 FILLER                   PIC X      VALUE SPACE.      NC1334.2 IMP
   000170         017300         03 ENDER-DESC               PIC X(44)  VALUE             NC1334.2
   000171         017400            "ERRORS ENCOUNTERED".                                 NC1334.2
   000172         017500 01  CCVS-E-3.                                                    NC1334.2
   000173         017600     02  FILLER                      PIC X(22)  VALUE             NC1334.2
   000174         017700            " FOR OFFICIAL USE ONLY".                             NC1334.2
   000175         017800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1334.2 IMP
   000176         017900     02  FILLER                      PIC X(58)  VALUE             NC1334.2
   000177         018000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1334.2
   000178         018100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1334.2 IMP
   000179         018200     02 FILLER                       PIC X(15)  VALUE             NC1334.2
   000180         018300             " COPYRIGHT 1985".                                   NC1334.2
   000181         018400 01  CCVS-E-4.                                                    NC1334.2
   000182         018500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1334.2 IMP
   000183         018600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1334.2
   000184         018700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1334.2 IMP
   000185         018800     02 FILLER                       PIC X(40)  VALUE             NC1334.2
   000186         018900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1334.2
   000187         019000 01  XXINFO.                                                      NC1334.2
   000188         019100     02 FILLER                       PIC X(19)  VALUE             NC1334.2
   000189         019200            "*** INFORMATION ***".                                NC1334.2
   000190         019300     02 INFO-TEXT.                                                NC1334.2
   000191         019400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1334.2 IMP
   000192         019500       04 XXCOMPUTED                 PIC X(20).                   NC1334.2
   000193         019600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1334.2 IMP
   000194         019700       04 XXCORRECT                  PIC X(20).                   NC1334.2
   000195         019800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1334.2
   000196         019900 01  HYPHEN-LINE.                                                 NC1334.2
   000197         020000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1334.2 IMP
   000198         020100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1334.2
   000199         020200-    "*****************************************".                 NC1334.2
   000200         020300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1334.2
   000201         020400-    "******************************".                            NC1334.2
   000202         020500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1334.2
   000203         020600     "NC133A".                                                    NC1334.2
   000204         020700 PROCEDURE DIVISION.                                              NC1334.2
   000205         020800 CCVS1 SECTION.                                                   NC1334.2
   000206         020900 OPEN-FILES.                                                      NC1334.2
   000207         021000     OPEN     OUTPUT PRINT-FILE.                                  NC1334.2 36
   000208         021100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1334.2 202 143 202 162
   000209         021200     MOVE    SPACE TO TEST-RESULTS.                               NC1334.2 IMP 63
   000210         021300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1334.2 235 240
   000211         021400     GO TO CCVS1-EXIT.                                            NC1334.2 322
   000212         021500 CLOSE-FILES.                                                     NC1334.2
   000213         021600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1334.2 244 265 36
   000214         021700 TERMINATE-CCVS.                                                  NC1334.2
   000215         021800     EXIT PROGRAM.                                                NC1334.2
   000216         021900 TERMINATE-CALL.                                                  NC1334.2
   000217         022000     STOP     RUN.                                                NC1334.2
   000218         022100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1334.2 67 119
   000219         022200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1334.2 67 120
   000220         022300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1334.2 67 118
   000221         022400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1334.2 67 117
   000222         022500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1334.2 74
   000223         022600 PRINT-DETAIL.                                                    NC1334.2
   000224         022700     IF REC-CT NOT EQUAL TO ZERO                                  NC1334.2 116 IMP
   000225      1  022800             MOVE "." TO PARDOT-X                                 NC1334.2 71
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  022900             MOVE REC-CT TO DOTVALUE.                             NC1334.2 116 72
   000227         023000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1334.2 63 37 277
   000228         023100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1334.2 67 277
   000229      1  023200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1334.2 298 312
   000230      1  023300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1334.2 313 321
   000231         023400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1334.2 IMP 67 IMP 79
   000232         023500     MOVE SPACE TO CORRECT-X.                                     NC1334.2 IMP 93
   000233         023600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1334.2 116 IMP IMP 69
   000234         023700     MOVE     SPACE TO RE-MARK.                                   NC1334.2 IMP 74
   000235         023800 HEAD-ROUTINE.                                                    NC1334.2
   000236         023900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1334.2 126 38 277
   000237         024000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1334.2 131 38 277
   000238         024100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1334.2 140 38 277
   000239         024200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1334.2 152 38 277
   000240         024300 COLUMN-NAMES-ROUTINE.                                            NC1334.2
   000241         024400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1334.2 104 38 277
   000242         024500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1334.2 109 38 277
   000243         024600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1334.2 196 38 277
   000244         024700 END-ROUTINE.                                                     NC1334.2
   000245         024800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1334.2 196 38 277
   000246         024900 END-RTN-EXIT.                                                    NC1334.2
   000247         025000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1334.2 159 38 277
   000248         025100 END-ROUTINE-1.                                                   NC1334.2
   000249         025200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1334.2 118 122 119
   000250         025300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1334.2 122 117 122
   000251         025400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1334.2 120 122
   000252         025500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1334.2
   000253         025600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1334.2 120 182
   000254         025700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1334.2 122 184
   000255         025800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1334.2 181 167
   000256         025900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1334.2 164 38 277
   000257         026000  END-ROUTINE-12.                                                 NC1334.2
   000258         026100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1334.2 170
   000259         026200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1334.2 118 IMP
   000260      1  026300         MOVE "NO " TO ERROR-TOTAL                                NC1334.2 168
   000261         026400         ELSE                                                     NC1334.2
   000262      1  026500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1334.2 118 168
   000263         026600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1334.2 164 38
   000264         026700     PERFORM WRITE-LINE.                                          NC1334.2 277
   000265         026800 END-ROUTINE-13.                                                  NC1334.2
   000266         026900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1334.2 117 IMP
   000267      1  027000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1334.2 168
   000268      1  027100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1334.2 117 168
   000269         027200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1334.2 170
   000270         027300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1334.2 164 38 277
   000271         027400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1334.2 119 IMP
   000272      1  027500          MOVE "NO " TO ERROR-TOTAL                               NC1334.2 168
   000273      1  027600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1334.2 119 168
   000274         027700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1334.2 170
   000275         027800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1334.2 164 38 277
   000276         027900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1334.2 172 38 277
   000277         028000 WRITE-LINE.                                                      NC1334.2
   000278         028100     ADD 1 TO RECORD-COUNT.                                       NC1334.2 124
   000279         028200     IF RECORD-COUNT GREATER 42                                   NC1334.2 124
   000280      1  028300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1334.2 38 123
   000281      1  028400         MOVE SPACE TO DUMMY-RECORD                               NC1334.2 IMP 38
   000282      1  028500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1334.2 38
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1334.2 126 38 293
   000284      1  028700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1334.2 131 38 293
   000285      1  028800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1334.2 140 38 293
   000286      1  028900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1334.2 152 38 293
   000287      1  029000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1334.2 104 38 293
   000288      1  029100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1334.2 109 38 293
   000289      1  029200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1334.2 196 38 293
   000290      1  029300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1334.2 123 38
   000291      1  029400         MOVE ZERO TO RECORD-COUNT.                               NC1334.2 IMP 124
   000292         029500     PERFORM WRT-LN.                                              NC1334.2 293
   000293         029600 WRT-LN.                                                          NC1334.2
   000294         029700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1334.2 38
   000295         029800     MOVE SPACE TO DUMMY-RECORD.                                  NC1334.2 IMP 38
   000296         029900 BLANK-LINE-PRINT.                                                NC1334.2
   000297         030000     PERFORM WRT-LN.                                              NC1334.2 293
   000298         030100 FAIL-ROUTINE.                                                    NC1334.2
   000299         030200     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1334.2 79 IMP
   000300      1  030300            GO TO FAIL-ROUTINE-WRITE.                             NC1334.2 307
   000301         030400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1334.2 93 IMP 307
   000302         030500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1334.2 125 195
   000303         030600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1334.2 190
   000304         030700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1334.2 187 38 277
   000305         030800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1334.2 IMP 195
   000306         030900     GO TO  FAIL-ROUTINE-EX.                                      NC1334.2 312
   000307         031000 FAIL-ROUTINE-WRITE.                                              NC1334.2
   000308         031100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1334.2 75 37 277
   000309         031200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1334.2 125 103
   000310         031300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1334.2 90 37 277
   000311         031400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1334.2 IMP 103
   000312         031500 FAIL-ROUTINE-EX. EXIT.                                           NC1334.2
   000313         031600 BAIL-OUT.                                                        NC1334.2
   000314         031700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1334.2 80 IMP 316
   000315         031800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1334.2 94 IMP 321
   000316         031900 BAIL-OUT-WRITE.                                                  NC1334.2
   000317         032000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1334.2 94 194 80 192
   000318         032100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1334.2 125 195
   000319         032200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1334.2 187 38 277
   000320         032300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1334.2 IMP 195
   000321         032400 BAIL-OUT-EX. EXIT.                                               NC1334.2
   000322         032500 CCVS1-EXIT.                                                      NC1334.2
   000323         032600     EXIT.                                                        NC1334.2
   000324         032700 SECT-TH133A-001 SECTION.                                         NC1334.2
   000325         032800 TH-04-001.                                                       NC1334.2
   000326         032900 IDX-INIT-A.                                                      NC1334.2

 ==000326==> IGYPS2015-I The paragraph or section prior to paragraph or section "IDX-INIT-A" did
                         not contain any statements.

   000327         033000     MOVE "INDEXING " TO FEATURE.                                 NC1334.2 65
   000328         033100     MOVE TABLE-A-VALUES TO TABLE-A.                              NC1334.2 48 49
   000329         033200     IF TABLE-A EQUAL TO TABLE-A-VALUES                           NC1334.2 49 48
   000330      1  033300         PERFORM PASS                                             NC1334.2 219
   000331      1  033400         MOVE "TABLE CREATED CORRECTLY" TO RE-MARK                NC1334.2 74
   000332      1  033500         GO TO INIT-WRITE.                                        NC1334.2 337
   000333         033600     MOVE "TABLE CREATED INCORRECTLY" TO RE-MARK.                 NC1334.2 74
   000334         033700     PERFORM FAIL.                                                NC1334.2 220
   000335         033800     PERFORM INIT-WRITE.                                          NC1334.2 337
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000336         033900     GO TO   CCVS-EXIT.                                           NC1334.2 708
   000337         034000 INIT-WRITE.                                                      NC1334.2
   000338         034100     MOVE     "TABLE BUILD" TO PAR-NAME.                          NC1334.2 69
   000339         034200     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000340         034300 IDX-TEST-1.                                                      NC1334.2
   000341         034400     SET IDX-1 TO 3.                                              NC1334.2 50
   000342         034500     IF ENTRY-A-1 (IDX-1) EQUAL TO "333"                          NC1334.2 50 50
   000343      1  034600         PERFORM PASS                                             NC1334.2 219
   000344      1  034700         GO TO IDX-WRITE-1.                                       NC1334.2 351
   000345         034800     MOVE ENTRY-A-1 (IDX-1) TO COMPUTED-A.                        NC1334.2 50 50 80
   000346         034900     MOVE "333" TO CORRECT-A.                                     NC1334.2 94
   000347         035000     PERFORM FAIL.                                                NC1334.2 220
   000348         035100     GO TO IDX-WRITE-1.                                           NC1334.2 351
   000349         035200 IDX-DELETE-1.                                                    NC1334.2
   000350         035300     PERFORM DE-LETE.                                             NC1334.2 221
   000351         035400 IDX-WRITE-1.                                                     NC1334.2
   000352         035500     MOVE "IDX-TEST-1 " TO PAR-NAME.                              NC1334.2 69
   000353         035600     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000354         035700 IDX-TEST-2.                                                      NC1334.2
   000355         035800     SET IDX-1 TO 2.                                              NC1334.2 50
   000356         035900     IF ENTRY-A-1 (IDX-1) EQUAL TO "222"                          NC1334.2 50 50
   000357      1  036000         PERFORM PASS                                             NC1334.2 219
   000358      1  036100         GO TO IDX-WRITE-2.                                       NC1334.2 365
   000359         036200     MOVE 222 TO CORRECT-A.                                       NC1334.2 94
   000360         036300     MOVE ENTRY-A-1 (IDX-1) TO COMPUTED-A.                        NC1334.2 50 50 80
   000361         036400     PERFORM FAIL.                                                NC1334.2 220
   000362         036500     GO TO IDX-WRITE-2.                                           NC1334.2 365
   000363         036600 IDX-DELETE-2.                                                    NC1334.2
   000364         036700     PERFORM DE-LETE.                                             NC1334.2 221
   000365         036800 IDX-WRITE-2.                                                     NC1334.2
   000366         036900     MOVE "IDX-TEST-2" TO PAR-NAME.                               NC1334.2 69
   000367         037000     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000368         037100 IDX-TEST-3.                                                      NC1334.2
   000369         037200     SET IDX-1 TO 000001.                                         NC1334.2 50
   000370         037300     IF ENTRY-A-1 (IDX-1) EQUAL TO "111"                          NC1334.2 50 50
   000371      1  037400         PERFORM PASS                                             NC1334.2 219
   000372      1  037500         GO TO IDX-WRITE-3.                                       NC1334.2 379
   000373         037600     MOVE ENTRY-A-1 (IDX-1) TO COMPUTED-A.                        NC1334.2 50 50 80
   000374         037700     MOVE 111 TO CORRECT-A.                                       NC1334.2 94
   000375         037800     PERFORM FAIL.                                                NC1334.2 220
   000376         037900     GO TO IDX-WRITE-3.                                           NC1334.2 379
   000377         038000 IDX-DELETE-3.                                                    NC1334.2
   000378         038100     PERFORM DE-LETE.                                             NC1334.2 221
   000379         038200 IDX-WRITE-3.                                                     NC1334.2
   000380         038300     MOVE "IDX-TEST-3" TO PAR-NAME.                               NC1334.2 69
   000381         038400     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000382         038500 IDX-TEST-4.                                                      NC1334.2
   000383         038600     SET IDX-1 TO 000000000000000004.                             NC1334.2 50
   000384         038700     IF ENTRY-A-1 (IDX-1) EQUAL TO "444"                          NC1334.2 50 50
   000385      1  038800         PERFORM PASS                                             NC1334.2 219
   000386      1  038900         GO TO IDX-WRITE-4.                                       NC1334.2 393
   000387         039000     MOVE ENTRY-A-1 (IDX-1) TO COMPUTED-A.                        NC1334.2 50 50 80
   000388         039100     MOVE 444 TO CORRECT-A.                                       NC1334.2 94
   000389         039200     PERFORM FAIL.                                                NC1334.2 220
   000390         039300     GO TO IDX-WRITE-4.                                           NC1334.2 393
   000391         039400 IDX-DELETE-4.                                                    NC1334.2
   000392         039500     PERFORM DE-LETE.                                             NC1334.2 221
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039600 IDX-WRITE-4.                                                     NC1334.2
   000394         039700     MOVE "IDX-TEST-4" TO PAR-NAME.                               NC1334.2 69
   000395         039800     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000396         039900 IDX-TEST-5.                                                      NC1334.2
   000397         040000     MOVE 3 TO SGN-IDX.                                           NC1334.2 40
   000398         040100     SET IDX-2 TO SGN-IDX.                                        NC1334.2 51 40
   000399         040200     IF ENTRY-A-4 (IDX-2) EQUAL TO "7"                            NC1334.2 53 51
   000400      1  040300         PERFORM PASS                                             NC1334.2 219
   000401      1  040400         GO TO IDX-WRITE-5.                                       NC1334.2 408
   000402         040500     MOVE ENTRY-A-4 (IDX-2) TO COMPUTED-A.                        NC1334.2 53 51 80
   000403         040600     MOVE 7 TO CORRECT-A.                                         NC1334.2 94
   000404         040700     PERFORM FAIL.                                                NC1334.2 220
   000405         040800     GO TO IDX-WRITE-5.                                           NC1334.2 408
   000406         040900 IDX-DELETE-5.                                                    NC1334.2
   000407         041000     PERFORM DE-LETE.                                             NC1334.2 221
   000408         041100 IDX-WRITE-5.                                                     NC1334.2
   000409         041200     MOVE "IDX-TEST-5" TO PAR-NAME.                               NC1334.2 69
   000410         041300     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000411         041400     MOVE "SET STATEMENT" TO FEATURE.                             NC1334.2 65
   000412         041500 IDX-TEST-6.                                                      NC1334.2
   000413         041600     MOVE 1 TO UNSGN-IDX.                                         NC1334.2 41
   000414         041700     SET IDX-2 TO UNSGN-IDX.                                      NC1334.2 51 41
   000415         041800     IF ENTRY-A-2 (IDX-2) EQUAL TO "15"                           NC1334.2 51 51
   000416      1  041900         PERFORM PASS                                             NC1334.2 219
   000417      1  042000         GO TO IDX-WRITE-6.                                       NC1334.2 424
   000418         042100     MOVE ENTRY-A-2 (IDX-2) TO COMPUTED-A.                        NC1334.2 51 51 80
   000419         042200     MOVE 15 TO CORRECT-A.                                        NC1334.2 94
   000420         042300     PERFORM FAIL.                                                NC1334.2 220
   000421         042400     GO TO IDX-WRITE-6.                                           NC1334.2 424
   000422         042500 IDX-DELETE-6.                                                    NC1334.2
   000423         042600     PERFORM DE-LETE.                                             NC1334.2 221
   000424         042700 IDX-WRITE-6.                                                     NC1334.2
   000425         042800     MOVE "IDX-TEST-6" TO PAR-NAME.                               NC1334.2 69
   000426         042900     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000427         043000 IDX-TEST-7.                                                      NC1334.2
   000428         043100     SET IDX-1 TO 4.                                              NC1334.2 50
   000429         043200     SET IDX-2 TO IDX-1.                                          NC1334.2 51 50
   000430         043300     IF IDX-2 EQUAL TO 4                                          NC1334.2 51
   000431      1  043400         PERFORM PASS                                             NC1334.2 219
   000432      1  043500         GO TO IDX-WRITE-7.                                       NC1334.2 440
   000433         043600     MOVE 4 TO CORRECT-A.                                         NC1334.2 94
   000434         043700     SET      INDEX-VALUE TO IDX-2.                               NC1334.2 47 51
   000435         043800     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       NC1334.2 47 87
   000436         043900     PERFORM FAIL.                                                NC1334.2 220
   000437         044000     GO TO IDX-WRITE-7.                                           NC1334.2 440
   000438         044100 IDX-DELETE-7.                                                    NC1334.2
   000439         044200     PERFORM DE-LETE.                                             NC1334.2 221
   000440         044300 IDX-WRITE-7.                                                     NC1334.2
   000441         044400     MOVE "IDX-TEST-7" TO PAR-NAME.                               NC1334.2 69
   000442         044500     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000443         044600 IDX-TEST-8.                                                      NC1334.2
   000444         044700     SET IDX-1 TO 4.                                              NC1334.2 50
   000445         044800     SET IDX-2 TO IDX-1.                                          NC1334.2 51 50
   000446         044900     IF ENTRY-A-4 (IDX-2) EQUAL TO "8"                            NC1334.2 53 51
   000447      1  045000         PERFORM PASS                                             NC1334.2 219
   000448      1  045100         GO TO IDX-WRITE-8.                                       NC1334.2 455
   000449         045200     MOVE 8 TO CORRECT-A.                                         NC1334.2 94
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045300     MOVE     ENTRY-A-4 (IDX-2) TO COMPUTED-A.                    NC1334.2 53 51 80
   000451         045400     PERFORM FAIL.                                                NC1334.2 220
   000452         045500     GO TO IDX-WRITE-8.                                           NC1334.2 455
   000453         045600 IDX-DELETE-8.                                                    NC1334.2
   000454         045700     PERFORM DE-LETE.                                             NC1334.2 221
   000455         045800 IDX-WRITE-8.                                                     NC1334.2
   000456         045900     MOVE "IDX-TEST-8" TO PAR-NAME.                               NC1334.2 69
   000457         046000     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000458         046100 IDX-TEST-9.                                                      NC1334.2
   000459         046200     SET IDX-X2 TO 02.                                            NC1334.2 56
   000460         046300     SET USE-IDX TO IDX-X2.                                       NC1334.2 42 56
   000461         046400     SET IDX-2 TO USE-IDX.                                        NC1334.2 51 42
   000462         046500     IF IDX-2 EQUAL TO 2                                          NC1334.2 51
   000463      1  046600         PERFORM PASS                                             NC1334.2 219
   000464      1  046700         GO TO IDX-WRITE-9.                                       NC1334.2 472
   000465         046800     MOVE 2 TO CORRECT-A.                                         NC1334.2 94
   000466         046900     SET      INDEX-VALUE TO IDX-2.                               NC1334.2 47 51
   000467         047000     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       NC1334.2 47 87
   000468         047100     PERFORM FAIL.                                                NC1334.2 220
   000469         047200     GO TO IDX-WRITE-9.                                           NC1334.2 472
   000470         047300 IDX-DELETE-9.                                                    NC1334.2
   000471         047400     PERFORM DE-LETE.                                             NC1334.2 221
   000472         047500 IDX-WRITE-9.                                                     NC1334.2
   000473         047600     MOVE "IDX-TEST-9" TO PAR-NAME.                               NC1334.2 69
   000474         047700     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000475         047800 IDX-TEST-10.                                                     NC1334.2
   000476         047900     SET IDX-2 TO 4.                                              NC1334.2 51
   000477         048000     SET USE-IDX TO IDX-2.                                        NC1334.2 42 51
   000478         048100     SET IDX-X2 TO USE-IDX.                                       NC1334.2 56 42
   000479         048200     IF ENTRY-A-8 (IDX-X2) EQUAL TO ENTRY-A-4 (IDX-2)             NC1334.2 58 56 53 51
   000480      1  048300         PERFORM PASS                                             NC1334.2 219
   000481      1  048400         GO TO IDX-WRITE-10.                                      NC1334.2 489
   000482         048500     MOVE ENTRY-A-4 (IDX-2) TO COMPUTED-A.                        NC1334.2 53 51 80
   000483         048600     MOVE ENTRY-A-8 (IDX-X2) TO CORRECT-A.                        NC1334.2 58 56 94
   000484         048700     MOVE "TABLE ENTRIES SHOULD BE EQUAL" TO RE-MARK.             NC1334.2 74
   000485         048800     PERFORM FAIL.                                                NC1334.2 220
   000486         048900     GO TO IDX-WRITE-10.                                          NC1334.2 489
   000487         049000 IDX-DELETE-10.                                                   NC1334.2
   000488         049100     PERFORM DE-LETE.                                             NC1334.2 221
   000489         049200 IDX-WRITE-10.                                                    NC1334.2
   000490         049300     MOVE "IDX-TEST-10" TO PAR-NAME.                              NC1334.2 69
   000491         049400     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000492         049500 IDX-TEST-11.                                                     NC1334.2
   000493         049600     SET IDX-3 TO 0004.                                           NC1334.2 62
   000494         049700     IF ENTRY-B-2 (IDX-3) EQUAL TO 4                              NC1334.2 61 62
   000495      1  049800         PERFORM PASS                                             NC1334.2 219
   000496      1  049900         GO TO IDX-WRITE-11.                                      NC1334.2 503
   000497         050000     MOVE ENTRY-B-2 (IDX-3) TO COMPUTED-A.                        NC1334.2 61 62 80
   000498         050100     MOVE 4 TO CORRECT-A.                                         NC1334.2 94
   000499         050200     PERFORM FAIL.                                                NC1334.2 220
   000500         050300     GO TO IDX-WRITE-11.                                          NC1334.2 503
   000501         050400 IDX-DELETE-11.                                                   NC1334.2
   000502         050500     PERFORM DE-LETE.                                             NC1334.2 221
   000503         050600 IDX-WRITE-11.                                                    NC1334.2
   000504         050700     MOVE "IDX-TEST-11" TO PAR-NAME.                              NC1334.2 69
   000505         050800     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000506         050900 IDX-TEST-12.                                                     NC1334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051000     SET IDX-3 TO 0000002.                                        NC1334.2 62
   000508         051100     IF ENTRY-B-2 (IDX-3) EQUAL TO 2                              NC1334.2 61 62
   000509      1  051200         PERFORM PASS                                             NC1334.2 219
   000510      1  051300         GO TO IDX-WRITE-12.                                      NC1334.2 517
   000511         051400     MOVE ENTRY-B-2 (IDX-3) TO COMPUTED-A.                        NC1334.2 61 62 80
   000512         051500     MOVE 2 TO CORRECT-A.                                         NC1334.2 94
   000513         051600     PERFORM FAIL.                                                NC1334.2 220
   000514         051700     GO TO IDX-WRITE-12.                                          NC1334.2 517
   000515         051800 IDX-DELETE-12.                                                   NC1334.2
   000516         051900     PERFORM DE-LETE.                                             NC1334.2 221
   000517         052000 IDX-WRITE-12.                                                    NC1334.2
   000518         052100     MOVE "IDX-TEST-12" TO PAR-NAME.                              NC1334.2 69
   000519         052200     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000520         052300 IDX-TEST-13.                                                     NC1334.2
   000521         052400     SET IDX-3 TO 000000000000000003.                             NC1334.2 62
   000522         052500     IF ENTRY-B-2 (IDX-3) EQUAL TO 3                              NC1334.2 61 62
   000523      1  052600         PERFORM PASS                                             NC1334.2 219
   000524      1  052700         GO TO IDX-WRITE-13.                                      NC1334.2 531
   000525         052800     MOVE ENTRY-B-2 (IDX-3) TO COMPUTED-A.                        NC1334.2 61 62 80
   000526         052900     MOVE 3 TO CORRECT-A.                                         NC1334.2 94
   000527         053000     PERFORM FAIL.                                                NC1334.2 220
   000528         053100     GO TO IDX-WRITE-13.                                          NC1334.2 531
   000529         053200 IDX-DELETE-13.                                                   NC1334.2
   000530         053300     PERFORM DE-LETE.                                             NC1334.2 221
   000531         053400 IDX-WRITE-13.                                                    NC1334.2
   000532         053500     MOVE "IDX-TEST-13" TO PAR-NAME.                              NC1334.2 69
   000533         053600     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000534         053700 IDX-TEST-14.                                                     NC1334.2
   000535         053800     SET IDX-3 TO 000000000000000004.                             NC1334.2 62
   000536         053900     IF ENTRY-B-2 (IDX-3) EQUAL TO 4                              NC1334.2 61 62
   000537      1  054000         PERFORM PASS                                             NC1334.2 219
   000538      1  054100         GO TO IDX-WRITE-14.                                      NC1334.2 545
   000539         054200     MOVE ENTRY-B-2 (IDX-3) TO COMPUTED-A.                        NC1334.2 61 62 80
   000540         054300     MOVE 4 TO CORRECT-A.                                         NC1334.2 94
   000541         054400     PERFORM FAIL.                                                NC1334.2 220
   000542         054500     GO TO IDX-WRITE-14.                                          NC1334.2 545
   000543         054600 IDX-DELETE-14.                                                   NC1334.2
   000544         054700     PERFORM DE-LETE.                                             NC1334.2 221
   000545         054800 IDX-WRITE-14.                                                    NC1334.2
   000546         054900     MOVE "IDX-TEST-14" TO PAR-NAME.                              NC1334.2 69
   000547         055000     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000548         055100 IDX-TEST-15.                                                     NC1334.2
   000549         055200     SET IDX-3 TO 000000000000000002.                             NC1334.2 62
   000550         055300     IF ENTRY-B-2 (IDX-3) EQUAL TO 2                              NC1334.2 61 62
   000551      1  055400         PERFORM PASS                                             NC1334.2 219
   000552      1  055500         GO TO IDX-WRITE-15.                                      NC1334.2 559
   000553         055600     MOVE ENTRY-B-2 (IDX-3) TO COMPUTED-A.                        NC1334.2 61 62 80
   000554         055700     MOVE 2 TO CORRECT-A.                                         NC1334.2 94
   000555         055800     PERFORM FAIL.                                                NC1334.2 220
   000556         055900     GO TO IDX-WRITE-15.                                          NC1334.2 559
   000557         056000 IDX-DELETE-15.                                                   NC1334.2
   000558         056100     PERFORM DE-LETE.                                             NC1334.2 221
   000559         056200 IDX-WRITE-15.                                                    NC1334.2
   000560         056300     MOVE "IDX-TEST-15" TO PAR-NAME.                              NC1334.2 69
   000561         056400     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000562         056500 IDX-TEST-16.                                                     NC1334.2
   000563         056600     SET IDX-3 TO 03.                                             NC1334.2 62
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056700     SET IDX-2 TO 03.                                             NC1334.2 51
   000565         056800     IF ENTRY-A-3 (IDX-2) EQUAL TO ENTRY-B-2 (IDX-3)              NC1334.2 52 51 61 62
   000566      1  056900         PERFORM PASS                                             NC1334.2 219
   000567      1  057000         GO TO IDX-WRITE-16.                                      NC1334.2 575
   000568         057100     MOVE ENTRY-A-3 (IDX-2) TO COMPUTED-A.                        NC1334.2 52 51 80
   000569         057200     MOVE ENTRY-B-2 (IDX-3) TO CORRECT-A.                         NC1334.2 61 62 94
   000570         057300     MOVE "TABLE ENTRIES SHOULD BE EQUAL" TO RE-MARK.             NC1334.2 74
   000571         057400     PERFORM FAIL.                                                NC1334.2 220
   000572         057500     GO TO IDX-WRITE-16.                                          NC1334.2 575
   000573         057600 IDX-DELETE-16.                                                   NC1334.2
   000574         057700     PERFORM DE-LETE.                                             NC1334.2 221
   000575         057800 IDX-WRITE-16.                                                    NC1334.2
   000576         057900     MOVE "IDX-TEST-16" TO PAR-NAME.                              NC1334.2 69
   000577         058000     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000578         058100 IDX-TEST-17.                                                     NC1334.2
   000579         058200     MOVE 3 TO COMP-U-IDX18.                                      NC1334.2 43
   000580         058300     SET IDX-1 TO COMP-U-IDX18.                                   NC1334.2 50 43
   000581         058400     IF ENTRY-A-1 (IDX-1) EQUAL TO "333"                          NC1334.2 50 50
   000582      1  058500         PERFORM PASS                                             NC1334.2 219
   000583      1  058600         GO TO IDX-WRITE-17.                                      NC1334.2 590
   000584         058700     MOVE "333" TO CORRECT-A.                                     NC1334.2 94
   000585         058800     MOVE ENTRY-A-1 (IDX-1) TO COMPUTED-A.                        NC1334.2 50 50 80
   000586         058900     PERFORM FAIL.                                                NC1334.2 220
   000587         059000     GO TO IDX-WRITE-17.                                          NC1334.2 590
   000588         059100 IDX-DELETE-17.                                                   NC1334.2
   000589         059200     PERFORM DE-LETE.                                             NC1334.2 221
   000590         059300 IDX-WRITE-17.                                                    NC1334.2
   000591         059400     MOVE "IDX-TEST-17" TO PAR-NAME.                              NC1334.2 69
   000592         059500     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000593         059600 IDX-TEST-18.                                                     NC1334.2
   000594         059700     MOVE 4 TO COMP-S-IDX18.                                      NC1334.2 44
   000595         059800     SET IDX-2 TO COMP-S-IDX18.                                   NC1334.2 51 44
   000596         059900     IF ENTRY-A-2 (IDX-2) EQUAL TO "48"                           NC1334.2 51 51
   000597      1  060000         PERFORM PASS                                             NC1334.2 219
   000598      1  060100         GO TO IDX-WRITE-18.                                      NC1334.2 605
   000599         060200     MOVE "48" TO CORRECT-A.                                      NC1334.2 94
   000600         060300     MOVE ENTRY-A-2 (IDX-2) TO COMPUTED-A.                        NC1334.2 51 51 80
   000601         060400     PERFORM FAIL.                                                NC1334.2 220
   000602         060500     GO TO IDX-WRITE-18.                                          NC1334.2 605
   000603         060600 IDX-DELETE-18.                                                   NC1334.2
   000604         060700     PERFORM DE-LETE.                                             NC1334.2 221
   000605         060800 IDX-WRITE-18.                                                    NC1334.2
   000606         060900     MOVE "IDX-TEST-18" TO PAR-NAME.                              NC1334.2 69
   000607         061000     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000608         061100 IDX-TEST-19.                                                     NC1334.2
   000609         061200     MOVE 1 TO COMP-U-IDX1.                                       NC1334.2 45
   000610         061300     SET IDX-3 TO COMP-U-IDX1.                                    NC1334.2 62 45
   000611         061400     IF ENTRY-B-2 (IDX-3) EQUAL TO 1                              NC1334.2 61 62
   000612      1  061500         PERFORM PASS                                             NC1334.2 219
   000613      1  061600         GO TO IDX-WRITE-19.                                      NC1334.2 620
   000614         061700     MOVE "1" TO CORRECT-A.                                       NC1334.2 94
   000615         061800     MOVE ENTRY-B-2 (IDX-3) TO COMPUTED-A.                        NC1334.2 61 62 80
   000616         061900     PERFORM FAIL.                                                NC1334.2 220
   000617         062000     GO TO IDX-WRITE-19.                                          NC1334.2 620
   000618         062100 IDX-DELETE-19.                                                   NC1334.2
   000619         062200     PERFORM DE-LETE.                                             NC1334.2 221
   000620         062300 IDX-WRITE-19.                                                    NC1334.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621         062400     MOVE "IDX-TEST-19" TO PAR-NAME.                              NC1334.2 69
   000622         062500     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000623         062600 IDX-TEST-20.                                                     NC1334.2
   000624         062700     MOVE 2 TO COMP-S-IDX1.                                       NC1334.2 46
   000625         062800     SET IDX-2 TO COMP-S-IDX1.                                    NC1334.2 51 46
   000626         062900     IF ENTRY-A-3 (IDX-2) EQUAL TO "2"                            NC1334.2 52 51
   000627      1  063000         PERFORM PASS                                             NC1334.2 219
   000628      1  063100         GO TO IDX-WRITE-20.                                      NC1334.2 635
   000629         063200     MOVE "2" TO CORRECT-A.                                       NC1334.2 94
   000630         063300     MOVE ENTRY-A-3 (IDX-2) TO COMPUTED-A.                        NC1334.2 52 51 80
   000631         063400     PERFORM FAIL.                                                NC1334.2 220
   000632         063500     GO TO IDX-WRITE-20.                                          NC1334.2 635
   000633         063600 IDX-DELETE-20.                                                   NC1334.2
   000634         063700     PERFORM DE-LETE.                                             NC1334.2 221
   000635         063800 IDX-WRITE-20.                                                    NC1334.2
   000636         063900     MOVE "IDX-TEST-20" TO PAR-NAME.                              NC1334.2 69
   000637         064000     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000638         064100 IDX-TEST-21.                                                     NC1334.2
   000639         064200     SET IDX-1 TO 3.                                              NC1334.2 50
   000640         064300     SET COMP-S-IDX18 TO IDX-1.                                   NC1334.2 44 50
   000641         064400     IF COMP-S-IDX18 EQUAL TO +3                                  NC1334.2 44
   000642      1  064500         PERFORM PASS                                             NC1334.2 219
   000643      1  064600         GO TO IDX-WRITE-21.                                      NC1334.2 650
   000644         064700     MOVE +3 TO CORRECT-N.                                        NC1334.2 95
   000645         064800     MOVE COMP-S-IDX18 TO COMPUTED-N.                             NC1334.2 44 81
   000646         064900     PERFORM FAIL.                                                NC1334.2 220
   000647         065000     GO TO IDX-WRITE-21.                                          NC1334.2 650
   000648         065100 IDX-DELETE-21.                                                   NC1334.2
   000649         065200     PERFORM DE-LETE.                                             NC1334.2 221
   000650         065300 IDX-WRITE-21.                                                    NC1334.2
   000651         065400     MOVE "IDX-TEST-21" TO PAR-NAME.                              NC1334.2 69
   000652         065500     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000653         065600 IDX-TEST-22.                                                     NC1334.2
   000654         065700     SET IDX-2 TO 2.                                              NC1334.2 51
   000655         065800     SET COMP-U-IDX1 TO IDX-2.                                    NC1334.2 45 51
   000656         065900     IF COMP-U-IDX1 EQUAL TO 2                                    NC1334.2 45
   000657      1  066000         PERFORM PASS                                             NC1334.2 219
   000658      1  066100         GO TO IDX-WRITE-22.                                      NC1334.2 665
   000659         066200     MOVE COMP-U-IDX1 TO COMPUTED-N.                              NC1334.2 45 81
   000660         066300     MOVE 2 TO CORRECT-N.                                         NC1334.2 95
   000661         066400     PERFORM FAIL.                                                NC1334.2 220
   000662         066500     GO TO IDX-WRITE-22.                                          NC1334.2 665
   000663         066600 IDX-DELETE-22.                                                   NC1334.2
   000664         066700     PERFORM DE-LETE.                                             NC1334.2 221
   000665         066800 IDX-WRITE-22.                                                    NC1334.2
   000666         066900     MOVE "IDX-TEST-22" TO PAR-NAME.                              NC1334.2 69
   000667         067000     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000668         067100 IDX-TEST-23.                                                     NC1334.2
   000669         067200     MOVE 4 TO COMP-S-IDX18.                                      NC1334.2 44
   000670         067300     SET IDX-2 TO COMP-S-IDX18.                                   NC1334.2 51 44
   000671         067400     IF COMP-S-IDX18 EQUAL TO IDX-2                               NC1334.2 44 51
   000672      1  067500         PERFORM PASS                                             NC1334.2 219
   000673      1  067600         GO TO IDX-WRITE-23.                                      NC1334.2 682
   000674         067700     SET      INDEX-VALUE TO IDX-2.                               NC1334.2 47 51
   000675         067800     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       NC1334.2 47 87
   000676         067900     MOVE    COMP-S-IDX18 TO CORRECT-18V0.                        NC1334.2 44 100
   000677         068000     MOVE "INDEX VALUES SHOULD BE EQUAL" TO RE-MARK.              NC1334.2 74
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678         068100     PERFORM FAIL.                                                NC1334.2 220
   000679         068200     GO TO IDX-WRITE-23.                                          NC1334.2 682
   000680         068300 IDX-DELETE-23.                                                   NC1334.2
   000681         068400     PERFORM DE-LETE.                                             NC1334.2 221
   000682         068500 IDX-WRITE-23.                                                    NC1334.2
   000683         068600     MOVE "IDX-TEST-23" TO PAR-NAME.                              NC1334.2 69
   000684         068700     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000685         068800 IDX-TEST-24.                                                     NC1334.2
   000686         068900     MOVE 2 TO COMP-U-IDX1.                                       NC1334.2 45
   000687         069000     SET IDX-3 TO COMP-U-IDX1.                                    NC1334.2 62 45
   000688         069100     IF IDX-3 EQUAL TO COMP-U-IDX1                                NC1334.2 62 45
   000689      1  069200         PERFORM PASS                                             NC1334.2 219
   000690      1  069300         GO TO IDX-WRITE-24.                                      NC1334.2 699
   000691         069400     MOVE     COMP-U-IDX1 TO CORRECT-18V0.                        NC1334.2 45 100
   000692         069500     SET      INDEX-VALUE TO IDX-3.                               NC1334.2 47 62
   000693         069600     MOVE     INDEX-VALUE TO COMPUTED-18V0.                       NC1334.2 47 87
   000694         069700     MOVE "INDEX VALUES SHOULD BE EQUAL" TO RE-MARK.              NC1334.2 74
   000695         069800     PERFORM FAIL.                                                NC1334.2 220
   000696         069900     GO TO IDX-WRITE-24.                                          NC1334.2 699
   000697         070000 IDX-DELETE-24.                                                   NC1334.2
   000698         070100     PERFORM DE-LETE.                                             NC1334.2 221
   000699         070200 IDX-WRITE-24.                                                    NC1334.2
   000700         070300     MOVE "IDX-TEST-24" TO PAR-NAME.                              NC1334.2 69
   000701         070400     PERFORM PRINT-DETAIL.                                        NC1334.2 223
   000702         070500*IDX-TEST-25.                                                     NC1334.2
   000703         070600*    THIS TEST WAS DELETED BY THE FCCTS SINCE IT DID NOT          NC1334.2
   000704         070700*    APPLY TO THE REVISED FEDERAL STANDARD - FIPS PUB 21-1.       NC1334.2
   000705         070800*IDX-TEST-26.                                                     NC1334.2
   000706         070900*    THIS TEST WAS DELETED BY THE FCCTS SINCE IT DID NOT          NC1334.2
   000707         071000*    APPLY TO THE REVISED FEDERAL STANDARD - FIPS PUB 21-1.       NC1334.2
   000708         071100 CCVS-EXIT SECTION.                                               NC1334.2
   000709         071200 CCVS-999999.                                                     NC1334.2
   000710         071300     GO TO CLOSE-FILES.                                           NC1334.2 212
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      125   ANSI-REFERENCE . . . . . . . .  302 309 318
      104   CCVS-C-1 . . . . . . . . . . .  241 287
      109   CCVS-C-2 . . . . . . . . . . .  242 288
      159   CCVS-E-1 . . . . . . . . . . .  247
      164   CCVS-E-2 . . . . . . . . . . .  256 263 270 275
      167   CCVS-E-2-2 . . . . . . . . . .  M255
      172   CCVS-E-3 . . . . . . . . . . .  276
      181   CCVS-E-4 . . . . . . . . . . .  255
      182   CCVS-E-4-1 . . . . . . . . . .  M253
      184   CCVS-E-4-2 . . . . . . . . . .  M254
      126   CCVS-H-1 . . . . . . . . . . .  236 283
      131   CCVS-H-2A. . . . . . . . . . .  237 284
      140   CCVS-H-2B. . . . . . . . . . .  238 285
      152   CCVS-H-3 . . . . . . . . . . .  239 286
      202   CCVS-PGM-ID. . . . . . . . . .  208 208
       86   CM-18V0
       46   COMP-S-IDX1. . . . . . . . . .  M624 625
       44   COMP-S-IDX18 . . . . . . . . .  M594 595 M640 641 645 M669 670 671 676
       45   COMP-U-IDX1. . . . . . . . . .  M609 610 M655 656 659 M686 687 688 691
       43   COMP-U-IDX18 . . . . . . . . .  M579 580
       80   COMPUTED-A . . . . . . . . . .  81 83 84 85 86 314 317 M345 M360 M373 M387 M402 M418 M450 M482 M497 M511 M525
                                            M539 M553 M568 M585 M600 M615 M630
       81   COMPUTED-N . . . . . . . . . .  M645 M659
       79   COMPUTED-X . . . . . . . . . .  M231 299
       83   COMPUTED-0V18
       85   COMPUTED-14V4
       87   COMPUTED-18V0. . . . . . . . .  M435 M467 M675 M693
       84   COMPUTED-4V14
      103   COR-ANSI-REFERENCE . . . . . .  M309 M311
       94   CORRECT-A. . . . . . . . . . .  95 96 97 98 99 315 317 M346 M359 M374 M388 M403 M419 M433 M449 M465 M483 M498
                                            M512 M526 M540 M554 M569 M584 M599 M614 M629
       95   CORRECT-N. . . . . . . . . . .  M644 M660
       93   CORRECT-X. . . . . . . . . . .  M232 301
       96   CORRECT-0V18
       98   CORRECT-14V4
      100   CORRECT-18V0 . . . . . . . . .  M676 M691
       97   CORRECT-4V14
       99   CR-18V0
      117   DELETE-COUNTER . . . . . . . .  M221 250 266 268
       72   DOTVALUE . . . . . . . . . . .  M226
      123   DUMMY-HOLD . . . . . . . . . .  M280 290
       38   DUMMY-RECORD . . . . . . . . .  M236 M237 M238 M239 M241 M242 M243 M245 M247 M256 M263 M270 M275 M276 280 M281
                                            282 M283 M284 M285 M286 M287 M288 M289 M290 294 M295 M304 M319
      170   ENDER-DESC . . . . . . . . . .  M258 M269 M274
       50   ENTRY-A-1. . . . . . . . . . .  342 345 356 360 370 373 384 387 581 585
       51   ENTRY-A-2. . . . . . . . . . .  415 418 596 600
       52   ENTRY-A-3. . . . . . . . . . .  565 568 626 630
       53   ENTRY-A-4. . . . . . . . . . .  399 402 446 450 479 482
       55   ENTRY-A-5
       56   ENTRY-A-6
       57   ENTRY-A-7
       58   ENTRY-A-8. . . . . . . . . . .  479 483
       60   ENTRY-B-1. . . . . . . . . . .  61
       61   ENTRY-B-2. . . . . . . . . . .  494 497 508 511 522 525 536 539 550 553 565 569 611 615
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    17
0 Defined   Cross-reference of data names   References

0     118   ERROR-COUNTER. . . . . . . . .  M220 249 259 262
      122   ERROR-HOLD . . . . . . . . . .  M249 M250 M250 M251 254
      168   ERROR-TOTAL. . . . . . . . . .  M260 M262 M267 M268 M272 M273
       65   FEATURE. . . . . . . . . . . .  M327 M411
      196   HYPHEN-LINE. . . . . . . . . .  243 245 289
      162   ID-AGAIN . . . . . . . . . . .  M208
       56   IDX-X2 . . . . . . . . . . . .  M459 460 M478 479 483
       50   IDX-1. . . . . . . . . . . . .  M341 342 345 M355 356 360 M369 370 373 M383 384 387 M428 429 M444 445 M580 581
                                            585 M639 640
       51   IDX-2. . . . . . . . . . . . .  M398 399 402 M414 415 418 M429 430 434 M445 446 450 M461 462 466 M476 477 479
                                            482 M564 565 568 M595 596 600 M625 626 630 M654 655 M670 671 674
       62   IDX-3. . . . . . . . . . . . .  M493 494 497 M507 508 511 M521 522 525 M535 536 539 M549 550 553 M563 565 569
                                            M610 611 615 M687 688 692
       47   INDEX-VALUE. . . . . . . . . .  M434 435 M466 467 M674 675 M692 693
      195   INF-ANSI-REFERENCE . . . . . .  M302 M305 M318 M320
      190   INFO-TEXT. . . . . . . . . . .  M303
      119   INSPECT-COUNTER. . . . . . . .  M218 249 271 273
       67   P-OR-F . . . . . . . . . . . .  M218 M219 M220 M221 228 M231
       69   PAR-NAME . . . . . . . . . . .  M233 M338 M352 M366 M380 M394 M409 M425 M441 M456 M473 M490 M504 M518 M532 M546
                                            M560 M576 M591 M606 M621 M636 M651 M666 M683 M700
       71   PARDOT-X . . . . . . . . . . .  M225
      120   PASS-COUNTER . . . . . . . . .  M219 251 253
       36   PRINT-FILE . . . . . . . . . .  32 207 213
       37   PRINT-REC. . . . . . . . . . .  M227 M308 M310
       74   RE-MARK. . . . . . . . . . . .  M222 M234 M331 M333 M484 M570 M677 M694
      116   REC-CT . . . . . . . . . . . .  224 226 233
      115   REC-SKL-SUB
      124   RECORD-COUNT . . . . . . . . .  M278 279 M291
       40   SGN-IDX. . . . . . . . . . . .  M397 398
       49   TABLE-A. . . . . . . . . . . .  54 M328 329
       48   TABLE-A-VALUES . . . . . . . .  328 329
       54   TABLE-A1
       59   TABLE-B
       75   TEST-COMPUTED. . . . . . . . .  308
       90   TEST-CORRECT . . . . . . . . .  310
      143   TEST-ID. . . . . . . . . . . .  M208
       63   TEST-RESULTS . . . . . . . . .  M209 227
      121   TOTAL-ERROR
       41   UNSGN-IDX. . . . . . . . . . .  M413 414
       42   USE-IDX. . . . . . . . . . . .  M460 461 M477 478
      192   XXCOMPUTED . . . . . . . . . .  M317
      194   XXCORRECT. . . . . . . . . . .  M317
      187   XXINFO . . . . . . . . . . . .  304 319
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    18
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

      313   BAIL-OUT . . . . . . . . . . .  P230
      321   BAIL-OUT-EX. . . . . . . . . .  E230 G315
      316   BAIL-OUT-WRITE . . . . . . . .  G314
      296   BLANK-LINE-PRINT
      708   CCVS-EXIT. . . . . . . . . . .  G336
      709   CCVS-999999
      205   CCVS1
      322   CCVS1-EXIT . . . . . . . . . .  G211
      212   CLOSE-FILES. . . . . . . . . .  G710
      240   COLUMN-NAMES-ROUTINE . . . . .  E210
      221   DE-LETE. . . . . . . . . . . .  P350 P364 P378 P392 P407 P423 P439 P454 P471 P488 P502 P516 P530 P544 P558 P574
                                            P589 P604 P619 P634 P649 P664 P681 P698
      244   END-ROUTINE. . . . . . . . . .  P213
      248   END-ROUTINE-1
      257   END-ROUTINE-12
      265   END-ROUTINE-13 . . . . . . . .  E213
      246   END-RTN-EXIT
      220   FAIL . . . . . . . . . . . . .  P334 P347 P361 P375 P389 P404 P420 P436 P451 P468 P485 P499 P513 P527 P541 P555
                                            P571 P586 P601 P616 P631 P646 P661 P678 P695
      298   FAIL-ROUTINE . . . . . . . . .  P229
      312   FAIL-ROUTINE-EX. . . . . . . .  E229 G306
      307   FAIL-ROUTINE-WRITE . . . . . .  G300 G301
      235   HEAD-ROUTINE . . . . . . . . .  P210
      349   IDX-DELETE-1
      487   IDX-DELETE-10
      501   IDX-DELETE-11
      515   IDX-DELETE-12
      529   IDX-DELETE-13
      543   IDX-DELETE-14
      557   IDX-DELETE-15
      573   IDX-DELETE-16
      588   IDX-DELETE-17
      603   IDX-DELETE-18
      618   IDX-DELETE-19
      363   IDX-DELETE-2
      633   IDX-DELETE-20
      648   IDX-DELETE-21
      663   IDX-DELETE-22
      680   IDX-DELETE-23
      697   IDX-DELETE-24
      377   IDX-DELETE-3
      391   IDX-DELETE-4
      406   IDX-DELETE-5
      422   IDX-DELETE-6
      438   IDX-DELETE-7
      453   IDX-DELETE-8
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    19
0 Defined   Cross-reference of procedures   References

0     470   IDX-DELETE-9
      326   IDX-INIT-A
      340   IDX-TEST-1
      475   IDX-TEST-10
      492   IDX-TEST-11
      506   IDX-TEST-12
      520   IDX-TEST-13
      534   IDX-TEST-14
      548   IDX-TEST-15
      562   IDX-TEST-16
      578   IDX-TEST-17
      593   IDX-TEST-18
      608   IDX-TEST-19
      354   IDX-TEST-2
      623   IDX-TEST-20
      638   IDX-TEST-21
      653   IDX-TEST-22
      668   IDX-TEST-23
      685   IDX-TEST-24
      368   IDX-TEST-3
      382   IDX-TEST-4
      396   IDX-TEST-5
      412   IDX-TEST-6
      427   IDX-TEST-7
      443   IDX-TEST-8
      458   IDX-TEST-9
      351   IDX-WRITE-1. . . . . . . . . .  G344 G348
      489   IDX-WRITE-10 . . . . . . . . .  G481 G486
      503   IDX-WRITE-11 . . . . . . . . .  G496 G500
      517   IDX-WRITE-12 . . . . . . . . .  G510 G514
      531   IDX-WRITE-13 . . . . . . . . .  G524 G528
      545   IDX-WRITE-14 . . . . . . . . .  G538 G542
      559   IDX-WRITE-15 . . . . . . . . .  G552 G556
      575   IDX-WRITE-16 . . . . . . . . .  G567 G572
      590   IDX-WRITE-17 . . . . . . . . .  G583 G587
      605   IDX-WRITE-18 . . . . . . . . .  G598 G602
      620   IDX-WRITE-19 . . . . . . . . .  G613 G617
      365   IDX-WRITE-2. . . . . . . . . .  G358 G362
      635   IDX-WRITE-20 . . . . . . . . .  G628 G632
      650   IDX-WRITE-21 . . . . . . . . .  G643 G647
      665   IDX-WRITE-22 . . . . . . . . .  G658 G662
      682   IDX-WRITE-23 . . . . . . . . .  G673 G679
      699   IDX-WRITE-24 . . . . . . . . .  G690 G696
      379   IDX-WRITE-3. . . . . . . . . .  G372 G376
      393   IDX-WRITE-4. . . . . . . . . .  G386 G390
      408   IDX-WRITE-5. . . . . . . . . .  G401 G405
      424   IDX-WRITE-6. . . . . . . . . .  G417 G421
      440   IDX-WRITE-7. . . . . . . . . .  G432 G437
      455   IDX-WRITE-8. . . . . . . . . .  G448 G452
      472   IDX-WRITE-9. . . . . . . . . .  G464 G469
      337   INIT-WRITE . . . . . . . . . .  G332 P335
      218   INSPT
      206   OPEN-FILES
      219   PASS . . . . . . . . . . . . .  P330 P343 P357 P371 P385 P400 P416 P431 P447 P463 P480 P495 P509 P523 P537 P551
                                            P566 P582 P597 P612 P627 P642 P657 P672 P689
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    20
0 Defined   Cross-reference of procedures   References

0     223   PRINT-DETAIL . . . . . . . . .  P339 P353 P367 P381 P395 P410 P426 P442 P457 P474 P491 P505 P519 P533 P547 P561
                                            P577 P592 P607 P622 P637 P652 P667 P684 P701
      324   SECT-TH133A-001
      216   TERMINATE-CALL
      214   TERMINATE-CCVS
      325   TH-04-001
      277   WRITE-LINE . . . . . . . . . .  P227 P228 P236 P237 P238 P239 P241 P242 P243 P245 P247 P256 P264 P270 P275 P276
                                            P304 P308 P310 P319
      293   WRT-LN . . . . . . . . . . . .  P283 P284 P285 P286 P287 P288 P289 P292 P297
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    21
0 Defined   Cross-reference of programs     References

        3   NC133A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC133A    Date 06/04/2022  Time 11:58:53   Page    22
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    326  IGYPS2015-I   The paragraph or section prior to paragraph or section "IDX-INIT-A" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC133A:
 *    Source records = 710
 *    Data Division statements = 85
 *    Procedure Division statements = 438
 *    Generated COBOL statements = 0
 *    Program complexity factor = 447
0End of compilation 1,  program NC133A,  highest severity 0.
0Return code 0
