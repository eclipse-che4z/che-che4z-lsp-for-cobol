1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:26   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:26   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1704.2
   000002         000200 PROGRAM-ID.                                                      NC1704.2
   000003         000300     NC170A.                                                      NC1704.2
   000004         000500*                                                              *  NC1704.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1704.2
   000006         000700*                                                              *  NC1704.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1704.2
   000008         000900*                                                              *  NC1704.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1704.2
   000010         001100*                                                              *  NC1704.2
   000011         001300*                                                              *  NC1704.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1704.2
   000013         001500*                                                              *  NC1704.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1704.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1704.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1704.2
   000017         001900*                                                              *  NC1704.2
   000018         002100*                                                                 NC1704.2
   000019         002200*    THIS PROGRAM TESTS THE FORMAT 2 MULTIPLY STATEMENT FOUND     NC1704.2
   000020         002300*    IN LEVEL 1.   ALL COMBINATIONS OF THE OPTIONAL PHRASES       NC1704.2
   000021         002400*    "SIZE ERROR", "NOT SIZE ERROR" AND "END-MULTIPLY" ARE        NC1704.2
   000022         002500*    TESTED, AS WELL AS THE ROUNDED OPTION.                       NC1704.2
   000023         002600*                                                                 NC1704.2
   000024         002700*    VARIOUS COMBINATIONS OF SIGNED AND UNSIGNED NUMERIC          NC1704.2
   000025         002800*    LITERALS, DISPLAY AND COMPUTATIONAL FIELDS ARE USED          NC1704.2
   000026         002900*    AS OPERANDS.                                                 NC1704.2
   000027         003000*                                                                 NC1704.2
   000028         003100                                                                  NC1704.2
   000029         003200 ENVIRONMENT DIVISION.                                            NC1704.2
   000030         003300 CONFIGURATION SECTION.                                           NC1704.2
   000031         003400 SOURCE-COMPUTER.                                                 NC1704.2
   000032         003500     XXXXX082.                                                    NC1704.2
   000033         003600 OBJECT-COMPUTER.                                                 NC1704.2
   000034         003700     XXXXX083.                                                    NC1704.2
   000035         003800 INPUT-OUTPUT SECTION.                                            NC1704.2
   000036         003900 FILE-CONTROL.                                                    NC1704.2
   000037         004000     SELECT PRINT-FILE ASSIGN TO                                  NC1704.2 41
   000038         004100     XXXXX055.                                                    NC1704.2
   000039         004200 DATA DIVISION.                                                   NC1704.2
   000040         004300 FILE SECTION.                                                    NC1704.2
   000041         004400 FD  PRINT-FILE.                                                  NC1704.2

 ==000041==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000042         004500 01  PRINT-REC PICTURE X(120).                                    NC1704.2
   000043         004600 01  DUMMY-RECORD PICTURE X(120).                                 NC1704.2
   000044         004700 WORKING-STORAGE SECTION.                                         NC1704.2
   000045         004800 77  WRK-DS-18V00                PICTURE S9(18).                  NC1704.2
   000046         004900 77  A06THREES-DS-03V03          PICTURE S999V999 VALUE 333.333.  NC1704.2
   000047         005000 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC1704.2
   000048         005100 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06 PICTURE S9(12).        NC1704.2 47
   000049         005200 77  A08TWOS-DS-02V06            PICTURE S99V9(6) VALUE 22.222222.NC1704.2
   000050         005300 77  WRK-DS-10V00                PICTURE S9(10).                  NC1704.2
   000051         005400 77  WRK-XN-00001                PICTURE X.                       NC1704.2
   000052         005500 77  A10ONES-DS-10V00            PICTURE S9(10)                   NC1704.2
   000053         005600                                 VALUE 1111111111.                NC1704.2
   000054         005700 77  A12THREES-DS-06V06          PICTURE S9(6)V9(6)               NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800                                 VALUE 333333.333333.             NC1704.2
   000056         005900 77  WRK-DS-02V00                PICTURE S99.                     NC1704.2
   000057         006000 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC1704.2 IMP
   000058         006100 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1704.2
   000059         006200 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC1704.2 58
   000060         006300 77  A05ONES-DS-00V05            PICTURE SV9(5) VALUE .11111.     NC1704.2
   000061         006400 77  A12ONES-DS-12V00            PICTURE S9(12)                   NC1704.2
   000062         006500                                 VALUE 111111111111.              NC1704.2
   000063         006600 77  A01ONE-DS-P0801             PICTURE SP(8)9 VALUE .000000001. NC1704.2
   000064         006700 77  WRK-DS-09V08                PICTURE S9(9)V9(8).              NC1704.2
   000065         006800 77  WRK-DS-17V00-S REDEFINES WRK-DS-09V08 PICTURE S9(17).        NC1704.2 64
   000066         006900 77  A18ONES-DS-18V00            PICTURE S9(18)                   NC1704.2
   000067         007000                                 VALUE 111111111111111111.        NC1704.2
   000068         007100 77  WRK-DS-0201P                PICTURE S99P.                    NC1704.2
   000069         007200 77  WRK-CS-18V00                PICTURE S9(18) COMPUTATIONAL.    NC1704.2
   000070         007300 77  WRK-DU-18V00                PICTURE 9(18).                   NC1704.2
   000071         007400 77  A99-CS-02V00                PICTURE S99 COMPUTATIONAL        NC1704.2
   000072         007500                                 VALUE 99.                        NC1704.2
   000073         007600 77  A01ONE-CS-00V01             PICTURE SV9 COMPUTATIONAL        NC1704.2
   000074         007700                                 VALUE .1.                        NC1704.2
   000075         007800 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC1704.2
   000076         007900 77  WRK-DS-12V00                PICTURE S9(12).                  NC1704.2
   000077         008000 77  WRK-DS-01V00                PICTURE S9.                      NC1704.2
   000078         008100 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC1704.2
   000079         008200 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC1704.2
   000080         008300                                 VALUE 111111111.111111111.       NC1704.2
   000081         008400 77  A02TWOS-DU-02V00            PICTURE 99  VALUE 22.            NC1704.2
   000082         008500 77  WRK-DS-05V00                PICTURE S9(5).                   NC1704.2
   000083         008600 77  A02TWOS-DS-03V02            PICTURE S999V99 VALUE +022.00.   NC1704.2
   000084         008700 77  WRK-CS-02V02                PICTURE S99V99  COMPUTATIONAL.   NC1704.2
   000085         008800 77  A990-DS-0201P               PICTURE S99P   VALUE +990.       NC1704.2
   000086         008900 77  XRAY                        PICTURE X.                       NC1704.2
   000087         009000 01  WRK-XN-18-1 PIC X(18).                                       NC1704.2
   000088         009100 01  WRK-AN-X-18-1, REDEFINES WRK-XN-18-1 PIC A(18).              NC1704.2 87
   000089         009200 01  WRK-DU-X-18V0-1; REDEFINES WRK-XN-18-1 PIC 9(18).            NC1704.2 87
   000090         009300 01  WRK-DU-0V1-1 PIC V9 VALUE .3.                                NC1704.2
   000091         009400 01  WRK-DU-0V2-1 PIC V99 VALUE .25.                              NC1704.2
   000092         009500 01  WRK-DU-0V12-1 PIC V9(12) VALUE .00001.                       NC1704.2
   000093         009600 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1704.2 IMP
   000094         009700 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1704.2
   000095         009800 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1704.2
   000096         009900 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1704.2
   000097         010000 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1704.2
   000098         010100 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1704.2
   000099         010200 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1704.2
   000100         010300 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1704.2
   000101         010400 01  WRK-DU-2V0-1 PIC 99.                                         NC1704.2
   000102         010500 01  WRK-DU-2V0-2 PIC 99.                                         NC1704.2
   000103         010600 01  WRK-DU-2V0-3 PIC 99.                                         NC1704.2
   000104         010700 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1704.2
   000105         010800 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1704.2
   000106         010900 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1704.2
   000107         011000 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1704.2
   000108         011100 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1704.2
   000109         011200 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1704.2
   000110         011300 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1704.2
   000111         011400 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1704.2
   000113         011600 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1704.2
   000114         011700 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1704.2
   000115         011800 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1704.2
   000116         011900 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1704.2
   000117         012000 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1704.2
   000118         012100 01  WRK-NE-X-1 PIC 9(16).99.                                     NC1704.2
   000119         012200 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1704.2
   000120         012300 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1704.2
   000121         012400 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1704.2 IMP
   000122         012500 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1704.2 IMP
   000123         012600 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1704.2 IMP
   000124         012700 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1704.2 IMP
   000125         012800 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1704.2
   000126         012900 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1704.2
   000127         013000 01  WRK-NE-X-2 PIC -9(16).99.                                    NC1704.2
   000128         013100 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC1704.2
   000129         013200 01  WRK-NE-2 PIC $**.99.                                         NC1704.2
   000130         013300 01  WRK-NE-3 PIC $99.99CR.                                       NC1704.2
   000131         013400 01  WRK-NE-4 PIC $*9.99 VALUE ZERO.                              NC1704.2 IMP
   000132         013500 77  A01ONES-CS-18V00   PICTURE S9(18) COMPUTATIONAL              NC1704.2
   000133         013600             VALUE +000000000000000001.                           NC1704.2
   000134         013700 77  A02THREES-CS-18V00 PICTURE S9(18) COMPUTATIONAL              NC1704.2
   000135         013800             VALUE -000000000000000033.                           NC1704.2
   000136         013900 77  A18SIXES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1704.2
   000137         014000             VALUE 666666666666666666.                            NC1704.2
   000138         014100 77  A16NINES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1704.2
   000139         014200             VALUE 009999999999999999.                            NC1704.2
   000140         014300 77  A14TWOS-CU-18V00   PICTURE 9(18) COMPUTATIONAL               NC1704.2
   000141         014400             VALUE 000022222222222222.                            NC1704.2
   000142         014500 01  MULTIPLY-DATA.                                               NC1704.2
   000143         014600     02 MULT1                           PICTURE IS 999V99         NC1704.2
   000144         014700     VALUE IS 80.12.                                              NC1704.2
   000145         014800     02 MULT2                           PICTURE IS 999V999.       NC1704.2
   000146         014900     02 MULT3                           PICTURE IS $$99.99.       NC1704.2
   000147         015000     02 MULT4                           PICTURE IS S99            NC1704.2
   000148         015100     VALUE IS -56.                                                NC1704.2
   000149         015200     02 MULT5                           PICTURE IS 9 VALUE IS 4.  NC1704.2
   000150         015300     02 MULT6                           PICTURE IS 99 VALUE IS    NC1704.2
   000151         015400     20.                                                          NC1704.2
   000152         015500 01  DIVIDE-DATA.                                                 NC1704.2
   000153         015600     02 DIV1                            PICTURE IS 9(4)V99        NC1704.2
   000154         015700     VALUE IS 1620.36.                                            NC1704.2
   000155         015800     02 DIV2                            PICTURE IS 99V9           NC1704.2
   000156         015900     VALUE IS 44.1.                                               NC1704.2
   000157         016000     02 DIV3                            PICTURE IS 9(4)V9         NC1704.2
   000158         016100     VALUE IS 1661.7.                                             NC1704.2
   000159         016200     02 DIV4                            PICTURE IS S9V999         NC1704.2
   000160         016300     VALUE IS -9.642.                                             NC1704.2
   000161         016400     02 DIV-02LEVEL-1.                                            NC1704.2
   000162         016500     03 DIV5                            PICTURE IS V99            NC1704.2
   000163         016600     VALUE IS .82.                                                NC1704.2
   000164         016700     03 DIV6                            PICTURE IS 9 VALUE IS 0.  NC1704.2
   000165         016800     03 DIV7                            PICTURE IS 9V9            NC1704.2
   000166         016900     VALUE IS 9.6.                                                NC1704.2
   000167         017000 01  DIV-DATA-2.                                                  NC1704.2
   000168         017100     02 DIV8                            PICTURE IS 99V9.          NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 DIV9                            PICTURE IS ZZ,ZZZ.9.      NC1704.2
   000170         017300     02 DIV10                           PICTURE IS V999.          NC1704.2
   000171         017400 01  TEST-RESULTS.                                                NC1704.2
   000172         017500     02 FILLER                   PIC X      VALUE SPACE.          NC1704.2 IMP
   000173         017600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1704.2 IMP
   000174         017700     02 FILLER                   PIC X      VALUE SPACE.          NC1704.2 IMP
   000175         017800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1704.2 IMP
   000176         017900     02 FILLER                   PIC X      VALUE SPACE.          NC1704.2 IMP
   000177         018000     02  PAR-NAME.                                                NC1704.2
   000178         018100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1704.2 IMP
   000179         018200       03  PARDOT-X              PIC X      VALUE SPACE.          NC1704.2 IMP
   000180         018300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1704.2 IMP
   000181         018400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1704.2 IMP
   000182         018500     02 RE-MARK                  PIC X(61).                       NC1704.2
   000183         018600 01  TEST-COMPUTED.                                               NC1704.2
   000184         018700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1704.2 IMP
   000185         018800     02 FILLER                   PIC X(17)  VALUE                 NC1704.2
   000186         018900            "       COMPUTED=".                                   NC1704.2
   000187         019000     02 COMPUTED-X.                                               NC1704.2
   000188         019100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1704.2 IMP
   000189         019200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1704.2 188
   000190         019300                                 PIC -9(9).9(9).                  NC1704.2
   000191         019400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1704.2 188
   000192         019500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1704.2 188
   000193         019600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1704.2 188
   000194         019700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1704.2 188
   000195         019800         04 COMPUTED-18V0                    PIC -9(18).          NC1704.2
   000196         019900         04 FILLER                           PIC X.               NC1704.2
   000197         020000     03 FILLER PIC X(50) VALUE SPACE.                             NC1704.2 IMP
   000198         020100 01  TEST-CORRECT.                                                NC1704.2
   000199         020200     02 FILLER PIC X(30) VALUE SPACE.                             NC1704.2 IMP
   000200         020300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1704.2
   000201         020400     02 CORRECT-X.                                                NC1704.2
   000202         020500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1704.2 IMP
   000203         020600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1704.2 202
   000204         020700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1704.2 202
   000205         020800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1704.2 202
   000206         020900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1704.2 202
   000207         021000     03      CR-18V0 REDEFINES CORRECT-A.                         NC1704.2 202
   000208         021100         04 CORRECT-18V0                     PIC -9(18).          NC1704.2
   000209         021200         04 FILLER                           PIC X.               NC1704.2
   000210         021300     03 FILLER PIC X(2) VALUE SPACE.                              NC1704.2 IMP
   000211         021400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1704.2 IMP
   000212         021500 01  CCVS-C-1.                                                    NC1704.2
   000213         021600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1704.2
   000214         021700-    "SS  PARAGRAPH-NAME                                          NC1704.2
   000215         021800-    "       REMARKS".                                            NC1704.2
   000216         021900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1704.2 IMP
   000217         022000 01  CCVS-C-2.                                                    NC1704.2
   000218         022100     02 FILLER                     PIC X        VALUE SPACE.      NC1704.2 IMP
   000219         022200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1704.2
   000220         022300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1704.2 IMP
   000221         022400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1704.2
   000222         022500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1704.2 IMP
   000223         022600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1704.2 IMP
   000224         022700 01  REC-CT                        PIC 99       VALUE ZERO.       NC1704.2 IMP
   000225         022800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1704.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1704.2 IMP
   000227         023000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1704.2 IMP
   000228         023100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1704.2 IMP
   000229         023200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1704.2 IMP
   000230         023300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1704.2 IMP
   000231         023400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1704.2 IMP
   000232         023500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1704.2 IMP
   000233         023600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1704.2 IMP
   000234         023700 01  CCVS-H-1.                                                    NC1704.2
   000235         023800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1704.2 IMP
   000236         023900     02  FILLER                    PIC X(42)    VALUE             NC1704.2
   000237         024000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1704.2
   000238         024100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1704.2 IMP
   000239         024200 01  CCVS-H-2A.                                                   NC1704.2
   000240         024300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1704.2 IMP
   000241         024400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1704.2
   000242         024500   02  FILLER                        PIC XXXX   VALUE             NC1704.2
   000243         024600     "4.2 ".                                                      NC1704.2
   000244         024700   02  FILLER                        PIC X(28)  VALUE             NC1704.2
   000245         024800            " COPY - NOT FOR DISTRIBUTION".                       NC1704.2
   000246         024900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1704.2 IMP
   000247         025000                                                                  NC1704.2
   000248         025100 01  CCVS-H-2B.                                                   NC1704.2
   000249         025200   02  FILLER                        PIC X(15)  VALUE             NC1704.2
   000250         025300            "TEST RESULT OF ".                                    NC1704.2
   000251         025400   02  TEST-ID                       PIC X(9).                    NC1704.2
   000252         025500   02  FILLER                        PIC X(4)   VALUE             NC1704.2
   000253         025600            " IN ".                                               NC1704.2
   000254         025700   02  FILLER                        PIC X(12)  VALUE             NC1704.2
   000255         025800     " HIGH       ".                                              NC1704.2
   000256         025900   02  FILLER                        PIC X(22)  VALUE             NC1704.2
   000257         026000            " LEVEL VALIDATION FOR ".                             NC1704.2
   000258         026100   02  FILLER                        PIC X(58)  VALUE             NC1704.2
   000259         026200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1704.2
   000260         026300 01  CCVS-H-3.                                                    NC1704.2
   000261         026400     02  FILLER                      PIC X(34)  VALUE             NC1704.2
   000262         026500            " FOR OFFICIAL USE ONLY    ".                         NC1704.2
   000263         026600     02  FILLER                      PIC X(58)  VALUE             NC1704.2
   000264         026700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1704.2
   000265         026800     02  FILLER                      PIC X(28)  VALUE             NC1704.2
   000266         026900            "  COPYRIGHT   1985 ".                                NC1704.2
   000267         027000 01  CCVS-E-1.                                                    NC1704.2
   000268         027100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1704.2 IMP
   000269         027200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1704.2
   000270         027300     02 ID-AGAIN                     PIC X(9).                    NC1704.2
   000271         027400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1704.2 IMP
   000272         027500 01  CCVS-E-2.                                                    NC1704.2
   000273         027600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1704.2 IMP
   000274         027700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1704.2 IMP
   000275         027800     02 CCVS-E-2-2.                                               NC1704.2
   000276         027900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1704.2 IMP
   000277         028000         03 FILLER                   PIC X      VALUE SPACE.      NC1704.2 IMP
   000278         028100         03 ENDER-DESC               PIC X(44)  VALUE             NC1704.2
   000279         028200            "ERRORS ENCOUNTERED".                                 NC1704.2
   000280         028300 01  CCVS-E-3.                                                    NC1704.2
   000281         028400     02  FILLER                      PIC X(22)  VALUE             NC1704.2
   000282         028500            " FOR OFFICIAL USE ONLY".                             NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1704.2 IMP
   000284         028700     02  FILLER                      PIC X(58)  VALUE             NC1704.2
   000285         028800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1704.2
   000286         028900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1704.2 IMP
   000287         029000     02 FILLER                       PIC X(15)  VALUE             NC1704.2
   000288         029100             " COPYRIGHT 1985".                                   NC1704.2
   000289         029200 01  CCVS-E-4.                                                    NC1704.2
   000290         029300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1704.2 IMP
   000291         029400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1704.2
   000292         029500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1704.2 IMP
   000293         029600     02 FILLER                       PIC X(40)  VALUE             NC1704.2
   000294         029700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1704.2
   000295         029800 01  XXINFO.                                                      NC1704.2
   000296         029900     02 FILLER                       PIC X(19)  VALUE             NC1704.2
   000297         030000            "*** INFORMATION ***".                                NC1704.2
   000298         030100     02 INFO-TEXT.                                                NC1704.2
   000299         030200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1704.2 IMP
   000300         030300       04 XXCOMPUTED                 PIC X(20).                   NC1704.2
   000301         030400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1704.2 IMP
   000302         030500       04 XXCORRECT                  PIC X(20).                   NC1704.2
   000303         030600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1704.2
   000304         030700 01  HYPHEN-LINE.                                                 NC1704.2
   000305         030800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1704.2 IMP
   000306         030900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1704.2
   000307         031000-    "*****************************************".                 NC1704.2
   000308         031100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1704.2
   000309         031200-    "******************************".                            NC1704.2
   000310         031300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1704.2
   000311         031400     "NC170A".                                                    NC1704.2
   000312         031500 PROCEDURE DIVISION.                                              NC1704.2
   000313         031600 CCVS1 SECTION.                                                   NC1704.2
   000314         031700 OPEN-FILES.                                                      NC1704.2
   000315         031800     OPEN     OUTPUT PRINT-FILE.                                  NC1704.2 41
   000316         031900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1704.2 310 251 310 270
   000317         032000     MOVE    SPACE TO TEST-RESULTS.                               NC1704.2 IMP 171
   000318         032100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1704.2 343 348
   000319         032200     GO TO CCVS1-EXIT.                                            NC1704.2 430
   000320         032300 CLOSE-FILES.                                                     NC1704.2
   000321         032400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1704.2 352 373 41
   000322         032500 TERMINATE-CCVS.                                                  NC1704.2
   000323         032600     EXIT PROGRAM.                                                NC1704.2
   000324         032700 TERMINATE-CALL.                                                  NC1704.2
   000325         032800     STOP     RUN.                                                NC1704.2
   000326         032900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1704.2 175 227
   000327         033000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1704.2 175 228
   000328         033100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1704.2 175 226
   000329         033200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1704.2 175 225
   000330         033300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1704.2 182
   000331         033400 PRINT-DETAIL.                                                    NC1704.2
   000332         033500     IF REC-CT NOT EQUAL TO ZERO                                  NC1704.2 224 IMP
   000333      1  033600             MOVE "." TO PARDOT-X                                 NC1704.2 179
   000334      1  033700             MOVE REC-CT TO DOTVALUE.                             NC1704.2 224 180
   000335         033800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1704.2 171 42 385
   000336         033900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1704.2 175 385
   000337      1  034000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1704.2 406 420
   000338      1  034100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1704.2 421 429
   000339         034200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1704.2 IMP 175 IMP 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE SPACE TO CORRECT-X.                                     NC1704.2 IMP 201
   000341         034400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1704.2 224 IMP IMP 177
   000342         034500     MOVE     SPACE TO RE-MARK.                                   NC1704.2 IMP 182
   000343         034600 HEAD-ROUTINE.                                                    NC1704.2
   000344         034700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1704.2 234 43 385
   000345         034800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1704.2 239 43 385
   000346         034900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1704.2 248 43 385
   000347         035000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1704.2 260 43 385
   000348         035100 COLUMN-NAMES-ROUTINE.                                            NC1704.2
   000349         035200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1704.2 212 43 385
   000350         035300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1704.2 217 43 385
   000351         035400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1704.2 304 43 385
   000352         035500 END-ROUTINE.                                                     NC1704.2
   000353         035600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1704.2 304 43 385
   000354         035700 END-RTN-EXIT.                                                    NC1704.2
   000355         035800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1704.2 267 43 385
   000356         035900 END-ROUTINE-1.                                                   NC1704.2
   000357         036000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1704.2 226 230 227
   000358         036100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1704.2 230 225 230
   000359         036200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1704.2 228 230
   000360         036300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1704.2
   000361         036400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1704.2 228 290
   000362         036500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1704.2 230 292
   000363         036600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1704.2 289 275
   000364         036700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1704.2 272 43 385
   000365         036800  END-ROUTINE-12.                                                 NC1704.2
   000366         036900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1704.2 278
   000367         037000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1704.2 226 IMP
   000368      1  037100         MOVE "NO " TO ERROR-TOTAL                                NC1704.2 276
   000369         037200         ELSE                                                     NC1704.2
   000370      1  037300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1704.2 226 276
   000371         037400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1704.2 272 43
   000372         037500     PERFORM WRITE-LINE.                                          NC1704.2 385
   000373         037600 END-ROUTINE-13.                                                  NC1704.2
   000374         037700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1704.2 225 IMP
   000375      1  037800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1704.2 276
   000376      1  037900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1704.2 225 276
   000377         038000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1704.2 278
   000378         038100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1704.2 272 43 385
   000379         038200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1704.2 227 IMP
   000380      1  038300          MOVE "NO " TO ERROR-TOTAL                               NC1704.2 276
   000381      1  038400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1704.2 227 276
   000382         038500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1704.2 278
   000383         038600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1704.2 272 43 385
   000384         038700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1704.2 280 43 385
   000385         038800 WRITE-LINE.                                                      NC1704.2
   000386         038900     ADD 1 TO RECORD-COUNT.                                       NC1704.2 232
   000387         039000     IF RECORD-COUNT GREATER 42                                   NC1704.2 232
   000388      1  039100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1704.2 43 231
   000389      1  039200         MOVE SPACE TO DUMMY-RECORD                               NC1704.2 IMP 43
   000390      1  039300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1704.2 43
   000391      1  039400         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1704.2 234 43 401
   000392      1  039500         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1704.2 239 43 401
   000393      1  039600         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1704.2 248 43 401
   000394      1  039700         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1704.2 260 43 401
   000395      1  039800         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1704.2 212 43 401
   000396      1  039900         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1704.2 217 43 401
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1704.2 304 43 401
   000398      1  040100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1704.2 231 43
   000399      1  040200         MOVE ZERO TO RECORD-COUNT.                               NC1704.2 IMP 232
   000400         040300     PERFORM WRT-LN.                                              NC1704.2 401
   000401         040400 WRT-LN.                                                          NC1704.2
   000402         040500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1704.2 43
   000403         040600     MOVE SPACE TO DUMMY-RECORD.                                  NC1704.2 IMP 43
   000404         040700 BLANK-LINE-PRINT.                                                NC1704.2
   000405         040800     PERFORM WRT-LN.                                              NC1704.2 401
   000406         040900 FAIL-ROUTINE.                                                    NC1704.2
   000407         041000     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1704.2 187 IMP
   000408      1  041100            GO TO FAIL-ROUTINE-WRITE.                             NC1704.2 415
   000409         041200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1704.2 201 IMP 415
   000410         041300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1704.2 233 303
   000411         041400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1704.2 298
   000412         041500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1704.2 295 43 385
   000413         041600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1704.2 IMP 303
   000414         041700     GO TO  FAIL-ROUTINE-EX.                                      NC1704.2 420
   000415         041800 FAIL-ROUTINE-WRITE.                                              NC1704.2
   000416         041900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1704.2 183 42 385
   000417         042000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1704.2 233 211
   000418         042100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1704.2 198 42 385
   000419         042200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1704.2 IMP 211
   000420         042300 FAIL-ROUTINE-EX. EXIT.                                           NC1704.2
   000421         042400 BAIL-OUT.                                                        NC1704.2
   000422         042500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1704.2 188 IMP 424
   000423         042600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1704.2 202 IMP 429
   000424         042700 BAIL-OUT-WRITE.                                                  NC1704.2
   000425         042800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1704.2 202 302 188 300
   000426         042900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1704.2 233 303
   000427         043000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1704.2 295 43 385
   000428         043100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1704.2 IMP 303
   000429         043200 BAIL-OUT-EX. EXIT.                                               NC1704.2
   000430         043300 CCVS1-EXIT.                                                      NC1704.2
   000431         043400     EXIT.                                                        NC1704.2
   000432         043500 SECT-NC170A-001 SECTION.                                         NC1704.2
   000433         043600                                                                  NC1704.2
   000434         043700 MPY-INIT-F2-1.                                                   NC1704.2
   000435         043800     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000436         043900     MOVE   "MULTIPLY BY GIVING" TO FEATURE.                      NC1704.2 173
   000437         044000     MOVE    80.12 TO MULT1.                                      NC1704.2 143
   000438         044100     MOVE    ZERO  TO MULT2.                                      NC1704.2 IMP 145
   000439         044200 MPY-TEST-F2-1-0.                                                 NC1704.2
   000440         044300     MULTIPLY MULT1 BY 4.3 GIVING MULT2.                          NC1704.2 143 145
   000441         044400 MPY-TEST-F2-1-1.                                                 NC1704.2
   000442         044500     IF      MULT2 NOT EQUAL TO 344.516                           NC1704.2 145
   000443      1  044600             GO TO MPY-FAIL-F2-1-1.                               NC1704.2 449
   000444         044700     PERFORM PASS                                                 NC1704.2 327
   000445         044800              GO TO MPY-WRITE-F2-1-1.                             NC1704.2 453
   000446         044900 MPY-DELETE-F2-1-1.                                               NC1704.2
   000447         045000     PERFORM  DE-LETE.                                            NC1704.2 329
   000448         045100     GO TO    MPY-WRITE-F2-1-1.                                   NC1704.2 453
   000449         045200 MPY-FAIL-F2-1-1.                                                 NC1704.2
   000450         045300     PERFORM  FAIL.                                               NC1704.2 328
   000451         045400     MOVE     MULT2  TO COMPUTED-N.                               NC1704.2 145 189
   000452         045500     MOVE    +344.516 TO CORRECT-N.                               NC1704.2 203
   000453         045600 MPY-WRITE-F2-1-1.                                                NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE "MPY-TEST-F2-1-1" TO PAR-NAME.                          NC1704.2 177
   000455         045800     PERFORM  PRINT-DETAIL.                                       NC1704.2 331
   000456         045900                                                                  NC1704.2
   000457         046000 MPY-INIT-F2-2.                                                   NC1704.2
   000458         046100     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000459         046200     MOVE    80.12 TO MULT1.                                      NC1704.2 143
   000460         046300     MOVE    ZERO  TO MULT3.                                      NC1704.2 IMP 146
   000461         046400 MPY-TEST-F2-2-0.                                                 NC1704.2
   000462         046500     MULTIPLY .9 BY MULT1 GIVING MULT3 ROUNDED.                   NC1704.2 143 146
   000463         046600 MPY-TEST-F2-2-1.                                                 NC1704.2
   000464         046700     IF       MULT3 NOT EQUAL TO " $72.11"                        NC1704.2 146
   000465      1  046800              GO TO MPY-FAIL-F2-2-1.                              NC1704.2 471
   000466         046900     PERFORM  PASS.                                               NC1704.2 327
   000467         047000     GO TO    MPY-WRITE-F2-2-1.                                   NC1704.2 475
   000468         047100 MPY-DELETE-F2-2-1.                                               NC1704.2
   000469         047200     PERFORM  DE-LETE.                                            NC1704.2 329
   000470         047300     GO TO    MPY-WRITE-F2-2-1.                                   NC1704.2 475
   000471         047400 MPY-FAIL-F2-2-1.                                                 NC1704.2
   000472         047500     PERFORM  FAIL.                                               NC1704.2 328
   000473         047600     MOVE     MULT3 TO COMPUTED-A.                                NC1704.2 146 188
   000474         047700     MOVE " $72.11" TO CORRECT-A.                                 NC1704.2 202
   000475         047800 MPY-WRITE-F2-2-1.                                                NC1704.2
   000476         047900     MOVE "MPY-TEST-F2-2-1" TO PAR-NAME.                          NC1704.2 177
   000477         048000     PERFORM  PRINT-DETAIL.                                       NC1704.2 331
   000478         048100                                                                  NC1704.2
   000479         048200 MPY-INIT-F2-3.                                                   NC1704.2
   000480         048300     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000481         048400     MOVE    80.12 TO MULT1.                                      NC1704.2 143
   000482         048500     MOVE   -56    TO MULT4.                                      NC1704.2 147
   000483         048600     MOVE    4     TO MULT5.                                      NC1704.2 149
   000484         048700     MOVE   "A"    TO XRAY.                                       NC1704.2 86
   000485         048800 MPY-TEST-F2-3-0.                                                 NC1704.2
   000486         048900     MULTIPLY MULT4 BY MULT1 GIVING MULT5 ON SIZE ERROR           NC1704.2 147 143 149
   000487      1  049000              MOVE "H" TO XRAY.                                   NC1704.2 86
   000488         049100 MPY-TEST-F2-3-1.                                                 NC1704.2
   000489         049200     IF       XRAY EQUAL TO "H"                                   NC1704.2 86
   000490      1  049300              PERFORM PASS                                        NC1704.2 327
   000491         049400     ELSE                                                         NC1704.2
   000492      1  049500              GO TO MPY-FAIL-F2-3-1.                              NC1704.2 497
   000493         049600     GO TO    MPY-WRITE-F2-3-1.                                   NC1704.2 502
   000494         049700 MPY-DELETE-F2-3-1.                                               NC1704.2
   000495         049800     PERFORM  DE-LETE.                                            NC1704.2 329
   000496         049900     GO TO    MPY-WRITE-F2-3-1.                                   NC1704.2 502
   000497         050000 MPY-FAIL-F2-3-1.                                                 NC1704.2
   000498         050100     MOVE     XRAY  TO COMPUTED-X.                                NC1704.2 86 187
   000499         050200     MOVE    "H"    TO CORRECT-X.                                 NC1704.2 201
   000500         050300     MOVE    "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.             NC1704.2 182
   000501         050400     PERFORM  FAIL.                                               NC1704.2 328
   000502         050500 MPY-WRITE-F2-3-1.                                                NC1704.2
   000503         050600     MOVE "MPY-TEST-F2-3-1 " TO PAR-NAME.                         NC1704.2 177
   000504         050700     PERFORM  PRINT-DETAIL.                                       NC1704.2 331
   000505         050800 MPY-TEST-F2-3-2.                                                 NC1704.2
   000506         050900     IF       MULT5 NOT EQUAL TO 4                                NC1704.2 149
   000507      1  051000              GO TO MPY-FAIL-F2-3-2.                              NC1704.2 513
   000508         051100     PERFORM  PASS.                                               NC1704.2 327
   000509         051200     GO TO    MPY-WRITE-F2-3-2.                                   NC1704.2 518
   000510         051300 MPY-DELETE-F2-3-2.                                               NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     PERFORM  DE-LETE.                                            NC1704.2 329
   000512         051500     GO TO    MPY-WRITE-F2-3-2.                                   NC1704.2 518
   000513         051600 MPY-FAIL-F2-3-2.                                                 NC1704.2
   000514         051700     PERFORM  FAIL.                                               NC1704.2 328
   000515         051800     MOVE     MULT5 TO COMPUTED-N.                                NC1704.2 149 189
   000516         051900     MOVE    +4 TO CORRECT-N.                                     NC1704.2 203
   000517         052000     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1704.2 182
   000518         052100 MPY-WRITE-F2-3-2.                                                NC1704.2
   000519         052200     MOVE "MPY-TEST-F2-3-2 " TO PAR-NAME.                         NC1704.2 177
   000520         052300     PERFORM  PRINT-DETAIL.                                       NC1704.2 331
   000521         052400                                                                  NC1704.2
   000522         052500 MPY-INIT-F2-4.                                                   NC1704.2
   000523         052600     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000524         052700     MOVE    80.12 TO MULT1.                                      NC1704.2 143
   000525         052800     MOVE   "A"    TO XRAY.                                       NC1704.2 86
   000526         052900     MOVE    4     TO MULT5.                                      NC1704.2 149
   000527         053000 MPY-TEST-F2-4-0.                                                 NC1704.2
   000528         053100     MULTIPLY 3.3 BY -3 GIVING MULT5 ROUNDED ON SIZE ERROR        NC1704.2 149
   000529      1  053200              MOVE "J" TO XRAY.                                   NC1704.2 86
   000530         053300 MPY-TEST-F2-4-1.                                                 NC1704.2
   000531         053400     IF       XRAY NOT EQUAL TO "J"                               NC1704.2 86
   000532      1  053500              GO TO MPY-FAIL-F2-4-1                               NC1704.2 539
   000533         053600     ELSE                                                         NC1704.2
   000534      1  053700              PERFORM PASS.                                       NC1704.2 327
   000535         053800     GO TO    MPY-WRITE-F2-4-1.                                   NC1704.2 544
   000536         053900 MPY-DELETE-F2-4-1.                                               NC1704.2
   000537         054000     PERFORM  DE-LETE.                                            NC1704.2 329
   000538         054100     GO TO    MPY-WRITE-F2-4-1.                                   NC1704.2 544
   000539         054200 MPY-FAIL-F2-4-1.                                                 NC1704.2
   000540         054300     MOVE     XRAY  TO COMPUTED-X.                                NC1704.2 86 187
   000541         054400     MOVE    "J"    TO CORRECT-X.                                 NC1704.2 201
   000542         054500     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1704.2 182
   000543         054600     PERFORM  FAIL.                                               NC1704.2 328
   000544         054700 MPY-WRITE-F2-4-1.                                                NC1704.2
   000545         054800     MOVE "MPY-TEST-F2-4-1 " TO PAR-NAME.                         NC1704.2 177
   000546         054900     PERFORM  PRINT-DETAIL.                                       NC1704.2 331
   000547         055000 MPY-TEST-F2-4-2.                                                 NC1704.2
   000548         055100     IF       MULT5 EQUAL TO 4                                    NC1704.2 149
   000549      1  055200              PERFORM PASS                                        NC1704.2 327
   000550         055300     ELSE                                                         NC1704.2
   000551      1  055400              GO TO MPY-FAIL-F2-4-2.                              NC1704.2 556
   000552         055500     GO TO    MPY-WRITE-F2-4-2.                                   NC1704.2 562
   000553         055600 MPY-DELETE-F2-4-2.                                               NC1704.2
   000554         055700     PERFORM  DE-LETE.                                            NC1704.2 329
   000555         055800     GO TO    MPY-WRITE-F2-4-2.                                   NC1704.2 562
   000556         055900 MPY-FAIL-F2-4-2.                                                 NC1704.2
   000557         056000     PERFORM  FAIL.                                               NC1704.2 328
   000558         056100     MOVE     MULT5 TO COMPUTED-N.                                NC1704.2 149 189
   000559         056200     MOVE     +4 TO CORRECT-N.                                    NC1704.2 203
   000560         056300     MOVE     4 TO MULT5.                                         NC1704.2 149
   000561         056400     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1704.2 182
   000562         056500 MPY-WRITE-F2-4-2.                                                NC1704.2
   000563         056600     MOVE    "MPY-TEST-F2-4-2 " TO PAR-NAME.                      NC1704.2 177
   000564         056700     PERFORM  PRINT-DETAIL.                                       NC1704.2 331
   000565         056800                                                                  NC1704.2
   000566         056900 MPY-INIT-F2-5.                                                   NC1704.2
   000567         057000     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE    ZERO TO WRK-DS-09V09.                                NC1704.2 IMP 58
   000569         057200 MPY-TEST-F2-5-0.                                                 NC1704.2
   000570         057300     MULTIPLY A06THREES-DS-03V03 BY A12THREES-DS-06V06            NC1704.2 46 54
   000571         057400         GIVING WRK-DS-09V09.                                     NC1704.2 58
   000572         057500 MPY-TEST-F2-5-1.                                                 NC1704.2
   000573         057600     IF WRK-DS-18V00-S EQUAL TO 111110999999888889                NC1704.2 59
   000574      1  057700         PERFORM PASS                                             NC1704.2 327
   000575      1  057800         GO TO MPY-WRITE-F2-5.                                    NC1704.2 584
   000576         057900     GO TO MPY-FAIL-F2-5.                                         NC1704.2 580
   000577         058000 MPY-DELETE-F2-5.                                                 NC1704.2
   000578         058100     PERFORM DE-LETE.                                             NC1704.2 329
   000579         058200     GO TO MPY-WRITE-F2-5.                                        NC1704.2 584
   000580         058300 MPY-FAIL-F2-5.                                                   NC1704.2
   000581         058400     MOVE  111110999999888889 TO CORRECT-18V0.                    NC1704.2 208
   000582         058500     MOVE  WRK-DS-18V00-S     TO COMPUTED-18V0.                   NC1704.2 59 195
   000583         058600     PERFORM FAIL.                                                NC1704.2 328
   000584         058700 MPY-WRITE-F2-5.                                                  NC1704.2
   000585         058800     MOVE "MPY-TEST-F2-5         " TO PAR-NAME.                   NC1704.2 177
   000586         058900     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000587         059000                                                                  NC1704.2
   000588         059100 MPY-INIT-F2-6.                                                   NC1704.2
   000589         059200     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000590         059300     MOVE    ZERO TO WRK-DS-10V00.                                NC1704.2 IMP 50
   000591         059400 MPY-TEST-F2-6-0.                                                 NC1704.2
   000592         059500     MULTIPLY A06THREES-DS-03V03 BY A06THREES-DS-03V03            NC1704.2 46 46
   000593         059600         GIVING WRK-DS-10V00 ROUNDED.                             NC1704.2 50
   000594         059700 MPY-TEST-F2-6.                                                   NC1704.2
   000595         059800     IF WRK-DS-10V00 EQUAL TO 0000111111                          NC1704.2 50
   000596      1  059900         PERFORM PASS                                             NC1704.2 327
   000597      1  060000         GO TO MPY-WRITE-F2-6.                                    NC1704.2 606
   000598         060100     GO TO MPY-FAIL-F2-6.                                         NC1704.2 602
   000599         060200 MPY-DELETE-F2-6.                                                 NC1704.2
   000600         060300     PERFORM DE-LETE.                                             NC1704.2 329
   000601         060400     GO TO MPY-WRITE-F2-6.                                        NC1704.2 606
   000602         060500 MPY-FAIL-F2-6.                                                   NC1704.2
   000603         060600     MOVE  0000111111         TO CORRECT-18V0.                    NC1704.2 208
   000604         060700     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1704.2 50 195
   000605         060800     PERFORM FAIL.                                                NC1704.2 328
   000606         060900 MPY-WRITE-F2-6.                                                  NC1704.2
   000607         061000     MOVE "MPY-TEST-F2-6         " TO PAR-NAME.                   NC1704.2 177
   000608         061100     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000609         061200                                                                  NC1704.2
   000610         061300 MPY-INIT-F2-7.                                                   NC1704.2
   000611         061400     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000612         061500     MOVE   "0"   TO WRK-XN-00001.                                NC1704.2 51
   000613         061600     MOVE    ZERO TO WRK-DS-10V00.                                NC1704.2 IMP 50
   000614         061700 MPY-TEST-F2-7-0.                                                 NC1704.2
   000615         061800     MULTIPLY A05ONES-DS-00V05 BY A12ONES-DS-12V00                NC1704.2 60 61
   000616         061900       GIVING WRK-DS-10V00                                        NC1704.2 50
   000617         062000           ON SIZE ERROR                                          NC1704.2
   000618      1  062100              MOVE "1" TO WRK-XN-00001.                           NC1704.2 51
   000619         062200 MPY-TEST-F2-7-1.                                                 NC1704.2
   000620         062300     IF WRK-DS-10V00 EQUAL TO 0000000000                          NC1704.2 50
   000621      1  062400         PERFORM PASS                                             NC1704.2 327
   000622      1  062500         GO TO MPY-WRITE-F2-7-1.                                  NC1704.2 632
   000623         062600     GO TO MPY-FAIL-F2-7-1.                                       NC1704.2 627
   000624         062700 MPY-DELETE-F2-7-1.                                               NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     PERFORM DE-LETE.                                             NC1704.2 329
   000626         062900     GO TO MPY-WRITE-F2-7-1.                                      NC1704.2 632
   000627         063000 MPY-FAIL-F2-7-1.                                                 NC1704.2
   000628         063100     MOVE  0000000000         TO CORRECT-18V0.                    NC1704.2 208
   000629         063200     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1704.2 50 195
   000630         063300     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1704.2 182
   000631         063400     PERFORM FAIL.                                                NC1704.2 328
   000632         063500 MPY-WRITE-F2-7-1.                                                NC1704.2
   000633         063600     MOVE "MPY-TEST-F2-7-1         " TO PAR-NAME.                 NC1704.2 177
   000634         063700     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000635         063800 MPY-TEST-F2-7-2.                                                 NC1704.2
   000636         063900     IF      WRK-XN-00001 EQUAL TO "1"                            NC1704.2 51
   000637      1  064000             PERFORM PASS                                         NC1704.2 327
   000638      1  064100             GO TO MPY-WRITE-F2-7-2.                              NC1704.2 646
   000639         064200     MOVE "1" TO CORRECT-A.                                       NC1704.2 202
   000640         064300     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1704.2 51 188
   000641         064400     MOVE    "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.             NC1704.2 182
   000642         064500     PERFORM FAIL.                                                NC1704.2 328
   000643         064600     GO TO MPY-WRITE-F2-7-2.                                      NC1704.2 646
   000644         064700 MPY-DELETE-F2-7-2.                                               NC1704.2
   000645         064800     PERFORM DE-LETE.                                             NC1704.2 329
   000646         064900 MPY-WRITE-F2-7-2.                                                NC1704.2
   000647         065000     MOVE "MPY-TEST-F2-7-2         " TO PAR-NAME.                 NC1704.2 177
   000648         065100     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000649         065200                                                                  NC1704.2
   000650         065300 MPY-INIT-F2-8.                                                   NC1704.2
   000651         065400     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000652         065500     MOVE   "1"   TO WRK-XN-00001.                                NC1704.2 51
   000653         065600     MOVE    ZERO TO WRK-DS-10V00.                                NC1704.2 IMP 50
   000654         065700 MPY-TEST-F2-8-0.                                                 NC1704.2
   000655         065800     MULTIPLY A01ONE-DS-P0801 BY A12ONES-DS-12V00                 NC1704.2 63 61
   000656         065900         GIVING WRK-DS-10V00 ON SIZE ERROR                        NC1704.2 50
   000657      1  066000         MOVE "0" TO WRK-XN-00001.                                NC1704.2 51
   000658         066100 MPY-TEST-F2-8-1.                                                 NC1704.2
   000659         066200     IF WRK-DS-10V00 EQUAL TO 0000000111                          NC1704.2 50
   000660      1  066300         PERFORM PASS                                             NC1704.2 327
   000661      1  066400         GO TO MPY-WRITE-F2-8-1.                                  NC1704.2 670
   000662         066500     GO TO MPY-FAIL-F2-8-1.                                       NC1704.2 666
   000663         066600 MPY-DELETE-F2-8-1.                                               NC1704.2
   000664         066700     PERFORM DE-LETE.                                             NC1704.2 329
   000665         066800     GO TO MPY-WRITE-F2-8-1.                                      NC1704.2 670
   000666         066900 MPY-FAIL-F2-8-1.                                                 NC1704.2
   000667         067000     MOVE  0000000111         TO CORRECT-18V0.                    NC1704.2 208
   000668         067100     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1704.2 50 195
   000669         067200     PERFORM FAIL.                                                NC1704.2 328
   000670         067300 MPY-WRITE-F2-8-1.                                                NC1704.2
   000671         067400     MOVE "MPY-TEST-F2-8-1         " TO PAR-NAME.                 NC1704.2 177
   000672         067500     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000673         067600 MPY-TEST-F2-8-2.                                                 NC1704.2
   000674         067700     IF WRK-XN-00001 EQUAL TO "1"                                 NC1704.2 51
   000675      1  067800         PERFORM PASS                                             NC1704.2 327
   000676      1  067900         GO TO MPY-WRITE-F2-8-2.                                  NC1704.2 684
   000677         068000     MOVE    "1"           TO CORRECT-A.                          NC1704.2 202
   000678         068100     MOVE     WRK-XN-00001 TO COMPUTED-A.                         NC1704.2 51 188
   000679         068200     MOVE    "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.   NC1704.2 182
   000680         068300     PERFORM FAIL.                                                NC1704.2 328
   000681         068400     GO TO MPY-WRITE-F2-8-2.                                      NC1704.2 684
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500 MPY-DELETE-F2-8-2.                                               NC1704.2
   000683         068600     PERFORM DE-LETE.                                             NC1704.2 329
   000684         068700 MPY-WRITE-F2-8-2.                                                NC1704.2
   000685         068800     MOVE "MPY-TEST-F2-8-2         " TO PAR-NAME.                 NC1704.2 177
   000686         068900     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000687         069000                                                                  NC1704.2
   000688         069100 MPY-INIT-F2-9.                                                   NC1704.2
   000689         069200     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000690         069300     MOVE   "0"   TO WRK-XN-00001.                                NC1704.2 51
   000691         069400     MOVE    ZERO TO WRK-DS-10V00.                                NC1704.2 IMP 50
   000692         069500 MPY-TEST-F2-9-0.                                                 NC1704.2
   000693         069600     MULTIPLY 9.5 BY A10ONES-DS-10V00                             NC1704.2 52
   000694         069700         GIVING WRK-DS-10V00 ROUNDED ON SIZE ERROR                NC1704.2 50
   000695      1  069800         MOVE "1" TO WRK-XN-00001.                                NC1704.2 51
   000696         069900 MPY-TEST-F2-9-1.                                                 NC1704.2
   000697         070000     IF WRK-DS-10V00 EQUAL TO 0000000000                          NC1704.2 50
   000698      1  070100         PERFORM PASS                                             NC1704.2 327
   000699      1  070200         GO TO MPY-WRITE-F2-9-1.                                  NC1704.2 707
   000700         070300     MOVE  0000000000         TO CORRECT-18V0.                    NC1704.2 208
   000701         070400     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1704.2 50 195
   000702         070500     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1704.2 182
   000703         070600     PERFORM FAIL.                                                NC1704.2 328
   000704         070700     GO TO MPY-WRITE-F2-9-1.                                      NC1704.2 707
   000705         070800 MPY-DELETE-F2-9-1.                                               NC1704.2
   000706         070900     PERFORM DE-LETE.                                             NC1704.2 329
   000707         071000 MPY-WRITE-F2-9-1.                                                NC1704.2
   000708         071100     MOVE   "MPY-TEST-F2-9-1       " TO PAR-NAME.                 NC1704.2 177
   000709         071200     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000710         071300 MPY-TEST-F2-9-2.                                                 NC1704.2
   000711         071400     IF      WRK-XN-00001 EQUAL TO "1"                            NC1704.2 51
   000712      1  071500             PERFORM PASS                                         NC1704.2 327
   000713      1  071600             GO TO MPY-WRITE-F2-9-2.                              NC1704.2 722
   000714         071700 MPY-FAIL-F2-9-2.                                                 NC1704.2
   000715         071800     MOVE   "1" TO CORRECT-A.                                     NC1704.2 202
   000716         071900     MOVE    WRK-XN-00001 TO COMPUTED-A.                          NC1704.2 51 188
   000717         072000     MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.              NC1704.2 182
   000718         072100     PERFORM FAIL.                                                NC1704.2 328
   000719         072200     GO TO   MPY-WRITE-F2-9-2.                                    NC1704.2 722
   000720         072300 MPY-DELETE-F2-9-2.                                               NC1704.2
   000721         072400     PERFORM DE-LETE.                                             NC1704.2 329
   000722         072500 MPY-WRITE-F2-9-2.                                                NC1704.2
   000723         072600     MOVE   "MPY-TEST-F2-9-2       " TO PAR-NAME.                 NC1704.2 177
   000724         072700     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000725         072800                                                                  NC1704.2
   000726         072900 MPY-INIT-F2-10-1.                                                NC1704.2
   000727         073000     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000728         073100     MOVE   "1"  TO WRK-XN-00001.                                 NC1704.2 51
   000729         073200     MOVE   ZERO TO WRK-DS-09V08.                                 NC1704.2 IMP 64
   000730         073300 MPY-TEST-F2-10-0.                                                NC1704.2
   000731         073400     MULTIPLY A01ONE-DS-P0801 BY A18ONES-DS-18V00                 NC1704.2 63 66
   000732         073500         GIVING WRK-DS-09V08 ROUNDED ON SIZE ERROR                NC1704.2 64
   000733      1  073600         MOVE "0" TO WRK-XN-00001.                                NC1704.2 51
   000734         073700 MPY-TEST-F2-10-1.                                                NC1704.2
   000735         073800     IF WRK-DS-17V00-S EQUAL TO 11111111111111111                 NC1704.2 65
   000736      1  073900         PERFORM PASS                                             NC1704.2 327
   000737      1  074000         GO TO MPY-WRITE-F2-10-1.                                 NC1704.2 744
   000738         074100     MOVE  11111111111111111  TO CORRECT-18V0.                    NC1704.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     MOVE  WRK-DS-17V00-S     TO COMPUTED-18V0.                   NC1704.2 65 195
   000740         074300     PERFORM FAIL.                                                NC1704.2 328
   000741         074400     GO TO MPY-WRITE-F2-10-1.                                     NC1704.2 744
   000742         074500 MPY-DELETE-F2-10-1.                                              NC1704.2
   000743         074600     PERFORM DE-LETE.                                             NC1704.2 329
   000744         074700 MPY-WRITE-F2-10-1.                                               NC1704.2
   000745         074800     MOVE   "MPY-TEST-F2-10-1       " TO PAR-NAME.                NC1704.2 177
   000746         074900     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000747         075000 MPY-TEST-F2-10-2.                                                NC1704.2
   000748         075100     IF      WRK-XN-00001 EQUAL TO "1"                            NC1704.2 51
   000749      1  075200             PERFORM PASS                                         NC1704.2 327
   000750      1  075300             GO TO MPY-WRITE-F2-10-2.                             NC1704.2 758
   000751         075400     MOVE   "1" TO CORRECT-A.                                     NC1704.2 202
   000752         075500     MOVE    WRK-XN-00001 TO COMPUTED-A.                          NC1704.2 51 188
   000753         075600     MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.    NC1704.2 182
   000754         075700     PERFORM FAIL.                                                NC1704.2 328
   000755         075800     GO TO   MPY-WRITE-F2-10-2.                                   NC1704.2 758
   000756         075900 MPY-DELETE-F2-10-2.                                              NC1704.2
   000757         076000     PERFORM DE-LETE.                                             NC1704.2 329
   000758         076100 MPY-WRITE-F2-10-2.                                               NC1704.2
   000759         076200     MOVE   "MPY-TEST-F2-10-2       " TO PAR-NAME.                NC1704.2 177
   000760         076300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000761         076400                                                                  NC1704.2
   000762         076500 MPY-INIT-F2-11.                                                  NC1704.2
   000763         076600     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000764         076700     MOVE    ZERO TO WRK-CS-02V02.                                NC1704.2 IMP 84
   000765         076800 MPY-TEST-F2-11-0.                                                NC1704.2
   000766         076900     MULTIPLY A99-CS-02V00 BY A01ONE-CS-00V01 GIVING WRK-CS-02V02.NC1704.2 71 73 84
   000767         077000 MPY-TEST-F2-11-1.                                                NC1704.2
   000768         077100     MOVE    WRK-CS-02V02 TO WRK-DS-06V06.                        NC1704.2 84 47
   000769         077200     IF      WRK-DS-12V00-S EQUAL TO 000009900000                 NC1704.2 48
   000770      1  077300             PERFORM PASS                                         NC1704.2 327
   000771      1  077400             GO TO   MPY-WRITE-F2-11.                             NC1704.2 778
   000772         077500     MOVE    000009900000     TO CORRECT-18V0.                    NC1704.2 208
   000773         077600     MOVE    WRK-DS-12V00-S   TO COMPUTED-18V0.                   NC1704.2 48 195
   000774         077700     PERFORM FAIL.                                                NC1704.2 328
   000775         077800     GO TO   MPY-WRITE-F2-11.                                     NC1704.2 778
   000776         077900 MPY-DELETE-F2-11.                                                NC1704.2
   000777         078000     PERFORM DE-LETE.                                             NC1704.2 329
   000778         078100 MPY-WRITE-F2-11.                                                 NC1704.2
   000779         078200     MOVE   "MPY-TEST-F2-11       " TO PAR-NAME.                  NC1704.2 177
   000780         078300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000781         078400                                                                  NC1704.2
   000782         078500 MPY-INIT-F2-12.                                                  NC1704.2
   000783         078600     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000784         078700     MOVE    ZERO TO WRK-CS-18V00.                                NC1704.2 IMP 69
   000785         078800 MPY-TEST-F2-12-0.                                                NC1704.2
   000786         078900     MULTIPLY A01ONES-CS-18V00 BY A02THREES-CS-18V00              NC1704.2 132 134
   000787         079000             GIVING WRK-CS-18V00.                                 NC1704.2 69
   000788         079100 MPY-TEST-F2-12-1.                                                NC1704.2
   000789         079200     IF WRK-CS-18V00 EQUAL TO -000000000000000033                 NC1704.2 69
   000790      1  079300         PERFORM PASS                                             NC1704.2 327
   000791      1  079400         GO TO MPY-WRITE-F2-12.                                   NC1704.2 798
   000792         079500     MOVE -000000000000000033 TO CORRECT-18V0.                    NC1704.2 208
   000793         079600     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1704.2 69 195
   000794         079700     PERFORM FAIL.                                                NC1704.2 328
   000795         079800     GO TO MPY-WRITE-F2-12.                                       NC1704.2 798
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900 MPY-DELETE-F2-12.                                                NC1704.2
   000797         080000     PERFORM DE-LETE.                                             NC1704.2 329
   000798         080100 MPY-WRITE-F2-12.                                                 NC1704.2
   000799         080200     MOVE "MPY-TEST-F2-12 " TO PAR-NAME.                          NC1704.2 177
   000800         080300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000801         080400                                                                  NC1704.2
   000802         080500 MPY-INIT-F2-13.                                                  NC1704.2
   000803         080600     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000804         080700     MOVE    ZERO TO WRK-DU-18V00.                                NC1704.2 IMP 70
   000805         080800 MPY-TEST-F2-13-0.                                                NC1704.2
   000806         080900     MULTIPLY A02THREES-CS-18V00 BY A14TWOS-CU-18V00              NC1704.2 134 140
   000807         081000             GIVING WRK-DU-18V00.                                 NC1704.2 70
   000808         081100 MPY-TEST-F2-13.                                                  NC1704.2
   000809         081200     IF WRK-DU-18V00 EQUAL TO 000733333333333326                  NC1704.2 70
   000810      1  081300         PERFORM PASS                                             NC1704.2 327
   000811      1  081400         GO TO MPY-WRITE-F2-13.                                   NC1704.2 818
   000812         081500     MOVE 000733333333333326 TO CORRECT-18V0.                     NC1704.2 208
   000813         081600     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1704.2 70 195
   000814         081700     PERFORM FAIL.                                                NC1704.2 328
   000815         081800     GO TO MPY-WRITE-F2-13.                                       NC1704.2 818
   000816         081900 MPY-DELETE-F2-13.                                                NC1704.2
   000817         082000     PERFORM DE-LETE.                                             NC1704.2 329
   000818         082100 MPY-WRITE-F2-13.                                                 NC1704.2
   000819         082200     MOVE "MPY-TEST-F2-13 " TO PAR-NAME.                          NC1704.2 177
   000820         082300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000821         082400                                                                  NC1704.2
   000822         082500 MPY-INIT-F2-14.                                                  NC1704.2
   000823         082600     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000824         082700     MOVE    ZERO TO WRK-CS-18V00.                                NC1704.2 IMP 69
   000825         082800 MPY-TEST-F2-14-0.                                                NC1704.2
   000826         082900     MULTIPLY A02THREES-CS-18V00 BY A16NINES-CU-18V00             NC1704.2 134 138
   000827         083000             GIVING WRK-CS-18V00.                                 NC1704.2 69
   000828         083100 MPY-TEST-F2-14.                                                  NC1704.2
   000829         083200     IF WRK-CS-18V00 EQUAL TO -329999999999999967                 NC1704.2 69
   000830      1  083300         PERFORM PASS                                             NC1704.2 327
   000831      1  083400         GO TO MPY-WRITE-F2-14.                                   NC1704.2 838
   000832         083500     MOVE -329999999999999967 TO CORRECT-18V0.                    NC1704.2 208
   000833         083600     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1704.2 69 195
   000834         083700     PERFORM FAIL.                                                NC1704.2 328
   000835         083800     GO TO MPY-WRITE-F2-14.                                       NC1704.2 838
   000836         083900 MPY-DELETE-F2-14.                                                NC1704.2
   000837         084000     PERFORM DE-LETE.                                             NC1704.2 329
   000838         084100 MPY-WRITE-F2-14.                                                 NC1704.2
   000839         084200     MOVE "MPY-TEST-F2-14 " TO PAR-NAME.                          NC1704.2 177
   000840         084300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000841         084400                                                                  NC1704.2
   000842         084500 MPY-INIT-F2-15.                                                  NC1704.2
   000843         084600     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   000844         084700     MOVE    ZERO TO WRK-DU-18V00.                                NC1704.2 IMP 70
   000845         084800 MPY-TEST-F2-15-0.                                                NC1704.2
   000846         084900     MULTIPLY A01ONES-CS-18V00 BY A18SIXES-CU-18V00               NC1704.2 132 136
   000847         085000         GIVING WRK-DU-18V00.                                     NC1704.2 70
   000848         085100 MPY-TEST-F2-15.                                                  NC1704.2
   000849         085200     IF WRK-DU-18V00 EQUAL TO 666666666666666666                  NC1704.2 70
   000850      1  085300         PERFORM PASS                                             NC1704.2 327
   000851      1  085400         GO TO MPY-WRITE-F2-15.                                   NC1704.2 858
   000852         085500     MOVE 666666666666666666 TO CORRECT-18V0.                     NC1704.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1704.2 70 195
   000854         085700     PERFORM FAIL.                                                NC1704.2 328
   000855         085800     GO TO MPY-WRITE-F2-15.                                       NC1704.2 858
   000856         085900 MPY-DELETE-F2-15.                                                NC1704.2
   000857         086000     PERFORM DE-LETE.                                             NC1704.2 329
   000858         086100 MPY-WRITE-F2-15.                                                 NC1704.2
   000859         086200     MOVE "MPY-TEST-F2-15 " TO PAR-NAME.                          NC1704.2 177
   000860         086300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000861         086400*                                                                 NC1704.2
   000862         086500*                                                                 NC1704.2
   000863         086600 MPY-INIT-F2-16.                                                  NC1704.2
   000864         086700*    ==-->  NEW SIZE ERROR TESTS    <--==                         NC1704.2
   000865         086800     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   000866         086900     MOVE   "H"  TO XRAY.                                         NC1704.2 86
   000867         087000     MOVE  80.12 TO MULT1.                                        NC1704.2 143
   000868         087100     MOVE   -56  TO MULT4.                                        NC1704.2 147
   000869         087200     MOVE    0   TO MULT5.                                        NC1704.2 149
   000870         087300     MOVE    1   TO REC-CT.                                       NC1704.2 224
   000871         087400 MPY-TEST-F2-16-0.                                                NC1704.2
   000872         087500     MULTIPLY MULT4 BY MULT1 GIVING MULT5                         NC1704.2 147 143 149
   000873      1  087600          NOT ON SIZE ERROR  MOVE "X" TO XRAY.                    NC1704.2 86
   000874         087700 MPY-TEST-F2-16-1.                                                NC1704.2
   000875         087800     GO TO MPY-TEST-F2-16-2.                                      NC1704.2 880
   000876         087900 MPY-DELETE-F2-16-1.                                              NC1704.2
   000877         088000     PERFORM DE-LETE.                                             NC1704.2 329
   000878         088100     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000879         088200     GO TO   MPY-INIT-F2-17.                                      NC1704.2 905
   000880         088300 MPY-TEST-F2-16-2.                                                NC1704.2
   000881         088400     MOVE   "MPY-TEST-F2-16-2 " TO PAR-NAME.                      NC1704.2 177
   000882         088500     IF      XRAY    = "H"                                        NC1704.2 86
   000883      1  088600             PERFORM PASS                                         NC1704.2 327
   000884      1  088700             PERFORM PRINT-DETAIL                                 NC1704.2 331
   000885         088800     ELSE                                                         NC1704.2
   000886      1  088900             MOVE    XRAY  TO COMPUTED-X                          NC1704.2 86 187
   000887      1  089000             MOVE   "H"    TO CORRECT-X                           NC1704.2 201
   000888      1  089100             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   000889      1  089200             PERFORM FAIL                                         NC1704.2 328
   000890      1  089300             PERFORM PRINT-DETAIL.                                NC1704.2 331
   000891         089400     ADD     1 TO REC-CT.                                         NC1704.2 224
   000892         089500 MPY-TEST-F2-16-3.                                                NC1704.2
   000893         089600     MOVE   "MPY-TEST-F2-16-3 " TO PAR-NAME.                      NC1704.2 177
   000894         089700     IF      MULT5 = 0                                            NC1704.2 149
   000895      1  089800             PERFORM PASS                                         NC1704.2 327
   000896      1  089900             PERFORM PRINT-DETAIL                                 NC1704.2 331
   000897         090000     ELSE                                                         NC1704.2
   000898      1  090100             MOVE    MULT5 TO COMPUTED-N                          NC1704.2 149 189
   000899      1  090200             MOVE    0     TO CORRECT-N                           NC1704.2 203
   000900      1  090300             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   000901      1  090400             PERFORM FAIL                                         NC1704.2 328
   000902      1  090500             PERFORM PRINT-DETAIL.                                NC1704.2 331
   000903         090600*                                                                 NC1704.2
   000904         090700*                                                                 NC1704.2
   000905         090800 MPY-INIT-F2-17.                                                  NC1704.2
   000906         090900*    ==-->  NEW SIZE ERROR TESTS    <--==                         NC1704.2
   000907         091000     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   000908         091100     MOVE   "1" TO WRK-XN-00001.                                  NC1704.2 51
   000909         091200     MOVE    ZERO TO WRK-DS-10V00.                                NC1704.2 IMP 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     MOVE    1   TO REC-CT.                                       NC1704.2 224
   000911         091400 MPY-TEST-F2-17-0.                                                NC1704.2
   000912         091500     MULTIPLY A01ONE-DS-P0801 BY A12ONES-DS-12V00                 NC1704.2 63 61
   000913         091600             GIVING WRK-DS-10V00                                  NC1704.2 50
   000914         091700             NOT ON SIZE ERROR                                    NC1704.2
   000915      1  091800               MOVE "0" TO WRK-XN-00001.                          NC1704.2 51
   000916         091900 MPY-TEST-F2-17-1.                                                NC1704.2
   000917         092000     GO TO   MPY-TEST-F2-17-2.                                    NC1704.2 922
   000918         092100 MPY-DELETE-F2-17.                                                NC1704.2
   000919         092200     PERFORM DE-LETE.                                             NC1704.2 329
   000920         092300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000921         092400     GO TO   MPY-INIT-F2-18.                                      NC1704.2 948
   000922         092500 MPY-TEST-F2-17-2.                                                NC1704.2
   000923         092600     MOVE   "MPY-TEST-F2-17-2 " TO PAR-NAME.                      NC1704.2 177
   000924         092700     IF      WRK-XN-00001 = "0"                                   NC1704.2 51
   000925      1  092800             PERFORM PASS                                         NC1704.2 327
   000926      1  092900             PERFORM PRINT-DETAIL                                 NC1704.2 331
   000927         093000     ELSE                                                         NC1704.2
   000928      1  093100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1704.2 51 187
   000929      1  093200             MOVE   "0"           TO CORRECT-X                    NC1704.2 201
   000930      1  093300             MOVE   "NOT ON SIZE ERROR SHOULD HAVE BEEN EXECUTED" NC1704.2
   000931      1  093400                  TO RE-MARK                                      NC1704.2 182
   000932      1  093500             PERFORM FAIL                                         NC1704.2 328
   000933      1  093600             PERFORM PRINT-DETAIL.                                NC1704.2 331
   000934         093700     ADD     1   TO REC-CT.                                       NC1704.2 224
   000935         093800 MPY-TEST-F2-17-3.                                                NC1704.2
   000936         093900     MOVE   "MPY-TEST-F2-17-3 " TO PAR-NAME.                      NC1704.2 177
   000937         094000     IF      WRK-DS-10V00 = 0000000111                            NC1704.2 50
   000938      1  094100             PERFORM PASS                                         NC1704.2 327
   000939      1  094200             PERFORM PRINT-DETAIL                                 NC1704.2 331
   000940         094300     ELSE                                                         NC1704.2
   000941      1  094400             MOVE    0000000111       TO CORRECT-18V0             NC1704.2 208
   000942      1  094500             MOVE    WRK-DS-10V00     TO COMPUTED-18V0            NC1704.2 50 195
   000943      1  094600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1704.2 182
   000944      1  094700             PERFORM FAIL                                         NC1704.2 328
   000945      1  094800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   000946         094900*                                                                 NC1704.2
   000947         095000*                                                                 NC1704.2
   000948         095100 MPY-INIT-F2-18.                                                  NC1704.2
   000949         095200*    ==-->  NEW SIZE ERROR TESTS    <--==                         NC1704.2
   000950         095300     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   000951         095400     MOVE    1   TO REC-CT.                                       NC1704.2 224
   000952         095500     MOVE  80.12 TO MULT1.                                        NC1704.2 143
   000953         095600     MOVE   -56  TO MULT4.                                        NC1704.2 147
   000954         095700     MOVE    0   TO MULT5.                                        NC1704.2 149
   000955         095800     MOVE   "H" TO XRAY.                                          NC1704.2 86
   000956         095900 MPY-TEST-F2-18-0.                                                NC1704.2
   000957         096000     MULTIPLY MULT4 BY MULT1 GIVING MULT5                         NC1704.2 147 143 149
   000958      1  096100              ON SIZE ERROR  MOVE "A" TO XRAY                     NC1704.2 86
   000959      1  096200          NOT ON SIZE ERROR  MOVE "B" TO XRAY.                    NC1704.2 86
   000960         096300 MPY-TEST-F2-18-1.                                                NC1704.2
   000961         096400     GO TO MPY-TEST-F2-18-2.                                      NC1704.2 966
   000962         096500 MPY-DELETE-F2-18.                                                NC1704.2
   000963         096600     PERFORM DE-LETE.                                             NC1704.2 329
   000964         096700     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   000965         096800     GO TO   MPY-INIT-F2-19.                                      NC1704.2 991
   000966         096900 MPY-TEST-F2-18-2.                                                NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     MOVE   "MPY-TEST-F2-18-2 " TO PAR-NAME.                      NC1704.2 177
   000968         097100     IF      XRAY    = "A"                                        NC1704.2 86
   000969      1  097200             PERFORM PASS                                         NC1704.2 327
   000970      1  097300             PERFORM PRINT-DETAIL                                 NC1704.2 331
   000971         097400     ELSE                                                         NC1704.2
   000972      1  097500             MOVE    XRAY  TO COMPUTED-X                          NC1704.2 86 187
   000973      1  097600             MOVE   "A"    TO CORRECT-X                           NC1704.2 201
   000974      1  097700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   000975      1  097800             PERFORM FAIL                                         NC1704.2 328
   000976      1  097900             PERFORM PRINT-DETAIL.                                NC1704.2 331
   000977         098000     ADD     1   TO REC-CT.                                       NC1704.2 224
   000978         098100 MPY-TEST-F2-18-3.                                                NC1704.2
   000979         098200     MOVE   "MPY-TEST-F2-18-3 " TO PAR-NAME.                      NC1704.2 177
   000980         098300     IF      MULT5   = 0                                          NC1704.2 149
   000981      1  098400             PERFORM PASS                                         NC1704.2 327
   000982      1  098500             PERFORM PRINT-DETAIL                                 NC1704.2 331
   000983         098600     ELSE                                                         NC1704.2
   000984      1  098700             MOVE    MULT5 TO COMPUTED-N                          NC1704.2 149 189
   000985      1  098800             MOVE    0     TO CORRECT-N                           NC1704.2 203
   000986      1  098900             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   000987      1  099000             PERFORM FAIL                                         NC1704.2 328
   000988      1  099100             PERFORM PRINT-DETAIL.                                NC1704.2 331
   000989         099200*                                                                 NC1704.2
   000990         099300*                                                                 NC1704.2
   000991         099400 MPY-INIT-F2-19.                                                  NC1704.2
   000992         099500*    ==-->  NEW SIZE ERROR TESTS    <--==                         NC1704.2
   000993         099600     MOVE    1   TO REC-CT.                                       NC1704.2 224
   000994         099700     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   000995         099800     MOVE   "0" TO WRK-XN-00001.                                  NC1704.2 51
   000996         099900     MOVE    ZERO TO WRK-DS-10V00.                                NC1704.2 IMP 50
   000997         100000 MPY-TEST-F2-19-0.                                                NC1704.2
   000998         100100     MULTIPLY A01ONE-DS-P0801 BY A12ONES-DS-12V00                 NC1704.2 63 61
   000999         100200             GIVING WRK-DS-10V00                                  NC1704.2 50
   001000      1  100300                 ON SIZE ERROR MOVE "1" TO WRK-XN-00001           NC1704.2 51
   001001      1  100400             NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001.          NC1704.2 51
   001002         100500 MPY-TEST-F2-19-1.                                                NC1704.2
   001003         100600     GO TO   MPY-TEST-F2-19-2.                                    NC1704.2 1008
   001004         100700 MPY-DELETE-F2-19.                                                NC1704.2
   001005         100800     PERFORM DE-LETE.                                             NC1704.2 329
   001006         100900     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001007         101000     GO TO   MPY-INIT-F2-20.                                      NC1704.2 1034
   001008         101100 MPY-TEST-F2-19-2.                                                NC1704.2
   001009         101200     MOVE   "MPY-TEST-F2-19-2" TO PAR-NAME.                       NC1704.2 177
   001010         101300     IF      WRK-XN-00001 = "2"                                   NC1704.2 51
   001011      1  101400             PERFORM PASS                                         NC1704.2 327
   001012      1  101500             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001013         101600     ELSE                                                         NC1704.2
   001014      1  101700             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1704.2 51 187
   001015      1  101800             MOVE   "2"          TO CORRECT-X                     NC1704.2 201
   001016      1  101900             MOVE   "NOT ON SIZE ERROR SHOULD HAVE BEEN EXECUTED" NC1704.2
   001017      1  102000                  TO RE-MARK                                      NC1704.2 182
   001018      1  102100             PERFORM FAIL                                         NC1704.2 328
   001019      1  102200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001020         102300     ADD     1   TO REC-CT.                                       NC1704.2 224
   001021         102400 MPY-TEST-F2-19-3.                                                NC1704.2
   001022         102500     MOVE   "MPY-TEST-F2-19-3 " TO PAR-NAME.                      NC1704.2 177
   001023         102600     IF      WRK-DS-10V00 = 0000000111                            NC1704.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102700             PERFORM PASS                                         NC1704.2 327
   001025      1  102800             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001026         102900     ELSE                                                         NC1704.2
   001027      1  103000             MOVE    0000000111       TO CORRECT-18V0             NC1704.2 208
   001028      1  103100             MOVE    WRK-DS-10V00     TO COMPUTED-18V0            NC1704.2 50 195
   001029      1  103200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1704.2 182
   001030      1  103300             PERFORM FAIL                                         NC1704.2 328
   001031      1  103400             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001032         103500*                                                                 NC1704.2
   001033         103600*                                                                 NC1704.2
   001034         103700 MPY-INIT-F2-20.                                                  NC1704.2
   001035         103800*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1704.2
   001036         103900     MOVE   "V1-107 6.19.4 GR2" TO ANSI-REFERENCE.                NC1704.2 233
   001037         104000     MOVE   "MPY-TEST-F2-20" TO PAR-NAME.                         NC1704.2 177
   001038         104100     MOVE    999999 TO WRK-DU-6V0-1.                              NC1704.2 115
   001039         104200     MOVE    .00001 TO WRK-DU-4P1-1.                              NC1704.2 113
   001040         104300     MOVE    0      TO WRK-DU-2V0-1.                              NC1704.2 101
   001041         104400     MOVE    0      TO WRK-DU-2V0-2.                              NC1704.2 102
   001042         104500     MOVE    0      TO WRK-DU-2V5-1.                              NC1704.2 112
   001043         104600     MOVE    0      TO WRK-NE-2.                                  NC1704.2 129
   001044         104700     MOVE    0      TO WRK-NE-3.                                  NC1704.2 130
   001045         104800     MOVE    1 TO REC-CT.                                         NC1704.2 224
   001046         104900 MPY-TEST-F2-20-0.                                                NC1704.2
   001047         105000     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-6V0-1 GIVING WRK-DU-2V0-1    NC1704.2 113 115 101
   001048         105100         WRK-DU-2V0-2 ROUNDED WRK-DU-2V5-1 WRK-NE-2 ROUNDED       NC1704.2 102 112 129
   001049         105200         WRK-NE-3.                                                NC1704.2 130
   001050         105300     GO TO MPY-TEST-F2-20-1.                                      NC1704.2 1054
   001051         105400 MPY-DELETE-F2-20.                                                NC1704.2
   001052         105500     PERFORM DE-LETE.                                             NC1704.2 329
   001053         105600     GO TO MPY-INIT-F2-21.                                        NC1704.2 1085
   001054         105700 MPY-TEST-F2-20-1.                                                NC1704.2
   001055         105800     IF WRK-DU-2V0-1  = 9 PERFORM PASS PERFORM PRINT-DETAIL       NC1704.2 101 327 331
   001056         105900     ELSE                                                         NC1704.2
   001057      1  106000     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 9 TO       NC1704.2 328 101 189
   001058      1  106100     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001059         106200     ADD 1 TO REC-CT.                                             NC1704.2 224
   001060         106300 MPY-TEST-F2-20-2.                                                NC1704.2
   001061         106400     IF WRK-DU-2V0-2 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1704.2 102 327 331
   001062         106500     ELSE                                                         NC1704.2
   001063      1  106600     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 10         NC1704.2 328 102 189
   001064      1  106700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1704.2 203 331
   001065         106800     ADD 1 TO REC-CT.                                             NC1704.2 224
   001066         106900 MPY-TEST-F2-20-3.                                                NC1704.2
   001067         107000     IF WRK-DU-2V5-1 = 9.99999 PERFORM PASS PERFORM PRINT-DETAIL  NC1704.2 112 327 331
   001068         107100     ELSE                                                         NC1704.2
   001069      1  107200     PERFORM FAIL MOVE WRK-DU-2V5-1 TO COMPUTED-N MOVE 9.99999 TO NC1704.2 328 112 189
   001070      1  107300     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001071         107400     ADD 1 TO REC-CT.                                             NC1704.2 224
   001072         107500 MPY-TEST-F2-20-4.                                                NC1704.2
   001073         107600     IF WRK-NE-2 = "$10.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1704.2 129 327 331
   001074         107700     ELSE                                                         NC1704.2
   001075      1  107800     PERFORM FAIL MOVE WRK-NE-2 TO COMPUTED-A MOVE "$10.00"       NC1704.2 328 129 188
   001076      1  107900     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001077         108000     ADD 1 TO REC-CT.                                             NC1704.2 224
   001078         108100 MPY-TEST-F2-20-5.                                                NC1704.2
   001079         108200     IF WRK-NE-3 = "$09.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1704.2 130 327 331
   001080         108300     ELSE                                                         NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081      1  108400     PERFORM FAIL MOVE WRK-NE-3 TO COMPUTED-A MOVE "$09.99  "     NC1704.2 328 130 188
   001082      1  108500     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001083         108600*                                                                 NC1704.2
   001084         108700*                                                                 NC1704.2
   001085         108800 MPY-INIT-F2-21.                                                  NC1704.2
   001086         108900*    ==-->    SIZE ERROR CONDITION  <--==                         NC1704.2
   001087         109000*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1704.2
   001088         109100     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   001089         109200     MOVE   "MPY-TEST-F2-21" TO PAR-NAME.                         NC1704.2 177
   001090         109300     MOVE    999999 TO WRK-DU-6V0-1.                              NC1704.2 115
   001091         109400     MOVE    .00001 TO WRK-DU-4P1-1.                              NC1704.2 113
   001092         109500     MOVE    0      TO WRK-DU-2V0-1.                              NC1704.2 101
   001093         109600     MOVE    0      TO WRK-DU-2V0-2.                              NC1704.2 102
   001094         109700     MOVE    0      TO WRK-DU-2V5-1.                              NC1704.2 112
   001095         109800     MOVE    0      TO WRK-NE-2.                                  NC1704.2 129
   001096         109900     MOVE    0      TO WRK-NE-3.                                  NC1704.2 130
   001097         110000     MOVE    1      TO REC-CT.                                    NC1704.2 224
   001098         110100     MOVE   "0"     TO WRK-XN-00001.                              NC1704.2 51
   001099         110200 MPY-TEST-F2-21-0.                                                NC1704.2
   001100         110300     MULTIPLY WRK-DU-6V0-1 BY WRK-DU-6V0-1                        NC1704.2 115 115
   001101         110400       GIVING WRK-DU-2V0-1                                        NC1704.2 101
   001102         110500              WRK-DU-2V0-2 ROUNDED                                NC1704.2 102
   001103         110600              WRK-DU-2V5-1                                        NC1704.2 112
   001104         110700              WRK-NE-2 ROUNDED                                    NC1704.2 129
   001105         110800              WRK-NE-3                                            NC1704.2 130
   001106      1  110900           ON SIZE ERROR MOVE "1" TO WRK-XN-00001.                NC1704.2 51
   001107         111000     GO TO   MPY-TEST-F2-21-1.                                    NC1704.2 1111
   001108         111100 MPY-DELETE-F2-21.                                                NC1704.2
   001109         111200     PERFORM DE-LETE.                                             NC1704.2 329
   001110         111300     GO TO   MPY-INIT-F2-22.                                      NC1704.2 1160
   001111         111400 MPY-TEST-F2-21-1.                                                NC1704.2
   001112         111500     IF      WRK-DU-2V0-1  = 0                                    NC1704.2 101
   001113      1  111600             PERFORM PASS                                         NC1704.2 327
   001114      1  111700             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001115         111800     ELSE                                                         NC1704.2
   001116      1  111900             PERFORM FAIL                                         NC1704.2 328
   001117      1  112000             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1704.2 101 189
   001118      1  112100             MOVE    0 TO CORRECT-N                               NC1704.2 203
   001119      1  112200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001120         112300     ADD 1 TO REC-CT.                                             NC1704.2 224
   001121         112400 MPY-TEST-F2-21-2.                                                NC1704.2
   001122         112500     IF      WRK-DU-2V0-2 = 0                                     NC1704.2 102
   001123      1  112600             PERFORM PASS                                         NC1704.2 327
   001124      1  112700             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001125         112800     ELSE                                                         NC1704.2
   001126      1  112900             PERFORM FAIL                                         NC1704.2 328
   001127      1  113000             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1704.2 102 189
   001128      1  113100             MOVE    0   TO CORRECT-N                             NC1704.2 203
   001129      1  113200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001130         113300     ADD 1 TO REC-CT.                                             NC1704.2 224
   001131         113400 MPY-TEST-F2-21-3.                                                NC1704.2
   001132         113500     IF WRK-DU-2V5-1 = 0.00000 PERFORM PASS PERFORM PRINT-DETAIL  NC1704.2 112 327 331
   001133         113600     ELSE                                                         NC1704.2
   001134      1  113700     PERFORM FAIL MOVE WRK-DU-2V5-1 TO COMPUTED-N MOVE 0.00000 TO NC1704.2 328 112 189
   001135      1  113800     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001136         113900     ADD 1 TO REC-CT.                                             NC1704.2 224
   001137         114000 MPY-TEST-F2-21-4.                                                NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100     IF WRK-NE-2 = "$**.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1704.2 129 327 331
   001139         114200     ELSE                                                         NC1704.2
   001140      1  114300     PERFORM FAIL MOVE WRK-NE-2 TO COMPUTED-A MOVE "$**.00"       NC1704.2 328 129 188
   001141      1  114400     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001142         114500     ADD 1 TO REC-CT.                                             NC1704.2 224
   001143         114600 MPY-TEST-F2-21-5.                                                NC1704.2
   001144         114700     IF WRK-NE-3 = "$00.00  " PERFORM PASS PERFORM PRINT-DETAIL   NC1704.2 130 327 331
   001145         114800     ELSE                                                         NC1704.2
   001146      1  114900     PERFORM FAIL MOVE WRK-NE-3 TO COMPUTED-A MOVE "$00.00  "     NC1704.2 328 130 188
   001147      1  115000     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001148         115100     ADD 1 TO REC-CT.                                             NC1704.2 224
   001149         115200 MPY-TEST-F2-21-6.                                                NC1704.2
   001150         115300     IF      WRK-XN-00001 = "1"                                   NC1704.2 51
   001151      1  115400             PERFORM PASS                                         NC1704.2 327
   001152      1  115500             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001153         115600     ELSE                                                         NC1704.2
   001154      1  115700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   001155      1  115800             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1704.2 51 187
   001156      1  115900             MOVE   "1"            TO CORRECT-X                   NC1704.2 201
   001157      1  116000             PERFORM FAIL                                         NC1704.2 328
   001158      1  116100             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001159         116200*                                                                 NC1704.2
   001160         116300 MPY-INIT-F2-22.                                                  NC1704.2
   001161         116400*    ==--> NO SIZE ERROR CONDITION  <--==                         NC1704.2
   001162         116500*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1704.2
   001163         116600     MOVE   "MPY-TEST-F2-22" TO PAR-NAME.                         NC1704.2 177
   001164         116700     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   001165         116800     MOVE    999999 TO WRK-DU-6V0-1.                              NC1704.2 115
   001166         116900     MOVE    .00001 TO WRK-DU-4P1-1.                              NC1704.2 113
   001167         117000     MOVE    0      TO WRK-DU-2V0-1.                              NC1704.2 101
   001168         117100     MOVE    0      TO WRK-DU-2V0-2.                              NC1704.2 102
   001169         117200     MOVE    0      TO WRK-DU-2V5-1.                              NC1704.2 112
   001170         117300     MOVE    0      TO WRK-NE-2.                                  NC1704.2 129
   001171         117400     MOVE    0      TO WRK-NE-3.                                  NC1704.2 130
   001172         117500     MOVE    1      TO REC-CT.                                    NC1704.2 224
   001173         117600     MOVE   "0"     TO WRK-XN-00001.                              NC1704.2 51
   001174         117700 MPY-TEST-F2-22-0.                                                NC1704.2
   001175         117800     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-6V0-1                        NC1704.2 113 115
   001176         117900       GIVING WRK-DU-2V0-1                                        NC1704.2 101
   001177         118000              WRK-DU-2V0-2 ROUNDED                                NC1704.2 102
   001178         118100              WRK-DU-2V5-1                                        NC1704.2 112
   001179         118200              WRK-NE-2 ROUNDED                                    NC1704.2 129
   001180         118300              WRK-NE-3                                            NC1704.2 130
   001181      1  118400              ON SIZE ERROR MOVE "1" TO WRK-XN-00001.             NC1704.2 51
   001182         118500     GO TO   MPY-TEST-F2-22-1.                                    NC1704.2 1187
   001183         118600 MPY-DELETE-F2-22.                                                NC1704.2
   001184         118700     PERFORM DE-LETE.                                             NC1704.2 329
   001185         118800     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001186         118900     GO TO   MPY-INIT-F2-23.                                      NC1704.2 1236
   001187         119000 MPY-TEST-F2-22-1.                                                NC1704.2
   001188         119100     IF      WRK-DU-2V0-1  = 9                                    NC1704.2 101
   001189      1  119200             PERFORM PASS                                         NC1704.2 327
   001190      1  119300             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001191         119400     ELSE                                                         NC1704.2
   001192      1  119500             PERFORM FAIL                                         NC1704.2 328
   001193      1  119600             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1704.2 101 189
   001194      1  119700             MOVE    9 TO CORRECT-N                               NC1704.2 203
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195      1  119800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001196         119900     ADD 1 TO REC-CT.                                             NC1704.2 224
   001197         120000 MPY-TEST-F2-22-2.                                                NC1704.2
   001198         120100     IF      WRK-DU-2V0-2 = 10                                    NC1704.2 102
   001199      1  120200             PERFORM PASS                                         NC1704.2 327
   001200      1  120300             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001201         120400     ELSE                                                         NC1704.2
   001202      1  120500             PERFORM FAIL                                         NC1704.2 328
   001203      1  120600             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1704.2 102 189
   001204      1  120700             MOVE    10  TO CORRECT-N                             NC1704.2 203
   001205      1  120800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001206         120900     ADD 1 TO REC-CT.                                             NC1704.2 224
   001207         121000 MPY-TEST-F2-22-3.                                                NC1704.2
   001208         121100     IF WRK-DU-2V5-1 = 9.99999 PERFORM PASS PERFORM PRINT-DETAIL  NC1704.2 112 327 331
   001209         121200     ELSE                                                         NC1704.2
   001210      1  121300     PERFORM FAIL MOVE WRK-DU-2V5-1 TO COMPUTED-N MOVE 9.99999 TO NC1704.2 328 112 189
   001211      1  121400     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001212         121500     ADD 1 TO REC-CT.                                             NC1704.2 224
   001213         121600 MPY-TEST-F2-22-4.                                                NC1704.2
   001214         121700     IF WRK-NE-2 = "$10.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1704.2 129 327 331
   001215         121800     ELSE                                                         NC1704.2
   001216      1  121900     PERFORM FAIL MOVE WRK-NE-2 TO COMPUTED-A MOVE "$10.00"       NC1704.2 328 129 188
   001217      1  122000     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001218         122100     ADD 1 TO REC-CT.                                             NC1704.2 224
   001219         122200 MPY-TEST-F2-22-5.                                                NC1704.2
   001220         122300     IF WRK-NE-3 = "$09.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1704.2 130 327 331
   001221         122400     ELSE                                                         NC1704.2
   001222      1  122500     PERFORM FAIL MOVE WRK-NE-3 TO COMPUTED-A MOVE "$09.99  "     NC1704.2 328 130 188
   001223      1  122600     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001224         122700     ADD 1 TO REC-CT.                                             NC1704.2 224
   001225         122800 MPY-TEST-F2-22-6.                                                NC1704.2
   001226         122900     IF      WRK-XN-00001 = "0"                                   NC1704.2 51
   001227      1  123000             PERFORM PASS                                         NC1704.2 327
   001228      1  123100             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001229         123200     ELSE                                                         NC1704.2
   001230      1  123300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1704.2 182
   001231      1  123400             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1704.2 51 187
   001232      1  123500             MOVE   "0"            TO CORRECT-X                   NC1704.2 201
   001233      1  123600             PERFORM FAIL                                         NC1704.2 328
   001234      1  123700             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001235         123800*                                                                 NC1704.2
   001236         123900 MPY-INIT-F2-23.                                                  NC1704.2
   001237         124000*    ==-->    SIZE ERROR CONDITION  <--==                         NC1704.2
   001238         124100*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1704.2
   001239         124200     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   001240         124300     MOVE   "MPY-TEST-F2-23" TO PAR-NAME.                         NC1704.2 177
   001241         124400     MOVE    999999 TO WRK-DU-6V0-1.                              NC1704.2 115
   001242         124500     MOVE    1 TO REC-CT.                                         NC1704.2 224
   001243         124600     MOVE    0 TO WRK-DU-2V0-1.                                   NC1704.2 101
   001244         124700     MOVE    0 TO WRK-DU-2V0-2.                                   NC1704.2 102
   001245         124800     MOVE    0 TO WRK-DU-2V5-1.                                   NC1704.2 112
   001246         124900     MOVE    0 TO WRK-NE-2.                                       NC1704.2 129
   001247         125000     MOVE    0 TO WRK-NE-3.                                       NC1704.2 130
   001248         125100     MOVE   "0" TO WRK-XN-00001.                                  NC1704.2 51
   001249         125200 MPY-TEST-F2-23-0.                                                NC1704.2
   001250         125300     MULTIPLY WRK-DU-6V0-1 BY WRK-DU-6V0-1                        NC1704.2 115 115
   001251         125400       GIVING WRK-DU-2V0-1                                        NC1704.2 101
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500              WRK-DU-2V0-2 ROUNDED                                NC1704.2 102
   001253         125600              WRK-DU-2V5-1                                        NC1704.2 112
   001254         125700              WRK-NE-2 ROUNDED                                    NC1704.2 129
   001255         125800              WRK-NE-3                                            NC1704.2 130
   001256      1  125900          NOT ON SIZE ERROR MOVE "1" TO WRK-XN-00001.             NC1704.2 51
   001257         126000     GO TO   MPY-TEST-F2-23-1.                                    NC1704.2 1262
   001258         126100 MPY-DELETE-F2-23.                                                NC1704.2
   001259         126200     PERFORM DE-LETE.                                             NC1704.2 329
   001260         126300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001261         126400     GO TO   MPY-INIT-F2-24.                                      NC1704.2 1311
   001262         126500 MPY-TEST-F2-23-1.                                                NC1704.2
   001263         126600     IF      WRK-DU-2V0-1  = 0                                    NC1704.2 101
   001264      1  126700             PERFORM PASS                                         NC1704.2 327
   001265      1  126800             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001266         126900     ELSE                                                         NC1704.2
   001267      1  127000             PERFORM FAIL                                         NC1704.2 328
   001268      1  127100             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1704.2 101 189
   001269      1  127200             MOVE    0 TO CORRECT-N                               NC1704.2 203
   001270      1  127300             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001271         127400     ADD 1 TO REC-CT.                                             NC1704.2 224
   001272         127500 MPY-TEST-F2-23-2.                                                NC1704.2
   001273         127600     IF      WRK-DU-2V0-2 = 0                                     NC1704.2 102
   001274      1  127700             PERFORM PASS                                         NC1704.2 327
   001275      1  127800             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001276         127900     ELSE                                                         NC1704.2
   001277      1  128000             PERFORM FAIL                                         NC1704.2 328
   001278      1  128100             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1704.2 102 189
   001279      1  128200             MOVE    0   TO CORRECT-N                             NC1704.2 203
   001280      1  128300             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001281         128400     ADD 1 TO REC-CT.                                             NC1704.2 224
   001282         128500 MPY-TEST-F2-23-3.                                                NC1704.2
   001283         128600     IF WRK-DU-2V5-1 = 0.00000 PERFORM PASS PERFORM PRINT-DETAIL  NC1704.2 112 327 331
   001284         128700     ELSE                                                         NC1704.2
   001285      1  128800     PERFORM FAIL MOVE WRK-DU-2V5-1 TO COMPUTED-N MOVE 0.00000 TO NC1704.2 328 112 189
   001286      1  128900     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001287         129000     ADD 1 TO REC-CT.                                             NC1704.2 224
   001288         129100 MPY-TEST-F2-23-4.                                                NC1704.2
   001289         129200     IF WRK-NE-2 = "$**.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1704.2 129 327 331
   001290         129300     ELSE                                                         NC1704.2
   001291      1  129400     PERFORM FAIL MOVE WRK-NE-2 TO COMPUTED-A MOVE "$**.00"       NC1704.2 328 129 188
   001292      1  129500     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001293         129600     ADD 1 TO REC-CT.                                             NC1704.2 224
   001294         129700 MPY-TEST-F2-23-5.                                                NC1704.2
   001295         129800     IF WRK-NE-3 = "$00.00  " PERFORM PASS PERFORM PRINT-DETAIL   NC1704.2 130 327 331
   001296         129900     ELSE                                                         NC1704.2
   001297      1  130000     PERFORM FAIL MOVE WRK-NE-3 TO COMPUTED-A MOVE "$00.00  "     NC1704.2 328 130 188
   001298      1  130100     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001299         130200     ADD 1 TO REC-CT.                                             NC1704.2 224
   001300         130300 MPY-TEST-F2-23-6.                                                NC1704.2
   001301         130400     IF      WRK-XN-00001 = "0"                                   NC1704.2 51
   001302      1  130500             PERFORM PASS                                         NC1704.2 327
   001303      1  130600             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001304         130700     ELSE                                                         NC1704.2
   001305      1  130800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   001306      1  130900             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1704.2 51 187
   001307      1  131000             MOVE   "0"            TO CORRECT-X                   NC1704.2 201
   001308      1  131100             PERFORM FAIL                                         NC1704.2 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309      1  131200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001310         131300*                                                                 NC1704.2
   001311         131400 MPY-INIT-F2-24.                                                  NC1704.2
   001312         131500*    ==--> NO SIZE ERROR CONDITION  <--==                         NC1704.2
   001313         131600*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1704.2
   001314         131700     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1704.2 233
   001315         131800     MOVE   "MPY-TEST-F2-24" TO PAR-NAME.                         NC1704.2 177
   001316         131900     MOVE    999999 TO WRK-DU-6V0-1.                              NC1704.2 115
   001317         132000     MOVE    .00001 TO WRK-DU-4P1-1.                              NC1704.2 113
   001318         132100     MOVE    0      TO WRK-DU-2V0-1.                              NC1704.2 101
   001319         132200     MOVE    0      TO WRK-DU-2V0-2.                              NC1704.2 102
   001320         132300     MOVE    0      TO WRK-DU-2V5-1.                              NC1704.2 112
   001321         132400     MOVE    0      TO WRK-NE-2.                                  NC1704.2 129
   001322         132500     MOVE    0      TO WRK-NE-3.                                  NC1704.2 130
   001323         132600     MOVE    1      TO REC-CT.                                    NC1704.2 224
   001324         132700     MOVE   "0"     TO WRK-XN-00001.                              NC1704.2 51
   001325         132800 MPY-TEST-F2-24-0.                                                NC1704.2
   001326         132900     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-6V0-1                        NC1704.2 113 115
   001327         133000       GIVING WRK-DU-2V0-1                                        NC1704.2 101
   001328         133100              WRK-DU-2V0-2 ROUNDED                                NC1704.2 102
   001329         133200              WRK-DU-2V5-1                                        NC1704.2 112
   001330         133300              WRK-NE-2 ROUNDED                                    NC1704.2 129
   001331         133400              WRK-NE-3                                            NC1704.2 130
   001332      1  133500          NOT ON SIZE ERROR MOVE "1" TO WRK-XN-00001.             NC1704.2 51
   001333         133600     GO TO   MPY-TEST-F2-24-1.                                    NC1704.2 1338
   001334         133700 MPY-DELETE-F2-24.                                                NC1704.2
   001335         133800     PERFORM DE-LETE.                                             NC1704.2 329
   001336         133900     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001337         134000     GO TO   MPY-INIT-F2-25.                                      NC1704.2 1387
   001338         134100 MPY-TEST-F2-24-1.                                                NC1704.2
   001339         134200     IF      WRK-DU-2V0-1  = 9                                    NC1704.2 101
   001340      1  134300             PERFORM PASS                                         NC1704.2 327
   001341      1  134400             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001342         134500     ELSE                                                         NC1704.2
   001343      1  134600             PERFORM FAIL                                         NC1704.2 328
   001344      1  134700             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1704.2 101 189
   001345      1  134800             MOVE    9 TO CORRECT-N                               NC1704.2 203
   001346      1  134900             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001347         135000     ADD 1 TO REC-CT.                                             NC1704.2 224
   001348         135100 MPY-TEST-F2-24-2.                                                NC1704.2
   001349         135200     IF      WRK-DU-2V0-2 = 10                                    NC1704.2 102
   001350      1  135300             PERFORM PASS                                         NC1704.2 327
   001351      1  135400             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001352         135500     ELSE                                                         NC1704.2
   001353      1  135600             PERFORM FAIL                                         NC1704.2 328
   001354      1  135700             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1704.2 102 189
   001355      1  135800             MOVE    10  TO CORRECT-N                             NC1704.2 203
   001356      1  135900             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001357         136000     ADD 1 TO REC-CT.                                             NC1704.2 224
   001358         136100 MPY-TEST-F2-24-3.                                                NC1704.2
   001359         136200     IF WRK-DU-2V5-1 = 9.99999 PERFORM PASS PERFORM PRINT-DETAIL  NC1704.2 112 327 331
   001360         136300     ELSE                                                         NC1704.2
   001361      1  136400     PERFORM FAIL MOVE WRK-DU-2V5-1 TO COMPUTED-N MOVE 9.99999 TO NC1704.2 328 112 189
   001362      1  136500     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001363         136600     ADD 1 TO REC-CT.                                             NC1704.2 224
   001364         136700 MPY-TEST-F2-24-4.                                                NC1704.2
   001365         136800     IF WRK-NE-2 = "$10.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1704.2 129 327 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900     ELSE                                                         NC1704.2
   001367      1  137000     PERFORM FAIL MOVE WRK-NE-2 TO COMPUTED-A MOVE "$10.00"       NC1704.2 328 129 188
   001368      1  137100     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001369         137200     ADD 1 TO REC-CT.                                             NC1704.2 224
   001370         137300 MPY-TEST-F2-24-5.                                                NC1704.2
   001371         137400     IF WRK-NE-3 = "$09.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1704.2 130 327 331
   001372         137500     ELSE                                                         NC1704.2
   001373      1  137600     PERFORM FAIL MOVE WRK-NE-3 TO COMPUTED-A MOVE "$09.99  "     NC1704.2 328 130 188
   001374      1  137700     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001375         137800     ADD 1 TO REC-CT.                                             NC1704.2 224
   001376         137900 MPY-TEST-F2-24-6.                                                NC1704.2
   001377         138000     IF      WRK-XN-00001 = "1"                                   NC1704.2 51
   001378      1  138100             PERFORM PASS                                         NC1704.2 327
   001379      1  138200             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001380         138300     ELSE                                                         NC1704.2
   001381      1  138400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1704.2 182
   001382      1  138500             MOVE    WRK-DU-6V0-2  TO COMPUTED-X                  NC1704.2 116 187
   001383      1  138600             MOVE   "1"            TO CORRECT-X                   NC1704.2 201
   001384      1  138700             PERFORM FAIL                                         NC1704.2 328
   001385      1  138800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001386         138900*                                                                 NC1704.2
   001387         139000 MPY-INIT-F2-25.                                                  NC1704.2
   001388         139100*    ==-->   SIZE ERROR CONDITION   <--==                         NC1704.2
   001389         139200*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1704.2
   001390         139300     MOVE   "V1-67 6.4.2"    TO ANSI-REFERENCE.                   NC1704.2 233
   001391         139400     MOVE   "MPY-TEST-F2-25" TO PAR-NAME.                         NC1704.2 177
   001392         139500     MOVE    999999 TO WRK-DU-6V0-1.                              NC1704.2 115
   001393         139600     MOVE    1 TO REC-CT.                                         NC1704.2 224
   001394         139700     MOVE    0 TO WRK-DU-2V0-1.                                   NC1704.2 101
   001395         139800     MOVE    0 TO WRK-DU-2V0-2.                                   NC1704.2 102
   001396         139900     MOVE    0 TO WRK-DU-2V5-1.                                   NC1704.2 112
   001397         140000     MOVE    0 TO WRK-NE-2.                                       NC1704.2 129
   001398         140100     MOVE    0 TO WRK-NE-3.                                       NC1704.2 130
   001399         140200     MOVE   "0" TO WRK-XN-00001.                                  NC1704.2 51
   001400         140300 MPY-TEST-F2-25-0.                                                NC1704.2
   001401         140400     MULTIPLY WRK-DU-6V0-1 BY WRK-DU-6V0-1                        NC1704.2 115 115
   001402         140500       GIVING WRK-DU-2V0-1                                        NC1704.2 101
   001403         140600              WRK-DU-2V0-2 ROUNDED                                NC1704.2 102
   001404         140700              WRK-DU-2V5-1                                        NC1704.2 112
   001405         140800              WRK-NE-2 ROUNDED                                    NC1704.2 129
   001406         140900              WRK-NE-3                                            NC1704.2 130
   001407      1  141000              ON SIZE ERROR MOVE "1" TO WRK-XN-00001              NC1704.2 51
   001408      1  141100          NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001.             NC1704.2 51
   001409         141200     GO TO   MPY-TEST-F2-25-1.                                    NC1704.2 1414
   001410         141300 MPY-DELETE-F2-25.                                                NC1704.2
   001411         141400     PERFORM DE-LETE.                                             NC1704.2 329
   001412         141500     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001413         141600     GO TO   MPY-INIT-F2-26.                                      NC1704.2 1464
   001414         141700 MPY-TEST-F2-25-1.                                                NC1704.2
   001415         141800     IF      WRK-DU-2V0-1  = 0                                    NC1704.2 101
   001416      1  141900             PERFORM PASS                                         NC1704.2 327
   001417      1  142000             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001418         142100     ELSE                                                         NC1704.2
   001419      1  142200             PERFORM FAIL                                         NC1704.2 328
   001420      1  142300             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1704.2 101 189
   001421      1  142400             MOVE    0 TO CORRECT-N                               NC1704.2 203
   001422      1  142500             PERFORM PRINT-DETAIL.                                NC1704.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600     ADD 1 TO REC-CT.                                             NC1704.2 224
   001424         142700 MPY-TEST-F2-25-2.                                                NC1704.2
   001425         142800     IF      WRK-DU-2V0-2 = 00                                    NC1704.2 102
   001426      1  142900             PERFORM PASS                                         NC1704.2 327
   001427      1  143000             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001428         143100     ELSE                                                         NC1704.2
   001429      1  143200             PERFORM FAIL                                         NC1704.2 328
   001430      1  143300             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1704.2 102 189
   001431      1  143400             MOVE    00  TO CORRECT-N                             NC1704.2 203
   001432      1  143500             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001433         143600     ADD 1 TO REC-CT.                                             NC1704.2 224
   001434         143700 MPY-TEST-F2-25-3.                                                NC1704.2
   001435         143800     IF WRK-DU-2V5-1 = 0.00000 PERFORM PASS PERFORM PRINT-DETAIL  NC1704.2 112 327 331
   001436         143900     ELSE                                                         NC1704.2
   001437      1  144000     PERFORM FAIL MOVE WRK-DU-2V5-1 TO COMPUTED-N MOVE 0.00000 TO NC1704.2 328 112 189
   001438      1  144100     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001439         144200     ADD 1 TO REC-CT.                                             NC1704.2 224
   001440         144300 MPY-TEST-F2-25-4.                                                NC1704.2
   001441         144400     IF WRK-NE-2 = "$**.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1704.2 129 327 331
   001442         144500     ELSE                                                         NC1704.2
   001443      1  144600     PERFORM FAIL MOVE WRK-NE-2 TO COMPUTED-A MOVE "$**.00"       NC1704.2 328 129 188
   001444      1  144700     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001445         144800     ADD 1 TO REC-CT.                                             NC1704.2 224
   001446         144900 MPY-TEST-F2-25-5.                                                NC1704.2
   001447         145000     IF WRK-NE-3 = "$00.00  " PERFORM PASS PERFORM PRINT-DETAIL   NC1704.2 130 327 331
   001448         145100     ELSE                                                         NC1704.2
   001449      1  145200     PERFORM FAIL MOVE WRK-NE-3 TO COMPUTED-A MOVE "$00.00  "     NC1704.2 328 130 188
   001450      1  145300     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001451         145400     ADD 1 TO REC-CT.                                             NC1704.2 224
   001452         145500 MPY-TEST-F2-25-6.                                                NC1704.2
   001453         145600     IF      WRK-XN-00001 = "1"                                   NC1704.2 51
   001454      1  145700             PERFORM PASS                                         NC1704.2 327
   001455      1  145800             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001456         145900     ELSE                                                         NC1704.2
   001457      1  146000             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   001458      1  146100             MOVE    WRK-DU-6V0-2  TO COMPUTED-X                  NC1704.2 116 187
   001459      1  146200             MOVE   "1"            TO CORRECT-X                   NC1704.2 201
   001460      1  146300             PERFORM FAIL                                         NC1704.2 328
   001461      1  146400             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001462         146500*                                                                 NC1704.2
   001463         146600*                                                                 NC1704.2
   001464         146700 MPY-INIT-F2-26.                                                  NC1704.2
   001465         146800*    ==-->  NO SIZE ERROR CONDITION <--==                         NC1704.2
   001466         146900*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1704.2
   001467         147000     MOVE   "MPY-TEST-F2-26" TO PAR-NAME.                         NC1704.2 177
   001468         147100     MOVE   "V1-67 6.4.2"    TO ANSI-REFERENCE.                   NC1704.2 233
   001469         147200     MOVE    999999 TO WRK-DU-6V0-1.                              NC1704.2 115
   001470         147300     MOVE    .00001 TO WRK-DU-4P1-1.                              NC1704.2 113
   001471         147400     MOVE    1 TO REC-CT.                                         NC1704.2 224
   001472         147500     MOVE    0 TO WRK-DU-2V0-1.                                   NC1704.2 101
   001473         147600     MOVE    0 TO WRK-DU-2V5-1.                                   NC1704.2 112
   001474         147700     MOVE    0 TO WRK-NE-2.                                       NC1704.2 129
   001475         147800     MOVE    0 TO WRK-NE-3.                                       NC1704.2 130
   001476         147900     MOVE   "0" TO WRK-XN-00001.                                  NC1704.2 51
   001477         148000 MPY-TEST-F2-26-0.                                                NC1704.2
   001478         148100     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-6V0-1                        NC1704.2 113 115
   001479         148200       GIVING WRK-DU-2V0-1                                        NC1704.2 101
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300              WRK-DU-2V0-2 ROUNDED                                NC1704.2 102
   001481         148400              WRK-DU-2V5-1                                        NC1704.2 112
   001482         148500              WRK-NE-2 ROUNDED                                    NC1704.2 129
   001483         148600              WRK-NE-3                                            NC1704.2 130
   001484      1  148700              ON SIZE ERROR MOVE "1" TO WRK-XN-00001              NC1704.2 51
   001485      1  148800          NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001.             NC1704.2 51
   001486         148900     GO TO   MPY-TEST-F2-26-1.                                    NC1704.2 1491
   001487         149000 MPY-DELETE-F2-26.                                                NC1704.2
   001488         149100     PERFORM DE-LETE.                                             NC1704.2 329
   001489         149200     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001490         149300     GO TO   MPY-INIT-F2-27.                                      NC1704.2 1540
   001491         149400 MPY-TEST-F2-26-1.                                                NC1704.2
   001492         149500     IF      WRK-DU-2V0-1  = 9                                    NC1704.2 101
   001493      1  149600             PERFORM PASS                                         NC1704.2 327
   001494      1  149700             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001495         149800     ELSE                                                         NC1704.2
   001496      1  149900             PERFORM FAIL                                         NC1704.2 328
   001497      1  150000             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1704.2 101 189
   001498      1  150100             MOVE    9 TO CORRECT-N                               NC1704.2 203
   001499      1  150200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001500         150300     ADD 1 TO REC-CT.                                             NC1704.2 224
   001501         150400 MPY-TEST-F2-26-2.                                                NC1704.2
   001502         150500     IF      WRK-DU-2V0-2 = 10                                    NC1704.2 102
   001503      1  150600             PERFORM PASS                                         NC1704.2 327
   001504      1  150700             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001505         150800     ELSE                                                         NC1704.2
   001506      1  150900             PERFORM FAIL                                         NC1704.2 328
   001507      1  151000             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1704.2 102 189
   001508      1  151100             MOVE    10  TO CORRECT-N                             NC1704.2 203
   001509      1  151200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001510         151300     ADD 1 TO REC-CT.                                             NC1704.2 224
   001511         151400 MPY-TEST-F2-26-3.                                                NC1704.2
   001512         151500     IF WRK-DU-2V5-1 = 9.99999 PERFORM PASS PERFORM PRINT-DETAIL  NC1704.2 112 327 331
   001513         151600     ELSE                                                         NC1704.2
   001514      1  151700     PERFORM FAIL MOVE WRK-DU-2V5-1 TO COMPUTED-N MOVE 9.99999 TO NC1704.2 328 112 189
   001515      1  151800     CORRECT-N PERFORM PRINT-DETAIL.                              NC1704.2 203 331
   001516         151900     ADD 1 TO REC-CT.                                             NC1704.2 224
   001517         152000 MPY-TEST-F2-26-4.                                                NC1704.2
   001518         152100     IF WRK-NE-2 = "$10.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1704.2 129 327 331
   001519         152200     ELSE                                                         NC1704.2
   001520      1  152300     PERFORM FAIL MOVE WRK-NE-2 TO COMPUTED-A MOVE "$10.00"       NC1704.2 328 129 188
   001521      1  152400     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001522         152500     ADD 1 TO REC-CT.                                             NC1704.2 224
   001523         152600 MPY-TEST-F2-26-5.                                                NC1704.2
   001524         152700     IF WRK-NE-3 = "$09.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1704.2 130 327 331
   001525         152800     ELSE                                                         NC1704.2
   001526      1  152900     PERFORM FAIL MOVE WRK-NE-3 TO COMPUTED-A MOVE "$09.99  "     NC1704.2 328 130 188
   001527      1  153000     TO CORRECT-A PERFORM PRINT-DETAIL.                           NC1704.2 202 331
   001528         153100     ADD 1 TO REC-CT.                                             NC1704.2 224
   001529         153200 MPY-TEST-F2-26-6.                                                NC1704.2
   001530         153300     IF      WRK-XN-00001 = "2"                                   NC1704.2 51
   001531      1  153400             PERFORM PASS                                         NC1704.2 327
   001532      1  153500             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001533         153600     ELSE                                                         NC1704.2
   001534      1  153700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1704.2 182
   001535      1  153800             MOVE    WRK-DU-6V0-2  TO COMPUTED-X                  NC1704.2 116 187
   001536      1  153900             MOVE   "2"            TO CORRECT-X                   NC1704.2 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537      1  154000             PERFORM FAIL                                         NC1704.2 328
   001538      1  154100             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001539         154200*                                                                 NC1704.2
   001540         154300 MPY-INIT-F2-27.                                                  NC1704.2
   001541         154400*    ==--> EXPLICIT SCOPE TERMINATOR <--==                        NC1704.2
   001542         154500     MOVE   "1V-41 6.4.3"    TO ANSI-REFERENCE.                   NC1704.2 233
   001543         154600     MOVE    "MPY-TEST-F2-27" TO PAR-NAME.                        NC1704.2 177
   001544         154700     MOVE    "A" TO XRAY.                                         NC1704.2 86
   001545         154800     MOVE 80.12  TO MULT1.                                        NC1704.2 143
   001546         154900     MOVE   -56  TO MULT4.                                        NC1704.2 147
   001547         155000     MOVE     4  TO MULT5.                                        NC1704.2 149
   001548         155100     MOVE     0  TO WRK-DS-10V00.                                 NC1704.2 50
   001549         155200     MOVE     0  TO WRK-DS-02V00.                                 NC1704.2 56
   001550         155300     MOVE     1  TO REC-CT.                                       NC1704.2 224
   001551         155400 MPY-TEST-F2-27-0.                                                NC1704.2
   001552         155500     MULTIPLY MULT4 BY MULT1                                      NC1704.2 147 143
   001553         155600       GIVING MULT5                                               NC1704.2 149
   001554         155700              ON SIZE ERROR                                       NC1704.2
   001555      1  155800              MOVE    "H" TO XRAY                                 NC1704.2 86
   001556      1  155900              MOVE    28  TO WRK-DS-10V00                         NC1704.2 50
   001557      1  156000              MOVE   -19  TO WRK-DS-02V00                         NC1704.2 56
   001558         156100     END-MULTIPLY                                                 NC1704.2
   001559         156200     MOVE    99 TO WRK-CS-18V00.                                  NC1704.2 69
   001560         156300     GO TO MPY-TEST-F2-27-1.                                      NC1704.2 1565
   001561         156400 MPY-DELETE-F2-27-1.                                              NC1704.2
   001562         156500     PERFORM DE-LETE.                                             NC1704.2 329
   001563         156600     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001564         156700     GO TO   MPY-INIT-F2-28.                                      NC1704.2 1625
   001565         156800 MPY-TEST-F2-27-1.                                                NC1704.2
   001566         156900     MOVE "MPY-TEST-F2-27-1" TO PAR-NAME.                         NC1704.2 177
   001567         157000     IF      XRAY    = "H"                                        NC1704.2 86
   001568      1  157100             PERFORM PASS                                         NC1704.2 327
   001569      1  157200             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001570         157300     ELSE                                                         NC1704.2
   001571      1  157400             MOVE  XRAY   TO COMPUTED-X                           NC1704.2 86 187
   001572      1  157500             MOVE "H"     TO CORRECT-X                            NC1704.2 201
   001573      1  157600             MOVE "SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK    NC1704.2 182
   001574      1  157700             PERFORM FAIL                                         NC1704.2 328
   001575      1  157800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001576         157900     ADD     1 TO REC-CT.                                         NC1704.2 224
   001577         158000 MPY-TEST-F2-27-2.                                                NC1704.2
   001578         158100     MOVE "MPY-TEST-F2-27-2" TO PAR-NAME.                         NC1704.2 177
   001579         158200     IF      WRK-DS-10V00 = 0000000028                            NC1704.2 50
   001580      1  158300             PERFORM PASS                                         NC1704.2 327
   001581      1  158400             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001582         158500     ELSE                                                         NC1704.2
   001583      1  158600             MOVE  WRK-DS-10V00 TO COMPUTED-N                     NC1704.2 50 189
   001584      1  158700             MOVE  28           TO CORRECT-N                      NC1704.2 203
   001585      1  158800             MOVE "SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK    NC1704.2 182
   001586      1  158900             PERFORM FAIL                                         NC1704.2 328
   001587      1  159000             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001588         159100     ADD     1 TO REC-CT.                                         NC1704.2 224
   001589         159200 MPY-TEST-F2-27-3.                                                NC1704.2
   001590         159300     MOVE  "MPY-TEST-F2-27-3" TO PAR-NAME.                        NC1704.2 177
   001591         159400     IF      WRK-DS-02V00 = -19                                   NC1704.2 56
   001592      1  159500             PERFORM PASS                                         NC1704.2 327
   001593      1  159600             PERFORM PRINT-DETAIL                                 NC1704.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700     ELSE                                                         NC1704.2
   001595      1  159800             MOVE  WRK-DS-02V00 TO COMPUTED-N                     NC1704.2 56 189
   001596      1  159900             MOVE  -19          TO CORRECT-N                      NC1704.2 203
   001597      1  160000             MOVE "SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK    NC1704.2 182
   001598      1  160100             PERFORM FAIL                                         NC1704.2 328
   001599      1  160200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001600         160300     ADD     1 TO REC-CT.                                         NC1704.2 224
   001601         160400 MPY-TEST-F2-27-4.                                                NC1704.2
   001602         160500     MOVE "MPY-TEST-F2-27-4" TO PAR-NAME.                         NC1704.2 177
   001603         160600     IF      WRK-CS-18V00 = 000000000000000099                    NC1704.2 69
   001604      1  160700             PERFORM PASS                                         NC1704.2 327
   001605      1  160800             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001606         160900     ELSE                                                         NC1704.2
   001607      1  161000             MOVE  WRK-CS-18V00 TO COMPUTED-N                     NC1704.2 69 189
   001608      1  161100             MOVE  99           TO CORRECT-N                      NC1704.2 203
   001609      1  161200             MOVE "SCOPE TERMINATOR IGNORED" TO RE-MARK           NC1704.2 182
   001610      1  161300             PERFORM FAIL                                         NC1704.2 328
   001611      1  161400             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001612         161500     ADD     1 TO REC-CT.                                         NC1704.2 224
   001613         161600 MPY-TEST-F2-27-5.                                                NC1704.2
   001614         161700     MOVE "MPY-TEST-F2-27-5" TO PAR-NAME.                         NC1704.2 177
   001615         161800     IF      MULT5 = 4                                            NC1704.2 149
   001616      1  161900             PERFORM PASS                                         NC1704.2 327
   001617      1  162000             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001618         162100     ELSE                                                         NC1704.2
   001619      1  162200             MOVE  MULT5 TO COMPUTED-N                            NC1704.2 149 189
   001620      1  162300             MOVE  4     TO CORRECT-N                             NC1704.2 203
   001621      1  162400             MOVE "SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK    NC1704.2 182
   001622      1  162500             PERFORM FAIL                                         NC1704.2 328
   001623      1  162600             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001624         162700*                                                                 NC1704.2
   001625         162800 MPY-INIT-F2-28.                                                  NC1704.2
   001626         162900*    ==-->  EXPLICIT SCOPE TERMINATOR  <--==                      NC1704.2
   001627         163000     MOVE   "1V-41 6.4.3"    TO ANSI-REFERENCE.                   NC1704.2 233
   001628         163100     MOVE    "MPY-TEST-F2-28" TO PAR-NAME.                        NC1704.2 177
   001629         163200     MOVE   "1"   TO WRK-XN-00001.                                NC1704.2 51
   001630         163300     MOVE    0    TO WRK-DS-05V00.                                NC1704.2 82
   001631         163400     MOVE    0    TO WRK-DS-02V00.                                NC1704.2 56
   001632         163500     MOVE    0    TO WRK-DS-10V00.                                NC1704.2 50
   001633         163600     MOVE    1    TO REC-CT.                                      NC1704.2 224
   001634         163700 MPY-TEST-F2-28-0.                                                NC1704.2
   001635         163800     MULTIPLY A01ONE-DS-P0801 BY A12ONES-DS-12V00                 NC1704.2 63 61
   001636         163900       GIVING WRK-DS-10V00                                        NC1704.2 50
   001637         164000           ON SIZE ERROR                                          NC1704.2
   001638      1  164100              MOVE "0" TO WRK-XN-00001                            NC1704.2 51
   001639      1  164200              MOVE  38 TO WRK-DS-05V00                            NC1704.2 82
   001640      1  164300              MOVE -19 TO WRK-DS-02V00                            NC1704.2 56
   001641         164400     END-MULTIPLY                                                 NC1704.2
   001642         164500     MOVE    99 TO WRK-CS-18V00.                                  NC1704.2 69
   001643         164600     GO TO   MPY-TEST-F2-28-1.                                    NC1704.2 1648
   001644         164700 MPY-DELETE-F2-28-1.                                              NC1704.2
   001645         164800     PERFORM DE-LETE.                                             NC1704.2 329
   001646         164900     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001647         165000     GO TO   MPY-INIT-F2-29.                                      NC1704.2 1712
   001648         165100 MPY-TEST-F2-28-1.                                                NC1704.2
   001649         165200     MOVE    "MPY-TEST-F2-28-1" TO PAR-NAME.                      NC1704.2 177
   001650         165300     IF      WRK-XN-00001 = "1"                                   NC1704.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651      1  165400             PERFORM PASS                                         NC1704.2 327
   001652      1  165500             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001653         165600     ELSE                                                         NC1704.2
   001654      1  165700             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1704.2 51 187
   001655      1  165800             MOVE   "1"           TO CORRECT-X                    NC1704.2 201
   001656      1  165900             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1704.2
   001657      1  166000                  TO RE-MARK                                      NC1704.2 182
   001658      1  166100             PERFORM FAIL                                         NC1704.2 328
   001659      1  166200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001660         166300     ADD     1 TO REC-CT.                                         NC1704.2 224
   001661         166400 MPY-TEST-F2-28-2.                                                NC1704.2
   001662         166500     MOVE   "MPY-TEST-F2-28-2" TO PAR-NAME.                       NC1704.2 177
   001663         166600     IF      WRK-DS-10V00 = 0000000111                            NC1704.2 50
   001664      1  166700             PERFORM PASS                                         NC1704.2 327
   001665      1  166800             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001666         166900     ELSE                                                         NC1704.2
   001667      1  167000             MOVE  WRK-DS-10V00 TO COMPUTED-N                     NC1704.2 50 189
   001668      1  167100             MOVE  0000000111   TO CORRECT-N                      NC1704.2 203
   001669      1  167200             MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK     NC1704.2 182
   001670      1  167300             PERFORM FAIL                                         NC1704.2 328
   001671      1  167400             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001672         167500     ADD     1 TO REC-CT.                                         NC1704.2 224
   001673         167600 MPY-TEST-F2-28-3.                                                NC1704.2
   001674         167700     MOVE    "MPY-TEST-F2-28-3" TO PAR-NAME.                      NC1704.2 177
   001675         167800     IF      WRK-DS-05V00 = 0                                     NC1704.2 82
   001676      1  167900             PERFORM PASS                                         NC1704.2 327
   001677      1  168000             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001678         168100     ELSE                                                         NC1704.2
   001679      1  168200             MOVE  WRK-DS-05V00 TO COMPUTED-N                     NC1704.2 82 189
   001680      1  168300             MOVE  0            TO CORRECT-N                      NC1704.2 203
   001681      1  168400             MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED"          NC1704.2
   001682      1  168500                TO RE-MARK                                        NC1704.2 182
   001683      1  168600             PERFORM FAIL                                         NC1704.2 328
   001684      1  168700             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001685         168800     ADD     1 TO REC-CT.                                         NC1704.2 224
   001686         168900 MPY-TEST-F2-28-4.                                                NC1704.2
   001687         169000     MOVE   "MPY-TEST-F2-28-4" TO PAR-NAME.                       NC1704.2 177
   001688         169100     IF      WRK-DS-02V00 = 0                                     NC1704.2 56
   001689      1  169200             PERFORM PASS                                         NC1704.2 327
   001690      1  169300             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001691         169400     ELSE                                                         NC1704.2
   001692      1  169500             MOVE  WRK-DS-02V00 TO COMPUTED-N                     NC1704.2 56 189
   001693      1  169600             MOVE  0            TO CORRECT-N                      NC1704.2 203
   001694      1  169700             MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED"          NC1704.2
   001695      1  169800                TO RE-MARK                                        NC1704.2 182
   001696      1  169900             PERFORM FAIL                                         NC1704.2 328
   001697      1  170000             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001698         170100     ADD     1 TO REC-CT.                                         NC1704.2 224
   001699         170200 MPY-TEST-F2-28-5.                                                NC1704.2
   001700         170300     MOVE   "MPY-TEST-F2-28-5" TO PAR-NAME.                       NC1704.2 177
   001701         170400     IF      WRK-CS-18V00 = 000000000000000099                    NC1704.2 69
   001702      1  170500             PERFORM PASS                                         NC1704.2 327
   001703      1  170600             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001704         170700     ELSE                                                         NC1704.2
   001705      1  170800             MOVE  WRK-CS-18V00 TO COMPUTED-N                     NC1704.2 69 189
   001706      1  170900             MOVE  99           TO CORRECT-N                      NC1704.2 203
   001707      1  171000             MOVE "SCOPE TERMINATOR IGNORED"                      NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708      1  171100                TO RE-MARK                                        NC1704.2 182
   001709      1  171200             PERFORM FAIL                                         NC1704.2 328
   001710      1  171300             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001711         171400*                                                                 NC1704.2
   001712         171500 MPY-INIT-F2-29.                                                  NC1704.2
   001713         171600*    ==--> EXPLICIT SCOPE TERMINATOR <--==                        NC1704.2
   001714         171700*    ==-->    SIZE ERROR CONDITION   <--==                        NC1704.2
   001715         171800     MOVE   "1V-41 6.4.3"    TO ANSI-REFERENCE.                   NC1704.2 233
   001716         171900     MOVE    "MPY-TEST-F2-29" TO PAR-NAME.                        NC1704.2 177
   001717         172000     MOVE    "A" TO XRAY.                                         NC1704.2 86
   001718         172100     MOVE 80.12  TO MULT1.                                        NC1704.2 143
   001719         172200     MOVE   -56  TO MULT4.                                        NC1704.2 147
   001720         172300     MOVE     4  TO MULT5.                                        NC1704.2 149
   001721         172400     MOVE     1  TO REC-CT.                                       NC1704.2 224
   001722         172500     MOVE     0  TO WRK-DS-10V00.                                 NC1704.2 50
   001723         172600     MOVE     0  TO WRK-DS-02V00.                                 NC1704.2 56
   001724         172700 MPY-TEST-F2-29-0.                                                NC1704.2
   001725         172800     MULTIPLY MULT4 BY MULT1                                      NC1704.2 147 143
   001726         172900       GIVING MULT5                                               NC1704.2 149
   001727         173000       NOT ON SIZE ERROR                                          NC1704.2
   001728      1  173100              MOVE    "H" TO XRAY                                 NC1704.2 86
   001729      1  173200              MOVE    38  TO WRK-DS-10V00                         NC1704.2 50
   001730      1  173300              MOVE   -19  TO WRK-DS-02V00                         NC1704.2 56
   001731         173400     END-MULTIPLY                                                 NC1704.2
   001732         173500     MOVE    99 TO WRK-CS-18V00.                                  NC1704.2 69
   001733         173600      GO TO MPY-TEST-F2-29-1.                                     NC1704.2 1738
   001734         173700 MPY-DELETE-F2-29-1.                                              NC1704.2
   001735         173800     PERFORM DE-LETE.                                             NC1704.2 329
   001736         173900     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001737         174000     GO TO   MPY-INIT-F2-30.                                      NC1704.2 1803
   001738         174100 MPY-TEST-F2-29-1.                                                NC1704.2
   001739         174200     MOVE    "MPY-TEST-F2-29-1" TO PAR-NAME.                      NC1704.2 177
   001740         174300     IF      XRAY    = "A"                                        NC1704.2 86
   001741      1  174400             PERFORM PASS                                         NC1704.2 327
   001742      1  174500             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001743         174600     ELSE                                                         NC1704.2
   001744      1  174700             MOVE    XRAY   TO COMPUTED-X                         NC1704.2 86 187
   001745      1  174800             MOVE   "A"     TO CORRECT-X                          NC1704.2 201
   001746      1  174900             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1704.2
   001747      1  175000                  TO RE-MARK                                      NC1704.2 182
   001748      1  175100             PERFORM FAIL                                         NC1704.2 328
   001749      1  175200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001750         175300     ADD     1 TO REC-CT.                                         NC1704.2 224
   001751         175400 MPY-TEST-F2-29-2.                                                NC1704.2
   001752         175500     MOVE   "MPY-TEST-F2-29-2" TO PAR-NAME.                       NC1704.2 177
   001753         175600     IF      WRK-DS-10V00 = 0                                     NC1704.2 50
   001754      1  175700             PERFORM PASS                                         NC1704.2 327
   001755      1  175800             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001756         175900     ELSE                                                         NC1704.2
   001757      1  176000             MOVE   WRK-DS-10V00 TO COMPUTED-N                    NC1704.2 50 189
   001758      1  176100             MOVE   0            TO CORRECT-N                     NC1704.2 203
   001759      1  176200             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1704.2
   001760      1  176300                  TO RE-MARK                                      NC1704.2 182
   001761      1  176400             PERFORM FAIL                                         NC1704.2 328
   001762      1  176500             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001763         176600     ADD     1 TO REC-CT.                                         NC1704.2 224
   001764         176700 MPY-TEST-F2-29-3.                                                NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800     MOVE   "MPY-TEST-F2-29-3" TO PAR-NAME.                       NC1704.2 177
   001766         176900     IF      WRK-DS-02V00 = 0                                     NC1704.2 56
   001767      1  177000             PERFORM PASS                                         NC1704.2 327
   001768      1  177100             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001769         177200     ELSE                                                         NC1704.2
   001770      1  177300             MOVE   WRK-DS-02V00 TO COMPUTED-N                    NC1704.2 56 189
   001771      1  177400             MOVE   0            TO CORRECT-N                     NC1704.2 203
   001772      1  177500             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1704.2
   001773      1  177600                  TO RE-MARK                                      NC1704.2 182
   001774      1  177700             PERFORM FAIL                                         NC1704.2 328
   001775      1  177800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001776         177900     ADD     1 TO REC-CT.                                         NC1704.2 224
   001777         178000 MPY-TEST-F2-29-4.                                                NC1704.2
   001778         178100     MOVE   "MPY-TEST-F2-29-4" TO PAR-NAME.                       NC1704.2 177
   001779         178200     IF      WRK-CS-18V00 = 000000000000000099                    NC1704.2 69
   001780      1  178300             PERFORM PASS                                         NC1704.2 327
   001781      1  178400             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001782         178500     ELSE                                                         NC1704.2
   001783      1  178600             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1704.2 69 189
   001784      1  178700             MOVE    99           TO CORRECT-N                    NC1704.2 203
   001785      1  178800             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1704.2
   001786      1  178900                  TO RE-MARK                                      NC1704.2 182
   001787      1  179000             PERFORM FAIL                                         NC1704.2 328
   001788      1  179100             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001789         179200     ADD     1 TO REC-CT.                                         NC1704.2 224
   001790         179300 MPY-TEST-F2-29-5.                                                NC1704.2
   001791         179400     MOVE   "MPY-TEST-F2-29-5" TO PAR-NAME.                       NC1704.2 177
   001792         179500     IF      MULT5   = 4                                          NC1704.2 149
   001793      1  179600             PERFORM PASS                                         NC1704.2 327
   001794      1  179700             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001795         179800     ELSE                                                         NC1704.2
   001796      1  179900             MOVE   MULT5  TO COMPUTED-N                          NC1704.2 149 189
   001797      1  180000             MOVE   4      TO CORRECT-N                           NC1704.2 203
   001798      1  180100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1704.2
   001799      1  180200                  TO RE-MARK                                      NC1704.2 182
   001800      1  180300             PERFORM FAIL                                         NC1704.2 328
   001801      1  180400             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001802         180500*                                                                 NC1704.2
   001803         180600 MPY-INIT-F2-30.                                                  NC1704.2
   001804         180700*    ==--> EXPLICIT SCOPE TERMINATOR <--==                        NC1704.2
   001805         180800*    ==-->  NO SIZE ERROR CONDITION  <--==                        NC1704.2
   001806         180900     MOVE   "MPY-TEST-F2-30" TO PAR-NAME                          NC1704.2 177
   001807         181000     MOVE   "1V-41 6.4.3"    TO ANSI-REFERENCE.                   NC1704.2 233
   001808         181100     MOVE   "1"   TO WRK-XN-00001.                                NC1704.2 51
   001809         181200     MOVE    0    TO WRK-DS-05V00.                                NC1704.2 82
   001810         181300     MOVE    0    TO WRK-DS-02V00.                                NC1704.2 56
   001811         181400     MOVE    0    TO WRK-DS-10V00.                                NC1704.2 50
   001812         181500     MOVE    1    TO REC-CT.                                      NC1704.2 224
   001813         181600 MPY-TEST-F2-30-0.                                                NC1704.2
   001814         181700     MULTIPLY A01ONE-DS-P0801 BY A12ONES-DS-12V00                 NC1704.2 63 61
   001815         181800       GIVING WRK-DS-10V00                                        NC1704.2 50
   001816         181900       NOT ON SIZE ERROR                                          NC1704.2
   001817      1  182000              MOVE "0" TO WRK-XN-00001                            NC1704.2 51
   001818      1  182100              MOVE  38 TO WRK-DS-05V00                            NC1704.2 82
   001819      1  182200              MOVE -19 TO WRK-DS-02V00                            NC1704.2 56
   001820         182300     END-MULTIPLY                                                 NC1704.2
   001821         182400     MOVE    99 TO WRK-CS-18V00.                                  NC1704.2 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182500     GO TO   MPY-TEST-F2-30-1.                                    NC1704.2 1827
   001823         182600 MPY-DELETE-F2-30-1.                                              NC1704.2
   001824         182700     PERFORM DE-LETE.                                             NC1704.2 329
   001825         182800     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001826         182900     GO TO   MPY-INIT-F2-31.                                      NC1704.2 1891
   001827         183000 MPY-TEST-F2-30-1.                                                NC1704.2
   001828         183100     MOVE   "MPY-TEST-F2-30-1" TO PAR-NAME.                       NC1704.2 177
   001829         183200     IF      WRK-XN-00001 = "0"                                   NC1704.2 51
   001830      1  183300             PERFORM PASS                                         NC1704.2 327
   001831      1  183400             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001832         183500     ELSE                                                         NC1704.2
   001833      1  183600             MOVE  WRK-XN-00001 TO COMPUTED-X                     NC1704.2 51 187
   001834      1  183700             MOVE "0"           TO CORRECT-X                      NC1704.2 201
   001835      1  183800             MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED"          NC1704.2
   001836      1  183900                TO RE-MARK                                        NC1704.2 182
   001837      1  184000             PERFORM FAIL                                         NC1704.2 328
   001838      1  184100             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001839         184200     ADD     1 TO REC-CT.                                         NC1704.2 224
   001840         184300 MPY-TEST-F2-30-2.                                                NC1704.2
   001841         184400     MOVE   "MPY-TEST-F2-30-2" TO PAR-NAME.                       NC1704.2 177
   001842         184500     IF      WRK-DS-10V00 = 0000000111                            NC1704.2 50
   001843      1  184600             PERFORM PASS                                         NC1704.2 327
   001844      1  184700             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001845         184800     ELSE                                                         NC1704.2
   001846      1  184900             MOVE  WRK-DS-10V00 TO COMPUTED-N                     NC1704.2 50 189
   001847      1  185000             MOVE  28           TO CORRECT-N                      NC1704.2 203
   001848      1  185100             MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK     NC1704.2 182
   001849      1  185200             PERFORM FAIL                                         NC1704.2 328
   001850      1  185300             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001851         185400     ADD     1 TO REC-CT.                                         NC1704.2 224
   001852         185500 MPY-TEST-F2-30-3.                                                NC1704.2
   001853         185600     MOVE   "MPY-TEST-F2-30-3" TO PAR-NAME.                       NC1704.2 177
   001854         185700     IF      WRK-DS-05V00 = 38                                    NC1704.2 82
   001855      1  185800             PERFORM PASS                                         NC1704.2 327
   001856      1  185900             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001857         186000     ELSE                                                         NC1704.2
   001858      1  186100             MOVE  WRK-DS-05V00 TO COMPUTED-N                     NC1704.2 82 189
   001859      1  186200             MOVE  38           TO CORRECT-N                      NC1704.2 203
   001860      1  186300             MOVE "SIZE ERROR SHOULD HAVE OCCURRED"               NC1704.2
   001861      1  186400                TO RE-MARK                                        NC1704.2 182
   001862      1  186500             PERFORM FAIL                                         NC1704.2 328
   001863      1  186600             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001864         186700     ADD     1 TO REC-CT.                                         NC1704.2 224
   001865         186800 MPY-TEST-F2-30-4.                                                NC1704.2
   001866         186900     MOVE   "MPY-TEST-F2-30-4" TO PAR-NAME.                       NC1704.2 177
   001867         187000     IF      WRK-DS-02V00 = -19                                   NC1704.2 56
   001868      1  187100             PERFORM PASS                                         NC1704.2 327
   001869      1  187200             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001870         187300     ELSE                                                         NC1704.2
   001871      1  187400             MOVE  WRK-DS-02V00 TO COMPUTED-N                     NC1704.2 56 189
   001872      1  187500             MOVE  -19          TO CORRECT-N                      NC1704.2 203
   001873      1  187600             MOVE "SIZE ERROR SHOULD HAVE OCCURRED"               NC1704.2
   001874      1  187700                TO RE-MARK                                        NC1704.2 182
   001875      1  187800             PERFORM FAIL                                         NC1704.2 328
   001876      1  187900             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001877         188000     ADD     1 TO REC-CT.                                         NC1704.2 224
   001878         188100 MPY-TEST-F2-30-5.                                                NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200     MOVE   "MPY-TEST-F2-30-5" TO PAR-NAME.                       NC1704.2 177
   001880         188300     IF      WRK-CS-18V00 = 000000000000000099                    NC1704.2 69
   001881      1  188400             PERFORM PASS                                         NC1704.2 327
   001882      1  188500             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001883         188600     ELSE                                                         NC1704.2
   001884      1  188700             MOVE  WRK-CS-18V00 TO COMPUTED-N                     NC1704.2 69 189
   001885      1  188800             MOVE  99           TO CORRECT-N                      NC1704.2 203
   001886      1  188900             MOVE "SCOPE TERMINATOR IGNORED"                      NC1704.2
   001887      1  189000                TO RE-MARK                                        NC1704.2 182
   001888      1  189100             PERFORM FAIL                                         NC1704.2 328
   001889      1  189200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001890         189300*                                                                 NC1704.2
   001891         189400 MPY-INIT-F2-31.                                                  NC1704.2
   001892         189500*    ==--> EXPLICIT SCOPE TERMINATOR <--==                        NC1704.2
   001893         189600*    ==-->  NO SIZE ERROR CONDITION  <--==                        NC1704.2
   001894         189700     MOVE   "1V-41 6.4.3"    TO ANSI-REFERENCE.                   NC1704.2 233
   001895         189800     MOVE   "MPY-TEST-F2-31" TO PAR-NAME                          NC1704.2 177
   001896         189900     MOVE 80.12  TO MULT1.                                        NC1704.2 143
   001897         190000     MOVE   -56  TO MULT4.                                        NC1704.2 147
   001898         190100     MOVE     4  TO MULT5.                                        NC1704.2 149
   001899         190200     MOVE     1  TO REC-CT.                                       NC1704.2 224
   001900         190300     MOVE    "A" TO XRAY.                                         NC1704.2 86
   001901         190400 MPY-TEST-F2-31-0.                                                NC1704.2
   001902         190500     MULTIPLY MULT4 BY MULT1                                      NC1704.2 147 143
   001903         190600       GIVING MULT5                                               NC1704.2 149
   001904         190700           ON SIZE ERROR                                          NC1704.2
   001905      1  190800              MOVE    "B" TO XRAY                                 NC1704.2 86
   001906         190900       NOT ON SIZE ERROR                                          NC1704.2
   001907      1  191000              MOVE    "C" TO XRAY                                 NC1704.2 86
   001908         191100     END-MULTIPLY                                                 NC1704.2
   001909         191200     MOVE    99 TO WRK-CS-18V00.                                  NC1704.2 69
   001910         191300      GO TO MPY-TEST-F2-31-1.                                     NC1704.2 1915
   001911         191400 MPY-DELETE-F2-31-1.                                              NC1704.2
   001912         191500     PERFORM DE-LETE.                                             NC1704.2 329
   001913         191600     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001914         191700     GO TO    MPY-INIT-F2-32.                                     NC1704.2 1951
   001915         191800 MPY-TEST-F2-31-1.                                                NC1704.2
   001916         191900     MOVE   "MPY-TEST-F2-31-1" TO PAR-NAME.                       NC1704.2 177
   001917         192000     IF      XRAY    = "B"                                        NC1704.2 86
   001918      1  192100             PERFORM PASS                                         NC1704.2 327
   001919      1  192200             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001920         192300     ELSE                                                         NC1704.2
   001921      1  192400             MOVE    XRAY  TO COMPUTED-X                          NC1704.2 86 187
   001922      1  192500             MOVE   "B"    TO CORRECT-X                           NC1704.2 201
   001923      1  192600             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
   001924      1  192700             PERFORM FAIL                                         NC1704.2 328
   001925      1  192800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001926         192900     ADD     1 TO REC-CT.                                         NC1704.2 224
   001927         193000 MPY-TEST-F2-31-2.                                                NC1704.2
   001928         193100     MOVE   "MPY-TEST-F2-31-2" TO PAR-NAME.                       NC1704.2 177
   001929         193200     IF      MULT5   = 4                                          NC1704.2 149
   001930      1  193300             PERFORM PASS                                         NC1704.2 327
   001931      1  193400             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001932         193500     ELSE                                                         NC1704.2
   001933      1  193600             MOVE    MULT5 TO COMPUTED-N                          NC1704.2 149 189
   001934      1  193700             MOVE    4     TO CORRECT-N                           NC1704.2 203
   001935      1  193800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1704.2 182
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936      1  193900             PERFORM FAIL                                         NC1704.2 328
   001937      1  194000             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001938         194100     ADD     1 TO REC-CT.                                         NC1704.2 224
   001939         194200 MPY-TEST-F2-31-3.                                                NC1704.2
   001940         194300     MOVE   "MPY-TEST-F2-31-3" TO PAR-NAME.                       NC1704.2 177
   001941         194400     IF      WRK-CS-18V00 = 000000000000000099                    NC1704.2 69
   001942      1  194500             PERFORM PASS                                         NC1704.2 327
   001943      1  194600             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001944         194700     ELSE                                                         NC1704.2
   001945      1  194800             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1704.2 69 189
   001946      1  194900             MOVE    99           TO CORRECT-N                    NC1704.2 203
   001947      1  195000             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1704.2 182
   001948      1  195100             PERFORM FAIL                                         NC1704.2 328
   001949      1  195200             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001950         195300*                                                                 NC1704.2
   001951         195400 MPY-INIT-F2-32.                                                  NC1704.2
   001952         195500*    ==--> EXPLICIT SCOPE TERMINATOR <--==                        NC1704.2
   001953         195600     MOVE   "1V-41 6.4.3"    TO ANSI-REFERENCE.                   NC1704.2 233
   001954         195700     MOVE   "MPY-TEST-F2-32" TO PAR-NAME                          NC1704.2 177
   001955         195800     MOVE   "0"   TO WRK-XN-00001.                                NC1704.2 51
   001956         195900     MOVE    0    TO WRK-DS-10V00.                                NC1704.2 50
   001957         196000     MOVE    1    TO REC-CT.                                      NC1704.2 224
   001958         196100 MPY-TEST-F2-32-0.                                                NC1704.2
   001959         196200     MULTIPLY A01ONE-DS-P0801 BY A12ONES-DS-12V00                 NC1704.2 63 61
   001960         196300       GIVING WRK-DS-10V00                                        NC1704.2 50
   001961         196400           ON SIZE ERROR                                          NC1704.2
   001962      1  196500              MOVE "1" TO WRK-XN-00001                            NC1704.2 51
   001963         196600       NOT ON SIZE ERROR                                          NC1704.2
   001964      1  196700              MOVE "2" TO WRK-XN-00001                            NC1704.2 51
   001965         196800     END-MULTIPLY                                                 NC1704.2
   001966         196900     MOVE    99 TO WRK-CS-18V00.                                  NC1704.2 69
   001967         197000     GO TO   MPY-TEST-F2-32-1.                                    NC1704.2 1972
   001968         197100 MPY-DELETE-F2-32-1.                                              NC1704.2
   001969         197200     PERFORM DE-LETE.                                             NC1704.2 329
   001970         197300     PERFORM PRINT-DETAIL.                                        NC1704.2 331
   001971         197400     GO TO   CCVS-EXIT.                                           NC1704.2 2010
   001972         197500 MPY-TEST-F2-32-1.                                                NC1704.2
   001973         197600     MOVE   "MPY-TEST-F2-32-1" TO PAR-NAME.                       NC1704.2 177
   001974         197700     IF      WRK-DS-10V00 = 0000000111                            NC1704.2 50
   001975      1  197800             PERFORM PASS                                         NC1704.2 327
   001976      1  197900             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001977         198000     ELSE                                                         NC1704.2
   001978      1  198100             MOVE    0000000111       TO CORRECT-18V0             NC1704.2 208
   001979      1  198200             MOVE    WRK-DS-10V00     TO COMPUTED-18V0            NC1704.2 50 195
   001980      1  198300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1704.2 182
   001981      1  198400             PERFORM FAIL                                         NC1704.2 328
   001982      1  198500             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001983         198600     ADD     1 TO REC-CT.                                         NC1704.2 224
   001984         198700 MPY-TEST-F2-32-2.                                                NC1704.2
   001985         198800     MOVE   "MPY-TEST-F2-32-2" TO PAR-NAME.                       NC1704.2 177
   001986         198900     IF      WRK-XN-00001 = "2"                                   NC1704.2 51
   001987      1  199000             PERFORM PASS                                         NC1704.2 327
   001988      1  199100             PERFORM PRINT-DETAIL                                 NC1704.2 331
   001989         199200     ELSE                                                         NC1704.2
   001990      1  199300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1704.2 51 187
   001991      1  199400             MOVE   "2"           TO CORRECT-X                    NC1704.2 201
   001992      1  199500             MOVE   "SIZE ERROR SHOULD NOT BE EXECUTED"           NC1704.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993      1  199600                  TO RE-MARK                                      NC1704.2 182
   001994      1  199700             PERFORM FAIL                                         NC1704.2 328
   001995      1  199800             PERFORM PRINT-DETAIL.                                NC1704.2 331
   001996         199900     ADD     1 TO REC-CT.                                         NC1704.2 224
   001997         200000 MPY-TEST-F2-32-3.                                                NC1704.2
   001998         200100     MOVE   "MPY-TEST-F2-32-3" TO PAR-NAME.                       NC1704.2 177
   001999         200200     IF      WRK-CS-18V00 = 000000000000000099                    NC1704.2 69
   002000      1  200300             PERFORM PASS                                         NC1704.2 327
   002001      1  200400             PERFORM PRINT-DETAIL                                 NC1704.2 331
   002002         200500     ELSE                                                         NC1704.2
   002003      1  200600             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1704.2 69 189
   002004      1  200700             MOVE    99           TO CORRECT-N                    NC1704.2 203
   002005      1  200800             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1704.2 182
   002006      1  200900             PERFORM FAIL                                         NC1704.2 328
   002007      1  201000             PERFORM PRINT-DETAIL.                                NC1704.2 331
   002008         201100*                                                                 NC1704.2
   002009         201200*                                                                 NC1704.2
   002010         201300 CCVS-EXIT SECTION.                                               NC1704.2
   002011         201400 CCVS-999999.                                                     NC1704.2
   002012         201500     GO TO CLOSE-FILES.                                           NC1704.2 320
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    39
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      233   ANSI-REFERENCE . . . . . . . .  410 417 426 M435 M458 M480 M523 M567 M589 M611 M651 M689 M727 M763 M783 M803
                                            M823 M843 M865 M907 M950 M994 M1036 M1088 M1164 M1239 M1314 M1390 M1468 M1542
                                            M1627 M1715 M1807 M1894 M1953
       57   AZERO-DS-05V05
       73   A01ONE-CS-00V01. . . . . . . .  766
       63   A01ONE-DS-P0801. . . . . . . .  655 731 912 998 1635 1814 1959
      132   A01ONES-CS-18V00 . . . . . . .  786 846
      134   A02THREES-CS-18V00 . . . . . .  786 806 826
       83   A02TWOS-DS-03V02
       81   A02TWOS-DU-02V00
       60   A05ONES-DS-00V05 . . . . . . .  615
       46   A06THREES-DS-03V03 . . . . . .  570 592 592
       49   A08TWOS-DS-02V06
       52   A10ONES-DS-10V00 . . . . . . .  693
       61   A12ONES-DS-12V00 . . . . . . .  615 655 912 998 1635 1814 1959
       54   A12THREES-DS-06V06 . . . . . .  570
      140   A14TWOS-CU-18V00 . . . . . . .  806
      138   A16NINES-CU-18V00. . . . . . .  826
       79   A18ONES-DS-09V09
       66   A18ONES-DS-18V00 . . . . . . .  731
      136   A18SIXES-CU-18V00. . . . . . .  846
       71   A99-CS-02V00 . . . . . . . . .  766
       75   A99-DS-02V00
       85   A990-DS-0201P
      212   CCVS-C-1 . . . . . . . . . . .  349 395
      217   CCVS-C-2 . . . . . . . . . . .  350 396
      267   CCVS-E-1 . . . . . . . . . . .  355
      272   CCVS-E-2 . . . . . . . . . . .  364 371 378 383
      275   CCVS-E-2-2 . . . . . . . . . .  M363
      280   CCVS-E-3 . . . . . . . . . . .  384
      289   CCVS-E-4 . . . . . . . . . . .  363
      290   CCVS-E-4-1 . . . . . . . . . .  M361
      292   CCVS-E-4-2 . . . . . . . . . .  M362
      234   CCVS-H-1 . . . . . . . . . . .  344 391
      239   CCVS-H-2A. . . . . . . . . . .  345 392
      248   CCVS-H-2B. . . . . . . . . . .  346 393
      260   CCVS-H-3 . . . . . . . . . . .  347 394
      310   CCVS-PGM-ID. . . . . . . . . .  316 316
      194   CM-18V0
      188   COMPUTED-A . . . . . . . . . .  189 191 192 193 194 422 425 M473 M640 M678 M716 M752 M1075 M1081 M1140 M1146
                                            M1216 M1222 M1291 M1297 M1367 M1373 M1443 M1449 M1520 M1526
      189   COMPUTED-N . . . . . . . . . .  M451 M515 M558 M898 M984 M1057 M1063 M1069 M1117 M1127 M1134 M1193 M1203 M1210
                                            M1268 M1278 M1285 M1344 M1354 M1361 M1420 M1430 M1437 M1497 M1507 M1514 M1583
                                            M1595 M1607 M1619 M1667 M1679 M1692 M1705 M1757 M1770 M1783 M1796 M1846 M1858
                                            M1871 M1884 M1933 M1945 M2003
      187   COMPUTED-X . . . . . . . . . .  M339 407 M498 M540 M886 M928 M972 M1014 M1155 M1231 M1306 M1382 M1458 M1535 M1571
                                            M1654 M1744 M1833 M1921 M1990
      191   COMPUTED-0V18
      193   COMPUTED-14V4
      195   COMPUTED-18V0. . . . . . . . .  M582 M604 M629 M668 M701 M739 M773 M793 M813 M833 M853 M942 M1028 M1979
      192   COMPUTED-4V14
      211   COR-ANSI-REFERENCE . . . . . .  M417 M419
      202   CORRECT-A. . . . . . . . . . .  203 204 205 206 207 423 425 M474 M639 M677 M715 M751 M1076 M1082 M1141 M1147
                                            M1217 M1223 M1292 M1298 M1368 M1374 M1444 M1450 M1521 M1527
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    40
0 Defined   Cross-reference of data names   References

0     203   CORRECT-N. . . . . . . . . . .  M452 M516 M559 M899 M985 M1058 M1064 M1070 M1118 M1128 M1135 M1194 M1204 M1211
                                            M1269 M1279 M1286 M1345 M1355 M1362 M1421 M1431 M1438 M1498 M1508 M1515 M1584
                                            M1596 M1608 M1620 M1668 M1680 M1693 M1706 M1758 M1771 M1784 M1797 M1847 M1859
                                            M1872 M1885 M1934 M1946 M2004
      201   CORRECT-X. . . . . . . . . . .  M340 409 M499 M541 M887 M929 M973 M1015 M1156 M1232 M1307 M1383 M1459 M1536 M1572
                                            M1655 M1745 M1834 M1922 M1991
      204   CORRECT-0V18
      206   CORRECT-14V4
      208   CORRECT-18V0 . . . . . . . . .  M581 M603 M628 M667 M700 M738 M772 M792 M812 M832 M852 M941 M1027 M1978
      205   CORRECT-4V14
      207   CR-18V0
      225   DELETE-COUNTER . . . . . . . .  M329 358 374 376
      167   DIV-DATA-2
      161   DIV-02LEVEL-1
      152   DIVIDE-DATA
      153   DIV1
      170   DIV10
      155   DIV2
      157   DIV3
      159   DIV4
      162   DIV5
      164   DIV6
      165   DIV7
      168   DIV8
      169   DIV9
      180   DOTVALUE . . . . . . . . . . .  M334
      231   DUMMY-HOLD . . . . . . . . . .  M388 398
       43   DUMMY-RECORD . . . . . . . . .  M344 M345 M346 M347 M349 M350 M351 M353 M355 M364 M371 M378 M383 M384 388 M389
                                            390 M391 M392 M393 M394 M395 M396 M397 M398 402 M403 M412 M427
      278   ENDER-DESC . . . . . . . . . .  M366 M377 M382
      226   ERROR-COUNTER. . . . . . . . .  M328 357 367 370
      230   ERROR-HOLD . . . . . . . . . .  M357 M358 M358 M359 362
      276   ERROR-TOTAL. . . . . . . . . .  M368 M370 M375 M376 M380 M381
      173   FEATURE. . . . . . . . . . . .  M436
      304   HYPHEN-LINE. . . . . . . . . .  351 353 397
      270   ID-AGAIN . . . . . . . . . . .  M316
      303   INF-ANSI-REFERENCE . . . . . .  M410 M413 M426 M428
      298   INFO-TEXT. . . . . . . . . . .  M411
      227   INSPECT-COUNTER. . . . . . . .  M326 357 379 381
      142   MULTIPLY-DATA
      143   MULT1. . . . . . . . . . . . .  M437 440 M459 462 M481 486 M524 M867 872 M952 957 M1545 1552 M1718 1725 M1896
                                            1902
      145   MULT2. . . . . . . . . . . . .  M438 M440 442 451
      146   MULT3. . . . . . . . . . . . .  M460 M462 464 473
      147   MULT4. . . . . . . . . . . . .  M482 486 M868 872 M953 957 M1546 1552 M1719 1725 M1897 1902
      149   MULT5. . . . . . . . . . . . .  M483 M486 506 515 M526 M528 548 558 M560 M869 M872 894 898 M954 M957 980 984
                                            M1547 M1553 1615 1619 M1720 M1726 1792 1796 M1898 M1903 1929 1933
      150   MULT6
      175   P-OR-F . . . . . . . . . . . .  M326 M327 M328 M329 336 M339
      177   PAR-NAME . . . . . . . . . . .  M341 M454 M476 M503 M519 M545 M563 M585 M607 M633 M647 M671 M685 M708 M723 M745
                                            M759 M779 M799 M819 M839 M859 M881 M893 M923 M936 M967 M979 M1009 M1022 M1037
                                            M1089 M1163 M1240 M1315 M1391 M1467 M1543 M1566 M1578 M1590 M1602 M1614 M1628
                                            M1649 M1662 M1674 M1687 M1700 M1716 M1739 M1752 M1765 M1778 M1791 M1806 M1828
                                            M1841 M1853 M1866 M1879 M1895 M1916 M1928 M1940 M1954 M1973 M1985 M1998
      179   PARDOT-X . . . . . . . . . . .  M333
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    41
0 Defined   Cross-reference of data names   References

0     228   PASS-COUNTER . . . . . . . . .  M327 359 361
       41   PRINT-FILE . . . . . . . . . .  37 315 321
       42   PRINT-REC. . . . . . . . . . .  M335 M416 M418
      182   RE-MARK. . . . . . . . . . . .  M330 M342 M500 M517 M542 M561 M630 M641 M679 M702 M717 M753 M888 M900 M931 M943
                                            M974 M986 M1017 M1029 M1154 M1230 M1305 M1381 M1457 M1534 M1573 M1585 M1597 M1609
                                            M1621 M1657 M1669 M1682 M1695 M1708 M1747 M1760 M1773 M1786 M1799 M1836 M1848
                                            M1861 M1874 M1887 M1923 M1935 M1947 M1980 M1993 M2005
      224   REC-CT . . . . . . . . . . . .  332 334 341 M870 M891 M910 M934 M951 M977 M993 M1020 M1045 M1059 M1065 M1071
                                            M1077 M1097 M1120 M1130 M1136 M1142 M1148 M1172 M1196 M1206 M1212 M1218 M1224
                                            M1242 M1271 M1281 M1287 M1293 M1299 M1323 M1347 M1357 M1363 M1369 M1375 M1393
                                            M1423 M1433 M1439 M1445 M1451 M1471 M1500 M1510 M1516 M1522 M1528 M1550 M1576
                                            M1588 M1600 M1612 M1633 M1660 M1672 M1685 M1698 M1721 M1750 M1763 M1776 M1789
                                            M1812 M1839 M1851 M1864 M1877 M1899 M1926 M1938 M1957 M1983 M1996
      223   REC-SKL-SUB
      232   RECORD-COUNT . . . . . . . . .  M386 387 M399
      183   TEST-COMPUTED. . . . . . . . .  416
      198   TEST-CORRECT . . . . . . . . .  418
      251   TEST-ID. . . . . . . . . . . .  M316
      171   TEST-RESULTS . . . . . . . . .  M317 335
      229   TOTAL-ERROR
       88   WRK-AN-X-18-1
       84   WRK-CS-02V02 . . . . . . . . .  M764 M766 768
       69   WRK-CS-18V00 . . . . . . . . .  M784 M787 789 793 M824 M827 829 833 M1559 1603 1607 M1642 1701 1705 M1732 1779
                                            1783 M1821 1880 1884 M1909 1941 1945 M1966 1999 2003
       77   WRK-DS-01V00
       56   WRK-DS-02V00 . . . . . . . . .  M1549 M1557 1591 1595 M1631 M1640 1688 1692 M1723 M1730 1766 1770 M1810 M1819
                                            1867 1871
       68   WRK-DS-0201P
       78   WRK-DS-03V10
       82   WRK-DS-05V00 . . . . . . . . .  M1630 M1639 1675 1679 M1809 M1818 1854 1858
       47   WRK-DS-06V06 . . . . . . . . .  48 M768
       64   WRK-DS-09V08 . . . . . . . . .  65 M729 M732
       58   WRK-DS-09V09 . . . . . . . . .  59 M568 M571
      119   WRK-DS-1V0-1
      120   WRK-DS-1V0-2
      121   WRK-DS-1V2-1
       50   WRK-DS-10V00 . . . . . . . . .  M590 M593 595 604 M613 M616 620 629 M653 M656 659 668 M691 M694 697 701 M909
                                            M913 937 942 M996 M999 1023 1028 M1548 M1556 1579 1583 M1632 M1636 1663 1667
                                            M1722 M1729 1753 1757 M1811 M1815 1842 1846 M1956 M1960 1974 1979
       76   WRK-DS-12V00
       48   WRK-DS-12V00-S . . . . . . . .  769 773
      126   WRK-DS-16V2-1
       65   WRK-DS-17V00-S . . . . . . . .  735 739
       45   WRK-DS-18V00
       59   WRK-DS-18V00-S . . . . . . . .  573 582
      122   WRK-DS-2V0-1
      123   WRK-DS-2V1-1
      124   WRK-DS-2V2-1
      125   WRK-DS-2V2-2
       89   WRK-DU-X-18V0-1
       90   WRK-DU-0V1-1
       92   WRK-DU-0V12-1
       91   WRK-DU-0V2-1
       93   WRK-DU-1V0-1
       94   WRK-DU-1V1-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    42
0 Defined   Cross-reference of data names   References

0      95   WRK-DU-1V1-2
       99   WRK-DU-1V17-1
       96   WRK-DU-1V3-1
       97   WRK-DU-1V3-2
       98   WRK-DU-1V5-1
      117   WRK-DU-16V2-1
       70   WRK-DU-18V00 . . . . . . . . .  M804 M807 809 813 M844 M847 849 853
      100   WRK-DU-2P6-1
      101   WRK-DU-2V0-1 . . . . . . . . .  M1040 M1047 1055 1057 M1092 M1101 1112 1117 M1167 M1176 1188 1193 M1243 M1251
                                            1263 1268 M1318 M1327 1339 1344 M1394 M1402 1415 1420 M1472 M1479 1492 1497
      102   WRK-DU-2V0-2 . . . . . . . . .  M1041 M1048 1061 1063 M1093 M1102 1122 1127 M1168 M1177 1198 1203 M1244 M1252
                                            1273 1278 M1319 M1328 1349 1354 M1395 M1403 1425 1430 M1480 1502 1507
      103   WRK-DU-2V0-3
      104   WRK-DU-2V1-1
      105   WRK-DU-2V1-2
      106   WRK-DU-2V1-3
      107   WRK-DU-2V2-1
      108   WRK-DU-2V2-2
      109   WRK-DU-2V2-3
      110   WRK-DU-2V2-4
      111   WRK-DU-2V2-5
      112   WRK-DU-2V5-1 . . . . . . . . .  M1042 M1048 1067 1069 M1094 M1103 1132 1134 M1169 M1178 1208 1210 M1245 M1253
                                            1283 1285 M1320 M1329 1359 1361 M1396 M1404 1435 1437 M1473 M1481 1512 1514
      113   WRK-DU-4P1-1 . . . . . . . . .  M1039 1047 M1091 M1166 1175 M1317 1326 M1470 1478
      114   WRK-DU-5V1-1
      115   WRK-DU-6V0-1 . . . . . . . . .  M1038 1047 M1090 1100 1100 M1165 1175 M1241 1250 1250 M1316 1326 M1392 1401 1401
                                            M1469 1478
      116   WRK-DU-6V0-2 . . . . . . . . .  1382 1458 1535
      118   WRK-NE-X-1
      127   WRK-NE-X-2
      128   WRK-NE-1
      129   WRK-NE-2 . . . . . . . . . . .  M1043 M1048 1073 1075 M1095 M1104 1138 1140 M1170 M1179 1214 1216 M1246 M1254
                                            1289 1291 M1321 M1330 1365 1367 M1397 M1405 1441 1443 M1474 M1482 1518 1520
      130   WRK-NE-3 . . . . . . . . . . .  M1044 M1049 1079 1081 M1096 M1105 1144 1146 M1171 M1180 1220 1222 M1247 M1255
                                            1295 1297 M1322 M1331 1371 1373 M1398 M1406 1447 1449 M1475 M1483 1524 1526
      131   WRK-NE-4
       51   WRK-XN-00001 . . . . . . . . .  M612 M618 636 640 M652 M657 674 678 M690 M695 711 716 M728 M733 748 752 M908
                                            M915 924 928 M995 M1000 M1001 1010 1014 M1098 M1106 1150 1155 M1173 M1181 1226
                                            1231 M1248 M1256 1301 1306 M1324 M1332 1377 M1399 M1407 M1408 1453 M1476 M1484
                                            M1485 1530 M1629 M1638 1650 1654 M1808 M1817 1829 1833 M1955 M1962 M1964 1986
                                            1990
       87   WRK-XN-18-1. . . . . . . . . .  88 89
       86   XRAY . . . . . . . . . . . . .  M484 M487 489 498 M525 M529 531 540 M866 M873 882 886 M955 M958 M959 968 972
                                            M1544 M1555 1567 1571 M1717 M1728 1740 1744 M1900 M1905 M1907 1917 1921
      300   XXCOMPUTED . . . . . . . . . .  M425
      302   XXCORRECT. . . . . . . . . . .  M425
      295   XXINFO . . . . . . . . . . . .  412 427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    43
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

      421   BAIL-OUT . . . . . . . . . . .  P338
      429   BAIL-OUT-EX. . . . . . . . . .  E338 G423
      424   BAIL-OUT-WRITE . . . . . . . .  G422
      404   BLANK-LINE-PRINT
     2010   CCVS-EXIT. . . . . . . . . . .  G1971
     2011   CCVS-999999
      313   CCVS1
      430   CCVS1-EXIT . . . . . . . . . .  G319
      320   CLOSE-FILES. . . . . . . . . .  G2012
      348   COLUMN-NAMES-ROUTINE . . . . .  E318
      329   DE-LETE. . . . . . . . . . . .  P447 P469 P495 P511 P537 P554 P578 P600 P625 P645 P664 P683 P706 P721 P743 P757
                                            P777 P797 P817 P837 P857 P877 P919 P963 P1005 P1052 P1109 P1184 P1259 P1335 P1411
                                            P1488 P1562 P1645 P1735 P1824 P1912 P1969
      352   END-ROUTINE. . . . . . . . . .  P321
      356   END-ROUTINE-1
      365   END-ROUTINE-12
      373   END-ROUTINE-13 . . . . . . . .  E321
      354   END-RTN-EXIT
      328   FAIL . . . . . . . . . . . . .  P450 P472 P501 P514 P543 P557 P583 P605 P631 P642 P669 P680 P703 P718 P740 P754
                                            P774 P794 P814 P834 P854 P889 P901 P932 P944 P975 P987 P1018 P1030 P1057 P1063
                                            P1069 P1075 P1081 P1116 P1126 P1134 P1140 P1146 P1157 P1192 P1202 P1210 P1216
                                            P1222 P1233 P1267 P1277 P1285 P1291 P1297 P1308 P1343 P1353 P1361 P1367 P1373
                                            P1384 P1419 P1429 P1437 P1443 P1449 P1460 P1496 P1506 P1514 P1520 P1526 P1537
                                            P1574 P1586 P1598 P1610 P1622 P1658 P1670 P1683 P1696 P1709 P1748 P1761 P1774
                                            P1787 P1800 P1837 P1849 P1862 P1875 P1888 P1924 P1936 P1948 P1981 P1994 P2006
      406   FAIL-ROUTINE . . . . . . . . .  P337
      420   FAIL-ROUTINE-EX. . . . . . . .  E337 G414
      415   FAIL-ROUTINE-WRITE . . . . . .  G408 G409
      343   HEAD-ROUTINE . . . . . . . . .  P318
      326   INSPT
      446   MPY-DELETE-F2-1-1
      742   MPY-DELETE-F2-10-1
      756   MPY-DELETE-F2-10-2
      776   MPY-DELETE-F2-11
      796   MPY-DELETE-F2-12
      816   MPY-DELETE-F2-13
      836   MPY-DELETE-F2-14
      856   MPY-DELETE-F2-15
      876   MPY-DELETE-F2-16-1
      918   MPY-DELETE-F2-17
      962   MPY-DELETE-F2-18
     1004   MPY-DELETE-F2-19
      468   MPY-DELETE-F2-2-1
     1051   MPY-DELETE-F2-20
     1108   MPY-DELETE-F2-21
     1183   MPY-DELETE-F2-22
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    44
0 Defined   Cross-reference of procedures   References

0    1258   MPY-DELETE-F2-23
     1334   MPY-DELETE-F2-24
     1410   MPY-DELETE-F2-25
     1487   MPY-DELETE-F2-26
     1561   MPY-DELETE-F2-27-1
     1644   MPY-DELETE-F2-28-1
     1734   MPY-DELETE-F2-29-1
      494   MPY-DELETE-F2-3-1
      510   MPY-DELETE-F2-3-2
     1823   MPY-DELETE-F2-30-1
     1911   MPY-DELETE-F2-31-1
     1968   MPY-DELETE-F2-32-1
      536   MPY-DELETE-F2-4-1
      553   MPY-DELETE-F2-4-2
      577   MPY-DELETE-F2-5
      599   MPY-DELETE-F2-6
      624   MPY-DELETE-F2-7-1
      644   MPY-DELETE-F2-7-2
      663   MPY-DELETE-F2-8-1
      682   MPY-DELETE-F2-8-2
      705   MPY-DELETE-F2-9-1
      720   MPY-DELETE-F2-9-2
      449   MPY-FAIL-F2-1-1. . . . . . . .  G443
      471   MPY-FAIL-F2-2-1. . . . . . . .  G465
      497   MPY-FAIL-F2-3-1. . . . . . . .  G492
      513   MPY-FAIL-F2-3-2. . . . . . . .  G507
      539   MPY-FAIL-F2-4-1. . . . . . . .  G532
      556   MPY-FAIL-F2-4-2. . . . . . . .  G551
      580   MPY-FAIL-F2-5. . . . . . . . .  G576
      602   MPY-FAIL-F2-6. . . . . . . . .  G598
      627   MPY-FAIL-F2-7-1. . . . . . . .  G623
      666   MPY-FAIL-F2-8-1. . . . . . . .  G662
      714   MPY-FAIL-F2-9-2
      434   MPY-INIT-F2-1
      726   MPY-INIT-F2-10-1
      762   MPY-INIT-F2-11
      782   MPY-INIT-F2-12
      802   MPY-INIT-F2-13
      822   MPY-INIT-F2-14
      842   MPY-INIT-F2-15
      863   MPY-INIT-F2-16
      905   MPY-INIT-F2-17 . . . . . . . .  G879
      948   MPY-INIT-F2-18 . . . . . . . .  G921
      991   MPY-INIT-F2-19 . . . . . . . .  G965
      457   MPY-INIT-F2-2
     1034   MPY-INIT-F2-20 . . . . . . . .  G1007
     1085   MPY-INIT-F2-21 . . . . . . . .  G1053
     1160   MPY-INIT-F2-22 . . . . . . . .  G1110
     1236   MPY-INIT-F2-23 . . . . . . . .  G1186
     1311   MPY-INIT-F2-24 . . . . . . . .  G1261
     1387   MPY-INIT-F2-25 . . . . . . . .  G1337
     1464   MPY-INIT-F2-26 . . . . . . . .  G1413
     1540   MPY-INIT-F2-27 . . . . . . . .  G1490
     1625   MPY-INIT-F2-28 . . . . . . . .  G1564
     1712   MPY-INIT-F2-29 . . . . . . . .  G1647
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    45
0 Defined   Cross-reference of procedures   References

0     479   MPY-INIT-F2-3
     1803   MPY-INIT-F2-30 . . . . . . . .  G1737
     1891   MPY-INIT-F2-31 . . . . . . . .  G1826
     1951   MPY-INIT-F2-32 . . . . . . . .  G1914
      522   MPY-INIT-F2-4
      566   MPY-INIT-F2-5
      588   MPY-INIT-F2-6
      610   MPY-INIT-F2-7
      650   MPY-INIT-F2-8
      688   MPY-INIT-F2-9
      439   MPY-TEST-F2-1-0
      441   MPY-TEST-F2-1-1
      730   MPY-TEST-F2-10-0
      734   MPY-TEST-F2-10-1
      747   MPY-TEST-F2-10-2
      765   MPY-TEST-F2-11-0
      767   MPY-TEST-F2-11-1
      785   MPY-TEST-F2-12-0
      788   MPY-TEST-F2-12-1
      808   MPY-TEST-F2-13
      805   MPY-TEST-F2-13-0
      828   MPY-TEST-F2-14
      825   MPY-TEST-F2-14-0
      848   MPY-TEST-F2-15
      845   MPY-TEST-F2-15-0
      871   MPY-TEST-F2-16-0
      874   MPY-TEST-F2-16-1
      880   MPY-TEST-F2-16-2 . . . . . . .  G875
      892   MPY-TEST-F2-16-3
      911   MPY-TEST-F2-17-0
      916   MPY-TEST-F2-17-1
      922   MPY-TEST-F2-17-2 . . . . . . .  G917
      935   MPY-TEST-F2-17-3
      956   MPY-TEST-F2-18-0
      960   MPY-TEST-F2-18-1
      966   MPY-TEST-F2-18-2 . . . . . . .  G961
      978   MPY-TEST-F2-18-3
      997   MPY-TEST-F2-19-0
     1002   MPY-TEST-F2-19-1
     1008   MPY-TEST-F2-19-2 . . . . . . .  G1003
     1021   MPY-TEST-F2-19-3
      461   MPY-TEST-F2-2-0
      463   MPY-TEST-F2-2-1
     1046   MPY-TEST-F2-20-0
     1054   MPY-TEST-F2-20-1 . . . . . . .  G1050
     1060   MPY-TEST-F2-20-2
     1066   MPY-TEST-F2-20-3
     1072   MPY-TEST-F2-20-4
     1078   MPY-TEST-F2-20-5
     1099   MPY-TEST-F2-21-0
     1111   MPY-TEST-F2-21-1 . . . . . . .  G1107
     1121   MPY-TEST-F2-21-2
     1131   MPY-TEST-F2-21-3
     1137   MPY-TEST-F2-21-4
     1143   MPY-TEST-F2-21-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    46
0 Defined   Cross-reference of procedures   References

0    1149   MPY-TEST-F2-21-6
     1174   MPY-TEST-F2-22-0
     1187   MPY-TEST-F2-22-1 . . . . . . .  G1182
     1197   MPY-TEST-F2-22-2
     1207   MPY-TEST-F2-22-3
     1213   MPY-TEST-F2-22-4
     1219   MPY-TEST-F2-22-5
     1225   MPY-TEST-F2-22-6
     1249   MPY-TEST-F2-23-0
     1262   MPY-TEST-F2-23-1 . . . . . . .  G1257
     1272   MPY-TEST-F2-23-2
     1282   MPY-TEST-F2-23-3
     1288   MPY-TEST-F2-23-4
     1294   MPY-TEST-F2-23-5
     1300   MPY-TEST-F2-23-6
     1325   MPY-TEST-F2-24-0
     1338   MPY-TEST-F2-24-1 . . . . . . .  G1333
     1348   MPY-TEST-F2-24-2
     1358   MPY-TEST-F2-24-3
     1364   MPY-TEST-F2-24-4
     1370   MPY-TEST-F2-24-5
     1376   MPY-TEST-F2-24-6
     1400   MPY-TEST-F2-25-0
     1414   MPY-TEST-F2-25-1 . . . . . . .  G1409
     1424   MPY-TEST-F2-25-2
     1434   MPY-TEST-F2-25-3
     1440   MPY-TEST-F2-25-4
     1446   MPY-TEST-F2-25-5
     1452   MPY-TEST-F2-25-6
     1477   MPY-TEST-F2-26-0
     1491   MPY-TEST-F2-26-1 . . . . . . .  G1486
     1501   MPY-TEST-F2-26-2
     1511   MPY-TEST-F2-26-3
     1517   MPY-TEST-F2-26-4
     1523   MPY-TEST-F2-26-5
     1529   MPY-TEST-F2-26-6
     1551   MPY-TEST-F2-27-0
     1565   MPY-TEST-F2-27-1 . . . . . . .  G1560
     1577   MPY-TEST-F2-27-2
     1589   MPY-TEST-F2-27-3
     1601   MPY-TEST-F2-27-4
     1613   MPY-TEST-F2-27-5
     1634   MPY-TEST-F2-28-0
     1648   MPY-TEST-F2-28-1 . . . . . . .  G1643
     1661   MPY-TEST-F2-28-2
     1673   MPY-TEST-F2-28-3
     1686   MPY-TEST-F2-28-4
     1699   MPY-TEST-F2-28-5
     1724   MPY-TEST-F2-29-0
     1738   MPY-TEST-F2-29-1 . . . . . . .  G1733
     1751   MPY-TEST-F2-29-2
     1764   MPY-TEST-F2-29-3
     1777   MPY-TEST-F2-29-4
     1790   MPY-TEST-F2-29-5
      485   MPY-TEST-F2-3-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    47
0 Defined   Cross-reference of procedures   References

0     488   MPY-TEST-F2-3-1
      505   MPY-TEST-F2-3-2
     1813   MPY-TEST-F2-30-0
     1827   MPY-TEST-F2-30-1 . . . . . . .  G1822
     1840   MPY-TEST-F2-30-2
     1852   MPY-TEST-F2-30-3
     1865   MPY-TEST-F2-30-4
     1878   MPY-TEST-F2-30-5
     1901   MPY-TEST-F2-31-0
     1915   MPY-TEST-F2-31-1 . . . . . . .  G1910
     1927   MPY-TEST-F2-31-2
     1939   MPY-TEST-F2-31-3
     1958   MPY-TEST-F2-32-0
     1972   MPY-TEST-F2-32-1 . . . . . . .  G1967
     1984   MPY-TEST-F2-32-2
     1997   MPY-TEST-F2-32-3
      527   MPY-TEST-F2-4-0
      530   MPY-TEST-F2-4-1
      547   MPY-TEST-F2-4-2
      569   MPY-TEST-F2-5-0
      572   MPY-TEST-F2-5-1
      594   MPY-TEST-F2-6
      591   MPY-TEST-F2-6-0
      614   MPY-TEST-F2-7-0
      619   MPY-TEST-F2-7-1
      635   MPY-TEST-F2-7-2
      654   MPY-TEST-F2-8-0
      658   MPY-TEST-F2-8-1
      673   MPY-TEST-F2-8-2
      692   MPY-TEST-F2-9-0
      696   MPY-TEST-F2-9-1
      710   MPY-TEST-F2-9-2
      453   MPY-WRITE-F2-1-1 . . . . . . .  G445 G448
      744   MPY-WRITE-F2-10-1. . . . . . .  G737 G741
      758   MPY-WRITE-F2-10-2. . . . . . .  G750 G755
      778   MPY-WRITE-F2-11. . . . . . . .  G771 G775
      798   MPY-WRITE-F2-12. . . . . . . .  G791 G795
      818   MPY-WRITE-F2-13. . . . . . . .  G811 G815
      838   MPY-WRITE-F2-14. . . . . . . .  G831 G835
      858   MPY-WRITE-F2-15. . . . . . . .  G851 G855
      475   MPY-WRITE-F2-2-1 . . . . . . .  G467 G470
      502   MPY-WRITE-F2-3-1 . . . . . . .  G493 G496
      518   MPY-WRITE-F2-3-2 . . . . . . .  G509 G512
      544   MPY-WRITE-F2-4-1 . . . . . . .  G535 G538
      562   MPY-WRITE-F2-4-2 . . . . . . .  G552 G555
      584   MPY-WRITE-F2-5 . . . . . . . .  G575 G579
      606   MPY-WRITE-F2-6 . . . . . . . .  G597 G601
      632   MPY-WRITE-F2-7-1 . . . . . . .  G622 G626
      646   MPY-WRITE-F2-7-2 . . . . . . .  G638 G643
      670   MPY-WRITE-F2-8-1 . . . . . . .  G661 G665
      684   MPY-WRITE-F2-8-2 . . . . . . .  G676 G681
      707   MPY-WRITE-F2-9-1 . . . . . . .  G699 G704
      722   MPY-WRITE-F2-9-2 . . . . . . .  G713 G719
      314   OPEN-FILES
      327   PASS . . . . . . . . . . . . .  P444 P466 P490 P508 P534 P549 P574 P596 P621 P637 P660 P675 P698 P712 P736 P749
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    48
0 Defined   Cross-reference of procedures   References

0                                           P770 P790 P810 P830 P850 P883 P895 P925 P938 P969 P981 P1011 P1024 P1055 P1061
                                            P1067 P1073 P1079 P1113 P1123 P1132 P1138 P1144 P1151 P1189 P1199 P1208 P1214
                                            P1220 P1227 P1264 P1274 P1283 P1289 P1295 P1302 P1340 P1350 P1359 P1365 P1371
                                            P1378 P1416 P1426 P1435 P1441 P1447 P1454 P1493 P1503 P1512 P1518 P1524 P1531
                                            P1568 P1580 P1592 P1604 P1616 P1651 P1664 P1676 P1689 P1702 P1741 P1754 P1767
                                            P1780 P1793 P1830 P1843 P1855 P1868 P1881 P1918 P1930 P1942 P1975 P1987 P2000
      331   PRINT-DETAIL . . . . . . . . .  P455 P477 P504 P520 P546 P564 P586 P608 P634 P648 P672 P686 P709 P724 P746 P760
                                            P780 P800 P820 P840 P860 P878 P884 P890 P896 P902 P920 P926 P933 P939 P945 P964
                                            P970 P976 P982 P988 P1006 P1012 P1019 P1025 P1031 P1055 P1058 P1061 P1064 P1067
                                            P1070 P1073 P1076 P1079 P1082 P1114 P1119 P1124 P1129 P1132 P1135 P1138 P1141
                                            P1144 P1147 P1152 P1158 P1185 P1190 P1195 P1200 P1205 P1208 P1211 P1214 P1217
                                            P1220 P1223 P1228 P1234 P1260 P1265 P1270 P1275 P1280 P1283 P1286 P1289 P1292
                                            P1295 P1298 P1303 P1309 P1336 P1341 P1346 P1351 P1356 P1359 P1362 P1365 P1368
                                            P1371 P1374 P1379 P1385 P1412 P1417 P1422 P1427 P1432 P1435 P1438 P1441 P1444
                                            P1447 P1450 P1455 P1461 P1489 P1494 P1499 P1504 P1509 P1512 P1515 P1518 P1521
                                            P1524 P1527 P1532 P1538 P1563 P1569 P1575 P1581 P1587 P1593 P1599 P1605 P1611
                                            P1617 P1623 P1646 P1652 P1659 P1665 P1671 P1677 P1684 P1690 P1697 P1703 P1710
                                            P1736 P1742 P1749 P1755 P1762 P1768 P1775 P1781 P1788 P1794 P1801 P1825 P1831
                                            P1838 P1844 P1850 P1856 P1863 P1869 P1876 P1882 P1889 P1913 P1919 P1925 P1931
                                            P1937 P1943 P1949 P1970 P1976 P1982 P1988 P1995 P2001 P2007
      432   SECT-NC170A-001
      324   TERMINATE-CALL
      322   TERMINATE-CCVS
      385   WRITE-LINE . . . . . . . . . .  P335 P336 P344 P345 P346 P347 P349 P350 P351 P353 P355 P364 P372 P378 P383 P384
                                            P412 P416 P418 P427
      401   WRT-LN . . . . . . . . . . . .  P391 P392 P393 P394 P395 P396 P397 P400 P405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    49
0 Defined   Cross-reference of programs     References

        3   NC170A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC170A    Date 06/04/2022  Time 12:00:26   Page    50
0LineID  Message code  Message text

     41  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC170A:
 *    Source records = 2012
 *    Data Division statements = 168
 *    Procedure Division statements = 1344
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1357
0End of compilation 1,  program NC170A,  highest severity 0.
0Return code 0
