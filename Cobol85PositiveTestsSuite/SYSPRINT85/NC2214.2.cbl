1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:26   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:26   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2214.2
   000002         000200 PROGRAM-ID.                                                      NC2214.2
   000003         000300     NC221A.                                                      NC2214.2
   000004         000500*                                                              *  NC2214.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2214.2
   000006         000700*                                                              *  NC2214.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2214.2
   000008         000900*                                                              *  NC2214.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2214.2
   000010         001100*                                                              *  NC2214.2
   000011         001300*                                                              *  NC2214.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2214.2
   000013         001500*                                                              *  NC2214.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2214.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2214.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2214.2
   000017         001900*                                                              *  NC2214.2
   000018         002100*                                                              *  NC2214.2
   000019         002200*    PROGRAM NC221A TEST THE USE OF INDEXED IDENTIFIERS WITH   *  NC2214.2
   000020         002300*    FORMATS 1, 2 AND 3 OF THE "INSPECT" STATEMENT.            *  NC2214.2
   000021         002400*                                                              *  NC2214.2
   000022         002600 ENVIRONMENT DIVISION.                                            NC2214.2
   000023         002700 CONFIGURATION SECTION.                                           NC2214.2
   000024         002800 SOURCE-COMPUTER.                                                 NC2214.2
   000025         002900     XXXXX082.                                                    NC2214.2
   000026         003000 OBJECT-COMPUTER.                                                 NC2214.2
   000027         003100     XXXXX083.                                                    NC2214.2
   000028         003200 INPUT-OUTPUT SECTION.                                            NC2214.2
   000029         003300 FILE-CONTROL.                                                    NC2214.2
   000030         003400     SELECT PRINT-FILE ASSIGN TO                                  NC2214.2 34
   000031         003500     XXXXX055.                                                    NC2214.2
   000032         003600 DATA DIVISION.                                                   NC2214.2
   000033         003700 FILE SECTION.                                                    NC2214.2
   000034         003800 FD  PRINT-FILE.                                                  NC2214.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003900 01  PRINT-REC PICTURE X(120).                                    NC2214.2
   000036         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC2214.2
   000037         004100 WORKING-STORAGE SECTION.                                         NC2214.2
   000038         004200                                                                  NC2214.2
   000039         004300 01  WS-RIGHT-1-83.                                               NC2214.2
   000040         004400   03  WS-RIGHT-1-20                PIC X(20).                    NC2214.2
   000041         004500   03  WS-RIGHT-21-40               PIC X(20).                    NC2214.2
   000042         004600   03  WS-RIGHT-41-60               PIC X(20).                    NC2214.2
   000043         004700   03  WS-RIGHT-61-80               PIC X(20).                    NC2214.2
   000044         004800   03  WS-RIGHT-81-83               PIC X(3).                     NC2214.2
   000045         004900 01  WS-WRONG-1-83.                                               NC2214.2
   000046         005000   03  WS-WRONG-1-20                PIC X(20).                    NC2214.2
   000047         005100   03  WS-WRONG-21-40               PIC X(20).                    NC2214.2
   000048         005200   03  WS-WRONG-41-60               PIC X(20).                    NC2214.2
   000049         005300   03  WS-WRONG-61-80               PIC X(20).                    NC2214.2
   000050         005400   03  WS-WRONG-81-83               PIC X(3).                     NC2214.2
   000051         005500                                                                  NC2214.2
   000052         005600 01  TABLE1.                                                      NC2214.2
   000053         005700     02  TABLE1-REC              PICTURE X(83)                    NC2214.2
   000054         005800                                 OCCURS 4 TIMES                   NC2214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                                 INDEXED BY INDEX1.               NC2214.2
   000056         006000 01  TABLE2.                                                      NC2214.2
   000057         006100     02  WRK-DU-999              PICTURE 999                      NC2214.2
   000058         006200                                 OCCURS 4 TIMES                   NC2214.2
   000059         006300                                 INDEXED BY INDEX2.               NC2214.2
   000060         006400 01  TABLE3.                                                      NC2214.2
   000061         006500     02  TABLE3-SYMBOL           PICTURE X                        NC2214.2
   000062         006600                                 OCCURS 3 TIMES                   NC2214.2
   000063         006700                                 INDEXED BY INDEX3.               NC2214.2
   000064         006800 01  TABLE4.                                                      NC2214.2
   000065         006900     02  TABLE4-LETTER           PICTURE XX                       NC2214.2
   000066         007000                                 OCCURS 5 TIMES                   NC2214.2
   000067         007100                                 INDEXED BY INDEX4.               NC2214.2
   000068         007200 01  WC-XN-83  PIC X(83) VALUE                                    NC2214.2
   000069         007300     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000070         007400-    "IDS CAN NOT BE ALL BAD.".                                   NC2214.2
   000071         007500 01  ANS-XN-83-1 PIC X(83) VALUE                                  NC2214.2
   000072         007600     "OH YES AH YES W.C. FROTOES HERE, ANYONE WHO HATES DOGS AND KNC2214.2
   000073         007700-    "IDS CAN NOT BE ALL BAD.".                                   NC2214.2
   000074         007800 01  ANS-XN-83-2 PIC X(83) VALUE                                  NC2214.2
   000075         007900     "AH YES,AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000076         008000-    "IDS CAN NOT BE ALL BAD.".                                   NC2214.2
   000077         008100 01  ANS-XN-83-3 PIC X(83) VALUE                                  NC2214.2
   000078         008200     "OH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000079         008300-    "IDS CAN NOT BE ALL BAD.".                                   NC2214.2
   000080         008400 01  ANS-XN-83-4 PIC X(83) VALUE                                  NC2214.2
   000081         008500     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000082         008600-    "IDS CAN NOT BE ALL-BAD.".                                   NC2214.2
   000083         008700 01  ANS-XN-83-5 PIC X(83) VALUE                                  NC2214.2
   000084         008800     "EH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000085         008900-    "IDS CAN NOT BE ALL BAD.".                                   NC2214.2
   000086         009000 01  ANS-XN-83-6 PIC X(83) VALUE                                  NC2214.2
   000087         009100     "AH YES OH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000088         009200-    "IDS CAN NOT BE ALL BAD.".                                   NC2214.2
   000089         009300*01  TEST-RESULTS.                                                NC2214.2
   000090         009400*    02 FILLER                   PIC X      VALUE SPACE.          NC2214.2
   000091         009500*    02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2214.2
   000092         009600*    02 FILLER                   PIC X      VALUE SPACE.          NC2214.2
   000093         009700*    02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2214.2
   000094         009800*    02 FILLER                   PIC X      VALUE SPACE.          NC2214.2
   000095         009900*    02  PAR-NAME.                                                NC2214.2
   000096         010000*      03 FILLER                 PIC X(19)  VALUE SPACE.          NC2214.2
   000097         010100*      03  PARDOT-X              PIC X      VALUE SPACE.          NC2214.2
   000098         010200*      03 DOTVALUE               PIC 99     VALUE ZERO.           NC2214.2
   000099         010300*    02 FILLER                   PIC X(8)   VALUE SPACE.          NC2214.2
   000100         010400*    02 RE-MARK                  PIC X(61).                       NC2214.2
   000101         010500 01  TEST-RESULTS.                                                NC2214.2
   000102         010600     02 FILLER                   PIC X      VALUE SPACE.          NC2214.2 IMP
   000103         010700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2214.2 IMP
   000104         010800     02 FILLER                   PIC X      VALUE SPACE.          NC2214.2 IMP
   000105         010900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2214.2 IMP
   000106         011000     02 FILLER                   PIC X      VALUE SPACE.          NC2214.2 IMP
   000107         011100     02  PAR-NAME.                                                NC2214.2
   000108         011200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2214.2 IMP
   000109         011300       03  PARDOT-X              PIC X      VALUE SPACE.          NC2214.2 IMP
   000110         011400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2214.2 IMP
   000111         011500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2214.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 RE-MARK                  PIC X(61).                       NC2214.2
   000113         011700 01  TEST-COMPUTED.                                               NC2214.2
   000114         011800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2214.2 IMP
   000115         011900     02 FILLER                   PIC X(17)  VALUE                 NC2214.2
   000116         012000            "       COMPUTED=".                                   NC2214.2
   000117         012100     02 COMPUTED-X.                                               NC2214.2
   000118         012200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2214.2 IMP
   000119         012300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2214.2 118
   000120         012400                                 PIC -9(9).9(9).                  NC2214.2
   000121         012500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2214.2 118
   000122         012600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2214.2 118
   000123         012700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2214.2 118
   000124         012800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2214.2 118
   000125         012900         04 COMPUTED-18V0                    PIC -9(18).          NC2214.2
   000126         013000         04 FILLER                           PIC X.               NC2214.2
   000127         013100     03 FILLER PIC X(50) VALUE SPACE.                             NC2214.2 IMP
   000128         013200 01  TEST-CORRECT.                                                NC2214.2
   000129         013300     02 FILLER PIC X(30) VALUE SPACE.                             NC2214.2 IMP
   000130         013400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2214.2
   000131         013500     02 CORRECT-X.                                                NC2214.2
   000132         013600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2214.2 IMP
   000133         013700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2214.2 132
   000134         013800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2214.2 132
   000135         013900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2214.2 132
   000136         014000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2214.2 132
   000137         014100     03      CR-18V0 REDEFINES CORRECT-A.                         NC2214.2 132
   000138         014200         04 CORRECT-18V0                     PIC -9(18).          NC2214.2
   000139         014300         04 FILLER                           PIC X.               NC2214.2
   000140         014400     03 FILLER PIC X(2) VALUE SPACE.                              NC2214.2 IMP
   000141         014500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2214.2 IMP
   000142         014600 01  CCVS-C-1.                                                    NC2214.2
   000143         014700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2214.2
   000144         014800-    "SS  PARAGRAPH-NAME                                          NC2214.2
   000145         014900-    "       REMARKS".                                            NC2214.2
   000146         015000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2214.2 IMP
   000147         015100 01  CCVS-C-2.                                                    NC2214.2
   000148         015200     02 FILLER                     PIC X        VALUE SPACE.      NC2214.2 IMP
   000149         015300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2214.2
   000150         015400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2214.2 IMP
   000151         015500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2214.2
   000152         015600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2214.2 IMP
   000153         015700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2214.2 IMP
   000154         015800 01  REC-CT                        PIC 99       VALUE ZERO.       NC2214.2 IMP
   000155         015900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2214.2 IMP
   000156         016000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2214.2 IMP
   000157         016100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2214.2 IMP
   000158         016200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2214.2 IMP
   000159         016300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2214.2 IMP
   000160         016400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2214.2 IMP
   000161         016500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2214.2 IMP
   000162         016600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2214.2 IMP
   000163         016700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2214.2 IMP
   000164         016800 01  CCVS-H-1.                                                    NC2214.2
   000165         016900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2214.2 IMP
   000166         017000     02  FILLER                    PIC X(42)    VALUE             NC2214.2
   000167         017100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2214.2
   000168         017200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2214.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300 01  CCVS-H-2A.                                                   NC2214.2
   000170         017400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2214.2 IMP
   000171         017500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2214.2
   000172         017600   02  FILLER                        PIC XXXX   VALUE             NC2214.2
   000173         017700     "4.2 ".                                                      NC2214.2
   000174         017800   02  FILLER                        PIC X(28)  VALUE             NC2214.2
   000175         017900            " COPY - NOT FOR DISTRIBUTION".                       NC2214.2
   000176         018000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2214.2 IMP
   000177         018100                                                                  NC2214.2
   000178         018200 01  CCVS-H-2B.                                                   NC2214.2
   000179         018300   02  FILLER                        PIC X(15)  VALUE             NC2214.2
   000180         018400            "TEST RESULT OF ".                                    NC2214.2
   000181         018500   02  TEST-ID                       PIC X(9).                    NC2214.2
   000182         018600   02  FILLER                        PIC X(4)   VALUE             NC2214.2
   000183         018700            " IN ".                                               NC2214.2
   000184         018800   02  FILLER                        PIC X(12)  VALUE             NC2214.2
   000185         018900     " HIGH       ".                                              NC2214.2
   000186         019000   02  FILLER                        PIC X(22)  VALUE             NC2214.2
   000187         019100            " LEVEL VALIDATION FOR ".                             NC2214.2
   000188         019200   02  FILLER                        PIC X(58)  VALUE             NC2214.2
   000189         019300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2214.2
   000190         019400 01  CCVS-H-3.                                                    NC2214.2
   000191         019500     02  FILLER                      PIC X(34)  VALUE             NC2214.2
   000192         019600            " FOR OFFICIAL USE ONLY    ".                         NC2214.2
   000193         019700     02  FILLER                      PIC X(58)  VALUE             NC2214.2
   000194         019800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2214.2
   000195         019900     02  FILLER                      PIC X(28)  VALUE             NC2214.2
   000196         020000            "  COPYRIGHT   1985 ".                                NC2214.2
   000197         020100 01  CCVS-E-1.                                                    NC2214.2
   000198         020200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2214.2 IMP
   000199         020300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2214.2
   000200         020400     02 ID-AGAIN                     PIC X(9).                    NC2214.2
   000201         020500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2214.2 IMP
   000202         020600 01  CCVS-E-2.                                                    NC2214.2
   000203         020700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2214.2 IMP
   000204         020800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2214.2 IMP
   000205         020900     02 CCVS-E-2-2.                                               NC2214.2
   000206         021000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2214.2 IMP
   000207         021100         03 FILLER                   PIC X      VALUE SPACE.      NC2214.2 IMP
   000208         021200         03 ENDER-DESC               PIC X(44)  VALUE             NC2214.2
   000209         021300            "ERRORS ENCOUNTERED".                                 NC2214.2
   000210         021400 01  CCVS-E-3.                                                    NC2214.2
   000211         021500     02  FILLER                      PIC X(22)  VALUE             NC2214.2
   000212         021600            " FOR OFFICIAL USE ONLY".                             NC2214.2
   000213         021700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2214.2 IMP
   000214         021800     02  FILLER                      PIC X(58)  VALUE             NC2214.2
   000215         021900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2214.2
   000216         022000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2214.2 IMP
   000217         022100     02 FILLER                       PIC X(15)  VALUE             NC2214.2
   000218         022200             " COPYRIGHT 1985".                                   NC2214.2
   000219         022300 01  CCVS-E-4.                                                    NC2214.2
   000220         022400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2214.2 IMP
   000221         022500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2214.2
   000222         022600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2214.2 IMP
   000223         022700     02 FILLER                       PIC X(40)  VALUE             NC2214.2
   000224         022800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2214.2
   000225         022900 01  XXINFO.                                                      NC2214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 FILLER                       PIC X(19)  VALUE             NC2214.2
   000227         023100            "*** INFORMATION ***".                                NC2214.2
   000228         023200     02 INFO-TEXT.                                                NC2214.2
   000229         023300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2214.2 IMP
   000230         023400       04 XXCOMPUTED                 PIC X(20).                   NC2214.2
   000231         023500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2214.2 IMP
   000232         023600       04 XXCORRECT                  PIC X(20).                   NC2214.2
   000233         023700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2214.2
   000234         023800 01  HYPHEN-LINE.                                                 NC2214.2
   000235         023900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2214.2 IMP
   000236         024000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2214.2
   000237         024100-    "*****************************************".                 NC2214.2
   000238         024200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2214.2
   000239         024300-    "******************************".                            NC2214.2
   000240         024400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2214.2
   000241         024500     "NC221A".                                                    NC2214.2
   000242         024600 PROCEDURE DIVISION.                                              NC2214.2
   000243         024700 CCVS1 SECTION.                                                   NC2214.2
   000244         024800 OPEN-FILES.                                                      NC2214.2
   000245         024900     OPEN     OUTPUT PRINT-FILE.                                  NC2214.2 34
   000246         025000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2214.2 240 181 240 200
   000247         025100     MOVE    SPACE TO TEST-RESULTS.                               NC2214.2 IMP 101
   000248         025200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2214.2 273 278
   000249         025300     GO TO CCVS1-EXIT.                                            NC2214.2 355
   000250         025400 CLOSE-FILES.                                                     NC2214.2
   000251         025500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2214.2 282 303 34
   000252         025600 TERMINATE-CCVS.                                                  NC2214.2
   000253         025700     EXIT PROGRAM.                                                NC2214.2
   000254         025800 TERMINATE-CALL.                                                  NC2214.2
   000255         025900     STOP     RUN.                                                NC2214.2
   000256         026000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2214.2 105 157
   000257         026100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2214.2 105 158
   000258         026200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2214.2 105 156
   000259         026300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2214.2 105 155
   000260         026400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2214.2 112
   000261         026500 PRINT-DETAIL.                                                    NC2214.2
   000262         026600     IF REC-CT NOT EQUAL TO ZERO                                  NC2214.2 154 IMP
   000263      1  026700             MOVE "." TO PARDOT-X                                 NC2214.2 109
   000264      1  026800             MOVE REC-CT TO DOTVALUE.                             NC2214.2 154 110
   000265         026900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2214.2 101 35 315
   000266         027000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2214.2 105 315
   000267      1  027100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2214.2 332 345
   000268      1  027200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2214.2 346 354
   000269         027300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2214.2 IMP 105 IMP 117
   000270         027400     MOVE SPACE TO CORRECT-X.                                     NC2214.2 IMP 131
   000271         027500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2214.2 154 IMP IMP 107
   000272         027600     MOVE     SPACE TO RE-MARK.                                   NC2214.2 IMP 112
   000273         027700 HEAD-ROUTINE.                                                    NC2214.2
   000274         027800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2214.2 164 36 315
   000275         027900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2214.2 169 36 315
   000276         028000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2214.2 178 36 315
   000277         028100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2214.2 190 36 315
   000278         028200 COLUMN-NAMES-ROUTINE.                                            NC2214.2
   000279         028300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2214.2 142 36 315
   000280         028400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2214.2 147 36 315
   000281         028500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2214.2 234 36 315
   000282         028600 END-ROUTINE.                                                     NC2214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2214.2 234 36 315
   000284         028800 END-RTN-EXIT.                                                    NC2214.2
   000285         028900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2214.2 197 36 315
   000286         029000 END-ROUTINE-1.                                                   NC2214.2
   000287         029100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2214.2 156 160 157
   000288         029200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2214.2 160 155 160
   000289         029300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2214.2 158 160
   000290         029400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2214.2
   000291         029500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2214.2 158 220
   000292         029600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2214.2 160 222
   000293         029700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2214.2 219 205
   000294         029800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2214.2 202 36 315
   000295         029900  END-ROUTINE-12.                                                 NC2214.2
   000296         030000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2214.2 208
   000297         030100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2214.2 156 IMP
   000298      1  030200         MOVE "NO " TO ERROR-TOTAL                                NC2214.2 206
   000299         030300         ELSE                                                     NC2214.2
   000300      1  030400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2214.2 156 206
   000301         030500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2214.2 202 36
   000302         030600     PERFORM WRITE-LINE.                                          NC2214.2 315
   000303         030700 END-ROUTINE-13.                                                  NC2214.2
   000304         030800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2214.2 155 IMP
   000305      1  030900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2214.2 206
   000306      1  031000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2214.2 155 206
   000307         031100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2214.2 208
   000308         031200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2214.2 202 36 315
   000309         031300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2214.2 157 IMP
   000310      1  031400          MOVE "NO " TO ERROR-TOTAL                               NC2214.2 206
   000311      1  031500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2214.2 157 206
   000312         031600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2214.2 208
   000313         031700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2214.2 202 36 315
   000314         031800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2214.2 210 36 315
   000315         031900 WRITE-LINE.                                                      NC2214.2
   000316         032000     ADD 1 TO RECORD-COUNT.                                       NC2214.2 162
   000317         032100     IF RECORD-COUNT GREATER 50                                   NC2214.2 162
   000318      1  032200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2214.2 36 161
   000319      1  032300         MOVE SPACE TO DUMMY-RECORD                               NC2214.2 IMP 36
   000320      1  032400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2214.2 36
   000321      1  032500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2214.2 142 36 327
   000322      1  032600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2214.2 147 36 327
   000323      1  032700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2214.2 234 36 327
   000324      1  032800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2214.2 161 36
   000325      1  032900         MOVE ZERO TO RECORD-COUNT.                               NC2214.2 IMP 162
   000326         033000     PERFORM WRT-LN.                                              NC2214.2 327
   000327         033100 WRT-LN.                                                          NC2214.2
   000328         033200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2214.2 36
   000329         033300     MOVE SPACE TO DUMMY-RECORD.                                  NC2214.2 IMP 36
   000330         033400 BLANK-LINE-PRINT.                                                NC2214.2
   000331         033500     PERFORM WRT-LN.                                              NC2214.2 327
   000332         033600 FAIL-ROUTINE.                                                    NC2214.2
   000333         033700     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2214.2 117 IMP 340
   000334         033800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2214.2 131 IMP 340
   000335         033900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2214.2 163 233
   000336         034000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2214.2 228
   000337         034100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2214.2 225 36 315
   000338         034200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2214.2 IMP 233
   000339         034300     GO TO  FAIL-ROUTINE-EX.                                      NC2214.2 345
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 FAIL-ROUTINE-WRITE.                                              NC2214.2
   000341         034500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2214.2 113 35 315
   000342         034600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2214.2 163 141
   000343         034700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2214.2 128 35 315
   000344         034800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2214.2 IMP 141
   000345         034900 FAIL-ROUTINE-EX. EXIT.                                           NC2214.2
   000346         035000 BAIL-OUT.                                                        NC2214.2
   000347         035100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2214.2 118 IMP 349
   000348         035200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2214.2 132 IMP 354
   000349         035300 BAIL-OUT-WRITE.                                                  NC2214.2
   000350         035400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2214.2 132 232 118 230
   000351         035500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2214.2 163 233
   000352         035600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2214.2 225 36 315
   000353         035700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2214.2 IMP 233
   000354         035800 BAIL-OUT-EX. EXIT.                                               NC2214.2
   000355         035900 CCVS1-EXIT.                                                      NC2214.2
   000356         036000     EXIT.                                                        NC2214.2
   000357         036100 INIT-TABLE1.                                                     NC2214.2
   000358         036200     MOVE                                                         NC2214.2
   000359         036300     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000360         036400-    "IDS CAN NOT BE ALL BAD."                                    NC2214.2
   000361         036500         TO WC-XN-83.                                             NC2214.2 68
   000362         036600     MOVE WC-XN-83 TO TABLE1-REC (1).                             NC2214.2 68 53
   000363         036700     MOVE WC-XN-83 TO TABLE1-REC (2).                             NC2214.2 68 53
   000364         036800     MOVE WC-XN-83 TO TABLE1-REC (3).                             NC2214.2 68 53
   000365         036900     MOVE WC-XN-83 TO TABLE1-REC (4).                             NC2214.2 68 53
   000366         037000 INIT-TABLE3.                                                     NC2214.2
   000367         037100     MOVE " " TO TABLE3-SYMBOL (1).                               NC2214.2 61
   000368         037200     MOVE "," TO TABLE3-SYMBOL (2).                               NC2214.2 61
   000369         037300     MOVE "-" TO TABLE3-SYMBOL (3).                               NC2214.2 61
   000370         037400 INIT-TABLE4.                                                     NC2214.2
   000371         037500     MOVE "AH" TO TABLE4-LETTER (1).                              NC2214.2 65
   000372         037600     MOVE "OH" TO TABLE4-LETTER (2).                              NC2214.2 65
   000373         037700     MOVE "HE" TO TABLE4-LETTER (3).                              NC2214.2 65
   000374         037800     MOVE "LL" TO TABLE4-LETTER (4).                              NC2214.2 65
   000375         037900     MOVE "H " TO TABLE4-LETTER (5).                              NC2214.2 65
   000376         038000*                                                                 NC2214.2
   000377         038100 INS-INIT-F1-1.                                                   NC2214.2
   000378         038200     MOVE "INS-TEST-F1-1"     TO PAR-NAME.                        NC2214.2 107
   000379         038300     MOVE "IV-21 4.3.8.2"     TO ANSI-REFERENCE.                  NC2214.2 163
   000380         038400     MOVE "TALLY FOR LEADING" TO FEATURE.                         NC2214.2 103
   000381         038500     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000382         038600     SET INDEX1 TO 1.                                             NC2214.2 55
   000383         038700     SET INDEX2 TO 1.                                             NC2214.2 59
   000384         038800 INS-TEST-F1-1.                                                   NC2214.2
   000385         038900     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC2214.2 53 55 57 59
   000386         039000        FOR LEADING "AH"                                          NC2214.2
   000387         039100     IF WRK-DU-999 (INDEX2) EQUAL TO 1                            NC2214.2 57 59
   000388      1  039200        PERFORM PASS                                              NC2214.2 257
   000389      1  039300        GO TO INS-WRITE-F1-1.                                     NC2214.2 398
   000390         039400     GO TO INS-FAIL-F1-1.                                         NC2214.2 394
   000391         039500 INS-DELETE-F1-1.                                                 NC2214.2
   000392         039600     PERFORM DE-LETE.                                             NC2214.2 259
   000393         039700     GO TO INS-WRITE-F1-1.                                        NC2214.2 398
   000394         039800 INS-FAIL-F1-1.                                                   NC2214.2
   000395         039900     PERFORM FAIL.                                                NC2214.2 258
   000396         040000     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N.                      NC2214.2 57 59 119
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE 1 TO CORRECT-N.                                         NC2214.2 133
   000398         040200 INS-WRITE-F1-1.                                                  NC2214.2
   000399         040300     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000400         040400*                                                                 NC2214.2
   000401         040500 INS-INIT-F1-2.                                                   NC2214.2
   000402         040600     MOVE "INS-TEST-F1-2"        TO PAR-NAME.                     NC2214.2 107
   000403         040700     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
   000404         040800     MOVE "TALLY FOR CHAR AFTER" TO FEATURE.                      NC2214.2 103
   000405         040900     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000406         041000     SET INDEX1 TO 2.                                             NC2214.2 55
   000407         041100     SET INDEX2 TO 2.                                             NC2214.2 59
   000408         041200 INS-TEST-F1-2.                                                   NC2214.2
   000409         041300     INSPECT TABLE1-REC (INDEX1 + 1)                              NC2214.2 53 55
   000410         041400        TALLYING WRK-DU-999 (INDEX2 + 1)                          NC2214.2 57 59
   000411         041500        FOR CHARACTERS AFTER " W".                                NC2214.2
   000412         041600     IF WRK-DU-999 (INDEX2 + 1) EQUAL TO 68                       NC2214.2 57 59
   000413      1  041700        PERFORM PASS                                              NC2214.2 257
   000414      1  041800        GO TO INS-WRITE-F1-2.                                     NC2214.2 423
   000415         041900     GO TO INS-FAIL-F1-2.                                         NC2214.2 419
   000416         042000 INS-DELETE-F1-2.                                                 NC2214.2
   000417         042100     PERFORM DE-LETE.                                             NC2214.2 259
   000418         042200     GO TO INS-WRITE-F1-2.                                        NC2214.2 423
   000419         042300 INS-FAIL-F1-2.                                                   NC2214.2
   000420         042400     PERFORM FAIL.                                                NC2214.2 258
   000421         042500     MOVE WRK-DU-999 (INDEX2 + 1) TO COMPUTED-N.                  NC2214.2 57 59 119
   000422         042600     MOVE 68 TO CORRECT-N.                                        NC2214.2 133
   000423         042700 INS-WRITE-F1-2.                                                  NC2214.2
   000424         042800     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000425         042900*                                                                 NC2214.2
   000426         043000 INS-INIT-F1-3.                                                   NC2214.2
   000427         043100     MOVE "INS-TEST-F1-3" TO PAR-NAME.                            NC2214.2 107
   000428         043200     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
   000429         043300     MOVE "TALLY FOR ALL BEFORE" TO FEATURE.                      NC2214.2 103
   000430         043400     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000431         043500     SET INDEX1 TO 3.                                             NC2214.2 55
   000432         043600     SET INDEX2 TO 3.                                             NC2214.2 59
   000433         043700 INS-TEST-F1-3.                                                   NC2214.2
   000434         043800     INSPECT TABLE1-REC (INDEX1 - 1)                              NC2214.2 53 55
   000435         043900        TALLYING WRK-DU-999 (INDEX2 - 2)                          NC2214.2 57 59
   000436         044000        FOR ALL " " BEFORE INITIAL "W.C.".                        NC2214.2
   000437         044100     IF WRK-DU-999 (INDEX2 - 2) EQUAL TO 4                        NC2214.2 57 59
   000438      1  044200        PERFORM PASS                                              NC2214.2 257
   000439      1  044300        GO TO INS-WRITE-F1-3.                                     NC2214.2 448
   000440         044400     GO TO INS-FAIL-F1-3.                                         NC2214.2 444
   000441         044500 INS-DELETE-F1-3.                                                 NC2214.2
   000442         044600     PERFORM DE-LETE.                                             NC2214.2 259
   000443         044700     GO TO INS-WRITE-F1-3.                                        NC2214.2 448
   000444         044800 INS-FAIL-F1-3.                                                   NC2214.2
   000445         044900     PERFORM FAIL.                                                NC2214.2 258
   000446         045000     MOVE WRK-DU-999 (INDEX2 - 2) TO COMPUTED-N.                  NC2214.2 57 59 119
   000447         045100     MOVE 4 TO CORRECT-N.                                         NC2214.2 133
   000448         045200 INS-WRITE-F1-3.                                                  NC2214.2
   000449         045300     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000450         045400*                                                                 NC2214.2
   000451         045500 INS-INIT-F2-4.                                                   NC2214.2
   000452         045600     MOVE "INS-TEST-F2-4" TO PAR-NAME.                            NC2214.2 107
   000453         045700     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     MOVE "REPLACE BEFORE FIRST" TO FEATURE.                      NC2214.2 103
   000455         045900     SET INDEX1 TO 4.                                             NC2214.2 55
   000456         046000     SET INDEX4 TO 1.                                             NC2214.2 67
   000457         046100 INS-TEST-F2-4.                                                   NC2214.2
   000458         046200     INSPECT TABLE1-REC (INDEX1) REPLACING LEADING                NC2214.2 53 55
   000459         046300        TABLE4-LETTER (INDEX4) BY TABLE4-LETTER (INDEX4 + 1)      NC2214.2 65 67 65 67
   000460         046400        BEFORE INITIAL " AH YES" FIRST "I" BY "O"                 NC2214.2
   000461         046500        AFTER INITIAL "." ALL ". " BY ", " AFTER INITIAL          NC2214.2
   000462         046600        TABLE4-LETTER (INDEX4 + 2).                               NC2214.2 65 67
   000463         046700     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-1                  NC2214.2 53 55 71
   000464      1  046800        PERFORM PASS                                              NC2214.2 257
   000465      1  046900        GO TO INS-WRITE-F2-4.                                     NC2214.2 489
   000466         047000     GO TO INS-FAIL-F2-4.                                         NC2214.2 470
   000467         047100 INS-DELETE-F2-4.                                                 NC2214.2
   000468         047200     PERFORM DE-LETE.                                             NC2214.2 259
   000469         047300     GO TO INS-WRITE-F2-4.                                        NC2214.2 489
   000470         047400 INS-FAIL-F2-4.                                                   NC2214.2
   000471         047500     MOVE    TABLE1-REC (INDEX1) TO WS-WRONG-1-83.                NC2214.2 53 55 45
   000472         047600     MOVE    ANS-XN-83-1     TO WS-RIGHT-1-83.                    NC2214.2 71 39
   000473         047700     PERFORM FAIL.                                                NC2214.2 258
   000474         047800     MOVE    WS-RIGHT-1-20   TO CORRECT-A.                        NC2214.2 40 132
   000475         047900     MOVE    WS-WRONG-1-20   TO COMPUTED-A.                       NC2214.2 46 118
   000476         048000     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000477         048100     MOVE    WS-RIGHT-21-40  TO CORRECT-A.                        NC2214.2 41 132
   000478         048200     MOVE    WS-WRONG-21-40  TO COMPUTED-A.                       NC2214.2 47 118
   000479         048300     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000480         048400     MOVE    WS-RIGHT-41-60  TO CORRECT-A.                        NC2214.2 42 132
   000481         048500     MOVE    WS-WRONG-41-60  TO COMPUTED-A.                       NC2214.2 48 118
   000482         048600     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000483         048700     MOVE    WS-RIGHT-61-80  TO CORRECT-A.                        NC2214.2 43 132
   000484         048800     MOVE    WS-WRONG-61-80  TO COMPUTED-A.                       NC2214.2 49 118
   000485         048900     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000486         049000     MOVE    WS-RIGHT-81-83  TO CORRECT-A.                        NC2214.2 44 132
   000487         049100     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000488         049200     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000489         049300 INS-WRITE-F2-4.                                                  NC2214.2
   000490         049400     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000491         049500*                                                                 NC2214.2
   000492         049600 INS-INIT-F2-5.                                                   NC2214.2
   000493         049700     MOVE "INS-TEST-F2-5" TO PAR-NAME.                            NC2214.2 107
   000494         049800     MOVE "IV-21 4.3.8.2"      TO ANSI-REFERENCE.                 NC2214.2 163
   000495         049900     MOVE "REPLACE LEAD AFTER" TO FEATURE                         NC2214.2 103
   000496         050000     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000497         050100     MOVE                                                         NC2214.2
   000498         050200     "AH YES,AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000499         050300-    "IDS CAN NOT BE ALL BAD."                                    NC2214.2
   000500         050400         TO ANS-XN-83-2.                                          NC2214.2 74
   000501         050500     SET INDEX1 TO 1.                                             NC2214.2 55
   000502         050600     SET INDEX3 TO 1.                                             NC2214.2 63
   000503         050700 INS-TEST-F2-5.                                                   NC2214.2
   000504         050800     INSPECT TABLE1-REC (INDEX1) REPLACING LEADING                NC2214.2 53 55
   000505         050900        TABLE3-SYMBOL (INDEX3) BY TABLE3-SYMBOL (INDEX3 + 1)      NC2214.2 61 63 61 63
   000506         051000        AFTER INITIAL "YES".                                      NC2214.2
   000507         051100     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-2                  NC2214.2 53 55 74
   000508      1  051200        PERFORM PASS                                              NC2214.2 257
   000509      1  051300        GO TO INS-WRITE-F2-5.                                     NC2214.2 533
   000510         051400     GO TO INS-FAIL-F2-5.                                         NC2214.2 514
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500 INS-DELETE-F2-5.                                                 NC2214.2
   000512         051600     PERFORM DE-LETE.                                             NC2214.2 259
   000513         051700     GO TO INS-WRITE-F2-5.                                        NC2214.2 533
   000514         051800 INS-FAIL-F2-5.                                                   NC2214.2
   000515         051900     MOVE    TABLE1-REC (INDEX1) TO WS-WRONG-1-83.                NC2214.2 53 55 45
   000516         052000     MOVE    ANS-XN-83-2     TO WS-RIGHT-1-83.                    NC2214.2 74 39
   000517         052100     PERFORM FAIL.                                                NC2214.2 258
   000518         052200     MOVE    WS-RIGHT-1-20   TO CORRECT-A.                        NC2214.2 40 132
   000519         052300     MOVE    WS-WRONG-1-20   TO COMPUTED-A.                       NC2214.2 46 118
   000520         052400     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000521         052500     MOVE    WS-RIGHT-21-40  TO CORRECT-A.                        NC2214.2 41 132
   000522         052600     MOVE    WS-WRONG-21-40  TO COMPUTED-A.                       NC2214.2 47 118
   000523         052700     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000524         052800     MOVE    WS-RIGHT-41-60  TO CORRECT-A.                        NC2214.2 42 132
   000525         052900     MOVE    WS-WRONG-41-60  TO COMPUTED-A.                       NC2214.2 48 118
   000526         053000     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000527         053100     MOVE    WS-RIGHT-61-80  TO CORRECT-A.                        NC2214.2 43 132
   000528         053200     MOVE    WS-WRONG-61-80  TO COMPUTED-A.                       NC2214.2 49 118
   000529         053300     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000530         053400     MOVE    WS-RIGHT-81-83  TO CORRECT-A.                        NC2214.2 44 132
   000531         053500     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000532         053600     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000533         053700 INS-WRITE-F2-5.                                                  NC2214.2
   000534         053800     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000535         053900*                                                                 NC2214.2
   000536         054000 INS-INIT-F2-6.                                                   NC2214.2
   000537         054100     MOVE "INS-TEST-F2-6" TO PAR-NAME.                            NC2214.2 107
   000538         054200     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
   000539         054300     MOVE "REPLACE FIRST BEFORE" TO FEATURE.                      NC2214.2 103
   000540         054400     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000541         054500     SET INDEX1 TO 3.                                             NC2214.2 55
   000542         054600     MOVE                                                         NC2214.2
   000543         054700     "OH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000544         054800-    "IDS CAN NOT BE ALL BAD."                                    NC2214.2
   000545         054900         TO ANS-XN-83-3.                                          NC2214.2 77
   000546         055000 INS-TEST-F2-6.                                                   NC2214.2
   000547         055100     INSPECT TABLE1-REC (INDEX1 - 1) REPLACING FIRST "A" BY "O"   NC2214.2 53 55
   000548         055200        BEFORE INITIAL "H YES".                                   NC2214.2
   000549         055300     IF TABLE1-REC (INDEX1 - 1) EQUAL TO ANS-XN-83-3              NC2214.2 53 55 77
   000550      1  055400        PERFORM PASS                                              NC2214.2 257
   000551      1  055500        GO TO INS-WRITE-F2-6.                                     NC2214.2 575
   000552         055600     GO TO INS-FAIL-F2-6.                                         NC2214.2 556
   000553         055700 INS-DELETE-F2-6.                                                 NC2214.2
   000554         055800     PERFORM DE-LETE.                                             NC2214.2 259
   000555         055900     GO TO INS-WRITE-F2-6.                                        NC2214.2 575
   000556         056000 INS-FAIL-F2-6.                                                   NC2214.2
   000557         056100     MOVE    TABLE1-REC (INDEX1 - 1) TO WS-WRONG-1-83.            NC2214.2 53 55 45
   000558         056200     MOVE    ANS-XN-83-3     TO WS-RIGHT-1-83.                    NC2214.2 77 39
   000559         056300     PERFORM FAIL.                                                NC2214.2 258
   000560         056400     MOVE    WS-RIGHT-1-20   TO CORRECT-A.                        NC2214.2 40 132
   000561         056500     MOVE    WS-WRONG-1-20   TO COMPUTED-A.                       NC2214.2 46 118
   000562         056600     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000563         056700     MOVE    WS-RIGHT-21-40  TO CORRECT-A.                        NC2214.2 41 132
   000564         056800     MOVE    WS-WRONG-21-40  TO COMPUTED-A.                       NC2214.2 47 118
   000565         056900     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000566         057000     MOVE    WS-RIGHT-41-60  TO CORRECT-A.                        NC2214.2 42 132
   000567         057100     MOVE    WS-WRONG-41-60  TO COMPUTED-A.                       NC2214.2 48 118
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000569         057300     MOVE    WS-RIGHT-61-80  TO CORRECT-A.                        NC2214.2 43 132
   000570         057400     MOVE    WS-WRONG-61-80  TO COMPUTED-A.                       NC2214.2 49 118
   000571         057500     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000572         057600     MOVE    WS-RIGHT-81-83  TO CORRECT-A.                        NC2214.2 44 132
   000573         057700     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000574         057800     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000575         057900 INS-WRITE-F2-6.                                                  NC2214.2
   000576         058000     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000577         058100*                                                                 NC2214.2
   000578         058200 INS-INIT-F2-7.                                                   NC2214.2
   000579         058300     MOVE "INS-TEST-F2-7"     TO PAR-NAME.                        NC2214.2 107
   000580         058400     MOVE "IV-21 4.3.8.2"     TO ANSI-REFERENCE.                  NC2214.2 163
   000581         058500     MOVE "REPLACE ALL AFTER" TO FEATURE.                         NC2214.2 103
   000582         058600     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000583         058700     PERFORM INIT-TABLE4.                                         NC2214.2 370
   000584         058800     MOVE                                                         NC2214.2
   000585         058900     "AH YES AH YES W.C. FRITOES HERE. ANYONE WHO HATES DOGS AND KNC2214.2
   000586         059000-    "IDS CAN NOT BE ALL-BAD."                                    NC2214.2
   000587         059100     TO ANS-XN-83-4.                                              NC2214.2 80
   000588         059200     SET INDEX1 TO 1.                                             NC2214.2 55
   000589         059300     SET INDEX4 TO 4.                                             NC2214.2 67
   000590         059400 INS-TEST-F2-7.                                                   NC2214.2
   000591         059500     INSPECT TABLE1-REC (INDEX1 + 1) REPLACING ALL SPACES BY "-"  NC2214.2 53 55 IMP
   000592         059600        AFTER TABLE4-LETTER (INDEX4).                             NC2214.2 65 67
   000593         059700     IF TABLE1-REC (INDEX1 + 1) EQUAL TO ANS-XN-83-4              NC2214.2 53 55 80
   000594      1  059800        PERFORM PASS                                              NC2214.2 257
   000595      1  059900        GO TO INS-WRITE-F2-7.                                     NC2214.2 619
   000596         060000     GO TO INS-FAIL-F2-7.                                         NC2214.2 600
   000597         060100 INS-DELETE-F2-7.                                                 NC2214.2
   000598         060200     PERFORM DE-LETE.                                             NC2214.2 259
   000599         060300     GO TO INS-WRITE-F2-7.                                        NC2214.2 619
   000600         060400 INS-FAIL-F2-7.                                                   NC2214.2
   000601         060500     MOVE    TABLE1-REC (INDEX1 + 1) TO WS-WRONG-1-83.            NC2214.2 53 55 45
   000602         060600     MOVE    ANS-XN-83-4     TO WS-RIGHT-1-83.                    NC2214.2 80 39
   000603         060700     PERFORM FAIL.                                                NC2214.2 258
   000604         060800     MOVE    WS-RIGHT-1-20   TO CORRECT-A.                        NC2214.2 40 132
   000605         060900     MOVE    WS-WRONG-1-20   TO COMPUTED-A.                       NC2214.2 46 118
   000606         061000     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000607         061100     MOVE    WS-RIGHT-21-40  TO CORRECT-A.                        NC2214.2 41 132
   000608         061200     MOVE    WS-WRONG-21-40  TO COMPUTED-A.                       NC2214.2 47 118
   000609         061300     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000610         061400     MOVE    WS-RIGHT-41-60  TO CORRECT-A.                        NC2214.2 42 132
   000611         061500     MOVE    WS-WRONG-41-60  TO COMPUTED-A.                       NC2214.2 48 118
   000612         061600     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000613         061700     MOVE    WS-RIGHT-61-80  TO CORRECT-A.                        NC2214.2 43 132
   000614         061800     MOVE    WS-WRONG-61-80  TO COMPUTED-A.                       NC2214.2 49 118
   000615         061900     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000616         062000     MOVE    WS-RIGHT-81-83  TO CORRECT-A.                        NC2214.2 44 132
   000617         062100     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000618         062200     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000619         062300 INS-WRITE-F2-7.                                                  NC2214.2
   000620         062400     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000621         062500*                                                                 NC2214.2
   000622         062600 INS-INIT-F3-8.                                                   NC2214.2
   000623         062700     MOVE "INS-TEST-F3-8"       TO PAR-NAME.                      NC2214.2 107
   000624         062800     MOVE "IV-21 4.3.8.2"       TO ANSI-REFERENCE.                NC2214.2 163
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     MOVE "TALLY REPLACE CHARS" TO FEATURE.                       NC2214.2 103
   000626         063000     MOVE 1 TO REC-CT.                                            NC2214.2 154
   000627         063100     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000628         063200     PERFORM INIT-TABLE4.                                         NC2214.2 370
   000629         063300     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000630         063400     SET INDEX1 TO 4.                                             NC2214.2 55
   000631         063500     SET INDEX2 TO 1.                                             NC2214.2 59
   000632         063600     SET INDEX4 TO 5.                                             NC2214.2 67
   000633         063700 INS-TEST-F3-8-0.                                                 NC2214.2
   000634         063800     INSPECT TABLE1-REC (INDEX1 - 2)                              NC2214.2 53 55
   000635         063900        TALLYING WRK-DU-999 (INDEX2 + 2) FOR CHARACTERS           NC2214.2 57 59
   000636         064000        AFTER "L" REPLACING ALL "A" BY "E"                        NC2214.2
   000637         064100        BEFORE INITIAL TABLE4-LETTER (INDEX4).                    NC2214.2 65 67
   000638         064200     GO TO INS-TEST-F3-8-1.                                       NC2214.2 643
   000639         064300 INS-DELETE-F3-8.                                                 NC2214.2
   000640         064400     PERFORM DE-LETE.                                             NC2214.2 259
   000641         064500     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000642         064600     GO TO INS-INIT-F3-9.                                         NC2214.2 689
   000643         064700 INS-TEST-F3-8-1.                                                 NC2214.2
   000644         064800     IF WRK-DU-999 (INDEX2 + 2) EQUAL TO 6                        NC2214.2 57 59
   000645      1  064900        PERFORM PASS                                              NC2214.2 257
   000646      1  065000        GO TO INS-WRITE-F3-8-1                                    NC2214.2 655
   000647      1  065100        ELSE GO TO INS-FAIL-F3-8-1.                               NC2214.2 651
   000648         065200 INS-DELETE-F3-8-1.                                               NC2214.2
   000649         065300     PERFORM DE-LETE.                                             NC2214.2 259
   000650         065400     GO TO INS-WRITE-F3-8-1.                                      NC2214.2 655
   000651         065500 INS-FAIL-F3-8-1.                                                 NC2214.2
   000652         065600     MOVE WRK-DU-999 (INDEX2 + 2) TO COMPUTED-N                   NC2214.2 57 59 119
   000653         065700     MOVE 6 TO CORRECT-N .                                        NC2214.2 133
   000654         065800     PERFORM FAIL.                                                NC2214.2 258
   000655         065900 INS-WRITE-F3-8-1.                                                NC2214.2
   000656         066000     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000657         066100*                                                                 NC2214.2
   000658         066200 INS-TEST-F3-8-2.                                                 NC2214.2
   000659         066300     ADD 1 TO REC-CT.                                             NC2214.2 154
   000660         066400     IF TABLE1-REC (INDEX1 - 2) EQUAL TO ANS-XN-83-5              NC2214.2 53 55 83
   000661      1  066500        PERFORM PASS                                              NC2214.2 257
   000662      1  066600        GO TO INS-WRITE-F3-8-2                                    NC2214.2 686
   000663         066700     ELSE                                                         NC2214.2
   000664      1  066800        GO TO INS-FAIL-F3-8-2.                                    NC2214.2 668
   000665         066900 INS-DELETE-F3-8-2.                                               NC2214.2
   000666         067000     PERFORM DE-LETE.                                             NC2214.2 259
   000667         067100     GO TO INS-WRITE-F3-8-2.                                      NC2214.2 686
   000668         067200 INS-FAIL-F3-8-2.                                                 NC2214.2
   000669         067300     MOVE    TABLE1-REC (INDEX1 - 2) TO WS-WRONG-1-83             NC2214.2 53 55 45
   000670         067400     MOVE    ANS-XN-83-5     TO WS-RIGHT-1-83                     NC2214.2 83 39
   000671         067500     PERFORM FAIL                                                 NC2214.2 258
   000672         067600     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2214.2 40 132
   000673         067700     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2214.2 46 118
   000674         067800     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000675         067900     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2214.2 41 132
   000676         068000     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2214.2 47 118
   000677         068100     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000678         068200     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2214.2 42 132
   000679         068300     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2214.2 48 118
   000680         068400     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000681         068500     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2214.2 43 132
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2214.2 49 118
   000683         068700     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000684         068800     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2214.2 44 132
   000685         068900     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000686         069000 INS-WRITE-F3-8-2.                                                NC2214.2
   000687         069100     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000688         069200*                                                                 NC2214.2
   000689         069300 INS-INIT-F3-9.                                                   NC2214.2
   000690         069400     MOVE "INS-TEST-F3-9"        TO PAR-NAME.                     NC2214.2 107
   000691         069500     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
   000692         069600     MOVE "TALLY BEFORE REPLACE" TO FEATURE.                      NC2214.2 103
   000693         069700     MOVE 1 TO REC-CT.                                            NC2214.2 154
   000694         069800     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000695         069900     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000696         070000     PERFORM INIT-TABLE4.                                         NC2214.2 370
   000697         070100     SET INDEX1 TO 4.                                             NC2214.2 55
   000698         070200     SET INDEX2 TO 2.                                             NC2214.2 59
   000699         070300     SET INDEX4 TO 1.                                             NC2214.2 67
   000700         070400 INS-TEST-F3-9-0.                                                 NC2214.2
   000701         070500     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC2214.2 53 55 57 59
   000702         070600        FOR ALL "A" BEFORE "L" REPLACING FIRST                    NC2214.2
   000703         070700        TABLE4-LETTER (INDEX4) BY TABLE4-LETTER (INDEX4 + 1)      NC2214.2 65 67 65 67
   000704         070800        AFTER INITIAL "H".                                        NC2214.2
   000705         070900     GO TO INS-TEST-F3-9-1.                                       NC2214.2 710
   000706         071000 INS-DELETE-F3-9.                                                 NC2214.2
   000707         071100     PERFORM DE-LETE.                                             NC2214.2 259
   000708         071200     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000709         071300     GO TO INS-INIT-F3-10.                                        NC2214.2 756
   000710         071400 INS-TEST-F3-9-1.                                                 NC2214.2
   000711         071500     IF WRK-DU-999 (INDEX2) EQUAL TO 7                            NC2214.2 57 59
   000712      1  071600        PERFORM PASS                                              NC2214.2 257
   000713      1  071700        GO TO INS-WRITE-F3-9-1                                    NC2214.2 722
   000714      1  071800        ELSE GO TO INS-FAIL-F3-9-1.                               NC2214.2 718
   000715         071900 INS-DELETE-F3-9-1.                                               NC2214.2
   000716         072000     PERFORM DE-LETE.                                             NC2214.2 259
   000717         072100     GO TO INS-WRITE-F3-9-1.                                      NC2214.2 722
   000718         072200 INS-FAIL-F3-9-1.                                                 NC2214.2
   000719         072300     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                       NC2214.2 57 59 119
   000720         072400     MOVE 7 TO CORRECT-N                                          NC2214.2 133
   000721         072500     PERFORM FAIL.                                                NC2214.2 258
   000722         072600 INS-WRITE-F3-9-1.                                                NC2214.2
   000723         072700     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000724         072800*                                                                 NC2214.2
   000725         072900 INS-TEST-F3-9-2.                                                 NC2214.2
   000726         073000     ADD 1 TO REC-CT.                                             NC2214.2 154
   000727         073100     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-6                  NC2214.2 53 55 86
   000728      1  073200        PERFORM PASS                                              NC2214.2 257
   000729      1  073300        GO TO INS-WRITE-F3-9-2                                    NC2214.2 753
   000730         073400     ELSE                                                         NC2214.2
   000731      1  073500        GO TO INS-FAIL-F3-9-2.                                    NC2214.2 735
   000732         073600 INS-DELETE-F3-9-2.                                               NC2214.2
   000733         073700     PERFORM DE-LETE.                                             NC2214.2 259
   000734         073800     GO TO INS-WRITE-F3-9-2.                                      NC2214.2 753
   000735         073900 INS-FAIL-F3-9-2.                                                 NC2214.2
   000736         074000     MOVE    TABLE1-REC (INDEX1) TO WS-WRONG-1-83                 NC2214.2 53 55 45
   000737         074100     MOVE    ANS-XN-83-6     TO WS-RIGHT-1-83                     NC2214.2 86 39
   000738         074200     PERFORM FAIL                                                 NC2214.2 258
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2214.2 40 132
   000740         074400     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2214.2 46 118
   000741         074500     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000742         074600     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2214.2 41 132
   000743         074700     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2214.2 47 118
   000744         074800     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000745         074900     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2214.2 42 132
   000746         075000     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2214.2 48 118
   000747         075100     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000748         075200     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2214.2 43 132
   000749         075300     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2214.2 49 118
   000750         075400     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000751         075500     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2214.2 44 132
   000752         075600     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000753         075700 INS-WRITE-F3-9-2.                                                NC2214.2
   000754         075800     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000755         075900*                                                                 NC2214.2
   000756         076000 INS-INIT-F3-10.                                                  NC2214.2
   000757         076100     MOVE "INS-TEST-F3-10"       TO PAR-NAME.                     NC2214.2 107
   000758         076200     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
   000759         076300     MOVE "TALLY LEAD REPL LEAD" TO FEATURE.                      NC2214.2 103
   000760         076400     MOVE 1 TO REC-CT.                                            NC2214.2 154
   000761         076500     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000762         076600     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000763         076700     PERFORM INIT-TABLE4.                                         NC2214.2 370
   000764         076800     SET INDEX1 TO 1.                                             NC2214.2 55
   000765         076900     SET INDEX2 TO 1.                                             NC2214.2 59
   000766         077000     SET INDEX4 TO 1.                                             NC2214.2 67
   000767         077100 INS-TEST-F3-10-0.                                                NC2214.2
   000768         077200     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC2214.2 53 55 57 59
   000769         077300        FOR LEADING TABLE4-LETTER (INDEX4) REPLACING              NC2214.2 65 67
   000770         077400        LEADING TABLE4-LETTER (INDEX4) BY "OH".                   NC2214.2 65 67
   000771         077500     GO TO INS-TEST-F3-10-1.                                      NC2214.2 776
   000772         077600 INS-DELETE-F3-10.                                                NC2214.2
   000773         077700     PERFORM DE-LETE.                                             NC2214.2 259
   000774         077800     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000775         077900     GO TO INS-INIT-F3-11.                                        NC2214.2 823
   000776         078000 INS-TEST-F3-10-1.                                                NC2214.2
   000777         078100     IF WRK-DU-999 (INDEX2) EQUAL TO 1                            NC2214.2 57 59
   000778      1  078200        PERFORM PASS                                              NC2214.2 257
   000779      1  078300        GO TO INS-WRITE-F3-10-1                                   NC2214.2 789
   000780         078400     ELSE                                                         NC2214.2
   000781      1  078500        GO TO INS-FAIL-F3-10-1.                                   NC2214.2 785
   000782         078600 INS-DELETE-F3-10-1.                                              NC2214.2
   000783         078700     PERFORM DE-LETE.                                             NC2214.2 259
   000784         078800     GO TO INS-WRITE-F3-10-1.                                     NC2214.2 789
   000785         078900 INS-FAIL-F3-10-1.                                                NC2214.2
   000786         079000     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                       NC2214.2 57 59 119
   000787         079100     MOVE 1 TO CORRECT-N                                          NC2214.2 133
   000788         079200     PERFORM FAIL.                                                NC2214.2 258
   000789         079300 INS-WRITE-F3-10-1.                                               NC2214.2
   000790         079400     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000791         079500*                                                                 NC2214.2
   000792         079600 INS-TEST-F3-10-2.                                                NC2214.2
   000793         079700     ADD 1 TO REC-CT.                                             NC2214.2 154
   000794         079800     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-3                  NC2214.2 53 55 77
   000795      1  079900        PERFORM PASS                                              NC2214.2 257
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796      1  080000        GO TO INS-WRITE-F3-10-2                                   NC2214.2 820
   000797         080100     ELSE                                                         NC2214.2
   000798      1  080200        GO TO INS-FAIL-F3-10-2.                                   NC2214.2 802
   000799         080300 INS-DELETE-F3-10-2.                                              NC2214.2
   000800         080400     PERFORM DE-LETE.                                             NC2214.2 259
   000801         080500     GO TO INS-WRITE-F3-10-2.                                     NC2214.2 820
   000802         080600 INS-FAIL-F3-10-2.                                                NC2214.2
   000803         080700     MOVE    TABLE1-REC (INDEX1) TO WS-WRONG-1-83                 NC2214.2 53 55 45
   000804         080800     MOVE    ANS-XN-83-3     TO WS-RIGHT-1-83                     NC2214.2 77 39
   000805         080900     PERFORM FAIL                                                 NC2214.2 258
   000806         081000     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2214.2 40 132
   000807         081100     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2214.2 46 118
   000808         081200     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000809         081300     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2214.2 41 132
   000810         081400     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2214.2 47 118
   000811         081500     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000812         081600     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2214.2 42 132
   000813         081700     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2214.2 48 118
   000814         081800     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000815         081900     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2214.2 43 132
   000816         082000     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2214.2 49 118
   000817         082100     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000818         082200     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2214.2 44 132
   000819         082300     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000820         082400 INS-WRITE-F3-10-2.                                               NC2214.2
   000821         082500     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000822         082600*                                                                 NC2214.2
   000823         082700 INS-INIT-F3-11.                                                  NC2214.2
   000824         082800     MOVE "INS-TEST-F3-11"       TO PAR-NAME.                     NC2214.2 107
   000825         082900     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
   000826         083000     MOVE "TALLY REPL FIRST AFT" TO FEATURE.                      NC2214.2 103
   000827         083100     MOVE 1 TO REC-CT.                                            NC2214.2 154
   000828         083200     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000829         083300     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000830         083400     SET INDEX1 TO 2.                                             NC2214.2 55
   000831         083500     SET INDEX2 TO 2.                                             NC2214.2 59
   000832         083600 INS-TEST-F3-11-0.                                                NC2214.2
   000833         083700     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC2214.2 53 55 57 59
   000834         083800        FOR ALL "A" REPLACING FIRST "AH" BY "OH" AFTER            NC2214.2
   000835         083900        INITIAL "YES".                                            NC2214.2
   000836         084000     GO TO INS-TEST-F3-11-1.                                      NC2214.2 841
   000837         084100 INS-DELETE-F3-11.                                                NC2214.2
   000838         084200     PERFORM DE-LETE.                                             NC2214.2 259
   000839         084300     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000840         084400     GO TO INS-INIT-F3-12.                                        NC2214.2 888
   000841         084500 INS-TEST-F3-11-1.                                                NC2214.2
   000842         084600     IF WRK-DU-999 (INDEX2) EQUAL TO 8                            NC2214.2 57 59
   000843      1  084700        PERFORM PASS                                              NC2214.2 257
   000844      1  084800        GO TO INS-WRITE-F3-11-1                                   NC2214.2 854
   000845         084900     ELSE                                                         NC2214.2
   000846      1  085000        GO TO INS-FAIL-F3-11-1.                                   NC2214.2 850
   000847         085100 INS-DELETE-F3-11-1.                                              NC2214.2
   000848         085200     PERFORM DE-LETE.                                             NC2214.2 259
   000849         085300     GO TO INS-WRITE-F3-11-1.                                     NC2214.2 854
   000850         085400 INS-FAIL-F3-11-1.                                                NC2214.2
   000851         085500     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                       NC2214.2 57 59 119
   000852         085600     MOVE 8 TO CORRECT-N                                          NC2214.2 133
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700     PERFORM FAIL.                                                NC2214.2 258
   000854         085800 INS-WRITE-F3-11-1.                                               NC2214.2
   000855         085900     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000856         086000*                                                                 NC2214.2
   000857         086100 INS-TEST-F3-11-2.                                                NC2214.2
   000858         086200     ADD 1 TO REC-CT.                                             NC2214.2 154
   000859         086300     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-6                  NC2214.2 53 55 86
   000860      1  086400        PERFORM PASS                                              NC2214.2 257
   000861      1  086500        GO TO INS-WRITE-F3-11-2                                   NC2214.2 885
   000862         086600     ELSE                                                         NC2214.2
   000863      1  086700        GO TO INS-FAIL-F3-11-2.                                   NC2214.2 867
   000864         086800 INS-DELETE-F3-11-2.                                              NC2214.2
   000865         086900     PERFORM DE-LETE.                                             NC2214.2 259
   000866         087000     GO TO INS-WRITE-F3-11-2.                                     NC2214.2 885
   000867         087100 INS-FAIL-F3-11-2.                                                NC2214.2
   000868         087200     MOVE    TABLE1-REC (INDEX1) TO WS-WRONG-1-83                 NC2214.2 53 55 45
   000869         087300     MOVE    ANS-XN-83-6     TO WS-RIGHT-1-83                     NC2214.2 86 39
   000870         087400     PERFORM FAIL                                                 NC2214.2 258
   000871         087500     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2214.2 40 132
   000872         087600     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2214.2 46 118
   000873         087700     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000874         087800     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2214.2 41 132
   000875         087900     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2214.2 47 118
   000876         088000     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000877         088100     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2214.2 42 132
   000878         088200     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2214.2 48 118
   000879         088300     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000880         088400     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2214.2 43 132
   000881         088500     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2214.2 49 118
   000882         088600     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000883         088700     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2214.2 44 132
   000884         088800     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000885         088900 INS-WRITE-F3-11-2.                                               NC2214.2
   000886         089000     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000887         089100*                                                                 NC2214.2
   000888         089200 INS-INIT-F3-12.                                                  NC2214.2
   000889         089300     MOVE "INS-TEST-F3-12"       TO PAR-NAME.                     NC2214.2 107
   000890         089400     MOVE "IV-21 4.3.8.2"        TO ANSI-REFERENCE.               NC2214.2 163
   000891         089500     MOVE "TALLY CHARS REPL BEF" TO FEATURE.                      NC2214.2 103
   000892         089600     MOVE 1 TO REC-CT.                                            NC2214.2 154
   000893         089700     PERFORM INIT-TABLE1.                                         NC2214.2 357
   000894         089800     MOVE ZEROS TO TABLE2.                                        NC2214.2 IMP 56
   000895         089900     PERFORM INIT-TABLE4.                                         NC2214.2 370
   000896         090000     SET INDEX1 TO 3.                                             NC2214.2 55
   000897         090100     SET INDEX2 TO 3.                                             NC2214.2 59
   000898         090200     SET INDEX4 TO 1.                                             NC2214.2 67
   000899         090300 INS-TEST-F3-12-0.                                                NC2214.2
   000900         090400     INSPECT TABLE1-REC (INDEX1) TALLYING WRK-DU-999 (INDEX2)     NC2214.2 53 55 57 59
   000901         090500        FOR CHARACTERS AFTER TABLE4-LETTER (INDEX4)               NC2214.2 65 67
   000902         090600        REPLACING ALL "AH" BY "OH"                                NC2214.2
   000903         090700        BEFORE "YES".                                             NC2214.2
   000904         090800     GO TO INS-TEST-F3-12-1.                                      NC2214.2 909
   000905         090900 INS-DELETE-F3-12.                                                NC2214.2
   000906         091000     PERFORM DE-LETE.                                             NC2214.2 259
   000907         091100     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000908         091200     GO TO CCVS-999999.                                           NC2214.2 956
   000909         091300 INS-TEST-F3-12-1.                                                NC2214.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     IF WRK-DU-999 (INDEX2) EQUAL TO 81                           NC2214.2 57 59
   000911      1  091500        PERFORM PASS                                              NC2214.2 257
   000912      1  091600        GO TO INS-WRITE-F3-12-1                                   NC2214.2 922
   000913         091700        ELSE                                                      NC2214.2
   000914      1  091800        GO TO INS-FAIL-F3-12-1.                                   NC2214.2 918
   000915         091900 INS-DELETE-F3-12-1.                                              NC2214.2
   000916         092000     PERFORM DE-LETE.                                             NC2214.2 259
   000917         092100     GO TO INS-WRITE-F3-12-1.                                     NC2214.2 922
   000918         092200 INS-FAIL-F3-12-1.                                                NC2214.2
   000919         092300     MOVE WRK-DU-999 (INDEX2) TO COMPUTED-N                       NC2214.2 57 59 119
   000920         092400     MOVE 81 TO CORRECT-N                                         NC2214.2 133
   000921         092500     PERFORM FAIL.                                                NC2214.2 258
   000922         092600 INS-WRITE-F3-12-1.                                               NC2214.2
   000923         092700     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000924         092800*                                                                 NC2214.2
   000925         092900 INS-TEST-F3-12-2.                                                NC2214.2
   000926         093000     ADD 1 TO REC-CT.                                             NC2214.2 154
   000927         093100     IF TABLE1-REC (INDEX1) EQUAL TO ANS-XN-83-3                  NC2214.2 53 55 77
   000928      1  093200        PERFORM PASS                                              NC2214.2 257
   000929      1  093300        GO TO INS-WRITE-F3-12-2                                   NC2214.2 953
   000930         093400     ELSE                                                         NC2214.2
   000931      1  093500        GO TO INS-FAIL-F3-12-2.                                   NC2214.2 935
   000932         093600 INS-DELETE-F3-12-2.                                              NC2214.2
   000933         093700     PERFORM DE-LETE.                                             NC2214.2 259
   000934         093800     GO TO INS-WRITE-F3-12-2.                                     NC2214.2 953
   000935         093900 INS-FAIL-F3-12-2.                                                NC2214.2
   000936         094000     MOVE    TABLE1-REC (INDEX1) TO WS-WRONG-1-83                 NC2214.2 53 55 45
   000937         094100     MOVE    ANS-XN-83-3     TO WS-RIGHT-1-83                     NC2214.2 77 39
   000938         094200     PERFORM FAIL                                                 NC2214.2 258
   000939         094300     MOVE    WS-RIGHT-1-20   TO CORRECT-A                         NC2214.2 40 132
   000940         094400     MOVE    WS-WRONG-1-20   TO COMPUTED-A                        NC2214.2 46 118
   000941         094500     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000942         094600     MOVE    WS-RIGHT-21-40  TO CORRECT-A                         NC2214.2 41 132
   000943         094700     MOVE    WS-WRONG-21-40  TO COMPUTED-A                        NC2214.2 47 118
   000944         094800     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000945         094900     MOVE    WS-RIGHT-41-60  TO CORRECT-A                         NC2214.2 42 132
   000946         095000     MOVE    WS-WRONG-41-60  TO COMPUTED-A                        NC2214.2 48 118
   000947         095100     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000948         095200     MOVE    WS-RIGHT-61-80  TO CORRECT-A                         NC2214.2 43 132
   000949         095300     MOVE    WS-WRONG-61-80  TO COMPUTED-A                        NC2214.2 49 118
   000950         095400     PERFORM PRINT-DETAIL                                         NC2214.2 261
   000951         095500     MOVE    WS-RIGHT-81-83  TO CORRECT-A                         NC2214.2 44 132
   000952         095600     MOVE    WS-WRONG-81-83  TO COMPUTED-A.                       NC2214.2 50 118
   000953         095700 INS-WRITE-F3-12-2.                                               NC2214.2
   000954         095800     PERFORM PRINT-DETAIL.                                        NC2214.2 261
   000955         095900 CCVS-EXIT SECTION.                                               NC2214.2
   000956         096000 CCVS-999999.                                                     NC2214.2
   000957         096100     GO TO CLOSE-FILES.                                           NC2214.2 250
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    20
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       71   ANS-XN-83-1. . . . . . . . . .  463 472
       74   ANS-XN-83-2. . . . . . . . . .  M500 507 516
       77   ANS-XN-83-3. . . . . . . . . .  M545 549 558 794 804 927 937
       80   ANS-XN-83-4. . . . . . . . . .  M587 593 602
       83   ANS-XN-83-5. . . . . . . . . .  660 670
       86   ANS-XN-83-6. . . . . . . . . .  727 737 859 869
      163   ANSI-REFERENCE . . . . . . . .  335 342 351 M379 M403 M428 M453 M494 M538 M580 M624 M691 M758 M825 M890
      142   CCVS-C-1 . . . . . . . . . . .  279 321
      147   CCVS-C-2 . . . . . . . . . . .  280 322
      197   CCVS-E-1 . . . . . . . . . . .  285
      202   CCVS-E-2 . . . . . . . . . . .  294 301 308 313
      205   CCVS-E-2-2 . . . . . . . . . .  M293
      210   CCVS-E-3 . . . . . . . . . . .  314
      219   CCVS-E-4 . . . . . . . . . . .  293
      220   CCVS-E-4-1 . . . . . . . . . .  M291
      222   CCVS-E-4-2 . . . . . . . . . .  M292
      164   CCVS-H-1 . . . . . . . . . . .  274
      169   CCVS-H-2A. . . . . . . . . . .  275
      178   CCVS-H-2B. . . . . . . . . . .  276
      190   CCVS-H-3 . . . . . . . . . . .  277
      240   CCVS-PGM-ID. . . . . . . . . .  246 246
      124   CM-18V0
      118   COMPUTED-A . . . . . . . . . .  119 121 122 123 124 347 350 M475 M478 M481 M484 M487 M519 M522 M525 M528 M531
                                            M561 M564 M567 M570 M573 M605 M608 M611 M614 M617 M673 M676 M679 M682 M685 M740
                                            M743 M746 M749 M752 M807 M810 M813 M816 M819 M872 M875 M878 M881 M884 M940 M943
                                            M946 M949 M952
      119   COMPUTED-N . . . . . . . . . .  M396 M421 M446 M652 M719 M786 M851 M919
      117   COMPUTED-X . . . . . . . . . .  M269 333
      121   COMPUTED-0V18
      123   COMPUTED-14V4
      125   COMPUTED-18V0
      122   COMPUTED-4V14
      141   COR-ANSI-REFERENCE . . . . . .  M342 M344
      132   CORRECT-A. . . . . . . . . . .  133 134 135 136 137 348 350 M474 M477 M480 M483 M486 M518 M521 M524 M527 M530
                                            M560 M563 M566 M569 M572 M604 M607 M610 M613 M616 M672 M675 M678 M681 M684 M739
                                            M742 M745 M748 M751 M806 M809 M812 M815 M818 M871 M874 M877 M880 M883 M939 M942
                                            M945 M948 M951
      133   CORRECT-N. . . . . . . . . . .  M397 M422 M447 M653 M720 M787 M852 M920
      131   CORRECT-X. . . . . . . . . . .  M270 334
      134   CORRECT-0V18
      136   CORRECT-14V4
      138   CORRECT-18V0
      135   CORRECT-4V14
      137   CR-18V0
      155   DELETE-COUNTER . . . . . . . .  M259 288 304 306
      110   DOTVALUE . . . . . . . . . . .  M264
      161   DUMMY-HOLD . . . . . . . . . .  M318 324
       36   DUMMY-RECORD . . . . . . . . .  M274 M275 M276 M277 M279 M280 M281 M283 M285 M294 M301 M308 M313 M314 318 M319
                                            320 M321 M322 M323 M324 328 M329 M337 M352
      208   ENDER-DESC . . . . . . . . . .  M296 M307 M312
      156   ERROR-COUNTER. . . . . . . . .  M258 287 297 300
      160   ERROR-HOLD . . . . . . . . . .  M287 M288 M288 M289 292
      206   ERROR-TOTAL. . . . . . . . . .  M298 M300 M305 M306 M310 M311
      103   FEATURE. . . . . . . . . . . .  M380 M404 M429 M454 M495 M539 M581 M625 M692 M759 M826 M891
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    21
0 Defined   Cross-reference of data names   References

0     234   HYPHEN-LINE. . . . . . . . . .  281 283 323
      200   ID-AGAIN . . . . . . . . . . .  M246
       55   INDEX1 . . . . . . . . . . . .  M382 385 M406 409 M431 434 M455 458 463 471 M501 504 507 515 M541 547 549 557
                                            M588 591 593 601 M630 634 660 669 M697 701 727 736 M764 768 794 803 M830 833
                                            859 868 M896 900 927 936
       59   INDEX2 . . . . . . . . . . . .  M383 385 387 396 M407 410 412 421 M432 435 437 446 M631 635 644 652 M698 701
                                            711 719 M765 768 777 786 M831 833 842 851 M897 900 910 919
       63   INDEX3 . . . . . . . . . . . .  M502 505 505
       67   INDEX4 . . . . . . . . . . . .  M456 459 459 462 M589 592 M632 637 M699 703 703 M766 769 770 M898 901
      233   INF-ANSI-REFERENCE . . . . . .  M335 M338 M351 M353
      228   INFO-TEXT. . . . . . . . . . .  M336
      157   INSPECT-COUNTER. . . . . . . .  M256 287 309 311
      105   P-OR-F . . . . . . . . . . . .  M256 M257 M258 M259 266 M269
      107   PAR-NAME . . . . . . . . . . .  M271 M378 M402 M427 M452 M493 M537 M579 M623 M690 M757 M824 M889
      109   PARDOT-X . . . . . . . . . . .  M263
      158   PASS-COUNTER . . . . . . . . .  M257 289 291
       34   PRINT-FILE . . . . . . . . . .  30 245 251
       35   PRINT-REC. . . . . . . . . . .  M265 M341 M343
      112   RE-MARK. . . . . . . . . . . .  M260 M272
      154   REC-CT . . . . . . . . . . . .  262 264 271 M626 M659 M693 M726 M760 M793 M827 M858 M892 M926
      153   REC-SKL-SUB
      162   RECORD-COUNT . . . . . . . . .  M316 317 M325
       52   TABLE1
       53   TABLE1-REC . . . . . . . . . .  M362 M363 M364 M365 385 409 434 M458 463 471 M504 507 515 M547 549 557 M591 593
                                            601 M634 660 669 M701 727 736 M768 794 803 M833 859 868 M900 927 936
       56   TABLE2 . . . . . . . . . . . .  M381 M405 M430 M629 M695 M762 M829 M894
       60   TABLE3
       61   TABLE3-SYMBOL. . . . . . . . .  M367 M368 M369 505 505
       64   TABLE4
       65   TABLE4-LETTER. . . . . . . . .  M371 M372 M373 M374 M375 459 459 462 592 637 703 703 769 770 901
      113   TEST-COMPUTED. . . . . . . . .  341
      128   TEST-CORRECT . . . . . . . . .  343
      181   TEST-ID. . . . . . . . . . . .  M246
      101   TEST-RESULTS . . . . . . . . .  M247 265
      159   TOTAL-ERROR
       68   WC-XN-83 . . . . . . . . . . .  M361 362 363 364 365
       57   WRK-DU-999 . . . . . . . . . .  M385 387 396 M410 412 421 M435 437 446 M635 644 652 M701 711 719 M768 777 786
                                            M833 842 851 M900 910 919
       40   WS-RIGHT-1-20. . . . . . . . .  474 518 560 604 672 739 806 871 939
       39   WS-RIGHT-1-83. . . . . . . . .  M472 M516 M558 M602 M670 M737 M804 M869 M937
       41   WS-RIGHT-21-40 . . . . . . . .  477 521 563 607 675 742 809 874 942
       42   WS-RIGHT-41-60 . . . . . . . .  480 524 566 610 678 745 812 877 945
       43   WS-RIGHT-61-80 . . . . . . . .  483 527 569 613 681 748 815 880 948
       44   WS-RIGHT-81-83 . . . . . . . .  486 530 572 616 684 751 818 883 951
       46   WS-WRONG-1-20. . . . . . . . .  475 519 561 605 673 740 807 872 940
       45   WS-WRONG-1-83. . . . . . . . .  M471 M515 M557 M601 M669 M736 M803 M868 M936
       47   WS-WRONG-21-40 . . . . . . . .  478 522 564 608 676 743 810 875 943
       48   WS-WRONG-41-60 . . . . . . . .  481 525 567 611 679 746 813 878 946
       49   WS-WRONG-61-80 . . . . . . . .  484 528 570 614 682 749 816 881 949
       50   WS-WRONG-81-83 . . . . . . . .  487 531 573 617 685 752 819 884 952
      230   XXCOMPUTED . . . . . . . . . .  M350
      232   XXCORRECT. . . . . . . . . . .  M350
      225   XXINFO . . . . . . . . . . . .  337 352
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    22
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

      346   BAIL-OUT . . . . . . . . . . .  P268
      354   BAIL-OUT-EX. . . . . . . . . .  E268 G348
      349   BAIL-OUT-WRITE . . . . . . . .  G347
      330   BLANK-LINE-PRINT
      955   CCVS-EXIT
      956   CCVS-999999. . . . . . . . . .  G908
      243   CCVS1
      355   CCVS1-EXIT . . . . . . . . . .  G249
      250   CLOSE-FILES. . . . . . . . . .  G957
      278   COLUMN-NAMES-ROUTINE . . . . .  E248
      259   DE-LETE. . . . . . . . . . . .  P392 P417 P442 P468 P512 P554 P598 P640 P649 P666 P707 P716 P733 P773 P783 P800
                                            P838 P848 P865 P906 P916 P933
      282   END-ROUTINE. . . . . . . . . .  P251
      286   END-ROUTINE-1
      295   END-ROUTINE-12
      303   END-ROUTINE-13 . . . . . . . .  E251
      284   END-RTN-EXIT
      258   FAIL . . . . . . . . . . . . .  P395 P420 P445 P473 P517 P559 P603 P654 P671 P721 P738 P788 P805 P853 P870 P921
                                            P938
      332   FAIL-ROUTINE . . . . . . . . .  P267
      345   FAIL-ROUTINE-EX. . . . . . . .  E267 G339
      340   FAIL-ROUTINE-WRITE . . . . . .  G333 G334
      273   HEAD-ROUTINE . . . . . . . . .  P248
      357   INIT-TABLE1. . . . . . . . . .  P496 P540 P582 P627 P694 P761 P828 P893
      366   INIT-TABLE3
      370   INIT-TABLE4. . . . . . . . . .  P583 P628 P696 P763 P895
      391   INS-DELETE-F1-1
      416   INS-DELETE-F1-2
      441   INS-DELETE-F1-3
      467   INS-DELETE-F2-4
      511   INS-DELETE-F2-5
      553   INS-DELETE-F2-6
      597   INS-DELETE-F2-7
      772   INS-DELETE-F3-10
      782   INS-DELETE-F3-10-1
      799   INS-DELETE-F3-10-2
      837   INS-DELETE-F3-11
      847   INS-DELETE-F3-11-1
      864   INS-DELETE-F3-11-2
      905   INS-DELETE-F3-12
      915   INS-DELETE-F3-12-1
      932   INS-DELETE-F3-12-2
      639   INS-DELETE-F3-8
      648   INS-DELETE-F3-8-1
      665   INS-DELETE-F3-8-2
      706   INS-DELETE-F3-9
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    23
0 Defined   Cross-reference of procedures   References

0     715   INS-DELETE-F3-9-1
      732   INS-DELETE-F3-9-2
      394   INS-FAIL-F1-1. . . . . . . . .  G390
      419   INS-FAIL-F1-2. . . . . . . . .  G415
      444   INS-FAIL-F1-3. . . . . . . . .  G440
      470   INS-FAIL-F2-4. . . . . . . . .  G466
      514   INS-FAIL-F2-5. . . . . . . . .  G510
      556   INS-FAIL-F2-6. . . . . . . . .  G552
      600   INS-FAIL-F2-7. . . . . . . . .  G596
      785   INS-FAIL-F3-10-1 . . . . . . .  G781
      802   INS-FAIL-F3-10-2 . . . . . . .  G798
      850   INS-FAIL-F3-11-1 . . . . . . .  G846
      867   INS-FAIL-F3-11-2 . . . . . . .  G863
      918   INS-FAIL-F3-12-1 . . . . . . .  G914
      935   INS-FAIL-F3-12-2 . . . . . . .  G931
      651   INS-FAIL-F3-8-1. . . . . . . .  G647
      668   INS-FAIL-F3-8-2. . . . . . . .  G664
      718   INS-FAIL-F3-9-1. . . . . . . .  G714
      735   INS-FAIL-F3-9-2. . . . . . . .  G731
      377   INS-INIT-F1-1
      401   INS-INIT-F1-2
      426   INS-INIT-F1-3
      451   INS-INIT-F2-4
      492   INS-INIT-F2-5
      536   INS-INIT-F2-6
      578   INS-INIT-F2-7
      756   INS-INIT-F3-10 . . . . . . . .  G709
      823   INS-INIT-F3-11 . . . . . . . .  G775
      888   INS-INIT-F3-12 . . . . . . . .  G840
      622   INS-INIT-F3-8
      689   INS-INIT-F3-9. . . . . . . . .  G642
      384   INS-TEST-F1-1
      408   INS-TEST-F1-2
      433   INS-TEST-F1-3
      457   INS-TEST-F2-4
      503   INS-TEST-F2-5
      546   INS-TEST-F2-6
      590   INS-TEST-F2-7
      767   INS-TEST-F3-10-0
      776   INS-TEST-F3-10-1 . . . . . . .  G771
      792   INS-TEST-F3-10-2
      832   INS-TEST-F3-11-0
      841   INS-TEST-F3-11-1 . . . . . . .  G836
      857   INS-TEST-F3-11-2
      899   INS-TEST-F3-12-0
      909   INS-TEST-F3-12-1 . . . . . . .  G904
      925   INS-TEST-F3-12-2
      633   INS-TEST-F3-8-0
      643   INS-TEST-F3-8-1. . . . . . . .  G638
      658   INS-TEST-F3-8-2
      700   INS-TEST-F3-9-0
      710   INS-TEST-F3-9-1. . . . . . . .  G705
      725   INS-TEST-F3-9-2
      398   INS-WRITE-F1-1 . . . . . . . .  G389 G393
      423   INS-WRITE-F1-2 . . . . . . . .  G414 G418
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    24
0 Defined   Cross-reference of procedures   References

0     448   INS-WRITE-F1-3 . . . . . . . .  G439 G443
      489   INS-WRITE-F2-4 . . . . . . . .  G465 G469
      533   INS-WRITE-F2-5 . . . . . . . .  G509 G513
      575   INS-WRITE-F2-6 . . . . . . . .  G551 G555
      619   INS-WRITE-F2-7 . . . . . . . .  G595 G599
      789   INS-WRITE-F3-10-1. . . . . . .  G779 G784
      820   INS-WRITE-F3-10-2. . . . . . .  G796 G801
      854   INS-WRITE-F3-11-1. . . . . . .  G844 G849
      885   INS-WRITE-F3-11-2. . . . . . .  G861 G866
      922   INS-WRITE-F3-12-1. . . . . . .  G912 G917
      953   INS-WRITE-F3-12-2. . . . . . .  G929 G934
      655   INS-WRITE-F3-8-1 . . . . . . .  G646 G650
      686   INS-WRITE-F3-8-2 . . . . . . .  G662 G667
      722   INS-WRITE-F3-9-1 . . . . . . .  G713 G717
      753   INS-WRITE-F3-9-2 . . . . . . .  G729 G734
      256   INSPT
      244   OPEN-FILES
      257   PASS . . . . . . . . . . . . .  P388 P413 P438 P464 P508 P550 P594 P645 P661 P712 P728 P778 P795 P843 P860 P911
                                            P928
      261   PRINT-DETAIL . . . . . . . . .  P399 P424 P449 P476 P479 P482 P485 P488 P490 P520 P523 P526 P529 P532 P534 P562
                                            P565 P568 P571 P574 P576 P606 P609 P612 P615 P618 P620 P641 P656 P674 P677 P680
                                            P683 P687 P708 P723 P741 P744 P747 P750 P754 P774 P790 P808 P811 P814 P817 P821
                                            P839 P855 P873 P876 P879 P882 P886 P907 P923 P941 P944 P947 P950 P954
      254   TERMINATE-CALL
      252   TERMINATE-CCVS
      315   WRITE-LINE . . . . . . . . . .  P265 P266 P274 P275 P276 P277 P279 P280 P281 P283 P285 P294 P302 P308 P313 P314
                                            P337 P341 P343 P352
      327   WRT-LN . . . . . . . . . . . .  P321 P322 P323 P326 P331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    25
0 Defined   Cross-reference of programs     References

        3   NC221A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC221A    Date 06/04/2022  Time 11:59:26   Page    26
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC221A:
 *    Source records = 957
 *    Data Division statements = 90
 *    Procedure Division statements = 570
 *    Generated COBOL statements = 0
 *    Program complexity factor = 579
0End of compilation 1,  program NC221A,  highest severity 0.
0Return code 0
