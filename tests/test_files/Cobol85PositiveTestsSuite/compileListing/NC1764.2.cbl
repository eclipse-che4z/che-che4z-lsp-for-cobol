1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:40   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:40   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1764.2
   000002         000200 PROGRAM-ID.                                                      NC1764.2
   000003         000300     NC176A.                                                      NC1764.2
   000004         000500*                                                              *  NC1764.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1764.2
   000006         000700*                                                              *  NC1764.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1764.2
   000008         000900*                                                              *  NC1764.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1764.2
   000010         001100*                                                              *  NC1764.2
   000011         001300*                                                              *  NC1764.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1764.2
   000013         001500*                                                              *  NC1764.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1764.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1764.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1764.2
   000017         001900*                                                              *  NC1764.2
   000018         002100*                                                                 NC1764.2
   000019         002200*    PROGRAM NC176A TESTS FORMAT 1 OF THE ADD STATEMENT.          NC1764.2
   000020         002300*    VARIOUS COMBINATINS OF DATA-ITEMS AND ALL                    NC1764.2
   000021         002400*    OPTIONAL PHRASES ARE TESTED.                                 NC1764.2
   000022         002500*                                                                 NC1764.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1764.2
   000024         002700 CONFIGURATION SECTION.                                           NC1764.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1764.2
   000026         002900     XXXXX082.                                                    NC1764.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1764.2
   000028         003100     XXXXX083.                                                    NC1764.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1764.2
   000030         003300 FILE-CONTROL.                                                    NC1764.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1764.2 35
   000032         003500     XXXXX055.                                                    NC1764.2
   000033         003600 DATA DIVISION.                                                   NC1764.2
   000034         003700 FILE SECTION.                                                    NC1764.2
   000035         003800 FD  PRINT-FILE.                                                  NC1764.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1764.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1764.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1764.2
   000039         004200 01  42-DATANAMES.                                                NC1764.2
   000040         004300     02  DNAME1   PICTURE 9       VALUE 1  COMPUTATIONAL.         NC1764.2
   000041         004400     02  DNAME2   PICTURE 99      VALUE 1  COMPUTATIONAL.         NC1764.2
   000042         004500     02  DNAME3   PICTURE 999     VALUE 1  COMPUTATIONAL.         NC1764.2
   000043         004600     02  DNAME4   PICTURE 9(4)    VALUE 1  COMPUTATIONAL.         NC1764.2
   000044         004700     02  DNAME5   PICTURE 9(5)    VALUE 1  COMPUTATIONAL.         NC1764.2
   000045         004800     02  DNAME6   PICTURE 9(6)    VALUE 1  COMPUTATIONAL.         NC1764.2
   000046         004900     02  DNAME7   PICTURE 9(7)    VALUE 1  COMPUTATIONAL.         NC1764.2
   000047         005000     02  DNAME8   PICTURE 9(8)    VALUE 1  COMPUTATIONAL.         NC1764.2
   000048         005100     02  DNAME9   PICTURE 9(9)    VALUE 1  COMPUTATIONAL.         NC1764.2
   000049         005200     02  DNAME10  PICTURE 9(10)   VALUE 1.                        NC1764.2
   000050         005300     02  DNAME11  PICTURE 9(11)   VALUE 1.                        NC1764.2
   000051         005400     02  DNAME12  PICTURE 9(12)   VALUE 1.                        NC1764.2
   000052         005500     02  DNAME13  PICTURE 9(13)   VALUE 1.                        NC1764.2
   000053         005600     02  DNAME14  PICTURE 9(14)   VALUE 1.                        NC1764.2
   000054         005700     02  DNAME15  PICTURE 9(15)   VALUE 1.                        NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800     02  DNAME16  PICTURE 9(16)   VALUE 1.                        NC1764.2
   000056         005900     02  DNAME17  PICTURE 9(17)   VALUE 1.                        NC1764.2
   000057         006000     02  DNAME18  PICTURE 9(18)   VALUE 1.                        NC1764.2
   000058         006100     02  DNAME19  PICTURE 9       VALUE 1.                        NC1764.2
   000059         006200     02  DNAME20  PICTURE 99      VALUE 1.                        NC1764.2
   000060         006300     02  DNAME21  PICTURE 999     VALUE 1.                        NC1764.2
   000061         006400     02  DNAME22  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000062         006500     02  DNAME23  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000063         006600     02  DNAME24  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000064         006700     02  DNAME25  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000065         006800     02  DNAME26  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000066         006900     02  DNAME27  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000067         007000     02  DNAME28  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000068         007100     02  DNAME29  PICTURE 9(18)  VALUE ZERO.                      NC1764.2 IMP
   000069         007200     02  DNAME30   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000070         007300     02  DNAME31   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000071         007400     02  DNAME32   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000072         007500     02  DNAME33   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000073         007600     02  DNAME34   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000074         007700     02  DNAME35   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000075         007800     02  DNAME36   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000076         007900     02  DNAME37   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000077         008000     02  DNAME38   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000078         008100     02  DNAME39   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000079         008200     02  DNAME40   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000080         008300     02  DNAME41   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000081         008400     02  DNAME42   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1764.2 IMP
   000082         008500 77  SIZE-ERR                     PICTURE X  VALUE SPACE.         NC1764.2 IMP
   000083         008600 77  SIZE-ERR2                    PICTURE X  VALUE SPACE.         NC1764.2 IMP
   000084         008700 77  SIZE-ERR3                    PICTURE X  VALUE SPACE.         NC1764.2 IMP
   000085         008800 77  SIZE-ERR4                    PICTURE X  VALUE SPACE.         NC1764.2 IMP
   000086         008900 77  A18TWOS-DS-18V00             PICTURE S9(18)                  NC1764.2
   000087         009000                                  VALUE 222222222222222222.       NC1764.2
   000088         009100 77  A18ONES-DS-18V00             PICTURE S9(18)                  NC1764.2
   000089         009200                                  VALUE 111111111111111111.       NC1764.2
   000090         009300 77  WRK-DS-10V00                 PICTURE S9(10).                 NC1764.2
   000091         009400 77  A17TWOS-DS-17V00             PICTURE S9(17)                  NC1764.2
   000092         009500                                  VALUE 22222222222222222.        NC1764.2
   000093         009600 77  A10ONES-DS-10V00             PICTURE S9(10)                  NC1764.2
   000094         009700                                  VALUE 1111111111.               NC1764.2
   000095         009800 77  A05ONES-DS-05V00             PICTURE S9(5)                   NC1764.2
   000096         009900                                  VALUE 11111.                    NC1764.2
   000097         010000 77  A02ONES-DS-02V00             PICTURE S99                     NC1764.2
   000098         010100                                  VALUE 11.                       NC1764.2
   000099         010200 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1764.2
   000100         010300 77  WRK-DS-18V00 REDEFINES WRK-DS-09V09                          NC1764.2 99
   000101         010400                                  PICTURE S9(18).                 NC1764.2
   000102         010500 77  A06THREES-DS-03V03           PICTURE S999V999                NC1764.2
   000103         010600                                  VALUE 333.333.                  NC1764.2
   000104         010700 77  A12THREES-DS-06V06           PICTURE S9(6)V9(6)              NC1764.2
   000105         010800                                  VALUE 333333.333333.            NC1764.2
   000106         010900 77  WRK-DS-06V06                 PICTURE S9(6)V9(6).             NC1764.2
   000107         011000 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06                        NC1764.2 106
   000108         011100                                  PICTURE S9(12).                 NC1764.2
   000109         011200 77  A05ONES-DS-00V05             PICTURE SV9(5)                  NC1764.2
   000110         011300                                  VALUE .11111.                   NC1764.2
   000111         011400 77  WRK-DS-05V00                 PICTURE S9(5).                  NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500 77  WRK-DS-02V00                 PICTURE S99.                    NC1764.2
   000113         011600 77  A12ONES-DS-12V00             PICTURE S9(12)                  NC1764.2
   000114         011700                                  VALUE 111111111111.             NC1764.2
   000115         011800 77  WRK-DS-03V10                 PICTURE S999V9(10).             NC1764.2
   000116         011900 77  WRK-DS-13V00-S REDEFINES WRK-DS-03V10                        NC1764.2 115
   000117         012000                                  PICTURE S9(13).                 NC1764.2
   000118         012100 77  A99-DS-02V00                 PICTURE S99                     NC1764.2
   000119         012200                                  VALUE 99.                       NC1764.2
   000120         012300 77  A03ONES-DS-02V01             PICTURE S99V9                   NC1764.2
   000121         012400                                  VALUE 11.1.                     NC1764.2
   000122         012500 77  A06ONES-DS-03V03             PICTURE S999V999                NC1764.2
   000123         012600                                  VALUE 111.111.                  NC1764.2
   000124         012700 77  A08TWOS-DS-02V06             PICTURE S99V9(6)                NC1764.2
   000125         012800                                  VALUE 22.222222.                NC1764.2
   000126         012900 77  A01ONE-DS-P0801              PICTURE SP(8)9                  NC1764.2
   000127         013000                                  VALUE .000000001.               NC1764.2
   000128         013100 77  WRK-CS-18V00                 PICTURE S9(18) COMPUTATIONAL.   NC1764.2
   000129         013200 77  A18ONES-CS-18V00             PICTURE S9(18) COMPUTATIONAL    NC1764.2
   000130         013300                                  VALUE 111111111111111111.       NC1764.2
   000131         013400 77  WRK-CS-02V02                 PICTURE S99V99 COMPUTATIONAL.   NC1764.2
   000132         013500 77  A99-CS-02V00                 PICTURE S99 COMPUTATIONAL       NC1764.2
   000133         013600                                  VALUE 99.                       NC1764.2
   000134         013700 77  WRK-DS-0201P                 PICTURE S99P.                   NC1764.2
   000135         013800 77  WRK-DS-06V00                 PICTURE S9(6).                  NC1764.2
   000136         013900 77  AZERO-DS-05V05               PICTURE S9(5)V9(5)              NC1764.2
   000137         014000                                  VALUE ZERO.                     NC1764.2 IMP
   000138         014100 77  NDATA-DS-09V09               PICTURE S9(9)V9(9)              NC1764.2
   000139         014200                                  VALUE +012345678.876543210.     NC1764.2
   000140         014300 77  XDATA-XN-00018               PICTURE X(18)                   NC1764.2
   000141         014400                                  VALUE "00ABCDEFGHI  4321 ".     NC1764.2
   000142         014500 77  WRK-XN-00018                 PICTURE X(18).                  NC1764.2
   000143         014600 77  WRK-XN-00001                 PICTURE X.                      NC1764.2
   000144         014700 77  ADD-12    PICTURE PP9        VALUE .001.                     NC1764.2
   000145         014800 77  ADD-13    PICTURE 9PP        VALUE 100.                      NC1764.2
   000146         014900 77  ADD-14    PICTURE 999V999.                                   NC1764.2
   000147         015000 77  WRK-CU-18V00      PICTURE 9(18) VALUE ZERO COMPUTATIONAL.    NC1764.2 IMP
   000148         015100 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1764.2 IMP
   000149         015200 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1764.2
   000150         015300 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1764.2
   000151         015400 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1764.2
   000152         015500 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1764.2
   000153         015600 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1764.2
   000154         015700 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1764.2
   000155         015800 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1764.2
   000156         015900 01  WRK-DU-2V0-1 PIC 99.                                         NC1764.2
   000157         016000 01  WRK-DU-2V0-2 PIC 99.                                         NC1764.2
   000158         016100 01  WRK-DU-2V0-3 PIC 99.                                         NC1764.2
   000159         016200 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1764.2
   000160         016300 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1764.2
   000161         016400 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1764.2
   000162         016500 77  A18EIGHTS-CS-18V00 PICTURE S9(18) VALUE -888888888888888888  NC1764.2
   000163         016600             COMPUTATIONAL.                                       NC1764.2
   000164         016700 77  A14TWOS-CS-18V00  PICTURE S9(18) VALUE -000022222222222222   NC1764.2
   000165         016800             COMPUTATIONAL.                                       NC1764.2
   000166         016900 77  A12THREES-CU-18V00 PICTURE 9(18) VALUE 000000333333333333    NC1764.2
   000167         017000             COMPUTATIONAL.                                       NC1764.2
   000168         017100 77  A16FOURS-CS-18V00 PICTURE S9(18) VALUE 004444444444444444    NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200             COMPUTATIONAL.                                       NC1764.2
   000170         017300 77  A18FIVES-CS-18V00 PICTURE S9(18) VALUE -555555555555555555   NC1764.2
   000171         017400             COMPUTATIONAL.                                       NC1764.2
   000172         017500 77  A18SIXES-CS-18V00 PICTURE S9(18) VALUE 666666666666666666    NC1764.2
   000173         017600             COMPUTATIONAL.                                       NC1764.2
   000174         017700 77  A12SEVENS-CU-18V00 PICTURE 9(18) VALUE 000000777777777777    NC1764.2
   000175         017800             COMPUTATIONAL.                                       NC1764.2
   000176         017900 77  WRK-DU-18V00      PICTURE 9(18) VALUE ZERO.                  NC1764.2 IMP
   000177         018000 77  A18THREES-CS-18V00 PICTURE S9(18) VALUE -333333333333333333  NC1764.2
   000178         018100             COMPUTATIONAL.                                       NC1764.2
   000179         018200 77  WRK-CS-03V00 PICTURE S999 COMPUTATIONAL SYNCHRONIZED RIGHT.  NC1764.2
   000180         018300 01  SUBTRACT-DATA.                                               NC1764.2
   000181         018400     02  SUBTR-1    PICTURE 9         VALUE 1.                    NC1764.2
   000182         018500     02  SUBTR-2    PICTURE S99       VALUE 99.                   NC1764.2
   000183         018600     02  SUBTR-3    PICTURE S9V99     VALUE -1.                   NC1764.2
   000184         018700     02  SUBTR-4    PICTURE SPP9      VALUE .001.                 NC1764.2
   000185         018800     02  SUBTR-5    PICTURE S9PP      VALUE 100.                  NC1764.2
   000186         018900     02  SUBTR-6    PICTURE 9  VALUE 1.                           NC1764.2
   000187         019000     02  SUBTR-7    PICTURE S99  VALUE 99.                        NC1764.2
   000188         019100     02  SUBTR-8    PICTURE S9V99  VALUE -9.99.                   NC1764.2
   000189         019200     02  SUBTR-10    PICTURE S999  VALUE 100.                     NC1764.2
   000190         019300     02  SUBTR-11   PICTURE S999V999.                             NC1764.2
   000191         019400 01  N-3                                PICTURE IS 99999.         NC1764.2
   000192         019500 01  N-4                                PICTURE IS 9(5)           NC1764.2
   000193         019600     VALUE IS 52800.                                              NC1764.2
   000194         019700 01  N-5                                PICTURE IS S9(9)V99       NC1764.2
   000195         019800     VALUE IS 000000001.00.                                       NC1764.2
   000196         019900 01  N-7                                PICTURE IS S9(7)V9(4)     NC1764.2
   000197         020000     VALUE IS 0000001.0000.                                       NC1764.2
   000198         020100 01  X-8 REDEFINES N-7                  PICTURE IS X(11).         NC1764.2 196
   000199         020200 01  N-10                               PICTURE IS S99999V        NC1764.2
   000200         020300     VALUE IS -00001.                                             NC1764.2
   000201         020400 01  N-11                               PICTURE IS 9 VALUE IS 9.  NC1764.2
   000202         020500 01  N-12                               PICTURE IS 9 VALUE IS 9.  NC1764.2
   000203         020600 01  N-13                               PICTURE IS 9(5)           NC1764.2
   000204         020700     VALUE IS 99999.                                              NC1764.2
   000205         020800 01  N-14                               PICTURE IS 9 VALUE IS 1.  NC1764.2
   000206         020900 01  N-15                               PICTURE IS 9(16).         NC1764.2
   000207         021000 01  N-16                               PICTURE IS S999999V99     NC1764.2
   000208         021100     VALUE IS 5.90.                                               NC1764.2
   000209         021200 01  N-17                               PICTURE IS S9(3)V99       NC1764.2
   000210         021300     VALUE IS +3.6.                                               NC1764.2
   000211         021400 01  N-18                               PICTURE IS S9(10)         NC1764.2
   000212         021500     VALUE IS -5.                                                 NC1764.2
   000213         021600 01  N-19                               PICTURE IS $9.00.         NC1764.2
   000214         021700 01  N-20                               PICTURE IS S9(9)          NC1764.2
   000215         021800     VALUE IS -999999999.                                         NC1764.2
   000216         021900 01  N-21                               PICTURE IS 9 VALUE IS 5.  NC1764.2
   000217         022000 01  N-22                               PICTURE IS 999V99         NC1764.2
   000218         022100     VALUE IS 005.55.                                             NC1764.2
   000219         022200 01  N-23                               PICTURE IS $$$.99CR.      NC1764.2
   000220         022300 01  N-25                               PICTURE IS 9 VALUE IS 1.  NC1764.2
   000221         022400 01  N-26               PICTURE 9(5).                             NC1764.2
   000222         022500 01  N-27                               PICTURE IS 9999V9         NC1764.2
   000223         022600     VALUE IS 9999.9.                                             NC1764.2
   000224         022700 01  N-28                               PICTURE IS $9999.00.      NC1764.2
   000225         022800 01  N-40                               PICTURE IS 9(7)           NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     VALUE IS 7777777.                                            NC1764.2
   000227         023000 01  N-41                               PICTURE IS 9(7)           NC1764.2
   000228         023100     VALUE IS 1111111.                                            NC1764.2
   000229         023200 01  N-42                               PICTURE IS 9(3)P(4).      NC1764.2
   000230         023300 01  TRUNC-DATA.                                                  NC1764.2
   000231         023400     02 N-43  PICTURE S9V9 VALUE +1.6.                            NC1764.2
   000232         023500     02 N-44  PICTURE S9V9 VALUE -1.6.                            NC1764.2
   000233         023600     02 N-45  PICTURE S9.                                         NC1764.2
   000234         023700 01  MINUS-NAMES.                                                 NC1764.2
   000235         023800     02  MINUS-NAME1 PICTURE S9(18) VALUE -999999999999999999.    NC1764.2
   000236         023900     02  MINUS-NAME2 PICTURE S9(18) VALUE -999999999999999999.    NC1764.2
   000237         024000     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC1764.2
   000238         024100     02  PLUS-NAME1  PICTURE S9(18) VALUE +999999999999999999.    NC1764.2
   000239         024200     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC1764.2
   000240         024300     02  MINUS-NAME3 PICTURE SV9(18) VALUE -.999999999999999999.  NC1764.2
   000241         024400     02  MINUS-NAME4 PICTURE SV9(18) VALUE -.999999999999999999.  NC1764.2
   000242         024500     02  EVEN-NAME2  PICTURE SV9(18)  VALUE +.1.                  NC1764.2
   000243         024600     02  PLUS-NAME3  PICTURE SV9(18) VALUE +.999999999999999999.  NC1764.2
   000244         024700     02  PLUS-NAME4  PICTURE SV9(18) VALUE +.999999999999999999.  NC1764.2
   000245         024800     02  WHOLE-FIELD   PICTURE S9(18).                            NC1764.2
   000246         024900     02  DECMAL-FIELD  PICTURE SV9(18).                           NC1764.2
   000247         025000 01  TEST-RESULTS.                                                NC1764.2
   000248         025100     02 FILLER                   PIC X      VALUE SPACE.          NC1764.2 IMP
   000249         025200     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1764.2 IMP
   000250         025300     02 FILLER                   PIC X      VALUE SPACE.          NC1764.2 IMP
   000251         025400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1764.2 IMP
   000252         025500     02 FILLER                   PIC X      VALUE SPACE.          NC1764.2 IMP
   000253         025600     02  PAR-NAME.                                                NC1764.2
   000254         025700       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1764.2 IMP
   000255         025800       03  PARDOT-X              PIC X      VALUE SPACE.          NC1764.2 IMP
   000256         025900       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1764.2 IMP
   000257         026000     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1764.2 IMP
   000258         026100     02 RE-MARK                  PIC X(61).                       NC1764.2
   000259         026200 01  TEST-COMPUTED.                                               NC1764.2
   000260         026300     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1764.2 IMP
   000261         026400     02 FILLER                   PIC X(17)  VALUE                 NC1764.2
   000262         026500            "       COMPUTED=".                                   NC1764.2
   000263         026600     02 COMPUTED-X.                                               NC1764.2
   000264         026700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1764.2 IMP
   000265         026800     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1764.2 264
   000266         026900                                 PIC -9(9).9(9).                  NC1764.2
   000267         027000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1764.2 264
   000268         027100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1764.2 264
   000269         027200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1764.2 264
   000270         027300     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1764.2 264
   000271         027400         04 COMPUTED-18V0                    PIC -9(18).          NC1764.2
   000272         027500         04 FILLER                           PIC X.               NC1764.2
   000273         027600     03 FILLER PIC X(50) VALUE SPACE.                             NC1764.2 IMP
   000274         027700 01  TEST-CORRECT.                                                NC1764.2
   000275         027800     02 FILLER PIC X(30) VALUE SPACE.                             NC1764.2 IMP
   000276         027900     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1764.2
   000277         028000     02 CORRECT-X.                                                NC1764.2
   000278         028100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1764.2 IMP
   000279         028200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1764.2 278
   000280         028300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1764.2 278
   000281         028400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1764.2 278
   000282         028500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1764.2 278
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     03      CR-18V0 REDEFINES CORRECT-A.                         NC1764.2 278
   000284         028700         04 CORRECT-18V0                     PIC -9(18).          NC1764.2
   000285         028800         04 FILLER                           PIC X.               NC1764.2
   000286         028900     03 FILLER PIC X(2) VALUE SPACE.                              NC1764.2 IMP
   000287         029000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1764.2 IMP
   000288         029100 01  CCVS-C-1.                                                    NC1764.2
   000289         029200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1764.2
   000290         029300-    "SS  PARAGRAPH-NAME                                          NC1764.2
   000291         029400-    "       REMARKS".                                            NC1764.2
   000292         029500     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1764.2 IMP
   000293         029600 01  CCVS-C-2.                                                    NC1764.2
   000294         029700     02 FILLER                     PIC X        VALUE SPACE.      NC1764.2 IMP
   000295         029800     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1764.2
   000296         029900     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1764.2 IMP
   000297         030000     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1764.2
   000298         030100     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1764.2 IMP
   000299         030200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1764.2 IMP
   000300         030300 01  REC-CT                        PIC 99       VALUE ZERO.       NC1764.2 IMP
   000301         030400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1764.2 IMP
   000302         030500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1764.2 IMP
   000303         030600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1764.2 IMP
   000304         030700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1764.2 IMP
   000305         030800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1764.2 IMP
   000306         030900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1764.2 IMP
   000307         031000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1764.2 IMP
   000308         031100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1764.2 IMP
   000309         031200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1764.2 IMP
   000310         031300 01  CCVS-H-1.                                                    NC1764.2
   000311         031400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1764.2 IMP
   000312         031500     02  FILLER                    PIC X(42)    VALUE             NC1764.2
   000313         031600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1764.2
   000314         031700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1764.2 IMP
   000315         031800 01  CCVS-H-2A.                                                   NC1764.2
   000316         031900   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1764.2 IMP
   000317         032000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1764.2
   000318         032100   02  FILLER                        PIC XXXX   VALUE             NC1764.2
   000319         032200     "4.2 ".                                                      NC1764.2
   000320         032300   02  FILLER                        PIC X(28)  VALUE             NC1764.2
   000321         032400            " COPY - NOT FOR DISTRIBUTION".                       NC1764.2
   000322         032500   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1764.2 IMP
   000323         032600                                                                  NC1764.2
   000324         032700 01  CCVS-H-2B.                                                   NC1764.2
   000325         032800   02  FILLER                        PIC X(15)  VALUE             NC1764.2
   000326         032900            "TEST RESULT OF ".                                    NC1764.2
   000327         033000   02  TEST-ID                       PIC X(9).                    NC1764.2
   000328         033100   02  FILLER                        PIC X(4)   VALUE             NC1764.2
   000329         033200            " IN ".                                               NC1764.2
   000330         033300   02  FILLER                        PIC X(12)  VALUE             NC1764.2
   000331         033400     " HIGH       ".                                              NC1764.2
   000332         033500   02  FILLER                        PIC X(22)  VALUE             NC1764.2
   000333         033600            " LEVEL VALIDATION FOR ".                             NC1764.2
   000334         033700   02  FILLER                        PIC X(58)  VALUE             NC1764.2
   000335         033800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1764.2
   000336         033900 01  CCVS-H-3.                                                    NC1764.2
   000337         034000     02  FILLER                      PIC X(34)  VALUE             NC1764.2
   000338         034100            " FOR OFFICIAL USE ONLY    ".                         NC1764.2
   000339         034200     02  FILLER                      PIC X(58)  VALUE             NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1764.2
   000341         034400     02  FILLER                      PIC X(28)  VALUE             NC1764.2
   000342         034500            "  COPYRIGHT   1985 ".                                NC1764.2
   000343         034600 01  CCVS-E-1.                                                    NC1764.2
   000344         034700     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1764.2 IMP
   000345         034800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1764.2
   000346         034900     02 ID-AGAIN                     PIC X(9).                    NC1764.2
   000347         035000     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1764.2 IMP
   000348         035100 01  CCVS-E-2.                                                    NC1764.2
   000349         035200     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1764.2 IMP
   000350         035300     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1764.2 IMP
   000351         035400     02 CCVS-E-2-2.                                               NC1764.2
   000352         035500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1764.2 IMP
   000353         035600         03 FILLER                   PIC X      VALUE SPACE.      NC1764.2 IMP
   000354         035700         03 ENDER-DESC               PIC X(44)  VALUE             NC1764.2
   000355         035800            "ERRORS ENCOUNTERED".                                 NC1764.2
   000356         035900 01  CCVS-E-3.                                                    NC1764.2
   000357         036000     02  FILLER                      PIC X(22)  VALUE             NC1764.2
   000358         036100            " FOR OFFICIAL USE ONLY".                             NC1764.2
   000359         036200     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1764.2 IMP
   000360         036300     02  FILLER                      PIC X(58)  VALUE             NC1764.2
   000361         036400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1764.2
   000362         036500     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1764.2 IMP
   000363         036600     02 FILLER                       PIC X(15)  VALUE             NC1764.2
   000364         036700             " COPYRIGHT 1985".                                   NC1764.2
   000365         036800 01  CCVS-E-4.                                                    NC1764.2
   000366         036900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1764.2 IMP
   000367         037000     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1764.2
   000368         037100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1764.2 IMP
   000369         037200     02 FILLER                       PIC X(40)  VALUE             NC1764.2
   000370         037300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1764.2
   000371         037400 01  XXINFO.                                                      NC1764.2
   000372         037500     02 FILLER                       PIC X(19)  VALUE             NC1764.2
   000373         037600            "*** INFORMATION ***".                                NC1764.2
   000374         037700     02 INFO-TEXT.                                                NC1764.2
   000375         037800       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1764.2 IMP
   000376         037900       04 XXCOMPUTED                 PIC X(20).                   NC1764.2
   000377         038000       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1764.2 IMP
   000378         038100       04 XXCORRECT                  PIC X(20).                   NC1764.2
   000379         038200     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1764.2
   000380         038300 01  HYPHEN-LINE.                                                 NC1764.2
   000381         038400     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1764.2 IMP
   000382         038500     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1764.2
   000383         038600-    "*****************************************".                 NC1764.2
   000384         038700     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1764.2
   000385         038800-    "******************************".                            NC1764.2
   000386         038900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1764.2
   000387         039000     "NC176A".                                                    NC1764.2
   000388         039100 PROCEDURE DIVISION.                                              NC1764.2
   000389         039200 CCVS1 SECTION.                                                   NC1764.2
   000390         039300 OPEN-FILES.                                                      NC1764.2
   000391         039400     OPEN     OUTPUT PRINT-FILE.                                  NC1764.2 35
   000392         039500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1764.2 386 327 386 346
   000393         039600     MOVE    SPACE TO TEST-RESULTS.                               NC1764.2 IMP 247
   000394         039700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1764.2 419 424
   000395         039800     GO TO CCVS1-EXIT.                                            NC1764.2 506
   000396         039900 CLOSE-FILES.                                                     NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1764.2 428 449 35
   000398         040100 TERMINATE-CCVS.                                                  NC1764.2
   000399         040200     EXIT PROGRAM.                                                NC1764.2
   000400         040300 TERMINATE-CALL.                                                  NC1764.2
   000401         040400     STOP     RUN.                                                NC1764.2
   000402         040500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1764.2 251 303
   000403         040600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1764.2 251 304
   000404         040700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1764.2 251 302
   000405         040800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1764.2 251 301
   000406         040900     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1764.2 258
   000407         041000 PRINT-DETAIL.                                                    NC1764.2
   000408         041100     IF REC-CT NOT EQUAL TO ZERO                                  NC1764.2 300 IMP
   000409      1  041200             MOVE "." TO PARDOT-X                                 NC1764.2 255
   000410      1  041300             MOVE REC-CT TO DOTVALUE.                             NC1764.2 300 256
   000411         041400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1764.2 247 36 461
   000412         041500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1764.2 251 461
   000413      1  041600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1764.2 482 496
   000414      1  041700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1764.2 497 505
   000415         041800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1764.2 IMP 251 IMP 263
   000416         041900     MOVE SPACE TO CORRECT-X.                                     NC1764.2 IMP 277
   000417         042000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1764.2 300 IMP IMP 253
   000418         042100     MOVE     SPACE TO RE-MARK.                                   NC1764.2 IMP 258
   000419         042200 HEAD-ROUTINE.                                                    NC1764.2
   000420         042300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1764.2 310 37 461
   000421         042400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1764.2 315 37 461
   000422         042500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1764.2 324 37 461
   000423         042600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1764.2 336 37 461
   000424         042700 COLUMN-NAMES-ROUTINE.                                            NC1764.2
   000425         042800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1764.2 288 37 461
   000426         042900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1764.2 293 37 461
   000427         043000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1764.2 380 37 461
   000428         043100 END-ROUTINE.                                                     NC1764.2
   000429         043200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1764.2 380 37 461
   000430         043300 END-RTN-EXIT.                                                    NC1764.2
   000431         043400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1764.2 343 37 461
   000432         043500 END-ROUTINE-1.                                                   NC1764.2
   000433         043600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1764.2 302 306 303
   000434         043700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1764.2 306 301 306
   000435         043800      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1764.2 304 306
   000436         043900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1764.2
   000437         044000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1764.2 304 366
   000438         044100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1764.2 306 368
   000439         044200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1764.2 365 351
   000440         044300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1764.2 348 37 461
   000441         044400  END-ROUTINE-12.                                                 NC1764.2
   000442         044500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1764.2 354
   000443         044600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1764.2 302 IMP
   000444      1  044700         MOVE "NO " TO ERROR-TOTAL                                NC1764.2 352
   000445         044800         ELSE                                                     NC1764.2
   000446      1  044900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1764.2 302 352
   000447         045000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1764.2 348 37
   000448         045100     PERFORM WRITE-LINE.                                          NC1764.2 461
   000449         045200 END-ROUTINE-13.                                                  NC1764.2
   000450         045300     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1764.2 301 IMP
   000451      1  045400         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1764.2 352
   000452      1  045500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1764.2 301 352
   000453         045600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1764.2 354
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1764.2 348 37 461
   000455         045800      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1764.2 303 IMP
   000456      1  045900          MOVE "NO " TO ERROR-TOTAL                               NC1764.2 352
   000457      1  046000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1764.2 303 352
   000458         046100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1764.2 354
   000459         046200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1764.2 348 37 461
   000460         046300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1764.2 356 37 461
   000461         046400 WRITE-LINE.                                                      NC1764.2
   000462         046500     ADD 1 TO RECORD-COUNT.                                       NC1764.2 308
   000463         046600     IF RECORD-COUNT GREATER 42                                   NC1764.2 308
   000464      1  046700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1764.2 37 307
   000465      1  046800         MOVE SPACE TO DUMMY-RECORD                               NC1764.2 IMP 37
   000466      1  046900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1764.2 37
   000467      1  047000         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1764.2 310 37 477
   000468      1  047100         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1764.2 315 37 477
   000469      1  047200         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1764.2 324 37 477
   000470      1  047300         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1764.2 336 37 477
   000471      1  047400         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1764.2 288 37 477
   000472      1  047500         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1764.2 293 37 477
   000473      1  047600         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1764.2 380 37 477
   000474      1  047700         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1764.2 307 37
   000475      1  047800         MOVE ZERO TO RECORD-COUNT.                               NC1764.2 IMP 308
   000476         047900     PERFORM WRT-LN.                                              NC1764.2 477
   000477         048000 WRT-LN.                                                          NC1764.2
   000478         048100     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1764.2 37
   000479         048200     MOVE SPACE TO DUMMY-RECORD.                                  NC1764.2 IMP 37
   000480         048300 BLANK-LINE-PRINT.                                                NC1764.2
   000481         048400     PERFORM WRT-LN.                                              NC1764.2 477
   000482         048500 FAIL-ROUTINE.                                                    NC1764.2
   000483         048600     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1764.2 263 IMP
   000484      1  048700            GO TO FAIL-ROUTINE-WRITE.                             NC1764.2 491
   000485         048800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1764.2 277 IMP 491
   000486         048900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1764.2 309 379
   000487         049000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1764.2 374
   000488         049100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1764.2 371 37 461
   000489         049200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1764.2 IMP 379
   000490         049300     GO TO  FAIL-ROUTINE-EX.                                      NC1764.2 496
   000491         049400 FAIL-ROUTINE-WRITE.                                              NC1764.2
   000492         049500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1764.2 259 36 461
   000493         049600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1764.2 309 287
   000494         049700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1764.2 274 36 461
   000495         049800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1764.2 IMP 287
   000496         049900 FAIL-ROUTINE-EX. EXIT.                                           NC1764.2
   000497         050000 BAIL-OUT.                                                        NC1764.2
   000498         050100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1764.2 264 IMP 500
   000499         050200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1764.2 278 IMP 505
   000500         050300 BAIL-OUT-WRITE.                                                  NC1764.2
   000501         050400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1764.2 278 378 264 376
   000502         050500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1764.2 309 379
   000503         050600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1764.2 371 37 461
   000504         050700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1764.2 IMP 379
   000505         050800 BAIL-OUT-EX. EXIT.                                               NC1764.2
   000506         050900 CCVS1-EXIT.                                                      NC1764.2
   000507         051000     EXIT.                                                        NC1764.2
   000508         051100 SECT-NC176A-001 SECTION.                                         NC1764.2
   000509         051200 ADD-INIT-F1-1.                                                   NC1764.2
   000510         051300     MOVE "ADD" TO FEATURE.                                       NC1764.2 249
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE "VI-74 6.6.4 GR4" TO ANSI-REFERENCE.                    NC1764.2 309
   000512         051500 ADD-TEST-F1-1.                                                   NC1764.2
   000513         051600     ADD      N-5 TO N-7.                                         NC1764.2 194 196
   000514         051700     IF       N-7 IS EQUAL TO 2                                   NC1764.2 196
   000515      1  051800              PERFORM PASS                                        NC1764.2 403
   000516      1  051900              GO TO ADD-WRITE-F1-1.                               NC1764.2 525
   000517         052000     GO TO    ADD-FAIL-F1-1.                                      NC1764.2 521
   000518         052100 ADD-DELETE-F1-1.                                                 NC1764.2
   000519         052200     PERFORM  DE-LETE.                                            NC1764.2 405
   000520         052300     GO TO    ADD-WRITE-F1-1.                                     NC1764.2 525
   000521         052400 ADD-FAIL-F1-1.                                                   NC1764.2
   000522         052500     MOVE N-7 TO COMPUTED-N.                                      NC1764.2 196 265
   000523         052600     MOVE     2 TO CORRECT-N.                                     NC1764.2 279
   000524         052700     PERFORM  FAIL.                                               NC1764.2 404
   000525         052800 ADD-WRITE-F1-1.                                                  NC1764.2
   000526         052900     MOVE "ADD-TEST-F1-1 " TO PAR-NAME.                           NC1764.2 253
   000527         053000     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000528         053100 ADD-TEST-F1-2.                                                   NC1764.2
   000529         053200     ADD      -.6 TO N-10 ROUNDED.                                NC1764.2 199
   000530         053300     IF       N-10 EQUAL TO -2                                    NC1764.2 199
   000531      1  053400              PERFORM PASS                                        NC1764.2 403
   000532      1  053500              GO TO ADD-WRITE-F1-2.                               NC1764.2 541
   000533         053600     GO TO    ADD-FAIL-F1-2.                                      NC1764.2 537
   000534         053700 ADD-DELETE-F1-2.                                                 NC1764.2
   000535         053800     PERFORM  DE-LETE.                                            NC1764.2 405
   000536         053900     GO TO    ADD-WRITE-F1-2.                                     NC1764.2 541
   000537         054000 ADD-FAIL-F1-2.                                                   NC1764.2
   000538         054100     MOVE     N-10 TO COMPUTED-N.                                 NC1764.2 199 265
   000539         054200     MOVE     -2 TO CORRECT-N.                                    NC1764.2 279
   000540         054300     PERFORM  FAIL.                                               NC1764.2 404
   000541         054400 ADD-WRITE-F1-2.                                                  NC1764.2
   000542         054500     MOVE "ADD-TEST-F1-2 " TO PAR-NAME.                           NC1764.2 253
   000543         054600     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000544         054700     MOVE     -2 TO N-10.                                         NC1764.2 199
   000545         054800 ADD-TEST-F1-3-0.                                                 NC1764.2
   000546         054900     ADD      N-11 TO N-12 ON SIZE ERROR                          NC1764.2 201 202
   000547      1  055000              PERFORM PASS                                        NC1764.2 403
   000548      1  055100              GO TO ADD-WRITE-F1-3.                               NC1764.2 557
   000549         055200     GO TO    ADD-FAIL-F1-3.                                      NC1764.2 553
   000550         055300 ADD-DELETE-F1-3.                                                 NC1764.2
   000551         055400     PERFORM  DE-LETE.                                            NC1764.2 405
   000552         055500     GO TO    ADD-WRITE-F1-3.                                     NC1764.2 557
   000553         055600 ADD-FAIL-F1-3.                                                   NC1764.2
   000554         055700     MOVE     N-12 TO COMPUTED-N.                                 NC1764.2 202 265
   000555         055800     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1764.2 258
   000556         055900     PERFORM  FAIL.                                               NC1764.2 404
   000557         056000 ADD-WRITE-F1-3.                                                  NC1764.2
   000558         056100     MOVE "ADD-TEST-F1-3 " TO PAR-NAME.                           NC1764.2 253
   000559         056200     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000560         056300 ADD-TEST-F1-4-1.                                                 NC1764.2
   000561         056400     ADD      1.5 TO N-13 ROUNDED ON SIZE ERROR                   NC1764.2 203
   000562      1  056500              PERFORM PASS                                        NC1764.2 403
   000563      1  056600              GO TO ADD-WRITE-F1-4-1.                             NC1764.2 574
   000564         056700*    NOTE WHEN SIZE ERROR CONDITION OCCURS, VALUE OF              NC1764.2
   000565         056800*    N-13 SHOULD NOT BE CHANGED.                                  NC1764.2
   000566         056900     GO TO    ADD-FAIL-F1-4-1.                                    NC1764.2 570
   000567         057000 ADD-DELETE-F1-4-1.                                               NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     PERFORM  DE-LETE.                                            NC1764.2 405
   000569         057200     GO TO    ADD-WRITE-F1-4-1.                                   NC1764.2 574
   000570         057300 ADD-FAIL-F1-4-1.                                                 NC1764.2
   000571         057400     MOVE     N-13 TO COMPUTED-N.                                 NC1764.2 203 265
   000572         057500     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1764.2 258
   000573         057600     PERFORM  FAIL.                                               NC1764.2 404
   000574         057700 ADD-WRITE-F1-4-1.                                                NC1764.2
   000575         057800     MOVE "ADD-TEST-F1-4-1 " TO PAR-NAME.                         NC1764.2 253
   000576         057900     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000577         058000 ADD-TEST-F1-4-2.                                                 NC1764.2
   000578         058100     IF       N-13 IS EQUAL TO 99999                              NC1764.2 203
   000579      1  058200              PERFORM PASS                                        NC1764.2 403
   000580      1  058300              GO TO ADD-WRITE-F1-4-2.                             NC1764.2 589
   000581         058400     GO TO    ADD-FAIL-F1-4-2.                                    NC1764.2 585
   000582         058500 ADD-DELETE-F1-4-2.                                               NC1764.2
   000583         058600     PERFORM  DE-LETE.                                            NC1764.2 405
   000584         058700     GO TO    ADD-WRITE-F1-4-2.                                   NC1764.2 589
   000585         058800 ADD-FAIL-F1-4-2.                                                 NC1764.2
   000586         058900     MOVE     N-13 TO COMPUTED-N.                                 NC1764.2 203 265
   000587         059000     MOVE     99999 TO CORRECT-N.                                 NC1764.2 279
   000588         059100     PERFORM  FAIL.                                               NC1764.2 404
   000589         059200 ADD-WRITE-F1-4-2.                                                NC1764.2
   000590         059300     MOVE "ADD-TEST-F1-4-2 " TO PAR-NAME.                         NC1764.2 253
   000591         059400     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000592         059500 ADD-INIT-F1-5.                                                   NC1764.2
   000593         059600     MOVE "ADD ---" TO FEATURE.                                   NC1764.2 249
   000594         059700     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000595         059800     MOVE "  TO" TO FEATURE.                                      NC1764.2 249
   000596         059900 ADD-TEST-F1-5.                                                   NC1764.2
   000597         060000     MOVE     A18TWOS-DS-18V00 TO WRK-DS-18V00.                   NC1764.2 86 100
   000598         060100     ADD      A18ONES-DS-18V00 TO WRK-DS-18V00.                   NC1764.2 88 100
   000599         060200     IF       WRK-DS-18V00 EQUAL TO 333333333333333333            NC1764.2 100
   000600      1  060300              PERFORM PASS GO TO ADD-WRITE-F1-5.                  NC1764.2 403 609
   000601         060400     GO       TO ADD-FAIL-F1-5.                                   NC1764.2 605
   000602         060500 ADD-DELETE-F1-5.                                                 NC1764.2
   000603         060600     PERFORM  DE-LETE.                                            NC1764.2 405
   000604         060700     GO       TO ADD-WRITE-F1-5.                                  NC1764.2 609
   000605         060800 ADD-FAIL-F1-5.                                                   NC1764.2
   000606         060900     MOVE     WRK-DS-18V00 TO COMPUTED-18V0.                      NC1764.2 100 271
   000607         061000     MOVE     333333333333333333   TO CORRECT-18V0.               NC1764.2 284
   000608         061100     PERFORM  FAIL.                                               NC1764.2 404
   000609         061200 ADD-WRITE-F1-5.                                                  NC1764.2
   000610         061300     MOVE     "ADD-TEST-F1-5" TO PAR-NAME.                        NC1764.2 253
   000611         061400     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000612         061500 ADD-TEST-F1-6.                                                   NC1764.2
   000613         061600     MOVE     ZERO TO WRK-DS-10V00.                               NC1764.2 IMP 90
   000614         061700     ADD      A10ONES-DS-10V00 A05ONES-DS-05V00 TO WRK-DS-10V00.  NC1764.2 93 95 90
   000615         061800     IF       WRK-DS-10V00 EQUAL TO 1111122222                    NC1764.2 90
   000616      1  061900              PERFORM PASS GO TO ADD-WRITE-F1-6.                  NC1764.2 403 625
   000617         062000     GO       TO ADD-FAIL-F1-6.                                   NC1764.2 621
   000618         062100 ADD-DELETE-F1-6.                                                 NC1764.2
   000619         062200     PERFORM  DE-LETE.                                            NC1764.2 405
   000620         062300     GO       TO ADD-WRITE-F1-6.                                  NC1764.2 625
   000621         062400 ADD-FAIL-F1-6.                                                   NC1764.2
   000622         062500     MOVE     WRK-DS-10V00 TO COMPUTED-18V0.                      NC1764.2 90 271
   000623         062600     MOVE     1111122222   TO CORRECT-18V0.                       NC1764.2 284
   000624         062700     PERFORM  FAIL.                                               NC1764.2 404
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800 ADD-WRITE-F1-6.                                                  NC1764.2
   000626         062900     MOVE     "ADD-TEST-F1-6" TO PAR-NAME.                        NC1764.2 253
   000627         063000     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000628         063100 ADD-TEST-F1-7.                                                   NC1764.2
   000629         063200     MOVE     ZERO TO WRK-DS-10V00.                               NC1764.2 IMP 90
   000630         063300     ADD      A02ONES-DS-02V00                                    NC1764.2 97
   000631         063400              A10ONES-DS-10V00                                    NC1764.2 93
   000632         063500              A05ONES-DS-05V00 TO WRK-DS-10V00.                   NC1764.2 95 90
   000633         063600     IF       WRK-DS-10V00 EQUAL TO 1111122233                    NC1764.2 90
   000634      1  063700              PERFORM PASS GO TO ADD-WRITE-F1-7.                  NC1764.2 403 643
   000635         063800     GO       TO ADD-FAIL-F1-7.                                   NC1764.2 639
   000636         063900 ADD-DELETE-F1-7.                                                 NC1764.2
   000637         064000     PERFORM  DE-LETE.                                            NC1764.2 405
   000638         064100     GO       TO ADD-WRITE-F1-7.                                  NC1764.2 643
   000639         064200 ADD-FAIL-F1-7.                                                   NC1764.2
   000640         064300     MOVE     WRK-DS-10V00 TO COMPUTED-18V0.                      NC1764.2 90 271
   000641         064400     MOVE     1111122233   TO CORRECT-18V0.                       NC1764.2 284
   000642         064500     PERFORM  FAIL.                                               NC1764.2 404
   000643         064600 ADD-WRITE-F1-7.                                                  NC1764.2
   000644         064700     MOVE     "ADD-TEST-F1-7" TO PAR-NAME.                        NC1764.2 253
   000645         064800     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000646         064900 ADD-INIT-F1-8.                                                   NC1764.2
   000647         065000     MOVE "  ROUNDED" TO FEATURE.                                 NC1764.2 249
   000648         065100 ADD-TEST-F1-8.                                                   NC1764.2
   000649         065200     MOVE     ZERO TO WRK-DS-05V00.                               NC1764.2 IMP 111
   000650         065300     ADD      55554.5 TO WRK-DS-05V00 ROUNDED.                    NC1764.2 111
   000651         065400     IF       WRK-DS-05V00 EQUAL TO 55555                         NC1764.2 111
   000652      1  065500              PERFORM PASS GO TO ADD-WRITE-F1-8.                  NC1764.2 403 661
   000653         065600     GO       TO ADD-FAIL-F1-8.                                   NC1764.2 657
   000654         065700 ADD-DELETE-F1-8.                                                 NC1764.2
   000655         065800     PERFORM  DE-LETE.                                            NC1764.2 405
   000656         065900     GO       TO ADD-WRITE-F1-8.                                  NC1764.2 661
   000657         066000 ADD-FAIL-F1-8.                                                   NC1764.2
   000658         066100     MOVE     WRK-DS-05V00 TO COMPUTED-N.                         NC1764.2 111 265
   000659         066200     MOVE     55555 TO CORRECT-N.                                 NC1764.2 279
   000660         066300     PERFORM  FAIL.                                               NC1764.2 404
   000661         066400 ADD-WRITE-F1-8.                                                  NC1764.2
   000662         066500     MOVE     "ADD-TEST-F1-8" TO PAR-NAME.                        NC1764.2 253
   000663         066600     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000664         066700 ADD-INIT-F1-9-1.                                                 NC1764.2
   000665         066800     MOVE "  SIZE ERROR" TO FEATURE.                              NC1764.2 249
   000666         066900     MOVE     -11 TO WRK-DS-02V00.                                NC1764.2 112
   000667         067000 ADD-TEST-F1-9-1.                                                 NC1764.2
   000668         067100     ADD      -99 TO WRK-DS-02V00 ON SIZE ERROR                   NC1764.2 112
   000669      1  067200              PERFORM PASS GO TO ADD-WRITE-F1-9-1.                NC1764.2 403 677
   000670         067300     GO       TO ADD-FAIL-F1-9-1.                                 NC1764.2 674
   000671         067400 ADD-DELETE-F1-9-1.                                               NC1764.2
   000672         067500     PERFORM  DE-LETE.                                            NC1764.2 405
   000673         067600     GO       TO ADD-WRITE-F1-9-1.                                NC1764.2 677
   000674         067700 ADD-FAIL-F1-9-1.                                                 NC1764.2
   000675         067800     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1764.2 258
   000676         067900     PERFORM  FAIL.                                               NC1764.2 404
   000677         068000 ADD-WRITE-F1-9-1.                                                NC1764.2
   000678         068100     MOVE     "ADD-TEST-F1-9-1" TO PAR-NAME.                      NC1764.2 253
   000679         068200     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000680         068300 ADD-TEST-F1-9-2.                                                 NC1764.2
   000681         068400     IF       WRK-DS-02V00 EQUAL TO -11                           NC1764.2 112
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682      1  068500              PERFORM PASS GO TO ADD-WRITE-F1-9-2.                NC1764.2 403 693
   000683         068600*    THIS TEST DEPENDS ON THE RESULTS OF TEST-F1-9-1 ABOVE.       NC1764.2
   000684         068700     GO       TO ADD-FAIL-F1-9-2.                                 NC1764.2 688
   000685         068800 ADD-DELETE-F1-9-2.                                               NC1764.2
   000686         068900     PERFORM  DE-LETE.                                            NC1764.2 405
   000687         069000     GO       TO ADD-WRITE-F1-9-2.                                NC1764.2 693
   000688         069100 ADD-FAIL-F1-9-2.                                                 NC1764.2
   000689         069200     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1764.2 258
   000690         069300     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC1764.2 112 265
   000691         069400     MOVE     -11 TO CORRECT-N.                                   NC1764.2 279
   000692         069500     PERFORM  FAIL.                                               NC1764.2 404
   000693         069600 ADD-WRITE-F1-9-2.                                                NC1764.2
   000694         069700     MOVE     "ADD-TEST-F1-9-2" TO PAR-NAME.                      NC1764.2 253
   000695         069800     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000696         069900 ADD-INIT-F1-10-1.                                                NC1764.2
   000697         070000     MOVE "  ROUNDED,SIZE ERROR" TO FEATURE.                      NC1764.2 249
   000698         070100 ADD-TEST-F1-10-1.                                                NC1764.2
   000699         070200     MOVE     ZERO TO WRK-DS-05V00                                NC1764.2 IMP 111
   000700         070300     ADD      33333                                               NC1764.2
   000701         070400              A06THREES-DS-03V03                                  NC1764.2 102
   000702         070500              A12THREES-DS-06V06                                  NC1764.2 104
   000703         070600              TO WRK-DS-05V00 ROUNDED ON SIZE ERROR               NC1764.2 111
   000704      1  070700              PERFORM PASS GO TO ADD-WRITE-F1-10-1.               NC1764.2 403 712
   000705         070800     GO       TO ADD-FAIL-F1-10-1.                                NC1764.2 709
   000706         070900 ADD-DELETE-F1-10-1.                                              NC1764.2
   000707         071000     PERFORM  DE-LETE.                                            NC1764.2 405
   000708         071100     GO       TO ADD-WRITE-F1-10-1.                               NC1764.2 712
   000709         071200 ADD-FAIL-F1-10-1.                                                NC1764.2
   000710         071300     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1764.2 258
   000711         071400     PERFORM  FAIL.                                               NC1764.2 404
   000712         071500 ADD-WRITE-F1-10-1.                                               NC1764.2
   000713         071600     MOVE     "ADD-TEST-F1-10-1" TO PAR-NAME.                     NC1764.2 253
   000714         071700     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000715         071800 ADD-TEST-F1-10-2.                                                NC1764.2
   000716         071900     IF       WRK-DS-05V00 EQUAL TO ZERO                          NC1764.2 111 IMP
   000717      1  072000              PERFORM PASS GO TO ADD-WRITE-F1-10-2.               NC1764.2 403 728
   000718         072100*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-F1-10-1  NC1764.2
   000719         072200     GO       TO ADD-FAIL-F1-10-2.                                NC1764.2 723
   000720         072300 ADD-DELETE-F1-10-2.                                              NC1764.2
   000721         072400     PERFORM  DE-LETE.                                            NC1764.2 405
   000722         072500     GO       TO ADD-WRITE-F1-10-2.                               NC1764.2 728
   000723         072600 ADD-FAIL-F1-10-2.                                                NC1764.2
   000724         072700     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1764.2 258
   000725         072800     MOVE     WRK-DS-05V00 TO COMPUTED-N.                         NC1764.2 111 265
   000726         072900     MOVE     ZERO TO CORRECT-N.                                  NC1764.2 IMP 279
   000727         073000     PERFORM  FAIL.                                               NC1764.2 404
   000728         073100 ADD-WRITE-F1-10-2.                                               NC1764.2
   000729         073200     MOVE     "ADD-TEST-F1-10-2" TO PAR-NAME.                     NC1764.2 253
   000730         073300     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000731         073400 ADD-TEST-F1-11-1.                                                NC1764.2
   000732         073500     MOVE     ZERO TO WRK-DS-06V06.                               NC1764.2 IMP 106
   000733         073600     ADD      A12THREES-DS-06V06                                  NC1764.2 104
   000734         073700              333333                                              NC1764.2
   000735         073800              A06THREES-DS-03V03                                  NC1764.2 102
   000736         073900              TO WRK-DS-06V06 ROUNDED ON SIZE ERROR               NC1764.2 106
   000737      1  074000              GO TO ADD-FAIL-F1-11-1.                             NC1764.2 743
   000738         074100     PERFORM  PASS.                                               NC1764.2 403
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200     GO TO ADD-WRITE-F1-11-1.                                     NC1764.2 746
   000740         074300 ADD-DELETE-F1-11-1.                                              NC1764.2
   000741         074400     PERFORM  DE-LETE.                                            NC1764.2 405
   000742         074500     GO       TO ADD-WRITE-F1-11-1.                               NC1764.2 746
   000743         074600 ADD-FAIL-F1-11-1.                                                NC1764.2
   000744         074700     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1764.2 258
   000745         074800     PERFORM  FAIL.                                               NC1764.2 404
   000746         074900 ADD-WRITE-F1-11-1.                                               NC1764.2
   000747         075000     MOVE     "ADD-TEST-F1-11-1" TO PAR-NAME.                     NC1764.2 253
   000748         075100     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000749         075200 ADD-TEST-F1-11-2.                                                NC1764.2
   000750         075300     IF       WRK-DS-06V06 EQUAL TO 666999.666333                 NC1764.2 106
   000751      1  075400              PERFORM PASS GO TO ADD-WRITE-F1-11-2.               NC1764.2 403 761
   000752         075500*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-F1-11-1  NC1764.2
   000753         075600     GO       TO ADD-FAIL-F1-11-2.                                NC1764.2 757
   000754         075700 ADD-DELETE-F1-11-2.                                              NC1764.2
   000755         075800     PERFORM  DE-LETE.                                            NC1764.2 405
   000756         075900     GO       TO ADD-WRITE-F1-11-2.                               NC1764.2 761
   000757         076000 ADD-FAIL-F1-11-2.                                                NC1764.2
   000758         076100     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1764.2 106 265
   000759         076200     MOVE     666999.666333 TO CORRECT-N.                         NC1764.2 279
   000760         076300     PERFORM  FAIL.                                               NC1764.2 404
   000761         076400 ADD-WRITE-F1-11-2.                                               NC1764.2
   000762         076500     MOVE     "ADD-TEST-F1-11-2" TO PAR-NAME.                     NC1764.2 253
   000763         076600     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000764         076700 ADD-INIT-F1-12.                                                  NC1764.2
   000765         076800     MOVE "  COMP VS. DISPLAY"  TO FEATURE.                       NC1764.2 249
   000766         076900 ADD-TEST-F1-12.                                                  NC1764.2
   000767         077000     MOVE     A18ONES-DS-18V00 TO WRK-CS-18V00.                   NC1764.2 88 128
   000768         077100     ADD      A18ONES-DS-18V00 TO WRK-CS-18V00.                   NC1764.2 88 128
   000769         077200     IF       WRK-CS-18V00 EQUAL TO 222222222222222222            NC1764.2 128
   000770      1  077300              PERFORM PASS GO TO ADD-WRITE-F1-12.                 NC1764.2 403 779
   000771         077400     GO       TO ADD-FAIL-F1-12.                                  NC1764.2 775
   000772         077500 ADD-DELETE-F1-12.                                                NC1764.2
   000773         077600     PERFORM  DE-LETE.                                            NC1764.2 405
   000774         077700     GO       TO ADD-WRITE-F1-12.                                 NC1764.2 779
   000775         077800 ADD-FAIL-F1-12.                                                  NC1764.2
   000776         077900     MOVE     WRK-CS-18V00 TO COMPUTED-18V0.                      NC1764.2 128 271
   000777         078000     MOVE     222222222222222222 TO CORRECT-18V0.                 NC1764.2 284
   000778         078100     PERFORM  FAIL.                                               NC1764.2 404
   000779         078200 ADD-WRITE-F1-12.                                                 NC1764.2
   000780         078300     MOVE     "ADD-TEST-F1-12" TO PAR-NAME.                       NC1764.2 253
   000781         078400     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000782         078500 ADD-TEST-F1-13.                                                  NC1764.2
   000783         078600     MOVE     A18ONES-DS-18V00 TO WRK-DS-18V00.                   NC1764.2 88 100
   000784         078700     ADD      A18ONES-CS-18V00 TO WRK-DS-18V00.                   NC1764.2 129 100
   000785         078800     IF       WRK-DS-18V00 EQUAL TO 222222222222222222            NC1764.2 100
   000786      1  078900              PERFORM PASS GO TO ADD-WRITE-F1-13.                 NC1764.2 403 795
   000787         079000     GO       TO ADD-FAIL-F1-13.                                  NC1764.2 791
   000788         079100 ADD-DELETE-F1-13.                                                NC1764.2
   000789         079200     PERFORM  DE-LETE.                                            NC1764.2 405
   000790         079300     GO       TO ADD-WRITE-F1-13.                                 NC1764.2 795
   000791         079400 ADD-FAIL-F1-13.                                                  NC1764.2
   000792         079500     MOVE     WRK-DS-18V00 TO COMPUTED-18V0.                      NC1764.2 100 271
   000793         079600     MOVE     222222222222222222 TO CORRECT-18V0.                 NC1764.2 284
   000794         079700     PERFORM  FAIL.                                               NC1764.2 404
   000795         079800 ADD-WRITE-F1-13.                                                 NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900     MOVE     "ADD-TEST-F1-13" TO PAR-NAME.                       NC1764.2 253
   000797         080000     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000798         080100 ADD-TEST-F1-14.                                                  NC1764.2
   000799         080200     MOVE     ZERO TO WRK-CS-02V02.                               NC1764.2 IMP 131
   000800         080300     ADD      A99-CS-02V00 TO WRK-CS-02V02.                       NC1764.2 132 131
   000801         080400     IF       WRK-CS-02V02 EQUAL TO 99.00                         NC1764.2 131
   000802      1  080500              PERFORM PASS GO TO ADD-WRITE-F1-14.                 NC1764.2 403 811
   000803         080600     GO       TO ADD-FAIL-F1-14.                                  NC1764.2 807
   000804         080700 ADD-DELETE-F1-14.                                                NC1764.2
   000805         080800     PERFORM  DE-LETE.                                            NC1764.2 405
   000806         080900     GO       TO ADD-WRITE-F1-14.                                 NC1764.2 811
   000807         081000 ADD-FAIL-F1-14.                                                  NC1764.2
   000808         081100     MOVE     WRK-CS-02V02 TO COMPUTED-N.                         NC1764.2 131 265
   000809         081200     MOVE     99.00 TO CORRECT-N.                                 NC1764.2 279
   000810         081300     PERFORM  FAIL.                                               NC1764.2 404
   000811         081400 ADD-WRITE-F1-14.                                                 NC1764.2
   000812         081500     MOVE     "ADD-TEST-F1-14" TO PAR-NAME.                       NC1764.2 253
   000813         081600     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000814         081700 ADD-TEST-F1-15-1.                                                NC1764.2
   000815         081800     MOVE     A99-CS-02V00 TO WRK-CS-02V02.                       NC1764.2 132 131
   000816         081900     ADD      A99-CS-02V00 TO WRK-CS-02V02 ON SIZE ERROR          NC1764.2 132 131
   000817      1  082000              PERFORM PASS GO TO ADD-WRITE-F1-15-1.               NC1764.2 403 825
   000818         082100     GO       TO ADD-FAIL-F1-15-1.                                NC1764.2 822
   000819         082200 ADD-DELETE-F1-15-1.                                              NC1764.2
   000820         082300     PERFORM  DE-LETE.                                            NC1764.2 405
   000821         082400     GO       TO ADD-WRITE-F1-15-1.                               NC1764.2 825
   000822         082500 ADD-FAIL-F1-15-1.                                                NC1764.2
   000823         082600     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1764.2 258
   000824         082700     PERFORM  FAIL.                                               NC1764.2 404
   000825         082800 ADD-WRITE-F1-15-1.                                               NC1764.2
   000826         082900     MOVE     "ADD-TEST-F1-15-1" TO PAR-NAME.                     NC1764.2 253
   000827         083000     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000828         083100 ADD-TEST-F1-15-2.                                                NC1764.2
   000829         083200     IF       WRK-CS-02V02 EQUAL TO 99.00                         NC1764.2 131
   000830      1  083300              PERFORM PASS GO TO ADD-WRITE-F1-15-2.               NC1764.2 403 841
   000831         083400*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF ADD-TEST-F1-15-1  NC1764.2
   000832         083500     GO       TO ADD-FAIL-F1-15-2.                                NC1764.2 836
   000833         083600 ADD-DELETE-F1-15-2.                                              NC1764.2
   000834         083700     PERFORM  DE-LETE.                                            NC1764.2 405
   000835         083800     GO       TO ADD-WRITE-F1-15-2.                               NC1764.2 841
   000836         083900 ADD-FAIL-F1-15-2.                                                NC1764.2
   000837         084000     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1764.2 258
   000838         084100     MOVE     WRK-CS-02V02 TO COMPUTED-N.                         NC1764.2 131 265
   000839         084200     MOVE     99.00 TO CORRECT-N.                                 NC1764.2 279
   000840         084300     PERFORM  FAIL.                                               NC1764.2 404
   000841         084400 ADD-WRITE-F1-15-2.                                               NC1764.2
   000842         084500     MOVE     "ADD-TEST-F1-15-2" TO PAR-NAME.                     NC1764.2 253
   000843         084600     PERFORM  PRINT-DETAIL.                                       NC1764.2 407
   000844         084700 ADD-TEST-F1-16.                                                  NC1764.2
   000845         084800     MOVE A14TWOS-CS-18V00 TO WRK-CS-18V00.                       NC1764.2 164 128
   000846         084900     ADD A18FIVES-CS-18V00 TO WRK-CS-18V00.                       NC1764.2 170 128
   000847         085000     IF WRK-CS-18V00 EQUAL TO -555577777777777777                 NC1764.2 128
   000848      1  085100         PERFORM PASS                                             NC1764.2 403
   000849      1  085200         GO TO ADD-WRITE-F1-16.                                   NC1764.2 856
   000850         085300     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1764.2 128 271
   000851         085400     MOVE -555577777777777777 TO CORRECT-18V0.                    NC1764.2 284
   000852         085500     PERFORM FAIL.                                                NC1764.2 404
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     GO TO ADD-WRITE-F1-16.                                       NC1764.2 856
   000854         085700 ADD-DELETE-F1-16.                                                NC1764.2
   000855         085800     PERFORM DE-LETE.                                             NC1764.2 405
   000856         085900 ADD-WRITE-F1-16.                                                 NC1764.2
   000857         086000     MOVE "ADD-TEST-F1-16 " TO PAR-NAME.                          NC1764.2 253
   000858         086100     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   000859         086200 ADD-TEST-F1-17.                                                  NC1764.2
   000860         086300     MOVE A12SEVENS-CU-18V00 TO WRK-CS-18V00.                     NC1764.2 174 128
   000861         086400     ADD A18SIXES-CS-18V00 TO WRK-CS-18V00.                       NC1764.2 172 128
   000862         086500     IF WRK-CS-18V00 EQUAL TO +666667444444444443                 NC1764.2 128
   000863      1  086600         PERFORM PASS                                             NC1764.2 403
   000864      1  086700         GO TO ADD-WRITE-F1-17.                                   NC1764.2 871
   000865         086800     MOVE +666667444444444443 TO CORRECT-18V0.                    NC1764.2 284
   000866         086900     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1764.2 128 271
   000867         087000     PERFORM FAIL.                                                NC1764.2 404
   000868         087100     GO TO ADD-WRITE-F1-17.                                       NC1764.2 871
   000869         087200 ADD-DELETE-F1-17.                                                NC1764.2
   000870         087300     PERFORM DE-LETE.                                             NC1764.2 405
   000871         087400 ADD-WRITE-F1-17.                                                 NC1764.2
   000872         087500     MOVE "ADD-TEST-F1-17 " TO PAR-NAME.                          NC1764.2 253
   000873         087600     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   000874         087700 ADD-TEST-F1-18.                                                  NC1764.2
   000875         087800     MOVE A12SEVENS-CU-18V00 TO WRK-DU-18V00.                     NC1764.2 174 176
   000876         087900     ADD A18FIVES-CS-18V00 TO WRK-DU-18V00.                       NC1764.2 170 176
   000877         088000     IF WRK-DU-18V00 EQUAL TO 555554777777777778                  NC1764.2 176
   000878      1  088100         PERFORM PASS                                             NC1764.2 403
   000879      1  088200         GO TO ADD-WRITE-F1-18.                                   NC1764.2 886
   000880         088300     MOVE WRK-DU-18V00 TO COMPUTED-18V0.                          NC1764.2 176 271
   000881         088400     MOVE 555554777777777778 TO CORRECT-18V0.                     NC1764.2 284
   000882         088500     PERFORM FAIL.                                                NC1764.2 404
   000883         088600     GO TO ADD-WRITE-F1-18.                                       NC1764.2 886
   000884         088700 ADD-DELETE-F1-18.                                                NC1764.2
   000885         088800     PERFORM DE-LETE.                                             NC1764.2 405
   000886         088900 ADD-WRITE-F1-18.                                                 NC1764.2
   000887         089000     MOVE "ADD-TEST-F1-18 " TO PAR-NAME.                          NC1764.2 253
   000888         089100     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   000889         089200 ADD-TEST-F1-19.                                                  NC1764.2
   000890         089300     MOVE     +980 TO WRK-CS-03V00.                               NC1764.2 179
   000891         089400     MOVE     SPACE TO SIZE-ERR.                                  NC1764.2 IMP 82
   000892         089500*        NOTE IN THIS TEST, 1 IS ADDED TO A 3-DIGIT COMP SYNC     NC1764.2
   000893         089600*             FIELD UNTIL A SIZE ERROR OCCURS --- IF THE VALUE OF NC1764.2
   000894         089700*             THE FIELD REACHES 1180 WITHOUT A SIZE ERROR THE     NC1764.2
   000895         089800*             ATTEMPTED ADDITIONS ARE TERMINATED.                 NC1764.2
   000896         089900     PERFORM  ADD-A-F1-19 THRU ADD-B-F1-19 200 TIMES.             NC1764.2 912 916
   000897         090000     IF       SIZE-ERR EQUAL TO SPACE                             NC1764.2 82 IMP
   000898      1  090100              MOVE "SIZE ERROR NOT ENCOUNTERED" TO RE-MARK        NC1764.2 258
   000899      1  090200              MOVE "AT LEAST 1180" TO COMPUTED-A                  NC1764.2 264
   000900      1  090300              MOVE "999 IN PIC 999 FIELD" TO CORRECT-A            NC1764.2 278
   000901      1  090400              PERFORM FAIL                                        NC1764.2 404
   000902      1  090500              GO TO ADD-WRITE-F1-19.                              NC1764.2 918
   000903         090600     IF       WRK-CS-03V00 EQUAL TO 999                           NC1764.2 179
   000904      1  090700              PERFORM PASS GO TO ADD-WRITE-F1-19.                 NC1764.2 403 918
   000905         090800     PERFORM  FAIL.                                               NC1764.2 404
   000906         090900     MOVE     WRK-CS-03V00 TO COMPUTED-N.                         NC1764.2 179 265
   000907         091000     MOVE     999 TO CORRECT-N.                                   NC1764.2 279
   000908         091100     GO       TO ADD-WRITE-F1-19.                                 NC1764.2 918
   000909         091200 ADD-DELETE-F1-19.                                                NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     PERFORM  DE-LETE.                                            NC1764.2 405
   000911         091400     GO       TO ADD-WRITE-F1-19.                                 NC1764.2 918
   000912         091500 ADD-A-F1-19.                                                     NC1764.2
   000913         091600     IF       SIZE-ERR EQUAL TO "E" GO TO ADD-B-F1-19.            NC1764.2 82 916
   000914         091700     ADD      1 TO WRK-CS-03V00 ON SIZE ERROR                     NC1764.2 179
   000915      1  091800              MOVE "E" TO SIZE-ERR.                               NC1764.2 82
   000916         091900 ADD-B-F1-19.                                                     NC1764.2
   000917         092000     EXIT.                                                        NC1764.2
   000918         092100 ADD-WRITE-F1-19.                                                 NC1764.2
   000919         092200     MOVE   "ADD, COMP, SIZE ERR" TO FEATURE.                     NC1764.2 249
   000920         092300     MOVE   "ADD-TEST-F1-19" TO PAR-NAME.                         NC1764.2 253
   000921         092400     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   000922         092500*                                                                 NC1764.2
   000923         092600 ADD-INIT-F1-20.                                                  NC1764.2
   000924         092700*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1764.2
   000925         092800     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1764.2 309
   000926         092900     MOVE   -11 TO WRK-DS-02V00.                                  NC1764.2 112
   000927         093000 ADD-TEST-F1-20.                                                  NC1764.2
   000928         093100     ADD    -99 TO WRK-DS-02V00                                   NC1764.2 112
   000929         093200         NOT ON SIZE ERROR                                        NC1764.2
   000930      1  093300             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1764.2
   000931      1  093400                  TO RE-MARK                                      NC1764.2 258
   000932      1  093500             PERFORM FAIL                                         NC1764.2 404
   000933      1  093600             GO TO   ADD-WRITE-F1-20.                             NC1764.2 940
   000934         093700     GO TO   ADD-PASS-F1-20.                                      NC1764.2 938
   000935         093800 ADD-DELETE-F1-20.                                                NC1764.2
   000936         093900     PERFORM DE-LETE.                                             NC1764.2 405
   000937         094000     GO TO   ADD-WRITE-F1-20.                                     NC1764.2 940
   000938         094100 ADD-PASS-F1-20.                                                  NC1764.2
   000939         094200     PERFORM PASS.                                                NC1764.2 403
   000940         094300 ADD-WRITE-F1-20.                                                 NC1764.2
   000941         094400     MOVE   "ADD-TEST-F1-20" TO PAR-NAME.                         NC1764.2 253
   000942         094500     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   000943         094600*                                                                 NC1764.2
   000944         094700 ADD-INIT-F1-21.                                                  NC1764.2
   000945         094800*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1764.2
   000946         094900     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1764.2 309
   000947         095000     MOVE    ZERO TO WRK-DS-06V06.                                NC1764.2 IMP 106
   000948         095100 ADD-TEST-F1-21-0.                                                NC1764.2
   000949         095200     ADD     A12THREES-DS-06V06                                   NC1764.2 104
   000950         095300             333333                                               NC1764.2
   000951         095400             A06THREES-DS-03V03                                   NC1764.2 102
   000952         095500          TO WRK-DS-06V06 ROUNDED                                 NC1764.2 106
   000953         095600      NOT ON SIZE ERROR                                           NC1764.2
   000954      1  095700             GO TO ADD-PASS-F1-21.                                NC1764.2 961
   000955         095800     MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.    NC1764.2 258
   000956         095900     PERFORM FAIL.                                                NC1764.2 404
   000957         096000     GO TO   ADD-WRITE-F1-21.                                     NC1764.2 963
   000958         096100 ADD-DELETE-F1-21.                                                NC1764.2
   000959         096200     PERFORM DE-LETE.                                             NC1764.2 405
   000960         096300     GO TO   ADD-WRITE-F1-21.                                     NC1764.2 963
   000961         096400 ADD-PASS-F1-21.                                                  NC1764.2
   000962         096500     PERFORM PASS.                                                NC1764.2 403
   000963         096600 ADD-WRITE-F1-21.                                                 NC1764.2
   000964         096700     MOVE   "ADD-TEST-F1-21" TO PAR-NAME.                         NC1764.2 253
   000965         096800     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   000966         096900*                                                                 NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000 ADD-INIT-F1-22.                                                  NC1764.2
   000968         097100*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1764.2
   000969         097200     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1764.2 309
   000970         097300     MOVE   -11 TO WRK-DS-02V00.                                  NC1764.2 112
   000971         097400 ADD-TEST-F1-22-0.                                                NC1764.2
   000972         097500     ADD    -99 TO WRK-DS-02V00                                   NC1764.2 112
   000973         097600          ON SIZE ERROR                                           NC1764.2
   000974      1  097700             PERFORM PASS                                         NC1764.2 403
   000975      1  097800             GO TO   ADD-WRITE-F1-22                              NC1764.2 983
   000976         097900      NOT ON SIZE ERROR                                           NC1764.2
   000977      1  098000             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1764.2
   000978      1  098100                  TO RE-MARK                                      NC1764.2 258
   000979      1  098200             PERFORM FAIL                                         NC1764.2 404
   000980      1  098300             GO TO   ADD-WRITE-F1-22.                             NC1764.2 983
   000981         098400 ADD-DELETE-F1-22.                                                NC1764.2
   000982         098500     PERFORM DE-LETE.                                             NC1764.2 405
   000983         098600 ADD-WRITE-F1-22.                                                 NC1764.2
   000984         098700     MOVE   "ADD-TEST-F1-22" TO PAR-NAME.                         NC1764.2 253
   000985         098800     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   000986         098900*                                                                 NC1764.2
   000987         099000 ADD-INIT-F1-23.                                                  NC1764.2
   000988         099100*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1764.2
   000989         099200     MOVE   "V1-67 6.4.2" TO ANSI-REFERENCE.                      NC1764.2 309
   000990         099300     MOVE    ZERO TO WRK-DS-06V06.                                NC1764.2 IMP 106
   000991         099400 ADD-TEST-F1-23-0.                                                NC1764.2
   000992         099500     ADD     A12THREES-DS-06V06                                   NC1764.2 104
   000993         099600             333333                                               NC1764.2
   000994         099700             A06THREES-DS-03V03                                   NC1764.2 102
   000995         099800          TO WRK-DS-06V06 ROUNDED                                 NC1764.2 106
   000996         099900          ON SIZE ERROR                                           NC1764.2
   000997      1  100000             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1764.2
   000998      1  100100                  TO RE-MARK                                      NC1764.2 258
   000999      1  100200             PERFORM FAIL                                         NC1764.2 404
   001000      1  100300             GO TO   ADD-WRITE-F1-23                              NC1764.2 1008
   001001         100400      NOT ON SIZE ERROR                                           NC1764.2
   001002      1  100500             GO TO   ADD-PASS-F1-23.                              NC1764.2 1006
   001003         100600 ADD-DELETE-F1-23.                                                NC1764.2
   001004         100700     PERFORM DE-LETE.                                             NC1764.2 405
   001005         100800     GO TO   ADD-WRITE-F1-23.                                     NC1764.2 1008
   001006         100900 ADD-PASS-F1-23.                                                  NC1764.2
   001007         101000     PERFORM PASS.                                                NC1764.2 403
   001008         101100 ADD-WRITE-F1-23.                                                 NC1764.2
   001009         101200     MOVE   "ADD-TEST-F1-23" TO PAR-NAME.                         NC1764.2 253
   001010         101300     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001011         101400*                                                                 NC1764.2
   001012         101500 ADD-INIT-F1-24.                                                  NC1764.2
   001013         101600*    ==-->  MULTIPLE OPERANDS  <--==                              NC1764.2
   001014         101700     MOVE   "V1-67 6.4.2"      TO ANSI-REFERENCE.                 NC1764.2 309
   001015         101800     MOVE   "ADD LIMIT TESTS " TO FEATURE.                        NC1764.2 249
   001016         101900     MOVE    1  TO DNAME1  DNAME2  DNAME3  DNAME4  DNAME5.        NC1764.2 40 41 42 43 44
   001017         102000     MOVE    1  TO DNAME6  DNAME7  DNAME8  DNAME9  DNAME10.       NC1764.2 45 46 47 48 49
   001018         102100     MOVE    1  TO DNAME11 DNAME12 DNAME13 DNAME14 DNAME15.       NC1764.2 50 51 52 53 54
   001019         102200     MOVE    1  TO DNAME16 DNAME17 DNAME18 DNAME19 DNAME20.       NC1764.2 55 56 57 58 59
   001020         102300     MOVE    1  TO DNAME21.                                       NC1764.2 60
   001021         102400     MOVE    0  TO DNAME22.                                       NC1764.2 61
   001022         102500*    THE FOLLOWING 22 TESTS VERIFY THE ABILITY OF THE COMPILER    NC1764.2
   001023         102600*    TO HANDLE A MAXIMUM OF 42 OPERANDS.   A DELETION IN THIS     NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700*    PARAGRAPH WILL SKIP THE LIMIT TESTS.                         NC1764.2
   001025         102800     GO TO ADD-TEST-F1-24.                                        NC1764.2 1033
   001026         102900 ADD-INIT-DELETE.                                                 NC1764.2
   001027         103000     PERFORM DE-LETE.                                             NC1764.2 405
   001028         103100     MOVE "ADD-TEST-F1-24 TO F1-45" TO PAR-NAME.                  NC1764.2 253
   001029         103200     MOVE "ADD LIMIT TESTS " TO FEATURE.                          NC1764.2 249
   001030         103300     ADD 21 TO DELETE-COUNTER.                                    NC1764.2 301
   001031         103400     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001032         103500     GO TO   ADD-INIT-F1-46.                                      NC1764.2 1392
   001033         103600 ADD-TEST-F1-24.                                                  NC1764.2
   001034         103700     ADD DNAME1                                                   NC1764.2 40
   001035         103800         DNAME2                                                   NC1764.2 41
   001036         103900         DNAME3                                                   NC1764.2 42
   001037         104000         DNAME4                                                   NC1764.2 43
   001038         104100         DNAME5                                                   NC1764.2 44
   001039         104200         DNAME6                                                   NC1764.2 45
   001040         104300         DNAME7                                                   NC1764.2 46
   001041         104400         DNAME8                                                   NC1764.2 47
   001042         104500         DNAME9                                                   NC1764.2 48
   001043         104600         DNAME10                                                  NC1764.2 49
   001044         104700         DNAME11                                                  NC1764.2 50
   001045         104800         DNAME12                                                  NC1764.2 51
   001046         104900         DNAME13                                                  NC1764.2 52
   001047         105000         DNAME14                                                  NC1764.2 53
   001048         105100         DNAME15                                                  NC1764.2 54
   001049         105200         DNAME16                                                  NC1764.2 55
   001050         105300         DNAME17                                                  NC1764.2 56
   001051         105400         DNAME18                                                  NC1764.2 57
   001052         105500         DNAME19                                                  NC1764.2 58
   001053         105600         DNAME20                                                  NC1764.2 59
   001054         105700         DNAME21                                                  NC1764.2 60
   001055         105800              TO DNAME22.                                         NC1764.2 61
   001056         105900*    THE NUMBER OF OPERANDS CAPABLE OF BEING ADDED TO ONE         NC1764.2
   001057         106000*    DATANAME WILL BE REFLECTED BY THE COMPUTED-ANSWER.           NC1764.2
   001058         106100     IF DNAME22 EQUAL TO 21                                       NC1764.2 61
   001059      1  106200         PERFORM PASS                                             NC1764.2 403
   001060      1  106300         GO TO ADD-WRITE-F1-24.                                   NC1764.2 1067
   001061         106400     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001062         106500     MOVE DNAME22 TO COMPUTED-18V0.                               NC1764.2 61 271
   001063         106600     PERFORM FAIL.                                                NC1764.2 404
   001064         106700     GO TO ADD-WRITE-F1-24.                                       NC1764.2 1067
   001065         106800 ADD-DELETE-F1-24.                                                NC1764.2
   001066         106900     PERFORM DE-LETE.                                             NC1764.2 405
   001067         107000 ADD-WRITE-F1-24.                                                 NC1764.2
   001068         107100     MOVE "ADD-TEST-F1-24 " TO PAR-NAME.                          NC1764.2 253
   001069         107200     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001070         107300 ADD-INIT-F1-25.                                                  NC1764.2
   001071         107400     MOVE ZERO TO DNAME22 DNAME23 DNAME24 DNAME25 DNAME26.        NC1764.2 IMP 61 62 63 64 65
   001072         107500     MOVE ZERO TO DNAME27 DNAME28 DNAME29 DNAME30 DNAME31.        NC1764.2 IMP 66 67 68 69 70
   001073         107600     MOVE ZERO TO DNAME32 DNAME33 DNAME34 DNAME35 DNAME36.        NC1764.2 IMP 71 72 73 74 75
   001074         107700     MOVE ZERO TO DNAME37 DNAME38 DNAME39 DNAME40 DNAME41.        NC1764.2 IMP 76 77 78 79 80
   001075         107800     MOVE ZERO TO DNAME42.                                        NC1764.2 IMP 81
   001076         107900 ADD-TEST-F1-25.                                                  NC1764.2
   001077         108000     ADD DNAME1                                                   NC1764.2 40
   001078         108100         DNAME2                                                   NC1764.2 41
   001079         108200         DNAME3                                                   NC1764.2 42
   001080         108300         DNAME4                                                   NC1764.2 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400         DNAME5                                                   NC1764.2 44
   001082         108500         DNAME6                                                   NC1764.2 45
   001083         108600         DNAME7                                                   NC1764.2 46
   001084         108700         DNAME8                                                   NC1764.2 47
   001085         108800         DNAME9                                                   NC1764.2 48
   001086         108900         DNAME10                                                  NC1764.2 49
   001087         109000         DNAME11                                                  NC1764.2 50
   001088         109100         DNAME12                                                  NC1764.2 51
   001089         109200         DNAME13                                                  NC1764.2 52
   001090         109300         DNAME14                                                  NC1764.2 53
   001091         109400         DNAME15                                                  NC1764.2 54
   001092         109500         DNAME16                                                  NC1764.2 55
   001093         109600         DNAME17                                                  NC1764.2 56
   001094         109700         DNAME18                                                  NC1764.2 57
   001095         109800         DNAME19                                                  NC1764.2 58
   001096         109900         DNAME20                                                  NC1764.2 59
   001097         110000         DNAME21                                                  NC1764.2 60
   001098         110100              TO DNAME22                                          NC1764.2 61
   001099         110200                 DNAME23                                          NC1764.2 62
   001100         110300                 DNAME24                                          NC1764.2 63
   001101         110400                 DNAME25                                          NC1764.2 64
   001102         110500                 DNAME26                                          NC1764.2 65
   001103         110600                 DNAME27                                          NC1764.2 66
   001104         110700                 DNAME28                                          NC1764.2 67
   001105         110800                 DNAME29                                          NC1764.2 68
   001106         110900                 DNAME30                                          NC1764.2 69
   001107         111000                 DNAME31                                          NC1764.2 70
   001108         111100                 DNAME32                                          NC1764.2 71
   001109         111200                 DNAME33                                          NC1764.2 72
   001110         111300                 DNAME34                                          NC1764.2 73
   001111         111400                 DNAME35                                          NC1764.2 74
   001112         111500                 DNAME36                                          NC1764.2 75
   001113         111600                 DNAME37                                          NC1764.2 76
   001114         111700                 DNAME38                                          NC1764.2 77
   001115         111800                 DNAME39                                          NC1764.2 78
   001116         111900                 DNAME40                                          NC1764.2 79
   001117         112000                 DNAME41                                          NC1764.2 80
   001118         112100                 DNAME42.                                         NC1764.2 81
   001119         112200     IF DNAME22 EQUAL TO 21                                       NC1764.2 61
   001120      1  112300         PERFORM PASS                                             NC1764.2 403
   001121      1  112400         GO TO ADD-WRITE-F1-25.                                   NC1764.2 1128
   001122         112500     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001123         112600     MOVE DNAME22 TO COMPUTED-18V0.                               NC1764.2 61 271
   001124         112700     PERFORM FAIL.                                                NC1764.2 404
   001125         112800     GO TO ADD-WRITE-F1-25.                                       NC1764.2 1128
   001126         112900 ADD-DELETE-F1-25.                                                NC1764.2
   001127         113000     PERFORM DE-LETE.                                             NC1764.2 405
   001128         113100 ADD-WRITE-F1-25.                                                 NC1764.2
   001129         113200     MOVE "ADD-TEST-F1-25 " TO PAR-NAME.                          NC1764.2 253
   001130         113300     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001131         113400 ADD-TEST-F1-26.                                                  NC1764.2
   001132         113500     IF DNAME23 EQUAL TO 21                                       NC1764.2 62
   001133      1  113600         PERFORM PASS                                             NC1764.2 403
   001134      1  113700         GO TO ADD-WRITE-F1-26.                                   NC1764.2 1141
   001135         113800     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001136         113900     MOVE DNAME23 TO COMPUTED-18V0.                               NC1764.2 62 271
   001137         114000     PERFORM FAIL.                                                NC1764.2 404
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114100     GO TO ADD-WRITE-F1-26.                                       NC1764.2 1141
   001139         114200 ADD-DELETE-F1-26.                                                NC1764.2
   001140         114300     PERFORM DE-LETE.                                             NC1764.2 405
   001141         114400 ADD-WRITE-F1-26.                                                 NC1764.2
   001142         114500     MOVE "ADD-TEST-F1-26 " TO PAR-NAME.                          NC1764.2 253
   001143         114600     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001144         114700 ADD-TEST-F1-27.                                                  NC1764.2
   001145         114800     IF DNAME24 EQUAL TO 21                                       NC1764.2 63
   001146      1  114900         PERFORM PASS                                             NC1764.2 403
   001147      1  115000         GO TO ADD-WRITE-F1-27.                                   NC1764.2 1154
   001148         115100     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001149         115200     MOVE DNAME24 TO COMPUTED-18V0.                               NC1764.2 63 271
   001150         115300     PERFORM FAIL.                                                NC1764.2 404
   001151         115400     GO TO ADD-WRITE-F1-27.                                       NC1764.2 1154
   001152         115500 ADD-DELETE-F1-27.                                                NC1764.2
   001153         115600     PERFORM DE-LETE.                                             NC1764.2 405
   001154         115700 ADD-WRITE-F1-27.                                                 NC1764.2
   001155         115800     MOVE "ADD-TEST-F1-27 " TO PAR-NAME.                          NC1764.2 253
   001156         115900     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001157         116000 ADD-TEST-F1-28.                                                  NC1764.2
   001158         116100     IF DNAME25 EQUAL TO 21                                       NC1764.2 64
   001159      1  116200         PERFORM PASS                                             NC1764.2 403
   001160      1  116300         GO TO ADD-WRITE-F1-28.                                   NC1764.2 1167
   001161         116400     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001162         116500     MOVE DNAME25 TO COMPUTED-18V0.                               NC1764.2 64 271
   001163         116600     PERFORM FAIL.                                                NC1764.2 404
   001164         116700     GO TO ADD-WRITE-F1-28.                                       NC1764.2 1167
   001165         116800 ADD-DELETE-F1-28.                                                NC1764.2
   001166         116900     PERFORM DE-LETE.                                             NC1764.2 405
   001167         117000 ADD-WRITE-F1-28.                                                 NC1764.2
   001168         117100     MOVE "ADD-TEST-F1-28 " TO PAR-NAME.                          NC1764.2 253
   001169         117200     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001170         117300 ADD-TEST-F1-29.                                                  NC1764.2
   001171         117400     IF DNAME26 EQUAL TO 21                                       NC1764.2 65
   001172      1  117500         PERFORM PASS                                             NC1764.2 403
   001173      1  117600         GO TO ADD-WRITE-F1-29.                                   NC1764.2 1180
   001174         117700     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001175         117800     MOVE DNAME26 TO COMPUTED-18V0.                               NC1764.2 65 271
   001176         117900     PERFORM FAIL.                                                NC1764.2 404
   001177         118000     GO TO ADD-WRITE-F1-29.                                       NC1764.2 1180
   001178         118100 ADD-DELETE-F1-29.                                                NC1764.2
   001179         118200     PERFORM DE-LETE.                                             NC1764.2 405
   001180         118300 ADD-WRITE-F1-29.                                                 NC1764.2
   001181         118400     MOVE "ADD-TEST-F1-29 " TO PAR-NAME.                          NC1764.2 253
   001182         118500     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001183         118600 ADD-TEST-F1-30.                                                  NC1764.2
   001184         118700     IF DNAME27 EQUAL TO 21                                       NC1764.2 66
   001185      1  118800         PERFORM PASS                                             NC1764.2 403
   001186      1  118900         GO TO ADD-WRITE-F1-30.                                   NC1764.2 1193
   001187         119000     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001188         119100     MOVE DNAME27 TO COMPUTED-18V0.                               NC1764.2 66 271
   001189         119200     PERFORM FAIL.                                                NC1764.2 404
   001190         119300     GO TO ADD-WRITE-F1-30.                                       NC1764.2 1193
   001191         119400 ADD-DELETE-F1-30.                                                NC1764.2
   001192         119500     PERFORM DE-LETE.                                             NC1764.2 405
   001193         119600 ADD-WRITE-F1-30.                                                 NC1764.2
   001194         119700     MOVE "ADD-TEST-F1-30 " TO PAR-NAME.                          NC1764.2 253
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001196         119900 ADD-TEST-F1-31.                                                  NC1764.2
   001197         120000     IF DNAME28 EQUAL TO 21                                       NC1764.2 67
   001198      1  120100         PERFORM PASS                                             NC1764.2 403
   001199      1  120200         GO TO ADD-WRITE-F1-31.                                   NC1764.2 1206
   001200         120300     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001201         120400     MOVE DNAME28 TO COMPUTED-18V0.                               NC1764.2 67 271
   001202         120500     PERFORM FAIL.                                                NC1764.2 404
   001203         120600     GO TO ADD-WRITE-F1-31.                                       NC1764.2 1206
   001204         120700 ADD-DELETE-F1-31.                                                NC1764.2
   001205         120800     PERFORM DE-LETE.                                             NC1764.2 405
   001206         120900 ADD-WRITE-F1-31.                                                 NC1764.2
   001207         121000     MOVE "ADD-TEST-F1-31 " TO PAR-NAME.                          NC1764.2 253
   001208         121100     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001209         121200 ADD-TEST-F1-32.                                                  NC1764.2
   001210         121300     IF DNAME29 EQUAL TO 21                                       NC1764.2 68
   001211      1  121400         PERFORM PASS                                             NC1764.2 403
   001212      1  121500         GO TO ADD-WRITE-F1-32.                                   NC1764.2 1219
   001213         121600     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001214         121700     MOVE DNAME29 TO COMPUTED-18V0.                               NC1764.2 68 271
   001215         121800     PERFORM FAIL.                                                NC1764.2 404
   001216         121900     GO TO ADD-WRITE-F1-32.                                       NC1764.2 1219
   001217         122000 ADD-DELETE-F1-32.                                                NC1764.2
   001218         122100     PERFORM DE-LETE.                                             NC1764.2 405
   001219         122200 ADD-WRITE-F1-32.                                                 NC1764.2
   001220         122300     MOVE "ADD-TEST-F1-32 " TO PAR-NAME.                          NC1764.2 253
   001221         122400     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001222         122500 ADD-TEST-F1-33.                                                  NC1764.2
   001223         122600     IF DNAME30 EQUAL TO 21                                       NC1764.2 69
   001224      1  122700         PERFORM PASS                                             NC1764.2 403
   001225      1  122800         GO TO ADD-WRITE-F1-33.                                   NC1764.2 1232
   001226         122900     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001227         123000     MOVE DNAME30 TO COMPUTED-18V0.                               NC1764.2 69 271
   001228         123100     PERFORM FAIL.                                                NC1764.2 404
   001229         123200     GO TO ADD-WRITE-F1-33.                                       NC1764.2 1232
   001230         123300 ADD-DELETE-F1-33.                                                NC1764.2
   001231         123400     PERFORM DE-LETE.                                             NC1764.2 405
   001232         123500 ADD-WRITE-F1-33.                                                 NC1764.2
   001233         123600     MOVE "ADD-TEST-F1-33 " TO PAR-NAME.                          NC1764.2 253
   001234         123700     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001235         123800 ADD-TEST-F1-34.                                                  NC1764.2
   001236         123900     IF DNAME31 EQUAL TO 21                                       NC1764.2 70
   001237      1  124000         PERFORM PASS                                             NC1764.2 403
   001238      1  124100         GO TO ADD-WRITE-F1-34.                                   NC1764.2 1245
   001239         124200     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001240         124300     MOVE DNAME31 TO COMPUTED-18V0.                               NC1764.2 70 271
   001241         124400     PERFORM FAIL.                                                NC1764.2 404
   001242         124500     GO TO ADD-WRITE-F1-34.                                       NC1764.2 1245
   001243         124600 ADD-DELETE-F1-34.                                                NC1764.2
   001244         124700     PERFORM DE-LETE.                                             NC1764.2 405
   001245         124800 ADD-WRITE-F1-34.                                                 NC1764.2
   001246         124900     MOVE "ADD-TEST-F1-34 " TO PAR-NAME.                          NC1764.2 253
   001247         125000     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001248         125100 ADD-TEST-F1-35.                                                  NC1764.2
   001249         125200     IF DNAME32 EQUAL TO 21                                       NC1764.2 71
   001250      1  125300         PERFORM PASS                                             NC1764.2 403
   001251      1  125400         GO TO ADD-WRITE-F1-35.                                   NC1764.2 1258
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125500     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001253         125600     MOVE DNAME32 TO COMPUTED-18V0.                               NC1764.2 71 271
   001254         125700     PERFORM FAIL.                                                NC1764.2 404
   001255         125800     GO TO ADD-WRITE-F1-35.                                       NC1764.2 1258
   001256         125900 ADD-DELETE-F1-35.                                                NC1764.2
   001257         126000     PERFORM DE-LETE.                                             NC1764.2 405
   001258         126100 ADD-WRITE-F1-35.                                                 NC1764.2
   001259         126200     MOVE "ADD-TEST-F1-35 " TO PAR-NAME.                          NC1764.2 253
   001260         126300     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001261         126400 ADD-TEST-F1-36.                                                  NC1764.2
   001262         126500     IF DNAME33 EQUAL TO 21                                       NC1764.2 72
   001263      1  126600         PERFORM PASS                                             NC1764.2 403
   001264      1  126700         GO TO ADD-WRITE-F1-36.                                   NC1764.2 1271
   001265         126800     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001266         126900     MOVE DNAME33 TO COMPUTED-18V0.                               NC1764.2 72 271
   001267         127000     PERFORM FAIL.                                                NC1764.2 404
   001268         127100     GO TO ADD-WRITE-F1-36.                                       NC1764.2 1271
   001269         127200 ADD-DELETE-F1-36.                                                NC1764.2
   001270         127300     PERFORM DE-LETE.                                             NC1764.2 405
   001271         127400 ADD-WRITE-F1-36.                                                 NC1764.2
   001272         127500     MOVE "ADD-TEST-F1-36 " TO PAR-NAME.                          NC1764.2 253
   001273         127600     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001274         127700 ADD-TEST-F1-37.                                                  NC1764.2
   001275         127800     IF DNAME34 EQUAL TO 21                                       NC1764.2 73
   001276      1  127900         PERFORM PASS                                             NC1764.2 403
   001277      1  128000         GO TO ADD-WRITE-F1-37.                                   NC1764.2 1284
   001278         128100     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001279         128200     MOVE DNAME34 TO COMPUTED-18V0.                               NC1764.2 73 271
   001280         128300     PERFORM FAIL.                                                NC1764.2 404
   001281         128400     GO TO ADD-WRITE-F1-37.                                       NC1764.2 1284
   001282         128500 ADD-DELETE-F1-37.                                                NC1764.2
   001283         128600     PERFORM DE-LETE.                                             NC1764.2 405
   001284         128700 ADD-WRITE-F1-37.                                                 NC1764.2
   001285         128800     MOVE "ADD-TEST-F1-37 " TO PAR-NAME.                          NC1764.2 253
   001286         128900     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001287         129000 ADD-TEST-F1-38.                                                  NC1764.2
   001288         129100     IF DNAME35 EQUAL TO 21                                       NC1764.2 74
   001289      1  129200         PERFORM PASS                                             NC1764.2 403
   001290      1  129300         GO TO ADD-WRITE-F1-38.                                   NC1764.2 1297
   001291         129400     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001292         129500     MOVE DNAME35 TO COMPUTED-18V0.                               NC1764.2 74 271
   001293         129600     PERFORM FAIL.                                                NC1764.2 404
   001294         129700     GO TO ADD-WRITE-F1-38.                                       NC1764.2 1297
   001295         129800 ADD-DELETE-F1-38.                                                NC1764.2
   001296         129900     PERFORM DE-LETE.                                             NC1764.2 405
   001297         130000 ADD-WRITE-F1-38.                                                 NC1764.2
   001298         130100     MOVE "ADD-TEST-F1-38 " TO PAR-NAME.                          NC1764.2 253
   001299         130200     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001300         130300 ADD-TEST-F1-39.                                                  NC1764.2
   001301         130400     IF DNAME36 EQUAL TO 21                                       NC1764.2 75
   001302      1  130500         PERFORM PASS                                             NC1764.2 403
   001303      1  130600         GO TO ADD-WRITE-F1-39.                                   NC1764.2 1310
   001304         130700     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001305         130800     MOVE DNAME36 TO COMPUTED-18V0.                               NC1764.2 75 271
   001306         130900     PERFORM FAIL.                                                NC1764.2 404
   001307         131000     GO TO ADD-WRITE-F1-39.                                       NC1764.2 1310
   001308         131100 ADD-DELETE-F1-39.                                                NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200     PERFORM DE-LETE.                                             NC1764.2 405
   001310         131300 ADD-WRITE-F1-39.                                                 NC1764.2
   001311         131400     MOVE "ADD-TEST-F1-39 " TO PAR-NAME.                          NC1764.2 253
   001312         131500     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001313         131600 ADD-TEST-F1-40.                                                  NC1764.2
   001314         131700     IF DNAME37 EQUAL TO 21                                       NC1764.2 76
   001315      1  131800         PERFORM PASS                                             NC1764.2 403
   001316      1  131900         GO TO ADD-WRITE-F1-40.                                   NC1764.2 1323
   001317         132000     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001318         132100     MOVE DNAME37 TO COMPUTED-18V0.                               NC1764.2 76 271
   001319         132200     PERFORM FAIL.                                                NC1764.2 404
   001320         132300     GO TO ADD-WRITE-F1-40.                                       NC1764.2 1323
   001321         132400 ADD-DELETE-F1-40.                                                NC1764.2
   001322         132500     PERFORM DE-LETE.                                             NC1764.2 405
   001323         132600 ADD-WRITE-F1-40.                                                 NC1764.2
   001324         132700     MOVE "ADD-TEST-F1-40 " TO PAR-NAME.                          NC1764.2 253
   001325         132800     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001326         132900 ADD-TEST-F1-41.                                                  NC1764.2
   001327         133000     IF DNAME38 EQUAL TO 21                                       NC1764.2 77
   001328      1  133100         PERFORM PASS                                             NC1764.2 403
   001329      1  133200         GO TO ADD-WRITE-F1-41.                                   NC1764.2 1336
   001330         133300     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001331         133400     MOVE DNAME38 TO COMPUTED-18V0.                               NC1764.2 77 271
   001332         133500     PERFORM FAIL.                                                NC1764.2 404
   001333         133600     GO TO ADD-WRITE-F1-41.                                       NC1764.2 1336
   001334         133700 ADD-DELETE-F1-41.                                                NC1764.2
   001335         133800     PERFORM DE-LETE.                                             NC1764.2 405
   001336         133900 ADD-WRITE-F1-41.                                                 NC1764.2
   001337         134000     MOVE "ADD-TEST-F1-41 " TO PAR-NAME.                          NC1764.2 253
   001338         134100     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001339         134200 ADD-TEST-F1-42.                                                  NC1764.2
   001340         134300     IF DNAME39 EQUAL TO 21                                       NC1764.2 78
   001341      1  134400         PERFORM PASS                                             NC1764.2 403
   001342      1  134500         GO TO ADD-WRITE-F1-42.                                   NC1764.2 1349
   001343         134600     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001344         134700     MOVE DNAME39 TO COMPUTED-18V0.                               NC1764.2 78 271
   001345         134800     PERFORM FAIL.                                                NC1764.2 404
   001346         134900     GO TO ADD-WRITE-F1-42.                                       NC1764.2 1349
   001347         135000 ADD-DELETE-F1-42.                                                NC1764.2
   001348         135100     PERFORM DE-LETE.                                             NC1764.2 405
   001349         135200 ADD-WRITE-F1-42.                                                 NC1764.2
   001350         135300     MOVE "ADD-TEST-F1-42 " TO PAR-NAME.                          NC1764.2 253
   001351         135400     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001352         135500 ADD-TEST-F1-43.                                                  NC1764.2
   001353         135600     IF DNAME40 EQUAL TO 21                                       NC1764.2 79
   001354      1  135700         PERFORM PASS                                             NC1764.2 403
   001355      1  135800         GO TO ADD-WRITE-F1-43.                                   NC1764.2 1362
   001356         135900     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001357         136000     MOVE DNAME40 TO COMPUTED-18V0.                               NC1764.2 79 271
   001358         136100     PERFORM FAIL.                                                NC1764.2 404
   001359         136200     GO TO ADD-WRITE-F1-43.                                       NC1764.2 1362
   001360         136300 ADD-DELETE-F1-43.                                                NC1764.2
   001361         136400     PERFORM DE-LETE.                                             NC1764.2 405
   001362         136500 ADD-WRITE-F1-43.                                                 NC1764.2
   001363         136600     MOVE "ADD-TEST-F1-43 " TO PAR-NAME.                          NC1764.2 253
   001364         136700     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001365         136800 ADD-TEST-F1-44.                                                  NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900     IF DNAME41 EQUAL TO 21                                       NC1764.2 80
   001367      1  137000         PERFORM PASS                                             NC1764.2 403
   001368      1  137100         GO TO ADD-WRITE-F1-44.                                   NC1764.2 1375
   001369         137200     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001370         137300     MOVE DNAME41 TO COMPUTED-18V0.                               NC1764.2 80 271
   001371         137400     PERFORM FAIL.                                                NC1764.2 404
   001372         137500     GO TO ADD-WRITE-F1-44.                                       NC1764.2 1375
   001373         137600 ADD-DELETE-F1-44.                                                NC1764.2
   001374         137700     PERFORM DE-LETE.                                             NC1764.2 405
   001375         137800 ADD-WRITE-F1-44.                                                 NC1764.2
   001376         137900     MOVE "ADD-TEST-F1-44 " TO PAR-NAME.                          NC1764.2 253
   001377         138000     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001378         138100 ADD-TEST-F1-45.                                                  NC1764.2
   001379         138200     IF DNAME42 EQUAL TO 21                                       NC1764.2 81
   001380      1  138300         PERFORM PASS                                             NC1764.2 403
   001381      1  138400         GO TO ADD-WRITE-F1-45.                                   NC1764.2 1388
   001382         138500     MOVE 21 TO CORRECT-18V0.                                     NC1764.2 284
   001383         138600     MOVE DNAME42 TO COMPUTED-18V0.                               NC1764.2 81 271
   001384         138700     PERFORM FAIL.                                                NC1764.2 404
   001385         138800     GO TO ADD-WRITE-F1-45.                                       NC1764.2 1388
   001386         138900 ADD-DELETE-F1-45.                                                NC1764.2
   001387         139000     PERFORM DE-LETE.                                             NC1764.2 405
   001388         139100 ADD-WRITE-F1-45.                                                 NC1764.2
   001389         139200     MOVE "ADD-TEST-F1-45 " TO PAR-NAME.                          NC1764.2 253
   001390         139300     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001391         139400*                                                                 NC1764.2
   001392         139500 ADD-INIT-F1-46.                                                  NC1764.2
   001393         139600*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1764.2
   001394         139700     MOVE   "VI-74 6.6.4 GR1" TO ANSI-REFERENCE.                  NC1764.2 309
   001395         139800     MOVE   "ADD-TEST-F1-46"  TO PAR-NAME.                        NC1764.2 253
   001396         139900     MOVE   "ADD-TO-SERIES"   TO FEATURE.                         NC1764.2 249
   001397         140000     MOVE    ZERO TO WRK-DU-2V1-1 WRK-DU-2V0-1 WRK-DU-2V1-2       NC1764.2 IMP 159 156 160
   001398         140100             WRK-DU-2V0-2 WRK-DU-2V1-3 WRK-DU-2V0-3.              NC1764.2 157 161 158
   001399         140200     MOVE    1.1 TO WRK-DU-1V1-1.                                 NC1764.2 149
   001400         140300     MOVE    2.4 TO WRK-DU-1V1-2.                                 NC1764.2 150
   001401         140400     MOVE 1 TO REC-CT.                                            NC1764.2 300
   001402         140500 ADD-TEST-F1-46-0.                                                NC1764.2
   001403         140600     ADD WRK-DU-1V1-1  WRK-DU-1V1-2  6 TO WRK-DU-2V1-1,           NC1764.2 149 150 159
   001404         140700         WRK-DU-2V0-1 ROUNDED  WRK-DU-2V1-2  WRK-DU-2V0-2 ROUNDED NC1764.2 156 160 157
   001405         140800         WRK-DU-2V1-3  WRK-DU-2V0-3.                              NC1764.2 161 158
   001406         140900     GO TO   ADD-TEST-F1-46-1.                                    NC1764.2 1411
   001407         141000 ADD-DELETE-F1-46.                                                NC1764.2
   001408         141100     PERFORM DE-LETE.                                             NC1764.2 405
   001409         141200     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001410         141300     GO TO ADD-INIT-F1-47.                                        NC1764.2 1447
   001411         141400 ADD-TEST-F1-46-1.                                                NC1764.2
   001412         141500     IF WRK-DU-2V1-1 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 159 403 407
   001413         141600         ELSE                                                     NC1764.2
   001414      1  141700         PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.5    NC1764.2 404 159 265
   001415      1  141800         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1764.2 279 407
   001416         141900     ADD 1 TO REC-CT.                                             NC1764.2 300
   001417         142000 ADD-TEST-F1-46-2.                                                NC1764.2
   001418         142100     IF WRK-DU-2V0-1 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 156 403 407
   001419         142200         ELSE                                                     NC1764.2
   001420      1  142300         PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 156 265
   001421      1  142400         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001422         142500     ADD 1 TO REC-CT.                                             NC1764.2 300
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600 ADD-TEST-F1-46-3.                                                NC1764.2
   001424         142700     IF WRK-DU-2V1-2 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 160 403 407
   001425         142800         ELSE                                                     NC1764.2
   001426      1  142900         PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 160 265
   001427      1  143000         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001428         143100     ADD 1 TO REC-CT.                                             NC1764.2 300
   001429         143200 ADD-TEST-F1-46-4.                                                NC1764.2
   001430         143300     IF WRK-DU-2V0-2 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 157 403 407
   001431         143400         ELSE                                                     NC1764.2
   001432      1  143500         PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 157 265
   001433      1  143600         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001434         143700     ADD 1 TO REC-CT.                                             NC1764.2 300
   001435         143800 ADD-TEST-F1-46-5.                                                NC1764.2
   001436         143900     IF WRK-DU-2V1-3 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 161 403 407
   001437         144000         ELSE                                                     NC1764.2
   001438      1  144100         PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 161 265
   001439      1  144200         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001440         144300     ADD 1 TO REC-CT.                                             NC1764.2 300
   001441         144400 ADD-TEST-F1-46-6.                                                NC1764.2
   001442         144500     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1764.2 158 403 407
   001443         144600         ELSE                                                     NC1764.2
   001444      1  144700         PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9 TO   NC1764.2 404 158 265
   001445      1  144800         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001446         144900*                                                                 NC1764.2
   001447         145000 ADD-INIT-F1-47.                                                  NC1764.2
   001448         145100*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1764.2
   001449         145200*    ==-->    NEW SIZE ERROR TESTS  <--==                         NC1764.2
   001450         145300     MOVE   "VI-67 6.4.2"     TO ANSI-REFERENCE.                  NC1764.2 309
   001451         145400     MOVE   "ADD-TEST-F1-47"  TO PAR-NAME.                        NC1764.2 253
   001452         145500     MOVE    ZERO TO WRK-DU-2V1-1 WRK-DU-2V0-1 WRK-DU-2V1-2       NC1764.2 IMP 159 156 160
   001453         145600             WRK-DU-2V0-2 WRK-DU-2V1-3 WRK-DU-2V0-3.              NC1764.2 157 161 158
   001454         145700     MOVE    1.1 TO WRK-DU-1V1-1.                                 NC1764.2 149
   001455         145800     MOVE    2.4 TO WRK-DU-1V1-2.                                 NC1764.2 150
   001456         145900     MOVE   "0"  TO WRK-XN-00001.                                 NC1764.2 143
   001457         146000     MOVE 1 TO REC-CT.                                            NC1764.2 300
   001458         146100 ADD-TEST-F1-47-0.                                                NC1764.2
   001459         146200     ADD WRK-DU-1V1-1  WRK-DU-1V1-2  6 TO WRK-DU-2V1-1,           NC1764.2 149 150 159
   001460         146300         WRK-DU-2V0-1 ROUNDED  WRK-DU-2V1-2  WRK-DU-2V0-2 ROUNDED NC1764.2 156 160 157
   001461         146400         WRK-DU-2V1-3  WRK-DU-2V0-3                               NC1764.2 161 158
   001462         146500          ON SIZE ERROR                                           NC1764.2
   001463      1  146600             MOVE   "1" TO WRK-XN-00001.                          NC1764.2 143
   001464         146700     GO TO   ADD-TEST-F1-47-1.                                    NC1764.2 1469
   001465         146800 ADD-DELETE-F1-47.                                                NC1764.2
   001466         146900     PERFORM DE-LETE.                                             NC1764.2 405
   001467         147000     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001468         147100     GO TO ADD-INIT-F1-48.                                        NC1764.2 1524
   001469         147200 ADD-TEST-F1-47-1.                                                NC1764.2
   001470         147300     MOVE   "ADD-TEST-F1-47-1"  TO PAR-NAME.                      NC1764.2 253
   001471         147400     IF WRK-DU-2V1-1 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 159 403 407
   001472         147500         ELSE                                                     NC1764.2
   001473      1  147600         PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.5    NC1764.2 404 159 265
   001474      1  147700         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1764.2 279 407
   001475         147800     ADD 1 TO REC-CT.                                             NC1764.2 300
   001476         147900 ADD-TEST-F1-47-2.                                                NC1764.2
   001477         148000     MOVE   "ADD-TEST-F1-47-2"  TO PAR-NAME.                      NC1764.2 253
   001478         148100     IF WRK-DU-2V0-1 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 156 403 407
   001479         148200         ELSE                                                     NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480      1  148300         PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 156 265
   001481      1  148400         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001482         148500     ADD 1 TO REC-CT.                                             NC1764.2 300
   001483         148600 ADD-TEST-F1-47-3.                                                NC1764.2
   001484         148700     MOVE   "ADD-TEST-F1-47-3"  TO PAR-NAME.                      NC1764.2 253
   001485         148800     IF WRK-DU-2V1-2 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 160 403 407
   001486         148900         ELSE                                                     NC1764.2
   001487      1  149000         PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 160 265
   001488      1  149100         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001489         149200     ADD 1 TO REC-CT.                                             NC1764.2 300
   001490         149300 ADD-TEST-F1-47-4.                                                NC1764.2
   001491         149400     MOVE   "ADD-TEST-F1-47-4"  TO PAR-NAME.                      NC1764.2 253
   001492         149500     IF WRK-DU-2V0-2 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 157 403 407
   001493         149600         ELSE                                                     NC1764.2
   001494      1  149700         PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 157 265
   001495      1  149800         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001496         149900     ADD 1 TO REC-CT.                                             NC1764.2 300
   001497         150000 ADD-TEST-F1-47-5.                                                NC1764.2
   001498         150100     MOVE   "ADD-TEST-F1-47-5"  TO PAR-NAME.                      NC1764.2 253
   001499         150200     IF WRK-DU-2V1-3 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 161 403 407
   001500         150300         ELSE                                                     NC1764.2
   001501      1  150400         PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 161 265
   001502      1  150500         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001503         150600     ADD 1 TO REC-CT.                                             NC1764.2 300
   001504         150700 ADD-TEST-F1-47-6.                                                NC1764.2
   001505         150800     MOVE   "ADD-TEST-F1-47-6"  TO PAR-NAME.                      NC1764.2 253
   001506         150900     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1764.2 158 403 407
   001507         151000         ELSE                                                     NC1764.2
   001508      1  151100         PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9 TO   NC1764.2 404 158 265
   001509      1  151200         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001510         151300     ADD 1 TO REC-CT.                                             NC1764.2 300
   001511         151400 ADD-TEST-F1-47-7.                                                NC1764.2
   001512         151500     MOVE   "ADD-TEST-F1-47-7"  TO PAR-NAME.                      NC1764.2 253
   001513         151600     IF      WRK-XN-00001 = "0"                                   NC1764.2 143
   001514      1  151700             PERFORM PASS                                         NC1764.2 403
   001515      1  151800             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001516         151900     ELSE                                                         NC1764.2
   001517      1  152000             MOVE   "SIZE ERROR SHOULD NOT BE EXECUTED"           NC1764.2
   001518      1  152100                  TO RE-MARK                                      NC1764.2 258
   001519      1  152200             MOVE   "0"           TO CORRECT-X                    NC1764.2 277
   001520      1  152300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   001521      1  152400             PERFORM FAIL                                         NC1764.2 404
   001522      1  152500             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001523         152600*                                                                 NC1764.2
   001524         152700 ADD-INIT-F1-48.                                                  NC1764.2
   001525         152800*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1764.2
   001526         152900*    ==-->    NEW SIZE ERROR TESTS  <--==                         NC1764.2
   001527         153000     MOVE   "VI-67 6.4.2"     TO ANSI-REFERENCE.                  NC1764.2 309
   001528         153100     MOVE   "ADD-TEST-F1-48"  TO PAR-NAME.                        NC1764.2 253
   001529         153200     MOVE    ZERO TO WRK-DU-2V1-1 WRK-DU-2V0-1 WRK-DU-2V1-2       NC1764.2 IMP 159 156 160
   001530         153300             WRK-DU-2V0-2 WRK-DU-2V1-3 WRK-DU-2V0-3.              NC1764.2 157 161 158
   001531         153400     MOVE    1.1 TO WRK-DU-1V1-1.                                 NC1764.2 149
   001532         153500     MOVE    2.4 TO WRK-DU-1V1-2.                                 NC1764.2 150
   001533         153600     MOVE   "0"  TO WRK-XN-00001.                                 NC1764.2 143
   001534         153700     MOVE 1 TO REC-CT.                                            NC1764.2 300
   001535         153800 ADD-TEST-F1-48-0.                                                NC1764.2
   001536         153900     ADD     A17TWOS-DS-17V00                                     NC1764.2 91
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154000             WRK-DU-1V1-2  6                                      NC1764.2 150
   001538         154100          TO WRK-DU-2V1-1                                         NC1764.2 159
   001539         154200             WRK-DU-2V0-1 ROUNDED                                 NC1764.2 156
   001540         154300             WRK-DU-2V1-2                                         NC1764.2 160
   001541         154400             WRK-DU-2V0-2 ROUNDED                                 NC1764.2 157
   001542         154500             WRK-DU-2V1-3                                         NC1764.2 161
   001543         154600             WRK-DU-2V0-3                                         NC1764.2 158
   001544         154700          ON SIZE ERROR                                           NC1764.2
   001545      1  154800             MOVE   "1" TO WRK-XN-00001.                          NC1764.2 143
   001546         154900     GO TO   ADD-TEST-F1-48-1.                                    NC1764.2 1551
   001547         155000 ADD-DELETE-F1-48.                                                NC1764.2
   001548         155100     PERFORM DE-LETE.                                             NC1764.2 405
   001549         155200     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001550         155300     GO TO   ADD-INIT-F1-49.                                      NC1764.2 1605
   001551         155400 ADD-TEST-F1-48-1.                                                NC1764.2
   001552         155500     MOVE   "ADD-TEST-F1-48-1"  TO PAR-NAME.                      NC1764.2 253
   001553         155600     IF WRK-DU-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 159 IMP 403 407
   001554         155700         ELSE                                                     NC1764.2
   001555      1  155800         PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 0      NC1764.2 404 159 265
   001556      1  155900         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1764.2 279 407
   001557         156000     ADD 1 TO REC-CT.                                             NC1764.2 300
   001558         156100 ADD-TEST-F1-48-2.                                                NC1764.2
   001559         156200     MOVE   "ADD-TEST-F1-48-2"  TO PAR-NAME.                      NC1764.2 253
   001560         156300     IF WRK-DU-2V0-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 156 IMP 403 407
   001561         156400         ELSE                                                     NC1764.2
   001562      1  156500         PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 156 265
   001563      1  156600         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001564         156700     ADD 1 TO REC-CT.                                             NC1764.2 300
   001565         156800 ADD-TEST-F1-48-3.                                                NC1764.2
   001566         156900     MOVE   "ADD-TEST-F1-48-3"  TO PAR-NAME.                      NC1764.2 253
   001567         157000     IF WRK-DU-2V1-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 160 IMP 403 407
   001568         157100         ELSE                                                     NC1764.2
   001569      1  157200         PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 160 265
   001570      1  157300         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001571         157400     ADD 1 TO REC-CT.                                             NC1764.2 300
   001572         157500 ADD-TEST-F1-48-4.                                                NC1764.2
   001573         157600     MOVE   "ADD-TEST-F1-48-4"  TO PAR-NAME.                      NC1764.2 253
   001574         157700     IF WRK-DU-2V0-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 157 IMP 403 407
   001575         157800         ELSE                                                     NC1764.2
   001576      1  157900         PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 157 265
   001577      1  158000         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001578         158100     ADD 1 TO REC-CT.                                             NC1764.2 300
   001579         158200 ADD-TEST-F1-48-5.                                                NC1764.2
   001580         158300     MOVE   "ADD-TEST-F1-48-5"  TO PAR-NAME.                      NC1764.2 253
   001581         158400     IF WRK-DU-2V1-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 161 IMP 403 407
   001582         158500         ELSE                                                     NC1764.2
   001583      1  158600         PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 161 265
   001584      1  158700         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001585         158800     ADD 1 TO REC-CT.                                             NC1764.2 300
   001586         158900 ADD-TEST-F1-48-6.                                                NC1764.2
   001587         159000     MOVE   "ADD-TEST-F1-48-6"  TO PAR-NAME.                      NC1764.2 253
   001588         159100     IF WRK-DU-2V0-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 158 IMP 403 407
   001589         159200         ELSE                                                     NC1764.2
   001590      1  159300         PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 158 265
   001591      1  159400         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001592         159500     ADD 1 TO REC-CT.                                             NC1764.2 300
   001593         159600 ADD-TEST-F1-48-7.                                                NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700     MOVE   "ADD-TEST-F1-48-7"  TO PAR-NAME.                      NC1764.2 253
   001595         159800     IF      WRK-XN-00001 = "1"                                   NC1764.2 143
   001596      1  159900             PERFORM PASS                                         NC1764.2 403
   001597      1  160000             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001598         160100     ELSE                                                         NC1764.2
   001599      1  160200             MOVE   "SIZE ERROR NOT EXECUTED" TO RE-MARK          NC1764.2 258
   001600      1  160300             MOVE   "1"           TO CORRECT-X                    NC1764.2 277
   001601      1  160400             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   001602      1  160500             PERFORM FAIL                                         NC1764.2 404
   001603      1  160600             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001604         160700*                                                                 NC1764.2
   001605         160800 ADD-INIT-F1-49.                                                  NC1764.2
   001606         160900*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1764.2
   001607         161000*    ==-->    NEW SIZE ERROR TESTS  <--==                         NC1764.2
   001608         161100     MOVE   "VI-67 6.4.2"     TO ANSI-REFERENCE.                  NC1764.2 309
   001609         161200     MOVE   "ADD-TEST-F1-49"  TO PAR-NAME.                        NC1764.2 253
   001610         161300     MOVE    ZERO TO WRK-DU-2V1-1 WRK-DU-2V0-1 WRK-DU-2V1-2       NC1764.2 IMP 159 156 160
   001611         161400             WRK-DU-2V0-2 WRK-DU-2V1-3 WRK-DU-2V0-3.              NC1764.2 157 161 158
   001612         161500     MOVE    1.1 TO WRK-DU-1V1-1.                                 NC1764.2 149
   001613         161600     MOVE    2.4 TO WRK-DU-1V1-2.                                 NC1764.2 150
   001614         161700     MOVE   "0"  TO WRK-XN-00001.                                 NC1764.2 143
   001615         161800     MOVE 1 TO REC-CT.                                            NC1764.2 300
   001616         161900 ADD-TEST-F1-49-0.                                                NC1764.2
   001617         162000     ADD WRK-DU-1V1-1  WRK-DU-1V1-2  6 TO WRK-DU-2V1-1,           NC1764.2 149 150 159
   001618         162100         WRK-DU-2V0-1 ROUNDED  WRK-DU-2V1-2  WRK-DU-2V0-2 ROUNDED NC1764.2 156 160 157
   001619         162200         WRK-DU-2V1-3  WRK-DU-2V0-3                               NC1764.2 161 158
   001620         162300      NOT ON SIZE ERROR                                           NC1764.2
   001621      1  162400             MOVE   "1" TO WRK-XN-00001.                          NC1764.2 143
   001622         162500     GO TO   ADD-TEST-F1-49-1.                                    NC1764.2 1627
   001623         162600 ADD-DELETE-F1-49.                                                NC1764.2
   001624         162700     PERFORM DE-LETE.                                             NC1764.2 405
   001625         162800     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001626         162900     GO TO ADD-INIT-F1-50.                                        NC1764.2 1682
   001627         163000 ADD-TEST-F1-49-1.                                                NC1764.2
   001628         163100     MOVE   "ADD-TEST-F1-49-1"  TO PAR-NAME.                      NC1764.2 253
   001629         163200     IF WRK-DU-2V1-1 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 159 403 407
   001630         163300         ELSE                                                     NC1764.2
   001631      1  163400         PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.5    NC1764.2 404 159 265
   001632      1  163500         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1764.2 279 407
   001633         163600     ADD 1 TO REC-CT.                                             NC1764.2 300
   001634         163700 ADD-TEST-F1-49-2.                                                NC1764.2
   001635         163800     MOVE   "ADD-TEST-F1-49-2"  TO PAR-NAME.                      NC1764.2 253
   001636         163900     IF WRK-DU-2V0-1 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 156 403 407
   001637         164000         ELSE                                                     NC1764.2
   001638      1  164100         PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 156 265
   001639      1  164200         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001640         164300     ADD 1 TO REC-CT.                                             NC1764.2 300
   001641         164400 ADD-TEST-F1-49-3.                                                NC1764.2
   001642         164500     MOVE   "ADD-TEST-F1-49-3"  TO PAR-NAME.                      NC1764.2 253
   001643         164600     IF WRK-DU-2V1-2 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 160 403 407
   001644         164700         ELSE                                                     NC1764.2
   001645      1  164800         PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 160 265
   001646      1  164900         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001647         165000     ADD 1 TO REC-CT.                                             NC1764.2 300
   001648         165100 ADD-TEST-F1-49-4.                                                NC1764.2
   001649         165200     MOVE   "ADD-TEST-F1-49-4"  TO PAR-NAME.                      NC1764.2 253
   001650         165300     IF WRK-DU-2V0-2 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 157 403 407
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165400         ELSE                                                     NC1764.2
   001652      1  165500         PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 157 265
   001653      1  165600         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001654         165700     ADD 1 TO REC-CT.                                             NC1764.2 300
   001655         165800 ADD-TEST-F1-49-5.                                                NC1764.2
   001656         165900     MOVE   "ADD-TEST-F1-49-5"  TO PAR-NAME.                      NC1764.2 253
   001657         166000     IF WRK-DU-2V1-3 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 161 403 407
   001658         166100         ELSE                                                     NC1764.2
   001659      1  166200         PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 161 265
   001660      1  166300         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001661         166400     ADD 1 TO REC-CT.                                             NC1764.2 300
   001662         166500 ADD-TEST-F1-49-6.                                                NC1764.2
   001663         166600     MOVE   "ADD-TEST-F1-49-6"  TO PAR-NAME.                      NC1764.2 253
   001664         166700     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1764.2 158 403 407
   001665         166800         ELSE                                                     NC1764.2
   001666      1  166900         PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9 TO   NC1764.2 404 158 265
   001667      1  167000         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001668         167100     ADD 1 TO REC-CT.                                             NC1764.2 300
   001669         167200 ADD-TEST-F1-49-7.                                                NC1764.2
   001670         167300     MOVE   "ADD-TEST-F1-49-7"  TO PAR-NAME.                      NC1764.2 253
   001671         167400     IF      WRK-XN-00001 = "1"                                   NC1764.2 143
   001672      1  167500             PERFORM PASS                                         NC1764.2 403
   001673      1  167600             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001674         167700     ELSE                                                         NC1764.2
   001675      1  167800             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1764.2
   001676      1  167900                  TO RE-MARK                                      NC1764.2 258
   001677      1  168000             MOVE   "1"           TO CORRECT-X                    NC1764.2 277
   001678      1  168100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   001679      1  168200             PERFORM FAIL                                         NC1764.2 404
   001680      1  168300             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001681         168400*                                                                 NC1764.2
   001682         168500 ADD-INIT-F1-50.                                                  NC1764.2
   001683         168600*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1764.2
   001684         168700*    ==-->    NEW SIZE ERROR TESTS  <--==                         NC1764.2
   001685         168800     MOVE   "VI-67 6.4.2"     TO ANSI-REFERENCE.                  NC1764.2 309
   001686         168900     MOVE   "ADD-TEST-F1-50"  TO PAR-NAME.                        NC1764.2 253
   001687         169000     MOVE    ZERO TO WRK-DU-2V1-1 WRK-DU-2V0-1 WRK-DU-2V1-2       NC1764.2 IMP 159 156 160
   001688         169100             WRK-DU-2V0-2 WRK-DU-2V1-3 WRK-DU-2V0-3.              NC1764.2 157 161 158
   001689         169200     MOVE    1.1 TO WRK-DU-1V1-1.                                 NC1764.2 149
   001690         169300     MOVE    2.4 TO WRK-DU-1V1-2.                                 NC1764.2 150
   001691         169400     MOVE   "0"  TO WRK-XN-00001.                                 NC1764.2 143
   001692         169500     MOVE 1 TO REC-CT.                                            NC1764.2 300
   001693         169600 ADD-TEST-F1-50-0.                                                NC1764.2
   001694         169700     ADD     A17TWOS-DS-17V00                                     NC1764.2 91
   001695         169800             WRK-DU-1V1-2  6                                      NC1764.2 150
   001696         169900          TO WRK-DU-2V1-1                                         NC1764.2 159
   001697         170000             WRK-DU-2V0-1 ROUNDED                                 NC1764.2 156
   001698         170100             WRK-DU-2V1-2                                         NC1764.2 160
   001699         170200             WRK-DU-2V0-2 ROUNDED                                 NC1764.2 157
   001700         170300             WRK-DU-2V1-3                                         NC1764.2 161
   001701         170400             WRK-DU-2V0-3                                         NC1764.2 158
   001702         170500      NOT ON SIZE ERROR                                           NC1764.2
   001703      1  170600             MOVE   "1" TO WRK-XN-00001.                          NC1764.2 143
   001704         170700     GO TO   ADD-TEST-F1-50-1.                                    NC1764.2 1709
   001705         170800 ADD-DELETE-F1-50.                                                NC1764.2
   001706         170900     PERFORM DE-LETE.                                             NC1764.2 405
   001707         171000     PERFORM PRINT-DETAIL.                                        NC1764.2 407
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171100     GO TO   ADD-INIT-F1-51.                                      NC1764.2 1764
   001709         171200 ADD-TEST-F1-50-1.                                                NC1764.2
   001710         171300     MOVE   "ADD-TEST-F1-50-1"  TO PAR-NAME.                      NC1764.2 253
   001711         171400     IF WRK-DU-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 159 IMP 403 407
   001712         171500         ELSE                                                     NC1764.2
   001713      1  171600         PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 0      NC1764.2 404 159 265
   001714      1  171700         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1764.2 279 407
   001715         171800     ADD 1 TO REC-CT.                                             NC1764.2 300
   001716         171900 ADD-TEST-F1-50-2.                                                NC1764.2
   001717         172000     MOVE   "ADD-TEST-F1-50-2"  TO PAR-NAME.                      NC1764.2 253
   001718         172100     IF WRK-DU-2V0-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 156 IMP 403 407
   001719         172200         ELSE                                                     NC1764.2
   001720      1  172300         PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 156 265
   001721      1  172400         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001722         172500     ADD 1 TO REC-CT.                                             NC1764.2 300
   001723         172600 ADD-TEST-F1-50-3.                                                NC1764.2
   001724         172700     MOVE   "ADD-TEST-F1-50-3"  TO PAR-NAME.                      NC1764.2 253
   001725         172800     IF WRK-DU-2V1-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 160 IMP 403 407
   001726         172900         ELSE                                                     NC1764.2
   001727      1  173000         PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 160 265
   001728      1  173100         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001729         173200     ADD 1 TO REC-CT.                                             NC1764.2 300
   001730         173300 ADD-TEST-F1-50-4.                                                NC1764.2
   001731         173400     MOVE   "ADD-TEST-F1-50-4"  TO PAR-NAME.                      NC1764.2 253
   001732         173500     IF WRK-DU-2V0-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 157 IMP 403 407
   001733         173600         ELSE                                                     NC1764.2
   001734      1  173700         PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 157 265
   001735      1  173800         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001736         173900     ADD 1 TO REC-CT.                                             NC1764.2 300
   001737         174000 ADD-TEST-F1-50-5.                                                NC1764.2
   001738         174100     MOVE   "ADD-TEST-F1-50-5"  TO PAR-NAME.                      NC1764.2 253
   001739         174200     IF WRK-DU-2V1-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 161 IMP 403 407
   001740         174300         ELSE                                                     NC1764.2
   001741      1  174400         PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 161 265
   001742      1  174500         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001743         174600     ADD 1 TO REC-CT.                                             NC1764.2 300
   001744         174700 ADD-TEST-F1-50-6.                                                NC1764.2
   001745         174800     MOVE   "ADD-TEST-F1-50-6"  TO PAR-NAME.                      NC1764.2 253
   001746         174900     IF WRK-DU-2V0-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 158 IMP 403 407
   001747         175000         ELSE                                                     NC1764.2
   001748      1  175100         PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 158 265
   001749      1  175200         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001750         175300     ADD 1 TO REC-CT.                                             NC1764.2 300
   001751         175400 ADD-TEST-F1-50-7.                                                NC1764.2
   001752         175500     MOVE   "ADD-TEST-F1-50-7"  TO PAR-NAME.                      NC1764.2 253
   001753         175600     IF      WRK-XN-00001 = "0"                                   NC1764.2 143
   001754      1  175700             PERFORM PASS                                         NC1764.2 403
   001755      1  175800             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001756         175900     ELSE                                                         NC1764.2
   001757      1  176000             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1764.2
   001758      1  176100                  TO RE-MARK                                      NC1764.2 258
   001759      1  176200             MOVE   "0"           TO CORRECT-X                    NC1764.2 277
   001760      1  176300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   001761      1  176400             PERFORM FAIL                                         NC1764.2 404
   001762      1  176500             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001763         176600*                                                                 NC1764.2
   001764         176700 ADD-INIT-F1-51.                                                  NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1764.2
   001766         176900*    ==-->    NEW SIZE ERROR TESTS  <--==                         NC1764.2
   001767         177000     MOVE   "VI-67 6.4.2"     TO ANSI-REFERENCE.                  NC1764.2 309
   001768         177100     MOVE   "ADD-TEST-F1-51"  TO PAR-NAME.                        NC1764.2 253
   001769         177200     MOVE    ZERO TO WRK-DU-2V1-1 WRK-DU-2V0-1 WRK-DU-2V1-2       NC1764.2 IMP 159 156 160
   001770         177300             WRK-DU-2V0-2 WRK-DU-2V1-3 WRK-DU-2V0-3.              NC1764.2 157 161 158
   001771         177400     MOVE    1.1 TO WRK-DU-1V1-1.                                 NC1764.2 149
   001772         177500     MOVE    2.4 TO WRK-DU-1V1-2.                                 NC1764.2 150
   001773         177600     MOVE   "0"  TO WRK-XN-00001.                                 NC1764.2 143
   001774         177700     MOVE 1 TO REC-CT.                                            NC1764.2 300
   001775         177800 ADD-TEST-F1-51-0.                                                NC1764.2
   001776         177900     ADD WRK-DU-1V1-1  WRK-DU-1V1-2  6 TO WRK-DU-2V1-1,           NC1764.2 149 150 159
   001777         178000         WRK-DU-2V0-1 ROUNDED  WRK-DU-2V1-2  WRK-DU-2V0-2 ROUNDED NC1764.2 156 160 157
   001778         178100         WRK-DU-2V1-3  WRK-DU-2V0-3                               NC1764.2 161 158
   001779         178200          ON SIZE ERROR                                           NC1764.2
   001780      1  178300             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   001781         178400      NOT ON SIZE ERROR                                           NC1764.2
   001782      1  178500             MOVE   "2" TO WRK-XN-00001.                          NC1764.2 143
   001783         178600     GO TO   ADD-TEST-F1-51-1.                                    NC1764.2 1788
   001784         178700 ADD-DELETE-F1-51.                                                NC1764.2
   001785         178800     PERFORM DE-LETE.                                             NC1764.2 405
   001786         178900     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001787         179000     GO TO ADD-INIT-F1-52.                                        NC1764.2 1843
   001788         179100 ADD-TEST-F1-51-1.                                                NC1764.2
   001789         179200     MOVE   "ADD-TEST-F1-51-1"  TO PAR-NAME.                      NC1764.2 253
   001790         179300     IF WRK-DU-2V1-1 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 159 403 407
   001791         179400         ELSE                                                     NC1764.2
   001792      1  179500         PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 9.5    NC1764.2 404 159 265
   001793      1  179600         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1764.2 279 407
   001794         179700     ADD 1 TO REC-CT.                                             NC1764.2 300
   001795         179800 ADD-TEST-F1-51-2.                                                NC1764.2
   001796         179900     MOVE   "ADD-TEST-F1-51-2"  TO PAR-NAME.                      NC1764.2 253
   001797         180000     IF WRK-DU-2V0-1 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 156 403 407
   001798         180100         ELSE                                                     NC1764.2
   001799      1  180200         PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 156 265
   001800      1  180300         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001801         180400     ADD 1 TO REC-CT.                                             NC1764.2 300
   001802         180500 ADD-TEST-F1-51-3.                                                NC1764.2
   001803         180600     MOVE   "ADD-TEST-F1-51-3"  TO PAR-NAME.                      NC1764.2 253
   001804         180700     IF WRK-DU-2V1-2 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 160 403 407
   001805         180800         ELSE                                                     NC1764.2
   001806      1  180900         PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 160 265
   001807      1  181000         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001808         181100     ADD 1 TO REC-CT.                                             NC1764.2 300
   001809         181200 ADD-TEST-F1-51-4.                                                NC1764.2
   001810         181300     MOVE   "ADD-TEST-F1-51-4"  TO PAR-NAME.                      NC1764.2 253
   001811         181400     IF WRK-DU-2V0-2 = 10 PERFORM PASS PERFORM PRINT-DETAIL       NC1764.2 157 403 407
   001812         181500         ELSE                                                     NC1764.2
   001813      1  181600         PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 10 TO  NC1764.2 404 157 265
   001814      1  181700         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001815         181800     ADD 1 TO REC-CT.                                             NC1764.2 300
   001816         181900 ADD-TEST-F1-51-5.                                                NC1764.2
   001817         182000     MOVE   "ADD-TEST-F1-51-5"  TO PAR-NAME.                      NC1764.2 253
   001818         182100     IF WRK-DU-2V1-3 = 9.5 PERFORM PASS PERFORM PRINT-DETAIL      NC1764.2 161 403 407
   001819         182200         ELSE                                                     NC1764.2
   001820      1  182300         PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 9.5 TO NC1764.2 404 161 265
   001821      1  182400         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182500     ADD 1 TO REC-CT.                                             NC1764.2 300
   001823         182600 ADD-TEST-F1-51-6.                                                NC1764.2
   001824         182700     MOVE   "ADD-TEST-F1-51-6"  TO PAR-NAME.                      NC1764.2 253
   001825         182800     IF WRK-DU-2V0-3 = 9 PERFORM PASS PERFORM PRINT-DETAIL        NC1764.2 158 403 407
   001826         182900         ELSE                                                     NC1764.2
   001827      1  183000         PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 9 TO   NC1764.2 404 158 265
   001828      1  183100         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001829         183200     ADD 1 TO REC-CT.                                             NC1764.2 300
   001830         183300 ADD-TEST-F1-51-7.                                                NC1764.2
   001831         183400     MOVE   "ADD-TEST-F1-51-7"  TO PAR-NAME.                      NC1764.2 253
   001832         183500     IF      WRK-XN-00001 = "2"                                   NC1764.2 143
   001833      1  183600             PERFORM PASS                                         NC1764.2 403
   001834      1  183700             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001835         183800     ELSE                                                         NC1764.2
   001836      1  183900             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1764.2
   001837      1  184000                  TO RE-MARK                                      NC1764.2 258
   001838      1  184100             MOVE   "2"           TO CORRECT-X                    NC1764.2 277
   001839      1  184200             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   001840      1  184300             PERFORM FAIL                                         NC1764.2 404
   001841      1  184400             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001842         184500*                                                                 NC1764.2
   001843         184600 ADD-INIT-F1-52.                                                  NC1764.2
   001844         184700*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1764.2
   001845         184800*    ==-->    NEW SIZE ERROR TESTS  <--==                         NC1764.2
   001846         184900     MOVE   "VI-67 6.4.2"     TO ANSI-REFERENCE.                  NC1764.2 309
   001847         185000     MOVE   "ADD-TEST-F1-52"  TO PAR-NAME.                        NC1764.2 253
   001848         185100     MOVE    ZERO TO WRK-DU-2V1-1 WRK-DU-2V0-1 WRK-DU-2V1-2       NC1764.2 IMP 159 156 160
   001849         185200             WRK-DU-2V0-2 WRK-DU-2V1-3 WRK-DU-2V0-3.              NC1764.2 157 161 158
   001850         185300     MOVE    1.1 TO WRK-DU-1V1-1.                                 NC1764.2 149
   001851         185400     MOVE    2.4 TO WRK-DU-1V1-2.                                 NC1764.2 150
   001852         185500     MOVE   "0"  TO WRK-XN-00001.                                 NC1764.2 143
   001853         185600     MOVE 1 TO REC-CT.                                            NC1764.2 300
   001854         185700 ADD-TEST-F1-52-0.                                                NC1764.2
   001855         185800     ADD     A17TWOS-DS-17V00                                     NC1764.2 91
   001856         185900             WRK-DU-1V1-2  6                                      NC1764.2 150
   001857         186000          TO WRK-DU-2V1-1                                         NC1764.2 159
   001858         186100             WRK-DU-2V0-1 ROUNDED                                 NC1764.2 156
   001859         186200             WRK-DU-2V1-2                                         NC1764.2 160
   001860         186300             WRK-DU-2V0-2 ROUNDED                                 NC1764.2 157
   001861         186400             WRK-DU-2V1-3                                         NC1764.2 161
   001862         186500             WRK-DU-2V0-3                                         NC1764.2 158
   001863         186600          ON SIZE ERROR                                           NC1764.2
   001864      1  186700             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   001865         186800      NOT ON SIZE ERROR                                           NC1764.2
   001866      1  186900             MOVE   "2" TO WRK-XN-00001.                          NC1764.2 143
   001867         187000     GO TO   ADD-TEST-F1-52-1.                                    NC1764.2 1872
   001868         187100 ADD-DELETE-F1-52.                                                NC1764.2
   001869         187200     PERFORM DE-LETE.                                             NC1764.2 405
   001870         187300     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001871         187400     GO TO   ADD-INIT-F1-53.                                      NC1764.2 1927
   001872         187500 ADD-TEST-F1-52-1.                                                NC1764.2
   001873         187600     MOVE   "ADD-TEST-F1-52-1"  TO PAR-NAME.                      NC1764.2 253
   001874         187700     IF WRK-DU-2V1-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 159 IMP 403 407
   001875         187800         ELSE                                                     NC1764.2
   001876      1  187900         PERFORM FAIL MOVE WRK-DU-2V1-1 TO COMPUTED-N MOVE 0      NC1764.2 404 159 265
   001877      1  188000         TO CORRECT-N PERFORM PRINT-DETAIL.                       NC1764.2 279 407
   001878         188100     ADD 1 TO REC-CT.                                             NC1764.2 300
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200 ADD-TEST-F1-52-2.                                                NC1764.2
   001880         188300     MOVE   "ADD-TEST-F1-52-2"  TO PAR-NAME.                      NC1764.2 253
   001881         188400     IF WRK-DU-2V0-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 156 IMP 403 407
   001882         188500         ELSE                                                     NC1764.2
   001883      1  188600         PERFORM FAIL MOVE WRK-DU-2V0-1 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 156 265
   001884      1  188700         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001885         188800     ADD 1 TO REC-CT.                                             NC1764.2 300
   001886         188900 ADD-TEST-F1-52-3.                                                NC1764.2
   001887         189000     MOVE   "ADD-TEST-F1-52-3"  TO PAR-NAME.                      NC1764.2 253
   001888         189100     IF WRK-DU-2V1-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 160 IMP 403 407
   001889         189200         ELSE                                                     NC1764.2
   001890      1  189300         PERFORM FAIL MOVE WRK-DU-2V1-2 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 160 265
   001891      1  189400         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001892         189500     ADD 1 TO REC-CT.                                             NC1764.2 300
   001893         189600 ADD-TEST-F1-52-4.                                                NC1764.2
   001894         189700     MOVE   "ADD-TEST-F1-52-4"  TO PAR-NAME.                      NC1764.2 253
   001895         189800     IF WRK-DU-2V0-2 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 157 IMP 403 407
   001896         189900         ELSE                                                     NC1764.2
   001897      1  190000         PERFORM FAIL MOVE WRK-DU-2V0-2 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 157 265
   001898      1  190100         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001899         190200     ADD 1 TO REC-CT.                                             NC1764.2 300
   001900         190300 ADD-TEST-F1-52-5.                                                NC1764.2
   001901         190400     MOVE   "ADD-TEST-F1-52-5"  TO PAR-NAME.                      NC1764.2 253
   001902         190500     IF WRK-DU-2V1-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 161 IMP 403 407
   001903         190600         ELSE                                                     NC1764.2
   001904      1  190700         PERFORM FAIL MOVE WRK-DU-2V1-3 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 161 265
   001905      1  190800         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001906         190900     ADD 1 TO REC-CT.                                             NC1764.2 300
   001907         191000 ADD-TEST-F1-52-6.                                                NC1764.2
   001908         191100     MOVE   "ADD-TEST-F1-52-6"  TO PAR-NAME.                      NC1764.2 253
   001909         191200     IF WRK-DU-2V0-3 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1764.2 158 IMP 403 407
   001910         191300         ELSE                                                     NC1764.2
   001911      1  191400         PERFORM FAIL MOVE WRK-DU-2V0-3 TO COMPUTED-N MOVE 0 TO   NC1764.2 404 158 265
   001912      1  191500         CORRECT-N PERFORM PRINT-DETAIL.                          NC1764.2 279 407
   001913         191600     ADD 1 TO REC-CT.                                             NC1764.2 300
   001914         191700 ADD-TEST-F1-52-7.                                                NC1764.2
   001915         191800     MOVE   "ADD-TEST-F1-52-7"  TO PAR-NAME.                      NC1764.2 253
   001916         191900     IF      WRK-XN-00001 = "1"                                   NC1764.2 143
   001917      1  192000             PERFORM PASS                                         NC1764.2 403
   001918      1  192100             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001919         192200     ELSE                                                         NC1764.2
   001920      1  192300             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1764.2
   001921      1  192400                  TO RE-MARK                                      NC1764.2 258
   001922      1  192500             MOVE   "1"           TO CORRECT-X                    NC1764.2 277
   001923      1  192600             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   001924      1  192700             PERFORM FAIL                                         NC1764.2 404
   001925      1  192800             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001926         192900*                                                                 NC1764.2
   001927         193000 ADD-INIT-F1-53.                                                  NC1764.2
   001928         193100*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1764.2
   001929         193200     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1764.2 309
   001930         193300     MOVE   "ADD-TEST-F1-53"  TO PAR-NAME.                        NC1764.2 253
   001931         193400     MOVE    SPACE TO WRK-XN-00001.                               NC1764.2 IMP 143
   001932         193500     MOVE    SPACE TO SIZE-ERR2.                                  NC1764.2 IMP 83
   001933         193600     MOVE    SPACE TO SIZE-ERR3.                                  NC1764.2 IMP 84
   001934         193700     MOVE    SPACE TO SIZE-ERR4.                                  NC1764.2 IMP 85
   001935         193800     MOVE   -11 TO WRK-DS-02V00.                                  NC1764.2 112
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900     MOVE    1  TO REC-CT.                                        NC1764.2 300
   001937         194000 ADD-TEST-F1-53-0.                                                NC1764.2
   001938         194100     ADD    -99 TO WRK-DS-02V00                                   NC1764.2 112
   001939         194200             ON SIZE ERROR                                        NC1764.2
   001940      1  194300             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   001941      1  194400             MOVE   "A" TO SIZE-ERR2                              NC1764.2 83
   001942      1  194500             MOVE   "B" TO SIZE-ERR3                              NC1764.2 84
   001943         194600     END-ADD                                                      NC1764.2
   001944         194700     MOVE   "C" TO SIZE-ERR4.                                     NC1764.2 85
   001945         194800     GO TO   ADD-TEST-F1-53-1.                                    NC1764.2 1950
   001946         194900 ADD-DELETE-F1-53.                                                NC1764.2
   001947         195000     PERFORM DE-LETE.                                             NC1764.2 405
   001948         195100     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   001949         195200     GO TO   ADD-INIT-F1-54.                                      NC1764.2 2015
   001950         195300 ADD-TEST-F1-53-1.                                                NC1764.2
   001951         195400     MOVE   "ADD-TEST-F1-53-1" TO PAR-NAME.                       NC1764.2 253
   001952         195500     IF      WRK-XN-00001 = "1"                                   NC1764.2 143
   001953      1  195600             PERFORM PASS                                         NC1764.2 403
   001954      1  195700             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001955         195800     ELSE                                                         NC1764.2
   001956      1  195900             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1764.2
   001957      1  196000                  TO RE-MARK                                      NC1764.2 258
   001958      1  196100             MOVE   "1"           TO CORRECT-X                    NC1764.2 277
   001959      1  196200             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   001960      1  196300             PERFORM FAIL                                         NC1764.2 404
   001961      1  196400             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001962         196500     ADD     1 TO REC-CT.                                         NC1764.2 300
   001963         196600 ADD-TEST-F1-53-2.                                                NC1764.2
   001964         196700     MOVE   "ADD-TEST-F1-53-2" TO PAR-NAME.                       NC1764.2 253
   001965         196800     IF      SIZE-ERR2 = "A"                                      NC1764.2 83
   001966      1  196900             PERFORM PASS                                         NC1764.2 403
   001967      1  197000             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001968         197100     ELSE                                                         NC1764.2
   001969      1  197200             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1764.2
   001970      1  197300                  TO RE-MARK                                      NC1764.2 258
   001971      1  197400             MOVE   "A"        TO CORRECT-X                       NC1764.2 277
   001972      1  197500             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1764.2 83 263
   001973      1  197600             PERFORM FAIL                                         NC1764.2 404
   001974      1  197700             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001975         197800     ADD     1 TO REC-CT.                                         NC1764.2 300
   001976         197900 ADD-TEST-F1-53-3.                                                NC1764.2
   001977         198000     MOVE   "ADD-TEST-F1-53-3" TO PAR-NAME.                       NC1764.2 253
   001978         198100     IF      SIZE-ERR3 = "B"                                      NC1764.2 84
   001979      1  198200             PERFORM PASS                                         NC1764.2 403
   001980      1  198300             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001981         198400     ELSE                                                         NC1764.2
   001982      1  198500             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1764.2
   001983      1  198600                  TO RE-MARK                                      NC1764.2 258
   001984      1  198700             MOVE   "B"        TO CORRECT-X                       NC1764.2 277
   001985      1  198800             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1764.2 84 263
   001986      1  198900             PERFORM FAIL                                         NC1764.2 404
   001987      1  199000             PERFORM PRINT-DETAIL.                                NC1764.2 407
   001988         199100     ADD     1 TO REC-CT.                                         NC1764.2 300
   001989         199200 ADD-TEST-F1-53-4.                                                NC1764.2
   001990         199300     MOVE   "ADD-TEST-F1-53-4" TO PAR-NAME.                       NC1764.2 253
   001991         199400     IF      SIZE-ERR4 = "C"                                      NC1764.2 85
   001992      1  199500             PERFORM PASS                                         NC1764.2 403
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993      1  199600             PERFORM PRINT-DETAIL                                 NC1764.2 407
   001994         199700     ELSE                                                         NC1764.2
   001995      1  199800             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1764.2
   001996      1  199900                  TO RE-MARK                                      NC1764.2 258
   001997      1  200000             MOVE   "C"        TO CORRECT-X                       NC1764.2 277
   001998      1  200100             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1764.2 85 263
   001999      1  200200             PERFORM FAIL                                         NC1764.2 404
   002000      1  200300             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002001         200400     ADD     1 TO REC-CT.                                         NC1764.2 300
   002002         200500 ADD-TEST-F1-53-5.                                                NC1764.2
   002003         200600     MOVE   "ADD-TEST-F1-53-5" TO PAR-NAME.                       NC1764.2 253
   002004         200700     IF      WRK-DS-02V00 = -11                                   NC1764.2 112
   002005      1  200800             PERFORM PASS                                         NC1764.2 403
   002006      1  200900             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002007         201000     ELSE                                                         NC1764.2
   002008      1  201100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1764.2
   002009      1  201200                  TO RE-MARK                                      NC1764.2 258
   002010      1  201300             MOVE    -11          TO CORRECT-N                    NC1764.2 279
   002011      1  201400             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1764.2 112 265
   002012      1  201500             PERFORM FAIL                                         NC1764.2 404
   002013      1  201600             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002014         201700*                                                                 NC1764.2
   002015         201800 ADD-INIT-F1-54.                                                  NC1764.2
   002016         201900*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1764.2
   002017         202000     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1764.2 309
   002018         202100     MOVE   "ADD-TEST-F1-54"  TO PAR-NAME.                        NC1764.2 253
   002019         202200     MOVE    SPACE TO WRK-XN-00001.                               NC1764.2 IMP 143
   002020         202300     MOVE    SPACE TO SIZE-ERR2.                                  NC1764.2 IMP 83
   002021         202400     MOVE    SPACE TO SIZE-ERR3.                                  NC1764.2 IMP 84
   002022         202500     MOVE    SPACE TO SIZE-ERR4.                                  NC1764.2 IMP 85
   002023         202600     MOVE    ZERO TO WRK-DS-06V06.                                NC1764.2 IMP 106
   002024         202700     MOVE    1    TO REC-CT.                                      NC1764.2 300
   002025         202800 ADD-TEST-F1-54-0.                                                NC1764.2
   002026         202900     ADD     A12THREES-DS-06V06                                   NC1764.2 104
   002027         203000             333333                                               NC1764.2
   002028         203100             A06THREES-DS-03V03                                   NC1764.2 102
   002029         203200          TO WRK-DS-06V06 ROUNDED                                 NC1764.2 106
   002030         203300             ON SIZE ERROR                                        NC1764.2
   002031      1  203400             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   002032      1  203500             MOVE   "A" TO SIZE-ERR2                              NC1764.2 83
   002033      1  203600             MOVE   "B" TO SIZE-ERR3                              NC1764.2 84
   002034         203700     END-ADD                                                      NC1764.2
   002035         203800     MOVE   "C" TO SIZE-ERR4.                                     NC1764.2 85
   002036         203900     GO TO   ADD-TEST-F1-54-1.                                    NC1764.2 2041
   002037         204000 ADD-DELETE-F1-54.                                                NC1764.2
   002038         204100     PERFORM DE-LETE.                                             NC1764.2 405
   002039         204200     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   002040         204300     GO TO   ADD-INIT-F1-55.                                      NC1764.2 2106
   002041         204400 ADD-TEST-F1-54-1.                                                NC1764.2
   002042         204500     MOVE   "ADD-TEST-F1-54-1" TO PAR-NAME.                       NC1764.2 253
   002043         204600     IF      WRK-XN-00001 = SPACE                                 NC1764.2 143 IMP
   002044      1  204700             PERFORM PASS                                         NC1764.2 403
   002045      1  204800             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002046         204900     ELSE                                                         NC1764.2
   002047      1  205000             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1764.2
   002048      1  205100                  TO RE-MARK                                      NC1764.2 258
   002049      1  205200             MOVE    SPACE        TO CORRECT-X                    NC1764.2 IMP 277
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050      1  205300             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   002051      1  205400             PERFORM FAIL                                         NC1764.2 404
   002052      1  205500             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002053         205600     ADD     1 TO REC-CT.                                         NC1764.2 300
   002054         205700 ADD-TEST-F1-54-2.                                                NC1764.2
   002055         205800     MOVE   "ADD-TEST-F1-54-2" TO PAR-NAME.                       NC1764.2 253
   002056         205900     IF      SIZE-ERR2 = SPACE                                    NC1764.2 83 IMP
   002057      1  206000             PERFORM PASS                                         NC1764.2 403
   002058      1  206100             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002059         206200     ELSE                                                         NC1764.2
   002060      1  206300             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1764.2
   002061      1  206400                  TO RE-MARK                                      NC1764.2 258
   002062      1  206500             MOVE    SPACE     TO CORRECT-X                       NC1764.2 IMP 277
   002063      1  206600             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1764.2 83 263
   002064      1  206700             PERFORM FAIL                                         NC1764.2 404
   002065      1  206800             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002066         206900     ADD     1 TO REC-CT.                                         NC1764.2 300
   002067         207000 ADD-TEST-F1-54-3.                                                NC1764.2
   002068         207100     MOVE   "ADD-TEST-F1-54-3" TO PAR-NAME.                       NC1764.2 253
   002069         207200     IF      SIZE-ERR3 = SPACE                                    NC1764.2 84 IMP
   002070      1  207300             PERFORM PASS                                         NC1764.2 403
   002071      1  207400             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002072         207500     ELSE                                                         NC1764.2
   002073      1  207600             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1764.2
   002074      1  207700                  TO RE-MARK                                      NC1764.2 258
   002075      1  207800             MOVE    SPACE     TO CORRECT-X                       NC1764.2 IMP 277
   002076      1  207900             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1764.2 84 263
   002077      1  208000             PERFORM FAIL                                         NC1764.2 404
   002078      1  208100             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002079         208200     ADD     1 TO REC-CT.                                         NC1764.2 300
   002080         208300 ADD-TEST-F1-54-4.                                                NC1764.2
   002081         208400     MOVE   "ADD-TEST-F1-54-4" TO PAR-NAME.                       NC1764.2 253
   002082         208500     IF      SIZE-ERR4 = "C"                                      NC1764.2 85
   002083      1  208600             PERFORM PASS                                         NC1764.2 403
   002084      1  208700             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002085         208800     ELSE                                                         NC1764.2
   002086      1  208900             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1764.2
   002087      1  209000                  TO RE-MARK                                      NC1764.2 258
   002088      1  209100             MOVE   "C"        TO CORRECT-X                       NC1764.2 277
   002089      1  209200             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1764.2 85 263
   002090      1  209300             PERFORM FAIL                                         NC1764.2 404
   002091      1  209400             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002092      1  209500             ADD     1 TO REC-CT.                                 NC1764.2 300
   002093         209600 ADD-TEST-F1-54-5.                                                NC1764.2
   002094         209700     MOVE   "ADD-TEST-F1-54-5" TO PAR-NAME.                       NC1764.2 253
   002095         209800     IF      WRK-DS-06V06 = 666999.666333                         NC1764.2 106
   002096      1  209900             PERFORM PASS                                         NC1764.2 403
   002097      1  210000             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002098         210100     ELSE                                                         NC1764.2
   002099      1  210200             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1764.2
   002100      1  210300                  TO RE-MARK                                      NC1764.2 258
   002101      1  210400             MOVE    666999.666333 TO CORRECT-N                   NC1764.2 279
   002102      1  210500             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1764.2 106 265
   002103      1  210600             PERFORM FAIL                                         NC1764.2 404
   002104      1  210700             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002105         210800*                                                                 NC1764.2
   002106         210900 ADD-INIT-F1-55.                                                  NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211000*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1764.2
   002108         211100     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1764.2 309
   002109         211200     MOVE   "ADD-TEST-F1-55"  TO PAR-NAME.                        NC1764.2 253
   002110         211300     MOVE   SPACE TO WRK-XN-00001.                                NC1764.2 IMP 143
   002111         211400     MOVE   SPACE TO SIZE-ERR2.                                   NC1764.2 IMP 83
   002112         211500     MOVE   SPACE TO SIZE-ERR3.                                   NC1764.2 IMP 84
   002113         211600     MOVE   SPACE TO SIZE-ERR4.                                   NC1764.2 IMP 85
   002114         211700     MOVE     -11 TO WRK-DS-02V00.                                NC1764.2 112
   002115         211800     MOVE       1 TO REC-CT.                                      NC1764.2 300
   002116         211900 ADD-TEST-F1-55-0.                                                NC1764.2
   002117         212000     ADD    -99 TO WRK-DS-02V00                                   NC1764.2 112
   002118         212100             NOT ON SIZE ERROR                                    NC1764.2
   002119      1  212200             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   002120      1  212300             MOVE   "A" TO SIZE-ERR2                              NC1764.2 83
   002121      1  212400             MOVE   "B" TO SIZE-ERR3                              NC1764.2 84
   002122         212500     END-ADD                                                      NC1764.2
   002123         212600     MOVE   "C" TO SIZE-ERR4.                                     NC1764.2 85
   002124         212700     GO TO   ADD-TEST-F1-55-1.                                    NC1764.2 2129
   002125         212800 ADD-DELETE-F1-55.                                                NC1764.2
   002126         212900     PERFORM DE-LETE.                                             NC1764.2 405
   002127         213000     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   002128         213100     GO      TO ADD-INIT-F1-56.                                   NC1764.2 2194
   002129         213200 ADD-TEST-F1-55-1.                                                NC1764.2
   002130         213300     MOVE   "ADD-TEST-F1-55-1" TO PAR-NAME.                       NC1764.2 253
   002131         213400     IF      WRK-XN-00001 = SPACE                                 NC1764.2 143 IMP
   002132      1  213500             PERFORM PASS                                         NC1764.2 403
   002133      1  213600             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002134         213700     ELSE                                                         NC1764.2
   002135      1  213800             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1764.2
   002136      1  213900                  TO RE-MARK                                      NC1764.2 258
   002137      1  214000             MOVE    SPACE        TO CORRECT-X                    NC1764.2 IMP 277
   002138      1  214100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   002139      1  214200             PERFORM FAIL                                         NC1764.2 404
   002140      1  214300             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002141         214400     ADD     1 TO REC-CT.                                         NC1764.2 300
   002142         214500 ADD-TEST-F1-55-2.                                                NC1764.2
   002143         214600     MOVE   "ADD-TEST-F1-55-2" TO PAR-NAME.                       NC1764.2 253
   002144         214700     IF      SIZE-ERR2 = SPACE                                    NC1764.2 83 IMP
   002145      1  214800             PERFORM PASS                                         NC1764.2 403
   002146      1  214900             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002147         215000     ELSE                                                         NC1764.2
   002148      1  215100             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1764.2
   002149      1  215200                  TO RE-MARK                                      NC1764.2 258
   002150      1  215300             MOVE    SPACE     TO CORRECT-X                       NC1764.2 IMP 277
   002151      1  215400             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1764.2 83 263
   002152      1  215500             PERFORM FAIL                                         NC1764.2 404
   002153      1  215600             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002154         215700     ADD     1 TO REC-CT.                                         NC1764.2 300
   002155         215800 ADD-TEST-F1-55-3.                                                NC1764.2
   002156         215900     MOVE   "ADD-TEST-F1-55-3" TO PAR-NAME.                       NC1764.2 253
   002157         216000     IF      SIZE-ERR3 = SPACE                                    NC1764.2 84 IMP
   002158      1  216100             PERFORM PASS                                         NC1764.2 403
   002159      1  216200             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002160         216300     ELSE                                                         NC1764.2
   002161      1  216400             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1764.2
   002162      1  216500                  TO RE-MARK                                      NC1764.2 258
   002163      1  216600             MOVE    SPACE     TO CORRECT-X                       NC1764.2 IMP 277
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164      1  216700             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1764.2 84 263
   002165      1  216800             PERFORM FAIL                                         NC1764.2 404
   002166      1  216900             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002167         217000     ADD     1 TO REC-CT.                                         NC1764.2 300
   002168         217100 ADD-TEST-F1-55-4.                                                NC1764.2
   002169         217200     MOVE   "ADD-TEST-F1-55-4" TO PAR-NAME.                       NC1764.2 253
   002170         217300     IF      SIZE-ERR4 = "C"                                      NC1764.2 85
   002171      1  217400             PERFORM PASS                                         NC1764.2 403
   002172      1  217500             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002173         217600     ELSE                                                         NC1764.2
   002174      1  217700             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1764.2
   002175      1  217800                  TO RE-MARK                                      NC1764.2 258
   002176      1  217900             MOVE   "C"        TO CORRECT-X                       NC1764.2 277
   002177      1  218000             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1764.2 85 263
   002178      1  218100             PERFORM FAIL                                         NC1764.2 404
   002179      1  218200             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002180         218300     ADD     1 TO REC-CT.                                         NC1764.2 300
   002181         218400 ADD-TEST-F1-55-5.                                                NC1764.2
   002182         218500     MOVE   "ADD-TEST-F1-55-5" TO PAR-NAME.                       NC1764.2 253
   002183         218600     IF      WRK-DS-02V00 = -11                                   NC1764.2 112
   002184      1  218700             PERFORM PASS                                         NC1764.2 403
   002185      1  218800             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002186         218900     ELSE                                                         NC1764.2
   002187      1  219000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1764.2
   002188      1  219100                  TO RE-MARK                                      NC1764.2 258
   002189      1  219200             MOVE    -11          TO CORRECT-N                    NC1764.2 279
   002190      1  219300             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1764.2 112 265
   002191      1  219400             PERFORM FAIL                                         NC1764.2 404
   002192      1  219500             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002193         219600*                                                                 NC1764.2
   002194         219700 ADD-INIT-F1-56.                                                  NC1764.2
   002195         219800*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1764.2
   002196         219900     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1764.2 309
   002197         220000     MOVE   "ADD-TEST-F1-56"  TO PAR-NAME.                        NC1764.2 253
   002198         220100     MOVE    SPACE TO WRK-XN-00001.                               NC1764.2 IMP 143
   002199         220200     MOVE    SPACE TO SIZE-ERR2.                                  NC1764.2 IMP 83
   002200         220300     MOVE    SPACE TO SIZE-ERR3.                                  NC1764.2 IMP 84
   002201         220400     MOVE    SPACE TO SIZE-ERR4.                                  NC1764.2 IMP 85
   002202         220500     MOVE    ZERO  TO WRK-DS-06V06.                               NC1764.2 IMP 106
   002203         220600     MOVE    1     TO REC-CT.                                     NC1764.2 300
   002204         220700 ADD-TEST-F1-56-0.                                                NC1764.2
   002205         220800     ADD     A12THREES-DS-06V06                                   NC1764.2 104
   002206         220900             333333                                               NC1764.2
   002207         221000             A06THREES-DS-03V03                                   NC1764.2 102
   002208         221100          TO WRK-DS-06V06 ROUNDED                                 NC1764.2 106
   002209         221200         NOT ON SIZE ERROR                                        NC1764.2
   002210      1  221300             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   002211      1  221400             MOVE   "A" TO SIZE-ERR2                              NC1764.2 83
   002212      1  221500             MOVE   "B" TO SIZE-ERR3                              NC1764.2 84
   002213         221600     END-ADD                                                      NC1764.2
   002214         221700     MOVE   "C" TO SIZE-ERR4.                                     NC1764.2 85
   002215         221800     GO TO   ADD-TEST-F1-56-1.                                    NC1764.2 2220
   002216         221900 ADD-DELETE-F1-56.                                                NC1764.2
   002217         222000     PERFORM DE-LETE.                                             NC1764.2 405
   002218         222100     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   002219         222200     GO TO   ADD-INIT-F1-57.                                      NC1764.2 2285
   002220         222300 ADD-TEST-F1-56-1.                                                NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002221         222400     MOVE   "ADD-TEST-F1-56-1" TO PAR-NAME.                       NC1764.2 253
   002222         222500     IF      WRK-XN-00001 = "1"                                   NC1764.2 143
   002223      1  222600             PERFORM PASS                                         NC1764.2 403
   002224      1  222700             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002225         222800     ELSE                                                         NC1764.2
   002226      1  222900             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1764.2
   002227      1  223000                  TO RE-MARK                                      NC1764.2 258
   002228      1  223100             MOVE   "1"           TO CORRECT-X                    NC1764.2 277
   002229      1  223200             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   002230      1  223300             PERFORM FAIL                                         NC1764.2 404
   002231      1  223400             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002232         223500             ADD     1 TO REC-CT.                                 NC1764.2 300
   002233         223600 ADD-TEST-F1-56-2.                                                NC1764.2
   002234         223700     MOVE   "ADD-TEST-F1-56-2" TO PAR-NAME.                       NC1764.2 253
   002235         223800     IF      SIZE-ERR2 = "A"                                      NC1764.2 83
   002236      1  223900             PERFORM PASS                                         NC1764.2 403
   002237      1  224000             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002238         224100     ELSE                                                         NC1764.2
   002239      1  224200             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1764.2
   002240      1  224300                  TO RE-MARK                                      NC1764.2 258
   002241      1  224400             MOVE   "A"        TO CORRECT-X                       NC1764.2 277
   002242      1  224500             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1764.2 83 263
   002243      1  224600             PERFORM FAIL                                         NC1764.2 404
   002244      1  224700             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002245         224800     ADD     1 TO REC-CT.                                         NC1764.2 300
   002246         224900 ADD-TEST-F1-56-3.                                                NC1764.2
   002247         225000     MOVE   "ADD-TEST-F1-56-3" TO PAR-NAME.                       NC1764.2 253
   002248         225100     IF      SIZE-ERR3 = "B"                                      NC1764.2 84
   002249      1  225200             PERFORM PASS                                         NC1764.2 403
   002250      1  225300             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002251         225400     ELSE                                                         NC1764.2
   002252      1  225500             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1764.2
   002253      1  225600                  TO RE-MARK                                      NC1764.2 258
   002254      1  225700             MOVE   "B"        TO CORRECT-X                       NC1764.2 277
   002255      1  225800             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1764.2 84 263
   002256      1  225900             PERFORM FAIL                                         NC1764.2 404
   002257      1  226000             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002258         226100     ADD     1 TO REC-CT.                                         NC1764.2 300
   002259         226200 ADD-TEST-F1-56-4.                                                NC1764.2
   002260         226300     MOVE   "ADD-TEST-F1-56-4" TO PAR-NAME.                       NC1764.2 253
   002261         226400     IF      SIZE-ERR4 = "C"                                      NC1764.2 85
   002262      1  226500             PERFORM PASS                                         NC1764.2 403
   002263      1  226600             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002264         226700     ELSE                                                         NC1764.2
   002265      1  226800             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1764.2
   002266      1  226900                  TO RE-MARK                                      NC1764.2 258
   002267      1  227000             MOVE   "C"        TO CORRECT-X                       NC1764.2 277
   002268      1  227100             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1764.2 85 263
   002269      1  227200             PERFORM FAIL                                         NC1764.2 404
   002270      1  227300             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002271         227400     ADD     1 TO REC-CT.                                         NC1764.2 300
   002272         227500 ADD-TEST-F1-56-5.                                                NC1764.2
   002273         227600     MOVE   "ADD-TEST-F1-56-5" TO PAR-NAME.                       NC1764.2 253
   002274         227700     IF      WRK-DS-06V06 = 666999.666333                         NC1764.2 106
   002275      1  227800             PERFORM PASS                                         NC1764.2 403
   002276      1  227900             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002277         228000     ELSE                                                         NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002278      1  228100             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1764.2
   002279      1  228200                  TO RE-MARK                                      NC1764.2 258
   002280      1  228300             MOVE    666999.666333 TO CORRECT-N                   NC1764.2 279
   002281      1  228400             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1764.2 106 265
   002282      1  228500             PERFORM FAIL                                         NC1764.2 404
   002283      1  228600             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002284         228700*                                                                 NC1764.2
   002285         228800 ADD-INIT-F1-57.                                                  NC1764.2
   002286         228900*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1764.2
   002287         229000     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1764.2 309
   002288         229100     MOVE   "ADD-TEST-F1-57"  TO PAR-NAME.                        NC1764.2 253
   002289         229200     MOVE   "0"   TO WRK-XN-00001.                                NC1764.2 143
   002290         229300     MOVE   "0"   TO SIZE-ERR2.                                   NC1764.2 83
   002291         229400     MOVE   "0"   TO SIZE-ERR3.                                   NC1764.2 84
   002292         229500     MOVE   "0"   TO SIZE-ERR4.                                   NC1764.2 85
   002293         229600     MOVE   -11   TO WRK-DS-02V00.                                NC1764.2 112
   002294         229700     MOVE    1    TO REC-CT.                                      NC1764.2 300
   002295         229800 ADD-TEST-F1-57-0.                                                NC1764.2
   002296         229900     ADD    -99 TO WRK-DS-02V00                                   NC1764.2 112
   002297         230000          ON SIZE ERROR                                           NC1764.2
   002298      1  230100             MOVE   SPACE TO WRK-XN-00001                         NC1764.2 IMP 143
   002299         230200      NOT ON SIZE ERROR                                           NC1764.2
   002300      1  230300             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   002301         230400     END-ADD                                                      NC1764.2
   002302         230500     MOVE   "C" TO SIZE-ERR4.                                     NC1764.2 85
   002303         230600     GO TO   ADD-TEST-F1-57-1.                                    NC1764.2 2308
   002304         230700 ADD-DELETE-F1-57.                                                NC1764.2
   002305         230800     PERFORM DE-LETE.                                             NC1764.2 405
   002306         230900     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   002307         231000     GO TO   ADD-INIT-F1-58.                                      NC1764.2 2347
   002308         231100 ADD-TEST-F1-57-1.                                                NC1764.2
   002309         231200     MOVE   "ADD-TEST-F1-57-1" TO PAR-NAME.                       NC1764.2 253
   002310         231300     IF      WRK-XN-00001 = SPACE                                 NC1764.2 143 IMP
   002311      1  231400             PERFORM PASS                                         NC1764.2 403
   002312      1  231500             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002313         231600     ELSE                                                         NC1764.2
   002314      1  231700             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1764.2
   002315      1  231800                  TO RE-MARK                                      NC1764.2 258
   002316      1  231900             MOVE    SPACE        TO CORRECT-X                    NC1764.2 IMP 277
   002317      1  232000             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   002318      1  232100             PERFORM FAIL                                         NC1764.2 404
   002319      1  232200             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002320         232300     ADD     1 TO REC-CT.                                         NC1764.2 300
   002321         232400 ADD-TEST-F1-57-2.                                                NC1764.2
   002322         232500     MOVE   "ADD-TEST-F1-57-2" TO PAR-NAME.                       NC1764.2 253
   002323         232600     IF      SIZE-ERR4 = "C"                                      NC1764.2 85
   002324      1  232700             PERFORM PASS                                         NC1764.2 403
   002325      1  232800             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002326         232900     ELSE                                                         NC1764.2
   002327      1  233000             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1764.2
   002328      1  233100                  TO RE-MARK                                      NC1764.2 258
   002329      1  233200             MOVE   "C"        TO CORRECT-X                       NC1764.2 277
   002330      1  233300             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1764.2 85 263
   002331      1  233400             PERFORM FAIL                                         NC1764.2 404
   002332      1  233500             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002333         233600     ADD     1 TO REC-CT.                                         NC1764.2 300
   002334         233700 ADD-TEST-F1-57-3.                                                NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002335         233800     MOVE   "ADD-TEST-F1-57-3" TO PAR-NAME.                       NC1764.2 253
   002336         233900     IF      WRK-DS-02V00 = -11                                   NC1764.2 112
   002337      1  234000             PERFORM PASS                                         NC1764.2 403
   002338      1  234100             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002339         234200     ELSE                                                         NC1764.2
   002340      1  234300             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1764.2
   002341      1  234400                  TO RE-MARK                                      NC1764.2 258
   002342      1  234500             MOVE    -11          TO CORRECT-N                    NC1764.2 279
   002343      1  234600             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1764.2 112 265
   002344      1  234700             PERFORM FAIL                                         NC1764.2 404
   002345      1  234800             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002346         234900*                                                                 NC1764.2
   002347         235000 ADD-INIT-F1-58.                                                  NC1764.2
   002348         235100*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1764.2
   002349         235200     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1764.2 309
   002350         235300     MOVE   "ADD-TEST-F1-58"  TO PAR-NAME.                        NC1764.2 253
   002351         235400     MOVE    SPACE TO WRK-XN-00001.                               NC1764.2 IMP 143
   002352         235500     MOVE    SPACE TO SIZE-ERR2.                                  NC1764.2 IMP 83
   002353         235600     MOVE    SPACE TO SIZE-ERR3.                                  NC1764.2 IMP 84
   002354         235700     MOVE    SPACE TO SIZE-ERR4.                                  NC1764.2 IMP 85
   002355         235800     MOVE    ZERO  TO WRK-DS-06V06.                               NC1764.2 IMP 106
   002356         235900     MOVE    1     TO REC-CT.                                     NC1764.2 300
   002357         236000 ADD-TEST-F1-58-0.                                                NC1764.2
   002358         236100     ADD     A12THREES-DS-06V06                                   NC1764.2 104
   002359         236200             333333                                               NC1764.2
   002360         236300             A06THREES-DS-03V03                                   NC1764.2 102
   002361         236400          TO WRK-DS-06V06 ROUNDED                                 NC1764.2 106
   002362         236500             ON SIZE ERROR                                        NC1764.2
   002363      1  236600             MOVE   "X" TO WRK-XN-00001                           NC1764.2 143
   002364         236700         NOT ON SIZE ERROR                                        NC1764.2
   002365      1  236800             MOVE   "1" TO WRK-XN-00001                           NC1764.2 143
   002366         236900     END-ADD                                                      NC1764.2
   002367         237000     MOVE   "C" TO SIZE-ERR4.                                     NC1764.2 85
   002368         237100     GO TO   ADD-TEST-F1-58-1.                                    NC1764.2 2373
   002369         237200 ADD-DELETE-F1-58.                                                NC1764.2
   002370         237300     PERFORM DE-LETE.                                             NC1764.2 405
   002371         237400     PERFORM PRINT-DETAIL.                                        NC1764.2 407
   002372         237500     GO TO   CCVS-EXIT.                                           NC1764.2 2412
   002373         237600 ADD-TEST-F1-58-1.                                                NC1764.2
   002374         237700     MOVE   "ADD-TEST-F1-58-1" TO PAR-NAME.                       NC1764.2 253
   002375         237800     IF      WRK-XN-00001 = "1"                                   NC1764.2 143
   002376      1  237900             PERFORM PASS                                         NC1764.2 403
   002377      1  238000             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002378         238100     ELSE                                                         NC1764.2
   002379      1  238200             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1764.2
   002380      1  238300                  TO RE-MARK                                      NC1764.2 258
   002381      1  238400             MOVE   "1"           TO CORRECT-X                    NC1764.2 277
   002382      1  238500             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1764.2 143 263
   002383      1  238600             PERFORM FAIL                                         NC1764.2 404
   002384      1  238700             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002385         238800     ADD     1 TO REC-CT.                                         NC1764.2 300
   002386         238900 ADD-TEST-F1-58-2.                                                NC1764.2
   002387         239000     MOVE   "ADD-TEST-F1-58-2" TO PAR-NAME.                       NC1764.2 253
   002388         239100     IF      SIZE-ERR4 = "C"                                      NC1764.2 85
   002389      1  239200             PERFORM PASS                                         NC1764.2 403
   002390      1  239300             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002391         239400     ELSE                                                         NC1764.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002392      1  239500             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1764.2
   002393      1  239600                  TO RE-MARK                                      NC1764.2 258
   002394      1  239700             MOVE   "C"        TO CORRECT-X                       NC1764.2 277
   002395      1  239800             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1764.2 85 263
   002396      1  239900             PERFORM FAIL                                         NC1764.2 404
   002397      1  240000             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002398         240100     ADD     1 TO REC-CT.                                         NC1764.2 300
   002399         240200 ADD-TEST-F1-58-3.                                                NC1764.2
   002400         240300     MOVE   "ADD-TEST-F1-58-3" TO PAR-NAME.                       NC1764.2 253
   002401         240400     IF      WRK-DS-06V06 = 666999.666333                         NC1764.2 106
   002402      1  240500             PERFORM PASS                                         NC1764.2 403
   002403      1  240600             PERFORM PRINT-DETAIL                                 NC1764.2 407
   002404         240700     ELSE                                                         NC1764.2
   002405      1  240800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1764.2
   002406      1  240900                  TO RE-MARK                                      NC1764.2 258
   002407      1  241000             MOVE    666999.666333 TO CORRECT-N                   NC1764.2 279
   002408      1  241100             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1764.2 106 265
   002409      1  241200             PERFORM FAIL                                         NC1764.2 404
   002410      1  241300             PERFORM PRINT-DETAIL.                                NC1764.2 407
   002411         241400*                                                                 NC1764.2
   002412         241500 CCVS-EXIT SECTION.                                               NC1764.2
   002413         241600 CCVS-999999.                                                     NC1764.2
   002414         241700     GO TO CLOSE-FILES.                                           NC1764.2 396
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    46
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      144   ADD-12
      145   ADD-13
      146   ADD-14
      309   ANSI-REFERENCE . . . . . . . .  486 493 502 M511 M925 M946 M969 M989 M1014 M1394 M1450 M1527 M1608 M1685 M1767
                                            M1846 M1929 M2017 M2108 M2196 M2287 M2349
      136   AZERO-DS-05V05
      126   A01ONE-DS-P0801
       97   A02ONES-DS-02V00 . . . . . . .  630
      120   A03ONES-DS-02V01
      109   A05ONES-DS-00V05
       95   A05ONES-DS-05V00 . . . . . . .  614 632
      122   A06ONES-DS-03V03
      102   A06THREES-DS-03V03 . . . . . .  701 735 951 994 2028 2207 2360
      124   A08TWOS-DS-02V06
       93   A10ONES-DS-10V00 . . . . . . .  614 631
      113   A12ONES-DS-12V00
      174   A12SEVENS-CU-18V00 . . . . . .  860 875
      166   A12THREES-CU-18V00
      104   A12THREES-DS-06V06 . . . . . .  702 733 949 992 2026 2205 2358
      164   A14TWOS-CS-18V00 . . . . . . .  845
      168   A16FOURS-CS-18V00
       91   A17TWOS-DS-17V00 . . . . . . .  1536 1694 1855
      162   A18EIGHTS-CS-18V00
      170   A18FIVES-CS-18V00. . . . . . .  846 876
      129   A18ONES-CS-18V00 . . . . . . .  784
       88   A18ONES-DS-18V00 . . . . . . .  598 767 768 783
      172   A18SIXES-CS-18V00. . . . . . .  861
      177   A18THREES-CS-18V00
       86   A18TWOS-DS-18V00 . . . . . . .  597
      132   A99-CS-02V00 . . . . . . . . .  800 815 816
      118   A99-DS-02V00
      288   CCVS-C-1 . . . . . . . . . . .  425 471
      293   CCVS-C-2 . . . . . . . . . . .  426 472
      343   CCVS-E-1 . . . . . . . . . . .  431
      348   CCVS-E-2 . . . . . . . . . . .  440 447 454 459
      351   CCVS-E-2-2 . . . . . . . . . .  M439
      356   CCVS-E-3 . . . . . . . . . . .  460
      365   CCVS-E-4 . . . . . . . . . . .  439
      366   CCVS-E-4-1 . . . . . . . . . .  M437
      368   CCVS-E-4-2 . . . . . . . . . .  M438
      310   CCVS-H-1 . . . . . . . . . . .  420 467
      315   CCVS-H-2A. . . . . . . . . . .  421 468
      324   CCVS-H-2B. . . . . . . . . . .  422 469
      336   CCVS-H-3 . . . . . . . . . . .  423 470
      386   CCVS-PGM-ID. . . . . . . . . .  392 392
      270   CM-18V0
      264   COMPUTED-A . . . . . . . . . .  265 267 268 269 270 498 501 M899
      265   COMPUTED-N . . . . . . . . . .  M522 M538 M554 M571 M586 M658 M690 M725 M758 M808 M838 M906 M1414 M1420 M1426
                                            M1432 M1438 M1444 M1473 M1480 M1487 M1494 M1501 M1508 M1555 M1562 M1569 M1576
                                            M1583 M1590 M1631 M1638 M1645 M1652 M1659 M1666 M1713 M1720 M1727 M1734 M1741
                                            M1748 M1792 M1799 M1806 M1813 M1820 M1827 M1876 M1883 M1890 M1897 M1904 M1911
                                            M2011 M2102 M2190 M2281 M2343 M2408
      263   COMPUTED-X . . . . . . . . . .  M415 483 M1520 M1601 M1678 M1760 M1839 M1923 M1959 M1972 M1985 M1998 M2050 M2063
                                            M2076 M2089 M2138 M2151 M2164 M2177 M2229 M2242 M2255 M2268 M2317 M2330 M2382
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    47
0 Defined   Cross-reference of data names   References

0                                           M2395
      267   COMPUTED-0V18
      269   COMPUTED-14V4
      271   COMPUTED-18V0. . . . . . . . .  M606 M622 M640 M776 M792 M850 M866 M880 M1062 M1123 M1136 M1149 M1162 M1175 M1188
                                            M1201 M1214 M1227 M1240 M1253 M1266 M1279 M1292 M1305 M1318 M1331 M1344 M1357
                                            M1370 M1383
      268   COMPUTED-4V14
      287   COR-ANSI-REFERENCE . . . . . .  M493 M495
      278   CORRECT-A. . . . . . . . . . .  279 280 281 282 283 499 501 M900
      279   CORRECT-N. . . . . . . . . . .  M523 M539 M587 M659 M691 M726 M759 M809 M839 M907 M1415 M1421 M1427 M1433 M1439
                                            M1445 M1474 M1481 M1488 M1495 M1502 M1509 M1556 M1563 M1570 M1577 M1584 M1591
                                            M1632 M1639 M1646 M1653 M1660 M1667 M1714 M1721 M1728 M1735 M1742 M1749 M1793
                                            M1800 M1807 M1814 M1821 M1828 M1877 M1884 M1891 M1898 M1905 M1912 M2010 M2101
                                            M2189 M2280 M2342 M2407
      277   CORRECT-X. . . . . . . . . . .  M416 485 M1519 M1600 M1677 M1759 M1838 M1922 M1958 M1971 M1984 M1997 M2049 M2062
                                            M2075 M2088 M2137 M2150 M2163 M2176 M2228 M2241 M2254 M2267 M2316 M2329 M2381
                                            M2394
      280   CORRECT-0V18
      282   CORRECT-14V4
      284   CORRECT-18V0 . . . . . . . . .  M607 M623 M641 M777 M793 M851 M865 M881 M1061 M1122 M1135 M1148 M1161 M1174 M1187
                                            M1200 M1213 M1226 M1239 M1252 M1265 M1278 M1291 M1304 M1317 M1330 M1343 M1356
                                            M1369 M1382
      281   CORRECT-4V14
      283   CR-18V0
      246   DECMAL-FIELD
      301   DELETE-COUNTER . . . . . . . .  M405 434 450 452 M1030
       40   DNAME1 . . . . . . . . . . . .  M1016 1034 1077
       49   DNAME10. . . . . . . . . . . .  M1017 1043 1086
       50   DNAME11. . . . . . . . . . . .  M1018 1044 1087
       51   DNAME12. . . . . . . . . . . .  M1018 1045 1088
       52   DNAME13. . . . . . . . . . . .  M1018 1046 1089
       53   DNAME14. . . . . . . . . . . .  M1018 1047 1090
       54   DNAME15. . . . . . . . . . . .  M1018 1048 1091
       55   DNAME16. . . . . . . . . . . .  M1019 1049 1092
       56   DNAME17. . . . . . . . . . . .  M1019 1050 1093
       57   DNAME18. . . . . . . . . . . .  M1019 1051 1094
       58   DNAME19. . . . . . . . . . . .  M1019 1052 1095
       41   DNAME2 . . . . . . . . . . . .  M1016 1035 1078
       59   DNAME20. . . . . . . . . . . .  M1019 1053 1096
       60   DNAME21. . . . . . . . . . . .  M1020 1054 1097
       61   DNAME22. . . . . . . . . . . .  M1021 M1055 1058 1062 M1071 M1098 1119 1123
       62   DNAME23. . . . . . . . . . . .  M1071 M1099 1132 1136
       63   DNAME24. . . . . . . . . . . .  M1071 M1100 1145 1149
       64   DNAME25. . . . . . . . . . . .  M1071 M1101 1158 1162
       65   DNAME26. . . . . . . . . . . .  M1071 M1102 1171 1175
       66   DNAME27. . . . . . . . . . . .  M1072 M1103 1184 1188
       67   DNAME28. . . . . . . . . . . .  M1072 M1104 1197 1201
       68   DNAME29. . . . . . . . . . . .  M1072 M1105 1210 1214
       42   DNAME3 . . . . . . . . . . . .  M1016 1036 1079
       69   DNAME30. . . . . . . . . . . .  M1072 M1106 1223 1227
       70   DNAME31. . . . . . . . . . . .  M1072 M1107 1236 1240
       71   DNAME32. . . . . . . . . . . .  M1073 M1108 1249 1253
       72   DNAME33. . . . . . . . . . . .  M1073 M1109 1262 1266
       73   DNAME34. . . . . . . . . . . .  M1073 M1110 1275 1279
       74   DNAME35. . . . . . . . . . . .  M1073 M1111 1288 1292
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    48
0 Defined   Cross-reference of data names   References

0      75   DNAME36. . . . . . . . . . . .  M1073 M1112 1301 1305
       76   DNAME37. . . . . . . . . . . .  M1074 M1113 1314 1318
       77   DNAME38. . . . . . . . . . . .  M1074 M1114 1327 1331
       78   DNAME39. . . . . . . . . . . .  M1074 M1115 1340 1344
       43   DNAME4 . . . . . . . . . . . .  M1016 1037 1080
       79   DNAME40. . . . . . . . . . . .  M1074 M1116 1353 1357
       80   DNAME41. . . . . . . . . . . .  M1074 M1117 1366 1370
       81   DNAME42. . . . . . . . . . . .  M1075 M1118 1379 1383
       44   DNAME5 . . . . . . . . . . . .  M1016 1038 1081
       45   DNAME6 . . . . . . . . . . . .  M1017 1039 1082
       46   DNAME7 . . . . . . . . . . . .  M1017 1040 1083
       47   DNAME8 . . . . . . . . . . . .  M1017 1041 1084
       48   DNAME9 . . . . . . . . . . . .  M1017 1042 1085
      256   DOTVALUE . . . . . . . . . . .  M410
      307   DUMMY-HOLD . . . . . . . . . .  M464 474
       37   DUMMY-RECORD . . . . . . . . .  M420 M421 M422 M423 M425 M426 M427 M429 M431 M440 M447 M454 M459 M460 464 M465
                                            466 M467 M468 M469 M470 M471 M472 M473 M474 478 M479 M488 M503
      354   ENDER-DESC . . . . . . . . . .  M442 M453 M458
      302   ERROR-COUNTER. . . . . . . . .  M404 433 443 446
      306   ERROR-HOLD . . . . . . . . . .  M433 M434 M434 M435 438
      352   ERROR-TOTAL. . . . . . . . . .  M444 M446 M451 M452 M456 M457
      237   EVEN-NAME1
      242   EVEN-NAME2
      249   FEATURE. . . . . . . . . . . .  M510 M593 M595 M647 M665 M697 M765 M919 M1015 M1029 M1396
      380   HYPHEN-LINE. . . . . . . . . .  427 429 473
      346   ID-AGAIN . . . . . . . . . . .  M392
      379   INF-ANSI-REFERENCE . . . . . .  M486 M489 M502 M504
      374   INFO-TEXT. . . . . . . . . . .  M487
      303   INSPECT-COUNTER. . . . . . . .  M402 433 455 457
      234   MINUS-NAMES
      235   MINUS-NAME1
      236   MINUS-NAME2
      240   MINUS-NAME3
      241   MINUS-NAME4
      199   N-10 . . . . . . . . . . . . .  M529 530 538 M544
      201   N-11 . . . . . . . . . . . . .  546
      202   N-12 . . . . . . . . . . . . .  M546 554
      203   N-13 . . . . . . . . . . . . .  M561 571 578 586
      205   N-14
      206   N-15
      207   N-16
      209   N-17
      211   N-18
      213   N-19
      214   N-20
      216   N-21
      217   N-22
      219   N-23
      220   N-25
      221   N-26
      222   N-27
      224   N-28
      191   N-3
      192   N-4
      225   N-40
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    49
0 Defined   Cross-reference of data names   References

0     227   N-41
      229   N-42
      231   N-43
      232   N-44
      233   N-45
      194   N-5. . . . . . . . . . . . . .  513
      196   N-7. . . . . . . . . . . . . .  198 M513 514 522
      138   NDATA-DS-09V09
      251   P-OR-F . . . . . . . . . . . .  M402 M403 M404 M405 412 M415
      253   PAR-NAME . . . . . . . . . . .  M417 M526 M542 M558 M575 M590 M610 M626 M644 M662 M678 M694 M713 M729 M747 M762
                                            M780 M796 M812 M826 M842 M857 M872 M887 M920 M941 M964 M984 M1009 M1028 M1068
                                            M1129 M1142 M1155 M1168 M1181 M1194 M1207 M1220 M1233 M1246 M1259 M1272 M1285
                                            M1298 M1311 M1324 M1337 M1350 M1363 M1376 M1389 M1395 M1451 M1470 M1477 M1484
                                            M1491 M1498 M1505 M1512 M1528 M1552 M1559 M1566 M1573 M1580 M1587 M1594 M1609
                                            M1628 M1635 M1642 M1649 M1656 M1663 M1670 M1686 M1710 M1717 M1724 M1731 M1738
                                            M1745 M1752 M1768 M1789 M1796 M1803 M1810 M1817 M1824 M1831 M1847 M1873 M1880
                                            M1887 M1894 M1901 M1908 M1915 M1930 M1951 M1964 M1977 M1990 M2003 M2018 M2042
                                            M2055 M2068 M2081 M2094 M2109 M2130 M2143 M2156 M2169 M2182 M2197 M2221 M2234
                                            M2247 M2260 M2273 M2288 M2309 M2322 M2335 M2350 M2374 M2387 M2400
      255   PARDOT-X . . . . . . . . . . .  M409
      304   PASS-COUNTER . . . . . . . . .  M403 435 437
      238   PLUS-NAME1
      239   PLUS-NAME2
      243   PLUS-NAME3
      244   PLUS-NAME4
       35   PRINT-FILE . . . . . . . . . .  31 391 397
       36   PRINT-REC. . . . . . . . . . .  M411 M492 M494
      258   RE-MARK. . . . . . . . . . . .  M406 M418 M555 M572 M675 M689 M710 M724 M744 M823 M837 M898 M931 M955 M978 M998
                                            M1518 M1599 M1676 M1758 M1837 M1921 M1957 M1970 M1983 M1996 M2009 M2048 M2061
                                            M2074 M2087 M2100 M2136 M2149 M2162 M2175 M2188 M2227 M2240 M2253 M2266 M2279
                                            M2315 M2328 M2341 M2380 M2393 M2406
      300   REC-CT . . . . . . . . . . . .  408 410 417 M1401 M1416 M1422 M1428 M1434 M1440 M1457 M1475 M1482 M1489 M1496
                                            M1503 M1510 M1534 M1557 M1564 M1571 M1578 M1585 M1592 M1615 M1633 M1640 M1647
                                            M1654 M1661 M1668 M1692 M1715 M1722 M1729 M1736 M1743 M1750 M1774 M1794 M1801
                                            M1808 M1815 M1822 M1829 M1853 M1878 M1885 M1892 M1899 M1906 M1913 M1936 M1962
                                            M1975 M1988 M2001 M2024 M2053 M2066 M2079 M2092 M2115 M2141 M2154 M2167 M2180
                                            M2203 M2232 M2245 M2258 M2271 M2294 M2320 M2333 M2356 M2385 M2398
      299   REC-SKL-SUB
      308   RECORD-COUNT . . . . . . . . .  M462 463 M475
       82   SIZE-ERR . . . . . . . . . . .  M891 897 913 M915
       83   SIZE-ERR2. . . . . . . . . . .  M1932 M1941 1965 1972 M2020 M2032 2056 2063 M2111 M2120 2144 2151 M2199 M2211
                                            2235 2242 M2290 M2352
       84   SIZE-ERR3. . . . . . . . . . .  M1933 M1942 1978 1985 M2021 M2033 2069 2076 M2112 M2121 2157 2164 M2200 M2212
                                            2248 2255 M2291 M2353
       85   SIZE-ERR4. . . . . . . . . . .  M1934 M1944 1991 1998 M2022 M2035 2082 2089 M2113 M2123 2170 2177 M2201 M2214
                                            2261 2268 M2292 M2302 2323 2330 M2354 M2367 2388 2395
      181   SUBTR-1
      189   SUBTR-10
      190   SUBTR-11
      182   SUBTR-2
      183   SUBTR-3
      184   SUBTR-4
      185   SUBTR-5
      186   SUBTR-6
      187   SUBTR-7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    50
0 Defined   Cross-reference of data names   References

0     188   SUBTR-8
      180   SUBTRACT-DATA
      259   TEST-COMPUTED. . . . . . . . .  492
      274   TEST-CORRECT . . . . . . . . .  494
      327   TEST-ID. . . . . . . . . . . .  M392
      247   TEST-RESULTS . . . . . . . . .  M393 411
      305   TOTAL-ERROR
      230   TRUNC-DATA
      245   WHOLE-FIELD
      131   WRK-CS-02V02 . . . . . . . . .  M799 M800 801 808 M815 M816 829 838
      179   WRK-CS-03V00 . . . . . . . . .  M890 903 906 M914
      128   WRK-CS-18V00 . . . . . . . . .  M767 M768 769 776 M845 M846 847 850 M860 M861 862 866
      147   WRK-CU-18V00
      112   WRK-DS-02V00 . . . . . . . . .  M666 M668 681 690 M926 M928 M970 M972 M1935 M1938 2004 2011 M2114 M2117 2183
                                            2190 M2293 M2296 2336 2343
      134   WRK-DS-0201P
      115   WRK-DS-03V10 . . . . . . . . .  116
      111   WRK-DS-05V00 . . . . . . . . .  M649 M650 651 658 M699 M703 716 725
      135   WRK-DS-06V00
      106   WRK-DS-06V06 . . . . . . . . .  107 M732 M736 750 758 M947 M952 M990 M995 M2023 M2029 2095 2102 M2202 M2208 2274
                                            2281 M2355 M2361 2401 2408
       99   WRK-DS-09V09 . . . . . . . . .  100
       90   WRK-DS-10V00 . . . . . . . . .  M613 M614 615 622 M629 M632 633 640
      107   WRK-DS-12V00-S
      116   WRK-DS-13V00-S
      100   WRK-DS-18V00 . . . . . . . . .  M597 M598 599 606 M783 M784 785 792
      148   WRK-DU-1V0-1
      149   WRK-DU-1V1-1 . . . . . . . . .  M1399 1403 M1454 1459 M1531 M1612 1617 M1689 M1771 1776 M1850
      150   WRK-DU-1V1-2 . . . . . . . . .  M1400 1403 M1455 1459 M1532 1537 M1613 1617 M1690 1695 M1772 1776 M1851 1856
      154   WRK-DU-1V17-1
      151   WRK-DU-1V3-1
      152   WRK-DU-1V3-2
      153   WRK-DU-1V5-1
      176   WRK-DU-18V00 . . . . . . . . .  M875 M876 877 880
      155   WRK-DU-2P6-1
      156   WRK-DU-2V0-1 . . . . . . . . .  M1397 M1404 1418 1420 M1452 M1460 1478 1480 M1529 M1539 1560 1562 M1610 M1618
                                            1636 1638 M1687 M1697 1718 1720 M1769 M1777 1797 1799 M1848 M1858 1881 1883
      157   WRK-DU-2V0-2 . . . . . . . . .  M1398 M1404 1430 1432 M1453 M1460 1492 1494 M1530 M1541 1574 1576 M1611 M1618
                                            1650 1652 M1688 M1699 1732 1734 M1770 M1777 1811 1813 M1849 M1860 1895 1897
      158   WRK-DU-2V0-3 . . . . . . . . .  M1398 M1405 1442 1444 M1453 M1461 1506 1508 M1530 M1543 1588 1590 M1611 M1619
                                            1664 1666 M1688 M1701 1746 1748 M1770 M1778 1825 1827 M1849 M1862 1909 1911
      159   WRK-DU-2V1-1 . . . . . . . . .  M1397 M1403 1412 1414 M1452 M1459 1471 1473 M1529 M1538 1553 1555 M1610 M1617
                                            1629 1631 M1687 M1696 1711 1713 M1769 M1776 1790 1792 M1848 M1857 1874 1876
      160   WRK-DU-2V1-2 . . . . . . . . .  M1397 M1404 1424 1426 M1452 M1460 1485 1487 M1529 M1540 1567 1569 M1610 M1618
                                            1643 1645 M1687 M1698 1725 1727 M1769 M1777 1804 1806 M1848 M1859 1888 1890
      161   WRK-DU-2V1-3 . . . . . . . . .  M1398 M1405 1436 1438 M1453 M1461 1499 1501 M1530 M1542 1581 1583 M1611 M1619
                                            1657 1659 M1688 M1700 1739 1741 M1770 M1778 1818 1820 M1849 M1861 1902 1904
      143   WRK-XN-00001 . . . . . . . . .  M1456 M1463 1513 1520 M1533 M1545 1595 1601 M1614 M1621 1671 1678 M1691 M1703
                                            1753 1760 M1773 M1780 M1782 1832 1839 M1852 M1864 M1866 1916 1923 M1931 M1940
                                            1952 1959 M2019 M2031 2043 2050 M2110 M2119 2131 2138 M2198 M2210 2222 2229 M2289
                                            M2298 M2300 2310 2317 M2351 M2363 M2365 2375 2382
      142   WRK-XN-00018
      198   X-8
      140   XDATA-XN-00018
      376   XXCOMPUTED . . . . . . . . . .  M501
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    51
0 Defined   Cross-reference of data names   References

0     378   XXCORRECT. . . . . . . . . . .  M501
      371   XXINFO . . . . . . . . . . . .  488 503
       39   42-DATANAMES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    52
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

      912   ADD-A-F1-19. . . . . . . . . .  P896
      916   ADD-B-F1-19. . . . . . . . . .  E896 G913
      518   ADD-DELETE-F1-1
      706   ADD-DELETE-F1-10-1
      720   ADD-DELETE-F1-10-2
      740   ADD-DELETE-F1-11-1
      754   ADD-DELETE-F1-11-2
      772   ADD-DELETE-F1-12
      788   ADD-DELETE-F1-13
      804   ADD-DELETE-F1-14
      819   ADD-DELETE-F1-15-1
      833   ADD-DELETE-F1-15-2
      854   ADD-DELETE-F1-16
      869   ADD-DELETE-F1-17
      884   ADD-DELETE-F1-18
      909   ADD-DELETE-F1-19
      534   ADD-DELETE-F1-2
      935   ADD-DELETE-F1-20
      958   ADD-DELETE-F1-21
      981   ADD-DELETE-F1-22
     1003   ADD-DELETE-F1-23
     1065   ADD-DELETE-F1-24
     1126   ADD-DELETE-F1-25
     1139   ADD-DELETE-F1-26
     1152   ADD-DELETE-F1-27
     1165   ADD-DELETE-F1-28
     1178   ADD-DELETE-F1-29
      550   ADD-DELETE-F1-3
     1191   ADD-DELETE-F1-30
     1204   ADD-DELETE-F1-31
     1217   ADD-DELETE-F1-32
     1230   ADD-DELETE-F1-33
     1243   ADD-DELETE-F1-34
     1256   ADD-DELETE-F1-35
     1269   ADD-DELETE-F1-36
     1282   ADD-DELETE-F1-37
     1295   ADD-DELETE-F1-38
     1308   ADD-DELETE-F1-39
      567   ADD-DELETE-F1-4-1
      582   ADD-DELETE-F1-4-2
     1321   ADD-DELETE-F1-40
     1334   ADD-DELETE-F1-41
     1347   ADD-DELETE-F1-42
     1360   ADD-DELETE-F1-43
     1373   ADD-DELETE-F1-44
     1386   ADD-DELETE-F1-45
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    53
0 Defined   Cross-reference of procedures   References

0    1407   ADD-DELETE-F1-46
     1465   ADD-DELETE-F1-47
     1547   ADD-DELETE-F1-48
     1623   ADD-DELETE-F1-49
      602   ADD-DELETE-F1-5
     1705   ADD-DELETE-F1-50
     1784   ADD-DELETE-F1-51
     1868   ADD-DELETE-F1-52
     1946   ADD-DELETE-F1-53
     2037   ADD-DELETE-F1-54
     2125   ADD-DELETE-F1-55
     2216   ADD-DELETE-F1-56
     2304   ADD-DELETE-F1-57
     2369   ADD-DELETE-F1-58
      618   ADD-DELETE-F1-6
      636   ADD-DELETE-F1-7
      654   ADD-DELETE-F1-8
      671   ADD-DELETE-F1-9-1
      685   ADD-DELETE-F1-9-2
      521   ADD-FAIL-F1-1. . . . . . . . .  G517
      709   ADD-FAIL-F1-10-1 . . . . . . .  G705
      723   ADD-FAIL-F1-10-2 . . . . . . .  G719
      743   ADD-FAIL-F1-11-1 . . . . . . .  G737
      757   ADD-FAIL-F1-11-2 . . . . . . .  G753
      775   ADD-FAIL-F1-12 . . . . . . . .  G771
      791   ADD-FAIL-F1-13 . . . . . . . .  G787
      807   ADD-FAIL-F1-14 . . . . . . . .  G803
      822   ADD-FAIL-F1-15-1 . . . . . . .  G818
      836   ADD-FAIL-F1-15-2 . . . . . . .  G832
      537   ADD-FAIL-F1-2. . . . . . . . .  G533
      553   ADD-FAIL-F1-3. . . . . . . . .  G549
      570   ADD-FAIL-F1-4-1. . . . . . . .  G566
      585   ADD-FAIL-F1-4-2. . . . . . . .  G581
      605   ADD-FAIL-F1-5. . . . . . . . .  G601
      621   ADD-FAIL-F1-6. . . . . . . . .  G617
      639   ADD-FAIL-F1-7. . . . . . . . .  G635
      657   ADD-FAIL-F1-8. . . . . . . . .  G653
      674   ADD-FAIL-F1-9-1. . . . . . . .  G670
      688   ADD-FAIL-F1-9-2. . . . . . . .  G684
     1026   ADD-INIT-DELETE
      509   ADD-INIT-F1-1
      696   ADD-INIT-F1-10-1
      764   ADD-INIT-F1-12
      923   ADD-INIT-F1-20
      944   ADD-INIT-F1-21
      967   ADD-INIT-F1-22
      987   ADD-INIT-F1-23
     1012   ADD-INIT-F1-24
     1070   ADD-INIT-F1-25
     1392   ADD-INIT-F1-46 . . . . . . . .  G1032
     1447   ADD-INIT-F1-47 . . . . . . . .  G1410
     1524   ADD-INIT-F1-48 . . . . . . . .  G1468
     1605   ADD-INIT-F1-49 . . . . . . . .  G1550
      592   ADD-INIT-F1-5
     1682   ADD-INIT-F1-50 . . . . . . . .  G1626
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    54
0 Defined   Cross-reference of procedures   References

0    1764   ADD-INIT-F1-51 . . . . . . . .  G1708
     1843   ADD-INIT-F1-52 . . . . . . . .  G1787
     1927   ADD-INIT-F1-53 . . . . . . . .  G1871
     2015   ADD-INIT-F1-54 . . . . . . . .  G1949
     2106   ADD-INIT-F1-55 . . . . . . . .  G2040
     2194   ADD-INIT-F1-56 . . . . . . . .  G2128
     2285   ADD-INIT-F1-57 . . . . . . . .  G2219
     2347   ADD-INIT-F1-58 . . . . . . . .  G2307
      646   ADD-INIT-F1-8
      664   ADD-INIT-F1-9-1
      938   ADD-PASS-F1-20 . . . . . . . .  G934
      961   ADD-PASS-F1-21 . . . . . . . .  G954
     1006   ADD-PASS-F1-23 . . . . . . . .  G1002
      512   ADD-TEST-F1-1
      698   ADD-TEST-F1-10-1
      715   ADD-TEST-F1-10-2
      731   ADD-TEST-F1-11-1
      749   ADD-TEST-F1-11-2
      766   ADD-TEST-F1-12
      782   ADD-TEST-F1-13
      798   ADD-TEST-F1-14
      814   ADD-TEST-F1-15-1
      828   ADD-TEST-F1-15-2
      844   ADD-TEST-F1-16
      859   ADD-TEST-F1-17
      874   ADD-TEST-F1-18
      889   ADD-TEST-F1-19
      528   ADD-TEST-F1-2
      927   ADD-TEST-F1-20
      948   ADD-TEST-F1-21-0
      971   ADD-TEST-F1-22-0
      991   ADD-TEST-F1-23-0
     1033   ADD-TEST-F1-24 . . . . . . . .  G1025
     1076   ADD-TEST-F1-25
     1131   ADD-TEST-F1-26
     1144   ADD-TEST-F1-27
     1157   ADD-TEST-F1-28
     1170   ADD-TEST-F1-29
      545   ADD-TEST-F1-3-0
     1183   ADD-TEST-F1-30
     1196   ADD-TEST-F1-31
     1209   ADD-TEST-F1-32
     1222   ADD-TEST-F1-33
     1235   ADD-TEST-F1-34
     1248   ADD-TEST-F1-35
     1261   ADD-TEST-F1-36
     1274   ADD-TEST-F1-37
     1287   ADD-TEST-F1-38
     1300   ADD-TEST-F1-39
      560   ADD-TEST-F1-4-1
      577   ADD-TEST-F1-4-2
     1313   ADD-TEST-F1-40
     1326   ADD-TEST-F1-41
     1339   ADD-TEST-F1-42
     1352   ADD-TEST-F1-43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    55
0 Defined   Cross-reference of procedures   References

0    1365   ADD-TEST-F1-44
     1378   ADD-TEST-F1-45
     1402   ADD-TEST-F1-46-0
     1411   ADD-TEST-F1-46-1 . . . . . . .  G1406
     1417   ADD-TEST-F1-46-2
     1423   ADD-TEST-F1-46-3
     1429   ADD-TEST-F1-46-4
     1435   ADD-TEST-F1-46-5
     1441   ADD-TEST-F1-46-6
     1458   ADD-TEST-F1-47-0
     1469   ADD-TEST-F1-47-1 . . . . . . .  G1464
     1476   ADD-TEST-F1-47-2
     1483   ADD-TEST-F1-47-3
     1490   ADD-TEST-F1-47-4
     1497   ADD-TEST-F1-47-5
     1504   ADD-TEST-F1-47-6
     1511   ADD-TEST-F1-47-7
     1535   ADD-TEST-F1-48-0
     1551   ADD-TEST-F1-48-1 . . . . . . .  G1546
     1558   ADD-TEST-F1-48-2
     1565   ADD-TEST-F1-48-3
     1572   ADD-TEST-F1-48-4
     1579   ADD-TEST-F1-48-5
     1586   ADD-TEST-F1-48-6
     1593   ADD-TEST-F1-48-7
     1616   ADD-TEST-F1-49-0
     1627   ADD-TEST-F1-49-1 . . . . . . .  G1622
     1634   ADD-TEST-F1-49-2
     1641   ADD-TEST-F1-49-3
     1648   ADD-TEST-F1-49-4
     1655   ADD-TEST-F1-49-5
     1662   ADD-TEST-F1-49-6
     1669   ADD-TEST-F1-49-7
      596   ADD-TEST-F1-5
     1693   ADD-TEST-F1-50-0
     1709   ADD-TEST-F1-50-1 . . . . . . .  G1704
     1716   ADD-TEST-F1-50-2
     1723   ADD-TEST-F1-50-3
     1730   ADD-TEST-F1-50-4
     1737   ADD-TEST-F1-50-5
     1744   ADD-TEST-F1-50-6
     1751   ADD-TEST-F1-50-7
     1775   ADD-TEST-F1-51-0
     1788   ADD-TEST-F1-51-1 . . . . . . .  G1783
     1795   ADD-TEST-F1-51-2
     1802   ADD-TEST-F1-51-3
     1809   ADD-TEST-F1-51-4
     1816   ADD-TEST-F1-51-5
     1823   ADD-TEST-F1-51-6
     1830   ADD-TEST-F1-51-7
     1854   ADD-TEST-F1-52-0
     1872   ADD-TEST-F1-52-1 . . . . . . .  G1867
     1879   ADD-TEST-F1-52-2
     1886   ADD-TEST-F1-52-3
     1893   ADD-TEST-F1-52-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    56
0 Defined   Cross-reference of procedures   References

0    1900   ADD-TEST-F1-52-5
     1907   ADD-TEST-F1-52-6
     1914   ADD-TEST-F1-52-7
     1937   ADD-TEST-F1-53-0
     1950   ADD-TEST-F1-53-1 . . . . . . .  G1945
     1963   ADD-TEST-F1-53-2
     1976   ADD-TEST-F1-53-3
     1989   ADD-TEST-F1-53-4
     2002   ADD-TEST-F1-53-5
     2025   ADD-TEST-F1-54-0
     2041   ADD-TEST-F1-54-1 . . . . . . .  G2036
     2054   ADD-TEST-F1-54-2
     2067   ADD-TEST-F1-54-3
     2080   ADD-TEST-F1-54-4
     2093   ADD-TEST-F1-54-5
     2116   ADD-TEST-F1-55-0
     2129   ADD-TEST-F1-55-1 . . . . . . .  G2124
     2142   ADD-TEST-F1-55-2
     2155   ADD-TEST-F1-55-3
     2168   ADD-TEST-F1-55-4
     2181   ADD-TEST-F1-55-5
     2204   ADD-TEST-F1-56-0
     2220   ADD-TEST-F1-56-1 . . . . . . .  G2215
     2233   ADD-TEST-F1-56-2
     2246   ADD-TEST-F1-56-3
     2259   ADD-TEST-F1-56-4
     2272   ADD-TEST-F1-56-5
     2295   ADD-TEST-F1-57-0
     2308   ADD-TEST-F1-57-1 . . . . . . .  G2303
     2321   ADD-TEST-F1-57-2
     2334   ADD-TEST-F1-57-3
     2357   ADD-TEST-F1-58-0
     2373   ADD-TEST-F1-58-1 . . . . . . .  G2368
     2386   ADD-TEST-F1-58-2
     2399   ADD-TEST-F1-58-3
      612   ADD-TEST-F1-6
      628   ADD-TEST-F1-7
      648   ADD-TEST-F1-8
      667   ADD-TEST-F1-9-1
      680   ADD-TEST-F1-9-2
      525   ADD-WRITE-F1-1 . . . . . . . .  G516 G520
      712   ADD-WRITE-F1-10-1. . . . . . .  G704 G708
      728   ADD-WRITE-F1-10-2. . . . . . .  G717 G722
      746   ADD-WRITE-F1-11-1. . . . . . .  G739 G742
      761   ADD-WRITE-F1-11-2. . . . . . .  G751 G756
      779   ADD-WRITE-F1-12. . . . . . . .  G770 G774
      795   ADD-WRITE-F1-13. . . . . . . .  G786 G790
      811   ADD-WRITE-F1-14. . . . . . . .  G802 G806
      825   ADD-WRITE-F1-15-1. . . . . . .  G817 G821
      841   ADD-WRITE-F1-15-2. . . . . . .  G830 G835
      856   ADD-WRITE-F1-16. . . . . . . .  G849 G853
      871   ADD-WRITE-F1-17. . . . . . . .  G864 G868
      886   ADD-WRITE-F1-18. . . . . . . .  G879 G883
      918   ADD-WRITE-F1-19. . . . . . . .  G902 G904 G908 G911
      541   ADD-WRITE-F1-2 . . . . . . . .  G532 G536
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    57
0 Defined   Cross-reference of procedures   References

0     940   ADD-WRITE-F1-20. . . . . . . .  G933 G937
      963   ADD-WRITE-F1-21. . . . . . . .  G957 G960
      983   ADD-WRITE-F1-22. . . . . . . .  G975 G980
     1008   ADD-WRITE-F1-23. . . . . . . .  G1000 G1005
     1067   ADD-WRITE-F1-24. . . . . . . .  G1060 G1064
     1128   ADD-WRITE-F1-25. . . . . . . .  G1121 G1125
     1141   ADD-WRITE-F1-26. . . . . . . .  G1134 G1138
     1154   ADD-WRITE-F1-27. . . . . . . .  G1147 G1151
     1167   ADD-WRITE-F1-28. . . . . . . .  G1160 G1164
     1180   ADD-WRITE-F1-29. . . . . . . .  G1173 G1177
      557   ADD-WRITE-F1-3 . . . . . . . .  G548 G552
     1193   ADD-WRITE-F1-30. . . . . . . .  G1186 G1190
     1206   ADD-WRITE-F1-31. . . . . . . .  G1199 G1203
     1219   ADD-WRITE-F1-32. . . . . . . .  G1212 G1216
     1232   ADD-WRITE-F1-33. . . . . . . .  G1225 G1229
     1245   ADD-WRITE-F1-34. . . . . . . .  G1238 G1242
     1258   ADD-WRITE-F1-35. . . . . . . .  G1251 G1255
     1271   ADD-WRITE-F1-36. . . . . . . .  G1264 G1268
     1284   ADD-WRITE-F1-37. . . . . . . .  G1277 G1281
     1297   ADD-WRITE-F1-38. . . . . . . .  G1290 G1294
     1310   ADD-WRITE-F1-39. . . . . . . .  G1303 G1307
      574   ADD-WRITE-F1-4-1 . . . . . . .  G563 G569
      589   ADD-WRITE-F1-4-2 . . . . . . .  G580 G584
     1323   ADD-WRITE-F1-40. . . . . . . .  G1316 G1320
     1336   ADD-WRITE-F1-41. . . . . . . .  G1329 G1333
     1349   ADD-WRITE-F1-42. . . . . . . .  G1342 G1346
     1362   ADD-WRITE-F1-43. . . . . . . .  G1355 G1359
     1375   ADD-WRITE-F1-44. . . . . . . .  G1368 G1372
     1388   ADD-WRITE-F1-45. . . . . . . .  G1381 G1385
      609   ADD-WRITE-F1-5 . . . . . . . .  G600 G604
      625   ADD-WRITE-F1-6 . . . . . . . .  G616 G620
      643   ADD-WRITE-F1-7 . . . . . . . .  G634 G638
      661   ADD-WRITE-F1-8 . . . . . . . .  G652 G656
      677   ADD-WRITE-F1-9-1 . . . . . . .  G669 G673
      693   ADD-WRITE-F1-9-2 . . . . . . .  G682 G687
      497   BAIL-OUT . . . . . . . . . . .  P414
      505   BAIL-OUT-EX. . . . . . . . . .  E414 G499
      500   BAIL-OUT-WRITE . . . . . . . .  G498
      480   BLANK-LINE-PRINT
     2412   CCVS-EXIT. . . . . . . . . . .  G2372
     2413   CCVS-999999
      389   CCVS1
      506   CCVS1-EXIT . . . . . . . . . .  G395
      396   CLOSE-FILES. . . . . . . . . .  G2414
      424   COLUMN-NAMES-ROUTINE . . . . .  E394
      405   DE-LETE. . . . . . . . . . . .  P519 P535 P551 P568 P583 P603 P619 P637 P655 P672 P686 P707 P721 P741 P755 P773
                                            P789 P805 P820 P834 P855 P870 P885 P910 P936 P959 P982 P1004 P1027 P1066 P1127
                                            P1140 P1153 P1166 P1179 P1192 P1205 P1218 P1231 P1244 P1257 P1270 P1283 P1296
                                            P1309 P1322 P1335 P1348 P1361 P1374 P1387 P1408 P1466 P1548 P1624 P1706 P1785
                                            P1869 P1947 P2038 P2126 P2217 P2305 P2370
      428   END-ROUTINE. . . . . . . . . .  P397
      432   END-ROUTINE-1
      441   END-ROUTINE-12
      449   END-ROUTINE-13 . . . . . . . .  E397
      430   END-RTN-EXIT
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    58
0 Defined   Cross-reference of procedures   References

0     404   FAIL . . . . . . . . . . . . .  P524 P540 P556 P573 P588 P608 P624 P642 P660 P676 P692 P711 P727 P745 P760 P778
                                            P794 P810 P824 P840 P852 P867 P882 P901 P905 P932 P956 P979 P999 P1063 P1124
                                            P1137 P1150 P1163 P1176 P1189 P1202 P1215 P1228 P1241 P1254 P1267 P1280 P1293
                                            P1306 P1319 P1332 P1345 P1358 P1371 P1384 P1414 P1420 P1426 P1432 P1438 P1444
                                            P1473 P1480 P1487 P1494 P1501 P1508 P1521 P1555 P1562 P1569 P1576 P1583 P1590
                                            P1602 P1631 P1638 P1645 P1652 P1659 P1666 P1679 P1713 P1720 P1727 P1734 P1741
                                            P1748 P1761 P1792 P1799 P1806 P1813 P1820 P1827 P1840 P1876 P1883 P1890 P1897
                                            P1904 P1911 P1924 P1960 P1973 P1986 P1999 P2012 P2051 P2064 P2077 P2090 P2103
                                            P2139 P2152 P2165 P2178 P2191 P2230 P2243 P2256 P2269 P2282 P2318 P2331 P2344
                                            P2383 P2396 P2409
      482   FAIL-ROUTINE . . . . . . . . .  P413
      496   FAIL-ROUTINE-EX. . . . . . . .  E413 G490
      491   FAIL-ROUTINE-WRITE . . . . . .  G484 G485
      419   HEAD-ROUTINE . . . . . . . . .  P394
      402   INSPT
      390   OPEN-FILES
      403   PASS . . . . . . . . . . . . .  P515 P531 P547 P562 P579 P600 P616 P634 P652 P669 P682 P704 P717 P738 P751 P770
                                            P786 P802 P817 P830 P848 P863 P878 P904 P939 P962 P974 P1007 P1059 P1120 P1133
                                            P1146 P1159 P1172 P1185 P1198 P1211 P1224 P1237 P1250 P1263 P1276 P1289 P1302
                                            P1315 P1328 P1341 P1354 P1367 P1380 P1412 P1418 P1424 P1430 P1436 P1442 P1471
                                            P1478 P1485 P1492 P1499 P1506 P1514 P1553 P1560 P1567 P1574 P1581 P1588 P1596
                                            P1629 P1636 P1643 P1650 P1657 P1664 P1672 P1711 P1718 P1725 P1732 P1739 P1746
                                            P1754 P1790 P1797 P1804 P1811 P1818 P1825 P1833 P1874 P1881 P1888 P1895 P1902
                                            P1909 P1917 P1953 P1966 P1979 P1992 P2005 P2044 P2057 P2070 P2083 P2096 P2132
                                            P2145 P2158 P2171 P2184 P2223 P2236 P2249 P2262 P2275 P2311 P2324 P2337 P2376
                                            P2389 P2402
      407   PRINT-DETAIL . . . . . . . . .  P527 P543 P559 P576 P591 P594 P611 P627 P645 P663 P679 P695 P714 P730 P748 P763
                                            P781 P797 P813 P827 P843 P858 P873 P888 P921 P942 P965 P985 P1010 P1031 P1069
                                            P1130 P1143 P1156 P1169 P1182 P1195 P1208 P1221 P1234 P1247 P1260 P1273 P1286
                                            P1299 P1312 P1325 P1338 P1351 P1364 P1377 P1390 P1409 P1412 P1415 P1418 P1421
                                            P1424 P1427 P1430 P1433 P1436 P1439 P1442 P1445 P1467 P1471 P1474 P1478 P1481
                                            P1485 P1488 P1492 P1495 P1499 P1502 P1506 P1509 P1515 P1522 P1549 P1553 P1556
                                            P1560 P1563 P1567 P1570 P1574 P1577 P1581 P1584 P1588 P1591 P1597 P1603 P1625
                                            P1629 P1632 P1636 P1639 P1643 P1646 P1650 P1653 P1657 P1660 P1664 P1667 P1673
                                            P1680 P1707 P1711 P1714 P1718 P1721 P1725 P1728 P1732 P1735 P1739 P1742 P1746
                                            P1749 P1755 P1762 P1786 P1790 P1793 P1797 P1800 P1804 P1807 P1811 P1814 P1818
                                            P1821 P1825 P1828 P1834 P1841 P1870 P1874 P1877 P1881 P1884 P1888 P1891 P1895
                                            P1898 P1902 P1905 P1909 P1912 P1918 P1925 P1948 P1954 P1961 P1967 P1974 P1980
                                            P1987 P1993 P2000 P2006 P2013 P2039 P2045 P2052 P2058 P2065 P2071 P2078 P2084
                                            P2091 P2097 P2104 P2127 P2133 P2140 P2146 P2153 P2159 P2166 P2172 P2179 P2185
                                            P2192 P2218 P2224 P2231 P2237 P2244 P2250 P2257 P2263 P2270 P2276 P2283 P2306
                                            P2312 P2319 P2325 P2332 P2338 P2345 P2371 P2377 P2384 P2390 P2397 P2403 P2410
      508   SECT-NC176A-001
      400   TERMINATE-CALL
      398   TERMINATE-CCVS
      461   WRITE-LINE . . . . . . . . . .  P411 P412 P420 P421 P422 P423 P425 P426 P427 P429 P431 P440 P448 P454 P459 P460
                                            P488 P492 P494 P503
      477   WRT-LN . . . . . . . . . . . .  P467 P468 P469 P470 P471 P472 P473 P476 P481
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    59
0 Defined   Cross-reference of programs     References

        3   NC176A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC176A    Date 06/04/2022  Time 12:00:40   Page    60
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC176A:
 *    Source records = 2414
 *    Data Division statements = 227
 *    Procedure Division statements = 1607
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1637
0End of compilation 1,  program NC176A,  highest severity 0.
0Return code 0
