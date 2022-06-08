1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:42   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:42   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1214.2
   000002         000200 PROGRAM-ID.                                                      NC1214.2
   000003         000300     NC121M.                                                      NC1214.2
   000004         000500*                                                              *  NC1214.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1214.2
   000006         000700*                                                              *  NC1214.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1214.2
   000008         000900*                                                              *  NC1214.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1214.2
   000010         001100*                                                              *  NC1214.2
   000011         001300*                                                              *  NC1214.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1214.2
   000013         001500*                                                              *  NC1214.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1214.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1214.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1214.2
   000017         001900*                                                              *  NC1214.2
   000018         002100*                                                                 NC1214.2
   000019         002200*    PROGRAM NC121M TESTS THE USE OF INDEXED IDENTIFIERS WITH     NC1214.2
   000020         002300*    FORMATS 1 AND 2 OF THE "MULTIPLY" STATEMENT,  FORMATS        NC1214.2
   000021         002400*    1, 2 AND 3 OF THE "DIVIDE" STATEMENT,  FORMATS 1 AND 2 OF    NC1214.2
   000022         002500*    THE "PERFORM" STATEMENT AND THE "DISPLAY" STATEMENT          NC1214.2
   000023         002600*    GENERAL FORMAT.                                              NC1214.2
   000024         002700*    ONE AND TWO LEVELS OF INDEXING ARE USED AS WELL AS           NC1214.2
   000025         002800*    RELATIVE INDEXING.                                           NC1214.2
   000026         002900*                                                                 NC1214.2
   000027         003000 ENVIRONMENT DIVISION.                                            NC1214.2
   000028         003100 CONFIGURATION SECTION.                                           NC1214.2
   000029         003200 SOURCE-COMPUTER.                                                 NC1214.2
   000030         003300     XXXXX082.                                                    NC1214.2
   000031         003400 OBJECT-COMPUTER.                                                 NC1214.2
   000032         003500     XXXXX083.                                                    NC1214.2
   000033         003600 INPUT-OUTPUT SECTION.                                            NC1214.2
   000034         003700 FILE-CONTROL.                                                    NC1214.2
   000035         003800     SELECT PRINT-FILE ASSIGN TO                                  NC1214.2 39
   000036         003900     XXXXX055.                                                    NC1214.2
   000037         004000 DATA DIVISION.                                                   NC1214.2
   000038         004100 FILE SECTION.                                                    NC1214.2
   000039         004200 FD  PRINT-FILE.                                                  NC1214.2

 ==000039==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000040         004300 01  PRINT-REC PICTURE X(120).                                    NC1214.2
   000041         004400 01  DUMMY-RECORD PICTURE X(120).                                 NC1214.2
   000042         004500 WORKING-STORAGE SECTION.                                         NC1214.2
   000043         004600 01  TABLE1.                                                      NC1214.2
   000044         004700     02  TABLE1-NUM              PICTURE S9V99                    NC1214.2
   000045         004800                                 OCCURS 10 TIMES                  NC1214.2
   000046         004900                                 INDEXED BY INDEX1.               NC1214.2
   000047         005000 01  TABLE2.                                                      NC1214.2
   000048         005100     02  TABLE2-NUM              PICTURE 9V9                      NC1214.2
   000049         005200                                 OCCURS 6 TIMES                   NC1214.2
   000050         005300                                 INDEXED BY INDEX2.               NC1214.2
   000051         005400 01  TABLE3.                                                      NC1214.2
   000052         005500     02  TABLE3-NUM              PICTURE 99V9                     NC1214.2
   000053         005600                                 OCCURS 6 TIMES                   NC1214.2
   000054         005700                                 INDEXED BY INDEX3.               NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  TABLE4.                                                      NC1214.2
   000056         005900     02  TABLE4-NUM1             OCCURS 3 TIMES                   NC1214.2
   000057         006000                                 INDEXED BY INDEX4-1.             NC1214.2
   000058         006100         03 TABLE4-NUM2          PICTURE 99                       NC1214.2
   000059         006200                                 OCCURS 3 TIMES                   NC1214.2
   000060         006300                                 INDEXED BY INDEX4-2.             NC1214.2
   000061         006400 01  TABLE5.                                                      NC1214.2
   000062         006500     02  TABLE5-NUM              PIC 9                            NC1214.2
   000063         006600                                 OCCURS 2 TIMES                   NC1214.2
   000064         006700                                 INDEXED BY INDEX5.               NC1214.2
   000065         006800 01  TABLE6.                                                      NC1214.2
   000066         006900     02  TABLE6-REC              PICTURE X(10)                    NC1214.2
   000067         007000                                 OCCURS 2 TIMES                   NC1214.2
   000068         007100                                 INDEXED BY INDEX6.               NC1214.2
   000069         007200 01  NUM-9V9                     PICTURE 9V9.                     NC1214.2
   000070         007300 01  TEST-RESULTS.                                                NC1214.2
   000071         007400     02 FILLER                   PIC X      VALUE SPACE.          NC1214.2 IMP
   000072         007500     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1214.2 IMP
   000073         007600     02 FILLER                   PIC X      VALUE SPACE.          NC1214.2 IMP
   000074         007700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1214.2 IMP
   000075         007800     02 FILLER                   PIC X      VALUE SPACE.          NC1214.2 IMP
   000076         007900     02  PAR-NAME.                                                NC1214.2
   000077         008000       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1214.2 IMP
   000078         008100       03  PARDOT-X              PIC X      VALUE SPACE.          NC1214.2 IMP
   000079         008200       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1214.2 IMP
   000080         008300     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1214.2 IMP
   000081         008400     02 RE-MARK                  PIC X(61).                       NC1214.2
   000082         008500 01  TEST-COMPUTED.                                               NC1214.2
   000083         008600     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1214.2 IMP
   000084         008700     02 FILLER                   PIC X(17)  VALUE                 NC1214.2
   000085         008800            "       COMPUTED=".                                   NC1214.2
   000086         008900     02 COMPUTED-X.                                               NC1214.2
   000087         009000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1214.2 IMP
   000088         009100     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1214.2 87
   000089         009200                                 PIC -9(9).9(9).                  NC1214.2
   000090         009300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1214.2 87
   000091         009400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1214.2 87
   000092         009500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1214.2 87
   000093         009600     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1214.2 87
   000094         009700         04 COMPUTED-18V0                    PIC -9(18).          NC1214.2
   000095         009800         04 FILLER                           PIC X.               NC1214.2
   000096         009900     03 FILLER PIC X(50) VALUE SPACE.                             NC1214.2 IMP
   000097         010000 01  TEST-CORRECT.                                                NC1214.2
   000098         010100     02 FILLER PIC X(30) VALUE SPACE.                             NC1214.2 IMP
   000099         010200     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1214.2
   000100         010300     02 CORRECT-X.                                                NC1214.2
   000101         010400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1214.2 IMP
   000102         010500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1214.2 101
   000103         010600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1214.2 101
   000104         010700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1214.2 101
   000105         010800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1214.2 101
   000106         010900     03      CR-18V0 REDEFINES CORRECT-A.                         NC1214.2 101
   000107         011000         04 CORRECT-18V0                     PIC -9(18).          NC1214.2
   000108         011100         04 FILLER                           PIC X.               NC1214.2
   000109         011200     03 FILLER PIC X(2) VALUE SPACE.                              NC1214.2 IMP
   000110         011300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1214.2 IMP
   000111         011400 01  CCVS-C-1.                                                    NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1214.2
   000113         011600-    "SS  PARAGRAPH-NAME                                          NC1214.2
   000114         011700-    "       REMARKS".                                            NC1214.2
   000115         011800     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1214.2 IMP
   000116         011900 01  CCVS-C-2.                                                    NC1214.2
   000117         012000     02 FILLER                     PIC X        VALUE SPACE.      NC1214.2 IMP
   000118         012100     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1214.2
   000119         012200     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1214.2 IMP
   000120         012300     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1214.2
   000121         012400     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1214.2 IMP
   000122         012500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1214.2 IMP
   000123         012600 01  REC-CT                        PIC 99       VALUE ZERO.       NC1214.2 IMP
   000124         012700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1214.2 IMP
   000125         012800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1214.2 IMP
   000126         012900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1214.2 IMP
   000127         013000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1214.2 IMP
   000128         013100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1214.2 IMP
   000129         013200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1214.2 IMP
   000130         013300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1214.2 IMP
   000131         013400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1214.2 IMP
   000132         013500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1214.2 IMP
   000133         013600 01  CCVS-H-1.                                                    NC1214.2
   000134         013700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1214.2 IMP
   000135         013800     02  FILLER                    PIC X(42)    VALUE             NC1214.2
   000136         013900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1214.2
   000137         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1214.2 IMP
   000138         014100 01  CCVS-H-2A.                                                   NC1214.2
   000139         014200   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1214.2 IMP
   000140         014300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1214.2
   000141         014400   02  FILLER                        PIC XXXX   VALUE             NC1214.2
   000142         014500     "4.2 ".                                                      NC1214.2
   000143         014600   02  FILLER                        PIC X(28)  VALUE             NC1214.2
   000144         014700            " COPY - NOT FOR DISTRIBUTION".                       NC1214.2
   000145         014800   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1214.2 IMP
   000146         014900                                                                  NC1214.2
   000147         015000 01  CCVS-H-2B.                                                   NC1214.2
   000148         015100   02  FILLER                        PIC X(15)  VALUE             NC1214.2
   000149         015200            "TEST RESULT OF ".                                    NC1214.2
   000150         015300   02  TEST-ID                       PIC X(9).                    NC1214.2
   000151         015400   02  FILLER                        PIC X(4)   VALUE             NC1214.2
   000152         015500            " IN ".                                               NC1214.2
   000153         015600   02  FILLER                        PIC X(12)  VALUE             NC1214.2
   000154         015700     " HIGH       ".                                              NC1214.2
   000155         015800   02  FILLER                        PIC X(22)  VALUE             NC1214.2
   000156         015900            " LEVEL VALIDATION FOR ".                             NC1214.2
   000157         016000   02  FILLER                        PIC X(58)  VALUE             NC1214.2
   000158         016100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1214.2
   000159         016200 01  CCVS-H-3.                                                    NC1214.2
   000160         016300     02  FILLER                      PIC X(34)  VALUE             NC1214.2
   000161         016400            " FOR OFFICIAL USE ONLY    ".                         NC1214.2
   000162         016500     02  FILLER                      PIC X(58)  VALUE             NC1214.2
   000163         016600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1214.2
   000164         016700     02  FILLER                      PIC X(28)  VALUE             NC1214.2
   000165         016800            "  COPYRIGHT   1985 ".                                NC1214.2
   000166         016900 01  CCVS-E-1.                                                    NC1214.2
   000167         017000     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1214.2 IMP
   000168         017100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 ID-AGAIN                     PIC X(9).                    NC1214.2
   000170         017300     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1214.2 IMP
   000171         017400 01  CCVS-E-2.                                                    NC1214.2
   000172         017500     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1214.2 IMP
   000173         017600     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1214.2 IMP
   000174         017700     02 CCVS-E-2-2.                                               NC1214.2
   000175         017800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1214.2 IMP
   000176         017900         03 FILLER                   PIC X      VALUE SPACE.      NC1214.2 IMP
   000177         018000         03 ENDER-DESC               PIC X(44)  VALUE             NC1214.2
   000178         018100            "ERRORS ENCOUNTERED".                                 NC1214.2
   000179         018200 01  CCVS-E-3.                                                    NC1214.2
   000180         018300     02  FILLER                      PIC X(22)  VALUE             NC1214.2
   000181         018400            " FOR OFFICIAL USE ONLY".                             NC1214.2
   000182         018500     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1214.2 IMP
   000183         018600     02  FILLER                      PIC X(58)  VALUE             NC1214.2
   000184         018700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1214.2
   000185         018800     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1214.2 IMP
   000186         018900     02 FILLER                       PIC X(15)  VALUE             NC1214.2
   000187         019000             " COPYRIGHT 1985".                                   NC1214.2
   000188         019100 01  CCVS-E-4.                                                    NC1214.2
   000189         019200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1214.2 IMP
   000190         019300     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1214.2
   000191         019400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1214.2 IMP
   000192         019500     02 FILLER                       PIC X(40)  VALUE             NC1214.2
   000193         019600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1214.2
   000194         019700 01  XXINFO.                                                      NC1214.2
   000195         019800     02 FILLER                       PIC X(19)  VALUE             NC1214.2
   000196         019900            "*** INFORMATION ***".                                NC1214.2
   000197         020000     02 INFO-TEXT.                                                NC1214.2
   000198         020100       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1214.2 IMP
   000199         020200       04 XXCOMPUTED                 PIC X(20).                   NC1214.2
   000200         020300       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1214.2 IMP
   000201         020400       04 XXCORRECT                  PIC X(20).                   NC1214.2
   000202         020500     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1214.2
   000203         020600 01  HYPHEN-LINE.                                                 NC1214.2
   000204         020700     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1214.2 IMP
   000205         020800     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1214.2
   000206         020900-    "*****************************************".                 NC1214.2
   000207         021000     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1214.2
   000208         021100-    "******************************".                            NC1214.2
   000209         021200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1214.2
   000210         021300     "NC121M".                                                    NC1214.2
   000211         021400 PROCEDURE DIVISION.                                              NC1214.2
   000212         021500 CCVS1 SECTION.                                                   NC1214.2
   000213         021600 OPEN-FILES.                                                      NC1214.2
   000214         021700     OPEN     OUTPUT PRINT-FILE.                                  NC1214.2 39
   000215         021800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1214.2 209 150 209 169
   000216         021900     MOVE    SPACE TO TEST-RESULTS.                               NC1214.2 IMP 70
   000217         022000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1214.2 242 247
   000218         022100     GO TO CCVS1-EXIT.                                            NC1214.2 329
   000219         022200 CLOSE-FILES.                                                     NC1214.2
   000220         022300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1214.2 251 272 39
   000221         022400 TERMINATE-CCVS.                                                  NC1214.2
   000222         022500     EXIT PROGRAM.                                                NC1214.2
   000223         022600 TERMINATE-CALL.                                                  NC1214.2
   000224         022700     STOP     RUN.                                                NC1214.2
   000225         022800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1214.2 74 126
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1214.2 74 127
   000227         023000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1214.2 74 125
   000228         023100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1214.2 74 124
   000229         023200     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1214.2 81
   000230         023300 PRINT-DETAIL.                                                    NC1214.2
   000231         023400     IF REC-CT NOT EQUAL TO ZERO                                  NC1214.2 123 IMP
   000232      1  023500             MOVE "." TO PARDOT-X                                 NC1214.2 78
   000233      1  023600             MOVE REC-CT TO DOTVALUE.                             NC1214.2 123 79
   000234         023700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1214.2 70 40 284
   000235         023800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1214.2 74 284
   000236      1  023900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1214.2 305 319
   000237      1  024000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1214.2 320 328
   000238         024100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1214.2 IMP 74 IMP 86
   000239         024200     MOVE SPACE TO CORRECT-X.                                     NC1214.2 IMP 100
   000240         024300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1214.2 123 IMP IMP 76
   000241         024400     MOVE     SPACE TO RE-MARK.                                   NC1214.2 IMP 81
   000242         024500 HEAD-ROUTINE.                                                    NC1214.2
   000243         024600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1214.2 133 41 284
   000244         024700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1214.2 138 41 284
   000245         024800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1214.2 147 41 284
   000246         024900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1214.2 159 41 284
   000247         025000 COLUMN-NAMES-ROUTINE.                                            NC1214.2
   000248         025100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1214.2 111 41 284
   000249         025200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1214.2 116 41 284
   000250         025300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1214.2 203 41 284
   000251         025400 END-ROUTINE.                                                     NC1214.2
   000252         025500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1214.2 203 41 284
   000253         025600 END-RTN-EXIT.                                                    NC1214.2
   000254         025700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1214.2 166 41 284
   000255         025800 END-ROUTINE-1.                                                   NC1214.2
   000256         025900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1214.2 125 129 126
   000257         026000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1214.2 129 124 129
   000258         026100      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1214.2 127 129
   000259         026200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1214.2
   000260         026300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1214.2 127 189
   000261         026400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1214.2 129 191
   000262         026500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1214.2 188 174
   000263         026600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1214.2 171 41 284
   000264         026700  END-ROUTINE-12.                                                 NC1214.2
   000265         026800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1214.2 177
   000266         026900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1214.2 125 IMP
   000267      1  027000         MOVE "NO " TO ERROR-TOTAL                                NC1214.2 175
   000268         027100         ELSE                                                     NC1214.2
   000269      1  027200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1214.2 125 175
   000270         027300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1214.2 171 41
   000271         027400     PERFORM WRITE-LINE.                                          NC1214.2 284
   000272         027500 END-ROUTINE-13.                                                  NC1214.2
   000273         027600     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1214.2 124 IMP
   000274      1  027700         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1214.2 175
   000275      1  027800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1214.2 124 175
   000276         027900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1214.2 177
   000277         028000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1214.2 171 41 284
   000278         028100      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1214.2 126 IMP
   000279      1  028200          MOVE "NO " TO ERROR-TOTAL                               NC1214.2 175
   000280      1  028300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1214.2 126 175
   000281         028400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1214.2 177
   000282         028500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1214.2 171 41 284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1214.2 179 41 284
   000284         028700 WRITE-LINE.                                                      NC1214.2
   000285         028800     ADD 1 TO RECORD-COUNT.                                       NC1214.2 131
   000286         028900     IF RECORD-COUNT GREATER 42                                   NC1214.2 131
   000287      1  029000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1214.2 41 130
   000288      1  029100         MOVE SPACE TO DUMMY-RECORD                               NC1214.2 IMP 41
   000289      1  029200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1214.2 41
   000290      1  029300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1214.2 133 41 300
   000291      1  029400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1214.2 138 41 300
   000292      1  029500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1214.2 147 41 300
   000293      1  029600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1214.2 159 41 300
   000294      1  029700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1214.2 111 41 300
   000295      1  029800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1214.2 116 41 300
   000296      1  029900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1214.2 203 41 300
   000297      1  030000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1214.2 130 41
   000298      1  030100         MOVE ZERO TO RECORD-COUNT.                               NC1214.2 IMP 131
   000299         030200     PERFORM WRT-LN.                                              NC1214.2 300
   000300         030300 WRT-LN.                                                          NC1214.2
   000301         030400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1214.2 41
   000302         030500     MOVE SPACE TO DUMMY-RECORD.                                  NC1214.2 IMP 41
   000303         030600 BLANK-LINE-PRINT.                                                NC1214.2
   000304         030700     PERFORM WRT-LN.                                              NC1214.2 300
   000305         030800 FAIL-ROUTINE.                                                    NC1214.2
   000306         030900     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1214.2 86 IMP
   000307      1  031000            GO TO FAIL-ROUTINE-WRITE.                             NC1214.2 314
   000308         031100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1214.2 100 IMP 314
   000309         031200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1214.2 132 202
   000310         031300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1214.2 197
   000311         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1214.2 194 41 284
   000312         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1214.2 IMP 202
   000313         031600     GO TO  FAIL-ROUTINE-EX.                                      NC1214.2 319
   000314         031700 FAIL-ROUTINE-WRITE.                                              NC1214.2
   000315         031800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1214.2 82 40 284
   000316         031900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1214.2 132 110
   000317         032000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1214.2 97 40 284
   000318         032100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1214.2 IMP 110
   000319         032200 FAIL-ROUTINE-EX. EXIT.                                           NC1214.2
   000320         032300 BAIL-OUT.                                                        NC1214.2
   000321         032400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1214.2 87 IMP 323
   000322         032500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1214.2 101 IMP 328
   000323         032600 BAIL-OUT-WRITE.                                                  NC1214.2
   000324         032700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1214.2 101 201 87 199
   000325         032800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1214.2 132 202
   000326         032900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1214.2 194 41 284
   000327         033000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1214.2 IMP 202
   000328         033100 BAIL-OUT-EX. EXIT.                                               NC1214.2
   000329         033200 CCVS1-EXIT.                                                      NC1214.2
   000330         033300     EXIT.                                                        NC1214.2
   000331         033400 SECT-NC121M-001 SECTION.                                         NC1214.2
   000332         033500 BUILD-TABLE1.                                                    NC1214.2
   000333         033600     MOVE 4.00 TO TABLE1-NUM (1).                                 NC1214.2 44
   000334         033700     MOVE 1.34 TO TABLE1-NUM (2).                                 NC1214.2 44
   000335         033800     MOVE 7.00 TO TABLE1-NUM (3).                                 NC1214.2 44
   000336         033900     MOVE 3.00 TO TABLE1-NUM (4).                                 NC1214.2 44
   000337         034000     MOVE 2.00 TO TABLE1-NUM (5).                                 NC1214.2 44
   000338         034100     MOVE 1.50 TO TABLE1-NUM (6).                                 NC1214.2 44
   000339         034200     MOVE 3.50 TO TABLE1-NUM (7).                                 NC1214.2 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE 0.00 TO TABLE1-NUM (8).                                 NC1214.2 44
   000341         034400     MOVE 5.00 TO TABLE1-NUM (9).                                 NC1214.2 44
   000342         034500     MOVE -9.00 TO TABLE1-NUM (10).                               NC1214.2 44
   000343         034600 BUILD-TABLE2.                                                    NC1214.2
   000344         034700     MOVE 1.0 TO TABLE2-NUM (1).                                  NC1214.2 48
   000345         034800     MOVE 6.0 TO TABLE2-NUM (2).                                  NC1214.2 48
   000346         034900     MOVE 3.0 TO TABLE2-NUM (3).                                  NC1214.2 48
   000347         035000     MOVE 2.0 TO TABLE2-NUM (4).                                  NC1214.2 48
   000348         035100     MOVE 9.7 TO TABLE2-NUM (5).                                  NC1214.2 48
   000349         035200     MOVE 1.2 TO TABLE2-NUM (6).                                  NC1214.2 48
   000350         035300 BUILD-TABLE4.                                                    NC1214.2
   000351         035400     MOVE 01 TO TABLE4-NUM2 (1  1).                               NC1214.2 58
   000352         035500     MOVE 02 TO TABLE4-NUM2 (1  2).                               NC1214.2 58
   000353         035600     MOVE 03 TO TABLE4-NUM2 (1  3).                               NC1214.2 58
   000354         035700     MOVE 12 TO TABLE4-NUM2 (2  1).                               NC1214.2 58
   000355         035800     MOVE 24 TO TABLE4-NUM2 (2  2).                               NC1214.2 58
   000356         035900     MOVE 25 TO TABLE4-NUM2 (2  3).                               NC1214.2 58
   000357         036000     MOVE 14 TO TABLE4-NUM2 (3  1).                               NC1214.2 58
   000358         036100     MOVE 15 TO TABLE4-NUM2 (3  2).                               NC1214.2 58
   000359         036200     MOVE 16 TO TABLE4-NUM2 (3  3).                               NC1214.2 58
   000360         036300 BUILD-TABLE5.                                                    NC1214.2
   000361         036400     MOVE 3 TO TABLE5-NUM (1).                                    NC1214.2 62
   000362         036500     MOVE 2 TO TABLE5-NUM (2).                                    NC1214.2 62
   000363         036600 BUILD-TABLE6.                                                    NC1214.2
   000364         036700     MOVE "LITERAL-01" TO TABLE6-REC (1).                         NC1214.2 66
   000365         036800     MOVE "0123456789" TO TABLE6-REC (2).                         NC1214.2 66
   000366         036900 IND-INIT-GF-1.                                                   NC1214.2
   000367         037000     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000368         037100     MOVE "MULTIPLY BY" TO FEATURE.                               NC1214.2 72
   000369         037200     MOVE 2.0 TO NUM-9V9.                                         NC1214.2 69
   000370         037300     SET INDEX1 TO 1.                                             NC1214.2 46
   000371         037400 IND-TEST-GF-1-0.                                                 NC1214.2
   000372         037500     MULTIPLY TABLE1-NUM (INDEX1) BY NUM-9V9.                     NC1214.2 44 46 69
   000373         037600 IND-TEST-GF-1-1.                                                 NC1214.2
   000374         037700     IF NUM-9V9 EQUAL TO 8.0                                      NC1214.2 69
   000375      1  037800        PERFORM PASS                                              NC1214.2 226
   000376      1  037900        ELSE GO TO IND-FAIL-GF-1.                                 NC1214.2 381
   000377         038000     GO TO IND-WRITE-GF-1.                                        NC1214.2 385
   000378         038100 IND-DELETE-GF-1.                                                 NC1214.2
   000379         038200     PERFORM DE-LETE.                                             NC1214.2 228
   000380         038300     GO TO IND-WRITE-GF-1.                                        NC1214.2 385
   000381         038400 IND-FAIL-GF-1.                                                   NC1214.2
   000382         038500     PERFORM FAIL.                                                NC1214.2 227
   000383         038600     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000384         038700     MOVE 8.0 TO CORRECT-14V4.                                    NC1214.2 105
   000385         038800 IND-WRITE-GF-1.                                                  NC1214.2
   000386         038900     MOVE "IND-TEST-GF-1" TO PAR-NAME.                            NC1214.2 76
   000387         039000     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000388         039100 IND-INIT-GF-2.                                                   NC1214.2
   000389         039200     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000390         039300     MOVE "MULTIPLY ROUNDED" TO FEATURE.                          NC1214.2 72
   000391         039400     MOVE 4.0 TO NUM-9V9.                                         NC1214.2 69
   000392         039500     SET INDEX1 TO 2.                                             NC1214.2 46
   000393         039600 IND-TEST-GF-2-0.                                                 NC1214.2
   000394         039700     MULTIPLY TABLE1-NUM (INDEX1) BY NUM-9V9 ROUNDED.             NC1214.2 44 46 69
   000395         039800 IND-TEST-GF-2-1.                                                 NC1214.2
   000396         039900     IF NUM-9V9 EQUAL TO 5.4                                      NC1214.2 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040000        PERFORM PASS                                              NC1214.2 226
   000398      1  040100        ELSE GO TO IND-FAIL-GF-2.                                 NC1214.2 403
   000399         040200     GO TO IND-WRITE-GF-2.                                        NC1214.2 407
   000400         040300 IND-DELETE-GF-2.                                                 NC1214.2
   000401         040400     PERFORM DE-LETE.                                             NC1214.2 228
   000402         040500     GO TO IND-WRITE-GF-2.                                        NC1214.2 407
   000403         040600 IND-FAIL-GF-2.                                                   NC1214.2
   000404         040700     PERFORM FAIL.                                                NC1214.2 227
   000405         040800     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000406         040900     MOVE 5.4 TO CORRECT-14V4.                                    NC1214.2 105
   000407         041000 IND-WRITE-GF-2.                                                  NC1214.2
   000408         041100     MOVE "IND-TEST-GF-2" TO PAR-NAME.                            NC1214.2 76
   000409         041200     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000410         041300 IND-INIT-GF-3.                                                   NC1214.2
   000411         041400     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000412         041500     MOVE "MULTIPLY ON SIZE ERR" TO FEATURE.                      NC1214.2 72
   000413         041600     MOVE 6.0 TO NUM-9V9.                                         NC1214.2 69
   000414         041700     SET INDEX1 TO 3.                                             NC1214.2 46
   000415         041800 IND-TEST-GF-3-1.                                                 NC1214.2
   000416         041900     MULTIPLY TABLE1-NUM (INDEX1) BY NUM-9V9 ON SIZE ERROR        NC1214.2 44 46 69
   000417      1  042000        PERFORM PASS                                              NC1214.2 226
   000418      1  042100        GO TO IND-WRITE-GF-3-1.                                   NC1214.2 427
   000419         042200     GO TO IND-FAIL-GF-3-1.                                       NC1214.2 423
   000420         042300 IND-DELETE-GF-3-1.                                               NC1214.2
   000421         042400     PERFORM DE-LETE.                                             NC1214.2 228
   000422         042500     GO TO IND-WRITE-GF-3-1.                                      NC1214.2 427
   000423         042600 IND-FAIL-GF-3-1.                                                 NC1214.2
   000424         042700     PERFORM FAIL.                                                NC1214.2 227
   000425         042800     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000426         042900     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1214.2 81
   000427         043000 IND-WRITE-GF-3-1.                                                NC1214.2
   000428         043100     MOVE "IND-TEST-GF-3-1" TO PAR-NAME.                          NC1214.2 76
   000429         043200     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000430         043300 IND-TEST-GF-3-2.                                                 NC1214.2
   000431         043400     IF      NUM-9V9 = 6.0                                        NC1214.2 69
   000432      1  043500             PERFORM PASS                                         NC1214.2 226
   000433      1  043600             GO TO   IND-WRITE-GF-3-2.                            NC1214.2 443
   000434         043700     GO TO   IND-FAIL-GF-3-2.                                     NC1214.2 438
   000435         043800 IND-DELETE-GF-3-2.                                               NC1214.2
   000436         043900     PERFORM DE-LETE.                                             NC1214.2 228
   000437         044000     GO TO IND-WRITE-GF-3-2.                                      NC1214.2 443
   000438         044100 IND-FAIL-GF-3-2.                                                 NC1214.2
   000439         044200     PERFORM FAIL.                                                NC1214.2 227
   000440         044300     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000441         044400     MOVE 6.0 TO CORRECT-14V4.                                    NC1214.2 105
   000442         044500     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1214.2 81
   000443         044600 IND-WRITE-GF-3-2.                                                NC1214.2
   000444         044700     MOVE "IND-TEST-GF-3-2" TO PAR-NAME.                          NC1214.2 76
   000445         044800     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000446         044900 IND-INIT-GF-4.                                                   NC1214.2
   000447         045000     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000448         045100     MOVE "MULTIPLY BY" TO FEATURE.                               NC1214.2 72
   000449         045200     SET INDEX1 TO 1.                                             NC1214.2 46
   000450         045300     SET INDEX2 TO 1.                                             NC1214.2 50
   000451         045400 IND-TEST-GF-4-0.                                                 NC1214.2
   000452         045500     MULTIPLY TABLE1-NUM (INDEX1) BY TABLE2-NUM (INDEX2).         NC1214.2 44 46 48 50
   000453         045600 IND-TEST-GF-4-1.                                                 NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     IF TABLE2-NUM (INDEX2) EQUAL TO 4.0                          NC1214.2 48 50
   000455      1  045800        PERFORM PASS                                              NC1214.2 226
   000456      1  045900        ELSE GO TO IND-FAIL-GF-4.                                 NC1214.2 461
   000457         046000     GO TO IND-WRITE-GF-4.                                        NC1214.2 465
   000458         046100 IND-DELETE-GF-4.                                                 NC1214.2
   000459         046200     PERFORM DE-LETE.                                             NC1214.2 228
   000460         046300     GO TO IND-WRITE-GF-4.                                        NC1214.2 465
   000461         046400 IND-FAIL-GF-4.                                                   NC1214.2
   000462         046500     PERFORM FAIL.                                                NC1214.2 227
   000463         046600     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000464         046700     MOVE 4.0 TO CORRECT-14V4.                                    NC1214.2 105
   000465         046800 IND-WRITE-GF-4.                                                  NC1214.2
   000466         046900     MOVE "IND-TEST-GF-4" TO PAR-NAME.                            NC1214.2 76
   000467         047000     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000468         047100 IND-INIT-GF-5.                                                   NC1214.2
   000469         047200     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000470         047300     MOVE "MULTIPLY ROUNDED" TO FEATURE.                          NC1214.2 72
   000471         047400     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000472         047500     SET INDEX1 TO 2.                                             NC1214.2 46
   000473         047600     SET INDEX2 TO 2.                                             NC1214.2 50
   000474         047700 IND-TEST-GF-5-0.                                                 NC1214.2
   000475         047800     MULTIPLY TABLE1-NUM (INDEX1) BY TABLE2-NUM (INDEX2) ROUNDED. NC1214.2 44 46 48 50
   000476         047900 IND-TEST-GF-5-1.                                                 NC1214.2
   000477         048000     IF TABLE2-NUM (INDEX2) EQUAL TO 8.0                          NC1214.2 48 50
   000478      1  048100        PERFORM PASS                                              NC1214.2 226
   000479      1  048200        ELSE GO TO IND-FAIL-GF-5.                                 NC1214.2 484
   000480         048300     GO TO IND-WRITE-GF-5.                                        NC1214.2 488
   000481         048400 IND-DELETE-GF-5.                                                 NC1214.2
   000482         048500     PERFORM DE-LETE.                                             NC1214.2 228
   000483         048600     GO TO IND-WRITE-GF-5.                                        NC1214.2 488
   000484         048700 IND-FAIL-GF-5.                                                   NC1214.2
   000485         048800     PERFORM FAIL.                                                NC1214.2 227
   000486         048900     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000487         049000     MOVE 8.0 TO CORRECT-14V4.                                    NC1214.2 105
   000488         049100 IND-WRITE-GF-5.                                                  NC1214.2
   000489         049200     MOVE "IND-TEST-GF-5" TO PAR-NAME.                            NC1214.2 76
   000490         049300     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000491         049400 IND-INIT-GF-6.                                                   NC1214.2
   000492         049500     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000493         049600     MOVE "MULTIPLY ON SIZE ERR" TO FEATURE.                      NC1214.2 72
   000494         049700     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000495         049800     SET INDEX1 TO 3.                                             NC1214.2 46
   000496         049900     SET INDEX2 TO 3.                                             NC1214.2 50
   000497         050000 IND-TEST-GF-6-1.                                                 NC1214.2
   000498         050100     MULTIPLY TABLE1-NUM (INDEX1) BY TABLE2-NUM (INDEX2)          NC1214.2 44 46 48 50
   000499         050200        ON SIZE ERROR                                             NC1214.2
   000500      1  050300        PERFORM PASS                                              NC1214.2 226
   000501      1  050400        GO TO IND-WRITE-GF-6-1.                                   NC1214.2 510
   000502         050500     GO TO IND-FAIL-GF-6-1.                                       NC1214.2 506
   000503         050600 IND-DELETE-GF-6-1.                                               NC1214.2
   000504         050700     PERFORM DE-LETE.                                             NC1214.2 228
   000505         050800     GO TO IND-WRITE-GF-6-1.                                      NC1214.2 510
   000506         050900 IND-FAIL-GF-6-1.                                                 NC1214.2
   000507         051000     PERFORM FAIL.                                                NC1214.2 227
   000508         051100     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000509         051200     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1214.2 81
   000510         051300 IND-WRITE-GF-6-1.                                                NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE "IND-TEST-GF-6-1" TO PAR-NAME.                          NC1214.2 76
   000512         051500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000513         051600 IND-TEST-GF-6-2.                                                 NC1214.2
   000514         051700     IF      TABLE2-NUM (INDEX2) = 3.0                            NC1214.2 48 50
   000515      1  051800             PERFORM PASS                                         NC1214.2 226
   000516      1  051900             GO TO   IND-WRITE-GF-6-2.                            NC1214.2 526
   000517         052000     GO TO   IND-FAIL-GF-6-2.                                     NC1214.2 521
   000518         052100 IND-DELETE-GF-6-2.                                               NC1214.2
   000519         052200     PERFORM DE-LETE.                                             NC1214.2 228
   000520         052300     GO TO IND-WRITE-GF-6-2.                                      NC1214.2 526
   000521         052400 IND-FAIL-GF-6-2.                                                 NC1214.2
   000522         052500     PERFORM FAIL.                                                NC1214.2 227
   000523         052600     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000524         052700     MOVE 3.0 TO CORRECT-14V4.                                    NC1214.2 105
   000525         052800     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1214.2 81
   000526         052900 IND-WRITE-GF-6-2.                                                NC1214.2
   000527         053000     MOVE "IND-TEST-GF-6-2" TO PAR-NAME.                          NC1214.2 76
   000528         053100     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000529         053200 IND-INIT-GF-7.                                                   NC1214.2
   000530         053300     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000531         053400     MOVE "MULTIPLY BY GIVING" TO FEATURE.                        NC1214.2 72
   000532         053500     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000533         053600     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   000534         053700     SET INDEX1 TO 1.                                             NC1214.2 46
   000535         053800 IND-TEST-GF-7-0.                                                 NC1214.2
   000536         053900     MULTIPLY 2 BY TABLE1-NUM (INDEX1) GIVING NUM-9V9.            NC1214.2 44 46 69
   000537         054000 IND-TEST-GF-7-1.                                                 NC1214.2
   000538         054100     IF NUM-9V9 EQUAL TO 8.0                                      NC1214.2 69
   000539      1  054200        PERFORM PASS                                              NC1214.2 226
   000540      1  054300        ELSE GO TO IND-FAIL-GF-7.                                 NC1214.2 545
   000541         054400     GO TO IND-WRITE-GF-7.                                        NC1214.2 549
   000542         054500 IND-DELETE-GF-7.                                                 NC1214.2
   000543         054600     PERFORM DE-LETE.                                             NC1214.2 228
   000544         054700     GO TO IND-WRITE-GF-7.                                        NC1214.2 549
   000545         054800 IND-FAIL-GF-7.                                                   NC1214.2
   000546         054900     PERFORM FAIL.                                                NC1214.2 227
   000547         055000     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000548         055100     MOVE 8.0 TO CORRECT-14V4.                                    NC1214.2 105
   000549         055200 IND-WRITE-GF-7.                                                  NC1214.2
   000550         055300     MOVE "IND-TEST-GF-7" TO PAR-NAME.                            NC1214.2 76
   000551         055400     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000552         055500 IND-INIT-GF-8.                                                   NC1214.2
   000553         055600     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000554         055700     MOVE "MULTIPLY BY GIVING" TO FEATURE.                        NC1214.2 72
   000555         055800     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000556         055900     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   000557         056000     SET INDEX1 TO 4.                                             NC1214.2 46
   000558         056100     SET INDEX2 TO 4.                                             NC1214.2 50
   000559         056200 IND-TEST-GF-8-0.                                                 NC1214.2
   000560         056300     MULTIPLY TABLE1-NUM (INDEX1) BY TABLE2-NUM (INDEX2)          NC1214.2 44 46 48 50
   000561         056400        GIVING NUM-9V9.                                           NC1214.2 69
   000562         056500 IND-TEST-GF-8-1.                                                 NC1214.2
   000563         056600     IF NUM-9V9 EQUAL TO 6.0                                      NC1214.2 69
   000564      1  056700        PERFORM PASS                                              NC1214.2 226
   000565      1  056800        ELSE GO TO IND-FAIL-GF-8.                                 NC1214.2 570
   000566         056900     GO TO IND-WRITE-GF-8.                                        NC1214.2 574
   000567         057000 IND-DELETE-GF-8.                                                 NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     PERFORM DE-LETE.                                             NC1214.2 228
   000569         057200     GO TO IND-WRITE-GF-8.                                        NC1214.2 574
   000570         057300 IND-FAIL-GF-8.                                                   NC1214.2
   000571         057400     PERFORM FAIL.                                                NC1214.2 227
   000572         057500     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000573         057600     MOVE 6.0 TO CORRECT-14V4.                                    NC1214.2 105
   000574         057700 IND-WRITE-GF-8.                                                  NC1214.2
   000575         057800     MOVE "IND-TEST-GF-8" TO PAR-NAME.                            NC1214.2 76
   000576         057900     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000577         058000 IND-INIT-GF-9.                                                   NC1214.2
   000578         058100     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000579         058200     MOVE "MULTIPLY BY GIVING" TO FEATURE.                        NC1214.2 72
   000580         058300     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000581         058400     MOVE ZERO TO TABLE3.                                         NC1214.2 IMP 51
   000582         058500     SET INDEX1 TO 3.                                             NC1214.2 46
   000583         058600     SET INDEX2 TO 2.                                             NC1214.2 50
   000584         058700     SET INDEX3 TO 1.                                             NC1214.2 54
   000585         058800 IND-TEST-GF-9-0.                                                 NC1214.2
   000586         058900     MULTIPLY TABLE1-NUM (INDEX1) BY TABLE2-NUM (INDEX2)          NC1214.2 44 46 48 50
   000587         059000        GIVING TABLE3-NUM (INDEX3).                               NC1214.2 52 54
   000588         059100 IND-TEST-GF-9-1.                                                 NC1214.2
   000589         059200     IF TABLE3-NUM (INDEX3) EQUAL TO 42.0                         NC1214.2 52 54
   000590      1  059300        PERFORM PASS                                              NC1214.2 226
   000591      1  059400        ELSE GO TO IND-FAIL-GF-9.                                 NC1214.2 596
   000592         059500     GO TO IND-WRITE-GF-9.                                        NC1214.2 600
   000593         059600 IND-DELETE-GF-9.                                                 NC1214.2
   000594         059700     PERFORM DE-LETE.                                             NC1214.2 228
   000595         059800     GO TO IND-WRITE-GF-9.                                        NC1214.2 600
   000596         059900 IND-FAIL-GF-9.                                                   NC1214.2
   000597         060000     PERFORM FAIL.                                                NC1214.2 227
   000598         060100     MOVE TABLE3-NUM (INDEX3) TO COMPUTED-14V4.                   NC1214.2 52 54 92
   000599         060200     MOVE 42.0 TO CORRECT-14V4.                                   NC1214.2 105
   000600         060300 IND-WRITE-GF-9.                                                  NC1214.2
   000601         060400     MOVE "IND-TEST-GF-9" TO PAR-NAME.                            NC1214.2 76
   000602         060500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000603         060600 IND-INIT-GF-10.                                                  NC1214.2
   000604         060700     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000605         060800     MOVE "MULTIPLY BY" TO FEATURE.                               NC1214.2 72
   000606         060900     MOVE 2.0 TO NUM-9V9.                                         NC1214.2 69
   000607         061000     SET INDEX1 TO 3.                                             NC1214.2 46
   000608         061100 IND-TEST-GF-10-0.                                                NC1214.2
   000609         061200     MULTIPLY TABLE1-NUM (INDEX1 - 2) BY NUM-9V9.                 NC1214.2 44 46 69
   000610         061300 IND-TEST-GF-10-1.                                                NC1214.2
   000611         061400     IF NUM-9V9 EQUAL TO 8.0                                      NC1214.2 69
   000612      1  061500        PERFORM PASS                                              NC1214.2 226
   000613      1  061600        ELSE GO TO IND-FAIL-GF-10.                                NC1214.2 618
   000614         061700     GO TO IND-WRITE-GF-10.                                       NC1214.2 622
   000615         061800 IND-DELETE-GF-10.                                                NC1214.2
   000616         061900     PERFORM DE-LETE.                                             NC1214.2 228
   000617         062000     GO TO IND-WRITE-GF-10.                                       NC1214.2 622
   000618         062100 IND-FAIL-GF-10.                                                  NC1214.2
   000619         062200     PERFORM FAIL.                                                NC1214.2 227
   000620         062300     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000621         062400     MOVE 8.0 TO CORRECT-14V4.                                    NC1214.2 105
   000622         062500 IND-WRITE-GF-10.                                                 NC1214.2
   000623         062600     MOVE "IND-TEST-GF-10" TO PAR-NAME.                           NC1214.2 76
   000624         062700     PERFORM PRINT-DETAIL.                                        NC1214.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 IND-INIT-GF-11.                                                  NC1214.2
   000626         062900     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000627         063000     MOVE "MULTIPLY BY" TO FEATURE.                               NC1214.2 72
   000628         063100     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000629         063200     SET INDEX1 TO 2.                                             NC1214.2 46
   000630         063300     SET INDEX2 TO 5.                                             NC1214.2 50
   000631         063400 IND-TEST-GF-11-0.                                                NC1214.2
   000632         063500     MULTIPLY TABLE1-NUM (INDEX1 - 1) BY TABLE2-NUM (INDEX2 + 1). NC1214.2 44 46 48 50
   000633         063600 IND-TEST-GF-11-1.                                                NC1214.2
   000634         063700     IF TABLE2-NUM (INDEX2 + 1) EQUAL TO 4.8                      NC1214.2 48 50
   000635      1  063800        PERFORM PASS                                              NC1214.2 226
   000636      1  063900        ELSE GO TO IND-FAIL-GF-11.                                NC1214.2 641
   000637         064000     GO TO IND-WRITE-GF-11.                                       NC1214.2 645
   000638         064100 IND-DELETE-GF-11.                                                NC1214.2
   000639         064200     PERFORM DE-LETE.                                             NC1214.2 228
   000640         064300     GO TO IND-WRITE-GF-11.                                       NC1214.2 645
   000641         064400 IND-FAIL-GF-11.                                                  NC1214.2
   000642         064500     PERFORM FAIL.                                                NC1214.2 227
   000643         064600     MOVE TABLE2-NUM (INDEX2 + 1) TO COMPUTED-14V4.               NC1214.2 48 50 92
   000644         064700     MOVE 4.8 TO CORRECT-14V4.                                    NC1214.2 105
   000645         064800 IND-WRITE-GF-11.                                                 NC1214.2
   000646         064900     MOVE "IND-TEST-GF-11" TO PAR-NAME.                           NC1214.2 76
   000647         065000     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000648         065100 IND-INIT-GF-12.                                                  NC1214.2
   000649         065200     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000650         065300     MOVE "MULTIPLY BY GIVING" TO FEATURE.                        NC1214.2 72
   000651         065400     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000652         065500     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   000653         065600     SET INDEX1 TO 6.                                             NC1214.2 46
   000654         065700     SET INDEX2 TO 3.                                             NC1214.2 50
   000655         065800 IND-TEST-GF-12-0.                                                NC1214.2
   000656         065900     MULTIPLY TABLE1-NUM (INDEX1 - 2) BY TABLE2-NUM (INDEX2 - 2)  NC1214.2 44 46 48 50
   000657         066000        GIVING NUM-9V9.                                           NC1214.2 69
   000658         066100 IND-TEST-GF-12-1.                                                NC1214.2
   000659         066200     IF NUM-9V9 EQUAL TO 3.0                                      NC1214.2 69
   000660      1  066300        PERFORM PASS                                              NC1214.2 226
   000661      1  066400        ELSE GO TO IND-FAIL-GF-12.                                NC1214.2 666
   000662         066500     GO TO IND-WRITE-GF-12.                                       NC1214.2 670
   000663         066600 IND-DELETE-GF-12.                                                NC1214.2
   000664         066700     PERFORM DE-LETE.                                             NC1214.2 228
   000665         066800     GO TO IND-WRITE-GF-12.                                       NC1214.2 670
   000666         066900 IND-FAIL-GF-12.                                                  NC1214.2
   000667         067000     PERFORM FAIL.                                                NC1214.2 227
   000668         067100     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000669         067200     MOVE 3.0 TO CORRECT-14V4.                                    NC1214.2 105
   000670         067300 IND-WRITE-GF-12.                                                 NC1214.2
   000671         067400     MOVE "IND-TEST-GF-12" TO PAR-NAME.                           NC1214.2 76
   000672         067500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000673         067600 IND-INIT-GF-13.                                                  NC1214.2
   000674         067700     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000675         067800     MOVE "MULTIPLY BY GIVING" TO FEATURE.                        NC1214.2 72
   000676         067900     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000677         068000     MOVE ZERO TO TABLE3.                                         NC1214.2 IMP 51
   000678         068100     SET INDEX1 TO 1.                                             NC1214.2 46
   000679         068200     SET INDEX2 TO 3.                                             NC1214.2 50
   000680         068300     SET INDEX3 TO 1.                                             NC1214.2 54
   000681         068400 IND-TEST-GF-13-0.                                                NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     MULTIPLY TABLE1-NUM (INDEX1 + 2) BY TABLE2-NUM (INDEX2 - 1)  NC1214.2 44 46 48 50
   000683         068600        GIVING TABLE3-NUM (INDEX3 + 1).                           NC1214.2 52 54
   000684         068700 IND-TEST-GF-13-1.                                                NC1214.2
   000685         068800     IF TABLE3-NUM (INDEX3 + 1) EQUAL TO 42.0                     NC1214.2 52 54
   000686      1  068900        PERFORM PASS                                              NC1214.2 226
   000687      1  069000        ELSE GO TO IND-FAIL-GF-13.                                NC1214.2 692
   000688         069100     GO TO IND-WRITE-GF-13.                                       NC1214.2 696
   000689         069200 IND-DELETE-GF-13.                                                NC1214.2
   000690         069300     PERFORM DE-LETE.                                             NC1214.2 228
   000691         069400     GO TO IND-WRITE-GF-13.                                       NC1214.2 696
   000692         069500 IND-FAIL-GF-13.                                                  NC1214.2
   000693         069600     PERFORM FAIL.                                                NC1214.2 227
   000694         069700     MOVE TABLE3-NUM (INDEX3 + 1) TO COMPUTED-14V4.               NC1214.2 52 54 92
   000695         069800     MOVE 42.0 TO CORRECT-14V4.                                   NC1214.2 105
   000696         069900 IND-WRITE-GF-13.                                                 NC1214.2
   000697         070000     MOVE "IND-TEST-GF-13" TO PAR-NAME.                           NC1214.2 76
   000698         070100     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000699         070200 IND-INIT-GF-14.                                                  NC1214.2
   000700         070300     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000701         070400     MOVE "DIVIDE INTO" TO FEATURE.                               NC1214.2 72
   000702         070500     MOVE 9.0 TO NUM-9V9.                                         NC1214.2 69
   000703         070600     SET INDEX1 TO 4.                                             NC1214.2 46
   000704         070700 IND-TEST-GF-14-0.                                                NC1214.2
   000705         070800     DIVIDE TABLE1-NUM (INDEX1) INTO NUM-9V9.                     NC1214.2 44 46 69
   000706         070900 IND-TEST-GF-14-1.                                                NC1214.2
   000707         071000     IF NUM-9V9 EQUAL TO 3.0                                      NC1214.2 69
   000708      1  071100        PERFORM PASS                                              NC1214.2 226
   000709      1  071200        GO TO IND-WRITE-GF-14.                                    NC1214.2 718
   000710         071300     GO TO IND-FAIL-GF-14.                                        NC1214.2 714
   000711         071400 IND-DELETE-GF-14.                                                NC1214.2
   000712         071500     PERFORM DE-LETE.                                             NC1214.2 228
   000713         071600     GO TO IND-WRITE-GF-14.                                       NC1214.2 718
   000714         071700 IND-FAIL-GF-14.                                                  NC1214.2
   000715         071800     PERFORM FAIL.                                                NC1214.2 227
   000716         071900     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000717         072000     MOVE 3.0 TO CORRECT-14V4.                                    NC1214.2 105
   000718         072100 IND-WRITE-GF-14.                                                 NC1214.2
   000719         072200     MOVE "IND-TEST-GF-14" TO PAR-NAME.                           NC1214.2 76
   000720         072300     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000721         072400 IND-INIT-GF-15.                                                  NC1214.2
   000722         072500     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000723         072600     MOVE "DIVIDE ROUNDED" TO FEATURE.                            NC1214.2 72
   000724         072700     MOVE 8.1 TO NUM-9V9.                                         NC1214.2 69
   000725         072800     SET INDEX1 TO 9.                                             NC1214.2 46
   000726         072900 IND-TEST-GF-15-0.                                                NC1214.2
   000727         073000     DIVIDE TABLE1-NUM (INDEX1) INTO NUM-9V9 ROUNDED.             NC1214.2 44 46 69
   000728         073100 IND-TEST-GF-15-1.                                                NC1214.2
   000729         073200     IF NUM-9V9 EQUAL TO 1.6                                      NC1214.2 69
   000730      1  073300        PERFORM PASS                                              NC1214.2 226
   000731      1  073400        GO TO IND-WRITE-GF-15.                                    NC1214.2 740
   000732         073500     GO TO IND-FAIL-GF-15.                                        NC1214.2 736
   000733         073600 IND-DELETE-GF-15.                                                NC1214.2
   000734         073700     PERFORM DE-LETE.                                             NC1214.2 228
   000735         073800     GO TO IND-WRITE-GF-15.                                       NC1214.2 740
   000736         073900 IND-FAIL-GF-15.                                                  NC1214.2
   000737         074000     PERFORM FAIL.                                                NC1214.2 227
   000738         074100     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     MOVE 1.6 TO CORRECT-14V4.                                    NC1214.2 105
   000740         074300 IND-WRITE-GF-15.                                                 NC1214.2
   000741         074400     MOVE "IND-TEST-GF-15" TO PAR-NAME.                           NC1214.2 76
   000742         074500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000743         074600 IND-INIT-GF-16.                                                  NC1214.2
   000744         074700     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000745         074800     MOVE "DIVIDE ON SIZE ERROR" TO FEATURE.                      NC1214.2 72
   000746         074900     MOVE 9.9 TO NUM-9V9.                                         NC1214.2 69
   000747         075000     SET INDEX1 TO 8.                                             NC1214.2 46
   000748         075100 IND-TEST-GF-16-1.                                                NC1214.2
   000749         075200     DIVIDE TABLE1-NUM (INDEX1) INTO NUM-9V9 ON SIZE ERROR        NC1214.2 44 46 69
   000750      1  075300        PERFORM PASS                                              NC1214.2 226
   000751      1  075400        GO TO IND-WRITE-GF-16-1.                                  NC1214.2 760
   000752         075500     GO TO IND-FAIL-GF-16-1.                                      NC1214.2 756
   000753         075600 IND-DELETE-GF-16-1.                                              NC1214.2
   000754         075700     PERFORM DE-LETE.                                             NC1214.2 228
   000755         075800     GO TO IND-WRITE-GF-16-1.                                     NC1214.2 760
   000756         075900 IND-FAIL-GF-16-1.                                                NC1214.2
   000757         076000     PERFORM FAIL.                                                NC1214.2 227
   000758         076100     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000759         076200     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC1214.2 81
   000760         076300 IND-WRITE-GF-16-1.                                               NC1214.2
   000761         076400     MOVE "IND-TEST-GF-16-1" TO PAR-NAME.                         NC1214.2 76
   000762         076500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000763         076600 IND-TEST-GF-16-2.                                                NC1214.2
   000764         076700     MOVE 9.9 TO NUM-9V9.                                         NC1214.2 69
   000765         076800     IF      NUM-9V9 = 9.9                                        NC1214.2 69
   000766      1  076900             PERFORM PASS                                         NC1214.2 226
   000767      1  077000             GO TO   IND-WRITE-GF-16-2.                           NC1214.2 777
   000768         077100     GO TO   IND-FAIL-GF-16-2.                                    NC1214.2 772
   000769         077200 IND-DELETE-GF-16-2.                                              NC1214.2
   000770         077300     PERFORM DE-LETE.                                             NC1214.2 228
   000771         077400     GO TO IND-WRITE-GF-16-2.                                     NC1214.2 777
   000772         077500 IND-FAIL-GF-16-2.                                                NC1214.2
   000773         077600     PERFORM FAIL.                                                NC1214.2 227
   000774         077700     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000775         077800     MOVE 9.9 TO CORRECT-14V4.                                    NC1214.2 105
   000776         077900     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1214.2 81
   000777         078000 IND-WRITE-GF-16-2.                                               NC1214.2
   000778         078100     MOVE "IND-TEST-GF-16-2" TO PAR-NAME.                         NC1214.2 76
   000779         078200     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000780         078300 IND-INIT-GF-17.                                                  NC1214.2
   000781         078400     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000782         078500     MOVE "DIVIDE INTO" TO FEATURE.                               NC1214.2 72
   000783         078600     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000784         078700     SET INDEX1 TO 4.                                             NC1214.2 46
   000785         078800     SET INDEX2 TO 2.                                             NC1214.2 50
   000786         078900 IND-TEST-GF-17-0.                                                NC1214.2
   000787         079000     DIVIDE TABLE1-NUM (INDEX1) INTO TABLE2-NUM (INDEX2).         NC1214.2 44 46 48 50
   000788         079100 IND-TEST-GF-17-1.                                                NC1214.2
   000789         079200     IF TABLE2-NUM (INDEX2) EQUAL TO 2.0                          NC1214.2 48 50
   000790      1  079300        PERFORM PASS                                              NC1214.2 226
   000791      1  079400        GO TO IND-WRITE-GF-17.                                    NC1214.2 800
   000792         079500     GO TO IND-FAIL-GF-17.                                        NC1214.2 796
   000793         079600 IND-DELETE-GF-17.                                                NC1214.2
   000794         079700     PERFORM DE-LETE.                                             NC1214.2 228
   000795         079800     GO TO IND-WRITE-GF-17.                                       NC1214.2 800
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900 IND-FAIL-GF-17.                                                  NC1214.2
   000797         080000     PERFORM FAIL.                                                NC1214.2 227
   000798         080100     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000799         080200     MOVE 2.0 TO CORRECT-14V4.                                    NC1214.2 105
   000800         080300 IND-WRITE-GF-17.                                                 NC1214.2
   000801         080400     MOVE "IND-TEST-GF-17" TO PAR-NAME.                           NC1214.2 76
   000802         080500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000803         080600 IND-INIT-GF-18.                                                  NC1214.2
   000804         080700     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000805         080800     MOVE "DIVIDE ROUNDED" TO FEATURE.                            NC1214.2 72
   000806         080900     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000807         081000     SET INDEX1 TO 9.                                             NC1214.2 46
   000808         081100     SET INDEX2 TO 5.                                             NC1214.2 50
   000809         081200 IND-TEST-GF-18-0.                                                NC1214.2
   000810         081300     DIVIDE TABLE1-NUM (INDEX1) INTO TABLE2-NUM (INDEX2) ROUNDED. NC1214.2 44 46 48 50
   000811         081400 IND-TEST-GF-18-1.                                                NC1214.2
   000812         081500     IF TABLE2-NUM (INDEX2) EQUAL TO 1.9                          NC1214.2 48 50
   000813      1  081600        PERFORM PASS                                              NC1214.2 226
   000814      1  081700        GO TO IND-WRITE-GF-18.                                    NC1214.2 823
   000815         081800     GO TO IND-FAIL-GF-18.                                        NC1214.2 819
   000816         081900 IND-DELETE-GF-18.                                                NC1214.2
   000817         082000     PERFORM DE-LETE.                                             NC1214.2 228
   000818         082100     GO TO IND-WRITE-GF-18.                                       NC1214.2 823
   000819         082200 IND-FAIL-GF-18.                                                  NC1214.2
   000820         082300     PERFORM FAIL.                                                NC1214.2 227
   000821         082400     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000822         082500     MOVE 1.9 TO CORRECT-14V4.                                    NC1214.2 105
   000823         082600 IND-WRITE-GF-18.                                                 NC1214.2
   000824         082700     MOVE "IND-TEST-GF-18" TO PAR-NAME.                           NC1214.2 76
   000825         082800     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000826         082900 IND-INIT-GF-19.                                                  NC1214.2
   000827         083000     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000828         083100     MOVE "DIVIDE ON SIZE ERROR" TO FEATURE.                      NC1214.2 72
   000829         083200     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000830         083300     SET INDEX1 TO 8.                                             NC1214.2 46
   000831         083400     SET INDEX2 TO 5.                                             NC1214.2 50
   000832         083500 IND-TEST-GF-19-1.                                                NC1214.2
   000833         083600     DIVIDE TABLE1-NUM (INDEX1) INTO TABLE2-NUM (INDEX2)          NC1214.2 44 46 48 50
   000834         083700        ON SIZE ERROR                                             NC1214.2
   000835      1  083800        PERFORM PASS                                              NC1214.2 226
   000836      1  083900        GO TO IND-WRITE-GF-19-1.                                  NC1214.2 845
   000837         084000     GO TO IND-FAIL-GF-19-1.                                      NC1214.2 841
   000838         084100 IND-DELETE-GF-19-1.                                              NC1214.2
   000839         084200     PERFORM DE-LETE.                                             NC1214.2 228
   000840         084300     GO TO IND-WRITE-GF-19-1.                                     NC1214.2 845
   000841         084400 IND-FAIL-GF-19-1.                                                NC1214.2
   000842         084500     PERFORM FAIL.                                                NC1214.2 227
   000843         084600     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000844         084700     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1214.2 81
   000845         084800 IND-WRITE-GF-19-1.                                               NC1214.2
   000846         084900     MOVE "IND-TEST-GF-19-1" TO PAR-NAME.                         NC1214.2 76
   000847         085000     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000848         085100 IND-TEST-GF-19-2.                                                NC1214.2
   000849         085200     IF      TABLE2-NUM (INDEX2) = 9.7                            NC1214.2 48 50
   000850      1  085300             PERFORM PASS                                         NC1214.2 226
   000851      1  085400             GO TO   IND-WRITE-GF-19-2.                           NC1214.2 861
   000852         085500     GO TO   IND-FAIL-GF-19-2.                                    NC1214.2 856
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600 IND-DELETE-GF-19-2.                                              NC1214.2
   000854         085700     PERFORM DE-LETE.                                             NC1214.2 228
   000855         085800     GO TO   IND-WRITE-GF-19-2.                                   NC1214.2 861
   000856         085900 IND-FAIL-GF-19-2.                                                NC1214.2
   000857         086000     PERFORM FAIL.                                                NC1214.2 227
   000858         086100     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1214.2 48 50 92
   000859         086200     MOVE  9.7 TO CORRECT-14V4.                                   NC1214.2 105
   000860         086300     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1214.2 81
   000861         086400 IND-WRITE-GF-19-2.                                               NC1214.2
   000862         086500     MOVE "IND-TEST-GF-19-2" TO PAR-NAME.                         NC1214.2 76
   000863         086600     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000864         086700 IND-INIT-GF-22.                                                  NC1214.2
   000865         086800     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000866         086900     MOVE "DIVIDE INTO GIVING" TO FEATURE.                        NC1214.2 72
   000867         087000     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   000868         087100     SET INDEX1 TO 4.                                             NC1214.2 46
   000869         087200 IND-TEST-GF-22-0.                                                NC1214.2
   000870         087300     DIVIDE 3 INTO TABLE1-NUM (INDEX1) GIVING NUM-9V9.            NC1214.2 44 46 69
   000871         087400 IND-TEST-GF-22-1.                                                NC1214.2
   000872         087500     IF NUM-9V9 EQUAL TO 1.0                                      NC1214.2 69
   000873      1  087600        PERFORM PASS                                              NC1214.2 226
   000874      1  087700        GO TO IND-WRITE-GF-22.                                    NC1214.2 883
   000875         087800     GO TO IND-FAIL-GF-22.                                        NC1214.2 879
   000876         087900 IND-DELETE-GF-22.                                                NC1214.2
   000877         088000     PERFORM DE-LETE.                                             NC1214.2 228
   000878         088100     GO TO IND-WRITE-GF-22.                                       NC1214.2 883
   000879         088200 IND-FAIL-GF-22.                                                  NC1214.2
   000880         088300     PERFORM FAIL.                                                NC1214.2 227
   000881         088400     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000882         088500     MOVE 1.0 TO CORRECT-14V4.                                    NC1214.2 105
   000883         088600 IND-WRITE-GF-22.                                                 NC1214.2
   000884         088700     MOVE "IND-TEST-GF-22" TO PAR-NAME.                           NC1214.2 76
   000885         088800     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000886         088900 IND-INIT-GF-23.                                                  NC1214.2
   000887         089000     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000888         089100     MOVE "DIVIDE INTO GIVING" TO FEATURE.                        NC1214.2 72
   000889         089200     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000890         089300     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   000891         089400     SET INDEX1 TO 4.                                             NC1214.2 46
   000892         089500     SET INDEX2 TO 2.                                             NC1214.2 50
   000893         089600 IND-TEST-GF-23-0.                                                NC1214.2
   000894         089700     DIVIDE TABLE1-NUM (INDEX1) INTO TABLE2-NUM (INDEX2)          NC1214.2 44 46 48 50
   000895         089800        GIVING NUM-9V9.                                           NC1214.2 69
   000896         089900 IND-TEST-GF-23-1.                                                NC1214.2
   000897         090000     IF NUM-9V9 EQUAL TO 2.0                                      NC1214.2 69
   000898      1  090100        PERFORM PASS                                              NC1214.2 226
   000899      1  090200        GO TO IND-WRITE-GF-23.                                    NC1214.2 908
   000900         090300     GO TO IND-FAIL-GF-23.                                        NC1214.2 904
   000901         090400 IND-DELETE-GF-23.                                                NC1214.2
   000902         090500     PERFORM DE-LETE.                                             NC1214.2 228
   000903         090600     GO TO IND-WRITE-GF-23.                                       NC1214.2 908
   000904         090700 IND-FAIL-GF-23.                                                  NC1214.2
   000905         090800     PERFORM FAIL.                                                NC1214.2 227
   000906         090900     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000907         091000     MOVE 2.0 TO CORRECT-14V4.                                    NC1214.2 105
   000908         091100 IND-WRITE-GF-23.                                                 NC1214.2
   000909         091200     MOVE "IND-TEST-GF-23" TO PAR-NAME.                           NC1214.2 76
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000911         091400 IND-INIT-GF-24.                                                  NC1214.2
   000912         091500     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000913         091600     MOVE "DIVIDE INTO GIVING" TO FEATURE.                        NC1214.2 72
   000914         091700     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000915         091800     MOVE ZERO TO TABLE3.                                         NC1214.2 IMP 51
   000916         091900     SET INDEX1 TO 4.                                             NC1214.2 46
   000917         092000     SET INDEX2 TO 2.                                             NC1214.2 50
   000918         092100     SET INDEX3 TO 3.                                             NC1214.2 54
   000919         092200 IND-TEST-GF-24-0.                                                NC1214.2
   000920         092300     DIVIDE TABLE1-NUM (INDEX1) INTO TABLE2-NUM (INDEX2)          NC1214.2 44 46 48 50
   000921         092400        GIVING TABLE3-NUM (INDEX3).                               NC1214.2 52 54
   000922         092500 IND-TEST-GF-24-1.                                                NC1214.2
   000923         092600     IF TABLE3-NUM (INDEX3) EQUAL TO 2.0                          NC1214.2 52 54
   000924      1  092700        PERFORM PASS                                              NC1214.2 226
   000925      1  092800        GO TO IND-WRITE-GF-24.                                    NC1214.2 934
   000926         092900     GO TO IND-FAIL-GF-24.                                        NC1214.2 930
   000927         093000 IND-DELETE-GF-24.                                                NC1214.2
   000928         093100     PERFORM DE-LETE.                                             NC1214.2 228
   000929         093200     GO TO IND-WRITE-GF-24.                                       NC1214.2 934
   000930         093300 IND-FAIL-GF-24.                                                  NC1214.2
   000931         093400     PERFORM FAIL.                                                NC1214.2 227
   000932         093500     MOVE TABLE3-NUM (INDEX3) TO COMPUTED-14V4.                   NC1214.2 52 54 92
   000933         093600     MOVE 2.0 TO CORRECT-14V4.                                    NC1214.2 105
   000934         093700 IND-WRITE-GF-24.                                                 NC1214.2
   000935         093800     MOVE "IND-TEST-GF-24" TO PAR-NAME.                           NC1214.2 76
   000936         093900     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000937         094000 IND-INIT-GF-25.                                                  NC1214.2
   000938         094100     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000939         094200     MOVE "DIVIDE INTO" TO FEATURE.                               NC1214.2 72
   000940         094300     PERFORM BUILD-TABLE4.                                        NC1214.2 350
   000941         094400     SET INDEX4-1 TO 3.                                           NC1214.2 57
   000942         094500     SET INDEX4-2 TO 1.                                           NC1214.2 60
   000943         094600 IND-TEST-GF-25-0.                                                NC1214.2
   000944         094700     DIVIDE TABLE4-NUM2 (1  2) INTO                               NC1214.2 58
   000945         094800        TABLE4-NUM2 (INDEX4-1  INDEX4-2).                         NC1214.2 58 57 60
   000946         094900 IND-TEST-GF-25-1.                                                NC1214.2
   000947         095000     IF TABLE4-NUM2 (INDEX4-1  INDEX4-2) EQUAL TO 7               NC1214.2 58 57 60
   000948      1  095100        PERFORM PASS                                              NC1214.2 226
   000949      1  095200        GO TO IND-WRITE-GF-25.                                    NC1214.2 958
   000950         095300     GO TO IND-FAIL-GF-25.                                        NC1214.2 954
   000951         095400 IND-DELETE-GF-25.                                                NC1214.2
   000952         095500     PERFORM DE-LETE.                                             NC1214.2 228
   000953         095600     GO TO IND-WRITE-GF-25.                                       NC1214.2 958
   000954         095700 IND-FAIL-GF-25.                                                  NC1214.2
   000955         095800     PERFORM FAIL.                                                NC1214.2 227
   000956         095900     MOVE TABLE4-NUM2 (INDEX4-1  INDEX4-2) TO COMPUTED-14V4.      NC1214.2 58 57 60 92
   000957         096000     MOVE 7 TO CORRECT-14V4.                                      NC1214.2 105
   000958         096100 IND-WRITE-GF-25.                                                 NC1214.2
   000959         096200     MOVE "IND-TEST-GF-25" TO PAR-NAME.                           NC1214.2 76
   000960         096300     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000961         096400 IND-INIT-GF-20.                                                  NC1214.2
   000962         096500     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000963         096600     MOVE "DIVIDE INTO" TO FEATURE.                               NC1214.2 72
   000964         096700     MOVE 9.5 TO NUM-9V9.                                         NC1214.2 69
   000965         096800     SET INDEX1 TO 8.                                             NC1214.2 46
   000966         096900 IND-TEST-GF-20-0.                                                NC1214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     DIVIDE TABLE1-NUM (INDEX1 + 1) INTO NUM-9V9.                 NC1214.2 44 46 69
   000968         097100 IND-TEST-GF-20-1.                                                NC1214.2
   000969         097200     IF NUM-9V9 EQUAL TO 1.9                                      NC1214.2 69
   000970      1  097300        PERFORM PASS                                              NC1214.2 226
   000971      1  097400        GO TO IND-WRITE-GF-20.                                    NC1214.2 980
   000972         097500     GO TO IND-FAIL-GF-20.                                        NC1214.2 976
   000973         097600 IND-DELETE-GF-20.                                                NC1214.2
   000974         097700     PERFORM DE-LETE.                                             NC1214.2 228
   000975         097800     GO TO IND-WRITE-GF-20.                                       NC1214.2 980
   000976         097900 IND-FAIL-GF-20.                                                  NC1214.2
   000977         098000     PERFORM FAIL.                                                NC1214.2 227
   000978         098100     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   000979         098200     MOVE 1.9 TO CORRECT-14V4.                                    NC1214.2 105
   000980         098300 IND-WRITE-GF-20.                                                 NC1214.2
   000981         098400     MOVE "IND-TEST-GF-20" TO PAR-NAME.                           NC1214.2 76
   000982         098500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   000983         098600 IND-INIT-GF-21.                                                  NC1214.2
   000984         098700     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   000985         098800     MOVE "DIVIDE INTO" TO FEATURE.                               NC1214.2 72
   000986         098900     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   000987         099000     SET INDEX1 TO 6.                                             NC1214.2 46
   000988         099100     SET INDEX2 TO 4.                                             NC1214.2 50
   000989         099200 IND-TEST-GF-21-0.                                                NC1214.2
   000990         099300     DIVIDE TABLE1-NUM (INDEX1 - 2) INTO                          NC1214.2 44 46
   000991         099400        TABLE2-NUM (INDEX2 + 2).                                  NC1214.2 48 50
   000992         099500 IND-TEST-GF-21-1.                                                NC1214.2
   000993         099600     IF TABLE2-NUM (INDEX2 + 2) EQUAL TO .4                       NC1214.2 48 50
   000994      1  099700        PERFORM PASS                                              NC1214.2 226
   000995      1  099800        GO TO IND-WRITE-GF-21.                                    NC1214.2 1004
   000996         099900     GO TO IND-FAIL-GF-21.                                        NC1214.2 1000
   000997         100000 IND-DELETE-GF-21.                                                NC1214.2
   000998         100100     PERFORM DE-LETE.                                             NC1214.2 228
   000999         100200     GO TO IND-WRITE-GF-21.                                       NC1214.2 1004
   001000         100300 IND-FAIL-GF-21.                                                  NC1214.2
   001001         100400     PERFORM FAIL.                                                NC1214.2 227
   001002         100500     MOVE TABLE2-NUM (INDEX2 + 2) TO COMPUTED-14V4.               NC1214.2 48 50 92
   001003         100600     MOVE .4 TO CORRECT-14V4.                                     NC1214.2 105
   001004         100700 IND-WRITE-GF-21.                                                 NC1214.2
   001005         100800     MOVE "IND-TEST-GF-21" TO PAR-NAME.                           NC1214.2 76
   001006         100900     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001007         101000 IND-INIT-GF-26.                                                  NC1214.2
   001008         101100     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001009         101200     MOVE "DIVIDE INTO GIVING" TO FEATURE.                        NC1214.2 72
   001010         101300     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   001011         101400     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   001012         101500     SET INDEX1 TO 6.                                             NC1214.2 46
   001013         101600     SET INDEX2 TO 1.                                             NC1214.2 50
   001014         101700 IND-TEST-GF-26-0.                                                NC1214.2
   001015         101800     DIVIDE TABLE1-NUM (INDEX1 - 2) INTO                          NC1214.2 44 46
   001016         101900        TABLE2-NUM (INDEX2 + 1) GIVING NUM-9V9.                   NC1214.2 48 50 69
   001017         102000 IND-TEST-GF-26-1.                                                NC1214.2
   001018         102100     IF NUM-9V9 EQUAL TO 2.0                                      NC1214.2 69
   001019      1  102200        PERFORM PASS                                              NC1214.2 226
   001020      1  102300        GO TO IND-WRITE-GF-26.                                    NC1214.2 1029
   001021         102400     GO TO IND-FAIL-GF-26.                                        NC1214.2 1025
   001022         102500 IND-DELETE-GF-26.                                                NC1214.2
   001023         102600     PERFORM DE-LETE.                                             NC1214.2 228
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     GO TO IND-WRITE-GF-26.                                       NC1214.2 1029
   001025         102800 IND-FAIL-GF-26.                                                  NC1214.2
   001026         102900     PERFORM FAIL.                                                NC1214.2 227
   001027         103000     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   001028         103100     MOVE 2.0 TO CORRECT-14V4.                                    NC1214.2 105
   001029         103200 IND-WRITE-GF-26.                                                 NC1214.2
   001030         103300     MOVE "IND-TEST-GF-26" TO PAR-NAME.                           NC1214.2 76
   001031         103400     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001032         103500 IND-INIT-GF-27.                                                  NC1214.2
   001033         103600     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001034         103700     MOVE "DIVIDE INTO GIVING" TO FEATURE.                        NC1214.2 72
   001035         103800     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   001036         103900     MOVE ZERO TO TABLE3.                                         NC1214.2 IMP 51
   001037         104000     SET INDEX1 TO 8.                                             NC1214.2 46
   001038         104100     SET INDEX2 TO 1.                                             NC1214.2 50
   001039         104200     SET INDEX3 TO 4.                                             NC1214.2 54
   001040         104300 IND-TEST-GF-27-0.                                                NC1214.2
   001041         104400     DIVIDE TABLE1-NUM (INDEX1 - 2) INTO                          NC1214.2 44 46
   001042         104500        TABLE2-NUM (INDEX2 + 1) GIVING TABLE3-NUM (INDEX3 - 1).   NC1214.2 48 50 52 54
   001043         104600 IND-TEST-GF-27-1.                                                NC1214.2
   001044         104700     IF TABLE3-NUM (INDEX3 - 1) EQUAL TO 4                        NC1214.2 52 54
   001045      1  104800        PERFORM PASS                                              NC1214.2 226
   001046      1  104900        GO TO IND-WRITE-GF-27.                                    NC1214.2 1055
   001047         105000     GO TO IND-FAIL-GF-27.                                        NC1214.2 1051
   001048         105100 IND-DELETE-GF-27.                                                NC1214.2
   001049         105200     PERFORM DE-LETE.                                             NC1214.2 228
   001050         105300     GO TO IND-WRITE-GF-27.                                       NC1214.2 1055
   001051         105400 IND-FAIL-GF-27.                                                  NC1214.2
   001052         105500     PERFORM FAIL.                                                NC1214.2 227
   001053         105600     MOVE TABLE3-NUM (INDEX3 - 1) TO COMPUTED-14V4.               NC1214.2 52 54 92
   001054         105700     MOVE 4.0 TO CORRECT-14V4.                                    NC1214.2 105
   001055         105800 IND-WRITE-GF-27.                                                 NC1214.2
   001056         105900     MOVE "IND-TEST-GF-27" TO PAR-NAME.                           NC1214.2 76
   001057         106000     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001058         106100 IND-INIT-GF-28.                                                  NC1214.2
   001059         106200     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001060         106300     MOVE "DIVIDE BY GIVING" TO FEATURE.                          NC1214.2 72
   001061         106400     PERFORM BUILD-TABLE4.                                        NC1214.2 350
   001062         106500     SET INDEX4-1 TO 2.                                           NC1214.2 57
   001063         106600     SET INDEX4-2 TO 1.                                           NC1214.2 60
   001064         106700 IND-TEST-GF-28-0.                                                NC1214.2
   001065         106800     DIVIDE TABLE4-NUM2 (INDEX4-1  INDEX4-2) BY                   NC1214.2 58 57 60
   001066         106900        TABLE4-NUM2 (1  3) GIVING TABLE4-NUM2 (3  3).             NC1214.2 58 58
   001067         107000 IND-TEST-GF-28-1.                                                NC1214.2
   001068         107100     IF TABLE4-NUM2 (3  3) EQUAL TO 4                             NC1214.2 58
   001069      1  107200        PERFORM PASS                                              NC1214.2 226
   001070      1  107300        GO TO IND-WRITE-GF-28.                                    NC1214.2 1079
   001071         107400     GO TO IND-FAIL-GF-28.                                        NC1214.2 1075
   001072         107500 IND-DELETE-GF-28.                                                NC1214.2
   001073         107600     PERFORM DE-LETE.                                             NC1214.2 228
   001074         107700     GO TO IND-WRITE-GF-28.                                       NC1214.2 1079
   001075         107800 IND-FAIL-GF-28.                                                  NC1214.2
   001076         107900     PERFORM FAIL.                                                NC1214.2 227
   001077         108000     MOVE TABLE4-NUM2 (3  3) TO COMPUTED-14V4.                    NC1214.2 58 92
   001078         108100     MOVE 4.0 TO CORRECT-14V4.                                    NC1214.2 105
   001079         108200 IND-WRITE-GF-28.                                                 NC1214.2
   001080         108300     MOVE "IND-TEST-GF-28" TO PAR-NAME.                           NC1214.2 76
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001082         108500 IND-INIT-GF-29.                                                  NC1214.2
   001083         108600     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001084         108700     MOVE "DIVIDE BY GIVING" TO FEATURE.                          NC1214.2 72
   001085         108800     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   001086         108900     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   001087         109000     SET INDEX2 TO 2.                                             NC1214.2 50
   001088         109100 IND-TEST-GF-29-0.                                                NC1214.2
   001089         109200     DIVIDE TABLE2-NUM (INDEX2) BY TABLE2-NUM (INDEX2 + 1)        NC1214.2 48 50 48 50
   001090         109300        GIVING NUM-9V9.                                           NC1214.2 69
   001091         109400 IND-TEST-GF-29-1.                                                NC1214.2
   001092         109500     IF NUM-9V9 EQUAL TO 2.0                                      NC1214.2 69
   001093      1  109600        PERFORM PASS                                              NC1214.2 226
   001094      1  109700        GO TO IND-WRITE-GF-29.                                    NC1214.2 1103
   001095         109800     GO TO IND-FAIL-GF-29.                                        NC1214.2 1099
   001096         109900 IND-DELETE-GF-29.                                                NC1214.2
   001097         110000     PERFORM DE-LETE.                                             NC1214.2 228
   001098         110100     GO TO IND-WRITE-GF-29.                                       NC1214.2 1103
   001099         110200 IND-FAIL-GF-29.                                                  NC1214.2
   001100         110300     PERFORM FAIL.                                                NC1214.2 227
   001101         110400     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   001102         110500     MOVE 2.0 TO CORRECT-14V4.                                    NC1214.2 105
   001103         110600 IND-WRITE-GF-29.                                                 NC1214.2
   001104         110700     MOVE "IND-TEST-GF-29" TO PAR-NAME.                           NC1214.2 76
   001105         110800     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001106         110900 IND-INIT-GF-30.                                                  NC1214.2
   001107         111000     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001108         111100     MOVE "DIVIDE BY GIVING" TO FEATURE.                          NC1214.2 72
   001109         111200     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   001110         111300     SET INDEX2 TO 6.                                             NC1214.2 50
   001111         111400 IND-TEST-GF-30-0.                                                NC1214.2
   001112         111500     DIVIDE TABLE2-NUM (INDEX2) BY TABLE2-NUM (INDEX2 - 3)        NC1214.2 48 50 48 50
   001113         111600        GIVING TABLE2-NUM (INDEX2 - 1).                           NC1214.2 48 50
   001114         111700 IND-TEST-GF-30-1.                                                NC1214.2
   001115         111800     IF TABLE2-NUM (INDEX2 - 1) EQUAL TO 0.4                      NC1214.2 48 50
   001116      1  111900        PERFORM PASS                                              NC1214.2 226
   001117      1  112000        GO TO IND-WRITE-GF-30.                                    NC1214.2 1126
   001118         112100     GO TO IND-FAIL-GF-30.                                        NC1214.2 1122
   001119         112200 IND-DELETE-GF-30.                                                NC1214.2
   001120         112300     PERFORM DE-LETE.                                             NC1214.2 228
   001121         112400     GO TO IND-WRITE-GF-30.                                       NC1214.2 1126
   001122         112500 IND-FAIL-GF-30.                                                  NC1214.2
   001123         112600     PERFORM FAIL.                                                NC1214.2 227
   001124         112700     MOVE TABLE2-NUM (INDEX2 - 1) TO COMPUTED-14V4.               NC1214.2 48 50 92
   001125         112800     MOVE 0.4 TO CORRECT-14V4.                                    NC1214.2 105
   001126         112900 IND-WRITE-GF-30.                                                 NC1214.2
   001127         113000     MOVE "IND-TEST-GF-30" TO PAR-NAME.                           NC1214.2 76
   001128         113100     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001129         113200 IND-INIT-GF-31.                                                  NC1214.2
   001130         113300     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001131         113400     MOVE "DIVIDE BY GIVING" TO FEATURE.                          NC1214.2 72
   001132         113500     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   001133         113600     SET INDEX1 TO 1.                                             NC1214.2 46
   001134         113700 IND-TEST-GF-31-0.                                                NC1214.2
   001135         113800     DIVIDE 8 BY TABLE1-NUM (INDEX1) GIVING NUM-9V9.              NC1214.2 44 46 69
   001136         113900 IND-TEST-GF-31-1.                                                NC1214.2
   001137         114000     IF NUM-9V9 EQUAL TO 2.0                                      NC1214.2 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114100        PERFORM PASS                                              NC1214.2 226
   001139      1  114200        GO TO IND-WRITE-GF-31.                                    NC1214.2 1148
   001140         114300     GO TO IND-FAIL-GF-31.                                        NC1214.2 1144
   001141         114400 IND-DELETE-GF-31.                                                NC1214.2
   001142         114500     PERFORM DE-LETE.                                             NC1214.2 228
   001143         114600     GO TO IND-WRITE-GF-31.                                       NC1214.2 1148
   001144         114700 IND-FAIL-GF-31.                                                  NC1214.2
   001145         114800     PERFORM FAIL.                                                NC1214.2 227
   001146         114900     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   001147         115000     MOVE 2.0 TO CORRECT-14V4.                                    NC1214.2 105
   001148         115100 IND-WRITE-GF-31.                                                 NC1214.2
   001149         115200     MOVE "IND-TEST-GF-31" TO PAR-NAME.                           NC1214.2 76
   001150         115300     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001151         115400 IND-INIT-GF-32.                                                  NC1214.2
   001152         115500     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001153         115600     MOVE "DIVIDE BY GIVING" TO FEATURE.                          NC1214.2 72
   001154         115700     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   001155         115800     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   001156         115900     SET INDEX1 TO 3.                                             NC1214.2 46
   001157         116000     SET INDEX2 TO 4.                                             NC1214.2 50
   001158         116100 IND-TEST-GF-32-0.                                                NC1214.2
   001159         116200     DIVIDE TABLE1-NUM (INDEX1) BY TABLE2-NUM (INDEX2)            NC1214.2 44 46 48 50
   001160         116300        GIVING NUM-9V9.                                           NC1214.2 69
   001161         116400 IND-TEST-GF-32-1.                                                NC1214.2
   001162         116500     IF NUM-9V9 EQUAL TO 3.5                                      NC1214.2 69
   001163      1  116600        PERFORM PASS                                              NC1214.2 226
   001164      1  116700        GO TO IND-WRITE-GF-32.                                    NC1214.2 1173
   001165         116800     GO TO IND-FAIL-GF-32.                                        NC1214.2 1169
   001166         116900 IND-DELETE-GF-32.                                                NC1214.2
   001167         117000     PERFORM DE-LETE.                                             NC1214.2 228
   001168         117100     GO TO IND-WRITE-GF-32.                                       NC1214.2 1173
   001169         117200 IND-FAIL-GF-32.                                                  NC1214.2
   001170         117300     PERFORM FAIL.                                                NC1214.2 227
   001171         117400     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1214.2 69 92
   001172         117500     MOVE 3.5 TO CORRECT-14V4.                                    NC1214.2 105
   001173         117600 IND-WRITE-GF-32.                                                 NC1214.2
   001174         117700     MOVE "IND-TEST-GF-32" TO PAR-NAME.                           NC1214.2 76
   001175         117800     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001176         117900 IND-INIT-GF-33.                                                  NC1214.2
   001177         118000     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001178         118100     MOVE "DIVIDE BY GIVING" TO FEATURE.                          NC1214.2 72
   001179         118200     MOVE ZERO TO TABLE3.                                         NC1214.2 IMP 51
   001180         118300     PERFORM BUILD-TABLE2.                                        NC1214.2 343
   001181         118400     SET INDEX1 TO 4.                                             NC1214.2 46
   001182         118500     SET INDEX2 TO 3.                                             NC1214.2 50
   001183         118600     SET INDEX3 TO 2.                                             NC1214.2 54
   001184         118700 IND-TEST-GF-33-0.                                                NC1214.2
   001185         118800     DIVIDE TABLE1-NUM (INDEX1) BY TABLE2-NUM (INDEX2)            NC1214.2 44 46 48 50
   001186         118900        GIVING TABLE3-NUM (INDEX3).                               NC1214.2 52 54
   001187         119000 IND-TEST-GF-33-1.                                                NC1214.2
   001188         119100     IF TABLE3-NUM (INDEX3) EQUAL TO 1.0                          NC1214.2 52 54
   001189      1  119200        PERFORM PASS                                              NC1214.2 226
   001190      1  119300        GO TO IND-WRITE-GF-33.                                    NC1214.2 1199
   001191         119400     GO TO IND-FAIL-GF-33.                                        NC1214.2 1195
   001192         119500 IND-DELETE-GF-33.                                                NC1214.2
   001193         119600     PERFORM DE-LETE.                                             NC1214.2 228
   001194         119700     GO TO IND-WRITE-GF-33.                                       NC1214.2 1199
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800 IND-FAIL-GF-33.                                                  NC1214.2
   001196         119900     PERFORM FAIL.                                                NC1214.2 227
   001197         120000     MOVE TABLE3-NUM (INDEX3) TO COMPUTED-14V4.                   NC1214.2 52 54 92
   001198         120100     MOVE 1.0 TO CORRECT-14V4.                                    NC1214.2 105
   001199         120200 IND-WRITE-GF-33.                                                 NC1214.2
   001200         120300     MOVE "IND-TEST-GF-33" TO PAR-NAME.                           NC1214.2 76
   001201         120400     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001202         120500 IND-INIT-GF-34.                                                  NC1214.2
   001203         120600     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001204         120700     MOVE "PERFORM" TO FEATURE.                                   NC1214.2 72
   001205         120800     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   001206         120900     SET INDEX5 TO 1.                                             NC1214.2 64
   001207         121000 IND-TEST-GF-34-0.                                                NC1214.2
   001208         121100     PERFORM PARAGRAPH-A TABLE5-NUM (INDEX5) TIMES.               NC1214.2 1279 62 64
   001209         121200 IND-TEST-GF-34-1.                                                NC1214.2
   001210         121300     IF NUM-9V9 EQUAL TO 3                                        NC1214.2 69
   001211      1  121400        PERFORM PASS                                              NC1214.2 226
   001212      1  121500        ELSE GO TO IND-FAIL-GF-34.                                NC1214.2 1217
   001213         121600     GO TO IND-WRITE-GF-34.                                       NC1214.2 1221
   001214         121700 IND-DELETE-GF-34.                                                NC1214.2
   001215         121800     PERFORM DE-LETE.                                             NC1214.2 228
   001216         121900     GO TO IND-WRITE-GF-34.                                       NC1214.2 1221
   001217         122000 IND-FAIL-GF-34.                                                  NC1214.2
   001218         122100     PERFORM FAIL.                                                NC1214.2 227
   001219         122200     MOVE NUM-9V9 TO COMPUTED-18V0.                               NC1214.2 69 94
   001220         122300     MOVE 3 TO CORRECT-18V0.                                      NC1214.2 107
   001221         122400 IND-WRITE-GF-34.                                                 NC1214.2
   001222         122500     MOVE "IND-TEST-GF-34" TO PAR-NAME.                           NC1214.2 76
   001223         122600     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001224         122700 IND-INIT-GF-35.                                                  NC1214.2
   001225         122800     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001226         122900     MOVE "PERFORM THRU" TO FEATURE.                              NC1214.2 72
   001227         123000     MOVE ZERO TO NUM-9V9.                                        NC1214.2 IMP 69
   001228         123100     SET INDEX5 TO 2.                                             NC1214.2 64
   001229         123200 IND-TEST-GF-35-0.                                                NC1214.2
   001230         123300     PERFORM PARAGRAPH-A THRU PARAGRAPH-B                         NC1214.2 1279 1281
   001231         123400        TABLE5-NUM (INDEX5) TIMES.                                NC1214.2 62 64
   001232         123500 IND-TEST-GF-35-1.                                                NC1214.2
   001233         123600     IF NUM-9V9 EQUAL TO 4                                        NC1214.2 69
   001234      1  123700        PERFORM PASS                                              NC1214.2 226
   001235      1  123800        ELSE GO TO IND-FAIL-GF-35.                                NC1214.2 1240
   001236         123900     GO TO IND-WRITE-GF-35.                                       NC1214.2 1244
   001237         124000 IND-DELETE-GF-35.                                                NC1214.2
   001238         124100     PERFORM DE-LETE.                                             NC1214.2 228
   001239         124200     GO TO IND-WRITE-GF-35.                                       NC1214.2 1244
   001240         124300 IND-FAIL-GF-35.                                                  NC1214.2
   001241         124400     PERFORM FAIL.                                                NC1214.2 227
   001242         124500     MOVE NUM-9V9 TO COMPUTED-18V0.                               NC1214.2 69 94
   001243         124600     MOVE 4 TO CORRECT-18V0.                                      NC1214.2 107
   001244         124700 IND-WRITE-GF-35.                                                 NC1214.2
   001245         124800     MOVE "IND-TEST-GF-35" TO PAR-NAME.                           NC1214.2 76
   001246         124900     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001247         125000 IND-INIT-GF-36.                                                  NC1214.2
   001248         125100     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001249         125200     MOVE "DISPLAY" TO FEATURE.                                   NC1214.2 72
   001250         125300     MOVE "RESULTS MUST BE" TO RE-MARK.                           NC1214.2 81
   001251         125400     MOVE "LITERAL-01" TO CORRECT-A.                              NC1214.2 101
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     SET INDEX6 TO 1.                                             NC1214.2 68
   001253         125600 IND-TEST-GF-36.                                                  NC1214.2
   001254         125700     DISPLAY "  ".                                                NC1214.2
   001255         125800     DISPLAY TABLE6-REC (INDEX6).                                 NC1214.2 66 68
   001256         125900     PERFORM INSPT.                                               NC1214.2 225
   001257         126000     GO TO IND-WRITE-GF-36.                                       NC1214.2 1260
   001258         126100 IND-DELETE-GF-36.                                                NC1214.2
   001259         126200     PERFORM DE-LETE.                                             NC1214.2 228
   001260         126300 IND-WRITE-GF-36.                                                 NC1214.2
   001261         126400     MOVE "IND-TEST-GF-36" TO PAR-NAME.                           NC1214.2 76
   001262         126500     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001263         126600 IND-INIT-GF-37.                                                  NC1214.2
   001264         126700     MOVE  "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                 NC1214.2 132
   001265         126800     MOVE "DISPLAY" TO FEATURE.                                   NC1214.2 72
   001266         126900     MOVE "VISUALLY CHECKED" TO RE-MARK.                          NC1214.2 81
   001267         127000     MOVE "0123456789" TO CORRECT-A.                              NC1214.2 101
   001268         127100     SET INDEX6 TO 1.                                             NC1214.2 68
   001269         127200 IND-TEST-GF-37.                                                  NC1214.2
   001270         127300     DISPLAY TABLE6-REC (INDEX6 + 1).                             NC1214.2 66 68
   001271         127400     PERFORM INSPT.                                               NC1214.2 225
   001272         127500     GO TO IND-WRITE-GF-37.                                       NC1214.2 1275
   001273         127600 IND-DELETE-GF-37.                                                NC1214.2
   001274         127700     PERFORM DE-LETE.                                             NC1214.2 228
   001275         127800 IND-WRITE-GF-37.                                                 NC1214.2
   001276         127900     MOVE "IND-TEST-GF-37" TO PAR-NAME.                           NC1214.2 76
   001277         128000     PERFORM PRINT-DETAIL.                                        NC1214.2 230
   001278         128100     GO TO CCVS-999999.                                           NC1214.2 1284
   001279         128200 PARAGRAPH-A.                                                     NC1214.2
   001280         128300     ADD 1 TO NUM-9V9.                                            NC1214.2 69
   001281         128400 PARAGRAPH-B.                                                     NC1214.2
   001282         128500     ADD 1 TO NUM-9V9.                                            NC1214.2 69
   001283         128600 CCVS-EXIT SECTION.                                               NC1214.2
   001284         128700 CCVS-999999.                                                     NC1214.2
   001285         128800     GO TO CLOSE-FILES.                                           NC1214.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    26
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      132   ANSI-REFERENCE . . . . . . . .  309 316 325 M367 M389 M411 M447 M469 M492 M530 M553 M578 M604 M626 M649 M674
                                            M700 M722 M744 M781 M804 M827 M865 M887 M912 M938 M962 M984 M1008 M1033 M1059
                                            M1083 M1107 M1130 M1152 M1177 M1203 M1225 M1248 M1264
      111   CCVS-C-1 . . . . . . . . . . .  248 294
      116   CCVS-C-2 . . . . . . . . . . .  249 295
      166   CCVS-E-1 . . . . . . . . . . .  254
      171   CCVS-E-2 . . . . . . . . . . .  263 270 277 282
      174   CCVS-E-2-2 . . . . . . . . . .  M262
      179   CCVS-E-3 . . . . . . . . . . .  283
      188   CCVS-E-4 . . . . . . . . . . .  262
      189   CCVS-E-4-1 . . . . . . . . . .  M260
      191   CCVS-E-4-2 . . . . . . . . . .  M261
      133   CCVS-H-1 . . . . . . . . . . .  243 290
      138   CCVS-H-2A. . . . . . . . . . .  244 291
      147   CCVS-H-2B. . . . . . . . . . .  245 292
      159   CCVS-H-3 . . . . . . . . . . .  246 293
      209   CCVS-PGM-ID. . . . . . . . . .  215 215
       93   CM-18V0
       87   COMPUTED-A . . . . . . . . . .  88 90 91 92 93 321 324
       88   COMPUTED-N
       86   COMPUTED-X . . . . . . . . . .  M238 306
       90   COMPUTED-0V18
       92   COMPUTED-14V4. . . . . . . . .  M383 M405 M425 M440 M463 M486 M508 M523 M547 M572 M598 M620 M643 M668 M694 M716
                                            M738 M758 M774 M798 M821 M843 M858 M881 M906 M932 M956 M978 M1002 M1027 M1053
                                            M1077 M1101 M1124 M1146 M1171 M1197
       94   COMPUTED-18V0. . . . . . . . .  M1219 M1242
       91   COMPUTED-4V14
      110   COR-ANSI-REFERENCE . . . . . .  M316 M318
      101   CORRECT-A. . . . . . . . . . .  102 103 104 105 106 322 324 M1251 M1267
      102   CORRECT-N
      100   CORRECT-X. . . . . . . . . . .  M239 308
      103   CORRECT-0V18
      105   CORRECT-14V4 . . . . . . . . .  M384 M406 M441 M464 M487 M524 M548 M573 M599 M621 M644 M669 M695 M717 M739 M775
                                            M799 M822 M859 M882 M907 M933 M957 M979 M1003 M1028 M1054 M1078 M1102 M1125 M1147
                                            M1172 M1198
      107   CORRECT-18V0 . . . . . . . . .  M1220 M1243
      104   CORRECT-4V14
      106   CR-18V0
      124   DELETE-COUNTER . . . . . . . .  M228 257 273 275
       79   DOTVALUE . . . . . . . . . . .  M233
      130   DUMMY-HOLD . . . . . . . . . .  M287 297
       41   DUMMY-RECORD . . . . . . . . .  M243 M244 M245 M246 M248 M249 M250 M252 M254 M263 M270 M277 M282 M283 287 M288
                                            289 M290 M291 M292 M293 M294 M295 M296 M297 301 M302 M311 M326
      177   ENDER-DESC . . . . . . . . . .  M265 M276 M281
      125   ERROR-COUNTER. . . . . . . . .  M227 256 266 269
      129   ERROR-HOLD . . . . . . . . . .  M256 M257 M257 M258 261
      175   ERROR-TOTAL. . . . . . . . . .  M267 M269 M274 M275 M279 M280
       72   FEATURE. . . . . . . . . . . .  M368 M390 M412 M448 M470 M493 M531 M554 M579 M605 M627 M650 M675 M701 M723 M745
                                            M782 M805 M828 M866 M888 M913 M939 M963 M985 M1009 M1034 M1060 M1084 M1108 M1131
                                            M1153 M1178 M1204 M1226 M1249 M1265
      203   HYPHEN-LINE. . . . . . . . . .  250 252 296
      169   ID-AGAIN . . . . . . . . . . .  M215
       46   INDEX1 . . . . . . . . . . . .  M370 372 M392 394 M414 416 M449 452 M472 475 M495 498 M534 536 M557 560 M582
                                            586 M607 609 M629 632 M653 656 M678 682 M703 705 M725 727 M747 749 M784 787 M807
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    27
0 Defined   Cross-reference of data names   References

0                                           810 M830 833 M868 870 M891 894 M916 920 M965 967 M987 990 M1012 1015 M1037 1041
                                            M1133 1135 M1156 1159 M1181 1185
       50   INDEX2 . . . . . . . . . . . .  M450 452 454 463 M473 475 477 486 M496 498 508 514 523 M558 560 M583 586 M630
                                            632 634 643 M654 656 M679 682 M785 787 789 798 M808 810 812 821 M831 833 843
                                            849 858 M892 894 M917 920 M988 991 993 1002 M1013 1016 M1038 1042 M1087 1089
                                            1089 M1110 1112 1112 1113 1115 1124 M1157 1159 M1182 1185
       54   INDEX3 . . . . . . . . . . . .  M584 587 589 598 M680 683 685 694 M918 921 923 932 M1039 1042 1044 1053 M1183
                                            1186 1188 1197
       57   INDEX4-1 . . . . . . . . . . .  M941 945 947 956 M1062 1065
       60   INDEX4-2 . . . . . . . . . . .  M942 945 947 956 M1063 1065
       64   INDEX5 . . . . . . . . . . . .  M1206 1208 M1228 1231
       68   INDEX6 . . . . . . . . . . . .  M1252 1255 M1268 1270
      202   INF-ANSI-REFERENCE . . . . . .  M309 M312 M325 M327
      197   INFO-TEXT. . . . . . . . . . .  M310
      126   INSPECT-COUNTER. . . . . . . .  M225 256 278 280
       69   NUM-9V9. . . . . . . . . . . .  M369 M372 374 383 M391 M394 396 405 M413 M416 425 431 440 M533 M536 538 547 M556
                                            M561 563 572 M606 M609 611 620 M652 M657 659 668 M702 M705 707 716 M724 M727
                                            729 738 M746 M749 758 M764 765 774 M867 M870 872 881 M890 M895 897 906 M964 M967
                                            969 978 M1011 M1016 1018 1027 M1086 M1090 1092 1101 M1132 M1135 1137 1146 M1154
                                            M1160 1162 1171 M1205 1210 1219 M1227 1233 1242 M1280 M1282
       74   P-OR-F . . . . . . . . . . . .  M225 M226 M227 M228 235 M238
       76   PAR-NAME . . . . . . . . . . .  M240 M386 M408 M428 M444 M466 M489 M511 M527 M550 M575 M601 M623 M646 M671 M697
                                            M719 M741 M761 M778 M801 M824 M846 M862 M884 M909 M935 M959 M981 M1005 M1030
                                            M1056 M1080 M1104 M1127 M1149 M1174 M1200 M1222 M1245 M1261 M1276
       78   PARDOT-X . . . . . . . . . . .  M232
      127   PASS-COUNTER . . . . . . . . .  M226 258 260
       39   PRINT-FILE . . . . . . . . . .  35 214 220
       40   PRINT-REC. . . . . . . . . . .  M234 M315 M317
       81   RE-MARK. . . . . . . . . . . .  M229 M241 M426 M442 M509 M525 M759 M776 M844 M860 M1250 M1266
      123   REC-CT . . . . . . . . . . . .  231 233 240
      122   REC-SKL-SUB
      131   RECORD-COUNT . . . . . . . . .  M285 286 M298
       43   TABLE1
       44   TABLE1-NUM . . . . . . . . . .  M333 M334 M335 M336 M337 M338 M339 M340 M341 M342 372 394 416 452 475 498 536
                                            560 586 609 632 656 682 705 727 749 787 810 833 870 894 920 967 990 1015 1041
                                            1135 1159 1185
       47   TABLE2
       48   TABLE2-NUM . . . . . . . . . .  M344 M345 M346 M347 M348 M349 M452 454 463 M475 477 486 M498 508 514 523 560
                                            586 M632 634 643 656 682 M787 789 798 M810 812 821 M833 843 849 858 894 920 M991
                                            993 1002 1016 1042 1089 1089 1112 1112 M1113 1115 1124 1159 1185
       51   TABLE3 . . . . . . . . . . . .  M581 M677 M915 M1036 M1179
       52   TABLE3-NUM . . . . . . . . . .  M587 589 598 M683 685 694 M921 923 932 M1042 1044 1053 M1186 1188 1197
       55   TABLE4
       56   TABLE4-NUM1
       58   TABLE4-NUM2. . . . . . . . . .  M351 M352 M353 M354 M355 M356 M357 M358 M359 944 M945 947 956 1065 1066 M1066
                                            1068 1077
       61   TABLE5
       62   TABLE5-NUM . . . . . . . . . .  M361 M362 1208 1231
       65   TABLE6
       66   TABLE6-REC . . . . . . . . . .  M364 M365 1255 1270
       82   TEST-COMPUTED. . . . . . . . .  315
       97   TEST-CORRECT . . . . . . . . .  317
      150   TEST-ID. . . . . . . . . . . .  M215
       70   TEST-RESULTS . . . . . . . . .  M216 234
      128   TOTAL-ERROR
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    28
0 Defined   Cross-reference of data names   References

0     199   XXCOMPUTED . . . . . . . . . .  M324
      201   XXCORRECT. . . . . . . . . . .  M324
      194   XXINFO . . . . . . . . . . . .  311 326
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    29
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

      320   BAIL-OUT . . . . . . . . . . .  P237
      328   BAIL-OUT-EX. . . . . . . . . .  E237 G322
      323   BAIL-OUT-WRITE . . . . . . . .  G321
      303   BLANK-LINE-PRINT
      332   BUILD-TABLE1
      343   BUILD-TABLE2 . . . . . . . . .  P471 P494 P532 P555 P580 P628 P651 P676 P783 P806 P829 P889 P914 P986 P1010 P1035
                                            P1085 P1109 P1155 P1180
      350   BUILD-TABLE4 . . . . . . . . .  P940 P1061
      360   BUILD-TABLE5
      363   BUILD-TABLE6
     1283   CCVS-EXIT
     1284   CCVS-999999. . . . . . . . . .  G1278
      212   CCVS1
      329   CCVS1-EXIT . . . . . . . . . .  G218
      219   CLOSE-FILES. . . . . . . . . .  G1285
      247   COLUMN-NAMES-ROUTINE . . . . .  E217
      228   DE-LETE. . . . . . . . . . . .  P379 P401 P421 P436 P459 P482 P504 P519 P543 P568 P594 P616 P639 P664 P690 P712
                                            P734 P754 P770 P794 P817 P839 P854 P877 P902 P928 P952 P974 P998 P1023 P1049
                                            P1073 P1097 P1120 P1142 P1167 P1193 P1215 P1238 P1259 P1274
      251   END-ROUTINE. . . . . . . . . .  P220
      255   END-ROUTINE-1
      264   END-ROUTINE-12
      272   END-ROUTINE-13 . . . . . . . .  E220
      253   END-RTN-EXIT
      227   FAIL . . . . . . . . . . . . .  P382 P404 P424 P439 P462 P485 P507 P522 P546 P571 P597 P619 P642 P667 P693 P715
                                            P737 P757 P773 P797 P820 P842 P857 P880 P905 P931 P955 P977 P1001 P1026 P1052
                                            P1076 P1100 P1123 P1145 P1170 P1196 P1218 P1241
      305   FAIL-ROUTINE . . . . . . . . .  P236
      319   FAIL-ROUTINE-EX. . . . . . . .  E236 G313
      314   FAIL-ROUTINE-WRITE . . . . . .  G307 G308
      242   HEAD-ROUTINE . . . . . . . . .  P217
      378   IND-DELETE-GF-1
      615   IND-DELETE-GF-10
      638   IND-DELETE-GF-11
      663   IND-DELETE-GF-12
      689   IND-DELETE-GF-13
      711   IND-DELETE-GF-14
      733   IND-DELETE-GF-15
      753   IND-DELETE-GF-16-1
      769   IND-DELETE-GF-16-2
      793   IND-DELETE-GF-17
      816   IND-DELETE-GF-18
      838   IND-DELETE-GF-19-1
      853   IND-DELETE-GF-19-2
      400   IND-DELETE-GF-2
      973   IND-DELETE-GF-20
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    30
0 Defined   Cross-reference of procedures   References

0     997   IND-DELETE-GF-21
      876   IND-DELETE-GF-22
      901   IND-DELETE-GF-23
      927   IND-DELETE-GF-24
      951   IND-DELETE-GF-25
     1022   IND-DELETE-GF-26
     1048   IND-DELETE-GF-27
     1072   IND-DELETE-GF-28
     1096   IND-DELETE-GF-29
      420   IND-DELETE-GF-3-1
      435   IND-DELETE-GF-3-2
     1119   IND-DELETE-GF-30
     1141   IND-DELETE-GF-31
     1166   IND-DELETE-GF-32
     1192   IND-DELETE-GF-33
     1214   IND-DELETE-GF-34
     1237   IND-DELETE-GF-35
     1258   IND-DELETE-GF-36
     1273   IND-DELETE-GF-37
      458   IND-DELETE-GF-4
      481   IND-DELETE-GF-5
      503   IND-DELETE-GF-6-1
      518   IND-DELETE-GF-6-2
      542   IND-DELETE-GF-7
      567   IND-DELETE-GF-8
      593   IND-DELETE-GF-9
      381   IND-FAIL-GF-1. . . . . . . . .  G376
      618   IND-FAIL-GF-10 . . . . . . . .  G613
      641   IND-FAIL-GF-11 . . . . . . . .  G636
      666   IND-FAIL-GF-12 . . . . . . . .  G661
      692   IND-FAIL-GF-13 . . . . . . . .  G687
      714   IND-FAIL-GF-14 . . . . . . . .  G710
      736   IND-FAIL-GF-15 . . . . . . . .  G732
      756   IND-FAIL-GF-16-1 . . . . . . .  G752
      772   IND-FAIL-GF-16-2 . . . . . . .  G768
      796   IND-FAIL-GF-17 . . . . . . . .  G792
      819   IND-FAIL-GF-18 . . . . . . . .  G815
      841   IND-FAIL-GF-19-1 . . . . . . .  G837
      856   IND-FAIL-GF-19-2 . . . . . . .  G852
      403   IND-FAIL-GF-2. . . . . . . . .  G398
      976   IND-FAIL-GF-20 . . . . . . . .  G972
     1000   IND-FAIL-GF-21 . . . . . . . .  G996
      879   IND-FAIL-GF-22 . . . . . . . .  G875
      904   IND-FAIL-GF-23 . . . . . . . .  G900
      930   IND-FAIL-GF-24 . . . . . . . .  G926
      954   IND-FAIL-GF-25 . . . . . . . .  G950
     1025   IND-FAIL-GF-26 . . . . . . . .  G1021
     1051   IND-FAIL-GF-27 . . . . . . . .  G1047
     1075   IND-FAIL-GF-28 . . . . . . . .  G1071
     1099   IND-FAIL-GF-29 . . . . . . . .  G1095
      423   IND-FAIL-GF-3-1. . . . . . . .  G419
      438   IND-FAIL-GF-3-2. . . . . . . .  G434
     1122   IND-FAIL-GF-30 . . . . . . . .  G1118
     1144   IND-FAIL-GF-31 . . . . . . . .  G1140
     1169   IND-FAIL-GF-32 . . . . . . . .  G1165
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    31
0 Defined   Cross-reference of procedures   References

0    1195   IND-FAIL-GF-33 . . . . . . . .  G1191
     1217   IND-FAIL-GF-34 . . . . . . . .  G1212
     1240   IND-FAIL-GF-35 . . . . . . . .  G1235
      461   IND-FAIL-GF-4. . . . . . . . .  G456
      484   IND-FAIL-GF-5. . . . . . . . .  G479
      506   IND-FAIL-GF-6-1. . . . . . . .  G502
      521   IND-FAIL-GF-6-2. . . . . . . .  G517
      545   IND-FAIL-GF-7. . . . . . . . .  G540
      570   IND-FAIL-GF-8. . . . . . . . .  G565
      596   IND-FAIL-GF-9. . . . . . . . .  G591
      366   IND-INIT-GF-1
      603   IND-INIT-GF-10
      625   IND-INIT-GF-11
      648   IND-INIT-GF-12
      673   IND-INIT-GF-13
      699   IND-INIT-GF-14
      721   IND-INIT-GF-15
      743   IND-INIT-GF-16
      780   IND-INIT-GF-17
      803   IND-INIT-GF-18
      826   IND-INIT-GF-19
      388   IND-INIT-GF-2
      961   IND-INIT-GF-20
      983   IND-INIT-GF-21
      864   IND-INIT-GF-22
      886   IND-INIT-GF-23
      911   IND-INIT-GF-24
      937   IND-INIT-GF-25
     1007   IND-INIT-GF-26
     1032   IND-INIT-GF-27
     1058   IND-INIT-GF-28
     1082   IND-INIT-GF-29
      410   IND-INIT-GF-3
     1106   IND-INIT-GF-30
     1129   IND-INIT-GF-31
     1151   IND-INIT-GF-32
     1176   IND-INIT-GF-33
     1202   IND-INIT-GF-34
     1224   IND-INIT-GF-35
     1247   IND-INIT-GF-36
     1263   IND-INIT-GF-37
      446   IND-INIT-GF-4
      468   IND-INIT-GF-5
      491   IND-INIT-GF-6
      529   IND-INIT-GF-7
      552   IND-INIT-GF-8
      577   IND-INIT-GF-9
      371   IND-TEST-GF-1-0
      373   IND-TEST-GF-1-1
      608   IND-TEST-GF-10-0
      610   IND-TEST-GF-10-1
      631   IND-TEST-GF-11-0
      633   IND-TEST-GF-11-1
      655   IND-TEST-GF-12-0
      658   IND-TEST-GF-12-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    32
0 Defined   Cross-reference of procedures   References

0     681   IND-TEST-GF-13-0
      684   IND-TEST-GF-13-1
      704   IND-TEST-GF-14-0
      706   IND-TEST-GF-14-1
      726   IND-TEST-GF-15-0
      728   IND-TEST-GF-15-1
      748   IND-TEST-GF-16-1
      763   IND-TEST-GF-16-2
      786   IND-TEST-GF-17-0
      788   IND-TEST-GF-17-1
      809   IND-TEST-GF-18-0
      811   IND-TEST-GF-18-1
      832   IND-TEST-GF-19-1
      848   IND-TEST-GF-19-2
      393   IND-TEST-GF-2-0
      395   IND-TEST-GF-2-1
      966   IND-TEST-GF-20-0
      968   IND-TEST-GF-20-1
      989   IND-TEST-GF-21-0
      992   IND-TEST-GF-21-1
      869   IND-TEST-GF-22-0
      871   IND-TEST-GF-22-1
      893   IND-TEST-GF-23-0
      896   IND-TEST-GF-23-1
      919   IND-TEST-GF-24-0
      922   IND-TEST-GF-24-1
      943   IND-TEST-GF-25-0
      946   IND-TEST-GF-25-1
     1014   IND-TEST-GF-26-0
     1017   IND-TEST-GF-26-1
     1040   IND-TEST-GF-27-0
     1043   IND-TEST-GF-27-1
     1064   IND-TEST-GF-28-0
     1067   IND-TEST-GF-28-1
     1088   IND-TEST-GF-29-0
     1091   IND-TEST-GF-29-1
      415   IND-TEST-GF-3-1
      430   IND-TEST-GF-3-2
     1111   IND-TEST-GF-30-0
     1114   IND-TEST-GF-30-1
     1134   IND-TEST-GF-31-0
     1136   IND-TEST-GF-31-1
     1158   IND-TEST-GF-32-0
     1161   IND-TEST-GF-32-1
     1184   IND-TEST-GF-33-0
     1187   IND-TEST-GF-33-1
     1207   IND-TEST-GF-34-0
     1209   IND-TEST-GF-34-1
     1229   IND-TEST-GF-35-0
     1232   IND-TEST-GF-35-1
     1253   IND-TEST-GF-36
     1269   IND-TEST-GF-37
      451   IND-TEST-GF-4-0
      453   IND-TEST-GF-4-1
      474   IND-TEST-GF-5-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    33
0 Defined   Cross-reference of procedures   References

0     476   IND-TEST-GF-5-1
      497   IND-TEST-GF-6-1
      513   IND-TEST-GF-6-2
      535   IND-TEST-GF-7-0
      537   IND-TEST-GF-7-1
      559   IND-TEST-GF-8-0
      562   IND-TEST-GF-8-1
      585   IND-TEST-GF-9-0
      588   IND-TEST-GF-9-1
      385   IND-WRITE-GF-1 . . . . . . . .  G377 G380
      622   IND-WRITE-GF-10. . . . . . . .  G614 G617
      645   IND-WRITE-GF-11. . . . . . . .  G637 G640
      670   IND-WRITE-GF-12. . . . . . . .  G662 G665
      696   IND-WRITE-GF-13. . . . . . . .  G688 G691
      718   IND-WRITE-GF-14. . . . . . . .  G709 G713
      740   IND-WRITE-GF-15. . . . . . . .  G731 G735
      760   IND-WRITE-GF-16-1. . . . . . .  G751 G755
      777   IND-WRITE-GF-16-2. . . . . . .  G767 G771
      800   IND-WRITE-GF-17. . . . . . . .  G791 G795
      823   IND-WRITE-GF-18. . . . . . . .  G814 G818
      845   IND-WRITE-GF-19-1. . . . . . .  G836 G840
      861   IND-WRITE-GF-19-2. . . . . . .  G851 G855
      407   IND-WRITE-GF-2 . . . . . . . .  G399 G402
      980   IND-WRITE-GF-20. . . . . . . .  G971 G975
     1004   IND-WRITE-GF-21. . . . . . . .  G995 G999
      883   IND-WRITE-GF-22. . . . . . . .  G874 G878
      908   IND-WRITE-GF-23. . . . . . . .  G899 G903
      934   IND-WRITE-GF-24. . . . . . . .  G925 G929
      958   IND-WRITE-GF-25. . . . . . . .  G949 G953
     1029   IND-WRITE-GF-26. . . . . . . .  G1020 G1024
     1055   IND-WRITE-GF-27. . . . . . . .  G1046 G1050
     1079   IND-WRITE-GF-28. . . . . . . .  G1070 G1074
     1103   IND-WRITE-GF-29. . . . . . . .  G1094 G1098
      427   IND-WRITE-GF-3-1 . . . . . . .  G418 G422
      443   IND-WRITE-GF-3-2 . . . . . . .  G433 G437
     1126   IND-WRITE-GF-30. . . . . . . .  G1117 G1121
     1148   IND-WRITE-GF-31. . . . . . . .  G1139 G1143
     1173   IND-WRITE-GF-32. . . . . . . .  G1164 G1168
     1199   IND-WRITE-GF-33. . . . . . . .  G1190 G1194
     1221   IND-WRITE-GF-34. . . . . . . .  G1213 G1216
     1244   IND-WRITE-GF-35. . . . . . . .  G1236 G1239
     1260   IND-WRITE-GF-36. . . . . . . .  G1257
     1275   IND-WRITE-GF-37. . . . . . . .  G1272
      465   IND-WRITE-GF-4 . . . . . . . .  G457 G460
      488   IND-WRITE-GF-5 . . . . . . . .  G480 G483
      510   IND-WRITE-GF-6-1 . . . . . . .  G501 G505
      526   IND-WRITE-GF-6-2 . . . . . . .  G516 G520
      549   IND-WRITE-GF-7 . . . . . . . .  G541 G544
      574   IND-WRITE-GF-8 . . . . . . . .  G566 G569
      600   IND-WRITE-GF-9 . . . . . . . .  G592 G595
      225   INSPT. . . . . . . . . . . . .  P1256 P1271
      213   OPEN-FILES
     1279   PARAGRAPH-A. . . . . . . . . .  P1208 P1230
     1281   PARAGRAPH-B. . . . . . . . . .  E1230
      226   PASS . . . . . . . . . . . . .  P375 P397 P417 P432 P455 P478 P500 P515 P539 P564 P590 P612 P635 P660 P686 P708
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    34
0 Defined   Cross-reference of procedures   References

0                                           P730 P750 P766 P790 P813 P835 P850 P873 P898 P924 P948 P970 P994 P1019 P1045
                                            P1069 P1093 P1116 P1138 P1163 P1189 P1211 P1234
      230   PRINT-DETAIL . . . . . . . . .  P387 P409 P429 P445 P467 P490 P512 P528 P551 P576 P602 P624 P647 P672 P698 P720
                                            P742 P762 P779 P802 P825 P847 P863 P885 P910 P936 P960 P982 P1006 P1031 P1057
                                            P1081 P1105 P1128 P1150 P1175 P1201 P1223 P1246 P1262 P1277
      331   SECT-NC121M-001
      223   TERMINATE-CALL
      221   TERMINATE-CCVS
      284   WRITE-LINE . . . . . . . . . .  P234 P235 P243 P244 P245 P246 P248 P249 P250 P252 P254 P263 P271 P277 P282 P283
                                            P311 P315 P317 P326
      300   WRT-LN . . . . . . . . . . . .  P290 P291 P292 P293 P294 P295 P296 P299 P304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    35
0 Defined   Cross-reference of programs     References

        3   NC121M
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC121M    Date 06/04/2022  Time 11:59:42   Page    36
0LineID  Message code  Message text

     39  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC121M:
 *    Source records = 1285
 *    Data Division statements = 77
 *    Procedure Division statements = 832
 *    Generated COBOL statements = 0
 *    Program complexity factor = 839
0End of compilation 1,  program NC121M,  highest severity 0.
0Return code 0
