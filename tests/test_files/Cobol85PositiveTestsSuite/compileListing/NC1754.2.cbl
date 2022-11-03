1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:45   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:45   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1754.2
   000002         000200 PROGRAM-ID.                                                      NC1754.2
   000003         000300     NC175A.                                                      NC1754.2
   000004         000500*                                                              *  NC1754.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1754.2
   000006         000700*                                                              *  NC1754.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1754.2
   000008         000900*                                                              *  NC1754.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1754.2
   000010         001100*                                                              *  NC1754.2
   000011         001300*                                                              *  NC1754.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1754.2
   000013         001500*                                                              *  NC1754.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1754.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1754.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1754.2
   000017         001900*                                                              *  NC1754.2
   000018         002100*                                                                 NC1754.2
   000019         002200*    PROGRAM NC175A TESTS FORMAT 2 OF THE SUBTRACT                NC1754.2
   000020         002300*    STATEMENT.  VARIOUS COMBINATINS OF DATA-ITEMS AND ALL        NC1754.2
   000021         002400*    OPTIONAL PHRASES ARE TESTED.                                 NC1754.2
   000022         002500*                                                                 NC1754.2
   000023         002600                                                                  NC1754.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1754.2
   000025         002800 CONFIGURATION SECTION.                                           NC1754.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1754.2
   000027         003000     XXXXX082.                                                    NC1754.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1754.2
   000029         003200     XXXXX083.                                                    NC1754.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1754.2
   000031         003400 FILE-CONTROL.                                                    NC1754.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1754.2 36
   000033         003600     XXXXX055.                                                    NC1754.2
   000034         003700 DATA DIVISION.                                                   NC1754.2
   000035         003800 FILE SECTION.                                                    NC1754.2
   000036         003900 FD  PRINT-FILE.                                                  NC1754.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1754.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1754.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1754.2
   000040         004300 01  WRK-XN-00001 PIC X.                                          NC1754.2
   000041         004400 01  WRK-DU-0V1-1 PIC V9.                                         NC1754.2
   000042         004500 01  WRK-DU-2V0-1 PIC 99.                                         NC1754.2
   000043         004600 01  WRK-DU-2V0-2 PIC 99.                                         NC1754.2
   000044         004700 01  WRK-DU-2V0-3 PIC 99.                                         NC1754.2
   000045         004800 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1754.2
   000046         004900 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1754.2
   000047         005000 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1754.2
   000048         005100 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1754.2
   000049         005200 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1754.2
   000050         005300 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1754.2
   000051         005400 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1754.2
   000052         005500 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1754.2
   000053         005600 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1754.2
   000054         005700 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1754.2
   000056         005900 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1754.2
   000057         006000 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1754.2
   000058         006100 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1754.2
   000059         006200 01  WRK-NE-X-1 PIC 9(16).99.                                     NC1754.2
   000060         006300 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1754.2
   000061         006400 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1754.2
   000062         006500 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1754.2 IMP
   000063         006600 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1754.2 IMP
   000064         006700 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1754.2 IMP
   000065         006800 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1754.2 IMP
   000066         006900 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1754.2
   000067         007000 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1754.2
   000068         007100 01  WRK-NE-X-2 PIC -9(16).99.                                    NC1754.2
   000069         007200 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC1754.2
   000070         007300 01  WRK-NE-2 PIC $**.99.                                         NC1754.2
   000071         007400 01  WRK-NE-3 PIC $99.99CR.                                       NC1754.2
   000072         007500 01  WRK-NE-4 PIC $*9.99 VALUE ZERO.                              NC1754.2 IMP
   000073         007600 01  WRK-NE-5 PIC $.** VALUE ZERO.                                NC1754.2 IMP
   000074         007700 01  WRK-NE-6 PIC $**.**CR VALUE ZERO.                            NC1754.2 IMP
   000075         007800 01  WRK-NE-7 PIC $*9.99DB VALUE ZERO.                            NC1754.2 IMP
   000076         007900 77  SIZE-ERR                     PICTURE X  VALUE SPACE.         NC1754.2 IMP
   000077         008000 77  SIZE-ERR2                    PICTURE X  VALUE SPACE.         NC1754.2 IMP
   000078         008100 77  SIZE-ERR3                    PICTURE X  VALUE SPACE.         NC1754.2 IMP
   000079         008200 77  SIZE-ERR4                    PICTURE X  VALUE SPACE.         NC1754.2 IMP
   000080         008300 77  A16TWOS-DS-16V00             PICTURE S9(16)                  NC1754.2
   000081         008400                                  VALUE 2222222222222222.         NC1754.2
   000082         008500 77  A18ONES-DS-18V00             PICTURE S9(18)                  NC1754.2
   000083         008600                                  VALUE 111111111111111111.       NC1754.2
   000084         008700 77  WRK-DS-10V00                 PICTURE S9(10).                 NC1754.2
   000085         008800 77  A10ONES-DS-10V00             PICTURE S9(10)                  NC1754.2
   000086         008900                                  VALUE 1111111111.               NC1754.2
   000087         009000 77  A05ONES-DS-05V00             PICTURE S9(5)                   NC1754.2
   000088         009100                                  VALUE 11111.                    NC1754.2
   000089         009200 77  A02ONES-DS-02V00             PICTURE S99                     NC1754.2
   000090         009300                                  VALUE 11.                       NC1754.2
   000091         009400 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1754.2
   000092         009500 77  WRK-DS-18V00 REDEFINES WRK-DS-09V09                          NC1754.2 91
   000093         009600                                  PICTURE S9(18).                 NC1754.2
   000094         009700 77  A06THREES-DS-03V03           PICTURE S999V999                NC1754.2
   000095         009800                                  VALUE 333.333.                  NC1754.2
   000096         009900 77  A12THREES-DS-06V06           PICTURE S9(6)V9(6)              NC1754.2
   000097         010000                                  VALUE 333333.333333.            NC1754.2
   000098         010100 77  WRK-DS-06V06                 PICTURE S9(6)V9(6).             NC1754.2
   000099         010200 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06                        NC1754.2 98
   000100         010300                                  PICTURE S9(12).                 NC1754.2
   000101         010400 77  A05ONES-DS-00V05             PICTURE SV9(5)                  NC1754.2
   000102         010500                                  VALUE .11111.                   NC1754.2
   000103         010600 77  WRK-DS-05V00                 PICTURE S9(5).                  NC1754.2
   000104         010700 77  WRK-DS-02V00                 PICTURE S99.                    NC1754.2
   000105         010800 77  A12ONES-DS-12V00             PICTURE S9(12)                  NC1754.2
   000106         010900                                  VALUE 111111111111.             NC1754.2
   000107         011000 77  WRK-DS-03V10                 PICTURE S999V9(10).             NC1754.2
   000108         011100 77  WRK-DS-13V00-S REDEFINES WRK-DS-03V10                        NC1754.2 107
   000109         011200                                  PICTURE S9(13).                 NC1754.2
   000110         011300 77  A99-DS-02V00                 PICTURE S99                     NC1754.2
   000111         011400                                  VALUE 99.                       NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 77  A03ONES-DS-02V01             PICTURE S99V9                   NC1754.2
   000113         011600                                  VALUE 11.1.                     NC1754.2
   000114         011700 77  A06ONES-DS-03V03             PICTURE S999V999                NC1754.2
   000115         011800                                  VALUE 111.111.                  NC1754.2
   000116         011900 77  A08TWOS-DS-02V06             PICTURE S99V9(6)                NC1754.2
   000117         012000                                  VALUE 22.222222.                NC1754.2
   000118         012100 77  A01ONE-DS-P0801              PICTURE SP(8)9                  NC1754.2
   000119         012200                                  VALUE .000000001.               NC1754.2
   000120         012300 77  WRK-CS-18V00                 PICTURE S9(18) COMPUTATIONAL.   NC1754.2
   000121         012400 77  A18ONES-CS-18V00             PICTURE S9(18) COMPUTATIONAL    NC1754.2
   000122         012500                                  VALUE 111111111111111111.       NC1754.2
   000123         012600 77  WRK-CS-02V02                 PICTURE S99V99 COMPUTATIONAL.   NC1754.2
   000124         012700 77  A99-CS-02V00                 PICTURE S99 COMPUTATIONAL       NC1754.2
   000125         012800                                  VALUE 99.                       NC1754.2
   000126         012900 77  WRK-DS-0201P                 PICTURE S99P.                   NC1754.2
   000127         013000 77  WRK-DS-06V00                 PICTURE S9(6).                  NC1754.2
   000128         013100 77  AZERO-DS-05V05               PICTURE S9(5)V9(5)              NC1754.2
   000129         013200                                  VALUE ZERO.                     NC1754.2 IMP
   000130         013300 77  NDATA-DS-09V09               PICTURE S9(9)V9(9)              NC1754.2
   000131         013400                                  VALUE +012345678.876543210.     NC1754.2
   000132         013500 77  XDATA-XN-00018               PICTURE X(18)                   NC1754.2
   000133         013600                                  VALUE "00ABCDEFGHI  4321 ".     NC1754.2
   000134         013700 77  WRK-XN-00018                 PICTURE X(18).                  NC1754.2
   000135         013800 77  ADD-12    PICTURE PP9        VALUE .001.                     NC1754.2
   000136         013900 77  ADD-13    PICTURE 9PP        VALUE 100.                      NC1754.2
   000137         014000 77  ADD-14    PICTURE 999V999.                                   NC1754.2
   000138         014100 77  WRK-CU-18V00      PICTURE 9(18) VALUE ZERO COMPUTATIONAL.    NC1754.2 IMP
   000139         014200 77  A18EIGHTS-CS-18V00 PICTURE S9(18) VALUE -888888888888888888  NC1754.2
   000140         014300             COMPUTATIONAL.                                       NC1754.2
   000141         014400 77  A14TWOS-CS-18V00  PICTURE S9(18) VALUE -000022222222222222   NC1754.2
   000142         014500             COMPUTATIONAL.                                       NC1754.2
   000143         014600 77  A12THREES-CU-18V00 PICTURE 9(18) VALUE 000000333333333333    NC1754.2
   000144         014700             COMPUTATIONAL.                                       NC1754.2
   000145         014800 77  A16FOURS-CS-18V00 PICTURE S9(18) VALUE 004444444444444444    NC1754.2
   000146         014900             COMPUTATIONAL.                                       NC1754.2
   000147         015000 77  A18FIVES-CS-18V00 PICTURE S9(18) VALUE -555555555555555555   NC1754.2
   000148         015100             COMPUTATIONAL.                                       NC1754.2
   000149         015200 77  A18SIXES-CS-18V00 PICTURE S9(18) VALUE 666666666666666666    NC1754.2
   000150         015300             COMPUTATIONAL.                                       NC1754.2
   000151         015400 77  A12SEVENS-CU-18V00 PICTURE 9(18) VALUE 000000777777777777    NC1754.2
   000152         015500             COMPUTATIONAL.                                       NC1754.2
   000153         015600 77  WRK-DU-18V00      PICTURE 9(18) VALUE ZERO.                  NC1754.2 IMP
   000154         015700 77  A18THREES-CS-18V00 PICTURE S9(18) VALUE -333333333333333333  NC1754.2
   000155         015800             COMPUTATIONAL.                                       NC1754.2
   000156         015900 77  WRK-CS-03V00 PICTURE S999 COMPUTATIONAL SYNCHRONIZED RIGHT.  NC1754.2
   000157         016000 01  SUBTRACT-DATA.                                               NC1754.2
   000158         016100     02  SUBTR-1    PICTURE 9         VALUE 1.                    NC1754.2
   000159         016200     02  SUBTR-2    PICTURE S99       VALUE 99.                   NC1754.2
   000160         016300     02  SUBTR-3    PICTURE S9V99     VALUE -1.                   NC1754.2
   000161         016400     02  SUBTR-4    PICTURE SPP9      VALUE .001.                 NC1754.2
   000162         016500     02  SUBTR-5    PICTURE S9PP      VALUE 100.                  NC1754.2
   000163         016600     02  SUBTR-6    PICTURE 9  VALUE 1.                           NC1754.2
   000164         016700     02  SUBTR-7    PICTURE S99  VALUE 99.                        NC1754.2
   000165         016800     02  SUBTR-8    PICTURE S9V99  VALUE -9.99.                   NC1754.2
   000166         016900     02  SUBTR-10    PICTURE S999  VALUE 100.                     NC1754.2
   000167         017000     02  SUBTR-11   PICTURE S999V999.                             NC1754.2
   000168         017100 01  N-3                                PICTURE IS 99999.         NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  N-4                                PICTURE IS 9(5)           NC1754.2
   000170         017300     VALUE IS 52800.                                              NC1754.2
   000171         017400 01  N-5                                PICTURE IS S9(9)V99       NC1754.2
   000172         017500     VALUE IS 000000001.00.                                       NC1754.2
   000173         017600 01  N-7                                PICTURE IS S9(7)V9(4)     NC1754.2
   000174         017700     VALUE IS 0000001.0000.                                       NC1754.2
   000175         017800 01  X-8 REDEFINES N-7                  PICTURE IS X(11).         NC1754.2 173
   000176         017900 01  N-10                               PICTURE IS S99999V        NC1754.2
   000177         018000     VALUE IS -00001.                                             NC1754.2
   000178         018100 01  N-11                               PICTURE IS 9 VALUE IS 9.  NC1754.2
   000179         018200 01  N-12                               PICTURE IS 9 VALUE IS 9.  NC1754.2
   000180         018300 01  N-13                               PICTURE IS 9(5)           NC1754.2
   000181         018400     VALUE IS 99999.                                              NC1754.2
   000182         018500 01  N-14                               PICTURE IS 9 VALUE IS 1.  NC1754.2
   000183         018600 01  N-15                               PICTURE IS 9(16).         NC1754.2
   000184         018700 01  N-16                               PICTURE IS S999999V99     NC1754.2
   000185         018800     VALUE IS 5.90.                                               NC1754.2
   000186         018900 01  N-17                               PICTURE IS S9(3)V99       NC1754.2
   000187         019000     VALUE IS +3.6.                                               NC1754.2
   000188         019100 01  N-18                               PICTURE IS S9(10)         NC1754.2
   000189         019200     VALUE IS -5.                                                 NC1754.2
   000190         019300 01  N-19                               PICTURE IS $9.00.         NC1754.2
   000191         019400 01  N-20                               PICTURE IS S9(9)          NC1754.2
   000192         019500     VALUE IS -999999999.                                         NC1754.2
   000193         019600 01  N-21                               PICTURE IS 9 VALUE IS 5.  NC1754.2
   000194         019700 01  N-22                               PICTURE IS 999V99         NC1754.2
   000195         019800     VALUE IS 005.55.                                             NC1754.2
   000196         019900 01  N-23                               PICTURE IS $$$.99CR.      NC1754.2
   000197         020000 01  N-25                               PICTURE IS 9 VALUE IS 1.  NC1754.2
   000198         020100 01  N-26               PICTURE 9(5).                             NC1754.2
   000199         020200 01  N-27                               PICTURE IS 9999V9         NC1754.2
   000200         020300     VALUE IS 9999.9.                                             NC1754.2
   000201         020400 01  N-28                               PICTURE IS $9999.00.      NC1754.2
   000202         020500 01  N-40                               PICTURE IS 9(7)           NC1754.2
   000203         020600     VALUE IS 7777777.                                            NC1754.2
   000204         020700 01  N-41                               PICTURE IS 9(7)           NC1754.2
   000205         020800     VALUE IS 1111111.                                            NC1754.2
   000206         020900 01  N-42                               PICTURE IS 9(3)P(4).      NC1754.2
   000207         021000 01  TRUNC-DATA.                                                  NC1754.2
   000208         021100     02 N-43  PICTURE S9V9 VALUE +1.6.                            NC1754.2
   000209         021200     02 N-44  PICTURE S9V9 VALUE -1.6.                            NC1754.2
   000210         021300     02 N-45  PICTURE S9.                                         NC1754.2
   000211         021400 01  MINUS-NAMES.                                                 NC1754.2
   000212         021500     02  MINUS-NAME1 PICTURE S9(18) VALUE -999999999999999999.    NC1754.2
   000213         021600     02  MINUS-NAME2 PICTURE S9(18) VALUE -999999999999999999.    NC1754.2
   000214         021700     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC1754.2
   000215         021800     02  PLUS-NAME1  PICTURE S9(18) VALUE +999999999999999999.    NC1754.2
   000216         021900     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC1754.2
   000217         022000     02  MINUS-NAME3 PICTURE SV9(18) VALUE -.999999999999999999.  NC1754.2
   000218         022100     02  MINUS-NAME4 PICTURE SV9(18) VALUE -.999999999999999999.  NC1754.2
   000219         022200     02  EVEN-NAME2  PICTURE SV9(18)  VALUE +.1.                  NC1754.2
   000220         022300     02  PLUS-NAME3  PICTURE SV9(18) VALUE +.999999999999999999.  NC1754.2
   000221         022400     02  PLUS-NAME4  PICTURE SV9(18) VALUE +.999999999999999999.  NC1754.2
   000222         022500     02  WHOLE-FIELD   PICTURE S9(18).                            NC1754.2
   000223         022600     02  DECMAL-FIELD  PICTURE SV9(18).                           NC1754.2
   000224         022700 01  TEST-RESULTS.                                                NC1754.2
   000225         022800     02 FILLER                   PIC X      VALUE SPACE.          NC1754.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1754.2 IMP
   000227         023000     02 FILLER                   PIC X      VALUE SPACE.          NC1754.2 IMP
   000228         023100     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1754.2 IMP
   000229         023200     02 FILLER                   PIC X      VALUE SPACE.          NC1754.2 IMP
   000230         023300     02  PAR-NAME.                                                NC1754.2
   000231         023400       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1754.2 IMP
   000232         023500       03  PARDOT-X              PIC X      VALUE SPACE.          NC1754.2 IMP
   000233         023600       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1754.2 IMP
   000234         023700     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1754.2 IMP
   000235         023800     02 RE-MARK                  PIC X(61).                       NC1754.2
   000236         023900 01  TEST-COMPUTED.                                               NC1754.2
   000237         024000     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1754.2 IMP
   000238         024100     02 FILLER                   PIC X(17)  VALUE                 NC1754.2
   000239         024200            "       COMPUTED=".                                   NC1754.2
   000240         024300     02 COMPUTED-X.                                               NC1754.2
   000241         024400     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1754.2 IMP
   000242         024500     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1754.2 241
   000243         024600                                 PIC -9(9).9(9).                  NC1754.2
   000244         024700     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1754.2 241
   000245         024800     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1754.2 241
   000246         024900     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1754.2 241
   000247         025000     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1754.2 241
   000248         025100         04 COMPUTED-18V0                    PIC -9(18).          NC1754.2
   000249         025200         04 FILLER                           PIC X.               NC1754.2
   000250         025300     03 FILLER PIC X(50) VALUE SPACE.                             NC1754.2 IMP
   000251         025400 01  TEST-CORRECT.                                                NC1754.2
   000252         025500     02 FILLER PIC X(30) VALUE SPACE.                             NC1754.2 IMP
   000253         025600     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1754.2
   000254         025700     02 CORRECT-X.                                                NC1754.2
   000255         025800     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1754.2 IMP
   000256         025900     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1754.2 255
   000257         026000     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1754.2 255
   000258         026100     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1754.2 255
   000259         026200     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1754.2 255
   000260         026300     03      CR-18V0 REDEFINES CORRECT-A.                         NC1754.2 255
   000261         026400         04 CORRECT-18V0                     PIC -9(18).          NC1754.2
   000262         026500         04 FILLER                           PIC X.               NC1754.2
   000263         026600     03 FILLER PIC X(2) VALUE SPACE.                              NC1754.2 IMP
   000264         026700     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1754.2 IMP
   000265         026800 01  CCVS-C-1.                                                    NC1754.2
   000266         026900     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1754.2
   000267         027000-    "SS  PARAGRAPH-NAME                                          NC1754.2
   000268         027100-    "       REMARKS".                                            NC1754.2
   000269         027200     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1754.2 IMP
   000270         027300 01  CCVS-C-2.                                                    NC1754.2
   000271         027400     02 FILLER                     PIC X        VALUE SPACE.      NC1754.2 IMP
   000272         027500     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1754.2
   000273         027600     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1754.2 IMP
   000274         027700     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1754.2
   000275         027800     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1754.2 IMP
   000276         027900 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1754.2 IMP
   000277         028000 01  REC-CT                        PIC 99       VALUE ZERO.       NC1754.2 IMP
   000278         028100 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1754.2 IMP
   000279         028200 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1754.2 IMP
   000280         028300 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1754.2 IMP
   000281         028400 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1754.2 IMP
   000282         028500 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1754.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1754.2 IMP
   000284         028700 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1754.2 IMP
   000285         028800 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1754.2 IMP
   000286         028900 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1754.2 IMP
   000287         029000 01  CCVS-H-1.                                                    NC1754.2
   000288         029100     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1754.2 IMP
   000289         029200     02  FILLER                    PIC X(42)    VALUE             NC1754.2
   000290         029300     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1754.2
   000291         029400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1754.2 IMP
   000292         029500 01  CCVS-H-2A.                                                   NC1754.2
   000293         029600   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1754.2 IMP
   000294         029700   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1754.2
   000295         029800   02  FILLER                        PIC XXXX   VALUE             NC1754.2
   000296         029900     "4.2 ".                                                      NC1754.2
   000297         030000   02  FILLER                        PIC X(28)  VALUE             NC1754.2
   000298         030100            " COPY - NOT FOR DISTRIBUTION".                       NC1754.2
   000299         030200   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1754.2 IMP
   000300         030300                                                                  NC1754.2
   000301         030400 01  CCVS-H-2B.                                                   NC1754.2
   000302         030500   02  FILLER                        PIC X(15)  VALUE             NC1754.2
   000303         030600            "TEST RESULT OF ".                                    NC1754.2
   000304         030700   02  TEST-ID                       PIC X(9).                    NC1754.2
   000305         030800   02  FILLER                        PIC X(4)   VALUE             NC1754.2
   000306         030900            " IN ".                                               NC1754.2
   000307         031000   02  FILLER                        PIC X(12)  VALUE             NC1754.2
   000308         031100     " HIGH       ".                                              NC1754.2
   000309         031200   02  FILLER                        PIC X(22)  VALUE             NC1754.2
   000310         031300            " LEVEL VALIDATION FOR ".                             NC1754.2
   000311         031400   02  FILLER                        PIC X(58)  VALUE             NC1754.2
   000312         031500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1754.2
   000313         031600 01  CCVS-H-3.                                                    NC1754.2
   000314         031700     02  FILLER                      PIC X(34)  VALUE             NC1754.2
   000315         031800            " FOR OFFICIAL USE ONLY    ".                         NC1754.2
   000316         031900     02  FILLER                      PIC X(58)  VALUE             NC1754.2
   000317         032000     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1754.2
   000318         032100     02  FILLER                      PIC X(28)  VALUE             NC1754.2
   000319         032200            "  COPYRIGHT   1985 ".                                NC1754.2
   000320         032300 01  CCVS-E-1.                                                    NC1754.2
   000321         032400     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1754.2 IMP
   000322         032500     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1754.2
   000323         032600     02 ID-AGAIN                     PIC X(9).                    NC1754.2
   000324         032700     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1754.2 IMP
   000325         032800 01  CCVS-E-2.                                                    NC1754.2
   000326         032900     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1754.2 IMP
   000327         033000     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1754.2 IMP
   000328         033100     02 CCVS-E-2-2.                                               NC1754.2
   000329         033200         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1754.2 IMP
   000330         033300         03 FILLER                   PIC X      VALUE SPACE.      NC1754.2 IMP
   000331         033400         03 ENDER-DESC               PIC X(44)  VALUE             NC1754.2
   000332         033500            "ERRORS ENCOUNTERED".                                 NC1754.2
   000333         033600 01  CCVS-E-3.                                                    NC1754.2
   000334         033700     02  FILLER                      PIC X(22)  VALUE             NC1754.2
   000335         033800            " FOR OFFICIAL USE ONLY".                             NC1754.2
   000336         033900     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1754.2 IMP
   000337         034000     02  FILLER                      PIC X(58)  VALUE             NC1754.2
   000338         034100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1754.2
   000339         034200     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1754.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     02 FILLER                       PIC X(15)  VALUE             NC1754.2
   000341         034400             " COPYRIGHT 1985".                                   NC1754.2
   000342         034500 01  CCVS-E-4.                                                    NC1754.2
   000343         034600     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1754.2 IMP
   000344         034700     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1754.2
   000345         034800     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1754.2 IMP
   000346         034900     02 FILLER                       PIC X(40)  VALUE             NC1754.2
   000347         035000      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1754.2
   000348         035100 01  XXINFO.                                                      NC1754.2
   000349         035200     02 FILLER                       PIC X(19)  VALUE             NC1754.2
   000350         035300            "*** INFORMATION ***".                                NC1754.2
   000351         035400     02 INFO-TEXT.                                                NC1754.2
   000352         035500       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1754.2 IMP
   000353         035600       04 XXCOMPUTED                 PIC X(20).                   NC1754.2
   000354         035700       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1754.2 IMP
   000355         035800       04 XXCORRECT                  PIC X(20).                   NC1754.2
   000356         035900     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1754.2
   000357         036000 01  HYPHEN-LINE.                                                 NC1754.2
   000358         036100     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1754.2 IMP
   000359         036200     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1754.2
   000360         036300-    "*****************************************".                 NC1754.2
   000361         036400     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1754.2
   000362         036500-    "******************************".                            NC1754.2
   000363         036600 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1754.2
   000364         036700     "NC175A".                                                    NC1754.2
   000365         036800 PROCEDURE DIVISION.                                              NC1754.2
   000366         036900 CCVS1 SECTION.                                                   NC1754.2
   000367         037000 OPEN-FILES.                                                      NC1754.2
   000368         037100     OPEN     OUTPUT PRINT-FILE.                                  NC1754.2 36
   000369         037200     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1754.2 363 304 363 323
   000370         037300     MOVE    SPACE TO TEST-RESULTS.                               NC1754.2 IMP 224
   000371         037400     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1754.2 396 401
   000372         037500     GO TO CCVS1-EXIT.                                            NC1754.2 483
   000373         037600 CLOSE-FILES.                                                     NC1754.2
   000374         037700     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1754.2 405 426 36
   000375         037800 TERMINATE-CCVS.                                                  NC1754.2
   000376         037900     EXIT PROGRAM.                                                NC1754.2
   000377         038000 TERMINATE-CALL.                                                  NC1754.2
   000378         038100     STOP     RUN.                                                NC1754.2
   000379         038200 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1754.2 228 280
   000380         038300 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1754.2 228 281
   000381         038400 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1754.2 228 279
   000382         038500 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1754.2 228 278
   000383         038600     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1754.2 235
   000384         038700 PRINT-DETAIL.                                                    NC1754.2
   000385         038800     IF REC-CT NOT EQUAL TO ZERO                                  NC1754.2 277 IMP
   000386      1  038900             MOVE "." TO PARDOT-X                                 NC1754.2 232
   000387      1  039000             MOVE REC-CT TO DOTVALUE.                             NC1754.2 277 233
   000388         039100     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1754.2 224 37 438
   000389         039200     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1754.2 228 438
   000390      1  039300        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1754.2 459 473
   000391      1  039400          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1754.2 474 482
   000392         039500     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1754.2 IMP 228 IMP 240
   000393         039600     MOVE SPACE TO CORRECT-X.                                     NC1754.2 IMP 254
   000394         039700     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1754.2 277 IMP IMP 230
   000395         039800     MOVE     SPACE TO RE-MARK.                                   NC1754.2 IMP 235
   000396         039900 HEAD-ROUTINE.                                                    NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1754.2 287 38 438
   000398         040100     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1754.2 292 38 438
   000399         040200     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1754.2 301 38 438
   000400         040300     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1754.2 313 38 438
   000401         040400 COLUMN-NAMES-ROUTINE.                                            NC1754.2
   000402         040500     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1754.2 265 38 438
   000403         040600     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1754.2 270 38 438
   000404         040700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1754.2 357 38 438
   000405         040800 END-ROUTINE.                                                     NC1754.2
   000406         040900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1754.2 357 38 438
   000407         041000 END-RTN-EXIT.                                                    NC1754.2
   000408         041100     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1754.2 320 38 438
   000409         041200 END-ROUTINE-1.                                                   NC1754.2
   000410         041300      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1754.2 279 283 280
   000411         041400      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1754.2 283 278 283
   000412         041500      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1754.2 281 283
   000413         041600*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1754.2
   000414         041700      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1754.2 281 343
   000415         041800      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1754.2 283 345
   000416         041900      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1754.2 342 328
   000417         042000      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1754.2 325 38 438
   000418         042100  END-ROUTINE-12.                                                 NC1754.2
   000419         042200      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1754.2 331
   000420         042300     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1754.2 279 IMP
   000421      1  042400         MOVE "NO " TO ERROR-TOTAL                                NC1754.2 329
   000422         042500         ELSE                                                     NC1754.2
   000423      1  042600         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1754.2 279 329
   000424         042700     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1754.2 325 38
   000425         042800     PERFORM WRITE-LINE.                                          NC1754.2 438
   000426         042900 END-ROUTINE-13.                                                  NC1754.2
   000427         043000     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1754.2 278 IMP
   000428      1  043100         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1754.2 329
   000429      1  043200         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1754.2 278 329
   000430         043300     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1754.2 331
   000431         043400     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1754.2 325 38 438
   000432         043500      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1754.2 280 IMP
   000433      1  043600          MOVE "NO " TO ERROR-TOTAL                               NC1754.2 329
   000434      1  043700      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1754.2 280 329
   000435         043800      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1754.2 331
   000436         043900      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1754.2 325 38 438
   000437         044000     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1754.2 333 38 438
   000438         044100 WRITE-LINE.                                                      NC1754.2
   000439         044200     ADD 1 TO RECORD-COUNT.                                       NC1754.2 285
   000440         044300     IF RECORD-COUNT GREATER 42                                   NC1754.2 285
   000441      1  044400         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1754.2 38 284
   000442      1  044500         MOVE SPACE TO DUMMY-RECORD                               NC1754.2 IMP 38
   000443      1  044600         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1754.2 38
   000444      1  044700         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1754.2 287 38 454
   000445      1  044800         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1754.2 292 38 454
   000446      1  044900         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1754.2 301 38 454
   000447      1  045000         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1754.2 313 38 454
   000448      1  045100         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1754.2 265 38 454
   000449      1  045200         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1754.2 270 38 454
   000450      1  045300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1754.2 357 38 454
   000451      1  045400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1754.2 284 38
   000452      1  045500         MOVE ZERO TO RECORD-COUNT.                               NC1754.2 IMP 285
   000453         045600     PERFORM WRT-LN.                                              NC1754.2 454
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700 WRT-LN.                                                          NC1754.2
   000455         045800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1754.2 38
   000456         045900     MOVE SPACE TO DUMMY-RECORD.                                  NC1754.2 IMP 38
   000457         046000 BLANK-LINE-PRINT.                                                NC1754.2
   000458         046100     PERFORM WRT-LN.                                              NC1754.2 454
   000459         046200 FAIL-ROUTINE.                                                    NC1754.2
   000460         046300     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1754.2 240 IMP
   000461      1  046400            GO TO FAIL-ROUTINE-WRITE.                             NC1754.2 468
   000462         046500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1754.2 254 IMP 468
   000463         046600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1754.2 286 356
   000464         046700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1754.2 351
   000465         046800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1754.2 348 38 438
   000466         046900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1754.2 IMP 356
   000467         047000     GO TO  FAIL-ROUTINE-EX.                                      NC1754.2 473
   000468         047100 FAIL-ROUTINE-WRITE.                                              NC1754.2
   000469         047200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1754.2 236 37 438
   000470         047300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1754.2 286 264
   000471         047400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1754.2 251 37 438
   000472         047500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1754.2 IMP 264
   000473         047600 FAIL-ROUTINE-EX. EXIT.                                           NC1754.2
   000474         047700 BAIL-OUT.                                                        NC1754.2
   000475         047800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1754.2 241 IMP 477
   000476         047900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1754.2 255 IMP 482
   000477         048000 BAIL-OUT-WRITE.                                                  NC1754.2
   000478         048100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1754.2 255 355 241 353
   000479         048200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1754.2 286 356
   000480         048300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1754.2 348 38 438
   000481         048400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1754.2 IMP 356
   000482         048500 BAIL-OUT-EX. EXIT.                                               NC1754.2
   000483         048600 CCVS1-EXIT.                                                      NC1754.2
   000484         048700     EXIT.                                                        NC1754.2
   000485         048800 SECT-NC175A-001 SECTION.                                         NC1754.2
   000486         048900 SUB-INIT-F2-1.                                                   NC1754.2
   000487         049000     MOVE   "VI-134 6.25.4 GR2" TO ANSI-REFERENCE.                NC1754.2 286
   000488         049100     MOVE   "SUBTRACT FROM GIVING" TO FEATURE.                    NC1754.2 226
   000489         049200 SUB-TEST-F2-1.                                                   NC1754.2
   000490         049300     MOVE     -2 TO N-10.                                         NC1754.2 176
   000491         049400     SUBTRACT N-10 FROM 0 GIVING N-19.                            NC1754.2 176 190
   000492         049500     IF       N-19 EQUAL TO "$2.00"                               NC1754.2 190
   000493      1  049600              PERFORM PASS                                        NC1754.2 380
   000494      1  049700              GO TO SUB-WRITE-F2-1.                               NC1754.2 503
   000495         049800     GO TO    SUB-FAIL-F2-1.                                      NC1754.2 499
   000496         049900 SUB-DELETE-F2-1.                                                 NC1754.2
   000497         050000     PERFORM  DE-LETE.                                            NC1754.2 382
   000498         050100     GO TO    SUB-WRITE-F2-1.                                     NC1754.2 503
   000499         050200 SUB-FAIL-F2-1.                                                   NC1754.2
   000500         050300     MOVE     N-19 TO COMPUTED-A.                                 NC1754.2 190 241
   000501         050400     MOVE "     $2.00" TO CORRECT-A.                              NC1754.2 255
   000502         050500     PERFORM  FAIL.                                               NC1754.2 381
   000503         050600 SUB-WRITE-F2-1.                                                  NC1754.2
   000504         050700     MOVE "SUB-TEST-F2-1 " TO PAR-NAME.                           NC1754.2 230
   000505         050800     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000506         050900 SUB-TEST-F2-2.                                                   NC1754.2
   000507         051000     SUBTRACT N-21 FROM N-22 GIVING N-23 ROUNDED.                 NC1754.2 193 194 196
   000508         051100     IF       N-23 EQUAL TO "  $.55  "                            NC1754.2 196
   000509      1  051200              PERFORM PASS                                        NC1754.2 380
   000510      1  051300              GO TO SUB-WRITE-F2-2.                               NC1754.2 519
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     GO TO    SUB-FAIL-F2-2.                                      NC1754.2 515
   000512         051500 SUB-DELETE-F2-2.                                                 NC1754.2
   000513         051600     PERFORM  DE-LETE.                                            NC1754.2 382
   000514         051700     GO TO    SUB-WRITE-F2-2.                                     NC1754.2 519
   000515         051800 SUB-FAIL-F2-2.                                                   NC1754.2
   000516         051900     MOVE     N-23 TO COMPUTED-A.                                 NC1754.2 196 241
   000517         052000     MOVE "      $.55" TO CORRECT-A.                              NC1754.2 255
   000518         052100     PERFORM  FAIL.                                               NC1754.2 381
   000519         052200 SUB-WRITE-F2-2.                                                  NC1754.2
   000520         052300     MOVE "SUB-TEST-F2-2 " TO PAR-NAME.                           NC1754.2 230
   000521         052400     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000522         052500 SUB-INIT-F2-3-1.                                                 NC1754.2
   000523         052600     MOVE    1    TO N-25.                                        NC1754.2 197
   000524         052700     MOVE    ZERO TO N-26.                                        NC1754.2 IMP 198
   000525         052800 SUB-TEST-F2-3-1.                                                 NC1754.2
   000526         052900     SUBTRACT N-25 FROM -99999 GIVING N-26 ON SIZE ERROR          NC1754.2 197 198
   000527      1  053000              PERFORM PASS                                        NC1754.2 380
   000528      1  053100              GO TO SUB-WRITE-F2-3-1.                             NC1754.2 537
   000529         053200     GO TO    SUB-FAIL-F2-3-1.                                    NC1754.2 533
   000530         053300 SUB-DELETE-F2-3-1.                                               NC1754.2
   000531         053400     PERFORM  DE-LETE.                                            NC1754.2 382
   000532         053500     GO TO    SUB-WRITE-F2-3-1.                                   NC1754.2 537
   000533         053600 SUB-FAIL-F2-3-1.                                                 NC1754.2
   000534         053700     MOVE     N-26 TO COMPUTED-N.                                 NC1754.2 198 242
   000535         053800     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1754.2 235
   000536         053900     PERFORM  FAIL.                                               NC1754.2 381
   000537         054000 SUB-WRITE-F2-3-1.                                                NC1754.2
   000538         054100     MOVE "SUB-TEST-F2-3-1 " TO PAR-NAME.                         NC1754.2 230
   000539         054200     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000540         054300 SUB-TEST-F2-3-2.                                                 NC1754.2
   000541         054400     IF       N-26 = ZERO                                         NC1754.2 198 IMP
   000542      1  054500              PERFORM PASS                                        NC1754.2 380
   000543      1  054600              GO TO SUB-WRITE-F2-3-2.                             NC1754.2 553
   000544         054700     GO TO    SUB-FAIL-F2-3-2.                                    NC1754.2 548
   000545         054800 SUB-DELETE-F2-3-2.                                               NC1754.2
   000546         054900     PERFORM  DE-LETE.                                            NC1754.2 382
   000547         055000     GO TO    SUB-WRITE-F2-3-2.                                   NC1754.2 553
   000548         055100 SUB-FAIL-F2-3-2.                                                 NC1754.2
   000549         055200     MOVE     N-26 TO COMPUTED-N.                                 NC1754.2 198 242
   000550         055300     MOVE     ZERO TO CORRECT-N.                                  NC1754.2 IMP 256
   000551         055400     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1754.2 235
   000552         055500     PERFORM  FAIL.                                               NC1754.2 381
   000553         055600 SUB-WRITE-F2-3-2.                                                NC1754.2
   000554         055700     MOVE "SUB-TEST-F2-3-2 " TO PAR-NAME.                         NC1754.2 230
   000555         055800     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000556         055900 SUB-INIT-F2-4-1.                                                 NC1754.2
   000557         056000     MOVE    9999.9 TO N-27.                                      NC1754.2 199
   000558         056100     MOVE    ZERO   TO N-28.                                      NC1754.2 IMP 201
   000559         056200 SUB-TEST-F2-4-1.                                                 NC1754.2
   000560         056300     SUBTRACT -9 FROM N-27 GIVING N-28 ROUNDED ON SIZE ERROR      NC1754.2 199 201
   000561      1  056400              PERFORM PASS                                        NC1754.2 380
   000562      1  056500              GO TO SUB-WRITE-F2-4-1.                             NC1754.2 571
   000563         056600     GO TO    SUB-FAIL-F2-4-1.                                    NC1754.2 567
   000564         056700 SUB-DELETE-F2-4-1.                                               NC1754.2
   000565         056800     PERFORM  DE-LETE.                                            NC1754.2 382
   000566         056900     GO TO    SUB-WRITE-F2-4-1.                                   NC1754.2 571
   000567         057000 SUB-FAIL-F2-4-1.                                                 NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE     N-28 TO COMPUTED-A.                                 NC1754.2 201 241
   000569         057200     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1754.2 235
   000570         057300     PERFORM  FAIL.                                               NC1754.2 381
   000571         057400 SUB-WRITE-F2-4-1.                                                NC1754.2
   000572         057500     MOVE "SUB-TEST-F2-4-1 " TO PAR-NAME.                         NC1754.2 230
   000573         057600     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000574         057700 SUB-TEST-F2-4-2.                                                 NC1754.2
   000575         057800     IF      N-28 = "$0000.00"                                    NC1754.2 201
   000576      1  057900             PERFORM PASS                                         NC1754.2 380
   000577      1  058000             GO TO   SUB-WRITE-F2-4-2.                            NC1754.2 587
   000578         058100     GO TO   SUB-FAIL-F2-4-2.                                     NC1754.2 582
   000579         058200 SUB-DELETE-F2-4-2.                                               NC1754.2
   000580         058300     PERFORM DE-LETE.                                             NC1754.2 382
   000581         058400     GO TO   SUB-WRITE-F2-4-2.                                    NC1754.2 587
   000582         058500 SUB-FAIL-F2-4-2.                                                 NC1754.2
   000583         058600     MOVE    N-28 TO COMPUTED-X.                                  NC1754.2 201 240
   000584         058700     MOVE   "$0000.00"  TO CORRECT-X.                             NC1754.2 254
   000585         058800     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.          NC1754.2 235
   000586         058900     PERFORM FAIL.                                                NC1754.2 381
   000587         059000 SUB-WRITE-F2-4-2.                                                NC1754.2
   000588         059100     MOVE "SUB-TEST-F2-4-2 " TO PAR-NAME.                         NC1754.2 230
   000589         059200     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000590         059300 SUB-INIT-F2-5.                                                   NC1754.2
   000591         059400     MOVE     "  GIVING" TO FEATURE.                              NC1754.2 226
   000592         059500 SUB-TEST-F2-5.                                                   NC1754.2
   000593         059600     MOVE     ZERO TO WRK-DS-09V09.                               NC1754.2 IMP 91
   000594         059700     SUBTRACT A06THREES-DS-03V03 FROM A12THREES-DS-06V06          NC1754.2 94 96
   000595         059800              GIVING WRK-DS-06V06.                                NC1754.2 98
   000596         059900     IF       WRK-DS-06V06 EQUAL TO 333000.000333                 NC1754.2 98
   000597      1  060000              PERFORM PASS GO TO SUB-WRITE-F2-5.                  NC1754.2 380 606
   000598         060100     GO       TO SUB-FAIL-F2-5.                                   NC1754.2 602
   000599         060200 SUB-DELETE-F2-5.                                                 NC1754.2
   000600         060300     PERFORM  DE-LETE.                                            NC1754.2 382
   000601         060400     GO       TO SUB-WRITE-F2-5.                                  NC1754.2 606
   000602         060500 SUB-FAIL-F2-5.                                                   NC1754.2
   000603         060600     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1754.2 98 242
   000604         060700     MOVE     333000.000333 TO CORRECT-N.                         NC1754.2 256
   000605         060800     PERFORM  FAIL.                                               NC1754.2 381
   000606         060900 SUB-WRITE-F2-5.                                                  NC1754.2
   000607         061000     MOVE     "SUB-TEST-F2-5" TO PAR-NAME.                        NC1754.2 230
   000608         061100     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000609         061200 SUB-TEST-F2-6.                                                   NC1754.2
   000610         061300     MOVE     ZERO TO WRK-DS-06V06.                               NC1754.2 IMP 98
   000611         061400     SUBTRACT A05ONES-DS-05V00                                    NC1754.2 87
   000612         061500              A05ONES-DS-00V05                                    NC1754.2 101
   000613         061600              A12THREES-DS-06V06                                  NC1754.2 96
   000614         061700              A06THREES-DS-03V03 FROM ZERO GIVING WRK-DS-06V06.   NC1754.2 94 IMP 98
   000615         061800     IF       WRK-DS-06V06 EQUAL TO -344777.777443                NC1754.2 98
   000616      1  061900              PERFORM PASS GO TO SUB-WRITE-F2-6.                  NC1754.2 380 625
   000617         062000     GO       TO SUB-FAIL-F2-6.                                   NC1754.2 621
   000618         062100 SUB-DELETE-F2-6.                                                 NC1754.2
   000619         062200     PERFORM  DE-LETE.                                            NC1754.2 382
   000620         062300     GO       TO SUB-WRITE-F2-6.                                  NC1754.2 625
   000621         062400 SUB-FAIL-F2-6.                                                   NC1754.2
   000622         062500     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1754.2 98 242
   000623         062600     MOVE     -344777.777443 TO CORRECT-N.                        NC1754.2 256
   000624         062700     PERFORM  FAIL.                                               NC1754.2 381
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 SUB-WRITE-F2-6.                                                  NC1754.2
   000626         062900     MOVE     "SUB-TEST-F2-6" TO PAR-NAME.                        NC1754.2 230
   000627         063000     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000628         063100 SUB-TEST-F2-7.                                                   NC1754.2
   000629         063200     MOVE     -099999.999999 TO WRK-DS-06V06.                     NC1754.2 98
   000630         063300     SUBTRACT A05ONES-DS-05V00                                    NC1754.2 87
   000631         063400              -11111                                              NC1754.2
   000632         063500              AZERO-DS-05V05 FROM WRK-DS-06V06                    NC1754.2 128 98
   000633         063600              GIVING WRK-DS-06V00 ROUNDED.                        NC1754.2 127
   000634         063700     IF       WRK-DS-06V00 EQUAL TO -100000                       NC1754.2 127
   000635      1  063800              PERFORM PASS GO TO SUB-WRITE-F2-7.                  NC1754.2 380 644
   000636         063900     GO       TO SUB-FAIL-F2-7.                                   NC1754.2 640
   000637         064000 SUB-DELETE-F2-7.                                                 NC1754.2
   000638         064100     PERFORM  DE-LETE.                                            NC1754.2 382
   000639         064200     GO       TO SUB-WRITE-F2-7.                                  NC1754.2 644
   000640         064300 SUB-FAIL-F2-7.                                                   NC1754.2
   000641         064400     MOVE     WRK-DS-06V00 TO COMPUTED-N.                         NC1754.2 127 242
   000642         064500     MOVE    -100000 TO CORRECT-N.                                NC1754.2 256
   000643         064600     PERFORM  FAIL.                                               NC1754.2 381
   000644         064700 SUB-WRITE-F2-7.                                                  NC1754.2
   000645         064800     MOVE     "SUB-TEST-F2-7" TO PAR-NAME.                        NC1754.2 230
   000646         064900     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000647         065000 SUB-TEST-F2-8-1.                                                 NC1754.2
   000648         065100     MOVE     ZERO TO WRK-DS-10V00.                               NC1754.2 IMP 84
   000649         065200     SUBTRACT A12ONES-DS-12V00                                    NC1754.2 105
   000650         065300              FROM ZERO GIVING WRK-DS-10V00 ON SIZE ERROR         NC1754.2 IMP 84
   000651      1  065400              PERFORM PASS GO TO SUB-WRITE-F2-8-1.                NC1754.2 380 659
   000652         065500     GO       TO SUB-FAIL-F2-8-1.                                 NC1754.2 656
   000653         065600 SUB-DELETE-F2-8-1.                                               NC1754.2
   000654         065700     PERFORM  DE-LETE.                                            NC1754.2 382
   000655         065800     GO       TO SUB-WRITE-F2-8-1.                                NC1754.2 659
   000656         065900 SUB-FAIL-F2-8-1.                                                 NC1754.2
   000657         066000     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1754.2 235
   000658         066100     PERFORM  FAIL.                                               NC1754.2 381
   000659         066200 SUB-WRITE-F2-8-1.                                                NC1754.2
   000660         066300     MOVE     "SUB-TEST-F2-8-1" TO PAR-NAME.                      NC1754.2 230
   000661         066400     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000662         066500 SUB-TEST-F2-8-2.                                                 NC1754.2
   000663         066600     IF       WRK-DS-10V00 EQUAL TO ZERO                          NC1754.2 84 IMP
   000664      1  066700              PERFORM PASS GO TO SUB-WRITE-F2-8-2.                NC1754.2 380 675
   000665         066800*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-F2-8-1   NC1754.2
   000666         066900     GO       TO SUB-FAIL-F2-8-2.                                 NC1754.2 670
   000667         067000 SUB-DELETE-F2-8-2.                                               NC1754.2
   000668         067100     PERFORM  DE-LETE.                                            NC1754.2 382
   000669         067200     GO       TO SUB-WRITE-F2-8-2.                                NC1754.2 675
   000670         067300 SUB-FAIL-F2-8-2.                                                 NC1754.2
   000671         067400     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1754.2 235
   000672         067500     MOVE     WRK-DS-10V00 TO COMPUTED-14V4.                      NC1754.2 84 246
   000673         067600     MOVE     ZERO TO CORRECT-14V4.                               NC1754.2 IMP 259
   000674         067700     PERFORM  FAIL.                                               NC1754.2 381
   000675         067800 SUB-WRITE-F2-8-2.                                                NC1754.2
   000676         067900     MOVE     "SUB-TEST-F2-8-2" TO PAR-NAME.                      NC1754.2 230
   000677         068000     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000678         068100 SUB-TEST-F2-9-1.                                                 NC1754.2
   000679         068200     MOVE ZERO TO WRK-DS-05V00.                                   NC1754.2 IMP 103
   000680         068300     SUBTRACT 33333                                               NC1754.2
   000681         068400              A06THREES-DS-03V03                                  NC1754.2 94
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500              A12THREES-DS-06V06                                  NC1754.2 96
   000683         068600              FROM -1000000 GIVING WRK-DS-05V00                   NC1754.2 103
   000684         068700              ROUNDED ON SIZE ERROR                               NC1754.2
   000685      1  068800              PERFORM PASS GO TO SUB-WRITE-F2-9-1.                NC1754.2 380 693
   000686         068900     GO       TO SUB-FAIL-F2-9-1.                                 NC1754.2 690
   000687         069000 SUB-DELETE-F2-9-1.                                               NC1754.2
   000688         069100     PERFORM  DE-LETE.                                            NC1754.2 382
   000689         069200     GO       TO SUB-WRITE-F2-9-1.                                NC1754.2 693
   000690         069300 SUB-FAIL-F2-9-1.                                                 NC1754.2
   000691         069400     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1754.2 235
   000692         069500     PERFORM  FAIL.                                               NC1754.2 381
   000693         069600 SUB-WRITE-F2-9-1.                                                NC1754.2
   000694         069700     MOVE     "SUB-TEST-F2-9-1" TO PAR-NAME.                      NC1754.2 230
   000695         069800     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000696         069900 SUB-TEST-F2-9-2.                                                 NC1754.2
   000697         070000     IF       WRK-DS-05V00 EQUAL TO ZERO                          NC1754.2 103 IMP
   000698      1  070100              PERFORM PASS GO TO SUB-WRITE-F2-9-2.                NC1754.2 380 709
   000699         070200*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F2-9-1   NC1754.2
   000700         070300     GO       TO SUB-FAIL-F2-9-2.                                 NC1754.2 704
   000701         070400 SUB-DELETE-F2-9-2.                                               NC1754.2
   000702         070500     PERFORM  DE-LETE.                                            NC1754.2 382
   000703         070600     GO       TO SUB-WRITE-F2-9-2.                                NC1754.2 709
   000704         070700 SUB-FAIL-F2-9-2.                                                 NC1754.2
   000705         070800     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1754.2 235
   000706         070900     MOVE     WRK-DS-05V00 TO COMPUTED-N.                         NC1754.2 103 242
   000707         071000     MOVE     ZERO TO CORRECT-N.                                  NC1754.2 IMP 256
   000708         071100     PERFORM  FAIL.                                               NC1754.2 381
   000709         071200 SUB-WRITE-F2-9-2.                                                NC1754.2
   000710         071300     MOVE     "SUB-TEST-F2-9-2" TO PAR-NAME.                      NC1754.2 230
   000711         071400     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000712         071500 SUB-TEST-F2-10-1.                                                NC1754.2
   000713         071600     MOVE     ZERO TO WRK-DS-06V06.                               NC1754.2 IMP 98
   000714         071700     SUBTRACT A12THREES-DS-06V06                                  NC1754.2 96
   000715         071800              333333                                              NC1754.2
   000716         071900              A06THREES-DS-03V03                                  NC1754.2 94
   000717         072000              -.0000009 FROM 0000000                              NC1754.2
   000718         072100              GIVING WRK-DS-06V06 ROUNDED ON SIZE ERROR           NC1754.2 98
   000719      1  072200              GO TO SUB-FAIL-F2-10-1.                             NC1754.2 725
   000720         072300     PERFORM  PASS.                                               NC1754.2 380
   000721         072400     GO       TO SUB-WRITE-F2-10-1.                               NC1754.2 728
   000722         072500 SUB-DELETE-F2-10-1.                                              NC1754.2
   000723         072600     PERFORM  DE-LETE.                                            NC1754.2 382
   000724         072700     GO       TO SUB-WRITE-F2-10-1.                               NC1754.2 728
   000725         072800 SUB-FAIL-F2-10-1.                                                NC1754.2
   000726         072900     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1754.2 235
   000727         073000     PERFORM  FAIL.                                               NC1754.2 381
   000728         073100 SUB-WRITE-F2-10-1.                                               NC1754.2
   000729         073200     MOVE     "SUB-TEST-F2-10-1" TO PAR-NAME.                     NC1754.2 230
   000730         073300     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000731         073400 SUB-TEST-F2-10-2.                                                NC1754.2
   000732         073500     IF       WRK-DS-06V06 EQUAL TO -666999.666332                NC1754.2 98
   000733      1  073600              PERFORM PASS GO TO SUB-WRITE-F2-10-2.               NC1754.2 380 743
   000734         073700*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F2-10-1  NC1754.2
   000735         073800     GO       TO SUB-FAIL-F2-10-2.                                NC1754.2 739
   000736         073900 SUB-DELETE-F2-10-2.                                              NC1754.2
   000737         074000     PERFORM  DE-LETE.                                            NC1754.2 382
   000738         074100     GO       TO SUB-WRITE-F2-10-2.                               NC1754.2 743
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 SUB-FAIL-F2-10-2.                                                NC1754.2
   000740         074300     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1754.2 98 242
   000741         074400     MOVE     -666999.666332 TO CORRECT-N.                        NC1754.2 256
   000742         074500     PERFORM  FAIL.                                               NC1754.2 381
   000743         074600 SUB-WRITE-F2-10-2.                                               NC1754.2
   000744         074700     MOVE     "SUB-TEST-F2-10-2" TO PAR-NAME.                     NC1754.2 230
   000745         074800     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000746         074900 SUB-INIT-F2-11.                                                  NC1754.2
   000747         075000     MOVE     "  SERIES" TO FEATURE.                              NC1754.2 226
   000748         075100 SUB-TEST-F2-11.                                                  NC1754.2
   000749         075200     MOVE     ZERO TO WRK-DS-03V10.                               NC1754.2 IMP 107
   000750         075300     SUBTRACT A99-DS-02V00                                        NC1754.2 110
   000751         075400              A03ONES-DS-02V01                                    NC1754.2 112
   000752         075500              A06ONES-DS-03V03                                    NC1754.2 114
   000753         075600              A08TWOS-DS-02V06                                    NC1754.2 116
   000754         075700              -1.1111111                                          NC1754.2
   000755         075800              +.11111111                                          NC1754.2
   000756         075900              A01ONE-DS-P0801 FROM 0000.000000                    NC1754.2 118
   000757         076000              GIVING WRK-DS-03V10.                                NC1754.2 107
   000758         076100     IF       WRK-DS-03V10 EQUAL TO -242.4332220110               NC1754.2 107
   000759      1  076200              PERFORM PASS GO TO SUB-WRITE-F2-11.                 NC1754.2 380 768
   000760         076300     GO       TO SUB-FAIL-F2-11.                                  NC1754.2 764
   000761         076400 SUB-DELETE-F2-11.                                                NC1754.2
   000762         076500     PERFORM  DE-LETE.                                            NC1754.2 382
   000763         076600     GO       TO SUB-WRITE-F2-11.                                 NC1754.2 768
   000764         076700 SUB-FAIL-F2-11.                                                  NC1754.2
   000765         076800     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1754.2 107 245
   000766         076900     MOVE     -242.4332220110 TO CORRECT-4V14.                    NC1754.2 258
   000767         077000     PERFORM  FAIL.                                               NC1754.2 381
   000768         077100 SUB-WRITE-F2-11.                                                 NC1754.2
   000769         077200     MOVE     "SUB-TEST-F2-11" TO PAR-NAME.                       NC1754.2 230
   000770         077300     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000771         077400 SUB-TEST-F2-12.                                                  NC1754.2
   000772         077500     MOVE     ZERO TO WRK-DS-03V10.                               NC1754.2 IMP 107
   000773         077600     SUBTRACT A01ONE-DS-P0801                                     NC1754.2 118
   000774         077700              +.11111111                                          NC1754.2
   000775         077800              -1.1111111                                          NC1754.2
   000776         077900              A08TWOS-DS-02V06                                    NC1754.2 116
   000777         078000              A06ONES-DS-03V03                                    NC1754.2 114
   000778         078100              A03ONES-DS-02V01                                    NC1754.2 112
   000779         078200              A99-DS-02V00 FROM 0000.000000 GIVING WRK-DS-03V10.  NC1754.2 110 107
   000780         078300     IF       WRK-DS-03V10 EQUAL TO -242.4332220110               NC1754.2 107
   000781      1  078400              PERFORM PASS GO TO SUB-WRITE-F2-12.                 NC1754.2 380 790
   000782         078500     GO       TO SUB-FAIL-F2-12.                                  NC1754.2 786
   000783         078600 SUB-DELETE-F2-12.                                                NC1754.2
   000784         078700     PERFORM  DE-LETE.                                            NC1754.2 382
   000785         078800     GO       TO SUB-WRITE-F2-12.                                 NC1754.2 790
   000786         078900 SUB-FAIL-F2-12.                                                  NC1754.2
   000787         079000     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1754.2 107 245
   000788         079100     MOVE     -242.4332220110 TO CORRECT-4V14.                    NC1754.2 258
   000789         079200     PERFORM  FAIL.                                               NC1754.2 381
   000790         079300 SUB-WRITE-F2-12.                                                 NC1754.2
   000791         079400     MOVE     "SUB-TEST-F2-12" TO PAR-NAME.                       NC1754.2 230
   000792         079500     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000793         079600 SUB-TEST-F2-13.                                                  NC1754.2
   000794         079700     MOVE     ZERO TO WRK-DS-03V10.                               NC1754.2 IMP 107
   000795         079800     SUBTRACT A08TWOS-DS-02V06                                    NC1754.2 116
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900              A99-DS-02V00                                        NC1754.2 110
   000797         080000              -1.1111111                                          NC1754.2
   000798         080100              A03ONES-DS-02V01                                    NC1754.2 112
   000799         080200              A01ONE-DS-P0801                                     NC1754.2 118
   000800         080300              +.11111111                                          NC1754.2
   000801         080400              A06ONES-DS-03V03 FROM 0000.000000                   NC1754.2 114
   000802         080500              GIVING WRK-DS-03V10.                                NC1754.2 107
   000803         080600     IF       WRK-DS-03V10 EQUAL TO -242.4332220110               NC1754.2 107
   000804      1  080700              PERFORM PASS GO TO SUB-WRITE-F2-13.                 NC1754.2 380 813
   000805         080800     GO       TO SUB-FAIL-F2-13.                                  NC1754.2 809
   000806         080900 SUB-DELETE-F2-13.                                                NC1754.2
   000807         081000     PERFORM  DE-LETE.                                            NC1754.2 382
   000808         081100     GO       TO SUB-WRITE-F2-13.                                 NC1754.2 813
   000809         081200 SUB-FAIL-F2-13.                                                  NC1754.2
   000810         081300     MOVE     WRK-DS-03V10 TO COMPUTED-4V14.                      NC1754.2 107 245
   000811         081400     MOVE     -242.4332220110 TO CORRECT-4V14.                    NC1754.2 258
   000812         081500     PERFORM  FAIL.                                               NC1754.2 381
   000813         081600 SUB-WRITE-F2-13.                                                 NC1754.2
   000814         081700     MOVE     "SUB-TEST-F2-13" TO PAR-NAME.                       NC1754.2 230
   000815         081800     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   000816         081900 SUB-TEST-F2-14.                                                  NC1754.2
   000817         082000     SUBTRACT SUBTR-4 SUBTR-5 .499 FROM SUBTR-2 GIVING SUBTR-11.  NC1754.2 161 162 159 167
   000818         082100     IF       SUBTR-11 EQUAL TO -1.5                              NC1754.2 167
   000819      1  082200              PERFORM PASS GO TO SUB-WRITE-F2-14.                 NC1754.2 380 828
   000820         082300     GO       TO SUB-FAIL-F2-14.                                  NC1754.2 824
   000821         082400 SUB-DELETE-F2-14.                                                NC1754.2
   000822         082500     PERFORM DE-LETE.                                             NC1754.2 382
   000823         082600     GO       TO SUB-WRITE-F2-14.                                 NC1754.2 828
   000824         082700 SUB-FAIL-F2-14.                                                  NC1754.2
   000825         082800     MOVE     SUBTR-11  TO COMPUTED-N.                            NC1754.2 167 242
   000826         082900     MOVE     -1.5      TO CORRECT-N.                             NC1754.2 256
   000827         083000     PERFORM FAIL.                                                NC1754.2 381
   000828         083100 SUB-WRITE-F2-14.                                                 NC1754.2
   000829         083200     MOVE     "SUB-TEST-F2-14" TO PAR-NAME.                       NC1754.2 230
   000830         083300     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000831         083400 SUB-TEST-F2-15-1.                                                NC1754.2
   000832         083500     SUBTRACT SUBTR-1 SUBTR-3 FROM SUBTR-5 GIVING SUBTR-7 ON      NC1754.2 158 160 162 164
   000833         083600              SIZE ERROR                                          NC1754.2
   000834      1  083700              PERFORM PASS GO TO SUB-WRITE-F2-15-1.               NC1754.2 380 842
   000835         083800     GO       TO SUB-FAIL-F2-15-1.                                NC1754.2 839
   000836         083900 SUB-DELETE-F2-15-1.                                              NC1754.2
   000837         084000     PERFORM DE-LETE.                                             NC1754.2 382
   000838         084100     GO       TO SUB-WRITE-F2-15-1.                               NC1754.2 842
   000839         084200 SUB-FAIL-F2-15-1.                                                NC1754.2
   000840         084300     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1754.2 235
   000841         084400     PERFORM FAIL.                                                NC1754.2 381
   000842         084500 SUB-WRITE-F2-15-1.                                               NC1754.2
   000843         084600     MOVE     "SUB-TEST-F2-15-1" TO PAR-NAME.                     NC1754.2 230
   000844         084700     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000845         084800 SUB-TEST-F2-15-2.                                                NC1754.2
   000846         084900     IF       SUBTR-7 EQUAL  TO 99                                NC1754.2 164
   000847      1  085000              PERFORM PASS GO TO SUB-WRITE-F2-15-2.               NC1754.2 380 858
   000848         085100*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F2-15-2  NC1754.2
   000849         085200     GO       TO SUB-FAIL-F2-15-2.                                NC1754.2 853
   000850         085300 SUB-DELETE-F2-15-2.                                              NC1754.2
   000851         085400     PERFORM DE-LETE.                                             NC1754.2 382
   000852         085500     GO       TO SUB-WRITE-F2-15-2.                               NC1754.2 858
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600 SUB-FAIL-F2-15-2.                                                NC1754.2
   000854         085700     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1754.2 235
   000855         085800     MOVE     SUBTR-7   TO COMPUTED-N.                            NC1754.2 164 242
   000856         085900     MOVE     ZERO      TO CORRECT-N.                             NC1754.2 IMP 256
   000857         086000     PERFORM FAIL.                                                NC1754.2 381
   000858         086100 SUB-WRITE-F2-15-2.                                               NC1754.2
   000859         086200     MOVE     "SUB-TEST-F2-15-2" TO PAR-NAME.                     NC1754.2 230
   000860         086300     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000861         086400 SUB-TEST-F2-16-1.                                                NC1754.2
   000862         086500     MOVE SPACE TO SIZE-ERR.                                      NC1754.2 IMP 76
   000863         086600     SUBTRACT MINUS-NAME1 MINUS-NAME2 -34 -1 PLUS-NAME1           NC1754.2 212 213 215
   000864         086700         PLUS-NAME2 EVEN-NAME1 35 FROM EVEN-NAME1 GIVING          NC1754.2 216 214 214
   000865         086800         WHOLE-FIELD                                              NC1754.2 222
   000866      1  086900         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1754.2 76
   000867         087000     IF WHOLE-FIELD EQUAL TO 0                                    NC1754.2 222
   000868      1  087100         PERFORM PASS                                             NC1754.2 380
   000869      1  087200         GO TO SUB-WRITE-F2-16-1.                                 NC1754.2 876
   000870         087300     MOVE WHOLE-FIELD TO COMPUTED-18V0.                           NC1754.2 222 248
   000871         087400     MOVE 0 TO CORRECT-18V0.                                      NC1754.2 261
   000872         087500     PERFORM FAIL.                                                NC1754.2 381
   000873         087600     GO TO SUB-WRITE-F2-16-1.                                     NC1754.2 876
   000874         087700 SUB-DELETE-F2-16-1.                                              NC1754.2
   000875         087800     PERFORM DE-LETE.                                             NC1754.2 382
   000876         087900 SUB-WRITE-F2-16-1.                                               NC1754.2
   000877         088000     MOVE "SUB-TEST-F2-16-1" TO PAR-NAME.                         NC1754.2 230
   000878         088100     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000879         088200 SUB-TEST-F2-16-2.                                                NC1754.2
   000880         088300     IF SIZE-ERR EQUAL TO "1"                                     NC1754.2 76
   000881      1  088400         PERFORM FAIL                                             NC1754.2 381
   000882      1  088500         MOVE SPACE TO CORRECT-A                                  NC1754.2 IMP 255
   000883      1  088600         MOVE 1 TO COMPUTED-A                                     NC1754.2 241
   000884      1  088700         MOVE "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK      NC1754.2 235
   000885      1  088800         GO TO SUB-WRITE-F2-16-2.                                 NC1754.2 890
   000886         088900     PERFORM PASS.                                                NC1754.2 380
   000887         089000     GO TO SUB-WRITE-F2-16-2.                                     NC1754.2 890
   000888         089100 SUB-DELETE-F2-16-2.                                              NC1754.2
   000889         089200     PERFORM DE-LETE.                                             NC1754.2 382
   000890         089300 SUB-WRITE-F2-16-2.                                               NC1754.2
   000891         089400     MOVE "SUB-TEST-F2-16-2" TO PAR-NAME.                         NC1754.2 230
   000892         089500     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000893         089600 SUB-TEST-F2-17-1.                                                NC1754.2
   000894         089700     MOVE SPACE TO SIZE-ERR.                                      NC1754.2 IMP 76
   000895         089800     SUBTRACT MINUS-NAME3 MINUS-NAME4 -.34 -.01 PLUS-NAME3        NC1754.2 217 218 220
   000896         089900         PLUS-NAME4 EVEN-NAME2 .35 FROM EVEN-NAME2                NC1754.2 221 219 219
   000897         090000         GIVING DECMAL-FIELD                                      NC1754.2 223
   000898      1  090100         ON SIZE ERROR  MOVE "1" TO SIZE-ERR.                     NC1754.2 76
   000899         090200     IF DECMAL-FIELD EQUAL TO .0                                  NC1754.2 223
   000900      1  090300         PERFORM PASS                                             NC1754.2 380
   000901      1  090400         GO TO SUB-WRITE-F2-17-1.                                 NC1754.2 908
   000902         090500     MOVE DECMAL-FIELD TO COMPUTED-0V18.                          NC1754.2 223 244
   000903         090600     MOVE .0 TO CORRECT-0V18.                                     NC1754.2 257
   000904         090700     PERFORM FAIL.                                                NC1754.2 381
   000905         090800     GO TO SUB-WRITE-F2-17-1.                                     NC1754.2 908
   000906         090900 SUB-DELETE-F2-17-1.                                              NC1754.2
   000907         091000     PERFORM DE-LETE.                                             NC1754.2 382
   000908         091100 SUB-WRITE-F2-17-1.                                               NC1754.2
   000909         091200     MOVE "SUB-TEST-F2-17-1" TO PAR-NAME.                         NC1754.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000911         091400 SUB-TEST-F2-17-2.                                                NC1754.2
   000912         091500     IF SIZE-ERR EQUAL TO "1"                                     NC1754.2 76
   000913      1  091600         PERFORM FAIL                                             NC1754.2 381
   000914      1  091700         MOVE SPACE TO CORRECT-A                                  NC1754.2 IMP 255
   000915      1  091800         MOVE 1 TO COMPUTED-A                                     NC1754.2 241
   000916      1  091900         MOVE "SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK      NC1754.2 235
   000917      1  092000         GO TO SUB-WRITE-F2-17-2.                                 NC1754.2 922
   000918         092100     PERFORM PASS.                                                NC1754.2 380
   000919         092200     GO TO SUB-WRITE-F2-17-2.                                     NC1754.2 922
   000920         092300 SUB-DELETE-F2-17-2.                                              NC1754.2
   000921         092400     PERFORM DE-LETE.                                             NC1754.2 382
   000922         092500 SUB-WRITE-F2-17-2.                                               NC1754.2
   000923         092600     MOVE "SUB-TEST-F2-17-2" TO PAR-NAME.                         NC1754.2 230
   000924         092700     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000925         092800 SUB-TEST-F2-18.                                                  NC1754.2
   000926         092900     MOVE ZERO TO WRK-CS-18V00.                                   NC1754.2 IMP 120
   000927         093000     SUBTRACT A12THREES-CU-18V00 FROM A14TWOS-CS-18V00            NC1754.2 143 141
   000928         093100             GIVING WRK-CS-18V00.                                 NC1754.2 120
   000929         093200     IF WRK-CS-18V00 EQUAL TO -000022555555555555                 NC1754.2 120
   000930      1  093300         PERFORM PASS                                             NC1754.2 380
   000931      1  093400         GO TO SUB-WRITE-F2-18.                                   NC1754.2 938
   000932         093500     MOVE -000022555555555555 TO CORRECT-18V0.                    NC1754.2 261
   000933         093600     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1754.2 120 248
   000934         093700     PERFORM FAIL.                                                NC1754.2 381
   000935         093800     GO TO SUB-WRITE-F2-18.                                       NC1754.2 938
   000936         093900 SUB-DELETE-F2-18.                                                NC1754.2
   000937         094000     PERFORM DE-LETE.                                             NC1754.2 382
   000938         094100 SUB-WRITE-F2-18.                                                 NC1754.2
   000939         094200     MOVE "SUB-TEST-F2-18 " TO PAR-NAME.                          NC1754.2 230
   000940         094300     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000941         094400 SUB-TEST-F2-19.                                                  NC1754.2
   000942         094500     MOVE ZERO TO WRK-DU-18V00.                                   NC1754.2 IMP 153
   000943         094600     SUBTRACT A18SIXES-CS-18V00 FROM A18THREES-CS-18V00           NC1754.2 149 154
   000944         094700             GIVING WRK-DU-18V00.                                 NC1754.2 153
   000945         094800     IF WRK-DU-18V00 EQUAL TO 999999999999999999                  NC1754.2 153
   000946      1  094900         PERFORM PASS                                             NC1754.2 380
   000947      1  095000         GO TO SUB-WRITE-F2-19.                                   NC1754.2 954
   000948         095100     MOVE 999999999999999999 TO CORRECT-18V0.                     NC1754.2 261
   000949         095200     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1754.2 153 248
   000950         095300     PERFORM FAIL.                                                NC1754.2 381
   000951         095400     GO TO SUB-WRITE-F2-19.                                       NC1754.2 954
   000952         095500 SUB-DELETE-F2-19.                                                NC1754.2
   000953         095600     PERFORM DE-LETE.                                             NC1754.2 382
   000954         095700 SUB-WRITE-F2-19.                                                 NC1754.2
   000955         095800     MOVE "SUB-TEST-F2-19 " TO PAR-NAME.                          NC1754.2 230
   000956         095900     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000957         096000 SUB-TEST-F2-20.                                                  NC1754.2
   000958         096100     MOVE ZERO TO WRK-CS-18V00.                                   NC1754.2 IMP 120
   000959         096200     SUBTRACT A16FOURS-CS-18V00 FROM A12THREES-CU-18V00           NC1754.2 145 143
   000960         096300             GIVING WRK-CS-18V00.                                 NC1754.2 120
   000961         096400     IF WRK-CS-18V00 EQUAL TO -004444111111111111                 NC1754.2 120
   000962      1  096500         PERFORM PASS                                             NC1754.2 380
   000963      1  096600         GO TO SUB-WRITE-F2-20.                                   NC1754.2 970
   000964         096700     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1754.2 120 248
   000965         096800     MOVE -004444111111111111 TO CORRECT-18V0.                    NC1754.2 261
   000966         096900     PERFORM FAIL.                                                NC1754.2 381
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     GO TO SUB-WRITE-F2-20.                                       NC1754.2 970
   000968         097100 SUB-DELETE-F2-20.                                                NC1754.2
   000969         097200     PERFORM DE-LETE.                                             NC1754.2 382
   000970         097300 SUB-WRITE-F2-20.                                                 NC1754.2
   000971         097400     MOVE "SUB-TEST-F2-20 " TO PAR-NAME.                          NC1754.2 230
   000972         097500     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000973         097600 SUB-TEST-F2-21.                                                  NC1754.2
   000974         097700     MOVE ZERO TO WRK-DU-18V00.                                   NC1754.2 IMP 153
   000975         097800     SUBTRACT A18THREES-CS-18V00 FROM A18ONES-CS-18V00            NC1754.2 154 121
   000976         097900             GIVING WRK-DU-18V00.                                 NC1754.2 153
   000977         098000     IF WRK-DU-18V00 EQUAL TO 444444444444444444                  NC1754.2 153
   000978      1  098100         PERFORM PASS                                             NC1754.2 380
   000979      1  098200         GO TO SUB-WRITE-F2-21.                                   NC1754.2 986
   000980         098300     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1754.2 153 248
   000981         098400     MOVE 444444444444444444 TO CORRECT-18V0.                     NC1754.2 261
   000982         098500     PERFORM FAIL.                                                NC1754.2 381
   000983         098600     GO TO SUB-WRITE-F2-21.                                       NC1754.2 986
   000984         098700 SUB-DELETE-F2-21.                                                NC1754.2
   000985         098800     PERFORM DE-LETE.                                             NC1754.2 382
   000986         098900 SUB-WRITE-F2-21.                                                 NC1754.2
   000987         099000     MOVE "SUB-TEST-F2-21 " TO PAR-NAME.                          NC1754.2 230
   000988         099100     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   000989         099200 SUB-TEST-F2-22.                                                  NC1754.2
   000990         099300     MOVE ZERO TO WRK-CS-18V00.                                   NC1754.2 IMP 120
   000991         099400     SUBTRACT A18SIXES-CS-18V00 FROM A18THREES-CS-18V00           NC1754.2 149 154
   000992         099500             GIVING WRK-CS-18V00.                                 NC1754.2 120
   000993         099600     IF WRK-CS-18V00 EQUAL TO -999999999999999999                 NC1754.2 120
   000994      1  099700         PERFORM PASS                                             NC1754.2 380
   000995      1  099800         GO TO SUB-WRITE-F2-22.                                   NC1754.2 1002
   000996         099900     MOVE -999999999999999999 TO CORRECT-18V0.                    NC1754.2 261
   000997         100000     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1754.2 120 248
   000998         100100     PERFORM FAIL.                                                NC1754.2 381
   000999         100200     GO TO SUB-WRITE-F2-22.                                       NC1754.2 1002
   001000         100300 SUB-DELETE-F2-22.                                                NC1754.2
   001001         100400     PERFORM DE-LETE.                                             NC1754.2 382
   001002         100500 SUB-WRITE-F2-22.                                                 NC1754.2
   001003         100600     MOVE "SUB-TEST-F2-22 " TO PAR-NAME.                          NC1754.2 230
   001004         100700     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001005         100800*                                                                 NC1754.2
   001006         100900 SUB-INIT-F2-23.                                                  NC1754.2
   001007         101000*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC1754.2
   001008         101100     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1754.2 286
   001009         101200     MOVE     ZERO TO WRK-DS-10V00.                               NC1754.2 IMP 84
   001010         101300 SUB-TEST-F2-23.                                                  NC1754.2
   001011         101400     SUBTRACT A12ONES-DS-12V00                                    NC1754.2 105
   001012         101500              FROM ZERO GIVING WRK-DS-10V00                       NC1754.2 IMP 84
   001013         101600          NOT ON SIZE ERROR                                       NC1754.2
   001014      1  101700              MOVE   "NOT ON SIZE ERROR SHOULD NOT EXECUTED"      NC1754.2
   001015      1  101800                 TO RE-MARK                                       NC1754.2 235
   001016      1  101900              PERFORM FAIL GO TO SUB-WRITE-F2-23.                 NC1754.2 381 1023
   001017         102000     GO       TO SUB-PASS-F2-23.                                  NC1754.2 1021
   001018         102100 SUB-DELETE-F2-23.                                                NC1754.2
   001019         102200     PERFORM  DE-LETE.                                            NC1754.2 382
   001020         102300     GO       TO SUB-WRITE-F2-23.                                 NC1754.2 1023
   001021         102400 SUB-PASS-F2-23.                                                  NC1754.2
   001022         102500     PERFORM  PASS.                                               NC1754.2 380
   001023         102600 SUB-WRITE-F2-23.                                                 NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700     MOVE     "SUB-TEST-F2-23" TO PAR-NAME.                       NC1754.2 230
   001025         102800     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   001026         102900*                                                                 NC1754.2
   001027         103000 SUB-INIT-F2-24.                                                  NC1754.2
   001028         103100*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC1754.2
   001029         103200     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1754.2 286
   001030         103300     MOVE     ZERO TO WRK-DS-06V06.                               NC1754.2 IMP 98
   001031         103400 SUB-TEST-F2-24.                                                  NC1754.2
   001032         103500     SUBTRACT A12THREES-DS-06V06                                  NC1754.2 96
   001033         103600              333333                                              NC1754.2
   001034         103700              A06THREES-DS-03V03                                  NC1754.2 94
   001035         103800              -.0000009 FROM 0000000                              NC1754.2
   001036         103900              GIVING WRK-DS-06V06 ROUNDED                         NC1754.2 98
   001037         104000          NOT ON SIZE ERROR                                       NC1754.2
   001038      1  104100              PERFORM  PASS                                       NC1754.2 380
   001039      1  104200              GO TO SUB-WRITE-F2-24.                              NC1754.2 1047
   001040         104300     GO TO    SUB-FAIL-F2-24.                                     NC1754.2 1044
   001041         104400 SUB-DELETE-F2-24.                                                NC1754.2
   001042         104500     PERFORM  DE-LETE.                                            NC1754.2 382
   001043         104600     GO       TO SUB-WRITE-F2-24.                                 NC1754.2 1047
   001044         104700 SUB-FAIL-F2-24.                                                  NC1754.2
   001045         104800     MOVE    "NOT ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.   NC1754.2 235
   001046         104900     PERFORM  FAIL.                                               NC1754.2 381
   001047         105000 SUB-WRITE-F2-24.                                                 NC1754.2
   001048         105100     MOVE     "SUB-TEST-F2-24" TO PAR-NAME.                       NC1754.2 230
   001049         105200     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   001050         105300*                                                                 NC1754.2
   001051         105400 SUB-INIT-F2-25.                                                  NC1754.2
   001052         105500*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC1754.2
   001053         105600     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1754.2 286
   001054         105700     MOVE     ZERO TO WRK-DS-10V00.                               NC1754.2 IMP 84
   001055         105800 SUB-TEST-F2-25.                                                  NC1754.2
   001056         105900     SUBTRACT A12ONES-DS-12V00                                    NC1754.2 105
   001057         106000              FROM ZERO GIVING WRK-DS-10V00                       NC1754.2 IMP 84
   001058         106100           ON SIZE ERROR                                          NC1754.2
   001059      1  106200              GO TO   SUB-PASS-F2-25                              NC1754.2 1067
   001060         106300       NOT ON SIZE ERROR                                          NC1754.2
   001061      1  106400              MOVE   "NOT ON SIZE ERROR SHOULD NOT EXECUTED"      NC1754.2
   001062      1  106500                 TO RE-MARK                                       NC1754.2 235
   001063      1  106600              PERFORM FAIL GO TO SUB-WRITE-F2-25.                 NC1754.2 381 1069
   001064         106700 SUB-DELETE-F2-25.                                                NC1754.2
   001065         106800     PERFORM  DE-LETE.                                            NC1754.2 382
   001066         106900     GO       TO SUB-WRITE-F2-25.                                 NC1754.2 1069
   001067         107000 SUB-PASS-F2-25.                                                  NC1754.2
   001068         107100     PERFORM  PASS.                                               NC1754.2 380
   001069         107200 SUB-WRITE-F2-25.                                                 NC1754.2
   001070         107300     MOVE     "SUB-TEST-F2-25" TO PAR-NAME.                       NC1754.2 230
   001071         107400     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   001072         107500*                                                                 NC1754.2
   001073         107600 SUB-INIT-F2-26.                                                  NC1754.2
   001074         107700*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC1754.2
   001075         107800     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1754.2 286
   001076         107900     MOVE     ZERO TO WRK-DS-06V06.                               NC1754.2 IMP 98
   001077         108000 SUB-TEST-F2-26.                                                  NC1754.2
   001078         108100     SUBTRACT A12THREES-DS-06V06                                  NC1754.2 96
   001079         108200              333333                                              NC1754.2
   001080         108300              A06THREES-DS-03V03                                  NC1754.2 94
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400            -.0000009 FROM 0000000                                NC1754.2
   001082         108500       GIVING WRK-DS-06V06 ROUNDED                                NC1754.2 98
   001083         108600           ON SIZE ERROR                                          NC1754.2
   001084      1  108700              GO TO    SUB-FAIL-F2-26                             NC1754.2 1091
   001085         108800       NOT ON SIZE ERROR                                          NC1754.2
   001086      1  108900              PERFORM PASS                                        NC1754.2 380
   001087      1  109000              GO TO   SUB-WRITE-F2-26.                            NC1754.2 1094
   001088         109100 SUB-DELETE-F2-26.                                                NC1754.2
   001089         109200     PERFORM  DE-LETE.                                            NC1754.2 382
   001090         109300     GO       TO SUB-WRITE-F2-26.                                 NC1754.2 1094
   001091         109400 SUB-FAIL-F2-26.                                                  NC1754.2
   001092         109500     MOVE    "NOT ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.   NC1754.2 235
   001093         109600     PERFORM  FAIL.                                               NC1754.2 381
   001094         109700 SUB-WRITE-F2-26.                                                 NC1754.2
   001095         109800     MOVE     "SUB-TEST-F2-26" TO PAR-NAME.                       NC1754.2 230
   001096         109900     PERFORM  PRINT-DETAIL.                                       NC1754.2 384
   001097         110000*                                                                 NC1754.2
   001098         110100 SUB-INIT-F2-27.                                                  NC1754.2
   001099         110200*    ==-->   MULTIPLE RESULT FIELDS   <--==                       NC1754.2
   001100         110300     MOVE   "VI-134 6.25.4 GR2" TO ANSI-REFERENCE.                NC1754.2 286
   001101         110400     MOVE   "SUB-TEST-F2-27"    TO PAR-NAME.                      NC1754.2 230
   001102         110500     MOVE    10    TO WRK-DU-2V0-1.                               NC1754.2 42
   001103         110600     MOVE    22.33 TO WRK-DS-2V2-1.                               NC1754.2 65
   001104         110700     MOVE    .3    TO WRK-DU-0V1-1.                               NC1754.2 41
   001105         110800     MOVE    ZERO  TO WRK-DS-2V2-2.                               NC1754.2 IMP 66
   001106         110900     MOVE    ZERO  TO WRK-DS-2V1-1.                               NC1754.2 IMP 64
   001107         111000     MOVE    ZERO  TO WRK-NE-4.                                   NC1754.2 IMP 72
   001108         111100     MOVE    ZERO  TO WRK-NE-6.                                   NC1754.2 IMP 74
   001109         111200     MOVE    ZERO  TO REC-CT.                                     NC1754.2 IMP 277
   001110         111300 SUB-TEST-F2-27-0.                                                NC1754.2
   001111         111400     SUBTRACT WRK-DU-2V0-1  2 WRK-DU-0V1-1 .04 FROM WRK-DS-2V2-1  NC1754.2 42 41 65
   001112         111500         GIVING WRK-DS-2V2-2 WRK-DS-2V1-1 ROUNDED WRK-NE-4        NC1754.2 66 64 72
   001113         111600                WRK-NE-6 ROUNDED                                  NC1754.2 74
   001114         111700     GO TO   SUB-TEST-F2-27-1.                                    NC1754.2 1119
   001115         111800 SUB-DELETE-F2-27.                                                NC1754.2
   001116         111900     PERFORM DE-LETE.                                             NC1754.2 382
   001117         112000     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001118         112100     GO TO   SUB-INIT-F2-28.                                      NC1754.2 1148
   001119         112200 SUB-TEST-F2-27-1.                                                NC1754.2
   001120         112300     MOVE    "SUB-TEST-F2-27-1" TO PAR-NAME.                      NC1754.2 230
   001121         112400     MOVE 1 TO REC-CT.                                            NC1754.2 277
   001122         112500     IF WRK-DS-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1754.2 66 380 384
   001123         112600     ELSE                                                         NC1754.2
   001124      1  112700     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE 09.99      NC1754.2 381 66 242
   001125      1  112800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001126         112900     ADD 1 TO REC-CT.                                             NC1754.2 277
   001127         113000 SUB-TEST-F2-27-2.                                                NC1754.2
   001128         113100     MOVE    "SUB-TEST-F2-27-2" TO PAR-NAME.                      NC1754.2 230
   001129         113200     IF WRK-DS-2V1-1 = 10.0 PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 64 380 384
   001130         113300     ELSE                                                         NC1754.2
   001131      1  113400     PERFORM FAIL MOVE WRK-DS-2V1-1 TO COMPUTED-N MOVE 10.0       NC1754.2 381 64 242
   001132      1  113500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001133         113600     ADD 1 TO REC-CT.                                             NC1754.2 277
   001134         113700 SUB-TEST-F2-27-3.                                                NC1754.2
   001135         113800     MOVE    "SUB-TEST-F2-27-3" TO PAR-NAME.                      NC1754.2 230
   001136         113900     IF WRK-NE-4 = "$*9.99" PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 72 380 384
   001137         114000     ELSE                                                         NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114100     PERFORM FAIL MOVE WRK-NE-4 TO COMPUTED-A MOVE "$*0.00" TO    NC1754.2 381 72 241
   001139      1  114200     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001140         114300     ADD 1 TO REC-CT.                                             NC1754.2 277
   001141         114400 SUB-TEST-F2-27-4.                                                NC1754.2
   001142         114500     MOVE    "SUB-TEST-F2-27-4" TO PAR-NAME.                      NC1754.2 230
   001143         114600     IF WRK-NE-6 = "$*9.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1754.2 74 380 384
   001144         114700     ELSE                                                         NC1754.2
   001145      1  114800     PERFORM FAIL MOVE WRK-NE-6 TO COMPUTED-A MOVE "$*9.99  " TO  NC1754.2 381 74 241
   001146      1  114900     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001147         115000*                                                                 NC1754.2
   001148         115100 SUB-INIT-F2-28.                                                  NC1754.2
   001149         115200*    ==-->   MULTIPLE RESULT FIELDS   <--==                       NC1754.2
   001150         115300*    ==-->          SIZE ERROR        <--==                       NC1754.2
   001151         115400     MOVE   "VI-67 6.4.2"       TO ANSI-REFERENCE.                NC1754.2 286
   001152         115500     MOVE   "SUB-TEST-F2-28"    TO PAR-NAME.                      NC1754.2 230
   001153         115600     MOVE    10    TO WRK-DU-2V0-1.                               NC1754.2 42
   001154         115700     MOVE    22.33 TO WRK-DS-2V2-1.                               NC1754.2 65
   001155         115800     MOVE    .3    TO WRK-DU-0V1-1.                               NC1754.2 41
   001156         115900     MOVE    ZERO  TO WRK-DS-2V2-2.                               NC1754.2 IMP 66
   001157         116000     MOVE    ZERO  TO WRK-DS-2V1-1.                               NC1754.2 IMP 64
   001158         116100     MOVE    ZERO  TO WRK-NE-4.                                   NC1754.2 IMP 72
   001159         116200     MOVE    ZERO  TO WRK-NE-5                                    NC1754.2 IMP 73
   001160         116300     MOVE    ZERO  TO WRK-NE-6.                                   NC1754.2 IMP 74
   001161         116400     MOVE    ZERO  TO REC-CT.                                     NC1754.2 IMP 277
   001162         116500     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001163         116600 SUB-TEST-F2-28-0.                                                NC1754.2
   001164         116700     SUBTRACT A16TWOS-DS-16V00                                    NC1754.2 80
   001165         116800              2 WRK-DU-0V1-1 .04                                  NC1754.2 41
   001166         116900         FROM WRK-DS-2V2-1                                        NC1754.2 65
   001167         117000       GIVING WRK-DS-2V2-2 WRK-DS-2V1-1 ROUNDED WRK-NE-4          NC1754.2 66 64 72
   001168         117100              WRK-NE-5 WRK-NE-6 ROUNDED                           NC1754.2 73 74
   001169         117200           ON SIZE ERROR                                          NC1754.2
   001170      1  117300              MOVE   "A" TO SIZE-ERR2.                            NC1754.2 77
   001171         117400     GO TO   SUB-TEST-F2-28-1.                                    NC1754.2 1176
   001172         117500 SUB-DELETE-F2-28.                                                NC1754.2
   001173         117600     PERFORM DE-LETE.                                             NC1754.2 382
   001174         117700     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001175         117800     GO TO   SUB-INIT-F2-29.                                      NC1754.2 1226
   001176         117900 SUB-TEST-F2-28-1.                                                NC1754.2
   001177         118000     MOVE    "SUB-TEST-F2-28-1" TO PAR-NAME.                      NC1754.2 230
   001178         118100     MOVE 1 TO REC-CT.                                            NC1754.2 277
   001179         118200     IF WRK-DS-2V2-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 66 IMP 380 384
   001180         118300     ELSE                                                         NC1754.2
   001181      1  118400     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE ZERO       NC1754.2 381 66 242 IMP
   001182      1  118500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001183         118600     ADD 1 TO REC-CT.                                             NC1754.2 277
   001184         118700 SUB-TEST-F2-28-2.                                                NC1754.2
   001185         118800     MOVE    "SUB-TEST-F2-28-2" TO PAR-NAME.                      NC1754.2 230
   001186         118900     IF WRK-DS-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 64 IMP 380 384
   001187         119000     ELSE                                                         NC1754.2
   001188      1  119100     PERFORM FAIL MOVE WRK-DS-2V1-1 TO COMPUTED-N MOVE ZERO       NC1754.2 381 64 242 IMP
   001189      1  119200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001190         119300     ADD 1 TO REC-CT.                                             NC1754.2 277
   001191         119400 SUB-TEST-F2-28-3.                                                NC1754.2
   001192         119500     MOVE    "SUB-TEST-F2-28-3" TO PAR-NAME.                      NC1754.2 230
   001193         119600     IF WRK-NE-4 = "$*0.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 72 380 384
   001194         119700     ELSE                                                         NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195      1  119800     PERFORM FAIL MOVE WRK-NE-4 TO COMPUTED-A MOVE "$*0.00" TO    NC1754.2 381 72 241
   001196      1  119900     CORRECT-X PERFORM PRINT-DETAIL.                              NC1754.2 254 384
   001197         120000     ADD 1 TO REC-CT.                                             NC1754.2 277
   001198         120100 SUB-TEST-F2-28-4.                                                NC1754.2
   001199         120200     MOVE    "SUB-TEST-F2-28-4" TO PAR-NAME.                      NC1754.2 230
   001200         120300     IF WRK-NE-5 = "*.**" PERFORM PASS PERFORM PRINT-DETAIL       NC1754.2 73 380 384
   001201         120400     ELSE                                                         NC1754.2
   001202      1  120500     PERFORM FAIL MOVE WRK-NE-5 TO COMPUTED-A MOVE "*.**"         NC1754.2 381 73 241
   001203      1  120600     TO CORRECT-X PERFORM PRINT-DETAIL.                           NC1754.2 254 384
   001204         120700     ADD 1 TO REC-CT.                                             NC1754.2 277
   001205         120800 SUB-TEST-F2-28-5.                                                NC1754.2
   001206         120900     MOVE   "SUB-TEST-F2-28-5" TO PAR-NAME.                       NC1754.2 230
   001207         121000     IF WRK-NE-6 = "***.****"                                     NC1754.2 74
   001208      1  121100           PERFORM PASS  PERFORM PRINT-DETAIL                     NC1754.2 380 384
   001209         121200     ELSE                                                         NC1754.2
   001210      1  121300     PERFORM FAIL MOVE WRK-NE-6 TO COMPUTED-A MOVE "***.****"     NC1754.2 381 74 241
   001211      1  121400     TO CORRECT-X PERFORM PRINT-DETAIL.                           NC1754.2 254 384
   001212         121500     ADD 1 TO REC-CT.                                             NC1754.2 277
   001213         121600 SUB-TEST-F2-28-6.                                                NC1754.2
   001214         121700     MOVE   "SUB-TEST-F2-28-6" TO PAR-NAME.                       NC1754.2 230
   001215         121800     IF      SIZE-ERR2 = "A"                                      NC1754.2 77
   001216      1  121900             PERFORM PASS                                         NC1754.2 380
   001217      1  122000             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001218         122100     ELSE                                                         NC1754.2
   001219      1  122200             MOVE   "A"        TO CORRECT-X                       NC1754.2 254
   001220      1  122300             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001221      1  122400             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1754.2
   001222      1  122500                  TO RE-MARK                                      NC1754.2 235
   001223      1  122600             PERFORM FAIL                                         NC1754.2 381
   001224      1  122700             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001225         122800*                                                                 NC1754.2
   001226         122900 SUB-INIT-F2-29.                                                  NC1754.2
   001227         123000*    ==-->   MULTIPLE RESULT FIELDS   <--==                       NC1754.2
   001228         123100*    ==-->       NO SIZE ERROR        <--==                       NC1754.2
   001229         123200     MOVE   "VI-67 6.4.2"       TO ANSI-REFERENCE.                NC1754.2 286
   001230         123300     MOVE   "SUB-TEST-F2-29"    TO PAR-NAME.                      NC1754.2 230
   001231         123400     MOVE    10    TO WRK-DU-2V0-1.                               NC1754.2 42
   001232         123500     MOVE    22.33 TO WRK-DS-2V2-1.                               NC1754.2 65
   001233         123600     MOVE    .3    TO WRK-DU-0V1-1.                               NC1754.2 41
   001234         123700     MOVE    ZERO  TO WRK-DS-2V2-2.                               NC1754.2 IMP 66
   001235         123800     MOVE    ZERO  TO WRK-DS-2V1-1.                               NC1754.2 IMP 64
   001236         123900     MOVE    ZERO  TO WRK-NE-4.                                   NC1754.2 IMP 72
   001237         124000     MOVE    ZERO  TO WRK-NE-6.                                   NC1754.2 IMP 74
   001238         124100     MOVE    ZERO  TO REC-CT.                                     NC1754.2 IMP 277
   001239         124200     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001240         124300 SUB-TEST-F2-29-0.                                                NC1754.2
   001241         124400     SUBTRACT WRK-DU-2V0-1  2 WRK-DU-0V1-1 .04 FROM WRK-DS-2V2-1  NC1754.2 42 41 65
   001242         124500         GIVING WRK-DS-2V2-2 WRK-DS-2V1-1 ROUNDED WRK-NE-4        NC1754.2 66 64 72
   001243         124600                WRK-NE-6 ROUNDED                                  NC1754.2 74
   001244         124700          ON SIZE ERROR                                           NC1754.2
   001245      1  124800             MOVE   "A" TO SIZE-ERR2.                             NC1754.2 77
   001246         124900     GO TO   SUB-TEST-F2-29-1.                                    NC1754.2 1251
   001247         125000 SUB-DELETE-F2-29.                                                NC1754.2
   001248         125100     PERFORM DE-LETE.                                             NC1754.2 382
   001249         125200     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001250         125300     GO TO   SUB-INIT-F2-30.                                      NC1754.2 1293
   001251         125400 SUB-TEST-F2-29-1.                                                NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     MOVE    "SUB-TEST-F2-29-1" TO PAR-NAME.                      NC1754.2 230
   001253         125600     MOVE 1 TO REC-CT.                                            NC1754.2 277
   001254         125700     IF WRK-DS-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1754.2 66 380 384
   001255         125800     ELSE                                                         NC1754.2
   001256      1  125900     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE 09.99      NC1754.2 381 66 242
   001257      1  126000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001258         126100     ADD 1 TO REC-CT.                                             NC1754.2 277
   001259         126200 SUB-TEST-F2-29-2.                                                NC1754.2
   001260         126300     MOVE    "SUB-TEST-F2-29-2" TO PAR-NAME.                      NC1754.2 230
   001261         126400     IF WRK-DS-2V1-1 = 10.0 PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 64 380 384
   001262         126500     ELSE                                                         NC1754.2
   001263      1  126600     PERFORM FAIL MOVE WRK-DS-2V1-1 TO COMPUTED-N MOVE 10.0       NC1754.2 381 64 242
   001264      1  126700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001265         126800     ADD 1 TO REC-CT.                                             NC1754.2 277
   001266         126900 SUB-TEST-F2-29-3.                                                NC1754.2
   001267         127000     MOVE    "SUB-TEST-F2-29-3" TO PAR-NAME.                      NC1754.2 230
   001268         127100     IF WRK-NE-4 = "$*9.99" PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 72 380 384
   001269         127200     ELSE                                                         NC1754.2
   001270      1  127300     PERFORM FAIL MOVE WRK-NE-4 TO COMPUTED-A MOVE "$*9.99" TO    NC1754.2 381 72 241
   001271      1  127400     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001272         127500     ADD 1 TO REC-CT.                                             NC1754.2 277
   001273         127600 SUB-TEST-F2-29-4.                                                NC1754.2
   001274         127700     MOVE    "SUB-TEST-F2-29-4" TO PAR-NAME.                      NC1754.2 230
   001275         127800     IF WRK-NE-6 = "$*9.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1754.2 74 380 384
   001276         127900     ELSE                                                         NC1754.2
   001277      1  128000     PERFORM FAIL MOVE WRK-NE-6 TO COMPUTED-A MOVE "$*9.99  " TO  NC1754.2 381 74 241
   001278      1  128100     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001279         128200     ADD 1 TO REC-CT.                                             NC1754.2 277
   001280         128300 SUB-TEST-F2-29-5.                                                NC1754.2
   001281         128400     MOVE    "SUB-TEST-F2-29-5" TO PAR-NAME.                      NC1754.2 230
   001282         128500     IF      SIZE-ERR2  = SPACE                                   NC1754.2 77 IMP
   001283      1  128600             PERFORM PASS                                         NC1754.2 380
   001284      1  128700             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001285         128800     ELSE                                                         NC1754.2
   001286      1  128900             MOVE    SPACE     TO CORRECT-X                       NC1754.2 IMP 254
   001287      1  129000             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001288      1  129100             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1754.2
   001289      1  129200                  TO RE-MARK                                      NC1754.2 235
   001290      1  129300             PERFORM FAIL                                         NC1754.2 381
   001291      1  129400             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001292         129500*                                                                 NC1754.2
   001293         129600 SUB-INIT-F2-30.                                                  NC1754.2
   001294         129700*    ==-->   MULTIPLE RESULT FIELDS   <--==                       NC1754.2
   001295         129800*    ==-->          SIZE ERROR        <--==                       NC1754.2
   001296         129900     MOVE   "VI-67 6.4.2"       TO ANSI-REFERENCE.                NC1754.2 286
   001297         130000     MOVE   "SUB-TEST-F2-30"    TO PAR-NAME.                      NC1754.2 230
   001298         130100     MOVE    10    TO WRK-DU-2V0-1.                               NC1754.2 42
   001299         130200     MOVE    22.33 TO WRK-DS-2V2-1.                               NC1754.2 65
   001300         130300     MOVE    .3    TO WRK-DU-0V1-1.                               NC1754.2 41
   001301         130400     MOVE    ZERO  TO WRK-DS-2V2-2.                               NC1754.2 IMP 66
   001302         130500     MOVE    ZERO  TO WRK-DS-2V1-1.                               NC1754.2 IMP 64
   001303         130600     MOVE    ZERO  TO WRK-NE-4.                                   NC1754.2 IMP 72
   001304         130700     MOVE    ZERO  TO WRK-NE-5                                    NC1754.2 IMP 73
   001305         130800     MOVE    ZERO  TO WRK-NE-6.                                   NC1754.2 IMP 74
   001306         130900     MOVE    ZERO  TO REC-CT.                                     NC1754.2 IMP 277
   001307         131000     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001308         131100 SUB-TEST-F2-30-0.                                                NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     SUBTRACT A16TWOS-DS-16V00                                    NC1754.2 80
   001310         131300              2 WRK-DU-0V1-1 .04                                  NC1754.2 41
   001311         131400         FROM WRK-DS-2V2-1                                        NC1754.2 65
   001312         131500       GIVING WRK-DS-2V2-2 WRK-DS-2V1-1 ROUNDED WRK-NE-4          NC1754.2 66 64 72
   001313         131600              WRK-NE-5 WRK-NE-6 ROUNDED                           NC1754.2 73 74
   001314         131700       NOT ON SIZE ERROR                                          NC1754.2
   001315      1  131800              MOVE   "A" TO SIZE-ERR2.                            NC1754.2 77
   001316         131900     GO TO   SUB-TEST-F2-30-1.                                    NC1754.2 1321
   001317         132000 SUB-DELETE-F2-30.                                                NC1754.2
   001318         132100     PERFORM DE-LETE.                                             NC1754.2 382
   001319         132200     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001320         132300     GO TO   SUB-INIT-F2-31.                                      NC1754.2 1371
   001321         132400 SUB-TEST-F2-30-1.                                                NC1754.2
   001322         132500     MOVE    "SUB-TEST-F2-30-1" TO PAR-NAME.                      NC1754.2 230
   001323         132600     MOVE 1 TO REC-CT.                                            NC1754.2 277
   001324         132700     IF WRK-DS-2V2-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 66 IMP 380 384
   001325         132800     ELSE                                                         NC1754.2
   001326      1  132900     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE ZERO       NC1754.2 381 66 242 IMP
   001327      1  133000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001328         133100     ADD 1 TO REC-CT.                                             NC1754.2 277
   001329         133200 SUB-TEST-F2-30-2.                                                NC1754.2
   001330         133300     MOVE    "SUB-TEST-F2-30-2" TO PAR-NAME.                      NC1754.2 230
   001331         133400     IF WRK-DS-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 64 IMP 380 384
   001332         133500     ELSE                                                         NC1754.2
   001333      1  133600     PERFORM FAIL MOVE WRK-DS-2V1-1 TO COMPUTED-N MOVE ZERO       NC1754.2 381 64 242 IMP
   001334      1  133700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001335         133800     ADD 1 TO REC-CT.                                             NC1754.2 277
   001336         133900 SUB-TEST-F2-30-3.                                                NC1754.2
   001337         134000     MOVE    "SUB-TEST-F2-30-3" TO PAR-NAME.                      NC1754.2 230
   001338         134100     IF WRK-NE-4 = "$*0.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 72 380 384
   001339         134200     ELSE                                                         NC1754.2
   001340      1  134300     PERFORM FAIL MOVE WRK-NE-4 TO COMPUTED-A MOVE "$*0.00" to    NC1754.2 381 72 241
   001341      1  134400     CORRECT-X PERFORM PRINT-DETAIL.                              NC1754.2 254 384
   001342         134500     ADD 1 TO REC-CT.                                             NC1754.2 277
   001343         134600 SUB-TEST-F2-30-4.                                                NC1754.2
   001344         134700     MOVE    "SUB-TEST-F2-30-4" TO PAR-NAME.                      NC1754.2 230
   001345         134800     IF WRK-NE-5 = "*.**" PERFORM PASS PERFORM PRINT-DETAIL       NC1754.2 73 380 384
   001346         134900     ELSE                                                         NC1754.2
   001347      1  135000     PERFORM FAIL MOVE WRK-NE-5 TO COMPUTED-A MOVE "*.**"         NC1754.2 381 73 241
   001348      1  135100     TO CORRECT-X PERFORM PRINT-DETAIL.                           NC1754.2 254 384
   001349         135200     ADD 1 TO REC-CT.                                             NC1754.2 277
   001350         135300 SUB-TEST-F2-30-5.                                                NC1754.2
   001351         135400     MOVE   "SUB-TEST-F2-30-5" TO PAR-NAME.                       NC1754.2 230
   001352         135500     IF WRK-NE-6 = "***.****"                                     NC1754.2 74
   001353      1  135600        PERFORM PASS PERFORM PRINT-DETAIL                         NC1754.2 380 384
   001354         135700     ELSE                                                         NC1754.2
   001355      1  135800     PERFORM FAIL MOVE WRK-NE-6 TO COMPUTED-A MOVE "***.****"     NC1754.2 381 74 241
   001356      1  135900     TO CORRECT-X PERFORM PRINT-DETAIL.                           NC1754.2 254 384
   001357         136000     ADD 1 TO REC-CT.                                             NC1754.2 277
   001358         136100 SUB-TEST-F2-30-6.                                                NC1754.2
   001359         136200     MOVE   "SUB-TEST-F2-30-6" TO PAR-NAME.                       NC1754.2 230
   001360         136300     IF      SIZE-ERR2 = SPACE                                    NC1754.2 77 IMP
   001361      1  136400             PERFORM PASS                                         NC1754.2 380
   001362      1  136500             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001363         136600     ELSE                                                         NC1754.2
   001364      1  136700             MOVE    SPACE     TO CORRECT-X                       NC1754.2 IMP 254
   001365      1  136800             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366      1  136900             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1754.2
   001367      1  137000                  TO RE-MARK                                      NC1754.2 235
   001368      1  137100             PERFORM FAIL                                         NC1754.2 381
   001369      1  137200             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001370         137300*                                                                 NC1754.2
   001371         137400 SUB-INIT-F2-31.                                                  NC1754.2
   001372         137500*    ==-->   MULTIPLE RESULT FIELDS   <--==                       NC1754.2
   001373         137600*    ==-->       NO SIZE ERROR        <--==                       NC1754.2
   001374         137700     MOVE   "VI-67 6.4.2"       TO ANSI-REFERENCE.                NC1754.2 286
   001375         137800     MOVE   "SUB-TEST-F2-31"    TO PAR-NAME.                      NC1754.2 230
   001376         137900     MOVE    10    TO WRK-DU-2V0-1.                               NC1754.2 42
   001377         138000     MOVE    22.33 TO WRK-DS-2V2-1.                               NC1754.2 65
   001378         138100     MOVE    .3    TO WRK-DU-0V1-1.                               NC1754.2 41
   001379         138200     MOVE    ZERO  TO WRK-DS-2V2-2.                               NC1754.2 IMP 66
   001380         138300     MOVE    ZERO  TO WRK-DS-2V1-1.                               NC1754.2 IMP 64
   001381         138400     MOVE    ZERO  TO WRK-NE-4.                                   NC1754.2 IMP 72
   001382         138500     MOVE    ZERO  TO WRK-NE-6.                                   NC1754.2 IMP 74
   001383         138600     MOVE    ZERO  TO REC-CT.                                     NC1754.2 IMP 277
   001384         138700     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001385         138800 SUB-TEST-F2-31-0.                                                NC1754.2
   001386         138900     SUBTRACT WRK-DU-2V0-1  2 WRK-DU-0V1-1 .04 FROM WRK-DS-2V2-1  NC1754.2 42 41 65
   001387         139000         GIVING WRK-DS-2V2-2 WRK-DS-2V1-1 ROUNDED WRK-NE-4        NC1754.2 66 64 72
   001388         139100                WRK-NE-6 ROUNDED                                  NC1754.2 74
   001389         139200      NOT ON SIZE ERROR                                           NC1754.2
   001390      1  139300             MOVE   "A" TO SIZE-ERR2.                             NC1754.2 77
   001391         139400     GO TO   SUB-TEST-F2-31-1.                                    NC1754.2 1396
   001392         139500 SUB-DELETE-F2-31.                                                NC1754.2
   001393         139600     PERFORM DE-LETE.                                             NC1754.2 382
   001394         139700     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001395         139800     GO TO   SUB-INIT-F2-32.                                      NC1754.2 1438
   001396         139900 SUB-TEST-F2-31-1.                                                NC1754.2
   001397         140000     MOVE    "SUB-TEST-F2-31-1" TO PAR-NAME.                      NC1754.2 230
   001398         140100     MOVE 1 TO REC-CT.                                            NC1754.2 277
   001399         140200     IF WRK-DS-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1754.2 66 380 384
   001400         140300     ELSE                                                         NC1754.2
   001401      1  140400     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE 09.99      NC1754.2 381 66 242
   001402      1  140500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001403         140600     ADD 1 TO REC-CT.                                             NC1754.2 277
   001404         140700 SUB-TEST-F2-31-2.                                                NC1754.2
   001405         140800     MOVE    "SUB-TEST-F2-31-2" TO PAR-NAME.                      NC1754.2 230
   001406         140900     IF WRK-DS-2V1-1 = 10.0 PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 64 380 384
   001407         141000     ELSE                                                         NC1754.2
   001408      1  141100     PERFORM FAIL MOVE WRK-DS-2V1-1 TO COMPUTED-N MOVE 10.0       NC1754.2 381 64 242
   001409      1  141200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001410         141300     ADD 1 TO REC-CT.                                             NC1754.2 277
   001411         141400 SUB-TEST-F2-31-3.                                                NC1754.2
   001412         141500     MOVE    "SUB-TEST-F2-31-3" TO PAR-NAME.                      NC1754.2 230
   001413         141600     IF WRK-NE-4 = "$*9.99" PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 72 380 384
   001414         141700     ELSE                                                         NC1754.2
   001415      1  141800     PERFORM FAIL MOVE WRK-NE-4 TO COMPUTED-A MOVE "$*9.99" TO    NC1754.2 381 72 241
   001416      1  141900     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001417         142000     ADD 1 TO REC-CT.                                             NC1754.2 277
   001418         142100 SUB-TEST-F2-31-4.                                                NC1754.2
   001419         142200     MOVE    "SUB-TEST-F2-31-4" TO PAR-NAME.                      NC1754.2 230
   001420         142300     IF WRK-NE-6 = "$*9.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1754.2 74 380 384
   001421         142400     ELSE                                                         NC1754.2
   001422      1  142500     PERFORM FAIL MOVE WRK-NE-6 TO COMPUTED-A MOVE "$*9.99  " TO  NC1754.2 381 74 241
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423      1  142600     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001424         142700     ADD 1 TO REC-CT.                                             NC1754.2 277
   001425         142800 SUB-TEST-F2-31-5.                                                NC1754.2
   001426         142900     MOVE    "SUB-TEST-F2-31-5" TO PAR-NAME.                      NC1754.2 230
   001427         143000     IF      SIZE-ERR2  = "A"                                     NC1754.2 77
   001428      1  143100             PERFORM PASS                                         NC1754.2 380
   001429      1  143200             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001430         143300     ELSE                                                         NC1754.2
   001431      1  143400             MOVE   "A"        TO CORRECT-X                       NC1754.2 254
   001432      1  143500             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001433      1  143600             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1754.2
   001434      1  143700                  TO RE-MARK                                      NC1754.2 235
   001435      1  143800             PERFORM FAIL                                         NC1754.2 381
   001436      1  143900             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001437         144000*                                                                 NC1754.2
   001438         144100 SUB-INIT-F2-32.                                                  NC1754.2
   001439         144200*    ==-->   MULTIPLE RESULT FIELDS   <--==                       NC1754.2
   001440         144300*    ==-->          SIZE ERROR        <--==                       NC1754.2
   001441         144400     MOVE   "VI-67 6.4.2"       TO ANSI-REFERENCE.                NC1754.2 286
   001442         144500     MOVE   "SUB-TEST-F2-32"    TO PAR-NAME.                      NC1754.2 230
   001443         144600     MOVE    10    TO WRK-DU-2V0-1.                               NC1754.2 42
   001444         144700     MOVE    22.33 TO WRK-DS-2V2-1.                               NC1754.2 65
   001445         144800     MOVE    .3    TO WRK-DU-0V1-1.                               NC1754.2 41
   001446         144900     MOVE    ZERO  TO WRK-DS-2V2-2.                               NC1754.2 IMP 66
   001447         145000     MOVE    ZERO  TO WRK-DS-2V1-1.                               NC1754.2 IMP 64
   001448         145100     MOVE    ZERO  TO WRK-NE-4.                                   NC1754.2 IMP 72
   001449         145200     MOVE    ZERO  TO WRK-NE-5                                    NC1754.2 IMP 73
   001450         145300     MOVE    ZERO  TO WRK-NE-6.                                   NC1754.2 IMP 74
   001451         145400     MOVE    ZERO  TO REC-CT.                                     NC1754.2 IMP 277
   001452         145500     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001453         145600 SUB-TEST-F2-32-0.                                                NC1754.2
   001454         145700     SUBTRACT A16TWOS-DS-16V00                                    NC1754.2 80
   001455         145800              2 WRK-DU-0V1-1 .04                                  NC1754.2 41
   001456         145900         FROM WRK-DS-2V2-1                                        NC1754.2 65
   001457         146000       GIVING WRK-DS-2V2-2 WRK-DS-2V1-1 ROUNDED WRK-NE-4          NC1754.2 66 64 72
   001458         146100              WRK-NE-5 WRK-NE-6 ROUNDED                           NC1754.2 73 74
   001459         146200           ON SIZE ERROR                                          NC1754.2
   001460      1  146300              MOVE   "A" TO SIZE-ERR2                             NC1754.2 77
   001461         146400       NOT ON SIZE ERROR                                          NC1754.2
   001462      1  146500              MOVE   "B" TO SIZE-ERR2.                            NC1754.2 77
   001463         146600     GO TO   SUB-TEST-F2-32-1.                                    NC1754.2 1468
   001464         146700 SUB-DELETE-F2-32.                                                NC1754.2
   001465         146800     PERFORM DE-LETE.                                             NC1754.2 382
   001466         146900     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001467         147000     GO TO   SUB-INIT-F2-33.                                      NC1754.2 1518
   001468         147100 SUB-TEST-F2-32-1.                                                NC1754.2
   001469         147200     MOVE    "SUB-TEST-F2-32-1" TO PAR-NAME.                      NC1754.2 230
   001470         147300     MOVE 1 TO REC-CT.                                            NC1754.2 277
   001471         147400     IF WRK-DS-2V2-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 66 IMP 380 384
   001472         147500     ELSE                                                         NC1754.2
   001473      1  147600     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE ZERO       NC1754.2 381 66 242 IMP
   001474      1  147700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001475         147800     ADD 1 TO REC-CT.                                             NC1754.2 277
   001476         147900 SUB-TEST-F2-32-2.                                                NC1754.2
   001477         148000     MOVE    "SUB-TEST-F2-32-2" TO PAR-NAME.                      NC1754.2 230
   001478         148100     IF WRK-DS-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 64 IMP 380 384
   001479         148200     ELSE                                                         NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480      1  148300     PERFORM FAIL MOVE WRK-DS-2V1-1 TO COMPUTED-N MOVE ZERO       NC1754.2 381 64 242 IMP
   001481      1  148400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001482         148500     ADD 1 TO REC-CT.                                             NC1754.2 277
   001483         148600 SUB-TEST-F2-32-3.                                                NC1754.2
   001484         148700     MOVE    "SUB-TEST-F2-32-3" TO PAR-NAME.                      NC1754.2 230
   001485         148800     IF WRK-NE-4 = "$*0.00" PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 72 380 384
   001486         148900     ELSE                                                         NC1754.2
   001487      1  149000     PERFORM FAIL MOVE WRK-NE-4 TO COMPUTED-A MOVE "$*0.00"       NC1754.2 381 72 241
   001488      1  149100     TO CORRECT-X PERFORM PRINT-DETAIL.                           NC1754.2 254 384
   001489         149200     ADD 1 TO REC-CT.                                             NC1754.2 277
   001490         149300 SUB-TEST-F2-32-4.                                                NC1754.2
   001491         149400     MOVE    "SUB-TEST-F2-32-4" TO PAR-NAME.                      NC1754.2 230
   001492         149500     IF WRK-NE-5 = "*.**" PERFORM PASS PERFORM PRINT-DETAIL       NC1754.2 73 380 384
   001493         149600     ELSE                                                         NC1754.2
   001494      1  149700     PERFORM FAIL MOVE WRK-NE-5 TO COMPUTED-A MOVE "*.**"         NC1754.2 381 73 241
   001495      1  149800     TO CORRECT-X PERFORM PRINT-DETAIL.                           NC1754.2 254 384
   001496         149900     ADD 1 TO REC-CT.                                             NC1754.2 277
   001497         150000 SUB-TEST-F2-32-5.                                                NC1754.2
   001498         150100     MOVE   "SUB-TEST-F2-32-5" TO PAR-NAME.                       NC1754.2 230
   001499         150200     IF WRK-NE-6 = "***.****"                                     NC1754.2 74
   001500      1  150300        PERFORM PASS  PERFORM PRINT-DETAIL                        NC1754.2 380 384
   001501         150400     ELSE                                                         NC1754.2
   001502      1  150500     PERFORM FAIL MOVE WRK-NE-6 TO COMPUTED-A MOVE "***.****"     NC1754.2 381 74 241
   001503      1  150600     TO CORRECT-X PERFORM PRINT-DETAIL.                           NC1754.2 254 384
   001504         150700     ADD 1 TO REC-CT.                                             NC1754.2 277
   001505         150800 SUB-TEST-F2-32-6.                                                NC1754.2
   001506         150900     MOVE   "SUB-TEST-F2-32-6" TO PAR-NAME.                       NC1754.2 230
   001507         151000     IF      SIZE-ERR2 = "A"                                      NC1754.2 77
   001508      1  151100             PERFORM PASS                                         NC1754.2 380
   001509      1  151200             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001510         151300     ELSE                                                         NC1754.2
   001511      1  151400             MOVE   "A"        TO CORRECT-X                       NC1754.2 254
   001512      1  151500             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001513      1  151600             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1754.2
   001514      1  151700                  TO RE-MARK                                      NC1754.2 235
   001515      1  151800             PERFORM FAIL                                         NC1754.2 381
   001516      1  151900             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001517         152000*                                                                 NC1754.2
   001518         152100 SUB-INIT-F2-33.                                                  NC1754.2
   001519         152200*    ==-->   MULTIPLE RESULT FIELDS   <--==                       NC1754.2
   001520         152300*    ==-->       NO SIZE ERROR        <--==                       NC1754.2
   001521         152400     MOVE   "VI-67 6.4.2"       TO ANSI-REFERENCE.                NC1754.2 286
   001522         152500     MOVE   "SUB-TEST-F2-33"    TO PAR-NAME.                      NC1754.2 230
   001523         152600     MOVE    10    TO WRK-DU-2V0-1.                               NC1754.2 42
   001524         152700     MOVE    22.33 TO WRK-DS-2V2-1.                               NC1754.2 65
   001525         152800     MOVE    .3    TO WRK-DU-0V1-1.                               NC1754.2 41
   001526         152900     MOVE    ZERO  TO WRK-DS-2V2-2.                               NC1754.2 IMP 66
   001527         153000     MOVE    ZERO  TO WRK-DS-2V1-1.                               NC1754.2 IMP 64
   001528         153100     MOVE    ZERO  TO WRK-NE-4.                                   NC1754.2 IMP 72
   001529         153200     MOVE    ZERO  TO WRK-NE-6.                                   NC1754.2 IMP 74
   001530         153300     MOVE    ZERO  TO REC-CT.                                     NC1754.2 IMP 277
   001531         153400     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001532         153500 SUB-TEST-F2-33-0.                                                NC1754.2
   001533         153600     SUBTRACT WRK-DU-2V0-1  2 WRK-DU-0V1-1 .04 FROM WRK-DS-2V2-1  NC1754.2 42 41 65
   001534         153700         GIVING WRK-DS-2V2-2 WRK-DS-2V1-1 ROUNDED WRK-NE-4        NC1754.2 66 64 72
   001535         153800                WRK-NE-6 ROUNDED                                  NC1754.2 74
   001536         153900          ON SIZE ERROR                                           NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537      1  154000             MOVE   "A" TO SIZE-ERR2                              NC1754.2 77
   001538         154100      NOT ON SIZE ERROR                                           NC1754.2
   001539      1  154200             MOVE   "B" TO SIZE-ERR2.                             NC1754.2 77
   001540         154300     GO TO   SUB-TEST-F2-33-1.                                    NC1754.2 1545
   001541         154400 SUB-DELETE-F2-33.                                                NC1754.2
   001542         154500     PERFORM DE-LETE.                                             NC1754.2 382
   001543         154600     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001544         154700     GO TO   SUB-INIT-F2-34.                                      NC1754.2 1587
   001545         154800 SUB-TEST-F2-33-1.                                                NC1754.2
   001546         154900     MOVE    "SUB-TEST-F2-33-1" TO PAR-NAME.                      NC1754.2 230
   001547         155000     MOVE 1 TO REC-CT.                                            NC1754.2 277
   001548         155100     IF WRK-DS-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1754.2 66 380 384
   001549         155200     ELSE                                                         NC1754.2
   001550      1  155300     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE 09.99      NC1754.2 381 66 242
   001551      1  155400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001552         155500     ADD 1 TO REC-CT.                                             NC1754.2 277
   001553         155600 SUB-TEST-F2-33-2.                                                NC1754.2
   001554         155700     MOVE    "SUB-TEST-F2-33-2" TO PAR-NAME.                      NC1754.2 230
   001555         155800     IF WRK-DS-2V1-1 = 10.0 PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 64 380 384
   001556         155900     ELSE                                                         NC1754.2
   001557      1  156000     PERFORM FAIL MOVE WRK-DS-2V1-1 TO COMPUTED-N MOVE 10.0       NC1754.2 381 64 242
   001558      1  156100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1754.2 256 384
   001559         156200     ADD 1 TO REC-CT.                                             NC1754.2 277
   001560         156300 SUB-TEST-F2-33-3.                                                NC1754.2
   001561         156400     MOVE    "SUB-TEST-F2-33-3" TO PAR-NAME.                      NC1754.2 230
   001562         156500     IF WRK-NE-4 = "$*9.99" PERFORM PASS PERFORM PRINT-DETAIL     NC1754.2 72 380 384
   001563         156600     ELSE                                                         NC1754.2
   001564      1  156700     PERFORM FAIL MOVE WRK-NE-4 TO COMPUTED-A MOVE "$*9.99" TO    NC1754.2 381 72 241
   001565      1  156800     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001566         156900     ADD 1 TO REC-CT.                                             NC1754.2 277
   001567         157000 SUB-TEST-F2-33-4.                                                NC1754.2
   001568         157100     MOVE    "SUB-TEST-F2-33-4" TO PAR-NAME.                      NC1754.2 230
   001569         157200     IF WRK-NE-6 = "$*9.99  " PERFORM PASS PERFORM PRINT-DETAIL   NC1754.2 74 380 384
   001570         157300     ELSE                                                         NC1754.2
   001571      1  157400     PERFORM FAIL MOVE WRK-NE-6 TO COMPUTED-A MOVE "$*9.99  " TO  NC1754.2 381 74 241
   001572      1  157500     CORRECT-A PERFORM PRINT-DETAIL.                              NC1754.2 255 384
   001573         157600     ADD 1 TO REC-CT.                                             NC1754.2 277
   001574         157700 SUB-TEST-F2-33-5.                                                NC1754.2
   001575         157800     MOVE    "SUB-TEST-F2-33-5" TO PAR-NAME.                      NC1754.2 230
   001576         157900     IF      SIZE-ERR2  = "B"                                     NC1754.2 77
   001577      1  158000             PERFORM PASS                                         NC1754.2 380
   001578      1  158100             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001579         158200     ELSE                                                         NC1754.2
   001580      1  158300             MOVE   "B"        TO CORRECT-X                       NC1754.2 254
   001581      1  158400             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001582      1  158500             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1754.2
   001583      1  158600                  TO RE-MARK                                      NC1754.2 235
   001584      1  158700             PERFORM FAIL                                         NC1754.2 381
   001585      1  158800             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001586         158900*                                                                 NC1754.2
   001587         159000 SUB-INIT-F2-34.                                                  NC1754.2
   001588         159100*    ==-->  EXPLICIT SCOPE TERMINATOR <--==                       NC1754.2
   001589         159200*    ==-->          SIZE ERROR        <--==                       NC1754.2
   001590         159300     MOVE   "IV-41 6.4.3"       TO ANSI-REFERENCE.                NC1754.2 286
   001591         159400     MOVE     ZERO TO WRK-DS-10V00.                               NC1754.2 IMP 84
   001592         159500     MOVE    SPACE TO WRK-XN-00001.                               NC1754.2 IMP 40
   001593         159600     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700     MOVE    SPACE TO SIZE-ERR3.                                  NC1754.2 IMP 78
   001595         159800     MOVE    SPACE TO SIZE-ERR4.                                  NC1754.2 IMP 79
   001596         159900     MOVE    1  TO REC-CT.                                        NC1754.2 277
   001597         160000 SUB-TEST-F2-34-0.                                                NC1754.2
   001598         160100     SUBTRACT A12ONES-DS-12V00                                    NC1754.2 105
   001599         160200        FROM ZERO GIVING WRK-DS-10V00                             NC1754.2 IMP 84
   001600         160300          ON SIZE ERROR                                           NC1754.2
   001601      1  160400             MOVE   "1" TO WRK-XN-00001                           NC1754.2 40
   001602      1  160500             MOVE   "A" TO SIZE-ERR2                              NC1754.2 77
   001603      1  160600             MOVE   "B" TO SIZE-ERR3                              NC1754.2 78
   001604         160700     END-SUBTRACT                                                 NC1754.2
   001605         160800     MOVE   "C" TO SIZE-ERR4.                                     NC1754.2 79
   001606         160900     GO TO   SUB-TEST-F2-34-1.                                    NC1754.2 1611
   001607         161000 SUB-DELETE-F2-34.                                                NC1754.2
   001608         161100     PERFORM DE-LETE.                                             NC1754.2 382
   001609         161200     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001610         161300     GO TO   SUB-INIT-F2-35.                                      NC1754.2 1676
   001611         161400 SUB-TEST-F2-34-1.                                                NC1754.2
   001612         161500     MOVE   "SUB-TEST-F2-34-1" TO PAR-NAME.                       NC1754.2 230
   001613         161600     IF      WRK-XN-00001 = "1"                                   NC1754.2 40
   001614      1  161700             PERFORM PASS                                         NC1754.2 380
   001615      1  161800             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001616         161900     ELSE                                                         NC1754.2
   001617      1  162000             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1754.2
   001618      1  162100                  TO RE-MARK                                      NC1754.2 235
   001619      1  162200             MOVE   "1"           TO CORRECT-X                    NC1754.2 254
   001620      1  162300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1754.2 40 240
   001621      1  162400             PERFORM FAIL                                         NC1754.2 381
   001622      1  162500             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001623         162600     ADD     1 TO REC-CT.                                         NC1754.2 277
   001624         162700 SUB-TEST-F2-34-2.                                                NC1754.2
   001625         162800     MOVE   "SUB-TEST-F2-34-2" TO PAR-NAME.                       NC1754.2 230
   001626         162900     IF      SIZE-ERR2 = "A"                                      NC1754.2 77
   001627      1  163000             PERFORM PASS                                         NC1754.2 380
   001628      1  163100             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001629         163200     ELSE                                                         NC1754.2
   001630      1  163300             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1754.2
   001631      1  163400                  TO RE-MARK                                      NC1754.2 235
   001632      1  163500             MOVE   "A"        TO CORRECT-X                       NC1754.2 254
   001633      1  163600             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001634      1  163700             PERFORM FAIL                                         NC1754.2 381
   001635      1  163800             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001636         163900     ADD     1 TO REC-CT.                                         NC1754.2 277
   001637         164000 SUB-TEST-F2-34-3.                                                NC1754.2
   001638         164100     MOVE   "SUB-TEST-F2-34-3" TO PAR-NAME.                       NC1754.2 230
   001639         164200     IF      SIZE-ERR3 = "B"                                      NC1754.2 78
   001640      1  164300             PERFORM PASS                                         NC1754.2 380
   001641      1  164400             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001642         164500     ELSE                                                         NC1754.2
   001643      1  164600             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1754.2
   001644      1  164700                  TO RE-MARK                                      NC1754.2 235
   001645      1  164800             MOVE   "B"        TO CORRECT-X                       NC1754.2 254
   001646      1  164900             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1754.2 78 240
   001647      1  165000             PERFORM FAIL                                         NC1754.2 381
   001648      1  165100             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001649         165200     ADD     1 TO REC-CT.                                         NC1754.2 277
   001650         165300 SUB-TEST-F2-34-4.                                                NC1754.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165400     MOVE   "SUB-TEST-F2-34-4" TO PAR-NAME.                       NC1754.2 230
   001652         165500     IF      SIZE-ERR4 = "C"                                      NC1754.2 79
   001653      1  165600             PERFORM PASS                                         NC1754.2 380
   001654      1  165700             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001655         165800     ELSE                                                         NC1754.2
   001656      1  165900             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1754.2
   001657      1  166000                  TO RE-MARK                                      NC1754.2 235
   001658      1  166100             MOVE   "C"        TO CORRECT-X                       NC1754.2 254
   001659      1  166200             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1754.2 79 240
   001660      1  166300             PERFORM FAIL                                         NC1754.2 381
   001661      1  166400             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001662      1  166500             ADD     1 TO REC-CT.                                 NC1754.2 277
   001663         166600 SUB-TEST-F2-34-5.                                                NC1754.2
   001664         166700     MOVE   "SUB-TEST-F2-34-5" TO PAR-NAME.                       NC1754.2 230
   001665         166800     IF      WRK-DS-10V00 = ZERO                                  NC1754.2 84 IMP
   001666      1  166900             PERFORM PASS                                         NC1754.2 380
   001667      1  167000             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001668         167100     ELSE                                                         NC1754.2
   001669      1  167200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1754.2
   001670      1  167300                  TO RE-MARK                                      NC1754.2 235
   001671      1  167400             MOVE    ZERO         TO CORRECT-N                    NC1754.2 IMP 256
   001672      1  167500             MOVE    WRK-DS-10V00 TO COMPUTED-N                   NC1754.2 84 242
   001673      1  167600             PERFORM FAIL                                         NC1754.2 381
   001674      1  167700             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001675         167800*                                                                 NC1754.2
   001676         167900 SUB-INIT-F2-35.                                                  NC1754.2
   001677         168000*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1754.2
   001678         168100     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1754.2 286
   001679         168200     MOVE   "SUB-TEST-F2-35"  TO PAR-NAME.                        NC1754.2 230
   001680         168300     MOVE    SPACE TO WRK-XN-00001.                               NC1754.2 IMP 40
   001681         168400     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001682         168500     MOVE    SPACE TO SIZE-ERR3.                                  NC1754.2 IMP 78
   001683         168600     MOVE    SPACE TO SIZE-ERR4.                                  NC1754.2 IMP 79
   001684         168700     MOVE    ZERO  TO WRK-DS-06V06.                               NC1754.2 IMP 98
   001685         168800     MOVE    1     TO REC-CT.                                     NC1754.2 277
   001686         168900 SUB-TEST-F2-35-0.                                                NC1754.2
   001687         169000     SUBTRACT A12THREES-DS-06V06                                  NC1754.2 96
   001688         169100              333333                                              NC1754.2
   001689         169200              A06THREES-DS-03V03                                  NC1754.2 94
   001690         169300              -.0000009 FROM 0000000                              NC1754.2
   001691         169400      GIVING WRK-DS-06V06 ROUNDED                                 NC1754.2 98
   001692         169500          ON SIZE ERROR                                           NC1754.2
   001693      1  169600             MOVE   "1" TO WRK-XN-00001                           NC1754.2 40
   001694      1  169700             MOVE   "A" TO SIZE-ERR2                              NC1754.2 77
   001695      1  169800             MOVE   "B" TO SIZE-ERR3                              NC1754.2 78
   001696         169900     END-SUBTRACT                                                 NC1754.2
   001697         170000     MOVE   "C" TO SIZE-ERR4.                                     NC1754.2 79
   001698         170100     GO TO   SUB-TEST-F2-35-1.                                    NC1754.2 1703
   001699         170200 SUB-DELETE-F2-35.                                                NC1754.2
   001700         170300     PERFORM DE-LETE.                                             NC1754.2 382
   001701         170400     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001702         170500     GO TO   SUB-INIT-F2-36.                                      NC1754.2 1768
   001703         170600 SUB-TEST-F2-35-1.                                                NC1754.2
   001704         170700     MOVE   "SUB-TEST-F2-35-1" TO PAR-NAME.                       NC1754.2 230
   001705         170800     IF      WRK-XN-00001 = SPACE                                 NC1754.2 40 IMP
   001706      1  170900             PERFORM PASS                                         NC1754.2 380
   001707      1  171000             PERFORM PRINT-DETAIL                                 NC1754.2 384
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171100     ELSE                                                         NC1754.2
   001709      1  171200             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1754.2
   001710      1  171300                  TO RE-MARK                                      NC1754.2 235
   001711      1  171400             MOVE    SPACE        TO CORRECT-X                    NC1754.2 IMP 254
   001712      1  171500             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1754.2 40 240
   001713      1  171600             PERFORM FAIL                                         NC1754.2 381
   001714      1  171700             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001715         171800     ADD     1 TO REC-CT.                                         NC1754.2 277
   001716         171900 SUB-TEST-F2-35-2.                                                NC1754.2
   001717         172000     MOVE   "SUB-TEST-F2-35-2" TO PAR-NAME.                       NC1754.2 230
   001718         172100     IF      SIZE-ERR2 = SPACE                                    NC1754.2 77 IMP
   001719      1  172200             PERFORM PASS                                         NC1754.2 380
   001720      1  172300             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001721         172400     ELSE                                                         NC1754.2
   001722      1  172500             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1754.2
   001723      1  172600                  TO RE-MARK                                      NC1754.2 235
   001724      1  172700             MOVE    SPACE     TO CORRECT-X                       NC1754.2 IMP 254
   001725      1  172800             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001726      1  172900             PERFORM FAIL                                         NC1754.2 381
   001727      1  173000             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001728         173100     ADD     1 TO REC-CT.                                         NC1754.2 277
   001729         173200 SUB-TEST-F2-35-3.                                                NC1754.2
   001730         173300     MOVE   "SUB-TEST-F2-35-3" TO PAR-NAME.                       NC1754.2 230
   001731         173400     IF      SIZE-ERR3 = SPACE                                    NC1754.2 78 IMP
   001732      1  173500             PERFORM PASS                                         NC1754.2 380
   001733      1  173600             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001734         173700     ELSE                                                         NC1754.2
   001735      1  173800             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1754.2
   001736      1  173900                  TO RE-MARK                                      NC1754.2 235
   001737      1  174000             MOVE    SPACE     TO CORRECT-X                       NC1754.2 IMP 254
   001738      1  174100             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1754.2 78 240
   001739      1  174200             PERFORM FAIL                                         NC1754.2 381
   001740      1  174300             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001741         174400     ADD     1 TO REC-CT.                                         NC1754.2 277
   001742         174500 SUB-TEST-F2-35-4.                                                NC1754.2
   001743         174600     MOVE   "SUB-TEST-F2-35-4" TO PAR-NAME.                       NC1754.2 230
   001744         174700     IF      SIZE-ERR4 = "C"                                      NC1754.2 79
   001745      1  174800             PERFORM PASS                                         NC1754.2 380
   001746      1  174900             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001747         175000     ELSE                                                         NC1754.2
   001748      1  175100             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1754.2
   001749      1  175200                  TO RE-MARK                                      NC1754.2 235
   001750      1  175300             MOVE   "C"        TO CORRECT-X                       NC1754.2 254
   001751      1  175400             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1754.2 79 240
   001752      1  175500             PERFORM FAIL                                         NC1754.2 381
   001753      1  175600             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001754         175700     ADD     1 TO REC-CT.                                         NC1754.2 277
   001755         175800 SUB-TEST-F2-35-5.                                                NC1754.2
   001756         175900     MOVE   "SUB-TEST-F1-35-5" TO PAR-NAME.                       NC1754.2 230
   001757         176000     IF      WRK-DS-06V06 = -666999.666332                        NC1754.2 98
   001758      1  176100             PERFORM PASS                                         NC1754.2 380
   001759      1  176200             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001760         176300     ELSE                                                         NC1754.2
   001761      1  176400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1754.2
   001762      1  176500                  TO RE-MARK                                      NC1754.2 235
   001763      1  176600             MOVE   -666999.666332 TO CORRECT-N                   NC1754.2 256
   001764      1  176700             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1754.2 98 242
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765      1  176800             PERFORM FAIL                                         NC1754.2 381
   001766      1  176900             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001767         177000*                                                                 NC1754.2
   001768         177100 SUB-INIT-F2-36.                                                  NC1754.2
   001769         177200*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1754.2
   001770         177300     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1754.2 286
   001771         177400     MOVE   "SUB-TEST-F2-36"  TO PAR-NAME.                        NC1754.2 230
   001772         177500     MOVE   SPACE TO WRK-XN-00001.                                NC1754.2 IMP 40
   001773         177600     MOVE   SPACE TO SIZE-ERR2.                                   NC1754.2 IMP 77
   001774         177700     MOVE   SPACE TO SIZE-ERR3.                                   NC1754.2 IMP 78
   001775         177800     MOVE   SPACE TO SIZE-ERR4.                                   NC1754.2 IMP 79
   001776         177900     MOVE   ZERO  TO WRK-DS-10V00.                                NC1754.2 IMP 84
   001777         178000     MOVE       1 TO REC-CT.                                      NC1754.2 277
   001778         178100 SUB-TEST-F2-36-0.                                                NC1754.2
   001779         178200     SUBTRACT A12ONES-DS-12V00                                    NC1754.2 105
   001780         178300        FROM ZERO GIVING WRK-DS-10V00                             NC1754.2 IMP 84
   001781         178400         NOT ON SIZE ERROR                                        NC1754.2
   001782      1  178500             MOVE   "1" TO WRK-XN-00001                           NC1754.2 40
   001783      1  178600             MOVE   "A" TO SIZE-ERR2                              NC1754.2 77
   001784      1  178700             MOVE   "B" TO SIZE-ERR3                              NC1754.2 78
   001785         178800     END-SUBTRACT                                                 NC1754.2
   001786         178900     MOVE   "C" TO SIZE-ERR4.                                     NC1754.2 79
   001787         179000     GO TO   SUB-TEST-F2-36-1.                                    NC1754.2 1792
   001788         179100 SUB-DELETE-F2-36.                                                NC1754.2
   001789         179200     PERFORM DE-LETE.                                             NC1754.2 382
   001790         179300     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001791         179400     GO      TO SUB-INIT-F2-37.                                   NC1754.2 1857
   001792         179500 SUB-TEST-F2-36-1.                                                NC1754.2
   001793         179600     MOVE   "SUB-TEST-F2-36-1" TO PAR-NAME.                       NC1754.2 230
   001794         179700     IF      WRK-XN-00001 = SPACE                                 NC1754.2 40 IMP
   001795      1  179800             PERFORM PASS                                         NC1754.2 380
   001796      1  179900             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001797         180000     ELSE                                                         NC1754.2
   001798      1  180100             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1754.2
   001799      1  180200                  TO RE-MARK                                      NC1754.2 235
   001800      1  180300             MOVE    SPACE        TO CORRECT-X                    NC1754.2 IMP 254
   001801      1  180400             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1754.2 40 240
   001802      1  180500             PERFORM FAIL                                         NC1754.2 381
   001803      1  180600             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001804         180700     ADD     1 TO REC-CT.                                         NC1754.2 277
   001805         180800 SUB-TEST-F2-36-2.                                                NC1754.2
   001806         180900     MOVE   "SUB-TEST-F2-36-2" TO PAR-NAME.                       NC1754.2 230
   001807         181000     IF      SIZE-ERR2 = SPACE                                    NC1754.2 77 IMP
   001808      1  181100             PERFORM PASS                                         NC1754.2 380
   001809      1  181200             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001810         181300     ELSE                                                         NC1754.2
   001811      1  181400             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1754.2
   001812      1  181500                  TO RE-MARK                                      NC1754.2 235
   001813      1  181600             MOVE    SPACE     TO CORRECT-X                       NC1754.2 IMP 254
   001814      1  181700             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001815      1  181800             PERFORM FAIL                                         NC1754.2 381
   001816      1  181900             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001817         182000     ADD     1 TO REC-CT.                                         NC1754.2 277
   001818         182100 SUB-TEST-F2-36-3.                                                NC1754.2
   001819         182200     MOVE   "SUB-TEST-F2-36-3" TO PAR-NAME.                       NC1754.2 230
   001820         182300     IF      SIZE-ERR3 = SPACE                                    NC1754.2 78 IMP
   001821      1  182400             PERFORM PASS                                         NC1754.2 380
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822      1  182500             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001823         182600     ELSE                                                         NC1754.2
   001824      1  182700             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1754.2
   001825      1  182800                  TO RE-MARK                                      NC1754.2 235
   001826      1  182900             MOVE    SPACE     TO CORRECT-X                       NC1754.2 IMP 254
   001827      1  183000             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1754.2 78 240
   001828      1  183100             PERFORM FAIL                                         NC1754.2 381
   001829      1  183200             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001830         183300     ADD     1 TO REC-CT.                                         NC1754.2 277
   001831         183400 SUB-TEST-F2-36-4.                                                NC1754.2
   001832         183500     MOVE   "SUB-TEST-F2-36-4" TO PAR-NAME.                       NC1754.2 230
   001833         183600     IF      SIZE-ERR4 = "C"                                      NC1754.2 79
   001834      1  183700             PERFORM PASS                                         NC1754.2 380
   001835      1  183800             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001836         183900     ELSE                                                         NC1754.2
   001837      1  184000             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1754.2
   001838      1  184100                  TO RE-MARK                                      NC1754.2 235
   001839      1  184200             MOVE   "C"        TO CORRECT-X                       NC1754.2 254
   001840      1  184300             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1754.2 79 240
   001841      1  184400             PERFORM FAIL                                         NC1754.2 381
   001842      1  184500             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001843      1  184600             ADD     1 TO REC-CT.                                 NC1754.2 277
   001844         184700 SUB-TEST-F2-36-5.                                                NC1754.2
   001845         184800     MOVE   "SUB-TEST-F2-36-5" TO PAR-NAME.                       NC1754.2 230
   001846         184900     IF      WRK-DS-10V00 = ZERO                                  NC1754.2 84 IMP
   001847      1  185000             PERFORM PASS                                         NC1754.2 380
   001848      1  185100             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001849         185200     ELSE                                                         NC1754.2
   001850      1  185300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1754.2
   001851      1  185400                  TO RE-MARK                                      NC1754.2 235
   001852      1  185500             MOVE    ZERO         TO CORRECT-N                    NC1754.2 IMP 256
   001853      1  185600             MOVE    WRK-DS-10V00 TO COMPUTED-N                   NC1754.2 84 242
   001854      1  185700             PERFORM FAIL                                         NC1754.2 381
   001855      1  185800             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001856         185900*                                                                 NC1754.2
   001857         186000 SUB-INIT-F2-37.                                                  NC1754.2
   001858         186100*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1754.2
   001859         186200     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1754.2 286
   001860         186300     MOVE   "SUB-TEST-F2-37"  TO PAR-NAME.                        NC1754.2 230
   001861         186400     MOVE    SPACE TO WRK-XN-00001.                               NC1754.2 IMP 40
   001862         186500     MOVE    SPACE TO SIZE-ERR2.                                  NC1754.2 IMP 77
   001863         186600     MOVE    SPACE TO SIZE-ERR3.                                  NC1754.2 IMP 78
   001864         186700     MOVE    SPACE TO SIZE-ERR4.                                  NC1754.2 IMP 79
   001865         186800     MOVE    ZERO  TO WRK-DS-06V06.                               NC1754.2 IMP 98
   001866         186900     MOVE    1     TO REC-CT.                                     NC1754.2 277
   001867         187000 SUB-TEST-F2-37-0.                                                NC1754.2
   001868         187100     SUBTRACT A12THREES-DS-06V06                                  NC1754.2 96
   001869         187200              333333                                              NC1754.2
   001870         187300              A06THREES-DS-03V03                                  NC1754.2 94
   001871         187400              -.0000009 FROM 0000000                              NC1754.2
   001872         187500      GIVING WRK-DS-06V06 ROUNDED                                 NC1754.2 98
   001873         187600         NOT ON SIZE ERROR                                        NC1754.2
   001874      1  187700             MOVE   "1" TO WRK-XN-00001                           NC1754.2 40
   001875      1  187800             MOVE   "A" TO SIZE-ERR2                              NC1754.2 77
   001876      1  187900             MOVE   "B" TO SIZE-ERR3                              NC1754.2 78
   001877         188000     END-SUBTRACT                                                 NC1754.2
   001878         188100     MOVE   "C" TO SIZE-ERR4.                                     NC1754.2 79
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200     GO TO   SUB-TEST-F2-37-1.                                    NC1754.2 1884
   001880         188300 SUB-DELETE-F2-37.                                                NC1754.2
   001881         188400     PERFORM DE-LETE.                                             NC1754.2 382
   001882         188500     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001883         188600     GO TO   SUB-INIT-F2-38.                                      NC1754.2 1949
   001884         188700 SUB-TEST-F2-37-1.                                                NC1754.2
   001885         188800     MOVE   "SUB-TEST-F2-37-1" TO PAR-NAME.                       NC1754.2 230
   001886         188900     IF      WRK-XN-00001 = "1"                                   NC1754.2 40
   001887      1  189000             PERFORM PASS                                         NC1754.2 380
   001888      1  189100             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001889         189200     ELSE                                                         NC1754.2
   001890      1  189300             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1754.2
   001891      1  189400                  TO RE-MARK                                      NC1754.2 235
   001892      1  189500             MOVE   "1"           TO CORRECT-X                    NC1754.2 254
   001893      1  189600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1754.2 40 240
   001894      1  189700             PERFORM FAIL                                         NC1754.2 381
   001895      1  189800             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001896         189900     ADD     1 TO REC-CT.                                         NC1754.2 277
   001897         190000 SUB-TEST-F2-37-2.                                                NC1754.2
   001898         190100     MOVE   "SUB-TEST-F2-37-2" TO PAR-NAME.                       NC1754.2 230
   001899         190200     IF      SIZE-ERR2 = "A"                                      NC1754.2 77
   001900      1  190300             PERFORM PASS                                         NC1754.2 380
   001901      1  190400             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001902         190500     ELSE                                                         NC1754.2
   001903      1  190600             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1754.2
   001904      1  190700                  TO RE-MARK                                      NC1754.2 235
   001905      1  190800             MOVE   "A"        TO CORRECT-X                       NC1754.2 254
   001906      1  190900             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1754.2 77 240
   001907      1  191000             PERFORM FAIL                                         NC1754.2 381
   001908      1  191100             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001909         191200     ADD     1 TO REC-CT.                                         NC1754.2 277
   001910         191300 SUB-TEST-F2-37-3.                                                NC1754.2
   001911         191400     MOVE   "SUB-TEST-F2-37-3" TO PAR-NAME.                       NC1754.2 230
   001912         191500     IF      SIZE-ERR3 = "B"                                      NC1754.2 78
   001913      1  191600             PERFORM PASS                                         NC1754.2 380
   001914      1  191700             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001915         191800     ELSE                                                         NC1754.2
   001916      1  191900             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1754.2
   001917      1  192000                  TO RE-MARK                                      NC1754.2 235
   001918      1  192100             MOVE   "B"        TO CORRECT-X                       NC1754.2 254
   001919      1  192200             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1754.2 78 240
   001920      1  192300             PERFORM FAIL                                         NC1754.2 381
   001921      1  192400             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001922         192500     ADD     1 TO REC-CT.                                         NC1754.2 277
   001923         192600 SUB-TEST-F2-37-4.                                                NC1754.2
   001924         192700     MOVE   "SUB-TEST-F2-37-4" TO PAR-NAME.                       NC1754.2 230
   001925         192800     IF      SIZE-ERR4 = "C"                                      NC1754.2 79
   001926      1  192900             PERFORM PASS                                         NC1754.2 380
   001927      1  193000             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001928         193100     ELSE                                                         NC1754.2
   001929      1  193200             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1754.2
   001930      1  193300                  TO RE-MARK                                      NC1754.2 235
   001931      1  193400             MOVE   "C"        TO CORRECT-X                       NC1754.2 254
   001932      1  193500             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1754.2 79 240
   001933      1  193600             PERFORM FAIL                                         NC1754.2 381
   001934      1  193700             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001935         193800     ADD     1 TO REC-CT.                                         NC1754.2 277
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900 SUB-TEST-F2-37-5.                                                NC1754.2
   001937         194000     MOVE   "SUB-TEST-F2-37-5" TO PAR-NAME.                       NC1754.2 230
   001938         194100     IF      WRK-DS-06V06 = -666999.666332                        NC1754.2 98
   001939      1  194200             PERFORM PASS                                         NC1754.2 380
   001940      1  194300             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001941         194400     ELSE                                                         NC1754.2
   001942      1  194500             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1754.2
   001943      1  194600                  TO RE-MARK                                      NC1754.2 235
   001944      1  194700             MOVE   -666999.666332 TO CORRECT-N                   NC1754.2 256
   001945      1  194800             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1754.2 98 242
   001946      1  194900             PERFORM FAIL                                         NC1754.2 381
   001947      1  195000             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001948         195100*                                                                 NC1754.2
   001949         195200 SUB-INIT-F2-38.                                                  NC1754.2
   001950         195300*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1754.2
   001951         195400     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1754.2 286
   001952         195500     MOVE   "SUB-TEST-F2-38"  TO PAR-NAME.                        NC1754.2 230
   001953         195600     MOVE   "0"   TO WRK-XN-00001.                                NC1754.2 40
   001954         195700     MOVE   "0"   TO SIZE-ERR4.                                   NC1754.2 79
   001955         195800     MOVE    ZERO TO WRK-DS-10V00.                                NC1754.2 IMP 84
   001956         195900     MOVE    1    TO REC-CT.                                      NC1754.2 277
   001957         196000 SUB-TEST-F2-38-0.                                                NC1754.2
   001958         196100     SUBTRACT A12ONES-DS-12V00                                    NC1754.2 105
   001959         196200        FROM ZERO GIVING WRK-DS-10V00                             NC1754.2 IMP 84
   001960         196300          ON SIZE ERROR                                           NC1754.2
   001961      1  196400             MOVE   SPACE TO WRK-XN-00001                         NC1754.2 IMP 40
   001962         196500      NOT ON SIZE ERROR                                           NC1754.2
   001963      1  196600             MOVE   "1" TO WRK-XN-00001                           NC1754.2 40
   001964         196700     END-SUBTRACT                                                 NC1754.2
   001965         196800     MOVE   "C" TO SIZE-ERR4.                                     NC1754.2 79
   001966         196900     GO TO   SUB-TEST-F2-38-1.                                    NC1754.2 1971
   001967         197000 SUB-DELETE-F2-38.                                                NC1754.2
   001968         197100     PERFORM DE-LETE.                                             NC1754.2 382
   001969         197200     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   001970         197300     GO TO   SUB-INIT-F2-39.                                      NC1754.2 2010
   001971         197400 SUB-TEST-F2-38-1.                                                NC1754.2
   001972         197500     MOVE   "SUB-TEST-F2-38-1" TO PAR-NAME.                       NC1754.2 230
   001973         197600     IF      WRK-XN-00001 = SPACE                                 NC1754.2 40 IMP
   001974      1  197700             PERFORM PASS                                         NC1754.2 380
   001975      1  197800             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001976         197900     ELSE                                                         NC1754.2
   001977      1  198000             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1754.2
   001978      1  198100                  TO RE-MARK                                      NC1754.2 235
   001979      1  198200             MOVE    SPACE        TO CORRECT-X                    NC1754.2 IMP 254
   001980      1  198300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1754.2 40 240
   001981      1  198400             PERFORM FAIL                                         NC1754.2 381
   001982      1  198500             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001983         198600     ADD     1 TO REC-CT.                                         NC1754.2 277
   001984         198700 SUB-TEST-F2-38-2.                                                NC1754.2
   001985         198800     MOVE   "SUB-TEST-F2-38-2" TO PAR-NAME.                       NC1754.2 230
   001986         198900     IF      SIZE-ERR4 = "C"                                      NC1754.2 79
   001987      1  199000             PERFORM PASS                                         NC1754.2 380
   001988      1  199100             PERFORM PRINT-DETAIL                                 NC1754.2 384
   001989         199200     ELSE                                                         NC1754.2
   001990      1  199300             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1754.2
   001991      1  199400                  TO RE-MARK                                      NC1754.2 235
   001992      1  199500             MOVE   "C"        TO CORRECT-X                       NC1754.2 254
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993      1  199600             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1754.2 79 240
   001994      1  199700             PERFORM FAIL                                         NC1754.2 381
   001995      1  199800             PERFORM PRINT-DETAIL.                                NC1754.2 384
   001996         199900     ADD     1 TO REC-CT.                                         NC1754.2 277
   001997         200000 SUB-TEST-F2-38-3.                                                NC1754.2
   001998         200100     MOVE   "SUB-TEST-F2-38-3" TO PAR-NAME.                       NC1754.2 230
   001999         200200     IF      WRK-DS-10V00 = ZERO                                  NC1754.2 84 IMP
   002000      1  200300             PERFORM PASS                                         NC1754.2 380
   002001      1  200400             PERFORM PRINT-DETAIL                                 NC1754.2 384
   002002         200500     ELSE                                                         NC1754.2
   002003      1  200600             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1754.2
   002004      1  200700                  TO RE-MARK                                      NC1754.2 235
   002005      1  200800             MOVE    ZERO         TO CORRECT-N                    NC1754.2 IMP 256
   002006      1  200900             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1754.2 104 242
   002007      1  201000             PERFORM FAIL                                         NC1754.2 381
   002008      1  201100             PERFORM PRINT-DETAIL.                                NC1754.2 384
   002009         201200*                                                                 NC1754.2
   002010         201300 SUB-INIT-F2-39.                                                  NC1754.2
   002011         201400*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1754.2
   002012         201500     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1754.2 286
   002013         201600     MOVE   "SUB-TEST-F2-39"  TO PAR-NAME.                        NC1754.2 230
   002014         201700     MOVE    SPACE TO WRK-XN-00001.                               NC1754.2 IMP 40
   002015         201800     MOVE    SPACE TO SIZE-ERR4.                                  NC1754.2 IMP 79
   002016         201900     MOVE    ZERO  TO WRK-DS-06V06.                               NC1754.2 IMP 98
   002017         202000     MOVE    1     TO REC-CT.                                     NC1754.2 277
   002018         202100 SUB-TEST-F2-39-0.                                                NC1754.2
   002019         202200     SUBTRACT A12THREES-DS-06V06                                  NC1754.2 96
   002020         202300              333333                                              NC1754.2
   002021         202400              A06THREES-DS-03V03                                  NC1754.2 94
   002022         202500              -.0000009 FROM 0000000                              NC1754.2
   002023         202600      GIVING WRK-DS-06V06 ROUNDED                                 NC1754.2 98
   002024         202700             ON SIZE ERROR                                        NC1754.2
   002025      1  202800             MOVE   "X" TO WRK-XN-00001                           NC1754.2 40
   002026         202900         NOT ON SIZE ERROR                                        NC1754.2
   002027      1  203000             MOVE   "1" TO WRK-XN-00001                           NC1754.2 40
   002028         203100     END-SUBTRACT                                                 NC1754.2
   002029         203200     MOVE   "C" TO SIZE-ERR4.                                     NC1754.2 79
   002030         203300     GO TO   SUB-TEST-F2-39-1.                                    NC1754.2 2035
   002031         203400 SUB-DELETE-F2-39.                                                NC1754.2
   002032         203500     PERFORM DE-LETE.                                             NC1754.2 382
   002033         203600     PERFORM PRINT-DETAIL.                                        NC1754.2 384
   002034         203700     GO TO   CCVS-EXIT.                                           NC1754.2 2074
   002035         203800 SUB-TEST-F2-39-1.                                                NC1754.2
   002036         203900     MOVE   "SUB-TEST-F2-39-1" TO PAR-NAME.                       NC1754.2 230
   002037         204000     IF      WRK-XN-00001 = "1"                                   NC1754.2 40
   002038      1  204100             PERFORM PASS                                         NC1754.2 380
   002039      1  204200             PERFORM PRINT-DETAIL                                 NC1754.2 384
   002040         204300     ELSE                                                         NC1754.2
   002041      1  204400             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1754.2
   002042      1  204500                  TO RE-MARK                                      NC1754.2 235
   002043      1  204600             MOVE   "1"           TO CORRECT-X                    NC1754.2 254
   002044      1  204700             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1754.2 40 240
   002045      1  204800             PERFORM FAIL                                         NC1754.2 381
   002046      1  204900             PERFORM PRINT-DETAIL.                                NC1754.2 384
   002047         205000     ADD     1 TO REC-CT.                                         NC1754.2 277
   002048         205100 SUB-TEST-F2-39-2.                                                NC1754.2
   002049         205200     MOVE   "SUB-TEST-F2-39-2" TO PAR-NAME.                       NC1754.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205300     IF      SIZE-ERR4 = "C"                                      NC1754.2 79
   002051      1  205400             PERFORM PASS                                         NC1754.2 380
   002052      1  205500             PERFORM PRINT-DETAIL                                 NC1754.2 384
   002053         205600     ELSE                                                         NC1754.2
   002054      1  205700             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1754.2
   002055      1  205800                  TO RE-MARK                                      NC1754.2 235
   002056      1  205900             MOVE   "C"        TO CORRECT-X                       NC1754.2 254
   002057      1  206000             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1754.2 79 240
   002058      1  206100             PERFORM FAIL                                         NC1754.2 381
   002059      1  206200             PERFORM PRINT-DETAIL.                                NC1754.2 384
   002060         206300     ADD     1 TO REC-CT.                                         NC1754.2 277
   002061         206400 SUB-TEST-F2-39-3.                                                NC1754.2
   002062         206500     MOVE   "SUB-TEST-F2-39-3" TO PAR-NAME.                       NC1754.2 230
   002063         206600     IF      WRK-DS-06V06 = -666999.666332                        NC1754.2 98
   002064      1  206700             PERFORM PASS                                         NC1754.2 380
   002065      1  206800             PERFORM PRINT-DETAIL                                 NC1754.2 384
   002066         206900     ELSE                                                         NC1754.2
   002067      1  207000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1754.2
   002068      1  207100                  TO RE-MARK                                      NC1754.2 235
   002069      1  207200             MOVE   -666999.666332 TO CORRECT-N                   NC1754.2 256
   002070      1  207300             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1754.2 98 242
   002071      1  207400             PERFORM FAIL                                         NC1754.2 381
   002072      1  207500             PERFORM PRINT-DETAIL.                                NC1754.2 384
   002073         207600*                                                                 NC1754.2
   002074         207700 CCVS-EXIT SECTION.                                               NC1754.2
   002075         207800 CCVS-999999.                                                     NC1754.2
   002076         207900     GO TO CLOSE-FILES.                                           NC1754.2 373
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    40
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      135   ADD-12
      136   ADD-13
      137   ADD-14
      286   ANSI-REFERENCE . . . . . . . .  463 470 479 M487 M1008 M1029 M1053 M1075 M1100 M1151 M1229 M1296 M1374 M1441
                                            M1521 M1590 M1678 M1770 M1859 M1951 M2012
      128   AZERO-DS-05V05 . . . . . . . .  632
      118   A01ONE-DS-P0801. . . . . . . .  756 773 799
       89   A02ONES-DS-02V00
      112   A03ONES-DS-02V01 . . . . . . .  751 778 798
      101   A05ONES-DS-00V05 . . . . . . .  612
       87   A05ONES-DS-05V00 . . . . . . .  611 630
      114   A06ONES-DS-03V03 . . . . . . .  752 777 801
       94   A06THREES-DS-03V03 . . . . . .  594 614 681 716 1034 1080 1689 1870 2021
      116   A08TWOS-DS-02V06 . . . . . . .  753 776 795
       85   A10ONES-DS-10V00
      105   A12ONES-DS-12V00 . . . . . . .  649 1011 1056 1598 1779 1958
      151   A12SEVENS-CU-18V00
      143   A12THREES-CU-18V00 . . . . . .  927 959
       96   A12THREES-DS-06V06 . . . . . .  594 613 682 714 1032 1078 1687 1868 2019
      141   A14TWOS-CS-18V00 . . . . . . .  927
      145   A16FOURS-CS-18V00. . . . . . .  959
       80   A16TWOS-DS-16V00 . . . . . . .  1164 1309 1454
      139   A18EIGHTS-CS-18V00
      147   A18FIVES-CS-18V00
      121   A18ONES-CS-18V00 . . . . . . .  975
       82   A18ONES-DS-18V00
      149   A18SIXES-CS-18V00. . . . . . .  943 991
      154   A18THREES-CS-18V00 . . . . . .  943 975 991
      124   A99-CS-02V00
      110   A99-DS-02V00 . . . . . . . . .  750 779 796
      265   CCVS-C-1 . . . . . . . . . . .  402 448
      270   CCVS-C-2 . . . . . . . . . . .  403 449
      320   CCVS-E-1 . . . . . . . . . . .  408
      325   CCVS-E-2 . . . . . . . . . . .  417 424 431 436
      328   CCVS-E-2-2 . . . . . . . . . .  M416
      333   CCVS-E-3 . . . . . . . . . . .  437
      342   CCVS-E-4 . . . . . . . . . . .  416
      343   CCVS-E-4-1 . . . . . . . . . .  M414
      345   CCVS-E-4-2 . . . . . . . . . .  M415
      287   CCVS-H-1 . . . . . . . . . . .  397 444
      292   CCVS-H-2A. . . . . . . . . . .  398 445
      301   CCVS-H-2B. . . . . . . . . . .  399 446
      313   CCVS-H-3 . . . . . . . . . . .  400 447
      363   CCVS-PGM-ID. . . . . . . . . .  369 369
      247   CM-18V0
      241   COMPUTED-A . . . . . . . . . .  242 244 245 246 247 475 478 M500 M516 M568 M883 M915 M1138 M1145 M1195 M1202
                                            M1210 M1270 M1277 M1340 M1347 M1355 M1415 M1422 M1487 M1494 M1502 M1564 M1571
      242   COMPUTED-N . . . . . . . . . .  M534 M549 M603 M622 M641 M706 M740 M825 M855 M1124 M1131 M1181 M1188 M1256 M1263
                                            M1326 M1333 M1401 M1408 M1473 M1480 M1550 M1557 M1672 M1764 M1853 M1945 M2006
                                            M2070
      240   COMPUTED-X . . . . . . . . . .  M392 460 M583 M1220 M1287 M1365 M1432 M1512 M1581 M1620 M1633 M1646 M1659 M1712
                                            M1725 M1738 M1751 M1801 M1814 M1827 M1840 M1893 M1906 M1919 M1932 M1980 M1993
                                            M2044 M2057
      244   COMPUTED-0V18. . . . . . . . .  M902
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    41
0 Defined   Cross-reference of data names   References

0     246   COMPUTED-14V4. . . . . . . . .  M672
      248   COMPUTED-18V0. . . . . . . . .  M870 M933 M949 M964 M980 M997
      245   COMPUTED-4V14. . . . . . . . .  M765 M787 M810
      264   COR-ANSI-REFERENCE . . . . . .  M470 M472
      255   CORRECT-A. . . . . . . . . . .  256 257 258 259 260 476 478 M501 M517 M882 M914 M1139 M1146 M1271 M1278 M1416
                                            M1423 M1565 M1572
      256   CORRECT-N. . . . . . . . . . .  M550 M604 M623 M642 M707 M741 M826 M856 M1125 M1132 M1182 M1189 M1257 M1264 M1327
                                            M1334 M1402 M1409 M1474 M1481 M1551 M1558 M1671 M1763 M1852 M1944 M2005 M2069
      254   CORRECT-X. . . . . . . . . . .  M393 462 M584 M1196 M1203 M1211 M1219 M1286 M1341 M1348 M1356 M1364 M1431 M1488
                                            M1495 M1503 M1511 M1580 M1619 M1632 M1645 M1658 M1711 M1724 M1737 M1750 M1800
                                            M1813 M1826 M1839 M1892 M1905 M1918 M1931 M1979 M1992 M2043 M2056
      257   CORRECT-0V18 . . . . . . . . .  M903
      259   CORRECT-14V4 . . . . . . . . .  M673
      261   CORRECT-18V0 . . . . . . . . .  M871 M932 M948 M965 M981 M996
      258   CORRECT-4V14 . . . . . . . . .  M766 M788 M811
      260   CR-18V0
      223   DECMAL-FIELD . . . . . . . . .  M897 899 902
      278   DELETE-COUNTER . . . . . . . .  M382 411 427 429
      233   DOTVALUE . . . . . . . . . . .  M387
      284   DUMMY-HOLD . . . . . . . . . .  M441 451
       38   DUMMY-RECORD . . . . . . . . .  M397 M398 M399 M400 M402 M403 M404 M406 M408 M417 M424 M431 M436 M437 441 M442
                                            443 M444 M445 M446 M447 M448 M449 M450 M451 455 M456 M465 M480
      331   ENDER-DESC . . . . . . . . . .  M419 M430 M435
      279   ERROR-COUNTER. . . . . . . . .  M381 410 420 423
      283   ERROR-HOLD . . . . . . . . . .  M410 M411 M411 M412 415
      329   ERROR-TOTAL. . . . . . . . . .  M421 M423 M428 M429 M433 M434
      214   EVEN-NAME1 . . . . . . . . . .  864 864
      219   EVEN-NAME2 . . . . . . . . . .  896 896
      226   FEATURE. . . . . . . . . . . .  M488 M591 M747
      357   HYPHEN-LINE. . . . . . . . . .  404 406 450
      323   ID-AGAIN . . . . . . . . . . .  M369
      356   INF-ANSI-REFERENCE . . . . . .  M463 M466 M479 M481
      351   INFO-TEXT. . . . . . . . . . .  M464
      280   INSPECT-COUNTER. . . . . . . .  M379 410 432 434
      211   MINUS-NAMES
      212   MINUS-NAME1. . . . . . . . . .  863
      213   MINUS-NAME2. . . . . . . . . .  863
      217   MINUS-NAME3. . . . . . . . . .  895
      218   MINUS-NAME4. . . . . . . . . .  895
      176   N-10 . . . . . . . . . . . . .  M490 491
      178   N-11
      179   N-12
      180   N-13
      182   N-14
      183   N-15
      184   N-16
      186   N-17
      188   N-18
      190   N-19 . . . . . . . . . . . . .  M491 492 500
      191   N-20
      193   N-21 . . . . . . . . . . . . .  507
      194   N-22 . . . . . . . . . . . . .  507
      196   N-23 . . . . . . . . . . . . .  M507 508 516
      197   N-25 . . . . . . . . . . . . .  M523 526
      198   N-26 . . . . . . . . . . . . .  M524 M526 534 541 549
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    42
0 Defined   Cross-reference of data names   References

0     199   N-27 . . . . . . . . . . . . .  M557 560
      201   N-28 . . . . . . . . . . . . .  M558 M560 568 575 583
      168   N-3
      169   N-4
      202   N-40
      204   N-41
      206   N-42
      208   N-43
      209   N-44
      210   N-45
      171   N-5
      173   N-7. . . . . . . . . . . . . .  175
      130   NDATA-DS-09V09
      228   P-OR-F . . . . . . . . . . . .  M379 M380 M381 M382 389 M392
      230   PAR-NAME . . . . . . . . . . .  M394 M504 M520 M538 M554 M572 M588 M607 M626 M645 M660 M676 M694 M710 M729 M744
                                            M769 M791 M814 M829 M843 M859 M877 M891 M909 M923 M939 M955 M971 M987 M1003 M1024
                                            M1048 M1070 M1095 M1101 M1120 M1128 M1135 M1142 M1152 M1177 M1185 M1192 M1199
                                            M1206 M1214 M1230 M1252 M1260 M1267 M1274 M1281 M1297 M1322 M1330 M1337 M1344
                                            M1351 M1359 M1375 M1397 M1405 M1412 M1419 M1426 M1442 M1469 M1477 M1484 M1491
                                            M1498 M1506 M1522 M1546 M1554 M1561 M1568 M1575 M1612 M1625 M1638 M1651 M1664
                                            M1679 M1704 M1717 M1730 M1743 M1756 M1771 M1793 M1806 M1819 M1832 M1845 M1860
                                            M1885 M1898 M1911 M1924 M1937 M1952 M1972 M1985 M1998 M2013 M2036 M2049 M2062
      232   PARDOT-X . . . . . . . . . . .  M386
      281   PASS-COUNTER . . . . . . . . .  M380 412 414
      215   PLUS-NAME1 . . . . . . . . . .  863
      216   PLUS-NAME2 . . . . . . . . . .  864
      220   PLUS-NAME3 . . . . . . . . . .  895
      221   PLUS-NAME4 . . . . . . . . . .  896
       36   PRINT-FILE . . . . . . . . . .  32 368 374
       37   PRINT-REC. . . . . . . . . . .  M388 M469 M471
      235   RE-MARK. . . . . . . . . . . .  M383 M395 M535 M551 M569 M585 M657 M671 M691 M705 M726 M840 M854 M884 M916 M1015
                                            M1045 M1062 M1092 M1222 M1289 M1367 M1434 M1514 M1583 M1618 M1631 M1644 M1657
                                            M1670 M1710 M1723 M1736 M1749 M1762 M1799 M1812 M1825 M1838 M1851 M1891 M1904
                                            M1917 M1930 M1943 M1978 M1991 M2004 M2042 M2055 M2068
      277   REC-CT . . . . . . . . . . . .  385 387 394 M1109 M1121 M1126 M1133 M1140 M1161 M1178 M1183 M1190 M1197 M1204
                                            M1212 M1238 M1253 M1258 M1265 M1272 M1279 M1306 M1323 M1328 M1335 M1342 M1349
                                            M1357 M1383 M1398 M1403 M1410 M1417 M1424 M1451 M1470 M1475 M1482 M1489 M1496
                                            M1504 M1530 M1547 M1552 M1559 M1566 M1573 M1596 M1623 M1636 M1649 M1662 M1685
                                            M1715 M1728 M1741 M1754 M1777 M1804 M1817 M1830 M1843 M1866 M1896 M1909 M1922
                                            M1935 M1956 M1983 M1996 M2017 M2047 M2060
      276   REC-SKL-SUB
      285   RECORD-COUNT . . . . . . . . .  M439 440 M452
       76   SIZE-ERR . . . . . . . . . . .  M862 M866 880 M894 M898 912
       77   SIZE-ERR2. . . . . . . . . . .  M1162 M1170 1215 1220 M1239 M1245 1282 1287 M1307 M1315 1360 1365 M1384 M1390
                                            1427 1432 M1452 M1460 M1462 1507 1512 M1531 M1537 M1539 1576 1581 M1593 M1602
                                            1626 1633 M1681 M1694 1718 1725 M1773 M1783 1807 1814 M1862 M1875 1899 1906
       78   SIZE-ERR3. . . . . . . . . . .  M1594 M1603 1639 1646 M1682 M1695 1731 1738 M1774 M1784 1820 1827 M1863 M1876
                                            1912 1919
       79   SIZE-ERR4. . . . . . . . . . .  M1595 M1605 1652 1659 M1683 M1697 1744 1751 M1775 M1786 1833 1840 M1864 M1878
                                            1925 1932 M1954 M1965 1986 1993 M2015 M2029 2050 2057
      158   SUBTR-1. . . . . . . . . . . .  832
      166   SUBTR-10
      167   SUBTR-11 . . . . . . . . . . .  M817 818 825
      159   SUBTR-2. . . . . . . . . . . .  817
      160   SUBTR-3. . . . . . . . . . . .  832
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    43
0 Defined   Cross-reference of data names   References

0     161   SUBTR-4. . . . . . . . . . . .  817
      162   SUBTR-5. . . . . . . . . . . .  817 832
      163   SUBTR-6
      164   SUBTR-7. . . . . . . . . . . .  M832 846 855
      165   SUBTR-8
      157   SUBTRACT-DATA
      236   TEST-COMPUTED. . . . . . . . .  469
      251   TEST-CORRECT . . . . . . . . .  471
      304   TEST-ID. . . . . . . . . . . .  M369
      224   TEST-RESULTS . . . . . . . . .  M370 388
      282   TOTAL-ERROR
      207   TRUNC-DATA
      222   WHOLE-FIELD. . . . . . . . . .  M865 867 870
      123   WRK-CS-02V02
      156   WRK-CS-03V00
      120   WRK-CS-18V00 . . . . . . . . .  M926 M928 929 933 M958 M960 961 964 M990 M992 993 997
      138   WRK-CU-18V00
      104   WRK-DS-02V00 . . . . . . . . .  2006
      126   WRK-DS-0201P
      107   WRK-DS-03V10 . . . . . . . . .  108 M749 M757 758 765 M772 M779 780 787 M794 M802 803 810
      103   WRK-DS-05V00 . . . . . . . . .  M679 M683 697 706
      127   WRK-DS-06V00 . . . . . . . . .  M633 634 641
       98   WRK-DS-06V06 . . . . . . . . .  99 M595 596 603 M610 M614 615 622 M629 632 M713 M718 732 740 M1030 M1036 M1076
                                            M1082 M1684 M1691 1757 1764 M1865 M1872 1938 1945 M2016 M2023 2063 2070
       91   WRK-DS-09V09 . . . . . . . . .  92 M593
       60   WRK-DS-1V0-1
       61   WRK-DS-1V0-2
       62   WRK-DS-1V2-1
       84   WRK-DS-10V00 . . . . . . . . .  M648 M650 663 672 M1009 M1012 M1054 M1057 M1591 M1599 1665 1672 M1776 M1780 1846
                                            1853 M1955 M1959 1999
       99   WRK-DS-12V00-S
      108   WRK-DS-13V00-S
       67   WRK-DS-16V2-1
       92   WRK-DS-18V00
       63   WRK-DS-2V0-1
       64   WRK-DS-2V1-1 . . . . . . . . .  M1106 M1112 1129 1131 M1157 M1167 1186 1188 M1235 M1242 1261 1263 M1302 M1312
                                            1331 1333 M1380 M1387 1406 1408 M1447 M1457 1478 1480 M1527 M1534 1555 1557
       65   WRK-DS-2V2-1 . . . . . . . . .  M1103 1111 M1154 1166 M1232 1241 M1299 1311 M1377 1386 M1444 1456 M1524 1533
       66   WRK-DS-2V2-2 . . . . . . . . .  M1105 M1112 1122 1124 M1156 M1167 1179 1181 M1234 M1242 1254 1256 M1301 M1312
                                            1324 1326 M1379 M1387 1399 1401 M1446 M1457 1471 1473 M1526 M1534 1548 1550
       41   WRK-DU-0V1-1 . . . . . . . . .  M1104 1111 M1155 1165 M1233 1241 M1300 1310 M1378 1386 M1445 1455 M1525 1533
       58   WRK-DU-16V2-1
      153   WRK-DU-18V00 . . . . . . . . .  M942 M944 945 949 M974 M976 977 980
       42   WRK-DU-2V0-1 . . . . . . . . .  M1102 1111 M1153 M1231 1241 M1298 M1376 1386 M1443 M1523 1533
       43   WRK-DU-2V0-2
       44   WRK-DU-2V0-3
       45   WRK-DU-2V1-1
       46   WRK-DU-2V1-2
       47   WRK-DU-2V1-3
       48   WRK-DU-2V2-1
       49   WRK-DU-2V2-2
       50   WRK-DU-2V2-3
       51   WRK-DU-2V2-4
       52   WRK-DU-2V2-5
       53   WRK-DU-2V5-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    44
0 Defined   Cross-reference of data names   References

0      54   WRK-DU-4P1-1
       55   WRK-DU-5V1-1
       56   WRK-DU-6V0-1
       57   WRK-DU-6V0-2
       59   WRK-NE-X-1
       68   WRK-NE-X-2
       69   WRK-NE-1
       70   WRK-NE-2
       71   WRK-NE-3
       72   WRK-NE-4 . . . . . . . . . . .  M1107 M1112 1136 1138 M1158 M1167 1193 1195 M1236 M1242 1268 1270 M1303 M1312
                                            1338 1340 M1381 M1387 1413 1415 M1448 M1457 1485 1487 M1528 M1534 1562 1564
       73   WRK-NE-5 . . . . . . . . . . .  M1159 M1168 1200 1202 M1304 M1313 1345 1347 M1449 M1458 1492 1494
       74   WRK-NE-6 . . . . . . . . . . .  M1108 M1113 1143 1145 M1160 M1168 1207 1210 M1237 M1243 1275 1277 M1305 M1313
                                            1352 1355 M1382 M1388 1420 1422 M1450 M1458 1499 1502 M1529 M1535 1569 1571
       75   WRK-NE-7
       40   WRK-XN-00001 . . . . . . . . .  M1592 M1601 1613 1620 M1680 M1693 1705 1712 M1772 M1782 1794 1801 M1861 M1874
                                            1886 1893 M1953 M1961 M1963 1973 1980 M2014 M2025 M2027 2037 2044
      134   WRK-XN-00018
      175   X-8
      132   XDATA-XN-00018
      353   XXCOMPUTED . . . . . . . . . .  M478
      355   XXCORRECT. . . . . . . . . . .  M478
      348   XXINFO . . . . . . . . . . . .  465 480
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    45
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

      474   BAIL-OUT . . . . . . . . . . .  P391
      482   BAIL-OUT-EX. . . . . . . . . .  E391 G476
      477   BAIL-OUT-WRITE . . . . . . . .  G475
      457   BLANK-LINE-PRINT
     2074   CCVS-EXIT. . . . . . . . . . .  G2034
     2075   CCVS-999999
      366   CCVS1
      483   CCVS1-EXIT . . . . . . . . . .  G372
      373   CLOSE-FILES. . . . . . . . . .  G2076
      401   COLUMN-NAMES-ROUTINE . . . . .  E371
      382   DE-LETE. . . . . . . . . . . .  P497 P513 P531 P546 P565 P580 P600 P619 P638 P654 P668 P688 P702 P723 P737 P762
                                            P784 P807 P822 P837 P851 P875 P889 P907 P921 P937 P953 P969 P985 P1001 P1019
                                            P1042 P1065 P1089 P1116 P1173 P1248 P1318 P1393 P1465 P1542 P1608 P1700 P1789
                                            P1881 P1968 P2032
      405   END-ROUTINE. . . . . . . . . .  P374
      409   END-ROUTINE-1
      418   END-ROUTINE-12
      426   END-ROUTINE-13 . . . . . . . .  E374
      407   END-RTN-EXIT
      381   FAIL . . . . . . . . . . . . .  P502 P518 P536 P552 P570 P586 P605 P624 P643 P658 P674 P692 P708 P727 P742 P767
                                            P789 P812 P827 P841 P857 P872 P881 P904 P913 P934 P950 P966 P982 P998 P1016 P1046
                                            P1063 P1093 P1124 P1131 P1138 P1145 P1181 P1188 P1195 P1202 P1210 P1223 P1256
                                            P1263 P1270 P1277 P1290 P1326 P1333 P1340 P1347 P1355 P1368 P1401 P1408 P1415
                                            P1422 P1435 P1473 P1480 P1487 P1494 P1502 P1515 P1550 P1557 P1564 P1571 P1584
                                            P1621 P1634 P1647 P1660 P1673 P1713 P1726 P1739 P1752 P1765 P1802 P1815 P1828
                                            P1841 P1854 P1894 P1907 P1920 P1933 P1946 P1981 P1994 P2007 P2045 P2058 P2071
      459   FAIL-ROUTINE . . . . . . . . .  P390
      473   FAIL-ROUTINE-EX. . . . . . . .  E390 G467
      468   FAIL-ROUTINE-WRITE . . . . . .  G461 G462
      396   HEAD-ROUTINE . . . . . . . . .  P371
      379   INSPT
      367   OPEN-FILES
      380   PASS . . . . . . . . . . . . .  P493 P509 P527 P542 P561 P576 P597 P616 P635 P651 P664 P685 P698 P720 P733 P759
                                            P781 P804 P819 P834 P847 P868 P886 P900 P918 P930 P946 P962 P978 P994 P1022 P1038
                                            P1068 P1086 P1122 P1129 P1136 P1143 P1179 P1186 P1193 P1200 P1208 P1216 P1254
                                            P1261 P1268 P1275 P1283 P1324 P1331 P1338 P1345 P1353 P1361 P1399 P1406 P1413
                                            P1420 P1428 P1471 P1478 P1485 P1492 P1500 P1508 P1548 P1555 P1562 P1569 P1577
                                            P1614 P1627 P1640 P1653 P1666 P1706 P1719 P1732 P1745 P1758 P1795 P1808 P1821
                                            P1834 P1847 P1887 P1900 P1913 P1926 P1939 P1974 P1987 P2000 P2038 P2051 P2064
      384   PRINT-DETAIL . . . . . . . . .  P505 P521 P539 P555 P573 P589 P608 P627 P646 P661 P677 P695 P711 P730 P745 P770
                                            P792 P815 P830 P844 P860 P878 P892 P910 P924 P940 P956 P972 P988 P1004 P1025
                                            P1049 P1071 P1096 P1117 P1122 P1125 P1129 P1132 P1136 P1139 P1143 P1146 P1174
                                            P1179 P1182 P1186 P1189 P1193 P1196 P1200 P1203 P1208 P1211 P1217 P1224 P1249
                                            P1254 P1257 P1261 P1264 P1268 P1271 P1275 P1278 P1284 P1291 P1319 P1324 P1327
                                            P1331 P1334 P1338 P1341 P1345 P1348 P1353 P1356 P1362 P1369 P1394 P1399 P1402
                                            P1406 P1409 P1413 P1416 P1420 P1423 P1429 P1436 P1466 P1471 P1474 P1478 P1481
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    46
0 Defined   Cross-reference of procedures   References

0                                           P1485 P1488 P1492 P1495 P1500 P1503 P1509 P1516 P1543 P1548 P1551 P1555 P1558
                                            P1562 P1565 P1569 P1572 P1578 P1585 P1609 P1615 P1622 P1628 P1635 P1641 P1648
                                            P1654 P1661 P1667 P1674 P1701 P1707 P1714 P1720 P1727 P1733 P1740 P1746 P1753
                                            P1759 P1766 P1790 P1796 P1803 P1809 P1816 P1822 P1829 P1835 P1842 P1848 P1855
                                            P1882 P1888 P1895 P1901 P1908 P1914 P1921 P1927 P1934 P1940 P1947 P1969 P1975
                                            P1982 P1988 P1995 P2001 P2008 P2033 P2039 P2046 P2052 P2059 P2065 P2072
      485   SECT-NC175A-001
      496   SUB-DELETE-F2-1
      722   SUB-DELETE-F2-10-1
      736   SUB-DELETE-F2-10-2
      761   SUB-DELETE-F2-11
      783   SUB-DELETE-F2-12
      806   SUB-DELETE-F2-13
      821   SUB-DELETE-F2-14
      836   SUB-DELETE-F2-15-1
      850   SUB-DELETE-F2-15-2
      874   SUB-DELETE-F2-16-1
      888   SUB-DELETE-F2-16-2
      906   SUB-DELETE-F2-17-1
      920   SUB-DELETE-F2-17-2
      936   SUB-DELETE-F2-18
      952   SUB-DELETE-F2-19
      512   SUB-DELETE-F2-2
      968   SUB-DELETE-F2-20
      984   SUB-DELETE-F2-21
     1000   SUB-DELETE-F2-22
     1018   SUB-DELETE-F2-23
     1041   SUB-DELETE-F2-24
     1064   SUB-DELETE-F2-25
     1088   SUB-DELETE-F2-26
     1115   SUB-DELETE-F2-27
     1172   SUB-DELETE-F2-28
     1247   SUB-DELETE-F2-29
      530   SUB-DELETE-F2-3-1
      545   SUB-DELETE-F2-3-2
     1317   SUB-DELETE-F2-30
     1392   SUB-DELETE-F2-31
     1464   SUB-DELETE-F2-32
     1541   SUB-DELETE-F2-33
     1607   SUB-DELETE-F2-34
     1699   SUB-DELETE-F2-35
     1788   SUB-DELETE-F2-36
     1880   SUB-DELETE-F2-37
     1967   SUB-DELETE-F2-38
     2031   SUB-DELETE-F2-39
      564   SUB-DELETE-F2-4-1
      579   SUB-DELETE-F2-4-2
      599   SUB-DELETE-F2-5
      618   SUB-DELETE-F2-6
      637   SUB-DELETE-F2-7
      653   SUB-DELETE-F2-8-1
      667   SUB-DELETE-F2-8-2
      687   SUB-DELETE-F2-9-1
      701   SUB-DELETE-F2-9-2
      499   SUB-FAIL-F2-1. . . . . . . . .  G495
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    47
0 Defined   Cross-reference of procedures   References

0     725   SUB-FAIL-F2-10-1 . . . . . . .  G719
      739   SUB-FAIL-F2-10-2 . . . . . . .  G735
      764   SUB-FAIL-F2-11 . . . . . . . .  G760
      786   SUB-FAIL-F2-12 . . . . . . . .  G782
      809   SUB-FAIL-F2-13 . . . . . . . .  G805
      824   SUB-FAIL-F2-14 . . . . . . . .  G820
      839   SUB-FAIL-F2-15-1 . . . . . . .  G835
      853   SUB-FAIL-F2-15-2 . . . . . . .  G849
      515   SUB-FAIL-F2-2. . . . . . . . .  G511
     1044   SUB-FAIL-F2-24 . . . . . . . .  G1040
     1091   SUB-FAIL-F2-26 . . . . . . . .  G1084
      533   SUB-FAIL-F2-3-1. . . . . . . .  G529
      548   SUB-FAIL-F2-3-2. . . . . . . .  G544
      567   SUB-FAIL-F2-4-1. . . . . . . .  G563
      582   SUB-FAIL-F2-4-2. . . . . . . .  G578
      602   SUB-FAIL-F2-5. . . . . . . . .  G598
      621   SUB-FAIL-F2-6. . . . . . . . .  G617
      640   SUB-FAIL-F2-7. . . . . . . . .  G636
      656   SUB-FAIL-F2-8-1. . . . . . . .  G652
      670   SUB-FAIL-F2-8-2. . . . . . . .  G666
      690   SUB-FAIL-F2-9-1. . . . . . . .  G686
      704   SUB-FAIL-F2-9-2. . . . . . . .  G700
      486   SUB-INIT-F2-1
      746   SUB-INIT-F2-11
     1006   SUB-INIT-F2-23
     1027   SUB-INIT-F2-24
     1051   SUB-INIT-F2-25
     1073   SUB-INIT-F2-26
     1098   SUB-INIT-F2-27
     1148   SUB-INIT-F2-28 . . . . . . . .  G1118
     1226   SUB-INIT-F2-29 . . . . . . . .  G1175
      522   SUB-INIT-F2-3-1
     1293   SUB-INIT-F2-30 . . . . . . . .  G1250
     1371   SUB-INIT-F2-31 . . . . . . . .  G1320
     1438   SUB-INIT-F2-32 . . . . . . . .  G1395
     1518   SUB-INIT-F2-33 . . . . . . . .  G1467
     1587   SUB-INIT-F2-34 . . . . . . . .  G1544
     1676   SUB-INIT-F2-35 . . . . . . . .  G1610
     1768   SUB-INIT-F2-36 . . . . . . . .  G1702
     1857   SUB-INIT-F2-37 . . . . . . . .  G1791
     1949   SUB-INIT-F2-38 . . . . . . . .  G1883
     2010   SUB-INIT-F2-39 . . . . . . . .  G1970
      556   SUB-INIT-F2-4-1
      590   SUB-INIT-F2-5
     1021   SUB-PASS-F2-23 . . . . . . . .  G1017
     1067   SUB-PASS-F2-25 . . . . . . . .  G1059
      489   SUB-TEST-F2-1
      712   SUB-TEST-F2-10-1
      731   SUB-TEST-F2-10-2
      748   SUB-TEST-F2-11
      771   SUB-TEST-F2-12
      793   SUB-TEST-F2-13
      816   SUB-TEST-F2-14
      831   SUB-TEST-F2-15-1
      845   SUB-TEST-F2-15-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    48
0 Defined   Cross-reference of procedures   References

0     861   SUB-TEST-F2-16-1
      879   SUB-TEST-F2-16-2
      893   SUB-TEST-F2-17-1
      911   SUB-TEST-F2-17-2
      925   SUB-TEST-F2-18
      941   SUB-TEST-F2-19
      506   SUB-TEST-F2-2
      957   SUB-TEST-F2-20
      973   SUB-TEST-F2-21
      989   SUB-TEST-F2-22
     1010   SUB-TEST-F2-23
     1031   SUB-TEST-F2-24
     1055   SUB-TEST-F2-25
     1077   SUB-TEST-F2-26
     1110   SUB-TEST-F2-27-0
     1119   SUB-TEST-F2-27-1 . . . . . . .  G1114
     1127   SUB-TEST-F2-27-2
     1134   SUB-TEST-F2-27-3
     1141   SUB-TEST-F2-27-4
     1163   SUB-TEST-F2-28-0
     1176   SUB-TEST-F2-28-1 . . . . . . .  G1171
     1184   SUB-TEST-F2-28-2
     1191   SUB-TEST-F2-28-3
     1198   SUB-TEST-F2-28-4
     1205   SUB-TEST-F2-28-5
     1213   SUB-TEST-F2-28-6
     1240   SUB-TEST-F2-29-0
     1251   SUB-TEST-F2-29-1 . . . . . . .  G1246
     1259   SUB-TEST-F2-29-2
     1266   SUB-TEST-F2-29-3
     1273   SUB-TEST-F2-29-4
     1280   SUB-TEST-F2-29-5
      525   SUB-TEST-F2-3-1
      540   SUB-TEST-F2-3-2
     1308   SUB-TEST-F2-30-0
     1321   SUB-TEST-F2-30-1 . . . . . . .  G1316
     1329   SUB-TEST-F2-30-2
     1336   SUB-TEST-F2-30-3
     1343   SUB-TEST-F2-30-4
     1350   SUB-TEST-F2-30-5
     1358   SUB-TEST-F2-30-6
     1385   SUB-TEST-F2-31-0
     1396   SUB-TEST-F2-31-1 . . . . . . .  G1391
     1404   SUB-TEST-F2-31-2
     1411   SUB-TEST-F2-31-3
     1418   SUB-TEST-F2-31-4
     1425   SUB-TEST-F2-31-5
     1453   SUB-TEST-F2-32-0
     1468   SUB-TEST-F2-32-1 . . . . . . .  G1463
     1476   SUB-TEST-F2-32-2
     1483   SUB-TEST-F2-32-3
     1490   SUB-TEST-F2-32-4
     1497   SUB-TEST-F2-32-5
     1505   SUB-TEST-F2-32-6
     1532   SUB-TEST-F2-33-0
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    49
0 Defined   Cross-reference of procedures   References

0    1545   SUB-TEST-F2-33-1 . . . . . . .  G1540
     1553   SUB-TEST-F2-33-2
     1560   SUB-TEST-F2-33-3
     1567   SUB-TEST-F2-33-4
     1574   SUB-TEST-F2-33-5
     1597   SUB-TEST-F2-34-0
     1611   SUB-TEST-F2-34-1 . . . . . . .  G1606
     1624   SUB-TEST-F2-34-2
     1637   SUB-TEST-F2-34-3
     1650   SUB-TEST-F2-34-4
     1663   SUB-TEST-F2-34-5
     1686   SUB-TEST-F2-35-0
     1703   SUB-TEST-F2-35-1 . . . . . . .  G1698
     1716   SUB-TEST-F2-35-2
     1729   SUB-TEST-F2-35-3
     1742   SUB-TEST-F2-35-4
     1755   SUB-TEST-F2-35-5
     1778   SUB-TEST-F2-36-0
     1792   SUB-TEST-F2-36-1 . . . . . . .  G1787
     1805   SUB-TEST-F2-36-2
     1818   SUB-TEST-F2-36-3
     1831   SUB-TEST-F2-36-4
     1844   SUB-TEST-F2-36-5
     1867   SUB-TEST-F2-37-0
     1884   SUB-TEST-F2-37-1 . . . . . . .  G1879
     1897   SUB-TEST-F2-37-2
     1910   SUB-TEST-F2-37-3
     1923   SUB-TEST-F2-37-4
     1936   SUB-TEST-F2-37-5
     1957   SUB-TEST-F2-38-0
     1971   SUB-TEST-F2-38-1 . . . . . . .  G1966
     1984   SUB-TEST-F2-38-2
     1997   SUB-TEST-F2-38-3
     2018   SUB-TEST-F2-39-0
     2035   SUB-TEST-F2-39-1 . . . . . . .  G2030
     2048   SUB-TEST-F2-39-2
     2061   SUB-TEST-F2-39-3
      559   SUB-TEST-F2-4-1
      574   SUB-TEST-F2-4-2
      592   SUB-TEST-F2-5
      609   SUB-TEST-F2-6
      628   SUB-TEST-F2-7
      647   SUB-TEST-F2-8-1
      662   SUB-TEST-F2-8-2
      678   SUB-TEST-F2-9-1
      696   SUB-TEST-F2-9-2
      503   SUB-WRITE-F2-1 . . . . . . . .  G494 G498
      728   SUB-WRITE-F2-10-1. . . . . . .  G721 G724
      743   SUB-WRITE-F2-10-2. . . . . . .  G733 G738
      768   SUB-WRITE-F2-11. . . . . . . .  G759 G763
      790   SUB-WRITE-F2-12. . . . . . . .  G781 G785
      813   SUB-WRITE-F2-13. . . . . . . .  G804 G808
      828   SUB-WRITE-F2-14. . . . . . . .  G819 G823
      842   SUB-WRITE-F2-15-1. . . . . . .  G834 G838
      858   SUB-WRITE-F2-15-2. . . . . . .  G847 G852
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    50
0 Defined   Cross-reference of procedures   References

0     876   SUB-WRITE-F2-16-1. . . . . . .  G869 G873
      890   SUB-WRITE-F2-16-2. . . . . . .  G885 G887
      908   SUB-WRITE-F2-17-1. . . . . . .  G901 G905
      922   SUB-WRITE-F2-17-2. . . . . . .  G917 G919
      938   SUB-WRITE-F2-18. . . . . . . .  G931 G935
      954   SUB-WRITE-F2-19. . . . . . . .  G947 G951
      519   SUB-WRITE-F2-2 . . . . . . . .  G510 G514
      970   SUB-WRITE-F2-20. . . . . . . .  G963 G967
      986   SUB-WRITE-F2-21. . . . . . . .  G979 G983
     1002   SUB-WRITE-F2-22. . . . . . . .  G995 G999
     1023   SUB-WRITE-F2-23. . . . . . . .  G1016 G1020
     1047   SUB-WRITE-F2-24. . . . . . . .  G1039 G1043
     1069   SUB-WRITE-F2-25. . . . . . . .  G1063 G1066
     1094   SUB-WRITE-F2-26. . . . . . . .  G1087 G1090
      537   SUB-WRITE-F2-3-1 . . . . . . .  G528 G532
      553   SUB-WRITE-F2-3-2 . . . . . . .  G543 G547
      571   SUB-WRITE-F2-4-1 . . . . . . .  G562 G566
      587   SUB-WRITE-F2-4-2 . . . . . . .  G577 G581
      606   SUB-WRITE-F2-5 . . . . . . . .  G597 G601
      625   SUB-WRITE-F2-6 . . . . . . . .  G616 G620
      644   SUB-WRITE-F2-7 . . . . . . . .  G635 G639
      659   SUB-WRITE-F2-8-1 . . . . . . .  G651 G655
      675   SUB-WRITE-F2-8-2 . . . . . . .  G664 G669
      693   SUB-WRITE-F2-9-1 . . . . . . .  G685 G689
      709   SUB-WRITE-F2-9-2 . . . . . . .  G698 G703
      377   TERMINATE-CALL
      375   TERMINATE-CCVS
      438   WRITE-LINE . . . . . . . . . .  P388 P389 P397 P398 P399 P400 P402 P403 P404 P406 P408 P417 P425 P431 P436 P437
                                            P465 P469 P471 P480
      454   WRT-LN . . . . . . . . . . . .  P444 P445 P446 P447 P448 P449 P450 P453 P458
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    51
0 Defined   Cross-reference of programs     References

        3   NC175A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC175A    Date 06/04/2022  Time 11:59:45   Page    52
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC175A:
 *    Source records = 2076
 *    Data Division statements = 204
 *    Procedure Division statements = 1361
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1384
0End of compilation 1,  program NC175A,  highest severity 0.
0Return code 0
