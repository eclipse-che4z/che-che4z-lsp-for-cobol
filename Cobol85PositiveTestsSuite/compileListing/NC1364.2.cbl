1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:06   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:58:06   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1364.2
   000002         000200 PROGRAM-ID.                                                      NC1364.2
   000003         000300     NC136A.                                                      NC1364.2
   000004         000500*                                                              *  NC1364.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1364.2
   000006         000700*                                                              *  NC1364.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1364.2
   000008         000900*                                                              *  NC1364.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1364.2
   000010         001100*                                                              *  NC1364.2
   000011         001300*                                                              *  NC1364.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1364.2
   000013         001500*                                                              *  NC1364.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1364.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1364.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1364.2
   000017         001900*                                                              *  NC1364.2
   000018         002100*                                                                 NC1364.2
   000019         002200*    PROGRAM NC136A VERIFIES THE ACCURACY OF BUILDING AND         NC1364.2
   000020         002300*    ACCESSING A 3 DIMENSIONAL TABLE USING VARIOUS COMBINATIONS   NC1364.2
   000021         002400*    OF NUMERIC LITERAL AND DATA-NAME SUBSCRIPTS.                 NC1364.2
   000022         002500*                                                                 NC1364.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1364.2
   000024         002700 CONFIGURATION SECTION.                                           NC1364.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1364.2
   000026         002900     XXXXX082.                                                    NC1364.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1364.2
   000028         003100     XXXXX083.                                                    NC1364.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1364.2
   000030         003300 FILE-CONTROL.                                                    NC1364.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1364.2 35
   000032         003500     XXXXX055.                                                    NC1364.2
   000033         003600 DATA DIVISION.                                                   NC1364.2
   000034         003700 FILE SECTION.                                                    NC1364.2
   000035         003800 FD  PRINT-FILE.                                                  NC1364.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1364.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1364.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1364.2
   000039         004200 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC1364.2 IMP
   000040         004300 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC1364.2 IMP
   000041         004400 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC1364.2 IMP
   000042         004500 77  CON-7              PICTURE 99   VALUE 07.                    NC1364.2
   000043         004600 77  CON-10             PICTURE 99   VALUE 10.                    NC1364.2
   000044         004700 77  CON-5              PICTURE 99   VALUE 05.                    NC1364.2
   000045         004800 77  CON-6              PICTURE 99   VALUE 06.                    NC1364.2
   000046         004900 01  GRP-NAME.                                                    NC1364.2
   000047         005000     02  FILLER              PICTURE XXX    VALUE "GRP".          NC1364.2
   000048         005100     02  ADD-GRP             PICTURE 99     VALUE 01.             NC1364.2
   000049         005200                                                                  NC1364.2
   000050         005300 01  SEC-NAME.                                                    NC1364.2
   000051         005400     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC1364.2
   000052         005500     02  SEC-GRP             PICTURE 99     VALUE 00.             NC1364.2
   000053         005600     02  FILLER              PICTURE X      VALUE " ".            NC1364.2
   000054         005700     02  ADD-SEC             PICTURE 99     VALUE 01.             NC1364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02  FILLER              PICTURE X      VALUE ")".            NC1364.2
   000056         005900                                                                  NC1364.2
   000057         006000 01  ELEM-NAME.                                                   NC1364.2
   000058         006100     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC1364.2
   000059         006200     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC1364.2
   000060         006300     02  FILLER              PICTURE X      VALUE " ".            NC1364.2
   000061         006400     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC1364.2
   000062         006500     02  FILLER              PICTURE X      VALUE " ".            NC1364.2
   000063         006600     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC1364.2
   000064         006700     02  FILLER              PICTURE X      VALUE ")".            NC1364.2
   000065         006800                                                                  NC1364.2
   000066         006900 01  THREE-DIMENSION-TBL.                                         NC1364.2
   000067         007000     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC1364.2
   000068         007100         03  ENTRY-1         PICTURE X(5).                        NC1364.2
   000069         007200         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC1364.2
   000070         007300             04  ENTRY-2     PICTURE X(11).                       NC1364.2
   000071         007400             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC1364.2
   000072         007500                 05  ENTRY-3 PICTURE X(15).                       NC1364.2
   000073         007600                                                                  NC1364.2
   000074         007700 01  TEST-RESULTS.                                                NC1364.2
   000075         007800     02 FILLER                   PIC X      VALUE SPACE.          NC1364.2 IMP
   000076         007900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1364.2 IMP
   000077         008000     02 FILLER                   PIC X      VALUE SPACE.          NC1364.2 IMP
   000078         008100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1364.2 IMP
   000079         008200     02 FILLER                   PIC X      VALUE SPACE.          NC1364.2 IMP
   000080         008300     02  PAR-NAME.                                                NC1364.2
   000081         008400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1364.2 IMP
   000082         008500       03  PARDOT-X              PIC X      VALUE SPACE.          NC1364.2 IMP
   000083         008600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1364.2 IMP
   000084         008700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1364.2 IMP
   000085         008800     02 RE-MARK                  PIC X(61).                       NC1364.2
   000086         008900 01  TEST-COMPUTED.                                               NC1364.2
   000087         009000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1364.2 IMP
   000088         009100     02 FILLER                   PIC X(17)  VALUE                 NC1364.2
   000089         009200            "       COMPUTED=".                                   NC1364.2
   000090         009300     02 COMPUTED-X.                                               NC1364.2
   000091         009400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1364.2 IMP
   000092         009500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1364.2 91
   000093         009600                                 PIC -9(9).9(9).                  NC1364.2
   000094         009700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1364.2 91
   000095         009800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1364.2 91
   000096         009900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1364.2 91
   000097         010000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1364.2 91
   000098         010100         04 COMPUTED-18V0                    PIC -9(18).          NC1364.2
   000099         010200         04 FILLER                           PIC X.               NC1364.2
   000100         010300     03 FILLER PIC X(50) VALUE SPACE.                             NC1364.2 IMP
   000101         010400 01  TEST-CORRECT.                                                NC1364.2
   000102         010500     02 FILLER PIC X(30) VALUE SPACE.                             NC1364.2 IMP
   000103         010600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1364.2
   000104         010700     02 CORRECT-X.                                                NC1364.2
   000105         010800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1364.2 IMP
   000106         010900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1364.2 105
   000107         011000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1364.2 105
   000108         011100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1364.2 105
   000109         011200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1364.2 105
   000110         011300     03      CR-18V0 REDEFINES CORRECT-A.                         NC1364.2 105
   000111         011400         04 CORRECT-18V0                     PIC -9(18).          NC1364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500         04 FILLER                           PIC X.               NC1364.2
   000113         011600     03 FILLER PIC X(2) VALUE SPACE.                              NC1364.2 IMP
   000114         011700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1364.2 IMP
   000115         011800 01  CCVS-C-1.                                                    NC1364.2
   000116         011900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1364.2
   000117         012000-    "SS  PARAGRAPH-NAME                                          NC1364.2
   000118         012100-    "       REMARKS".                                            NC1364.2
   000119         012200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1364.2 IMP
   000120         012300 01  CCVS-C-2.                                                    NC1364.2
   000121         012400     02 FILLER                     PIC X        VALUE SPACE.      NC1364.2 IMP
   000122         012500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1364.2
   000123         012600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1364.2 IMP
   000124         012700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1364.2
   000125         012800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1364.2 IMP
   000126         012900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1364.2 IMP
   000127         013000 01  REC-CT                        PIC 99       VALUE ZERO.       NC1364.2 IMP
   000128         013100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1364.2 IMP
   000129         013200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1364.2 IMP
   000130         013300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1364.2 IMP
   000131         013400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1364.2 IMP
   000132         013500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1364.2 IMP
   000133         013600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1364.2 IMP
   000134         013700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1364.2 IMP
   000135         013800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1364.2 IMP
   000136         013900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1364.2 IMP
   000137         014000 01  CCVS-H-1.                                                    NC1364.2
   000138         014100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1364.2 IMP
   000139         014200     02  FILLER                    PIC X(42)    VALUE             NC1364.2
   000140         014300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1364.2
   000141         014400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1364.2 IMP
   000142         014500 01  CCVS-H-2A.                                                   NC1364.2
   000143         014600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1364.2 IMP
   000144         014700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1364.2
   000145         014800   02  FILLER                        PIC XXXX   VALUE             NC1364.2
   000146         014900     "4.2 ".                                                      NC1364.2
   000147         015000   02  FILLER                        PIC X(28)  VALUE             NC1364.2
   000148         015100            " COPY - NOT FOR DISTRIBUTION".                       NC1364.2
   000149         015200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1364.2 IMP
   000150         015300                                                                  NC1364.2
   000151         015400 01  CCVS-H-2B.                                                   NC1364.2
   000152         015500   02  FILLER                        PIC X(15)  VALUE             NC1364.2
   000153         015600            "TEST RESULT OF ".                                    NC1364.2
   000154         015700   02  TEST-ID                       PIC X(9).                    NC1364.2
   000155         015800   02  FILLER                        PIC X(4)   VALUE             NC1364.2
   000156         015900            " IN ".                                               NC1364.2
   000157         016000   02  FILLER                        PIC X(12)  VALUE             NC1364.2
   000158         016100     " HIGH       ".                                              NC1364.2
   000159         016200   02  FILLER                        PIC X(22)  VALUE             NC1364.2
   000160         016300            " LEVEL VALIDATION FOR ".                             NC1364.2
   000161         016400   02  FILLER                        PIC X(58)  VALUE             NC1364.2
   000162         016500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1364.2
   000163         016600 01  CCVS-H-3.                                                    NC1364.2
   000164         016700     02  FILLER                      PIC X(34)  VALUE             NC1364.2
   000165         016800            " FOR OFFICIAL USE ONLY    ".                         NC1364.2
   000166         016900     02  FILLER                      PIC X(58)  VALUE             NC1364.2
   000167         017000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1364.2
   000168         017100     02  FILLER                      PIC X(28)  VALUE             NC1364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200            "  COPYRIGHT   1985 ".                                NC1364.2
   000170         017300 01  CCVS-E-1.                                                    NC1364.2
   000171         017400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1364.2 IMP
   000172         017500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1364.2
   000173         017600     02 ID-AGAIN                     PIC X(9).                    NC1364.2
   000174         017700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1364.2 IMP
   000175         017800 01  CCVS-E-2.                                                    NC1364.2
   000176         017900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1364.2 IMP
   000177         018000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1364.2 IMP
   000178         018100     02 CCVS-E-2-2.                                               NC1364.2
   000179         018200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1364.2 IMP
   000180         018300         03 FILLER                   PIC X      VALUE SPACE.      NC1364.2 IMP
   000181         018400         03 ENDER-DESC               PIC X(44)  VALUE             NC1364.2
   000182         018500            "ERRORS ENCOUNTERED".                                 NC1364.2
   000183         018600 01  CCVS-E-3.                                                    NC1364.2
   000184         018700     02  FILLER                      PIC X(22)  VALUE             NC1364.2
   000185         018800            " FOR OFFICIAL USE ONLY".                             NC1364.2
   000186         018900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1364.2 IMP
   000187         019000     02  FILLER                      PIC X(58)  VALUE             NC1364.2
   000188         019100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1364.2
   000189         019200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1364.2 IMP
   000190         019300     02 FILLER                       PIC X(15)  VALUE             NC1364.2
   000191         019400             " COPYRIGHT 1985".                                   NC1364.2
   000192         019500 01  CCVS-E-4.                                                    NC1364.2
   000193         019600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1364.2 IMP
   000194         019700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1364.2
   000195         019800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1364.2 IMP
   000196         019900     02 FILLER                       PIC X(40)  VALUE             NC1364.2
   000197         020000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1364.2
   000198         020100 01  XXINFO.                                                      NC1364.2
   000199         020200     02 FILLER                       PIC X(19)  VALUE             NC1364.2
   000200         020300            "*** INFORMATION ***".                                NC1364.2
   000201         020400     02 INFO-TEXT.                                                NC1364.2
   000202         020500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1364.2 IMP
   000203         020600       04 XXCOMPUTED                 PIC X(20).                   NC1364.2
   000204         020700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1364.2 IMP
   000205         020800       04 XXCORRECT                  PIC X(20).                   NC1364.2
   000206         020900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1364.2
   000207         021000 01  HYPHEN-LINE.                                                 NC1364.2
   000208         021100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1364.2 IMP
   000209         021200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1364.2
   000210         021300-    "*****************************************".                 NC1364.2
   000211         021400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1364.2
   000212         021500-    "******************************".                            NC1364.2
   000213         021600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1364.2
   000214         021700     "NC136A".                                                    NC1364.2
   000215         021800 PROCEDURE DIVISION.                                              NC1364.2
   000216         021900 CCVS1 SECTION.                                                   NC1364.2
   000217         022000 OPEN-FILES.                                                      NC1364.2
   000218         022100     OPEN     OUTPUT PRINT-FILE.                                  NC1364.2 35
   000219         022200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1364.2 213 154 213 173
   000220         022300     MOVE    SPACE TO TEST-RESULTS.                               NC1364.2 IMP 74
   000221         022400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1364.2 246 251
   000222         022500     GO TO CCVS1-EXIT.                                            NC1364.2 333
   000223         022600 CLOSE-FILES.                                                     NC1364.2
   000224         022700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1364.2 255 276 35
   000225         022800 TERMINATE-CCVS.                                                  NC1364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     EXIT PROGRAM.                                                NC1364.2
   000227         023000 TERMINATE-CALL.                                                  NC1364.2
   000228         023100     STOP     RUN.                                                NC1364.2
   000229         023200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1364.2 78 130
   000230         023300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1364.2 78 131
   000231         023400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1364.2 78 129
   000232         023500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1364.2 78 128
   000233         023600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1364.2 85
   000234         023700 PRINT-DETAIL.                                                    NC1364.2
   000235         023800     IF REC-CT NOT EQUAL TO ZERO                                  NC1364.2 127 IMP
   000236      1  023900             MOVE "." TO PARDOT-X                                 NC1364.2 82
   000237      1  024000             MOVE REC-CT TO DOTVALUE.                             NC1364.2 127 83
   000238         024100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1364.2 74 36 288
   000239         024200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1364.2 78 288
   000240      1  024300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1364.2 309 323
   000241      1  024400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1364.2 324 332
   000242         024500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1364.2 IMP 78 IMP 90
   000243         024600     MOVE SPACE TO CORRECT-X.                                     NC1364.2 IMP 104
   000244         024700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1364.2 127 IMP IMP 80
   000245         024800     MOVE     SPACE TO RE-MARK.                                   NC1364.2 IMP 85
   000246         024900 HEAD-ROUTINE.                                                    NC1364.2
   000247         025000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1364.2 137 37 288
   000248         025100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1364.2 142 37 288
   000249         025200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1364.2 151 37 288
   000250         025300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1364.2 163 37 288
   000251         025400 COLUMN-NAMES-ROUTINE.                                            NC1364.2
   000252         025500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1364.2 115 37 288
   000253         025600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1364.2 120 37 288
   000254         025700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1364.2 207 37 288
   000255         025800 END-ROUTINE.                                                     NC1364.2
   000256         025900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1364.2 207 37 288
   000257         026000 END-RTN-EXIT.                                                    NC1364.2
   000258         026100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1364.2 170 37 288
   000259         026200 END-ROUTINE-1.                                                   NC1364.2
   000260         026300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1364.2 129 133 130
   000261         026400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1364.2 133 128 133
   000262         026500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1364.2 131 133
   000263         026600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1364.2
   000264         026700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1364.2 131 193
   000265         026800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1364.2 133 195
   000266         026900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1364.2 192 178
   000267         027000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1364.2 175 37 288
   000268         027100  END-ROUTINE-12.                                                 NC1364.2
   000269         027200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1364.2 181
   000270         027300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1364.2 129 IMP
   000271      1  027400         MOVE "NO " TO ERROR-TOTAL                                NC1364.2 179
   000272         027500         ELSE                                                     NC1364.2
   000273      1  027600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1364.2 129 179
   000274         027700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1364.2 175 37
   000275         027800     PERFORM WRITE-LINE.                                          NC1364.2 288
   000276         027900 END-ROUTINE-13.                                                  NC1364.2
   000277         028000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1364.2 128 IMP
   000278      1  028100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1364.2 179
   000279      1  028200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1364.2 128 179
   000280         028300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1364.2 181
   000281         028400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1364.2 175 37 288
   000282         028500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1364.2 130 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028600          MOVE "NO " TO ERROR-TOTAL                               NC1364.2 179
   000284      1  028700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1364.2 130 179
   000285         028800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1364.2 181
   000286         028900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1364.2 175 37 288
   000287         029000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1364.2 183 37 288
   000288         029100 WRITE-LINE.                                                      NC1364.2
   000289         029200     ADD 1 TO RECORD-COUNT.                                       NC1364.2 135
   000290         029300     IF RECORD-COUNT GREATER 42                                   NC1364.2 135
   000291      1  029400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1364.2 37 134
   000292      1  029500         MOVE SPACE TO DUMMY-RECORD                               NC1364.2 IMP 37
   000293      1  029600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1364.2 37
   000294      1  029700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1364.2 137 37 304
   000295      1  029800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1364.2 142 37 304
   000296      1  029900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1364.2 151 37 304
   000297      1  030000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1364.2 163 37 304
   000298      1  030100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1364.2 115 37 304
   000299      1  030200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1364.2 120 37 304
   000300      1  030300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1364.2 207 37 304
   000301      1  030400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1364.2 134 37
   000302      1  030500         MOVE ZERO TO RECORD-COUNT.                               NC1364.2 IMP 135
   000303         030600     PERFORM WRT-LN.                                              NC1364.2 304
   000304         030700 WRT-LN.                                                          NC1364.2
   000305         030800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1364.2 37
   000306         030900     MOVE SPACE TO DUMMY-RECORD.                                  NC1364.2 IMP 37
   000307         031000 BLANK-LINE-PRINT.                                                NC1364.2
   000308         031100     PERFORM WRT-LN.                                              NC1364.2 304
   000309         031200 FAIL-ROUTINE.                                                    NC1364.2
   000310         031300     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1364.2 90 IMP
   000311      1  031400            GO TO FAIL-ROUTINE-WRITE.                             NC1364.2 318
   000312         031500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1364.2 104 IMP 318
   000313         031600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1364.2 136 206
   000314         031700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1364.2 201
   000315         031800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1364.2 198 37 288
   000316         031900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1364.2 IMP 206
   000317         032000     GO TO  FAIL-ROUTINE-EX.                                      NC1364.2 323
   000318         032100 FAIL-ROUTINE-WRITE.                                              NC1364.2
   000319         032200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1364.2 86 36 288
   000320         032300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1364.2 136 114
   000321         032400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1364.2 101 36 288
   000322         032500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1364.2 IMP 114
   000323         032600 FAIL-ROUTINE-EX. EXIT.                                           NC1364.2
   000324         032700 BAIL-OUT.                                                        NC1364.2
   000325         032800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1364.2 91 IMP 327
   000326         032900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1364.2 105 IMP 332
   000327         033000 BAIL-OUT-WRITE.                                                  NC1364.2
   000328         033100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1364.2 105 205 91 203
   000329         033200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1364.2 136 206
   000330         033300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1364.2 198 37 288
   000331         033400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1364.2 IMP 206
   000332         033500 BAIL-OUT-EX. EXIT.                                               NC1364.2
   000333         033600 CCVS1-EXIT.                                                      NC1364.2
   000334         033700     EXIT.                                                        NC1364.2
   000335         033800 SECT-NC136A-001 SECTION.                                         NC1364.2
   000336         033900 NC136-001.                                                       NC1364.2
   000337         034000                                                                  NC1364.2
   000338         034100 BUILD-LEVEL-1.                                                   NC1364.2

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0==000338==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-LEVEL-1"
                         did not contain any statements.

   000339         034200     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC1364.2 136
   000340         034300     ADD 1 TO SUB-1.                                              NC1364.2 39
   000341         034400     IF SUB-1 EQUAL TO 11 GO TO CHECK-ENTRIES.                    NC1364.2 39 367
   000342         034500     MOVE GRP-NAME TO ENTRY-1 (SUB-1).                            NC1364.2 46 68 39
   000343         034600     ADD 1 TO ADD-GRP.                                            NC1364.2 48
   000344         034700                                                                  NC1364.2
   000345         034800 BUILD-LEVEL-2.                                                   NC1364.2
   000346         034900     ADD 1 TO SUB-2.                                              NC1364.2 40
   000347         035000     IF SUB-2 EQUAL TO 11                                         NC1364.2 40
   000348      1  035100         MOVE ZERO TO SUB-2                                       NC1364.2 IMP 40
   000349      1  035200         MOVE 01 TO ADD-SEC                                       NC1364.2 54
   000350      1  035300         GO TO BUILD-LEVEL-1.                                     NC1364.2 338
   000351         035400     MOVE SUB-1 TO SEC-GRP.                                       NC1364.2 39 52
   000352         035500     MOVE SEC-NAME TO ENTRY-2 (SUB-1  SUB-2).                     NC1364.2 50 70 39 40
   000353         035600     ADD 1 TO ADD-SEC.                                            NC1364.2 54
   000354         035700                                                                  NC1364.2
   000355         035800 BUILD-LEVEL-3.                                                   NC1364.2
   000356         035900     ADD 1 TO SUB-3.                                              NC1364.2 41
   000357         036000     IF SUB-3 EQUAL TO 11                                         NC1364.2 41
   000358      1  036100         MOVE ZERO TO SUB-3                                       NC1364.2 IMP 41
   000359      1  036200              MOVE 01 TO ADD-ELEM                                 NC1364.2 63
   000360      1  036300              GO TO BUILD-LEVEL-2.                                NC1364.2 345
   000361         036400     MOVE SUB-1 TO ELEM-GRP.                                      NC1364.2 39 59
   000362         036500     MOVE SUB-2 TO ELEM-SEC.                                      NC1364.2 40 61
   000363         036600     MOVE ELEM-NAME TO ENTRY-3 (SUB-1  SUB-2  SUB-3).             NC1364.2 57 72 39 40 41
   000364         036700     ADD 1 TO ADD-ELEM.                                           NC1364.2 63
   000365         036800     GO TO BUILD-LEVEL-3.                                         NC1364.2 355
   000366         036900                                                                  NC1364.2
   000367         037000 CHECK-ENTRIES.                                                   NC1364.2
   000368         037100     MOVE "LEVEL 1 TBL SUBSCRPT" TO FEATURE.                      NC1364.2 76
   000369         037200     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC1364.2 80
   000370         037300     IF ENTRY-1 (5) IS NOT EQUAL TO "GRP05"                       NC1364.2 68
   000371      1  037400         MOVE "GRP05" TO CORRECT-A                                NC1364.2 105
   000372      1  037500         MOVE ENTRY-1 (5) TO COMPUTED-A                           NC1364.2 68 91
   000373         037600                                                                  NC1364.2
   000374      1  037700         MOVE "NUMERIC LITERAL SUBSCRIPT  " TO RE-MARK            NC1364.2 85
   000375      1  037800         PERFORM FAIL                                             NC1364.2 231
   000376      1  037900         GO TO TEST-1-WRITE.                                      NC1364.2 379
   000377         038000                                                                  NC1364.2
   000378         038100     PERFORM PASS.                                                NC1364.2 230
   000379         038200 TEST-1-WRITE.                                                    NC1364.2
   000380         038300     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000381         038400                                                                  NC1364.2
   000382         038500 TEST-1-2.                                                        NC1364.2
   000383         038600     MOVE "TEST-1-2            " TO PAR-NAME.                     NC1364.2 80
   000384         038700     IF ENTRY-1 (CON-5) IS NOT EQUAL TO "GRP05"                   NC1364.2 68 44
   000385      1  038800         MOVE "GRP05" TO CORRECT-A                                NC1364.2 105
   000386      1  038900         MOVE ENTRY-1 (CON-5) TO COMPUTED-A                       NC1364.2 68 44 91
   000387         039000                                                                  NC1364.2
   000388      1  039100         MOVE "NUMERIC CONSTANT SUBSCRIPT " TO RE-MARK            NC1364.2 85
   000389      1  039200         PERFORM FAIL                                             NC1364.2 231
   000390      1  039300          GO TO TEST-1-2-WRITE.                                   NC1364.2 393
   000391         039400                                                                  NC1364.2
   000392         039500     PERFORM PASS.                                                NC1364.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039600 TEST-1-2-WRITE.                                                  NC1364.2
   000394         039700     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000395         039800                                                                  NC1364.2
   000396         039900 TEST-2.                                                          NC1364.2
   000397         040000     MOVE "LEVEL 2 TBL SUBSCRPT" TO FEATURE.                      NC1364.2 76
   000398         040100     MOVE "TEST-2              " TO PAR-NAME.                     NC1364.2 80
   000399         040200     IF ENTRY-2 (5  6) IS NOT EQUAL TO "SEC (05 06)"              NC1364.2 70
   000400      1  040300         MOVE "SEC (05 06)" TO CORRECT-A                          NC1364.2 105
   000401      1  040400         MOVE ENTRY-2 (5  6) TO COMPUTED-A                        NC1364.2 70 91
   000402         040500                                                                  NC1364.2
   000403      1  040600         MOVE "NUMERIC LITERAL SUBSCRIPT  " TO RE-MARK            NC1364.2 85
   000404      1  040700         PERFORM FAIL                                             NC1364.2 231
   000405      1  040800         GO TO TEST-2-WRITE.                                      NC1364.2 408
   000406         040900                                                                  NC1364.2
   000407         041000     PERFORM PASS.                                                NC1364.2 230
   000408         041100 TEST-2-WRITE.                                                    NC1364.2
   000409         041200     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000410         041300                                                                  NC1364.2
   000411         041400 TEST-2-2.                                                        NC1364.2
   000412         041500     MOVE "TEST-2-2            " TO PAR-NAME.                     NC1364.2 80
   000413         041600     IF ENTRY-2 (05  CON-6) IS NOT EQUAL TO "SEC (05 06)"         NC1364.2 70 45
   000414      1  041700         MOVE "SEC (05 06)" TO CORRECT-A                          NC1364.2 105
   000415      1  041800         MOVE ENTRY-2 (05  CON-6) TO COMPUTED-A                   NC1364.2 70 45 91
   000416         041900                                                                  NC1364.2
   000417      1  042000         MOVE "NUM LITRL/CONSTANT SUBSCRPT" TO RE-MARK            NC1364.2 85
   000418      1  042100         PERFORM FAIL                                             NC1364.2 231
   000419      1  042200         GO TO TEST-2-2-WRITE.                                    NC1364.2 422
   000420         042300                                                                  NC1364.2
   000421         042400     PERFORM PASS.                                                NC1364.2 230
   000422         042500 TEST-2-2-WRITE.                                                  NC1364.2
   000423         042600     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000424         042700                                                                  NC1364.2
   000425         042800 TEST-2-3.                                                        NC1364.2
   000426         042900     MOVE "TEST-2-3            " TO PAR-NAME.                     NC1364.2 80
   000427         043000     IF ENTRY-2 (CON-5  CON-6) IS NOT EQUAL TO "SEC (05 06)"      NC1364.2 70 44 45
   000428      1  043100         MOVE "SEC (05 06)" TO CORRECT-A                          NC1364.2 105
   000429      1  043200         MOVE ENTRY-2 (CON-5  CON-6) TO COMPUTED-A                NC1364.2 70 44 45 91
   000430         043300                                                                  NC1364.2
   000431      1  043400         MOVE "2 NUMERIC CONSTANT SUBSCRPT" TO RE-MARK            NC1364.2 85
   000432      1  043500         PERFORM FAIL                                             NC1364.2 231
   000433      1  043600         GO TO TEST-2-3-WRITE.                                    NC1364.2 436
   000434         043700                                                                  NC1364.2
   000435         043800     PERFORM PASS.                                                NC1364.2 230
   000436         043900 TEST-2-3-WRITE.                                                  NC1364.2
   000437         044000     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000438         044100                                                                  NC1364.2
   000439         044200 TEST-3.                                                          NC1364.2
   000440         044300     MOVE "LEVEL 3 TBL SUBSCRPT" TO FEATURE.                      NC1364.2 76
   000441         044400     MOVE "TEST-3              " TO PAR-NAME.                     NC1364.2 80
   000442         044500     IF ENTRY-3 (10  05  06) IS NOT EQUAL TO "ELEM (10 05 06)"    NC1364.2 72
   000443      1  044600         MOVE "ELEM (10 05 06)" TO CORRECT-A                      NC1364.2 105
   000444      1  044700         MOVE ENTRY-3 (10  05  06) TO COMPUTED-A                  NC1364.2 72 91
   000445         044800                                                                  NC1364.2
   000446      1  044900         MOVE "3 NUMERIC LITERAL SUBSCRPTS" TO RE-MARK            NC1364.2 85
   000447      1  045000         PERFORM FAIL                                             NC1364.2 231
   000448      1  045100         GO TO TEST-3-WRITE.                                      NC1364.2 451
   000449         045200                                                                  NC1364.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045300     PERFORM PASS.                                                NC1364.2 230
   000451         045400 TEST-3-WRITE.                                                    NC1364.2
   000452         045500     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000453         045600                                                                  NC1364.2
   000454         045700 TEST-3-2.                                                        NC1364.2
   000455         045800     MOVE "TEST-3-2            " TO PAR-NAME.                     NC1364.2 80
   000456         045900     IF ENTRY-3 (10  CON-5  CON-6) IS NOT EQUAL TO                NC1364.2 72 44 45
   000457         046000         "ELEM (10 05 06)"                                        NC1364.2
   000458      1  046100         MOVE "ELEM (10 05 06)" TO CORRECT-A                      NC1364.2 105
   000459      1  046200         MOVE ENTRY-3 (10  CON-5  CON-6) TO COMPUTED-A            NC1364.2 72 44 45 91
   000460         046300                                                                  NC1364.2
   000461      1  046400         MOVE "1 NUM LTRL/2 CONSTANT SUBS " TO RE-MARK            NC1364.2 85
   000462      1  046500         PERFORM FAIL                                             NC1364.2 231
   000463      1  046600         GO TO TEST-3-2-WRITE.                                    NC1364.2 466
   000464         046700                                                                  NC1364.2
   000465         046800     PERFORM PASS.                                                NC1364.2 230
   000466         046900 TEST-3-2-WRITE.                                                  NC1364.2
   000467         047000     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000468         047100                                                                  NC1364.2
   000469         047200 TEST-3-3.                                                        NC1364.2
   000470         047300     MOVE "TEST-3-3            " TO PAR-NAME.                     NC1364.2 80
   000471         047400     IF ENTRY-3 (CON-10  CON-5  CON-6) IS NOT EQUAL TO            NC1364.2 72 43 44 45
   000472      1  047500         "ELEM (10 05 06)" MOVE "ELEM (10 05 06)" TO CORRECT-A    NC1364.2 105
   000473      1  047600         MOVE ENTRY-3 (CON-10  CON-5  CON-6) TO COMPUTED-A        NC1364.2 72 43 44 45 91
   000474         047700                                                                  NC1364.2
   000475      1  047800         MOVE "3 NUMERIC CONSTANT SUBSCRPT" TO RE-MARK            NC1364.2 85
   000476      1  047900         PERFORM FAIL                                             NC1364.2 231
   000477      1  048000         GO TO END-3LEVEL-SUBSCRPT-TEST.                          NC1364.2 482
   000478         048100                                                                  NC1364.2
   000479         048200     PERFORM PASS.                                                NC1364.2 230
   000480         048300     GO TO END-3LEVEL-SUBSCRPT-TEST.                              NC1364.2 482
   000481         048400                                                                  NC1364.2
   000482         048500 END-3LEVEL-SUBSCRPT-TEST.                                        NC1364.2
   000483         048600     PERFORM PRINT-DETAIL.                                        NC1364.2 234
   000484         048700 CCVS-EXIT SECTION.                                               NC1364.2
   000485         048800 CCVS-999999.                                                     NC1364.2
   000486         048900     GO TO CLOSE-FILES.                                           NC1364.2 223
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    12
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       63   ADD-ELEM . . . . . . . . . . .  M359 M364
       48   ADD-GRP. . . . . . . . . . . .  M343
       54   ADD-SEC. . . . . . . . . . . .  M349 M353
      136   ANSI-REFERENCE . . . . . . . .  313 320 329 M339
      115   CCVS-C-1 . . . . . . . . . . .  252 298
      120   CCVS-C-2 . . . . . . . . . . .  253 299
      170   CCVS-E-1 . . . . . . . . . . .  258
      175   CCVS-E-2 . . . . . . . . . . .  267 274 281 286
      178   CCVS-E-2-2 . . . . . . . . . .  M266
      183   CCVS-E-3 . . . . . . . . . . .  287
      192   CCVS-E-4 . . . . . . . . . . .  266
      193   CCVS-E-4-1 . . . . . . . . . .  M264
      195   CCVS-E-4-2 . . . . . . . . . .  M265
      137   CCVS-H-1 . . . . . . . . . . .  247 294
      142   CCVS-H-2A. . . . . . . . . . .  248 295
      151   CCVS-H-2B. . . . . . . . . . .  249 296
      163   CCVS-H-3 . . . . . . . . . . .  250 297
      213   CCVS-PGM-ID. . . . . . . . . .  219 219
       97   CM-18V0
       91   COMPUTED-A . . . . . . . . . .  92 94 95 96 97 325 328 M372 M386 M401 M415 M429 M444 M459 M473
       92   COMPUTED-N
       90   COMPUTED-X . . . . . . . . . .  M242 310
       94   COMPUTED-0V18
       96   COMPUTED-14V4
       98   COMPUTED-18V0
       95   COMPUTED-4V14
       43   CON-10 . . . . . . . . . . . .  471 473
       44   CON-5. . . . . . . . . . . . .  384 386 427 429 456 459 471 473
       45   CON-6. . . . . . . . . . . . .  413 415 427 429 456 459 471 473
       42   CON-7
      114   COR-ANSI-REFERENCE . . . . . .  M320 M322
      105   CORRECT-A. . . . . . . . . . .  106 107 108 109 110 326 328 M371 M385 M400 M414 M428 M443 M458 M472
      106   CORRECT-N
      104   CORRECT-X. . . . . . . . . . .  M243 312
      107   CORRECT-0V18
      109   CORRECT-14V4
      111   CORRECT-18V0
      108   CORRECT-4V14
      110   CR-18V0
      128   DELETE-COUNTER . . . . . . . .  M232 261 277 279
       83   DOTVALUE . . . . . . . . . . .  M237
      134   DUMMY-HOLD . . . . . . . . . .  M291 301
       37   DUMMY-RECORD . . . . . . . . .  M247 M248 M249 M250 M252 M253 M254 M256 M258 M267 M274 M281 M286 M287 291 M292
                                            293 M294 M295 M296 M297 M298 M299 M300 M301 305 M306 M315 M330
       59   ELEM-GRP . . . . . . . . . . .  M361
       57   ELEM-NAME. . . . . . . . . . .  363
       61   ELEM-SEC . . . . . . . . . . .  M362
      181   ENDER-DESC . . . . . . . . . .  M269 M280 M285
       68   ENTRY-1. . . . . . . . . . . .  M342 370 372 384 386
       70   ENTRY-2. . . . . . . . . . . .  M352 399 401 413 415 427 429
       72   ENTRY-3. . . . . . . . . . . .  M363 442 444 456 459 471 473
      129   ERROR-COUNTER. . . . . . . . .  M231 260 270 273
      133   ERROR-HOLD . . . . . . . . . .  M260 M261 M261 M262 265
      179   ERROR-TOTAL. . . . . . . . . .  M271 M273 M278 M279 M283 M284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    13
0 Defined   Cross-reference of data names   References

0      76   FEATURE. . . . . . . . . . . .  M368 M397 M440
       67   GRP-ENTRY
       46   GRP-NAME . . . . . . . . . . .  342
       69   GRP2-ENTRY
       71   GRP3-ENTRY
      207   HYPHEN-LINE. . . . . . . . . .  254 256 300
      173   ID-AGAIN . . . . . . . . . . .  M219
       67   IDX-1
       69   IDX-2
       71   IDX-3
      206   INF-ANSI-REFERENCE . . . . . .  M313 M316 M329 M331
      201   INFO-TEXT. . . . . . . . . . .  M314
      130   INSPECT-COUNTER. . . . . . . .  M229 260 282 284
       78   P-OR-F . . . . . . . . . . . .  M229 M230 M231 M232 239 M242
       80   PAR-NAME . . . . . . . . . . .  M244 M369 M383 M398 M412 M426 M441 M455 M470
       82   PARDOT-X . . . . . . . . . . .  M236
      131   PASS-COUNTER . . . . . . . . .  M230 262 264
       35   PRINT-FILE . . . . . . . . . .  31 218 224
       36   PRINT-REC. . . . . . . . . . .  M238 M319 M321
       85   RE-MARK. . . . . . . . . . . .  M233 M245 M374 M388 M403 M417 M431 M446 M461 M475
      127   REC-CT . . . . . . . . . . . .  235 237 244
      126   REC-SKL-SUB
      135   RECORD-COUNT . . . . . . . . .  M289 290 M302
       52   SEC-GRP. . . . . . . . . . . .  M351
       50   SEC-NAME . . . . . . . . . . .  352
       39   SUB-1. . . . . . . . . . . . .  M340 341 342 351 352 361 363
       40   SUB-2. . . . . . . . . . . . .  M346 347 M348 352 362 363
       41   SUB-3. . . . . . . . . . . . .  M356 357 M358 363
       86   TEST-COMPUTED. . . . . . . . .  319
      101   TEST-CORRECT . . . . . . . . .  321
      154   TEST-ID. . . . . . . . . . . .  M219
       74   TEST-RESULTS . . . . . . . . .  M220 238
       66   THREE-DIMENSION-TBL
      132   TOTAL-ERROR
      203   XXCOMPUTED . . . . . . . . . .  M328
      205   XXCORRECT. . . . . . . . . . .  M328
      198   XXINFO . . . . . . . . . . . .  315 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    14
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

      324   BAIL-OUT . . . . . . . . . . .  P241
      332   BAIL-OUT-EX. . . . . . . . . .  E241 G326
      327   BAIL-OUT-WRITE . . . . . . . .  G325
      307   BLANK-LINE-PRINT
      338   BUILD-LEVEL-1. . . . . . . . .  G350
      345   BUILD-LEVEL-2. . . . . . . . .  G360
      355   BUILD-LEVEL-3. . . . . . . . .  G365
      484   CCVS-EXIT
      485   CCVS-999999
      216   CCVS1
      333   CCVS1-EXIT . . . . . . . . . .  G222
      367   CHECK-ENTRIES. . . . . . . . .  G341
      223   CLOSE-FILES. . . . . . . . . .  G486
      251   COLUMN-NAMES-ROUTINE . . . . .  E221
      232   DE-LETE
      255   END-ROUTINE. . . . . . . . . .  P224
      259   END-ROUTINE-1
      268   END-ROUTINE-12
      276   END-ROUTINE-13 . . . . . . . .  E224
      257   END-RTN-EXIT
      482   END-3LEVEL-SUBSCRPT-TEST . . .  G477 G480
      231   FAIL . . . . . . . . . . . . .  P375 P389 P404 P418 P432 P447 P462 P476
      309   FAIL-ROUTINE . . . . . . . . .  P240
      323   FAIL-ROUTINE-EX. . . . . . . .  E240 G317
      318   FAIL-ROUTINE-WRITE . . . . . .  G311 G312
      246   HEAD-ROUTINE . . . . . . . . .  P221
      229   INSPT
      336   NC136-001
      217   OPEN-FILES
      230   PASS . . . . . . . . . . . . .  P378 P392 P407 P421 P435 P450 P465 P479
      234   PRINT-DETAIL . . . . . . . . .  P380 P394 P409 P423 P437 P452 P467 P483
      335   SECT-NC136A-001
      227   TERMINATE-CALL
      225   TERMINATE-CCVS
      379   TEST-1-WRITE . . . . . . . . .  G376
      382   TEST-1-2
      393   TEST-1-2-WRITE . . . . . . . .  G390
      396   TEST-2
      408   TEST-2-WRITE . . . . . . . . .  G405
      411   TEST-2-2
      422   TEST-2-2-WRITE . . . . . . . .  G419
      425   TEST-2-3
      436   TEST-2-3-WRITE . . . . . . . .  G433
      439   TEST-3
      451   TEST-3-WRITE . . . . . . . . .  G448
      454   TEST-3-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    15
0 Defined   Cross-reference of procedures   References

0     466   TEST-3-2-WRITE . . . . . . . .  G463
      469   TEST-3-3
      288   WRITE-LINE . . . . . . . . . .  P238 P239 P247 P248 P249 P250 P252 P253 P254 P256 P258 P267 P275 P281 P286 P287
                                            P315 P319 P321 P330
      304   WRT-LN . . . . . . . . . . . .  P294 P295 P296 P297 P298 P299 P300 P303 P308
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    16
0 Defined   Cross-reference of programs     References

        3   NC136A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC136A    Date 06/04/2022  Time 11:58:06   Page    17
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    338  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-LEVEL-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC136A:
 *    Source records = 486
 *    Data Division statements = 86
 *    Procedure Division statements = 236
 *    Generated COBOL statements = 0
 *    Program complexity factor = 247
0End of compilation 1,  program NC136A,  highest severity 0.
0Return code 0
