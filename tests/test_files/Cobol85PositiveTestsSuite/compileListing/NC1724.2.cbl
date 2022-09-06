1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:57   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:57   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1724.2
   000002         000200 PROGRAM-ID.                                                      NC1724.2
   000003         000300     NC172A.                                                      NC1724.2
   000004         000500*                                                              *  NC1724.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1724.2
   000006         000700*                                                              *  NC1724.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1724.2
   000008         000900*                                                              *  NC1724.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1724.2
   000010         001100*                                                              *  NC1724.2
   000011         001300*                                                              *  NC1724.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1724.2
   000013         001500*                                                              *  NC1724.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1724.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1724.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1724.2
   000017         001900*                                                              *  NC1724.2
   000018         002100*    THIS PROGRAM TESTS THE FORMAT 2 DIVIDE STATEMENT FOUND       NC1724.2
   000019         002200*    IN LEVEL 1.   ALL COMBINATIONS OF THE OPTIONAL PHRASES       NC1724.2
   000020         002300*    "SIZE ERROR", "NOT SIZE ERROR" AND "END-MULTIPLY" ARE        NC1724.2
   000021         002400*    TESTED, AS WELL AS THE ROUNDED OPTION.                       NC1724.2
   000022         002500*                                                                 NC1724.2
   000023         002600*    VARIOUS COMBINATIONS OF SIGNED AND UNSIGNED NUMERIC          NC1724.2
   000024         002700*    LITERALS, DISPLAY AND COMPUTATIONAL FIELDS ARE USED          NC1724.2
   000025         002800*    AS OPERANDS.                                                 NC1724.2
   000026         002900*                                                                 NC1724.2
   000027         003000                                                                  NC1724.2
   000028         003100                                                                  NC1724.2
   000029         003200 ENVIRONMENT DIVISION.                                            NC1724.2
   000030         003300 CONFIGURATION SECTION.                                           NC1724.2
   000031         003400 SOURCE-COMPUTER.                                                 NC1724.2
   000032         003500     XXXXX082.                                                    NC1724.2
   000033         003600 OBJECT-COMPUTER.                                                 NC1724.2
   000034         003700     XXXXX083.                                                    NC1724.2
   000035         003800 INPUT-OUTPUT SECTION.                                            NC1724.2
   000036         003900 FILE-CONTROL.                                                    NC1724.2
   000037         004000     SELECT PRINT-FILE ASSIGN TO                                  NC1724.2 41
   000038         004100     XXXXX055.                                                    NC1724.2
   000039         004200 DATA DIVISION.                                                   NC1724.2
   000040         004300 FILE SECTION.                                                    NC1724.2
   000041         004400 FD  PRINT-FILE.                                                  NC1724.2

 ==000041==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000042         004500 01  PRINT-REC PICTURE X(120).                                    NC1724.2
   000043         004600 01  DUMMY-RECORD PICTURE X(120).                                 NC1724.2
   000044         004700 WORKING-STORAGE SECTION.                                         NC1724.2
   000045         004800 77  WRK-DS-18V00                PICTURE S9(18).                  NC1724.2
   000046         004900 77  A06THREES-DS-03V03          PICTURE S999V999 VALUE 333.333.  NC1724.2
   000047         005000 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC1724.2
   000048         005100 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06 PICTURE S9(12).        NC1724.2 47
   000049         005200 77  A08TWOS-DS-02V06            PICTURE S99V9(6) VALUE 22.222222.NC1724.2
   000050         005300 77  WRK-DS-10V00                PICTURE S9(10).                  NC1724.2
   000051         005400 77  WRK-XN-00001                PICTURE X.                       NC1724.2
   000052         005500 77  A10ONES-DS-10V00            PICTURE S9(10)                   NC1724.2
   000053         005600                                 VALUE 1111111111.                NC1724.2
   000054         005700 77  A12THREES-DS-06V06          PICTURE S9(6)V9(6)               NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800                                 VALUE 333333.333333.             NC1724.2
   000056         005900 77  WRK-DS-02V00                PICTURE S99.                     NC1724.2
   000057         006000 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC1724.2 IMP
   000058         006100 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1724.2
   000059         006200 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC1724.2 58
   000060         006300 77  A05ONES-DS-00V05            PICTURE SV9(5) VALUE .11111.     NC1724.2
   000061         006400 77  A12ONES-DS-12V00            PICTURE S9(12)                   NC1724.2
   000062         006500                                 VALUE 111111111111.              NC1724.2
   000063         006600 77  A01ONE-DS-P0801             PICTURE SP(8)9 VALUE .000000001. NC1724.2
   000064         006700 77  WRK-DS-09V08                PICTURE S9(9)V9(8).              NC1724.2
   000065         006800 77  WRK-DS-17V00-S REDEFINES WRK-DS-09V08 PICTURE S9(17).        NC1724.2 64
   000066         006900 77  A18ONES-DS-18V00            PICTURE S9(18)                   NC1724.2
   000067         007000                                 VALUE 111111111111111111.        NC1724.2
   000068         007100 77  WRK-DS-0201P                PICTURE S99P.                    NC1724.2
   000069         007200 77  WRK-CS-18V00                PICTURE S9(18) COMPUTATIONAL.    NC1724.2
   000070         007300 77  WRK-DU-18V00                PICTURE 9(18).                   NC1724.2
   000071         007400 77  A99-CS-02V00                PICTURE S99 COMPUTATIONAL        NC1724.2
   000072         007500                                 VALUE 99.                        NC1724.2
   000073         007600 77  A01ONE-CS-00V01             PICTURE SV9 COMPUTATIONAL        NC1724.2
   000074         007700                                 VALUE .1.                        NC1724.2
   000075         007800 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC1724.2
   000076         007900 77  WRK-DS-12V00                PICTURE S9(12).                  NC1724.2
   000077         008000 77  WRK-DS-01V00                PICTURE S9.                      NC1724.2
   000078         008100 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC1724.2
   000079         008200 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC1724.2
   000080         008300                                 VALUE 111111111.111111111.       NC1724.2
   000081         008400 77  A02TWOS-DU-02V00            PICTURE 99  VALUE 22.            NC1724.2
   000082         008500 77  WRK-DS-05V00                PICTURE S9(5).                   NC1724.2
   000083         008600 77  A02TWOS-DS-03V02            PICTURE S999V99 VALUE +022.00.   NC1724.2
   000084         008700 77  WRK-CS-02V02                PICTURE S99V99  COMPUTATIONAL.   NC1724.2
   000085         008800 77  A990-DS-0201P               PICTURE S99P   VALUE +990.       NC1724.2
   000086         008900 77  XRAY                        PICTURE X.                       NC1724.2
   000087         009000 01  WRK-XN-18-1 PIC X(18).                                       NC1724.2
   000088         009100 01  WRK-AN-X-18-1, REDEFINES WRK-XN-18-1 PIC A(18).              NC1724.2 87
   000089         009200 01  WRK-DU-X-18V0-1; REDEFINES WRK-XN-18-1 PIC 9(18).            NC1724.2 87
   000090         009300 01  WRK-DU-0V1-1 PIC V9 VALUE .3.                                NC1724.2
   000091         009400 01  WRK-DU-0V2-1 PIC V99 VALUE .25.                              NC1724.2
   000092         009500 01  WRK-DU-0V12-1 PIC V9(12) VALUE .00001.                       NC1724.2
   000093         009600 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1724.2 IMP
   000094         009700 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1724.2
   000095         009800 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1724.2
   000096         009900 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1724.2
   000097         010000 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1724.2
   000098         010100 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1724.2
   000099         010200 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1724.2
   000100         010300 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1724.2
   000101         010400 01  WRK-DU-2V0-1 PIC 99.                                         NC1724.2
   000102         010500 01  WRK-DU-2V0-2 PIC 99.                                         NC1724.2
   000103         010600 01  WRK-DU-2V0-3 PIC 99.                                         NC1724.2
   000104         010700 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1724.2
   000105         010800 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1724.2
   000106         010900 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1724.2
   000107         011000 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1724.2
   000108         011100 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1724.2
   000109         011200 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1724.2
   000110         011300 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1724.2
   000111         011400 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1724.2
   000113         011600 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1724.2
   000114         011700 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1724.2
   000115         011800 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1724.2
   000116         011900 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1724.2
   000117         012000 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1724.2
   000118         012100 01  WRK-NE-X-1 PIC 9(16).99.                                     NC1724.2
   000119         012200 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1724.2
   000120         012300 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1724.2
   000121         012400 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1724.2 IMP
   000122         012500 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1724.2 IMP
   000123         012600 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1724.2 IMP
   000124         012700 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1724.2 IMP
   000125         012800 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1724.2
   000126         012900 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1724.2
   000127         013000 01  WRK-NE-X-2 PIC -9(16).99.                                    NC1724.2
   000128         013100 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC1724.2
   000129         013200 01  WRK-NE-2 PIC $**.99.                                         NC1724.2
   000130         013300 01  WRK-NE-3 PIC $99.99CR.                                       NC1724.2
   000131         013400 01  WRK-NE-4 PIC $*9.99 VALUE ZERO.                              NC1724.2 IMP
   000132         013500 77  A01ONES-CS-18V00   PICTURE S9(18) COMPUTATIONAL              NC1724.2
   000133         013600             VALUE +000000000000000001.                           NC1724.2
   000134         013700 77  A02THREES-CS-18V00 PICTURE S9(18) COMPUTATIONAL              NC1724.2
   000135         013800             VALUE -000000000000000033.                           NC1724.2
   000136         013900 77  A18SIXES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1724.2
   000137         014000             VALUE 666666666666666666.                            NC1724.2
   000138         014100 77  A16NINES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1724.2
   000139         014200             VALUE 009999999999999999.                            NC1724.2
   000140         014300 77  A14TWOS-CU-18V00   PICTURE 9(18) COMPUTATIONAL               NC1724.2
   000141         014400             VALUE 000022222222222222.                            NC1724.2
   000142         014500 01  MULTIPLY-DATA.                                               NC1724.2
   000143         014600     02 MULT1                           PICTURE IS 999V99         NC1724.2
   000144         014700     VALUE IS 80.12.                                              NC1724.2
   000145         014800     02 MULT2                           PICTURE IS 999V999.       NC1724.2
   000146         014900     02 MULT3                           PICTURE IS $$99.99.       NC1724.2
   000147         015000     02 MULT4                           PICTURE IS S99            NC1724.2
   000148         015100     VALUE IS -56.                                                NC1724.2
   000149         015200     02 MULT5                           PICTURE IS 9 VALUE IS 4.  NC1724.2
   000150         015300     02 MULT6                           PICTURE IS 99 VALUE IS    NC1724.2
   000151         015400     20.                                                          NC1724.2
   000152         015500 01  DIVIDE-DATA.                                                 NC1724.2
   000153         015600     02 DIV1                            PICTURE IS 9(4)V99        NC1724.2
   000154         015700     VALUE IS 1620.36.                                            NC1724.2
   000155         015800     02 DIV2                            PICTURE IS 99V9           NC1724.2
   000156         015900     VALUE IS 44.1.                                               NC1724.2
   000157         016000     02 DIV3                            PICTURE IS 9(4)V9         NC1724.2
   000158         016100     VALUE IS 1661.7.                                             NC1724.2
   000159         016200     02 DIV4                            PICTURE IS S9V999         NC1724.2
   000160         016300     VALUE IS -9.642.                                             NC1724.2
   000161         016400     02 DIV-02LEVEL-1.                                            NC1724.2
   000162         016500     03 DIV5                            PICTURE IS V99            NC1724.2
   000163         016600     VALUE IS .82.                                                NC1724.2
   000164         016700     03 DIV6                            PICTURE IS 9 VALUE IS 0.  NC1724.2
   000165         016800     03 DIV7                            PICTURE IS 9V9            NC1724.2
   000166         016900     VALUE IS 9.6.                                                NC1724.2
   000167         017000 01  DIV-DATA-2.                                                  NC1724.2
   000168         017100     02 DIV8                            PICTURE IS 99V9.          NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 DIV9                            PICTURE IS ZZ,ZZZ.9.      NC1724.2
   000170         017300     02 DIV10                           PICTURE IS V999.          NC1724.2
   000171         017400 01  TEST-RESULTS.                                                NC1724.2
   000172         017500     02 FILLER                   PIC X      VALUE SPACE.          NC1724.2 IMP
   000173         017600     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1724.2 IMP
   000174         017700     02 FILLER                   PIC X      VALUE SPACE.          NC1724.2 IMP
   000175         017800     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1724.2 IMP
   000176         017900     02 FILLER                   PIC X      VALUE SPACE.          NC1724.2 IMP
   000177         018000     02  PAR-NAME.                                                NC1724.2
   000178         018100       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1724.2 IMP
   000179         018200       03  PARDOT-X              PIC X      VALUE SPACE.          NC1724.2 IMP
   000180         018300       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1724.2 IMP
   000181         018400     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1724.2 IMP
   000182         018500     02 RE-MARK                  PIC X(61).                       NC1724.2
   000183         018600 01  TEST-COMPUTED.                                               NC1724.2
   000184         018700     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1724.2 IMP
   000185         018800     02 FILLER                   PIC X(17)  VALUE                 NC1724.2
   000186         018900            "       COMPUTED=".                                   NC1724.2
   000187         019000     02 COMPUTED-X.                                               NC1724.2
   000188         019100     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1724.2 IMP
   000189         019200     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1724.2 188
   000190         019300                                 PIC -9(9).9(9).                  NC1724.2
   000191         019400     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1724.2 188
   000192         019500     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1724.2 188
   000193         019600     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1724.2 188
   000194         019700     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1724.2 188
   000195         019800         04 COMPUTED-18V0                    PIC -9(18).          NC1724.2
   000196         019900         04 FILLER                           PIC X.               NC1724.2
   000197         020000     03 FILLER PIC X(50) VALUE SPACE.                             NC1724.2 IMP
   000198         020100 01  TEST-CORRECT.                                                NC1724.2
   000199         020200     02 FILLER PIC X(30) VALUE SPACE.                             NC1724.2 IMP
   000200         020300     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1724.2
   000201         020400     02 CORRECT-X.                                                NC1724.2
   000202         020500     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1724.2 IMP
   000203         020600     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1724.2 202
   000204         020700     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1724.2 202
   000205         020800     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1724.2 202
   000206         020900     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1724.2 202
   000207         021000     03      CR-18V0 REDEFINES CORRECT-A.                         NC1724.2 202
   000208         021100         04 CORRECT-18V0                     PIC -9(18).          NC1724.2
   000209         021200         04 FILLER                           PIC X.               NC1724.2
   000210         021300     03 FILLER PIC X(2) VALUE SPACE.                              NC1724.2 IMP
   000211         021400     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1724.2 IMP
   000212         021500 01  CCVS-C-1.                                                    NC1724.2
   000213         021600     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1724.2
   000214         021700-    "SS  PARAGRAPH-NAME                                          NC1724.2
   000215         021800-    "       REMARKS".                                            NC1724.2
   000216         021900     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1724.2 IMP
   000217         022000 01  CCVS-C-2.                                                    NC1724.2
   000218         022100     02 FILLER                     PIC X        VALUE SPACE.      NC1724.2 IMP
   000219         022200     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1724.2
   000220         022300     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1724.2 IMP
   000221         022400     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1724.2
   000222         022500     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1724.2 IMP
   000223         022600 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1724.2 IMP
   000224         022700 01  REC-CT                        PIC 99       VALUE ZERO.       NC1724.2 IMP
   000225         022800 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1724.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1724.2 IMP
   000227         023000 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1724.2 IMP
   000228         023100 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1724.2 IMP
   000229         023200 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1724.2 IMP
   000230         023300 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1724.2 IMP
   000231         023400 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1724.2 IMP
   000232         023500 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1724.2 IMP
   000233         023600 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1724.2 IMP
   000234         023700 01  CCVS-H-1.                                                    NC1724.2
   000235         023800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1724.2 IMP
   000236         023900     02  FILLER                    PIC X(42)    VALUE             NC1724.2
   000237         024000     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1724.2
   000238         024100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1724.2 IMP
   000239         024200 01  CCVS-H-2A.                                                   NC1724.2
   000240         024300   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1724.2 IMP
   000241         024400   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1724.2
   000242         024500   02  FILLER                        PIC XXXX   VALUE             NC1724.2
   000243         024600     "4.2 ".                                                      NC1724.2
   000244         024700   02  FILLER                        PIC X(28)  VALUE             NC1724.2
   000245         024800            " COPY - NOT FOR DISTRIBUTION".                       NC1724.2
   000246         024900   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1724.2 IMP
   000247         025000                                                                  NC1724.2
   000248         025100 01  CCVS-H-2B.                                                   NC1724.2
   000249         025200   02  FILLER                        PIC X(15)  VALUE             NC1724.2
   000250         025300            "TEST RESULT OF ".                                    NC1724.2
   000251         025400   02  TEST-ID                       PIC X(9).                    NC1724.2
   000252         025500   02  FILLER                        PIC X(4)   VALUE             NC1724.2
   000253         025600            " IN ".                                               NC1724.2
   000254         025700   02  FILLER                        PIC X(12)  VALUE             NC1724.2
   000255         025800     " HIGH       ".                                              NC1724.2
   000256         025900   02  FILLER                        PIC X(22)  VALUE             NC1724.2
   000257         026000            " LEVEL VALIDATION FOR ".                             NC1724.2
   000258         026100   02  FILLER                        PIC X(58)  VALUE             NC1724.2
   000259         026200     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1724.2
   000260         026300 01  CCVS-H-3.                                                    NC1724.2
   000261         026400     02  FILLER                      PIC X(34)  VALUE             NC1724.2
   000262         026500            " FOR OFFICIAL USE ONLY    ".                         NC1724.2
   000263         026600     02  FILLER                      PIC X(58)  VALUE             NC1724.2
   000264         026700     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1724.2
   000265         026800     02  FILLER                      PIC X(28)  VALUE             NC1724.2
   000266         026900            "  COPYRIGHT   1985 ".                                NC1724.2
   000267         027000 01  CCVS-E-1.                                                    NC1724.2
   000268         027100     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1724.2 IMP
   000269         027200     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1724.2
   000270         027300     02 ID-AGAIN                     PIC X(9).                    NC1724.2
   000271         027400     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1724.2 IMP
   000272         027500 01  CCVS-E-2.                                                    NC1724.2
   000273         027600     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1724.2 IMP
   000274         027700     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1724.2 IMP
   000275         027800     02 CCVS-E-2-2.                                               NC1724.2
   000276         027900         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1724.2 IMP
   000277         028000         03 FILLER                   PIC X      VALUE SPACE.      NC1724.2 IMP
   000278         028100         03 ENDER-DESC               PIC X(44)  VALUE             NC1724.2
   000279         028200            "ERRORS ENCOUNTERED".                                 NC1724.2
   000280         028300 01  CCVS-E-3.                                                    NC1724.2
   000281         028400     02  FILLER                      PIC X(22)  VALUE             NC1724.2
   000282         028500            " FOR OFFICIAL USE ONLY".                             NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1724.2 IMP
   000284         028700     02  FILLER                      PIC X(58)  VALUE             NC1724.2
   000285         028800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1724.2
   000286         028900     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1724.2 IMP
   000287         029000     02 FILLER                       PIC X(15)  VALUE             NC1724.2
   000288         029100             " COPYRIGHT 1985".                                   NC1724.2
   000289         029200 01  CCVS-E-4.                                                    NC1724.2
   000290         029300     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1724.2 IMP
   000291         029400     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1724.2
   000292         029500     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1724.2 IMP
   000293         029600     02 FILLER                       PIC X(40)  VALUE             NC1724.2
   000294         029700      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1724.2
   000295         029800 01  XXINFO.                                                      NC1724.2
   000296         029900     02 FILLER                       PIC X(19)  VALUE             NC1724.2
   000297         030000            "*** INFORMATION ***".                                NC1724.2
   000298         030100     02 INFO-TEXT.                                                NC1724.2
   000299         030200       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1724.2 IMP
   000300         030300       04 XXCOMPUTED                 PIC X(20).                   NC1724.2
   000301         030400       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1724.2 IMP
   000302         030500       04 XXCORRECT                  PIC X(20).                   NC1724.2
   000303         030600     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1724.2
   000304         030700 01  HYPHEN-LINE.                                                 NC1724.2
   000305         030800     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1724.2 IMP
   000306         030900     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1724.2
   000307         031000-    "*****************************************".                 NC1724.2
   000308         031100     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1724.2
   000309         031200-    "******************************".                            NC1724.2
   000310         031300 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1724.2
   000311         031400     "NC172A".                                                    NC1724.2
   000312         031500 PROCEDURE DIVISION.                                              NC1724.2
   000313         031600 CCVS1 SECTION.                                                   NC1724.2
   000314         031700 OPEN-FILES.                                                      NC1724.2
   000315         031800     OPEN     OUTPUT PRINT-FILE.                                  NC1724.2 41
   000316         031900     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1724.2 310 251 310 270
   000317         032000     MOVE    SPACE TO TEST-RESULTS.                               NC1724.2 IMP 171
   000318         032100     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1724.2 343 348
   000319         032200     GO TO CCVS1-EXIT.                                            NC1724.2 430
   000320         032300 CLOSE-FILES.                                                     NC1724.2
   000321         032400     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1724.2 352 373 41
   000322         032500 TERMINATE-CCVS.                                                  NC1724.2
   000323         032600     EXIT PROGRAM.                                                NC1724.2
   000324         032700 TERMINATE-CALL.                                                  NC1724.2
   000325         032800     STOP     RUN.                                                NC1724.2
   000326         032900 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1724.2 175 227
   000327         033000 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1724.2 175 228
   000328         033100 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1724.2 175 226
   000329         033200 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1724.2 175 225
   000330         033300     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1724.2 182
   000331         033400 PRINT-DETAIL.                                                    NC1724.2
   000332         033500     IF REC-CT NOT EQUAL TO ZERO                                  NC1724.2 224 IMP
   000333      1  033600             MOVE "." TO PARDOT-X                                 NC1724.2 179
   000334      1  033700             MOVE REC-CT TO DOTVALUE.                             NC1724.2 224 180
   000335         033800     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1724.2 171 42 385
   000336         033900     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1724.2 175 385
   000337      1  034000        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1724.2 406 420
   000338      1  034100          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1724.2 421 429
   000339         034200     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1724.2 IMP 175 IMP 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE SPACE TO CORRECT-X.                                     NC1724.2 IMP 201
   000341         034400     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1724.2 224 IMP IMP 177
   000342         034500     MOVE     SPACE TO RE-MARK.                                   NC1724.2 IMP 182
   000343         034600 HEAD-ROUTINE.                                                    NC1724.2
   000344         034700     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1724.2 234 43 385
   000345         034800     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1724.2 239 43 385
   000346         034900     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1724.2 248 43 385
   000347         035000     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1724.2 260 43 385
   000348         035100 COLUMN-NAMES-ROUTINE.                                            NC1724.2
   000349         035200     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1724.2 212 43 385
   000350         035300     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1724.2 217 43 385
   000351         035400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1724.2 304 43 385
   000352         035500 END-ROUTINE.                                                     NC1724.2
   000353         035600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1724.2 304 43 385
   000354         035700 END-RTN-EXIT.                                                    NC1724.2
   000355         035800     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1724.2 267 43 385
   000356         035900 END-ROUTINE-1.                                                   NC1724.2
   000357         036000      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1724.2 226 230 227
   000358         036100      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1724.2 230 225 230
   000359         036200      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1724.2 228 230
   000360         036300*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1724.2
   000361         036400      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1724.2 228 290
   000362         036500      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1724.2 230 292
   000363         036600      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1724.2 289 275
   000364         036700      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1724.2 272 43 385
   000365         036800  END-ROUTINE-12.                                                 NC1724.2
   000366         036900      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1724.2 278
   000367         037000     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1724.2 226 IMP
   000368      1  037100         MOVE "NO " TO ERROR-TOTAL                                NC1724.2 276
   000369         037200         ELSE                                                     NC1724.2
   000370      1  037300         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1724.2 226 276
   000371         037400     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1724.2 272 43
   000372         037500     PERFORM WRITE-LINE.                                          NC1724.2 385
   000373         037600 END-ROUTINE-13.                                                  NC1724.2
   000374         037700     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1724.2 225 IMP
   000375      1  037800         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1724.2 276
   000376      1  037900         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1724.2 225 276
   000377         038000     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1724.2 278
   000378         038100     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1724.2 272 43 385
   000379         038200      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1724.2 227 IMP
   000380      1  038300          MOVE "NO " TO ERROR-TOTAL                               NC1724.2 276
   000381      1  038400      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1724.2 227 276
   000382         038500      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1724.2 278
   000383         038600      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1724.2 272 43 385
   000384         038700     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1724.2 280 43 385
   000385         038800 WRITE-LINE.                                                      NC1724.2
   000386         038900     ADD 1 TO RECORD-COUNT.                                       NC1724.2 232
   000387         039000     IF RECORD-COUNT GREATER 42                                   NC1724.2 232
   000388      1  039100         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1724.2 43 231
   000389      1  039200         MOVE SPACE TO DUMMY-RECORD                               NC1724.2 IMP 43
   000390      1  039300         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1724.2 43
   000391      1  039400         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1724.2 234 43 401
   000392      1  039500         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1724.2 239 43 401
   000393      1  039600         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1724.2 248 43 401
   000394      1  039700         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1724.2 260 43 401
   000395      1  039800         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1724.2 212 43 401
   000396      1  039900         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1724.2 217 43 401
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040000         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1724.2 304 43 401
   000398      1  040100         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1724.2 231 43
   000399      1  040200         MOVE ZERO TO RECORD-COUNT.                               NC1724.2 IMP 232
   000400         040300     PERFORM WRT-LN.                                              NC1724.2 401
   000401         040400 WRT-LN.                                                          NC1724.2
   000402         040500     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1724.2 43
   000403         040600     MOVE SPACE TO DUMMY-RECORD.                                  NC1724.2 IMP 43
   000404         040700 BLANK-LINE-PRINT.                                                NC1724.2
   000405         040800     PERFORM WRT-LN.                                              NC1724.2 401
   000406         040900 FAIL-ROUTINE.                                                    NC1724.2
   000407         041000     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1724.2 187 IMP
   000408      1  041100            GO TO FAIL-ROUTINE-WRITE.                             NC1724.2 415
   000409         041200     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1724.2 201 IMP 415
   000410         041300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1724.2 233 303
   000411         041400     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1724.2 298
   000412         041500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1724.2 295 43 385
   000413         041600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1724.2 IMP 303
   000414         041700     GO TO  FAIL-ROUTINE-EX.                                      NC1724.2 420
   000415         041800 FAIL-ROUTINE-WRITE.                                              NC1724.2
   000416         041900     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1724.2 183 42 385
   000417         042000     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1724.2 233 211
   000418         042100     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1724.2 198 42 385
   000419         042200     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1724.2 IMP 211
   000420         042300 FAIL-ROUTINE-EX. EXIT.                                           NC1724.2
   000421         042400 BAIL-OUT.                                                        NC1724.2
   000422         042500     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1724.2 188 IMP 424
   000423         042600     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1724.2 202 IMP 429
   000424         042700 BAIL-OUT-WRITE.                                                  NC1724.2
   000425         042800     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1724.2 202 302 188 300
   000426         042900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1724.2 233 303
   000427         043000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1724.2 295 43 385
   000428         043100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1724.2 IMP 303
   000429         043200 BAIL-OUT-EX. EXIT.                                               NC1724.2
   000430         043300 CCVS1-EXIT.                                                      NC1724.2
   000431         043400     EXIT.                                                        NC1724.2
   000432         043500 SECT-NC172A-001 SECTION.                                         NC1724.2
   000433         043600 DIV-INIT-F2-1.                                                   NC1724.2
   000434         043700     MOVE   "DIVIDE INTO GIVING" TO FEATURE.                      NC1724.2 173
   000435         043800     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000436         043900     MOVE      44.1   TO DIV2.                                    NC1724.2 155
   000437         044000     MOVE    ZERO     TO DIV8.                                    NC1724.2 IMP 168
   000438         044100 DIV-TEST-F2-0.                                                   NC1724.2
   000439         044200     DIVIDE  DIV2 INTO 864.36 GIVING DIV8.                        NC1724.2 155 168
   000440         044300 DIV-TEST-F2-1.                                                   NC1724.2
   000441         044400     IF      DIV8 EQUAL TO 19.6                                   NC1724.2 168
   000442      1  044500             PERFORM PASS                                         NC1724.2 327
   000443         044600     ELSE                                                         NC1724.2
   000444      1  044700             GO TO DIV-FAIL-F2-1.                                 NC1724.2 449
   000445         044800     GO TO   DIV-WRITE-F2-1.                                      NC1724.2 453
   000446         044900 DIV-DELETE-F2-1.                                                 NC1724.2
   000447         045000     PERFORM  DE-LETE.                                            NC1724.2 329
   000448         045100     GO TO    DIV-WRITE-F2-1.                                     NC1724.2 453
   000449         045200 DIV-FAIL-F2-1.                                                   NC1724.2
   000450         045300     PERFORM  FAIL.                                               NC1724.2 328
   000451         045400     MOVE     DIV8 TO COMPUTED-N.                                 NC1724.2 168 189
   000452         045500     MOVE     +19.6 TO CORRECT-N.                                 NC1724.2 203
   000453         045600 DIV-WRITE-F2-1.                                                  NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE "DIV-TEST-F2-1 " TO PAR-NAME.                           NC1724.2 177
   000455         045800     PERFORM  PRINT-DETAIL.                                       NC1724.2 331
   000456         045900 DIV-INIT-F2-2.                                                   NC1724.2
   000457         046000     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000458         046100     MOVE    1620.36  TO DIV1.                                    NC1724.2 153
   000459         046200     MOVE    ZERO     TO DIV9.                                    NC1724.2 IMP 169
   000460         046300 DIV-TEST-F2-2-0.                                                 NC1724.2
   000461         046400     DIVIDE   0.533 INTO DIV1 GIVING DIV9 ROUNDED.                NC1724.2 153 169
   000462         046500 DIV-TEST-F2-2-1.                                                 NC1724.2
   000463         046600     IF       DIV9 EQUAL TO " 3,040.1"                            NC1724.2 169
   000464      1  046700              PERFORM PASS                                        NC1724.2 327
   000465         046800              ELSE                                                NC1724.2
   000466      1  046900              GO TO DIV-FAIL-F2-2.                                NC1724.2 471
   000467         047000     GO TO    DIV-WRITE-F2-2.                                     NC1724.2 475
   000468         047100 DIV-DELETE-F2-2.                                                 NC1724.2
   000469         047200     PERFORM  DE-LETE.                                            NC1724.2 329
   000470         047300     GO TO    DIV-WRITE-F2-2.                                     NC1724.2 475
   000471         047400 DIV-FAIL-F2-2.                                                   NC1724.2
   000472         047500     PERFORM  FAIL.                                               NC1724.2 328
   000473         047600     MOVE     DIV9 TO COMPUTED-A.                                 NC1724.2 169 188
   000474         047700     MOVE " 3,040.1" TO CORRECT-A.                                NC1724.2 202
   000475         047800 DIV-WRITE-F2-2.                                                  NC1724.2
   000476         047900     MOVE "DIV-TEST-F2-2" TO PAR-NAME.                            NC1724.2 177
   000477         048000     PERFORM  PRINT-DETAIL.                                       NC1724.2 331
   000478         048100 DIV-INIT-F2-3.                                                   NC1724.2
   000479         048200     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000480         048300     MOVE   -9.642    TO DIV4.                                    NC1724.2 159
   000481         048400     MOVE   44.1      TO DIV2.                                    NC1724.2 155
   000482         048500     MOVE    ZERO     TO DIV10.                                   NC1724.2 IMP 170
   000483         048600     MOVE   "A"       TO XRAY.                                    NC1724.2 86
   000484         048700 DIV-TEST-F2-3-0.                                                 NC1724.2
   000485         048800     DIVIDE   DIV4 INTO DIV2 GIVING DIV10 ON SIZE ERROR           NC1724.2 159 155 170
   000486      1  048900              MOVE "P" TO XRAY.                                   NC1724.2 86
   000487         049000 DIV-TEST-F2-3-1.                                                 NC1724.2
   000488         049100     IF       XRAY EQUAL TO "P"                                   NC1724.2 86
   000489      1  049200              PERFORM PASS                                        NC1724.2 327
   000490         049300              ELSE                                                NC1724.2
   000491      1  049400              GO TO DIV-FAIL-F2-3-1.                              NC1724.2 496
   000492         049500     GO TO    DIV-WRITE-F2-3-1.                                   NC1724.2 501
   000493         049600 DIV-DELETE-F2-3-1.                                               NC1724.2
   000494         049700     PERFORM DE-LETE.                                             NC1724.2 329
   000495         049800     GO TO   DIV-WRITE-F2-3-1.                                    NC1724.2 501
   000496         049900 DIV-FAIL-F2-3-1.                                                 NC1724.2
   000497         050000     MOVE    XRAY  TO COMPUTED-X.                                 NC1724.2 86 187
   000498         050100     MOVE   "A"    TO CORRECT-X.                                  NC1724.2 201
   000499         050200     MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.              NC1724.2 182
   000500         050300     PERFORM FAIL.                                                NC1724.2 328
   000501         050400 DIV-WRITE-F2-3-1.                                                NC1724.2
   000502         050500     MOVE "DIV-TEST-F2-3-1" TO PAR-NAME.                          NC1724.2 177
   000503         050600     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000504         050700 DIV-TEST-F2-3-2.                                                 NC1724.2
   000505         050800     IF      DIV10 NOT EQUAL TO ZERO                              NC1724.2 170 IMP
   000506      1  050900             GO TO DIV-FAIL-F2-3-2.                               NC1724.2 512
   000507         051000     PERFORM PASS.                                                NC1724.2 327
   000508         051100     GO TO   DIV-WRITE-F2-3-2.                                    NC1724.2 517
   000509         051200 DIV-DELETE-F2-3-2.                                               NC1724.2
   000510         051300     PERFORM DE-LETE.                                             NC1724.2 329
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     GO TO   DIV-WRITE-F2-3-2.                                    NC1724.2 517
   000512         051500 DIV-FAIL-F2-3-2.                                                 NC1724.2
   000513         051600     PERFORM FAIL.                                                NC1724.2 328
   000514         051700     MOVE    DIV10 TO COMPUTED-N.                                 NC1724.2 170 189
   000515         051800     MOVE    ZERO TO CORRECT-N.                                   NC1724.2 IMP 203
   000516         051900     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1724.2 182
   000517         052000 DIV-WRITE-F2-3-2.                                                NC1724.2
   000518         052100     MOVE "DIV-TEST-F2-3-2" TO PAR-NAME.                          NC1724.2 177
   000519         052200     PERFORM  PRINT-DETAIL.                                       NC1724.2 331
   000520         052300 DIV-INIT-F2-4.                                                   NC1724.2
   000521         052400     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000522         052500     MOVE    ZERO TO DIV8.                                        NC1724.2 IMP 168
   000523         052600     MOVE   "B" TO XRAY.                                          NC1724.2 86
   000524         052700 DIV-TEST-F2-4-0.                                                 NC1724.2
   000525         052800     DIVIDE  1.0051 INTO 100.50 GIVING DIV8 ROUNDED               NC1724.2 168
   000526         052900          ON SIZE ERROR                                           NC1724.2
   000527      1  053000              MOVE "Q" TO XRAY.                                   NC1724.2 86
   000528         053100 DIV-TEST-F2-4-1.                                                 NC1724.2
   000529         053200     IF       XRAY EQUAL TO "Q"                                   NC1724.2 86
   000530      1  053300              PERFORM PASS                                        NC1724.2 327
   000531         053400              ELSE                                                NC1724.2
   000532      1  053500              GO TO DIV-FAIL-F2-4-1.                              NC1724.2 537
   000533         053600     GO TO    DIV-WRITE-F2-4-1.                                   NC1724.2 542
   000534         053700 DIV-DELETE-F2-4-1.                                               NC1724.2
   000535         053800     PERFORM  DE-LETE.                                            NC1724.2 329
   000536         053900     GO TO    DIV-WRITE-F2-4-1.                                   NC1724.2 542
   000537         054000 DIV-FAIL-F2-4-1.                                                 NC1724.2
   000538         054100     MOVE    XRAY TO COMPUTED-X.                                  NC1724.2 86 187
   000539         054200     MOVE   "B"   TO COMPUTED-X.                                  NC1724.2 187
   000540         054300     MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.              NC1724.2 182
   000541         054400     PERFORM FAIL.                                                NC1724.2 328
   000542         054500 DIV-WRITE-F2-4-1.                                                NC1724.2
   000543         054600     MOVE "DIV-TEST-F2-4-1" TO PAR-NAME.                          NC1724.2 177
   000544         054700     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000545         054800 DIV-TEST-F2-4-2.                                                 NC1724.2
   000546         054900     IF      DIV8 NOT EQUAL TO ZERO                               NC1724.2 168 IMP
   000547      1  055000             GO TO DIV-FAIL-F2-4-2.                               NC1724.2 553
   000548         055100     PERFORM PASS.                                                NC1724.2 327
   000549         055200     GO TO   DIV-WRITE-F2-4-2.                                    NC1724.2 558
   000550         055300 DIV-DELETE-F2-4-2.                                               NC1724.2
   000551         055400     PERFORM DE-LETE.                                             NC1724.2 329
   000552         055500     GO TO   DIV-WRITE-F2-4-2.                                    NC1724.2 558
   000553         055600 DIV-FAIL-F2-4-2.                                                 NC1724.2
   000554         055700     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1724.2 182
   000555         055800     PERFORM FAIL.                                                NC1724.2 328
   000556         055900     MOVE    DIV8 TO COMPUTED-N.                                  NC1724.2 168 189
   000557         056000     MOVE     000 TO CORRECT-N.                                   NC1724.2 203
   000558         056100 DIV-WRITE-F2-4-2.                                                NC1724.2
   000559         056200     MOVE   "DIV-TEST-F2-4-2" TO PAR-NAME.                        NC1724.2 177
   000560         056300     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000561         056400 DIV-INIT-F2-5.                                                   NC1724.2
   000562         056500     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000563         056600     MOVE    ZERO TO WRK-DS-01V00.                                NC1724.2 IMP 77
   000564         056700 DIV-TEST-F2-5-0.                                                 NC1724.2
   000565         056800     DIVIDE -10.9 INTO A02TWOS-DU-02V00 GIVING WRK-DS-01V00.      NC1724.2 81 77
   000566         056900 DIV-TEST-F2-5-1.                                                 NC1724.2
   000567         057000     IF      WRK-DS-01V00 EQUAL TO -2                             NC1724.2 77
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057100             PERFORM PASS                                         NC1724.2 327
   000569      1  057200             GO TO DIV-WRITE-F2-5.                                NC1724.2 578
   000570         057300     GO TO   DIV-FAIL-F2-5.                                       NC1724.2 574
   000571         057400 DIV-DELETE-F2-5.                                                 NC1724.2
   000572         057500     PERFORM DE-LETE.                                             NC1724.2 329
   000573         057600     GO TO   DIV-WRITE-F2-5.                                      NC1724.2 578
   000574         057700 DIV-FAIL-F2-5.                                                   NC1724.2
   000575         057800     MOVE  -2                 TO CORRECT-N.                       NC1724.2 203
   000576         057900     MOVE  WRK-DS-01V00       TO COMPUTED-N.                      NC1724.2 77 189
   000577         058000     PERFORM FAIL.                                                NC1724.2 328
   000578         058100 DIV-WRITE-F2-5.                                                  NC1724.2
   000579         058200     MOVE "DIV-TEST-F2-5         " TO PAR-NAME.                   NC1724.2 177
   000580         058300     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000581         058400 DIV-INIT-F2-6.                                                   NC1724.2
   000582         058500     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000583         058600     MOVE 0.0000000001 TO WRK-DS-03V10.                           NC1724.2 78
   000584         058700     MOVE ZERO TO WRK-DS-18V00.                                   NC1724.2 IMP 45
   000585         058800 DIV-TEST-F2-6-0.                                                 NC1724.2
   000586         058900     DIVIDE WRK-DS-03V10 INTO A01ONE-DS-P0801                     NC1724.2 78 63
   000587         059000         GIVING WRK-DS-18V00 ROUNDED.                             NC1724.2 45
   000588         059100 DIV-TEST-F2-6-1.                                                 NC1724.2
   000589         059200     IF WRK-DS-18V00 EQUAL TO 000000000000000010                  NC1724.2 45
   000590      1  059300         PERFORM PASS                                             NC1724.2 327
   000591      1  059400         GO TO DIV-WRITE-F2-6.                                    NC1724.2 600
   000592         059500     GO TO DIV-FAIL-F2-6.                                         NC1724.2 596
   000593         059600 DIV-DELETE-F2-6.                                                 NC1724.2
   000594         059700     PERFORM DE-LETE.                                             NC1724.2 329
   000595         059800     GO TO DIV-WRITE-F2-6.                                        NC1724.2 600
   000596         059900 DIV-FAIL-F2-6.                                                   NC1724.2
   000597         060000     MOVE  000000000000000010 TO CORRECT-18V0.                    NC1724.2 208
   000598         060100     MOVE  WRK-DS-18V00       TO COMPUTED-18V0.                   NC1724.2 45 195
   000599         060200     PERFORM FAIL.                                                NC1724.2 328
   000600         060300 DIV-WRITE-F2-6.                                                  NC1724.2
   000601         060400     MOVE "DIV-TEST-F2-6         " TO PAR-NAME.                   NC1724.2 177
   000602         060500     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000603         060600 DIV-INIT-F2-7.                                                   NC1724.2
   000604         060700     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000605         060800     MOVE ZERO TO WRK-DS-18V00  AZERO-DS-05V05.                   NC1724.2 IMP 45 57
   000606         060900     MOVE "0" TO WRK-XN-00001.                                    NC1724.2 51
   000607         061000     MOVE  99 TO A99-DS-02V00.                                    NC1724.2 75
   000608         061100 DIV-TEST-F2-7-0.                                                 NC1724.2
   000609         061200     DIVIDE AZERO-DS-05V05 INTO A99-DS-02V00                      NC1724.2 57 75
   000610         061300         GIVING WRK-DS-18V00 ON SIZE ERROR                        NC1724.2 45
   000611      1  061400         MOVE "1" TO WRK-XN-00001.                                NC1724.2 51
   000612         061500 DIV-TEST-F2-7-1.                                                 NC1724.2
   000613         061600     IF WRK-DS-18V00 EQUAL TO 000000000000000000                  NC1724.2 45
   000614      1  061700         PERFORM PASS                                             NC1724.2 327
   000615      1  061800         GO TO DIV-WRITE-F2-7-1.                                  NC1724.2 625
   000616         061900     GO TO DIV-FAIL-F2-7-1.                                       NC1724.2 620
   000617         062000 DIV-DELETE-F2-7-1.                                               NC1724.2
   000618         062100     PERFORM DE-LETE.                                             NC1724.2 329
   000619         062200     GO TO DIV-WRITE-F2-7-1.                                      NC1724.2 625
   000620         062300 DIV-FAIL-F2-7-1.                                                 NC1724.2
   000621         062400     MOVE  000000000000000000 TO CORRECT-18V0.                    NC1724.2 208
   000622         062500     MOVE  WRK-DS-18V00       TO COMPUTED-18V0.                   NC1724.2 45 195
   000623         062600     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1724.2 182
   000624         062700     PERFORM FAIL.                                                NC1724.2 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 DIV-WRITE-F2-7-1.                                                NC1724.2
   000626         062900     MOVE "DIV-TEST-F2-7-1         " TO PAR-NAME.                 NC1724.2 177
   000627         063000     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000628         063100 DIV-TEST-F2-7-2.                                                 NC1724.2
   000629         063200     IF WRK-XN-00001 EQUAL TO "1"                                 NC1724.2 51
   000630      1  063300         PERFORM PASS                                             NC1724.2 327
   000631      1  063400         GO TO DIV-WRITE-F2-7-2.                                  NC1724.2 639
   000632         063500     MOVE "1" TO CORRECT-A.                                       NC1724.2 202
   000633         063600     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1724.2 51 188
   000634         063700     MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.              NC1724.2 182
   000635         063800     PERFORM FAIL.                                                NC1724.2 328
   000636         063900     GO TO DIV-WRITE-F2-7-2.                                      NC1724.2 639
   000637         064000 DIV-DELETE-F2-7-2.                                               NC1724.2
   000638         064100     PERFORM DE-LETE.                                             NC1724.2 329
   000639         064200 DIV-WRITE-F2-7-2.                                                NC1724.2
   000640         064300     MOVE "DIV-TEST-F2-7-2         " TO PAR-NAME.                 NC1724.2 177
   000641         064400     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000642         064500 DIV-INIT-F2-8.                                                   NC1724.2
   000643         064600     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000644         064700     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1724.2 79 58
   000645         064800     MOVE   "1" TO WRK-XN-00001.                                  NC1724.2 51
   000646         064900 DIV-TEST-F2-8-0.                                                 NC1724.2
   000647         065000     DIVIDE  A18ONES-DS-09V09 INTO WRK-DS-09V09 GIVING            NC1724.2 79 58
   000648      1  065100         WRK-DS-09V09 ON SIZE ERROR MOVE "0" TO WRK-XN-00001.     NC1724.2 58 51
   000649         065200 DIV-TEST-F2-8-1.                                                 NC1724.2
   000650         065300     IF WRK-DS-18V00-S EQUAL TO 000000001000000000                NC1724.2 59
   000651      1  065400         PERFORM PASS                                             NC1724.2 327
   000652      1  065500         GO TO DIV-WRITE-F2-8-1.                                  NC1724.2 661
   000653         065600     GO TO DIV-FAIL-F2-8-1.                                       NC1724.2 657
   000654         065700 DIV-DELETE-F2-8-1.                                               NC1724.2
   000655         065800     PERFORM DE-LETE.                                             NC1724.2 329
   000656         065900     GO TO DIV-WRITE-F2-8-1.                                      NC1724.2 661
   000657         066000 DIV-FAIL-F2-8-1.                                                 NC1724.2
   000658         066100     MOVE  000000001000000000 TO CORRECT-18V0.                    NC1724.2 208
   000659         066200     MOVE WRK-DS-18V00-S TO COMPUTED-18V0.                        NC1724.2 59 195
   000660         066300     PERFORM FAIL.                                                NC1724.2 328
   000661         066400 DIV-WRITE-F2-8-1.                                                NC1724.2
   000662         066500     MOVE "DIV-TEST-F2-8-1         " TO PAR-NAME.                 NC1724.2 177
   000663         066600     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000664         066700 DIV-TEST-F2-8-2.                                                 NC1724.2
   000665         066800     IF WRK-XN-00001 EQUAL TO "0"                                 NC1724.2 51
   000666      1  066900         MOVE "0" TO COMPUTED-A                                   NC1724.2 188
   000667      1  067000         MOVE "1" TO CORRECT-A                                    NC1724.2 202
   000668      1  067100         MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK   NC1724.2 182
   000669      1  067200         PERFORM FAIL                                             NC1724.2 328
   000670      1  067300         GO TO DIV-WRITE-F2-8-2.                                  NC1724.2 675
   000671         067400     PERFORM PASS.                                                NC1724.2 327
   000672         067500     GO TO DIV-WRITE-F2-8-2.                                      NC1724.2 675
   000673         067600 DIV-DELETE-F2-8-2.                                               NC1724.2
   000674         067700     PERFORM DE-LETE.                                             NC1724.2 329
   000675         067800 DIV-WRITE-F2-8-2.                                                NC1724.2
   000676         067900     MOVE "DIV-TEST-F2-8-2         " TO PAR-NAME.                 NC1724.2 177
   000677         068000     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000678         068100 DIV-INIT-F2-9.                                                   NC1724.2
   000679         068200     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000680         068300     MOVE ZERO TO WRK-DS-0201P.                                   NC1724.2 IMP 68
   000681         068400     MOVE -0.005 TO WRK-DS-09V09.                                 NC1724.2 58
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     MOVE "0" TO WRK-XN-00001.                                    NC1724.2 51
   000683         068600 DIV-TEST-F2-9-0.                                                 NC1724.2
   000684         068700     DIVIDE WRK-DS-09V09 INTO A05ONES-DS-00V05 GIVING             NC1724.2 58 60
   000685         068800         WRK-DS-0201P ROUNDED ON SIZE ERROR                       NC1724.2 68
   000686      1  068900         MOVE "1" TO WRK-XN-00001.                                NC1724.2 51
   000687         069000 DIV-TEST-F2-9-1.                                                 NC1724.2
   000688         069100     MOVE WRK-DS-0201P TO WRK-DS-05V00.                           NC1724.2 68 82
   000689         069200     IF WRK-DS-05V00 EQUAL TO  -00020                             NC1724.2 82
   000690      1  069300         PERFORM PASS                                             NC1724.2 327
   000691      1  069400         GO TO DIV-WRITE-F2-9-1.                                  NC1724.2 700
   000692         069500     GO TO DIV-FAIL-F2-9-1.                                       NC1724.2 696
   000693         069600 DIV-DELETE-F2-9-1.                                               NC1724.2
   000694         069700     PERFORM DE-LETE.                                             NC1724.2 329
   000695         069800     GO TO DIV-WRITE-F2-9-1.                                      NC1724.2 700
   000696         069900 DIV-FAIL-F2-9-1.                                                 NC1724.2
   000697         070000     MOVE -00020 TO CORRECT-N.                                    NC1724.2 203
   000698         070100     MOVE WRK-DS-05V00 TO COMPUTED-N.                             NC1724.2 82 189
   000699         070200     PERFORM FAIL.                                                NC1724.2 328
   000700         070300 DIV-WRITE-F2-9-1.                                                NC1724.2
   000701         070400     MOVE "DIV-TEST-F2-9-1         " TO PAR-NAME.                 NC1724.2 177
   000702         070500     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000703         070600 DIV-TEST-F2-9-2.                                                 NC1724.2
   000704         070700     IF WRK-XN-00001 EQUAL TO "0"                                 NC1724.2 51
   000705      1  070800         PERFORM PASS                                             NC1724.2 327
   000706      1  070900         GO TO DIV-WRITE-F2-9-2.                                  NC1724.2 714
   000707         071000     MOVE "0" TO CORRECT-A.                                       NC1724.2 202
   000708         071100     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1724.2 51 188
   000709         071200     MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.    NC1724.2 182
   000710         071300     PERFORM FAIL.                                                NC1724.2 328
   000711         071400     GO TO DIV-WRITE-F2-9-2.                                      NC1724.2 714
   000712         071500 DIV-DELETE-F2-9-2.                                               NC1724.2
   000713         071600     PERFORM DE-LETE.                                             NC1724.2 329
   000714         071700 DIV-WRITE-F2-9-2.                                                NC1724.2
   000715         071800     MOVE "DIV-TEST-F2-9-2         " TO PAR-NAME.                 NC1724.2 177
   000716         071900     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000717         072000 DIV-INIT-F2-10.                                                  NC1724.2
   000718         072100     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000719         072200     MOVE "1" TO WRK-XN-00001.                                    NC1724.2 51
   000720         072300     MOVE ZERO TO WRK-DS-01V00.                                   NC1724.2 IMP 77
   000721         072400 DIV-TEST-F2-10-1.                                                NC1724.2
   000722         072500     DIVIDE A02TWOS-DU-02V00 INTO A02TWOS-DS-03V02  GIVING        NC1724.2 81 83
   000723         072600         WRK-DS-01V00 ROUNDED ON SIZE ERROR                       NC1724.2 77
   000724      1  072700         MOVE "0" TO WRK-XN-00001.                                NC1724.2 51
   000725         072800     IF WRK-DS-01V00 EQUAL TO +1                                  NC1724.2 77
   000726      1  072900         PERFORM PASS                                             NC1724.2 327
   000727      1  073000         GO TO DIV-WRITE-F2-10-1.                                 NC1724.2 736
   000728         073100     GO TO DIV-FAIL-F2-10-1.                                      NC1724.2 732
   000729         073200 DIV-DELETE-F2-10-1.                                              NC1724.2
   000730         073300     PERFORM DE-LETE.                                             NC1724.2 329
   000731         073400     GO TO DIV-WRITE-F2-10-1.                                     NC1724.2 736
   000732         073500 DIV-FAIL-F2-10-1.                                                NC1724.2
   000733         073600     MOVE  +1                 TO CORRECT-N.                       NC1724.2 203
   000734         073700     MOVE  WRK-DS-01V00       TO COMPUTED-N.                      NC1724.2 77 189
   000735         073800     PERFORM FAIL.                                                NC1724.2 328
   000736         073900 DIV-WRITE-F2-10-1.                                               NC1724.2
   000737         074000     MOVE "DIV-TEST-F2-10-1         " TO PAR-NAME.                NC1724.2 177
   000738         074100     PERFORM PRINT-DETAIL.                                        NC1724.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 DIV-TEST-F2-10-2.                                                NC1724.2
   000740         074300     IF WRK-XN-00001 EQUAL TO "1"                                 NC1724.2 51
   000741      1  074400         PERFORM PASS                                             NC1724.2 327
   000742      1  074500         GO TO DIV-WRITE-F2-10-2.                                 NC1724.2 750
   000743         074600     MOVE "1" TO CORRECT-A.                                       NC1724.2 202
   000744         074700     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1724.2 51 188
   000745         074800     MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.    NC1724.2 182
   000746         074900     PERFORM FAIL.                                                NC1724.2 328
   000747         075000     GO TO DIV-WRITE-F2-10-2.                                     NC1724.2 750
   000748         075100 DIV-DELETE-F2-10-2.                                              NC1724.2
   000749         075200     PERFORM DE-LETE.                                             NC1724.2 329
   000750         075300 DIV-WRITE-F2-10-2.                                               NC1724.2
   000751         075400     MOVE "DIV-TEST-F2-10-2         " TO PAR-NAME.                NC1724.2 177
   000752         075500     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000753         075600 DIV-INIT-F2-11.                                                  NC1724.2
   000754         075700     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000755         075800     MOVE     0 TO WRK-DS-05V00.                                  NC1724.2 82
   000756         075900 DIV-TEST-F2-11.                                                  NC1724.2
   000757         076000     DIVIDE A01ONE-CS-00V01 INTO A99-CS-02V00 GIVING              NC1724.2 73 71
   000758         076100         WRK-DS-05V00.                                            NC1724.2 82
   000759         076200     IF WRK-DS-05V00 EQUAL TO 00990                               NC1724.2 82
   000760      1  076300        PERFORM PASS                                              NC1724.2 327
   000761      1  076400         GO TO DIV-WRITE-F2-11.                                   NC1724.2 770
   000762         076500     GO TO DIV-FAIL-F2-11.                                        NC1724.2 766
   000763         076600 DIV-DELETE-F2-11.                                                NC1724.2
   000764         076700     PERFORM DE-LETE.                                             NC1724.2 329
   000765         076800     GO TO DIV-WRITE-F2-11.                                       NC1724.2 770
   000766         076900 DIV-FAIL-F2-11.                                                  NC1724.2
   000767         077000     MOVE  00990              TO CORRECT-N.                       NC1724.2 203
   000768         077100     MOVE  WRK-DS-05V00       TO COMPUTED-N.                      NC1724.2 82 189
   000769         077200     PERFORM FAIL.                                                NC1724.2 328
   000770         077300 DIV-WRITE-F2-11.                                                 NC1724.2
   000771         077400     MOVE "DIVIDE INTO GIVING  " TO FEATURE.                      NC1724.2 173
   000772         077500     MOVE "DIV-TEST-F2-11         " TO PAR-NAME.                  NC1724.2 177
   000773         077600     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000774         077700 DIV-INIT-F2-12.                                                  NC1724.2
   000775         077800     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000776         077900     MOVE  ZERO TO WRK-CS-18V00.                                  NC1724.2 IMP 69
   000777         078000 DIV-TEST-F2-12-0.                                                NC1724.2
   000778         078100     DIVIDE A02THREES-CS-18V00 INTO A18SIXES-CU-18V00 GIVING      NC1724.2 134 136
   000779         078200             WRK-CS-18V00.                                        NC1724.2 69
   000780         078300 DIV-TEST-F2-12-1.                                                NC1724.2
   000781         078400     IF WRK-CS-18V00 EQUAL TO -020202020202020202                 NC1724.2 69
   000782      1  078500         PERFORM PASS                                             NC1724.2 327
   000783      1  078600         GO TO DIV-WRITE-F2-12.                                   NC1724.2 790
   000784         078700     MOVE -020202020202020202 TO CORRECT-18V0.                    NC1724.2 208
   000785         078800     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1724.2 69 195
   000786         078900     PERFORM FAIL.                                                NC1724.2 328
   000787         079000     GO TO DIV-WRITE-F2-12.                                       NC1724.2 790
   000788         079100 DIV-DELETE-F2-12.                                                NC1724.2
   000789         079200     PERFORM DE-LETE.                                             NC1724.2 329
   000790         079300 DIV-WRITE-F2-12.                                                 NC1724.2
   000791         079400     MOVE "DIV-TEST-F2-12 " TO PAR-NAME.                          NC1724.2 177
   000792         079500     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000793         079600 DIV-INIT-F2-13.                                                  NC1724.2
   000794         079700     MOVE   "V1-81 6.11.4 GR2"   TO ANSI-REFERENCE.               NC1724.2 233
   000795         079800     MOVE ZERO TO WRK-CS-18V00.                                   NC1724.2 IMP 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900 DIV-TEST-F2-13.                                                  NC1724.2
   000797         080000     DIVIDE A02THREES-CS-18V00 INTO A02THREES-CS-18V00            NC1724.2 134 134
   000798         080100             GIVING WRK-CS-18V00.                                 NC1724.2 69
   000799         080200     IF WRK-CS-18V00 EQUAL TO 000000000000000001                  NC1724.2 69
   000800      1  080300         PERFORM PASS                                             NC1724.2 327
   000801      1  080400         GO TO DIV-WRITE-F2-13.                                   NC1724.2 808
   000802         080500     MOVE 000000000000000001 TO CORRECT-18V0.                     NC1724.2 208
   000803         080600     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1724.2 69 195
   000804         080700     PERFORM FAIL.                                                NC1724.2 328
   000805         080800     GO TO DIV-WRITE-F2-13.                                       NC1724.2 808
   000806         080900 DIV-DELETE-F2-13.                                                NC1724.2
   000807         081000     PERFORM DE-LETE.                                             NC1724.2 329
   000808         081100 DIV-WRITE-F2-13.                                                 NC1724.2
   000809         081200     MOVE "DIV-TEST-F2-13 " TO PAR-NAME.                          NC1724.2 177
   000810         081300     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000811         081400*                                                                 NC1724.2
   000812         081500*                                                                 NC1724.2
   000813         081600 DIV-INIT-F2-14.                                                  NC1724.2
   000814         081700*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   000815         081800*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1724.2
   000816         081900     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1724.2 233
   000817         082000     MOVE   "DIV-TEST-F2-14-1" TO PAR-NAME.                       NC1724.2 177
   000818         082100     MOVE   "P"     TO XRAY.                                      NC1724.2 86
   000819         082200     MOVE    0      TO DIV10.                                     NC1724.2 170
   000820         082300     MOVE    1      TO REC-CT.                                    NC1724.2 224
   000821         082400     MOVE    44.1   TO DIV2.                                      NC1724.2 155
   000822         082500     MOVE   -9.642  TO DIV4.                                      NC1724.2 159
   000823         082600 DIV-TEST-F2-14-0.                                                NC1724.2
   000824         082700     DIVIDE  DIV4 INTO DIV2                                       NC1724.2 159 155
   000825         082800      GIVING DIV10                                                NC1724.2 170
   000826         082900      NOT ON SIZE ERROR                                           NC1724.2
   000827      1  083000             MOVE   "N" TO XRAY.                                  NC1724.2 86
   000828         083100     GO TO   DIV-TEST-F2-14-1.                                    NC1724.2 833
   000829         083200 DIV-DELETE-F2-14-1.                                              NC1724.2
   000830         083300     PERFORM DE-LETE.                                             NC1724.2 329
   000831         083400     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000832         083500     GO TO   DIV-INIT-F2-15.                                      NC1724.2 858
   000833         083600 DIV-TEST-F2-14-1.                                                NC1724.2
   000834         083700     MOVE   "DIV-TEST-F2-14-1" TO PAR-NAME.                       NC1724.2 177
   000835         083800     IF      DIV10 NOT = 0                                        NC1724.2 170
   000836      1  083900             MOVE    DIV10 TO COMPUTED-N                          NC1724.2 170 189
   000837      1  084000             MOVE    0 TO CORRECT-N                               NC1724.2 203
   000838      1  084100             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   000839      1  084200             PERFORM FAIL                                         NC1724.2 328
   000840      1  084300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   000841         084400     ELSE                                                         NC1724.2
   000842      1  084500             PERFORM PASS                                         NC1724.2 327
   000843      1  084600             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000844         084700     ADD     1 TO REC-CT.                                         NC1724.2 224
   000845         084800 DIV-TEST-F2-14-2.                                                NC1724.2
   000846         084900     MOVE   "DIV-TEST-F2-14-2" TO PAR-NAME.                       NC1724.2 177
   000847         085000     IF      XRAY  NOT = "P"                                      NC1724.2 86
   000848      1  085100             MOVE    XRAY  TO COMPUTED-X                          NC1724.2 86 187
   000849      1  085200             MOVE   "P"    TO CORRECT-X                           NC1724.2 201
   000850      1  085300             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   000851      1  085400             PERFORM FAIL                                         NC1724.2 328
   000852      1  085500             PERFORM PRINT-DETAIL                                 NC1724.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     ELSE                                                         NC1724.2
   000854      1  085700             PERFORM PASS                                         NC1724.2 327
   000855      1  085800             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000856         085900*                                                                 NC1724.2
   000857         086000*                                                                 NC1724.2
   000858         086100 DIV-INIT-F2-15.                                                  NC1724.2
   000859         086200*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   000860         086300*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1724.2
   000861         086400     MOVE   "DIV-TEST-F2-15-1" TO PAR-NAME.                       NC1724.2 177
   000862         086500     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1724.2 233
   000863         086600     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1724.2 79 58
   000864         086700     MOVE    1  TO REC-CT.                                        NC1724.2 224
   000865         086800     MOVE   "1" TO WRK-XN-00001.                                  NC1724.2 51
   000866         086900 DIV-TEST-F2-15-0.                                                NC1724.2
   000867         087000     DIVIDE  A18ONES-DS-09V09 INTO WRK-DS-09V09                   NC1724.2 79 58
   000868         087100      GIVING WRK-DS-09V09                                         NC1724.2 58
   000869         087200      NOT ON SIZE ERROR                                           NC1724.2
   000870      1  087300             MOVE   "0" TO WRK-XN-00001.                          NC1724.2 51
   000871         087400     GO TO   DIV-TEST-F2-15-1.                                    NC1724.2 876
   000872         087500 DIV-DELETE-F2-15-1.                                              NC1724.2
   000873         087600     PERFORM DE-LETE.                                             NC1724.2 329
   000874         087700     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000875         087800     GO TO   DIV-INIT-F2-16.                                      NC1724.2 903
   000876         087900 DIV-TEST-F2-15-1.                                                NC1724.2
   000877         088000     MOVE   "DIV-TEST-F2-15-1 " TO PAR-NAME.                      NC1724.2 177
   000878         088100     IF      WRK-DS-18V00-S NOT = 000000001000000000              NC1724.2 59
   000879      1  088200             MOVE    000000001000000000 TO CORRECT-18V0           NC1724.2 208
   000880      1  088300             MOVE    WRK-DS-18V00-S     TO COMPUTED-18V0          NC1724.2 59 195
   000881      1  088400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1724.2
   000882      1  088500                  TO RE-MARK                                      NC1724.2 182
   000883      1  088600             PERFORM FAIL                                         NC1724.2 328
   000884      1  088700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   000885         088800     ELSE                                                         NC1724.2
   000886      1  088900             PERFORM PASS                                         NC1724.2 327
   000887      1  089000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000888         089100     ADD     1 TO REC-CT.                                         NC1724.2 224
   000889         089200 DIV-TEST-F2-15-2.                                                NC1724.2
   000890         089300     MOVE   "DIV-TEST-F2-15-2" TO PAR-NAME.                       NC1724.2 177
   000891         089400     IF      WRK-XN-00001 NOT = "0"                               NC1724.2 51
   000892      1  089500             MOVE   "0"           TO CORRECT-X                    NC1724.2 201
   000893      1  089600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   000894      1  089700             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   000895      1  089800                  TO RE-MARK                                      NC1724.2 182
   000896      1  089900             PERFORM FAIL                                         NC1724.2 328
   000897      1  090000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   000898         090100     ELSE                                                         NC1724.2
   000899      1  090200             PERFORM PASS                                         NC1724.2 327
   000900      1  090300             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000901         090400*                                                                 NC1724.2
   000902         090500*                                                                 NC1724.2
   000903         090600 DIV-INIT-F2-16.                                                  NC1724.2
   000904         090700*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   000905         090800*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1724.2
   000906         090900     MOVE   "DIV-TEST-F2-16-1" TO PAR-NAME.                       NC1724.2 177
   000907         091000     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1724.2 233
   000908         091100     MOVE   "P"     TO XRAY.                                      NC1724.2 86
   000909         091200     MOVE    0      TO DIV10.                                     NC1724.2 170
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     MOVE    1      TO REC-CT.                                    NC1724.2 224
   000911         091400     MOVE    44.1   TO DIV2.                                      NC1724.2 155
   000912         091500     MOVE   -9.642  TO DIV4.                                      NC1724.2 159
   000913         091600 DIV-TEST-F2-16-0.                                                NC1724.2
   000914         091700     DIVIDE  DIV4 INTO DIV2                                       NC1724.2 159 155
   000915         091800      GIVING DIV10                                                NC1724.2 170
   000916         091900          ON SIZE ERROR                                           NC1724.2
   000917      1  092000             MOVE   "E" TO XRAY                                   NC1724.2 86
   000918         092100      NOT ON SIZE ERROR                                           NC1724.2
   000919      1  092200             MOVE   "N" TO XRAY.                                  NC1724.2 86
   000920         092300     GO TO   DIV-TEST-F2-16-1.                                    NC1724.2 925
   000921         092400 DIV-DELETE-F2-16-1.                                              NC1724.2
   000922         092500     PERFORM DE-LETE.                                             NC1724.2 329
   000923         092600     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000924         092700     GO TO   DIV-INIT-F2-17.                                      NC1724.2 950
   000925         092800 DIV-TEST-F2-16-1.                                                NC1724.2
   000926         092900     MOVE   "DIV-TEST-F2-16-1" TO PAR-NAME.                       NC1724.2 177
   000927         093000     IF      DIV10 NOT = 0                                        NC1724.2 170
   000928      1  093100             MOVE    DIV10 TO COMPUTED-N                          NC1724.2 170 189
   000929      1  093200             MOVE    0 TO CORRECT-N                               NC1724.2 203
   000930      1  093300             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   000931      1  093400             PERFORM FAIL                                         NC1724.2 328
   000932      1  093500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   000933         093600     ELSE                                                         NC1724.2
   000934      1  093700             PERFORM PASS                                         NC1724.2 327
   000935      1  093800             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000936         093900     ADD     1 TO REC-CT.                                         NC1724.2 224
   000937         094000 DIV-TEST-F2-16-2.                                                NC1724.2
   000938         094100     MOVE   "DIV-TEST-F2-16-2" TO PAR-NAME.                       NC1724.2 177
   000939         094200     IF      XRAY  NOT = "E"                                      NC1724.2 86
   000940      1  094300             MOVE    XRAY  TO COMPUTED-X                          NC1724.2 86 187
   000941      1  094400             MOVE   "E"    TO CORRECT-X                           NC1724.2 201
   000942      1  094500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   000943      1  094600             PERFORM FAIL                                         NC1724.2 328
   000944      1  094700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   000945         094800     ELSE                                                         NC1724.2
   000946      1  094900             PERFORM PASS                                         NC1724.2 327
   000947      1  095000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000948         095100*                                                                 NC1724.2
   000949         095200*                                                                 NC1724.2
   000950         095300 DIV-INIT-F2-17.                                                  NC1724.2
   000951         095400*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   000952         095500*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1724.2
   000953         095600     MOVE   "DIV-TEST-F2-17-1" TO PAR-NAME.                       NC1724.2 177
   000954         095700     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1724.2 233
   000955         095800     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1724.2 79 58
   000956         095900     MOVE   "0" TO WRK-XN-00001.                                  NC1724.2 51
   000957         096000     MOVE    1      TO REC-CT.                                    NC1724.2 224
   000958         096100 DIV-TEST-F2-17-0.                                                NC1724.2
   000959         096200     DIVIDE  A18ONES-DS-09V09 INTO WRK-DS-09V09                   NC1724.2 79 58
   000960         096300      GIVING WRK-DS-09V09                                         NC1724.2 58
   000961         096400          ON SIZE ERROR                                           NC1724.2
   000962      1  096500             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
   000963         096600      NOT ON SIZE ERROR                                           NC1724.2
   000964      1  096700             MOVE   "2" TO WRK-XN-00001.                          NC1724.2 51
   000965         096800     GO TO   DIV-TEST-F2-17-1.                                    NC1724.2 970
   000966         096900 DIV-DELETE-F2-17-1.                                              NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     PERFORM DE-LETE.                                             NC1724.2 329
   000968         097100     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   000969         097200     GO TO   DIV-INIT-F2-18.                                      NC1724.2 997
   000970         097300 DIV-TEST-F2-17-1.                                                NC1724.2
   000971         097400     MOVE   "DIV-TEST-F2-17-1" TO PAR-NAME.                       NC1724.2 177
   000972         097500     IF      WRK-DS-18V00-S NOT = 000000001000000000              NC1724.2 59
   000973      1  097600             MOVE    000000001000000000 TO CORRECT-18V0           NC1724.2 208
   000974      1  097700             MOVE    WRK-DS-18V00-S     TO COMPUTED-18V0          NC1724.2 59 195
   000975      1  097800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1724.2
   000976      1  097900                  TO RE-MARK                                      NC1724.2 182
   000977      1  098000             PERFORM FAIL                                         NC1724.2 328
   000978      1  098100             PERFORM PRINT-DETAIL                                 NC1724.2 331
   000979         098200     ELSE                                                         NC1724.2
   000980      1  098300             PERFORM PASS                                         NC1724.2 327
   000981      1  098400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000982         098500     ADD     1 TO REC-CT.                                         NC1724.2 224
   000983         098600 DIV-TEST-F2-17-2.                                                NC1724.2
   000984         098700     MOVE   "DIV-TEST-F2-17-2" TO PAR-NAME.                       NC1724.2 177
   000985         098800     IF      WRK-XN-00001 NOT = "2"                               NC1724.2 51
   000986      1  098900             MOVE   "2"           TO CORRECT-X                    NC1724.2 201
   000987      1  099000             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   000988      1  099100             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   000989      1  099200                  TO RE-MARK                                      NC1724.2 182
   000990      1  099300             PERFORM FAIL                                         NC1724.2 328
   000991      1  099400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   000992         099500     ELSE                                                         NC1724.2
   000993      1  099600             PERFORM PASS                                         NC1724.2 327
   000994      1  099700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   000995         099800*                                                                 NC1724.2
   000996         099900*                                                                 NC1724.2
   000997         100000 DIV-INIT-F2-18.                                                  NC1724.2
   000998         100100     MOVE "DIVIDE-INTO-GIVING" TO FEATURE.                        NC1724.2 173
   000999         100200*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   001000         100300*            ==-->  MULTIPLE RESULT FIELDS <--==                  NC1724.2
   001001         100400     MOVE   "DIV-TEST-F2-18" TO PAR-NAME.                         NC1724.2 177
   001002         100500     MOVE   "V1-81 6.11.4 GR2" TO ANSI-REFERENCE.                 NC1724.2 233
   001003         100600     MOVE    1 TO REC-CT.                                         NC1724.2 224
   001004         100700     MOVE   10 TO WRK-DU-2V0-1.                                   NC1724.2 101
   001005         100800     MOVE  3.9 TO WRK-DU-1V1-2.                                   NC1724.2 95
   001006         100900     MOVE    0 TO WRK-DU-2V1-1.                                   NC1724.2 104
   001007         101000     MOVE    0 TO WRK-DU-2V1-2.                                   NC1724.2 105
   001008         101100     MOVE    0 TO WRK-DU-2V0-2.                                   NC1724.2 102
   001009         101200     MOVE    0 TO WRK-DU-2V1-3.                                   NC1724.2 106
   001010         101300     MOVE    0 TO WRK-DU-2V0-3.                                   NC1724.2 103
   001011         101400 DIV-TEST-F2-18-0.                                                NC1724.2
   001012         101500     DIVIDE  WRK-DU-1V1-2 INTO WRK-DU-2V0-1                       NC1724.2 95 101
   001013         101600      GIVING WRK-DU-2V1-1                                         NC1724.2 104
   001014         101700             WRK-DU-2V0-1 ROUNDED                                 NC1724.2 101
   001015         101800             WRK-DU-2V1-2                                         NC1724.2 105
   001016         101900             WRK-DU-2V0-2 ROUNDED                                 NC1724.2 102
   001017         102000             WRK-DU-2V1-3                                         NC1724.2 106
   001018         102100             WRK-DU-2V0-3.                                        NC1724.2 103
   001019         102200     GO TO   DIV-TEST-F2-18-1.                                    NC1724.2 1024
   001020         102300 DIV-DELETE-F2-18.                                                NC1724.2
   001021         102400     PERFORM DE-LETE.                                             NC1724.2 329
   001022         102500     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001023         102600     GO TO   DIV-INIT-F2-19.                                      NC1724.2 1085
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700 DIV-TEST-F2-18-1.                                                NC1724.2
   001025         102800     IF      WRK-DU-2V1-1 = 2.5                                   NC1724.2 104
   001026      1  102900             PERFORM PASS                                         NC1724.2 327
   001027      1  103000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001028         103100     ELSE                                                         NC1724.2
   001029      1  103200             PERFORM FAIL                                         NC1724.2 328
   001030      1  103300             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1724.2 104 189
   001031      1  103400             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001032      1  103500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001033         103600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001034         103700 DIV-TEST-F2-18-2.                                                NC1724.2
   001035         103800     IF      WRK-DU-2V0-1 = 3                                     NC1724.2 101
   001036      1  103900             PERFORM PASS                                         NC1724.2 327
   001037      1  104000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001038         104100     ELSE                                                         NC1724.2
   001039      1  104200             PERFORM FAIL                                         NC1724.2 328
   001040      1  104300             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1724.2 101 189
   001041      1  104400             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001042      1  104500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001043         104600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001044         104700 DIV-TEST-F2-18-3.                                                NC1724.2
   001045         104800     IF      WRK-DU-2V1-2 = 2.5                                   NC1724.2 105
   001046      1  104900             PERFORM PASS                                         NC1724.2 327
   001047      1  105000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001048         105100     ELSE                                                         NC1724.2
   001049      1  105200             PERFORM FAIL                                         NC1724.2 328
   001050      1  105300             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1724.2 105 189
   001051      1  105400             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001052      1  105500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001053         105600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001054         105700 DIV-TEST-F2-18-4.                                                NC1724.2
   001055         105800     IF      WRK-DU-2V0-2 = 3                                     NC1724.2 102
   001056      1  105900             PERFORM PASS                                         NC1724.2 327
   001057      1  106000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001058         106100     ELSE                                                         NC1724.2
   001059      1  106200             PERFORM FAIL                                         NC1724.2 328
   001060      1  106300             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1724.2 102 189
   001061      1  106400             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001062      1  106500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001063         106600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001064         106700 DIV-TEST-F2-18-5.                                                NC1724.2
   001065         106800     IF      WRK-DU-2V1-3 = 2.5                                   NC1724.2 106
   001066      1  106900             PERFORM PASS                                         NC1724.2 327
   001067      1  107000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001068         107100     ELSE                                                         NC1724.2
   001069      1  107200             PERFORM FAIL                                         NC1724.2 328
   001070      1  107300             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1724.2 106 189
   001071      1  107400             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001072      1  107500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001073         107600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001074         107700 DIV-TEST-F2-18-6.                                                NC1724.2
   001075         107800     IF      WRK-DU-2V0-3 = 2                                     NC1724.2 103
   001076      1  107900             PERFORM PASS                                         NC1724.2 327
   001077      1  108000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001078         108100     ELSE                                                         NC1724.2
   001079      1  108200             PERFORM FAIL                                         NC1724.2 328
   001080      1  108300             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1724.2 103 189
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081      1  108400             MOVE    2            TO CORRECT-N                    NC1724.2 203
   001082      1  108500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001083         108600*                                                                 NC1724.2
   001084         108700*                                                                 NC1724.2
   001085         108800 DIV-INIT-F2-19.                                                  NC1724.2
   001086         108900*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   001087         109000*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1724.2
   001088         109100     MOVE   "DIV-TEST-F2-19" TO PAR-NAME.                         NC1724.2 177
   001089         109200     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1724.2 233
   001090         109300     MOVE   "0"  TO WRK-XN-00001.                                 NC1724.2 51
   001091         109400     MOVE    0   TO WRK-DU-2V1-1.                                 NC1724.2 104
   001092         109500     MOVE    0   TO WRK-DU-2V0-1.                                 NC1724.2 101
   001093         109600     MOVE    0   TO WRK-DU-2V1-2.                                 NC1724.2 105
   001094         109700     MOVE    0   TO WRK-DU-2V0-2.                                 NC1724.2 102
   001095         109800     MOVE    0   TO WRK-DU-2V1-3.                                 NC1724.2 106
   001096         109900     MOVE    0   TO WRK-DU-2V0-3.                                 NC1724.2 103
   001097         110000     MOVE    1   TO REC-CT.                                       NC1724.2 224
   001098         110100     MOVE    99  TO WRK-DU-2V0-1.                                 NC1724.2 101
   001099         110200     MOVE    .1  TO A01ONE-CS-00V01.                              NC1724.2 73
   001100         110300 DIV-TEST-F2-19-0.                                                NC1724.2
   001101         110400     DIVIDE  A01ONE-CS-00V01 INTO WRK-DU-2V0-1                    NC1724.2 73 101
   001102         110500      GIVING WRK-DU-2V1-1                                         NC1724.2 104
   001103         110600             WRK-DU-2V0-1 ROUNDED                                 NC1724.2 101
   001104         110700             WRK-DU-2V1-2                                         NC1724.2 105
   001105         110800             WRK-DU-2V0-2 ROUNDED                                 NC1724.2 102
   001106         110900             WRK-DU-2V1-3                                         NC1724.2 106
   001107         111000             WRK-DU-2V0-3                                         NC1724.2 103
   001108         111100          ON SIZE ERROR                                           NC1724.2
   001109      1  111200             MOVE  "1" TO WRK-XN-00001.                           NC1724.2 51
   001110         111300     GO TO DIV-TEST-F2-19-1.                                      NC1724.2 1115
   001111         111400 DIV-DELETE-F2-19.                                                NC1724.2
   001112         111500     PERFORM DE-LETE.                                             NC1724.2 329
   001113         111600     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001114         111700     GO TO   DIV-INIT-F2-20.                                      NC1724.2 1193
   001115         111800 DIV-TEST-F2-19-1.                                                NC1724.2
   001116         111900     IF      WRK-DU-2V1-1 = 0                                     NC1724.2 104
   001117      1  112000             PERFORM PASS                                         NC1724.2 327
   001118      1  112100             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001119         112200     ELSE                                                         NC1724.2
   001120      1  112300             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001121      1  112400             PERFORM FAIL                                         NC1724.2 328
   001122      1  112500             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1724.2 104 189
   001123      1  112600             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001124      1  112700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001125         112800     ADD 1 TO REC-CT.                                             NC1724.2 224
   001126         112900 DIV-TEST-F2-19-2.                                                NC1724.2
   001127         113000     IF      WRK-DU-2V0-1 = 99                                    NC1724.2 101
   001128      1  113100             PERFORM PASS                                         NC1724.2 327
   001129      1  113200             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001130         113300     ELSE                                                         NC1724.2
   001131      1  113400             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001132      1  113500             PERFORM FAIL                                         NC1724.2 328
   001133      1  113600             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1724.2 101 189
   001134      1  113700             MOVE    99           TO CORRECT-N                    NC1724.2 203
   001135      1  113800             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001136         113900     ADD 1 TO REC-CT.                                             NC1724.2 224
   001137         114000 DIV-TEST-F2-19-3.                                                NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100     IF      WRK-DU-2V1-2 = 0                                     NC1724.2 105
   001139      1  114200             PERFORM PASS                                         NC1724.2 327
   001140      1  114300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001141         114400     ELSE                                                         NC1724.2
   001142      1  114500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001143      1  114600             PERFORM FAIL                                         NC1724.2 328
   001144      1  114700             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1724.2 105 189
   001145      1  114800             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001146      1  114900             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001147         115000     ADD 1 TO REC-CT.                                             NC1724.2 224
   001148         115100 DIV-TEST-F2-19-4.                                                NC1724.2
   001149         115200     IF      WRK-DU-2V0-2 = 0                                     NC1724.2 102
   001150      1  115300             PERFORM PASS                                         NC1724.2 327
   001151      1  115400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001152         115500     ELSE                                                         NC1724.2
   001153      1  115600             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001154      1  115700             PERFORM FAIL                                         NC1724.2 328
   001155      1  115800             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1724.2 102 189
   001156      1  115900             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001157      1  116000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001158         116100     ADD 1 TO REC-CT.                                             NC1724.2 224
   001159         116200 DIV-TEST-F2-19-5.                                                NC1724.2
   001160         116300     IF      WRK-DU-2V1-3 = 0                                     NC1724.2 106
   001161      1  116400             PERFORM PASS                                         NC1724.2 327
   001162      1  116500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001163         116600     ELSE                                                         NC1724.2
   001164      1  116700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001165      1  116800             PERFORM FAIL                                         NC1724.2 328
   001166      1  116900             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1724.2 106 189
   001167      1  117000             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001168      1  117100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001169         117200     ADD 1 TO REC-CT.                                             NC1724.2 224
   001170         117300 DIV-TEST-F2-19-6.                                                NC1724.2
   001171         117400     IF      WRK-DU-2V0-3 = 0                                     NC1724.2 103
   001172      1  117500             PERFORM PASS                                         NC1724.2 327
   001173      1  117600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001174         117700     ELSE                                                         NC1724.2
   001175      1  117800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001176      1  117900             PERFORM FAIL                                         NC1724.2 328
   001177      1  118000             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1724.2 103 189
   001178      1  118100             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001179      1  118200             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001180         118300     ADD 1 TO REC-CT.                                             NC1724.2 224
   001181         118400 DIV-TEST-F2-19-7.                                                NC1724.2
   001182         118500     IF      WRK-XN-00001 = "1"                                   NC1724.2 51
   001183      1  118600             PERFORM PASS                                         NC1724.2 327
   001184      1  118700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001185         118800     ELSE                                                         NC1724.2
   001186      1  118900             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1724.2 182
   001187      1  119000             PERFORM FAIL                                         NC1724.2 328
   001188      1  119100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001189      1  119200             MOVE   "1"           TO CORRECT-X                    NC1724.2 201
   001190      1  119300             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001191         119400*                                                                 NC1724.2
   001192         119500*                                                                 NC1724.2
   001193         119600 DIV-INIT-F2-20.                                                  NC1724.2
   001194         119700*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800*            ==-->  NEW SIZE ERROR TESTS   <--==                  NC1724.2
   001196         119900     MOVE   "DIV-TEST-F2-20" TO PAR-NAME.                         NC1724.2 177
   001197         120000     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1724.2 233
   001198         120100     MOVE   "0"  TO WRK-XN-00001.                                 NC1724.2 51
   001199         120200     MOVE    0   TO WRK-DU-2V1-1.                                 NC1724.2 104
   001200         120300     MOVE    0   TO WRK-DU-2V0-1.                                 NC1724.2 101
   001201         120400     MOVE    0   TO WRK-DU-2V1-2.                                 NC1724.2 105
   001202         120500     MOVE    0   TO WRK-DU-2V0-2.                                 NC1724.2 102
   001203         120600     MOVE    0   TO WRK-DU-2V1-3.                                 NC1724.2 106
   001204         120700     MOVE    0   TO WRK-DU-2V0-3.                                 NC1724.2 103
   001205         120800     MOVE    10  TO WRK-DU-2V0-1.                                 NC1724.2 101
   001206         120900     MOVE    3.9 TO WRK-DU-1V1-2.                                 NC1724.2 95
   001207         121000     MOVE    1   TO REC-CT.                                       NC1724.2 224
   001208         121100 DIV-TEST-F2-20-0.                                                NC1724.2
   001209         121200     DIVIDE  WRK-DU-1V1-2 INTO WRK-DU-2V0-1                       NC1724.2 95 101
   001210         121300      GIVING WRK-DU-2V1-1                                         NC1724.2 104
   001211         121400             WRK-DU-2V0-1 ROUNDED                                 NC1724.2 101
   001212         121500             WRK-DU-2V1-2                                         NC1724.2 105
   001213         121600             WRK-DU-2V0-2 ROUNDED                                 NC1724.2 102
   001214         121700             WRK-DU-2V1-3                                         NC1724.2 106
   001215         121800             WRK-DU-2V0-3                                         NC1724.2 103
   001216         121900          ON SIZE ERROR                                           NC1724.2
   001217      1  122000             MOVE   "1" TO WRK-XN-00001.                          NC1724.2 51
   001218         122100     GO TO DIV-TEST-F2-20-1.                                      NC1724.2 1223
   001219         122200 DIV-DELETE-F2-20.                                                NC1724.2
   001220         122300     PERFORM DE-LETE.                                             NC1724.2 329
   001221         122400     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001222         122500     GO TO   DIV-INIT-F2-21.                                      NC1724.2 1301
   001223         122600 DIV-TEST-F2-20-1.                                                NC1724.2
   001224         122700     IF      WRK-DU-2V1-1 = 2.5                                   NC1724.2 104
   001225      1  122800             PERFORM PASS                                         NC1724.2 327
   001226      1  122900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001227         123000     ELSE                                                         NC1724.2
   001228      1  123100             PERFORM FAIL                                         NC1724.2 328
   001229      1  123200             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1724.2 104 189
   001230      1  123300             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001231      1  123400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001232         123500     ADD 1 TO REC-CT.                                             NC1724.2 224
   001233         123600 DIV-TEST-F2-20-2.                                                NC1724.2
   001234         123700     IF      WRK-DU-2V0-1 = 3                                     NC1724.2 101
   001235      1  123800             PERFORM PASS                                         NC1724.2 327
   001236      1  123900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001237         124000     ELSE                                                         NC1724.2
   001238      1  124100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001239      1  124200             PERFORM FAIL                                         NC1724.2 328
   001240      1  124300             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1724.2 101 189
   001241      1  124400             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001242      1  124500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001243         124600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001244         124700 DIV-TEST-F2-20-3.                                                NC1724.2
   001245         124800     IF      WRK-DU-2V1-2 = 2.5                                   NC1724.2 105
   001246      1  124900             PERFORM PASS                                         NC1724.2 327
   001247      1  125000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001248         125100     ELSE                                                         NC1724.2
   001249      1  125200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001250      1  125300             PERFORM FAIL                                         NC1724.2 328
   001251      1  125400             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1724.2 105 189
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252      1  125500             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001253      1  125600             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001254         125700     ADD 1 TO REC-CT.                                             NC1724.2 224
   001255         125800 DIV-TEST-F2-20-4.                                                NC1724.2
   001256         125900     IF      WRK-DU-2V0-2 = 3                                     NC1724.2 102
   001257      1  126000             PERFORM PASS                                         NC1724.2 327
   001258      1  126100             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001259         126200     ELSE                                                         NC1724.2
   001260      1  126300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001261      1  126400             PERFORM FAIL                                         NC1724.2 328
   001262      1  126500             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1724.2 102 189
   001263      1  126600             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001264      1  126700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001265         126800     ADD 1 TO REC-CT.                                             NC1724.2 224
   001266         126900 DIV-TEST-F2-20-5.                                                NC1724.2
   001267         127000     IF      WRK-DU-2V1-3 = 2.5                                   NC1724.2 106
   001268      1  127100             PERFORM PASS                                         NC1724.2 327
   001269      1  127200             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001270         127300     ELSE                                                         NC1724.2
   001271      1  127400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001272      1  127500             PERFORM FAIL                                         NC1724.2 328
   001273      1  127600             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1724.2 106 189
   001274      1  127700             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001275      1  127800             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001276         127900     ADD 1 TO REC-CT.                                             NC1724.2 224
   001277         128000 DIV-TEST-F2-20-6.                                                NC1724.2
   001278         128100     IF      WRK-DU-2V0-3 = 2                                     NC1724.2 103
   001279      1  128200             PERFORM PASS                                         NC1724.2 327
   001280      1  128300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001281         128400     ELSE                                                         NC1724.2
   001282      1  128500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001283      1  128600             PERFORM FAIL                                         NC1724.2 328
   001284      1  128700             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1724.2 103 189
   001285      1  128800             MOVE    2            TO CORRECT-N                    NC1724.2 203
   001286      1  128900             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001287         129000     ADD 1 TO REC-CT.                                             NC1724.2 224
   001288         129100 DIV-TEST-F2-20-7.                                                NC1724.2
   001289         129200     IF      WRK-XN-00001 = "0"                                   NC1724.2 51
   001290      1  129300             PERFORM PASS                                         NC1724.2 327
   001291      1  129400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001292         129500     ELSE                                                         NC1724.2
   001293      1  129600             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1724.2
   001294      1  129700                  TO RE-MARK                                      NC1724.2 182
   001295      1  129800             PERFORM FAIL                                         NC1724.2 328
   001296      1  129900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001297      1  130000             MOVE   "0"           TO CORRECT-X                    NC1724.2 201
   001298      1  130100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001299         130200*                                                                 NC1724.2
   001300         130300*                                                                 NC1724.2
   001301         130400 DIV-INIT-F2-21.                                                  NC1724.2
   001302         130500*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   001303         130600*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1724.2
   001304         130700     MOVE   "DIV-TEST-F2-21" TO PAR-NAME.                         NC1724.2 177
   001305         130800     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1724.2 233
   001306         130900     MOVE   "0"  TO WRK-XN-00001.                                 NC1724.2 51
   001307         131000     MOVE    0   TO WRK-DU-2V1-1.                                 NC1724.2 104
   001308         131100     MOVE    0   TO WRK-DU-2V1-2.                                 NC1724.2 105
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     MOVE    0   TO WRK-DU-2V0-2.                                 NC1724.2 102
   001310         131300     MOVE    0   TO WRK-DU-2V1-3.                                 NC1724.2 106
   001311         131400     MOVE    0   TO WRK-DU-2V0-3.                                 NC1724.2 103
   001312         131500     MOVE    99  TO WRK-DU-2V0-1.                                 NC1724.2 101
   001313         131600     MOVE    1   TO REC-CT.                                       NC1724.2 224
   001314         131700 DIV-TEST-F2-21-0.                                                NC1724.2
   001315         131800     DIVIDE  A01ONE-CS-00V01 INTO WRK-DU-2V0-1                    NC1724.2 73 101
   001316         131900      GIVING WRK-DU-2V1-1                                         NC1724.2 104
   001317         132000             WRK-DU-2V0-1 ROUNDED                                 NC1724.2 101
   001318         132100             WRK-DU-2V1-2                                         NC1724.2 105
   001319         132200             WRK-DU-2V0-2 ROUNDED                                 NC1724.2 102
   001320         132300             WRK-DU-2V1-3                                         NC1724.2 106
   001321         132400             WRK-DU-2V0-3                                         NC1724.2 103
   001322         132500      NOT ON SIZE ERROR                                           NC1724.2
   001323      1  132600             MOVE  "1" TO WRK-XN-00001.                           NC1724.2 51
   001324         132700     GO TO DIV-TEST-F2-21-1.                                      NC1724.2 1329
   001325         132800 DIV-DELETE-F2-21.                                                NC1724.2
   001326         132900     PERFORM DE-LETE.                                             NC1724.2 329
   001327         133000     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001328         133100     GO TO   DIV-INIT-F2-22.                                      NC1724.2 1408
   001329         133200 DIV-TEST-F2-21-1.                                                NC1724.2
   001330         133300     IF      WRK-DU-2V1-1 = 0                                     NC1724.2 104
   001331      1  133400             PERFORM PASS                                         NC1724.2 327
   001332      1  133500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001333         133600     ELSE                                                         NC1724.2
   001334      1  133700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001335      1  133800             PERFORM FAIL                                         NC1724.2 328
   001336      1  133900             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1724.2 104 189
   001337      1  134000             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001338      1  134100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001339         134200     ADD 1 TO REC-CT.                                             NC1724.2 224
   001340         134300 DIV-TEST-F2-21-2.                                                NC1724.2
   001341         134400     IF      WRK-DU-2V0-1 = 99                                    NC1724.2 101
   001342      1  134500             PERFORM PASS                                         NC1724.2 327
   001343      1  134600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001344         134700     ELSE                                                         NC1724.2
   001345      1  134800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001346      1  134900             PERFORM FAIL                                         NC1724.2 328
   001347      1  135000             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1724.2 101 189
   001348      1  135100             MOVE    99           TO CORRECT-N                    NC1724.2 203
   001349      1  135200             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001350         135300     ADD 1 TO REC-CT.                                             NC1724.2 224
   001351         135400 DIV-TEST-F2-21-3.                                                NC1724.2
   001352         135500     IF      WRK-DU-2V1-2 = 0                                     NC1724.2 105
   001353      1  135600             PERFORM PASS                                         NC1724.2 327
   001354      1  135700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001355         135800     ELSE                                                         NC1724.2
   001356      1  135900             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001357      1  136000             PERFORM FAIL                                         NC1724.2 328
   001358      1  136100             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1724.2 105 189
   001359      1  136200             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001360      1  136300             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001361         136400     ADD 1 TO REC-CT.                                             NC1724.2 224
   001362         136500 DIV-TEST-F2-21-4.                                                NC1724.2
   001363         136600     IF      WRK-DU-2V0-2 = 0                                     NC1724.2 102
   001364      1  136700             PERFORM PASS                                         NC1724.2 327
   001365      1  136800             PERFORM PRINT-DETAIL                                 NC1724.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900     ELSE                                                         NC1724.2
   001367      1  137000             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001368      1  137100             PERFORM FAIL                                         NC1724.2 328
   001369      1  137200             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1724.2 102 189
   001370      1  137300             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001371      1  137400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001372         137500     ADD 1 TO REC-CT.                                             NC1724.2 224
   001373         137600 DIV-TEST-F2-21-5.                                                NC1724.2
   001374         137700     IF      WRK-DU-2V1-3 = 0                                     NC1724.2 106
   001375      1  137800             PERFORM PASS                                         NC1724.2 327
   001376      1  137900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001377         138000     ELSE                                                         NC1724.2
   001378      1  138100             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001379      1  138200             PERFORM FAIL                                         NC1724.2 328
   001380      1  138300             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1724.2 106 189
   001381      1  138400             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001382      1  138500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001383         138600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001384         138700 DIV-TEST-F2-21-6.                                                NC1724.2
   001385         138800     IF      WRK-DU-2V0-3 = 0                                     NC1724.2 103
   001386      1  138900             PERFORM PASS                                         NC1724.2 327
   001387      1  139000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001388         139100     ELSE                                                         NC1724.2
   001389      1  139200             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001390      1  139300             PERFORM FAIL                                         NC1724.2 328
   001391      1  139400             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1724.2 103 189
   001392      1  139500             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001393      1  139600             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001394         139700     ADD 1 TO REC-CT.                                             NC1724.2 224
   001395         139800 DIV-TEST-F2-21-7.                                                NC1724.2
   001396         139900     IF      WRK-XN-00001 = "0"                                   NC1724.2 51
   001397      1  140000             PERFORM PASS                                         NC1724.2 327
   001398      1  140100             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001399         140200     ELSE                                                         NC1724.2
   001400      1  140300             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1724.2
   001401      1  140400                  TO RE-MARK                                      NC1724.2 182
   001402      1  140500             PERFORM FAIL                                         NC1724.2 328
   001403      1  140600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001404      1  140700             MOVE   "0"           TO CORRECT-X                    NC1724.2 201
   001405      1  140800             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001406         140900*                                                                 NC1724.2
   001407         141000*                                                                 NC1724.2
   001408         141100 DIV-INIT-F2-22.                                                  NC1724.2
   001409         141200*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   001410         141300*            ==-->  NEW SIZE ERROR TESTS   <--==                  NC1724.2
   001411         141400     MOVE   "DIV-TEST-F2-22" TO PAR-NAME.                         NC1724.2 177
   001412         141500     MOVE   "V1-67 6.4.2"    TO ANSI-REFERENCE.                   NC1724.2 233
   001413         141600     MOVE   "0"  TO WRK-XN-00001.                                 NC1724.2 51
   001414         141700     MOVE    0   TO WRK-DU-2V1-1.                                 NC1724.2 104
   001415         141800     MOVE    0   TO WRK-DU-2V0-1.                                 NC1724.2 101
   001416         141900     MOVE    0   TO WRK-DU-2V1-2.                                 NC1724.2 105
   001417         142000     MOVE    0   TO WRK-DU-2V0-2.                                 NC1724.2 102
   001418         142100     MOVE    0   TO WRK-DU-2V1-3.                                 NC1724.2 106
   001419         142200     MOVE    0   TO WRK-DU-2V0-3.                                 NC1724.2 103
   001420         142300     MOVE    1   TO REC-CT.                                       NC1724.2 224
   001421         142400     MOVE    10  TO WRK-DU-2V0-1.                                 NC1724.2 101
   001422         142500     MOVE    3.9 TO WRK-DU-1V1-2.                                 NC1724.2 95
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600 DIV-TEST-F2-22-0.                                                NC1724.2
   001424         142700     DIVIDE  WRK-DU-1V1-2 INTO WRK-DU-2V0-1                       NC1724.2 95 101
   001425         142800      GIVING WRK-DU-2V1-1                                         NC1724.2 104
   001426         142900             WRK-DU-2V0-1 ROUNDED                                 NC1724.2 101
   001427         143000             WRK-DU-2V1-2                                         NC1724.2 105
   001428         143100             WRK-DU-2V0-2 ROUNDED                                 NC1724.2 102
   001429         143200             WRK-DU-2V1-3                                         NC1724.2 106
   001430         143300             WRK-DU-2V0-3                                         NC1724.2 103
   001431         143400      NOT ON SIZE ERROR                                           NC1724.2
   001432      1  143500             MOVE   "1" TO WRK-XN-00001.                          NC1724.2 51
   001433         143600     GO TO DIV-TEST-F2-22-1.                                      NC1724.2 1438
   001434         143700 DIV-DELETE-F2-22.                                                NC1724.2
   001435         143800     PERFORM DE-LETE.                                             NC1724.2 329
   001436         143900     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001437         144000     GO TO   DIV-INIT-F2-23.                                      NC1724.2 1516
   001438         144100 DIV-TEST-F2-22-1.                                                NC1724.2
   001439         144200     IF      WRK-DU-2V1-1 = 2.5                                   NC1724.2 104
   001440      1  144300             PERFORM PASS                                         NC1724.2 327
   001441      1  144400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001442         144500     ELSE                                                         NC1724.2
   001443      1  144600             PERFORM FAIL                                         NC1724.2 328
   001444      1  144700             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1724.2 104 189
   001445      1  144800             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001446      1  144900             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001447         145000     ADD 1 TO REC-CT.                                             NC1724.2 224
   001448         145100 DIV-TEST-F2-22-2.                                                NC1724.2
   001449         145200     IF      WRK-DU-2V0-1 = 3                                     NC1724.2 101
   001450      1  145300             PERFORM PASS                                         NC1724.2 327
   001451      1  145400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001452         145500     ELSE                                                         NC1724.2
   001453      1  145600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001454      1  145700             PERFORM FAIL                                         NC1724.2 328
   001455      1  145800             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1724.2 101 189
   001456      1  145900             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001457      1  146000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001458         146100     ADD 1 TO REC-CT.                                             NC1724.2 224
   001459         146200 DIV-TEST-F2-22-3.                                                NC1724.2
   001460         146300     IF      WRK-DU-2V1-2 = 2.5                                   NC1724.2 105
   001461      1  146400             PERFORM PASS                                         NC1724.2 327
   001462      1  146500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001463         146600     ELSE                                                         NC1724.2
   001464      1  146700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001465      1  146800             PERFORM FAIL                                         NC1724.2 328
   001466      1  146900             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1724.2 105 189
   001467      1  147000             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001468      1  147100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001469         147200     ADD 1 TO REC-CT.                                             NC1724.2 224
   001470         147300 DIV-TEST-F2-22-4.                                                NC1724.2
   001471         147400     IF      WRK-DU-2V0-2 = 3                                     NC1724.2 102
   001472      1  147500             PERFORM PASS                                         NC1724.2 327
   001473      1  147600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001474         147700     ELSE                                                         NC1724.2
   001475      1  147800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001476      1  147900             PERFORM FAIL                                         NC1724.2 328
   001477      1  148000             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1724.2 102 189
   001478      1  148100             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001479      1  148200             PERFORM PRINT-DETAIL.                                NC1724.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300     ADD 1 TO REC-CT.                                             NC1724.2 224
   001481         148400 DIV-TEST-F2-22-5.                                                NC1724.2
   001482         148500     IF      WRK-DU-2V1-3 = 2.5                                   NC1724.2 106
   001483      1  148600             PERFORM PASS                                         NC1724.2 327
   001484      1  148700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001485         148800     ELSE                                                         NC1724.2
   001486      1  148900             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001487      1  149000             PERFORM FAIL                                         NC1724.2 328
   001488      1  149100             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1724.2 106 189
   001489      1  149200             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001490      1  149300             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001491         149400     ADD 1 TO REC-CT.                                             NC1724.2 224
   001492         149500 DIV-TEST-F2-22-6.                                                NC1724.2
   001493         149600     IF      WRK-DU-2V0-3 = 2                                     NC1724.2 103
   001494      1  149700             PERFORM PASS                                         NC1724.2 327
   001495      1  149800             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001496         149900     ELSE                                                         NC1724.2
   001497      1  150000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001498      1  150100             PERFORM FAIL                                         NC1724.2 328
   001499      1  150200             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1724.2 103 189
   001500      1  150300             MOVE    2            TO CORRECT-N                    NC1724.2 203
   001501      1  150400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001502         150500     ADD 1 TO REC-CT.                                             NC1724.2 224
   001503         150600 DIV-TEST-F2-22-7.                                                NC1724.2
   001504         150700     IF      WRK-XN-00001 = "1"                                   NC1724.2 51
   001505      1  150800             PERFORM PASS                                         NC1724.2 327
   001506      1  150900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001507         151000     ELSE                                                         NC1724.2
   001508      1  151100             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   001509      1  151200                  TO RE-MARK                                      NC1724.2 182
   001510      1  151300             PERFORM FAIL                                         NC1724.2 328
   001511      1  151400             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001512      1  151500             MOVE   "0"           TO CORRECT-X                    NC1724.2 201
   001513      1  151600             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001514         151700*                                                                 NC1724.2
   001515         151800*                                                                 NC1724.2
   001516         151900 DIV-INIT-F2-23.                                                  NC1724.2
   001517         152000*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   001518         152100*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1724.2
   001519         152200     MOVE   "DIV-TEST-F2-23" TO PAR-NAME.                         NC1724.2 177
   001520         152300     MOVE   "V1-67 6.4.2"    TO ANSI-REFERENCE.                   NC1724.2 233
   001521         152400     MOVE   "0"  TO WRK-XN-00001.                                 NC1724.2 51
   001522         152500     MOVE    0   TO WRK-DU-2V1-1.                                 NC1724.2 104
   001523         152600     MOVE    0   TO WRK-DU-2V1-2.                                 NC1724.2 105
   001524         152700     MOVE    0   TO WRK-DU-2V0-2.                                 NC1724.2 102
   001525         152800     MOVE    0   TO WRK-DU-2V1-3.                                 NC1724.2 106
   001526         152900     MOVE    0   TO WRK-DU-2V0-3.                                 NC1724.2 103
   001527         153000     MOVE    1   TO REC-CT.                                       NC1724.2 224
   001528         153100     MOVE    99  TO WRK-DU-2V0-1.                                 NC1724.2 101
   001529         153200     MOVE    .1  TO A01ONE-CS-00V01.                              NC1724.2 73
   001530         153300 DIV-TEST-F2-23-0.                                                NC1724.2
   001531         153400     DIVIDE  A01ONE-CS-00V01 INTO WRK-DU-2V0-1                    NC1724.2 73 101
   001532         153500      GIVING WRK-DU-2V1-1                                         NC1724.2 104
   001533         153600             WRK-DU-2V0-1 ROUNDED                                 NC1724.2 101
   001534         153700             WRK-DU-2V1-2                                         NC1724.2 105
   001535         153800             WRK-DU-2V0-2 ROUNDED                                 NC1724.2 102
   001536         153900             WRK-DU-2V1-3                                         NC1724.2 106
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154000             WRK-DU-2V0-3                                         NC1724.2 103
   001538         154100          ON SIZE ERROR                                           NC1724.2
   001539      1  154200             MOVE  "1" TO WRK-XN-00001                            NC1724.2 51
   001540         154300      NOT ON SIZE ERROR                                           NC1724.2
   001541      1  154400             MOVE  "2" TO WRK-XN-00001.                           NC1724.2 51
   001542         154500     GO TO DIV-TEST-F2-23-1.                                      NC1724.2 1547
   001543         154600 DIV-DELETE-F2-23.                                                NC1724.2
   001544         154700     PERFORM DE-LETE.                                             NC1724.2 329
   001545         154800     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001546         154900     GO TO   DIV-INIT-F2-24.                                      NC1724.2 1626
   001547         155000 DIV-TEST-F2-23-1.                                                NC1724.2
   001548         155100     IF      WRK-DU-2V1-1 = 0                                     NC1724.2 104
   001549      1  155200             PERFORM PASS                                         NC1724.2 327
   001550      1  155300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001551         155400     ELSE                                                         NC1724.2
   001552      1  155500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001553      1  155600             PERFORM FAIL                                         NC1724.2 328
   001554      1  155700             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1724.2 104 189
   001555      1  155800             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001556      1  155900             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001557         156000     ADD 1 TO REC-CT.                                             NC1724.2 224
   001558         156100 DIV-TEST-F2-23-2.                                                NC1724.2
   001559         156200     IF      WRK-DU-2V0-1 = 99                                    NC1724.2 101
   001560      1  156300             PERFORM PASS                                         NC1724.2 327
   001561      1  156400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001562         156500     ELSE                                                         NC1724.2
   001563      1  156600             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001564      1  156700             PERFORM FAIL                                         NC1724.2 328
   001565      1  156800             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1724.2 101 189
   001566      1  156900             MOVE    99           TO CORRECT-N                    NC1724.2 203
   001567      1  157000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001568         157100     ADD 1 TO REC-CT.                                             NC1724.2 224
   001569         157200 DIV-TEST-F2-23-3.                                                NC1724.2
   001570         157300     IF      WRK-DU-2V1-2 = 0                                     NC1724.2 105
   001571      1  157400             PERFORM PASS                                         NC1724.2 327
   001572      1  157500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001573         157600     ELSE                                                         NC1724.2
   001574      1  157700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001575      1  157800             PERFORM FAIL                                         NC1724.2 328
   001576      1  157900             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1724.2 105 189
   001577      1  158000             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001578      1  158100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001579         158200     ADD 1 TO REC-CT.                                             NC1724.2 224
   001580         158300 DIV-TEST-F2-23-4.                                                NC1724.2
   001581         158400     IF      WRK-DU-2V0-2 = 0                                     NC1724.2 102
   001582      1  158500             PERFORM PASS                                         NC1724.2 327
   001583      1  158600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001584         158700     ELSE                                                         NC1724.2
   001585      1  158800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001586      1  158900             PERFORM FAIL                                         NC1724.2 328
   001587      1  159000             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1724.2 102 189
   001588      1  159100             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001589      1  159200             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001590         159300     ADD 1 TO REC-CT.                                             NC1724.2 224
   001591         159400 DIV-TEST-F2-23-5.                                                NC1724.2
   001592         159500     IF      WRK-DU-2V1-3 = 0                                     NC1724.2 106
   001593      1  159600             PERFORM PASS                                         NC1724.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594      1  159700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001595         159800     ELSE                                                         NC1724.2
   001596      1  159900             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001597      1  160000             PERFORM FAIL                                         NC1724.2 328
   001598      1  160100             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1724.2 106 189
   001599      1  160200             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001600      1  160300             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001601         160400     ADD 1 TO REC-CT.                                             NC1724.2 224
   001602         160500 DIV-TEST-F2-23-6.                                                NC1724.2
   001603         160600     IF      WRK-DU-2V0-3 = 0                                     NC1724.2 103
   001604      1  160700             PERFORM PASS                                         NC1724.2 327
   001605      1  160800             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001606         160900     ELSE                                                         NC1724.2
   001607      1  161000             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1724.2 182
   001608      1  161100             PERFORM FAIL                                         NC1724.2 328
   001609      1  161200             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1724.2 103 189
   001610      1  161300             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001611      1  161400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001612         161500     ADD 1 TO REC-CT.                                             NC1724.2 224
   001613         161600 DIV-TEST-F2-23-7.                                                NC1724.2
   001614         161700     IF      WRK-XN-00001 = "1"                                   NC1724.2 51
   001615      1  161800             PERFORM PASS                                         NC1724.2 327
   001616      1  161900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001617         162000     ELSE                                                         NC1724.2
   001618      1  162100             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1724.2
   001619      1  162200                  TO RE-MARK                                      NC1724.2 182
   001620      1  162300             PERFORM FAIL                                         NC1724.2 328
   001621      1  162400             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001622      1  162500             MOVE   "0"           TO CORRECT-X                    NC1724.2 201
   001623      1  162600             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001624         162700*                                                                 NC1724.2
   001625         162800*                                                                 NC1724.2
   001626         162900 DIV-INIT-F2-24.                                                  NC1724.2
   001627         163000*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   001628         163100*            ==-->  NEW SIZE ERROR TESTS   <--==                  NC1724.2
   001629         163200     MOVE   "DIV-TEST-F2-24" TO PAR-NAME.                         NC1724.2 177
   001630         163300     MOVE   "V1-67 6.4.2"    TO ANSI-REFERENCE.                   NC1724.2 233
   001631         163400     MOVE   "0"  TO WRK-XN-00001.                                 NC1724.2 51
   001632         163500     MOVE    0   TO WRK-DU-2V1-1.                                 NC1724.2 104
   001633         163600     MOVE    0   TO WRK-DU-2V0-1.                                 NC1724.2 101
   001634         163700     MOVE    0   TO WRK-DU-2V1-2.                                 NC1724.2 105
   001635         163800     MOVE    0   TO WRK-DU-2V0-2.                                 NC1724.2 102
   001636         163900     MOVE    0   TO WRK-DU-2V1-3.                                 NC1724.2 106
   001637         164000     MOVE    0   TO WRK-DU-2V0-3.                                 NC1724.2 103
   001638         164100     MOVE    1   TO REC-CT.                                       NC1724.2 224
   001639         164200     MOVE    10  TO WRK-DU-2V0-1.                                 NC1724.2 101
   001640         164300     MOVE    3.9 TO WRK-DU-1V1-2.                                 NC1724.2 95
   001641         164400 DIV-TEST-F2-24-0.                                                NC1724.2
   001642         164500     DIVIDE  WRK-DU-1V1-2 INTO WRK-DU-2V0-1                       NC1724.2 95 101
   001643         164600      GIVING WRK-DU-2V1-1                                         NC1724.2 104
   001644         164700             WRK-DU-2V0-1 ROUNDED                                 NC1724.2 101
   001645         164800             WRK-DU-2V1-2                                         NC1724.2 105
   001646         164900             WRK-DU-2V0-2 ROUNDED                                 NC1724.2 102
   001647         165000             WRK-DU-2V1-3                                         NC1724.2 106
   001648         165100             WRK-DU-2V0-3                                         NC1724.2 103
   001649         165200          ON SIZE ERROR                                           NC1724.2
   001650      1  165300             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165400      NOT ON SIZE ERROR                                           NC1724.2
   001652      1  165500             MOVE   "2" TO WRK-XN-00001.                          NC1724.2 51
   001653         165600     GO TO DIV-TEST-F2-24-1.                                      NC1724.2 1658
   001654         165700 DIV-DELETE-F2-24.                                                NC1724.2
   001655         165800     PERFORM DE-LETE.                                             NC1724.2 329
   001656         165900     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001657         166000     GO TO   DIV-INIT-F2-25.                                      NC1724.2 1737
   001658         166100 DIV-TEST-F2-24-1.                                                NC1724.2
   001659         166200     IF      WRK-DU-2V1-1 = 2.5                                   NC1724.2 104
   001660      1  166300             PERFORM PASS                                         NC1724.2 327
   001661      1  166400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001662         166500     ELSE                                                         NC1724.2
   001663      1  166600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001664      1  166700             PERFORM FAIL                                         NC1724.2 328
   001665      1  166800             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1724.2 104 189
   001666      1  166900             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001667      1  167000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001668         167100     ADD 1 TO REC-CT.                                             NC1724.2 224
   001669         167200 DIV-TEST-F2-24-2.                                                NC1724.2
   001670         167300     IF      WRK-DU-2V0-1 = 3                                     NC1724.2 101
   001671      1  167400             PERFORM PASS                                         NC1724.2 327
   001672      1  167500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001673         167600     ELSE                                                         NC1724.2
   001674      1  167700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001675      1  167800             PERFORM FAIL                                         NC1724.2 328
   001676      1  167900             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1724.2 101 189
   001677      1  168000             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001678      1  168100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001679         168200     ADD 1 TO REC-CT.                                             NC1724.2 224
   001680         168300 DIV-TEST-F2-24-3.                                                NC1724.2
   001681         168400     IF      WRK-DU-2V1-2 = 2.5                                   NC1724.2 105
   001682      1  168500             PERFORM PASS                                         NC1724.2 327
   001683      1  168600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001684         168700     ELSE                                                         NC1724.2
   001685      1  168800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001686      1  168900             PERFORM FAIL                                         NC1724.2 328
   001687      1  169000             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1724.2 105 189
   001688      1  169100             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001689      1  169200             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001690         169300     ADD 1 TO REC-CT.                                             NC1724.2 224
   001691         169400 DIV-TEST-F2-24-4.                                                NC1724.2
   001692         169500     IF      WRK-DU-2V0-2 = 3                                     NC1724.2 102
   001693      1  169600             PERFORM PASS                                         NC1724.2 327
   001694      1  169700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001695         169800     ELSE                                                         NC1724.2
   001696      1  169900             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001697      1  170000             PERFORM FAIL                                         NC1724.2 328
   001698      1  170100             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1724.2 102 189
   001699      1  170200             MOVE    3            TO CORRECT-N                    NC1724.2 203
   001700      1  170300             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001701         170400     ADD 1 TO REC-CT.                                             NC1724.2 224
   001702         170500 DIV-TEST-F2-24-5.                                                NC1724.2
   001703         170600     IF      WRK-DU-2V1-3 = 2.5                                   NC1724.2 106
   001704      1  170700             PERFORM PASS                                         NC1724.2 327
   001705      1  170800             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001706         170900     ELSE                                                         NC1724.2
   001707      1  171000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708      1  171100             PERFORM FAIL                                         NC1724.2 328
   001709      1  171200             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1724.2 106 189
   001710      1  171300             MOVE    2.5          TO CORRECT-N                    NC1724.2 203
   001711      1  171400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001712         171500     ADD 1 TO REC-CT.                                             NC1724.2 224
   001713         171600 DIV-TEST-F2-24-6.                                                NC1724.2
   001714         171700     IF      WRK-DU-2V0-3 = 2                                     NC1724.2 103
   001715      1  171800             PERFORM PASS                                         NC1724.2 327
   001716      1  171900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001717         172000     ELSE                                                         NC1724.2
   001718      1  172100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001719      1  172200             PERFORM FAIL                                         NC1724.2 328
   001720      1  172300             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1724.2 103 189
   001721      1  172400             MOVE    2            TO CORRECT-N                    NC1724.2 203
   001722      1  172500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001723         172600     ADD 1 TO REC-CT.                                             NC1724.2 224
   001724         172700 DIV-TEST-F2-24-7.                                                NC1724.2
   001725         172800     IF      WRK-XN-00001 = "2"                                   NC1724.2 51
   001726      1  172900             PERFORM PASS                                         NC1724.2 327
   001727      1  173000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001728         173100     ELSE                                                         NC1724.2
   001729      1  173200             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   001730      1  173300                  TO RE-MARK                                      NC1724.2 182
   001731      1  173400             PERFORM FAIL                                         NC1724.2 328
   001732      1  173500             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001733      1  173600             MOVE   "2"           TO CORRECT-X                    NC1724.2 201
   001734      1  173700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001735         173800*                                                                 NC1724.2
   001736         173900*                                                                 NC1724.2
   001737         174000 DIV-INIT-F2-25.                                                  NC1724.2
   001738         174100*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   001739         174200*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1724.2
   001740         174300     MOVE   "DIV-TEST-F2-25" TO PAR-NAME.                         NC1724.2 177
   001741         174400     MOVE   "1V-41 6.4.3"      TO ANSI-REFERENCE.                 NC1724.2 233
   001742         174500     MOVE   "0"     TO WRK-XN-00001.                              NC1724.2 51
   001743         174600     MOVE    0      TO WRK-DS-05V00.                              NC1724.2 82
   001744         174700     MOVE    0      TO WRK-DS-02V00.                              NC1724.2 56
   001745         174800     MOVE    0      TO WRK-CS-18V00.                              NC1724.2 69
   001746         174900     MOVE    0      TO DIV10.                                     NC1724.2 170
   001747         175000     MOVE    1      TO REC-CT.                                    NC1724.2 224
   001748         175100     MOVE    44.1   TO DIV2.                                      NC1724.2 155
   001749         175200     MOVE   -9.642  TO DIV4.                                      NC1724.2 159
   001750         175300 DIV-TEST-F2-25-0.                                                NC1724.2
   001751         175400     DIVIDE  DIV4 INTO DIV2                                       NC1724.2 159 155
   001752         175500      GIVING DIV10                                                NC1724.2 170
   001753         175600          ON SIZE ERROR                                           NC1724.2
   001754      1  175700             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
   001755      1  175800             MOVE   23  TO WRK-DS-05V00                           NC1724.2 82
   001756      1  175900             MOVE   -4  TO WRK-DS-02V00                           NC1724.2 56
   001757         176000     END-DIVIDE                                                   NC1724.2
   001758         176100     MOVE    99    TO WRK-CS-18V00.                               NC1724.2 69
   001759         176200     GO TO   DIV-TEST-F2-25-1.                                    NC1724.2 1764
   001760         176300 DIV-DELETE-F2-25-1.                                              NC1724.2
   001761         176400     PERFORM DE-LETE.                                             NC1724.2 329
   001762         176500     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001763         176600     GO TO   DIV-INIT-F2-26.                                      NC1724.2 1825
   001764         176700 DIV-TEST-F2-25-1.                                                NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800     MOVE   "DIV-TEST-F2-25-1" TO PAR-NAME.                       NC1724.2 177
   001766         176900     IF      WRK-XN-00001 = "1"                                   NC1724.2 51
   001767      1  177000             PERFORM PASS                                         NC1724.2 327
   001768      1  177100             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001769         177200     ELSE                                                         NC1724.2
   001770      1  177300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001771      1  177400             MOVE   "1"           TO CORRECT-X                    NC1724.2 201
   001772      1  177500             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1724.2 182
   001773      1  177600             PERFORM FAIL                                         NC1724.2 328
   001774      1  177700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001775         177800     ADD 1 TO REC-CT.                                             NC1724.2 224
   001776         177900 DIV-TEST-F2-25-2.                                                NC1724.2
   001777         178000     MOVE   "DIV-TEST-F2-25-2" TO PAR-NAME.                       NC1724.2 177
   001778         178100     IF      WRK-DS-02V00 = -4                                    NC1724.2 56
   001779      1  178200             PERFORM PASS                                         NC1724.2 327
   001780      1  178300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001781         178400     ELSE                                                         NC1724.2
   001782      1  178500             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1724.2 56 189
   001783      1  178600             MOVE   -4            TO CORRECT-N                    NC1724.2 203
   001784      1  178700             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1724.2 182
   001785      1  178800             PERFORM FAIL                                         NC1724.2 328
   001786      1  178900             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001787         179000     ADD     1 TO REC-CT.                                         NC1724.2 224
   001788         179100 DIV-TEST-F2-25-3.                                                NC1724.2
   001789         179200     MOVE   "DIV-TEST-F2-25-3" TO PAR-NAME.                       NC1724.2 177
   001790         179300     IF      WRK-DS-05V00 = 23                                    NC1724.2 82
   001791      1  179400             PERFORM PASS                                         NC1724.2 327
   001792      1  179500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001793         179600     ELSE                                                         NC1724.2
   001794      1  179700             MOVE    WRK-DS-05V00 TO COMPUTED-N                   NC1724.2 82 189
   001795      1  179800             MOVE    23           TO CORRECT-N                    NC1724.2 203
   001796      1  179900             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1724.2 182
   001797      1  180000             PERFORM FAIL                                         NC1724.2 328
   001798      1  180100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001799         180200     ADD     1 TO REC-CT.                                         NC1724.2 224
   001800         180300 DIV-TEST-F2-25-4.                                                NC1724.2
   001801         180400     MOVE   "DIV-TEST-F2-25-4" TO PAR-NAME.                       NC1724.2 177
   001802         180500     IF      DIV10   = 0                                          NC1724.2 170
   001803      1  180600             PERFORM PASS                                         NC1724.2 327
   001804      1  180700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001805         180800     ELSE                                                         NC1724.2
   001806      1  180900             MOVE    DIV10        TO COMPUTED-N                   NC1724.2 170 189
   001807      1  181000             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001808      1  181100             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1724.2 182
   001809      1  181200             PERFORM FAIL                                         NC1724.2 328
   001810      1  181300             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001811         181400     ADD     1 TO REC-CT.                                         NC1724.2 224
   001812         181500 DIV-TEST-F2-25-5.                                                NC1724.2
   001813         181600     MOVE   "DIV-TEST-F2-25-5" TO PAR-NAME.                       NC1724.2 177
   001814         181700     IF      WRK-CS-18V00 = 000000000000000099                    NC1724.2 69
   001815      1  181800             PERFORM PASS                                         NC1724.2 327
   001816      1  181900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001817         182000     ELSE                                                         NC1724.2
   001818      1  182100             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1724.2 69 189
   001819      1  182200             MOVE    99           TO CORRECT-N                    NC1724.2 203
   001820      1  182300             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1724.2 182
   001821      1  182400             PERFORM FAIL                                         NC1724.2 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822      1  182500             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001823         182600*                                                                 NC1724.2
   001824         182700*                                                                 NC1724.2
   001825         182800 DIV-INIT-F2-26.                                                  NC1724.2
   001826         182900*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   001827         183000*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1724.2
   001828         183100     MOVE   "DIV-TEST-F2-26" TO PAR-NAME.                         NC1724.2 177
   001829         183200     MOVE   "1V-41 6.4.3"      TO ANSI-REFERENCE.                 NC1724.2 233
   001830         183300     MOVE    1      TO REC-CT.                                    NC1724.2 224
   001831         183400     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1724.2 79 58
   001832         183500     MOVE    0      TO WRK-DS-05V00.                              NC1724.2 82
   001833         183600     MOVE    0      TO WRK-DS-02V00.                              NC1724.2 56
   001834         183700     MOVE   "0"     TO WRK-XN-00001.                              NC1724.2 51
   001835         183800     MOVE    0      TO WRK-CS-18V00.                              NC1724.2 69
   001836         183900 DIV-TEST-F2-26-0.                                                NC1724.2
   001837         184000     DIVIDE  A18ONES-DS-09V09 INTO WRK-DS-09V09                   NC1724.2 79 58
   001838         184100      GIVING WRK-DS-09V09                                         NC1724.2 58
   001839         184200          ON SIZE ERROR                                           NC1724.2
   001840      1  184300             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
   001841      1  184400             MOVE   23  TO WRK-DS-05V00                           NC1724.2 82
   001842      1  184500             MOVE   -4  TO WRK-DS-02V00                           NC1724.2 56
   001843         184600      END-DIVIDE                                                  NC1724.2
   001844         184700      MOVE   99 TO WRK-CS-18V00.                                  NC1724.2 69
   001845         184800     GO TO   DIV-TEST-F2-26-1.                                    NC1724.2 1850
   001846         184900 DIV-DELETE-F2-26-1.                                              NC1724.2
   001847         185000     PERFORM DE-LETE.                                             NC1724.2 329
   001848         185100     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001849         185200     GO TO   DIV-INIT-F2-27.                                      NC1724.2 1914
   001850         185300 DIV-TEST-F2-26-1.                                                NC1724.2
   001851         185400     MOVE   "DIV-TEST-F2-26-1" TO PAR-NAME.                       NC1724.2 177
   001852         185500     IF      WRK-XN-00001 = "0"                                   NC1724.2 51
   001853      1  185600             PERFORM PASS                                         NC1724.2 327
   001854      1  185700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001855         185800     ELSE                                                         NC1724.2
   001856      1  185900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001857      1  186000             MOVE   "0"           TO CORRECT-X                    NC1724.2 201
   001858      1  186100             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1724.2
   001859      1  186200                  TO RE-MARK                                      NC1724.2 182
   001860      1  186300             PERFORM FAIL                                         NC1724.2 328
   001861      1  186400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001862         186500     ADD     1 TO REC-CT.                                         NC1724.2 224
   001863         186600 DIV-TEST-F2-26-2.                                                NC1724.2
   001864         186700     MOVE   "DIV-TEST-F2-26-2" TO PAR-NAME.                       NC1724.2 177
   001865         186800     IF      WRK-DS-02V00  = 0                                    NC1724.2 56
   001866      1  186900             PERFORM PASS                                         NC1724.2 327
   001867      1  187000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001868         187100     ELSE                                                         NC1724.2
   001869      1  187200             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1724.2 56 189
   001870      1  187300             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001871      1  187400             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1724.2
   001872      1  187500                  TO RE-MARK                                      NC1724.2 182
   001873      1  187600             PERFORM FAIL                                         NC1724.2 328
   001874      1  187700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001875         187800     ADD     1 TO REC-CT.                                         NC1724.2 224
   001876         187900 DIV-TEST-F2-26-3.                                                NC1724.2
   001877         188000     MOVE   "DIV-TEST-F2-26-3" TO PAR-NAME.                       NC1724.2 177
   001878         188100     IF      WRK-DS-05V00 = 0                                     NC1724.2 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879      1  188200             PERFORM PASS                                         NC1724.2 327
   001880      1  188300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001881         188400     ELSE                                                         NC1724.2
   001882      1  188500             MOVE    WRK-DS-05V00 TO COMPUTED-N                   NC1724.2 82 189
   001883      1  188600             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001884      1  188700             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1724.2
   001885      1  188800                  TO RE-MARK                                      NC1724.2 182
   001886      1  188900             PERFORM FAIL                                         NC1724.2 328
   001887      1  189000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001888         189100     ADD     1 TO REC-CT.                                         NC1724.2 224
   001889         189200 DIV-TEST-F2-26-4.                                                NC1724.2
   001890         189300     MOVE   "DIV-TEST-F2-26-4" TO PAR-NAME.                       NC1724.2 177
   001891         189400     IF      WRK-DS-18V00-S  =   000000001000000000               NC1724.2 59
   001892      1  189500             PERFORM PASS                                         NC1724.2 327
   001893      1  189600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001894         189700     ELSE                                                         NC1724.2
   001895      1  189800             MOVE    WRK-DS-18V00-S     TO COMPUTED-N             NC1724.2 59 189
   001896      1  189900             MOVE    000000001000000000 TO CORRECT-18V0           NC1724.2 208
   001897      1  190000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001898      1  190100             PERFORM FAIL                                         NC1724.2 328
   001899      1  190200             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001900         190300     ADD     1 TO REC-CT.                                         NC1724.2 224
   001901         190400 DIV-TEST-F2-26-5.                                                NC1724.2
   001902         190500     MOVE   "DIV-TEST-F2-26-5" TO PAR-NAME.                       NC1724.2 177
   001903         190600     IF      WRK-CS-18V00 = 000000000000000099                    NC1724.2 69
   001904      1  190700             PERFORM PASS                                         NC1724.2 327
   001905      1  190800             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001906         190900     ELSE                                                         NC1724.2
   001907      1  191000             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1724.2 69 189
   001908      1  191100             MOVE    99           TO CORRECT-N                    NC1724.2 203
   001909      1  191200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1724.2 182
   001910      1  191300             PERFORM FAIL                                         NC1724.2 328
   001911      1  191400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001912         191500*                                                                 NC1724.2
   001913         191600*                                                                 NC1724.2
   001914         191700 DIV-INIT-F2-27.                                                  NC1724.2
   001915         191800     MOVE   "DIVIDE INTO GIVING" TO FEATURE.                      NC1724.2 173
   001916         191900*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   001917         192000*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1724.2
   001918         192100     MOVE    0      TO WRK-CS-18V00.                              NC1724.2 69
   001919         192200     MOVE   "0"     TO WRK-XN-00001.                              NC1724.2 51
   001920         192300     MOVE    0      TO WRK-DS-05V00.                              NC1724.2 82
   001921         192400     MOVE    0      TO WRK-DS-02V00.                              NC1724.2 56
   001922         192500     MOVE    0      TO DIV10.                                     NC1724.2 170
   001923         192600     MOVE    1      TO REC-CT.                                    NC1724.2 224
   001924         192700     MOVE    44.1   TO DIV2.                                      NC1724.2 155
   001925         192800     MOVE   -9.642  TO DIV4.                                      NC1724.2 159
   001926         192900 DIV-TEST-F2-27-0.                                                NC1724.2
   001927         193000     DIVIDE  DIV4 INTO DIV2                                       NC1724.2 159 155
   001928         193100      GIVING DIV10                                                NC1724.2 170
   001929         193200      NOT ON SIZE ERROR                                           NC1724.2
   001930      1  193300             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
   001931      1  193400             MOVE   23  TO WRK-DS-05V00                           NC1724.2 82
   001932      1  193500             MOVE   -4  TO WRK-DS-02V00                           NC1724.2 56
   001933         193600     END-DIVIDE                                                   NC1724.2
   001934         193700     MOVE    99    TO WRK-CS-18V00.                               NC1724.2 69
   001935         193800     GO TO   DIV-TEST-F2-27-1.                                    NC1724.2 1940
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900 DIV-DELETE-F2-27-1.                                              NC1724.2
   001937         194000     PERFORM DE-LETE.                                             NC1724.2 329
   001938         194100     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   001939         194200     GO TO   DIV-INIT-F2-28.                                      NC1724.2 2004
   001940         194300 DIV-TEST-F2-27-1.                                                NC1724.2
   001941         194400     MOVE   "DIV-TEST-F2-27-1" TO PAR-NAME.                       NC1724.2 177
   001942         194500     IF      WRK-XN-00001 = "0"                                   NC1724.2 51
   001943      1  194600             PERFORM PASS                                         NC1724.2 327
   001944      1  194700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001945         194800     ELSE                                                         NC1724.2
   001946      1  194900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   001947      1  195000             MOVE   "0"           TO CORRECT-X                    NC1724.2 201
   001948      1  195100             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1724.2
   001949      1  195200                  TO RE-MARK                                      NC1724.2 182
   001950      1  195300             PERFORM FAIL                                         NC1724.2 328
   001951      1  195400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001952         195500     ADD     1 TO REC-CT.                                         NC1724.2 224
   001953         195600 DIV-TEST-F2-27-2.                                                NC1724.2
   001954         195700     MOVE   "DIV-TEST-F2-27-2" TO PAR-NAME.                       NC1724.2 177
   001955         195800     IF      WRK-DS-02V00 = 0                                     NC1724.2 56
   001956      1  195900             PERFORM PASS                                         NC1724.2 327
   001957      1  196000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001958         196100     ELSE                                                         NC1724.2
   001959      1  196200             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1724.2 56 189
   001960      1  196300             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001961      1  196400             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1724.2
   001962      1  196500                  TO RE-MARK                                      NC1724.2 182
   001963      1  196600             PERFORM FAIL                                         NC1724.2 328
   001964      1  196700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001965         196800     ADD     1 TO REC-CT.                                         NC1724.2 224
   001966         196900 DIV-TEST-F2-27-3.                                                NC1724.2
   001967         197000     MOVE   "DIV-TEST-F2-27-3" TO PAR-NAME.                       NC1724.2 177
   001968         197100     IF      WRK-DS-05V00 = 0                                     NC1724.2 82
   001969      1  197200             PERFORM PASS                                         NC1724.2 327
   001970      1  197300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001971         197400     ELSE                                                         NC1724.2
   001972      1  197500             MOVE    WRK-DS-05V00 TO COMPUTED-N                   NC1724.2 82 189
   001973      1  197600             MOVE    0            TO CORRECT-N                    NC1724.2 203
   001974      1  197700             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1724.2
   001975      1  197800                  TO RE-MARK                                      NC1724.2 182
   001976      1  197900             PERFORM FAIL                                         NC1724.2 328
   001977      1  198000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001978         198100     ADD     1 TO REC-CT.                                         NC1724.2 224
   001979         198200 DIV-TEST-F2-27-4.                                                NC1724.2
   001980         198300     MOVE   "DIV-TEST-F2-27-4" TO PAR-NAME.                       NC1724.2 177
   001981         198400     IF      DIV10    = 0                                         NC1724.2 170
   001982      1  198500             PERFORM PASS                                         NC1724.2 327
   001983      1  198600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001984         198700     ELSE                                                         NC1724.2
   001985      1  198800             MOVE    DIV10 TO COMPUTED-N                          NC1724.2 170 189
   001986      1  198900             MOVE    0     TO CORRECT-N                           NC1724.2 203
   001987      1  199000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   001988      1  199100             PERFORM FAIL                                         NC1724.2 328
   001989      1  199200             PERFORM PRINT-DETAIL.                                NC1724.2 331
   001990         199300     ADD     1 TO REC-CT.                                         NC1724.2 224
   001991         199400 DIV-TEST-F2-27-5.                                                NC1724.2
   001992         199500     MOVE   "DIV-TEST-F2-27-5" TO PAR-NAME.                       NC1724.2 177
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993         199600     IF      WRK-CS-18V00 = 000000000000000099                    NC1724.2 69
   001994      1  199700             PERFORM PASS                                         NC1724.2 327
   001995      1  199800             PERFORM PRINT-DETAIL                                 NC1724.2 331
   001996         199900     ELSE                                                         NC1724.2
   001997      1  200000             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1724.2 69 189
   001998      1  200100             MOVE    99           TO CORRECT-N                    NC1724.2 203
   001999      1  200200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1724.2 182
   002000      1  200300             PERFORM FAIL                                         NC1724.2 328
   002001      1  200400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002002         200500*                                                                 NC1724.2
   002003         200600*                                                                 NC1724.2
   002004         200700 DIV-INIT-F2-28.                                                  NC1724.2
   002005         200800*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   002006         200900*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1724.2
   002007         201000     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1724.2 79 58
   002008         201100     MOVE    1      TO REC-CT.                                    NC1724.2 224
   002009         201200     MOVE    0      TO WRK-DS-05V00.                              NC1724.2 82
   002010         201300     MOVE    0      TO WRK-DS-02V00.                              NC1724.2 56
   002011         201400     MOVE   "0"     TO WRK-XN-00001.                              NC1724.2 51
   002012         201500     MOVE    0      TO WRK-CS-18V00.                              NC1724.2 69
   002013         201600 DIV-TEST-F2-28-0.                                                NC1724.2
   002014         201700     DIVIDE  A18ONES-DS-09V09 INTO WRK-DS-09V09                   NC1724.2 79 58
   002015         201800      GIVING WRK-DS-09V09                                         NC1724.2 58
   002016         201900      NOT ON SIZE ERROR                                           NC1724.2
   002017      1  202000             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
   002018      1  202100             MOVE   23  TO WRK-DS-05V00                           NC1724.2 82
   002019      1  202200             MOVE   -4  TO WRK-DS-02V00                           NC1724.2 56
   002020         202300      END-DIVIDE                                                  NC1724.2
   002021         202400      MOVE   99 TO WRK-CS-18V00.                                  NC1724.2 69
   002022         202500     GO TO   DIV-TEST-F2-28-1.                                    NC1724.2 2027
   002023         202600 DIV-DELETE-F2-28-1.                                              NC1724.2
   002024         202700     PERFORM DE-LETE.                                             NC1724.2 329
   002025         202800     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   002026         202900     GO TO   DIV-INIT-F2-29.                                      NC1724.2 2091
   002027         203000 DIV-TEST-F2-28-1.                                                NC1724.2
   002028         203100     MOVE   "DIV-TEST-F2-28-1" TO PAR-NAME.                       NC1724.2 177
   002029         203200     IF      WRK-XN-00001 = "1"                                   NC1724.2 51
   002030      1  203300             PERFORM PASS                                         NC1724.2 327
   002031      1  203400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002032         203500     ELSE                                                         NC1724.2
   002033      1  203600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   002034      1  203700             MOVE   "1"           TO CORRECT-X                    NC1724.2 201
   002035      1  203800             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   002036      1  203900                  TO RE-MARK                                      NC1724.2 182
   002037      1  204000             PERFORM FAIL                                         NC1724.2 328
   002038      1  204100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002039         204200     ADD     1 TO REC-CT.                                         NC1724.2 224
   002040         204300 DIV-TEST-F2-28-2.                                                NC1724.2
   002041         204400     MOVE   "DIV-TEST-F2-28-2" TO PAR-NAME.                       NC1724.2 177
   002042         204500     IF      WRK-DS-02V00 = -4                                    NC1724.2 56
   002043      1  204600             PERFORM PASS                                         NC1724.2 327
   002044      1  204700             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002045         204800     ELSE                                                         NC1724.2
   002046      1  204900             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1724.2 56 189
   002047      1  205000             MOVE    -4           TO CORRECT-N                    NC1724.2 203
   002048      1  205100             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   002049      1  205200                  TO RE-MARK                                      NC1724.2 182
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050      1  205300             PERFORM FAIL                                         NC1724.2 328
   002051      1  205400             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002052         205500     ADD     1 TO REC-CT.                                         NC1724.2 224
   002053         205600 DIV-TEST-F2-28-3.                                                NC1724.2
   002054         205700     MOVE   "DIV-TEST-F2-28-3" TO PAR-NAME.                       NC1724.2 177
   002055         205800     IF      WRK-DS-05V00 = 23                                    NC1724.2 82
   002056      1  205900             PERFORM PASS                                         NC1724.2 327
   002057      1  206000             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002058         206100     ELSE                                                         NC1724.2
   002059      1  206200             MOVE    WRK-DS-05V00 TO COMPUTED-N                   NC1724.2 82 189
   002060      1  206300             MOVE    23           TO CORRECT-N                    NC1724.2 203
   002061      1  206400             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   002062      1  206500                  TO RE-MARK                                      NC1724.2 182
   002063      1  206600             PERFORM FAIL                                         NC1724.2 328
   002064      1  206700             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002065         206800     ADD     1 TO REC-CT.                                         NC1724.2 224
   002066         206900 DIV-TEST-F2-28-4.                                                NC1724.2
   002067         207000     MOVE   "DIV-TEST-F2-28-4" TO PAR-NAME.                       NC1724.2 177
   002068         207100     IF      WRK-DS-18V00-S  =   000000001000000000               NC1724.2 59
   002069      1  207200             PERFORM PASS                                         NC1724.2 327
   002070      1  207300             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002071         207400     ELSE                                                         NC1724.2
   002072      1  207500             MOVE    WRK-DS-18V00-S     TO COMPUTED-N             NC1724.2 59 189
   002073      1  207600             MOVE    000000001000000000 TO CORRECT-18V0           NC1724.2 208
   002074      1  207700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   002075      1  207800             PERFORM FAIL                                         NC1724.2 328
   002076      1  207900             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002077         208000     ADD     1 TO REC-CT.                                         NC1724.2 224
   002078         208100 DIV-TEST-F2-28-5.                                                NC1724.2
   002079         208200     MOVE   "DIV-TEST-F2-28-5" TO PAR-NAME.                       NC1724.2 177
   002080         208300     IF      WRK-CS-18V00 = 000000000000000099                    NC1724.2 69
   002081      1  208400             PERFORM PASS                                         NC1724.2 327
   002082      1  208500             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002083         208600     ELSE                                                         NC1724.2
   002084      1  208700             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1724.2 69 189
   002085      1  208800             MOVE    99           TO CORRECT-N                    NC1724.2 203
   002086      1  208900             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1724.2 182
   002087      1  209000             PERFORM FAIL                                         NC1724.2 328
   002088      1  209100             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002089         209200*                                                                 NC1724.2
   002090         209300*                                                                 NC1724.2
   002091         209400 DIV-INIT-F2-29.                                                  NC1724.2
   002092         209500*            ==-->    SIZE ERROR CONDITION <--==                  NC1724.2
   002093         209600*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1724.2
   002094         209700     MOVE    1      TO REC-CT.                                    NC1724.2 224
   002095         209800     MOVE    0      TO WRK-CS-18V00.                              NC1724.2 69
   002096         209900     MOVE   "0"     TO WRK-XN-00001.                              NC1724.2 51
   002097         210000     MOVE    0      TO DIV10.                                     NC1724.2 170
   002098         210100     MOVE    44.1   TO DIV2.                                      NC1724.2 155
   002099         210200     MOVE   -9.642  TO DIV4.                                      NC1724.2 159
   002100         210300 DIV-TEST-F2-29-0.                                                NC1724.2
   002101         210400     DIVIDE  DIV4 INTO DIV2                                       NC1724.2 159 155
   002102         210500      GIVING DIV10                                                NC1724.2 170
   002103         210600          ON SIZE ERROR                                           NC1724.2
   002104      1  210700             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
   002105         210800      NOT ON SIZE ERROR                                           NC1724.2
   002106      1  210900             MOVE   "2" TO WRK-XN-00001                           NC1724.2 51
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211000     END-DIVIDE                                                   NC1724.2
   002108         211100     MOVE    99    TO WRK-CS-18V00.                               NC1724.2 69
   002109         211200     GO TO   DIV-TEST-F2-29-1.                                    NC1724.2 2114
   002110         211300 DIV-DELETE-F2-29-1.                                              NC1724.2
   002111         211400     PERFORM DE-LETE.                                             NC1724.2 329
   002112         211500     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   002113         211600     GO TO   DIV-INIT-F2-30.                                      NC1724.2 2152
   002114         211700 DIV-TEST-F2-29-1.                                                NC1724.2
   002115         211800     MOVE   "DIV-TEST-F2-29-1" TO PAR-NAME.                       NC1724.2 177
   002116         211900     IF      WRK-XN-00001 = "1"                                   NC1724.2 51
   002117      1  212000             PERFORM PASS                                         NC1724.2 327
   002118      1  212100             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002119         212200     ELSE                                                         NC1724.2
   002120      1  212300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   002121      1  212400             MOVE   "1"           TO CORRECT-X                    NC1724.2 201
   002122      1  212500             MOVE   "ON SIZE ERROR NOT EXECUTED"                  NC1724.2
   002123      1  212600                  TO RE-MARK                                      NC1724.2 182
   002124      1  212700             PERFORM FAIL                                         NC1724.2 328
   002125      1  212800             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002126         212900     ADD     1 TO REC-CT.                                         NC1724.2 224
   002127         213000 DIV-TEST-F2-29-2.                                                NC1724.2
   002128         213100     MOVE   "DIV-TEST-F2-29-2" TO PAR-NAME.                       NC1724.2 177
   002129         213200     IF      DIV10   =   0                                        NC1724.2 170
   002130      1  213300             PERFORM PASS                                         NC1724.2 327
   002131      1  213400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002132         213500     ELSE                                                         NC1724.2
   002133      1  213600             MOVE    DIV10 TO COMPUTED-N                          NC1724.2 170 189
   002134      1  213700             MOVE    0     TO CORRECT-N                           NC1724.2 203
   002135      1  213800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   002136      1  213900             PERFORM FAIL                                         NC1724.2 328
   002137      1  214000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002138         214100     ADD     1 TO REC-CT.                                         NC1724.2 224
   002139         214200 DIV-TEST-F2-29-3.                                                NC1724.2
   002140         214300     MOVE   "DIV-TEST-F2-29-3" TO PAR-NAME.                       NC1724.2 177
   002141         214400     IF      WRK-CS-18V00 = 000000000000000099                    NC1724.2 69
   002142      1  214500             PERFORM PASS                                         NC1724.2 327
   002143      1  214600             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002144         214700     ELSE                                                         NC1724.2
   002145      1  214800             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1724.2 69 189
   002146      1  214900             MOVE    99           TO CORRECT-N                    NC1724.2 203
   002147      1  215000             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1724.2 182
   002148      1  215100             PERFORM FAIL                                         NC1724.2 328
   002149      1  215200             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002150         215300*                                                                 NC1724.2
   002151         215400*                                                                 NC1724.2
   002152         215500 DIV-INIT-F2-30.                                                  NC1724.2
   002153         215600*            ==--> NO SIZE ERROR CONDITION <--==                  NC1724.2
   002154         215700*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1724.2
   002155         215800     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1724.2 79 58
   002156         215900     MOVE   "0"     TO WRK-XN-00001.                              NC1724.2 51
   002157         216000     MOVE    0      TO WRK-CS-18V00.                              NC1724.2 69
   002158         216100 DIV-TEST-F2-30-0.                                                NC1724.2
   002159         216200     DIVIDE  A18ONES-DS-09V09 INTO WRK-DS-09V09                   NC1724.2 79 58
   002160         216300      GIVING WRK-DS-09V09                                         NC1724.2 58
   002161         216400          ON SIZE ERROR                                           NC1724.2
   002162      1  216500             MOVE   "1" TO WRK-XN-00001                           NC1724.2 51
   002163         216600      NOT ON SIZE ERROR                                           NC1724.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164      1  216700             MOVE   "2" TO WRK-XN-00001                           NC1724.2 51
   002165         216800     END-DIVIDE                                                   NC1724.2
   002166         216900     MOVE   99 TO WRK-CS-18V00.                                   NC1724.2 69
   002167         217000     GO TO   DIV-TEST-F2-30-1.                                    NC1724.2 2172
   002168         217100 DIV-DELETE-F2-30-1.                                              NC1724.2
   002169         217200     PERFORM DE-LETE.                                             NC1724.2 329
   002170         217300     PERFORM PRINT-DETAIL.                                        NC1724.2 331
   002171         217400     GO TO   CCVS-EXIT.                                           NC1724.2 2210
   002172         217500 DIV-TEST-F2-30-1.                                                NC1724.2
   002173         217600     MOVE   "DIV-TEST-F2-30-1" TO PAR-NAME.                       NC1724.2 177
   002174         217700     IF      WRK-XN-00001 = "2"                                   NC1724.2 51
   002175      1  217800             PERFORM PASS                                         NC1724.2 327
   002176      1  217900             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002177         218000     ELSE                                                         NC1724.2
   002178      1  218100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1724.2 51 187
   002179      1  218200             MOVE   "2"           TO CORRECT-X                    NC1724.2 201
   002180      1  218300             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1724.2
   002181      1  218400                  TO RE-MARK                                      NC1724.2 182
   002182      1  218500             PERFORM FAIL                                         NC1724.2 328
   002183      1  218600             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002184         218700     ADD     1 TO REC-CT.                                         NC1724.2 224
   002185         218800 DIV-TEST-F2-30-2.                                                NC1724.2
   002186         218900     MOVE   "DIV-TEST-F2-30-2" TO PAR-NAME.                       NC1724.2 177
   002187         219000     IF      WRK-DS-18V00-S  =   000000001000000000               NC1724.2 59
   002188      1  219100             PERFORM PASS                                         NC1724.2 327
   002189      1  219200             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002190         219300     ELSE                                                         NC1724.2
   002191      1  219400             MOVE    WRK-DS-18V00-S     TO COMPUTED-N             NC1724.2 59 189
   002192      1  219500             MOVE    000000001000000000 TO CORRECT-18V0           NC1724.2 208
   002193      1  219600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1724.2 182
   002194      1  219700             PERFORM FAIL                                         NC1724.2 328
   002195      1  219800             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002196         219900     ADD     1 TO REC-CT.                                         NC1724.2 224
   002197         220000 DIV-TEST-F2-30-3.                                                NC1724.2
   002198         220100     MOVE   "DIV-TEST-F2-30-3" TO PAR-NAME.                       NC1724.2 177
   002199         220200     IF      WRK-CS-18V00 = 000000000000000099                    NC1724.2 69
   002200      1  220300             PERFORM PASS                                         NC1724.2 327
   002201      1  220400             PERFORM PRINT-DETAIL                                 NC1724.2 331
   002202         220500     ELSE                                                         NC1724.2
   002203      1  220600             MOVE    WRK-CS-18V00 TO COMPUTED-N                   NC1724.2 69 189
   002204      1  220700             MOVE    99           TO CORRECT-N                    NC1724.2 203
   002205      1  220800             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1724.2 182
   002206      1  220900             PERFORM FAIL                                         NC1724.2 328
   002207      1  221000             PERFORM PRINT-DETAIL.                                NC1724.2 331
   002208         221100*                                                                 NC1724.2
   002209         221200*                                                                 NC1724.2
   002210         221300 CCVS-EXIT SECTION.                                               NC1724.2
   002211         221400 CCVS-999999.                                                     NC1724.2
   002212         221500     GO TO CLOSE-FILES.                                           NC1724.2 320
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    42
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      233   ANSI-REFERENCE . . . . . . . .  410 417 426 M435 M457 M479 M521 M562 M582 M604 M643 M679 M718 M754 M775 M794
                                            M816 M862 M907 M954 M1002 M1089 M1197 M1305 M1412 M1520 M1630 M1741 M1829
       57   AZERO-DS-05V05 . . . . . . . .  M605 609
       73   A01ONE-CS-00V01. . . . . . . .  757 M1099 1101 1315 M1529 1531
       63   A01ONE-DS-P0801. . . . . . . .  586
      132   A01ONES-CS-18V00
      134   A02THREES-CS-18V00 . . . . . .  778 797 797
       83   A02TWOS-DS-03V02 . . . . . . .  722
       81   A02TWOS-DU-02V00 . . . . . . .  565 722
       60   A05ONES-DS-00V05 . . . . . . .  684
       46   A06THREES-DS-03V03
       49   A08TWOS-DS-02V06
       52   A10ONES-DS-10V00
       61   A12ONES-DS-12V00
       54   A12THREES-DS-06V06
      140   A14TWOS-CU-18V00
      138   A16NINES-CU-18V00
       79   A18ONES-DS-09V09 . . . . . . .  644 647 863 867 955 959 1831 1837 2007 2014 2155 2159
       66   A18ONES-DS-18V00
      136   A18SIXES-CU-18V00. . . . . . .  778
       71   A99-CS-02V00 . . . . . . . . .  757
       75   A99-DS-02V00 . . . . . . . . .  M607 609
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
      188   COMPUTED-A . . . . . . . . . .  189 191 192 193 194 422 425 M473 M633 M666 M708 M744
      189   COMPUTED-N . . . . . . . . . .  M451 M514 M556 M576 M698 M734 M768 M836 M928 M1030 M1040 M1050 M1060 M1070 M1080
                                            M1122 M1133 M1144 M1155 M1166 M1177 M1229 M1240 M1251 M1262 M1273 M1284 M1336
                                            M1347 M1358 M1369 M1380 M1391 M1444 M1455 M1466 M1477 M1488 M1499 M1554 M1565
                                            M1576 M1587 M1598 M1609 M1665 M1676 M1687 M1698 M1709 M1720 M1782 M1794 M1806
                                            M1818 M1869 M1882 M1895 M1907 M1959 M1972 M1985 M1997 M2046 M2059 M2072 M2084
                                            M2133 M2145 M2191 M2203
      187   COMPUTED-X . . . . . . . . . .  M339 407 M497 M538 M539 M848 M893 M940 M987 M1188 M1296 M1403 M1511 M1621 M1732
                                            M1770 M1856 M1946 M2033 M2120 M2178
      191   COMPUTED-0V18
      193   COMPUTED-14V4
      195   COMPUTED-18V0. . . . . . . . .  M598 M622 M659 M785 M803 M880 M974
      192   COMPUTED-4V14
      211   COR-ANSI-REFERENCE . . . . . .  M417 M419
      202   CORRECT-A. . . . . . . . . . .  203 204 205 206 207 423 425 M474 M632 M667 M707 M743
      203   CORRECT-N. . . . . . . . . . .  M452 M515 M557 M575 M697 M733 M767 M837 M929 M1031 M1041 M1051 M1061 M1071 M1081
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    43
0 Defined   Cross-reference of data names   References

0                                           M1123 M1134 M1145 M1156 M1167 M1178 M1230 M1241 M1252 M1263 M1274 M1285 M1337
                                            M1348 M1359 M1370 M1381 M1392 M1445 M1456 M1467 M1478 M1489 M1500 M1555 M1566
                                            M1577 M1588 M1599 M1610 M1666 M1677 M1688 M1699 M1710 M1721 M1783 M1795 M1807
                                            M1819 M1870 M1883 M1908 M1960 M1973 M1986 M1998 M2047 M2060 M2085 M2134 M2146
                                            M2204
      201   CORRECT-X. . . . . . . . . . .  M340 409 M498 M849 M892 M941 M986 M1189 M1297 M1404 M1512 M1622 M1733 M1771 M1857
                                            M1947 M2034 M2121 M2179
      204   CORRECT-0V18
      206   CORRECT-14V4
      208   CORRECT-18V0 . . . . . . . . .  M597 M621 M658 M784 M802 M879 M973 M1896 M2073 M2192
      205   CORRECT-4V14
      207   CR-18V0
      225   DELETE-COUNTER . . . . . . . .  M329 358 374 376
      167   DIV-DATA-2
      161   DIV-02LEVEL-1
      152   DIVIDE-DATA
      153   DIV1 . . . . . . . . . . . . .  M458 461
      170   DIV10. . . . . . . . . . . . .  M482 M485 505 514 M819 M825 835 836 M909 M915 927 928 M1746 M1752 1802 1806 M1922
                                            M1928 1981 1985 M2097 M2102 2129 2133
      155   DIV2 . . . . . . . . . . . . .  M436 439 M481 485 M821 824 M911 914 M1748 1751 M1924 1927 M2098 2101
      157   DIV3
      159   DIV4 . . . . . . . . . . . . .  M480 485 M822 824 M912 914 M1749 1751 M1925 1927 M2099 2101
      162   DIV5
      164   DIV6
      165   DIV7
      168   DIV8 . . . . . . . . . . . . .  M437 M439 441 451 M522 M525 546 556
      169   DIV9 . . . . . . . . . . . . .  M459 M461 463 473
      180   DOTVALUE . . . . . . . . . . .  M334
      231   DUMMY-HOLD . . . . . . . . . .  M388 398
       43   DUMMY-RECORD . . . . . . . . .  M344 M345 M346 M347 M349 M350 M351 M353 M355 M364 M371 M378 M383 M384 388 M389
                                            390 M391 M392 M393 M394 M395 M396 M397 M398 402 M403 M412 M427
      278   ENDER-DESC . . . . . . . . . .  M366 M377 M382
      226   ERROR-COUNTER. . . . . . . . .  M328 357 367 370
      230   ERROR-HOLD . . . . . . . . . .  M357 M358 M358 M359 362
      276   ERROR-TOTAL. . . . . . . . . .  M368 M370 M375 M376 M380 M381
      173   FEATURE. . . . . . . . . . . .  M434 M771 M998 M1915
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
      177   PAR-NAME . . . . . . . . . . .  M341 M454 M476 M502 M518 M543 M559 M579 M601 M626 M640 M662 M676 M701 M715 M737
                                            M751 M772 M791 M809 M817 M834 M846 M861 M877 M890 M906 M926 M938 M953 M971 M984
                                            M1001 M1088 M1196 M1304 M1411 M1519 M1629 M1740 M1765 M1777 M1789 M1801 M1813
                                            M1828 M1851 M1864 M1877 M1890 M1902 M1941 M1954 M1967 M1980 M1992 M2028 M2041
                                            M2054 M2067 M2079 M2115 M2128 M2140 M2173 M2186 M2198
      179   PARDOT-X . . . . . . . . . . .  M333
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    44
0 Defined   Cross-reference of data names   References

0     228   PASS-COUNTER . . . . . . . . .  M327 359 361
       41   PRINT-FILE . . . . . . . . . .  37 315 321
       42   PRINT-REC. . . . . . . . . . .  M335 M416 M418
      182   RE-MARK. . . . . . . . . . . .  M330 M342 M499 M516 M540 M554 M623 M634 M668 M709 M745 M838 M850 M882 M895 M930
                                            M942 M976 M989 M1120 M1131 M1142 M1153 M1164 M1175 M1186 M1238 M1249 M1260 M1271
                                            M1282 M1294 M1334 M1345 M1356 M1367 M1378 M1389 M1401 M1453 M1464 M1475 M1486
                                            M1497 M1509 M1552 M1563 M1574 M1585 M1596 M1607 M1619 M1663 M1674 M1685 M1696
                                            M1707 M1718 M1730 M1772 M1784 M1796 M1808 M1820 M1859 M1872 M1885 M1897 M1909
                                            M1949 M1962 M1975 M1987 M1999 M2036 M2049 M2062 M2074 M2086 M2123 M2135 M2147
                                            M2181 M2193 M2205
      224   REC-CT . . . . . . . . . . . .  332 334 341 M820 M844 M864 M888 M910 M936 M957 M982 M1003 M1033 M1043 M1053 M1063
                                            M1073 M1097 M1125 M1136 M1147 M1158 M1169 M1180 M1207 M1232 M1243 M1254 M1265
                                            M1276 M1287 M1313 M1339 M1350 M1361 M1372 M1383 M1394 M1420 M1447 M1458 M1469
                                            M1480 M1491 M1502 M1527 M1557 M1568 M1579 M1590 M1601 M1612 M1638 M1668 M1679
                                            M1690 M1701 M1712 M1723 M1747 M1775 M1787 M1799 M1811 M1830 M1862 M1875 M1888
                                            M1900 M1923 M1952 M1965 M1978 M1990 M2008 M2039 M2052 M2065 M2077 M2094 M2126
                                            M2138 M2184 M2196
      223   REC-SKL-SUB
      232   RECORD-COUNT . . . . . . . . .  M386 387 M399
      183   TEST-COMPUTED. . . . . . . . .  416
      198   TEST-CORRECT . . . . . . . . .  418
      251   TEST-ID. . . . . . . . . . . .  M316
      171   TEST-RESULTS . . . . . . . . .  M317 335
      229   TOTAL-ERROR
       88   WRK-AN-X-18-1
       84   WRK-CS-02V02
       69   WRK-CS-18V00 . . . . . . . . .  M776 M779 781 785 M795 M798 799 803 M1745 M1758 1814 1818 M1835 M1844 1903 1907
                                            M1918 M1934 1993 1997 M2012 M2021 2080 2084 M2095 M2108 2141 2145 M2157 M2166
                                            2199 2203
       77   WRK-DS-01V00 . . . . . . . . .  M563 M565 567 576 M720 M723 725 734
       56   WRK-DS-02V00 . . . . . . . . .  M1744 M1756 1778 1782 M1833 M1842 1865 1869 M1921 M1932 1955 1959 M2010 M2019
                                            2042 2046
       68   WRK-DS-0201P . . . . . . . . .  M680 M685 688
       78   WRK-DS-03V10 . . . . . . . . .  M583 586
       82   WRK-DS-05V00 . . . . . . . . .  M688 689 698 M755 M758 759 768 M1743 M1755 1790 1794 M1832 M1841 1878 1882 M1920
                                            M1931 1968 1972 M2009 M2018 2055 2059
       47   WRK-DS-06V06 . . . . . . . . .  48
       64   WRK-DS-09V08 . . . . . . . . .  65
       58   WRK-DS-09V09 . . . . . . . . .  59 M644 647 M648 M681 684 M863 867 M868 M955 959 M960 M1831 1837 M1838 M2007
                                            2014 M2015 M2155 2159 M2160
      119   WRK-DS-1V0-1
      120   WRK-DS-1V0-2
      121   WRK-DS-1V2-1
       50   WRK-DS-10V00
       76   WRK-DS-12V00
       48   WRK-DS-12V00-S
      126   WRK-DS-16V2-1
       65   WRK-DS-17V00-S
       45   WRK-DS-18V00 . . . . . . . . .  M584 M587 589 598 M605 M610 613 622
       59   WRK-DS-18V00-S . . . . . . . .  650 659 878 880 972 974 1891 1895 2068 2072 2187 2191
      122   WRK-DS-2V0-1
      123   WRK-DS-2V1-1
      124   WRK-DS-2V2-1
      125   WRK-DS-2V2-2
       89   WRK-DU-X-18V0-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    45
0 Defined   Cross-reference of data names   References

0      90   WRK-DU-0V1-1
       92   WRK-DU-0V12-1
       91   WRK-DU-0V2-1
       93   WRK-DU-1V0-1
       94   WRK-DU-1V1-1
       95   WRK-DU-1V1-2 . . . . . . . . .  M1005 1012 M1206 1209 M1422 1424 M1640 1642
       99   WRK-DU-1V17-1
       96   WRK-DU-1V3-1
       97   WRK-DU-1V3-2
       98   WRK-DU-1V5-1
      117   WRK-DU-16V2-1
       70   WRK-DU-18V00
      100   WRK-DU-2P6-1
      101   WRK-DU-2V0-1 . . . . . . . . .  M1004 1012 M1014 1035 1040 M1092 M1098 1101 M1103 1127 1133 M1200 M1205 1209
                                            M1211 1234 1240 M1312 1315 M1317 1341 1347 M1415 M1421 1424 M1426 1449 1455 M1528
                                            1531 M1533 1559 1565 M1633 M1639 1642 M1644 1670 1676
      102   WRK-DU-2V0-2 . . . . . . . . .  M1008 M1016 1055 1060 M1094 M1105 1149 1155 M1202 M1213 1256 1262 M1309 M1319
                                            1363 1369 M1417 M1428 1471 1477 M1524 M1535 1581 1587 M1635 M1646 1692 1698
      103   WRK-DU-2V0-3 . . . . . . . . .  M1010 M1018 1075 1080 M1096 M1107 1171 1177 M1204 M1215 1278 1284 M1311 M1321
                                            1385 1391 M1419 M1430 1493 1499 M1526 M1537 1603 1609 M1637 M1648 1714 1720
      104   WRK-DU-2V1-1 . . . . . . . . .  M1006 M1013 1025 1030 M1091 M1102 1116 1122 M1199 M1210 1224 1229 M1307 M1316
                                            1330 1336 M1414 M1425 1439 1444 M1522 M1532 1548 1554 M1632 M1643 1659 1665
      105   WRK-DU-2V1-2 . . . . . . . . .  M1007 M1015 1045 1050 M1093 M1104 1138 1144 M1201 M1212 1245 1251 M1308 M1318
                                            1352 1358 M1416 M1427 1460 1466 M1523 M1534 1570 1576 M1634 M1645 1681 1687
      106   WRK-DU-2V1-3 . . . . . . . . .  M1009 M1017 1065 1070 M1095 M1106 1160 1166 M1203 M1214 1267 1273 M1310 M1320
                                            1374 1380 M1418 M1429 1482 1488 M1525 M1536 1592 1598 M1636 M1647 1703 1709
      107   WRK-DU-2V2-1
      108   WRK-DU-2V2-2
      109   WRK-DU-2V2-3
      110   WRK-DU-2V2-4
      111   WRK-DU-2V2-5
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
       51   WRK-XN-00001 . . . . . . . . .  M606 M611 629 633 M645 M648 665 M682 M686 704 708 M719 M724 740 744 M865 M870
                                            891 893 M956 M962 M964 985 987 M1090 M1109 1182 1188 M1198 M1217 1289 1296 M1306
                                            M1323 1396 1403 M1413 M1432 1504 1511 M1521 M1539 M1541 1614 1621 M1631 M1650
                                            M1652 1725 1732 M1742 M1754 1766 1770 M1834 M1840 1852 1856 M1919 M1930 1942
                                            1946 M2011 M2017 2029 2033 M2096 M2104 M2106 2116 2120 M2156 M2162 M2164 2174
                                            2178
       87   WRK-XN-18-1. . . . . . . . . .  88 89
       86   XRAY . . . . . . . . . . . . .  M483 M486 488 497 M523 M527 529 538 M818 M827 847 848 M908 M917 M919 939 940
      300   XXCOMPUTED . . . . . . . . . .  M425
      302   XXCORRECT. . . . . . . . . . .  M425
      295   XXINFO . . . . . . . . . . . .  412 427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    46
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
     2210   CCVS-EXIT. . . . . . . . . . .  G2171
     2211   CCVS-999999
      313   CCVS1
      430   CCVS1-EXIT . . . . . . . . . .  G319
      320   CLOSE-FILES. . . . . . . . . .  G2212
      348   COLUMN-NAMES-ROUTINE . . . . .  E318
      329   DE-LETE. . . . . . . . . . . .  P447 P469 P494 P510 P535 P551 P572 P594 P618 P638 P655 P674 P694 P713 P730 P749
                                            P764 P789 P807 P830 P873 P922 P967 P1021 P1112 P1220 P1326 P1435 P1544 P1655
                                            P1761 P1847 P1937 P2024 P2111 P2169
      446   DIV-DELETE-F2-1
      729   DIV-DELETE-F2-10-1
      748   DIV-DELETE-F2-10-2
      763   DIV-DELETE-F2-11
      788   DIV-DELETE-F2-12
      806   DIV-DELETE-F2-13
      829   DIV-DELETE-F2-14-1
      872   DIV-DELETE-F2-15-1
      921   DIV-DELETE-F2-16-1
      966   DIV-DELETE-F2-17-1
     1020   DIV-DELETE-F2-18
     1111   DIV-DELETE-F2-19
      468   DIV-DELETE-F2-2
     1219   DIV-DELETE-F2-20
     1325   DIV-DELETE-F2-21
     1434   DIV-DELETE-F2-22
     1543   DIV-DELETE-F2-23
     1654   DIV-DELETE-F2-24
     1760   DIV-DELETE-F2-25-1
     1846   DIV-DELETE-F2-26-1
     1936   DIV-DELETE-F2-27-1
     2023   DIV-DELETE-F2-28-1
     2110   DIV-DELETE-F2-29-1
      493   DIV-DELETE-F2-3-1
      509   DIV-DELETE-F2-3-2
     2168   DIV-DELETE-F2-30-1
      534   DIV-DELETE-F2-4-1
      550   DIV-DELETE-F2-4-2
      571   DIV-DELETE-F2-5
      593   DIV-DELETE-F2-6
      617   DIV-DELETE-F2-7-1
      637   DIV-DELETE-F2-7-2
      654   DIV-DELETE-F2-8-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    47
0 Defined   Cross-reference of procedures   References

0     673   DIV-DELETE-F2-8-2
      693   DIV-DELETE-F2-9-1
      712   DIV-DELETE-F2-9-2
      449   DIV-FAIL-F2-1. . . . . . . . .  G444
      732   DIV-FAIL-F2-10-1 . . . . . . .  G728
      766   DIV-FAIL-F2-11 . . . . . . . .  G762
      471   DIV-FAIL-F2-2. . . . . . . . .  G466
      496   DIV-FAIL-F2-3-1. . . . . . . .  G491
      512   DIV-FAIL-F2-3-2. . . . . . . .  G506
      537   DIV-FAIL-F2-4-1. . . . . . . .  G532
      553   DIV-FAIL-F2-4-2. . . . . . . .  G547
      574   DIV-FAIL-F2-5. . . . . . . . .  G570
      596   DIV-FAIL-F2-6. . . . . . . . .  G592
      620   DIV-FAIL-F2-7-1. . . . . . . .  G616
      657   DIV-FAIL-F2-8-1. . . . . . . .  G653
      696   DIV-FAIL-F2-9-1. . . . . . . .  G692
      433   DIV-INIT-F2-1
      717   DIV-INIT-F2-10
      753   DIV-INIT-F2-11
      774   DIV-INIT-F2-12
      793   DIV-INIT-F2-13
      813   DIV-INIT-F2-14
      858   DIV-INIT-F2-15 . . . . . . . .  G832
      903   DIV-INIT-F2-16 . . . . . . . .  G875
      950   DIV-INIT-F2-17 . . . . . . . .  G924
      997   DIV-INIT-F2-18 . . . . . . . .  G969
     1085   DIV-INIT-F2-19 . . . . . . . .  G1023
      456   DIV-INIT-F2-2
     1193   DIV-INIT-F2-20 . . . . . . . .  G1114
     1301   DIV-INIT-F2-21 . . . . . . . .  G1222
     1408   DIV-INIT-F2-22 . . . . . . . .  G1328
     1516   DIV-INIT-F2-23 . . . . . . . .  G1437
     1626   DIV-INIT-F2-24 . . . . . . . .  G1546
     1737   DIV-INIT-F2-25 . . . . . . . .  G1657
     1825   DIV-INIT-F2-26 . . . . . . . .  G1763
     1914   DIV-INIT-F2-27 . . . . . . . .  G1849
     2004   DIV-INIT-F2-28 . . . . . . . .  G1939
     2091   DIV-INIT-F2-29 . . . . . . . .  G2026
      478   DIV-INIT-F2-3
     2152   DIV-INIT-F2-30 . . . . . . . .  G2113
      520   DIV-INIT-F2-4
      561   DIV-INIT-F2-5
      581   DIV-INIT-F2-6
      603   DIV-INIT-F2-7
      642   DIV-INIT-F2-8
      678   DIV-INIT-F2-9
      438   DIV-TEST-F2-0
      440   DIV-TEST-F2-1
      721   DIV-TEST-F2-10-1
      739   DIV-TEST-F2-10-2
      756   DIV-TEST-F2-11
      777   DIV-TEST-F2-12-0
      780   DIV-TEST-F2-12-1
      796   DIV-TEST-F2-13
      823   DIV-TEST-F2-14-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    48
0 Defined   Cross-reference of procedures   References

0     833   DIV-TEST-F2-14-1 . . . . . . .  G828
      845   DIV-TEST-F2-14-2
      866   DIV-TEST-F2-15-0
      876   DIV-TEST-F2-15-1 . . . . . . .  G871
      889   DIV-TEST-F2-15-2
      913   DIV-TEST-F2-16-0
      925   DIV-TEST-F2-16-1 . . . . . . .  G920
      937   DIV-TEST-F2-16-2
      958   DIV-TEST-F2-17-0
      970   DIV-TEST-F2-17-1 . . . . . . .  G965
      983   DIV-TEST-F2-17-2
     1011   DIV-TEST-F2-18-0
     1024   DIV-TEST-F2-18-1 . . . . . . .  G1019
     1034   DIV-TEST-F2-18-2
     1044   DIV-TEST-F2-18-3
     1054   DIV-TEST-F2-18-4
     1064   DIV-TEST-F2-18-5
     1074   DIV-TEST-F2-18-6
     1100   DIV-TEST-F2-19-0
     1115   DIV-TEST-F2-19-1 . . . . . . .  G1110
     1126   DIV-TEST-F2-19-2
     1137   DIV-TEST-F2-19-3
     1148   DIV-TEST-F2-19-4
     1159   DIV-TEST-F2-19-5
     1170   DIV-TEST-F2-19-6
     1181   DIV-TEST-F2-19-7
      460   DIV-TEST-F2-2-0
      462   DIV-TEST-F2-2-1
     1208   DIV-TEST-F2-20-0
     1223   DIV-TEST-F2-20-1 . . . . . . .  G1218
     1233   DIV-TEST-F2-20-2
     1244   DIV-TEST-F2-20-3
     1255   DIV-TEST-F2-20-4
     1266   DIV-TEST-F2-20-5
     1277   DIV-TEST-F2-20-6
     1288   DIV-TEST-F2-20-7
     1314   DIV-TEST-F2-21-0
     1329   DIV-TEST-F2-21-1 . . . . . . .  G1324
     1340   DIV-TEST-F2-21-2
     1351   DIV-TEST-F2-21-3
     1362   DIV-TEST-F2-21-4
     1373   DIV-TEST-F2-21-5
     1384   DIV-TEST-F2-21-6
     1395   DIV-TEST-F2-21-7
     1423   DIV-TEST-F2-22-0
     1438   DIV-TEST-F2-22-1 . . . . . . .  G1433
     1448   DIV-TEST-F2-22-2
     1459   DIV-TEST-F2-22-3
     1470   DIV-TEST-F2-22-4
     1481   DIV-TEST-F2-22-5
     1492   DIV-TEST-F2-22-6
     1503   DIV-TEST-F2-22-7
     1530   DIV-TEST-F2-23-0
     1547   DIV-TEST-F2-23-1 . . . . . . .  G1542
     1558   DIV-TEST-F2-23-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    49
0 Defined   Cross-reference of procedures   References

0    1569   DIV-TEST-F2-23-3
     1580   DIV-TEST-F2-23-4
     1591   DIV-TEST-F2-23-5
     1602   DIV-TEST-F2-23-6
     1613   DIV-TEST-F2-23-7
     1641   DIV-TEST-F2-24-0
     1658   DIV-TEST-F2-24-1 . . . . . . .  G1653
     1669   DIV-TEST-F2-24-2
     1680   DIV-TEST-F2-24-3
     1691   DIV-TEST-F2-24-4
     1702   DIV-TEST-F2-24-5
     1713   DIV-TEST-F2-24-6
     1724   DIV-TEST-F2-24-7
     1750   DIV-TEST-F2-25-0
     1764   DIV-TEST-F2-25-1 . . . . . . .  G1759
     1776   DIV-TEST-F2-25-2
     1788   DIV-TEST-F2-25-3
     1800   DIV-TEST-F2-25-4
     1812   DIV-TEST-F2-25-5
     1836   DIV-TEST-F2-26-0
     1850   DIV-TEST-F2-26-1 . . . . . . .  G1845
     1863   DIV-TEST-F2-26-2
     1876   DIV-TEST-F2-26-3
     1889   DIV-TEST-F2-26-4
     1901   DIV-TEST-F2-26-5
     1926   DIV-TEST-F2-27-0
     1940   DIV-TEST-F2-27-1 . . . . . . .  G1935
     1953   DIV-TEST-F2-27-2
     1966   DIV-TEST-F2-27-3
     1979   DIV-TEST-F2-27-4
     1991   DIV-TEST-F2-27-5
     2013   DIV-TEST-F2-28-0
     2027   DIV-TEST-F2-28-1 . . . . . . .  G2022
     2040   DIV-TEST-F2-28-2
     2053   DIV-TEST-F2-28-3
     2066   DIV-TEST-F2-28-4
     2078   DIV-TEST-F2-28-5
     2100   DIV-TEST-F2-29-0
     2114   DIV-TEST-F2-29-1 . . . . . . .  G2109
     2127   DIV-TEST-F2-29-2
     2139   DIV-TEST-F2-29-3
      484   DIV-TEST-F2-3-0
      487   DIV-TEST-F2-3-1
      504   DIV-TEST-F2-3-2
     2158   DIV-TEST-F2-30-0
     2172   DIV-TEST-F2-30-1 . . . . . . .  G2167
     2185   DIV-TEST-F2-30-2
     2197   DIV-TEST-F2-30-3
      524   DIV-TEST-F2-4-0
      528   DIV-TEST-F2-4-1
      545   DIV-TEST-F2-4-2
      564   DIV-TEST-F2-5-0
      566   DIV-TEST-F2-5-1
      585   DIV-TEST-F2-6-0
      588   DIV-TEST-F2-6-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    50
0 Defined   Cross-reference of procedures   References

0     608   DIV-TEST-F2-7-0
      612   DIV-TEST-F2-7-1
      628   DIV-TEST-F2-7-2
      646   DIV-TEST-F2-8-0
      649   DIV-TEST-F2-8-1
      664   DIV-TEST-F2-8-2
      683   DIV-TEST-F2-9-0
      687   DIV-TEST-F2-9-1
      703   DIV-TEST-F2-9-2
      453   DIV-WRITE-F2-1 . . . . . . . .  G445 G448
      736   DIV-WRITE-F2-10-1. . . . . . .  G727 G731
      750   DIV-WRITE-F2-10-2. . . . . . .  G742 G747
      770   DIV-WRITE-F2-11. . . . . . . .  G761 G765
      790   DIV-WRITE-F2-12. . . . . . . .  G783 G787
      808   DIV-WRITE-F2-13. . . . . . . .  G801 G805
      475   DIV-WRITE-F2-2 . . . . . . . .  G467 G470
      501   DIV-WRITE-F2-3-1 . . . . . . .  G492 G495
      517   DIV-WRITE-F2-3-2 . . . . . . .  G508 G511
      542   DIV-WRITE-F2-4-1 . . . . . . .  G533 G536
      558   DIV-WRITE-F2-4-2 . . . . . . .  G549 G552
      578   DIV-WRITE-F2-5 . . . . . . . .  G569 G573
      600   DIV-WRITE-F2-6 . . . . . . . .  G591 G595
      625   DIV-WRITE-F2-7-1 . . . . . . .  G615 G619
      639   DIV-WRITE-F2-7-2 . . . . . . .  G631 G636
      661   DIV-WRITE-F2-8-1 . . . . . . .  G652 G656
      675   DIV-WRITE-F2-8-2 . . . . . . .  G670 G672
      700   DIV-WRITE-F2-9-1 . . . . . . .  G691 G695
      714   DIV-WRITE-F2-9-2 . . . . . . .  G706 G711
      352   END-ROUTINE. . . . . . . . . .  P321
      356   END-ROUTINE-1
      365   END-ROUTINE-12
      373   END-ROUTINE-13 . . . . . . . .  E321
      354   END-RTN-EXIT
      328   FAIL . . . . . . . . . . . . .  P450 P472 P500 P513 P541 P555 P577 P599 P624 P635 P660 P669 P699 P710 P735 P746
                                            P769 P786 P804 P839 P851 P883 P896 P931 P943 P977 P990 P1029 P1039 P1049 P1059
                                            P1069 P1079 P1121 P1132 P1143 P1154 P1165 P1176 P1187 P1228 P1239 P1250 P1261
                                            P1272 P1283 P1295 P1335 P1346 P1357 P1368 P1379 P1390 P1402 P1443 P1454 P1465
                                            P1476 P1487 P1498 P1510 P1553 P1564 P1575 P1586 P1597 P1608 P1620 P1664 P1675
                                            P1686 P1697 P1708 P1719 P1731 P1773 P1785 P1797 P1809 P1821 P1860 P1873 P1886
                                            P1898 P1910 P1950 P1963 P1976 P1988 P2000 P2037 P2050 P2063 P2075 P2087 P2124
                                            P2136 P2148 P2182 P2194 P2206
      406   FAIL-ROUTINE . . . . . . . . .  P337
      420   FAIL-ROUTINE-EX. . . . . . . .  E337 G414
      415   FAIL-ROUTINE-WRITE . . . . . .  G408 G409
      343   HEAD-ROUTINE . . . . . . . . .  P318
      326   INSPT
      314   OPEN-FILES
      327   PASS . . . . . . . . . . . . .  P442 P464 P489 P507 P530 P548 P568 P590 P614 P630 P651 P671 P690 P705 P726 P741
                                            P760 P782 P800 P842 P854 P886 P899 P934 P946 P980 P993 P1026 P1036 P1046 P1056
                                            P1066 P1076 P1117 P1128 P1139 P1150 P1161 P1172 P1183 P1225 P1235 P1246 P1257
                                            P1268 P1279 P1290 P1331 P1342 P1353 P1364 P1375 P1386 P1397 P1440 P1450 P1461
                                            P1472 P1483 P1494 P1505 P1549 P1560 P1571 P1582 P1593 P1604 P1615 P1660 P1671
                                            P1682 P1693 P1704 P1715 P1726 P1767 P1779 P1791 P1803 P1815 P1853 P1866 P1879
                                            P1892 P1904 P1943 P1956 P1969 P1982 P1994 P2030 P2043 P2056 P2069 P2081 P2117
                                            P2130 P2142 P2175 P2188 P2200
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    51
0 Defined   Cross-reference of procedures   References

0     331   PRINT-DETAIL . . . . . . . . .  P455 P477 P503 P519 P544 P560 P580 P602 P627 P641 P663 P677 P702 P716 P738 P752
                                            P773 P792 P810 P831 P840 P843 P852 P855 P874 P884 P887 P897 P900 P923 P932 P935
                                            P944 P947 P968 P978 P981 P991 P994 P1022 P1027 P1032 P1037 P1042 P1047 P1052
                                            P1057 P1062 P1067 P1072 P1077 P1082 P1113 P1118 P1124 P1129 P1135 P1140 P1146
                                            P1151 P1157 P1162 P1168 P1173 P1179 P1184 P1190 P1221 P1226 P1231 P1236 P1242
                                            P1247 P1253 P1258 P1264 P1269 P1275 P1280 P1286 P1291 P1298 P1327 P1332 P1338
                                            P1343 P1349 P1354 P1360 P1365 P1371 P1376 P1382 P1387 P1393 P1398 P1405 P1436
                                            P1441 P1446 P1451 P1457 P1462 P1468 P1473 P1479 P1484 P1490 P1495 P1501 P1506
                                            P1513 P1545 P1550 P1556 P1561 P1567 P1572 P1578 P1583 P1589 P1594 P1600 P1605
                                            P1611 P1616 P1623 P1656 P1661 P1667 P1672 P1678 P1683 P1689 P1694 P1700 P1705
                                            P1711 P1716 P1722 P1727 P1734 P1762 P1768 P1774 P1780 P1786 P1792 P1798 P1804
                                            P1810 P1816 P1822 P1848 P1854 P1861 P1867 P1874 P1880 P1887 P1893 P1899 P1905
                                            P1911 P1938 P1944 P1951 P1957 P1964 P1970 P1977 P1983 P1989 P1995 P2001 P2025
                                            P2031 P2038 P2044 P2051 P2057 P2064 P2070 P2076 P2082 P2088 P2112 P2118 P2125
                                            P2131 P2137 P2143 P2149 P2170 P2176 P2183 P2189 P2195 P2201 P2207
      432   SECT-NC172A-001
      324   TERMINATE-CALL
      322   TERMINATE-CCVS
      385   WRITE-LINE . . . . . . . . . .  P335 P336 P344 P345 P346 P347 P349 P350 P351 P353 P355 P364 P372 P378 P383 P384
                                            P412 P416 P418 P427
      401   WRT-LN . . . . . . . . . . . .  P391 P392 P393 P394 P395 P396 P397 P400 P405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    52
0 Defined   Cross-reference of programs     References

        3   NC172A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC172A    Date 06/04/2022  Time 12:00:57   Page    53
0LineID  Message code  Message text

     41  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC172A:
 *    Source records = 2212
 *    Data Division statements = 168
 *    Procedure Division statements = 1423
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1435
0End of compilation 1,  program NC172A,  highest severity 0.
0Return code 0
