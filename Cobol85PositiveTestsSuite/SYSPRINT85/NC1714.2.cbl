1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:41   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:41   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1714.2
   000002         000200 PROGRAM-ID.                                                      NC1714.2
   000003         000300     NC171A.                                                      NC1714.2
   000004         000500*                                                              *  NC1714.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1714.2
   000006         000700*                                                              *  NC1714.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1714.2
   000008         000900*                                                              *  NC1714.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1714.2
   000010         001100*                                                              *  NC1714.2
   000011         001300*                                                              *  NC1714.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1714.2
   000013         001500*                                                              *  NC1714.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1714.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1714.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1714.2
   000017         001900*                                                              *  NC1714.2
   000018         002100*    THIS PROGRAM TESTS THE FORMAT 1 DIVIDE STATEMENT FOUND       NC1714.2
   000019         002200*    IN LEVEL 1.   ALL COMBINATIONS OF THE OPTIONAL PHRASES       NC1714.2
   000020         002300*    "SIZE ERROR", "NOT SIZE ERROR" AND "END-MULTIPLY" ARE        NC1714.2
   000021         002400*    TESTED, AS WELL AS THE ROUNDED OPTION.                       NC1714.2
   000022         002500*                                                                 NC1714.2
   000023         002600*    VARIOUS COMBINATIONS OF SIGNED AND UNSIGNED NUMERIC          NC1714.2
   000024         002700*    LITERALS, DISPLAY AND COMPUTATIONAL FIELDS ARE USED          NC1714.2
   000025         002800*    AS OPERANDS.                                                 NC1714.2
   000026         002900*                                                                 NC1714.2
   000027         003000                                                                  NC1714.2
   000028         003100                                                                  NC1714.2
   000029         003200 ENVIRONMENT DIVISION.                                            NC1714.2
   000030         003300 CONFIGURATION SECTION.                                           NC1714.2
   000031         003400 SOURCE-COMPUTER.                                                 NC1714.2
   000032         003500     XXXXX082.                                                    NC1714.2
   000033         003600 OBJECT-COMPUTER.                                                 NC1714.2
   000034         003700     XXXXX083.                                                    NC1714.2
   000035         003800 INPUT-OUTPUT SECTION.                                            NC1714.2
   000036         003900 FILE-CONTROL.                                                    NC1714.2
   000037         004000     SELECT PRINT-FILE ASSIGN TO                                  NC1714.2 41
   000038         004100     XXXXX055.                                                    NC1714.2
   000039         004200 DATA DIVISION.                                                   NC1714.2
   000040         004300 FILE SECTION.                                                    NC1714.2
   000041         004400 FD  PRINT-FILE.                                                  NC1714.2

 ==000041==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000042         004500 01  PRINT-REC PICTURE X(120).                                    NC1714.2
   000043         004600 01  DUMMY-RECORD PICTURE X(120).                                 NC1714.2
   000044         004700 WORKING-STORAGE SECTION.                                         NC1714.2
   000045         004800 77  WRK-DS-18V00                PICTURE S9(18).                  NC1714.2
   000046         004900 77  A06THREES-DS-03V03          PICTURE S999V999 VALUE 333.333.  NC1714.2
   000047         005000 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC1714.2
   000048         005100 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06 PICTURE S9(12).        NC1714.2 47
   000049         005200 77  A08TWOS-DS-02V06            PICTURE S99V9(6) VALUE 22.222222.NC1714.2
   000050         005300 77  WRK-DS-10V00                PICTURE S9(10).                  NC1714.2
   000051         005400 77  WRK-XN-00001                PICTURE X.                       NC1714.2
   000052         005500 77  A10ONES-DS-10V00            PICTURE S9(10)                   NC1714.2
   000053         005600                                 VALUE 1111111111.                NC1714.2
   000054         005700 77  A12THREES-DS-06V06          PICTURE S9(6)V9(6)               NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800                                 VALUE 333333.333333.             NC1714.2
   000056         005900 77  WRK-DS-02V00                PICTURE S99.                     NC1714.2
   000057         006000 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC1714.2 IMP
   000058         006100 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1714.2
   000059         006200 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC1714.2 58
   000060         006300 77  A05ONES-DS-00V05            PICTURE SV9(5) VALUE .11111.     NC1714.2
   000061         006400 77  A12ONES-DS-12V00            PICTURE S9(12)                   NC1714.2
   000062         006500                                 VALUE 111111111111.              NC1714.2
   000063         006600 77  A01ONE-DS-P0801             PICTURE SP(8)9 VALUE .000000001. NC1714.2
   000064         006700 77  WRK-DS-09V08                PICTURE S9(9)V9(8).              NC1714.2
   000065         006800 77  WRK-DS-17V00-S REDEFINES WRK-DS-09V08 PICTURE S9(17).        NC1714.2 64
   000066         006900 77  A18ONES-DS-18V00            PICTURE S9(18)                   NC1714.2
   000067         007000                                 VALUE 111111111111111111.        NC1714.2
   000068         007100 77  WRK-DS-0201P                PICTURE S99P.                    NC1714.2
   000069         007200 77  WRK-CS-18V00                PICTURE S9(18) COMPUTATIONAL.    NC1714.2
   000070         007300 77  WRK-DU-18V00                PICTURE 9(18).                   NC1714.2
   000071         007400 77  A99-CS-02V00                PICTURE S99 COMPUTATIONAL        NC1714.2
   000072         007500                                 VALUE 99.                        NC1714.2
   000073         007600 77  A01ONE-CS-00V01             PICTURE SV9 COMPUTATIONAL        NC1714.2
   000074         007700                                 VALUE .1.                        NC1714.2
   000075         007800 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC1714.2
   000076         007900 77  WRK-DS-12V00                PICTURE S9(12).                  NC1714.2
   000077         008000 77  WRK-DS-01V00                PICTURE S9.                      NC1714.2
   000078         008100 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC1714.2
   000079         008200 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC1714.2
   000080         008300                                 VALUE 111111111.111111111.       NC1714.2
   000081         008400 77  A02TWOS-DU-02V00            PICTURE 99  VALUE 22.            NC1714.2
   000082         008500 77  WRK-DS-05V00                PICTURE S9(5).                   NC1714.2
   000083         008600 77  A02TWOS-DS-03V02            PICTURE S999V99 VALUE +022.00.   NC1714.2
   000084         008700 77  WRK-CS-02V02                PICTURE S99V99  COMPUTATIONAL.   NC1714.2
   000085         008800 77  A990-DS-0201P               PICTURE S99P   VALUE +990.       NC1714.2
   000086         008900 77  XRAY                        PICTURE X.                       NC1714.2
   000087         009000 01  WRK-XN-18-1 PIC X(18).                                       NC1714.2
   000088         009100 01  WRK-AN-X-18-1, REDEFINES WRK-XN-18-1 PIC A(18).              NC1714.2 87
   000089         009200 01  WRK-DU-X-18V0-1; REDEFINES WRK-XN-18-1 PIC 9(18).            NC1714.2 87
   000090         009300 01  WRK-DU-0V1-1 PIC V9 VALUE .3.                                NC1714.2
   000091         009400 01  WRK-DU-0V2-1 PIC V99 VALUE .25.                              NC1714.2
   000092         009500 01  WRK-DU-0V12-1 PIC V9(12) VALUE .00001.                       NC1714.2
   000093         009600 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1714.2 IMP
   000094         009700 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1714.2
   000095         009800 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1714.2
   000096         009900 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1714.2
   000097         010000 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1714.2
   000098         010100 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1714.2
   000099         010200 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1714.2
   000100         010300 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1714.2
   000101         010400 01  WRK-DU-2V0-1 PIC 99.                                         NC1714.2
   000102         010500 01  WRK-DU-2V0-2 PIC 99.                                         NC1714.2
   000103         010600 01  WRK-DU-2V0-3 PIC 99.                                         NC1714.2
   000104         010700 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1714.2
   000105         010800 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1714.2
   000106         010900 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1714.2
   000107         011000 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1714.2
   000108         011100 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1714.2
   000109         011200 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1714.2
   000110         011300 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1714.2
   000111         011400 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1714.2
   000113         011600 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1714.2
   000114         011700 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1714.2
   000115         011800 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1714.2
   000116         011900 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1714.2
   000117         012000 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1714.2
   000118         012100 01  WRK-NE-X-1 PIC 9(16).99.                                     NC1714.2
   000119         012200 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1714.2
   000120         012300 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1714.2
   000121         012400 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1714.2 IMP
   000122         012500 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1714.2 IMP
   000123         012600 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1714.2 IMP
   000124         012700 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1714.2 IMP
   000125         012800 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1714.2
   000126         012900 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1714.2
   000127         013000 01  WRK-NE-X-2 PIC -9(16).99.                                    NC1714.2
   000128         013100 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC1714.2
   000129         013200 01  WRK-NE-2 PIC $**.99.                                         NC1714.2
   000130         013300 01  WRK-NE-3 PIC $99.99CR.                                       NC1714.2
   000131         013400 01  WRK-NE-4 PIC $*9.99 VALUE ZERO.                              NC1714.2 IMP
   000132         013500 77  A01ONES-CS-18V00   PICTURE S9(18) COMPUTATIONAL              NC1714.2
   000133         013600             VALUE +000000000000000001.                           NC1714.2
   000134         013700 77  A02THREES-CS-18V00 PICTURE S9(18) COMPUTATIONAL              NC1714.2
   000135         013800             VALUE -000000000000000033.                           NC1714.2
   000136         013900 77  A18SIXES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1714.2
   000137         014000             VALUE 666666666666666666.                            NC1714.2
   000138         014100 77  A16NINES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1714.2
   000139         014200             VALUE 009999999999999999.                            NC1714.2
   000140         014300 77  A14TWOS-CU-18V00   PICTURE 9(18) COMPUTATIONAL               NC1714.2
   000141         014400             VALUE 000022222222222222.                            NC1714.2
   000142         014500 01  MULTIPLY-DATA.                                               NC1714.2
   000143         014600     02 MULT1                           PICTURE IS 999V99         NC1714.2
   000144         014700     VALUE IS 80.12.                                              NC1714.2
   000145         014800     02 MULT2                           PICTURE IS 999V999.       NC1714.2
   000146         014900     02 MULT3                           PICTURE IS $$99.99.       NC1714.2
   000147         015000     02 MULT4                           PICTURE IS S99            NC1714.2
   000148         015100     VALUE IS -56.                                                NC1714.2
   000149         015200     02 MULT5                           PICTURE IS 9 VALUE IS 4.  NC1714.2
   000150         015300     02 MULT6                           PICTURE IS 99 VALUE IS    NC1714.2
   000151         015400     20.                                                          NC1714.2
   000152         015500 01  DIVIDE-DATA.                                                 NC1714.2
   000153         015600     02 DIV1                            PICTURE IS 9(4)V99        NC1714.2
   000154         015700     VALUE IS 1620.36.                                            NC1714.2
   000155         015800     02 DIV2                            PICTURE IS 99V9           NC1714.2
   000156         015900     VALUE IS 44.1.                                               NC1714.2
   000157         016000     02 DIV3                            PICTURE IS 9(4)V9         NC1714.2
   000158         016100     VALUE IS 1661.7.                                             NC1714.2
   000159         016200     02 DIV4                            PICTURE IS S9V999         NC1714.2
   000160         016300     VALUE IS -9.642.                                             NC1714.2
   000161         016400     02 DIV-02LEVEL-1.                                            NC1714.2
   000162         016500     03 DIV5                            PICTURE IS V99            NC1714.2
   000163         016600     VALUE IS .82.                                                NC1714.2
   000164         016700     03 DIV6                            PICTURE IS 9 VALUE IS 0.  NC1714.2
   000165         016800     03 DIV7                            PICTURE IS 9V9            NC1714.2
   000166         016900     VALUE IS 9.6.                                                NC1714.2
   000167         017000 01  DIV-DATA-2.                                                  NC1714.2
   000168         017100     02 DIV8                            PICTURE IS 99V9.          NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 DIV9                            PICTURE IS ZZ,ZZZ.9.      NC1714.2
   000170         017300     02 DIV10                           PICTURE IS V999.          NC1714.2
   000171         017400 01  TEST-RESULTS.                                                NC1714.2
   000172         017500     02 FILLER                   PIC X      VALUE SPACE.          NC1714.2 IMP
   000173         017600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1714.2 IMP
   000174         017700     02 FILLER                   PIC X      VALUE SPACE.          NC1714.2 IMP
   000175         017800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1714.2 IMP
   000176         017900     02 FILLER                   PIC X      VALUE SPACE.          NC1714.2 IMP
   000177         018000     02  PAR-NAME.                                                NC1714.2
   000178         018100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1714.2 IMP
   000179         018200       03  PARDOT-X              PIC X      VALUE SPACE.          NC1714.2 IMP
   000180         018300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1714.2 IMP
   000181         018400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1714.2 IMP
   000182         018500     02 RE-MARK                  PIC X(61).                       NC1714.2
   000183         018600 01  TEST-COMPUTED.                                               NC1714.2
   000184         018700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1714.2 IMP
   000185         018800     02 FILLER                   PIC X(17)  VALUE                 NC1714.2
   000186         018900            "       COMPUTED=".                                   NC1714.2
   000187         019000     02 COMPUTED-X.                                               NC1714.2
   000188         019100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1714.2 IMP
   000189         019200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1714.2 188
   000190         019300                                 PIC -9(9).9(9).                  NC1714.2
   000191         019400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1714.2 188
   000192         019500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1714.2 188
   000193         019600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1714.2 188
   000194         019700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1714.2 188
   000195         019800         04 COMPUTED-18V0                    PIC -9(18).          NC1714.2
   000196         019900         04 FILLER                           PIC X.               NC1714.2
   000197         020000     03 FILLER PIC X(50) VALUE SPACE.                             NC1714.2 IMP
   000198         020100 01  TEST-CORRECT.                                                NC1714.2
   000199         020200     02 FILLER PIC X(30) VALUE SPACE.                             NC1714.2 IMP
   000200         020300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1714.2
   000201         020400     02 CORRECT-X.                                                NC1714.2
   000202         020500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1714.2 IMP
   000203         020600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1714.2 202
   000204         020700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1714.2 202
   000205         020800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1714.2 202
   000206         020900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1714.2 202
   000207         021000     03      CR-18V0 REDEFINES CORRECT-A.                         NC1714.2 202
   000208         021100         04 CORRECT-18V0                     PIC -9(18).          NC1714.2
   000209         021200         04 FILLER                           PIC X.               NC1714.2
   000210         021300     03 FILLER PIC X(2) VALUE SPACE.                              NC1714.2 IMP
   000211         021400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1714.2 IMP
   000212         021500 01  CCVS-C-1.                                                    NC1714.2
   000213         021600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1714.2
   000214         021700-    "SS  PARAGRAPH-NAME                                          NC1714.2
   000215         021800-    "       REMARKS".                                            NC1714.2
   000216         021900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1714.2 IMP
   000217         022000 01  CCVS-C-2.                                                    NC1714.2
   000218         022100     02 FILLER                     PIC X        VALUE SPACE.      NC1714.2 IMP
   000219         022200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1714.2
   000220         022300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1714.2 IMP
   000221         022400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1714.2
   000222         022500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1714.2 IMP
   000223         022600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1714.2 IMP
   000224         022700 01  REC-CT                        PIC 99       VALUE ZERO.       NC1714.2 IMP
   000225         022800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1714.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1714.2 IMP
   000227         023000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1714.2 IMP
   000228         023100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1714.2 IMP
   000229         023200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1714.2 IMP
   000230         023300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1714.2 IMP
   000231         023400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1714.2 IMP
   000232         023500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1714.2 IMP
   000233         023600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1714.2 IMP
   000234         023700 01  CCVS-H-1.                                                    NC1714.2
   000235         023800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1714.2 IMP
   000236         023900     02  FILLER                    PIC X(42)    VALUE             NC1714.2
   000237         024000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1714.2
   000238         024100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1714.2 IMP
   000239         024200 01  CCVS-H-2A.                                                   NC1714.2
   000240         024300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1714.2 IMP
   000241         024400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1714.2
   000242         024500   02  FILLER                        PIC XXXX   VALUE             NC1714.2
   000243         024600     "4.2 ".                                                      NC1714.2
   000244         024700   02  FILLER                        PIC X(28)  VALUE             NC1714.2
   000245         024800            " COPY - NOT FOR DISTRIBUTION".                       NC1714.2
   000246         024900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1714.2 IMP
   000247         025000                                                                  NC1714.2
   000248         025100 01  CCVS-H-2B.                                                   NC1714.2
   000249         025200   02  FILLER                        PIC X(15)  VALUE             NC1714.2
   000250         025300            "TEST RESULT OF ".                                    NC1714.2
   000251         025400   02  TEST-ID                       PIC X(9).                    NC1714.2
   000252         025500   02  FILLER                        PIC X(4)   VALUE             NC1714.2
   000253         025600            " IN ".                                               NC1714.2
   000254         025700   02  FILLER                        PIC X(12)  VALUE             NC1714.2
   000255         025800     " HIGH       ".                                              NC1714.2
   000256         025900   02  FILLER                        PIC X(22)  VALUE             NC1714.2
   000257         026000            " LEVEL VALIDATION FOR ".                             NC1714.2
   000258         026100   02  FILLER                        PIC X(58)  VALUE             NC1714.2
   000259         026200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1714.2
   000260         026300 01  CCVS-H-3.                                                    NC1714.2
   000261         026400     02  FILLER                      PIC X(34)  VALUE             NC1714.2
   000262         026500            " FOR OFFICIAL USE ONLY    ".                         NC1714.2
   000263         026600     02  FILLER                      PIC X(58)  VALUE             NC1714.2
   000264         026700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1714.2
   000265         026800     02  FILLER                      PIC X(28)  VALUE             NC1714.2
   000266         026900            "  COPYRIGHT   1985 ".                                NC1714.2
   000267         027000 01  CCVS-E-1.                                                    NC1714.2
   000268         027100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1714.2 IMP
   000269         027200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1714.2
   000270         027300     02 ID-AGAIN                     PIC X(9).                    NC1714.2
   000271         027400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1714.2 IMP
   000272         027500 01  CCVS-E-2.                                                    NC1714.2
   000273         027600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1714.2 IMP
   000274         027700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1714.2 IMP
   000275         027800     02 CCVS-E-2-2.                                               NC1714.2
   000276         027900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1714.2 IMP
   000277         028000         03 FILLER                   PIC X      VALUE SPACE.      NC1714.2 IMP
   000278         028100         03 ENDER-DESC               PIC X(44)  VALUE             NC1714.2
   000279         028200            "ERRORS ENCOUNTERED".                                 NC1714.2
   000280         028300 01  CCVS-E-3.                                                    NC1714.2
   000281         028400     02  FILLER                      PIC X(22)  VALUE             NC1714.2
   000282         028500            " FOR OFFICIAL USE ONLY".                             NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1714.2 IMP
   000284         028700     02  FILLER                      PIC X(58)  VALUE             NC1714.2
   000285         028800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1714.2
   000286         028900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1714.2 IMP
   000287         029000     02 FILLER                       PIC X(15)  VALUE             NC1714.2
   000288         029100             " COPYRIGHT 1985".                                   NC1714.2
   000289         029200 01  CCVS-E-4.                                                    NC1714.2
   000290         029300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1714.2 IMP
   000291         029400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1714.2
   000292         029500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1714.2 IMP
   000293         029600     02 FILLER                       PIC X(40)  VALUE             NC1714.2
   000294         029700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1714.2
   000295         029800 01  XXINFO.                                                      NC1714.2
   000296         029900     02 FILLER                       PIC X(19)  VALUE             NC1714.2
   000297         030000            "*** INFORMATION ***".                                NC1714.2
   000298         030100     02 INFO-TEXT.                                                NC1714.2
   000299         030200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1714.2 IMP
   000300         030300       04 XXCOMPUTED                 PIC X(20).                   NC1714.2
   000301         030400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1714.2 IMP
   000302         030500       04 XXCORRECT                  PIC X(20).                   NC1714.2
   000303         030600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1714.2
   000304         030700 01  HYPHEN-LINE.                                                 NC1714.2
   000305         030800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1714.2 IMP
   000306         030900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1714.2
   000307         031000-    "*****************************************".                 NC1714.2
   000308         031100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1714.2
   000309         031200-    "******************************".                            NC1714.2
   000310         031300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1714.2
   000311         031400     "NC171A".                                                    NC1714.2
   000312         031500 PROCEDURE DIVISION.                                              NC1714.2
   000313         031600 CCVS1 SECTION.                                                   NC1714.2
   000314         031700 OPEN-FILES.                                                      NC1714.2
   000315         031800     OPEN     OUTPUT PRINT-FILE.                                  NC1714.2 41
   000316         031900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1714.2 310 251 310 270
   000317         032000     MOVE    SPACE TO TEST-RESULTS.                               NC1714.2 IMP 171
   000318         032100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1714.2 343 348
   000319         032200     GO TO CCVS1-EXIT.                                            NC1714.2 430
   000320         032300 CLOSE-FILES.                                                     NC1714.2
   000321         032400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1714.2 352 373 41
   000322         032500 TERMINATE-CCVS.                                                  NC1714.2
   000323         032600     EXIT PROGRAM.                                                NC1714.2
   000324         032700 TERMINATE-CALL.                                                  NC1714.2
   000325         032800     STOP     RUN.                                                NC1714.2
   000326         032900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1714.2 175 227
   000327         033000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1714.2 175 228
   000328         033100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1714.2 175 226
   000329         033200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1714.2 175 225
   000330         033300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1714.2 182
   000331         033400 PRINT-DETAIL.                                                    NC1714.2
   000332         033500     IF REC-CT NOT EQUAL TO ZERO                                  NC1714.2 224 IMP
   000333      1  033600             MOVE "." TO PARDOT-X                                 NC1714.2 179
   000334      1  033700             MOVE REC-CT TO DOTVALUE.                             NC1714.2 224 180
   000335         033800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1714.2 171 42 385
   000336         033900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1714.2 175 385
   000337      1  034000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1714.2 406 420
   000338      1  034100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1714.2 421 429
   000339         034200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1714.2 IMP 175 IMP 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE SPACE TO CORRECT-X.                                     NC1714.2 IMP 201
   000341         034400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1714.2 224 IMP IMP 177
   000342         034500     MOVE     SPACE TO RE-MARK.                                   NC1714.2 IMP 182
   000343         034600 HEAD-ROUTINE.                                                    NC1714.2
   000344         034700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1714.2 234 43 385
   000345         034800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1714.2 239 43 385
   000346         034900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1714.2 248 43 385
   000347         035000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1714.2 260 43 385
   000348         035100 COLUMN-NAMES-ROUTINE.                                            NC1714.2
   000349         035200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1714.2 212 43 385
   000350         035300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1714.2 217 43 385
   000351         035400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1714.2 304 43 385
   000352         035500 END-ROUTINE.                                                     NC1714.2
   000353         035600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1714.2 304 43 385
   000354         035700 END-RTN-EXIT.                                                    NC1714.2
   000355         035800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1714.2 267 43 385
   000356         035900 END-ROUTINE-1.                                                   NC1714.2
   000357         036000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1714.2 226 230 227
   000358         036100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1714.2 230 225 230
   000359         036200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1714.2 228 230
   000360         036300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1714.2
   000361         036400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1714.2 228 290
   000362         036500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1714.2 230 292
   000363         036600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1714.2 289 275
   000364         036700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1714.2 272 43 385
   000365         036800  END-ROUTINE-12.                                                 NC1714.2
   000366         036900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1714.2 278
   000367         037000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1714.2 226 IMP
   000368      1  037100         MOVE "NO " TO ERROR-TOTAL                                NC1714.2 276
   000369         037200         ELSE                                                     NC1714.2
   000370      1  037300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1714.2 226 276
   000371         037400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1714.2 272 43
   000372         037500     PERFORM WRITE-LINE.                                          NC1714.2 385
   000373         037600 END-ROUTINE-13.                                                  NC1714.2
   000374         037700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1714.2 225 IMP
   000375      1  037800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1714.2 276
   000376      1  037900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1714.2 225 276
   000377         038000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1714.2 278
   000378         038100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1714.2 272 43 385
   000379         038200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1714.2 227 IMP
   000380      1  038300          MOVE "NO " TO ERROR-TOTAL                               NC1714.2 276
   000381      1  038400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1714.2 227 276
   000382         038500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1714.2 278
   000383         038600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1714.2 272 43 385
   000384         038700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1714.2 280 43 385
   000385         038800 WRITE-LINE.                                                      NC1714.2
   000386         038900     ADD 1 TO RECORD-COUNT.                                       NC1714.2 232
   000387         039000     IF RECORD-COUNT GREATER 42                                   NC1714.2 232
   000388      1  039100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1714.2 43 231
   000389      1  039200         MOVE SPACE TO DUMMY-RECORD                               NC1714.2 IMP 43
   000390      1  039300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1714.2 43
   000391      1  039400         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1714.2 234 43 401
   000392      1  039500         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1714.2 239 43 401
   000393      1  039600         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1714.2 248 43 401
   000394      1  039700         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1714.2 260 43 401
   000395      1  039800         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1714.2 212 43 401
   000396      1  039900         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1714.2 217 43 401
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1714.2 304 43 401
   000398      1  040100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1714.2 231 43
   000399      1  040200         MOVE ZERO TO RECORD-COUNT.                               NC1714.2 IMP 232
   000400         040300     PERFORM WRT-LN.                                              NC1714.2 401
   000401         040400 WRT-LN.                                                          NC1714.2
   000402         040500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1714.2 43
   000403         040600     MOVE SPACE TO DUMMY-RECORD.                                  NC1714.2 IMP 43
   000404         040700 BLANK-LINE-PRINT.                                                NC1714.2
   000405         040800     PERFORM WRT-LN.                                              NC1714.2 401
   000406         040900 FAIL-ROUTINE.                                                    NC1714.2
   000407         041000     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1714.2 187 IMP
   000408      1  041100            GO TO FAIL-ROUTINE-WRITE.                             NC1714.2 415
   000409         041200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1714.2 201 IMP 415
   000410         041300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1714.2 233 303
   000411         041400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1714.2 298
   000412         041500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1714.2 295 43 385
   000413         041600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1714.2 IMP 303
   000414         041700     GO TO  FAIL-ROUTINE-EX.                                      NC1714.2 420
   000415         041800 FAIL-ROUTINE-WRITE.                                              NC1714.2
   000416         041900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1714.2 183 42 385
   000417         042000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1714.2 233 211
   000418         042100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1714.2 198 42 385
   000419         042200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1714.2 IMP 211
   000420         042300 FAIL-ROUTINE-EX. EXIT.                                           NC1714.2
   000421         042400 BAIL-OUT.                                                        NC1714.2
   000422         042500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1714.2 188 IMP 424
   000423         042600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1714.2 202 IMP 429
   000424         042700 BAIL-OUT-WRITE.                                                  NC1714.2
   000425         042800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1714.2 202 302 188 300
   000426         042900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1714.2 233 303
   000427         043000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1714.2 295 43 385
   000428         043100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1714.2 IMP 303
   000429         043200 BAIL-OUT-EX. EXIT.                                               NC1714.2
   000430         043300 CCVS1-EXIT.                                                      NC1714.2
   000431         043400     EXIT.                                                        NC1714.2
   000432         043500 SECT-NC171A-001 SECTION.                                         NC1714.2
   000433         043600*                                                                 NC1714.2
   000434         043700*                                                                 NC1714.2
   000435         043800 DIV-INIT-F1-1.                                                   NC1714.2
   000436         043900     MOVE "DIVIDE INTO" TO FEATURE.                               NC1714.2 173
   000437         044000     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000438         044100     MOVE    1620.36 TO DIV1.                                     NC1714.2 153
   000439         044200 DIV-TEST-F1-1.                                                   NC1714.2
   000440         044300     DIVIDE   64.3 INTO DIV1.                                     NC1714.2 153
   000441         044400     IF       DIV1 EQUAL TO 25.2                                  NC1714.2 153
   000442      1  044500              PERFORM PASS                                        NC1714.2 327
   000443         044600              ELSE                                                NC1714.2
   000444      1  044700              GO TO DIV-FAIL-F1-1.                                NC1714.2 449
   000445         044800     GO TO    DIV-WRITE-F1-1.                                     NC1714.2 453
   000446         044900 DIV-DELETE-F1-1.                                                 NC1714.2
   000447         045000     PERFORM  DE-LETE.                                            NC1714.2 329
   000448         045100     GO TO    DIV-WRITE-F1-1.                                     NC1714.2 453
   000449         045200 DIV-FAIL-F1-1.                                                   NC1714.2
   000450         045300     PERFORM  FAIL.                                               NC1714.2 328
   000451         045400     MOVE     DIV1 TO COMPUTED-N.                                 NC1714.2 153 189
   000452         045500     MOVE     +25.2 TO CORRECT-N.                                 NC1714.2 203
   000453         045600 DIV-WRITE-F1-1.                                                  NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE "DIV-TEST-F1-1" TO PAR-NAME.                            NC1714.2 177
   000455         045800     PERFORM  PRINT-DETAIL.                                       NC1714.2 331
   000456         045900 DIV-INIT-F1-2.                                                   NC1714.2
   000457         046000     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000458         046100     MOVE      44.1  TO DIV2.                                     NC1714.2 155
   000459         046200     MOVE    1661.7  TO DIV3.                                     NC1714.2 157
   000460         046300 DIV-TEST-F1-2.                                                   NC1714.2
   000461         046400     DIVIDE   DIV2 INTO DIV3 ROUNDED.                             NC1714.2 155 157
   000462         046500     IF       DIV3 EQUAL TO 37.7                                  NC1714.2 157
   000463      1  046600              PERFORM PASS                                        NC1714.2 327
   000464         046700              ELSE                                                NC1714.2
   000465      1  046800              GO TO DIV-FAIL-F1-2.                                NC1714.2 470
   000466         046900     GO TO    DIV-WRITE-F1-2.                                     NC1714.2 474
   000467         047000 DIV-DELETE-F1-2.                                                 NC1714.2
   000468         047100     PERFORM  DE-LETE.                                            NC1714.2 329
   000469         047200     GO TO    DIV-WRITE-F1-2.                                     NC1714.2 474
   000470         047300 DIV-FAIL-F1-2.                                                   NC1714.2
   000471         047400     PERFORM  FAIL.                                               NC1714.2 328
   000472         047500     MOVE     DIV3 TO COMPUTED-N.                                 NC1714.2 157 189
   000473         047600     MOVE     +37.7 TO CORRECT-N.                                 NC1714.2 203
   000474         047700 DIV-WRITE-F1-2.                                                  NC1714.2
   000475         047800     MOVE "DIV-TEST-F1-2 " TO PAR-NAME.                           NC1714.2 177
   000476         047900     PERFORM  PRINT-DETAIL.                                       NC1714.2 331
   000477         048000 DIV-INIT-F1-3.                                                   NC1714.2
   000478         048100     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000479         048200     MOVE   -9.642   TO DIV4.                                     NC1714.2 159
   000480         048300     MOVE     .82    TO DIV5.                                     NC1714.2 162
   000481         048400 DIV-TEST-F1-3-1.                                                 NC1714.2
   000482         048500     DIVIDE   DIV5 INTO DIV4 ON SIZE ERROR                        NC1714.2 162 159
   000483      1  048600              MOVE "M" TO XRAY.                                   NC1714.2 86
   000484         048700     IF       XRAY EQUAL TO "M"                                   NC1714.2 86
   000485      1  048800              PERFORM PASS                                        NC1714.2 327
   000486         048900              ELSE                                                NC1714.2
   000487      1  049000              GO TO DIV-FAIL-F1-3-1.                              NC1714.2 492
   000488         049100     GO TO    DIV-WRITE-F1-3-1.                                   NC1714.2 497
   000489         049200 DIV-DELETE-F1-3-1.                                               NC1714.2
   000490         049300     PERFORM  DE-LETE.                                            NC1714.2 329
   000491         049400     GO TO    DIV-WRITE-F1-3-1.                                   NC1714.2 497
   000492         049500 DIV-FAIL-F1-3-1.                                                 NC1714.2
   000493         049600     MOVE     XRAY TO COMPUTED-X.                                 NC1714.2 86 187
   000494         049700     MOVE    "M"   TO CORRECT-X.                                  NC1714.2 201
   000495         049800     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1714.2 182
   000496         049900     PERFORM  FAIL.                                               NC1714.2 328
   000497         050000 DIV-WRITE-F1-3-1.                                                NC1714.2
   000498         050100     MOVE "DIV-TEST-F1-3-1 " TO PAR-NAME.                         NC1714.2 177
   000499         050200     PERFORM  PRINT-DETAIL.                                       NC1714.2 331
   000500         050300 DIV-TEST-F1-3-2.                                                 NC1714.2
   000501         050400     IF       DIV4 EQUAL TO -9.642                                NC1714.2 159
   000502      1  050500              PERFORM PASS                                        NC1714.2 327
   000503         050600              ELSE                                                NC1714.2
   000504      1  050700              GO TO DIV-FAIL-F1-3-2.                              NC1714.2 509
   000505         050800     GO TO    DIV-WRITE-F1-3-2.                                   NC1714.2 514
   000506         050900 DIV-DELETE-F1-3-2.                                               NC1714.2
   000507         051000     PERFORM  DE-LETE.                                            NC1714.2 329
   000508         051100     GO TO    DIV-WRITE-F1-3-2.                                   NC1714.2 514
   000509         051200 DIV-FAIL-F1-3-2.                                                 NC1714.2
   000510         051300     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1714.2 182
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     PERFORM  FAIL.                                               NC1714.2 328
   000512         051500     MOVE    DIV4 TO COMPUTED-N.                                  NC1714.2 159 189
   000513         051600     MOVE    -9.642 TO CORRECT-N.                                 NC1714.2 203
   000514         051700 DIV-WRITE-F1-3-2.                                                NC1714.2
   000515         051800     MOVE "DIV-TEST-F1-3-2 " TO PAR-NAME.                         NC1714.2 177
   000516         051900     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000517         052000 DIV-INIT-F1-4.                                                   NC1714.2
   000518         052100     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000519         052200     MOVE    44.1   TO DIV2.                                      NC1714.2 155
   000520         052300     MOVE     0     TO DIV6.                                      NC1714.2 164
   000521         052400     MOVE    "A"    TO XRAY.                                      NC1714.2 86
   000522         052500 DIV-TEST-F1-4-0.                                                 NC1714.2
   000523         052600     DIVIDE  DIV6 INTO DIV2 ON SIZE ERROR                         NC1714.2 164 155
   000524      1  052700             MOVE "N" TO XRAY.                                    NC1714.2 86
   000525         052800 DIV-TEST-F1-4-1.                                                 NC1714.2
   000526         052900     IF      XRAY EQUAL TO "N"                                    NC1714.2 86
   000527      1  053000             PERFORM PASS                                         NC1714.2 327
   000528         053100     ELSE                                                         NC1714.2
   000529      1  053200             GO TO DIV-FAIL-F1-4-1.                               NC1714.2 534
   000530         053300     GO TO   DIV-WRITE-F1-4-1.                                    NC1714.2 539
   000531         053400 DIV-DELETE-F1-4-1.                                               NC1714.2
   000532         053500     PERFORM DE-LETE.                                             NC1714.2 329
   000533         053600     GO TO   DIV-WRITE-F1-4-1.                                    NC1714.2 539
   000534         053700 DIV-FAIL-F1-4-1.                                                 NC1714.2
   000535         053800     MOVE    XRAY TO COMPUTED-X.                                  NC1714.2 86 187
   000536         053900     MOVE   "N"   TO CORRECT-X.                                   NC1714.2 201
   000537         054000     MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.              NC1714.2 182
   000538         054100     PERFORM FAIL.                                                NC1714.2 328
   000539         054200 DIV-WRITE-F1-4-1.                                                NC1714.2
   000540         054300     MOVE   "DIV-TEST-F1-4-1 " TO PAR-NAME.                       NC1714.2 177
   000541         054400     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000542         054500 DIV-TEST-F1-4-2.                                                 NC1714.2
   000543         054600     IF      DIV2 EQUAL TO 44.1                                   NC1714.2 155
   000544      1  054700             PERFORM PASS                                         NC1714.2 327
   000545         054800     ELSE                                                         NC1714.2
   000546      1  054900             GO TO DIV-FAIL-F1-4-2.                               NC1714.2 551
   000547         055000     GO TO   DIV-WRITE-F1-4-2.                                    NC1714.2 556
   000548         055100 DIV-DELETE-F1-4-2.                                               NC1714.2
   000549         055200     PERFORM  DE-LETE.                                            NC1714.2 329
   000550         055300     GO TO   DIV-WRITE-F1-4-2.                                    NC1714.2 556
   000551         055400 DIV-FAIL-F1-4-2.                                                 NC1714.2
   000552         055500     PERFORM  FAIL.                                               NC1714.2 328
   000553         055600     MOVE    DIV2 TO COMPUTED-N.                                  NC1714.2 155 189
   000554         055700     MOVE   +44.1000 TO CORRECT-N.                                NC1714.2 203
   000555         055800     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1714.2 182
   000556         055900 DIV-WRITE-F1-4-2.                                                NC1714.2
   000557         056000     MOVE   "DIV-TEST-F1-4-2 " TO PAR-NAME.                       NC1714.2 177
   000558         056100     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000559         056200 DIV-INIT-F1-5.                                                   NC1714.2
   000560         056300     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000561         056400     MOVE    9.6    TO DIV7.                                      NC1714.2 165
   000562         056500     MOVE   "B"     TO XRAY.                                      NC1714.2 86
   000563         056600 DIV-TEST-F1-5-1.                                                 NC1714.2
   000564         056700     DIVIDE  0.097 INTO DIV7 ROUNDED ON SIZE ERROR                NC1714.2 165
   000565      1  056800             MOVE "N" TO XRAY.                                    NC1714.2 86
   000566         056900     IF      XRAY EQUAL TO "N"                                    NC1714.2 86
   000567      1  057000             PERFORM PASS                                         NC1714.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     ELSE                                                         NC1714.2
   000569      1  057200             GO TO DIV-FAIL-F1-5-1.                               NC1714.2 574
   000570         057300     GO TO   DIV-WRITE-F1-5-1.                                    NC1714.2 579
   000571         057400 DIV-DELETE-F1-5-1.                                               NC1714.2
   000572         057500     PERFORM DE-LETE.                                             NC1714.2 329
   000573         057600     GO TO   DIV-WRITE-F1-5-1.                                    NC1714.2 579
   000574         057700 DIV-FAIL-F1-5-1.                                                 NC1714.2
   000575         057800     MOVE    XRAY TO COMPUTED-X.                                  NC1714.2 86 187
   000576         057900     MOVE   "N"   TO CORRECT-X.                                   NC1714.2 201
   000577         058000     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1714.2 182
   000578         058100     PERFORM FAIL.                                                NC1714.2 328
   000579         058200 DIV-WRITE-F1-5-1.                                                NC1714.2
   000580         058300     MOVE "DIV-TEST-F1-5-1 " TO PAR-NAME.                         NC1714.2 177
   000581         058400     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000582         058500 DIV-TEST-F1-5-2.                                                 NC1714.2
   000583         058600     IF       DIV7 NOT EQUAL TO 9.6                               NC1714.2 165
   000584      1  058700              GO TO DIV-FAIL-F1-5-2.                              NC1714.2 590
   000585         058800     PERFORM  PASS.                                               NC1714.2 327
   000586         058900     GO TO    DIV-WRITE-F1-5-2.                                   NC1714.2 595
   000587         059000 DIV-DELETE-F1-5-2.                                               NC1714.2
   000588         059100     PERFORM  DE-LETE.                                            NC1714.2 329
   000589         059200     GO TO    DIV-WRITE-F1-5-2.                                   NC1714.2 595
   000590         059300 DIV-FAIL-F1-5-2.                                                 NC1714.2
   000591         059400     PERFORM  FAIL.                                               NC1714.2 328
   000592         059500     MOVE     DIV7 TO COMPUTED-N.                                 NC1714.2 165 189
   000593         059600     MOVE     +9.6 TO CORRECT-N.                                  NC1714.2 203
   000594         059700     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1714.2 182
   000595         059800 DIV-WRITE-F1-5-2.                                                NC1714.2
   000596         059900     MOVE "DIV-TEST-F1-5-2 " TO PAR-NAME.                         NC1714.2 177
   000597         060000     PERFORM  PRINT-DETAIL.                                       NC1714.2 331
   000598         060100 DIV-INIT-F1-6.                                                   NC1714.2
   000599         060200     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000600         060300     MOVE    99 TO WRK-DS-18V00.                                  NC1714.2 45
   000601         060400     MOVE    99 TO A99-DS-02V00.                                  NC1714.2 75
   000602         060500 DIV-TEST-F1-6-0.                                                 NC1714.2
   000603         060600     DIVIDE  A99-DS-02V00 INTO WRK-DS-18V00.                      NC1714.2 75 45
   000604         060700 DIV-TEST-F1-6-1.                                                 NC1714.2
   000605         060800     IF      WRK-DS-18V00 EQUAL TO 000000000000000001             NC1714.2 45
   000606      1  060900             PERFORM PASS                                         NC1714.2 327
   000607      1  061000             GO TO   DIV-WRITE-F1-6.                              NC1714.2 616
   000608         061100     GO TO   DIV-FAIL-F1-6.                                       NC1714.2 612
   000609         061200 DIV-DELETE-F1-6.                                                 NC1714.2
   000610         061300     PERFORM DE-LETE.                                             NC1714.2 329
   000611         061400     GO TO   DIV-WRITE-F1-6.                                      NC1714.2 616
   000612         061500 DIV-FAIL-F1-6.                                                   NC1714.2
   000613         061600     MOVE  000000000000000001 TO CORRECT-18V0.                    NC1714.2 208
   000614         061700     MOVE  WRK-DS-18V00       TO COMPUTED-18V0.                   NC1714.2 45 195
   000615         061800     PERFORM FAIL.                                                NC1714.2 328
   000616         061900 DIV-WRITE-F1-6.                                                  NC1714.2
   000617         062000     MOVE "DIV-TEST-F1-6         " TO PAR-NAME.                   NC1714.2 177
   000618         062100     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000619         062200 DIV-INIT-F1-7.                                                   NC1714.2
   000620         062300     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000621         062400     MOVE 2 TO WRK-DS-12V00.                                      NC1714.2 76
   000622         062500 DIV-TEST-F1-7-0.                                                 NC1714.2
   000623         062600     DIVIDE 4 INTO WRK-DS-12V00 ROUNDED.                          NC1714.2 76
   000624         062700 DIV-TEST-F1-7-1.                                                 NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     IF WRK-DS-12V00 EQUAL TO 000000000001                        NC1714.2 76
   000626      1  062900         PERFORM PASS                                             NC1714.2 327
   000627      1  063000         GO TO DIV-WRITE-F1-7.                                    NC1714.2 636
   000628         063100     GO TO DIV-FAIL-F1-7.                                         NC1714.2 632
   000629         063200 DIV-DELETE-F1-7.                                                 NC1714.2
   000630         063300     PERFORM DE-LETE.                                             NC1714.2 329
   000631         063400     GO TO DIV-WRITE-F1-7.                                        NC1714.2 636
   000632         063500 DIV-FAIL-F1-7.                                                   NC1714.2
   000633         063600     MOVE  WRK-DS-12V00       TO COMPUTED-18V0.                   NC1714.2 76 195
   000634         063700     MOVE  000000000001       TO CORRECT-18V0.                    NC1714.2 208
   000635         063800     PERFORM FAIL.                                                NC1714.2 328
   000636         063900 DIV-WRITE-F1-7.                                                  NC1714.2
   000637         064000     MOVE "DIV-TEST-F1-7         " TO PAR-NAME.                   NC1714.2 177
   000638         064100     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000639         064200 DIV-INIT-F1-8.                                                   NC1714.2
   000640         064300     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000641         064400     MOVE  1 TO WRK-DS-01V00.                                     NC1714.2 77
   000642         064500     MOVE "0" TO WRK-XN-00001.                                    NC1714.2 51
   000643         064600 DIV-TEST-F1-8-0.                                                 NC1714.2
   000644         064700     DIVIDE 0.1 INTO WRK-DS-01V00 ON SIZE ERROR                   NC1714.2 77
   000645      1  064800         MOVE "1" TO WRK-XN-00001.                                NC1714.2 51
   000646         064900 DIV-TEST-F1-8-1.                                                 NC1714.2
   000647         065000     IF WRK-DS-01V00 EQUAL TO 1                                   NC1714.2 77
   000648      1  065100         PERFORM PASS                                             NC1714.2 327
   000649      1  065200         GO TO DIV-WRITE-F1-8-1.                                  NC1714.2 659
   000650         065300     GO TO DIV-FAIL-F1-8-1.                                       NC1714.2 654
   000651         065400 DIV-DELETE-F1-8-1.                                               NC1714.2
   000652         065500     PERFORM DE-LETE.                                             NC1714.2 329
   000653         065600     GO TO DIV-WRITE-F1-8-1.                                      NC1714.2 659
   000654         065700 DIV-FAIL-F1-8-1.                                                 NC1714.2
   000655         065800     MOVE  1                  TO CORRECT-N.                       NC1714.2 203
   000656         065900     MOVE  WRK-DS-01V00       TO COMPUTED-N.                      NC1714.2 77 189
   000657         066000     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1714.2 182
   000658         066100     PERFORM FAIL.                                                NC1714.2 328
   000659         066200 DIV-WRITE-F1-8-1.                                                NC1714.2
   000660         066300     MOVE "DIV-TEST-F1-8-1         " TO PAR-NAME.                 NC1714.2 177
   000661         066400     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000662         066500 DIV-TEST-F1-8-2.                                                 NC1714.2
   000663         066600     IF WRK-XN-00001 EQUAL TO "1"                                 NC1714.2 51
   000664      1  066700         PERFORM PASS                                             NC1714.2 327
   000665      1  066800         GO TO DIV-WRITE-F1-8-2.                                  NC1714.2 673
   000666         066900     MOVE "1" TO CORRECT-A.                                       NC1714.2 202
   000667         067000     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1714.2 51 188
   000668         067100     MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.              NC1714.2 182
   000669         067200     PERFORM FAIL.                                                NC1714.2 328
   000670         067300     GO TO DIV-WRITE-F1-8-2.                                      NC1714.2 673
   000671         067400 DIV-DELETE-F1-8-2.                                               NC1714.2
   000672         067500     PERFORM DE-LETE.                                             NC1714.2 329
   000673         067600 DIV-WRITE-F1-8-2.                                                NC1714.2
   000674         067700     MOVE "DIV-TEST-F1-8-2         " TO PAR-NAME.                 NC1714.2 177
   000675         067800     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000676         067900 DIV-INIT-F1-9.                                                   NC1714.2
   000677         068000     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000678         068100     MOVE -.000000001 TO WRK-DS-09V09.                            NC1714.2 58
   000679         068200     MOVE "1" TO WRK-XN-00001.                                    NC1714.2 51
   000680         068300 DIV-TEST-F1-9-0.                                                 NC1714.2
   000681         068400     DIVIDE A01ONE-DS-P0801 INTO WRK-DS-09V09 ON SIZE ERROR       NC1714.2 63 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682      1  068500         MOVE "0" TO WRK-XN-00001.                                NC1714.2 51
   000683         068600 DIV-TEST-F1-9-1.                                                 NC1714.2
   000684         068700     IF WRK-DS-18V00-S EQUAL TO -000000001000000000               NC1714.2 59
   000685      1  068800         PERFORM PASS                                             NC1714.2 327
   000686      1  068900         GO TO DIV-WRITE-F1-9-1.                                  NC1714.2 695
   000687         069000     GO TO DIV-FAIL-F1-9-1.                                       NC1714.2 691
   000688         069100 DIV-DELETE-F1-9-1.                                               NC1714.2
   000689         069200     PERFORM DE-LETE.                                             NC1714.2 329
   000690         069300     GO TO DIV-WRITE-F1-9-1.                                      NC1714.2 695
   000691         069400 DIV-FAIL-F1-9-1.                                                 NC1714.2
   000692         069500     MOVE -000000001000000000 TO CORRECT-18V0.                    NC1714.2 208
   000693         069600     MOVE WRK-DS-18V00-S TO COMPUTED-18V0.                        NC1714.2 59 195
   000694         069700     PERFORM FAIL.                                                NC1714.2 328
   000695         069800 DIV-WRITE-F1-9-1.                                                NC1714.2
   000696         069900     MOVE "DIV-TEST-F1-9-1         " TO PAR-NAME.                 NC1714.2 177
   000697         070000     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000698         070100 DIV-TEST-F1-9-2.                                                 NC1714.2
   000699         070200     IF WRK-XN-00001 EQUAL TO "0"                                 NC1714.2 51
   000700      1  070300         MOVE "1" TO CORRECT-A                                    NC1714.2 202
   000701      1  070400         MOVE "0" TO COMPUTED-A                                   NC1714.2 188
   000702      1  070500         MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK NC1714.2 182
   000703      1  070600         PERFORM FAIL                                             NC1714.2 328
   000704      1  070700         GO TO DIV-WRITE-F1-9-2.                                  NC1714.2 709
   000705         070800     PERFORM PASS.                                                NC1714.2 327
   000706         070900     GO TO DIV-WRITE-F1-9-2.                                      NC1714.2 709
   000707         071000 DIV-DELETE-F1-9-2.                                               NC1714.2
   000708         071100     PERFORM DE-LETE.                                             NC1714.2 329
   000709         071200 DIV-WRITE-F1-9-2.                                                NC1714.2
   000710         071300     MOVE "DIV-TEST-F1-9-2         " TO PAR-NAME.                 NC1714.2 177
   000711         071400     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000712         071500 DIV-INIT-F1-10.                                                  NC1714.2
   000713         071600     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000714         071700     MOVE ZERO TO WRK-DS-01V00  AZERO-DS-05V05.                   NC1714.2 IMP 77 57
   000715         071800     MOVE "0" TO WRK-XN-00001.                                    NC1714.2 51
   000716         071900 DIV-TEST-F1-10-0.                                                NC1714.2
   000717         072000     DIVIDE AZERO-DS-05V05 INTO WRK-DS-01V00 ROUNDED              NC1714.2 57 77
   000718      1  072100         ON SIZE ERROR  MOVE "1" TO WRK-XN-00001.                 NC1714.2 51
   000719         072200 DIV-TEST-F1-10-1.                                                NC1714.2
   000720         072300     IF WRK-DS-01V00 EQUAL TO 0                                   NC1714.2 77
   000721      1  072400         PERFORM PASS                                             NC1714.2 327
   000722      1  072500         GO TO DIV-WRITE-F1-10-1.                                 NC1714.2 732
   000723         072600     GO TO DIV-FAIL-F1-10-1.                                      NC1714.2 727
   000724         072700 DIV-DELETE-F1-10-1.                                              NC1714.2
   000725         072800     PERFORM DE-LETE.                                             NC1714.2 329
   000726         072900     GO TO DIV-WRITE-F1-10-1.                                     NC1714.2 732
   000727         073000 DIV-FAIL-F1-10-1.                                                NC1714.2
   000728         073100     MOVE  0                  TO CORRECT-N.                       NC1714.2 203
   000729         073200     MOVE  WRK-DS-01V00       TO COMPUTED-N.                      NC1714.2 77 189
   000730         073300     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1714.2 182
   000731         073400     PERFORM FAIL.                                                NC1714.2 328
   000732         073500 DIV-WRITE-F1-10-1.                                               NC1714.2
   000733         073600     MOVE "DIV-TEST-F1-10-1         " TO PAR-NAME.                NC1714.2 177
   000734         073700     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000735         073800 DIV-TEST-F1-10-2.                                                NC1714.2
   000736         073900     IF WRK-XN-00001 EQUAL TO "1"                                 NC1714.2 51
   000737      1  074000         PERFORM PASS                                             NC1714.2 327
   000738      1  074100         GO TO DIV-WRITE-F1-10-2.                                 NC1714.2 747
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 DIV-FAIL-F1-10-2.                                                NC1714.2
   000740         074300     MOVE "1" TO CORRECT-A.                                       NC1714.2 202
   000741         074400     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1714.2 51 188
   000742         074500     MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.              NC1714.2 182
   000743         074600     PERFORM FAIL.                                                NC1714.2 328
   000744         074700     GO TO DIV-WRITE-F1-10-2.                                     NC1714.2 747
   000745         074800 DIV-DELETE-F1-10-2.                                              NC1714.2
   000746         074900     PERFORM DE-LETE.                                             NC1714.2 329
   000747         075000 DIV-WRITE-F1-10-2.                                               NC1714.2
   000748         075100     MOVE "DIV-TEST-F1-10-2         " TO PAR-NAME.                NC1714.2 177
   000749         075200     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000750         075300 DIV-INIT-F1-11.                                                  NC1714.2
   000751         075400     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000752         075500     MOVE A18ONES-DS-09V09 TO WRK-DS-09V09.                       NC1714.2 79 58
   000753         075600     MOVE "1" TO WRK-XN-00001.                                    NC1714.2 51
   000754         075700 DIV-TEST-F1-11-0.                                                NC1714.2
   000755         075800     DIVIDE A18ONES-DS-09V09 INTO WRK-DS-09V09 ROUNDED            NC1714.2 79 58
   000756      1  075900         ON SIZE ERROR MOVE "0" TO WRK-XN-00001.                  NC1714.2 51
   000757         076000 DIV-TEST-F1-11-1.                                                NC1714.2
   000758         076100     IF WRK-DS-18V00-S EQUAL TO 000000001000000000                NC1714.2 59
   000759      1  076200         PERFORM PASS                                             NC1714.2 327
   000760      1  076300         GO TO DIV-WRITE-F1-11-1.                                 NC1714.2 769
   000761         076400     GO TO DIV-FAIL-F1-11-1.                                      NC1714.2 765
   000762         076500 DIV-DELETE-F1-11-1.                                              NC1714.2
   000763         076600     PERFORM DE-LETE.                                             NC1714.2 329
   000764         076700     GO TO DIV-WRITE-F1-11-1.                                     NC1714.2 769
   000765         076800 DIV-FAIL-F1-11-1.                                                NC1714.2
   000766         076900     MOVE  000000001000000000 TO CORRECT-18V0.                    NC1714.2 208
   000767         077000     MOVE  WRK-DS-18V00       TO COMPUTED-18V0.                   NC1714.2 45 195
   000768         077100     PERFORM FAIL.                                                NC1714.2 328
   000769         077200 DIV-WRITE-F1-11-1.                                               NC1714.2
   000770         077300     MOVE "DIV-TEST-F1-11-1         " TO PAR-NAME.                NC1714.2 177
   000771         077400     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000772         077500 DIV-TEST-F1-11-2.                                                NC1714.2
   000773         077600     IF WRK-XN-00001 EQUAL TO "0"                                 NC1714.2 51
   000774      1  077700         MOVE WRK-XN-00001 TO COMPUTED-A                          NC1714.2 51 188
   000775      1  077800         MOVE "1" TO CORRECT-A                                    NC1714.2 202
   000776      1  077900         MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK   NC1714.2 182
   000777      1  078000         PERFORM FAIL                                             NC1714.2 328
   000778      1  078100         GO TO DIV-WRITE-F1-11-2.                                 NC1714.2 783
   000779         078200     PERFORM PASS.                                                NC1714.2 327
   000780         078300     GO TO DIV-WRITE-F1-11-2.                                     NC1714.2 783
   000781         078400 DIV-DELETE-F1-11-2.                                              NC1714.2
   000782         078500     PERFORM DE-LETE.                                             NC1714.2 329
   000783         078600 DIV-WRITE-F1-11-2.                                               NC1714.2
   000784         078700     MOVE "DIV-TEST-F1-11-2         " TO PAR-NAME.                NC1714.2 177
   000785         078800     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000786         078900 DIV-INIT-F1-12.                                                  NC1714.2
   000787         079000     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000788         079100     MOVE -99 TO WRK-DS-02V00.                                    NC1714.2 56
   000789         079200 DIV-TEST-F1-12-0.                                                NC1714.2
   000790         079300     DIVIDE A99-DS-02V00 INTO WRK-DS-02V00.                       NC1714.2 75 56
   000791         079400 DIV-TEST-F1-12-1.                                                NC1714.2
   000792         079500     IF WRK-DS-02V00 EQUAL TO -01                                 NC1714.2 56
   000793      1  079600         PERFORM PASS                                             NC1714.2 327
   000794      1  079700         GO TO DIV-WRITE-F1-12.                                   NC1714.2 802
   000795         079800 DIV-FAIL-F1-12.                                                  NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     MOVE  -01                TO CORRECT-N.                       NC1714.2 203
   000797         080000     MOVE  WRK-DS-02V00       TO COMPUTED-N.                      NC1714.2 56 189
   000798         080100     PERFORM FAIL.                                                NC1714.2 328
   000799         080200     GO TO DIV-WRITE-F1-12.                                       NC1714.2 802
   000800         080300 DIV-DELETE-F1-12.                                                NC1714.2
   000801         080400     PERFORM DE-LETE.                                             NC1714.2 329
   000802         080500 DIV-WRITE-F1-12.                                                 NC1714.2
   000803         080600     MOVE "DIV-TEST-F1-12         " TO PAR-NAME.                  NC1714.2 177
   000804         080700     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000805         080800 DIV-INIT-F1-13.                                                  NC1714.2
   000806         080900     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   000807         081000     MOVE -99.00 TO WRK-CS-02V02.                                 NC1714.2 84
   000808         081100 DIV-TEST-F1-13-0.                                                NC1714.2
   000809         081200     DIVIDE A990-DS-0201P INTO WRK-CS-02V02.                      NC1714.2 85 84
   000810         081300 DIV-TEST-F1-13-1.                                                NC1714.2
   000811         081400     MOVE WRK-CS-02V02 TO WRK-DS-06V06.                           NC1714.2 84 47
   000812         081500     IF WRK-DS-12V00-S EQUAL TO -000000100000                     NC1714.2 48
   000813      1  081600         PERFORM PASS                                             NC1714.2 327
   000814      1  081700     GO TO DIV-WRITE-F1-13.                                       NC1714.2 821
   000815         081800     MOVE -000000.100000 TO CORRECT-N.                            NC1714.2 203
   000816         081900     MOVE WRK-DS-06V06 TO COMPUTED-N.                             NC1714.2 47 189
   000817         082000     PERFORM FAIL.                                                NC1714.2 328
   000818         082100         GO TO DIV-WRITE-F1-13.                                   NC1714.2 821
   000819         082200 DIV-DELETE-F1-13.                                                NC1714.2
   000820         082300     PERFORM DE-LETE.                                             NC1714.2 329
   000821         082400 DIV-WRITE-F1-13.                                                 NC1714.2
   000822         082500     MOVE "DIV-TEST-F1-13         " TO PAR-NAME.                  NC1714.2 177
   000823         082600     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000824         082700*                                                                 NC1714.2
   000825         082800*                                                                 NC1714.2
   000826         082900 DIV-INIT-F1-14.                                                  NC1714.2
   000827         083000*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1714.2
   000828         083100     MOVE   "V1-67 6.4.2"  TO ANSI-REFERENCE.                     NC1714.2 233
   000829         083200     MOVE   "DIV-TEST-F1-14         " TO PAR-NAME                 NC1714.2 177
   000830         083300     MOVE   "Z" TO XRAY.                                          NC1714.2 86
   000831         083400     MOVE    1  TO REC-CT.                                        NC1714.2 224
   000832         083500     MOVE    1620.36 TO DIV1.                                     NC1714.2 153
   000833         083600     MOVE    44.1    TO DIV2.                                     NC1714.2 155
   000834         083700 DIV-TEST-F1-14-0.                                                NC1714.2
   000835         083800     DIVIDE  DIV2 INTO DIV1                                       NC1714.2 155 153
   000836         083900      NOT ON SIZE ERROR                                           NC1714.2
   000837      1  084000             MOVE "N" TO XRAY.                                    NC1714.2 86
   000838         084100     GO TO   DIV-TEST-F1-14-1.                                    NC1714.2 843
   000839         084200 DIV-DELETE-F1-14-1.                                              NC1714.2
   000840         084300     PERFORM DE-LETE.                                             NC1714.2 329
   000841         084400     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000842         084500     GO TO   DIV-INIT-F1-15.                                      NC1714.2 869
   000843         084600 DIV-TEST-F1-14-1.                                                NC1714.2
   000844         084700     MOVE   "DIV-TEST-F1-14-1 " TO PAR-NAME.                      NC1714.2 177
   000845         084800     IF      DIV1    = 36.74                                      NC1714.2 153
   000846      1  084900             PERFORM PASS                                         NC1714.2 327
   000847      1  085000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000848         085100     ELSE                                                         NC1714.2
   000849      1  085200             MOVE    DIV1 TO COMPUTED-N                           NC1714.2 153 189
   000850      1  085300             MOVE    36.74 TO CORRECT-N                           NC1714.2 203
   000851      1  085400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   000852      1  085500             PERFORM FAIL                                         NC1714.2 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853      1  085600             PERFORM PRINT-DETAIL.                                NC1714.2 331
   000854         085700     ADD     1  TO REC-CT.                                        NC1714.2 224
   000855         085800 DIV-TEST-F1-14-2.                                                NC1714.2
   000856         085900     MOVE   "DIV-TEST-F1-14-2 " TO PAR-NAME.                      NC1714.2 177
   000857         086000     IF      XRAY    = "N"                                        NC1714.2 86
   000858      1  086100             PERFORM PASS                                         NC1714.2 327
   000859      1  086200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000860         086300     ELSE                                                         NC1714.2
   000861      1  086400             MOVE    XRAY TO COMPUTED-X                           NC1714.2 86 187
   000862      1  086500             MOVE   "N"   TO CORRECT-X                            NC1714.2 201
   000863      1  086600             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1714.2
   000864      1  086700                  TO RE-MARK                                      NC1714.2 182
   000865      1  086800             PERFORM FAIL                                         NC1714.2 328
   000866      1  086900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   000867         087000*                                                                 NC1714.2
   000868         087100*                                                                 NC1714.2
   000869         087200 DIV-INIT-F1-15.                                                  NC1714.2
   000870         087300*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1714.2
   000871         087400     MOVE   "V1-67 6.4.2"  TO ANSI-REFERENCE.                     NC1714.2 233
   000872         087500     MOVE   "DIV-TEST-F1-15         " TO PAR-NAME                 NC1714.2 177
   000873         087600     MOVE A18ONES-DS-09V09 TO WRK-DS-09V09.                       NC1714.2 79 58
   000874         087700     MOVE "1" TO WRK-XN-00001.                                    NC1714.2 51
   000875         087800     MOVE  1    TO REC-CT.                                        NC1714.2 224
   000876         087900 DIV-TEST-F1-15-0.                                                NC1714.2
   000877         088000     DIVIDE A18ONES-DS-09V09                                      NC1714.2 79
   000878         088100       INTO WRK-DS-09V09 ROUNDED                                  NC1714.2 58
   000879      1  088200     NOT ON SIZE ERROR MOVE "0" TO WRK-XN-00001.                  NC1714.2 51
   000880         088300     GO TO   DIV-TEST-F1-15-1.                                    NC1714.2 885
   000881         088400 DIV-DELETE-F1-15-1.                                              NC1714.2
   000882         088500     PERFORM DE-LETE.                                             NC1714.2 329
   000883         088600     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000884         088700     GO TO   DIV-INIT-F1-16.                                      NC1714.2 912
   000885         088800 DIV-TEST-F1-15-1.                                                NC1714.2
   000886         088900     MOVE   "DIV-TEST-F1-15-1         " TO PAR-NAME.              NC1714.2 177
   000887         089000     IF      WRK-XN-00001 = "0"                                   NC1714.2 51
   000888      1  089100             PERFORM PASS                                         NC1714.2 327
   000889      1  089200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000890         089300     ELSE                                                         NC1714.2
   000891      1  089400             MOVE   "0"           TO CORRECT-X                    NC1714.2 201
   000892      1  089500             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   000893      1  089600             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC1714.2
   000894      1  089700                  TO RE-MARK                                      NC1714.2 182
   000895      1  089800             PERFORM FAIL                                         NC1714.2 328
   000896      1  089900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   000897         090000     ADD     1 TO REC-CT.                                         NC1714.2 224
   000898         090100 DIV-TEST-F1-15-2.                                                NC1714.2
   000899         090200     MOVE   "DIV-TEST-F1-15-2         " TO PAR-NAME.              NC1714.2 177
   000900         090300     IF      WRK-DS-09V09 =  1                                    NC1714.2 58
   000901      1  090400             PERFORM PASS                                         NC1714.2 327
   000902      1  090500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000903         090600     ELSE                                                         NC1714.2
   000904      1  090700             MOVE    1             TO CORRECT-N                   NC1714.2 203
   000905      1  090800             MOVE    WRK-DS-09V09  TO COMPUTED-18V0               NC1714.2 58 195
   000906      1  090900             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1714.2
   000907      1  091000                  TO RE-MARK                                      NC1714.2 182
   000908      1  091100             PERFORM FAIL                                         NC1714.2 328
   000909      1  091200             PERFORM PRINT-DETAIL.                                NC1714.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300*                                                                 NC1714.2
   000911         091400*                                                                 NC1714.2
   000912         091500 DIV-INIT-F1-16.                                                  NC1714.2
   000913         091600*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1714.2
   000914         091700     MOVE   "V1-67 6.4.2"  TO ANSI-REFERENCE.                     NC1714.2 233
   000915         091800     MOVE   "DIV-TEST-F1-16         " TO PAR-NAME.                NC1714.2 177
   000916         091900     MOVE   "Z" TO XRAY.                                          NC1714.2 86
   000917         092000     MOVE   1620.36 TO DIV1.                                      NC1714.2 153
   000918         092100     MOVE     44.1  TO DIV2.                                      NC1714.2 155
   000919         092200     MOVE    1    TO REC-CT.                                      NC1714.2 224
   000920         092300 DIV-TEST-F1-16-0.                                                NC1714.2
   000921         092400     DIVIDE  DIV2 INTO DIV1                                       NC1714.2 155 153
   000922         092500          ON SIZE ERROR                                           NC1714.2
   000923      1  092600             MOVE "E" TO XRAY                                     NC1714.2 86
   000924         092700      NOT ON SIZE ERROR                                           NC1714.2
   000925      1  092800             MOVE "N" TO XRAY.                                    NC1714.2 86
   000926         092900     GO TO   DIV-TEST-F1-16-1.                                    NC1714.2 931
   000927         093000 DIV-DELETE-F1-16-1.                                              NC1714.2
   000928         093100     PERFORM DE-LETE.                                             NC1714.2 329
   000929         093200     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000930         093300     GO TO   DIV-INIT-F1-17.                                      NC1714.2 957
   000931         093400 DIV-TEST-F1-16-1.                                                NC1714.2
   000932         093500     MOVE   "DIV-TEST-F1-16-1 " TO PAR-NAME.                      NC1714.2 177
   000933         093600     IF      XRAY    = "N"                                        NC1714.2 86
   000934      1  093700             PERFORM PASS                                         NC1714.2 327
   000935      1  093800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000936         093900     ELSE                                                         NC1714.2
   000937      1  094000             MOVE   "N"   TO CORRECT-X                            NC1714.2 201
   000938      1  094100             MOVE    XRAY TO COMPUTED-X                           NC1714.2 86 187
   000939      1  094200             MOVE  "NOT SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK NC1714.2 182
   000940      1  094300             PERFORM FAIL                                         NC1714.2 328
   000941      1  094400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   000942         094500     ADD     1 TO REC-CT.                                         NC1714.2 224
   000943         094600 DIV-TEST-F1-16-2.                                                NC1714.2
   000944         094700     MOVE   "DIV-TEST-F1-16-2" TO PAR-NAME.                       NC1714.2 177
   000945         094800     IF      DIV1    = 36.74                                      NC1714.2 153
   000946      1  094900             PERFORM PASS                                         NC1714.2 327
   000947      1  095000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000948         095100     ELSE                                                         NC1714.2
   000949      1  095200             ADD     1 TO REC-CT                                  NC1714.2 224
   000950      1  095300             MOVE    DIV1 TO COMPUTED-N                           NC1714.2 153 189
   000951      1  095400             MOVE    36.74 TO CORRECT-N                           NC1714.2 203
   000952      1  095500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   000953      1  095600             PERFORM FAIL                                         NC1714.2 328
   000954      1  095700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   000955         095800*                                                                 NC1714.2
   000956         095900*                                                                 NC1714.2
   000957         096000 DIV-INIT-F1-17.                                                  NC1714.2
   000958         096100*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1714.2
   000959         096200     MOVE   "DIV-TEST-F1-17         " TO PAR-NAME                 NC1714.2 177
   000960         096300     MOVE   "V1-67 6.4.2"  TO ANSI-REFERENCE.                     NC1714.2 233
   000961         096400     MOVE A18ONES-DS-09V09 TO WRK-DS-09V09.                       NC1714.2 79 58
   000962         096500     MOVE "0" TO WRK-XN-00001.                                    NC1714.2 51
   000963         096600     MOVE    1    TO REC-CT.                                      NC1714.2 224
   000964         096700 DIV-TEST-F1-17-0.                                                NC1714.2
   000965         096800     DIVIDE A18ONES-DS-09V09                                      NC1714.2 79
   000966         096900       INTO WRK-DS-09V09 ROUNDED                                  NC1714.2 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000         ON SIZE ERROR                                            NC1714.2
   000968      1  097100            MOVE "1" TO WRK-XN-00001                              NC1714.2 51
   000969         097200     NOT ON SIZE ERROR                                            NC1714.2
   000970      1  097300            MOVE "2" TO WRK-XN-00001.                             NC1714.2 51
   000971         097400     GO TO   DIV-TEST-F1-17-1.                                    NC1714.2 976
   000972         097500 DIV-DELETE-F1-17-1.                                              NC1714.2
   000973         097600     PERFORM DE-LETE.                                             NC1714.2 329
   000974         097700     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   000975         097800     GO TO   DIV-INIT-F1-18.                                      NC1714.2 999
   000976         097900 DIV-TEST-F1-17-1.                                                NC1714.2
   000977         098000     MOVE   "DIV-TEST-F1-17-1 " TO PAR-NAME.                      NC1714.2 177
   000978         098100     IF      WRK-XN-00001 = "2"                                   NC1714.2 51
   000979      1  098200             PERFORM PASS                                         NC1714.2 327
   000980      1  098300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000981         098400     ELSE                                                         NC1714.2
   000982      1  098500             MOVE   "2"           TO CORRECT-X                    NC1714.2 201
   000983      1  098600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   000984      1  098700             PERFORM FAIL                                         NC1714.2 328
   000985      1  098800             PERFORM PRINT-DETAIL.                                NC1714.2 331
   000986         098900     ADD     1 TO REC-CT.                                         NC1714.2 224
   000987         099000 DIV-TEST-F1-17-2.                                                NC1714.2
   000988         099100     MOVE   "DIV-TEST-F1-17-2 " TO PAR-NAME.                      NC1714.2 177
   000989         099200     IF      WRK-DS-09V09 =  1                                    NC1714.2 58
   000990      1  099300             PERFORM PASS                                         NC1714.2 327
   000991      1  099400             PERFORM PRINT-DETAIL                                 NC1714.2 331
   000992         099500     ELSE                                                         NC1714.2
   000993      1  099600             MOVE    1             TO CORRECT-18V0                NC1714.2 208
   000994      1  099700             MOVE    WRK-DS-09V09  TO COMPUTED-18V0               NC1714.2 58 195
   000995      1  099800             PERFORM FAIL                                         NC1714.2 328
   000996      1  099900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   000997         100000*                                                                 NC1714.2
   000998         100100*                                                                 NC1714.2
   000999         100200 DIV-INIT-F1-18.                                                  NC1714.2
   001000         100300*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1714.2
   001001         100400     MOVE   "V1-81 6.11.4 GR1"  TO ANSI-REFERENCE.                NC1714.2 233
   001002         100500     MOVE   "DIV-TEST-F1-18" TO PAR-NAME.                         NC1714.2 177
   001003         100600     MOVE     1.001          TO WRK-DU-1V3-1.                     NC1714.2 96
   001004         100700     MOVE    15.44           TO WRK-DU-2V2-1.                     NC1714.2 107
   001005         100800     MOVE    60.89           TO WRK-DU-2V2-2.                     NC1714.2 108
   001006         100900     MOVE    60.99           TO WRK-DU-2V2-3.                     NC1714.2 109
   001007         101000     MOVE    60.99           TO WRK-DU-2V2-4.                     NC1714.2 110
   001008         101100     MOVE    10.0            TO WRK-DU-2V2-5.                     NC1714.2 111
   001009         101200     MOVE     1.001          TO WRK-DU-1V3-2.                     NC1714.2 97
   001010         101300     MOVE    10.0            TO WRK-DU-2V1-1.                     NC1714.2 104
   001011         101400     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001012         101500 DIV-TEST-F1-18-0.                                                NC1714.2
   001013         101600     DIVIDE  WRK-DU-1V3-1                                         NC1714.2 96
   001014         101700       INTO  WRK-DU-2V2-1                                         NC1714.2 107
   001015         101800             WRK-DU-2V2-2 ROUNDED                                 NC1714.2 108
   001016         101900             WRK-DU-2V2-3                                         NC1714.2 109
   001017         102000             WRK-DU-2V2-4 ROUNDED                                 NC1714.2 110
   001018         102100             WRK-DU-1V3-2                                         NC1714.2 97
   001019         102200             WRK-DU-2V2-5                                         NC1714.2 111
   001020         102300             WRK-DU-2V1-1 ROUNDED.                                NC1714.2 104
   001021         102400     GO TO   DIV-TEST-F1-18-1.                                    NC1714.2 1026
   001022         102500 DIV-DELETE-F1-18.                                                NC1714.2
   001023         102600     PERFORM DE-LETE.                                             NC1714.2 329
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001025         102800     GO TO   DIV-INIT-F1-19.                                      NC1714.2 1097
   001026         102900 DIV-TEST-F1-18-1.                                                NC1714.2
   001027         103000     IF      WRK-DU-2V2-1 = 15.42                                 NC1714.2 107
   001028      1  103100             PERFORM PASS                                         NC1714.2 327
   001029      1  103200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001030         103300     ELSE                                                         NC1714.2
   001031      1  103400             PERFORM FAIL                                         NC1714.2 328
   001032      1  103500             MOVE    WRK-DU-2V2-1 TO COMPUTED-N                   NC1714.2 107 189
   001033      1  103600             MOVE    15.42        TO CORRECT-N                    NC1714.2 203
   001034      1  103700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001035         103800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001036         103900 DIV-TEST-F1-18-2.                                                NC1714.2
   001037         104000     IF      WRK-DU-2V2-2 = 60.83                                 NC1714.2 108
   001038      1  104100             PERFORM PASS                                         NC1714.2 327
   001039      1  104200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001040         104300     ELSE                                                         NC1714.2
   001041      1  104400             PERFORM FAIL                                         NC1714.2 328
   001042      1  104500             MOVE    WRK-DU-2V2-2 TO COMPUTED-N                   NC1714.2 108 189
   001043      1  104600             MOVE    60.83        TO CORRECT-N                    NC1714.2 203
   001044      1  104700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001045         104800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001046         104900 DIV-TEST-F1-18-3.                                                NC1714.2
   001047         105000     IF      WRK-DU-2V2-3 = 60.92                                 NC1714.2 109
   001048      1  105100             PERFORM PASS                                         NC1714.2 327
   001049      1  105200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001050         105300     ELSE                                                         NC1714.2
   001051      1  105400             PERFORM FAIL                                         NC1714.2 328
   001052      1  105500             MOVE    WRK-DU-2V2-3 TO COMPUTED-N                   NC1714.2 109 189
   001053      1  105600             MOVE    60.92        TO CORRECT-N                    NC1714.2 203
   001054      1  105700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001055         105800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001056         105900 DIV-TEST-F1-18-4.                                                NC1714.2
   001057         106000     IF      WRK-DU-2V2-4 = 60.93                                 NC1714.2 110
   001058      1  106100             PERFORM PASS                                         NC1714.2 327
   001059      1  106200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001060         106300     ELSE                                                         NC1714.2
   001061      1  106400             PERFORM FAIL                                         NC1714.2 328
   001062      1  106500             MOVE    WRK-DU-2V2-4 TO COMPUTED-N                   NC1714.2 110 189
   001063      1  106600             MOVE    60.93        TO CORRECT-N                    NC1714.2 203
   001064      1  106700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001065         106800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001066         106900 DIV-TEST-F1-18-5.                                                NC1714.2
   001067         107000     IF      WRK-DU-1V3-2 = 1.000                                 NC1714.2 97
   001068      1  107100             PERFORM PASS                                         NC1714.2 327
   001069      1  107200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001070         107300     ELSE                                                         NC1714.2
   001071      1  107400             PERFORM FAIL                                         NC1714.2 328
   001072      1  107500             MOVE    WRK-DU-1V3-2 TO COMPUTED-N                   NC1714.2 97 189
   001073      1  107600             MOVE    1.000        TO CORRECT-N                    NC1714.2 203
   001074      1  107700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001075         107800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001076         107900 DIV-TEST-F1-18-6.                                                NC1714.2
   001077         108000     IF      WRK-DU-2V2-5 = 09.99                                 NC1714.2 111
   001078      1  108100             PERFORM PASS                                         NC1714.2 327
   001079      1  108200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001080         108300     ELSE                                                         NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081      1  108400             PERFORM FAIL                                         NC1714.2 328
   001082      1  108500             MOVE    WRK-DU-2V2-5 TO COMPUTED-N                   NC1714.2 111 189
   001083      1  108600             MOVE    09.99        TO CORRECT-N                    NC1714.2 203
   001084      1  108700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001085         108800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001086         108900 DIV-TEST-F1-18-7.                                                NC1714.2
   001087         109000     IF      WRK-DU-2V1-1 = 10.0                                  NC1714.2 104
   001088      1  109100             PERFORM PASS                                         NC1714.2 327
   001089      1  109200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001090         109300     ELSE                                                         NC1714.2
   001091      1  109400             PERFORM FAIL                                         NC1714.2 328
   001092      1  109500             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1714.2 104 189
   001093      1  109600             MOVE    10.00        TO CORRECT-N                    NC1714.2 203
   001094      1  109700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001095         109800*                                                                 NC1714.2
   001096         109900*                                                                 NC1714.2
   001097         110000 DIV-INIT-F1-19.                                                  NC1714.2
   001098         110100*            ==-->   SIZE ERROR CONDITION  <--==                  NC1714.2
   001099         110200*            ==-->   NEW SIZE ERRROR TESTS <--==                  NC1714.2
   001100         110300     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001101         110400     MOVE   "DIV-TEST-F1-19" TO PAR-NAME.                         NC1714.2 177
   001102         110500     MOVE      .01           TO WRK-DU-0V2-1.                     NC1714.2 91
   001103         110600     MOVE     1.001          TO WRK-DU-1V3-1.                     NC1714.2 96
   001104         110700     MOVE    15.44           TO WRK-DU-2V2-1.                     NC1714.2 107
   001105         110800     MOVE    60.89           TO WRK-DU-2V2-2.                     NC1714.2 108
   001106         110900     MOVE    60.99           TO WRK-DU-2V2-3.                     NC1714.2 109
   001107         111000     MOVE    60.99           TO WRK-DU-2V2-4.                     NC1714.2 110
   001108         111100     MOVE    10.0            TO WRK-DU-2V2-5.                     NC1714.2 111
   001109         111200     MOVE     1.001          TO WRK-DU-1V3-2.                     NC1714.2 97
   001110         111300     MOVE    10.0            TO WRK-DU-2V1-1.                     NC1714.2 104
   001111         111400     MOVE     "0"            TO WRK-XN-00001.                     NC1714.2 51
   001112         111500     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001113         111600 DIV-TEST-F1-19-0.                                                NC1714.2
   001114         111700     DIVIDE  WRK-DU-0V2-1                                         NC1714.2 91
   001115         111800       INTO  WRK-DU-2V2-1                                         NC1714.2 107
   001116         111900             WRK-DU-2V2-2                                         NC1714.2 108
   001117         112000             WRK-DU-2V2-3                                         NC1714.2 109
   001118         112100             WRK-DU-2V2-4                                         NC1714.2 110
   001119         112200             WRK-DU-1V3-2                                         NC1714.2 97
   001120         112300             WRK-DU-2V2-5                                         NC1714.2 111
   001121         112400             WRK-DU-2V1-1                                         NC1714.2 104
   001122         112500          ON SIZE ERROR                                           NC1714.2
   001123      1  112600             MOVE   "1"  TO WRK-XN-00001.                         NC1714.2 51
   001124         112700     GO TO   DIV-TEST-F1-19-1.                                    NC1714.2 1129
   001125         112800 DIV-DELETE-F1-19.                                                NC1714.2
   001126         112900     PERFORM DE-LETE.                                             NC1714.2 329
   001127         113000     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001128         113100     GO TO   DIV-INIT-F1-20.                                      NC1714.2 1218
   001129         113200 DIV-TEST-F1-19-1.                                                NC1714.2
   001130         113300     IF      WRK-DU-2V2-1 = 15.44                                 NC1714.2 107
   001131      1  113400             PERFORM PASS                                         NC1714.2 327
   001132      1  113500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001133         113600     ELSE                                                         NC1714.2
   001134      1  113700             MOVE   "NOT AFFECTED BY SIZE ERROR" TO RE-MARK       NC1714.2 182
   001135      1  113800             PERFORM FAIL                                         NC1714.2 328
   001136      1  113900             MOVE    WRK-DU-2V2-1 TO COMPUTED-N                   NC1714.2 107 189
   001137      1  114000             MOVE    15.44        TO CORRECT-N                    NC1714.2 203
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114100             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001139         114200     ADD 1 TO REC-CT.                                             NC1714.2 224
   001140         114300 DIV-TEST-F1-19-2.                                                NC1714.2
   001141         114400     IF      WRK-DU-2V2-2 = 60.89                                 NC1714.2 108
   001142      1  114500             PERFORM PASS                                         NC1714.2 327
   001143      1  114600             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001144         114700     ELSE                                                         NC1714.2
   001145      1  114800             MOVE   "NOT AFFECTED BY SIZE ERROR" TO RE-MARK       NC1714.2 182
   001146      1  114900             PERFORM FAIL                                         NC1714.2 328
   001147      1  115000             MOVE    WRK-DU-2V2-2 TO COMPUTED-N                   NC1714.2 108 189
   001148      1  115100             MOVE    60.89        TO CORRECT-N                    NC1714.2 203
   001149      1  115200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001150         115300     ADD 1 TO REC-CT.                                             NC1714.2 224
   001151         115400 DIV-TEST-F1-19-3.                                                NC1714.2
   001152         115500     IF      WRK-DU-2V2-3 = 60.99                                 NC1714.2 109
   001153      1  115600             PERFORM PASS                                         NC1714.2 327
   001154      1  115700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001155         115800     ELSE                                                         NC1714.2
   001156      1  115900             MOVE   "NOT AFFECTED BY SIZE ERROR" TO RE-MARK       NC1714.2 182
   001157      1  116000             PERFORM FAIL                                         NC1714.2 328
   001158      1  116100             MOVE    WRK-DU-2V2-3 TO COMPUTED-N                   NC1714.2 109 189
   001159      1  116200             MOVE    60.92        TO CORRECT-N                    NC1714.2 203
   001160      1  116300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001161         116400     ADD 1 TO REC-CT.                                             NC1714.2 224
   001162         116500 DIV-TEST-F1-19-4.                                                NC1714.2
   001163         116600     IF      WRK-DU-2V2-4 = 60.99                                 NC1714.2 110
   001164      1  116700             PERFORM PASS                                         NC1714.2 327
   001165      1  116800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001166         116900     ELSE                                                         NC1714.2
   001167      1  117000             MOVE   "NOT AFFECTED BY SIZE ERROR" TO RE-MARK       NC1714.2 182
   001168      1  117100             PERFORM FAIL                                         NC1714.2 328
   001169      1  117200             MOVE    WRK-DU-2V2-4 TO COMPUTED-N                   NC1714.2 110 189
   001170      1  117300             MOVE    60.99        TO CORRECT-N                    NC1714.2 203
   001171      1  117400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001172         117500     ADD 1 TO REC-CT.                                             NC1714.2 224
   001173         117600 DIV-TEST-F1-19-5.                                                NC1714.2
   001174         117700     IF      WRK-DU-1V3-2 = 1.001                                 NC1714.2 97
   001175      1  117800             PERFORM PASS                                         NC1714.2 327
   001176      1  117900             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001177         118000     ELSE                                                         NC1714.2
   001178      1  118100             MOVE   "NOT AFFECTED BY SIZE ERROR" TO RE-MARK       NC1714.2 182
   001179      1  118200             PERFORM FAIL                                         NC1714.2 328
   001180      1  118300             MOVE    WRK-DU-1V3-2 TO COMPUTED-N                   NC1714.2 97 189
   001181      1  118400             MOVE    1.001        TO CORRECT-N                    NC1714.2 203
   001182      1  118500             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001183         118600     ADD 1 TO REC-CT.                                             NC1714.2 224
   001184         118700 DIV-TEST-F1-19-6.                                                NC1714.2
   001185         118800     IF      WRK-DU-2V2-5 = 10.00                                 NC1714.2 111
   001186      1  118900             PERFORM PASS                                         NC1714.2 327
   001187      1  119000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001188         119100     ELSE                                                         NC1714.2
   001189      1  119200             MOVE   "NOT AFFECTED BY SIZE ERROR" TO RE-MARK       NC1714.2 182
   001190      1  119300             PERFORM FAIL                                         NC1714.2 328
   001191      1  119400             MOVE    WRK-DU-2V2-5 TO COMPUTED-N                   NC1714.2 111 189
   001192      1  119500             MOVE    09.99        TO CORRECT-N                    NC1714.2 203
   001193      1  119600             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001194         119700     ADD 1 TO REC-CT.                                             NC1714.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800 DIV-TEST-F1-19-7.                                                NC1714.2
   001196         119900     IF      WRK-DU-2V1-1 = 10.0                                  NC1714.2 104
   001197      1  120000             PERFORM PASS                                         NC1714.2 327
   001198      1  120100             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001199         120200     ELSE                                                         NC1714.2
   001200      1  120300             MOVE   "NOT AFFECTED BY SIZE ERROR" TO RE-MARK       NC1714.2 182
   001201      1  120400             PERFORM FAIL                                         NC1714.2 328
   001202      1  120500             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1714.2 104 189
   001203      1  120600             MOVE    10.0         TO CORRECT-N                    NC1714.2 203
   001204      1  120700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001205         120800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001206         120900 DIV-TEST-F1-19-8.                                                NC1714.2
   001207         121000     IF      WRK-XN-00001 = "1"                                   NC1714.2 51
   001208      1  121100             PERFORM PASS                                         NC1714.2 327
   001209      1  121200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001210         121300     ELSE                                                         NC1714.2
   001211      1  121400             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1714.2 182
   001212      1  121500             PERFORM FAIL                                         NC1714.2 328
   001213      1  121600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001214      1  121700             MOVE    "1"          TO CORRECT-X                    NC1714.2 201
   001215      1  121800             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001216         121900*                                                                 NC1714.2
   001217         122000*                                                                 NC1714.2
   001218         122100 DIV-INIT-F1-20.                                                  NC1714.2
   001219         122200*            ==-->  NO SIZE ERROR CONDITION  <--==                NC1714.2
   001220         122300*            ==-->   NEW SIZE ERRROR TESTS <--==                  NC1714.2
   001221         122400     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001222         122500     MOVE   "DIV-TEST-F1-20" TO PAR-NAME.                         NC1714.2 177
   001223         122600     MOVE     1.001          TO WRK-DU-1V3-1.                     NC1714.2 96
   001224         122700     MOVE    15.44           TO WRK-DU-2V2-1.                     NC1714.2 107
   001225         122800     MOVE    60.89           TO WRK-DU-2V2-2.                     NC1714.2 108
   001226         122900     MOVE    60.99           TO WRK-DU-2V2-3.                     NC1714.2 109
   001227         123000     MOVE    60.99           TO WRK-DU-2V2-4.                     NC1714.2 110
   001228         123100     MOVE    10.0            TO WRK-DU-2V2-5.                     NC1714.2 111
   001229         123200     MOVE     1.001          TO WRK-DU-1V3-2.                     NC1714.2 97
   001230         123300     MOVE    10.0            TO WRK-DU-2V1-1.                     NC1714.2 104
   001231         123400     MOVE     "0"            TO WRK-XN-00001.                     NC1714.2 51
   001232         123500     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001233         123600 DIV-TEST-F1-20-0.                                                NC1714.2
   001234         123700     DIVIDE  WRK-DU-1V3-1                                         NC1714.2 96
   001235         123800       INTO  WRK-DU-2V2-1                                         NC1714.2 107
   001236         123900             WRK-DU-2V2-2 ROUNDED                                 NC1714.2 108
   001237         124000             WRK-DU-2V2-3                                         NC1714.2 109
   001238         124100             WRK-DU-2V2-4 ROUNDED                                 NC1714.2 110
   001239         124200             WRK-DU-1V3-2                                         NC1714.2 97
   001240         124300             WRK-DU-2V2-5                                         NC1714.2 111
   001241         124400             WRK-DU-2V1-1 ROUNDED                                 NC1714.2 104
   001242         124500          ON SIZE ERROR                                           NC1714.2
   001243      1  124600             MOVE   "1"  TO WRK-XN-00001.                         NC1714.2 51
   001244         124700     GO TO   DIV-TEST-F1-20-1.                                    NC1714.2 1249
   001245         124800 DIV-DELETE-F1-20.                                                NC1714.2
   001246         124900     PERFORM DE-LETE.                                             NC1714.2 329
   001247         125000     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001248         125100     GO TO   DIV-INIT-F1-21.                                      NC1714.2 1339
   001249         125200 DIV-TEST-F1-20-1.                                                NC1714.2
   001250         125300     IF      WRK-DU-2V2-1 = 15.42                                 NC1714.2 107
   001251      1  125400             PERFORM PASS                                         NC1714.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252      1  125500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001253         125600     ELSE                                                         NC1714.2
   001254      1  125700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001255      1  125800             PERFORM FAIL                                         NC1714.2 328
   001256      1  125900             MOVE    WRK-DU-2V2-1 TO COMPUTED-N                   NC1714.2 107 189
   001257      1  126000             MOVE    15.42        TO CORRECT-N                    NC1714.2 203
   001258      1  126100             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001259         126200     ADD 1 TO REC-CT.                                             NC1714.2 224
   001260         126300 DIV-TEST-F1-20-2.                                                NC1714.2
   001261         126400     IF      WRK-DU-2V2-2 = 60.83                                 NC1714.2 108
   001262      1  126500             PERFORM PASS                                         NC1714.2 327
   001263      1  126600             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001264         126700     ELSE                                                         NC1714.2
   001265      1  126800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001266      1  126900             PERFORM FAIL                                         NC1714.2 328
   001267      1  127000             MOVE    WRK-DU-2V2-2 TO COMPUTED-N                   NC1714.2 108 189
   001268      1  127100             MOVE    60.83        TO CORRECT-N                    NC1714.2 203
   001269      1  127200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001270         127300     ADD 1 TO REC-CT.                                             NC1714.2 224
   001271         127400 DIV-TEST-F1-20-3.                                                NC1714.2
   001272         127500     IF      WRK-DU-2V2-3 = 60.92                                 NC1714.2 109
   001273      1  127600             PERFORM PASS                                         NC1714.2 327
   001274      1  127700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001275         127800     ELSE                                                         NC1714.2
   001276      1  127900             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001277      1  128000             PERFORM FAIL                                         NC1714.2 328
   001278      1  128100             MOVE    WRK-DU-2V2-3 TO COMPUTED-N                   NC1714.2 109 189
   001279      1  128200             MOVE    60.92        TO CORRECT-N                    NC1714.2 203
   001280      1  128300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001281         128400     ADD 1 TO REC-CT.                                             NC1714.2 224
   001282         128500 DIV-TEST-F1-20-4.                                                NC1714.2
   001283         128600     IF      WRK-DU-2V2-4 = 60.93                                 NC1714.2 110
   001284      1  128700             PERFORM PASS                                         NC1714.2 327
   001285      1  128800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001286         128900     ELSE                                                         NC1714.2
   001287      1  129000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001288      1  129100             PERFORM FAIL                                         NC1714.2 328
   001289      1  129200             MOVE    WRK-DU-2V2-4 TO COMPUTED-N                   NC1714.2 110 189
   001290      1  129300             MOVE    60.93        TO CORRECT-N                    NC1714.2 203
   001291      1  129400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001292         129500     ADD 1 TO REC-CT.                                             NC1714.2 224
   001293         129600 DIV-TEST-F1-20-5.                                                NC1714.2
   001294         129700     IF      WRK-DU-1V3-2 = 1.000                                 NC1714.2 97
   001295      1  129800             PERFORM PASS                                         NC1714.2 327
   001296      1  129900             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001297         130000     ELSE                                                         NC1714.2
   001298      1  130100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001299      1  130200             PERFORM FAIL                                         NC1714.2 328
   001300      1  130300             MOVE    WRK-DU-1V3-2 TO COMPUTED-N                   NC1714.2 97 189
   001301      1  130400             MOVE    1.000        TO CORRECT-N                    NC1714.2 203
   001302      1  130500             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001303         130600     ADD 1 TO REC-CT.                                             NC1714.2 224
   001304         130700 DIV-TEST-F1-20-6.                                                NC1714.2
   001305         130800     IF      WRK-DU-2V2-5 = 09.99                                 NC1714.2 111
   001306      1  130900             PERFORM PASS                                         NC1714.2 327
   001307      1  131000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001308         131100     ELSE                                                         NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309      1  131200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001310      1  131300             PERFORM FAIL                                         NC1714.2 328
   001311      1  131400             MOVE    WRK-DU-2V2-5 TO COMPUTED-N                   NC1714.2 111 189
   001312      1  131500             MOVE    09.99        TO CORRECT-N                    NC1714.2 203
   001313      1  131600             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001314         131700     ADD 1 TO REC-CT.                                             NC1714.2 224
   001315         131800 DIV-TEST-F1-20-7.                                                NC1714.2
   001316         131900     IF      WRK-DU-2V1-1 = 10.0                                  NC1714.2 104
   001317      1  132000             PERFORM PASS                                         NC1714.2 327
   001318      1  132100             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001319         132200     ELSE                                                         NC1714.2
   001320      1  132300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001321      1  132400             PERFORM FAIL                                         NC1714.2 328
   001322      1  132500             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1714.2 104 189
   001323      1  132600             MOVE    10.00        TO CORRECT-N                    NC1714.2 203
   001324      1  132700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001325         132800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001326         132900 DIV-TEST-F1-20-8.                                                NC1714.2
   001327         133000     IF      WRK-XN-00001 = "0"                                   NC1714.2 51
   001328      1  133100             PERFORM PASS                                         NC1714.2 327
   001329      1  133200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001330         133300     ELSE                                                         NC1714.2
   001331      1  133400             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001332      1  133500                  TO RE-MARK                                      NC1714.2 182
   001333      1  133600             PERFORM FAIL                                         NC1714.2 328
   001334      1  133700             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001335      1  133800             MOVE    "0"          TO CORRECT-X                    NC1714.2 201
   001336      1  133900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001337         134000*                                                                 NC1714.2
   001338         134100*                                                                 NC1714.2
   001339         134200 DIV-INIT-F1-21.                                                  NC1714.2
   001340         134300*            ==-->   SIZE ERROR CONDITION  <--==                  NC1714.2
   001341         134400*            ==-->   NEW SIZE ERRROR TESTS <--==                  NC1714.2
   001342         134500     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001343         134600     MOVE   "DIV-TEST-F1-21" TO PAR-NAME.                         NC1714.2 177
   001344         134700     MOVE      .01           TO WRK-DU-0V2-1.                     NC1714.2 91
   001345         134800     MOVE     1.001          TO WRK-DU-1V3-1.                     NC1714.2 96
   001346         134900     MOVE    15.44           TO WRK-DU-2V2-1.                     NC1714.2 107
   001347         135000     MOVE    60.89           TO WRK-DU-2V2-2.                     NC1714.2 108
   001348         135100     MOVE    60.99           TO WRK-DU-2V2-3.                     NC1714.2 109
   001349         135200     MOVE    60.99           TO WRK-DU-2V2-4.                     NC1714.2 110
   001350         135300     MOVE    10.0            TO WRK-DU-2V2-5.                     NC1714.2 111
   001351         135400     MOVE     1.001          TO WRK-DU-1V3-2.                     NC1714.2 97
   001352         135500     MOVE    10.0            TO WRK-DU-2V1-1.                     NC1714.2 104
   001353         135600     MOVE     "0"            TO WRK-XN-00001.                     NC1714.2 51
   001354         135700     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001355         135800 DIV-TEST-F1-21-0.                                                NC1714.2
   001356         135900     DIVIDE  WRK-DU-0V2-1                                         NC1714.2 91
   001357         136000       INTO  WRK-DU-2V2-1                                         NC1714.2 107
   001358         136100             WRK-DU-2V2-2                                         NC1714.2 108
   001359         136200             WRK-DU-2V2-3                                         NC1714.2 109
   001360         136300             WRK-DU-2V2-4                                         NC1714.2 110
   001361         136400             WRK-DU-1V3-2                                         NC1714.2 97
   001362         136500             WRK-DU-2V2-5                                         NC1714.2 111
   001363         136600             WRK-DU-2V1-1                                         NC1714.2 104
   001364         136700      NOT ON SIZE ERROR                                           NC1714.2
   001365      1  136800             MOVE   "1"  TO WRK-XN-00001.                         NC1714.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900     GO TO   DIV-TEST-F1-21-1.                                    NC1714.2 1371
   001367         137000 DIV-DELETE-F1-21.                                                NC1714.2
   001368         137100     PERFORM DE-LETE.                                             NC1714.2 329
   001369         137200     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001370         137300     GO TO   DIV-INIT-F1-22.                                      NC1714.2 1461
   001371         137400 DIV-TEST-F1-21-1.                                                NC1714.2
   001372         137500     IF      WRK-DU-2V2-1 = 15.44                                 NC1714.2 107
   001373      1  137600             PERFORM PASS                                         NC1714.2 327
   001374      1  137700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001375         137800     ELSE                                                         NC1714.2
   001376      1  137900             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001377      1  138000             PERFORM FAIL                                         NC1714.2 328
   001378      1  138100             MOVE    WRK-DU-2V2-1 TO COMPUTED-N                   NC1714.2 107 189
   001379      1  138200             MOVE    15.44        TO CORRECT-N                    NC1714.2 203
   001380      1  138300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001381         138400     ADD 1 TO REC-CT.                                             NC1714.2 224
   001382         138500 DIV-TEST-F1-21-2.                                                NC1714.2
   001383         138600     IF      WRK-DU-2V2-2 = 60.89                                 NC1714.2 108
   001384      1  138700             PERFORM PASS                                         NC1714.2 327
   001385      1  138800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001386         138900     ELSE                                                         NC1714.2
   001387      1  139000             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001388      1  139100             PERFORM FAIL                                         NC1714.2 328
   001389      1  139200             MOVE    WRK-DU-2V2-2 TO COMPUTED-N                   NC1714.2 108 189
   001390      1  139300             MOVE    60.89        TO CORRECT-N                    NC1714.2 203
   001391      1  139400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001392         139500     ADD 1 TO REC-CT.                                             NC1714.2 224
   001393         139600 DIV-TEST-F1-21-3.                                                NC1714.2
   001394         139700     IF      WRK-DU-2V2-3 = 60.99                                 NC1714.2 109
   001395      1  139800             PERFORM PASS                                         NC1714.2 327
   001396      1  139900             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001397         140000     ELSE                                                         NC1714.2
   001398      1  140100             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001399      1  140200             PERFORM FAIL                                         NC1714.2 328
   001400      1  140300             MOVE    WRK-DU-2V2-3 TO COMPUTED-N                   NC1714.2 109 189
   001401      1  140400             MOVE    60.99        TO CORRECT-N                    NC1714.2 203
   001402      1  140500             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001403         140600     ADD 1 TO REC-CT.                                             NC1714.2 224
   001404         140700 DIV-TEST-F1-21-4.                                                NC1714.2
   001405         140800     IF      WRK-DU-2V2-4 = 60.99                                 NC1714.2 110
   001406      1  140900             PERFORM PASS                                         NC1714.2 327
   001407      1  141000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001408         141100     ELSE                                                         NC1714.2
   001409      1  141200             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001410      1  141300             PERFORM FAIL                                         NC1714.2 328
   001411      1  141400             MOVE    WRK-DU-2V2-4 TO COMPUTED-N                   NC1714.2 110 189
   001412      1  141500             MOVE    60.99        TO CORRECT-N                    NC1714.2 203
   001413      1  141600             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001414         141700     ADD 1 TO REC-CT.                                             NC1714.2 224
   001415         141800 DIV-TEST-F1-21-5.                                                NC1714.2
   001416         141900     IF      WRK-DU-1V3-2 = 1.001                                 NC1714.2 97
   001417      1  142000             PERFORM PASS                                         NC1714.2 327
   001418      1  142100             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001419         142200     ELSE                                                         NC1714.2
   001420      1  142300             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001421      1  142400             PERFORM FAIL                                         NC1714.2 328
   001422      1  142500             MOVE    WRK-DU-1V3-2 TO COMPUTED-N                   NC1714.2 97 189
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423      1  142600             MOVE    1.001        TO CORRECT-N                    NC1714.2 203
   001424      1  142700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001425         142800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001426         142900 DIV-TEST-F1-21-6.                                                NC1714.2
   001427         143000     IF      WRK-DU-2V2-5 = 10.00                                 NC1714.2 111
   001428      1  143100             PERFORM PASS                                         NC1714.2 327
   001429      1  143200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001430         143300     ELSE                                                         NC1714.2
   001431      1  143400             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001432      1  143500             PERFORM FAIL                                         NC1714.2 328
   001433      1  143600             MOVE    WRK-DU-2V2-5 TO COMPUTED-N                   NC1714.2 111 189
   001434      1  143700             MOVE    10.00        TO CORRECT-N                    NC1714.2 203
   001435      1  143800             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001436         143900     ADD 1 TO REC-CT.                                             NC1714.2 224
   001437         144000 DIV-TEST-F1-21-7.                                                NC1714.2
   001438         144100     IF      WRK-DU-2V1-1 = 10.0                                  NC1714.2 104
   001439      1  144200             PERFORM PASS                                         NC1714.2 327
   001440      1  144300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001441         144400     ELSE                                                         NC1714.2
   001442      1  144500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001443      1  144600             PERFORM FAIL                                         NC1714.2 328
   001444      1  144700             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1714.2 104 189
   001445      1  144800             MOVE    10.0         TO CORRECT-N                    NC1714.2 203
   001446      1  144900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001447         145000     ADD 1 TO REC-CT.                                             NC1714.2 224
   001448         145100 DIV-TEST-F1-21-8.                                                NC1714.2
   001449         145200     IF      WRK-XN-00001 = "0"                                   NC1714.2 51
   001450      1  145300             PERFORM PASS                                         NC1714.2 327
   001451      1  145400             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001452         145500     ELSE                                                         NC1714.2
   001453      1  145600             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1714.2
   001454      1  145700                  TO RE-MARK                                      NC1714.2 182
   001455      1  145800             PERFORM FAIL                                         NC1714.2 328
   001456      1  145900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001457      1  146000             MOVE    "0"          TO CORRECT-X                    NC1714.2 201
   001458      1  146100             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001459         146200*                                                                 NC1714.2
   001460         146300*                                                                 NC1714.2
   001461         146400 DIV-INIT-F1-22.                                                  NC1714.2
   001462         146500*            ==-->  NO SIZE ERROR CONDITION <--==                 NC1714.2
   001463         146600*            ==-->   NEW SIZE ERRROR TESTS <--==                  NC1714.2
   001464         146700     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001465         146800     MOVE   "DIV-TEST-F1-22" TO PAR-NAME.                         NC1714.2 177
   001466         146900     MOVE     1.001          TO WRK-DU-1V3-1.                     NC1714.2 96
   001467         147000     MOVE    15.44           TO WRK-DU-2V2-1.                     NC1714.2 107
   001468         147100     MOVE    60.89           TO WRK-DU-2V2-2.                     NC1714.2 108
   001469         147200     MOVE    60.99           TO WRK-DU-2V2-3.                     NC1714.2 109
   001470         147300     MOVE    60.99           TO WRK-DU-2V2-4.                     NC1714.2 110
   001471         147400     MOVE    10.0            TO WRK-DU-2V2-5.                     NC1714.2 111
   001472         147500     MOVE     1.001          TO WRK-DU-1V3-2.                     NC1714.2 97
   001473         147600     MOVE    10.0            TO WRK-DU-2V1-1.                     NC1714.2 104
   001474         147700     MOVE   "0"              TO WRK-XN-00001.                     NC1714.2 51
   001475         147800     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001476         147900 DIV-TEST-F1-22-0.                                                NC1714.2
   001477         148000     DIVIDE  WRK-DU-1V3-1                                         NC1714.2 96
   001478         148100       INTO  WRK-DU-2V2-1                                         NC1714.2 107
   001479         148200             WRK-DU-2V2-2 ROUNDED                                 NC1714.2 108
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300             WRK-DU-2V2-3                                         NC1714.2 109
   001481         148400             WRK-DU-2V2-4 ROUNDED                                 NC1714.2 110
   001482         148500             WRK-DU-1V3-2                                         NC1714.2 97
   001483         148600             WRK-DU-2V2-5                                         NC1714.2 111
   001484         148700             WRK-DU-2V1-1 ROUNDED                                 NC1714.2 104
   001485         148800      NOT ON SIZE ERROR                                           NC1714.2
   001486      1  148900             MOVE   "1"  TO WRK-XN-00001.                         NC1714.2 51
   001487         149000     GO TO   DIV-TEST-F1-22-1.                                    NC1714.2 1492
   001488         149100 DIV-DELETE-F1-22.                                                NC1714.2
   001489         149200     PERFORM DE-LETE.                                             NC1714.2 329
   001490         149300     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001491         149400     GO TO   DIV-INIT-F1-23.                                      NC1714.2 1582
   001492         149500 DIV-TEST-F1-22-1.                                                NC1714.2
   001493         149600     IF      WRK-DU-2V2-1 = 15.42                                 NC1714.2 107
   001494      1  149700             PERFORM PASS                                         NC1714.2 327
   001495      1  149800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001496         149900     ELSE                                                         NC1714.2
   001497      1  150000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001498      1  150100             PERFORM FAIL                                         NC1714.2 328
   001499      1  150200             MOVE    WRK-DU-2V2-1 TO COMPUTED-N                   NC1714.2 107 189
   001500      1  150300             MOVE    15.42        TO CORRECT-N                    NC1714.2 203
   001501      1  150400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001502         150500     ADD 1 TO REC-CT.                                             NC1714.2 224
   001503         150600 DIV-TEST-F1-22-2.                                                NC1714.2
   001504         150700     IF      WRK-DU-2V2-2 = 60.83                                 NC1714.2 108
   001505      1  150800             PERFORM PASS                                         NC1714.2 327
   001506      1  150900             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001507         151000     ELSE                                                         NC1714.2
   001508      1  151100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001509      1  151200             PERFORM FAIL                                         NC1714.2 328
   001510      1  151300             MOVE    WRK-DU-2V2-2 TO COMPUTED-N                   NC1714.2 108 189
   001511      1  151400             MOVE    60.83        TO CORRECT-N                    NC1714.2 203
   001512      1  151500             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001513         151600     ADD 1 TO REC-CT.                                             NC1714.2 224
   001514         151700 DIV-TEST-F1-22-3.                                                NC1714.2
   001515         151800     IF      WRK-DU-2V2-3 = 60.92                                 NC1714.2 109
   001516      1  151900             PERFORM PASS                                         NC1714.2 327
   001517      1  152000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001518         152100     ELSE                                                         NC1714.2
   001519      1  152200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001520      1  152300             PERFORM FAIL                                         NC1714.2 328
   001521      1  152400             MOVE    WRK-DU-2V2-3 TO COMPUTED-N                   NC1714.2 109 189
   001522      1  152500             MOVE    60.92        TO CORRECT-N                    NC1714.2 203
   001523      1  152600             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001524         152700     ADD 1 TO REC-CT.                                             NC1714.2 224
   001525         152800 DIV-TEST-F1-22-4.                                                NC1714.2
   001526         152900     IF      WRK-DU-2V2-4 = 60.93                                 NC1714.2 110
   001527      1  153000             PERFORM PASS                                         NC1714.2 327
   001528      1  153100             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001529         153200     ELSE                                                         NC1714.2
   001530      1  153300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001531      1  153400             PERFORM FAIL                                         NC1714.2 328
   001532      1  153500             MOVE    WRK-DU-2V2-4 TO COMPUTED-N                   NC1714.2 110 189
   001533      1  153600             MOVE    60.93        TO CORRECT-N                    NC1714.2 203
   001534      1  153700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001535         153800     ADD 1 TO REC-CT.                                             NC1714.2 224
   001536         153900 DIV-TEST-F1-22-5.                                                NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154000     IF      WRK-DU-1V3-2 = 1.000                                 NC1714.2 97
   001538      1  154100             PERFORM PASS                                         NC1714.2 327
   001539      1  154200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001540         154300     ELSE                                                         NC1714.2
   001541      1  154400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001542      1  154500             PERFORM FAIL                                         NC1714.2 328
   001543      1  154600             MOVE    WRK-DU-1V3-2 TO COMPUTED-N                   NC1714.2 97 189
   001544      1  154700             MOVE    1.000        TO CORRECT-N                    NC1714.2 203
   001545      1  154800             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001546         154900     ADD 1 TO REC-CT.                                             NC1714.2 224
   001547         155000 DIV-TEST-F1-22-6.                                                NC1714.2
   001548         155100     IF      WRK-DU-2V2-5 = 09.99                                 NC1714.2 111
   001549      1  155200             PERFORM PASS                                         NC1714.2 327
   001550      1  155300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001551         155400     ELSE                                                         NC1714.2
   001552      1  155500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001553      1  155600             PERFORM FAIL                                         NC1714.2 328
   001554      1  155700             MOVE    WRK-DU-2V2-5 TO COMPUTED-N                   NC1714.2 111 189
   001555      1  155800             MOVE    09.99        TO CORRECT-N                    NC1714.2 203
   001556      1  155900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001557         156000     ADD 1 TO REC-CT.                                             NC1714.2 224
   001558         156100 DIV-TEST-F1-22-7.                                                NC1714.2
   001559         156200     IF      WRK-DU-2V1-1 = 10.0                                  NC1714.2 104
   001560      1  156300             PERFORM PASS                                         NC1714.2 327
   001561      1  156400             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001562         156500     ELSE                                                         NC1714.2
   001563      1  156600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001564      1  156700             PERFORM FAIL                                         NC1714.2 328
   001565      1  156800             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1714.2 104 189
   001566      1  156900             MOVE    10.00        TO CORRECT-N                    NC1714.2 203
   001567      1  157000             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001568         157100     ADD 1 TO REC-CT.                                             NC1714.2 224
   001569         157200 DIV-TEST-F1-22-8.                                                NC1714.2
   001570         157300     IF      WRK-XN-00001 = "1"                                   NC1714.2 51
   001571      1  157400             PERFORM PASS                                         NC1714.2 327
   001572      1  157500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001573         157600     ELSE                                                         NC1714.2
   001574      1  157700             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC1714.2
   001575      1  157800                  TO RE-MARK                                      NC1714.2 182
   001576      1  157900             PERFORM FAIL                                         NC1714.2 328
   001577      1  158000             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001578      1  158100             MOVE    "1"          TO CORRECT-X                    NC1714.2 201
   001579      1  158200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001580         158300*                                                                 NC1714.2
   001581         158400*                                                                 NC1714.2
   001582         158500 DIV-INIT-F1-23.                                                  NC1714.2
   001583         158600*            ==-->    SIZE ERROR CONDITION <--==                  NC1714.2
   001584         158700*            ==-->   NEW SIZE ERRROR TESTS <--==                  NC1714.2
   001585         158800     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001586         158900     MOVE   "DIV-TEST-F1-23" TO PAR-NAME.                         NC1714.2 177
   001587         159000     MOVE      .01           TO WRK-DU-0V2-1.                     NC1714.2 91
   001588         159100     MOVE     1.001          TO WRK-DU-1V3-1.                     NC1714.2 96
   001589         159200     MOVE    15.44           TO WRK-DU-2V2-1.                     NC1714.2 107
   001590         159300     MOVE    60.89           TO WRK-DU-2V2-2.                     NC1714.2 108
   001591         159400     MOVE    60.99           TO WRK-DU-2V2-3.                     NC1714.2 109
   001592         159500     MOVE    60.99           TO WRK-DU-2V2-4.                     NC1714.2 110
   001593         159600     MOVE    10.0            TO WRK-DU-2V2-5.                     NC1714.2 111
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700     MOVE     1.001          TO WRK-DU-1V3-2.                     NC1714.2 97
   001595         159800     MOVE    10.0            TO WRK-DU-2V1-1.                     NC1714.2 104
   001596         159900     MOVE     "0"            TO WRK-XN-00001.                     NC1714.2 51
   001597         160000     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001598         160100 DIV-TEST-F1-23-0.                                                NC1714.2
   001599         160200     DIVIDE  WRK-DU-0V2-1                                         NC1714.2 91
   001600         160300       INTO  WRK-DU-2V2-1                                         NC1714.2 107
   001601         160400             WRK-DU-2V2-2                                         NC1714.2 108
   001602         160500             WRK-DU-2V2-3                                         NC1714.2 109
   001603         160600             WRK-DU-2V2-4                                         NC1714.2 110
   001604         160700             WRK-DU-1V3-2                                         NC1714.2 97
   001605         160800             WRK-DU-2V2-5                                         NC1714.2 111
   001606         160900             WRK-DU-2V1-1                                         NC1714.2 104
   001607         161000          ON SIZE ERROR                                           NC1714.2
   001608      1  161100             MOVE   "1"  TO WRK-XN-00001                          NC1714.2 51
   001609         161200      NOT ON SIZE ERROR                                           NC1714.2
   001610      1  161300             MOVE   "2"  TO WRK-XN-00001.                         NC1714.2 51
   001611         161400     GO TO   DIV-TEST-F1-23-1.                                    NC1714.2 1616
   001612         161500 DIV-DELETE-F1-23.                                                NC1714.2
   001613         161600     PERFORM DE-LETE.                                             NC1714.2 329
   001614         161700     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001615         161800     GO TO   DIV-INIT-F1-24.                                      NC1714.2 1705
   001616         161900 DIV-TEST-F1-23-1.                                                NC1714.2
   001617         162000     IF      WRK-DU-2V2-1 = 15.44                                 NC1714.2 107
   001618      1  162100             PERFORM PASS                                         NC1714.2 327
   001619      1  162200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001620         162300     ELSE                                                         NC1714.2
   001621      1  162400             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001622      1  162500             PERFORM FAIL                                         NC1714.2 328
   001623      1  162600             MOVE    WRK-DU-2V2-1 TO COMPUTED-N                   NC1714.2 107 189
   001624      1  162700             MOVE    15.44        TO CORRECT-N                    NC1714.2 203
   001625      1  162800             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001626         162900     ADD 1 TO REC-CT.                                             NC1714.2 224
   001627         163000 DIV-TEST-F1-23-2.                                                NC1714.2
   001628         163100     IF      WRK-DU-2V2-2 = 60.89                                 NC1714.2 108
   001629      1  163200             PERFORM PASS                                         NC1714.2 327
   001630      1  163300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001631         163400     ELSE                                                         NC1714.2
   001632      1  163500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001633      1  163600             PERFORM FAIL                                         NC1714.2 328
   001634      1  163700             MOVE    WRK-DU-2V2-2 TO COMPUTED-N                   NC1714.2 108 189
   001635      1  163800             MOVE    60.89        TO CORRECT-N                    NC1714.2 203
   001636      1  163900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001637         164000     ADD 1 TO REC-CT.                                             NC1714.2 224
   001638         164100 DIV-TEST-F1-23-3.                                                NC1714.2
   001639         164200     IF      WRK-DU-2V2-3 = 60.99                                 NC1714.2 109
   001640      1  164300             PERFORM PASS                                         NC1714.2 327
   001641      1  164400             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001642         164500     ELSE                                                         NC1714.2
   001643      1  164600             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001644      1  164700             PERFORM FAIL                                         NC1714.2 328
   001645      1  164800             MOVE    WRK-DU-2V2-3 TO COMPUTED-N                   NC1714.2 109 189
   001646      1  164900             MOVE    60.99        TO CORRECT-N                    NC1714.2 203
   001647      1  165000             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001648         165100     ADD 1 TO REC-CT.                                             NC1714.2 224
   001649         165200 DIV-TEST-F1-23-4.                                                NC1714.2
   001650         165300     IF      WRK-DU-2V2-4 = 60.99                                 NC1714.2 110
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651      1  165400             PERFORM PASS                                         NC1714.2 327
   001652      1  165500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001653         165600     ELSE                                                         NC1714.2
   001654      1  165700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001655      1  165800             PERFORM FAIL                                         NC1714.2 328
   001656      1  165900             MOVE    WRK-DU-2V2-4 TO COMPUTED-N                   NC1714.2 110 189
   001657      1  166000             MOVE    60.99        TO CORRECT-N                    NC1714.2 203
   001658      1  166100             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001659         166200     ADD 1 TO REC-CT.                                             NC1714.2 224
   001660         166300 DIV-TEST-F1-23-5.                                                NC1714.2
   001661         166400     IF      WRK-DU-1V3-2 = 1.001                                 NC1714.2 97
   001662      1  166500             PERFORM PASS                                         NC1714.2 327
   001663      1  166600             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001664         166700     ELSE                                                         NC1714.2
   001665      1  166800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001666      1  166900             PERFORM FAIL                                         NC1714.2 328
   001667      1  167000             MOVE    WRK-DU-1V3-2 TO COMPUTED-N                   NC1714.2 97 189
   001668      1  167100             MOVE    1.001        TO CORRECT-N                    NC1714.2 203
   001669      1  167200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001670         167300     ADD 1 TO REC-CT.                                             NC1714.2 224
   001671         167400 DIV-TEST-F1-23-6.                                                NC1714.2
   001672         167500     IF      WRK-DU-2V2-5 = 10.00                                 NC1714.2 111
   001673      1  167600             PERFORM PASS                                         NC1714.2 327
   001674      1  167700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001675         167800     ELSE                                                         NC1714.2
   001676      1  167900             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001677      1  168000             PERFORM FAIL                                         NC1714.2 328
   001678      1  168100             MOVE    WRK-DU-2V2-5 TO COMPUTED-N                   NC1714.2 111 189
   001679      1  168200             MOVE    10.00        TO CORRECT-N                    NC1714.2 203
   001680      1  168300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001681         168400     ADD 1 TO REC-CT.                                             NC1714.2 224
   001682         168500 DIV-TEST-F1-23-7.                                                NC1714.2
   001683         168600     IF      WRK-DU-2V1-1 = 10.0                                  NC1714.2 104
   001684      1  168700             PERFORM PASS                                         NC1714.2 327
   001685      1  168800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001686         168900     ELSE                                                         NC1714.2
   001687      1  169000             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1714.2 182
   001688      1  169100             PERFORM FAIL                                         NC1714.2 328
   001689      1  169200             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1714.2 104 189
   001690      1  169300             MOVE    10.0         TO CORRECT-N                    NC1714.2 203
   001691      1  169400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001692         169500     ADD 1 TO REC-CT.                                             NC1714.2 224
   001693         169600 DIV-TEST-F1-23-8.                                                NC1714.2
   001694         169700     IF      WRK-XN-00001 = "1"                                   NC1714.2 51
   001695      1  169800             PERFORM PASS                                         NC1714.2 327
   001696      1  169900             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001697         170000     ELSE                                                         NC1714.2
   001698      1  170100             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1714.2 182
   001699      1  170200             PERFORM FAIL                                         NC1714.2 328
   001700      1  170300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001701      1  170400             MOVE    "1"          TO CORRECT-X                    NC1714.2 201
   001702      1  170500             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001703         170600*                                                                 NC1714.2
   001704         170700*                                                                 NC1714.2
   001705         170800 DIV-INIT-F1-24.                                                  NC1714.2
   001706         170900*            ==--> NO SIZE ERROR CONDITION <--==                  NC1714.2
   001707         171000*            ==-->   NEW SIZE ERRROR TESTS <--==                  NC1714.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171100     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001709         171200     MOVE   "DIV-TEST-F1-24" TO PAR-NAME.                         NC1714.2 177
   001710         171300     MOVE     1.001          TO WRK-DU-1V3-1.                     NC1714.2 96
   001711         171400     MOVE    15.44           TO WRK-DU-2V2-1.                     NC1714.2 107
   001712         171500     MOVE    60.89           TO WRK-DU-2V2-2.                     NC1714.2 108
   001713         171600     MOVE    60.99           TO WRK-DU-2V2-3.                     NC1714.2 109
   001714         171700     MOVE    60.99           TO WRK-DU-2V2-4.                     NC1714.2 110
   001715         171800     MOVE    10.0            TO WRK-DU-2V2-5.                     NC1714.2 111
   001716         171900     MOVE     1.001          TO WRK-DU-1V3-2.                     NC1714.2 97
   001717         172000     MOVE    10.0            TO WRK-DU-2V1-1.                     NC1714.2 104
   001718         172100     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001719         172200 DIV-TEST-F1-24-0.                                                NC1714.2
   001720         172300     DIVIDE  WRK-DU-1V3-1                                         NC1714.2 96
   001721         172400       INTO  WRK-DU-2V2-1                                         NC1714.2 107
   001722         172500             WRK-DU-2V2-2 ROUNDED                                 NC1714.2 108
   001723         172600             WRK-DU-2V2-3                                         NC1714.2 109
   001724         172700             WRK-DU-2V2-4 ROUNDED                                 NC1714.2 110
   001725         172800             WRK-DU-1V3-2                                         NC1714.2 97
   001726         172900             WRK-DU-2V2-5                                         NC1714.2 111
   001727         173000             WRK-DU-2V1-1 ROUNDED                                 NC1714.2 104
   001728         173100          ON SIZE ERROR                                           NC1714.2
   001729      1  173200             MOVE   "1"  TO WRK-XN-00001                          NC1714.2 51
   001730         173300      NOT ON SIZE ERROR                                           NC1714.2
   001731      1  173400             MOVE   "2"  TO WRK-XN-00001.                         NC1714.2 51
   001732         173500     GO TO   DIV-TEST-F1-24-1.                                    NC1714.2 1737
   001733         173600 DIV-DELETE-F1-24.                                                NC1714.2
   001734         173700     PERFORM DE-LETE.                                             NC1714.2 329
   001735         173800     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001736         173900     GO TO   DIV-INIT-F1-25.                                      NC1714.2 1827
   001737         174000 DIV-TEST-F1-24-1.                                                NC1714.2
   001738         174100     IF      WRK-DU-2V2-1 = 15.42                                 NC1714.2 107
   001739      1  174200             PERFORM PASS                                         NC1714.2 327
   001740      1  174300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001741         174400     ELSE                                                         NC1714.2
   001742      1  174500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001743      1  174600             PERFORM FAIL                                         NC1714.2 328
   001744      1  174700             MOVE    WRK-DU-2V2-1 TO COMPUTED-N                   NC1714.2 107 189
   001745      1  174800             MOVE    15.42        TO CORRECT-N                    NC1714.2 203
   001746      1  174900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001747         175000     ADD 1 TO REC-CT.                                             NC1714.2 224
   001748         175100 DIV-TEST-F1-24-2.                                                NC1714.2
   001749         175200     IF      WRK-DU-2V2-2 = 60.83                                 NC1714.2 108
   001750      1  175300             PERFORM PASS                                         NC1714.2 327
   001751      1  175400             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001752         175500     ELSE                                                         NC1714.2
   001753      1  175600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001754      1  175700             PERFORM FAIL                                         NC1714.2 328
   001755      1  175800             MOVE    WRK-DU-2V2-2 TO COMPUTED-N                   NC1714.2 108 189
   001756      1  175900             MOVE    60.83        TO CORRECT-N                    NC1714.2 203
   001757      1  176000             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001758         176100     ADD 1 TO REC-CT.                                             NC1714.2 224
   001759         176200 DIV-TEST-F1-24-3.                                                NC1714.2
   001760         176300     IF      WRK-DU-2V2-3 = 60.92                                 NC1714.2 109
   001761      1  176400             PERFORM PASS                                         NC1714.2 327
   001762      1  176500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001763         176600     ELSE                                                         NC1714.2
   001764      1  176700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765      1  176800             PERFORM FAIL                                         NC1714.2 328
   001766      1  176900             MOVE    WRK-DU-2V2-3 TO COMPUTED-N                   NC1714.2 109 189
   001767      1  177000             MOVE    60.92        TO CORRECT-N                    NC1714.2 203
   001768      1  177100             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001769         177200     ADD 1 TO REC-CT.                                             NC1714.2 224
   001770         177300 DIV-TEST-F1-24-4.                                                NC1714.2
   001771         177400     IF      WRK-DU-2V2-4 = 60.93                                 NC1714.2 110
   001772      1  177500             PERFORM PASS                                         NC1714.2 327
   001773      1  177600             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001774         177700     ELSE                                                         NC1714.2
   001775      1  177800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001776      1  177900             PERFORM FAIL                                         NC1714.2 328
   001777      1  178000             MOVE    WRK-DU-2V2-4 TO COMPUTED-N                   NC1714.2 110 189
   001778      1  178100             MOVE    60.93        TO CORRECT-N                    NC1714.2 203
   001779      1  178200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001780         178300     ADD 1 TO REC-CT.                                             NC1714.2 224
   001781         178400 DIV-TEST-F1-24-5.                                                NC1714.2
   001782         178500     IF      WRK-DU-1V3-2 = 1.000                                 NC1714.2 97
   001783      1  178600             PERFORM PASS                                         NC1714.2 327
   001784      1  178700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001785         178800     ELSE                                                         NC1714.2
   001786      1  178900             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001787      1  179000             PERFORM FAIL                                         NC1714.2 328
   001788      1  179100             MOVE    WRK-DU-1V3-2 TO COMPUTED-N                   NC1714.2 97 189
   001789      1  179200             MOVE    1.000        TO CORRECT-N                    NC1714.2 203
   001790      1  179300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001791         179400     ADD 1 TO REC-CT.                                             NC1714.2 224
   001792         179500 DIV-TEST-F1-24-6.                                                NC1714.2
   001793         179600     IF      WRK-DU-2V2-5 = 09.99                                 NC1714.2 111
   001794      1  179700             PERFORM PASS                                         NC1714.2 327
   001795      1  179800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001796         179900     ELSE                                                         NC1714.2
   001797      1  180000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001798      1  180100             PERFORM FAIL                                         NC1714.2 328
   001799      1  180200             MOVE    WRK-DU-2V2-5 TO COMPUTED-N                   NC1714.2 111 189
   001800      1  180300             MOVE    09.99        TO CORRECT-N                    NC1714.2 203
   001801      1  180400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001802         180500     ADD 1 TO REC-CT.                                             NC1714.2 224
   001803         180600 DIV-TEST-F1-24-7.                                                NC1714.2
   001804         180700     IF      WRK-DU-2V1-1 = 10.0                                  NC1714.2 104
   001805      1  180800             PERFORM PASS                                         NC1714.2 327
   001806      1  180900             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001807         181000     ELSE                                                         NC1714.2
   001808      1  181100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   001809      1  181200             PERFORM FAIL                                         NC1714.2 328
   001810      1  181300             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1714.2 104 189
   001811      1  181400             MOVE    10.00        TO CORRECT-N                    NC1714.2 203
   001812      1  181500             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001813         181600     ADD 1 TO REC-CT.                                             NC1714.2 224
   001814         181700 DIV-TEST-F1-24-8.                                                NC1714.2
   001815         181800     IF      WRK-XN-00001 = "2"                                   NC1714.2 51
   001816      1  181900             PERFORM PASS                                         NC1714.2 327
   001817      1  182000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001818         182100     ELSE                                                         NC1714.2
   001819      1  182200             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001820      1  182300                  TO RE-MARK                                      NC1714.2 182
   001821      1  182400             PERFORM FAIL                                         NC1714.2 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822      1  182500             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001823      1  182600             MOVE    "2"          TO CORRECT-X                    NC1714.2 201
   001824      1  182700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001825         182800*                                                                 NC1714.2
   001826         182900*                                                                 NC1714.2
   001827         183000 DIV-INIT-F1-25.                                                  NC1714.2
   001828         183100*            ==--> NO SIZE ERROR CONDITION <--==                  NC1714.2
   001829         183200*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1714.2
   001830         183300     MOVE   "1V-41 6.4.3 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001831         183400     MOVE   "DIV-TEST-F1-25       " TO PAR-NAME.                  NC1714.2 177
   001832         183500     MOVE   "0" TO WRK-XN-00001.                                  NC1714.2 51
   001833         183600     MOVE    0  TO WRK-DS-05V00.                                  NC1714.2 82
   001834         183700     MOVE    0  TO WRK-DS-02V00.                                  NC1714.2 56
   001835         183800     MOVE    0  TO WRK-CS-18V00.                                  NC1714.2 69
   001836         183900     MOVE    1620.36 TO DIV1.                                     NC1714.2 153
   001837         184000     MOVE    44.1    TO DIV2.                                     NC1714.2 155
   001838         184100     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001839         184200 DIV-TEST-F1-25-0.                                                NC1714.2
   001840         184300     DIVIDE  DIV2 INTO DIV1                                       NC1714.2 155 153
   001841         184400          ON SIZE ERROR                                           NC1714.2
   001842      1  184500             MOVE   "1" TO WRK-XN-00001                           NC1714.2 51
   001843      1  184600             MOVE   23  TO WRK-DS-05V00                           NC1714.2 82
   001844      1  184700             MOVE   -4  TO WRK-DS-02V00                           NC1714.2 56
   001845         184800     END-DIVIDE                                                   NC1714.2
   001846         184900     MOVE    99 TO WRK-CS-18V00.                                  NC1714.2 69
   001847         185000     GO TO   DIV-TEST-F1-25-1.                                    NC1714.2 1852
   001848         185100 DIV-DELETE-F1-25-1.                                              NC1714.2
   001849         185200     PERFORM DE-LETE.                                             NC1714.2 329
   001850         185300     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001851         185400     GO TO   DIV-INIT-F1-26.                                      NC1714.2 1899
   001852         185500 DIV-TEST-F1-25-1.                                                NC1714.2
   001853         185600     IF      WRK-XN-00001  = "0"                                  NC1714.2 51
   001854      1  185700             PERFORM PASS                                         NC1714.2 327
   001855      1  185800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001856         185900     ELSE                                                         NC1714.2
   001857      1  186000             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001858      1  186100             MOVE   "0"           TO CORRECT-X                    NC1714.2 201
   001859      1  186200             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001860      1  186300                 TO RE-MARK                                       NC1714.2 182
   001861      1  186400             PERFORM FAIL                                         NC1714.2 328
   001862      1  186500             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001863         186600     ADD     1 TO REC-CT.                                         NC1714.2 224
   001864         186700 DIV-TEST-F1-25-2.                                                NC1714.2
   001865         186800     IF      WRK-DS-05V00  =  0                                   NC1714.2 82
   001866      1  186900             PERFORM PASS                                         NC1714.2 327
   001867      1  187000             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001868         187100     ELSE                                                         NC1714.2
   001869      1  187200             MOVE    WRK-DS-05V00 TO COMPUTED-N                   NC1714.2 82 189
   001870      1  187300             MOVE    0            TO CORRECT-N                    NC1714.2 203
   001871      1  187400             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001872      1  187500                  TO RE-MARK                                      NC1714.2 182
   001873      1  187600             PERFORM FAIL                                         NC1714.2 328
   001874      1  187700             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001875         187800     ADD     1 TO REC-CT.                                         NC1714.2 224
   001876         187900 DIV-TEST-F1-25-3.                                                NC1714.2
   001877         188000     IF      WRK-DS-02V00  =  0                                   NC1714.2 56
   001878      1  188100             PERFORM PASS                                         NC1714.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879      1  188200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001880         188300     ELSE                                                         NC1714.2
   001881      1  188400             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1714.2 56 189
   001882      1  188500             MOVE    0            TO CORRECT-N                    NC1714.2 203
   001883      1  188600             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001884      1  188700                  TO RE-MARK                                      NC1714.2 182
   001885      1  188800             PERFORM FAIL                                         NC1714.2 328
   001886      1  188900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001887         189000 DIV-TEST-F1-25-4.                                                NC1714.2
   001888         189100     IF      WRK-CS-18V00  = 000000000000000099                   NC1714.2 69
   001889      1  189200             PERFORM PASS                                         NC1714.2 327
   001890      1  189300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001891         189400     ELSE                                                         NC1714.2
   001892      1  189500             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1714.2 69 189
   001893      1  189600             MOVE    0            TO CORRECT-N                    NC1714.2 203
   001894      1  189700             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1714.2 182
   001895      1  189800             PERFORM FAIL                                         NC1714.2 328
   001896      1  189900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001897         190000*                                                                 NC1714.2
   001898         190100*                                                                 NC1714.2
   001899         190200 DIV-INIT-F1-26.                                                  NC1714.2
   001900         190300*            ==--> NO SIZE ERROR CONDITION <--==                  NC1714.2
   001901         190400*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1714.2
   001902         190500     MOVE   "1V-41 6.4.3 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001903         190600     MOVE   "DIV-TEST-F1-26       " TO PAR-NAME.                  NC1714.2 177
   001904         190700     MOVE    111111111.111111111 TO A18ONES-DS-09V09.             NC1714.2 79
   001905         190800     MOVE    A18ONES-DS-09V09    TO WRK-DS-09V09.                 NC1714.2 79 58
   001906         190900     MOVE   "0" TO WRK-XN-00001.                                  NC1714.2 51
   001907         191000     MOVE    0  TO WRK-DS-05V00.                                  NC1714.2 82
   001908         191100     MOVE    0  TO WRK-DS-02V00.                                  NC1714.2 56
   001909         191200     MOVE    0  TO WRK-CS-18V00.                                  NC1714.2 69
   001910         191300     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001911         191400 DIV-TEST-F1-26-0.                                                NC1714.2
   001912         191500     DIVIDE  A18ONES-DS-09V09                                     NC1714.2 79
   001913         191600        INTO WRK-DS-09V09 ROUNDED                                 NC1714.2 58
   001914         191700          ON SIZE ERROR                                           NC1714.2
   001915      1  191800             MOVE   "1" TO WRK-XN-00001                           NC1714.2 51
   001916      1  191900             MOVE   23  TO WRK-DS-05V00                           NC1714.2 82
   001917      1  192000             MOVE   -4  TO WRK-DS-02V00                           NC1714.2 56
   001918         192100     END-DIVIDE                                                   NC1714.2
   001919         192200     MOVE    99 TO WRK-CS-18V00.                                  NC1714.2 69
   001920         192300     GO TO   DIV-TEST-F1-26-1.                                    NC1714.2 1925
   001921         192400 DIV-DELETE-F1-26-1.                                              NC1714.2
   001922         192500     PERFORM DE-LETE.                                             NC1714.2 329
   001923         192600     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   001924         192700     GO TO   DIV-INIT-F1-27.                                      NC1714.2 1982
   001925         192800 DIV-TEST-F1-26-1.                                                NC1714.2
   001926         192900     IF      WRK-DS-18V00-S = 000000001000000000                  NC1714.2 59
   001927      1  193000             PERFORM PASS                                         NC1714.2 327
   001928      1  193100             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001929         193200     ELSE                                                         NC1714.2
   001930      1  193300             MOVE    000000001000000000 TO CORRECT-18V0           NC1714.2 208
   001931      1  193400             MOVE    WRK-DS-18V00       TO COMPUTED-18V0          NC1714.2 45 195
   001932      1  193500             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001933      1  193600                  TO RE-MARK                                      NC1714.2 182
   001934      1  193700             PERFORM FAIL                                         NC1714.2 328
   001935      1  193800             PERFORM PRINT-DETAIL.                                NC1714.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900     ADD     1 TO REC-CT.                                         NC1714.2 224
   001937         194000 DIV-TEST-F1-26-2.                                                NC1714.2
   001938         194100     IF      WRK-XN-00001  = "0"                                  NC1714.2 51
   001939      1  194200             PERFORM PASS                                         NC1714.2 327
   001940      1  194300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001941         194400     ELSE                                                         NC1714.2
   001942      1  194500             MOVE   "0"           TO CORRECT-X                    NC1714.2 201
   001943      1  194600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   001944      1  194700             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001945      1  194800                  TO RE-MARK                                      NC1714.2 182
   001946      1  194900             PERFORM FAIL                                         NC1714.2 328
   001947      1  195000             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001948         195100     ADD     1 TO REC-CT.                                         NC1714.2 224
   001949         195200 DIV-TEST-F1-26-3.                                                NC1714.2
   001950         195300     IF      WRK-DS-05V00  =  0                                   NC1714.2 82
   001951      1  195400             PERFORM PASS                                         NC1714.2 327
   001952      1  195500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001953         195600     ELSE                                                         NC1714.2
   001954      1  195700             MOVE    0            TO CORRECT-18V0                 NC1714.2 208
   001955      1  195800             MOVE    WRK-DS-05V00 TO COMPUTED-18V0                NC1714.2 82 195
   001956      1  195900             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   001957      1  196000                  TO RE-MARK                                      NC1714.2 182
   001958      1  196100             PERFORM FAIL                                         NC1714.2 328
   001959      1  196200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001960         196300     ADD     1 TO REC-CT.                                         NC1714.2 224
   001961         196400 DIV-TEST-F1-26-4.                                                NC1714.2
   001962         196500     IF      WRK-DS-02V00  =  0                                   NC1714.2 56
   001963      1  196600             PERFORM PASS                                         NC1714.2 327
   001964      1  196700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001965         196800     ELSE                                                         NC1714.2
   001966      1  196900             MOVE    0            TO CORRECT-18V0                 NC1714.2 208
   001967      1  197000             MOVE    WRK-DS-02V00 TO COMPUTED-18V0                NC1714.2 56 195
   001968      1  197100             PERFORM FAIL                                         NC1714.2 328
   001969      1  197200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001970         197300     ADD     1 TO REC-CT.                                         NC1714.2 224
   001971         197400 DIV-TEST-F1-26-5.                                                NC1714.2
   001972         197500     IF      WRK-CS-18V00  = 000000000000000099                   NC1714.2 69
   001973      1  197600             PERFORM PASS                                         NC1714.2 327
   001974      1  197700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   001975         197800     ELSE                                                         NC1714.2
   001976      1  197900             MOVE    000000000000000099 TO CORRECT-18V0           NC1714.2 208
   001977      1  198000             MOVE    WRK-CS-18V00       TO COMPUTED-18V0          NC1714.2 69 195
   001978      1  198100             PERFORM FAIL                                         NC1714.2 328
   001979      1  198200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   001980         198300*                                                                 NC1714.2
   001981         198400*                                                                 NC1714.2
   001982         198500 DIV-INIT-F1-27.                                                  NC1714.2
   001983         198600*            ==--> NO SIZE ERROR CONDITION <--==                  NC1714.2
   001984         198700*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1714.2
   001985         198800     MOVE   "DIV-TEST-F1-27 " TO PAR-NAME.                        NC1714.2 177
   001986         198900     MOVE   "1V-41 6.4.3 "   TO ANSI-REFERENCE.                   NC1714.2 233
   001987         199000     MOVE   "0" TO WRK-XN-00001.                                  NC1714.2 51
   001988         199100     MOVE    0  TO WRK-DS-05V00.                                  NC1714.2 82
   001989         199200     MOVE    0  TO WRK-DS-02V00.                                  NC1714.2 56
   001990         199300     MOVE    0  TO WRK-CS-18V00.                                  NC1714.2 69
   001991         199400     MOVE    1620.36 TO DIV1.                                     NC1714.2 153
   001992         199500     MOVE    44.1    TO DIV2.                                     NC1714.2 155
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993         199600     MOVE    1 TO REC-CT.                                         NC1714.2 224
   001994         199700 DIV-TEST-F1-27-0.                                                NC1714.2
   001995         199800     DIVIDE  DIV2 INTO DIV1                                       NC1714.2 155 153
   001996         199900      NOT ON SIZE ERROR                                           NC1714.2
   001997      1  200000             MOVE   "1" TO WRK-XN-00001                           NC1714.2 51
   001998      1  200100             MOVE   23  TO WRK-DS-05V00                           NC1714.2 82
   001999      1  200200             MOVE   -4  TO WRK-DS-02V00                           NC1714.2 56
   002000         200300     END-DIVIDE                                                   NC1714.2
   002001         200400     MOVE    99 TO WRK-CS-18V00.                                  NC1714.2 69
   002002         200500     GO TO   DIV-TEST-F1-27-1.                                    NC1714.2 2007
   002003         200600 DIV-DELETE-F1-27-1.                                              NC1714.2
   002004         200700     PERFORM DE-LETE.                                             NC1714.2 329
   002005         200800     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   002006         200900     GO TO   DIV-INIT-F1-28.                                      NC1714.2 2063
   002007         201000 DIV-TEST-F1-27-1.                                                NC1714.2
   002008         201100     IF      WRK-XN-00001  = "1"                                  NC1714.2 51
   002009      1  201200             PERFORM PASS                                         NC1714.2 327
   002010      1  201300             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002011         201400     ELSE                                                         NC1714.2
   002012      1  201500             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   002013      1  201600             MOVE   "1"           TO CORRECT-X                    NC1714.2 201
   002014      1  201700             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   002015      1  201800                  TO RE-MARK                                      NC1714.2 182
   002016      1  201900             PERFORM FAIL                                         NC1714.2 328
   002017      1  202000             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002018         202100     ADD     1 TO REC-CT.                                         NC1714.2 224
   002019         202200 DIV-TEST-F1-27-2.                                                NC1714.2
   002020         202300     IF      WRK-DS-05V00 = 23                                    NC1714.2 82
   002021      1  202400             PERFORM PASS                                         NC1714.2 327
   002022      1  202500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002023         202600     ELSE                                                         NC1714.2
   002024      1  202700             MOVE    23           TO CORRECT-18V0                 NC1714.2 208
   002025      1  202800             MOVE    WRK-DS-05V00 TO COMPUTED-18V0                NC1714.2 82 195
   002026      1  202900             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1714.2
   002027      1  203000                  TO RE-MARK                                      NC1714.2 182
   002028      1  203100             PERFORM FAIL                                         NC1714.2 328
   002029      1  203200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002030         203300     ADD     1 TO REC-CT.                                         NC1714.2 224
   002031         203400 DIV-TEST-F1-27-3.                                                NC1714.2
   002032         203500     IF      WRK-DS-02V00  = -4                                   NC1714.2 56
   002033      1  203600             PERFORM PASS                                         NC1714.2 327
   002034      1  203700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002035         203800     ELSE                                                         NC1714.2
   002036      1  203900             MOVE    -4           TO CORRECT-18V0                 NC1714.2 208
   002037      1  204000             MOVE    WRK-DS-02V00 TO COMPUTED-18V0                NC1714.2 56 195
   002038      1  204100             PERFORM FAIL                                         NC1714.2 328
   002039      1  204200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002040         204300     ADD     1 TO REC-CT.                                         NC1714.2 224
   002041         204400 DIV-TEST-F1-27-4.                                                NC1714.2
   002042         204500     IF      WRK-CS-18V00  = 000000000000000099                   NC1714.2 69
   002043      1  204600             PERFORM PASS                                         NC1714.2 327
   002044      1  204700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002045         204800     ELSE                                                         NC1714.2
   002046      1  204900             MOVE    000000000000000099 TO CORRECT-18V0           NC1714.2 208
   002047      1  205000             MOVE    WRK-CS-18V00       TO COMPUTED-18V0          NC1714.2 69 195
   002048      1  205100             PERFORM FAIL                                         NC1714.2 328
   002049      1  205200             PERFORM PRINT-DETAIL.                                NC1714.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205300     ADD     1 TO REC-CT.                                         NC1714.2 224
   002051         205400 DIV-TEST-F1-27-5.                                                NC1714.2
   002052         205500     IF      DIV1 = 36.74                                         NC1714.2 153
   002053      1  205600             PERFORM PASS                                         NC1714.2 327
   002054      1  205700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002055         205800     ELSE                                                         NC1714.2
   002056      1  205900             MOVE    DIV1  TO COMPUTED-N                          NC1714.2 153 189
   002057      1  206000             MOVE    36.74 TO CORRECT-N                           NC1714.2 203
   002058      1  206100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   002059      1  206200             PERFORM FAIL                                         NC1714.2 328
   002060      1  206300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002061         206400*                                                                 NC1714.2
   002062         206500*                                                                 NC1714.2
   002063         206600 DIV-INIT-F1-28.                                                  NC1714.2
   002064         206700     MOVE   "DIV-TEST-F1-28 " TO PAR-NAME.                        NC1714.2 177
   002065         206800     MOVE   "1V-41 6.4.3 "   TO ANSI-REFERENCE.                   NC1714.2 233
   002066         206900     MOVE   A18ONES-DS-09V09 TO WRK-DS-09V09.                     NC1714.2 79 58
   002067         207000     MOVE   "0" TO WRK-XN-00001.                                  NC1714.2 51
   002068         207100     MOVE    0  TO WRK-DS-05V00.                                  NC1714.2 82
   002069         207200     MOVE    0  TO WRK-DS-02V00.                                  NC1714.2 56
   002070         207300     MOVE    0  TO WRK-CS-18V00.                                  NC1714.2 69
   002071         207400     MOVE    1 TO REC-CT.                                         NC1714.2 224
   002072         207500 DIV-TEST-F1-28-0.                                                NC1714.2
   002073         207600     DIVIDE  A18ONES-DS-09V09                                     NC1714.2 79
   002074         207700        INTO WRK-DS-09V09 ROUNDED                                 NC1714.2 58
   002075         207800      NOT ON SIZE ERROR                                           NC1714.2
   002076      1  207900             MOVE   "1" TO WRK-XN-00001                           NC1714.2 51
   002077      1  208000             MOVE   23  TO WRK-DS-05V00                           NC1714.2 82
   002078      1  208100             MOVE   -4  TO WRK-DS-02V00                           NC1714.2 56
   002079         208200     END-DIVIDE                                                   NC1714.2
   002080         208300     MOVE    99 TO WRK-CS-18V00.                                  NC1714.2 69
   002081         208400     GO TO   DIV-TEST-F1-28-1.                                    NC1714.2 2086
   002082         208500 DIV-DELETE-F1-28-1.                                              NC1714.2
   002083         208600     PERFORM DE-LETE.                                             NC1714.2 329
   002084         208700     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   002085         208800     GO TO   DIV-INIT-F1-29.                                      NC1714.2 2146
   002086         208900 DIV-TEST-F1-28-1.                                                NC1714.2
   002087         209000     IF      WRK-XN-00001  = "1"                                  NC1714.2 51
   002088      1  209100             PERFORM PASS                                         NC1714.2 327
   002089      1  209200             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002090         209300     ELSE                                                         NC1714.2
   002091      1  209400             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   002092      1  209500             MOVE   "1"           TO CORRECT-X                    NC1714.2 201
   002093      1  209600             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC1714.2
   002094      1  209700                  TO RE-MARK                                      NC1714.2 182
   002095      1  209800             PERFORM FAIL                                         NC1714.2 328
   002096      1  209900             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002097         210000     ADD     1 TO REC-CT.                                         NC1714.2 224
   002098         210100 DIV-TEST-F1-28-2.                                                NC1714.2
   002099         210200     IF      WRK-DS-05V00 = 23                                    NC1714.2 82
   002100      1  210300             PERFORM PASS                                         NC1714.2 327
   002101      1  210400             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002102         210500     ELSE                                                         NC1714.2
   002103      1  210600             MOVE    23           TO CORRECT-18V0                 NC1714.2 208
   002104      1  210700             MOVE    WRK-DS-05V00 TO COMPUTED-18V0                NC1714.2 82 195
   002105      1  210800             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC1714.2
   002106      1  210900                  TO RE-MARK                                      NC1714.2 182
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107      1  211000             PERFORM FAIL                                         NC1714.2 328
   002108      1  211100             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002109         211200     ADD     1 TO REC-CT.                                         NC1714.2 224
   002110         211300 DIV-TEST-F1-28-3.                                                NC1714.2
   002111         211400     IF      WRK-DS-02V00  = -4                                   NC1714.2 56
   002112      1  211500             PERFORM PASS                                         NC1714.2 327
   002113      1  211600             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002114         211700     ELSE                                                         NC1714.2
   002115      1  211800             MOVE    -4           TO CORRECT-18V0                 NC1714.2 208
   002116      1  211900             MOVE    WRK-DS-02V00 TO COMPUTED-18V0                NC1714.2 56 195
   002117      1  212000             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC1714.2
   002118      1  212100                  TO RE-MARK                                      NC1714.2 182
   002119      1  212200             PERFORM FAIL                                         NC1714.2 328
   002120      1  212300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002121         212400     ADD     1 TO REC-CT.                                         NC1714.2 224
   002122         212500 DIV-TEST-F1-28-4.                                                NC1714.2
   002123         212600     IF      WRK-CS-18V00  = 000000000000000099                   NC1714.2 69
   002124      1  212700             PERFORM PASS                                         NC1714.2 327
   002125      1  212800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002126         212900     ELSE                                                         NC1714.2
   002127      1  213000             MOVE    000000000000000099 TO CORRECT-18V0           NC1714.2 208
   002128      1  213100             MOVE    WRK-CS-18V00       TO COMPUTED-18V0          NC1714.2 69 195
   002129      1  213200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1714.2 182
   002130      1  213300             PERFORM FAIL                                         NC1714.2 328
   002131      1  213400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002132         213500     ADD     1 TO REC-CT.                                         NC1714.2 224
   002133         213600 DIV-TEST-F1-28-5.                                                NC1714.2
   002134         213700     IF      WRK-DS-09V09 = 1                                     NC1714.2 58
   002135      1  213800             PERFORM PASS                                         NC1714.2 327
   002136      1  213900             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002137         214000     ELSE                                                         NC1714.2
   002138      1  214100             MOVE    1            TO CORRECT-18V0                 NC1714.2 208
   002139      1  214200             MOVE    WRK-DS-09V09 TO COMPUTED-18V0                NC1714.2 58 195
   002140      1  214300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1714.2
   002141      1  214400                  TO RE-MARK                                      NC1714.2 182
   002142      1  214500             PERFORM FAIL                                         NC1714.2 328
   002143      1  214600             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002144         214700*                                                                 NC1714.2
   002145         214800*                                                                 NC1714.2
   002146         214900 DIV-INIT-F1-29.                                                  NC1714.2
   002147         215000*            ==--> NO SIZE ERROR CONDITION <--==                  NC1714.2
   002148         215100*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1714.2
   002149         215200     MOVE   "DIV-TEST-F1-29 " TO PAR-NAME.                        NC1714.2 177
   002150         215300     MOVE   "1V-41 6.4.3 "    TO ANSI-REFERENCE.                  NC1714.2 233
   002151         215400     MOVE   "0" TO WRK-XN-00001.                                  NC1714.2 51
   002152         215500     MOVE    0  TO WRK-CS-18V00.                                  NC1714.2 69
   002153         215600     MOVE    1620.36 TO DIV1.                                     NC1714.2 153
   002154         215700     MOVE    44.1    TO DIV2.                                     NC1714.2 155
   002155         215800     MOVE    1 TO REC-CT.                                         NC1714.2 224
   002156         215900 DIV-TEST-F1-29-0.                                                NC1714.2
   002157         216000     DIVIDE  DIV2 INTO DIV1                                       NC1714.2 155 153
   002158         216100          ON SIZE ERROR                                           NC1714.2
   002159      1  216200             MOVE   "1" TO WRK-XN-00001                           NC1714.2 51
   002160         216300      NOT ON SIZE ERROR                                           NC1714.2
   002161      1  216400             MOVE   "2" TO WRK-XN-00001                           NC1714.2 51
   002162         216500     END-DIVIDE                                                   NC1714.2
   002163         216600     MOVE    99 TO WRK-CS-18V00.                                  NC1714.2 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164         216700     GO TO   DIV-TEST-F1-29-1.                                    NC1714.2 2169
   002165         216800 DIV-DELETE-F1-29-1.                                              NC1714.2
   002166         216900     PERFORM DE-LETE.                                             NC1714.2 329
   002167         217000     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   002168         217100     GO TO   DIV-INIT-F1-30.                                      NC1714.2 2204
   002169         217200 DIV-TEST-F1-29-1.                                                NC1714.2
   002170         217300     IF      WRK-XN-00001  = "2"                                  NC1714.2 51
   002171      1  217400             PERFORM PASS                                         NC1714.2 327
   002172      1  217500             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002173         217600     ELSE                                                         NC1714.2
   002174      1  217700             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   002175      1  217800             MOVE   "2"           TO CORRECT-X                    NC1714.2 201
   002176      1  217900             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1714.2
   002177      1  218000                  TO RE-MARK                                      NC1714.2 182
   002178      1  218100             PERFORM FAIL                                         NC1714.2 328
   002179      1  218200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002180         218300     ADD     1 TO REC-CT.                                         NC1714.2 224
   002181         218400 DIV-TEST-F1-29-2.                                                NC1714.2
   002182         218500     IF      WRK-CS-18V00  = 000000000000000099                   NC1714.2 69
   002183      1  218600             PERFORM PASS                                         NC1714.2 327
   002184      1  218700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002185         218800     ELSE                                                         NC1714.2
   002186      1  218900             MOVE    000000000000000099 TO CORRECT-18V0           NC1714.2 208
   002187      1  219000             MOVE    WRK-CS-18V00       TO COMPUTED-18V0          NC1714.2 69 195
   002188      1  219100             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1714.2 182
   002189      1  219200             PERFORM FAIL                                         NC1714.2 328
   002190      1  219300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002191         219400     ADD     1 TO REC-CT.                                         NC1714.2 224
   002192         219500 DIV-TEST-F1-29-3.                                                NC1714.2
   002193         219600     IF      DIV1 = 36.74                                         NC1714.2 153
   002194      1  219700             PERFORM PASS                                         NC1714.2 327
   002195      1  219800             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002196         219900     ELSE                                                         NC1714.2
   002197      1  220000             MOVE    DIV1  TO COMPUTED-N                          NC1714.2 153 189
   002198      1  220100             MOVE    36.74 TO CORRECT-N                           NC1714.2 203
   002199      1  220200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   002200      1  220300             PERFORM FAIL                                         NC1714.2 328
   002201      1  220400             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002202         220500*                                                                 NC1714.2
   002203         220600*                                                                 NC1714.2
   002204         220700 DIV-INIT-F1-30.                                                  NC1714.2
   002205         220800*            ==--> NO SIZE ERROR CONDITION <--==                  NC1714.2
   002206         220900*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1714.2
   002207         221000     MOVE   "DIV-TEST-F1-30 " TO PAR-NAME.                        NC1714.2 177
   002208         221100     MOVE   "1V-41 6.4.3 "    TO ANSI-REFERENCE.                  NC1714.2 233
   002209         221200     MOVE    111111111.111111111 TO A18ONES-DS-09V09.             NC1714.2 79
   002210         221300     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1714.2 79 58
   002211         221400     MOVE   "0" TO WRK-XN-00001.                                  NC1714.2 51
   002212         221500     MOVE    0  TO WRK-CS-18V00.                                  NC1714.2 69
   002213         221600     MOVE    1 TO REC-CT.                                         NC1714.2 224
   002214         221700 DIV-TEST-F1-30-0.                                                NC1714.2
   002215         221800     DIVIDE  A18ONES-DS-09V09                                     NC1714.2 79
   002216         221900       INTO  WRK-DS-09V09 ROUNDED                                 NC1714.2 58
   002217         222000          ON SIZE ERROR                                           NC1714.2
   002218      1  222100             MOVE   "1" TO WRK-XN-00001                           NC1714.2 51
   002219         222200      NOT ON SIZE ERROR                                           NC1714.2
   002220      1  222300             MOVE   "2" TO WRK-XN-00001                           NC1714.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002221         222400     END-DIVIDE                                                   NC1714.2
   002222         222500     MOVE    99 TO WRK-CS-18V00.                                  NC1714.2 69
   002223         222600     GO TO   DIV-TEST-F1-30-1.                                    NC1714.2 2228
   002224         222700 DIV-DELETE-F1-30-1.                                              NC1714.2
   002225         222800     PERFORM DE-LETE.                                             NC1714.2 329
   002226         222900     PERFORM PRINT-DETAIL.                                        NC1714.2 331
   002227         223000     GO TO   CCVS-EXIT.                                           NC1714.2 2263
   002228         223100 DIV-TEST-F1-30-1.                                                NC1714.2
   002229         223200     IF      WRK-XN-00001  = "2"                                  NC1714.2 51
   002230      1  223300             PERFORM PASS                                         NC1714.2 327
   002231      1  223400             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002232         223500     ELSE                                                         NC1714.2
   002233      1  223600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1714.2 51 187
   002234      1  223700             MOVE   "2"           TO CORRECT-X                    NC1714.2 201
   002235      1  223800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1714.2
   002236      1  223900                  TO RE-MARK                                      NC1714.2 182
   002237      1  224000             PERFORM FAIL                                         NC1714.2 328
   002238      1  224100             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002239         224200     ADD     1 TO REC-CT.                                         NC1714.2 224
   002240         224300 DIV-TEST-F1-30-2.                                                NC1714.2
   002241         224400     IF      WRK-CS-18V00  = 000000000000000099                   NC1714.2 69
   002242      1  224500             PERFORM PASS                                         NC1714.2 327
   002243      1  224600             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002244         224700     ELSE                                                         NC1714.2
   002245      1  224800             MOVE    000000000000000099 TO CORRECT-18V0           NC1714.2 208
   002246      1  224900             MOVE    WRK-CS-18V00       TO COMPUTED-18V0          NC1714.2 69 195
   002247      1  225000             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1714.2 182
   002248      1  225100             PERFORM FAIL                                         NC1714.2 328
   002249      1  225200             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002250         225300     ADD     1 TO REC-CT.                                         NC1714.2 224
   002251         225400 DIV-TEST-F1-30-3.                                                NC1714.2
   002252         225500     IF      WRK-DS-18V00 = 1                                     NC1714.2 45
   002253      1  225600             PERFORM PASS                                         NC1714.2 327
   002254      1  225700             PERFORM PRINT-DETAIL                                 NC1714.2 331
   002255         225800      ELSE                                                        NC1714.2
   002256      1  225900             MOVE    1            TO CORRECT-18V0                 NC1714.2 208
   002257      1  226000             MOVE    WRK-DS-18V00 TO COMPUTED-18V0                NC1714.2 45 195
   002258      1  226100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1714.2 182
   002259      1  226200             PERFORM FAIL                                         NC1714.2 328
   002260      1  226300             PERFORM PRINT-DETAIL.                                NC1714.2 331
   002261         226400*                                                                 NC1714.2
   002262         226500*                                                                 NC1714.2
   002263         226600 CCVS-EXIT SECTION.                                               NC1714.2
   002264         226700 CCVS-999999.                                                     NC1714.2
   002265         226800     GO TO CLOSE-FILES.                                           NC1714.2 320
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    43
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      233   ANSI-REFERENCE . . . . . . . .  410 417 426 M437 M457 M478 M518 M560 M599 M620 M640 M677 M713 M751 M787 M806
                                            M828 M871 M914 M960 M1001 M1100 M1221 M1342 M1464 M1585 M1708 M1830 M1902 M1986
                                            M2065 M2150 M2208
       57   AZERO-DS-05V05 . . . . . . . .  M714 717
       73   A01ONE-CS-00V01
       63   A01ONE-DS-P0801. . . . . . . .  681
      132   A01ONES-CS-18V00
      134   A02THREES-CS-18V00
       83   A02TWOS-DS-03V02
       81   A02TWOS-DU-02V00
       60   A05ONES-DS-00V05
       46   A06THREES-DS-03V03
       49   A08TWOS-DS-02V06
       52   A10ONES-DS-10V00
       61   A12ONES-DS-12V00
       54   A12THREES-DS-06V06
      140   A14TWOS-CU-18V00
      138   A16NINES-CU-18V00
       79   A18ONES-DS-09V09 . . . . . . .  752 755 873 877 961 965 M1904 1905 1912 2066 2073 M2209 2210 2215
       66   A18ONES-DS-18V00
      136   A18SIXES-CU-18V00
       71   A99-CS-02V00
       75   A99-DS-02V00 . . . . . . . . .  M601 603 790
       85   A990-DS-0201P. . . . . . . . .  809
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
      188   COMPUTED-A . . . . . . . . . .  189 191 192 193 194 422 425 M667 M701 M741 M774
      189   COMPUTED-N . . . . . . . . . .  M451 M472 M512 M553 M592 M656 M729 M797 M816 M849 M950 M1032 M1042 M1052 M1062
                                            M1072 M1082 M1092 M1136 M1147 M1158 M1169 M1180 M1191 M1202 M1256 M1267 M1278
                                            M1289 M1300 M1311 M1322 M1378 M1389 M1400 M1411 M1422 M1433 M1444 M1499 M1510
                                            M1521 M1532 M1543 M1554 M1565 M1623 M1634 M1645 M1656 M1667 M1678 M1689 M1744
                                            M1755 M1766 M1777 M1788 M1799 M1810 M1869 M1881 M1892 M2056 M2197
      187   COMPUTED-X . . . . . . . . . .  M339 407 M493 M535 M575 M861 M892 M938 M983 M1213 M1334 M1456 M1577 M1700 M1822
                                            M1857 M1943 M2012 M2091 M2174 M2233
      191   COMPUTED-0V18
      193   COMPUTED-14V4
      195   COMPUTED-18V0. . . . . . . . .  M614 M633 M693 M767 M905 M994 M1931 M1955 M1967 M1977 M2025 M2037 M2047 M2104
                                            M2116 M2128 M2139 M2187 M2246 M2257
      192   COMPUTED-4V14
      211   COR-ANSI-REFERENCE . . . . . .  M417 M419
      202   CORRECT-A. . . . . . . . . . .  203 204 205 206 207 423 425 M666 M700 M740 M775
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    44
0 Defined   Cross-reference of data names   References

0     203   CORRECT-N. . . . . . . . . . .  M452 M473 M513 M554 M593 M655 M728 M796 M815 M850 M904 M951 M1033 M1043 M1053
                                            M1063 M1073 M1083 M1093 M1137 M1148 M1159 M1170 M1181 M1192 M1203 M1257 M1268
                                            M1279 M1290 M1301 M1312 M1323 M1379 M1390 M1401 M1412 M1423 M1434 M1445 M1500
                                            M1511 M1522 M1533 M1544 M1555 M1566 M1624 M1635 M1646 M1657 M1668 M1679 M1690
                                            M1745 M1756 M1767 M1778 M1789 M1800 M1811 M1870 M1882 M1893 M2057 M2198
      201   CORRECT-X. . . . . . . . . . .  M340 409 M494 M536 M576 M862 M891 M937 M982 M1214 M1335 M1457 M1578 M1701 M1823
                                            M1858 M1942 M2013 M2092 M2175 M2234
      204   CORRECT-0V18
      206   CORRECT-14V4
      208   CORRECT-18V0 . . . . . . . . .  M613 M634 M692 M766 M993 M1930 M1954 M1966 M1976 M2024 M2036 M2046 M2103 M2115
                                            M2127 M2138 M2186 M2245 M2256
      205   CORRECT-4V14
      207   CR-18V0
      225   DELETE-COUNTER . . . . . . . .  M329 358 374 376
      167   DIV-DATA-2
      161   DIV-02LEVEL-1
      152   DIVIDE-DATA
      153   DIV1 . . . . . . . . . . . . .  M438 M440 441 451 M832 M835 845 849 M917 M921 945 950 M1836 M1840 M1991 M1995
                                            2052 2056 M2153 M2157 2193 2197
      170   DIV10
      155   DIV2 . . . . . . . . . . . . .  M458 461 M519 M523 543 553 M833 835 M918 921 M1837 1840 M1992 1995 M2154 2157
      157   DIV3 . . . . . . . . . . . . .  M459 M461 462 472
      159   DIV4 . . . . . . . . . . . . .  M479 M482 501 512
      162   DIV5 . . . . . . . . . . . . .  M480 482
      164   DIV6 . . . . . . . . . . . . .  M520 523
      165   DIV7 . . . . . . . . . . . . .  M561 M564 583 592
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
      143   MULT1
      145   MULT2
      146   MULT3
      147   MULT4
      149   MULT5
      150   MULT6
      175   P-OR-F . . . . . . . . . . . .  M326 M327 M328 M329 336 M339
      177   PAR-NAME . . . . . . . . . . .  M341 M454 M475 M498 M515 M540 M557 M580 M596 M617 M637 M660 M674 M696 M710 M733
                                            M748 M770 M784 M803 M822 M829 M844 M856 M872 M886 M899 M915 M932 M944 M959 M977
                                            M988 M1002 M1101 M1222 M1343 M1465 M1586 M1709 M1831 M1903 M1985 M2064 M2149
                                            M2207
      179   PARDOT-X . . . . . . . . . . .  M333
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    45
0 Defined   Cross-reference of data names   References

0     228   PASS-COUNTER . . . . . . . . .  M327 359 361
       41   PRINT-FILE . . . . . . . . . .  37 315 321
       42   PRINT-REC. . . . . . . . . . .  M335 M416 M418
      182   RE-MARK. . . . . . . . . . . .  M330 M342 M495 M510 M537 M555 M577 M594 M657 M668 M702 M730 M742 M776 M851 M864
                                            M894 M907 M939 M952 M1134 M1145 M1156 M1167 M1178 M1189 M1200 M1211 M1254 M1265
                                            M1276 M1287 M1298 M1309 M1320 M1332 M1376 M1387 M1398 M1409 M1420 M1431 M1442
                                            M1454 M1497 M1508 M1519 M1530 M1541 M1552 M1563 M1575 M1621 M1632 M1643 M1654
                                            M1665 M1676 M1687 M1698 M1742 M1753 M1764 M1775 M1786 M1797 M1808 M1820 M1860
                                            M1872 M1884 M1894 M1933 M1945 M1957 M2015 M2027 M2058 M2094 M2106 M2118 M2129
                                            M2141 M2177 M2188 M2199 M2236 M2247 M2258
      224   REC-CT . . . . . . . . . . . .  332 334 341 M831 M854 M875 M897 M919 M942 M949 M963 M986 M1011 M1035 M1045 M1055
                                            M1065 M1075 M1085 M1112 M1139 M1150 M1161 M1172 M1183 M1194 M1205 M1232 M1259
                                            M1270 M1281 M1292 M1303 M1314 M1325 M1354 M1381 M1392 M1403 M1414 M1425 M1436
                                            M1447 M1475 M1502 M1513 M1524 M1535 M1546 M1557 M1568 M1597 M1626 M1637 M1648
                                            M1659 M1670 M1681 M1692 M1718 M1747 M1758 M1769 M1780 M1791 M1802 M1813 M1838
                                            M1863 M1875 M1910 M1936 M1948 M1960 M1970 M1993 M2018 M2030 M2040 M2050 M2071
                                            M2097 M2109 M2121 M2132 M2155 M2180 M2191 M2213 M2239 M2250
      223   REC-SKL-SUB
      232   RECORD-COUNT . . . . . . . . .  M386 387 M399
      183   TEST-COMPUTED. . . . . . . . .  416
      198   TEST-CORRECT . . . . . . . . .  418
      251   TEST-ID. . . . . . . . . . . .  M316
      171   TEST-RESULTS . . . . . . . . .  M317 335
      229   TOTAL-ERROR
       88   WRK-AN-X-18-1
       84   WRK-CS-02V02 . . . . . . . . .  M807 M809 811
       69   WRK-CS-18V00 . . . . . . . . .  M1835 M1846 1888 1892 M1909 M1919 1972 1977 M1990 M2001 2042 2047 M2070 M2080
                                            2123 2128 M2152 M2163 2182 2187 M2212 M2222 2241 2246
       77   WRK-DS-01V00 . . . . . . . . .  M641 M644 647 656 M714 M717 720 729
       56   WRK-DS-02V00 . . . . . . . . .  M788 M790 792 797 M1834 M1844 1877 1881 M1908 M1917 1962 1967 M1989 M1999 2032
                                            2037 M2069 M2078 2111 2116
       68   WRK-DS-0201P
       78   WRK-DS-03V10
       82   WRK-DS-05V00 . . . . . . . . .  M1833 M1843 1865 1869 M1907 M1916 1950 1955 M1988 M1998 2020 2025 M2068 M2077
                                            2099 2104
       47   WRK-DS-06V06 . . . . . . . . .  48 M811 816
       64   WRK-DS-09V08 . . . . . . . . .  65
       58   WRK-DS-09V09 . . . . . . . . .  59 M678 M681 M752 M755 M873 M878 900 905 M961 M966 989 994 M1905 M1913 M2066
                                            M2074 2134 2139 M2210 M2216
      119   WRK-DS-1V0-1
      120   WRK-DS-1V0-2
      121   WRK-DS-1V2-1
       50   WRK-DS-10V00
       76   WRK-DS-12V00 . . . . . . . . .  M621 M623 625 633
       48   WRK-DS-12V00-S . . . . . . . .  812
      126   WRK-DS-16V2-1
       65   WRK-DS-17V00-S
       45   WRK-DS-18V00 . . . . . . . . .  M600 M603 605 614 767 1931 2252 2257
       59   WRK-DS-18V00-S . . . . . . . .  684 693 758 1926
      122   WRK-DS-2V0-1
      123   WRK-DS-2V1-1
      124   WRK-DS-2V2-1
      125   WRK-DS-2V2-2
       89   WRK-DU-X-18V0-1
       90   WRK-DU-0V1-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    46
0 Defined   Cross-reference of data names   References

0      92   WRK-DU-0V12-1
       91   WRK-DU-0V2-1 . . . . . . . . .  M1102 1114 M1344 1356 M1587 1599
       93   WRK-DU-1V0-1
       94   WRK-DU-1V1-1
       95   WRK-DU-1V1-2
       99   WRK-DU-1V17-1
       96   WRK-DU-1V3-1 . . . . . . . . .  M1003 1013 M1103 M1223 1234 M1345 M1466 1477 M1588 M1710 1720
       97   WRK-DU-1V3-2 . . . . . . . . .  M1009 M1018 1067 1072 M1109 M1119 1174 1180 M1229 M1239 1294 1300 M1351 M1361
                                            1416 1422 M1472 M1482 1537 1543 M1594 M1604 1661 1667 M1716 M1725 1782 1788
       98   WRK-DU-1V5-1
      117   WRK-DU-16V2-1
       70   WRK-DU-18V00
      100   WRK-DU-2P6-1
      101   WRK-DU-2V0-1
      102   WRK-DU-2V0-2
      103   WRK-DU-2V0-3
      104   WRK-DU-2V1-1 . . . . . . . . .  M1010 M1020 1087 1092 M1110 M1121 1196 1202 M1230 M1241 1316 1322 M1352 M1363
                                            1438 1444 M1473 M1484 1559 1565 M1595 M1606 1683 1689 M1717 M1727 1804 1810
      105   WRK-DU-2V1-2
      106   WRK-DU-2V1-3
      107   WRK-DU-2V2-1 . . . . . . . . .  M1004 M1014 1027 1032 M1104 M1115 1130 1136 M1224 M1235 1250 1256 M1346 M1357
                                            1372 1378 M1467 M1478 1493 1499 M1589 M1600 1617 1623 M1711 M1721 1738 1744
      108   WRK-DU-2V2-2 . . . . . . . . .  M1005 M1015 1037 1042 M1105 M1116 1141 1147 M1225 M1236 1261 1267 M1347 M1358
                                            1383 1389 M1468 M1479 1504 1510 M1590 M1601 1628 1634 M1712 M1722 1749 1755
      109   WRK-DU-2V2-3 . . . . . . . . .  M1006 M1016 1047 1052 M1106 M1117 1152 1158 M1226 M1237 1272 1278 M1348 M1359
                                            1394 1400 M1469 M1480 1515 1521 M1591 M1602 1639 1645 M1713 M1723 1760 1766
      110   WRK-DU-2V2-4 . . . . . . . . .  M1007 M1017 1057 1062 M1107 M1118 1163 1169 M1227 M1238 1283 1289 M1349 M1360
                                            1405 1411 M1470 M1481 1526 1532 M1592 M1603 1650 1656 M1714 M1724 1771 1777
      111   WRK-DU-2V2-5 . . . . . . . . .  M1008 M1019 1077 1082 M1108 M1120 1185 1191 M1228 M1240 1305 1311 M1350 M1362
                                            1427 1433 M1471 M1483 1548 1554 M1593 M1605 1672 1678 M1715 M1726 1793 1799
      112   WRK-DU-2V5-1
      113   WRK-DU-4P1-1
      114   WRK-DU-5V1-1
      115   WRK-DU-6V0-1
      116   WRK-DU-6V0-2
      118   WRK-NE-X-1
      127   WRK-NE-X-2
      128   WRK-NE-1
      129   WRK-NE-2
      130   WRK-NE-3
      131   WRK-NE-4
       51   WRK-XN-00001 . . . . . . . . .  M642 M645 663 667 M679 M682 699 M715 M718 736 741 M753 M756 773 774 M874 M879
                                            887 892 M962 M968 M970 978 983 M1111 M1123 1207 1213 M1231 M1243 1327 1334 M1353
                                            M1365 1449 1456 M1474 M1486 1570 1577 M1596 M1608 M1610 1694 1700 M1729 M1731
                                            1815 1822 M1832 M1842 1853 1857 M1906 M1915 1938 1943 M1987 M1997 2008 2012 M2067
                                            M2076 2087 2091 M2151 M2159 M2161 2170 2174 M2211 M2218 M2220 2229 2233
       87   WRK-XN-18-1. . . . . . . . . .  88 89
       86   XRAY . . . . . . . . . . . . .  M483 484 493 M521 M524 526 535 M562 M565 566 575 M830 M837 857 861 M916 M923
                                            M925 933 938
      300   XXCOMPUTED . . . . . . . . . .  M425
      302   XXCORRECT. . . . . . . . . . .  M425
      295   XXINFO . . . . . . . . . . . .  412 427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    47
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
     2263   CCVS-EXIT. . . . . . . . . . .  G2227
     2264   CCVS-999999
      313   CCVS1
      430   CCVS1-EXIT . . . . . . . . . .  G319
      320   CLOSE-FILES. . . . . . . . . .  G2265
      348   COLUMN-NAMES-ROUTINE . . . . .  E318
      329   DE-LETE. . . . . . . . . . . .  P447 P468 P490 P507 P532 P549 P572 P588 P610 P630 P652 P672 P689 P708 P725 P746
                                            P763 P782 P801 P820 P840 P882 P928 P973 P1023 P1126 P1246 P1368 P1489 P1613 P1734
                                            P1849 P1922 P2004 P2083 P2166 P2225
      446   DIV-DELETE-F1-1
      724   DIV-DELETE-F1-10-1
      745   DIV-DELETE-F1-10-2
      762   DIV-DELETE-F1-11-1
      781   DIV-DELETE-F1-11-2
      800   DIV-DELETE-F1-12
      819   DIV-DELETE-F1-13
      839   DIV-DELETE-F1-14-1
      881   DIV-DELETE-F1-15-1
      927   DIV-DELETE-F1-16-1
      972   DIV-DELETE-F1-17-1
     1022   DIV-DELETE-F1-18
     1125   DIV-DELETE-F1-19
      467   DIV-DELETE-F1-2
     1245   DIV-DELETE-F1-20
     1367   DIV-DELETE-F1-21
     1488   DIV-DELETE-F1-22
     1612   DIV-DELETE-F1-23
     1733   DIV-DELETE-F1-24
     1848   DIV-DELETE-F1-25-1
     1921   DIV-DELETE-F1-26-1
     2003   DIV-DELETE-F1-27-1
     2082   DIV-DELETE-F1-28-1
     2165   DIV-DELETE-F1-29-1
      489   DIV-DELETE-F1-3-1
      506   DIV-DELETE-F1-3-2
     2224   DIV-DELETE-F1-30-1
      531   DIV-DELETE-F1-4-1
      548   DIV-DELETE-F1-4-2
      571   DIV-DELETE-F1-5-1
      587   DIV-DELETE-F1-5-2
      609   DIV-DELETE-F1-6
      629   DIV-DELETE-F1-7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    48
0 Defined   Cross-reference of procedures   References

0     651   DIV-DELETE-F1-8-1
      671   DIV-DELETE-F1-8-2
      688   DIV-DELETE-F1-9-1
      707   DIV-DELETE-F1-9-2
      449   DIV-FAIL-F1-1. . . . . . . . .  G444
      727   DIV-FAIL-F1-10-1 . . . . . . .  G723
      739   DIV-FAIL-F1-10-2
      765   DIV-FAIL-F1-11-1 . . . . . . .  G761
      795   DIV-FAIL-F1-12
      470   DIV-FAIL-F1-2. . . . . . . . .  G465
      492   DIV-FAIL-F1-3-1. . . . . . . .  G487
      509   DIV-FAIL-F1-3-2. . . . . . . .  G504
      534   DIV-FAIL-F1-4-1. . . . . . . .  G529
      551   DIV-FAIL-F1-4-2. . . . . . . .  G546
      574   DIV-FAIL-F1-5-1. . . . . . . .  G569
      590   DIV-FAIL-F1-5-2. . . . . . . .  G584
      612   DIV-FAIL-F1-6. . . . . . . . .  G608
      632   DIV-FAIL-F1-7. . . . . . . . .  G628
      654   DIV-FAIL-F1-8-1. . . . . . . .  G650
      691   DIV-FAIL-F1-9-1. . . . . . . .  G687
      435   DIV-INIT-F1-1
      712   DIV-INIT-F1-10
      750   DIV-INIT-F1-11
      786   DIV-INIT-F1-12
      805   DIV-INIT-F1-13
      826   DIV-INIT-F1-14
      869   DIV-INIT-F1-15 . . . . . . . .  G842
      912   DIV-INIT-F1-16 . . . . . . . .  G884
      957   DIV-INIT-F1-17 . . . . . . . .  G930
      999   DIV-INIT-F1-18 . . . . . . . .  G975
     1097   DIV-INIT-F1-19 . . . . . . . .  G1025
      456   DIV-INIT-F1-2
     1218   DIV-INIT-F1-20 . . . . . . . .  G1128
     1339   DIV-INIT-F1-21 . . . . . . . .  G1248
     1461   DIV-INIT-F1-22 . . . . . . . .  G1370
     1582   DIV-INIT-F1-23 . . . . . . . .  G1491
     1705   DIV-INIT-F1-24 . . . . . . . .  G1615
     1827   DIV-INIT-F1-25 . . . . . . . .  G1736
     1899   DIV-INIT-F1-26 . . . . . . . .  G1851
     1982   DIV-INIT-F1-27 . . . . . . . .  G1924
     2063   DIV-INIT-F1-28 . . . . . . . .  G2006
     2146   DIV-INIT-F1-29 . . . . . . . .  G2085
      477   DIV-INIT-F1-3
     2204   DIV-INIT-F1-30 . . . . . . . .  G2168
      517   DIV-INIT-F1-4
      559   DIV-INIT-F1-5
      598   DIV-INIT-F1-6
      619   DIV-INIT-F1-7
      639   DIV-INIT-F1-8
      676   DIV-INIT-F1-9
      439   DIV-TEST-F1-1
      716   DIV-TEST-F1-10-0
      719   DIV-TEST-F1-10-1
      735   DIV-TEST-F1-10-2
      754   DIV-TEST-F1-11-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    49
0 Defined   Cross-reference of procedures   References

0     757   DIV-TEST-F1-11-1
      772   DIV-TEST-F1-11-2
      789   DIV-TEST-F1-12-0
      791   DIV-TEST-F1-12-1
      808   DIV-TEST-F1-13-0
      810   DIV-TEST-F1-13-1
      834   DIV-TEST-F1-14-0
      843   DIV-TEST-F1-14-1 . . . . . . .  G838
      855   DIV-TEST-F1-14-2
      876   DIV-TEST-F1-15-0
      885   DIV-TEST-F1-15-1 . . . . . . .  G880
      898   DIV-TEST-F1-15-2
      920   DIV-TEST-F1-16-0
      931   DIV-TEST-F1-16-1 . . . . . . .  G926
      943   DIV-TEST-F1-16-2
      964   DIV-TEST-F1-17-0
      976   DIV-TEST-F1-17-1 . . . . . . .  G971
      987   DIV-TEST-F1-17-2
     1012   DIV-TEST-F1-18-0
     1026   DIV-TEST-F1-18-1 . . . . . . .  G1021
     1036   DIV-TEST-F1-18-2
     1046   DIV-TEST-F1-18-3
     1056   DIV-TEST-F1-18-4
     1066   DIV-TEST-F1-18-5
     1076   DIV-TEST-F1-18-6
     1086   DIV-TEST-F1-18-7
     1113   DIV-TEST-F1-19-0
     1129   DIV-TEST-F1-19-1 . . . . . . .  G1124
     1140   DIV-TEST-F1-19-2
     1151   DIV-TEST-F1-19-3
     1162   DIV-TEST-F1-19-4
     1173   DIV-TEST-F1-19-5
     1184   DIV-TEST-F1-19-6
     1195   DIV-TEST-F1-19-7
     1206   DIV-TEST-F1-19-8
      460   DIV-TEST-F1-2
     1233   DIV-TEST-F1-20-0
     1249   DIV-TEST-F1-20-1 . . . . . . .  G1244
     1260   DIV-TEST-F1-20-2
     1271   DIV-TEST-F1-20-3
     1282   DIV-TEST-F1-20-4
     1293   DIV-TEST-F1-20-5
     1304   DIV-TEST-F1-20-6
     1315   DIV-TEST-F1-20-7
     1326   DIV-TEST-F1-20-8
     1355   DIV-TEST-F1-21-0
     1371   DIV-TEST-F1-21-1 . . . . . . .  G1366
     1382   DIV-TEST-F1-21-2
     1393   DIV-TEST-F1-21-3
     1404   DIV-TEST-F1-21-4
     1415   DIV-TEST-F1-21-5
     1426   DIV-TEST-F1-21-6
     1437   DIV-TEST-F1-21-7
     1448   DIV-TEST-F1-21-8
     1476   DIV-TEST-F1-22-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    50
0 Defined   Cross-reference of procedures   References

0    1492   DIV-TEST-F1-22-1 . . . . . . .  G1487
     1503   DIV-TEST-F1-22-2
     1514   DIV-TEST-F1-22-3
     1525   DIV-TEST-F1-22-4
     1536   DIV-TEST-F1-22-5
     1547   DIV-TEST-F1-22-6
     1558   DIV-TEST-F1-22-7
     1569   DIV-TEST-F1-22-8
     1598   DIV-TEST-F1-23-0
     1616   DIV-TEST-F1-23-1 . . . . . . .  G1611
     1627   DIV-TEST-F1-23-2
     1638   DIV-TEST-F1-23-3
     1649   DIV-TEST-F1-23-4
     1660   DIV-TEST-F1-23-5
     1671   DIV-TEST-F1-23-6
     1682   DIV-TEST-F1-23-7
     1693   DIV-TEST-F1-23-8
     1719   DIV-TEST-F1-24-0
     1737   DIV-TEST-F1-24-1 . . . . . . .  G1732
     1748   DIV-TEST-F1-24-2
     1759   DIV-TEST-F1-24-3
     1770   DIV-TEST-F1-24-4
     1781   DIV-TEST-F1-24-5
     1792   DIV-TEST-F1-24-6
     1803   DIV-TEST-F1-24-7
     1814   DIV-TEST-F1-24-8
     1839   DIV-TEST-F1-25-0
     1852   DIV-TEST-F1-25-1 . . . . . . .  G1847
     1864   DIV-TEST-F1-25-2
     1876   DIV-TEST-F1-25-3
     1887   DIV-TEST-F1-25-4
     1911   DIV-TEST-F1-26-0
     1925   DIV-TEST-F1-26-1 . . . . . . .  G1920
     1937   DIV-TEST-F1-26-2
     1949   DIV-TEST-F1-26-3
     1961   DIV-TEST-F1-26-4
     1971   DIV-TEST-F1-26-5
     1994   DIV-TEST-F1-27-0
     2007   DIV-TEST-F1-27-1 . . . . . . .  G2002
     2019   DIV-TEST-F1-27-2
     2031   DIV-TEST-F1-27-3
     2041   DIV-TEST-F1-27-4
     2051   DIV-TEST-F1-27-5
     2072   DIV-TEST-F1-28-0
     2086   DIV-TEST-F1-28-1 . . . . . . .  G2081
     2098   DIV-TEST-F1-28-2
     2110   DIV-TEST-F1-28-3
     2122   DIV-TEST-F1-28-4
     2133   DIV-TEST-F1-28-5
     2156   DIV-TEST-F1-29-0
     2169   DIV-TEST-F1-29-1 . . . . . . .  G2164
     2181   DIV-TEST-F1-29-2
     2192   DIV-TEST-F1-29-3
      481   DIV-TEST-F1-3-1
      500   DIV-TEST-F1-3-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    51
0 Defined   Cross-reference of procedures   References

0    2214   DIV-TEST-F1-30-0
     2228   DIV-TEST-F1-30-1 . . . . . . .  G2223
     2240   DIV-TEST-F1-30-2
     2251   DIV-TEST-F1-30-3
      522   DIV-TEST-F1-4-0
      525   DIV-TEST-F1-4-1
      542   DIV-TEST-F1-4-2
      563   DIV-TEST-F1-5-1
      582   DIV-TEST-F1-5-2
      602   DIV-TEST-F1-6-0
      604   DIV-TEST-F1-6-1
      622   DIV-TEST-F1-7-0
      624   DIV-TEST-F1-7-1
      643   DIV-TEST-F1-8-0
      646   DIV-TEST-F1-8-1
      662   DIV-TEST-F1-8-2
      680   DIV-TEST-F1-9-0
      683   DIV-TEST-F1-9-1
      698   DIV-TEST-F1-9-2
      453   DIV-WRITE-F1-1 . . . . . . . .  G445 G448
      732   DIV-WRITE-F1-10-1. . . . . . .  G722 G726
      747   DIV-WRITE-F1-10-2. . . . . . .  G738 G744
      769   DIV-WRITE-F1-11-1. . . . . . .  G760 G764
      783   DIV-WRITE-F1-11-2. . . . . . .  G778 G780
      802   DIV-WRITE-F1-12. . . . . . . .  G794 G799
      821   DIV-WRITE-F1-13. . . . . . . .  G814 G818
      474   DIV-WRITE-F1-2 . . . . . . . .  G466 G469
      497   DIV-WRITE-F1-3-1 . . . . . . .  G488 G491
      514   DIV-WRITE-F1-3-2 . . . . . . .  G505 G508
      539   DIV-WRITE-F1-4-1 . . . . . . .  G530 G533
      556   DIV-WRITE-F1-4-2 . . . . . . .  G547 G550
      579   DIV-WRITE-F1-5-1 . . . . . . .  G570 G573
      595   DIV-WRITE-F1-5-2 . . . . . . .  G586 G589
      616   DIV-WRITE-F1-6 . . . . . . . .  G607 G611
      636   DIV-WRITE-F1-7 . . . . . . . .  G627 G631
      659   DIV-WRITE-F1-8-1 . . . . . . .  G649 G653
      673   DIV-WRITE-F1-8-2 . . . . . . .  G665 G670
      695   DIV-WRITE-F1-9-1 . . . . . . .  G686 G690
      709   DIV-WRITE-F1-9-2 . . . . . . .  G704 G706
      352   END-ROUTINE. . . . . . . . . .  P321
      356   END-ROUTINE-1
      365   END-ROUTINE-12
      373   END-ROUTINE-13 . . . . . . . .  E321
      354   END-RTN-EXIT
      328   FAIL . . . . . . . . . . . . .  P450 P471 P496 P511 P538 P552 P578 P591 P615 P635 P658 P669 P694 P703 P731 P743
                                            P768 P777 P798 P817 P852 P865 P895 P908 P940 P953 P984 P995 P1031 P1041 P1051
                                            P1061 P1071 P1081 P1091 P1135 P1146 P1157 P1168 P1179 P1190 P1201 P1212 P1255
                                            P1266 P1277 P1288 P1299 P1310 P1321 P1333 P1377 P1388 P1399 P1410 P1421 P1432
                                            P1443 P1455 P1498 P1509 P1520 P1531 P1542 P1553 P1564 P1576 P1622 P1633 P1644
                                            P1655 P1666 P1677 P1688 P1699 P1743 P1754 P1765 P1776 P1787 P1798 P1809 P1821
                                            P1861 P1873 P1885 P1895 P1934 P1946 P1958 P1968 P1978 P2016 P2028 P2038 P2048
                                            P2059 P2095 P2107 P2119 P2130 P2142 P2178 P2189 P2200 P2237 P2248 P2259
      406   FAIL-ROUTINE . . . . . . . . .  P337
      420   FAIL-ROUTINE-EX. . . . . . . .  E337 G414
      415   FAIL-ROUTINE-WRITE . . . . . .  G408 G409
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    52
0 Defined   Cross-reference of procedures   References

0     343   HEAD-ROUTINE . . . . . . . . .  P318
      326   INSPT
      314   OPEN-FILES
      327   PASS . . . . . . . . . . . . .  P442 P463 P485 P502 P527 P544 P567 P585 P606 P626 P648 P664 P685 P705 P721 P737
                                            P759 P779 P793 P813 P846 P858 P888 P901 P934 P946 P979 P990 P1028 P1038 P1048
                                            P1058 P1068 P1078 P1088 P1131 P1142 P1153 P1164 P1175 P1186 P1197 P1208 P1251
                                            P1262 P1273 P1284 P1295 P1306 P1317 P1328 P1373 P1384 P1395 P1406 P1417 P1428
                                            P1439 P1450 P1494 P1505 P1516 P1527 P1538 P1549 P1560 P1571 P1618 P1629 P1640
                                            P1651 P1662 P1673 P1684 P1695 P1739 P1750 P1761 P1772 P1783 P1794 P1805 P1816
                                            P1854 P1866 P1878 P1889 P1927 P1939 P1951 P1963 P1973 P2009 P2021 P2033 P2043
                                            P2053 P2088 P2100 P2112 P2124 P2135 P2171 P2183 P2194 P2230 P2242 P2253
      331   PRINT-DETAIL . . . . . . . . .  P455 P476 P499 P516 P541 P558 P581 P597 P618 P638 P661 P675 P697 P711 P734 P749
                                            P771 P785 P804 P823 P841 P847 P853 P859 P866 P883 P889 P896 P902 P909 P929 P935
                                            P941 P947 P954 P974 P980 P985 P991 P996 P1024 P1029 P1034 P1039 P1044 P1049 P1054
                                            P1059 P1064 P1069 P1074 P1079 P1084 P1089 P1094 P1127 P1132 P1138 P1143 P1149
                                            P1154 P1160 P1165 P1171 P1176 P1182 P1187 P1193 P1198 P1204 P1209 P1215 P1247
                                            P1252 P1258 P1263 P1269 P1274 P1280 P1285 P1291 P1296 P1302 P1307 P1313 P1318
                                            P1324 P1329 P1336 P1369 P1374 P1380 P1385 P1391 P1396 P1402 P1407 P1413 P1418
                                            P1424 P1429 P1435 P1440 P1446 P1451 P1458 P1490 P1495 P1501 P1506 P1512 P1517
                                            P1523 P1528 P1534 P1539 P1545 P1550 P1556 P1561 P1567 P1572 P1579 P1614 P1619
                                            P1625 P1630 P1636 P1641 P1647 P1652 P1658 P1663 P1669 P1674 P1680 P1685 P1691
                                            P1696 P1702 P1735 P1740 P1746 P1751 P1757 P1762 P1768 P1773 P1779 P1784 P1790
                                            P1795 P1801 P1806 P1812 P1817 P1824 P1850 P1855 P1862 P1867 P1874 P1879 P1886
                                            P1890 P1896 P1923 P1928 P1935 P1940 P1947 P1952 P1959 P1964 P1969 P1974 P1979
                                            P2005 P2010 P2017 P2022 P2029 P2034 P2039 P2044 P2049 P2054 P2060 P2084 P2089
                                            P2096 P2101 P2108 P2113 P2120 P2125 P2131 P2136 P2143 P2167 P2172 P2179 P2184
                                            P2190 P2195 P2201 P2226 P2231 P2238 P2243 P2249 P2254 P2260
      432   SECT-NC171A-001
      324   TERMINATE-CALL
      322   TERMINATE-CCVS
      385   WRITE-LINE . . . . . . . . . .  P335 P336 P344 P345 P346 P347 P349 P350 P351 P353 P355 P364 P372 P378 P383 P384
                                            P412 P416 P418 P427
      401   WRT-LN . . . . . . . . . . . .  P391 P392 P393 P394 P395 P396 P397 P400 P405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    53
0 Defined   Cross-reference of programs     References

        3   NC171A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC171A    Date 06/04/2022  Time 12:00:41   Page    54
0LineID  Message code  Message text

     41  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC171A:
 *    Source records = 2265
 *    Data Division statements = 168
 *    Procedure Division statements = 1467
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1480
0End of compilation 1,  program NC171A,  highest severity 0.
0Return code 0
