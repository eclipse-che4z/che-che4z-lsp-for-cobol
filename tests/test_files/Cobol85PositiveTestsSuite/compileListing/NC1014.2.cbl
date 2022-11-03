1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:36   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:36   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1014.2
   000002         000200 PROGRAM-ID.                                                      NC1014.2
   000003         000300     NC101A.                                                      NC1014.2
   000004         000500*                                                              *  NC1014.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1014.2
   000006         000700*                                                              *  NC1014.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1014.2
   000008         000900*                                                              *  NC1014.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1014.2
   000010         001100*                                                              *  NC1014.2
   000011         001300*                                                              *  NC1014.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1014.2
   000013         001500*                                                              *  NC1014.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1014.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1014.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1014.2
   000017         001900*                                                              *  NC1014.2
   000018         002200*    THIS PROGRAM TESTS THE FORMAT 1 MULTIPLY STATEMENT FOUND     NC1014.2
   000019         002300*    IN LEVEL 1.   ALL COMBINATIONS OF THE OPTIONAL PHRASES       NC1014.2
   000020         002400*    "SIZE ERROR", "NOT SIZE ERROR" AND "END-MULTIPLY" ARE        NC1014.2
   000021         002500*    TESTED, AS WELL AS THE ROUNDED OPTION.                       NC1014.2
   000022         002600*                                                                 NC1014.2
   000023         002700*    VARIOUS COMBINATIONS OF SIGNED AND UNSIGNED NUMERIC          NC1014.2
   000024         002800*    LITERALS, DISPLAY AND COMPUTATIONAL FIELDS ARE USED          NC1014.2
   000025         002900*    AS OPERANDS.                                                 NC1014.2
   000026         003000*                                                                 NC1014.2
   000027         003100                                                                  NC1014.2
   000028         003200                                                                  NC1014.2
   000029         003300 ENVIRONMENT DIVISION.                                            NC1014.2
   000030         003400 CONFIGURATION SECTION.                                           NC1014.2
   000031         003500 SOURCE-COMPUTER.                                                 NC1014.2
   000032         003600     XXXXX082.                                                    NC1014.2
   000033         003700 OBJECT-COMPUTER.                                                 NC1014.2
   000034         003800     XXXXX083.                                                    NC1014.2
   000035         003900 INPUT-OUTPUT SECTION.                                            NC1014.2
   000036         004000 FILE-CONTROL.                                                    NC1014.2
   000037         004100     SELECT PRINT-FILE ASSIGN TO                                  NC1014.2 41
   000038         004200     XXXXX055.                                                    NC1014.2
   000039         004300 DATA DIVISION.                                                   NC1014.2
   000040         004400 FILE SECTION.                                                    NC1014.2
   000041         004500 FD  PRINT-FILE.                                                  NC1014.2

 ==000041==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000042         004600 01  PRINT-REC PICTURE X(120).                                    NC1014.2
   000043         004700 01  DUMMY-RECORD PICTURE X(120).                                 NC1014.2
   000044         004800 WORKING-STORAGE SECTION.                                         NC1014.2
   000045         004900 77  WRK-DS-18V00                PICTURE S9(18).                  NC1014.2
   000046         005000 77  A06THREES-DS-03V03          PICTURE S999V999 VALUE 333.333.  NC1014.2
   000047         005100 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC1014.2
   000048         005200 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06 PICTURE S9(12).        NC1014.2 47
   000049         005300 77  A08TWOS-DS-02V06            PICTURE S99V9(6) VALUE 22.222222.NC1014.2
   000050         005400 77  WRK-DS-10V00                PICTURE S9(10).                  NC1014.2
   000051         005500 77  WRK-XN-00001                PICTURE X.                       NC1014.2
   000052         005600 77  A10ONES-DS-10V00            PICTURE S9(10)                   NC1014.2
   000053         005700                                 VALUE 1111111111.                NC1014.2
   000054         005800 77  A12THREES-DS-06V06          PICTURE S9(6)V9(6)               NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900                                 VALUE 333333.333333.             NC1014.2
   000056         006000 77  WRK-DS-02V00                PICTURE S99.                     NC1014.2
   000057         006100 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC1014.2 IMP
   000058         006200 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1014.2
   000059         006300 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC1014.2 58
   000060         006400 77  A05ONES-DS-00V05            PICTURE SV9(5) VALUE .11111.     NC1014.2
   000061         006500 77  A12ONES-DS-12V00            PICTURE S9(12)                   NC1014.2
   000062         006600                                 VALUE 111111111111.              NC1014.2
   000063         006700 77  A01ONE-DS-P0801             PICTURE SP(8)9 VALUE .000000001. NC1014.2
   000064         006800 77  WRK-DS-09V08                PICTURE S9(9)V9(8).              NC1014.2
   000065         006900 77  WRK-DS-17V00-S REDEFINES WRK-DS-09V08 PICTURE S9(17).        NC1014.2 64
   000066         007000 77  A18ONES-DS-18V00            PICTURE S9(18)                   NC1014.2
   000067         007100                                 VALUE 111111111111111111.        NC1014.2
   000068         007200 77  WRK-DS-0201P                PICTURE S99P.                    NC1014.2
   000069         007300 77  WRK-CS-18V00                PICTURE S9(18) COMPUTATIONAL.    NC1014.2
   000070         007400 77  WRK-DU-18V00                PICTURE 9(18).                   NC1014.2
   000071         007500 77  A99-CS-02V00                PICTURE S99 COMPUTATIONAL        NC1014.2
   000072         007600                                 VALUE 99.                        NC1014.2
   000073         007700 77  A01ONE-CS-00V01             PICTURE SV9 COMPUTATIONAL        NC1014.2
   000074         007800                                 VALUE .1.                        NC1014.2
   000075         007900 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC1014.2
   000076         008000 77  WRK-DS-12V00                PICTURE S9(12).                  NC1014.2
   000077         008100 77  WRK-DS-01V00                PICTURE S9.                      NC1014.2
   000078         008200 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC1014.2
   000079         008300 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC1014.2
   000080         008400                                 VALUE 111111111.111111111.       NC1014.2
   000081         008500 77  A02TWOS-DU-02V00            PICTURE 99  VALUE 22.            NC1014.2
   000082         008600 77  WRK-DS-05V00                PICTURE S9(5).                   NC1014.2
   000083         008700 77  A02TWOS-DS-03V02            PICTURE S999V99 VALUE +022.00.   NC1014.2
   000084         008800 77  WRK-CS-02V02                PICTURE S99V99  COMPUTATIONAL.   NC1014.2
   000085         008900 77  A990-DS-0201P               PICTURE S99P   VALUE +990.       NC1014.2
   000086         009000 77  XRAY                        PICTURE X.                       NC1014.2
   000087         009100 01  WRK-XN-18-1 PIC X(18).                                       NC1014.2
   000088         009200 01  WRK-AN-X-18-1, REDEFINES WRK-XN-18-1 PIC A(18).              NC1014.2 87
   000089         009300 01  WRK-DU-X-18V0-1; REDEFINES WRK-XN-18-1 PIC 9(18).            NC1014.2 87
   000090         009400 01  WRK-DU-0V1-1 PIC V9 VALUE .3.                                NC1014.2
   000091         009500 01  WRK-DU-0V2-1 PIC V99 VALUE .25.                              NC1014.2
   000092         009600 01  WRK-DU-0V12-1 PIC V9(12) VALUE .00001.                       NC1014.2
   000093         009700 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1014.2 IMP
   000094         009800 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1014.2
   000095         009900 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1014.2
   000096         010000 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1014.2
   000097         010100 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1014.2
   000098         010200 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1014.2
   000099         010300 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1014.2
   000100         010400 01  WRK-DU-2P4-1 PIC 99P(4) VALUE 990000.                        NC1014.2
   000101         010500 01  WRK-DU-2V0-1 PIC 99.                                         NC1014.2
   000102         010600 01  WRK-DU-2V0-2 PIC 99.                                         NC1014.2
   000103         010700 01  WRK-DU-2V0-3 PIC 99.                                         NC1014.2
   000104         010800 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1014.2
   000105         010900 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1014.2
   000106         011000 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1014.2
   000107         011100 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1014.2
   000108         011200 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1014.2
   000109         011300 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1014.2
   000110         011400 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1014.2
   000111         011500 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1014.2
   000113         011700 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1014.2
   000114         011800 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1014.2
   000115         011900 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1014.2
   000116         012000 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1014.2
   000117         012100 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1014.2
   000118         012200 01  WRK-NE-X-1 PIC 9(16).99.                                     NC1014.2
   000119         012300 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1014.2
   000120         012400 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1014.2
   000121         012500 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1014.2 IMP
   000122         012600 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1014.2 IMP
   000123         012700 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1014.2 IMP
   000124         012800 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1014.2 IMP
   000125         012900 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1014.2
   000126         013000 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1014.2
   000127         013100 01  WRK-NE-X-2 PIC -9(16).99.                                    NC1014.2
   000128         013200 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC1014.2
   000129         013300 01  WRK-NE-2 PIC $**.99.                                         NC1014.2
   000130         013400 01  WRK-NE-3 PIC $99.99CR.                                       NC1014.2
   000131         013500 01  WRK-NE-4 PIC $*9.99 VALUE ZERO.                              NC1014.2 IMP
   000132         013600 77  A01ONES-CS-18V00   PICTURE S9(18) COMPUTATIONAL              NC1014.2
   000133         013700             VALUE +000000000000000001.                           NC1014.2
   000134         013800 77  A02THREES-CS-18V00 PICTURE S9(18) COMPUTATIONAL              NC1014.2
   000135         013900             VALUE -000000000000000033.                           NC1014.2
   000136         014000 77  A18SIXES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1014.2
   000137         014100             VALUE 666666666666666666.                            NC1014.2
   000138         014200 77  A16NINES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1014.2
   000139         014300             VALUE 009999999999999999.                            NC1014.2
   000140         014400 77  A14TWOS-CU-18V00   PICTURE 9(18) COMPUTATIONAL               NC1014.2
   000141         014500             VALUE 000022222222222222.                            NC1014.2
   000142         014600 01  MULTIPLY-DATA.                                               NC1014.2
   000143         014700     02 MULT1                           PICTURE IS 999V99         NC1014.2
   000144         014800     VALUE IS 80.12.                                              NC1014.2
   000145         014900     02 MULT2                           PICTURE IS 999V999.       NC1014.2
   000146         015000     02 MULT3                           PICTURE IS $$99.99.       NC1014.2
   000147         015100     02 MULT4                           PICTURE IS S99            NC1014.2
   000148         015200     VALUE IS -56.                                                NC1014.2
   000149         015300     02 MULT5                           PICTURE IS 9 VALUE IS 4.  NC1014.2
   000150         015400     02 MULT6                           PICTURE IS 99 VALUE IS    NC1014.2
   000151         015500     20.                                                          NC1014.2
   000152         015600 01  DIVIDE-DATA.                                                 NC1014.2
   000153         015700     02 DIV1                            PICTURE IS 9(4)V99        NC1014.2
   000154         015800     VALUE IS 1620.36.                                            NC1014.2
   000155         015900     02 DIV2                            PICTURE IS 99V9           NC1014.2
   000156         016000     VALUE IS 44.1.                                               NC1014.2
   000157         016100     02 DIV3                            PICTURE IS 9(4)V9         NC1014.2
   000158         016200     VALUE IS 1661.7.                                             NC1014.2
   000159         016300     02 DIV4                            PICTURE IS S9V999         NC1014.2
   000160         016400     VALUE IS -9.642.                                             NC1014.2
   000161         016500     02 DIV-02LEVEL-1.                                            NC1014.2
   000162         016600     03 DIV5                            PICTURE IS V99            NC1014.2
   000163         016700     VALUE IS .82.                                                NC1014.2
   000164         016800     03 DIV6                            PICTURE IS 9 VALUE IS 0.  NC1014.2
   000165         016900     03 DIV7                            PICTURE IS 9V9            NC1014.2
   000166         017000     VALUE IS 9.6.                                                NC1014.2
   000167         017100 01  DIV-DATA-2.                                                  NC1014.2
   000168         017200     02 DIV8                            PICTURE IS 99V9.          NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     02 DIV9                            PICTURE IS ZZ,ZZZ.9.      NC1014.2
   000170         017400     02 DIV10                           PICTURE IS V999.          NC1014.2
   000171         017500 01  TEST-RESULTS.                                                NC1014.2
   000172         017600     02 FILLER                   PIC X      VALUE SPACE.          NC1014.2 IMP
   000173         017700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1014.2 IMP
   000174         017800     02 FILLER                   PIC X      VALUE SPACE.          NC1014.2 IMP
   000175         017900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1014.2 IMP
   000176         018000     02 FILLER                   PIC X      VALUE SPACE.          NC1014.2 IMP
   000177         018100     02  PAR-NAME.                                                NC1014.2
   000178         018200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1014.2 IMP
   000179         018300       03  PARDOT-X              PIC X      VALUE SPACE.          NC1014.2 IMP
   000180         018400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1014.2 IMP
   000181         018500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1014.2 IMP
   000182         018600     02 RE-MARK                  PIC X(61).                       NC1014.2
   000183         018700 01  TEST-COMPUTED.                                               NC1014.2
   000184         018800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1014.2 IMP
   000185         018900     02 FILLER                   PIC X(17)  VALUE                 NC1014.2
   000186         019000            "       COMPUTED=".                                   NC1014.2
   000187         019100     02 COMPUTED-X.                                               NC1014.2
   000188         019200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1014.2 IMP
   000189         019300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1014.2 188
   000190         019400                                 PIC -9(9).9(9).                  NC1014.2
   000191         019500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1014.2 188
   000192         019600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1014.2 188
   000193         019700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1014.2 188
   000194         019800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1014.2 188
   000195         019900         04 COMPUTED-18V0                    PIC -9(18).          NC1014.2
   000196         020000         04 FILLER                           PIC X.               NC1014.2
   000197         020100     03 FILLER PIC X(50) VALUE SPACE.                             NC1014.2 IMP
   000198         020200 01  TEST-CORRECT.                                                NC1014.2
   000199         020300     02 FILLER PIC X(30) VALUE SPACE.                             NC1014.2 IMP
   000200         020400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1014.2
   000201         020500     02 CORRECT-X.                                                NC1014.2
   000202         020600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1014.2 IMP
   000203         020700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1014.2 202
   000204         020800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1014.2 202
   000205         020900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1014.2 202
   000206         021000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1014.2 202
   000207         021100     03      CR-18V0 REDEFINES CORRECT-A.                         NC1014.2 202
   000208         021200         04 CORRECT-18V0                     PIC -9(18).          NC1014.2
   000209         021300         04 FILLER                           PIC X.               NC1014.2
   000210         021400     03 FILLER PIC X(2) VALUE SPACE.                              NC1014.2 IMP
   000211         021500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1014.2 IMP
   000212         021600 01  CCVS-C-1.                                                    NC1014.2
   000213         021700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1014.2
   000214         021800-    "SS  PARAGRAPH-NAME                                          NC1014.2
   000215         021900-    "       REMARKS".                                            NC1014.2
   000216         022000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1014.2 IMP
   000217         022100 01  CCVS-C-2.                                                    NC1014.2
   000218         022200     02 FILLER                     PIC X        VALUE SPACE.      NC1014.2 IMP
   000219         022300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1014.2
   000220         022400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1014.2 IMP
   000221         022500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1014.2
   000222         022600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1014.2 IMP
   000223         022700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1014.2 IMP
   000224         022800 01  REC-CT                        PIC 99       VALUE ZERO.       NC1014.2 IMP
   000225         022900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1014.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1014.2 IMP
   000227         023100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1014.2 IMP
   000228         023200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1014.2 IMP
   000229         023300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1014.2 IMP
   000230         023400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1014.2 IMP
   000231         023500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1014.2 IMP
   000232         023600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1014.2 IMP
   000233         023700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1014.2 IMP
   000234         023800 01  CCVS-H-1.                                                    NC1014.2
   000235         023900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1014.2 IMP
   000236         024000     02  FILLER                    PIC X(42)    VALUE             NC1014.2
   000237         024100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1014.2
   000238         024200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1014.2 IMP
   000239         024300 01  CCVS-H-2A.                                                   NC1014.2
   000240         024400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1014.2 IMP
   000241         024500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1014.2
   000242         024600   02  FILLER                        PIC XXXX   VALUE             NC1014.2
   000243         024700     "4.2 ".                                                      NC1014.2
   000244         024800   02  FILLER                        PIC X(28)  VALUE             NC1014.2
   000245         024900            " COPY - NOT FOR DISTRIBUTION".                       NC1014.2
   000246         025000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1014.2 IMP
   000247         025100                                                                  NC1014.2
   000248         025200 01  CCVS-H-2B.                                                   NC1014.2
   000249         025300   02  FILLER                        PIC X(15)  VALUE             NC1014.2
   000250         025400            "TEST RESULT OF ".                                    NC1014.2
   000251         025500   02  TEST-ID                       PIC X(9).                    NC1014.2
   000252         025600   02  FILLER                        PIC X(4)   VALUE             NC1014.2
   000253         025700            " IN ".                                               NC1014.2
   000254         025800   02  FILLER                        PIC X(12)  VALUE             NC1014.2
   000255         025900     " HIGH       ".                                              NC1014.2
   000256         026000   02  FILLER                        PIC X(22)  VALUE             NC1014.2
   000257         026100            " LEVEL VALIDATION FOR ".                             NC1014.2
   000258         026200   02  FILLER                        PIC X(58)  VALUE             NC1014.2
   000259         026300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1014.2
   000260         026400 01  CCVS-H-3.                                                    NC1014.2
   000261         026500     02  FILLER                      PIC X(34)  VALUE             NC1014.2
   000262         026600            " FOR OFFICIAL USE ONLY    ".                         NC1014.2
   000263         026700     02  FILLER                      PIC X(58)  VALUE             NC1014.2
   000264         026800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1014.2
   000265         026900     02  FILLER                      PIC X(28)  VALUE             NC1014.2
   000266         027000            "  COPYRIGHT   1985 ".                                NC1014.2
   000267         027100 01  CCVS-E-1.                                                    NC1014.2
   000268         027200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1014.2 IMP
   000269         027300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1014.2
   000270         027400     02 ID-AGAIN                     PIC X(9).                    NC1014.2
   000271         027500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1014.2 IMP
   000272         027600 01  CCVS-E-2.                                                    NC1014.2
   000273         027700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1014.2 IMP
   000274         027800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1014.2 IMP
   000275         027900     02 CCVS-E-2-2.                                               NC1014.2
   000276         028000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1014.2 IMP
   000277         028100         03 FILLER                   PIC X      VALUE SPACE.      NC1014.2 IMP
   000278         028200         03 ENDER-DESC               PIC X(44)  VALUE             NC1014.2
   000279         028300            "ERRORS ENCOUNTERED".                                 NC1014.2
   000280         028400 01  CCVS-E-3.                                                    NC1014.2
   000281         028500     02  FILLER                      PIC X(22)  VALUE             NC1014.2
   000282         028600            " FOR OFFICIAL USE ONLY".                             NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1014.2 IMP
   000284         028800     02  FILLER                      PIC X(58)  VALUE             NC1014.2
   000285         028900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1014.2
   000286         029000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1014.2 IMP
   000287         029100     02 FILLER                       PIC X(15)  VALUE             NC1014.2
   000288         029200             " COPYRIGHT 1985".                                   NC1014.2
   000289         029300 01  CCVS-E-4.                                                    NC1014.2
   000290         029400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1014.2 IMP
   000291         029500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1014.2
   000292         029600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1014.2 IMP
   000293         029700     02 FILLER                       PIC X(40)  VALUE             NC1014.2
   000294         029800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1014.2
   000295         029900 01  XXINFO.                                                      NC1014.2
   000296         030000     02 FILLER                       PIC X(19)  VALUE             NC1014.2
   000297         030100            "*** INFORMATION ***".                                NC1014.2
   000298         030200     02 INFO-TEXT.                                                NC1014.2
   000299         030300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1014.2 IMP
   000300         030400       04 XXCOMPUTED                 PIC X(20).                   NC1014.2
   000301         030500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1014.2 IMP
   000302         030600       04 XXCORRECT                  PIC X(20).                   NC1014.2
   000303         030700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1014.2
   000304         030800 01  HYPHEN-LINE.                                                 NC1014.2
   000305         030900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1014.2 IMP
   000306         031000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1014.2
   000307         031100-    "*****************************************".                 NC1014.2
   000308         031200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1014.2
   000309         031300-    "******************************".                            NC1014.2
   000310         031400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1014.2
   000311         031500     "NC101A".                                                    NC1014.2
   000312         031600 PROCEDURE DIVISION.                                              NC1014.2
   000313         031700 CCVS1 SECTION.                                                   NC1014.2
   000314         031800 OPEN-FILES.                                                      NC1014.2
   000315         031900     OPEN     OUTPUT PRINT-FILE.                                  NC1014.2 41
   000316         032000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1014.2 310 251 310 270
   000317         032100     MOVE    SPACE TO TEST-RESULTS.                               NC1014.2 IMP 171
   000318         032200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1014.2 343 348
   000319         032300     GO TO CCVS1-EXIT.                                            NC1014.2 430
   000320         032400 CLOSE-FILES.                                                     NC1014.2
   000321         032500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1014.2 352 373 41
   000322         032600 TERMINATE-CCVS.                                                  NC1014.2
   000323         032700     EXIT PROGRAM.                                                NC1014.2
   000324         032800 TERMINATE-CALL.                                                  NC1014.2
   000325         032900     STOP     RUN.                                                NC1014.2
   000326         033000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1014.2 175 227
   000327         033100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1014.2 175 228
   000328         033200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1014.2 175 226
   000329         033300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1014.2 175 225
   000330         033400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1014.2 182
   000331         033500 PRINT-DETAIL.                                                    NC1014.2
   000332         033600     IF REC-CT NOT EQUAL TO ZERO                                  NC1014.2 224 IMP
   000333      1  033700             MOVE "." TO PARDOT-X                                 NC1014.2 179
   000334      1  033800             MOVE REC-CT TO DOTVALUE.                             NC1014.2 224 180
   000335         033900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1014.2 171 42 385
   000336         034000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1014.2 175 385
   000337      1  034100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1014.2 406 420
   000338      1  034200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1014.2 421 429
   000339         034300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1014.2 IMP 175 IMP 187
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE SPACE TO CORRECT-X.                                     NC1014.2 IMP 201
   000341         034500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1014.2 224 IMP IMP 177
   000342         034600     MOVE     SPACE TO RE-MARK.                                   NC1014.2 IMP 182
   000343         034700 HEAD-ROUTINE.                                                    NC1014.2
   000344         034800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1014.2 234 43 385
   000345         034900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1014.2 239 43 385
   000346         035000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1014.2 248 43 385
   000347         035100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1014.2 260 43 385
   000348         035200 COLUMN-NAMES-ROUTINE.                                            NC1014.2
   000349         035300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1014.2 212 43 385
   000350         035400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1014.2 217 43 385
   000351         035500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1014.2 304 43 385
   000352         035600 END-ROUTINE.                                                     NC1014.2
   000353         035700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1014.2 304 43 385
   000354         035800 END-RTN-EXIT.                                                    NC1014.2
   000355         035900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1014.2 267 43 385
   000356         036000 END-ROUTINE-1.                                                   NC1014.2
   000357         036100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1014.2 226 230 227
   000358         036200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1014.2 230 225 230
   000359         036300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1014.2 228 230
   000360         036400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1014.2
   000361         036500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1014.2 228 290
   000362         036600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1014.2 230 292
   000363         036700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1014.2 289 275
   000364         036800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1014.2 272 43 385
   000365         036900  END-ROUTINE-12.                                                 NC1014.2
   000366         037000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1014.2 278
   000367         037100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1014.2 226 IMP
   000368      1  037200         MOVE "NO " TO ERROR-TOTAL                                NC1014.2 276
   000369         037300         ELSE                                                     NC1014.2
   000370      1  037400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1014.2 226 276
   000371         037500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1014.2 272 43
   000372         037600     PERFORM WRITE-LINE.                                          NC1014.2 385
   000373         037700 END-ROUTINE-13.                                                  NC1014.2
   000374         037800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1014.2 225 IMP
   000375      1  037900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1014.2 276
   000376      1  038000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1014.2 225 276
   000377         038100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1014.2 278
   000378         038200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1014.2 272 43 385
   000379         038300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1014.2 227 IMP
   000380      1  038400          MOVE "NO " TO ERROR-TOTAL                               NC1014.2 276
   000381      1  038500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1014.2 227 276
   000382         038600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1014.2 278
   000383         038700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1014.2 272 43 385
   000384         038800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1014.2 280 43 385
   000385         038900 WRITE-LINE.                                                      NC1014.2
   000386         039000     ADD 1 TO RECORD-COUNT.                                       NC1014.2 232
   000387         039100     IF RECORD-COUNT GREATER 42                                   NC1014.2 232
   000388      1  039200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1014.2 43 231
   000389      1  039300         MOVE SPACE TO DUMMY-RECORD                               NC1014.2 IMP 43
   000390      1  039400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1014.2 43
   000391      1  039500         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1014.2 234 43 401
   000392      1  039600         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1014.2 239 43 401
   000393      1  039700         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1014.2 248 43 401
   000394      1  039800         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1014.2 260 43 401
   000395      1  039900         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1014.2 212 43 401
   000396      1  040000         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1014.2 217 43 401
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1014.2 304 43 401
   000398      1  040200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1014.2 231 43
   000399      1  040300         MOVE ZERO TO RECORD-COUNT.                               NC1014.2 IMP 232
   000400         040400     PERFORM WRT-LN.                                              NC1014.2 401
   000401         040500 WRT-LN.                                                          NC1014.2
   000402         040600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1014.2 43
   000403         040700     MOVE SPACE TO DUMMY-RECORD.                                  NC1014.2 IMP 43
   000404         040800 BLANK-LINE-PRINT.                                                NC1014.2
   000405         040900     PERFORM WRT-LN.                                              NC1014.2 401
   000406         041000 FAIL-ROUTINE.                                                    NC1014.2
   000407         041100     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1014.2 187 IMP
   000408      1  041200            GO TO FAIL-ROUTINE-WRITE.                             NC1014.2 415
   000409         041300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1014.2 201 IMP 415
   000410         041400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1014.2 233 303
   000411         041500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1014.2 298
   000412         041600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1014.2 295 43 385
   000413         041700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1014.2 IMP 303
   000414         041800     GO TO  FAIL-ROUTINE-EX.                                      NC1014.2 420
   000415         041900 FAIL-ROUTINE-WRITE.                                              NC1014.2
   000416         042000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1014.2 183 42 385
   000417         042100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1014.2 233 211
   000418         042200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1014.2 198 42 385
   000419         042300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1014.2 IMP 211
   000420         042400 FAIL-ROUTINE-EX. EXIT.                                           NC1014.2
   000421         042500 BAIL-OUT.                                                        NC1014.2
   000422         042600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1014.2 188 IMP 424
   000423         042700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1014.2 202 IMP 429
   000424         042800 BAIL-OUT-WRITE.                                                  NC1014.2
   000425         042900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1014.2 202 302 188 300
   000426         043000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1014.2 233 303
   000427         043100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1014.2 295 43 385
   000428         043200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1014.2 IMP 303
   000429         043300 BAIL-OUT-EX. EXIT.                                               NC1014.2
   000430         043400 CCVS1-EXIT.                                                      NC1014.2
   000431         043500     EXIT.                                                        NC1014.2
   000432         043600 SECT-NC101A-001 SECTION.                                         NC1014.2
   000433         043700 MPY-INIT-F1-1.                                                   NC1014.2
   000434         043800     MOVE    "MULTIPLY BY" TO FEATURE.                            NC1014.2 173
   000435         043900     MOVE    "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.               NC1014.2 233
   000436         044000     MOVE     80.12 TO MULT1.                                     NC1014.2 143
   000437         044100     MOVE     4     TO MULT5.                                     NC1014.2 149
   000438         044200 MPY-TEST-F1-1.                                                   NC1014.2
   000439         044300     MULTIPLY MULT5 BY MULT1.                                     NC1014.2 149 143
   000440         044400     IF       MULT1 EQUAL TO 320.48                               NC1014.2 143
   000441      1  044500              PERFORM PASS                                        NC1014.2 327
   000442         044600     ELSE                                                         NC1014.2
   000443      1  044700              GO TO MPY-FAIL-F1-1.                                NC1014.2 448
   000444         044800     GO TO    MPY-WRITE-F1-1.                                     NC1014.2 452
   000445         044900 MPY-DELETE-F1-1.                                                 NC1014.2
   000446         045000     PERFORM  DE-LETE.                                            NC1014.2 329
   000447         045100     GO TO    MPY-WRITE-F1-1.                                     NC1014.2 452
   000448         045200 MPY-FAIL-F1-1.                                                   NC1014.2
   000449         045300     PERFORM  FAIL.                                               NC1014.2 328
   000450         045400     MOVE     MULT1 TO COMPUTED-N.                                NC1014.2 143 189
   000451         045500     MOVE     +320.48 TO CORRECT-N.                               NC1014.2 203
   000452         045600 MPY-WRITE-F1-1.                                                  NC1014.2
   000453         045700     MOVE "MPY-TEST-F1-1 " TO PAR-NAME.                           NC1014.2 177
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     PERFORM  PRINT-DETAIL.                                       NC1014.2 331
   000455         045900*                                                                 NC1014.2
   000456         046000 MPY-INIT-F1-2.                                                   NC1014.2
   000457         046100     MOVE    "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.               NC1014.2 233
   000458         046200     MOVE    -56 TO MULT4.                                        NC1014.2 147
   000459         046300 MPY-TEST-F1-2.                                                   NC1014.2
   000460         046400     MULTIPLY -1.3 BY MULT4 ROUNDED.                              NC1014.2 147
   000461         046500     IF       MULT4 EQUAL TO 73                                   NC1014.2 147
   000462      1  046600              PERFORM PASS                                        NC1014.2 327
   000463         046700     ELSE                                                         NC1014.2
   000464      1  046800              GO TO MPY-FAIL-F1-2.                                NC1014.2 469
   000465         046900     GO TO    MPY-WRITE-F1-2.                                     NC1014.2 473
   000466         047000 MPY-DELETE-F1-2.                                                 NC1014.2
   000467         047100     PERFORM  DE-LETE.                                            NC1014.2 329
   000468         047200     GO TO    MPY-WRITE-F1-2.                                     NC1014.2 473
   000469         047300 MPY-FAIL-F1-2.                                                   NC1014.2
   000470         047400     PERFORM  FAIL.                                               NC1014.2 328
   000471         047500     MOVE     MULT4 TO COMPUTED-N.                                NC1014.2 147 189
   000472         047600     MOVE     +73   TO CORRECT-N.                                 NC1014.2 203
   000473         047700 MPY-WRITE-F1-2.                                                  NC1014.2
   000474         047800     MOVE "MPY-TEST-F1-2 " TO PAR-NAME.                           NC1014.2 177
   000475         047900     PERFORM  PRINT-DETAIL.                                       NC1014.2 331
   000476         048000                                                                  NC1014.2
   000477         048100 MPY-INIT-F1-3-1.                                                 NC1014.2
   000478         048200     MOVE    "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.               NC1014.2 233
   000479         048300     MOVE     4 TO MULT5.                                         NC1014.2 149
   000480         048400     MOVE    "A" TO XRAY.                                         NC1014.2 86
   000481         048500 MPY-TEST-F1-3-0.                                                 NC1014.2
   000482         048600     MULTIPLY MULT5 BY MULT5 ON SIZE ERROR                        NC1014.2 149 149
   000483      1  048700              MOVE "K" TO XRAY.                                   NC1014.2 86
   000484         048800 MPY-TEST-F1-3-1.                                                 NC1014.2
   000485         048900     IF       XRAY EQUAL TO "K"                                   NC1014.2 86
   000486      1  049000              PERFORM PASS                                        NC1014.2 327
   000487         049100     ELSE                                                         NC1014.2
   000488      1  049200              GO TO MPY-FAIL-F1-3-1.                              NC1014.2 493
   000489         049300     GO TO    MPY-WRITE-F1-3-1.                                   NC1014.2 498
   000490         049400 MPY-DELETE-F1-3-1.                                               NC1014.2
   000491         049500     PERFORM  DE-LETE.                                            NC1014.2 329
   000492         049600     GO TO    MPY-WRITE-F1-3-1.                                   NC1014.2 498
   000493         049700 MPY-FAIL-F1-3-1.                                                 NC1014.2
   000494         049800     MOVE     XRAY  TO COMPUTED-X.                                NC1014.2 86 187
   000495         049900     MOVE    "A"    TO CORRECT-X.                                 NC1014.2 201
   000496         050000     MOVE    "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.             NC1014.2 182
   000497         050100     PERFORM  FAIL.                                               NC1014.2 328
   000498         050200 MPY-WRITE-F1-3-1.                                                NC1014.2
   000499         050300     MOVE    "MPY-TEST-F1-3-1 " TO PAR-NAME.                      NC1014.2 177
   000500         050400     PERFORM  PRINT-DETAIL.                                       NC1014.2 331
   000501         050500 MPY-TEST-F1-3-2.                                                 NC1014.2
   000502         050600     IF       MULT5 EQUAL TO 4                                    NC1014.2 149
   000503      1  050700              PERFORM PASS                                        NC1014.2 327
   000504         050800     ELSE                                                         NC1014.2
   000505      1  050900              GO TO MPY-FAIL-F1-3-2.                              NC1014.2 510
   000506         051000     GO TO    MPY-WRITE-F1-3-2.                                   NC1014.2 515
   000507         051100 MPY-DELETE-F1-3-2.                                               NC1014.2
   000508         051200     PERFORM  DE-LETE.                                            NC1014.2 329
   000509         051300     GO TO    MPY-WRITE-F1-3-2.                                   NC1014.2 515
   000510         051400 MPY-FAIL-F1-3-2.                                                 NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051500     PERFORM  FAIL.                                               NC1014.2 328
   000512         051600     MOVE     MULT5 TO COMPUTED-N.                                NC1014.2 149 189
   000513         051700     MOVE    +4 TO CORRECT-N.                                     NC1014.2 203
   000514         051800     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1014.2 182
   000515         051900 MPY-WRITE-F1-3-2.                                                NC1014.2
   000516         052000     MOVE    "MPY-TEST-F1-3-2" TO PAR-NAME.                       NC1014.2 177
   000517         052100     PERFORM  PRINT-DETAIL.                                       NC1014.2 331
   000518         052200                                                                  NC1014.2
   000519         052300 MPY-INIT-F1-4-1.                                                 NC1014.2
   000520         052400     MOVE    "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.               NC1014.2 233
   000521         052500     MOVE     20 TO MULT6.                                        NC1014.2 150
   000522         052600     MOVE    "B" TO XRAY.                                         NC1014.2 86
   000523         052700 MPY-TEST-F1-4-O.                                                 NC1014.2
   000524         052800     MULTIPLY 4.99 BY MULT6 ROUNDED ON SIZE ERROR                 NC1014.2 150
   000525      1  052900              MOVE "L" TO XRAY.                                   NC1014.2 86
   000526         053000 MPY-TEST-F1-4-1.                                                 NC1014.2
   000527         053100     IF       XRAY EQUAL TO "L"                                   NC1014.2 86
   000528      1  053200              PERFORM PASS                                        NC1014.2 327
   000529         053300     ELSE                                                         NC1014.2
   000530      1  053400              GO TO MPY-FAIL-F1-4-1.                              NC1014.2 535
   000531         053500     GO TO    MPY-WRITE-F1-4-1.                                   NC1014.2 540
   000532         053600 MPY-DELETE-F1-4-1.                                               NC1014.2
   000533         053700     PERFORM  DE-LETE.                                            NC1014.2 329
   000534         053800     GO TO    MPY-WRITE-F1-4-1.                                   NC1014.2 540
   000535         053900 MPY-FAIL-F1-4-1.                                                 NC1014.2
   000536         054000     MOVE    "L"   TO CORRECT-X.                                  NC1014.2 201
   000537         054100     MOVE     XRAY TO COMPUTED-X.                                 NC1014.2 86 187
   000538         054200     MOVE  "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.               NC1014.2 182
   000539         054300     PERFORM  FAIL.                                               NC1014.2 328
   000540         054400 MPY-WRITE-F1-4-1.                                                NC1014.2
   000541         054500     MOVE    "MPY-TEST-F1-4-1" TO PAR-NAME.                       NC1014.2 177
   000542         054600     PERFORM  PRINT-DETAIL.                                       NC1014.2 331
   000543         054700 MPY-TEST-F1-4-2.                                                 NC1014.2
   000544         054800     IF       MULT6 EQUAL TO 20                                   NC1014.2 150
   000545      1  054900              PERFORM PASS                                        NC1014.2 327
   000546         055000     ELSE                                                         NC1014.2
   000547      1  055100              GO TO MPY-FAIL-F1-4-2.                              NC1014.2 552
   000548         055200     GO TO    MPY-WRITE-F1-4-2.                                   NC1014.2 557
   000549         055300 MPY-DELETE-F1-4-2.                                               NC1014.2
   000550         055400     PERFORM  DE-LETE.                                            NC1014.2 329
   000551         055500     GO TO    MPY-WRITE-F1-4-2.                                   NC1014.2 557
   000552         055600 MPY-FAIL-F1-4-2.                                                 NC1014.2
   000553         055700     PERFORM  FAIL.                                               NC1014.2 328
   000554         055800     MOVE     MULT6 TO COMPUTED-N.                                NC1014.2 150 189
   000555         055900     MOVE     +20 TO CORRECT-N.                                   NC1014.2 203
   000556         056000     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1014.2 182
   000557         056100 MPY-WRITE-F1-4-2.                                                NC1014.2
   000558         056200     MOVE    "MPY-TEST-F1-4-2" TO PAR-NAME.                       NC1014.2 177
   000559         056300     PERFORM  PRINT-DETAIL.                                       NC1014.2 331
   000560         056400                                                                  NC1014.2
   000561         056500 MPY-INIT-F1-5.                                                   NC1014.2
   000562         056600     MOVE    "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.               NC1014.2 233
   000563         056700     MOVE     222222222222 TO WRK-DS-18V00.                       NC1014.2 45
   000564         056800 MPY-TEST-F1-5-0.                                                 NC1014.2
   000565         056900     MULTIPLY A06THREES-DS-03V03 BY WRK-DS-18V00.                 NC1014.2 46 45
   000566         057000 MPY-TEST-F1-5-1.                                                 NC1014.2
   000567         057100     IF  WRK-DS-18V00 EQUAL TO 000074073999999925                 NC1014.2 45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057200         PERFORM PASS                                             NC1014.2 327
   000569      1  057300         GO TO MPY-WRITE-F1-5.                                    NC1014.2 578
   000570         057400     GO TO  MPY-FAIL-F1-5.                                        NC1014.2 574
   000571         057500 MPY-DELETE-F1-5.                                                 NC1014.2
   000572         057600     PERFORM DE-LETE.                                             NC1014.2 329
   000573         057700     GO TO  MPY-WRITE-F1-5.                                       NC1014.2 578
   000574         057800 MPY-FAIL-F1-5.                                                   NC1014.2
   000575         057900     MOVE   000074073999999925 TO CORRECT-18V0.                   NC1014.2 208
   000576         058000     MOVE   WRK-DS-18V00       TO COMPUTED-18V0.                  NC1014.2 45 195
   000577         058100     PERFORM FAIL.                                                NC1014.2 328
   000578         058200 MPY-WRITE-F1-5.                                                  NC1014.2
   000579         058300     MOVE "MPY-TEST-F1-5 " TO PAR-NAME.                           NC1014.2 177
   000580         058400     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000581         058500                                                                  NC1014.2
   000582         058600 MPY-INIT-F1-6.                                                   NC1014.2
   000583         058700     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000584         058800     MOVE    A08TWOS-DS-02V06 TO WRK-DS-06V06.                    NC1014.2 49 47
   000585         058900 MPY-TEST-F1-6-0.                                                 NC1014.2
   000586         059000     MULTIPLY 0.4 BY WRK-DS-06V06 ROUNDED.                        NC1014.2 47
   000587         059100 MPY-TEST-F1-6-1.                                                 NC1014.2
   000588         059200     IF WRK-DS-12V00-S EQUAL TO 000008888889                      NC1014.2 48
   000589      1  059300         PERFORM PASS                                             NC1014.2 327
   000590      1  059400         GO TO MPY-WRITE-F1-6.                                    NC1014.2 599
   000591         059500     GO TO MPY-FAIL-F1-6.                                         NC1014.2 595
   000592         059600 MPY-DELETE-F1-6.                                                 NC1014.2
   000593         059700     PERFORM DE-LETE.                                             NC1014.2 329
   000594         059800     GO TO MPY-WRITE-F1-6.                                        NC1014.2 599
   000595         059900 MPY-FAIL-F1-6.                                                   NC1014.2
   000596         060000     MOVE  WRK-DS-12V00-S     TO COMPUTED-18V0.                   NC1014.2 48 195
   000597         060100     MOVE  000008888889       TO CORRECT-18V0.                    NC1014.2 208
   000598         060200     PERFORM FAIL.                                                NC1014.2 328
   000599         060300 MPY-WRITE-F1-6.                                                  NC1014.2
   000600         060400     MOVE "MPY-TEST-F1-6         " TO PAR-NAME.                   NC1014.2 177
   000601         060500     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000602         060600                                                                  NC1014.2
   000603         060700 MPY-INIT-F1-7.                                                   NC1014.2
   000604         060800     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000605         060900     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   000606         061000     MOVE    A10ONES-DS-10V00 TO WRK-DS-10V00.                    NC1014.2 52 50
   000607         061100 MPY-TEST-F1-7-0.                                                 NC1014.2
   000608         061200     MULTIPLY A12THREES-DS-06V06 BY WRK-DS-10V00                  NC1014.2 54 50
   000609      1  061300         ON SIZE ERROR MOVE "1" TO WRK-XN-00001.                  NC1014.2 51
   000610         061400 MPY-TEST-F1-7-1.                                                 NC1014.2
   000611         061500     IF WRK-DS-10V00 EQUAL TO 1111111111                          NC1014.2 50
   000612      1  061600         PERFORM PASS                                             NC1014.2 327
   000613      1  061700         GO TO MPY-WRITE-F1-7-1.                                  NC1014.2 623
   000614         061800     GO TO MPY-FAIL-F1-7-1.                                       NC1014.2 618
   000615         061900 MPY-DELETE-F1-7-1.                                               NC1014.2
   000616         062000     PERFORM DE-LETE.                                             NC1014.2 329
   000617         062100     GO TO MPY-WRITE-F1-7-1.                                      NC1014.2 623
   000618         062200 MPY-FAIL-F1-7-1.                                                 NC1014.2
   000619         062300     MOVE  WRK-DS-10V00       TO COMPUTED-18V0.                   NC1014.2 50 195
   000620         062400     MOVE  1111111111         TO CORRECT-18V0.                    NC1014.2 208
   000621         062500     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1014.2 182
   000622         062600     PERFORM FAIL.                                                NC1014.2 328
   000623         062700 MPY-WRITE-F1-7-1.                                                NC1014.2
   000624         062800     MOVE "MPY-TEST-F1-7-1         " TO PAR-NAME.                 NC1014.2 177
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000626         063000 MPY-TEST-F1-7-2.                                                 NC1014.2
   000627         063100     IF WRK-XN-00001 EQUAL TO "1"                                 NC1014.2 51
   000628      1  063200         PERFORM PASS                                             NC1014.2 327
   000629      1  063300         GO TO MPY-WRITE-F1-7-2.                                  NC1014.2 637
   000630         063400     MOVE    "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.             NC1014.2 182
   000631         063500     MOVE "1" TO CORRECT-A.                                       NC1014.2 202
   000632         063600     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1014.2 51 188
   000633         063700     PERFORM FAIL.                                                NC1014.2 328
   000634         063800     GO TO MPY-WRITE-F1-7-2.                                      NC1014.2 637
   000635         063900 MPY-DELETE-F1-7-2.                                               NC1014.2
   000636         064000     PERFORM DE-LETE.                                             NC1014.2 329
   000637         064100 MPY-WRITE-F1-7-2.                                                NC1014.2
   000638         064200     MOVE "MPY-TEST-F1-7-2         " TO PAR-NAME.                 NC1014.2 177
   000639         064300     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000640         064400                                                                  NC1014.2
   000641         064500 MPY-INIT-F1-8.                                                   NC1014.2
   000642         064600     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000643         064700     MOVE   "1" TO WRK-XN-00001.                                  NC1014.2 51
   000644         064800     MOVE   -99 TO WRK-DS-02V00.                                  NC1014.2 56
   000645         064900 MPY-TEST-F1-8-0.                                                 NC1014.2
   000646         065000     MULTIPLY AZERO-DS-05V05 BY WRK-DS-02V00                      NC1014.2 57 56
   000647      1  065100         ON SIZE ERROR MOVE "0" TO WRK-XN-00001.                  NC1014.2 51
   000648         065200 MPY-TEST-F1-8-1.                                                 NC1014.2
   000649         065300     IF WRK-DS-02V00 EQUAL TO 00                                  NC1014.2 56
   000650      1  065400         PERFORM PASS                                             NC1014.2 327
   000651      1  065500         GO TO MPY-WRITE-F1-8-1.                                  NC1014.2 660
   000652         065600     GO TO MPY-FAIL-F1-8-1.                                       NC1014.2 656
   000653         065700 MPY-DELETE-F1-8-1.                                               NC1014.2
   000654         065800     PERFORM DE-LETE.                                             NC1014.2 329
   000655         065900     GO TO MPY-WRITE-F1-8-1.                                      NC1014.2 660
   000656         066000 MPY-FAIL-F1-8-1.                                                 NC1014.2
   000657         066100     MOVE  WRK-DS-02V00       TO COMPUTED-N.                      NC1014.2 56 189
   000658         066200     MOVE  00                 TO CORRECT-N.                       NC1014.2 203
   000659         066300     PERFORM FAIL.                                                NC1014.2 328
   000660         066400 MPY-WRITE-F1-8-1.                                                NC1014.2
   000661         066500     MOVE "MPY-TEST-F1-8-1         " TO PAR-NAME.                 NC1014.2 177
   000662         066600     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000663         066700 MPY-TEST-F1-8-2.                                                 NC1014.2
   000664         066800     IF WRK-XN-00001 EQUAL TO "1"                                 NC1014.2 51
   000665      1  066900         PERFORM PASS                                             NC1014.2 327
   000666      1  067000         GO TO MPY-WRITE-F1-8-2.                                  NC1014.2 674
   000667         067100     MOVE "1" TO CORRECT-A.                                       NC1014.2 202
   000668         067200     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1014.2 51 188
   000669         067300     MOVE    "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.   NC1014.2 182
   000670         067400     PERFORM FAIL.                                                NC1014.2 328
   000671         067500     GO TO MPY-WRITE-F1-8-2.                                      NC1014.2 674
   000672         067600 MPY-DELETE-F1-8-2.                                               NC1014.2
   000673         067700     PERFORM DE-LETE.                                             NC1014.2 329
   000674         067800 MPY-WRITE-F1-8-2.                                                NC1014.2
   000675         067900     MOVE "MPY-TEST-F1-8-2         " TO PAR-NAME.                 NC1014.2 177
   000676         068000     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000677         068100                                                                  NC1014.2
   000678         068200 MPY-INIT-F1-9.                                                   NC1014.2
   000679         068300     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000680         068400     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   000681         068500     MOVE   -01 TO WRK-DS-02V00.                                  NC1014.2 56
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600 MPY-TEST-F1-9-0.                                                 NC1014.2
   000683         068700     MULTIPLY 99.5 BY WRK-DS-02V00 ROUNDED                        NC1014.2 56
   000684      1  068800         ON SIZE ERROR MOVE "1" TO WRK-XN-00001.                  NC1014.2 51
   000685         068900 MPY-TEST-F1-9-1.                                                 NC1014.2
   000686         069000     IF WRK-DS-02V00 EQUAL TO -01                                 NC1014.2 56
   000687      1  069100         PERFORM PASS                                             NC1014.2 327
   000688      1  069200         GO TO MPY-WRITE-F1-9-1.                                  NC1014.2 698
   000689         069300     GO TO MPY-FAIL-F1-9-1.                                       NC1014.2 693
   000690         069400 MPY-DELETE-F1-9-1.                                               NC1014.2
   000691         069500     PERFORM DE-LETE.                                             NC1014.2 329
   000692         069600     GO TO MPY-WRITE-F1-9-1.                                      NC1014.2 698
   000693         069700 MPY-FAIL-F1-9-1.                                                 NC1014.2
   000694         069800     MOVE  WRK-DS-02V00       TO COMPUTED-N.                      NC1014.2 56 189
   000695         069900     MOVE  -01                TO CORRECT-N.                       NC1014.2 203
   000696         070000     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1014.2 182
   000697         070100     PERFORM FAIL.                                                NC1014.2 328
   000698         070200 MPY-WRITE-F1-9-1.                                                NC1014.2
   000699         070300     MOVE "MPY-TEST-F1-9-1         " TO PAR-NAME.                 NC1014.2 177
   000700         070400     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000701         070500 MPY-TEST-F1-9-2.                                                 NC1014.2
   000702         070600     IF WRK-XN-00001 EQUAL TO "1"                                 NC1014.2 51
   000703      1  070700         PERFORM PASS                                             NC1014.2 327
   000704      1  070800         GO TO MPY-WRITE-F1-9-2.                                  NC1014.2 712
   000705         070900     MOVE "1" TO CORRECT-A.                                       NC1014.2 202
   000706         071000     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1014.2 51 188
   000707         071100     MOVE    "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.             NC1014.2 182
   000708         071200     PERFORM FAIL.                                                NC1014.2 328
   000709         071300     GO TO MPY-WRITE-F1-9-2.                                      NC1014.2 712
   000710         071400 MPY-DELETE-F1-9-2.                                               NC1014.2
   000711         071500     PERFORM DE-LETE.                                             NC1014.2 329
   000712         071600 MPY-WRITE-F1-9-2.                                                NC1014.2
   000713         071700     MOVE "MPY-TEST-F1-9-2         " TO PAR-NAME.                 NC1014.2 177
   000714         071800     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000715         071900                                                                  NC1014.2
   000716         072000 MPY-INIT-F1-10.                                                  NC1014.2
   000717         072100     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000718         072200     MOVE   "1" TO WRK-XN-00001.                                  NC1014.2 51
   000719         072300     MOVE   -01 TO WRK-DS-02V00.                                  NC1014.2 56
   000720         072400 MPY-TEST-F1-10-0.                                                NC1014.2
   000721         072500     MULTIPLY 99.4 BY WRK-DS-02V00 ROUNDED                        NC1014.2 56
   000722      1  072600         ON SIZE ERROR MOVE "0" TO WRK-XN-00001.                  NC1014.2 51
   000723         072700 MPY-TEST-F1-10-1.                                                NC1014.2
   000724         072800     IF WRK-DS-02V00 EQUAL TO -99                                 NC1014.2 56
   000725      1  072900         PERFORM PASS                                             NC1014.2 327
   000726      1  073000         GO TO MPY-WRITE-F1-10-1.                                 NC1014.2 735
   000727         073100     GO TO MPY-FAIL-F1-10-1.                                      NC1014.2 731
   000728         073200 MPY-DELETE-F1-10-1.                                              NC1014.2
   000729         073300     PERFORM DE-LETE.                                             NC1014.2 329
   000730         073400     GO TO MPY-WRITE-F1-10-1.                                     NC1014.2 735
   000731         073500 MPY-FAIL-F1-10-1.                                                NC1014.2
   000732         073600     MOVE  WRK-DS-02V00       TO COMPUTED-N.                      NC1014.2 56 189
   000733         073700     MOVE  -99                TO CORRECT-N.                       NC1014.2 203
   000734         073800     PERFORM FAIL.                                                NC1014.2 328
   000735         073900 MPY-WRITE-F1-10-1.                                               NC1014.2
   000736         074000     MOVE "MPY-TEST-F1-10-1         " TO PAR-NAME.                NC1014.2 177
   000737         074100     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000738         074200 MPY-TEST-F1-10-2.                                                NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300     IF WRK-XN-00001 EQUAL TO "1"                                 NC1014.2 51
   000740      1  074400         PERFORM PASS                                             NC1014.2 327
   000741      1  074500         GO TO MPY-WRITE-F1-10-2.                                 NC1014.2 749
   000742         074600     MOVE "1" TO CORRECT-A.                                       NC1014.2 202
   000743         074700     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1014.2 51 188
   000744         074800     MOVE    "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.   NC1014.2 182
   000745         074900     PERFORM FAIL.                                                NC1014.2 328
   000746         075000     GO TO MPY-WRITE-F1-10-2.                                     NC1014.2 749
   000747         075100 MPY-DELETE-F1-10-2.                                              NC1014.2
   000748         075200     PERFORM DE-LETE.                                             NC1014.2 329
   000749         075300 MPY-WRITE-F1-10-2.                                               NC1014.2
   000750         075400     MOVE "MPY-TEST-F1-10-2         " TO PAR-NAME.                NC1014.2 177
   000751         075500     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000752         075600                                                                  NC1014.2
   000753         075700 MPY-INIT-F1-11.                                                  NC1014.2
   000754         075800     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000755         075900     MOVE   -990 TO WRK-DS-0201P.                                 NC1014.2 68
   000756         076000 MPY-TEST-F1-11-0.                                                NC1014.2
   000757         076100     MULTIPLY A01ONE-CS-00V01 BY WRK-DS-0201P.                    NC1014.2 73 68
   000758         076200 MPY-TEST-F1-11.                                                  NC1014.2
   000759         076300     MOVE WRK-DS-0201P TO WRK-DS-05V00.                           NC1014.2 68 82
   000760         076400     IF WRK-DS-05V00 EQUAL TO -00090                              NC1014.2 82
   000761      1  076500         PERFORM PASS                                             NC1014.2 327
   000762      1  076600         GO TO MPY-WRITE-F1-11.                                   NC1014.2 769
   000763         076700     MOVE -00090 TO CORRECT-N.                                    NC1014.2 203
   000764         076800     MOVE  WRK-DS-05V00       TO COMPUTED-N.                      NC1014.2 82 189
   000765         076900     PERFORM FAIL.                                                NC1014.2 328
   000766         077000     GO TO MPY-WRITE-F1-11.                                       NC1014.2 769
   000767         077100 MPY-DELETE-F1-11.                                                NC1014.2
   000768         077200     PERFORM DE-LETE.                                             NC1014.2 329
   000769         077300 MPY-WRITE-F1-11.                                                 NC1014.2
   000770         077400     MOVE "MPY-TEST-F1-11         " TO PAR-NAME.                  NC1014.2 177
   000771         077500     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000772         077600                                                                  NC1014.2
   000773         077700 MPY-INIT-F1-12.                                                  NC1014.2
   000774         077800     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000775         077900     MOVE    A18ONES-DS-18V00   TO WRK-CS-18V00.                  NC1014.2 66 69
   000776         078000 MPY-TEST-F1-12-0.                                                NC1014.2
   000777         078100     MULTIPLY A01ONE-DS-P0801 BY WRK-CS-18V00.                    NC1014.2 63 69
   000778         078200 MPY-TEST-F1-12.                                                  NC1014.2
   000779         078300     MOVE WRK-CS-18V00 TO WRK-DU-18V00.                           NC1014.2 69 70
   000780         078400     IF WRK-DU-18V00 EQUAL TO 000000000111111111                  NC1014.2 70
   000781      1  078500         PERFORM PASS                                             NC1014.2 327
   000782      1  078600         GO TO MPY-WRITE-F1-12.                                   NC1014.2 789
   000783         078700     MOVE  000000000111111111 TO CORRECT-18V0.                    NC1014.2 208
   000784         078800     MOVE WRK-DU-18V00     TO COMPUTED-18V0.                      NC1014.2 70 195
   000785         078900     PERFORM FAIL.                                                NC1014.2 328
   000786         079000     GO TO MPY-WRITE-F1-12.                                       NC1014.2 789
   000787         079100 MPY-DELETE-F1-12.                                                NC1014.2
   000788         079200     PERFORM DE-LETE.                                             NC1014.2 329
   000789         079300 MPY-WRITE-F1-12.                                                 NC1014.2
   000790         079400     MOVE "MPY-TEST-F1-12         " TO PAR-NAME.                  NC1014.2 177
   000791         079500     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000792         079600*                                                                 NC1014.2
   000793         079700*                                                                 NC1014.2
   000794         079800 MPY-INIT-F1-13.                                                  NC1014.2
   000795         079900*    ===--> NEW SIZE ERROR TESTS <--===                           NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000     MOVE   "VI-67 6.4.2 " TO ANSI-REFERENCE.                     NC1014.2 233
   000797         080100     MOVE   "MPY-TEST-F1-13       " TO PAR-NAME.                  NC1014.2 177
   000798         080200     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   000799         080300     MOVE    1111111111       TO WRK-DS-10V00.                    NC1014.2 50
   000800         080400     MOVE    1 TO REC-CT.                                         NC1014.2 224
   000801         080500 MPY-TEST-F1-13-0.                                                NC1014.2
   000802         080600     MULTIPLY A12THREES-DS-06V06 BY WRK-DS-10V00                  NC1014.2 54 50
   000803      1  080700              ON SIZE ERROR GO TO MPY-TEST-F1-13-1                NC1014.2 810
   000804      1  080800              NOT ON SIZE ERROR MOVE "1" TO WRK-XN-00001.         NC1014.2 51
   000805         080900     GO TO MPY-TEST-F1-13-1.                                      NC1014.2 810
   000806         081000 MPY-DELETE-F1-13.                                                NC1014.2
   000807         081100     PERFORM DE-LETE.                                             NC1014.2 329
   000808         081200     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000809         081300     GO TO MPY-INIT-F1-14.                                        NC1014.2 835
   000810         081400 MPY-TEST-F1-13-1.                                                NC1014.2
   000811         081500     MOVE   "MPY-TEST-F1-13-1" TO PAR-NAME                        NC1014.2 177
   000812         081600     IF      WRK-XN-00001 = "0"                                   NC1014.2 51
   000813      1  081700             PERFORM PASS                                         NC1014.2 327
   000814      1  081800             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000815         081900     ELSE                                                         NC1014.2
   000816      1  082000             MOVE    WRK-XN-00001     TO COMPUTED-X               NC1014.2 51 187
   000817      1  082100             MOVE   "0"               TO CORRECT-X                NC1014.2 201
   000818      1  082200             MOVE   "SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK  NC1014.2 182
   000819      1  082300             PERFORM FAIL                                         NC1014.2 328
   000820      1  082400             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000821         082500     ADD     1 TO REC-CT.                                         NC1014.2 224
   000822         082600 MPY-TEST-F1-13-2.                                                NC1014.2
   000823         082700     MOVE   "MPY-TEST-F1-13-2" TO PAR-NAME                        NC1014.2 177
   000824         082800     IF      WRK-DS-10V00 = 1111111111                            NC1014.2 50
   000825      1  082900             PERFORM PASS                                         NC1014.2 327
   000826      1  083000             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000827         083100     ELSE                                                         NC1014.2
   000828      1  083200             MOVE    WRK-DS-10V00       TO COMPUTED-18V0          NC1014.2 50 195
   000829      1  083300             MOVE    1111111111         TO CORRECT-18V0           NC1014.2 208
   000830      1  083400             MOVE   "SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK  NC1014.2 182
   000831      1  083500             PERFORM FAIL                                         NC1014.2 328
   000832      1  083600             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000833         083700*                                                                 NC1014.2
   000834         083800*                                                                 NC1014.2
   000835         083900 MPY-INIT-F1-14.                                                  NC1014.2
   000836         084000*    ===--> NEW SIZE ERROR TESTS <--===                           NC1014.2
   000837         084100     MOVE   "VI-67 6.4.2 " TO ANSI-REFERENCE.                     NC1014.2 233
   000838         084200     MOVE   "MPY-TEST-F1-14        " TO PAR-NAME.                 NC1014.2 177
   000839         084300     MOVE   "1" TO WRK-XN-00001.                                  NC1014.2 51
   000840         084400     MOVE    1  TO REC-CT.                                        NC1014.2 224
   000841         084500     MOVE   -99 TO WRK-DS-02V00.                                  NC1014.2 56
   000842         084600 MPY-TEST-F1-14-0.                                                NC1014.2
   000843         084700     MULTIPLY AZERO-DS-05V05 BY WRK-DS-02V00                      NC1014.2 57 56
   000844      1  084800          ON SIZE ERROR GO TO MPY-TEST-F1-14-1                    NC1014.2 851
   000845      1  084900          NOT ON SIZE ERROR MOVE "0" TO WRK-XN-00001.             NC1014.2 51
   000846         085000     GO TO   MPY-TEST-F1-14-1.                                    NC1014.2 851
   000847         085100 MPY-DELETE-F1-14.                                                NC1014.2
   000848         085200     PERFORM DE-LETE.                                             NC1014.2 329
   000849         085300     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000850         085400     GO TO   MPY-INIT-F1-15.                                      NC1014.2 876
   000851         085500 MPY-TEST-F1-14-1.                                                NC1014.2
   000852         085600     MOVE   "MPY-TEST-F1-14-1" TO PAR-NAME.                       NC1014.2 177
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700     IF      WRK-XN-00001 = "0"                                   NC1014.2 51
   000854      1  085800             PERFORM PASS                                         NC1014.2 327
   000855      1  085900             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000856         086000     ELSE                                                         NC1014.2
   000857      1  086100             MOVE    WRK-XN-00001     TO COMPUTED-X               NC1014.2 51 187
   000858      1  086200             MOVE   "0"               TO CORRECT-X                NC1014.2 201
   000859      1  086300             MOVE    "NOT ON SIZE ERROR SHOULD BE EXECUTED"       NC1014.2
   000860      1  086400                  TO RE-MARK                                      NC1014.2 182
   000861      1  086500             PERFORM FAIL                                         NC1014.2 328
   000862      1  086600             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000863         086700     ADD     1  TO REC-CT.                                        NC1014.2 224
   000864         086800 MPY-TEST-F1-14-2.                                                NC1014.2
   000865         086900     MOVE   "MPY-TEST-F1-14-2" TO PAR-NAME.                       NC1014.2 177
   000866         087000     IF      WRK-DS-02V00 = 00                                    NC1014.2 56
   000867      1  087100             PERFORM PASS                                         NC1014.2 327
   000868      1  087200             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000869         087300     ELSE                                                         NC1014.2
   000870      1  087400             MOVE    WRK-DS-02V00     TO COMPUTED-N               NC1014.2 56 189
   000871      1  087500             MOVE    00               TO CORRECT-N                NC1014.2 203
   000872      1  087600             PERFORM FAIL                                         NC1014.2 328
   000873      1  087700             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000874         087800*                                                                 NC1014.2
   000875         087900*                                                                 NC1014.2
   000876         088000 MPY-INIT-F1-15.                                                  NC1014.2
   000877         088100*    ===--> NEW SIZE ERROR TESTS <--===                           NC1014.2
   000878         088200     MOVE   "VI-67 6.4.2 " TO ANSI-REFERENCE.                     NC1014.2 233
   000879         088300     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   000880         088400     MOVE    1111111111 TO WRK-DS-10V00.                          NC1014.2 50
   000881         088500     MOVE    1 TO REC-CT.                                         NC1014.2 224
   000882         088600 MPY-TEST-F1-15-0.                                                NC1014.2
   000883         088700     MULTIPLY A12THREES-DS-06V06 BY WRK-DS-10V00                  NC1014.2 54 50
   000884      1  088800              ON SIZE ERROR MOVE "1" TO WRK-XN-00001              NC1014.2 51
   000885      1  088900          NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001.             NC1014.2 51
   000886         089000     GO TO MPY-TEST-F1-15-1.                                      NC1014.2 891
   000887         089100 MPY-DELETE-F1-15.                                                NC1014.2
   000888         089200     PERFORM DE-LETE.                                             NC1014.2 329
   000889         089300     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000890         089400     GO TO MPY-INIT-F1-16.                                        NC1014.2 916
   000891         089500 MPY-TEST-F1-15-1.                                                NC1014.2
   000892         089600     MOVE   "MPY-TEST-F1-15-1" TO PAR-NAME.                       NC1014.2 177
   000893         089700     IF      WRK-XN-00001 = "1"                                   NC1014.2 51
   000894      1  089800             PERFORM PASS                                         NC1014.2 327
   000895      1  089900             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000896         090000     ELSE                                                         NC1014.2
   000897      1  090100             MOVE    WRK-XN-00001     TO COMPUTED-X               NC1014.2 51 187
   000898      1  090200             MOVE   "1"               TO CORRECT-X                NC1014.2 201
   000899      1  090300             MOVE   "SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK  NC1014.2 182
   000900      1  090400             PERFORM FAIL                                         NC1014.2 328
   000901      1  090500             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000902         090600     ADD     1 TO REC-CT.                                         NC1014.2 224
   000903         090700 MPY-TEST-F1-15-2.                                                NC1014.2
   000904         090800     MOVE   "MPY-TEST-F1-15-2" TO PAR-NAME.                       NC1014.2 177
   000905         090900     IF      WRK-DS-10V00 = 1111111111                            NC1014.2 50
   000906      1  091000             PERFORM PASS                                         NC1014.2 327
   000907      1  091100             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000908         091200     ELSE                                                         NC1014.2
   000909      1  091300             MOVE    WRK-DS-10V00       TO COMPUTED-18V0          NC1014.2 50 195
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910      1  091400             MOVE    1111111111         TO CORRECT-18V0           NC1014.2 208
   000911      1  091500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1014.2 182
   000912      1  091600             PERFORM FAIL                                         NC1014.2 328
   000913      1  091700             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000914         091800*                                                                 NC1014.2
   000915         091900*                                                                 NC1014.2
   000916         092000 MPY-INIT-F1-16.                                                  NC1014.2
   000917         092100*    ===--> NEW SIZE ERROR TESTS <--===                           NC1014.2
   000918         092200     MOVE   "VI-67 6.4.2 " TO ANSI-REFERENCE.                     NC1014.2 233
   000919         092300     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   000920         092400     MOVE   -99 TO WRK-DS-02V00.                                  NC1014.2 56
   000921         092500     MOVE    1 TO REC-CT.                                         NC1014.2 224
   000922         092600 MPY-TEST-F1-16-0.                                                NC1014.2
   000923         092700     MULTIPLY AZERO-DS-05V05 BY WRK-DS-02V00                      NC1014.2 57 56
   000924      1  092800              ON SIZE ERROR MOVE "1" TO WRK-XN-00001              NC1014.2 51
   000925      1  092900          NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001.             NC1014.2 51
   000926         093000     GO TO   MPY-TEST-F1-16-1.                                    NC1014.2 931
   000927         093100 MPY-DELETE-F1-16.                                                NC1014.2
   000928         093200     PERFORM DE-LETE.                                             NC1014.2 329
   000929         093300     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000930         093400     GO TO   MPY-INIT-F1-17.                                      NC1014.2 957
   000931         093500 MPY-TEST-F1-16-1.                                                NC1014.2
   000932         093600     MOVE   "MPY-TEST-F1-16-1" TO PAR-NAME.                       NC1014.2 177
   000933         093700     IF      WRK-XN-00001 = "2"                                   NC1014.2 51
   000934      1  093800             PERFORM PASS                                         NC1014.2 327
   000935      1  093900             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000936         094000     ELSE                                                         NC1014.2
   000937      1  094100             MOVE    WRK-XN-00001     TO COMPUTED-X               NC1014.2 51 187
   000938      1  094200             MOVE   "2"               TO CORRECT-X                NC1014.2 201
   000939      1  094300             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1014.2
   000940      1  094400                  TO RE-MARK                                      NC1014.2 182
   000941      1  094500             PERFORM FAIL                                         NC1014.2 328
   000942      1  094600             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000943         094700     ADD     1 TO REC-CT.                                         NC1014.2 224
   000944         094800 MPY-TEST-F1-16-2.                                                NC1014.2
   000945         094900     MOVE   "MPY-TEST-F1-16-2" TO PAR-NAME.                       NC1014.2 177
   000946         095000     IF      WRK-DS-02V00 = 00                                    NC1014.2 56
   000947      1  095100             PERFORM PASS                                         NC1014.2 327
   000948      1  095200             PERFORM PRINT-DETAIL                                 NC1014.2 331
   000949         095300     ELSE                                                         NC1014.2
   000950      1  095400             MOVE    WRK-DS-02V00     TO COMPUTED-N               NC1014.2 56 189
   000951      1  095500             MOVE    00               TO CORRECT-N                NC1014.2 203
   000952      1  095600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1014.2 182
   000953      1  095700             PERFORM FAIL                                         NC1014.2 328
   000954      1  095800             PERFORM PRINT-DETAIL.                                NC1014.2 331
   000955         095900*                                                                 NC1014.2
   000956         096000*                                                                 NC1014.2
   000957         096100 MPY-INIT-F1-17.                                                  NC1014.2
   000958         096200     MOVE   "VI-106 6.19.4 GR1" TO ANSI-REFERENCE.                NC1014.2 233
   000959         096300*    ===--> MULTIPLE RESULT FIELDS <--===                         NC1014.2
   000960         096400     MOVE   "MPY-TEST-F1-17" TO PAR-NAME.                         NC1014.2 177
   000961         096500     MOVE    .00001  TO WRK-DU-4P1-1.                             NC1014.2 113
   000962         096600     MOVE    12345.6 TO WRK-DU-5V1-1.                             NC1014.2 114
   000963         096700     MOVE    1 TO REC-CT.                                         NC1014.2 224
   000964         096800 MPY-TEST-F1-17-0.                                                NC1014.2
   000965         096900     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-5V1-1 ROUNDED WRK-DU-2P4-1   NC1014.2 113 114 100
   000966         097000         WRK-DU-6V0-1 ROUNDED WRK-DU-6V0-2 WRK-DU-0V12-1.         NC1014.2 115 116 92
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097100     GO TO MPY-TEST-F1-17-1.                                      NC1014.2 973
   000968         097200 MPY-DELETE-F1-17.                                                NC1014.2
   000969         097300     PERFORM DE-LETE.                                             NC1014.2 329
   000970         097400     MOVE "*DELETED BY FCTC*" TO FEATURE.                         NC1014.2 173
   000971         097500     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   000972         097600     GO TO MPY-INIT-F1-18.                                        NC1014.2 1003
   000973         097700 MPY-TEST-F1-17-1.                                                NC1014.2
   000974         097800     IF WRK-DU-5V1-1 = .1 PERFORM PASS PERFORM PRINT-DETAIL       NC1014.2 114 327 331
   000975         097900     ELSE                                                         NC1014.2
   000976      1  098000     PERFORM FAIL MOVE WRK-DU-5V1-1 TO COMPUTED-N MOVE .1         NC1014.2 328 114 189
   000977      1  098100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   000978         098200     ADD 1 TO REC-CT.                                             NC1014.2 224
   000979         098300 MPY-TEST-F1-17-2.                                                NC1014.2
   000980         098400     IF WRK-DU-2P4-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 100 327 331
   000981         098500     ELSE                                                         NC1014.2
   000982      1  098600     PERFORM FAIL MOVE WRK-DU-2P4-1 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 100 189
   000983      1  098700     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   000984         098800     ADD 1 TO REC-CT.                                             NC1014.2 224
   000985         098900 MPY-TEST-F1-17-3.                                                NC1014.2
   000986         099000     IF WRK-DU-6V0-1 = 1 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 115 327 331
   000987         099100     ELSE                                                         NC1014.2
   000988      1  099200     PERFORM FAIL MOVE WRK-DU-6V0-1 TO COMPUTED-N MOVE 1          NC1014.2 328 115 189
   000989      1  099300     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   000990         099400     ADD 1 TO REC-CT.                                             NC1014.2 224
   000991         099500 MPY-TEST-F1-17-4.                                                NC1014.2
   000992         099600     IF WRK-DU-6V0-2 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 116 327 331
   000993         099700     ELSE                                                         NC1014.2
   000994      1  099800     PERFORM FAIL MOVE WRK-DU-6V0-2 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 116 189
   000995      1  099900     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   000996         100000     ADD 1 TO REC-CT.                                             NC1014.2 224
   000997         100100 MPY-TEST-F1-17-5.                                                NC1014.2
   000998         100200     IF WRK-DU-0V12-1 = .0000000001 PERFORM PASS PERFORM          NC1014.2 92 327
   000999         100300     PRINT-DETAIL ELSE                                            NC1014.2 331
   001000      1  100400     PERFORM FAIL MOVE WRK-DU-0V12-1 TO COMPUTED-0V18 MOVE        NC1014.2 328 92 191
   001001      1  100500     .0000000001 TO CORRECT-0V18 PERFORM PRINT-DETAIL.            NC1014.2 204 331
   001002         100600*                                                                 NC1014.2
   001003         100700 MPY-INIT-F1-18.                                                  NC1014.2
   001004         100800*     =>   SIZE ERROR CONDITION. <--==                            NC1014.2
   001005         100900*    ==-->   MULTIPLE RESULT FIELDS<--==                          NC1014.2
   001006         101000*    ===--> & SIZE ERROR CONDITIONS<--===                         NC1014.2
   001007         101100     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1014.2 233
   001008         101200     MOVE   "MPY-TEST-F1-18" TO PAR-NAME.                         NC1014.2 177
   001009         101300     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001010         101400     MOVE    0  TO WRK-DU-2P4-1.                                  NC1014.2 100
   001011         101500     MOVE    0  TO WRK-DU-6V0-1.                                  NC1014.2 115
   001012         101600     MOVE    0  TO WRK-DU-6V0-2.                                  NC1014.2 116
   001013         101700     MOVE    0  TO WRK-DU-0V12-1.                                 NC1014.2 92
   001014         101800     MOVE   99  TO WRK-DU-2V0-1.                                  NC1014.2 101
   001015         101900     MOVE 12345.6 TO WRK-DU-5V1-1.                                NC1014.2 114
   001016         102000     MOVE    1 TO REC-CT.                                         NC1014.2 224
   001017         102100 MPY-TEST-F1-18-0.                                                NC1014.2
   001018         102200     MULTIPLY WRK-DU-5V1-1 BY WRK-DU-2V0-1 ROUNDED WRK-DU-2P4-1   NC1014.2 114 101 100
   001019         102300             WRK-DU-6V0-1 ROUNDED WRK-DU-6V0-2 WRK-DU-0V12-1      NC1014.2 115 116 92
   001020      1  102400             ON SIZE ERROR MOVE "1" TO WRK-XN-00001.              NC1014.2 51
   001021         102500     GO TO MPY-TEST-F1-18-1.                                      NC1014.2 1027
   001022         102600 MPY-DELETE-F1-18.                                                NC1014.2
   001023         102700     PERFORM DE-LETE.                                             NC1014.2 329
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102800     MOVE   "*DELETED BY FCTC*" TO FEATURE.                       NC1014.2 173
   001025         102900     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001026         103000     GO TO   MPY-INIT-F1-19.                                      NC1014.2 1068
   001027         103100 MPY-TEST-F1-18-1.                                                NC1014.2
   001028         103200     IF WRK-DU-2V0-1 = 99 PERFORM PASS PERFORM PRINT-DETAIL       NC1014.2 101 327 331
   001029         103300     ELSE                                                         NC1014.2
   001030      1  103400     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 99         NC1014.2 328 101 189
   001031      1  103500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001032         103600     ADD 1 TO REC-CT.                                             NC1014.2 224
   001033         103700 MPY-TEST-F1-18-2.                                                NC1014.2
   001034         103800     IF WRK-DU-2P4-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 100 327 331
   001035         103900     ELSE                                                         NC1014.2
   001036      1  104000     PERFORM FAIL MOVE WRK-DU-2P4-1 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 100 189
   001037      1  104100     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001038         104200     ADD 1 TO REC-CT.                                             NC1014.2 224
   001039         104300 MPY-TEST-F1-18-3.                                                NC1014.2
   001040         104400     IF WRK-DU-6V0-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 115 327 331
   001041         104500     ELSE                                                         NC1014.2
   001042      1  104600     PERFORM FAIL MOVE WRK-DU-6V0-1 TO COMPUTED-N MOVE 0          NC1014.2 328 115 189
   001043      1  104700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001044         104800     ADD 1 TO REC-CT.                                             NC1014.2 224
   001045         104900 MPY-TEST-F1-18-4.                                                NC1014.2
   001046         105000     IF WRK-DU-6V0-2 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 116 327 331
   001047         105100     ELSE                                                         NC1014.2
   001048      1  105200     PERFORM FAIL MOVE WRK-DU-6V0-2 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 116 189
   001049      1  105300     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001050         105400     ADD 1 TO REC-CT.                                             NC1014.2 224
   001051         105500 MPY-TEST-F1-18-5.                                                NC1014.2
   001052         105600     IF WRK-DU-0V12-1 = 0 PERFORM PASS PERFORM                    NC1014.2 92 327
   001053         105700     PRINT-DETAIL ELSE                                            NC1014.2 331
   001054      1  105800     PERFORM FAIL MOVE WRK-DU-0V12-1 TO COMPUTED-0V18 MOVE 0      NC1014.2 328 92 191
   001055      1  105900     TO CORRECT-0V18 PERFORM PRINT-DETAIL.                        NC1014.2 204 331
   001056         106000     ADD 1 TO REC-CT.                                             NC1014.2 224
   001057         106100 MPY-TEST-F1-18-6.                                                NC1014.2
   001058         106200     IF      WRK-XN-00001 = "1"                                   NC1014.2 51
   001059      1  106300             PERFORM PASS                                         NC1014.2 327
   001060      1  106400             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001061         106500     ELSE                                                         NC1014.2
   001062      1  106600             MOVE   "ON SIZE ERROR SHOULD HAVE EXECUTED"          NC1014.2
   001063      1  106700                  TO RE-MARK                                      NC1014.2 182
   001064      1  106800             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1014.2 51 187
   001065      1  106900             MOVE   "1"            TO CORRECT-X                   NC1014.2 201
   001066      1  107000             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001067         107100*                                                                 NC1014.2
   001068         107200 MPY-INIT-F1-19.                                                  NC1014.2
   001069         107300*    ==-->  NO   SIZE ERROR CONDITION. <--==                      NC1014.2
   001070         107400*    ==-->   MULTIPLE RESULT FIELDS <--==                         NC1014.2
   001071         107500*    ===--> & SIZE ERROR CONDITIONS <--===                        NC1014.2
   001072         107600     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1014.2 233
   001073         107700     MOVE   "MPY-TEST-F1-19" TO PAR-NAME.                         NC1014.2 177
   001074         107800     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001075         107900     MOVE    0  TO WRK-DU-2P4-1.                                  NC1014.2 100
   001076         108000     MOVE    0  TO WRK-DU-6V0-1.                                  NC1014.2 115
   001077         108100     MOVE    0  TO WRK-DU-6V0-2.                                  NC1014.2 116
   001078         108200     MOVE   .00001  TO WRK-DU-0V12-1.                             NC1014.2 92
   001079         108300     MOVE   99  TO WRK-DU-2V0-1.                                  NC1014.2 101
   001080         108400     MOVE 12345.6 TO WRK-DU-5V1-1.                                NC1014.2 114
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108500     MOVE .00001 TO WRK-DU-4P1-1.                                 NC1014.2 113
   001082         108600     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001083         108700 MPY-TEST-F1-19-0.                                                NC1014.2
   001084         108800     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-5V1-1 ROUNDED WRK-DU-2P4-1   NC1014.2 113 114 100
   001085         108900             WRK-DU-6V0-1 ROUNDED WRK-DU-6V0-2                    NC1014.2 115 116
   001086         109000             WRK-DU-0V12-1                                        NC1014.2 92
   001087      1  109100             ON SIZE ERROR MOVE "1" TO WRK-XN-00001.              NC1014.2 51
   001088         109200     GO TO MPY-TEST-F1-19-1.                                      NC1014.2 1094
   001089         109300 MPY-DELETE-F1-19.                                                NC1014.2
   001090         109400     PERFORM DE-LETE.                                             NC1014.2 329
   001091         109500     MOVE "*DELETED BY FCTC*" TO FEATURE.                         NC1014.2 173
   001092         109600     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001093         109700     GO TO MPY-INIT-F1-20.                                        NC1014.2 1135
   001094         109800 MPY-TEST-F1-19-1.                                                NC1014.2
   001095         109900     IF WRK-DU-5V1-1 = .1 PERFORM PASS PERFORM PRINT-DETAIL       NC1014.2 114 327 331
   001096         110000     ELSE                                                         NC1014.2
   001097      1  110100     PERFORM FAIL MOVE WRK-DU-5V1-1 TO COMPUTED-N MOVE .1         NC1014.2 328 114 189
   001098      1  110200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001099         110300     ADD 1 TO REC-CT.                                             NC1014.2 224
   001100         110400 MPY-TEST-F1-19-2.                                                NC1014.2
   001101         110500     IF WRK-DU-2P4-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 100 327 331
   001102         110600     ELSE                                                         NC1014.2
   001103      1  110700     PERFORM FAIL MOVE WRK-DU-2P4-1 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 100 189
   001104      1  110800     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001105         110900     ADD 1 TO REC-CT.                                             NC1014.2 224
   001106         111000 MPY-TEST-F1-19-3.                                                NC1014.2
   001107         111100     IF WRK-DU-6V0-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 115 327 331
   001108         111200     ELSE                                                         NC1014.2
   001109      1  111300     PERFORM FAIL MOVE WRK-DU-6V0-1 TO COMPUTED-N MOVE 0          NC1014.2 328 115 189
   001110      1  111400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001111         111500     ADD 1 TO REC-CT.                                             NC1014.2 224
   001112         111600 MPY-TEST-F1-19-4.                                                NC1014.2
   001113         111700     IF WRK-DU-6V0-2 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 116 327 331
   001114         111800     ELSE                                                         NC1014.2
   001115      1  111900     PERFORM FAIL MOVE WRK-DU-6V0-2 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 116 189
   001116      1  112000     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001117         112100     ADD 1 TO REC-CT.                                             NC1014.2 224
   001118         112200 MPY-TEST-F1-19-5.                                                NC1014.2
   001119         112300     IF WRK-DU-0V12-1 = .0000000001 PERFORM PASS PERFORM          NC1014.2 92 327
   001120         112400     PRINT-DETAIL ELSE                                            NC1014.2 331
   001121      1  112500     PERFORM FAIL MOVE WRK-DU-0V12-1 TO COMPUTED-0V18 MOVE        NC1014.2 328 92 191
   001122      1  112600     .0000000001 TO CORRECT-0V18 PERFORM PRINT-DETAIL.            NC1014.2 204 331
   001123         112700     ADD 1 TO REC-CT.                                             NC1014.2 224
   001124         112800 MPY-TEST-F1-19-6.                                                NC1014.2
   001125         112900     IF      WRK-XN-00001 = "0"                                   NC1014.2 51
   001126      1  113000             PERFORM PASS                                         NC1014.2 327
   001127      1  113100             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001128         113200     ELSE                                                         NC1014.2
   001129      1  113300             MOVE   "ON SIZE ERROR SHOULD NOT HAVE EXECUTED"      NC1014.2
   001130      1  113400                  TO RE-MARK                                      NC1014.2 182
   001131      1  113500             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1014.2 51 187
   001132      1  113600             MOVE   "0"            TO CORRECT-X                   NC1014.2 201
   001133      1  113700             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001134         113800*                                                                 NC1014.2
   001135         113900 MPY-INIT-F1-20.                                                  NC1014.2
   001136         114000*   ==-->   SIZE ERROR CONDITION.   <--==                         NC1014.2
   001137         114100*   ==-->  MULTIPLE RESULT FIELDS   <--==                         NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114200*   ==-->  NEW SIZE ERROR TESTS     <--==                         NC1014.2
   001139         114300     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1014.2 233
   001140         114400     MOVE   "MPY-TEST-F1-20" TO PAR-NAME.                         NC1014.2 177
   001141         114500     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001142         114600     MOVE    0  TO WRK-DU-2P4-1.                                  NC1014.2 100
   001143         114700     MOVE    0  TO WRK-DU-6V0-1.                                  NC1014.2 115
   001144         114800     MOVE    0  TO WRK-DU-6V0-2.                                  NC1014.2 116
   001145         114900     MOVE    0  TO WRK-DU-0V12-1.                                 NC1014.2 92
   001146         115000     MOVE   99  TO WRK-DU-2V0-1.                                  NC1014.2 101
   001147         115100     MOVE 12345.6 TO WRK-DU-5V1-1.                                NC1014.2 114
   001148         115200     MOVE    1 TO REC-CT.                                         NC1014.2 224
   001149         115300 MPY-TEST-F1-20-0.                                                NC1014.2
   001150         115400     MULTIPLY WRK-DU-5V1-1 BY WRK-DU-2V0-1 ROUNDED WRK-DU-2P4-1   NC1014.2 114 101 100
   001151         115500             WRK-DU-6V0-1 ROUNDED WRK-DU-6V0-2 WRK-DU-0V12-1      NC1014.2 115 116 92
   001152      1  115600             ON SIZE ERROR GO TO MPY-TEST-F1-20-1                 NC1014.2 1160
   001153      1  115700         NOT ON SIZE ERROR MOVE "1" TO WRK-XN-00001.              NC1014.2 51
   001154         115800     GO TO MPY-TEST-F1-20-1.                                      NC1014.2 1160
   001155         115900 MPY-DELETE-F1-20.                                                NC1014.2
   001156         116000     PERFORM DE-LETE.                                             NC1014.2 329
   001157         116100     MOVE "*DELETED BY FCTC*" TO FEATURE.                         NC1014.2 173
   001158         116200     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001159         116300     GO TO MPY-INIT-F1-21.                                        NC1014.2 1201
   001160         116400 MPY-TEST-F1-20-1.                                                NC1014.2
   001161         116500     IF WRK-DU-2V0-1 = 99 PERFORM PASS PERFORM PRINT-DETAIL       NC1014.2 101 327 331
   001162         116600     ELSE                                                         NC1014.2
   001163      1  116700     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 99         NC1014.2 328 101 189
   001164      1  116800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001165         116900     ADD 1 TO REC-CT.                                             NC1014.2 224
   001166         117000 MPY-TEST-F1-20-2.                                                NC1014.2
   001167         117100     IF WRK-DU-2P4-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 100 327 331
   001168         117200     ELSE                                                         NC1014.2
   001169      1  117300     PERFORM FAIL MOVE WRK-DU-2P4-1 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 100 189
   001170      1  117400     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001171         117500     ADD 1 TO REC-CT.                                             NC1014.2 224
   001172         117600 MPY-TEST-F1-20-3.                                                NC1014.2
   001173         117700     IF WRK-DU-6V0-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 115 327 331
   001174         117800     ELSE                                                         NC1014.2
   001175      1  117900     PERFORM FAIL MOVE WRK-DU-6V0-1 TO COMPUTED-N MOVE 0          NC1014.2 328 115 189
   001176      1  118000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001177         118100     ADD 1 TO REC-CT.                                             NC1014.2 224
   001178         118200 MPY-TEST-F1-20-4.                                                NC1014.2
   001179         118300     IF WRK-DU-6V0-2 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 116 327 331
   001180         118400     ELSE                                                         NC1014.2
   001181      1  118500     PERFORM FAIL MOVE WRK-DU-6V0-2 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 116 189
   001182      1  118600     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001183         118700     ADD 1 TO REC-CT.                                             NC1014.2 224
   001184         118800 MPY-TEST-F1-20-5.                                                NC1014.2
   001185         118900     IF WRK-DU-0V12-1 = 0 PERFORM PASS PERFORM                    NC1014.2 92 327
   001186         119000     PRINT-DETAIL ELSE                                            NC1014.2 331
   001187      1  119100     PERFORM FAIL MOVE WRK-DU-0V12-1 TO COMPUTED-0V18 MOVE 0      NC1014.2 328 92 191
   001188      1  119200     TO CORRECT-0V18 PERFORM PRINT-DETAIL.                        NC1014.2 204 331
   001189         119300     ADD 1 TO REC-CT.                                             NC1014.2 224
   001190         119400 MPY-TEST-F1-20-6.                                                NC1014.2
   001191         119500     IF      WRK-XN-00001 = "0"                                   NC1014.2 51
   001192      1  119600             PERFORM PASS                                         NC1014.2 327
   001193      1  119700             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001194         119800     ELSE                                                         NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195      1  119900             MOVE   "NOT ON SIZE ERROR SHOULD NOT HAVE EXECUTED"  NC1014.2
   001196      1  120000                  TO RE-MARK                                      NC1014.2 182
   001197      1  120100             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1014.2 51 187
   001198      1  120200             MOVE   "0"            TO CORRECT-X                   NC1014.2 201
   001199      1  120300             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001200         120400*                                                                 NC1014.2
   001201         120500 MPY-INIT-F1-21.                                                  NC1014.2
   001202         120600*   ==-->   NO SIZE ERROR CONDITION.  <--==                       NC1014.2
   001203         120700*   ==-->   MULTIPLE RESULT FIELDS    <--==                       NC1014.2
   001204         120800*   ==-->    NEW SIZE ERROR TESTS     <--==                       NC1014.2
   001205         120900     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1014.2 233
   001206         121000     MOVE   "MPY-TEST-F1-21" TO PAR-NAME.                         NC1014.2 177
   001207         121100     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001208         121200     MOVE    0  TO WRK-DU-2P4-1.                                  NC1014.2 100
   001209         121300     MOVE    0  TO WRK-DU-6V0-1.                                  NC1014.2 115
   001210         121400     MOVE    0  TO WRK-DU-6V0-2.                                  NC1014.2 116
   001211         121500     MOVE   .00001  TO WRK-DU-0V12-1.                             NC1014.2 92
   001212         121600     MOVE   99  TO WRK-DU-2V0-1.                                  NC1014.2 101
   001213         121700     MOVE 12345.6 TO WRK-DU-5V1-1.                                NC1014.2 114
   001214         121800     MOVE .00001 TO WRK-DU-4P1-1.                                 NC1014.2 113
   001215         121900     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001216         122000 MPY-TEST-F1-21-0.                                                NC1014.2
   001217         122100     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-5V1-1 ROUNDED WRK-DU-2P4-1   NC1014.2 113 114 100
   001218         122200             WRK-DU-6V0-1 ROUNDED                                 NC1014.2 115
   001219         122300             WRK-DU-6V0-2 ROUNDED WRK-DU-0V12-1                   NC1014.2 116 92
   001220      1  122400             ON SIZE ERROR GO TO MPY-TEST-F1-21-1                 NC1014.2 1228
   001221      1  122500         NOT ON SIZE ERROR MOVE "1" TO WRK-XN-00001.              NC1014.2 51
   001222         122600     GO TO  MPY-TEST-F1-21-1.                                     NC1014.2 1228
   001223         122700 MPY-DELETE-F1-21.                                                NC1014.2
   001224         122800     PERFORM DE-LETE.                                             NC1014.2 329
   001225         122900     MOVE "*DELETED BY FCTC*" TO FEATURE.                         NC1014.2 173
   001226         123000     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001227         123100     GO TO  MPY-INIT-F1-22.                                       NC1014.2 1269
   001228         123200 MPY-TEST-F1-21-1.                                                NC1014.2
   001229         123300     IF  WRK-DU-5V1-1 = .1 PERFORM PASS PERFORM PRINT-DETAIL      NC1014.2 114 327 331
   001230         123400     ELSE                                                         NC1014.2
   001231      1  123500     PERFORM FAIL MOVE WRK-DU-5V1-1 TO COMPUTED-N MOVE .1         NC1014.2 328 114 189
   001232      1  123600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001233         123700     ADD 1 TO REC-CT.                                             NC1014.2 224
   001234         123800 MPY-TEST-F1-21-2.                                                NC1014.2
   001235         123900     IF WRK-DU-2P4-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 100 327 331
   001236         124000     ELSE                                                         NC1014.2
   001237      1  124100     PERFORM FAIL MOVE WRK-DU-2P4-1 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 100 189
   001238      1  124200     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001239         124300     ADD 1 TO REC-CT.                                             NC1014.2 224
   001240         124400 MPY-TEST-F1-21-3.                                                NC1014.2
   001241         124500     IF WRK-DU-6V0-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 115 327 331
   001242         124600     ELSE                                                         NC1014.2
   001243      1  124700     PERFORM FAIL MOVE WRK-DU-6V0-1 TO COMPUTED-N MOVE 1          NC1014.2 328 115 189
   001244      1  124800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001245         124900     ADD 1 TO REC-CT.                                             NC1014.2 224
   001246         125000 MPY-TEST-F1-21-4.                                                NC1014.2
   001247         125100     IF WRK-DU-6V0-2 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 116 327 331
   001248         125200     ELSE                                                         NC1014.2
   001249      1  125300     PERFORM FAIL MOVE WRK-DU-6V0-2 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 116 189
   001250      1  125400     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001251         125500     ADD 1 TO REC-CT.                                             NC1014.2 224
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125600 MPY-TEST-F1-21-5.                                                NC1014.2
   001253         125700     IF WRK-DU-0V12-1 = .0000000001 PERFORM PASS PERFORM          NC1014.2 92 327
   001254         125800     PRINT-DETAIL ELSE                                            NC1014.2 331
   001255      1  125900     PERFORM FAIL MOVE WRK-DU-0V12-1 TO COMPUTED-0V18 MOVE        NC1014.2 328 92 191
   001256      1  126000     .0000000001 TO CORRECT-0V18 PERFORM PRINT-DETAIL.            NC1014.2 204 331
   001257         126100     ADD 1 TO REC-CT.                                             NC1014.2 224
   001258         126200 MPY-TEST-F1-21-6.                                                NC1014.2
   001259         126300     IF      WRK-XN-00001 = "1"                                   NC1014.2 51
   001260      1  126400             PERFORM PASS                                         NC1014.2 327
   001261      1  126500             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001262         126600     ELSE                                                         NC1014.2
   001263      1  126700             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC1014.2
   001264      1  126800                  TO RE-MARK                                      NC1014.2 182
   001265      1  126900             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1014.2 51 187
   001266      1  127000             MOVE   "1"            TO CORRECT-X                   NC1014.2 201
   001267      1  127100             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001268         127200*                                                                 NC1014.2
   001269         127300 MPY-INIT-F1-22.                                                  NC1014.2
   001270         127400*   ==-->   SIZE ERROR CONDITION.   <--==                         NC1014.2
   001271         127500*   ==-->   MULTIPLE RESULT FIELDS  <--==                         NC1014.2
   001272         127600*   ==-->   NEW SIZE ERROR TESTS    <--==                         NC1014.2
   001273         127700     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1014.2 233
   001274         127800     MOVE   "MPY-TEST-F1-22" TO PAR-NAME.                         NC1014.2 177
   001275         127900     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001276         128000     MOVE    0  TO WRK-DU-2P4-1.                                  NC1014.2 100
   001277         128100     MOVE    0  TO WRK-DU-6V0-1.                                  NC1014.2 115
   001278         128200     MOVE    0  TO WRK-DU-6V0-2.                                  NC1014.2 116
   001279         128300     MOVE    0  TO WRK-DU-0V12-1.                                 NC1014.2 92
   001280         128400     MOVE   99  TO WRK-DU-2V0-1.                                  NC1014.2 101
   001281         128500     MOVE 12345.6 TO WRK-DU-5V1-1.                                NC1014.2 114
   001282         128600     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001283         128700 MPY-TEST-F1-22-0.                                                NC1014.2
   001284         128800     MULTIPLY WRK-DU-5V1-1 BY WRK-DU-2V0-1 ROUNDED WRK-DU-2P4-1   NC1014.2 114 101 100
   001285         128900             WRK-DU-6V0-1 ROUNDED WRK-DU-6V0-2 WRK-DU-0V12-1      NC1014.2 115 116 92
   001286      1  129000             ON SIZE ERROR MOVE "1" TO WRK-XN-00001               NC1014.2 51
   001287      1  129100         NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001.              NC1014.2 51
   001288         129200     GO TO MPY-TEST-F1-22-1.                                      NC1014.2 1294
   001289         129300 MPY-DELETE-F1-22.                                                NC1014.2
   001290         129400     PERFORM DE-LETE.                                             NC1014.2 329
   001291         129500     MOVE "*DELETED BY FCTC*" TO FEATURE.                         NC1014.2 173
   001292         129600     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001293         129700     GO TO MPY-INIT-F1-23.                                        NC1014.2 1336
   001294         129800 MPY-TEST-F1-22-1.                                                NC1014.2
   001295         129900     IF WRK-DU-5V1-1 = 12345.6 PERFORM PASS PERFORM PRINT-DETAIL  NC1014.2 114 327 331
   001296         130000     ELSE                                                         NC1014.2
   001297      1  130100     PERFORM FAIL MOVE WRK-DU-5V1-1 TO COMPUTED-N MOVE 12345.6    NC1014.2 328 114 189
   001298      1  130200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001299         130300     ADD 1 TO REC-CT.                                             NC1014.2 224
   001300         130400 MPY-TEST-F1-22-2.                                                NC1014.2
   001301         130500     IF WRK-DU-2P4-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 100 327 331
   001302         130600     ELSE                                                         NC1014.2
   001303      1  130700     PERFORM FAIL MOVE WRK-DU-2P4-1 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 100 189
   001304      1  130800     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001305         130900     ADD 1 TO REC-CT.                                             NC1014.2 224
   001306         131000 MPY-TEST-F1-22-3.                                                NC1014.2
   001307         131100     IF WRK-DU-6V0-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 115 327 331
   001308         131200     ELSE                                                         NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309      1  131300     PERFORM FAIL MOVE WRK-DU-6V0-1 TO COMPUTED-N MOVE 0          NC1014.2 328 115 189
   001310      1  131400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001311         131500     ADD 1 TO REC-CT.                                             NC1014.2 224
   001312         131600 MPY-TEST-F1-22-4.                                                NC1014.2
   001313         131700     IF WRK-DU-6V0-2 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 116 327 331
   001314         131800     ELSE                                                         NC1014.2
   001315      1  131900     PERFORM FAIL MOVE WRK-DU-6V0-2 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 116 189
   001316      1  132000     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001317         132100     ADD 1 TO REC-CT.                                             NC1014.2 224
   001318         132200 MPY-TEST-F1-22-5.                                                NC1014.2
   001319         132300     IF WRK-DU-0V12-1 = 0 PERFORM PASS PERFORM                    NC1014.2 92 327
   001320         132400     PRINT-DETAIL ELSE                                            NC1014.2 331
   001321      1  132500     PERFORM FAIL MOVE WRK-DU-0V12-1 TO COMPUTED-0V18 MOVE        NC1014.2 328 92 191
   001322      1  132600     0 TO CORRECT-0V18 PERFORM PRINT-DETAIL.                      NC1014.2 204 331
   001323         132700     ADD 1 TO REC-CT.                                             NC1014.2 224
   001324         132800 MPY-TEST-F1-22-6.                                                NC1014.2
   001325         132900     IF      WRK-XN-00001 = "1"                                   NC1014.2 51
   001326      1  133000             PERFORM PASS                                         NC1014.2 327
   001327      1  133100             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001328         133200     ELSE                                                         NC1014.2
   001329      1  133300             MOVE   "ON SIZE ERROR SHOULD HAVE EXECUTED"          NC1014.2
   001330      1  133400                  TO RE-MARK                                      NC1014.2 182
   001331      1  133500             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1014.2 51 187
   001332      1  133600             MOVE   "1"            TO CORRECT-X                   NC1014.2 201
   001333      1  133700             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001334         133800*                                                                 NC1014.2
   001335         133900*                                                                 NC1014.2
   001336         134000 MPY-INIT-F1-23.                                                  NC1014.2
   001337         134100*   ==-->   NO SIZE ERROR CONDITION.   <--==                      NC1014.2
   001338         134200*   ==-->   MULTIPLE RESULT FIELDS     <--==                      NC1014.2
   001339         134300*   ==-->   NEW SIZE ERROR TESTS       <--==                      NC1014.2
   001340         134400     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1014.2 233
   001341         134500     MOVE   "MPY-TEST-F1-23" TO PAR-NAME.                         NC1014.2 177
   001342         134600     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001343         134700     MOVE    0  TO WRK-DU-2P4-1.                                  NC1014.2 100
   001344         134800     MOVE    0  TO WRK-DU-6V0-1.                                  NC1014.2 115
   001345         134900     MOVE    0  TO WRK-DU-6V0-2.                                  NC1014.2 116
   001346         135000     MOVE   .00001  TO WRK-DU-0V12-1.                             NC1014.2 92
   001347         135100     MOVE   99  TO WRK-DU-2V0-1.                                  NC1014.2 101
   001348         135200     MOVE 12345.6 TO WRK-DU-5V1-1.                                NC1014.2 114
   001349         135300     MOVE .00001 TO WRK-DU-4P1-1.                                 NC1014.2 113
   001350         135400     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001351         135500 MPY-TEST-F1-23-0.                                                NC1014.2
   001352         135600     MULTIPLY WRK-DU-4P1-1 BY WRK-DU-5V1-1 ROUNDED WRK-DU-2P4-1   NC1014.2 113 114 100
   001353         135700             WRK-DU-6V0-1 ROUNDED                                 NC1014.2 115
   001354         135800             WRK-DU-6V0-2 ROUNDED WRK-DU-0V12-1                   NC1014.2 116 92
   001355      1  135900             ON SIZE ERROR MOVE "1" TO WRK-XN-00001               NC1014.2 51
   001356      1  136000         NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001.              NC1014.2 51
   001357         136100     GO TO MPY-TEST-F1-23-1.                                      NC1014.2 1363
   001358         136200 MPY-DELETE-F1-23.                                                NC1014.2
   001359         136300     PERFORM DE-LETE.                                             NC1014.2 329
   001360         136400     MOVE "*DELETED BY FCTC*" TO FEATURE.                         NC1014.2 173
   001361         136500     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001362         136600     GO TO MPY-INIT-F1-24.                                        NC1014.2 1405
   001363         136700 MPY-TEST-F1-23-1.                                                NC1014.2
   001364         136800     IF WRK-DU-5V1-1 = .1 PERFORM PASS PERFORM PRINT-DETAIL       NC1014.2 114 327 331
   001365         136900     ELSE                                                         NC1014.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366      1  137000     PERFORM FAIL MOVE WRK-DU-5V1-1 TO COMPUTED-N MOVE .1         NC1014.2 328 114 189
   001367      1  137100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001368         137200     ADD 1 TO REC-CT.                                             NC1014.2 224
   001369         137300 MPY-TEST-F1-23-2.                                                NC1014.2
   001370         137400     IF WRK-DU-2P4-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 100 327 331
   001371         137500     ELSE                                                         NC1014.2
   001372      1  137600     PERFORM FAIL MOVE WRK-DU-2P4-1 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 100 189
   001373      1  137700     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001374         137800     ADD 1 TO REC-CT.                                             NC1014.2 224
   001375         137900 MPY-TEST-F1-23-3.                                                NC1014.2
   001376         138000     IF WRK-DU-6V0-1 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 115 327 331
   001377         138100     ELSE                                                         NC1014.2
   001378      1  138200     PERFORM FAIL MOVE WRK-DU-6V0-1 TO COMPUTED-N MOVE 0          NC1014.2 328 115 189
   001379      1  138300     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1014.2 203 331
   001380         138400     ADD 1 TO REC-CT.                                             NC1014.2 224
   001381         138500 MPY-TEST-F1-23-4.                                                NC1014.2
   001382         138600     IF WRK-DU-6V0-2 = 0 PERFORM PASS PERFORM PRINT-DETAIL        NC1014.2 116 327 331
   001383         138700     ELSE                                                         NC1014.2
   001384      1  138800     PERFORM FAIL MOVE WRK-DU-6V0-2 TO COMPUTED-N MOVE 0 TO       NC1014.2 328 116 189
   001385      1  138900     CORRECT-N PERFORM PRINT-DETAIL.                              NC1014.2 203 331
   001386         139000     ADD 1 TO REC-CT.                                             NC1014.2 224
   001387         139100 MPY-TEST-F1-23-5.                                                NC1014.2
   001388         139200     IF WRK-DU-0V12-1 = .0000000001 PERFORM PASS PERFORM          NC1014.2 92 327
   001389         139300     PRINT-DETAIL ELSE                                            NC1014.2 331
   001390      1  139400     PERFORM FAIL MOVE WRK-DU-0V12-1 TO COMPUTED-0V18 MOVE        NC1014.2 328 92 191
   001391      1  139500     .0000000001 TO CORRECT-0V18 PERFORM PRINT-DETAIL.            NC1014.2 204 331
   001392         139600     ADD 1 TO REC-CT.                                             NC1014.2 224
   001393         139700 MPY-TEST-F1-23-6.                                                NC1014.2
   001394         139800     IF      WRK-XN-00001 = "2"                                   NC1014.2 51
   001395      1  139900             PERFORM PASS                                         NC1014.2 327
   001396      1  140000             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001397         140100     ELSE                                                         NC1014.2
   001398      1  140200             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC1014.2
   001399      1  140300                  TO RE-MARK                                      NC1014.2 182
   001400      1  140400             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1014.2 51 187
   001401      1  140500             MOVE   "1"            TO CORRECT-X                   NC1014.2 201
   001402      1  140600             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001403         140700*                                                                 NC1014.2
   001404         140800*                                                                 NC1014.2
   001405         140900 MPY-INIT-F1-24.                                                  NC1014.2
   001406         141000*    ==-->EXPLICIT SCOPE TERMINATOR <--==                         NC1014.2
   001407         141100*    ==-->   SIZE ERROR CONDITION   <--==                         NC1014.2
   001408         141200     MOVE   "IV-41 6.4.3" TO ANSI-REFERENCE.                      NC1014.2 233
   001409         141300     MOVE   "MPY-TEST-F1-24" TO PAR-NAME                          NC1014.2 177
   001410         141400     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001411         141500     MOVE    A10ONES-DS-10V00 TO WRK-DS-10V00.                    NC1014.2 52 50
   001412         141600     MOVE    0  TO WRK-DS-05V00.                                  NC1014.2 82
   001413         141700     MOVE    0  TO WRK-DS-02V00.                                  NC1014.2 56
   001414         141800     MOVE    0  TO WRK-CS-18V00.                                  NC1014.2 69
   001415         141900     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001416         142000 MPY-TEST-F1-24-0.                                                NC1014.2
   001417         142100     MULTIPLY A12THREES-DS-06V06 BY WRK-DS-10V00                  NC1014.2 54 50
   001418      1  142200         ON SIZE ERROR MOVE "1" TO WRK-XN-00001                   NC1014.2 51
   001419      1  142300                       MOVE 23  TO WRK-DS-05V00                   NC1014.2 82
   001420      1  142400                       MOVE -4  TO WRK-DS-02V00                   NC1014.2 56
   001421         142500     END-MULTIPLY                                                 NC1014.2
   001422         142600     MOVE    99 TO WRK-CS-18V00.                                  NC1014.2 69
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142700     GO TO   MPY-TEST-F1-24-1.                                    NC1014.2 1428
   001424         142800 MPY-DELETE-F1-24-1.                                              NC1014.2
   001425         142900     PERFORM DE-LETE.                                             NC1014.2 329
   001426         143000     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001427         143100     GO TO   MPY-INIT-F1-25.                                      NC1014.2 1489
   001428         143200 MPY-TEST-F1-24-1.                                                NC1014.2
   001429         143300     MOVE   "MPY-TEST-F1-24-1" TO PAR-NAME.                       NC1014.2 177
   001430         143400     IF      WRK-XN-00001 = "1"                                   NC1014.2 51
   001431      1  143500             PERFORM PASS                                         NC1014.2 327
   001432      1  143600             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001433         143700     ELSE                                                         NC1014.2
   001434      1  143800             MOVE   WRK-XN-00001 TO COMPUTED-X                    NC1014.2 51 187
   001435      1  143900             MOVE  "1"           TO CORRECT-X                     NC1014.2 201
   001436      1  144000             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1014.2 182
   001437      1  144100             PERFORM FAIL                                         NC1014.2 328
   001438      1  144200             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001439         144300     ADD     1 TO REC-CT.                                         NC1014.2 224
   001440         144400 MPY-TEST-F1-24-2.                                                NC1014.2
   001441         144500     MOVE   "MPY-TEST-F1-24-2" TO PAR-NAME.                       NC1014.2 177
   001442         144600     IF      WRK-DS-05V00 = 23                                    NC1014.2 82
   001443      1  144700             PERFORM PASS                                         NC1014.2 327
   001444      1  144800             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001445         144900     ELSE                                                         NC1014.2
   001446      1  145000             MOVE   WRK-DS-05V00 TO COMPUTED-N                    NC1014.2 82 189
   001447      1  145100             MOVE   23           TO CORRECT-N                     NC1014.2 203
   001448      1  145200             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1014.2 182
   001449      1  145300             PERFORM FAIL                                         NC1014.2 328
   001450      1  145400             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001451         145500     ADD     1 TO REC-CT.                                         NC1014.2 224
   001452         145600 MPY-TEST-F1-24-3.                                                NC1014.2
   001453         145700     MOVE   "MPY-TEST-F1-24-3" TO PAR-NAME.                       NC1014.2 177
   001454         145800     IF      WRK-DS-02V00 = -4                                    NC1014.2 56
   001455      1  145900             PERFORM PASS                                         NC1014.2 327
   001456      1  146000             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001457         146100     ELSE                                                         NC1014.2
   001458      1  146200             MOVE   WRK-DS-02V00 TO COMPUTED-N                    NC1014.2 56 189
   001459      1  146300             MOVE   -4           TO CORRECT-N                     NC1014.2 203
   001460      1  146400             MOVE  "ON SIZE ERROR NOT EXECUTED" TO RE-MARK        NC1014.2 182
   001461      1  146500             PERFORM FAIL                                         NC1014.2 328
   001462      1  146600             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001463         146700     ADD     1 TO REC-CT.                                         NC1014.2 224
   001464         146800 MPY-TEST-F1-24-4.                                                NC1014.2
   001465         146900     MOVE   "MPY-TEST-F1-24-4"  TO PAR-NAME.                      NC1014.2 177
   001466         147000     IF      WRK-DS-10V00 = 1111111111                            NC1014.2 50
   001467      1  147100             PERFORM PASS                                         NC1014.2 327
   001468      1  147200             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001469         147300     ELSE                                                         NC1014.2
   001470      1  147400             MOVE   WRK-DS-10V00       TO COMPUTED-18V0           NC1014.2 50 195
   001471      1  147500             MOVE   1111111111         TO CORRECT-18V0            NC1014.2 208
   001472      1  147600             MOVE  "ON SIZE ERROR NOT EXECUTED" TO RE-MARK        NC1014.2 182
   001473      1  147700             PERFORM FAIL                                         NC1014.2 328
   001474      1  147800             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001475         147900     ADD     1 TO REC-CT.                                         NC1014.2 224
   001476         148000 MPY-TEST-F1-24-5.                                                NC1014.2
   001477         148100     MOVE   "MPY-TEST-F1-24-5" TO PAR-NAME.                       NC1014.2 177
   001478         148200     IF      WRK-CS-18V00 = 000000000000000099                    NC1014.2 69
   001479      1  148300             PERFORM PASS                                         NC1014.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480      1  148400             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001481         148500     ELSE                                                         NC1014.2
   001482      1  148600             MOVE   WRK-CS-18V00       TO COMPUTED-N              NC1014.2 69 189
   001483      1  148700             MOVE   000000000000000099 TO CORRECT-N               NC1014.2 203
   001484      1  148800             MOVE  "SCOPE TERMINATOR IGNORED" TO RE-MARK          NC1014.2 182
   001485      1  148900             PERFORM FAIL                                         NC1014.2 328
   001486      1  149000             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001487         149100*                                                                 NC1014.2
   001488         149200*                                                                 NC1014.2
   001489         149300 MPY-INIT-F1-25.                                                  NC1014.2
   001490         149400*    ==-->EXPLICIT SCOPE TERMINATOR <--==                         NC1014.2
   001491         149500     MOVE   "IV-41 6.4.3" TO ANSI-REFERENCE.                      NC1014.2 233
   001492         149600     MOVE   "MPY-TEST-F1-25" TO PAR-NAME                          NC1014.2 177
   001493         149700     MOVE   "1" TO WRK-XN-00001.                                  NC1014.2 51
   001494         149800     MOVE   -99 TO WRK-DS-02V00.                                  NC1014.2 56
   001495         149900     MOVE    0  TO WRK-DS-10V00.                                  NC1014.2 50
   001496         150000     MOVE    0  TO WRK-DS-01V00.                                  NC1014.2 77
   001497         150100     MOVE    0  TO WRK-CS-18V00.                                  NC1014.2 69
   001498         150200     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001499         150300 MPY-TEST-F1-25-0.                                                NC1014.2
   001500         150400     MULTIPLY AZERO-DS-05V05 BY WRK-DS-02V00                      NC1014.2 57 56
   001501      1  150500          ON SIZE ERROR MOVE "0" TO WRK-XN-00001                  NC1014.2 51
   001502      1  150600                        MOVE 23  TO WRK-DS-10V00                  NC1014.2 50
   001503      1  150700                        MOVE -4  TO WRK-DS-01V00                  NC1014.2 77
   001504         150800     END-MULTIPLY                                                 NC1014.2
   001505         150900     MOVE    99 TO WRK-CS-18V00.                                  NC1014.2 69
   001506         151000     GO TO   MPY-TEST-F1-25-1.                                    NC1014.2 1511
   001507         151100 MPY-DELETE-F1-25-1.                                              NC1014.2
   001508         151200     PERFORM DE-LETE.                                             NC1014.2 329
   001509         151300     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001510         151400     GO TO   MPY-INIT-F1-26.                                      NC1014.2 1572
   001511         151500 MPY-TEST-F1-25-1.                                                NC1014.2
   001512         151600     MOVE   "MPY-TEST-F1-25-1" TO PAR-NAME.                       NC1014.2 177
   001513         151700     IF      WRK-XN-00001 = "1"                                   NC1014.2 51
   001514      1  151800             PERFORM PASS                                         NC1014.2 327
   001515      1  151900             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001516         152000     ELSE                                                         NC1014.2
   001517      1  152100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1014.2 51 187
   001518      1  152200             MOVE   "1"           TO CORRECT-X                    NC1014.2 201
   001519      1  152300             MOVE   "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARKNC1014.2 182
   001520      1  152400             PERFORM FAIL                                         NC1014.2 328
   001521      1  152500             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001522         152600     ADD     1  TO REC-CT.                                        NC1014.2 224
   001523         152700 MPY-TEST-F1-25-2.                                                NC1014.2
   001524         152800     MOVE   "MPY-TEST-F1-25-2" TO PAR-NAME.                       NC1014.2 177
   001525         152900     IF      WRK-DS-10V00 = 0000000000                            NC1014.2 50
   001526      1  153000             PERFORM PASS                                         NC1014.2 327
   001527      1  153100             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001528         153200     ELSE                                                         NC1014.2
   001529      1  153300             MOVE    WRK-DS-10V00 TO COMPUTED-N                   NC1014.2 50 189
   001530      1  153400             MOVE    0000000000   TO CORRECT-N                    NC1014.2 203
   001531      1  153500             MOVE   "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARKNC1014.2 182
   001532      1  153600             PERFORM FAIL                                         NC1014.2 328
   001533      1  153700             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001534         153800     ADD     1  TO REC-CT.                                        NC1014.2 224
   001535         153900 MPY-TEST-F1-25-3.                                                NC1014.2
   001536         154000     MOVE   "MPY-TEST-F1-25-3" TO PAR-NAME.                       NC1014.2 177
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154100     IF      WRK-DS-01V00 = 0                                     NC1014.2 77
   001538      1  154200             PERFORM PASS                                         NC1014.2 327
   001539      1  154300             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001540         154400     ELSE                                                         NC1014.2
   001541      1  154500             MOVE   WRK-DS-01V00 TO COMPUTED-N                    NC1014.2 77 189
   001542      1  154600             MOVE   0            TO CORRECT-N                     NC1014.2 203
   001543      1  154700             MOVE   "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARKNC1014.2 182
   001544      1  154800             PERFORM FAIL                                         NC1014.2 328
   001545      1  154900             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001546         155000     ADD     1  TO REC-CT.                                        NC1014.2 224
   001547         155100 MPY-TEST-F1-25-4.                                                NC1014.2
   001548         155200     MOVE   "MPY-TEST-F1-25-4" TO PAR-NAME.                       NC1014.2 177
   001549         155300     IF      WRK-DS-02V00 = 00                                    NC1014.2 56
   001550      1  155400             PERFORM PASS                                         NC1014.2 327
   001551      1  155500             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001552         155600     ELSE                                                         NC1014.2
   001553      1  155700             MOVE   WRK-DS-02V00 TO COMPUTED-N                    NC1014.2 56 189
   001554      1  155800             MOVE   00           TO CORRECT-N                     NC1014.2 203
   001555      1  155900             MOVE   "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARKNC1014.2 182
   001556      1  156000             PERFORM FAIL                                         NC1014.2 328
   001557      1  156100             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001558         156200     ADD     1  TO REC-CT.                                        NC1014.2 224
   001559         156300 MPY-TEST-F1-25-5.                                                NC1014.2
   001560         156400     MOVE   "MPY-TEST-F1-25-5" TO PAR-NAME.                       NC1014.2 177
   001561         156500     IF      WRK-CS-18V00 = 000000000000000099                    NC1014.2 69
   001562      1  156600             PERFORM PASS                                         NC1014.2 327
   001563      1  156700             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001564         156800     ELSE                                                         NC1014.2
   001565      1  156900             MOVE   WRK-CS-18V00       TO COMPUTED-N              NC1014.2 69 189
   001566      1  157000             MOVE   000000000000000099 TO CORRECT-N               NC1014.2 203
   001567      1  157100             MOVE  "SCOPE TERMINATOR IGNORED" TO RE-MARK          NC1014.2 182
   001568      1  157200             PERFORM FAIL                                         NC1014.2 328
   001569      1  157300             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001570         157400*                                                                 NC1014.2
   001571         157500*                                                                 NC1014.2
   001572         157600 MPY-INIT-F1-26.                                                  NC1014.2
   001573         157700*    ==-->EXPLICIT SCOPE TERMINATOR <--==                         NC1014.2
   001574         157800     MOVE   "IV-41 6.4.3" TO ANSI-REFERENCE.                      NC1014.2 233
   001575         157900     MOVE   "MPY-TEST-F1-26" TO PAR-NAME                          NC1014.2 177
   001576         158000     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001577         158100     MOVE    A10ONES-DS-10V00        TO WRK-DS-10V00.             NC1014.2 52 50
   001578         158200     MOVE    0  TO WRK-DS-05V00.                                  NC1014.2 82
   001579         158300     MOVE    0  TO WRK-DS-02V00.                                  NC1014.2 56
   001580         158400     MOVE    0  TO WRK-CS-18V00.                                  NC1014.2 69
   001581         158500     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001582         158600 MPY-TEST-F1-26-0.                                                NC1014.2
   001583         158700     MULTIPLY A12THREES-DS-06V06     BY WRK-DS-10V00              NC1014.2 54 50
   001584      1  158800          ON SIZE ERROR GO TO MPY-TEST-F1-26-01                   NC1014.2 1589
   001585      1  158900          NOT ON SIZE ERROR MOVE "1" TO WRK-XN-00001              NC1014.2 51
   001586      1  159000                            MOVE 23  TO WRK-DS-05V00              NC1014.2 82
   001587      1  159100                            MOVE -4  TO WRK-DS-02V00              NC1014.2 56
   001588         159200     END-MULTIPLY.                                                NC1014.2
   001589         159300 MPY-TEST-F1-26-01.                                               NC1014.2
   001590         159400     MOVE    99 TO WRK-CS-18V00.                                  NC1014.2 69
   001591         159500     GO TO   MPY-TEST-F1-26-1.                                    NC1014.2 1596
   001592         159600 MPY-DELETE-F1-26-1.                                              NC1014.2
   001593         159700     PERFORM DE-LETE.                                             NC1014.2 329
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159800     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001595         159900     GO TO   MPY-INIT-F1-27.                                      NC1014.2 1661
   001596         160000 MPY-TEST-F1-26-1.                                                NC1014.2
   001597         160100     MOVE   "MPY-TEST-F1-26-1" TO PAR-NAME.                       NC1014.2 177
   001598         160200     IF      WRK-XN-00001 = "0"                                   NC1014.2 51
   001599      1  160300             PERFORM PASS                                         NC1014.2 327
   001600      1  160400             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001601         160500     ELSE                                                         NC1014.2
   001602      1  160600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1014.2 51 187
   001603      1  160700             MOVE   "0"           TO CORRECT-X                    NC1014.2 201
   001604      1  160800             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1014.2
   001605      1  160900                  TO RE-MARK                                      NC1014.2 182
   001606      1  161000             PERFORM FAIL                                         NC1014.2 328
   001607      1  161100             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001608         161200     ADD     1  TO REC-CT.                                        NC1014.2 224
   001609         161300 MPY-TEST-F1-26-2.                                                NC1014.2
   001610         161400     MOVE   "MPY-TEST-F1-26-2" TO PAR-NAME.                       NC1014.2 177
   001611         161500     IF      WRK-DS-05V00 = 00000                                 NC1014.2 82
   001612      1  161600             PERFORM PASS                                         NC1014.2 327
   001613      1  161700             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001614         161800     ELSE                                                         NC1014.2
   001615      1  161900             MOVE    WRK-DS-05V00 TO COMPUTED-N                   NC1014.2 82 189
   001616      1  162000             MOVE    0            TO CORRECT-N                    NC1014.2 203
   001617      1  162100             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1014.2
   001618      1  162200                  TO RE-MARK                                      NC1014.2 182
   001619      1  162300             PERFORM FAIL                                         NC1014.2 328
   001620      1  162400             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001621         162500     ADD     1  TO REC-CT.                                        NC1014.2 224
   001622         162600 MPY-TEST-F1-26-3.                                                NC1014.2
   001623         162700     MOVE   "MPY-TEST-F1-26-3" TO PAR-NAME.                       NC1014.2 177
   001624         162800     IF      WRK-DS-02V00 = 0                                     NC1014.2 56
   001625      1  162900             PERFORM PASS                                         NC1014.2 327
   001626      1  163000             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001627         163100     ELSE                                                         NC1014.2
   001628      1  163200             MOVE   WRK-DS-02V00 TO COMPUTED-N                    NC1014.2 56 189
   001629      1  163300             MOVE   0            TO CORRECT-N                     NC1014.2 203
   001630      1  163400             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1014.2
   001631      1  163500                  TO RE-MARK                                      NC1014.2 182
   001632      1  163600             PERFORM FAIL                                         NC1014.2 328
   001633      1  163700             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001634         163800     ADD     1  TO REC-CT.                                        NC1014.2 224
   001635         163900 MPY-TEST-F1-26-4.                                                NC1014.2
   001636         164000     MOVE   "MPY-TEST-F1-26-4" TO PAR-NAME.                       NC1014.2 177
   001637         164100     IF      WRK-CS-18V00 = 000000000000000099                    NC1014.2 69
   001638      1  164200             PERFORM PASS                                         NC1014.2 327
   001639      1  164300             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001640         164400     ELSE                                                         NC1014.2
   001641      1  164500             MOVE   WRK-CS-18V00       TO COMPUTED-N              NC1014.2 69 189
   001642      1  164600             MOVE   000000000000000099 TO CORRECT-N               NC1014.2 203
   001643      1  164700             MOVE  "SCOPE TERMINATOR IGNORED" TO RE-MARK          NC1014.2 182
   001644      1  164800             PERFORM FAIL                                         NC1014.2 328
   001645      1  164900             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001646         165000     ADD     1  TO REC-CT.                                        NC1014.2 224
   001647         165100 MPY-TEST-F1-26-5.                                                NC1014.2
   001648         165200     MOVE   "MPY-TEST-F1-26-5" TO PAR-NAME.                       NC1014.2 177
   001649         165300     IF      WRK-DS-10V00 = 1111111111                            NC1014.2 50
   001650      1  165400             PERFORM PASS                                         NC1014.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651      1  165500             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001652         165600     ELSE                                                         NC1014.2
   001653      1  165700             MOVE    WRK-DS-10V00 TO COMPUTED-18V0                NC1014.2 50 195
   001654      1  165800             MOVE    1111111111   TO CORRECT-18V0                 NC1014.2 208
   001655      1  165900             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1014.2
   001656      1  166000                  TO RE-MARK                                      NC1014.2 182
   001657      1  166100             PERFORM FAIL                                         NC1014.2 328
   001658      1  166200             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001659         166300*                                                                 NC1014.2
   001660         166400*                                                                 NC1014.2
   001661         166500 MPY-INIT-F1-27.                                                  NC1014.2
   001662         166600*    ==-->EXPLICIT SCOPE TERMINATOR <--==                         NC1014.2
   001663         166700     MOVE   "IV-41 6.4.3" TO ANSI-REFERENCE.                      NC1014.2 233
   001664         166800     MOVE   "1" TO WRK-XN-00001.                                  NC1014.2 51
   001665         166900     MOVE   -99 TO WRK-DS-02V00.                                  NC1014.2 56
   001666         167000     MOVE    0  TO WRK-DS-10V00.                                  NC1014.2 50
   001667         167100     MOVE    0  TO WRK-DS-01V00.                                  NC1014.2 77
   001668         167200     MOVE    0  TO WRK-DS-18V00.                                  NC1014.2 45
   001669         167300     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001670         167400 MPY-TEST-F1-27-0.                                                NC1014.2
   001671         167500     MULTIPLY AZERO-DS-05V05      BY WRK-DS-02V00                 NC1014.2 57 56
   001672      1  167600       ON SIZE ERROR GO TO MPY-TEST-F1-27-01                      NC1014.2 1677
   001673      1  167700       NOT ON SIZE ERROR MOVE "0" TO WRK-XN-00001                 NC1014.2 51
   001674      1  167800                         MOVE 23  TO WRK-DS-10V00                 NC1014.2 50
   001675      1  167900                         MOVE -4  TO WRK-DS-01V00                 NC1014.2 77
   001676         168000     END-MULTIPLY.                                                NC1014.2
   001677         168100 MPY-TEST-F1-27-01.                                               NC1014.2
   001678         168200     MOVE    99 TO WRK-CS-18V00.                                  NC1014.2 69
   001679         168300     GO TO   MPY-TEST-F1-27-1.                                    NC1014.2 1684
   001680         168400 MPY-DELETE-F1-27-1.                                              NC1014.2
   001681         168500     PERFORM DE-LETE.                                             NC1014.2 329
   001682         168600     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001683         168700     GO TO   MPY-INIT-F1-28.                                      NC1014.2 1749
   001684         168800 MPY-TEST-F1-27-1.                                                NC1014.2
   001685         168900     MOVE   "MPY-TEST-F1-27-1" TO PAR-NAME.                       NC1014.2 177
   001686         169000     IF      WRK-XN-00001 = "0"                                   NC1014.2 51
   001687      1  169100             PERFORM PASS                                         NC1014.2 327
   001688      1  169200             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001689         169300     ELSE                                                         NC1014.2
   001690      1  169400             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1014.2 51 187
   001691      1  169500             MOVE   "0"           TO CORRECT-X                    NC1014.2 201
   001692      1  169600             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1014.2
   001693      1  169700                  TO RE-MARK                                      NC1014.2 182
   001694      1  169800             PERFORM FAIL                                         NC1014.2 328
   001695      1  169900             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001696         170000     ADD 1 TO REC-CT.                                             NC1014.2 224
   001697         170100 MPY-TEST-F1-27-2.                                                NC1014.2
   001698         170200     MOVE   "MPY-TEST-F1-27-2" TO PAR-NAME.                       NC1014.2 177
   001699         170300     IF      WRK-DS-10V00 = 23                                    NC1014.2 50
   001700      1  170400             PERFORM PASS                                         NC1014.2 327
   001701      1  170500             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001702         170600     ELSE                                                         NC1014.2
   001703      1  170700             MOVE   WRK-DS-10V00 TO COMPUTED-N                    NC1014.2 50 189
   001704      1  170800             MOVE   23           TO CORRECT-N                     NC1014.2 203
   001705      1  170900             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1014.2
   001706      1  171000                  TO RE-MARK                                      NC1014.2 182
   001707      1  171100             PERFORM FAIL                                         NC1014.2 328
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708      1  171200             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001709         171300     ADD 1 TO REC-CT.                                             NC1014.2 224
   001710         171400 MPY-TEST-F1-27-3.                                                NC1014.2
   001711         171500     MOVE   "MPY-TEST-F1-27-3" TO PAR-NAME.                       NC1014.2 177
   001712         171600     IF      WRK-DS-02V00 = 00                                    NC1014.2 56
   001713      1  171700             PERFORM PASS                                         NC1014.2 327
   001714      1  171800             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001715         171900     ELSE                                                         NC1014.2
   001716      1  172000             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1014.2 56 189
   001717      1  172100             MOVE    00           TO CORRECT-N                    NC1014.2 203
   001718      1  172200             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1014.2
   001719      1  172300                  TO RE-MARK                                      NC1014.2 182
   001720      1  172400             PERFORM FAIL                                         NC1014.2 328
   001721      1  172500             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001722         172600     ADD 1 TO REC-CT.                                             NC1014.2 224
   001723         172700 MPY-TEST-F1-27-4.                                                NC1014.2
   001724         172800     MOVE   "MPY-TEST-F1-27-4" TO PAR-NAME.                       NC1014.2 177
   001725         172900     IF      WRK-DS-01V00 = -4                                    NC1014.2 77
   001726      1  173000             PERFORM PASS                                         NC1014.2 327
   001727      1  173100             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001728         173200     ELSE                                                         NC1014.2
   001729      1  173300             MOVE   WRK-DS-01V00 TO COMPUTED-N                    NC1014.2 77 189
   001730      1  173400             MOVE   -4           TO CORRECT-N                     NC1014.2 203
   001731      1  173500             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1014.2
   001732      1  173600                  TO RE-MARK                                      NC1014.2 182
   001733      1  173700             PERFORM FAIL                                         NC1014.2 328
   001734      1  173800             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001735         173900     ADD 1 TO REC-CT.                                             NC1014.2 224
   001736         174000 MPY-TEST-F1-27-5.                                                NC1014.2
   001737         174100     MOVE   "MPY-TEST-F1-27-5" TO PAR-NAME                        NC1014.2 177
   001738         174200     IF      WRK-CS-18V00 = 000000000000000099                    NC1014.2 69
   001739      1  174300             PERFORM PASS                                         NC1014.2 327
   001740      1  174400             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001741         174500     ELSE                                                         NC1014.2
   001742      1  174600             MOVE    WRK-CS-18V00       TO COMPUTED-N             NC1014.2 69 189
   001743      1  174700             MOVE    000000000000000099 TO CORRECT-N              NC1014.2 203
   001744      1  174800             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1014.2 182
   001745      1  174900             PERFORM FAIL                                         NC1014.2 328
   001746      1  175000             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001747         175100*                                                                 NC1014.2
   001748         175200*                                                                 NC1014.2
   001749         175300 MPY-INIT-F1-28.                                                  NC1014.2
   001750         175400*    ==-->EXPLICIT SCOPE TERMINATOR <--==                         NC1014.2
   001751         175500     MOVE    A10ONES-DS-10V00        TO WRK-DS-10V00.             NC1014.2 52 50
   001752         175600     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001753         175700     MOVE    0  TO WRK-CS-18V00.                                  NC1014.2 69
   001754         175800     MOVE    1  TO REC-CT.                                        NC1014.2 224
   001755         175900 MPY-TEST-F1-28-0.                                                NC1014.2
   001756         176000     MULTIPLY A12THREES-DS-06V06     BY WRK-DS-10V00              NC1014.2 54 50
   001757      1  176100              ON SIZE ERROR MOVE "1" TO WRK-XN-00001              NC1014.2 51
   001758      1  176200          NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001              NC1014.2 51
   001759         176300     END-MULTIPLY                                                 NC1014.2
   001760         176400     MOVE    99 TO WRK-CS-18V00.                                  NC1014.2 69
   001761         176500     GO TO   MPY-TEST-F1-28-1.                                    NC1014.2 1766
   001762         176600 MPY-DELETE-F1-28-1.                                              NC1014.2
   001763         176700     PERFORM DE-LETE.                                             NC1014.2 329
   001764         176800     PERFORM PRINT-DETAIL.                                        NC1014.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176900     GO TO   MPY-INIT-F1-29.                                      NC1014.2 1805
   001766         177000 MPY-TEST-F1-28-1.                                                NC1014.2
   001767         177100     MOVE   "MPY-TEST-F1-28-1" TO PAR-NAME.                       NC1014.2 177
   001768         177200     IF      WRK-XN-00001 = "1"                                   NC1014.2 51
   001769      1  177300             PERFORM PASS                                         NC1014.2 327
   001770      1  177400             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001771         177500     ELSE                                                         NC1014.2
   001772      1  177600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1014.2 51 187
   001773      1  177700             MOVE   "1"           TO CORRECT-X                    NC1014.2 201
   001774      1  177800             MOVE   "SIZE ERROR SHOULD HAVE OCCURRED"             NC1014.2
   001775      1  177900                  TO RE-MARK                                      NC1014.2 182
   001776      1  178000             PERFORM FAIL                                         NC1014.2 328
   001777      1  178100             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001778         178200     ADD     1  TO REC-CT.                                        NC1014.2 224
   001779         178300 MPY-TEST-F1-28-2.                                                NC1014.2
   001780         178400     MOVE   "MPY-TEST-F1-28-2" TO PAR-NAME.                       NC1014.2 177
   001781         178500     IF      WRK-DS-10V00 = 1111111111                            NC1014.2 50
   001782      1  178600             PERFORM PASS                                         NC1014.2 327
   001783      1  178700             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001784         178800     ELSE                                                         NC1014.2
   001785      1  178900             MOVE    WRK-DS-10V00 TO COMPUTED-18V0                NC1014.2 50 195
   001786      1  179000             MOVE    1111111111   TO CORRECT-18V0                 NC1014.2 208
   001787      1  179100             MOVE   "SIZE ERROR SHOULD HAVE OCCURRED"             NC1014.2
   001788      1  179200                  TO RE-MARK                                      NC1014.2 182
   001789      1  179300             PERFORM FAIL                                         NC1014.2 328
   001790      1  179400             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001791         179500     ADD     1  TO REC-CT.                                        NC1014.2 224
   001792         179600 MPY-TEST-F1-28-3.                                                NC1014.2
   001793         179700     MOVE   "MPY-TEST-F1-28-3" TO PAR-NAME.                       NC1014.2 177
   001794         179800     IF      WRK-CS-18V00 = 000000000000000099                    NC1014.2 69
   001795      1  179900             PERFORM PASS                                         NC1014.2 327
   001796      1  180000             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001797         180100     ELSE                                                         NC1014.2
   001798      1  180200             MOVE    WRK-CS-18V00       TO COMPUTED-N             NC1014.2 69 189
   001799      1  180300             MOVE    000000000000000099 TO CORRECT-N              NC1014.2 203
   001800      1  180400             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1014.2 182
   001801      1  180500             PERFORM FAIL                                         NC1014.2 328
   001802      1  180600             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001803         180700*                                                                 NC1014.2
   001804         180800*                                                                 NC1014.2
   001805         180900 MPY-INIT-F1-29.                                                  NC1014.2
   001806         181000*    ==-->EXPLICIT SCOPE TERMINATOR <--==                         NC1014.2
   001807         181100     MOVE   "0" TO WRK-XN-00001.                                  NC1014.2 51
   001808         181200     MOVE   -99 TO WRK-DS-02V00.                                  NC1014.2 56
   001809         181300     MOVE    ZERO TO WRK-CS-18V00.                                NC1014.2 IMP 69
   001810         181400     MOVE    1 TO REC-CT.                                         NC1014.2 224
   001811         181500 MPY-TEST-F1-29-0.                                                NC1014.2
   001812         181600     MULTIPLY AZERO-DS-05V05         BY WRK-DS-02V00              NC1014.2 57 56
   001813      1  181700              ON SIZE ERROR MOVE "1" TO WRK-XN-00001              NC1014.2 51
   001814      1  181800          NOT ON SIZE ERROR MOVE "2" TO WRK-XN-00001              NC1014.2 51
   001815         181900     END-MULTIPLY                                                 NC1014.2
   001816         182000     MOVE    99 TO WRK-CS-18V00.                                  NC1014.2 69
   001817         182100     GO TO   MPY-TEST-F1-29-1.                                    NC1014.2 1822
   001818         182200 MPY-DELETE-F1-29-1.                                              NC1014.2
   001819         182300     PERFORM DE-LETE.                                             NC1014.2 329
   001820         182400     PERFORM PRINT-DETAIL.                                        NC1014.2 331
   001821         182500     GO TO   CCVS-EXIT.                                           NC1014.2 1861
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182600 MPY-TEST-F1-29-1.                                                NC1014.2
   001823         182700     MOVE   "MPY-TEST-F1-29-1" TO PAR-NAME.                       NC1014.2 177
   001824         182800     IF      WRK-XN-00001 = "2"                                   NC1014.2 51
   001825      1  182900             PERFORM PASS                                         NC1014.2 327
   001826      1  183000             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001827         183100     ELSE                                                         NC1014.2
   001828      1  183200             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1014.2 51 187
   001829      1  183300             MOVE   "2"           TO CORRECT-X                    NC1014.2 201
   001830      1  183400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1014.2
   001831      1  183500                  TO RE-MARK                                      NC1014.2 182
   001832      1  183600             PERFORM FAIL                                         NC1014.2 328
   001833      1  183700             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001834         183800     ADD     1 TO REC-CT.                                         NC1014.2 224
   001835         183900 MPY-TEST-F1-29-2.                                                NC1014.2
   001836         184000     MOVE   "MPY-TEST-F1-29-2" TO PAR-NAME.                       NC1014.2 177
   001837         184100     IF      WRK-DS-02V00 = 00                                    NC1014.2 56
   001838      1  184200             PERFORM PASS                                         NC1014.2 327
   001839      1  184300             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001840         184400     ELSE                                                         NC1014.2
   001841      1  184500             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1014.2 56 189
   001842      1  184600             MOVE    00           TO CORRECT-N                    NC1014.2 203
   001843      1  184700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1014.2
   001844      1  184800                  TO RE-MARK                                      NC1014.2 182
   001845      1  184900             PERFORM FAIL                                         NC1014.2 328
   001846      1  185000             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001847         185100     ADD     1 TO REC-CT.                                         NC1014.2 224
   001848         185200 MPY-TEST-F1-29-3.                                                NC1014.2
   001849         185300     MOVE   "MPY-TEST-F1-29-3" TO PAR-NAME.                       NC1014.2 177
   001850         185400     IF      WRK-CS-18V00 = 000000000000000099                    NC1014.2 69
   001851      1  185500             PERFORM PASS                                         NC1014.2 327
   001852      1  185600             PERFORM PRINT-DETAIL                                 NC1014.2 331
   001853         185700     ELSE                                                         NC1014.2
   001854      1  185800             MOVE    WRK-CS-18V00       TO COMPUTED-N             NC1014.2 69 189
   001855      1  185900             MOVE    000000000000000099 TO CORRECT-N              NC1014.2 203
   001856      1  186000             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1014.2 182
   001857      1  186100             PERFORM FAIL                                         NC1014.2 328
   001858      1  186200             PERFORM PRINT-DETAIL.                                NC1014.2 331
   001859         186300*                                                                 NC1014.2
   001860         186400*                                                                 NC1014.2
   001861         186500 CCVS-EXIT SECTION.                                               NC1014.2
   001862         186600 CCVS-999999.                                                     NC1014.2
   001863         186700     GO TO CLOSE-FILES.                                           NC1014.2 320
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    36
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      233   ANSI-REFERENCE . . . . . . . .  410 417 426 M435 M457 M478 M520 M562 M583 M604 M642 M679 M717 M754 M774 M796
                                            M837 M878 M918 M958 M1007 M1072 M1139 M1205 M1273 M1340 M1408 M1491 M1574 M1663
       57   AZERO-DS-05V05 . . . . . . . .  646 843 923 1500 1671 1812
       73   A01ONE-CS-00V01. . . . . . . .  757
       63   A01ONE-DS-P0801. . . . . . . .  777
      132   A01ONES-CS-18V00
      134   A02THREES-CS-18V00
       83   A02TWOS-DS-03V02
       81   A02TWOS-DU-02V00
       60   A05ONES-DS-00V05
       46   A06THREES-DS-03V03 . . . . . .  565
       49   A08TWOS-DS-02V06 . . . . . . .  584
       52   A10ONES-DS-10V00 . . . . . . .  606 1411 1577 1751
       61   A12ONES-DS-12V00
       54   A12THREES-DS-06V06 . . . . . .  608 802 883 1417 1583 1756
      140   A14TWOS-CU-18V00
      138   A16NINES-CU-18V00
       79   A18ONES-DS-09V09
       66   A18ONES-DS-18V00 . . . . . . .  775
      136   A18SIXES-CU-18V00
       71   A99-CS-02V00
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
      188   COMPUTED-A . . . . . . . . . .  189 191 192 193 194 422 425 M632 M668 M706 M743
      189   COMPUTED-N . . . . . . . . . .  M450 M471 M512 M554 M657 M694 M732 M764 M870 M950 M976 M982 M988 M994 M1030 M1036
                                            M1042 M1048 M1097 M1103 M1109 M1115 M1163 M1169 M1175 M1181 M1231 M1237 M1243
                                            M1249 M1297 M1303 M1309 M1315 M1366 M1372 M1378 M1384 M1446 M1458 M1482 M1529
                                            M1541 M1553 M1565 M1615 M1628 M1641 M1703 M1716 M1729 M1742 M1798 M1841 M1854
      187   COMPUTED-X . . . . . . . . . .  M339 407 M494 M537 M816 M857 M897 M937 M1064 M1131 M1197 M1265 M1331 M1400 M1434
                                            M1517 M1602 M1690 M1772 M1828
      191   COMPUTED-0V18. . . . . . . . .  M1000 M1054 M1121 M1187 M1255 M1321 M1390
      193   COMPUTED-14V4
      195   COMPUTED-18V0. . . . . . . . .  M576 M596 M619 M784 M828 M909 M1470 M1653 M1785
      192   COMPUTED-4V14
      211   COR-ANSI-REFERENCE . . . . . .  M417 M419
      202   CORRECT-A. . . . . . . . . . .  203 204 205 206 207 423 425 M631 M667 M705 M742
      203   CORRECT-N. . . . . . . . . . .  M451 M472 M513 M555 M658 M695 M733 M763 M871 M951 M977 M983 M989 M995 M1031 M1037
                                            M1043 M1049 M1098 M1104 M1110 M1116 M1164 M1170 M1176 M1182 M1232 M1238 M1244
                                            M1250 M1298 M1304 M1310 M1316 M1367 M1373 M1379 M1385 M1447 M1459 M1483 M1530
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    37
0 Defined   Cross-reference of data names   References

0                                           M1542 M1554 M1566 M1616 M1629 M1642 M1704 M1717 M1730 M1743 M1799 M1842 M1855
      201   CORRECT-X. . . . . . . . . . .  M340 409 M495 M536 M817 M858 M898 M938 M1065 M1132 M1198 M1266 M1332 M1401 M1435
                                            M1518 M1603 M1691 M1773 M1829
      204   CORRECT-0V18 . . . . . . . . .  M1001 M1055 M1122 M1188 M1256 M1322 M1391
      206   CORRECT-14V4
      208   CORRECT-18V0 . . . . . . . . .  M575 M597 M620 M783 M829 M910 M1471 M1654 M1786
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
      173   FEATURE. . . . . . . . . . . .  M434 M970 M1024 M1091 M1157 M1225 M1291 M1360
      304   HYPHEN-LINE. . . . . . . . . .  351 353 397
      270   ID-AGAIN . . . . . . . . . . .  M316
      303   INF-ANSI-REFERENCE . . . . . .  M410 M413 M426 M428
      298   INFO-TEXT. . . . . . . . . . .  M411
      227   INSPECT-COUNTER. . . . . . . .  M326 357 379 381
      142   MULTIPLY-DATA
      143   MULT1. . . . . . . . . . . . .  M436 M439 440 450
      145   MULT2
      146   MULT3
      147   MULT4. . . . . . . . . . . . .  M458 M460 461 471
      149   MULT5. . . . . . . . . . . . .  M437 439 M479 482 M482 502 512
      150   MULT6. . . . . . . . . . . . .  M521 M524 544 554
      175   P-OR-F . . . . . . . . . . . .  M326 M327 M328 M329 336 M339
      177   PAR-NAME . . . . . . . . . . .  M341 M453 M474 M499 M516 M541 M558 M579 M600 M624 M638 M661 M675 M699 M713 M736
                                            M750 M770 M790 M797 M811 M823 M838 M852 M865 M892 M904 M932 M945 M960 M1008 M1073
                                            M1140 M1206 M1274 M1341 M1409 M1429 M1441 M1453 M1465 M1477 M1492 M1512 M1524
                                            M1536 M1548 M1560 M1575 M1597 M1610 M1623 M1636 M1648 M1685 M1698 M1711 M1724
                                            M1737 M1767 M1780 M1793 M1823 M1836 M1849
      179   PARDOT-X . . . . . . . . . . .  M333
      228   PASS-COUNTER . . . . . . . . .  M327 359 361
       41   PRINT-FILE . . . . . . . . . .  37 315 321
       42   PRINT-REC. . . . . . . . . . .  M335 M416 M418
      182   RE-MARK. . . . . . . . . . . .  M330 M342 M496 M514 M538 M556 M621 M630 M669 M696 M707 M744 M818 M830 M860 M899
                                            M911 M940 M952 M1063 M1130 M1196 M1264 M1330 M1399 M1436 M1448 M1460 M1472 M1484
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    38
0 Defined   Cross-reference of data names   References

0                                           M1519 M1531 M1543 M1555 M1567 M1605 M1618 M1631 M1643 M1656 M1693 M1706 M1719
                                            M1732 M1744 M1775 M1788 M1800 M1831 M1844 M1856
      224   REC-CT . . . . . . . . . . . .  332 334 341 M800 M821 M840 M863 M881 M902 M921 M943 M963 M978 M984 M990 M996
                                            M1016 M1032 M1038 M1044 M1050 M1056 M1082 M1099 M1105 M1111 M1117 M1123 M1148
                                            M1165 M1171 M1177 M1183 M1189 M1215 M1233 M1239 M1245 M1251 M1257 M1282 M1299
                                            M1305 M1311 M1317 M1323 M1350 M1368 M1374 M1380 M1386 M1392 M1415 M1439 M1451
                                            M1463 M1475 M1498 M1522 M1534 M1546 M1558 M1581 M1608 M1621 M1634 M1646 M1669
                                            M1696 M1709 M1722 M1735 M1754 M1778 M1791 M1810 M1834 M1847
      223   REC-SKL-SUB
      232   RECORD-COUNT . . . . . . . . .  M386 387 M399
      183   TEST-COMPUTED. . . . . . . . .  416
      198   TEST-CORRECT . . . . . . . . .  418
      251   TEST-ID. . . . . . . . . . . .  M316
      171   TEST-RESULTS . . . . . . . . .  M317 335
      229   TOTAL-ERROR
       88   WRK-AN-X-18-1
       84   WRK-CS-02V02
       69   WRK-CS-18V00 . . . . . . . . .  M775 M777 779 M1414 M1422 1478 1482 M1497 M1505 1561 1565 M1580 M1590 1637 1641
                                            M1678 1738 1742 M1753 M1760 1794 1798 M1809 M1816 1850 1854
       77   WRK-DS-01V00 . . . . . . . . .  M1496 M1503 1537 1541 M1667 M1675 1725 1729
       56   WRK-DS-02V00 . . . . . . . . .  M644 M646 649 657 M681 M683 686 694 M719 M721 724 732 M841 M843 866 870 M920
                                            M923 946 950 M1413 M1420 1454 1458 M1494 M1500 1549 1553 M1579 M1587 1624 1628
                                            M1665 M1671 1712 1716 M1808 M1812 1837 1841
       68   WRK-DS-0201P . . . . . . . . .  M755 M757 759
       78   WRK-DS-03V10
       82   WRK-DS-05V00 . . . . . . . . .  M759 760 764 M1412 M1419 1442 1446 M1578 M1586 1611 1615
       47   WRK-DS-06V06 . . . . . . . . .  48 M584 M586
       64   WRK-DS-09V08 . . . . . . . . .  65
       58   WRK-DS-09V09 . . . . . . . . .  59
      119   WRK-DS-1V0-1
      120   WRK-DS-1V0-2
      121   WRK-DS-1V2-1
       50   WRK-DS-10V00 . . . . . . . . .  M606 M608 611 619 M799 M802 824 828 M880 M883 905 909 M1411 M1417 1466 1470 M1495
                                            M1502 1525 1529 M1577 M1583 1649 1653 M1666 M1674 1699 1703 M1751 M1756 1781
                                            1785
       76   WRK-DS-12V00
       48   WRK-DS-12V00-S . . . . . . . .  588 596
      126   WRK-DS-16V2-1
       65   WRK-DS-17V00-S
       45   WRK-DS-18V00 . . . . . . . . .  M563 M565 567 576 M1668
       59   WRK-DS-18V00-S
      122   WRK-DS-2V0-1
      123   WRK-DS-2V1-1
      124   WRK-DS-2V2-1
      125   WRK-DS-2V2-2
       89   WRK-DU-X-18V0-1
       90   WRK-DU-0V1-1
       92   WRK-DU-0V12-1. . . . . . . . .  M966 998 1000 M1013 M1019 1052 1054 M1078 M1086 1119 1121 M1145 M1151 1185 1187
                                            M1211 M1219 1253 1255 M1279 M1285 1319 1321 M1346 M1354 1388 1390
       91   WRK-DU-0V2-1
       93   WRK-DU-1V0-1
       94   WRK-DU-1V1-1
       95   WRK-DU-1V1-2
       99   WRK-DU-1V17-1
       96   WRK-DU-1V3-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    39
0 Defined   Cross-reference of data names   References

0      97   WRK-DU-1V3-2
       98   WRK-DU-1V5-1
      117   WRK-DU-16V2-1
       70   WRK-DU-18V00 . . . . . . . . .  M779 780 784
      100   WRK-DU-2P4-1 . . . . . . . . .  M965 980 982 M1010 M1018 1034 1036 M1075 M1084 1101 1103 M1142 M1150 1167 1169
                                            M1208 M1217 1235 1237 M1276 M1284 1301 1303 M1343 M1352 1370 1372
      101   WRK-DU-2V0-1 . . . . . . . . .  M1014 M1018 1028 1030 M1079 M1146 M1150 1161 1163 M1212 M1280 M1284 M1347
      102   WRK-DU-2V0-2
      103   WRK-DU-2V0-3
      104   WRK-DU-2V1-1
      105   WRK-DU-2V1-2
      106   WRK-DU-2V1-3
      107   WRK-DU-2V2-1
      108   WRK-DU-2V2-2
      109   WRK-DU-2V2-3
      110   WRK-DU-2V2-4
      111   WRK-DU-2V2-5
      112   WRK-DU-2V5-1
      113   WRK-DU-4P1-1 . . . . . . . . .  M961 965 M1081 1084 M1214 1217 M1349 1352
      114   WRK-DU-5V1-1 . . . . . . . . .  M962 M965 974 976 M1015 1018 M1080 M1084 1095 1097 M1147 1150 M1213 M1217 1229
                                            1231 M1281 1284 1295 1297 M1348 M1352 1364 1366
      115   WRK-DU-6V0-1 . . . . . . . . .  M966 986 988 M1011 M1019 1040 1042 M1076 M1085 1107 1109 M1143 M1151 1173 1175
                                            M1209 M1218 1241 1243 M1277 M1285 1307 1309 M1344 M1353 1376 1378
      116   WRK-DU-6V0-2 . . . . . . . . .  M966 992 994 M1012 M1019 1046 1048 M1077 M1085 1113 1115 M1144 M1151 1179 1181
                                            M1210 M1219 1247 1249 M1278 M1285 1313 1315 M1345 M1354 1382 1384
      118   WRK-NE-X-1
      127   WRK-NE-X-2
      128   WRK-NE-1
      129   WRK-NE-2
      130   WRK-NE-3
      131   WRK-NE-4
       51   WRK-XN-00001 . . . . . . . . .  M605 M609 627 632 M643 M647 664 668 M680 M684 702 706 M718 M722 739 743 M798
                                            M804 812 816 M839 M845 853 857 M879 M884 M885 893 897 M919 M924 M925 933 937
                                            M1009 M1020 1058 1064 M1074 M1087 1125 1131 M1141 M1153 1191 1197 M1207 M1221
                                            1259 1265 M1275 M1286 M1287 1325 1331 M1342 M1355 M1356 1394 1400 M1410 M1418
                                            1430 1434 M1493 M1501 1513 1517 M1576 M1585 1598 1602 M1664 M1673 1686 1690 M1752
                                            M1757 M1758 1768 1772 M1807 M1813 M1814 1824 1828
       87   WRK-XN-18-1. . . . . . . . . .  88 89
       86   XRAY . . . . . . . . . . . . .  M480 M483 485 494 M522 M525 527 537
      300   XXCOMPUTED . . . . . . . . . .  M425
      302   XXCORRECT. . . . . . . . . . .  M425
      295   XXINFO . . . . . . . . . . . .  412 427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    40
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
     1861   CCVS-EXIT. . . . . . . . . . .  G1821
     1862   CCVS-999999
      313   CCVS1
      430   CCVS1-EXIT . . . . . . . . . .  G319
      320   CLOSE-FILES. . . . . . . . . .  G1863
      348   COLUMN-NAMES-ROUTINE . . . . .  E318
      329   DE-LETE. . . . . . . . . . . .  P446 P467 P491 P508 P533 P550 P572 P593 P616 P636 P654 P673 P691 P711 P729 P748
                                            P768 P788 P807 P848 P888 P928 P969 P1023 P1090 P1156 P1224 P1290 P1359 P1425
                                            P1508 P1593 P1681 P1763 P1819
      352   END-ROUTINE. . . . . . . . . .  P321
      356   END-ROUTINE-1
      365   END-ROUTINE-12
      373   END-ROUTINE-13 . . . . . . . .  E321
      354   END-RTN-EXIT
      328   FAIL . . . . . . . . . . . . .  P449 P470 P497 P511 P539 P553 P577 P598 P622 P633 P659 P670 P697 P708 P734 P745
                                            P765 P785 P819 P831 P861 P872 P900 P912 P941 P953 P976 P982 P988 P994 P1000 P1030
                                            P1036 P1042 P1048 P1054 P1097 P1103 P1109 P1115 P1121 P1163 P1169 P1175 P1181
                                            P1187 P1231 P1237 P1243 P1249 P1255 P1297 P1303 P1309 P1315 P1321 P1366 P1372
                                            P1378 P1384 P1390 P1437 P1449 P1461 P1473 P1485 P1520 P1532 P1544 P1556 P1568
                                            P1606 P1619 P1632 P1644 P1657 P1694 P1707 P1720 P1733 P1745 P1776 P1789 P1801
                                            P1832 P1845 P1857
      406   FAIL-ROUTINE . . . . . . . . .  P337
      420   FAIL-ROUTINE-EX. . . . . . . .  E337 G414
      415   FAIL-ROUTINE-WRITE . . . . . .  G408 G409
      343   HEAD-ROUTINE . . . . . . . . .  P318
      326   INSPT
      445   MPY-DELETE-F1-1
      728   MPY-DELETE-F1-10-1
      747   MPY-DELETE-F1-10-2
      767   MPY-DELETE-F1-11
      787   MPY-DELETE-F1-12
      806   MPY-DELETE-F1-13
      847   MPY-DELETE-F1-14
      887   MPY-DELETE-F1-15
      927   MPY-DELETE-F1-16
      968   MPY-DELETE-F1-17
     1022   MPY-DELETE-F1-18
     1089   MPY-DELETE-F1-19
      466   MPY-DELETE-F1-2
     1155   MPY-DELETE-F1-20
     1223   MPY-DELETE-F1-21
     1289   MPY-DELETE-F1-22
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    41
0 Defined   Cross-reference of procedures   References

0    1358   MPY-DELETE-F1-23
     1424   MPY-DELETE-F1-24-1
     1507   MPY-DELETE-F1-25-1
     1592   MPY-DELETE-F1-26-1
     1680   MPY-DELETE-F1-27-1
     1762   MPY-DELETE-F1-28-1
     1818   MPY-DELETE-F1-29-1
      490   MPY-DELETE-F1-3-1
      507   MPY-DELETE-F1-3-2
      532   MPY-DELETE-F1-4-1
      549   MPY-DELETE-F1-4-2
      571   MPY-DELETE-F1-5
      592   MPY-DELETE-F1-6
      615   MPY-DELETE-F1-7-1
      635   MPY-DELETE-F1-7-2
      653   MPY-DELETE-F1-8-1
      672   MPY-DELETE-F1-8-2
      690   MPY-DELETE-F1-9-1
      710   MPY-DELETE-F1-9-2
      448   MPY-FAIL-F1-1. . . . . . . . .  G443
      731   MPY-FAIL-F1-10-1 . . . . . . .  G727
      469   MPY-FAIL-F1-2. . . . . . . . .  G464
      493   MPY-FAIL-F1-3-1. . . . . . . .  G488
      510   MPY-FAIL-F1-3-2. . . . . . . .  G505
      535   MPY-FAIL-F1-4-1. . . . . . . .  G530
      552   MPY-FAIL-F1-4-2. . . . . . . .  G547
      574   MPY-FAIL-F1-5. . . . . . . . .  G570
      595   MPY-FAIL-F1-6. . . . . . . . .  G591
      618   MPY-FAIL-F1-7-1. . . . . . . .  G614
      656   MPY-FAIL-F1-8-1. . . . . . . .  G652
      693   MPY-FAIL-F1-9-1. . . . . . . .  G689
      433   MPY-INIT-F1-1
      716   MPY-INIT-F1-10
      753   MPY-INIT-F1-11
      773   MPY-INIT-F1-12
      794   MPY-INIT-F1-13
      835   MPY-INIT-F1-14 . . . . . . . .  G809
      876   MPY-INIT-F1-15 . . . . . . . .  G850
      916   MPY-INIT-F1-16 . . . . . . . .  G890
      957   MPY-INIT-F1-17 . . . . . . . .  G930
     1003   MPY-INIT-F1-18 . . . . . . . .  G972
     1068   MPY-INIT-F1-19 . . . . . . . .  G1026
      456   MPY-INIT-F1-2
     1135   MPY-INIT-F1-20 . . . . . . . .  G1093
     1201   MPY-INIT-F1-21 . . . . . . . .  G1159
     1269   MPY-INIT-F1-22 . . . . . . . .  G1227
     1336   MPY-INIT-F1-23 . . . . . . . .  G1293
     1405   MPY-INIT-F1-24 . . . . . . . .  G1362
     1489   MPY-INIT-F1-25 . . . . . . . .  G1427
     1572   MPY-INIT-F1-26 . . . . . . . .  G1510
     1661   MPY-INIT-F1-27 . . . . . . . .  G1595
     1749   MPY-INIT-F1-28 . . . . . . . .  G1683
     1805   MPY-INIT-F1-29 . . . . . . . .  G1765
      477   MPY-INIT-F1-3-1
      519   MPY-INIT-F1-4-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    42
0 Defined   Cross-reference of procedures   References

0     561   MPY-INIT-F1-5
      582   MPY-INIT-F1-6
      603   MPY-INIT-F1-7
      641   MPY-INIT-F1-8
      678   MPY-INIT-F1-9
      438   MPY-TEST-F1-1
      720   MPY-TEST-F1-10-0
      723   MPY-TEST-F1-10-1
      738   MPY-TEST-F1-10-2
      758   MPY-TEST-F1-11
      756   MPY-TEST-F1-11-0
      778   MPY-TEST-F1-12
      776   MPY-TEST-F1-12-0
      801   MPY-TEST-F1-13-0
      810   MPY-TEST-F1-13-1 . . . . . . .  G803 G805
      822   MPY-TEST-F1-13-2
      842   MPY-TEST-F1-14-0
      851   MPY-TEST-F1-14-1 . . . . . . .  G844 G846
      864   MPY-TEST-F1-14-2
      882   MPY-TEST-F1-15-0
      891   MPY-TEST-F1-15-1 . . . . . . .  G886
      903   MPY-TEST-F1-15-2
      922   MPY-TEST-F1-16-0
      931   MPY-TEST-F1-16-1 . . . . . . .  G926
      944   MPY-TEST-F1-16-2
      964   MPY-TEST-F1-17-0
      973   MPY-TEST-F1-17-1 . . . . . . .  G967
      979   MPY-TEST-F1-17-2
      985   MPY-TEST-F1-17-3
      991   MPY-TEST-F1-17-4
      997   MPY-TEST-F1-17-5
     1017   MPY-TEST-F1-18-0
     1027   MPY-TEST-F1-18-1 . . . . . . .  G1021
     1033   MPY-TEST-F1-18-2
     1039   MPY-TEST-F1-18-3
     1045   MPY-TEST-F1-18-4
     1051   MPY-TEST-F1-18-5
     1057   MPY-TEST-F1-18-6
     1083   MPY-TEST-F1-19-0
     1094   MPY-TEST-F1-19-1 . . . . . . .  G1088
     1100   MPY-TEST-F1-19-2
     1106   MPY-TEST-F1-19-3
     1112   MPY-TEST-F1-19-4
     1118   MPY-TEST-F1-19-5
     1124   MPY-TEST-F1-19-6
      459   MPY-TEST-F1-2
     1149   MPY-TEST-F1-20-0
     1160   MPY-TEST-F1-20-1 . . . . . . .  G1152 G1154
     1166   MPY-TEST-F1-20-2
     1172   MPY-TEST-F1-20-3
     1178   MPY-TEST-F1-20-4
     1184   MPY-TEST-F1-20-5
     1190   MPY-TEST-F1-20-6
     1216   MPY-TEST-F1-21-0
     1228   MPY-TEST-F1-21-1 . . . . . . .  G1220 G1222
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    43
0 Defined   Cross-reference of procedures   References

0    1234   MPY-TEST-F1-21-2
     1240   MPY-TEST-F1-21-3
     1246   MPY-TEST-F1-21-4
     1252   MPY-TEST-F1-21-5
     1258   MPY-TEST-F1-21-6
     1283   MPY-TEST-F1-22-0
     1294   MPY-TEST-F1-22-1 . . . . . . .  G1288
     1300   MPY-TEST-F1-22-2
     1306   MPY-TEST-F1-22-3
     1312   MPY-TEST-F1-22-4
     1318   MPY-TEST-F1-22-5
     1324   MPY-TEST-F1-22-6
     1351   MPY-TEST-F1-23-0
     1363   MPY-TEST-F1-23-1 . . . . . . .  G1357
     1369   MPY-TEST-F1-23-2
     1375   MPY-TEST-F1-23-3
     1381   MPY-TEST-F1-23-4
     1387   MPY-TEST-F1-23-5
     1393   MPY-TEST-F1-23-6
     1416   MPY-TEST-F1-24-0
     1428   MPY-TEST-F1-24-1 . . . . . . .  G1423
     1440   MPY-TEST-F1-24-2
     1452   MPY-TEST-F1-24-3
     1464   MPY-TEST-F1-24-4
     1476   MPY-TEST-F1-24-5
     1499   MPY-TEST-F1-25-0
     1511   MPY-TEST-F1-25-1 . . . . . . .  G1506
     1523   MPY-TEST-F1-25-2
     1535   MPY-TEST-F1-25-3
     1547   MPY-TEST-F1-25-4
     1559   MPY-TEST-F1-25-5
     1582   MPY-TEST-F1-26-0
     1589   MPY-TEST-F1-26-01. . . . . . .  G1584
     1596   MPY-TEST-F1-26-1 . . . . . . .  G1591
     1609   MPY-TEST-F1-26-2
     1622   MPY-TEST-F1-26-3
     1635   MPY-TEST-F1-26-4
     1647   MPY-TEST-F1-26-5
     1670   MPY-TEST-F1-27-0
     1677   MPY-TEST-F1-27-01. . . . . . .  G1672
     1684   MPY-TEST-F1-27-1 . . . . . . .  G1679
     1697   MPY-TEST-F1-27-2
     1710   MPY-TEST-F1-27-3
     1723   MPY-TEST-F1-27-4
     1736   MPY-TEST-F1-27-5
     1755   MPY-TEST-F1-28-0
     1766   MPY-TEST-F1-28-1 . . . . . . .  G1761
     1779   MPY-TEST-F1-28-2
     1792   MPY-TEST-F1-28-3
     1811   MPY-TEST-F1-29-0
     1822   MPY-TEST-F1-29-1 . . . . . . .  G1817
     1835   MPY-TEST-F1-29-2
     1848   MPY-TEST-F1-29-3
      481   MPY-TEST-F1-3-0
      484   MPY-TEST-F1-3-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    44
0 Defined   Cross-reference of procedures   References

0     501   MPY-TEST-F1-3-2
      523   MPY-TEST-F1-4-O
      526   MPY-TEST-F1-4-1
      543   MPY-TEST-F1-4-2
      564   MPY-TEST-F1-5-0
      566   MPY-TEST-F1-5-1
      585   MPY-TEST-F1-6-0
      587   MPY-TEST-F1-6-1
      607   MPY-TEST-F1-7-0
      610   MPY-TEST-F1-7-1
      626   MPY-TEST-F1-7-2
      645   MPY-TEST-F1-8-0
      648   MPY-TEST-F1-8-1
      663   MPY-TEST-F1-8-2
      682   MPY-TEST-F1-9-0
      685   MPY-TEST-F1-9-1
      701   MPY-TEST-F1-9-2
      452   MPY-WRITE-F1-1 . . . . . . . .  G444 G447
      735   MPY-WRITE-F1-10-1. . . . . . .  G726 G730
      749   MPY-WRITE-F1-10-2. . . . . . .  G741 G746
      769   MPY-WRITE-F1-11. . . . . . . .  G762 G766
      789   MPY-WRITE-F1-12. . . . . . . .  G782 G786
      473   MPY-WRITE-F1-2 . . . . . . . .  G465 G468
      498   MPY-WRITE-F1-3-1 . . . . . . .  G489 G492
      515   MPY-WRITE-F1-3-2 . . . . . . .  G506 G509
      540   MPY-WRITE-F1-4-1 . . . . . . .  G531 G534
      557   MPY-WRITE-F1-4-2 . . . . . . .  G548 G551
      578   MPY-WRITE-F1-5 . . . . . . . .  G569 G573
      599   MPY-WRITE-F1-6 . . . . . . . .  G590 G594
      623   MPY-WRITE-F1-7-1 . . . . . . .  G613 G617
      637   MPY-WRITE-F1-7-2 . . . . . . .  G629 G634
      660   MPY-WRITE-F1-8-1 . . . . . . .  G651 G655
      674   MPY-WRITE-F1-8-2 . . . . . . .  G666 G671
      698   MPY-WRITE-F1-9-1 . . . . . . .  G688 G692
      712   MPY-WRITE-F1-9-2 . . . . . . .  G704 G709
      314   OPEN-FILES
      327   PASS . . . . . . . . . . . . .  P441 P462 P486 P503 P528 P545 P568 P589 P612 P628 P650 P665 P687 P703 P725 P740
                                            P761 P781 P813 P825 P854 P867 P894 P906 P934 P947 P974 P980 P986 P992 P998 P1028
                                            P1034 P1040 P1046 P1052 P1059 P1095 P1101 P1107 P1113 P1119 P1126 P1161 P1167
                                            P1173 P1179 P1185 P1192 P1229 P1235 P1241 P1247 P1253 P1260 P1295 P1301 P1307
                                            P1313 P1319 P1326 P1364 P1370 P1376 P1382 P1388 P1395 P1431 P1443 P1455 P1467
                                            P1479 P1514 P1526 P1538 P1550 P1562 P1599 P1612 P1625 P1638 P1650 P1687 P1700
                                            P1713 P1726 P1739 P1769 P1782 P1795 P1825 P1838 P1851
      331   PRINT-DETAIL . . . . . . . . .  P454 P475 P500 P517 P542 P559 P580 P601 P625 P639 P662 P676 P700 P714 P737 P751
                                            P771 P791 P808 P814 P820 P826 P832 P849 P855 P862 P868 P873 P889 P895 P901 P907
                                            P913 P929 P935 P942 P948 P954 P971 P974 P977 P980 P983 P986 P989 P992 P995 P999
                                            P1001 P1025 P1028 P1031 P1034 P1037 P1040 P1043 P1046 P1049 P1053 P1055 P1060
                                            P1066 P1092 P1095 P1098 P1101 P1104 P1107 P1110 P1113 P1116 P1120 P1122 P1127
                                            P1133 P1158 P1161 P1164 P1167 P1170 P1173 P1176 P1179 P1182 P1186 P1188 P1193
                                            P1199 P1226 P1229 P1232 P1235 P1238 P1241 P1244 P1247 P1250 P1254 P1256 P1261
                                            P1267 P1292 P1295 P1298 P1301 P1304 P1307 P1310 P1313 P1316 P1320 P1322 P1327
                                            P1333 P1361 P1364 P1367 P1370 P1373 P1376 P1379 P1382 P1385 P1389 P1391 P1396
                                            P1402 P1426 P1432 P1438 P1444 P1450 P1456 P1462 P1468 P1474 P1480 P1486 P1509
                                            P1515 P1521 P1527 P1533 P1539 P1545 P1551 P1557 P1563 P1569 P1594 P1600 P1607
                                            P1613 P1620 P1626 P1633 P1639 P1645 P1651 P1658 P1682 P1688 P1695 P1701 P1708
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    45
0 Defined   Cross-reference of procedures   References

0                                           P1714 P1721 P1727 P1734 P1740 P1746 P1764 P1770 P1777 P1783 P1790 P1796 P1802
                                            P1820 P1826 P1833 P1839 P1846 P1852 P1858
      432   SECT-NC101A-001
      324   TERMINATE-CALL
      322   TERMINATE-CCVS
      385   WRITE-LINE . . . . . . . . . .  P335 P336 P344 P345 P346 P347 P349 P350 P351 P353 P355 P364 P372 P378 P383 P384
                                            P412 P416 P418 P427
      401   WRT-LN . . . . . . . . . . . .  P391 P392 P393 P394 P395 P396 P397 P400 P405
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    46
0 Defined   Cross-reference of programs     References

        3   NC101A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC101A    Date 06/04/2022  Time 11:59:36   Page    47
0LineID  Message code  Message text

     41  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC101A:
 *    Source records = 1863
 *    Data Division statements = 168
 *    Procedure Division statements = 1299
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1312
0End of compilation 1,  program NC101A,  highest severity 0.
0Return code 0
