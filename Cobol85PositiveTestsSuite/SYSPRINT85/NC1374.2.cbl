1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:15   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:15   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1374.2
   000002         000200 PROGRAM-ID.                                                      NC1374.2
   000003         000300     NC137A.                                                      NC1374.2
   000004         000500*                                                              *  NC1374.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1374.2
   000006         000700*                                                              *  NC1374.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1374.2
   000008         000900*                                                              *  NC1374.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1374.2
   000010         001100*                                                              *  NC1374.2
   000011         001300*                                                              *  NC1374.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1374.2
   000013         001500*                                                              *  NC1374.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1374.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1374.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1374.2
   000017         001900*                                                              *  NC1374.2
   000018         002100*                                                                 NC1374.2
   000019         002200*    PROGRAM NC137A VERIFIES THE ACCURACY OF BUILDING AND         NC1374.2
   000020         002300*    ACCESSING A 3 DIMENSIONAL TABLE USING INDEXES.               NC1374.2
   000021         002400*                                                                 NC1374.2
   000022         002500 ENVIRONMENT DIVISION.                                            NC1374.2
   000023         002600 CONFIGURATION SECTION.                                           NC1374.2
   000024         002700 SOURCE-COMPUTER.                                                 NC1374.2
   000025         002800     XXXXX082.                                                    NC1374.2
   000026         002900 OBJECT-COMPUTER.                                                 NC1374.2
   000027         003000     XXXXX083.                                                    NC1374.2
   000028         003100 INPUT-OUTPUT SECTION.                                            NC1374.2
   000029         003200 FILE-CONTROL.                                                    NC1374.2
   000030         003300     SELECT PRINT-FILE ASSIGN TO                                  NC1374.2 34
   000031         003400     XXXXX055.                                                    NC1374.2
   000032         003500 DATA DIVISION.                                                   NC1374.2
   000033         003600 FILE SECTION.                                                    NC1374.2
   000034         003700 FD  PRINT-FILE.                                                  NC1374.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003800 01  PRINT-REC PICTURE X(120).                                    NC1374.2
   000036         003900 01  DUMMY-RECORD PICTURE X(120).                                 NC1374.2
   000037         004000 WORKING-STORAGE SECTION.                                         NC1374.2
   000038         004100 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC1374.2 IMP
   000039         004200 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC1374.2 IMP
   000040         004300 77  SUB-3              PICTURE 99  VALUE ZERO.                   NC1374.2 IMP
   000041         004400 77  CON-7              PICTURE 99  VALUE 07.                     NC1374.2
   000042         004500 77  CON-10             PICTURE 99  VALUE 10.                     NC1374.2
   000043         004600 77  CON-5              PICTURE 99  VALUE 05.                     NC1374.2
   000044         004700 77  CON-6              PICTURE 99  VALUE 06.                     NC1374.2
   000045         004800 01  GRP-NAME.                                                    NC1374.2
   000046         004900     02  FILLER              PICTURE XXX    VALUE "GRP".          NC1374.2
   000047         005000     02  ADD-GRP             PICTURE 99     VALUE 01.             NC1374.2
   000048         005100                                                                  NC1374.2
   000049         005200 01  SEC-NAME.                                                    NC1374.2
   000050         005300     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC1374.2
   000051         005400     02  SEC-GRP             PICTURE 99     VALUE 00.             NC1374.2
   000052         005500     02  FILLER              PICTURE X      VALUE " ".            NC1374.2
   000053         005600     02  ADD-SEC             PICTURE 99     VALUE 01.             NC1374.2
   000054         005700     02  FILLER              PICTURE X      VALUE ")".            NC1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800                                                                  NC1374.2
   000056         005900 01  ELEM-NAME.                                                   NC1374.2
   000057         006000     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC1374.2
   000058         006100     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC1374.2
   000059         006200     02  FILLER              PICTURE X      VALUE " ".            NC1374.2
   000060         006300     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC1374.2
   000061         006400     02  FILLER              PICTURE X      VALUE " ".            NC1374.2
   000062         006500     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC1374.2
   000063         006600     02  FILLER              PICTURE X      VALUE ")".            NC1374.2
   000064         006700                                                                  NC1374.2
   000065         006800 01  THREE-DIMENSION-TBL.                                         NC1374.2
   000066         006900     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC1374.2
   000067         007000         03  ENTRY-1         PICTURE X(5).                        NC1374.2
   000068         007100         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC1374.2
   000069         007200             04  ENTRY-2     PICTURE X(11).                       NC1374.2
   000070         007300             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC1374.2
   000071         007400                 05  ENTRY-3 PICTURE X(15).                       NC1374.2
   000072         007500                                                                  NC1374.2
   000073         007600 01  TEST-RESULTS.                                                NC1374.2
   000074         007700     02 FILLER                   PIC X      VALUE SPACE.          NC1374.2 IMP
   000075         007800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1374.2 IMP
   000076         007900     02 FILLER                   PIC X      VALUE SPACE.          NC1374.2 IMP
   000077         008000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1374.2 IMP
   000078         008100     02 FILLER                   PIC X      VALUE SPACE.          NC1374.2 IMP
   000079         008200     02  PAR-NAME.                                                NC1374.2
   000080         008300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1374.2 IMP
   000081         008400       03  PARDOT-X              PIC X      VALUE SPACE.          NC1374.2 IMP
   000082         008500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1374.2 IMP
   000083         008600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1374.2 IMP
   000084         008700     02 RE-MARK                  PIC X(61).                       NC1374.2
   000085         008800 01  TEST-COMPUTED.                                               NC1374.2
   000086         008900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1374.2 IMP
   000087         009000     02 FILLER                   PIC X(17)  VALUE                 NC1374.2
   000088         009100            "       COMPUTED=".                                   NC1374.2
   000089         009200     02 COMPUTED-X.                                               NC1374.2
   000090         009300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1374.2 IMP
   000091         009400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1374.2 90
   000092         009500                                 PIC -9(9).9(9).                  NC1374.2
   000093         009600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1374.2 90
   000094         009700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1374.2 90
   000095         009800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1374.2 90
   000096         009900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1374.2 90
   000097         010000         04 COMPUTED-18V0                    PIC -9(18).          NC1374.2
   000098         010100         04 FILLER                           PIC X.               NC1374.2
   000099         010200     03 FILLER PIC X(50) VALUE SPACE.                             NC1374.2 IMP
   000100         010300 01  TEST-CORRECT.                                                NC1374.2
   000101         010400     02 FILLER PIC X(30) VALUE SPACE.                             NC1374.2 IMP
   000102         010500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1374.2
   000103         010600     02 CORRECT-X.                                                NC1374.2
   000104         010700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1374.2 IMP
   000105         010800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1374.2 104
   000106         010900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1374.2 104
   000107         011000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1374.2 104
   000108         011100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1374.2 104
   000109         011200     03      CR-18V0 REDEFINES CORRECT-A.                         NC1374.2 104
   000110         011300         04 CORRECT-18V0                     PIC -9(18).          NC1374.2
   000111         011400         04 FILLER                           PIC X.               NC1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     03 FILLER PIC X(2) VALUE SPACE.                              NC1374.2 IMP
   000113         011600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1374.2 IMP
   000114         011700 01  CCVS-C-1.                                                    NC1374.2
   000115         011800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1374.2
   000116         011900-    "SS  PARAGRAPH-NAME                                          NC1374.2
   000117         012000-    "       REMARKS".                                            NC1374.2
   000118         012100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1374.2 IMP
   000119         012200 01  CCVS-C-2.                                                    NC1374.2
   000120         012300     02 FILLER                     PIC X        VALUE SPACE.      NC1374.2 IMP
   000121         012400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1374.2
   000122         012500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1374.2 IMP
   000123         012600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1374.2
   000124         012700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1374.2 IMP
   000125         012800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1374.2 IMP
   000126         012900 01  REC-CT                        PIC 99       VALUE ZERO.       NC1374.2 IMP
   000127         013000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1374.2 IMP
   000128         013100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1374.2 IMP
   000129         013200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1374.2 IMP
   000130         013300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1374.2 IMP
   000131         013400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1374.2 IMP
   000132         013500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1374.2 IMP
   000133         013600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1374.2 IMP
   000134         013700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1374.2 IMP
   000135         013800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1374.2 IMP
   000136         013900 01  CCVS-H-1.                                                    NC1374.2
   000137         014000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1374.2 IMP
   000138         014100     02  FILLER                    PIC X(42)    VALUE             NC1374.2
   000139         014200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1374.2
   000140         014300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1374.2 IMP
   000141         014400 01  CCVS-H-2A.                                                   NC1374.2
   000142         014500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1374.2 IMP
   000143         014600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1374.2
   000144         014700   02  FILLER                        PIC XXXX   VALUE             NC1374.2
   000145         014800     "4.2 ".                                                      NC1374.2
   000146         014900   02  FILLER                        PIC X(28)  VALUE             NC1374.2
   000147         015000            " COPY - NOT FOR DISTRIBUTION".                       NC1374.2
   000148         015100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1374.2 IMP
   000149         015200                                                                  NC1374.2
   000150         015300 01  CCVS-H-2B.                                                   NC1374.2
   000151         015400   02  FILLER                        PIC X(15)  VALUE             NC1374.2
   000152         015500            "TEST RESULT OF ".                                    NC1374.2
   000153         015600   02  TEST-ID                       PIC X(9).                    NC1374.2
   000154         015700   02  FILLER                        PIC X(4)   VALUE             NC1374.2
   000155         015800            " IN ".                                               NC1374.2
   000156         015900   02  FILLER                        PIC X(12)  VALUE             NC1374.2
   000157         016000     " HIGH       ".                                              NC1374.2
   000158         016100   02  FILLER                        PIC X(22)  VALUE             NC1374.2
   000159         016200            " LEVEL VALIDATION FOR ".                             NC1374.2
   000160         016300   02  FILLER                        PIC X(58)  VALUE             NC1374.2
   000161         016400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1374.2
   000162         016500 01  CCVS-H-3.                                                    NC1374.2
   000163         016600     02  FILLER                      PIC X(34)  VALUE             NC1374.2
   000164         016700            " FOR OFFICIAL USE ONLY    ".                         NC1374.2
   000165         016800     02  FILLER                      PIC X(58)  VALUE             NC1374.2
   000166         016900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1374.2
   000167         017000     02  FILLER                      PIC X(28)  VALUE             NC1374.2
   000168         017100            "  COPYRIGHT   1985 ".                                NC1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  CCVS-E-1.                                                    NC1374.2
   000170         017300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1374.2 IMP
   000171         017400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1374.2
   000172         017500     02 ID-AGAIN                     PIC X(9).                    NC1374.2
   000173         017600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1374.2 IMP
   000174         017700 01  CCVS-E-2.                                                    NC1374.2
   000175         017800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1374.2 IMP
   000176         017900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1374.2 IMP
   000177         018000     02 CCVS-E-2-2.                                               NC1374.2
   000178         018100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1374.2 IMP
   000179         018200         03 FILLER                   PIC X      VALUE SPACE.      NC1374.2 IMP
   000180         018300         03 ENDER-DESC               PIC X(44)  VALUE             NC1374.2
   000181         018400            "ERRORS ENCOUNTERED".                                 NC1374.2
   000182         018500 01  CCVS-E-3.                                                    NC1374.2
   000183         018600     02  FILLER                      PIC X(22)  VALUE             NC1374.2
   000184         018700            " FOR OFFICIAL USE ONLY".                             NC1374.2
   000185         018800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1374.2 IMP
   000186         018900     02  FILLER                      PIC X(58)  VALUE             NC1374.2
   000187         019000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1374.2
   000188         019100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1374.2 IMP
   000189         019200     02 FILLER                       PIC X(15)  VALUE             NC1374.2
   000190         019300             " COPYRIGHT 1985".                                   NC1374.2
   000191         019400 01  CCVS-E-4.                                                    NC1374.2
   000192         019500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1374.2 IMP
   000193         019600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1374.2
   000194         019700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1374.2 IMP
   000195         019800     02 FILLER                       PIC X(40)  VALUE             NC1374.2
   000196         019900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1374.2
   000197         020000 01  XXINFO.                                                      NC1374.2
   000198         020100     02 FILLER                       PIC X(19)  VALUE             NC1374.2
   000199         020200            "*** INFORMATION ***".                                NC1374.2
   000200         020300     02 INFO-TEXT.                                                NC1374.2
   000201         020400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1374.2 IMP
   000202         020500       04 XXCOMPUTED                 PIC X(20).                   NC1374.2
   000203         020600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1374.2 IMP
   000204         020700       04 XXCORRECT                  PIC X(20).                   NC1374.2
   000205         020800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1374.2
   000206         020900 01  HYPHEN-LINE.                                                 NC1374.2
   000207         021000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1374.2 IMP
   000208         021100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1374.2
   000209         021200-    "*****************************************".                 NC1374.2
   000210         021300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1374.2
   000211         021400-    "******************************".                            NC1374.2
   000212         021500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1374.2
   000213         021600     "NC137A".                                                    NC1374.2
   000214         021700 PROCEDURE DIVISION.                                              NC1374.2
   000215         021800 CCVS1 SECTION.                                                   NC1374.2
   000216         021900 OPEN-FILES.                                                      NC1374.2
   000217         022000     OPEN     OUTPUT PRINT-FILE.                                  NC1374.2 34
   000218         022100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1374.2 212 153 212 172
   000219         022200     MOVE    SPACE TO TEST-RESULTS.                               NC1374.2 IMP 73
   000220         022300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1374.2 245 250
   000221         022400     GO TO CCVS1-EXIT.                                            NC1374.2 332
   000222         022500 CLOSE-FILES.                                                     NC1374.2
   000223         022600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1374.2 254 275 34
   000224         022700 TERMINATE-CCVS.                                                  NC1374.2
   000225         022800     EXIT PROGRAM.                                                NC1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 TERMINATE-CALL.                                                  NC1374.2
   000227         023000     STOP     RUN.                                                NC1374.2
   000228         023100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1374.2 77 129
   000229         023200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1374.2 77 130
   000230         023300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1374.2 77 128
   000231         023400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1374.2 77 127
   000232         023500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1374.2 84
   000233         023600 PRINT-DETAIL.                                                    NC1374.2
   000234         023700     IF REC-CT NOT EQUAL TO ZERO                                  NC1374.2 126 IMP
   000235      1  023800             MOVE "." TO PARDOT-X                                 NC1374.2 81
   000236      1  023900             MOVE REC-CT TO DOTVALUE.                             NC1374.2 126 82
   000237         024000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1374.2 73 35 287
   000238         024100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1374.2 77 287
   000239      1  024200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1374.2 308 322
   000240      1  024300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1374.2 323 331
   000241         024400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1374.2 IMP 77 IMP 89
   000242         024500     MOVE SPACE TO CORRECT-X.                                     NC1374.2 IMP 103
   000243         024600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1374.2 126 IMP IMP 79
   000244         024700     MOVE     SPACE TO RE-MARK.                                   NC1374.2 IMP 84
   000245         024800 HEAD-ROUTINE.                                                    NC1374.2
   000246         024900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1374.2 136 36 287
   000247         025000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1374.2 141 36 287
   000248         025100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1374.2 150 36 287
   000249         025200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1374.2 162 36 287
   000250         025300 COLUMN-NAMES-ROUTINE.                                            NC1374.2
   000251         025400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1374.2 114 36 287
   000252         025500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1374.2 119 36 287
   000253         025600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1374.2 206 36 287
   000254         025700 END-ROUTINE.                                                     NC1374.2
   000255         025800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1374.2 206 36 287
   000256         025900 END-RTN-EXIT.                                                    NC1374.2
   000257         026000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1374.2 169 36 287
   000258         026100 END-ROUTINE-1.                                                   NC1374.2
   000259         026200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1374.2 128 132 129
   000260         026300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1374.2 132 127 132
   000261         026400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1374.2 130 132
   000262         026500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1374.2
   000263         026600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1374.2 130 192
   000264         026700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1374.2 132 194
   000265         026800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1374.2 191 177
   000266         026900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1374.2 174 36 287
   000267         027000  END-ROUTINE-12.                                                 NC1374.2
   000268         027100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1374.2 180
   000269         027200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1374.2 128 IMP
   000270      1  027300         MOVE "NO " TO ERROR-TOTAL                                NC1374.2 178
   000271         027400         ELSE                                                     NC1374.2
   000272      1  027500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1374.2 128 178
   000273         027600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1374.2 174 36
   000274         027700     PERFORM WRITE-LINE.                                          NC1374.2 287
   000275         027800 END-ROUTINE-13.                                                  NC1374.2
   000276         027900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1374.2 127 IMP
   000277      1  028000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1374.2 178
   000278      1  028100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1374.2 127 178
   000279         028200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1374.2 180
   000280         028300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1374.2 174 36 287
   000281         028400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1374.2 129 IMP
   000282      1  028500          MOVE "NO " TO ERROR-TOTAL                               NC1374.2 178
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1374.2 129 178
   000284         028700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1374.2 180
   000285         028800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1374.2 174 36 287
   000286         028900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1374.2 182 36 287
   000287         029000 WRITE-LINE.                                                      NC1374.2
   000288         029100     ADD 1 TO RECORD-COUNT.                                       NC1374.2 134
   000289         029200     IF RECORD-COUNT GREATER 42                                   NC1374.2 134
   000290      1  029300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1374.2 36 133
   000291      1  029400         MOVE SPACE TO DUMMY-RECORD                               NC1374.2 IMP 36
   000292      1  029500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1374.2 36
   000293      1  029600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1374.2 136 36 303
   000294      1  029700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1374.2 141 36 303
   000295      1  029800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1374.2 150 36 303
   000296      1  029900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1374.2 162 36 303
   000297      1  030000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1374.2 114 36 303
   000298      1  030100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1374.2 119 36 303
   000299      1  030200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1374.2 206 36 303
   000300      1  030300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1374.2 133 36
   000301      1  030400         MOVE ZERO TO RECORD-COUNT.                               NC1374.2 IMP 134
   000302         030500     PERFORM WRT-LN.                                              NC1374.2 303
   000303         030600 WRT-LN.                                                          NC1374.2
   000304         030700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1374.2 36
   000305         030800     MOVE SPACE TO DUMMY-RECORD.                                  NC1374.2 IMP 36
   000306         030900 BLANK-LINE-PRINT.                                                NC1374.2
   000307         031000     PERFORM WRT-LN.                                              NC1374.2 303
   000308         031100 FAIL-ROUTINE.                                                    NC1374.2
   000309         031200     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1374.2 89 IMP
   000310      1  031300            GO TO FAIL-ROUTINE-WRITE.                             NC1374.2 317
   000311         031400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1374.2 103 IMP 317
   000312         031500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1374.2 135 205
   000313         031600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1374.2 200
   000314         031700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1374.2 197 36 287
   000315         031800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1374.2 IMP 205
   000316         031900     GO TO  FAIL-ROUTINE-EX.                                      NC1374.2 322
   000317         032000 FAIL-ROUTINE-WRITE.                                              NC1374.2
   000318         032100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1374.2 85 35 287
   000319         032200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1374.2 135 113
   000320         032300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1374.2 100 35 287
   000321         032400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1374.2 IMP 113
   000322         032500 FAIL-ROUTINE-EX. EXIT.                                           NC1374.2
   000323         032600 BAIL-OUT.                                                        NC1374.2
   000324         032700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1374.2 90 IMP 326
   000325         032800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1374.2 104 IMP 331
   000326         032900 BAIL-OUT-WRITE.                                                  NC1374.2
   000327         033000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1374.2 104 204 90 202
   000328         033100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1374.2 135 205
   000329         033200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1374.2 197 36 287
   000330         033300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1374.2 IMP 205
   000331         033400 BAIL-OUT-EX. EXIT.                                               NC1374.2
   000332         033500 CCVS1-EXIT.                                                      NC1374.2
   000333         033600     EXIT.                                                        NC1374.2
   000334         033700 SECT-NC137A-001 SECTION.                                         NC1374.2
   000335         033800 NC137A-001.                                                      NC1374.2
   000336         033900                                                                  NC1374.2
   000337         034000 BUILD-LEVEL-1.                                                   NC1374.2

 ==000337==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-LEVEL-1"
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0                        did not contain any statements.

   000338         034100     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC1374.2 135
   000339         034200     ADD 1 TO SUB-1.                                              NC1374.2 38
   000340         034300     IF SUB-1 EQUAL TO 11 GO TO CHECK-ENTRIES.                    NC1374.2 38 366
   000341         034400     MOVE GRP-NAME TO ENTRY-1 (SUB-1).                            NC1374.2 45 67 38
   000342         034500     ADD 1 TO ADD-GRP.                                            NC1374.2 47
   000343         034600                                                                  NC1374.2
   000344         034700 BUILD-LEVEL-2.                                                   NC1374.2
   000345         034800     ADD 1 TO SUB-2.                                              NC1374.2 39
   000346         034900     IF SUB-2 EQUAL TO 11                                         NC1374.2 39
   000347      1  035000         MOVE ZERO TO SUB-2                                       NC1374.2 IMP 39
   000348      1  035100         MOVE 01 TO ADD-SEC                                       NC1374.2 53
   000349      1  035200         GO TO BUILD-LEVEL-1.                                     NC1374.2 337
   000350         035300     MOVE SUB-1 TO SEC-GRP.                                       NC1374.2 38 51
   000351         035400     MOVE SEC-NAME TO ENTRY-2 (SUB-1  SUB-2).                     NC1374.2 49 69 38 39
   000352         035500     ADD 1 TO ADD-SEC.                                            NC1374.2 53
   000353         035600                                                                  NC1374.2
   000354         035700 BUILD-LEVEL-3.                                                   NC1374.2
   000355         035800     ADD 1 TO SUB-3.                                              NC1374.2 40
   000356         035900     IF SUB-3 EQUAL TO 11                                         NC1374.2 40
   000357      1  036000         MOVE ZERO TO SUB-3                                       NC1374.2 IMP 40
   000358      1  036100              MOVE 01 TO ADD-ELEM                                 NC1374.2 62
   000359      1  036200              GO TO BUILD-LEVEL-2.                                NC1374.2 344
   000360         036300     MOVE SUB-1 TO ELEM-GRP.                                      NC1374.2 38 58
   000361         036400     MOVE SUB-2 TO ELEM-SEC.                                      NC1374.2 39 60
   000362         036500     MOVE ELEM-NAME TO ENTRY-3 (SUB-1  SUB-2  SUB-3).             NC1374.2 56 71 38 39 40
   000363         036600     ADD 1 TO ADD-ELEM.                                           NC1374.2 62
   000364         036700     GO TO BUILD-LEVEL-3.                                         NC1374.2 354
   000365         036800                                                                  NC1374.2
   000366         036900 CHECK-ENTRIES.                                                   NC1374.2
   000367         037000     MOVE "LEVEL 1 INT INDEXING" TO FEATURE.                      NC1374.2 75
   000368         037100     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC1374.2 79
   000369         037200     SET IDX-1 TO 5.                                              NC1374.2 66
   000370         037300     IF ENTRY-1 (IDX-1) IS NOT EQUAL TO "GRP05"                   NC1374.2 67 66
   000371      1  037400         MOVE "GRP05" TO CORRECT-A                                NC1374.2 104
   000372      1  037500         MOVE ENTRY-1 (IDX-1) TO COMPUTED-A                       NC1374.2 67 66 90
   000373         037600                                                                  NC1374.2
   000374      1  037700         MOVE "INTERNAL INDEXING LEVEL 1  " TO RE-MARK            NC1374.2 84
   000375      1  037800         PERFORM FAIL                                             NC1374.2 230
   000376      1  037900         GO TO TEST-1-WRITE.                                      NC1374.2 379
   000377         038000                                                                  NC1374.2
   000378         038100     PERFORM PASS.                                                NC1374.2 229
   000379         038200 TEST-1-WRITE.                                                    NC1374.2
   000380         038300     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000381         038400                                                                  NC1374.2
   000382         038500 TEST-1-2.                                                        NC1374.2
   000383         038600     MOVE "TEST-1-2            " TO PAR-NAME.                     NC1374.2 79
   000384         038700     SET IDX-1 TO 8.                                              NC1374.2 66
   000385         038800     IF ENTRY-1 (IDX-1) IS NOT EQUAL TO "GRP08"                   NC1374.2 67 66
   000386      1  038900         MOVE "GRP08" TO CORRECT-A                                NC1374.2 104
   000387      1  039000         MOVE ENTRY-1 (IDX-1) TO COMPUTED-A                       NC1374.2 67 66 90
   000388         039100                                                                  NC1374.2
   000389      1  039200         MOVE "INTERNAL INDEXING LEVEL 1  " TO RE-MARK            NC1374.2 84
   000390      1  039300         PERFORM FAIL                                             NC1374.2 230
   000391      1  039400          GO TO TEST-1-2-WRITE.                                   NC1374.2 394
   000392         039500                                                                  NC1374.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039600     PERFORM PASS.                                                NC1374.2 229
   000394         039700 TEST-1-2-WRITE.                                                  NC1374.2
   000395         039800     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000396         039900                                                                  NC1374.2
   000397         040000 TEST-2.                                                          NC1374.2
   000398         040100     MOVE "LEVEL 2 INT INDEXING" TO FEATURE.                      NC1374.2 75
   000399         040200     MOVE "TEST-2              " TO PAR-NAME.                     NC1374.2 79
   000400         040300     SET IDX-1 TO 5.                                              NC1374.2 66
   000401         040400     SET IDX-2 TO 6.                                              NC1374.2 68
   000402         040500     IF ENTRY-2 (IDX-1  IDX-2) IS NOT EQUAL TO "SEC (05 06)"      NC1374.2 69 66 68
   000403      1  040600         MOVE "SEC (05 06)" TO CORRECT-A                          NC1374.2 104
   000404      1  040700         MOVE ENTRY-2 (IDX-1  IDX-2) TO COMPUTED-A                NC1374.2 69 66 68 90
   000405         040800                                                                  NC1374.2
   000406      1  040900         MOVE "INTERNAL INDEXING LEVEL 2  " TO RE-MARK            NC1374.2 84
   000407      1  041000         PERFORM FAIL                                             NC1374.2 230
   000408      1  041100         GO TO TEST-2-WRITE.                                      NC1374.2 411
   000409         041200                                                                  NC1374.2
   000410         041300     PERFORM PASS.                                                NC1374.2 229
   000411         041400 TEST-2-WRITE.                                                    NC1374.2
   000412         041500     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000413         041600                                                                  NC1374.2
   000414         041700 TEST-2-2.                                                        NC1374.2
   000415         041800     MOVE "TEST-2-2            " TO PAR-NAME.                     NC1374.2 79
   000416         041900     SET IDX-1  IDX-2 TO 8.                                       NC1374.2 66 68
   000417         042000     IF ENTRY-2 (IDX-1  IDX-2) IS NOT EQUAL TO "SEC (08 08)"      NC1374.2 69 66 68
   000418      1  042100         MOVE "SEC (08 08)" TO CORRECT-A                          NC1374.2 104
   000419      1  042200         MOVE ENTRY-2 (IDX-1  IDX-2) TO COMPUTED-A                NC1374.2 69 66 68 90
   000420         042300                                                                  NC1374.2
   000421      1  042400         MOVE "INTERNAL INDEXING LEVEL 2  " TO RE-MARK            NC1374.2 84
   000422      1  042500         PERFORM FAIL                                             NC1374.2 230
   000423      1  042600         GO TO TEST-2-2-WRITE.                                    NC1374.2 426
   000424         042700                                                                  NC1374.2
   000425         042800     PERFORM PASS.                                                NC1374.2 229
   000426         042900 TEST-2-2-WRITE.                                                  NC1374.2
   000427         043000     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000428         043100                                                                  NC1374.2
   000429         043200 TEST-2-3.                                                        NC1374.2
   000430         043300     MOVE "TEST-2-3            " TO PAR-NAME.                     NC1374.2 79
   000431         043400     SET IDX-1 TO 3.                                              NC1374.2 66
   000432         043500     SET IDX-2 TO 7.                                              NC1374.2 68
   000433         043600     IF ENTRY-2 (IDX-1  IDX-2) IS NOT EQUAL TO "SEC (03 07)"      NC1374.2 69 66 68
   000434      1  043700         MOVE "SEC (03 07)" TO CORRECT-A                          NC1374.2 104
   000435      1  043800         MOVE ENTRY-2 (IDX-1  IDX-2) TO COMPUTED-A                NC1374.2 69 66 68 90
   000436         043900                                                                  NC1374.2
   000437      1  044000         MOVE "INTERNAL INDEXING LEVEL 2  " TO RE-MARK            NC1374.2 84
   000438      1  044100         PERFORM FAIL                                             NC1374.2 230
   000439      1  044200         GO TO TEST-2-3-WRITE.                                    NC1374.2 442
   000440         044300                                                                  NC1374.2
   000441         044400     PERFORM PASS.                                                NC1374.2 229
   000442         044500 TEST-2-3-WRITE.                                                  NC1374.2
   000443         044600     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000444         044700                                                                  NC1374.2
   000445         044800 TEST-3.                                                          NC1374.2
   000446         044900     MOVE "LEVEL 3 INT INDEXING" TO FEATURE.                      NC1374.2 75
   000447         045000     MOVE "TEST-3              " TO PAR-NAME.                     NC1374.2 79
   000448         045100     SET IDX-1 TO 2.                                              NC1374.2 66
   000449         045200     SET IDX-2 TO 6.                                              NC1374.2 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045300     SET IDX-3 TO 10.                                             NC1374.2 70
   000451         045400     IF ENTRY-3 (IDX-1  IDX-2  IDX-3) IS NOT EQUAL TO             NC1374.2 71 66 68 70
   000452         045500              "ELEM (02 06 10)"                                   NC1374.2
   000453      1  045600         MOVE "ELEM (02 06 10)" TO CORRECT-A                      NC1374.2 104
   000454      1  045700         MOVE ENTRY-3 (IDX-1  IDX-2  IDX-3) TO COMPUTED-A         NC1374.2 71 66 68 70 90
   000455         045800                                                                  NC1374.2
   000456      1  045900         MOVE "INTERNAL INDEXING LEVEL 3  " TO RE-MARK            NC1374.2 84
   000457      1  046000         PERFORM FAIL                                             NC1374.2 230
   000458      1  046100         GO TO TEST-3-WRITE.                                      NC1374.2 461
   000459         046200                                                                  NC1374.2
   000460         046300     PERFORM PASS.                                                NC1374.2 229
   000461         046400 TEST-3-WRITE.                                                    NC1374.2
   000462         046500     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000463         046600                                                                  NC1374.2
   000464         046700 TEST-3-2.                                                        NC1374.2
   000465         046800     MOVE "TEST-3-2            " TO PAR-NAME.                     NC1374.2 79
   000466         046900     SET IDX-1  IDX-2  IDX-3 TO 6.                                NC1374.2 66 68 70
   000467         047000     IF ENTRY-3 (IDX-1  IDX-2  IDX-3) IS NOT EQUAL TO             NC1374.2 71 66 68 70
   000468         047100              "ELEM (06 06 06)"                                   NC1374.2
   000469      1  047200         MOVE "ELEM (06 06 06)" TO CORRECT-A                      NC1374.2 104
   000470      1  047300         MOVE ENTRY-3 (IDX-1  IDX-2  IDX-3) TO COMPUTED-A         NC1374.2 71 66 68 70 90
   000471         047400                                                                  NC1374.2
   000472      1  047500         MOVE "INTERNAL INDEXING LEVEL 3  " TO RE-MARK            NC1374.2 84
   000473      1  047600         PERFORM FAIL                                             NC1374.2 230
   000474      1  047700         GO TO TEST-3-2-WRITE.                                    NC1374.2 477
   000475         047800                                                                  NC1374.2
   000476         047900     PERFORM PASS.                                                NC1374.2 229
   000477         048000 TEST-3-2-WRITE.                                                  NC1374.2
   000478         048100     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000479         048200                                                                  NC1374.2
   000480         048300 TEST-3-3.                                                        NC1374.2
   000481         048400     MOVE "TEST-3-3            " TO PAR-NAME.                     NC1374.2 79
   000482         048500     SET IDX-1 TO 9.                                              NC1374.2 66
   000483         048600     SET IDX-2 TO 8.                                              NC1374.2 68
   000484         048700     SET IDX-3 TO 7.                                              NC1374.2 70
   000485         048800     IF ENTRY-3 (IDX-1  IDX-2  IDX-3) IS NOT EQUAL TO             NC1374.2 71 66 68 70
   000486      1  048900         "ELEM (09 08 07)" MOVE "ELEM (09 08 07)" TO CORRECT-A    NC1374.2 104
   000487      1  049000         MOVE ENTRY-3 (IDX-1  IDX-2  IDX-3) TO COMPUTED-A         NC1374.2 71 66 68 70 90
   000488         049100                                                                  NC1374.2
   000489      1  049200         MOVE "INTERNAL INDEXING LEVEL 3  " TO RE-MARK            NC1374.2 84
   000490      1  049300         PERFORM FAIL                                             NC1374.2 230
   000491      1  049400         GO TO END-3LEVEL-SUBSCRPT-TEST.                          NC1374.2 496
   000492         049500                                                                  NC1374.2
   000493         049600     PERFORM PASS.                                                NC1374.2 229
   000494         049700     GO TO END-3LEVEL-SUBSCRPT-TEST.                              NC1374.2 496
   000495         049800                                                                  NC1374.2
   000496         049900 END-3LEVEL-SUBSCRPT-TEST.                                        NC1374.2
   000497         050000     PERFORM PRINT-DETAIL.                                        NC1374.2 233
   000498         050100 CCVS-EXIT SECTION.                                               NC1374.2
   000499         050200 CCVS-999999.                                                     NC1374.2
   000500         050300     GO TO CLOSE-FILES.                                           NC1374.2 222
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       62   ADD-ELEM . . . . . . . . . . .  M358 M363
       47   ADD-GRP. . . . . . . . . . . .  M342
       53   ADD-SEC. . . . . . . . . . . .  M348 M352
      135   ANSI-REFERENCE . . . . . . . .  312 319 328 M338
      114   CCVS-C-1 . . . . . . . . . . .  251 297
      119   CCVS-C-2 . . . . . . . . . . .  252 298
      169   CCVS-E-1 . . . . . . . . . . .  257
      174   CCVS-E-2 . . . . . . . . . . .  266 273 280 285
      177   CCVS-E-2-2 . . . . . . . . . .  M265
      182   CCVS-E-3 . . . . . . . . . . .  286
      191   CCVS-E-4 . . . . . . . . . . .  265
      192   CCVS-E-4-1 . . . . . . . . . .  M263
      194   CCVS-E-4-2 . . . . . . . . . .  M264
      136   CCVS-H-1 . . . . . . . . . . .  246 293
      141   CCVS-H-2A. . . . . . . . . . .  247 294
      150   CCVS-H-2B. . . . . . . . . . .  248 295
      162   CCVS-H-3 . . . . . . . . . . .  249 296
      212   CCVS-PGM-ID. . . . . . . . . .  218 218
       96   CM-18V0
       90   COMPUTED-A . . . . . . . . . .  91 93 94 95 96 324 327 M372 M387 M404 M419 M435 M454 M470 M487
       91   COMPUTED-N
       89   COMPUTED-X . . . . . . . . . .  M241 309
       93   COMPUTED-0V18
       95   COMPUTED-14V4
       97   COMPUTED-18V0
       94   COMPUTED-4V14
       42   CON-10
       43   CON-5
       44   CON-6
       41   CON-7
      113   COR-ANSI-REFERENCE . . . . . .  M319 M321
      104   CORRECT-A. . . . . . . . . . .  105 106 107 108 109 325 327 M371 M386 M403 M418 M434 M453 M469 M486
      105   CORRECT-N
      103   CORRECT-X. . . . . . . . . . .  M242 311
      106   CORRECT-0V18
      108   CORRECT-14V4
      110   CORRECT-18V0
      107   CORRECT-4V14
      109   CR-18V0
      127   DELETE-COUNTER . . . . . . . .  M231 260 276 278
       82   DOTVALUE . . . . . . . . . . .  M236
      133   DUMMY-HOLD . . . . . . . . . .  M290 300
       36   DUMMY-RECORD . . . . . . . . .  M246 M247 M248 M249 M251 M252 M253 M255 M257 M266 M273 M280 M285 M286 290 M291
                                            292 M293 M294 M295 M296 M297 M298 M299 M300 304 M305 M314 M329
       58   ELEM-GRP . . . . . . . . . . .  M360
       56   ELEM-NAME. . . . . . . . . . .  362
       60   ELEM-SEC . . . . . . . . . . .  M361
      180   ENDER-DESC . . . . . . . . . .  M268 M279 M284
       67   ENTRY-1. . . . . . . . . . . .  M341 370 372 385 387
       69   ENTRY-2. . . . . . . . . . . .  M351 402 404 417 419 433 435
       71   ENTRY-3. . . . . . . . . . . .  M362 451 454 467 470 485 487
      128   ERROR-COUNTER. . . . . . . . .  M230 259 269 272
      132   ERROR-HOLD . . . . . . . . . .  M259 M260 M260 M261 264
      178   ERROR-TOTAL. . . . . . . . . .  M270 M272 M277 M278 M282 M283
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    13
0 Defined   Cross-reference of data names   References

0      75   FEATURE. . . . . . . . . . . .  M367 M398 M446
       66   GRP-ENTRY
       45   GRP-NAME . . . . . . . . . . .  341
       68   GRP2-ENTRY
       70   GRP3-ENTRY
      206   HYPHEN-LINE. . . . . . . . . .  253 255 299
      172   ID-AGAIN . . . . . . . . . . .  M218
       66   IDX-1. . . . . . . . . . . . .  M369 370 372 M384 385 387 M400 402 404 M416 417 419 M431 433 435 M448 451 454
                                            M466 467 470 M482 485 487
       68   IDX-2. . . . . . . . . . . . .  M401 402 404 M416 417 419 M432 433 435 M449 451 454 M466 467 470 M483 485 487
       70   IDX-3. . . . . . . . . . . . .  M450 451 454 M466 467 470 M484 485 487
      205   INF-ANSI-REFERENCE . . . . . .  M312 M315 M328 M330
      200   INFO-TEXT. . . . . . . . . . .  M313
      129   INSPECT-COUNTER. . . . . . . .  M228 259 281 283
       77   P-OR-F . . . . . . . . . . . .  M228 M229 M230 M231 238 M241
       79   PAR-NAME . . . . . . . . . . .  M243 M368 M383 M399 M415 M430 M447 M465 M481
       81   PARDOT-X . . . . . . . . . . .  M235
      130   PASS-COUNTER . . . . . . . . .  M229 261 263
       34   PRINT-FILE . . . . . . . . . .  30 217 223
       35   PRINT-REC. . . . . . . . . . .  M237 M318 M320
       84   RE-MARK. . . . . . . . . . . .  M232 M244 M374 M389 M406 M421 M437 M456 M472 M489
      126   REC-CT . . . . . . . . . . . .  234 236 243
      125   REC-SKL-SUB
      134   RECORD-COUNT . . . . . . . . .  M288 289 M301
       51   SEC-GRP. . . . . . . . . . . .  M350
       49   SEC-NAME . . . . . . . . . . .  351
       38   SUB-1. . . . . . . . . . . . .  M339 340 341 350 351 360 362
       39   SUB-2. . . . . . . . . . . . .  M345 346 M347 351 361 362
       40   SUB-3. . . . . . . . . . . . .  M355 356 M357 362
       85   TEST-COMPUTED. . . . . . . . .  318
      100   TEST-CORRECT . . . . . . . . .  320
      153   TEST-ID. . . . . . . . . . . .  M218
       73   TEST-RESULTS . . . . . . . . .  M219 237
       65   THREE-DIMENSION-TBL
      131   TOTAL-ERROR
      202   XXCOMPUTED . . . . . . . . . .  M327
      204   XXCORRECT. . . . . . . . . . .  M327
      197   XXINFO . . . . . . . . . . . .  314 329
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    14
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

      323   BAIL-OUT . . . . . . . . . . .  P240
      331   BAIL-OUT-EX. . . . . . . . . .  E240 G325
      326   BAIL-OUT-WRITE . . . . . . . .  G324
      306   BLANK-LINE-PRINT
      337   BUILD-LEVEL-1. . . . . . . . .  G349
      344   BUILD-LEVEL-2. . . . . . . . .  G359
      354   BUILD-LEVEL-3. . . . . . . . .  G364
      498   CCVS-EXIT
      499   CCVS-999999
      215   CCVS1
      332   CCVS1-EXIT . . . . . . . . . .  G221
      366   CHECK-ENTRIES. . . . . . . . .  G340
      222   CLOSE-FILES. . . . . . . . . .  G500
      250   COLUMN-NAMES-ROUTINE . . . . .  E220
      231   DE-LETE
      254   END-ROUTINE. . . . . . . . . .  P223
      258   END-ROUTINE-1
      267   END-ROUTINE-12
      275   END-ROUTINE-13 . . . . . . . .  E223
      256   END-RTN-EXIT
      496   END-3LEVEL-SUBSCRPT-TEST . . .  G491 G494
      230   FAIL . . . . . . . . . . . . .  P375 P390 P407 P422 P438 P457 P473 P490
      308   FAIL-ROUTINE . . . . . . . . .  P239
      322   FAIL-ROUTINE-EX. . . . . . . .  E239 G316
      317   FAIL-ROUTINE-WRITE . . . . . .  G310 G311
      245   HEAD-ROUTINE . . . . . . . . .  P220
      228   INSPT
      335   NC137A-001
      216   OPEN-FILES
      229   PASS . . . . . . . . . . . . .  P378 P393 P410 P425 P441 P460 P476 P493
      233   PRINT-DETAIL . . . . . . . . .  P380 P395 P412 P427 P443 P462 P478 P497
      334   SECT-NC137A-001
      226   TERMINATE-CALL
      224   TERMINATE-CCVS
      379   TEST-1-WRITE . . . . . . . . .  G376
      382   TEST-1-2
      394   TEST-1-2-WRITE . . . . . . . .  G391
      397   TEST-2
      411   TEST-2-WRITE . . . . . . . . .  G408
      414   TEST-2-2
      426   TEST-2-2-WRITE . . . . . . . .  G423
      429   TEST-2-3
      442   TEST-2-3-WRITE . . . . . . . .  G439
      445   TEST-3
      461   TEST-3-WRITE . . . . . . . . .  G458
      464   TEST-3-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    15
0 Defined   Cross-reference of procedures   References

0     477   TEST-3-2-WRITE . . . . . . . .  G474
      480   TEST-3-3
      287   WRITE-LINE . . . . . . . . . .  P237 P238 P246 P247 P248 P249 P251 P252 P253 P255 P257 P266 P274 P280 P285 P286
                                            P314 P318 P320 P329
      303   WRT-LN . . . . . . . . . . . .  P293 P294 P295 P296 P297 P298 P299 P302 P307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    16
0 Defined   Cross-reference of programs     References

        3   NC137A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC137A    Date 06/04/2022  Time 11:58:15   Page    17
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    337  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-LEVEL-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC137A:
 *    Source records = 500
 *    Data Division statements = 86
 *    Procedure Division statements = 250
 *    Generated COBOL statements = 0
 *    Program complexity factor = 260
0End of compilation 1,  program NC137A,  highest severity 0.
0Return code 0
