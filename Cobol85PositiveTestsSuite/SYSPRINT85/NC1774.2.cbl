1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:47   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:47   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1774.2
   000002         000200 PROGRAM-ID.                                                      NC1774.2
   000003         000300     NC177A.                                                      NC1774.2
   000004         000500*                                                              *  NC1774.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1774.2
   000006         000700*                                                              *  NC1774.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1774.2
   000008         000900*                                                              *  NC1774.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1774.2
   000010         001100*                                                              *  NC1774.2
   000011         001300*                                                              *  NC1774.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1774.2
   000013         001500*                                                              *  NC1774.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1774.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1774.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1774.2
   000017         001900*                                                              *  NC1774.2
   000018         002100*                                                                 NC1774.2
   000019         002200*    PROGRAM NC177A TESTS FORMAT 2 OF THE ADD STATEMENT.          NC1774.2
   000020         002300*    VARIOUS COMBINATINS OF DATA-ITEMS AND ALL                    NC1774.2
   000021         002400*    OPTIONAL PHRASES ARE TESTED.                                 NC1774.2
   000022         002500*                                                                 NC1774.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1774.2
   000024         002700 CONFIGURATION SECTION.                                           NC1774.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1774.2
   000026         002900     XXXXX082.                                                    NC1774.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1774.2
   000028         003100     XXXXX083.                                                    NC1774.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1774.2
   000030         003300 FILE-CONTROL.                                                    NC1774.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1774.2 35
   000032         003500     XXXXX055.                                                    NC1774.2
   000033         003600 DATA DIVISION.                                                   NC1774.2
   000034         003700 FILE SECTION.                                                    NC1774.2
   000035         003800 FD  PRINT-FILE.                                                  NC1774.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1774.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1774.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1774.2
   000039         004200 77  SIZE-ERR                     PICTURE X  VALUE SPACE.         NC1774.2 IMP
   000040         004300 77  SIZE-ERR2                    PICTURE X  VALUE SPACE.         NC1774.2 IMP
   000041         004400 77  SIZE-ERR3                    PICTURE X  VALUE SPACE.         NC1774.2 IMP
   000042         004500 77  SIZE-ERR4                    PICTURE X  VALUE SPACE.         NC1774.2 IMP
   000043         004600 77  A17TWOS-DS-17V00             PICTURE S9(17)                  NC1774.2
   000044         004700                                  VALUE 22222222222222222.        NC1774.2
   000045         004800 77  A18ONES-DS-18V00             PICTURE S9(18)                  NC1774.2
   000046         004900                                  VALUE 111111111111111111.       NC1774.2
   000047         005000 77  WRK-DS-10V00                 PICTURE S9(10).                 NC1774.2
   000048         005100 77  A10ONES-DS-10V00             PICTURE S9(10)                  NC1774.2
   000049         005200                                  VALUE 1111111111.               NC1774.2
   000050         005300 77  A05ONES-DS-05V00             PICTURE S9(5)                   NC1774.2
   000051         005400                                  VALUE 11111.                    NC1774.2
   000052         005500 77  A02ONES-DS-02V00             PICTURE S99                     NC1774.2
   000053         005600                                  VALUE 11.                       NC1774.2
   000054         005700 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  WRK-DS-18V00 REDEFINES WRK-DS-09V09                          NC1774.2 54
   000056         005900                                  PICTURE S9(18).                 NC1774.2
   000057         006000 77  A06THREES-DS-03V03           PICTURE S999V999                NC1774.2
   000058         006100                                  VALUE 333.333.                  NC1774.2
   000059         006200 77  A12THREES-DS-06V06           PICTURE S9(6)V9(6)              NC1774.2
   000060         006300                                  VALUE 333333.333333.            NC1774.2
   000061         006400 77  WRK-DS-06V06                 PICTURE S9(6)V9(6).             NC1774.2
   000062         006500 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06                        NC1774.2 61
   000063         006600                                  PICTURE S9(12).                 NC1774.2
   000064         006700 77  A05ONES-DS-00V05             PICTURE SV9(5)                  NC1774.2
   000065         006800                                  VALUE .11111.                   NC1774.2
   000066         006900 77  WRK-DS-05V00                 PICTURE S9(5).                  NC1774.2
   000067         007000 77  WRK-DS-02V00                 PICTURE S99.                    NC1774.2
   000068         007100 77  A12ONES-DS-12V00             PICTURE S9(12)                  NC1774.2
   000069         007200                                  VALUE 111111111111.             NC1774.2
   000070         007300 77  WRK-DS-03V10                 PICTURE S999V9(10).             NC1774.2
   000071         007400 77  WRK-DS-13V00-S REDEFINES WRK-DS-03V10                        NC1774.2 70
   000072         007500                                  PICTURE S9(13).                 NC1774.2
   000073         007600 77  A99-DS-02V00                 PICTURE S99                     NC1774.2
   000074         007700                                  VALUE 99.                       NC1774.2
   000075         007800 77  A03ONES-DS-02V01             PICTURE S99V9                   NC1774.2
   000076         007900                                  VALUE 11.1.                     NC1774.2
   000077         008000 77  A06ONES-DS-03V03             PICTURE S999V999                NC1774.2
   000078         008100                                  VALUE 111.111.                  NC1774.2
   000079         008200 77  A08TWOS-DS-02V06             PICTURE S99V9(6)                NC1774.2
   000080         008300                                  VALUE 22.222222.                NC1774.2
   000081         008400 77  A01ONE-DS-P0801              PICTURE SP(8)9                  NC1774.2
   000082         008500                                  VALUE .000000001.               NC1774.2
   000083         008600 77  WRK-CS-18V00                 PICTURE S9(18) COMPUTATIONAL.   NC1774.2
   000084         008700 77  A18ONES-CS-18V00             PICTURE S9(18) COMPUTATIONAL    NC1774.2
   000085         008800                                  VALUE 111111111111111111.       NC1774.2
   000086         008900 77  WRK-CS-02V02                 PICTURE S99V99 COMPUTATIONAL.   NC1774.2
   000087         009000 77  A99-CS-02V00                 PICTURE S99 COMPUTATIONAL       NC1774.2
   000088         009100                                  VALUE 99.                       NC1774.2
   000089         009200 77  WRK-DS-0201P                 PICTURE S99P.                   NC1774.2
   000090         009300 77  WRK-DS-06V00                 PICTURE S9(6).                  NC1774.2
   000091         009400 77  AZERO-DS-05V05               PICTURE S9(5)V9(5)              NC1774.2
   000092         009500                                  VALUE ZERO.                     NC1774.2 IMP
   000093         009600 77  NDATA-DS-09V09               PICTURE S9(9)V9(9)              NC1774.2
   000094         009700                                  VALUE +012345678.876543210.     NC1774.2
   000095         009800 77  XDATA-XN-00018               PICTURE X(18)                   NC1774.2
   000096         009900                                  VALUE "00ABCDEFGHI  4321 ".     NC1774.2
   000097         010000 77  WRK-XN-00018                 PICTURE X(18).                  NC1774.2
   000098         010100 77  WRK-XN-00001                 PICTURE X.                      NC1774.2
   000099         010200 77  ADD-12    PICTURE PP9        VALUE .001.                     NC1774.2
   000100         010300 77  ADD-13    PICTURE 9PP        VALUE 100.                      NC1774.2
   000101         010400 77  ADD-14    PICTURE 999V999.                                   NC1774.2
   000102         010500 77  WRK-CU-18V00      PICTURE 9(18) VALUE ZERO COMPUTATIONAL.    NC1774.2 IMP
   000103         010600 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1774.2 IMP
   000104         010700 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1774.2
   000105         010800 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1774.2
   000106         010900 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1774.2
   000107         011000 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1774.2
   000108         011100 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1774.2
   000109         011200 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1774.2
   000110         011300 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1774.2
   000111         011400 01  WRK-DU-2V0-1 PIC 99.                                         NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 01  WRK-DU-2V0-2 PIC 99.                                         NC1774.2
   000113         011600 01  WRK-DU-2V0-3 PIC 99.                                         NC1774.2
   000114         011700 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1774.2
   000115         011800 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1774.2
   000116         011900 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1774.2
   000117         012000 77  A18EIGHTS-CS-18V00 PICTURE S9(18) VALUE -888888888888888888  NC1774.2
   000118         012100             COMPUTATIONAL.                                       NC1774.2
   000119         012200 77  A14TWOS-CS-18V00  PICTURE S9(18) VALUE -000022222222222222   NC1774.2
   000120         012300             COMPUTATIONAL.                                       NC1774.2
   000121         012400 77  A12THREES-CU-18V00 PICTURE 9(18) VALUE 000000333333333333    NC1774.2
   000122         012500             COMPUTATIONAL.                                       NC1774.2
   000123         012600 77  A16FOURS-CS-18V00 PICTURE S9(18) VALUE 004444444444444444    NC1774.2
   000124         012700             COMPUTATIONAL.                                       NC1774.2
   000125         012800 77  A18FIVES-CS-18V00 PICTURE S9(18) VALUE -555555555555555555   NC1774.2
   000126         012900             COMPUTATIONAL.                                       NC1774.2
   000127         013000 77  A18SIXES-CS-18V00 PICTURE S9(18) VALUE 666666666666666666    NC1774.2
   000128         013100             COMPUTATIONAL.                                       NC1774.2
   000129         013200 77  A12SEVENS-CU-18V00 PICTURE 9(18) VALUE 000000777777777777    NC1774.2
   000130         013300             COMPUTATIONAL.                                       NC1774.2
   000131         013400 77  WRK-DU-18V00      PICTURE 9(18) VALUE ZERO.                  NC1774.2 IMP
   000132         013500 77  A18THREES-CS-18V00 PICTURE S9(18) VALUE -333333333333333333  NC1774.2
   000133         013600             COMPUTATIONAL.                                       NC1774.2
   000134         013700 77  WRK-CS-03V00 PICTURE S999 COMPUTATIONAL SYNCHRONIZED RIGHT.  NC1774.2
   000135         013800 01  SUBTRACT-DATA.                                               NC1774.2
   000136         013900     02  SUBTR-1    PICTURE 9         VALUE 1.                    NC1774.2
   000137         014000     02  SUBTR-2    PICTURE S99       VALUE 99.                   NC1774.2
   000138         014100     02  SUBTR-3    PICTURE S9V99     VALUE -1.                   NC1774.2
   000139         014200     02  SUBTR-4    PICTURE SPP9      VALUE .001.                 NC1774.2
   000140         014300     02  SUBTR-5    PICTURE S9PP      VALUE 100.                  NC1774.2
   000141         014400     02  SUBTR-6    PICTURE 9  VALUE 1.                           NC1774.2
   000142         014500     02  SUBTR-7    PICTURE S99  VALUE 99.                        NC1774.2
   000143         014600     02  SUBTR-8    PICTURE S9V99  VALUE -9.99.                   NC1774.2
   000144         014700     02  SUBTR-10    PICTURE S999  VALUE 100.                     NC1774.2
   000145         014800     02  SUBTR-11   PICTURE S999V999.                             NC1774.2
   000146         014900 01  N-3                                PICTURE IS 99999.         NC1774.2
   000147         015000 01  N-4                                PICTURE IS 9(5)           NC1774.2
   000148         015100     VALUE IS 52800.                                              NC1774.2
   000149         015200 01  N-5                                PICTURE IS S9(9)V99       NC1774.2
   000150         015300     VALUE IS 000000001.00.                                       NC1774.2
   000151         015400 01  N-7                                PICTURE IS S9(7)V9(4)     NC1774.2
   000152         015500     VALUE IS 0000001.0000.                                       NC1774.2
   000153         015600 01  X-8 REDEFINES N-7                  PICTURE IS X(11).         NC1774.2 151
   000154         015700 01  N-10                               PICTURE IS S99999V        NC1774.2
   000155         015800     VALUE IS -00001.                                             NC1774.2
   000156         015900 01  N-11                               PICTURE IS 9 VALUE IS 9.  NC1774.2
   000157         016000 01  N-12                               PICTURE IS 9 VALUE IS 9.  NC1774.2
   000158         016100 01  N-13                               PICTURE IS 9(5)           NC1774.2
   000159         016200     VALUE IS 99999.                                              NC1774.2
   000160         016300 01  N-14                               PICTURE IS 9 VALUE IS 1.  NC1774.2
   000161         016400 01  N-15                               PICTURE IS 9(16).         NC1774.2
   000162         016500 01  N-16                               PICTURE IS S999999V99     NC1774.2
   000163         016600     VALUE IS 5.90.                                               NC1774.2
   000164         016700 01  N-17                               PICTURE IS S9(3)V99       NC1774.2
   000165         016800     VALUE IS +3.6.                                               NC1774.2
   000166         016900 01  N-18                               PICTURE IS S9(10)         NC1774.2
   000167         017000     VALUE IS -5.                                                 NC1774.2
   000168         017100 01  N-19                               PICTURE IS $9.00.         NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  N-20                               PICTURE IS S9(9)          NC1774.2
   000170         017300     VALUE IS -999999999.                                         NC1774.2
   000171         017400 01  N-21                               PICTURE IS 9 VALUE IS 5.  NC1774.2
   000172         017500 01  N-22                               PICTURE IS 999V99         NC1774.2
   000173         017600     VALUE IS 005.55.                                             NC1774.2
   000174         017700 01  N-23                               PICTURE IS $$$.99CR.      NC1774.2
   000175         017800 01  N-25                               PICTURE IS 9 VALUE IS 1.  NC1774.2
   000176         017900 01  N-26               PICTURE 9(5).                             NC1774.2
   000177         018000 01  N-27                               PICTURE IS 9999V9         NC1774.2
   000178         018100     VALUE IS 9999.9.                                             NC1774.2
   000179         018200 01  N-28                               PICTURE IS $9999.00.      NC1774.2
   000180         018300 01  N-40                               PICTURE IS 9(7)           NC1774.2
   000181         018400     VALUE IS 7777777.                                            NC1774.2
   000182         018500 01  N-41                               PICTURE IS 9(7)           NC1774.2
   000183         018600     VALUE IS 1111111.                                            NC1774.2
   000184         018700 01  N-42                               PICTURE IS 9(3)P(4).      NC1774.2
   000185         018800 01  TRUNC-DATA.                                                  NC1774.2
   000186         018900     02 N-43  PICTURE S9V9 VALUE +1.6.                            NC1774.2
   000187         019000     02 N-44  PICTURE S9V9 VALUE -1.6.                            NC1774.2
   000188         019100     02 N-45  PICTURE S9.                                         NC1774.2
   000189         019200 01  MINUS-NAMES.                                                 NC1774.2
   000190         019300     02  MINUS-NAME1 PICTURE S9(18) VALUE -999999999999999999.    NC1774.2
   000191         019400     02  MINUS-NAME2 PICTURE S9(18) VALUE -999999999999999999.    NC1774.2
   000192         019500     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC1774.2
   000193         019600     02  PLUS-NAME1  PICTURE S9(18) VALUE +999999999999999999.    NC1774.2
   000194         019700     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC1774.2
   000195         019800     02  MINUS-NAME3 PICTURE SV9(18) VALUE -.999999999999999999.  NC1774.2
   000196         019900     02  MINUS-NAME4 PICTURE SV9(18) VALUE -.999999999999999999.  NC1774.2
   000197         020000     02  EVEN-NAME2  PICTURE SV9(18)  VALUE +.1.                  NC1774.2
   000198         020100     02  PLUS-NAME3  PICTURE SV9(18) VALUE +.999999999999999999.  NC1774.2
   000199         020200     02  PLUS-NAME4  PICTURE SV9(18) VALUE +.999999999999999999.  NC1774.2
   000200         020300     02  WHOLE-FIELD   PICTURE S9(18).                            NC1774.2
   000201         020400     02  DECMAL-FIELD  PICTURE SV9(18).                           NC1774.2
   000202         020500 01  TEST-RESULTS.                                                NC1774.2
   000203         020600     02 FILLER                   PIC X      VALUE SPACE.          NC1774.2 IMP
   000204         020700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1774.2 IMP
   000205         020800     02 FILLER                   PIC X      VALUE SPACE.          NC1774.2 IMP
   000206         020900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1774.2 IMP
   000207         021000     02 FILLER                   PIC X      VALUE SPACE.          NC1774.2 IMP
   000208         021100     02  PAR-NAME.                                                NC1774.2
   000209         021200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1774.2 IMP
   000210         021300       03  PARDOT-X              PIC X      VALUE SPACE.          NC1774.2 IMP
   000211         021400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1774.2 IMP
   000212         021500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1774.2 IMP
   000213         021600     02 RE-MARK                  PIC X(61).                       NC1774.2
   000214         021700 01  TEST-COMPUTED.                                               NC1774.2
   000215         021800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1774.2 IMP
   000216         021900     02 FILLER                   PIC X(17)  VALUE                 NC1774.2
   000217         022000            "       COMPUTED=".                                   NC1774.2
   000218         022100     02 COMPUTED-X.                                               NC1774.2
   000219         022200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1774.2 IMP
   000220         022300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1774.2 219
   000221         022400                                 PIC -9(9).9(9).                  NC1774.2
   000222         022500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1774.2 219
   000223         022600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1774.2 219
   000224         022700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1774.2 219
   000225         022800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1774.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900         04 COMPUTED-18V0                    PIC -9(18).          NC1774.2
   000227         023000         04 FILLER                           PIC X.               NC1774.2
   000228         023100     03 FILLER PIC X(50) VALUE SPACE.                             NC1774.2 IMP
   000229         023200 01  TEST-CORRECT.                                                NC1774.2
   000230         023300     02 FILLER PIC X(30) VALUE SPACE.                             NC1774.2 IMP
   000231         023400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1774.2
   000232         023500     02 CORRECT-X.                                                NC1774.2
   000233         023600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1774.2 IMP
   000234         023700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1774.2 233
   000235         023800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1774.2 233
   000236         023900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1774.2 233
   000237         024000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1774.2 233
   000238         024100     03      CR-18V0 REDEFINES CORRECT-A.                         NC1774.2 233
   000239         024200         04 CORRECT-18V0                     PIC -9(18).          NC1774.2
   000240         024300         04 FILLER                           PIC X.               NC1774.2
   000241         024400     03 FILLER PIC X(2) VALUE SPACE.                              NC1774.2 IMP
   000242         024500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1774.2 IMP
   000243         024600 01  CCVS-C-1.                                                    NC1774.2
   000244         024700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1774.2
   000245         024800-    "SS  PARAGRAPH-NAME                                          NC1774.2
   000246         024900-    "       REMARKS".                                            NC1774.2
   000247         025000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1774.2 IMP
   000248         025100 01  CCVS-C-2.                                                    NC1774.2
   000249         025200     02 FILLER                     PIC X        VALUE SPACE.      NC1774.2 IMP
   000250         025300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1774.2
   000251         025400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1774.2 IMP
   000252         025500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1774.2
   000253         025600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1774.2 IMP
   000254         025700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1774.2 IMP
   000255         025800 01  REC-CT                        PIC 99       VALUE ZERO.       NC1774.2 IMP
   000256         025900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1774.2 IMP
   000257         026000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1774.2 IMP
   000258         026100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1774.2 IMP
   000259         026200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1774.2 IMP
   000260         026300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1774.2 IMP
   000261         026400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1774.2 IMP
   000262         026500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1774.2 IMP
   000263         026600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1774.2 IMP
   000264         026700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1774.2 IMP
   000265         026800 01  CCVS-H-1.                                                    NC1774.2
   000266         026900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1774.2 IMP
   000267         027000     02  FILLER                    PIC X(42)    VALUE             NC1774.2
   000268         027100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1774.2
   000269         027200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1774.2 IMP
   000270         027300 01  CCVS-H-2A.                                                   NC1774.2
   000271         027400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1774.2 IMP
   000272         027500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1774.2
   000273         027600   02  FILLER                        PIC XXXX   VALUE             NC1774.2
   000274         027700     "4.2 ".                                                      NC1774.2
   000275         027800   02  FILLER                        PIC X(28)  VALUE             NC1774.2
   000276         027900            " COPY - NOT FOR DISTRIBUTION".                       NC1774.2
   000277         028000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1774.2 IMP
   000278         028100                                                                  NC1774.2
   000279         028200 01  CCVS-H-2B.                                                   NC1774.2
   000280         028300   02  FILLER                        PIC X(15)  VALUE             NC1774.2
   000281         028400            "TEST RESULT OF ".                                    NC1774.2
   000282         028500   02  TEST-ID                       PIC X(9).                    NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600   02  FILLER                        PIC X(4)   VALUE             NC1774.2
   000284         028700            " IN ".                                               NC1774.2
   000285         028800   02  FILLER                        PIC X(12)  VALUE             NC1774.2
   000286         028900     " HIGH       ".                                              NC1774.2
   000287         029000   02  FILLER                        PIC X(22)  VALUE             NC1774.2
   000288         029100            " LEVEL VALIDATION FOR ".                             NC1774.2
   000289         029200   02  FILLER                        PIC X(58)  VALUE             NC1774.2
   000290         029300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1774.2
   000291         029400 01  CCVS-H-3.                                                    NC1774.2
   000292         029500     02  FILLER                      PIC X(34)  VALUE             NC1774.2
   000293         029600            " FOR OFFICIAL USE ONLY    ".                         NC1774.2
   000294         029700     02  FILLER                      PIC X(58)  VALUE             NC1774.2
   000295         029800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1774.2
   000296         029900     02  FILLER                      PIC X(28)  VALUE             NC1774.2
   000297         030000            "  COPYRIGHT   1985 ".                                NC1774.2
   000298         030100 01  CCVS-E-1.                                                    NC1774.2
   000299         030200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1774.2 IMP
   000300         030300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1774.2
   000301         030400     02 ID-AGAIN                     PIC X(9).                    NC1774.2
   000302         030500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1774.2 IMP
   000303         030600 01  CCVS-E-2.                                                    NC1774.2
   000304         030700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1774.2 IMP
   000305         030800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1774.2 IMP
   000306         030900     02 CCVS-E-2-2.                                               NC1774.2
   000307         031000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1774.2 IMP
   000308         031100         03 FILLER                   PIC X      VALUE SPACE.      NC1774.2 IMP
   000309         031200         03 ENDER-DESC               PIC X(44)  VALUE             NC1774.2
   000310         031300            "ERRORS ENCOUNTERED".                                 NC1774.2
   000311         031400 01  CCVS-E-3.                                                    NC1774.2
   000312         031500     02  FILLER                      PIC X(22)  VALUE             NC1774.2
   000313         031600            " FOR OFFICIAL USE ONLY".                             NC1774.2
   000314         031700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1774.2 IMP
   000315         031800     02  FILLER                      PIC X(58)  VALUE             NC1774.2
   000316         031900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1774.2
   000317         032000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1774.2 IMP
   000318         032100     02 FILLER                       PIC X(15)  VALUE             NC1774.2
   000319         032200             " COPYRIGHT 1985".                                   NC1774.2
   000320         032300 01  CCVS-E-4.                                                    NC1774.2
   000321         032400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1774.2 IMP
   000322         032500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1774.2
   000323         032600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1774.2 IMP
   000324         032700     02 FILLER                       PIC X(40)  VALUE             NC1774.2
   000325         032800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1774.2
   000326         032900 01  XXINFO.                                                      NC1774.2
   000327         033000     02 FILLER                       PIC X(19)  VALUE             NC1774.2
   000328         033100            "*** INFORMATION ***".                                NC1774.2
   000329         033200     02 INFO-TEXT.                                                NC1774.2
   000330         033300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1774.2 IMP
   000331         033400       04 XXCOMPUTED                 PIC X(20).                   NC1774.2
   000332         033500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1774.2 IMP
   000333         033600       04 XXCORRECT                  PIC X(20).                   NC1774.2
   000334         033700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1774.2
   000335         033800 01  HYPHEN-LINE.                                                 NC1774.2
   000336         033900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1774.2 IMP
   000337         034000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1774.2
   000338         034100-    "*****************************************".                 NC1774.2
   000339         034200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300-    "******************************".                            NC1774.2
   000341         034400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1774.2
   000342         034500     "NC177A".                                                    NC1774.2
   000343         034600 PROCEDURE DIVISION.                                              NC1774.2
   000344         034700 CCVS1 SECTION.                                                   NC1774.2
   000345         034800 OPEN-FILES.                                                      NC1774.2
   000346         034900     OPEN     OUTPUT PRINT-FILE.                                  NC1774.2 35
   000347         035000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1774.2 341 282 341 301
   000348         035100     MOVE    SPACE TO TEST-RESULTS.                               NC1774.2 IMP 202
   000349         035200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1774.2 374 379
   000350         035300     GO TO CCVS1-EXIT.                                            NC1774.2 461
   000351         035400 CLOSE-FILES.                                                     NC1774.2
   000352         035500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1774.2 383 404 35
   000353         035600 TERMINATE-CCVS.                                                  NC1774.2
   000354         035700     EXIT PROGRAM.                                                NC1774.2
   000355         035800 TERMINATE-CALL.                                                  NC1774.2
   000356         035900     STOP     RUN.                                                NC1774.2
   000357         036000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1774.2 206 258
   000358         036100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1774.2 206 259
   000359         036200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1774.2 206 257
   000360         036300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1774.2 206 256
   000361         036400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1774.2 213
   000362         036500 PRINT-DETAIL.                                                    NC1774.2
   000363         036600     IF REC-CT NOT EQUAL TO ZERO                                  NC1774.2 255 IMP
   000364      1  036700             MOVE "." TO PARDOT-X                                 NC1774.2 210
   000365      1  036800             MOVE REC-CT TO DOTVALUE.                             NC1774.2 255 211
   000366         036900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1774.2 202 36 416
   000367         037000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1774.2 206 416
   000368      1  037100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1774.2 437 451
   000369      1  037200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1774.2 452 460
   000370         037300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1774.2 IMP 206 IMP 218
   000371         037400     MOVE SPACE TO CORRECT-X.                                     NC1774.2 IMP 232
   000372         037500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1774.2 255 IMP IMP 208
   000373         037600     MOVE     SPACE TO RE-MARK.                                   NC1774.2 IMP 213
   000374         037700 HEAD-ROUTINE.                                                    NC1774.2
   000375         037800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1774.2 265 37 416
   000376         037900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1774.2 270 37 416
   000377         038000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1774.2 279 37 416
   000378         038100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1774.2 291 37 416
   000379         038200 COLUMN-NAMES-ROUTINE.                                            NC1774.2
   000380         038300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1774.2 243 37 416
   000381         038400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1774.2 248 37 416
   000382         038500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1774.2 335 37 416
   000383         038600 END-ROUTINE.                                                     NC1774.2
   000384         038700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1774.2 335 37 416
   000385         038800 END-RTN-EXIT.                                                    NC1774.2
   000386         038900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1774.2 298 37 416
   000387         039000 END-ROUTINE-1.                                                   NC1774.2
   000388         039100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1774.2 257 261 258
   000389         039200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1774.2 261 256 261
   000390         039300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1774.2 259 261
   000391         039400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1774.2
   000392         039500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1774.2 259 321
   000393         039600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1774.2 261 323
   000394         039700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1774.2 320 306
   000395         039800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1774.2 303 37 416
   000396         039900  END-ROUTINE-12.                                                 NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1774.2 309
   000398         040100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1774.2 257 IMP
   000399      1  040200         MOVE "NO " TO ERROR-TOTAL                                NC1774.2 307
   000400         040300         ELSE                                                     NC1774.2
   000401      1  040400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1774.2 257 307
   000402         040500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1774.2 303 37
   000403         040600     PERFORM WRITE-LINE.                                          NC1774.2 416
   000404         040700 END-ROUTINE-13.                                                  NC1774.2
   000405         040800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1774.2 256 IMP
   000406      1  040900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1774.2 307
   000407      1  041000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1774.2 256 307
   000408         041100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1774.2 309
   000409         041200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1774.2 303 37 416
   000410         041300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1774.2 258 IMP
   000411      1  041400          MOVE "NO " TO ERROR-TOTAL                               NC1774.2 307
   000412      1  041500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1774.2 258 307
   000413         041600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1774.2 309
   000414         041700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1774.2 303 37 416
   000415         041800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1774.2 311 37 416
   000416         041900 WRITE-LINE.                                                      NC1774.2
   000417         042000     ADD 1 TO RECORD-COUNT.                                       NC1774.2 263
   000418         042100     IF RECORD-COUNT GREATER 42                                   NC1774.2 263
   000419      1  042200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1774.2 37 262
   000420      1  042300         MOVE SPACE TO DUMMY-RECORD                               NC1774.2 IMP 37
   000421      1  042400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1774.2 37
   000422      1  042500         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1774.2 265 37 432
   000423      1  042600         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1774.2 270 37 432
   000424      1  042700         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1774.2 279 37 432
   000425      1  042800         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1774.2 291 37 432
   000426      1  042900         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1774.2 243 37 432
   000427      1  043000         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1774.2 248 37 432
   000428      1  043100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1774.2 335 37 432
   000429      1  043200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1774.2 262 37
   000430      1  043300         MOVE ZERO TO RECORD-COUNT.                               NC1774.2 IMP 263
   000431         043400     PERFORM WRT-LN.                                              NC1774.2 432
   000432         043500 WRT-LN.                                                          NC1774.2
   000433         043600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1774.2 37
   000434         043700     MOVE SPACE TO DUMMY-RECORD.                                  NC1774.2 IMP 37
   000435         043800 BLANK-LINE-PRINT.                                                NC1774.2
   000436         043900     PERFORM WRT-LN.                                              NC1774.2 432
   000437         044000 FAIL-ROUTINE.                                                    NC1774.2
   000438         044100     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1774.2 218 IMP
   000439      1  044200            GO TO FAIL-ROUTINE-WRITE.                             NC1774.2 446
   000440         044300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1774.2 232 IMP 446
   000441         044400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1774.2 264 334
   000442         044500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1774.2 329
   000443         044600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1774.2 326 37 416
   000444         044700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1774.2 IMP 334
   000445         044800     GO TO  FAIL-ROUTINE-EX.                                      NC1774.2 451
   000446         044900 FAIL-ROUTINE-WRITE.                                              NC1774.2
   000447         045000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1774.2 214 36 416
   000448         045100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1774.2 264 242
   000449         045200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1774.2 229 36 416
   000450         045300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1774.2 IMP 242
   000451         045400 FAIL-ROUTINE-EX. EXIT.                                           NC1774.2
   000452         045500 BAIL-OUT.                                                        NC1774.2
   000453         045600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1774.2 219 IMP 455
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1774.2 233 IMP 460
   000455         045800 BAIL-OUT-WRITE.                                                  NC1774.2
   000456         045900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1774.2 233 333 219 331
   000457         046000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1774.2 264 334
   000458         046100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1774.2 326 37 416
   000459         046200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1774.2 IMP 334
   000460         046300 BAIL-OUT-EX. EXIT.                                               NC1774.2
   000461         046400 CCVS1-EXIT.                                                      NC1774.2
   000462         046500     EXIT.                                                        NC1774.2
   000463         046600 SECT-NC177A-001 SECTION.                                         NC1774.2
   000464         046700 ADD-INIT-F2-1.                                                   NC1774.2
   000465         046800     MOVE "ADD GIVING" TO FEATURE.                                NC1774.2 204
   000466         046900     MOVE "VI-74 6.6.4 GR2" TO ANSI-REFERENCE.                    NC1774.2 264
   000467         047000 ADD-TEST-F2-1.                                                   NC1774.2
   000468         047100     ADD      1 N-14 GIVING N-15.                                 NC1774.2 160 161
   000469         047200     IF       N-15 EQUAL TO 2                                     NC1774.2 161
   000470      1  047300              PERFORM PASS                                        NC1774.2 358
   000471      1  047400              GO TO ADD-WRITE-F2-1.                               NC1774.2 480
   000472         047500     GO TO    ADD-FAIL-F2-1.                                      NC1774.2 476
   000473         047600 ADD-DELETE-F2-1.                                                 NC1774.2
   000474         047700     PERFORM  DE-LETE.                                            NC1774.2 360
   000475         047800     GO TO    ADD-WRITE-F2-1.                                     NC1774.2 480
   000476         047900 ADD-FAIL-F2-1.                                                   NC1774.2
   000477         048000     MOVE     N-15 TO COMPUTED-N.                                 NC1774.2 161 220
   000478         048100     MOVE     2 TO CORRECT-N.                                     NC1774.2 234
   000479         048200     PERFORM  FAIL.                                               NC1774.2 359
   000480         048300 ADD-WRITE-F2-1.                                                  NC1774.2
   000481         048400     MOVE "ADD-TEST-F2-1 " TO PAR-NAME.                           NC1774.2 208
   000482         048500     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000483         048600 ADD-TEST-F2-2.                                                   NC1774.2
   000484         048700     ADD      N-16 N-4 GIVING N-3 ROUNDED.                        NC1774.2 162 147 146
   000485         048800     IF       N-3 EQUAL TO 52806                                  NC1774.2 146
   000486      1  048900              PERFORM PASS                                        NC1774.2 358
   000487      1  049000              GO TO ADD-WRITE-F2-2.                               NC1774.2 496
   000488         049100     GO TO    ADD-FAIL-F2-2.                                      NC1774.2 492
   000489         049200 ADD-DELETE-F2-2.                                                 NC1774.2
   000490         049300     PERFORM  DE-LETE.                                            NC1774.2 360
   000491         049400     GO TO    ADD-WRITE-F2-2.                                     NC1774.2 496
   000492         049500 ADD-FAIL-F2-2.                                                   NC1774.2
   000493         049600     MOVE     N-3 TO COMPUTED-N.                                  NC1774.2 146 220
   000494         049700     MOVE     52806 TO CORRECT-N.                                 NC1774.2 234
   000495         049800     PERFORM  FAIL.                                               NC1774.2 359
   000496         049900 ADD-WRITE-F2-2.                                                  NC1774.2
   000497         050000     MOVE "ADD-TEST-F2-2 " TO PAR-NAME.                           NC1774.2 208
   000498         050100     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000499         050200     MOVE     52806 TO N-3.                                       NC1774.2 146
   000500         050300 ADD-TEST-F2-3-1.                                                 NC1774.2
   000501         050400     ADD      N-13 1 GIVING N-3 ON SIZE ERROR                     NC1774.2 158 146
   000502      1  050500              PERFORM PASS                                        NC1774.2 358
   000503      1  050600              GO TO ADD-WRITE-F2-3-1.                             NC1774.2 514
   000504         050700*    NOTE WHEN SIZE ERROR CONDITION OCCURS, VALUE OF              NC1774.2
   000505         050800*    N-3  SHOULD NOT BE CHANGED.                                  NC1774.2
   000506         050900     GO TO    ADD-FAIL-F2-3-1.                                    NC1774.2 510
   000507         051000 ADD-DELETE-F2-3-1.                                               NC1774.2
   000508         051100     PERFORM  DE-LETE.                                            NC1774.2 360
   000509         051200     GO TO    ADD-WRITE-F2-3-1.                                   NC1774.2 514
   000510         051300 ADD-FAIL-F2-3-1.                                                 NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE     N-3 TO COMPUTED-N.                                  NC1774.2 146 220
   000512         051500     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1774.2 213
   000513         051600     PERFORM  FAIL.                                               NC1774.2 359
   000514         051700 ADD-WRITE-F2-3-1.                                                NC1774.2
   000515         051800     MOVE "ADD-TEST-F2-3-1 " TO PAR-NAME.                         NC1774.2 208
   000516         051900     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000517         052000 ADD-TEST-F2-3-2.                                                 NC1774.2
   000518         052100     IF      N-3 NOT = 52806                                      NC1774.2 146
   000519      1  052200             MOVE    N-3   TO COMPUTED-N                          NC1774.2 146 220
   000520      1  052300             MOVE    42806 TO CORRECT-N                           NC1774.2 234
   000521      1  052400             MOVE   "ON SIZE ERROR NOT EXECUTED" TO RE-MARK       NC1774.2 213
   000522      1  052500             MOVE   "ADD-TEST-F2-3-2 " TO PAR-NAME                NC1774.2 208
   000523      1  052600             PERFORM FAIL                                         NC1774.2 359
   000524      1  052700             PERFORM PRINT-DETAIL.                                NC1774.2 362
   000525         052800 ADD-TEST-F2-4-1.                                                 NC1774.2
   000526         052900     ADD      1.6 N-13 GIVING N-3 ROUNDED ON SIZE ERROR           NC1774.2 158 146
   000527      1  053000              PERFORM PASS                                        NC1774.2 358
   000528      1  053100              GO TO ADD-WRITE-F2-4-1.                             NC1774.2 537
   000529         053200     GO TO    ADD-FAIL-F2-4-1.                                    NC1774.2 533
   000530         053300 ADD-DELETE-F2-4-1.                                               NC1774.2
   000531         053400     PERFORM  DE-LETE.                                            NC1774.2 360
   000532         053500     GO TO    ADD-WRITE-F2-4-1.                                   NC1774.2 537
   000533         053600 ADD-FAIL-F2-4-1.                                                 NC1774.2
   000534         053700     MOVE     N-3 TO COMPUTED-N.                                  NC1774.2 146 220
   000535         053800     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1774.2 213
   000536         053900     PERFORM  FAIL.                                               NC1774.2 359
   000537         054000 ADD-WRITE-F2-4-1.                                                NC1774.2
   000538         054100     MOVE "ADD-TEST-F2-4-1 " TO PAR-NAME.                         NC1774.2 208
   000539         054200     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000540         054300 ADD-TEST-F2-4-2.                                                 NC1774.2
   000541         054400     IF       N-3 EQUAL TO 52806                                  NC1774.2 146
   000542      1  054500              PERFORM PASS                                        NC1774.2 358
   000543      1  054600              GO TO ADD-WRITE-F2-4-2.                             NC1774.2 552
   000544         054700     GO TO    ADD-FAIL-F2-4-2.                                    NC1774.2 548
   000545         054800 ADD-DELETE-F2-4-2.                                               NC1774.2
   000546         054900     PERFORM  DE-LETE.                                            NC1774.2 360
   000547         055000     GO TO    ADD-WRITE-F2-4-2.                                   NC1774.2 552
   000548         055100 ADD-FAIL-F2-4-2.                                                 NC1774.2
   000549         055200     MOVE     N-3 TO COMPUTED-N.                                  NC1774.2 146 220
   000550         055300     MOVE     52806 TO CORRECT-N.                                 NC1774.2 234
   000551         055400     PERFORM  FAIL.                                               NC1774.2 359
   000552         055500 ADD-WRITE-F2-4-2.                                                NC1774.2
   000553         055600     MOVE "ADD-TEST-F2-4-2" TO PAR-NAME.                          NC1774.2 208
   000554         055700     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000555         055800 ADD-INIT-F2-5.                                                   NC1774.2
   000556         055900     MOVE "  GIVING" TO FEATURE.                                  NC1774.2 204
   000557         056000 ADD-TEST-F2-5.                                                   NC1774.2
   000558         056100     MOVE     ZERO TO WRK-DS-09V09.                               NC1774.2 IMP 54
   000559         056200     ADD      A06THREES-DS-03V03                                  NC1774.2 57
   000560         056300              A12THREES-DS-06V06 GIVING WRK-DS-09V09.             NC1774.2 59 54
   000561         056400     IF       WRK-DS-09V09 EQUAL TO 000333666.666333000           NC1774.2 54
   000562      1  056500              PERFORM PASS GO TO ADD-WRITE-F2-5.                  NC1774.2 358 571
   000563         056600     GO       TO ADD-FAIL-F2-5.                                   NC1774.2 567
   000564         056700 ADD-DELETE-F2-5.                                                 NC1774.2
   000565         056800     PERFORM  DE-LETE.                                            NC1774.2 360
   000566         056900     GO       TO ADD-WRITE-F2-5.                                  NC1774.2 571
   000567         057000 ADD-FAIL-F2-5.                                                   NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE     WRK-DS-09V09 TO COMPUTED-N.                         NC1774.2 54 220
   000569         057200     MOVE     000333666.666333000 TO CORRECT-N.                   NC1774.2 234
   000570         057300     PERFORM  FAIL.                                               NC1774.2 359
   000571         057400 ADD-WRITE-F2-5.                                                  NC1774.2
   000572         057500     MOVE     "ADD-TEST-F2-5" TO PAR-NAME.                        NC1774.2 208
   000573         057600     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000574         057700 ADD-TEST-F2-6.                                                   NC1774.2
   000575         057800     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   000576         057900     ADD      A05ONES-DS-05V00                                    NC1774.2 50
   000577         058000              A05ONES-DS-00V05                                    NC1774.2 64
   000578         058100              A12THREES-DS-06V06                                  NC1774.2 59
   000579         058200              A06THREES-DS-03V03 GIVING WRK-DS-06V06.             NC1774.2 57 61
   000580         058300     IF       WRK-DS-06V06 EQUAL TO 344777.777443                 NC1774.2 61
   000581      1  058400              PERFORM PASS GO TO ADD-WRITE-F2-6.                  NC1774.2 358 590
   000582         058500     GO       TO ADD-FAIL-F2-6.                                   NC1774.2 586
   000583         058600 ADD-DELETE-F2-6.                                                 NC1774.2
   000584         058700     PERFORM  DE-LETE.                                            NC1774.2 360
   000585         058800     GO       TO ADD-WRITE-F2-6.                                  NC1774.2 590
   000586         058900 ADD-FAIL-F2-6.                                                   NC1774.2
   000587         059000     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1774.2 61 220
   000588         059100     MOVE     344777.777443 TO CORRECT-N.                         NC1774.2 234
   000589         059200     PERFORM  FAIL.                                               NC1774.2 359
   000590         059300 ADD-WRITE-F2-6.                                                  NC1774.2
   000591         059400     MOVE     "ADD-TEST-F2-6" TO PAR-NAME.                        NC1774.2 208
   000592         059500     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000593         059600 ADD-TEST-F2-7.                                                   NC1774.2
   000594         059700     MOVE     ZERO TO WRK-DS-06V00.                               NC1774.2 IMP 90
   000595         059800     ADD      A05ONES-DS-00V05                                    NC1774.2 64
   000596         059900              A12THREES-DS-06V06                                  NC1774.2 59
   000597         060000              A05ONES-DS-00V05 GIVING WRK-DS-06V00 ROUNDED.       NC1774.2 64 90
   000598         060100     IF      WRK-DS-06V00 EQUAL TO 333334                         NC1774.2 90
   000599      1  060200     PERFORM PASS GO TO ADD-WRITE-F2-7.                           NC1774.2 358 608
   000600         060300     GO      TO ADD-FAIL-F2-7.                                    NC1774.2 604
   000601         060400 ADD-DELETE-F2-7.                                                 NC1774.2
   000602         060500     PERFORM  DE-LETE.                                            NC1774.2 360
   000603         060600     GO       TO ADD-WRITE-F2-7.                                  NC1774.2 608
   000604         060700 ADD-FAIL-F2-7.                                                   NC1774.2
   000605         060800     MOVE     WRK-DS-06V00 TO COMPUTED-N.                         NC1774.2 90 220
   000606         060900     MOVE    333334 TO CORRECT-N.                                 NC1774.2 234
   000607         061000     PERFORM FAIL.                                                NC1774.2 359
   000608         061100 ADD-WRITE-F2-7.                                                  NC1774.2
   000609         061200     MOVE     "ADD-TEST-F2-7" TO PAR-NAME.                        NC1774.2 208
   000610         061300     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000611         061400 ADD-INIT-F2-8-1.                                                 NC1774.2
   000612         061500     MOVE     ZERO TO WRK-DS-10V00.                               NC1774.2 IMP 47
   000613         061600 ADD-TEST-F2-8-1.                                                 NC1774.2
   000614         061700     ADD      A12ONES-DS-12V00                                    NC1774.2 68
   000615         061800              ZERO GIVING WRK-DS-10V00 ON SIZE ERROR              NC1774.2 IMP 47
   000616      1  061900              PERFORM PASS GO TO ADD-WRITE-F2-8-1.                NC1774.2 358 624
   000617         062000     GO       TO ADD-FAIL-F2-8-1.                                 NC1774.2 621
   000618         062100 ADD-DELETE-F2-8-1.                                               NC1774.2
   000619         062200     PERFORM  DE-LETE.                                            NC1774.2 360
   000620         062300     GO       TO ADD-WRITE-F2-8-1.                                NC1774.2 624
   000621         062400 ADD-FAIL-F2-8-1.                                                 NC1774.2
   000622         062500     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1774.2 213
   000623         062600     PERFORM  FAIL.                                               NC1774.2 359
   000624         062700 ADD-WRITE-F2-8-1.                                                NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800     MOVE     "ADD-TEST-F2-8-1" TO PAR-NAME.                      NC1774.2 208
   000626         062900     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000627         063000 ADD-TEST-F2-8-2.                                                 NC1774.2
   000628         063100     IF       WRK-DS-10V00 EQUAL TO ZERO                          NC1774.2 47 IMP
   000629      1  063200              PERFORM PASS GO TO ADD-WRITE-F2-8-2.                NC1774.2 358 640
   000630         063300*    NOTE     THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-F2-8-1NC1774.2
   000631         063400     GO       TO ADD-FAIL-F2-8-2.                                 NC1774.2 635
   000632         063500 ADD-DELETE-F2-8-2.                                               NC1774.2
   000633         063600     PERFORM  DE-LETE.                                            NC1774.2 360
   000634         063700     GO       TO ADD-WRITE-F2-8-2.                                NC1774.2 640
   000635         063800 ADD-FAIL-F2-8-2.                                                 NC1774.2
   000636         063900     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1774.2 213
   000637         064000     MOVE     WRK-DS-10V00 TO COMPUTED-14V4.                      NC1774.2 47 224
   000638         064100     MOVE     ZERO TO CORRECT-14V4.                               NC1774.2 IMP 237
   000639         064200     PERFORM  FAIL.                                               NC1774.2 359
   000640         064300 ADD-WRITE-F2-8-2.                                                NC1774.2
   000641         064400     MOVE     "ADD-TEST-F2-8-2" TO PAR-NAME.                      NC1774.2 208
   000642         064500     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000643         064600 ADD-TEST-F2-9-1.                                                 NC1774.2
   000644         064700     MOVE     ZERO TO WRK-DS-05V00                                NC1774.2 IMP 66
   000645         064800     ADD      33333                                               NC1774.2
   000646         064900              A06THREES-DS-03V03                                  NC1774.2 57
   000647         065000              A12THREES-DS-06V06                                  NC1774.2 59
   000648         065100              GIVING WRK-DS-05V00 ROUNDED ON SIZE ERROR           NC1774.2 66
   000649      1  065200              PERFORM PASS GO TO ADD-WRITE-F2-9-1.                NC1774.2 358 657
   000650         065300     GO       TO ADD-FAIL-F2-9-1.                                 NC1774.2 654
   000651         065400 ADD-DELETE-F2-9-1.                                               NC1774.2
   000652         065500     PERFORM  DE-LETE.                                            NC1774.2 360
   000653         065600     GO       TO ADD-WRITE-F2-9-1.                                NC1774.2 657
   000654         065700 ADD-FAIL-F2-9-1.                                                 NC1774.2
   000655         065800     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1774.2 213
   000656         065900     PERFORM  FAIL.                                               NC1774.2 359
   000657         066000 ADD-WRITE-F2-9-1.                                                NC1774.2
   000658         066100     MOVE     "ADD-TEST-F2-9-1" TO PAR-NAME.                      NC1774.2 208
   000659         066200     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000660         066300 ADD-TEST-F2-9-2.                                                 NC1774.2
   000661         066400     IF       WRK-DS-05V00 EQUAL TO ZERO                          NC1774.2 66 IMP
   000662      1  066500              PERFORM PASS GO TO ADD-WRITE-F2-9-2.                NC1774.2 358 673
   000663         066600     GO       TO ADD-FAIL-F2-9-2.                                 NC1774.2 668
   000664         066700*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-F2-9-1   NC1774.2
   000665         066800 ADD-DELETE-F2-9-2.                                               NC1774.2
   000666         066900     PERFORM  DE-LETE.                                            NC1774.2 360
   000667         067000     GO       TO ADD-WRITE-F2-9-2.                                NC1774.2 673
   000668         067100 ADD-FAIL-F2-9-2.                                                 NC1774.2
   000669         067200     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1774.2 213
   000670         067300     MOVE     WRK-DS-05V00 TO COMPUTED-N.                         NC1774.2 66 220
   000671         067400     MOVE     ZERO TO CORRECT-N.                                  NC1774.2 IMP 234
   000672         067500     PERFORM  FAIL.                                               NC1774.2 359
   000673         067600 ADD-WRITE-F2-9-2.                                                NC1774.2
   000674         067700     MOVE     "ADD-TEST-F2-9-2" TO PAR-NAME.                      NC1774.2 208
   000675         067800     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000676         067900 ADD-INIT-F2-10.                                                  NC1774.2
   000677         068000     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   000678         068100 ADD-TEST-F2-10-1.                                                NC1774.2
   000679         068200     ADD      A12THREES-DS-06V06                                  NC1774.2 59
   000680         068300              333333                                              NC1774.2
   000681         068400              A06THREES-DS-03V03                                  NC1774.2 57
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500              GIVING WRK-DS-06V06 ROUNDED ON SIZE ERROR           NC1774.2 61
   000683      1  068600              GO TO ADD-FAIL-F2-10-1.                             NC1774.2 689
   000684         068700     PERFORM  PASS.                                               NC1774.2 358
   000685         068800     GO       TO ADD-WRITE-F2-10-1.                               NC1774.2 692
   000686         068900 ADD-DELETE-F2-10-1.                                              NC1774.2
   000687         069000     PERFORM  DE-LETE.                                            NC1774.2 360
   000688         069100     GO       TO ADD-WRITE-F2-10-1.                               NC1774.2 692
   000689         069200 ADD-FAIL-F2-10-1.                                                NC1774.2
   000690         069300     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1774.2 213
   000691         069400     PERFORM  FAIL.                                               NC1774.2 359
   000692         069500 ADD-WRITE-F2-10-1.                                               NC1774.2
   000693         069600     MOVE     "ADD-TEST-F2-10-1" TO PAR-NAME.                     NC1774.2 208
   000694         069700     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000695         069800 ADD-TEST-F2-10-2.                                                NC1774.2
   000696         069900     IF       WRK-DS-06V06 EQUAL TO 666999.666333                 NC1774.2 61
   000697      1  070000              PERFORM PASS GO TO ADD-WRITE-F2-10-2.               NC1774.2 358 707
   000698         070100*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-F2-10-1  NC1774.2
   000699         070200     GO       TO ADD-FAIL-F2-10-2.                                NC1774.2 703
   000700         070300 ADD-DELETE-F2-10-2.                                              NC1774.2
   000701         070400     PERFORM  DE-LETE.                                            NC1774.2 360
   000702         070500     GO       TO ADD-WRITE-F2-10-2.                               NC1774.2 707
   000703         070600 ADD-FAIL-F2-10-2.                                                NC1774.2
   000704         070700     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1774.2 61 220
   000705         070800     MOVE     666999.666333 TO CORRECT-N.                         NC1774.2 234
   000706         070900     PERFORM  FAIL.                                               NC1774.2 359
   000707         071000 ADD-WRITE-F2-10-2.                                               NC1774.2
   000708         071100     MOVE     "ADD-TEST-F2-10-2" TO PAR-NAME.                     NC1774.2 208
   000709         071200     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000710         071300 ADD-INIT-F2-11.                                                  NC1774.2
   000711         071400     MOVE "  SERIES" TO FEATURE.                                  NC1774.2 204
   000712         071500 ADD-TEST-F2-11.                                                  NC1774.2
   000713         071600     MOVE     ZERO TO WRK-DS-03V10.                               NC1774.2 IMP 70
   000714         071700     ADD      A99-DS-02V00                                        NC1774.2 73
   000715         071800              A03ONES-DS-02V01                                    NC1774.2 75
   000716         071900              A06ONES-DS-03V03                                    NC1774.2 77
   000717         072000              A08TWOS-DS-02V06                                    NC1774.2 79
   000718         072100              -1.1111111                                          NC1774.2
   000719         072200              +.11111111                                          NC1774.2
   000720         072300              A01ONE-DS-P0801 GIVING WRK-DS-03V10.                NC1774.2 81 70
   000721         072400     IF       WRK-DS-03V10 EQUAL TO 242.4332220110                NC1774.2 70
   000722      1  072500              PERFORM PASS GO TO ADD-WRITE-F2-11.                 NC1774.2 358 731
   000723         072600     GO       TO ADD-FAIL-F2-11.                                  NC1774.2 727
   000724         072700 ADD-DELETE-F2-11.                                                NC1774.2
   000725         072800     PERFORM  DE-LETE.                                            NC1774.2 360
   000726         072900     GO       TO ADD-WRITE-F2-11.                                 NC1774.2 731
   000727         073000 ADD-FAIL-F2-11.                                                  NC1774.2
   000728         073100     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1774.2 70 223
   000729         073200     MOVE     242.4332220110 TO CORRECT-4V14.                     NC1774.2 236
   000730         073300     PERFORM  FAIL.                                               NC1774.2 359
   000731         073400 ADD-WRITE-F2-11.                                                 NC1774.2
   000732         073500     MOVE     "ADD-TEST-F2-11" TO PAR-NAME.                       NC1774.2 208
   000733         073600     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000734         073700 ADD-TEST-F2-12.                                                  NC1774.2
   000735         073800     MOVE     ZERO TO WRK-DS-03V10.                               NC1774.2 IMP 70
   000736         073900     ADD      A01ONE-DS-P0801                                     NC1774.2 81
   000737         074000              +.11111111                                          NC1774.2
   000738         074100              -1.1111111                                          NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200              A08TWOS-DS-02V06                                    NC1774.2 79
   000740         074300              A06ONES-DS-03V03                                    NC1774.2 77
   000741         074400              A03ONES-DS-02V01                                    NC1774.2 75
   000742         074500              A99-DS-02V00 GIVING WRK-DS-03V10.                   NC1774.2 73 70
   000743         074600     IF       WRK-DS-03V10 EQUAL TO 242.4332220110                NC1774.2 70
   000744      1  074700              PERFORM PASS GO TO ADD-WRITE-F2-12.                 NC1774.2 358 753
   000745         074800     GO       TO ADD-FAIL-F2-12.                                  NC1774.2 749
   000746         074900 ADD-DELETE-F2-12.                                                NC1774.2
   000747         075000     PERFORM  DE-LETE.                                            NC1774.2 360
   000748         075100     GO       TO ADD-WRITE-F2-12.                                 NC1774.2 753
   000749         075200 ADD-FAIL-F2-12.                                                  NC1774.2
   000750         075300     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1774.2 70 223
   000751         075400     MOVE     242.4332220110 TO CORRECT-4V14.                     NC1774.2 236
   000752         075500     PERFORM  FAIL.                                               NC1774.2 359
   000753         075600 ADD-WRITE-F2-12.                                                 NC1774.2
   000754         075700     MOVE     "ADD-TEST-F2-12" TO PAR-NAME.                       NC1774.2 208
   000755         075800     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000756         075900 ADD-TEST-F2-13.                                                  NC1774.2
   000757         076000     MOVE     ZERO TO WRK-DS-03V10.                               NC1774.2 IMP 70
   000758         076100     ADD      A08TWOS-DS-02V06                                    NC1774.2 79
   000759         076200              A99-DS-02V00                                        NC1774.2 73
   000760         076300              -1.1111111                                          NC1774.2
   000761         076400              A03ONES-DS-02V01                                    NC1774.2 75
   000762         076500              A01ONE-DS-P0801                                     NC1774.2 81
   000763         076600              +.11111111                                          NC1774.2
   000764         076700              A06ONES-DS-03V03 GIVING WRK-DS-03V10.               NC1774.2 77 70
   000765         076800     IF       WRK-DS-03V10 EQUAL TO 242.4332220110                NC1774.2 70
   000766      1  076900              PERFORM PASS GO TO ADD-WRITE-F2-13.                 NC1774.2 358 775
   000767         077000     GO       TO ADD-FAIL-F2-13.                                  NC1774.2 771
   000768         077100 ADD-DELETE-F2-13.                                                NC1774.2
   000769         077200     PERFORM  DE-LETE.                                            NC1774.2 360
   000770         077300     GO       TO ADD-WRITE-F2-13.                                 NC1774.2 775
   000771         077400 ADD-FAIL-F2-13.                                                  NC1774.2
   000772         077500     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1774.2 70 223
   000773         077600     MOVE     242.4332220110 TO CORRECT-4V14.                     NC1774.2 236
   000774         077700     PERFORM  FAIL.                                               NC1774.2 359
   000775         077800 ADD-WRITE-F2-13.                                                 NC1774.2
   000776         077900     MOVE     "ADD-TEST-F2-13" TO PAR-NAME.                       NC1774.2 208
   000777         078000     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000778         078100 ADD-TEST-F2-14.                                                  NC1774.2
   000779         078200     ADD ADD-12 ADD-13 GIVING ADD-14.                             NC1774.2 99 100 101
   000780         078300     IF       ADD-14 EQUAL TO 100.001                             NC1774.2 101
   000781      1  078400              PERFORM PASS GO TO ADD-WRITE-F2-14.                 NC1774.2 358 790
   000782         078500     GO       TO ADD-FAIL-F2-14.                                  NC1774.2 786
   000783         078600 ADD-DELETE-F2-14.                                                NC1774.2
   000784         078700     PERFORM DE-LETE.                                             NC1774.2 360
   000785         078800     GO       TO ADD-WRITE-F2-14.                                 NC1774.2 790
   000786         078900 ADD-FAIL-F2-14.                                                  NC1774.2
   000787         079000     MOVE     ADD-14  TO COMPUTED-N.                              NC1774.2 101 220
   000788         079100     MOVE     100.001   TO CORRECT-N.                             NC1774.2 234
   000789         079200     PERFORM FAIL.                                                NC1774.2 359
   000790         079300 ADD-WRITE-F2-14.                                                 NC1774.2
   000791         079400     MOVE     "ADD-TEST-F2-14" TO PAR-NAME.                       NC1774.2 208
   000792         079500     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000793         079600 ADD-TEST-F2-15-1.                                                NC1774.2
   000794         079700     MOVE SPACE TO SIZE-ERR.                                      NC1774.2 IMP 39
   000795         079800     ADD MINUS-NAME1 MINUS-NAME2 -34 -1 PLUS-NAME1                NC1774.2 190 191 193
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900         PLUS-NAME2 EVEN-NAME1 35  GIVING WHOLE-FIELD             NC1774.2 194 192 200
   000797      1  080000         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1774.2 39
   000798         080100     IF WHOLE-FIELD EQUAL TO +1                                   NC1774.2 200
   000799      1  080200         PERFORM PASS                                             NC1774.2 358
   000800      1  080300         GO TO ADD-WRITE-F2-15-1.                                 NC1774.2 807
   000801         080400     MOVE WHOLE-FIELD TO COMPUTED-18V0.                           NC1774.2 200 226
   000802         080500     MOVE +1 TO CORRECT-18V0.                                     NC1774.2 239
   000803         080600     PERFORM FAIL.                                                NC1774.2 359
   000804         080700     GO TO ADD-WRITE-F2-15-1.                                     NC1774.2 807
   000805         080800 ADD-DELETE-F2-15-1.                                              NC1774.2
   000806         080900     PERFORM DE-LETE.                                             NC1774.2 360
   000807         081000 ADD-WRITE-F2-15-1.                                               NC1774.2
   000808         081100     MOVE "ADD-TEST-F2-15-1" TO PAR-NAME.                         NC1774.2 208
   000809         081200     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000810         081300 ADD-TEST-F2-15-2.                                                NC1774.2
   000811         081400     IF SIZE-ERR EQUAL TO "1"                                     NC1774.2 39
   000812      1  081500         PERFORM FAIL                                             NC1774.2 359
   000813      1  081600         MOVE SPACE TO CORRECT-A                                  NC1774.2 IMP 233
   000814      1  081700         MOVE 1 TO COMPUTED-A                                     NC1774.2 219
   000815      1  081800         MOVE    "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK   NC1774.2 213
   000816      1  081900         GO TO ADD-WRITE-F2-15-2.                                 NC1774.2 821
   000817         082000     PERFORM PASS.                                                NC1774.2 358
   000818         082100     GO TO ADD-WRITE-F2-15-2.                                     NC1774.2 821
   000819         082200 ADD-DELETE-F2-15-2.                                              NC1774.2
   000820         082300     PERFORM DE-LETE.                                             NC1774.2 360
   000821         082400 ADD-WRITE-F2-15-2.                                               NC1774.2
   000822         082500     MOVE "ADD-TEST-F2-15-2" TO PAR-NAME.                         NC1774.2 208
   000823         082600     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000824         082700 ADD-TEST-F2-16-1.                                                NC1774.2
   000825         082800     MOVE SPACE TO SIZE-ERR.                                      NC1774.2 IMP 39
   000826         082900     ADD MINUS-NAME3 MINUS-NAME4 -.34 -.01 PLUS-NAME3             NC1774.2 195 196 198
   000827         083000         PLUS-NAME4 EVEN-NAME2 .35  GIVING DECMAL-FIELD           NC1774.2 199 197 201
   000828      1  083100         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1774.2 39
   000829         083200     IF DECMAL-FIELD EQUAL TO +.1                                 NC1774.2 201
   000830      1  083300         PERFORM PASS                                             NC1774.2 358
   000831      1  083400         GO TO ADD-WRITE-F2-16-1.                                 NC1774.2 838
   000832         083500     MOVE DECMAL-FIELD TO COMPUTED-0V18.                          NC1774.2 201 222
   000833         083600     MOVE +.1 TO CORRECT-0V18.                                    NC1774.2 235
   000834         083700     PERFORM FAIL.                                                NC1774.2 359
   000835         083800     GO TO ADD-WRITE-F2-16-1.                                     NC1774.2 838
   000836         083900 ADD-DELETE-F2-16-1.                                              NC1774.2
   000837         084000     PERFORM DE-LETE.                                             NC1774.2 360
   000838         084100 ADD-WRITE-F2-16-1.                                               NC1774.2
   000839         084200     MOVE "ADD-TEST-F2-16-1" TO PAR-NAME.                         NC1774.2 208
   000840         084300     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000841         084400 ADD-TEST-F2-16-2.                                                NC1774.2
   000842         084500     IF SIZE-ERR EQUAL TO "1"                                     NC1774.2 39
   000843      1  084600         PERFORM FAIL                                             NC1774.2 359
   000844      1  084700         MOVE SPACE TO CORRECT-A                                  NC1774.2 IMP 233
   000845      1  084800         MOVE 1 TO COMPUTED-A                                     NC1774.2 219
   000846      1  084900         MOVE "SIZE ERROR PRECEDING TEST  " TO RE-MARK            NC1774.2 213
   000847      1  085000         GO TO ADD-WRITE-F2-16-2.                                 NC1774.2 852
   000848         085100     PERFORM PASS.                                                NC1774.2 358
   000849         085200     GO TO ADD-WRITE-F2-16-2.                                     NC1774.2 852
   000850         085300 ADD-DELETE-F2-16-2.                                              NC1774.2
   000851         085400     PERFORM DE-LETE.                                             NC1774.2 360
   000852         085500 ADD-WRITE-F2-16-2.                                               NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     MOVE "ADD-TEST-F2-16-2" TO PAR-NAME.                         NC1774.2 208
   000854         085700     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000855         085800 ADD-TEST-F2-17.                                                  NC1774.2
   000856         085900     MOVE ZERO TO WRK-CS-18V00.                                   NC1774.2 IMP 83
   000857         086000     ADD A18ONES-CS-18V00  A18ONES-DS-18V00 GIVING WRK-CS-18V00.  NC1774.2 84 45 83
   000858         086100     IF WRK-CS-18V00 EQUAL TO 222222222222222222                  NC1774.2 83
   000859      1  086200         PERFORM PASS                                             NC1774.2 358
   000860      1  086300         GO TO ADD-WRITE-F2-17.                                   NC1774.2 867
   000861         086400     MOVE 222222222222222222 TO CORRECT-18V0.                     NC1774.2 239
   000862         086500     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1774.2 83 226
   000863         086600     PERFORM FAIL.                                                NC1774.2 359
   000864         086700     GO TO ADD-WRITE-F2-17.                                       NC1774.2 867
   000865         086800 ADD-DELETE-F2-17.                                                NC1774.2
   000866         086900     PERFORM DE-LETE.                                             NC1774.2 360
   000867         087000 ADD-WRITE-F2-17.                                                 NC1774.2
   000868         087100     MOVE "ADD-TEST-F2-17 " TO PAR-NAME.                          NC1774.2 208
   000869         087200     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000870         087300 ADD-TEST-F2-18.                                                  NC1774.2
   000871         087400     MOVE ZERO TO WRK-CS-18V00.                                   NC1774.2 IMP 83
   000872         087500     ADD A18FIVES-CS-18V00  A18SIXES-CS-18V00 GIVING              NC1774.2 125 127
   000873         087600             WRK-CS-18V00.                                        NC1774.2 83
   000874         087700     IF WRK-CS-18V00 EQUAL TO 111111111111111111                  NC1774.2 83
   000875      1  087800         PERFORM PASS                                             NC1774.2 358
   000876      1  087900         GO TO ADD-WRITE-F2-18.                                   NC1774.2 883
   000877         088000     MOVE 111111111111111111 TO CORRECT-18V0.                     NC1774.2 239
   000878         088100     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1774.2 83 226
   000879         088200     PERFORM FAIL.                                                NC1774.2 359
   000880         088300     GO TO ADD-WRITE-F2-18.                                       NC1774.2 883
   000881         088400 ADD-DELETE-F2-18.                                                NC1774.2
   000882         088500     PERFORM DE-LETE.                                             NC1774.2 360
   000883         088600 ADD-WRITE-F2-18.                                                 NC1774.2
   000884         088700     MOVE "ADD-TEST-F2-18 " TO PAR-NAME.                          NC1774.2 208
   000885         088800     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000886         088900 ADD-TEST-F2-19.                                                  NC1774.2
   000887         089000     MOVE ZERO TO WRK-DS-18V00.                                   NC1774.2 IMP 55
   000888         089100     ADD A18SIXES-CS-18V00  A12SEVENS-CU-18V00 GIVING             NC1774.2 127 129
   000889         089200             WRK-DS-18V00.                                        NC1774.2 55
   000890         089300     IF WRK-DS-18V00 EQUAL TO 666667444444444443                  NC1774.2 55
   000891      1  089400         PERFORM PASS                                             NC1774.2 358
   000892      1  089500         GO TO ADD-WRITE-F2-19.                                   NC1774.2 899
   000893         089600     MOVE 666667444444444443 TO CORRECT-18V0.                     NC1774.2 239
   000894         089700     MOVE WRK-DS-18V00 TO COMPUTED-18V0.                          NC1774.2 55 226
   000895         089800     PERFORM FAIL.                                                NC1774.2 359
   000896         089900     GO TO ADD-WRITE-F2-19.                                       NC1774.2 899
   000897         090000 ADD-DELETE-F2-19.                                                NC1774.2
   000898         090100     PERFORM DE-LETE.                                             NC1774.2 360
   000899         090200 ADD-WRITE-F2-19.                                                 NC1774.2
   000900         090300     MOVE "ADD-TEST-F2-19 " TO PAR-NAME.                          NC1774.2 208
   000901         090400     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000902         090500 ADD-TEST-F2-20.                                                  NC1774.2
   000903         090600     MOVE ZERO TO WRK-CS-18V00.                                   NC1774.2 IMP 83
   000904         090700     ADD A14TWOS-CS-18V00  A12THREES-CU-18V00 GIVING              NC1774.2 119 121
   000905         090800             WRK-CS-18V00 ROUNDED.                                NC1774.2 83
   000906         090900     IF WRK-CS-18V00 EQUAL TO -000021888888888889                 NC1774.2 83
   000907      1  091000         PERFORM PASS                                             NC1774.2 358
   000908      1  091100         GO TO ADD-WRITE-F2-20.                                   NC1774.2 915
   000909         091200     MOVE -000021888888888889 TO CORRECT-18V0.                    NC1774.2 239
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1774.2 83 226
   000911         091400     PERFORM FAIL.                                                NC1774.2 359
   000912         091500     GO TO ADD-WRITE-F2-20.                                       NC1774.2 915
   000913         091600 ADD-DELETE-F2-20.                                                NC1774.2
   000914         091700     PERFORM DE-LETE.                                             NC1774.2 360
   000915         091800 ADD-WRITE-F2-20.                                                 NC1774.2
   000916         091900     MOVE "ADD-TEST-F2-20 " TO PAR-NAME.                          NC1774.2 208
   000917         092000     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000918         092100 ADD-TEST-F2-21.                                                  NC1774.2
   000919         092200     MOVE ZERO TO WRK-CS-18V00.                                   NC1774.2 IMP 83
   000920         092300     ADD A14TWOS-CS-18V00  A14TWOS-CS-18V00                       NC1774.2 119 119
   000921         092400             GIVING WRK-CS-18V00.                                 NC1774.2 83
   000922         092500     IF WRK-CS-18V00 EQUAL TO -000044444444444444                 NC1774.2 83
   000923      1  092600         PERFORM PASS                                             NC1774.2 358
   000924      1  092700         GO TO ADD-WRITE-F2-21.                                   NC1774.2 931
   000925         092800     MOVE -000044444444444444 TO CORRECT-18V0.                    NC1774.2 239
   000926         092900     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1774.2 83 226
   000927         093000     PERFORM FAIL.                                                NC1774.2 359
   000928         093100     GO TO ADD-WRITE-F2-21.                                       NC1774.2 931
   000929         093200 ADD-DELETE-F2-21.                                                NC1774.2
   000930         093300     PERFORM DE-LETE.                                             NC1774.2 360
   000931         093400 ADD-WRITE-F2-21.                                                 NC1774.2
   000932         093500     MOVE "ADD-TEST-F2-21 " TO PAR-NAME.                          NC1774.2 208
   000933         093600     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000934         093700 ADD-TEST-F2-22.                                                  NC1774.2
   000935         093800     MOVE ZERO TO WRK-DU-18V00.                                   NC1774.2 IMP 131
   000936         093900     ADD A14TWOS-CS-18V00  A18FIVES-CS-18V00 GIVING               NC1774.2 119 125
   000937         094000             WRK-DU-18V00.                                        NC1774.2 131
   000938         094100     IF WRK-DU-18V00 EQUAL TO 555577777777777777                  NC1774.2 131
   000939      1  094200         PERFORM PASS                                             NC1774.2 358
   000940      1  094300         GO TO ADD-WRITE-F2-22.                                   NC1774.2 947
   000941         094400     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1774.2 131 226
   000942         094500     MOVE 555577777777777777 TO CORRECT-18V0.                     NC1774.2 239
   000943         094600     PERFORM FAIL.                                                NC1774.2 359
   000944         094700     GO TO ADD-WRITE-F2-22.                                       NC1774.2 947
   000945         094800 ADD-DELETE-F2-22.                                                NC1774.2
   000946         094900     PERFORM DE-LETE.                                             NC1774.2 360
   000947         095000 ADD-WRITE-F2-22.                                                 NC1774.2
   000948         095100     MOVE "ADD-TEST-F2-22 " TO PAR-NAME.                          NC1774.2 208
   000949         095200     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   000950         095300*                                                                 NC1774.2
   000951         095400 ADD-INIT-F2-23.                                                  NC1774.2
   000952         095500*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   000953         095600     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1774.2 264
   000954         095700     MOVE     ZERO TO WRK-DS-10V00.                               NC1774.2 IMP 47
   000955         095800 ADD-TEST-F2-23.                                                  NC1774.2
   000956         095900     ADD      A12ONES-DS-12V00                                    NC1774.2 68
   000957         096000              ZERO GIVING WRK-DS-10V00                            NC1774.2 IMP 47
   000958         096100              NOT ON SIZE ERROR                                   NC1774.2
   000959      1  096200              MOVE "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"     NC1774.2
   000960      1  096300                   TO RE-MARK                                     NC1774.2 213
   000961      1  096400              PERFORM FAIL GO TO ADD-WRITE-F2-23.                 NC1774.2 359 968
   000962         096500     GO       TO ADD-PASS-F2-23.                                  NC1774.2 966
   000963         096600 ADD-DELETE-F2-23.                                                NC1774.2
   000964         096700     PERFORM  DE-LETE.                                            NC1774.2 360
   000965         096800     GO       TO ADD-WRITE-F2-23.                                 NC1774.2 968
   000966         096900 ADD-PASS-F2-23.                                                  NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     PERFORM  PASS.                                               NC1774.2 358
   000968         097100 ADD-WRITE-F2-23.                                                 NC1774.2
   000969         097200     MOVE     "ADD-TEST-F2-23" TO PAR-NAME.                       NC1774.2 208
   000970         097300     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000971         097400*                                                                 NC1774.2
   000972         097500 ADD-INIT-F2-24.                                                  NC1774.2
   000973         097600*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   000974         097700     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1774.2 264
   000975         097800     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   000976         097900 ADD-TEST-F2-24.                                                  NC1774.2
   000977         098000     ADD      A12THREES-DS-06V06                                  NC1774.2 59
   000978         098100              333333                                              NC1774.2
   000979         098200              A06THREES-DS-03V03                                  NC1774.2 57
   000980         098300              GIVING WRK-DS-06V06 ROUNDED                         NC1774.2 61
   000981         098400              NOT ON SIZE ERROR                                   NC1774.2
   000982      1  098500              PERFORM PASS                                        NC1774.2 358
   000983      1  098600              GO TO   ADD-WRITE-F2-24.                            NC1774.2 991
   000984         098700     GO TO    ADD-FAIL-F2-24.                                     NC1774.2 988
   000985         098800 ADD-DELETE-F2-24.                                                NC1774.2
   000986         098900     PERFORM  DE-LETE.                                            NC1774.2 360
   000987         099000     GO       TO ADD-WRITE-F2-24.                                 NC1774.2 991
   000988         099100 ADD-FAIL-F2-24.                                                  NC1774.2
   000989         099200     MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED" TO RE-MARK.  NC1774.2 213
   000990         099300     PERFORM FAIL.                                                NC1774.2 359
   000991         099400 ADD-WRITE-F2-24.                                                 NC1774.2
   000992         099500     MOVE     "ADD-TEST-F2-24" TO PAR-NAME.                       NC1774.2 208
   000993         099600     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   000994         099700*                                                                 NC1774.2
   000995         099800 ADD-INIT-F2-25.                                                  NC1774.2
   000996         099900*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   000997         100000     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1774.2 264
   000998         100100     MOVE     ZERO TO WRK-DS-10V00.                               NC1774.2 IMP 47
   000999         100200 ADD-TEST-F2-25.                                                  NC1774.2
   001000         100300     ADD      A12ONES-DS-12V00                                    NC1774.2 68
   001001         100400              ZERO GIVING WRK-DS-10V00                            NC1774.2 IMP 47
   001002         100500              ON SIZE ERROR                                       NC1774.2
   001003      1  100600              GO TO ADD-PASS-F2-25                                NC1774.2 1011
   001004         100700              NOT ON SIZE ERROR                                   NC1774.2
   001005      1  100800              MOVE "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"     NC1774.2
   001006      1  100900                   TO RE-MARK                                     NC1774.2 213
   001007      1  101000              PERFORM FAIL GO TO ADD-WRITE-F2-25.                 NC1774.2 359 1013
   001008         101100 ADD-DELETE-F2-25.                                                NC1774.2
   001009         101200     PERFORM  DE-LETE.                                            NC1774.2 360
   001010         101300     GO       TO ADD-WRITE-F2-25.                                 NC1774.2 1013
   001011         101400 ADD-PASS-F2-25.                                                  NC1774.2
   001012         101500     PERFORM  PASS.                                               NC1774.2 358
   001013         101600 ADD-WRITE-F2-25.                                                 NC1774.2
   001014         101700     MOVE     "ADD-TEST-F2-25" TO PAR-NAME.                       NC1774.2 208
   001015         101800     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   001016         101900*                                                                 NC1774.2
   001017         102000 ADD-INIT-F2-26.                                                  NC1774.2
   001018         102100*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001019         102200     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1774.2 264
   001020         102300     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   001021         102400 ADD-TEST-F2-26.                                                  NC1774.2
   001022         102500     ADD      A12THREES-DS-06V06                                  NC1774.2 59
   001023         102600              333333                                              NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700              A06THREES-DS-03V03                                  NC1774.2 57
   001025         102800              GIVING WRK-DS-06V06 ROUNDED                         NC1774.2 61
   001026         102900              ON SIZE ERROR                                       NC1774.2
   001027      1  103000              GO TO    ADD-FAIL-F2-26                             NC1774.2 1034
   001028         103100              NOT ON SIZE ERROR                                   NC1774.2
   001029      1  103200              PERFORM PASS                                        NC1774.2 358
   001030      1  103300              GO TO   ADD-WRITE-F2-26.                            NC1774.2 1037
   001031         103400 ADD-DELETE-F2-26.                                                NC1774.2
   001032         103500     PERFORM  DE-LETE.                                            NC1774.2 360
   001033         103600     GO       TO ADD-WRITE-F2-26.                                 NC1774.2 1037
   001034         103700 ADD-FAIL-F2-26.                                                  NC1774.2
   001035         103800     MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED" TO RE-MARK.  NC1774.2 213
   001036         103900     PERFORM FAIL.                                                NC1774.2 359
   001037         104000 ADD-WRITE-F2-26.                                                 NC1774.2
   001038         104100     MOVE     "ADD-TEST-F2-26" TO PAR-NAME.                       NC1774.2 208
   001039         104200     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
   001040         104300*                                                                 NC1774.2
   001041         104400 ADD-INIT-F2-27.                                                  NC1774.2
   001042         104500*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001043         104600     MOVE   "VI-74 6.6.4 GR2" TO ANSI-REFERENCE.                  NC1774.2 264
   001044         104700     MOVE   "ADD-TEST-F2-27" TO PAR-NAME.                         NC1774.2 208
   001045         104800     MOVE    1    TO REC-CT.                                      NC1774.2 255
   001046         104900     MOVE    1.1  TO WRK-DU-1V1-1.                                NC1774.2 104
   001047         105000     MOVE    2.3  TO WRK-DU-1V1-2.                                NC1774.2 105
   001048         105100     MOVE    ZERO TO WRK-DU-2V0-1.                                NC1774.2 IMP 111
   001049         105200     MOVE    ZERO TO WRK-DU-2V1-1.                                NC1774.2 IMP 114
   001050         105300     MOVE    ZERO TO WRK-DU-2V0-2.                                NC1774.2 IMP 112
   001051         105400     MOVE    ZERO TO WRK-DU-2V1-2.                                NC1774.2 IMP 115
   001052         105500     MOVE    ZERO TO WRK-DU-2V0-3.                                NC1774.2 IMP 113
   001053         105600     MOVE    ZERO TO WRK-DU-2V1-3.                                NC1774.2 IMP 116
   001054         105700 ADD-GIVING-TEST-F2-27-0.                                         NC1774.2
   001055         105800     ADD WRK-DU-1V1-1 6 WRK-DU-1V1-2 GIVING WRK-DU-2V1-1          NC1774.2 104 105 114
   001056         105900         WRK-DU-2V0-1 ROUNDED WRK-DU-2V1-2 WRK-DU-2V0-2 ROUNDED   NC1774.2 111 115 112
   001057         106000         WRK-DU-2V1-3 WRK-DU-2V0-3.                               NC1774.2 116 113
   001058         106100     GO TO ADD-TEST-F2-27-1.                                      NC1774.2 1063
   001059         106200 ADD-DELETE-F2-27.                                                NC1774.2
   001060         106300     PERFORM DE-LETE.                                             NC1774.2 360
   001061         106400     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001062         106500     GO TO   ADD-INIT-F2-28.                                      NC1774.2 1099
   001063         106600 ADD-TEST-F2-27-1.                                                NC1774.2
   001064         106700     IF WRK-DU-2V1-1 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 114 358 362
   001065         106800     ELSE                                                         NC1774.2
   001066      1  106900     PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.4        NC1774.2 359 114 220
   001067      1  107000         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1774.2 234 362
   001068         107100     ADD 1 TO REC-CT.                                             NC1774.2 255
   001069         107200 ADD-TEST-F2-27-2.                                                NC1774.2
   001070         107300     IF WRK-DU-2V0-1 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 111 358 362
   001071         107400     ELSE                                                         NC1774.2
   001072      1  107500     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 9          NC1774.2 359 111 220
   001073      1  107600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001074         107700     ADD 1 TO REC-CT.                                             NC1774.2 255
   001075         107800 ADD-ADD-TEST-F2-27-3.                                            NC1774.2
   001076         107900     IF WRK-DU-2V1-2 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 115 358 362
   001077         108000     ELSE                                                         NC1774.2
   001078      1  108100     PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.4        NC1774.2 359 115 220
   001079      1  108200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001080         108300     ADD 1 TO REC-CT.                                             NC1774.2 255
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400 ADD-TEST-F2-27-4.                                                NC1774.2
   001082         108500     IF WRK-DU-2V0-2 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 112 358 362
   001083         108600     ELSE                                                         NC1774.2
   001084      1  108700     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 9          NC1774.2 359 112 220
   001085      1  108800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001086         108900     ADD 1 TO REC-CT.                                             NC1774.2 255
   001087         109000 ADD-TEST-F2-27-5.                                                NC1774.2
   001088         109100     IF WRK-DU-2V1-3 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 116 358 362
   001089         109200     ELSE                                                         NC1774.2
   001090      1  109300     PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.4        NC1774.2 359 116 220
   001091      1  109400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001092         109500     ADD 1 TO REC-CT.                                             NC1774.2 255
   001093         109600 ADD-TEST-F2-27-6.                                                NC1774.2
   001094         109700     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 113 358 362
   001095         109800     ELSE                                                         NC1774.2
   001096      1  109900     PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9          NC1774.2 359 113 220
   001097      1  110000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001098         110100*                                                                 NC1774.2
   001099         110200 ADD-INIT-F2-28.                                                  NC1774.2
   001100         110300*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001101         110400*    ==-->      SIZE ERROR        <--==                           NC1774.2
   001102         110500     MOVE   "VI-67 6.4.2"    TO ANSI-REFERENCE.                   NC1774.2 264
   001103         110600     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001104         110700     MOVE    1.1   TO WRK-DU-1V1-1.                               NC1774.2 104
   001105         110800     MOVE    2.3   TO WRK-DU-1V1-2.                               NC1774.2 105
   001106         110900     MOVE    ZERO  TO WRK-DU-2V0-1.                               NC1774.2 IMP 111
   001107         111000     MOVE    ZERO  TO WRK-DU-2V1-1.                               NC1774.2 IMP 114
   001108         111100     MOVE    ZERO  TO WRK-DU-2V0-2.                               NC1774.2 IMP 112
   001109         111200     MOVE    ZERO  TO WRK-DU-2V1-2.                               NC1774.2 IMP 115
   001110         111300     MOVE    ZERO  TO WRK-DU-2V0-3.                               NC1774.2 IMP 113
   001111         111400     MOVE    ZERO  TO WRK-DU-2V1-3.                               NC1774.2 IMP 116
   001112         111500     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001113         111600 ADD-GIVING-TEST-F2-28-0.                                         NC1774.2
   001114         111700     ADD     A17TWOS-DS-17V00                                     NC1774.2 43
   001115         111800             WRK-DU-1V1-1                                         NC1774.2 104
   001116         111900             6                                                    NC1774.2
   001117         112000             WRK-DU-1V1-2                                         NC1774.2 105
   001118         112100      GIVING WRK-DU-2V1-1                                         NC1774.2 114
   001119         112200         WRK-DU-2V0-1 ROUNDED WRK-DU-2V1-2 WRK-DU-2V0-2 ROUNDED   NC1774.2 111 115 112
   001120         112300         WRK-DU-2V1-3 WRK-DU-2V0-3                                NC1774.2 116 113
   001121         112400         ON SIZE ERROR                                            NC1774.2
   001122      1  112500            MOVE "A" TO SIZE-ERR2.                                NC1774.2 40
   001123         112600     GO TO  ADD-TEST-F2-28-1.                                     NC1774.2 1128
   001124         112700 ADD-DELETE-F2-28.                                                NC1774.2
   001125         112800     PERFORM DE-LETE.                                             NC1774.2 360
   001126         112900     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001127         113000     GO TO   ADD-INIT-F2-29.                                      NC1774.2 1183
   001128         113100 ADD-TEST-F2-28-1.                                                NC1774.2
   001129         113200     MOVE   "ADD-TEST-F2-28-1" TO PAR-NAME.                       NC1774.2 208
   001130         113300     IF WRK-DU-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 114 IMP 358 362
   001131         113400     ELSE                                                         NC1774.2
   001132      1  113500     PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE ZERO       NC1774.2 359 114 220 IMP
   001133      1  113600         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1774.2 234 362
   001134         113700     ADD 1 TO REC-CT.                                             NC1774.2 255
   001135         113800 ADD-TEST-F2-28-2.                                                NC1774.2
   001136         113900     MOVE   "ADD-TEST-F2-28-2" TO PAR-NAME.                       NC1774.2 208
   001137         114000     IF WRK-DU-2V0-1 = ZERO  PERFORM PASS PERFORM PRINT-DETAIL    NC1774.2 111 IMP 358 362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100     ELSE                                                         NC1774.2
   001139      1  114200     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE ZERO       NC1774.2 359 111 220 IMP
   001140      1  114300     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001141         114400     ADD 1 TO REC-CT.                                             NC1774.2 255
   001142         114500 ADD-ADD-TEST-F2-28-3.                                            NC1774.2
   001143         114600     MOVE   "ADD-TEST-F2-28-3" TO PAR-NAME.                       NC1774.2 208
   001144         114700     IF WRK-DU-2V1-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 115 IMP 358 362
   001145         114800     ELSE                                                         NC1774.2
   001146      1  114900     PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE ZERO       NC1774.2 359 115 220 IMP
   001147      1  115000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001148         115100     ADD 1 TO REC-CT.                                             NC1774.2 255
   001149         115200 ADD-TEST-F2-28-4.                                                NC1774.2
   001150         115300     MOVE   "ADD-TEST-F2-28-4" TO PAR-NAME.                       NC1774.2 208
   001151         115400     IF WRK-DU-2V0-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 112 IMP 358 362
   001152         115500     ELSE                                                         NC1774.2
   001153      1  115600     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE ZERO       NC1774.2 359 112 220 IMP
   001154      1  115700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001155         115800     ADD 1 TO REC-CT.                                             NC1774.2 255
   001156         115900 ADD-TEST-F2-28-5.                                                NC1774.2
   001157         116000     MOVE   "ADD-TEST-F2-28-5" TO PAR-NAME.                       NC1774.2 208
   001158         116100     IF WRK-DU-2V1-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 116 IMP 358 362
   001159         116200     ELSE                                                         NC1774.2
   001160      1  116300     PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE ZERO       NC1774.2 359 116 220 IMP
   001161      1  116400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001162         116500     ADD 1 TO REC-CT.                                             NC1774.2 255
   001163         116600 ADD-TEST-F2-28-6.                                                NC1774.2
   001164         116700     MOVE   "ADD-TEST-F2-28-6" TO PAR-NAME.                       NC1774.2 208
   001165         116800     IF WRK-DU-2V0-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 113 IMP 358 362
   001166         116900     ELSE                                                         NC1774.2
   001167      1  117000     PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE ZERO       NC1774.2 359 113 220 IMP
   001168      1  117100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001169         117200     ADD 1 TO REC-CT.                                             NC1774.2 255
   001170         117300 ADD-TEST-F2-28-7.                                                NC1774.2
   001171         117400     MOVE   "ADD-TEST-F2-28-7" TO PAR-NAME.                       NC1774.2 208
   001172         117500     IF      SIZE-ERR2 = "A"                                      NC1774.2 40
   001173      1  117600             PERFORM PASS                                         NC1774.2 358
   001174      1  117700             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001175         117800     ELSE                                                         NC1774.2
   001176      1  117900             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1774.2
   001177      1  118000                  TO RE-MARK                                      NC1774.2 213
   001178      1  118100             MOVE   "A"        TO CORRECT-X                       NC1774.2 232
   001179      1  118200             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001180      1  118300             PERFORM FAIL                                         NC1774.2 359
   001181      1  118400             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001182         118500*                                                                 NC1774.2
   001183         118600 ADD-INIT-F2-29.                                                  NC1774.2
   001184         118700*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001185         118800*    ==-->   NO SIZE ERROR        <--==                           NC1774.2
   001186         118900     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1774.2 264
   001187         119000     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001188         119100     MOVE    1.1   TO WRK-DU-1V1-1.                               NC1774.2 104
   001189         119200     MOVE    2.3   TO WRK-DU-1V1-2.                               NC1774.2 105
   001190         119300     MOVE    ZERO  TO WRK-DU-2V0-1.                               NC1774.2 IMP 111
   001191         119400     MOVE    ZERO  TO WRK-DU-2V1-1.                               NC1774.2 IMP 114
   001192         119500     MOVE    ZERO  TO WRK-DU-2V0-2.                               NC1774.2 IMP 112
   001193         119600     MOVE    ZERO  TO WRK-DU-2V1-2.                               NC1774.2 IMP 115
   001194         119700     MOVE    ZERO  TO WRK-DU-2V0-3.                               NC1774.2 IMP 113
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     MOVE    ZERO  TO WRK-DU-2V1-3.                               NC1774.2 IMP 116
   001196         119900     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001197         120000 ADD-GIVING-TEST-F2-29-0.                                         NC1774.2
   001198         120100     ADD WRK-DU-1V1-1 6 WRK-DU-1V1-2 GIVING WRK-DU-2V1-1          NC1774.2 104 105 114
   001199         120200         WRK-DU-2V0-1 ROUNDED WRK-DU-2V1-2 WRK-DU-2V0-2 ROUNDED   NC1774.2 111 115 112
   001200         120300         WRK-DU-2V1-3 WRK-DU-2V0-3                                NC1774.2 116 113
   001201         120400         ON SIZE ERROR                                            NC1774.2
   001202      1  120500            MOVE "A" TO SIZE-ERR2.                                NC1774.2 40
   001203         120600     GO TO  ADD-TEST-F2-29-1.                                     NC1774.2 1208
   001204         120700 ADD-DELETE-F2-29.                                                NC1774.2
   001205         120800     PERFORM DE-LETE.                                             NC1774.2 360
   001206         120900     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001207         121000     GO TO   ADD-INIT-F2-30.                                      NC1774.2 1263
   001208         121100 ADD-TEST-F2-29-1.                                                NC1774.2
   001209         121200     MOVE   "ADD-TEST-F2-29-1" TO PAR-NAME.                       NC1774.2 208
   001210         121300     IF WRK-DU-2V1-1 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 114 358 362
   001211         121400     ELSE                                                         NC1774.2
   001212      1  121500     PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.4        NC1774.2 359 114 220
   001213      1  121600         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1774.2 234 362
   001214         121700     ADD 1 TO REC-CT.                                             NC1774.2 255
   001215         121800 ADD-TEST-F2-29-2.                                                NC1774.2
   001216         121900     MOVE   "ADD-TEST-F2-29-2" TO PAR-NAME.                       NC1774.2 208
   001217         122000     IF WRK-DU-2V0-1 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 111 358 362
   001218         122100     ELSE                                                         NC1774.2
   001219      1  122200     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 9          NC1774.2 359 111 220
   001220      1  122300     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001221         122400     ADD 1 TO REC-CT.                                             NC1774.2 255
   001222         122500 ADD-ADD-TEST-F2-29-3.                                            NC1774.2
   001223         122600     MOVE   "ADD-TEST-F2-29-3" TO PAR-NAME.                       NC1774.2 208
   001224         122700     IF WRK-DU-2V1-2 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 115 358 362
   001225         122800     ELSE                                                         NC1774.2
   001226      1  122900     PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.4        NC1774.2 359 115 220
   001227      1  123000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001228         123100     ADD 1 TO REC-CT.                                             NC1774.2 255
   001229         123200 ADD-TEST-F2-29-4.                                                NC1774.2
   001230         123300     MOVE   "ADD-TEST-F2-29-4" TO PAR-NAME.                       NC1774.2 208
   001231         123400     IF WRK-DU-2V0-2 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 112 358 362
   001232         123500     ELSE                                                         NC1774.2
   001233      1  123600     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 9          NC1774.2 359 112 220
   001234      1  123700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001235         123800     ADD 1 TO REC-CT.                                             NC1774.2 255
   001236         123900 ADD-TEST-F2-29-5.                                                NC1774.2
   001237         124000     MOVE   "ADD-TEST-F2-29-5" TO PAR-NAME.                       NC1774.2 208
   001238         124100     IF WRK-DU-2V1-3 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 116 358 362
   001239         124200     ELSE                                                         NC1774.2
   001240      1  124300     PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.4        NC1774.2 359 116 220
   001241      1  124400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001242         124500     ADD 1 TO REC-CT.                                             NC1774.2 255
   001243         124600 ADD-TEST-F2-29-6.                                                NC1774.2
   001244         124700     MOVE   "ADD-TEST-F2-29-6" TO PAR-NAME.                       NC1774.2 208
   001245         124800     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 113 358 362
   001246         124900     ELSE                                                         NC1774.2
   001247      1  125000     PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9          NC1774.2 359 113 220
   001248      1  125100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001249         125200     ADD 1 TO REC-CT.                                             NC1774.2 255
   001250         125300 ADD-TEST-F2-29-7.                                                NC1774.2
   001251         125400     MOVE   "ADD-TEST-F2-29-7" TO PAR-NAME.                       NC1774.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     IF      SIZE-ERR2 = SPACE                                    NC1774.2 40 IMP
   001253      1  125600             PERFORM PASS                                         NC1774.2 358
   001254      1  125700             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001255         125800     ELSE                                                         NC1774.2
   001256      1  125900             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1774.2
   001257      1  126000                  TO RE-MARK                                      NC1774.2 213
   001258      1  126100             MOVE    SPACE     TO CORRECT-X                       NC1774.2 IMP 232
   001259      1  126200             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001260      1  126300             PERFORM FAIL                                         NC1774.2 359
   001261      1  126400             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001262         126500*                                                                 NC1774.2
   001263         126600 ADD-INIT-F2-30.                                                  NC1774.2
   001264         126700*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001265         126800*    ==-->      SIZE ERROR        <--==                           NC1774.2
   001266         126900     MOVE   "VI-67 6.4.2"    TO ANSI-REFERENCE.                   NC1774.2 264
   001267         127000     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001268         127100     MOVE    1.1   TO WRK-DU-1V1-1.                               NC1774.2 104
   001269         127200     MOVE    2.3   TO WRK-DU-1V1-2.                               NC1774.2 105
   001270         127300     MOVE    ZERO  TO WRK-DU-2V0-1.                               NC1774.2 IMP 111
   001271         127400     MOVE    ZERO  TO WRK-DU-2V1-1.                               NC1774.2 IMP 114
   001272         127500     MOVE    ZERO  TO WRK-DU-2V0-2.                               NC1774.2 IMP 112
   001273         127600     MOVE    ZERO  TO WRK-DU-2V1-2.                               NC1774.2 IMP 115
   001274         127700     MOVE    ZERO  TO WRK-DU-2V0-3.                               NC1774.2 IMP 113
   001275         127800     MOVE    ZERO  TO WRK-DU-2V1-3.                               NC1774.2 IMP 116
   001276         127900     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001277         128000 ADD-GIVING-TEST-F2-30-0.                                         NC1774.2
   001278         128100     ADD     A17TWOS-DS-17V00                                     NC1774.2 43
   001279         128200             WRK-DU-1V1-1                                         NC1774.2 104
   001280         128300             6                                                    NC1774.2
   001281         128400             WRK-DU-1V1-2                                         NC1774.2 105
   001282         128500      GIVING WRK-DU-2V1-1                                         NC1774.2 114
   001283         128600         WRK-DU-2V0-1 ROUNDED WRK-DU-2V1-2 WRK-DU-2V0-2 ROUNDED   NC1774.2 111 115 112
   001284         128700         WRK-DU-2V1-3 WRK-DU-2V0-3                                NC1774.2 116 113
   001285         128800      NOT ON SIZE ERROR                                           NC1774.2
   001286      1  128900             MOVE "A" TO SIZE-ERR2.                               NC1774.2 40
   001287         129000     GO TO   ADD-TEST-F2-30-1.                                    NC1774.2 1292
   001288         129100 ADD-DELETE-F2-30.                                                NC1774.2
   001289         129200     PERFORM DE-LETE.                                             NC1774.2 360
   001290         129300     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001291         129400     GO TO   ADD-INIT-F2-31.                                      NC1774.2 1347
   001292         129500 ADD-TEST-F2-30-1.                                                NC1774.2
   001293         129600     MOVE   "ADD-TEST-F2-30-1" TO PAR-NAME.                       NC1774.2 208
   001294         129700     IF WRK-DU-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 114 IMP 358 362
   001295         129800     ELSE                                                         NC1774.2
   001296      1  129900     PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE ZERO       NC1774.2 359 114 220 IMP
   001297      1  130000         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1774.2 234 362
   001298         130100     ADD 1 TO REC-CT.                                             NC1774.2 255
   001299         130200 ADD-TEST-F2-30-2.                                                NC1774.2
   001300         130300     MOVE   "ADD-TEST-F2-30-2" TO PAR-NAME.                       NC1774.2 208
   001301         130400     IF WRK-DU-2V0-1 = ZERO  PERFORM PASS PERFORM PRINT-DETAIL    NC1774.2 111 IMP 358 362
   001302         130500     ELSE                                                         NC1774.2
   001303      1  130600     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE ZERO       NC1774.2 359 111 220 IMP
   001304      1  130700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001305         130800     ADD 1 TO REC-CT.                                             NC1774.2 255
   001306         130900 ADD-ADD-TEST-F2-30-3.                                            NC1774.2
   001307         131000     MOVE   "ADD-TEST-F2-30-3" TO PAR-NAME.                       NC1774.2 208
   001308         131100     IF WRK-DU-2V1-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 115 IMP 358 362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     ELSE                                                         NC1774.2
   001310      1  131300     PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE ZERO       NC1774.2 359 115 220 IMP
   001311      1  131400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001312         131500     ADD 1 TO REC-CT.                                             NC1774.2 255
   001313         131600 ADD-TEST-F2-30-4.                                                NC1774.2
   001314         131700     MOVE   "ADD-TEST-F2-30-4" TO PAR-NAME.                       NC1774.2 208
   001315         131800     IF WRK-DU-2V0-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 112 IMP 358 362
   001316         131900     ELSE                                                         NC1774.2
   001317      1  132000     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE ZERO       NC1774.2 359 112 220 IMP
   001318      1  132100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001319         132200     ADD 1 TO REC-CT.                                             NC1774.2 255
   001320         132300 ADD-TEST-F2-30-5.                                                NC1774.2
   001321         132400     MOVE   "ADD-TEST-F2-30-5" TO PAR-NAME.                       NC1774.2 208
   001322         132500     IF WRK-DU-2V1-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 116 IMP 358 362
   001323         132600     ELSE                                                         NC1774.2
   001324      1  132700     PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE ZERO       NC1774.2 359 116 220 IMP
   001325      1  132800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001326         132900     ADD 1 TO REC-CT.                                             NC1774.2 255
   001327         133000 ADD-TEST-F2-30-6.                                                NC1774.2
   001328         133100     MOVE   "ADD-TEST-F2-30-6" TO PAR-NAME.                       NC1774.2 208
   001329         133200     IF WRK-DU-2V0-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 113 IMP 358 362
   001330         133300     ELSE                                                         NC1774.2
   001331      1  133400     PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE ZERO       NC1774.2 359 113 220 IMP
   001332      1  133500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001333         133600     ADD 1 TO REC-CT.                                             NC1774.2 255
   001334         133700 ADD-TEST-F2-30-7.                                                NC1774.2
   001335         133800     MOVE   "ADD-TEST-F2-30-7" TO PAR-NAME.                       NC1774.2 208
   001336         133900     IF      SIZE-ERR2 = SPACE                                    NC1774.2 40 IMP
   001337      1  134000             PERFORM PASS                                         NC1774.2 358
   001338      1  134100             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001339         134200     ELSE                                                         NC1774.2
   001340      1  134300             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1774.2
   001341      1  134400                  TO RE-MARK                                      NC1774.2 213
   001342      1  134500             MOVE    SPACE     TO CORRECT-X                       NC1774.2 IMP 232
   001343      1  134600             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001344      1  134700             PERFORM FAIL                                         NC1774.2 359
   001345      1  134800             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001346         134900*                                                                 NC1774.2
   001347         135000 ADD-INIT-F2-31.                                                  NC1774.2
   001348         135100*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001349         135200*    ==-->   NO SIZE ERROR        <--==                           NC1774.2
   001350         135300     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1774.2 264
   001351         135400     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001352         135500     MOVE    1.1   TO WRK-DU-1V1-1.                               NC1774.2 104
   001353         135600     MOVE    2.3   TO WRK-DU-1V1-2.                               NC1774.2 105
   001354         135700     MOVE    ZERO  TO WRK-DU-2V0-1.                               NC1774.2 IMP 111
   001355         135800     MOVE    ZERO  TO WRK-DU-2V1-1.                               NC1774.2 IMP 114
   001356         135900     MOVE    ZERO  TO WRK-DU-2V0-2.                               NC1774.2 IMP 112
   001357         136000     MOVE    ZERO  TO WRK-DU-2V1-2.                               NC1774.2 IMP 115
   001358         136100     MOVE    ZERO  TO WRK-DU-2V0-3.                               NC1774.2 IMP 113
   001359         136200     MOVE    ZERO  TO WRK-DU-2V1-3.                               NC1774.2 IMP 116
   001360         136300     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001361         136400 ADD-GIVING-TEST-F2-31-0.                                         NC1774.2
   001362         136500     ADD WRK-DU-1V1-1 6 WRK-DU-1V1-2 GIVING WRK-DU-2V1-1          NC1774.2 104 105 114
   001363         136600         WRK-DU-2V0-1 ROUNDED WRK-DU-2V1-2 WRK-DU-2V0-2 ROUNDED   NC1774.2 111 115 112
   001364         136700         WRK-DU-2V1-3 WRK-DU-2V0-3                                NC1774.2 116 113
   001365         136800      NOT ON SIZE ERROR                                           NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366      1  136900             MOVE "A" TO SIZE-ERR2.                               NC1774.2 40
   001367         137000     GO TO   ADD-TEST-F2-31-1.                                    NC1774.2 1372
   001368         137100 ADD-DELETE-F2-31.                                                NC1774.2
   001369         137200     PERFORM DE-LETE.                                             NC1774.2 360
   001370         137300     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001371         137400     GO TO   ADD-INIT-F2-32.                                      NC1774.2 1427
   001372         137500 ADD-TEST-F2-31-1.                                                NC1774.2
   001373         137600     MOVE   "ADD-TEST-F2-31-1" TO PAR-NAME.                       NC1774.2 208
   001374         137700     IF WRK-DU-2V1-1 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 114 358 362
   001375         137800     ELSE                                                         NC1774.2
   001376      1  137900     PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.4        NC1774.2 359 114 220
   001377      1  138000         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1774.2 234 362
   001378         138100     ADD 1 TO REC-CT.                                             NC1774.2 255
   001379         138200 ADD-TEST-F2-31-2.                                                NC1774.2
   001380         138300     MOVE   "ADD-TEST-F2-31-2" TO PAR-NAME.                       NC1774.2 208
   001381         138400     IF WRK-DU-2V0-1 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 111 358 362
   001382         138500     ELSE                                                         NC1774.2
   001383      1  138600     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 9          NC1774.2 359 111 220
   001384      1  138700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001385         138800     ADD 1 TO REC-CT.                                             NC1774.2 255
   001386         138900 ADD-ADD-TEST-F2-31-3.                                            NC1774.2
   001387         139000     MOVE   "ADD-TEST-F2-31-3" TO PAR-NAME.                       NC1774.2 208
   001388         139100     IF WRK-DU-2V1-2 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 115 358 362
   001389         139200     ELSE                                                         NC1774.2
   001390      1  139300     PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.4        NC1774.2 359 115 220
   001391      1  139400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001392         139500     ADD 1 TO REC-CT.                                             NC1774.2 255
   001393         139600 ADD-TEST-F2-31-4.                                                NC1774.2
   001394         139700     MOVE   "ADD-TEST-F2-31-4" TO PAR-NAME.                       NC1774.2 208
   001395         139800     IF WRK-DU-2V0-2 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 112 358 362
   001396         139900     ELSE                                                         NC1774.2
   001397      1  140000     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 9          NC1774.2 359 112 220
   001398      1  140100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001399         140200     ADD 1 TO REC-CT.                                             NC1774.2 255
   001400         140300 ADD-TEST-F2-31-5.                                                NC1774.2
   001401         140400     MOVE   "ADD-TEST-F2-31-5" TO PAR-NAME.                       NC1774.2 208
   001402         140500     IF WRK-DU-2V1-3 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 116 358 362
   001403         140600     ELSE                                                         NC1774.2
   001404      1  140700     PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.4        NC1774.2 359 116 220
   001405      1  140800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001406         140900     ADD 1 TO REC-CT.                                             NC1774.2 255
   001407         141000 ADD-TEST-F2-31-6.                                                NC1774.2
   001408         141100     MOVE   "ADD-TEST-F2-31-6" TO PAR-NAME.                       NC1774.2 208
   001409         141200     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 113 358 362
   001410         141300     ELSE                                                         NC1774.2
   001411      1  141400     PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9          NC1774.2 359 113 220
   001412      1  141500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001413         141600     ADD 1 TO REC-CT.                                             NC1774.2 255
   001414         141700 ADD-TEST-F2-31-7.                                                NC1774.2
   001415         141800     MOVE   "ADD-TEST-F2-31-7" TO PAR-NAME.                       NC1774.2 208
   001416         141900     IF      SIZE-ERR2 = "A"                                      NC1774.2 40
   001417      1  142000             PERFORM PASS                                         NC1774.2 358
   001418      1  142100             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001419         142200     ELSE                                                         NC1774.2
   001420      1  142300             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1774.2
   001421      1  142400                  TO RE-MARK                                      NC1774.2 213
   001422      1  142500             MOVE   "A"        TO CORRECT-X                       NC1774.2 232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423      1  142600             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001424      1  142700             PERFORM FAIL                                         NC1774.2 359
   001425      1  142800             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001426         142900*                                                                 NC1774.2
   001427         143000 ADD-INIT-F2-32.                                                  NC1774.2
   001428         143100*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001429         143200*    ==-->      SIZE ERROR        <--==                           NC1774.2
   001430         143300     MOVE   "VI-67 6.4.2"    TO ANSI-REFERENCE.                   NC1774.2 264
   001431         143400     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001432         143500     MOVE    1.1   TO WRK-DU-1V1-1.                               NC1774.2 104
   001433         143600     MOVE    2.3   TO WRK-DU-1V1-2.                               NC1774.2 105
   001434         143700     MOVE    ZERO  TO WRK-DU-2V0-1.                               NC1774.2 IMP 111
   001435         143800     MOVE    ZERO  TO WRK-DU-2V1-1.                               NC1774.2 IMP 114
   001436         143900     MOVE    ZERO  TO WRK-DU-2V0-2.                               NC1774.2 IMP 112
   001437         144000     MOVE    ZERO  TO WRK-DU-2V1-2.                               NC1774.2 IMP 115
   001438         144100     MOVE    ZERO  TO WRK-DU-2V0-3.                               NC1774.2 IMP 113
   001439         144200     MOVE    ZERO  TO WRK-DU-2V1-3.                               NC1774.2 IMP 116
   001440         144300     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001441         144400 ADD-GIVING-TEST-F2-32-0.                                         NC1774.2
   001442         144500     ADD     A17TWOS-DS-17V00                                     NC1774.2 43
   001443         144600             WRK-DU-1V1-1                                         NC1774.2 104
   001444         144700             6                                                    NC1774.2
   001445         144800             WRK-DU-1V1-2                                         NC1774.2 105
   001446         144900      GIVING WRK-DU-2V1-1                                         NC1774.2 114
   001447         145000         WRK-DU-2V0-1 ROUNDED WRK-DU-2V1-2 WRK-DU-2V0-2 ROUNDED   NC1774.2 111 115 112
   001448         145100         WRK-DU-2V1-3 WRK-DU-2V0-3                                NC1774.2 116 113
   001449         145200          ON SIZE ERROR                                           NC1774.2
   001450      1  145300             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   001451         145400      NOT ON SIZE ERROR                                           NC1774.2
   001452      1  145500             MOVE "B" TO SIZE-ERR2.                               NC1774.2 40
   001453         145600     GO TO   ADD-TEST-F2-32-1.                                    NC1774.2 1458
   001454         145700 ADD-DELETE-F2-32.                                                NC1774.2
   001455         145800     PERFORM DE-LETE.                                             NC1774.2 360
   001456         145900     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001457         146000     GO TO   ADD-INIT-F2-33.                                      NC1774.2 1513
   001458         146100 ADD-TEST-F2-32-1.                                                NC1774.2
   001459         146200     MOVE   "ADD-TEST-F2-32-1" TO PAR-NAME.                       NC1774.2 208
   001460         146300     IF WRK-DU-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 114 IMP 358 362
   001461         146400     ELSE                                                         NC1774.2
   001462      1  146500     PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE ZERO       NC1774.2 359 114 220 IMP
   001463      1  146600         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1774.2 234 362
   001464         146700     ADD 1 TO REC-CT.                                             NC1774.2 255
   001465         146800 ADD-TEST-F2-32-2.                                                NC1774.2
   001466         146900     MOVE   "ADD-TEST-F2-32-2" TO PAR-NAME.                       NC1774.2 208
   001467         147000     IF WRK-DU-2V0-1 = ZERO  PERFORM PASS PERFORM PRINT-DETAIL    NC1774.2 111 IMP 358 362
   001468         147100     ELSE                                                         NC1774.2
   001469      1  147200     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE ZERO       NC1774.2 359 111 220 IMP
   001470      1  147300     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001471         147400     ADD 1 TO REC-CT.                                             NC1774.2 255
   001472         147500 ADD-ADD-TEST-F2-32-3.                                            NC1774.2
   001473         147600     MOVE   "ADD-TEST-F2-32-3" TO PAR-NAME.                       NC1774.2 208
   001474         147700     IF WRK-DU-2V1-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 115 IMP 358 362
   001475         147800     ELSE                                                         NC1774.2
   001476      1  147900     PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE ZERO       NC1774.2 359 115 220 IMP
   001477      1  148000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001478         148100     ADD 1 TO REC-CT.                                             NC1774.2 255
   001479         148200 ADD-TEST-F2-32-4.                                                NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300     MOVE   "ADD-TEST-F2-32-4" TO PAR-NAME.                       NC1774.2 208
   001481         148400     IF WRK-DU-2V0-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 112 IMP 358 362
   001482         148500     ELSE                                                         NC1774.2
   001483      1  148600     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE ZERO       NC1774.2 359 112 220 IMP
   001484      1  148700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001485         148800     ADD 1 TO REC-CT.                                             NC1774.2 255
   001486         148900 ADD-TEST-F2-32-5.                                                NC1774.2
   001487         149000     MOVE   "ADD-TEST-F2-32-5" TO PAR-NAME.                       NC1774.2 208
   001488         149100     IF WRK-DU-2V1-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 116 IMP 358 362
   001489         149200     ELSE                                                         NC1774.2
   001490      1  149300     PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE ZERO       NC1774.2 359 116 220 IMP
   001491      1  149400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001492         149500     ADD 1 TO REC-CT.                                             NC1774.2 255
   001493         149600 ADD-TEST-F2-32-6.                                                NC1774.2
   001494         149700     MOVE   "ADD-TEST-F2-32-6" TO PAR-NAME.                       NC1774.2 208
   001495         149800     IF WRK-DU-2V0-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1774.2 113 IMP 358 362
   001496         149900     ELSE                                                         NC1774.2
   001497      1  150000     PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE ZERO       NC1774.2 359 113 220 IMP
   001498      1  150100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001499         150200     ADD 1 TO REC-CT.                                             NC1774.2 255
   001500         150300 ADD-TEST-F2-32-7.                                                NC1774.2
   001501         150400     MOVE   "ADD-TEST-F2-32-7" TO PAR-NAME.                       NC1774.2 208
   001502         150500     IF      SIZE-ERR2 = "A"                                      NC1774.2 40
   001503      1  150600             PERFORM PASS                                         NC1774.2 358
   001504      1  150700             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001505         150800     ELSE                                                         NC1774.2
   001506      1  150900             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1774.2
   001507      1  151000                  TO RE-MARK                                      NC1774.2 213
   001508      1  151100             MOVE   "A"        TO CORRECT-X                       NC1774.2 232
   001509      1  151200             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001510      1  151300             PERFORM FAIL                                         NC1774.2 359
   001511      1  151400             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001512         151500*                                                                 NC1774.2
   001513         151600 ADD-INIT-F2-33.                                                  NC1774.2
   001514         151700*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1774.2
   001515         151800*    ==-->   NO SIZE ERROR        <--==                           NC1774.2
   001516         151900     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1774.2 264
   001517         152000     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001518         152100     MOVE    1.1   TO WRK-DU-1V1-1.                               NC1774.2 104
   001519         152200     MOVE    2.3   TO WRK-DU-1V1-2.                               NC1774.2 105
   001520         152300     MOVE    ZERO  TO WRK-DU-2V0-1.                               NC1774.2 IMP 111
   001521         152400     MOVE    ZERO  TO WRK-DU-2V1-1.                               NC1774.2 IMP 114
   001522         152500     MOVE    ZERO  TO WRK-DU-2V0-2.                               NC1774.2 IMP 112
   001523         152600     MOVE    ZERO  TO WRK-DU-2V1-2.                               NC1774.2 IMP 115
   001524         152700     MOVE    ZERO  TO WRK-DU-2V0-3.                               NC1774.2 IMP 113
   001525         152800     MOVE    ZERO  TO WRK-DU-2V1-3.                               NC1774.2 IMP 116
   001526         152900     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001527         153000 ADD-GIVING-TEST-F2-33-0.                                         NC1774.2
   001528         153100     ADD WRK-DU-1V1-1 6 WRK-DU-1V1-2 GIVING WRK-DU-2V1-1          NC1774.2 104 105 114
   001529         153200         WRK-DU-2V0-1 ROUNDED WRK-DU-2V1-2 WRK-DU-2V0-2 ROUNDED   NC1774.2 111 115 112
   001530         153300         WRK-DU-2V1-3 WRK-DU-2V0-3                                NC1774.2 116 113
   001531         153400          ON SIZE ERROR                                           NC1774.2
   001532      1  153500             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   001533         153600      NOT ON SIZE ERROR                                           NC1774.2
   001534      1  153700             MOVE "B" TO SIZE-ERR2.                               NC1774.2 40
   001535         153800     GO TO   ADD-TEST-F2-33-1.                                    NC1774.2 1540
   001536         153900 ADD-DELETE-F2-33.                                                NC1774.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154000     PERFORM DE-LETE.                                             NC1774.2 360
   001538         154100     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001539         154200     GO TO   ADD-INIT-F2-34.                                      NC1774.2 1595
   001540         154300 ADD-TEST-F2-33-1.                                                NC1774.2
   001541         154400     MOVE   "ADD-TEST-F2-33-1" TO PAR-NAME.                       NC1774.2 208
   001542         154500     IF WRK-DU-2V1-1 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 114 358 362
   001543         154600     ELSE                                                         NC1774.2
   001544      1  154700     PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.4        NC1774.2 359 114 220
   001545      1  154800         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1774.2 234 362
   001546         154900     ADD 1 TO REC-CT.                                             NC1774.2 255
   001547         155000 ADD-TEST-F2-33-2.                                                NC1774.2
   001548         155100     MOVE   "ADD-TEST-F2-33-2" TO PAR-NAME.                       NC1774.2 208
   001549         155200     IF WRK-DU-2V0-1 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 111 358 362
   001550         155300     ELSE                                                         NC1774.2
   001551      1  155400     PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 9          NC1774.2 359 111 220
   001552      1  155500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001553         155600     ADD 1 TO REC-CT.                                             NC1774.2 255
   001554         155700 ADD-ADD-TEST-F2-33-3.                                            NC1774.2
   001555         155800     MOVE   "ADD-TEST-F2-33-3" TO PAR-NAME.                       NC1774.2 208
   001556         155900     IF WRK-DU-2V1-2 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 115 358 362
   001557         156000     ELSE                                                         NC1774.2
   001558      1  156100     PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.4        NC1774.2 359 115 220
   001559      1  156200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001560         156300     ADD 1 TO REC-CT.                                             NC1774.2 255
   001561         156400 ADD-TEST-F2-33-4.                                                NC1774.2
   001562         156500     MOVE   "ADD-TEST-F2-33-4" TO PAR-NAME.                       NC1774.2 208
   001563         156600     IF WRK-DU-2V0-2 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 112 358 362
   001564         156700     ELSE                                                         NC1774.2
   001565      1  156800     PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 9          NC1774.2 359 112 220
   001566      1  156900     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001567         157000     ADD 1 TO REC-CT.                                             NC1774.2 255
   001568         157100 ADD-TEST-F2-33-5.                                                NC1774.2
   001569         157200     MOVE   "ADD-TEST-F2-33-5" TO PAR-NAME.                       NC1774.2 208
   001570         157300     IF WRK-DU-2V1-3 = 9.4 PERFORM PASS PERFORM PRINT-DETAIL      NC1774.2 116 358 362
   001571         157400     ELSE                                                         NC1774.2
   001572      1  157500     PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.4        NC1774.2 359 116 220
   001573      1  157600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001574         157700     ADD 1 TO REC-CT.                                             NC1774.2 255
   001575         157800 ADD-TEST-F2-33-6.                                                NC1774.2
   001576         157900     MOVE   "ADD-TEST-F2-33-6" TO PAR-NAME.                       NC1774.2 208
   001577         158000     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1774.2 113 358 362
   001578         158100     ELSE                                                         NC1774.2
   001579      1  158200     PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9          NC1774.2 359 113 220
   001580      1  158300     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1774.2 234 362
   001581         158400     ADD 1 TO REC-CT.                                             NC1774.2 255
   001582         158500 ADD-TEST-F2-33-7.                                                NC1774.2
   001583         158600     MOVE   "ADD-TEST-F2-33-7" TO PAR-NAME.                       NC1774.2 208
   001584         158700     IF      SIZE-ERR2 = "B"                                      NC1774.2 40
   001585      1  158800             PERFORM PASS                                         NC1774.2 358
   001586      1  158900             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001587         159000     ELSE                                                         NC1774.2
   001588      1  159100             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1774.2
   001589      1  159200                  TO RE-MARK                                      NC1774.2 213
   001590      1  159300             MOVE   "B"        TO CORRECT-X                       NC1774.2 232
   001591      1  159400             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001592      1  159500             PERFORM FAIL                                         NC1774.2 359
   001593      1  159600             PERFORM PRINT-DETAIL.                                NC1774.2 362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700*                                                                 NC1774.2
   001595         159800 ADD-INIT-F2-34.                                                  NC1774.2
   001596         159900*    ==-->EXPLICIT SCOPE TERMINATOR<--==                          NC1774.2
   001597         160000*    ==-->      SIZE ERROR        <--==                           NC1774.2
   001598         160100     MOVE   "VI-67 6.4.3" TO ANSI-REFERENCE.                      NC1774.2 264
   001599         160200     MOVE   "ADD-TEST-F2-34" TO PAR-NAME.                         NC1774.2 208
   001600         160300     MOVE    ZERO  TO WRK-DS-10V00.                               NC1774.2 IMP 47
   001601         160400     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001602         160500     MOVE    SPACE TO WRK-XN-00001.                               NC1774.2 IMP 98
   001603         160600     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001604         160700     MOVE    SPACE TO SIZE-ERR3.                                  NC1774.2 IMP 41
   001605         160800     MOVE    SPACE TO SIZE-ERR4.                                  NC1774.2 IMP 42
   001606         160900 ADD-TEST-F2-34-0.                                                NC1774.2
   001607         161000     ADD     A12ONES-DS-12V00                                     NC1774.2 68
   001608         161100             ZERO                                                 NC1774.2 IMP
   001609         161200      GIVING WRK-DS-10V00                                         NC1774.2 47
   001610         161300          ON SIZE ERROR                                           NC1774.2
   001611      1  161400             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   001612      1  161500             MOVE "B" TO SIZE-ERR3                                NC1774.2 41
   001613      1  161600             MOVE "C" TO SIZE-ERR4                                NC1774.2 42
   001614         161700     END-ADD                                                      NC1774.2
   001615         161800     MOVE   "1" TO WRK-XN-00001.                                  NC1774.2 98
   001616         161900     GO TO   ADD-TEST-F2-34-1.                                    NC1774.2 1621
   001617         162000 ADD-DELETE-F2-34.                                                NC1774.2
   001618         162100     PERFORM DE-LETE.                                             NC1774.2 360
   001619         162200     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001620         162300     GO TO   ADD-INIT-F2-35.                                      NC1774.2 1685
   001621         162400 ADD-TEST-F2-34-1.                                                NC1774.2
   001622         162500     MOVE   "ADD-TEST-F2-34-1" TO PAR-NAME.                       NC1774.2 208
   001623         162600     IF      SIZE-ERR2 = "A"                                      NC1774.2 40
   001624      1  162700             PERFORM PASS                                         NC1774.2 358
   001625      1  162800             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001626         162900     ELSE                                                         NC1774.2
   001627      1  163000             MOVE   "A"        TO CORRECT-X                       NC1774.2 232
   001628      1  163100             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001629      1  163200             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1774.2
   001630      1  163300                  TO RE-MARK                                      NC1774.2 213
   001631      1  163400             PERFORM FAIL                                         NC1774.2 359
   001632      1  163500             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001633         163600     ADD     1 TO REC-CT.                                         NC1774.2 255
   001634         163700 ADD-TEST-F2-34-2.                                                NC1774.2
   001635         163800     MOVE   "ADD-TEST-F2-34-2" TO PAR-NAME.                       NC1774.2 208
   001636         163900     IF      SIZE-ERR3 = "B"                                      NC1774.2 41
   001637      1  164000             PERFORM PASS                                         NC1774.2 358
   001638      1  164100             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001639         164200     ELSE                                                         NC1774.2
   001640      1  164300             MOVE   "B"        TO CORRECT-X                       NC1774.2 232
   001641      1  164400             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1774.2 41 218
   001642      1  164500             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1774.2
   001643      1  164600                  TO RE-MARK                                      NC1774.2 213
   001644      1  164700             PERFORM FAIL                                         NC1774.2 359
   001645      1  164800             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001646         164900     ADD     1 TO REC-CT.                                         NC1774.2 255
   001647         165000 ADD-TEST-F2-34-3.                                                NC1774.2
   001648         165100     MOVE   "ADD-TEST-F2-34-3" TO PAR-NAME.                       NC1774.2 208
   001649         165200     IF      SIZE-ERR4 = "C"                                      NC1774.2 42
   001650      1  165300             PERFORM PASS                                         NC1774.2 358
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651      1  165400             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001652         165500     ELSE                                                         NC1774.2
   001653      1  165600             MOVE   "C"        TO CORRECT-X                       NC1774.2 232
   001654      1  165700             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1774.2 42 218
   001655      1  165800             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1774.2
   001656      1  165900                  TO RE-MARK                                      NC1774.2 213
   001657      1  166000             PERFORM FAIL                                         NC1774.2 359
   001658      1  166100             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001659         166200     ADD     1 TO REC-CT.                                         NC1774.2 255
   001660         166300 ADD-TEST-F2-34-4.                                                NC1774.2
   001661         166400     MOVE   "ADD-TEST-F2-34-4" TO PAR-NAME.                       NC1774.2 208
   001662         166500     IF      WRK-XN-00001 = "1"                                   NC1774.2 98
   001663      1  166600             PERFORM PASS                                         NC1774.2 358
   001664      1  166700             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001665         166800     ELSE                                                         NC1774.2
   001666      1  166900             MOVE   "1"           TO CORRECT-X                    NC1774.2 232
   001667      1  167000             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1774.2 98 218
   001668      1  167100             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1774.2 213
   001669      1  167200             PERFORM FAIL                                         NC1774.2 359
   001670      1  167300             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001671         167400     ADD     1 TO REC-CT.                                         NC1774.2 255
   001672         167500 ADD-TEST-F2-34-5.                                                NC1774.2
   001673         167600     MOVE   "ADD-TEST-F2-34-5" TO PAR-NAME.                       NC1774.2 208
   001674         167700     IF      WRK-DS-10V00  = ZERO                                 NC1774.2 47 IMP
   001675      1  167800             PERFORM PASS                                         NC1774.2 358
   001676      1  167900             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001677         168000     ELSE                                                         NC1774.2
   001678      1  168100             MOVE    ZERO         TO CORRECT-N                    NC1774.2 IMP 234
   001679      1  168200             MOVE    WRK-DS-10V00 TO COMPUTED-N                   NC1774.2 47 220
   001680      1  168300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1774.2
   001681      1  168400                  TO RE-MARK                                      NC1774.2 213
   001682      1  168500             PERFORM FAIL                                         NC1774.2 359
   001683      1  168600             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001684         168700*                                                                 NC1774.2
   001685         168800 ADD-INIT-F2-35.                                                  NC1774.2
   001686         168900*    ==-->EXPLICIT SCOPE TERMINATOR<--==                          NC1774.2
   001687         169000*    ==-->   NO SIZE ERROR        <--==                           NC1774.2
   001688         169100     MOVE   "VI-67 6.4.3" TO ANSI-REFERENCE.                      NC1774.2 264
   001689         169200     MOVE   "ADD-TEST-F2-35" TO PAR-NAME.                         NC1774.2 208
   001690         169300     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001691         169400     MOVE    SPACE TO WRK-XN-00001.                               NC1774.2 IMP 98
   001692         169500     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001693         169600     MOVE    SPACE TO SIZE-ERR3.                                  NC1774.2 IMP 41
   001694         169700     MOVE    SPACE TO SIZE-ERR4.                                  NC1774.2 IMP 42
   001695         169800     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   001696         169900 ADD-TEST-F2-35-0.                                                NC1774.2
   001697         170000     ADD     A12THREES-DS-06V06                                   NC1774.2 59
   001698         170100             333333                                               NC1774.2
   001699         170200             A06THREES-DS-03V03                                   NC1774.2 57
   001700         170300      GIVING WRK-DS-06V06 ROUNDED                                 NC1774.2 61
   001701         170400          ON SIZE ERROR                                           NC1774.2
   001702      1  170500             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   001703      1  170600             MOVE "B" TO SIZE-ERR3                                NC1774.2 41
   001704      1  170700             MOVE "C" TO SIZE-ERR4                                NC1774.2 42
   001705         170800     END-ADD                                                      NC1774.2
   001706         170900     MOVE   "1" TO WRK-XN-00001.                                  NC1774.2 98
   001707         171000     GO TO   ADD-TEST-F2-35-1.                                    NC1774.2 1712
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171100 ADD-DELETE-F2-35.                                                NC1774.2
   001709         171200     PERFORM DE-LETE.                                             NC1774.2 360
   001710         171300     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001711         171400     GO TO   ADD-INIT-F2-36.                                      NC1774.2 1776
   001712         171500 ADD-TEST-F2-35-1.                                                NC1774.2
   001713         171600     MOVE   "ADD-TEST-F2-35-1" TO PAR-NAME.                       NC1774.2 208
   001714         171700     IF      SIZE-ERR2 = SPACE                                    NC1774.2 40 IMP
   001715      1  171800             PERFORM PASS                                         NC1774.2 358
   001716      1  171900             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001717         172000     ELSE                                                         NC1774.2
   001718      1  172100             MOVE    SPACE     TO CORRECT-X                       NC1774.2 IMP 232
   001719      1  172200             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001720      1  172300             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1774.2
   001721      1  172400                  TO RE-MARK                                      NC1774.2 213
   001722      1  172500             PERFORM FAIL                                         NC1774.2 359
   001723      1  172600             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001724         172700     ADD     1 TO REC-CT.                                         NC1774.2 255
   001725         172800 ADD-TEST-F2-35-2.                                                NC1774.2
   001726         172900     MOVE   "ADD-TEST-F2-35-2" TO PAR-NAME.                       NC1774.2 208
   001727         173000     IF      SIZE-ERR3 = SPACE                                    NC1774.2 41 IMP
   001728      1  173100             PERFORM PASS                                         NC1774.2 358
   001729      1  173200             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001730         173300     ELSE                                                         NC1774.2
   001731      1  173400             MOVE    SPACE     TO CORRECT-X                       NC1774.2 IMP 232
   001732      1  173500             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1774.2 41 218
   001733      1  173600             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1774.2
   001734      1  173700                  TO RE-MARK                                      NC1774.2 213
   001735      1  173800             PERFORM FAIL                                         NC1774.2 359
   001736      1  173900             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001737         174000     ADD     1 TO REC-CT.                                         NC1774.2 255
   001738         174100 ADD-TEST-F2-35-3.                                                NC1774.2
   001739         174200     MOVE   "ADD-TEST-F2-35-3" TO PAR-NAME.                       NC1774.2 208
   001740         174300     IF      SIZE-ERR4 = SPACE                                    NC1774.2 42 IMP
   001741      1  174400             PERFORM PASS                                         NC1774.2 358
   001742      1  174500             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001743         174600     ELSE                                                         NC1774.2
   001744      1  174700             MOVE   "C"        TO CORRECT-X                       NC1774.2 232
   001745      1  174800             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1774.2 42 218
   001746      1  174900             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1774.2
   001747      1  175000                  TO RE-MARK                                      NC1774.2 213
   001748      1  175100             PERFORM FAIL                                         NC1774.2 359
   001749      1  175200             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001750         175300     ADD     1 TO REC-CT.                                         NC1774.2 255
   001751         175400 ADD-TEST-F2-35-4.                                                NC1774.2
   001752         175500     MOVE   "ADD-TEST-F2-35-4" TO PAR-NAME.                       NC1774.2 208
   001753         175600     IF      WRK-XN-00001 = "1"                                   NC1774.2 98
   001754      1  175700             PERFORM PASS                                         NC1774.2 358
   001755      1  175800             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001756         175900     ELSE                                                         NC1774.2
   001757      1  176000             MOVE   "1"           TO CORRECT-X                    NC1774.2 232
   001758      1  176100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1774.2 98 218
   001759      1  176200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1774.2 213
   001760      1  176300             PERFORM FAIL                                         NC1774.2 359
   001761      1  176400             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001762      1  176500     ADD     1 TO REC-CT.                                         NC1774.2 255
   001763         176600 ADD-TEST-F2-35-5.                                                NC1774.2
   001764         176700     MOVE   "ADD-TEST-F2-35-5" TO PAR-NAME.                       NC1774.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800     IF      WRK-DS-06V06 = 666999.666333                         NC1774.2 61
   001766      1  176900             PERFORM PASS                                         NC1774.2 358
   001767      1  177000             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001768         177100     ELSE                                                         NC1774.2
   001769      1  177200             MOVE    666999.666333 TO CORRECT-N                   NC1774.2 234
   001770      1  177300             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1774.2 61 220
   001771      1  177400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1774.2
   001772      1  177500                  TO RE-MARK                                      NC1774.2 213
   001773      1  177600             PERFORM FAIL                                         NC1774.2 359
   001774      1  177700             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001775         177800*                                                                 NC1774.2
   001776         177900 ADD-INIT-F2-36.                                                  NC1774.2
   001777         178000*    ==-->EXPLICIT SCOPE TERMINATOR<--==                          NC1774.2
   001778         178100*    ==-->      SIZE ERROR        <--==                           NC1774.2
   001779         178200     MOVE   "VI-67 6.4.3" TO ANSI-REFERENCE.                      NC1774.2 264
   001780         178300     MOVE   "ADD-TEST-F2-36" TO PAR-NAME.                         NC1774.2 208
   001781         178400     MOVE    ZERO  TO WRK-DS-10V00.                               NC1774.2 IMP 47
   001782         178500     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001783         178600     MOVE    SPACE TO WRK-XN-00001.                               NC1774.2 IMP 98
   001784         178700     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001785         178800     MOVE    SPACE TO SIZE-ERR3.                                  NC1774.2 IMP 41
   001786         178900     MOVE    SPACE TO SIZE-ERR4.                                  NC1774.2 IMP 42
   001787         179000 ADD-TEST-F2-36-0.                                                NC1774.2
   001788         179100     ADD     A12ONES-DS-12V00                                     NC1774.2 68
   001789         179200             ZERO                                                 NC1774.2 IMP
   001790         179300      GIVING WRK-DS-10V00                                         NC1774.2 47
   001791         179400      NOT ON SIZE ERROR                                           NC1774.2
   001792      1  179500             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   001793      1  179600             MOVE "B" TO SIZE-ERR3                                NC1774.2 41
   001794      1  179700             MOVE "C" TO SIZE-ERR4                                NC1774.2 42
   001795         179800     END-ADD                                                      NC1774.2
   001796         179900     MOVE   "1" TO WRK-XN-00001.                                  NC1774.2 98
   001797         180000     GO TO   ADD-TEST-F2-36-1.                                    NC1774.2 1802
   001798         180100 ADD-DELETE-F2-36.                                                NC1774.2
   001799         180200     PERFORM DE-LETE.                                             NC1774.2 360
   001800         180300     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001801         180400     GO TO   ADD-INIT-F2-37.                                      NC1774.2 1866
   001802         180500 ADD-TEST-F2-36-1.                                                NC1774.2
   001803         180600     MOVE   "ADD-TEST-F2-36-1" TO PAR-NAME.                       NC1774.2 208
   001804         180700     IF      SIZE-ERR2 = SPACE                                    NC1774.2 40 IMP
   001805      1  180800             PERFORM PASS                                         NC1774.2 358
   001806      1  180900             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001807         181000     ELSE                                                         NC1774.2
   001808      1  181100             MOVE    SPACE     TO CORRECT-X                       NC1774.2 IMP 232
   001809      1  181200             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001810      1  181300             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1774.2
   001811      1  181400                  TO RE-MARK                                      NC1774.2 213
   001812      1  181500             PERFORM FAIL                                         NC1774.2 359
   001813      1  181600             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001814         181700     ADD     1 TO REC-CT.                                         NC1774.2 255
   001815         181800 ADD-TEST-F2-36-2.                                                NC1774.2
   001816         181900     MOVE   "ADD-TEST-F2-36-2" TO PAR-NAME.                       NC1774.2 208
   001817         182000     IF      SIZE-ERR3 = SPACE                                    NC1774.2 41 IMP
   001818      1  182100             PERFORM PASS                                         NC1774.2 358
   001819      1  182200             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001820         182300     ELSE                                                         NC1774.2
   001821      1  182400             MOVE    SPACE     TO CORRECT-X                       NC1774.2 IMP 232
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822      1  182500             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1774.2 41 218
   001823      1  182600             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1774.2
   001824      1  182700                  TO RE-MARK                                      NC1774.2 213
   001825      1  182800             PERFORM FAIL                                         NC1774.2 359
   001826      1  182900             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001827         183000     ADD     1 TO REC-CT.                                         NC1774.2 255
   001828         183100 ADD-TEST-F2-36-3.                                                NC1774.2
   001829         183200     MOVE   "ADD-TEST-F2-36-3" TO PAR-NAME.                       NC1774.2 208
   001830         183300     IF      SIZE-ERR4 = SPACE                                    NC1774.2 42 IMP
   001831      1  183400             PERFORM PASS                                         NC1774.2 358
   001832      1  183500             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001833         183600     ELSE                                                         NC1774.2
   001834      1  183700             MOVE    SPACE     TO CORRECT-X                       NC1774.2 IMP 232
   001835      1  183800             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1774.2 42 218
   001836      1  183900             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1774.2
   001837      1  184000                  TO RE-MARK                                      NC1774.2 213
   001838      1  184100             PERFORM FAIL                                         NC1774.2 359
   001839      1  184200             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001840         184300     ADD     1 TO REC-CT.                                         NC1774.2 255
   001841         184400 ADD-TEST-F2-36-4.                                                NC1774.2
   001842         184500     MOVE   "ADD-TEST-F2-36-4" TO PAR-NAME.                       NC1774.2 208
   001843         184600     IF      WRK-XN-00001 = "1"                                   NC1774.2 98
   001844      1  184700             PERFORM PASS                                         NC1774.2 358
   001845      1  184800             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001846         184900     ELSE                                                         NC1774.2
   001847      1  185000             MOVE   "1"           TO CORRECT-X                    NC1774.2 232
   001848      1  185100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1774.2 98 218
   001849      1  185200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1774.2 213
   001850      1  185300             PERFORM FAIL                                         NC1774.2 359
   001851      1  185400             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001852         185500     ADD     1 TO REC-CT.                                         NC1774.2 255
   001853         185600 ADD-TEST-F2-36-5.                                                NC1774.2
   001854         185700     MOVE   "ADD-TEST-F2-36-5" TO PAR-NAME.                       NC1774.2 208
   001855         185800     IF      WRK-DS-10V00 = ZERO                                  NC1774.2 47 IMP
   001856      1  185900             PERFORM PASS                                         NC1774.2 358
   001857      1  186000             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001858         186100     ELSE                                                         NC1774.2
   001859      1  186200             MOVE    ZERO         TO CORRECT-N                    NC1774.2 IMP 234
   001860      1  186300             MOVE    WRK-DS-10V00 TO COMPUTED-N                   NC1774.2 47 220
   001861      1  186400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1774.2
   001862      1  186500                  TO RE-MARK                                      NC1774.2 213
   001863      1  186600             PERFORM FAIL                                         NC1774.2 359
   001864      1  186700             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001865         186800*                                                                 NC1774.2
   001866         186900 ADD-INIT-F2-37.                                                  NC1774.2
   001867         187000*    ==-->EXPLICIT SCOPE TERMINATOR<--==                          NC1774.2
   001868         187100*    ==-->   NO SIZE ERROR        <--==                           NC1774.2
   001869         187200     MOVE   "VI-67 6.4.3" TO ANSI-REFERENCE.                      NC1774.2 264
   001870         187300     MOVE   "ADD-TEST-F2-37" TO PAR-NAME.                         NC1774.2 208
   001871         187400     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001872         187500     MOVE    SPACE TO WRK-XN-00001.                               NC1774.2 IMP 98
   001873         187600     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001874         187700     MOVE    SPACE TO SIZE-ERR3.                                  NC1774.2 IMP 41
   001875         187800     MOVE    SPACE TO SIZE-ERR4.                                  NC1774.2 IMP 42
   001876         187900     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   001877         188000 ADD-TEST-F2-37-0.                                                NC1774.2
   001878         188100     ADD     A12THREES-DS-06V06                                   NC1774.2 59
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200             333333                                               NC1774.2
   001880         188300             A06THREES-DS-03V03                                   NC1774.2 57
   001881         188400      GIVING WRK-DS-06V06 ROUNDED                                 NC1774.2 61
   001882         188500      NOT ON SIZE ERROR                                           NC1774.2
   001883      1  188600             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   001884      1  188700             MOVE "B" TO SIZE-ERR3                                NC1774.2 41
   001885      1  188800             MOVE "C" TO SIZE-ERR4                                NC1774.2 42
   001886         188900     END-ADD                                                      NC1774.2
   001887         189000     MOVE   "1" TO WRK-XN-00001.                                  NC1774.2 98
   001888         189100     GO TO   ADD-TEST-F2-37-1.                                    NC1774.2 1893
   001889         189200 ADD-DELETE-F2-37.                                                NC1774.2
   001890         189300     PERFORM DE-LETE.                                             NC1774.2 360
   001891         189400     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001892         189500     GO TO   ADD-INIT-F2-38.                                      NC1774.2 1957
   001893         189600 ADD-TEST-F2-37-1.                                                NC1774.2
   001894         189700     MOVE   "ADD-TEST-F2-37-1" TO PAR-NAME.                       NC1774.2 208
   001895         189800     IF      SIZE-ERR2 = "A"                                      NC1774.2 40
   001896      1  189900             PERFORM PASS                                         NC1774.2 358
   001897      1  190000             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001898         190100     ELSE                                                         NC1774.2
   001899      1  190200             MOVE   "A"        TO CORRECT-X                       NC1774.2 232
   001900      1  190300             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001901      1  190400             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1774.2
   001902      1  190500                  TO RE-MARK                                      NC1774.2 213
   001903      1  190600             PERFORM FAIL                                         NC1774.2 359
   001904      1  190700             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001905         190800     ADD     1 TO REC-CT.                                         NC1774.2 255
   001906         190900 ADD-TEST-F2-37-2.                                                NC1774.2
   001907         191000     MOVE   "ADD-TEST-F2-37-2" TO PAR-NAME.                       NC1774.2 208
   001908         191100     IF      SIZE-ERR3 = "B"                                      NC1774.2 41
   001909      1  191200             PERFORM PASS                                         NC1774.2 358
   001910      1  191300             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001911         191400     ELSE                                                         NC1774.2
   001912      1  191500             MOVE   "B"        TO CORRECT-X                       NC1774.2 232
   001913      1  191600             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1774.2 41 218
   001914      1  191700             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1774.2
   001915      1  191800                  TO RE-MARK                                      NC1774.2 213
   001916      1  191900             PERFORM FAIL                                         NC1774.2 359
   001917      1  192000             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001918         192100     ADD     1 TO REC-CT.                                         NC1774.2 255
   001919         192200 ADD-TEST-F2-37-3.                                                NC1774.2
   001920         192300     MOVE   "ADD-TEST-F2-37-3" TO PAR-NAME                        NC1774.2 208
   001921         192400     IF      SIZE-ERR4 = "C"                                      NC1774.2 42
   001922      1  192500             PERFORM PASS                                         NC1774.2 358
   001923      1  192600             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001924         192700     ELSE                                                         NC1774.2
   001925      1  192800             MOVE   "C"        TO CORRECT-X                       NC1774.2 232
   001926      1  192900             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1774.2 42 218
   001927      1  193000             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1774.2
   001928      1  193100                  TO RE-MARK                                      NC1774.2 213
   001929      1  193200             PERFORM FAIL                                         NC1774.2 359
   001930      1  193300             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001931         193400     ADD     1 TO REC-CT.                                         NC1774.2 255
   001932         193500 ADD-TEST-F2-37-4.                                                NC1774.2
   001933         193600     MOVE   "ADD-TEST-F2-37-4" TO PAR-NAME.                       NC1774.2 208
   001934         193700     IF      WRK-XN-00001 = "1"                                   NC1774.2 98
   001935      1  193800             PERFORM PASS                                         NC1774.2 358
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936      1  193900             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001937         194000     ELSE                                                         NC1774.2
   001938      1  194100             MOVE   "1"           TO CORRECT-X                    NC1774.2 232
   001939      1  194200             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1774.2 98 218
   001940      1  194300             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1774.2 213
   001941      1  194400             PERFORM FAIL                                         NC1774.2 359
   001942      1  194500             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001943         194600     ADD     1 TO REC-CT.                                         NC1774.2 255
   001944         194700 ADD-TEST-F2-37-5.                                                NC1774.2
   001945         194800     MOVE   "ADD-TEST-F2-37-5" TO PAR-NAME.                       NC1774.2 208
   001946         194900     IF      WRK-DS-06V06 = 666999.666333                         NC1774.2 61
   001947      1  195000             PERFORM PASS                                         NC1774.2 358
   001948      1  195100             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001949         195200     ELSE                                                         NC1774.2
   001950      1  195300             MOVE    666999.666333 TO CORRECT-N                   NC1774.2 234
   001951      1  195400             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1774.2 61 220
   001952      1  195500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1774.2
   001953      1  195600                  TO RE-MARK                                      NC1774.2 213
   001954      1  195700             PERFORM FAIL                                         NC1774.2 359
   001955      1  195800             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001956         195900*                                                                 NC1774.2
   001957         196000 ADD-INIT-F2-38.                                                  NC1774.2
   001958         196100*    ==-->EXPLICIT SCOPE TERMINATOR<--==                          NC1774.2
   001959         196200*    ==-->      SIZE ERROR        <--==                           NC1774.2
   001960         196300     MOVE   "VI-67 6.4.3" TO ANSI-REFERENCE.                      NC1774.2 264
   001961         196400     MOVE   "ADD-TEST-F2-38" TO PAR-NAME.                         NC1774.2 208
   001962         196500     MOVE    ZERO  TO WRK-DS-10V00.                               NC1774.2 IMP 47
   001963         196600     MOVE    1     TO REC-CT.                                     NC1774.2 255
   001964         196700     MOVE    SPACE TO WRK-XN-00001.                               NC1774.2 IMP 98
   001965         196800     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   001966         196900     MOVE    SPACE TO SIZE-ERR3.                                  NC1774.2 IMP 41
   001967         197000     MOVE    SPACE TO SIZE-ERR4.                                  NC1774.2 IMP 42
   001968         197100 ADD-TEST-F2-38-0.                                                NC1774.2
   001969         197200     ADD     A12ONES-DS-12V00                                     NC1774.2 68
   001970         197300             ZERO                                                 NC1774.2 IMP
   001971         197400      GIVING WRK-DS-10V00                                         NC1774.2 47
   001972         197500          ON SIZE ERROR                                           NC1774.2
   001973      1  197600             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   001974         197700      NOT ON SIZE ERROR                                           NC1774.2
   001975      1  197800             MOVE "X" TO SIZE-ERR2                                NC1774.2 40
   001976         197900     END-ADD                                                      NC1774.2
   001977         198000     MOVE   "1" TO WRK-XN-00001.                                  NC1774.2 98
   001978         198100     GO TO   ADD-TEST-F2-38-1.                                    NC1774.2 1983
   001979         198200 ADD-DELETE-F2-38.                                                NC1774.2
   001980         198300     PERFORM DE-LETE.                                             NC1774.2 360
   001981         198400     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   001982         198500     GO TO   ADD-INIT-F2-39.                                      NC1774.2 2021
   001983         198600 ADD-TEST-F2-38-1.                                                NC1774.2
   001984         198700     MOVE   "ADD-TEST-F2-38-1" TO PAR-NAME.                       NC1774.2 208
   001985         198800     IF      SIZE-ERR2 = "A"                                      NC1774.2 40
   001986      1  198900             PERFORM PASS                                         NC1774.2 358
   001987      1  199000             PERFORM PRINT-DETAIL                                 NC1774.2 362
   001988         199100     ELSE                                                         NC1774.2
   001989      1  199200             MOVE   "A"        TO CORRECT-X                       NC1774.2 232
   001990      1  199300             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   001991      1  199400             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1774.2
   001992      1  199500                  TO RE-MARK                                      NC1774.2 213
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993      1  199600             PERFORM FAIL                                         NC1774.2 359
   001994      1  199700             PERFORM PRINT-DETAIL.                                NC1774.2 362
   001995         199800     ADD     1 TO REC-CT.                                         NC1774.2 255
   001996         199900 ADD-TEST-F2-38-2.                                                NC1774.2
   001997         200000     MOVE   "ADD-TEST-F2-38-2" TO PAR-NAME.                       NC1774.2 208
   001998         200100     IF      WRK-XN-00001 = "1"                                   NC1774.2 98
   001999      1  200200             PERFORM PASS                                         NC1774.2 358
   002000      1  200300             PERFORM PRINT-DETAIL                                 NC1774.2 362
   002001         200400     ELSE                                                         NC1774.2
   002002      1  200500             MOVE   "1"           TO CORRECT-X                    NC1774.2 232
   002003      1  200600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1774.2 98 218
   002004      1  200700             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1774.2 213
   002005      1  200800             PERFORM FAIL                                         NC1774.2 359
   002006      1  200900             PERFORM PRINT-DETAIL.                                NC1774.2 362
   002007         201000     ADD     1 TO REC-CT.                                         NC1774.2 255
   002008         201100 ADD-TEST-F2-38-3.                                                NC1774.2
   002009         201200     MOVE   "ADD-TEST-F2-38-3" TO PAR-NAME.                       NC1774.2 208
   002010         201300     IF      WRK-DS-10V00 = ZERO                                  NC1774.2 47 IMP
   002011      1  201400             PERFORM PASS                                         NC1774.2 358
   002012      1  201500             PERFORM PRINT-DETAIL                                 NC1774.2 362
   002013         201600     ELSE                                                         NC1774.2
   002014      1  201700             MOVE    ZERO         TO CORRECT-N                    NC1774.2 IMP 234
   002015      1  201800             MOVE    WRK-DS-10V00 TO COMPUTED-N                   NC1774.2 47 220
   002016      1  201900             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1774.2
   002017      1  202000                  TO RE-MARK                                      NC1774.2 213
   002018      1  202100             PERFORM FAIL                                         NC1774.2 359
   002019      1  202200             PERFORM PRINT-DETAIL.                                NC1774.2 362
   002020         202300*                                                                 NC1774.2
   002021         202400 ADD-INIT-F2-39.                                                  NC1774.2
   002022         202500*    ==-->EXPLICIT SCOPE TERMINATOR<--==                          NC1774.2
   002023         202600*    ==-->    NO SIZE ERROR        <--==                          NC1774.2
   002024         202700     MOVE   "VI-67 6.4.3" TO ANSI-REFERENCE.                      NC1774.2 264
   002025         202800     MOVE   "ADD-TEST-F2-39" TO PAR-NAME.                         NC1774.2 208
   002026         202900     MOVE    1     TO REC-CT.                                     NC1774.2 255
   002027         203000     MOVE    SPACE TO WRK-XN-00001.                               NC1774.2 IMP 98
   002028         203100     MOVE    SPACE TO SIZE-ERR2.                                  NC1774.2 IMP 40
   002029         203200     MOVE    SPACE TO SIZE-ERR3.                                  NC1774.2 IMP 41
   002030         203300     MOVE    SPACE TO SIZE-ERR4.                                  NC1774.2 IMP 42
   002031         203400     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   002032         203500 ADD-TEST-F2-39-0.                                                NC1774.2
   002033         203600     ADD     A12THREES-DS-06V06                                   NC1774.2 59
   002034         203700             333333                                               NC1774.2
   002035         203800             A06THREES-DS-03V03                                   NC1774.2 57
   002036         203900      GIVING WRK-DS-06V06 ROUNDED                                 NC1774.2 61
   002037         204000          ON SIZE ERROR                                           NC1774.2
   002038      1  204100             MOVE "1" TO SIZE-ERR2                                NC1774.2 40
   002039         204200      NOT ON SIZE ERROR                                           NC1774.2
   002040      1  204300             MOVE "A" TO SIZE-ERR2                                NC1774.2 40
   002041         204400     END-ADD                                                      NC1774.2
   002042         204500     MOVE   "1" TO WRK-XN-00001.                                  NC1774.2 98
   002043         204600     GO TO   ADD-TEST-F2-39-1.                                    NC1774.2 2048
   002044         204700 ADD-DELETE-F2-39.                                                NC1774.2
   002045         204800     PERFORM DE-LETE.                                             NC1774.2 360
   002046         204900     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   002047         205000     GO TO   ADD-INIT-F2-40.                                      NC1774.2 2086
   002048         205100 ADD-TEST-F2-39-1.                                                NC1774.2
   002049         205200     MOVE   "ADD-TEST-F2-39-1" TO PAR-NAME.                       NC1774.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205300     IF      SIZE-ERR2 = "A"                                      NC1774.2 40
   002051      1  205400             PERFORM PASS                                         NC1774.2 358
   002052      1  205500             PERFORM PRINT-DETAIL                                 NC1774.2 362
   002053         205600     ELSE                                                         NC1774.2
   002054      1  205700             MOVE   "A"        TO CORRECT-X                       NC1774.2 232
   002055      1  205800             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1774.2 40 218
   002056      1  205900             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1774.2
   002057      1  206000                  TO RE-MARK                                      NC1774.2 213
   002058      1  206100             PERFORM FAIL                                         NC1774.2 359
   002059      1  206200             PERFORM PRINT-DETAIL.                                NC1774.2 362
   002060         206300     ADD     1 TO REC-CT.                                         NC1774.2 255
   002061         206400 ADD-TEST-F2-39-2.                                                NC1774.2
   002062         206500     MOVE   "ADD-TEST-F2-39-2" TO PAR-NAME.                       NC1774.2 208
   002063         206600     IF      WRK-XN-00001 = "1"                                   NC1774.2 98
   002064      1  206700             PERFORM PASS                                         NC1774.2 358
   002065      1  206800             PERFORM PRINT-DETAIL                                 NC1774.2 362
   002066         206900     ELSE                                                         NC1774.2
   002067      1  207000             MOVE   "1"           TO CORRECT-X                    NC1774.2 232
   002068      1  207100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1774.2 98 218
   002069      1  207200             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC1774.2 213
   002070      1  207300             PERFORM FAIL                                         NC1774.2 359
   002071      1  207400             PERFORM PRINT-DETAIL.                                NC1774.2 362
   002072         207500     ADD     1 TO REC-CT.                                         NC1774.2 255
   002073         207600 ADD-TEST-F2-39-3.                                                NC1774.2
   002074         207700     MOVE   "ADD-TEST-F2-39-3" TO PAR-NAME.                       NC1774.2 208
   002075         207800     IF      WRK-DS-06V06 = 666999.666333                         NC1774.2 61
   002076      1  207900             PERFORM PASS                                         NC1774.2 358
   002077      1  208000             PERFORM PRINT-DETAIL                                 NC1774.2 362
   002078         208100     ELSE                                                         NC1774.2
   002079      1  208200             MOVE    666999.666333 TO CORRECT-N                   NC1774.2 234
   002080      1  208300             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1774.2 61 220
   002081      1  208400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1774.2
   002082      1  208500                  TO RE-MARK                                      NC1774.2 213
   002083      1  208600             PERFORM FAIL                                         NC1774.2 359
   002084      1  208700             PERFORM PRINT-DETAIL.                                NC1774.2 362
   002085         208800*                                                                 NC1774.2
   002086         208900 ADD-INIT-F2-40.                                                  NC1774.2
   002087         209000     MOVE   "VI-73 6.6.2" TO ANSI-REFERENCE.                      NC1774.2 264
   002088         209100*    ==-->  OPTIONAL WORD "TO"  <--==                             NC1774.2
   002089         209200     MOVE     ZERO TO WRK-DS-09V09.                               NC1774.2 IMP 54
   002090         209300 ADD-TEST-F2-40-0.                                                NC1774.2
   002091         209400     ADD      A06THREES-DS-03V03                                  NC1774.2 57
   002092         209500           TO A12THREES-DS-06V06 GIVING WRK-DS-09V09.             NC1774.2 59 54
   002093         209600 ADD-TEST-F2-40-1.                                                NC1774.2
   002094         209700     IF       WRK-DS-09V09 EQUAL TO 000333666.666333000           NC1774.2 54
   002095      1  209800              PERFORM PASS GO TO ADD-WRITE-F2-40.                 NC1774.2 358 2104
   002096         209900     GO       TO ADD-FAIL-F2-40.                                  NC1774.2 2100
   002097         210000 ADD-DELETE-F2-40.                                                NC1774.2
   002098         210100     PERFORM  DE-LETE.                                            NC1774.2 360
   002099         210200     GO       TO ADD-WRITE-F2-40.                                 NC1774.2 2104
   002100         210300 ADD-FAIL-F2-40.                                                  NC1774.2
   002101         210400     MOVE     WRK-DS-09V09 TO COMPUTED-N.                         NC1774.2 54 220
   002102         210500     MOVE     000333666.666333000 TO CORRECT-N.                   NC1774.2 234
   002103         210600     PERFORM  FAIL.                                               NC1774.2 359
   002104         210700 ADD-WRITE-F2-40.                                                 NC1774.2
   002105         210800     MOVE     "ADD-TEST-F2-40" TO PAR-NAME.                       NC1774.2 208
   002106         210900     PERFORM  PRINT-DETAIL.                                       NC1774.2 362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211000*                                                                 NC1774.2
   002108         211100 ADD-INIT-F2-41.                                                  NC1774.2
   002109         211200     MOVE   "VI-73 6.6.2" TO ANSI-REFERENCE.                      NC1774.2 264
   002110         211300*    ==-->  OPTIONAL WORD "TO"  <--==                             NC1774.2
   002111         211400     MOVE     ZERO TO WRK-DS-06V06.                               NC1774.2 IMP 61
   002112         211500 ADD-TEST-F2-41-0.                                                NC1774.2
   002113         211600     ADD      A05ONES-DS-05V00                                    NC1774.2 50
   002114         211700              A05ONES-DS-00V05                                    NC1774.2 64
   002115         211800              A12THREES-DS-06V06                                  NC1774.2 59
   002116         211900          TO  A06THREES-DS-03V03 GIVING WRK-DS-06V06.             NC1774.2 57 61
   002117         212000 ADD-TEST-F2-41-1.                                                NC1774.2
   002118         212100     IF       WRK-DS-06V06 EQUAL TO 344777.777443                 NC1774.2 61
   002119      1  212200              PERFORM PASS GO TO ADD-WRITE-F2-41.                 NC1774.2 358 2128
   002120         212300     GO       TO ADD-FAIL-F2-41.                                  NC1774.2 2124
   002121         212400 ADD-DELETE-F2-41.                                                NC1774.2
   002122         212500     PERFORM  DE-LETE.                                            NC1774.2 360
   002123         212600     GO       TO ADD-WRITE-F2-41.                                 NC1774.2 2128
   002124         212700 ADD-FAIL-F2-41.                                                  NC1774.2
   002125         212800     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1774.2 61 220
   002126         212900     MOVE     344777.777443 TO CORRECT-N.                         NC1774.2 234
   002127         213000     PERFORM  FAIL.                                               NC1774.2 359
   002128         213100 ADD-WRITE-F2-41.                                                 NC1774.2
   002129         213200     MOVE     "ADD-TEST-F2-41" TO PAR-NAME.                       NC1774.2 208
   002130         213300     PERFORM PRINT-DETAIL.                                        NC1774.2 362
   002131         213400*                                                                 NC1774.2
   002132         213500 CCVS-EXIT SECTION.                                               NC1774.2
   002133         213600 CCVS-999999.                                                     NC1774.2
   002134         213700     GO TO CLOSE-FILES.                                           NC1774.2 351
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    41
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       99   ADD-12 . . . . . . . . . . . .  779
      100   ADD-13 . . . . . . . . . . . .  779
      101   ADD-14 . . . . . . . . . . . .  M779 780 787
      264   ANSI-REFERENCE . . . . . . . .  441 448 457 M466 M953 M974 M997 M1019 M1043 M1102 M1186 M1266 M1350 M1430 M1516
                                            M1598 M1688 M1779 M1869 M1960 M2024 M2087 M2109
       91   AZERO-DS-05V05
       81   A01ONE-DS-P0801. . . . . . . .  720 736 762
       52   A02ONES-DS-02V00
       75   A03ONES-DS-02V01 . . . . . . .  715 741 761
       64   A05ONES-DS-00V05 . . . . . . .  577 595 597 2114
       50   A05ONES-DS-05V00 . . . . . . .  576 2113
       77   A06ONES-DS-03V03 . . . . . . .  716 740 764
       57   A06THREES-DS-03V03 . . . . . .  559 579 646 681 979 1024 1699 1880 2035 2091 2116
       79   A08TWOS-DS-02V06 . . . . . . .  717 739 758
       48   A10ONES-DS-10V00
       68   A12ONES-DS-12V00 . . . . . . .  614 956 1000 1607 1788 1969
      129   A12SEVENS-CU-18V00 . . . . . .  888
      121   A12THREES-CU-18V00 . . . . . .  904
       59   A12THREES-DS-06V06 . . . . . .  560 578 596 647 679 977 1022 1697 1878 2033 2092 2115
      119   A14TWOS-CS-18V00 . . . . . . .  904 920 920 936
      123   A16FOURS-CS-18V00
       43   A17TWOS-DS-17V00 . . . . . . .  1114 1278 1442
      117   A18EIGHTS-CS-18V00
      125   A18FIVES-CS-18V00. . . . . . .  872 936
       84   A18ONES-CS-18V00 . . . . . . .  857
       45   A18ONES-DS-18V00 . . . . . . .  857
      127   A18SIXES-CS-18V00. . . . . . .  872 888
      132   A18THREES-CS-18V00
       87   A99-CS-02V00
       73   A99-DS-02V00 . . . . . . . . .  714 742 759
      243   CCVS-C-1 . . . . . . . . . . .  380 426
      248   CCVS-C-2 . . . . . . . . . . .  381 427
      298   CCVS-E-1 . . . . . . . . . . .  386
      303   CCVS-E-2 . . . . . . . . . . .  395 402 409 414
      306   CCVS-E-2-2 . . . . . . . . . .  M394
      311   CCVS-E-3 . . . . . . . . . . .  415
      320   CCVS-E-4 . . . . . . . . . . .  394
      321   CCVS-E-4-1 . . . . . . . . . .  M392
      323   CCVS-E-4-2 . . . . . . . . . .  M393
      265   CCVS-H-1 . . . . . . . . . . .  375 422
      270   CCVS-H-2A. . . . . . . . . . .  376 423
      279   CCVS-H-2B. . . . . . . . . . .  377 424
      291   CCVS-H-3 . . . . . . . . . . .  378 425
      341   CCVS-PGM-ID. . . . . . . . . .  347 347
      225   CM-18V0
      219   COMPUTED-A . . . . . . . . . .  220 222 223 224 225 453 456 M814 M845
      220   COMPUTED-N . . . . . . . . . .  M477 M493 M511 M519 M534 M549 M568 M587 M605 M670 M704 M787 M1066 M1072 M1078
                                            M1084 M1090 M1096 M1132 M1139 M1146 M1153 M1160 M1167 M1212 M1219 M1226 M1233
                                            M1240 M1247 M1296 M1303 M1310 M1317 M1324 M1331 M1376 M1383 M1390 M1397 M1404
                                            M1411 M1462 M1469 M1476 M1483 M1490 M1497 M1544 M1551 M1558 M1565 M1572 M1579
                                            M1679 M1770 M1860 M1951 M2015 M2080 M2101 M2125
      218   COMPUTED-X . . . . . . . . . .  M370 438 M1179 M1259 M1343 M1423 M1509 M1591 M1628 M1641 M1654 M1667 M1719 M1732
                                            M1745 M1758 M1809 M1822 M1835 M1848 M1900 M1913 M1926 M1939 M1990 M2003 M2055
                                            M2068
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    42
0 Defined   Cross-reference of data names   References

0     222   COMPUTED-0V18. . . . . . . . .  M832
      224   COMPUTED-14V4. . . . . . . . .  M637
      226   COMPUTED-18V0. . . . . . . . .  M801 M862 M878 M894 M910 M926 M941
      223   COMPUTED-4V14. . . . . . . . .  M728 M750 M772
      242   COR-ANSI-REFERENCE . . . . . .  M448 M450
      233   CORRECT-A. . . . . . . . . . .  234 235 236 237 238 454 456 M813 M844
      234   CORRECT-N. . . . . . . . . . .  M478 M494 M520 M550 M569 M588 M606 M671 M705 M788 M1067 M1073 M1079 M1085 M1091
                                            M1097 M1133 M1140 M1147 M1154 M1161 M1168 M1213 M1220 M1227 M1234 M1241 M1248
                                            M1297 M1304 M1311 M1318 M1325 M1332 M1377 M1384 M1391 M1398 M1405 M1412 M1463
                                            M1470 M1477 M1484 M1491 M1498 M1545 M1552 M1559 M1566 M1573 M1580 M1678 M1769
                                            M1859 M1950 M2014 M2079 M2102 M2126
      232   CORRECT-X. . . . . . . . . . .  M371 440 M1178 M1258 M1342 M1422 M1508 M1590 M1627 M1640 M1653 M1666 M1718 M1731
                                            M1744 M1757 M1808 M1821 M1834 M1847 M1899 M1912 M1925 M1938 M1989 M2002 M2054
                                            M2067
      235   CORRECT-0V18 . . . . . . . . .  M833
      237   CORRECT-14V4 . . . . . . . . .  M638
      239   CORRECT-18V0 . . . . . . . . .  M802 M861 M877 M893 M909 M925 M942
      236   CORRECT-4V14 . . . . . . . . .  M729 M751 M773
      238   CR-18V0
      201   DECMAL-FIELD . . . . . . . . .  M827 829 832
      256   DELETE-COUNTER . . . . . . . .  M360 389 405 407
      211   DOTVALUE . . . . . . . . . . .  M365
      262   DUMMY-HOLD . . . . . . . . . .  M419 429
       37   DUMMY-RECORD . . . . . . . . .  M375 M376 M377 M378 M380 M381 M382 M384 M386 M395 M402 M409 M414 M415 419 M420
                                            421 M422 M423 M424 M425 M426 M427 M428 M429 433 M434 M443 M458
      309   ENDER-DESC . . . . . . . . . .  M397 M408 M413
      257   ERROR-COUNTER. . . . . . . . .  M359 388 398 401
      261   ERROR-HOLD . . . . . . . . . .  M388 M389 M389 M390 393
      307   ERROR-TOTAL. . . . . . . . . .  M399 M401 M406 M407 M411 M412
      192   EVEN-NAME1 . . . . . . . . . .  796
      197   EVEN-NAME2 . . . . . . . . . .  827
      204   FEATURE. . . . . . . . . . . .  M465 M556 M711
      335   HYPHEN-LINE. . . . . . . . . .  382 384 428
      301   ID-AGAIN . . . . . . . . . . .  M347
      334   INF-ANSI-REFERENCE . . . . . .  M441 M444 M457 M459
      329   INFO-TEXT. . . . . . . . . . .  M442
      258   INSPECT-COUNTER. . . . . . . .  M357 388 410 412
      189   MINUS-NAMES
      190   MINUS-NAME1. . . . . . . . . .  795
      191   MINUS-NAME2. . . . . . . . . .  795
      195   MINUS-NAME3. . . . . . . . . .  826
      196   MINUS-NAME4. . . . . . . . . .  826
      154   N-10
      156   N-11
      157   N-12
      158   N-13 . . . . . . . . . . . . .  501 526
      160   N-14 . . . . . . . . . . . . .  468
      161   N-15 . . . . . . . . . . . . .  M468 469 477
      162   N-16 . . . . . . . . . . . . .  484
      164   N-17
      166   N-18
      168   N-19
      169   N-20
      171   N-21
      172   N-22
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    43
0 Defined   Cross-reference of data names   References

0     174   N-23
      175   N-25
      176   N-26
      177   N-27
      179   N-28
      146   N-3. . . . . . . . . . . . . .  M484 485 493 M499 M501 511 518 519 M526 534 541 549
      147   N-4. . . . . . . . . . . . . .  484
      180   N-40
      182   N-41
      184   N-42
      186   N-43
      187   N-44
      188   N-45
      149   N-5
      151   N-7. . . . . . . . . . . . . .  153
       93   NDATA-DS-09V09
      206   P-OR-F . . . . . . . . . . . .  M357 M358 M359 M360 367 M370
      208   PAR-NAME . . . . . . . . . . .  M372 M481 M497 M515 M522 M538 M553 M572 M591 M609 M625 M641 M658 M674 M693 M708
                                            M732 M754 M776 M791 M808 M822 M839 M853 M868 M884 M900 M916 M932 M948 M969 M992
                                            M1014 M1038 M1044 M1129 M1136 M1143 M1150 M1157 M1164 M1171 M1209 M1216 M1223
                                            M1230 M1237 M1244 M1251 M1293 M1300 M1307 M1314 M1321 M1328 M1335 M1373 M1380
                                            M1387 M1394 M1401 M1408 M1415 M1459 M1466 M1473 M1480 M1487 M1494 M1501 M1541
                                            M1548 M1555 M1562 M1569 M1576 M1583 M1599 M1622 M1635 M1648 M1661 M1673 M1689
                                            M1713 M1726 M1739 M1752 M1764 M1780 M1803 M1816 M1829 M1842 M1854 M1870 M1894
                                            M1907 M1920 M1933 M1945 M1961 M1984 M1997 M2009 M2025 M2049 M2062 M2074 M2105
                                            M2129
      210   PARDOT-X . . . . . . . . . . .  M364
      259   PASS-COUNTER . . . . . . . . .  M358 390 392
      193   PLUS-NAME1 . . . . . . . . . .  795
      194   PLUS-NAME2 . . . . . . . . . .  796
      198   PLUS-NAME3 . . . . . . . . . .  826
      199   PLUS-NAME4 . . . . . . . . . .  827
       35   PRINT-FILE . . . . . . . . . .  31 346 352
       36   PRINT-REC. . . . . . . . . . .  M366 M447 M449
      213   RE-MARK. . . . . . . . . . . .  M361 M373 M512 M521 M535 M622 M636 M655 M669 M690 M815 M846 M960 M989 M1006 M1035
                                            M1177 M1257 M1341 M1421 M1507 M1589 M1630 M1643 M1656 M1668 M1681 M1721 M1734
                                            M1747 M1759 M1772 M1811 M1824 M1837 M1849 M1862 M1902 M1915 M1928 M1940 M1953
                                            M1992 M2004 M2017 M2057 M2069 M2082
      255   REC-CT . . . . . . . . . . . .  363 365 372 M1045 M1068 M1074 M1080 M1086 M1092 M1103 M1134 M1141 M1148 M1155
                                            M1162 M1169 M1187 M1214 M1221 M1228 M1235 M1242 M1249 M1267 M1298 M1305 M1312
                                            M1319 M1326 M1333 M1351 M1378 M1385 M1392 M1399 M1406 M1413 M1431 M1464 M1471
                                            M1478 M1485 M1492 M1499 M1517 M1546 M1553 M1560 M1567 M1574 M1581 M1601 M1633
                                            M1646 M1659 M1671 M1690 M1724 M1737 M1750 M1762 M1782 M1814 M1827 M1840 M1852
                                            M1871 M1905 M1918 M1931 M1943 M1963 M1995 M2007 M2026 M2060 M2072
      254   REC-SKL-SUB
      263   RECORD-COUNT . . . . . . . . .  M417 418 M430
       39   SIZE-ERR . . . . . . . . . . .  M794 M797 811 M825 M828 842
       40   SIZE-ERR2. . . . . . . . . . .  M1112 M1122 1172 1179 M1196 M1202 1252 1259 M1276 M1286 1336 1343 M1360 M1366
                                            1416 1423 M1440 M1450 M1452 1502 1509 M1526 M1532 M1534 1584 1591 M1603 M1611
                                            1623 1628 M1692 M1702 1714 1719 M1784 M1792 1804 1809 M1873 M1883 1895 1900 M1965
                                            M1973 M1975 1985 1990 M2028 M2038 M2040 2050 2055
       41   SIZE-ERR3. . . . . . . . . . .  M1604 M1612 1636 1641 M1693 M1703 1727 1732 M1785 M1793 1817 1822 M1874 M1884
                                            1908 1913 M1966 M2029
       42   SIZE-ERR4. . . . . . . . . . .  M1605 M1613 1649 1654 M1694 M1704 1740 1745 M1786 M1794 1830 1835 M1875 M1885
                                            1921 1926 M1967 M2030
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    44
0 Defined   Cross-reference of data names   References

0     136   SUBTR-1
      144   SUBTR-10
      145   SUBTR-11
      137   SUBTR-2
      138   SUBTR-3
      139   SUBTR-4
      140   SUBTR-5
      141   SUBTR-6
      142   SUBTR-7
      143   SUBTR-8
      135   SUBTRACT-DATA
      214   TEST-COMPUTED. . . . . . . . .  447
      229   TEST-CORRECT . . . . . . . . .  449
      282   TEST-ID. . . . . . . . . . . .  M347
      202   TEST-RESULTS . . . . . . . . .  M348 366
      260   TOTAL-ERROR
      185   TRUNC-DATA
      200   WHOLE-FIELD. . . . . . . . . .  M796 798 801
       86   WRK-CS-02V02
      134   WRK-CS-03V00
       83   WRK-CS-18V00 . . . . . . . . .  M856 M857 858 862 M871 M873 874 878 M903 M905 906 910 M919 M921 922 926
      102   WRK-CU-18V00
       67   WRK-DS-02V00
       89   WRK-DS-0201P
       70   WRK-DS-03V10 . . . . . . . . .  71 M713 M720 721 728 M735 M742 743 750 M757 M764 765 772
       66   WRK-DS-05V00 . . . . . . . . .  M644 M648 661 670
       90   WRK-DS-06V00 . . . . . . . . .  M594 M597 598 605
       61   WRK-DS-06V06 . . . . . . . . .  62 M575 M579 580 587 M677 M682 696 704 M975 M980 M1020 M1025 M1695 M1700 1765
                                            1770 M1876 M1881 1946 1951 M2031 M2036 2075 2080 M2111 M2116 2118 2125
       54   WRK-DS-09V09 . . . . . . . . .  55 M558 M560 561 568 M2089 M2092 2094 2101
       47   WRK-DS-10V00 . . . . . . . . .  M612 M615 628 637 M954 M957 M998 M1001 M1600 M1609 1674 1679 M1781 M1790 1855
                                            1860 M1962 M1971 2010 2015
       62   WRK-DS-12V00-S
       71   WRK-DS-13V00-S
       55   WRK-DS-18V00 . . . . . . . . .  M887 M889 890 894
      103   WRK-DU-1V0-1
      104   WRK-DU-1V1-1 . . . . . . . . .  M1046 1055 M1104 1115 M1188 1198 M1268 1279 M1352 1362 M1432 1443 M1518 1528
      105   WRK-DU-1V1-2 . . . . . . . . .  M1047 1055 M1105 1117 M1189 1198 M1269 1281 M1353 1362 M1433 1445 M1519 1528
      109   WRK-DU-1V17-1
      106   WRK-DU-1V3-1
      107   WRK-DU-1V3-2
      108   WRK-DU-1V5-1
      131   WRK-DU-18V00 . . . . . . . . .  M935 M937 938 941
      110   WRK-DU-2P6-1
      111   WRK-DU-2V0-1 . . . . . . . . .  M1048 M1056 1070 1072 M1106 M1119 1137 1139 M1190 M1199 1217 1219 M1270 M1283
                                            1301 1303 M1354 M1363 1381 1383 M1434 M1447 1467 1469 M1520 M1529 1549 1551
      112   WRK-DU-2V0-2 . . . . . . . . .  M1050 M1056 1082 1084 M1108 M1119 1151 1153 M1192 M1199 1231 1233 M1272 M1283
                                            1315 1317 M1356 M1363 1395 1397 M1436 M1447 1481 1483 M1522 M1529 1563 1565
      113   WRK-DU-2V0-3 . . . . . . . . .  M1052 M1057 1094 1096 M1110 M1120 1165 1167 M1194 M1200 1245 1247 M1274 M1284
                                            1329 1331 M1358 M1364 1409 1411 M1438 M1448 1495 1497 M1524 M1530 1577 1579
      114   WRK-DU-2V1-1 . . . . . . . . .  M1049 M1055 1064 1066 M1107 M1118 1130 1132 M1191 M1198 1210 1212 M1271 M1282
                                            1294 1296 M1355 M1362 1374 1376 M1435 M1446 1460 1462 M1521 M1528 1542 1544
      115   WRK-DU-2V1-2 . . . . . . . . .  M1051 M1056 1076 1078 M1109 M1119 1144 1146 M1193 M1199 1224 1226 M1273 M1283
                                            1308 1310 M1357 M1363 1388 1390 M1437 M1447 1474 1476 M1523 M1529 1556 1558
      116   WRK-DU-2V1-3 . . . . . . . . .  M1053 M1057 1088 1090 M1111 M1120 1158 1160 M1195 M1200 1238 1240 M1275 M1284
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    45
0 Defined   Cross-reference of data names   References

0                                           1322 1324 M1359 M1364 1402 1404 M1439 M1448 1488 1490 M1525 M1530 1570 1572
       98   WRK-XN-00001 . . . . . . . . .  M1602 M1615 1662 1667 M1691 M1706 1753 1758 M1783 M1796 1843 1848 M1872 M1887
                                            1934 1939 M1964 M1977 1998 2003 M2027 M2042 2063 2068
       97   WRK-XN-00018
      153   X-8
       95   XDATA-XN-00018
      331   XXCOMPUTED . . . . . . . . . .  M456
      333   XXCORRECT. . . . . . . . . . .  M456
      326   XXINFO . . . . . . . . . . . .  443 458
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    46
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

     1075   ADD-ADD-TEST-F2-27-3
     1142   ADD-ADD-TEST-F2-28-3
     1222   ADD-ADD-TEST-F2-29-3
     1306   ADD-ADD-TEST-F2-30-3
     1386   ADD-ADD-TEST-F2-31-3
     1472   ADD-ADD-TEST-F2-32-3
     1554   ADD-ADD-TEST-F2-33-3
      473   ADD-DELETE-F2-1
      686   ADD-DELETE-F2-10-1
      700   ADD-DELETE-F2-10-2
      724   ADD-DELETE-F2-11
      746   ADD-DELETE-F2-12
      768   ADD-DELETE-F2-13
      783   ADD-DELETE-F2-14
      805   ADD-DELETE-F2-15-1
      819   ADD-DELETE-F2-15-2
      836   ADD-DELETE-F2-16-1
      850   ADD-DELETE-F2-16-2
      865   ADD-DELETE-F2-17
      881   ADD-DELETE-F2-18
      897   ADD-DELETE-F2-19
      489   ADD-DELETE-F2-2
      913   ADD-DELETE-F2-20
      929   ADD-DELETE-F2-21
      945   ADD-DELETE-F2-22
      963   ADD-DELETE-F2-23
      985   ADD-DELETE-F2-24
     1008   ADD-DELETE-F2-25
     1031   ADD-DELETE-F2-26
     1059   ADD-DELETE-F2-27
     1124   ADD-DELETE-F2-28
     1204   ADD-DELETE-F2-29
      507   ADD-DELETE-F2-3-1
     1288   ADD-DELETE-F2-30
     1368   ADD-DELETE-F2-31
     1454   ADD-DELETE-F2-32
     1536   ADD-DELETE-F2-33
     1617   ADD-DELETE-F2-34
     1708   ADD-DELETE-F2-35
     1798   ADD-DELETE-F2-36
     1889   ADD-DELETE-F2-37
     1979   ADD-DELETE-F2-38
     2044   ADD-DELETE-F2-39
      530   ADD-DELETE-F2-4-1
      545   ADD-DELETE-F2-4-2
     2097   ADD-DELETE-F2-40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    47
0 Defined   Cross-reference of procedures   References

0    2121   ADD-DELETE-F2-41
      564   ADD-DELETE-F2-5
      583   ADD-DELETE-F2-6
      601   ADD-DELETE-F2-7
      618   ADD-DELETE-F2-8-1
      632   ADD-DELETE-F2-8-2
      651   ADD-DELETE-F2-9-1
      665   ADD-DELETE-F2-9-2
      476   ADD-FAIL-F2-1. . . . . . . . .  G472
      689   ADD-FAIL-F2-10-1 . . . . . . .  G683
      703   ADD-FAIL-F2-10-2 . . . . . . .  G699
      727   ADD-FAIL-F2-11 . . . . . . . .  G723
      749   ADD-FAIL-F2-12 . . . . . . . .  G745
      771   ADD-FAIL-F2-13 . . . . . . . .  G767
      786   ADD-FAIL-F2-14 . . . . . . . .  G782
      492   ADD-FAIL-F2-2. . . . . . . . .  G488
      988   ADD-FAIL-F2-24 . . . . . . . .  G984
     1034   ADD-FAIL-F2-26 . . . . . . . .  G1027
      510   ADD-FAIL-F2-3-1. . . . . . . .  G506
      533   ADD-FAIL-F2-4-1. . . . . . . .  G529
      548   ADD-FAIL-F2-4-2. . . . . . . .  G544
     2100   ADD-FAIL-F2-40 . . . . . . . .  G2096
     2124   ADD-FAIL-F2-41 . . . . . . . .  G2120
      567   ADD-FAIL-F2-5. . . . . . . . .  G563
      586   ADD-FAIL-F2-6. . . . . . . . .  G582
      604   ADD-FAIL-F2-7. . . . . . . . .  G600
      621   ADD-FAIL-F2-8-1. . . . . . . .  G617
      635   ADD-FAIL-F2-8-2. . . . . . . .  G631
      654   ADD-FAIL-F2-9-1. . . . . . . .  G650
      668   ADD-FAIL-F2-9-2. . . . . . . .  G663
     1054   ADD-GIVING-TEST-F2-27-0
     1113   ADD-GIVING-TEST-F2-28-0
     1197   ADD-GIVING-TEST-F2-29-0
     1277   ADD-GIVING-TEST-F2-30-0
     1361   ADD-GIVING-TEST-F2-31-0
     1441   ADD-GIVING-TEST-F2-32-0
     1527   ADD-GIVING-TEST-F2-33-0
      464   ADD-INIT-F2-1
      676   ADD-INIT-F2-10
      710   ADD-INIT-F2-11
      951   ADD-INIT-F2-23
      972   ADD-INIT-F2-24
      995   ADD-INIT-F2-25
     1017   ADD-INIT-F2-26
     1041   ADD-INIT-F2-27
     1099   ADD-INIT-F2-28 . . . . . . . .  G1062
     1183   ADD-INIT-F2-29 . . . . . . . .  G1127
     1263   ADD-INIT-F2-30 . . . . . . . .  G1207
     1347   ADD-INIT-F2-31 . . . . . . . .  G1291
     1427   ADD-INIT-F2-32 . . . . . . . .  G1371
     1513   ADD-INIT-F2-33 . . . . . . . .  G1457
     1595   ADD-INIT-F2-34 . . . . . . . .  G1539
     1685   ADD-INIT-F2-35 . . . . . . . .  G1620
     1776   ADD-INIT-F2-36 . . . . . . . .  G1711
     1866   ADD-INIT-F2-37 . . . . . . . .  G1801
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    48
0 Defined   Cross-reference of procedures   References

0    1957   ADD-INIT-F2-38 . . . . . . . .  G1892
     2021   ADD-INIT-F2-39 . . . . . . . .  G1982
     2086   ADD-INIT-F2-40 . . . . . . . .  G2047
     2108   ADD-INIT-F2-41
      555   ADD-INIT-F2-5
      611   ADD-INIT-F2-8-1
      966   ADD-PASS-F2-23 . . . . . . . .  G962
     1011   ADD-PASS-F2-25 . . . . . . . .  G1003
      467   ADD-TEST-F2-1
      678   ADD-TEST-F2-10-1
      695   ADD-TEST-F2-10-2
      712   ADD-TEST-F2-11
      734   ADD-TEST-F2-12
      756   ADD-TEST-F2-13
      778   ADD-TEST-F2-14
      793   ADD-TEST-F2-15-1
      810   ADD-TEST-F2-15-2
      824   ADD-TEST-F2-16-1
      841   ADD-TEST-F2-16-2
      855   ADD-TEST-F2-17
      870   ADD-TEST-F2-18
      886   ADD-TEST-F2-19
      483   ADD-TEST-F2-2
      902   ADD-TEST-F2-20
      918   ADD-TEST-F2-21
      934   ADD-TEST-F2-22
      955   ADD-TEST-F2-23
      976   ADD-TEST-F2-24
      999   ADD-TEST-F2-25
     1021   ADD-TEST-F2-26
     1063   ADD-TEST-F2-27-1 . . . . . . .  G1058
     1069   ADD-TEST-F2-27-2
     1081   ADD-TEST-F2-27-4
     1087   ADD-TEST-F2-27-5
     1093   ADD-TEST-F2-27-6
     1128   ADD-TEST-F2-28-1 . . . . . . .  G1123
     1135   ADD-TEST-F2-28-2
     1149   ADD-TEST-F2-28-4
     1156   ADD-TEST-F2-28-5
     1163   ADD-TEST-F2-28-6
     1170   ADD-TEST-F2-28-7
     1208   ADD-TEST-F2-29-1 . . . . . . .  G1203
     1215   ADD-TEST-F2-29-2
     1229   ADD-TEST-F2-29-4
     1236   ADD-TEST-F2-29-5
     1243   ADD-TEST-F2-29-6
     1250   ADD-TEST-F2-29-7
      500   ADD-TEST-F2-3-1
      517   ADD-TEST-F2-3-2
     1292   ADD-TEST-F2-30-1 . . . . . . .  G1287
     1299   ADD-TEST-F2-30-2
     1313   ADD-TEST-F2-30-4
     1320   ADD-TEST-F2-30-5
     1327   ADD-TEST-F2-30-6
     1334   ADD-TEST-F2-30-7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    49
0 Defined   Cross-reference of procedures   References

0    1372   ADD-TEST-F2-31-1 . . . . . . .  G1367
     1379   ADD-TEST-F2-31-2
     1393   ADD-TEST-F2-31-4
     1400   ADD-TEST-F2-31-5
     1407   ADD-TEST-F2-31-6
     1414   ADD-TEST-F2-31-7
     1458   ADD-TEST-F2-32-1 . . . . . . .  G1453
     1465   ADD-TEST-F2-32-2
     1479   ADD-TEST-F2-32-4
     1486   ADD-TEST-F2-32-5
     1493   ADD-TEST-F2-32-6
     1500   ADD-TEST-F2-32-7
     1540   ADD-TEST-F2-33-1 . . . . . . .  G1535
     1547   ADD-TEST-F2-33-2
     1561   ADD-TEST-F2-33-4
     1568   ADD-TEST-F2-33-5
     1575   ADD-TEST-F2-33-6
     1582   ADD-TEST-F2-33-7
     1606   ADD-TEST-F2-34-0
     1621   ADD-TEST-F2-34-1 . . . . . . .  G1616
     1634   ADD-TEST-F2-34-2
     1647   ADD-TEST-F2-34-3
     1660   ADD-TEST-F2-34-4
     1672   ADD-TEST-F2-34-5
     1696   ADD-TEST-F2-35-0
     1712   ADD-TEST-F2-35-1 . . . . . . .  G1707
     1725   ADD-TEST-F2-35-2
     1738   ADD-TEST-F2-35-3
     1751   ADD-TEST-F2-35-4
     1763   ADD-TEST-F2-35-5
     1787   ADD-TEST-F2-36-0
     1802   ADD-TEST-F2-36-1 . . . . . . .  G1797
     1815   ADD-TEST-F2-36-2
     1828   ADD-TEST-F2-36-3
     1841   ADD-TEST-F2-36-4
     1853   ADD-TEST-F2-36-5
     1877   ADD-TEST-F2-37-0
     1893   ADD-TEST-F2-37-1 . . . . . . .  G1888
     1906   ADD-TEST-F2-37-2
     1919   ADD-TEST-F2-37-3
     1932   ADD-TEST-F2-37-4
     1944   ADD-TEST-F2-37-5
     1968   ADD-TEST-F2-38-0
     1983   ADD-TEST-F2-38-1 . . . . . . .  G1978
     1996   ADD-TEST-F2-38-2
     2008   ADD-TEST-F2-38-3
     2032   ADD-TEST-F2-39-0
     2048   ADD-TEST-F2-39-1 . . . . . . .  G2043
     2061   ADD-TEST-F2-39-2
     2073   ADD-TEST-F2-39-3
      525   ADD-TEST-F2-4-1
      540   ADD-TEST-F2-4-2
     2090   ADD-TEST-F2-40-0
     2093   ADD-TEST-F2-40-1
     2112   ADD-TEST-F2-41-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    50
0 Defined   Cross-reference of procedures   References

0    2117   ADD-TEST-F2-41-1
      557   ADD-TEST-F2-5
      574   ADD-TEST-F2-6
      593   ADD-TEST-F2-7
      613   ADD-TEST-F2-8-1
      627   ADD-TEST-F2-8-2
      643   ADD-TEST-F2-9-1
      660   ADD-TEST-F2-9-2
      480   ADD-WRITE-F2-1 . . . . . . . .  G471 G475
      692   ADD-WRITE-F2-10-1. . . . . . .  G685 G688
      707   ADD-WRITE-F2-10-2. . . . . . .  G697 G702
      731   ADD-WRITE-F2-11. . . . . . . .  G722 G726
      753   ADD-WRITE-F2-12. . . . . . . .  G744 G748
      775   ADD-WRITE-F2-13. . . . . . . .  G766 G770
      790   ADD-WRITE-F2-14. . . . . . . .  G781 G785
      807   ADD-WRITE-F2-15-1. . . . . . .  G800 G804
      821   ADD-WRITE-F2-15-2. . . . . . .  G816 G818
      838   ADD-WRITE-F2-16-1. . . . . . .  G831 G835
      852   ADD-WRITE-F2-16-2. . . . . . .  G847 G849
      867   ADD-WRITE-F2-17. . . . . . . .  G860 G864
      883   ADD-WRITE-F2-18. . . . . . . .  G876 G880
      899   ADD-WRITE-F2-19. . . . . . . .  G892 G896
      496   ADD-WRITE-F2-2 . . . . . . . .  G487 G491
      915   ADD-WRITE-F2-20. . . . . . . .  G908 G912
      931   ADD-WRITE-F2-21. . . . . . . .  G924 G928
      947   ADD-WRITE-F2-22. . . . . . . .  G940 G944
      968   ADD-WRITE-F2-23. . . . . . . .  G961 G965
      991   ADD-WRITE-F2-24. . . . . . . .  G983 G987
     1013   ADD-WRITE-F2-25. . . . . . . .  G1007 G1010
     1037   ADD-WRITE-F2-26. . . . . . . .  G1030 G1033
      514   ADD-WRITE-F2-3-1 . . . . . . .  G503 G509
      537   ADD-WRITE-F2-4-1 . . . . . . .  G528 G532
      552   ADD-WRITE-F2-4-2 . . . . . . .  G543 G547
     2104   ADD-WRITE-F2-40. . . . . . . .  G2095 G2099
     2128   ADD-WRITE-F2-41. . . . . . . .  G2119 G2123
      571   ADD-WRITE-F2-5 . . . . . . . .  G562 G566
      590   ADD-WRITE-F2-6 . . . . . . . .  G581 G585
      608   ADD-WRITE-F2-7 . . . . . . . .  G599 G603
      624   ADD-WRITE-F2-8-1 . . . . . . .  G616 G620
      640   ADD-WRITE-F2-8-2 . . . . . . .  G629 G634
      657   ADD-WRITE-F2-9-1 . . . . . . .  G649 G653
      673   ADD-WRITE-F2-9-2 . . . . . . .  G662 G667
      452   BAIL-OUT . . . . . . . . . . .  P369
      460   BAIL-OUT-EX. . . . . . . . . .  E369 G454
      455   BAIL-OUT-WRITE . . . . . . . .  G453
      435   BLANK-LINE-PRINT
     2132   CCVS-EXIT
     2133   CCVS-999999
      344   CCVS1
      461   CCVS1-EXIT . . . . . . . . . .  G350
      351   CLOSE-FILES. . . . . . . . . .  G2134
      379   COLUMN-NAMES-ROUTINE . . . . .  E349
      360   DE-LETE. . . . . . . . . . . .  P474 P490 P508 P531 P546 P565 P584 P602 P619 P633 P652 P666 P687 P701 P725 P747
                                            P769 P784 P806 P820 P837 P851 P866 P882 P898 P914 P930 P946 P964 P986 P1009 P1032
                                            P1060 P1125 P1205 P1289 P1369 P1455 P1537 P1618 P1709 P1799 P1890 P1980 P2045
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    51
0 Defined   Cross-reference of procedures   References

0                                           P2098 P2122
      383   END-ROUTINE. . . . . . . . . .  P352
      387   END-ROUTINE-1
      396   END-ROUTINE-12
      404   END-ROUTINE-13 . . . . . . . .  E352
      385   END-RTN-EXIT
      359   FAIL . . . . . . . . . . . . .  P479 P495 P513 P523 P536 P551 P570 P589 P607 P623 P639 P656 P672 P691 P706 P730
                                            P752 P774 P789 P803 P812 P834 P843 P863 P879 P895 P911 P927 P943 P961 P990 P1007
                                            P1036 P1066 P1072 P1078 P1084 P1090 P1096 P1132 P1139 P1146 P1153 P1160 P1167
                                            P1180 P1212 P1219 P1226 P1233 P1240 P1247 P1260 P1296 P1303 P1310 P1317 P1324
                                            P1331 P1344 P1376 P1383 P1390 P1397 P1404 P1411 P1424 P1462 P1469 P1476 P1483
                                            P1490 P1497 P1510 P1544 P1551 P1558 P1565 P1572 P1579 P1592 P1631 P1644 P1657
                                            P1669 P1682 P1722 P1735 P1748 P1760 P1773 P1812 P1825 P1838 P1850 P1863 P1903
                                            P1916 P1929 P1941 P1954 P1993 P2005 P2018 P2058 P2070 P2083 P2103 P2127
      437   FAIL-ROUTINE . . . . . . . . .  P368
      451   FAIL-ROUTINE-EX. . . . . . . .  E368 G445
      446   FAIL-ROUTINE-WRITE . . . . . .  G439 G440
      374   HEAD-ROUTINE . . . . . . . . .  P349
      357   INSPT
      345   OPEN-FILES
      358   PASS . . . . . . . . . . . . .  P470 P486 P502 P527 P542 P562 P581 P599 P616 P629 P649 P662 P684 P697 P722 P744
                                            P766 P781 P799 P817 P830 P848 P859 P875 P891 P907 P923 P939 P967 P982 P1012 P1029
                                            P1064 P1070 P1076 P1082 P1088 P1094 P1130 P1137 P1144 P1151 P1158 P1165 P1173
                                            P1210 P1217 P1224 P1231 P1238 P1245 P1253 P1294 P1301 P1308 P1315 P1322 P1329
                                            P1337 P1374 P1381 P1388 P1395 P1402 P1409 P1417 P1460 P1467 P1474 P1481 P1488
                                            P1495 P1503 P1542 P1549 P1556 P1563 P1570 P1577 P1585 P1624 P1637 P1650 P1663
                                            P1675 P1715 P1728 P1741 P1754 P1766 P1805 P1818 P1831 P1844 P1856 P1896 P1909
                                            P1922 P1935 P1947 P1986 P1999 P2011 P2051 P2064 P2076 P2095 P2119
      362   PRINT-DETAIL . . . . . . . . .  P482 P498 P516 P524 P539 P554 P573 P592 P610 P626 P642 P659 P675 P694 P709 P733
                                            P755 P777 P792 P809 P823 P840 P854 P869 P885 P901 P917 P933 P949 P970 P993 P1015
                                            P1039 P1061 P1064 P1067 P1070 P1073 P1076 P1079 P1082 P1085 P1088 P1091 P1094
                                            P1097 P1126 P1130 P1133 P1137 P1140 P1144 P1147 P1151 P1154 P1158 P1161 P1165
                                            P1168 P1174 P1181 P1206 P1210 P1213 P1217 P1220 P1224 P1227 P1231 P1234 P1238
                                            P1241 P1245 P1248 P1254 P1261 P1290 P1294 P1297 P1301 P1304 P1308 P1311 P1315
                                            P1318 P1322 P1325 P1329 P1332 P1338 P1345 P1370 P1374 P1377 P1381 P1384 P1388
                                            P1391 P1395 P1398 P1402 P1405 P1409 P1412 P1418 P1425 P1456 P1460 P1463 P1467
                                            P1470 P1474 P1477 P1481 P1484 P1488 P1491 P1495 P1498 P1504 P1511 P1538 P1542
                                            P1545 P1549 P1552 P1556 P1559 P1563 P1566 P1570 P1573 P1577 P1580 P1586 P1593
                                            P1619 P1625 P1632 P1638 P1645 P1651 P1658 P1664 P1670 P1676 P1683 P1710 P1716
                                            P1723 P1729 P1736 P1742 P1749 P1755 P1761 P1767 P1774 P1800 P1806 P1813 P1819
                                            P1826 P1832 P1839 P1845 P1851 P1857 P1864 P1891 P1897 P1904 P1910 P1917 P1923
                                            P1930 P1936 P1942 P1948 P1955 P1981 P1987 P1994 P2000 P2006 P2012 P2019 P2046
                                            P2052 P2059 P2065 P2071 P2077 P2084 P2106 P2130
      463   SECT-NC177A-001
      355   TERMINATE-CALL
      353   TERMINATE-CCVS
      416   WRITE-LINE . . . . . . . . . .  P366 P367 P375 P376 P377 P378 P380 P381 P382 P384 P386 P395 P403 P409 P414 P415
                                            P443 P447 P449 P458
      432   WRT-LN . . . . . . . . . . . .  P422 P423 P424 P425 P426 P427 P428 P431 P436
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    52
0 Defined   Cross-reference of programs     References

        3   NC177A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC177A    Date 06/04/2022  Time 12:00:47   Page    53
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC177A:
 *    Source records = 2134
 *    Data Division statements = 183
 *    Procedure Division statements = 1458
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1478
0End of compilation 1,  program NC177A,  highest severity 0.
0Return code 0
