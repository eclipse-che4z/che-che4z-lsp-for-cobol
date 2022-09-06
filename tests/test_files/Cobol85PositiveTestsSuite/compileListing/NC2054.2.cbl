1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:29   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:29   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2054.2
   000002         000200 PROGRAM-ID.                                                      NC2054.2
   000003         000300     NC205A.                                                      NC2054.2
   000004         000400*                                                              *  NC2054.2
   000005         000600*                                                              *  NC2054.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2054.2
   000007         000800*                                                              *  NC2054.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2054.2
   000009         001000*                                                              *  NC2054.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2054.2
   000011         001200*                                                              *  NC2054.2
   000012         001400*                                                              *  NC2054.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2054.2
   000014         001600*                                                              *  NC2054.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2054.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2054.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2054.2
   000018         002000*                                                              *  NC2054.2
   000019         002200*                                                              *  NC2054.2
   000020         002300*    PROGRAM NC205A TESTS THE CONTINUATION OF COBOL WORDS,     *  NC2054.2
   000021         002400*    NUMERIC AND NON-NUMERIC LITERALS AND PICTURE STRINGS USING*  NC2054.2
   000022         002500*    A HYPHEN IN THE INDICATOR AREA OF CONTINUATION LINES.     *  NC2054.2
   000023         002600*                                                              *  NC2054.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2054.2
   000025         002900 CONFIGURATION SECTION.                                           NC2054.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2054.2
   000027         003100     XXXXX082.                                                    NC2054.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2054.2
   000029         003300     XXXXX083.                                                    NC2054.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2054.2
   000031         003500 FILE-CONTROL.                                                    NC2054.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2054.2 36
   000033         003700     XXXXX055.                                                    NC2054.2
   000034         003800 DATA DIVISION.                                                   NC2054.2
   000035         003900 FILE SECTION.                                                    NC2054.2
   000036         004000 FD  PRINT-FILE.                                                  NC2054.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2054.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2054.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2054.2
   000040         004400 77  WS-TEST-12-DATA                                              NC2054.2
   000041         004500                        PIC S9(                                   NC2054.2
   000042         004600-                              6)V9(6).                           NC2054.2
   000043         004700 77  PROCEDURE                                                    NC2054.2
   000044         004800-    DIVISION PICTURE X.                                          NC2054.2
   000045         004900 77  CONT-                                                        NC2054.2
   000046         005000-         A             PIC                                       NC2054.2
   000047         005100-                          TURE X(10) VAL                         NC2054.2
   000048         005200-                                        UE               "GOVERNMNC2054.2
   000049         005300-    "ENT".                                                       NC2054.2
   000050         005400 77  CONT-B                       PICTURE S9(5)V9(5) VALUE ZERO.  NC2054.2 IMP
   000051         005500 77  CONT-C                       PICTURE 9(8).                   NC2054.2
   000052         005600 77  CONT-D                       PICTURE 9(5).                   NC2054.2
   000053         005700 77  CONT-E                       PICTURE 9999.                   NC2054.2
   000054         005800 77  CONT-F                       PICTURE 9(5).                   NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  CONT-88              PICTURE S99.                            NC2054.2
   000056         006000     88 GREATERZERO          VALUE -10.                           NC2054.2
   000057         006100     88 NEGATIVEZERO       VALUE +10.                             NC2054.2
   000058         006200 77                                                               NC2054.2
   000059         006300                                                                  NC2054.2
   000060         006400     SPACING-77                                                   NC2054.2
   000061         006500      PICTURE                                                     NC2054.2
   000062         006600                                                                  NC2054.2
   000063         006700     X(10)                                                   VALUENC2054.2
   000064         006800                                                                  NC2054.2
   000065         006900     "ABCDE12345".                                                NC2054.2
   000066         007000 77  SPACING-SEND       PICTURE 9(10) VALUE 1234567890.           NC2054.2
   000067         007100 77  SPACING-RECEIVE    PICTURE                                   NC2054.2
   000068         007200                                                                  NC2054.2
   000069         007300                                                                  NC2054.2
   000070         007400                                                                  NC2054.2
   000071         007500                                                                  NC2054.2
   000072         007600                                                                  NC2054.2
   000073         007700                                                                  NC2054.2
   000074         007800                                                                  NC2054.2
   000075         007900                                                                  NC2054.2
   000076         008000                                                                  NC2054.2
   000077         008100                                                                  NC2054.2
   000078         008200                                                                  NC2054.2
   000079         008300                                                                  NC2054.2
   000080         008400                                                                  NC2054.2
   000081         008500                                                                  NC2054.2
   000082         008600                                                                  NC2054.2
   000083         008700                                                                  NC2054.2
   000084         008800                                                                  NC2054.2
   000085         008900                                                                  NC2054.2
   000086         009000                                                                  NC2054.2
   000087         009100                                                                  NC2054.2
   000088         009200                                                                  NC2054.2
   000089         009300                                                                  NC2054.2
   000090         009400                                                                  NC2054.2
   000091         009500                                                                  NC2054.2
   000092         009600                                                                  NC2054.2
   000093         009700                                                                  NC2054.2
   000094         009800                                                                  NC2054.2
   000095         009900                                                                  NC2054.2
   000096         010000                                                                  NC2054.2
   000097         010100                                                                  NC2054.2
   000098         010200                                                                  NC2054.2
   000099         010300                                                                  NC2054.2
   000100         010400                                                                  NC2054.2
   000101         010500                                                                  NC2054.2
   000102         010600                                                                  NC2054.2
   000103         010700                                                                  NC2054.2
   000104         010800                                                                  NC2054.2
   000105         010900                                                                  NC2054.2
   000106         011000                                                                  NC2054.2
   000107         011100                                                                  NC2054.2
   000108         011200                                                                  NC2054.2
   000109         011300                                                                  NC2054.2
   000110         011400                                                                  NC2054.2
   000111         011500                                                                  NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600                                                                  NC2054.2
   000113         011700                                                                  NC2054.2
   000114         011800                                                                  NC2054.2
   000115         011900                                                                  NC2054.2
   000116         012000                                                                  NC2054.2
   000117         012100                                                                  NC2054.2
   000118         012200                                                                  NC2054.2
   000119         012300                                                                  NC2054.2
   000120         012400                                                                  NC2054.2
   000121         012500                                                                  NC2054.2
   000122         012600                                                                  NC2054.2
   000123         012700                                                                  NC2054.2
   000124         012800                                                                  NC2054.2
   000125         012900                                                                  NC2054.2
   000126         013000                                                                  NC2054.2
   000127         013100                                                                  NC2054.2
   000128         013200     9999999999.                                                  NC2054.2
   000129         013300 01  SPACING-01. 02 SPACING-02. 03 SPACING-03 PICTURE XX. 02      NC2054.2
   000130         013400     SPACING-2. 03 SPACING-3. 04 SPACING-4 PICTURE X(8).          NC2054.2
   000131         013500 01  CONT-G                                                       NC2054.2
   000132         013600-           RP.                                                   NC2054.2
   000133         013700                                  02 LEVEL-02.                    NC2054.2
   000134         013800                                                      03 LEVEL-03.NC2054.2
   000135         013900     04                                                           NC2054.2
   000136         014000       LEVEL-                                                     NC2054.2
   000137         014100-            04         PICTURE XXXXXXXXXX.                       NC2054.2
   000138         014200 01  TEST-RESULTS.                                                NC2054.2
   000139         014300     02 FILLER                   PIC X      VALUE SPACE.          NC2054.2 IMP
   000140         014400     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2054.2 IMP
   000141         014500     02 FILLER                   PIC X      VALUE SPACE.          NC2054.2 IMP
   000142         014600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2054.2 IMP
   000143         014700     02 FILLER                   PIC X      VALUE SPACE.          NC2054.2 IMP
   000144         014800     02  PAR-NAME.                                                NC2054.2
   000145         014900       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2054.2 IMP
   000146         015000       03  PARDOT-X              PIC X      VALUE SPACE.          NC2054.2 IMP
   000147         015100       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2054.2 IMP
   000148         015200     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2054.2 IMP
   000149         015300     02 RE-MARK                  PIC X(61).                       NC2054.2
   000150         015400 01  TEST-COMPUTED.                                               NC2054.2
   000151         015500     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2054.2 IMP
   000152         015600     02 FILLER                   PIC X(17)  VALUE                 NC2054.2
   000153         015700            "       COMPUTED=".                                   NC2054.2
   000154         015800     02 COMPUTED-X.                                               NC2054.2
   000155         015900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2054.2 IMP
   000156         016000     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2054.2 155
   000157         016100                                 PIC -9(9).9(9).                  NC2054.2
   000158         016200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2054.2 155
   000159         016300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2054.2 155
   000160         016400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2054.2 155
   000161         016500     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2054.2 155
   000162         016600         04 COMPUTED-18V0                    PIC -9(18).          NC2054.2
   000163         016700         04 FILLER                           PIC X.               NC2054.2
   000164         016800     03 FILLER PIC X(50) VALUE SPACE.                             NC2054.2 IMP
   000165         016900 01  TEST-CORRECT.                                                NC2054.2
   000166         017000     02 FILLER PIC X(30) VALUE SPACE.                             NC2054.2 IMP
   000167         017100     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2054.2
   000168         017200     02 CORRECT-X.                                                NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2054.2 IMP
   000170         017400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2054.2 169
   000171         017500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2054.2 169
   000172         017600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2054.2 169
   000173         017700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2054.2 169
   000174         017800     03      CR-18V0 REDEFINES CORRECT-A.                         NC2054.2 169
   000175         017900         04 CORRECT-18V0                     PIC -9(18).          NC2054.2
   000176         018000         04 FILLER                           PIC X.               NC2054.2
   000177         018100     03 FILLER PIC X(2) VALUE SPACE.                              NC2054.2 IMP
   000178         018200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2054.2 IMP
   000179         018300 01  CCVS-C-1.                                                    NC2054.2
   000180         018400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2054.2
   000181         018500-    "SS  PARAGRAPH-NAME                                          NC2054.2
   000182         018600-    "       REMARKS".                                            NC2054.2
   000183         018700     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2054.2 IMP
   000184         018800 01  CCVS-C-2.                                                    NC2054.2
   000185         018900     02 FILLER                     PIC X        VALUE SPACE.      NC2054.2 IMP
   000186         019000     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2054.2
   000187         019100     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2054.2 IMP
   000188         019200     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2054.2
   000189         019300     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2054.2 IMP
   000190         019400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2054.2 IMP
   000191         019500 01  REC-CT                        PIC 99       VALUE ZERO.       NC2054.2 IMP
   000192         019600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2054.2 IMP
   000193         019700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2054.2 IMP
   000194         019800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2054.2 IMP
   000195         019900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2054.2 IMP
   000196         020000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2054.2 IMP
   000197         020100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2054.2 IMP
   000198         020200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2054.2 IMP
   000199         020300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2054.2 IMP
   000200         020400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2054.2 IMP
   000201         020500 01  CCVS-H-1.                                                    NC2054.2
   000202         020600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2054.2 IMP
   000203         020700     02  FILLER                    PIC X(42)    VALUE             NC2054.2
   000204         020800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2054.2
   000205         020900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2054.2 IMP
   000206         021000 01  CCVS-H-2A.                                                   NC2054.2
   000207         021100   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2054.2 IMP
   000208         021200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2054.2
   000209         021300   02  FILLER                        PIC XXXX   VALUE             NC2054.2
   000210         021400     "4.2 ".                                                      NC2054.2
   000211         021500   02  FILLER                        PIC X(28)  VALUE             NC2054.2
   000212         021600            " COPY - NOT FOR DISTRIBUTION".                       NC2054.2
   000213         021700   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2054.2 IMP
   000214         021800                                                                  NC2054.2
   000215         021900 01  CCVS-H-2B.                                                   NC2054.2
   000216         022000   02  FILLER                        PIC X(15)  VALUE             NC2054.2
   000217         022100            "TEST RESULT OF ".                                    NC2054.2
   000218         022200   02  TEST-ID                       PIC X(9).                    NC2054.2
   000219         022300   02  FILLER                        PIC X(4)   VALUE             NC2054.2
   000220         022400            " IN ".                                               NC2054.2
   000221         022500   02  FILLER                        PIC X(12)  VALUE             NC2054.2
   000222         022600     " HIGH       ".                                              NC2054.2
   000223         022700   02  FILLER                        PIC X(22)  VALUE             NC2054.2
   000224         022800            " LEVEL VALIDATION FOR ".                             NC2054.2
   000225         022900   02  FILLER                        PIC X(58)  VALUE             NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2054.2
   000227         023100 01  CCVS-H-3.                                                    NC2054.2
   000228         023200     02  FILLER                      PIC X(34)  VALUE             NC2054.2
   000229         023300            " FOR OFFICIAL USE ONLY    ".                         NC2054.2
   000230         023400     02  FILLER                      PIC X(58)  VALUE             NC2054.2
   000231         023500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2054.2
   000232         023600     02  FILLER                      PIC X(28)  VALUE             NC2054.2
   000233         023700            "  COPYRIGHT   1985 ".                                NC2054.2
   000234         023800 01  CCVS-E-1.                                                    NC2054.2
   000235         023900     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2054.2 IMP
   000236         024000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2054.2
   000237         024100     02 ID-AGAIN                     PIC X(9).                    NC2054.2
   000238         024200     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2054.2 IMP
   000239         024300 01  CCVS-E-2.                                                    NC2054.2
   000240         024400     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2054.2 IMP
   000241         024500     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2054.2 IMP
   000242         024600     02 CCVS-E-2-2.                                               NC2054.2
   000243         024700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2054.2 IMP
   000244         024800         03 FILLER                   PIC X      VALUE SPACE.      NC2054.2 IMP
   000245         024900         03 ENDER-DESC               PIC X(44)  VALUE             NC2054.2
   000246         025000            "ERRORS ENCOUNTERED".                                 NC2054.2
   000247         025100 01  CCVS-E-3.                                                    NC2054.2
   000248         025200     02  FILLER                      PIC X(22)  VALUE             NC2054.2
   000249         025300            " FOR OFFICIAL USE ONLY".                             NC2054.2
   000250         025400     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2054.2 IMP
   000251         025500     02  FILLER                      PIC X(58)  VALUE             NC2054.2
   000252         025600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2054.2
   000253         025700     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2054.2 IMP
   000254         025800     02 FILLER                       PIC X(15)  VALUE             NC2054.2
   000255         025900             " COPYRIGHT 1985".                                   NC2054.2
   000256         026000 01  CCVS-E-4.                                                    NC2054.2
   000257         026100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2054.2 IMP
   000258         026200     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2054.2
   000259         026300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2054.2 IMP
   000260         026400     02 FILLER                       PIC X(40)  VALUE             NC2054.2
   000261         026500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2054.2
   000262         026600 01  XXINFO.                                                      NC2054.2
   000263         026700     02 FILLER                       PIC X(19)  VALUE             NC2054.2
   000264         026800            "*** INFORMATION ***".                                NC2054.2
   000265         026900     02 INFO-TEXT.                                                NC2054.2
   000266         027000       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2054.2 IMP
   000267         027100       04 XXCOMPUTED                 PIC X(20).                   NC2054.2
   000268         027200       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2054.2 IMP
   000269         027300       04 XXCORRECT                  PIC X(20).                   NC2054.2
   000270         027400     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2054.2
   000271         027500 01  HYPHEN-LINE.                                                 NC2054.2
   000272         027600     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2054.2 IMP
   000273         027700     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2054.2
   000274         027800-    "*****************************************".                 NC2054.2
   000275         027900     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2054.2
   000276         028000-    "******************************".                            NC2054.2
   000277         028100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2054.2
   000278         028200     "NC205A".                                                    NC2054.2
   000279         028300 PROCEDURE DIVISION.                                              NC2054.2
   000280         028400 CCVS1 SECTION.                                                   NC2054.2
   000281         028500 OPEN-FILES.                                                      NC2054.2
   000282         028600     OPEN     OUTPUT PRINT-FILE.                                  NC2054.2 36
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2054.2 277 218 277 237
   000284         028800     MOVE    SPACE TO TEST-RESULTS.                               NC2054.2 IMP 138
   000285         028900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2054.2 310 315
   000286         029000     GO TO CCVS1-EXIT.                                            NC2054.2 392
   000287         029100 CLOSE-FILES.                                                     NC2054.2
   000288         029200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2054.2 319 340 36
   000289         029300 TERMINATE-CCVS.                                                  NC2054.2
   000290         029400     EXIT PROGRAM.                                                NC2054.2
   000291         029500 TERMINATE-CALL.                                                  NC2054.2
   000292         029600     STOP     RUN.                                                NC2054.2
   000293         029700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2054.2 142 194
   000294         029800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2054.2 142 195
   000295         029900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2054.2 142 193
   000296         030000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2054.2 142 192
   000297         030100     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2054.2 149
   000298         030200 PRINT-DETAIL.                                                    NC2054.2
   000299         030300     IF REC-CT NOT EQUAL TO ZERO                                  NC2054.2 191 IMP
   000300      1  030400             MOVE "." TO PARDOT-X                                 NC2054.2 146
   000301      1  030500             MOVE REC-CT TO DOTVALUE.                             NC2054.2 191 147
   000302         030600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2054.2 138 37 352
   000303         030700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2054.2 142 352
   000304      1  030800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2054.2 369 382
   000305      1  030900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2054.2 383 391
   000306         031000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2054.2 IMP 142 IMP 154
   000307         031100     MOVE SPACE TO CORRECT-X.                                     NC2054.2 IMP 168
   000308         031200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2054.2 191 IMP IMP 144
   000309         031300     MOVE     SPACE TO RE-MARK.                                   NC2054.2 IMP 149
   000310         031400 HEAD-ROUTINE.                                                    NC2054.2
   000311         031500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2054.2 201 38 352
   000312         031600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2054.2 206 38 352
   000313         031700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2054.2 215 38 352
   000314         031800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2054.2 227 38 352
   000315         031900 COLUMN-NAMES-ROUTINE.                                            NC2054.2
   000316         032000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2054.2 179 38 352
   000317         032100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2054.2 184 38 352
   000318         032200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2054.2 271 38 352
   000319         032300 END-ROUTINE.                                                     NC2054.2
   000320         032400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2054.2 271 38 352
   000321         032500 END-RTN-EXIT.                                                    NC2054.2
   000322         032600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2054.2 234 38 352
   000323         032700 END-ROUTINE-1.                                                   NC2054.2
   000324         032800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2054.2 193 197 194
   000325         032900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2054.2 197 192 197
   000326         033000      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2054.2 195 197
   000327         033100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2054.2
   000328         033200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2054.2 195 257
   000329         033300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2054.2 197 259
   000330         033400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2054.2 256 242
   000331         033500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2054.2 239 38 352
   000332         033600  END-ROUTINE-12.                                                 NC2054.2
   000333         033700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2054.2 245
   000334         033800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2054.2 193 IMP
   000335      1  033900         MOVE "NO " TO ERROR-TOTAL                                NC2054.2 243
   000336         034000         ELSE                                                     NC2054.2
   000337      1  034100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2054.2 193 243
   000338         034200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2054.2 239 38
   000339         034300     PERFORM WRITE-LINE.                                          NC2054.2 352
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 END-ROUTINE-13.                                                  NC2054.2
   000341         034500     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2054.2 192 IMP
   000342      1  034600         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2054.2 243
   000343      1  034700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2054.2 192 243
   000344         034800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2054.2 245
   000345         034900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2054.2 239 38 352
   000346         035000      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2054.2 194 IMP
   000347      1  035100          MOVE "NO " TO ERROR-TOTAL                               NC2054.2 243
   000348      1  035200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2054.2 194 243
   000349         035300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2054.2 245
   000350         035400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2054.2 239 38 352
   000351         035500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2054.2 247 38 352
   000352         035600 WRITE-LINE.                                                      NC2054.2
   000353         035700     ADD 1 TO RECORD-COUNT.                                       NC2054.2 199
   000354         035800     IF RECORD-COUNT GREATER 50                                   NC2054.2 199
   000355      1  035900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2054.2 38 198
   000356      1  036000         MOVE SPACE TO DUMMY-RECORD                               NC2054.2 IMP 38
   000357      1  036100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2054.2 38
   000358      1  036200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2054.2 179 38 364
   000359      1  036300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2054.2 184 38 364
   000360      1  036400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2054.2 271 38 364
   000361      1  036500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2054.2 198 38
   000362      1  036600         MOVE ZERO TO RECORD-COUNT.                               NC2054.2 IMP 199
   000363         036700     PERFORM WRT-LN.                                              NC2054.2 364
   000364         036800 WRT-LN.                                                          NC2054.2
   000365         036900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2054.2 38
   000366         037000     MOVE SPACE TO DUMMY-RECORD.                                  NC2054.2 IMP 38
   000367         037100 BLANK-LINE-PRINT.                                                NC2054.2
   000368         037200     PERFORM WRT-LN.                                              NC2054.2 364
   000369         037300 FAIL-ROUTINE.                                                    NC2054.2
   000370         037400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2054.2 154 IMP 377
   000371         037500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2054.2 168 IMP 377
   000372         037600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2054.2 200 270
   000373         037700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2054.2 265
   000374         037800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2054.2 262 38 352
   000375         037900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2054.2 IMP 270
   000376         038000     GO TO  FAIL-ROUTINE-EX.                                      NC2054.2 382
   000377         038100 FAIL-ROUTINE-WRITE.                                              NC2054.2
   000378         038200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2054.2 150 37 352
   000379         038300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2054.2 200 178
   000380         038400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2054.2 165 37 352
   000381         038500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2054.2 IMP 178
   000382         038600 FAIL-ROUTINE-EX. EXIT.                                           NC2054.2
   000383         038700 BAIL-OUT.                                                        NC2054.2
   000384         038800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2054.2 155 IMP 386
   000385         038900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2054.2 169 IMP 391
   000386         039000 BAIL-OUT-WRITE.                                                  NC2054.2
   000387         039100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2054.2 169 269 155 267
   000388         039200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2054.2 200 270
   000389         039300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2054.2 262 38 352
   000390         039400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2054.2 IMP 270
   000391         039500 BAIL-OUT-EX. EXIT.                                               NC2054.2
   000392         039600 CCVS1-EXIT.                                                      NC2054.2
   000393         039700     EXIT.                                                        NC2054.2
   000394         039800 SECT-NC205A-001 SECTION.                                         NC2054.2
   000395         039900 CON-INIT-GF.                                                     NC2054.2
   000396         040000     MOVE   "CONTINUATION ---" TO FEATURE.                        NC2054.2 140
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE   "IV-44 7.2.2" TO ANSI-REFERENCE.                      NC2054.2 200
   000398         040200     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000399         040300 CON-INIT-GF-1.                                                   NC2054.2
   000400         040400     MOVE     "CON-TEST-GF-1" TO PAR-NAME                         NC2054.2 144
   000401         040500     MOVE     "  NUMERIC INTEGER" TO FEATURE.                     NC2054.2 140
   000402         040600 CON-TEST-GF-1.                                                   NC2054.2
   000403         040700     MOVE     4                                                   NC2054.2
   000404         040800-             5                                                   NC2054.2
   000405         040900-             6                                                   NC2054.2
   000406         041000-             7                                                   NC2054.2
   000407         041100-             8 TO CONT-B.                                        NC2054.2 50
   000408         041200     IF CONT-B EQUAL TO 45678                                     NC2054.2 50
   000409      1  041300              PERFORM PASS                                        NC2054.2 294
   000410      1  041400              GO TO CON-WRITE-GF-1.                               NC2054.2 419
   000411         041500     GO TO CON-FAIL-GF-1.                                         NC2054.2 415
   000412         041600 CON-DELETE-GF-1.                                                 NC2054.2
   000413         041700     PERFORM DE-LETE.                                             NC2054.2 296
   000414         041800     GO TO CON-WRITE-GF-1.                                        NC2054.2 419
   000415         041900 CON-FAIL-GF-1.                                                   NC2054.2
   000416         042000     PERFORM  FAIL.                                               NC2054.2 295
   000417         042100     MOVE     CONT-B TO COMPUTED-N.                               NC2054.2 50 156
   000418         042200     MOVE     45678 TO CORRECT-N.                                 NC2054.2 170
   000419         042300 CON-WRITE-GF-1.                                                  NC2054.2
   000420         042400     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000421         042500*                                                                 NC2054.2
   000422         042600 CON-INIT-GF-2.                                                   NC2054.2
   000423         042700     MOVE     "CON-TEST-GF-2" TO PAR-NAME.                        NC2054.2 144
   000424         042800     MOVE     "  NUM NON-INTEGER" TO FEATURE.                     NC2054.2 140
   000425         042900 CON-TEST-GF-2.                                                   NC2054.2
   000426         043000     MOVE     -                                                   NC2054.2
   000427         043100-             9                                                   NC2054.2
   000428         043200-             9                                                   NC2054.2
   000429         043300-             9                                                   NC2054.2
   000430         043400-             .                                                   NC2054.2
   000431         043500-             7                                                   NC2054.2
   000432         043600-             7                                                   NC2054.2
   000433         043700-             7 TO CONT-B.                                        NC2054.2 50
   000434         043800     IF CONT-B EQUAL TO -999.777                                  NC2054.2 50
   000435      1  043900           PERFORM PASS                                           NC2054.2 294
   000436      1  044000           GO TO CON-WRITE-GF-2.                                  NC2054.2 445
   000437         044100     GO TO CON-FAIL-GF-2.                                         NC2054.2 441
   000438         044200 CON-DELETE-GF-2.                                                 NC2054.2
   000439         044300     PERFORM  DE-LETE.                                            NC2054.2 296
   000440         044400     GO TO CON-WRITE-GF-2.                                        NC2054.2 445
   000441         044500 CON-FAIL-GF-2.                                                   NC2054.2
   000442         044600     PERFORM  FAIL.                                               NC2054.2 295
   000443         044700     MOVE CONT-B   TO COMPUTED-N.                                 NC2054.2 50 156
   000444         044800     MOVE -999.777 TO CORRECT-N.                                  NC2054.2 170
   000445         044900 CON-WRITE-GF-2.                                                  NC2054.2
   000446         045000     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000447         045100*                                                                 NC2054.2
   000448         045200*    N.B. CONTIN-TEST-3 HAS BEEN REMOVED, AND SUBSEQUENT          NC2054.2
   000449         045300*    TESTS HAVE BEEN RE-NUMBERED.                                 NC2054.2
   000450         045400 CON-INIT-GF-3.                                                   NC2054.2
   000451         045500     MOVE     "  COMP CONDITIONAL" TO FEATURE.                    NC2054.2 140
   000452         045600     MOVE     "CON-TEST-GF-3" TO PAR-NAME.                        NC2054.2 144
   000453         045700 CON-TEST-GF-3.                                                   NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     MOVE     -10 TO CONT-B.                                      NC2054.2 50
   000455         045900     MOVE     10 TO CONT-C.                                       NC2054.2 51
   000456         046000     MOVE     1 TO CONT-D.                                        NC2054.2 52
   000457         046100     MOVE     0 TO CONT-E.                                        NC2054.2 53
   000458         046200     MOVE     10 TO CONT-F.                                       NC2054.2 54
   000459         046300     MOVE     -10 TO CONT-88.                                     NC2054.2 55
   000460         046400     IF       CONT-E EQUA                                         NC2054.2 53
   000461         046500-                        L TO ZERO                                NC2054.2 IMP
   000462         046600-                                 S AN                            NC2054.2
   000463         046700-                                     D GREATER                   NC2054.2 56
   000464         046800-                                              ZERO AND CONT-B    NC2054.2 50
   000465         046900              EQUAL TO CONT-C OR ((((((0                          NC2054.2 51
   000466         047000                                                                  NC2054.2
   000467         047100                                                                  NC2054.2
   000468         047200                                                                  NC2054.2
   000469         047300                                                                  NC2054.2
   000470         047400                                                                  NC2054.2
   000471         047500                                                                  NC2054.2
   000472         047600                                                                  NC2054.2
   000473         047700                                                                  NC2054.2
   000474         047800                                                                  NC2054.2
   000475         047900                                                                  NC2054.2
   000476         048000                                                                  NC2054.2
   000477         048100                                                                  NC2054.2
   000478         048200                                                                  NC2054.2
   000479         048300                                                                  NC2054.2
   000480         048400                                                                  NC2054.2
   000481         048500                                                                  NC2054.2
   000482         048600                                                                  NC2054.2
   000483         048700                                                                  NC2054.2
   000484         048800                                                                  NC2054.2
   000485         048900                                                                  NC2054.2
   000486         049000                                                                  NC2054.2
   000487         049100                                                                  NC2054.2
   000488         049200                                                                  NC2054.2
   000489         049300                                                                  NC2054.2
   000490         049400                                                                  NC2054.2
   000491         049500                                                                  NC2054.2
   000492         049600                                                                  NC2054.2
   000493         049700                                                                  NC2054.2
   000494         049800                                                                  NC2054.2
   000495         049900                                                                  NC2054.2
   000496         050000                                                                  NC2054.2
   000497         050100                                                                  NC2054.2
   000498         050200                                                                  NC2054.2
   000499         050300                                                                  NC2054.2
   000500         050400                                                                  NC2054.2
   000501         050500                                                                  NC2054.2
   000502         050600                                                                  NC2054.2
   000503         050700                                                                  NC2054.2
   000504         050800                                                                  NC2054.2
   000505         050900                                                                  NC2054.2
   000506         051000                                                                  NC2054.2
   000507         051100                                                                  NC2054.2
   000508         051200                                                                  NC2054.2
   000509         051300                                                                  NC2054.2
   000510         051400                                                                  NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500                                                                  NC2054.2
   000512         051600                                                                  NC2054.2
   000513         051700                                                                  NC2054.2
   000514         051800                                                                  NC2054.2
   000515         051900                                                                  NC2054.2
   000516         052000                                                                  NC2054.2
   000517         052100                                                                  NC2054.2
   000518         052200                                                                  NC2054.2
   000519         052300                                                                  NC2054.2
   000520         052400                                                                  NC2054.2
   000521         052500                                                                  NC2054.2
   000522         052600                                                                  NC2054.2
   000523         052700                                                                  NC2054.2
   000524         052800                                                                  NC2054.2
   000525         052900                                                                  NC2054.2
   000526         053000                                                                  NC2054.2
   000527         053100                                                                  NC2054.2
   000528         053200                                                                  NC2054.2
   000529         053300                                                                  NC2054.2
   000530         053400                                                                  NC2054.2
   000531         053500                                                                  NC2054.2
   000532         053600                                                                  NC2054.2
   000533         053700                                                                  NC2054.2
   000534         053800                                                                  NC2054.2
   000535         053900                                                                  NC2054.2
   000536         054000                                                                  NC2054.2
   000537         054100                                                                  NC2054.2
   000538         054200                                                                  NC2054.2
   000539         054300                                                                  NC2054.2
   000540         054400                                                                  NC2054.2
   000541         054500                                                                  NC2054.2
   000542         054600                                                                  NC2054.2
   000543         054700                                                                  NC2054.2
   000544         054800                                                                  NC2054.2
   000545         054900                                                                  NC2054.2
   000546         055000              - CONT-D EQUAL TO CONT-D O                          NC2054.2 52 52
   000547         055100-                                             R -11 + CONT-F))))))NC2054.2 54
   000548         055200              AND N                                               NC2054.2
   000549         055300-                            OT NEGATIVE                          NC2054.2 57
   000550         055400-                                       ZERO                      NC2054.2
   000551      1  055500              PERFORM PASS                                        NC2054.2 294
   000552         055600         EL                                                       NC2054.2
   000553         055700-          SE                                                     NC2054.2
   000554      1  055800              GO TO CON-FAIL-GF-3.                                NC2054.2 563
   000555         055900     GO       TO CON-WRITE-GF-3.                                  NC2054.2 565
   000556         056000 CON-DELETE-GF-3.                                                 NC2054.2
   000557         056100     PERFORM  DE-LETE.                                            NC2054.2 296
   000558         056200     GO TO CON-WRITE-GF-3.                                        NC2054.2 565
   000559         056300                                                                  NC2054.2
   000560         056400                                                                  NC2054.2
   000561         056500                                                                  NC2054.2
   000562         056600                                                                  NC2054.2
   000563         056700 CON-FAIL-GF-3.                                                   NC2054.2
   000564         056800     PERFORM FAIL.                                                NC2054.2 295
   000565         056900 CON-WRITE-GF-3.                                                  NC2054.2
   000566         057000     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000567         057100*                                                                 NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200 CON-INIT-GF-4.                                                   NC2054.2
   000569         057300     MOVE     "  RESERVED WORDS" TO FEATURE                       NC2054.2 140
   000570         057400     MOVE     "CON-TEST-GF-4" TO PAR-NAME.                        NC2054.2 144
   000571         057500     MOVE     54321 TO CONT-D.                                    NC2054.2 52
   000572         057600     MOVE     12 TO CONT-E.                                       NC2054.2 53
   000573         057700     MOVE     1199997 TO CONT-C.                                  NC2054.2 51
   000574         057800 CON-TEST-GF-4.                                                   NC2054.2
   000575         057900     DIV                                                          NC2054.2
   000576         058000-       ID                                                        NC2054.2
   000577         058100-         E   CONT-E IN                                           NC2054.2 53
   000578         058200-                      TO CONT-C GIV                              NC2054.2 51
   000579         058300-                                   IN                            NC2054.2
   000580         058400-                                     G CONT-D ROUN               NC2054.2 52
   000581         058500-                                                  DE             NC2054.2
   000582         058600-                                                    D O          NC2054.2
   000583         058700-                                                       N SIZE ERRNC2054.2
   000584      1  058800-    OR       PERFOR                                              NC2054.2
   000585      1  058900-                   M PASS G                                      NC2054.2 294
   000586      1  059000-                           O T                                   NC2054.2
   000587      1  059100-                              O CON-WRITE-GF-4.                  NC2054.2 597
   000588         059200     GO       TO CON-FAIL-GF-4.                                   NC2054.2 592
   000589         059300 CON-DELETE-GF-4.                                                 NC2054.2
   000590         059400     PERFORM  DE-LETE.                                            NC2054.2 296
   000591         059500     GO       TO CON-WRITE-GF-4.                                  NC2054.2 597
   000592         059600 CON-FAIL-GF-4.                                                   NC2054.2
   000593         059700     PERFORM  FAIL.                                               NC2054.2 295
   000594         059800     MOVE     CONT-D TO COMPUTED-N.                               NC2054.2 52 156
   000595         059900     MOVE     54321 TO CORRECT-N.                                 NC2054.2 170
   000596         060000     MOVE     "SIZE ERROR EXPECTED" TO RE-MARK.                   NC2054.2 149
   000597         060100 CON-WRITE-GF-4.                                                  NC2054.2
   000598         060200     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000599         060300*                                                                 NC2054.2
   000600         060400 CON-INIT-GF-5.                                                   NC2054.2
   000601         060500     MOVE     "  DATA-NAMES" TO FEATURE.                          NC2054.2 140
   000602         060600     MOVE     "CON-TEST-GF-5" TO PAR-NAME.                        NC2054.2 144
   000603         060700     MOVE     10000 TO CONT-D.                                    NC2054.2 52
   000604         060800     MOVE     1000 TO CONT-F.                                     NC2054.2 54
   000605         060900     MOVE     ZERO TO CONT-C.                                     NC2054.2 IMP 51
   000606         061000 CON-TEST-GF-5.                                                   NC2054.2
   000607         061100     IF       CONT                                                NC2054.2 52
   000608      1  061200-                 -D EQUAL TO 10000 ADD CONT                      NC2054.2 52
   000609      1  061300-                                           -D CONT               NC2054.2 54
   000610      1  061400-                                                  -F GIVING CONT-NC2054.2 51
   000611      1  061500-    C.                                                           NC2054.2
   000612         061600     IF       CONT-C EQUAL TO 11000                               NC2054.2 51
   000613      1  061700              PERFORM PASS GO TO CON-WRITE-GF-5.                  NC2054.2 294 622
   000614         061800     GO       TO CON-FAIL-GF-5.                                   NC2054.2 618
   000615         061900 CON-DELETE-GF-5.                                                 NC2054.2
   000616         062000     PERFORM  DE-LETE.                                            NC2054.2 296
   000617         062100     GO       TO CON-WRITE-GF-5.                                  NC2054.2 622
   000618         062200 CON-FAIL-GF-5.                                                   NC2054.2
   000619         062300     PERFORM  FAIL.                                               NC2054.2 295
   000620         062400     MOVE     CONT-C TO COMPUTED-A.                               NC2054.2 51 155
   000621         062500     MOVE     11000 TO CORRECT-A.                                 NC2054.2 169
   000622         062600 CON-WRITE-GF-5.                                                  NC2054.2
   000623         062700     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000624         062800*                                                                 NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900 CON-TEST-GF-6.                                                   NC2054.2
   000626         063000     MOVE     "CON-TEST-GF-6" TO PAR-NAME.                        NC2054.2 144
   000627         063100     MOVE     "  PARAGRAPH-NAMES" TO FEATURE.                     NC2054.2 140
   000628         063200     PERFORM  PA                                                  NC2054.2 294
   000629         063300-               SS.                                               NC2054.2
   000630         063400     IF       P-OR-F NOT EQUAL TO "PASS" GO TO CON-FAIL-GF-6.     NC2054.2 142 638
   000631         063500     GO       TO CON                                              NC2054.2 641
   000632         063600-                   -WRITE-GF-6.                                  NC2054.2
   000633         063700 CON-TEST-GF-6-1.                                                 NC2054.2
   000634         063800     GO       TO CON-FAIL-GF-6.                                   NC2054.2 638
   000635         063900 CON-DELETE-GF-6.                                                 NC2054.2
   000636         064000     PERFORM  DE-LETE.                                            NC2054.2 296
   000637         064100     GO       TO CON-WRITE-GF-6.                                  NC2054.2 641
   000638         064200 CON-FAIL-GF-6.                                                   NC2054.2
   000639         064300     PERFORM  FAIL.                                               NC2054.2 295
   000640         064400     MOVE     "CNTD PARA-NAME NOT FOUND" TO RE-MARK.              NC2054.2 149
   000641         064500 CON-WRITE-GF-6.                                                  NC2054.2
   000642         064600     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000643         064700*                                                                 NC2054.2
   000644         064800*    N.B. THE REFERENCE TO THE OLD TEST CALLED                    NC2054.2
   000645         064900*        CONTIN-TEST-8 HAS BEEN REMOVED.                          NC2054.2
   000646         065000*        NOTE TEST MOVED TO SQ215.                                NC2054.2
   000647         065100*                                                                 NC2054.2
   000648         065200 CON-INIT-GF-7.                                                   NC2054.2
   000649         065300     MOVE     "  RECORD, ITEM DESCR" TO FEATURE.                  NC2054.2 140
   000650         065400     MOVE     "CON-TEST-GF-7" TO PAR-NAME.                        NC2054.2 144
   000651         065500*     N.B.  CONT-A IS NOT EXPLICITLY INITIALISED HERE             NC2054.2
   000652         065600*           BECAUSE THE -VALUE IS- CLAUSE OF THE                  NC2054.2
   000653         065700*           DEFINITION IS UNDER TEST IN THE NEXT PARAGRAPH.       NC2054.2
   000654         065800 CON-TEST-GF-7.                                                   NC2054.2
   000655         065900     MOVE     CONT-A TO CONT-GRP.                                 NC2054.2 45 131
   000656         066000     IF LEVEL-04 EQUAL TO "GOVERNMENT"                            NC2054.2 136
   000657      1  066100              PERFORM PASS                                        NC2054.2 294
   000658      1  066200              GO TO CON-WRITE-GF-7.                               NC2054.2 667
   000659         066300     GO TO CON-FAIL-GF-7.                                         NC2054.2 663
   000660         066400 CON-DELETE-GF-7.                                                 NC2054.2
   000661         066500     PERFORM  DE-LETE.                                            NC2054.2 296
   000662         066600     GO       TO CON-WRITE-GF-7.                                  NC2054.2 667
   000663         066700 CON-FAIL-GF-7.                                                   NC2054.2
   000664         066800     PERFORM  FAIL.                                               NC2054.2 295
   000665         066900     MOVE     LEVEL-04 TO COMPUTED-A.                             NC2054.2 136 155
   000666         067000     MOVE     "GOVERNMENT"  TO CORRECT-A.                         NC2054.2 169
   000667         067100 CON-WRITE-GF-7.                                                  NC2054.2
   000668         067200     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000669         067300 CON-INIT-GF-8.                                                   NC2054.2
   000670         067400     MOVE     "SPACES BETWEEN WORDS" TO FEATURE.                  NC2054.2 140
   000671         067500     MOVE     "CON-TEST-GF-10" TO PAR-NAME.                       NC2054.2 144
   000672         067600     MOVE     "ABCDE12345"     TO SPACING-77.                     NC2054.2 60
   000673         067700 CON-TEST-GF-8.                                                   NC2054.2
   000674         067800     MOVE     SPACING-77 TO SPACING-01.                           NC2054.2 60 129
   000675         067900     IF       SPACING-4 EQUAL TO "CDE12345"                       NC2054.2 130
   000676      1  068000              PERFORM PASS GO TO CON-WRITE-GF-8.                  NC2054.2 294 685
   000677         068100     GO       TO CON-FAIL-GF-8.                                   NC2054.2 681
   000678         068200 CON-DELETE-GF-8.                                                 NC2054.2
   000679         068300     PERFORM  DE-LETE.                                            NC2054.2 296
   000680         068400     GO       TO CON-WRITE-GF-8.                                  NC2054.2 685
   000681         068500 CON-FAIL-GF-8.                                                   NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     PERFORM  FAIL.                                               NC2054.2 295
   000683         068700     MOVE     SPACING-4 TO COMPUTED-A.                            NC2054.2 130 155
   000684         068800     MOVE     "CDE12345" TO CORRECT-A.                            NC2054.2 169
   000685         068900 CON-WRITE-GF-8.                                                  NC2054.2
   000686         069000     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000687         069100*                                                                 NC2054.2
   000688         069200 CON-INIT-GF-9.                                                   NC2054.2
   000689         069300     MOVE   "CON-WRITE-GF-9" TO PAR-NAME.                         NC2054.2 144
   000690         069400     MOVE     1234567890   TO SPACING-SEND.                       NC2054.2 66
   000691         069500     MOVE     SPACING-SEND TO SPACING-RECEIVE.                    NC2054.2 66 67
   000692         069600 CON-TEST-GF-9.                                                   NC2054.2
   000693         069700     IF       SPACING-RECEIVE EQUAL TO 1234567890                 NC2054.2 67
   000694      1  069800              PERFORM                                             NC2054.2
   000695         069900                                                                  NC2054.2
   000696         070000                                                                  NC2054.2
   000697         070100                                                                  NC2054.2
   000698         070200                                                                  NC2054.2
   000699         070300                                                                  NC2054.2
   000700         070400                                                                  NC2054.2
   000701         070500                                                                  NC2054.2
   000702         070600                                                                  NC2054.2
   000703         070700                                                                  NC2054.2
   000704         070800                                                                  NC2054.2
   000705         070900                                                                  NC2054.2
   000706         071000                                                                  NC2054.2
   000707         071100                                                                  NC2054.2
   000708         071200                                                                  NC2054.2
   000709         071300                                                                  NC2054.2
   000710         071400                                                                  NC2054.2
   000711         071500                                                                  NC2054.2
   000712         071600                                                                  NC2054.2
   000713         071700                                                                  NC2054.2
   000714         071800                                                                  NC2054.2
   000715         071900                                                                  NC2054.2
   000716         072000                                                                  NC2054.2
   000717         072100                                                                  NC2054.2
   000718         072200                                                                  NC2054.2
   000719         072300                                                                  NC2054.2
   000720         072400                                                                  NC2054.2
   000721         072500                                                                  NC2054.2
   000722         072600                                                                  NC2054.2
   000723         072700                                                                  NC2054.2
   000724         072800                                                                  NC2054.2
   000725         072900                                                                  NC2054.2
   000726         073000                                                                  NC2054.2
   000727         073100                                                                  NC2054.2
   000728         073200                                                                  NC2054.2
   000729         073300                                                                  NC2054.2
   000730         073400                                                                  NC2054.2
   000731         073500                                                                  NC2054.2
   000732         073600                                                                  NC2054.2
   000733         073700                                                                  NC2054.2
   000734         073800                                                                  NC2054.2
   000735         073900                                                                  NC2054.2
   000736         074000                                                                  NC2054.2
   000737         074100                                                                  NC2054.2
   000738         074200                                                                  NC2054.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300                                                                  NC2054.2
   000740         074400                                                                  NC2054.2
   000741         074500                                                                  NC2054.2
   000742         074600                                                                  NC2054.2
   000743         074700                                                                  NC2054.2
   000744         074800                                                                  NC2054.2
   000745         074900                                                                  NC2054.2
   000746         075000                                                                  NC2054.2
   000747         075100                                                                  NC2054.2
   000748         075200                                                                  NC2054.2
   000749         075300                                                                  NC2054.2
   000750         075400                                                                  NC2054.2
   000751         075500                                                                  NC2054.2
   000752         075600                                                                  NC2054.2
   000753         075700                                                                  NC2054.2
   000754         075800                                                                  NC2054.2
   000755         075900                                                                  NC2054.2
   000756         076000                                                                  NC2054.2
   000757         076100                                                                  NC2054.2
   000758         076200                                                                  NC2054.2
   000759         076300                                                                  NC2054.2
   000760         076400                                                                  NC2054.2
   000761         076500                                                                  NC2054.2
   000762         076600                                                                  NC2054.2
   000763         076700                                                                  NC2054.2
   000764         076800                                                                  NC2054.2
   000765      1  076900                      PA                                          NC2054.2 294
   000766      1  077000-                       SS GO TO CON-WRITE-GF-9.                  NC2054.2 775
   000767         077100     GO                 TO CON-FAIL-GF-9.                         NC2054.2 771
   000768         077200 CON-DELETE-GF-9.                                                 NC2054.2
   000769         077300     PERFORM  DE-LETE.                                            NC2054.2 296
   000770         077400     GO       TO CON-WRITE-GF-9.                                  NC2054.2 775
   000771         077500 CON-FAIL-GF-9.                                                   NC2054.2
   000772         077600     PERFORM  FAIL.                                               NC2054.2 295
   000773         077700     MOVE     SPACING-RECEIVE TO COMPUTED-18V0.                   NC2054.2 67 162
   000774         077800     MOVE     1234567890 TO CORRECT-18V0.                         NC2054.2 175
   000775         077900 CON-WRITE-GF-9.                                                  NC2054.2
   000776         078000     PERFORM PRINT-DETAIL.                                        NC2054.2 298
   000777         078100*                                                                 NC2054.2
   000778         078200 CON-INIT-GF-10.                                                  NC2054.2
   000779         078300*    ===-->  PICTURE CHARACTER STRING CONTINUED  <--===           NC2054.2
   000780         078400     MOVE   "IV-44 7.2.2"              TO ANSI-REFERENCE.         NC2054.2 200
   000781         078500     MOVE   "PICTURE STRING CONTINUED" TO FEATURE                 NC2054.2 140
   000782         078600     MOVE   "CON-TEST-GF-10"           TO PAR-NAME.               NC2054.2 144
   000783         078700 CON-TEST-GF-10-1.                                                NC2054.2
   000784         078800     MOVE    654321.987654 TO WS-TEST-12-DATA.                    NC2054.2 40
   000785         078900     IF WS-TEST-12-DATA = 654321.987654                           NC2054.2 40
   000786      1  079000             PERFORM PASS                                         NC2054.2 294
   000787      1  079100             GO TO CON-WRITE-GF-10.                               NC2054.2 796
   000788         079200     GO TO CON-FAIL-GF-10.                                        NC2054.2 792
   000789         079300 CON-DELETE-GF-10.                                                NC2054.2
   000790         079400     PERFORM DE-LETE.                                             NC2054.2 296
   000791         079500     GO TO   CON-WRITE-GF-10.                                     NC2054.2 796
   000792         079600 CON-FAIL-GF-10.                                                  NC2054.2
   000793         079700     PERFORM  FAIL.                                               NC2054.2 295
   000794         079800     MOVE     WS-TEST-12-DATA TO COMPUTED-N.                      NC2054.2 40 156
   000795         079900     MOVE     654321.987654   TO CORRECT-N.                       NC2054.2 170
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000 CON-WRITE-GF-10.                                                 NC2054.2
   000797         080100     PERFORM  PRINT-DETAIL.                                       NC2054.2 298
   000798         080200 CCVS-EXIT SECTION.                                               NC2054.2
   000799         080300 CCVS-999999.                                                     NC2054.2
   000800         080400     GO TO CLOSE-FILES.                                           NC2054.2 287
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    18
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      200   ANSI-REFERENCE . . . . . . . .  372 379 388 M397 M780
      179   CCVS-C-1 . . . . . . . . . . .  316 358
      184   CCVS-C-2 . . . . . . . . . . .  317 359
      234   CCVS-E-1 . . . . . . . . . . .  322
      239   CCVS-E-2 . . . . . . . . . . .  331 338 345 350
      242   CCVS-E-2-2 . . . . . . . . . .  M330
      247   CCVS-E-3 . . . . . . . . . . .  351
      256   CCVS-E-4 . . . . . . . . . . .  330
      257   CCVS-E-4-1 . . . . . . . . . .  M328
      259   CCVS-E-4-2 . . . . . . . . . .  M329
      201   CCVS-H-1 . . . . . . . . . . .  311
      206   CCVS-H-2A. . . . . . . . . . .  312
      215   CCVS-H-2B. . . . . . . . . . .  313
      227   CCVS-H-3 . . . . . . . . . . .  314
      277   CCVS-PGM-ID. . . . . . . . . .  283 283
      161   CM-18V0
      155   COMPUTED-A . . . . . . . . . .  156 158 159 160 161 384 387 M620 M665 M683
      156   COMPUTED-N . . . . . . . . . .  M417 M443 M594 M794
      154   COMPUTED-X . . . . . . . . . .  M306 370
      158   COMPUTED-0V18
      160   COMPUTED-14V4
      162   COMPUTED-18V0. . . . . . . . .  M773
      159   COMPUTED-4V14
       45   CONT-A . . . . . . . . . . . .  655
       50   CONT-B . . . . . . . . . . . .  M407 408 417 M433 434 443 M454 464
       51   CONT-C . . . . . . . . . . . .  M455 465 M573 578 M605 M610 612 620
       52   CONT-D . . . . . . . . . . . .  M456 546 546 M571 M580 594 M603 607 608
       53   CONT-E . . . . . . . . . . . .  M457 460 M572 577
       54   CONT-F . . . . . . . . . . . .  M458 547 M604 609
      131   CONT-GRP . . . . . . . . . . .  M655
       55   CONT-88. . . . . . . . . . . .  M459
      178   COR-ANSI-REFERENCE . . . . . .  M379 M381
      169   CORRECT-A. . . . . . . . . . .  170 171 172 173 174 385 387 M621 M666 M684
      170   CORRECT-N. . . . . . . . . . .  M418 M444 M595 M795
      168   CORRECT-X. . . . . . . . . . .  M307 371
      171   CORRECT-0V18
      173   CORRECT-14V4
      175   CORRECT-18V0 . . . . . . . . .  M774
      172   CORRECT-4V14
      174   CR-18V0
      192   DELETE-COUNTER . . . . . . . .  M296 325 341 343
      147   DOTVALUE . . . . . . . . . . .  M301
      198   DUMMY-HOLD . . . . . . . . . .  M355 361
       38   DUMMY-RECORD . . . . . . . . .  M311 M312 M313 M314 M316 M317 M318 M320 M322 M331 M338 M345 M350 M351 355 M356
                                            357 M358 M359 M360 M361 365 M366 M374 M389
      245   ENDER-DESC . . . . . . . . . .  M333 M344 M349
      193   ERROR-COUNTER. . . . . . . . .  M295 324 334 337
      197   ERROR-HOLD . . . . . . . . . .  M324 M325 M325 M326 329
      243   ERROR-TOTAL. . . . . . . . . .  M335 M337 M342 M343 M347 M348
      140   FEATURE. . . . . . . . . . . .  M396 M401 M424 M451 M569 M601 M627 M649 M670 M781
       56   GREATERZERO. . . . . . . . . .  463
      271   HYPHEN-LINE. . . . . . . . . .  318 320 360
      237   ID-AGAIN . . . . . . . . . . .  M283
      270   INF-ANSI-REFERENCE . . . . . .  M372 M375 M388 M390
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    19
0 Defined   Cross-reference of data names   References

0     265   INFO-TEXT. . . . . . . . . . .  M373
      194   INSPECT-COUNTER. . . . . . . .  M293 324 346 348
      133   LEVEL-02
      134   LEVEL-03
      136   LEVEL-04 . . . . . . . . . . .  656 665
       57   NEGATIVEZERO . . . . . . . . .  549
      142   P-OR-F . . . . . . . . . . . .  M293 M294 M295 M296 303 M306 630
      144   PAR-NAME . . . . . . . . . . .  M308 M400 M423 M452 M570 M602 M626 M650 M671 M689 M782
      146   PARDOT-X . . . . . . . . . . .  M300
      195   PASS-COUNTER . . . . . . . . .  M294 326 328
       36   PRINT-FILE . . . . . . . . . .  32 282 288
       37   PRINT-REC. . . . . . . . . . .  M302 M378 M380
       43   PROCEDUREDIVISION
      149   RE-MARK. . . . . . . . . . . .  M297 M309 M596 M640
      191   REC-CT . . . . . . . . . . . .  299 301 308
      190   REC-SKL-SUB
      199   RECORD-COUNT . . . . . . . . .  M353 354 M362
       67   SPACING-RECEIVE. . . . . . . .  M691 693 773
       66   SPACING-SEND . . . . . . . . .  M690 691
      129   SPACING-01 . . . . . . . . . .  M674
      129   SPACING-02
      129   SPACING-03
      130   SPACING-2
      130   SPACING-3
      130   SPACING-4. . . . . . . . . . .  675 683
       60   SPACING-77 . . . . . . . . . .  M672 674
      150   TEST-COMPUTED. . . . . . . . .  378
      165   TEST-CORRECT . . . . . . . . .  380
      218   TEST-ID. . . . . . . . . . . .  M283
      138   TEST-RESULTS . . . . . . . . .  M284 302
      196   TOTAL-ERROR
       40   WS-TEST-12-DATA. . . . . . . .  M784 785 794
      267   XXCOMPUTED . . . . . . . . . .  M387
      269   XXCORRECT. . . . . . . . . . .  M387
      262   XXINFO . . . . . . . . . . . .  374 389
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    20
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

      383   BAIL-OUT . . . . . . . . . . .  P305
      391   BAIL-OUT-EX. . . . . . . . . .  E305 G385
      386   BAIL-OUT-WRITE . . . . . . . .  G384
      367   BLANK-LINE-PRINT
      798   CCVS-EXIT
      799   CCVS-999999
      280   CCVS1
      392   CCVS1-EXIT . . . . . . . . . .  G286
      287   CLOSE-FILES. . . . . . . . . .  G800
      315   COLUMN-NAMES-ROUTINE . . . . .  E285
      412   CON-DELETE-GF-1
      789   CON-DELETE-GF-10
      438   CON-DELETE-GF-2
      556   CON-DELETE-GF-3
      589   CON-DELETE-GF-4
      615   CON-DELETE-GF-5
      635   CON-DELETE-GF-6
      660   CON-DELETE-GF-7
      678   CON-DELETE-GF-8
      768   CON-DELETE-GF-9
      415   CON-FAIL-GF-1. . . . . . . . .  G411
      792   CON-FAIL-GF-10 . . . . . . . .  G788
      441   CON-FAIL-GF-2. . . . . . . . .  G437
      563   CON-FAIL-GF-3. . . . . . . . .  G554
      592   CON-FAIL-GF-4. . . . . . . . .  G588
      618   CON-FAIL-GF-5. . . . . . . . .  G614
      638   CON-FAIL-GF-6. . . . . . . . .  G630 G634
      663   CON-FAIL-GF-7. . . . . . . . .  G659
      681   CON-FAIL-GF-8. . . . . . . . .  G677
      771   CON-FAIL-GF-9. . . . . . . . .  G767
      395   CON-INIT-GF
      399   CON-INIT-GF-1
      778   CON-INIT-GF-10
      422   CON-INIT-GF-2
      450   CON-INIT-GF-3
      568   CON-INIT-GF-4
      600   CON-INIT-GF-5
      648   CON-INIT-GF-7
      669   CON-INIT-GF-8
      688   CON-INIT-GF-9
      402   CON-TEST-GF-1
      783   CON-TEST-GF-10-1
      425   CON-TEST-GF-2
      453   CON-TEST-GF-3
      574   CON-TEST-GF-4
      606   CON-TEST-GF-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    21
0 Defined   Cross-reference of procedures   References

0     625   CON-TEST-GF-6
      633   CON-TEST-GF-6-1
      654   CON-TEST-GF-7
      673   CON-TEST-GF-8
      692   CON-TEST-GF-9
      419   CON-WRITE-GF-1 . . . . . . . .  G410 G414
      796   CON-WRITE-GF-10. . . . . . . .  G787 G791
      445   CON-WRITE-GF-2 . . . . . . . .  G436 G440
      565   CON-WRITE-GF-3 . . . . . . . .  G555 G558
      597   CON-WRITE-GF-4 . . . . . . . .  G587 G591
      622   CON-WRITE-GF-5 . . . . . . . .  G613 G617
      641   CON-WRITE-GF-6 . . . . . . . .  G631 G637
      667   CON-WRITE-GF-7 . . . . . . . .  G658 G662
      685   CON-WRITE-GF-8 . . . . . . . .  G676 G680
      775   CON-WRITE-GF-9 . . . . . . . .  G766 G770
      296   DE-LETE. . . . . . . . . . . .  P413 P439 P557 P590 P616 P636 P661 P679 P769 P790
      319   END-ROUTINE. . . . . . . . . .  P288
      323   END-ROUTINE-1
      332   END-ROUTINE-12
      340   END-ROUTINE-13 . . . . . . . .  E288
      321   END-RTN-EXIT
      295   FAIL . . . . . . . . . . . . .  P416 P442 P564 P593 P619 P639 P664 P682 P772 P793
      369   FAIL-ROUTINE . . . . . . . . .  P304
      382   FAIL-ROUTINE-EX. . . . . . . .  E304 G376
      377   FAIL-ROUTINE-WRITE . . . . . .  G370 G371
      310   HEAD-ROUTINE . . . . . . . . .  P285
      293   INSPT
      281   OPEN-FILES
      294   PASS . . . . . . . . . . . . .  P409 P435 P551 P585 P613 P628 P657 P676 P765 P786
      298   PRINT-DETAIL . . . . . . . . .  P398 P420 P446 P566 P598 P623 P642 P668 P686 P776 P797
      394   SECT-NC205A-001
      291   TERMINATE-CALL
      289   TERMINATE-CCVS
      352   WRITE-LINE . . . . . . . . . .  P302 P303 P311 P312 P313 P314 P316 P317 P318 P320 P322 P331 P339 P345 P350 P351
                                            P374 P378 P380 P389
      364   WRT-LN . . . . . . . . . . . .  P358 P359 P360 P363 P368
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    22
0 Defined   Cross-reference of programs     References

        3   NC205A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC205A    Date 06/04/2022  Time 11:59:29   Page    23
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC205A:
 *    Source records = 800
 *    Data Division statements = 87
 *    Procedure Division statements = 272
 *    Generated COBOL statements = 0
 *    Program complexity factor = 280
0End of compilation 1,  program NC205A,  highest severity 0.
0Return code 0
