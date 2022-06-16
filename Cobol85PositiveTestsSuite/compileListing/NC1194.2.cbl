1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:27   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:27   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1194.2
   000002         000200 PROGRAM-ID.                                                      NC1194.2
   000003         000300     NC119A.                                                      NC1194.2
   000004         000500*                                                              *  NC1194.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1194.2
   000006         000700*                                                              *  NC1194.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1194.2
   000008         000900*                                                              *  NC1194.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1194.2
   000010         001100*                                                              *  NC1194.2
   000011         001300*                                                              *  NC1194.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1194.2
   000013         001500*                                                              *  NC1194.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1194.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1194.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1194.2
   000017         001900*                                                              *  NC1194.2
   000018         002100*                                                                 NC1194.2
   000019         002200*      PROGRAM NC119A TESTS THE USE OF THE "SIGN" CLAUSE WITH     NC1194.2
   000020         002300*      FORMATS 1 AND 2 OF THE SUBTRACT STATEMENT.                 NC1194.2
   000021         002400*      ALL COMBINATIONS OF THE SIGN CLAUSE PHRASES ARE USED       NC1194.2
   000022         002500*      WITH DATA ITEMS OF VARIOUS LENGTHS.                        NC1194.2
   000023         002600*                                                                 NC1194.2
   000024         002700*                                                                 NC1194.2
   000025         002800                                                                  NC1194.2
   000026         002900 ENVIRONMENT DIVISION.                                            NC1194.2
   000027         003000 CONFIGURATION SECTION.                                           NC1194.2
   000028         003100 SOURCE-COMPUTER.                                                 NC1194.2
   000029         003200     XXXXX082.                                                    NC1194.2
   000030         003300 OBJECT-COMPUTER.                                                 NC1194.2
   000031         003400     XXXXX083.                                                    NC1194.2
   000032         003500 INPUT-OUTPUT SECTION.                                            NC1194.2
   000033         003600 FILE-CONTROL.                                                    NC1194.2
   000034         003700     SELECT PRINT-FILE ASSIGN TO                                  NC1194.2 38
   000035         003800     XXXXX055.                                                    NC1194.2
   000036         003900 DATA DIVISION.                                                   NC1194.2
   000037         004000 FILE SECTION.                                                    NC1194.2
   000038         004100 FD  PRINT-FILE.                                                  NC1194.2

 ==000038==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000039         004200 01  PRINT-REC PICTURE X(120).                                    NC1194.2
   000040         004300 01  DUMMY-RECORD PICTURE X(120).                                 NC1194.2
   000041         004400 WORKING-STORAGE SECTION.                                         NC1194.2
   000042         004500 77  SIZE-ERR                     PICTURE X  VALUE SPACE.         NC1194.2 IMP
   000043         004600 77  A18TWOS-DS-LS-18V00             PICTURE S9(18)               NC1194.2
   000044         004700             SIGN IS LEADING SEPARATE                             NC1194.2
   000045         004800                                  VALUE 222222222222222222.       NC1194.2
   000046         004900 77  A18ONES-DS-TS-18V00             PICTURE S9(18)               NC1194.2
   000047         005000            SIGN IS TRAILING SEPARATE                             NC1194.2
   000048         005100                                  VALUE 111111111111111111.       NC1194.2
   000049         005200 77  WRK-DS-10V00                 PICTURE S9(10) TRAILING.        NC1194.2
   000050         005300 77  A10ONES-DS-T-10V00             PICTURE S9(10)                NC1194.2
   000051         005400            SIGN TRAILING                                         NC1194.2
   000052         005500                                  VALUE 1111111111.               NC1194.2
   000053         005600 77  A05ONES-DS-L-05V00             PICTURE S9(5)                 NC1194.2
   000054         005700           SIGN LEADING                                           NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800                                  VALUE 11111.                    NC1194.2
   000056         005900 77  A02ONES-DS-LS-02V00             PICTURE S99                  NC1194.2
   000057         006000           LEADING SEPARATE                                       NC1194.2
   000058         006100                                  VALUE 11.                       NC1194.2
   000059         006200 77  WRK-DS-09V09                 PICTURE S9(9)V9(9)   TRAILING.  NC1194.2
   000060         006300 77  WRK-DS-T-18V00 REDEFINES WRK-DS-09V09                        NC1194.2 59
   000061         006400                                  PICTURE S9(18) TRAILING.        NC1194.2
   000062         006500 77  A06THREES-DS-03V03           PICTURE S999V999                NC1194.2
   000063         006600                                  VALUE 333.333.                  NC1194.2
   000064         006700 77  A12THREES-DS-06V06           PICTURE S9(6)V9(6)              NC1194.2
   000065         006800                                  VALUE 333333.333333.            NC1194.2
   000066         006900 77  WRK-DS-TS-06V06                 PICTURE S9(6)V9(6)           NC1194.2
   000067         007000           SIGN IS TRAILING SEPARATE CHARACTER.                   NC1194.2
   000068         007100 77  WRK-DS-TS-12V00-S REDEFINES WRK-DS-TS-06V06                  NC1194.2 66
   000069         007200         TRAILING SEPARATE                                        NC1194.2
   000070         007300                                  PICTURE S9(12).                 NC1194.2
   000071         007400 77  A05ONES-DS-LS-00V05             PICTURE SV9(5)               NC1194.2
   000072         007500         LEADING SEPARATE                                         NC1194.2
   000073         007600                                  VALUE .11111.                   NC1194.2
   000074         007700 77  WRK-DS-T-05V00                 PICTURE S9(5) TRAILING.       NC1194.2
   000075         007800 77  WRK-DS-02V00                 PICTURE S99.                    NC1194.2
   000076         007900 77  A12ONES-DS-L-12V00             PICTURE S9(12)                NC1194.2
   000077         008000              USAGE IS DISPLAY SIGN IS LEADING                    NC1194.2
   000078         008100                                  VALUE 111111111111.             NC1194.2
   000079         008200 77  WRK-DS-03V10                 PICTURE S999V9(10).             NC1194.2
   000080         008300 77  WRK-DS-13V00-S REDEFINES WRK-DS-03V10                        NC1194.2 79
   000081         008400                                  PICTURE S9(13).                 NC1194.2
   000082         008500 77  A99-DS-T-02V00                 PICTURE S99                   NC1194.2
   000083         008600             USAGE IS DISPLAY SIGN IS TRAILING                    NC1194.2
   000084         008700                                  VALUE 99.                       NC1194.2
   000085         008800 77  A03ONES-DS-02V01             PICTURE S99V9                   NC1194.2
   000086         008900                                  VALUE 11.1.                     NC1194.2
   000087         009000 77  A06ONES-DS-TS-03V03             PICTURE S999V999             NC1194.2
   000088         009100             USAGE IS DISPLAY TRAILING SEPARATE                   NC1194.2
   000089         009200                                  VALUE 111.111.                  NC1194.2
   000090         009300 77  A08TWOS-DS-02V06             PICTURE S99V9(6)                NC1194.2
   000091         009400                                  VALUE 22.222222.                NC1194.2
   000092         009500 77  A01ONES-DS-LS-P0801              PICTURE SP(8)9              NC1194.2
   000093         009600             SIGN IS LEADING SEPARATE                             NC1194.2
   000094         009700                                  VALUE .000000001.               NC1194.2
   000095         009800 77  WRK-CS-18V00                 PICTURE S9(18) COMPUTATIONAL.   NC1194.2
   000096         009900 77  A18ONES-CS-18V00             PICTURE S9(18) COMPUTATIONAL    NC1194.2
   000097         010000                                  VALUE 111111111111111111.       NC1194.2
   000098         010100 77  WRK-CS-02V02                 PICTURE S99V99 COMPUTATIONAL.   NC1194.2
   000099         010200 77  A99-CS-02V00                 PICTURE S99 COMPUTATIONAL       NC1194.2
   000100         010300                                  VALUE 99.                       NC1194.2
   000101         010400 77  WRK-DS-TS-0201P            PICTURE S99P TRAILING SEPARATE.   NC1194.2
   000102         010500 77  WRK-DS-06V00                 PICTURE S9(6).                  NC1194.2
   000103         010600 77  AZERO-DS-LS-05V05               PICTURE S9(5)V9(5)           NC1194.2
   000104         010700             SIGN IS LEADING SEPARATE USAGE DISPLAY               NC1194.2
   000105         010800                                  VALUE ZERO.                     NC1194.2 IMP
   000106         010900 77  NDATA-DS-09V09               PICTURE S9(9)V9(9)              NC1194.2
   000107         011000                                  VALUE +012345678.876543210.     NC1194.2
   000108         011100 77  XDATA-XN-00018               PICTURE X(18)                   NC1194.2
   000109         011200                                  VALUE "00ABCDEFGHI  4321 ".     NC1194.2
   000110         011300 77  WRK-XN-00018                 PICTURE X(18).                  NC1194.2
   000111         011400 77  ADD-12    PICTURE PP9        VALUE .001.                     NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 77  ADD-13    PICTURE 9PP        VALUE 100.                      NC1194.2
   000113         011600 77  ADD-14    PICTURE 999V999.                                   NC1194.2
   000114         011700 77  WRK-CU-18V00      PICTURE 9(18) VALUE ZERO COMPUTATIONAL.    NC1194.2 IMP
   000115         011800 77  A18EIGHTS-CS-18V00 PICTURE S9(18) VALUE -888888888888888888  NC1194.2
   000116         011900             COMPUTATIONAL.                                       NC1194.2
   000117         012000 77  A14TWOS-CS-18V00  PICTURE S9(18) VALUE -000022222222222222   NC1194.2
   000118         012100             COMPUTATIONAL.                                       NC1194.2
   000119         012200 77  A12THREES-CU-18V00 PICTURE 9(18) VALUE 000000333333333333    NC1194.2
   000120         012300             COMPUTATIONAL.                                       NC1194.2
   000121         012400 77  A16FOURS-CS-18V00 PICTURE S9(18) VALUE 004444444444444444    NC1194.2
   000122         012500             COMPUTATIONAL.                                       NC1194.2
   000123         012600 77  A18FIVES-CS-18V00 PICTURE S9(18) VALUE -555555555555555555   NC1194.2
   000124         012700             COMPUTATIONAL.                                       NC1194.2
   000125         012800 77  A18SIXES-CS-18V00 PICTURE S9(18) VALUE 666666666666666666    NC1194.2
   000126         012900             COMPUTATIONAL.                                       NC1194.2
   000127         013000 77  A12SEVENS-CU-18V00 PICTURE 9(18) VALUE 000000777777777777    NC1194.2
   000128         013100             COMPUTATIONAL.                                       NC1194.2
   000129         013200 77  WRK-DU-18V00      PICTURE 9(18) VALUE ZERO.                  NC1194.2 IMP
   000130         013300 77  A18THREES-CS-18V00 PICTURE S9(18) VALUE -333333333333333333  NC1194.2
   000131         013400             COMPUTATIONAL.                                       NC1194.2
   000132         013500 77  WRK-CS-03V00 PICTURE S999 COMPUTATIONAL SYNCHRONIZED RIGHT.  NC1194.2
   000133         013600 01  SUBTRACT-DATA SIGN IS LEADING SEPARATE DISPLAY.              NC1194.2
   000134         013700     02  SUBTR-1    PICTURE 9         VALUE 1.                    NC1194.2
   000135         013800     02  SUBTR-2    PICTURE S99       VALUE 99.                   NC1194.2
   000136         013900     02  SUBTR-3    PICTURE S9V99     VALUE -1.                   NC1194.2
   000137         014000     02  SUBTR-4    PICTURE SPP9      VALUE .001.                 NC1194.2
   000138         014100     02  SUBTR-5    PICTURE S9PP      VALUE 100.                  NC1194.2
   000139         014200     02  SUBTR-6    PICTURE 9  VALUE 1.                           NC1194.2
   000140         014300     02  SUBTR-7    PICTURE S99  VALUE 99.                        NC1194.2
   000141         014400     02  SUBTR-8    PICTURE S9V99  VALUE -9.99.                   NC1194.2
   000142         014500     02  SUBTR-10    PICTURE S999  VALUE 100.                     NC1194.2
   000143         014600     02  SUBTR-11   PICTURE S999V999.                             NC1194.2
   000144         014700 01  N-3                                PICTURE IS 99999.         NC1194.2
   000145         014800 01  N-4                                PICTURE IS 9(5)           NC1194.2
   000146         014900     VALUE IS 52800.                                              NC1194.2
   000147         015000 01  N-5                                PICTURE IS S9(9)V99       NC1194.2
   000148         015100             SIGN IS LEADING SEPARATE                             NC1194.2
   000149         015200     VALUE IS 000000001.00.                                       NC1194.2
   000150         015300 01  N-7                                PICTURE IS S9(7)V9(4)     NC1194.2
   000151         015400             SIGN IS LEADING SEPARATE CHARACTER                   NC1194.2
   000152         015500     VALUE IS 0000001.0000.                                       NC1194.2
   000153         015600 01  X-8 REDEFINES N-7                  PICTURE IS X(11).         NC1194.2 150
   000154         015700 01  N-10                               PICTURE IS S99999V        NC1194.2
   000155         015800     VALUE IS -00001.                                             NC1194.2
   000156         015900 01  N-11                               PICTURE IS 9 VALUE IS 9.  NC1194.2
   000157         016000 01  N-12                               PICTURE IS 9 VALUE IS 9.  NC1194.2
   000158         016100 01  N-13                               PICTURE IS 9(5)           NC1194.2
   000159         016200     VALUE IS 99999.                                              NC1194.2
   000160         016300 01  N-14                               PICTURE IS 9 VALUE IS 1.  NC1194.2
   000161         016400 01  N-15                               PICTURE IS 9(16).         NC1194.2
   000162         016500 01  N-16                               PICTURE IS S999999V99     NC1194.2
   000163         016600     VALUE IS 5.90.                                               NC1194.2
   000164         016700 01  N-17                               PICTURE IS S9(3)V99       NC1194.2
   000165         016800     VALUE IS +3.6.                                               NC1194.2
   000166         016900 01  N-18                               PICTURE IS S9(10)         NC1194.2
   000167         017000     VALUE IS -5.                                                 NC1194.2
   000168         017100 01  N-19                               PICTURE IS $9.00.         NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  N-20                               PICTURE IS S9(9)          NC1194.2
   000170         017300     VALUE IS -999999999.                                         NC1194.2
   000171         017400 01  N-21                               PICTURE IS 9 VALUE IS 5.  NC1194.2
   000172         017500 01  N-22                               PICTURE IS 999V99         NC1194.2
   000173         017600     VALUE IS 005.55.                                             NC1194.2
   000174         017700 01  N-23                               PICTURE IS $$$.99CR.      NC1194.2
   000175         017800 01  N-25                               PICTURE IS 9 VALUE IS 1.  NC1194.2
   000176         017900 01  N-26               PICTURE 9(5).                             NC1194.2
   000177         018000 01  N-27                               PICTURE IS 9999V9         NC1194.2
   000178         018100     VALUE IS 9999.9.                                             NC1194.2
   000179         018200 01  N-28                               PICTURE IS $9999.00.      NC1194.2
   000180         018300 01  N-40                               PICTURE IS 9(7)           NC1194.2
   000181         018400     VALUE IS 7777777.                                            NC1194.2
   000182         018500 01  N-41                               PICTURE IS 9(7)           NC1194.2
   000183         018600     VALUE IS 1111111.                                            NC1194.2
   000184         018700 01  N-42                               PICTURE IS 9(3)P(4).      NC1194.2
   000185         018800 01  TRUNC-DATA.                                                  NC1194.2
   000186         018900     02 N-43  PICTURE S9V9 VALUE +1.6.                            NC1194.2
   000187         019000     02 N-44  PICTURE S9V9 VALUE -1.6.                            NC1194.2
   000188         019100     02 N-45  PICTURE S9.                                         NC1194.2
   000189         019200 01  MINUS-NAMES SIGN IS LEADING SEPARATE CHARACTER.              NC1194.2
   000190         019300     02  MINUS-NAME1 PICTURE S9(18) VALUE -999999999999999999.    NC1194.2
   000191         019400     02  MINUS-NAME2 PICTURE S9(18) VALUE -999999999999999999.    NC1194.2
   000192         019500     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC1194.2
   000193         019600     02  PLUS-NAME1  PICTURE S9(18) VALUE +999999999999999999.    NC1194.2
   000194         019700     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC1194.2
   000195         019800     02  MINUS-NAME3 PICTURE SV9(18) VALUE -.999999999999999999.  NC1194.2
   000196         019900     02  MINUS-NAME4 PICTURE SV9(18) VALUE -.999999999999999999.  NC1194.2
   000197         020000     02  EVEN-NAME2  PICTURE SV9(18)  VALUE +.1.                  NC1194.2
   000198         020100     02  PLUS-NAME3  PICTURE SV9(18) VALUE +.999999999999999999.  NC1194.2
   000199         020200     02  PLUS-NAME4  PICTURE SV9(18) VALUE +.999999999999999999.  NC1194.2
   000200         020300     02  WHOLE-FIELD   PICTURE S9(18).                            NC1194.2
   000201         020400     02  DECMAL-FIELD  PICTURE SV9(18).                           NC1194.2
   000202         020500 01  TEST-RESULTS.                                                NC1194.2
   000203         020600     02 FILLER                   PIC X      VALUE SPACE.          NC1194.2 IMP
   000204         020700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1194.2 IMP
   000205         020800     02 FILLER                   PIC X      VALUE SPACE.          NC1194.2 IMP
   000206         020900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1194.2 IMP
   000207         021000     02 FILLER                   PIC X      VALUE SPACE.          NC1194.2 IMP
   000208         021100     02  PAR-NAME.                                                NC1194.2
   000209         021200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1194.2 IMP
   000210         021300       03  PARDOT-X              PIC X      VALUE SPACE.          NC1194.2 IMP
   000211         021400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1194.2 IMP
   000212         021500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1194.2 IMP
   000213         021600     02 RE-MARK                  PIC X(61).                       NC1194.2
   000214         021700 01  TEST-COMPUTED.                                               NC1194.2
   000215         021800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1194.2 IMP
   000216         021900     02 FILLER                   PIC X(17)  VALUE                 NC1194.2
   000217         022000            "       COMPUTED=".                                   NC1194.2
   000218         022100     02 COMPUTED-X.                                               NC1194.2
   000219         022200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1194.2 IMP
   000220         022300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1194.2 219
   000221         022400                                 PIC -9(9).9(9).                  NC1194.2
   000222         022500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1194.2 219
   000223         022600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1194.2 219
   000224         022700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1194.2 219
   000225         022800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1194.2 219
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900         04 COMPUTED-18V0                    PIC -9(18).          NC1194.2
   000227         023000         04 FILLER                           PIC X.               NC1194.2
   000228         023100     03 FILLER PIC X(50) VALUE SPACE.                             NC1194.2 IMP
   000229         023200 01  TEST-CORRECT.                                                NC1194.2
   000230         023300     02 FILLER PIC X(30) VALUE SPACE.                             NC1194.2 IMP
   000231         023400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1194.2
   000232         023500     02 CORRECT-X.                                                NC1194.2
   000233         023600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1194.2 IMP
   000234         023700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1194.2 233
   000235         023800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1194.2 233
   000236         023900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1194.2 233
   000237         024000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1194.2 233
   000238         024100     03      CR-18V0 REDEFINES CORRECT-A.                         NC1194.2 233
   000239         024200         04 CORRECT-18V0                     PIC -9(18).          NC1194.2
   000240         024300         04 FILLER                           PIC X.               NC1194.2
   000241         024400     03 FILLER PIC X(2) VALUE SPACE.                              NC1194.2 IMP
   000242         024500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1194.2 IMP
   000243         024600 01  CCVS-C-1.                                                    NC1194.2
   000244         024700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1194.2
   000245         024800-    "SS  PARAGRAPH-NAME                                          NC1194.2
   000246         024900-    "       REMARKS".                                            NC1194.2
   000247         025000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1194.2 IMP
   000248         025100 01  CCVS-C-2.                                                    NC1194.2
   000249         025200     02 FILLER                     PIC X        VALUE SPACE.      NC1194.2 IMP
   000250         025300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1194.2
   000251         025400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1194.2 IMP
   000252         025500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1194.2
   000253         025600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1194.2 IMP
   000254         025700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1194.2 IMP
   000255         025800 01  REC-CT                        PIC 99       VALUE ZERO.       NC1194.2 IMP
   000256         025900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1194.2 IMP
   000257         026000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1194.2 IMP
   000258         026100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1194.2 IMP
   000259         026200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1194.2 IMP
   000260         026300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1194.2 IMP
   000261         026400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1194.2 IMP
   000262         026500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1194.2 IMP
   000263         026600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1194.2 IMP
   000264         026700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1194.2 IMP
   000265         026800 01  CCVS-H-1.                                                    NC1194.2
   000266         026900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1194.2 IMP
   000267         027000     02  FILLER                    PIC X(42)    VALUE             NC1194.2
   000268         027100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1194.2
   000269         027200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1194.2 IMP
   000270         027300 01  CCVS-H-2A.                                                   NC1194.2
   000271         027400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1194.2 IMP
   000272         027500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1194.2
   000273         027600   02  FILLER                        PIC XXXX   VALUE             NC1194.2
   000274         027700     "4.2 ".                                                      NC1194.2
   000275         027800   02  FILLER                        PIC X(28)  VALUE             NC1194.2
   000276         027900            " COPY - NOT FOR DISTRIBUTION".                       NC1194.2
   000277         028000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1194.2 IMP
   000278         028100                                                                  NC1194.2
   000279         028200 01  CCVS-H-2B.                                                   NC1194.2
   000280         028300   02  FILLER                        PIC X(15)  VALUE             NC1194.2
   000281         028400            "TEST RESULT OF ".                                    NC1194.2
   000282         028500   02  TEST-ID                       PIC X(9).                    NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600   02  FILLER                        PIC X(4)   VALUE             NC1194.2
   000284         028700            " IN ".                                               NC1194.2
   000285         028800   02  FILLER                        PIC X(12)  VALUE             NC1194.2
   000286         028900     " HIGH       ".                                              NC1194.2
   000287         029000   02  FILLER                        PIC X(22)  VALUE             NC1194.2
   000288         029100            " LEVEL VALIDATION FOR ".                             NC1194.2
   000289         029200   02  FILLER                        PIC X(58)  VALUE             NC1194.2
   000290         029300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1194.2
   000291         029400 01  CCVS-H-3.                                                    NC1194.2
   000292         029500     02  FILLER                      PIC X(34)  VALUE             NC1194.2
   000293         029600            " FOR OFFICIAL USE ONLY    ".                         NC1194.2
   000294         029700     02  FILLER                      PIC X(58)  VALUE             NC1194.2
   000295         029800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1194.2
   000296         029900     02  FILLER                      PIC X(28)  VALUE             NC1194.2
   000297         030000            "  COPYRIGHT   1985 ".                                NC1194.2
   000298         030100 01  CCVS-E-1.                                                    NC1194.2
   000299         030200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1194.2 IMP
   000300         030300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1194.2
   000301         030400     02 ID-AGAIN                     PIC X(9).                    NC1194.2
   000302         030500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1194.2 IMP
   000303         030600 01  CCVS-E-2.                                                    NC1194.2
   000304         030700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1194.2 IMP
   000305         030800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1194.2 IMP
   000306         030900     02 CCVS-E-2-2.                                               NC1194.2
   000307         031000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1194.2 IMP
   000308         031100         03 FILLER                   PIC X      VALUE SPACE.      NC1194.2 IMP
   000309         031200         03 ENDER-DESC               PIC X(44)  VALUE             NC1194.2
   000310         031300            "ERRORS ENCOUNTERED".                                 NC1194.2
   000311         031400 01  CCVS-E-3.                                                    NC1194.2
   000312         031500     02  FILLER                      PIC X(22)  VALUE             NC1194.2
   000313         031600            " FOR OFFICIAL USE ONLY".                             NC1194.2
   000314         031700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1194.2 IMP
   000315         031800     02  FILLER                      PIC X(58)  VALUE             NC1194.2
   000316         031900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1194.2
   000317         032000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1194.2 IMP
   000318         032100     02 FILLER                       PIC X(15)  VALUE             NC1194.2
   000319         032200             " COPYRIGHT 1985".                                   NC1194.2
   000320         032300 01  CCVS-E-4.                                                    NC1194.2
   000321         032400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1194.2 IMP
   000322         032500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1194.2
   000323         032600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1194.2 IMP
   000324         032700     02 FILLER                       PIC X(40)  VALUE             NC1194.2
   000325         032800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1194.2
   000326         032900 01  XXINFO.                                                      NC1194.2
   000327         033000     02 FILLER                       PIC X(19)  VALUE             NC1194.2
   000328         033100            "*** INFORMATION ***".                                NC1194.2
   000329         033200     02 INFO-TEXT.                                                NC1194.2
   000330         033300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1194.2 IMP
   000331         033400       04 XXCOMPUTED                 PIC X(20).                   NC1194.2
   000332         033500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1194.2 IMP
   000333         033600       04 XXCORRECT                  PIC X(20).                   NC1194.2
   000334         033700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1194.2
   000335         033800 01  HYPHEN-LINE.                                                 NC1194.2
   000336         033900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1194.2 IMP
   000337         034000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1194.2
   000338         034100-    "*****************************************".                 NC1194.2
   000339         034200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300-    "******************************".                            NC1194.2
   000341         034400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1194.2
   000342         034500     "NC119A".                                                    NC1194.2
   000343         034600 PROCEDURE DIVISION.                                              NC1194.2
   000344         034700 CCVS1 SECTION.                                                   NC1194.2
   000345         034800 OPEN-FILES.                                                      NC1194.2
   000346         034900     OPEN     OUTPUT PRINT-FILE.                                  NC1194.2 38
   000347         035000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1194.2 341 282 341 301
   000348         035100     MOVE    SPACE TO TEST-RESULTS.                               NC1194.2 IMP 202
   000349         035200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1194.2 374 379
   000350         035300     GO TO CCVS1-EXIT.                                            NC1194.2 461
   000351         035400 CLOSE-FILES.                                                     NC1194.2
   000352         035500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1194.2 383 404 38
   000353         035600 TERMINATE-CCVS.                                                  NC1194.2
   000354         035700     EXIT PROGRAM.                                                NC1194.2
   000355         035800 TERMINATE-CALL.                                                  NC1194.2
   000356         035900     STOP     RUN.                                                NC1194.2
   000357         036000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1194.2 206 258
   000358         036100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1194.2 206 259
   000359         036200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1194.2 206 257
   000360         036300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1194.2 206 256
   000361         036400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1194.2 213
   000362         036500 PRINT-DETAIL.                                                    NC1194.2
   000363         036600     IF REC-CT NOT EQUAL TO ZERO                                  NC1194.2 255 IMP
   000364      1  036700             MOVE "." TO PARDOT-X                                 NC1194.2 210
   000365      1  036800             MOVE REC-CT TO DOTVALUE.                             NC1194.2 255 211
   000366         036900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1194.2 202 39 416
   000367         037000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1194.2 206 416
   000368      1  037100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1194.2 437 451
   000369      1  037200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1194.2 452 460
   000370         037300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1194.2 IMP 206 IMP 218
   000371         037400     MOVE SPACE TO CORRECT-X.                                     NC1194.2 IMP 232
   000372         037500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1194.2 255 IMP IMP 208
   000373         037600     MOVE     SPACE TO RE-MARK.                                   NC1194.2 IMP 213
   000374         037700 HEAD-ROUTINE.                                                    NC1194.2
   000375         037800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1194.2 265 40 416
   000376         037900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1194.2 270 40 416
   000377         038000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1194.2 279 40 416
   000378         038100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1194.2 291 40 416
   000379         038200 COLUMN-NAMES-ROUTINE.                                            NC1194.2
   000380         038300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1194.2 243 40 416
   000381         038400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1194.2 248 40 416
   000382         038500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1194.2 335 40 416
   000383         038600 END-ROUTINE.                                                     NC1194.2
   000384         038700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1194.2 335 40 416
   000385         038800 END-RTN-EXIT.                                                    NC1194.2
   000386         038900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1194.2 298 40 416
   000387         039000 END-ROUTINE-1.                                                   NC1194.2
   000388         039100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1194.2 257 261 258
   000389         039200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1194.2 261 256 261
   000390         039300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1194.2 259 261
   000391         039400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1194.2
   000392         039500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1194.2 259 321
   000393         039600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1194.2 261 323
   000394         039700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1194.2 320 306
   000395         039800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1194.2 303 40 416
   000396         039900  END-ROUTINE-12.                                                 NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1194.2 309
   000398         040100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1194.2 257 IMP
   000399      1  040200         MOVE "NO " TO ERROR-TOTAL                                NC1194.2 307
   000400         040300         ELSE                                                     NC1194.2
   000401      1  040400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1194.2 257 307
   000402         040500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1194.2 303 40
   000403         040600     PERFORM WRITE-LINE.                                          NC1194.2 416
   000404         040700 END-ROUTINE-13.                                                  NC1194.2
   000405         040800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1194.2 256 IMP
   000406      1  040900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1194.2 307
   000407      1  041000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1194.2 256 307
   000408         041100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1194.2 309
   000409         041200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1194.2 303 40 416
   000410         041300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1194.2 258 IMP
   000411      1  041400          MOVE "NO " TO ERROR-TOTAL                               NC1194.2 307
   000412      1  041500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1194.2 258 307
   000413         041600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1194.2 309
   000414         041700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1194.2 303 40 416
   000415         041800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1194.2 311 40 416
   000416         041900 WRITE-LINE.                                                      NC1194.2
   000417         042000     ADD 1 TO RECORD-COUNT.                                       NC1194.2 263
   000418         042100     IF RECORD-COUNT GREATER 42                                   NC1194.2 263
   000419      1  042200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1194.2 40 262
   000420      1  042300         MOVE SPACE TO DUMMY-RECORD                               NC1194.2 IMP 40
   000421      1  042400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1194.2 40
   000422      1  042500         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1194.2 265 40 432
   000423      1  042600         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1194.2 270 40 432
   000424      1  042700         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1194.2 279 40 432
   000425      1  042800         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1194.2 291 40 432
   000426      1  042900         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1194.2 243 40 432
   000427      1  043000         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1194.2 248 40 432
   000428      1  043100         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1194.2 335 40 432
   000429      1  043200         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1194.2 262 40
   000430      1  043300         MOVE ZERO TO RECORD-COUNT.                               NC1194.2 IMP 263
   000431         043400     PERFORM WRT-LN.                                              NC1194.2 432
   000432         043500 WRT-LN.                                                          NC1194.2
   000433         043600     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1194.2 40
   000434         043700     MOVE SPACE TO DUMMY-RECORD.                                  NC1194.2 IMP 40
   000435         043800 BLANK-LINE-PRINT.                                                NC1194.2
   000436         043900     PERFORM WRT-LN.                                              NC1194.2 432
   000437         044000 FAIL-ROUTINE.                                                    NC1194.2
   000438         044100     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1194.2 218 IMP
   000439      1  044200            GO TO FAIL-ROUTINE-WRITE.                             NC1194.2 446
   000440         044300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1194.2 232 IMP 446
   000441         044400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1194.2 264 334
   000442         044500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1194.2 329
   000443         044600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1194.2 326 40 416
   000444         044700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1194.2 IMP 334
   000445         044800     GO TO  FAIL-ROUTINE-EX.                                      NC1194.2 451
   000446         044900 FAIL-ROUTINE-WRITE.                                              NC1194.2
   000447         045000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1194.2 214 39 416
   000448         045100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1194.2 264 242
   000449         045200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1194.2 229 39 416
   000450         045300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1194.2 IMP 242
   000451         045400 FAIL-ROUTINE-EX. EXIT.                                           NC1194.2
   000452         045500 BAIL-OUT.                                                        NC1194.2
   000453         045600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1194.2 219 IMP 455
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1194.2 233 IMP 460
   000455         045800 BAIL-OUT-WRITE.                                                  NC1194.2
   000456         045900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1194.2 233 333 219 331
   000457         046000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1194.2 264 334
   000458         046100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1194.2 326 40 416
   000459         046200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1194.2 IMP 334
   000460         046300 BAIL-OUT-EX. EXIT.                                               NC1194.2
   000461         046400 CCVS1-EXIT.                                                      NC1194.2
   000462         046500     EXIT.                                                        NC1194.2
   000463         046600 SECT-NC119A-001 SECTION.                                         NC1194.2
   000464         046700 SUB-INIT-GF-1.                                                   NC1194.2
   000465         046800     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000466         046900     PERFORM END-ROUTINE.                                         NC1194.2 383
   000467         047000     MOVE "SUBTRACT" TO FEATURE.                                  NC1194.2 204
   000468         047100     MOVE    1 TO N-5.                                            NC1194.2 147
   000469         047200 SUB-TEST-GF-1-0.                                                 NC1194.2
   000470         047300     SUBTRACT 1 FROM N-5.                                         NC1194.2 147
   000471         047400 SUB-TEST-GF-1-1.                                                 NC1194.2
   000472         047500     IF       N-5 EQUAL TO 0                                      NC1194.2 147
   000473      1  047600              PERFORM PASS                                        NC1194.2 358
   000474      1  047700              GO TO SUB-WRITE-GF-1.                               NC1194.2 483
   000475         047800     GO TO    SUB-FAIL-GF-1.                                      NC1194.2 479
   000476         047900 SUB-DELETE-GF-1.                                                 NC1194.2
   000477         048000     PERFORM  DE-LETE.                                            NC1194.2 360
   000478         048100     GO TO    SUB-WRITE-GF-1.                                     NC1194.2 483
   000479         048200 SUB-FAIL-GF-1.                                                   NC1194.2
   000480         048300     MOVE     N-5 TO COMPUTED-N.                                  NC1194.2 147 220
   000481         048400     MOVE     0 TO CORRECT-N.                                     NC1194.2 234
   000482         048500     PERFORM  FAIL.                                               NC1194.2 359
   000483         048600 SUB-WRITE-GF-1.                                                  NC1194.2
   000484         048700     MOVE "SUB-TEST-GF-1 " TO PAR-NAME.                           NC1194.2 208
   000485         048800     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000486         048900 SUB-INIT-GF-2.                                                   NC1194.2
   000487         049000     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000488         049100     MOVE     A18TWOS-DS-LS-18V00 TO WRK-DS-T-18V00.              NC1194.2 43 60
   000489         049200 SUB-TEST-GF-2-0.                                                 NC1194.2
   000490         049300     SUBTRACT A18ONES-DS-TS-18V00 FROM WRK-DS-T-18V00.            NC1194.2 46 60
   000491         049400 SUB-TEST-GF-2-1.                                                 NC1194.2
   000492         049500     IF       WRK-DS-T-18V00 EQUAL TO 111111111111111111          NC1194.2 60
   000493      1  049600              PERFORM PASS GO TO SUB-WRITE-GF-2.                  NC1194.2 358 502
   000494         049700     GO       TO SUB-FAIL-GF-2.                                   NC1194.2 498
   000495         049800 SUB-DELETE-GF-2.                                                 NC1194.2
   000496         049900     PERFORM  DE-LETE.                                            NC1194.2 360
   000497         050000     GO       TO SUB-WRITE-GF-2.                                  NC1194.2 502
   000498         050100 SUB-FAIL-GF-2.                                                   NC1194.2
   000499         050200     MOVE     WRK-DS-T-18V00    TO COMPUTED-18V0.                 NC1194.2 60 226
   000500         050300     MOVE     111111111111111111 TO CORRECT-18V0.                 NC1194.2 239
   000501         050400     PERFORM  FAIL.                                               NC1194.2 359
   000502         050500 SUB-WRITE-GF-2.                                                  NC1194.2
   000503         050600     MOVE     "SUB-TEST-GF-2" TO PAR-NAME.                        NC1194.2 208
   000504         050700     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000505         050800 SUB-INIT-GF-3.                                                   NC1194.2
   000506         050900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000507         051000     MOVE     A12THREES-DS-06V06 TO WRK-DS-TS-06V06.              NC1194.2 64 66
   000508         051100 SUB-TEST-GF-3-0.                                                 NC1194.2
   000509         051200     SUBTRACT A05ONES-DS-L-05V00                                  NC1194.2 53
   000510         051300              A05ONES-DS-LS-00V05                                 NC1194.2 71
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400              A06ONES-DS-TS-03V03 FROM WRK-DS-TS-06V06.           NC1194.2 87 66
   000512         051500 SUB-TEST-GF-3-1.                                                 NC1194.2
   000513         051600     IF       WRK-DS-TS-06V06 EQUAL TO 322111.111223              NC1194.2 66
   000514      1  051700              PERFORM PASS GO TO SUB-WRITE-GF-3.                  NC1194.2 358 523
   000515         051800     GO       TO SUB-FAIL-GF-3.                                   NC1194.2 519
   000516         051900 SUB-DELETE-GF-3.                                                 NC1194.2
   000517         052000     PERFORM  DE-LETE.                                            NC1194.2 360
   000518         052100     GO       TO SUB-WRITE-GF-3.                                  NC1194.2 523
   000519         052200 SUB-FAIL-GF-3.                                                   NC1194.2
   000520         052300     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1194.2 66 220
   000521         052400     MOVE     322111.111223 TO CORRECT-N.                         NC1194.2 234
   000522         052500     PERFORM  FAIL.                                               NC1194.2 359
   000523         052600 SUB-WRITE-GF-3.                                                  NC1194.2
   000524         052700     MOVE     "SUB-TEST-GF-3" TO PAR-NAME.                        NC1194.2 208
   000525         052800     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000526         052900 SUB-INIT-GF-13.                                                  NC1194.2
   000527         053000     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000528         053100     MOVE     "  GIVING" TO FEATURE.                              NC1194.2 204
   000529         053200     MOVE     ZERO TO WRK-DS-09V09.                               NC1194.2 IMP 59
   000530         053300 SUB-TEST-GF-13-0.                                                NC1194.2
   000531         053400     SUBTRACT A06THREES-DS-03V03 FROM A12THREES-DS-06V06          NC1194.2 62 64
   000532         053500              GIVING WRK-DS-TS-06V06.                             NC1194.2 66
   000533         053600 SUB-TEST-GF-13-1.                                                NC1194.2
   000534         053700     IF       WRK-DS-TS-06V06 EQUAL TO 333000.000333              NC1194.2 66
   000535      1  053800              PERFORM PASS GO TO SUB-WRITE-GF-13.                 NC1194.2 358 544
   000536         053900     GO       TO SUB-FAIL-GF-13.                                  NC1194.2 540
   000537         054000 SUB-DELETE-GF-13.                                                NC1194.2
   000538         054100     PERFORM  DE-LETE.                                            NC1194.2 360
   000539         054200     GO       TO SUB-WRITE-GF-13.                                 NC1194.2 544
   000540         054300 SUB-FAIL-GF-13.                                                  NC1194.2
   000541         054400     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1194.2 66 220
   000542         054500     MOVE     333000.000333 TO CORRECT-N.                         NC1194.2 234
   000543         054600     PERFORM  FAIL.                                               NC1194.2 359
   000544         054700 SUB-WRITE-GF-13.                                                 NC1194.2
   000545         054800     MOVE     "SUB-TEST-GF-13" TO PAR-NAME.                       NC1194.2 208
   000546         054900     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000547         055000 SUB-INIT-GF-14.                                                  NC1194.2
   000548         055100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000549         055200     MOVE     ZERO TO WRK-DS-TS-06V06.                            NC1194.2 IMP 66
   000550         055300 SUB-TEST-GF-14.                                                  NC1194.2
   000551         055400     SUBTRACT A05ONES-DS-L-05V00                                  NC1194.2 53
   000552         055500              A05ONES-DS-LS-00V05                                 NC1194.2 71
   000553         055600              A12THREES-DS-06V06                                  NC1194.2 64
   000554         055700              A06THREES-DS-03V03 FROM ZERO GIVING WRK-DS-TS-06V06.NC1194.2 62 IMP 66
   000555         055800     IF       WRK-DS-TS-06V06 EQUAL TO -344777.777443             NC1194.2 66
   000556      1  055900              PERFORM PASS GO TO SUB-WRITE-GF-14.                 NC1194.2 358 565
   000557         056000     GO       TO SUB-FAIL-GF-14.                                  NC1194.2 561
   000558         056100 SUB-DELETE-GF-14.                                                NC1194.2
   000559         056200     PERFORM  DE-LETE.                                            NC1194.2 360
   000560         056300     GO       TO SUB-WRITE-GF-14.                                 NC1194.2 565
   000561         056400 SUB-FAIL-GF-14.                                                  NC1194.2
   000562         056500     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1194.2 66 220
   000563         056600     MOVE     -344777.777443 TO CORRECT-N.                        NC1194.2 234
   000564         056700     PERFORM  FAIL.                                               NC1194.2 359
   000565         056800 SUB-WRITE-GF-14.                                                 NC1194.2
   000566         056900     MOVE     "SUB-TEST-GF-14" TO PAR-NAME.                       NC1194.2 208
   000567         057000     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100 SUB-INIT-GF-4.                                                   NC1194.2
   000569         057200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000570         057300     MOVE     "  ROUNDED" TO FEATURE.                             NC1194.2 204
   000571         057400     MOVE     ZERO TO WRK-DS-TS-0201P.                            NC1194.2 IMP 101
   000572         057500 SUB-TEST-GF-4-0.                                                 NC1194.2
   000573         057600     SUBTRACT A99-DS-T-02V00 FROM WRK-DS-TS-0201P ROUNDED.        NC1194.2 82 101
   000574         057700 SUB-TEST-GF-4-1.                                                 NC1194.2
   000575         057800     IF       WRK-DS-TS-0201P EQUAL TO -100                       NC1194.2 101
   000576      1  057900              PERFORM PASS GO TO SUB-WRITE-GF-4.                  NC1194.2 358 585
   000577         058000     GO       TO SUB-FAIL-GF-4.                                   NC1194.2 581
   000578         058100 SUB-DELETE-GF-4.                                                 NC1194.2
   000579         058200     PERFORM  DE-LETE.                                            NC1194.2 360
   000580         058300     GO       TO SUB-WRITE-GF-4.                                  NC1194.2 585
   000581         058400 SUB-FAIL-GF-4.                                                   NC1194.2
   000582         058500     MOVE     WRK-DS-TS-0201P TO COMPUTED-N.                      NC1194.2 101 220
   000583         058600     MOVE    -100 TO CORRECT-N.                                   NC1194.2 234
   000584         058700     PERFORM  FAIL.                                               NC1194.2 359
   000585         058800 SUB-WRITE-GF-4.                                                  NC1194.2
   000586         058900     MOVE     "SUB-TEST-GF-4" TO PAR-NAME.                        NC1194.2 208
   000587         059000     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000588         059100 SUB-INIT-GF-15.                                                  NC1194.2
   000589         059200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000590         059300     MOVE     -099999.999999 TO WRK-DS-TS-06V06.                  NC1194.2 66
   000591         059400     MOVE    ZERO TO WRK-DS-06V00.                                NC1194.2 IMP 102
   000592         059500 SUB-TEST-GF-15-0.                                                NC1194.2
   000593         059600     SUBTRACT A05ONES-DS-L-05V00                                  NC1194.2 53
   000594         059700              -11111                                              NC1194.2
   000595         059800              AZERO-DS-LS-05V05 FROM WRK-DS-TS-06V06              NC1194.2 103 66
   000596         059900              GIVING WRK-DS-06V00 ROUNDED.                        NC1194.2 102
   000597         060000 SUB-TEST-GF-15-1.                                                NC1194.2
   000598         060100     IF       WRK-DS-06V00 EQUAL TO -100000                       NC1194.2 102
   000599      1  060200              PERFORM PASS GO TO SUB-WRITE-GF-15.                 NC1194.2 358 608
   000600         060300     GO       TO SUB-FAIL-GF-15.                                  NC1194.2 604
   000601         060400 SUB-DELETE-GF-15.                                                NC1194.2
   000602         060500     PERFORM  DE-LETE.                                            NC1194.2 360
   000603         060600     GO       TO SUB-WRITE-GF-15.                                 NC1194.2 608
   000604         060700 SUB-FAIL-GF-15.                                                  NC1194.2
   000605         060800     MOVE     WRK-DS-06V00 TO COMPUTED-N.                         NC1194.2 102 220
   000606         060900     MOVE    -100000 TO CORRECT-N.                                NC1194.2 234
   000607         061000     PERFORM  FAIL.                                               NC1194.2 359
   000608         061100 SUB-WRITE-GF-15.                                                 NC1194.2
   000609         061200     MOVE     "SUB-TEST-GF-15" TO PAR-NAME.                       NC1194.2 208
   000610         061300     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000611         061400 SUB-INIT-GF-5-1.                                                 NC1194.2
   000612         061500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000613         061600     MOVE     "  SIZE ERROR" TO FEATURE.                          NC1194.2 204
   000614         061700     MOVE     -11 TO WRK-DS-02V00.                                NC1194.2 75
   000615         061800 SUB-TEST-GF-5-1-0.                                               NC1194.2
   000616         061900     SUBTRACT A99-DS-T-02V00 FROM WRK-DS-02V00 ON SIZE ERROR      NC1194.2 82 75
   000617      1  062000              PERFORM PASS GO TO SUB-WRITE-GF-5-1.                NC1194.2 358 625
   000618         062100     GO       TO SUB-FAIL-GF-5-1.                                 NC1194.2 622
   000619         062200 SUB-DELETE-GF-5-1.                                               NC1194.2
   000620         062300     PERFORM  DE-LETE.                                            NC1194.2 360
   000621         062400     GO       TO SUB-WRITE-GF-5-1.                                NC1194.2 625
   000622         062500 SUB-FAIL-GF-5-1.                                                 NC1194.2
   000623         062600     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1194.2 213
   000624         062700     PERFORM  FAIL.                                               NC1194.2 359
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 SUB-WRITE-GF-5-1.                                                NC1194.2
   000626         062900     MOVE     "SUB-TEST-GF-5-1" TO PAR-NAME.                      NC1194.2 208
   000627         063000     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000628         063100 SUB-TEST-GF-5-2.                                                 NC1194.2
   000629         063200     IF       WRK-DS-02V00 EQUAL TO -11                           NC1194.2 75
   000630      1  063300              PERFORM PASS GO TO SUB-WRITE-GF-5-2.                NC1194.2 358 641
   000631         063400*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-GF-5-1   NC1194.2
   000632         063500     GO       TO SUB-FAIL-GF-5-2.                                 NC1194.2 636
   000633         063600 SUB-DELETE-GF-5-2.                                               NC1194.2
   000634         063700     PERFORM  DE-LETE.                                            NC1194.2 360
   000635         063800     GO       TO SUB-WRITE-GF-5-2.                                NC1194.2 641
   000636         063900 SUB-FAIL-GF-5-2.                                                 NC1194.2
   000637         064000     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC1194.2 75 220
   000638         064100     MOVE     -11 TO CORRECT-N.                                   NC1194.2 234
   000639         064200     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1194.2 213
   000640         064300     PERFORM  FAIL.                                               NC1194.2 359
   000641         064400 SUB-WRITE-GF-5-2.                                                NC1194.2
   000642         064500     MOVE     "SUB-TEST-GF-5-2" TO PAR-NAME.                      NC1194.2 208
   000643         064600     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000644         064700 SUB-INIT-GF-16-1.                                                NC1194.2
   000645         064800     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000646         064900     MOVE     ZERO TO WRK-DS-10V00.                               NC1194.2 IMP 49
   000647         065000 SUB-TEST-GF-16-1-0.                                              NC1194.2
   000648         065100     SUBTRACT A12ONES-DS-L-12V00                                  NC1194.2 76
   000649         065200              FROM ZERO GIVING WRK-DS-10V00 ON SIZE ERROR         NC1194.2 IMP 49
   000650      1  065300              PERFORM PASS GO TO SUB-WRITE-GF-16-1.               NC1194.2 358 658
   000651         065400     GO       TO SUB-FAIL-GF-16-1.                                NC1194.2 655
   000652         065500 SUB-DELETE-GF-16-1.                                              NC1194.2
   000653         065600     PERFORM  DE-LETE.                                            NC1194.2 360
   000654         065700     GO       TO SUB-WRITE-GF-16-1.                               NC1194.2 658
   000655         065800 SUB-FAIL-GF-16-1.                                                NC1194.2
   000656         065900     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1194.2 213
   000657         066000     PERFORM  FAIL.                                               NC1194.2 359
   000658         066100 SUB-WRITE-GF-16-1.                                               NC1194.2
   000659         066200     MOVE     "SUB-TEST-GF-16-1" TO PAR-NAME.                     NC1194.2 208
   000660         066300     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000661         066400 SUB-TEST-GF-16-2.                                                NC1194.2
   000662         066500     IF       WRK-DS-10V00 EQUAL TO ZERO                          NC1194.2 49 IMP
   000663      1  066600              PERFORM PASS GO TO SUB-WRITE-GF-16-2.               NC1194.2 358 674
   000664         066700*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-GF-16-1  NC1194.2
   000665         066800     GO       TO SUB-FAIL-GF-16-2.                                NC1194.2 669
   000666         066900 SUB-DELETE-GF-16-2.                                              NC1194.2
   000667         067000     PERFORM  DE-LETE.                                            NC1194.2 360
   000668         067100     GO       TO SUB-WRITE-GF-16-2.                               NC1194.2 674
   000669         067200 SUB-FAIL-GF-16-2.                                                NC1194.2
   000670         067300     MOVE     WRK-DS-10V00 TO COMPUTED-14V4.                      NC1194.2 49 224
   000671         067400     MOVE     ZERO TO CORRECT-14V4.                               NC1194.2 IMP 237
   000672         067500     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1194.2 213
   000673         067600     PERFORM  FAIL.                                               NC1194.2 359
   000674         067700 SUB-WRITE-GF-16-2.                                               NC1194.2
   000675         067800     MOVE     "SUB-TEST-GF-16-2" TO PAR-NAME.                     NC1194.2 208
   000676         067900     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000677         068000 SUB-INIT-GF-17-1.                                                NC1194.2
   000678         068100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000679         068200     MOVE     "  ROUNDED,SIZE ERROR" TO FEATURE.                  NC1194.2 204
   000680         068300     MOVE     ZERO TO WRK-DS-T-05V00.                             NC1194.2 IMP 74
   000681         068400 SUB-TEST-GF-17-1-0.                                              NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     SUBTRACT 33333                                               NC1194.2
   000683         068600              A06THREES-DS-03V03                                  NC1194.2 62
   000684         068700              A12THREES-DS-06V06                                  NC1194.2 64
   000685         068800              FROM WRK-DS-T-05V00 ROUNDED ON SIZE ERROR           NC1194.2 74
   000686      1  068900              PERFORM PASS GO TO SUB-WRITE-GF-17-1.               NC1194.2 358 694
   000687         069000     GO       TO SUB-FAIL-GF-17-1.                                NC1194.2 691
   000688         069100 SUB-DELETE-GF-17-1.                                              NC1194.2
   000689         069200     PERFORM  DE-LETE.                                            NC1194.2 360
   000690         069300     GO       TO SUB-WRITE-GF-17-1.                               NC1194.2 694
   000691         069400 SUB-FAIL-GF-17-1.                                                NC1194.2
   000692         069500     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1194.2 213
   000693         069600     PERFORM  FAIL.                                               NC1194.2 359
   000694         069700 SUB-WRITE-GF-17-1.                                               NC1194.2
   000695         069800     MOVE     "SUB-TEST-GF-17-1" TO PAR-NAME.                     NC1194.2 208
   000696         069900     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000697         070000 SUB-TEST-GF-17-2.                                                NC1194.2
   000698         070100     IF       WRK-DS-T-05V00 EQUAL TO ZERO                        NC1194.2 74 IMP
   000699      1  070200              PERFORM PASS GO TO SUB-WRITE-GF-17-2.               NC1194.2 358 710
   000700         070300*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-GF-17-1  NC1194.2
   000701         070400     GO       TO SUB-FAIL-GF-17-2.                                NC1194.2 705
   000702         070500 SUB-DELETE-GF-17-2.                                              NC1194.2
   000703         070600     PERFORM  DE-LETE.                                            NC1194.2 360
   000704         070700     GO       TO SUB-WRITE-GF-17-2.                               NC1194.2 710
   000705         070800 SUB-FAIL-GF-17-2.                                                NC1194.2
   000706         070900     MOVE     WRK-DS-T-05V00 TO COMPUTED-N.                       NC1194.2 74 220
   000707         071000     MOVE     ZERO TO CORRECT-N.                                  NC1194.2 IMP 234
   000708         071100     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1194.2 213
   000709         071200     PERFORM  FAIL.                                               NC1194.2 359
   000710         071300 SUB-WRITE-GF-17-2.                                               NC1194.2
   000711         071400     MOVE     "SUB-TEST-GF-17-2" TO PAR-NAME.                     NC1194.2 208
   000712         071500     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000713         071600 SUB-INIT-GF-6-1.                                                 NC1194.2
   000714         071700     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000715         071800     MOVE     ZERO TO WRK-DS-TS-06V06.                            NC1194.2 IMP 66
   000716         071900 SUB-TEST-GF-6-1.                                                 NC1194.2
   000717         072000     SUBTRACT A12THREES-DS-06V06                                  NC1194.2 64
   000718         072100              333333                                              NC1194.2
   000719         072200              A06THREES-DS-03V03                                  NC1194.2 62
   000720         072300              -0000009                                            NC1194.2
   000721         072400              FROM WRK-DS-TS-06V06 ROUNDED ON SIZE ERROR          NC1194.2 66
   000722      1  072500              GO TO SUB-FAIL-GF-6-1.                              NC1194.2 728
   000723         072600     PERFORM  PASS.                                               NC1194.2 358
   000724         072700     GO       TO SUB-WRITE-GF-6-1.                                NC1194.2 731
   000725         072800 SUB-DELETE-GF-6-1.                                               NC1194.2
   000726         072900     PERFORM  DE-LETE.                                            NC1194.2 360
   000727         073000     GO       TO SUB-WRITE-GF-6-1.                                NC1194.2 731
   000728         073100 SUB-FAIL-GF-6-1.                                                 NC1194.2
   000729         073200     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1194.2 213
   000730         073300     PERFORM  FAIL.                                               NC1194.2 359
   000731         073400 SUB-WRITE-GF-6-1.                                                NC1194.2
   000732         073500     MOVE     "SUB-TEST-GF-6-1" TO PAR-NAME.                      NC1194.2 208
   000733         073600     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000734         073700 SUB-TEST-GF-6-2.                                                 NC1194.2
   000735         073800     IF       WRK-DS-TS-06V06 EQUAL TO -666990.666333             NC1194.2 66
   000736      1  073900              PERFORM PASS GO TO SUB-WRITE-GF-6-2.                NC1194.2 358 746
   000737         074000*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-GF-6-1   NC1194.2
   000738         074100     GO       TO SUB-FAIL-GF-6-2.                                 NC1194.2 742
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 SUB-DELETE-GF-6-2.                                               NC1194.2
   000740         074300     PERFORM  DE-LETE.                                            NC1194.2 360
   000741         074400     GO       TO SUB-WRITE-GF-6-2.                                NC1194.2 746
   000742         074500 SUB-FAIL-GF-6-2.                                                 NC1194.2
   000743         074600     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1194.2 66 220
   000744         074700     MOVE     -666990.666333 TO CORRECT-N.                        NC1194.2 234
   000745         074800     PERFORM  FAIL.                                               NC1194.2 359
   000746         074900 SUB-WRITE-GF-6-2.                                                NC1194.2
   000747         075000     MOVE     "SUB-TEST-GF-6-2" TO PAR-NAME.                      NC1194.2 208
   000748         075100     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000749         075200 SUB-INIT-GF-18-1.                                                NC1194.2
   000750         075300     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000751         075400     MOVE ZERO TO WRK-DS-T-05V00.                                 NC1194.2 IMP 74
   000752         075500 SUB-TEST-GF-18-1.                                                NC1194.2
   000753         075600     SUBTRACT 33333                                               NC1194.2
   000754         075700              A06THREES-DS-03V03                                  NC1194.2 62
   000755         075800              A12THREES-DS-06V06                                  NC1194.2 64
   000756         075900              FROM -1000000 GIVING WRK-DS-T-05V00                 NC1194.2 74
   000757         076000              ROUNDED ON SIZE ERROR                               NC1194.2
   000758      1  076100              PERFORM PASS GO TO SUB-WRITE-GF-18-1.               NC1194.2 358 766
   000759         076200     GO       TO SUB-FAIL-GF-18-1.                                NC1194.2 763
   000760         076300 SUB-DELETE-GF-18-1.                                              NC1194.2
   000761         076400     PERFORM  DE-LETE.                                            NC1194.2 360
   000762         076500     GO       TO SUB-WRITE-GF-18-1.                               NC1194.2 766
   000763         076600 SUB-FAIL-GF-18-1.                                                NC1194.2
   000764         076700     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1194.2 213
   000765         076800     PERFORM  FAIL.                                               NC1194.2 359
   000766         076900 SUB-WRITE-GF-18-1.                                               NC1194.2
   000767         077000     MOVE     "SUB-TEST-GF-18-1" TO PAR-NAME.                     NC1194.2 208
   000768         077100     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000769         077200 SUB-TEST-GF-18-2.                                                NC1194.2
   000770         077300     IF       WRK-DS-T-05V00 EQUAL TO ZERO                        NC1194.2 74 IMP
   000771      1  077400              PERFORM PASS GO TO SUB-WRITE-GF-18-2.               NC1194.2 358 782
   000772         077500*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-GF-18-1  NC1194.2
   000773         077600     GO       TO SUB-FAIL-GF-18-2.                                NC1194.2 777
   000774         077700 SUB-DELETE-GF-18-2.                                              NC1194.2
   000775         077800     PERFORM  DE-LETE.                                            NC1194.2 360
   000776         077900     GO       TO SUB-WRITE-GF-18-2.                               NC1194.2 782
   000777         078000 SUB-FAIL-GF-18-2.                                                NC1194.2
   000778         078100     MOVE     WRK-DS-T-05V00 TO COMPUTED-N.                       NC1194.2 74 220
   000779         078200     MOVE     ZERO TO CORRECT-N.                                  NC1194.2 IMP 234
   000780         078300     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1194.2 213
   000781         078400     PERFORM  FAIL.                                               NC1194.2 359
   000782         078500 SUB-WRITE-GF-18-2.                                               NC1194.2
   000783         078600     MOVE     "SUB-TEST-GF-18-2" TO PAR-NAME.                     NC1194.2 208
   000784         078700     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000785         078800 SUB-INIT-GF-19-1.                                                NC1194.2
   000786         078900     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000787         079000     MOVE     ZERO TO WRK-DS-TS-06V06.                            NC1194.2 IMP 66
   000788         079100 SUB-TEST-GF-19-1.                                                NC1194.2
   000789         079200     SUBTRACT A12THREES-DS-06V06                                  NC1194.2 64
   000790         079300              333333                                              NC1194.2
   000791         079400              A06THREES-DS-03V03                                  NC1194.2 62
   000792         079500              -.0000009 FROM 0000000                              NC1194.2
   000793         079600              GIVING WRK-DS-TS-06V06 ROUNDED ON SIZE ERROR        NC1194.2 66
   000794      1  079700              GO TO SUB-FAIL-GF-19-1.                             NC1194.2 800
   000795         079800     PERFORM  PASS.                                               NC1194.2 358
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     GO       TO SUB-WRITE-GF-19-1.                               NC1194.2 803
   000797         080000 SUB-DELETE-GF-19-1.                                              NC1194.2
   000798         080100     PERFORM  DE-LETE.                                            NC1194.2 360
   000799         080200     GO       TO SUB-WRITE-GF-19-1.                               NC1194.2 803
   000800         080300 SUB-FAIL-GF-19-1.                                                NC1194.2
   000801         080400     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1194.2 213
   000802         080500     PERFORM  FAIL.                                               NC1194.2 359
   000803         080600 SUB-WRITE-GF-19-1.                                               NC1194.2
   000804         080700     MOVE     "SUB-TEST-GF-19-1" TO PAR-NAME.                     NC1194.2 208
   000805         080800     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000806         080900 SUB-TEST-GF-19-2.                                                NC1194.2
   000807         081000     IF       WRK-DS-TS-06V06 EQUAL TO -666999.666332             NC1194.2 66
   000808      1  081100              PERFORM PASS GO TO SUB-WRITE-GF-19-2.               NC1194.2 358 818
   000809         081200*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-19-1     NC1194.2
   000810         081300     GO       TO SUB-FAIL-GF-19-2.                                NC1194.2 814
   000811         081400 SUB-DELETE-GF-19-2.                                              NC1194.2
   000812         081500     PERFORM  DE-LETE.                                            NC1194.2 360
   000813         081600     GO       TO SUB-WRITE-GF-19-2.                               NC1194.2 818
   000814         081700 SUB-FAIL-GF-19-2.                                                NC1194.2
   000815         081800     MOVE     WRK-DS-TS-06V06 TO COMPUTED-N.                      NC1194.2 66 220
   000816         081900     MOVE     -666999.666332 TO CORRECT-N.                        NC1194.2 234
   000817         082000     PERFORM  FAIL.                                               NC1194.2 359
   000818         082100 SUB-WRITE-GF-19-2.                                               NC1194.2
   000819         082200     MOVE     "SUB-TEST-GF-19-2" TO PAR-NAME.                     NC1194.2 208
   000820         082300     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000821         082400 SUB-INIT-GF-20.                                                  NC1194.2
   000822         082500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000823         082600     MOVE     "  SERIES" TO FEATURE.                              NC1194.2 204
   000824         082700     MOVE     ZERO TO WRK-DS-03V10.                               NC1194.2 IMP 79
   000825         082800 SUB-TEST-GF-20.                                                  NC1194.2
   000826         082900     SUBTRACT A99-DS-T-02V00                                      NC1194.2 82
   000827         083000              A03ONES-DS-02V01                                    NC1194.2 85
   000828         083100              A06ONES-DS-TS-03V03                                 NC1194.2 87
   000829         083200              A08TWOS-DS-02V06                                    NC1194.2 90
   000830         083300              -1.1111111                                          NC1194.2
   000831         083400              +.11111111                                          NC1194.2
   000832         083500              A01ONES-DS-LS-P0801 FROM 0000.000000                NC1194.2 92
   000833         083600              GIVING WRK-DS-03V10.                                NC1194.2 79
   000834         083700     IF       WRK-DS-03V10 EQUAL TO -242.4332220110               NC1194.2 79
   000835      1  083800              PERFORM PASS GO TO SUB-WRITE-GF-20.                 NC1194.2 358 844
   000836         083900     GO       TO SUB-FAIL-GF-20.                                  NC1194.2 840
   000837         084000 SUB-DELETE-GF-20.                                                NC1194.2
   000838         084100     PERFORM  DE-LETE.                                            NC1194.2 360
   000839         084200     GO       TO SUB-WRITE-GF-20.                                 NC1194.2 844
   000840         084300 SUB-FAIL-GF-20.                                                  NC1194.2
   000841         084400     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1194.2 79 223
   000842         084500     MOVE     -242.4332220110 TO CORRECT-4V14.                    NC1194.2 236
   000843         084600     PERFORM  FAIL.                                               NC1194.2 359
   000844         084700 SUB-WRITE-GF-20.                                                 NC1194.2
   000845         084800     MOVE     "SUB-TEST-GF-20" TO PAR-NAME.                       NC1194.2 208
   000846         084900     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000847         085000 SUB-INIT-GF-21.                                                  NC1194.2
   000848         085100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000849         085200     MOVE     ZERO TO WRK-DS-03V10.                               NC1194.2 IMP 79
   000850         085300 SUB-TEST-GF-21-0.                                                NC1194.2
   000851         085400     SUBTRACT A01ONES-DS-LS-P0801                                 NC1194.2 92
   000852         085500              +.11111111                                          NC1194.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600              -1.1111111                                          NC1194.2
   000854         085700              A08TWOS-DS-02V06                                    NC1194.2 90
   000855         085800              A06ONES-DS-TS-03V03                                 NC1194.2 87
   000856         085900              A03ONES-DS-02V01                                    NC1194.2 85
   000857         086000              A99-DS-T-02V00 FROM 0000.000000 GIVING WRK-DS-03V10.NC1194.2 82 79
   000858         086100 SUB-TEST-GF-21-1.                                                NC1194.2
   000859         086200     IF       WRK-DS-03V10 EQUAL TO -242.4332220110               NC1194.2 79
   000860      1  086300              PERFORM PASS GO TO SUB-WRITE-GF-21.                 NC1194.2 358 869
   000861         086400     GO       TO SUB-FAIL-GF-21.                                  NC1194.2 865
   000862         086500 SUB-DELETE-GF-21.                                                NC1194.2
   000863         086600     PERFORM  DE-LETE.                                            NC1194.2 360
   000864         086700     GO       TO SUB-WRITE-GF-21.                                 NC1194.2 869
   000865         086800 SUB-FAIL-GF-21.                                                  NC1194.2
   000866         086900     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1194.2 79 223
   000867         087000     MOVE     -242.4332220110 TO CORRECT-4V14.                    NC1194.2 236
   000868         087100     PERFORM  FAIL.                                               NC1194.2 359
   000869         087200 SUB-WRITE-GF-21.                                                 NC1194.2
   000870         087300     MOVE     "SUB-TEST-GF-21" TO PAR-NAME.                       NC1194.2 208
   000871         087400     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000872         087500 SUB-INIT-GF-22.                                                  NC1194.2
   000873         087600     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000874         087700     MOVE     ZERO TO WRK-DS-03V10.                               NC1194.2 IMP 79
   000875         087800 SUB-TEST-GF-22-0.                                                NC1194.2
   000876         087900     SUBTRACT A08TWOS-DS-02V06                                    NC1194.2 90
   000877         088000              A99-DS-T-02V00                                      NC1194.2 82
   000878         088100              -1.1111111                                          NC1194.2
   000879         088200              A03ONES-DS-02V01                                    NC1194.2 85
   000880         088300              A01ONES-DS-LS-P0801                                 NC1194.2 92
   000881         088400              +.11111111                                          NC1194.2
   000882         088500              A06ONES-DS-TS-03V03 FROM 0000.000000                NC1194.2 87
   000883         088600              GIVING WRK-DS-03V10.                                NC1194.2 79
   000884         088700 SUB-TEST-GF-22-1.                                                NC1194.2
   000885         088800     IF       WRK-DS-03V10 EQUAL TO -242.4332220110               NC1194.2 79
   000886      1  088900              PERFORM PASS GO TO SUB-WRITE-GF-22.                 NC1194.2 358 895
   000887         089000     GO       TO SUB-FAIL-GF-22.                                  NC1194.2 891
   000888         089100 SUB-DELETE-GF-22.                                                NC1194.2
   000889         089200     PERFORM  DE-LETE.                                            NC1194.2 360
   000890         089300     GO       TO SUB-WRITE-GF-22.                                 NC1194.2 895
   000891         089400 SUB-FAIL-GF-22.                                                  NC1194.2
   000892         089500     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1194.2 79 223
   000893         089600     MOVE     -242.4332220110 TO CORRECT-4V14.                    NC1194.2 236
   000894         089700     PERFORM  FAIL.                                               NC1194.2 359
   000895         089800 SUB-WRITE-GF-22.                                                 NC1194.2
   000896         089900     MOVE     "SUB-TEST-GF-22" TO PAR-NAME.                       NC1194.2 208
   000897         090000     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000898         090100 SUB-INIT-GF-7.                                                   NC1194.2
   000899         090200     MOVE     "  COMP VS. DISPLAY" TO FEATURE.                    NC1194.2 204
   000900         090300     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000901         090400     MOVE     ZERO TO WRK-CS-18V00.                               NC1194.2 IMP 95
   000902         090500 SUB-TEST-GF-7-0.                                                 NC1194.2
   000903         090600     SUBTRACT A18ONES-DS-TS-18V00 FROM WRK-CS-18V00.              NC1194.2 46 95
   000904         090700 SUB-TEST-GF-7-1.                                                 NC1194.2
   000905         090800     IF       WRK-CS-18V00 EQUAL TO -111111111111111111           NC1194.2 95
   000906      1  090900              PERFORM PASS GO TO SUB-WRITE-GF-7.                  NC1194.2 358 915
   000907         091000     GO       TO SUB-FAIL-GF-7.                                   NC1194.2 911
   000908         091100 SUB-DELETE-GF-7.                                                 NC1194.2
   000909         091200     PERFORM  DE-LETE.                                            NC1194.2 360
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     GO       TO SUB-WRITE-GF-7.                                  NC1194.2 915
   000911         091400 SUB-FAIL-GF-7.                                                   NC1194.2
   000912         091500     MOVE     WRK-CS-18V00 TO COMPUTED-18V0.                      NC1194.2 95 226
   000913         091600     MOVE     -111111111111111111 TO CORRECT-18V0.                NC1194.2 239
   000914         091700     PERFORM  FAIL.                                               NC1194.2 359
   000915         091800 SUB-WRITE-GF-7.                                                  NC1194.2
   000916         091900     MOVE     "SUB-TEST-GF-7" TO PAR-NAME.                        NC1194.2 208
   000917         092000     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000918         092100 SUB-INIT-GF-8.                                                   NC1194.2
   000919         092200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000920         092300     MOVE     ZERO TO WRK-DS-T-18V00.                             NC1194.2 IMP 60
   000921         092400 SUB-TEST-GF-8-0.                                                 NC1194.2
   000922         092500     SUBTRACT A18ONES-CS-18V00 FROM WRK-DS-T-18V00.               NC1194.2 96 60
   000923         092600 SUB-TEST-GF-8-1.                                                 NC1194.2
   000924         092700     IF       WRK-DS-T-18V00 EQUAL TO -111111111111111111         NC1194.2 60
   000925      1  092800              PERFORM PASS GO TO SUB-WRITE-GF-8.                  NC1194.2 358 934
   000926         092900     GO       TO SUB-FAIL-GF-8.                                   NC1194.2 930
   000927         093000 SUB-DELETE-GF-8.                                                 NC1194.2
   000928         093100     PERFORM  DE-LETE.                                            NC1194.2 360
   000929         093200     GO       TO SUB-WRITE-GF-8.                                  NC1194.2 934
   000930         093300 SUB-FAIL-GF-8.                                                   NC1194.2
   000931         093400     MOVE     WRK-DS-T-18V00 TO COMPUTED-18V0.                    NC1194.2 60 226
   000932         093500     MOVE     -111111111111111111 TO CORRECT-18V0.                NC1194.2 239
   000933         093600     PERFORM  FAIL.                                               NC1194.2 359
   000934         093700 SUB-WRITE-GF-8.                                                  NC1194.2
   000935         093800     MOVE     "SUB-TEST-GF-8" TO PAR-NAME.                        NC1194.2 208
   000936         093900     PERFORM  PRINT-DETAIL.                                       NC1194.2 362
   000937         094000 SUB-INIT-GF-9.                                                   NC1194.2
   000938         094100     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000939         094200     MOVE    1 TO SUBTR-1.                                        NC1194.2 134
   000940         094300     MOVE   -1 TO SUBTR-3.                                        NC1194.2 136
   000941         094400     MOVE   99 TO SUBTR-7.                                        NC1194.2 140
   000942         094500 SUB-TEST-GF-9-0.                                                 NC1194.2
   000943         094600     SUBTRACT SUBTR-1 SUBTR-3 FROM SUBTR-7.                       NC1194.2 134 136 140
   000944         094700 SUB-TEST-GF-9-1.                                                 NC1194.2
   000945         094800     IF       SUBTR-7 EQUAL TO 99                                 NC1194.2 140
   000946      1  094900              PERFORM PASS GO TO SUB-WRITE-GF-9.                  NC1194.2 358 955
   000947         095000     GO       TO SUB-FAIL-GF-9.                                   NC1194.2 951
   000948         095100 SUB-DELETE-GF-9.                                                 NC1194.2
   000949         095200     PERFORM DE-LETE.                                             NC1194.2 360
   000950         095300     GO       TO SUB-WRITE-GF-9.                                  NC1194.2 955
   000951         095400 SUB-FAIL-GF-9.                                                   NC1194.2
   000952         095500     MOVE     SUBTR-7 TO COMPUTED-N.                              NC1194.2 140 220
   000953         095600     MOVE     99        TO CORRECT-N.                             NC1194.2 234
   000954         095700     PERFORM FAIL.                                                NC1194.2 359
   000955         095800 SUB-WRITE-GF-9.                                                  NC1194.2
   000956         095900     MOVE     "SUB-TEST-GF-9" TO PAR-NAME.                        NC1194.2 208
   000957         096000     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   000958         096100 SUB-INIT-GF-10.                                                  NC1194.2
   000959         096200     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000960         096300     MOVE  100 TO SUBTR-5.                                        NC1194.2 138
   000961         096400     MOVE   -1 TO SUBTR-3.                                        NC1194.2 136
   000962         096500     MOVE  100 TO SUBTR-10.                                       NC1194.2 142
   000963         096600 SUB-TEST-GF-10-0.                                                NC1194.2
   000964         096700     SUBTRACT SUBTR-5 -98 SUBTR-3 -1 FROM SUBTR-10.               NC1194.2 138 136 142
   000965         096800 SUB-TEST-GF-10-1.                                                NC1194.2
   000966         096900     IF       SUBTR-10 EQUAL TO 100                               NC1194.2 142
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097000              PERFORM PASS GO TO SUB-WRITE-GF-10.                 NC1194.2 358 976
   000968         097100     GO       TO SUB-FAIL-GF-10.                                  NC1194.2 972
   000969         097200 SUB-DELETE-GF-10.                                                NC1194.2
   000970         097300     PERFORM DE-LETE.                                             NC1194.2 360
   000971         097400     GO       TO SUB-WRITE-GF-10.                                 NC1194.2 976
   000972         097500 SUB-FAIL-GF-10.                                                  NC1194.2
   000973         097600     MOVE     SUBTR-10  TO COMPUTED-N.                            NC1194.2 142 220
   000974         097700     MOVE     100       TO CORRECT-N.                             NC1194.2 234
   000975         097800     PERFORM FAIL.                                                NC1194.2 359
   000976         097900 SUB-WRITE-GF-10.                                                 NC1194.2
   000977         098000     MOVE     "SUB-TEST-GF-10" TO PAR-NAME.                       NC1194.2 208
   000978         098100     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   000979         098200 SUB-INIT-GF-23.                                                  NC1194.2
   000980         098300     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   000981         098400     MOVE  100 TO SUBTR-5.                                        NC1194.2 138
   000982         098500     MOVE .001 TO SUBTR-4.                                        NC1194.2 137
   000983         098600     MOVE   99 TO SUBTR-2.                                        NC1194.2 135
   000984         098700     MOVE    0 TO SUBTR-11.                                       NC1194.2 143
   000985         098800 SUB-TEST-GF-23-0.                                                NC1194.2
   000986         098900     SUBTRACT SUBTR-4 SUBTR-5 .499 FROM SUBTR-2 GIVING SUBTR-11.  NC1194.2 137 138 135 143
   000987         099000 SUB-TEST-GF-23-1.                                                NC1194.2
   000988         099100     IF       SUBTR-11 EQUAL TO -1.5                              NC1194.2 143
   000989      1  099200              PERFORM PASS GO TO SUB-WRITE-GF-23.                 NC1194.2 358 998
   000990         099300     GO       TO SUB-FAIL-GF-23.                                  NC1194.2 994
   000991         099400 SUB-DELETE-GF-23.                                                NC1194.2
   000992         099500     PERFORM DE-LETE.                                             NC1194.2 360
   000993         099600     GO       TO SUB-WRITE-GF-23.                                 NC1194.2 998
   000994         099700 SUB-FAIL-GF-23.                                                  NC1194.2
   000995         099800     MOVE     SUBTR-11  TO COMPUTED-N.                            NC1194.2 143 220
   000996         099900     MOVE     -1.5      TO CORRECT-N.                             NC1194.2 234
   000997         100000     PERFORM FAIL.                                                NC1194.2 359
   000998         100100 SUB-WRITE-GF-23.                                                 NC1194.2
   000999         100200     MOVE     "SUB-TEST-GF-23" TO PAR-NAME.                       NC1194.2 208
   001000         100300     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001001         100400 SUB-INIT-GF-11.                                                  NC1194.2
   001002         100500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   001003         100600     MOVE    1 TO SUBTR-6.                                        NC1194.2 139
   001004         100700     MOVE .001 TO SUBTR-4.                                        NC1194.2 137
   001005         100800 SUB-TEST-GF-11-0.                                                NC1194.2
   001006         100900     SUBTRACT SUBTR-4 FROM SUBTR-6 ROUNDED.                       NC1194.2 137 139
   001007         101000 SUB-TEST-GF-11-1.                                                NC1194.2
   001008         101100     IF       SUBTR-6 EQUAL TO 1                                  NC1194.2 139
   001009      1  101200              PERFORM PASS GO TO SUB-WRITE-GF-11.                 NC1194.2 358 1018
   001010         101300     GO       TO SUB-FAIL-GF-11.                                  NC1194.2 1014
   001011         101400 SUB-DELETE-GF-11.                                                NC1194.2
   001012         101500     PERFORM DE-LETE.                                             NC1194.2 360
   001013         101600     GO       TO SUB-WRITE-GF-11.                                 NC1194.2 1018
   001014         101700 SUB-FAIL-GF-11.                                                  NC1194.2
   001015         101800     MOVE     SUBTR-6   TO COMPUTED-N.                            NC1194.2 139 220
   001016         101900     MOVE     1         TO CORRECT-N.                             NC1194.2 234
   001017         102000     PERFORM FAIL.                                                NC1194.2 359
   001018         102100 SUB-WRITE-GF-11.                                                 NC1194.2
   001019         102200     MOVE     "SUB-TEST-GF-11" TO PAR-NAME.                       NC1194.2 208
   001020         102300     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001021         102400 SUB-INIT-GF-12.                                                  NC1194.2
   001022         102500     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   001023         102600     MOVE -9.99 TO SUBTR-8.                                       NC1194.2 141
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700 SUB-TEST-GF-12-0.                                                NC1194.2
   001025         102800     SUBTRACT .01 FROM SUBTR-8 ON SIZE ERROR                      NC1194.2 141
   001026      1  102900              PERFORM PASS GO TO SUB-WRITE-GF-12-1.               NC1194.2 358 1034
   001027         103000     GO       TO SUB-FAIL-GF-12-1.                                NC1194.2 1031
   001028         103100 SUB-DELETE-GF-12-1.                                              NC1194.2
   001029         103200     PERFORM DE-LETE.                                             NC1194.2 360
   001030         103300     GO       TO SUB-WRITE-GF-12-1.                               NC1194.2 1034
   001031         103400 SUB-FAIL-GF-12-1.                                                NC1194.2
   001032         103500     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1194.2 213
   001033         103600     PERFORM FAIL.                                                NC1194.2 359
   001034         103700 SUB-WRITE-GF-12-1.                                               NC1194.2
   001035         103800     MOVE     "SUB-TEST-GF-12-1" TO PAR-NAME.                     NC1194.2 208
   001036         103900     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001037         104000 SUB-TEST-GF-12-2.                                                NC1194.2
   001038         104100     IF       SUBTR-8 EQUAL TO -9.99                              NC1194.2 141
   001039      1  104200              PERFORM PASS GO TO SUB-WRITE-GF-12-2.               NC1194.2 358 1050
   001040         104300*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-GF-12-1  NC1194.2
   001041         104400     GO       TO SUB-FAIL-GF-12-2.                                NC1194.2 1045
   001042         104500 SUB-DELETE-GF-12-2.                                              NC1194.2
   001043         104600     PERFORM DE-LETE.                                             NC1194.2 360
   001044         104700     GO       TO SUB-WRITE-GF-12-2.                               NC1194.2 1050
   001045         104800 SUB-FAIL-GF-12-2.                                                NC1194.2
   001046         104900     MOVE     SUBTR-8   TO COMPUTED-N.                            NC1194.2 141 220
   001047         105000     MOVE     -9.99     TO CORRECT-N.                             NC1194.2 234
   001048         105100     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1194.2 213
   001049         105200     PERFORM FAIL.                                                NC1194.2 359
   001050         105300 SUB-WRITE-GF-12-2.                                               NC1194.2
   001051         105400     MOVE     "SUB-TEST-GF-12-2" TO PAR-NAME.                     NC1194.2 208
   001052         105500     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001053         105600 SUB-INIT-GF-24.                                                  NC1194.2
   001054         105700     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   001055         105800     MOVE    1  TO SUBTR-1.                                       NC1194.2 134
   001056         105900     MOVE   -1  TO SUBTR-3.                                       NC1194.2 136
   001057         106000     MOVE  100  TO SUBTR-5.                                       NC1194.2 138
   001058         106100     MOVE   99  TO SUBTR-7.                                       NC1194.2 140
   001059         106200 SUB-TEST-GF-24-1.                                                NC1194.2
   001060         106300     SUBTRACT SUBTR-1 SUBTR-3 FROM SUBTR-5 GIVING SUBTR-7 ON      NC1194.2 134 136 138 140
   001061         106400              SIZE ERROR                                          NC1194.2
   001062      1  106500              PERFORM PASS GO TO SUB-WRITE-GF-24-1.               NC1194.2 358 1070
   001063         106600     GO       TO SUB-FAIL-GF-24-1.                                NC1194.2 1067
   001064         106700 SUB-DELETE-GF-24-1.                                              NC1194.2
   001065         106800     PERFORM DE-LETE.                                             NC1194.2 360
   001066         106900     GO       TO SUB-WRITE-GF-24-1.                               NC1194.2 1070
   001067         107000 SUB-FAIL-GF-24-1.                                                NC1194.2
   001068         107100     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1194.2 213
   001069         107200     PERFORM FAIL.                                                NC1194.2 359
   001070         107300 SUB-WRITE-GF-24-1.                                               NC1194.2
   001071         107400     MOVE     "SUB-TEST-GF-24-1" TO PAR-NAME.                     NC1194.2 208
   001072         107500     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001073         107600 SUB-TEST-GF-24-2.                                                NC1194.2
   001074         107700     IF       SUBTR-7 EQUAL  TO 99                                NC1194.2 140
   001075      1  107800              PERFORM PASS GO TO SUB-WRITE-GF-24-2.               NC1194.2 358 1086
   001076         107900*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-GF-24-1  NC1194.2
   001077         108000     GO       TO SUB-FAIL-GF-24-2.                                NC1194.2 1081
   001078         108100 SUB-DELETE-GF-24-2.                                              NC1194.2
   001079         108200     PERFORM DE-LETE.                                             NC1194.2 360
   001080         108300     GO       TO SUB-WRITE-GF-24-2.                               NC1194.2 1086
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400 SUB-FAIL-GF-24-2.                                                NC1194.2
   001082         108500     MOVE     SUBTR-7   TO COMPUTED-N.                            NC1194.2 140 220
   001083         108600     MOVE      99       TO CORRECT-N.                             NC1194.2 234
   001084         108700     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1194.2 213
   001085         108800     PERFORM FAIL.                                                NC1194.2 359
   001086         108900 SUB-WRITE-GF-24-2.                                               NC1194.2
   001087         109000     MOVE     "SUB-TEST-GF-24-2" TO PAR-NAME.                     NC1194.2 208
   001088         109100     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001089         109200 SUB-INIT-GF-25.                                                  NC1194.2
   001090         109300     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   001091         109400     MOVE    -999999999999999999 TO MINUS-NAME1.                  NC1194.2 190
   001092         109500     MOVE    -999999999999999999 TO MINUS-NAME2.                  NC1194.2 191
   001093         109600     MOVE    +999999999999999999 TO PLUS-NAME1.                   NC1194.2 193
   001094         109700     MOVE    +999999999999999999 TO PLUS-NAME1.                   NC1194.2 193
   001095         109800     MOVE     +1 TO EVEN-NAME1.                                   NC1194.2 192
   001096         109900     MOVE    0 TO WHOLE-FIELD.                                    NC1194.2 200
   001097         110000     MOVE SPACE TO SIZE-ERR.                                      NC1194.2 IMP 42
   001098         110100 SUB-TEST-GF-25-0.                                                NC1194.2
   001099         110200     SUBTRACT MINUS-NAME1  MINUS-NAME2  -34  -1  PLUS-NAME1       NC1194.2 190 191 193
   001100         110300         PLUS-NAME2  EVEN-NAME1  35 FROM EVEN-NAME1 GIVING        NC1194.2 194 192 192
   001101         110400         WHOLE-FIELD                                              NC1194.2 200
   001102      1  110500         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1194.2 42
   001103         110600 SUB-TEST-GF-25-1.                                                NC1194.2
   001104         110700     IF WHOLE-FIELD EQUAL TO 0                                    NC1194.2 200
   001105      1  110800         PERFORM PASS                                             NC1194.2 358
   001106      1  110900         GO TO SUB-WRITE-GF-25-1.                                 NC1194.2 1113
   001107         111000     MOVE WHOLE-FIELD TO COMPUTED-18V0.                           NC1194.2 200 226
   001108         111100     MOVE 0 TO CORRECT-18V0.                                      NC1194.2 239
   001109         111200     PERFORM FAIL.                                                NC1194.2 359
   001110         111300     GO TO SUB-WRITE-GF-25-1.                                     NC1194.2 1113
   001111         111400 SUB-DELETE-GF-25-1.                                              NC1194.2
   001112         111500     PERFORM DE-LETE.                                             NC1194.2 360
   001113         111600 SUB-WRITE-GF-25-1.                                               NC1194.2
   001114         111700     MOVE "SUB-TEST-GF-25-1" TO PAR-NAME.                         NC1194.2 208
   001115         111800     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001116         111900 SUB-TEST-GF-25-2.                                                NC1194.2
   001117         112000     IF SIZE-ERR EQUAL TO "1"                                     NC1194.2 42
   001118      1  112100         PERFORM FAIL                                             NC1194.2 359
   001119      1  112200         MOVE SPACE TO CORRECT-A                                  NC1194.2 IMP 233
   001120      1  112300         MOVE 1 TO COMPUTED-A                                     NC1194.2 219
   001121      1  112400         MOVE "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK      NC1194.2 213
   001122      1  112500         GO TO SUB-WRITE-GF-25-2.                                 NC1194.2 1127
   001123         112600     PERFORM PASS.                                                NC1194.2 358
   001124         112700     GO TO SUB-WRITE-GF-25-2.                                     NC1194.2 1127
   001125         112800 SUB-DELETE-GF-25-2.                                              NC1194.2
   001126         112900     PERFORM DE-LETE.                                             NC1194.2 360
   001127         113000 SUB-WRITE-GF-25-2.                                               NC1194.2
   001128         113100     MOVE "SUB-TEST-GF-25-2" TO PAR-NAME.                         NC1194.2 208
   001129         113200     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001130         113300 SUB-INIT-GF-26.                                                  NC1194.2
   001131         113400     MOVE   "VI-42 5.12.4" TO ANSI-REFERENCE.                     NC1194.2 264
   001132         113500     MOVE SPACE TO SIZE-ERR.                                      NC1194.2 IMP 42
   001133         113600     MOVE   -.999999999999999999 TO MINUS-NAME3.                  NC1194.2 195
   001134         113700     MOVE   -.999999999999999999 TO MINUS-NAME4.                  NC1194.2 196
   001135         113800     MOVE   +.999999999999999999 TO PLUS-NAME3.                   NC1194.2 198
   001136         113900     MOVE   +.999999999999999999 TO PLUS-NAME4.                   NC1194.2 199
   001137         114000     MOVE   +1 TO EVEN-NAME2.                                     NC1194.2 197
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100     MOVE    0 TO DECMAL-FIELD.                                   NC1194.2 201
   001139         114200 SUB-TEST-GF-26-0.                                                NC1194.2
   001140         114300     SUBTRACT MINUS-NAME3  MINUS-NAME4  -.34  -.01  PLUS-NAME3    NC1194.2 195 196 198
   001141         114400         PLUS-NAME4  EVEN-NAME2  .35 FROM EVEN-NAME2              NC1194.2 199 197 197
   001142         114500         GIVING DECMAL-FIELD                                      NC1194.2 201
   001143      1  114600         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1194.2 42
   001144         114700 SUB-TEST-GF-26-1.                                                NC1194.2
   001145         114800     IF DECMAL-FIELD EQUAL TO .0                                  NC1194.2 201
   001146      1  114900         PERFORM PASS                                             NC1194.2 358
   001147      1  115000         GO TO SUB-WRITE-GF-26-1.                                 NC1194.2 1154
   001148         115100     MOVE DECMAL-FIELD TO COMPUTED-0V18.                          NC1194.2 201 222
   001149         115200     MOVE .0 TO CORRECT-0V18.                                     NC1194.2 235
   001150         115300     PERFORM FAIL.                                                NC1194.2 359
   001151         115400     GO TO SUB-WRITE-GF-26-1.                                     NC1194.2 1154
   001152         115500 SUB-DELETE-GF-26-1.                                              NC1194.2
   001153         115600     PERFORM DE-LETE.                                             NC1194.2 360
   001154         115700 SUB-WRITE-GF-26-1.                                               NC1194.2
   001155         115800     MOVE "SUB-TEST-GF-26-1" TO PAR-NAME.                         NC1194.2 208
   001156         115900     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001157         116000 SUB-TEST-GF-26-2.                                                NC1194.2
   001158         116100     IF SIZE-ERR EQUAL TO "1"                                     NC1194.2 42
   001159      1  116200         PERFORM FAIL                                             NC1194.2 359
   001160      1  116300         MOVE SPACE TO CORRECT-A                                  NC1194.2 IMP 233
   001161      1  116400         MOVE 1 TO COMPUTED-A                                     NC1194.2 219
   001162      1  116500         MOVE "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK      NC1194.2 213
   001163      1  116600         GO TO SUB-WRITE-GF-26-2.                                 NC1194.2 1168
   001164         116700     PERFORM PASS.                                                NC1194.2 358
   001165         116800     GO TO SUB-WRITE-GF-26-2.                                     NC1194.2 1168
   001166         116900 SUB-DELETE-GF-26-2.                                              NC1194.2
   001167         117000     PERFORM DE-LETE.                                             NC1194.2 360
   001168         117100 SUB-WRITE-GF-26-2.                                               NC1194.2
   001169         117200     MOVE "SUB-TEST-GF-26-2" TO PAR-NAME.                         NC1194.2 208
   001170         117300     PERFORM PRINT-DETAIL.                                        NC1194.2 362
   001171         117400 CCVS-EXIT SECTION.                                               NC1194.2
   001172         117500 CCVS-999999.                                                     NC1194.2
   001173         117600     GO TO CLOSE-FILES.                                           NC1194.2 351
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    24
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      111   ADD-12
      112   ADD-13
      113   ADD-14
      264   ANSI-REFERENCE . . . . . . . .  441 448 457 M465 M487 M506 M527 M548 M569 M589 M612 M645 M678 M714 M750 M786
                                            M822 M848 M873 M900 M919 M938 M959 M980 M1002 M1022 M1054 M1090 M1131
      103   AZERO-DS-LS-05V05. . . . . . .  595
       92   A01ONES-DS-LS-P0801. . . . . .  832 851 880
       56   A02ONES-DS-LS-02V00
       85   A03ONES-DS-02V01 . . . . . . .  827 856 879
       53   A05ONES-DS-L-05V00 . . . . . .  509 551 593
       71   A05ONES-DS-LS-00V05. . . . . .  510 552
       87   A06ONES-DS-TS-03V03. . . . . .  511 828 855 882
       62   A06THREES-DS-03V03 . . . . . .  531 554 683 719 754 791
       90   A08TWOS-DS-02V06 . . . . . . .  829 854 876
       50   A10ONES-DS-T-10V00
       76   A12ONES-DS-L-12V00 . . . . . .  648
      127   A12SEVENS-CU-18V00
      119   A12THREES-CU-18V00
       64   A12THREES-DS-06V06 . . . . . .  507 531 553 684 717 755 789
      117   A14TWOS-CS-18V00
      121   A16FOURS-CS-18V00
      115   A18EIGHTS-CS-18V00
      123   A18FIVES-CS-18V00
       96   A18ONES-CS-18V00 . . . . . . .  922
       46   A18ONES-DS-TS-18V00. . . . . .  490 903
      125   A18SIXES-CS-18V00
      130   A18THREES-CS-18V00
       43   A18TWOS-DS-LS-18V00. . . . . .  488
       99   A99-CS-02V00
       82   A99-DS-T-02V00 . . . . . . . .  573 616 826 857 877
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
      219   COMPUTED-A . . . . . . . . . .  220 222 223 224 225 453 456 M1120 M1161
      220   COMPUTED-N . . . . . . . . . .  M480 M520 M541 M562 M582 M605 M637 M706 M743 M778 M815 M952 M973 M995 M1015 M1046
                                            M1082
      218   COMPUTED-X . . . . . . . . . .  M370 438
      222   COMPUTED-0V18. . . . . . . . .  M1148
      224   COMPUTED-14V4. . . . . . . . .  M670
      226   COMPUTED-18V0. . . . . . . . .  M499 M912 M931 M1107
      223   COMPUTED-4V14. . . . . . . . .  M841 M866 M892
      242   COR-ANSI-REFERENCE . . . . . .  M448 M450
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    25
0 Defined   Cross-reference of data names   References

0     233   CORRECT-A. . . . . . . . . . .  234 235 236 237 238 454 456 M1119 M1160
      234   CORRECT-N. . . . . . . . . . .  M481 M521 M542 M563 M583 M606 M638 M707 M744 M779 M816 M953 M974 M996 M1016 M1047
                                            M1083
      232   CORRECT-X. . . . . . . . . . .  M371 440
      235   CORRECT-0V18 . . . . . . . . .  M1149
      237   CORRECT-14V4 . . . . . . . . .  M671
      239   CORRECT-18V0 . . . . . . . . .  M500 M913 M932 M1108
      236   CORRECT-4V14 . . . . . . . . .  M842 M867 M893
      238   CR-18V0
      201   DECMAL-FIELD . . . . . . . . .  M1138 M1142 1145 1148
      256   DELETE-COUNTER . . . . . . . .  M360 389 405 407
      211   DOTVALUE . . . . . . . . . . .  M365
      262   DUMMY-HOLD . . . . . . . . . .  M419 429
       40   DUMMY-RECORD . . . . . . . . .  M375 M376 M377 M378 M380 M381 M382 M384 M386 M395 M402 M409 M414 M415 419 M420
                                            421 M422 M423 M424 M425 M426 M427 M428 M429 433 M434 M443 M458
      309   ENDER-DESC . . . . . . . . . .  M397 M408 M413
      257   ERROR-COUNTER. . . . . . . . .  M359 388 398 401
      261   ERROR-HOLD . . . . . . . . . .  M388 M389 M389 M390 393
      307   ERROR-TOTAL. . . . . . . . . .  M399 M401 M406 M407 M411 M412
      192   EVEN-NAME1 . . . . . . . . . .  M1095 1100 1100
      197   EVEN-NAME2 . . . . . . . . . .  M1137 1141 1141
      204   FEATURE. . . . . . . . . . . .  M467 M528 M570 M613 M679 M823 M899
      335   HYPHEN-LINE. . . . . . . . . .  382 384 428
      301   ID-AGAIN . . . . . . . . . . .  M347
      334   INF-ANSI-REFERENCE . . . . . .  M441 M444 M457 M459
      329   INFO-TEXT. . . . . . . . . . .  M442
      258   INSPECT-COUNTER. . . . . . . .  M357 388 410 412
      189   MINUS-NAMES
      190   MINUS-NAME1. . . . . . . . . .  M1091 1099
      191   MINUS-NAME2. . . . . . . . . .  M1092 1099
      195   MINUS-NAME3. . . . . . . . . .  M1133 1140
      196   MINUS-NAME4. . . . . . . . . .  M1134 1140
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    26
0 Defined   Cross-reference of data names   References

0     186   N-43
      187   N-44
      188   N-45
      147   N-5. . . . . . . . . . . . . .  M468 M470 472 480
      150   N-7. . . . . . . . . . . . . .  153
      106   NDATA-DS-09V09
      206   P-OR-F . . . . . . . . . . . .  M357 M358 M359 M360 367 M370
      208   PAR-NAME . . . . . . . . . . .  M372 M484 M503 M524 M545 M566 M586 M609 M626 M642 M659 M675 M695 M711 M732 M747
                                            M767 M783 M804 M819 M845 M870 M896 M916 M935 M956 M977 M999 M1019 M1035 M1051
                                            M1071 M1087 M1114 M1128 M1155 M1169
      210   PARDOT-X . . . . . . . . . . .  M364
      259   PASS-COUNTER . . . . . . . . .  M358 390 392
      193   PLUS-NAME1 . . . . . . . . . .  M1093 M1094 1099
      194   PLUS-NAME2 . . . . . . . . . .  1100
      198   PLUS-NAME3 . . . . . . . . . .  M1135 1140
      199   PLUS-NAME4 . . . . . . . . . .  M1136 1141
       38   PRINT-FILE . . . . . . . . . .  34 346 352
       39   PRINT-REC. . . . . . . . . . .  M366 M447 M449
      213   RE-MARK. . . . . . . . . . . .  M361 M373 M623 M639 M656 M672 M692 M708 M729 M764 M780 M801 M1032 M1048 M1068
                                            M1084 M1121 M1162
      255   REC-CT . . . . . . . . . . . .  363 365 372
      254   REC-SKL-SUB
      263   RECORD-COUNT . . . . . . . . .  M417 418 M430
       42   SIZE-ERR . . . . . . . . . . .  M1097 M1102 1117 M1132 M1143 1158
      134   SUBTR-1. . . . . . . . . . . .  M939 943 M1055 1060
      142   SUBTR-10 . . . . . . . . . . .  M962 M964 966 973
      143   SUBTR-11 . . . . . . . . . . .  M984 M986 988 995
      135   SUBTR-2. . . . . . . . . . . .  M983 986
      136   SUBTR-3. . . . . . . . . . . .  M940 943 M961 964 M1056 1060
      137   SUBTR-4. . . . . . . . . . . .  M982 986 M1004 1006
      138   SUBTR-5. . . . . . . . . . . .  M960 964 M981 986 M1057 1060
      139   SUBTR-6. . . . . . . . . . . .  M1003 M1006 1008 1015
      140   SUBTR-7. . . . . . . . . . . .  M941 M943 945 952 M1058 M1060 1074 1082
      141   SUBTR-8. . . . . . . . . . . .  M1023 M1025 1038 1046
      133   SUBTRACT-DATA
      214   TEST-COMPUTED. . . . . . . . .  447
      229   TEST-CORRECT . . . . . . . . .  449
      282   TEST-ID. . . . . . . . . . . .  M347
      202   TEST-RESULTS . . . . . . . . .  M348 366
      260   TOTAL-ERROR
      185   TRUNC-DATA
      200   WHOLE-FIELD. . . . . . . . . .  M1096 M1101 1104 1107
       98   WRK-CS-02V02
      132   WRK-CS-03V00
       95   WRK-CS-18V00 . . . . . . . . .  M901 M903 905 912
      114   WRK-CU-18V00
       74   WRK-DS-T-05V00 . . . . . . . .  M680 M685 698 706 M751 M756 770 778
       60   WRK-DS-T-18V00 . . . . . . . .  M488 M490 492 499 M920 M922 924 931
      101   WRK-DS-TS-0201P. . . . . . . .  M571 M573 575 582
       66   WRK-DS-TS-06V06. . . . . . . .  68 M507 M511 513 520 M532 534 541 M549 M554 555 562 M590 595 M715 M721 735 743
                                            M787 M793 807 815
       68   WRK-DS-TS-12V00-S
       75   WRK-DS-02V00 . . . . . . . . .  M614 M616 629 637
       79   WRK-DS-03V10 . . . . . . . . .  80 M824 M833 834 841 M849 M857 859 866 M874 M883 885 892
      102   WRK-DS-06V00 . . . . . . . . .  M591 M596 598 605
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    27
0 Defined   Cross-reference of data names   References

0      59   WRK-DS-09V09 . . . . . . . . .  60 M529
       49   WRK-DS-10V00 . . . . . . . . .  M646 M649 662 670
       80   WRK-DS-13V00-S
      129   WRK-DU-18V00
      110   WRK-XN-00018
      153   X-8
      108   XDATA-XN-00018
      331   XXCOMPUTED . . . . . . . . . .  M456
      333   XXCORRECT. . . . . . . . . . .  M456
      326   XXINFO . . . . . . . . . . . .  443 458
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    28
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
     1171   CCVS-EXIT
     1172   CCVS-999999
      344   CCVS1
      461   CCVS1-EXIT . . . . . . . . . .  G350
      351   CLOSE-FILES. . . . . . . . . .  G1173
      379   COLUMN-NAMES-ROUTINE . . . . .  E349
      360   DE-LETE. . . . . . . . . . . .  P477 P496 P517 P538 P559 P579 P602 P620 P634 P653 P667 P689 P703 P726 P740 P761
                                            P775 P798 P812 P838 P863 P889 P909 P928 P949 P970 P992 P1012 P1029 P1043 P1065
                                            P1079 P1112 P1126 P1153 P1167
      383   END-ROUTINE. . . . . . . . . .  P352 P466
      387   END-ROUTINE-1
      396   END-ROUTINE-12
      404   END-ROUTINE-13 . . . . . . . .  E352
      385   END-RTN-EXIT
      359   FAIL . . . . . . . . . . . . .  P482 P501 P522 P543 P564 P584 P607 P624 P640 P657 P673 P693 P709 P730 P745 P765
                                            P781 P802 P817 P843 P868 P894 P914 P933 P954 P975 P997 P1017 P1033 P1049 P1069
                                            P1085 P1109 P1118 P1150 P1159
      437   FAIL-ROUTINE . . . . . . . . .  P368
      451   FAIL-ROUTINE-EX. . . . . . . .  E368 G445
      446   FAIL-ROUTINE-WRITE . . . . . .  G439 G440
      374   HEAD-ROUTINE . . . . . . . . .  P349
      357   INSPT
      345   OPEN-FILES
      358   PASS . . . . . . . . . . . . .  P473 P493 P514 P535 P556 P576 P599 P617 P630 P650 P663 P686 P699 P723 P736 P758
                                            P771 P795 P808 P835 P860 P886 P906 P925 P946 P967 P989 P1009 P1026 P1039 P1062
                                            P1075 P1105 P1123 P1146 P1164
      362   PRINT-DETAIL . . . . . . . . .  P485 P504 P525 P546 P567 P587 P610 P627 P643 P660 P676 P696 P712 P733 P748 P768
                                            P784 P805 P820 P846 P871 P897 P917 P936 P957 P978 P1000 P1020 P1036 P1052 P1072
                                            P1088 P1115 P1129 P1156 P1170
      463   SECT-NC119A-001
      476   SUB-DELETE-GF-1
      969   SUB-DELETE-GF-10
     1011   SUB-DELETE-GF-11
     1028   SUB-DELETE-GF-12-1
     1042   SUB-DELETE-GF-12-2
      537   SUB-DELETE-GF-13
      558   SUB-DELETE-GF-14
      601   SUB-DELETE-GF-15
      652   SUB-DELETE-GF-16-1
      666   SUB-DELETE-GF-16-2
      688   SUB-DELETE-GF-17-1
      702   SUB-DELETE-GF-17-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    29
0 Defined   Cross-reference of procedures   References

0     760   SUB-DELETE-GF-18-1
      774   SUB-DELETE-GF-18-2
      797   SUB-DELETE-GF-19-1
      811   SUB-DELETE-GF-19-2
      495   SUB-DELETE-GF-2
      837   SUB-DELETE-GF-20
      862   SUB-DELETE-GF-21
      888   SUB-DELETE-GF-22
      991   SUB-DELETE-GF-23
     1064   SUB-DELETE-GF-24-1
     1078   SUB-DELETE-GF-24-2
     1111   SUB-DELETE-GF-25-1
     1125   SUB-DELETE-GF-25-2
     1152   SUB-DELETE-GF-26-1
     1166   SUB-DELETE-GF-26-2
      516   SUB-DELETE-GF-3
      578   SUB-DELETE-GF-4
      619   SUB-DELETE-GF-5-1
      633   SUB-DELETE-GF-5-2
      725   SUB-DELETE-GF-6-1
      739   SUB-DELETE-GF-6-2
      908   SUB-DELETE-GF-7
      927   SUB-DELETE-GF-8
      948   SUB-DELETE-GF-9
      479   SUB-FAIL-GF-1. . . . . . . . .  G475
      972   SUB-FAIL-GF-10 . . . . . . . .  G968
     1014   SUB-FAIL-GF-11 . . . . . . . .  G1010
     1031   SUB-FAIL-GF-12-1 . . . . . . .  G1027
     1045   SUB-FAIL-GF-12-2 . . . . . . .  G1041
      540   SUB-FAIL-GF-13 . . . . . . . .  G536
      561   SUB-FAIL-GF-14 . . . . . . . .  G557
      604   SUB-FAIL-GF-15 . . . . . . . .  G600
      655   SUB-FAIL-GF-16-1 . . . . . . .  G651
      669   SUB-FAIL-GF-16-2 . . . . . . .  G665
      691   SUB-FAIL-GF-17-1 . . . . . . .  G687
      705   SUB-FAIL-GF-17-2 . . . . . . .  G701
      763   SUB-FAIL-GF-18-1 . . . . . . .  G759
      777   SUB-FAIL-GF-18-2 . . . . . . .  G773
      800   SUB-FAIL-GF-19-1 . . . . . . .  G794
      814   SUB-FAIL-GF-19-2 . . . . . . .  G810
      498   SUB-FAIL-GF-2. . . . . . . . .  G494
      840   SUB-FAIL-GF-20 . . . . . . . .  G836
      865   SUB-FAIL-GF-21 . . . . . . . .  G861
      891   SUB-FAIL-GF-22 . . . . . . . .  G887
      994   SUB-FAIL-GF-23 . . . . . . . .  G990
     1067   SUB-FAIL-GF-24-1 . . . . . . .  G1063
     1081   SUB-FAIL-GF-24-2 . . . . . . .  G1077
      519   SUB-FAIL-GF-3. . . . . . . . .  G515
      581   SUB-FAIL-GF-4. . . . . . . . .  G577
      622   SUB-FAIL-GF-5-1. . . . . . . .  G618
      636   SUB-FAIL-GF-5-2. . . . . . . .  G632
      728   SUB-FAIL-GF-6-1. . . . . . . .  G722
      742   SUB-FAIL-GF-6-2. . . . . . . .  G738
      911   SUB-FAIL-GF-7. . . . . . . . .  G907
      930   SUB-FAIL-GF-8. . . . . . . . .  G926
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    30
0 Defined   Cross-reference of procedures   References

0     951   SUB-FAIL-GF-9. . . . . . . . .  G947
      464   SUB-INIT-GF-1
      958   SUB-INIT-GF-10
     1001   SUB-INIT-GF-11
     1021   SUB-INIT-GF-12
      526   SUB-INIT-GF-13
      547   SUB-INIT-GF-14
      588   SUB-INIT-GF-15
      644   SUB-INIT-GF-16-1
      677   SUB-INIT-GF-17-1
      749   SUB-INIT-GF-18-1
      785   SUB-INIT-GF-19-1
      486   SUB-INIT-GF-2
      821   SUB-INIT-GF-20
      847   SUB-INIT-GF-21
      872   SUB-INIT-GF-22
      979   SUB-INIT-GF-23
     1053   SUB-INIT-GF-24
     1089   SUB-INIT-GF-25
     1130   SUB-INIT-GF-26
      505   SUB-INIT-GF-3
      568   SUB-INIT-GF-4
      611   SUB-INIT-GF-5-1
      713   SUB-INIT-GF-6-1
      898   SUB-INIT-GF-7
      918   SUB-INIT-GF-8
      937   SUB-INIT-GF-9
      469   SUB-TEST-GF-1-0
      471   SUB-TEST-GF-1-1
      963   SUB-TEST-GF-10-0
      965   SUB-TEST-GF-10-1
     1005   SUB-TEST-GF-11-0
     1007   SUB-TEST-GF-11-1
     1024   SUB-TEST-GF-12-0
     1037   SUB-TEST-GF-12-2
      530   SUB-TEST-GF-13-0
      533   SUB-TEST-GF-13-1
      550   SUB-TEST-GF-14
      592   SUB-TEST-GF-15-0
      597   SUB-TEST-GF-15-1
      647   SUB-TEST-GF-16-1-0
      661   SUB-TEST-GF-16-2
      681   SUB-TEST-GF-17-1-0
      697   SUB-TEST-GF-17-2
      752   SUB-TEST-GF-18-1
      769   SUB-TEST-GF-18-2
      788   SUB-TEST-GF-19-1
      806   SUB-TEST-GF-19-2
      489   SUB-TEST-GF-2-0
      491   SUB-TEST-GF-2-1
      825   SUB-TEST-GF-20
      850   SUB-TEST-GF-21-0
      858   SUB-TEST-GF-21-1
      875   SUB-TEST-GF-22-0
      884   SUB-TEST-GF-22-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    31
0 Defined   Cross-reference of procedures   References

0     985   SUB-TEST-GF-23-0
      987   SUB-TEST-GF-23-1
     1059   SUB-TEST-GF-24-1
     1073   SUB-TEST-GF-24-2
     1098   SUB-TEST-GF-25-0
     1103   SUB-TEST-GF-25-1
     1116   SUB-TEST-GF-25-2
     1139   SUB-TEST-GF-26-0
     1144   SUB-TEST-GF-26-1
     1157   SUB-TEST-GF-26-2
      508   SUB-TEST-GF-3-0
      512   SUB-TEST-GF-3-1
      572   SUB-TEST-GF-4-0
      574   SUB-TEST-GF-4-1
      615   SUB-TEST-GF-5-1-0
      628   SUB-TEST-GF-5-2
      716   SUB-TEST-GF-6-1
      734   SUB-TEST-GF-6-2
      902   SUB-TEST-GF-7-0
      904   SUB-TEST-GF-7-1
      921   SUB-TEST-GF-8-0
      923   SUB-TEST-GF-8-1
      942   SUB-TEST-GF-9-0
      944   SUB-TEST-GF-9-1
      483   SUB-WRITE-GF-1 . . . . . . . .  G474 G478
      976   SUB-WRITE-GF-10. . . . . . . .  G967 G971
     1018   SUB-WRITE-GF-11. . . . . . . .  G1009 G1013
     1034   SUB-WRITE-GF-12-1. . . . . . .  G1026 G1030
     1050   SUB-WRITE-GF-12-2. . . . . . .  G1039 G1044
      544   SUB-WRITE-GF-13. . . . . . . .  G535 G539
      565   SUB-WRITE-GF-14. . . . . . . .  G556 G560
      608   SUB-WRITE-GF-15. . . . . . . .  G599 G603
      658   SUB-WRITE-GF-16-1. . . . . . .  G650 G654
      674   SUB-WRITE-GF-16-2. . . . . . .  G663 G668
      694   SUB-WRITE-GF-17-1. . . . . . .  G686 G690
      710   SUB-WRITE-GF-17-2. . . . . . .  G699 G704
      766   SUB-WRITE-GF-18-1. . . . . . .  G758 G762
      782   SUB-WRITE-GF-18-2. . . . . . .  G771 G776
      803   SUB-WRITE-GF-19-1. . . . . . .  G796 G799
      818   SUB-WRITE-GF-19-2. . . . . . .  G808 G813
      502   SUB-WRITE-GF-2 . . . . . . . .  G493 G497
      844   SUB-WRITE-GF-20. . . . . . . .  G835 G839
      869   SUB-WRITE-GF-21. . . . . . . .  G860 G864
      895   SUB-WRITE-GF-22. . . . . . . .  G886 G890
      998   SUB-WRITE-GF-23. . . . . . . .  G989 G993
     1070   SUB-WRITE-GF-24-1. . . . . . .  G1062 G1066
     1086   SUB-WRITE-GF-24-2. . . . . . .  G1075 G1080
     1113   SUB-WRITE-GF-25-1. . . . . . .  G1106 G1110
     1127   SUB-WRITE-GF-25-2. . . . . . .  G1122 G1124
     1154   SUB-WRITE-GF-26-1. . . . . . .  G1147 G1151
     1168   SUB-WRITE-GF-26-2. . . . . . .  G1163 G1165
      523   SUB-WRITE-GF-3 . . . . . . . .  G514 G518
      585   SUB-WRITE-GF-4 . . . . . . . .  G576 G580
      625   SUB-WRITE-GF-5-1 . . . . . . .  G617 G621
      641   SUB-WRITE-GF-5-2 . . . . . . .  G630 G635
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    32
0 Defined   Cross-reference of procedures   References

0     731   SUB-WRITE-GF-6-1 . . . . . . .  G724 G727
      746   SUB-WRITE-GF-6-2 . . . . . . .  G736 G741
      915   SUB-WRITE-GF-7 . . . . . . . .  G906 G910
      934   SUB-WRITE-GF-8 . . . . . . . .  G925 G929
      955   SUB-WRITE-GF-9 . . . . . . . .  G946 G950
      355   TERMINATE-CALL
      353   TERMINATE-CCVS
      416   WRITE-LINE . . . . . . . . . .  P366 P367 P375 P376 P377 P378 P380 P381 P382 P384 P386 P395 P403 P409 P414 P415
                                            P443 P447 P449 P458
      432   WRT-LN . . . . . . . . . . . .  P422 P423 P424 P425 P426 P427 P428 P431 P436
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    33
0 Defined   Cross-reference of programs     References

        3   NC119A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC119A    Date 06/04/2022  Time 11:59:27   Page    34
0LineID  Message code  Message text

     38  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC119A:
 *    Source records = 1173
 *    Data Division statements = 165
 *    Procedure Division statements = 632
 *    Generated COBOL statements = 0
 *    Program complexity factor = 650
0End of compilation 1,  program NC119A,  highest severity 0.
0Return code 0
