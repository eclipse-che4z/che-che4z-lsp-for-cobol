1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:38   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:38   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2234.2
   000002         000200 PROGRAM-ID.                                                      NC2234.2
   000003         000300     NC223A.                                                      NC2234.2
   000004         000500*                                                              *  NC2234.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2234.2
   000006         000700*                                                              *  NC2234.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2234.2
   000008         000900*                                                              *  NC2234.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2234.2
   000010         001100*                                                              *  NC2234.2
   000011         001300*                                                              *  NC2234.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2234.2
   000013         001500*                                                              *  NC2234.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2234.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2234.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2234.2
   000017         001900*                                                              *  NC2234.2
   000018         002100*    PROGRAM NC223A TESTS THE "INITIALISE" STATEMENT USING     *  NC2234.2
   000019         002200*    USING VARIOUS COMBINATIONS OD OPTIONAL PHRASES AND A      *  NC2234.2
   000020         002300*    VARIETY OF RECEIVING AREAS.                               *  NC2234.2
   000021         002400*                                                              *  NC2234.2
   000022         002600 ENVIRONMENT DIVISION.                                            NC2234.2
   000023         002700 CONFIGURATION SECTION.                                           NC2234.2
   000024         002800 SOURCE-COMPUTER.                                                 NC2234.2
   000025         002900     XXXXX082.                                                    NC2234.2
   000026         003000 OBJECT-COMPUTER.                                                 NC2234.2
   000027         003100     XXXXX083.                                                    NC2234.2
   000028         003200 INPUT-OUTPUT SECTION.                                            NC2234.2
   000029         003300 FILE-CONTROL.                                                    NC2234.2
   000030         003400     SELECT PRINT-FILE ASSIGN TO                                  NC2234.2 34
   000031         003500     XXXXX055.                                                    NC2234.2
   000032         003600 DATA DIVISION.                                                   NC2234.2
   000033         003700 FILE SECTION.                                                    NC2234.2
   000034         003800 FD  PRINT-FILE.                                                  NC2234.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003900 01  PRINT-REC PICTURE X(120).                                    NC2234.2
   000036         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC2234.2
   000037         004100 WORKING-STORAGE SECTION.                                         NC2234.2
   000038         004200 01  TEST-1-DATA.                                                 NC2234.2
   000039         004300   03        TEST-1-1            PIC     9(6).                    NC2234.2
   000040         004400   03        TEST-1-2            PIC     $(3)9.99.                NC2234.2
   000041         004500   03        TEST-1-3            PIC     X(10).                   NC2234.2
   000042         004600   03        TEST-1-4            PIC     XXBXX/XX.                NC2234.2
   000043         004700   03        TEST-1-5            PIC     A(6).                    NC2234.2
   000044         004800   03        TEST-1-6            PIC     9(6).                    NC2234.2
   000045         004900   03        TEST-1-7            PIC     $(3)9.99.                NC2234.2
   000046         005000   03        TEST-1-8            PIC     X(10).                   NC2234.2
   000047         005100   03        TEST-1-9            PIC     XXBXX/XX.                NC2234.2
   000048         005200   03        TEST-1-10           PIC     A(6).                    NC2234.2
   000049         005300 01  NUM-1234                    PIC     9(4) VALUE 1234.         NC2234.2
   000050         005400 01  TEST-8-DATA-1               PIC     $(3)9.99.                NC2234.2
   000051         005500 01  TEST-8-DATA-2               PIC     A(10).                   NC2234.2
   000052         005600 01  TEST-RESULTS.                                                NC2234.2
   000053         005700     02 FILLER                   PIC X      VALUE SPACE.          NC2234.2 IMP
   000054         005800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2234.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02 FILLER                   PIC X      VALUE SPACE.          NC2234.2 IMP
   000056         006000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2234.2 IMP
   000057         006100     02 FILLER                   PIC X      VALUE SPACE.          NC2234.2 IMP
   000058         006200     02  PAR-NAME.                                                NC2234.2
   000059         006300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2234.2 IMP
   000060         006400       03  PARDOT-X              PIC X      VALUE SPACE.          NC2234.2 IMP
   000061         006500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2234.2 IMP
   000062         006600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2234.2 IMP
   000063         006700     02 RE-MARK                  PIC X(61).                       NC2234.2
   000064         006800 01  TEST-COMPUTED.                                               NC2234.2
   000065         006900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2234.2 IMP
   000066         007000     02 FILLER                   PIC X(17)  VALUE                 NC2234.2
   000067         007100            "       COMPUTED=".                                   NC2234.2
   000068         007200     02 COMPUTED-X.                                               NC2234.2
   000069         007300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2234.2 IMP
   000070         007400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2234.2 69
   000071         007500                                 PIC -9(9).9(9).                  NC2234.2
   000072         007600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2234.2 69
   000073         007700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2234.2 69
   000074         007800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2234.2 69
   000075         007900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2234.2 69
   000076         008000         04 COMPUTED-18V0                    PIC -9(18).          NC2234.2
   000077         008100         04 FILLER                           PIC X.               NC2234.2
   000078         008200     03 FILLER PIC X(50) VALUE SPACE.                             NC2234.2 IMP
   000079         008300 01  TEST-CORRECT.                                                NC2234.2
   000080         008400     02 FILLER PIC X(30) VALUE SPACE.                             NC2234.2 IMP
   000081         008500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2234.2
   000082         008600     02 CORRECT-X.                                                NC2234.2
   000083         008700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2234.2 IMP
   000084         008800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2234.2 83
   000085         008900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2234.2 83
   000086         009000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2234.2 83
   000087         009100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2234.2 83
   000088         009200     03      CR-18V0 REDEFINES CORRECT-A.                         NC2234.2 83
   000089         009300         04 CORRECT-18V0                     PIC -9(18).          NC2234.2
   000090         009400         04 FILLER                           PIC X.               NC2234.2
   000091         009500     03 FILLER PIC X(2) VALUE SPACE.                              NC2234.2 IMP
   000092         009600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2234.2 IMP
   000093         009700 01  CCVS-C-1.                                                    NC2234.2
   000094         009800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2234.2
   000095         009900-    "SS  PARAGRAPH-NAME                                          NC2234.2
   000096         010000-    "       REMARKS".                                            NC2234.2
   000097         010100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2234.2 IMP
   000098         010200 01  CCVS-C-2.                                                    NC2234.2
   000099         010300     02 FILLER                     PIC X        VALUE SPACE.      NC2234.2 IMP
   000100         010400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2234.2
   000101         010500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2234.2 IMP
   000102         010600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2234.2
   000103         010700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2234.2 IMP
   000104         010800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2234.2 IMP
   000105         010900 01  REC-CT                        PIC 99       VALUE ZERO.       NC2234.2 IMP
   000106         011000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2234.2 IMP
   000107         011100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2234.2 IMP
   000108         011200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2234.2 IMP
   000109         011300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2234.2 IMP
   000110         011400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2234.2 IMP
   000111         011500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2234.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2234.2 IMP
   000113         011700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2234.2 IMP
   000114         011800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2234.2 IMP
   000115         011900 01  CCVS-H-1.                                                    NC2234.2
   000116         012000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2234.2 IMP
   000117         012100     02  FILLER                    PIC X(42)    VALUE             NC2234.2
   000118         012200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2234.2
   000119         012300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2234.2 IMP
   000120         012400 01  CCVS-H-2A.                                                   NC2234.2
   000121         012500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2234.2 IMP
   000122         012600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2234.2
   000123         012700   02  FILLER                        PIC XXXX   VALUE             NC2234.2
   000124         012800     "4.2 ".                                                      NC2234.2
   000125         012900   02  FILLER                        PIC X(28)  VALUE             NC2234.2
   000126         013000            " COPY - NOT FOR DISTRIBUTION".                       NC2234.2
   000127         013100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2234.2 IMP
   000128         013200                                                                  NC2234.2
   000129         013300 01  CCVS-H-2B.                                                   NC2234.2
   000130         013400   02  FILLER                        PIC X(15)  VALUE             NC2234.2
   000131         013500            "TEST RESULT OF ".                                    NC2234.2
   000132         013600   02  TEST-ID                       PIC X(9).                    NC2234.2
   000133         013700   02  FILLER                        PIC X(4)   VALUE             NC2234.2
   000134         013800            " IN ".                                               NC2234.2
   000135         013900   02  FILLER                        PIC X(12)  VALUE             NC2234.2
   000136         014000     " HIGH       ".                                              NC2234.2
   000137         014100   02  FILLER                        PIC X(22)  VALUE             NC2234.2
   000138         014200            " LEVEL VALIDATION FOR ".                             NC2234.2
   000139         014300   02  FILLER                        PIC X(58)  VALUE             NC2234.2
   000140         014400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2234.2
   000141         014500 01  CCVS-H-3.                                                    NC2234.2
   000142         014600     02  FILLER                      PIC X(34)  VALUE             NC2234.2
   000143         014700            " FOR OFFICIAL USE ONLY    ".                         NC2234.2
   000144         014800     02  FILLER                      PIC X(58)  VALUE             NC2234.2
   000145         014900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2234.2
   000146         015000     02  FILLER                      PIC X(28)  VALUE             NC2234.2
   000147         015100            "  COPYRIGHT   1985 ".                                NC2234.2
   000148         015200 01  CCVS-E-1.                                                    NC2234.2
   000149         015300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2234.2 IMP
   000150         015400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2234.2
   000151         015500     02 ID-AGAIN                     PIC X(9).                    NC2234.2
   000152         015600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2234.2 IMP
   000153         015700 01  CCVS-E-2.                                                    NC2234.2
   000154         015800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2234.2 IMP
   000155         015900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2234.2 IMP
   000156         016000     02 CCVS-E-2-2.                                               NC2234.2
   000157         016100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2234.2 IMP
   000158         016200         03 FILLER                   PIC X      VALUE SPACE.      NC2234.2 IMP
   000159         016300         03 ENDER-DESC               PIC X(44)  VALUE             NC2234.2
   000160         016400            "ERRORS ENCOUNTERED".                                 NC2234.2
   000161         016500 01  CCVS-E-3.                                                    NC2234.2
   000162         016600     02  FILLER                      PIC X(22)  VALUE             NC2234.2
   000163         016700            " FOR OFFICIAL USE ONLY".                             NC2234.2
   000164         016800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2234.2 IMP
   000165         016900     02  FILLER                      PIC X(58)  VALUE             NC2234.2
   000166         017000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2234.2
   000167         017100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2234.2 IMP
   000168         017200     02 FILLER                       PIC X(15)  VALUE             NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300             " COPYRIGHT 1985".                                   NC2234.2
   000170         017400 01  CCVS-E-4.                                                    NC2234.2
   000171         017500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2234.2 IMP
   000172         017600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2234.2
   000173         017700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2234.2 IMP
   000174         017800     02 FILLER                       PIC X(40)  VALUE             NC2234.2
   000175         017900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2234.2
   000176         018000 01  XXINFO.                                                      NC2234.2
   000177         018100     02 FILLER                       PIC X(19)  VALUE             NC2234.2
   000178         018200            "*** INFORMATION ***".                                NC2234.2
   000179         018300     02 INFO-TEXT.                                                NC2234.2
   000180         018400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2234.2 IMP
   000181         018500       04 XXCOMPUTED                 PIC X(20).                   NC2234.2
   000182         018600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2234.2 IMP
   000183         018700       04 XXCORRECT                  PIC X(20).                   NC2234.2
   000184         018800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2234.2
   000185         018900 01  HYPHEN-LINE.                                                 NC2234.2
   000186         019000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2234.2 IMP
   000187         019100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2234.2
   000188         019200-    "*****************************************".                 NC2234.2
   000189         019300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2234.2
   000190         019400-    "******************************".                            NC2234.2
   000191         019500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2234.2
   000192         019600     "NC223A".                                                    NC2234.2
   000193         019700 PROCEDURE DIVISION.                                              NC2234.2
   000194         019800 CCVS1 SECTION.                                                   NC2234.2
   000195         019900 OPEN-FILES.                                                      NC2234.2
   000196         020000     OPEN     OUTPUT PRINT-FILE.                                  NC2234.2 34
   000197         020100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2234.2 191 132 191 151
   000198         020200     MOVE    SPACE TO TEST-RESULTS.                               NC2234.2 IMP 52
   000199         020300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2234.2 224 229
   000200         020400     GO TO CCVS1-EXIT.                                            NC2234.2 307
   000201         020500 CLOSE-FILES.                                                     NC2234.2
   000202         020600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2234.2 233 255 34
   000203         020700 TERMINATE-CCVS.                                                  NC2234.2
   000204         020800     EXIT PROGRAM.                                                NC2234.2
   000205         020900 TERMINATE-CALL.                                                  NC2234.2
   000206         021000     STOP     RUN.                                                NC2234.2
   000207         021100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2234.2 56 108
   000208         021200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2234.2 56 109
   000209         021300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2234.2 56 107
   000210         021400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2234.2 56 106
   000211         021500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2234.2 63
   000212         021600 PRINT-DETAIL.                                                    NC2234.2
   000213         021700     IF REC-CT NOT EQUAL TO ZERO                                  NC2234.2 105 IMP
   000214      1  021800             MOVE "." TO PARDOT-X                                 NC2234.2 60
   000215      1  021900             MOVE REC-CT TO DOTVALUE.                             NC2234.2 105 61
   000216         022000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2234.2 52 35 267
   000217         022100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2234.2 56 267
   000218      1  022200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2234.2 284 297
   000219      1  022300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2234.2 298 306
   000220         022400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2234.2 IMP 56 IMP 68
   000221         022500     MOVE SPACE TO CORRECT-X.                                     NC2234.2 IMP 82
   000222         022600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2234.2 105 IMP IMP 58
   000223         022700     MOVE     SPACE TO RE-MARK.                                   NC2234.2 IMP 63
   000224         022800 HEAD-ROUTINE.                                                    NC2234.2
   000225         022900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2234.2 115 36 267
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2234.2 120 36 267
   000227         023100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2234.2 129 36 267
   000228         023200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2234.2 141 36 267
   000229         023300 COLUMN-NAMES-ROUTINE.                                            NC2234.2
   000230         023400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2234.2 93 36 267
   000231         023500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2234.2 98 36 267
   000232         023600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2234.2 185 36 267
   000233         023700 END-ROUTINE.                                                     NC2234.2
   000234         023800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2234.2 185 36 267
   000235         023900 END-RTN-EXIT.                                                    NC2234.2
   000236         024000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2234.2 148 36 267
   000237         024100 END-ROUTINE-1.                                                   NC2234.2
   000238         024200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2234.2 107 111 108
   000239         024300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2234.2 111 106 111
   000240         024400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2234.2 109 111
   000241         024500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2234.2
   000242         024600                                                                  NC2234.2
   000243         024700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2234.2 109 171
   000244         024800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2234.2 111 173
   000245         024900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2234.2 170 156
   000246         025000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2234.2 153 36 267
   000247         025100  END-ROUTINE-12.                                                 NC2234.2
   000248         025200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2234.2 159
   000249         025300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2234.2 107 IMP
   000250      1  025400         MOVE "NO " TO ERROR-TOTAL                                NC2234.2 157
   000251         025500         ELSE                                                     NC2234.2
   000252      1  025600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2234.2 107 157
   000253         025700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2234.2 153 36
   000254         025800     PERFORM WRITE-LINE.                                          NC2234.2 267
   000255         025900 END-ROUTINE-13.                                                  NC2234.2
   000256         026000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2234.2 106 IMP
   000257      1  026100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2234.2 157
   000258      1  026200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2234.2 106 157
   000259         026300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2234.2 159
   000260         026400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2234.2 153 36 267
   000261         026500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2234.2 108 IMP
   000262      1  026600          MOVE "NO " TO ERROR-TOTAL                               NC2234.2 157
   000263      1  026700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2234.2 108 157
   000264         026800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2234.2 159
   000265         026900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2234.2 153 36 267
   000266         027000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2234.2 161 36 267
   000267         027100 WRITE-LINE.                                                      NC2234.2
   000268         027200     ADD 1 TO RECORD-COUNT.                                       NC2234.2 113
   000269         027300     IF RECORD-COUNT GREATER 50                                   NC2234.2 113
   000270      1  027400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2234.2 36 112
   000271      1  027500         MOVE SPACE TO DUMMY-RECORD                               NC2234.2 IMP 36
   000272      1  027600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2234.2 36
   000273      1  027700         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2234.2 93 36 279
   000274      1  027800         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2234.2 98 36 279
   000275      1  027900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2234.2 185 36 279
   000276      1  028000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2234.2 112 36
   000277      1  028100         MOVE ZERO TO RECORD-COUNT.                               NC2234.2 IMP 113
   000278         028200     PERFORM WRT-LN.                                              NC2234.2 279
   000279         028300 WRT-LN.                                                          NC2234.2
   000280         028400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2234.2 36
   000281         028500     MOVE SPACE TO DUMMY-RECORD.                                  NC2234.2 IMP 36
   000282         028600 BLANK-LINE-PRINT.                                                NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     PERFORM WRT-LN.                                              NC2234.2 279
   000284         028800 FAIL-ROUTINE.                                                    NC2234.2
   000285         028900     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2234.2 68 IMP 292
   000286         029000     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2234.2 82 IMP 292
   000287         029100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2234.2 114 184
   000288         029200     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2234.2 179
   000289         029300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2234.2 176 36 267
   000290         029400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2234.2 IMP 184
   000291         029500     GO TO  FAIL-ROUTINE-EX.                                      NC2234.2 297
   000292         029600 FAIL-ROUTINE-WRITE.                                              NC2234.2
   000293         029700     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2234.2 64 35 267
   000294         029800     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2234.2 114 92
   000295         029900     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2234.2 79 35 267
   000296         030000     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2234.2 IMP 92
   000297         030100 FAIL-ROUTINE-EX. EXIT.                                           NC2234.2
   000298         030200 BAIL-OUT.                                                        NC2234.2
   000299         030300     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2234.2 69 IMP 301
   000300         030400     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2234.2 83 IMP 306
   000301         030500 BAIL-OUT-WRITE.                                                  NC2234.2
   000302         030600     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2234.2 83 183 69 181
   000303         030700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2234.2 114 184
   000304         030800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2234.2 176 36 267
   000305         030900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2234.2 IMP 184
   000306         031000 BAIL-OUT-EX. EXIT.                                               NC2234.2
   000307         031100 CCVS1-EXIT.                                                      NC2234.2
   000308         031200     EXIT.                                                        NC2234.2
   000309         031300 SECT-NC223A-001 SECTION.                                         NC2234.2
   000310         031400*                                                                 NC2234.2
   000311         031500 INI-INIT-GF-1.                                                   NC2234.2
   000312         031600     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   000313         031700     MOVE   "VI-92 6.16.2 GR5" TO ANSI-REFERENCE.                 NC2234.2 114
   000314         031800     MOVE    1 TO REC-CT.                                         NC2234.2 105
   000315         031900 INI-TEST-GF-1-0.                                                 NC2234.2
   000316         032000     INITIALIZE TEST-1-DATA.                                      NC2234.2 38
   000317         032100     GO TO   INI-TEST-GF-1-1.                                     NC2234.2 322
   000318         032200 INI-DELETE-GF-1.                                                 NC2234.2
   000319         032300     PERFORM DE-LETE.                                             NC2234.2 210
   000320         032400     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000321         032500     GO TO   INI-INIT-GF-2.                                       NC2234.2 511
   000322         032600 INI-TEST-GF-1-1.                                                 NC2234.2
   000323         032700     MOVE   "INI-TEST-GF-1-1" TO PAR-NAME.                        NC2234.2 58
   000324         032800     IF      TEST-1-1 = ZERO                                      NC2234.2 39 IMP
   000325      1  032900             PERFORM PASS                                         NC2234.2 208
   000326      1  033000             GO TO INI-WRITE-GF-1-1                               NC2234.2 337
   000327         033100     ELSE                                                         NC2234.2
   000328      1  033200             GO TO INI-FAIL-GF-1-1.                               NC2234.2 332
   000329         033300 INI-DELETE-GF-1-1.                                               NC2234.2
   000330         033400     PERFORM DE-LETE.                                             NC2234.2 210
   000331         033500     GO TO INI-WRITE-GF-1-1.                                      NC2234.2 337
   000332         033600 INI-FAIL-GF-1-1.                                                 NC2234.2
   000333         033700     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   000334         033800     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   000335         033900     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000336         034000     PERFORM FAIL.                                                NC2234.2 209
   000337         034100 INI-WRITE-GF-1-1.                                                NC2234.2
   000338         034200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000339         034300*                                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 INI-TEST-GF-1-2.                                                 NC2234.2
   000341         034500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000342         034600     MOVE   "INI-TEST-GF-1-2" TO PAR-NAME.                        NC2234.2 58
   000343         034700     IF      TEST-1-2 = "  $0.00"                                 NC2234.2 40
   000344      1  034800             PERFORM PASS                                         NC2234.2 208
   000345      1  034900             GO TO INI-WRITE-GF-1-2                               NC2234.2 356
   000346         035000     ELSE                                                         NC2234.2
   000347      1  035100             GO TO INI-FAIL-GF-1-2.                               NC2234.2 351
   000348         035200 INI-DELETE-GF-1-2.                                               NC2234.2
   000349         035300     PERFORM DE-LETE.                                             NC2234.2 210
   000350         035400     GO TO INI-WRITE-GF-1-2.                                      NC2234.2 356
   000351         035500 INI-FAIL-GF-1-2.                                                 NC2234.2
   000352         035600     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   000353         035700     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   000354         035800     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000355         035900     PERFORM FAIL.                                                NC2234.2 209
   000356         036000 INI-WRITE-GF-1-2.                                                NC2234.2
   000357         036100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000358         036200*                                                                 NC2234.2
   000359         036300 INI-TEST-GF-1-3.                                                 NC2234.2
   000360         036400     ADD     1 TO REC-CT.                                         NC2234.2 105
   000361         036500     MOVE   "INI-TEST-GF-1-3" TO PAR-NAME.                        NC2234.2 58
   000362         036600     IF      TEST-1-3 = SPACES                                    NC2234.2 41 IMP
   000363      1  036700             PERFORM PASS                                         NC2234.2 208
   000364      1  036800             GO TO INI-WRITE-GF-1-3                               NC2234.2 375
   000365         036900     ELSE                                                         NC2234.2
   000366      1  037000             GO TO INI-FAIL-GF-1-3.                               NC2234.2 370
   000367         037100 INI-DELETE-GF-1-3.                                               NC2234.2
   000368         037200     PERFORM DE-LETE.                                             NC2234.2 210
   000369         037300     GO TO INI-WRITE-GF-1-3.                                      NC2234.2 375
   000370         037400 INI-FAIL-GF-1-3.                                                 NC2234.2
   000371         037500     MOVE    SPACES   TO CORRECT-X                                NC2234.2 IMP 82
   000372         037600     MOVE    TEST-1-3 TO COMPUTED-X                               NC2234.2 41 68
   000373         037700     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000374         037800     PERFORM FAIL.                                                NC2234.2 209
   000375         037900 INI-WRITE-GF-1-3.                                                NC2234.2
   000376         038000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000377         038100*                                                                 NC2234.2
   000378         038200 INI-TEST-GF-1-4.                                                 NC2234.2
   000379         038300     ADD     1 TO REC-CT.                                         NC2234.2 105
   000380         038400     MOVE   "INI-TEST-GF-1-4" TO PAR-NAME.                        NC2234.2 58
   000381         038500     IF      TEST-1-4 = "     /  "                                NC2234.2 42
   000382      1  038600             PERFORM PASS                                         NC2234.2 208
   000383      1  038700             GO TO INI-WRITE-GF-1-4                               NC2234.2 394
   000384         038800     ELSE                                                         NC2234.2
   000385      1  038900             GO TO INI-FAIL-GF-1-4.                               NC2234.2 389
   000386         039000 INI-DELETE-GF-1-4.                                               NC2234.2
   000387         039100     PERFORM DE-LETE.                                             NC2234.2 210
   000388         039200     GO TO INI-WRITE-GF-1-4.                                      NC2234.2 394
   000389         039300 INI-FAIL-GF-1-4.                                                 NC2234.2
   000390         039400     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   000391         039500     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   000392         039600     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000393         039700     PERFORM FAIL.                                                NC2234.2 209
   000394         039800 INI-WRITE-GF-1-4.                                                NC2234.2
   000395         039900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000396         040000*                                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100 INI-TEST-GF-1-5.                                                 NC2234.2
   000398         040200     ADD     1 TO REC-CT.                                         NC2234.2 105
   000399         040300     MOVE   "INI-TEST-GF-1-5" TO PAR-NAME.                        NC2234.2 58
   000400         040400     IF      TEST-1-5 = SPACES                                    NC2234.2 43 IMP
   000401      1  040500             PERFORM PASS                                         NC2234.2 208
   000402      1  040600             GO TO INI-WRITE-GF-1-5                               NC2234.2 413
   000403         040700     ELSE                                                         NC2234.2
   000404      1  040800             GO TO INI-FAIL-GF-1-5.                               NC2234.2 408
   000405         040900 INI-DELETE-GF-1-5.                                               NC2234.2
   000406         041000     PERFORM DE-LETE.                                             NC2234.2 210
   000407         041100     GO TO INI-WRITE-GF-1-5.                                      NC2234.2 413
   000408         041200 INI-FAIL-GF-1-5.                                                 NC2234.2
   000409         041300             MOVE    SPACES   TO CORRECT-X                        NC2234.2 IMP 82
   000410         041400             MOVE    TEST-1-5 TO COMPUTED-X                       NC2234.2 43 68
   000411         041500             MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK          NC2234.2 63
   000412         041600             PERFORM FAIL.                                        NC2234.2 209
   000413         041700 INI-WRITE-GF-1-5.                                                NC2234.2
   000414         041800             PERFORM PRINT-DETAIL.                                NC2234.2 212
   000415         041900*                                                                 NC2234.2
   000416         042000 INI-TEST-GF-1-6.                                                 NC2234.2
   000417         042100     ADD     1 TO REC-CT.                                         NC2234.2 105
   000418         042200     MOVE   "INI-TEST-GF-1-6" TO PAR-NAME.                        NC2234.2 58
   000419         042300     IF      TEST-1-6 = ZERO                                      NC2234.2 44 IMP
   000420      1  042400             PERFORM PASS                                         NC2234.2 208
   000421      1  042500             GO TO INI-WRITE-GF-1-6                               NC2234.2 432
   000422         042600     ELSE                                                         NC2234.2
   000423      1  042700             GO TO INI-FAIL-GF-1-6.                               NC2234.2 427
   000424         042800 INI-DELETE-GF-1-6.                                               NC2234.2
   000425         042900     PERFORM DE-LETE.                                             NC2234.2 210
   000426         043000     GO TO INI-WRITE-GF-1-6.                                      NC2234.2 432
   000427         043100 INI-FAIL-GF-1-6.                                                 NC2234.2
   000428         043200     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   000429         043300     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   000430         043400     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000431         043500     PERFORM FAIL.                                                NC2234.2 209
   000432         043600 INI-WRITE-GF-1-6.                                                NC2234.2
   000433         043700     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000434         043800*                                                                 NC2234.2
   000435         043900 INI-TEST-GF-1-7.                                                 NC2234.2
   000436         044000     ADD     1 TO REC-CT.                                         NC2234.2 105
   000437         044100     MOVE   "INI-TEST-GF-1-7" TO PAR-NAME.                        NC2234.2 58
   000438         044200     IF      TEST-1-7 = "  $0.00"                                 NC2234.2 45
   000439      1  044300             PERFORM PASS                                         NC2234.2 208
   000440      1  044400             GO TO INI-WRITE-GF-1-7                               NC2234.2 451
   000441         044500     ELSE                                                         NC2234.2
   000442      1  044600             GO TO INI-FAIL-GF-1-7.                               NC2234.2 446
   000443         044700 INI-DELETE-GF-1-7.                                               NC2234.2
   000444         044800     PERFORM DE-LETE.                                             NC2234.2 210
   000445         044900     GO TO INI-WRITE-GF-1-7.                                      NC2234.2 451
   000446         045000 INI-FAIL-GF-1-7.                                                 NC2234.2
   000447         045100     MOVE   "  $0.00"  TO CORRECT-X.                              NC2234.2 82
   000448         045200     MOVE    TEST-1-7 TO COMPUTED-X.                              NC2234.2 45 68
   000449         045300     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK.                 NC2234.2 63
   000450         045400     PERFORM FAIL.                                                NC2234.2 209
   000451         045500 INI-WRITE-GF-1-7.                                                NC2234.2
   000452         045600     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000453         045700*                                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800 INI-TEST-GF-1-8.                                                 NC2234.2
   000455         045900     ADD     1 TO REC-CT.                                         NC2234.2 105
   000456         046000     MOVE   "INI-TEST-GF-1-8" TO PAR-NAME.                        NC2234.2 58
   000457         046100     IF      TEST-1-8 = SPACES                                    NC2234.2 46 IMP
   000458      1  046200             PERFORM PASS                                         NC2234.2 208
   000459      1  046300             GO TO INI-WRITE-GF-1-8                               NC2234.2 470
   000460         046400     ELSE                                                         NC2234.2
   000461      1  046500             GO TO INI-FAIL-GF-1-8.                               NC2234.2 465
   000462         046600 INI-DELETE-GF-1-8.                                               NC2234.2
   000463         046700     PERFORM DE-LETE.                                             NC2234.2 210
   000464         046800     GO TO INI-WRITE-GF-1-8.                                      NC2234.2 470
   000465         046900 INI-FAIL-GF-1-8.                                                 NC2234.2
   000466         047000     MOVE    SPACES   TO CORRECT-X                                NC2234.2 IMP 82
   000467         047100     MOVE    TEST-1-8 TO COMPUTED-X                               NC2234.2 46 68
   000468         047200     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000469         047300     PERFORM FAIL.                                                NC2234.2 209
   000470         047400 INI-WRITE-GF-1-8.                                                NC2234.2
   000471         047500     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000472         047600*                                                                 NC2234.2
   000473         047700 INI-TEST-GF-1-9.                                                 NC2234.2
   000474         047800     ADD     1 TO REC-CT.                                         NC2234.2 105
   000475         047900     MOVE   "INI-TEST-GF-1-9" TO PAR-NAME.                        NC2234.2 58
   000476         048000     IF      TEST-1-9 = "     /  "                                NC2234.2 47
   000477      1  048100             PERFORM PASS                                         NC2234.2 208
   000478      1  048200             GO TO INI-WRITE-GF-1-9                               NC2234.2 489
   000479         048300     ELSE                                                         NC2234.2
   000480      1  048400             GO TO INI-FAIL-GF-1-9.                               NC2234.2 484
   000481         048500 INI-DELETE-GF-1-9.                                               NC2234.2
   000482         048600     PERFORM DE-LETE.                                             NC2234.2 210
   000483         048700     GO TO INI-WRITE-GF-1-9.                                      NC2234.2 489
   000484         048800 INI-FAIL-GF-1-9.                                                 NC2234.2
   000485         048900     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   000486         049000     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   000487         049100     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000488         049200     PERFORM FAIL.                                                NC2234.2 209
   000489         049300 INI-WRITE-GF-1-9.                                                NC2234.2
   000490         049400     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000491         049500*                                                                 NC2234.2
   000492         049600 INI-TEST-GF-1-10.                                                NC2234.2
   000493         049700     ADD     1 TO REC-CT.                                         NC2234.2 105
   000494         049800     MOVE   "INI-TEST-GF-1-10" TO PAR-NAME.                       NC2234.2 58
   000495         049900     IF      TEST-1-10 = SPACES                                   NC2234.2 48 IMP
   000496      1  050000             PERFORM PASS                                         NC2234.2 208
   000497      1  050100             GO TO INI-WRITE-GF-1-10                              NC2234.2 508
   000498         050200     ELSE                                                         NC2234.2
   000499      1  050300             GO TO INI-FAIL-GF-1-10.                              NC2234.2 503
   000500         050400 INI-DELETE-GF-1-10.                                              NC2234.2
   000501         050500     PERFORM DE-LETE.                                             NC2234.2 210
   000502         050600     GO TO INI-WRITE-GF-1-10.                                     NC2234.2 508
   000503         050700 INI-FAIL-GF-1-10.                                                NC2234.2
   000504         050800     MOVE    SPACES    TO CORRECT-X                               NC2234.2 IMP 82
   000505         050900     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   000506         051000     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000507         051100     PERFORM FAIL.                                                NC2234.2 209
   000508         051200 INI-WRITE-GF-1-10.                                               NC2234.2
   000509         051300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000510         051400*                                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500 INI-INIT-GF-2.                                                   NC2234.2
   000512         051600     MOVE   "VI-91/2 6.16.2 GR2" TO ANSI-REFERENCE.               NC2234.2 114
   000513         051700     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   000514         051800     MOVE    1 TO REC-CT.                                         NC2234.2 105
   000515         051900 INI-TEST-GF-2-0.                                                 NC2234.2
   000516         052000     INITIALIZE TEST-1-DATA                                       NC2234.2 38
   000517         052100             REPLACING ALPHABETIC DATA BY "AAAAAA".               NC2234.2
   000518         052200     GO TO   INI-TEST-GF-2-1.                                     NC2234.2 524
   000519         052300 INI-DELETE-GF-2.                                                 NC2234.2
   000520         052400     PERFORM DE-LETE.                                             NC2234.2 210
   000521         052500     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000522         052600     GO TO   INI-INIT-GF-3.                                       NC2234.2 721
   000523         052700*                                                                 NC2234.2
   000524         052800 INI-TEST-GF-2-1.                                                 NC2234.2
   000525         052900     MOVE   "INI-TEST-GF-2-1" TO PAR-NAME.                        NC2234.2 58
   000526         053000     IF      TEST-1-5 = "AAAAAA"                                  NC2234.2 43
   000527      1  053100             PERFORM PASS                                         NC2234.2 208
   000528      1  053200             GO TO INI-WRITE-GF-2-1                               NC2234.2 539
   000529         053300     ELSE                                                         NC2234.2
   000530      1  053400             GO TO INI-FAIL-GF-2-1.                               NC2234.2 534
   000531         053500 INI-DELETE-GF-2-1.                                               NC2234.2
   000532         053600     PERFORM DE-LETE.                                             NC2234.2 210
   000533         053700     GO TO INI-WRITE-GF-2-1.                                      NC2234.2 539
   000534         053800 INI-FAIL-GF-2-1.                                                 NC2234.2
   000535         053900     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   000536         054000     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   000537         054100     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000538         054200     PERFORM FAIL.                                                NC2234.2 209
   000539         054300 INI-WRITE-GF-2-1.                                                NC2234.2
   000540         054400     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000541         054500*                                                                 NC2234.2
   000542         054600 INI-TEST-GF-2-2.                                                 NC2234.2
   000543         054700     ADD 1 TO REC-CT.                                             NC2234.2 105
   000544         054800     MOVE   "INI-TEST-GF-2-2" TO PAR-NAME.                        NC2234.2 58
   000545         054900     IF      TEST-1-10 = "AAAAAA"                                 NC2234.2 48
   000546      1  055000             PERFORM PASS                                         NC2234.2 208
   000547      1  055100             GO TO INI-WRITE-GF-2-2                               NC2234.2 558
   000548         055200     ELSE                                                         NC2234.2
   000549      1  055300             GO TO INI-FAIL-GF-2-2.                               NC2234.2 553
   000550         055400 INI-DELETE-GF-2-2.                                               NC2234.2
   000551         055500     PERFORM DE-LETE.                                             NC2234.2 210
   000552         055600     GO TO INI-WRITE-GF-2-2.                                      NC2234.2 558
   000553         055700 INI-FAIL-GF-2-2.                                                 NC2234.2
   000554         055800     MOVE   "AAAAAA"   TO CORRECT-X                               NC2234.2 82
   000555         055900     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   000556         056000     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000557         056100     PERFORM FAIL.                                                NC2234.2 209
   000558         056200 INI-WRITE-GF-2-2.                                                NC2234.2
   000559         056300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000560         056400*                                                                 NC2234.2
   000561         056500 INI-TEST-GF-2-3.                                                 NC2234.2
   000562         056600     ADD 1 TO REC-CT.                                             NC2234.2 105
   000563         056700     MOVE   "INI-TEST-GF-2-3" TO PAR-NAME.                        NC2234.2 58
   000564         056800     IF      TEST-1-1 = ZERO                                      NC2234.2 39 IMP
   000565      1  056900             PERFORM PASS                                         NC2234.2 208
   000566      1  057000             GO TO INI-WRITE-GF-2-3                               NC2234.2 578
   000567         057100     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057200             GO TO INI-FAIL-GF-2-3.                               NC2234.2 572
   000569         057300 INI-DELETE-GF-2-3.                                               NC2234.2
   000570         057400     PERFORM DE-LETE.                                             NC2234.2 210
   000571         057500     GO TO INI-WRITE-GF-2-3.                                      NC2234.2 578
   000572         057600 INI-FAIL-GF-2-3.                                                 NC2234.2
   000573         057700     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   000574         057800     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   000575         057900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000576         058000          TO RE-MARK                                              NC2234.2 63
   000577         058100     PERFORM FAIL.                                                NC2234.2 209
   000578         058200 INI-WRITE-GF-2-3.                                                NC2234.2
   000579         058300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000580         058400*                                                                 NC2234.2
   000581         058500 INI-TEST-GF-2-4.                                                 NC2234.2
   000582         058600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000583         058700     MOVE   "INI-TEST-GF-2-4" TO PAR-NAME.                        NC2234.2 58
   000584         058800     IF      TEST-1-2 = "  $0.00"                                 NC2234.2 40
   000585      1  058900             PERFORM PASS                                         NC2234.2 208
   000586      1  059000             GO TO INI-WRITE-GF-2-4                               NC2234.2 598
   000587         059100     ELSE                                                         NC2234.2
   000588      1  059200             GO TO INI-FAIL-GF-2-4.                               NC2234.2 592
   000589         059300 INI-DELETE-GF-2-4.                                               NC2234.2
   000590         059400     PERFORM DE-LETE.                                             NC2234.2 210
   000591         059500     GO TO INI-WRITE-GF-2-4.                                      NC2234.2 598
   000592         059600 INI-FAIL-GF-2-4.                                                 NC2234.2
   000593         059700     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   000594         059800     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   000595         059900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000596         060000          TO RE-MARK                                              NC2234.2 63
   000597         060100     PERFORM FAIL.                                                NC2234.2 209
   000598         060200 INI-WRITE-GF-2-4.                                                NC2234.2
   000599         060300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000600         060400*                                                                 NC2234.2
   000601         060500 INI-TEST-GF-2-5.                                                 NC2234.2
   000602         060600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000603         060700     MOVE   "INI-TEST-GF-2-5" TO PAR-NAME.                        NC2234.2 58
   000604         060800     IF      TEST-1-3 = SPACES                                    NC2234.2 41 IMP
   000605      1  060900             PERFORM PASS                                         NC2234.2 208
   000606      1  061000             GO TO INI-WRITE-GF-2-5                               NC2234.2 618
   000607         061100     ELSE                                                         NC2234.2
   000608      1  061200             GO TO INI-FAIL-GF-2-5.                               NC2234.2 612
   000609         061300 INI-DELETE-GF-2-5.                                               NC2234.2
   000610         061400     PERFORM DE-LETE.                                             NC2234.2 210
   000611         061500     GO TO INI-WRITE-GF-2-5.                                      NC2234.2 618
   000612         061600 INI-FAIL-GF-2-5.                                                 NC2234.2
   000613         061700     MOVE    SPACES   TO CORRECT-X                                NC2234.2 IMP 82
   000614         061800     MOVE    TEST-1-3 TO COMPUTED-X                               NC2234.2 41 68
   000615         061900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000616         062000          TO RE-MARK                                              NC2234.2 63
   000617         062100     PERFORM FAIL.                                                NC2234.2 209
   000618         062200 INI-WRITE-GF-2-5.                                                NC2234.2
   000619         062300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000620         062400*                                                                 NC2234.2
   000621         062500 INI-TEST-GF-2-6.                                                 NC2234.2
   000622         062600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000623         062700     MOVE   "INI-TEST-GF-2-6" TO PAR-NAME.                        NC2234.2 58
   000624         062800     IF      TEST-1-4 = "     /  "                                NC2234.2 42
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062900             PERFORM PASS                                         NC2234.2 208
   000626      1  063000             GO TO INI-WRITE-GF-2-6                               NC2234.2 638
   000627         063100     ELSE                                                         NC2234.2
   000628      1  063200             GO TO INI-FAIL-GF-2-6.                               NC2234.2 632
   000629         063300 INI-DELETE-GF-2-6.                                               NC2234.2
   000630         063400     PERFORM DE-LETE.                                             NC2234.2 210
   000631         063500     GO TO INI-WRITE-GF-2-6.                                      NC2234.2 638
   000632         063600 INI-FAIL-GF-2-6.                                                 NC2234.2
   000633         063700     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   000634         063800     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   000635         063900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000636         064000          TO RE-MARK                                              NC2234.2 63
   000637         064100     PERFORM FAIL.                                                NC2234.2 209
   000638         064200 INI-WRITE-GF-2-6.                                                NC2234.2
   000639         064300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000640         064400*                                                                 NC2234.2
   000641         064500 INI-TEST-GF-2-7.                                                 NC2234.2
   000642         064600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000643         064700     MOVE   "INI-TEST-GF-2-7" TO PAR-NAME.                        NC2234.2 58
   000644         064800     IF      TEST-1-6 = ZERO                                      NC2234.2 44 IMP
   000645      1  064900             PERFORM PASS                                         NC2234.2 208
   000646      1  065000             GO TO INI-WRITE-GF-2-7                               NC2234.2 658
   000647         065100     ELSE                                                         NC2234.2
   000648      1  065200             GO TO INI-FAIL-GF-2-7.                               NC2234.2 652
   000649         065300 INI-DELETE-GF-2-7.                                               NC2234.2
   000650         065400     PERFORM DE-LETE.                                             NC2234.2 210
   000651         065500     GO TO INI-WRITE-GF-2-7.                                      NC2234.2 658
   000652         065600 INI-FAIL-GF-2-7.                                                 NC2234.2
   000653         065700     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   000654         065800     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   000655         065900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000656         066000          TO RE-MARK                                              NC2234.2 63
   000657         066100     PERFORM FAIL.                                                NC2234.2 209
   000658         066200 INI-WRITE-GF-2-7.                                                NC2234.2
   000659         066300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000660         066400*                                                                 NC2234.2
   000661         066500 INI-TEST-GF-2-8.                                                 NC2234.2
   000662         066600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000663         066700     MOVE   "INI-TEST-GF-2-8" TO PAR-NAME.                        NC2234.2 58
   000664         066800     IF      TEST-1-7 = "  $0.00"                                 NC2234.2 45
   000665      1  066900             PERFORM PASS                                         NC2234.2 208
   000666      1  067000             GO TO INI-WRITE-GF-2-8                               NC2234.2 678
   000667         067100     ELSE                                                         NC2234.2
   000668      1  067200             GO TO INI-FAIL-GF-2-8.                               NC2234.2 672
   000669         067300 INI-DELETE-GF-2-8.                                               NC2234.2
   000670         067400     PERFORM DE-LETE.                                             NC2234.2 210
   000671         067500     GO TO INI-WRITE-GF-2-8.                                      NC2234.2 678
   000672         067600 INI-FAIL-GF-2-8.                                                 NC2234.2
   000673         067700     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   000674         067800     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   000675         067900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000676         068000          TO RE-MARK                                              NC2234.2 63
   000677         068100     PERFORM FAIL.                                                NC2234.2 209
   000678         068200 INI-WRITE-GF-2-8.                                                NC2234.2
   000679         068300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000680         068400*                                                                 NC2234.2
   000681         068500 INI-TEST-GF-2-9.                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000683         068700     MOVE   "INI-TEST-GF-2-9" TO PAR-NAME.                        NC2234.2 58
   000684         068800     IF      TEST-1-8 = SPACES                                    NC2234.2 46 IMP
   000685      1  068900             PERFORM PASS                                         NC2234.2 208
   000686      1  069000             GO TO INI-WRITE-GF-2-9                               NC2234.2 698
   000687         069100     ELSE                                                         NC2234.2
   000688      1  069200             GO TO INI-FAIL-GF-2-9.                               NC2234.2 692
   000689         069300 INI-DELETE-GF-2-9.                                               NC2234.2
   000690         069400     PERFORM DE-LETE.                                             NC2234.2 210
   000691         069500     GO TO INI-WRITE-GF-2-9.                                      NC2234.2 698
   000692         069600 INI-FAIL-GF-2-9.                                                 NC2234.2
   000693         069700     MOVE    SPACES   TO CORRECT-X                                NC2234.2 IMP 82
   000694         069800     MOVE    TEST-1-8 TO COMPUTED-X                               NC2234.2 46 68
   000695         069900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000696         070000          TO RE-MARK                                              NC2234.2 63
   000697         070100     PERFORM FAIL.                                                NC2234.2 209
   000698         070200 INI-WRITE-GF-2-9.                                                NC2234.2
   000699         070300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000700         070400*                                                                 NC2234.2
   000701         070500 INI-TEST-GF-2-10.                                                NC2234.2
   000702         070600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000703         070700     MOVE   "INI-TEST-GF-2-10" TO PAR-NAME.                       NC2234.2 58
   000704         070800     IF      TEST-1-9 = "     /  "                                NC2234.2 47
   000705      1  070900             PERFORM PASS                                         NC2234.2 208
   000706      1  071000             GO TO INI-WRITE-GF-2-10                              NC2234.2 718
   000707         071100     ELSE                                                         NC2234.2
   000708      1  071200             GO TO INI-FAIL-GF-2-10.                              NC2234.2 712
   000709         071300 INI-DELETE-GF-2-10.                                              NC2234.2
   000710         071400     PERFORM DE-LETE.                                             NC2234.2 210
   000711         071500     GO TO INI-WRITE-GF-2-10.                                     NC2234.2 718
   000712         071600 INI-FAIL-GF-2-10.                                                NC2234.2
   000713         071700     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   000714         071800     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   000715         071900     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000716         072000          TO RE-MARK                                              NC2234.2 63
   000717         072100     PERFORM FAIL.                                                NC2234.2 209
   000718         072200 INI-WRITE-GF-2-10.                                               NC2234.2
   000719         072300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000720         072400*                                                                 NC2234.2
   000721         072500 INI-INIT-GF-3.                                                   NC2234.2
   000722         072600     MOVE   "VI-91/2 6.16.2 GR2" TO ANSI-REFERENCE.               NC2234.2 114
   000723         072700     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   000724         072800     MOVE    1 TO REC-CT.                                         NC2234.2 105
   000725         072900 INI-TEST-GF-3-0.                                                 NC2234.2
   000726         073000     INITIALIZE TEST-1-DATA                                       NC2234.2 38
   000727         073100             REPLACING ALPHANUMERIC BY "**********".              NC2234.2
   000728         073200     GO TO   INI-TEST-GF-3-1.                                     NC2234.2 733
   000729         073300 INI-DELETE-GF-3.                                                 NC2234.2
   000730         073400     PERFORM DE-LETE.                                             NC2234.2 210
   000731         073500     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000732         073600     GO TO   INI-INIT-GF-4.                                       NC2234.2 930
   000733         073700 INI-TEST-GF-3-1.                                                 NC2234.2
   000734         073800     MOVE   "INI-TEST-GF-3-1" TO PAR-NAME.                        NC2234.2 58
   000735         073900     IF      TEST-1-3 = "**********"                              NC2234.2 41
   000736      1  074000             PERFORM PASS                                         NC2234.2 208
   000737      1  074100             GO TO INI-WRITE-GF-3-1                               NC2234.2 748
   000738         074200     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  074300             GO TO INI-FAIL-GF-3-1.                               NC2234.2 743
   000740         074400 INI-DELETE-GF-3-1.                                               NC2234.2
   000741         074500     PERFORM DE-LETE.                                             NC2234.2 210
   000742         074600     GO TO INI-WRITE-GF-3-1.                                      NC2234.2 748
   000743         074700 INI-FAIL-GF-3-1.                                                 NC2234.2
   000744         074800     MOVE   "**********"  TO CORRECT-X                            NC2234.2 82
   000745         074900     MOVE    TEST-1-3 TO COMPUTED-X                               NC2234.2 41 68
   000746         075000     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000747         075100     PERFORM FAIL.                                                NC2234.2 209
   000748         075200 INI-WRITE-GF-3-1.                                                NC2234.2
   000749         075300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000750         075400*                                                                 NC2234.2
   000751         075500 INI-TEST-GF-3-2.                                                 NC2234.2
   000752         075600     ADD     1 TO REC-CT.                                         NC2234.2 105
   000753         075700     MOVE   "INI-TEST-GF-3-2" TO PAR-NAME.                        NC2234.2 58
   000754         075800     IF      TEST-1-8 = "**********"                              NC2234.2 46
   000755      1  075900             PERFORM PASS                                         NC2234.2 208
   000756      1  076000             GO TO INI-WRITE-GF-3-2                               NC2234.2 767
   000757         076100     ELSE                                                         NC2234.2
   000758      1  076200             GO TO INI-FAIL-GF-3-2.                               NC2234.2 762
   000759         076300 INI-DELETE-GF-3-2.                                               NC2234.2
   000760         076400     PERFORM DE-LETE.                                             NC2234.2 210
   000761         076500     GO TO INI-WRITE-GF-3-2.                                      NC2234.2 767
   000762         076600 INI-FAIL-GF-3-2.                                                 NC2234.2
   000763         076700     MOVE   "**********"   TO CORRECT-X                           NC2234.2 82
   000764         076800     MOVE    TEST-1-8 TO COMPUTED-X                               NC2234.2 46 68
   000765         076900     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000766         077000     PERFORM FAIL.                                                NC2234.2 209
   000767         077100 INI-WRITE-GF-3-2.                                                NC2234.2
   000768         077200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000769         077300*                                                                 NC2234.2
   000770         077400 INI-TEST-GF-3-3.                                                 NC2234.2
   000771         077500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000772         077600     MOVE   "INI-TEST-GF-3-3" TO PAR-NAME.                        NC2234.2 58
   000773         077700     IF      TEST-1-1 = ZERO                                      NC2234.2 39 IMP
   000774      1  077800             PERFORM PASS                                         NC2234.2 208
   000775      1  077900             GO TO INI-WRITE-GF-3-3                               NC2234.2 787
   000776         078000     ELSE                                                         NC2234.2
   000777      1  078100             GO TO INI-FAIL-GF-3-3.                               NC2234.2 781
   000778         078200 INI-DELETE-GF-3-3.                                               NC2234.2
   000779         078300     PERFORM DE-LETE.                                             NC2234.2 210
   000780         078400     GO TO INI-WRITE-GF-3-3.                                      NC2234.2 787
   000781         078500 INI-FAIL-GF-3-3.                                                 NC2234.2
   000782         078600     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   000783         078700     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   000784         078800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000785         078900          TO RE-MARK                                              NC2234.2 63
   000786         079000     PERFORM FAIL.                                                NC2234.2 209
   000787         079100 INI-WRITE-GF-3-3.                                                NC2234.2
   000788         079200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000789         079300*                                                                 NC2234.2
   000790         079400 INI-TEST-GF-3-4.                                                 NC2234.2
   000791         079500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000792         079600     MOVE   "INI-TEST-GF-3-4" TO PAR-NAME.                        NC2234.2 58
   000793         079700     IF      TEST-1-2 = "  $0.00"                                 NC2234.2 40
   000794      1  079800             PERFORM PASS                                         NC2234.2 208
   000795      1  079900             GO TO INI-WRITE-GF-3-4                               NC2234.2 807
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000     ELSE                                                         NC2234.2
   000797      1  080100             GO TO INI-FAIL-GF-3-4.                               NC2234.2 801
   000798         080200 INI-DELETE-GF-3-4.                                               NC2234.2
   000799         080300     PERFORM DE-LETE.                                             NC2234.2 210
   000800         080400     GO TO INI-WRITE-GF-3-4.                                      NC2234.2 807
   000801         080500 INI-FAIL-GF-3-4.                                                 NC2234.2
   000802         080600     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   000803         080700     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   000804         080800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000805         080900          TO RE-MARK                                              NC2234.2 63
   000806         081000     PERFORM FAIL.                                                NC2234.2 209
   000807         081100 INI-WRITE-GF-3-4.                                                NC2234.2
   000808         081200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000809         081300*                                                                 NC2234.2
   000810         081400 INI-TEST-GF-3-5.                                                 NC2234.2
   000811         081500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000812         081600     MOVE   "INI-TEST-GF-3-5" TO PAR-NAME.                        NC2234.2 58
   000813         081700     IF      TEST-1-4 = "     /  "                                NC2234.2 42
   000814      1  081800             PERFORM PASS                                         NC2234.2 208
   000815      1  081900             GO TO INI-WRITE-GF-3-5                               NC2234.2 827
   000816         082000     ELSE                                                         NC2234.2
   000817      1  082100             GO TO INI-FAIL-GF-3-5.                               NC2234.2 821
   000818         082200 INI-DELETE-GF-3-5.                                               NC2234.2
   000819         082300     PERFORM DE-LETE.                                             NC2234.2 210
   000820         082400     GO TO INI-WRITE-GF-3-5.                                      NC2234.2 827
   000821         082500 INI-FAIL-GF-3-5.                                                 NC2234.2
   000822         082600     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   000823         082700     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   000824         082800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000825         082900          TO RE-MARK                                              NC2234.2 63
   000826         083000     PERFORM FAIL.                                                NC2234.2 209
   000827         083100 INI-WRITE-GF-3-5.                                                NC2234.2
   000828         083200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000829         083300*                                                                 NC2234.2
   000830         083400 INI-TEST-GF-3-6.                                                 NC2234.2
   000831         083500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000832         083600     MOVE   "INI-TEST-GF-3-6" TO PAR-NAME.                        NC2234.2 58
   000833         083700     IF      TEST-1-5 = "AAAAAA"                                  NC2234.2 43
   000834      1  083800             PERFORM PASS                                         NC2234.2 208
   000835      1  083900             GO TO INI-WRITE-GF-3-6                               NC2234.2 847
   000836         084000     ELSE                                                         NC2234.2
   000837      1  084100             GO TO INI-FAIL-GF-3-6.                               NC2234.2 841
   000838         084200 INI-DELETE-GF-3-6.                                               NC2234.2
   000839         084300     PERFORM DE-LETE.                                             NC2234.2 210
   000840         084400     GO TO INI-WRITE-GF-3-6.                                      NC2234.2 847
   000841         084500 INI-FAIL-GF-3-6.                                                 NC2234.2
   000842         084600     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   000843         084700     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   000844         084800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000845         084900          TO RE-MARK                                              NC2234.2 63
   000846         085000     PERFORM FAIL.                                                NC2234.2 209
   000847         085100 INI-WRITE-GF-3-6.                                                NC2234.2
   000848         085200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000849         085300*                                                                 NC2234.2
   000850         085400 INI-TEST-GF-3-7.                                                 NC2234.2
   000851         085500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000852         085600     MOVE   "INI-TEST-GF-3-7" TO PAR-NAME.                        NC2234.2 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700     IF      TEST-1-6 = ZERO                                      NC2234.2 44 IMP
   000854      1  085800             PERFORM PASS                                         NC2234.2 208
   000855      1  085900             GO TO INI-WRITE-GF-3-7                               NC2234.2 867
   000856         086000     ELSE                                                         NC2234.2
   000857      1  086100             GO TO INI-FAIL-GF-3-7.                               NC2234.2 861
   000858         086200 INI-DELETE-GF-3-7.                                               NC2234.2
   000859         086300     PERFORM DE-LETE.                                             NC2234.2 210
   000860         086400     GO TO INI-WRITE-GF-3-7.                                      NC2234.2 867
   000861         086500 INI-FAIL-GF-3-7.                                                 NC2234.2
   000862         086600     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   000863         086700     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   000864         086800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000865         086900          TO RE-MARK                                              NC2234.2 63
   000866         087000     PERFORM FAIL.                                                NC2234.2 209
   000867         087100 INI-WRITE-GF-3-7.                                                NC2234.2
   000868         087200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000869         087300*                                                                 NC2234.2
   000870         087400 INI-TEST-GF-3-8.                                                 NC2234.2
   000871         087500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000872         087600     MOVE   "INI-TEST-GF-3-8" TO PAR-NAME.                        NC2234.2 58
   000873         087700     IF      TEST-1-7 = "  $0.00"                                 NC2234.2 45
   000874      1  087800             PERFORM PASS                                         NC2234.2 208
   000875      1  087900             GO TO INI-WRITE-GF-3-8                               NC2234.2 887
   000876         088000     ELSE                                                         NC2234.2
   000877      1  088100             GO TO INI-FAIL-GF-3-8.                               NC2234.2 881
   000878         088200 INI-DELETE-GF-3-8.                                               NC2234.2
   000879         088300     PERFORM DE-LETE.                                             NC2234.2 210
   000880         088400     GO TO INI-WRITE-GF-3-8.                                      NC2234.2 887
   000881         088500 INI-FAIL-GF-3-8.                                                 NC2234.2
   000882         088600     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   000883         088700     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   000884         088800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000885         088900          TO RE-MARK                                              NC2234.2 63
   000886         089000     PERFORM FAIL.                                                NC2234.2 209
   000887         089100 INI-WRITE-GF-3-8.                                                NC2234.2
   000888         089200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000889         089300*                                                                 NC2234.2
   000890         089400 INI-TEST-GF-3-9.                                                 NC2234.2
   000891         089500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000892         089600     MOVE   "INI-TEST-GF-3-9" TO PAR-NAME.                        NC2234.2 58
   000893         089700     IF      TEST-1-9 = "     /  "                                NC2234.2 47
   000894      1  089800             PERFORM PASS                                         NC2234.2 208
   000895      1  089900             GO TO INI-WRITE-GF-3-9                               NC2234.2 907
   000896         090000     ELSE                                                         NC2234.2
   000897      1  090100             GO TO INI-FAIL-GF-3-9.                               NC2234.2 901
   000898         090200 INI-DELETE-GF-3-9.                                               NC2234.2
   000899         090300     PERFORM DE-LETE.                                             NC2234.2 210
   000900         090400     GO TO INI-WRITE-GF-3-9.                                      NC2234.2 907
   000901         090500 INI-FAIL-GF-3-9.                                                 NC2234.2
   000902         090600     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   000903         090700     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   000904         090800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000905         090900          TO RE-MARK                                              NC2234.2 63
   000906         091000     PERFORM FAIL.                                                NC2234.2 209
   000907         091100 INI-WRITE-GF-3-9.                                                NC2234.2
   000908         091200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000909         091300*                                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400 INI-TEST-GF-3-10.                                                NC2234.2
   000911         091500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000912         091600     MOVE   "INI-TEST-GF-3-10" TO PAR-NAME.                       NC2234.2 58
   000913         091700     IF      TEST-1-10 = "AAAAAA"                                 NC2234.2 48
   000914      1  091800             PERFORM PASS                                         NC2234.2 208
   000915      1  091900             GO TO INI-WRITE-GF-3-10                              NC2234.2 927
   000916         092000     ELSE                                                         NC2234.2
   000917      1  092100             GO TO INI-FAIL-GF-3-10.                              NC2234.2 921
   000918         092200 INI-DELETE-GF-3-10.                                              NC2234.2
   000919         092300     PERFORM DE-LETE.                                             NC2234.2 210
   000920         092400     GO TO INI-WRITE-GF-3-10.                                     NC2234.2 927
   000921         092500 INI-FAIL-GF-3-10.                                                NC2234.2
   000922         092600     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   000923         092700     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   000924         092800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000925         092900          TO RE-MARK                                              NC2234.2 63
   000926         093000     PERFORM FAIL.                                                NC2234.2 209
   000927         093100 INI-WRITE-GF-3-10.                                               NC2234.2
   000928         093200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000929         093300*                                                                 NC2234.2
   000930         093400 INI-INIT-GF-4.                                                   NC2234.2
   000931         093500     MOVE   "VI-91/2 6.16.2 GR2" TO ANSI-REFERENCE.               NC2234.2 114
   000932         093600     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   000933         093700     MOVE    1 TO REC-CT.                                         NC2234.2 105
   000934         093800 INI-TEST-GF-4-0.                                                 NC2234.2
   000935         093900     INITIALIZE TEST-1-DATA                                       NC2234.2 38
   000936         094000             REPLACING ALPHANUMERIC-EDITED BY "DDDDDD".           NC2234.2
   000937         094100     GO TO   INI-TEST-GF-4-1.                                     NC2234.2 942
   000938         094200 INI-DELETE-GF-4.                                                 NC2234.2
   000939         094300     PERFORM DE-LETE.                                             NC2234.2 210
   000940         094400     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000941         094500     GO TO   INI-INIT-GF-5.                                       NC2234.2 1139
   000942         094600 INI-TEST-GF-4-1.                                                 NC2234.2
   000943         094700     MOVE   "INI-TEST-GF-4-1" TO PAR-NAME.                        NC2234.2 58
   000944         094800     IF      TEST-1-4 = "DD DD/DD"                                NC2234.2 42
   000945      1  094900             PERFORM PASS                                         NC2234.2 208
   000946      1  095000             GO TO INI-WRITE-GF-4-1                               NC2234.2 957
   000947         095100     ELSE                                                         NC2234.2
   000948      1  095200             GO TO INI-FAIL-GF-4-1.                               NC2234.2 952
   000949         095300 INI-DELETE-GF-4-1.                                               NC2234.2
   000950         095400     PERFORM DE-LETE.                                             NC2234.2 210
   000951         095500     GO TO INI-WRITE-GF-4-1.                                      NC2234.2 957
   000952         095600 INI-FAIL-GF-4-1.                                                 NC2234.2
   000953         095700     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   000954         095800     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   000955         095900     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000956         096000     PERFORM FAIL.                                                NC2234.2 209
   000957         096100 INI-WRITE-GF-4-1.                                                NC2234.2
   000958         096200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000959         096300*                                                                 NC2234.2
   000960         096400 INI-TEST-GF-4-2.                                                 NC2234.2
   000961         096500     ADD     1 TO REC-CT.                                         NC2234.2 105
   000962         096600     MOVE   "INI-TEST-GF-4-2" TO PAR-NAME.                        NC2234.2 58
   000963         096700     IF      TEST-1-9 = "DD DD/DD"                                NC2234.2 47
   000964      1  096800             PERFORM PASS                                         NC2234.2 208
   000965      1  096900             GO TO INI-WRITE-GF-4-2                               NC2234.2 976
   000966         097000     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097100             GO TO INI-FAIL-GF-4-2.                               NC2234.2 971
   000968         097200 INI-DELETE-GF-4-2.                                               NC2234.2
   000969         097300     PERFORM DE-LETE.                                             NC2234.2 210
   000970         097400     GO TO INI-WRITE-GF-4-2.                                      NC2234.2 976
   000971         097500 INI-FAIL-GF-4-2.                                                 NC2234.2
   000972         097600     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   000973         097700     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   000974         097800     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   000975         097900     PERFORM FAIL.                                                NC2234.2 209
   000976         098000 INI-WRITE-GF-4-2.                                                NC2234.2
   000977         098100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000978         098200*                                                                 NC2234.2
   000979         098300 INI-TEST-GF-4-3.                                                 NC2234.2
   000980         098400     ADD     1 TO REC-CT.                                         NC2234.2 105
   000981         098500     MOVE   "INI-TEST-GF-4-3" TO PAR-NAME.                        NC2234.2 58
   000982         098600     IF      TEST-1-1 = ZERO                                      NC2234.2 39 IMP
   000983      1  098700             PERFORM PASS                                         NC2234.2 208
   000984      1  098800             GO TO INI-WRITE-GF-4-3                               NC2234.2 996
   000985         098900     ELSE                                                         NC2234.2
   000986      1  099000             GO TO INI-FAIL-GF-4-3.                               NC2234.2 990
   000987         099100 INI-DELETE-GF-4-3.                                               NC2234.2
   000988         099200     PERFORM DE-LETE.                                             NC2234.2 210
   000989         099300     GO TO INI-WRITE-GF-4-3.                                      NC2234.2 996
   000990         099400 INI-FAIL-GF-4-3.                                                 NC2234.2
   000991         099500     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   000992         099600     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   000993         099700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   000994         099800        TO RE-MARK                                                NC2234.2 63
   000995         099900     PERFORM FAIL.                                                NC2234.2 209
   000996         100000 INI-WRITE-GF-4-3.                                                NC2234.2
   000997         100100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   000998         100200*                                                                 NC2234.2
   000999         100300 INI-TEST-GF-4-4.                                                 NC2234.2
   001000         100400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001001         100500     MOVE   "INI-TEST-GF-4-4" TO PAR-NAME.                        NC2234.2 58
   001002         100600     IF      TEST-1-2 = "  $0.00"                                 NC2234.2 40
   001003      1  100700             PERFORM PASS                                         NC2234.2 208
   001004      1  100800             GO TO INI-WRITE-GF-4-4                               NC2234.2 1016
   001005         100900     ELSE                                                         NC2234.2
   001006      1  101000             GO TO INI-FAIL-GF-4-4.                               NC2234.2 1010
   001007         101100 INI-DELETE-GF-4-4.                                               NC2234.2
   001008         101200     PERFORM DE-LETE.                                             NC2234.2 210
   001009         101300     GO TO INI-WRITE-GF-4-4.                                      NC2234.2 1016
   001010         101400 INI-FAIL-GF-4-4.                                                 NC2234.2
   001011         101500     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   001012         101600     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   001013         101700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001014         101800          TO RE-MARK                                              NC2234.2 63
   001015         101900     PERFORM FAIL.                                                NC2234.2 209
   001016         102000 INI-WRITE-GF-4-4.                                                NC2234.2
   001017         102100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001018         102200*                                                                 NC2234.2
   001019         102300 INI-TEST-GF-4-5.                                                 NC2234.2
   001020         102400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001021         102500     MOVE   "INI-TEST-GF-4-5" TO PAR-NAME.                        NC2234.2 58
   001022         102600     IF      TEST-1-3 = "**********"                              NC2234.2 41
   001023      1  102700             PERFORM PASS                                         NC2234.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102800             GO TO INI-WRITE-GF-4-5                               NC2234.2 1036
   001025         102900     ELSE                                                         NC2234.2
   001026      1  103000             GO TO INI-FAIL-GF-4-5.                               NC2234.2 1030
   001027         103100 INI-DELETE-GF-4-5.                                               NC2234.2
   001028         103200     PERFORM DE-LETE.                                             NC2234.2 210
   001029         103300     GO TO INI-WRITE-GF-4-5.                                      NC2234.2 1036
   001030         103400 INI-FAIL-GF-4-5.                                                 NC2234.2
   001031         103500     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001032         103600     MOVE    TEST-1-3  TO COMPUTED-X                              NC2234.2 41 68
   001033         103700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001034         103800          TO RE-MARK                                              NC2234.2 63
   001035         103900     PERFORM FAIL.                                                NC2234.2 209
   001036         104000 INI-WRITE-GF-4-5.                                                NC2234.2
   001037         104100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001038         104200*                                                                 NC2234.2
   001039         104300 INI-TEST-GF-4-6.                                                 NC2234.2
   001040         104400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001041         104500     MOVE   "INI-TEST-GF-4-6" TO PAR-NAME.                        NC2234.2 58
   001042         104600     IF      TEST-1-5 = "AAAAAA"                                  NC2234.2 43
   001043      1  104700             PERFORM PASS                                         NC2234.2 208
   001044      1  104800             GO TO INI-WRITE-GF-4-6                               NC2234.2 1056
   001045         104900     ELSE                                                         NC2234.2
   001046      1  105000             GO TO INI-FAIL-GF-4-6.                               NC2234.2 1050
   001047         105100 INI-DELETE-GF-4-6.                                               NC2234.2
   001048         105200     PERFORM DE-LETE.                                             NC2234.2 210
   001049         105300     GO TO INI-WRITE-GF-4-6.                                      NC2234.2 1056
   001050         105400 INI-FAIL-GF-4-6.                                                 NC2234.2
   001051         105500     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001052         105600     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   001053         105700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001054         105800          TO RE-MARK                                              NC2234.2 63
   001055         105900     PERFORM FAIL.                                                NC2234.2 209
   001056         106000 INI-WRITE-GF-4-6.                                                NC2234.2
   001057         106100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001058         106200*                                                                 NC2234.2
   001059         106300 INI-TEST-GF-4-7.                                                 NC2234.2
   001060         106400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001061         106500     MOVE   "INI-TEST-GF-4-7" TO PAR-NAME.                        NC2234.2 58
   001062         106600     IF      TEST-1-6 = ZERO                                      NC2234.2 44 IMP
   001063      1  106700             PERFORM PASS                                         NC2234.2 208
   001064      1  106800             GO TO INI-WRITE-GF-4-7                               NC2234.2 1076
   001065         106900     ELSE                                                         NC2234.2
   001066      1  107000             GO TO INI-FAIL-GF-4-7.                               NC2234.2 1070
   001067         107100 INI-DELETE-GF-4-7.                                               NC2234.2
   001068         107200     PERFORM DE-LETE.                                             NC2234.2 210
   001069         107300     GO TO INI-WRITE-GF-4-7.                                      NC2234.2 1076
   001070         107400 INI-FAIL-GF-4-7.                                                 NC2234.2
   001071         107500     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   001072         107600     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   001073         107700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001074         107800          TO RE-MARK                                              NC2234.2 63
   001075         107900     PERFORM FAIL.                                                NC2234.2 209
   001076         108000 INI-WRITE-GF-4-7.                                                NC2234.2
   001077         108100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001078         108200*                                                                 NC2234.2
   001079         108300 INI-TEST-GF-4-8.                                                 NC2234.2
   001080         108400     ADD     1 TO REC-CT.                                         NC2234.2 105
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108500     MOVE   "INI-TEST-GF-4-8" TO PAR-NAME.                        NC2234.2 58
   001082         108600     IF      TEST-1-7 = "  $0.00"                                 NC2234.2 45
   001083      1  108700             PERFORM PASS                                         NC2234.2 208
   001084      1  108800             GO TO INI-WRITE-GF-4-8                               NC2234.2 1096
   001085         108900     ELSE                                                         NC2234.2
   001086      1  109000             GO TO INI-FAIL-GF-4-8.                               NC2234.2 1090
   001087         109100 INI-DELETE-GF-4-8.                                               NC2234.2
   001088         109200     PERFORM DE-LETE.                                             NC2234.2 210
   001089         109300     GO TO INI-WRITE-GF-4-8.                                      NC2234.2 1096
   001090         109400 INI-FAIL-GF-4-8.                                                 NC2234.2
   001091         109500     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   001092         109600     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   001093         109700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001094         109800          TO RE-MARK                                              NC2234.2 63
   001095         109900     PERFORM FAIL.                                                NC2234.2 209
   001096         110000 INI-WRITE-GF-4-8.                                                NC2234.2
   001097         110100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001098         110200*                                                                 NC2234.2
   001099         110300 INI-TEST-GF-4-9.                                                 NC2234.2
   001100         110400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001101         110500     MOVE   "INI-TEST-GF-4-9" TO PAR-NAME.                        NC2234.2 58
   001102         110600     IF      TEST-1-8 = "**********"                              NC2234.2 46
   001103      1  110700             PERFORM PASS                                         NC2234.2 208
   001104      1  110800             GO TO INI-WRITE-GF-4-9                               NC2234.2 1116
   001105         110900     ELSE                                                         NC2234.2
   001106      1  111000             GO TO INI-FAIL-GF-4-9.                               NC2234.2 1110
   001107         111100 INI-DELETE-GF-4-9.                                               NC2234.2
   001108         111200     PERFORM DE-LETE.                                             NC2234.2 210
   001109         111300     GO TO INI-WRITE-GF-4-9.                                      NC2234.2 1116
   001110         111400 INI-FAIL-GF-4-9.                                                 NC2234.2
   001111         111500     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001112         111600     MOVE    TEST-1-8  TO COMPUTED-X                              NC2234.2 46 68
   001113         111700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001114         111800          TO RE-MARK                                              NC2234.2 63
   001115         111900     PERFORM FAIL.                                                NC2234.2 209
   001116         112000 INI-WRITE-GF-4-9.                                                NC2234.2
   001117         112100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001118         112200*                                                                 NC2234.2
   001119         112300 INI-TEST-GF-4-10.                                                NC2234.2
   001120         112400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001121         112500     MOVE   "INI-TEST-GF-4-10" TO PAR-NAME.                       NC2234.2 58
   001122         112600     IF      TEST-1-10 = "AAAAAA"                                 NC2234.2 48
   001123      1  112700             PERFORM PASS                                         NC2234.2 208
   001124      1  112800             GO TO INI-WRITE-GF-4-10                              NC2234.2 1136
   001125         112900     ELSE                                                         NC2234.2
   001126      1  113000             GO TO INI-FAIL-GF-4-10.                              NC2234.2 1130
   001127         113100 INI-DELETE-GF-4-10.                                              NC2234.2
   001128         113200     PERFORM DE-LETE.                                             NC2234.2 210
   001129         113300     GO TO INI-WRITE-GF-4-10.                                     NC2234.2 1136
   001130         113400 INI-FAIL-GF-4-10.                                                NC2234.2
   001131         113500     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001132         113600     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   001133         113700     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001134         113800     TO RE-MARK                                                   NC2234.2 63
   001135         113900     PERFORM FAIL.                                                NC2234.2 209
   001136         114000 INI-WRITE-GF-4-10.                                               NC2234.2
   001137         114100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114200*                                                                 NC2234.2
   001139         114300 INI-INIT-GF-5.                                                   NC2234.2
   001140         114400     MOVE   "VI-91/2 6.16.2 GR2" TO ANSI-REFERENCE.               NC2234.2 114
   001141         114500     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   001142         114600     MOVE    1 TO REC-CT.                                         NC2234.2 105
   001143         114700 INI-TEST-GF-5-0.                                                 NC2234.2
   001144         114800     INITIALIZE TEST-1-DATA                                       NC2234.2 38
   001145         114900             REPLACING NUMERIC DATA BY 1234.                      NC2234.2
   001146         115000     GO TO   INI-TEST-GF-5-1.                                     NC2234.2 1151
   001147         115100 INI-DELETE-GF-5.                                                 NC2234.2
   001148         115200     PERFORM DE-LETE.                                             NC2234.2 210
   001149         115300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001150         115400     GO TO   INI-INIT-GF-6.                                       NC2234.2 1348
   001151         115500 INI-TEST-GF-5-1.                                                 NC2234.2
   001152         115600     MOVE   "INI-TEST-GF-5-1" TO PAR-NAME.                        NC2234.2 58
   001153         115700     IF      TEST-1-1 = 001234                                    NC2234.2 39
   001154      1  115800             PERFORM PASS                                         NC2234.2 208
   001155      1  115900             GO TO INI-WRITE-GF-5-1                               NC2234.2 1166
   001156         116000     ELSE                                                         NC2234.2
   001157      1  116100             GO TO INI-FAIL-GF-5-1.                               NC2234.2 1161
   001158         116200 INI-DELETE-GF-5-1.                                               NC2234.2
   001159         116300     PERFORM DE-LETE.                                             NC2234.2 210
   001160         116400     GO TO INI-WRITE-GF-5-1.                                      NC2234.2 1166
   001161         116500 INI-FAIL-GF-5-1.                                                 NC2234.2
   001162         116600     MOVE    001234   TO CORRECT-N                                NC2234.2 84
   001163         116700     MOVE    TEST-1-1 TO COMPUTED-N                               NC2234.2 39 70
   001164         116800     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001165         116900     PERFORM FAIL.                                                NC2234.2 209
   001166         117000 INI-WRITE-GF-5-1.                                                NC2234.2
   001167         117100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001168         117200*                                                                 NC2234.2
   001169         117300 INI-TEST-GF-5-2.                                                 NC2234.2
   001170         117400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001171         117500     MOVE   "INI-TEST-GF-5-2" TO PAR-NAME.                        NC2234.2 58
   001172         117600     IF      TEST-1-6 = 001234                                    NC2234.2 44
   001173      1  117700             PERFORM PASS                                         NC2234.2 208
   001174      1  117800             GO TO INI-WRITE-GF-5-2                               NC2234.2 1185
   001175         117900     ELSE                                                         NC2234.2
   001176      1  118000             GO TO INI-FAIL-GF-5-2.                               NC2234.2 1180
   001177         118100 INI-DELETE-GF-5-2.                                               NC2234.2
   001178         118200     PERFORM DE-LETE.                                             NC2234.2 210
   001179         118300     GO TO INI-WRITE-GF-5-2.                                      NC2234.2 1185
   001180         118400 INI-FAIL-GF-5-2.                                                 NC2234.2
   001181         118500     MOVE    001234   TO CORRECT-N                                NC2234.2 84
   001182         118600     MOVE    TEST-1-6 TO COMPUTED-N                               NC2234.2 44 70
   001183         118700     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001184         118800     PERFORM FAIL.                                                NC2234.2 209
   001185         118900 INI-WRITE-GF-5-2.                                                NC2234.2
   001186         119000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001187         119100*                                                                 NC2234.2
   001188         119200 INI-TEST-GF-5-3.                                                 NC2234.2
   001189         119300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001190         119400     MOVE   "INI-TEST-GF-5-3" TO PAR-NAME.                        NC2234.2 58
   001191         119500     IF      TEST-1-2 = "  $0.00"                                 NC2234.2 40
   001192      1  119600             PERFORM PASS                                         NC2234.2 208
   001193      1  119700             GO TO INI-WRITE-GF-5-3                               NC2234.2 1205
   001194         119800     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195      1  119900             GO TO INI-FAIL-GF-5-3.                               NC2234.2 1199
   001196         120000 INI-DELETE-GF-5-3.                                               NC2234.2
   001197         120100     PERFORM DE-LETE.                                             NC2234.2 210
   001198         120200     GO TO INI-WRITE-GF-5-3.                                      NC2234.2 1205
   001199         120300 INI-FAIL-GF-5-3.                                                 NC2234.2
   001200         120400     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   001201         120500     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   001202         120600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001203         120700          TO RE-MARK                                              NC2234.2 63
   001204         120800     PERFORM FAIL.                                                NC2234.2 209
   001205         120900 INI-WRITE-GF-5-3.                                                NC2234.2
   001206         121000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001207         121100*                                                                 NC2234.2
   001208         121200 INI-TEST-GF-5-4.                                                 NC2234.2
   001209         121300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001210         121400     MOVE   "INI-TEST-GF-5-4" TO PAR-NAME.                        NC2234.2 58
   001211         121500     IF      TEST-1-3 = "**********"                              NC2234.2 41
   001212      1  121600             PERFORM PASS                                         NC2234.2 208
   001213      1  121700             GO TO INI-WRITE-GF-5-4                               NC2234.2 1225
   001214         121800     ELSE                                                         NC2234.2
   001215      1  121900             GO TO INI-FAIL-GF-5-4.                               NC2234.2 1219
   001216         122000 INI-DELETE-GF-5-4.                                               NC2234.2
   001217         122100     PERFORM DE-LETE.                                             NC2234.2 210
   001218         122200     GO TO INI-WRITE-GF-5-4.                                      NC2234.2 1225
   001219         122300 INI-FAIL-GF-5-4.                                                 NC2234.2
   001220         122400     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001221         122500     MOVE    TEST-1-3  TO COMPUTED-X                              NC2234.2 41 68
   001222         122600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001223         122700          TO RE-MARK                                              NC2234.2 63
   001224         122800     PERFORM FAIL.                                                NC2234.2 209
   001225         122900 INI-WRITE-GF-5-4.                                                NC2234.2
   001226         123000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001227         123100*                                                                 NC2234.2
   001228         123200 INI-TEST-GF-5-5.                                                 NC2234.2
   001229         123300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001230         123400     MOVE   "INI-TEST-GF-5-5" TO PAR-NAME.                        NC2234.2 58
   001231         123500     IF      TEST-1-4 = "DD DD/DD"                                NC2234.2 42
   001232      1  123600             PERFORM PASS                                         NC2234.2 208
   001233      1  123700             GO TO INI-WRITE-GF-5-5                               NC2234.2 1245
   001234         123800     ELSE                                                         NC2234.2
   001235      1  123900             GO TO INI-FAIL-GF-5-5.                               NC2234.2 1239
   001236         124000 INI-DELETE-GF-5-5.                                               NC2234.2
   001237         124100     PERFORM DE-LETE.                                             NC2234.2 210
   001238         124200     GO TO INI-WRITE-GF-5-5.                                      NC2234.2 1245
   001239         124300 INI-FAIL-GF-5-5.                                                 NC2234.2
   001240         124400     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   001241         124500     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   001242         124600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001243         124700          TO RE-MARK                                              NC2234.2 63
   001244         124800     PERFORM FAIL.                                                NC2234.2 209
   001245         124900 INI-WRITE-GF-5-5.                                                NC2234.2
   001246         125000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001247         125100*                                                                 NC2234.2
   001248         125200 INI-TEST-GF-5-6.                                                 NC2234.2
   001249         125300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001250         125400     MOVE   "INI-TEST-GF-5-6" TO PAR-NAME.                        NC2234.2 58
   001251         125500     IF      TEST-1-5 = "AAAAAA"                                  NC2234.2 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252      1  125600             PERFORM PASS                                         NC2234.2 208
   001253      1  125700             GO TO INI-WRITE-GF-5-6                               NC2234.2 1265
   001254         125800     ELSE                                                         NC2234.2
   001255      1  125900             GO TO INI-FAIL-GF-5-6.                               NC2234.2 1259
   001256         126000 INI-DELETE-GF-5-6.                                               NC2234.2
   001257         126100     PERFORM DE-LETE.                                             NC2234.2 210
   001258         126200     GO TO INI-WRITE-GF-5-6.                                      NC2234.2 1265
   001259         126300 INI-FAIL-GF-5-6.                                                 NC2234.2
   001260         126400     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001261         126500     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   001262         126600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001263         126700          TO RE-MARK                                              NC2234.2 63
   001264         126800     PERFORM FAIL.                                                NC2234.2 209
   001265         126900 INI-WRITE-GF-5-6.                                                NC2234.2
   001266         127000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001267         127100*                                                                 NC2234.2
   001268         127200 INI-TEST-GF-5-7.                                                 NC2234.2
   001269         127300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001270         127400     MOVE   "INI-TEST-GF-5-7" TO PAR-NAME.                        NC2234.2 58
   001271         127500     IF      TEST-1-7 = "  $0.00"                                 NC2234.2 45
   001272      1  127600             PERFORM PASS                                         NC2234.2 208
   001273      1  127700             GO TO INI-WRITE-GF-5-7                               NC2234.2 1285
   001274         127800     ELSE                                                         NC2234.2
   001275      1  127900             GO TO INI-FAIL-GF-5-7.                               NC2234.2 1279
   001276         128000 INI-DELETE-GF-5-7.                                               NC2234.2
   001277         128100     PERFORM DE-LETE.                                             NC2234.2 210
   001278         128200     GO TO INI-WRITE-GF-5-7.                                      NC2234.2 1285
   001279         128300 INI-FAIL-GF-5-7.                                                 NC2234.2
   001280         128400     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   001281         128500     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   001282         128600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001283         128700          TO RE-MARK                                              NC2234.2 63
   001284         128800     PERFORM FAIL.                                                NC2234.2 209
   001285         128900 INI-WRITE-GF-5-7.                                                NC2234.2
   001286         129000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001287         129100*                                                                 NC2234.2
   001288         129200 INI-TEST-GF-5-8.                                                 NC2234.2
   001289         129300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001290         129400     MOVE   "INI-TEST-GF-5-8" TO PAR-NAME.                        NC2234.2 58
   001291         129500     IF      TEST-1-8 = "**********"                              NC2234.2 46
   001292      1  129600             PERFORM PASS                                         NC2234.2 208
   001293      1  129700             GO TO INI-WRITE-GF-5-8                               NC2234.2 1305
   001294         129800     ELSE                                                         NC2234.2
   001295      1  129900             GO TO INI-FAIL-GF-5-8.                               NC2234.2 1299
   001296         130000 INI-DELETE-GF-5-8.                                               NC2234.2
   001297         130100     PERFORM DE-LETE.                                             NC2234.2 210
   001298         130200     GO TO INI-WRITE-GF-5-8.                                      NC2234.2 1305
   001299         130300 INI-FAIL-GF-5-8.                                                 NC2234.2
   001300         130400     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001301         130500     MOVE    TEST-1-8  TO COMPUTED-X                              NC2234.2 46 68
   001302         130600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001303         130700          TO RE-MARK                                              NC2234.2 63
   001304         130800     PERFORM FAIL.                                                NC2234.2 209
   001305         130900 INI-WRITE-GF-5-8.                                                NC2234.2
   001306         131000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001307         131100*                                                                 NC2234.2
   001308         131200 INI-TEST-GF-5-9.                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001310         131400     MOVE   "INI-TEST-GF-5-9" TO PAR-NAME.                        NC2234.2 58
   001311         131500     IF      TEST-1-9 = "DD DD/DD"                                NC2234.2 47
   001312      1  131600             PERFORM PASS                                         NC2234.2 208
   001313      1  131700             GO TO INI-WRITE-GF-5-9                               NC2234.2 1325
   001314         131800     ELSE                                                         NC2234.2
   001315      1  131900             GO TO INI-FAIL-GF-5-9.                               NC2234.2 1319
   001316         132000 INI-DELETE-GF-5-9.                                               NC2234.2
   001317         132100     PERFORM DE-LETE.                                             NC2234.2 210
   001318         132200     GO TO INI-WRITE-GF-5-9.                                      NC2234.2 1325
   001319         132300 INI-FAIL-GF-5-9.                                                 NC2234.2
   001320         132400     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   001321         132500     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   001322         132600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001323         132700          TO RE-MARK                                              NC2234.2 63
   001324         132800     PERFORM FAIL.                                                NC2234.2 209
   001325         132900 INI-WRITE-GF-5-9.                                                NC2234.2
   001326         133000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001327         133100*                                                                 NC2234.2
   001328         133200 INI-TEST-GF-5-10.                                                NC2234.2
   001329         133300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001330         133400     MOVE   "INI-TEST-GF-5-10" TO PAR-NAME.                       NC2234.2 58
   001331         133500     IF      TEST-1-10 = "AAAAAA"                                 NC2234.2 48
   001332      1  133600             PERFORM PASS                                         NC2234.2 208
   001333      1  133700             GO TO INI-WRITE-GF-5-10                              NC2234.2 1345
   001334         133800     ELSE                                                         NC2234.2
   001335      1  133900             GO TO INI-FAIL-GF-5-10.                              NC2234.2 1339
   001336         134000 INI-DELETE-GF-5-10.                                              NC2234.2
   001337         134100     PERFORM DE-LETE.                                             NC2234.2 210
   001338         134200     GO TO INI-WRITE-GF-5-10.                                     NC2234.2 1345
   001339         134300 INI-FAIL-GF-5-10.                                                NC2234.2
   001340         134400     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001341         134500     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   001342         134600     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001343         134700          TO RE-MARK                                              NC2234.2 63
   001344         134800     PERFORM FAIL.                                                NC2234.2 209
   001345         134900 INI-WRITE-GF-5-10.                                               NC2234.2
   001346         135000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001347         135100*                                                                 NC2234.2
   001348         135200 INI-INIT-GF-6.                                                   NC2234.2
   001349         135300     MOVE   "VI-91/2 6.16.2 GR2" TO ANSI-REFERENCE.               NC2234.2 114
   001350         135400     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   001351         135500     MOVE    1 TO REC-CT.                                         NC2234.2 105
   001352         135600 INI-TEST-GF-6-0.                                                 NC2234.2
   001353         135700     INITIALIZE TEST-1-DATA                                       NC2234.2 38
   001354         135800             REPLACING NUMERIC-EDITED DATA BY NUM-1234.           NC2234.2 49
   001355         135900     GO TO   INI-TEST-GF-6-1.                                     NC2234.2 1360
   001356         136000 INI-DELETE-GF-6.                                                 NC2234.2
   001357         136100     PERFORM DE-LETE.                                             NC2234.2 210
   001358         136200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001359         136300     GO TO   INI-INIT-GF-7.                                       NC2234.2 1556
   001360         136400 INI-TEST-GF-6-1.                                                 NC2234.2
   001361         136500     MOVE   "INI-TEST-GF-6-1" TO PAR-NAME.                        NC2234.2 58
   001362         136600     IF      TEST-1-2 = "$234.00"                                 NC2234.2 40
   001363      1  136700             PERFORM PASS                                         NC2234.2 208
   001364      1  136800             GO TO INI-WRITE-GF-6-1                               NC2234.2 1375
   001365         136900     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366      1  137000             GO TO INI-FAIL-GF-6-1.                               NC2234.2 1370
   001367         137100 INI-DELETE-GF-6-1.                                               NC2234.2
   001368         137200     PERFORM DE-LETE.                                             NC2234.2 210
   001369         137300     GO TO INI-WRITE-GF-6-1.                                      NC2234.2 1375
   001370         137400 INI-FAIL-GF-6-1.                                                 NC2234.2
   001371         137500     MOVE   "$234.00" TO CORRECT-X                                NC2234.2 82
   001372         137600     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   001373         137700     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001374         137800     PERFORM FAIL.                                                NC2234.2 209
   001375         137900 INI-WRITE-GF-6-1.                                                NC2234.2
   001376         138000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001377         138100*                                                                 NC2234.2
   001378         138200 INI-TEST-GF-6-2.                                                 NC2234.2
   001379         138300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001380         138400     MOVE   "INI-TEST-GF-6-2" TO PAR-NAME.                        NC2234.2 58
   001381         138500     IF      TEST-1-7 = "$234.00"                                 NC2234.2 45
   001382      1  138600             PERFORM PASS                                         NC2234.2 208
   001383      1  138700             GO TO INI-WRITE-GF-6-2                               NC2234.2 1394
   001384         138800     ELSE                                                         NC2234.2
   001385      1  138900             GO TO INI-FAIL-GF-6-2.                               NC2234.2 1389
   001386         139000 INI-DELETE-GF-6-2.                                               NC2234.2
   001387         139100     PERFORM DE-LETE.                                             NC2234.2 210
   001388         139200     GO TO INI-WRITE-GF-6-2.                                      NC2234.2 1394
   001389         139300 INI-FAIL-GF-6-2.                                                 NC2234.2
   001390         139400     MOVE   "$234.00" TO CORRECT-X                                NC2234.2 82
   001391         139500     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   001392         139600     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001393         139700     PERFORM FAIL.                                                NC2234.2 209
   001394         139800 INI-WRITE-GF-6-2.                                                NC2234.2
   001395         139900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001396         140000*                                                                 NC2234.2
   001397         140100 INI-TEST-GF-6-3.                                                 NC2234.2
   001398         140200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001399         140300     MOVE   "INI-TEST-GF-6-3" TO PAR-NAME.                        NC2234.2 58
   001400         140400     IF      TEST-1-1 = 001234                                    NC2234.2 39
   001401      1  140500             PERFORM PASS                                         NC2234.2 208
   001402      1  140600             GO TO INI-WRITE-GF-6-3                               NC2234.2 1414
   001403         140700     ELSE                                                         NC2234.2
   001404      1  140800             GO TO INI-FAIL-GF-6-3.                               NC2234.2 1408
   001405         140900 INI-DELETE-GF-6-3.                                               NC2234.2
   001406         141000     PERFORM DE-LETE.                                             NC2234.2 210
   001407         141100     GO TO INI-WRITE-GF-6-3.                                      NC2234.2 1414
   001408         141200 INI-FAIL-GF-6-3.                                                 NC2234.2
   001409         141300     MOVE    001234   TO CORRECT-N                                NC2234.2 84
   001410         141400     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   001411         141500     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001412         141600          TO RE-MARK                                              NC2234.2 63
   001413         141700     PERFORM FAIL.                                                NC2234.2 209
   001414         141800 INI-WRITE-GF-6-3.                                                NC2234.2
   001415         141900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001416         142000*                                                                 NC2234.2
   001417         142100 INI-TEST-GF-6-4.                                                 NC2234.2
   001418         142200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001419         142300     MOVE   "INI-TEST-GF-6-4" TO PAR-NAME.                        NC2234.2 58
   001420         142400     IF      TEST-1-3 = "**********"                              NC2234.2 41
   001421      1  142500             PERFORM PASS                                         NC2234.2 208
   001422      1  142600             GO TO INI-WRITE-GF-6-4                               NC2234.2 1434
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142700     ELSE                                                         NC2234.2
   001424      1  142800             GO TO INI-FAIL-GF-6-4.                               NC2234.2 1428
   001425         142900 INI-DELETE-GF-6-4.                                               NC2234.2
   001426         143000     PERFORM DE-LETE.                                             NC2234.2 210
   001427         143100     GO TO INI-WRITE-GF-6-4.                                      NC2234.2 1434
   001428         143200 INI-FAIL-GF-6-4.                                                 NC2234.2
   001429         143300     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001430         143400     MOVE    TEST-1-3  TO COMPUTED-X                              NC2234.2 41 68
   001431         143500     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001432         143600         TO RE-MARK                                               NC2234.2 63
   001433         143700     PERFORM FAIL.                                                NC2234.2 209
   001434         143800 INI-WRITE-GF-6-4.                                                NC2234.2
   001435         143900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001436         144000*                                                                 NC2234.2
   001437         144100 INI-TEST-GF-6-5.                                                 NC2234.2
   001438         144200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001439         144300     MOVE   "INI-TEST-GF-6-5" TO PAR-NAME.                        NC2234.2 58
   001440         144400     IF      TEST-1-4 = "DD DD/DD"                                NC2234.2 42
   001441      1  144500             PERFORM PASS                                         NC2234.2 208
   001442      1  144600             GO TO INI-WRITE-GF-6-5                               NC2234.2 1454
   001443         144700     ELSE                                                         NC2234.2
   001444      1  144800             GO TO INI-FAIL-GF-6-5.                               NC2234.2 1448
   001445         144900 INI-DELETE-GF-6-5.                                               NC2234.2
   001446         145000     PERFORM DE-LETE.                                             NC2234.2 210
   001447         145100     GO TO INI-WRITE-GF-6-5.                                      NC2234.2 1454
   001448         145200 INI-FAIL-GF-6-5.                                                 NC2234.2
   001449         145300     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   001450         145400     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   001451         145500     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001452         145600          TO RE-MARK                                              NC2234.2 63
   001453         145700     PERFORM FAIL.                                                NC2234.2 209
   001454         145800 INI-WRITE-GF-6-5.                                                NC2234.2
   001455         145900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001456         146000*                                                                 NC2234.2
   001457         146100 INI-TEST-GF-6-6.                                                 NC2234.2
   001458         146200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001459         146300     MOVE   "INI-TEST-GF-6-6" TO PAR-NAME.                        NC2234.2 58
   001460         146400     IF      TEST-1-5 = "AAAAAA"                                  NC2234.2 43
   001461      1  146500             PERFORM PASS                                         NC2234.2 208
   001462      1  146600             GO TO INI-WRITE-GF-6-6                               NC2234.2 1474
   001463         146700     ELSE                                                         NC2234.2
   001464      1  146800             GO TO INI-FAIL-GF-6-6.                               NC2234.2 1468
   001465         146900 INI-DELETE-GF-6-6.                                               NC2234.2
   001466         147000     PERFORM DE-LETE.                                             NC2234.2 210
   001467         147100     GO TO INI-WRITE-GF-6-6.                                      NC2234.2 1474
   001468         147200 INI-FAIL-GF-6-6.                                                 NC2234.2
   001469         147300     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001470         147400     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   001471         147500     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001472         147600          TO RE-MARK                                              NC2234.2 63
   001473         147700     PERFORM FAIL.                                                NC2234.2 209
   001474         147800 INI-WRITE-GF-6-6.                                                NC2234.2
   001475         147900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001476         148000*                                                                 NC2234.2
   001477         148100 INI-TEST-GF-6-7.                                                 NC2234.2
   001478         148200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001479         148300     MOVE   "INI-TEST-GF-6-7" TO PAR-NAME.                        NC2234.2 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148400     IF      TEST-1-6 = 1234                                      NC2234.2 44
   001481      1  148500             PERFORM PASS                                         NC2234.2 208
   001482      1  148600             GO TO INI-WRITE-GF-6-7                               NC2234.2 1494
   001483         148700     ELSE                                                         NC2234.2
   001484      1  148800             GO TO INI-FAIL-GF-6-7.                               NC2234.2 1488
   001485         148900 INI-DELETE-GF-6-7.                                               NC2234.2
   001486         149000     PERFORM DE-LETE.                                             NC2234.2 210
   001487         149100     GO TO INI-WRITE-GF-6-7.                                      NC2234.2 1494
   001488         149200 INI-FAIL-GF-6-7.                                                 NC2234.2
   001489         149300     MOVE    1234     TO CORRECT-N                                NC2234.2 84
   001490         149400     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   001491         149500     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001492         149600          TO RE-MARK                                              NC2234.2 63
   001493         149700     PERFORM FAIL.                                                NC2234.2 209
   001494         149800 INI-WRITE-GF-6-7.                                                NC2234.2
   001495         149900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001496         150000*                                                                 NC2234.2
   001497         150100 INI-TEST-GF-6-8.                                                 NC2234.2
   001498         150200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001499         150300     MOVE   "INI-TEST-GF-6-8" TO PAR-NAME.                        NC2234.2 58
   001500         150400     IF      TEST-1-8 = "**********"                              NC2234.2 46
   001501      1  150500             PERFORM PASS                                         NC2234.2 208
   001502      1  150600             GO TO INI-WRITE-GF-6-8                               NC2234.2 1514
   001503         150700     ELSE                                                         NC2234.2
   001504      1  150800             GO TO INI-FAIL-GF-6-8.                               NC2234.2 1508
   001505         150900 INI-DELETE-GF-6-8.                                               NC2234.2
   001506         151000     PERFORM DE-LETE.                                             NC2234.2 210
   001507         151100     GO TO INI-WRITE-GF-6-8.                                      NC2234.2 1514
   001508         151200 INI-FAIL-GF-6-8.                                                 NC2234.2
   001509         151300     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001510         151400     MOVE    TEST-1-8  TO COMPUTED-X                              NC2234.2 46 68
   001511         151500     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001512         151600          TO RE-MARK                                              NC2234.2 63
   001513         151700     PERFORM FAIL.                                                NC2234.2 209
   001514         151800 INI-WRITE-GF-6-8.                                                NC2234.2
   001515         151900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001516         152000*                                                                 NC2234.2
   001517         152100 INI-TEST-GF-6-9.                                                 NC2234.2
   001518         152200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001519         152300     MOVE   "INI-TEST-GF-6-9" TO PAR-NAME.                        NC2234.2 58
   001520         152400     IF      TEST-1-9 = "DD DD/DD"                                NC2234.2 47
   001521      1  152500             PERFORM PASS                                         NC2234.2 208
   001522      1  152600             GO TO INI-WRITE-GF-6-9                               NC2234.2 1533
   001523         152700     ELSE                                                         NC2234.2
   001524      1  152800             GO TO INI-FAIL-GF-6-9.                               NC2234.2 1528
   001525         152900 INI-DELETE-GF-6-9.                                               NC2234.2
   001526         153000     PERFORM DE-LETE.                                             NC2234.2 210
   001527         153100     GO TO INI-WRITE-GF-6-9.                                      NC2234.2 1533
   001528         153200 INI-FAIL-GF-6-9.                                                 NC2234.2
   001529         153300     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   001530         153400     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001531         153500          TO RE-MARK                                              NC2234.2 63
   001532         153600     PERFORM FAIL.                                                NC2234.2 209
   001533         153700 INI-WRITE-GF-6-9.                                                NC2234.2
   001534         153800     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001535         153900*                                                                 NC2234.2
   001536         154000 INI-TEST-GF-6-10.                                                NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154100     ADD     1 TO REC-CT.                                         NC2234.2 105
   001538         154200     MOVE   "INI-TEST-GF-6-10" TO PAR-NAME.                       NC2234.2 58
   001539         154300     IF      TEST-1-10 = "AAAAAA"                                 NC2234.2 48
   001540      1  154400             PERFORM PASS                                         NC2234.2 208
   001541      1  154500             GO TO INI-WRITE-GF-6-10                              NC2234.2 1553
   001542         154600     ELSE                                                         NC2234.2
   001543      1  154700             GO TO INI-FAIL-GF-6-10.                              NC2234.2 1547
   001544         154800 INI-DELETE-GF-6-10.                                              NC2234.2
   001545         154900     PERFORM DE-LETE.                                             NC2234.2 210
   001546         155000     GO TO INI-WRITE-GF-6-10.                                     NC2234.2 1553
   001547         155100 INI-FAIL-GF-6-10.                                                NC2234.2
   001548         155200     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001549         155300     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   001550         155400     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001551         155500          TO RE-MARK                                              NC2234.2 63
   001552         155600     PERFORM FAIL.                                                NC2234.2 209
   001553         155700 INI-WRITE-GF-6-10.                                               NC2234.2
   001554         155800     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001555         155900*                                                                 NC2234.2
   001556         156000 INI-INIT-GF-7.                                                   NC2234.2
   001557         156100*    ===-->  MULTIPLE "REPLACING" PHRASES"  <--===                NC2234.2
   001558         156200     MOVE   "VI-91 6.16.2" TO ANSI-REFERENCE.                     NC2234.2 114
   001559         156300     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   001560         156400     MOVE    1 TO REC-CT.                                         NC2234.2 105
   001561         156500     MOVE    ZEROS  TO TEST-1-1.                                  NC2234.2 IMP 39
   001562         156600     MOVE    ZEROS  TO TEST-1-2.                                  NC2234.2 IMP 40
   001563         156700     MOVE    SPACES TO TEST-1-3.                                  NC2234.2 IMP 41
   001564         156800     MOVE    SPACES TO TEST-1-4.                                  NC2234.2 IMP 42
   001565         156900     MOVE    SPACES TO TEST-1-5.                                  NC2234.2 IMP 43
   001566         157000     MOVE    ZEROS  TO TEST-1-6.                                  NC2234.2 IMP 44
   001567         157100     MOVE    ZEROS  TO TEST-1-7.                                  NC2234.2 IMP 45
   001568         157200     MOVE    SPACES TO TEST-1-8.                                  NC2234.2 IMP 46
   001569         157300     MOVE    SPACES TO TEST-1-9.                                  NC2234.2 IMP 47
   001570         157400     MOVE    SPACES TO TEST-1-10.                                 NC2234.2 IMP 48
   001571         157500 INI-TEST-GF-7-0.                                                 NC2234.2
   001572         157600     INITIALIZE TEST-1-DATA                                       NC2234.2 38
   001573         157700             REPLACING ALPHABETIC DATA     BY "AAAAAA"            NC2234.2
   001574         157800                       ALPHANUMERIC        BY "**********"        NC2234.2
   001575         157900                       ALPHANUMERIC-EDITED BY "DDDDDD"            NC2234.2
   001576         158000                       NUMERIC DATA        BY  1234               NC2234.2
   001577         158100                       NUMERIC-EDITED      BY NUM-1234.           NC2234.2 49
   001578         158200     GO TO   INI-TEST-GF-7-1.                                     NC2234.2 1583
   001579         158300 INI-DELETE-GF-7.                                                 NC2234.2
   001580         158400     PERFORM DE-LETE.                                             NC2234.2 210
   001581         158500     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001582         158600     GO TO   INI-INIT-GF-8.                                       NC2234.2 1780
   001583         158700 INI-TEST-GF-7-1.                                                 NC2234.2
   001584         158800     MOVE   "INI-TEST-GF-7-1" TO PAR-NAME.                        NC2234.2 58
   001585         158900     IF      TEST-1-2 = "$234.00"                                 NC2234.2 40
   001586      1  159000             PERFORM PASS                                         NC2234.2 208
   001587      1  159100             GO TO INI-WRITE-GF-7-1                               NC2234.2 1598
   001588         159200     ELSE                                                         NC2234.2
   001589      1  159300             GO TO INI-FAIL-GF-7-1.                               NC2234.2 1593
   001590         159400 INI-DELETE-GF-7-1.                                               NC2234.2
   001591         159500     PERFORM DE-LETE.                                             NC2234.2 210
   001592         159600     GO TO INI-WRITE-GF-7-1.                                      NC2234.2 1598
   001593         159700 INI-FAIL-GF-7-1.                                                 NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159800     MOVE   "$234.00" TO CORRECT-X                                NC2234.2 82
   001595         159900     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   001596         160000     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001597         160100     PERFORM FAIL.                                                NC2234.2 209
   001598         160200 INI-WRITE-GF-7-1.                                                NC2234.2
   001599         160300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001600         160400*                                                                 NC2234.2
   001601         160500 INI-TEST-GF-7-2.                                                 NC2234.2
   001602         160600     ADD     1 TO REC-CT.                                         NC2234.2 105
   001603         160700     MOVE   "INI-TEST-GF-7-2" TO PAR-NAME.                        NC2234.2 58
   001604         160800     IF      TEST-1-7 = "$234.00"                                 NC2234.2 45
   001605      1  160900             PERFORM PASS                                         NC2234.2 208
   001606      1  161000             GO TO INI-WRITE-GF-7-2                               NC2234.2 1617
   001607         161100     ELSE                                                         NC2234.2
   001608      1  161200             GO TO INI-FAIL-GF-7-2.                               NC2234.2 1612
   001609         161300 INI-DELETE-GF-7-2.                                               NC2234.2
   001610         161400     PERFORM DE-LETE.                                             NC2234.2 210
   001611         161500     GO TO INI-WRITE-GF-7-2.                                      NC2234.2 1617
   001612         161600 INI-FAIL-GF-7-2.                                                 NC2234.2
   001613         161700     MOVE   "$234.00" TO CORRECT-X                                NC2234.2 82
   001614         161800     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   001615         161900     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001616         162000     PERFORM FAIL.                                                NC2234.2 209
   001617         162100 INI-WRITE-GF-7-2.                                                NC2234.2
   001618         162200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001619         162300*                                                                 NC2234.2
   001620         162400 INI-TEST-GF-7-3.                                                 NC2234.2
   001621         162500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001622         162600     MOVE   "INI-TEST-GF-7-3" TO PAR-NAME.                        NC2234.2 58
   001623         162700     IF      TEST-1-1 = 001234                                    NC2234.2 39
   001624      1  162800             PERFORM PASS                                         NC2234.2 208
   001625      1  162900             GO TO INI-WRITE-GF-7-3                               NC2234.2 1637
   001626         163000     ELSE                                                         NC2234.2
   001627      1  163100             GO TO INI-FAIL-GF-7-3.                               NC2234.2 1631
   001628         163200 INI-DELETE-GF-7-3.                                               NC2234.2
   001629         163300     PERFORM DE-LETE.                                             NC2234.2 210
   001630         163400     GO TO INI-WRITE-GF-7-3.                                      NC2234.2 1637
   001631         163500 INI-FAIL-GF-7-3.                                                 NC2234.2
   001632         163600     MOVE    001234   TO CORRECT-N                                NC2234.2 84
   001633         163700     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   001634         163800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001635         163900          TO RE-MARK                                              NC2234.2 63
   001636         164000     PERFORM FAIL.                                                NC2234.2 209
   001637         164100 INI-WRITE-GF-7-3.                                                NC2234.2
   001638         164200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001639         164300*                                                                 NC2234.2
   001640         164400 INI-TEST-GF-7-4.                                                 NC2234.2
   001641         164500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001642         164600     MOVE   "INI-TEST-GF-7-4" TO PAR-NAME.                        NC2234.2 58
   001643         164700     IF      TEST-1-3 = "**********"                              NC2234.2 41
   001644      1  164800             PERFORM PASS                                         NC2234.2 208
   001645      1  164900             GO TO INI-WRITE-GF-7-4                               NC2234.2 1657
   001646         165000     ELSE                                                         NC2234.2
   001647      1  165100             GO TO INI-FAIL-GF-7-4.                               NC2234.2 1651
   001648         165200 INI-DELETE-GF-7-4.                                               NC2234.2
   001649         165300     PERFORM DE-LETE.                                             NC2234.2 210
   001650         165400     GO TO INI-WRITE-GF-7-4.                                      NC2234.2 1657
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165500 INI-FAIL-GF-7-4.                                                 NC2234.2
   001652         165600     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001653         165700     MOVE    TEST-1-3  TO COMPUTED-X                              NC2234.2 41 68
   001654         165800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001655         165900          TO RE-MARK                                              NC2234.2 63
   001656         166000     PERFORM FAIL.                                                NC2234.2 209
   001657         166100 INI-WRITE-GF-7-4.                                                NC2234.2
   001658         166200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001659         166300*                                                                 NC2234.2
   001660         166400 INI-TEST-GF-7-5.                                                 NC2234.2
   001661         166500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001662         166600     MOVE   "INI-TEST-GF-7-5" TO PAR-NAME.                        NC2234.2 58
   001663         166700     IF      TEST-1-4 = "DD DD/DD"                                NC2234.2 42
   001664      1  166800             PERFORM PASS                                         NC2234.2 208
   001665      1  166900             GO TO INI-WRITE-GF-7-5                               NC2234.2 1677
   001666         167000     ELSE                                                         NC2234.2
   001667      1  167100             GO TO INI-FAIL-GF-7-5.                               NC2234.2 1671
   001668         167200 INI-DELETE-GF-7-5.                                               NC2234.2
   001669         167300     PERFORM DE-LETE.                                             NC2234.2 210
   001670         167400     GO TO INI-WRITE-GF-7-5.                                      NC2234.2 1677
   001671         167500 INI-FAIL-GF-7-5.                                                 NC2234.2
   001672         167600     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   001673         167700     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   001674         167800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001675         167900          TO RE-MARK                                              NC2234.2 63
   001676         168000     PERFORM FAIL.                                                NC2234.2 209
   001677         168100 INI-WRITE-GF-7-5.                                                NC2234.2
   001678         168200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001679         168300*                                                                 NC2234.2
   001680         168400 INI-TEST-GF-7-6.                                                 NC2234.2
   001681         168500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001682         168600     MOVE   "INI-TEST-GF-7-6" TO PAR-NAME.                        NC2234.2 58
   001683         168700     IF      TEST-1-5 = "AAAAAA"                                  NC2234.2 43
   001684      1  168800             PERFORM PASS                                         NC2234.2 208
   001685      1  168900             GO TO INI-WRITE-GF-7-6                               NC2234.2 1697
   001686         169000     ELSE                                                         NC2234.2
   001687      1  169100             GO TO INI-FAIL-GF-7-6.                               NC2234.2 1691
   001688         169200 INI-DELETE-GF-7-6.                                               NC2234.2
   001689         169300     PERFORM DE-LETE.                                             NC2234.2 210
   001690         169400     GO TO INI-WRITE-GF-7-6.                                      NC2234.2 1697
   001691         169500 INI-FAIL-GF-7-6.                                                 NC2234.2
   001692         169600     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001693         169700     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   001694         169800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001695         169900         TO RE-MARK                                               NC2234.2 63
   001696         170000     PERFORM FAIL.                                                NC2234.2 209
   001697         170100 INI-WRITE-GF-7-6.                                                NC2234.2
   001698         170200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001699         170300*                                                                 NC2234.2
   001700         170400 INI-TEST-GF-7-7.                                                 NC2234.2
   001701         170500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001702         170600     MOVE   "INI-TEST-GF-7-7" TO PAR-NAME.                        NC2234.2 58
   001703         170700     IF      TEST-1-6 = 001234                                    NC2234.2 44
   001704      1  170800             PERFORM PASS                                         NC2234.2 208
   001705      1  170900             GO TO INI-WRITE-GF-7-7                               NC2234.2 1717
   001706         171000     ELSE                                                         NC2234.2
   001707      1  171100             GO TO INI-FAIL-GF-7-7.                               NC2234.2 1711
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171200 INI-DELETE-GF-7-7.                                               NC2234.2
   001709         171300     PERFORM DE-LETE.                                             NC2234.2 210
   001710         171400     GO TO INI-WRITE-GF-7-7.                                      NC2234.2 1717
   001711         171500 INI-FAIL-GF-7-7.                                                 NC2234.2
   001712         171600     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   001713         171700     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   001714         171800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001715         171900          TO RE-MARK                                              NC2234.2 63
   001716         172000     PERFORM FAIL.                                                NC2234.2 209
   001717         172100 INI-WRITE-GF-7-7.                                                NC2234.2
   001718         172200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001719         172300*                                                                 NC2234.2
   001720         172400 INI-TEST-GF-7-8.                                                 NC2234.2
   001721         172500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001722         172600     MOVE   "INI-TEST-GF-7-8" TO PAR-NAME.                        NC2234.2 58
   001723         172700     IF      TEST-1-8 = "**********"                              NC2234.2 46
   001724      1  172800             PERFORM PASS                                         NC2234.2 208
   001725      1  172900             GO TO INI-WRITE-GF-7-8                               NC2234.2 1737
   001726         173000     ELSE                                                         NC2234.2
   001727      1  173100             GO TO INI-FAIL-GF-7-8.                               NC2234.2 1731
   001728         173200 INI-DELETE-GF-7-8.                                               NC2234.2
   001729         173300     PERFORM DE-LETE.                                             NC2234.2 210
   001730         173400     GO TO INI-WRITE-GF-7-8.                                      NC2234.2 1737
   001731         173500 INI-FAIL-GF-7-8.                                                 NC2234.2
   001732         173600     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   001733         173700     MOVE    TEST-1-8  TO COMPUTED-X                              NC2234.2 46 68
   001734         173800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001735         173900          TO RE-MARK                                              NC2234.2 63
   001736         174000     PERFORM FAIL.                                                NC2234.2 209
   001737         174100 INI-WRITE-GF-7-8.                                                NC2234.2
   001738         174200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001739         174300*                                                                 NC2234.2
   001740         174400 INI-TEST-GF-7-9.                                                 NC2234.2
   001741         174500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001742         174600     MOVE   "INI-TEST-GF-7-9" TO PAR-NAME.                        NC2234.2 58
   001743         174700     IF      TEST-1-9 = "DD DD/DD"                                NC2234.2 47
   001744      1  174800             PERFORM PASS                                         NC2234.2 208
   001745      1  174900             GO TO INI-WRITE-GF-7-9                               NC2234.2 1757
   001746         175000     ELSE                                                         NC2234.2
   001747      1  175100             GO TO INI-FAIL-GF-7-9.                               NC2234.2 1751
   001748         175200 INI-DELETE-GF-7-9.                                               NC2234.2
   001749         175300     PERFORM DE-LETE.                                             NC2234.2 210
   001750         175400     GO TO INI-WRITE-GF-7-9.                                      NC2234.2 1757
   001751         175500 INI-FAIL-GF-7-9.                                                 NC2234.2
   001752         175600     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   001753         175700     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   001754         175800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001755         175900          TO RE-MARK                                              NC2234.2 63
   001756         176000     PERFORM FAIL.                                                NC2234.2 209
   001757         176100 INI-WRITE-GF-7-9.                                                NC2234.2
   001758         176200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001759         176300*                                                                 NC2234.2
   001760         176400 INI-TEST-GF-7-10.                                                NC2234.2
   001761         176500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001762         176600     MOVE   "INI-TEST-GF-7-10" TO PAR-NAME.                       NC2234.2 58
   001763         176700     IF      TEST-1-10 = "AAAAAA"                                 NC2234.2 48
   001764      1  176800             PERFORM PASS                                         NC2234.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765      1  176900             GO TO INI-WRITE-GF-7-10                              NC2234.2 1777
   001766         177000     ELSE                                                         NC2234.2
   001767      1  177100             GO TO INI-FAIL-GF-7-10.                              NC2234.2 1771
   001768         177200 INI-DELETE-GF-7-10.                                              NC2234.2
   001769         177300     PERFORM DE-LETE.                                             NC2234.2 210
   001770         177400     GO TO INI-WRITE-GF-7-10.                                     NC2234.2 1777
   001771         177500 INI-FAIL-GF-7-10.                                                NC2234.2
   001772         177600     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   001773         177700     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   001774         177800     MOVE   "WRONGLY AFFECTED BY OTHER INITIALISATION"            NC2234.2
   001775         177900          TO RE-MARK                                              NC2234.2 63
   001776         178000     PERFORM FAIL.                                                NC2234.2 209
   001777         178100 INI-WRITE-GF-7-10.                                               NC2234.2
   001778         178200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001779         178300*                                                                 NC2234.2
   001780         178400 INI-INIT-GF-8.                                                   NC2234.2
   001781         178500*    ===-->  MULTIPLE RECEIVING AREAS       <--===                NC2234.2
   001782         178600     MOVE   "VI-91 6.16.4 GR2" TO ANSI-REFERENCE.                 NC2234.2 114
   001783         178700     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   001784         178800     MOVE    1 TO REC-CT.                                         NC2234.2 105
   001785         178900     MOVE    LOW-VALUES  TO TEST-1-DATA.                          NC2234.2 IMP 38
   001786         179000     MOVE    999.99      TO TEST-8-DATA-1.                        NC2234.2 50
   001787         179100     MOVE   "ZZZZZZZZZZ" TO TEST-8-DATA-2.                        NC2234.2 51
   001788         179200 INI-TEST-GF-8-0.                                                 NC2234.2
   001789         179300     INITIALIZE TEST-8-DATA-1                                     NC2234.2 50
   001790         179400                TEST-1-DATA                                       NC2234.2 38
   001791         179500                TEST-8-DATA-2.                                    NC2234.2 51
   001792         179600     GO TO   INI-TEST-GF-8-1.                                     NC2234.2 1797
   001793         179700 INI-DELETE-GF-8.                                                 NC2234.2
   001794         179800     PERFORM DE-LETE.                                             NC2234.2 210
   001795         179900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001796         180000     GO TO   INI-INIT-GF-9.                                       NC2234.2 2024
   001797         180100 INI-TEST-GF-8-1.                                                 NC2234.2
   001798         180200     MOVE   "INI-TEST-GF-8-1" TO PAR-NAME.                        NC2234.2 58
   001799         180300     IF      TEST-1-2 = "  $0.00"                                 NC2234.2 40
   001800      1  180400             PERFORM PASS                                         NC2234.2 208
   001801      1  180500             GO TO INI-WRITE-GF-8-1                               NC2234.2 1812
   001802         180600     ELSE                                                         NC2234.2
   001803      1  180700             GO TO INI-FAIL-GF-8-1.                               NC2234.2 1807
   001804         180800 INI-DELETE-GF-8-1.                                               NC2234.2
   001805         180900     PERFORM DE-LETE.                                             NC2234.2 210
   001806         181000     GO TO INI-WRITE-GF-8-1.                                      NC2234.2 1812
   001807         181100 INI-FAIL-GF-8-1.                                                 NC2234.2
   001808         181200     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   001809         181300     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   001810         181400     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001811         181500     PERFORM FAIL.                                                NC2234.2 209
   001812         181600 INI-WRITE-GF-8-1.                                                NC2234.2
   001813         181700     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001814         181800*                                                                 NC2234.2
   001815         181900 INI-TEST-GF-8-2.                                                 NC2234.2
   001816         182000     ADD     1 TO REC-CT.                                         NC2234.2 105
   001817         182100     MOVE   "INI-TEST-GF-8-2" TO PAR-NAME.                        NC2234.2 58
   001818         182200     IF      TEST-1-7 = "  $0.00"                                 NC2234.2 45
   001819      1  182300             PERFORM PASS                                         NC2234.2 208
   001820      1  182400             GO TO INI-WRITE-GF-8-2                               NC2234.2 1831
   001821         182500     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822      1  182600             GO TO INI-FAIL-GF-8-2.                               NC2234.2 1826
   001823         182700 INI-DELETE-GF-8-2.                                               NC2234.2
   001824         182800     PERFORM DE-LETE.                                             NC2234.2 210
   001825         182900     GO TO INI-WRITE-GF-8-2.                                      NC2234.2 1831
   001826         183000 INI-FAIL-GF-8-2.                                                 NC2234.2
   001827         183100     MOVE   "  $0.00"  TO CORRECT-X                               NC2234.2 82
   001828         183200     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   001829         183300     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001830         183400     PERFORM FAIL.                                                NC2234.2 209
   001831         183500 INI-WRITE-GF-8-2.                                                NC2234.2
   001832         183600     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001833         183700*                                                                 NC2234.2
   001834         183800 INI-TEST-GF-8-3.                                                 NC2234.2
   001835         183900     ADD     1 TO REC-CT.                                         NC2234.2 105
   001836         184000     MOVE   "INI-TEST-GF-8-3" TO PAR-NAME.                        NC2234.2 58
   001837         184100     IF      TEST-1-1 = ZERO                                      NC2234.2 39 IMP
   001838      1  184200             PERFORM PASS                                         NC2234.2 208
   001839      1  184300             GO TO INI-WRITE-GF-8-3                               NC2234.2 1850
   001840         184400     ELSE                                                         NC2234.2
   001841      1  184500             GO TO INI-FAIL-GF-8-3.                               NC2234.2 1845
   001842         184600 INI-DELETE-GF-8-3.                                               NC2234.2
   001843         184700     PERFORM DE-LETE.                                             NC2234.2 210
   001844         184800     GO TO INI-WRITE-GF-8-3.                                      NC2234.2 1850
   001845         184900 INI-FAIL-GF-8-3.                                                 NC2234.2
   001846         185000     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   001847         185100     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   001848         185200     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001849         185300     PERFORM FAIL.                                                NC2234.2 209
   001850         185400 INI-WRITE-GF-8-3.                                                NC2234.2
   001851         185500     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001852         185600*                                                                 NC2234.2
   001853         185700 INI-TEST-GF-8-4.                                                 NC2234.2
   001854         185800     ADD     1 TO REC-CT.                                         NC2234.2 105
   001855         185900     MOVE   "INI-TEST-GF-8-4" TO PAR-NAME.                        NC2234.2 58
   001856         186000     IF      TEST-1-3 = SPACES                                    NC2234.2 41 IMP
   001857      1  186100             PERFORM PASS                                         NC2234.2 208
   001858      1  186200             GO TO INI-WRITE-GF-8-4                               NC2234.2 1869
   001859         186300     ELSE                                                         NC2234.2
   001860      1  186400             GO TO INI-FAIL-GF-8-4.                               NC2234.2 1864
   001861         186500 INI-DELETE-GF-8-4.                                               NC2234.2
   001862         186600     PERFORM DE-LETE.                                             NC2234.2 210
   001863         186700     GO TO INI-WRITE-GF-8-4.                                      NC2234.2 1869
   001864         186800 INI-FAIL-GF-8-4.                                                 NC2234.2
   001865         186900     MOVE    SPACES    TO CORRECT-X                               NC2234.2 IMP 82
   001866         187000     MOVE    TEST-1-3  TO COMPUTED-X                              NC2234.2 41 68
   001867         187100     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001868         187200     PERFORM FAIL.                                                NC2234.2 209
   001869         187300 INI-WRITE-GF-8-4.                                                NC2234.2
   001870         187400     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001871         187500*                                                                 NC2234.2
   001872         187600 INI-TEST-GF-8-5.                                                 NC2234.2
   001873         187700     ADD     1 TO REC-CT.                                         NC2234.2 105
   001874         187800     MOVE   "INI-TEST-GF-8-5" TO PAR-NAME.                        NC2234.2 58
   001875         187900     IF      TEST-1-4 = "     /  "                                NC2234.2 42
   001876      1  188000             PERFORM PASS                                         NC2234.2 208
   001877      1  188100             GO TO INI-WRITE-GF-8-5                               NC2234.2 1888
   001878         188200     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879      1  188300             GO TO INI-FAIL-GF-8-5.                               NC2234.2 1883
   001880         188400 INI-DELETE-GF-8-5.                                               NC2234.2
   001881         188500     PERFORM DE-LETE.                                             NC2234.2 210
   001882         188600     GO TO INI-WRITE-GF-8-5.                                      NC2234.2 1888
   001883         188700 INI-FAIL-GF-8-5.                                                 NC2234.2
   001884         188800     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   001885         188900     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   001886         189000     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001887         189100     PERFORM FAIL.                                                NC2234.2 209
   001888         189200 INI-WRITE-GF-8-5.                                                NC2234.2
   001889         189300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001890         189400*                                                                 NC2234.2
   001891         189500 INI-TEST-GF-8-6.                                                 NC2234.2
   001892         189600     ADD     1 TO REC-CT.                                         NC2234.2 105
   001893         189700     MOVE   "INI-TEST-GF-8-6" TO PAR-NAME.                        NC2234.2 58
   001894         189800     IF      TEST-1-5 = SPACES                                    NC2234.2 43 IMP
   001895      1  189900             PERFORM PASS                                         NC2234.2 208
   001896      1  190000             GO TO INI-WRITE-GF-8-6                               NC2234.2 1907
   001897         190100     ELSE                                                         NC2234.2
   001898      1  190200             GO TO INI-FAIL-GF-8-6.                               NC2234.2 1902
   001899         190300 INI-DELETE-GF-8-6.                                               NC2234.2
   001900         190400     PERFORM DE-LETE.                                             NC2234.2 210
   001901         190500     GO TO INI-WRITE-GF-8-6.                                      NC2234.2 1907
   001902         190600 INI-FAIL-GF-8-6.                                                 NC2234.2
   001903         190700     MOVE    SPACES   TO CORRECT-X                                NC2234.2 IMP 82
   001904         190800     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   001905         190900     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001906         191000     PERFORM FAIL.                                                NC2234.2 209
   001907         191100 INI-WRITE-GF-8-6.                                                NC2234.2
   001908         191200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001909         191300*                                                                 NC2234.2
   001910         191400 INI-TEST-GF-8-7.                                                 NC2234.2
   001911         191500     ADD     1 TO REC-CT.                                         NC2234.2 105
   001912         191600     MOVE   "INI-TEST-GF-8-7" TO PAR-NAME.                        NC2234.2 58
   001913         191700     IF      TEST-1-6 = ZERO                                      NC2234.2 44 IMP
   001914      1  191800             PERFORM PASS                                         NC2234.2 208
   001915      1  191900             GO TO INI-WRITE-GF-8-7                               NC2234.2 1926
   001916         192000     ELSE                                                         NC2234.2
   001917      1  192100             GO TO INI-FAIL-GF-8-7.                               NC2234.2 1921
   001918         192200 INI-DELETE-GF-8-7.                                               NC2234.2
   001919         192300     PERFORM DE-LETE.                                             NC2234.2 210
   001920         192400     GO TO INI-WRITE-GF-8-7.                                      NC2234.2 1926
   001921         192500 INI-FAIL-GF-8-7.                                                 NC2234.2
   001922         192600     MOVE    ZERO     TO CORRECT-N                                NC2234.2 IMP 84
   001923         192700     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   001924         192800     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001925         192900     PERFORM FAIL.                                                NC2234.2 209
   001926         193000 INI-WRITE-GF-8-7.                                                NC2234.2
   001927         193100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001928         193200*                                                                 NC2234.2
   001929         193300 INI-TEST-GF-8-8.                                                 NC2234.2
   001930         193400     ADD     1 TO REC-CT.                                         NC2234.2 105
   001931         193500     MOVE   "INI-TEST-GF-8-8" TO PAR-NAME.                        NC2234.2 58
   001932         193600     IF      TEST-1-8 = SPACES                                    NC2234.2 46 IMP
   001933      1  193700             PERFORM PASS                                         NC2234.2 208
   001934      1  193800             GO TO INI-WRITE-GF-8-8                               NC2234.2 1945
   001935         193900     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936      1  194000             GO TO INI-FAIL-GF-8-8.                               NC2234.2 1940
   001937         194100 INI-DELETE-GF-8-8.                                               NC2234.2
   001938         194200     PERFORM DE-LETE.                                             NC2234.2 210
   001939         194300     GO TO INI-WRITE-GF-8-8.                                      NC2234.2 1945
   001940         194400 INI-FAIL-GF-8-8.                                                 NC2234.2
   001941         194500     MOVE    SPACES    TO CORRECT-X                               NC2234.2 IMP 82
   001942         194600     MOVE    TEST-1-8  TO COMPUTED-X                              NC2234.2 46 68
   001943         194700     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001944         194800     PERFORM FAIL.                                                NC2234.2 209
   001945         194900 INI-WRITE-GF-8-8.                                                NC2234.2
   001946         195000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001947         195100*                                                                 NC2234.2
   001948         195200 INI-TEST-GF-8-9.                                                 NC2234.2
   001949         195300     ADD     1 TO REC-CT.                                         NC2234.2 105
   001950         195400     MOVE   "INI-TEST-GF-8-9" TO PAR-NAME.                        NC2234.2 58
   001951         195500     IF      TEST-1-9 = "     /  "                                NC2234.2 47
   001952      1  195600             PERFORM PASS                                         NC2234.2 208
   001953      1  195700             GO TO INI-WRITE-GF-8-9                               NC2234.2 1964
   001954         195800     ELSE                                                         NC2234.2
   001955      1  195900             GO TO INI-FAIL-GF-8-9.                               NC2234.2 1959
   001956         196000 INI-DELETE-GF-8-9.                                               NC2234.2
   001957         196100     PERFORM DE-LETE.                                             NC2234.2 210
   001958         196200     GO TO INI-WRITE-GF-8-9.                                      NC2234.2 1964
   001959         196300 INI-FAIL-GF-8-9.                                                 NC2234.2
   001960         196400     MOVE   "     /  " TO CORRECT-X                               NC2234.2 82
   001961         196500     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   001962         196600     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001963         196700     PERFORM FAIL.                                                NC2234.2 209
   001964         196800 INI-WRITE-GF-8-9.                                                NC2234.2
   001965         196900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001966         197000*                                                                 NC2234.2
   001967         197100 INI-TEST-GF-8-10.                                                NC2234.2
   001968         197200     ADD     1 TO REC-CT.                                         NC2234.2 105
   001969         197300     MOVE   "INI-TEST-GF-8-10" TO PAR-NAME.                       NC2234.2 58
   001970         197400     IF      TEST-1-10 = SPACES                                   NC2234.2 48 IMP
   001971      1  197500             PERFORM PASS                                         NC2234.2 208
   001972      1  197600             GO TO INI-WRITE-GF-8-10                              NC2234.2 1983
   001973         197700     ELSE                                                         NC2234.2
   001974      1  197800             GO TO INI-FAIL-GF-8-10.                              NC2234.2 1978
   001975         197900 INI-DELETE-GF-8-10.                                              NC2234.2
   001976         198000     PERFORM DE-LETE.                                             NC2234.2 210
   001977         198100     GO TO INI-WRITE-GF-8-10.                                     NC2234.2 1983
   001978         198200 INI-FAIL-GF-8-10.                                                NC2234.2
   001979         198300     MOVE    SPACES    TO CORRECT-X                               NC2234.2 IMP 82
   001980         198400     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   001981         198500     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   001982         198600     PERFORM FAIL.                                                NC2234.2 209
   001983         198700 INI-WRITE-GF-8-10.                                               NC2234.2
   001984         198800     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   001985         198900*                                                                 NC2234.2
   001986         199000 INI-TEST-GF-8-11.                                                NC2234.2
   001987         199100     ADD     1 TO REC-CT.                                         NC2234.2 105
   001988         199200     MOVE   "INI-TEST-GF-8-11" TO PAR-NAME.                       NC2234.2 58
   001989         199300     IF      TEST-8-DATA-1 = "  $0.00"                            NC2234.2 50
   001990      1  199400             PERFORM PASS                                         NC2234.2 208
   001991      1  199500             GO TO INI-WRITE-GF-8-11                              NC2234.2 2002
   001992         199600     ELSE                                                         NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993      1  199700             GO TO INI-FAIL-GF-8-11.                              NC2234.2 1997
   001994         199800 INI-DELETE-GF-8-11.                                              NC2234.2
   001995         199900     PERFORM DE-LETE.                                             NC2234.2 210
   001996         200000     GO TO INI-WRITE-GF-8-11.                                     NC2234.2 2002
   001997         200100 INI-FAIL-GF-8-11.                                                NC2234.2
   001998         200200     MOVE   "  $0.00"   TO CORRECT-X                              NC2234.2 82
   001999         200300     MOVE    TEST-8-DATA-1  TO COMPUTED-X                         NC2234.2 50 68
   002000         200400     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002001         200500     PERFORM FAIL.                                                NC2234.2 209
   002002         200600 INI-WRITE-GF-8-11.                                               NC2234.2
   002003         200700     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002004         200800*                                                                 NC2234.2
   002005         200900 INI-TEST-GF-8-12.                                                NC2234.2
   002006         201000     ADD     1 TO REC-CT.                                         NC2234.2 105
   002007         201100     MOVE   "INI-TEST-GF-8-12" TO PAR-NAME.                       NC2234.2 58
   002008         201200     IF      TEST-8-DATA-2 = SPACES                               NC2234.2 51 IMP
   002009      1  201300             PERFORM PASS                                         NC2234.2 208
   002010      1  201400             GO TO INI-WRITE-GF-8-12                              NC2234.2 2021
   002011         201500     ELSE                                                         NC2234.2
   002012      1  201600             GO TO INI-FAIL-GF-8-12.                              NC2234.2 2016
   002013         201700 INI-DELETE-GF-8-12.                                              NC2234.2
   002014         201800     PERFORM DE-LETE.                                             NC2234.2 210
   002015         201900     GO TO INI-WRITE-GF-8-12.                                     NC2234.2 2021
   002016         202000 INI-FAIL-GF-8-12.                                                NC2234.2
   002017         202100     MOVE    SPACES    TO CORRECT-X                               NC2234.2 IMP 82
   002018         202200     MOVE    TEST-8-DATA-2 TO COMPUTED-X                          NC2234.2 51 68
   002019         202300     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002020         202400     PERFORM FAIL.                                                NC2234.2 209
   002021         202500 INI-WRITE-GF-8-12.                                               NC2234.2
   002022         202600     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002023         202700*                                                                 NC2234.2
   002024         202800 INI-INIT-GF-9.                                                   NC2234.2
   002025         202900*    ===-->  MULTIPLE RECEIVING AREAS AND   <--===                NC2234.2
   002026         203000*    ===-->  MULTIPLE "REPLACING" PHRASES"  <--===                NC2234.2
   002027         203100     MOVE   "VI-91 6.16.2" TO ANSI-REFERENCE.                     NC2234.2 114
   002028         203200     MOVE   "INITIALIZE STATEMENT" TO FEATURE.                    NC2234.2 54
   002029         203300     MOVE    1 TO REC-CT.                                         NC2234.2 105
   002030         203400     MOVE    ZEROS  TO TEST-1-1.                                  NC2234.2 IMP 39
   002031         203500     MOVE    ZEROS  TO TEST-1-2.                                  NC2234.2 IMP 40
   002032         203600     MOVE    SPACES TO TEST-1-3.                                  NC2234.2 IMP 41
   002033         203700     MOVE    SPACES TO TEST-1-4.                                  NC2234.2 IMP 42
   002034         203800     MOVE    SPACES TO TEST-1-5.                                  NC2234.2 IMP 43
   002035         203900     MOVE    ZEROS  TO TEST-1-6.                                  NC2234.2 IMP 44
   002036         204000     MOVE    ZEROS  TO TEST-1-7.                                  NC2234.2 IMP 45
   002037         204100     MOVE    SPACES TO TEST-1-8.                                  NC2234.2 IMP 46
   002038         204200     MOVE    SPACES TO TEST-1-9.                                  NC2234.2 IMP 47
   002039         204300     MOVE    SPACES TO TEST-1-10.                                 NC2234.2 IMP 48
   002040         204400     MOVE    999.99      TO TEST-8-DATA-1.                        NC2234.2 50
   002041         204500     MOVE   "ZZZZZZZZZZ" TO TEST-8-DATA-2.                        NC2234.2 51
   002042         204600 INI-TEST-GF-9-0.                                                 NC2234.2
   002043         204700     INITIALIZE                                                   NC2234.2
   002044         204800             TEST-8-DATA-1                                        NC2234.2 50
   002045         204900             TEST-1-DATA                                          NC2234.2 38
   002046         205000             TEST-8-DATA-2                                        NC2234.2 51
   002047         205100             REPLACING ALPHABETIC DATA     BY "AAAAAA"            NC2234.2
   002048         205200                       ALPHANUMERIC        BY "**********"        NC2234.2
   002049         205300                       ALPHANUMERIC-EDITED BY "DDDDDD"            NC2234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205400                       NUMERIC DATA        BY  NUM-1234           NC2234.2 49
   002051         205500                       NUMERIC-EDITED      BY  1234.              NC2234.2
   002052         205600     GO TO   INI-TEST-GF-9-1.                                     NC2234.2 2057
   002053         205700 INI-DELETE-GF-9.                                                 NC2234.2
   002054         205800     PERFORM DE-LETE.                                             NC2234.2 210
   002055         205900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002056         206000     GO TO   CCVS-EXIT.                                           NC2234.2 2284
   002057         206100 INI-TEST-GF-9-1.                                                 NC2234.2
   002058         206200     MOVE   "INI-TEST-GF-9-1" TO PAR-NAME.                        NC2234.2 58
   002059         206300     IF      TEST-1-2 = "$234.00"                                 NC2234.2 40
   002060      1  206400             PERFORM PASS                                         NC2234.2 208
   002061      1  206500             GO TO INI-WRITE-GF-9-1                               NC2234.2 2072
   002062         206600     ELSE                                                         NC2234.2
   002063      1  206700             GO TO INI-FAIL-GF-9-1.                               NC2234.2 2067
   002064         206800 INI-DELETE-GF-9-1.                                               NC2234.2
   002065         206900     PERFORM DE-LETE.                                             NC2234.2 210
   002066         207000     GO TO INI-WRITE-GF-9-1.                                      NC2234.2 2072
   002067         207100 INI-FAIL-GF-9-1.                                                 NC2234.2
   002068         207200     MOVE   "$234.00" TO CORRECT-X                                NC2234.2 82
   002069         207300     MOVE    TEST-1-2 TO COMPUTED-X                               NC2234.2 40 68
   002070         207400     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002071         207500     PERFORM FAIL.                                                NC2234.2 209
   002072         207600 INI-WRITE-GF-9-1.                                                NC2234.2
   002073         207700     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002074         207800*                                                                 NC2234.2
   002075         207900 INI-TEST-GF-9-2.                                                 NC2234.2
   002076         208000     ADD     1 TO REC-CT.                                         NC2234.2 105
   002077         208100     MOVE   "INI-TEST-GF-9-2" TO PAR-NAME.                        NC2234.2 58
   002078         208200     IF      TEST-1-7 = "$234.00"                                 NC2234.2 45
   002079      1  208300             PERFORM PASS                                         NC2234.2 208
   002080      1  208400             GO TO INI-WRITE-GF-9-2                               NC2234.2 2091
   002081         208500     ELSE                                                         NC2234.2
   002082      1  208600             GO TO INI-FAIL-GF-9-2.                               NC2234.2 2086
   002083         208700 INI-DELETE-GF-9-2.                                               NC2234.2
   002084         208800     PERFORM DE-LETE.                                             NC2234.2 210
   002085         208900     GO TO INI-WRITE-GF-9-2.                                      NC2234.2 2091
   002086         209000 INI-FAIL-GF-9-2.                                                 NC2234.2
   002087         209100     MOVE   "$234.00" TO CORRECT-X                                NC2234.2 82
   002088         209200     MOVE    TEST-1-7 TO COMPUTED-X                               NC2234.2 45 68
   002089         209300     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002090         209400     PERFORM FAIL.                                                NC2234.2 209
   002091         209500 INI-WRITE-GF-9-2.                                                NC2234.2
   002092         209600     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002093         209700*                                                                 NC2234.2
   002094         209800 INI-TEST-GF-9-3.                                                 NC2234.2
   002095         209900     ADD     1 TO REC-CT.                                         NC2234.2 105
   002096         210000     MOVE   "INI-TEST-GF-9-3" TO PAR-NAME.                        NC2234.2 58
   002097         210100     IF      TEST-1-1 = 001234                                    NC2234.2 39
   002098      1  210200             PERFORM PASS                                         NC2234.2 208
   002099      1  210300             GO TO INI-WRITE-GF-9-3                               NC2234.2 2110
   002100         210400     ELSE                                                         NC2234.2
   002101      1  210500             GO TO INI-FAIL-GF-9-3.                               NC2234.2 2105
   002102         210600 INI-DELETE-GF-9-3.                                               NC2234.2
   002103         210700     PERFORM DE-LETE.                                             NC2234.2 210
   002104         210800     GO TO INI-WRITE-GF-9-3.                                      NC2234.2 2110
   002105         210900 INI-FAIL-GF-9-3.                                                 NC2234.2
   002106         211000     MOVE    001234   TO CORRECT-N                                NC2234.2 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211100     MOVE    TEST-1-1 TO COMPUTED-X                               NC2234.2 39 68
   002108         211200     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002109         211300     PERFORM FAIL.                                                NC2234.2 209
   002110         211400 INI-WRITE-GF-9-3.                                                NC2234.2
   002111         211500     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002112         211600*                                                                 NC2234.2
   002113         211700 INI-TEST-GF-9-4.                                                 NC2234.2
   002114         211800     ADD     1 TO REC-CT.                                         NC2234.2 105
   002115         211900     MOVE   "INI-TEST-GF-9-4" TO PAR-NAME.                        NC2234.2 58
   002116         212000     IF      TEST-1-3 = "**********"                              NC2234.2 41
   002117      1  212100             PERFORM PASS                                         NC2234.2 208
   002118      1  212200             GO TO INI-WRITE-GF-9-4                               NC2234.2 2129
   002119         212300     ELSE                                                         NC2234.2
   002120      1  212400             GO TO INI-FAIL-GF-9-4.                               NC2234.2 2124
   002121         212500 INI-DELETE-GF-9-4.                                               NC2234.2
   002122         212600     PERFORM DE-LETE.                                             NC2234.2 210
   002123         212700     GO TO INI-WRITE-GF-9-4.                                      NC2234.2 2129
   002124         212800 INI-FAIL-GF-9-4.                                                 NC2234.2
   002125         212900     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   002126         213000     MOVE    TEST-1-3  TO COMPUTED-X                              NC2234.2 41 68
   002127         213100     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002128         213200     PERFORM FAIL.                                                NC2234.2 209
   002129         213300 INI-WRITE-GF-9-4.                                                NC2234.2
   002130         213400     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002131         213500*                                                                 NC2234.2
   002132         213600 INI-TEST-GF-9-5.                                                 NC2234.2
   002133         213700     ADD     1 TO REC-CT.                                         NC2234.2 105
   002134         213800     MOVE   "INI-TEST-GF-9-5" TO PAR-NAME.                        NC2234.2 58
   002135         213900     IF      TEST-1-4 = "DD DD/DD"                                NC2234.2 42
   002136      1  214000             PERFORM PASS                                         NC2234.2 208
   002137      1  214100             GO TO INI-WRITE-GF-9-5                               NC2234.2 2148
   002138         214200     ELSE                                                         NC2234.2
   002139      1  214300             GO TO INI-FAIL-GF-9-5.                               NC2234.2 2143
   002140         214400 INI-DELETE-GF-9-5.                                               NC2234.2
   002141         214500     PERFORM DE-LETE.                                             NC2234.2 210
   002142         214600     GO TO INI-WRITE-GF-9-5.                                      NC2234.2 2148
   002143         214700 INI-FAIL-GF-9-5.                                                 NC2234.2
   002144         214800     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
   002145         214900     MOVE    TEST-1-4  TO COMPUTED-X                              NC2234.2 42 68
   002146         215000     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002147         215100     PERFORM FAIL.                                                NC2234.2 209
   002148         215200 INI-WRITE-GF-9-5.                                                NC2234.2
   002149         215300     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002150         215400*                                                                 NC2234.2
   002151         215500 INI-TEST-GF-9-6.                                                 NC2234.2
   002152         215600     ADD     1 TO REC-CT.                                         NC2234.2 105
   002153         215700     MOVE   "INI-TEST-GF-9-6" TO PAR-NAME.                        NC2234.2 58
   002154         215800     IF      TEST-1-5 = "AAAAAA"                                  NC2234.2 43
   002155      1  215900             PERFORM PASS                                         NC2234.2 208
   002156      1  216000             GO TO INI-WRITE-GF-9-6                               NC2234.2 2167
   002157         216100     ELSE                                                         NC2234.2
   002158      1  216200             GO TO INI-FAIL-GF-9-6.                               NC2234.2 2162
   002159         216300 INI-DELETE-GF-9-6.                                               NC2234.2
   002160         216400     PERFORM DE-LETE.                                             NC2234.2 210
   002161         216500     GO TO INI-WRITE-GF-9-6.                                      NC2234.2 2167
   002162         216600 INI-FAIL-GF-9-6.                                                 NC2234.2
   002163         216700     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164         216800     MOVE    TEST-1-5 TO COMPUTED-X                               NC2234.2 43 68
   002165         216900     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002166         217000     PERFORM FAIL.                                                NC2234.2 209
   002167         217100 INI-WRITE-GF-9-6.                                                NC2234.2
   002168         217200     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002169         217300*                                                                 NC2234.2
   002170         217400 INI-TEST-GF-9-7.                                                 NC2234.2
   002171         217500     ADD     1 TO REC-CT.                                         NC2234.2 105
   002172         217600     MOVE   "INI-TEST-GF-9-7" TO PAR-NAME.                        NC2234.2 58
   002173         217700     IF      TEST-1-6 = 1234                                      NC2234.2 44
   002174      1  217800             PERFORM PASS                                         NC2234.2 208
   002175      1  217900             GO TO INI-WRITE-GF-9-7                               NC2234.2 2186
   002176         218000     ELSE                                                         NC2234.2
   002177      1  218100             GO TO INI-FAIL-GF-9-7.                               NC2234.2 2181
   002178         218200 INI-DELETE-GF-9-7.                                               NC2234.2
   002179         218300     PERFORM DE-LETE.                                             NC2234.2 210
   002180         218400     GO TO INI-WRITE-GF-9-7.                                      NC2234.2 2186
   002181         218500 INI-FAIL-GF-9-7.                                                 NC2234.2
   002182         218600     MOVE    1234     TO CORRECT-N                                NC2234.2 84
   002183         218700     MOVE    TEST-1-6 TO COMPUTED-X                               NC2234.2 44 68
   002184         218800     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002185         218900     PERFORM FAIL.                                                NC2234.2 209
   002186         219000 INI-WRITE-GF-9-7.                                                NC2234.2
   002187         219100     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002188         219200*                                                                 NC2234.2
   002189         219300 INI-TEST-GF-9-8.                                                 NC2234.2
   002190         219400     ADD     1 TO REC-CT.                                         NC2234.2 105
   002191         219500     MOVE   "INI-TEST-GF-9-8" TO PAR-NAME.                        NC2234.2 58
   002192         219600     IF      TEST-1-8 = "**********"                              NC2234.2 46
   002193      1  219700             PERFORM PASS                                         NC2234.2 208
   002194      1  219800             GO TO INI-WRITE-GF-9-8                               NC2234.2 2205
   002195         219900     ELSE                                                         NC2234.2
   002196      1  220000             GO TO INI-FAIL-GF-9-8.                               NC2234.2 2200
   002197         220100 INI-DELETE-GF-9-8.                                               NC2234.2
   002198         220200     PERFORM DE-LETE.                                             NC2234.2 210
   002199         220300     GO TO INI-WRITE-GF-9-8.                                      NC2234.2 2205
   002200         220400 INI-FAIL-GF-9-8.                                                 NC2234.2
   002201         220500     MOVE   "**********" TO CORRECT-X                             NC2234.2 82
   002202         220600     MOVE    TEST-1-8  TO COMPUTED-X                              NC2234.2 46 68
   002203         220700     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002204         220800     PERFORM FAIL.                                                NC2234.2 209
   002205         220900 INI-WRITE-GF-9-8.                                                NC2234.2
   002206         221000     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002207         221100*                                                                 NC2234.2
   002208         221200 INI-TEST-GF-9-9.                                                 NC2234.2
   002209         221300     ADD     1 TO REC-CT.                                         NC2234.2 105
   002210         221400     MOVE   "INI-TEST-GF-9-9" TO PAR-NAME.                        NC2234.2 58
   002211         221500     IF      TEST-1-9 = "DD DD/DD"                                NC2234.2 47
   002212      1  221600             PERFORM PASS                                         NC2234.2 208
   002213      1  221700             GO TO INI-WRITE-GF-9-9                               NC2234.2 2224
   002214         221800     ELSE                                                         NC2234.2
   002215      1  221900             GO TO INI-FAIL-GF-9-9.                               NC2234.2 2219
   002216         222000 INI-DELETE-GF-9-9.                                               NC2234.2
   002217         222100     PERFORM DE-LETE.                                             NC2234.2 210
   002218         222200     GO TO INI-WRITE-GF-9-9.                                      NC2234.2 2224
   002219         222300 INI-FAIL-GF-9-9.                                                 NC2234.2
   002220         222400     MOVE   "DD DD/DD" TO CORRECT-X                               NC2234.2 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002221         222500     MOVE    TEST-1-9  TO COMPUTED-X                              NC2234.2 47 68
   002222         222600     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002223         222700     PERFORM FAIL.                                                NC2234.2 209
   002224         222800 INI-WRITE-GF-9-9.                                                NC2234.2
   002225         222900     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002226         223000*                                                                 NC2234.2
   002227         223100 INI-TEST-GF-9-10.                                                NC2234.2
   002228         223200     ADD     1 TO REC-CT.                                         NC2234.2 105
   002229         223300     MOVE   "INI-TEST-GF-9-10" TO PAR-NAME.                       NC2234.2 58
   002230         223400     IF      TEST-1-10 = "AAAAAA"                                 NC2234.2 48
   002231      1  223500             PERFORM PASS                                         NC2234.2 208
   002232      1  223600             GO TO INI-WRITE-GF-9-10                              NC2234.2 2243
   002233         223700     ELSE                                                         NC2234.2
   002234      1  223800             GO TO INI-FAIL-GF-9-10.                              NC2234.2 2238
   002235         223900 INI-DELETE-GF-9-10.                                              NC2234.2
   002236         224000     PERFORM DE-LETE.                                             NC2234.2 210
   002237         224100     GO TO INI-WRITE-GF-9-10.                                     NC2234.2 2243
   002238         224200 INI-FAIL-GF-9-10.                                                NC2234.2
   002239         224300     MOVE   "AAAAAA"  TO CORRECT-X                                NC2234.2 82
   002240         224400     MOVE    TEST-1-10 TO COMPUTED-X                              NC2234.2 48 68
   002241         224500     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002242         224600     PERFORM FAIL.                                                NC2234.2 209
   002243         224700 INI-WRITE-GF-9-10.                                               NC2234.2
   002244         224800     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002245         224900*                                                                 NC2234.2
   002246         225000 INI-TEST-GF-9-11.                                                NC2234.2
   002247         225100     ADD     1 TO REC-CT.                                         NC2234.2 105
   002248         225200     MOVE   "INI-TEST-GF-9-11" TO PAR-NAME.                       NC2234.2 58
   002249         225300     IF      TEST-8-DATA-1 = "$234.00"                            NC2234.2 50
   002250      1  225400             PERFORM PASS                                         NC2234.2 208
   002251      1  225500             GO TO INI-WRITE-GF-9-11                              NC2234.2 2262
   002252         225600     ELSE                                                         NC2234.2
   002253      1  225700             GO TO INI-FAIL-GF-9-11.                              NC2234.2 2257
   002254         225800 INI-DELETE-GF-9-11.                                              NC2234.2
   002255         225900     PERFORM DE-LETE.                                             NC2234.2 210
   002256         226000     GO TO INI-WRITE-GF-9-11.                                     NC2234.2 2262
   002257         226100 INI-FAIL-GF-9-11.                                                NC2234.2
   002258         226200     MOVE   "$234.00"  TO CORRECT-X                               NC2234.2 82
   002259         226300     MOVE    TEST-8-DATA-1  TO COMPUTED-X                         NC2234.2 50 68
   002260         226400     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002261         226500     PERFORM FAIL.                                                NC2234.2 209
   002262         226600 INI-WRITE-GF-9-11.                                               NC2234.2
   002263         226700     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002264         226800*                                                                 NC2234.2
   002265         226900 INI-TEST-GF-9-12.                                                NC2234.2
   002266         227000     ADD     1 TO REC-CT.                                         NC2234.2 105
   002267         227100     MOVE   "INI-TEST-GF-9-12" TO PAR-NAME.                       NC2234.2 58
   002268         227200     IF      TEST-8-DATA-2 = "AAAAAA    "                         NC2234.2 51
   002269      1  227300             PERFORM PASS                                         NC2234.2 208
   002270      1  227400             GO TO INI-WRITE-GF-9-12                              NC2234.2 2281
   002271         227500     ELSE                                                         NC2234.2
   002272      1  227600             GO TO INI-FAIL-GF-9-12.                              NC2234.2 2276
   002273         227700 INI-DELETE-GF-9-12.                                              NC2234.2
   002274         227800     PERFORM DE-LETE.                                             NC2234.2 210
   002275         227900     GO TO INI-WRITE-GF-9-12.                                     NC2234.2 2281
   002276         228000 INI-FAIL-GF-9-12.                                                NC2234.2
   002277         228100     MOVE   "AAAAAA    " TO CORRECT-X                             NC2234.2 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002278         228200     MOVE    TEST-8-DATA-2 TO COMPUTED-X                          NC2234.2 51 68
   002279         228300     MOVE   "INCORRECTLY INITIALIZED" TO RE-MARK                  NC2234.2 63
   002280         228400     PERFORM FAIL.                                                NC2234.2 209
   002281         228500 INI-WRITE-GF-9-12.                                               NC2234.2
   002282         228600     PERFORM PRINT-DETAIL.                                        NC2234.2 212
   002283         228700*                                                                 NC2234.2
   002284         228800 CCVS-EXIT SECTION.                                               NC2234.2
   002285         228900 CCVS-999999.                                                     NC2234.2
   002286         229000     GO TO CLOSE-FILES.                                           NC2234.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    44
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      114   ANSI-REFERENCE . . . . . . . .  287 294 303 M313 M512 M722 M931 M1140 M1349 M1558 M1782 M2027
       93   CCVS-C-1 . . . . . . . . . . .  230 273
       98   CCVS-C-2 . . . . . . . . . . .  231 274
      148   CCVS-E-1 . . . . . . . . . . .  236
      153   CCVS-E-2 . . . . . . . . . . .  246 253 260 265
      156   CCVS-E-2-2 . . . . . . . . . .  M245
      161   CCVS-E-3 . . . . . . . . . . .  266
      170   CCVS-E-4 . . . . . . . . . . .  245
      171   CCVS-E-4-1 . . . . . . . . . .  M243
      173   CCVS-E-4-2 . . . . . . . . . .  M244
      115   CCVS-H-1 . . . . . . . . . . .  225
      120   CCVS-H-2A. . . . . . . . . . .  226
      129   CCVS-H-2B. . . . . . . . . . .  227
      141   CCVS-H-3 . . . . . . . . . . .  228
      191   CCVS-PGM-ID. . . . . . . . . .  197 197
       75   CM-18V0
       69   COMPUTED-A . . . . . . . . . .  70 72 73 74 75 299 302
       70   COMPUTED-N . . . . . . . . . .  M1163 M1182
       68   COMPUTED-X . . . . . . . . . .  M220 285 M334 M353 M372 M391 M410 M429 M448 M467 M486 M505 M536 M555 M574 M594
                                            M614 M634 M654 M674 M694 M714 M745 M764 M783 M803 M823 M843 M863 M883 M903 M923
                                            M954 M973 M992 M1012 M1032 M1052 M1072 M1092 M1112 M1132 M1201 M1221 M1241 M1261
                                            M1281 M1301 M1321 M1341 M1372 M1391 M1410 M1430 M1450 M1470 M1490 M1510 M1529
                                            M1549 M1595 M1614 M1633 M1653 M1673 M1693 M1713 M1733 M1753 M1773 M1809 M1828
                                            M1847 M1866 M1885 M1904 M1923 M1942 M1961 M1980 M1999 M2018 M2069 M2088 M2107
                                            M2126 M2145 M2164 M2183 M2202 M2221 M2240 M2259 M2278
       72   COMPUTED-0V18
       74   COMPUTED-14V4
       76   COMPUTED-18V0
       73   COMPUTED-4V14
       92   COR-ANSI-REFERENCE . . . . . .  M294 M296
       83   CORRECT-A. . . . . . . . . . .  84 85 86 87 88 300 302
       84   CORRECT-N. . . . . . . . . . .  M333 M428 M573 M653 M782 M862 M991 M1071 M1162 M1181 M1409 M1489 M1632 M1712
                                            M1846 M1922 M2106 M2182
       82   CORRECT-X. . . . . . . . . . .  M221 286 M352 M371 M390 M409 M447 M466 M485 M504 M535 M554 M593 M613 M633 M673
                                            M693 M713 M744 M763 M802 M822 M842 M882 M902 M922 M953 M972 M1011 M1031 M1051
                                            M1091 M1111 M1131 M1200 M1220 M1240 M1260 M1280 M1300 M1320 M1340 M1371 M1390
                                            M1429 M1449 M1469 M1509 M1548 M1594 M1613 M1652 M1672 M1692 M1732 M1752 M1772
                                            M1808 M1827 M1865 M1884 M1903 M1941 M1960 M1979 M1998 M2017 M2068 M2087 M2125
                                            M2144 M2163 M2201 M2220 M2239 M2258 M2277
       85   CORRECT-0V18
       87   CORRECT-14V4
       89   CORRECT-18V0
       86   CORRECT-4V14
       88   CR-18V0
      106   DELETE-COUNTER . . . . . . . .  M210 239 256 258
       61   DOTVALUE . . . . . . . . . . .  M215
      112   DUMMY-HOLD . . . . . . . . . .  M270 276
       36   DUMMY-RECORD . . . . . . . . .  M225 M226 M227 M228 M230 M231 M232 M234 M236 M246 M253 M260 M265 M266 270 M271
                                            272 M273 M274 M275 M276 280 M281 M289 M304
      159   ENDER-DESC . . . . . . . . . .  M248 M259 M264
      107   ERROR-COUNTER. . . . . . . . .  M209 238 249 252
      111   ERROR-HOLD . . . . . . . . . .  M238 M239 M239 M240 244
      157   ERROR-TOTAL. . . . . . . . . .  M250 M252 M257 M258 M262 M263
       54   FEATURE. . . . . . . . . . . .  M312 M513 M723 M932 M1141 M1350 M1559 M1783 M2028
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    45
0 Defined   Cross-reference of data names   References

0     185   HYPHEN-LINE. . . . . . . . . .  232 234 275
      151   ID-AGAIN . . . . . . . . . . .  M197
      184   INF-ANSI-REFERENCE . . . . . .  M287 M290 M303 M305
      179   INFO-TEXT. . . . . . . . . . .  M288
      108   INSPECT-COUNTER. . . . . . . .  M207 238 261 263
       49   NUM-1234 . . . . . . . . . . .  1354 1577 2050
       56   P-OR-F . . . . . . . . . . . .  M207 M208 M209 M210 217 M220
       58   PAR-NAME . . . . . . . . . . .  M222 M323 M342 M361 M380 M399 M418 M437 M456 M475 M494 M525 M544 M563 M583 M603
                                            M623 M643 M663 M683 M703 M734 M753 M772 M792 M812 M832 M852 M872 M892 M912 M943
                                            M962 M981 M1001 M1021 M1041 M1061 M1081 M1101 M1121 M1152 M1171 M1190 M1210 M1230
                                            M1250 M1270 M1290 M1310 M1330 M1361 M1380 M1399 M1419 M1439 M1459 M1479 M1499
                                            M1519 M1538 M1584 M1603 M1622 M1642 M1662 M1682 M1702 M1722 M1742 M1762 M1798
                                            M1817 M1836 M1855 M1874 M1893 M1912 M1931 M1950 M1969 M1988 M2007 M2058 M2077
                                            M2096 M2115 M2134 M2153 M2172 M2191 M2210 M2229 M2248 M2267
       60   PARDOT-X . . . . . . . . . . .  M214
      109   PASS-COUNTER . . . . . . . . .  M208 240 243
       34   PRINT-FILE . . . . . . . . . .  30 196 202
       35   PRINT-REC. . . . . . . . . . .  M216 M293 M295
       63   RE-MARK. . . . . . . . . . . .  M211 M223 M335 M354 M373 M392 M411 M430 M449 M468 M487 M506 M537 M556 M576 M596
                                            M616 M636 M656 M676 M696 M716 M746 M765 M785 M805 M825 M845 M865 M885 M905 M925
                                            M955 M974 M994 M1014 M1034 M1054 M1074 M1094 M1114 M1134 M1164 M1183 M1203 M1223
                                            M1243 M1263 M1283 M1303 M1323 M1343 M1373 M1392 M1412 M1432 M1452 M1472 M1492
                                            M1512 M1531 M1551 M1596 M1615 M1635 M1655 M1675 M1695 M1715 M1735 M1755 M1775
                                            M1810 M1829 M1848 M1867 M1886 M1905 M1924 M1943 M1962 M1981 M2000 M2019 M2070
                                            M2089 M2108 M2127 M2146 M2165 M2184 M2203 M2222 M2241 M2260 M2279
      105   REC-CT . . . . . . . . . . . .  213 215 222 M314 M341 M360 M379 M398 M417 M436 M455 M474 M493 M514 M543 M562
                                            M582 M602 M622 M642 M662 M682 M702 M724 M752 M771 M791 M811 M831 M851 M871 M891
                                            M911 M933 M961 M980 M1000 M1020 M1040 M1060 M1080 M1100 M1120 M1142 M1170 M1189
                                            M1209 M1229 M1249 M1269 M1289 M1309 M1329 M1351 M1379 M1398 M1418 M1438 M1458
                                            M1478 M1498 M1518 M1537 M1560 M1602 M1621 M1641 M1661 M1681 M1701 M1721 M1741
                                            M1761 M1784 M1816 M1835 M1854 M1873 M1892 M1911 M1930 M1949 M1968 M1987 M2006
                                            M2029 M2076 M2095 M2114 M2133 M2152 M2171 M2190 M2209 M2228 M2247 M2266
      104   REC-SKL-SUB
      113   RECORD-COUNT . . . . . . . . .  M268 269 M277
       64   TEST-COMPUTED. . . . . . . . .  293
       79   TEST-CORRECT . . . . . . . . .  295
      132   TEST-ID. . . . . . . . . . . .  M197
       52   TEST-RESULTS . . . . . . . . .  M198 216
       38   TEST-1-DATA. . . . . . . . . .  M316 M516 M726 M935 M1144 M1353 M1572 M1785 M1790 M2045
       39   TEST-1-1 . . . . . . . . . . .  324 334 564 574 773 783 982 992 1153 1163 1400 1410 M1561 1623 1633 1837 1847
                                            M2030 2097 2107
       48   TEST-1-10. . . . . . . . . . .  495 505 545 555 913 923 1122 1132 1331 1341 1539 1549 M1570 1763 1773 1970 1980
                                            M2039 2230 2240
       40   TEST-1-2 . . . . . . . . . . .  343 353 584 594 793 803 1002 1012 1191 1201 1362 1372 M1562 1585 1595 1799 1809
                                            M2031 2059 2069
       41   TEST-1-3 . . . . . . . . . . .  362 372 604 614 735 745 1022 1032 1211 1221 1420 1430 M1563 1643 1653 1856 1866
                                            M2032 2116 2126
       42   TEST-1-4 . . . . . . . . . . .  381 391 624 634 813 823 944 954 1231 1241 1440 1450 M1564 1663 1673 1875 1885
                                            M2033 2135 2145
       43   TEST-1-5 . . . . . . . . . . .  400 410 526 536 833 843 1042 1052 1251 1261 1460 1470 M1565 1683 1693 1894 1904
                                            M2034 2154 2164
       44   TEST-1-6 . . . . . . . . . . .  419 429 644 654 853 863 1062 1072 1172 1182 1480 1490 M1566 1703 1713 1913 1923
                                            M2035 2173 2183
       45   TEST-1-7 . . . . . . . . . . .  438 448 664 674 873 883 1082 1092 1271 1281 1381 1391 M1567 1604 1614 1818 1828
                                            M2036 2078 2088
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    46
0 Defined   Cross-reference of data names   References

0      46   TEST-1-8 . . . . . . . . . . .  457 467 684 694 754 764 1102 1112 1291 1301 1500 1510 M1568 1723 1733 1932 1942
                                            M2037 2192 2202
       47   TEST-1-9 . . . . . . . . . . .  476 486 704 714 893 903 963 973 1311 1321 1520 1529 M1569 1743 1753 1951 1961
                                            M2038 2211 2221
       50   TEST-8-DATA-1. . . . . . . . .  M1786 M1789 1989 1999 M2040 M2044 2249 2259
       51   TEST-8-DATA-2. . . . . . . . .  M1787 M1791 2008 2018 M2041 M2046 2268 2278
      110   TOTAL-ERROR
      181   XXCOMPUTED . . . . . . . . . .  M302
      183   XXCORRECT. . . . . . . . . . .  M302
      176   XXINFO . . . . . . . . . . . .  289 304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    47
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

      298   BAIL-OUT . . . . . . . . . . .  P219
      306   BAIL-OUT-EX. . . . . . . . . .  E219 G300
      301   BAIL-OUT-WRITE . . . . . . . .  G299
      282   BLANK-LINE-PRINT
     2284   CCVS-EXIT. . . . . . . . . . .  G2056
     2285   CCVS-999999
      194   CCVS1
      307   CCVS1-EXIT . . . . . . . . . .  G200
      201   CLOSE-FILES. . . . . . . . . .  G2286
      229   COLUMN-NAMES-ROUTINE . . . . .  E199
      210   DE-LETE. . . . . . . . . . . .  P319 P330 P349 P368 P387 P406 P425 P444 P463 P482 P501 P520 P532 P551 P570 P590
                                            P610 P630 P650 P670 P690 P710 P730 P741 P760 P779 P799 P819 P839 P859 P879 P899
                                            P919 P939 P950 P969 P988 P1008 P1028 P1048 P1068 P1088 P1108 P1128 P1148 P1159
                                            P1178 P1197 P1217 P1237 P1257 P1277 P1297 P1317 P1337 P1357 P1368 P1387 P1406
                                            P1426 P1446 P1466 P1486 P1506 P1526 P1545 P1580 P1591 P1610 P1629 P1649 P1669
                                            P1689 P1709 P1729 P1749 P1769 P1794 P1805 P1824 P1843 P1862 P1881 P1900 P1919
                                            P1938 P1957 P1976 P1995 P2014 P2054 P2065 P2084 P2103 P2122 P2141 P2160 P2179
                                            P2198 P2217 P2236 P2255 P2274
      233   END-ROUTINE. . . . . . . . . .  P202
      237   END-ROUTINE-1
      247   END-ROUTINE-12
      255   END-ROUTINE-13 . . . . . . . .  E202
      235   END-RTN-EXIT
      209   FAIL . . . . . . . . . . . . .  P336 P355 P374 P393 P412 P431 P450 P469 P488 P507 P538 P557 P577 P597 P617 P637
                                            P657 P677 P697 P717 P747 P766 P786 P806 P826 P846 P866 P886 P906 P926 P956 P975
                                            P995 P1015 P1035 P1055 P1075 P1095 P1115 P1135 P1165 P1184 P1204 P1224 P1244
                                            P1264 P1284 P1304 P1324 P1344 P1374 P1393 P1413 P1433 P1453 P1473 P1493 P1513
                                            P1532 P1552 P1597 P1616 P1636 P1656 P1676 P1696 P1716 P1736 P1756 P1776 P1811
                                            P1830 P1849 P1868 P1887 P1906 P1925 P1944 P1963 P1982 P2001 P2020 P2071 P2090
                                            P2109 P2128 P2147 P2166 P2185 P2204 P2223 P2242 P2261 P2280
      284   FAIL-ROUTINE . . . . . . . . .  P218
      297   FAIL-ROUTINE-EX. . . . . . . .  E218 G291
      292   FAIL-ROUTINE-WRITE . . . . . .  G285 G286
      224   HEAD-ROUTINE . . . . . . . . .  P199
      318   INI-DELETE-GF-1
      329   INI-DELETE-GF-1-1
      500   INI-DELETE-GF-1-10
      348   INI-DELETE-GF-1-2
      367   INI-DELETE-GF-1-3
      386   INI-DELETE-GF-1-4
      405   INI-DELETE-GF-1-5
      424   INI-DELETE-GF-1-6
      443   INI-DELETE-GF-1-7
      462   INI-DELETE-GF-1-8
      481   INI-DELETE-GF-1-9
      519   INI-DELETE-GF-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    48
0 Defined   Cross-reference of procedures   References

0     531   INI-DELETE-GF-2-1
      709   INI-DELETE-GF-2-10
      550   INI-DELETE-GF-2-2
      569   INI-DELETE-GF-2-3
      589   INI-DELETE-GF-2-4
      609   INI-DELETE-GF-2-5
      629   INI-DELETE-GF-2-6
      649   INI-DELETE-GF-2-7
      669   INI-DELETE-GF-2-8
      689   INI-DELETE-GF-2-9
      729   INI-DELETE-GF-3
      740   INI-DELETE-GF-3-1
      918   INI-DELETE-GF-3-10
      759   INI-DELETE-GF-3-2
      778   INI-DELETE-GF-3-3
      798   INI-DELETE-GF-3-4
      818   INI-DELETE-GF-3-5
      838   INI-DELETE-GF-3-6
      858   INI-DELETE-GF-3-7
      878   INI-DELETE-GF-3-8
      898   INI-DELETE-GF-3-9
      938   INI-DELETE-GF-4
      949   INI-DELETE-GF-4-1
     1127   INI-DELETE-GF-4-10
      968   INI-DELETE-GF-4-2
      987   INI-DELETE-GF-4-3
     1007   INI-DELETE-GF-4-4
     1027   INI-DELETE-GF-4-5
     1047   INI-DELETE-GF-4-6
     1067   INI-DELETE-GF-4-7
     1087   INI-DELETE-GF-4-8
     1107   INI-DELETE-GF-4-9
     1147   INI-DELETE-GF-5
     1158   INI-DELETE-GF-5-1
     1336   INI-DELETE-GF-5-10
     1177   INI-DELETE-GF-5-2
     1196   INI-DELETE-GF-5-3
     1216   INI-DELETE-GF-5-4
     1236   INI-DELETE-GF-5-5
     1256   INI-DELETE-GF-5-6
     1276   INI-DELETE-GF-5-7
     1296   INI-DELETE-GF-5-8
     1316   INI-DELETE-GF-5-9
     1356   INI-DELETE-GF-6
     1367   INI-DELETE-GF-6-1
     1544   INI-DELETE-GF-6-10
     1386   INI-DELETE-GF-6-2
     1405   INI-DELETE-GF-6-3
     1425   INI-DELETE-GF-6-4
     1445   INI-DELETE-GF-6-5
     1465   INI-DELETE-GF-6-6
     1485   INI-DELETE-GF-6-7
     1505   INI-DELETE-GF-6-8
     1525   INI-DELETE-GF-6-9
     1579   INI-DELETE-GF-7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    49
0 Defined   Cross-reference of procedures   References

0    1590   INI-DELETE-GF-7-1
     1768   INI-DELETE-GF-7-10
     1609   INI-DELETE-GF-7-2
     1628   INI-DELETE-GF-7-3
     1648   INI-DELETE-GF-7-4
     1668   INI-DELETE-GF-7-5
     1688   INI-DELETE-GF-7-6
     1708   INI-DELETE-GF-7-7
     1728   INI-DELETE-GF-7-8
     1748   INI-DELETE-GF-7-9
     1793   INI-DELETE-GF-8
     1804   INI-DELETE-GF-8-1
     1975   INI-DELETE-GF-8-10
     1994   INI-DELETE-GF-8-11
     2013   INI-DELETE-GF-8-12
     1823   INI-DELETE-GF-8-2
     1842   INI-DELETE-GF-8-3
     1861   INI-DELETE-GF-8-4
     1880   INI-DELETE-GF-8-5
     1899   INI-DELETE-GF-8-6
     1918   INI-DELETE-GF-8-7
     1937   INI-DELETE-GF-8-8
     1956   INI-DELETE-GF-8-9
     2053   INI-DELETE-GF-9
     2064   INI-DELETE-GF-9-1
     2235   INI-DELETE-GF-9-10
     2254   INI-DELETE-GF-9-11
     2273   INI-DELETE-GF-9-12
     2083   INI-DELETE-GF-9-2
     2102   INI-DELETE-GF-9-3
     2121   INI-DELETE-GF-9-4
     2140   INI-DELETE-GF-9-5
     2159   INI-DELETE-GF-9-6
     2178   INI-DELETE-GF-9-7
     2197   INI-DELETE-GF-9-8
     2216   INI-DELETE-GF-9-9
      332   INI-FAIL-GF-1-1. . . . . . . .  G328
      503   INI-FAIL-GF-1-10 . . . . . . .  G499
      351   INI-FAIL-GF-1-2. . . . . . . .  G347
      370   INI-FAIL-GF-1-3. . . . . . . .  G366
      389   INI-FAIL-GF-1-4. . . . . . . .  G385
      408   INI-FAIL-GF-1-5. . . . . . . .  G404
      427   INI-FAIL-GF-1-6. . . . . . . .  G423
      446   INI-FAIL-GF-1-7. . . . . . . .  G442
      465   INI-FAIL-GF-1-8. . . . . . . .  G461
      484   INI-FAIL-GF-1-9. . . . . . . .  G480
      534   INI-FAIL-GF-2-1. . . . . . . .  G530
      712   INI-FAIL-GF-2-10 . . . . . . .  G708
      553   INI-FAIL-GF-2-2. . . . . . . .  G549
      572   INI-FAIL-GF-2-3. . . . . . . .  G568
      592   INI-FAIL-GF-2-4. . . . . . . .  G588
      612   INI-FAIL-GF-2-5. . . . . . . .  G608
      632   INI-FAIL-GF-2-6. . . . . . . .  G628
      652   INI-FAIL-GF-2-7. . . . . . . .  G648
      672   INI-FAIL-GF-2-8. . . . . . . .  G668
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    50
0 Defined   Cross-reference of procedures   References

0     692   INI-FAIL-GF-2-9. . . . . . . .  G688
      743   INI-FAIL-GF-3-1. . . . . . . .  G739
      921   INI-FAIL-GF-3-10 . . . . . . .  G917
      762   INI-FAIL-GF-3-2. . . . . . . .  G758
      781   INI-FAIL-GF-3-3. . . . . . . .  G777
      801   INI-FAIL-GF-3-4. . . . . . . .  G797
      821   INI-FAIL-GF-3-5. . . . . . . .  G817
      841   INI-FAIL-GF-3-6. . . . . . . .  G837
      861   INI-FAIL-GF-3-7. . . . . . . .  G857
      881   INI-FAIL-GF-3-8. . . . . . . .  G877
      901   INI-FAIL-GF-3-9. . . . . . . .  G897
      952   INI-FAIL-GF-4-1. . . . . . . .  G948
     1130   INI-FAIL-GF-4-10 . . . . . . .  G1126
      971   INI-FAIL-GF-4-2. . . . . . . .  G967
      990   INI-FAIL-GF-4-3. . . . . . . .  G986
     1010   INI-FAIL-GF-4-4. . . . . . . .  G1006
     1030   INI-FAIL-GF-4-5. . . . . . . .  G1026
     1050   INI-FAIL-GF-4-6. . . . . . . .  G1046
     1070   INI-FAIL-GF-4-7. . . . . . . .  G1066
     1090   INI-FAIL-GF-4-8. . . . . . . .  G1086
     1110   INI-FAIL-GF-4-9. . . . . . . .  G1106
     1161   INI-FAIL-GF-5-1. . . . . . . .  G1157
     1339   INI-FAIL-GF-5-10 . . . . . . .  G1335
     1180   INI-FAIL-GF-5-2. . . . . . . .  G1176
     1199   INI-FAIL-GF-5-3. . . . . . . .  G1195
     1219   INI-FAIL-GF-5-4. . . . . . . .  G1215
     1239   INI-FAIL-GF-5-5. . . . . . . .  G1235
     1259   INI-FAIL-GF-5-6. . . . . . . .  G1255
     1279   INI-FAIL-GF-5-7. . . . . . . .  G1275
     1299   INI-FAIL-GF-5-8. . . . . . . .  G1295
     1319   INI-FAIL-GF-5-9. . . . . . . .  G1315
     1370   INI-FAIL-GF-6-1. . . . . . . .  G1366
     1547   INI-FAIL-GF-6-10 . . . . . . .  G1543
     1389   INI-FAIL-GF-6-2. . . . . . . .  G1385
     1408   INI-FAIL-GF-6-3. . . . . . . .  G1404
     1428   INI-FAIL-GF-6-4. . . . . . . .  G1424
     1448   INI-FAIL-GF-6-5. . . . . . . .  G1444
     1468   INI-FAIL-GF-6-6. . . . . . . .  G1464
     1488   INI-FAIL-GF-6-7. . . . . . . .  G1484
     1508   INI-FAIL-GF-6-8. . . . . . . .  G1504
     1528   INI-FAIL-GF-6-9. . . . . . . .  G1524
     1593   INI-FAIL-GF-7-1. . . . . . . .  G1589
     1771   INI-FAIL-GF-7-10 . . . . . . .  G1767
     1612   INI-FAIL-GF-7-2. . . . . . . .  G1608
     1631   INI-FAIL-GF-7-3. . . . . . . .  G1627
     1651   INI-FAIL-GF-7-4. . . . . . . .  G1647
     1671   INI-FAIL-GF-7-5. . . . . . . .  G1667
     1691   INI-FAIL-GF-7-6. . . . . . . .  G1687
     1711   INI-FAIL-GF-7-7. . . . . . . .  G1707
     1731   INI-FAIL-GF-7-8. . . . . . . .  G1727
     1751   INI-FAIL-GF-7-9. . . . . . . .  G1747
     1807   INI-FAIL-GF-8-1. . . . . . . .  G1803
     1978   INI-FAIL-GF-8-10 . . . . . . .  G1974
     1997   INI-FAIL-GF-8-11 . . . . . . .  G1993
     2016   INI-FAIL-GF-8-12 . . . . . . .  G2012
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    51
0 Defined   Cross-reference of procedures   References

0    1826   INI-FAIL-GF-8-2. . . . . . . .  G1822
     1845   INI-FAIL-GF-8-3. . . . . . . .  G1841
     1864   INI-FAIL-GF-8-4. . . . . . . .  G1860
     1883   INI-FAIL-GF-8-5. . . . . . . .  G1879
     1902   INI-FAIL-GF-8-6. . . . . . . .  G1898
     1921   INI-FAIL-GF-8-7. . . . . . . .  G1917
     1940   INI-FAIL-GF-8-8. . . . . . . .  G1936
     1959   INI-FAIL-GF-8-9. . . . . . . .  G1955
     2067   INI-FAIL-GF-9-1. . . . . . . .  G2063
     2238   INI-FAIL-GF-9-10 . . . . . . .  G2234
     2257   INI-FAIL-GF-9-11 . . . . . . .  G2253
     2276   INI-FAIL-GF-9-12 . . . . . . .  G2272
     2086   INI-FAIL-GF-9-2. . . . . . . .  G2082
     2105   INI-FAIL-GF-9-3. . . . . . . .  G2101
     2124   INI-FAIL-GF-9-4. . . . . . . .  G2120
     2143   INI-FAIL-GF-9-5. . . . . . . .  G2139
     2162   INI-FAIL-GF-9-6. . . . . . . .  G2158
     2181   INI-FAIL-GF-9-7. . . . . . . .  G2177
     2200   INI-FAIL-GF-9-8. . . . . . . .  G2196
     2219   INI-FAIL-GF-9-9. . . . . . . .  G2215
      311   INI-INIT-GF-1
      511   INI-INIT-GF-2. . . . . . . . .  G321
      721   INI-INIT-GF-3. . . . . . . . .  G522
      930   INI-INIT-GF-4. . . . . . . . .  G732
     1139   INI-INIT-GF-5. . . . . . . . .  G941
     1348   INI-INIT-GF-6. . . . . . . . .  G1150
     1556   INI-INIT-GF-7. . . . . . . . .  G1359
     1780   INI-INIT-GF-8. . . . . . . . .  G1582
     2024   INI-INIT-GF-9. . . . . . . . .  G1796
      315   INI-TEST-GF-1-0
      322   INI-TEST-GF-1-1. . . . . . . .  G317
      492   INI-TEST-GF-1-10
      340   INI-TEST-GF-1-2
      359   INI-TEST-GF-1-3
      378   INI-TEST-GF-1-4
      397   INI-TEST-GF-1-5
      416   INI-TEST-GF-1-6
      435   INI-TEST-GF-1-7
      454   INI-TEST-GF-1-8
      473   INI-TEST-GF-1-9
      515   INI-TEST-GF-2-0
      524   INI-TEST-GF-2-1. . . . . . . .  G518
      701   INI-TEST-GF-2-10
      542   INI-TEST-GF-2-2
      561   INI-TEST-GF-2-3
      581   INI-TEST-GF-2-4
      601   INI-TEST-GF-2-5
      621   INI-TEST-GF-2-6
      641   INI-TEST-GF-2-7
      661   INI-TEST-GF-2-8
      681   INI-TEST-GF-2-9
      725   INI-TEST-GF-3-0
      733   INI-TEST-GF-3-1. . . . . . . .  G728
      910   INI-TEST-GF-3-10
      751   INI-TEST-GF-3-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    52
0 Defined   Cross-reference of procedures   References

0     770   INI-TEST-GF-3-3
      790   INI-TEST-GF-3-4
      810   INI-TEST-GF-3-5
      830   INI-TEST-GF-3-6
      850   INI-TEST-GF-3-7
      870   INI-TEST-GF-3-8
      890   INI-TEST-GF-3-9
      934   INI-TEST-GF-4-0
      942   INI-TEST-GF-4-1. . . . . . . .  G937
     1119   INI-TEST-GF-4-10
      960   INI-TEST-GF-4-2
      979   INI-TEST-GF-4-3
      999   INI-TEST-GF-4-4
     1019   INI-TEST-GF-4-5
     1039   INI-TEST-GF-4-6
     1059   INI-TEST-GF-4-7
     1079   INI-TEST-GF-4-8
     1099   INI-TEST-GF-4-9
     1143   INI-TEST-GF-5-0
     1151   INI-TEST-GF-5-1. . . . . . . .  G1146
     1328   INI-TEST-GF-5-10
     1169   INI-TEST-GF-5-2
     1188   INI-TEST-GF-5-3
     1208   INI-TEST-GF-5-4
     1228   INI-TEST-GF-5-5
     1248   INI-TEST-GF-5-6
     1268   INI-TEST-GF-5-7
     1288   INI-TEST-GF-5-8
     1308   INI-TEST-GF-5-9
     1352   INI-TEST-GF-6-0
     1360   INI-TEST-GF-6-1. . . . . . . .  G1355
     1536   INI-TEST-GF-6-10
     1378   INI-TEST-GF-6-2
     1397   INI-TEST-GF-6-3
     1417   INI-TEST-GF-6-4
     1437   INI-TEST-GF-6-5
     1457   INI-TEST-GF-6-6
     1477   INI-TEST-GF-6-7
     1497   INI-TEST-GF-6-8
     1517   INI-TEST-GF-6-9
     1571   INI-TEST-GF-7-0
     1583   INI-TEST-GF-7-1. . . . . . . .  G1578
     1760   INI-TEST-GF-7-10
     1601   INI-TEST-GF-7-2
     1620   INI-TEST-GF-7-3
     1640   INI-TEST-GF-7-4
     1660   INI-TEST-GF-7-5
     1680   INI-TEST-GF-7-6
     1700   INI-TEST-GF-7-7
     1720   INI-TEST-GF-7-8
     1740   INI-TEST-GF-7-9
     1788   INI-TEST-GF-8-0
     1797   INI-TEST-GF-8-1. . . . . . . .  G1792
     1967   INI-TEST-GF-8-10
     1986   INI-TEST-GF-8-11
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    53
0 Defined   Cross-reference of procedures   References

0    2005   INI-TEST-GF-8-12
     1815   INI-TEST-GF-8-2
     1834   INI-TEST-GF-8-3
     1853   INI-TEST-GF-8-4
     1872   INI-TEST-GF-8-5
     1891   INI-TEST-GF-8-6
     1910   INI-TEST-GF-8-7
     1929   INI-TEST-GF-8-8
     1948   INI-TEST-GF-8-9
     2042   INI-TEST-GF-9-0
     2057   INI-TEST-GF-9-1. . . . . . . .  G2052
     2227   INI-TEST-GF-9-10
     2246   INI-TEST-GF-9-11
     2265   INI-TEST-GF-9-12
     2075   INI-TEST-GF-9-2
     2094   INI-TEST-GF-9-3
     2113   INI-TEST-GF-9-4
     2132   INI-TEST-GF-9-5
     2151   INI-TEST-GF-9-6
     2170   INI-TEST-GF-9-7
     2189   INI-TEST-GF-9-8
     2208   INI-TEST-GF-9-9
      337   INI-WRITE-GF-1-1 . . . . . . .  G326 G331
      508   INI-WRITE-GF-1-10. . . . . . .  G497 G502
      356   INI-WRITE-GF-1-2 . . . . . . .  G345 G350
      375   INI-WRITE-GF-1-3 . . . . . . .  G364 G369
      394   INI-WRITE-GF-1-4 . . . . . . .  G383 G388
      413   INI-WRITE-GF-1-5 . . . . . . .  G402 G407
      432   INI-WRITE-GF-1-6 . . . . . . .  G421 G426
      451   INI-WRITE-GF-1-7 . . . . . . .  G440 G445
      470   INI-WRITE-GF-1-8 . . . . . . .  G459 G464
      489   INI-WRITE-GF-1-9 . . . . . . .  G478 G483
      539   INI-WRITE-GF-2-1 . . . . . . .  G528 G533
      718   INI-WRITE-GF-2-10. . . . . . .  G706 G711
      558   INI-WRITE-GF-2-2 . . . . . . .  G547 G552
      578   INI-WRITE-GF-2-3 . . . . . . .  G566 G571
      598   INI-WRITE-GF-2-4 . . . . . . .  G586 G591
      618   INI-WRITE-GF-2-5 . . . . . . .  G606 G611
      638   INI-WRITE-GF-2-6 . . . . . . .  G626 G631
      658   INI-WRITE-GF-2-7 . . . . . . .  G646 G651
      678   INI-WRITE-GF-2-8 . . . . . . .  G666 G671
      698   INI-WRITE-GF-2-9 . . . . . . .  G686 G691
      748   INI-WRITE-GF-3-1 . . . . . . .  G737 G742
      927   INI-WRITE-GF-3-10. . . . . . .  G915 G920
      767   INI-WRITE-GF-3-2 . . . . . . .  G756 G761
      787   INI-WRITE-GF-3-3 . . . . . . .  G775 G780
      807   INI-WRITE-GF-3-4 . . . . . . .  G795 G800
      827   INI-WRITE-GF-3-5 . . . . . . .  G815 G820
      847   INI-WRITE-GF-3-6 . . . . . . .  G835 G840
      867   INI-WRITE-GF-3-7 . . . . . . .  G855 G860
      887   INI-WRITE-GF-3-8 . . . . . . .  G875 G880
      907   INI-WRITE-GF-3-9 . . . . . . .  G895 G900
      957   INI-WRITE-GF-4-1 . . . . . . .  G946 G951
     1136   INI-WRITE-GF-4-10. . . . . . .  G1124 G1129
      976   INI-WRITE-GF-4-2 . . . . . . .  G965 G970
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    54
0 Defined   Cross-reference of procedures   References

0     996   INI-WRITE-GF-4-3 . . . . . . .  G984 G989
     1016   INI-WRITE-GF-4-4 . . . . . . .  G1004 G1009
     1036   INI-WRITE-GF-4-5 . . . . . . .  G1024 G1029
     1056   INI-WRITE-GF-4-6 . . . . . . .  G1044 G1049
     1076   INI-WRITE-GF-4-7 . . . . . . .  G1064 G1069
     1096   INI-WRITE-GF-4-8 . . . . . . .  G1084 G1089
     1116   INI-WRITE-GF-4-9 . . . . . . .  G1104 G1109
     1166   INI-WRITE-GF-5-1 . . . . . . .  G1155 G1160
     1345   INI-WRITE-GF-5-10. . . . . . .  G1333 G1338
     1185   INI-WRITE-GF-5-2 . . . . . . .  G1174 G1179
     1205   INI-WRITE-GF-5-3 . . . . . . .  G1193 G1198
     1225   INI-WRITE-GF-5-4 . . . . . . .  G1213 G1218
     1245   INI-WRITE-GF-5-5 . . . . . . .  G1233 G1238
     1265   INI-WRITE-GF-5-6 . . . . . . .  G1253 G1258
     1285   INI-WRITE-GF-5-7 . . . . . . .  G1273 G1278
     1305   INI-WRITE-GF-5-8 . . . . . . .  G1293 G1298
     1325   INI-WRITE-GF-5-9 . . . . . . .  G1313 G1318
     1375   INI-WRITE-GF-6-1 . . . . . . .  G1364 G1369
     1553   INI-WRITE-GF-6-10. . . . . . .  G1541 G1546
     1394   INI-WRITE-GF-6-2 . . . . . . .  G1383 G1388
     1414   INI-WRITE-GF-6-3 . . . . . . .  G1402 G1407
     1434   INI-WRITE-GF-6-4 . . . . . . .  G1422 G1427
     1454   INI-WRITE-GF-6-5 . . . . . . .  G1442 G1447
     1474   INI-WRITE-GF-6-6 . . . . . . .  G1462 G1467
     1494   INI-WRITE-GF-6-7 . . . . . . .  G1482 G1487
     1514   INI-WRITE-GF-6-8 . . . . . . .  G1502 G1507
     1533   INI-WRITE-GF-6-9 . . . . . . .  G1522 G1527
     1598   INI-WRITE-GF-7-1 . . . . . . .  G1587 G1592
     1777   INI-WRITE-GF-7-10. . . . . . .  G1765 G1770
     1617   INI-WRITE-GF-7-2 . . . . . . .  G1606 G1611
     1637   INI-WRITE-GF-7-3 . . . . . . .  G1625 G1630
     1657   INI-WRITE-GF-7-4 . . . . . . .  G1645 G1650
     1677   INI-WRITE-GF-7-5 . . . . . . .  G1665 G1670
     1697   INI-WRITE-GF-7-6 . . . . . . .  G1685 G1690
     1717   INI-WRITE-GF-7-7 . . . . . . .  G1705 G1710
     1737   INI-WRITE-GF-7-8 . . . . . . .  G1725 G1730
     1757   INI-WRITE-GF-7-9 . . . . . . .  G1745 G1750
     1812   INI-WRITE-GF-8-1 . . . . . . .  G1801 G1806
     1983   INI-WRITE-GF-8-10. . . . . . .  G1972 G1977
     2002   INI-WRITE-GF-8-11. . . . . . .  G1991 G1996
     2021   INI-WRITE-GF-8-12. . . . . . .  G2010 G2015
     1831   INI-WRITE-GF-8-2 . . . . . . .  G1820 G1825
     1850   INI-WRITE-GF-8-3 . . . . . . .  G1839 G1844
     1869   INI-WRITE-GF-8-4 . . . . . . .  G1858 G1863
     1888   INI-WRITE-GF-8-5 . . . . . . .  G1877 G1882
     1907   INI-WRITE-GF-8-6 . . . . . . .  G1896 G1901
     1926   INI-WRITE-GF-8-7 . . . . . . .  G1915 G1920
     1945   INI-WRITE-GF-8-8 . . . . . . .  G1934 G1939
     1964   INI-WRITE-GF-8-9 . . . . . . .  G1953 G1958
     2072   INI-WRITE-GF-9-1 . . . . . . .  G2061 G2066
     2243   INI-WRITE-GF-9-10. . . . . . .  G2232 G2237
     2262   INI-WRITE-GF-9-11. . . . . . .  G2251 G2256
     2281   INI-WRITE-GF-9-12. . . . . . .  G2270 G2275
     2091   INI-WRITE-GF-9-2 . . . . . . .  G2080 G2085
     2110   INI-WRITE-GF-9-3 . . . . . . .  G2099 G2104
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    55
0 Defined   Cross-reference of procedures   References

0    2129   INI-WRITE-GF-9-4 . . . . . . .  G2118 G2123
     2148   INI-WRITE-GF-9-5 . . . . . . .  G2137 G2142
     2167   INI-WRITE-GF-9-6 . . . . . . .  G2156 G2161
     2186   INI-WRITE-GF-9-7 . . . . . . .  G2175 G2180
     2205   INI-WRITE-GF-9-8 . . . . . . .  G2194 G2199
     2224   INI-WRITE-GF-9-9 . . . . . . .  G2213 G2218
      207   INSPT
      195   OPEN-FILES
      208   PASS . . . . . . . . . . . . .  P325 P344 P363 P382 P401 P420 P439 P458 P477 P496 P527 P546 P565 P585 P605 P625
                                            P645 P665 P685 P705 P736 P755 P774 P794 P814 P834 P854 P874 P894 P914 P945 P964
                                            P983 P1003 P1023 P1043 P1063 P1083 P1103 P1123 P1154 P1173 P1192 P1212 P1232
                                            P1252 P1272 P1292 P1312 P1332 P1363 P1382 P1401 P1421 P1441 P1461 P1481 P1501
                                            P1521 P1540 P1586 P1605 P1624 P1644 P1664 P1684 P1704 P1724 P1744 P1764 P1800
                                            P1819 P1838 P1857 P1876 P1895 P1914 P1933 P1952 P1971 P1990 P2009 P2060 P2079
                                            P2098 P2117 P2136 P2155 P2174 P2193 P2212 P2231 P2250 P2269
      212   PRINT-DETAIL . . . . . . . . .  P320 P338 P357 P376 P395 P414 P433 P452 P471 P490 P509 P521 P540 P559 P579 P599
                                            P619 P639 P659 P679 P699 P719 P731 P749 P768 P788 P808 P828 P848 P868 P888 P908
                                            P928 P940 P958 P977 P997 P1017 P1037 P1057 P1077 P1097 P1117 P1137 P1149 P1167
                                            P1186 P1206 P1226 P1246 P1266 P1286 P1306 P1326 P1346 P1358 P1376 P1395 P1415
                                            P1435 P1455 P1475 P1495 P1515 P1534 P1554 P1581 P1599 P1618 P1638 P1658 P1678
                                            P1698 P1718 P1738 P1758 P1778 P1795 P1813 P1832 P1851 P1870 P1889 P1908 P1927
                                            P1946 P1965 P1984 P2003 P2022 P2055 P2073 P2092 P2111 P2130 P2149 P2168 P2187
                                            P2206 P2225 P2244 P2263 P2282
      309   SECT-NC223A-001
      205   TERMINATE-CALL
      203   TERMINATE-CCVS
      267   WRITE-LINE . . . . . . . . . .  P216 P217 P225 P226 P227 P228 P230 P231 P232 P234 P236 P246 P254 P260 P265 P266
                                            P289 P293 P295 P304
      279   WRT-LN . . . . . . . . . . . .  P273 P274 P275 P278 P283
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    56
0 Defined   Cross-reference of programs     References

        3   NC223A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC223A    Date 06/04/2022  Time 12:00:38   Page    57
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC223A:
 *    Source records = 2286
 *    Data Division statements = 77
 *    Procedure Division statements = 1437
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1444
0End of compilation 1,  program NC223A,  highest severity 0.
0Return code 0
