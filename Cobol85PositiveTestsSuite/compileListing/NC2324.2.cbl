1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:57   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:57:57   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2324.2
   000002         000200 PROGRAM-ID.                                                      NC2324.2
   000003         000300     NC232A.                                                      NC2324.2
   000004         000500*                                                              *  NC2324.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2324.2
   000006         000700*                                                              *  NC2324.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2324.2
   000008         000900*                                                              *  NC2324.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2324.2
   000010         001100*                                                              *  NC2324.2
   000011         001300*                                                              *  NC2324.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2324.2
   000013         001500*                                                              *  NC2324.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2324.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2324.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2324.2
   000017         001900*                                                              *  NC2324.2
   000018         002100                                                                  NC2324.2
   000019         002200*                                                                 NC2324.2
   000020         002300*    PROGRAM NC232A USES FORMAT 1 OF THE "SEARCH" STATEMENT TO *  NC2324.2
   000021         002400*    ACCESS A THREE DIMENSIONAL TABLE.  THE OPTIONAL "VARYING" *  NC2324.2
   000022         002500*    PHRASE IS USED WITH AN INDEX-NAME.                        *  NC2324.2
   000023         002600*                                                              *  NC2324.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2324.2
   000025         002900 CONFIGURATION SECTION.                                           NC2324.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2324.2
   000027         003100     XXXXX082.                                                    NC2324.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2324.2
   000029         003300     XXXXX083.                                                    NC2324.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2324.2
   000031         003500 FILE-CONTROL.                                                    NC2324.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2324.2 36
   000033         003700     XXXXX055.                                                    NC2324.2
   000034         003800 DATA DIVISION.                                                   NC2324.2
   000035         003900 FILE SECTION.                                                    NC2324.2
   000036         004000 FD  PRINT-FILE.                                                  NC2324.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2324.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2324.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2324.2
   000040         004400 77  SUB-1              PICTURE S99  VALUE ZERO.                  NC2324.2 IMP
   000041         004500 77  SUB-2              PICTURE 99   VALUE ZERO.                  NC2324.2 IMP
   000042         004600 77  SUB-3              PICTURE 99   VALUE ZERO.                  NC2324.2 IMP
   000043         004700 77  CON-7              PICTURE 99  VALUE 07.                     NC2324.2
   000044         004800 77  CON-10             PICTURE 99  VALUE 10.                     NC2324.2
   000045         004900 77  ELEM-HOLD-AREA               PICTURE X(15)  VALUE SPACES.    NC2324.2 IMP
   000046         005000 77  CON-5              PICTURE 99  VALUE 05.                     NC2324.2
   000047         005100 77  SEC-HOLD-AREA                PICTURE X(11)  VALUE SPACES.    NC2324.2 IMP
   000048         005200 77  CON-6              PICTURE 99  VALUE 06.                     NC2324.2
   000049         005300 77  GRP-HOLD-AREA                PICTURE X(5)  VALUE SPACES.     NC2324.2 IMP
   000050         005400 01  GRP-NAME.                                                    NC2324.2
   000051         005500     02  FILLER              PICTURE XXX    VALUE "GRP".          NC2324.2
   000052         005600     02  ADD-GRP             PICTURE 99     VALUE 01.             NC2324.2
   000053         005700                                                                  NC2324.2
   000054         005800 01  SEC-NAME.                                                    NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     02  FILLER              PICTURE X(5)   VALUE "SEC (".        NC2324.2
   000056         006000     02  SEC-GRP             PICTURE 99     VALUE 00.             NC2324.2
   000057         006100     02  FILLER              PICTURE X      VALUE ",".            NC2324.2
   000058         006200     02  ADD-SEC             PICTURE 99     VALUE 01.             NC2324.2
   000059         006300     02  FILLER              PICTURE X      VALUE ")".            NC2324.2
   000060         006400                                                                  NC2324.2
   000061         006500 01  ELEM-NAME.                                                   NC2324.2
   000062         006600     02  FILLER              PICTURE X(6)   VALUE "ELEM (".       NC2324.2
   000063         006700     02  ELEM-GRP            PICTURE 99     VALUE 00.             NC2324.2
   000064         006800     02  FILLER              PICTURE X      VALUE ",".            NC2324.2
   000065         006900     02  ELEM-SEC            PICTURE 99     VALUE 00.             NC2324.2
   000066         007000     02  FILLER              PICTURE X      VALUE ",".            NC2324.2
   000067         007100     02  ADD-ELEM            PICTURE 99     VALUE 01.             NC2324.2
   000068         007200     02  FILLER              PICTURE X      VALUE ")".            NC2324.2
   000069         007300                                                                  NC2324.2
   000070         007400 01  3-DIMENSION-TBL.                                             NC2324.2
   000071         007500     02  GRP-ENTRY OCCURS 10 TIMES INDEXED BY IDX-1.              NC2324.2
   000072         007600         03  ENTRY-1         PICTURE X(5).                        NC2324.2
   000073         007700         03  GRP2-ENTRY OCCURS 10 TIMES INDEXED BY IDX-2.         NC2324.2
   000074         007800             04  ENTRY-2     PICTURE X(11).                       NC2324.2
   000075         007900             04  GRP3-ENTRY OCCURS 10 TIMES INDEXED BY IDX-3.     NC2324.2
   000076         008000                 05  ENTRY-3 PICTURE X(15).                       NC2324.2
   000077         008100                                                                  NC2324.2
   000078         008200 01  END-STMT.                                                    NC2324.2
   000079         008300     02  FILLER              PICTURE X(7)  VALUE "AT END ".       NC2324.2
   000080         008400     02  END-IDX             PICTURE X(5)  VALUE SPACES.          NC2324.2 IMP
   000081         008500     02  FILLER              PICTURE XXX   VALUE " = ".           NC2324.2
   000082         008600     02  IDX-VALU            PICTURE 99    VALUE 00.              NC2324.2
   000083         008700     02  FILLER              PICTURE XXX   VALUE SPACES.          NC2324.2 IMP
   000084         008800 01  NOTE-1.                                                      NC2324.2
   000085         008900     02  FILLER                   PICTURE X(74)  VALUE            NC2324.2
   000086         009000     "NOTE 1 - CORRECT AND COMPUTED DATA ARE EQUAL BUT THE AT END NC2324.2
   000087         009100-    "PATH WAS TAKEN".                                            NC2324.2
   000088         009200     02  FILLER                   PICTURE X(46)  VALUE SPACES.    NC2324.2 IMP
   000089         009300 01  NOTE-2.                                                      NC2324.2
   000090         009400     02  FILLER                   PICTURE X(112)  VALUE           NC2324.2
   000091         009500     "NOTE 2 - CORRECT AND COMPUTED DATA ARE NOT EQUAL. THE COMPUTNC2324.2
   000092         009600-    "ED ENTRY WAS EXTRACTED FROM THE TABLE BY SUBSCRIPTS.".      NC2324.2
   000093         009700     02  FILLER                   PICTURE X(8)  VALUE SPACES.     NC2324.2 IMP
   000094         009800 01  TEST-RESULTS.                                                NC2324.2
   000095         009900     02 FILLER                   PIC X      VALUE SPACE.          NC2324.2 IMP
   000096         010000     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2324.2 IMP
   000097         010100     02 FILLER                   PIC X      VALUE SPACE.          NC2324.2 IMP
   000098         010200     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2324.2 IMP
   000099         010300     02 FILLER                   PIC X      VALUE SPACE.          NC2324.2 IMP
   000100         010400     02  PAR-NAME.                                                NC2324.2
   000101         010500       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2324.2 IMP
   000102         010600       03  PARDOT-X              PIC X      VALUE SPACE.          NC2324.2 IMP
   000103         010700       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2324.2 IMP
   000104         010800     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2324.2 IMP
   000105         010900     02 RE-MARK                  PIC X(61).                       NC2324.2
   000106         011000 01  TEST-COMPUTED.                                               NC2324.2
   000107         011100     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2324.2 IMP
   000108         011200     02 FILLER                   PIC X(17)  VALUE                 NC2324.2
   000109         011300            "       COMPUTED=".                                   NC2324.2
   000110         011400     02 COMPUTED-X.                                               NC2324.2
   000111         011500     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2324.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2324.2 111
   000113         011700                                 PIC -9(9).9(9).                  NC2324.2
   000114         011800     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2324.2 111
   000115         011900     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2324.2 111
   000116         012000     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2324.2 111
   000117         012100     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2324.2 111
   000118         012200         04 COMPUTED-18V0                    PIC -9(18).          NC2324.2
   000119         012300         04 FILLER                           PIC X.               NC2324.2
   000120         012400     03 FILLER PIC X(50) VALUE SPACE.                             NC2324.2 IMP
   000121         012500 01  TEST-CORRECT.                                                NC2324.2
   000122         012600     02 FILLER PIC X(30) VALUE SPACE.                             NC2324.2 IMP
   000123         012700     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2324.2
   000124         012800     02 CORRECT-X.                                                NC2324.2
   000125         012900     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2324.2 IMP
   000126         013000     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2324.2 125
   000127         013100     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2324.2 125
   000128         013200     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2324.2 125
   000129         013300     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2324.2 125
   000130         013400     03      CR-18V0 REDEFINES CORRECT-A.                         NC2324.2 125
   000131         013500         04 CORRECT-18V0                     PIC -9(18).          NC2324.2
   000132         013600         04 FILLER                           PIC X.               NC2324.2
   000133         013700     03 FILLER PIC X(2) VALUE SPACE.                              NC2324.2 IMP
   000134         013800     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2324.2 IMP
   000135         013900 01  CCVS-C-1.                                                    NC2324.2
   000136         014000     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2324.2
   000137         014100-    "SS  PARAGRAPH-NAME                                          NC2324.2
   000138         014200-    "       REMARKS".                                            NC2324.2
   000139         014300     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2324.2 IMP
   000140         014400 01  CCVS-C-2.                                                    NC2324.2
   000141         014500     02 FILLER                     PIC X        VALUE SPACE.      NC2324.2 IMP
   000142         014600     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2324.2
   000143         014700     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2324.2 IMP
   000144         014800     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2324.2
   000145         014900     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2324.2 IMP
   000146         015000 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2324.2 IMP
   000147         015100 01  REC-CT                        PIC 99       VALUE ZERO.       NC2324.2 IMP
   000148         015200 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2324.2 IMP
   000149         015300 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2324.2 IMP
   000150         015400 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2324.2 IMP
   000151         015500 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2324.2 IMP
   000152         015600 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2324.2 IMP
   000153         015700 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2324.2 IMP
   000154         015800 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2324.2 IMP
   000155         015900 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2324.2 IMP
   000156         016000 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2324.2 IMP
   000157         016100 01  CCVS-H-1.                                                    NC2324.2
   000158         016200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2324.2 IMP
   000159         016300     02  FILLER                    PIC X(42)    VALUE             NC2324.2
   000160         016400     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2324.2
   000161         016500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2324.2 IMP
   000162         016600 01  CCVS-H-2A.                                                   NC2324.2
   000163         016700   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2324.2 IMP
   000164         016800   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2324.2
   000165         016900   02  FILLER                        PIC XXXX   VALUE             NC2324.2
   000166         017000     "4.2 ".                                                      NC2324.2
   000167         017100   02  FILLER                        PIC X(28)  VALUE             NC2324.2
   000168         017200            " COPY - NOT FOR DISTRIBUTION".                       NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2324.2 IMP
   000170         017400                                                                  NC2324.2
   000171         017500 01  CCVS-H-2B.                                                   NC2324.2
   000172         017600   02  FILLER                        PIC X(15)  VALUE             NC2324.2
   000173         017700            "TEST RESULT OF ".                                    NC2324.2
   000174         017800   02  TEST-ID                       PIC X(9).                    NC2324.2
   000175         017900   02  FILLER                        PIC X(4)   VALUE             NC2324.2
   000176         018000            " IN ".                                               NC2324.2
   000177         018100   02  FILLER                        PIC X(12)  VALUE             NC2324.2
   000178         018200     " HIGH       ".                                              NC2324.2
   000179         018300   02  FILLER                        PIC X(22)  VALUE             NC2324.2
   000180         018400            " LEVEL VALIDATION FOR ".                             NC2324.2
   000181         018500   02  FILLER                        PIC X(58)  VALUE             NC2324.2
   000182         018600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2324.2
   000183         018700 01  CCVS-H-3.                                                    NC2324.2
   000184         018800     02  FILLER                      PIC X(34)  VALUE             NC2324.2
   000185         018900            " FOR OFFICIAL USE ONLY    ".                         NC2324.2
   000186         019000     02  FILLER                      PIC X(58)  VALUE             NC2324.2
   000187         019100     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2324.2
   000188         019200     02  FILLER                      PIC X(28)  VALUE             NC2324.2
   000189         019300            "  COPYRIGHT   1985 ".                                NC2324.2
   000190         019400 01  CCVS-E-1.                                                    NC2324.2
   000191         019500     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2324.2 IMP
   000192         019600     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2324.2
   000193         019700     02 ID-AGAIN                     PIC X(9).                    NC2324.2
   000194         019800     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2324.2 IMP
   000195         019900 01  CCVS-E-2.                                                    NC2324.2
   000196         020000     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2324.2 IMP
   000197         020100     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2324.2 IMP
   000198         020200     02 CCVS-E-2-2.                                               NC2324.2
   000199         020300         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2324.2 IMP
   000200         020400         03 FILLER                   PIC X      VALUE SPACE.      NC2324.2 IMP
   000201         020500         03 ENDER-DESC               PIC X(44)  VALUE             NC2324.2
   000202         020600            "ERRORS ENCOUNTERED".                                 NC2324.2
   000203         020700 01  CCVS-E-3.                                                    NC2324.2
   000204         020800     02  FILLER                      PIC X(22)  VALUE             NC2324.2
   000205         020900            " FOR OFFICIAL USE ONLY".                             NC2324.2
   000206         021000     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2324.2 IMP
   000207         021100     02  FILLER                      PIC X(58)  VALUE             NC2324.2
   000208         021200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2324.2
   000209         021300     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2324.2 IMP
   000210         021400     02 FILLER                       PIC X(15)  VALUE             NC2324.2
   000211         021500             " COPYRIGHT 1985".                                   NC2324.2
   000212         021600 01  CCVS-E-4.                                                    NC2324.2
   000213         021700     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2324.2 IMP
   000214         021800     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2324.2
   000215         021900     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2324.2 IMP
   000216         022000     02 FILLER                       PIC X(40)  VALUE             NC2324.2
   000217         022100      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2324.2
   000218         022200 01  XXINFO.                                                      NC2324.2
   000219         022300     02 FILLER                       PIC X(19)  VALUE             NC2324.2
   000220         022400            "*** INFORMATION ***".                                NC2324.2
   000221         022500     02 INFO-TEXT.                                                NC2324.2
   000222         022600       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2324.2 IMP
   000223         022700       04 XXCOMPUTED                 PIC X(20).                   NC2324.2
   000224         022800       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2324.2 IMP
   000225         022900       04 XXCORRECT                  PIC X(20).                   NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2324.2
   000227         023100 01  HYPHEN-LINE.                                                 NC2324.2
   000228         023200     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2324.2 IMP
   000229         023300     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2324.2
   000230         023400-    "*****************************************".                 NC2324.2
   000231         023500     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2324.2
   000232         023600-    "******************************".                            NC2324.2
   000233         023700 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2324.2
   000234         023800     "NC232A".                                                    NC2324.2
   000235         023900 PROCEDURE DIVISION.                                              NC2324.2
   000236         024000 CCVS1 SECTION.                                                   NC2324.2
   000237         024100 OPEN-FILES.                                                      NC2324.2
   000238         024200     OPEN     OUTPUT PRINT-FILE.                                  NC2324.2 36
   000239         024300     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2324.2 233 174 233 193
   000240         024400     MOVE    SPACE TO TEST-RESULTS.                               NC2324.2 IMP 94
   000241         024500     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2324.2 266 271
   000242         024600     GO TO CCVS1-EXIT.                                            NC2324.2 348
   000243         024700 CLOSE-FILES.                                                     NC2324.2
   000244         024800     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2324.2 275 296 36
   000245         024900 TERMINATE-CCVS.                                                  NC2324.2
   000246         025000     EXIT PROGRAM.                                                NC2324.2
   000247         025100 TERMINATE-CALL.                                                  NC2324.2
   000248         025200     STOP     RUN.                                                NC2324.2
   000249         025300 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2324.2 98 150
   000250         025400 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2324.2 98 151
   000251         025500 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2324.2 98 149
   000252         025600 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2324.2 98 148
   000253         025700     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2324.2 105
   000254         025800 PRINT-DETAIL.                                                    NC2324.2
   000255         025900     IF REC-CT NOT EQUAL TO ZERO                                  NC2324.2 147 IMP
   000256      1  026000             MOVE "." TO PARDOT-X                                 NC2324.2 102
   000257      1  026100             MOVE REC-CT TO DOTVALUE.                             NC2324.2 147 103
   000258         026200     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2324.2 94 37 308
   000259         026300     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2324.2 98 308
   000260      1  026400        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2324.2 325 338
   000261      1  026500          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2324.2 339 347
   000262         026600     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2324.2 IMP 98 IMP 110
   000263         026700     MOVE SPACE TO CORRECT-X.                                     NC2324.2 IMP 124
   000264         026800     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2324.2 147 IMP IMP 100
   000265         026900     MOVE     SPACE TO RE-MARK.                                   NC2324.2 IMP 105
   000266         027000 HEAD-ROUTINE.                                                    NC2324.2
   000267         027100     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2324.2 157 38 308
   000268         027200     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2324.2 162 38 308
   000269         027300     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2324.2 171 38 308
   000270         027400     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2324.2 183 38 308
   000271         027500 COLUMN-NAMES-ROUTINE.                                            NC2324.2
   000272         027600     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2324.2 135 38 308
   000273         027700     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2324.2 140 38 308
   000274         027800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2324.2 227 38 308
   000275         027900 END-ROUTINE.                                                     NC2324.2
   000276         028000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2324.2 227 38 308
   000277         028100 END-RTN-EXIT.                                                    NC2324.2
   000278         028200     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2324.2 190 38 308
   000279         028300 END-ROUTINE-1.                                                   NC2324.2
   000280         028400      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2324.2 149 153 150
   000281         028500      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2324.2 153 148 153
   000282         028600      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2324.2 151 153
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2324.2
   000284         028800      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2324.2 151 213
   000285         028900      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2324.2 153 215
   000286         029000      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2324.2 212 198
   000287         029100      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2324.2 195 38 308
   000288         029200  END-ROUTINE-12.                                                 NC2324.2
   000289         029300      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2324.2 201
   000290         029400     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2324.2 149 IMP
   000291      1  029500         MOVE "NO " TO ERROR-TOTAL                                NC2324.2 199
   000292         029600         ELSE                                                     NC2324.2
   000293      1  029700         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2324.2 149 199
   000294         029800     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2324.2 195 38
   000295         029900     PERFORM WRITE-LINE.                                          NC2324.2 308
   000296         030000 END-ROUTINE-13.                                                  NC2324.2
   000297         030100     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2324.2 148 IMP
   000298      1  030200         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2324.2 199
   000299      1  030300         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2324.2 148 199
   000300         030400     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2324.2 201
   000301         030500     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2324.2 195 38 308
   000302         030600      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2324.2 150 IMP
   000303      1  030700          MOVE "NO " TO ERROR-TOTAL                               NC2324.2 199
   000304      1  030800      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2324.2 150 199
   000305         030900      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2324.2 201
   000306         031000      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2324.2 195 38 308
   000307         031100     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2324.2 203 38 308
   000308         031200 WRITE-LINE.                                                      NC2324.2
   000309         031300     ADD 1 TO RECORD-COUNT.                                       NC2324.2 155
   000310         031400     IF RECORD-COUNT GREATER 50                                   NC2324.2 155
   000311      1  031500         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2324.2 38 154
   000312      1  031600         MOVE SPACE TO DUMMY-RECORD                               NC2324.2 IMP 38
   000313      1  031700         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2324.2 38
   000314      1  031800         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2324.2 135 38 320
   000315      1  031900         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2324.2 140 38 320
   000316      1  032000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2324.2 227 38 320
   000317      1  032100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2324.2 154 38
   000318      1  032200         MOVE ZERO TO RECORD-COUNT.                               NC2324.2 IMP 155
   000319         032300     PERFORM WRT-LN.                                              NC2324.2 320
   000320         032400 WRT-LN.                                                          NC2324.2
   000321         032500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2324.2 38
   000322         032600     MOVE SPACE TO DUMMY-RECORD.                                  NC2324.2 IMP 38
   000323         032700 BLANK-LINE-PRINT.                                                NC2324.2
   000324         032800     PERFORM WRT-LN.                                              NC2324.2 320
   000325         032900 FAIL-ROUTINE.                                                    NC2324.2
   000326         033000     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2324.2 110 IMP 333
   000327         033100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2324.2 124 IMP 333
   000328         033200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2324.2 156 226
   000329         033300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2324.2 221
   000330         033400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2324.2 218 38 308
   000331         033500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2324.2 IMP 226
   000332         033600     GO TO  FAIL-ROUTINE-EX.                                      NC2324.2 338
   000333         033700 FAIL-ROUTINE-WRITE.                                              NC2324.2
   000334         033800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2324.2 106 37 308
   000335         033900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2324.2 156 134
   000336         034000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2324.2 121 37 308
   000337         034100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2324.2 IMP 134
   000338         034200 FAIL-ROUTINE-EX. EXIT.                                           NC2324.2
   000339         034300 BAIL-OUT.                                                        NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2324.2 111 IMP 342
   000341         034500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2324.2 125 IMP 347
   000342         034600 BAIL-OUT-WRITE.                                                  NC2324.2
   000343         034700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2324.2 125 225 111 223
   000344         034800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2324.2 156 226
   000345         034900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2324.2 218 38 308
   000346         035000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2324.2 IMP 226
   000347         035100 BAIL-OUT-EX. EXIT.                                               NC2324.2
   000348         035200 CCVS1-EXIT.                                                      NC2324.2
   000349         035300     EXIT.                                                        NC2324.2
   000350         035400 SECT-NC232A-001 SECTION.                                         NC2324.2
   000351         035500 TH-03-001.                                                       NC2324.2
   000352         035600*                                                                 NC2324.2
   000353         035700 BUILD-LEVEL-1.                                                   NC2324.2

 ==000353==> IGYPS2015-I The paragraph or section prior to paragraph or section "BUILD-LEVEL-1"
                         did not contain any statements.

   000354         035800     ADD 1 TO SUB-1.                                              NC2324.2 40
   000355         035900     IF SUB-1 = 11 GO TO CHECK-ENTRIES.                           NC2324.2 40 381
   000356         036000     MOVE GRP-NAME TO ENTRY-1 (SUB-1).                            NC2324.2 50 72 40
   000357         036100     ADD 1 TO ADD-GRP.                                            NC2324.2 52
   000358         036200                                                                  NC2324.2
   000359         036300 BUILD-LEVEL-2.                                                   NC2324.2
   000360         036400     ADD 1 TO SUB-2.                                              NC2324.2 41
   000361         036500     IF SUB-2 = 11                                                NC2324.2 41
   000362      1  036600         MOVE ZERO TO SUB-2                                       NC2324.2 IMP 41
   000363      1  036700         MOVE 01 TO ADD-SEC                                       NC2324.2 58
   000364      1  036800         GO TO BUILD-LEVEL-1.                                     NC2324.2 353
   000365         036900     MOVE SUB-1 TO SEC-GRP.                                       NC2324.2 40 56
   000366         037000     MOVE SEC-NAME TO ENTRY-2 (SUB-1, SUB-2).                     NC2324.2 54 74 40 41
   000367         037100     ADD 1 TO ADD-SEC.                                            NC2324.2 58
   000368         037200                                                                  NC2324.2
   000369         037300 BUILD-LEVEL-3.                                                   NC2324.2
   000370         037400     ADD 1 TO SUB-3.                                              NC2324.2 42
   000371         037500     IF SUB-3 = 11                                                NC2324.2 42
   000372      1  037600         MOVE ZERO TO SUB-3                                       NC2324.2 IMP 42
   000373      1  037700              MOVE 01 TO ADD-ELEM                                 NC2324.2 67
   000374      1  037800              GO TO BUILD-LEVEL-2.                                NC2324.2 359
   000375         037900     MOVE SUB-1 TO ELEM-GRP.                                      NC2324.2 40 63
   000376         038000     MOVE SUB-2 TO ELEM-SEC.                                      NC2324.2 41 65
   000377         038100     MOVE ELEM-NAME TO ENTRY-3 (SUB-1, SUB-2, SUB-3).             NC2324.2 61 76 40 41 42
   000378         038200     ADD 1 TO ADD-ELEM.                                           NC2324.2 67
   000379         038300     GO TO BUILD-LEVEL-3.                                         NC2324.2 369
   000380         038400                                                                  NC2324.2
   000381         038500 CHECK-ENTRIES.                                                   NC2324.2
   000382         038600     MOVE "SEARCH VARYING LEV 1" TO FEATURE.                      NC2324.2 96
   000383         038700     MOVE "CHECK-ENTRIES       " TO PAR-NAME.                     NC2324.2 100
   000384         038800     MOVE "GRP02" TO GRP-HOLD-AREA.                               NC2324.2 49
   000385         038900     MOVE 02 TO SUB-2.                                            NC2324.2 41
   000386         039000     SET IDX-1 TO 1.                                              NC2324.2 71
   000387         039100     SEARCH GRP-ENTRY VARYING IDX-1 AT END                        NC2324.2 71 71
   000388      1  039200         PERFORM GRP-FAIL-PARGRAPH                                NC2324.2 395
   000389      1  039300         GO TO TH1-TEST-F1-2                                      NC2324.2 414
   000390      1  039400         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.      NC2324.2 72 71 49
   000391         039500     PERFORM PASS                                                 NC2324.2 250
   000392         039600     PERFORM PRINT-DETAIL.                                        NC2324.2 254
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000393         039700     GO TO TH1-TEST-F1-2.                                         NC2324.2 414
   000394         039800                                                                  NC2324.2
   000395         039900 GRP-FAIL-PARGRAPH.                                               NC2324.2
   000396         040000     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2324.2 49 125
   000397         040100     IF ENTRY-1 (SUB-2) EQUAL TO GRP-HOLD-AREA                    NC2324.2 72 41 49
   000398      1  040200         MOVE "IDX-1" TO END-IDX                                  NC2324.2 80
   000399      1  040300         SET IDX-VALU TO IDX-1                                    NC2324.2 82 71
   000400      1  040400         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000401      1  040500         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2324.2 78 111
   000402      1  040600     MOVE ENTRY-1 (SUB-2) TO COMPUTED-A                           NC2324.2 72 41 111
   000403      1  040700     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000404         040800                                                                  NC2324.2
   000405         040900     PERFORM FAIL                                                 NC2324.2 251
   000406         041000     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000407         041100*                                                                 NC2324.2
   000408         041200 TH1-INIT-F1-2.                                                   NC2324.2
   000409         041300     MOVE "TH1-TEST-F1-2      " TO PAR-NAME.                      NC2324.2 100
   000410         041400     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000411         041500     MOVE "GRP01" TO GRP-HOLD-AREA.                               NC2324.2 49
   000412         041600     MOVE 01 TO SUB-2.                                            NC2324.2 41
   000413         041700     SET IDX-1 TO 1.                                              NC2324.2 71
   000414         041800 TH1-TEST-F1-2.                                                   NC2324.2
   000415         041900     SEARCH GRP-ENTRY VARYING IDX-1 AT END                        NC2324.2 71 71
   000416      1  042000         GO TO TH1-FAIL-F1-2                                      NC2324.2 424
   000417      1  042100         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.      NC2324.2 72 71 49
   000418         042200                                                                  NC2324.2
   000419         042300     PERFORM PASS                                                 NC2324.2 250
   000420         042400     GO TO TH1-WRITE-F1-2.                                        NC2324.2 426
   000421         042500 TH1-DELETE-F1-2.                                                 NC2324.2
   000422         042600     PERFORM DE-LETE.                                             NC2324.2 252
   000423         042700     GO TO TH1-WRITE-F1-2.                                        NC2324.2 426
   000424         042800 TH1-FAIL-F1-2.                                                   NC2324.2
   000425         042900     PERFORM FAIL.                                                NC2324.2 251
   000426         043000 TH1-WRITE-F1-2.                                                  NC2324.2
   000427         043100     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000428         043200*                                                                 NC2324.2
   000429         043300 TH1-INIT-F1-3.                                                   NC2324.2
   000430         043400     MOVE "TH1-TEST-F1-3      " TO PAR-NAME.                      NC2324.2 100
   000431         043500     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000432         043600     MOVE "GRP10" TO GRP-HOLD-AREA.                               NC2324.2 49
   000433         043700     MOVE 10 TO SUB-2.                                            NC2324.2 41
   000434         043800     SET IDX-1 TO 1.                                              NC2324.2 71
   000435         043900 TH1-TEST-F1-3.                                                   NC2324.2
   000436         044000     SEARCH GRP-ENTRY VARYING IDX-1 AT END                        NC2324.2 71 71
   000437      1  044100         GO TO TH1-FAIL-F1-3                                      NC2324.2 445
   000438      1  044200         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA NEXT SENTENCE.      NC2324.2 72 71 49
   000439         044300                                                                  NC2324.2
   000440         044400     PERFORM PASS                                                 NC2324.2 250
   000441         044500     GO TO TH1-WRITE-F1-3.                                        NC2324.2 447
   000442         044600 TH1-DELETE-F1-3.                                                 NC2324.2
   000443         044700     PERFORM DE-LETE.                                             NC2324.2 252
   000444         044800     GO TO TH1-WRITE-F1-3.                                        NC2324.2 447
   000445         044900 TH1-FAIL-F1-3.                                                   NC2324.2
   000446         045000     PERFORM FAIL.                                                NC2324.2 251
   000447         045100 TH1-WRITE-F1-3.                                                  NC2324.2
   000448         045200     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000449         045300*                                                                 NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000450         045400 TH1-INIT-F1-4.                                                   NC2324.2
   000451         045500     MOVE "TH1-TEST-F1-4      " TO PAR-NAME.                      NC2324.2 100
   000452         045600     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000453         045700     MOVE "GRP05" TO GRP-HOLD-AREA.                               NC2324.2 49
   000454         045800     MOVE 05 TO SUB-2.                                            NC2324.2 41
   000455         045900     SET IDX-1 TO 05.                                             NC2324.2 71
   000456         046000 TH1-TEST-F1-4.                                                   NC2324.2
   000457         046100     SEARCH GRP-ENTRY VARYING IDX-1                               NC2324.2 71 71
   000458         046200         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA                     NC2324.2 72 71 49
   000459      1  046300             GO TO PASS-TH1-F1-4.                                 NC2324.2 461
   000460         046400     GO TO TH1-FAIL-F1-4.                                         NC2324.2 468
   000461         046500 PASS-TH1-F1-4.                                                   NC2324.2
   000462         046600                                                                  NC2324.2
   000463         046700     PERFORM PASS                                                 NC2324.2 250
   000464         046800     GO TO TH1-WRITE-F1-4.                                        NC2324.2 470
   000465         046900 TH1-DELETE-F1-4.                                                 NC2324.2
   000466         047000     PERFORM DE-LETE.                                             NC2324.2 252
   000467         047100     GO TO TH1-WRITE-F1-4.                                        NC2324.2 470
   000468         047200 TH1-FAIL-F1-4.                                                   NC2324.2
   000469         047300     PERFORM GRP-FAIL-PARGRAPH.                                   NC2324.2 395
   000470         047400 TH1-WRITE-F1-4.                                                  NC2324.2
   000471         047500     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000472         047600*                                                                 NC2324.2
   000473         047700 TH2-INIT-F1-1.                                                   NC2324.2
   000474         047800     MOVE "TH2-TEST-F1-1      " TO PAR-NAME.                      NC2324.2 100
   000475         047900     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000476         048000     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2324.2 96
   000477         048100     MOVE "SEC (01,01)" TO SEC-HOLD-AREA.                         NC2324.2 47
   000478         048200     MOVE 1 TO SUB-1 SUB-2.                                       NC2324.2 40 41
   000479         048300     SET IDX-1 IDX-2 TO 1.                                        NC2324.2 71 73
   000480         048400 TH2-TEST-F1-1.                                                   NC2324.2
   000481         048500     SEARCH GRP2-ENTRY VARYING IDX-2 AT END                       NC2324.2 73 73
   000482      1  048600         GO TO TH2-FAIL-F1-1                                      NC2324.2 491
   000483         048700         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2324.2 74 71 73 47
   000484      1  048800             NEXT SENTENCE.                                       NC2324.2
   000485         048900                                                                  NC2324.2
   000486         049000     PERFORM PASS.                                                NC2324.2 250
   000487         049100     GO TO TH2-WRITE-F1-1.                                        NC2324.2 493
   000488         049200 TH2-DELETE-F1-1.                                                 NC2324.2
   000489         049300     PERFORM DE-LETE.                                             NC2324.2 252
   000490         049400     GO TO TH2-WRITE-F1-1.                                        NC2324.2 493
   000491         049500 TH2-FAIL-F1-1.                                                   NC2324.2
   000492         049600     PERFORM SEC-FAIL-PARGRAF.                                    NC2324.2 569
   000493         049700 TH2-WRITE-F1-1.                                                  NC2324.2
   000494         049800     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000495         049900                                                                  NC2324.2
   000496         050000 TH2-INIT-F1-2.                                                   NC2324.2
   000497         050100     MOVE "TH2-TEST-F1-2      " TO PAR-NAME.                      NC2324.2 100
   000498         050200     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000499         050300     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2324.2 96
   000500         050400     MOVE "SEC (05,10)" TO SEC-HOLD-AREA.                         NC2324.2 47
   000501         050500     MOVE 05 TO SUB-1.                                            NC2324.2 40
   000502         050600     MOVE 10 TO SUB-2.                                            NC2324.2 41
   000503         050700     SET IDX-1 TO 5.                                              NC2324.2 71
   000504         050800     SET IDX-2 TO 1.                                              NC2324.2 73
   000505         050900 TH2-TEST-F1-2.                                                   NC2324.2
   000506         051000     SEARCH GRP2-ENTRY VARYING IDX-2 AT END                       NC2324.2 73 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000507      1  051100         GO TO TH2-FAIL-F1-2                                      NC2324.2 516
   000508         051200         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2324.2 74 71 73 47
   000509      1  051300             NEXT SENTENCE.                                       NC2324.2
   000510         051400                                                                  NC2324.2
   000511         051500     PERFORM PASS                                                 NC2324.2 250
   000512         051600     GO TO TH2-WRITE-F1-2.                                        NC2324.2 518
   000513         051700 TH2-DELETE-F1-2.                                                 NC2324.2
   000514         051800     PERFORM DE-LETE.                                             NC2324.2 252
   000515         051900     GO TO TH2-WRITE-F1-2.                                        NC2324.2 518
   000516         052000 TH2-FAIL-F1-2.                                                   NC2324.2
   000517         052100     PERFORM SEC-FAIL-PARGRAF.                                    NC2324.2 569
   000518         052200 TH2-WRITE-F1-2.                                                  NC2324.2
   000519         052300     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000520         052400*                                                                 NC2324.2
   000521         052500 TH2-INIT-F1-3.                                                   NC2324.2
   000522         052600     MOVE "TH2-TEST-F1-3      " TO PAR-NAME.                      NC2324.2 100
   000523         052700     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000524         052800     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2324.2 96
   000525         052900     MOVE "SEC (10,10)" TO SEC-HOLD-AREA.                         NC2324.2 47
   000526         053000     SET IDX-1 TO 10.                                             NC2324.2 71
   000527         053100     SET IDX-2 TO 1.                                              NC2324.2 73
   000528         053200     MOVE 10 TO SUB-1  SUB-2.                                     NC2324.2 40 41
   000529         053300 TH2-TEST-F1-3.                                                   NC2324.2
   000530         053400     SEARCH GRP2-ENTRY VARYING IDX-2 AT END                       NC2324.2 73 73
   000531      1  053500         GO TO TH2-FAIL-F1-3                                      NC2324.2 540
   000532         053600         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2324.2 74 71 73 47
   000533      1  053700             NEXT SENTENCE.                                       NC2324.2
   000534         053800                                                                  NC2324.2
   000535         053900     PERFORM PASS                                                 NC2324.2 250
   000536         054000     GO TO TH2-WRITE-F1-3.                                        NC2324.2 542
   000537         054100 TH2-DELETE-F1-3.                                                 NC2324.2
   000538         054200     PERFORM DE-LETE.                                             NC2324.2 252
   000539         054300     GO TO TH2-WRITE-F1-3.                                        NC2324.2 542
   000540         054400 TH2-FAIL-F1-3.                                                   NC2324.2
   000541         054500     PERFORM SEC-FAIL-PARGRAF.                                    NC2324.2 569
   000542         054600 TH2-WRITE-F1-3.                                                  NC2324.2
   000543         054700     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000544         054800*                                                                 NC2324.2
   000545         054900 TH2-INIT-F1-4.                                                   NC2324.2
   000546         055000     MOVE "TH2-TEST-F1-4      " TO PAR-NAME.                      NC2324.2 100
   000547         055100     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000548         055200     MOVE "SEARCH VARYING LEV 2" TO FEATURE.                      NC2324.2 96
   000549         055300     MOVE "SEC (08,02)" TO SEC-HOLD-AREA.                         NC2324.2 47
   000550         055400     MOVE 08 TO SUB-1.                                            NC2324.2 40
   000551         055500     MOVE 02 TO SUB-2.                                            NC2324.2 41
   000552         055600     SET IDX-1 TO 08.                                             NC2324.2 71
   000553         055700     SET IDX-2 TO 01.                                             NC2324.2 73
   000554         055800 TH2-TEST-F1-4.                                                   NC2324.2
   000555         055900     SEARCH GRP2-ENTRY VARYING IDX-2                              NC2324.2 73 73
   000556         056000         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2324.2 74 71 73 47
   000557      1  056100             PERFORM PASS                                         NC2324.2 250
   000558      1  056200             GO TO TH2-WRITE-F1-4.                                NC2324.2 565
   000559         056300     GO TO TH2-FAIL-F1-4.                                         NC2324.2 563
   000560         056400 TH2-DELETE-F1-4.                                                 NC2324.2
   000561         056500     PERFORM DE-LETE.                                             NC2324.2 252
   000562         056600     GO TO TH2-WRITE-F1-4.                                        NC2324.2 565
   000563         056700 TH2-FAIL-F1-4.                                                   NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000564         056800     PERFORM SEC-FAIL-PARGRAF.                                    NC2324.2 569
   000565         056900 TH2-WRITE-F1-4.                                                  NC2324.2
   000566         057000     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000567         057100     GO TO TH3-INIT-F1-1.                                         NC2324.2 581
   000568         057200*                                                                 NC2324.2
   000569         057300 SEC-FAIL-PARGRAF.                                                NC2324.2
   000570         057400     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2324.2 47 125
   000571         057500     IF ENTRY-2 (SUB-1, SUB-2) EQUAL TO SEC-HOLD-AREA             NC2324.2 74 40 41 47
   000572      1  057600         MOVE "IDX-2" TO END-IDX                                  NC2324.2 80
   000573      1  057700         SET IDX-VALU TO IDX-2                                    NC2324.2 82 73
   000574      1  057800         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000575      1  057900         MOVE END-STMT TO COMPUTED-A ELSE                         NC2324.2 78 111
   000576      1  058000     MOVE ENTRY-2 (SUB-1, SUB-2) TO COMPUTED-A                    NC2324.2 74 40 41 111
   000577      1  058100     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000578         058200                                                                  NC2324.2
   000579         058300     PERFORM FAIL.                                                NC2324.2 251
   000580         058400                                                                  NC2324.2
   000581         058500 TH3-INIT-F1-1.                                                   NC2324.2
   000582         058600     MOVE "TH3-TEST-F1-1      " TO PAR-NAME.                      NC2324.2 100
   000583         058700     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000584         058800     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2324.2 96
   000585         058900     MOVE 1 TO SUB-1  SUB-2  SUB-3.                               NC2324.2 40 41 42
   000586         059000     MOVE "ELEM (01,01,01)" TO ELEM-HOLD-AREA.                    NC2324.2 45
   000587         059100     SET IDX-1 IDX-2 IDX-3 TO 1.                                  NC2324.2 71 73 75
   000588         059200 TH3-TEST-F1-1.                                                   NC2324.2
   000589         059300     SEARCH GRP3-ENTRY VARYING IDX-3                              NC2324.2 75 75
   000590         059400         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2324.2 76 71 73 75 45
   000591      1  059500             GO TO PASS-TH3-1.                                    NC2324.2 593
   000592         059600     GO TO TH3-FAIL-F1-1.                                         NC2324.2 600
   000593         059700 PASS-TH3-1.                                                      NC2324.2
   000594         059800                                                                  NC2324.2
   000595         059900     PERFORM PASS.                                                NC2324.2 250
   000596         060000     GO TO TH3-WRITE-F1-1.                                        NC2324.2 602
   000597         060100 TH3-DELETE-F1-1.                                                 NC2324.2
   000598         060200     PERFORM DE-LETE.                                             NC2324.2 252
   000599         060300     GO TO TH3-WRITE-F1-1.                                        NC2324.2 602
   000600         060400 TH3-FAIL-F1-1.                                                   NC2324.2
   000601         060500     PERFORM ELEM-FAIL-PARA.                                      NC2324.2 684
   000602         060600 TH3-WRITE-F1-1.                                                  NC2324.2
   000603         060700     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000604         060800*                                                                 NC2324.2
   000605         060900 TH3-INIT-F1-2.                                                   NC2324.2
   000606         061000     MOVE "TH3-TEST-F1-2      " TO PAR-NAME.                      NC2324.2 100
   000607         061100     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000608         061200     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2324.2 96
   000609         061300     MOVE 05 TO SUB-1.                                            NC2324.2 40
   000610         061400     MOVE 06 TO SUB-2.                                            NC2324.2 41
   000611         061500     MOVE 07 TO SUB-3.                                            NC2324.2 42
   000612         061600     SET IDX-1 TO 05.                                             NC2324.2 71
   000613         061700     SET IDX-2 TO 06.                                             NC2324.2 73
   000614         061800     SET IDX-3 TO 1.                                              NC2324.2 75
   000615         061900     MOVE "ELEM (05,06,07)" TO ELEM-HOLD-AREA.                    NC2324.2 45
   000616         062000 TH3-TEST-F1-2.                                                   NC2324.2
   000617         062100     SEARCH GRP3-ENTRY VARYING IDX-3 AT END                       NC2324.2 75 75
   000618      1  062200         GO TO TH3-FAIL-F1-2                                      NC2324.2 627
   000619         062300         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2324.2 76 71 73 75 45
   000620      1  062400             NEXT SENTENCE.                                       NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000621         062500                                                                  NC2324.2
   000622         062600     PERFORM PASS                                                 NC2324.2 250
   000623         062700     GO TO TH3-WRITE-F1-2.                                        NC2324.2 629
   000624         062800 TH3-DELETE-F1-2.                                                 NC2324.2
   000625         062900     PERFORM DE-LETE.                                             NC2324.2 252
   000626         063000     GO TO TH3-WRITE-F1-2.                                        NC2324.2 629
   000627         063100 TH3-FAIL-F1-2.                                                   NC2324.2
   000628         063200     PERFORM ELEM-FAIL-PARA.                                      NC2324.2 684
   000629         063300 TH3-WRITE-F1-2.                                                  NC2324.2
   000630         063400     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000631         063500*                                                                 NC2324.2
   000632         063600 TH3-INIT-F1-3.                                                   NC2324.2
   000633         063700     MOVE "TH3-TEST-F1-3      " TO PAR-NAME.                      NC2324.2 100
   000634         063800     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000635         063900     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2324.2 96
   000636         064000     MOVE 10 TO SUB-1 SUB-2 SUB-3.                                NC2324.2 40 41 42
   000637         064100     SET IDX-1 IDX-2 TO 10.                                       NC2324.2 71 73
   000638         064200     SET IDX-3 TO 1.                                              NC2324.2 75
   000639         064300 TH3-TEST-F1-3.                                                   NC2324.2
   000640         064400     MOVE "ELEM (10,10,10)" TO ELEM-HOLD-AREA.                    NC2324.2 45
   000641         064500     SEARCH GRP3-ENTRY VARYING IDX-3 AT END                       NC2324.2 75 75
   000642      1  064600         GO TO TH3-FAIL-F1-3                                      NC2324.2 651
   000643         064700         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2324.2 76 71 73 75 45
   000644      1  064800             NEXT SENTENCE.                                       NC2324.2
   000645         064900                                                                  NC2324.2
   000646         065000     PERFORM PASS                                                 NC2324.2 250
   000647         065100     GO TO TH3-WRITE-F1-3.                                        NC2324.2 653
   000648         065200 TH3-DELETE-F1-3.                                                 NC2324.2
   000649         065300     PERFORM DE-LETE.                                             NC2324.2 252
   000650         065400     GO TO TH3-WRITE-F1-3.                                        NC2324.2 653
   000651         065500 TH3-FAIL-F1-3.                                                   NC2324.2
   000652         065600     PERFORM ELEM-FAIL-PARA.                                      NC2324.2 684
   000653         065700 TH3-WRITE-F1-3.                                                  NC2324.2
   000654         065800     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000655         065900*                                                                 NC2324.2
   000656         066000 TH3-INIT-F1-4.                                                   NC2324.2
   000657         066100     MOVE "TH3-TEST-F1-4      " TO PAR-NAME.                      NC2324.2 100
   000658         066200     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000659         066300     MOVE "SEARCH VARYING LEV 3" TO FEATURE.                      NC2324.2 96
   000660         066400     MOVE "ELEM (07,06,05)" TO ELEM-HOLD-AREA.                    NC2324.2 45
   000661         066500     MOVE 07 TO SUB-1.                                            NC2324.2 40
   000662         066600     MOVE 06 TO SUB-2.                                            NC2324.2 41
   000663         066700     MOVE 05 TO SUB-3.                                            NC2324.2 42
   000664         066800     SET IDX-1 TO 07.                                             NC2324.2 71
   000665         066900     SET IDX-2 TO 06.                                             NC2324.2 73
   000666         067000     SET IDX-3 TO 03.                                             NC2324.2 75
   000667         067100 TH3-TEST-F1-4.                                                   NC2324.2
   000668         067200     SEARCH GRP3-ENTRY VARYING IDX-3 AT END                       NC2324.2 75 75
   000669      1  067300         GO TO TH3-TEST-F1-4                                      NC2324.2 667
   000670         067400         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2324.2 76 71 73 75 45
   000671      1  067500         NEXT SENTENCE.                                           NC2324.2
   000672         067600                                                                  NC2324.2
   000673         067700     PERFORM PASS                                                 NC2324.2 250
   000674         067800     GO TO TH3-WRITE-F1-4.                                        NC2324.2 680
   000675         067900 TH3-DELETE-F1-4.                                                 NC2324.2
   000676         068000     PERFORM DE-LETE.                                             NC2324.2 252
   000677         068100     GO TO TH3-WRITE-F1-4.                                        NC2324.2 680
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000678         068200 TH3-FAIL-F1-4.                                                   NC2324.2
   000679         068300     PERFORM ELEM-FAIL-PARA.                                      NC2324.2 684
   000680         068400 TH3-WRITE-F1-4.                                                  NC2324.2
   000681         068500     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000682         068600     GO TO SCH-INIT-F1-1.                                         NC2324.2 695
   000683         068700*                                                                 NC2324.2
   000684         068800 ELEM-FAIL-PARA.                                                  NC2324.2
   000685         068900     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2324.2 45 125
   000686         069000     IF ENTRY-3 (SUB-1, SUB-2, SUB-3) EQUAL TO ELEM-HOLD-AREA     NC2324.2 76 40 41 42 45
   000687      1  069100         MOVE "IDX-3" TO END-IDX                                  NC2324.2 80
   000688      1  069200         SET IDX-VALU TO IDX-3                                    NC2324.2 82 75
   000689      1  069300         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000690      1  069400         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2324.2 78 111
   000691      1  069500     MOVE ENTRY-3 (SUB-1, SUB-2, SUB-3) TO COMPUTED-A             NC2324.2 76 40 41 42 111
   000692      1  069600     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000693         069700     PERFORM FAIL.                                                NC2324.2 251
   000694         069800*                                                                 NC2324.2
   000695         069900 SCH-INIT-F1-1.                                                   NC2324.2
   000696         070000     MOVE "SCH-TEST-F1-1  " TO PAR-NAME.                          NC2324.2 100
   000697         070100     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000698         070200     MOVE "MULTIPLE SEARCH STMT" TO FEATURE.                      NC2324.2 96
   000699         070300     MOVE "GRP08" TO GRP-HOLD-AREA.                               NC2324.2 49
   000700         070400     MOVE "SEC (08,07)" TO SEC-HOLD-AREA.                         NC2324.2 47
   000701         070500     SET IDX-1 IDX-2 TO 1.                                        NC2324.2 71 73
   000702         070600 SCH-TEST-F1-1.                                                   NC2324.2
   000703         070700     SEARCH GRP-ENTRY VARYING IDX-1 AT END GO TO SCH-FAIL-F1-1-A  NC2324.2 71 71 713
   000704      1  070800         WHEN ENTRY-1 (IDX-1) = "GRP08" NEXT SENTENCE.            NC2324.2 72 71
   000705         070900     SEARCH GRP2-ENTRY VARYING IDX-2 AT END GO TO SCH-FAIL-F1-1-B NC2324.2 73 73 725
   000706         071000         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2324.2 74 71 73 47
   000707      1  071100             NEXT SENTENCE.                                       NC2324.2
   000708         071200     PERFORM PASS                                                 NC2324.2 250
   000709         071300     GO TO SCH-WRITE-F1-1.                                        NC2324.2 736
   000710         071400 SCH-DELETE-F1-1.                                                 NC2324.2
   000711         071500     PERFORM DE-LETE.                                             NC2324.2 252
   000712         071600     GO TO SCH-WRITE-F1-1.                                        NC2324.2 736
   000713         071700 SCH-FAIL-F1-1-A.                                                 NC2324.2
   000714         071800     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2324.2 49 125
   000715         071900     IF ENTRY-1 (08) EQUAL TO GRP-HOLD-AREA                       NC2324.2 72 49
   000716      1  072000         MOVE "IDX-1" TO END-IDX                                  NC2324.2 80
   000717      1  072100         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000718      1  072200         SET IDX-VALU TO IDX-1                                    NC2324.2 82 71
   000719      1  072300         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2324.2 78 111
   000720      1  072400     MOVE ENTRY-1 (08) TO COMPUTED-A                              NC2324.2 72 111
   000721      1  072500     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000722         072600                                                                  NC2324.2
   000723         072700     PERFORM FAIL                                                 NC2324.2 251
   000724         072800     GO TO SCH-WRITE-F1-1.                                        NC2324.2 736
   000725         072900 SCH-FAIL-F1-1-B.                                                 NC2324.2
   000726         073000     MOVE SEC-HOLD-AREA TO CORRECT-A.                             NC2324.2 47 125
   000727         073100     IF ENTRY-2 (08, 07) EQUAL TO SEC-HOLD-AREA                   NC2324.2 74 47
   000728      1  073200         MOVE "IDX-2" TO END-IDX                                  NC2324.2 80
   000729      1  073300         SET IDX-VALU TO IDX-2                                    NC2324.2 82 73
   000730      1  073400         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000731      1  073500         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2324.2 78 111
   000732      1  073600     MOVE ENTRY-2 (08, 07) TO COMPUTED-A                          NC2324.2 74 111
   000733      1  073700     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000734         073800                                                                  NC2324.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000735         073900     PERFORM FAIL.                                                NC2324.2 251
   000736         074000 SCH-WRITE-F1-1.                                                  NC2324.2
   000737         074100     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000738         074200*                                                                 NC2324.2
   000739         074300 SCH-INIT-F1-2.                                                   NC2324.2
   000740         074400     MOVE "SCH-TEST-F1-2  " TO PAR-NAME.                          NC2324.2 100
   000741         074500     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000742         074600     MOVE "MULTIPLE SEARCH STMT" TO FEATURE.                      NC2324.2 96
   000743         074700     MOVE "GRP04" TO GRP-HOLD-AREA.                               NC2324.2 49
   000744         074800     MOVE "SEC (04,04)" TO SEC-HOLD-AREA.                         NC2324.2 47
   000745         074900     MOVE "ELEM (04,04,04)" TO ELEM-HOLD-AREA.                    NC2324.2 45
   000746         075000     SET IDX-1 IDX-2 IDX-3 TO 1.                                  NC2324.2 71 73 75
   000747         075100 SCH-TEST-F1-2.                                                   NC2324.2
   000748         075200     SEARCH GRP-ENTRY VARYING IDX-1                               NC2324.2 71 71
   000749         075300         AT END                                                   NC2324.2
   000750      1  075400              GO TO SCH-FAIL-F1-2-A                               NC2324.2 768
   000751         075500         WHEN ENTRY-1 (IDX-1) = GRP-HOLD-AREA                     NC2324.2 72 71 49
   000752      1  075600              NEXT SENTENCE.                                      NC2324.2
   000753         075700*                                                                 NC2324.2
   000754         075800     SEARCH GRP2-ENTRY VARYING IDX-2                              NC2324.2 73 73
   000755         075900         AT END                                                   NC2324.2
   000756      1  076000              GO TO SCH-FAIL-F1-2-B                               NC2324.2 780
   000757         076100         WHEN ENTRY-2 (IDX-1, IDX-2) = SEC-HOLD-AREA              NC2324.2 74 71 73 47
   000758      1  076200              NEXT SENTENCE.                                      NC2324.2
   000759         076300*                                                                 NC2324.2
   000760         076400     SEARCH GRP3-ENTRY VARYING IDX-3                              NC2324.2 75 75
   000761         076500         AT END                                                   NC2324.2
   000762      1  076600              GO TO SCH-FAIL-F1-2-C                               NC2324.2 792
   000763         076700         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = ELEM-HOLD-AREA      NC2324.2 76 71 73 75 45
   000764      1  076800              NEXT SENTENCE.                                      NC2324.2
   000765         076900                                                                  NC2324.2
   000766         077000     PERFORM PASS                                                 NC2324.2 250
   000767         077100     GO TO SCH-WRITE-F1-2.                                        NC2324.2 803
   000768         077200 SCH-FAIL-F1-2-A.                                                 NC2324.2
   000769         077300     MOVE GRP-HOLD-AREA TO CORRECT-A.                             NC2324.2 49 125
   000770         077400     IF ENTRY-1 (04) EQUAL TO GRP-HOLD-AREA                       NC2324.2 72 49
   000771      1  077500         MOVE "IDX-1" TO END-IDX                                  NC2324.2 80
   000772      1  077600         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000773      1  077700         SET IDX-VALU TO IDX-1                                    NC2324.2 82 71
   000774      1  077800         MOVE END-STMT TO COMPUTED-A                              NC2324.2 78 111
   000775         077900     ELSE                                                         NC2324.2
   000776      1  078000         MOVE ENTRY-1 (04) TO COMPUTED-A                          NC2324.2 72 111
   000777      1  078100         MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.           NC2324.2 105
   000778         078200     PERFORM FAIL.                                                NC2324.2 251
   000779         078300     GO TO SCH-WRITE-F1-2.                                        NC2324.2 803
   000780         078400 SCH-FAIL-F1-2-B.                                                 NC2324.2
   000781         078500     MOVE  SEC-HOLD-AREA TO CORRECT-A.                            NC2324.2 47 125
   000782         078600     IF ENTRY-2 (04, 04) EQUAL TO SEC-HOLD-AREA                   NC2324.2 74 47
   000783      1  078700         MOVE "IDX-2" TO END-IDX                                  NC2324.2 80
   000784      1  078800         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000785      1  078900         SET IDX-VALU TO IDX-2                                    NC2324.2 82 73
   000786      1  079000         MOVE END-STMT TO COMPUTED-A                              NC2324.2 78 111
   000787         079100     ELSE                                                         NC2324.2
   000788      1  079200         MOVE ENTRY-2 (04, 04) TO COMPUTED-A                      NC2324.2 74 111
   000789      1  079300         MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.           NC2324.2 105
   000790         079400     PERFORM FAIL                                                 NC2324.2 251
   000791         079500     GO TO SCH-WRITE-F1-2.                                        NC2324.2 803
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000792         079600 SCH-FAIL-F1-2-C.                                                 NC2324.2
   000793         079700     MOVE ELEM-HOLD-AREA TO CORRECT-A.                            NC2324.2 45 125
   000794         079800     IF ENTRY-3 (04, 04, 04) EQUAL TO ELEM-HOLD-AREA              NC2324.2 76 45
   000795      1  079900         MOVE "IDX-3" TO END-IDX                                  NC2324.2 80
   000796      1  080000         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000797      1  080100         SET IDX-VALU TO IDX-3                                    NC2324.2 82 75
   000798      1  080200         MOVE END-STMT TO COMPUTED-A                              NC2324.2 78 111
   000799         080300     ELSE                                                         NC2324.2
   000800      1  080400         MOVE ENTRY-3 (04, 04, 04) TO COMPUTED-A                  NC2324.2 76 111
   000801      1  080500         MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.           NC2324.2 105
   000802         080600     PERFORM FAIL.                                                NC2324.2 251
   000803         080700 SCH-WRITE-F1-2.                                                  NC2324.2
   000804         080800     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000805         080900*                                                                 NC2324.2
   000806         081000 SPC-INIT-F1-1.                                                   NC2324.2
   000807         081100     MOVE "SPC-TEST-F1-1      " TO PAR-NAME.                      NC2324.2 100
   000808         081200     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000809         081300     MOVE "SEARCH WITH HI INDEX" TO FEATURE.                      NC2324.2 96
   000810         081400     SET IDX-1 TO 4.                                              NC2324.2 71
   000811         081500 SPC-TEST-F1-1.                                                   NC2324.2
   000812         081600     SEARCH GRP-ENTRY VARYING IDX-1                               NC2324.2 71 71
   000813         081700         AT END                                                   NC2324.2
   000814      1  081800              PERFORM PASS                                        NC2324.2 250
   000815      1  081900              GO TO SPC-WRITE-F1-1                                NC2324.2 826
   000816         082000         WHEN ENTRY-1 (IDX-1) = "GRP03"                           NC2324.2 72 71
   000817      1  082100              GO TO SPC-FAIL-F1-1.                                NC2324.2 821
   000818         082200 SPC-DELETE-F1-1.                                                 NC2324.2
   000819         082300     PERFORM DE-LETE.                                             NC2324.2 252
   000820         082400     GO TO SPC-WRITE-F1-1.                                        NC2324.2 826
   000821         082500 SPC-FAIL-F1-1.                                                   NC2324.2
   000822         082600     MOVE SPACES TO CORRECT-A.                                    NC2324.2 IMP 125
   000823         082700     MOVE ENTRY-1 (03) TO COMPUTED-A.                             NC2324.2 72 111
   000824         082800     MOVE SPACES TO RE-MARK.                                      NC2324.2 IMP 105
   000825         082900     PERFORM FAIL.                                                NC2324.2 251
   000826         083000 SPC-WRITE-F1-1.                                                  NC2324.2
   000827         083100     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000828         083200*                                                                 NC2324.2
   000829         083300 SPC-INIT-F1-2.                                                   NC2324.2
   000830         083400     MOVE "SPC-TEST-F1-2" TO PAR-NAME.                            NC2324.2 100
   000831         083500     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000832         083600     MOVE "SEARCH WITH HI INDEX" TO FEATURE.                      NC2324.2 96
   000833         083700     SET IDX-1 TO 4.                                              NC2324.2 71
   000834         083800     SET IDX-2 TO 5.                                              NC2324.2 73
   000835         083900 SPC-TEST-F1-2.                                                   NC2324.2
   000836         084000     SEARCH GRP-ENTRY VARYING IDX-1                               NC2324.2 71 71
   000837      1  084100         AT END GO TO SPC-FAIL-F1-2-A                             NC2324.2 847
   000838      1  084200         WHEN ENTRY-1 (IDX-1) = "GRP04" NEXT SENTENCE.            NC2324.2 72 71
   000839         084300     SEARCH GRP2-ENTRY VARYING IDX-2                              NC2324.2 73 73
   000840      1  084400         AT END PERFORM PASS                                      NC2324.2 250
   000841      1  084500                GO TO SPC-WRITE-F1-2                              NC2324.2 862
   000842         084600         WHEN ENTRY-2 (IDX-1, IDX-2) = "SEC (04,04)"              NC2324.2 74 71 73
   000843      1  084700                GO TO SPC-FAIL-F1-2-B.                            NC2324.2 858
   000844         084800 SPC-DELETE-F1-2.                                                 NC2324.2
   000845         084900     PERFORM DE-LETE.                                             NC2324.2 252
   000846         085000     GO TO SPC-WRITE-F1-2.                                        NC2324.2 862
   000847         085100 SPC-FAIL-F1-2-A.                                                 NC2324.2
   000848         085200     MOVE "GRP04" TO CORRECT-A.                                   NC2324.2 125
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000849         085300     IF ENTRY-1 (04) EQUAL TO "GRP04"                             NC2324.2 72
   000850      1  085400         MOVE "IDX-2" TO END-IDX                                  NC2324.2 80
   000851      1  085500         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000852      1  085600         SET IDX-VALU TO IDX-2                                    NC2324.2 82 73
   000853      1  085700         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2324.2 78 111
   000854      1  085800     MOVE ENTRY-1 (04) TO COMPUTED-A                              NC2324.2 72 111
   000855      1  085900     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000856         086000     PERFORM FAIL                                                 NC2324.2 251
   000857         086100     GO TO SPC-WRITE-F1-2.                                        NC2324.2 862
   000858         086200 SPC-FAIL-F1-2-B.                                                 NC2324.2
   000859         086300     MOVE ENTRY-2 (04, 04) TO COMPUTED-A                          NC2324.2 74 111
   000860         086400     MOVE SPACES TO CORRECT-A.                                    NC2324.2 IMP 125
   000861         086500     PERFORM FAIL.                                                NC2324.2 251
   000862         086600 SPC-WRITE-F1-2.                                                  NC2324.2
   000863         086700     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000864         086800*                                                                 NC2324.2
   000865         086900 SPC-INIT-F1-3.                                                   NC2324.2
   000866         087000     MOVE "SPC-TEST-F1-3" TO PAR-NAME.                            NC2324.2 100
   000867         087100     MOVE "VI-122 6.21"   TO ANSI-REFERENCE.                      NC2324.2 156
   000868         087200     MOVE "SEARCH WITH HI INDEX" TO FEATURE.                      NC2324.2 96
   000869         087300     SET IDX-1 TO 02.                                             NC2324.2 71
   000870         087400 SPC-TEST-F1-3.                                                   NC2324.2
   000871         087500     SEARCH GRP-ENTRY VARYING IDX-1                               NC2324.2 71 71
   000872         087600         AT END                                                   NC2324.2
   000873      1  087700                GO TO SPC-FAIL-F1-3-A                             NC2324.2 888
   000874         087800         WHEN ENTRY-1 (IDX-1) EQUAL TO "GRP02"                    NC2324.2 72 71
   000875      1  087900                NEXT SENTENCE.                                    NC2324.2
   000876         088000     SET IDX-2 TO 01.                                             NC2324.2 73
   000877         088100     SEARCH GRP2-ENTRY VARYING IDX-2                              NC2324.2 73 73
   000878         088200         AT END                                                   NC2324.2
   000879      1  088300                GO TO SPC-FAIL-F1-3-B                             NC2324.2 899
   000880         088400         WHEN ENTRY-2 (IDX-1, IDX-2) = "SEC (02,03)"              NC2324.2 74 71 73
   000881      1  088500                NEXT SENTENCE.                                    NC2324.2
   000882         088600     SET IDX-3 TO 05.                                             NC2324.2 75
   000883         088700     SEARCH GRP3-ENTRY VARYING IDX-3                              NC2324.2 75 75
   000884      1  088800         AT END PERFORM PASS                                      NC2324.2 250
   000885      1  088900                GO TO SPC-WRITE-F1-3                              NC2324.2 915
   000886         089000         WHEN ENTRY-3 (IDX-1, IDX-2, IDX-3) = "ELEM (02,03,04)"   NC2324.2 76 71 73 75
   000887      1  089100                GO TO SPC-FAIL-F1-3-C.                            NC2324.2 910
   000888         089200 SPC-FAIL-F1-3-A.                                                 NC2324.2
   000889         089300     MOVE "GRP02" TO CORRECT-A.                                   NC2324.2 125
   000890         089400     IF ENTRY-1 (02) EQUAL TO "GRP02"                             NC2324.2 72
   000891      1  089500         MOVE "IDX-1" TO END-IDX                                  NC2324.2 80
   000892      1  089600         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000893      1  089700         SET IDX-VALU TO IDX-1                                    NC2324.2 82 71
   000894      1  089800         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2324.2 78 111
   000895      1  089900     MOVE ENTRY-1 (02) TO COMPUTED-A                              NC2324.2 72 111
   000896      1  090000     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000897         090100     PERFORM FAIL                                                 NC2324.2 251
   000898         090200     GO TO SPC-WRITE-F1-3.                                        NC2324.2 915
   000899         090300 SPC-FAIL-F1-3-B.                                                 NC2324.2
   000900         090400     MOVE "SEC (02,03)" TO CORRECT-A.                             NC2324.2 125
   000901         090500     IF ENTRY-2 (02, 03) EQUAL TO "SEC (02,03)"                   NC2324.2 74
   000902      1  090600         MOVE "IDX-2" TO END-IDX                                  NC2324.2 80
   000903      1  090700         MOVE "SEE NOTE 1 FOR DIAGNOSTIC  " TO RE-MARK            NC2324.2 105
   000904      1  090800         SET IDX-VALU TO IDX-2                                    NC2324.2 82 73
   000905      1  090900         MOVE END-STMT TO COMPUTED-A  ELSE                        NC2324.2 78 111
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000906      1  091000     MOVE ENTRY-2 (02, 03) TO COMPUTED-A                          NC2324.2 74 111
   000907      1  091100     MOVE "SEE NOTE 2 FOR DIAGNOSTIC  " TO RE-MARK.               NC2324.2 105
   000908         091200     PERFORM FAIL                                                 NC2324.2 251
   000909         091300     GO TO SPC-WRITE-F1-3.                                        NC2324.2 915
   000910         091400 SPC-FAIL-F1-3-C.                                                 NC2324.2
   000911         091500     MOVE "INDEX SET HIGHER THAN ENTRY" TO RE-MARK                NC2324.2 105
   000912         091600     MOVE SPACES TO CORRECT-A                                     NC2324.2 IMP 125
   000913         091700     MOVE "ELEM (02,03,04)" TO COMPUTED-A                         NC2324.2 111
   000914         091800     PERFORM FAIL.                                                NC2324.2 251
   000915         091900 SPC-WRITE-F1-3.                                                  NC2324.2
   000916         092000     PERFORM PRINT-DETAIL.                                        NC2324.2 254
   000917         092100 CCVS-EXIT SECTION.                                               NC2324.2
   000918         092200 CCVS-999999.                                                     NC2324.2
   000919         092300     GO TO CLOSE-FILES.                                           NC2324.2 243
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    20
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       67   ADD-ELEM . . . . . . . . . . .  M373 M378
       52   ADD-GRP. . . . . . . . . . . .  M357
       58   ADD-SEC. . . . . . . . . . . .  M363 M367
      156   ANSI-REFERENCE . . . . . . . .  328 335 344 M410 M431 M452 M475 M498 M523 M547 M583 M607 M634 M658 M697 M741
                                            M808 M831 M867
      135   CCVS-C-1 . . . . . . . . . . .  272 314
      140   CCVS-C-2 . . . . . . . . . . .  273 315
      190   CCVS-E-1 . . . . . . . . . . .  278
      195   CCVS-E-2 . . . . . . . . . . .  287 294 301 306
      198   CCVS-E-2-2 . . . . . . . . . .  M286
      203   CCVS-E-3 . . . . . . . . . . .  307
      212   CCVS-E-4 . . . . . . . . . . .  286
      213   CCVS-E-4-1 . . . . . . . . . .  M284
      215   CCVS-E-4-2 . . . . . . . . . .  M285
      157   CCVS-H-1 . . . . . . . . . . .  267
      162   CCVS-H-2A. . . . . . . . . . .  268
      171   CCVS-H-2B. . . . . . . . . . .  269
      183   CCVS-H-3 . . . . . . . . . . .  270
      233   CCVS-PGM-ID. . . . . . . . . .  239 239
      117   CM-18V0
      111   COMPUTED-A . . . . . . . . . .  112 114 115 116 117 340 343 M401 M402 M575 M576 M690 M691 M719 M720 M731 M732
                                            M774 M776 M786 M788 M798 M800 M823 M853 M854 M859 M894 M895 M905 M906 M913
      112   COMPUTED-N
      110   COMPUTED-X . . . . . . . . . .  M262 326
      114   COMPUTED-0V18
      116   COMPUTED-14V4
      118   COMPUTED-18V0
      115   COMPUTED-4V14
       44   CON-10
       46   CON-5
       48   CON-6
       43   CON-7
      134   COR-ANSI-REFERENCE . . . . . .  M335 M337
      125   CORRECT-A. . . . . . . . . . .  126 127 128 129 130 341 343 M396 M570 M685 M714 M726 M769 M781 M793 M822 M848
                                            M860 M889 M900 M912
      126   CORRECT-N
      124   CORRECT-X. . . . . . . . . . .  M263 327
      127   CORRECT-0V18
      129   CORRECT-14V4
      131   CORRECT-18V0
      128   CORRECT-4V14
      130   CR-18V0
      148   DELETE-COUNTER . . . . . . . .  M252 281 297 299
      103   DOTVALUE . . . . . . . . . . .  M257
      154   DUMMY-HOLD . . . . . . . . . .  M311 317
       38   DUMMY-RECORD . . . . . . . . .  M267 M268 M269 M270 M272 M273 M274 M276 M278 M287 M294 M301 M306 M307 311 M312
                                            313 M314 M315 M316 M317 321 M322 M330 M345
       63   ELEM-GRP . . . . . . . . . . .  M375
       45   ELEM-HOLD-AREA . . . . . . . .  M586 590 M615 619 M640 643 M660 670 685 686 M745 763 793 794
       61   ELEM-NAME. . . . . . . . . . .  377
       65   ELEM-SEC . . . . . . . . . . .  M376
       80   END-IDX. . . . . . . . . . . .  M398 M572 M687 M716 M728 M771 M783 M795 M850 M891 M902
       78   END-STMT . . . . . . . . . . .  401 575 690 719 731 774 786 798 853 894 905
      201   ENDER-DESC . . . . . . . . . .  M289 M300 M305
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    21
0 Defined   Cross-reference of data names   References

0      72   ENTRY-1. . . . . . . . . . . .  M356 390 397 402 417 438 458 704 715 720 751 770 776 816 823 838 849 854 874
                                            890 895
       74   ENTRY-2. . . . . . . . . . . .  M366 483 508 532 556 571 576 706 727 732 757 782 788 842 859 880 901 906
       76   ENTRY-3. . . . . . . . . . . .  M377 590 619 643 670 686 691 763 794 800 886
      149   ERROR-COUNTER. . . . . . . . .  M251 280 290 293
      153   ERROR-HOLD . . . . . . . . . .  M280 M281 M281 M282 285
      199   ERROR-TOTAL. . . . . . . . . .  M291 M293 M298 M299 M303 M304
       96   FEATURE. . . . . . . . . . . .  M382 M476 M499 M524 M548 M584 M608 M635 M659 M698 M742 M809 M832 M868
       71   GRP-ENTRY. . . . . . . . . . .  387 415 436 457 703 748 812 836 871
       49   GRP-HOLD-AREA. . . . . . . . .  M384 390 396 397 M411 417 M432 438 M453 458 M699 714 715 M743 751 769 770
       50   GRP-NAME . . . . . . . . . . .  356
       73   GRP2-ENTRY . . . . . . . . . .  481 506 530 555 705 754 839 877
       75   GRP3-ENTRY . . . . . . . . . .  589 617 641 668 760 883
      227   HYPHEN-LINE. . . . . . . . . .  274 276 316
      193   ID-AGAIN . . . . . . . . . . .  M239
       82   IDX-VALU . . . . . . . . . . .  M399 M573 M688 M718 M729 M773 M785 M797 M852 M893 M904
       71   IDX-1. . . . . . . . . . . . .  M386 M387 390 399 M413 M415 417 M434 M436 438 M455 M457 458 M479 483 M503 508
                                            M526 532 M552 556 M587 590 M612 619 M637 643 M664 670 M701 M703 704 706 718 M746
                                            M748 751 757 763 773 M810 M812 816 M833 M836 838 842 M869 M871 874 880 886 893
       73   IDX-2. . . . . . . . . . . . .  M479 M481 483 M504 M506 508 M527 M530 532 M553 M555 556 573 M587 590 M613 619
                                            M637 643 M665 670 M701 M705 706 729 M746 M754 757 763 785 M834 M839 842 852 M876
                                            M877 880 886 904
       75   IDX-3. . . . . . . . . . . . .  M587 M589 590 M614 M617 619 M638 M641 643 M666 M668 670 688 M746 M760 763 797
                                            M882 M883 886
      226   INF-ANSI-REFERENCE . . . . . .  M328 M331 M344 M346
      221   INFO-TEXT. . . . . . . . . . .  M329
      150   INSPECT-COUNTER. . . . . . . .  M249 280 302 304
       84   NOTE-1
       89   NOTE-2
       98   P-OR-F . . . . . . . . . . . .  M249 M250 M251 M252 259 M262
      100   PAR-NAME . . . . . . . . . . .  M264 M383 M409 M430 M451 M474 M497 M522 M546 M582 M606 M633 M657 M696 M740 M807
                                            M830 M866
      102   PARDOT-X . . . . . . . . . . .  M256
      151   PASS-COUNTER . . . . . . . . .  M250 282 284
       36   PRINT-FILE . . . . . . . . . .  32 238 244
       37   PRINT-REC. . . . . . . . . . .  M258 M334 M336
      105   RE-MARK. . . . . . . . . . . .  M253 M265 M400 M403 M574 M577 M689 M692 M717 M721 M730 M733 M772 M777 M784 M789
                                            M796 M801 M824 M851 M855 M892 M896 M903 M907 M911
      147   REC-CT . . . . . . . . . . . .  255 257 264
      146   REC-SKL-SUB
      155   RECORD-COUNT . . . . . . . . .  M309 310 M318
       56   SEC-GRP. . . . . . . . . . . .  M365
       47   SEC-HOLD-AREA. . . . . . . . .  M477 483 M500 508 M525 532 M549 556 570 571 M700 706 726 727 M744 757 781 782
       54   SEC-NAME . . . . . . . . . . .  366
       40   SUB-1. . . . . . . . . . . . .  M354 355 356 365 366 375 377 M478 M501 M528 M550 571 576 M585 M609 M636 M661
                                            686 691
       41   SUB-2. . . . . . . . . . . . .  M360 361 M362 366 376 377 M385 397 402 M412 M433 M454 M478 M502 M528 M551 571
                                            576 M585 M610 M636 M662 686 691
       42   SUB-3. . . . . . . . . . . . .  M370 371 M372 377 M585 M611 M636 M663 686 691
      106   TEST-COMPUTED. . . . . . . . .  334
      121   TEST-CORRECT . . . . . . . . .  336
      174   TEST-ID. . . . . . . . . . . .  M239
       94   TEST-RESULTS . . . . . . . . .  M240 258
      152   TOTAL-ERROR
      223   XXCOMPUTED . . . . . . . . . .  M343
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    22
0 Defined   Cross-reference of data names   References

0     225   XXCORRECT. . . . . . . . . . .  M343
      218   XXINFO . . . . . . . . . . . .  330 345
       70   3-DIMENSION-TBL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    23
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

      339   BAIL-OUT . . . . . . . . . . .  P261
      347   BAIL-OUT-EX. . . . . . . . . .  E261 G341
      342   BAIL-OUT-WRITE . . . . . . . .  G340
      323   BLANK-LINE-PRINT
      353   BUILD-LEVEL-1. . . . . . . . .  G364
      359   BUILD-LEVEL-2. . . . . . . . .  G374
      369   BUILD-LEVEL-3. . . . . . . . .  G379
      917   CCVS-EXIT
      918   CCVS-999999
      236   CCVS1
      348   CCVS1-EXIT . . . . . . . . . .  G242
      381   CHECK-ENTRIES. . . . . . . . .  G355
      243   CLOSE-FILES. . . . . . . . . .  G919
      271   COLUMN-NAMES-ROUTINE . . . . .  E241
      252   DE-LETE. . . . . . . . . . . .  P422 P443 P466 P489 P514 P538 P561 P598 P625 P649 P676 P711 P819 P845
      684   ELEM-FAIL-PARA . . . . . . . .  P601 P628 P652 P679
      275   END-ROUTINE. . . . . . . . . .  P244
      279   END-ROUTINE-1
      288   END-ROUTINE-12
      296   END-ROUTINE-13 . . . . . . . .  E244
      277   END-RTN-EXIT
      251   FAIL . . . . . . . . . . . . .  P405 P425 P446 P579 P693 P723 P735 P778 P790 P802 P825 P856 P861 P897 P908 P914
      325   FAIL-ROUTINE . . . . . . . . .  P260
      338   FAIL-ROUTINE-EX. . . . . . . .  E260 G332
      333   FAIL-ROUTINE-WRITE . . . . . .  G326 G327
      395   GRP-FAIL-PARGRAPH. . . . . . .  P388 P469
      266   HEAD-ROUTINE . . . . . . . . .  P241
      249   INSPT
      237   OPEN-FILES
      250   PASS . . . . . . . . . . . . .  P391 P419 P440 P463 P486 P511 P535 P557 P595 P622 P646 P673 P708 P766 P814 P840
                                            P884
      461   PASS-TH1-F1-4. . . . . . . . .  G459
      593   PASS-TH3-1 . . . . . . . . . .  G591
      254   PRINT-DETAIL . . . . . . . . .  P392 P406 P427 P448 P471 P494 P519 P543 P566 P603 P630 P654 P681 P737 P804 P827
                                            P863 P916
      710   SCH-DELETE-F1-1
      713   SCH-FAIL-F1-1-A. . . . . . . .  G703
      725   SCH-FAIL-F1-1-B. . . . . . . .  G705
      768   SCH-FAIL-F1-2-A. . . . . . . .  G750
      780   SCH-FAIL-F1-2-B. . . . . . . .  G756
      792   SCH-FAIL-F1-2-C. . . . . . . .  G762
      695   SCH-INIT-F1-1. . . . . . . . .  G682
      739   SCH-INIT-F1-2
      702   SCH-TEST-F1-1
      747   SCH-TEST-F1-2
      736   SCH-WRITE-F1-1 . . . . . . . .  G709 G712 G724
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    24
0 Defined   Cross-reference of procedures   References

0     803   SCH-WRITE-F1-2 . . . . . . . .  G767 G779 G791
      569   SEC-FAIL-PARGRAF . . . . . . .  P492 P517 P541 P564
      350   SECT-NC232A-001
      818   SPC-DELETE-F1-1
      844   SPC-DELETE-F1-2
      821   SPC-FAIL-F1-1. . . . . . . . .  G817
      847   SPC-FAIL-F1-2-A. . . . . . . .  G837
      858   SPC-FAIL-F1-2-B. . . . . . . .  G843
      888   SPC-FAIL-F1-3-A. . . . . . . .  G873
      899   SPC-FAIL-F1-3-B. . . . . . . .  G879
      910   SPC-FAIL-F1-3-C. . . . . . . .  G887
      806   SPC-INIT-F1-1
      829   SPC-INIT-F1-2
      865   SPC-INIT-F1-3
      811   SPC-TEST-F1-1
      835   SPC-TEST-F1-2
      870   SPC-TEST-F1-3
      826   SPC-WRITE-F1-1 . . . . . . . .  G815 G820
      862   SPC-WRITE-F1-2 . . . . . . . .  G841 G846 G857
      915   SPC-WRITE-F1-3 . . . . . . . .  G885 G898 G909
      247   TERMINATE-CALL
      245   TERMINATE-CCVS
      351   TH-03-001
      421   TH1-DELETE-F1-2
      442   TH1-DELETE-F1-3
      465   TH1-DELETE-F1-4
      424   TH1-FAIL-F1-2. . . . . . . . .  G416
      445   TH1-FAIL-F1-3. . . . . . . . .  G437
      468   TH1-FAIL-F1-4. . . . . . . . .  G460
      408   TH1-INIT-F1-2
      429   TH1-INIT-F1-3
      450   TH1-INIT-F1-4
      414   TH1-TEST-F1-2. . . . . . . . .  G389 G393
      435   TH1-TEST-F1-3
      456   TH1-TEST-F1-4
      426   TH1-WRITE-F1-2 . . . . . . . .  G420 G423
      447   TH1-WRITE-F1-3 . . . . . . . .  G441 G444
      470   TH1-WRITE-F1-4 . . . . . . . .  G464 G467
      488   TH2-DELETE-F1-1
      513   TH2-DELETE-F1-2
      537   TH2-DELETE-F1-3
      560   TH2-DELETE-F1-4
      491   TH2-FAIL-F1-1. . . . . . . . .  G482
      516   TH2-FAIL-F1-2. . . . . . . . .  G507
      540   TH2-FAIL-F1-3. . . . . . . . .  G531
      563   TH2-FAIL-F1-4. . . . . . . . .  G559
      473   TH2-INIT-F1-1
      496   TH2-INIT-F1-2
      521   TH2-INIT-F1-3
      545   TH2-INIT-F1-4
      480   TH2-TEST-F1-1
      505   TH2-TEST-F1-2
      529   TH2-TEST-F1-3
      554   TH2-TEST-F1-4
      493   TH2-WRITE-F1-1 . . . . . . . .  G487 G490
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    25
0 Defined   Cross-reference of procedures   References

0     518   TH2-WRITE-F1-2 . . . . . . . .  G512 G515
      542   TH2-WRITE-F1-3 . . . . . . . .  G536 G539
      565   TH2-WRITE-F1-4 . . . . . . . .  G558 G562
      597   TH3-DELETE-F1-1
      624   TH3-DELETE-F1-2
      648   TH3-DELETE-F1-3
      675   TH3-DELETE-F1-4
      600   TH3-FAIL-F1-1. . . . . . . . .  G592
      627   TH3-FAIL-F1-2. . . . . . . . .  G618
      651   TH3-FAIL-F1-3. . . . . . . . .  G642
      678   TH3-FAIL-F1-4
      581   TH3-INIT-F1-1. . . . . . . . .  G567
      605   TH3-INIT-F1-2
      632   TH3-INIT-F1-3
      656   TH3-INIT-F1-4
      588   TH3-TEST-F1-1
      616   TH3-TEST-F1-2
      639   TH3-TEST-F1-3
      667   TH3-TEST-F1-4. . . . . . . . .  G669
      602   TH3-WRITE-F1-1 . . . . . . . .  G596 G599
      629   TH3-WRITE-F1-2 . . . . . . . .  G623 G626
      653   TH3-WRITE-F1-3 . . . . . . . .  G647 G650
      680   TH3-WRITE-F1-4 . . . . . . . .  G674 G677
      308   WRITE-LINE . . . . . . . . . .  P258 P259 P267 P268 P269 P270 P272 P273 P274 P276 P278 P287 P295 P301 P306 P307
                                            P330 P334 P336 P345
      320   WRT-LN . . . . . . . . . . . .  P314 P315 P316 P319 P324
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    26
0 Defined   Cross-reference of programs     References

        3   NC232A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC232A    Date 06/04/2022  Time 11:57:57   Page    27
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    353  IGYPS2015-I   The paragraph or section prior to paragraph or section "BUILD-LEVEL-1" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC232A:
 *    Source records = 919
 *    Data Division statements = 94
 *    Procedure Division statements = 519
 *    Generated COBOL statements = 0
 *    Program complexity factor = 530
0End of compilation 1,  program NC232A,  highest severity 0.
0Return code 0
