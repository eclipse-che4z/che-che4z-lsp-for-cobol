1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:25   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:25   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1024.2
   000002         000200 PROGRAM-ID.                                                      NC1024.2
   000003         000300     NC102A.                                                      NC1024.2
   000004         000400                                                                  NC1024.2
   000005         000600*                                                              *  NC1024.2
   000006         000700*    VALIDATION FOR:-                                          *  NC1024.2
   000007         000800*                                                              *  NC1024.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1024.2
   000009         001000*                                                              *  NC1024.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1024.2
   000011         001200*                                                              *  NC1024.2
   000012         001400*                                                              *  NC1024.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1024.2
   000014         001600*                                                              *  NC1024.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC1024.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC1024.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC1024.2
   000018         002000*                                                              *  NC1024.2
   000019         002200*                                                                 NC1024.2
   000020         002300*    THIS PROGRAM TESTS FORMATS 1, 2 AND 3 OF THE "PERFORM"       NC1024.2
   000021         002400*    STATEMENT, FORMATS 1 AND 2 OF THE "GO" STATEMENT AND         NC1024.2
   000022         002500*    THE "EXIT" STATEMENT.                                        NC1024.2
   000023         002600*                                                                 NC1024.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1024.2
   000025         002800 CONFIGURATION SECTION.                                           NC1024.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1024.2
   000027         003000     XXXXX082.                                                    NC1024.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1024.2
   000029         003200     XXXXX083.                                                    NC1024.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1024.2
   000031         003400 FILE-CONTROL.                                                    NC1024.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1024.2 36
   000033         003600     XXXXX055.                                                    NC1024.2
   000034         003700 DATA DIVISION.                                                   NC1024.2
   000035         003800 FILE SECTION.                                                    NC1024.2
   000036         003900 FD  PRINT-FILE.                                                  NC1024.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1024.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1024.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1024.2
   000040         004300 01  PERFORM3    PIC 9    VALUE 5.                                NC1024.2
   000041         004400 01  WRK-XN-18-1 PIC X(18).                                       NC1024.2
   000042         004500 01  WRK-AN-X-18-1, REDEFINES WRK-XN-18-1 PIC A(18).              NC1024.2 41
   000043         004600 01  WRK-DU-X-18V0-1  REDEFINES WRK-XN-18-1 PIC 9(18).            NC1024.2 41
   000044         004700 01  WRK-DU-0V1-1 PIC V9 VALUE .3.                                NC1024.2
   000045         004800 01  WRK-DU-0V2-1 PIC V99 VALUE .25.                              NC1024.2
   000046         004900 01  WRK-DU-0V12-1 PIC V9(12) VALUE .00001.                       NC1024.2
   000047         005000 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1024.2 IMP
   000048         005100 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1024.2
   000049         005200 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1024.2
   000050         005300 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1024.2
   000051         005400 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1024.2
   000052         005500 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1024.2
   000053         005600 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1024.2
   000054         005700 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  WRK-DU-2V0-1 PIC 99.                                         NC1024.2
   000056         005900 01  WRK-DU-2V0-2 PIC 99.                                         NC1024.2
   000057         006000 01  WRK-DU-2V0-3 PIC 99.                                         NC1024.2
   000058         006100 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1024.2
   000059         006200 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1024.2
   000060         006300 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1024.2
   000061         006400 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1024.2
   000062         006500 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1024.2
   000063         006600 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1024.2
   000064         006700 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1024.2
   000065         006800 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1024.2
   000066         006900 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1024.2
   000067         007000 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1024.2
   000068         007100 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1024.2
   000069         007200 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1024.2
   000070         007300 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1024.2
   000071         007400 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1024.2
   000072         007500 01  WRK-NE-X-1 PIC 9(16).99.                                     NC1024.2
   000073         007600 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1024.2
   000074         007700 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1024.2
   000075         007800 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1024.2 IMP
   000076         007900 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1024.2 IMP
   000077         008000 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1024.2 IMP
   000078         008100 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1024.2 IMP
   000079         008200 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1024.2
   000080         008300 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1024.2
   000081         008400 01  WRK-NE-X-2 PIC -9(16).99.                                    NC1024.2
   000082         008500 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC1024.2
   000083         008600 01  WRK-NE-2 PIC $**.99.                                         NC1024.2
   000084         008700 01  WRK-NE-3 PIC $99.99CR.                                       NC1024.2
   000085         008800 01  WRK-NE-4 PIC $*9.99 VALUE ZERO.                              NC1024.2 IMP
   000086         008900 77  WRK-DS-02V00                 PICTURE S99.                    NC1024.2
   000087         009000 77  ATWO-DS-01V00                PICTURE S9                      NC1024.2
   000088         009100                                  VALUE 2.                        NC1024.2
   000089         009200 77  P-COUNT                      PICTURE 9(6).                   NC1024.2
   000090         009300 77  THREE                              PICTURE IS 9 VALUE IS 3.  NC1024.2
   000091         009400 77  WS-FOUR                            PICTURE IS 9 VALUE IS 4.  NC1024.2
   000092         009500 77  XRAY                               PICTURE IS X.             NC1024.2
   000093         009600 77  ALTERLOOP                          PICTURE IS 9 VALUE IS     NC1024.2
   000094         009700     ZERO.                                                        NC1024.2 IMP
   000095         009800 01  NOTE-RECORD.                                                 NC1024.2
   000096         009900     02 A     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000097         010000     02 B     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000098         010100     02 C     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000099         010200     02 D     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000100         010300     02 E     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000101         010400     02 F     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000102         010500     02 G     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000103         010600     02 H     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000104         010700     02 I     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000105         010800     02 J     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000106         010900     02 K     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000107         011000     02 L     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000108         011100     02 M     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000109         011200     02 N     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000110         011300     02 O     PICTURE X VALUE SPACE.                              NC1024.2 IMP
   000111         011400     02 P     PICTURE X VALUE SPACE.                              NC1024.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  GO-TABLE.                                                    NC1024.2
   000113         011600     02 GO-SCRIPT OCCURS 8 TIMES PICTURE 9.                       NC1024.2
   000114         011700 01  GO-TO-DEPEND                       PICTURE IS 9 VALUE IS 0.  NC1024.2
   000115         011800 01  GO-TO-DEEP                         PICTURE IS 9 VALUE IS 1.  NC1024.2
   000116         011900 01  PERFORM1                           PICTURE IS XXX            NC1024.2
   000117         012000     VALUE IS SPACE.                                              NC1024.2 IMP
   000118         012100 01  PERFORM2                           PICTURE IS S999           NC1024.2
   000119         012200     VALUE IS 20.                                                 NC1024.2
   000120         012300 01  PERFORM4                           PICTURE IS S99V9.         NC1024.2
   000121         012400 01  PERFORM5                           PICTURE IS 999            NC1024.2
   000122         012500     VALUE IS ZERO.                                               NC1024.2 IMP
   000123         012600 01  PERFORM-KEY                        PICTURE IS 9.             NC1024.2
   000124         012700 01  PERFORM-HOLD.                                                NC1024.2
   000125         012800     02  TEST-LETTER OCCURS 20 TIMES  PICTURE X.                  NC1024.2
   000126         012900 01  TEST-RESULTS.                                                NC1024.2
   000127         013000     02 FILLER                   PIC X      VALUE SPACE.          NC1024.2 IMP
   000128         013100     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1024.2 IMP
   000129         013200     02 FILLER                   PIC X      VALUE SPACE.          NC1024.2 IMP
   000130         013300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1024.2 IMP
   000131         013400     02 FILLER                   PIC X      VALUE SPACE.          NC1024.2 IMP
   000132         013500     02  PAR-NAME.                                                NC1024.2
   000133         013600       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1024.2 IMP
   000134         013700       03  PARDOT-X              PIC X      VALUE SPACE.          NC1024.2 IMP
   000135         013800       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1024.2 IMP
   000136         013900     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1024.2 IMP
   000137         014000     02 RE-MARK                  PIC X(61).                       NC1024.2
   000138         014100 01  TEST-COMPUTED.                                               NC1024.2
   000139         014200     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1024.2 IMP
   000140         014300     02 FILLER                   PIC X(17)  VALUE                 NC1024.2
   000141         014400            "       COMPUTED=".                                   NC1024.2
   000142         014500     02 COMPUTED-X.                                               NC1024.2
   000143         014600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1024.2 IMP
   000144         014700     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1024.2 143
   000145         014800                                 PIC -9(9).9(9).                  NC1024.2
   000146         014900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1024.2 143
   000147         015000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1024.2 143
   000148         015100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1024.2 143
   000149         015200     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1024.2 143
   000150         015300         04 COMPUTED-18V0                    PIC -9(18).          NC1024.2
   000151         015400         04 FILLER                           PIC X.               NC1024.2
   000152         015500     03 FILLER PIC X(50) VALUE SPACE.                             NC1024.2 IMP
   000153         015600 01  TEST-CORRECT.                                                NC1024.2
   000154         015700     02 FILLER PIC X(30) VALUE SPACE.                             NC1024.2 IMP
   000155         015800     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1024.2
   000156         015900     02 CORRECT-X.                                                NC1024.2
   000157         016000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1024.2 IMP
   000158         016100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1024.2 157
   000159         016200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1024.2 157
   000160         016300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1024.2 157
   000161         016400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1024.2 157
   000162         016500     03      CR-18V0 REDEFINES CORRECT-A.                         NC1024.2 157
   000163         016600         04 CORRECT-18V0                     PIC -9(18).          NC1024.2
   000164         016700         04 FILLER                           PIC X.               NC1024.2
   000165         016800     03 FILLER PIC X(2) VALUE SPACE.                              NC1024.2 IMP
   000166         016900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1024.2 IMP
   000167         017000 01  CCVS-C-1.                                                    NC1024.2
   000168         017100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200-    "SS  PARAGRAPH-NAME                                          NC1024.2
   000170         017300-    "       REMARKS".                                            NC1024.2
   000171         017400     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1024.2 IMP
   000172         017500 01  CCVS-C-2.                                                    NC1024.2
   000173         017600     02 FILLER                     PIC X        VALUE SPACE.      NC1024.2 IMP
   000174         017700     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1024.2
   000175         017800     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1024.2 IMP
   000176         017900     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1024.2
   000177         018000     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1024.2 IMP
   000178         018100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1024.2 IMP
   000179         018200 01  REC-CT                        PIC 99       VALUE ZERO.       NC1024.2 IMP
   000180         018300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1024.2 IMP
   000181         018400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1024.2 IMP
   000182         018500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1024.2 IMP
   000183         018600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1024.2 IMP
   000184         018700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1024.2 IMP
   000185         018800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1024.2 IMP
   000186         018900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1024.2 IMP
   000187         019000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1024.2 IMP
   000188         019100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1024.2 IMP
   000189         019200 01  CCVS-H-1.                                                    NC1024.2
   000190         019300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1024.2 IMP
   000191         019400     02  FILLER                    PIC X(42)    VALUE             NC1024.2
   000192         019500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1024.2
   000193         019600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1024.2 IMP
   000194         019700 01  CCVS-H-2A.                                                   NC1024.2
   000195         019800   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1024.2 IMP
   000196         019900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1024.2
   000197         020000   02  FILLER                        PIC XXXX   VALUE             NC1024.2
   000198         020100     "4.2 ".                                                      NC1024.2
   000199         020200   02  FILLER                        PIC X(28)  VALUE             NC1024.2
   000200         020300            " COPY - NOT FOR DISTRIBUTION".                       NC1024.2
   000201         020400   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1024.2 IMP
   000202         020500                                                                  NC1024.2
   000203         020600 01  CCVS-H-2B.                                                   NC1024.2
   000204         020700   02  FILLER                        PIC X(15)  VALUE             NC1024.2
   000205         020800            "TEST RESULT OF ".                                    NC1024.2
   000206         020900   02  TEST-ID                       PIC X(9).                    NC1024.2
   000207         021000   02  FILLER                        PIC X(4)   VALUE             NC1024.2
   000208         021100            " IN ".                                               NC1024.2
   000209         021200   02  FILLER                        PIC X(12)  VALUE             NC1024.2
   000210         021300     " HIGH       ".                                              NC1024.2
   000211         021400   02  FILLER                        PIC X(22)  VALUE             NC1024.2
   000212         021500            " LEVEL VALIDATION FOR ".                             NC1024.2
   000213         021600   02  FILLER                        PIC X(58)  VALUE             NC1024.2
   000214         021700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1024.2
   000215         021800 01  CCVS-H-3.                                                    NC1024.2
   000216         021900     02  FILLER                      PIC X(34)  VALUE             NC1024.2
   000217         022000            " FOR OFFICIAL USE ONLY    ".                         NC1024.2
   000218         022100     02  FILLER                      PIC X(58)  VALUE             NC1024.2
   000219         022200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1024.2
   000220         022300     02  FILLER                      PIC X(28)  VALUE             NC1024.2
   000221         022400            "  COPYRIGHT   1985 ".                                NC1024.2
   000222         022500 01  CCVS-E-1.                                                    NC1024.2
   000223         022600     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1024.2 IMP
   000224         022700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1024.2
   000225         022800     02 ID-AGAIN                     PIC X(9).                    NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1024.2 IMP
   000227         023000 01  CCVS-E-2.                                                    NC1024.2
   000228         023100     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1024.2 IMP
   000229         023200     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1024.2 IMP
   000230         023300     02 CCVS-E-2-2.                                               NC1024.2
   000231         023400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1024.2 IMP
   000232         023500         03 FILLER                   PIC X      VALUE SPACE.      NC1024.2 IMP
   000233         023600         03 ENDER-DESC               PIC X(44)  VALUE             NC1024.2
   000234         023700            "ERRORS ENCOUNTERED".                                 NC1024.2
   000235         023800 01  CCVS-E-3.                                                    NC1024.2
   000236         023900     02  FILLER                      PIC X(22)  VALUE             NC1024.2
   000237         024000            " FOR OFFICIAL USE ONLY".                             NC1024.2
   000238         024100     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1024.2 IMP
   000239         024200     02  FILLER                      PIC X(58)  VALUE             NC1024.2
   000240         024300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1024.2
   000241         024400     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1024.2 IMP
   000242         024500     02 FILLER                       PIC X(15)  VALUE             NC1024.2
   000243         024600             " COPYRIGHT 1985".                                   NC1024.2
   000244         024700 01  CCVS-E-4.                                                    NC1024.2
   000245         024800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1024.2 IMP
   000246         024900     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1024.2
   000247         025000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1024.2 IMP
   000248         025100     02 FILLER                       PIC X(40)  VALUE             NC1024.2
   000249         025200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1024.2
   000250         025300 01  XXINFO.                                                      NC1024.2
   000251         025400     02 FILLER                       PIC X(19)  VALUE             NC1024.2
   000252         025500            "*** INFORMATION ***".                                NC1024.2
   000253         025600     02 INFO-TEXT.                                                NC1024.2
   000254         025700       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1024.2 IMP
   000255         025800       04 XXCOMPUTED                 PIC X(20).                   NC1024.2
   000256         025900       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1024.2 IMP
   000257         026000       04 XXCORRECT                  PIC X(20).                   NC1024.2
   000258         026100     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1024.2
   000259         026200 01  HYPHEN-LINE.                                                 NC1024.2
   000260         026300     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1024.2 IMP
   000261         026400     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1024.2
   000262         026500-    "*****************************************".                 NC1024.2
   000263         026600     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1024.2
   000264         026700-    "******************************".                            NC1024.2
   000265         026800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1024.2
   000266         026900     "NC102A".                                                    NC1024.2
   000267         027000 PROCEDURE DIVISION.                                              NC1024.2
   000268         027100 CCVS1 SECTION.                                                   NC1024.2
   000269         027200 OPEN-FILES.                                                      NC1024.2
   000270         027300     OPEN     OUTPUT PRINT-FILE.                                  NC1024.2 36
   000271         027400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1024.2 265 206 265 225
   000272         027500     MOVE    SPACE TO TEST-RESULTS.                               NC1024.2 IMP 126
   000273         027600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1024.2 298 303
   000274         027700     GO TO CCVS1-EXIT.                                            NC1024.2 385
   000275         027800 CLOSE-FILES.                                                     NC1024.2
   000276         027900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1024.2 307 328 36
   000277         028000 TERMINATE-CCVS.                                                  NC1024.2
   000278         028100     EXIT PROGRAM.                                                NC1024.2
   000279         028200 TERMINATE-CALL.                                                  NC1024.2
   000280         028300     STOP     RUN.                                                NC1024.2
   000281         028400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1024.2 130 182
   000282         028500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1024.2 130 183
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1024.2 130 181
   000284         028700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1024.2 130 180
   000285         028800     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1024.2 137
   000286         028900 PRINT-DETAIL.                                                    NC1024.2
   000287         029000     IF REC-CT NOT EQUAL TO ZERO                                  NC1024.2 179 IMP
   000288      1  029100             MOVE "." TO PARDOT-X                                 NC1024.2 134
   000289      1  029200             MOVE REC-CT TO DOTVALUE.                             NC1024.2 179 135
   000290         029300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1024.2 126 37 340
   000291         029400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1024.2 130 340
   000292      1  029500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1024.2 361 375
   000293      1  029600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1024.2 376 384
   000294         029700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1024.2 IMP 130 IMP 142
   000295         029800     MOVE SPACE TO CORRECT-X.                                     NC1024.2 IMP 156
   000296         029900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1024.2 179 IMP IMP 132
   000297         030000     MOVE     SPACE TO RE-MARK.                                   NC1024.2 IMP 137
   000298         030100 HEAD-ROUTINE.                                                    NC1024.2
   000299         030200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1024.2 189 38 340
   000300         030300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1024.2 194 38 340
   000301         030400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1024.2 203 38 340
   000302         030500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1024.2 215 38 340
   000303         030600 COLUMN-NAMES-ROUTINE.                                            NC1024.2
   000304         030700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1024.2 167 38 340
   000305         030800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1024.2 172 38 340
   000306         030900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1024.2 259 38 340
   000307         031000 END-ROUTINE.                                                     NC1024.2
   000308         031100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1024.2 259 38 340
   000309         031200 END-RTN-EXIT.                                                    NC1024.2
   000310         031300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1024.2 222 38 340
   000311         031400 END-ROUTINE-1.                                                   NC1024.2
   000312         031500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1024.2 181 185 182
   000313         031600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1024.2 185 180 185
   000314         031700      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1024.2 183 185
   000315         031800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1024.2
   000316         031900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1024.2 183 245
   000317         032000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1024.2 185 247
   000318         032100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1024.2 244 230
   000319         032200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1024.2 227 38 340
   000320         032300  END-ROUTINE-12.                                                 NC1024.2
   000321         032400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1024.2 233
   000322         032500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1024.2 181 IMP
   000323      1  032600         MOVE "NO " TO ERROR-TOTAL                                NC1024.2 231
   000324         032700         ELSE                                                     NC1024.2
   000325      1  032800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1024.2 181 231
   000326         032900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1024.2 227 38
   000327         033000     PERFORM WRITE-LINE.                                          NC1024.2 340
   000328         033100 END-ROUTINE-13.                                                  NC1024.2
   000329         033200     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1024.2 180 IMP
   000330      1  033300         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1024.2 231
   000331      1  033400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1024.2 180 231
   000332         033500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1024.2 233
   000333         033600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1024.2 227 38 340
   000334         033700      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1024.2 182 IMP
   000335      1  033800          MOVE "NO " TO ERROR-TOTAL                               NC1024.2 231
   000336      1  033900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1024.2 182 231
   000337         034000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1024.2 233
   000338         034100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1024.2 227 38 340
   000339         034200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1024.2 235 38 340
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300 WRITE-LINE.                                                      NC1024.2
   000341         034400     ADD 1 TO RECORD-COUNT.                                       NC1024.2 187
   000342         034500     IF RECORD-COUNT GREATER 42                                   NC1024.2 187
   000343      1  034600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1024.2 38 186
   000344      1  034700         MOVE SPACE TO DUMMY-RECORD                               NC1024.2 IMP 38
   000345      1  034800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1024.2 38
   000346      1  034900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1024.2 189 38 356
   000347      1  035000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1024.2 194 38 356
   000348      1  035100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1024.2 203 38 356
   000349      1  035200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1024.2 215 38 356
   000350      1  035300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1024.2 167 38 356
   000351      1  035400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1024.2 172 38 356
   000352      1  035500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1024.2 259 38 356
   000353      1  035600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1024.2 186 38
   000354      1  035700         MOVE ZERO TO RECORD-COUNT.                               NC1024.2 IMP 187
   000355         035800     PERFORM WRT-LN.                                              NC1024.2 356
   000356         035900 WRT-LN.                                                          NC1024.2
   000357         036000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1024.2 38
   000358         036100     MOVE SPACE TO DUMMY-RECORD.                                  NC1024.2 IMP 38
   000359         036200 BLANK-LINE-PRINT.                                                NC1024.2
   000360         036300     PERFORM WRT-LN.                                              NC1024.2 356
   000361         036400 FAIL-ROUTINE.                                                    NC1024.2
   000362         036500     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1024.2 142 IMP
   000363      1  036600            GO TO FAIL-ROUTINE-WRITE.                             NC1024.2 370
   000364         036700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1024.2 156 IMP 370
   000365         036800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1024.2 188 258
   000366         036900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1024.2 253
   000367         037000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1024.2 250 38 340
   000368         037100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1024.2 IMP 258
   000369         037200     GO TO  FAIL-ROUTINE-EX.                                      NC1024.2 375
   000370         037300 FAIL-ROUTINE-WRITE.                                              NC1024.2
   000371         037400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1024.2 138 37 340
   000372         037500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1024.2 188 166
   000373         037600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1024.2 153 37 340
   000374         037700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1024.2 IMP 166
   000375         037800 FAIL-ROUTINE-EX. EXIT.                                           NC1024.2
   000376         037900 BAIL-OUT.                                                        NC1024.2
   000377         038000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1024.2 143 IMP 379
   000378         038100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1024.2 157 IMP 384
   000379         038200 BAIL-OUT-WRITE.                                                  NC1024.2
   000380         038300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1024.2 157 257 143 255
   000381         038400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1024.2 188 258
   000382         038500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1024.2 250 38 340
   000383         038600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1024.2 IMP 258
   000384         038700 BAIL-OUT-EX. EXIT.                                               NC1024.2
   000385         038800 CCVS1-EXIT.                                                      NC1024.2
   000386         038900     EXIT.                                                        NC1024.2
   000387         039000 SECT-NC102A-001 SECTION.                                         NC1024.2
   000388         039100 GO--INIT-F1-1.                                                   NC1024.2
   000389         039200     MOVE    "V1-88 6.14.4 GR1"  TO ANSI-REFERENCE.               NC1024.2 188
   000390         039300 GO--TEST-F1-1.                                                   NC1024.2
   000391         039400     GO TO    GO--PASS-F1-1.                                      NC1024.2 397
   000392         039500     PERFORM  FAIL.                                               NC1024.2 283
   000393         039600     GO TO    GO--WRITE-F1-1.                                     NC1024.2 399
   000394         039700 GO--DELETE-F1-1.                                                 NC1024.2
   000395         039800     PERFORM  DE-LETE.                                            NC1024.2 284
   000396         039900     GO TO    GO--WRITE-F1-1.                                     NC1024.2 399
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 GO--PASS-F1-1.                                                   NC1024.2
   000398         040100     PERFORM  PASS.                                               NC1024.2 282
   000399         040200 GO--WRITE-F1-1.                                                  NC1024.2
   000400         040300     MOVE "GO TO " TO FEATURE.                                    NC1024.2 128
   000401         040400     MOVE "GO--TEST-F1-1" TO PAR-NAME.                            NC1024.2 132
   000402         040500     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000403         040600 GO--INIT-F2-1.                                                   NC1024.2
   000404         040700     MOVE    "V1-88 6.14.4 GR3"  TO ANSI-REFERENCE.               NC1024.2 188
   000405         040800     MOVE    "GO--TEST-F2-1" TO PAR-NAME.                         NC1024.2 132
   000406         040900     MOVE     SPACE TO P-OR-F.                                    NC1024.2 IMP 130
   000407         041000     MOVE "GO TO DEPENDING" TO FEATURE.                           NC1024.2 128
   000408         041100     MOVE  0 TO GO-TO-DEPEND.                                     NC1024.2 114
   000409         041200 GO--TEST-F2-1.                                                   NC1024.2
   000410         041300     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000411         041400     MOVE     SPACE TO FEATURE.                                   NC1024.2 IMP 128
   000412         041500     GO TO    GO--B                                               NC1024.2 436
   000413         041600              GO--D                                               NC1024.2 454
   000414         041700              GO--C DEPENDING ON GO-TO-DEPEND.                    NC1024.2 445 114
   000415         041800*    NOTE GO--TEST-F2-1 THRU GO--E TEST THE GO TO                 NC1024.2
   000416         041900*    DEPENDING OPTION FOR GO-TO-DEPEND EQUAL TO 0,1,3,2,4.        NC1024.2
   000417         042000*    NOTE INITIAL VALUE OF GO-TO-DEPEND IS ZERO.                  NC1024.2
   000418         042100     GO TO    GO--A.                                              NC1024.2 423
   000419         042200 GO--DELETE-F2-1.                                                 NC1024.2
   000420         042300     MOVE "GO--TEST-F2-1" TO PAR-NAME.                            NC1024.2 132
   000421         042400     PERFORM  DE-LETE.                                            NC1024.2 284
   000422         042500     GO TO    GO--WRITE-F2-1.                                     NC1024.2 469
   000423         042600 GO--A.                                                           NC1024.2
   000424         042700     MOVE "GO--A" TO PAR-NAME.                                    NC1024.2 132
   000425         042800     IF       GO-TO-DEPEND EQUAL TO 0                             NC1024.2 114
   000426      1  042900              PERFORM PASS                                        NC1024.2 282
   000427      1  043000              ADD 1 TO GO-TO-DEPEND                               NC1024.2 114
   000428      1  043100              GO TO GO--TEST-F2-1.                                NC1024.2 409
   000429         043200     IF       GO-TO-DEPEND GREATER THAN 3                         NC1024.2 114
   000430      1  043300              GO TO GO--E.                                        NC1024.2 463
   000431         043400     PERFORM  FAIL                                                NC1024.2 283
   000432         043500              MOVE 1 TO GO-TO-DEPEND                              NC1024.2 114
   000433         043600              GO TO GO--TEST-F2-1.                                NC1024.2 409
   000434         043700*    NOTE CONTROL SHOULD FALL THRU TO GO--A FOR GO-TO-DEPEND      NC1024.2
   000435         043800*    EQUAL TO 0, 4.                                               NC1024.2
   000436         043900 GO--B.                                                           NC1024.2
   000437         044000     MOVE "GO--B" TO PAR-NAME.                                    NC1024.2 132
   000438         044100     IF       GO-TO-DEPEND NOT EQUAL TO 1                         NC1024.2 114
   000439      1  044200              PERFORM FAIL                                        NC1024.2 283
   000440      1  044300              MOVE 3 TO GO-TO-DEPEND                              NC1024.2 114
   000441      1  044400              GO TO GO--TEST-F2-1.                                NC1024.2 409
   000442         044500     PERFORM  PASS.                                               NC1024.2 282
   000443         044600     ADD      2 TO GO-TO-DEPEND.                                  NC1024.2 114
   000444         044700     GO TO    GO--TEST-F2-1.                                      NC1024.2 409
   000445         044800 GO--C.                                                           NC1024.2
   000446         044900     MOVE "GO--C" TO PAR-NAME.                                    NC1024.2 132
   000447         045000     IF       GO-TO-DEPEND NOT EQUAL TO 3                         NC1024.2 114
   000448      1  045100              PERFORM FAIL                                        NC1024.2 283
   000449      1  045200              MOVE 2 TO GO-TO-DEPEND                              NC1024.2 114
   000450      1  045300              GO TO GO--TEST-F2-1.                                NC1024.2 409
   000451         045400     PERFORM  PASS.                                               NC1024.2 282
   000452         045500     SUBTRACT 1 FROM GO-TO-DEPEND.                                NC1024.2 114
   000453         045600     GO TO    GO--TEST-F2-1.                                      NC1024.2 409
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700 GO--D.                                                           NC1024.2
   000455         045800     MOVE "GO--D" TO PAR-NAME.                                    NC1024.2 132
   000456         045900     IF       GO-TO-DEPEND NOT EQUAL TO 2                         NC1024.2 114
   000457      1  046000              PERFORM FAIL                                        NC1024.2 283
   000458      1  046100              MOVE 4 TO GO-TO-DEPEND                              NC1024.2 114
   000459      1  046200              GO TO GO--TEST-F2-1.                                NC1024.2 409
   000460         046300     PERFORM  PASS.                                               NC1024.2 282
   000461         046400     ADD      2 TO GO-TO-DEPEND.                                  NC1024.2 114
   000462         046500     GO TO    GO--TEST-F2-1.                                      NC1024.2 409
   000463         046600 GO--E.                                                           NC1024.2
   000464         046700     MOVE "GO--E" TO PAR-NAME.                                    NC1024.2 132
   000465         046800     IF       GO-TO-DEPEND EQUAL TO 4                             NC1024.2 114
   000466      1  046900              PERFORM PASS                                        NC1024.2 282
   000467      1  047000              GO TO GO--WRITE-F2-1.                               NC1024.2 469
   000468         047100     PERFORM  FAIL.                                               NC1024.2 283
   000469         047200 GO--WRITE-F2-1.                                                  NC1024.2
   000470         047300     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000471         047400 GO--INIT-F1-2.                                                   NC1024.2
   000472         047500     MOVE    "V1-88 6.14.4 GR1"  TO ANSI-REFERENCE.               NC1024.2 188
   000473         047600 GO--TEST-F1-2.                                                   NC1024.2
   000474         047700     GO TO    GO--PASS-F1-2.                                      NC1024.2 481
   000475         047800*    NOTE THAT GO--PASS-F1-2 IS A SECTION-NAME.                   NC1024.2
   000476         047900     PERFORM  FAIL.                                               NC1024.2 283
   000477         048000     GO TO    GO--WRITE-F1-2.                                     NC1024.2 484
   000478         048100 GO--DELETE-F1-2.                                                 NC1024.2
   000479         048200     PERFORM DE-LETE.                                             NC1024.2 284
   000480         048300     GO TO   GO--WRITE-F1-2.                                      NC1024.2 484
   000481         048400 GO--PASS-F1-2   SECTION.                                         NC1024.2
   000482         048500 GO--PAS-F1-2.                                                    NC1024.2
   000483         048600     PERFORM PASS.                                                NC1024.2 282
   000484         048700 GO--WRITE-F1-2.                                                  NC1024.2
   000485         048800     MOVE "GO TO" TO FEATURE.                                     NC1024.2 128
   000486         048900     MOVE "GO--TEST-F1-2" TO PAR-NAME.                            NC1024.2 132
   000487         049000     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000488         049100*                                                                 NC1024.2
   000489         049200*                                                                 NC1024.2
   000490         049300 GO--INIT-F2-2.                                                   NC1024.2
   000491         049400     MOVE    "V1-88 6.14.4 GR3"  TO ANSI-REFERENCE.               NC1024.2 188
   000492         049500     MOVE    1 TO GO-TO-DEEP.                                     NC1024.2 115
   000493         049600 GO--TEST-F2-2.                                                   NC1024.2
   000494         049700     GO TO   GO--PASS-F2-2                                        NC1024.2 501
   000495         049800             GO--FAIL-F2-2 DEPENDING ON GO-TO-DEEP.               NC1024.2 506 115
   000496         049900*    NOTE THAT GO--PASS-F2-2 IS A SECTION-NAME.                   NC1024.2
   000497         050000     GO TO   GO--FAIL-F2-2.                                       NC1024.2 506
   000498         050100 GO--DELETE-F2-2.                                                 NC1024.2
   000499         050200     PERFORM DE-LETE.                                             NC1024.2 284
   000500         050300     GO TO   GO--WRITE-F2-2.                                      NC1024.2 510
   000501         050400 GO--PASS-F2-2   SECTION.                                         NC1024.2
   000502         050500 GO--PAS-F2-2.                                                    NC1024.2
   000503         050600     IF      GO-TO-DEEP EQUAL TO 1                                NC1024.2 115
   000504      1  050700             PERFORM PASS                                         NC1024.2 282
   000505      1  050800             GO TO GO--WRITE-F2-2.                                NC1024.2 510
   000506         050900 GO--FAIL-F2-2.                                                   NC1024.2
   000507         051000     MOVE    GO-TO-DEEP TO COMPUTED-N.                            NC1024.2 115 144
   000508         051100     MOVE    1 TO CORRECT-N.                                      NC1024.2 158
   000509         051200     PERFORM FAIL.                                                NC1024.2 283
   000510         051300 GO--WRITE-F2-2.                                                  NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE "GO TO DEPENDING" TO FEATURE.                           NC1024.2 128
   000512         051500     MOVE "GO--TEST-F2-2" TO PAR-NAME.                            NC1024.2 132
   000513         051600     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000514         051700 GO--INIT-F2-3.                                                   NC1024.2
   000515         051800     MOVE    "V1-88 6.14.4 GR3"  TO ANSI-REFERENCE.               NC1024.2 188
   000516         051900     MOVE    0 TO GO-TO-DEEP.                                     NC1024.2 115
   000517         052000     MOVE    2 TO GO-TO-DEPEND.                                   NC1024.2 114
   000518         052100 GO--TEST-F2-3.                                                   NC1024.2
   000519         052200     IF      GO-TO-DEPEND EQUAL TO 2 GO TO GO--A-F2-3 GO--B-F2-3  NC1024.2 114 525 528
   000520      1  052300             DEPENDING ON GO-TO-DEPEND ELSE GO TO GO--C-F2-3      NC1024.2 114 531
   000521      1  052400             GO--D-F2-3 GO--E-F2-3 DEPENDING GO-TO-DEPEND.        NC1024.2 534 537 114
   000522         052500 GO--DELETE-F2-3.                                                 NC1024.2
   000523         052600     PERFORM  DE-LETE.                                            NC1024.2 284
   000524         052700     GO       TO GO--WRITE-F2-3.                                  NC1024.2 547
   000525         052800 GO--A-F2-3.                                                      NC1024.2
   000526         052900     MOVE     1 TO GO-TO-DEEP.                                    NC1024.2 115
   000527         053000     GO       TO GO--F-F2-3.                                      NC1024.2 540
   000528         053100 GO--B-F2-3.                                                      NC1024.2
   000529         053200     MOVE     2 TO GO-TO-DEEP.                                    NC1024.2 115
   000530         053300     GO       TO GO--F-F2-3.                                      NC1024.2 540
   000531         053400 GO--C-F2-3.                                                      NC1024.2
   000532         053500     MOVE     3 TO GO-TO-DEEP.                                    NC1024.2 115
   000533         053600     GO       TO GO--F-F2-3.                                      NC1024.2 540
   000534         053700 GO--D-F2-3.                                                      NC1024.2
   000535         053800     MOVE     4 TO GO-TO-DEEP.                                    NC1024.2 115
   000536         053900     GO       TO GO--F-F2-3.                                      NC1024.2 540
   000537         054000 GO--E-F2-3.                                                      NC1024.2
   000538         054100     MOVE     5 TO GO-TO-DEEP.                                    NC1024.2 115
   000539         054200     GO       TO GO--F-F2-3.                                      NC1024.2 540
   000540         054300 GO--F-F2-3.                                                      NC1024.2
   000541         054400     IF       GO-TO-DEEP EQUAL TO 2                               NC1024.2 115
   000542      1  054500              PERFORM PASS GO TO GO--WRITE-F2-3.                  NC1024.2 282 547
   000543         054600 GO--FAIL-F2-3.                                                   NC1024.2
   000544         054700     PERFORM  FAIL.                                               NC1024.2 283
   000545         054800     MOVE     GO-TO-DEEP TO COMPUTED-N.                           NC1024.2 115 144
   000546         054900     MOVE     2 TO CORRECT-N.                                     NC1024.2 158
   000547         055000 GO--WRITE-F2-3.                                                  NC1024.2
   000548         055100     MOVE     "GO--TEST-F2-3 " TO PAR-NAME.                       NC1024.2 132
   000549         055200     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000550         055300 GO--INIT-F2-4.                                                   NC1024.2
   000551         055400     MOVE    "V1-88 6.14.4 GR3"  TO ANSI-REFERENCE.               NC1024.2 188
   000552         055500     MOVE     0 TO GO-TO-DEEP.                                    NC1024.2 115
   000553         055600     MOVE     3 TO GO-TO-DEPEND.                                  NC1024.2 114
   000554         055700 GO--TEST-F2-4.                                                   NC1024.2
   000555         055800     IF       GO-TO-DEPEND EQUAL TO 2 GO TO GO--A-F2-4 GO--B-F2-4 NC1024.2 114 561 564
   000556      1  055900              DEPENDING ON GO-TO-DEPEND ELSE GO TO GO--C-F2-4     NC1024.2 114 567
   000557      1  056000              GO--D-F2-4 GO--E-F2-4 DEPENDING GO-TO-DEPEND.       NC1024.2 570 573 114
   000558         056100 GO--DELETE-F2-4.                                                 NC1024.2
   000559         056200     PERFORM  DE-LETE.                                            NC1024.2 284
   000560         056300     GO       TO GO--WRITE-F2-4.                                  NC1024.2 583
   000561         056400 GO--A-F2-4.                                                      NC1024.2
   000562         056500     MOVE     1 TO GO-TO-DEEP.                                    NC1024.2 115
   000563         056600     GO       TO GO--F-F2-4.                                      NC1024.2 576
   000564         056700 GO--B-F2-4.                                                      NC1024.2
   000565         056800     MOVE     2 TO GO-TO-DEEP.                                    NC1024.2 115
   000566         056900     GO       TO GO--F-F2-4.                                      NC1024.2 576
   000567         057000 GO--C-F2-4.                                                      NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE     3 TO GO-TO-DEEP.                                    NC1024.2 115
   000569         057200     GO       TO GO--F-F2-4.                                      NC1024.2 576
   000570         057300 GO--D-F2-4.                                                      NC1024.2
   000571         057400     MOVE     4 TO GO-TO-DEEP.                                    NC1024.2 115
   000572         057500     GO       TO GO--F-F2-4.                                      NC1024.2 576
   000573         057600 GO--E-F2-4.                                                      NC1024.2
   000574         057700     MOVE     5 TO GO-TO-DEEP.                                    NC1024.2 115
   000575         057800     GO       TO GO--F-F2-4.                                      NC1024.2 576
   000576         057900 GO--F-F2-4.                                                      NC1024.2
   000577         058000     IF       GO-TO-DEEP EQUAL TO 5                               NC1024.2 115
   000578      1  058100              PERFORM PASS GO TO GO--WRITE-F2-4.                  NC1024.2 282 583
   000579         058200 GO--FAIL-F2-4.                                                   NC1024.2
   000580         058300     PERFORM  FAIL.                                               NC1024.2 283
   000581         058400     MOVE     GO-TO-DEEP TO COMPUTED-N.                           NC1024.2 115 144
   000582         058500     MOVE     5 TO CORRECT-N.                                     NC1024.2 158
   000583         058600 GO--WRITE-F2-4.                                                  NC1024.2
   000584         058700     MOVE     "GO--TEST-F2-4 " TO PAR-NAME.                       NC1024.2 132
   000585         058800     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000586         058900*                                                                 NC1024.2
   000587         059000*                                                                 NC1024.2
   000588         059100 GO--INIT-F2-5.                                                   NC1024.2
   000589         059200     MOVE    "V1-88 6.14.4 GR3"  TO ANSI-REFERENCE.               NC1024.2 188
   000590         059300     MOVE     "87654321" TO GO-TABLE.                             NC1024.2 112
   000591         059400     MOVE     0 TO GO-TO-DEEP.                                    NC1024.2 115
   000592         059500 GO--TEST-F2-5.                                                   NC1024.2
   000593         059600     GO       TO GO--A-F2-5 GO--B-F2-5 GO--C-F2-5 DEPENDING ON    NC1024.2 598 601 604
   000594         059700              GO-SCRIPT (7).                                      NC1024.2 113
   000595         059800 GO--DELETE-F2-5.                                                 NC1024.2
   000596         059900     PERFORM  DE-LETE.                                            NC1024.2 284
   000597         060000     GO       TO GO--WRITE-F2-5.                                  NC1024.2 614
   000598         060100 GO--A-F2-5.                                                      NC1024.2
   000599         060200     MOVE     1 TO GO-TO-DEEP.                                    NC1024.2 115
   000600         060300     GO       TO GO--D-F2-5.                                      NC1024.2 607
   000601         060400 GO--B-F2-5.                                                      NC1024.2
   000602         060500     MOVE     2 TO GO-TO-DEEP.                                    NC1024.2 115
   000603         060600     GO       TO GO--D-F2-5.                                      NC1024.2 607
   000604         060700 GO--C-F2-5.                                                      NC1024.2
   000605         060800     MOVE     3 TO GO-TO-DEEP.                                    NC1024.2 115
   000606         060900     GO       TO GO--D-F2-5.                                      NC1024.2 607
   000607         061000 GO--D-F2-5.                                                      NC1024.2
   000608         061100     IF       GO-TO-DEEP EQUAL TO 2                               NC1024.2 115
   000609      1  061200              PERFORM PASS GO TO GO--WRITE-F2-5.                  NC1024.2 282 614
   000610         061300 GO--FAIL-F2-5.                                                   NC1024.2
   000611         061400     PERFORM  FAIL.                                               NC1024.2 283
   000612         061500     MOVE     GO-TO-DEEP TO COMPUTED-N.                           NC1024.2 115 144
   000613         061600     MOVE     2 TO CORRECT-N.                                     NC1024.2 158
   000614         061700 GO--WRITE-F2-5.                                                  NC1024.2
   000615         061800     MOVE     "GO--TEST-F2-5 " TO PAR-NAME.                       NC1024.2 132
   000616         061900     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000617         062000*                                                                 NC1024.2
   000618         062100*                                                                 NC1024.2
   000619         062200 GO--INIT-F2-6.                                                   NC1024.2
   000620         062300*==--> SINGLE PROCEDURE GO DEPENDING <--==                        NC1024.2
   000621         062400     MOVE    "V1-88 6.14.4 GR3"  TO ANSI-REFERENCE.               NC1024.2 188
   000622         062500     MOVE    1 TO GO-TO-DEEP.                                     NC1024.2 115
   000623         062600 GO--TEST-F2-6.                                                   NC1024.2
   000624         062700     GO TO   GO--PASS-F2-6 DEPENDING ON GO-TO-DEEP.               NC1024.2 630 115
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800*    NOTE THAT GO--PASS-F2-6 IS A SECTION-NAME.                   NC1024.2
   000626         062900     GO TO   GO--FAIL-F2-6.                                       NC1024.2 635
   000627         063000 GO--DELETE-F2-6.                                                 NC1024.2
   000628         063100     PERFORM DE-LETE.                                             NC1024.2 284
   000629         063200     GO TO   GO--WRITE-F2-6.                                      NC1024.2 639
   000630         063300 GO--PASS-F2-6   SECTION.                                         NC1024.2
   000631         063400 GO--PAS-F2-6.                                                    NC1024.2
   000632         063500     IF      GO-TO-DEEP EQUAL TO 1                                NC1024.2 115
   000633      1  063600             PERFORM PASS                                         NC1024.2 282
   000634      1  063700             GO TO GO--WRITE-F2-6.                                NC1024.2 639
   000635         063800 GO--FAIL-F2-6.                                                   NC1024.2
   000636         063900     MOVE    GO-TO-DEEP TO COMPUTED-N.                            NC1024.2 115 144
   000637         064000     MOVE    1 TO CORRECT-N.                                      NC1024.2 158
   000638         064100     PERFORM FAIL.                                                NC1024.2 283
   000639         064200 GO--WRITE-F2-6.                                                  NC1024.2
   000640         064300     MOVE "GO TO DEPENDING" TO FEATURE.                           NC1024.2 128
   000641         064400     MOVE "GO--TEST-F2-6" TO PAR-NAME.                            NC1024.2 132
   000642         064500     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000643         064600*                                                                 NC1024.2
   000644         064700*                                                                 NC1024.2
   000645         064800 GO--INIT-F2-7.                                                   NC1024.2
   000646         064900     MOVE    "V1-88 6.14.4 GR3"  TO ANSI-REFERENCE.               NC1024.2 188
   000647         065000*    ==--> OPTIONAL "TO"  <--==                                   NC1024.2
   000648         065100     MOVE   "87654321" TO GO-TABLE.                               NC1024.2 112
   000649         065200     MOVE    0 TO GO-TO-DEEP.                                     NC1024.2 115
   000650         065300 GO--TEST-F2-7-0.                                                 NC1024.2
   000651         065400     GO      GO--A-F2-7 GO--B-F2-7 GO--C-F2-7 DEPENDING ON        NC1024.2 656 659 662
   000652         065500             GO-SCRIPT (7).                                       NC1024.2 113
   000653         065600 GO--DELETE-F2-7.                                                 NC1024.2
   000654         065700     PERFORM  DE-LETE.                                            NC1024.2 284
   000655         065800     GO       TO GO--WRITE-F2-7.                                  NC1024.2 672
   000656         065900 GO--A-F2-7.                                                      NC1024.2
   000657         066000     MOVE     1 TO GO-TO-DEEP.                                    NC1024.2 115
   000658         066100     GO       TO GO--D-F2-7.                                      NC1024.2 665
   000659         066200 GO--B-F2-7.                                                      NC1024.2
   000660         066300     MOVE     2 TO GO-TO-DEEP.                                    NC1024.2 115
   000661         066400     GO       TO GO--D-F2-7.                                      NC1024.2 665
   000662         066500 GO--C-F2-7.                                                      NC1024.2
   000663         066600     MOVE     3 TO GO-TO-DEEP.                                    NC1024.2 115
   000664         066700     GO       TO GO--D-F2-7.                                      NC1024.2 665
   000665         066800 GO--D-F2-7.                                                      NC1024.2
   000666         066900     IF       GO-TO-DEEP EQUAL TO 2                               NC1024.2 115
   000667      1  067000              PERFORM PASS GO TO GO--WRITE-F2-7.                  NC1024.2 282 672
   000668         067100 GO--FAIL-F2-7.                                                   NC1024.2
   000669         067200     PERFORM  FAIL.                                               NC1024.2 283
   000670         067300     MOVE     GO-TO-DEEP TO COMPUTED-N.                           NC1024.2 115 144
   000671         067400     MOVE     2 TO CORRECT-N.                                     NC1024.2 158
   000672         067500 GO--WRITE-F2-7.                                                  NC1024.2
   000673         067600     MOVE     "GO--TEST-F2-7 " TO PAR-NAME.                       NC1024.2 132
   000674         067700     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000675         067800*                                                                 NC1024.2
   000676         067900*                                                                 NC1024.2
   000677         068000 GO--INIT-F1-3.                                                   NC1024.2
   000678         068100     MOVE    "V1-88 6.14.4 GR1"  TO ANSI-REFERENCE.               NC1024.2 188
   000679         068200 GOTO-TEST-F1-3.                                                  NC1024.2
   000680         068300     GO P2.                                                       NC1024.2 687
   000681         068400 GOTO-FAIL-F1-3.                                                  NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     PERFORM FAIL.                                                NC1024.2 283
   000683         068600     GO TO GOTO-WRITE-F1-3.                                       NC1024.2 689
   000684         068700 GOTO-DELETE-F1-3.                                                NC1024.2
   000685         068800     PERFORM DE-LETE.                                             NC1024.2 284
   000686         068900     GO TO GOTO-WRITE-F1-3.                                       NC1024.2 689
   000687         069000 P2.                                                              NC1024.2
   000688         069100     PERFORM PASS.                                                NC1024.2 282
   000689         069200 GOTO-WRITE-F1-3.                                                 NC1024.2
   000690         069300     MOVE "GOTO-TEST-F1-3" TO PAR-NAME.                           NC1024.2 132
   000691         069400     MOVE "GO - NO OPTIONAL TO" TO FEATURE.                       NC1024.2 128
   000692         069500     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000693         069600 EXIT--INIT-GF-1.                                                 NC1024.2
   000694         069700     MOVE    "V1-87 6.13.2 "  TO ANSI-REFERENCE.                  NC1024.2 188
   000695         069800 EXIT-TEST-GF-1.                                                  NC1024.2
   000696         069900     GO TO    EXIT-CHECK-GF-1.                                    NC1024.2 700
   000697         070000 EXIT-DELETE-GF-1.                                                NC1024.2
   000698         070100     PERFORM  DE-LETE.                                            NC1024.2 284
   000699         070200     GO TO    EXIT-WRITE-GF-1.                                    NC1024.2 704
   000700         070300 EXIT-CHECK-GF-1.                                                 NC1024.2
   000701         070400     EXIT.                                                        NC1024.2
   000702         070500 EXIT-PASS-GF-1.                                                  NC1024.2
   000703         070600     PERFORM  PASS.                                               NC1024.2 282
   000704         070700 EXIT-WRITE-GF-1.                                                 NC1024.2
   000705         070800     MOVE "EXIT" TO FEATURE.                                      NC1024.2 128
   000706         070900     MOVE "EXIT-TEST-GF-1" TO PAR-NAME.                           NC1024.2 132
   000707         071000     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000708         071100 PFM-INIT-F1-1.                                                   NC1024.2
   000709         071200     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000710         071300     MOVE    1 TO PERFORM-KEY.                                    NC1024.2 123
   000711         071400 PFM-TEST-F1-1.                                                   NC1024.2
   000712         071500*    NOTE THIS TEST IS FOR OPTION 1 AND TESTS SIMPLE OUT OF       NC1024.2
   000713         071600*    LINE PERFORM.                                                NC1024.2
   000714         071700     PERFORM PFM-A.                                               NC1024.2 736
   000715         071800     IF      PERFORM1 EQUAL TO "ABC"                              NC1024.2 116
   000716      1  071900             PERFORM PASS                                         NC1024.2 282
   000717         072000     ELSE                                                         NC1024.2
   000718      1  072100             PERFORM FAIL.                                        NC1024.2 283
   000719         072200     GO TO   PFM-WRITE-F1-1.                                      NC1024.2 722
   000720         072300 PFM-DELETE-F1-1.                                                 NC1024.2
   000721         072400     PERFORM DE-LETE.                                             NC1024.2 284
   000722         072500 PFM-WRITE-F1-1.                                                  NC1024.2
   000723         072600     MOVE  "PERFORM" TO FEATURE.                                  NC1024.2 128
   000724         072700     MOVE  "PFM-TEST-F1-1" TO PAR-NAME.                           NC1024.2 132
   000725         072800     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000726         072900 PFM-INIT-F1-2.                                                   NC1024.2
   000727         073000     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000728         073100     MOVE    2 TO PERFORM-KEY.                                    NC1024.2 123
   000729         073200 PFM-TEST-F1-2.                                                   NC1024.2
   000730         073300*    NOTE THIS TEST IS DESIGNED TO TEST ENTERING A PROCEDURE      NC1024.2
   000731         073400*    IN LINE WHICH IS ALSO REFERENCED BY AN OUT OF LINE PERFORM.  NC1024.2
   000732         073500     GO TO    PFM-A.                                              NC1024.2 736
   000733         073600 PFM-DELETE-F1-2.                                                 NC1024.2
   000734         073700     PERFORM  DE-LETE.                                            NC1024.2 284
   000735         073800     GO TO    PFM-WRITE-F1-2.                                     NC1024.2 752
   000736         073900 PFM-A.                                                           NC1024.2
   000737         074000     IF       PERFORM-KEY EQUAL TO 1                              NC1024.2 123
   000738      1  074100              MOVE "ABC" TO PERFORM1                              NC1024.2 116
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     ELSE                                                         NC1024.2
   000740      1  074300              MOVE "XYZ" TO PERFORM1.                             NC1024.2 116
   000741         074400 PFM-B.                                                           NC1024.2
   000742         074500     IF       PERFORM-KEY EQUAL TO 1                              NC1024.2 123
   000743      1  074600              PERFORM FAIL                                        NC1024.2 283
   000744      1  074700              PERFORM PRINT-DETAIL                                NC1024.2 286
   000745      1  074800              GO TO PFM-TEST-F1-2.                                NC1024.2 729
   000746         074900*    NOTE FOR PFM-TEST-F1-1 CONTROL SHOULD NOT BE TRANSFERRED     NC1024.2
   000747         075000*    TO THIS PARAGRAPH BUT FOR PFM-TEST-F1-2 IT SHOULD BE.        NC1024.2
   000748         075100     IF       PERFORM1 EQUAL TO "XYZ"                             NC1024.2 116
   000749      1  075200              PERFORM PASS                                        NC1024.2 282
   000750         075300              ELSE                                                NC1024.2
   000751      1  075400              PERFORM FAIL.                                       NC1024.2 283
   000752         075500 PFM-WRITE-F1-2.                                                  NC1024.2
   000753         075600     MOVE "PERFORM" TO FEATURE.                                   NC1024.2 128
   000754         075700     MOVE "PFM-TEST-F1-2" TO PAR-NAME.                            NC1024.2 132
   000755         075800     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000756         075900 PFM-INIT-F2-1.                                                   NC1024.2
   000757         076000     MOVE    "V1-108 6.20.2"  TO ANSI-REFERENCE.                  NC1024.2 188
   000758         076100     MOVE  3 TO THREE.                                            NC1024.2 90
   000759         076200 PFM-TEST-F2-1.                                                   NC1024.2
   000760         076300     PERFORM PFM-C 3 TIMES.                                       NC1024.2 1425
   000761         076400     PERFORM PFM-C THREE TIMES.                                   NC1024.2 1425 90
   000762         076500*    NOTE THIS TEST IS FOR OPTION 2.                              NC1024.2
   000763         076600     IF      PERFORM2 EQUAL TO 56                                 NC1024.2 118
   000764      1  076700             PERFORM PASS                                         NC1024.2 282
   000765         076800     ELSE                                                         NC1024.2
   000766      1  076900             PERFORM FAIL.                                        NC1024.2 283
   000767         077000     GO TO   PFM-WRITE-F2-1.                                      NC1024.2 770
   000768         077100 PFM-DELETE-F2-1.                                                 NC1024.2
   000769         077200     PERFORM DE-LETE.                                             NC1024.2 284
   000770         077300 PFM-WRITE-F2-1.                                                  NC1024.2
   000771         077400     MOVE   "PERFORM TIMES" TO FEATURE.                           NC1024.2 128
   000772         077500     MOVE   "PFM-TEST-F2-1" TO PAR-NAME.                          NC1024.2 132
   000773         077600     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   000774         077700 PFM-INIT-F1-3.                                                   NC1024.2
   000775         077800     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000776         077900 PFM-TEST-F1-3.                                                   NC1024.2
   000777         078000     PERFORM PFM-E THRU PFM-H.                                    NC1024.2 1432 1441
   000778         078100*    NOTE THIS TEST IS FOR A NESTED PERFORM WITH THE INCLUDED     NC1024.2
   000779         078200*    PERFORM TOTALLY INCLUDED IN THE SEQUENCE REFERENCED BY THE   NC1024.2
   000780         078300*    FIRST PERFORM - IT ALSO TESTS THE EXIT VERB AND PERFORM      NC1024.2
   000781         078400*    THRU.                                                        NC1024.2
   000782         078500     IF       PERFORM1 NOT EQUAL TO "CSW"                         NC1024.2 116
   000783      1  078600              MOVE "CSW" TO CORRECT-A                             NC1024.2 157
   000784      1  078700              MOVE PERFORM1 TO COMPUTED-A                         NC1024.2 116 143
   000785      1  078800              PERFORM FAIL                                        NC1024.2 283
   000786      1  078900              GO TO PFM-WRITE-F1-3.                               NC1024.2 796
   000787         079000     IF       PERFORM4 EQUAL TO 70.0                              NC1024.2 120
   000788      1  079100              PERFORM PASS                                        NC1024.2 282
   000789         079200              ELSE                                                NC1024.2
   000790      1  079300              MOVE 70.0 TO CORRECT-N                              NC1024.2 158
   000791      1  079400              MOVE     PERFORM4 TO COMPUTED-N                     NC1024.2 120 144
   000792      1  079500              PERFORM FAIL.                                       NC1024.2 283
   000793         079600     GO TO    PFM-WRITE-F1-3.                                     NC1024.2 796
   000794         079700 PFM-DELETE-F1-3.                                                 NC1024.2
   000795         079800     PERFORM  DE-LETE.                                            NC1024.2 284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900 PFM-WRITE-F1-3.                                                  NC1024.2
   000797         080000     MOVE "NESTED PERFORM THRU" TO FEATURE.                       NC1024.2 128
   000798         080100     MOVE "PFM-TEST-F1-3" TO PAR-NAME.                            NC1024.2 132
   000799         080200     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000800         080300 PFM-INIT-F1-4.                                                   NC1024.2
   000801         080400     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000802         080500 PFM-TEST-F1-4.                                                   NC1024.2
   000803         080600     PERFORM  PFM-J.                                              NC1024.2 1448
   000804         080700*    NOTE THIS TEST IS FOR A NESTED PERFORM WITH THE INCLUDED     NC1024.2
   000805         080800*    PERFORM TOTALLY EXCLUDED FROM THE SEQUENCE REFERENCED BY     NC1024.2
   000806         080900*    THE FIRST PERFORM.                                           NC1024.2
   000807         081000     IF       PERFORM1 EQUAL TO "YES"                             NC1024.2 116
   000808      1  081100              PERFORM PASS                                        NC1024.2 282
   000809         081200     ELSE                                                         NC1024.2
   000810      1  081300              MOVE "YES" TO CORRECT-A                             NC1024.2 157
   000811      1  081400              MOVE PERFORM1 TO COMPUTED-A                         NC1024.2 116 143
   000812      1  081500              PERFORM FAIL                                        NC1024.2 283
   000813      1  081600              GO TO PFM-WRITE-F1-4.                               NC1024.2 823
   000814         081700     IF       PERFORM2 EQUAL TO 312                               NC1024.2 118
   000815      1  081800              PERFORM PASS                                        NC1024.2 282
   000816         081900     ELSE                                                         NC1024.2
   000817      1  082000              MOVE 312 TO CORRECT-N                               NC1024.2 158
   000818      1  082100               MOVE PERFORM2 TO COMPUTED-N                        NC1024.2 118 144
   000819      1  082200              PERFORM FAIL.                                       NC1024.2 283
   000820         082300     GO TO    PFM-WRITE-F1-4.                                     NC1024.2 823
   000821         082400 PFM-DELETE-F1-4.                                                 NC1024.2
   000822         082500     PERFORM  DE-LETE.                                            NC1024.2 284
   000823         082600 PFM-WRITE-F1-4.                                                  NC1024.2
   000824         082700     MOVE "NESTED PERFORM" TO FEATURE.                            NC1024.2 128
   000825         082800     MOVE "PFM-TEST-F1-4" TO PAR-NAME.                            NC1024.2 132
   000826         082900     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000827         083000 PFM-INIT-F1-5.                                                   NC1024.2
   000828         083100     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000829         083200 PFM-TEST-F1-5.                                                   NC1024.2
   000830         083300     PERFORM  PFM-N.                                              NC1024.2 1465
   000831         083400*    NOTE PFM-N IS A SECTION-NAME.                                NC1024.2
   000832         083500     GO TO    PFM-WRITE-F1-5.                                     NC1024.2 835
   000833         083600 PFM-DELETE-F1-5.                                                 NC1024.2
   000834         083700     PERFORM  DE-LETE.                                            NC1024.2 284
   000835         083800 PFM-WRITE-F1-5.                                                  NC1024.2
   000836         083900     MOVE "PERFORM SECTION-NAME" TO FEATURE.                      NC1024.2 128
   000837         084000     MOVE "PFM-TEST-F1-5" TO PAR-NAME.                            NC1024.2 132
   000838         084100     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000839         084200 PFM-INIT-F2-2.                                                   NC1024.2
   000840         084300     MOVE    "V1-108 6.20.2"  TO ANSI-REFERENCE.                  NC1024.2 188
   000841         084400 PFM-TEST-F2-2.                                                   NC1024.2
   000842         084500     PERFORM  PFM-V THRU PFM-Z 5 TIMES.                           NC1024.2 1493 1497
   000843         084600*        NOTE THESE ARE ALL EXIT PARAGRAPHS.                      NC1024.2
   000844         084700     PERFORM  PASS.                                               NC1024.2 282
   000845         084800     GO       TO PFM-WRITE-F2-2.                                  NC1024.2 848
   000846         084900 PFM-DELETE-F2-2.                                                 NC1024.2
   000847         085000     PERFORM  DE-LETE.                                            NC1024.2 284
   000848         085100 PFM-WRITE-F2-2.                                                  NC1024.2
   000849         085200     MOVE     "PERFORM EXIT PARAS" TO FEATURE.                    NC1024.2 128
   000850         085300     MOVE "PFM-TEST-F2-2" TO PAR-NAME.                            NC1024.2 132
   000851         085400     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000852         085500 PFM-INIT-F1-6.                                                   NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000854         085700     MOVE     ZERO TO P-COUNT.                                    NC1024.2 IMP 89
   000855         085800 PFM-TEST-F1-6.                                                   NC1024.2
   000856         085900     PERFORM  PFM-B-F1-6.                                         NC1024.2 861
   000857         086000     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000858         086100     PERFORM  PFM-A-F1-6.                                         NC1024.2 860
   000859         086200     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000860         086300 PFM-A-F1-6   SECTION.                                            NC1024.2
   000861         086400 PFM-B-F1-6.                                                      NC1024.2
   000862         086500     ADD      100 TO P-COUNT.                                     NC1024.2 89
   000863         086600 PFM-TESTT-F1-6 SECTION.                                          NC1024.2
   000864         086700 PFM-TESTTT-F1-6.                                                 NC1024.2
   000865         086800     IF       P-COUNT EQUAL TO 000302                             NC1024.2 89
   000866      1  086900              PERFORM PASS GO TO PFM-WRITE-F1-6.                  NC1024.2 282 875
   000867         087000     GO       TO PFM-FAIL-F1-6.                                   NC1024.2 871
   000868         087100 PFM-DELETE-F1-6.                                                 NC1024.2
   000869         087200     PERFORM  DE-LETE.                                            NC1024.2 284
   000870         087300     GO       TO PFM-WRITE-F1-6.                                  NC1024.2 875
   000871         087400 PFM-FAIL-F1-6.                                                   NC1024.2
   000872         087500     MOVE     P-COUNT TO COMPUTED-N.                              NC1024.2 89 144
   000873         087600     MOVE     000302 TO CORRECT-N.                                NC1024.2 158
   000874         087700     PERFORM  FAIL.                                               NC1024.2 283
   000875         087800 PFM-WRITE-F1-6.                                                  NC1024.2
   000876         087900     MOVE "PERFORM             " TO FEATURE.                      NC1024.2 128
   000877         088000     MOVE     "PFM-TEST-F1-6" TO PAR-NAME.                        NC1024.2 132
   000878         088100     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000879         088200 PFM-INIT-F2-3.                                                   NC1024.2
   000880         088300     MOVE    "V1-108 6.20.2"  TO ANSI-REFERENCE.                  NC1024.2 188
   000881         088400     MOVE     ZERO TO P-COUNT                                     NC1024.2 IMP 89
   000882         088500     MOVE     2 TO ATWO-DS-01V00.                                 NC1024.2 87
   000883         088600 PFM-TEST-F2-3.                                                   NC1024.2
   000884         088700     PERFORM  PFM-B-F2-3    2 TIMES.                              NC1024.2 889
   000885         088800     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000886         088900     PERFORM  PFM-A-F2-3   ATWO-DS-01V00 TIMES.                   NC1024.2 888 87
   000887         089000     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000888         089100 PFM-A-F2-3   SECTION.                                            NC1024.2
   000889         089200 PFM-B-F2-3.                                                      NC1024.2
   000890         089300     ADD      100 TO P-COUNT.                                     NC1024.2 89
   000891         089400 PFM-TESTT-F2-3 SECTION.                                          NC1024.2
   000892         089500 PFM-TESTTT-F2-3.                                                 NC1024.2
   000893         089600     IF       P-COUNT EQUAL TO 000502                             NC1024.2 89
   000894      1  089700              PERFORM PASS GO TO PFM-WRITE-F2-3.                  NC1024.2 282 903
   000895         089800     GO       TO PFM-FAIL-F2-3.                                   NC1024.2 899
   000896         089900 PFM-DELETE-F2-3.                                                 NC1024.2
   000897         090000     PERFORM  DE-LETE.                                            NC1024.2 284
   000898         090100     GO       TO PFM-WRITE-F2-3.                                  NC1024.2 903
   000899         090200 PFM-FAIL-F2-3.                                                   NC1024.2
   000900         090300     MOVE     P-COUNT TO COMPUTED-N.                              NC1024.2 89 144
   000901         090400     MOVE     000502 TO CORRECT-N.                                NC1024.2 158
   000902         090500     PERFORM  FAIL.                                               NC1024.2 283
   000903         090600 PFM-WRITE-F2-3.                                                  NC1024.2
   000904         090700     MOVE "PERFORM TIMES       " TO FEATURE.                      NC1024.2 128
   000905         090800     MOVE     "PFM-TEST-F2-3" TO PAR-NAME.                        NC1024.2 132
   000906         090900     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000907         091000 PFM-INIT-F1-7.                                                   NC1024.2
   000908         091100     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000909         091200     MOVE     ZERO TO P-COUNT.                                    NC1024.2 IMP 89
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300 PFM-TEST-F1-7.                                                   NC1024.2
   000911         091400     PERFORM  PFM-B-F1-7 THROUGH PFM-D-F1-7.                      NC1024.2 920 923
   000912         091500     ADD      1 TO P-COUNT                                        NC1024.2 89
   000913         091600     PERFORM  PFM-A-F1-7 THRU PFM-C-F1-7.                         NC1024.2 919 922
   000914         091700     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000915         091800     PERFORM  PFM-A-F1-7 THRU PFM-D-F1-7.                         NC1024.2 919 923
   000916         091900     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000917         092000     PERFORM  PFM-B-F1-7 THRU PFM-C-F1-7.                         NC1024.2 920 922
   000918         092100     ADD     1 TO P-COUNT.                                        NC1024.2 89
   000919         092200 PFM-A-F1-7 SECTION.                                              NC1024.2
   000920         092300 PFM-B-F1-7.                                                      NC1024.2
   000921         092400     ADD      100 TO P-COUNT.                                     NC1024.2 89
   000922         092500 PFM-C-F1-7 SECTION.                                              NC1024.2
   000923         092600 PFM-D-F1-7.                                                      NC1024.2
   000924         092700     ADD      10000 TO P-COUNT.                                   NC1024.2 89
   000925         092800 PFM-TESTT-F1-7 SECTION.                                          NC1024.2
   000926         092900 PFM-TESTTT-F1-7.                                                 NC1024.2
   000927         093000     IF       P-COUNT EQUAL TO 050504                             NC1024.2 89
   000928      1  093100              PERFORM PASS                                        NC1024.2 282
   000929      1  093200              GO TO PFM-WRITE-F1-7.                               NC1024.2 938
   000930         093300     GO       TO PFM-FAIL-F1-7.                                   NC1024.2 934
   000931         093400 PFM-DELETE-F1-7.                                                 NC1024.2
   000932         093500     PERFORM  DE-LETE.                                            NC1024.2 284
   000933         093600     GO       TO PFM-WRITE-F1-7.                                  NC1024.2 938
   000934         093700 PFM-FAIL-F1-7.                                                   NC1024.2
   000935         093800     MOVE     P-COUNT TO COMPUTED-N.                              NC1024.2 89 144
   000936         093900     MOVE     050504 TO CORRECT-N.                                NC1024.2 158
   000937         094000     PERFORM  FAIL.                                               NC1024.2 283
   000938         094100 PFM-WRITE-F1-7.                                                  NC1024.2
   000939         094200     MOVE "PERFORM THRU        " TO FEATURE.                      NC1024.2 128
   000940         094300     MOVE     "PFM-TEST-F1-7" TO PAR-NAME.                        NC1024.2 132
   000941         094400     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000942         094500 PFM-INIT-F2-4.                                                   NC1024.2
   000943         094600     MOVE    "V1-108 6.20.2"  TO ANSI-REFERENCE.                  NC1024.2 188
   000944         094700     MOVE     ZERO TO P-COUNT.                                    NC1024.2 IMP 89
   000945         094800 PFM-TEST-F2-4.                                                   NC1024.2
   000946         094900     PERFORM  PFM-B-F2-4 THROUGH PFM-D-F2-4 2 TIMES.              NC1024.2 955 958
   000947         095000     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000948         095100     PERFORM  PFM-A-F2-4 THRU PFM-C-F2-4 2 TIMES.                 NC1024.2 954 957
   000949         095200     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000950         095300     PERFORM  PFM-A-F2-4 THRU PFM-D-F2-4 2 TIMES.                 NC1024.2 954 958
   000951         095400     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000952         095500     PERFORM  PFM-B-F2-4 THRU PFM-D-F2-4 2 TIMES.                 NC1024.2 955 958
   000953         095600     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000954         095700 PFM-A-F2-4 SECTION.                                              NC1024.2
   000955         095800 PFM-B-F2-4.                                                      NC1024.2
   000956         095900     ADD      100 TO P-COUNT.                                     NC1024.2 89
   000957         096000 PFM-C-F2-4 SECTION.                                              NC1024.2
   000958         096100 PFM-D-F2-4.                                                      NC1024.2
   000959         096200     ADD     10000 TO P-COUNT.                                    NC1024.2 89
   000960         096300 PFM-TESTT-F2-4 SECTION.                                          NC1024.2
   000961         096400 PFM-TESTTT-F2-4.                                                 NC1024.2
   000962         096500     IF       P-COUNT EQUAL TO 090904                             NC1024.2 89
   000963      1  096600              PERFORM PASS GO TO PFM-WRITE-F2-4.                  NC1024.2 282 972
   000964         096700     GO       TO PFM-FAIL-F2-4.                                   NC1024.2 968
   000965         096800 PFM-DELETE-F2-4.                                                 NC1024.2
   000966         096900     PERFORM  DE-LETE.                                            NC1024.2 284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     GO       TO PFM-WRITE-F2-4.                                  NC1024.2 972
   000968         097100 PFM-FAIL-F2-4.                                                   NC1024.2
   000969         097200     MOVE     P-COUNT TO COMPUTED-N.                              NC1024.2 89 144
   000970         097300     MOVE     090904 TO CORRECT-N.                                NC1024.2 158
   000971         097400     PERFORM  FAIL.                                               NC1024.2 283
   000972         097500 PFM-WRITE-F2-4.                                                  NC1024.2
   000973         097600     MOVE "PERFORM THRU, TIMES " TO FEATURE.                      NC1024.2 128
   000974         097700     MOVE     "PFM-TEST-F2-4" TO PAR-NAME.                        NC1024.2 132
   000975         097800     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   000976         097900 PFM-INIT-F1-8.                                                   NC1024.2
   000977         098000     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   000978         098100     MOVE     ZERO TO P-COUNT.                                    NC1024.2 IMP 89
   000979         098200 PFM-TEST-F1-8.                                                   NC1024.2
   000980         098300     ADD      1 TO P-COUNT.                                       NC1024.2 89
   000981         098400     PERFORM  PFM-A-F1-8.                                         NC1024.2 984
   000982         098500     ADD      2 TO P-COUNT.                                       NC1024.2 89
   000983         098600     GO       TO PFM-TESTT-F1-8.                                  NC1024.2 1002
   000984         098700 PFM-A-F1-8.                                                      NC1024.2
   000985         098800     ADD      10 TO P-COUNT.                                      NC1024.2 89
   000986         098900     PERFORM  PFM-B-F1-8.                                         NC1024.2 988
   000987         099000     ADD      20 TO P-COUNT.                                      NC1024.2 89
   000988         099100 PFM-B-F1-8.                                                      NC1024.2
   000989         099200     ADD      100 TO P-COUNT.                                     NC1024.2 89
   000990         099300     PERFORM  PFM-C-F1-8.                                         NC1024.2 992
   000991         099400     ADD      200 TO P-COUNT.                                     NC1024.2 89
   000992         099500 PFM-C-F1-8.                                                      NC1024.2
   000993         099600     ADD      1000 TO P-COUNT.                                    NC1024.2 89
   000994         099700     PERFORM  PFM-D-F1-8.                                         NC1024.2 996
   000995         099800     ADD      2000 TO P-COUNT.                                    NC1024.2 89
   000996         099900 PFM-D-F1-8.                                                      NC1024.2
   000997         100000     ADD      10000 TO P-COUNT.                                   NC1024.2 89
   000998         100100     PERFORM  PFM-E-F1-8.                                         NC1024.2 1000
   000999         100200     ADD      20000 TO P-COUNT.                                   NC1024.2 89
   001000         100300 PFM-E-F1-8.                                                      NC1024.2
   001001         100400     ADD      100000 TO P-COUNT.                                  NC1024.2 89
   001002         100500 PFM-TESTT-F1-8.                                                  NC1024.2
   001003         100600     IF       P-COUNT EQUAL TO 133333                             NC1024.2 89
   001004      1  100700              PERFORM PASS GO TO PFM-WRITE-F1-8.                  NC1024.2 282 1013
   001005         100800     GO       TO PFM-FAIL-F1-8.                                   NC1024.2 1009
   001006         100900 PFM-DELETE-F1-8.                                                 NC1024.2
   001007         101000     PERFORM  DE-LETE.                                            NC1024.2 284
   001008         101100     GO       TO PFM-WRITE-F1-8.                                  NC1024.2 1013
   001009         101200 PFM-FAIL-F1-8.                                                   NC1024.2
   001010         101300     MOVE     P-COUNT TO COMPUTED-N.                              NC1024.2 89 144
   001011         101400     MOVE     133333 TO CORRECT-N.                                NC1024.2 158
   001012         101500     PERFORM  FAIL.                                               NC1024.2 283
   001013         101600 PFM-WRITE-F1-8.                                                  NC1024.2
   001014         101700     MOVE "NESTED PERFORM      " TO FEATURE.                      NC1024.2 128
   001015         101800     MOVE     "PFM-TEST-F1-8" TO PAR-NAME.                        NC1024.2 132
   001016         101900     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   001017         102000 PFM-INIT-F2-5.                                                   NC1024.2
   001018         102100     MOVE    "V1-108 6.20.2"  TO ANSI-REFERENCE.                  NC1024.2 188
   001019         102200     MOVE     ZERO TO P-COUNT.                                    NC1024.2 IMP 89
   001020         102300 PFM-TEST-F2-5.                                                   NC1024.2
   001021         102400     PERFORM  PFM-A-F2-5 THRU PFM-B-F2-5.                         NC1024.2 1025 1027
   001022         102500     ADD      1 TO P-COUNT.                                       NC1024.2 89
   001023         102600     PERFORM  PFM-A-F2-5 THRU PFM-B-F2-5 2 TIMES.                 NC1024.2 1025 1027
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     ADD      2 TO P-COUNT.                                       NC1024.2 89
   001025         102800 PFM-A-F2-5.                                                      NC1024.2
   001026         102900     ADD      100 TO P-COUNT.                                     NC1024.2 89
   001027         103000 PFM-B-F2-5.                                                      NC1024.2
   001028         103100     EXIT.                                                        NC1024.2
   001029         103200 PFM-TESTT-F2-5.                                                  NC1024.2
   001030         103300     IF       P-COUNT EQUAL TO 000403                             NC1024.2 89
   001031      1  103400              PERFORM PASS GO TO PFM-WRITE-F2-5.                  NC1024.2 282 1041
   001032         103500     GO       TO PFM-FAIL-F2-5.                                   NC1024.2 1036
   001033         103600 PFM-DELETE-F2-5.                                                 NC1024.2
   001034         103700     PERFORM  DE-LETE.                                            NC1024.2 284
   001035         103800     GO       TO PFM-WRITE-F2-5.                                  NC1024.2 1041
   001036         103900 PFM-FAIL-F2-5.                                                   NC1024.2
   001037         104000     MOVE     P-COUNT TO COMPUTED-N.                              NC1024.2 89 144
   001038         104100     MOVE     000403 TO CORRECT-N.                                NC1024.2 158
   001039         104200     MOVE     "PERFORM WITH EXIT" TO FEATURE.                     NC1024.2 128
   001040         104300     PERFORM  FAIL.                                               NC1024.2 283
   001041         104400 PFM-WRITE-F2-5.                                                  NC1024.2
   001042         104500     MOVE     "PFM-TEST-F2-5" TO PAR-NAME.                        NC1024.2 132
   001043         104600     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   001044         104700 PFM-INIT-F1-9.                                                   NC1024.2
   001045         104800     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   001046         104900     MOVE     SPACES TO PERFORM-HOLD.                             NC1024.2 IMP 124
   001047         105000 PFM-TEST-F1-9.                                                   NC1024.2
   001048         105100     PERFORM A101.                                                NC1024.2 1422
   001049         105200     IF PERFORM-HOLD EQUAL TO "ABCDEFGHIJKLMNOPQRST"              NC1024.2 124
   001050      1  105300         PERFORM PASS                                             NC1024.2 282
   001051      1  105400         GO TO PFM-WRITE-F1-9.                                    NC1024.2 1058
   001052         105500     MOVE "ABCDEFGHIJKLMNOPQRST" TO CORRECT-A.                    NC1024.2 157
   001053         105600     MOVE PERFORM-HOLD TO COMPUTED-A.                             NC1024.2 124 143
   001054         105700     PERFORM FAIL.                                                NC1024.2 283
   001055         105800     GO TO PFM-WRITE-F1-9.                                        NC1024.2 1058
   001056         105900 PFM-DELETE-F1-9.                                                 NC1024.2
   001057         106000     PERFORM  DE-LETE.                                            NC1024.2 284
   001058         106100 PFM-WRITE-F1-9.                                                  NC1024.2
   001059         106200     MOVE     "PFM-TEST-F1-9" TO PAR-NAME.                        NC1024.2 132
   001060         106300     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   001061         106400 PFM-A-F1-10 SECTION.                                             NC1024.2
   001062         106500 PFM-INIT-F1-10.                                                  NC1024.2
   001063         106600     MOVE    "V1-111 6.20.4 GR10"  TO ANSI-REFERENCE.             NC1024.2 188
   001064         106700 PFM-TEST-F1-10.                                                  NC1024.2
   001065         106800     PERFORM  PFM-G-F1-10 THRU PFM-B-F1-10.                       NC1024.2 1087 1073

 ==001065==> IGYPA3086-W "PERFORM" start-of-range "PFM-G-F1-10" follows the "PERFORM" end-of-range
                         "PFM-B-F1-10".  The "PERFORM" end-of-range may be unreachable.  The
                         statement was processed as written.

   001066         106900*        NOTE PERFORM SECTION-NAME THRU PARAGRAPH-NAME -- SECOND  NC1024.2
   001067         107000*             PROCEDURE-NAME PHYSICALLY PRECEEDS THE FIRST BUT    NC1024.2
   001068         107100*             LOGICALLY FOLLOWS IT.                               NC1024.2
   001069         107200     GO       TO PFM-WRITE-F1-10.                                 NC1024.2 1104
   001070         107300 PFM-DELETE-F1-10.                                                NC1024.2
   001071         107400     PERFORM  DE-LETE.                                            NC1024.2 284
   001072         107500     GO       TO PFM-WRITE-F1-10.                                 NC1024.2 1104
   001073         107600 PFM-B-F1-10.                                                     NC1024.2
   001074         107700     PERFORM  PASS.                                               NC1024.2 282
   001075         107800 PFM-C-F1-10.                                                     NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001076         107900     PERFORM  FAIL.                                               NC1024.2 283
   001077         108000     MOVE     "RETURN MECHANISM LOST" TO RE-MARK.                 NC1024.2 137
   001078         108100     GO       TO PFM-WRITE-F1-10.                                 NC1024.2 1104
   001079         108200 PFM-D-F1-10.                                                     NC1024.2
   001080         108300     PERFORM  FAIL.                                               NC1024.2 283
   001081         108400     MOVE     "PERFORM GOT LOST IN GO TOS" TO RE-MARK.            NC1024.2 137
   001082         108500     GO       TO PFM-WRITE-F1-10.                                 NC1024.2 1104
   001083         108600 PFM-E-F1-10.                                                     NC1024.2
   001084         108700     GO       TO PFM-L-F1-10.                                     NC1024.2 1102
   001085         108800 PFM-F-F1-10.                                                     NC1024.2
   001086         108900     GO       TO PFM-D-F1-10.                                     NC1024.2 1079
   001087         109000 PFM-G-F1-10 SECTION.                                             NC1024.2
   001088         109100 PFM-H-F1-10.                                                     NC1024.2
   001089         109200     GO       TO PFM-E-F1-10.                                     NC1024.2 1083
   001090         109300 PFM-I-F1-10.                                                     NC1024.2
   001091         109400     GO       TO PFM-D-F1-10.                                     NC1024.2 1079
   001092         109500*        NOTE SINCE THIS PARAGRAPH SHOULD NEVER BE ENTERED, IT IS NC1024.2
   001093         109600*             NOT POSSIBLE TO EXECUTE THE LAST SENTENCE IN PFM-   NC1024.2
   001094         109700*             G-F1-10 EVEN THOUGH PFM-G-F1-10 IS A SECTION WHICH  NC1024.2
   001095         109800*             IS THE OBJECT OF A PERFORM -- ALL THIS IS LEGAL.    NC1024.2
   001096         109900 PFM-J-F1-10 SECTION.                                             NC1024.2
   001097         110000                                                                  NC1024.2
   001098         110100 PFM-K-F1-10.                                                     NC1024.2
   001099         110200     PERFORM  FAIL.                                               NC1024.2 283
   001100         110300     MOVE     "PFM-K-F1-10 ENTERED" TO RE-MARK.                   NC1024.2 137
   001101         110400     GO       TO PFM-WRITE-F1-10.                                 NC1024.2 1104
   001102         110500 PFM-L-F1-10.                                                     NC1024.2
   001103         110600     GO       TO PFM-B-F1-10.                                     NC1024.2 1073
   001104         110700 PFM-WRITE-F1-10.                                                 NC1024.2
   001105         110800     MOVE     "PERFORM GO TO PARAS" TO FEATURE.                   NC1024.2 128
   001106         110900     MOVE     "PFM-TEST-F1-10" TO PAR-NAME.                       NC1024.2 132
   001107         111000     PERFORM  PRINT-DETAIL.                                       NC1024.2 286
   001108         111100 PFM-INIT-F2-5.                                                   NC1024.2
   001109         111200     MOVE    "V1-108 6.20.2"  TO ANSI-REFERENCE.                  NC1024.2 188
   001110         111300     MOVE     ZERO TO PERFORM2.                                   NC1024.2 IMP 118
   001111         111400 PFM-TEST-F2-6.                                                   NC1024.2
   001112         111500     PERFORM  PFM-S PERFORM2 TIMES.                               NC1024.2 1477 118
   001113         111600     MOVE     -3 TO PERFORM2.                                     NC1024.2 118
   001114         111700     PERFORM  PFM-T PERFORM2 TIMES.                               NC1024.2 1479 118
   001115         111800     MOVE     7 TO PERFORM5.                                      NC1024.2 121
   001116         111900     PERFORM  PFM-U PERFORM5 TIMES.                               NC1024.2 1481 121
   001117         112000*        NOTE THE STANDARD SPECIFIES THAT THE COMPILER MUST       NC1024.2
   001118         112100*             SIMPLY IGNORE THE FIRST TWO PERFORM5, AND MUST      NC1024.2
   001119         112200*             PERFORM PFM-U SEVEN TIMES --- NOTE THAT PERFORM5    NC1024.2
   001120         112300*             IS INCREMENTED IN PFM-U, BUT THIS SHOULD HAVE NO    NC1024.2
   001121         112400*             EFFECT ON THE NUMBER OF TIMES PFM-U IS PERFORMED.   NC1024.2
   001122         112500     IF       PERFORM5 EQUAL TO 707                               NC1024.2 121
   001123      1  112600             PERFORM PASS GO TO PFM-WRITE-F2-6.                   NC1024.2 282 1132
   001124         112700     GO      TO PFM-FAIL-F2-6.                                    NC1024.2 1128
   001125         112800 PFM-DELETE-F2-6.                                                 NC1024.2
   001126         112900     PERFORM DE-LETE.                                             NC1024.2 284
   001127         113000     GO      TO PFM-WRITE-F2-6.                                   NC1024.2 1132
   001128         113100 PFM-FAIL-F2-6.                                                   NC1024.2
   001129         113200     MOVE    PERFORM5 TO COMPUTED-N.                              NC1024.2 121 144
   001130         113300     MOVE    707 TO CORRECT-N.                                    NC1024.2 158
   001131         113400     PERFORM FAIL.                                                NC1024.2 283
   001132         113500 PFM-WRITE-F2-6.                                                  NC1024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001133         113600     MOVE   "PERFORM ... TIMES" TO FEATURE.                       NC1024.2 128
   001134         113700     MOVE   "PFM-TEST-F2-6" TO PAR-NAME.                          NC1024.2 132
   001135         113800     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001136         113900*                                                                 NC1024.2
   001137         114000*                                                                 NC1024.2
   001138         114100 PFM-INIT-F1-11.                                                  NC1024.2
   001139         114200     MOVE    "V1-110 6.20.4 GR6"  TO ANSI-REFERENCE.              NC1024.2 188
   001140         114300*    ==--> IN LINE PERFORM <--==                                  NC1024.2
   001141         114400     MOVE    0   TO WRK-DU-2V0-1.                                 NC1024.2 55
   001142         114500     MOVE    0   TO WRK-DU-2V0-2.                                 NC1024.2 56
   001143         114600 PFM-TEST-F1-11-0.                                                NC1024.2
   001144         114700     PERFORM MOVE   88   TO WRK-DU-2V0-1                          NC1024.2 55
   001145      1  114800             MOVE   99   TO WRK-DU-2V0-2                          NC1024.2 56
   001146         114900     END-PERFORM.                                                 NC1024.2
   001147         115000 PFM-TEST-F1-11-1.                                                NC1024.2
   001148         115100     IF      WRK-DU-2V0-1 = 88                                    NC1024.2 55
   001149      1  115200             PERFORM PASS                                         NC1024.2 282
   001150         115300     ELSE                                                         NC1024.2
   001151      1  115400             MOVE    88           TO CORRECT-N                    NC1024.2 158
   001152      1  115500             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1024.2 55 144
   001153      1  115600             PERFORM FAIL.                                        NC1024.2 283
   001154         115700     GO TO   PFM-WRITE-F1-11-1.                                   NC1024.2 1157
   001155         115800 PFM-DELETE-F1-11-1.                                              NC1024.2
   001156         115900     PERFORM DE-LETE.                                             NC1024.2 284
   001157         116000 PFM-WRITE-F1-11-1.                                               NC1024.2
   001158         116100     MOVE   "PFM-TEST-F1-11-1" TO PAR-NAME.                       NC1024.2 132
   001159         116200     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001160         116300 PFM-TEST-F1-11-2.                                                NC1024.2
   001161         116400     IF      WRK-DU-2V0-2 = 99                                    NC1024.2 56
   001162      1  116500             PERFORM PASS                                         NC1024.2 282
   001163         116600     ELSE                                                         NC1024.2
   001164      1  116700             MOVE    99           TO CORRECT-N                    NC1024.2 158
   001165      1  116800             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1024.2 56 144
   001166      1  116900             PERFORM FAIL.                                        NC1024.2 283
   001167         117000     GO TO   PFM-WRITE-F1-11-2.                                   NC1024.2 1170
   001168         117100 PFM-DELETE-F1-11-2.                                              NC1024.2
   001169         117200     PERFORM DE-LETE.                                             NC1024.2 284
   001170         117300 PFM-WRITE-F1-11-2.                                               NC1024.2
   001171         117400     MOVE   "PFM-TEST-F1-11-2" TO PAR-NAME.                       NC1024.2 132
   001172         117500     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001173         117600*                                                                 NC1024.2
   001174         117700*                                                                 NC1024.2
   001175         117800 PFM-INIT-F2-7.                                                   NC1024.2
   001176         117900*    ==--> IN LINE PERFORM <--==                                  NC1024.2
   001177         118000     MOVE   "V1-110 6.20.4 GR6"  TO ANSI-REFERENCE.               NC1024.2 188
   001178         118100     MOVE   "PERFORM .... TIMES" TO FEATURE.                      NC1024.2 128
   001179         118200     MOVE    0   TO P-COUNT.                                      NC1024.2 89
   001180         118300     MOVE    0   TO WRK-DU-2V0-1.                                 NC1024.2 55
   001181         118400 PFM-TEST-F2-7-0.                                                 NC1024.2
   001182         118500     PERFORM 4 TIMES                                              NC1024.2
   001183      1  118600             ADD     3   TO P-COUNT                               NC1024.2 89
   001184      1  118700             ADD     4   TO P-COUNT                               NC1024.2 89
   001185         118800     END-PERFORM                                                  NC1024.2
   001186         118900     MOVE    77 TO WRK-DU-2V0-1.                                  NC1024.2 55
   001187         119000 PFM-TEST-F2-7-1.                                                 NC1024.2
   001188         119100     IF      P-COUNT = 28                                         NC1024.2 89
   001189      1  119200             PERFORM PASS                                         NC1024.2 282
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001190         119300     ELSE                                                         NC1024.2
   001191      1  119400             MOVE    28      TO CORRECT-N                         NC1024.2 158
   001192      1  119500             MOVE    P-COUNT TO COMPUTED-N                        NC1024.2 89 144
   001193      1  119600             PERFORM FAIL.                                        NC1024.2 283
   001194         119700     GO TO   PFM-WRITE-F2-7-1.                                    NC1024.2 1197
   001195         119800 PFM-DELETE-F2-7-1.                                               NC1024.2
   001196         119900     PERFORM DE-LETE.                                             NC1024.2 284
   001197         120000 PFM-WRITE-F2-7-1.                                                NC1024.2
   001198         120100     MOVE   "PFM-TEST-F2-7-1" TO PAR-NAME.                        NC1024.2 132
   001199         120200     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001200         120300 PFM-TEST-F2-7-2.                                                 NC1024.2
   001201         120400     IF      WRK-DU-2V0-1 = 77                                    NC1024.2 55
   001202      1  120500             PERFORM PASS                                         NC1024.2 282
   001203         120600     ELSE                                                         NC1024.2
   001204      1  120700             MOVE    77           TO CORRECT-N                    NC1024.2 158
   001205      1  120800             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1024.2 55 144
   001206      1  120900             PERFORM FAIL.                                        NC1024.2 283
   001207         121000     GO TO   PFM-WRITE-F2-7-2.                                    NC1024.2 1210
   001208         121100 PFM-DELETE-F2-7-2.                                               NC1024.2
   001209         121200     PERFORM DE-LETE.                                             NC1024.2 284
   001210         121300 PFM-WRITE-F2-7-2.                                                NC1024.2
   001211         121400     MOVE   "PFM-TEST-F2-7-2" TO PAR-NAME.                        NC1024.2 132
   001212         121500     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001213         121600*                                                                 NC1024.2
   001214         121700*                                                                 NC1024.2
   001215         121800 PFM-INIT-F2-8.                                                   NC1024.2
   001216         121900*    ==--> IN LINE PERFORM <--==                                  NC1024.2
   001217         122000     MOVE   "V1-110 6.20.4 GR6"  TO ANSI-REFERENCE.               NC1024.2 188
   001218         122100     MOVE   "PERFORM .... TIMES" TO FEATURE.                      NC1024.2 128
   001219         122200     MOVE    0   TO P-COUNT.                                      NC1024.2 89
   001220         122300     MOVE    0   TO WRK-DU-2V0-1.                                 NC1024.2 55
   001221         122400     MOVE    4   TO WRK-DU-2V0-2.                                 NC1024.2 56
   001222         122500 PFM-TEST-F2-8-0.                                                 NC1024.2
   001223         122600     PERFORM WRK-DU-2V0-2 TIMES                                   NC1024.2 56
   001224      1  122700             ADD     3   TO P-COUNT                               NC1024.2 89
   001225      1  122800             ADD     4   TO P-COUNT                               NC1024.2 89
   001226         122900     END-PERFORM                                                  NC1024.2
   001227         123000     MOVE    77 TO WRK-DU-2V0-1.                                  NC1024.2 55
   001228         123100 PFM-TEST-F2-8-1.                                                 NC1024.2
   001229         123200     IF      P-COUNT = 28                                         NC1024.2 89
   001230      1  123300             PERFORM PASS                                         NC1024.2 282
   001231         123400     ELSE                                                         NC1024.2
   001232      1  123500             MOVE    28      TO CORRECT-N                         NC1024.2 158
   001233      1  123600             MOVE    P-COUNT TO COMPUTED-N                        NC1024.2 89 144
   001234      1  123700             PERFORM FAIL.                                        NC1024.2 283
   001235         123800     GO TO   PFM-WRITE-F2-8-1.                                    NC1024.2 1238
   001236         123900 PFM-DELETE-F2-8-1.                                               NC1024.2
   001237         124000     PERFORM DE-LETE.                                             NC1024.2 284
   001238         124100 PFM-WRITE-F2-8-1.                                                NC1024.2
   001239         124200     MOVE   "PFM-TEST-F2-8-1" TO PAR-NAME.                        NC1024.2 132
   001240         124300     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001241         124400 PFM-TEST-F2-8-2.                                                 NC1024.2
   001242         124500     IF      WRK-DU-2V0-1 = 77                                    NC1024.2 55
   001243      1  124600             PERFORM PASS                                         NC1024.2 282
   001244         124700     ELSE                                                         NC1024.2
   001245      1  124800             MOVE    77           TO CORRECT-N                    NC1024.2 158
   001246      1  124900             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1024.2 55 144
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001247      1  125000             PERFORM FAIL.                                        NC1024.2 283
   001248         125100     GO TO   PFM-WRITE-F2-8-2.                                    NC1024.2 1251
   001249         125200 PFM-DELETE-F2-8-2.                                               NC1024.2
   001250         125300     PERFORM DE-LETE.                                             NC1024.2 284
   001251         125400 PFM-WRITE-F2-8-2.                                                NC1024.2
   001252         125500     MOVE   "PFM-TEST-F2-8-2" TO PAR-NAME.                        NC1024.2 132
   001253         125600     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001254         125700*                                                                 NC1024.2
   001255         125800*                                                                 NC1024.2
   001256         125900 PFM-INIT-F3-1.                                                   NC1024.2
   001257         126000     MOVE   "PERFORM UNTIL"  TO FEATURE.                          NC1024.2 128
   001258         126100     MOVE   "V1-108 6.20.2"  TO ANSI-REFERENCE.                   NC1024.2 188
   001259         126200     MOVE    1 TO PERFORM2.                                       NC1024.2 118
   001260         126300     MOVE    5 TO PERFORM3.                                       NC1024.2 40
   001261         126400 PFM-TEST-F3-1.                                                   NC1024.2
   001262         126500     PERFORM PFM-F3-1-A THRU PFM-F3-1-AA                          NC1024.2 1273 1275
   001263         126600       UNTIL PERFORM2 EQUAL TO 48.                                NC1024.2 118
   001264         126700*    NOTE IN THIS TEST THE CONDITION IS NOT SATISFIED             NC1024.2
   001265         126800*    ORIGINALLY WHEN THE PERFORM IS ENTERED.                      NC1024.2
   001266         126900     IF      PERFORM2 = 48                                        NC1024.2 118
   001267      1  127000             PERFORM PASS                                         NC1024.2 282
   001268      1  127100             GO TO   PFM-WRITE-F3-1.                              NC1024.2 1281
   001269         127200     GO TO   PFM-FAIL-F3-1.                                       NC1024.2 1277
   001270         127300 PFM-DELETE-F3-1.                                                 NC1024.2
   001271         127400     PERFORM DE-LETE.                                             NC1024.2 284
   001272         127500     GO TO   PFM-WRITE-F3-1.                                      NC1024.2 1281
   001273         127600 PFM-F3-1-A.                                                      NC1024.2
   001274         127700     MULTIPLY PERFORM3 BY 6 GIVING PERFORM2.                      NC1024.2 40 118
   001275         127800 PFM-F3-1-AA.                                                     NC1024.2
   001276         127900     ADD     1 TO PERFORM3.                                       NC1024.2 40
   001277         128000 PFM-FAIL-F3-1.                                                   NC1024.2
   001278         128100     MOVE    PERFORM2 TO COMPUTED-N.                              NC1024.2 118 144
   001279         128200     MOVE    48 TO CORRECT-N.                                     NC1024.2 158
   001280         128300     PERFORM FAIL.                                                NC1024.2 283
   001281         128400 PFM-WRITE-F3-1.                                                  NC1024.2
   001282         128500     MOVE   "PFM-TEST-F3-1" TO PAR-NAME.                          NC1024.2 132
   001283         128600     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001284         128700*                                                                 NC1024.2
   001285         128800*                                                                 NC1024.2
   001286         128900 PFM-INIT-F3-2.                                                   NC1024.2
   001287         129000     MOVE   "V1-108 6.20.2"  TO ANSI-REFERENCE.                   NC1024.2 188
   001288         129100     MOVE    50 TO PERFORM2.                                      NC1024.2 118
   001289         129200*    NOTE: IN THIS TEST CONDITION IS SATISFIED WHEN PERFORM IS    NC1024.2
   001290         129300*    ENTERED AND CONTROL SHOULD NOT BE PASSED TO PFM-F3-2-C.      NC1024.2
   001291         129400 PFM-TEST-F3-2-0.                                                 NC1024.2
   001292         129500     PERFORM PFM-F3-2-C UNTIL PERFORM2 GREATER THAN 25.           NC1024.2 1300 118
   001293         129600     IF      PERFORM2 EQUAL TO 50                                 NC1024.2 118
   001294      1  129700             PERFORM PASS                                         NC1024.2 282
   001295      1  129800             GO TO   PFM-WRITE-F3-2.                              NC1024.2 1306
   001296         129900     GO TO   PFM-FAIL-F3-2.                                       NC1024.2 1302
   001297         130000 PFM-DELETE-F3-2.                                                 NC1024.2
   001298         130100     PERFORM DE-LETE.                                             NC1024.2 284
   001299         130200     GO TO   PFM-WRITE-F3-2.                                      NC1024.2 1306
   001300         130300 PFM-F3-2-C.                                                      NC1024.2
   001301         130400     ADD     1 TO PERFORM2.                                       NC1024.2 118
   001302         130500 PFM-FAIL-F3-2.                                                   NC1024.2
   001303         130600     MOVE    PERFORM2 TO COMPUTED-N.                              NC1024.2 118 144
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001304         130700     MOVE    50 TO CORRECT-N.                                     NC1024.2 158
   001305         130800     PERFORM FAIL.                                                NC1024.2 283
   001306         130900 PFM-WRITE-F3-2.                                                  NC1024.2
   001307         131000     MOVE   "PFM-TEST-F3-2" TO PAR-NAME.                          NC1024.2 132
   001308         131100     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001309         131200*                                                                 NC1024.2
   001310         131300*                                                                 NC1024.2
   001311         131400 PFM-INIT-F3-3.                                                   NC1024.2
   001312         131500     MOVE   "V1-108 6.20.2"  TO ANSI-REFERENCE.                   NC1024.2 188
   001313         131600     MOVE    ZERO TO WRK-DS-02V00.                                NC1024.2 IMP 86
   001314         131700 PFM-TEST-F3-3.                                                   NC1024.2
   001315         131800     PERFORM PFM-A-F3-3 THROUGH PFM-B-F3-3                        NC1024.2 1318 1320
   001316         131900       UNTIL WRK-DS-02V00 IS EQUAL TO 99.                         NC1024.2 86
   001317         132000     GO TO   PFM-TESTT-F3-3.                                      NC1024.2 1322
   001318         132100 PFM-A-F3-3.                                                      NC1024.2
   001319         132200     EXIT.                                                        NC1024.2
   001320         132300 PFM-B-F3-3.                                                      NC1024.2
   001321         132400     ADD      1 TO WRK-DS-02V00.                                  NC1024.2 86
   001322         132500 PFM-TESTT-F3-3.                                                  NC1024.2
   001323         132600     IF      WRK-DS-02V00 EQUAL TO 99                             NC1024.2 86
   001324      1  132700             PERFORM PASS GO TO PFM-WRITE-F3-3.                   NC1024.2 282 1333
   001325         132800     GO TO   PFM-FAIL-F3-3.                                       NC1024.2 1329
   001326         132900 PFM-DELETE-F3-3.                                                 NC1024.2
   001327         133000     PERFORM DE-LETE.                                             NC1024.2 284
   001328         133100     GO TO   PFM-WRITE-F3-3.                                      NC1024.2 1333
   001329         133200 PFM-FAIL-F3-3.                                                   NC1024.2
   001330         133300     MOVE    WRK-DS-02V00 TO COMPUTED-N.                          NC1024.2 86 144
   001331         133400     MOVE    99 TO CORRECT-N.                                     NC1024.2 158
   001332         133500     PERFORM FAIL.                                                NC1024.2 283
   001333         133600 PFM-WRITE-F3-3.                                                  NC1024.2
   001334         133700     MOVE   "PFM-TEST-F3-3  " TO PAR-NAME.                        NC1024.2 132
   001335         133800     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001336         133900*                                                                 NC1024.2
   001337         134000*                                                                 NC1024.2
   001338         134100 PFM-INIT-F3-4.                                                   NC1024.2
   001339         134200*    ==--> IN-LINE PERFORM <--==                                  NC1024.2
   001340         134300     MOVE   "V1-110 6.20.4 GR6"  TO ANSI-REFERENCE.               NC1024.2 188
   001341         134400     MOVE    ZERO TO WRK-DU-6V0-1.                                NC1024.2 IMP 69
   001342         134500 PFM-TEST-F3-4-0.                                                 NC1024.2
   001343         134600     PERFORM UNTIL WRK-DU-6V0-1 = 99                              NC1024.2 69
   001344      1  134700             ADD      6 TO   WRK-DU-6V0-1                         NC1024.2 69
   001345      1  134800             SUBTRACT 3 FROM WRK-DU-6V0-1                         NC1024.2 69
   001346         134900     END-PERFORM                                                  NC1024.2
   001347         135000     SUBTRACT 1 FROM WRK-DU-6V0-1.                                NC1024.2 69
   001348         135100 PFM-TESTT-F3-4-1.                                                NC1024.2
   001349         135200     IF      WRK-DU-6V0-1 EQUAL TO 98                             NC1024.2 69
   001350      1  135300             PERFORM PASS GO TO PFM-WRITE-F3-4.                   NC1024.2 282 1359
   001351         135400     GO TO   PFM-FAIL-F3-4.                                       NC1024.2 1355
   001352         135500 PFM-DELETE-F3-4.                                                 NC1024.2
   001353         135600     PERFORM DE-LETE.                                             NC1024.2 284
   001354         135700     GO TO   PFM-WRITE-F3-4.                                      NC1024.2 1359
   001355         135800 PFM-FAIL-F3-4.                                                   NC1024.2
   001356         135900     MOVE    WRK-DU-6V0-1 TO COMPUTED-N.                          NC1024.2 69 144
   001357         136000     MOVE    98           TO CORRECT-N.                           NC1024.2 158
   001358         136100     PERFORM FAIL.                                                NC1024.2 283
   001359         136200 PFM-WRITE-F3-4.                                                  NC1024.2
   001360         136300     MOVE   "PFM-TEST-F3-4  " TO PAR-NAME.                        NC1024.2 132
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001361         136400     PERFORM PRINT-DETAIL.                                        NC1024.2 286
   001362         136500     GO TO   CCVS-EXIT.                                           NC1024.2 1498
   001363         136600 A121.                                                            NC1024.2
   001364         136700     EXIT.                                                        NC1024.2
   001365         136800 A120.                                                            NC1024.2
   001366         136900     MOVE "T" TO TEST-LETTER (20).                                NC1024.2 125
   001367         137000     PERFORM A121.                                                NC1024.2 1363
   001368         137100 A119.                                                            NC1024.2
   001369         137200     MOVE "S" TO TEST-LETTER (19).                                NC1024.2 125
   001370         137300     PERFORM A120.                                                NC1024.2 1365
   001371         137400 A118.                                                            NC1024.2
   001372         137500     MOVE "R" TO TEST-LETTER (18).                                NC1024.2 125
   001373         137600     PERFORM A119.                                                NC1024.2 1368
   001374         137700 A117.                                                            NC1024.2
   001375         137800     MOVE "Q" TO TEST-LETTER (17).                                NC1024.2 125
   001376         137900     PERFORM A118.                                                NC1024.2 1371
   001377         138000 A116.                                                            NC1024.2
   001378         138100     MOVE "P" TO TEST-LETTER (16).                                NC1024.2 125
   001379         138200     PERFORM A117.                                                NC1024.2 1374
   001380         138300 A115.                                                            NC1024.2
   001381         138400     MOVE "O" TO TEST-LETTER (15).                                NC1024.2 125
   001382         138500     PERFORM A116.                                                NC1024.2 1377
   001383         138600 A114.                                                            NC1024.2
   001384         138700     MOVE "N" TO TEST-LETTER (14).                                NC1024.2 125
   001385         138800     PERFORM A115.                                                NC1024.2 1380
   001386         138900 A113.                                                            NC1024.2
   001387         139000     MOVE "M" TO TEST-LETTER (13).                                NC1024.2 125
   001388         139100     PERFORM A114.                                                NC1024.2 1383
   001389         139200 A112.                                                            NC1024.2
   001390         139300     MOVE "L" TO TEST-LETTER (12).                                NC1024.2 125
   001391         139400     PERFORM A113.                                                NC1024.2 1386
   001392         139500 A111.                                                            NC1024.2
   001393         139600     MOVE "K" TO TEST-LETTER (11).                                NC1024.2 125
   001394         139700     PERFORM A112.                                                NC1024.2 1389
   001395         139800 A110.                                                            NC1024.2
   001396         139900     MOVE "J" TO TEST-LETTER (10).                                NC1024.2 125
   001397         140000     PERFORM A111.                                                NC1024.2 1392
   001398         140100 A109.                                                            NC1024.2
   001399         140200     MOVE "I" TO TEST-LETTER (9).                                 NC1024.2 125
   001400         140300     PERFORM A110.                                                NC1024.2 1395
   001401         140400 A108.                                                            NC1024.2
   001402         140500     MOVE "H" TO TEST-LETTER (8).                                 NC1024.2 125
   001403         140600     PERFORM A109.                                                NC1024.2 1398
   001404         140700 A107.                                                            NC1024.2
   001405         140800     MOVE "G" TO TEST-LETTER (7).                                 NC1024.2 125
   001406         140900     PERFORM A108.                                                NC1024.2 1401
   001407         141000 A106.                                                            NC1024.2
   001408         141100     MOVE "F" TO TEST-LETTER (6).                                 NC1024.2 125
   001409         141200     PERFORM A107.                                                NC1024.2 1404
   001410         141300 A105.                                                            NC1024.2
   001411         141400     MOVE "E" TO TEST-LETTER (5).                                 NC1024.2 125
   001412         141500     PERFORM A106.                                                NC1024.2 1407
   001413         141600 A104.                                                            NC1024.2
   001414         141700     MOVE "D" TO TEST-LETTER (4).                                 NC1024.2 125
   001415         141800     PERFORM A105.                                                NC1024.2 1410
   001416         141900 A103.                                                            NC1024.2
   001417         142000     MOVE "C" TO TEST-LETTER (3).                                 NC1024.2 125
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001418         142100     PERFORM A104.                                                NC1024.2 1413
   001419         142200 A102.                                                            NC1024.2
   001420         142300     MOVE "B" TO TEST-LETTER (2).                                 NC1024.2 125
   001421         142400     PERFORM A103.                                                NC1024.2 1416
   001422         142500 A101.                                                            NC1024.2
   001423         142600     MOVE "A" TO TEST-LETTER (1).                                 NC1024.2 125
   001424         142700     PERFORM A102.                                                NC1024.2 1419
   001425         142800 PFM-C.                                                           NC1024.2
   001426         142900     ADD      6 TO PERFORM2.                                      NC1024.2 118
   001427         143000 PFM-D.                                                           NC1024.2
   001428         143100     PERFORM  FAIL.                                               NC1024.2 283
   001429         143200     GO TO    PFM-TEST-F1-3.                                      NC1024.2 776
   001430         143300*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               NC1024.2
   001431         143400*    FROM THE PREVIOUS ONE.                                       NC1024.2
   001432         143500 PFM-E.                                                           NC1024.2
   001433         143600     MOVE "CSW" TO PERFORM1.                                      NC1024.2 116
   001434         143700     PERFORM  PFM-F THRU PFM-G.                                   NC1024.2 1437 1439
   001435         143800     SUBTRACT .8 FROM PERFORM4.                                   NC1024.2 120
   001436         143900     GO TO    PFM-H.                                              NC1024.2 1441
   001437         144000 PFM-F.                                                           NC1024.2
   001438         144100     MOVE     60.5 TO PERFORM4.                                   NC1024.2 120
   001439         144200 PFM-G.                                                           NC1024.2
   001440         144300     ADD      10.3 TO PERFORM4.                                   NC1024.2 120
   001441         144400 PFM-H.                                                           NC1024.2
   001442         144500     EXIT.                                                        NC1024.2
   001443         144600 PFM-I.                                                           NC1024.2
   001444         144700     PERFORM  FAIL.                                               NC1024.2 283
   001445         144800     GO TO    PFM-WRITE-F3-4.                                     NC1024.2 1359
   001446         144900*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               NC1024.2
   001447         145000*    FROM THE PREVIOUS ONE.                                       NC1024.2
   001448         145100 PFM-J.                                                           NC1024.2
   001449         145200     MOVE "YES" TO PERFORM1.                                      NC1024.2 116
   001450         145300     PERFORM  PFM-L.                                              NC1024.2 1457
   001451         145400     MULTIPLY 3 BY PERFORM2.                                      NC1024.2 118
   001452         145500 PFM-K.                                                           NC1024.2
   001453         145600     PERFORM  FAIL.                                               NC1024.2 283
   001454         145700     GO TO    PFM-WRITE-F1-4.                                     NC1024.2 823
   001455         145800*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               NC1024.2
   001456         145900*    FROM THE PREVIOUS ONE.                                       NC1024.2
   001457         146000 PFM-L.                                                           NC1024.2
   001458         146100     MOVE     4 TO PERFORM2.                                      NC1024.2 118
   001459         146200     ADD      100 TO PERFORM2.                                    NC1024.2 118
   001460         146300 PFM-M.                                                           NC1024.2
   001461         146400     PERFORM  FAIL.                                               NC1024.2 283
   001462         146500     GO TO    PFM-WRITE-F1-4.                                     NC1024.2 823
   001463         146600*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH               NC1024.2
   001464         146700*    FROM THE PREVIOUS ONE.                                       NC1024.2
   001465         146800 PFM-N        SECTION.                                            NC1024.2
   001466         146900 PFM-O.                                                           NC1024.2
   001467         147000     PERFORM  FAIL.                                               NC1024.2 283
   001468         147100 PFM-P.                                                           NC1024.2
   001469         147200     SUBTRACT 1 FROM ERROR-COUNTER.                               NC1024.2 181
   001470         147300     PERFORM  PASS.                                               NC1024.2 282
   001471         147400 PFM-Q        SECTION.                                            NC1024.2
   001472         147500 PFM-R.                                                           NC1024.2
   001473         147600     PERFORM  FAIL.                                               NC1024.2 283
   001474         147700     GO TO    PFM-WRITE-F1-5.                                     NC1024.2 835
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001475         147800*    NOTE CONTROL SHOULD NOT PASS TO THIS PARAGRAPH FROM THE      NC1024.2
   001476         147900*        PREVIOUS ONE.                                            NC1024.2
   001477         148000 PFM-S.                                                           NC1024.2
   001478         148100     ADD      1 TO PERFORM5.                                      NC1024.2 121
   001479         148200 PFM-T.                                                           NC1024.2
   001480         148300     ADD      10 TO PERFORM5.                                     NC1024.2 121
   001481         148400 PFM-U.                                                           NC1024.2
   001482         148500     ADD      100 TO PERFORM5.                                    NC1024.2 121
   001483         148600     IF       PERFORM5 GREATER THAN 899                           NC1024.2 121
   001484      1  148700              MOVE PERFORM5 TO COMPUTED-N                         NC1024.2 121 144
   001485      1  148800              MOVE 707 TO CORRECT-N                               NC1024.2 158
   001486      1  148900              PERFORM FAIL                                        NC1024.2 283
   001487      1  149000              MOVE "PFM-TEST-F2-6" TO PAR-NAME                    NC1024.2 132
   001488      1  149100              MOVE "*** ABORTED ***   SEE PFM-U" TO RE-MARK       NC1024.2 137
   001489      1  149200              PERFORM PRINT-DETAIL                                NC1024.2 286
   001490      1  149300              PERFORM END-ROUTINE THRU END-ROUTINE-13             NC1024.2 307 328
   001491      1  149400              CLOSE PRINT-FILE                                    NC1024.2 36
   001492      1  149500              STOP RUN.                                           NC1024.2
   001493         149600 PFM-V.       EXIT.                                               NC1024.2
   001494         149700 PFM-W.       EXIT.                                               NC1024.2
   001495         149800 PFM-X.       EXIT.                                               NC1024.2
   001496         149900 PFM-Y.       EXIT.                                               NC1024.2
   001497         150000 PFM-Z.       EXIT.                                               NC1024.2
   001498         150100 CCVS-EXIT SECTION.                                               NC1024.2
   001499         150200 CCVS-999999.                                                     NC1024.2
   001500         150300     GO TO CLOSE-FILES.                                           NC1024.2 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    30
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       96   A
       93   ALTERLOOP
      188   ANSI-REFERENCE . . . . . . . .  365 372 381 M389 M404 M472 M491 M515 M551 M589 M621 M646 M678 M694 M709 M727
                                            M757 M775 M801 M828 M840 M853 M880 M908 M943 M977 M1018 M1045 M1063 M1109 M1139
                                            M1177 M1217 M1258 M1287 M1312 M1340
       87   ATWO-DS-01V00. . . . . . . . .  M882 886
       97   B
       98   C
      167   CCVS-C-1 . . . . . . . . . . .  304 350
      172   CCVS-C-2 . . . . . . . . . . .  305 351
      222   CCVS-E-1 . . . . . . . . . . .  310
      227   CCVS-E-2 . . . . . . . . . . .  319 326 333 338
      230   CCVS-E-2-2 . . . . . . . . . .  M318
      235   CCVS-E-3 . . . . . . . . . . .  339
      244   CCVS-E-4 . . . . . . . . . . .  318
      245   CCVS-E-4-1 . . . . . . . . . .  M316
      247   CCVS-E-4-2 . . . . . . . . . .  M317
      189   CCVS-H-1 . . . . . . . . . . .  299 346
      194   CCVS-H-2A. . . . . . . . . . .  300 347
      203   CCVS-H-2B. . . . . . . . . . .  301 348
      215   CCVS-H-3 . . . . . . . . . . .  302 349
      265   CCVS-PGM-ID. . . . . . . . . .  271 271
      149   CM-18V0
      143   COMPUTED-A . . . . . . . . . .  144 146 147 148 149 377 380 M784 M811 M1053
      144   COMPUTED-N . . . . . . . . . .  M507 M545 M581 M612 M636 M670 M791 M818 M872 M900 M935 M969 M1010 M1037 M1129
                                            M1152 M1165 M1192 M1205 M1233 M1246 M1278 M1303 M1330 M1356 M1484
      142   COMPUTED-X . . . . . . . . . .  M294 362
      146   COMPUTED-0V18
      148   COMPUTED-14V4
      150   COMPUTED-18V0
      147   COMPUTED-4V14
      166   COR-ANSI-REFERENCE . . . . . .  M372 M374
      157   CORRECT-A. . . . . . . . . . .  158 159 160 161 162 378 380 M783 M810 M1052
      158   CORRECT-N. . . . . . . . . . .  M508 M546 M582 M613 M637 M671 M790 M817 M873 M901 M936 M970 M1011 M1038 M1130
                                            M1151 M1164 M1191 M1204 M1232 M1245 M1279 M1304 M1331 M1357 M1485
      156   CORRECT-X. . . . . . . . . . .  M295 364
      159   CORRECT-0V18
      161   CORRECT-14V4
      163   CORRECT-18V0
      160   CORRECT-4V14
      162   CR-18V0
       99   D
      180   DELETE-COUNTER . . . . . . . .  M284 313 329 331
      135   DOTVALUE . . . . . . . . . . .  M289
      186   DUMMY-HOLD . . . . . . . . . .  M343 353
       38   DUMMY-RECORD . . . . . . . . .  M299 M300 M301 M302 M304 M305 M306 M308 M310 M319 M326 M333 M338 M339 343 M344
                                            345 M346 M347 M348 M349 M350 M351 M352 M353 357 M358 M367 M382
      100   E
      233   ENDER-DESC . . . . . . . . . .  M321 M332 M337
      181   ERROR-COUNTER. . . . . . . . .  M283 312 322 325 M1469
      185   ERROR-HOLD . . . . . . . . . .  M312 M313 M313 M314 317
      231   ERROR-TOTAL. . . . . . . . . .  M323 M325 M330 M331 M335 M336
      101   F
      128   FEATURE. . . . . . . . . . . .  M400 M407 M411 M485 M511 M640 M691 M705 M723 M753 M771 M797 M824 M836 M849 M876
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    31
0 Defined   Cross-reference of data names   References

0                                           M904 M939 M973 M1014 M1039 M1105 M1133 M1178 M1218 M1257
      102   G
      113   GO-SCRIPT. . . . . . . . . . .  594 652
      112   GO-TABLE . . . . . . . . . . .  M590 M648
      115   GO-TO-DEEP . . . . . . . . . .  M492 495 503 507 M516 M526 M529 M532 M535 M538 541 545 M552 M562 M565 M568 M571
                                            M574 577 581 M591 M599 M602 M605 608 612 M622 624 632 636 M649 M657 M660 M663
                                            666 670
      114   GO-TO-DEPEND . . . . . . . . .  M408 414 425 M427 429 M432 438 M440 M443 447 M449 M452 456 M458 M461 465 M517
                                            519 520 521 M553 555 556 557
      103   H
      259   HYPHEN-LINE. . . . . . . . . .  306 308 352
      104   I
      225   ID-AGAIN . . . . . . . . . . .  M271
      258   INF-ANSI-REFERENCE . . . . . .  M365 M368 M381 M383
      253   INFO-TEXT. . . . . . . . . . .  M366
      182   INSPECT-COUNTER. . . . . . . .  M281 312 334 336
      105   J
      106   K
      107   L
      108   M
      109   N
       95   NOTE-RECORD
      110   O
      111   P
       89   P-COUNT. . . . . . . . . . . .  M854 M857 M859 M862 865 872 M881 M885 M887 M890 893 900 M909 M912 M914 M916 M918
                                            M921 M924 927 935 M944 M947 M949 M951 M953 M956 M959 962 969 M978 M980 M982 M985
                                            M987 M989 M991 M993 M995 M997 M999 M1001 1003 1010 M1019 M1022 M1024 M1026 1030
                                            1037 M1179 M1183 M1184 1188 1192 M1219 M1224 M1225 1229 1233
      130   P-OR-F . . . . . . . . . . . .  M281 M282 M283 M284 291 M294 M406
      132   PAR-NAME . . . . . . . . . . .  M296 M401 M405 M420 M424 M437 M446 M455 M464 M486 M512 M548 M584 M615 M641 M673
                                            M690 M706 M724 M754 M772 M798 M825 M837 M850 M877 M905 M940 M974 M1015 M1042
                                            M1059 M1106 M1134 M1158 M1171 M1198 M1211 M1239 M1252 M1282 M1307 M1334 M1360
                                            M1487
      134   PARDOT-X . . . . . . . . . . .  M288
      183   PASS-COUNTER . . . . . . . . .  M282 314 316
      124   PERFORM-HOLD . . . . . . . . .  M1046 1049 1053
      123   PERFORM-KEY. . . . . . . . . .  M710 M728 737 742
      116   PERFORM1 . . . . . . . . . . .  715 M738 M740 748 782 784 807 811 M1433 M1449
      118   PERFORM2 . . . . . . . . . . .  763 814 818 M1110 1112 M1113 1114 M1259 1263 1266 M1274 1278 M1288 1292 1293
                                            M1301 1303 M1426 M1451 M1458 M1459
       40   PERFORM3 . . . . . . . . . . .  M1260 1274 M1276
      120   PERFORM4 . . . . . . . . . . .  787 791 M1435 M1438 M1440
      121   PERFORM5 . . . . . . . . . . .  M1115 1116 1122 1129 M1478 M1480 M1482 1483 1484
       36   PRINT-FILE . . . . . . . . . .  32 270 276 1491
       37   PRINT-REC. . . . . . . . . . .  M290 M371 M373
      137   RE-MARK. . . . . . . . . . . .  M285 M297 M1077 M1081 M1100 M1488
      179   REC-CT . . . . . . . . . . . .  287 289 296
      178   REC-SKL-SUB
      187   RECORD-COUNT . . . . . . . . .  M341 342 M354
      138   TEST-COMPUTED. . . . . . . . .  371
      153   TEST-CORRECT . . . . . . . . .  373
      206   TEST-ID. . . . . . . . . . . .  M271
      125   TEST-LETTER. . . . . . . . . .  M1366 M1369 M1372 M1375 M1378 M1381 M1384 M1387 M1390 M1393 M1396 M1399 M1402
                                            M1405 M1408 M1411 M1414 M1417 M1420 M1423
      126   TEST-RESULTS . . . . . . . . .  M272 290
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    32
0 Defined   Cross-reference of data names   References

0      90   THREE. . . . . . . . . . . . .  M758 761
      184   TOTAL-ERROR
       42   WRK-AN-X-18-1
       86   WRK-DS-02V00 . . . . . . . . .  M1313 1316 M1321 1323 1330
       73   WRK-DS-1V0-1
       74   WRK-DS-1V0-2
       75   WRK-DS-1V2-1
       80   WRK-DS-16V2-1
       76   WRK-DS-2V0-1
       77   WRK-DS-2V1-1
       78   WRK-DS-2V2-1
       79   WRK-DS-2V2-2
       43   WRK-DU-X-18V0-1
       44   WRK-DU-0V1-1
       46   WRK-DU-0V12-1
       45   WRK-DU-0V2-1
       47   WRK-DU-1V0-1
       48   WRK-DU-1V1-1
       49   WRK-DU-1V1-2
       53   WRK-DU-1V17-1
       50   WRK-DU-1V3-1
       51   WRK-DU-1V3-2
       52   WRK-DU-1V5-1
       71   WRK-DU-16V2-1
       54   WRK-DU-2P6-1
       55   WRK-DU-2V0-1 . . . . . . . . .  M1141 M1144 1148 1152 M1180 M1186 1201 1205 M1220 M1227 1242 1246
       56   WRK-DU-2V0-2 . . . . . . . . .  M1142 M1145 1161 1165 M1221 1223
       57   WRK-DU-2V0-3
       58   WRK-DU-2V1-1
       59   WRK-DU-2V1-2
       60   WRK-DU-2V1-3
       61   WRK-DU-2V2-1
       62   WRK-DU-2V2-2
       63   WRK-DU-2V2-3
       64   WRK-DU-2V2-4
       65   WRK-DU-2V2-5
       66   WRK-DU-2V5-1
       67   WRK-DU-4P1-1
       68   WRK-DU-5V1-1
       69   WRK-DU-6V0-1 . . . . . . . . .  M1341 1343 M1344 M1345 M1347 1349 1356
       70   WRK-DU-6V0-2
       72   WRK-NE-X-1
       81   WRK-NE-X-2
       82   WRK-NE-1
       83   WRK-NE-2
       84   WRK-NE-3
       85   WRK-NE-4
       41   WRK-XN-18-1. . . . . . . . . .  42 43
       91   WS-FOUR
       92   XRAY
      255   XXCOMPUTED . . . . . . . . . .  M380
      257   XXCORRECT. . . . . . . . . . .  M380
      250   XXINFO . . . . . . . . . . . .  367 382
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    33
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

     1422   A101 . . . . . . . . . . . . .  P1048
     1419   A102 . . . . . . . . . . . . .  P1424
     1416   A103 . . . . . . . . . . . . .  P1421
     1413   A104 . . . . . . . . . . . . .  P1418
     1410   A105 . . . . . . . . . . . . .  P1415
     1407   A106 . . . . . . . . . . . . .  P1412
     1404   A107 . . . . . . . . . . . . .  P1409
     1401   A108 . . . . . . . . . . . . .  P1406
     1398   A109 . . . . . . . . . . . . .  P1403
     1395   A110 . . . . . . . . . . . . .  P1400
     1392   A111 . . . . . . . . . . . . .  P1397
     1389   A112 . . . . . . . . . . . . .  P1394
     1386   A113 . . . . . . . . . . . . .  P1391
     1383   A114 . . . . . . . . . . . . .  P1388
     1380   A115 . . . . . . . . . . . . .  P1385
     1377   A116 . . . . . . . . . . . . .  P1382
     1374   A117 . . . . . . . . . . . . .  P1379
     1371   A118 . . . . . . . . . . . . .  P1376
     1368   A119 . . . . . . . . . . . . .  P1373
     1365   A120 . . . . . . . . . . . . .  P1370
     1363   A121 . . . . . . . . . . . . .  P1367
      376   BAIL-OUT . . . . . . . . . . .  P293
      384   BAIL-OUT-EX. . . . . . . . . .  E293 G378
      379   BAIL-OUT-WRITE . . . . . . . .  G377
      359   BLANK-LINE-PRINT
     1498   CCVS-EXIT. . . . . . . . . . .  G1362
     1499   CCVS-999999
      268   CCVS1
      385   CCVS1-EXIT . . . . . . . . . .  G274
      275   CLOSE-FILES. . . . . . . . . .  G1500
      303   COLUMN-NAMES-ROUTINE . . . . .  E273
      284   DE-LETE. . . . . . . . . . . .  P395 P421 P479 P499 P523 P559 P596 P628 P654 P685 P698 P721 P734 P769 P795 P822
                                            P834 P847 P869 P897 P932 P966 P1007 P1034 P1057 P1071 P1126 P1156 P1169 P1196
                                            P1209 P1237 P1250 P1271 P1298 P1327 P1353
      307   END-ROUTINE. . . . . . . . . .  P276 P1490
      311   END-ROUTINE-1
      320   END-ROUTINE-12
      328   END-ROUTINE-13 . . . . . . . .  E276 E1490
      309   END-RTN-EXIT
      693   EXIT--INIT-GF-1
      700   EXIT-CHECK-GF-1. . . . . . . .  G696
      697   EXIT-DELETE-GF-1
      702   EXIT-PASS-GF-1
      695   EXIT-TEST-GF-1
      704   EXIT-WRITE-GF-1. . . . . . . .  G699
      283   FAIL . . . . . . . . . . . . .  P392 P431 P439 P448 P457 P468 P476 P509 P544 P580 P611 P638 P669 P682 P718 P743
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    34
0 Defined   Cross-reference of procedures   References

0                                           P751 P766 P785 P792 P812 P819 P874 P902 P937 P971 P1012 P1040 P1054 P1076 P1080
                                            P1099 P1131 P1153 P1166 P1193 P1206 P1234 P1247 P1280 P1305 P1332 P1358 P1428
                                            P1444 P1453 P1461 P1467 P1473 P1486
      361   FAIL-ROUTINE . . . . . . . . .  P292
      375   FAIL-ROUTINE-EX. . . . . . . .  E292 G369
      370   FAIL-ROUTINE-WRITE . . . . . .  G363 G364
      423   GO--A. . . . . . . . . . . . .  G418
      525   GO--A-F2-3 . . . . . . . . . .  D519
      561   GO--A-F2-4 . . . . . . . . . .  D555
      598   GO--A-F2-5 . . . . . . . . . .  D593
      656   GO--A-F2-7 . . . . . . . . . .  D651
      436   GO--B. . . . . . . . . . . . .  D412
      528   GO--B-F2-3 . . . . . . . . . .  D519
      564   GO--B-F2-4 . . . . . . . . . .  D555
      601   GO--B-F2-5 . . . . . . . . . .  D593
      659   GO--B-F2-7 . . . . . . . . . .  D651
      445   GO--C. . . . . . . . . . . . .  D414
      531   GO--C-F2-3 . . . . . . . . . .  D520
      567   GO--C-F2-4 . . . . . . . . . .  D556
      604   GO--C-F2-5 . . . . . . . . . .  D593
      662   GO--C-F2-7 . . . . . . . . . .  D651
      454   GO--D. . . . . . . . . . . . .  D413
      534   GO--D-F2-3 . . . . . . . . . .  D521
      570   GO--D-F2-4 . . . . . . . . . .  D557
      607   GO--D-F2-5 . . . . . . . . . .  G600 G603 G606
      665   GO--D-F2-7 . . . . . . . . . .  G658 G661 G664
      394   GO--DELETE-F1-1
      478   GO--DELETE-F1-2
      419   GO--DELETE-F2-1
      498   GO--DELETE-F2-2
      522   GO--DELETE-F2-3
      558   GO--DELETE-F2-4
      595   GO--DELETE-F2-5
      627   GO--DELETE-F2-6
      653   GO--DELETE-F2-7
      463   GO--E. . . . . . . . . . . . .  G430
      537   GO--E-F2-3 . . . . . . . . . .  D521
      573   GO--E-F2-4 . . . . . . . . . .  D557
      540   GO--F-F2-3 . . . . . . . . . .  G527 G530 G533 G536 G539
      576   GO--F-F2-4 . . . . . . . . . .  G563 G566 G569 G572 G575
      506   GO--FAIL-F2-2. . . . . . . . .  D495 G497
      543   GO--FAIL-F2-3
      579   GO--FAIL-F2-4
      610   GO--FAIL-F2-5
      635   GO--FAIL-F2-6. . . . . . . . .  G626
      668   GO--FAIL-F2-7
      388   GO--INIT-F1-1
      471   GO--INIT-F1-2
      677   GO--INIT-F1-3
      403   GO--INIT-F2-1
      490   GO--INIT-F2-2
      514   GO--INIT-F2-3
      550   GO--INIT-F2-4
      588   GO--INIT-F2-5
      619   GO--INIT-F2-6
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    35
0 Defined   Cross-reference of procedures   References

0     645   GO--INIT-F2-7
      482   GO--PAS-F1-2
      502   GO--PAS-F2-2
      631   GO--PAS-F2-6
      397   GO--PASS-F1-1. . . . . . . . .  G391
      481   GO--PASS-F1-2. . . . . . . . .  G474
      501   GO--PASS-F2-2. . . . . . . . .  D494
      630   GO--PASS-F2-6. . . . . . . . .  D624
      390   GO--TEST-F1-1
      473   GO--TEST-F1-2
      409   GO--TEST-F2-1. . . . . . . . .  G428 G433 G441 G444 G450 G453 G459 G462
      493   GO--TEST-F2-2
      518   GO--TEST-F2-3
      554   GO--TEST-F2-4
      592   GO--TEST-F2-5
      623   GO--TEST-F2-6
      650   GO--TEST-F2-7-0
      399   GO--WRITE-F1-1 . . . . . . . .  G393 G396
      484   GO--WRITE-F1-2 . . . . . . . .  G477 G480
      469   GO--WRITE-F2-1 . . . . . . . .  G422 G467
      510   GO--WRITE-F2-2 . . . . . . . .  G500 G505
      547   GO--WRITE-F2-3 . . . . . . . .  G524 G542
      583   GO--WRITE-F2-4 . . . . . . . .  G560 G578
      614   GO--WRITE-F2-5 . . . . . . . .  G597 G609
      639   GO--WRITE-F2-6 . . . . . . . .  G629 G634
      672   GO--WRITE-F2-7 . . . . . . . .  G655 G667
      684   GOTO-DELETE-F1-3
      681   GOTO-FAIL-F1-3
      679   GOTO-TEST-F1-3
      689   GOTO-WRITE-F1-3. . . . . . . .  G683 G686
      298   HEAD-ROUTINE . . . . . . . . .  P273
      281   INSPT
      269   OPEN-FILES
      282   PASS . . . . . . . . . . . . .  P398 P426 P442 P451 P460 P466 P483 P504 P542 P578 P609 P633 P667 P688 P703 P716
                                            P749 P764 P788 P808 P815 P844 P866 P894 P928 P963 P1004 P1031 P1050 P1074 P1123
                                            P1149 P1162 P1189 P1202 P1230 P1243 P1267 P1294 P1324 P1350 P1470
      736   PFM-A. . . . . . . . . . . . .  P714 G732
     1061   PFM-A-F1-10
      860   PFM-A-F1-6 . . . . . . . . . .  P858
      919   PFM-A-F1-7 . . . . . . . . . .  P913 P915
      984   PFM-A-F1-8 . . . . . . . . . .  P981
      888   PFM-A-F2-3 . . . . . . . . . .  P886
      954   PFM-A-F2-4 . . . . . . . . . .  P948 P950
     1025   PFM-A-F2-5 . . . . . . . . . .  P1021 P1023
     1318   PFM-A-F3-3 . . . . . . . . . .  P1315
      741   PFM-B
     1073   PFM-B-F1-10. . . . . . . . . .  E1065 G1103
      861   PFM-B-F1-6 . . . . . . . . . .  P856
      920   PFM-B-F1-7 . . . . . . . . . .  P911 P917
      988   PFM-B-F1-8 . . . . . . . . . .  P986
      889   PFM-B-F2-3 . . . . . . . . . .  P884
      955   PFM-B-F2-4 . . . . . . . . . .  P946 P952
     1027   PFM-B-F2-5 . . . . . . . . . .  E1021 E1023
     1320   PFM-B-F3-3 . . . . . . . . . .  E1315
     1425   PFM-C. . . . . . . . . . . . .  P760 P761
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    36
0 Defined   Cross-reference of procedures   References

0    1075   PFM-C-F1-10
      922   PFM-C-F1-7 . . . . . . . . . .  E913 E917
      992   PFM-C-F1-8 . . . . . . . . . .  P990
      957   PFM-C-F2-4 . . . . . . . . . .  E948
     1427   PFM-D
     1079   PFM-D-F1-10. . . . . . . . . .  G1086 G1091
      923   PFM-D-F1-7 . . . . . . . . . .  E911 E915
      996   PFM-D-F1-8 . . . . . . . . . .  P994
      958   PFM-D-F2-4 . . . . . . . . . .  E946 E950 E952
      720   PFM-DELETE-F1-1
     1070   PFM-DELETE-F1-10
     1155   PFM-DELETE-F1-11-1
     1168   PFM-DELETE-F1-11-2
      733   PFM-DELETE-F1-2
      794   PFM-DELETE-F1-3
      821   PFM-DELETE-F1-4
      833   PFM-DELETE-F1-5
      868   PFM-DELETE-F1-6
      931   PFM-DELETE-F1-7
     1006   PFM-DELETE-F1-8
     1056   PFM-DELETE-F1-9
      768   PFM-DELETE-F2-1
      846   PFM-DELETE-F2-2
      896   PFM-DELETE-F2-3
      965   PFM-DELETE-F2-4
     1033   PFM-DELETE-F2-5
     1125   PFM-DELETE-F2-6
     1195   PFM-DELETE-F2-7-1
     1208   PFM-DELETE-F2-7-2
     1236   PFM-DELETE-F2-8-1
     1249   PFM-DELETE-F2-8-2
     1270   PFM-DELETE-F3-1
     1297   PFM-DELETE-F3-2
     1326   PFM-DELETE-F3-3
     1352   PFM-DELETE-F3-4
     1432   PFM-E. . . . . . . . . . . . .  P777
     1083   PFM-E-F1-10. . . . . . . . . .  G1089
     1000   PFM-E-F1-8 . . . . . . . . . .  P998
     1437   PFM-F. . . . . . . . . . . . .  P1434
     1085   PFM-F-F1-10
      871   PFM-FAIL-F1-6. . . . . . . . .  G867
      934   PFM-FAIL-F1-7. . . . . . . . .  G930
     1009   PFM-FAIL-F1-8. . . . . . . . .  G1005
      899   PFM-FAIL-F2-3. . . . . . . . .  G895
      968   PFM-FAIL-F2-4. . . . . . . . .  G964
     1036   PFM-FAIL-F2-5. . . . . . . . .  G1032
     1128   PFM-FAIL-F2-6. . . . . . . . .  G1124
     1277   PFM-FAIL-F3-1. . . . . . . . .  G1269
     1302   PFM-FAIL-F3-2. . . . . . . . .  G1296
     1329   PFM-FAIL-F3-3. . . . . . . . .  G1325
     1355   PFM-FAIL-F3-4. . . . . . . . .  G1351
     1273   PFM-F3-1-A . . . . . . . . . .  P1262
     1275   PFM-F3-1-AA. . . . . . . . . .  E1262
     1300   PFM-F3-2-C . . . . . . . . . .  P1292
     1439   PFM-G. . . . . . . . . . . . .  E1434
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    37
0 Defined   Cross-reference of procedures   References

0    1087   PFM-G-F1-10. . . . . . . . . .  P1065
     1441   PFM-H. . . . . . . . . . . . .  E777 G1436
     1088   PFM-H-F1-10
     1443   PFM-I
     1090   PFM-I-F1-10
      708   PFM-INIT-F1-1
     1062   PFM-INIT-F1-10
     1138   PFM-INIT-F1-11
      726   PFM-INIT-F1-2
      774   PFM-INIT-F1-3
      800   PFM-INIT-F1-4
      827   PFM-INIT-F1-5
      852   PFM-INIT-F1-6
      907   PFM-INIT-F1-7
      976   PFM-INIT-F1-8
     1044   PFM-INIT-F1-9
      756   PFM-INIT-F2-1
      839   PFM-INIT-F2-2
      879   PFM-INIT-F2-3
      942   PFM-INIT-F2-4
     1017   PFM-INIT-F2-5
     1108   PFM-INIT-F2-5
     1175   PFM-INIT-F2-7
     1215   PFM-INIT-F2-8
     1256   PFM-INIT-F3-1
     1286   PFM-INIT-F3-2
     1311   PFM-INIT-F3-3
     1338   PFM-INIT-F3-4
     1448   PFM-J. . . . . . . . . . . . .  P803
     1096   PFM-J-F1-10
     1452   PFM-K
     1098   PFM-K-F1-10
     1457   PFM-L. . . . . . . . . . . . .  P1450
     1102   PFM-L-F1-10. . . . . . . . . .  G1084
     1460   PFM-M
     1465   PFM-N. . . . . . . . . . . . .  P830
     1466   PFM-O
     1468   PFM-P
     1471   PFM-Q
     1472   PFM-R
     1477   PFM-S. . . . . . . . . . . . .  P1112
     1479   PFM-T. . . . . . . . . . . . .  P1114
      711   PFM-TEST-F1-1
     1064   PFM-TEST-F1-10
     1143   PFM-TEST-F1-11-0
     1147   PFM-TEST-F1-11-1
     1160   PFM-TEST-F1-11-2
      729   PFM-TEST-F1-2. . . . . . . . .  G745
      776   PFM-TEST-F1-3. . . . . . . . .  G1429
      802   PFM-TEST-F1-4
      829   PFM-TEST-F1-5
      855   PFM-TEST-F1-6
      910   PFM-TEST-F1-7
      979   PFM-TEST-F1-8
     1047   PFM-TEST-F1-9
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    38
0 Defined   Cross-reference of procedures   References

0     759   PFM-TEST-F2-1
      841   PFM-TEST-F2-2
      883   PFM-TEST-F2-3
      945   PFM-TEST-F2-4
     1020   PFM-TEST-F2-5
     1111   PFM-TEST-F2-6
     1181   PFM-TEST-F2-7-0
     1187   PFM-TEST-F2-7-1
     1200   PFM-TEST-F2-7-2
     1222   PFM-TEST-F2-8-0
     1228   PFM-TEST-F2-8-1
     1241   PFM-TEST-F2-8-2
     1261   PFM-TEST-F3-1
     1291   PFM-TEST-F3-2-0
     1314   PFM-TEST-F3-3
     1342   PFM-TEST-F3-4-0
      863   PFM-TESTT-F1-6
      925   PFM-TESTT-F1-7
     1002   PFM-TESTT-F1-8 . . . . . . . .  G983
      891   PFM-TESTT-F2-3
      960   PFM-TESTT-F2-4
     1029   PFM-TESTT-F2-5
     1322   PFM-TESTT-F3-3 . . . . . . . .  G1317
     1348   PFM-TESTT-F3-4-1
      864   PFM-TESTTT-F1-6
      926   PFM-TESTTT-F1-7
      892   PFM-TESTTT-F2-3
      961   PFM-TESTTT-F2-4
     1481   PFM-U. . . . . . . . . . . . .  P1116
     1493   PFM-V. . . . . . . . . . . . .  P842
     1494   PFM-W
      722   PFM-WRITE-F1-1 . . . . . . . .  G719
     1104   PFM-WRITE-F1-10. . . . . . . .  G1069 G1072 G1078 G1082 G1101
     1157   PFM-WRITE-F1-11-1. . . . . . .  G1154
     1170   PFM-WRITE-F1-11-2. . . . . . .  G1167
      752   PFM-WRITE-F1-2 . . . . . . . .  G735
      796   PFM-WRITE-F1-3 . . . . . . . .  G786 G793
      823   PFM-WRITE-F1-4 . . . . . . . .  G813 G820 G1454 G1462
      835   PFM-WRITE-F1-5 . . . . . . . .  G832 G1474
      875   PFM-WRITE-F1-6 . . . . . . . .  G866 G870
      938   PFM-WRITE-F1-7 . . . . . . . .  G929 G933
     1013   PFM-WRITE-F1-8 . . . . . . . .  G1004 G1008
     1058   PFM-WRITE-F1-9 . . . . . . . .  G1051 G1055
      770   PFM-WRITE-F2-1 . . . . . . . .  G767
      848   PFM-WRITE-F2-2 . . . . . . . .  G845
      903   PFM-WRITE-F2-3 . . . . . . . .  G894 G898
      972   PFM-WRITE-F2-4 . . . . . . . .  G963 G967
     1041   PFM-WRITE-F2-5 . . . . . . . .  G1031 G1035
     1132   PFM-WRITE-F2-6 . . . . . . . .  G1123 G1127
     1197   PFM-WRITE-F2-7-1 . . . . . . .  G1194
     1210   PFM-WRITE-F2-7-2 . . . . . . .  G1207
     1238   PFM-WRITE-F2-8-1 . . . . . . .  G1235
     1251   PFM-WRITE-F2-8-2 . . . . . . .  G1248
     1281   PFM-WRITE-F3-1 . . . . . . . .  G1268 G1272
     1306   PFM-WRITE-F3-2 . . . . . . . .  G1295 G1299
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    39
0 Defined   Cross-reference of procedures   References

0    1333   PFM-WRITE-F3-3 . . . . . . . .  G1324 G1328
     1359   PFM-WRITE-F3-4 . . . . . . . .  G1350 G1354 G1445
     1495   PFM-X
     1496   PFM-Y
     1497   PFM-Z. . . . . . . . . . . . .  E842
      286   PRINT-DETAIL . . . . . . . . .  P402 P410 P470 P487 P513 P549 P585 P616 P642 P674 P692 P707 P725 P744 P755 P773
                                            P799 P826 P838 P851 P878 P906 P941 P975 P1016 P1043 P1060 P1107 P1135 P1159 P1172
                                            P1199 P1212 P1240 P1253 P1283 P1308 P1335 P1361 P1489
      687   P2 . . . . . . . . . . . . . .  G680
      387   SECT-NC102A-001
      279   TERMINATE-CALL
      277   TERMINATE-CCVS
      340   WRITE-LINE . . . . . . . . . .  P290 P291 P299 P300 P301 P302 P304 P305 P306 P308 P310 P319 P327 P333 P338 P339
                                            P367 P371 P373 P382
      356   WRT-LN . . . . . . . . . . . .  P346 P347 P348 P349 P350 P351 P352 P355 P360
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    40
0 Defined   Cross-reference of programs     References

        3   NC102A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC102A    Date 06/04/2022  Time 12:00:25   Page    41
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   1065  IGYPA3086-W   "PERFORM" start-of-range "PFM-G-F1-10" follows the "PERFORM" end-of-range "PFM-B-F1-10".  The "PERFORM"
                       end-of-range may be unreachable.  The statement was processed as written.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           1              1
-* Statistics for COBOL program NC102A:
 *    Source records = 1500
 *    Data Division statements = 144
 *    Procedure Division statements = 863
 *    Generated COBOL statements = 0
 *    Program complexity factor = 873
0End of compilation 1,  program NC102A,  highest severity 4.
0Return code 4
