1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:44   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:44   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1184.2
   000002         000200 PROGRAM-ID.                                                      NC1184.2
   000003         000300     NC118A.                                                      NC1184.2
   000004         000500*                                                              *  NC1184.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1184.2
   000006         000700*                                                              *  NC1184.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1184.2
   000008         000900*                                                              *  NC1184.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1184.2
   000010         001100*                                                              *  NC1184.2
   000011         001300*                                                              *  NC1184.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1184.2
   000013         001500*                                                              *  NC1184.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1184.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1184.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1184.2
   000017         001900*                                                              *  NC1184.2
   000018         002100*                                                                 NC1184.2
   000019         002200*    PROGRAM NC118A TESTS THE USE OF THE "SIGN" CLAUSE USING      NC1184.2
   000020         002300*    FORMATS 1 AND 2 OF THE ADD STATEMENT.  ALL COMBINATIONS      NC1184.2
   000021         002400*    OF THE SIGN CLAUSE PHRASES ARE TESTED USING DATA ITEMS       NC1184.2
   000022         002500*    OF VARIOUS LENGTHS.                                          NC1184.2
   000023         002600*                                                                 NC1184.2
   000024         002700                                                                  NC1184.2
   000025         002800 ENVIRONMENT DIVISION.                                            NC1184.2
   000026         002900 CONFIGURATION SECTION.                                           NC1184.2
   000027         003000 SOURCE-COMPUTER.                                                 NC1184.2
   000028         003100     XXXXX082.                                                    NC1184.2
   000029         003200 OBJECT-COMPUTER.                                                 NC1184.2
   000030         003300     XXXXX083.                                                    NC1184.2
   000031         003400 INPUT-OUTPUT SECTION.                                            NC1184.2
   000032         003500 FILE-CONTROL.                                                    NC1184.2
   000033         003600     SELECT PRINT-FILE ASSIGN TO                                  NC1184.2 37
   000034         003700     XXXXX055.                                                    NC1184.2
   000035         003800 DATA DIVISION.                                                   NC1184.2
   000036         003900 FILE SECTION.                                                    NC1184.2
   000037         004000 FD  PRINT-FILE.                                                  NC1184.2

 ==000037==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000038         004100 01  PRINT-REC PICTURE X(120).                                    NC1184.2
   000039         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC1184.2
   000040         004300 WORKING-STORAGE SECTION.                                         NC1184.2
   000041         004400 77  SIZE-ERR                     PICTURE X  VALUE SPACE.         NC1184.2 IMP
   000042         004500 77  A18TWOS-DS-LS-18V00             PICTURE S9(18)               NC1184.2
   000043         004600             SIGN IS LEADING SEPARATE                             NC1184.2
   000044         004700                                  VALUE 222222222222222222.       NC1184.2
   000045         004800 77  A18ONES-DS-TS-18V00             PICTURE S9(18)               NC1184.2
   000046         004900            SIGN IS TRAILING SEPARATE                             NC1184.2
   000047         005000                                  VALUE 111111111111111111.       NC1184.2
   000048         005100 77  WRK-DS-10V00                 PICTURE S9(10) TRAILING.        NC1184.2
   000049         005200 77  A10ONES-DS-T-10V00             PICTURE S9(10)                NC1184.2
   000050         005300            SIGN TRAILING                                         NC1184.2
   000051         005400                                  VALUE 1111111111.               NC1184.2
   000052         005500 77  A05ONES-DS-L-05V00             PICTURE S9(5)                 NC1184.2
   000053         005600           SIGN LEADING                                           NC1184.2
   000054         005700                                  VALUE 11111.                    NC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  A02ONES-DS-LS-02V00             PICTURE S99                  NC1184.2
   000056         005900           LEADING SEPARATE                                       NC1184.2
   000057         006000                                  VALUE 11.                       NC1184.2
   000058         006100 77  WRK-DS-09V09                 PICTURE S9(9)V9(9) TRAILING.    NC1184.2
   000059         006200 77  WRK-DS-T-18V00 REDEFINES WRK-DS-09V09                        NC1184.2 58
   000060         006300                                  PICTURE S9(18) TRAILING.        NC1184.2
   000061         006400 77  A06THREES-DS-03V03           PICTURE S999V999                NC1184.2
   000062         006500                                  VALUE 333.333.                  NC1184.2
   000063         006600 77  A12THREES-DS-06V06           PICTURE S9(6)V9(6)              NC1184.2
   000064         006700                                  VALUE 333333.333333.            NC1184.2
   000065         006800 77  WRK-DS-TS-06V06                 PICTURE S9(6)V9(6)           NC1184.2
   000066         006900           SIGN IS TRAILING SEPARATE CHARACTER.                   NC1184.2
   000067         007000 77  WRK-DS-TS-12V00-S REDEFINES WRK-DS-TS-06V06                  NC1184.2 65
   000068         007100         TRAILING SEPARATE                                        NC1184.2
   000069         007200                                  PICTURE S9(12).                 NC1184.2
   000070         007300 77  A05ONES-DS-LS-00V05             PICTURE SV9(5)               NC1184.2
   000071         007400         LEADING SEPARATE                                         NC1184.2
   000072         007500                                  VALUE .11111.                   NC1184.2
   000073         007600 77  WRK-DS-T-05V00              PICTURE S9(5) TRAILING.          NC1184.2
   000074         007700 77  WRK-DS-T-06V00                 PICTURE S9(6) TRAILING.       NC1184.2
   000075         007800 77  WRK-DS-02V00                 PICTURE S99.                    NC1184.2
   000076         007900 77  A12ONES-DS-L-12V00             PICTURE S9(12)                NC1184.2
   000077         008000              USAGE IS DISPLAY SIGN IS LEADING                    NC1184.2
   000078         008100                                  VALUE 111111111111.             NC1184.2
   000079         008200 77  WRK-DS-03V10                 PICTURE S999V9(10).             NC1184.2
   000080         008300 77  WRK-DS-13V00-S REDEFINES WRK-DS-03V10                        NC1184.2 79
   000081         008400                                  PICTURE S9(13).                 NC1184.2
   000082         008500 77  A99-DS-T-02V00                 PICTURE S99                   NC1184.2
   000083         008600             USAGE IS DISPLAY SIGN IS TRAILING                    NC1184.2
   000084         008700                                  VALUE 99.                       NC1184.2
   000085         008800 77  A03ONES-DS-02V01             PICTURE S99V9                   NC1184.2
   000086         008900                                  VALUE 11.1.                     NC1184.2
   000087         009000 77  A06ONES-DS-TS-03V03             PICTURE S999V999             NC1184.2
   000088         009100             USAGE IS DISPLAY TRAILING SEPARATE                   NC1184.2
   000089         009200                                  VALUE 111.111.                  NC1184.2
   000090         009300 77  A08TWOS-DS-02V06             PICTURE S99V9(6)                NC1184.2
   000091         009400                                  VALUE 22.222222.                NC1184.2
   000092         009500 77  A01ONES-DS-LS-P0801              PICTURE SP(8)9              NC1184.2
   000093         009600             SIGN IS LEADING SEPARATE                             NC1184.2
   000094         009700                                  VALUE .000000001.               NC1184.2
   000095         009800 77  WRK-CS-18V00                 PICTURE S9(18) COMPUTATIONAL.   NC1184.2
   000096         009900 77  A18ONES-CS-18V00             PICTURE S9(18) COMPUTATIONAL    NC1184.2
   000097         010000                                  VALUE 111111111111111111.       NC1184.2
   000098         010100 77  WRK-CS-02V02                 PICTURE S99V99 COMPUTATIONAL.   NC1184.2
   000099         010200 77  A99-CS-02V00                 PICTURE S99 COMPUTATIONAL       NC1184.2
   000100         010300                                  VALUE 99.                       NC1184.2
   000101         010400 77  WRK-DS-TS-0201P            PICTURE S99P TRAILING SEPARATE.   NC1184.2
   000102         010500 77  WRK-DS-06V00                 PICTURE S9(6).                  NC1184.2
   000103         010600 77  AZERO-DS-LS-05V05               PICTURE S9(5)V9(5)           NC1184.2
   000104         010700             SIGN IS LEADING SEPARATE USAGE DISPLAY               NC1184.2
   000105         010800                                  VALUE ZERO.                     NC1184.2 IMP
   000106         010900 77  NDATA-DS-09V09               PICTURE S9(9)V9(9)              NC1184.2
   000107         011000                                  VALUE +012345678.876543210.     NC1184.2
   000108         011100 77  XDATA-XN-00018               PICTURE X(18)                   NC1184.2
   000109         011200                                  VALUE "00ABCDEFGHI  4321 ".     NC1184.2
   000110         011300 77  WRK-XN-00018                 PICTURE X(18).                  NC1184.2
   000111         011400 77  ADD-12    PICTURE PP9        VALUE .001.                     NC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 77  ADD-13    PICTURE 9PP        VALUE 100.                      NC1184.2
   000113         011600 77  ADD-14    PICTURE 999V999.                                   NC1184.2
   000114         011700 77  WRK-CU-18V00      PICTURE 9(18) VALUE ZERO COMPUTATIONAL.    NC1184.2 IMP
   000115         011800 77  A18EIGHTS-CS-18V00 PICTURE S9(18) VALUE -888888888888888888  NC1184.2
   000116         011900             COMPUTATIONAL.                                       NC1184.2
   000117         012000 77  A14TWOS-CS-18V00  PICTURE S9(18) VALUE -000022222222222222   NC1184.2
   000118         012100             COMPUTATIONAL.                                       NC1184.2
   000119         012200 77  A12THREES-CU-18V00 PICTURE 9(18) VALUE 000000333333333333    NC1184.2
   000120         012300             COMPUTATIONAL.                                       NC1184.2
   000121         012400 77  A16FOURS-CS-18V00 PICTURE S9(18) VALUE 004444444444444444    NC1184.2
   000122         012500             COMPUTATIONAL.                                       NC1184.2
   000123         012600 77  A18FIVES-CS-18V00 PICTURE S9(18) VALUE -555555555555555555   NC1184.2
   000124         012700             COMPUTATIONAL.                                       NC1184.2
   000125         012800 77  A18SIXES-CS-18V00 PICTURE S9(18) VALUE 666666666666666666    NC1184.2
   000126         012900             COMPUTATIONAL.                                       NC1184.2
   000127         013000 77  A12SEVENS-CU-18V00 PICTURE 9(18) VALUE 000000777777777777    NC1184.2
   000128         013100             COMPUTATIONAL.                                       NC1184.2
   000129         013200 77  WRK-DU-18V00      PICTURE 9(18) VALUE ZERO.                  NC1184.2 IMP
   000130         013300 77  A18THREES-CS-18V00 PICTURE S9(18) VALUE -333333333333333333  NC1184.2
   000131         013400             COMPUTATIONAL.                                       NC1184.2
   000132         013500 77  WRK-CS-03V00 PICTURE S999 COMPUTATIONAL SYNCHRONIZED RIGHT.  NC1184.2
   000133         013600 01  SUBTRACT-DATA SIGN IS LEADING SEPARATE DISPLAY.              NC1184.2
   000134         013700     02  SUBTR-1    PICTURE 9         VALUE 1.                    NC1184.2
   000135         013800     02  SUBTR-2    PICTURE S99       VALUE 99.                   NC1184.2
   000136         013900     02  SUBTR-3    PICTURE S9V99     VALUE -1.                   NC1184.2
   000137         014000     02  SUBTR-4    PICTURE SPP9      VALUE .001.                 NC1184.2
   000138         014100     02  SUBTR-5    PICTURE S9PP      VALUE 100.                  NC1184.2
   000139         014200     02  SUBTR-6    PICTURE 9  VALUE 1.                           NC1184.2
   000140         014300     02  SUBTR-7    PICTURE S99  VALUE 99.                        NC1184.2
   000141         014400     02  SUBTR-8    PICTURE S9V99  VALUE -9.99.                   NC1184.2
   000142         014500     02  SUBTR-10    PICTURE S999  VALUE 100.                     NC1184.2
   000143         014600     02  SUBTR-11   PICTURE S999V999.                             NC1184.2
   000144         014700 01  N-3                                PICTURE IS 99999.         NC1184.2
   000145         014800 01  N-4                                PICTURE IS 9(5)           NC1184.2
   000146         014900     VALUE IS 52800.                                              NC1184.2
   000147         015000 01  N-5                                PICTURE IS S9(9)V99       NC1184.2
   000148         015100             SIGN IS LEADING SEPARATE                             NC1184.2
   000149         015200     VALUE IS 000000001.00.                                       NC1184.2
   000150         015300 01  N-7                                PICTURE IS S9(7)V9(4)     NC1184.2
   000151         015400             SIGN IS LEADING SEPARATE CHARACTER                   NC1184.2
   000152         015500     VALUE IS 0000001.0000.                                       NC1184.2
   000153         015600 01  X-8 REDEFINES N-7                  PICTURE IS X(11).         NC1184.2 150
   000154         015700 01  N-10                               PICTURE IS S99999V        NC1184.2
   000155         015800     VALUE IS -00001.                                             NC1184.2
   000156         015900 01  N-11                               PICTURE IS 9 VALUE IS 9.  NC1184.2
   000157         016000 01  N-12                               PICTURE IS 9 VALUE IS 9.  NC1184.2
   000158         016100 01  N-13                               PICTURE IS 9(5)           NC1184.2
   000159         016200     VALUE IS 99999.                                              NC1184.2
   000160         016300 01  N-14                               PICTURE IS 9 VALUE IS 1.  NC1184.2
   000161         016400 01  N-15                               PICTURE IS 9(16).         NC1184.2
   000162         016500 01  N-16                               PICTURE IS S999999V99     NC1184.2
   000163         016600     VALUE IS 5.90.                                               NC1184.2
   000164         016700 01  N-17                               PICTURE IS S9(3)V99       NC1184.2
   000165         016800     VALUE IS +3.6.                                               NC1184.2
   000166         016900 01  N-18                               PICTURE IS S9(10)         NC1184.2
   000167         017000     VALUE IS -5.                                                 NC1184.2
   000168         017100 01  N-19                               PICTURE IS $9.00.         NC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  N-20                               PICTURE IS S9(9)          NC1184.2
   000170         017300     VALUE IS -999999999.                                         NC1184.2
   000171         017400 01  N-21                               PICTURE IS 9 VALUE IS 5.  NC1184.2
   000172         017500 01  N-22                               PICTURE IS 999V99         NC1184.2
   000173         017600     VALUE IS 005.55.                                             NC1184.2
   000174         017700 01  N-23                               PICTURE IS $$$.99CR.      NC1184.2
   000175         017800 01  N-25                               PICTURE IS 9 VALUE IS 1.  NC1184.2
   000176         017900 01  N-26               PICTURE 9(5).                             NC1184.2
   000177         018000 01  N-27                               PICTURE IS 9999V9         NC1184.2
   000178         018100     VALUE IS 9999.9.                                             NC1184.2
   000179         018200 01  N-28                               PICTURE IS $9999.00.      NC1184.2
   000180         018300 01  N-40                               PICTURE IS 9(7)           NC1184.2
   000181         018400     VALUE IS 7777777.                                            NC1184.2
   000182         018500 01  N-41                               PICTURE IS 9(7)           NC1184.2
   000183         018600     VALUE IS 1111111.                                            NC1184.2
   000184         018700 01  N-42                               PICTURE IS 9(3)P(4).      NC1184.2
   000185         018800 01  TRUNC-DATA.                                                  NC1184.2
   000186         018900     02 N-43  PICTURE S9V9 VALUE +1.6.                            NC1184.2
   000187         019000     02 N-44  PICTURE S9V9 VALUE -1.6.                            NC1184.2
   000188         019100     02 N-45  PICTURE S9.                                         NC1184.2
   000189         019200 01  MINUS-NAMES SIGN IS TRAILING SEPARATE CHARACTER.             NC1184.2
   000190         019300     02  MINUS-NAME1 PICTURE S9(18) VALUE -999999999999999999.    NC1184.2
   000191         019400     02  MINUS-NAME2 PICTURE S9(18) VALUE -999999999999999999.    NC1184.2
   000192         019500     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC1184.2
   000193         019600     02  PLUS-NAME1  PICTURE S9(18) VALUE +999999999999999999.    NC1184.2
   000194         019700     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC1184.2
   000195         019800     02  MINUS-NAME3 PICTURE SV9(18) VALUE -.999999999999999999.  NC1184.2
   000196         019900     02  MINUS-NAME4 PICTURE SV9(18) VALUE -.999999999999999999.  NC1184.2
   000197         020000     02  EVEN-NAME2  PICTURE SV9(18)  VALUE +.1.                  NC1184.2
   000198         020100     02  PLUS-NAME3  PICTURE SV9(18) VALUE +.999999999999999999.  NC1184.2
   000199         020200     02  PLUS-NAME4  PICTURE SV9(18) VALUE +.999999999999999999.  NC1184.2
   000200         020300     02  WHOLE-FIELD   PICTURE S9(18).                            NC1184.2
   000201         020400     02  DECMAL-FIELD  PICTURE SV9(18).                           NC1184.2
   000202         020500 01  TEST-RESULTS.                                                NC1184.2
   000203         020600     02 FILLER                   PIC X      VALUE SPACE.          NC1184.2 IMP
   000204         020700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1184.2 IMP
   000205         020800     02 FILLER                   PIC X      VALUE SPACE.          NC1184.2 IMP
   000206         020900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1184.2 IMP
   000207         021000     02 FILLER                   PIC X      VALUE SPACE.          NC1184.2 IMP
   000208         021100     02  PAR-NAME.                                                NC1184.2
   000209         021200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1184.2 IMP
   000210         021300       03  PARDOT-X              PIC X      VALUE SPACE.          NC1184.2 IMP
   000211         021400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1184.2 IMP
   000212         021500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1184.2 IMP
   000213         021600     02 RE-MARK                  PIC X(61).                       NC1184.2
   000214         021700 01  TEST-COMPUTED.                                               NC1184.2
   000215         021800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1184.2 IMP
   000216         021900     02 FILLER                   PIC X(17)  VALUE                 NC1184.2
   000217         022000            "       COMPUTED=".                                   NC1184.2
   000218         022100     02 COMPUTED-X.                                               NC1184.2
   000219         022200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1184.2 IMP
   000220         022300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1184.2 219
   000221         022400                                 PIC -9(9).9(9).                  NC1184.2
   000222         022500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1184.2 219
   000223         022600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1184.2 219
   000224         022700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1184.2 219
   000225         022800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1184.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900         04 COMPUTED-18V0                    PIC -9(18).          NC1184.2
   000227         023000         04 FILLER                           PIC X.               NC1184.2
   000228         023100     03 FILLER PIC X(50) VALUE SPACE.                             NC1184.2 IMP
   000229         023200 01  TEST-CORRECT.                                                NC1184.2
   000230         023300     02 FILLER PIC X(30) VALUE SPACE.                             NC1184.2 IMP
   000231         023400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1184.2
   000232         023500     02 CORRECT-X.                                                NC1184.2
   000233         023600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1184.2 IMP
   000234         023700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1184.2 233
   000235         023800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1184.2 233
   000236         023900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1184.2 233
   000237         024000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1184.2 233
   000238         024100     03      CR-18V0 REDEFINES CORRECT-A.                         NC1184.2 233
   000239         024200         04 CORRECT-18V0                     PIC -9(18).          NC1184.2
   000240         024300         04 FILLER                           PIC X.               NC1184.2
   000241         024400     03 FILLER PIC X(2) VALUE SPACE.                              NC1184.2 IMP
   000242         024500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1184.2 IMP
   000243         024600 01  CCVS-C-1.                                                    NC1184.2
   000244         024700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1184.2
   000245         024800-    "SS  PARAGRAPH-NAME                                          NC1184.2
   000246         024900-    "       REMARKS".                                            NC1184.2
   000247         025000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1184.2 IMP
   000248         025100 01  CCVS-C-2.                                                    NC1184.2
   000249         025200     02 FILLER                     PIC X        VALUE SPACE.      NC1184.2 IMP
   000250         025300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1184.2
   000251         025400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1184.2 IMP
   000252         025500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1184.2
   000253         025600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1184.2 IMP
   000254         025700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1184.2 IMP
   000255         025800 01  REC-CT                        PIC 99       VALUE ZERO.       NC1184.2 IMP
   000256         025900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1184.2 IMP
   000257         026000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1184.2 IMP
   000258         026100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1184.2 IMP
   000259         026200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1184.2 IMP
   000260         026300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1184.2 IMP
   000261         026400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1184.2 IMP
   000262         026500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1184.2 IMP
   000263         026600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1184.2 IMP
   000264         026700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1184.2 IMP
   000265         026800 01  CCVS-H-1.                                                    NC1184.2
   000266         026900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1184.2 IMP
   000267         027000     02  FILLER                    PIC X(42)    VALUE             NC1184.2
   000268         027100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1184.2
   000269         027200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1184.2 IMP
   000270         027300 01  CCVS-H-2A.                                                   NC1184.2
   000271         027400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1184.2 IMP
   000272         027500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1184.2
   000273         027600   02  FILLER                        PIC XXXX   VALUE             NC1184.2
   000274         027700     "4.2 ".                                                      NC1184.2
   000275         027800   02  FILLER                        PIC X(28)  VALUE             NC1184.2
   000276         027900            " COPY - NOT FOR DISTRIBUTION".                       NC1184.2
   000277         028000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1184.2 IMP
   000278         028100                                                                  NC1184.2
   000279         028200 01  CCVS-H-2B.                                                   NC1184.2
   000280         028300   02  FILLER                        PIC X(15)  VALUE             NC1184.2
   000281         028400            "TEST RESULT OF ".                                    NC1184.2
   000282         028500   02  TEST-ID                       PIC X(9).                    NC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600   02  FILLER                        PIC X(4)   VALUE             NC1184.2
   000284         028700            " IN ".                                               NC1184.2
   000285         028800   02  FILLER                        PIC X(12)  VALUE             NC1184.2
   000286         028900     " HIGH       ".                                              NC1184.2
   000287         029000   02  FILLER                        PIC X(22)  VALUE             NC1184.2
   000288         029100            " LEVEL VALIDATION FOR ".                             NC1184.2
   000289         029200   02  FILLER                        PIC X(58)  VALUE             NC1184.2
   000290         029300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1184.2
   000291         029400 01  CCVS-H-3.                                                    NC1184.2
   000292         029500     02  FILLER                      PIC X(34)  VALUE             NC1184.2
   000293         029600            " FOR OFFICIAL USE ONLY    ".                         NC1184.2
   000294         029700     02  FILLER                      PIC X(58)  VALUE             NC1184.2
   000295         029800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1184.2
   000296         029900     02  FILLER                      PIC X(28)  VALUE             NC1184.2
   000297         030000            "  COPYRIGHT   1985 ".                                NC1184.2
   000298         030100 01  CCVS-E-1.                                                    NC1184.2
   000299         030200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1184.2 IMP
   000300         030300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1184.2
   000301         030400     02 ID-AGAIN                     PIC X(9).                    NC1184.2
   000302         030500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1184.2 IMP
   000303         030600 01  CCVS-E-2.                                                    NC1184.2
   000304         030700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1184.2 IMP
   000305         030800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1184.2 IMP
   000306         030900     02 CCVS-E-2-2.                                               NC1184.2
   000307         031000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1184.2 IMP
   000308         031100         03 FILLER                   PIC X      VALUE SPACE.      NC1184.2 IMP
   000309         031200         03 ENDER-DESC               PIC X(44)  VALUE             NC1184.2
   000310         031300            "ERRORS ENCOUNTERED".                                 NC1184.2
   000311         031400 01  CCVS-E-3.                                                    NC1184.2
   000312         031500     02  FILLER                      PIC X(22)  VALUE             NC1184.2
   000313         031600            " FOR OFFICIAL USE ONLY".                             NC1184.2
   000314         031700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1184.2 IMP
   000315         031800     02  FILLER                      PIC X(58)  VALUE             NC1184.2
   000316         031900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1184.2
   000317         032000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1184.2 IMP
   000318         032100     02 FILLER                       PIC X(15)  VALUE             NC1184.2
   000319         032200             " COPYRIGHT 1985".                                   NC1184.2
   000320         032300 01  CCVS-E-4.                                                    NC1184.2
   000321         032400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1184.2 IMP
   000322         032500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1184.2
   000323         032600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1184.2 IMP
   000324         032700     02 FILLER                       PIC X(40)  VALUE             NC1184.2
   000325         032800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1184.2
   000326         032900 01  XXINFO.                                                      NC1184.2
   000327         033000     02 FILLER                       PIC X(19)  VALUE             NC1184.2
   000328         033100            "*** INFORMATION ***".                                NC1184.2
   000329         033200     02 INFO-TEXT.                                                NC1184.2
   000330         033300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1184.2 IMP
   000331         033400       04 XXCOMPUTED                 PIC X(20).                   NC1184.2
   000332         033500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1184.2 IMP
   000333         033600       04 XXCORRECT                  PIC X(20).                   NC1184.2
   000334         033700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1184.2
   000335         033800 01  HYPHEN-LINE.                                                 NC1184.2
   000336         033900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1184.2 IMP
   000337         034000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1184.2
   000338         034100-    "*****************************************".                 NC1184.2
   000339         034200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300-    "******************************".                            NC1184.2
   000341         034400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1184.2
   000342         034500     "NC118A".                                                    NC1184.2
   000343         034600 PROCEDURE DIVISION.                                              NC1184.2
   000344         034700 CCVS1 SECTION.                                                   NC1184.2
   000345         034800 OPEN-FILES.                                                      NC1184.2
   000346         034900     OPEN     OUTPUT PRINT-FILE.                                  NC1184.2 37
   000347         035000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1184.2 341 282 341 301
   000348         035100     MOVE    SPACE TO TEST-RESULTS.                               NC1184.2 IMP 202
   000349         035200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1184.2 374 379
   000350         035300     GO TO CCVS1-EXIT.                                            NC1184.2 461
   000351         035400 CLOSE-FILES.                                                     NC1184.2
   000352         035500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1184.2 383 404 37
   000353         035600 TERMINATE-CCVS.                                                  NC1184.2
   000354         035700     EXIT PROGRAM.                                                NC1184.2
   000355         035800 TERMINATE-CALL.                                                  NC1184.2
   000356         035900     STOP     RUN.                                                NC1184.2
   000357         036000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1184.2 206 258
   000358         036100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1184.2 206 259
   000359         036200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1184.2 206 257
   000360         036300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1184.2 206 256
   000361         036400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1184.2 213
   000362         036500 PRINT-DETAIL.                                                    NC1184.2
   000363         036600     IF REC-CT NOT EQUAL TO ZERO                                  NC1184.2 255 IMP
   000364      1  036700             MOVE "." TO PARDOT-X                                 NC1184.2 210
   000365      1  036800             MOVE REC-CT TO DOTVALUE.                             NC1184.2 255 211
   000366         036900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1184.2 202 38 416
   000367         037000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1184.2 206 416
   000368      1  037100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1184.2 437 451
   000369      1  037200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1184.2 452 460
   000370         037300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1184.2 IMP 206 IMP 218
   000371         037400     MOVE SPACE TO CORRECT-X.                                     NC1184.2 IMP 232
   000372         037500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1184.2 255 IMP IMP 208
   000373         037600     MOVE     SPACE TO RE-MARK.                                   NC1184.2 IMP 213
   000374         037700 HEAD-ROUTINE.                                                    NC1184.2
   000375         037800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1184.2 265 39 416
   000376         037900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1184.2 270 39 416
   000377         038000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1184.2 279 39 416
   000378         038100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1184.2 291 39 416
   000379         038200 COLUMN-NAMES-ROUTINE.                                            NC1184.2
   000380         038300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1184.2 243 39 416
   000381         038400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1184.2 248 39 416
   000382         038500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1184.2 335 39 416
   000383         038600 END-ROUTINE.                                                     NC1184.2
   000384         038700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1184.2 335 39 416
   000385         038800 END-RTN-EXIT.                                                    NC1184.2
   000386         038900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1184.2 298 39 416
   000387         039000 END-ROUTINE-1.                                                   NC1184.2
   000388         039100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1184.2 257 261 258
   000389         039200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1184.2 261 256 261
   000390         039300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1184.2 259 261
   000391         039400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1184.2
   000392         039500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1184.2 259 321
   000393         039600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1184.2 261 323
   000394         039700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1184.2 320 306
   000395         039800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1184.2 303 39 416
   000396         039900  END-ROUTINE-12.                                                 NC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1184.2 309
   000398         040100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1184.2 257 IMP
   000399      1  040200         MOVE "NO " TO ERROR-TOTAL                                NC1184.2 307
   000400         040300         ELSE                                                     NC1184.2
   000401      1  040400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1184.2 257 307
   000402         040500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1184.2 303 39
   000403         040600     PERFORM WRITE-LINE.                                          NC1184.2 416
   000404         040700 END-ROUTINE-13.                                                  NC1184.2
   000405         040800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1184.2 256 IMP
   000406      1  040900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1184.2 307
   000407      1  041000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1184.2 256 307
   000408         041100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1184.2 309
   000409         041200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1184.2 303 39 416
   000410         041300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1184.2 258 IMP
   000411      1  041400          MOVE "NO " TO ERROR-TOTAL                               NC1184.2 307
   000412      1  041500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1184.2 258 307
   000413         041600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1184.2 309
   000414         041700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1184.2 303 39 416
   000415         041800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1184.2 311 39 416
   000416         041900 WRITE-LINE.                                                      NC1184.2
   000417         042000     ADD 1 TO RECORD-COUNT.                                       NC1184.2 263
   000418         042100     IF RECORD-COUNT GREATER 42                                   NC1184.2 263
   000419      1  042200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1184.2 39 262
   000420      1  042300         MOVE SPACE TO DUMMY-RECORD                               NC1184.2 IMP 39
   000421      1  042400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1184.2 39
   000422      1  042500         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1184.2 265 39 432
   000423      1  042600         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1184.2 270 39 432
   000424      1  042700         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1184.2 279 39 432
   000425      1  042800         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1184.2 291 39 432
   000426      1  042900         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1184.2 243 39 432
   000427      1  043000         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1184.2 248 39 432
   000428      1  043100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1184.2 335 39 432
   000429      1  043200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1184.2 262 39
   000430      1  043300         MOVE ZERO TO RECORD-COUNT.                               NC1184.2 IMP 263
   000431         043400     PERFORM WRT-LN.                                              NC1184.2 432
   000432         043500 WRT-LN.                                                          NC1184.2
   000433         043600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1184.2 39
   000434         043700     MOVE SPACE TO DUMMY-RECORD.                                  NC1184.2 IMP 39
   000435         043800 BLANK-LINE-PRINT.                                                NC1184.2
   000436         043900     PERFORM WRT-LN.                                              NC1184.2 432
   000437         044000 FAIL-ROUTINE.                                                    NC1184.2
   000438         044100     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1184.2 218 IMP
   000439      1  044200            GO TO FAIL-ROUTINE-WRITE.                             NC1184.2 446
   000440         044300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1184.2 232 IMP 446
   000441         044400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1184.2 264 334
   000442         044500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1184.2 329
   000443         044600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1184.2 326 39 416
   000444         044700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1184.2 IMP 334
   000445         044800     GO TO  FAIL-ROUTINE-EX.                                      NC1184.2 451
   000446         044900 FAIL-ROUTINE-WRITE.                                              NC1184.2
   000447         045000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1184.2 214 38 416
   000448         045100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1184.2 264 242
   000449         045200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1184.2 229 38 416
   000450         045300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1184.2 IMP 242
   000451         045400 FAIL-ROUTINE-EX. EXIT.                                           NC1184.2
   000452         045500 BAIL-OUT.                                                        NC1184.2
   000453         045600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1184.2 219 IMP 455
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1184.2 233 IMP 460
   000455         045800 BAIL-OUT-WRITE.                                                  NC1184.2
   000456         045900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1184.2 233 333 219 331
   000457         046000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1184.2 264 334
   000458         046100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1184.2 326 39 416
   000459         046200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1184.2 IMP 334
   000460         046300 BAIL-OUT-EX. EXIT.                                               NC1184.2
   000461         046400 CCVS1-EXIT.                                                      NC1184.2
   000462         046500     EXIT.                                                        NC1184.2
   000463         046600 SECT-NC118A-001 SECTION.                                         NC1184.2
   000464         046700 SIG-INIT-GF-1.                                                   NC1184.2
   000465         046800     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000466         046900     MOVE   "ADD " TO FEATURE.                                    NC1184.2 204
   000467         047000     MOVE    000000001.00   TO N-5.                               NC1184.2 147
   000468         047100     MOVE    0000001.0000   TO N-7.                               NC1184.2 150
   000469         047200 SIG-TEST-GF-1-0.                                                 NC1184.2
   000470         047300     ADD     N-5 TO N-7.                                          NC1184.2 147 150
   000471         047400 SIG-TEST-GF-1-1.                                                 NC1184.2
   000472         047500     IF      N-7 = 2                                              NC1184.2 150
   000473      1  047600             PERFORM PASS GO TO SIG-WRITE-GF-1.                   NC1184.2 358 482
   000474         047700     GO      TO SIG-FAIL-GF-1.                                    NC1184.2 478
   000475         047800 SIG-DELETE-GF-1.                                                 NC1184.2
   000476         047900     PERFORM DE-LETE.                                             NC1184.2 360
   000477         048000     GO      TO SIG-WRITE-GF-1.                                   NC1184.2 482
   000478         048100 SIG-FAIL-GF-1.                                                   NC1184.2
   000479         048200     MOVE    N-7 TO COMPUTED-N                                    NC1184.2 150 220
   000480         048300     MOVE    2   TO CORRECT-N.                                    NC1184.2 234
   000481         048400     PERFORM  FAIL.                                               NC1184.2 359
   000482         048500 SIG-WRITE-GF-1.                                                  NC1184.2
   000483         048600     MOVE     "SIG-TEST-GF-1" TO PAR-NAME.                        NC1184.2 208
   000484         048700     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000485         048800 SIG-INIT-GF-2.                                                   NC1184.2
   000486         048900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000487         049000     MOVE "ADD ---" TO FEATURE.                                   NC1184.2 204
   000488         049100     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000489         049200     MOVE "  TO" TO FEATURE.                                      NC1184.2 204
   000490         049300     MOVE     A18TWOS-DS-LS-18V00 TO WRK-DS-T-18V00.              NC1184.2 42 59
   000491         049400 SIG-TEST-GF-2-0.                                                 NC1184.2
   000492         049500     ADD      A18ONES-DS-TS-18V00 TO WRK-DS-T-18V00.              NC1184.2 45 59
   000493         049600 SIG-TEST-GF-2-1.                                                 NC1184.2
   000494         049700     IF       WRK-DS-T-18V00 EQUAL TO 333333333333333333          NC1184.2 59
   000495      1  049800              PERFORM PASS GO TO SIG-WRITE-GF-2.                  NC1184.2 358 504
   000496         049900     GO       TO SIG-FAIL-GF-2.                                   NC1184.2 500
   000497         050000 SIG-DELETE-GF-2.                                                 NC1184.2
   000498         050100     PERFORM  DE-LETE.                                            NC1184.2 360
   000499         050200     GO       TO SIG-WRITE-GF-2.                                  NC1184.2 504
   000500         050300 SIG-FAIL-GF-2.                                                   NC1184.2
   000501         050400     MOVE     WRK-DS-T-18V00 TO COMPUTED-18V0.                    NC1184.2 59 226
   000502         050500     MOVE     333333333333333333   TO CORRECT-18V0.               NC1184.2 239
   000503         050600     PERFORM  FAIL.                                               NC1184.2 359
   000504         050700 SIG-WRITE-GF-2.                                                  NC1184.2
   000505         050800     MOVE     "SIG-TEST-GF-2" TO PAR-NAME.                        NC1184.2 208
   000506         050900     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000507         051000 SIG-INIT-GF-3.                                                   NC1184.2
   000508         051100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000509         051200     MOVE     ZERO TO WRK-DS-10V00.                               NC1184.2 IMP 48
   000510         051300 SIG-TEST-GF-3-0.                                                 NC1184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     ADD      A10ONES-DS-T-10V00  A05ONES-DS-L-05V00              NC1184.2 49 52
   000512         051500                     TO  WRK-DS-10V00.                            NC1184.2 48
   000513         051600 SIG-TEST-GF-3-1.                                                 NC1184.2
   000514         051700     IF       WRK-DS-10V00 EQUAL TO 1111122222                    NC1184.2 48
   000515      1  051800              PERFORM PASS GO TO SIG-WRITE-GF-3.                  NC1184.2 358 524
   000516         051900     GO       TO SIG-FAIL-GF-3.                                   NC1184.2 520
   000517         052000 SIG-DELETE-GF-3.                                                 NC1184.2
   000518         052100     PERFORM  DE-LETE.                                            NC1184.2 360
   000519         052200     GO       TO SIG-WRITE-GF-3.                                  NC1184.2 524
   000520         052300 SIG-FAIL-GF-3.                                                   NC1184.2
   000521         052400     MOVE     WRK-DS-10V00 TO COMPUTED-18V0.                      NC1184.2 48 226
   000522         052500     MOVE     1111122222   TO CORRECT-18V0.                       NC1184.2 239
   000523         052600     PERFORM  FAIL.                                               NC1184.2 359
   000524         052700 SIG-WRITE-GF-3.                                                  NC1184.2
   000525         052800     MOVE     "SIG-TEST-GF-3" TO PAR-NAME.                        NC1184.2 208
   000526         052900     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000527         053000 SIG-INIT-GF-4.                                                   NC1184.2
   000528         053100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000529         053200     MOVE     ZERO TO WRK-DS-10V00.                               NC1184.2 IMP 48
   000530         053300 SIG-TEST-GF-4-0.                                                 NC1184.2
   000531         053400     ADD      A02ONES-DS-LS-02V00                                 NC1184.2 55
   000532         053500              A10ONES-DS-T-10V00                                  NC1184.2 49
   000533         053600              A05ONES-DS-L-05V00 TO WRK-DS-10V00.                 NC1184.2 52 48
   000534         053700 SIG-TEST-GF-4-1.                                                 NC1184.2
   000535         053800     IF       WRK-DS-10V00 EQUAL TO 1111122233                    NC1184.2 48
   000536      1  053900              PERFORM PASS GO TO SIG-WRITE-GF-4.                  NC1184.2 358 545
   000537         054000     GO       TO SIG-FAIL-GF-4.                                   NC1184.2 541
   000538         054100 SIG-DELETE-GF-4.                                                 NC1184.2
   000539         054200     PERFORM  DE-LETE.                                            NC1184.2 360
   000540         054300     GO       TO SIG-WRITE-GF-4.                                  NC1184.2 545
   000541         054400 SIG-FAIL-GF-4.                                                   NC1184.2
   000542         054500     MOVE     WRK-DS-10V00 TO COMPUTED-18V0.                      NC1184.2 48 226
   000543         054600     MOVE     1111122233   TO CORRECT-18V0.                       NC1184.2 239
   000544         054700     PERFORM  FAIL.                                               NC1184.2 359
   000545         054800 SIG-WRITE-GF-4.                                                  NC1184.2
   000546         054900     MOVE     "SIG-TEST-GF-4" TO PAR-NAME.                        NC1184.2 208
   000547         055000     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000548         055100 SIG-INIT-GF-10.                                                  NC1184.2
   000549         055200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000550         055300     MOVE "  GIVING" TO FEATURE.                                  NC1184.2 204
   000551         055400     MOVE     ZERO TO WRK-DS-09V09.                               NC1184.2 IMP 58
   000552         055500 SIG-TEST-GF-10-0.                                                NC1184.2
   000553         055600     ADD      A06THREES-DS-03V03                                  NC1184.2 61
   000554         055700              A12THREES-DS-06V06 GIVING WRK-DS-09V09.             NC1184.2 63 58
   000555         055800 SIG-TEST-GF-10-1.                                                NC1184.2
   000556         055900     IF       WRK-DS-09V09 EQUAL TO 000333666.666333000           NC1184.2 58
   000557      1  056000              PERFORM PASS GO TO SIG-WRITE-GF-10.                 NC1184.2 358 566
   000558         056100     GO       TO SIG-FAIL-GF-10.                                  NC1184.2 562
   000559         056200 SIG-DELETE-GF-10.                                                NC1184.2
   000560         056300     PERFORM  DE-LETE.                                            NC1184.2 360
   000561         056400     GO       TO SIG-WRITE-GF-10.                                 NC1184.2 566
   000562         056500 SIG-FAIL-GF-10.                                                  NC1184.2
   000563         056600     MOVE     WRK-DS-09V09 TO COMPUTED-N.                         NC1184.2 58 220
   000564         056700     MOVE     000333666.666333000 TO CORRECT-N.                   NC1184.2 234
   000565         056800     PERFORM  FAIL.                                               NC1184.2 359
   000566         056900 SIG-WRITE-GF-10.                                                 NC1184.2
   000567         057000     MOVE     "SIG-TEST-GF-10" TO PAR-NAME.                       NC1184.2 208
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000569         057200 SIG-INIT-GF-11.                                                  NC1184.2
   000570         057300     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000571         057400     MOVE     ZERO TO WRK-DS-TS-06V06.                            NC1184.2 IMP 65
   000572         057500 SIG-TEST-GF-11-0.                                                NC1184.2
   000573         057600     ADD      A05ONES-DS-L-05V00                                  NC1184.2 52
   000574         057700              A05ONES-DS-LS-00V05                                 NC1184.2 70
   000575         057800              A12THREES-DS-06V06                                  NC1184.2 63
   000576         057900              A06THREES-DS-03V03 GIVING WRK-DS-TS-06V06.          NC1184.2 61 65
   000577         058000 SIG-TEST-GF-11-1.                                                NC1184.2
   000578         058100     IF       WRK-DS-TS-06V06 EQUAL TO 344777.777443              NC1184.2 65
   000579      1  058200              PERFORM PASS GO TO SIG-WRITE-GF-11.                 NC1184.2 358 588
   000580         058300     GO       TO SIG-FAIL-GF-11.                                  NC1184.2 584
   000581         058400 SIG-DELETE-GF-11.                                                NC1184.2
   000582         058500     PERFORM  DE-LETE.                                            NC1184.2 360
   000583         058600     GO       TO SIG-WRITE-GF-11.                                 NC1184.2 588
   000584         058700 SIG-FAIL-GF-11.                                                  NC1184.2
   000585         058800     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1184.2 65 220
   000586         058900     MOVE     344777.777443 TO CORRECT-N.                         NC1184.2 234
   000587         059000     PERFORM  FAIL.                                               NC1184.2 359
   000588         059100 SIG-WRITE-GF-11.                                                 NC1184.2
   000589         059200     MOVE     "SIG-TEST-GF-11" TO PAR-NAME.                       NC1184.2 208
   000590         059300     PERFORM PRINT-DETAIL.                                        NC1184.2 362
   000591         059400 SIG-INIT-GF-5.                                                   NC1184.2
   000592         059500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000593         059600     MOVE "  ROUNDED" TO FEATURE.                                 NC1184.2 204
   000594         059700     MOVE     ZERO TO WRK-DS-T-05V00.                             NC1184.2 IMP 73
   000595         059800 SIG-TEST-GF-5-0.                                                 NC1184.2
   000596         059900     ADD      55554.5 TO WRK-DS-T-05V00 ROUNDED.                  NC1184.2 73
   000597         060000 SIG-TEST-GF-5-1.                                                 NC1184.2
   000598         060100     IF       WRK-DS-T-05V00 EQUAL TO 55555                       NC1184.2 73
   000599      1  060200              PERFORM PASS GO TO SIG-WRITE-GF-5.                  NC1184.2 358 608
   000600         060300     GO       TO SIG-FAIL-GF-5.                                   NC1184.2 604
   000601         060400 SIG-DELETE-GF-5.                                                 NC1184.2
   000602         060500     PERFORM  DE-LETE.                                            NC1184.2 360
   000603         060600     GO       TO SIG-WRITE-GF-5.                                  NC1184.2 608
   000604         060700 SIG-FAIL-GF-5.                                                   NC1184.2
   000605         060800     MOVE     WRK-DS-T-05V00 TO COMPUTED-N.                       NC1184.2 73 220
   000606         060900     MOVE     55555 TO CORRECT-N.                                 NC1184.2 234
   000607         061000     PERFORM  FAIL.                                               NC1184.2 359
   000608         061100 SIG-WRITE-GF-5.                                                  NC1184.2
   000609         061200     MOVE     "SIG-TEST-GF-5" TO PAR-NAME.                        NC1184.2 208
   000610         061300     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000611         061400 SIG-INIT-GF-12.                                                  NC1184.2
   000612         061500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000613         061600     MOVE     ZERO TO WRK-DS-T-06V00.                             NC1184.2 IMP 74
   000614         061700 SIG-TEST-GF-12-0.                                                NC1184.2
   000615         061800     ADD      A05ONES-DS-LS-00V05                                 NC1184.2 70
   000616         061900              A12THREES-DS-06V06                                  NC1184.2 63
   000617         062000              A05ONES-DS-LS-00V05 GIVING WRK-DS-T-06V00 ROUNDED.  NC1184.2 70 74
   000618         062100 SIG-TEST-GF-12-1.                                                NC1184.2
   000619         062200     IF      WRK-DS-T-06V00 EQUAL TO 333334                       NC1184.2 74
   000620      1  062300     PERFORM PASS GO TO SIG-WRITE-GF-12.                          NC1184.2 358 629
   000621         062400     GO      TO SIG-FAIL-GF-12.                                   NC1184.2 625
   000622         062500 SIG-DELETE-GF-12.                                                NC1184.2
   000623         062600     PERFORM  DE-LETE.                                            NC1184.2 360
   000624         062700     GO       TO SIG-WRITE-GF-12.                                 NC1184.2 629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 SIG-FAIL-GF-12.                                                  NC1184.2
   000626         062900     MOVE    WRK-DS-T-06V00 TO COMPUTED-N.                        NC1184.2 74 220
   000627         063000     MOVE    333334 TO CORRECT-N.                                 NC1184.2 234
   000628         063100     PERFORM FAIL.                                                NC1184.2 359
   000629         063200 SIG-WRITE-GF-12.                                                 NC1184.2
   000630         063300     MOVE     "SIG-TEST-GF-12" TO PAR-NAME.                       NC1184.2 208
   000631         063400     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000632         063500 SIG-INIT-GF-13.                                                  NC1184.2
   000633         063600     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000634         063700     MOVE     ZERO TO WRK-DS-10V00.                               NC1184.2 IMP 48
   000635         063800 SIG-TEST-GF-13-1-0.                                              NC1184.2
   000636         063900     ADD      A12ONES-DS-L-12V00                                  NC1184.2 76
   000637         064000              ZERO GIVING WRK-DS-10V00 ON SIZE ERROR              NC1184.2 IMP 48
   000638      1  064100              PERFORM PASS GO TO SIG-WRITE-GF-13-1.               NC1184.2 358 646
   000639         064200     GO       TO SIG-FAIL-GF-13-1.                                NC1184.2 643
   000640         064300 SIG-DELETE-GF-13-1.                                              NC1184.2
   000641         064400     PERFORM  DE-LETE.                                            NC1184.2 360
   000642         064500     GO       TO SIG-WRITE-GF-13-1.                               NC1184.2 646
   000643         064600 SIG-FAIL-GF-13-1.                                                NC1184.2
   000644         064700     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1184.2 213
   000645         064800     PERFORM  FAIL.                                               NC1184.2 359
   000646         064900 SIG-WRITE-GF-13-1.                                               NC1184.2
   000647         065000     MOVE     "SIG-TEST-GF-13-1" TO PAR-NAME.                     NC1184.2 208
   000648         065100     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000649         065200 SIG-TEST-GF-13-2.                                                NC1184.2
   000650         065300     IF       WRK-DS-10V00 EQUAL TO ZERO                          NC1184.2 48 IMP
   000651      1  065400              PERFORM PASS GO TO SIG-WRITE-GF-13-2.               NC1184.2 358 662
   000652         065500*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SIG-TEST-GF-13-1  NC1184.2
   000653         065600     GO       TO SIG-FAIL-GF-13-2.                                NC1184.2 657
   000654         065700 SIG-DELETE-GF-13-2.                                              NC1184.2
   000655         065800     PERFORM  DE-LETE.                                            NC1184.2 360
   000656         065900     GO       TO SIG-WRITE-GF-13-2.                               NC1184.2 662
   000657         066000 SIG-FAIL-GF-13-2.                                                NC1184.2
   000658         066100     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1184.2 213
   000659         066200     MOVE     WRK-DS-10V00 TO COMPUTED-14V4.                      NC1184.2 48 224
   000660         066300     MOVE     ZERO TO CORRECT-14V4.                               NC1184.2 IMP 237
   000661         066400     PERFORM  FAIL.                                               NC1184.2 359
   000662         066500 SIG-WRITE-GF-13-2.                                               NC1184.2
   000663         066600     MOVE     "SIG-TEST-GF-13-2" TO PAR-NAME.                     NC1184.2 208
   000664         066700     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000665         066800 SIG-INIT-GF-6.                                                   NC1184.2
   000666         066900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000667         067000     MOVE "  ROUNDED,SIZE ERROR" TO FEATURE.                      NC1184.2 204
   000668         067100     MOVE     ZERO TO WRK-DS-T-05V00.                             NC1184.2 IMP 73
   000669         067200 SIG-TEST-GF-6-1.                                                 NC1184.2
   000670         067300     ADD      33333                                               NC1184.2
   000671         067400              A06THREES-DS-03V03                                  NC1184.2 61
   000672         067500              A12THREES-DS-06V06                                  NC1184.2 63
   000673         067600              TO WRK-DS-T-05V00 ROUNDED ON SIZE ERROR             NC1184.2 73
   000674      1  067700              PERFORM PASS GO TO SIG-WRITE-GF-6-1.                NC1184.2 358 682
   000675         067800     GO       TO SIG-FAIL-GF-6-1.                                 NC1184.2 679
   000676         067900 SIG-DELETE-GF-6-1.                                               NC1184.2
   000677         068000     PERFORM  DE-LETE.                                            NC1184.2 360
   000678         068100     GO       TO SIG-WRITE-GF-6-1.                                NC1184.2 682
   000679         068200 SIG-FAIL-GF-6-1.                                                 NC1184.2
   000680         068300     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1184.2 213
   000681         068400     PERFORM  FAIL.                                               NC1184.2 359
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500 SIG-WRITE-GF-6-1.                                                NC1184.2
   000683         068600     MOVE     "SIG-TEST-GF-6-1" TO PAR-NAME.                      NC1184.2 208
   000684         068700     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000685         068800 SIG-TEST-GF-6-2.                                                 NC1184.2
   000686         068900     IF       WRK-DS-T-05V00 EQUAL TO ZERO                        NC1184.2 73 IMP
   000687      1  069000              PERFORM PASS GO TO SIG-WRITE-GF-6-2.                NC1184.2 358 698
   000688         069100*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SIG-TEST-GF-6-1   NC1184.2
   000689         069200     GO       TO SIG-FAIL-GF-6-2.                                 NC1184.2 693
   000690         069300 SIG-DELETE-GF-6-2.                                               NC1184.2
   000691         069400     PERFORM  DE-LETE.                                            NC1184.2 360
   000692         069500     GO       TO SIG-WRITE-GF-6-2.                                NC1184.2 698
   000693         069600 SIG-FAIL-GF-6-2.                                                 NC1184.2
   000694         069700     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1184.2 213
   000695         069800     MOVE     WRK-DS-T-05V00 TO COMPUTED-N.                       NC1184.2 73 220
   000696         069900     MOVE     ZERO TO CORRECT-N.                                  NC1184.2 IMP 234
   000697         070000     PERFORM  FAIL.                                               NC1184.2 359
   000698         070100 SIG-WRITE-GF-6-2.                                                NC1184.2
   000699         070200     MOVE     "SIG-TEST-GF-6-2" TO PAR-NAME.                      NC1184.2 208
   000700         070300     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000701         070400 SIG-INIT-GF-7.                                                   NC1184.2
   000702         070500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000703         070600     MOVE     ZERO TO WRK-DS-TS-06V06.                            NC1184.2 IMP 65
   000704         070700 SIG-TEST-GF-7-1.                                                 NC1184.2
   000705         070800     ADD      A12THREES-DS-06V06                                  NC1184.2 63
   000706         070900              333333                                              NC1184.2
   000707         071000              A06THREES-DS-03V03                                  NC1184.2 61
   000708         071100              TO WRK-DS-TS-06V06 ROUNDED ON SIZE ERROR            NC1184.2 65
   000709      1  071200              GO TO SIG-FAIL-GF-7-1.                              NC1184.2 715
   000710         071300     PERFORM  PASS.                                               NC1184.2 358
   000711         071400     GO TO SIG-WRITE-GF-7-1.                                      NC1184.2 718
   000712         071500 SIG-DELETE-GF-7-1.                                               NC1184.2
   000713         071600     PERFORM  DE-LETE.                                            NC1184.2 360
   000714         071700     GO       TO SIG-WRITE-GF-7-1.                                NC1184.2 718
   000715         071800 SIG-FAIL-GF-7-1.                                                 NC1184.2
   000716         071900     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1184.2 213
   000717         072000     PERFORM  FAIL.                                               NC1184.2 359
   000718         072100 SIG-WRITE-GF-7-1.                                                NC1184.2
   000719         072200     MOVE     "SIG-TEST-GF-7-1" TO PAR-NAME.                      NC1184.2 208
   000720         072300     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000721         072400 SIG-TEST-GF-7-2.                                                 NC1184.2
   000722         072500     IF       WRK-DS-TS-06V06 EQUAL TO 666999.666333              NC1184.2 65
   000723      1  072600              PERFORM PASS GO TO SIG-WRITE-GF-7-2.                NC1184.2 358 733
   000724         072700*    NOTE     THIS TEST DEPENDS UPON THE RESULT OF SIG-TEST-GF-7-1NC1184.2
   000725         072800     GO       TO SIG-FAIL-GF-7-2.                                 NC1184.2 729
   000726         072900 SIG-DELETE-GF-7-2.                                               NC1184.2
   000727         073000     PERFORM  DE-LETE.                                            NC1184.2 360
   000728         073100     GO       TO SIG-WRITE-GF-7-2.                                NC1184.2 733
   000729         073200 SIG-FAIL-GF-7-2.                                                 NC1184.2
   000730         073300     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1184.2 65 220
   000731         073400     MOVE     666999.666333 TO CORRECT-N.                         NC1184.2 234
   000732         073500     PERFORM  FAIL.                                               NC1184.2 359
   000733         073600 SIG-WRITE-GF-7-2.                                                NC1184.2
   000734         073700     MOVE     "SIG-TEST-GF-7-2" TO PAR-NAME.                      NC1184.2 208
   000735         073800     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000736         073900 SIG-INIT-GF-14.                                                  NC1184.2
   000737         074000     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000738         074100     MOVE     ZERO TO WRK-DS-T-05V00.                             NC1184.2 IMP 73
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 SIG-TEST-GF-14-1.                                                NC1184.2
   000740         074300     ADD      33333                                               NC1184.2
   000741         074400              A06THREES-DS-03V03                                  NC1184.2 61
   000742         074500              A12THREES-DS-06V06                                  NC1184.2 63
   000743         074600              GIVING WRK-DS-T-05V00 ROUNDED ON SIZE ERROR         NC1184.2 73
   000744      1  074700              PERFORM PASS GO TO SIG-WRITE-GF-14-1.               NC1184.2 358 752
   000745         074800     GO       TO SIG-FAIL-GF-14-1.                                NC1184.2 749
   000746         074900 SIG-DELETE-GF-14-1.                                              NC1184.2
   000747         075000     PERFORM  DE-LETE.                                            NC1184.2 360
   000748         075100     GO       TO SIG-WRITE-GF-14-1.                               NC1184.2 752
   000749         075200 SIG-FAIL-GF-14-1.                                                NC1184.2
   000750         075300     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1184.2 213
   000751         075400     PERFORM  FAIL.                                               NC1184.2 359
   000752         075500 SIG-WRITE-GF-14-1.                                               NC1184.2
   000753         075600     MOVE     "SIG-TEST-GF-14-1" TO PAR-NAME.                     NC1184.2 208
   000754         075700     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000755         075800 SIG-TEST-GF-14-2.                                                NC1184.2
   000756         075900     IF       WRK-DS-T-05V00 EQUAL TO ZERO                        NC1184.2 73 IMP
   000757      1  076000              PERFORM PASS GO TO SIG-WRITE-GF-14-2.               NC1184.2 358 768
   000758         076100     GO       TO SIG-FAIL-GF-14-2.                                NC1184.2 763
   000759         076200*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SIG-TEST-GF-14-1  NC1184.2
   000760         076300 SIG-DELETE-GF-14-2.                                              NC1184.2
   000761         076400     PERFORM  DE-LETE.                                            NC1184.2 360
   000762         076500     GO       TO SIG-WRITE-GF-14-2.                               NC1184.2 768
   000763         076600 SIG-FAIL-GF-14-2.                                                NC1184.2
   000764         076700     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1184.2 213
   000765         076800     MOVE     WRK-DS-T-05V00 TO COMPUTED-N.                       NC1184.2 73 220
   000766         076900     MOVE     ZERO TO CORRECT-N.                                  NC1184.2 IMP 234
   000767         077000     PERFORM  FAIL.                                               NC1184.2 359
   000768         077100 SIG-WRITE-GF-14-2.                                               NC1184.2
   000769         077200     MOVE     "SIG-TEST-GF-14-2" TO PAR-NAME.                     NC1184.2 208
   000770         077300     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000771         077400 SIG-INIT-GF-15.                                                  NC1184.2
   000772         077500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000773         077600     MOVE     ZERO TO WRK-DS-TS-06V06.                            NC1184.2 IMP 65
   000774         077700 SIG-TEST-GF-15-1-0.                                              NC1184.2
   000775         077800     ADD      A12THREES-DS-06V06                                  NC1184.2 63
   000776         077900              333333                                              NC1184.2
   000777         078000              A06THREES-DS-03V03                                  NC1184.2 61
   000778         078100              GIVING WRK-DS-TS-06V06 ROUNDED ON SIZE ERROR        NC1184.2 65
   000779      1  078200              GO TO SIG-FAIL-GF-15-1.                             NC1184.2 785
   000780         078300     PERFORM  PASS.                                               NC1184.2 358
   000781         078400     GO       TO SIG-WRITE-GF-15-1.                               NC1184.2 788
   000782         078500 SIG-DELETE-GF-15-1.                                              NC1184.2
   000783         078600     PERFORM  DE-LETE.                                            NC1184.2 360
   000784         078700     GO       TO SIG-WRITE-GF-15-1.                               NC1184.2 788
   000785         078800 SIG-FAIL-GF-15-1.                                                NC1184.2
   000786         078900     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1184.2 213
   000787         079000     PERFORM  FAIL.                                               NC1184.2 359
   000788         079100 SIG-WRITE-GF-15-1.                                               NC1184.2
   000789         079200     MOVE     "SIG-TEST-GF-15-1" TO PAR-NAME.                     NC1184.2 208
   000790         079300     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000791         079400 SIG-TEST-GF-15-2.                                                NC1184.2
   000792         079500     IF       WRK-DS-TS-06V06 EQUAL TO 666999.666333              NC1184.2 65
   000793      1  079600              PERFORM PASS GO TO SIG-WRITE-GF-15-2.               NC1184.2 358 803
   000794         079700*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SIG-TEST-GF-15-1  NC1184.2
   000795         079800     GO       TO SIG-FAIL-GF-15-2.                                NC1184.2 799
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900 SIG-DELETE-GF-15-2.                                              NC1184.2
   000797         080000     PERFORM  DE-LETE.                                            NC1184.2 360
   000798         080100     GO       TO SIG-WRITE-GF-15-2.                               NC1184.2 803
   000799         080200 SIG-FAIL-GF-15-2.                                                NC1184.2
   000800         080300     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1184.2 65 220
   000801         080400     MOVE     666999.666333 TO CORRECT-N.                         NC1184.2 234
   000802         080500     PERFORM  FAIL.                                               NC1184.2 359
   000803         080600 SIG-WRITE-GF-15-2.                                               NC1184.2
   000804         080700     MOVE     "SIG-TEST-GF-15-2" TO PAR-NAME.                     NC1184.2 208
   000805         080800     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000806         080900 SIG-INIT-GF-16.                                                  NC1184.2
   000807         081000     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000808         081100     MOVE "  SERIES" TO FEATURE.                                  NC1184.2 204
   000809         081200     MOVE     ZERO TO WRK-DS-03V10.                               NC1184.2 IMP 79
   000810         081300 SIG-TEST-GF-16-0.                                                NC1184.2
   000811         081400     ADD      A99-DS-T-02V00                                      NC1184.2 82
   000812         081500              A03ONES-DS-02V01                                    NC1184.2 85
   000813         081600              A06ONES-DS-TS-03V03                                 NC1184.2 87
   000814         081700              A08TWOS-DS-02V06                                    NC1184.2 90
   000815         081800              -1.1111111                                          NC1184.2
   000816         081900              +.11111111                                          NC1184.2
   000817         082000              A01ONES-DS-LS-P0801 GIVING WRK-DS-03V10.            NC1184.2 92 79
   000818         082100 SIG-TEST-GF-16-1.                                                NC1184.2
   000819         082200     IF       WRK-DS-03V10 EQUAL TO 242.4332220110                NC1184.2 79
   000820      1  082300              PERFORM PASS GO TO SIG-WRITE-GF-16.                 NC1184.2 358 829
   000821         082400     GO       TO SIG-FAIL-GF-16.                                  NC1184.2 825
   000822         082500 SIG-DELETE-GF-16.                                                NC1184.2
   000823         082600     PERFORM  DE-LETE.                                            NC1184.2 360
   000824         082700     GO       TO SIG-WRITE-GF-16.                                 NC1184.2 829
   000825         082800 SIG-FAIL-GF-16.                                                  NC1184.2
   000826         082900     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1184.2 79 223
   000827         083000     MOVE     242.4332220110 TO CORRECT-4V14.                     NC1184.2 236
   000828         083100     PERFORM  FAIL.                                               NC1184.2 359
   000829         083200 SIG-WRITE-GF-16.                                                 NC1184.2
   000830         083300     MOVE     "SIG-TEST-GF-16" TO PAR-NAME.                       NC1184.2 208
   000831         083400     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000832         083500 SIG-INIT-GF-17.                                                  NC1184.2
   000833         083600     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000834         083700     MOVE     ZERO TO WRK-DS-03V10.                               NC1184.2 IMP 79
   000835         083800 SIG-TEST-GF-17-0.                                                NC1184.2
   000836         083900     ADD      A01ONES-DS-LS-P0801                                 NC1184.2 92
   000837         084000              +.11111111                                          NC1184.2
   000838         084100              -1.1111111                                          NC1184.2
   000839         084200              A08TWOS-DS-02V06                                    NC1184.2 90
   000840         084300              A06ONES-DS-TS-03V03                                 NC1184.2 87
   000841         084400              A03ONES-DS-02V01                                    NC1184.2 85
   000842         084500              A99-DS-T-02V00 GIVING WRK-DS-03V10.                 NC1184.2 82 79
   000843         084600 SIG-TEST-GF-17-1.                                                NC1184.2
   000844         084700     IF       WRK-DS-03V10 EQUAL TO 242.4332220110                NC1184.2 79
   000845      1  084800              PERFORM PASS GO TO SIG-WRITE-GF-17.                 NC1184.2 358 854
   000846         084900     GO       TO SIG-FAIL-GF-17.                                  NC1184.2 850
   000847         085000 SIG-DELETE-GF-17.                                                NC1184.2
   000848         085100     PERFORM  DE-LETE.                                            NC1184.2 360
   000849         085200     GO       TO SIG-WRITE-GF-17.                                 NC1184.2 854
   000850         085300 SIG-FAIL-GF-17.                                                  NC1184.2
   000851         085400     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1184.2 79 223
   000852         085500     MOVE     242.4332220110 TO CORRECT-4V14.                     NC1184.2 236
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     PERFORM  FAIL.                                               NC1184.2 359
   000854         085700 SIG-WRITE-GF-17.                                                 NC1184.2
   000855         085800     MOVE     "SIG-TEST-GF-17" TO PAR-NAME.                       NC1184.2 208
   000856         085900     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000857         086000 SIG-INIT-GF-18.                                                  NC1184.2
   000858         086100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000859         086200     MOVE     ZERO TO WRK-DS-03V10.                               NC1184.2 IMP 79
   000860         086300 SIG-TEST-GF-18-0.                                                NC1184.2
   000861         086400     ADD      A08TWOS-DS-02V06                                    NC1184.2 90
   000862         086500              A99-DS-T-02V00                                      NC1184.2 82
   000863         086600              -1.1111111                                          NC1184.2
   000864         086700              A03ONES-DS-02V01                                    NC1184.2 85
   000865         086800              A01ONES-DS-LS-P0801                                 NC1184.2 92
   000866         086900              +.11111111                                          NC1184.2
   000867         087000              A06ONES-DS-TS-03V03 GIVING WRK-DS-03V10.            NC1184.2 87 79
   000868         087100 SIG-TEST-GF-18-1.                                                NC1184.2
   000869         087200     IF       WRK-DS-03V10 EQUAL TO 242.4332220110                NC1184.2 79
   000870      1  087300              PERFORM PASS GO TO SIG-WRITE-GF-18.                 NC1184.2 358 879
   000871         087400     GO       TO SIG-FAIL-GF-18.                                  NC1184.2 875
   000872         087500 SIG-DELETE-GF-18.                                                NC1184.2
   000873         087600     PERFORM  DE-LETE.                                            NC1184.2 360
   000874         087700     GO       TO SIG-WRITE-GF-18.                                 NC1184.2 879
   000875         087800 SIG-FAIL-GF-18.                                                  NC1184.2
   000876         087900     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1184.2 79 223
   000877         088000     MOVE     242.4332220110 TO CORRECT-4V14.                     NC1184.2 236
   000878         088100     PERFORM  FAIL.                                               NC1184.2 359
   000879         088200 SIG-WRITE-GF-18.                                                 NC1184.2
   000880         088300     MOVE     "SIG-TEST-GF-18" TO PAR-NAME.                       NC1184.2 208
   000881         088400     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000882         088500 SIG-INIT-GF-8.                                                   NC1184.2
   000883         088600     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000884         088700     MOVE "  COMP VS. DISPLAY"  TO FEATURE.                       NC1184.2 204
   000885         088800     MOVE     A18ONES-DS-TS-18V00 TO WRK-CS-18V00.                NC1184.2 45 95
   000886         088900 SIG-TEST-GF-8-0.                                                 NC1184.2
   000887         089000     ADD      A18ONES-DS-TS-18V00 TO WRK-CS-18V00.                NC1184.2 45 95
   000888         089100 SIG-TEST-GF-8-1.                                                 NC1184.2
   000889         089200     IF       WRK-CS-18V00 EQUAL TO 222222222222222222            NC1184.2 95
   000890      1  089300              PERFORM PASS GO TO SIG-WRITE-GF-8.                  NC1184.2 358 899
   000891         089400     GO       TO SIG-FAIL-GF-8.                                   NC1184.2 895
   000892         089500 SIG-DELETE-GF-8.                                                 NC1184.2
   000893         089600     PERFORM  DE-LETE.                                            NC1184.2 360
   000894         089700     GO       TO SIG-WRITE-GF-8.                                  NC1184.2 899
   000895         089800 SIG-FAIL-GF-8.                                                   NC1184.2
   000896         089900     MOVE     WRK-CS-18V00 TO COMPUTED-18V0.                      NC1184.2 95 226
   000897         090000     MOVE     222222222222222222 TO CORRECT-18V0.                 NC1184.2 239
   000898         090100     PERFORM  FAIL.                                               NC1184.2 359
   000899         090200 SIG-WRITE-GF-8.                                                  NC1184.2
   000900         090300     MOVE     "SIG-TEST-GF-8" TO PAR-NAME.                        NC1184.2 208
   000901         090400     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000902         090500 SIG-INIT-GF-9.                                                   NC1184.2
   000903         090600     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000904         090700     MOVE     A18ONES-DS-TS-18V00 TO WRK-DS-T-18V00.              NC1184.2 45 59
   000905         090800 SIG-TEST-GF-9-0.                                                 NC1184.2
   000906         090900     ADD      A18ONES-CS-18V00 TO WRK-DS-T-18V00.                 NC1184.2 96 59
   000907         091000 SIG-TEST-GF-9-1.                                                 NC1184.2
   000908         091100     IF       WRK-DS-T-18V00 EQUAL TO 222222222222222222          NC1184.2 59
   000909      1  091200              PERFORM PASS GO TO SIG-WRITE-GF-9.                  NC1184.2 358 918
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     GO       TO SIG-FAIL-GF-9.                                   NC1184.2 914
   000911         091400 SIG-DELETE-GF-9.                                                 NC1184.2
   000912         091500     PERFORM  DE-LETE.                                            NC1184.2 360
   000913         091600     GO       TO SIG-WRITE-GF-9.                                  NC1184.2 918
   000914         091700 SIG-FAIL-GF-9.                                                   NC1184.2
   000915         091800     MOVE     WRK-DS-T-18V00 TO COMPUTED-18V0.                    NC1184.2 59 226
   000916         091900     MOVE     222222222222222222 TO CORRECT-18V0.                 NC1184.2 239
   000917         092000     PERFORM  FAIL.                                               NC1184.2 359
   000918         092100 SIG-WRITE-GF-9.                                                  NC1184.2
   000919         092200     MOVE     "SIG-TEST-GF-9" TO PAR-NAME.                        NC1184.2 208
   000920         092300     PERFORM  PRINT-DETAIL.                                       NC1184.2 362
   000921         092400 SIG-INIT-GF-19.                                                  NC1184.2
   000922         092500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000923         092600     MOVE SPACE TO SIZE-ERR.                                      NC1184.2 IMP 41
   000924         092700 SIG-TEST-GF-19-0.                                                NC1184.2
   000925         092800     ADD MINUS-NAME1  MINUS-NAME2  -34  -1  PLUS-NAME1            NC1184.2 190 191 193
   000926         092900         PLUS-NAME2  EVEN-NAME1  35  GIVING WHOLE-FIELD           NC1184.2 194 192 200
   000927      1  093000         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1184.2 41
   000928         093100 SIG-TEST-GF-19-1.                                                NC1184.2
   000929         093200     IF WHOLE-FIELD EQUAL TO +1                                   NC1184.2 200
   000930      1  093300         PERFORM PASS                                             NC1184.2 358
   000931      1  093400         GO TO SIG-WRITE-GF-19-1.                                 NC1184.2 938
   000932         093500     MOVE WHOLE-FIELD TO COMPUTED-18V0.                           NC1184.2 200 226
   000933         093600     MOVE +1 TO CORRECT-18V0.                                     NC1184.2 239
   000934         093700     PERFORM FAIL.                                                NC1184.2 359
   000935         093800     GO TO SIG-WRITE-GF-19-1.                                     NC1184.2 938
   000936         093900 SIG-DELETE-GF-19-1.                                              NC1184.2
   000937         094000     PERFORM DE-LETE.                                             NC1184.2 360
   000938         094100 SIG-WRITE-GF-19-1.                                               NC1184.2
   000939         094200     MOVE "SIG-TEST-GF-19-1" TO PAR-NAME.                         NC1184.2 208
   000940         094300     PERFORM PRINT-DETAIL.                                        NC1184.2 362
   000941         094400 SIG-TEST-GF-19-2.                                                NC1184.2
   000942         094500     IF SIZE-ERR EQUAL TO "1"                                     NC1184.2 41
   000943      1  094600         PERFORM FAIL                                             NC1184.2 359
   000944      1  094700         MOVE SPACE TO CORRECT-A                                  NC1184.2 IMP 233
   000945      1  094800         MOVE 1 TO COMPUTED-A                                     NC1184.2 219
   000946      1  094900         MOVE "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK      NC1184.2 213
   000947      1  095000         GO TO SIG-WRITE-GF-19-2.                                 NC1184.2 952
   000948         095100     PERFORM PASS.                                                NC1184.2 358
   000949         095200     GO TO SIG-WRITE-GF-19-2.                                     NC1184.2 952
   000950         095300 SIG-DELETE-GF-19-2.                                              NC1184.2
   000951         095400     PERFORM DE-LETE.                                             NC1184.2 360
   000952         095500 SIG-WRITE-GF-19-2.                                               NC1184.2
   000953         095600     MOVE "SIG-TEST-GF-19-2" TO PAR-NAME.                         NC1184.2 208
   000954         095700     PERFORM PRINT-DETAIL.                                        NC1184.2 362
   000955         095800 SIG-INIT-GF-20.                                                  NC1184.2
   000956         095900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000957         096000     MOVE SPACE TO SIZE-ERR.                                      NC1184.2 IMP 41
   000958         096100     MOVE ZERO  TO DECMAL-FIELD.                                  NC1184.2 IMP 201
   000959         096200     MOVE -.999999999999999999 TO MINUS-NAME3.                    NC1184.2 195
   000960         096300     MOVE -.999999999999999999 TO MINUS-NAME4.                    NC1184.2 196
   000961         096400     MOVE +.1                  TO EVEN-NAME2.                     NC1184.2 197
   000962         096500     MOVE +.999999999999999999 TO PLUS-NAME3.                     NC1184.2 198
   000963         096600     MOVE +.999999999999999999 TO PLUS-NAME4.                     NC1184.2 199
   000964         096700 SIG-TEST-GF-20-0.                                                NC1184.2
   000965         096800     ADD MINUS-NAME3  MINUS-NAME4  -.34  -.01  PLUS-NAME3         NC1184.2 195 196 198
   000966         096900         PLUS-NAME4  EVEN-NAME2  .35  GIVING DECMAL-FIELD         NC1184.2 199 197 201
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097000         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1184.2 41
   000968         097100 SIG-TEST-GF-20-1.                                                NC1184.2
   000969         097200     IF DECMAL-FIELD EQUAL TO +.1                                 NC1184.2 201
   000970      1  097300         PERFORM PASS                                             NC1184.2 358
   000971      1  097400         GO TO SIG-WRITE-GF-20-1.                                 NC1184.2 978
   000972         097500     MOVE DECMAL-FIELD TO COMPUTED-0V18.                          NC1184.2 201 222
   000973         097600     MOVE +.1 TO CORRECT-0V18.                                    NC1184.2 235
   000974         097700     PERFORM FAIL.                                                NC1184.2 359
   000975         097800     GO TO SIG-WRITE-GF-20-1.                                     NC1184.2 978
   000976         097900 SIG-DELETE-GF-20-1.                                              NC1184.2
   000977         098000     PERFORM DE-LETE.                                             NC1184.2 360
   000978         098100 SIG-WRITE-GF-20-1.                                               NC1184.2
   000979         098200     MOVE "SIG-TEST-GF-20-1" TO PAR-NAME.                         NC1184.2 208
   000980         098300     PERFORM PRINT-DETAIL.                                        NC1184.2 362
   000981         098400 SIG-TEST-GF-20-2.                                                NC1184.2
   000982         098500     IF SIZE-ERR EQUAL TO "1"                                     NC1184.2 41
   000983      1  098600         PERFORM FAIL                                             NC1184.2 359
   000984      1  098700         MOVE SPACE TO CORRECT-A                                  NC1184.2 IMP 233
   000985      1  098800         MOVE 1 TO COMPUTED-A                                     NC1184.2 219
   000986      1  098900         MOVE "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK      NC1184.2 213
   000987      1  099000         GO TO SIG-WRITE-GF-20-2.                                 NC1184.2 992
   000988         099100     PERFORM PASS.                                                NC1184.2 358
   000989         099200     GO TO SIG-WRITE-GF-20-2.                                     NC1184.2 992
   000990         099300 SIG-DELETE-GF-20-2.                                              NC1184.2
   000991         099400     PERFORM DE-LETE.                                             NC1184.2 360
   000992         099500 SIG-WRITE-GF-20-2.                                               NC1184.2
   000993         099600     MOVE "SIG-TEST-GF-20-2" TO PAR-NAME.                         NC1184.2 208
   000994         099700     PERFORM PRINT-DETAIL.                                        NC1184.2 362
   000995         099800 SIG-INIT-GF-21.                                                  NC1184.2
   000996         099900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   000997         100000     MOVE ZERO TO WRK-CS-18V00.                                   NC1184.2 IMP 95
   000998         100100 SIG-TEST-GF-21-0.                                                NC1184.2
   000999         100200     ADD A18ONES-CS-18V00 A18ONES-DS-TS-18V00 GIVING WRK-CS-18V00.NC1184.2 96 45 95
   001000         100300 SIG-TEST-GF-21-1.                                                NC1184.2
   001001         100400     IF WRK-CS-18V00 EQUAL TO 222222222222222222                  NC1184.2 95
   001002      1  100500         PERFORM PASS                                             NC1184.2 358
   001003      1  100600         GO TO SIG-WRITE-GF-21.                                   NC1184.2 1010
   001004         100700     MOVE 222222222222222222 TO CORRECT-18V0.                     NC1184.2 239
   001005         100800     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1184.2 95 226
   001006         100900     PERFORM FAIL.                                                NC1184.2 359
   001007         101000     GO TO SIG-WRITE-GF-21.                                       NC1184.2 1010
   001008         101100 SIG-DELETE-GF-21.                                                NC1184.2
   001009         101200     PERFORM DE-LETE.                                             NC1184.2 360
   001010         101300 SIG-WRITE-GF-21.                                                 NC1184.2
   001011         101400     MOVE "SIG-TEST-GF-21 " TO PAR-NAME.                          NC1184.2 208
   001012         101500     PERFORM PRINT-DETAIL.                                        NC1184.2 362
   001013         101600 SIG-INIT-GF-22.                                                  NC1184.2
   001014         101700     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1184.2 264
   001015         101800     MOVE ZERO TO WRK-DS-T-18V00.                                 NC1184.2 IMP 59
   001016         101900 SIG-TEST-GF-22-0.                                                NC1184.2
   001017         102000     ADD A18SIXES-CS-18V00  A12SEVENS-CU-18V00 GIVING             NC1184.2 125 127
   001018         102100             WRK-DS-T-18V00.                                      NC1184.2 59
   001019         102200 SIG-TEST-GF-22-1.                                                NC1184.2
   001020         102300     IF WRK-DS-T-18V00 EQUAL TO 666667444444444443                NC1184.2 59
   001021      1  102400         PERFORM PASS                                             NC1184.2 358
   001022      1  102500         GO TO SIG-WRITE-GF-22.                                   NC1184.2 1029
   001023         102600     MOVE 666667444444444443 TO CORRECT-18V0.                     NC1184.2 239
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     MOVE WRK-DS-T-18V00 TO COMPUTED-18V0.                        NC1184.2 59 226
   001025         102800     PERFORM FAIL.                                                NC1184.2 359
   001026         102900     GO TO SIG-WRITE-GF-22.                                       NC1184.2 1029
   001027         103000 SIG-DELETE-GF-22.                                                NC1184.2
   001028         103100     PERFORM DE-LETE.                                             NC1184.2 360
   001029         103200 SIG-WRITE-GF-22.                                                 NC1184.2
   001030         103300     MOVE "SIG-TEST-GF-22 " TO PAR-NAME.                          NC1184.2 208
   001031         103400     PERFORM PRINT-DETAIL.                                        NC1184.2 362
   001032         103500 CCVS-EXIT SECTION.                                               NC1184.2
   001033         103600 CCVS-999999.                                                     NC1184.2
   001034         103700     GO TO CLOSE-FILES.                                           NC1184.2 351
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    22
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      111   ADD-12
      112   ADD-13
      113   ADD-14
      264   ANSI-REFERENCE . . . . . . . .  441 448 457 M465 M486 M508 M528 M549 M570 M592 M612 M633 M666 M702 M737 M772
                                            M807 M833 M858 M883 M903 M922 M956 M996 M1014
      103   AZERO-DS-LS-05V05
       92   A01ONES-DS-LS-P0801. . . . . .  817 836 865
       55   A02ONES-DS-LS-02V00. . . . . .  531
       85   A03ONES-DS-02V01 . . . . . . .  812 841 864
       52   A05ONES-DS-L-05V00 . . . . . .  511 533 573
       70   A05ONES-DS-LS-00V05. . . . . .  574 615 617
       87   A06ONES-DS-TS-03V03. . . . . .  813 840 867
       61   A06THREES-DS-03V03 . . . . . .  553 576 671 707 741 777
       90   A08TWOS-DS-02V06 . . . . . . .  814 839 861
       49   A10ONES-DS-T-10V00 . . . . . .  511 532
       76   A12ONES-DS-L-12V00 . . . . . .  636
      127   A12SEVENS-CU-18V00 . . . . . .  1017
      119   A12THREES-CU-18V00
       63   A12THREES-DS-06V06 . . . . . .  554 575 616 672 705 742 775
      117   A14TWOS-CS-18V00
      121   A16FOURS-CS-18V00
      115   A18EIGHTS-CS-18V00
      123   A18FIVES-CS-18V00
       96   A18ONES-CS-18V00 . . . . . . .  906 999
       45   A18ONES-DS-TS-18V00. . . . . .  492 885 887 904 999
      125   A18SIXES-CS-18V00. . . . . . .  1017
      130   A18THREES-CS-18V00
       42   A18TWOS-DS-LS-18V00. . . . . .  490
       99   A99-CS-02V00
       82   A99-DS-T-02V00 . . . . . . . .  811 842 862
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
      219   COMPUTED-A . . . . . . . . . .  220 222 223 224 225 453 456 M945 M985
      220   COMPUTED-N . . . . . . . . . .  M479 M563 M585 M605 M626 M695 M730 M765 M800
      218   COMPUTED-X . . . . . . . . . .  M370 438
      222   COMPUTED-0V18. . . . . . . . .  M972
      224   COMPUTED-14V4. . . . . . . . .  M659
      226   COMPUTED-18V0. . . . . . . . .  M501 M521 M542 M896 M915 M932 M1005 M1024
      223   COMPUTED-4V14. . . . . . . . .  M826 M851 M876
      242   COR-ANSI-REFERENCE . . . . . .  M448 M450
      233   CORRECT-A. . . . . . . . . . .  234 235 236 237 238 454 456 M944 M984
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    23
0 Defined   Cross-reference of data names   References

0     234   CORRECT-N. . . . . . . . . . .  M480 M564 M586 M606 M627 M696 M731 M766 M801
      232   CORRECT-X. . . . . . . . . . .  M371 440
      235   CORRECT-0V18 . . . . . . . . .  M973
      237   CORRECT-14V4 . . . . . . . . .  M660
      239   CORRECT-18V0 . . . . . . . . .  M502 M522 M543 M897 M916 M933 M1004 M1023
      236   CORRECT-4V14 . . . . . . . . .  M827 M852 M877
      238   CR-18V0
      201   DECMAL-FIELD . . . . . . . . .  M958 M966 969 972
      256   DELETE-COUNTER . . . . . . . .  M360 389 405 407
      211   DOTVALUE . . . . . . . . . . .  M365
      262   DUMMY-HOLD . . . . . . . . . .  M419 429
       39   DUMMY-RECORD . . . . . . . . .  M375 M376 M377 M378 M380 M381 M382 M384 M386 M395 M402 M409 M414 M415 419 M420
                                            421 M422 M423 M424 M425 M426 M427 M428 M429 433 M434 M443 M458
      309   ENDER-DESC . . . . . . . . . .  M397 M408 M413
      257   ERROR-COUNTER. . . . . . . . .  M359 388 398 401
      261   ERROR-HOLD . . . . . . . . . .  M388 M389 M389 M390 393
      307   ERROR-TOTAL. . . . . . . . . .  M399 M401 M406 M407 M411 M412
      192   EVEN-NAME1 . . . . . . . . . .  926
      197   EVEN-NAME2 . . . . . . . . . .  M961 966
      204   FEATURE. . . . . . . . . . . .  M466 M487 M489 M550 M593 M667 M808 M884
      335   HYPHEN-LINE. . . . . . . . . .  382 384 428
      301   ID-AGAIN . . . . . . . . . . .  M347
      334   INF-ANSI-REFERENCE . . . . . .  M441 M444 M457 M459
      329   INFO-TEXT. . . . . . . . . . .  M442
      258   INSPECT-COUNTER. . . . . . . .  M357 388 410 412
      189   MINUS-NAMES
      190   MINUS-NAME1. . . . . . . . . .  925
      191   MINUS-NAME2. . . . . . . . . .  925
      195   MINUS-NAME3. . . . . . . . . .  M959 965
      196   MINUS-NAME4. . . . . . . . . .  M960 965
      154   N-10
      156   N-11
      157   N-12
      158   N-13
      160   N-14
      161   N-15
      162   N-16
      164   N-17
      166   N-18
      168   N-19
      169   N-20
      171   N-21
      172   N-22
      174   N-23
      175   N-25
      176   N-26
      177   N-27
      179   N-28
      144   N-3
      145   N-4
      180   N-40
      182   N-41
      184   N-42
      186   N-43
      187   N-44
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    24
0 Defined   Cross-reference of data names   References

0     188   N-45
      147   N-5. . . . . . . . . . . . . .  M467 470
      150   N-7. . . . . . . . . . . . . .  153 M468 M470 472 479
      106   NDATA-DS-09V09
      206   P-OR-F . . . . . . . . . . . .  M357 M358 M359 M360 367 M370
      208   PAR-NAME . . . . . . . . . . .  M372 M483 M505 M525 M546 M567 M589 M609 M630 M647 M663 M683 M699 M719 M734 M753
                                            M769 M789 M804 M830 M855 M880 M900 M919 M939 M953 M979 M993 M1011 M1030
      210   PARDOT-X . . . . . . . . . . .  M364
      259   PASS-COUNTER . . . . . . . . .  M358 390 392
      193   PLUS-NAME1 . . . . . . . . . .  925
      194   PLUS-NAME2 . . . . . . . . . .  926
      198   PLUS-NAME3 . . . . . . . . . .  M962 965
      199   PLUS-NAME4 . . . . . . . . . .  M963 966
       37   PRINT-FILE . . . . . . . . . .  33 346 352
       38   PRINT-REC. . . . . . . . . . .  M366 M447 M449
      213   RE-MARK. . . . . . . . . . . .  M361 M373 M644 M658 M680 M694 M716 M750 M764 M786 M946 M986
      255   REC-CT . . . . . . . . . . . .  363 365 372
      254   REC-SKL-SUB
      263   RECORD-COUNT . . . . . . . . .  M417 418 M430
       41   SIZE-ERR . . . . . . . . . . .  M923 M927 942 M957 M967 982
      134   SUBTR-1
      142   SUBTR-10
      143   SUBTR-11
      135   SUBTR-2
      136   SUBTR-3
      137   SUBTR-4
      138   SUBTR-5
      139   SUBTR-6
      140   SUBTR-7
      141   SUBTR-8
      133   SUBTRACT-DATA
      214   TEST-COMPUTED. . . . . . . . .  447
      229   TEST-CORRECT . . . . . . . . .  449
      282   TEST-ID. . . . . . . . . . . .  M347
      202   TEST-RESULTS . . . . . . . . .  M348 366
      260   TOTAL-ERROR
      185   TRUNC-DATA
      200   WHOLE-FIELD. . . . . . . . . .  M926 929 932
       98   WRK-CS-02V02
      132   WRK-CS-03V00
       95   WRK-CS-18V00 . . . . . . . . .  M885 M887 889 896 M997 M999 1001 1005
      114   WRK-CU-18V00
       73   WRK-DS-T-05V00 . . . . . . . .  M594 M596 598 605 M668 M673 686 695 M738 M743 756 765
       74   WRK-DS-T-06V00 . . . . . . . .  M613 M617 619 626
       59   WRK-DS-T-18V00 . . . . . . . .  M490 M492 494 501 M904 M906 908 915 M1015 M1018 1020 1024
      101   WRK-DS-TS-0201P
       65   WRK-DS-TS-06V06. . . . . . . .  67 M571 M576 578 585 M703 M708 722 730 M773 M778 792 800
       67   WRK-DS-TS-12V00-S
       75   WRK-DS-02V00
       79   WRK-DS-03V10 . . . . . . . . .  80 M809 M817 819 826 M834 M842 844 851 M859 M867 869 876
      102   WRK-DS-06V00
       58   WRK-DS-09V09 . . . . . . . . .  59 M551 M554 556 563
       48   WRK-DS-10V00 . . . . . . . . .  M509 M512 514 521 M529 M533 535 542 M634 M637 650 659
       80   WRK-DS-13V00-S
      129   WRK-DU-18V00
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    25
0 Defined   Cross-reference of data names   References

0     110   WRK-XN-00018
      153   X-8
      108   XDATA-XN-00018
      331   XXCOMPUTED . . . . . . . . . .  M456
      333   XXCORRECT. . . . . . . . . . .  M456
      326   XXINFO . . . . . . . . . . . .  443 458
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    26
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

      452   BAIL-OUT . . . . . . . . . . .  P369
      460   BAIL-OUT-EX. . . . . . . . . .  E369 G454
      455   BAIL-OUT-WRITE . . . . . . . .  G453
      435   BLANK-LINE-PRINT
     1032   CCVS-EXIT
     1033   CCVS-999999
      344   CCVS1
      461   CCVS1-EXIT . . . . . . . . . .  G350
      351   CLOSE-FILES. . . . . . . . . .  G1034
      379   COLUMN-NAMES-ROUTINE . . . . .  E349
      360   DE-LETE. . . . . . . . . . . .  P476 P498 P518 P539 P560 P582 P602 P623 P641 P655 P677 P691 P713 P727 P747 P761
                                            P783 P797 P823 P848 P873 P893 P912 P937 P951 P977 P991 P1009 P1028
      383   END-ROUTINE. . . . . . . . . .  P352
      387   END-ROUTINE-1
      396   END-ROUTINE-12
      404   END-ROUTINE-13 . . . . . . . .  E352
      385   END-RTN-EXIT
      359   FAIL . . . . . . . . . . . . .  P481 P503 P523 P544 P565 P587 P607 P628 P645 P661 P681 P697 P717 P732 P751 P767
                                            P787 P802 P828 P853 P878 P898 P917 P934 P943 P974 P983 P1006 P1025
      437   FAIL-ROUTINE . . . . . . . . .  P368
      451   FAIL-ROUTINE-EX. . . . . . . .  E368 G445
      446   FAIL-ROUTINE-WRITE . . . . . .  G439 G440
      374   HEAD-ROUTINE . . . . . . . . .  P349
      357   INSPT
      345   OPEN-FILES
      358   PASS . . . . . . . . . . . . .  P473 P495 P515 P536 P557 P579 P599 P620 P638 P651 P674 P687 P710 P723 P744 P757
                                            P780 P793 P820 P845 P870 P890 P909 P930 P948 P970 P988 P1002 P1021
      362   PRINT-DETAIL . . . . . . . . .  P484 P488 P506 P526 P547 P568 P590 P610 P631 P648 P664 P684 P700 P720 P735 P754
                                            P770 P790 P805 P831 P856 P881 P901 P920 P940 P954 P980 P994 P1012 P1031
      463   SECT-NC118A-001
      475   SIG-DELETE-GF-1
      559   SIG-DELETE-GF-10
      581   SIG-DELETE-GF-11
      622   SIG-DELETE-GF-12
      640   SIG-DELETE-GF-13-1
      654   SIG-DELETE-GF-13-2
      746   SIG-DELETE-GF-14-1
      760   SIG-DELETE-GF-14-2
      782   SIG-DELETE-GF-15-1
      796   SIG-DELETE-GF-15-2
      822   SIG-DELETE-GF-16
      847   SIG-DELETE-GF-17
      872   SIG-DELETE-GF-18
      936   SIG-DELETE-GF-19-1
      950   SIG-DELETE-GF-19-2
      497   SIG-DELETE-GF-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    27
0 Defined   Cross-reference of procedures   References

0     976   SIG-DELETE-GF-20-1
      990   SIG-DELETE-GF-20-2
     1008   SIG-DELETE-GF-21
     1027   SIG-DELETE-GF-22
      517   SIG-DELETE-GF-3
      538   SIG-DELETE-GF-4
      601   SIG-DELETE-GF-5
      676   SIG-DELETE-GF-6-1
      690   SIG-DELETE-GF-6-2
      712   SIG-DELETE-GF-7-1
      726   SIG-DELETE-GF-7-2
      892   SIG-DELETE-GF-8
      911   SIG-DELETE-GF-9
      478   SIG-FAIL-GF-1. . . . . . . . .  G474
      562   SIG-FAIL-GF-10 . . . . . . . .  G558
      584   SIG-FAIL-GF-11 . . . . . . . .  G580
      625   SIG-FAIL-GF-12 . . . . . . . .  G621
      643   SIG-FAIL-GF-13-1 . . . . . . .  G639
      657   SIG-FAIL-GF-13-2 . . . . . . .  G653
      749   SIG-FAIL-GF-14-1 . . . . . . .  G745
      763   SIG-FAIL-GF-14-2 . . . . . . .  G758
      785   SIG-FAIL-GF-15-1 . . . . . . .  G779
      799   SIG-FAIL-GF-15-2 . . . . . . .  G795
      825   SIG-FAIL-GF-16 . . . . . . . .  G821
      850   SIG-FAIL-GF-17 . . . . . . . .  G846
      875   SIG-FAIL-GF-18 . . . . . . . .  G871
      500   SIG-FAIL-GF-2. . . . . . . . .  G496
      520   SIG-FAIL-GF-3. . . . . . . . .  G516
      541   SIG-FAIL-GF-4. . . . . . . . .  G537
      604   SIG-FAIL-GF-5. . . . . . . . .  G600
      679   SIG-FAIL-GF-6-1. . . . . . . .  G675
      693   SIG-FAIL-GF-6-2. . . . . . . .  G689
      715   SIG-FAIL-GF-7-1. . . . . . . .  G709
      729   SIG-FAIL-GF-7-2. . . . . . . .  G725
      895   SIG-FAIL-GF-8. . . . . . . . .  G891
      914   SIG-FAIL-GF-9. . . . . . . . .  G910
      464   SIG-INIT-GF-1
      548   SIG-INIT-GF-10
      569   SIG-INIT-GF-11
      611   SIG-INIT-GF-12
      632   SIG-INIT-GF-13
      736   SIG-INIT-GF-14
      771   SIG-INIT-GF-15
      806   SIG-INIT-GF-16
      832   SIG-INIT-GF-17
      857   SIG-INIT-GF-18
      921   SIG-INIT-GF-19
      485   SIG-INIT-GF-2
      955   SIG-INIT-GF-20
      995   SIG-INIT-GF-21
     1013   SIG-INIT-GF-22
      507   SIG-INIT-GF-3
      527   SIG-INIT-GF-4
      591   SIG-INIT-GF-5
      665   SIG-INIT-GF-6
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    28
0 Defined   Cross-reference of procedures   References

0     701   SIG-INIT-GF-7
      882   SIG-INIT-GF-8
      902   SIG-INIT-GF-9
      469   SIG-TEST-GF-1-0
      471   SIG-TEST-GF-1-1
      552   SIG-TEST-GF-10-0
      555   SIG-TEST-GF-10-1
      572   SIG-TEST-GF-11-0
      577   SIG-TEST-GF-11-1
      614   SIG-TEST-GF-12-0
      618   SIG-TEST-GF-12-1
      635   SIG-TEST-GF-13-1-0
      649   SIG-TEST-GF-13-2
      739   SIG-TEST-GF-14-1
      755   SIG-TEST-GF-14-2
      774   SIG-TEST-GF-15-1-0
      791   SIG-TEST-GF-15-2
      810   SIG-TEST-GF-16-0
      818   SIG-TEST-GF-16-1
      835   SIG-TEST-GF-17-0
      843   SIG-TEST-GF-17-1
      860   SIG-TEST-GF-18-0
      868   SIG-TEST-GF-18-1
      924   SIG-TEST-GF-19-0
      928   SIG-TEST-GF-19-1
      941   SIG-TEST-GF-19-2
      491   SIG-TEST-GF-2-0
      493   SIG-TEST-GF-2-1
      964   SIG-TEST-GF-20-0
      968   SIG-TEST-GF-20-1
      981   SIG-TEST-GF-20-2
      998   SIG-TEST-GF-21-0
     1000   SIG-TEST-GF-21-1
     1016   SIG-TEST-GF-22-0
     1019   SIG-TEST-GF-22-1
      510   SIG-TEST-GF-3-0
      513   SIG-TEST-GF-3-1
      530   SIG-TEST-GF-4-0
      534   SIG-TEST-GF-4-1
      595   SIG-TEST-GF-5-0
      597   SIG-TEST-GF-5-1
      669   SIG-TEST-GF-6-1
      685   SIG-TEST-GF-6-2
      704   SIG-TEST-GF-7-1
      721   SIG-TEST-GF-7-2
      886   SIG-TEST-GF-8-0
      888   SIG-TEST-GF-8-1
      905   SIG-TEST-GF-9-0
      907   SIG-TEST-GF-9-1
      482   SIG-WRITE-GF-1 . . . . . . . .  G473 G477
      566   SIG-WRITE-GF-10. . . . . . . .  G557 G561
      588   SIG-WRITE-GF-11. . . . . . . .  G579 G583
      629   SIG-WRITE-GF-12. . . . . . . .  G620 G624
      646   SIG-WRITE-GF-13-1. . . . . . .  G638 G642
      662   SIG-WRITE-GF-13-2. . . . . . .  G651 G656
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    29
0 Defined   Cross-reference of procedures   References

0     752   SIG-WRITE-GF-14-1. . . . . . .  G744 G748
      768   SIG-WRITE-GF-14-2. . . . . . .  G757 G762
      788   SIG-WRITE-GF-15-1. . . . . . .  G781 G784
      803   SIG-WRITE-GF-15-2. . . . . . .  G793 G798
      829   SIG-WRITE-GF-16. . . . . . . .  G820 G824
      854   SIG-WRITE-GF-17. . . . . . . .  G845 G849
      879   SIG-WRITE-GF-18. . . . . . . .  G870 G874
      938   SIG-WRITE-GF-19-1. . . . . . .  G931 G935
      952   SIG-WRITE-GF-19-2. . . . . . .  G947 G949
      504   SIG-WRITE-GF-2 . . . . . . . .  G495 G499
      978   SIG-WRITE-GF-20-1. . . . . . .  G971 G975
      992   SIG-WRITE-GF-20-2. . . . . . .  G987 G989
     1010   SIG-WRITE-GF-21. . . . . . . .  G1003 G1007
     1029   SIG-WRITE-GF-22. . . . . . . .  G1022 G1026
      524   SIG-WRITE-GF-3 . . . . . . . .  G515 G519
      545   SIG-WRITE-GF-4 . . . . . . . .  G536 G540
      608   SIG-WRITE-GF-5 . . . . . . . .  G599 G603
      682   SIG-WRITE-GF-6-1 . . . . . . .  G674 G678
      698   SIG-WRITE-GF-6-2 . . . . . . .  G687 G692
      718   SIG-WRITE-GF-7-1 . . . . . . .  G711 G714
      733   SIG-WRITE-GF-7-2 . . . . . . .  G723 G728
      899   SIG-WRITE-GF-8 . . . . . . . .  G890 G894
      918   SIG-WRITE-GF-9 . . . . . . . .  G909 G913
      355   TERMINATE-CALL
      353   TERMINATE-CCVS
      416   WRITE-LINE . . . . . . . . . .  P366 P367 P375 P376 P377 P378 P380 P381 P382 P384 P386 P395 P403 P409 P414 P415
                                            P443 P447 P449 P458
      432   WRT-LN . . . . . . . . . . . .  P422 P423 P424 P425 P426 P427 P428 P431 P436
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    30
0 Defined   Cross-reference of programs     References

        3   NC118A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC118A    Date 06/04/2022  Time 11:59:44   Page    31
0LineID  Message code  Message text

     37  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC118A:
 *    Source records = 1034
 *    Data Division statements = 166
 *    Procedure Division statements = 528
 *    Generated COBOL statements = 0
 *    Program complexity factor = 545
0End of compilation 1,  program NC118A,  highest severity 0.
0Return code 0
