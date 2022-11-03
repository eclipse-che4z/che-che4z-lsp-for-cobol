1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:25   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:25   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2224.2
   000002         000200 PROGRAM-ID.                                                      NC2224.2
   000003         000300     NC222A.                                                      NC2224.2
   000004         000400*                                                              *  NC2224.2
   000005         000600*                                                              *  NC2224.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2224.2
   000007         000800*                                                              *  NC2224.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2224.2
   000009         001000*                                                              *  NC2224.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2224.2
   000011         001200*                                                              *  NC2224.2
   000012         001400*                                                              *  NC2224.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2224.2
   000014         001600*                                                              *  NC2224.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2224.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2224.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2224.2
   000018         002000*                                                              *  NC2224.2
   000019         002200*    PROGRAM NC222A TESTS THE USE OF INDEXED IDENTIFIERS WITH  *  NC2224.2
   000020         002300*    FORMAT 2 OF THE "ADD", "SUBTRACT" AND "MOVE" STATEMENTS.  *  NC2224.2
   000021         002400*    DE-EDITING BY USE OF THE "MOVE" STATEMENT IS ALSO TESTED. *  NC2224.2
   000022         002500*                                                              *  NC2224.2
   000023         002700 ENVIRONMENT DIVISION.                                            NC2224.2
   000024         002800 CONFIGURATION SECTION.                                           NC2224.2
   000025         002900 SOURCE-COMPUTER.                                                 NC2224.2
   000026         003000     XXXXX082.                                                    NC2224.2
   000027         003100 OBJECT-COMPUTER.                                                 NC2224.2
   000028         003200     XXXXX083.                                                    NC2224.2
   000029         003300 INPUT-OUTPUT SECTION.                                            NC2224.2
   000030         003400 FILE-CONTROL.                                                    NC2224.2
   000031         003500     SELECT PRINT-FILE ASSIGN TO                                  NC2224.2 35
   000032         003600     XXXXX055.                                                    NC2224.2
   000033         003700 DATA DIVISION.                                                   NC2224.2
   000034         003800 FILE SECTION.                                                    NC2224.2
   000035         003900 FD  PRINT-FILE.                                                  NC2224.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         004000 01  PRINT-REC PICTURE X(120).                                    NC2224.2
   000037         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC2224.2
   000038         004200 WORKING-STORAGE SECTION.                                         NC2224.2
   000039         004300 01  TABLE1.                                                      NC2224.2
   000040         004400     02  RECORD1                 PICTURE 99.                      NC2224.2
   000041         004500     02  RECORD2                 PICTURE 99                       NC2224.2
   000042         004600                                 OCCURS 2 TIMES                   NC2224.2
   000043         004700                                 INDEXED BY INDEX1.               NC2224.2
   000044         004800     02  RECORD3                 PICTURE 99.                      NC2224.2
   000045         004900 01  TABLE2.                                                      NC2224.2
   000046         005000     02  RECORD1                 PICTURE 99.                      NC2224.2
   000047         005100     02  RECORD2                 PICTURE 99                       NC2224.2
   000048         005200                                 OCCURS 2 TIMES                   NC2224.2
   000049         005300                                 INDEXED BY INDEX2.               NC2224.2
   000050         005400     02  RECORD3                 PICTURE 99.                      NC2224.2
   000051         005500 01  TABLE3.                                                      NC2224.2
   000052         005600     02  RECORD1                 PICTURE XX   VALUE "AA".         NC2224.2
   000053         005700     02  RECORD2                 PICTURE XX                       NC2224.2
   000054         005800                                 OCCURS 2 TIMES                   NC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                                 INDEXED BY INDEX3.               NC2224.2
   000056         006000     02  RECORD3                 PICTURE XX   VALUE "DD".         NC2224.2
   000057         006100 01  TABLE4.                                                      NC2224.2
   000058         006200     02  RECORD1                 PICTURE XX   VALUE "EE".         NC2224.2
   000059         006300     02  RECORD2                 PICTURE XX                       NC2224.2
   000060         006400                                 OCCURS 2 TIMES                   NC2224.2
   000061         006500                                 INDEXED BY INDEX4.               NC2224.2
   000062         006600     02  RECORD3                 PICTURE XX   VALUE "HH".         NC2224.2
   000063         006700 01  MOVE-TEST-3-A               PIC $(4)9.99CR.                  NC2224.2
   000064         006800 01  MOVE-TEST-3-B               PIC S9(4)V99.                    NC2224.2
   000065         006900 01  MOVE-TEST-4-A               PIC --9B.99B99/99.               NC2224.2
   000066         007000 01  MOVE-TEST-4-B               PIC S99V9(6).                    NC2224.2
   000067         007100 01  TEST-RESULTS.                                                NC2224.2
   000068         007200     02 FILLER                   PIC X      VALUE SPACE.          NC2224.2 IMP
   000069         007300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2224.2 IMP
   000070         007400     02 FILLER                   PIC X      VALUE SPACE.          NC2224.2 IMP
   000071         007500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2224.2 IMP
   000072         007600     02 FILLER                   PIC X      VALUE SPACE.          NC2224.2 IMP
   000073         007700     02  PAR-NAME.                                                NC2224.2
   000074         007800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2224.2 IMP
   000075         007900       03  PARDOT-X              PIC X      VALUE SPACE.          NC2224.2 IMP
   000076         008000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2224.2 IMP
   000077         008100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2224.2 IMP
   000078         008200     02 RE-MARK                  PIC X(61).                       NC2224.2
   000079         008300 01  TEST-COMPUTED.                                               NC2224.2
   000080         008400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2224.2 IMP
   000081         008500     02 FILLER                   PIC X(17)  VALUE                 NC2224.2
   000082         008600            "       COMPUTED=".                                   NC2224.2
   000083         008700     02 COMPUTED-X.                                               NC2224.2
   000084         008800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2224.2 IMP
   000085         008900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2224.2 84
   000086         009000                                 PIC -9(9).9(9).                  NC2224.2
   000087         009100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2224.2 84
   000088         009200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2224.2 84
   000089         009300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2224.2 84
   000090         009400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2224.2 84
   000091         009500         04 COMPUTED-18V0                    PIC -9(18).          NC2224.2
   000092         009600         04 FILLER                           PIC X.               NC2224.2
   000093         009700     03 FILLER PIC X(50) VALUE SPACE.                             NC2224.2 IMP
   000094         009800 01  TEST-CORRECT.                                                NC2224.2
   000095         009900     02 FILLER PIC X(30) VALUE SPACE.                             NC2224.2 IMP
   000096         010000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2224.2
   000097         010100     02 CORRECT-X.                                                NC2224.2
   000098         010200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2224.2 IMP
   000099         010300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2224.2 98
   000100         010400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2224.2 98
   000101         010500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2224.2 98
   000102         010600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2224.2 98
   000103         010700     03      CR-18V0 REDEFINES CORRECT-A.                         NC2224.2 98
   000104         010800         04 CORRECT-18V0                     PIC -9(18).          NC2224.2
   000105         010900         04 FILLER                           PIC X.               NC2224.2
   000106         011000     03 FILLER PIC X(2) VALUE SPACE.                              NC2224.2 IMP
   000107         011100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2224.2 IMP
   000108         011200 01  CCVS-C-1.                                                    NC2224.2
   000109         011300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2224.2
   000110         011400-    "SS  PARAGRAPH-NAME                                          NC2224.2
   000111         011500-    "       REMARKS".                                            NC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2224.2 IMP
   000113         011700 01  CCVS-C-2.                                                    NC2224.2
   000114         011800     02 FILLER                     PIC X        VALUE SPACE.      NC2224.2 IMP
   000115         011900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2224.2
   000116         012000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2224.2 IMP
   000117         012100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2224.2
   000118         012200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2224.2 IMP
   000119         012300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2224.2 IMP
   000120         012400 01  REC-CT                        PIC 99       VALUE ZERO.       NC2224.2 IMP
   000121         012500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2224.2 IMP
   000122         012600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2224.2 IMP
   000123         012700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2224.2 IMP
   000124         012800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2224.2 IMP
   000125         012900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2224.2 IMP
   000126         013000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2224.2 IMP
   000127         013100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2224.2 IMP
   000128         013200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2224.2 IMP
   000129         013300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2224.2 IMP
   000130         013400 01  CCVS-H-1.                                                    NC2224.2
   000131         013500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2224.2 IMP
   000132         013600     02  FILLER                    PIC X(42)    VALUE             NC2224.2
   000133         013700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2224.2
   000134         013800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2224.2 IMP
   000135         013900 01  CCVS-H-2A.                                                   NC2224.2
   000136         014000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2224.2 IMP
   000137         014100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2224.2
   000138         014200   02  FILLER                        PIC XXXX   VALUE             NC2224.2
   000139         014300     "4.2 ".                                                      NC2224.2
   000140         014400   02  FILLER                        PIC X(28)  VALUE             NC2224.2
   000141         014500            " COPY - NOT FOR DISTRIBUTION".                       NC2224.2
   000142         014600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2224.2 IMP
   000143         014700                                                                  NC2224.2
   000144         014800 01  CCVS-H-2B.                                                   NC2224.2
   000145         014900   02  FILLER                        PIC X(15)  VALUE             NC2224.2
   000146         015000            "TEST RESULT OF ".                                    NC2224.2
   000147         015100   02  TEST-ID                       PIC X(9).                    NC2224.2
   000148         015200   02  FILLER                        PIC X(4)   VALUE             NC2224.2
   000149         015300            " IN ".                                               NC2224.2
   000150         015400   02  FILLER                        PIC X(12)  VALUE             NC2224.2
   000151         015500     " HIGH       ".                                              NC2224.2
   000152         015600   02  FILLER                        PIC X(22)  VALUE             NC2224.2
   000153         015700            " LEVEL VALIDATION FOR ".                             NC2224.2
   000154         015800   02  FILLER                        PIC X(58)  VALUE             NC2224.2
   000155         015900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2224.2
   000156         016000 01  CCVS-H-3.                                                    NC2224.2
   000157         016100     02  FILLER                      PIC X(34)  VALUE             NC2224.2
   000158         016200            " FOR OFFICIAL USE ONLY    ".                         NC2224.2
   000159         016300     02  FILLER                      PIC X(58)  VALUE             NC2224.2
   000160         016400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2224.2
   000161         016500     02  FILLER                      PIC X(28)  VALUE             NC2224.2
   000162         016600            "  COPYRIGHT   1985 ".                                NC2224.2
   000163         016700 01  CCVS-E-1.                                                    NC2224.2
   000164         016800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2224.2 IMP
   000165         016900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2224.2
   000166         017000     02 ID-AGAIN                     PIC X(9).                    NC2224.2
   000167         017100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2224.2 IMP
   000168         017200 01  CCVS-E-2.                                                    NC2224.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2224.2 IMP
   000170         017400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2224.2 IMP
   000171         017500     02 CCVS-E-2-2.                                               NC2224.2
   000172         017600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2224.2 IMP
   000173         017700         03 FILLER                   PIC X      VALUE SPACE.      NC2224.2 IMP
   000174         017800         03 ENDER-DESC               PIC X(44)  VALUE             NC2224.2
   000175         017900            "ERRORS ENCOUNTERED".                                 NC2224.2
   000176         018000 01  CCVS-E-3.                                                    NC2224.2
   000177         018100     02  FILLER                      PIC X(22)  VALUE             NC2224.2
   000178         018200            " FOR OFFICIAL USE ONLY".                             NC2224.2
   000179         018300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2224.2 IMP
   000180         018400     02  FILLER                      PIC X(58)  VALUE             NC2224.2
   000181         018500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2224.2
   000182         018600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2224.2 IMP
   000183         018700     02 FILLER                       PIC X(15)  VALUE             NC2224.2
   000184         018800             " COPYRIGHT 1985".                                   NC2224.2
   000185         018900 01  CCVS-E-4.                                                    NC2224.2
   000186         019000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2224.2 IMP
   000187         019100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2224.2
   000188         019200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2224.2 IMP
   000189         019300     02 FILLER                       PIC X(40)  VALUE             NC2224.2
   000190         019400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2224.2
   000191         019500 01  XXINFO.                                                      NC2224.2
   000192         019600     02 FILLER                       PIC X(19)  VALUE             NC2224.2
   000193         019700            "*** INFORMATION ***".                                NC2224.2
   000194         019800     02 INFO-TEXT.                                                NC2224.2
   000195         019900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2224.2 IMP
   000196         020000       04 XXCOMPUTED                 PIC X(20).                   NC2224.2
   000197         020100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2224.2 IMP
   000198         020200       04 XXCORRECT                  PIC X(20).                   NC2224.2
   000199         020300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2224.2
   000200         020400 01  HYPHEN-LINE.                                                 NC2224.2
   000201         020500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2224.2 IMP
   000202         020600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2224.2
   000203         020700-    "*****************************************".                 NC2224.2
   000204         020800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2224.2
   000205         020900-    "******************************".                            NC2224.2
   000206         021000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2224.2
   000207         021100     "NC222A".                                                    NC2224.2
   000208         021200 PROCEDURE DIVISION.                                              NC2224.2
   000209         021300 CCVS1 SECTION.                                                   NC2224.2
   000210         021400 OPEN-FILES.                                                      NC2224.2
   000211         021500     OPEN     OUTPUT PRINT-FILE.                                  NC2224.2 35
   000212         021600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2224.2 206 147 206 166
   000213         021700     MOVE    SPACE TO TEST-RESULTS.                               NC2224.2 IMP 67
   000214         021800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2224.2 239 244
   000215         021900     GO TO CCVS1-EXIT.                                            NC2224.2 321
   000216         022000 CLOSE-FILES.                                                     NC2224.2
   000217         022100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2224.2 248 269 35
   000218         022200 TERMINATE-CCVS.                                                  NC2224.2
   000219         022300     EXIT PROGRAM.                                                NC2224.2
   000220         022400 TERMINATE-CALL.                                                  NC2224.2
   000221         022500     STOP     RUN.                                                NC2224.2
   000222         022600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2224.2 71 123
   000223         022700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2224.2 71 124
   000224         022800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2224.2 71 122
   000225         022900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2224.2 71 121
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2224.2 78
   000227         023100 PRINT-DETAIL.                                                    NC2224.2
   000228         023200     IF REC-CT NOT EQUAL TO ZERO                                  NC2224.2 120 IMP
   000229      1  023300             MOVE "." TO PARDOT-X                                 NC2224.2 75
   000230      1  023400             MOVE REC-CT TO DOTVALUE.                             NC2224.2 120 76
   000231         023500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2224.2 67 36 281
   000232         023600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2224.2 71 281
   000233      1  023700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2224.2 298 311
   000234      1  023800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2224.2 312 320
   000235         023900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2224.2 IMP 71 IMP 83
   000236         024000     MOVE SPACE TO CORRECT-X.                                     NC2224.2 IMP 97
   000237         024100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2224.2 120 IMP IMP 73
   000238         024200     MOVE     SPACE TO RE-MARK.                                   NC2224.2 IMP 78
   000239         024300 HEAD-ROUTINE.                                                    NC2224.2
   000240         024400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2224.2 130 37 281
   000241         024500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2224.2 135 37 281
   000242         024600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2224.2 144 37 281
   000243         024700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2224.2 156 37 281
   000244         024800 COLUMN-NAMES-ROUTINE.                                            NC2224.2
   000245         024900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2224.2 108 37 281
   000246         025000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2224.2 113 37 281
   000247         025100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2224.2 200 37 281
   000248         025200 END-ROUTINE.                                                     NC2224.2
   000249         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2224.2 200 37 281
   000250         025400 END-RTN-EXIT.                                                    NC2224.2
   000251         025500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2224.2 163 37 281
   000252         025600 END-ROUTINE-1.                                                   NC2224.2
   000253         025700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2224.2 122 126 123
   000254         025800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2224.2 126 121 126
   000255         025900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2224.2 124 126
   000256         026000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2224.2
   000257         026100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2224.2 124 186
   000258         026200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2224.2 126 188
   000259         026300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2224.2 185 171
   000260         026400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2224.2 168 37 281
   000261         026500  END-ROUTINE-12.                                                 NC2224.2
   000262         026600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2224.2 174
   000263         026700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2224.2 122 IMP
   000264      1  026800         MOVE "NO " TO ERROR-TOTAL                                NC2224.2 172
   000265         026900         ELSE                                                     NC2224.2
   000266      1  027000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2224.2 122 172
   000267         027100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2224.2 168 37
   000268         027200     PERFORM WRITE-LINE.                                          NC2224.2 281
   000269         027300 END-ROUTINE-13.                                                  NC2224.2
   000270         027400     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2224.2 121 IMP
   000271      1  027500         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2224.2 172
   000272      1  027600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2224.2 121 172
   000273         027700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2224.2 174
   000274         027800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2224.2 168 37 281
   000275         027900      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2224.2 123 IMP
   000276      1  028000          MOVE "NO " TO ERROR-TOTAL                               NC2224.2 172
   000277      1  028100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2224.2 123 172
   000278         028200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2224.2 174
   000279         028300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2224.2 168 37 281
   000280         028400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2224.2 176 37 281
   000281         028500 WRITE-LINE.                                                      NC2224.2
   000282         028600     ADD 1 TO RECORD-COUNT.                                       NC2224.2 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     IF RECORD-COUNT GREATER 50                                   NC2224.2 128
   000284      1  028800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2224.2 37 127
   000285      1  028900         MOVE SPACE TO DUMMY-RECORD                               NC2224.2 IMP 37
   000286      1  029000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2224.2 37
   000287      1  029100         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2224.2 108 37 293
   000288      1  029200         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2224.2 113 37 293
   000289      1  029300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2224.2 200 37 293
   000290      1  029400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2224.2 127 37
   000291      1  029500         MOVE ZERO TO RECORD-COUNT.                               NC2224.2 IMP 128
   000292         029600     PERFORM WRT-LN.                                              NC2224.2 293
   000293         029700 WRT-LN.                                                          NC2224.2
   000294         029800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2224.2 37
   000295         029900     MOVE SPACE TO DUMMY-RECORD.                                  NC2224.2 IMP 37
   000296         030000 BLANK-LINE-PRINT.                                                NC2224.2
   000297         030100     PERFORM WRT-LN.                                              NC2224.2 293
   000298         030200 FAIL-ROUTINE.                                                    NC2224.2
   000299         030300     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2224.2 83 IMP 306
   000300         030400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2224.2 97 IMP 306
   000301         030500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2224.2 129 199
   000302         030600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2224.2 194
   000303         030700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2224.2 191 37 281
   000304         030800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2224.2 IMP 199
   000305         030900     GO TO  FAIL-ROUTINE-EX.                                      NC2224.2 311
   000306         031000 FAIL-ROUTINE-WRITE.                                              NC2224.2
   000307         031100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2224.2 79 36 281
   000308         031200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2224.2 129 107
   000309         031300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2224.2 94 36 281
   000310         031400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2224.2 IMP 107
   000311         031500 FAIL-ROUTINE-EX. EXIT.                                           NC2224.2
   000312         031600 BAIL-OUT.                                                        NC2224.2
   000313         031700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2224.2 84 IMP 315
   000314         031800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2224.2 98 IMP 320
   000315         031900 BAIL-OUT-WRITE.                                                  NC2224.2
   000316         032000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2224.2 98 198 84 196
   000317         032100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2224.2 129 199
   000318         032200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2224.2 191 37 281
   000319         032300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2224.2 IMP 199
   000320         032400 BAIL-OUT-EX. EXIT.                                               NC2224.2
   000321         032500 CCVS1-EXIT.                                                      NC2224.2
   000322         032600     EXIT.                                                        NC2224.2
   000323         032700 INITIALISE-TABLE1.                                               NC2224.2
   000324         032800     MOVE 06 TO RECORD1 OF TABLE1.                                NC2224.2 40 39
   000325         032900     MOVE 01 TO RECORD2 OF TABLE1 (1).                            NC2224.2 41 39
   000326         033000     MOVE 02 TO RECORD2 OF TABLE1 (2).                            NC2224.2 41 39
   000327         033100     MOVE 07 TO RECORD3 OF TABLE1.                                NC2224.2 44 39
   000328         033200 INITIALISE-TABLE2.                                               NC2224.2
   000329         033300     MOVE 08 TO RECORD1 OF TABLE2.                                NC2224.2 46 45
   000330         033400     MOVE 03 TO RECORD2 OF TABLE2 (1).                            NC2224.2 47 45
   000331         033500     MOVE 04 TO RECORD2 OF TABLE2 (2).                            NC2224.2 47 45
   000332         033600     MOVE 09 TO RECORD3 OF TABLE2.                                NC2224.2 50 45
   000333         033700*                                                                 NC2224.2
   000334         033800 ADD-INIT-F2-1.                                                   NC2224.2
   000335         033900     MOVE   "ADD-TEST-F2-1" TO PAR-NAME.                          NC2224.2 73
   000336         034000     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC2224.2 129
   000337         034100     MOVE "ADD - QUALIFICATION" TO FEATURE.                       NC2224.2 69
   000338         034200     PERFORM INITIALISE-TABLE1.                                   NC2224.2 323
   000339         034300     PERFORM INITIALISE-TABLE2.                                   NC2224.2 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     SET INDEX1 TO 1.                                             NC2224.2 43
   000341         034500     SET INDEX2 TO 1.                                             NC2224.2 49
   000342         034600 ADD-TEST-F2-1.                                                   NC2224.2
   000343         034700     ADD RECORD2 OF TABLE1 (INDEX1) TO RECORD2 OF TABLE2 (INDEX2).NC2224.2 41 39 43 47 45 49
   000344         034800     IF      RECORD2 OF TABLE2 (1) = 04                           NC2224.2 47 45
   000345         034900         AND RECORD2 OF TABLE2 (2) = 04                           NC2224.2 47 45
   000346         035000         AND RECORD1 OF TABLE2 = 08                               NC2224.2 46 45
   000347         035100         AND RECORD3 OF TABLE2 = 09                               NC2224.2 50 45
   000348      1  035200             PERFORM PASS                                         NC2224.2 223
   000349         035300     ELSE                                                         NC2224.2
   000350      1  035400             GO TO   ADD-FAIL-F2-1.                               NC2224.2 355
   000351         035500     GO TO   ADD-WRITE-F2-1.                                      NC2224.2 359
   000352         035600 ADD-DELETE-F2-1.                                                 NC2224.2
   000353         035700     PERFORM DE-LETE.                                             NC2224.2 225
   000354         035800     GO TO   ADD-WRITE-F2-1.                                      NC2224.2 359
   000355         035900 ADD-FAIL-F2-1.                                                   NC2224.2
   000356         036000     PERFORM FAIL.                                                NC2224.2 224
   000357         036100     MOVE    TABLE2 TO COMPUTED-A.                                NC2224.2 45 84
   000358         036200     MOVE   "08040409" TO CORRECT-A.                              NC2224.2 98
   000359         036300 ADD-WRITE-F2-1.                                                  NC2224.2
   000360         036400     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000361         036500                                                                  NC2224.2
   000362         036600 SUBTRACT-INIT-F2-1.                                              NC2224.2
   000363         036700     MOVE "SUBTRACT-TEST-F2-1" TO PAR-NAME.                       NC2224.2 73
   000364         036800     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC2224.2 129
   000365         036900     MOVE   "SUBTRACT - QUAL." TO FEATURE.                        NC2224.2 69
   000366         037000     PERFORM INITIALISE-TABLE1.                                   NC2224.2 323
   000367         037100     PERFORM INITIALISE-TABLE2.                                   NC2224.2 328
   000368         037200     SET     INDEX1 TO 1.                                         NC2224.2 43
   000369         037300     SET     INDEX2 TO 1.                                         NC2224.2 49
   000370         037400 SUBTRACT-TEST-F2-1-0.                                            NC2224.2
   000371         037500     SUBTRACT RECORD2 OF TABLE1 (INDEX1)                          NC2224.2 41 39 43
   000372         037600         FROM RECORD2 OF TABLE2 (INDEX2).                         NC2224.2 47 45 49
   000373         037700 SUBTRACT-TEST-F2-1-1.                                            NC2224.2
   000374         037800     IF      RECORD2 OF TABLE2 (1) = 02                           NC2224.2 47 45
   000375         037900         AND RECORD2 OF TABLE2 (2) = 04                           NC2224.2 47 45
   000376         038000         AND RECORD1 OF TABLE2 = 08                               NC2224.2 46 45
   000377         038100         AND RECORD3 OF TABLE2 = 09                               NC2224.2 50 45
   000378      1  038200             PERFORM PASS                                         NC2224.2 223
   000379         038300     ELSE                                                         NC2224.2
   000380      1  038400             GO TO   SUBTRACT-FAIL-F2-1.                          NC2224.2 385
   000381         038500     GO TO   SUBTRACT-WRITE-F2-1.                                 NC2224.2 389
   000382         038600 SUBTRACT-DELETE-F2-1.                                            NC2224.2
   000383         038700     PERFORM DE-LETE.                                             NC2224.2 225
   000384         038800     GO TO SUBTRACT-WRITE-F2-1.                                   NC2224.2 389
   000385         038900 SUBTRACT-FAIL-F2-1.                                              NC2224.2
   000386         039000     PERFORM FAIL.                                                NC2224.2 224
   000387         039100     MOVE TABLE2 TO COMPUTED-A.                                   NC2224.2 45 84
   000388         039200     MOVE "08020409" TO CORRECT-A.                                NC2224.2 98
   000389         039300 SUBTRACT-WRITE-F2-1.                                             NC2224.2
   000390         039400     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000391         039500*                                                                 NC2224.2
   000392         039600 MOV-INIT-F2-1.                                                   NC2224.2
   000393         039700     MOVE "MOV-TEST-F2-1" TO PAR-NAME.                            NC2224.2 73
   000394         039800     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC2224.2 129
   000395         039900     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2224.2 69
   000396         040000     PERFORM INITIALISE-TABLE1.                                   NC2224.2 323
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     PERFORM INITIALISE-TABLE2.                                   NC2224.2 328
   000398         040200 MOV-TEST-F2-1.                                                   NC2224.2
   000399         040300     MOVE CORRESPONDING TABLE1 TO TABLE2.                         NC2224.2 39 45

 ==000399==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "RECORD2" within
                         "TABLE1" did not qualify according to the rules for the "CORRESPONDING"
                         phrase.  Subordinate item "RECORD2" was ignored.

   000400         040400     IF RECORD1 OF TABLE2 = 06 AND                                NC2224.2 46 45
   000401         040500        RECORD2 OF TABLE2 (1) = 03 AND                            NC2224.2 47 45
   000402         040600        RECORD2 OF TABLE2 (2) = 04 AND                            NC2224.2 47 45
   000403         040700        RECORD3 OF TABLE2 = 07                                    NC2224.2 50 45
   000404      1  040800        PERFORM PASS                                              NC2224.2 223
   000405      1  040900        ELSE GO TO MOV-FAIL-F2-1.                                 NC2224.2 410
   000406         041000     GO TO MOV-WRITE-F2-1.                                        NC2224.2 414
   000407         041100 MOV-DELETE-F2-1.                                                 NC2224.2
   000408         041200     PERFORM DE-LETE.                                             NC2224.2 225
   000409         041300     GO TO MOV-WRITE-F2-1.                                        NC2224.2 414
   000410         041400 MOV-FAIL-F2-1.                                                   NC2224.2
   000411         041500     PERFORM FAIL.                                                NC2224.2 224
   000412         041600     MOVE TABLE2 TO COMPUTED-A.                                   NC2224.2 45 84
   000413         041700     MOVE "06030407" TO CORRECT-A.                                NC2224.2 98
   000414         041800 MOV-WRITE-F2-1.                                                  NC2224.2
   000415         041900     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000416         042000*                                                                 NC2224.2
   000417         042100 INITIALISE-TABLE3.                                               NC2224.2
   000418         042200     MOVE "BB" TO RECORD2 OF TABLE3 (1).                          NC2224.2 53 51
   000419         042300     MOVE "CC" TO RECORD2 OF TABLE3 (2).                          NC2224.2 53 51
   000420         042400 INITIALISE-TABLE4.                                               NC2224.2
   000421         042500     MOVE "FF" TO RECORD2 OF TABLE4 (1).                          NC2224.2 59 57
   000422         042600     MOVE "GG" TO RECORD2 OF TABLE4 (2).                          NC2224.2 59 57
   000423         042700*                                                                 NC2224.2
   000424         042800 MOV-INIT-F2-2.                                                   NC2224.2
   000425         042900     MOVE "MOV-TEST-F2-2" TO PAR-NAME.                            NC2224.2 73
   000426         043000     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC2224.2 129
   000427         043100     MOVE "MOVE CORRESPONDING" TO FEATURE.                        NC2224.2 69
   000428         043200 MOV-TEST-F2-2.                                                   NC2224.2
   000429         043300     MOVE CORRESPONDING TABLE3 TO TABLE4.                         NC2224.2 51 57

 ==000429==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "RECORD2" within
                         "TABLE3" did not qualify according to the rules for the "CORRESPONDING"
                         phrase.  Subordinate item "RECORD2" was ignored.

   000430         043400     IF RECORD1 OF TABLE4 = "AA" AND                              NC2224.2 58 57
   000431         043500        RECORD2 OF TABLE4 (1) = "FF" AND                          NC2224.2 59 57
   000432         043600        RECORD2 OF TABLE4 (2) = "GG" AND                          NC2224.2 59 57
   000433         043700        RECORD3 OF TABLE4 = "DD"                                  NC2224.2 62 57
   000434      1  043800        PERFORM PASS                                              NC2224.2 223
   000435      1  043900        ELSE GO TO MOV-FAIL-F2-2.                                 NC2224.2 440
   000436         044000     GO TO MOV-WRITE-F2-2.                                        NC2224.2 444
   000437         044100 MOV-DELETE-F2-2.                                                 NC2224.2
   000438         044200     PERFORM DE-LETE.                                             NC2224.2 225
   000439         044300     GO TO MOV-WRITE-F2-2.                                        NC2224.2 444
   000440         044400 MOV-FAIL-F2-2.                                                   NC2224.2
   000441         044500     PERFORM FAIL.                                                NC2224.2 224
   000442         044600     MOVE TABLE4 TO COMPUTED-A.                                   NC2224.2 57 84
   000443         044700     MOVE "AAFFGGDD" TO CORRECT-A.                                NC2224.2 98
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000444         044800 MOV-WRITE-F2-2.                                                  NC2224.2
   000445         044900     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000446         045000*                                                                 NC2224.2
   000447         045100 MOV-INIT-F2-3.                                                   NC2224.2
   000448         045200*    ===-->  DE-EDITING  <--===                                   NC2224.2
   000449         045300     MOVE   "VI-104 6.18.4 GR4(b)" TO ANSI-REFERENCE.             NC2224.2 129
   000450         045400     MOVE   -123.45 TO MOVE-TEST-3-A.                             NC2224.2 63
   000451         045500     MOVE    1 TO REC-CT.                                         NC2224.2 120
   000452         045600 MOV-TEST-F2-3-0.                                                 NC2224.2
   000453         045700     MOVE    MOVE-TEST-3-A TO MOVE-TEST-3-B.                      NC2224.2 63 64
   000454         045800     GO TO   MOV-TEST-F2-3-1.                                     NC2224.2 459
   000455         045900 MOV-DELETE-F2-3.                                                 NC2224.2
   000456         046000     PERFORM DE-LETE.                                             NC2224.2 225
   000457         046100     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000458         046200     GO TO MOV-INIT-F2-4.                                         NC2224.2 497
   000459         046300 MOV-TEST-F2-3-1.                                                 NC2224.2
   000460         046400     MOVE   "MOV-TEST-F2-3-1" TO PAR-NAME.                        NC2224.2 73
   000461         046500     IF      MOVE-TEST-3-B = -123.45                              NC2224.2 64
   000462      1  046600             PERFORM PASS                                         NC2224.2 223
   000463      1  046700             GO TO MOV-WRITE-F2-3-1                               NC2224.2 474
   000464         046800     ELSE                                                         NC2224.2
   000465      1  046900             GO TO MOV-FAIL-F2-3-1.                               NC2224.2 469
   000466         047000 MOV-DELETE-F2-3-1.                                               NC2224.2
   000467         047100     PERFORM DE-LETE.                                             NC2224.2 225
   000468         047200     GO TO MOV-WRITE-F2-3-1.                                      NC2224.2 474
   000469         047300 MOV-FAIL-F2-3-1.                                                 NC2224.2
   000470         047400     MOVE   -123.45 TO CORRECT-N                                  NC2224.2 99
   000471         047500     MOVE    MOVE-TEST-3-B TO COMPUTED-N                          NC2224.2 64 85
   000472         047600     MOVE   "DE-EDITING MOVE ERROR" TO RE-MARK                    NC2224.2 78
   000473         047700     PERFORM FAIL.                                                NC2224.2 224
   000474         047800 MOV-WRITE-F2-3-1.                                                NC2224.2
   000475         047900     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000476         048000*                                                                 NC2224.2
   000477         048100 MOV-INIT-F2-3-2.                                                 NC2224.2
   000478         048200     ADD     1 TO REC-CT.                                         NC2224.2 120
   000479         048300     MOVE   "MOV-TEST-F2-3-2" TO PAR-NAME.                        NC2224.2 73
   000480         048400 MOV-TEST-F2-3-2.                                                 NC2224.2
   000481         048500     IF      MOVE-TEST-3-A = " $123.45CR"                         NC2224.2 63
   000482      1  048600             PERFORM PASS                                         NC2224.2 223
   000483      1  048700             GO TO MOV-WRITE-F2-3-2                               NC2224.2 494
   000484         048800     ELSE                                                         NC2224.2
   000485      1  048900             GO TO MOV-FAIL-F2-3-2.                               NC2224.2 489
   000486         049000 MOV-DELETE-F2-3-2.                                               NC2224.2
   000487         049100     PERFORM DE-LETE.                                             NC2224.2 225
   000488         049200     GO TO MOV-WRITE-F2-3-2.                                      NC2224.2 494
   000489         049300 MOV-FAIL-F2-3-2.                                                 NC2224.2
   000490         049400     MOVE   " $123.45" TO CORRECT-X                               NC2224.2 97
   000491         049500     MOVE    MOVE-TEST-3-A TO COMPUTED-X                          NC2224.2 63 83
   000492         049600     MOVE   "EDITED DATA MOVE ERROR" TO RE-MARK                   NC2224.2 78
   000493         049700     PERFORM FAIL.                                                NC2224.2 224
   000494         049800 MOV-WRITE-F2-3-2.                                                NC2224.2
   000495         049900     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000496         050000*                                                                 NC2224.2
   000497         050100 MOV-INIT-F2-4.                                                   NC2224.2
   000498         050200*    ===-->  DE-EDITING  <--===                                   NC2224.2
   000499         050300     MOVE   "VI-104 6.18.4 GR4(b)" TO ANSI-REFERENCE.             NC2224.2 129
   000500         050400     MOVE   -42.9876 TO MOVE-TEST-4-A.                            NC2224.2 65
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000501         050500     MOVE    1 TO REC-CT.                                         NC2224.2 120
   000502         050600 MOV-TEST-F2-4-0.                                                 NC2224.2
   000503         050700     MOVE    MOVE-TEST-4-A TO MOVE-TEST-4-B.                      NC2224.2 65 66
   000504         050800     GO TO MOV-TEST-F2-4-1.                                       NC2224.2 509
   000505         050900 MOV-DELETE-F2-4.                                                 NC2224.2
   000506         051000     PERFORM DE-LETE.                                             NC2224.2 225
   000507         051100     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000508         051200     GO TO CCVS-999999.                                           NC2224.2 547
   000509         051300 MOV-TEST-F2-4-1.                                                 NC2224.2
   000510         051400     MOVE   "MOV-TEST-F2-4-1" TO PAR-NAME.                        NC2224.2 73
   000511         051500     IF      MOVE-TEST-4-B = -42.987600                           NC2224.2 66
   000512      1  051600             PERFORM PASS                                         NC2224.2 223
   000513      1  051700             GO TO MOV-WRITE-F2-4-1                               NC2224.2 524
   000514         051800     ELSE                                                         NC2224.2
   000515      1  051900             GO TO MOV-FAIL-F2-4-1.                               NC2224.2 519
   000516         052000 MOV-DELETE-F2-4-1.                                               NC2224.2
   000517         052100     PERFORM DE-LETE.                                             NC2224.2 225
   000518         052200     GO TO MOV-WRITE-F2-4-1.                                      NC2224.2 524
   000519         052300 MOV-FAIL-F2-4-1.                                                 NC2224.2
   000520         052400     MOVE   -42.987600 TO CORRECT-N                               NC2224.2 99
   000521         052500     MOVE    MOVE-TEST-4-B TO COMPUTED-N                          NC2224.2 66 85
   000522         052600     MOVE   "DE-EDITING MOVE ERROR" TO RE-MARK                    NC2224.2 78
   000523         052700     PERFORM FAIL.                                                NC2224.2 224
   000524         052800 MOV-WRITE-F2-4-1.                                                NC2224.2
   000525         052900     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000526         053000*                                                                 NC2224.2
   000527         053100 MOV-TEST-F2-4-2.                                                 NC2224.2
   000528         053200     ADD     1 TO REC-CT.                                         NC2224.2 120
   000529         053300     MOVE   "MOV-TEST-F2-4-2" TO PAR-NAME.                        NC2224.2 73
   000530         053400     IF      MOVE-TEST-4-A = "-42 .98 76/00"                      NC2224.2 65
   000531      1  053500             PERFORM PASS                                         NC2224.2 223
   000532      1  053600             GO TO MOV-WRITE-F2-4-2                               NC2224.2 543
   000533         053700     ELSE                                                         NC2224.2
   000534      1  053800             GO TO MOV-FAIL-F2-4-2.                               NC2224.2 538
   000535         053900 MOV-DELETE-F2-4-2.                                               NC2224.2
   000536         054000     PERFORM DE-LETE.                                             NC2224.2 225
   000537         054100     GO TO MOV-WRITE-F2-4-2.                                      NC2224.2 543
   000538         054200 MOV-FAIL-F2-4-2.                                                 NC2224.2
   000539         054300     MOVE   "-42 .98 76/00" TO CORRECT-X                          NC2224.2 97
   000540         054400     MOVE    MOVE-TEST-4-A TO COMPUTED-X                          NC2224.2 65 83
   000541         054500     MOVE   "EDITED DATA MOVE ERROR" TO RE-MARK                   NC2224.2 78
   000542         054600     PERFORM FAIL.                                                NC2224.2 224
   000543         054700 MOV-WRITE-F2-4-2.                                                NC2224.2
   000544         054800     PERFORM PRINT-DETAIL.                                        NC2224.2 227
   000545         054900*                                                                 NC2224.2
   000546         055000 CCVS-EXIT SECTION.                                               NC2224.2
   000547         055100 CCVS-999999.                                                     NC2224.2
   000548         055200     GO TO CLOSE-FILES.                                           NC2224.2 216
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      129   ANSI-REFERENCE . . . . . . . .  301 308 317 M336 M364 M394 M426 M449 M499
      108   CCVS-C-1 . . . . . . . . . . .  245 287
      113   CCVS-C-2 . . . . . . . . . . .  246 288
      163   CCVS-E-1 . . . . . . . . . . .  251
      168   CCVS-E-2 . . . . . . . . . . .  260 267 274 279
      171   CCVS-E-2-2 . . . . . . . . . .  M259
      176   CCVS-E-3 . . . . . . . . . . .  280
      185   CCVS-E-4 . . . . . . . . . . .  259
      186   CCVS-E-4-1 . . . . . . . . . .  M257
      188   CCVS-E-4-2 . . . . . . . . . .  M258
      130   CCVS-H-1 . . . . . . . . . . .  240
      135   CCVS-H-2A. . . . . . . . . . .  241
      144   CCVS-H-2B. . . . . . . . . . .  242
      156   CCVS-H-3 . . . . . . . . . . .  243
      206   CCVS-PGM-ID. . . . . . . . . .  212 212
       90   CM-18V0
       84   COMPUTED-A . . . . . . . . . .  85 87 88 89 90 313 316 M357 M387 M412 M442
       85   COMPUTED-N . . . . . . . . . .  M471 M521
       83   COMPUTED-X . . . . . . . . . .  M235 299 M491 M540
       87   COMPUTED-0V18
       89   COMPUTED-14V4
       91   COMPUTED-18V0
       88   COMPUTED-4V14
      107   COR-ANSI-REFERENCE . . . . . .  M308 M310
       98   CORRECT-A. . . . . . . . . . .  99 100 101 102 103 314 316 M358 M388 M413 M443
       99   CORRECT-N. . . . . . . . . . .  M470 M520
       97   CORRECT-X. . . . . . . . . . .  M236 300 M490 M539
      100   CORRECT-0V18
      102   CORRECT-14V4
      104   CORRECT-18V0
      101   CORRECT-4V14
      103   CR-18V0
      121   DELETE-COUNTER . . . . . . . .  M225 254 270 272
       76   DOTVALUE . . . . . . . . . . .  M230
      127   DUMMY-HOLD . . . . . . . . . .  M284 290
       37   DUMMY-RECORD . . . . . . . . .  M240 M241 M242 M243 M245 M246 M247 M249 M251 M260 M267 M274 M279 M280 284 M285
                                            286 M287 M288 M289 M290 294 M295 M303 M318
      174   ENDER-DESC . . . . . . . . . .  M262 M273 M278
      122   ERROR-COUNTER. . . . . . . . .  M224 253 263 266
      126   ERROR-HOLD . . . . . . . . . .  M253 M254 M254 M255 258
      172   ERROR-TOTAL. . . . . . . . . .  M264 M266 M271 M272 M276 M277
       69   FEATURE. . . . . . . . . . . .  M337 M365 M395 M427
      200   HYPHEN-LINE. . . . . . . . . .  247 249 289
      166   ID-AGAIN . . . . . . . . . . .  M212
       43   INDEX1 . . . . . . . . . . . .  M340 343 M368 371
       49   INDEX2 . . . . . . . . . . . .  M341 343 M369 372
       55   INDEX3
       61   INDEX4
      199   INF-ANSI-REFERENCE . . . . . .  M301 M304 M317 M319
      194   INFO-TEXT. . . . . . . . . . .  M302
      123   INSPECT-COUNTER. . . . . . . .  M222 253 275 277
       63   MOVE-TEST-3-A. . . . . . . . .  M450 453 481 491
       64   MOVE-TEST-3-B. . . . . . . . .  M453 461 471
       65   MOVE-TEST-4-A. . . . . . . . .  M500 503 530 540
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    14
0 Defined   Cross-reference of data names   References

0      66   MOVE-TEST-4-B. . . . . . . . .  M503 511 521
       71   P-OR-F . . . . . . . . . . . .  M222 M223 M224 M225 232 M235
       73   PAR-NAME . . . . . . . . . . .  M237 M335 M363 M393 M425 M460 M479 M510 M529
       75   PARDOT-X . . . . . . . . . . .  M229
      124   PASS-COUNTER . . . . . . . . .  M223 255 257
       35   PRINT-FILE . . . . . . . . . .  31 211 217
       36   PRINT-REC. . . . . . . . . . .  M231 M307 M309
       78   RE-MARK. . . . . . . . . . . .  M226 M238 M472 M492 M522 M541
      120   REC-CT . . . . . . . . . . . .  228 230 237 M451 M478 M501 M528
      119   REC-SKL-SUB
      128   RECORD-COUNT . . . . . . . . .  M282 283 M291
       40   RECORD1. . . . . . . . . . . .  M324 399
       46   RECORD1. . . . . . . . . . . .  M329 346 376 M399 400
       52   RECORD1. . . . . . . . . . . .  429
       58   RECORD1. . . . . . . . . . . .  M429 430
       41   RECORD2. . . . . . . . . . . .  M325 M326 343 371
       47   RECORD2. . . . . . . . . . . .  M330 M331 M343 344 345 M372 374 375 401 402
       53   RECORD2. . . . . . . . . . . .  M418 M419
       59   RECORD2. . . . . . . . . . . .  M421 M422 431 432
       44   RECORD3. . . . . . . . . . . .  M327 399
       50   RECORD3. . . . . . . . . . . .  M332 347 377 M399 403
       56   RECORD3. . . . . . . . . . . .  429
       62   RECORD3. . . . . . . . . . . .  M429 433
       39   TABLE1 . . . . . . . . . . . .  324 325 326 327 343 371 399
       45   TABLE2 . . . . . . . . . . . .  329 330 331 332 343 344 345 346 347 357 372 374 375 376 377 387 M399 400 401
                                            402 403 412
       51   TABLE3 . . . . . . . . . . . .  418 419 429
       57   TABLE4 . . . . . . . . . . . .  421 422 M429 430 431 432 433 442
       79   TEST-COMPUTED. . . . . . . . .  307
       94   TEST-CORRECT . . . . . . . . .  309
      147   TEST-ID. . . . . . . . . . . .  M212
       67   TEST-RESULTS . . . . . . . . .  M213 231
      125   TOTAL-ERROR
      196   XXCOMPUTED . . . . . . . . . .  M316
      198   XXCORRECT. . . . . . . . . . .  M316
      191   XXINFO . . . . . . . . . . . .  303 318
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    15
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

      352   ADD-DELETE-F2-1
      355   ADD-FAIL-F2-1. . . . . . . . .  G350
      334   ADD-INIT-F2-1
      342   ADD-TEST-F2-1
      359   ADD-WRITE-F2-1 . . . . . . . .  G351 G354
      312   BAIL-OUT . . . . . . . . . . .  P234
      320   BAIL-OUT-EX. . . . . . . . . .  E234 G314
      315   BAIL-OUT-WRITE . . . . . . . .  G313
      296   BLANK-LINE-PRINT
      546   CCVS-EXIT
      547   CCVS-999999. . . . . . . . . .  G508
      209   CCVS1
      321   CCVS1-EXIT . . . . . . . . . .  G215
      216   CLOSE-FILES. . . . . . . . . .  G548
      244   COLUMN-NAMES-ROUTINE . . . . .  E214
      225   DE-LETE. . . . . . . . . . . .  P353 P383 P408 P438 P456 P467 P487 P506 P517 P536
      248   END-ROUTINE. . . . . . . . . .  P217
      252   END-ROUTINE-1
      261   END-ROUTINE-12
      269   END-ROUTINE-13 . . . . . . . .  E217
      250   END-RTN-EXIT
      224   FAIL . . . . . . . . . . . . .  P356 P386 P411 P441 P473 P493 P523 P542
      298   FAIL-ROUTINE . . . . . . . . .  P233
      311   FAIL-ROUTINE-EX. . . . . . . .  E233 G305
      306   FAIL-ROUTINE-WRITE . . . . . .  G299 G300
      239   HEAD-ROUTINE . . . . . . . . .  P214
      323   INITIALISE-TABLE1. . . . . . .  P338 P366 P396
      328   INITIALISE-TABLE2. . . . . . .  P339 P367 P397
      417   INITIALISE-TABLE3
      420   INITIALISE-TABLE4
      222   INSPT
      407   MOV-DELETE-F2-1
      437   MOV-DELETE-F2-2
      455   MOV-DELETE-F2-3
      466   MOV-DELETE-F2-3-1
      486   MOV-DELETE-F2-3-2
      505   MOV-DELETE-F2-4
      516   MOV-DELETE-F2-4-1
      535   MOV-DELETE-F2-4-2
      410   MOV-FAIL-F2-1. . . . . . . . .  G405
      440   MOV-FAIL-F2-2. . . . . . . . .  G435
      469   MOV-FAIL-F2-3-1. . . . . . . .  G465
      489   MOV-FAIL-F2-3-2. . . . . . . .  G485
      519   MOV-FAIL-F2-4-1. . . . . . . .  G515
      538   MOV-FAIL-F2-4-2. . . . . . . .  G534
      392   MOV-INIT-F2-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    16
0 Defined   Cross-reference of procedures   References

0     424   MOV-INIT-F2-2
      447   MOV-INIT-F2-3
      477   MOV-INIT-F2-3-2
      497   MOV-INIT-F2-4. . . . . . . . .  G458
      398   MOV-TEST-F2-1
      428   MOV-TEST-F2-2
      452   MOV-TEST-F2-3-0
      459   MOV-TEST-F2-3-1. . . . . . . .  G454
      480   MOV-TEST-F2-3-2
      502   MOV-TEST-F2-4-0
      509   MOV-TEST-F2-4-1. . . . . . . .  G504
      527   MOV-TEST-F2-4-2
      414   MOV-WRITE-F2-1 . . . . . . . .  G406 G409
      444   MOV-WRITE-F2-2 . . . . . . . .  G436 G439
      474   MOV-WRITE-F2-3-1 . . . . . . .  G463 G468
      494   MOV-WRITE-F2-3-2 . . . . . . .  G483 G488
      524   MOV-WRITE-F2-4-1 . . . . . . .  G513 G518
      543   MOV-WRITE-F2-4-2 . . . . . . .  G532 G537
      210   OPEN-FILES
      223   PASS . . . . . . . . . . . . .  P348 P378 P404 P434 P462 P482 P512 P531
      227   PRINT-DETAIL . . . . . . . . .  P360 P390 P415 P445 P457 P475 P495 P507 P525 P544
      382   SUBTRACT-DELETE-F2-1
      385   SUBTRACT-FAIL-F2-1 . . . . . .  G380
      362   SUBTRACT-INIT-F2-1
      370   SUBTRACT-TEST-F2-1-0
      373   SUBTRACT-TEST-F2-1-1
      389   SUBTRACT-WRITE-F2-1. . . . . .  G381 G384
      220   TERMINATE-CALL
      218   TERMINATE-CCVS
      281   WRITE-LINE . . . . . . . . . .  P231 P232 P240 P241 P242 P243 P245 P246 P247 P249 P251 P260 P268 P274 P279 P280
                                            P303 P307 P309 P318
      293   WRT-LN . . . . . . . . . . . .  P287 P288 P289 P292 P297
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    17
0 Defined   Cross-reference of programs     References

        3   NC222A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC222A    Date 06/04/2022  Time 11:57:25   Page    18
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    399  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "RECORD2" within "TABLE1" did not qualify according to the
                       rules for the "CORRESPONDING" phrase.  Subordinate item "RECORD2" was ignored.

    429  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "RECORD2" within "TABLE3" did not qualify according to the
                       rules for the "CORRESPONDING" phrase.  Subordinate item "RECORD2" was ignored.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           1              2
-* Statistics for COBOL program NC222A:
 *    Source records = 548
 *    Data Division statements = 83
 *    Procedure Division statements = 272
 *    Generated COBOL statements = 0
 *    Program complexity factor = 280
0End of compilation 1,  program NC222A,  highest severity 4.
0Return code 4
