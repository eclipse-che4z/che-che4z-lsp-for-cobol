1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:14   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:14   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1234.2
   000002         000200 PROGRAM-ID.                                                      NC1234.2
   000003         000300     NC123A.                                                      NC1234.2
   000004         000500*                                                              *  NC1234.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1234.2
   000006         000700*                                                              *  NC1234.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1234.2
   000008         000900*                                                              *  NC1234.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1234.2
   000010         001100*                                                              *  NC1234.2
   000011         001300*                                                              *  NC1234.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1234.2
   000013         001500*                                                              *  NC1234.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1234.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1234.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1234.2
   000017         001900*                                                              *  NC1234.2
   000018         002100*                                                                 NC1234.2
   000019         002200*    PROGRAM NC123A TESTS THE USE OF INDEXED IDENTIFIERS WITH     NC1234.2
   000020         002300*    FORMATS 1 AND 2 OF THE "ADD" AND "SUBTRACT" STATEMENTS AND   NC1234.2
   000021         002400*    FORMAT 2 OF THE "GO" STATEMENT.                              NC1234.2
   000022         002500*    ONE AND TWO LEVELS OF INDEXING ARE USED AS WELL AS           NC1234.2
   000023         002600*    RELATIVE INDEXING.                                           NC1234.2
   000024         002700*                                                                 NC1234.2
   000025         002800 ENVIRONMENT DIVISION.                                            NC1234.2
   000026         002900 CONFIGURATION SECTION.                                           NC1234.2
   000027         003000 SOURCE-COMPUTER.                                                 NC1234.2
   000028         003100     XXXXX082.                                                    NC1234.2
   000029         003200 OBJECT-COMPUTER.                                                 NC1234.2
   000030         003300     XXXXX083.                                                    NC1234.2
   000031         003400 INPUT-OUTPUT SECTION.                                            NC1234.2
   000032         003500 FILE-CONTROL.                                                    NC1234.2
   000033         003600     SELECT PRINT-FILE ASSIGN TO                                  NC1234.2 37
   000034         003700     XXXXX055.                                                    NC1234.2
   000035         003800 DATA DIVISION.                                                   NC1234.2
   000036         003900 FILE SECTION.                                                    NC1234.2
   000037         004000 FD  PRINT-FILE.                                                  NC1234.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004100 01  PRINT-REC PICTURE X(120).                                    NC1234.2
   000039         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC1234.2
   000040         004300 WORKING-STORAGE SECTION.                                         NC1234.2
   000041         004400 01  TABLE1.                                                      NC1234.2
   000042         004500     02  TABLE1-NUM              PICTURE S9V99                    NC1234.2
   000043         004600                                 OCCURS 10 TIMES                  NC1234.2
   000044         004700                                 INDEXED BY INDEX1.               NC1234.2
   000045         004800 01  TABLE2.                                                      NC1234.2
   000046         004900     02  TABLE2-NUM              PICTURE 9V9                      NC1234.2
   000047         005000                                 OCCURS 6 TIMES                   NC1234.2
   000048         005100                                 INDEXED BY INDEX2.               NC1234.2
   000049         005200 01  TABLE3.                                                      NC1234.2
   000050         005300     02  TABLE3-NUM              PICTURE 99V9                     NC1234.2
   000051         005400                                 OCCURS 6 TIMES                   NC1234.2
   000052         005500                                 INDEXED BY INDEX3.               NC1234.2
   000053         005600 01  TABLE4.                                                      NC1234.2
   000054         005700     02  TABLE4-NUM1             OCCURS 3 TIMES                   NC1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800                                 INDEXED BY INDEX4-1.             NC1234.2
   000056         005900         03 TABLE4-NUM2          PICTURE 99                       NC1234.2
   000057         006000                                 OCCURS 3 TIMES                   NC1234.2
   000058         006100                                 INDEXED BY INDEX4-2.             NC1234.2
   000059         006200 01  TABLE5.                                                      NC1234.2
   000060         006300     02  TABLE5-NUM              PIC 999                          NC1234.2
   000061         006400                                 OCCURS 2 TIMES                   NC1234.2
   000062         006500                                 INDEXED BY INDEX5.               NC1234.2
   000063         006600 01  NUM-9V9                     PICTURE 9V9.                     NC1234.2
   000064         006700 01  TEST-RESULTS.                                                NC1234.2
   000065         006800     02 FILLER                   PIC X      VALUE SPACE.          NC1234.2 IMP
   000066         006900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1234.2 IMP
   000067         007000     02 FILLER                   PIC X      VALUE SPACE.          NC1234.2 IMP
   000068         007100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1234.2 IMP
   000069         007200     02 FILLER                   PIC X      VALUE SPACE.          NC1234.2 IMP
   000070         007300     02  PAR-NAME.                                                NC1234.2
   000071         007400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1234.2 IMP
   000072         007500       03  PARDOT-X              PIC X      VALUE SPACE.          NC1234.2 IMP
   000073         007600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1234.2 IMP
   000074         007700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1234.2 IMP
   000075         007800     02 RE-MARK                  PIC X(61).                       NC1234.2
   000076         007900 01  TEST-COMPUTED.                                               NC1234.2
   000077         008000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1234.2 IMP
   000078         008100     02 FILLER                   PIC X(17)  VALUE                 NC1234.2
   000079         008200            "       COMPUTED=".                                   NC1234.2
   000080         008300     02 COMPUTED-X.                                               NC1234.2
   000081         008400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1234.2 IMP
   000082         008500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1234.2 81
   000083         008600                                 PIC -9(9).9(9).                  NC1234.2
   000084         008700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1234.2 81
   000085         008800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1234.2 81
   000086         008900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1234.2 81
   000087         009000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1234.2 81
   000088         009100         04 COMPUTED-18V0                    PIC -9(18).          NC1234.2
   000089         009200         04 FILLER                           PIC X.               NC1234.2
   000090         009300     03 FILLER PIC X(50) VALUE SPACE.                             NC1234.2 IMP
   000091         009400 01  TEST-CORRECT.                                                NC1234.2
   000092         009500     02 FILLER PIC X(30) VALUE SPACE.                             NC1234.2 IMP
   000093         009600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1234.2
   000094         009700     02 CORRECT-X.                                                NC1234.2
   000095         009800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1234.2 IMP
   000096         009900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1234.2 95
   000097         010000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1234.2 95
   000098         010100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1234.2 95
   000099         010200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1234.2 95
   000100         010300     03      CR-18V0 REDEFINES CORRECT-A.                         NC1234.2 95
   000101         010400         04 CORRECT-18V0                     PIC -9(18).          NC1234.2
   000102         010500         04 FILLER                           PIC X.               NC1234.2
   000103         010600     03 FILLER PIC X(2) VALUE SPACE.                              NC1234.2 IMP
   000104         010700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1234.2 IMP
   000105         010800 01  CCVS-C-1.                                                    NC1234.2
   000106         010900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1234.2
   000107         011000-    "SS  PARAGRAPH-NAME                                          NC1234.2
   000108         011100-    "       REMARKS".                                            NC1234.2
   000109         011200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1234.2 IMP
   000110         011300 01  CCVS-C-2.                                                    NC1234.2
   000111         011400     02 FILLER                     PIC X        VALUE SPACE.      NC1234.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1234.2
   000113         011600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1234.2 IMP
   000114         011700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1234.2
   000115         011800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1234.2 IMP
   000116         011900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1234.2 IMP
   000117         012000 01  REC-CT                        PIC 99       VALUE ZERO.       NC1234.2 IMP
   000118         012100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1234.2 IMP
   000119         012200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1234.2 IMP
   000120         012300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1234.2 IMP
   000121         012400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1234.2 IMP
   000122         012500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1234.2 IMP
   000123         012600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1234.2 IMP
   000124         012700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1234.2 IMP
   000125         012800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1234.2 IMP
   000126         012900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1234.2 IMP
   000127         013000 01  CCVS-H-1.                                                    NC1234.2
   000128         013100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1234.2 IMP
   000129         013200     02  FILLER                    PIC X(42)    VALUE             NC1234.2
   000130         013300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1234.2
   000131         013400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1234.2 IMP
   000132         013500 01  CCVS-H-2A.                                                   NC1234.2
   000133         013600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1234.2 IMP
   000134         013700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1234.2
   000135         013800   02  FILLER                        PIC XXXX   VALUE             NC1234.2
   000136         013900     "4.2 ".                                                      NC1234.2
   000137         014000   02  FILLER                        PIC X(28)  VALUE             NC1234.2
   000138         014100            " COPY - NOT FOR DISTRIBUTION".                       NC1234.2
   000139         014200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1234.2 IMP
   000140         014300                                                                  NC1234.2
   000141         014400 01  CCVS-H-2B.                                                   NC1234.2
   000142         014500   02  FILLER                        PIC X(15)  VALUE             NC1234.2
   000143         014600            "TEST RESULT OF ".                                    NC1234.2
   000144         014700   02  TEST-ID                       PIC X(9).                    NC1234.2
   000145         014800   02  FILLER                        PIC X(4)   VALUE             NC1234.2
   000146         014900            " IN ".                                               NC1234.2
   000147         015000   02  FILLER                        PIC X(12)  VALUE             NC1234.2
   000148         015100     " HIGH       ".                                              NC1234.2
   000149         015200   02  FILLER                        PIC X(22)  VALUE             NC1234.2
   000150         015300            " LEVEL VALIDATION FOR ".                             NC1234.2
   000151         015400   02  FILLER                        PIC X(58)  VALUE             NC1234.2
   000152         015500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1234.2
   000153         015600 01  CCVS-H-3.                                                    NC1234.2
   000154         015700     02  FILLER                      PIC X(34)  VALUE             NC1234.2
   000155         015800            " FOR OFFICIAL USE ONLY    ".                         NC1234.2
   000156         015900     02  FILLER                      PIC X(58)  VALUE             NC1234.2
   000157         016000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1234.2
   000158         016100     02  FILLER                      PIC X(28)  VALUE             NC1234.2
   000159         016200            "  COPYRIGHT   1985 ".                                NC1234.2
   000160         016300 01  CCVS-E-1.                                                    NC1234.2
   000161         016400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1234.2 IMP
   000162         016500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1234.2
   000163         016600     02 ID-AGAIN                     PIC X(9).                    NC1234.2
   000164         016700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1234.2 IMP
   000165         016800 01  CCVS-E-2.                                                    NC1234.2
   000166         016900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1234.2 IMP
   000167         017000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1234.2 IMP
   000168         017100     02 CCVS-E-2-2.                                               NC1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1234.2 IMP
   000170         017300         03 FILLER                   PIC X      VALUE SPACE.      NC1234.2 IMP
   000171         017400         03 ENDER-DESC               PIC X(44)  VALUE             NC1234.2
   000172         017500            "ERRORS ENCOUNTERED".                                 NC1234.2
   000173         017600 01  CCVS-E-3.                                                    NC1234.2
   000174         017700     02  FILLER                      PIC X(22)  VALUE             NC1234.2
   000175         017800            " FOR OFFICIAL USE ONLY".                             NC1234.2
   000176         017900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1234.2 IMP
   000177         018000     02  FILLER                      PIC X(58)  VALUE             NC1234.2
   000178         018100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1234.2
   000179         018200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1234.2 IMP
   000180         018300     02 FILLER                       PIC X(15)  VALUE             NC1234.2
   000181         018400             " COPYRIGHT 1985".                                   NC1234.2
   000182         018500 01  CCVS-E-4.                                                    NC1234.2
   000183         018600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1234.2 IMP
   000184         018700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1234.2
   000185         018800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1234.2 IMP
   000186         018900     02 FILLER                       PIC X(40)  VALUE             NC1234.2
   000187         019000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1234.2
   000188         019100 01  XXINFO.                                                      NC1234.2
   000189         019200     02 FILLER                       PIC X(19)  VALUE             NC1234.2
   000190         019300            "*** INFORMATION ***".                                NC1234.2
   000191         019400     02 INFO-TEXT.                                                NC1234.2
   000192         019500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1234.2 IMP
   000193         019600       04 XXCOMPUTED                 PIC X(20).                   NC1234.2
   000194         019700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1234.2 IMP
   000195         019800       04 XXCORRECT                  PIC X(20).                   NC1234.2
   000196         019900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1234.2
   000197         020000 01  HYPHEN-LINE.                                                 NC1234.2
   000198         020100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1234.2 IMP
   000199         020200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1234.2
   000200         020300-    "*****************************************".                 NC1234.2
   000201         020400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1234.2
   000202         020500-    "******************************".                            NC1234.2
   000203         020600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1234.2
   000204         020700     "NC123A".                                                    NC1234.2
   000205         020800 PROCEDURE DIVISION.                                              NC1234.2
   000206         020900 CCVS1 SECTION.                                                   NC1234.2
   000207         021000 OPEN-FILES.                                                      NC1234.2
   000208         021100     OPEN     OUTPUT PRINT-FILE.                                  NC1234.2 37
   000209         021200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1234.2 203 144 203 163
   000210         021300     MOVE    SPACE TO TEST-RESULTS.                               NC1234.2 IMP 64
   000211         021400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1234.2 236 241
   000212         021500     GO TO CCVS1-EXIT.                                            NC1234.2 323
   000213         021600 CLOSE-FILES.                                                     NC1234.2
   000214         021700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1234.2 245 266 37
   000215         021800 TERMINATE-CCVS.                                                  NC1234.2
   000216         021900     EXIT PROGRAM.                                                NC1234.2
   000217         022000 TERMINATE-CALL.                                                  NC1234.2
   000218         022100     STOP     RUN.                                                NC1234.2
   000219         022200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1234.2 68 120
   000220         022300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1234.2 68 121
   000221         022400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1234.2 68 119
   000222         022500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1234.2 68 118
   000223         022600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1234.2 75
   000224         022700 PRINT-DETAIL.                                                    NC1234.2
   000225         022800     IF REC-CT NOT EQUAL TO ZERO                                  NC1234.2 117 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226      1  022900             MOVE "." TO PARDOT-X                                 NC1234.2 72
   000227      1  023000             MOVE REC-CT TO DOTVALUE.                             NC1234.2 117 73
   000228         023100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1234.2 64 38 278
   000229         023200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1234.2 68 278
   000230      1  023300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1234.2 299 313
   000231      1  023400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1234.2 314 322
   000232         023500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1234.2 IMP 68 IMP 80
   000233         023600     MOVE SPACE TO CORRECT-X.                                     NC1234.2 IMP 94
   000234         023700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1234.2 117 IMP IMP 70
   000235         023800     MOVE     SPACE TO RE-MARK.                                   NC1234.2 IMP 75
   000236         023900 HEAD-ROUTINE.                                                    NC1234.2
   000237         024000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1234.2 127 39 278
   000238         024100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1234.2 132 39 278
   000239         024200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1234.2 141 39 278
   000240         024300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1234.2 153 39 278
   000241         024400 COLUMN-NAMES-ROUTINE.                                            NC1234.2
   000242         024500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1234.2 105 39 278
   000243         024600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1234.2 110 39 278
   000244         024700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1234.2 197 39 278
   000245         024800 END-ROUTINE.                                                     NC1234.2
   000246         024900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1234.2 197 39 278
   000247         025000 END-RTN-EXIT.                                                    NC1234.2
   000248         025100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1234.2 160 39 278
   000249         025200 END-ROUTINE-1.                                                   NC1234.2
   000250         025300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1234.2 119 123 120
   000251         025400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1234.2 123 118 123
   000252         025500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1234.2 121 123
   000253         025600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1234.2
   000254         025700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1234.2 121 183
   000255         025800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1234.2 123 185
   000256         025900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1234.2 182 168
   000257         026000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1234.2 165 39 278
   000258         026100  END-ROUTINE-12.                                                 NC1234.2
   000259         026200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1234.2 171
   000260         026300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1234.2 119 IMP
   000261      1  026400         MOVE "NO " TO ERROR-TOTAL                                NC1234.2 169
   000262         026500         ELSE                                                     NC1234.2
   000263      1  026600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1234.2 119 169
   000264         026700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1234.2 165 39
   000265         026800     PERFORM WRITE-LINE.                                          NC1234.2 278
   000266         026900 END-ROUTINE-13.                                                  NC1234.2
   000267         027000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1234.2 118 IMP
   000268      1  027100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1234.2 169
   000269      1  027200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1234.2 118 169
   000270         027300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1234.2 171
   000271         027400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1234.2 165 39 278
   000272         027500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1234.2 120 IMP
   000273      1  027600          MOVE "NO " TO ERROR-TOTAL                               NC1234.2 169
   000274      1  027700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1234.2 120 169
   000275         027800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1234.2 171
   000276         027900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1234.2 165 39 278
   000277         028000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1234.2 173 39 278
   000278         028100 WRITE-LINE.                                                      NC1234.2
   000279         028200     ADD 1 TO RECORD-COUNT.                                       NC1234.2 125
   000280         028300     IF RECORD-COUNT GREATER 42                                   NC1234.2 125
   000281      1  028400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1234.2 39 124
   000282      1  028500         MOVE SPACE TO DUMMY-RECORD                               NC1234.2 IMP 39
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1234.2 39
   000284      1  028700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1234.2 127 39 294
   000285      1  028800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1234.2 132 39 294
   000286      1  028900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1234.2 141 39 294
   000287      1  029000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1234.2 153 39 294
   000288      1  029100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1234.2 105 39 294
   000289      1  029200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1234.2 110 39 294
   000290      1  029300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1234.2 197 39 294
   000291      1  029400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1234.2 124 39
   000292      1  029500         MOVE ZERO TO RECORD-COUNT.                               NC1234.2 IMP 125
   000293         029600     PERFORM WRT-LN.                                              NC1234.2 294
   000294         029700 WRT-LN.                                                          NC1234.2
   000295         029800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1234.2 39
   000296         029900     MOVE SPACE TO DUMMY-RECORD.                                  NC1234.2 IMP 39
   000297         030000 BLANK-LINE-PRINT.                                                NC1234.2
   000298         030100     PERFORM WRT-LN.                                              NC1234.2 294
   000299         030200 FAIL-ROUTINE.                                                    NC1234.2
   000300         030300     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1234.2 80 IMP
   000301      1  030400            GO TO FAIL-ROUTINE-WRITE.                             NC1234.2 308
   000302         030500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1234.2 94 IMP 308
   000303         030600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1234.2 126 196
   000304         030700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1234.2 191
   000305         030800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1234.2 188 39 278
   000306         030900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1234.2 IMP 196
   000307         031000     GO TO  FAIL-ROUTINE-EX.                                      NC1234.2 313
   000308         031100 FAIL-ROUTINE-WRITE.                                              NC1234.2
   000309         031200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1234.2 76 38 278
   000310         031300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1234.2 126 104
   000311         031400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1234.2 91 38 278
   000312         031500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1234.2 IMP 104
   000313         031600 FAIL-ROUTINE-EX. EXIT.                                           NC1234.2
   000314         031700 BAIL-OUT.                                                        NC1234.2
   000315         031800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1234.2 81 IMP 317
   000316         031900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1234.2 95 IMP 322
   000317         032000 BAIL-OUT-WRITE.                                                  NC1234.2
   000318         032100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1234.2 95 195 81 193
   000319         032200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1234.2 126 196
   000320         032300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1234.2 188 39 278
   000321         032400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1234.2 IMP 196
   000322         032500 BAIL-OUT-EX. EXIT.                                               NC1234.2
   000323         032600 CCVS1-EXIT.                                                      NC1234.2
   000324         032700     EXIT.                                                        NC1234.2
   000325         032800 BUILD-TABLE1.                                                    NC1234.2
   000326         032900     MOVE 1.00 TO TABLE1-NUM (1).                                 NC1234.2 42
   000327         033000     MOVE 0.68 TO TABLE1-NUM (2).                                 NC1234.2 42
   000328         033100     MOVE 9.00 TO TABLE1-NUM (3).                                 NC1234.2 42
   000329         033200     MOVE 5.00 TO TABLE1-NUM (4).                                 NC1234.2 42
   000330         033300     MOVE 2.00 TO TABLE1-NUM (5).                                 NC1234.2 42
   000331         033400     MOVE 1.50 TO TABLE1-NUM (6).                                 NC1234.2 42
   000332         033500     MOVE 3.50 TO TABLE1-NUM (7).                                 NC1234.2 42
   000333         033600     MOVE 6.60 TO TABLE1-NUM (8).                                 NC1234.2 42
   000334         033700     MOVE 2.56 TO TABLE1-NUM (9).                                 NC1234.2 42
   000335         033800     MOVE -9.00 TO TABLE1-NUM (10).                               NC1234.2 42
   000336         033900 BUILD-TABLE2.                                                    NC1234.2
   000337         034000     MOVE 5.0 TO TABLE2-NUM (1).                                  NC1234.2 46
   000338         034100     MOVE 4.0 TO TABLE2-NUM (2).                                  NC1234.2 46
   000339         034200     MOVE 9.0 TO TABLE2-NUM (3).                                  NC1234.2 46
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE 4.0 TO TABLE2-NUM (4).                                  NC1234.2 46
   000341         034400     MOVE 4.6 TO TABLE2-NUM (5).                                  NC1234.2 46
   000342         034500     MOVE 1.3 TO TABLE2-NUM (6).                                  NC1234.2 46
   000343         034600 BUILD-TABLE4.                                                    NC1234.2
   000344         034700     MOVE 20 TO TABLE4-NUM2 (1  1).                               NC1234.2 56
   000345         034800     MOVE 21 TO TABLE4-NUM2 (1  2).                               NC1234.2 56
   000346         034900     MOVE 22 TO TABLE4-NUM2 (1  3).                               NC1234.2 56
   000347         035000     MOVE 23 TO TABLE4-NUM2 (2  1).                               NC1234.2 56
   000348         035100     MOVE 24 TO TABLE4-NUM2 (2  2).                               NC1234.2 56
   000349         035200     MOVE 25 TO TABLE4-NUM2 (2  3).                               NC1234.2 56
   000350         035300     MOVE 26 TO TABLE4-NUM2 (3  1).                               NC1234.2 56
   000351         035400     MOVE 27 TO TABLE4-NUM2 (3  2).                               NC1234.2 56
   000352         035500     MOVE 28 TO TABLE4-NUM2 (3  3).                               NC1234.2 56
   000353         035600 BUILD-TABLE5.                                                    NC1234.2
   000354         035700     MOVE 003 TO TABLE5-NUM (1).                                  NC1234.2 60
   000355         035800     MOVE 002 TO TABLE5-NUM (2).                                  NC1234.2 60
   000356         035900 IND-INIT-GF-1.                                                   NC1234.2
   000357         036000     MOVE "ADD TO" TO FEATURE.                                    NC1234.2 66
   000358         036100     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000359         036200     MOVE 1.0 TO NUM-9V9.                                         NC1234.2 63
   000360         036300     SET INDEX1 TO 1.                                             NC1234.2 44
   000361         036400 IND-TEST-GF-1-0.                                                 NC1234.2
   000362         036500     ADD TABLE1-NUM (INDEX1) TO NUM-9V9.                          NC1234.2 42 44 63
   000363         036600 IND-TEST-GF-1-1.                                                 NC1234.2
   000364         036700     IF NUM-9V9 EQUAL TO 2.0                                      NC1234.2 63
   000365      1  036800        PERFORM PASS                                              NC1234.2 220
   000366      1  036900        ELSE GO TO IND-FAIL-GF-1.                                 NC1234.2 371
   000367         037000     GO TO IND-WRITE-GF-1.                                        NC1234.2 375
   000368         037100 IND-DELETE-GF-1.                                                 NC1234.2
   000369         037200     PERFORM DE-LETE.                                             NC1234.2 222
   000370         037300     GO TO IND-WRITE-GF-1.                                        NC1234.2 375
   000371         037400 IND-FAIL-GF-1.                                                   NC1234.2
   000372         037500     PERFORM FAIL.                                                NC1234.2 221
   000373         037600     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000374         037700     MOVE 2.0 TO CORRECT-14V4.                                    NC1234.2 99
   000375         037800 IND-WRITE-GF-1.                                                  NC1234.2
   000376         037900     MOVE "IND-TEST-GF-1" TO PAR-NAME.                            NC1234.2 70
   000377         038000     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000378         038100 IND-INIT-GF-2.                                                   NC1234.2
   000379         038200     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000380         038300     MOVE "ADD ROUNDED" TO FEATURE.                               NC1234.2 66
   000381         038400     MOVE 2.0 TO NUM-9V9.                                         NC1234.2 63
   000382         038500     SET INDEX1 TO 2.                                             NC1234.2 44
   000383         038600 IND-TEST-GF-2-0.                                                 NC1234.2
   000384         038700     ADD TABLE1-NUM (INDEX1) TO NUM-9V9 ROUNDED.                  NC1234.2 42 44 63
   000385         038800 IND-TEST-GF-2-1.                                                 NC1234.2
   000386         038900     IF NUM-9V9 EQUAL TO 2.7                                      NC1234.2 63
   000387      1  039000        PERFORM PASS                                              NC1234.2 220
   000388      1  039100        ELSE GO TO IND-FAIL-GF-2.                                 NC1234.2 393
   000389         039200     GO TO IND-WRITE-GF-2.                                        NC1234.2 397
   000390         039300 IND-DELETE-GF-2.                                                 NC1234.2
   000391         039400     PERFORM DE-LETE.                                             NC1234.2 222
   000392         039500     GO TO IND-WRITE-GF-2.                                        NC1234.2 397
   000393         039600 IND-FAIL-GF-2.                                                   NC1234.2
   000394         039700     PERFORM FAIL.                                                NC1234.2 221
   000395         039800     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000396         039900     MOVE 2.7 TO CORRECT-14V4.                                    NC1234.2 99
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 IND-WRITE-GF-2.                                                  NC1234.2
   000398         040100     MOVE "IND-TEST-GF-2" TO PAR-NAME.                            NC1234.2 70
   000399         040200     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000400         040300 IND-INIT-GF-3.                                                   NC1234.2
   000401         040400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000402         040500     MOVE "ADD ON SIZE ERROR" TO FEATURE.                         NC1234.2 66
   000403         040600     MOVE 5.0 TO NUM-9V9.                                         NC1234.2 63
   000404         040700     SET INDEX1 TO 3.                                             NC1234.2 44
   000405         040800 IND-TEST-GF-3-1.                                                 NC1234.2
   000406         040900     ADD TABLE1-NUM (INDEX1) TO NUM-9V9 ON SIZE ERROR             NC1234.2 42 44 63
   000407      1  041000        PERFORM PASS                                              NC1234.2 220
   000408      1  041100        GO TO IND-WRITE-GF-3-1.                                   NC1234.2 417
   000409         041200     GO TO IND-FAIL-GF-3-1.                                       NC1234.2 413
   000410         041300 IND-DELETE-GF-3-1.                                               NC1234.2
   000411         041400     PERFORM DE-LETE.                                             NC1234.2 222
   000412         041500     GO TO IND-WRITE-GF-3-1.                                      NC1234.2 417
   000413         041600 IND-FAIL-GF-3-1.                                                 NC1234.2
   000414         041700     PERFORM FAIL.                                                NC1234.2 221
   000415         041800     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000416         041900     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1234.2 75
   000417         042000 IND-WRITE-GF-3-1.                                                NC1234.2
   000418         042100     MOVE "IND-TEST-GF-3-1" TO PAR-NAME.                          NC1234.2 70
   000419         042200     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000420         042300 IND-TEST-GF-3-2.                                                 NC1234.2
   000421         042400     IF  NUM-9V9 = 5.0                                            NC1234.2 63
   000422      1  042500         PERFORM PASS                                             NC1234.2 220
   000423      1  042600         GO TO IND-WRITE-GF-3-2.                                  NC1234.2 433
   000424         042700     GO TO IND-FAIL-GF-3-2.                                       NC1234.2 428
   000425         042800 IND-DELETE-GF-3-2.                                               NC1234.2
   000426         042900     PERFORM DE-LETE.                                             NC1234.2 222
   000427         043000     GO TO IND-WRITE-GF-3-2.                                      NC1234.2 433
   000428         043100 IND-FAIL-GF-3-2.                                                 NC1234.2
   000429         043200     PERFORM FAIL.                                                NC1234.2 221
   000430         043300     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000431         043400     MOVE 5.0 TO CORRECT-14V4.                                    NC1234.2 99
   000432         043500     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1234.2 75
   000433         043600 IND-WRITE-GF-3-2.                                                NC1234.2
   000434         043700     MOVE "IND-TEST-GF-3-2" TO PAR-NAME.                          NC1234.2 70
   000435         043800     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000436         043900 IND-INIT-GF-4.                                                   NC1234.2
   000437         044000     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000438         044100     MOVE "ADD TO" TO FEATURE.                                    NC1234.2 66
   000439         044200     SET INDEX1 TO 1.                                             NC1234.2 44
   000440         044300     SET INDEX2 TO 1.                                             NC1234.2 48
   000441         044400 IND-TEST-GF-4-0.                                                 NC1234.2
   000442         044500     ADD TABLE1-NUM (INDEX1) TO TABLE2-NUM (INDEX2).              NC1234.2 42 44 46 48
   000443         044600 IND-TEST-GF-4-1.                                                 NC1234.2
   000444         044700     IF TABLE2-NUM (INDEX2) EQUAL TO 6.0                          NC1234.2 46 48
   000445      1  044800        PERFORM PASS                                              NC1234.2 220
   000446      1  044900        ELSE GO TO IND-FAIL-GF-4.                                 NC1234.2 451
   000447         045000     GO TO IND-WRITE-GF-4.                                        NC1234.2 455
   000448         045100 IND-DELETE-GF-4.                                                 NC1234.2
   000449         045200     PERFORM DE-LETE.                                             NC1234.2 222
   000450         045300     GO TO IND-WRITE-GF-4.                                        NC1234.2 455
   000451         045400 IND-FAIL-GF-4.                                                   NC1234.2
   000452         045500     PERFORM FAIL.                                                NC1234.2 221
   000453         045600     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE 6.0 TO CORRECT-14V4.                                    NC1234.2 99
   000455         045800 IND-WRITE-GF-4.                                                  NC1234.2
   000456         045900     MOVE "IND-TEST-GF-4" TO PAR-NAME.                            NC1234.2 70
   000457         046000     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000458         046100 IND-INIT-GF-5.                                                   NC1234.2
   000459         046200     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000460         046300     MOVE "ADD ROUNDED" TO FEATURE.                               NC1234.2 66
   000461         046400     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000462         046500     SET INDEX1 TO 2.                                             NC1234.2 44
   000463         046600     SET INDEX2 TO 2.                                             NC1234.2 48
   000464         046700 IND-TEST-GF-5-0.                                                 NC1234.2
   000465         046800     ADD TABLE1-NUM (INDEX1) TO TABLE2-NUM (INDEX2) ROUNDED.      NC1234.2 42 44 46 48
   000466         046900 IND-TEST-GF-5-1.                                                 NC1234.2
   000467         047000     IF TABLE2-NUM (INDEX2) EQUAL TO 4.7                          NC1234.2 46 48
   000468      1  047100        PERFORM PASS                                              NC1234.2 220
   000469      1  047200        ELSE GO TO IND-FAIL-GF-5.                                 NC1234.2 474
   000470         047300     GO TO IND-WRITE-GF-5.                                        NC1234.2 478
   000471         047400 IND-DELETE-GF-5.                                                 NC1234.2
   000472         047500     PERFORM DE-LETE.                                             NC1234.2 222
   000473         047600     GO TO IND-WRITE-GF-5.                                        NC1234.2 478
   000474         047700 IND-FAIL-GF-5.                                                   NC1234.2
   000475         047800     PERFORM FAIL.                                                NC1234.2 221
   000476         047900     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
   000477         048000     MOVE 4.7 TO CORRECT-14V4.                                    NC1234.2 99
   000478         048100 IND-WRITE-GF-5.                                                  NC1234.2
   000479         048200     MOVE "IND-TEST-GF-5" TO PAR-NAME.                            NC1234.2 70
   000480         048300     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000481         048400 IND-INIT-GF-6.                                                   NC1234.2
   000482         048500     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000483         048600     MOVE "ADD ON SIZE ERROR" TO FEATURE.                         NC1234.2 66
   000484         048700     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000485         048800     SET INDEX1 TO 3.                                             NC1234.2 44
   000486         048900     SET INDEX2 TO 3.                                             NC1234.2 48
   000487         049000 IND-TEST-GF-6-1.                                                 NC1234.2
   000488         049100     ADD TABLE1-NUM (INDEX1) TO TABLE2-NUM (INDEX2) ON SIZE ERROR NC1234.2 42 44 46 48
   000489      1  049200        PERFORM PASS                                              NC1234.2 220
   000490      1  049300        GO TO IND-WRITE-GF-6-1.                                   NC1234.2 499
   000491         049400     GO TO IND-FAIL-GF-6-1.                                       NC1234.2 495
   000492         049500 IND-DELETE-GF-6-1.                                               NC1234.2
   000493         049600     PERFORM DE-LETE.                                             NC1234.2 222
   000494         049700     GO TO IND-WRITE-GF-6-1.                                      NC1234.2 499
   000495         049800 IND-FAIL-GF-6-1.                                                 NC1234.2
   000496         049900     PERFORM FAIL.                                                NC1234.2 221
   000497         050000     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
   000498         050100     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1234.2 75
   000499         050200 IND-WRITE-GF-6-1.                                                NC1234.2
   000500         050300     MOVE "IND-TEST-GF-6-1" TO PAR-NAME.                          NC1234.2 70
   000501         050400     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000502         050500 IND-TEST-GF-6-2.                                                 NC1234.2
   000503         050600     IF   TABLE2-NUM (INDEX2) = 9.0                               NC1234.2 46 48
   000504      1  050700        PERFORM PASS                                              NC1234.2 220
   000505      1  050800        GO TO IND-WRITE-GF-6-2.                                   NC1234.2 515
   000506         050900     GO TO IND-FAIL-GF-6-2.                                       NC1234.2 510
   000507         051000 IND-DELETE-GF-6-2.                                               NC1234.2
   000508         051100     PERFORM DE-LETE.                                             NC1234.2 222
   000509         051200     GO TO IND-WRITE-GF-6-2.                                      NC1234.2 515
   000510         051300 IND-FAIL-GF-6-2.                                                 NC1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     PERFORM FAIL.                                                NC1234.2 221
   000512         051500     MOVE 9.0 TO CORRECT-14V4.                                    NC1234.2 99
   000513         051600     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
   000514         051700     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1234.2 75
   000515         051800 IND-WRITE-GF-6-2.                                                NC1234.2
   000516         051900     MOVE "IND-TEST-GF-6-2" TO PAR-NAME.                          NC1234.2 70
   000517         052000     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000518         052100 IND-INIT-GF-10.                                                  NC1234.2
   000519         052200     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000520         052300     MOVE "ADD GIVING" TO FEATURE.                                NC1234.2 66
   000521         052400     MOVE ZERO TO NUM-9V9.                                        NC1234.2 IMP 63
   000522         052500     SET INDEX1 TO 4.                                             NC1234.2 44
   000523         052600 IND-TEST-GF-10-0.                                                NC1234.2
   000524         052700     ADD 3 TABLE1-NUM (INDEX1) GIVING NUM-9V9.                    NC1234.2 42 44 63
   000525         052800 IND-TEST-GF-10-1.                                                NC1234.2
   000526         052900     IF NUM-9V9 EQUAL TO 8.0                                      NC1234.2 63
   000527      1  053000        PERFORM PASS                                              NC1234.2 220
   000528      1  053100        ELSE GO TO IND-FAIL-GF-10.                                NC1234.2 533
   000529         053200     GO TO IND-WRITE-GF-10.                                       NC1234.2 537
   000530         053300 IND-DELETE-GF-10.                                                NC1234.2
   000531         053400     PERFORM DE-LETE.                                             NC1234.2 222
   000532         053500     GO TO IND-WRITE-GF-10.                                       NC1234.2 537
   000533         053600 IND-FAIL-GF-10.                                                  NC1234.2
   000534         053700     PERFORM FAIL.                                                NC1234.2 221
   000535         053800     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000536         053900     MOVE 8.0 TO CORRECT-14V4.                                    NC1234.2 99
   000537         054000 IND-WRITE-GF-10.                                                 NC1234.2
   000538         054100     MOVE "IND-TEST-GF-10" TO PAR-NAME.                           NC1234.2 70
   000539         054200     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000540         054300 IND-INIT-GF-11.                                                  NC1234.2
   000541         054400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000542         054500     MOVE "ADD GIVING" TO FEATURE.                                NC1234.2 66
   000543         054600     MOVE ZERO TO NUM-9V9.                                        NC1234.2 IMP 63
   000544         054700     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000545         054800     SET INDEX1 TO 1.                                             NC1234.2 44
   000546         054900     SET INDEX2 TO 4.                                             NC1234.2 48
   000547         055000 IND-TEST-GF-11-0.                                                NC1234.2
   000548         055100     ADD TABLE1-NUM (INDEX1) TABLE2-NUM (INDEX2) GIVING NUM-9V9.  NC1234.2 42 44 46 48 63
   000549         055200 IND-TEST-GF-11-1.                                                NC1234.2
   000550         055300     IF NUM-9V9 EQUAL TO 5.0                                      NC1234.2 63
   000551      1  055400        PERFORM PASS                                              NC1234.2 220
   000552      1  055500        ELSE GO TO IND-FAIL-GF-11.                                NC1234.2 557
   000553         055600     GO TO IND-WRITE-GF-11.                                       NC1234.2 561
   000554         055700 IND-DELETE-GF-11.                                                NC1234.2
   000555         055800     PERFORM DE-LETE.                                             NC1234.2 222
   000556         055900     GO TO IND-WRITE-GF-11.                                       NC1234.2 561
   000557         056000 IND-FAIL-GF-11.                                                  NC1234.2
   000558         056100     PERFORM FAIL.                                                NC1234.2 221
   000559         056200     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000560         056300     MOVE 5.0 TO CORRECT-14V4.                                    NC1234.2 99
   000561         056400 IND-WRITE-GF-11.                                                 NC1234.2
   000562         056500     MOVE "IND-TEST-GF-11" TO PAR-NAME.                           NC1234.2 70
   000563         056600     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000564         056700 IND-INIT-GF-12.                                                  NC1234.2
   000565         056800     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000566         056900     MOVE "ADD GIVING" TO FEATURE.                                NC1234.2 66
   000567         057000     PERFORM BUILD-TABLE2.                                        NC1234.2 336
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE ZERO TO TABLE3.                                         NC1234.2 IMP 49
   000569         057200     SET INDEX1 TO 5.                                             NC1234.2 44
   000570         057300     SET INDEX2 TO 1.                                             NC1234.2 48
   000571         057400     SET INDEX3 TO 3.                                             NC1234.2 52
   000572         057500 IND-TEST-GF-12-0.                                                NC1234.2
   000573         057600     ADD TABLE1-NUM (INDEX1) TABLE2-NUM (INDEX2)                  NC1234.2 42 44 46 48
   000574         057700        GIVING TABLE3-NUM (INDEX3).                               NC1234.2 50 52
   000575         057800 IND-TEST-GF-12-1.                                                NC1234.2
   000576         057900     IF TABLE3-NUM (INDEX3) EQUAL TO 7.0                          NC1234.2 50 52
   000577      1  058000        PERFORM PASS                                              NC1234.2 220
   000578      1  058100        ELSE GO TO IND-FAIL-GF-12.                                NC1234.2 583
   000579         058200     GO TO IND-WRITE-GF-12.                                       NC1234.2 587
   000580         058300 IND-DELETE-GF-12.                                                NC1234.2
   000581         058400     PERFORM DE-LETE.                                             NC1234.2 222
   000582         058500     GO TO IND-WRITE-GF-12.                                       NC1234.2 587
   000583         058600 IND-FAIL-GF-12.                                                  NC1234.2
   000584         058700     PERFORM FAIL.                                                NC1234.2 221
   000585         058800     MOVE TABLE3-NUM (INDEX3) TO COMPUTED-14V4.                   NC1234.2 50 52 86
   000586         058900     MOVE 7.0 TO CORRECT-14V4.                                    NC1234.2 99
   000587         059000 IND-WRITE-GF-12.                                                 NC1234.2
   000588         059100     MOVE "IND-TEST-GF-12" TO PAR-NAME.                           NC1234.2 70
   000589         059200     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000590         059300 IND-INIT-GF-7.                                                   NC1234.2
   000591         059400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000592         059500     MOVE "ADD TO" TO FEATURE.                                    NC1234.2 66
   000593         059600     SET INDEX4-1 TO 3.                                           NC1234.2 55
   000594         059700     SET INDEX4-2 TO 2.                                           NC1234.2 58
   000595         059800 IND-TEST-GF-7-0.                                                 NC1234.2
   000596         059900     ADD TABLE4-NUM2 (3  1) TO TABLE4-NUM2 (INDEX4-1  INDEX4-2).  NC1234.2 56 56 55 58
   000597         060000 IND-TEST-GF-7-1.                                                 NC1234.2
   000598         060100     IF TABLE4-NUM2 (INDEX4-1  INDEX4-2) EQUAL TO 53              NC1234.2 56 55 58
   000599      1  060200        PERFORM PASS                                              NC1234.2 220
   000600      1  060300        ELSE GO TO IND-FAIL-GF-7.                                 NC1234.2 605
   000601         060400     GO TO IND-WRITE-GF-7.                                        NC1234.2 609
   000602         060500 IND-DELETE-GF-7.                                                 NC1234.2
   000603         060600     PERFORM DE-LETE.                                             NC1234.2 222
   000604         060700     GO TO IND-WRITE-GF-7.                                        NC1234.2 609
   000605         060800 IND-FAIL-GF-7.                                                   NC1234.2
   000606         060900     PERFORM FAIL.                                                NC1234.2 221
   000607         061000     MOVE TABLE4-NUM2 (INDEX4-1  INDEX4-2) TO COMPUTED-14V4.      NC1234.2 56 55 58 86
   000608         061100     MOVE 53 TO CORRECT-14V4.                                     NC1234.2 99
   000609         061200 IND-WRITE-GF-7.                                                  NC1234.2
   000610         061300     MOVE "IND-TEST-GF-7" TO PAR-NAME.                            NC1234.2 70
   000611         061400     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000612         061500 IND-INIT-GF-8.                                                   NC1234.2
   000613         061600     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000614         061700     MOVE "ADD TO" TO FEATURE.                                    NC1234.2 66
   000615         061800     MOVE 1.6 TO NUM-9V9.                                         NC1234.2 63
   000616         061900     SET INDEX1 TO 5.                                             NC1234.2 44
   000617         062000 IND-TEST-GF-8-0.                                                 NC1234.2
   000618         062100     ADD TABLE1-NUM (INDEX1 + 1) TO NUM-9V9.                      NC1234.2 42 44 63
   000619         062200 IND-TEST-GF-8-1.                                                 NC1234.2
   000620         062300     IF NUM-9V9 EQUAL TO 3.1                                      NC1234.2 63
   000621      1  062400        PERFORM PASS                                              NC1234.2 220
   000622      1  062500        ELSE GO TO IND-FAIL-GF-8.                                 NC1234.2 627
   000623         062600     GO TO IND-WRITE-GF-8.                                        NC1234.2 631
   000624         062700 IND-DELETE-GF-8.                                                 NC1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     PERFORM DE-LETE.                                             NC1234.2 222
   000626         062900     GO TO IND-WRITE-GF-8.                                        NC1234.2 631
   000627         063000 IND-FAIL-GF-8.                                                   NC1234.2
   000628         063100     PERFORM FAIL.                                                NC1234.2 221
   000629         063200     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000630         063300     MOVE 3.1 TO CORRECT-14V4.                                    NC1234.2 99
   000631         063400 IND-WRITE-GF-8.                                                  NC1234.2
   000632         063500     MOVE "IND-TEST-GF-8" TO PAR-NAME.                            NC1234.2 70
   000633         063600     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000634         063700 IND-INIT-GF-9.                                                   NC1234.2
   000635         063800     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000636         063900     MOVE "ADD TO" TO FEATURE.                                    NC1234.2 66
   000637         064000     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000638         064100     SET INDEX1 TO 6.                                             NC1234.2 44
   000639         064200     SET INDEX2 TO 6.                                             NC1234.2 48
   000640         064300 IND-TEST-GF-9-0.                                                 NC1234.2
   000641         064400     ADD TABLE1-NUM (INDEX1 + 1) TO TABLE2-NUM (INDEX2 - 1).      NC1234.2 42 44 46 48
   000642         064500 IND-TEST-GF-9-1.                                                 NC1234.2
   000643         064600     IF TABLE2-NUM (INDEX2 - 1) EQUAL TO 8.1                      NC1234.2 46 48
   000644      1  064700        PERFORM PASS                                              NC1234.2 220
   000645      1  064800        ELSE GO TO IND-FAIL-GF-9.                                 NC1234.2 650
   000646         064900     GO TO IND-WRITE-GF-9.                                        NC1234.2 654
   000647         065000 IND-DELETE-GF-9.                                                 NC1234.2
   000648         065100     PERFORM DE-LETE.                                             NC1234.2 222
   000649         065200     GO TO IND-WRITE-GF-9.                                        NC1234.2 654
   000650         065300 IND-FAIL-GF-9.                                                   NC1234.2
   000651         065400     PERFORM FAIL.                                                NC1234.2 221
   000652         065500     MOVE TABLE2-NUM (INDEX2 - 1) TO COMPUTED-14V4.               NC1234.2 46 48 86
   000653         065600     MOVE 8.1 TO CORRECT-14V4.                                    NC1234.2 99
   000654         065700 IND-WRITE-GF-9.                                                  NC1234.2
   000655         065800     MOVE "IND-TEST-GF-9" TO PAR-NAME.                            NC1234.2 70
   000656         065900     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000657         066000 IND-INIT-GF-13.                                                  NC1234.2
   000658         066100     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000659         066200     MOVE "ADD GIVING" TO FEATURE.                                NC1234.2 66
   000660         066300     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000661         066400     MOVE ZERO TO NUM-9V9.                                        NC1234.2 IMP 63
   000662         066500     SET INDEX1 TO 7.                                             NC1234.2 44
   000663         066600     SET INDEX2 TO 4.                                             NC1234.2 48
   000664         066700 IND-TEST-GF-13-0.                                                NC1234.2
   000665         066800     ADD TABLE1-NUM (INDEX1 + 1) TABLE2-NUM (INDEX2 + 2)          NC1234.2 42 44 46 48
   000666         066900        GIVING NUM-9V9.                                           NC1234.2 63
   000667         067000 IND-TEST-GF-13-1.                                                NC1234.2
   000668         067100     IF NUM-9V9 EQUAL TO 7.9                                      NC1234.2 63
   000669      1  067200        PERFORM PASS                                              NC1234.2 220
   000670      1  067300        ELSE GO TO IND-FAIL-GF-13.                                NC1234.2 675
   000671         067400     GO TO IND-WRITE-GF-13.                                       NC1234.2 679
   000672         067500 IND-DELETE-GF-13.                                                NC1234.2
   000673         067600     PERFORM DE-LETE.                                             NC1234.2 222
   000674         067700     GO TO IND-WRITE-GF-13.                                       NC1234.2 679
   000675         067800 IND-FAIL-GF-13.                                                  NC1234.2
   000676         067900     PERFORM FAIL.                                                NC1234.2 221
   000677         068000     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000678         068100     MOVE 7.9 TO CORRECT-14V4.                                    NC1234.2 99
   000679         068200 IND-WRITE-GF-13.                                                 NC1234.2
   000680         068300     MOVE "IND-TEST-GF-13" TO PAR-NAME.                           NC1234.2 70
   000681         068400     PERFORM PRINT-DETAIL.                                        NC1234.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500 IND-INIT-GF-14.                                                  NC1234.2
   000683         068600     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000684         068700     MOVE "ADD GIVING" TO FEATURE.                                NC1234.2 66
   000685         068800     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000686         068900     MOVE ZERO TO TABLE3.                                         NC1234.2 IMP 49
   000687         069000     SET INDEX1 TO 3.                                             NC1234.2 44
   000688         069100     SET INDEX2 TO 2.                                             NC1234.2 48
   000689         069200     SET INDEX3 TO 6.                                             NC1234.2 52
   000690         069300 IND-TEST-GF-14-0.                                                NC1234.2
   000691         069400     ADD TABLE1-NUM (INDEX1 + 1) TABLE2-NUM (INDEX2 + 1)          NC1234.2 42 44 46 48
   000692         069500        GIVING TABLE3-NUM (INDEX3 - 2).                           NC1234.2 50 52
   000693         069600 IND-TEST-GF-14-1.                                                NC1234.2
   000694         069700     IF TABLE3-NUM (INDEX3 - 2) EQUAL TO 14.0                     NC1234.2 50 52
   000695      1  069800        PERFORM PASS                                              NC1234.2 220
   000696      1  069900        ELSE GO TO IND-FAIL-GF-14.                                NC1234.2 701
   000697         070000     GO TO IND-WRITE-GF-14.                                       NC1234.2 705
   000698         070100 IND-DELETE-GF-14.                                                NC1234.2
   000699         070200     PERFORM DE-LETE.                                             NC1234.2 222
   000700         070300     GO TO IND-WRITE-GF-14.                                       NC1234.2 705
   000701         070400 IND-FAIL-GF-14.                                                  NC1234.2
   000702         070500     PERFORM FAIL.                                                NC1234.2 221
   000703         070600     MOVE TABLE3-NUM (INDEX3 - 2) TO COMPUTED-14V4.               NC1234.2 50 52 86
   000704         070700     MOVE 14.0 TO CORRECT-14V4.                                   NC1234.2 99
   000705         070800 IND-WRITE-GF-14.                                                 NC1234.2
   000706         070900     MOVE "IND-TEST-GF-14" TO PAR-NAME.                           NC1234.2 70
   000707         071000     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000708         071100 IND-INIT-GF-15.                                                  NC1234.2
   000709         071200     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000710         071300     MOVE "SUBTRACT FROM" TO FEATURE.                             NC1234.2 66
   000711         071400     MOVE 3.0 TO NUM-9V9.                                         NC1234.2 63
   000712         071500     SET INDEX1 TO 1.                                             NC1234.2 44
   000713         071600 IND-TEST-GF-15-0.                                                NC1234.2
   000714         071700     SUBTRACT TABLE1-NUM (INDEX1) FROM NUM-9V9.                   NC1234.2 42 44 63
   000715         071800 IND-TEST-GF-15-1.                                                NC1234.2
   000716         071900     IF NUM-9V9 EQUAL TO 2.0                                      NC1234.2 63
   000717      1  072000        PERFORM PASS                                              NC1234.2 220
   000718      1  072100        ELSE GO TO IND-FAIL-GF-15.                                NC1234.2 723
   000719         072200     GO TO IND-WRITE-GF-15.                                       NC1234.2 727
   000720         072300 IND-DELETE-GF-15.                                                NC1234.2
   000721         072400     PERFORM DE-LETE.                                             NC1234.2 222
   000722         072500     GO TO IND-WRITE-GF-15.                                       NC1234.2 727
   000723         072600 IND-FAIL-GF-15.                                                  NC1234.2
   000724         072700     PERFORM FAIL.                                                NC1234.2 221
   000725         072800     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000726         072900     MOVE 2.0 TO CORRECT-14V4.                                    NC1234.2 99
   000727         073000 IND-WRITE-GF-15.                                                 NC1234.2
   000728         073100     MOVE "IND-TEST-GF-15" TO PAR-NAME.                           NC1234.2 70
   000729         073200     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000730         073300 IND-INIT-GF-16.                                                  NC1234.2
   000731         073400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000732         073500     MOVE "SUBTRACT ROUNDED" TO FEATURE.                          NC1234.2 66
   000733         073600     MOVE 5.0 TO NUM-9V9.                                         NC1234.2 63
   000734         073700     SET INDEX1 TO 9.                                             NC1234.2 44
   000735         073800 IND-TEST-GF-16-0.                                                NC1234.2
   000736         073900     SUBTRACT TABLE1-NUM (INDEX1) FROM NUM-9V9 ROUNDED.           NC1234.2 42 44 63
   000737         074000 IND-TEST-GF-16-1.                                                NC1234.2
   000738         074100     IF NUM-9V9 EQUAL TO 2.4                                      NC1234.2 63
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  074200        PERFORM PASS                                              NC1234.2 220
   000740      1  074300        ELSE GO TO IND-FAIL-GF-16.                                NC1234.2 745
   000741         074400     GO TO IND-WRITE-GF-16.                                       NC1234.2 749
   000742         074500 IND-DELETE-GF-16.                                                NC1234.2
   000743         074600     PERFORM DE-LETE.                                             NC1234.2 222
   000744         074700     GO TO IND-WRITE-GF-16.                                       NC1234.2 749
   000745         074800 IND-FAIL-GF-16.                                                  NC1234.2
   000746         074900     PERFORM FAIL.                                                NC1234.2 221
   000747         075000     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000748         075100     MOVE 2.4 TO CORRECT-14V4.                                    NC1234.2 99
   000749         075200 IND-WRITE-GF-16.                                                 NC1234.2
   000750         075300     MOVE "IND-TEST-GF-16" TO PAR-NAME.                           NC1234.2 70
   000751         075400     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000752         075500 IND-INIT-GF-17.                                                  NC1234.2
   000753         075600     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000754         075700     MOVE "SUBTRACT ON SIZE ERROR" TO FEATURE.                    NC1234.2 66
   000755         075800     MOVE 9.0 TO NUM-9V9.                                         NC1234.2 63
   000756         075900     SET INDEX1 TO 10.                                            NC1234.2 44
   000757         076000 IND-TEST-GF-17-1.                                                NC1234.2
   000758         076100     SUBTRACT TABLE1-NUM (INDEX1) FROM NUM-9V9 ON SIZE ERROR      NC1234.2 42 44 63
   000759      1  076200        PERFORM PASS                                              NC1234.2 220
   000760      1  076300        GO TO IND-WRITE-GF-17-1.                                  NC1234.2 769
   000761         076400     GO TO IND-FAIL-GF-17-1.                                      NC1234.2 765
   000762         076500 IND-DELETE-GF-17-1.                                              NC1234.2
   000763         076600     PERFORM DE-LETE.                                             NC1234.2 222
   000764         076700     GO TO IND-WRITE-GF-17-1.                                     NC1234.2 769
   000765         076800 IND-FAIL-GF-17-1.                                                NC1234.2
   000766         076900     PERFORM FAIL.                                                NC1234.2 221
   000767         077000     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000768         077100     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1234.2 75
   000769         077200 IND-WRITE-GF-17-1.                                               NC1234.2
   000770         077300     MOVE "IND-TEST-GF-17-1" TO PAR-NAME.                         NC1234.2 70
   000771         077400     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000772         077500 IND-TEST-GF-17-2.                                                NC1234.2
   000773         077600     IF      NUM-9V9 = 9.0                                        NC1234.2 63
   000774      1  077700             PERFORM PASS                                         NC1234.2 220
   000775      1  077800             GO TO   IND-WRITE-GF-17-2.                           NC1234.2 784
   000776         077900     GO TO   IND-FAIL-GF-17-2.                                    NC1234.2 780
   000777         078000 IND-DELETE-GF-17-2.                                              NC1234.2
   000778         078100     PERFORM DE-LETE.                                             NC1234.2 222
   000779         078200     GO TO IND-WRITE-GF-17-2.                                     NC1234.2 784
   000780         078300 IND-FAIL-GF-17-2.                                                NC1234.2
   000781         078400     PERFORM FAIL.                                                NC1234.2 221
   000782         078500     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000783         078600     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1234.2 75
   000784         078700 IND-WRITE-GF-17-2.                                               NC1234.2
   000785         078800     MOVE "IND-TEST-GF-17-2" TO PAR-NAME.                         NC1234.2 70
   000786         078900     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000787         079000 IND-INIT-GF-18.                                                  NC1234.2
   000788         079100     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000789         079200     MOVE "SUBTRACT FROM" TO FEATURE.                             NC1234.2 66
   000790         079300     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000791         079400     SET INDEX1 TO 1.                                             NC1234.2 44
   000792         079500     SET INDEX2 TO 1.                                             NC1234.2 48
   000793         079600 IND-TEST-GF-18-0.                                                NC1234.2
   000794         079700     SUBTRACT TABLE1-NUM (INDEX1) FROM TABLE2-NUM (INDEX2).       NC1234.2 42 44 46 48
   000795         079800 IND-TEST-GF-18-1.                                                NC1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     IF TABLE2-NUM (INDEX2) EQUAL TO 4.0                          NC1234.2 46 48
   000797      1  080000        PERFORM PASS                                              NC1234.2 220
   000798      1  080100        ELSE GO TO IND-FAIL-GF-18.                                NC1234.2 803
   000799         080200     GO TO IND-WRITE-GF-18.                                       NC1234.2 807
   000800         080300 IND-DELETE-GF-18.                                                NC1234.2
   000801         080400     PERFORM DE-LETE.                                             NC1234.2 222
   000802         080500     GO TO IND-WRITE-GF-18.                                       NC1234.2 807
   000803         080600 IND-FAIL-GF-18.                                                  NC1234.2
   000804         080700     PERFORM FAIL.                                                NC1234.2 221
   000805         080800     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
   000806         080900     MOVE 4.0 TO CORRECT-14V4.                                    NC1234.2 99
   000807         081000 IND-WRITE-GF-18.                                                 NC1234.2
   000808         081100     MOVE "IND-TEST-GF-18" TO PAR-NAME.                           NC1234.2 70
   000809         081200     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000810         081300 IND-INIT-GF-19.                                                  NC1234.2
   000811         081400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000812         081500     MOVE "SUBTRACT ROUNDED" TO FEATURE.                          NC1234.2 66
   000813         081600     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000814         081700     SET INDEX1 TO 9.                                             NC1234.2 44
   000815         081800     SET INDEX2 TO 3.                                             NC1234.2 48
   000816         081900 IND-TEST-GF-19-0.                                                NC1234.2
   000817         082000     SUBTRACT TABLE1-NUM (INDEX1) FROM TABLE2-NUM (INDEX2)        NC1234.2 42 44 46 48
   000818         082100        ROUNDED.                                                  NC1234.2
   000819         082200 IND-TEST-GF-19-1.                                                NC1234.2
   000820         082300     IF TABLE2-NUM (INDEX2) EQUAL TO 6.4                          NC1234.2 46 48
   000821      1  082400        PERFORM PASS                                              NC1234.2 220
   000822      1  082500        ELSE GO TO IND-FAIL-GF-19.                                NC1234.2 827
   000823         082600     GO TO IND-WRITE-GF-19.                                       NC1234.2 831
   000824         082700 IND-DELETE-GF-19.                                                NC1234.2
   000825         082800     PERFORM DE-LETE.                                             NC1234.2 222
   000826         082900     GO TO IND-WRITE-GF-19.                                       NC1234.2 831
   000827         083000 IND-FAIL-GF-19.                                                  NC1234.2
   000828         083100     PERFORM FAIL.                                                NC1234.2 221
   000829         083200     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
   000830         083300     MOVE 6.4 TO CORRECT-14V4.                                    NC1234.2 99
   000831         083400 IND-WRITE-GF-19.                                                 NC1234.2
   000832         083500     MOVE "IND-TEST-GF-19" TO PAR-NAME.                           NC1234.2 70
   000833         083600     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000834         083700 IND-INIT-GF-20.                                                  NC1234.2
   000835         083800     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000836         083900     MOVE "SUBTRACT ON SIZE ERROR" TO FEATURE.                    NC1234.2 66
   000837         084000     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000838         084100     SET INDEX1 TO 10.                                            NC1234.2 44
   000839         084200     SET INDEX2 TO 4.                                             NC1234.2 48
   000840         084300 IND-TEST-GF-20-1.                                                NC1234.2
   000841         084400     SUBTRACT TABLE1-NUM (INDEX1) FROM TABLE2-NUM (INDEX2)        NC1234.2 42 44 46 48
   000842         084500        ON SIZE ERROR                                             NC1234.2
   000843      1  084600        PERFORM PASS                                              NC1234.2 220
   000844      1  084700        GO TO IND-WRITE-GF-20-1.                                  NC1234.2 853
   000845         084800     GO TO IND-FAIL-GF-20-1.                                      NC1234.2 849
   000846         084900 IND-DELETE-GF-20-1.                                              NC1234.2
   000847         085000     PERFORM DE-LETE.                                             NC1234.2 222
   000848         085100     GO TO IND-WRITE-GF-20-1.                                     NC1234.2 853
   000849         085200 IND-FAIL-GF-20-1.                                                NC1234.2
   000850         085300     PERFORM FAIL.                                                NC1234.2 221
   000851         085400     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
   000852         085500     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1234.2 75
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600 IND-WRITE-GF-20-1.                                               NC1234.2
   000854         085700     MOVE "IND-TEST-GF-20-1" TO PAR-NAME.                         NC1234.2 70
   000855         085800     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000856         085900 IND-TEST-GF-20-2.                                                NC1234.2
   000857         086000     IF      TABLE2-NUM (INDEX2) = 4.0                            NC1234.2 46 48
   000858      1  086100             PERFORM PASS                                         NC1234.2 220
   000859      1  086200             GO TO   IND-WRITE-GF-20-2.                           NC1234.2 869
   000860         086300     GO TO   IND-FAIL-GF-20-2.                                    NC1234.2 864
   000861         086400 IND-DELETE-GF-20-2.                                              NC1234.2
   000862         086500     PERFORM DE-LETE.                                             NC1234.2 222
   000863         086600     GO TO IND-WRITE-GF-20-2.                                     NC1234.2 869
   000864         086700 IND-FAIL-GF-20-2.                                                NC1234.2
   000865         086800     PERFORM FAIL.                                                NC1234.2 221
   000866         086900     MOVE TABLE2-NUM (INDEX2) TO COMPUTED-14V4.                   NC1234.2 46 48 86
   000867         087000     MOVE 4 TO CORRECT-14V4.                                      NC1234.2 99
   000868         087100     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1234.2 75
   000869         087200 IND-WRITE-GF-20-2.                                               NC1234.2
   000870         087300     MOVE "IND-TEST-GF-20-2" TO PAR-NAME.                         NC1234.2 70
   000871         087400     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000872         087500 IND-INIT-GF-24.                                                  NC1234.2
   000873         087600     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000874         087700     MOVE "SUBTRACT GIVING" TO FEATURE.                           NC1234.2 66
   000875         087800     MOVE ZERO TO NUM-9V9.                                        NC1234.2 IMP 63
   000876         087900     SET INDEX1 TO 1.                                             NC1234.2 44
   000877         088000 IND-TEST-GF-24-0.                                                NC1234.2
   000878         088100     SUBTRACT TABLE1-NUM (INDEX1) FROM 8 GIVING NUM-9V9.          NC1234.2 42 44 63
   000879         088200 IND-TEST-GF-24-1.                                                NC1234.2
   000880         088300     IF NUM-9V9 EQUAL TO 7.0                                      NC1234.2 63
   000881      1  088400        PERFORM PASS                                              NC1234.2 220
   000882      1  088500        ELSE GO TO IND-FAIL-GF-24.                                NC1234.2 887
   000883         088600     GO TO IND-WRITE-GF-24.                                       NC1234.2 891
   000884         088700 IND-DELETE-GF-24.                                                NC1234.2
   000885         088800     PERFORM DE-LETE.                                             NC1234.2 222
   000886         088900     GO TO IND-WRITE-GF-24.                                       NC1234.2 891
   000887         089000 IND-FAIL-GF-24.                                                  NC1234.2
   000888         089100     PERFORM FAIL.                                                NC1234.2 221
   000889         089200     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000890         089300     MOVE 7.0 TO CORRECT-14V4.                                    NC1234.2 99
   000891         089400 IND-WRITE-GF-24.                                                 NC1234.2
   000892         089500     MOVE "IND-TEST-GF-24" TO PAR-NAME.                           NC1234.2 70
   000893         089600     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000894         089700 IND-INIT-GF-25.                                                  NC1234.2
   000895         089800     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000896         089900     MOVE "SUBTRACT GIVING" TO FEATURE.                           NC1234.2 66
   000897         090000     MOVE ZERO TO NUM-9V9.                                        NC1234.2 IMP 63
   000898         090100     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000899         090200     SET INDEX1 TO 1.                                             NC1234.2 44
   000900         090300     SET INDEX2 TO 3.                                             NC1234.2 48
   000901         090400 IND-TEST-GF-25-0.                                                NC1234.2
   000902         090500     SUBTRACT TABLE1-NUM (INDEX1) FROM TABLE2-NUM (INDEX2)        NC1234.2 42 44 46 48
   000903         090600        GIVING NUM-9V9.                                           NC1234.2 63
   000904         090700 IND-TEST-GF-25-1.                                                NC1234.2
   000905         090800     IF NUM-9V9 EQUAL TO 8.0                                      NC1234.2 63
   000906      1  090900        PERFORM PASS                                              NC1234.2 220
   000907      1  091000        ELSE GO TO IND-FAIL-GF-25.                                NC1234.2 912
   000908         091100     GO TO IND-WRITE-GF-25.                                       NC1234.2 916
   000909         091200 IND-DELETE-GF-25.                                                NC1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     PERFORM DE-LETE.                                             NC1234.2 222
   000911         091400     GO TO IND-WRITE-GF-25.                                       NC1234.2 916
   000912         091500 IND-FAIL-GF-25.                                                  NC1234.2
   000913         091600     PERFORM FAIL.                                                NC1234.2 221
   000914         091700     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000915         091800     MOVE 8.0 TO CORRECT-14V4.                                    NC1234.2 99
   000916         091900 IND-WRITE-GF-25.                                                 NC1234.2
   000917         092000     MOVE "IND-TEST-GF-25" TO PAR-NAME.                           NC1234.2 70
   000918         092100     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000919         092200 IND-INIT-GF-26.                                                  NC1234.2
   000920         092300     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000921         092400     MOVE "SUBTRACT GIVING" TO FEATURE.                           NC1234.2 66
   000922         092500     MOVE ZERO TO TABLE3.                                         NC1234.2 IMP 49
   000923         092600     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000924         092700     SET INDEX1 TO 10.                                            NC1234.2 44
   000925         092800     SET INDEX2 TO 1.                                             NC1234.2 48
   000926         092900     SET INDEX3 TO 3.                                             NC1234.2 52
   000927         093000 IND-TEST-GF-26-0.                                                NC1234.2
   000928         093100     SUBTRACT TABLE1-NUM (INDEX1) FROM TABLE2-NUM (INDEX2)        NC1234.2 42 44 46 48
   000929         093200        GIVING TABLE3-NUM (INDEX3).                               NC1234.2 50 52
   000930         093300 IND-TEST-GF-26-1.                                                NC1234.2
   000931         093400     IF TABLE3-NUM (INDEX3) EQUAL TO 14.0                         NC1234.2 50 52
   000932      1  093500        PERFORM PASS                                              NC1234.2 220
   000933      1  093600        ELSE GO TO IND-FAIL-GF-26.                                NC1234.2 938
   000934         093700     GO TO IND-WRITE-GF-26.                                       NC1234.2 942
   000935         093800 IND-DELETE-GF-26.                                                NC1234.2
   000936         093900     PERFORM DE-LETE.                                             NC1234.2 222
   000937         094000     GO TO IND-WRITE-GF-26.                                       NC1234.2 942
   000938         094100 IND-FAIL-GF-26.                                                  NC1234.2
   000939         094200     PERFORM FAIL.                                                NC1234.2 221
   000940         094300     MOVE TABLE3-NUM (INDEX3) TO COMPUTED-14V4.                   NC1234.2 50 52 86
   000941         094400     MOVE 14.0 TO CORRECT-14V4.                                   NC1234.2 99
   000942         094500 IND-WRITE-GF-26.                                                 NC1234.2
   000943         094600     MOVE "IND-TEST-GF-26" TO PAR-NAME.                           NC1234.2 70
   000944         094700     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000945         094800 IND-INIT-GF-21.                                                  NC1234.2
   000946         094900     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000947         095000     MOVE "SUBTRACT FROM" TO FEATURE.                             NC1234.2 66
   000948         095100     PERFORM BUILD-TABLE4.                                        NC1234.2 343
   000949         095200     SET INDEX4-1 TO 3.                                           NC1234.2 55
   000950         095300     SET INDEX4-2 TO 3.                                           NC1234.2 58
   000951         095400 IND-TEST-GF-21-0.                                                NC1234.2
   000952         095500     SUBTRACT TABLE4-NUM2 (1  1) FROM                             NC1234.2 56
   000953         095600        TABLE4-NUM2 (INDEX4-1  INDEX4-2).                         NC1234.2 56 55 58
   000954         095700 IND-TEST-GF-21-1.                                                NC1234.2
   000955         095800     IF TABLE4-NUM2 (INDEX4-1  INDEX4-2) EQUAL TO 8               NC1234.2 56 55 58
   000956      1  095900        PERFORM PASS                                              NC1234.2 220
   000957      1  096000        ELSE GO TO IND-FAIL-GF-21.                                NC1234.2 962
   000958         096100     GO TO IND-WRITE-GF-21.                                       NC1234.2 966
   000959         096200 IND-DELETE-GF-21.                                                NC1234.2
   000960         096300     PERFORM DE-LETE.                                             NC1234.2 222
   000961         096400     GO TO IND-WRITE-GF-21.                                       NC1234.2 966
   000962         096500 IND-FAIL-GF-21.                                                  NC1234.2
   000963         096600     PERFORM FAIL.                                                NC1234.2 221
   000964         096700     MOVE TABLE4-NUM2 (INDEX4-1  INDEX4-2) TO COMPUTED-14V4.      NC1234.2 56 55 58 86
   000965         096800     MOVE 8.0 TO CORRECT-14V4.                                    NC1234.2 99
   000966         096900 IND-WRITE-GF-21.                                                 NC1234.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     MOVE "SUBTRCT-TEST-GF-21" TO PAR-NAME.                       NC1234.2 70
   000968         097100     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000969         097200 IND-INIT-GF-22.                                                  NC1234.2
   000970         097300     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000971         097400     MOVE "SUBTRACT FROM" TO FEATURE.                             NC1234.2 66
   000972         097500     MOVE 0.0 TO NUM-9V9.                                         NC1234.2 63
   000973         097600     SET INDEX1 TO 9.                                             NC1234.2 44
   000974         097700 IND-TEST-GF-22-0.                                                NC1234.2
   000975         097800     SUBTRACT TABLE1-NUM (INDEX1 + 1) FROM NUM-9V9.               NC1234.2 42 44 63
   000976         097900 IND-TEST-GF-22-1.                                                NC1234.2
   000977         098000     IF NUM-9V9 EQUAL TO 9.0                                      NC1234.2 63
   000978      1  098100        PERFORM PASS                                              NC1234.2 220
   000979      1  098200        ELSE GO TO IND-FAIL-GF-22.                                NC1234.2 984
   000980         098300     GO TO IND-WRITE-GF-22.                                       NC1234.2 988
   000981         098400 IND-DELETE-GF-22.                                                NC1234.2
   000982         098500     PERFORM DE-LETE.                                             NC1234.2 222
   000983         098600     GO TO IND-WRITE-GF-22.                                       NC1234.2 988
   000984         098700 IND-FAIL-GF-22.                                                  NC1234.2
   000985         098800     PERFORM FAIL.                                                NC1234.2 221
   000986         098900     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   000987         099000     MOVE 9.0 TO CORRECT-14V4.                                    NC1234.2 99
   000988         099100 IND-WRITE-GF-22.                                                 NC1234.2
   000989         099200     MOVE "SUBTRCT-TEST-GF-22" TO PAR-NAME.                       NC1234.2 70
   000990         099300     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   000991         099400 IND-INIT-GF-23.                                                  NC1234.2
   000992         099500     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   000993         099600     MOVE "SUBTRACT FROM" TO FEATURE.                             NC1234.2 66
   000994         099700     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   000995         099800     SET INDEX1 TO 9.                                             NC1234.2 44
   000996         099900     SET INDEX2 TO 6.                                             NC1234.2 48
   000997         100000 IND-TEST-GF-23-0.                                                NC1234.2
   000998         100100     SUBTRACT TABLE1-NUM (INDEX1 - 2) FROM                        NC1234.2 42 44
   000999         100200        TABLE2-NUM (INDEX2 - 1).                                  NC1234.2 46 48
   001000         100300 IND-TEST-GF-23-1.                                                NC1234.2
   001001         100400     IF TABLE2-NUM (INDEX2 - 1) EQUAL TO 1.1                      NC1234.2 46 48
   001002      1  100500        PERFORM PASS                                              NC1234.2 220
   001003      1  100600        ELSE GO TO IND-FAIL-GF-23.                                NC1234.2 1008
   001004         100700     GO TO IND-WRITE-GF-23.                                       NC1234.2 1012
   001005         100800 IND-DELETE-GF-23.                                                NC1234.2
   001006         100900     PERFORM DE-LETE.                                             NC1234.2 222
   001007         101000     GO TO IND-WRITE-GF-23.                                       NC1234.2 1012
   001008         101100 IND-FAIL-GF-23.                                                  NC1234.2
   001009         101200     PERFORM FAIL.                                                NC1234.2 221
   001010         101300     MOVE TABLE2-NUM (INDEX2 - 1) TO COMPUTED-14V4.               NC1234.2 46 48 86
   001011         101400     MOVE 1.1 TO CORRECT-14V4.                                    NC1234.2 99
   001012         101500 IND-WRITE-GF-23.                                                 NC1234.2
   001013         101600     MOVE "SUBTRCT-TEST-GF-23" TO PAR-NAME.                       NC1234.2 70
   001014         101700     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   001015         101800 IND-INIT-GF-27.                                                  NC1234.2
   001016         101900     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   001017         102000     MOVE "SUBTRACT GIVING" TO FEATURE.                           NC1234.2 66
   001018         102100     MOVE ZERO TO NUM-9V9.                                        NC1234.2 IMP 63
   001019         102200     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   001020         102300     SET INDEX1 TO 7.                                             NC1234.2 44
   001021         102400     SET INDEX2 TO 4.                                             NC1234.2 48
   001022         102500 IND-TEST-GF-27-0.                                                NC1234.2
   001023         102600     SUBTRACT TABLE1-NUM (INDEX1 - 2) FROM                        NC1234.2 42 44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700        TABLE2-NUM (INDEX2 - 1) GIVING NUM-9V9.                   NC1234.2 46 48 63
   001025         102800 IND-TEST-GF-27-1.                                                NC1234.2
   001026         102900     IF NUM-9V9 EQUAL TO 7.0                                      NC1234.2 63
   001027      1  103000        PERFORM PASS                                              NC1234.2 220
   001028      1  103100        ELSE GO TO IND-FAIL-GF-27.                                NC1234.2 1033
   001029         103200     GO TO IND-WRITE-GF-27.                                       NC1234.2 1037
   001030         103300 IND-DELETE-GF-27.                                                NC1234.2
   001031         103400     PERFORM DE-LETE.                                             NC1234.2 222
   001032         103500     GO TO IND-WRITE-GF-27.                                       NC1234.2 1037
   001033         103600 IND-FAIL-GF-27.                                                  NC1234.2
   001034         103700     PERFORM FAIL.                                                NC1234.2 221
   001035         103800     MOVE NUM-9V9 TO COMPUTED-14V4.                               NC1234.2 63 86
   001036         103900     MOVE 7.0 TO CORRECT-14V4.                                    NC1234.2 99
   001037         104000 IND-WRITE-GF-27.                                                 NC1234.2
   001038         104100     MOVE "SUBTRCT-TEST-GF-27" TO PAR-NAME.                       NC1234.2 70
   001039         104200     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   001040         104300 IND-INIT-GF-28.                                                  NC1234.2
   001041         104400     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   001042         104500     MOVE "SUBTRACT GIVING" TO FEATURE.                           NC1234.2 66
   001043         104600     MOVE ZERO TO TABLE3.                                         NC1234.2 IMP 49
   001044         104700     PERFORM BUILD-TABLE2.                                        NC1234.2 336
   001045         104800     SET INDEX1 TO 8.                                             NC1234.2 44
   001046         104900     SET INDEX2 TO 2.                                             NC1234.2 48
   001047         105000     SET INDEX3 TO 6.                                             NC1234.2 52
   001048         105100 IND-TEST-GF-28-0.                                                NC1234.2
   001049         105200     SUBTRACT TABLE1-NUM (INDEX1 + 2) FROM                        NC1234.2 42 44
   001050         105300        TABLE2-NUM (INDEX2 + 1) GIVING TABLE3-NUM (INDEX3 - 1).   NC1234.2 46 48 50 52
   001051         105400 IND-TEST-GF-28-1.                                                NC1234.2
   001052         105500     IF TABLE3-NUM (INDEX3 - 1) EQUAL TO 18.0                     NC1234.2 50 52
   001053      1  105600        PERFORM PASS                                              NC1234.2 220
   001054      1  105700        ELSE GO TO IND-FAIL-GF-28.                                NC1234.2 1059
   001055         105800     GO TO IND-WRITE-GF-28.                                       NC1234.2 1063
   001056         105900 IND-DELETE-GF-28.                                                NC1234.2
   001057         106000     PERFORM DE-LETE.                                             NC1234.2 222
   001058         106100     GO TO IND-WRITE-GF-28.                                       NC1234.2 1063
   001059         106200 IND-FAIL-GF-28.                                                  NC1234.2
   001060         106300     PERFORM FAIL.                                                NC1234.2 221
   001061         106400     MOVE TABLE3-NUM (INDEX3 - 1) TO COMPUTED-14V4.               NC1234.2 50 52 86
   001062         106500     MOVE 18.0 TO CORRECT-14V4.                                   NC1234.2 99
   001063         106600 IND-WRITE-GF-28.                                                 NC1234.2
   001064         106700     MOVE "SUBTRCT-TEST-GF-28" TO PAR-NAME.                       NC1234.2 70
   001065         106800     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   001066         106900 IND-INIT-GF-29.                                                  NC1234.2
   001067         107000     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   001068         107100     MOVE "GO TO DEPENDING ON" TO FEATURE.                        NC1234.2 66
   001069         107200     SET INDEX5 TO 1.                                             NC1234.2 62
   001070         107300 IND-TEST-GF-29.                                                  NC1234.2
   001071         107400     GO TO IND-A                                                  NC1234.2 1082
   001072         107500           IND-B                                                  NC1234.2 1086
   001073         107600           IND-C DEPENDING ON TABLE5-NUM (INDEX5).                NC1234.2 1090 60 62
   001074         107700     GO TO IND-FAIL-GF-29.                                        NC1234.2 1078
   001075         107800 IND-DELETE-GF-29.                                                NC1234.2
   001076         107900     PERFORM DE-LETE.                                             NC1234.2 222
   001077         108000     GO TO IND-WRITE-GF-29.                                       NC1234.2 1092
   001078         108100 IND-FAIL-GF-29.                                                  NC1234.2
   001079         108200     PERFORM FAIL.                                                NC1234.2 221
   001080         108300     MOVE "TRANSFERED CONTROL TO WRONG PAR" TO RE-MARK.           NC1234.2 75
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400     GO TO IND-WRITE-GF-29.                                       NC1234.2 1092
   001082         108500 IND-A.                                                           NC1234.2
   001083         108600     MOVE "IND-A" TO COMPUTED-A.                                  NC1234.2 81
   001084         108700     MOVE "IND-C" TO CORRECT-A.                                   NC1234.2 95
   001085         108800     GO TO IND-FAIL-GF-29.                                        NC1234.2 1078
   001086         108900 IND-B.                                                           NC1234.2
   001087         109000     MOVE "IND-B" TO COMPUTED-A.                                  NC1234.2 81
   001088         109100     MOVE "IND-C" TO CORRECT-A.                                   NC1234.2 95
   001089         109200     GO TO IND-FAIL-GF-29.                                        NC1234.2 1078
   001090         109300 IND-C.                                                           NC1234.2
   001091         109400     PERFORM PASS.                                                NC1234.2 220
   001092         109500 IND-WRITE-GF-29.                                                 NC1234.2
   001093         109600     MOVE "IND-TEST-GF-29" TO PAR-NAME.                           NC1234.2 70
   001094         109700     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   001095         109800 IND-INIT-GF-30.                                                  NC1234.2
   001096         109900     MOVE "IV-21 4.3.8.2.3/4" TO ANSI-REFERENCE.                  NC1234.2 126
   001097         110000     MOVE "GO TO DEPENDING ON" TO FEATURE.                        NC1234.2 66
   001098         110100     SET INDEX5 TO 1.                                             NC1234.2 62
   001099         110200 IND-TEST-GF-30.                                                  NC1234.2
   001100         110300     GO TO IND-D                                                  NC1234.2 1111
   001101         110400           IND-E                                                  NC1234.2 1119
   001102         110500           IND-F DEPENDING ON TABLE5-NUM (INDEX5 + 1).            NC1234.2 1115 60 62
   001103         110600     GO TO IND-FAIL-GF-30.                                        NC1234.2 1107
   001104         110700 IND-DELETE-GF-30.                                                NC1234.2
   001105         110800     PERFORM DE-LETE.                                             NC1234.2 222
   001106         110900     GO TO IND-WRITE-GF-30.                                       NC1234.2 1121
   001107         111000 IND-FAIL-GF-30.                                                  NC1234.2
   001108         111100     PERFORM FAIL.                                                NC1234.2 221
   001109         111200     MOVE "TRANSFERED CONTROL TO WRONG PAR" TO RE-MARK.           NC1234.2 75
   001110         111300     GO TO IND-WRITE-GF-30.                                       NC1234.2 1121
   001111         111400 IND-D.                                                           NC1234.2
   001112         111500     MOVE "IND-D" TO COMPUTED-A.                                  NC1234.2 81
   001113         111600     MOVE "IND-E" TO CORRECT-A.                                   NC1234.2 95
   001114         111700     GO TO IND-FAIL-GF-30.                                        NC1234.2 1107
   001115         111800 IND-F.                                                           NC1234.2
   001116         111900     MOVE "IND-F" TO COMPUTED-A.                                  NC1234.2 81
   001117         112000     MOVE "IND-E" TO CORRECT-A.                                   NC1234.2 95
   001118         112100     GO TO IND-FAIL-GF-30.                                        NC1234.2 1107
   001119         112200 IND-E.                                                           NC1234.2
   001120         112300     PERFORM PASS.                                                NC1234.2 220
   001121         112400 IND-WRITE-GF-30.                                                 NC1234.2
   001122         112500     MOVE "IND-TEST-GF-30" TO PAR-NAME.                           NC1234.2 70
   001123         112600     PERFORM PRINT-DETAIL.                                        NC1234.2 224
   001124         112700 CCVS-EXIT SECTION.                                               NC1234.2
   001125         112800 CCVS-999999.                                                     NC1234.2
   001126         112900     GO TO CLOSE-FILES.                                           NC1234.2 213
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    23
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      126   ANSI-REFERENCE . . . . . . . .  303 310 319 M358 M379 M401 M437 M459 M482 M519 M541 M565 M591 M613 M635 M658
                                            M683 M709 M731 M753 M788 M811 M835 M873 M895 M920 M946 M970 M992 M1016 M1041
                                            M1067 M1096
      105   CCVS-C-1 . . . . . . . . . . .  242 288
      110   CCVS-C-2 . . . . . . . . . . .  243 289
      160   CCVS-E-1 . . . . . . . . . . .  248
      165   CCVS-E-2 . . . . . . . . . . .  257 264 271 276
      168   CCVS-E-2-2 . . . . . . . . . .  M256
      173   CCVS-E-3 . . . . . . . . . . .  277
      182   CCVS-E-4 . . . . . . . . . . .  256
      183   CCVS-E-4-1 . . . . . . . . . .  M254
      185   CCVS-E-4-2 . . . . . . . . . .  M255
      127   CCVS-H-1 . . . . . . . . . . .  237 284
      132   CCVS-H-2A. . . . . . . . . . .  238 285
      141   CCVS-H-2B. . . . . . . . . . .  239 286
      153   CCVS-H-3 . . . . . . . . . . .  240 287
      203   CCVS-PGM-ID. . . . . . . . . .  209 209
       87   CM-18V0
       81   COMPUTED-A . . . . . . . . . .  82 84 85 86 87 315 318 M1083 M1087 M1112 M1116
       82   COMPUTED-N
       80   COMPUTED-X . . . . . . . . . .  M232 300
       84   COMPUTED-0V18
       86   COMPUTED-14V4. . . . . . . . .  M373 M395 M415 M430 M453 M476 M497 M513 M535 M559 M585 M607 M629 M652 M677 M703
                                            M725 M747 M767 M782 M805 M829 M851 M866 M889 M914 M940 M964 M986 M1010 M1035
                                            M1061
       88   COMPUTED-18V0
       85   COMPUTED-4V14
      104   COR-ANSI-REFERENCE . . . . . .  M310 M312
       95   CORRECT-A. . . . . . . . . . .  96 97 98 99 100 316 318 M1084 M1088 M1113 M1117
       96   CORRECT-N
       94   CORRECT-X. . . . . . . . . . .  M233 302
       97   CORRECT-0V18
       99   CORRECT-14V4 . . . . . . . . .  M374 M396 M431 M454 M477 M512 M536 M560 M586 M608 M630 M653 M678 M704 M726 M748
                                            M806 M830 M867 M890 M915 M941 M965 M987 M1011 M1036 M1062
      101   CORRECT-18V0
       98   CORRECT-4V14
      100   CR-18V0
      118   DELETE-COUNTER . . . . . . . .  M222 251 267 269
       73   DOTVALUE . . . . . . . . . . .  M227
      124   DUMMY-HOLD . . . . . . . . . .  M281 291
       39   DUMMY-RECORD . . . . . . . . .  M237 M238 M239 M240 M242 M243 M244 M246 M248 M257 M264 M271 M276 M277 281 M282
                                            283 M284 M285 M286 M287 M288 M289 M290 M291 295 M296 M305 M320
      171   ENDER-DESC . . . . . . . . . .  M259 M270 M275
      119   ERROR-COUNTER. . . . . . . . .  M221 250 260 263
      123   ERROR-HOLD . . . . . . . . . .  M250 M251 M251 M252 255
      169   ERROR-TOTAL. . . . . . . . . .  M261 M263 M268 M269 M273 M274
       66   FEATURE. . . . . . . . . . . .  M357 M380 M402 M438 M460 M483 M520 M542 M566 M592 M614 M636 M659 M684 M710 M732
                                            M754 M789 M812 M836 M874 M896 M921 M947 M971 M993 M1017 M1042 M1068 M1097
      197   HYPHEN-LINE. . . . . . . . . .  244 246 290
      163   ID-AGAIN . . . . . . . . . . .  M209
       44   INDEX1 . . . . . . . . . . . .  M360 362 M382 384 M404 406 M439 442 M462 465 M485 488 M522 524 M545 548 M569
                                            573 M616 618 M638 641 M662 665 M687 691 M712 714 M734 736 M756 758 M791 794 M814
                                            817 M838 841 M876 878 M899 902 M924 928 M973 975 M995 998 M1020 1023 M1045 1049
       48   INDEX2 . . . . . . . . . . . .  M440 442 444 453 M463 465 467 476 M486 488 497 503 513 M546 548 M570 573 M639
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    24
0 Defined   Cross-reference of data names   References

0                                           641 643 652 M663 665 M688 691 M792 794 796 805 M815 817 820 829 M839 841 851
                                            857 866 M900 902 M925 928 M996 999 1001 1010 M1021 1024 M1046 1050
       52   INDEX3 . . . . . . . . . . . .  M571 574 576 585 M689 692 694 703 M926 929 931 940 M1047 1050 1052 1061
       55   INDEX4-1 . . . . . . . . . . .  M593 596 598 607 M949 953 955 964
       58   INDEX4-2 . . . . . . . . . . .  M594 596 598 607 M950 953 955 964
       62   INDEX5 . . . . . . . . . . . .  M1069 1073 M1098 1102
      196   INF-ANSI-REFERENCE . . . . . .  M303 M306 M319 M321
      191   INFO-TEXT. . . . . . . . . . .  M304
      120   INSPECT-COUNTER. . . . . . . .  M219 250 272 274
       63   NUM-9V9. . . . . . . . . . . .  M359 M362 364 373 M381 M384 386 395 M403 M406 415 421 430 M521 M524 526 535 M543
                                            M548 550 559 M615 M618 620 629 M661 M666 668 677 M711 M714 716 725 M733 M736
                                            738 747 M755 M758 767 773 782 M875 M878 880 889 M897 M903 905 914 M972 M975 977
                                            986 M1018 M1024 1026 1035
       68   P-OR-F . . . . . . . . . . . .  M219 M220 M221 M222 229 M232
       70   PAR-NAME . . . . . . . . . . .  M234 M376 M398 M418 M434 M456 M479 M500 M516 M538 M562 M588 M610 M632 M655 M680
                                            M706 M728 M750 M770 M785 M808 M832 M854 M870 M892 M917 M943 M967 M989 M1013 M1038
                                            M1064 M1093 M1122
       72   PARDOT-X . . . . . . . . . . .  M226
      121   PASS-COUNTER . . . . . . . . .  M220 252 254
       37   PRINT-FILE . . . . . . . . . .  33 208 214
       38   PRINT-REC. . . . . . . . . . .  M228 M309 M311
       75   RE-MARK. . . . . . . . . . . .  M223 M235 M416 M432 M498 M514 M768 M783 M852 M868 M1080 M1109
      117   REC-CT . . . . . . . . . . . .  225 227 234
      116   REC-SKL-SUB
      125   RECORD-COUNT . . . . . . . . .  M279 280 M292
       41   TABLE1
       42   TABLE1-NUM . . . . . . . . . .  M326 M327 M328 M329 M330 M331 M332 M333 M334 M335 362 384 406 442 465 488 524
                                            548 573 618 641 665 691 714 736 758 794 817 841 878 902 928 975 998 1023 1049
       45   TABLE2
       46   TABLE2-NUM . . . . . . . . . .  M337 M338 M339 M340 M341 M342 M442 444 453 M465 467 476 M488 497 503 513 548
                                            573 M641 643 652 665 691 M794 796 805 M817 820 829 M841 851 857 866 902 928 M999
                                            1001 1010 1024 1050
       49   TABLE3 . . . . . . . . . . . .  M568 M686 M922 M1043
       50   TABLE3-NUM . . . . . . . . . .  M574 576 585 M692 694 703 M929 931 940 M1050 1052 1061
       53   TABLE4
       54   TABLE4-NUM1
       56   TABLE4-NUM2. . . . . . . . . .  M344 M345 M346 M347 M348 M349 M350 M351 M352 596 M596 598 607 952 M953 955 964
       59   TABLE5
       60   TABLE5-NUM . . . . . . . . . .  M354 M355 1073 1102
       76   TEST-COMPUTED. . . . . . . . .  309
       91   TEST-CORRECT . . . . . . . . .  311
      144   TEST-ID. . . . . . . . . . . .  M209
       64   TEST-RESULTS . . . . . . . . .  M210 228
      122   TOTAL-ERROR
      193   XXCOMPUTED . . . . . . . . . .  M318
      195   XXCORRECT. . . . . . . . . . .  M318
      188   XXINFO . . . . . . . . . . . .  305 320
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    25
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

      314   BAIL-OUT . . . . . . . . . . .  P231
      322   BAIL-OUT-EX. . . . . . . . . .  E231 G316
      317   BAIL-OUT-WRITE . . . . . . . .  G315
      297   BLANK-LINE-PRINT
      325   BUILD-TABLE1
      336   BUILD-TABLE2 . . . . . . . . .  P461 P484 P544 P567 P637 P660 P685 P790 P813 P837 P898 P923 P994 P1019 P1044
      343   BUILD-TABLE4 . . . . . . . . .  P948
      353   BUILD-TABLE5
     1124   CCVS-EXIT
     1125   CCVS-999999
      206   CCVS1
      323   CCVS1-EXIT . . . . . . . . . .  G212
      213   CLOSE-FILES. . . . . . . . . .  G1126
      241   COLUMN-NAMES-ROUTINE . . . . .  E211
      222   DE-LETE. . . . . . . . . . . .  P369 P391 P411 P426 P449 P472 P493 P508 P531 P555 P581 P603 P625 P648 P673 P699
                                            P721 P743 P763 P778 P801 P825 P847 P862 P885 P910 P936 P960 P982 P1006 P1031
                                            P1057 P1076 P1105
      245   END-ROUTINE. . . . . . . . . .  P214
      249   END-ROUTINE-1
      258   END-ROUTINE-12
      266   END-ROUTINE-13 . . . . . . . .  E214
      247   END-RTN-EXIT
      221   FAIL . . . . . . . . . . . . .  P372 P394 P414 P429 P452 P475 P496 P511 P534 P558 P584 P606 P628 P651 P676 P702
                                            P724 P746 P766 P781 P804 P828 P850 P865 P888 P913 P939 P963 P985 P1009 P1034
                                            P1060 P1079 P1108
      299   FAIL-ROUTINE . . . . . . . . .  P230
      313   FAIL-ROUTINE-EX. . . . . . . .  E230 G307
      308   FAIL-ROUTINE-WRITE . . . . . .  G301 G302
      236   HEAD-ROUTINE . . . . . . . . .  P211
     1082   IND-A. . . . . . . . . . . . .  D1071
     1086   IND-B. . . . . . . . . . . . .  D1072
     1090   IND-C. . . . . . . . . . . . .  D1073
     1111   IND-D. . . . . . . . . . . . .  D1100
      368   IND-DELETE-GF-1
      530   IND-DELETE-GF-10
      554   IND-DELETE-GF-11
      580   IND-DELETE-GF-12
      672   IND-DELETE-GF-13
      698   IND-DELETE-GF-14
      720   IND-DELETE-GF-15
      742   IND-DELETE-GF-16
      762   IND-DELETE-GF-17-1
      777   IND-DELETE-GF-17-2
      800   IND-DELETE-GF-18
      824   IND-DELETE-GF-19
      390   IND-DELETE-GF-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    26
0 Defined   Cross-reference of procedures   References

0     846   IND-DELETE-GF-20-1
      861   IND-DELETE-GF-20-2
      959   IND-DELETE-GF-21
      981   IND-DELETE-GF-22
     1005   IND-DELETE-GF-23
      884   IND-DELETE-GF-24
      909   IND-DELETE-GF-25
      935   IND-DELETE-GF-26
     1030   IND-DELETE-GF-27
     1056   IND-DELETE-GF-28
     1075   IND-DELETE-GF-29
      410   IND-DELETE-GF-3-1
      425   IND-DELETE-GF-3-2
     1104   IND-DELETE-GF-30
      448   IND-DELETE-GF-4
      471   IND-DELETE-GF-5
      492   IND-DELETE-GF-6-1
      507   IND-DELETE-GF-6-2
      602   IND-DELETE-GF-7
      624   IND-DELETE-GF-8
      647   IND-DELETE-GF-9
     1119   IND-E. . . . . . . . . . . . .  D1101
     1115   IND-F. . . . . . . . . . . . .  D1102
      371   IND-FAIL-GF-1. . . . . . . . .  G366
      533   IND-FAIL-GF-10 . . . . . . . .  G528
      557   IND-FAIL-GF-11 . . . . . . . .  G552
      583   IND-FAIL-GF-12 . . . . . . . .  G578
      675   IND-FAIL-GF-13 . . . . . . . .  G670
      701   IND-FAIL-GF-14 . . . . . . . .  G696
      723   IND-FAIL-GF-15 . . . . . . . .  G718
      745   IND-FAIL-GF-16 . . . . . . . .  G740
      765   IND-FAIL-GF-17-1 . . . . . . .  G761
      780   IND-FAIL-GF-17-2 . . . . . . .  G776
      803   IND-FAIL-GF-18 . . . . . . . .  G798
      827   IND-FAIL-GF-19 . . . . . . . .  G822
      393   IND-FAIL-GF-2. . . . . . . . .  G388
      849   IND-FAIL-GF-20-1 . . . . . . .  G845
      864   IND-FAIL-GF-20-2 . . . . . . .  G860
      962   IND-FAIL-GF-21 . . . . . . . .  G957
      984   IND-FAIL-GF-22 . . . . . . . .  G979
     1008   IND-FAIL-GF-23 . . . . . . . .  G1003
      887   IND-FAIL-GF-24 . . . . . . . .  G882
      912   IND-FAIL-GF-25 . . . . . . . .  G907
      938   IND-FAIL-GF-26 . . . . . . . .  G933
     1033   IND-FAIL-GF-27 . . . . . . . .  G1028
     1059   IND-FAIL-GF-28 . . . . . . . .  G1054
     1078   IND-FAIL-GF-29 . . . . . . . .  G1074 G1085 G1089
      413   IND-FAIL-GF-3-1. . . . . . . .  G409
      428   IND-FAIL-GF-3-2. . . . . . . .  G424
     1107   IND-FAIL-GF-30 . . . . . . . .  G1103 G1114 G1118
      451   IND-FAIL-GF-4. . . . . . . . .  G446
      474   IND-FAIL-GF-5. . . . . . . . .  G469
      495   IND-FAIL-GF-6-1. . . . . . . .  G491
      510   IND-FAIL-GF-6-2. . . . . . . .  G506
      605   IND-FAIL-GF-7. . . . . . . . .  G600
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    27
0 Defined   Cross-reference of procedures   References

0     627   IND-FAIL-GF-8. . . . . . . . .  G622
      650   IND-FAIL-GF-9. . . . . . . . .  G645
      356   IND-INIT-GF-1
      518   IND-INIT-GF-10
      540   IND-INIT-GF-11
      564   IND-INIT-GF-12
      657   IND-INIT-GF-13
      682   IND-INIT-GF-14
      708   IND-INIT-GF-15
      730   IND-INIT-GF-16
      752   IND-INIT-GF-17
      787   IND-INIT-GF-18
      810   IND-INIT-GF-19
      378   IND-INIT-GF-2
      834   IND-INIT-GF-20
      945   IND-INIT-GF-21
      969   IND-INIT-GF-22
      991   IND-INIT-GF-23
      872   IND-INIT-GF-24
      894   IND-INIT-GF-25
      919   IND-INIT-GF-26
     1015   IND-INIT-GF-27
     1040   IND-INIT-GF-28
     1066   IND-INIT-GF-29
      400   IND-INIT-GF-3
     1095   IND-INIT-GF-30
      436   IND-INIT-GF-4
      458   IND-INIT-GF-5
      481   IND-INIT-GF-6
      590   IND-INIT-GF-7
      612   IND-INIT-GF-8
      634   IND-INIT-GF-9
      361   IND-TEST-GF-1-0
      363   IND-TEST-GF-1-1
      523   IND-TEST-GF-10-0
      525   IND-TEST-GF-10-1
      547   IND-TEST-GF-11-0
      549   IND-TEST-GF-11-1
      572   IND-TEST-GF-12-0
      575   IND-TEST-GF-12-1
      664   IND-TEST-GF-13-0
      667   IND-TEST-GF-13-1
      690   IND-TEST-GF-14-0
      693   IND-TEST-GF-14-1
      713   IND-TEST-GF-15-0
      715   IND-TEST-GF-15-1
      735   IND-TEST-GF-16-0
      737   IND-TEST-GF-16-1
      757   IND-TEST-GF-17-1
      772   IND-TEST-GF-17-2
      793   IND-TEST-GF-18-0
      795   IND-TEST-GF-18-1
      816   IND-TEST-GF-19-0
      819   IND-TEST-GF-19-1
      383   IND-TEST-GF-2-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    28
0 Defined   Cross-reference of procedures   References

0     385   IND-TEST-GF-2-1
      840   IND-TEST-GF-20-1
      856   IND-TEST-GF-20-2
      951   IND-TEST-GF-21-0
      954   IND-TEST-GF-21-1
      974   IND-TEST-GF-22-0
      976   IND-TEST-GF-22-1
      997   IND-TEST-GF-23-0
     1000   IND-TEST-GF-23-1
      877   IND-TEST-GF-24-0
      879   IND-TEST-GF-24-1
      901   IND-TEST-GF-25-0
      904   IND-TEST-GF-25-1
      927   IND-TEST-GF-26-0
      930   IND-TEST-GF-26-1
     1022   IND-TEST-GF-27-0
     1025   IND-TEST-GF-27-1
     1048   IND-TEST-GF-28-0
     1051   IND-TEST-GF-28-1
     1070   IND-TEST-GF-29
      405   IND-TEST-GF-3-1
      420   IND-TEST-GF-3-2
     1099   IND-TEST-GF-30
      441   IND-TEST-GF-4-0
      443   IND-TEST-GF-4-1
      464   IND-TEST-GF-5-0
      466   IND-TEST-GF-5-1
      487   IND-TEST-GF-6-1
      502   IND-TEST-GF-6-2
      595   IND-TEST-GF-7-0
      597   IND-TEST-GF-7-1
      617   IND-TEST-GF-8-0
      619   IND-TEST-GF-8-1
      640   IND-TEST-GF-9-0
      642   IND-TEST-GF-9-1
      375   IND-WRITE-GF-1 . . . . . . . .  G367 G370
      537   IND-WRITE-GF-10. . . . . . . .  G529 G532
      561   IND-WRITE-GF-11. . . . . . . .  G553 G556
      587   IND-WRITE-GF-12. . . . . . . .  G579 G582
      679   IND-WRITE-GF-13. . . . . . . .  G671 G674
      705   IND-WRITE-GF-14. . . . . . . .  G697 G700
      727   IND-WRITE-GF-15. . . . . . . .  G719 G722
      749   IND-WRITE-GF-16. . . . . . . .  G741 G744
      769   IND-WRITE-GF-17-1. . . . . . .  G760 G764
      784   IND-WRITE-GF-17-2. . . . . . .  G775 G779
      807   IND-WRITE-GF-18. . . . . . . .  G799 G802
      831   IND-WRITE-GF-19. . . . . . . .  G823 G826
      397   IND-WRITE-GF-2 . . . . . . . .  G389 G392
      853   IND-WRITE-GF-20-1. . . . . . .  G844 G848
      869   IND-WRITE-GF-20-2. . . . . . .  G859 G863
      966   IND-WRITE-GF-21. . . . . . . .  G958 G961
      988   IND-WRITE-GF-22. . . . . . . .  G980 G983
     1012   IND-WRITE-GF-23. . . . . . . .  G1004 G1007
      891   IND-WRITE-GF-24. . . . . . . .  G883 G886
      916   IND-WRITE-GF-25. . . . . . . .  G908 G911
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    29
0 Defined   Cross-reference of procedures   References

0     942   IND-WRITE-GF-26. . . . . . . .  G934 G937
     1037   IND-WRITE-GF-27. . . . . . . .  G1029 G1032
     1063   IND-WRITE-GF-28. . . . . . . .  G1055 G1058
     1092   IND-WRITE-GF-29. . . . . . . .  G1077 G1081
      417   IND-WRITE-GF-3-1 . . . . . . .  G408 G412
      433   IND-WRITE-GF-3-2 . . . . . . .  G423 G427
     1121   IND-WRITE-GF-30. . . . . . . .  G1106 G1110
      455   IND-WRITE-GF-4 . . . . . . . .  G447 G450
      478   IND-WRITE-GF-5 . . . . . . . .  G470 G473
      499   IND-WRITE-GF-6-1 . . . . . . .  G490 G494
      515   IND-WRITE-GF-6-2 . . . . . . .  G505 G509
      609   IND-WRITE-GF-7 . . . . . . . .  G601 G604
      631   IND-WRITE-GF-8 . . . . . . . .  G623 G626
      654   IND-WRITE-GF-9 . . . . . . . .  G646 G649
      219   INSPT
      207   OPEN-FILES
      220   PASS . . . . . . . . . . . . .  P365 P387 P407 P422 P445 P468 P489 P504 P527 P551 P577 P599 P621 P644 P669 P695
                                            P717 P739 P759 P774 P797 P821 P843 P858 P881 P906 P932 P956 P978 P1002 P1027
                                            P1053 P1091 P1120
      224   PRINT-DETAIL . . . . . . . . .  P377 P399 P419 P435 P457 P480 P501 P517 P539 P563 P589 P611 P633 P656 P681 P707
                                            P729 P751 P771 P786 P809 P833 P855 P871 P893 P918 P944 P968 P990 P1014 P1039
                                            P1065 P1094 P1123
      217   TERMINATE-CALL
      215   TERMINATE-CCVS
      278   WRITE-LINE . . . . . . . . . .  P228 P229 P237 P238 P239 P240 P242 P243 P244 P246 P248 P257 P265 P271 P276 P277
                                            P305 P309 P311 P320
      294   WRT-LN . . . . . . . . . . . .  P284 P285 P286 P287 P288 P289 P290 P293 P298
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    30
0 Defined   Cross-reference of programs     References

        3   NC123A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC123A    Date 06/04/2022  Time 11:59:14   Page    31
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC123A:
 *    Source records = 1126
 *    Data Division statements = 75
 *    Procedure Division statements = 720
 *    Generated COBOL statements = 0
 *    Program complexity factor = 727
0End of compilation 1,  program NC123A,  highest severity 0.
0Return code 0
