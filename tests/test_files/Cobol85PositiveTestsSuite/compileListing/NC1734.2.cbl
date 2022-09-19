1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:44   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:44   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1734.2
   000002         000200 PROGRAM-ID.                                                      NC1734.2
   000003         000300     NC173A.                                                      NC1734.2
   000004         000500*                                                              *  NC1734.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1734.2
   000006         000700*                                                              *  NC1734.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1734.2
   000008         000900*                                                              *  NC1734.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1734.2
   000010         001100*                                                              *  NC1734.2
   000011         001300*                                                              *  NC1734.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1734.2
   000013         001500*                                                              *  NC1734.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1734.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1734.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1734.2
   000017         001900*                                                              *  NC1734.2
   000018         002100*    THIS PROGRAM TESTS THE FORMAT 3 DIVIDE STATEMENT FOUND       NC1734.2
   000019         002200*    IN LEVEL 1.   ALL COMBINATIONS OF THE OPTIONAL PHRASES       NC1734.2
   000020         002300*    "SIZE ERROR", "NOT SIZE ERROR" AND "END-MULTIPLY" ARE        NC1734.2
   000021         002400*    TESTED, AS WELL AS THE ROUNDED OPTION.                       NC1734.2
   000022         002500*                                                                 NC1734.2
   000023         002600*    VARIOUS COMBINATIONS OF SIGNED AND UNSIGNED NUMERIC          NC1734.2
   000024         002700*    LITERALS, DISPLAY AND COMPUTATIONAL FIELDS ARE USED          NC1734.2
   000025         002800*    AS OPERANDS.                                                 NC1734.2
   000026         002900*                                                                 NC1734.2
   000027         003000*                                                                 NC1734.2
   000028         003100 ENVIRONMENT DIVISION.                                            NC1734.2
   000029         003200 CONFIGURATION SECTION.                                           NC1734.2
   000030         003300 SOURCE-COMPUTER.                                                 NC1734.2
   000031         003400     XXXXX082.                                                    NC1734.2
   000032         003500 OBJECT-COMPUTER.                                                 NC1734.2
   000033         003600     XXXXX083.                                                    NC1734.2
   000034         003700 INPUT-OUTPUT SECTION.                                            NC1734.2
   000035         003800 FILE-CONTROL.                                                    NC1734.2
   000036         003900     SELECT PRINT-FILE ASSIGN TO                                  NC1734.2 40
   000037         004000     XXXXX055.                                                    NC1734.2
   000038         004100 DATA DIVISION.                                                   NC1734.2
   000039         004200 FILE SECTION.                                                    NC1734.2
   000040         004300 FD  PRINT-FILE.                                                  NC1734.2

 ==000040==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000041         004400 01  PRINT-REC PICTURE X(120).                                    NC1734.2
   000042         004500 01  DUMMY-RECORD PICTURE X(120).                                 NC1734.2
   000043         004600 WORKING-STORAGE SECTION.                                         NC1734.2
   000044         004700 77  WRK-DS-18V00                PICTURE S9(18).                  NC1734.2
   000045         004800 77  A06THREES-DS-03V03          PICTURE S999V999 VALUE 333.333.  NC1734.2
   000046         004900 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC1734.2
   000047         005000 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06 PICTURE S9(12).        NC1734.2 46
   000048         005100 77  A08TWOS-DS-02V06            PICTURE S99V9(6) VALUE 22.222222.NC1734.2
   000049         005200 77  WRK-DS-10V00                PICTURE S9(10).                  NC1734.2
   000050         005300 77  WRK-XN-00001                PICTURE X.                       NC1734.2
   000051         005400 77  A10ONES-DS-10V00            PICTURE S9(10)                   NC1734.2
   000052         005500                                 VALUE 1111111111.                NC1734.2
   000053         005600 77  A12THREES-DS-06V06          PICTURE S9(6)V9(6)               NC1734.2
   000054         005700                                 VALUE 333333.333333.             NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  WRK-DS-02V00                PICTURE S99.                     NC1734.2
   000056         005900 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC1734.2 IMP
   000057         006000 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1734.2
   000058         006100 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC1734.2 57
   000059         006200 77  A05ONES-DS-00V05            PICTURE SV9(5) VALUE .11111.     NC1734.2
   000060         006300 77  A12ONES-DS-12V00            PICTURE S9(12)                   NC1734.2
   000061         006400                                 VALUE 111111111111.              NC1734.2
   000062         006500 77  A01ONE-DS-P0801             PICTURE SP(8)9 VALUE .000000001. NC1734.2
   000063         006600 77  WRK-DS-09V08                PICTURE S9(9)V9(8).              NC1734.2
   000064         006700 77  WRK-DS-17V00-S REDEFINES WRK-DS-09V08 PICTURE S9(17).        NC1734.2 63
   000065         006800 77  A18ONES-DS-18V00            PICTURE S9(18)                   NC1734.2
   000066         006900                                 VALUE 111111111111111111.        NC1734.2
   000067         007000 77  WRK-DS-0201P                PICTURE S99P.                    NC1734.2
   000068         007100 77  WRK-CS-18V00                PICTURE S9(18) COMPUTATIONAL.    NC1734.2
   000069         007200 77  WRK-DU-18V00                PICTURE 9(18).                   NC1734.2
   000070         007300 77  A99-CS-02V00                PICTURE S99 COMPUTATIONAL        NC1734.2
   000071         007400                                 VALUE 99.                        NC1734.2
   000072         007500 77  A01ONE-CS-00V01             PICTURE SV9 COMPUTATIONAL        NC1734.2
   000073         007600                                 VALUE .1.                        NC1734.2
   000074         007700 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC1734.2
   000075         007800 77  WRK-DS-12V00                PICTURE S9(12).                  NC1734.2
   000076         007900 77  WRK-DS-01V00                PICTURE S9.                      NC1734.2
   000077         008000 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC1734.2
   000078         008100 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC1734.2
   000079         008200                                 VALUE 111111111.111111111.       NC1734.2
   000080         008300 77  A02TWOS-DU-02V00            PICTURE 99  VALUE 22.            NC1734.2
   000081         008400 77  WRK-DS-05V00                PICTURE S9(5).                   NC1734.2
   000082         008500 77  A02TWOS-DS-03V02            PICTURE S999V99 VALUE +022.00.   NC1734.2
   000083         008600 77  WRK-CS-02V02                PICTURE S99V99  COMPUTATIONAL.   NC1734.2
   000084         008700 77  A990-DS-0201P               PICTURE S99P   VALUE +990.       NC1734.2
   000085         008800 77  XRAY                        PICTURE X.                       NC1734.2
   000086         008900 01  WRK-XN-18-1 PIC X(18).                                       NC1734.2
   000087         009000 01  WRK-AN-X-18-1, REDEFINES WRK-XN-18-1 PIC A(18).              NC1734.2 86
   000088         009100 01  WRK-DU-X-18V0-1; REDEFINES WRK-XN-18-1 PIC 9(18).            NC1734.2 86
   000089         009200 01  WRK-DU-0V1-1 PIC V9 VALUE .3.                                NC1734.2
   000090         009300 01  WRK-DU-0V2-1 PIC V99 VALUE .25.                              NC1734.2
   000091         009400 01  WRK-DU-0V12-1 PIC V9(12) VALUE .00001.                       NC1734.2
   000092         009500 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1734.2 IMP
   000093         009600 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1734.2
   000094         009700 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1734.2
   000095         009800 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1734.2
   000096         009900 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1734.2
   000097         010000 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1734.2
   000098         010100 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1734.2
   000099         010200 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1734.2
   000100         010300 01  WRK-DU-2V0-1 PIC 99.                                         NC1734.2
   000101         010400 01  WRK-DU-2V0-2 PIC 99.                                         NC1734.2
   000102         010500 01  WRK-DU-2V0-3 PIC 99.                                         NC1734.2
   000103         010600 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1734.2
   000104         010700 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1734.2
   000105         010800 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1734.2
   000106         010900 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1734.2
   000107         011000 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1734.2
   000108         011100 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1734.2
   000109         011200 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1734.2
   000110         011300 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1734.2
   000111         011400 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1734.2
   000113         011600 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1734.2
   000114         011700 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1734.2
   000115         011800 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1734.2
   000116         011900 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1734.2
   000117         012000 01  WRK-NE-X-1 PIC 9(16).99.                                     NC1734.2
   000118         012100 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1734.2
   000119         012200 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1734.2
   000120         012300 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1734.2 IMP
   000121         012400 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1734.2 IMP
   000122         012500 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1734.2 IMP
   000123         012600 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1734.2 IMP
   000124         012700 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1734.2
   000125         012800 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1734.2
   000126         012900 01  WRK-NE-X-2 PIC -9(16).99.                                    NC1734.2
   000127         013000 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC1734.2
   000128         013100 01  WRK-NE-2 PIC $**.99.                                         NC1734.2
   000129         013200 01  WRK-NE-3 PIC $99.99CR.                                       NC1734.2
   000130         013300 01  WRK-NE-4 PIC $*9.99 VALUE ZERO.                              NC1734.2 IMP
   000131         013400 77  A01ONES-CS-18V00   PICTURE S9(18) COMPUTATIONAL              NC1734.2
   000132         013500             VALUE +000000000000000001.                           NC1734.2
   000133         013600 77  A02THREES-CS-18V00 PICTURE S9(18) COMPUTATIONAL              NC1734.2
   000134         013700             VALUE -000000000000000033.                           NC1734.2
   000135         013800 77  A18SIXES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1734.2
   000136         013900             VALUE 666666666666666666.                            NC1734.2
   000137         014000 77  A16NINES-CU-18V00  PICTURE 9(18) COMPUTATIONAL               NC1734.2
   000138         014100             VALUE 009999999999999999.                            NC1734.2
   000139         014200 77  A14TWOS-CU-18V00   PICTURE 9(18) COMPUTATIONAL               NC1734.2
   000140         014300             VALUE 000022222222222222.                            NC1734.2
   000141         014400 01  MULTIPLY-DATA.                                               NC1734.2
   000142         014500     02 MULT1                           PICTURE IS 999V99         NC1734.2
   000143         014600     VALUE IS 80.12.                                              NC1734.2
   000144         014700     02 MULT2                           PICTURE IS 999V999.       NC1734.2
   000145         014800     02 MULT3                           PICTURE IS $$99.99.       NC1734.2
   000146         014900     02 MULT4                           PICTURE IS S99            NC1734.2
   000147         015000     VALUE IS -56.                                                NC1734.2
   000148         015100     02 MULT5                           PICTURE IS 9 VALUE IS 4.  NC1734.2
   000149         015200     02 MULT6                           PICTURE IS 99 VALUE IS    NC1734.2
   000150         015300     20.                                                          NC1734.2
   000151         015400 01  DIVIDE-DATA.                                                 NC1734.2
   000152         015500     02 DIV1                            PICTURE IS 9(4)V99        NC1734.2
   000153         015600     VALUE IS 1620.36.                                            NC1734.2
   000154         015700     02 DIV2                            PICTURE IS 99V9           NC1734.2
   000155         015800     VALUE IS 44.1.                                               NC1734.2
   000156         015900     02 DIV3                            PICTURE IS 9(4)V9         NC1734.2
   000157         016000     VALUE IS 1661.7.                                             NC1734.2
   000158         016100     02 DIV4                            PICTURE IS S9V999         NC1734.2
   000159         016200     VALUE IS -9.642.                                             NC1734.2
   000160         016300     02 DIV-02LEVEL-1.                                            NC1734.2
   000161         016400     03 DIV5                            PICTURE IS V99            NC1734.2
   000162         016500     VALUE IS .82.                                                NC1734.2
   000163         016600     03 DIV6                            PICTURE IS 9 VALUE IS 0.  NC1734.2
   000164         016700     03 DIV7                            PICTURE IS 9V9            NC1734.2
   000165         016800     VALUE IS 9.6.                                                NC1734.2
   000166         016900 01  DIV-DATA-2.                                                  NC1734.2
   000167         017000     02 DIV8                            PICTURE IS 99V9.          NC1734.2
   000168         017100     02 DIV9                            PICTURE IS ZZ,ZZZ.9.      NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 DIV10                           PICTURE IS V999.          NC1734.2
   000170         017300 01  TEST-RESULTS.                                                NC1734.2
   000171         017400     02 FILLER                   PIC X      VALUE SPACE.          NC1734.2 IMP
   000172         017500     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1734.2 IMP
   000173         017600     02 FILLER                   PIC X      VALUE SPACE.          NC1734.2 IMP
   000174         017700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1734.2 IMP
   000175         017800     02 FILLER                   PIC X      VALUE SPACE.          NC1734.2 IMP
   000176         017900     02  PAR-NAME.                                                NC1734.2
   000177         018000       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1734.2 IMP
   000178         018100       03  PARDOT-X              PIC X      VALUE SPACE.          NC1734.2 IMP
   000179         018200       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1734.2 IMP
   000180         018300     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1734.2 IMP
   000181         018400     02 RE-MARK                  PIC X(61).                       NC1734.2
   000182         018500 01  TEST-COMPUTED.                                               NC1734.2
   000183         018600     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1734.2 IMP
   000184         018700     02 FILLER                   PIC X(17)  VALUE                 NC1734.2
   000185         018800            "       COMPUTED=".                                   NC1734.2
   000186         018900     02 COMPUTED-X.                                               NC1734.2
   000187         019000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1734.2 IMP
   000188         019100     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1734.2 187
   000189         019200                                 PIC -9(9).9(9).                  NC1734.2
   000190         019300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1734.2 187
   000191         019400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1734.2 187
   000192         019500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1734.2 187
   000193         019600     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1734.2 187
   000194         019700         04 COMPUTED-18V0                    PIC -9(18).          NC1734.2
   000195         019800         04 FILLER                           PIC X.               NC1734.2
   000196         019900     03 FILLER PIC X(50) VALUE SPACE.                             NC1734.2 IMP
   000197         020000 01  TEST-CORRECT.                                                NC1734.2
   000198         020100     02 FILLER PIC X(30) VALUE SPACE.                             NC1734.2 IMP
   000199         020200     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1734.2
   000200         020300     02 CORRECT-X.                                                NC1734.2
   000201         020400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1734.2 IMP
   000202         020500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1734.2 201
   000203         020600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1734.2 201
   000204         020700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1734.2 201
   000205         020800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1734.2 201
   000206         020900     03      CR-18V0 REDEFINES CORRECT-A.                         NC1734.2 201
   000207         021000         04 CORRECT-18V0                     PIC -9(18).          NC1734.2
   000208         021100         04 FILLER                           PIC X.               NC1734.2
   000209         021200     03 FILLER PIC X(2) VALUE SPACE.                              NC1734.2 IMP
   000210         021300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1734.2 IMP
   000211         021400 01  CCVS-C-1.                                                    NC1734.2
   000212         021500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1734.2
   000213         021600-    "SS  PARAGRAPH-NAME                                          NC1734.2
   000214         021700-    "       REMARKS".                                            NC1734.2
   000215         021800     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1734.2 IMP
   000216         021900 01  CCVS-C-2.                                                    NC1734.2
   000217         022000     02 FILLER                     PIC X        VALUE SPACE.      NC1734.2 IMP
   000218         022100     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1734.2
   000219         022200     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1734.2 IMP
   000220         022300     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1734.2
   000221         022400     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1734.2 IMP
   000222         022500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1734.2 IMP
   000223         022600 01  REC-CT                        PIC 99       VALUE ZERO.       NC1734.2 IMP
   000224         022700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1734.2 IMP
   000225         022800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1734.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1734.2 IMP
   000227         023000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1734.2 IMP
   000228         023100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1734.2 IMP
   000229         023200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1734.2 IMP
   000230         023300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1734.2 IMP
   000231         023400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1734.2 IMP
   000232         023500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1734.2 IMP
   000233         023600 01  CCVS-H-1.                                                    NC1734.2
   000234         023700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1734.2 IMP
   000235         023800     02  FILLER                    PIC X(42)    VALUE             NC1734.2
   000236         023900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1734.2
   000237         024000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1734.2 IMP
   000238         024100 01  CCVS-H-2A.                                                   NC1734.2
   000239         024200   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1734.2 IMP
   000240         024300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1734.2
   000241         024400   02  FILLER                        PIC XXXX   VALUE             NC1734.2
   000242         024500     "4.2 ".                                                      NC1734.2
   000243         024600   02  FILLER                        PIC X(28)  VALUE             NC1734.2
   000244         024700            " COPY - NOT FOR DISTRIBUTION".                       NC1734.2
   000245         024800   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1734.2 IMP
   000246         024900                                                                  NC1734.2
   000247         025000 01  CCVS-H-2B.                                                   NC1734.2
   000248         025100   02  FILLER                        PIC X(15)  VALUE             NC1734.2
   000249         025200            "TEST RESULT OF ".                                    NC1734.2
   000250         025300   02  TEST-ID                       PIC X(9).                    NC1734.2
   000251         025400   02  FILLER                        PIC X(4)   VALUE             NC1734.2
   000252         025500            " IN ".                                               NC1734.2
   000253         025600   02  FILLER                        PIC X(12)  VALUE             NC1734.2
   000254         025700     " HIGH       ".                                              NC1734.2
   000255         025800   02  FILLER                        PIC X(22)  VALUE             NC1734.2
   000256         025900            " LEVEL VALIDATION FOR ".                             NC1734.2
   000257         026000   02  FILLER                        PIC X(58)  VALUE             NC1734.2
   000258         026100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1734.2
   000259         026200 01  CCVS-H-3.                                                    NC1734.2
   000260         026300     02  FILLER                      PIC X(34)  VALUE             NC1734.2
   000261         026400            " FOR OFFICIAL USE ONLY    ".                         NC1734.2
   000262         026500     02  FILLER                      PIC X(58)  VALUE             NC1734.2
   000263         026600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1734.2
   000264         026700     02  FILLER                      PIC X(28)  VALUE             NC1734.2
   000265         026800            "  COPYRIGHT   1985 ".                                NC1734.2
   000266         026900 01  CCVS-E-1.                                                    NC1734.2
   000267         027000     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1734.2 IMP
   000268         027100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1734.2
   000269         027200     02 ID-AGAIN                     PIC X(9).                    NC1734.2
   000270         027300     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1734.2 IMP
   000271         027400 01  CCVS-E-2.                                                    NC1734.2
   000272         027500     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1734.2 IMP
   000273         027600     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1734.2 IMP
   000274         027700     02 CCVS-E-2-2.                                               NC1734.2
   000275         027800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1734.2 IMP
   000276         027900         03 FILLER                   PIC X      VALUE SPACE.      NC1734.2 IMP
   000277         028000         03 ENDER-DESC               PIC X(44)  VALUE             NC1734.2
   000278         028100            "ERRORS ENCOUNTERED".                                 NC1734.2
   000279         028200 01  CCVS-E-3.                                                    NC1734.2
   000280         028300     02  FILLER                      PIC X(22)  VALUE             NC1734.2
   000281         028400            " FOR OFFICIAL USE ONLY".                             NC1734.2
   000282         028500     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1734.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     02  FILLER                      PIC X(58)  VALUE             NC1734.2
   000284         028700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1734.2
   000285         028800     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1734.2 IMP
   000286         028900     02 FILLER                       PIC X(15)  VALUE             NC1734.2
   000287         029000             " COPYRIGHT 1985".                                   NC1734.2
   000288         029100 01  CCVS-E-4.                                                    NC1734.2
   000289         029200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1734.2 IMP
   000290         029300     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1734.2
   000291         029400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1734.2 IMP
   000292         029500     02 FILLER                       PIC X(40)  VALUE             NC1734.2
   000293         029600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1734.2
   000294         029700 01  XXINFO.                                                      NC1734.2
   000295         029800     02 FILLER                       PIC X(19)  VALUE             NC1734.2
   000296         029900            "*** INFORMATION ***".                                NC1734.2
   000297         030000     02 INFO-TEXT.                                                NC1734.2
   000298         030100       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1734.2 IMP
   000299         030200       04 XXCOMPUTED                 PIC X(20).                   NC1734.2
   000300         030300       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1734.2 IMP
   000301         030400       04 XXCORRECT                  PIC X(20).                   NC1734.2
   000302         030500     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1734.2
   000303         030600 01  HYPHEN-LINE.                                                 NC1734.2
   000304         030700     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1734.2 IMP
   000305         030800     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1734.2
   000306         030900-    "*****************************************".                 NC1734.2
   000307         031000     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1734.2
   000308         031100-    "******************************".                            NC1734.2
   000309         031200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1734.2
   000310         031300     "NC173A".                                                    NC1734.2
   000311         031400 PROCEDURE DIVISION.                                              NC1734.2
   000312         031500 CCVS1 SECTION.                                                   NC1734.2
   000313         031600 OPEN-FILES.                                                      NC1734.2
   000314         031700     OPEN     OUTPUT PRINT-FILE.                                  NC1734.2 40
   000315         031800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1734.2 309 250 309 269
   000316         031900     MOVE    SPACE TO TEST-RESULTS.                               NC1734.2 IMP 170
   000317         032000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1734.2 342 347
   000318         032100     GO TO CCVS1-EXIT.                                            NC1734.2 429
   000319         032200 CLOSE-FILES.                                                     NC1734.2
   000320         032300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1734.2 351 372 40
   000321         032400 TERMINATE-CCVS.                                                  NC1734.2
   000322         032500     EXIT PROGRAM.                                                NC1734.2
   000323         032600 TERMINATE-CALL.                                                  NC1734.2
   000324         032700     STOP     RUN.                                                NC1734.2
   000325         032800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1734.2 174 226
   000326         032900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1734.2 174 227
   000327         033000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1734.2 174 225
   000328         033100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1734.2 174 224
   000329         033200     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1734.2 181
   000330         033300 PRINT-DETAIL.                                                    NC1734.2
   000331         033400     IF REC-CT NOT EQUAL TO ZERO                                  NC1734.2 223 IMP
   000332      1  033500             MOVE "." TO PARDOT-X                                 NC1734.2 178
   000333      1  033600             MOVE REC-CT TO DOTVALUE.                             NC1734.2 223 179
   000334         033700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1734.2 170 41 384
   000335         033800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1734.2 174 384
   000336      1  033900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1734.2 405 419
   000337      1  034000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1734.2 420 428
   000338         034100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1734.2 IMP 174 IMP 186
   000339         034200     MOVE SPACE TO CORRECT-X.                                     NC1734.2 IMP 200
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1734.2 223 IMP IMP 176
   000341         034400     MOVE     SPACE TO RE-MARK.                                   NC1734.2 IMP 181
   000342         034500 HEAD-ROUTINE.                                                    NC1734.2
   000343         034600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1734.2 233 42 384
   000344         034700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1734.2 238 42 384
   000345         034800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1734.2 247 42 384
   000346         034900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1734.2 259 42 384
   000347         035000 COLUMN-NAMES-ROUTINE.                                            NC1734.2
   000348         035100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1734.2 211 42 384
   000349         035200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1734.2 216 42 384
   000350         035300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1734.2 303 42 384
   000351         035400 END-ROUTINE.                                                     NC1734.2
   000352         035500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1734.2 303 42 384
   000353         035600 END-RTN-EXIT.                                                    NC1734.2
   000354         035700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1734.2 266 42 384
   000355         035800 END-ROUTINE-1.                                                   NC1734.2
   000356         035900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1734.2 225 229 226
   000357         036000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1734.2 229 224 229
   000358         036100      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1734.2 227 229
   000359         036200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1734.2
   000360         036300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1734.2 227 289
   000361         036400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1734.2 229 291
   000362         036500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1734.2 288 274
   000363         036600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1734.2 271 42 384
   000364         036700  END-ROUTINE-12.                                                 NC1734.2
   000365         036800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1734.2 277
   000366         036900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1734.2 225 IMP
   000367      1  037000         MOVE "NO " TO ERROR-TOTAL                                NC1734.2 275
   000368         037100         ELSE                                                     NC1734.2
   000369      1  037200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1734.2 225 275
   000370         037300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1734.2 271 42
   000371         037400     PERFORM WRITE-LINE.                                          NC1734.2 384
   000372         037500 END-ROUTINE-13.                                                  NC1734.2
   000373         037600     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1734.2 224 IMP
   000374      1  037700         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1734.2 275
   000375      1  037800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1734.2 224 275
   000376         037900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1734.2 277
   000377         038000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1734.2 271 42 384
   000378         038100      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1734.2 226 IMP
   000379      1  038200          MOVE "NO " TO ERROR-TOTAL                               NC1734.2 275
   000380      1  038300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1734.2 226 275
   000381         038400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1734.2 277
   000382         038500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1734.2 271 42 384
   000383         038600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1734.2 279 42 384
   000384         038700 WRITE-LINE.                                                      NC1734.2
   000385         038800     ADD 1 TO RECORD-COUNT.                                       NC1734.2 231
   000386         038900     IF RECORD-COUNT GREATER 42                                   NC1734.2 231
   000387      1  039000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1734.2 42 230
   000388      1  039100         MOVE SPACE TO DUMMY-RECORD                               NC1734.2 IMP 42
   000389      1  039200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1734.2 42
   000390      1  039300         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1734.2 233 42 400
   000391      1  039400         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1734.2 238 42 400
   000392      1  039500         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1734.2 247 42 400
   000393      1  039600         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1734.2 259 42 400
   000394      1  039700         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1734.2 211 42 400
   000395      1  039800         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1734.2 216 42 400
   000396      1  039900         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1734.2 303 42 400
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040000         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1734.2 230 42
   000398      1  040100         MOVE ZERO TO RECORD-COUNT.                               NC1734.2 IMP 231
   000399         040200     PERFORM WRT-LN.                                              NC1734.2 400
   000400         040300 WRT-LN.                                                          NC1734.2
   000401         040400     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1734.2 42
   000402         040500     MOVE SPACE TO DUMMY-RECORD.                                  NC1734.2 IMP 42
   000403         040600 BLANK-LINE-PRINT.                                                NC1734.2
   000404         040700     PERFORM WRT-LN.                                              NC1734.2 400
   000405         040800 FAIL-ROUTINE.                                                    NC1734.2
   000406         040900     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1734.2 186 IMP
   000407      1  041000            GO TO FAIL-ROUTINE-WRITE.                             NC1734.2 414
   000408         041100     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1734.2 200 IMP 414
   000409         041200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1734.2 232 302
   000410         041300     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1734.2 297
   000411         041400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1734.2 294 42 384
   000412         041500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1734.2 IMP 302
   000413         041600     GO TO  FAIL-ROUTINE-EX.                                      NC1734.2 419
   000414         041700 FAIL-ROUTINE-WRITE.                                              NC1734.2
   000415         041800     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1734.2 182 41 384
   000416         041900     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1734.2 232 210
   000417         042000     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1734.2 197 41 384
   000418         042100     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1734.2 IMP 210
   000419         042200 FAIL-ROUTINE-EX. EXIT.                                           NC1734.2
   000420         042300 BAIL-OUT.                                                        NC1734.2
   000421         042400     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1734.2 187 IMP 423
   000422         042500     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1734.2 201 IMP 428
   000423         042600 BAIL-OUT-WRITE.                                                  NC1734.2
   000424         042700     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1734.2 201 301 187 299
   000425         042800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1734.2 232 302
   000426         042900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1734.2 294 42 384
   000427         043000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1734.2 IMP 302
   000428         043100 BAIL-OUT-EX. EXIT.                                               NC1734.2
   000429         043200 CCVS1-EXIT.                                                      NC1734.2
   000430         043300     EXIT.                                                        NC1734.2
   000431         043400 SECT-NC173A-001 SECTION.                                         NC1734.2
   000432         043500 DIV-INIT-F3-1.                                                   NC1734.2
   000433         043600     MOVE    "DIVIDE BY GIVING" TO FEATURE.                       NC1734.2 172
   000434         043700     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000435         043800     MOVE     44.1 TO DIV2.                                       NC1734.2 154
   000436         043900     MOVE     0    TO DIV8.                                       NC1734.2 167
   000437         044000 DIV-TEST-F3-1-0.                                                 NC1734.2
   000438         044100     DIVIDE   864.36 BY DIV2 GIVING DIV8.                         NC1734.2 154 167
   000439         044200 DIV-TEST-F3-1.                                                   NC1734.2
   000440         044300     IF       DIV8 EQUAL TO 19.6                                  NC1734.2 167
   000441      1  044400              PERFORM PASS                                        NC1734.2 326
   000442         044500              ELSE                                                NC1734.2
   000443      1  044600              GO TO DIV-FAIL-F3-1.                                NC1734.2 448
   000444         044700     GO TO    DIV-WRITE-F3-1.                                     NC1734.2 452
   000445         044800 DIV-DELETE-F3-1.                                                 NC1734.2
   000446         044900     PERFORM  DE-LETE.                                            NC1734.2 328
   000447         045000     GO TO    DIV-WRITE-F3-1.                                     NC1734.2 452
   000448         045100 DIV-FAIL-F3-1.                                                   NC1734.2
   000449         045200     PERFORM  FAIL.                                               NC1734.2 327
   000450         045300     MOVE     DIV8 TO COMPUTED-N.                                 NC1734.2 167 188
   000451         045400     MOVE     19.6 TO CORRECT-N.                                  NC1734.2 202
   000452         045500 DIV-WRITE-F3-1.                                                  NC1734.2
   000453         045600     MOVE "DIV-TEST-F3-1" TO PAR-NAME.                            NC1734.2 176
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     PERFORM  PRINT-DETAIL.                                       NC1734.2 330
   000455         045800 DIV-INIT-F3-2.                                                   NC1734.2
   000456         045900     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000457         046000     MOVE     0    TO DIV9.                                       NC1734.2 168
   000458         046100 DIV-TEST-F3-2.                                                   NC1734.2
   000459         046200     DIVIDE   DIV1 BY 0.533 GIVING DIV9 ROUNDED.                  NC1734.2 152 168
   000460         046300     IF       DIV9 EQUAL TO " 3,040.1"                            NC1734.2 168
   000461      1  046400              PERFORM PASS                                        NC1734.2 326
   000462         046500              ELSE                                                NC1734.2
   000463      1  046600              GO TO DIV-FAIL-F3-2.                                NC1734.2 468
   000464         046700     GO TO    DIV-WRITE-F3-2.                                     NC1734.2 472
   000465         046800 DIV-DELETE-F3-2.                                                 NC1734.2
   000466         046900     PERFORM  DE-LETE.                                            NC1734.2 328
   000467         047000     GO TO    DIV-WRITE-F3-2.                                     NC1734.2 472
   000468         047100 DIV-FAIL-F3-2.                                                   NC1734.2
   000469         047200     PERFORM  FAIL.                                               NC1734.2 327
   000470         047300     MOVE     DIV9 TO COMPUTED-A.                                 NC1734.2 168 187
   000471         047400     MOVE    " 3,040.1" TO CORRECT-A.                             NC1734.2 201
   000472         047500 DIV-WRITE-F3-2.                                                  NC1734.2
   000473         047600     MOVE    "DIV-TEST-F3-2" TO PAR-NAME.                         NC1734.2 176
   000474         047700     PERFORM  PRINT-DETAIL.                                       NC1734.2 330
   000475         047800 DIV-INIT-F3-3.                                                   NC1734.2
   000476         047900     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000477         048000     MOVE     44.1 TO DIV2.                                       NC1734.2 154
   000478         048100     MOVE   -9.642 TO DIV4.                                       NC1734.2 158
   000479         048200     MOVE     0    TO DIV10.                                      NC1734.2 169
   000480         048300     MOVE     1    TO REC-CT.                                     NC1734.2 223
   000481         048400 DIV-TEST-F3-3-0.                                                 NC1734.2
   000482         048500     DIVIDE  DIV2 BY DIV4 GIVING DIV10 ON SIZE ERROR              NC1734.2 154 158 169
   000483      1  048600             MOVE "P" TO XRAY.                                    NC1734.2 85
   000484         048700     GO TO DIV-TEST-F3-3-1.                                       NC1734.2 489
   000485         048800 DIV-DELETE-F3-3-1.                                               NC1734.2
   000486         048900     PERFORM DE-LETE.                                             NC1734.2 328
   000487         049000     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000488         049100     GO TO   DIV-INIT-F3-4.                                       NC1734.2 512
   000489         049200 DIV-TEST-F3-3-1.                                                 NC1734.2
   000490         049300     MOVE   "DIV-TEST-F3-3-1" TO PAR-NAME.                        NC1734.2 176
   000491         049400     IF      XRAY   = "P"                                         NC1734.2 85
   000492      1  049500             PERFORM PASS                                         NC1734.2 326
   000493      1  049600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000494         049700     ELSE                                                         NC1734.2
   000495      1  049800             MOVE    XRAY  TO COMPUTED-X                          NC1734.2 85 186
   000496      1  049900             MOVE   "P"    TO CORRECT-X                           NC1734.2 200
   000497      1  050000             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   000498      1  050100             PERFORM FAIL                                         NC1734.2 327
   000499      1  050200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000500         050300     ADD     1 TO REC-CT.                                         NC1734.2 223
   000501         050400 DIV-TEST-F3-3-2.                                                 NC1734.2
   000502         050500     MOVE   "DIV-TEST-F3-3-2" TO PAR-NAME.                        NC1734.2 176
   000503         050600     IF      DIV10   = 0                                          NC1734.2 169
   000504      1  050700             PERFORM PASS                                         NC1734.2 326
   000505      1  050800             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000506         050900     ELSE                                                         NC1734.2
   000507      1  051000             MOVE    DIV10 TO COMPUTED-N                          NC1734.2 169 188
   000508      1  051100             MOVE    0     TO CORRECT-N                           NC1734.2 202
   000509      1  051200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   000510      1  051300             PERFORM FAIL                                         NC1734.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000512         051500 DIV-INIT-F3-4.                                                   NC1734.2
   000513         051600     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000514         051700     MOVE     0    TO DIV8.                                       NC1734.2 167
   000515         051800     MOVE     1    TO REC-CT.                                     NC1734.2 223
   000516         051900 DIV-TEST-F3-4-0.                                                 NC1734.2
   000517         052000     DIVIDE  100.50 BY 1.0051 GIVING DIV8 ROUNDED ON SIZE ERROR   NC1734.2 167
   000518      1  052100             MOVE "Q" TO XRAY.                                    NC1734.2 85
   000519         052200     GO TO DIV-TEST-F3-4-1.                                       NC1734.2 524
   000520         052300 DIV-DELETE-F3-4.                                                 NC1734.2
   000521         052400     PERFORM DE-LETE.                                             NC1734.2 328
   000522         052500     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000523         052600     GO TO   DIV-INIT-F3-5.                                       NC1734.2 547
   000524         052700 DIV-TEST-F3-4-1.                                                 NC1734.2
   000525         052800     MOVE   "DIV-TEST-F3-4-1" TO PAR-NAME.                        NC1734.2 176
   000526         052900     IF      XRAY    = "Q"                                        NC1734.2 85
   000527      1  053000             PERFORM PASS                                         NC1734.2 326
   000528      1  053100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000529         053200     ELSE                                                         NC1734.2
   000530      1  053300             MOVE    XRAY TO COMPUTED-X                           NC1734.2 85 186
   000531      1  053400             MOVE   "Q"   TO CORRECT-X                            NC1734.2 200
   000532      1  053500             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   000533      1  053600             PERFORM FAIL                                         NC1734.2 327
   000534      1  053700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000535         053800     ADD     1 TO REC-CT.                                         NC1734.2 223
   000536         053900 DIV-TEST-F3-4-2.                                                 NC1734.2
   000537         054000     MOVE   "DIV-TEST-F3-4-2" TO PAR-NAME.                        NC1734.2 176
   000538         054100     IF      DIV8    =  0                                         NC1734.2 167
   000539      1  054200             PERFORM PASS                                         NC1734.2 326
   000540      1  054300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000541         054400     ELSE                                                         NC1734.2
   000542      1  054500             MOVE    DIV8 TO COMPUTED-N                           NC1734.2 167 188
   000543      1  054600             MOVE    0    TO CORRECT-N                            NC1734.2 202
   000544      1  054700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   000545      1  054800             PERFORM FAIL                                         NC1734.2 327
   000546      1  054900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000547         055000 DIV-INIT-F3-5.                                                   NC1734.2
   000548         055100     MOVE   "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.               NC1734.2 232
   000549         055200     MOVE    ZERO TO REC-CT.                                      NC1734.2 IMP 223
   000550         055300     MOVE    ZERO TO WRK-DS-01V00.                                NC1734.2 IMP 76
   000551         055400 DIV-TEST-F3-5-0.                                                 NC1734.2
   000552         055500     DIVIDE A02TWOS-DU-02V00 BY -10.9 GIVING WRK-DS-01V00.        NC1734.2 80 76
   000553         055600 DIV-TEST-F3-5-1.                                                 NC1734.2
   000554         055700     IF WRK-DS-01V00 EQUAL TO -2                                  NC1734.2 76
   000555      1  055800         PERFORM PASS                                             NC1734.2 326
   000556      1  055900         GO TO DIV-WRITE-F3-5.                                    NC1734.2 565
   000557         056000     GO TO DIV-FAIL-F3-5.                                         NC1734.2 561
   000558         056100 DIV-DELETE-F3-5.                                                 NC1734.2
   000559         056200     PERFORM DE-LETE.                                             NC1734.2 328
   000560         056300     GO TO DIV-WRITE-F3-5.                                        NC1734.2 565
   000561         056400 DIV-FAIL-F3-5.                                                   NC1734.2
   000562         056500     MOVE  -2                 TO CORRECT-N.                       NC1734.2 202
   000563         056600     MOVE  WRK-DS-01V00       TO COMPUTED-N.                      NC1734.2 76 188
   000564         056700     PERFORM FAIL.                                                NC1734.2 327
   000565         056800 DIV-WRITE-F3-5.                                                  NC1734.2
   000566         056900     MOVE "DIV-TEST-F3-5         " TO PAR-NAME.                   NC1734.2 176
   000567         057000     PERFORM PRINT-DETAIL.                                        NC1734.2 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100 DIV-INIT-F3-6.                                                   NC1734.2
   000569         057200     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000570         057300     MOVE 0.0000000001 TO WRK-DS-03V10.                           NC1734.2 77
   000571         057400     MOVE ZERO TO WRK-DS-18V00.                                   NC1734.2 IMP 44
   000572         057500 DIV-TEST-F3-6-0.                                                 NC1734.2
   000573         057600     DIVIDE A01ONE-DS-P0801 BY WRK-DS-03V10 GIVING                NC1734.2 62 77
   000574         057700         WRK-DS-18V00 ROUNDED.                                    NC1734.2 44
   000575         057800 DIV-TEST-F3-6-1.                                                 NC1734.2
   000576         057900     IF WRK-DS-18V00 EQUAL TO 000000000000000010                  NC1734.2 44
   000577      1  058000         PERFORM PASS                                             NC1734.2 326
   000578      1  058100         GO TO DIV-WRITE-F3-6.                                    NC1734.2 587
   000579         058200     GO TO DIV-FAIL-F3-6.                                         NC1734.2 583
   000580         058300 DIV-DELETE-F3-6.                                                 NC1734.2
   000581         058400     PERFORM DE-LETE.                                             NC1734.2 328
   000582         058500     GO TO DIV-WRITE-F3-6.                                        NC1734.2 587
   000583         058600 DIV-FAIL-F3-6.                                                   NC1734.2
   000584         058700     MOVE  000000000000000010 TO CORRECT-18V0.                    NC1734.2 207
   000585         058800     MOVE  WRK-DS-18V00       TO COMPUTED-18V0.                   NC1734.2 44 194
   000586         058900     PERFORM FAIL.                                                NC1734.2 327
   000587         059000 DIV-WRITE-F3-6.                                                  NC1734.2
   000588         059100     MOVE "DIV-TEST-F3-6         " TO PAR-NAME.                   NC1734.2 176
   000589         059200     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000590         059300 DIV-INIT-F3-7.                                                   NC1734.2
   000591         059400     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000592         059500     MOVE ZERO TO WRK-DS-18V00.                                   NC1734.2 IMP 44
   000593         059600     MOVE "0" TO WRK-XN-00001.                                    NC1734.2 50
   000594         059700     MOVE    1    TO REC-CT.                                      NC1734.2 223
   000595         059800 DIV-TEST-F3-7-0.                                                 NC1734.2
   000596         059900     DIVIDE A99-DS-02V00 BY AZERO-DS-05V05 GIVING                 NC1734.2 74 56
   000597      1  060000         WRK-DS-18V00 ON SIZE ERROR MOVE "1" TO WRK-XN-00001.     NC1734.2 44 50
   000598         060100 DIV-TEST-F3-7-1.                                                 NC1734.2
   000599         060200     IF WRK-DS-18V00 EQUAL TO 000000000000000000                  NC1734.2 44
   000600      1  060300         PERFORM PASS                                             NC1734.2 326
   000601      1  060400         GO TO DIV-WRITE-F3-7-1.                                  NC1734.2 609
   000602         060500     MOVE  000000000000000000 TO CORRECT-18V0.                    NC1734.2 207
   000603         060600     MOVE  WRK-DS-18V00       TO COMPUTED-18V0.                   NC1734.2 44 194
   000604         060700     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1734.2 181
   000605         060800     PERFORM FAIL.                                                NC1734.2 327
   000606         060900     GO TO DIV-WRITE-F3-7-1.                                      NC1734.2 609
   000607         061000 DIV-DELETE-F3-7-1.                                               NC1734.2
   000608         061100     PERFORM DE-LETE.                                             NC1734.2 328
   000609         061200 DIV-WRITE-F3-7-1.                                                NC1734.2
   000610         061300     MOVE "DIV-TEST-F3-7-1" TO PAR-NAME.                          NC1734.2 176
   000611         061400     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000612         061500     ADD 1 TO REC-CT.                                             NC1734.2 223
   000613         061600 DIV-TEST-F3-7-2.                                                 NC1734.2
   000614         061700     IF WRK-XN-00001 EQUAL TO "1"                                 NC1734.2 50
   000615      1  061800         PERFORM PASS                                             NC1734.2 326
   000616      1  061900         GO TO DIV-WRITE-F3-7-2.                                  NC1734.2 624
   000617         062000     MOVE "1" TO CORRECT-A.                                       NC1734.2 201
   000618         062100     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1734.2 50 187
   000619         062200     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1734.2 181
   000620         062300     PERFORM FAIL.                                                NC1734.2 327
   000621         062400     GO TO DIV-WRITE-F3-7-2.                                      NC1734.2 624
   000622         062500 DIV-DELETE-F3-7-2.                                               NC1734.2
   000623         062600     PERFORM DE-LETE.                                             NC1734.2 328
   000624         062700 DIV-WRITE-F3-7-2.                                                NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     MOVE "DIV-TEST-F3-7-2         " TO PAR-NAME.                 NC1734.2 176
   000626         062900     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000627         063000 DIV-INIT-F3-8.                                                   NC1734.2
   000628         063100     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000629         063200     MOVE A18ONES-DS-09V09 TO WRK-DS-09V09.                       NC1734.2 78 57
   000630         063300     MOVE "1" TO WRK-XN-00001.                                    NC1734.2 50
   000631         063400     MOVE  1  TO REC-CT.                                          NC1734.2 223
   000632         063500 DIV-TEST-F3-8-1.                                                 NC1734.2
   000633         063600     DIVIDE WRK-DS-09V09 BY A18ONES-DS-09V09 GIVING               NC1734.2 57 78
   000634      1  063700         WRK-DS-09V09 ON SIZE ERROR MOVE "0" TO WRK-XN-00001.     NC1734.2 57 50
   000635         063800     IF WRK-DS-18V00-S EQUAL TO 000000001000000000                NC1734.2 58
   000636      1  063900         PERFORM PASS                                             NC1734.2 326
   000637      1  064000         GO TO DIV-WRITE-F3-8-1.                                  NC1734.2 645
   000638         064100 DIV-FAIL-F3-8-1.                                                 NC1734.2
   000639         064200     MOVE  000000001000000000 TO CORRECT-18V0.                    NC1734.2 207
   000640         064300     MOVE  WRK-DS-18V00-S     TO COMPUTED-18V0.                   NC1734.2 58 194
   000641         064400     PERFORM FAIL.                                                NC1734.2 327
   000642         064500     GO TO DIV-WRITE-F3-8-1.                                      NC1734.2 645
   000643         064600 DIV-DELETE-F3-8-1.                                               NC1734.2
   000644         064700     PERFORM DE-LETE.                                             NC1734.2 328
   000645         064800 DIV-WRITE-F3-8-1.                                                NC1734.2
   000646         064900     MOVE "DIV-TEST-F3-8-1         " TO PAR-NAME.                 NC1734.2 176
   000647         065000     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000648         065100     ADD 1 TO REC-CT.                                             NC1734.2 223
   000649         065200 DIV-TEST-F3-8-2.                                                 NC1734.2
   000650         065300     IF WRK-XN-00001 EQUAL TO "0"                                 NC1734.2 50
   000651      1  065400         MOVE WRK-XN-00001 TO COMPUTED-A                          NC1734.2 50 187
   000652      1  065500         MOVE "1" TO CORRECT-A                                    NC1734.2 201
   000653      1  065600         MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK   NC1734.2 181
   000654      1  065700         PERFORM FAIL                                             NC1734.2 327
   000655      1  065800         GO TO DIV-WRITE-F3-8-2.                                  NC1734.2 660
   000656         065900     PERFORM PASS.                                                NC1734.2 326
   000657         066000     GO TO DIV-WRITE-F3-8-2.                                      NC1734.2 660
   000658         066100 DIV-DELETE-F3-8-2.                                               NC1734.2
   000659         066200     PERFORM DE-LETE.                                             NC1734.2 328
   000660         066300 DIV-WRITE-F3-8-2.                                                NC1734.2
   000661         066400     MOVE "DIV-TEST-F3-8-2         " TO PAR-NAME.                 NC1734.2 176
   000662         066500     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000663         066600 DIV-INIT-F3-9.                                                   NC1734.2
   000664         066700     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000665         066800     MOVE ZERO TO WRK-DS-0201P.                                   NC1734.2 IMP 67
   000666         066900     MOVE -0.005 TO WRK-DS-09V09.                                 NC1734.2 57
   000667         067000     MOVE "0" TO WRK-XN-00001.                                    NC1734.2 50
   000668         067100     MOVE  1 TO REC-CT.                                           NC1734.2 223
   000669         067200 DIV-TEST-F3-9-1-0.                                               NC1734.2
   000670         067300     DIVIDE A05ONES-DS-00V05 BY WRK-DS-09V09 GIVING               NC1734.2 59 57
   000671         067400         WRK-DS-0201P ROUNDED ON SIZE ERROR                       NC1734.2 67
   000672      1  067500         MOVE "1" TO WRK-XN-00001.                                NC1734.2 50
   000673         067600 DIV-TEST-F3-9-1-1.                                               NC1734.2
   000674         067700     MOVE WRK-DS-0201P TO WRK-DS-05V00.                           NC1734.2 67 81
   000675         067800     IF  WRK-DS-05V00 EQUAL TO -00020                             NC1734.2 81
   000676      1  067900         PERFORM PASS                                             NC1734.2 326
   000677      1  068000         GO TO DIV-WRITE-F3-9-1.                                  NC1734.2 684
   000678         068100     MOVE  -00020             TO CORRECT-N.                       NC1734.2 202
   000679         068200     MOVE  WRK-DS-05V00       TO COMPUTED-N.                      NC1734.2 81 188
   000680         068300     PERFORM FAIL.                                                NC1734.2 327
   000681         068400     GO TO DIV-WRITE-F3-9-1.                                      NC1734.2 684
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500 DIV-DELETE-F3-9-1.                                               NC1734.2
   000683         068600     PERFORM DE-LETE.                                             NC1734.2 328
   000684         068700 DIV-WRITE-F3-9-1.                                                NC1734.2
   000685         068800     MOVE "DIV-TEST-F3-9-1         " TO PAR-NAME.                 NC1734.2 176
   000686         068900     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000687         069000     ADD 1 TO REC-CT.                                             NC1734.2 223
   000688         069100 DIV-TEST-F3-9-2-1.                                               NC1734.2
   000689         069200     IF WRK-XN-00001 EQUAL TO "0"                                 NC1734.2 50
   000690      1  069300         PERFORM PASS                                             NC1734.2 326
   000691      1  069400         GO TO DIV-WRITE-F3-9-2.                                  NC1734.2 699
   000692         069500     MOVE "0" TO CORRECT-A.                                       NC1734.2 201
   000693         069600     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC1734.2 50 187
   000694         069700     MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK.      NC1734.2 181
   000695         069800     PERFORM FAIL.                                                NC1734.2 327
   000696         069900     GO TO DIV-WRITE-F3-9-2.                                      NC1734.2 699
   000697         070000 DIV-DELETE-F3-9-2.                                               NC1734.2
   000698         070100     PERFORM DE-LETE.                                             NC1734.2 328
   000699         070200 DIV-WRITE-F3-9-2.                                                NC1734.2
   000700         070300     MOVE "DIV-TEST-F3-9-2         " TO PAR-NAME.                 NC1734.2 176
   000701         070400     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000702         070500 DIV-INIT-F3-10.                                                  NC1734.2
   000703         070600     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000704         070700     MOVE "1" TO WRK-XN-00001.                                    NC1734.2 50
   000705         070800     MOVE ZERO TO WRK-DS-01V00.                                   NC1734.2 IMP 76
   000706         070900     MOVE  1 TO REC-CT.                                           NC1734.2 223
   000707         071000 DIV-TEST-F3-10-0.                                                NC1734.2
   000708         071100     DIVIDE A02TWOS-DS-03V02 BY A02TWOS-DU-02V00 GIVING           NC1734.2 82 80
   000709         071200         WRK-DS-01V00 ROUNDED ON SIZE ERROR                       NC1734.2 76
   000710      1  071300         MOVE "0" TO WRK-XN-00001.                                NC1734.2 50
   000711         071400 DIV-TEST-F3-10-1.                                                NC1734.2
   000712         071500     IF WRK-DS-01V00 EQUAL TO +1                                  NC1734.2 76
   000713      1  071600         PERFORM PASS                                             NC1734.2 326
   000714      1  071700         GO TO DIV-WRITE-F3-10-1.                                 NC1734.2 721
   000715         071800     MOVE  +1                 TO CORRECT-N.                       NC1734.2 202
   000716         071900     MOVE  WRK-DS-01V00       TO COMPUTED-N.                      NC1734.2 76 188
   000717         072000     PERFORM FAIL.                                                NC1734.2 327
   000718         072100     GO TO DIV-WRITE-F3-10-1.                                     NC1734.2 721
   000719         072200 DIV-DELETE-F3-10-1.                                              NC1734.2
   000720         072300     PERFORM DE-LETE.                                             NC1734.2 328
   000721         072400 DIV-WRITE-F3-10-1.                                               NC1734.2
   000722         072500     MOVE "DIV-TEST-F3-10-1" TO PAR-NAME.                         NC1734.2 176
   000723         072600     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000724         072700     ADD 1 TO REC-CT.                                             NC1734.2 223
   000725         072800 DIV-TEST-F3-10-2.                                                NC1734.2
   000726         072900     IF WRK-XN-00001 EQUAL TO "0"                                 NC1734.2 50
   000727      1  073000         MOVE "0" TO COMPUTED-A                                   NC1734.2 187
   000728      1  073100         MOVE "1" TO CORRECT-A                                    NC1734.2 201
   000729      1  073200         MOVE "ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK   NC1734.2 181
   000730      1  073300         PERFORM FAIL                                             NC1734.2 327
   000731      1  073400        GO TO DIV-WRITE-F3-10-2.                                  NC1734.2 736
   000732         073500     PERFORM PASS.                                                NC1734.2 326
   000733         073600     GO TO DIV-WRITE-F3-10-2.                                     NC1734.2 736
   000734         073700 DIV-DELETE-F3-10-2.                                              NC1734.2
   000735         073800     PERFORM DE-LETE.                                             NC1734.2 328
   000736         073900 DIV-WRITE-F3-10-2.                                               NC1734.2
   000737         074000     MOVE "DIV-TEST-F3-10-2         " TO PAR-NAME.                NC1734.2 176
   000738         074100     PERFORM PRINT-DETAIL.                                        NC1734.2 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 DIV-INIT-F3-11.                                                  NC1734.2
   000740         074300     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000741         074400     MOVE    0 TO WRK-DS-05V00.                                   NC1734.2 81
   000742         074500 DIV-TEST-F3-11-0.                                                NC1734.2
   000743         074600     DIVIDE A99-CS-02V00 BY A01ONE-CS-00V01 GIVING                NC1734.2 70 72
   000744         074700         WRK-DS-05V00.                                            NC1734.2 81
   000745         074800 DIV-TEST-F3-11-1.                                                NC1734.2
   000746         074900     IF WRK-DS-05V00 EQUAL TO 00990                               NC1734.2 81
   000747      1  075000         PERFORM PASS                                             NC1734.2 326
   000748      1  075100         GO TO DIV-WRITE-F3-11.                                   NC1734.2 757
   000749         075200     GO TO DIV-FAIL-F3-11.                                        NC1734.2 753
   000750         075300 DIV-DELETE-F3-11.                                                NC1734.2
   000751         075400     PERFORM DE-LETE.                                             NC1734.2 328
   000752         075500     GO TO DIV-WRITE-F3-11.                                       NC1734.2 757
   000753         075600 DIV-FAIL-F3-11.                                                  NC1734.2
   000754         075700     MOVE  00990              TO CORRECT-N.                       NC1734.2 202
   000755         075800     MOVE  WRK-DS-05V00       TO COMPUTED-N.                      NC1734.2 81 188
   000756         075900     PERFORM FAIL.                                                NC1734.2 327
   000757         076000 DIV-WRITE-F3-11.                                                 NC1734.2
   000758         076100     MOVE "DIV-TEST-F3-11         " TO PAR-NAME.                  NC1734.2 176
   000759         076200     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000760         076300 DIV-INIT-F3-12.                                                  NC1734.2
   000761         076400     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000762         076500     MOVE ZERO TO WRK-CS-18V00.                                   NC1734.2 IMP 68
   000763         076600 DIV-TEST-F3-12-0.                                                NC1734.2
   000764         076700     DIVIDE A16NINES-CU-18V00 BY A02THREES-CS-18V00               NC1734.2 137 133
   000765         076800             GIVING WRK-CS-18V00.                                 NC1734.2 68
   000766         076900 DIV-TEST-F3-12-1.                                                NC1734.2
   000767         077000     IF WRK-CS-18V00 EQUAL TO -000303030303030303                 NC1734.2 68
   000768      1  077100         PERFORM PASS                                             NC1734.2 326
   000769      1  077200         GO TO DIV-WRITE-F3-12.                                   NC1734.2 776
   000770         077300     MOVE -00303030303030303 TO CORRECT-18V0.                     NC1734.2 207
   000771         077400     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1734.2 68 194
   000772         077500     PERFORM FAIL.                                                NC1734.2 327
   000773         077600     GO TO DIV-WRITE-F3-12.                                       NC1734.2 776
   000774         077700 DIV-DELETE-F3-12.                                                NC1734.2
   000775         077800     PERFORM DE-LETE.                                             NC1734.2 328
   000776         077900 DIV-WRITE-F3-12.                                                 NC1734.2
   000777         078000     MOVE "DIV-TEST-F3-12 " TO PAR-NAME.                          NC1734.2 176
   000778         078100     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000779         078200 DIV-INIT-F3-13.                                                  NC1734.2
   000780         078300     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000781         078400     MOVE ZERO TO WRK-DU-18V00.                                   NC1734.2 IMP 69
   000782         078500 DIV-TEST-F3-13-0.                                                NC1734.2
   000783         078600     DIVIDE A18SIXES-CU-18V00 BY A14TWOS-CU-18V00 GIVING          NC1734.2 135 139
   000784         078700             WRK-DU-18V00.                                        NC1734.2 69
   000785         078800 DIV-TEST-F3-13-1.                                                NC1734.2
   000786         078900     IF WRK-DU-18V00 EQUAL TO 000000000000030000                  NC1734.2 69
   000787      1  079000         PERFORM PASS                                             NC1734.2 326
   000788      1  079100         GO TO DIV-WRITE-F3-13.                                   NC1734.2 795
   000789         079200     MOVE 000000000000030000 TO CORRECT-18V0.                     NC1734.2 207
   000790         079300     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1734.2 69 194
   000791         079400     PERFORM FAIL.                                                NC1734.2 327
   000792         079500     GO TO DIV-WRITE-F3-13.                                       NC1734.2 795
   000793         079600 DIV-DELETE-F3-13.                                                NC1734.2
   000794         079700     PERFORM DE-LETE.                                             NC1734.2 328
   000795         079800 DIV-WRITE-F3-13.                                                 NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     MOVE "DIV-TEST-F3-13 " TO PAR-NAME.                          NC1734.2 176
   000797         080000     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000798         080100 DIV-INIT-F3-14.                                                  NC1734.2
   000799         080200     MOVE    "V1-82 6.11.4 GR3"   TO ANSI-REFERENCE.              NC1734.2 232
   000800         080300     MOVE ZERO TO WRK-CS-18V00.                                   NC1734.2 IMP 68
   000801         080400 DIV-TEST-F3-14-0.                                                NC1734.2
   000802         080500     DIVIDE A02THREES-CS-18V00 BY A01ONES-CS-18V00 GIVING         NC1734.2 133 131
   000803         080600             WRK-CS-18V00 ROUNDED.                                NC1734.2 68
   000804         080700 DIV-TEST-F3-14-1.                                                NC1734.2
   000805         080800     IF WRK-CS-18V00 EQUAL TO -000000000000000033                 NC1734.2 68
   000806      1  080900         PERFORM PASS                                             NC1734.2 326
   000807      1  081000         GO TO DIV-WRITE-F3-14.                                   NC1734.2 814
   000808         081100     MOVE -000000000000000033 TO CORRECT-18V0.                    NC1734.2 207
   000809         081200     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1734.2 68 194
   000810         081300     PERFORM FAIL.                                                NC1734.2 327
   000811         081400     GO TO DIV-WRITE-F3-14.                                       NC1734.2 814
   000812         081500 DIV-DELETE-F3-14.                                                NC1734.2
   000813         081600     PERFORM DE-LETE.                                             NC1734.2 328
   000814         081700 DIV-WRITE-F3-14.                                                 NC1734.2
   000815         081800     MOVE "DIV-TEST-F3-14 " TO PAR-NAME.                          NC1734.2 176
   000816         081900     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000817         082000*                                                                 NC1734.2
   000818         082100*                                                                 NC1734.2
   000819         082200 DIV-INIT-F3-15.                                                  NC1734.2
   000820         082300*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   000821         082400*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1734.2
   000822         082500     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1734.2 232
   000823         082600     MOVE   "DIV-TEST-F3-15" TO PAR-NAME.                         NC1734.2 176
   000824         082700     MOVE    44.1  TO DIV2.                                       NC1734.2 154
   000825         082800     MOVE   -9.642 TO DIV4.                                       NC1734.2 158
   000826         082900     MOVE    0     TO DIV10.                                      NC1734.2 169
   000827         083000     MOVE    1     TO REC-CT.                                     NC1734.2 223
   000828         083100     MOVE   "A"    TO XRAY.                                       NC1734.2 85
   000829         083200 DIV-TEST-F3-15-0.                                                NC1734.2
   000830         083300     DIVIDE  DIV2 BY DIV4                                         NC1734.2 154 158
   000831         083400      GIVING DIV10                                                NC1734.2 169
   000832         083500      NOT ON SIZE ERROR                                           NC1734.2
   000833      1  083600             MOVE "P" TO XRAY.                                    NC1734.2 85
   000834         083700     GO TO   DIV-TEST-F3-15-1.                                    NC1734.2 839
   000835         083800 DIV-DELETE-F3-15-1.                                              NC1734.2
   000836         083900     PERFORM DE-LETE.                                             NC1734.2 328
   000837         084000     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000838         084100     GO TO   DIV-INIT-F3-16.                                      NC1734.2 864
   000839         084200 DIV-TEST-F3-15-1.                                                NC1734.2
   000840         084300     MOVE   "DIV-TEST-F3-15-1" TO PAR-NAME.                       NC1734.2 176
   000841         084400     IF      XRAY    = "A"                                        NC1734.2 85
   000842      1  084500             PERFORM PASS                                         NC1734.2 326
   000843      1  084600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000844         084700     ELSE                                                         NC1734.2
   000845      1  084800             MOVE    XRAY  TO COMPUTED-X                          NC1734.2 85 186
   000846      1  084900             MOVE   "A"    TO CORRECT-X                           NC1734.2 200
   000847      1  085000             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   000848      1  085100             PERFORM FAIL                                         NC1734.2 327
   000849      1  085200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000850         085300     ADD     1     TO REC-CT.                                     NC1734.2 223
   000851         085400 DIV-TEST-F3-15-2.                                                NC1734.2
   000852         085500     MOVE   "DIV-TEST-F3-15-2" TO PAR-NAME.                       NC1734.2 176
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     IF      DIV10   = 0                                          NC1734.2 169
   000854      1  085700             PERFORM PASS                                         NC1734.2 326
   000855      1  085800             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000856         085900     ELSE                                                         NC1734.2
   000857      1  086000             MOVE    DIV10 TO COMPUTED-N                          NC1734.2 169 188
   000858      1  086100             MOVE    0     TO CORRECT-N                           NC1734.2 202
   000859      1  086200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   000860      1  086300             PERFORM FAIL                                         NC1734.2 327
   000861      1  086400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000862         086500*                                                                 NC1734.2
   000863         086600*                                                                 NC1734.2
   000864         086700 DIV-INIT-F3-16.                                                  NC1734.2
   000865         086800     MOVE   "DIV-TEST-F3-16" TO PAR-NAME.                         NC1734.2 176
   000866         086900     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1734.2 232
   000867         087000*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   000868         087100*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1734.2
   000869         087200     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1734.2 78 57
   000870         087300     MOVE    1     TO REC-CT.                                     NC1734.2 223
   000871         087400     MOVE   "1" TO WRK-XN-00001.                                  NC1734.2 50
   000872         087500 DIV-TEST-F3-16-0.                                                NC1734.2
   000873         087600     DIVIDE  WRK-DS-09V09 BY A18ONES-DS-09V09                     NC1734.2 57 78
   000874         087700      GIVING WRK-DS-09V09                                         NC1734.2 57
   000875      1  087800      NOT ON SIZE ERROR MOVE "0" TO WRK-XN-00001.                 NC1734.2 50
   000876         087900     GO TO   DIV-TEST-F3-16-1.                                    NC1734.2 881
   000877         088000 DIV-DELETE-F3-16-1.                                              NC1734.2
   000878         088100     PERFORM DE-LETE.                                             NC1734.2 328
   000879         088200     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000880         088300     GO TO   DIV-INIT-F3-17.                                      NC1734.2 906
   000881         088400 DIV-TEST-F3-16-1.                                                NC1734.2
   000882         088500     MOVE   "DIV-TEST-F3-16-1" TO PAR-NAME.                       NC1734.2 176
   000883         088600     IF      WRK-DS-18V00-S EQUAL TO 000000001000000000           NC1734.2 58
   000884      1  088700             PERFORM PASS                                         NC1734.2 326
   000885      1  088800             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000886         088900     ELSE                                                         NC1734.2
   000887      1  089000             MOVE    000000001000000000 TO CORRECT-18V0           NC1734.2 207
   000888      1  089100             MOVE    WRK-DS-18V00-S     TO COMPUTED-18V0          NC1734.2 58 194
   000889      1  089200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   000890      1  089300             PERFORM FAIL                                         NC1734.2 327
   000891      1  089400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000892         089500     ADD     1     TO REC-CT.                                     NC1734.2 223
   000893         089600 DIV-TEST-F3-16-2.                                                NC1734.2
   000894         089700     MOVE   "DIV-TEST-F3-16-2" TO PAR-NAME.                       NC1734.2 176
   000895         089800     IF      WRK-XN-00001 = "0"                                   NC1734.2 50
   000896      1  089900             PERFORM PASS                                         NC1734.2 326
   000897      1  090000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000898         090100     ELSE                                                         NC1734.2
   000899      1  090200             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   000900      1  090300             MOVE   "0"           TO CORRECT-X                    NC1734.2 200
   000901      1  090400             MOVE   "NOT ON SIZE ERROR NOT EXECUTED" TO RE-MARK   NC1734.2 181
   000902      1  090500             PERFORM FAIL                                         NC1734.2 327
   000903      1  090600             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000904         090700*                                                                 NC1734.2
   000905         090800*                                                                 NC1734.2
   000906         090900 DIV-INIT-F3-17.                                                  NC1734.2
   000907         091000*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   000908         091100*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1734.2
   000909         091200     MOVE   "DIV-TEST-F3-17" TO PAR-NAME.                         NC1734.2 176
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1734.2 232
   000911         091400     MOVE    44.1  TO DIV2.                                       NC1734.2 154
   000912         091500     MOVE   -9.642 TO DIV4.                                       NC1734.2 158
   000913         091600     MOVE    0     TO DIV10.                                      NC1734.2 169
   000914         091700     MOVE    1     TO REC-CT.                                     NC1734.2 223
   000915         091800     MOVE   "A"    TO XRAY.                                       NC1734.2 85
   000916         091900 DIV-TEST-F3-17-0.                                                NC1734.2
   000917         092000     DIVIDE  DIV2 BY DIV4                                         NC1734.2 154 158
   000918         092100      GIVING DIV10                                                NC1734.2 169
   000919         092200          ON SIZE ERROR                                           NC1734.2
   000920      1  092300             MOVE "E" TO XRAY                                     NC1734.2 85
   000921         092400      NOT ON SIZE ERROR                                           NC1734.2
   000922      1  092500             MOVE "N" TO XRAY.                                    NC1734.2 85
   000923         092600     GO TO DIV-TEST-F3-17-1.                                      NC1734.2 928
   000924         092700 DIV-DELETE-F3-17-1.                                              NC1734.2
   000925         092800     PERFORM DE-LETE.                                             NC1734.2 328
   000926         092900     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000927         093000     GO TO   DIV-INIT-F3-18.                                      NC1734.2 953
   000928         093100 DIV-TEST-F3-17-1.                                                NC1734.2
   000929         093200     MOVE   "DIV-TEST-F3-17-1" TO PAR-NAME.                       NC1734.2 176
   000930         093300     IF      XRAY    = "E"                                        NC1734.2 85
   000931      1  093400             PERFORM PASS                                         NC1734.2 326
   000932      1  093500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000933         093600     ELSE                                                         NC1734.2
   000934      1  093700             MOVE    XRAY  TO COMPUTED-X                          NC1734.2 85 186
   000935      1  093800             MOVE   "E"    TO CORRECT-X                           NC1734.2 200
   000936      1  093900             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   000937      1  094000             PERFORM FAIL                                         NC1734.2 327
   000938      1  094100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000939         094200     ADD     1     TO REC-CT.                                     NC1734.2 223
   000940         094300 DIV-TEST-F3-17-2.                                                NC1734.2
   000941         094400     MOVE   "DIV-TEST-F3-17-2" TO PAR-NAME.                       NC1734.2 176
   000942         094500     IF      DIV10   = 0                                          NC1734.2 169
   000943      1  094600             PERFORM PASS                                         NC1734.2 326
   000944      1  094700             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000945         094800     ELSE                                                         NC1734.2
   000946      1  094900             MOVE    DIV10 TO COMPUTED-N                          NC1734.2 169 188
   000947      1  095000             MOVE    0     TO CORRECT-N                           NC1734.2 202
   000948      1  095100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   000949      1  095200             PERFORM FAIL                                         NC1734.2 327
   000950      1  095300             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000951         095400*                                                                 NC1734.2
   000952         095500*                                                                 NC1734.2
   000953         095600 DIV-INIT-F3-18.                                                  NC1734.2
   000954         095700*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   000955         095800*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1734.2
   000956         095900     MOVE   "V1-67 6.4.2 "   TO ANSI-REFERENCE.                   NC1734.2 232
   000957         096000     MOVE    1     TO REC-CT.                                     NC1734.2 223
   000958         096100     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1734.2 78 57
   000959         096200     MOVE   "1" TO WRK-XN-00001.                                  NC1734.2 50
   000960         096300 DIV-TEST-F3-18-0.                                                NC1734.2
   000961         096400     DIVIDE  WRK-DS-09V09 BY A18ONES-DS-09V09                     NC1734.2 57 78
   000962         096500      GIVING WRK-DS-09V09                                         NC1734.2 57
   000963         096600          ON SIZE ERROR                                           NC1734.2
   000964      1  096700             MOVE "1" TO WRK-XN-00001                             NC1734.2 50
   000965         096800      NOT ON SIZE ERROR                                           NC1734.2
   000966      1  096900             MOVE "2" TO WRK-XN-00001.                            NC1734.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     GO TO   DIV-TEST-F3-18-1.                                    NC1734.2 972
   000968         097100 DIV-DELETE-F3-18-1.                                              NC1734.2
   000969         097200     PERFORM DE-LETE.                                             NC1734.2 328
   000970         097300     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   000971         097400     GO TO   DIV-INIT-F3-19.                                      NC1734.2 998
   000972         097500 DIV-TEST-F3-18-1.                                                NC1734.2
   000973         097600     MOVE   "DIV-TEST-F3-18-1" TO PAR-NAME.                       NC1734.2 176
   000974         097700     IF      WRK-DS-09V09   EQUAL TO 1                            NC1734.2 57
   000975      1  097800             PERFORM PASS                                         NC1734.2 326
   000976      1  097900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000977         098000     ELSE                                                         NC1734.2
   000978      1  098100             MOVE    000000001000000000 TO CORRECT-18V0           NC1734.2 207
   000979      1  098200             MOVE    WRK-DS-18V00-S     TO COMPUTED-18V0          NC1734.2 58 194
   000980      1  098300             MOVE   "DIV-TEST-F3-18-2" TO PAR-NAME                NC1734.2 176
   000981      1  098400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   000982      1  098500             PERFORM FAIL                                         NC1734.2 327
   000983      1  098600             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000984         098700     MOVE    1     TO REC-CT.                                     NC1734.2 223
   000985         098800 DIV-TEST-F3-18-2.                                                NC1734.2
   000986         098900     MOVE   "DIV-TEST-F3-18-2" TO PAR-NAME.                       NC1734.2 176
   000987         099000     IF      WRK-XN-00001 = "2"                                   NC1734.2 50
   000988      1  099100             PERFORM PASS                                         NC1734.2 326
   000989      1  099200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   000990         099300     ELSE                                                         NC1734.2
   000991      1  099400             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   000992      1  099500             MOVE   "2"           TO CORRECT-X                    NC1734.2 200
   000993      1  099600             MOVE   "NOT ON SIZE ERROR NOT EXECUTED" TO RE-MARK   NC1734.2 181
   000994      1  099700             PERFORM FAIL                                         NC1734.2 327
   000995      1  099800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   000996         099900*                                                                 NC1734.2
   000997         100000*                                                                 NC1734.2
   000998         100100 DIV-INIT-F3-19.                                                  NC1734.2
   000999         100200     MOVE   "DIV-TEST-F3-19"     TO PAR-NAME.                     NC1734.2 176
   001000         100300*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   001001         100400*            ==-->  MULTIPLE RESULT FIELDS <--==                  NC1734.2
   001002         100500     MOVE   "V1-82 6.11.4 GR3" TO ANSI-REFERENCE.                 NC1734.2 232
   001003         100600     MOVE    0 TO WRK-DU-2V1-1.                                   NC1734.2 103
   001004         100700     MOVE    0 TO WRK-DU-2V1-2.                                   NC1734.2 104
   001005         100800     MOVE    0 TO WRK-DU-2V0-2.                                   NC1734.2 101
   001006         100900     MOVE    0 TO WRK-DU-2V1-3.                                   NC1734.2 105
   001007         101000     MOVE    0 TO WRK-DU-2V0-3.                                   NC1734.2 102
   001008         101100     MOVE    1 TO REC-CT.                                         NC1734.2 223
   001009         101200     MOVE   10 TO WRK-DU-2V0-1.                                   NC1734.2 100
   001010         101300     MOVE  3.9 TO WRK-DU-1V1-2.                                   NC1734.2 94
   001011         101400 DIV-TEST-F3-19-0.                                                NC1734.2
   001012         101500     DIVIDE  WRK-DU-2V0-1 BY WRK-DU-1V1-2                         NC1734.2 100 94
   001013         101600      GIVING WRK-DU-2V1-1                                         NC1734.2 103
   001014         101700             WRK-DU-2V0-1 ROUNDED                                 NC1734.2 100
   001015         101800             WRK-DU-2V1-2                                         NC1734.2 104
   001016         101900             WRK-DU-2V0-2 ROUNDED                                 NC1734.2 101
   001017         102000             WRK-DU-2V1-3                                         NC1734.2 105
   001018         102100             WRK-DU-2V0-3.                                        NC1734.2 102
   001019         102200     GO TO DIV-TEST-F3-19-1.                                      NC1734.2 1024
   001020         102300 DIV-DELETE-F3-19.                                                NC1734.2
   001021         102400     PERFORM DE-LETE.                                             NC1734.2 328
   001022         102500     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001023         102600     GO TO   DIV-INIT-F3-20.                                      NC1734.2 1085
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700 DIV-TEST-F3-19-1.                                                NC1734.2
   001025         102800     IF      WRK-DU-2V1-1 = 2.5                                   NC1734.2 103
   001026      1  102900             PERFORM PASS                                         NC1734.2 326
   001027      1  103000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001028         103100     ELSE                                                         NC1734.2
   001029      1  103200             PERFORM FAIL                                         NC1734.2 327
   001030      1  103300             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1734.2 103 188
   001031      1  103400             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001032      1  103500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001033         103600     ADD 1 TO REC-CT.                                             NC1734.2 223
   001034         103700 DIV-TEST-F3-19-2.                                                NC1734.2
   001035         103800     IF      WRK-DU-2V0-1 = 3                                     NC1734.2 100
   001036      1  103900             PERFORM PASS                                         NC1734.2 326
   001037      1  104000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001038         104100     ELSE                                                         NC1734.2
   001039      1  104200             PERFORM FAIL                                         NC1734.2 327
   001040      1  104300             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1734.2 100 188
   001041      1  104400             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001042      1  104500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001043         104600     ADD 1 TO REC-CT.                                             NC1734.2 223
   001044         104700 DIV-TEST-F3-19-3.                                                NC1734.2
   001045         104800     IF      WRK-DU-2V1-2 = 2.5                                   NC1734.2 104
   001046      1  104900             PERFORM PASS                                         NC1734.2 326
   001047      1  105000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001048         105100     ELSE                                                         NC1734.2
   001049      1  105200             PERFORM FAIL                                         NC1734.2 327
   001050      1  105300             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1734.2 104 188
   001051      1  105400             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001052      1  105500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001053         105600     ADD 1 TO REC-CT.                                             NC1734.2 223
   001054         105700 DIV-TEST-F3-19-4.                                                NC1734.2
   001055         105800     IF      WRK-DU-2V0-2 = 3                                     NC1734.2 101
   001056      1  105900             PERFORM PASS                                         NC1734.2 326
   001057      1  106000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001058         106100     ELSE                                                         NC1734.2
   001059      1  106200             PERFORM FAIL                                         NC1734.2 327
   001060      1  106300             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1734.2 101 188
   001061      1  106400             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001062      1  106500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001063         106600     ADD 1 TO REC-CT.                                             NC1734.2 223
   001064         106700 DIV-TEST-F3-19-5.                                                NC1734.2
   001065         106800     IF      WRK-DU-2V1-3 = 2.5                                   NC1734.2 105
   001066      1  106900             PERFORM PASS                                         NC1734.2 326
   001067      1  107000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001068         107100     ELSE                                                         NC1734.2
   001069      1  107200             PERFORM FAIL                                         NC1734.2 327
   001070      1  107300             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1734.2 105 188
   001071      1  107400             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001072      1  107500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001073         107600     ADD 1 TO REC-CT.                                             NC1734.2 223
   001074         107700 DIV-TEST-F3-19-6.                                                NC1734.2
   001075         107800     IF      WRK-DU-2V0-3 = 2                                     NC1734.2 102
   001076      1  107900             PERFORM PASS                                         NC1734.2 326
   001077      1  108000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001078         108100     ELSE                                                         NC1734.2
   001079      1  108200             PERFORM FAIL                                         NC1734.2 327
   001080      1  108300             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1734.2 102 188
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081      1  108400             MOVE    2            TO CORRECT-N                    NC1734.2 202
   001082      1  108500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001083         108600*                                                                 NC1734.2
   001084         108700*                                                                 NC1734.2
   001085         108800 DIV-INIT-F3-20.                                                  NC1734.2
   001086         108900*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   001087         109000*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1734.2
   001088         109100     MOVE   "DIV-TEST-F3-20" TO PAR-NAME.                         NC1734.2 176
   001089         109200     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1734.2 232
   001090         109300     MOVE   "0"  TO WRK-XN-00001.                                 NC1734.2 50
   001091         109400     MOVE    0   TO WRK-DU-2V1-1.                                 NC1734.2 103
   001092         109500     MOVE    0   TO WRK-DU-2V0-1.                                 NC1734.2 100
   001093         109600     MOVE    0   TO WRK-DU-2V1-2.                                 NC1734.2 104
   001094         109700     MOVE    0   TO WRK-DU-2V0-2.                                 NC1734.2 101
   001095         109800     MOVE    0   TO WRK-DU-2V1-3.                                 NC1734.2 105
   001096         109900     MOVE    0   TO WRK-DU-2V0-3.                                 NC1734.2 102
   001097         110000     MOVE    1   TO REC-CT.                                       NC1734.2 223
   001098         110100     MOVE    99  TO WRK-DU-2V0-1.                                 NC1734.2 100
   001099         110200 DIV-TEST-F3-20-0.                                                NC1734.2
   001100         110300     DIVIDE  WRK-DU-2V0-1 BY A01ONE-CS-00V01                      NC1734.2 100 72
   001101         110400      GIVING WRK-DU-2V1-1                                         NC1734.2 103
   001102         110500             WRK-DU-2V0-1 ROUNDED                                 NC1734.2 100
   001103         110600             WRK-DU-2V1-2                                         NC1734.2 104
   001104         110700             WRK-DU-2V0-2 ROUNDED                                 NC1734.2 101
   001105         110800             WRK-DU-2V1-3                                         NC1734.2 105
   001106         110900             WRK-DU-2V0-3                                         NC1734.2 102
   001107         111000          ON SIZE ERROR                                           NC1734.2
   001108      1  111100             MOVE  "1" TO WRK-XN-00001.                           NC1734.2 50
   001109         111200     GO TO DIV-TEST-F3-20-1.                                      NC1734.2 1114
   001110         111300 DIV-DELETE-F3-20.                                                NC1734.2
   001111         111400     PERFORM DE-LETE.                                             NC1734.2 328
   001112         111500     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001113         111600     GO TO   DIV-INIT-F3-21.                                      NC1734.2 1193
   001114         111700 DIV-TEST-F3-20-1.                                                NC1734.2
   001115         111800     IF      WRK-DU-2V1-1 = 0                                     NC1734.2 103
   001116      1  111900             PERFORM PASS                                         NC1734.2 326
   001117      1  112000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001118         112100     ELSE                                                         NC1734.2
   001119      1  112200             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001120      1  112300             PERFORM FAIL                                         NC1734.2 327
   001121      1  112400             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1734.2 103 188
   001122      1  112500             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001123      1  112600             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001124         112700     ADD 1 TO REC-CT.                                             NC1734.2 223
   001125         112800 DIV-TEST-F3-20-2.                                                NC1734.2
   001126         112900     IF      WRK-DU-2V0-1 = 99                                    NC1734.2 100
   001127      1  113000             PERFORM PASS                                         NC1734.2 326
   001128      1  113100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001129         113200     ELSE                                                         NC1734.2
   001130      1  113300             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001131      1  113400             PERFORM FAIL                                         NC1734.2 327
   001132      1  113500             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1734.2 100 188
   001133      1  113600             MOVE    99           TO CORRECT-N                    NC1734.2 202
   001134      1  113700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001135         113800     ADD 1 TO REC-CT.                                             NC1734.2 223
   001136         113900 DIV-TEST-F3-20-3.                                                NC1734.2
   001137         114000     IF      WRK-DU-2V1-2 = 0                                     NC1734.2 104
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114100             PERFORM PASS                                         NC1734.2 326
   001139      1  114200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001140         114300     ELSE                                                         NC1734.2
   001141      1  114400             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001142      1  114500             PERFORM FAIL                                         NC1734.2 327
   001143      1  114600             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1734.2 104 188
   001144      1  114700             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001145      1  114800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001146         114900     ADD 1 TO REC-CT.                                             NC1734.2 223
   001147         115000 DIV-TEST-F3-20-4.                                                NC1734.2
   001148         115100     IF      WRK-DU-2V0-2 = 0                                     NC1734.2 101
   001149      1  115200             PERFORM PASS                                         NC1734.2 326
   001150      1  115300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001151         115400     ELSE                                                         NC1734.2
   001152      1  115500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001153      1  115600             PERFORM FAIL                                         NC1734.2 327
   001154      1  115700             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1734.2 101 188
   001155      1  115800             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001156      1  115900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001157         116000     ADD 1 TO REC-CT.                                             NC1734.2 223
   001158         116100 DIV-TEST-F3-20-5.                                                NC1734.2
   001159         116200     IF      WRK-DU-2V1-3 = 0                                     NC1734.2 105
   001160      1  116300             PERFORM PASS                                         NC1734.2 326
   001161      1  116400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001162         116500     ELSE                                                         NC1734.2
   001163      1  116600             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001164      1  116700             PERFORM FAIL                                         NC1734.2 327
   001165      1  116800             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1734.2 105 188
   001166      1  116900             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001167      1  117000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001168         117100     ADD 1 TO REC-CT.                                             NC1734.2 223
   001169         117200 DIV-TEST-F3-20-6.                                                NC1734.2
   001170         117300     IF      WRK-DU-2V0-3 = 0                                     NC1734.2 102
   001171      1  117400             PERFORM PASS                                         NC1734.2 326
   001172      1  117500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001173         117600     ELSE                                                         NC1734.2
   001174      1  117700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001175      1  117800             PERFORM FAIL                                         NC1734.2 327
   001176      1  117900             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1734.2 102 188
   001177      1  118000             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001178      1  118100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001179         118200     ADD 1 TO REC-CT.                                             NC1734.2 223
   001180         118300 DIV-TEST-F3-20-7.                                                NC1734.2
   001181         118400     IF      WRK-XN-00001  = "1"                                  NC1734.2 50
   001182      1  118500             PERFORM PASS                                         NC1734.2 326
   001183      1  118600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001184         118700     ELSE                                                         NC1734.2
   001185      1  118800             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   001186      1  118900             MOVE   "1"           TO CORRECT-X                    NC1734.2 200
   001187      1  119000             MOVE   "DIV-TEST-F3-20-7" TO PAR-NAME                NC1734.2 176
   001188      1  119100             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   001189      1  119200             PERFORM FAIL                                         NC1734.2 327
   001190      1  119300             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001191         119400*                                                                 NC1734.2
   001192         119500*                                                                 NC1734.2
   001193         119600 DIV-INIT-F3-21.                                                  NC1734.2
   001194         119700*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800*            ==-->  MULTIPLE RESULT FIELDS <--==                  NC1734.2
   001196         119900     MOVE   "DIV-TEST-F3-21"     TO PAR-NAME.                     NC1734.2 176
   001197         120000     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1734.2 232
   001198         120100     MOVE   "0"  TO WRK-XN-00001.                                 NC1734.2 50
   001199         120200     MOVE    0   TO WRK-DU-2V1-1.                                 NC1734.2 103
   001200         120300     MOVE    0   TO WRK-DU-2V0-1.                                 NC1734.2 100
   001201         120400     MOVE    0   TO WRK-DU-2V1-2.                                 NC1734.2 104
   001202         120500     MOVE    0   TO WRK-DU-2V0-2.                                 NC1734.2 101
   001203         120600     MOVE    0   TO WRK-DU-2V1-3.                                 NC1734.2 105
   001204         120700     MOVE    0   TO WRK-DU-2V0-3.                                 NC1734.2 102
   001205         120800     MOVE    1   TO REC-CT.                                       NC1734.2 223
   001206         120900     MOVE   10   TO WRK-DU-2V0-1.                                 NC1734.2 100
   001207         121000     MOVE  3.9   TO WRK-DU-1V1-2.                                 NC1734.2 94
   001208         121100 DIV-TEST-F3-21-0.                                                NC1734.2
   001209         121200     DIVIDE  WRK-DU-2V0-1 BY WRK-DU-1V1-2                         NC1734.2 100 94
   001210         121300      GIVING WRK-DU-2V1-1                                         NC1734.2 103
   001211         121400             WRK-DU-2V0-1 ROUNDED                                 NC1734.2 100
   001212         121500             WRK-DU-2V1-2                                         NC1734.2 104
   001213         121600             WRK-DU-2V0-2 ROUNDED                                 NC1734.2 101
   001214         121700             WRK-DU-2V1-3                                         NC1734.2 105
   001215         121800             WRK-DU-2V0-3                                         NC1734.2 102
   001216         121900          ON SIZE ERROR                                           NC1734.2
   001217      1  122000             MOVE   "1" TO WRK-XN-00001.                          NC1734.2 50
   001218         122100     GO TO DIV-TEST-F3-21-1.                                      NC1734.2 1223
   001219         122200 DIV-DELETE-F3-21.                                                NC1734.2
   001220         122300     PERFORM DE-LETE.                                             NC1734.2 328
   001221         122400     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001222         122500     GO TO   DIV-INIT-F3-22.                                      NC1734.2 1297
   001223         122600 DIV-TEST-F3-21-1.                                                NC1734.2
   001224         122700     IF      WRK-DU-2V1-1 = 2.5                                   NC1734.2 103
   001225      1  122800             PERFORM PASS                                         NC1734.2 326
   001226      1  122900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001227         123000     ELSE                                                         NC1734.2
   001228      1  123100             PERFORM FAIL                                         NC1734.2 327
   001229      1  123200             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1734.2 103 188
   001230      1  123300             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001231      1  123400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001232         123500     ADD 1 TO REC-CT.                                             NC1734.2 223
   001233         123600 DIV-TEST-F3-21-2.                                                NC1734.2
   001234         123700     IF      WRK-DU-2V0-1 = 3                                     NC1734.2 100
   001235      1  123800             PERFORM PASS                                         NC1734.2 326
   001236      1  123900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001237         124000     ELSE                                                         NC1734.2
   001238      1  124100             PERFORM FAIL                                         NC1734.2 327
   001239      1  124200             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1734.2 100 188
   001240      1  124300             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001241      1  124400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001242         124500     ADD 1 TO REC-CT.                                             NC1734.2 223
   001243         124600 DIV-TEST-F3-21-3.                                                NC1734.2
   001244         124700     IF      WRK-DU-2V1-2 = 2.5                                   NC1734.2 104
   001245      1  124800             PERFORM PASS                                         NC1734.2 326
   001246      1  124900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001247         125000     ELSE                                                         NC1734.2
   001248      1  125100             PERFORM FAIL                                         NC1734.2 327
   001249      1  125200             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1734.2 104 188
   001250      1  125300             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001251      1  125400             PERFORM PRINT-DETAIL.                                NC1734.2 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     ADD 1 TO REC-CT.                                             NC1734.2 223
   001253         125600 DIV-TEST-F3-21-4.                                                NC1734.2
   001254         125700     IF      WRK-DU-2V0-2 = 3                                     NC1734.2 101
   001255      1  125800             PERFORM PASS                                         NC1734.2 326
   001256      1  125900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001257         126000     ELSE                                                         NC1734.2
   001258      1  126100             PERFORM FAIL                                         NC1734.2 327
   001259      1  126200             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1734.2 101 188
   001260      1  126300             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001261      1  126400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001262         126500     ADD 1 TO REC-CT.                                             NC1734.2 223
   001263         126600 DIV-TEST-F3-21-5.                                                NC1734.2
   001264         126700     IF      WRK-DU-2V1-3 = 2.5                                   NC1734.2 105
   001265      1  126800             PERFORM PASS                                         NC1734.2 326
   001266      1  126900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001267         127000     ELSE                                                         NC1734.2
   001268      1  127100             PERFORM FAIL                                         NC1734.2 327
   001269      1  127200             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1734.2 105 188
   001270      1  127300             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001271      1  127400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001272         127500     ADD 1 TO REC-CT.                                             NC1734.2 223
   001273         127600 DIV-TEST-F3-21-6.                                                NC1734.2
   001274         127700     IF      WRK-DU-2V0-3 = 2                                     NC1734.2 102
   001275      1  127800             PERFORM PASS                                         NC1734.2 326
   001276      1  127900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001277         128000     ELSE                                                         NC1734.2
   001278      1  128100             PERFORM FAIL                                         NC1734.2 327
   001279      1  128200             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1734.2 102 188
   001280      1  128300             MOVE    2            TO CORRECT-N                    NC1734.2 202
   001281      1  128400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001282         128500     ADD 1 TO REC-CT.                                             NC1734.2 223
   001283         128600 DIV-TEST-F3-21-7.                                                NC1734.2
   001284         128700     IF      WRK-XN-00001  = "0"                                  NC1734.2 50
   001285      1  128800             PERFORM PASS                                         NC1734.2 326
   001286      1  128900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001287         129000     ELSE                                                         NC1734.2
   001288      1  129100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   001289      1  129200             MOVE   "0"           TO CORRECT-X                    NC1734.2 200
   001290      1  129300             MOVE   "DIV-TEST-F3-21-7" TO PAR-NAME                NC1734.2 176
   001291      1  129400             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   001292      1  129500                  TO RE-MARK                                      NC1734.2 181
   001293      1  129600             PERFORM FAIL                                         NC1734.2 327
   001294      1  129700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001295         129800*                                                                 NC1734.2
   001296         129900*                                                                 NC1734.2
   001297         130000 DIV-INIT-F3-22.                                                  NC1734.2
   001298         130100*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   001299         130200*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1734.2
   001300         130300     MOVE   "DIV-TEST-F3-22" TO PAR-NAME.                         NC1734.2 176
   001301         130400     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1734.2 232
   001302         130500     MOVE   "0"  TO WRK-XN-00001.                                 NC1734.2 50
   001303         130600     MOVE    0   TO WRK-DU-2V1-1.                                 NC1734.2 103
   001304         130700     MOVE    0   TO WRK-DU-2V0-1.                                 NC1734.2 100
   001305         130800     MOVE    0   TO WRK-DU-2V1-2.                                 NC1734.2 104
   001306         130900     MOVE    0   TO WRK-DU-2V0-2.                                 NC1734.2 101
   001307         131000     MOVE    0   TO WRK-DU-2V1-3.                                 NC1734.2 105
   001308         131100     MOVE    0   TO WRK-DU-2V0-3.                                 NC1734.2 102
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     MOVE    1   TO REC-CT.                                       NC1734.2 223
   001310         131300     MOVE    99  TO WRK-DU-2V0-1.                                 NC1734.2 100
   001311         131400 DIV-TEST-F3-22-0.                                                NC1734.2
   001312         131500     DIVIDE  WRK-DU-2V0-1 BY A01ONE-CS-00V01                      NC1734.2 100 72
   001313         131600      GIVING WRK-DU-2V1-1                                         NC1734.2 103
   001314         131700             WRK-DU-2V0-1 ROUNDED                                 NC1734.2 100
   001315         131800             WRK-DU-2V1-2                                         NC1734.2 104
   001316         131900             WRK-DU-2V0-2 ROUNDED                                 NC1734.2 101
   001317         132000             WRK-DU-2V1-3                                         NC1734.2 105
   001318         132100             WRK-DU-2V0-3                                         NC1734.2 102
   001319         132200      NOT ON SIZE ERROR                                           NC1734.2
   001320      1  132300             MOVE  "1" TO WRK-XN-00001.                           NC1734.2 50
   001321         132400     GO TO   DIV-TEST-F3-22-1.                                    NC1734.2 1326
   001322         132500 DIV-DELETE-F3-22.                                                NC1734.2
   001323         132600     PERFORM DE-LETE.                                             NC1734.2 328
   001324         132700     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001325         132800     GO TO   DIV-INIT-F3-23.                                      NC1734.2 1406
   001326         132900 DIV-TEST-F3-22-1.                                                NC1734.2
   001327         133000     IF      WRK-DU-2V1-1 = 0                                     NC1734.2 103
   001328      1  133100             PERFORM PASS                                         NC1734.2 326
   001329      1  133200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001330         133300     ELSE                                                         NC1734.2
   001331      1  133400             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001332      1  133500             PERFORM FAIL                                         NC1734.2 327
   001333      1  133600             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1734.2 103 188
   001334      1  133700             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001335      1  133800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001336         133900     ADD 1 TO REC-CT.                                             NC1734.2 223
   001337         134000 DIV-TEST-F3-22-2.                                                NC1734.2
   001338         134100     IF      WRK-DU-2V0-1 = 99                                    NC1734.2 100
   001339      1  134200             PERFORM PASS                                         NC1734.2 326
   001340      1  134300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001341         134400     ELSE                                                         NC1734.2
   001342      1  134500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001343      1  134600             PERFORM FAIL                                         NC1734.2 327
   001344      1  134700             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1734.2 100 188
   001345      1  134800             MOVE    99           TO CORRECT-N                    NC1734.2 202
   001346      1  134900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001347         135000     ADD 1 TO REC-CT.                                             NC1734.2 223
   001348         135100 DIV-TEST-F3-22-3.                                                NC1734.2
   001349         135200     IF      WRK-DU-2V1-2 = 0                                     NC1734.2 104
   001350      1  135300             PERFORM PASS                                         NC1734.2 326
   001351      1  135400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001352         135500     ELSE                                                         NC1734.2
   001353      1  135600             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001354      1  135700             PERFORM FAIL                                         NC1734.2 327
   001355      1  135800             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1734.2 104 188
   001356      1  135900             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001357      1  136000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001358         136100     ADD 1 TO REC-CT.                                             NC1734.2 223
   001359         136200 DIV-TEST-F3-22-4.                                                NC1734.2
   001360         136300     IF      WRK-DU-2V0-2 = 0                                     NC1734.2 101
   001361      1  136400             PERFORM PASS                                         NC1734.2 326
   001362      1  136500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001363         136600     ELSE                                                         NC1734.2
   001364      1  136700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001365      1  136800             PERFORM FAIL                                         NC1734.2 327
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366      1  136900             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1734.2 101 188
   001367      1  137000             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001368      1  137100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001369         137200     ADD 1 TO REC-CT.                                             NC1734.2 223
   001370         137300 DIV-TEST-F3-22-5.                                                NC1734.2
   001371         137400     IF      WRK-DU-2V1-3 = 0                                     NC1734.2 105
   001372      1  137500             PERFORM PASS                                         NC1734.2 326
   001373      1  137600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001374         137700     ELSE                                                         NC1734.2
   001375      1  137800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001376      1  137900             PERFORM FAIL                                         NC1734.2 327
   001377      1  138000             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1734.2 105 188
   001378      1  138100             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001379      1  138200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001380         138300     ADD 1 TO REC-CT.                                             NC1734.2 223
   001381         138400 DIV-TEST-F3-22-6.                                                NC1734.2
   001382         138500     IF      WRK-DU-2V0-3 = 0                                     NC1734.2 102
   001383      1  138600             PERFORM PASS                                         NC1734.2 326
   001384      1  138700             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001385         138800     ELSE                                                         NC1734.2
   001386      1  138900             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001387      1  139000             PERFORM FAIL                                         NC1734.2 327
   001388      1  139100             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1734.2 102 188
   001389      1  139200             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001390      1  139300             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001391         139400     ADD 1 TO REC-CT.                                             NC1734.2 223
   001392         139500 DIV-TEST-F3-22-7.                                                NC1734.2
   001393         139600     IF      WRK-XN-00001  = "0"                                  NC1734.2 50
   001394      1  139700             PERFORM PASS                                         NC1734.2 326
   001395      1  139800             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001396         139900     ELSE                                                         NC1734.2
   001397      1  140000             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   001398      1  140100             MOVE   "0"           TO CORRECT-X                    NC1734.2 200
   001399      1  140200             MOVE   "DIV-TEST-F3-22-7" TO PAR-NAME                NC1734.2 176
   001400      1  140300             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1734.2
   001401      1  140400                  TO RE-MARK                                      NC1734.2 181
   001402      1  140500             PERFORM FAIL                                         NC1734.2 327
   001403      1  140600             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001404         140700*                                                                 NC1734.2
   001405         140800*                                                                 NC1734.2
   001406         140900 DIV-INIT-F3-23.                                                  NC1734.2
   001407         141000*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   001408         141100*            ==-->  NEW SIZE ERROR TESTS   <--==                  NC1734.2
   001409         141200     MOVE   "DIV-TEST-F3-23" TO PAR-NAME.                         NC1734.2 176
   001410         141300     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1734.2 232
   001411         141400     MOVE   "0"  TO WRK-XN-00001.                                 NC1734.2 50
   001412         141500     MOVE    0   TO WRK-DU-2V1-1.                                 NC1734.2 103
   001413         141600     MOVE    0   TO WRK-DU-2V1-2.                                 NC1734.2 104
   001414         141700     MOVE    0   TO WRK-DU-2V0-2.                                 NC1734.2 101
   001415         141800     MOVE    0   TO WRK-DU-2V1-3.                                 NC1734.2 105
   001416         141900     MOVE    0   TO WRK-DU-2V0-3.                                 NC1734.2 102
   001417         142000     MOVE    1   TO REC-CT.                                       NC1734.2 223
   001418         142100     MOVE    10  TO WRK-DU-2V0-1.                                 NC1734.2 100
   001419         142200     MOVE    3.9 TO WRK-DU-1V1-2.                                 NC1734.2 94
   001420         142300 DIV-TEST-F3-23-0.                                                NC1734.2
   001421         142400     DIVIDE  WRK-DU-2V0-1 BY WRK-DU-1V1-2                         NC1734.2 100 94
   001422         142500      GIVING WRK-DU-2V1-1                                         NC1734.2 103
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600             WRK-DU-2V0-1 ROUNDED                                 NC1734.2 100
   001424         142700             WRK-DU-2V1-2                                         NC1734.2 104
   001425         142800             WRK-DU-2V0-2 ROUNDED                                 NC1734.2 101
   001426         142900             WRK-DU-2V1-3                                         NC1734.2 105
   001427         143000             WRK-DU-2V0-3                                         NC1734.2 102
   001428         143100      NOT ON SIZE ERROR                                           NC1734.2
   001429      1  143200             MOVE   "1" TO WRK-XN-00001.                          NC1734.2 50
   001430         143300     GO TO DIV-TEST-F3-23-1.                                      NC1734.2 1435
   001431         143400 DIV-DELETE-F3-23.                                                NC1734.2
   001432         143500     PERFORM DE-LETE.                                             NC1734.2 328
   001433         143600     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001434         143700     GO TO   DIV-INIT-F3-24.                                      NC1734.2 1514
   001435         143800 DIV-TEST-F3-23-1.                                                NC1734.2
   001436         143900     IF      WRK-DU-2V1-1 = 2.5                                   NC1734.2 103
   001437      1  144000             PERFORM PASS                                         NC1734.2 326
   001438      1  144100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001439         144200     ELSE                                                         NC1734.2
   001440      1  144300             PERFORM FAIL                                         NC1734.2 327
   001441      1  144400             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1734.2 103 188
   001442      1  144500             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001443      1  144600             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001444         144700     ADD 1 TO REC-CT.                                             NC1734.2 223
   001445         144800 DIV-TEST-F3-23-2.                                                NC1734.2
   001446         144900     IF      WRK-DU-2V0-1 = 3                                     NC1734.2 100
   001447      1  145000             PERFORM PASS                                         NC1734.2 326
   001448      1  145100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001449         145200     ELSE                                                         NC1734.2
   001450      1  145300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001451      1  145400             PERFORM FAIL                                         NC1734.2 327
   001452      1  145500             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1734.2 100 188
   001453      1  145600             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001454      1  145700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001455         145800     ADD 1 TO REC-CT.                                             NC1734.2 223
   001456         145900 DIV-TEST-F3-23-3.                                                NC1734.2
   001457         146000     IF      WRK-DU-2V1-2 = 2.5                                   NC1734.2 104
   001458      1  146100             PERFORM PASS                                         NC1734.2 326
   001459      1  146200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001460         146300     ELSE                                                         NC1734.2
   001461      1  146400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001462      1  146500             PERFORM FAIL                                         NC1734.2 327
   001463      1  146600             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1734.2 104 188
   001464      1  146700             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001465      1  146800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001466         146900     ADD 1 TO REC-CT.                                             NC1734.2 223
   001467         147000 DIV-TEST-F3-23-4.                                                NC1734.2
   001468         147100     IF      WRK-DU-2V0-2 = 3                                     NC1734.2 101
   001469      1  147200             PERFORM PASS                                         NC1734.2 326
   001470      1  147300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001471         147400     ELSE                                                         NC1734.2
   001472      1  147500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001473      1  147600             PERFORM FAIL                                         NC1734.2 327
   001474      1  147700             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1734.2 101 188
   001475      1  147800             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001476      1  147900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001477         148000     ADD 1 TO REC-CT.                                             NC1734.2 223
   001478         148100 DIV-TEST-F3-23-5.                                                NC1734.2
   001479         148200     IF      WRK-DU-2V1-3 = 2.5                                   NC1734.2 105
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480      1  148300             PERFORM PASS                                         NC1734.2 326
   001481      1  148400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001482         148500     ELSE                                                         NC1734.2
   001483      1  148600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001484      1  148700             PERFORM FAIL                                         NC1734.2 327
   001485      1  148800             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1734.2 105 188
   001486      1  148900             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001487      1  149000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001488         149100     ADD 1 TO REC-CT.                                             NC1734.2 223
   001489         149200 DIV-TEST-F3-23-6.                                                NC1734.2
   001490         149300     IF      WRK-DU-2V0-3 = 2                                     NC1734.2 102
   001491      1  149400             PERFORM PASS                                         NC1734.2 326
   001492      1  149500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001493         149600     ELSE                                                         NC1734.2
   001494      1  149700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001495      1  149800             PERFORM FAIL                                         NC1734.2 327
   001496      1  149900             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1734.2 102 188
   001497      1  150000             MOVE    2            TO CORRECT-N                    NC1734.2 202
   001498      1  150100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001499         150200     ADD 1 TO REC-CT.                                             NC1734.2 223
   001500         150300 DIV-TEST-F3-23-7.                                                NC1734.2
   001501         150400     IF      WRK-XN-00001  = "1"                                  NC1734.2 50
   001502      1  150500             PERFORM PASS                                         NC1734.2 326
   001503      1  150600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001504         150700     ELSE                                                         NC1734.2
   001505      1  150800             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   001506      1  150900             MOVE   "1"           TO CORRECT-X                    NC1734.2 200
   001507      1  151000             MOVE   "DIV-TEST-F3-23-7" TO PAR-NAME                NC1734.2 176
   001508      1  151100             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1734.2
   001509      1  151200                  TO RE-MARK                                      NC1734.2 181
   001510      1  151300             PERFORM FAIL                                         NC1734.2 327
   001511      1  151400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001512         151500*                                                                 NC1734.2
   001513         151600*                                                                 NC1734.2
   001514         151700 DIV-INIT-F3-24.                                                  NC1734.2
   001515         151800*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   001516         151900*            ==-->    NEW SIZE ERROR TESTS <--==                  NC1734.2
   001517         152000     MOVE   "DIV-TEST-F3-24" TO PAR-NAME.                         NC1734.2 176
   001518         152100     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1734.2 232
   001519         152200     MOVE   "0"  TO WRK-XN-00001.                                 NC1734.2 50
   001520         152300     MOVE    0   TO WRK-DU-2V1-1.                                 NC1734.2 103
   001521         152400     MOVE    0   TO WRK-DU-2V0-1.                                 NC1734.2 100
   001522         152500     MOVE    0   TO WRK-DU-2V1-2.                                 NC1734.2 104
   001523         152600     MOVE    0   TO WRK-DU-2V0-2.                                 NC1734.2 101
   001524         152700     MOVE    0   TO WRK-DU-2V1-3.                                 NC1734.2 105
   001525         152800     MOVE    0   TO WRK-DU-2V0-3.                                 NC1734.2 102
   001526         152900     MOVE    1   TO REC-CT.                                       NC1734.2 223
   001527         153000     MOVE    99  TO WRK-DU-2V0-1.                                 NC1734.2 100
   001528         153100 DIV-TEST-F3-24-0.                                                NC1734.2
   001529         153200     DIVIDE  WRK-DU-2V0-1 BY A01ONE-CS-00V01                      NC1734.2 100 72
   001530         153300      GIVING WRK-DU-2V1-1                                         NC1734.2 103
   001531         153400             WRK-DU-2V0-1 ROUNDED                                 NC1734.2 100
   001532         153500             WRK-DU-2V1-2                                         NC1734.2 104
   001533         153600             WRK-DU-2V0-2 ROUNDED                                 NC1734.2 101
   001534         153700             WRK-DU-2V1-3                                         NC1734.2 105
   001535         153800             WRK-DU-2V0-3                                         NC1734.2 102
   001536         153900          ON SIZE ERROR                                           NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537      1  154000             MOVE  "1" TO WRK-XN-00001                            NC1734.2 50
   001538         154100      NOT ON SIZE ERROR                                           NC1734.2
   001539      1  154200             MOVE  "2" TO WRK-XN-00001.                           NC1734.2 50
   001540         154300     GO TO   DIV-TEST-F3-24-1.                                    NC1734.2 1545
   001541         154400 DIV-DELETE-F3-24.                                                NC1734.2
   001542         154500     PERFORM DE-LETE.                                             NC1734.2 328
   001543         154600     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001544         154700     GO TO   DIV-INIT-F3-25.                                      NC1734.2 1625
   001545         154800 DIV-TEST-F3-24-1.                                                NC1734.2
   001546         154900     IF      WRK-DU-2V1-1 = 0                                     NC1734.2 103
   001547      1  155000             PERFORM PASS                                         NC1734.2 326
   001548      1  155100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001549         155200     ELSE                                                         NC1734.2
   001550      1  155300             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001551      1  155400             PERFORM FAIL                                         NC1734.2 327
   001552      1  155500             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1734.2 103 188
   001553      1  155600             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001554      1  155700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001555         155800     ADD 1 TO REC-CT.                                             NC1734.2 223
   001556         155900 DIV-TEST-F3-24-2.                                                NC1734.2
   001557         156000     IF      WRK-DU-2V0-1 = 99                                    NC1734.2 100
   001558      1  156100             PERFORM PASS                                         NC1734.2 326
   001559      1  156200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001560         156300     ELSE                                                         NC1734.2
   001561      1  156400             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001562      1  156500             PERFORM FAIL                                         NC1734.2 327
   001563      1  156600             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1734.2 100 188
   001564      1  156700             MOVE    99           TO CORRECT-N                    NC1734.2 202
   001565      1  156800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001566         156900     ADD 1 TO REC-CT.                                             NC1734.2 223
   001567         157000 DIV-TEST-F3-24-3.                                                NC1734.2
   001568         157100     IF      WRK-DU-2V1-2 = 0                                     NC1734.2 104
   001569      1  157200             PERFORM PASS                                         NC1734.2 326
   001570      1  157300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001571         157400     ELSE                                                         NC1734.2
   001572      1  157500             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001573      1  157600             PERFORM FAIL                                         NC1734.2 327
   001574      1  157700             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1734.2 104 188
   001575      1  157800             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001576      1  157900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001577         158000     ADD 1 TO REC-CT.                                             NC1734.2 223
   001578         158100 DIV-TEST-F3-24-4.                                                NC1734.2
   001579         158200     IF      WRK-DU-2V0-2 = 0                                     NC1734.2 101
   001580      1  158300             PERFORM PASS                                         NC1734.2 326
   001581      1  158400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001582         158500     ELSE                                                         NC1734.2
   001583      1  158600             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001584      1  158700             PERFORM FAIL                                         NC1734.2 327
   001585      1  158800             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1734.2 101 188
   001586      1  158900             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001587      1  159000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001588         159100     ADD 1 TO REC-CT.                                             NC1734.2 223
   001589         159200 DIV-TEST-F3-24-5.                                                NC1734.2
   001590         159300     IF      WRK-DU-2V1-3 = 0                                     NC1734.2 105
   001591      1  159400             PERFORM PASS                                         NC1734.2 326
   001592      1  159500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001593         159600     ELSE                                                         NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594      1  159700             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001595      1  159800             PERFORM FAIL                                         NC1734.2 327
   001596      1  159900             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1734.2 105 188
   001597      1  160000             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001598      1  160100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001599         160200     ADD 1 TO REC-CT.                                             NC1734.2 223
   001600         160300 DIV-TEST-F3-24-6.                                                NC1734.2
   001601         160400     IF      WRK-DU-2V0-3 = 0                                     NC1734.2 102
   001602      1  160500             PERFORM PASS                                         NC1734.2 326
   001603      1  160600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001604         160700     ELSE                                                         NC1734.2
   001605      1  160800             MOVE   "SIZE ERROR SHOULD HAVE OCCURED" TO RE-MARK   NC1734.2 181
   001606      1  160900             PERFORM FAIL                                         NC1734.2 327
   001607      1  161000             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1734.2 102 188
   001608      1  161100             MOVE    0            TO CORRECT-N                    NC1734.2 202
   001609      1  161200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001610         161300     ADD 1 TO REC-CT.                                             NC1734.2 223
   001611         161400 DIV-TEST-F3-24-7.                                                NC1734.2
   001612         161500     IF      WRK-XN-00001  = "1"                                  NC1734.2 50
   001613      1  161600             PERFORM PASS                                         NC1734.2 326
   001614      1  161700             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001615         161800     ELSE                                                         NC1734.2
   001616      1  161900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   001617      1  162000             MOVE   "1"           TO CORRECT-X                    NC1734.2 200
   001618      1  162100             MOVE   "DIV-TEST-F3-24-7" TO PAR-NAME                NC1734.2 176
   001619      1  162200             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1734.2
   001620      1  162300                  TO RE-MARK                                      NC1734.2 181
   001621      1  162400             PERFORM FAIL                                         NC1734.2 327
   001622      1  162500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001623         162600*                                                                 NC1734.2
   001624         162700*                                                                 NC1734.2
   001625         162800 DIV-INIT-F3-25.                                                  NC1734.2
   001626         162900*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   001627         163000*            ==-->  NEW SIZE ERROR TESTS   <--==                  NC1734.2
   001628         163100     MOVE   "DIV-TEST-F3-25" TO PAR-NAME.                         NC1734.2 176
   001629         163200     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1734.2 232
   001630         163300     MOVE   "0"  TO WRK-XN-00001.                                 NC1734.2 50
   001631         163400     MOVE    0   TO WRK-DU-2V1-1.                                 NC1734.2 103
   001632         163500     MOVE    0   TO WRK-DU-2V1-2.                                 NC1734.2 104
   001633         163600     MOVE    0   TO WRK-DU-2V0-2.                                 NC1734.2 101
   001634         163700     MOVE    0   TO WRK-DU-2V1-3.                                 NC1734.2 105
   001635         163800     MOVE    0   TO WRK-DU-2V0-3.                                 NC1734.2 102
   001636         163900     MOVE    1   TO REC-CT.                                       NC1734.2 223
   001637         164000     MOVE    10  TO WRK-DU-2V0-1.                                 NC1734.2 100
   001638         164100     MOVE    3.9 TO WRK-DU-1V1-2.                                 NC1734.2 94
   001639         164200 DIV-TEST-F3-25-0.                                                NC1734.2
   001640         164300     DIVIDE  WRK-DU-2V0-1 BY WRK-DU-1V1-2                         NC1734.2 100 94
   001641         164400      GIVING WRK-DU-2V1-1                                         NC1734.2 103
   001642         164500             WRK-DU-2V0-1 ROUNDED                                 NC1734.2 100
   001643         164600             WRK-DU-2V1-2                                         NC1734.2 104
   001644         164700             WRK-DU-2V0-2 ROUNDED                                 NC1734.2 101
   001645         164800             WRK-DU-2V1-3                                         NC1734.2 105
   001646         164900             WRK-DU-2V0-3                                         NC1734.2 102
   001647         165000          ON SIZE ERROR                                           NC1734.2
   001648      1  165100             MOVE   "1" TO WRK-XN-00001                           NC1734.2 50
   001649         165200      NOT ON SIZE ERROR                                           NC1734.2
   001650      1  165300             MOVE   "2" TO WRK-XN-00001.                          NC1734.2 50
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165400     GO TO DIV-TEST-F3-25-1.                                      NC1734.2 1656
   001652         165500 DIV-DELETE-F3-25.                                                NC1734.2
   001653         165600     PERFORM DE-LETE.                                             NC1734.2 328
   001654         165700     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001655         165800     GO TO   DIV-INIT-F3-26.                                      NC1734.2 1734
   001656         165900 DIV-TEST-F3-25-1.                                                NC1734.2
   001657         166000     IF      WRK-DU-2V1-1 = 2.5                                   NC1734.2 103
   001658      1  166100             PERFORM PASS                                         NC1734.2 326
   001659      1  166200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001660         166300     ELSE                                                         NC1734.2
   001661      1  166400             PERFORM FAIL                                         NC1734.2 327
   001662      1  166500             MOVE    WRK-DU-2V1-1 TO COMPUTED-N                   NC1734.2 103 188
   001663      1  166600             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001664      1  166700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001665         166800     ADD 1 TO REC-CT.                                             NC1734.2 223
   001666         166900 DIV-TEST-F3-25-2.                                                NC1734.2
   001667         167000     IF      WRK-DU-2V0-1 = 3                                     NC1734.2 100
   001668      1  167100             PERFORM PASS                                         NC1734.2 326
   001669      1  167200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001670         167300     ELSE                                                         NC1734.2
   001671      1  167400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001672      1  167500             PERFORM FAIL                                         NC1734.2 327
   001673      1  167600             MOVE    WRK-DU-2V0-1 TO COMPUTED-N                   NC1734.2 100 188
   001674      1  167700             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001675      1  167800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001676         167900     ADD 1 TO REC-CT.                                             NC1734.2 223
   001677         168000 DIV-TEST-F3-25-3.                                                NC1734.2
   001678         168100     IF      WRK-DU-2V1-2 = 2.5                                   NC1734.2 104
   001679      1  168200             PERFORM PASS                                         NC1734.2 326
   001680      1  168300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001681         168400     ELSE                                                         NC1734.2
   001682      1  168500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001683      1  168600             PERFORM FAIL                                         NC1734.2 327
   001684      1  168700             MOVE    WRK-DU-2V1-2 TO COMPUTED-N                   NC1734.2 104 188
   001685      1  168800             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
   001686      1  168900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001687         169000     ADD 1 TO REC-CT.                                             NC1734.2 223
   001688         169100 DIV-TEST-F3-25-4.                                                NC1734.2
   001689         169200     IF      WRK-DU-2V0-2 = 3                                     NC1734.2 101
   001690      1  169300             PERFORM PASS                                         NC1734.2 326
   001691      1  169400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001692         169500     ELSE                                                         NC1734.2
   001693      1  169600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001694      1  169700             PERFORM FAIL                                         NC1734.2 327
   001695      1  169800             MOVE    WRK-DU-2V0-2 TO COMPUTED-N                   NC1734.2 101 188
   001696      1  169900             MOVE    3            TO CORRECT-N                    NC1734.2 202
   001697      1  170000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001698         170100     ADD 1 TO REC-CT.                                             NC1734.2 223
   001699         170200 DIV-TEST-F3-25-5.                                                NC1734.2
   001700         170300     IF      WRK-DU-2V1-3 = 2.5                                   NC1734.2 105
   001701      1  170400             PERFORM PASS                                         NC1734.2 326
   001702      1  170500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001703         170600     ELSE                                                         NC1734.2
   001704      1  170700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001705      1  170800             PERFORM FAIL                                         NC1734.2 327
   001706      1  170900             MOVE    WRK-DU-2V1-3 TO COMPUTED-N                   NC1734.2 105 188
   001707      1  171000             MOVE    2.5          TO CORRECT-N                    NC1734.2 202
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708      1  171100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001709         171200     ADD 1 TO REC-CT.                                             NC1734.2 223
   001710         171300 DIV-TEST-F3-25-6.                                                NC1734.2
   001711         171400     IF      WRK-DU-2V0-3 = 2                                     NC1734.2 102
   001712      1  171500             PERFORM PASS                                         NC1734.2 326
   001713      1  171600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001714         171700     ELSE                                                         NC1734.2
   001715      1  171800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001716      1  171900             PERFORM FAIL                                         NC1734.2 327
   001717      1  172000             MOVE    WRK-DU-2V0-3 TO COMPUTED-N                   NC1734.2 102 188
   001718      1  172100             MOVE    2            TO CORRECT-N                    NC1734.2 202
   001719      1  172200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001720         172300     ADD 1 TO REC-CT.                                             NC1734.2 223
   001721         172400 DIV-TEST-F3-25-7.                                                NC1734.2
   001722         172500     IF      WRK-XN-00001  = "2"                                  NC1734.2 50
   001723      1  172600             PERFORM PASS                                         NC1734.2 326
   001724      1  172700             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001725         172800     ELSE                                                         NC1734.2
   001726      1  172900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1734.2 50 186
   001727      1  173000             MOVE   "2"           TO CORRECT-X                    NC1734.2 200
   001728      1  173100             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   001729      1  173200                  TO RE-MARK                                      NC1734.2 181
   001730      1  173300             PERFORM FAIL                                         NC1734.2 327
   001731      1  173400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001732         173500*                                                                 NC1734.2
   001733         173600*                                                                 NC1734.2
   001734         173700 DIV-INIT-F3-26.                                                  NC1734.2
   001735         173800*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   001736         173900*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1734.2
   001737         174000     MOVE   "DIV-TEST-F3-26" TO PAR-NAME.                         NC1734.2 176
   001738         174100     MOVE   "1V-41 6.4.3" TO ANSI-REFERENCE.                      NC1734.2 232
   001739         174200     MOVE    44.1  TO DIV2.                                       NC1734.2 154
   001740         174300     MOVE   -9.642 TO DIV4.                                       NC1734.2 158
   001741         174400     MOVE    0     TO DIV10.                                      NC1734.2 169
   001742         174500     MOVE    0     TO WRK-XN-00001.                               NC1734.2 50
   001743         174600     MOVE    0     TO WRK-DS-05V00.                               NC1734.2 81
   001744         174700     MOVE   "A"    TO XRAY.                                       NC1734.2 85
   001745         174800     MOVE    1     TO REC-CT.                                     NC1734.2 223
   001746         174900 DIV-TEST-F3-26-0.                                                NC1734.2
   001747         175000     DIVIDE  DIV2 BY DIV4                                         NC1734.2 154 158
   001748         175100      GIVING DIV10                                                NC1734.2 169
   001749         175200          ON SIZE ERROR                                           NC1734.2
   001750      1  175300             MOVE "P" TO XRAY                                     NC1734.2 85
   001751      1  175400             MOVE "1" TO WRK-XN-00001                             NC1734.2 50
   001752      1  175500             MOVE  23 TO WRK-DS-05V00                             NC1734.2 81
   001753         175600     END-DIVIDE                                                   NC1734.2
   001754         175700     MOVE    99 TO WRK-CS-18V00.                                  NC1734.2 68
   001755         175800     GO TO DIV-TEST-F3-26-1.                                      NC1734.2 1760
   001756         175900 DIV-DELETE-F3-26.                                                NC1734.2
   001757         176000     PERFORM DE-LETE.                                             NC1734.2 328
   001758         176100     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001759         176200     GO TO   DIV-INIT-F3-27.                                      NC1734.2 1821
   001760         176300 DIV-TEST-F3-26-1.                                                NC1734.2
   001761         176400     MOVE   "DIV-TEST-F3-26-1" TO PAR-NAME.                       NC1734.2 176
   001762         176500     IF      DIV10  = 0                                           NC1734.2 169
   001763      1  176600             PERFORM PASS                                         NC1734.2 326
   001764      1  176700             PERFORM PRINT-DETAIL                                 NC1734.2 330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800     ELSE                                                         NC1734.2
   001766      1  176900             MOVE    DIV10 TO COMPUTED-N                          NC1734.2 169 188
   001767      1  177000             MOVE    0     TO CORRECT-N                           NC1734.2 202
   001768      1  177100             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   001769      1  177200             PERFORM FAIL                                         NC1734.2 327
   001770      1  177300             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001771         177400     ADD     1 TO REC-CT.                                         NC1734.2 223
   001772         177500 DIV-TEST-F3-26-2.                                                NC1734.2
   001773         177600     MOVE   "DIV-TEST-F3-26-2" TO PAR-NAME.                       NC1734.2 176
   001774         177700     IF      XRAY    = "P"                                        NC1734.2 85
   001775      1  177800             PERFORM PASS                                         NC1734.2 326
   001776      1  177900             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001777         178000     ELSE                                                         NC1734.2
   001778      1  178100             MOVE    XRAY  TO COMPUTED-X                          NC1734.2 85 186
   001779      1  178200             MOVE   "P"    TO CORRECT-X                           NC1734.2 200
   001780      1  178300             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   001781      1  178400             PERFORM FAIL                                         NC1734.2 327
   001782      1  178500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001783         178600     ADD     1 TO REC-CT.                                         NC1734.2 223
   001784         178700 DIV-TEST-F3-26-3.                                                NC1734.2
   001785         178800     MOVE   "DIV-TEST-F3-26-3" TO PAR-NAME.                       NC1734.2 176
   001786         178900     IF      WRK-XN-00001 = "1"                                   NC1734.2 50
   001787      1  179000             PERFORM PASS                                         NC1734.2 326
   001788      1  179100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001789         179200     ELSE                                                         NC1734.2
   001790      1  179300             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1734.2 50 186
   001791      1  179400             MOVE   "1"            TO CORRECT-X                   NC1734.2 200
   001792      1  179500             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   001793      1  179600             PERFORM FAIL                                         NC1734.2 327
   001794      1  179700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001795         179800     ADD     1 TO REC-CT.                                         NC1734.2 223
   001796         179900 DIV-TEST-F3-26-4.                                                NC1734.2
   001797         180000     MOVE   "DIV-TEST-F3-26-4" TO PAR-NAME.                       NC1734.2 176
   001798         180100     IF      WRK-DS-05V00 = 23                                    NC1734.2 81
   001799      1  180200             PERFORM PASS                                         NC1734.2 326
   001800      1  180300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001801         180400     ELSE                                                         NC1734.2
   001802      1  180500             MOVE    WRK-DS-05V00  TO COMPUTED-N                  NC1734.2 81 188
   001803      1  180600             MOVE    23            TO CORRECT-N                   NC1734.2 202
   001804      1  180700             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1734.2 181
   001805      1  180800             PERFORM FAIL                                         NC1734.2 327
   001806      1  180900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001807         181000     ADD     1 TO REC-CT.                                         NC1734.2 223
   001808         181100 DIV-TEST-F3-26-5.                                                NC1734.2
   001809         181200     MOVE   "DIV-TEST-F3-26-5" TO PAR-NAME.                       NC1734.2 176
   001810         181300     IF      WRK-CS-18V00 = 000000000000000099                    NC1734.2 68
   001811      1  181400             PERFORM PASS                                         NC1734.2 326
   001812      1  181500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001813         181600     ELSE                                                         NC1734.2
   001814      1  181700             MOVE    WRK-CS-18V00  TO COMPUTED-N                  NC1734.2 68 188
   001815      1  181800             MOVE    000000000000000099  TO CORRECT-N             NC1734.2 202
   001816      1  181900             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1734.2 181
   001817      1  182000             PERFORM FAIL                                         NC1734.2 327
   001818      1  182100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001819         182200*                                                                 NC1734.2
   001820         182300*                                                                 NC1734.2
   001821         182400 DIV-INIT-F3-27.                                                  NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182500*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   001823         182600*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1734.2
   001824         182700     MOVE   "DIV-TEST-F3-27" TO PAR-NAME.                         NC1734.2 176
   001825         182800     MOVE   "1V-41 6.4.3" TO ANSI-REFERENCE.                      NC1734.2 232
   001826         182900     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1734.2 78 57
   001827         183000     MOVE   "0" TO WRK-XN-00001.                                  NC1734.2 50
   001828         183100     MOVE    0  TO WRK-DS-05V00.                                  NC1734.2 81
   001829         183200     MOVE    0  TO WRK-DS-02V00.                                  NC1734.2 55
   001830         183300     MOVE    0  TO WRK-CS-18V00.                                  NC1734.2 68
   001831         183400     MOVE    1  TO REC-CT.                                        NC1734.2 223
   001832         183500 DIV-TEST-F3-27-0.                                                NC1734.2
   001833         183600     DIVIDE  WRK-DS-09V09 BY A18ONES-DS-09V09                     NC1734.2 57 78
   001834         183700      GIVING WRK-DS-09V09                                         NC1734.2 57
   001835         183800          ON SIZE ERROR                                           NC1734.2
   001836      1  183900             MOVE "1" TO WRK-XN-00001                             NC1734.2 50
   001837      1  184000             MOVE  23 TO WRK-DS-05V00                             NC1734.2 81
   001838      1  184100             MOVE  -4 TO WRK-DS-02V00                             NC1734.2 55
   001839         184200     END-DIVIDE                                                   NC1734.2
   001840         184300     MOVE    99 TO WRK-CS-18V00.                                  NC1734.2 68
   001841         184400     GO TO   DIV-TEST-F3-27-1.                                    NC1734.2 1846
   001842         184500 DIV-DELETE-F3-27-1.                                              NC1734.2
   001843         184600     PERFORM DE-LETE.                                             NC1734.2 328
   001844         184700     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001845         184800     GO TO   DIV-INIT-F3-28.                                      NC1734.2 1909
   001846         184900 DIV-TEST-F3-27-1.                                                NC1734.2
   001847         185000     MOVE   "DIV-TEST-F3-27-1" TO PAR-NAME.                       NC1734.2 176
   001848         185100     IF      WRK-DS-18V00-S = 000000001000000000                  NC1734.2 58
   001849      1  185200             PERFORM PASS                                         NC1734.2 326
   001850      1  185300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001851         185400     ELSE                                                         NC1734.2
   001852      1  185500             MOVE    000000001000000000 TO CORRECT-18V0           NC1734.2 207
   001853      1  185600             MOVE    WRK-DS-18V00-S     TO COMPUTED-18V0          NC1734.2 58 194
   001854      1  185700             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   001855      1  185800             PERFORM FAIL                                         NC1734.2 327
   001856      1  185900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001857         186000     ADD     1 TO REC-CT.                                         NC1734.2 223
   001858         186100 DIV-TEST-F3-27-2.                                                NC1734.2
   001859         186200     MOVE   "DIV-TEST-F3-27-2" TO PAR-NAME.                       NC1734.2 176
   001860         186300     IF      WRK-DS-02V00 = 00                                    NC1734.2 55
   001861      1  186400             PERFORM PASS                                         NC1734.2 326
   001862      1  186500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001863         186600     ELSE                                                         NC1734.2
   001864      1  186700             MOVE    WRK-DS-02V00  TO COMPUTED-N                  NC1734.2 55 188
   001865      1  186800             MOVE    00            TO CORRECT-N                   NC1734.2 202
   001866      1  186900             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   001867      1  187000                  TO RE-MARK                                      NC1734.2 181
   001868      1  187100             PERFORM FAIL                                         NC1734.2 327
   001869      1  187200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001870         187300     ADD     1 TO REC-CT.                                         NC1734.2 223
   001871         187400 DIV-TEST-F3-27-3.                                                NC1734.2
   001872         187500     MOVE   "DIV-TEST-F3-27-3" TO PAR-NAME.                       NC1734.2 176
   001873         187600     IF      WRK-XN-00001 = "0"                                   NC1734.2 50
   001874      1  187700             PERFORM PASS                                         NC1734.2 326
   001875      1  187800             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001876         187900     ELSE                                                         NC1734.2
   001877      1  188000             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1734.2 50 186
   001878      1  188100             MOVE   "0"            TO CORRECT-X                   NC1734.2 200
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879      1  188200             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   001880      1  188300                  TO RE-MARK                                      NC1734.2 181
   001881      1  188400             PERFORM FAIL                                         NC1734.2 327
   001882      1  188500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001883         188600     ADD     1 TO REC-CT.                                         NC1734.2 223
   001884         188700 DIV-TEST-F3-27-4.                                                NC1734.2
   001885         188800     MOVE   "DIV-TEST-F3-27-4" TO PAR-NAME.                       NC1734.2 176
   001886         188900     IF      WRK-DS-05V00 = 0                                     NC1734.2 81
   001887      1  189000             PERFORM PASS                                         NC1734.2 326
   001888      1  189100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001889         189200     ELSE                                                         NC1734.2
   001890      1  189300             MOVE    WRK-DS-05V00  TO COMPUTED-N                  NC1734.2 81 188
   001891      1  189400             MOVE    0             TO CORRECT-N                   NC1734.2 202
   001892      1  189500             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   001893      1  189600                  TO RE-MARK                                      NC1734.2 181
   001894      1  189700             PERFORM FAIL                                         NC1734.2 327
   001895      1  189800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001896         189900     ADD     1 TO REC-CT.                                         NC1734.2 223
   001897         190000 DIV-TEST-F3-27-5.                                                NC1734.2
   001898         190100     MOVE   "DIV-TEST-F3-27-5" TO PAR-NAME.                       NC1734.2 176
   001899         190200     IF      WRK-CS-18V00 = 000000000000000099                    NC1734.2 68
   001900      1  190300             PERFORM PASS                                         NC1734.2 326
   001901      1  190400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001902         190500     ELSE                                                         NC1734.2
   001903      1  190600             MOVE    WRK-DS-18V00  TO COMPUTED-N                  NC1734.2 44 188
   001904      1  190700             MOVE    000000000000000099  TO CORRECT-N             NC1734.2 202
   001905      1  190800             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1734.2 181
   001906      1  190900             PERFORM FAIL                                         NC1734.2 327
   001907      1  191000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001908         191100*                                                                 NC1734.2
   001909         191200 DIV-INIT-F3-28.                                                  NC1734.2
   001910         191300*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   001911         191400*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1734.2
   001912         191500     MOVE   "DIV-TEST-F3-28" TO PAR-NAME.                         NC1734.2 176
   001913         191600     MOVE   "1V-41 6.4.3" TO ANSI-REFERENCE.                      NC1734.2 232
   001914         191700     MOVE    44.1  TO DIV2.                                       NC1734.2 154
   001915         191800     MOVE   -9.642 TO DIV4.                                       NC1734.2 158
   001916         191900     MOVE    0     TO DIV10.                                      NC1734.2 169
   001917         192000     MOVE   "0"    TO WRK-XN-00001.                               NC1734.2 50
   001918         192100     MOVE    0     TO WRK-DS-05V00.                               NC1734.2 81
   001919         192200     MOVE   "A"    TO XRAY.                                       NC1734.2 85
   001920         192300     MOVE    1 TO REC-CT.                                         NC1734.2 223
   001921         192400 DIV-TEST-F3-28-0.                                                NC1734.2
   001922         192500     DIVIDE  DIV2 BY DIV4                                         NC1734.2 154 158
   001923         192600      GIVING DIV10                                                NC1734.2 169
   001924         192700      NOT ON SIZE ERROR                                           NC1734.2
   001925      1  192800             MOVE "P" TO XRAY                                     NC1734.2 85
   001926      1  192900             MOVE "1" TO WRK-XN-00001                             NC1734.2 50
   001927      1  193000             MOVE  23 TO WRK-DS-05V00                             NC1734.2 81
   001928         193100     END-DIVIDE                                                   NC1734.2
   001929         193200     MOVE    99 TO WRK-CS-18V00.                                  NC1734.2 68
   001930         193300     GO TO DIV-TEST-F3-28-1.                                      NC1734.2 1935
   001931         193400 DIV-DELETE-F3-28-1.                                              NC1734.2
   001932         193500     PERFORM DE-LETE.                                             NC1734.2 328
   001933         193600     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   001934         193700     GO TO   DIV-INIT-F3-29.                                      NC1734.2 2000
   001935         193800 DIV-TEST-F3-28-1.                                                NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900     MOVE   "DIV-TEST-F3-28-1" TO PAR-NAME.                       NC1734.2 176
   001937         194000     IF      DIV10   = 0                                          NC1734.2 169
   001938      1  194100             PERFORM PASS                                         NC1734.2 326
   001939      1  194200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001940         194300     ELSE                                                         NC1734.2
   001941      1  194400             MOVE    DIV10 TO COMPUTED-N                          NC1734.2 169 188
   001942      1  194500             MOVE    0     TO CORRECT-N                           NC1734.2 202
   001943      1  194600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1734.2
   001944      1  194700                  TO RE-MARK                                      NC1734.2 181
   001945      1  194800             PERFORM FAIL                                         NC1734.2 327
   001946      1  194900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001947         195000     ADD     1 TO REC-CT.                                         NC1734.2 223
   001948         195100 DIV-TEST-F3-28-2.                                                NC1734.2
   001949         195200     MOVE   "DIV-TEST-F3-28-2" TO PAR-NAME.                       NC1734.2 176
   001950         195300     IF      XRAY    = "A"                                        NC1734.2 85
   001951      1  195400             PERFORM PASS                                         NC1734.2 326
   001952      1  195500             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001953         195600     ELSE                                                         NC1734.2
   001954      1  195700             MOVE    XRAY  TO COMPUTED-X                          NC1734.2 85 186
   001955      1  195800             MOVE   "A"    TO CORRECT-X                           NC1734.2 200
   001956      1  195900             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1734.2
   001957      1  196000                  TO RE-MARK                                      NC1734.2 181
   001958      1  196100             PERFORM FAIL                                         NC1734.2 327
   001959      1  196200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001960         196300     ADD     1 TO REC-CT.                                         NC1734.2 223
   001961         196400 DIV-TEST-F3-28-3.                                                NC1734.2
   001962         196500     MOVE   "DIV-TEST-F3-28-3" TO PAR-NAME.                       NC1734.2 176
   001963         196600     IF      WRK-XN-00001 = "0"                                   NC1734.2 50
   001964      1  196700             PERFORM PASS                                         NC1734.2 326
   001965      1  196800             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001966         196900     ELSE                                                         NC1734.2
   001967      1  197000             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1734.2 50 186
   001968      1  197100             MOVE   "0"            TO CORRECT-X                   NC1734.2 200
   001969      1  197200             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1734.2
   001970      1  197300                  TO RE-MARK                                      NC1734.2 181
   001971      1  197400             PERFORM FAIL                                         NC1734.2 327
   001972      1  197500             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001973         197600     ADD     1 TO REC-CT.                                         NC1734.2 223
   001974         197700 DIV-TEST-F3-28-4.                                                NC1734.2
   001975         197800     MOVE   "DIV-TEST-F3-28-4" TO PAR-NAME.                       NC1734.2 176
   001976         197900     IF      WRK-DS-05V00 = 00000                                 NC1734.2 81
   001977      1  198000             PERFORM PASS                                         NC1734.2 326
   001978      1  198100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001979         198200     ELSE                                                         NC1734.2
   001980      1  198300             MOVE    WRK-DS-05V00  TO COMPUTED-N                  NC1734.2 81 188
   001981      1  198400             MOVE    00000         TO CORRECT-N                   NC1734.2 202
   001982      1  198500             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1734.2
   001983      1  198600                  TO RE-MARK                                      NC1734.2 181
   001984      1  198700             PERFORM FAIL                                         NC1734.2 327
   001985      1  198800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001986         198900     ADD     1 TO REC-CT.                                         NC1734.2 223
   001987         199000 DIV-TEST-F3-28-5.                                                NC1734.2
   001988         199100     MOVE   "DIV-TEST-F3-28-5" TO PAR-NAME.                       NC1734.2 176
   001989         199200     IF      WRK-CS-18V00 = 000000000000000099                    NC1734.2 68
   001990      1  199300             PERFORM PASS                                         NC1734.2 326
   001991      1  199400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   001992         199500     ELSE                                                         NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993      1  199600             MOVE    WRK-DS-18V00  TO COMPUTED-N                  NC1734.2 44 188
   001994      1  199700             MOVE    000000000000000099  TO CORRECT-N             NC1734.2 202
   001995      1  199800             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1734.2 181
   001996      1  199900             PERFORM FAIL                                         NC1734.2 327
   001997      1  200000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   001998         200100*                                                                 NC1734.2
   001999         200200*                                                                 NC1734.2
   002000         200300 DIV-INIT-F3-29.                                                  NC1734.2
   002001         200400*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   002002         200500*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1734.2
   002003         200600     MOVE   "DIV-TEST-F3-29" TO PAR-NAME.                         NC1734.2 176
   002004         200700     MOVE   "1V-41 6.4.3" TO ANSI-REFERENCE.                      NC1734.2 232
   002005         200800     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1734.2 78 57
   002006         200900     MOVE   "0" TO WRK-XN-00001.                                  NC1734.2 50
   002007         201000     MOVE    0  TO WRK-DS-05V00.                                  NC1734.2 81
   002008         201100     MOVE    0  TO WRK-DS-02V00.                                  NC1734.2 55
   002009         201200     MOVE    0  TO WRK-CS-18V00.                                  NC1734.2 68
   002010         201300     MOVE    1 TO REC-CT.                                         NC1734.2 223
   002011         201400 DIV-TEST-F3-29-0.                                                NC1734.2
   002012         201500     DIVIDE  WRK-DS-09V09 BY A18ONES-DS-09V09                     NC1734.2 57 78
   002013         201600      GIVING WRK-DS-09V09                                         NC1734.2 57
   002014         201700      NOT ON SIZE ERROR                                           NC1734.2
   002015      1  201800             MOVE "1" TO WRK-XN-00001                             NC1734.2 50
   002016      1  201900             MOVE  23 TO WRK-DS-05V00                             NC1734.2 81
   002017      1  202000             MOVE  -4 TO WRK-DS-02V00                             NC1734.2 55
   002018         202100     END-DIVIDE                                                   NC1734.2
   002019         202200     MOVE    99 TO WRK-CS-18V00.                                  NC1734.2 68
   002020         202300     GO TO   DIV-TEST-F3-29-1.                                    NC1734.2 2025
   002021         202400 DIV-DELETE-F3-29-1.                                              NC1734.2
   002022         202500     PERFORM DE-LETE.                                             NC1734.2 328
   002023         202600     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   002024         202700     GO TO   DIV-INIT-F3-30.                                      NC1734.2 2088
   002025         202800 DIV-TEST-F3-29-1.                                                NC1734.2
   002026         202900     MOVE   "DIV-TEST-F3-29-1" TO PAR-NAME.                       NC1734.2 176
   002027         203000     IF      WRK-DS-18V00-S = 000000001000000000                  NC1734.2 58
   002028      1  203100             PERFORM PASS                                         NC1734.2 326
   002029      1  203200             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002030         203300     ELSE                                                         NC1734.2
   002031      1  203400             MOVE    000000001000000000 TO CORRECT-18V0           NC1734.2 207
   002032      1  203500             MOVE    WRK-DS-18V00-S     TO COMPUTED-18V0          NC1734.2 58 194
   002033      1  203600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   002034      1  203700             PERFORM FAIL                                         NC1734.2 327
   002035      1  203800             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002036         203900     ADD     1 TO REC-CT.                                         NC1734.2 223
   002037         204000 DIV-TEST-F3-29-2.                                                NC1734.2
   002038         204100     MOVE   "DIV-TEST-F3-29-2" TO PAR-NAME.                       NC1734.2 176
   002039         204200     IF      WRK-DS-02V00 = -4                                    NC1734.2 55
   002040      1  204300             PERFORM PASS                                         NC1734.2 326
   002041      1  204400             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002042         204500     ELSE                                                         NC1734.2
   002043      1  204600             MOVE    WRK-DS-02V00  TO COMPUTED-N                  NC1734.2 55 188
   002044      1  204700             MOVE   -4             TO CORRECT-N                   NC1734.2 202
   002045      1  204800             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   002046      1  204900                  TO RE-MARK                                      NC1734.2 181
   002047      1  205000             PERFORM FAIL                                         NC1734.2 327
   002048      1  205100             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002049         205200     ADD     1 TO REC-CT.                                         NC1734.2 223
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205300 DIV-TEST-F3-29-3.                                                NC1734.2
   002051         205400     MOVE   "DIV-TEST-F3-29-3" TO PAR-NAME.                       NC1734.2 176
   002052         205500     IF      WRK-XN-00001 = "1"                                   NC1734.2 50
   002053      1  205600             PERFORM PASS                                         NC1734.2 326
   002054      1  205700             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002055         205800     ELSE                                                         NC1734.2
   002056      1  205900             MOVE    WRK-XN-00001  TO COMPUTED-X                  NC1734.2 50 186
   002057      1  206000             MOVE   "1"            TO CORRECT-X                   NC1734.2 200
   002058      1  206100             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   002059      1  206200                  TO RE-MARK                                      NC1734.2 181
   002060      1  206300             PERFORM FAIL                                         NC1734.2 327
   002061      1  206400             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002062         206500     ADD     1 TO REC-CT.                                         NC1734.2 223
   002063         206600 DIV-TEST-F3-29-4.                                                NC1734.2
   002064         206700     MOVE   "DIV-TEST-F3-29-4" TO PAR-NAME.                       NC1734.2 176
   002065         206800     IF      WRK-DS-05V00 = 23                                    NC1734.2 81
   002066      1  206900             PERFORM PASS                                         NC1734.2 326
   002067      1  207000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002068         207100     ELSE                                                         NC1734.2
   002069      1  207200             MOVE    WRK-DS-05V00  TO COMPUTED-N                  NC1734.2 81 188
   002070      1  207300             MOVE    23            TO CORRECT-N                   NC1734.2 202
   002071      1  207400             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1734.2
   002072      1  207500                  TO RE-MARK                                      NC1734.2 181
   002073      1  207600             PERFORM FAIL                                         NC1734.2 327
   002074      1  207700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002075         207800     ADD     1 TO REC-CT.                                         NC1734.2 223
   002076         207900 DIV-TEST-F3-29-5.                                                NC1734.2
   002077         208000     MOVE   "DIV-TEST-F3-29-5" TO PAR-NAME.                       NC1734.2 176
   002078         208100     IF      WRK-CS-18V00 = 000000000000000099                    NC1734.2 68
   002079      1  208200             PERFORM PASS                                         NC1734.2 326
   002080      1  208300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002081         208400     ELSE                                                         NC1734.2
   002082      1  208500             MOVE    WRK-DS-18V00  TO COMPUTED-N                  NC1734.2 44 188
   002083      1  208600             MOVE    000000000000000099  TO CORRECT-N             NC1734.2 202
   002084      1  208700             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1734.2 181
   002085      1  208800             PERFORM FAIL                                         NC1734.2 327
   002086      1  208900             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002087         209000*                                                                 NC1734.2
   002088         209100 DIV-INIT-F3-30.                                                  NC1734.2
   002089         209200*            ==-->    SIZE ERROR CONDITION <--==                  NC1734.2
   002090         209300*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1734.2
   002091         209400     MOVE   "DIV-TEST-F3-30" TO PAR-NAME.                         NC1734.2 176
   002092         209500     MOVE   "1V-41 6.4.3" TO ANSI-REFERENCE.                      NC1734.2 232
   002093         209600     MOVE    44.1  TO DIV2.                                       NC1734.2 154
   002094         209700     MOVE   -9.642 TO DIV4.                                       NC1734.2 158
   002095         209800     MOVE    0     TO DIV10.                                      NC1734.2 169
   002096         209900     MOVE    0     TO WRK-CS-18V00.                               NC1734.2 68
   002097         210000     MOVE   "A"    TO XRAY.                                       NC1734.2 85
   002098         210100     MOVE    1     TO REC-CT.                                     NC1734.2 223
   002099         210200 DIV-TEST-F3-30-0.                                                NC1734.2
   002100         210300     DIVIDE  DIV2 BY DIV4                                         NC1734.2 154 158
   002101         210400      GIVING DIV10                                                NC1734.2 169
   002102         210500          ON SIZE ERROR                                           NC1734.2
   002103      1  210600             MOVE "E" TO XRAY                                     NC1734.2 85
   002104         210700      NOT ON SIZE ERROR                                           NC1734.2
   002105      1  210800             MOVE "N" TO XRAY                                     NC1734.2 85
   002106         210900     END-DIVIDE                                                   NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211000     MOVE    99 TO WRK-CS-18V00.                                  NC1734.2 68
   002108         211100     GO TO DIV-TEST-F3-30-1.                                      NC1734.2 2113
   002109         211200 DIV-DELETE-F3-30.                                                NC1734.2
   002110         211300     PERFORM DE-LETE.                                             NC1734.2 328
   002111         211400     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   002112         211500     GO TO   DIV-INIT-F3-31.                                      NC1734.2 2151
   002113         211600 DIV-TEST-F3-30-1.                                                NC1734.2
   002114         211700     MOVE   "DIV-TEST-F3-30-1" TO PAR-NAME.                       NC1734.2 176
   002115         211800     IF      DIV10   = 0                                          NC1734.2 169
   002116      1  211900             PERFORM PASS                                         NC1734.2 326
   002117      1  212000             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002118         212100     ELSE                                                         NC1734.2
   002119      1  212200             MOVE    DIV10 TO COMPUTED-N                          NC1734.2 169 188
   002120      1  212300             MOVE    0     TO CORRECT-N                           NC1734.2 202
   002121      1  212400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1734.2
   002122      1  212500                  TO RE-MARK                                      NC1734.2 181
   002123      1  212600             PERFORM FAIL                                         NC1734.2 327
   002124      1  212700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002125         212800     ADD     1 TO REC-CT.                                         NC1734.2 223
   002126         212900 DIV-TEST-F3-30-2.                                                NC1734.2
   002127         213000     MOVE   "DIV-TEST-F3-30-2" TO PAR-NAME.                       NC1734.2 176
   002128         213100     IF      XRAY    = "E"                                        NC1734.2 85
   002129      1  213200             PERFORM PASS                                         NC1734.2 326
   002130      1  213300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002131         213400     ELSE                                                         NC1734.2
   002132      1  213500             MOVE    XRAY  TO COMPUTED-X                          NC1734.2 85 186
   002133      1  213600             MOVE   "E"    TO CORRECT-X                           NC1734.2 200
   002134      1  213700             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1734.2
   002135      1  213800                  TO RE-MARK                                      NC1734.2 181
   002136      1  213900             PERFORM FAIL                                         NC1734.2 327
   002137      1  214000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002138         214100     ADD     1 TO REC-CT.                                         NC1734.2 223
   002139         214200 DIV-TEST-F3-30-3.                                                NC1734.2
   002140         214300     MOVE   "DIV-TEST-F3-30-3" TO PAR-NAME.                       NC1734.2 176
   002141         214400     IF      WRK-CS-18V00 = 000000000000000099                    NC1734.2 68
   002142      1  214500             PERFORM PASS                                         NC1734.2 326
   002143      1  214600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002144         214700     ELSE                                                         NC1734.2
   002145      1  214800             MOVE    WRK-DS-18V00  TO COMPUTED-N                  NC1734.2 44 188
   002146      1  214900             MOVE    000000000000000099  TO CORRECT-N             NC1734.2 202
   002147      1  215000             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1734.2 181
   002148      1  215100             PERFORM FAIL                                         NC1734.2 327
   002149      1  215200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002150         215300*                                                                 NC1734.2
   002151         215400 DIV-INIT-F3-31.                                                  NC1734.2
   002152         215500*            ==--> NO SIZE ERROR CONDITION <--==                  NC1734.2
   002153         215600*            ==-->EXPLICIT SCOPE TERMINATOR<--==                  NC1734.2
   002154         215700     MOVE   "DIV-TEST-F3-31" TO PAR-NAME.                         NC1734.2 176
   002155         215800     MOVE   "1V-41 6.4.3" TO ANSI-REFERENCE.                      NC1734.2 232
   002156         215900     MOVE    0 TO WRK-CS-18V00.                                   NC1734.2 68
   002157         216000     MOVE   "A" TO XRAY.                                          NC1734.2 85
   002158         216100     MOVE    1  TO REC-CT.                                        NC1734.2 223
   002159         216200     MOVE    A18ONES-DS-09V09 TO WRK-DS-09V09.                    NC1734.2 78 57
   002160         216300 DIV-TEST-F3-31-0.                                                NC1734.2
   002161         216400     DIVIDE  WRK-DS-09V09 BY A18ONES-DS-09V09                     NC1734.2 57 78
   002162         216500      GIVING WRK-DS-09V09                                         NC1734.2 57
   002163         216600          ON SIZE ERROR                                           NC1734.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164      1  216700             MOVE "E" TO XRAY                                     NC1734.2 85
   002165         216800      NOT ON SIZE ERROR                                           NC1734.2
   002166      1  216900             MOVE "N" TO XRAY                                     NC1734.2 85
   002167         217000     END-DIVIDE                                                   NC1734.2
   002168         217100     MOVE    99 TO WRK-CS-18V00.                                  NC1734.2 68
   002169         217200     GO TO   DIV-TEST-F3-31-1.                                    NC1734.2 2174
   002170         217300 DIV-DELETE-F3-31.                                                NC1734.2
   002171         217400     PERFORM DE-LETE.                                             NC1734.2 328
   002172         217500     PERFORM PRINT-DETAIL.                                        NC1734.2 330
   002173         217600     GO TO   CCVS-EXIT.                                           NC1734.2 2213
   002174         217700 DIV-TEST-F3-31-1.                                                NC1734.2
   002175         217800     MOVE   "DIV-TEST-F3-31-1" TO PAR-NAME.                       NC1734.2 176
   002176         217900     IF      WRK-DS-18V00-S = 000000001000000000                  NC1734.2 58
   002177      1  218000             PERFORM PASS                                         NC1734.2 326
   002178      1  218100             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002179         218200     ELSE                                                         NC1734.2
   002180      1  218300             MOVE    000000001000000000 TO CORRECT-18V0           NC1734.2 207
   002181      1  218400             MOVE    WRK-DS-18V00-S     TO COMPUTED-18V0          NC1734.2 58 194
   002182      1  218500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK   NC1734.2 181
   002183      1  218600             PERFORM FAIL                                         NC1734.2 327
   002184      1  218700             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002185         218800     ADD     1 TO REC-CT.                                         NC1734.2 223
   002186         218900 DIV-TEST-F3-31-2.                                                NC1734.2
   002187         219000     MOVE   "DIV-TEST-F3-31-2" TO PAR-NAME.                       NC1734.2 176
   002188         219100     IF      XRAY    = "N"                                        NC1734.2 85
   002189      1  219200             PERFORM PASS                                         NC1734.2 326
   002190      1  219300             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002191         219400     ELSE                                                         NC1734.2
   002192      1  219500             MOVE    XRAY  TO COMPUTED-X                          NC1734.2 85 186
   002193      1  219600             MOVE   "N"    TO CORRECT-X                           NC1734.2 200
   002194      1  219700             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1734.2
   002195      1  219800                  TO RE-MARK                                      NC1734.2 181
   002196      1  219900             PERFORM FAIL                                         NC1734.2 327
   002197      1  220000             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002198         220100     ADD     1 TO REC-CT.                                         NC1734.2 223
   002199         220200 DIV-TEST-F3-31-3.                                                NC1734.2
   002200         220300     MOVE   "DIV-TEST-F3-31-3" TO PAR-NAME.                       NC1734.2 176
   002201         220400     IF      WRK-CS-18V00 = 000000000000000099                    NC1734.2 68
   002202      1  220500             PERFORM PASS                                         NC1734.2 326
   002203      1  220600             PERFORM PRINT-DETAIL                                 NC1734.2 330
   002204         220700     ELSE                                                         NC1734.2
   002205      1  220800             MOVE    WRK-DS-18V00  TO COMPUTED-N                  NC1734.2 44 188
   002206      1  220900             MOVE    000000000000000099  TO CORRECT-N             NC1734.2 202
   002207      1  221000             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1734.2 181
   002208      1  221100             PERFORM FAIL                                         NC1734.2 327
   002209      1  221200             PERFORM PRINT-DETAIL.                                NC1734.2 330
   002210         221300*                                                                 NC1734.2
   002211         221400*                                                                 NC1734.2
   002212         221500*                                                                 NC1734.2
   002213         221600 CCVS-EXIT SECTION.                                               NC1734.2
   002214         221700 CCVS-999999.                                                     NC1734.2
   002215         221800     GO TO CLOSE-FILES.                                           NC1734.2 319
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    42
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      232   ANSI-REFERENCE . . . . . . . .  409 416 425 M434 M456 M476 M513 M548 M569 M591 M628 M664 M703 M740 M761 M780
                                            M799 M822 M866 M910 M956 M1002 M1089 M1197 M1301 M1410 M1518 M1629 M1738 M1825
                                            M1913 M2004 M2092 M2155
       56   AZERO-DS-05V05 . . . . . . . .  596
       72   A01ONE-CS-00V01. . . . . . . .  743 1100 1312 1529
       62   A01ONE-DS-P0801. . . . . . . .  573
      131   A01ONES-CS-18V00 . . . . . . .  802
      133   A02THREES-CS-18V00 . . . . . .  764 802
       82   A02TWOS-DS-03V02 . . . . . . .  708
       80   A02TWOS-DU-02V00 . . . . . . .  552 708
       59   A05ONES-DS-00V05 . . . . . . .  670
       45   A06THREES-DS-03V03
       48   A08TWOS-DS-02V06
       51   A10ONES-DS-10V00
       60   A12ONES-DS-12V00
       53   A12THREES-DS-06V06
      139   A14TWOS-CU-18V00 . . . . . . .  783
      137   A16NINES-CU-18V00. . . . . . .  764
       78   A18ONES-DS-09V09 . . . . . . .  629 633 869 873 958 961 1826 1833 2005 2012 2159 2161
       65   A18ONES-DS-18V00
      135   A18SIXES-CU-18V00. . . . . . .  783
       70   A99-CS-02V00 . . . . . . . . .  743
       74   A99-DS-02V00 . . . . . . . . .  596
       84   A990-DS-0201P
      211   CCVS-C-1 . . . . . . . . . . .  348 394
      216   CCVS-C-2 . . . . . . . . . . .  349 395
      266   CCVS-E-1 . . . . . . . . . . .  354
      271   CCVS-E-2 . . . . . . . . . . .  363 370 377 382
      274   CCVS-E-2-2 . . . . . . . . . .  M362
      279   CCVS-E-3 . . . . . . . . . . .  383
      288   CCVS-E-4 . . . . . . . . . . .  362
      289   CCVS-E-4-1 . . . . . . . . . .  M360
      291   CCVS-E-4-2 . . . . . . . . . .  M361
      233   CCVS-H-1 . . . . . . . . . . .  343 390
      238   CCVS-H-2A. . . . . . . . . . .  344 391
      247   CCVS-H-2B. . . . . . . . . . .  345 392
      259   CCVS-H-3 . . . . . . . . . . .  346 393
      309   CCVS-PGM-ID. . . . . . . . . .  315 315
      193   CM-18V0
      187   COMPUTED-A . . . . . . . . . .  188 190 191 192 193 421 424 M470 M618 M651 M693 M727
      188   COMPUTED-N . . . . . . . . . .  M450 M507 M542 M563 M679 M716 M755 M857 M946 M1030 M1040 M1050 M1060 M1070 M1080
                                            M1121 M1132 M1143 M1154 M1165 M1176 M1229 M1239 M1249 M1259 M1269 M1279 M1333
                                            M1344 M1355 M1366 M1377 M1388 M1441 M1452 M1463 M1474 M1485 M1496 M1552 M1563
                                            M1574 M1585 M1596 M1607 M1662 M1673 M1684 M1695 M1706 M1717 M1766 M1802 M1814
                                            M1864 M1890 M1903 M1941 M1980 M1993 M2043 M2069 M2082 M2119 M2145 M2205
      186   COMPUTED-X . . . . . . . . . .  M338 406 M495 M530 M845 M899 M934 M991 M1185 M1288 M1397 M1505 M1616 M1726 M1778
                                            M1790 M1877 M1954 M1967 M2056 M2132 M2192
      190   COMPUTED-0V18
      192   COMPUTED-14V4
      194   COMPUTED-18V0. . . . . . . . .  M585 M603 M640 M771 M790 M809 M888 M979 M1853 M2032 M2181
      191   COMPUTED-4V14
      210   COR-ANSI-REFERENCE . . . . . .  M416 M418
      201   CORRECT-A. . . . . . . . . . .  202 203 204 205 206 422 424 M471 M617 M652 M692 M728
      202   CORRECT-N. . . . . . . . . . .  M451 M508 M543 M562 M678 M715 M754 M858 M947 M1031 M1041 M1051 M1061 M1071 M1081
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    43
0 Defined   Cross-reference of data names   References

0                                           M1122 M1133 M1144 M1155 M1166 M1177 M1230 M1240 M1250 M1260 M1270 M1280 M1334
                                            M1345 M1356 M1367 M1378 M1389 M1442 M1453 M1464 M1475 M1486 M1497 M1553 M1564
                                            M1575 M1586 M1597 M1608 M1663 M1674 M1685 M1696 M1707 M1718 M1767 M1803 M1815
                                            M1865 M1891 M1904 M1942 M1981 M1994 M2044 M2070 M2083 M2120 M2146 M2206
      200   CORRECT-X. . . . . . . . . . .  M339 408 M496 M531 M846 M900 M935 M992 M1186 M1289 M1398 M1506 M1617 M1727 M1779
                                            M1791 M1878 M1955 M1968 M2057 M2133 M2193
      203   CORRECT-0V18
      205   CORRECT-14V4
      207   CORRECT-18V0 . . . . . . . . .  M584 M602 M639 M770 M789 M808 M887 M978 M1852 M2031 M2180
      204   CORRECT-4V14
      206   CR-18V0
      224   DELETE-COUNTER . . . . . . . .  M328 357 373 375
      166   DIV-DATA-2
      160   DIV-02LEVEL-1
      151   DIVIDE-DATA
      152   DIV1 . . . . . . . . . . . . .  459
      169   DIV10. . . . . . . . . . . . .  M479 M482 503 507 M826 M831 853 857 M913 M918 942 946 M1741 M1748 1762 1766 M1916
                                            M1923 1937 1941 M2095 M2101 2115 2119
      154   DIV2 . . . . . . . . . . . . .  M435 438 M477 482 M824 830 M911 917 M1739 1747 M1914 1922 M2093 2100
      156   DIV3
      158   DIV4 . . . . . . . . . . . . .  M478 482 M825 830 M912 917 M1740 1747 M1915 1922 M2094 2100
      161   DIV5
      163   DIV6
      164   DIV7
      167   DIV8 . . . . . . . . . . . . .  M436 M438 440 450 M514 M517 538 542
      168   DIV9 . . . . . . . . . . . . .  M457 M459 460 470
      179   DOTVALUE . . . . . . . . . . .  M333
      230   DUMMY-HOLD . . . . . . . . . .  M387 397
       42   DUMMY-RECORD . . . . . . . . .  M343 M344 M345 M346 M348 M349 M350 M352 M354 M363 M370 M377 M382 M383 387 M388
                                            389 M390 M391 M392 M393 M394 M395 M396 M397 401 M402 M411 M426
      277   ENDER-DESC . . . . . . . . . .  M365 M376 M381
      225   ERROR-COUNTER. . . . . . . . .  M327 356 366 369
      229   ERROR-HOLD . . . . . . . . . .  M356 M357 M357 M358 361
      275   ERROR-TOTAL. . . . . . . . . .  M367 M369 M374 M375 M379 M380
      172   FEATURE. . . . . . . . . . . .  M433
      303   HYPHEN-LINE. . . . . . . . . .  350 352 396
      269   ID-AGAIN . . . . . . . . . . .  M315
      302   INF-ANSI-REFERENCE . . . . . .  M409 M412 M425 M427
      297   INFO-TEXT. . . . . . . . . . .  M410
      226   INSPECT-COUNTER. . . . . . . .  M325 356 378 380
      141   MULTIPLY-DATA
      142   MULT1
      144   MULT2
      145   MULT3
      146   MULT4
      148   MULT5
      149   MULT6
      174   P-OR-F . . . . . . . . . . . .  M325 M326 M327 M328 335 M338
      176   PAR-NAME . . . . . . . . . . .  M340 M453 M473 M490 M502 M525 M537 M566 M588 M610 M625 M646 M661 M685 M700 M722
                                            M737 M758 M777 M796 M815 M823 M840 M852 M865 M882 M894 M909 M929 M941 M973 M980
                                            M986 M999 M1088 M1187 M1196 M1290 M1300 M1399 M1409 M1507 M1517 M1618 M1628 M1737
                                            M1761 M1773 M1785 M1797 M1809 M1824 M1847 M1859 M1872 M1885 M1898 M1912 M1936
                                            M1949 M1962 M1975 M1988 M2003 M2026 M2038 M2051 M2064 M2077 M2091 M2114 M2127
                                            M2140 M2154 M2175 M2187 M2200
      178   PARDOT-X . . . . . . . . . . .  M332
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    44
0 Defined   Cross-reference of data names   References

0     227   PASS-COUNTER . . . . . . . . .  M326 358 360
       40   PRINT-FILE . . . . . . . . . .  36 314 320
       41   PRINT-REC. . . . . . . . . . .  M334 M415 M417
      181   RE-MARK. . . . . . . . . . . .  M329 M341 M497 M509 M532 M544 M604 M619 M653 M694 M729 M847 M859 M889 M901 M936
                                            M948 M981 M993 M1119 M1130 M1141 M1152 M1163 M1174 M1188 M1292 M1331 M1342 M1353
                                            M1364 M1375 M1386 M1401 M1450 M1461 M1472 M1483 M1494 M1509 M1550 M1561 M1572
                                            M1583 M1594 M1605 M1620 M1671 M1682 M1693 M1704 M1715 M1729 M1768 M1780 M1792
                                            M1804 M1816 M1854 M1867 M1880 M1893 M1905 M1944 M1957 M1970 M1983 M1995 M2033
                                            M2046 M2059 M2072 M2084 M2122 M2135 M2147 M2182 M2195 M2207
      223   REC-CT . . . . . . . . . . . .  331 333 340 M480 M500 M515 M535 M549 M594 M612 M631 M648 M668 M687 M706 M724
                                            M827 M850 M870 M892 M914 M939 M957 M984 M1008 M1033 M1043 M1053 M1063 M1073 M1097
                                            M1124 M1135 M1146 M1157 M1168 M1179 M1205 M1232 M1242 M1252 M1262 M1272 M1282
                                            M1309 M1336 M1347 M1358 M1369 M1380 M1391 M1417 M1444 M1455 M1466 M1477 M1488
                                            M1499 M1526 M1555 M1566 M1577 M1588 M1599 M1610 M1636 M1665 M1676 M1687 M1698
                                            M1709 M1720 M1745 M1771 M1783 M1795 M1807 M1831 M1857 M1870 M1883 M1896 M1920
                                            M1947 M1960 M1973 M1986 M2010 M2036 M2049 M2062 M2075 M2098 M2125 M2138 M2158
                                            M2185 M2198
      222   REC-SKL-SUB
      231   RECORD-COUNT . . . . . . . . .  M385 386 M398
      182   TEST-COMPUTED. . . . . . . . .  415
      197   TEST-CORRECT . . . . . . . . .  417
      250   TEST-ID. . . . . . . . . . . .  M315
      170   TEST-RESULTS . . . . . . . . .  M316 334
      228   TOTAL-ERROR
       87   WRK-AN-X-18-1
       83   WRK-CS-02V02
       68   WRK-CS-18V00 . . . . . . . . .  M762 M765 767 771 M800 M803 805 809 M1754 1810 1814 M1830 M1840 1899 M1929 1989
                                            M2009 M2019 2078 M2096 M2107 2141 M2156 M2168 2201
       76   WRK-DS-01V00 . . . . . . . . .  M550 M552 554 563 M705 M709 712 716
       55   WRK-DS-02V00 . . . . . . . . .  M1829 M1838 1860 1864 M2008 M2017 2039 2043
       67   WRK-DS-0201P . . . . . . . . .  M665 M671 674
       77   WRK-DS-03V10 . . . . . . . . .  M570 573
       81   WRK-DS-05V00 . . . . . . . . .  M674 675 679 M741 M744 746 755 M1743 M1752 1798 1802 M1828 M1837 1886 1890 M1918
                                            M1927 1976 1980 M2007 M2016 2065 2069
       46   WRK-DS-06V06 . . . . . . . . .  47
       63   WRK-DS-09V08 . . . . . . . . .  64
       57   WRK-DS-09V09 . . . . . . . . .  58 M629 633 M634 M666 670 M869 873 M874 M958 961 M962 974 M1826 1833 M1834 M2005
                                            2012 M2013 M2159 2161 M2162
      118   WRK-DS-1V0-1
      119   WRK-DS-1V0-2
      120   WRK-DS-1V2-1
       49   WRK-DS-10V00
       75   WRK-DS-12V00
       47   WRK-DS-12V00-S
      125   WRK-DS-16V2-1
       64   WRK-DS-17V00-S
       44   WRK-DS-18V00 . . . . . . . . .  M571 M574 576 585 M592 M597 599 603 1903 1993 2082 2145 2205
       58   WRK-DS-18V00-S . . . . . . . .  635 640 883 888 979 1848 1853 2027 2032 2176 2181
      121   WRK-DS-2V0-1
      122   WRK-DS-2V1-1
      123   WRK-DS-2V2-1
      124   WRK-DS-2V2-2
       88   WRK-DU-X-18V0-1
       89   WRK-DU-0V1-1
       91   WRK-DU-0V12-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    45
0 Defined   Cross-reference of data names   References

0      90   WRK-DU-0V2-1
       92   WRK-DU-1V0-1
       93   WRK-DU-1V1-1
       94   WRK-DU-1V1-2 . . . . . . . . .  M1010 1012 M1207 1209 M1419 1421 M1638 1640
       98   WRK-DU-1V17-1
       95   WRK-DU-1V3-1
       96   WRK-DU-1V3-2
       97   WRK-DU-1V5-1
      116   WRK-DU-16V2-1
       69   WRK-DU-18V00 . . . . . . . . .  M781 M784 786 790
       99   WRK-DU-2P6-1
      100   WRK-DU-2V0-1 . . . . . . . . .  M1009 1012 M1014 1035 1040 M1092 M1098 1100 M1102 1126 1132 M1200 M1206 1209
                                            M1211 1234 1239 M1304 M1310 1312 M1314 1338 1344 M1418 1421 M1423 1446 1452 M1521
                                            M1527 1529 M1531 1557 1563 M1637 1640 M1642 1667 1673
      101   WRK-DU-2V0-2 . . . . . . . . .  M1005 M1016 1055 1060 M1094 M1104 1148 1154 M1202 M1213 1254 1259 M1306 M1316
                                            1360 1366 M1414 M1425 1468 1474 M1523 M1533 1579 1585 M1633 M1644 1689 1695
      102   WRK-DU-2V0-3 . . . . . . . . .  M1007 M1018 1075 1080 M1096 M1106 1170 1176 M1204 M1215 1274 1279 M1308 M1318
                                            1382 1388 M1416 M1427 1490 1496 M1525 M1535 1601 1607 M1635 M1646 1711 1717
      103   WRK-DU-2V1-1 . . . . . . . . .  M1003 M1013 1025 1030 M1091 M1101 1115 1121 M1199 M1210 1224 1229 M1303 M1313
                                            1327 1333 M1412 M1422 1436 1441 M1520 M1530 1546 1552 M1631 M1641 1657 1662
      104   WRK-DU-2V1-2 . . . . . . . . .  M1004 M1015 1045 1050 M1093 M1103 1137 1143 M1201 M1212 1244 1249 M1305 M1315
                                            1349 1355 M1413 M1424 1457 1463 M1522 M1532 1568 1574 M1632 M1643 1678 1684
      105   WRK-DU-2V1-3 . . . . . . . . .  M1006 M1017 1065 1070 M1095 M1105 1159 1165 M1203 M1214 1264 1269 M1307 M1317
                                            1371 1377 M1415 M1426 1479 1485 M1524 M1534 1590 1596 M1634 M1645 1700 1706
      106   WRK-DU-2V2-1
      107   WRK-DU-2V2-2
      108   WRK-DU-2V2-3
      109   WRK-DU-2V2-4
      110   WRK-DU-2V2-5
      111   WRK-DU-2V5-1
      112   WRK-DU-4P1-1
      113   WRK-DU-5V1-1
      114   WRK-DU-6V0-1
      115   WRK-DU-6V0-2
      117   WRK-NE-X-1
      126   WRK-NE-X-2
      127   WRK-NE-1
      128   WRK-NE-2
      129   WRK-NE-3
      130   WRK-NE-4
       50   WRK-XN-00001 . . . . . . . . .  M593 M597 614 618 M630 M634 650 651 M667 M672 689 693 M704 M710 726 M871 M875
                                            895 899 M959 M964 M966 987 991 M1090 M1108 1181 1185 M1198 M1217 1284 1288 M1302
                                            M1320 1393 1397 M1411 M1429 1501 1505 M1519 M1537 M1539 1612 1616 M1630 M1648
                                            M1650 1722 1726 M1742 M1751 1786 1790 M1827 M1836 1873 1877 M1917 M1926 1963
                                            1967 M2006 M2015 2052 2056
       86   WRK-XN-18-1. . . . . . . . . .  87 88
       85   XRAY . . . . . . . . . . . . .  M483 491 495 M518 526 530 M828 M833 841 845 M915 M920 M922 930 934 M1744 M1750
                                            1774 1778 M1919 M1925 1950 1954 M2097 M2103 M2105 2128 2132 M2157 M2164 M2166
                                            2188 2192
      299   XXCOMPUTED . . . . . . . . . .  M424
      301   XXCORRECT. . . . . . . . . . .  M424
      294   XXINFO . . . . . . . . . . . .  411 426
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    46
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

      420   BAIL-OUT . . . . . . . . . . .  P337
      428   BAIL-OUT-EX. . . . . . . . . .  E337 G422
      423   BAIL-OUT-WRITE . . . . . . . .  G421
      403   BLANK-LINE-PRINT
     2213   CCVS-EXIT. . . . . . . . . . .  G2173
     2214   CCVS-999999
      312   CCVS1
      429   CCVS1-EXIT . . . . . . . . . .  G318
      319   CLOSE-FILES. . . . . . . . . .  G2215
      347   COLUMN-NAMES-ROUTINE . . . . .  E317
      328   DE-LETE. . . . . . . . . . . .  P446 P466 P486 P521 P559 P581 P608 P623 P644 P659 P683 P698 P720 P735 P751 P775
                                            P794 P813 P836 P878 P925 P969 P1021 P1111 P1220 P1323 P1432 P1542 P1653 P1757
                                            P1843 P1932 P2022 P2110 P2171
      445   DIV-DELETE-F3-1
      719   DIV-DELETE-F3-10-1
      734   DIV-DELETE-F3-10-2
      750   DIV-DELETE-F3-11
      774   DIV-DELETE-F3-12
      793   DIV-DELETE-F3-13
      812   DIV-DELETE-F3-14
      835   DIV-DELETE-F3-15-1
      877   DIV-DELETE-F3-16-1
      924   DIV-DELETE-F3-17-1
      968   DIV-DELETE-F3-18-1
     1020   DIV-DELETE-F3-19
      465   DIV-DELETE-F3-2
     1110   DIV-DELETE-F3-20
     1219   DIV-DELETE-F3-21
     1322   DIV-DELETE-F3-22
     1431   DIV-DELETE-F3-23
     1541   DIV-DELETE-F3-24
     1652   DIV-DELETE-F3-25
     1756   DIV-DELETE-F3-26
     1842   DIV-DELETE-F3-27-1
     1931   DIV-DELETE-F3-28-1
     2021   DIV-DELETE-F3-29-1
      485   DIV-DELETE-F3-3-1
     2109   DIV-DELETE-F3-30
     2170   DIV-DELETE-F3-31
      520   DIV-DELETE-F3-4
      558   DIV-DELETE-F3-5
      580   DIV-DELETE-F3-6
      607   DIV-DELETE-F3-7-1
      622   DIV-DELETE-F3-7-2
      643   DIV-DELETE-F3-8-1
      658   DIV-DELETE-F3-8-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    47
0 Defined   Cross-reference of procedures   References

0     682   DIV-DELETE-F3-9-1
      697   DIV-DELETE-F3-9-2
      448   DIV-FAIL-F3-1. . . . . . . . .  G443
      753   DIV-FAIL-F3-11 . . . . . . . .  G749
      468   DIV-FAIL-F3-2. . . . . . . . .  G463
      561   DIV-FAIL-F3-5. . . . . . . . .  G557
      583   DIV-FAIL-F3-6. . . . . . . . .  G579
      638   DIV-FAIL-F3-8-1
      432   DIV-INIT-F3-1
      702   DIV-INIT-F3-10
      739   DIV-INIT-F3-11
      760   DIV-INIT-F3-12
      779   DIV-INIT-F3-13
      798   DIV-INIT-F3-14
      819   DIV-INIT-F3-15
      864   DIV-INIT-F3-16 . . . . . . . .  G838
      906   DIV-INIT-F3-17 . . . . . . . .  G880
      953   DIV-INIT-F3-18 . . . . . . . .  G927
      998   DIV-INIT-F3-19 . . . . . . . .  G971
      455   DIV-INIT-F3-2
     1085   DIV-INIT-F3-20 . . . . . . . .  G1023
     1193   DIV-INIT-F3-21 . . . . . . . .  G1113
     1297   DIV-INIT-F3-22 . . . . . . . .  G1222
     1406   DIV-INIT-F3-23 . . . . . . . .  G1325
     1514   DIV-INIT-F3-24 . . . . . . . .  G1434
     1625   DIV-INIT-F3-25 . . . . . . . .  G1544
     1734   DIV-INIT-F3-26 . . . . . . . .  G1655
     1821   DIV-INIT-F3-27 . . . . . . . .  G1759
     1909   DIV-INIT-F3-28 . . . . . . . .  G1845
     2000   DIV-INIT-F3-29 . . . . . . . .  G1934
      475   DIV-INIT-F3-3
     2088   DIV-INIT-F3-30 . . . . . . . .  G2024
     2151   DIV-INIT-F3-31 . . . . . . . .  G2112
      512   DIV-INIT-F3-4. . . . . . . . .  G488
      547   DIV-INIT-F3-5. . . . . . . . .  G523
      568   DIV-INIT-F3-6
      590   DIV-INIT-F3-7
      627   DIV-INIT-F3-8
      663   DIV-INIT-F3-9
      439   DIV-TEST-F3-1
      437   DIV-TEST-F3-1-0
      707   DIV-TEST-F3-10-0
      711   DIV-TEST-F3-10-1
      725   DIV-TEST-F3-10-2
      742   DIV-TEST-F3-11-0
      745   DIV-TEST-F3-11-1
      763   DIV-TEST-F3-12-0
      766   DIV-TEST-F3-12-1
      782   DIV-TEST-F3-13-0
      785   DIV-TEST-F3-13-1
      801   DIV-TEST-F3-14-0
      804   DIV-TEST-F3-14-1
      829   DIV-TEST-F3-15-0
      839   DIV-TEST-F3-15-1 . . . . . . .  G834
      851   DIV-TEST-F3-15-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    48
0 Defined   Cross-reference of procedures   References

0     872   DIV-TEST-F3-16-0
      881   DIV-TEST-F3-16-1 . . . . . . .  G876
      893   DIV-TEST-F3-16-2
      916   DIV-TEST-F3-17-0
      928   DIV-TEST-F3-17-1 . . . . . . .  G923
      940   DIV-TEST-F3-17-2
      960   DIV-TEST-F3-18-0
      972   DIV-TEST-F3-18-1 . . . . . . .  G967
      985   DIV-TEST-F3-18-2
     1011   DIV-TEST-F3-19-0
     1024   DIV-TEST-F3-19-1 . . . . . . .  G1019
     1034   DIV-TEST-F3-19-2
     1044   DIV-TEST-F3-19-3
     1054   DIV-TEST-F3-19-4
     1064   DIV-TEST-F3-19-5
     1074   DIV-TEST-F3-19-6
      458   DIV-TEST-F3-2
     1099   DIV-TEST-F3-20-0
     1114   DIV-TEST-F3-20-1 . . . . . . .  G1109
     1125   DIV-TEST-F3-20-2
     1136   DIV-TEST-F3-20-3
     1147   DIV-TEST-F3-20-4
     1158   DIV-TEST-F3-20-5
     1169   DIV-TEST-F3-20-6
     1180   DIV-TEST-F3-20-7
     1208   DIV-TEST-F3-21-0
     1223   DIV-TEST-F3-21-1 . . . . . . .  G1218
     1233   DIV-TEST-F3-21-2
     1243   DIV-TEST-F3-21-3
     1253   DIV-TEST-F3-21-4
     1263   DIV-TEST-F3-21-5
     1273   DIV-TEST-F3-21-6
     1283   DIV-TEST-F3-21-7
     1311   DIV-TEST-F3-22-0
     1326   DIV-TEST-F3-22-1 . . . . . . .  G1321
     1337   DIV-TEST-F3-22-2
     1348   DIV-TEST-F3-22-3
     1359   DIV-TEST-F3-22-4
     1370   DIV-TEST-F3-22-5
     1381   DIV-TEST-F3-22-6
     1392   DIV-TEST-F3-22-7
     1420   DIV-TEST-F3-23-0
     1435   DIV-TEST-F3-23-1 . . . . . . .  G1430
     1445   DIV-TEST-F3-23-2
     1456   DIV-TEST-F3-23-3
     1467   DIV-TEST-F3-23-4
     1478   DIV-TEST-F3-23-5
     1489   DIV-TEST-F3-23-6
     1500   DIV-TEST-F3-23-7
     1528   DIV-TEST-F3-24-0
     1545   DIV-TEST-F3-24-1 . . . . . . .  G1540
     1556   DIV-TEST-F3-24-2
     1567   DIV-TEST-F3-24-3
     1578   DIV-TEST-F3-24-4
     1589   DIV-TEST-F3-24-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    49
0 Defined   Cross-reference of procedures   References

0    1600   DIV-TEST-F3-24-6
     1611   DIV-TEST-F3-24-7
     1639   DIV-TEST-F3-25-0
     1656   DIV-TEST-F3-25-1 . . . . . . .  G1651
     1666   DIV-TEST-F3-25-2
     1677   DIV-TEST-F3-25-3
     1688   DIV-TEST-F3-25-4
     1699   DIV-TEST-F3-25-5
     1710   DIV-TEST-F3-25-6
     1721   DIV-TEST-F3-25-7
     1746   DIV-TEST-F3-26-0
     1760   DIV-TEST-F3-26-1 . . . . . . .  G1755
     1772   DIV-TEST-F3-26-2
     1784   DIV-TEST-F3-26-3
     1796   DIV-TEST-F3-26-4
     1808   DIV-TEST-F3-26-5
     1832   DIV-TEST-F3-27-0
     1846   DIV-TEST-F3-27-1 . . . . . . .  G1841
     1858   DIV-TEST-F3-27-2
     1871   DIV-TEST-F3-27-3
     1884   DIV-TEST-F3-27-4
     1897   DIV-TEST-F3-27-5
     1921   DIV-TEST-F3-28-0
     1935   DIV-TEST-F3-28-1 . . . . . . .  G1930
     1948   DIV-TEST-F3-28-2
     1961   DIV-TEST-F3-28-3
     1974   DIV-TEST-F3-28-4
     1987   DIV-TEST-F3-28-5
     2011   DIV-TEST-F3-29-0
     2025   DIV-TEST-F3-29-1 . . . . . . .  G2020
     2037   DIV-TEST-F3-29-2
     2050   DIV-TEST-F3-29-3
     2063   DIV-TEST-F3-29-4
     2076   DIV-TEST-F3-29-5
      481   DIV-TEST-F3-3-0
      489   DIV-TEST-F3-3-1. . . . . . . .  G484
      501   DIV-TEST-F3-3-2
     2099   DIV-TEST-F3-30-0
     2113   DIV-TEST-F3-30-1 . . . . . . .  G2108
     2126   DIV-TEST-F3-30-2
     2139   DIV-TEST-F3-30-3
     2160   DIV-TEST-F3-31-0
     2174   DIV-TEST-F3-31-1 . . . . . . .  G2169
     2186   DIV-TEST-F3-31-2
     2199   DIV-TEST-F3-31-3
      516   DIV-TEST-F3-4-0
      524   DIV-TEST-F3-4-1. . . . . . . .  G519
      536   DIV-TEST-F3-4-2
      551   DIV-TEST-F3-5-0
      553   DIV-TEST-F3-5-1
      572   DIV-TEST-F3-6-0
      575   DIV-TEST-F3-6-1
      595   DIV-TEST-F3-7-0
      598   DIV-TEST-F3-7-1
      613   DIV-TEST-F3-7-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    50
0 Defined   Cross-reference of procedures   References

0     632   DIV-TEST-F3-8-1
      649   DIV-TEST-F3-8-2
      669   DIV-TEST-F3-9-1-0
      673   DIV-TEST-F3-9-1-1
      688   DIV-TEST-F3-9-2-1
      452   DIV-WRITE-F3-1 . . . . . . . .  G444 G447
      721   DIV-WRITE-F3-10-1. . . . . . .  G714 G718
      736   DIV-WRITE-F3-10-2. . . . . . .  G731 G733
      757   DIV-WRITE-F3-11. . . . . . . .  G748 G752
      776   DIV-WRITE-F3-12. . . . . . . .  G769 G773
      795   DIV-WRITE-F3-13. . . . . . . .  G788 G792
      814   DIV-WRITE-F3-14. . . . . . . .  G807 G811
      472   DIV-WRITE-F3-2 . . . . . . . .  G464 G467
      565   DIV-WRITE-F3-5 . . . . . . . .  G556 G560
      587   DIV-WRITE-F3-6 . . . . . . . .  G578 G582
      609   DIV-WRITE-F3-7-1 . . . . . . .  G601 G606
      624   DIV-WRITE-F3-7-2 . . . . . . .  G616 G621
      645   DIV-WRITE-F3-8-1 . . . . . . .  G637 G642
      660   DIV-WRITE-F3-8-2 . . . . . . .  G655 G657
      684   DIV-WRITE-F3-9-1 . . . . . . .  G677 G681
      699   DIV-WRITE-F3-9-2 . . . . . . .  G691 G696
      351   END-ROUTINE. . . . . . . . . .  P320
      355   END-ROUTINE-1
      364   END-ROUTINE-12
      372   END-ROUTINE-13 . . . . . . . .  E320
      353   END-RTN-EXIT
      327   FAIL . . . . . . . . . . . . .  P449 P469 P498 P510 P533 P545 P564 P586 P605 P620 P641 P654 P680 P695 P717 P730
                                            P756 P772 P791 P810 P848 P860 P890 P902 P937 P949 P982 P994 P1029 P1039 P1049
                                            P1059 P1069 P1079 P1120 P1131 P1142 P1153 P1164 P1175 P1189 P1228 P1238 P1248
                                            P1258 P1268 P1278 P1293 P1332 P1343 P1354 P1365 P1376 P1387 P1402 P1440 P1451
                                            P1462 P1473 P1484 P1495 P1510 P1551 P1562 P1573 P1584 P1595 P1606 P1621 P1661
                                            P1672 P1683 P1694 P1705 P1716 P1730 P1769 P1781 P1793 P1805 P1817 P1855 P1868
                                            P1881 P1894 P1906 P1945 P1958 P1971 P1984 P1996 P2034 P2047 P2060 P2073 P2085
                                            P2123 P2136 P2148 P2183 P2196 P2208
      405   FAIL-ROUTINE . . . . . . . . .  P336
      419   FAIL-ROUTINE-EX. . . . . . . .  E336 G413
      414   FAIL-ROUTINE-WRITE . . . . . .  G407 G408
      342   HEAD-ROUTINE . . . . . . . . .  P317
      325   INSPT
      313   OPEN-FILES
      326   PASS . . . . . . . . . . . . .  P441 P461 P492 P504 P527 P539 P555 P577 P600 P615 P636 P656 P676 P690 P713 P732
                                            P747 P768 P787 P806 P842 P854 P884 P896 P931 P943 P975 P988 P1026 P1036 P1046
                                            P1056 P1066 P1076 P1116 P1127 P1138 P1149 P1160 P1171 P1182 P1225 P1235 P1245
                                            P1255 P1265 P1275 P1285 P1328 P1339 P1350 P1361 P1372 P1383 P1394 P1437 P1447
                                            P1458 P1469 P1480 P1491 P1502 P1547 P1558 P1569 P1580 P1591 P1602 P1613 P1658
                                            P1668 P1679 P1690 P1701 P1712 P1723 P1763 P1775 P1787 P1799 P1811 P1849 P1861
                                            P1874 P1887 P1900 P1938 P1951 P1964 P1977 P1990 P2028 P2040 P2053 P2066 P2079
                                            P2116 P2129 P2142 P2177 P2189 P2202
      330   PRINT-DETAIL . . . . . . . . .  P454 P474 P487 P493 P499 P505 P511 P522 P528 P534 P540 P546 P567 P589 P611 P626
                                            P647 P662 P686 P701 P723 P738 P759 P778 P797 P816 P837 P843 P849 P855 P861 P879
                                            P885 P891 P897 P903 P926 P932 P938 P944 P950 P970 P976 P983 P989 P995 P1022 P1027
                                            P1032 P1037 P1042 P1047 P1052 P1057 P1062 P1067 P1072 P1077 P1082 P1112 P1117
                                            P1123 P1128 P1134 P1139 P1145 P1150 P1156 P1161 P1167 P1172 P1178 P1183 P1190
                                            P1221 P1226 P1231 P1236 P1241 P1246 P1251 P1256 P1261 P1266 P1271 P1276 P1281
                                            P1286 P1294 P1324 P1329 P1335 P1340 P1346 P1351 P1357 P1362 P1368 P1373 P1379
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    51
0 Defined   Cross-reference of procedures   References

0                                           P1384 P1390 P1395 P1403 P1433 P1438 P1443 P1448 P1454 P1459 P1465 P1470 P1476
                                            P1481 P1487 P1492 P1498 P1503 P1511 P1543 P1548 P1554 P1559 P1565 P1570 P1576
                                            P1581 P1587 P1592 P1598 P1603 P1609 P1614 P1622 P1654 P1659 P1664 P1669 P1675
                                            P1680 P1686 P1691 P1697 P1702 P1708 P1713 P1719 P1724 P1731 P1758 P1764 P1770
                                            P1776 P1782 P1788 P1794 P1800 P1806 P1812 P1818 P1844 P1850 P1856 P1862 P1869
                                            P1875 P1882 P1888 P1895 P1901 P1907 P1933 P1939 P1946 P1952 P1959 P1965 P1972
                                            P1978 P1985 P1991 P1997 P2023 P2029 P2035 P2041 P2048 P2054 P2061 P2067 P2074
                                            P2080 P2086 P2111 P2117 P2124 P2130 P2137 P2143 P2149 P2172 P2178 P2184 P2190
                                            P2197 P2203 P2209
      431   SECT-NC173A-001
      323   TERMINATE-CALL
      321   TERMINATE-CCVS
      384   WRITE-LINE . . . . . . . . . .  P334 P335 P343 P344 P345 P346 P348 P349 P350 P352 P354 P363 P371 P377 P382 P383
                                            P411 P415 P417 P426
      400   WRT-LN . . . . . . . . . . . .  P390 P391 P392 P393 P394 P395 P396 P399 P404
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    52
0 Defined   Cross-reference of programs     References

        3   NC173A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC173A    Date 06/04/2022  Time 12:00:44   Page    53
0LineID  Message code  Message text

     40  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC173A:
 *    Source records = 2215
 *    Data Division statements = 168
 *    Procedure Division statements = 1438
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1451
0End of compilation 1,  program NC173A,  highest severity 0.
0Return code 0
