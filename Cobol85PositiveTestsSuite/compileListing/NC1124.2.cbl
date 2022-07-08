1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:00   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:00   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1124.2
   000002         000200 PROGRAM-ID.                                                      NC1124.2
   000003         000300     NC112A.                                                      NC1124.2
   000004         000500*                                                              *  NC1124.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1124.2
   000006         000700*                                                              *  NC1124.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1124.2
   000008         000900*                                                              *  NC1124.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1124.2
   000010         001100*                                                              *  NC1124.2
   000011         001300*                                                              *  NC1124.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1124.2
   000013         001500*                                                              *  NC1124.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1124.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1124.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1124.2
   000017         001900*                                                              *  NC1124.2
   000018         002100*                                                                 NC1124.2
   000019         002200*    PROGRAM NC112A TESTS THE USE OF MULTIPLE OPERANDS WITH       NC1124.2
   000020         002300*           THE ADD, SUBTRACT AND MOVE STATEMENTS.                NC1124.2
   000021         002400*                                                                 NC1124.2
   000022         002500 ENVIRONMENT DIVISION.                                            NC1124.2
   000023         002600 CONFIGURATION SECTION.                                           NC1124.2
   000024         002700 SOURCE-COMPUTER.                                                 NC1124.2
   000025         002800     XXXXX082.                                                    NC1124.2
   000026         002900 OBJECT-COMPUTER.                                                 NC1124.2
   000027         003000     XXXXX083.                                                    NC1124.2
   000028         003100 INPUT-OUTPUT SECTION.                                            NC1124.2
   000029         003200 FILE-CONTROL.                                                    NC1124.2
   000030         003300     SELECT PRINT-FILE ASSIGN TO                                  NC1124.2 34
   000031         003400     XXXXX055.                                                    NC1124.2
   000032         003500 DATA DIVISION.                                                   NC1124.2
   000033         003600 FILE SECTION.                                                    NC1124.2
   000034         003700 FD  PRINT-FILE.                                                  NC1124.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003800 01  PRINT-REC PICTURE X(120).                                    NC1124.2
   000036         003900 01  DUMMY-RECORD PICTURE X(120).                                 NC1124.2
   000037         004000 WORKING-STORAGE SECTION.                                         NC1124.2
   000038         004100 77  ACCUM-1  PICTURE 9(17) VALUE ZERO.                           NC1124.2 IMP
   000039         004200 77  ACCUM-2   PICTURE 9(18)  VALUE ZERO.                         NC1124.2 IMP
   000040         004300 77  ACCUM-3   PICTURE 9V9(3)  VALUE 1.                           NC1124.2
   000041         004400 77  ACCUM-4   PICTURE 9V9(3)  VALUE ZERO.                        NC1124.2 IMP
   000042         004500 01  D-NAMES.                                                     NC1124.2
   000043         004600     02  DNAME-1                 PICTURE 9   VALUE 1.             NC1124.2
   000044         004700     02  DNAME-2                 PICTURE 9(3)  VALUE 1.           NC1124.2
   000045         004800     02  DNAME-3                 PICTURE 9(5)  VALUE 1.           NC1124.2
   000046         004900     02  DNAME-4                 PICTURE 9(7)  VALUE 1.           NC1124.2
   000047         005000     02  DNAME-5                 PICTURE 9(9)  VALUE 1.           NC1124.2
   000048         005100     02  DNAME-6                 PICTURE 9(11) VALUE 1.           NC1124.2
   000049         005200     02  DNAME-7                 PICTURE 9(13) VALUE 1.           NC1124.2
   000050         005300     02  DNAME-8                 PICTURE 9(15) VALUE 1.           NC1124.2
   000051         005400     02  DNAME-9                 PICTURE 9(17) VALUE 1.           NC1124.2
   000052         005500     02  DNAME-10                PICTURE 9(18) VALUE 1.           NC1124.2
   000053         005600 01  TEST-RESULTS.                                                NC1124.2
   000054         005700     02 FILLER                   PIC X      VALUE SPACE.          NC1124.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1124.2 IMP
   000056         005900     02 FILLER                   PIC X      VALUE SPACE.          NC1124.2 IMP
   000057         006000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1124.2 IMP
   000058         006100     02 FILLER                   PIC X      VALUE SPACE.          NC1124.2 IMP
   000059         006200     02  PAR-NAME.                                                NC1124.2
   000060         006300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1124.2 IMP
   000061         006400       03  PARDOT-X              PIC X      VALUE SPACE.          NC1124.2 IMP
   000062         006500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1124.2 IMP
   000063         006600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1124.2 IMP
   000064         006700     02 RE-MARK                  PIC X(61).                       NC1124.2
   000065         006800 01  TEST-COMPUTED.                                               NC1124.2
   000066         006900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1124.2 IMP
   000067         007000     02 FILLER                   PIC X(17)  VALUE                 NC1124.2
   000068         007100            "       COMPUTED=".                                   NC1124.2
   000069         007200     02 COMPUTED-X.                                               NC1124.2
   000070         007300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1124.2 IMP
   000071         007400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1124.2 70
   000072         007500                                 PIC -9(9).9(9).                  NC1124.2
   000073         007600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1124.2 70
   000074         007700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1124.2 70
   000075         007800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1124.2 70
   000076         007900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1124.2 70
   000077         008000         04 COMPUTED-18V0                    PIC -9(18).          NC1124.2
   000078         008100         04 FILLER                           PIC X.               NC1124.2
   000079         008200     03 FILLER PIC X(50) VALUE SPACE.                             NC1124.2 IMP
   000080         008300 01  TEST-CORRECT.                                                NC1124.2
   000081         008400     02 FILLER PIC X(30) VALUE SPACE.                             NC1124.2 IMP
   000082         008500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1124.2
   000083         008600     02 CORRECT-X.                                                NC1124.2
   000084         008700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1124.2 IMP
   000085         008800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1124.2 84
   000086         008900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1124.2 84
   000087         009000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1124.2 84
   000088         009100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1124.2 84
   000089         009200     03      CR-18V0 REDEFINES CORRECT-A.                         NC1124.2 84
   000090         009300         04 CORRECT-18V0                     PIC -9(18).          NC1124.2
   000091         009400         04 FILLER                           PIC X.               NC1124.2
   000092         009500     03 FILLER PIC X(2) VALUE SPACE.                              NC1124.2 IMP
   000093         009600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1124.2 IMP
   000094         009700 01  CCVS-C-1.                                                    NC1124.2
   000095         009800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1124.2
   000096         009900-    "SS  PARAGRAPH-NAME                                          NC1124.2
   000097         010000-    "       REMARKS".                                            NC1124.2
   000098         010100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1124.2 IMP
   000099         010200 01  CCVS-C-2.                                                    NC1124.2
   000100         010300     02 FILLER                     PIC X        VALUE SPACE.      NC1124.2 IMP
   000101         010400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1124.2
   000102         010500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1124.2 IMP
   000103         010600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1124.2
   000104         010700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1124.2 IMP
   000105         010800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1124.2 IMP
   000106         010900 01  REC-CT                        PIC 99       VALUE ZERO.       NC1124.2 IMP
   000107         011000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1124.2 IMP
   000108         011100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1124.2 IMP
   000109         011200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1124.2 IMP
   000110         011300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1124.2 IMP
   000111         011400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1124.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1124.2 IMP
   000113         011600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1124.2 IMP
   000114         011700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1124.2 IMP
   000115         011800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1124.2 IMP
   000116         011900 01  CCVS-H-1.                                                    NC1124.2
   000117         012000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1124.2 IMP
   000118         012100     02  FILLER                    PIC X(42)    VALUE             NC1124.2
   000119         012200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1124.2
   000120         012300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1124.2 IMP
   000121         012400 01  CCVS-H-2A.                                                   NC1124.2
   000122         012500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1124.2 IMP
   000123         012600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1124.2
   000124         012700   02  FILLER                        PIC XXXX   VALUE             NC1124.2
   000125         012800     "4.2 ".                                                      NC1124.2
   000126         012900   02  FILLER                        PIC X(28)  VALUE             NC1124.2
   000127         013000            " COPY - NOT FOR DISTRIBUTION".                       NC1124.2
   000128         013100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1124.2 IMP
   000129         013200                                                                  NC1124.2
   000130         013300 01  CCVS-H-2B.                                                   NC1124.2
   000131         013400   02  FILLER                        PIC X(15)  VALUE             NC1124.2
   000132         013500            "TEST RESULT OF ".                                    NC1124.2
   000133         013600   02  TEST-ID                       PIC X(9).                    NC1124.2
   000134         013700   02  FILLER                        PIC X(4)   VALUE             NC1124.2
   000135         013800            " IN ".                                               NC1124.2
   000136         013900   02  FILLER                        PIC X(12)  VALUE             NC1124.2
   000137         014000     " HIGH       ".                                              NC1124.2
   000138         014100   02  FILLER                        PIC X(22)  VALUE             NC1124.2
   000139         014200            " LEVEL VALIDATION FOR ".                             NC1124.2
   000140         014300   02  FILLER                        PIC X(58)  VALUE             NC1124.2
   000141         014400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1124.2
   000142         014500 01  CCVS-H-3.                                                    NC1124.2
   000143         014600     02  FILLER                      PIC X(34)  VALUE             NC1124.2
   000144         014700            " FOR OFFICIAL USE ONLY    ".                         NC1124.2
   000145         014800     02  FILLER                      PIC X(58)  VALUE             NC1124.2
   000146         014900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1124.2
   000147         015000     02  FILLER                      PIC X(28)  VALUE             NC1124.2
   000148         015100            "  COPYRIGHT   1985 ".                                NC1124.2
   000149         015200 01  CCVS-E-1.                                                    NC1124.2
   000150         015300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1124.2 IMP
   000151         015400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1124.2
   000152         015500     02 ID-AGAIN                     PIC X(9).                    NC1124.2
   000153         015600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1124.2 IMP
   000154         015700 01  CCVS-E-2.                                                    NC1124.2
   000155         015800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1124.2 IMP
   000156         015900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1124.2 IMP
   000157         016000     02 CCVS-E-2-2.                                               NC1124.2
   000158         016100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1124.2 IMP
   000159         016200         03 FILLER                   PIC X      VALUE SPACE.      NC1124.2 IMP
   000160         016300         03 ENDER-DESC               PIC X(44)  VALUE             NC1124.2
   000161         016400            "ERRORS ENCOUNTERED".                                 NC1124.2
   000162         016500 01  CCVS-E-3.                                                    NC1124.2
   000163         016600     02  FILLER                      PIC X(22)  VALUE             NC1124.2
   000164         016700            " FOR OFFICIAL USE ONLY".                             NC1124.2
   000165         016800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1124.2 IMP
   000166         016900     02  FILLER                      PIC X(58)  VALUE             NC1124.2
   000167         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1124.2
   000168         017100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1124.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 FILLER                       PIC X(15)  VALUE             NC1124.2
   000170         017300             " COPYRIGHT 1985".                                   NC1124.2
   000171         017400 01  CCVS-E-4.                                                    NC1124.2
   000172         017500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1124.2 IMP
   000173         017600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1124.2
   000174         017700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1124.2 IMP
   000175         017800     02 FILLER                       PIC X(40)  VALUE             NC1124.2
   000176         017900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1124.2
   000177         018000 01  XXINFO.                                                      NC1124.2
   000178         018100     02 FILLER                       PIC X(19)  VALUE             NC1124.2
   000179         018200            "*** INFORMATION ***".                                NC1124.2
   000180         018300     02 INFO-TEXT.                                                NC1124.2
   000181         018400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1124.2 IMP
   000182         018500       04 XXCOMPUTED                 PIC X(20).                   NC1124.2
   000183         018600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1124.2 IMP
   000184         018700       04 XXCORRECT                  PIC X(20).                   NC1124.2
   000185         018800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1124.2
   000186         018900 01  HYPHEN-LINE.                                                 NC1124.2
   000187         019000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1124.2 IMP
   000188         019100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1124.2
   000189         019200-    "*****************************************".                 NC1124.2
   000190         019300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1124.2
   000191         019400-    "******************************".                            NC1124.2
   000192         019500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1124.2
   000193         019600     "NC112A".                                                    NC1124.2
   000194         019700 PROCEDURE DIVISION.                                              NC1124.2
   000195         019800 CCVS1 SECTION.                                                   NC1124.2
   000196         019900 OPEN-FILES.                                                      NC1124.2
   000197         020000     OPEN     OUTPUT PRINT-FILE.                                  NC1124.2 34
   000198         020100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1124.2 192 133 192 152
   000199         020200     MOVE    SPACE TO TEST-RESULTS.                               NC1124.2 IMP 53
   000200         020300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1124.2 225 230
   000201         020400     GO TO CCVS1-EXIT.                                            NC1124.2 312
   000202         020500 CLOSE-FILES.                                                     NC1124.2
   000203         020600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1124.2 234 255 34
   000204         020700 TERMINATE-CCVS.                                                  NC1124.2
   000205         020800     EXIT PROGRAM.                                                NC1124.2
   000206         020900 TERMINATE-CALL.                                                  NC1124.2
   000207         021000     STOP     RUN.                                                NC1124.2
   000208         021100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1124.2 57 109
   000209         021200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1124.2 57 110
   000210         021300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1124.2 57 108
   000211         021400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1124.2 57 107
   000212         021500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1124.2 64
   000213         021600 PRINT-DETAIL.                                                    NC1124.2
   000214         021700     IF REC-CT NOT EQUAL TO ZERO                                  NC1124.2 106 IMP
   000215      1  021800             MOVE "." TO PARDOT-X                                 NC1124.2 61
   000216      1  021900             MOVE REC-CT TO DOTVALUE.                             NC1124.2 106 62
   000217         022000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1124.2 53 35 267
   000218         022100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1124.2 57 267
   000219      1  022200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1124.2 288 302
   000220      1  022300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1124.2 303 311
   000221         022400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1124.2 IMP 57 IMP 69
   000222         022500     MOVE SPACE TO CORRECT-X.                                     NC1124.2 IMP 83
   000223         022600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1124.2 106 IMP IMP 59
   000224         022700     MOVE     SPACE TO RE-MARK.                                   NC1124.2 IMP 64
   000225         022800 HEAD-ROUTINE.                                                    NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1124.2 116 36 267
   000227         023000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1124.2 121 36 267
   000228         023100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1124.2 130 36 267
   000229         023200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1124.2 142 36 267
   000230         023300 COLUMN-NAMES-ROUTINE.                                            NC1124.2
   000231         023400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1124.2 94 36 267
   000232         023500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1124.2 99 36 267
   000233         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1124.2 186 36 267
   000234         023700 END-ROUTINE.                                                     NC1124.2
   000235         023800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1124.2 186 36 267
   000236         023900 END-RTN-EXIT.                                                    NC1124.2
   000237         024000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1124.2 149 36 267
   000238         024100 END-ROUTINE-1.                                                   NC1124.2
   000239         024200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1124.2 108 112 109
   000240         024300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1124.2 112 107 112
   000241         024400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1124.2 110 112
   000242         024500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1124.2
   000243         024600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1124.2 110 172
   000244         024700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1124.2 112 174
   000245         024800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1124.2 171 157
   000246         024900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1124.2 154 36 267
   000247         025000  END-ROUTINE-12.                                                 NC1124.2
   000248         025100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1124.2 160
   000249         025200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1124.2 108 IMP
   000250      1  025300         MOVE "NO " TO ERROR-TOTAL                                NC1124.2 158
   000251         025400         ELSE                                                     NC1124.2
   000252      1  025500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1124.2 108 158
   000253         025600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1124.2 154 36
   000254         025700     PERFORM WRITE-LINE.                                          NC1124.2 267
   000255         025800 END-ROUTINE-13.                                                  NC1124.2
   000256         025900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1124.2 107 IMP
   000257      1  026000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1124.2 158
   000258      1  026100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1124.2 107 158
   000259         026200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1124.2 160
   000260         026300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1124.2 154 36 267
   000261         026400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1124.2 109 IMP
   000262      1  026500          MOVE "NO " TO ERROR-TOTAL                               NC1124.2 158
   000263      1  026600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1124.2 109 158
   000264         026700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1124.2 160
   000265         026800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1124.2 154 36 267
   000266         026900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1124.2 162 36 267
   000267         027000 WRITE-LINE.                                                      NC1124.2
   000268         027100     ADD 1 TO RECORD-COUNT.                                       NC1124.2 114
   000269         027200     IF RECORD-COUNT GREATER 42                                   NC1124.2 114
   000270      1  027300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1124.2 36 113
   000271      1  027400         MOVE SPACE TO DUMMY-RECORD                               NC1124.2 IMP 36
   000272      1  027500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1124.2 36
   000273      1  027600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1124.2 116 36 283
   000274      1  027700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1124.2 121 36 283
   000275      1  027800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1124.2 130 36 283
   000276      1  027900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1124.2 142 36 283
   000277      1  028000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1124.2 94 36 283
   000278      1  028100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1124.2 99 36 283
   000279      1  028200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1124.2 186 36 283
   000280      1  028300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1124.2 113 36
   000281      1  028400         MOVE ZERO TO RECORD-COUNT.                               NC1124.2 IMP 114
   000282         028500     PERFORM WRT-LN.                                              NC1124.2 283
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600 WRT-LN.                                                          NC1124.2
   000284         028700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1124.2 36
   000285         028800     MOVE SPACE TO DUMMY-RECORD.                                  NC1124.2 IMP 36
   000286         028900 BLANK-LINE-PRINT.                                                NC1124.2
   000287         029000     PERFORM WRT-LN.                                              NC1124.2 283
   000288         029100 FAIL-ROUTINE.                                                    NC1124.2
   000289         029200     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1124.2 69 IMP
   000290      1  029300            GO TO FAIL-ROUTINE-WRITE.                             NC1124.2 297
   000291         029400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1124.2 83 IMP 297
   000292         029500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1124.2 115 185
   000293         029600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1124.2 180
   000294         029700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1124.2 177 36 267
   000295         029800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1124.2 IMP 185
   000296         029900     GO TO  FAIL-ROUTINE-EX.                                      NC1124.2 302
   000297         030000 FAIL-ROUTINE-WRITE.                                              NC1124.2
   000298         030100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1124.2 65 35 267
   000299         030200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1124.2 115 93
   000300         030300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1124.2 80 35 267
   000301         030400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1124.2 IMP 93
   000302         030500 FAIL-ROUTINE-EX. EXIT.                                           NC1124.2
   000303         030600 BAIL-OUT.                                                        NC1124.2
   000304         030700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1124.2 70 IMP 306
   000305         030800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1124.2 84 IMP 311
   000306         030900 BAIL-OUT-WRITE.                                                  NC1124.2
   000307         031000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1124.2 84 184 70 182
   000308         031100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1124.2 115 185
   000309         031200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1124.2 177 36 267
   000310         031300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1124.2 IMP 185
   000311         031400 BAIL-OUT-EX. EXIT.                                               NC1124.2
   000312         031500 CCVS1-EXIT.                                                      NC1124.2
   000313         031600     EXIT.                                                        NC1124.2
   000314         031700 SECT-NC112A-001 SECTION.                                         NC1124.2
   000315         031800 ADD-INIT-F1-1.                                                   NC1124.2
   000316         031900     MOVE   "V1-74 6.6.4 GR1,2" TO ANSI-REFERENCE.                NC1124.2 115
   000317         032000     MOVE    0 TO ACCUM-1.                                        NC1124.2 38
   000318         032100     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000319         032200     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000320         032300     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000321         032400     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000322         032500     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000323         032600     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000324         032700     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000325         032800     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000326         032900     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000327         033000     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000328         033100 ADD-TEST-F1-1-0.                                                 NC1124.2
   000329         033200     ADD DNAME-1                                                  NC1124.2 43
   000330         033300         DNAME-2                                                  NC1124.2 44
   000331         033400         DNAME-3                                                  NC1124.2 45
   000332         033500         DNAME-4                                                  NC1124.2 46
   000333         033600         DNAME-5                                                  NC1124.2 47
   000334         033700         DNAME-6                                                  NC1124.2 48
   000335         033800         DNAME-7                                                  NC1124.2 49
   000336         033900         DNAME-8                                                  NC1124.2 50
   000337         034000         DNAME-9                                                  NC1124.2 51
   000338         034100         DNAME-10 TO ACCUM-1.                                     NC1124.2 52 38
   000339         034200 ADD-TEST-F1-1-1.                                                 NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     IF ACCUM-1 EQUAL TO 10                                       NC1124.2 38
   000341      1  034400         PERFORM PASS                                             NC1124.2 209
   000342      1  034500         GO TO ADD-WRITE-F1-1.                                    NC1124.2 349
   000343         034600     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000344         034700     MOVE 10 TO CORRECT-A.                                        NC1124.2 84
   000345         034800     PERFORM FAIL.                                                NC1124.2 210
   000346         034900     GO TO ADD-WRITE-F1-1.                                        NC1124.2 349
   000347         035000 ADD-DELETE-F1-1.                                                 NC1124.2
   000348         035100     PERFORM DE-LETE.                                             NC1124.2 211
   000349         035200 ADD-WRITE-F1-1.                                                  NC1124.2
   000350         035300     MOVE "ADD LIMITS TESTS" TO FEATURE.                          NC1124.2 55
   000351         035400     MOVE "ADD-TEST-F1-1" TO PAR-NAME.                            NC1124.2 59
   000352         035500     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000353         035600 ADD-INIT-F1-2.                                                   NC1124.2
   000354         035700     MOVE   "V1-74 6.6.4 GR1,2" TO ANSI-REFERENCE.                NC1124.2 115
   000355         035800     MOVE    0 TO ACCUM-1.                                        NC1124.2 38
   000356         035900     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000357         036000     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000358         036100     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000359         036200     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000360         036300     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000361         036400     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000362         036500     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000363         036600     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000364         036700     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000365         036800     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000366         036900 ADD-TEST-F1-2-0.                                                 NC1124.2
   000367         037000     ADD DNAME-1                                                  NC1124.2 43
   000368         037100         DNAME-2                                                  NC1124.2 44
   000369         037200         DNAME-3                                                  NC1124.2 45
   000370         037300         DNAME-4                                                  NC1124.2 46
   000371         037400         DNAME-5                                                  NC1124.2 47
   000372         037500         DNAME-6                                                  NC1124.2 48
   000373         037600         DNAME-7                                                  NC1124.2 49
   000374         037700         DNAME-8                                                  NC1124.2 50
   000375         037800         DNAME-9                                                  NC1124.2 51
   000376         037900         DNAME-10 TO ACCUM-1 ROUNDED ON SIZE ERROR                NC1124.2 52 38
   000377      1  038000             MOVE 0 TO ACCUM-1.                                   NC1124.2 38
   000378         038100 ADD-TEST-F1-2-1.                                                 NC1124.2
   000379         038200     IF ACCUM-1 EQUAL TO 10                                       NC1124.2 38
   000380      1  038300         PERFORM PASS                                             NC1124.2 209
   000381      1  038400         GO TO ADD-WRITE-F1-2.                                    NC1124.2 388
   000382         038500     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000383         038600     MOVE 10 TO CORRECT-A.                                        NC1124.2 84
   000384         038700     PERFORM FAIL.                                                NC1124.2 210
   000385         038800     GO TO ADD-WRITE-F1-2.                                        NC1124.2 388
   000386         038900 ADD-DELETE-F1-2.                                                 NC1124.2
   000387         039000     PERFORM DE-LETE.                                             NC1124.2 211
   000388         039100 ADD-WRITE-F1-2.                                                  NC1124.2
   000389         039200     MOVE "ADD-TEST-F1-2" TO PAR-NAME.                            NC1124.2 59
   000390         039300     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000391         039400 ADD-INIT-F2-1.                                                   NC1124.2
   000392         039500     MOVE   "V1-74 6.6.4 GR1,2" TO ANSI-REFERENCE.                NC1124.2 115
   000393         039600     MOVE    0 TO ACCUM-1.                                        NC1124.2 38
   000394         039700     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000395         039800     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000396         039900     MOVE    1 TO DNAME-3.                                        NC1124.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000398         040100     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000399         040200     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000400         040300     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000401         040400     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000402         040500     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000403         040600     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000404         040700 ADD-TEST-F2-1-0.                                                 NC1124.2
   000405         040800     ADD DNAME-1                                                  NC1124.2 43
   000406         040900         DNAME-2                                                  NC1124.2 44
   000407         041000         DNAME-3                                                  NC1124.2 45
   000408         041100         DNAME-4                                                  NC1124.2 46
   000409         041200         DNAME-5                                                  NC1124.2 47
   000410         041300         DNAME-6                                                  NC1124.2 48
   000411         041400         DNAME-7                                                  NC1124.2 49
   000412         041500         DNAME-8                                                  NC1124.2 50
   000413         041600         DNAME-9                                                  NC1124.2 51
   000414         041700         DNAME-10  GIVING ACCUM-1.                                NC1124.2 52 38
   000415         041800 ADD-TEST-F2-1-1.                                                 NC1124.2
   000416         041900     IF ACCUM-1 EQUAL TO 10                                       NC1124.2 38
   000417      1  042000         PERFORM PASS                                             NC1124.2 209
   000418      1  042100         GO TO ADD-WRITE-F2-1.                                    NC1124.2 425
   000419         042200     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000420         042300     MOVE 10 TO CORRECT-A.                                        NC1124.2 84
   000421         042400     PERFORM FAIL.                                                NC1124.2 210
   000422         042500     GO TO ADD-WRITE-F2-1.                                        NC1124.2 425
   000423         042600 ADD-DELETE-F2-1.                                                 NC1124.2
   000424         042700     PERFORM DE-LETE.                                             NC1124.2 211
   000425         042800 ADD-WRITE-F2-1.                                                  NC1124.2
   000426         042900     MOVE "ADD-TEST-F2-1" TO PAR-NAME.                            NC1124.2 59
   000427         043000     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000428         043100 ADD-INIT-F2-2.                                                   NC1124.2
   000429         043200     MOVE   "V1-74 6.6.4 GR1,2" TO ANSI-REFERENCE.                NC1124.2 115
   000430         043300     MOVE    1 TO ACCUM-1.                                        NC1124.2 38
   000431         043400     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000432         043500     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000433         043600     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000434         043700     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000435         043800     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000436         043900     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000437         044000     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000438         044100     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000439         044200     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000440         044300     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000441         044400 ADD-TEST-F2-2-0.                                                 NC1124.2
   000442         044500     ADD DNAME-1                                                  NC1124.2 43
   000443         044600         DNAME-2                                                  NC1124.2 44
   000444         044700         DNAME-3                                                  NC1124.2 45
   000445         044800         DNAME-4                                                  NC1124.2 46
   000446         044900         DNAME-5                                                  NC1124.2 47
   000447         045000         DNAME-6                                                  NC1124.2 48
   000448         045100         DNAME-7                                                  NC1124.2 49
   000449         045200         DNAME-8                                                  NC1124.2 50
   000450         045300         DNAME-9                                                  NC1124.2 51
   000451         045400         DNAME-10 GIVING ACCUM-1 ROUNDED  ON SIZE ERROR           NC1124.2 52 38
   000452      1  045500         MOVE 0 TO ACCUM-1.                                       NC1124.2 38
   000453         045600 ADD-TEST-F2-2-1.                                                 NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     IF ACCUM-1 EQUAL TO 10                                       NC1124.2 38
   000455      1  045800         PERFORM PASS                                             NC1124.2 209
   000456      1  045900         GO TO ADD-WRITE-F2-2.                                    NC1124.2 463
   000457         046000     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000458         046100     MOVE 10 TO CORRECT-A.                                        NC1124.2 84
   000459         046200     PERFORM FAIL.                                                NC1124.2 210
   000460         046300     GO TO ADD-WRITE-F2-2.                                        NC1124.2 463
   000461         046400 ADD-DELETE-F2-2.                                                 NC1124.2
   000462         046500     PERFORM DE-LETE.                                             NC1124.2 211
   000463         046600 ADD-WRITE-F2-2.                                                  NC1124.2
   000464         046700     MOVE "ADD-TEST-F2-2" TO PAR-NAME.                            NC1124.2 59
   000465         046800     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000466         046900 ADD-INIT-F1-3.                                                   NC1124.2
   000467         047000     MOVE   "V1-74 6.6.4 GR1,2" TO ANSI-REFERENCE.                NC1124.2 115
   000468         047100     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000469         047200     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000470         047300     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000471         047400     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000472         047500     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000473         047600     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000474         047700     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000475         047800     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000476         047900     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000477         048000     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000478         048100 ADD-TEST-F1-3-0.                                                 NC1124.2
   000479         048200     ADD DNAME-2                                                  NC1124.2 44
   000480         048300         DNAME-3                                                  NC1124.2 45
   000481         048400         DNAME-4                                                  NC1124.2 46
   000482         048500         DNAME-5                                                  NC1124.2 47
   000483         048600         DNAME-6                                                  NC1124.2 48
   000484         048700         DNAME-7                                                  NC1124.2 49
   000485         048800         DNAME-8                                                  NC1124.2 50
   000486         048900         DNAME-9                                                  NC1124.2 51
   000487         049000         DNAME-10 TO DNAME-1                                      NC1124.2 52 43
   000488         049100      ON SIZE ERROR                                               NC1124.2
   000489      1  049200         PERFORM PASS                                             NC1124.2 209
   000490      1  049300         GO TO   ADD-WRITE-F1-3.                                  NC1124.2 498
   000491         049400     MOVE "SIZE ERROR EXPECTED" TO RE-MARK.                       NC1124.2 64
   000492         049500     MOVE DNAME-1 TO COMPUTED-A.                                  NC1124.2 43 70
   000493         049600     MOVE "UNCHANGED (STILL 1)" TO CORRECT-A.                     NC1124.2 84
   000494         049700     PERFORM FAIL.                                                NC1124.2 210
   000495         049800     GO TO ADD-WRITE-F1-3.                                        NC1124.2 498
   000496         049900 ADD-DELETE-F1-3.                                                 NC1124.2
   000497         050000     PERFORM DE-LETE.                                             NC1124.2 211
   000498         050100 ADD-WRITE-F1-3.                                                  NC1124.2
   000499         050200     MOVE "ADD-TEST-F1-3" TO PAR-NAME.                            NC1124.2 59
   000500         050300     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000501         050400 ADD-INIT-F2-3.                                                   NC1124.2
   000502         050500     MOVE   "V1-74 6.6.4 GR1,2" TO ANSI-REFERENCE.                NC1124.2 115
   000503         050600     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000504         050700     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000505         050800     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000506         050900     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000507         051000     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000508         051100     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000509         051200     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000510         051300     MOVE    1 TO DNAME-8.                                        NC1124.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000512         051500     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000513         051600 ADD-TEST-F2-3-0.                                                 NC1124.2
   000514         051700     ADD DNAME-1                                                  NC1124.2 43
   000515         051800         DNAME-2                                                  NC1124.2 44
   000516         051900         DNAME-3                                                  NC1124.2 45
   000517         052000         DNAME-4                                                  NC1124.2 46
   000518         052100         DNAME-5                                                  NC1124.2 47
   000519         052200         DNAME-6                                                  NC1124.2 48
   000520         052300         DNAME-7                                                  NC1124.2 49
   000521         052400         DNAME-8                                                  NC1124.2 50
   000522         052500         DNAME-9                                                  NC1124.2 51
   000523         052600         DNAME-10  GIVING DNAME-1 ON SIZE ERROR                   NC1124.2 52 43
   000524      1  052700         PERFORM PASS                                             NC1124.2 209
   000525      1  052800         GO TO ADD-WRITE-F2-3.                                    NC1124.2 533
   000526         052900     MOVE "SIZE ERROR EXPECTED" TO RE-MARK.                       NC1124.2 64
   000527         053000     MOVE "UNCHANGED (STILL 1)" TO CORRECT-A.                     NC1124.2 84
   000528         053100     MOVE DNAME-1 TO COMPUTED-A.                                  NC1124.2 43 70
   000529         053200     PERFORM FAIL.                                                NC1124.2 210
   000530         053300     GO TO ADD-WRITE-F2-3.                                        NC1124.2 533
   000531         053400 ADD-DELETE-F2-3.                                                 NC1124.2
   000532         053500     PERFORM DE-LETE.                                             NC1124.2 211
   000533         053600 ADD-WRITE-F2-3.                                                  NC1124.2
   000534         053700     MOVE "ADD-TEST-F2-3" TO PAR-NAME.                            NC1124.2 59
   000535         053800     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000536         053900 SUB-INIT-F1-1.                                                   NC1124.2
   000537         054000     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000538         054100     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000539         054200     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000540         054300     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000541         054400     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000542         054500     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000543         054600     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000544         054700     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000545         054800     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000546         054900     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000547         055000     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000548         055100     MOVE   10 TO ACCUM-1.                                        NC1124.2 38
   000549         055200 SUB-TEST-F1-1-0.                                                 NC1124.2
   000550         055300     SUBTRACT DNAME-1                                             NC1124.2 43
   000551         055400              DNAME-2                                             NC1124.2 44
   000552         055500              DNAME-3                                             NC1124.2 45
   000553         055600              DNAME-4                                             NC1124.2 46
   000554         055700              DNAME-5                                             NC1124.2 47
   000555         055800              DNAME-6                                             NC1124.2 48
   000556         055900              DNAME-7                                             NC1124.2 49
   000557         056000              DNAME-8                                             NC1124.2 50
   000558         056100              DNAME-9                                             NC1124.2 51
   000559         056200              DNAME-10 FROM ACCUM-1.                              NC1124.2 52 38
   000560         056300 SUB-TEST-F1-1-1.                                                 NC1124.2
   000561         056400     IF ACCUM-1 EQUAL TO ZERO                                     NC1124.2 38 IMP
   000562      1  056500         PERFORM PASS                                             NC1124.2 209
   000563      1  056600         GO TO SUB-WRITE-F1-1.                                    NC1124.2 570
   000564         056700     MOVE 0 TO CORRECT-A.                                         NC1124.2 84
   000565         056800     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000566         056900     PERFORM FAIL.                                                NC1124.2 210
   000567         057000     GO TO SUB-WRITE-F1-1.                                        NC1124.2 570
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100 SUB-DELETE-F1-1.                                                 NC1124.2
   000569         057200     PERFORM DE-LETE.                                             NC1124.2 211
   000570         057300 SUB-WRITE-F1-1.                                                  NC1124.2
   000571         057400     MOVE "SUBTRACT LIMITS" TO FEATURE.                           NC1124.2 55
   000572         057500     PERFORM END-ROUTINE.                                         NC1124.2 234
   000573         057600     MOVE "SUB-TEST-F1-1" TO PAR-NAME.                            NC1124.2 59
   000574         057700     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000575         057800 SUB-INIT-F2-1.                                                   NC1124.2
   000576         057900     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000577         058000     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000578         058100     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000579         058200     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000580         058300     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000581         058400     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000582         058500     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000583         058600     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000584         058700     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000585         058800     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000586         058900     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000587         059000     MOVE   10 TO ACCUM-1.                                        NC1124.2 38
   000588         059100 SUB-TEST-F2-1-0.                                                 NC1124.2
   000589         059200     SUBTRACT DNAME-1                                             NC1124.2 43
   000590         059300              DNAME-2                                             NC1124.2 44
   000591         059400              DNAME-3                                             NC1124.2 45
   000592         059500              DNAME-4                                             NC1124.2 46
   000593         059600              DNAME-5                                             NC1124.2 47
   000594         059700              DNAME-6                                             NC1124.2 48
   000595         059800              DNAME-7                                             NC1124.2 49
   000596         059900              DNAME-8                                             NC1124.2 50
   000597         060000              DNAME-9                                             NC1124.2 51
   000598         060100              DNAME-10 FROM ACCUM-1 GIVING ACCUM-1.               NC1124.2 52 38 38
   000599         060200 SUB-TEST-F2-1-1.                                                 NC1124.2
   000600         060300     IF ACCUM-1 EQUAL TO 0                                        NC1124.2 38
   000601      1  060400         PERFORM PASS                                             NC1124.2 209
   000602      1  060500         GO TO SUB-WRITE-F2-1.                                    NC1124.2 609
   000603         060600     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000604         060700     MOVE 0 TO CORRECT-A.                                         NC1124.2 84
   000605         060800     PERFORM FAIL.                                                NC1124.2 210
   000606         060900     GO TO SUB-WRITE-F2-1.                                        NC1124.2 609
   000607         061000 SUB-DELETE-F2-1.                                                 NC1124.2
   000608         061100     PERFORM DE-LETE.                                             NC1124.2 211
   000609         061200 SUB-WRITE-F2-1.                                                  NC1124.2
   000610         061300     MOVE "SUB-TEST-F2-1" TO PAR-NAME.                            NC1124.2 59
   000611         061400     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000612         061500 SUB-INIT-F2-2.                                                   NC1124.2
   000613         061600     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000614         061700     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000615         061800     MOVE    1 TO DNAME-2.                                        NC1124.2 44
   000616         061900     MOVE    1 TO DNAME-3.                                        NC1124.2 45
   000617         062000     MOVE    1 TO DNAME-4.                                        NC1124.2 46
   000618         062100     MOVE    1 TO DNAME-5.                                        NC1124.2 47
   000619         062200     MOVE    1 TO DNAME-6.                                        NC1124.2 48
   000620         062300     MOVE    1 TO DNAME-7.                                        NC1124.2 49
   000621         062400     MOVE    1 TO DNAME-8.                                        NC1124.2 50
   000622         062500     MOVE    1 TO DNAME-9.                                        NC1124.2 51
   000623         062600     MOVE    1 TO DNAME-10.                                       NC1124.2 52
   000624         062700 SUB-TEST-F2-2-0.                                                 NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     SUBTRACT DNAME-2                                             NC1124.2 44
   000626         062900              DNAME-3                                             NC1124.2 45
   000627         063000              DNAME-4                                             NC1124.2 46
   000628         063100              DNAME-5                                             NC1124.2 47
   000629         063200              DNAME-6                                             NC1124.2 48
   000630         063300              DNAME-7                                             NC1124.2 49
   000631         063400              DNAME-8                                             NC1124.2 50
   000632         063500              DNAME-9                                             NC1124.2 51
   000633         063600              DNAME-10 FROM 100 GIVING DNAME-1 ON SIZE ERROR      NC1124.2 52 43
   000634      1  063700         PERFORM PASS                                             NC1124.2 209
   000635      1  063800         GO TO SUB-WRITE-F2-2.                                    NC1124.2 643
   000636         063900     MOVE "UNCHANGED (STILL 1)" TO CORRECT-A.                     NC1124.2 84
   000637         064000     MOVE DNAME-1 TO COMPUTED-A.                                  NC1124.2 43 70
   000638         064100     PERFORM FAIL.                                                NC1124.2 210
   000639         064200     MOVE "SIZE ERROR EXPECTED" TO RE-MARK.                       NC1124.2 64
   000640         064300     GO TO SUB-WRITE-F2-2.                                        NC1124.2 643
   000641         064400 SUB-DELETE-F2-2.                                                 NC1124.2
   000642         064500     PERFORM DE-LETE.                                             NC1124.2 211
   000643         064600 SUB-WRITE-F2-2.                                                  NC1124.2
   000644         064700     MOVE "SUB-TEST-F2-2" TO PAR-NAME.                            NC1124.2 59
   000645         064800     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000646         064900 SUB-INIT-F2-3.                                                   NC1124.2
   000647         065000     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000648         065100     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000649         065200     MOVE  100 TO ACCUM-1.                                        NC1124.2 38
   000650         065300 SUB-TEST-F2-3.                                                   NC1124.2
   000651         065400     SUBTRACT DNAME-1                                             NC1124.2 43
   000652         065500              1                                                   NC1124.2
   000653         065600              DNAME-1                                             NC1124.2 43
   000654         065700              DNAME-1                                             NC1124.2 43
   000655         065800              DNAME-1                                             NC1124.2 43
   000656         065900              1                                                   NC1124.2
   000657         066000              -1                                                  NC1124.2
   000658         066100              1                                                   NC1124.2
   000659         066200              1        FROM 7 GIVING ACCUM-1.                     NC1124.2 38
   000660         066300     IF ACCUM-1 EQUAL TO 0                                        NC1124.2 38
   000661      1  066400         PERFORM PASS                                             NC1124.2 209
   000662      1  066500         GO TO SUB-WRITE-F2-3.                                    NC1124.2 669
   000663         066600     MOVE 0 TO CORRECT-A.                                         NC1124.2 84
   000664         066700     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000665         066800     PERFORM FAIL.                                                NC1124.2 210
   000666         066900     GO TO SUB-WRITE-F2-3.                                        NC1124.2 669
   000667         067000 SUB-DELETE-F2-3.                                                 NC1124.2
   000668         067100     PERFORM DE-LETE.                                             NC1124.2 211
   000669         067200 SUB-WRITE-F2-3.                                                  NC1124.2
   000670         067300     MOVE "SUB-TEST-F2-3" TO PAR-NAME.                            NC1124.2 59
   000671         067400     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000672         067500 SUB-INIT-F1-2.                                                   NC1124.2
   000673         067600     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000674         067700     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000675         067800     MOVE   10 TO ACCUM-1.                                        NC1124.2 38
   000676         067900     MOVE    1 TO ACCUM-3.                                        NC1124.2 40
   000677         068000 SUB-TEST-F1-2-0.                                                 NC1124.2
   000678         068100     SUBTRACT DNAME-1                                             NC1124.2 43
   000679         068200                    .5                                            NC1124.2
   000680         068300                    .5                                            NC1124.2
   000681         068400                    .5                                            NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500                    .5                                            NC1124.2
   000683         068600                    .5                                            NC1124.2
   000684         068700                    .5                                            NC1124.2
   000685         068800                    .5                                            NC1124.2
   000686         068900                    .5                                            NC1124.2
   000687         069000                    .5 FROM ACCUM-1 ROUNDED.                      NC1124.2 38
   000688         069100 SUB-TEST-F1-2-1.                                                 NC1124.2
   000689         069200     IF ACCUM-1 EQUAL TO 5                                        NC1124.2 38
   000690      1  069300         PERFORM PASS                                             NC1124.2 209
   000691      1  069400         GO TO SUB-WRITE-F1-2.                                    NC1124.2 698
   000692         069500     MOVE ACCUM-1 TO COMPUTED-A.                                  NC1124.2 38 70
   000693         069600     MOVE 5 TO CORRECT-A.                                         NC1124.2 84
   000694         069700     PERFORM FAIL.                                                NC1124.2 210
   000695         069800     GO TO SUB-WRITE-F1-2.                                        NC1124.2 698
   000696         069900 SUB-DELETE-F1-2.                                                 NC1124.2
   000697         070000     PERFORM DE-LETE.                                             NC1124.2 211
   000698         070100 SUB-WRITE-F1-2.                                                  NC1124.2
   000699         070200     MOVE "SUB-TEST-F1-2" TO PAR-NAME.                            NC1124.2 59
   000700         070300     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000701         070400 SUB-INIT-F2-4.                                                   NC1124.2
   000702         070500     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000703         070600     MOVE    1 TO DNAME-1.                                        NC1124.2 43
   000704         070700     MOVE   10 TO ACCUM-1.                                        NC1124.2 38
   000705         070800     MOVE    1 TO ACCUM-2.                                        NC1124.2 39
   000706         070900 SUB-TEST-F2-4-0.                                                 NC1124.2
   000707         071000     SUBTRACT DNAME-1                                             NC1124.2 43
   000708         071100                    .5                                            NC1124.2
   000709         071200                    .5                                            NC1124.2
   000710         071300                    .5                                            NC1124.2
   000711         071400                    .5                                            NC1124.2
   000712         071500                    .5                                            NC1124.2
   000713         071600                    .5                                            NC1124.2
   000714         071700                    .5                                            NC1124.2
   000715         071800                    .5                                            NC1124.2
   000716         071900                    .5 FROM ACCUM-1 GIVING ACCUM-2 ROUNDED.       NC1124.2 38 39
   000717         072000 SUB-TEST-F2-4-1.                                                 NC1124.2
   000718         072100     IF ACCUM-2 EQUAL TO 5                                        NC1124.2 39
   000719      1  072200         PERFORM PASS                                             NC1124.2 209
   000720      1  072300         GO TO SUB-WRITE-F2-4.                                    NC1124.2 727
   000721         072400     MOVE ACCUM-2 TO COMPUTED-A.                                  NC1124.2 39 70
   000722         072500     MOVE 5 TO CORRECT-A.                                         NC1124.2 84
   000723         072600     PERFORM FAIL.                                                NC1124.2 210
   000724         072700     GO TO SUB-WRITE-F2-4.                                        NC1124.2 727
   000725         072800 SUB-DELETE-F2-4.                                                 NC1124.2
   000726         072900     PERFORM DE-LETE.                                             NC1124.2 211
   000727         073000 SUB-WRITE-F2-4.                                                  NC1124.2
   000728         073100     MOVE "SUB-TEST-F2-4" TO PAR-NAME.                            NC1124.2 59
   000729         073200     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000730         073300 MOVE-INIT-F1-1-1.                                                NC1124.2
   000731         073400     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000732         073500     MOVE    ZERO TO D-NAMES.                                     NC1124.2 IMP 42
   000733         073600     MOVE    1 TO ACCUM-3.                                        NC1124.2 40
   000734         073700 MOVE-TEST-F1-1-1.                                                NC1124.2
   000735         073800     MOVE ACCUM-3 TO                                              NC1124.2 40
   000736         073900             DNAME-1                                              NC1124.2 43
   000737         074000             DNAME-2                                              NC1124.2 44
   000738         074100             DNAME-3                                              NC1124.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200             DNAME-4                                              NC1124.2 46
   000740         074300             DNAME-5                                              NC1124.2 47
   000741         074400             DNAME-6                                              NC1124.2 48
   000742         074500             DNAME-7                                              NC1124.2 49
   000743         074600             DNAME-8                                              NC1124.2 50
   000744         074700             DNAME-9                                              NC1124.2 51
   000745         074800             DNAME-10.                                            NC1124.2 52
   000746         074900 MOVE-TEST-F1-1-1-1.                                              NC1124.2
   000747         075000     IF DNAME-1 EQUAL TO 1                                        NC1124.2 43
   000748      1  075100         PERFORM PASS                                             NC1124.2 209
   000749      1  075200         GO TO MOVE-WRITE-F1-1-1.                                 NC1124.2 756
   000750         075300     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000751         075400     MOVE DNAME-1 TO COMPUTED-N.                                  NC1124.2 43 71
   000752         075500     PERFORM FAIL.                                                NC1124.2 210
   000753         075600     GO TO MOVE-WRITE-F1-1-1.                                     NC1124.2 756
   000754         075700 MOVE-DELETE-F1-1-1.                                              NC1124.2
   000755         075800     PERFORM DE-LETE.                                             NC1124.2 211
   000756         075900 MOVE-WRITE-F1-1-1.                                               NC1124.2
   000757         076000     MOVE "MOVE LIMITS TESTS" TO FEATURE.                         NC1124.2 55
   000758         076100     PERFORM END-ROUTINE.                                         NC1124.2 234
   000759         076200     MOVE "MOVE-TEST-F1-1-1" TO PAR-NAME.                         NC1124.2 59
   000760         076300     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000761         076400 MOVE-TEST-F1-1-2.                                                NC1124.2
   000762         076500     IF DNAME-2 EQUAL TO 1                                        NC1124.2 44
   000763      1  076600         PERFORM PASS                                             NC1124.2 209
   000764      1  076700         GO TO MOVE-WRITE-F1-1-2.                                 NC1124.2 771
   000765         076800     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000766         076900     MOVE DNAME-2 TO COMPUTED-N.                                  NC1124.2 44 71
   000767         077000     PERFORM FAIL.                                                NC1124.2 210
   000768         077100     GO TO MOVE-WRITE-F1-1-2.                                     NC1124.2 771
   000769         077200 MOVE-DELETE-F1-1-2.                                              NC1124.2
   000770         077300     PERFORM DE-LETE.                                             NC1124.2 211
   000771         077400 MOVE-WRITE-F1-1-2.                                               NC1124.2
   000772         077500     MOVE "MOVE-TEST-F1-1-2" TO PAR-NAME.                         NC1124.2 59
   000773         077600     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000774         077700 MOVE-TEST-F1-1-3.                                                NC1124.2
   000775         077800     IF DNAME-3 EQUAL TO 1                                        NC1124.2 45
   000776      1  077900         PERFORM PASS                                             NC1124.2 209
   000777      1  078000         GO TO MOVE-WRITE-F1-1-3.                                 NC1124.2 784
   000778         078100     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000779         078200     MOVE DNAME-3 TO COMPUTED-N.                                  NC1124.2 45 71
   000780         078300     PERFORM FAIL.                                                NC1124.2 210
   000781         078400     GO TO MOVE-WRITE-F1-1-3.                                     NC1124.2 784
   000782         078500 MOVE-DELETE-F1-1-3.                                              NC1124.2
   000783         078600     PERFORM DE-LETE.                                             NC1124.2 211
   000784         078700 MOVE-WRITE-F1-1-3.                                               NC1124.2
   000785         078800     MOVE "MOVE-TEST-F1-1-3" TO PAR-NAME.                         NC1124.2 59
   000786         078900     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000787         079000 MOVE-TEST-F1-1-4.                                                NC1124.2
   000788         079100     IF DNAME-4 EQUAL TO 1                                        NC1124.2 46
   000789      1  079200         PERFORM PASS                                             NC1124.2 209
   000790      1  079300         GO TO MOVE-WRITE-F1-1-4.                                 NC1124.2 797
   000791         079400     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000792         079500     MOVE DNAME-4 TO COMPUTED-N.                                  NC1124.2 46 71
   000793         079600     PERFORM FAIL.                                                NC1124.2 210
   000794         079700     GO TO MOVE-WRITE-F1-1-4.                                     NC1124.2 797
   000795         079800 MOVE-DELETE-F1-1-4.                                              NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     PERFORM DE-LETE.                                             NC1124.2 211
   000797         080000 MOVE-WRITE-F1-1-4.                                               NC1124.2
   000798         080100     MOVE "MOVE-TEST-F1-1-4" TO PAR-NAME.                         NC1124.2 59
   000799         080200     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000800         080300 MOVE-TEST-F1-1-5.                                                NC1124.2
   000801         080400     IF DNAME-5  EQUAL TO 1                                       NC1124.2 47
   000802      1  080500         PERFORM PASS                                             NC1124.2 209
   000803      1  080600         GO TO MOVE-WRITE-F1-1-5.                                 NC1124.2 810
   000804         080700     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000805         080800     MOVE DNAME-5  TO COMPUTED-N.                                 NC1124.2 47 71
   000806         080900     PERFORM FAIL.                                                NC1124.2 210
   000807         081000     GO TO MOVE-WRITE-F1-1-5.                                     NC1124.2 810
   000808         081100 MOVE-DELETE-F1-1-5.                                              NC1124.2
   000809         081200     PERFORM DE-LETE.                                             NC1124.2 211
   000810         081300 MOVE-WRITE-F1-1-5.                                               NC1124.2
   000811         081400     MOVE "MOVE-TEST-F1-1-5 " TO PAR-NAME.                        NC1124.2 59
   000812         081500     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000813         081600 MOVE-TEST-F1-1-6.                                                NC1124.2
   000814         081700     IF DNAME-6  EQUAL TO 1                                       NC1124.2 48
   000815      1  081800         PERFORM PASS                                             NC1124.2 209
   000816      1  081900         GO TO MOVE-WRITE-F1-1-6.                                 NC1124.2 823
   000817         082000     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000818         082100     MOVE DNAME-6  TO COMPUTED-N.                                 NC1124.2 48 71
   000819         082200     PERFORM FAIL.                                                NC1124.2 210
   000820         082300     GO TO MOVE-WRITE-F1-1-6.                                     NC1124.2 823
   000821         082400 MOVE-DELETE-F1-1-6.                                              NC1124.2
   000822         082500     PERFORM DE-LETE.                                             NC1124.2 211
   000823         082600 MOVE-WRITE-F1-1-6.                                               NC1124.2
   000824         082700     MOVE "MOVE-TEST-F1-1-6 " TO PAR-NAME.                        NC1124.2 59
   000825         082800     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000826         082900 MOVE-TEST-F1-1-7.                                                NC1124.2
   000827         083000     IF DNAME-7  EQUAL TO 1                                       NC1124.2 49
   000828      1  083100         PERFORM PASS                                             NC1124.2 209
   000829      1  083200         GO TO MOVE-WRITE-F1-1-7.                                 NC1124.2 836
   000830         083300     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000831         083400     MOVE DNAME-7  TO COMPUTED-N.                                 NC1124.2 49 71
   000832         083500     PERFORM FAIL.                                                NC1124.2 210
   000833         083600     GO TO MOVE-WRITE-F1-1-7.                                     NC1124.2 836
   000834         083700 MOVE-DELETE-F1-1-7.                                              NC1124.2
   000835         083800     PERFORM DE-LETE.                                             NC1124.2 211
   000836         083900 MOVE-WRITE-F1-1-7.                                               NC1124.2
   000837         084000     MOVE "MOVE-TEST-F1-1-7 " TO PAR-NAME.                        NC1124.2 59
   000838         084100     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000839         084200 MOVE-TEST-F1-1-8.                                                NC1124.2
   000840         084300     IF DNAME-8  EQUAL TO 1                                       NC1124.2 50
   000841      1  084400         PERFORM PASS                                             NC1124.2 209
   000842      1  084500         GO TO MOVE-WRITE-F1-1-8.                                 NC1124.2 849
   000843         084600     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000844         084700     MOVE DNAME-8  TO COMPUTED-N.                                 NC1124.2 50 71
   000845         084800     PERFORM FAIL.                                                NC1124.2 210
   000846         084900     GO TO MOVE-WRITE-F1-1-8.                                     NC1124.2 849
   000847         085000 MOVE-DELETE-F1-1-8.                                              NC1124.2
   000848         085100     PERFORM DE-LETE.                                             NC1124.2 211
   000849         085200 MOVE-WRITE-F1-1-8.                                               NC1124.2
   000850         085300     MOVE "MOVE-TEST-F1-1-8 " TO PAR-NAME.                        NC1124.2 59
   000851         085400     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000852         085500 MOVE-TEST-F1-1-9.                                                NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     IF DNAME-9  EQUAL TO 1                                       NC1124.2 51
   000854      1  085700         PERFORM PASS                                             NC1124.2 209
   000855      1  085800         GO TO MOVE-WRITE-F1-1-9.                                 NC1124.2 862
   000856         085900     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000857         086000     MOVE DNAME-9  TO COMPUTED-N.                                 NC1124.2 51 71
   000858         086100     PERFORM FAIL.                                                NC1124.2 210
   000859         086200     GO TO MOVE-WRITE-F1-1-9.                                     NC1124.2 862
   000860         086300 MOVE-DELETE-F1-1-9.                                              NC1124.2
   000861         086400     PERFORM DE-LETE.                                             NC1124.2 211
   000862         086500 MOVE-WRITE-F1-1-9.                                               NC1124.2
   000863         086600     MOVE "MOVE-TEST-F1-1-9 " TO PAR-NAME.                        NC1124.2 59
   000864         086700     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000865         086800 MOVE-TEST-F1-1-10.                                               NC1124.2
   000866         086900     IF DNAME-10 EQUAL TO 1                                       NC1124.2 52
   000867      1  087000         PERFORM PASS                                             NC1124.2 209
   000868      1  087100         GO TO MOVE-WRITE-F1-1-10.                                NC1124.2 875
   000869         087200     MOVE 1 TO CORRECT-N.                                         NC1124.2 85
   000870         087300     MOVE DNAME-10 TO COMPUTED-N.                                 NC1124.2 52 71
   000871         087400     PERFORM FAIL.                                                NC1124.2 210
   000872         087500     GO TO MOVE-WRITE-F1-1-10.                                    NC1124.2 875
   000873         087600 MOVE-DELETE-F1-1-10.                                             NC1124.2
   000874         087700     PERFORM DE-LETE.                                             NC1124.2 211
   000875         087800 MOVE-WRITE-F1-1-10.                                              NC1124.2
   000876         087900     MOVE "MOVE-TEST-F1-1-10" TO PAR-NAME.                        NC1124.2 59
   000877         088000     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000878         088100 MOVE-INIT-F1-2-1.                                                NC1124.2
   000879         088200     MOVE   "V1-134 6.25.4 GR1,2" TO ANSI-REFERENCE.              NC1124.2 115
   000880         088300     MOVE    HIGH-VALUE TO D-NAMES.                               NC1124.2 IMP 42
   000881         088400 MOVE-TEST-F1-2-0.                                                NC1124.2
   000882         088500     MOVE ZERO TO DNAME-1                                         NC1124.2 IMP 43
   000883         088600                  DNAME-2                                         NC1124.2 44
   000884         088700                  DNAME-3                                         NC1124.2 45
   000885         088800                  DNAME-4                                         NC1124.2 46
   000886         088900                  DNAME-5                                         NC1124.2 47
   000887         089000                  DNAME-6                                         NC1124.2 48
   000888         089100                  DNAME-7                                         NC1124.2 49
   000889         089200                  DNAME-8                                         NC1124.2 50
   000890         089300                  DNAME-9                                         NC1124.2 51
   000891         089400                  DNAME-10.                                       NC1124.2 52
   000892         089500 MOVE-TEST-F1-2-1.                                                NC1124.2
   000893         089600     IF DNAME-1  EQUAL TO 0                                       NC1124.2 43
   000894      1  089700         PERFORM PASS                                             NC1124.2 209
   000895      1  089800         GO TO MOVE-WRITE-F1-2-1.                                 NC1124.2 902
   000896         089900     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   000897         090000     MOVE DNAME-1  TO COMPUTED-N.                                 NC1124.2 43 71
   000898         090100     PERFORM FAIL.                                                NC1124.2 210
   000899         090200     GO TO MOVE-WRITE-F1-2-1.                                     NC1124.2 902
   000900         090300 MOVE-DELETE-F1-2-1.                                              NC1124.2
   000901         090400     PERFORM DE-LETE.                                             NC1124.2 211
   000902         090500 MOVE-WRITE-F1-2-1.                                               NC1124.2
   000903         090600     MOVE "MOVE-TEST-F1-2-1" TO PAR-NAME.                         NC1124.2 59
   000904         090700     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000905         090800 MOVE-TEST-F1-2-2.                                                NC1124.2
   000906         090900     IF DNAME-2  EQUAL TO 0                                       NC1124.2 44
   000907      1  091000         PERFORM PASS                                             NC1124.2 209
   000908      1  091100         GO TO MOVE-WRITE-F1-2-2.                                 NC1124.2 915
   000909         091200     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     MOVE DNAME-2  TO COMPUTED-N.                                 NC1124.2 44 71
   000911         091400     PERFORM FAIL.                                                NC1124.2 210
   000912         091500     GO TO MOVE-WRITE-F1-2-2.                                     NC1124.2 915
   000913         091600 MOVE-DELETE-F1-2-2.                                              NC1124.2
   000914         091700     PERFORM DE-LETE.                                             NC1124.2 211
   000915         091800 MOVE-WRITE-F1-2-2.                                               NC1124.2
   000916         091900     MOVE "MOVE-TEST-F1-2-2" TO PAR-NAME.                         NC1124.2 59
   000917         092000     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000918         092100 MOVE-TEST-F1-2-3.                                                NC1124.2
   000919         092200     IF DNAME-3  EQUAL TO 0                                       NC1124.2 45
   000920      1  092300         PERFORM PASS                                             NC1124.2 209
   000921      1  092400         GO TO MOVE-WRITE-F1-2-3.                                 NC1124.2 928
   000922         092500     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   000923         092600     MOVE DNAME-3  TO COMPUTED-N.                                 NC1124.2 45 71
   000924         092700     PERFORM FAIL.                                                NC1124.2 210
   000925         092800     GO TO MOVE-WRITE-F1-2-3.                                     NC1124.2 928
   000926         092900 MOVE-DELETE-F1-2-3.                                              NC1124.2
   000927         093000     PERFORM DE-LETE.                                             NC1124.2 211
   000928         093100 MOVE-WRITE-F1-2-3.                                               NC1124.2
   000929         093200     MOVE "MOVE-TEST-F1-2-3" TO PAR-NAME.                         NC1124.2 59
   000930         093300     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000931         093400 MOVE-TEST-F1-2-4.                                                NC1124.2
   000932         093500     IF DNAME-4  EQUAL TO 0                                       NC1124.2 46
   000933      1  093600         PERFORM PASS                                             NC1124.2 209
   000934      1  093700         GO TO MOVE-WRITE-F1-2-4.                                 NC1124.2 941
   000935         093800     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   000936         093900     MOVE DNAME-4  TO COMPUTED-N.                                 NC1124.2 46 71
   000937         094000     PERFORM FAIL.                                                NC1124.2 210
   000938         094100     GO TO MOVE-WRITE-F1-2-4.                                     NC1124.2 941
   000939         094200 MOVE-DELETE-F1-2-4.                                              NC1124.2
   000940         094300     PERFORM DE-LETE.                                             NC1124.2 211
   000941         094400 MOVE-WRITE-F1-2-4.                                               NC1124.2
   000942         094500     MOVE "MOVE-TEST-F1-2-4" TO PAR-NAME.                         NC1124.2 59
   000943         094600     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000944         094700 MOVE-TEST-F1-2-5.                                                NC1124.2
   000945         094800     IF DNAME-5  EQUAL TO 0                                       NC1124.2 47
   000946      1  094900         PERFORM PASS                                             NC1124.2 209
   000947      1  095000         GO TO MOVE-WRITE-F1-2-5.                                 NC1124.2 954
   000948         095100     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   000949         095200     MOVE DNAME-5  TO COMPUTED-N.                                 NC1124.2 47 71
   000950         095300     PERFORM FAIL.                                                NC1124.2 210
   000951         095400     GO TO MOVE-WRITE-F1-2-5.                                     NC1124.2 954
   000952         095500 MOVE-DELETE-F1-2-5.                                              NC1124.2
   000953         095600     PERFORM DE-LETE.                                             NC1124.2 211
   000954         095700 MOVE-WRITE-F1-2-5.                                               NC1124.2
   000955         095800     MOVE "MOVE-TEST-F1-2-5" TO PAR-NAME.                         NC1124.2 59
   000956         095900     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000957         096000 MOVE-TEST-F1-2-6.                                                NC1124.2
   000958         096100     IF DNAME-6  EQUAL TO 0                                       NC1124.2 48
   000959      1  096200         PERFORM PASS                                             NC1124.2 209
   000960      1  096300         GO TO MOVE-WRITE-F1-2-6.                                 NC1124.2 967
   000961         096400     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   000962         096500     MOVE DNAME-6  TO COMPUTED-N.                                 NC1124.2 48 71
   000963         096600     PERFORM FAIL.                                                NC1124.2 210
   000964         096700     GO TO MOVE-WRITE-F1-2-6.                                     NC1124.2 967
   000965         096800 MOVE-DELETE-F1-2-6.                                              NC1124.2
   000966         096900     PERFORM DE-LETE.                                             NC1124.2 211
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000 MOVE-WRITE-F1-2-6.                                               NC1124.2
   000968         097100     MOVE "MOVE-TEST-F1-2-6" TO PAR-NAME.                         NC1124.2 59
   000969         097200     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000970         097300 MOVE-TEST-F1-2-7.                                                NC1124.2
   000971         097400     IF DNAME-7  EQUAL TO 0                                       NC1124.2 49
   000972      1  097500         PERFORM PASS                                             NC1124.2 209
   000973      1  097600         GO TO MOVE-WRITE-F1-2-7.                                 NC1124.2 980
   000974         097700     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   000975         097800     MOVE DNAME-7  TO COMPUTED-N.                                 NC1124.2 49 71
   000976         097900     PERFORM FAIL.                                                NC1124.2 210
   000977         098000     GO TO MOVE-WRITE-F1-2-7.                                     NC1124.2 980
   000978         098100 MOVE-DELETE-F1-2-7.                                              NC1124.2
   000979         098200     PERFORM DE-LETE.                                             NC1124.2 211
   000980         098300 MOVE-WRITE-F1-2-7.                                               NC1124.2
   000981         098400     MOVE "MOVE-TEST-F1-2-7" TO PAR-NAME.                         NC1124.2 59
   000982         098500     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000983         098600 MOVE-TEST-F1-2-8.                                                NC1124.2
   000984         098700     IF DNAME-8  EQUAL TO 0                                       NC1124.2 50
   000985      1  098800         PERFORM PASS                                             NC1124.2 209
   000986      1  098900         GO TO MOVE-WRITE-F1-2-8.                                 NC1124.2 993
   000987         099000     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   000988         099100     MOVE DNAME-8  TO COMPUTED-N.                                 NC1124.2 50 71
   000989         099200     PERFORM FAIL.                                                NC1124.2 210
   000990         099300     GO TO MOVE-WRITE-F1-2-8.                                     NC1124.2 993
   000991         099400 MOVE-DELETE-F1-2-8.                                              NC1124.2
   000992         099500     PERFORM DE-LETE.                                             NC1124.2 211
   000993         099600 MOVE-WRITE-F1-2-8.                                               NC1124.2
   000994         099700     MOVE "MOVE-TEST-F1-2-8" TO PAR-NAME.                         NC1124.2 59
   000995         099800     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   000996         099900 MOVE-TEST-F1-2-9.                                                NC1124.2
   000997         100000     IF DNAME-9  EQUAL TO 0                                       NC1124.2 51
   000998      1  100100         PERFORM PASS                                             NC1124.2 209
   000999      1  100200         GO TO MOVE-WRITE-F1-2-9.                                 NC1124.2 1006
   001000         100300     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   001001         100400     MOVE DNAME-9  TO COMPUTED-N.                                 NC1124.2 51 71
   001002         100500     PERFORM FAIL.                                                NC1124.2 210
   001003         100600     GO TO MOVE-WRITE-F1-2-9.                                     NC1124.2 1006
   001004         100700 MOVE-DELETE-F1-2-9.                                              NC1124.2
   001005         100800     PERFORM DE-LETE.                                             NC1124.2 211
   001006         100900 MOVE-WRITE-F1-2-9.                                               NC1124.2
   001007         101000     MOVE "MOVE-TEST-F1-2-9" TO PAR-NAME.                         NC1124.2 59
   001008         101100     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   001009         101200 MOVE-TEST-F1-2-10.                                               NC1124.2
   001010         101300     IF DNAME-10 EQUAL TO 0                                       NC1124.2 52
   001011      1  101400         PERFORM PASS                                             NC1124.2 209
   001012      1  101500         GO TO MOVE-WRITE-F1-2-10.                                NC1124.2 1019
   001013         101600     MOVE 0 TO CORRECT-N.                                         NC1124.2 85
   001014         101700     MOVE DNAME-10 TO COMPUTED-N.                                 NC1124.2 52 71
   001015         101800     PERFORM FAIL.                                                NC1124.2 210
   001016         101900     GO TO MOVE-WRITE-F1-2-10.                                    NC1124.2 1019
   001017         102000 MOVE-DELETE-F1-2-10.                                             NC1124.2
   001018         102100     PERFORM DE-LETE.                                             NC1124.2 211
   001019         102200 MOVE-WRITE-F1-2-10.                                              NC1124.2
   001020         102300     MOVE "MOVE-TEST-F1-2-10" TO PAR-NAME.                        NC1124.2 59
   001021         102400     PERFORM PRINT-DETAIL.                                        NC1124.2 213
   001022         102500 CCVS-EXIT SECTION.                                               NC1124.2
   001023         102600 CCVS-999999.                                                     NC1124.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     GO TO CLOSE-FILES.                                           NC1124.2 202
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    22
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       38   ACCUM-1. . . . . . . . . . . .  M317 M338 340 343 M355 M376 M377 379 382 M393 M414 416 419 M430 M451 M452 454
                                            457 M548 M559 561 565 M587 598 M598 600 603 M649 M659 660 664 M675 M687 689 692
                                            M704 716
       39   ACCUM-2. . . . . . . . . . . .  M705 M716 718 721
       40   ACCUM-3. . . . . . . . . . . .  M676 M733 735
       41   ACCUM-4
      115   ANSI-REFERENCE . . . . . . . .  292 299 308 M316 M354 M392 M429 M467 M502 M537 M576 M613 M647 M673 M702 M731
                                            M879
       94   CCVS-C-1 . . . . . . . . . . .  231 277
       99   CCVS-C-2 . . . . . . . . . . .  232 278
      149   CCVS-E-1 . . . . . . . . . . .  237
      154   CCVS-E-2 . . . . . . . . . . .  246 253 260 265
      157   CCVS-E-2-2 . . . . . . . . . .  M245
      162   CCVS-E-3 . . . . . . . . . . .  266
      171   CCVS-E-4 . . . . . . . . . . .  245
      172   CCVS-E-4-1 . . . . . . . . . .  M243
      174   CCVS-E-4-2 . . . . . . . . . .  M244
      116   CCVS-H-1 . . . . . . . . . . .  226 273
      121   CCVS-H-2A. . . . . . . . . . .  227 274
      130   CCVS-H-2B. . . . . . . . . . .  228 275
      142   CCVS-H-3 . . . . . . . . . . .  229 276
      192   CCVS-PGM-ID. . . . . . . . . .  198 198
       76   CM-18V0
       70   COMPUTED-A . . . . . . . . . .  71 73 74 75 76 304 307 M343 M382 M419 M457 M492 M528 M565 M603 M637 M664 M692
                                            M721
       71   COMPUTED-N . . . . . . . . . .  M751 M766 M779 M792 M805 M818 M831 M844 M857 M870 M897 M910 M923 M936 M949 M962
                                            M975 M988 M1001 M1014
       69   COMPUTED-X . . . . . . . . . .  M221 289
       73   COMPUTED-0V18
       75   COMPUTED-14V4
       77   COMPUTED-18V0
       74   COMPUTED-4V14
       93   COR-ANSI-REFERENCE . . . . . .  M299 M301
       84   CORRECT-A. . . . . . . . . . .  85 86 87 88 89 305 307 M344 M383 M420 M458 M493 M527 M564 M604 M636 M663 M693
                                            M722
       85   CORRECT-N. . . . . . . . . . .  M750 M765 M778 M791 M804 M817 M830 M843 M856 M869 M896 M909 M922 M935 M948 M961
                                            M974 M987 M1000 M1013
       83   CORRECT-X. . . . . . . . . . .  M222 291
       86   CORRECT-0V18
       88   CORRECT-14V4
       90   CORRECT-18V0
       87   CORRECT-4V14
       89   CR-18V0
       42   D-NAMES. . . . . . . . . . . .  M732 M880
      107   DELETE-COUNTER . . . . . . . .  M211 240 256 258
       43   DNAME-1. . . . . . . . . . . .  M318 329 M356 367 M394 405 M431 442 M468 M487 492 M503 514 M523 528 M538 550
                                            M577 589 M614 M633 637 M648 651 653 654 655 M674 678 M703 707 M736 747 751 M882
                                            893 897
       52   DNAME-10 . . . . . . . . . . .  M327 338 M365 376 M403 414 M440 451 M477 487 M512 523 M547 559 M586 598 M623
                                            633 M745 866 870 M891 1010 1014
       44   DNAME-2. . . . . . . . . . . .  M319 330 M357 368 M395 406 M432 443 M469 479 M504 515 M539 551 M578 590 M615
                                            625 M737 762 766 M883 906 910
       45   DNAME-3. . . . . . . . . . . .  M320 331 M358 369 M396 407 M433 444 M470 480 M505 516 M540 552 M579 591 M616
                                            626 M738 775 779 M884 919 923
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    23
0 Defined   Cross-reference of data names   References

0      46   DNAME-4. . . . . . . . . . . .  M321 332 M359 370 M397 408 M434 445 M471 481 M506 517 M541 553 M580 592 M617
                                            627 M739 788 792 M885 932 936
       47   DNAME-5. . . . . . . . . . . .  M322 333 M360 371 M398 409 M435 446 M472 482 M507 518 M542 554 M581 593 M618
                                            628 M740 801 805 M886 945 949
       48   DNAME-6. . . . . . . . . . . .  M323 334 M361 372 M399 410 M436 447 M473 483 M508 519 M543 555 M582 594 M619
                                            629 M741 814 818 M887 958 962
       49   DNAME-7. . . . . . . . . . . .  M324 335 M362 373 M400 411 M437 448 M474 484 M509 520 M544 556 M583 595 M620
                                            630 M742 827 831 M888 971 975
       50   DNAME-8. . . . . . . . . . . .  M325 336 M363 374 M401 412 M438 449 M475 485 M510 521 M545 557 M584 596 M621
                                            631 M743 840 844 M889 984 988
       51   DNAME-9. . . . . . . . . . . .  M326 337 M364 375 M402 413 M439 450 M476 486 M511 522 M546 558 M585 597 M622
                                            632 M744 853 857 M890 997 1001
       62   DOTVALUE . . . . . . . . . . .  M216
      113   DUMMY-HOLD . . . . . . . . . .  M270 280
       36   DUMMY-RECORD . . . . . . . . .  M226 M227 M228 M229 M231 M232 M233 M235 M237 M246 M253 M260 M265 M266 270 M271
                                            272 M273 M274 M275 M276 M277 M278 M279 M280 284 M285 M294 M309
      160   ENDER-DESC . . . . . . . . . .  M248 M259 M264
      108   ERROR-COUNTER. . . . . . . . .  M210 239 249 252
      112   ERROR-HOLD . . . . . . . . . .  M239 M240 M240 M241 244
      158   ERROR-TOTAL. . . . . . . . . .  M250 M252 M257 M258 M262 M263
       55   FEATURE. . . . . . . . . . . .  M350 M571 M757
      186   HYPHEN-LINE. . . . . . . . . .  233 235 279
      152   ID-AGAIN . . . . . . . . . . .  M198
      185   INF-ANSI-REFERENCE . . . . . .  M292 M295 M308 M310
      180   INFO-TEXT. . . . . . . . . . .  M293
      109   INSPECT-COUNTER. . . . . . . .  M208 239 261 263
       57   P-OR-F . . . . . . . . . . . .  M208 M209 M210 M211 218 M221
       59   PAR-NAME . . . . . . . . . . .  M223 M351 M389 M426 M464 M499 M534 M573 M610 M644 M670 M699 M728 M759 M772 M785
                                            M798 M811 M824 M837 M850 M863 M876 M903 M916 M929 M942 M955 M968 M981 M994 M1007
                                            M1020
       61   PARDOT-X . . . . . . . . . . .  M215
      110   PASS-COUNTER . . . . . . . . .  M209 241 243
       34   PRINT-FILE . . . . . . . . . .  30 197 203
       35   PRINT-REC. . . . . . . . . . .  M217 M298 M300
       64   RE-MARK. . . . . . . . . . . .  M212 M224 M491 M526 M639
      106   REC-CT . . . . . . . . . . . .  214 216 223
      105   REC-SKL-SUB
      114   RECORD-COUNT . . . . . . . . .  M268 269 M281
       65   TEST-COMPUTED. . . . . . . . .  298
       80   TEST-CORRECT . . . . . . . . .  300
      133   TEST-ID. . . . . . . . . . . .  M198
       53   TEST-RESULTS . . . . . . . . .  M199 217
      111   TOTAL-ERROR
      182   XXCOMPUTED . . . . . . . . . .  M307
      184   XXCORRECT. . . . . . . . . . .  M307
      177   XXINFO . . . . . . . . . . . .  294 309
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    24
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

      347   ADD-DELETE-F1-1
      386   ADD-DELETE-F1-2
      496   ADD-DELETE-F1-3
      423   ADD-DELETE-F2-1
      461   ADD-DELETE-F2-2
      531   ADD-DELETE-F2-3
      315   ADD-INIT-F1-1
      353   ADD-INIT-F1-2
      466   ADD-INIT-F1-3
      391   ADD-INIT-F2-1
      428   ADD-INIT-F2-2
      501   ADD-INIT-F2-3
      328   ADD-TEST-F1-1-0
      339   ADD-TEST-F1-1-1
      366   ADD-TEST-F1-2-0
      378   ADD-TEST-F1-2-1
      478   ADD-TEST-F1-3-0
      404   ADD-TEST-F2-1-0
      415   ADD-TEST-F2-1-1
      441   ADD-TEST-F2-2-0
      453   ADD-TEST-F2-2-1
      513   ADD-TEST-F2-3-0
      349   ADD-WRITE-F1-1 . . . . . . . .  G342 G346
      388   ADD-WRITE-F1-2 . . . . . . . .  G381 G385
      498   ADD-WRITE-F1-3 . . . . . . . .  G490 G495
      425   ADD-WRITE-F2-1 . . . . . . . .  G418 G422
      463   ADD-WRITE-F2-2 . . . . . . . .  G456 G460
      533   ADD-WRITE-F2-3 . . . . . . . .  G525 G530
      303   BAIL-OUT . . . . . . . . . . .  P220
      311   BAIL-OUT-EX. . . . . . . . . .  E220 G305
      306   BAIL-OUT-WRITE . . . . . . . .  G304
      286   BLANK-LINE-PRINT
     1022   CCVS-EXIT
     1023   CCVS-999999
      195   CCVS1
      312   CCVS1-EXIT . . . . . . . . . .  G201
      202   CLOSE-FILES. . . . . . . . . .  G1024
      230   COLUMN-NAMES-ROUTINE . . . . .  E200
      211   DE-LETE. . . . . . . . . . . .  P348 P387 P424 P462 P497 P532 P569 P608 P642 P668 P697 P726 P755 P770 P783 P796
                                            P809 P822 P835 P848 P861 P874 P901 P914 P927 P940 P953 P966 P979 P992 P1005 P1018
      234   END-ROUTINE. . . . . . . . . .  P203 P572 P758
      238   END-ROUTINE-1
      247   END-ROUTINE-12
      255   END-ROUTINE-13 . . . . . . . .  E203
      236   END-RTN-EXIT
      210   FAIL . . . . . . . . . . . . .  P345 P384 P421 P459 P494 P529 P566 P605 P638 P665 P694 P723 P752 P767 P780 P793
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    25
0 Defined   Cross-reference of procedures   References

0                                           P806 P819 P832 P845 P858 P871 P898 P911 P924 P937 P950 P963 P976 P989 P1002 P1015
      288   FAIL-ROUTINE . . . . . . . . .  P219
      302   FAIL-ROUTINE-EX. . . . . . . .  E219 G296
      297   FAIL-ROUTINE-WRITE . . . . . .  G290 G291
      225   HEAD-ROUTINE . . . . . . . . .  P200
      208   INSPT
      754   MOVE-DELETE-F1-1-1
      873   MOVE-DELETE-F1-1-10
      769   MOVE-DELETE-F1-1-2
      782   MOVE-DELETE-F1-1-3
      795   MOVE-DELETE-F1-1-4
      808   MOVE-DELETE-F1-1-5
      821   MOVE-DELETE-F1-1-6
      834   MOVE-DELETE-F1-1-7
      847   MOVE-DELETE-F1-1-8
      860   MOVE-DELETE-F1-1-9
      900   MOVE-DELETE-F1-2-1
     1017   MOVE-DELETE-F1-2-10
      913   MOVE-DELETE-F1-2-2
      926   MOVE-DELETE-F1-2-3
      939   MOVE-DELETE-F1-2-4
      952   MOVE-DELETE-F1-2-5
      965   MOVE-DELETE-F1-2-6
      978   MOVE-DELETE-F1-2-7
      991   MOVE-DELETE-F1-2-8
     1004   MOVE-DELETE-F1-2-9
      730   MOVE-INIT-F1-1-1
      878   MOVE-INIT-F1-2-1
      734   MOVE-TEST-F1-1-1
      746   MOVE-TEST-F1-1-1-1
      865   MOVE-TEST-F1-1-10
      761   MOVE-TEST-F1-1-2
      774   MOVE-TEST-F1-1-3
      787   MOVE-TEST-F1-1-4
      800   MOVE-TEST-F1-1-5
      813   MOVE-TEST-F1-1-6
      826   MOVE-TEST-F1-1-7
      839   MOVE-TEST-F1-1-8
      852   MOVE-TEST-F1-1-9
      881   MOVE-TEST-F1-2-0
      892   MOVE-TEST-F1-2-1
     1009   MOVE-TEST-F1-2-10
      905   MOVE-TEST-F1-2-2
      918   MOVE-TEST-F1-2-3
      931   MOVE-TEST-F1-2-4
      944   MOVE-TEST-F1-2-5
      957   MOVE-TEST-F1-2-6
      970   MOVE-TEST-F1-2-7
      983   MOVE-TEST-F1-2-8
      996   MOVE-TEST-F1-2-9
      756   MOVE-WRITE-F1-1-1. . . . . . .  G749 G753
      875   MOVE-WRITE-F1-1-10 . . . . . .  G868 G872
      771   MOVE-WRITE-F1-1-2. . . . . . .  G764 G768
      784   MOVE-WRITE-F1-1-3. . . . . . .  G777 G781
      797   MOVE-WRITE-F1-1-4. . . . . . .  G790 G794
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    26
0 Defined   Cross-reference of procedures   References

0     810   MOVE-WRITE-F1-1-5. . . . . . .  G803 G807
      823   MOVE-WRITE-F1-1-6. . . . . . .  G816 G820
      836   MOVE-WRITE-F1-1-7. . . . . . .  G829 G833
      849   MOVE-WRITE-F1-1-8. . . . . . .  G842 G846
      862   MOVE-WRITE-F1-1-9. . . . . . .  G855 G859
      902   MOVE-WRITE-F1-2-1. . . . . . .  G895 G899
     1019   MOVE-WRITE-F1-2-10 . . . . . .  G1012 G1016
      915   MOVE-WRITE-F1-2-2. . . . . . .  G908 G912
      928   MOVE-WRITE-F1-2-3. . . . . . .  G921 G925
      941   MOVE-WRITE-F1-2-4. . . . . . .  G934 G938
      954   MOVE-WRITE-F1-2-5. . . . . . .  G947 G951
      967   MOVE-WRITE-F1-2-6. . . . . . .  G960 G964
      980   MOVE-WRITE-F1-2-7. . . . . . .  G973 G977
      993   MOVE-WRITE-F1-2-8. . . . . . .  G986 G990
     1006   MOVE-WRITE-F1-2-9. . . . . . .  G999 G1003
      196   OPEN-FILES
      209   PASS . . . . . . . . . . . . .  P341 P380 P417 P455 P489 P524 P562 P601 P634 P661 P690 P719 P748 P763 P776 P789
                                            P802 P815 P828 P841 P854 P867 P894 P907 P920 P933 P946 P959 P972 P985 P998 P1011
      213   PRINT-DETAIL . . . . . . . . .  P352 P390 P427 P465 P500 P535 P574 P611 P645 P671 P700 P729 P760 P773 P786 P799
                                            P812 P825 P838 P851 P864 P877 P904 P917 P930 P943 P956 P969 P982 P995 P1008 P1021
      314   SECT-NC112A-001
      568   SUB-DELETE-F1-1
      696   SUB-DELETE-F1-2
      607   SUB-DELETE-F2-1
      641   SUB-DELETE-F2-2
      667   SUB-DELETE-F2-3
      725   SUB-DELETE-F2-4
      536   SUB-INIT-F1-1
      672   SUB-INIT-F1-2
      575   SUB-INIT-F2-1
      612   SUB-INIT-F2-2
      646   SUB-INIT-F2-3
      701   SUB-INIT-F2-4
      549   SUB-TEST-F1-1-0
      560   SUB-TEST-F1-1-1
      677   SUB-TEST-F1-2-0
      688   SUB-TEST-F1-2-1
      588   SUB-TEST-F2-1-0
      599   SUB-TEST-F2-1-1
      624   SUB-TEST-F2-2-0
      650   SUB-TEST-F2-3
      706   SUB-TEST-F2-4-0
      717   SUB-TEST-F2-4-1
      570   SUB-WRITE-F1-1 . . . . . . . .  G563 G567
      698   SUB-WRITE-F1-2 . . . . . . . .  G691 G695
      609   SUB-WRITE-F2-1 . . . . . . . .  G602 G606
      643   SUB-WRITE-F2-2 . . . . . . . .  G635 G640
      669   SUB-WRITE-F2-3 . . . . . . . .  G662 G666
      727   SUB-WRITE-F2-4 . . . . . . . .  G720 G724
      206   TERMINATE-CALL
      204   TERMINATE-CCVS
      267   WRITE-LINE . . . . . . . . . .  P217 P218 P226 P227 P228 P229 P231 P232 P233 P235 P237 P246 P254 P260 P265 P266
                                            P294 P298 P300 P309
      283   WRT-LN . . . . . . . . . . . .  P273 P274 P275 P276 P277 P278 P279 P282 P287
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    27
0 Defined   Cross-reference of programs     References

        3   NC112A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC112A    Date 06/04/2022  Time 11:59:00   Page    28
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC112A:
 *    Source records = 1024
 *    Data Division statements = 78
 *    Procedure Division statements = 598
 *    Generated COBOL statements = 0
 *    Program complexity factor = 609
0End of compilation 1,  program NC112A,  highest severity 0.
0Return code 0
