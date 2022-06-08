1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:48   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:48   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2394.2
   000002         000200 PROGRAM-ID.                                                      NC2394.2
   000003         000300     NC239A.                                                      NC2394.2
   000004         000500*                                                              *  NC2394.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2394.2
   000006         000700*                                                              *  NC2394.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2394.2
   000008         000900*                                                              *  NC2394.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2394.2
   000010         001100*                                                              *  NC2394.2
   000011         001300*                                                              *  NC2394.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2394.2
   000013         001500*                                                              *  NC2394.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2394.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2394.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2394.2
   000017         001900*                                                              *  NC2394.2
   000018         002100*                                                              *  NC2394.2
   000019         002200*    PROGRAM NC239A TESTS THE CONSTRUCTION AND ACCESS OF A     *  NC2394.2
   000020         002300*    THREE-DIMENSIONAL TABLE USING INDICES.                    *  NC2394.2
   000021         002400*    VALUES ARE VERIFIED USING THE "IF" STATEMENT.             *  NC2394.2
   000022         002500*                                                ~             *  NC2394.2
   000023         002700 ENVIRONMENT DIVISION.                                            NC2394.2
   000024         002800 CONFIGURATION SECTION.                                           NC2394.2
   000025         002900 SOURCE-COMPUTER.                                                 NC2394.2
   000026         003000     XXXXX082.                                                    NC2394.2
   000027         003100 OBJECT-COMPUTER.                                                 NC2394.2
   000028         003200     XXXXX083.                                                    NC2394.2
   000029         003300 INPUT-OUTPUT SECTION.                                            NC2394.2
   000030         003400 FILE-CONTROL.                                                    NC2394.2
   000031         003500     SELECT PRINT-FILE ASSIGN TO                                  NC2394.2 35
   000032         003600     XXXXX055.                                                    NC2394.2
   000033         003700 DATA DIVISION.                                                   NC2394.2
   000034         003800 FILE SECTION.                                                    NC2394.2
   000035         003900 FD  PRINT-FILE.                                                  NC2394.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         004000 01  PRINT-REC PICTURE X(120).                                    NC2394.2
   000037         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC2394.2
   000038         004200 WORKING-STORAGE SECTION.                                         NC2394.2
   000039         004300 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2394.2 IMP
   000040         004400 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC2394.2 IMP
   000041         004500 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC2394.2 IMP
   000042         004600 77  CON-7              PICTURE 99   VALUE 07.                    NC2394.2
   000043         004700 77  CON-10             PICTURE 99   VALUE 10.                    NC2394.2
   000044         004800 77  CON-5              PICTURE 99   VALUE 05.                    NC2394.2
   000045         004900 77  CON-6              PICTURE 99   VALUE 06.                    NC2394.2
   000046         005000 01  GRP-NAME.                                                    NC2394.2
   000047         005100     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2394.2
   000048         005200     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2394.2
   000049         005300                                                                  NC2394.2
   000050         005400 01  SEC-NAME.                                                    NC2394.2
   000051         005500     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2394.2
   000052         005600     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2394.2
   000053         005700     02  FILLER              PICTURE X      VALUE ",".            NC2394.2
   000054         005800     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02  FILLER              PICTURE X      VALUE ")".            NC2394.2
   000056         006000                                                                  NC2394.2
   000057         006100 01  ELEM-NAME.                                                   NC2394.2
   000058         006200     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2394.2
   000059         006300     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2394.2
   000060         006400     02  FILLER              PICTURE X      VALUE ",".            NC2394.2
   000061         006500     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2394.2
   000062         006600     02  FILLER              PICTURE X      VALUE ",".            NC2394.2
   000063         006700     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2394.2
   000064         006800     02  FILLER              PICTURE X      VALUE ")".            NC2394.2
   000065         006900                                                                  NC2394.2
   000066         007000 01  3-DIMENSION-TBL.                                             NC2394.2
   000067         007100     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2394.2
   000068         007200         03  ENTRY-1         PICTURE X(5).                        NC2394.2
   000069         007300         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2394.2
   000070         007400             04  ENTRY-2     PICTURE X(11).                       NC2394.2
   000071         007500             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2394.2
   000072         007600                 05  ENTRY-3 PICTURE X(15).                       NC2394.2
   000073         007700                                                                  NC2394.2
   000074         007800 01  TEST-RESULTS.                                                NC2394.2
   000075         007900     02 FILLER                   PIC X      VALUE SPACE.          NC2394.2 IMP
   000076         008000     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2394.2 IMP
   000077         008100     02 FILLER                   PIC X      VALUE SPACE.          NC2394.2 IMP
   000078         008200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2394.2 IMP
   000079         008300     02 FILLER                   PIC X      VALUE SPACE.          NC2394.2 IMP
   000080         008400     02  PAR-NAME.                                                NC2394.2
   000081         008500       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2394.2 IMP
   000082         008600       03  PARDOT-X              PIC X      VALUE SPACE.          NC2394.2 IMP
   000083         008700       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2394.2 IMP
   000084         008800     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2394.2 IMP
   000085         008900     02 RE-MARK                  PIC X(61).                       NC2394.2
   000086         009000 01  TEST-COMPUTED.                                               NC2394.2
   000087         009100     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2394.2 IMP
   000088         009200     02 FILLER                   PIC X(17)  VALUE                 NC2394.2
   000089         009300            "       COMPUTED=".                                   NC2394.2
   000090         009400     02 COMPUTED-X.                                               NC2394.2
   000091         009500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2394.2 IMP
   000092         009600     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2394.2 91
   000093         009700                                 PIC -9(9).9(9).                  NC2394.2
   000094         009800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2394.2 91
   000095         009900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2394.2 91
   000096         010000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2394.2 91
   000097         010100     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2394.2 91
   000098         010200         04 COMPUTED-18V0                    PIC -9(18).          NC2394.2
   000099         010300         04 FILLER                           PIC X.               NC2394.2
   000100         010400     03 FILLER PIC X(50) VALUE SPACE.                             NC2394.2 IMP
   000101         010500 01  TEST-CORRECT.                                                NC2394.2
   000102         010600     02 FILLER PIC X(30) VALUE SPACE.                             NC2394.2 IMP
   000103         010700     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2394.2
   000104         010800     02 CORRECT-X.                                                NC2394.2
   000105         010900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2394.2 IMP
   000106         011000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2394.2 105
   000107         011100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2394.2 105
   000108         011200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2394.2 105
   000109         011300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2394.2 105
   000110         011400     03      CR-18V0 REDEFINES CORRECT-A.                         NC2394.2 105
   000111         011500         04 CORRECT-18V0                     PIC -9(18).          NC2394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600         04 FILLER                           PIC X.               NC2394.2
   000113         011700     03 FILLER PIC X(2) VALUE SPACE.                              NC2394.2 IMP
   000114         011800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2394.2 IMP
   000115         011900 01  CCVS-C-1.                                                    NC2394.2
   000116         012000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2394.2
   000117         012100-    "SS  PARAGRAPH-NAME                                          NC2394.2
   000118         012200-    "       REMARKS".                                            NC2394.2
   000119         012300     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2394.2 IMP
   000120         012400 01  CCVS-C-2.                                                    NC2394.2
   000121         012500     02 FILLER                     PIC X        VALUE SPACE.      NC2394.2 IMP
   000122         012600     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2394.2
   000123         012700     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2394.2 IMP
   000124         012800     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2394.2
   000125         012900     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2394.2 IMP
   000126         013000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2394.2 IMP
   000127         013100 01  REC-CT                        PIC 99       VALUE ZERO.       NC2394.2 IMP
   000128         013200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2394.2 IMP
   000129         013300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2394.2 IMP
   000130         013400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2394.2 IMP
   000131         013500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2394.2 IMP
   000132         013600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2394.2 IMP
   000133         013700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2394.2 IMP
   000134         013800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2394.2 IMP
   000135         013900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2394.2 IMP
   000136         014000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2394.2 IMP
   000137         014100 01  CCVS-H-1.                                                    NC2394.2
   000138         014200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2394.2 IMP
   000139         014300     02  FILLER                    PIC X(42)    VALUE             NC2394.2
   000140         014400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2394.2
   000141         014500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2394.2 IMP
   000142         014600 01  CCVS-H-2A.                                                   NC2394.2
   000143         014700   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2394.2 IMP
   000144         014800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2394.2
   000145         014900   02  FILLER                        PIC XXXX   VALUE             NC2394.2
   000146         015000     "4.2 ".                                                      NC2394.2
   000147         015100   02  FILLER                        PIC X(28)  VALUE             NC2394.2
   000148         015200            " COPY - NOT FOR DISTRIBUTION".                       NC2394.2
   000149         015300   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2394.2 IMP
   000150         015400                                                                  NC2394.2
   000151         015500 01  CCVS-H-2B.                                                   NC2394.2
   000152         015600   02  FILLER                        PIC X(15)  VALUE             NC2394.2
   000153         015700            "TEST RESULT OF ".                                    NC2394.2
   000154         015800   02  TEST-ID                       PIC X(9).                    NC2394.2
   000155         015900   02  FILLER                        PIC X(4)   VALUE             NC2394.2
   000156         016000            " IN ".                                               NC2394.2
   000157         016100   02  FILLER                        PIC X(12)  VALUE             NC2394.2
   000158         016200     " HIGH       ".                                              NC2394.2
   000159         016300   02  FILLER                        PIC X(22)  VALUE             NC2394.2
   000160         016400            " LEVEL VALIDATION FOR ".                             NC2394.2
   000161         016500   02  FILLER                        PIC X(58)  VALUE             NC2394.2
   000162         016600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2394.2
   000163         016700 01  CCVS-H-3.                                                    NC2394.2
   000164         016800     02  FILLER                      PIC X(34)  VALUE             NC2394.2
   000165         016900            " FOR OFFICIAL USE ONLY    ".                         NC2394.2
   000166         017000     02  FILLER                      PIC X(58)  VALUE             NC2394.2
   000167         017100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2394.2
   000168         017200     02  FILLER                      PIC X(28)  VALUE             NC2394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300            "  COPYRIGHT   1985 ".                                NC2394.2
   000170         017400 01  CCVS-E-1.                                                    NC2394.2
   000171         017500     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2394.2 IMP
   000172         017600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2394.2
   000173         017700     02 ID-AGAIN                     PIC X(9).                    NC2394.2
   000174         017800     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2394.2 IMP
   000175         017900 01  CCVS-E-2.                                                    NC2394.2
   000176         018000     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2394.2 IMP
   000177         018100     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2394.2 IMP
   000178         018200     02 CCVS-E-2-2.                                               NC2394.2
   000179         018300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2394.2 IMP
   000180         018400         03 FILLER                   PIC X      VALUE SPACE.      NC2394.2 IMP
   000181         018500         03 ENDER-DESC               PIC X(44)  VALUE             NC2394.2
   000182         018600            "ERRORS ENCOUNTERED".                                 NC2394.2
   000183         018700 01  CCVS-E-3.                                                    NC2394.2
   000184         018800     02  FILLER                      PIC X(22)  VALUE             NC2394.2
   000185         018900            " FOR OFFICIAL USE ONLY".                             NC2394.2
   000186         019000     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2394.2 IMP
   000187         019100     02  FILLER                      PIC X(58)  VALUE             NC2394.2
   000188         019200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2394.2
   000189         019300     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2394.2 IMP
   000190         019400     02 FILLER                       PIC X(15)  VALUE             NC2394.2
   000191         019500             " COPYRIGHT 1985".                                   NC2394.2
   000192         019600 01  CCVS-E-4.                                                    NC2394.2
   000193         019700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2394.2 IMP
   000194         019800     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2394.2
   000195         019900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2394.2 IMP
   000196         020000     02 FILLER                       PIC X(40)  VALUE             NC2394.2
   000197         020100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2394.2
   000198         020200 01  XXINFO.                                                      NC2394.2
   000199         020300     02 FILLER                       PIC X(19)  VALUE             NC2394.2
   000200         020400            "*** INFORMATION ***".                                NC2394.2
   000201         020500     02 INFO-TEXT.                                                NC2394.2
   000202         020600       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2394.2 IMP
   000203         020700       04 XXCOMPUTED                 PIC X(20).                   NC2394.2
   000204         020800       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2394.2 IMP
   000205         020900       04 XXCORRECT                  PIC X(20).                   NC2394.2
   000206         021000     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2394.2
   000207         021100 01  HYPHEN-LINE.                                                 NC2394.2
   000208         021200     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2394.2 IMP
   000209         021300     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2394.2
   000210         021400-    "*****************************************".                 NC2394.2
   000211         021500     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2394.2
   000212         021600-    "******************************".                            NC2394.2
   000213         021700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2394.2
   000214         021800     "NC239A".                                                    NC2394.2
   000215         021900 PROCEDURE DIVISION.                                              NC2394.2
   000216         022000 CCVS1 SECTION.                                                   NC2394.2
   000217         022100 OPEN-FILES.                                                      NC2394.2
   000218         022200     OPEN     OUTPUT PRINT-FILE.                                  NC2394.2 35
   000219         022300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2394.2 213 154 213 173
   000220         022400     MOVE    SPACE TO TEST-RESULTS.                               NC2394.2 IMP 74
   000221         022500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2394.2 246 251
   000222         022600     GO TO CCVS1-EXIT.                                            NC2394.2 328
   000223         022700 CLOSE-FILES.                                                     NC2394.2
   000224         022800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2394.2 255 276 35
   000225         022900 TERMINATE-CCVS.                                                  NC2394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     EXIT PROGRAM.                                                NC2394.2
   000227         023100 TERMINATE-CALL.                                                  NC2394.2
   000228         023200     STOP     RUN.                                                NC2394.2
   000229         023300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2394.2 78 130
   000230         023400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2394.2 78 131
   000231         023500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2394.2 78 129
   000232         023600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2394.2 78 128
   000233         023700     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2394.2 85
   000234         023800 PRINT-DETAIL.                                                    NC2394.2
   000235         023900     IF REC-CT NOT EQUAL TO ZERO                                  NC2394.2 127 IMP
   000236      1  024000             MOVE "." TO PARDOT-X                                 NC2394.2 82
   000237      1  024100             MOVE REC-CT TO DOTVALUE.                             NC2394.2 127 83
   000238         024200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2394.2 74 36 288
   000239         024300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2394.2 78 288
   000240      1  024400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2394.2 305 318
   000241      1  024500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2394.2 319 327
   000242         024600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2394.2 IMP 78 IMP 90
   000243         024700     MOVE SPACE TO CORRECT-X.                                     NC2394.2 IMP 104
   000244         024800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2394.2 127 IMP IMP 80
   000245         024900     MOVE     SPACE TO RE-MARK.                                   NC2394.2 IMP 85
   000246         025000 HEAD-ROUTINE.                                                    NC2394.2
   000247         025100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2394.2 137 37 288
   000248         025200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2394.2 142 37 288
   000249         025300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2394.2 151 37 288
   000250         025400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2394.2 163 37 288
   000251         025500 COLUMN-NAMES-ROUTINE.                                            NC2394.2
   000252         025600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2394.2 115 37 288
   000253         025700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2394.2 120 37 288
   000254         025800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2394.2 207 37 288
   000255         025900 END-ROUTINE.                                                     NC2394.2
   000256         026000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2394.2 207 37 288
   000257         026100 END-RTN-EXIT.                                                    NC2394.2
   000258         026200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2394.2 170 37 288
   000259         026300 END-ROUTINE-1.                                                   NC2394.2
   000260         026400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2394.2 129 133 130
   000261         026500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2394.2 133 128 133
   000262         026600      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2394.2 131 133
   000263         026700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2394.2
   000264         026800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2394.2 131 193
   000265         026900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2394.2 133 195
   000266         027000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2394.2 192 178
   000267         027100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2394.2 175 37 288
   000268         027200  END-ROUTINE-12.                                                 NC2394.2
   000269         027300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2394.2 181
   000270         027400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2394.2 129 IMP
   000271      1  027500         MOVE "NO " TO ERROR-TOTAL                                NC2394.2 179
   000272         027600         ELSE                                                     NC2394.2
   000273      1  027700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2394.2 129 179
   000274         027800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2394.2 175 37
   000275         027900     PERFORM WRITE-LINE.                                          NC2394.2 288
   000276         028000 END-ROUTINE-13.                                                  NC2394.2
   000277         028100     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2394.2 128 IMP
   000278      1  028200         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2394.2 179
   000279      1  028300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2394.2 128 179
   000280         028400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2394.2 181
   000281         028500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2394.2 175 37 288
   000282         028600      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2394.2 130 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700          MOVE "NO " TO ERROR-TOTAL                               NC2394.2 179
   000284      1  028800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2394.2 130 179
   000285         028900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2394.2 181
   000286         029000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2394.2 175 37 288
   000287         029100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2394.2 183 37 288
   000288         029200 WRITE-LINE.                                                      NC2394.2
   000289         029300     ADD 1 TO RECORD-COUNT.                                       NC2394.2 135
   000290         029400     IF RECORD-COUNT GREATER 50                                   NC2394.2 135
   000291      1  029500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2394.2 37 134
   000292      1  029600         MOVE SPACE TO DUMMY-RECORD                               NC2394.2 IMP 37
   000293      1  029700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2394.2 37
   000294      1  029800         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2394.2 115 37 300
   000295      1  029900         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2394.2 120 37 300
   000296      1  030000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2394.2 207 37 300
   000297      1  030100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2394.2 134 37
   000298      1  030200         MOVE ZERO TO RECORD-COUNT.                               NC2394.2 IMP 135
   000299         030300     PERFORM WRT-LN.                                              NC2394.2 300
   000300         030400 WRT-LN.                                                          NC2394.2
   000301         030500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2394.2 37
   000302         030600     MOVE SPACE TO DUMMY-RECORD.                                  NC2394.2 IMP 37
   000303         030700 BLANK-LINE-PRINT.                                                NC2394.2
   000304         030800     PERFORM WRT-LN.                                              NC2394.2 300
   000305         030900 FAIL-ROUTINE.                                                    NC2394.2
   000306         031000     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2394.2 90 IMP 313
   000307         031100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2394.2 104 IMP 313
   000308         031200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2394.2 136 206
   000309         031300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2394.2 201
   000310         031400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2394.2 198 37 288
   000311         031500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2394.2 IMP 206
   000312         031600     GO TO  FAIL-ROUTINE-EX.                                      NC2394.2 318
   000313         031700 FAIL-ROUTINE-WRITE.                                              NC2394.2
   000314         031800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2394.2 86 36 288
   000315         031900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2394.2 136 114
   000316         032000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2394.2 101 36 288
   000317         032100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2394.2 IMP 114
   000318         032200 FAIL-ROUTINE-EX. EXIT.                                           NC2394.2
   000319         032300 BAIL-OUT.                                                        NC2394.2
   000320         032400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2394.2 91 IMP 322
   000321         032500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2394.2 105 IMP 327
   000322         032600 BAIL-OUT-WRITE.                                                  NC2394.2
   000323         032700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2394.2 105 205 91 203
   000324         032800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2394.2 136 206
   000325         032900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2394.2 198 37 288
   000326         033000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2394.2 IMP 206
   000327         033100 BAIL-OUT-EX. EXIT.                                               NC2394.2
   000328         033200 CCVS1-EXIT.                                                      NC2394.2
   000329         033300     EXIT.                                                        NC2394.2
   000330         033400 SECT-NC239A-001 SECTION.                                         NC2394.2
   000331         033500 TH-12-001.                                                       NC2394.2
   000332         033600 TABLE-INIT.                                                      NC2394.2

 ==000332==> IGYPS2015-I The paragraph or section prior to paragraph or section "TABLE-INIT" did
                         not contain any statements.

   000333         033700     PERFORM TABLE-INIT-SUBROUTINE VARYING SUB-1 FROM 1 BY 1      NC2394.2 339 39
   000334         033800         UNTIL SUB-1 EQUAL TO 11                                  NC2394.2 39
   000335         033900         AFTER SUB-2 FROM 1 BY 1 UNTIL SUB-2 EQUAL TO 11          NC2394.2 40 40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000336         034000         AFTER SUB-3 FROM 1 BY 1 UNTIL SUB-3 EQUAL TO 11.         NC2394.2 41 41
   000337         034100     GO TO TABLE-TEST.                                            NC2394.2 350
   000338         034200                                                                  NC2394.2
   000339         034300 TABLE-INIT-SUBROUTINE.                                           NC2394.2
   000340         034400     SET IDX-1 TO SUB-1.                                          NC2394.2 67 39
   000341         034500     SET IDX-2 TO SUB-2.                                          NC2394.2 69 40
   000342         034600     SET IDX-3 TO SUB-3.                                          NC2394.2 71 41
   000343         034700     SET ADD-GRP, SEC-GRP, ELEM-GRP TO IDX-1.                     NC2394.2 48 52 59 67
   000344         034800     MOVE GRP-NAME TO ENTRY-1 (IDX-1).                            NC2394.2 46 68 67
   000345         034900     SET ADD-SEC, ELEM-SEC TO IDX-2.                              NC2394.2 54 61 69
   000346         035000     MOVE SEC-NAME TO ENTRY-2 (IDX-1, IDX-2).                     NC2394.2 50 70 67 69
   000347         035100     SET ADD-ELEM TO IDX-3.                                       NC2394.2 63 71
   000348         035200     MOVE ELEM-NAME TO ENTRY-3 (IDX-1, IDX-2, IDX-3).             NC2394.2 57 72 67 69 71
   000349         035300                                                                  NC2394.2
   000350         035400 TABLE-TEST.                                                      NC2394.2
   000351         035500     MOVE "LEVEL 1 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000352         035600     MOVE "TABLE-TEST" TO PAR-NAME.                               NC2394.2 80
   000353         035700     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000354         035800     SET IDX-1 TO 5.                                              NC2394.2 67
   000355         035900     IF ENTRY-1 (IDX-1) IS NOT EQUAL TO "GRP05"                   NC2394.2 68 67
   000356      1  036000         GO TO TABLE-FAIL.                                        NC2394.2 359
   000357         036100     PERFORM PASS.                                                NC2394.2 230
   000358         036200     GO TO TABLE-WRITE.                                           NC2394.2 364
   000359         036300 TABLE-FAIL.                                                      NC2394.2
   000360         036400     MOVE "GRP05" TO CORRECT-A                                    NC2394.2 105
   000361         036500     MOVE ENTRY-1 (IDX-1) TO COMPUTED-A                           NC2394.2 68 67 91
   000362         036600     MOVE "INTERNAL INDEXING LEVEL 1  " TO RE-MARK                NC2394.2 85
   000363         036700     PERFORM FAIL.                                                NC2394.2 231
   000364         036800 TABLE-WRITE.                                                     NC2394.2
   000365         036900     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000366         037000                                                                  NC2394.2
   000367         037100 TH1-INIT-GF-1.                                                   NC2394.2
   000368         037200     MOVE "TH1-TEST-GF-1" TO PAR-NAME.                            NC2394.2 80
   000369         037300     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000370         037400     MOVE "LEVEL 1 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000371         037500     SET IDX-1 TO 8.                                              NC2394.2 67
   000372         037600 TH1-TEST-GF-1.                                                   NC2394.2
   000373         037700     IF ENTRY-1 (IDX-1) IS NOT EQUAL TO "GRP08"                   NC2394.2 68 67
   000374      1  037800          GO TO TH1-FAIL-GF-1.                                    NC2394.2 380
   000375         037900     PERFORM PASS.                                                NC2394.2 230
   000376         038000     GO TO TH1-WRITE-GF-1.                                        NC2394.2 385
   000377         038100 TH1-DELETE-GF-1.                                                 NC2394.2
   000378         038200     PERFORM DE-LETE.                                             NC2394.2 232
   000379         038300     GO TO TH1-WRITE-GF-1.                                        NC2394.2 385
   000380         038400 TH1-FAIL-GF-1.                                                   NC2394.2
   000381         038500     MOVE "GRP08" TO CORRECT-A                                    NC2394.2 105
   000382         038600     MOVE ENTRY-1 (IDX-1) TO COMPUTED-A                           NC2394.2 68 67 91
   000383         038700     MOVE "INTERNAL INDEXING LEVEL 1  " TO RE-MARK                NC2394.2 85
   000384         038800     PERFORM FAIL.                                                NC2394.2 231
   000385         038900 TH1-WRITE-GF-1.                                                  NC2394.2
   000386         039000     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000387         039100                                                                  NC2394.2
   000388         039200 TH2-INIT-GF-1.                                                   NC2394.2
   000389         039300     MOVE "LEVEL 2 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000390         039400     MOVE "TH2-TEST-GF-1" TO PAR-NAME.                            NC2394.2 80
   000391         039500     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000392         039600     SET IDX-1 TO 5.                                              NC2394.2 67
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039700     SET IDX-2 TO 6.                                              NC2394.2 69
   000394         039800 TH2-TEST-GF-1.                                                   NC2394.2
   000395         039900     IF ENTRY-2 (IDX-1, IDX-2) IS NOT EQUAL TO "SEC (05,06)"      NC2394.2 70 67 69
   000396      1  040000         GO TO TH2-FAIL-GF-1.                                     NC2394.2 402
   000397         040100     PERFORM PASS.                                                NC2394.2 230
   000398         040200     GO TO TH2-WRITE-GF-1.                                        NC2394.2 407
   000399         040300 TH2-DELETE-GF-1.                                                 NC2394.2
   000400         040400     PERFORM DE-LETE.                                             NC2394.2 232
   000401         040500     GO TO TH2-WRITE-GF-1.                                        NC2394.2 407
   000402         040600 TH2-FAIL-GF-1.                                                   NC2394.2
   000403         040700     MOVE "SEC (05,06)" TO CORRECT-A                              NC2394.2 105
   000404         040800     MOVE ENTRY-2 (IDX-1, IDX-2) TO COMPUTED-A                    NC2394.2 70 67 69 91
   000405         040900     MOVE "INTERNAL INDEXING LEVEL 2  " TO RE-MARK                NC2394.2 85
   000406         041000     PERFORM FAIL.                                                NC2394.2 231
   000407         041100 TH2-WRITE-GF-1.                                                  NC2394.2
   000408         041200     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000409         041300                                                                  NC2394.2
   000410         041400 TH2-INIT-GF-2.                                                   NC2394.2
   000411         041500     MOVE "TH2-TEST-GF-2" TO PAR-NAME.                            NC2394.2 80
   000412         041600     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000413         041700     MOVE "LEVEL 2 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000414         041800     SET IDX-1, IDX-2 TO 8.                                       NC2394.2 67 69
   000415         041900 TH2-TEST-GF-2.                                                   NC2394.2
   000416         042000     IF ENTRY-2 (IDX-1, IDX-2) IS NOT EQUAL TO "SEC (08,08)"      NC2394.2 70 67 69
   000417      1  042100         GO TO TH2-FAIL-GF-2.                                     NC2394.2 423
   000418         042200     PERFORM PASS.                                                NC2394.2 230
   000419         042300     GO TO TH2-WRITE-GF-2.                                        NC2394.2 428
   000420         042400 TH2-DELETE-GF-2.                                                 NC2394.2
   000421         042500     PERFORM DE-LETE.                                             NC2394.2 232
   000422         042600     GO TO TH2-WRITE-GF-2.                                        NC2394.2 428
   000423         042700 TH2-FAIL-GF-2.                                                   NC2394.2
   000424         042800     MOVE "SEC (08,08)" TO CORRECT-A                              NC2394.2 105
   000425         042900     MOVE ENTRY-2 (IDX-1, IDX-2) TO COMPUTED-A                    NC2394.2 70 67 69 91
   000426         043000     MOVE "INTERNAL INDEXING LEVEL 2  " TO RE-MARK                NC2394.2 85
   000427         043100     PERFORM FAIL.                                                NC2394.2 231
   000428         043200 TH2-WRITE-GF-2.                                                  NC2394.2
   000429         043300     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000430         043400                                                                  NC2394.2
   000431         043500 TH2-INIT-GF-3.                                                   NC2394.2
   000432         043600     MOVE "TH2-TEST-GF-3" TO PAR-NAME.                            NC2394.2 80
   000433         043700     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000434         043800     MOVE "LEVEL 2 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000435         043900     SET IDX-1 TO 3.                                              NC2394.2 67
   000436         044000     SET IDX-2 TO 7.                                              NC2394.2 69
   000437         044100 TH2-TEST-GF-3.                                                   NC2394.2
   000438         044200     IF ENTRY-2 (IDX-1, IDX-2) IS NOT EQUAL TO "SEC (03,07)"      NC2394.2 70 67 69
   000439      1  044300         GO TO TH2-FAIL-GF-3.                                     NC2394.2 445
   000440         044400     PERFORM PASS.                                                NC2394.2 230
   000441         044500     GO TO TH2-WRITE-GF-3.                                        NC2394.2 450
   000442         044600 TH2-DELETE-GF-3.                                                 NC2394.2
   000443         044700     PERFORM DE-LETE.                                             NC2394.2 232
   000444         044800     GO TO TH2-WRITE-GF-3.                                        NC2394.2 450
   000445         044900 TH2-FAIL-GF-3.                                                   NC2394.2
   000446         045000     MOVE "SEC (03,07)" TO CORRECT-A                              NC2394.2 105
   000447         045100     MOVE ENTRY-2 (IDX-1, IDX-2) TO COMPUTED-A                    NC2394.2 70 67 69 91
   000448         045200     MOVE "INTERNAL INDEXING LEVEL 2  " TO RE-MARK                NC2394.2 85
   000449         045300     PERFORM FAIL.                                                NC2394.2 231
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400 TH2-WRITE-GF-3.                                                  NC2394.2
   000451         045500     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000452         045600                                                                  NC2394.2
   000453         045700 TH3-INIT-GF-1.                                                   NC2394.2
   000454         045800     MOVE "TH3-TEST-GF-1" TO PAR-NAME.                            NC2394.2 80
   000455         045900     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000456         046000     MOVE "LEVEL 3 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000457         046100     SET IDX-1 TO 2.                                              NC2394.2 67
   000458         046200     SET IDX-2 TO 6.                                              NC2394.2 69
   000459         046300     SET IDX-3 TO 10.                                             NC2394.2 71
   000460         046400 TH3-TEST-GF-1.                                                   NC2394.2
   000461         046500     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) IS NOT EQUAL TO             NC2394.2 72 67 69 71
   000462         046600              "ELEM (02,06,10)"                                   NC2394.2
   000463      1  046700         GO TO TH3-FAIL-GF-1.                                     NC2394.2 469
   000464         046800     PERFORM PASS.                                                NC2394.2 230
   000465         046900     GO TO TH3-WRITE-GF-1.                                        NC2394.2 474
   000466         047000 TH3-DELETE-GF-1.                                                 NC2394.2
   000467         047100     PERFORM DE-LETE.                                             NC2394.2 232
   000468         047200     GO TO TH3-WRITE-GF-1.                                        NC2394.2 474
   000469         047300 TH3-FAIL-GF-1.                                                   NC2394.2
   000470         047400     MOVE "ELEM (02,06,10)" TO CORRECT-A                          NC2394.2 105
   000471         047500     MOVE ENTRY-3 (IDX-1, IDX-2, IDX-3) TO COMPUTED-A             NC2394.2 72 67 69 71 91
   000472         047600     MOVE "INTERNAL INDEXING LEVEL 3  " TO RE-MARK                NC2394.2 85
   000473         047700     PERFORM FAIL.                                                NC2394.2 231
   000474         047800 TH3-WRITE-GF-1.                                                  NC2394.2
   000475         047900     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000476         048000                                                                  NC2394.2
   000477         048100 TH3-INIT-GF-2.                                                   NC2394.2
   000478         048200     MOVE "TH3-TEST-GF-2" TO PAR-NAME.                            NC2394.2 80
   000479         048300     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000480         048400     MOVE "LEVEL 3 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000481         048500     SET IDX-1, IDX-2, IDX-3 TO 6.                                NC2394.2 67 69 71
   000482         048600 TH3-TEST-GF-2.                                                   NC2394.2
   000483         048700     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) IS NOT EQUAL TO             NC2394.2 72 67 69 71
   000484         048800              "ELEM (06,06,06)"                                   NC2394.2
   000485      1  048900         GO TO TH3-FAIL-GF-2.                                     NC2394.2 491
   000486         049000     PERFORM PASS.                                                NC2394.2 230
   000487         049100     GO TO TH3-WRITE-GF-2.                                        NC2394.2 496
   000488         049200 TH3-DELETE-GF-2.                                                 NC2394.2
   000489         049300     PERFORM DE-LETE.                                             NC2394.2 232
   000490         049400     GO TO TH3-WRITE-GF-2.                                        NC2394.2 496
   000491         049500 TH3-FAIL-GF-2.                                                   NC2394.2
   000492         049600     MOVE "ELEM (06,06,06)" TO CORRECT-A                          NC2394.2 105
   000493         049700     MOVE ENTRY-3 (IDX-1, IDX-2, IDX-3) TO COMPUTED-A             NC2394.2 72 67 69 71 91
   000494         049800     MOVE "INTERNAL INDEXING LEVEL 3  " TO RE-MARK                NC2394.2 85
   000495         049900     PERFORM FAIL.                                                NC2394.2 231
   000496         050000 TH3-WRITE-GF-2.                                                  NC2394.2
   000497         050100     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000498         050200                                                                  NC2394.2
   000499         050300 TH3-INIT-GF-3.                                                   NC2394.2
   000500         050400     MOVE "TH3-TEST-GF-3" TO PAR-NAME.                            NC2394.2 80
   000501         050500     MOVE "IV-21 & II-15 4.4.2" TO ANSI-REFERENCE.                NC2394.2 136
   000502         050600     MOVE "LEVEL 3 INT INDEXING" TO FEATURE.                      NC2394.2 76
   000503         050700     SET IDX-1 TO 9.                                              NC2394.2 67
   000504         050800     SET IDX-2 TO 8.                                              NC2394.2 69
   000505         050900     SET IDX-3 TO 7.                                              NC2394.2 71
   000506         051000 TH3-TEST-GF-3.                                                   NC2394.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507         051100     IF ENTRY-3 (IDX-1, IDX-2, IDX-3) IS NOT EQUAL TO             NC2394.2 72 67 69 71
   000508         051200         "ELEM (09,08,07)"                                        NC2394.2
   000509      1  051300         GO TO TH3-FAIL-GF-3.                                     NC2394.2 515
   000510         051400     PERFORM PASS.                                                NC2394.2 230
   000511         051500     GO TO TH3-WRITE-GF-3.                                        NC2394.2 520
   000512         051600 TH3-DELETE-GF-3.                                                 NC2394.2
   000513         051700     PERFORM DE-LETE.                                             NC2394.2 232
   000514         051800     GO TO TH3-WRITE-GF-3.                                        NC2394.2 520
   000515         051900 TH3-FAIL-GF-3.                                                   NC2394.2
   000516         052000     MOVE "ELEM (09,08,07)" TO CORRECT-A                          NC2394.2 105
   000517         052100     MOVE ENTRY-3 (IDX-1, IDX-2, IDX-3) TO COMPUTED-A             NC2394.2 72 67 69 71 91
   000518         052200     MOVE "INTERNAL INDEXING LEVEL 3  " TO RE-MARK                NC2394.2 85
   000519         052300     PERFORM FAIL.                                                NC2394.2 231
   000520         052400 TH3-WRITE-GF-3.                                                  NC2394.2
   000521         052500     PERFORM PRINT-DETAIL.                                        NC2394.2 234
   000522         052600 CCVS-EXIT SECTION.                                               NC2394.2
   000523         052700 CCVS-999999.                                                     NC2394.2
   000524         052800     GO TO CLOSE-FILES.                                           NC2394.2 223
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    13
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       63   ADD-ELEM . . . . . . . . . . .  M347
       48   ADD-GRP. . . . . . . . . . . .  M343
       54   ADD-SEC. . . . . . . . . . . .  M345
      136   ANSI-REFERENCE . . . . . . . .  308 315 324 M353 M369 M391 M412 M433 M455 M479 M501
      115   CCVS-C-1 . . . . . . . . . . .  252 294
      120   CCVS-C-2 . . . . . . . . . . .  253 295
      170   CCVS-E-1 . . . . . . . . . . .  258
      175   CCVS-E-2 . . . . . . . . . . .  267 274 281 286
      178   CCVS-E-2-2 . . . . . . . . . .  M266
      183   CCVS-E-3 . . . . . . . . . . .  287
      192   CCVS-E-4 . . . . . . . . . . .  266
      193   CCVS-E-4-1 . . . . . . . . . .  M264
      195   CCVS-E-4-2 . . . . . . . . . .  M265
      137   CCVS-H-1 . . . . . . . . . . .  247
      142   CCVS-H-2A. . . . . . . . . . .  248
      151   CCVS-H-2B. . . . . . . . . . .  249
      163   CCVS-H-3 . . . . . . . . . . .  250
      213   CCVS-PGM-ID. . . . . . . . . .  219 219
       97   CM-18V0
       91   COMPUTED-A . . . . . . . . . .  92 94 95 96 97 320 323 M361 M382 M404 M425 M447 M471 M493 M517
       92   COMPUTED-N
       90   COMPUTED-X . . . . . . . . . .  M242 306
       94   COMPUTED-0V18
       96   COMPUTED-14V4
       98   COMPUTED-18V0
       95   COMPUTED-4V14
       43   CON-10
       44   CON-5
       45   CON-6
       42   CON-7
      114   COR-ANSI-REFERENCE . . . . . .  M315 M317
      105   CORRECT-A. . . . . . . . . . .  106 107 108 109 110 321 323 M360 M381 M403 M424 M446 M470 M492 M516
      106   CORRECT-N
      104   CORRECT-X. . . . . . . . . . .  M243 307
      107   CORRECT-0V18
      109   CORRECT-14V4
      111   CORRECT-18V0
      108   CORRECT-4V14
      110   CR-18V0
      128   DELETE-COUNTER . . . . . . . .  M232 261 277 279
       83   DOTVALUE . . . . . . . . . . .  M237
      134   DUMMY-HOLD . . . . . . . . . .  M291 297
       37   DUMMY-RECORD . . . . . . . . .  M247 M248 M249 M250 M252 M253 M254 M256 M258 M267 M274 M281 M286 M287 291 M292
                                            293 M294 M295 M296 M297 301 M302 M310 M325
       59   ELEM-GRP . . . . . . . . . . .  M343
       57   ELEM-NAME. . . . . . . . . . .  348
       61   ELEM-SEC . . . . . . . . . . .  M345
      181   ENDER-DESC . . . . . . . . . .  M269 M280 M285
       68   ENTRY-1. . . . . . . . . . . .  M344 355 361 373 382
       70   ENTRY-2. . . . . . . . . . . .  M346 395 404 416 425 438 447
       72   ENTRY-3. . . . . . . . . . . .  M348 461 471 483 493 507 517
      129   ERROR-COUNTER. . . . . . . . .  M231 260 270 273
      133   ERROR-HOLD . . . . . . . . . .  M260 M261 M261 M262 265
      179   ERROR-TOTAL. . . . . . . . . .  M271 M273 M278 M279 M283 M284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    14
0 Defined   Cross-reference of data names   References

0      76   FEATURE. . . . . . . . . . . .  M351 M370 M389 M413 M434 M456 M480 M502
       67   GRP-ENTRY
       46   GRP-NAME . . . . . . . . . . .  344
       69   GRP2-ENTRY
       71   GRP3-ENTRY
      207   HYPHEN-LINE. . . . . . . . . .  254 256 296
      173   ID-AGAIN . . . . . . . . . . .  M219
       67   IDX-1. . . . . . . . . . . . .  M340 343 344 346 348 M354 355 361 M371 373 382 M392 395 404 M414 416 425 M435
                                            438 447 M457 461 471 M481 483 493 M503 507 517
       69   IDX-2. . . . . . . . . . . . .  M341 345 346 348 M393 395 404 M414 416 425 M436 438 447 M458 461 471 M481 483
                                            493 M504 507 517
       71   IDX-3. . . . . . . . . . . . .  M342 347 348 M459 461 471 M481 483 493 M505 507 517
      206   INF-ANSI-REFERENCE . . . . . .  M308 M311 M324 M326
      201   INFO-TEXT. . . . . . . . . . .  M309
      130   INSPECT-COUNTER. . . . . . . .  M229 260 282 284
       78   P-OR-F . . . . . . . . . . . .  M229 M230 M231 M232 239 M242
       80   PAR-NAME . . . . . . . . . . .  M244 M352 M368 M390 M411 M432 M454 M478 M500
       82   PARDOT-X . . . . . . . . . . .  M236
      131   PASS-COUNTER . . . . . . . . .  M230 262 264
       35   PRINT-FILE . . . . . . . . . .  31 218 224
       36   PRINT-REC. . . . . . . . . . .  M238 M314 M316
       85   RE-MARK. . . . . . . . . . . .  M233 M245 M362 M383 M405 M426 M448 M472 M494 M518
      127   REC-CT . . . . . . . . . . . .  235 237 244
      126   REC-SKL-SUB
      135   RECORD-COUNT . . . . . . . . .  M289 290 M298
       52   SEC-GRP. . . . . . . . . . . .  M343
       50   SEC-NAME . . . . . . . . . . .  346
       39   SUB-1. . . . . . . . . . . . .  M333 334 340
       40   SUB-2. . . . . . . . . . . . .  M335 335 341
       41   SUB-3. . . . . . . . . . . . .  M336 336 342
       86   TEST-COMPUTED. . . . . . . . .  314
      101   TEST-CORRECT . . . . . . . . .  316
      154   TEST-ID. . . . . . . . . . . .  M219
       74   TEST-RESULTS . . . . . . . . .  M220 238
      132   TOTAL-ERROR
      203   XXCOMPUTED . . . . . . . . . .  M323
      205   XXCORRECT. . . . . . . . . . .  M323
      198   XXINFO . . . . . . . . . . . .  310 325
       66   3-DIMENSION-TBL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    15
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

      319   BAIL-OUT . . . . . . . . . . .  P241
      327   BAIL-OUT-EX. . . . . . . . . .  E241 G321
      322   BAIL-OUT-WRITE . . . . . . . .  G320
      303   BLANK-LINE-PRINT
      522   CCVS-EXIT
      523   CCVS-999999
      216   CCVS1
      328   CCVS1-EXIT . . . . . . . . . .  G222
      223   CLOSE-FILES. . . . . . . . . .  G524
      251   COLUMN-NAMES-ROUTINE . . . . .  E221
      232   DE-LETE. . . . . . . . . . . .  P378 P400 P421 P443 P467 P489 P513
      255   END-ROUTINE. . . . . . . . . .  P224
      259   END-ROUTINE-1
      268   END-ROUTINE-12
      276   END-ROUTINE-13 . . . . . . . .  E224
      257   END-RTN-EXIT
      231   FAIL . . . . . . . . . . . . .  P363 P384 P406 P427 P449 P473 P495 P519
      305   FAIL-ROUTINE . . . . . . . . .  P240
      318   FAIL-ROUTINE-EX. . . . . . . .  E240 G312
      313   FAIL-ROUTINE-WRITE . . . . . .  G306 G307
      246   HEAD-ROUTINE . . . . . . . . .  P221
      229   INSPT
      217   OPEN-FILES
      230   PASS . . . . . . . . . . . . .  P357 P375 P397 P418 P440 P464 P486 P510
      234   PRINT-DETAIL . . . . . . . . .  P365 P386 P408 P429 P451 P475 P497 P521
      330   SECT-NC239A-001
      359   TABLE-FAIL . . . . . . . . . .  G356
      332   TABLE-INIT
      339   TABLE-INIT-SUBROUTINE. . . . .  P333
      350   TABLE-TEST . . . . . . . . . .  G337
      364   TABLE-WRITE. . . . . . . . . .  G358
      227   TERMINATE-CALL
      225   TERMINATE-CCVS
      331   TH-12-001
      377   TH1-DELETE-GF-1
      380   TH1-FAIL-GF-1. . . . . . . . .  G374
      367   TH1-INIT-GF-1
      372   TH1-TEST-GF-1
      385   TH1-WRITE-GF-1 . . . . . . . .  G376 G379
      399   TH2-DELETE-GF-1
      420   TH2-DELETE-GF-2
      442   TH2-DELETE-GF-3
      402   TH2-FAIL-GF-1. . . . . . . . .  G396
      423   TH2-FAIL-GF-2. . . . . . . . .  G417
      445   TH2-FAIL-GF-3. . . . . . . . .  G439
      388   TH2-INIT-GF-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    16
0 Defined   Cross-reference of procedures   References

0     410   TH2-INIT-GF-2
      431   TH2-INIT-GF-3
      394   TH2-TEST-GF-1
      415   TH2-TEST-GF-2
      437   TH2-TEST-GF-3
      407   TH2-WRITE-GF-1 . . . . . . . .  G398 G401
      428   TH2-WRITE-GF-2 . . . . . . . .  G419 G422
      450   TH2-WRITE-GF-3 . . . . . . . .  G441 G444
      466   TH3-DELETE-GF-1
      488   TH3-DELETE-GF-2
      512   TH3-DELETE-GF-3
      469   TH3-FAIL-GF-1. . . . . . . . .  G463
      491   TH3-FAIL-GF-2. . . . . . . . .  G485
      515   TH3-FAIL-GF-3. . . . . . . . .  G509
      453   TH3-INIT-GF-1
      477   TH3-INIT-GF-2
      499   TH3-INIT-GF-3
      460   TH3-TEST-GF-1
      482   TH3-TEST-GF-2
      506   TH3-TEST-GF-3
      474   TH3-WRITE-GF-1 . . . . . . . .  G465 G468
      496   TH3-WRITE-GF-2 . . . . . . . .  G487 G490
      520   TH3-WRITE-GF-3 . . . . . . . .  G511 G514
      288   WRITE-LINE . . . . . . . . . .  P238 P239 P247 P248 P249 P250 P252 P253 P254 P256 P258 P267 P275 P281 P286 P287
                                            P310 P314 P316 P325
      300   WRT-LN . . . . . . . . . . . .  P294 P295 P296 P299 P304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    17
0 Defined   Cross-reference of programs     References

        3   NC239A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC239A    Date 06/04/2022  Time 11:57:48   Page    18
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    332  IGYPS2015-I   The paragraph or section prior to paragraph or section "TABLE-INIT" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC239A:
 *    Source records = 524
 *    Data Division statements = 86
 *    Procedure Division statements = 263
 *    Generated COBOL statements = 0
 *    Program complexity factor = 273
0End of compilation 1,  program NC239A,  highest severity 0.
0Return code 0
