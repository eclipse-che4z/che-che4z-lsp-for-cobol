1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:02   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:02   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1324.2
   000002         000200 PROGRAM-ID.                                                      NC1324.2
   000003         000300     NC132A.                                                      NC1324.2
   000004         000500*                                                              *  NC1324.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1324.2
   000006         000700*                                                              *  NC1324.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1324.2
   000008         000900*                                                              *  NC1324.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1324.2
   000010         001100*                                                              *  NC1324.2
   000011         001300*                                                              *  NC1324.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1324.2
   000013         001500*                                                              *  NC1324.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1324.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1324.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1324.2
   000017         001900*                                                              *  NC1324.2
   000018         002100*                                                                 NC1324.2
   000019         002200*    PROGRAM NC132A TESTS THE USE OF SUBSCRIPTS TO ACCESS A       NC1324.2
   000020         002300*    SINGLE LEVEL TABLE USING INTEGER DISPLAY AND COMPUTATIONAL   NC1324.2
   000021         002400*    FIELDS AS SUBSCRIPTS.                                        NC1324.2
   000022         002500*                                                                 NC1324.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1324.2
   000024         002700 CONFIGURATION SECTION.                                           NC1324.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1324.2
   000026         002900     XXXXX082.                                                    NC1324.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1324.2
   000028         003100     XXXXX083.                                                    NC1324.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1324.2
   000030         003300 FILE-CONTROL.                                                    NC1324.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1324.2 35
   000032         003500     XXXXX055.                                                    NC1324.2
   000033         003600 DATA DIVISION.                                                   NC1324.2
   000034         003700 FILE SECTION.                                                    NC1324.2
   000035         003800 FD  PRINT-FILE.                                                  NC1324.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1324.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1324.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1324.2
   000039         004200 77  CON-1             PICTURE 9  VALUE 1.                        NC1324.2
   000040         004300 77  CON-2             PICTURE 9  VALUE 2.                        NC1324.2
   000041         004400 77  CON-3             PICTURE 9  VALUE 3.                        NC1324.2
   000042         004500 77  CON-4             PICTURE 9  VALUE 4.                        NC1324.2
   000043         004600 77  SUB-3  PICTURE S9(18) COMPUTATIONAL VALUE 2.                 NC1324.2
   000044         004700 77  SUB-4  PICTURE 9(18)  COMPUTATIONAL VALUE 4.                 NC1324.2
   000045         004800 01  CONSTANTS-77.                                                NC1324.2
   000046         004900     02  SUB1   PICTURE 9  VALUE  1.                              NC1324.2
   000047         005000     02  SUB2   PICTURE  S9  VALUE  +4.                           NC1324.2
   000048         005100     02  TABLE-A-VALUES   PICTURE X(20) VALUE "1112223334441122334NC1324.2
   000049         005200-    "4".                                                         NC1324.2
   000050         005300 01  TABLE-A.                                                     NC1324.2
   000051         005400     02  ENTRY-A-1   PICTURE XXX   OCCURS  4 TIMES.               NC1324.2
   000052         005500     02  ENTRY-A-2   OCCURS  4 TIMES.                             NC1324.2
   000053         005600       03  ENTRY-A-3    PICTURE   X.                              NC1324.2
   000054         005700       03  ENTRY-A-4    PICTURE   X.                              NC1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  TABLE-B.                                                     NC1324.2
   000056         005900     02  ENTRY-B-1  PICTURE X(4)  VALUE  "1234".                  NC1324.2
   000057         006000     02  ENTRY-B-2  REDEFINES  ENTRY-B-1  PICTURE  9 OCCURS  4.   NC1324.2 56
   000058         006100 01  TABLE-C.                                                     NC1324.2
   000059         006200     02  ENTRY-C    PICTURE 9  OCCURS  4 TIMES.                   NC1324.2
   000060         006300 01  TEST-RESULTS.                                                NC1324.2
   000061         006400     02 FILLER                   PIC X      VALUE SPACE.          NC1324.2 IMP
   000062         006500     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1324.2 IMP
   000063         006600     02 FILLER                   PIC X      VALUE SPACE.          NC1324.2 IMP
   000064         006700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1324.2 IMP
   000065         006800     02 FILLER                   PIC X      VALUE SPACE.          NC1324.2 IMP
   000066         006900     02  PAR-NAME.                                                NC1324.2
   000067         007000       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1324.2 IMP
   000068         007100       03  PARDOT-X              PIC X      VALUE SPACE.          NC1324.2 IMP
   000069         007200       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1324.2 IMP
   000070         007300     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1324.2 IMP
   000071         007400     02 RE-MARK                  PIC X(61).                       NC1324.2
   000072         007500 01  TEST-COMPUTED.                                               NC1324.2
   000073         007600     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1324.2 IMP
   000074         007700     02 FILLER                   PIC X(17)  VALUE                 NC1324.2
   000075         007800            "       COMPUTED=".                                   NC1324.2
   000076         007900     02 COMPUTED-X.                                               NC1324.2
   000077         008000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1324.2 IMP
   000078         008100     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1324.2 77
   000079         008200                                 PIC -9(9).9(9).                  NC1324.2
   000080         008300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1324.2 77
   000081         008400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1324.2 77
   000082         008500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1324.2 77
   000083         008600     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1324.2 77
   000084         008700         04 COMPUTED-18V0                    PIC -9(18).          NC1324.2
   000085         008800         04 FILLER                           PIC X.               NC1324.2
   000086         008900     03 FILLER PIC X(50) VALUE SPACE.                             NC1324.2 IMP
   000087         009000 01  TEST-CORRECT.                                                NC1324.2
   000088         009100     02 FILLER PIC X(30) VALUE SPACE.                             NC1324.2 IMP
   000089         009200     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1324.2
   000090         009300     02 CORRECT-X.                                                NC1324.2
   000091         009400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1324.2 IMP
   000092         009500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1324.2 91
   000093         009600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1324.2 91
   000094         009700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1324.2 91
   000095         009800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1324.2 91
   000096         009900     03      CR-18V0 REDEFINES CORRECT-A.                         NC1324.2 91
   000097         010000         04 CORRECT-18V0                     PIC -9(18).          NC1324.2
   000098         010100         04 FILLER                           PIC X.               NC1324.2
   000099         010200     03 FILLER PIC X(2) VALUE SPACE.                              NC1324.2 IMP
   000100         010300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1324.2 IMP
   000101         010400 01  CCVS-C-1.                                                    NC1324.2
   000102         010500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1324.2
   000103         010600-    "SS  PARAGRAPH-NAME                                          NC1324.2
   000104         010700-    "       REMARKS".                                            NC1324.2
   000105         010800     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1324.2 IMP
   000106         010900 01  CCVS-C-2.                                                    NC1324.2
   000107         011000     02 FILLER                     PIC X        VALUE SPACE.      NC1324.2 IMP
   000108         011100     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1324.2
   000109         011200     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1324.2 IMP
   000110         011300     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1324.2
   000111         011400     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1324.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1324.2 IMP
   000113         011600 01  REC-CT                        PIC 99       VALUE ZERO.       NC1324.2 IMP
   000114         011700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1324.2 IMP
   000115         011800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1324.2 IMP
   000116         011900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1324.2 IMP
   000117         012000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1324.2 IMP
   000118         012100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1324.2 IMP
   000119         012200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1324.2 IMP
   000120         012300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1324.2 IMP
   000121         012400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1324.2 IMP
   000122         012500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1324.2 IMP
   000123         012600 01  CCVS-H-1.                                                    NC1324.2
   000124         012700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1324.2 IMP
   000125         012800     02  FILLER                    PIC X(42)    VALUE             NC1324.2
   000126         012900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1324.2
   000127         013000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1324.2 IMP
   000128         013100 01  CCVS-H-2A.                                                   NC1324.2
   000129         013200   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1324.2 IMP
   000130         013300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1324.2
   000131         013400   02  FILLER                        PIC XXXX   VALUE             NC1324.2
   000132         013500     "4.2 ".                                                      NC1324.2
   000133         013600   02  FILLER                        PIC X(28)  VALUE             NC1324.2
   000134         013700            " COPY - NOT FOR DISTRIBUTION".                       NC1324.2
   000135         013800   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1324.2 IMP
   000136         013900                                                                  NC1324.2
   000137         014000 01  CCVS-H-2B.                                                   NC1324.2
   000138         014100   02  FILLER                        PIC X(15)  VALUE             NC1324.2
   000139         014200            "TEST RESULT OF ".                                    NC1324.2
   000140         014300   02  TEST-ID                       PIC X(9).                    NC1324.2
   000141         014400   02  FILLER                        PIC X(4)   VALUE             NC1324.2
   000142         014500            " IN ".                                               NC1324.2
   000143         014600   02  FILLER                        PIC X(12)  VALUE             NC1324.2
   000144         014700     " HIGH       ".                                              NC1324.2
   000145         014800   02  FILLER                        PIC X(22)  VALUE             NC1324.2
   000146         014900            " LEVEL VALIDATION FOR ".                             NC1324.2
   000147         015000   02  FILLER                        PIC X(58)  VALUE             NC1324.2
   000148         015100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1324.2
   000149         015200 01  CCVS-H-3.                                                    NC1324.2
   000150         015300     02  FILLER                      PIC X(34)  VALUE             NC1324.2
   000151         015400            " FOR OFFICIAL USE ONLY    ".                         NC1324.2
   000152         015500     02  FILLER                      PIC X(58)  VALUE             NC1324.2
   000153         015600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1324.2
   000154         015700     02  FILLER                      PIC X(28)  VALUE             NC1324.2
   000155         015800            "  COPYRIGHT   1985 ".                                NC1324.2
   000156         015900 01  CCVS-E-1.                                                    NC1324.2
   000157         016000     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1324.2 IMP
   000158         016100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1324.2
   000159         016200     02 ID-AGAIN                     PIC X(9).                    NC1324.2
   000160         016300     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1324.2 IMP
   000161         016400 01  CCVS-E-2.                                                    NC1324.2
   000162         016500     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1324.2 IMP
   000163         016600     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1324.2 IMP
   000164         016700     02 CCVS-E-2-2.                                               NC1324.2
   000165         016800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1324.2 IMP
   000166         016900         03 FILLER                   PIC X      VALUE SPACE.      NC1324.2 IMP
   000167         017000         03 ENDER-DESC               PIC X(44)  VALUE             NC1324.2
   000168         017100            "ERRORS ENCOUNTERED".                                 NC1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  CCVS-E-3.                                                    NC1324.2
   000170         017300     02  FILLER                      PIC X(22)  VALUE             NC1324.2
   000171         017400            " FOR OFFICIAL USE ONLY".                             NC1324.2
   000172         017500     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1324.2 IMP
   000173         017600     02  FILLER                      PIC X(58)  VALUE             NC1324.2
   000174         017700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1324.2
   000175         017800     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1324.2 IMP
   000176         017900     02 FILLER                       PIC X(15)  VALUE             NC1324.2
   000177         018000             " COPYRIGHT 1985".                                   NC1324.2
   000178         018100 01  CCVS-E-4.                                                    NC1324.2
   000179         018200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1324.2 IMP
   000180         018300     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1324.2
   000181         018400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1324.2 IMP
   000182         018500     02 FILLER                       PIC X(40)  VALUE             NC1324.2
   000183         018600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1324.2
   000184         018700 01  XXINFO.                                                      NC1324.2
   000185         018800     02 FILLER                       PIC X(19)  VALUE             NC1324.2
   000186         018900            "*** INFORMATION ***".                                NC1324.2
   000187         019000     02 INFO-TEXT.                                                NC1324.2
   000188         019100       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1324.2 IMP
   000189         019200       04 XXCOMPUTED                 PIC X(20).                   NC1324.2
   000190         019300       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1324.2 IMP
   000191         019400       04 XXCORRECT                  PIC X(20).                   NC1324.2
   000192         019500     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1324.2
   000193         019600 01  HYPHEN-LINE.                                                 NC1324.2
   000194         019700     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1324.2 IMP
   000195         019800     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1324.2
   000196         019900-    "*****************************************".                 NC1324.2
   000197         020000     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1324.2
   000198         020100-    "******************************".                            NC1324.2
   000199         020200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1324.2
   000200         020300     "NC132A".                                                    NC1324.2
   000201         020400 PROCEDURE DIVISION.                                              NC1324.2
   000202         020500 CCVS1 SECTION.                                                   NC1324.2
   000203         020600 OPEN-FILES.                                                      NC1324.2
   000204         020700     OPEN     OUTPUT PRINT-FILE.                                  NC1324.2 35
   000205         020800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1324.2 199 140 199 159
   000206         020900     MOVE    SPACE TO TEST-RESULTS.                               NC1324.2 IMP 60
   000207         021000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1324.2 232 237
   000208         021100     GO TO CCVS1-EXIT.                                            NC1324.2 319
   000209         021200 CLOSE-FILES.                                                     NC1324.2
   000210         021300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1324.2 241 262 35
   000211         021400 TERMINATE-CCVS.                                                  NC1324.2
   000212         021500     EXIT PROGRAM.                                                NC1324.2
   000213         021600 TERMINATE-CALL.                                                  NC1324.2
   000214         021700     STOP     RUN.                                                NC1324.2
   000215         021800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1324.2 64 116
   000216         021900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1324.2 64 117
   000217         022000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1324.2 64 115
   000218         022100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1324.2 64 114
   000219         022200     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1324.2 71
   000220         022300 PRINT-DETAIL.                                                    NC1324.2
   000221         022400     IF REC-CT NOT EQUAL TO ZERO                                  NC1324.2 113 IMP
   000222      1  022500             MOVE "." TO PARDOT-X                                 NC1324.2 68
   000223      1  022600             MOVE REC-CT TO DOTVALUE.                             NC1324.2 113 69
   000224         022700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1324.2 60 36 274
   000225         022800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1324.2 64 274
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  022900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1324.2 295 309
   000227      1  023000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1324.2 310 318
   000228         023100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1324.2 IMP 64 IMP 76
   000229         023200     MOVE SPACE TO CORRECT-X.                                     NC1324.2 IMP 90
   000230         023300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1324.2 113 IMP IMP 66
   000231         023400     MOVE     SPACE TO RE-MARK.                                   NC1324.2 IMP 71
   000232         023500 HEAD-ROUTINE.                                                    NC1324.2
   000233         023600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1324.2 123 37 274
   000234         023700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1324.2 128 37 274
   000235         023800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1324.2 137 37 274
   000236         023900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1324.2 149 37 274
   000237         024000 COLUMN-NAMES-ROUTINE.                                            NC1324.2
   000238         024100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1324.2 101 37 274
   000239         024200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1324.2 106 37 274
   000240         024300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1324.2 193 37 274
   000241         024400 END-ROUTINE.                                                     NC1324.2
   000242         024500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1324.2 193 37 274
   000243         024600 END-RTN-EXIT.                                                    NC1324.2
   000244         024700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1324.2 156 37 274
   000245         024800 END-ROUTINE-1.                                                   NC1324.2
   000246         024900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1324.2 115 119 116
   000247         025000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1324.2 119 114 119
   000248         025100      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1324.2 117 119
   000249         025200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1324.2
   000250         025300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1324.2 117 179
   000251         025400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1324.2 119 181
   000252         025500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1324.2 178 164
   000253         025600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1324.2 161 37 274
   000254         025700  END-ROUTINE-12.                                                 NC1324.2
   000255         025800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1324.2 167
   000256         025900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1324.2 115 IMP
   000257      1  026000         MOVE "NO " TO ERROR-TOTAL                                NC1324.2 165
   000258         026100         ELSE                                                     NC1324.2
   000259      1  026200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1324.2 115 165
   000260         026300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1324.2 161 37
   000261         026400     PERFORM WRITE-LINE.                                          NC1324.2 274
   000262         026500 END-ROUTINE-13.                                                  NC1324.2
   000263         026600     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1324.2 114 IMP
   000264      1  026700         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1324.2 165
   000265      1  026800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1324.2 114 165
   000266         026900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1324.2 167
   000267         027000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1324.2 161 37 274
   000268         027100      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1324.2 116 IMP
   000269      1  027200          MOVE "NO " TO ERROR-TOTAL                               NC1324.2 165
   000270      1  027300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1324.2 116 165
   000271         027400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1324.2 167
   000272         027500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1324.2 161 37 274
   000273         027600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1324.2 169 37 274
   000274         027700 WRITE-LINE.                                                      NC1324.2
   000275         027800     ADD 1 TO RECORD-COUNT.                                       NC1324.2 121
   000276         027900     IF RECORD-COUNT GREATER 42                                   NC1324.2 121
   000277      1  028000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1324.2 37 120
   000278      1  028100         MOVE SPACE TO DUMMY-RECORD                               NC1324.2 IMP 37
   000279      1  028200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1324.2 37
   000280      1  028300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1324.2 123 37 290
   000281      1  028400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1324.2 128 37 290
   000282      1  028500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1324.2 137 37 290
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1324.2 149 37 290
   000284      1  028700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1324.2 101 37 290
   000285      1  028800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1324.2 106 37 290
   000286      1  028900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1324.2 193 37 290
   000287      1  029000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1324.2 120 37
   000288      1  029100         MOVE ZERO TO RECORD-COUNT.                               NC1324.2 IMP 121
   000289         029200     PERFORM WRT-LN.                                              NC1324.2 290
   000290         029300 WRT-LN.                                                          NC1324.2
   000291         029400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1324.2 37
   000292         029500     MOVE SPACE TO DUMMY-RECORD.                                  NC1324.2 IMP 37
   000293         029600 BLANK-LINE-PRINT.                                                NC1324.2
   000294         029700     PERFORM WRT-LN.                                              NC1324.2 290
   000295         029800 FAIL-ROUTINE.                                                    NC1324.2
   000296         029900     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1324.2 76 IMP
   000297      1  030000            GO TO FAIL-ROUTINE-WRITE.                             NC1324.2 304
   000298         030100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1324.2 90 IMP 304
   000299         030200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1324.2 122 192
   000300         030300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1324.2 187
   000301         030400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1324.2 184 37 274
   000302         030500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1324.2 IMP 192
   000303         030600     GO TO  FAIL-ROUTINE-EX.                                      NC1324.2 309
   000304         030700 FAIL-ROUTINE-WRITE.                                              NC1324.2
   000305         030800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1324.2 72 36 274
   000306         030900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1324.2 122 100
   000307         031000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1324.2 87 36 274
   000308         031100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1324.2 IMP 100
   000309         031200 FAIL-ROUTINE-EX. EXIT.                                           NC1324.2
   000310         031300 BAIL-OUT.                                                        NC1324.2
   000311         031400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1324.2 77 IMP 313
   000312         031500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1324.2 91 IMP 318
   000313         031600 BAIL-OUT-WRITE.                                                  NC1324.2
   000314         031700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1324.2 91 191 77 189
   000315         031800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1324.2 122 192
   000316         031900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1324.2 184 37 274
   000317         032000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1324.2 IMP 192
   000318         032100 BAIL-OUT-EX. EXIT.                                               NC1324.2
   000319         032200 CCVS1-EXIT.                                                      NC1324.2
   000320         032300     EXIT.                                                        NC1324.2
   000321         032400 SECT-TH132A-001 SECTION.                                         NC1324.2
   000322         032500 TH-02-001.                                                       NC1324.2
   000323         032600     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC1324.2 122
   000324         032700     MOVE TABLE-A-VALUES  TO  TABLE-A.                            NC1324.2 48 50
   000325         032800     MOVE  "SUBSCRIPTING"  TO FEATURE.                            NC1324.2 62
   000326         032900 SUB-SCRIPT-1.                                                    NC1324.2
   000327         033000     IF TABLE-A IS NOT EQUAL TO TABLE-A-VALUES                    NC1324.2 50 48
   000328      1  033100     GO TO  SUB-SCRIPT-1B.                                        NC1324.2 334
   000329         033200     PERFORM PASS.                                                NC1324.2 216
   000330         033300     GO TO  SUB-SCRIPT-1C.                                        NC1324.2 338
   000331         033400 SUB-SCRIPT-1A.                                                   NC1324.2
   000332         033500     PERFORM DE-LETE.                                             NC1324.2 218
   000333         033600     GO TO SUB-SCRIPT-1C.                                         NC1324.2 338
   000334         033700 SUB-SCRIPT-1B.                                                   NC1324.2
   000335         033800     PERFORM FAIL.                                                NC1324.2 217
   000336         033900     MOVE TABLE-A TO COMPUTED-A.                                  NC1324.2 50 77
   000337         034000     MOVE   "11122233344411223344" TO CORRECT-A.                  NC1324.2 91
   000338         034100 SUB-SCRIPT-1C.                                                   NC1324.2
   000339         034200     MOVE "SUB-SCRIPT-1" TO PAR-NAME.                             NC1324.2 66
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000341         034400*    NOTE    *******  THIS  TEST CHECKS TO SEE  THAT THE TABLE    NC1324.2
   000342         034500*                     TO BE USED IN THE PROGRAM IS SET UP         NC1324.2
   000343         034600*                     CORRECTLY.                                  NC1324.2
   000344         034700 SUB-SCRIPT-2.                                                    NC1324.2
   000345         034800     IF  ENTRY-A-1 (1) NOT EQUAL TO "111"                         NC1324.2 51
   000346      1  034900     GO TO SUB-SCRIPT-2B.                                         NC1324.2 352
   000347         035000     PERFORM PASS.                                                NC1324.2 216
   000348         035100     GO TO SUB-SCRIPT-2C.                                         NC1324.2 356
   000349         035200 SUB-SCRIPT-2A.                                                   NC1324.2
   000350         035300     PERFORM DE-LETE.                                             NC1324.2 218
   000351         035400     GO TO SUB-SCRIPT-2C.                                         NC1324.2 356
   000352         035500 SUB-SCRIPT-2B.                                                   NC1324.2
   000353         035600     PERFORM FAIL.                                                NC1324.2 217
   000354         035700     MOVE ENTRY-A-1 (1) TO COMPUTED-A                             NC1324.2 51 77
   000355         035800     MOVE "111" TO CORRECT-A.                                     NC1324.2 91
   000356         035900 SUB-SCRIPT-2C.                                                   NC1324.2
   000357         036000     MOVE "SUB-SCRIPT-2" TO PAR-NAME.                             NC1324.2 66
   000358         036100     PERFORM  PRINT-DETAIL.                                       NC1324.2 220
   000359         036200*    NOTE   ******   THIS CHECKS THE USE OF NUMERIC  LITERALS     NC1324.2
   000360         036300*                    AS SUBSCRIPTS.                               NC1324.2
   000361         036400 SUB-SCRIPT-3.                                                    NC1324.2
   000362         036500     IF ENTRY-A-1 (SUB1)    NOT EQUAL TO "111"                    NC1324.2 51 46
   000363      1  036600     GO TO SUB-SCRIPT-3B.                                         NC1324.2 369
   000364         036700     PERFORM PASS.                                                NC1324.2 216
   000365         036800     GO TO SUB-SCRIPT-3C.                                         NC1324.2 373
   000366         036900 SUB-SCRIPT-3A.                                                   NC1324.2
   000367         037000     PERFORM DE-LETE.                                             NC1324.2 218
   000368         037100     GO TO SUB-SCRIPT-3C.                                         NC1324.2 373
   000369         037200 SUB-SCRIPT-3B.                                                   NC1324.2
   000370         037300     PERFORM FAIL.                                                NC1324.2 217
   000371         037400     MOVE ENTRY-A-1 (SUB1) TO COMPUTED-A.                         NC1324.2 51 46 77
   000372         037500     MOVE "111" TO CORRECT-A.                                     NC1324.2 91
   000373         037600 SUB-SCRIPT-3C.                                                   NC1324.2
   000374         037700     MOVE "SUB-SCRIPT-3" TO PAR-NAME.                             NC1324.2 66
   000375         037800     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000376         037900*    NOTE  *******      THIS CHECKS THE USE OF UNSIGNED           NC1324.2
   000377         038000*                       CONSTANTS AS SUBSCRIPTS.                  NC1324.2
   000378         038100 SUB-SCRIPT-4.                                                    NC1324.2
   000379         038200     ADD 1 TO SUB1.                                               NC1324.2 46
   000380         038300     IF ENTRY-A-1 (SUB1) NOT EQUAL TO "222"                       NC1324.2 51 46
   000381      1  038400     GO TO SUB-SCRIPT-4B.                                         NC1324.2 387
   000382         038500     PERFORM PASS.                                                NC1324.2 216
   000383         038600     GO TO SUB-SCRIPT-4C.                                         NC1324.2 391
   000384         038700 SUB-SCRIPT-4A.                                                   NC1324.2
   000385         038800     PERFORM DE-LETE.                                             NC1324.2 218
   000386         038900     GO TO SUB-SCRIPT-4C.                                         NC1324.2 391
   000387         039000 SUB-SCRIPT-4B.                                                   NC1324.2
   000388         039100     PERFORM FAIL.                                                NC1324.2 217
   000389         039200     MOVE ENTRY-A-1 (SUB1) TO COMPUTED-A.                         NC1324.2 51 46 77
   000390         039300     MOVE "222" TO CORRECT-A.                                     NC1324.2 91
   000391         039400 SUB-SCRIPT-4C.                                                   NC1324.2
   000392         039500     MOVE "SUB-SCRIPT-4" TO  PAR-NAME.                            NC1324.2 66
   000393         039600     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000394         039700*    NOTE  *******    THIS CHECKS THE VARYING OF AN               NC1324.2
   000395         039800*                     UNSIGNED SUBSCRIPT.                         NC1324.2
   000396         039900 SUB-SCRIPT-5.                                                    NC1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     MOVE +4 TO SUB2.                                             NC1324.2 47
   000398         040100     IF ENTRY-A-1 (SUB2)  NOT EQUAL TO "444"                      NC1324.2 51 47
   000399      1  040200     GO TO  SUB-SCRIPT-5B.                                        NC1324.2 405
   000400         040300     PERFORM PASS.                                                NC1324.2 216
   000401         040400     GO TO SUB-SCRIPT-5C.                                         NC1324.2 409
   000402         040500 SUB-SCRIPT-5A.                                                   NC1324.2
   000403         040600     PERFORM DE-LETE.                                             NC1324.2 218
   000404         040700     GO TO SUB-SCRIPT-5C.                                         NC1324.2 409
   000405         040800 SUB-SCRIPT-5B.                                                   NC1324.2
   000406         040900     PERFORM FAIL.                                                NC1324.2 217
   000407         041000     MOVE ENTRY-A-1 (SUB2) TO COMPUTED-A.                         NC1324.2 51 47 77
   000408         041100     MOVE "444" TO CORRECT-A.                                     NC1324.2 91
   000409         041200 SUB-SCRIPT-5C.                                                   NC1324.2
   000410         041300     MOVE "SUB-SCRIPT-5" TO  PAR-NAME.                            NC1324.2 66
   000411         041400     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000412         041500*    NOTE  ******  THIS CHECKS THE USE OF A SIGNED                NC1324.2
   000413         041600*                  CONSTANT AS SUBSCRIPTS.                        NC1324.2
   000414         041700 SUB-SCRIPT-6.                                                    NC1324.2
   000415         041800     SUBTRACT  +1 FROM SUB2.                                      NC1324.2 47
   000416         041900     IF ENTRY-A-1 (SUB2)  NOT EQUAL TO "333"                      NC1324.2 51 47
   000417      1  042000     GO TO SUB-SCRIPT-6B.                                         NC1324.2 423
   000418         042100     PERFORM PASS.                                                NC1324.2 216
   000419         042200     GO TO SUB-SCRIPT-6C.                                         NC1324.2 427
   000420         042300 SUB-SCRIPT-6A.                                                   NC1324.2
   000421         042400     PERFORM DE-LETE.                                             NC1324.2 218
   000422         042500     GO TO SUB-SCRIPT-6C.                                         NC1324.2 427
   000423         042600 SUB-SCRIPT-6B.                                                   NC1324.2
   000424         042700     PERFORM FAIL.                                                NC1324.2 217
   000425         042800     MOVE ENTRY-A-1 (SUB2) TO COMPUTED-A.                         NC1324.2 51 47 77
   000426         042900     MOVE "333" TO CORRECT-A.                                     NC1324.2 91
   000427         043000 SUB-SCRIPT-6C.                                                   NC1324.2
   000428         043100     MOVE "SUB-SCRIPT-6" TO PAR-NAME.                             NC1324.2 66
   000429         043200     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000430         043300*    NOTE  ******   THIS CHECKS THE VARYING OF A                  NC1324.2
   000431         043400*                   SIGNED SUBSCRIPT.                             NC1324.2
   000432         043500*SUB-SCRIPT-7.                                                    NC1324.2
   000433         043600*    THIS TEST WAS DELETED BY THE FCCTS SINCE IT DID NOT          NC1324.2
   000434         043700*    APPLY TO THE REVISED FEDERAL STANDARD - FIPS PUB 21-1.       NC1324.2
   000435         043800 SUB-SCRIPT-8.                                                    NC1324.2
   000436         043900     IF ENTRY-A-3 (2)  NOT EQUAL TO "2"                           NC1324.2 53
   000437      1  044000     GO TO SUB-SCRIPT-8B.                                         NC1324.2 443
   000438         044100     PERFORM PASS.                                                NC1324.2 216
   000439         044200     GO TO SUB-SCRIPT-8C.                                         NC1324.2 447
   000440         044300 SUB-SCRIPT-8A.                                                   NC1324.2
   000441         044400     PERFORM DE-LETE.                                             NC1324.2 218
   000442         044500     GO TO SUB-SCRIPT-8C.                                         NC1324.2 447
   000443         044600 SUB-SCRIPT-8B.                                                   NC1324.2
   000444         044700     PERFORM FAIL.                                                NC1324.2 217
   000445         044800     MOVE ENTRY-A-3 (2) TO COMPUTED-A.                            NC1324.2 53 77
   000446         044900     MOVE "2" TO CORRECT-A.                                       NC1324.2 91
   000447         045000 SUB-SCRIPT-8C.                                                   NC1324.2
   000448         045100     MOVE "SUB-SCRIPT-8" TO PAR-NAME.                             NC1324.2 66
   000449         045200     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000450         045300*    NOTE  *****  THIS CHECKS THE USE OF AN ELEMENTARY ITEM       NC1324.2
   000451         045400*                 WHEN THE GROUP ITEM HAS THE OCCURS.             NC1324.2
   000452         045500 SUB-SCRIPT-9.                                                    NC1324.2
   000453         045600     IF ENTRY-A-2 (4)    NOT EQUAL TO  "44"                       NC1324.2 52
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  045700     GO TO SUB-SCRIPT-9B.                                         NC1324.2 460
   000455         045800     PERFORM PASS.                                                NC1324.2 216
   000456         045900     GO TO SUB-SCRIPT-9C.                                         NC1324.2 464
   000457         046000 SUB-SCRIPT-9A.                                                   NC1324.2
   000458         046100     PERFORM DE-LETE.                                             NC1324.2 218
   000459         046200     GO TO SUB-SCRIPT-9C.                                         NC1324.2 464
   000460         046300 SUB-SCRIPT-9B.                                                   NC1324.2
   000461         046400     PERFORM FAIL.                                                NC1324.2 217
   000462         046500     MOVE ENTRY-A-2 (4) TO COMPUTED-A.                            NC1324.2 52 77
   000463         046600     MOVE "44" TO CORRECT-A.                                      NC1324.2 91
   000464         046700 SUB-SCRIPT-9C.                                                   NC1324.2
   000465         046800     MOVE "SUB-SCRIPT-9" TO PAR-NAME.                             NC1324.2 66
   000466         046900     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000467         047000*    NOTE  *******  THIS CHECKS A GROUP ITEM WHEN IT              NC1324.2
   000468         047100*                   HAS THE OCCURS.                               NC1324.2
   000469         047200 SUB-SCRIPT-10.                                                   NC1324.2
   000470         047300     IF ENTRY-B-2 (1)  NOT EQUAL TO "1"                           NC1324.2 57
   000471      1  047400     GO TO SUB-SCRIPT-10B.                                        NC1324.2 477
   000472         047500     PERFORM PASS.                                                NC1324.2 216
   000473         047600     GO TO SUB-SCRIPT-10C.                                        NC1324.2 481
   000474         047700 SUB-SCRIPT-10A.                                                  NC1324.2
   000475         047800     PERFORM DE-LETE.                                             NC1324.2 218
   000476         047900     GO TO SUB-SCRIPT-10C.                                        NC1324.2 481
   000477         048000 SUB-SCRIPT-10B.                                                  NC1324.2
   000478         048100     PERFORM FAIL.                                                NC1324.2 217
   000479         048200     MOVE ENTRY-B-2 (1) TO COMPUTED-A.                            NC1324.2 57 77
   000480         048300     MOVE "1" TO CORRECT-A.                                       NC1324.2 91
   000481         048400 SUB-SCRIPT-10C.                                                  NC1324.2
   000482         048500     MOVE "SUB-SCRIPT-10" TO PAR-NAME.                            NC1324.2 66
   000483         048600     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000484         048700*    NOTE   ******  THIS CHECKS THE USE OF THE REDEFINE.          NC1324.2
   000485         048800 SUB-SCRIPT-11.                                                   NC1324.2
   000486         048900     MOVE  ENTRY-B-2 (1) TO ENTRY-C (4).                          NC1324.2 57 59
   000487         049000     MOVE  ENTRY-B-2 (2) TO ENTRY-C (3).                          NC1324.2 57 59
   000488         049100     MOVE  ENTRY-B-2 (3) TO ENTRY-C (2).                          NC1324.2 57 59
   000489         049200     MOVE  ENTRY-B-2 (4) TO ENTRY-C (1).                          NC1324.2 57 59
   000490         049300     IF TABLE-C    NOT  EQUAL TO "4321"                           NC1324.2 58
   000491      1  049400     GO TO SUB-SCRIPT-11B.                                        NC1324.2 497
   000492         049500     PERFORM PASS.                                                NC1324.2 216
   000493         049600     GO TO SUB-SCRIPT-11C.                                        NC1324.2 501
   000494         049700 SUB-SCRIPT-11A.                                                  NC1324.2
   000495         049800     PERFORM DE-LETE.                                             NC1324.2 218
   000496         049900     GO TO SUB-SCRIPT-11C.                                        NC1324.2 501
   000497         050000 SUB-SCRIPT-11B.                                                  NC1324.2
   000498         050100     PERFORM FAIL.                                                NC1324.2 217
   000499         050200     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000500         050300     MOVE "4321" TO CORRECT-A.                                    NC1324.2 91
   000501         050400 SUB-SCRIPT-11C.                                                  NC1324.2
   000502         050500     MOVE "SUB-SCRIPT-11" TO PAR-NAME.                            NC1324.2 66
   000503         050600     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000504         050700 SUB-SCRIPT-12.                                                   NC1324.2
   000505         050800     MOVE "0000" TO TABLE-C.                                      NC1324.2 58
   000506         050900     ADD ENTRY-B-2 (1) TO ENTRY-C (1).                            NC1324.2 57 59
   000507         051000     ADD ENTRY-B-2 (2) TO ENTRY-C (2).                            NC1324.2 57 59
   000508         051100     ADD ENTRY-B-2 (3) TO ENTRY-C (3).                            NC1324.2 57 59
   000509         051200     ADD ENTRY-B-2 (4) TO ENTRY-C (4).                            NC1324.2 57 59
   000510         051300     IF TABLE-C NOT EQUAL TO "1234"                               NC1324.2 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051400     GO TO SUB-SCRIPT-12B.                                        NC1324.2 517
   000512         051500     PERFORM PASS.                                                NC1324.2 216
   000513         051600     GO TO SUB-SCRIPT-12C.                                        NC1324.2 521
   000514         051700 SUB-SCRIPT-12A.                                                  NC1324.2
   000515         051800     PERFORM DE-LETE.                                             NC1324.2 218
   000516         051900     GO TO SUB-SCRIPT-12C.                                        NC1324.2 521
   000517         052000 SUB-SCRIPT-12B.                                                  NC1324.2
   000518         052100     PERFORM FAIL.                                                NC1324.2 217
   000519         052200     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000520         052300     MOVE "1234" TO CORRECT-A.                                    NC1324.2 91
   000521         052400 SUB-SCRIPT-12C.                                                  NC1324.2
   000522         052500     MOVE "SUB-SCRIPT-12" TO PAR-NAME.                            NC1324.2 66
   000523         052600     PERFORM  PRINT-DETAIL.                                       NC1324.2 220
   000524         052700*    THIS TEST CHECKS THE USE OF SUBSCRIPTED DATA-NAMES           NC1324.2
   000525         052800*    IN AN ADD STATEMENT                                          NC1324.2
   000526         052900 SUB-SCRIPT-13.                                                   NC1324.2
   000527         053000     MOVE  "1234" TO TABLE-C.                                     NC1324.2 58
   000528         053100     SUBTRACT ENTRY-B-2 (1) FROM ENTRY-C (1).                     NC1324.2 57 59
   000529         053200     SUBTRACT ENTRY-B-2 (2) FROM ENTRY-C (2).                     NC1324.2 57 59
   000530         053300     SUBTRACT ENTRY-B-2 (3) FROM ENTRY-C (3).                     NC1324.2 57 59
   000531         053400     SUBTRACT ENTRY-B-2 (4) FROM ENTRY-C (4).                     NC1324.2 57 59
   000532         053500     IF TABLE-C  NOT EQUAL TO  "0000"                             NC1324.2 58
   000533      1  053600     GO TO  SUB-SCRIPT-13B.                                       NC1324.2 539
   000534         053700     PERFORM PASS.                                                NC1324.2 216
   000535         053800     GO TO SUB-SCRIPT-13C.                                        NC1324.2 543
   000536         053900 SUB-SCRIPT-13A.                                                  NC1324.2
   000537         054000     PERFORM DE-LETE.                                             NC1324.2 218
   000538         054100     GO TO SUB-SCRIPT-13C.                                        NC1324.2 543
   000539         054200 SUB-SCRIPT-13B.                                                  NC1324.2
   000540         054300     PERFORM FAIL.                                                NC1324.2 217
   000541         054400     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000542         054500     MOVE "0000" TO CORRECT-A.                                    NC1324.2 91
   000543         054600 SUB-SCRIPT-13C.                                                  NC1324.2
   000544         054700     MOVE "SUB-SCRIPT-13" TO PAR-NAME.                            NC1324.2 66
   000545         054800     PERFORM  PRINT-DETAIL.                                       NC1324.2 220
   000546         054900*    THIS TEST CHECKS THE USE OF SUBSCRIPTED DATA-NAMES           NC1324.2
   000547         055000*    IN A SUBTRACT STATEMENT.                                     NC1324.2
   000548         055100 SUB-SCRIPT-14.                                                   NC1324.2
   000549         055200     MOVE "1111" TO TABLE-C.                                      NC1324.2 58
   000550         055300     MULTIPLY ENTRY-B-2 (1) BY ENTRY-C (1).                       NC1324.2 57 59
   000551         055400     MULTIPLY ENTRY-B-2 (2) BY ENTRY-C (2).                       NC1324.2 57 59
   000552         055500     MULTIPLY ENTRY-B-2 (3) BY ENTRY-C (3).                       NC1324.2 57 59
   000553         055600     MULTIPLY ENTRY-B-2 (4) BY ENTRY-C (4).                       NC1324.2 57 59
   000554         055700     IF TABLE-C  NOT EQUAL TO "1234"                              NC1324.2 58
   000555      1  055800     GO TO SUB-SCRIPT-14B.                                        NC1324.2 561
   000556         055900     PERFORM PASS.                                                NC1324.2 216
   000557         056000     GO TO SUB-SCRIPT-14C.                                        NC1324.2 565
   000558         056100 SUB-SCRIPT-14A.                                                  NC1324.2
   000559         056200     PERFORM DE-LETE.                                             NC1324.2 218
   000560         056300     GO TO SUB-SCRIPT-14C.                                        NC1324.2 565
   000561         056400 SUB-SCRIPT-14B.                                                  NC1324.2
   000562         056500     PERFORM FAIL.                                                NC1324.2 217
   000563         056600     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000564         056700     MOVE "1234" TO CORRECT-A.                                    NC1324.2 91
   000565         056800 SUB-SCRIPT-14C.                                                  NC1324.2
   000566         056900     MOVE  "SUB-SCRIPT-14" TO PAR-NAME.                           NC1324.2 66
   000567         057000     PERFORM  PRINT-DETAIL.                                       NC1324.2 220
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100*    THIS TEST CHECKS THE USE OF SUBSCRIPTED DATA-NAMES           NC1324.2
   000569         057200*    IN A MULTIPLY STATEMENT.                                     NC1324.2
   000570         057300 SUB-SCRIPT-15.                                                   NC1324.2
   000571         057400     MOVE  "1234" TO TABLE-C.                                     NC1324.2 58
   000572         057500     DIVIDE  ENTRY-B-2 (1) INTO ENTRY-C (1).                      NC1324.2 57 59
   000573         057600     DIVIDE  ENTRY-B-2 (2) INTO ENTRY-C (2).                      NC1324.2 57 59
   000574         057700     DIVIDE  ENTRY-B-2 (3) INTO ENTRY-C (3).                      NC1324.2 57 59
   000575         057800     DIVIDE  ENTRY-B-2 (4) INTO ENTRY-C (4).                      NC1324.2 57 59
   000576         057900     IF  TABLE-C  NOT EQUAL TO "1111"                             NC1324.2 58
   000577      1  058000     GO TO  SUB-SCRIPT-15B.                                       NC1324.2 583
   000578         058100     PERFORM PASS.                                                NC1324.2 216
   000579         058200     GO TO SUB-SCRIPT-15C.                                        NC1324.2 587
   000580         058300 SUB-SCRIPT-15A.                                                  NC1324.2
   000581         058400     PERFORM DE-LETE.                                             NC1324.2 218
   000582         058500     GO TO  SUB-SCRIPT-15C.                                       NC1324.2 587
   000583         058600 SUB-SCRIPT-15B.                                                  NC1324.2
   000584         058700     PERFORM FAIL.                                                NC1324.2 217
   000585         058800     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000586         058900     MOVE "1111" TO CORRECT-A.                                    NC1324.2 91
   000587         059000 SUB-SCRIPT-15C.                                                  NC1324.2
   000588         059100     MOVE "SUB-SCRIPT-15" TO PAR-NAME.                            NC1324.2 66
   000589         059200     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000590         059300*    THIS TEST CHECKS THE USE OF SUBSCRIPTED DATA-NAMES           NC1324.2
   000591         059400*    IN A DIVIDE STATEMENT.                                       NC1324.2
   000592         059500     MOVE TABLE-A-VALUES TO TABLE-A.                              NC1324.2 48 50
   000593         059600 SUB-SCRIPT-16.                                                   NC1324.2
   000594         059700     IF ENTRY-A-1 (SUB-3) EQUAL TO "222"                          NC1324.2 51 43
   000595      1  059800         PERFORM PASS                                             NC1324.2 216
   000596      1  059900         GO TO SUB-SCRIPT-16B.                                    NC1324.2 603
   000597         060000     MOVE "222" TO CORRECT-A.                                     NC1324.2 91
   000598         060100     MOVE ENTRY-A-1 (SUB-3) TO COMPUTED-A.                        NC1324.2 51 43 77
   000599         060200     PERFORM FAIL.                                                NC1324.2 217
   000600         060300     GO TO SUB-SCRIPT-16B.                                        NC1324.2 603
   000601         060400 SUB-SCRIPT-16A.                                                  NC1324.2
   000602         060500     PERFORM DE-LETE.                                             NC1324.2 218
   000603         060600 SUB-SCRIPT-16B.                                                  NC1324.2
   000604         060700     MOVE "SUB-SCRIPT-16" TO PAR-NAME.                            NC1324.2 66
   000605         060800*    NOTE  COMPUTATIONAL SUBSCRIPT  USED  S9(18).                 NC1324.2
   000606         060900     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000607         061000 SUB-SCRIPT-17.                                                   NC1324.2
   000608         061100     IF ENTRY-A-2 (SUB-4) EQUAL TO "44"                           NC1324.2 52 44
   000609      1  061200         PERFORM PASS                                             NC1324.2 216
   000610      1  061300         GO TO SUB-SCRIPT-17B.                                    NC1324.2 617
   000611         061400     MOVE "44" TO CORRECT-A.                                      NC1324.2 91
   000612         061500     MOVE ENTRY-A-2 (SUB-4) TO COMPUTED-A.                        NC1324.2 52 44 77
   000613         061600     PERFORM FAIL.                                                NC1324.2 217
   000614         061700     GO TO SUB-SCRIPT-17B.                                        NC1324.2 617
   000615         061800 SUB-SCRIPT-17A.                                                  NC1324.2
   000616         061900     PERFORM DE-LETE.                                             NC1324.2 218
   000617         062000 SUB-SCRIPT-17B.                                                  NC1324.2
   000618         062100     MOVE "SUB-SCRIPT-17" TO PAR-NAME.                            NC1324.2 66
   000619         062200*    NOTE COMPUTATIONAL SUBSCRIPT  USED  9(18).                   NC1324.2
   000620         062300     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000621         062400 SUB-SCRIPT-18.                                                   NC1324.2
   000622         062500     IF ENTRY-A-2 (+4) EQUAL TO "44"                              NC1324.2 52
   000623      1  062600         PERFORM PASS                                             NC1324.2 216
   000624      1  062700         GO TO SUB-SCRIPT-18B.                                    NC1324.2 631
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     MOVE "44" TO CORRECT-A.                                      NC1324.2 91
   000626         062900     MOVE ENTRY-A-2 (+4) TO COMPUTED-A.                           NC1324.2 52 77
   000627         063000     PERFORM FAIL.                                                NC1324.2 217
   000628         063100     GO TO SUB-SCRIPT-18B.                                        NC1324.2 631
   000629         063200 SUB-SCRIPT-18A.                                                  NC1324.2
   000630         063300     PERFORM DE-LETE.                                             NC1324.2 218
   000631         063400 SUB-SCRIPT-18B.                                                  NC1324.2
   000632         063500     MOVE "SUB-SCRIPT-18" TO PAR-NAME.                            NC1324.2 66
   000633         063600*    NOTE SIGNED NUMERIC LITERAL SUBSCRIPT.                       NC1324.2
   000634         063700     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000635         063800 SUB-SCRIPT-19.                                                   NC1324.2
   000636         063900     IF ENTRY-A-3 (CON-2) NOT EQUAL TO "2"                        NC1324.2 53 40
   000637      1  064000     GO TO SUB-SCRIPT-19B.                                        NC1324.2 643
   000638         064100     PERFORM PASS.                                                NC1324.2 216
   000639         064200     GO TO SUB-SCRIPT-19C.                                        NC1324.2 647
   000640         064300 SUB-SCRIPT-19A.                                                  NC1324.2
   000641         064400     PERFORM DE-LETE.                                             NC1324.2 218
   000642         064500     GO TO SUB-SCRIPT-19C.                                        NC1324.2 647
   000643         064600 SUB-SCRIPT-19B.                                                  NC1324.2
   000644         064700     PERFORM FAIL.                                                NC1324.2 217
   000645         064800     MOVE ENTRY-A-3 (CON-2) TO COMPUTED-A.                        NC1324.2 53 40 77
   000646         064900     MOVE "2" TO CORRECT-A.                                       NC1324.2 91
   000647         065000 SUB-SCRIPT-19C.                                                  NC1324.2
   000648         065100     MOVE "SUB-SCRIPT-19" TO PAR-NAME.                            NC1324.2 66
   000649         065200     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000650         065300*    NOTE  *****  THIS CHECKS THE USE OF AN ELEMENTARY ITEM       NC1324.2
   000651         065400*                 WHEN THE GROUP ITEM HAS THE OCCURS.             NC1324.2
   000652         065500 SUB-SCRIPT-20.                                                   NC1324.2
   000653         065600     IF ENTRY-A-2 (CON-4) NOT EQUAL TO "44"                       NC1324.2 52 42
   000654      1  065700     GO TO SUB-SCRIPT-20B.                                        NC1324.2 660
   000655         065800     PERFORM PASS.                                                NC1324.2 216
   000656         065900     GO TO SUB-SCRIPT-20C.                                        NC1324.2 664
   000657         066000 SUB-SCRIPT-20A.                                                  NC1324.2
   000658         066100     PERFORM DE-LETE.                                             NC1324.2 218
   000659         066200     GO TO SUB-SCRIPT-20C.                                        NC1324.2 664
   000660         066300 SUB-SCRIPT-20B.                                                  NC1324.2
   000661         066400     PERFORM FAIL.                                                NC1324.2 217
   000662         066500     MOVE ENTRY-A-2 (CON-4) TO COMPUTED-A.                        NC1324.2 52 42 77
   000663         066600     MOVE "44" TO CORRECT-A.                                      NC1324.2 91
   000664         066700 SUB-SCRIPT-20C.                                                  NC1324.2
   000665         066800     MOVE "SUB-SCRIPT-20" TO PAR-NAME.                            NC1324.2 66
   000666         066900     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000667         067000*    NOTE  *******  THIS CHECKS A GROUP ITEM WHEN IT              NC1324.2
   000668         067100*                   HAS THE OCCURS.                               NC1324.2
   000669         067200 SUB-SCRIPT-21.                                                   NC1324.2
   000670         067300     IF ENTRY-B-2 (CON-1) NOT EQUAL TO "1"                        NC1324.2 57 39
   000671      1  067400     GO TO SUB-SCRIPT-21B.                                        NC1324.2 677
   000672         067500     PERFORM PASS.                                                NC1324.2 216
   000673         067600     GO TO SUB-SCRIPT-21C.                                        NC1324.2 681
   000674         067700 SUB-SCRIPT-21A.                                                  NC1324.2
   000675         067800     PERFORM DE-LETE.                                             NC1324.2 218
   000676         067900     GO TO SUB-SCRIPT-21C.                                        NC1324.2 681
   000677         068000 SUB-SCRIPT-21B.                                                  NC1324.2
   000678         068100     PERFORM FAIL.                                                NC1324.2 217
   000679         068200     MOVE ENTRY-B-2 (CON-1) TO COMPUTED-A.                        NC1324.2 57 39 77
   000680         068300     MOVE "1" TO CORRECT-A.                                       NC1324.2 91
   000681         068400 SUB-SCRIPT-21C.                                                  NC1324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     MOVE "SUB-SCRIPT-21" TO PAR-NAME.                            NC1324.2 66
   000683         068600     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000684         068700*    USE OF ITEM WHICH IS DEFINED WITH BOTH THE REDEFINES         NC1324.2
   000685         068800*    AND THE OCCURS CLAUSE.                                       NC1324.2
   000686         068900 SUB-SCRIPT-22.                                                   NC1324.2
   000687         069000     MOVE ENTRY-B-2 (CON-1) TO ENTRY-C (CON-4).                   NC1324.2 57 39 59 42
   000688         069100     MOVE ENTRY-B-2 (CON-2) TO ENTRY-C (CON-3).                   NC1324.2 57 40 59 41
   000689         069200     MOVE ENTRY-B-2 (CON-3) TO ENTRY-C (CON-2).                   NC1324.2 57 41 59 40
   000690         069300     MOVE ENTRY-B-2 (CON-4) TO ENTRY-C (CON-1).                   NC1324.2 57 42 59 39
   000691         069400     IF TABLE-C    NOT  EQUAL TO "4321"                           NC1324.2 58
   000692      1  069500     GO TO SUB-SCRIPT-22B.                                        NC1324.2 698
   000693         069600     PERFORM PASS.                                                NC1324.2 216
   000694         069700     GO TO SUB-SCRIPT-22C.                                        NC1324.2 702
   000695         069800 SUB-SCRIPT-22A.                                                  NC1324.2
   000696         069900     PERFORM DE-LETE.                                             NC1324.2 218
   000697         070000     GO TO SUB-SCRIPT-22C.                                        NC1324.2 702
   000698         070100 SUB-SCRIPT-22B.                                                  NC1324.2
   000699         070200     PERFORM FAIL.                                                NC1324.2 217
   000700         070300     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000701         070400     MOVE "4321" TO CORRECT-A.                                    NC1324.2 91
   000702         070500 SUB-SCRIPT-22C.                                                  NC1324.2
   000703         070600     MOVE "SUB-SCRIPT-22" TO PAR-NAME.                            NC1324.2 66
   000704         070700     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000705         070800 SUB-SCRIPT-23.                                                   NC1324.2
   000706         070900     MOVE "0000" TO TABLE-C.                                      NC1324.2 58
   000707         071000     ADD ENTRY-B-2 (CON-1) TO ENTRY-C (CON-1).                    NC1324.2 57 39 59 39
   000708         071100     ADD ENTRY-B-2 (CON-2) TO ENTRY-C (CON-2).                    NC1324.2 57 40 59 40
   000709         071200     ADD ENTRY-B-2 (CON-3) TO ENTRY-C (CON-3).                    NC1324.2 57 41 59 41
   000710         071300     ADD ENTRY-B-2 (CON-4) TO ENTRY-C (CON-4).                    NC1324.2 57 42 59 42
   000711         071400     IF TABLE-C NOT EQUAL TO "1234"                               NC1324.2 58
   000712      1  071500     GO TO SUB-SCRIPT-23B.                                        NC1324.2 718
   000713         071600     PERFORM PASS.                                                NC1324.2 216
   000714         071700     GO TO SUB-SCRIPT-23C.                                        NC1324.2 722
   000715         071800 SUB-SCRIPT-23A.                                                  NC1324.2
   000716         071900     PERFORM DE-LETE.                                             NC1324.2 218
   000717         072000     GO TO SUB-SCRIPT-23C.                                        NC1324.2 722
   000718         072100 SUB-SCRIPT-23B.                                                  NC1324.2
   000719         072200     PERFORM FAIL.                                                NC1324.2 217
   000720         072300     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000721         072400     MOVE "1234" TO CORRECT-A.                                    NC1324.2 91
   000722         072500 SUB-SCRIPT-23C.                                                  NC1324.2
   000723         072600     MOVE "SUB-SCRIPT-23" TO PAR-NAME.                            NC1324.2 66
   000724         072700     PERFORM  PRINT-DETAIL.                                       NC1324.2 220
   000725         072800*    ADD STATEMENTS WITH UNSIGNED NUMERIC ITEMS AS SUBSCRIPTS.    NC1324.2
   000726         072900 SUB-SCRIPT-24.                                                   NC1324.2
   000727         073000     MOVE  "1234" TO TABLE-C.                                     NC1324.2 58
   000728         073100     SUBTRACT ENTRY-B-2 (CON-1) FROM ENTRY-C (CON-1).             NC1324.2 57 39 59 39
   000729         073200     SUBTRACT ENTRY-B-2 (CON-2) FROM ENTRY-C (CON-2).             NC1324.2 57 40 59 40
   000730         073300     SUBTRACT ENTRY-B-2 (CON-3) FROM ENTRY-C (CON-3).             NC1324.2 57 41 59 41
   000731         073400     SUBTRACT ENTRY-B-2 (CON-4) FROM ENTRY-C (CON-4).             NC1324.2 57 42 59 42
   000732         073500     IF TABLE-C  NOT EQUAL TO  "0000"                             NC1324.2 58
   000733      1  073600     GO TO  SUB-SCRIPT-24B.                                       NC1324.2 739
   000734         073700     PERFORM PASS.                                                NC1324.2 216
   000735         073800     GO TO SUB-SCRIPT-24C.                                        NC1324.2 743
   000736         073900 SUB-SCRIPT-24A.                                                  NC1324.2
   000737         074000     PERFORM DE-LETE.                                             NC1324.2 218
   000738         074100     GO TO SUB-SCRIPT-24C.                                        NC1324.2 743
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 SUB-SCRIPT-24B.                                                  NC1324.2
   000740         074300     PERFORM FAIL.                                                NC1324.2 217
   000741         074400     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000742         074500     MOVE "0000" TO CORRECT-A.                                    NC1324.2 91
   000743         074600 SUB-SCRIPT-24C.                                                  NC1324.2
   000744         074700     MOVE "SUB-SCRIPT-24" TO PAR-NAME.                            NC1324.2 66
   000745         074800     PERFORM  PRINT-DETAIL.                                       NC1324.2 220
   000746         074900*    SUBSTRACT STATEMENTS WITH UNSIGNED NUMERIC ITEMS AS SUBSCRIPTNC1324.2
   000747         075000 SUB-SCRIPT-25.                                                   NC1324.2
   000748         075100     MOVE "1111" TO TABLE-C.                                      NC1324.2 58
   000749         075200     MULTIPLY ENTRY-B-2 (CON-1) BY ENTRY-C (CON-1).               NC1324.2 57 39 59 39
   000750         075300     MULTIPLY ENTRY-B-2 (CON-2) BY ENTRY-C (CON-2).               NC1324.2 57 40 59 40
   000751         075400     MULTIPLY ENTRY-B-2 (CON-3) BY ENTRY-C (CON-3).               NC1324.2 57 41 59 41
   000752         075500     MULTIPLY ENTRY-B-2 (CON-4) BY ENTRY-C (CON-4).               NC1324.2 57 42 59 42
   000753         075600     IF TABLE-C  NOT EQUAL TO "1234"                              NC1324.2 58
   000754      1  075700     GO TO SUB-SCRIPT-25B.                                        NC1324.2 760
   000755         075800     PERFORM PASS.                                                NC1324.2 216
   000756         075900     GO TO SUB-SCRIPT-25C.                                        NC1324.2 764
   000757         076000 SUB-SCRIPT-25A.                                                  NC1324.2
   000758         076100     PERFORM DE-LETE.                                             NC1324.2 218
   000759         076200     GO TO SUB-SCRIPT-25C.                                        NC1324.2 764
   000760         076300 SUB-SCRIPT-25B.                                                  NC1324.2
   000761         076400     PERFORM FAIL.                                                NC1324.2 217
   000762         076500     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000763         076600     MOVE "1234" TO CORRECT-A.                                    NC1324.2 91
   000764         076700 SUB-SCRIPT-25C.                                                  NC1324.2
   000765         076800     MOVE  "SUB-SCRIPT-25" TO PAR-NAME.                           NC1324.2 66
   000766         076900     PERFORM  PRINT-DETAIL.                                       NC1324.2 220
   000767         077000*    MULTIPLY STATEMENTS WITH UNSIGNED NUMERIC ITEMS AS SUBSCRIPTSNC1324.2
   000768         077100 SUB-SCRIPT-26.                                                   NC1324.2
   000769         077200     MOVE  "1234" TO TABLE-C.                                     NC1324.2 58
   000770         077300     DIVIDE ENTRY-B-2 (CON-1) INTO ENTRY-C (CON-1).               NC1324.2 57 39 59 39
   000771         077400     DIVIDE ENTRY-B-2 (CON-2) INTO ENTRY-C (CON-2).               NC1324.2 57 40 59 40
   000772         077500     DIVIDE ENTRY-B-2 (CON-3) INTO ENTRY-C (CON-3).               NC1324.2 57 41 59 41
   000773         077600     DIVIDE ENTRY-B-2 (CON-4) INTO ENTRY-C (CON-4).               NC1324.2 57 42 59 42
   000774         077700     IF  TABLE-C  NOT EQUAL TO "1111"                             NC1324.2 58
   000775      1  077800     GO TO  SUB-SCRIPT-26B.                                       NC1324.2 781
   000776         077900     PERFORM PASS.                                                NC1324.2 216
   000777         078000     GO TO SUB-SCRIPT-26C.                                        NC1324.2 785
   000778         078100 SUB-SCRIPT-26A.                                                  NC1324.2
   000779         078200     PERFORM DE-LETE.                                             NC1324.2 218
   000780         078300     GO TO  SUB-SCRIPT-26C.                                       NC1324.2 785
   000781         078400 SUB-SCRIPT-26B.                                                  NC1324.2
   000782         078500     PERFORM FAIL.                                                NC1324.2 217
   000783         078600     MOVE TABLE-C TO COMPUTED-A.                                  NC1324.2 58 77
   000784         078700     MOVE "1111" TO CORRECT-A.                                    NC1324.2 91
   000785         078800 SUB-SCRIPT-26C.                                                  NC1324.2
   000786         078900     MOVE "SUB-SCRIPT-26" TO PAR-NAME.                            NC1324.2 66
   000787         079000     PERFORM PRINT-DETAIL.                                        NC1324.2 220
   000788         079100*    DIVIDE STATEMENTS WITH UNSIGNED NUMERIC ITEMS AS SUBSCRIPTS. NC1324.2
   000789         079200 CCVS-EXIT SECTION.                                               NC1324.2
   000790         079300 CCVS-999999.                                                     NC1324.2
   000791         079400     GO TO CLOSE-FILES.                                           NC1324.2 209
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    17
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      122   ANSI-REFERENCE . . . . . . . .  299 306 315 M323
      101   CCVS-C-1 . . . . . . . . . . .  238 284
      106   CCVS-C-2 . . . . . . . . . . .  239 285
      156   CCVS-E-1 . . . . . . . . . . .  244
      161   CCVS-E-2 . . . . . . . . . . .  253 260 267 272
      164   CCVS-E-2-2 . . . . . . . . . .  M252
      169   CCVS-E-3 . . . . . . . . . . .  273
      178   CCVS-E-4 . . . . . . . . . . .  252
      179   CCVS-E-4-1 . . . . . . . . . .  M250
      181   CCVS-E-4-2 . . . . . . . . . .  M251
      123   CCVS-H-1 . . . . . . . . . . .  233 280
      128   CCVS-H-2A. . . . . . . . . . .  234 281
      137   CCVS-H-2B. . . . . . . . . . .  235 282
      149   CCVS-H-3 . . . . . . . . . . .  236 283
      199   CCVS-PGM-ID. . . . . . . . . .  205 205
       83   CM-18V0
       77   COMPUTED-A . . . . . . . . . .  78 80 81 82 83 311 314 M336 M354 M371 M389 M407 M425 M445 M462 M479 M499 M519
                                            M541 M563 M585 M598 M612 M626 M645 M662 M679 M700 M720 M741 M762 M783
       78   COMPUTED-N
       76   COMPUTED-X . . . . . . . . . .  M228 296
       80   COMPUTED-0V18
       82   COMPUTED-14V4
       84   COMPUTED-18V0
       81   COMPUTED-4V14
       39   CON-1. . . . . . . . . . . . .  670 679 687 690 707 707 728 728 749 749 770 770
       40   CON-2. . . . . . . . . . . . .  636 645 688 689 708 708 729 729 750 750 771 771
       41   CON-3. . . . . . . . . . . . .  688 689 709 709 730 730 751 751 772 772
       42   CON-4. . . . . . . . . . . . .  653 662 687 690 710 710 731 731 752 752 773 773
       45   CONSTANTS-77
      100   COR-ANSI-REFERENCE . . . . . .  M306 M308
       91   CORRECT-A. . . . . . . . . . .  92 93 94 95 96 312 314 M337 M355 M372 M390 M408 M426 M446 M463 M480 M500 M520
                                            M542 M564 M586 M597 M611 M625 M646 M663 M680 M701 M721 M742 M763 M784
       92   CORRECT-N
       90   CORRECT-X. . . . . . . . . . .  M229 298
       93   CORRECT-0V18
       95   CORRECT-14V4
       97   CORRECT-18V0
       94   CORRECT-4V14
       96   CR-18V0
      114   DELETE-COUNTER . . . . . . . .  M218 247 263 265
       69   DOTVALUE . . . . . . . . . . .  M223
      120   DUMMY-HOLD . . . . . . . . . .  M277 287
       37   DUMMY-RECORD . . . . . . . . .  M233 M234 M235 M236 M238 M239 M240 M242 M244 M253 M260 M267 M272 M273 277 M278
                                            279 M280 M281 M282 M283 M284 M285 M286 M287 291 M292 M301 M316
      167   ENDER-DESC . . . . . . . . . .  M255 M266 M271
       51   ENTRY-A-1. . . . . . . . . . .  345 354 362 371 380 389 398 407 416 425 594 598
       52   ENTRY-A-2. . . . . . . . . . .  453 462 608 612 622 626 653 662
       53   ENTRY-A-3. . . . . . . . . . .  436 445 636 645
       54   ENTRY-A-4
       56   ENTRY-B-1. . . . . . . . . . .  57
       57   ENTRY-B-2. . . . . . . . . . .  470 479 486 487 488 489 506 507 508 509 528 529 530 531 550 551 552 553 572 573
                                            574 575 670 679 687 688 689 690 707 708 709 710 728 729 730 731 749 750 751 752
                                            770 771 772 773
       59   ENTRY-C. . . . . . . . . . . .  M486 M487 M488 M489 M506 M507 M508 M509 M528 M529 M530 M531 M550 M551 M552 M553
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    18
0 Defined   Cross-reference of data names   References

0                                           M572 M573 M574 M575 M687 M688 M689 M690 M707 M708 M709 M710 M728 M729 M730 M731
                                            M749 M750 M751 M752 M770 M771 M772 M773
      115   ERROR-COUNTER. . . . . . . . .  M217 246 256 259
      119   ERROR-HOLD . . . . . . . . . .  M246 M247 M247 M248 251
      165   ERROR-TOTAL. . . . . . . . . .  M257 M259 M264 M265 M269 M270
       62   FEATURE. . . . . . . . . . . .  M325
      193   HYPHEN-LINE. . . . . . . . . .  240 242 286
      159   ID-AGAIN . . . . . . . . . . .  M205
      192   INF-ANSI-REFERENCE . . . . . .  M299 M302 M315 M317
      187   INFO-TEXT. . . . . . . . . . .  M300
      116   INSPECT-COUNTER. . . . . . . .  M215 246 268 270
       64   P-OR-F . . . . . . . . . . . .  M215 M216 M217 M218 225 M228
       66   PAR-NAME . . . . . . . . . . .  M230 M339 M357 M374 M392 M410 M428 M448 M465 M482 M502 M522 M544 M566 M588 M604
                                            M618 M632 M648 M665 M682 M703 M723 M744 M765 M786
       68   PARDOT-X . . . . . . . . . . .  M222
      117   PASS-COUNTER . . . . . . . . .  M216 248 250
       35   PRINT-FILE . . . . . . . . . .  31 204 210
       36   PRINT-REC. . . . . . . . . . .  M224 M305 M307
       71   RE-MARK. . . . . . . . . . . .  M219 M231
      113   REC-CT . . . . . . . . . . . .  221 223 230
      112   REC-SKL-SUB
      121   RECORD-COUNT . . . . . . . . .  M275 276 M288
       43   SUB-3. . . . . . . . . . . . .  594 598
       44   SUB-4. . . . . . . . . . . . .  608 612
       46   SUB1 . . . . . . . . . . . . .  362 371 M379 380 389
       47   SUB2 . . . . . . . . . . . . .  M397 398 407 M415 416 425
       50   TABLE-A. . . . . . . . . . . .  M324 327 336 M592
       48   TABLE-A-VALUES . . . . . . . .  324 327 592
       55   TABLE-B
       58   TABLE-C. . . . . . . . . . . .  490 499 M505 510 519 M527 532 541 M549 554 563 M571 576 585 691 700 M706 711
                                            720 M727 732 741 M748 753 762 M769 774 783
       72   TEST-COMPUTED. . . . . . . . .  305
       87   TEST-CORRECT . . . . . . . . .  307
      140   TEST-ID. . . . . . . . . . . .  M205
       60   TEST-RESULTS . . . . . . . . .  M206 224
      118   TOTAL-ERROR
      189   XXCOMPUTED . . . . . . . . . .  M314
      191   XXCORRECT. . . . . . . . . . .  M314
      184   XXINFO . . . . . . . . . . . .  301 316
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    19
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

      310   BAIL-OUT . . . . . . . . . . .  P227
      318   BAIL-OUT-EX. . . . . . . . . .  E227 G312
      313   BAIL-OUT-WRITE . . . . . . . .  G311
      293   BLANK-LINE-PRINT
      789   CCVS-EXIT
      790   CCVS-999999
      202   CCVS1
      319   CCVS1-EXIT . . . . . . . . . .  G208
      209   CLOSE-FILES. . . . . . . . . .  G791
      237   COLUMN-NAMES-ROUTINE . . . . .  E207
      218   DE-LETE. . . . . . . . . . . .  P332 P350 P367 P385 P403 P421 P441 P458 P475 P495 P515 P537 P559 P581 P602 P616
                                            P630 P641 P658 P675 P696 P716 P737 P758 P779
      241   END-ROUTINE. . . . . . . . . .  P210
      245   END-ROUTINE-1
      254   END-ROUTINE-12
      262   END-ROUTINE-13 . . . . . . . .  E210
      243   END-RTN-EXIT
      217   FAIL . . . . . . . . . . . . .  P335 P353 P370 P388 P406 P424 P444 P461 P478 P498 P518 P540 P562 P584 P599 P613
                                            P627 P644 P661 P678 P699 P719 P740 P761 P782
      295   FAIL-ROUTINE . . . . . . . . .  P226
      309   FAIL-ROUTINE-EX. . . . . . . .  E226 G303
      304   FAIL-ROUTINE-WRITE . . . . . .  G297 G298
      232   HEAD-ROUTINE . . . . . . . . .  P207
      215   INSPT
      203   OPEN-FILES
      216   PASS . . . . . . . . . . . . .  P329 P347 P364 P382 P400 P418 P438 P455 P472 P492 P512 P534 P556 P578 P595 P609
                                            P623 P638 P655 P672 P693 P713 P734 P755 P776
      220   PRINT-DETAIL . . . . . . . . .  P340 P358 P375 P393 P411 P429 P449 P466 P483 P503 P523 P545 P567 P589 P606 P620
                                            P634 P649 P666 P683 P704 P724 P745 P766 P787
      321   SECT-TH132A-001
      326   SUB-SCRIPT-1
      331   SUB-SCRIPT-1A
      334   SUB-SCRIPT-1B. . . . . . . . .  G328
      338   SUB-SCRIPT-1C. . . . . . . . .  G330 G333
      469   SUB-SCRIPT-10
      474   SUB-SCRIPT-10A
      477   SUB-SCRIPT-10B . . . . . . . .  G471
      481   SUB-SCRIPT-10C . . . . . . . .  G473 G476
      485   SUB-SCRIPT-11
      494   SUB-SCRIPT-11A
      497   SUB-SCRIPT-11B . . . . . . . .  G491
      501   SUB-SCRIPT-11C . . . . . . . .  G493 G496
      504   SUB-SCRIPT-12
      514   SUB-SCRIPT-12A
      517   SUB-SCRIPT-12B . . . . . . . .  G511
      521   SUB-SCRIPT-12C . . . . . . . .  G513 G516
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    20
0 Defined   Cross-reference of procedures   References

0     526   SUB-SCRIPT-13
      536   SUB-SCRIPT-13A
      539   SUB-SCRIPT-13B . . . . . . . .  G533
      543   SUB-SCRIPT-13C . . . . . . . .  G535 G538
      548   SUB-SCRIPT-14
      558   SUB-SCRIPT-14A
      561   SUB-SCRIPT-14B . . . . . . . .  G555
      565   SUB-SCRIPT-14C . . . . . . . .  G557 G560
      570   SUB-SCRIPT-15
      580   SUB-SCRIPT-15A
      583   SUB-SCRIPT-15B . . . . . . . .  G577
      587   SUB-SCRIPT-15C . . . . . . . .  G579 G582
      593   SUB-SCRIPT-16
      601   SUB-SCRIPT-16A
      603   SUB-SCRIPT-16B . . . . . . . .  G596 G600
      607   SUB-SCRIPT-17
      615   SUB-SCRIPT-17A
      617   SUB-SCRIPT-17B . . . . . . . .  G610 G614
      621   SUB-SCRIPT-18
      629   SUB-SCRIPT-18A
      631   SUB-SCRIPT-18B . . . . . . . .  G624 G628
      635   SUB-SCRIPT-19
      640   SUB-SCRIPT-19A
      643   SUB-SCRIPT-19B . . . . . . . .  G637
      647   SUB-SCRIPT-19C . . . . . . . .  G639 G642
      344   SUB-SCRIPT-2
      349   SUB-SCRIPT-2A
      352   SUB-SCRIPT-2B. . . . . . . . .  G346
      356   SUB-SCRIPT-2C. . . . . . . . .  G348 G351
      652   SUB-SCRIPT-20
      657   SUB-SCRIPT-20A
      660   SUB-SCRIPT-20B . . . . . . . .  G654
      664   SUB-SCRIPT-20C . . . . . . . .  G656 G659
      669   SUB-SCRIPT-21
      674   SUB-SCRIPT-21A
      677   SUB-SCRIPT-21B . . . . . . . .  G671
      681   SUB-SCRIPT-21C . . . . . . . .  G673 G676
      686   SUB-SCRIPT-22
      695   SUB-SCRIPT-22A
      698   SUB-SCRIPT-22B . . . . . . . .  G692
      702   SUB-SCRIPT-22C . . . . . . . .  G694 G697
      705   SUB-SCRIPT-23
      715   SUB-SCRIPT-23A
      718   SUB-SCRIPT-23B . . . . . . . .  G712
      722   SUB-SCRIPT-23C . . . . . . . .  G714 G717
      726   SUB-SCRIPT-24
      736   SUB-SCRIPT-24A
      739   SUB-SCRIPT-24B . . . . . . . .  G733
      743   SUB-SCRIPT-24C . . . . . . . .  G735 G738
      747   SUB-SCRIPT-25
      757   SUB-SCRIPT-25A
      760   SUB-SCRIPT-25B . . . . . . . .  G754
      764   SUB-SCRIPT-25C . . . . . . . .  G756 G759
      768   SUB-SCRIPT-26
      778   SUB-SCRIPT-26A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    21
0 Defined   Cross-reference of procedures   References

0     781   SUB-SCRIPT-26B . . . . . . . .  G775
      785   SUB-SCRIPT-26C . . . . . . . .  G777 G780
      361   SUB-SCRIPT-3
      366   SUB-SCRIPT-3A
      369   SUB-SCRIPT-3B. . . . . . . . .  G363
      373   SUB-SCRIPT-3C. . . . . . . . .  G365 G368
      378   SUB-SCRIPT-4
      384   SUB-SCRIPT-4A
      387   SUB-SCRIPT-4B. . . . . . . . .  G381
      391   SUB-SCRIPT-4C. . . . . . . . .  G383 G386
      396   SUB-SCRIPT-5
      402   SUB-SCRIPT-5A
      405   SUB-SCRIPT-5B. . . . . . . . .  G399
      409   SUB-SCRIPT-5C. . . . . . . . .  G401 G404
      414   SUB-SCRIPT-6
      420   SUB-SCRIPT-6A
      423   SUB-SCRIPT-6B. . . . . . . . .  G417
      427   SUB-SCRIPT-6C. . . . . . . . .  G419 G422
      435   SUB-SCRIPT-8
      440   SUB-SCRIPT-8A
      443   SUB-SCRIPT-8B. . . . . . . . .  G437
      447   SUB-SCRIPT-8C. . . . . . . . .  G439 G442
      452   SUB-SCRIPT-9
      457   SUB-SCRIPT-9A
      460   SUB-SCRIPT-9B. . . . . . . . .  G454
      464   SUB-SCRIPT-9C. . . . . . . . .  G456 G459
      213   TERMINATE-CALL
      211   TERMINATE-CCVS
      322   TH-02-001
      274   WRITE-LINE . . . . . . . . . .  P224 P225 P233 P234 P235 P236 P238 P239 P240 P242 P244 P253 P261 P267 P272 P273
                                            P301 P305 P307 P316
      290   WRT-LN . . . . . . . . . . . .  P280 P281 P282 P283 P284 P285 P286 P289 P294
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    22
0 Defined   Cross-reference of programs     References

        3   NC132A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC132A    Date 06/04/2022  Time 11:58:02   Page    23
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC132A:
 *    Source records = 791
 *    Data Division statements = 83
 *    Procedure Division statements = 463
 *    Generated COBOL statements = 0
 *    Program complexity factor = 473
0End of compilation 1,  program NC132A,  highest severity 0.
0Return code 0
