1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:48   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:48   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1064.2
   000002         000200 PROGRAM-ID.                                                      NC1064.2
   000003         000300     NC106A.                                                      NC1064.2
   000004         000500*                                                              *  NC1064.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1064.2
   000006         000700*                                                              *  NC1064.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1064.2
   000008         000900*                                                              *  NC1064.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1064.2
   000010         001100*                                                              *  NC1064.2
   000011         001300*                                                              *  NC1064.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1064.2
   000013         001500*                                                              *  NC1064.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1064.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1064.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1064.2
   000017         001900*                                                              *  NC1064.2
   000018         002100*                                                                 NC1064.2
   000019         002200*    PROGRAM NC106A TESTS FORMAT 1  OF THE SUBTRACT               NC1064.2
   000020         002300*    STATEMENT.  VARIOUS COMBINATINS OF DATA-ITEMS AND ALL        NC1064.2
   000021         002400*    OPTIONAL PHRASES ARE TESTED.                                 NC1064.2
   000022         002500*                                                                 NC1064.2
   000023         002600                                                                  NC1064.2
   000024         002700 ENVIRONMENT DIVISION.                                            NC1064.2
   000025         002800 CONFIGURATION SECTION.                                           NC1064.2
   000026         002900 SOURCE-COMPUTER.                                                 NC1064.2
   000027         003000     XXXXX082.                                                    NC1064.2
   000028         003100 OBJECT-COMPUTER.                                                 NC1064.2
   000029         003200     XXXXX083.                                                    NC1064.2
   000030         003300 INPUT-OUTPUT SECTION.                                            NC1064.2
   000031         003400 FILE-CONTROL.                                                    NC1064.2
   000032         003500     SELECT PRINT-FILE ASSIGN TO                                  NC1064.2 36
   000033         003600     XXXXX055.                                                    NC1064.2
   000034         003700 DATA DIVISION.                                                   NC1064.2
   000035         003800 FILE SECTION.                                                    NC1064.2
   000036         003900 FD  PRINT-FILE.                                                  NC1064.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004000 01  PRINT-REC PICTURE X(120).                                    NC1064.2
   000038         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC1064.2
   000039         004200 WORKING-STORAGE SECTION.                                         NC1064.2
   000040         004300 01  WRK-NE-X-1     PIC  9(16).99.                                NC1064.2
   000041         004400 01  WRK-NE-X-2     PIC -9(16).99.                                NC1064.2
   000042         004500 01  WRK-XN-00001 PIC X.                                          NC1064.2
   000043         004600 01  WRK-XN-18-1 PIC X(18).                                       NC1064.2
   000044         004700 01  WRK-AN-X-18-1, REDEFINES WRK-XN-18-1 PIC A(18).              NC1064.2 43
   000045         004800 01  WRK-DU-X-18V0-1; REDEFINES WRK-XN-18-1 PIC 9(18).            NC1064.2 43
   000046         004900 01  WRK-DU-0V1-1 PIC V9 VALUE .3.                                NC1064.2
   000047         005000 01  WRK-DU-0V2-1 PIC V99 VALUE .25.                              NC1064.2
   000048         005100 01  WRK-DU-0V12-1 PIC V9(12) VALUE .00001.                       NC1064.2
   000049         005200 01  WRK-DU-1V0-1 PIC 9 VALUE ZERO.                               NC1064.2 IMP
   000050         005300 01  WRK-DU-1V1-1 PIC 9V9 VALUE 1.1.                              NC1064.2
   000051         005400 01  WRK-DU-1V1-2 PIC 9V9 VALUE 2.4.                              NC1064.2
   000052         005500 01  WRK-DU-1V3-1 PIC 9V999 VALUE 1.001.                          NC1064.2
   000053         005600 01  WRK-DU-1V3-2 PIC 9V999 VALUE 1.001.                          NC1064.2
   000054         005700 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC1064.2
   000056         005900 01  WRK-DU-2P6-1 PIC 99P(6) VALUE 99000000.                      NC1064.2
   000057         006000 01  WRK-DU-2V0-1 PIC 99.                                         NC1064.2
   000058         006100 01  WRK-DU-2V0-2 PIC 99.                                         NC1064.2
   000059         006200 01  WRK-DU-2V0-3 PIC 99.                                         NC1064.2
   000060         006300 01  WRK-DU-2V1-1 PIC 99V9.                                       NC1064.2
   000061         006400 01  WRK-DU-2V1-2 PIC 99V9.                                       NC1064.2
   000062         006500 01  WRK-DU-2V1-3 PIC 99V9.                                       NC1064.2
   000063         006600 01  WRK-DU-2V2-1 PIC 99V99 VALUE 15.44.                          NC1064.2
   000064         006700 01  WRK-DU-2V2-2 PIC 99V99 VALUE 60.89.                          NC1064.2
   000065         006800 01  WRK-DU-2V2-3 PIC 99V99 VALUE 60.99.                          NC1064.2
   000066         006900 01  WRK-DU-2V2-4 PIC 99V99 VALUE 60.99.                          NC1064.2
   000067         007000 01  WRK-DU-2V2-5 PIC 99V99 VALUE 10.00.                          NC1064.2
   000068         007100 01  WRK-DU-2V5-1 PIC 99V9(5).                                    NC1064.2
   000069         007200 01  WRK-DU-4P1-1 PIC P(4)9 VALUE .00001.                         NC1064.2
   000070         007300 01  WRK-DU-5V1-1 PIC 9(5)V9 VALUE 12345.6.                       NC1064.2
   000071         007400 01  WRK-DU-6V0-1 PIC 9(6) VALUE 99999.                           NC1064.2
   000072         007500 01  WRK-DU-6V0-2 PIC 9(6) VALUE 99999.                           NC1064.2
   000073         007600 01  WRK-DU-16V2-1 PIC 9(16)V99 VALUE 9999999999999999.99.        NC1064.2
   000074         007700 01  WRK-DS-1V0-1 PIC S9 VALUE -3.                                NC1064.2
   000075         007800 01  WRK-DS-1V0-2 PIC S9 VALUE 2.                                 NC1064.2
   000076         007900 01  WRK-DS-1V2-1 PIC S9V99 VALUE ZERO.                           NC1064.2 IMP
   000077         008000 01  WRK-DS-2V0-1 PIC S99 VALUE ZERO.                             NC1064.2 IMP
   000078         008100 01  WRK-DS-2V1-1 PIC S99V9 VALUE ZERO.                           NC1064.2 IMP
   000079         008200 01  WRK-DS-2V2-1 PIC S99V99 VALUE ZERO.                          NC1064.2 IMP
   000080         008300 01  WRK-DS-2V2-2 PIC S99V99 VALUE -12.34.                        NC1064.2
   000081         008400 01  WRK-DS-16V2-1 PIC S9(16)V99 VALUE -9999999999999999.99.      NC1064.2
   000082         008500 01  42-DATANAMES.                                                NC1064.2
   000083         008600     02  DNAME1   PICTURE 9      VALUE 1        COMPUTATIONAL.    NC1064.2
   000084         008700     02  DNAME2   PICTURE 99      VALUE 1  COMPUTATIONAL.         NC1064.2
   000085         008800     02  DNAME3   PICTURE 999     VALUE 1  COMPUTATIONAL.         NC1064.2
   000086         008900     02  DNAME4   PICTURE 9(4)    VALUE 1  COMPUTATIONAL.         NC1064.2
   000087         009000     02  DNAME5   PICTURE 9(5)    VALUE 1  COMPUTATIONAL.         NC1064.2
   000088         009100     02  DNAME6   PICTURE 9(6)    VALUE 1  COMPUTATIONAL.         NC1064.2
   000089         009200     02  DNAME7   PICTURE 9(7)    VALUE 1  COMPUTATIONAL.         NC1064.2
   000090         009300     02  DNAME8   PICTURE 9(8)    VALUE 1  COMPUTATIONAL.         NC1064.2
   000091         009400     02  DNAME9   PICTURE 9(9)    VALUE 1  COMPUTATIONAL.         NC1064.2
   000092         009500     02  DNAME10  PICTURE 9(10)   VALUE 1.                        NC1064.2
   000093         009600     02  DNAME11  PICTURE 9(11)   VALUE 1.                        NC1064.2
   000094         009700     02  DNAME12  PICTURE 9(12)   VALUE 1.                        NC1064.2
   000095         009800     02  DNAME13  PICTURE 9(13)   VALUE 1.                        NC1064.2
   000096         009900     02  DNAME14  PICTURE 9(14)   VALUE 1.                        NC1064.2
   000097         010000     02  DNAME15  PICTURE 9(15)   VALUE 1.                        NC1064.2
   000098         010100     02  DNAME16  PICTURE 9(16)   VALUE 1.                        NC1064.2
   000099         010200     02  DNAME17  PICTURE 9(17)   VALUE 1.                        NC1064.2
   000100         010300     02  DNAME18  PICTURE 9(18)   VALUE 1.                        NC1064.2
   000101         010400     02  DNAME19  PICTURE 9       VALUE 1.                        NC1064.2
   000102         010500     02  DNAME20  PICTURE 99      VALUE 1.                        NC1064.2
   000103         010600     02  DNAME21  PICTURE 999     VALUE 1.                        NC1064.2
   000104         010700     02  DNAME22  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
   000105         010800     02  DNAME23  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
   000106         010900     02  DNAME24  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
   000107         011000     02  DNAME25  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
   000108         011100     02  DNAME26  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
   000109         011200     02  DNAME27  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
   000110         011300     02  DNAME28  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
   000111         011400     02  DNAME29  PICTURE 9(18)  VALUE ZERO.                      NC1064.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02  DNAME30   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000113         011600     02  DNAME31   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000114         011700     02  DNAME32   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000115         011800     02  DNAME33   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000116         011900     02  DNAME34   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000117         012000     02  DNAME35   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000118         012100     02  DNAME36   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000119         012200     02  DNAME37   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000120         012300     02  DNAME38   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000121         012400     02  DNAME39   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000122         012500     02  DNAME40   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000123         012600     02  DNAME41   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000124         012700     02  DNAME42   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC1064.2 IMP
   000125         012800 77  SIZE-ERR                     PICTURE X  VALUE SPACE.         NC1064.2 IMP
   000126         012900 77  SIZE-ERR2                    PICTURE X  VALUE SPACE.         NC1064.2 IMP
   000127         013000 77  SIZE-ERR3                    PICTURE X  VALUE SPACE.         NC1064.2 IMP
   000128         013100 77  SIZE-ERR4                    PICTURE X  VALUE SPACE.         NC1064.2 IMP
   000129         013200 77  A18TWOS-DS-18V00             PICTURE S9(18)                  NC1064.2
   000130         013300                                  VALUE 222222222222222222.       NC1064.2
   000131         013400 77  A18ONES-DS-18V00             PICTURE S9(18)                  NC1064.2
   000132         013500                                  VALUE 111111111111111111.       NC1064.2
   000133         013600 77  WRK-DS-10V00                 PICTURE S9(10).                 NC1064.2
   000134         013700 77  A10ONES-DS-10V00             PICTURE S9(10)                  NC1064.2
   000135         013800                                  VALUE 1111111111.               NC1064.2
   000136         013900 77  A05ONES-DS-05V00             PICTURE S9(5)                   NC1064.2
   000137         014000                                  VALUE 11111.                    NC1064.2
   000138         014100 77  A02ONES-DS-02V00             PICTURE S99                     NC1064.2
   000139         014200                                  VALUE 11.                       NC1064.2
   000140         014300 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC1064.2
   000141         014400 77  WRK-DS-18V00 REDEFINES WRK-DS-09V09                          NC1064.2 140
   000142         014500                                  PICTURE S9(18).                 NC1064.2
   000143         014600 77  A06THREES-DS-03V03           PICTURE S999V999                NC1064.2
   000144         014700                                  VALUE 333.333.                  NC1064.2
   000145         014800 77  A12THREES-DS-06V06           PICTURE S9(6)V9(6)              NC1064.2
   000146         014900                                  VALUE 333333.333333.            NC1064.2
   000147         015000 77  WRK-DS-06V06                 PICTURE S9(6)V9(6).             NC1064.2
   000148         015100 77  WRK-DS-12V00-S REDEFINES WRK-DS-06V06                        NC1064.2 147
   000149         015200                                  PICTURE S9(12).                 NC1064.2
   000150         015300 77  A05ONES-DS-00V05             PICTURE SV9(5)                  NC1064.2
   000151         015400                                  VALUE .11111.                   NC1064.2
   000152         015500 77  WRK-DS-05V00                 PICTURE S9(5).                  NC1064.2
   000153         015600 77  WRK-DS-02V00                 PICTURE S99.                    NC1064.2
   000154         015700 77  A12ONES-DS-12V00             PICTURE S9(12)                  NC1064.2
   000155         015800                                  VALUE 111111111111.             NC1064.2
   000156         015900 77  WRK-DS-03V10                 PICTURE S999V9(10).             NC1064.2
   000157         016000 77  WRK-DS-13V00-S REDEFINES WRK-DS-03V10                        NC1064.2 156
   000158         016100                                  PICTURE S9(13).                 NC1064.2
   000159         016200 77  A99-DS-02V00                 PICTURE S99                     NC1064.2
   000160         016300                                  VALUE 99.                       NC1064.2
   000161         016400 77  A03ONES-DS-02V01             PICTURE S99V9                   NC1064.2
   000162         016500                                  VALUE 11.1.                     NC1064.2
   000163         016600 77  A06ONES-DS-03V03             PICTURE S999V999                NC1064.2
   000164         016700                                  VALUE 111.111.                  NC1064.2
   000165         016800 77  A08TWOS-DS-02V06             PICTURE S99V9(6)                NC1064.2
   000166         016900                                  VALUE 22.222222.                NC1064.2
   000167         017000 77  A01ONE-DS-P0801              PICTURE SP(8)9                  NC1064.2
   000168         017100                                  VALUE .000000001.               NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 77  WRK-CS-18V00                 PICTURE S9(18) COMPUTATIONAL.   NC1064.2
   000170         017300 77  A18ONES-CS-18V00             PICTURE S9(18) COMPUTATIONAL    NC1064.2
   000171         017400                                  VALUE 111111111111111111.       NC1064.2
   000172         017500 77  WRK-CS-02V02                 PICTURE S99V99 COMPUTATIONAL.   NC1064.2
   000173         017600 77  A99-CS-02V00                 PICTURE S99 COMPUTATIONAL       NC1064.2
   000174         017700                                  VALUE 99.                       NC1064.2
   000175         017800 77  WRK-DS-0201P                 PICTURE S99P.                   NC1064.2
   000176         017900 77  WRK-DS-06V00                 PICTURE S9(6).                  NC1064.2
   000177         018000 77  AZERO-DS-05V05               PICTURE S9(5)V9(5)              NC1064.2
   000178         018100                                  VALUE ZERO.                     NC1064.2 IMP
   000179         018200 77  NDATA-DS-09V09               PICTURE S9(9)V9(9)              NC1064.2
   000180         018300                                  VALUE +012345678.876543210.     NC1064.2
   000181         018400 77  XDATA-XN-00018               PICTURE X(18)                   NC1064.2
   000182         018500                                  VALUE "00ABCDEFGHI  4321 ".     NC1064.2
   000183         018600 77  WRK-XN-00018                 PICTURE X(18).                  NC1064.2
   000184         018700 77  ADD-12    PICTURE PP9        VALUE .001.                     NC1064.2
   000185         018800 77  ADD-13    PICTURE 9PP        VALUE 100.                      NC1064.2
   000186         018900 77  ADD-14    PICTURE 999V999.                                   NC1064.2
   000187         019000 77  WRK-CU-18V00      PICTURE 9(18) VALUE ZERO COMPUTATIONAL.    NC1064.2 IMP
   000188         019100 77  A18EIGHTS-CS-18V00 PICTURE S9(18) VALUE -888888888888888888  NC1064.2
   000189         019200             COMPUTATIONAL.                                       NC1064.2
   000190         019300 77  A14TWOS-CS-18V00  PICTURE S9(18) VALUE -000022222222222222   NC1064.2
   000191         019400             COMPUTATIONAL.                                       NC1064.2
   000192         019500 77  A12THREES-CU-18V00 PICTURE 9(18) VALUE 000000333333333333    NC1064.2
   000193         019600             COMPUTATIONAL.                                       NC1064.2
   000194         019700 77  A16FOURS-CS-18V00 PICTURE S9(18) VALUE 004444444444444444    NC1064.2
   000195         019800             COMPUTATIONAL.                                       NC1064.2
   000196         019900 77  A18FIVES-CS-18V00 PICTURE S9(18) VALUE -555555555555555555   NC1064.2
   000197         020000             COMPUTATIONAL.                                       NC1064.2
   000198         020100 77  A18SIXES-CS-18V00 PICTURE S9(18) VALUE 666666666666666666    NC1064.2
   000199         020200             COMPUTATIONAL.                                       NC1064.2
   000200         020300 77  A12SEVENS-CU-18V00 PICTURE 9(18) VALUE 000000777777777777    NC1064.2
   000201         020400             COMPUTATIONAL.                                       NC1064.2
   000202         020500 77  WRK-DU-18V00      PICTURE 9(18) VALUE ZERO.                  NC1064.2 IMP
   000203         020600 77  A18THREES-CS-18V00 PICTURE S9(18) VALUE -333333333333333333  NC1064.2
   000204         020700             COMPUTATIONAL.                                       NC1064.2
   000205         020800 77  WRK-CS-03V00 PICTURE S999 COMPUTATIONAL SYNCHRONIZED RIGHT.  NC1064.2
   000206         020900 01  SUBTRACT-DATA.                                               NC1064.2
   000207         021000     02  SUBTR-1    PICTURE 9         VALUE 1.                    NC1064.2
   000208         021100     02  SUBTR-2    PICTURE S99       VALUE 99.                   NC1064.2
   000209         021200     02  SUBTR-3    PICTURE S9V99     VALUE -1.                   NC1064.2
   000210         021300     02  SUBTR-4    PICTURE SPP9      VALUE .001.                 NC1064.2
   000211         021400     02  SUBTR-5    PICTURE S9PP      VALUE 100.                  NC1064.2
   000212         021500     02  SUBTR-6    PICTURE 9  VALUE 1.                           NC1064.2
   000213         021600     02  SUBTR-7    PICTURE S99  VALUE 99.                        NC1064.2
   000214         021700     02  SUBTR-8    PICTURE S9V99  VALUE -9.99.                   NC1064.2
   000215         021800     02  SUBTR-10    PICTURE S999  VALUE 100.                     NC1064.2
   000216         021900     02  SUBTR-11   PICTURE S999V999.                             NC1064.2
   000217         022000 01  N-3                                PICTURE IS 99999.         NC1064.2
   000218         022100 01  N-4                                PICTURE IS 9(5)           NC1064.2
   000219         022200     VALUE IS 52800.                                              NC1064.2
   000220         022300 01  N-5                                PICTURE IS S9(9)V99       NC1064.2
   000221         022400     VALUE IS 000000001.00.                                       NC1064.2
   000222         022500 01  N-7                                PICTURE IS S9(7)V9(4)     NC1064.2
   000223         022600     VALUE IS 0000001.0000.                                       NC1064.2
   000224         022700 01  X-8 REDEFINES N-7                  PICTURE IS X(11).         NC1064.2 222
   000225         022800 01  N-10                               PICTURE IS S99999V        NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     VALUE IS -00001.                                             NC1064.2
   000227         023000 01  N-11                               PICTURE IS 9 VALUE IS 9.  NC1064.2
   000228         023100 01  N-12                               PICTURE IS 9 VALUE IS 9.  NC1064.2
   000229         023200 01  N-13                               PICTURE IS 9(5)           NC1064.2
   000230         023300     VALUE IS 99999.                                              NC1064.2
   000231         023400 01  N-14                               PICTURE IS 9 VALUE IS 1.  NC1064.2
   000232         023500 01  N-15                               PICTURE IS 9(16).         NC1064.2
   000233         023600 01  N-16                               PICTURE IS S999999V99     NC1064.2
   000234         023700     VALUE IS 5.90.                                               NC1064.2
   000235         023800 01  N-17                               PICTURE IS S9(3)V99       NC1064.2
   000236         023900     VALUE IS +3.6.                                               NC1064.2
   000237         024000 01  N-18                               PICTURE IS S9(10)         NC1064.2
   000238         024100     VALUE IS -5.                                                 NC1064.2
   000239         024200 01  N-19                               PICTURE IS $9.00.         NC1064.2
   000240         024300 01  N-20                               PICTURE IS S9(9)          NC1064.2
   000241         024400     VALUE IS -999999999.                                         NC1064.2
   000242         024500 01  N-21                               PICTURE IS 9 VALUE IS 5.  NC1064.2
   000243         024600 01  N-22                               PICTURE IS 999V99         NC1064.2
   000244         024700     VALUE IS 005.55.                                             NC1064.2
   000245         024800 01  N-23                               PICTURE IS $$$.99CR.      NC1064.2
   000246         024900 01  N-25                               PICTURE IS 9 VALUE IS 1.  NC1064.2
   000247         025000 01  N-26               PICTURE 9(5).                             NC1064.2
   000248         025100 01  N-27                               PICTURE IS 9999V9         NC1064.2
   000249         025200     VALUE IS 9999.9.                                             NC1064.2
   000250         025300 01  N-28                               PICTURE IS $9999.00.      NC1064.2
   000251         025400 01  N-40                               PICTURE IS 9(7)           NC1064.2
   000252         025500     VALUE IS 7777777.                                            NC1064.2
   000253         025600 01  N-41                               PICTURE IS 9(7)           NC1064.2
   000254         025700     VALUE IS 1111111.                                            NC1064.2
   000255         025800 01  N-42                               PICTURE IS 9(3)P(4).      NC1064.2
   000256         025900 01  TRUNC-DATA.                                                  NC1064.2
   000257         026000     02 N-43  PICTURE S9V9 VALUE +1.6.                            NC1064.2
   000258         026100     02 N-44  PICTURE S9V9 VALUE -1.6.                            NC1064.2
   000259         026200     02 N-45  PICTURE S9.                                         NC1064.2
   000260         026300 01  MINUS-NAMES.                                                 NC1064.2
   000261         026400     02  MINUS-NAME1 PICTURE S9(18) VALUE -999999999999999999.    NC1064.2
   000262         026500     02  MINUS-NAME2 PICTURE S9(18) VALUE -999999999999999999.    NC1064.2
   000263         026600     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC1064.2
   000264         026700     02  PLUS-NAME1  PICTURE S9(18) VALUE +999999999999999999.    NC1064.2
   000265         026800     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC1064.2
   000266         026900     02  MINUS-NAME3 PICTURE SV9(18) VALUE -.999999999999999999.  NC1064.2
   000267         027000     02  MINUS-NAME4 PICTURE SV9(18) VALUE -.999999999999999999.  NC1064.2
   000268         027100     02  EVEN-NAME2  PICTURE SV9(18)  VALUE +.1.                  NC1064.2
   000269         027200     02  PLUS-NAME3  PICTURE SV9(18) VALUE +.999999999999999999.  NC1064.2
   000270         027300     02  PLUS-NAME4  PICTURE SV9(18) VALUE +.999999999999999999.  NC1064.2
   000271         027400     02  WHOLE-FIELD   PICTURE S9(18).                            NC1064.2
   000272         027500     02  DECMAL-FIELD  PICTURE SV9(18).                           NC1064.2
   000273         027600 01  TEST-RESULTS.                                                NC1064.2
   000274         027700     02 FILLER                   PIC X      VALUE SPACE.          NC1064.2 IMP
   000275         027800     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1064.2 IMP
   000276         027900     02 FILLER                   PIC X      VALUE SPACE.          NC1064.2 IMP
   000277         028000     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1064.2 IMP
   000278         028100     02 FILLER                   PIC X      VALUE SPACE.          NC1064.2 IMP
   000279         028200     02  PAR-NAME.                                                NC1064.2
   000280         028300       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1064.2 IMP
   000281         028400       03  PARDOT-X              PIC X      VALUE SPACE.          NC1064.2 IMP
   000282         028500       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1064.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1064.2 IMP
   000284         028700     02 RE-MARK                  PIC X(61).                       NC1064.2
   000285         028800 01  TEST-COMPUTED.                                               NC1064.2
   000286         028900     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1064.2 IMP
   000287         029000     02 FILLER                   PIC X(17)  VALUE                 NC1064.2
   000288         029100            "       COMPUTED=".                                   NC1064.2
   000289         029200     02 COMPUTED-X.                                               NC1064.2
   000290         029300     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1064.2 IMP
   000291         029400     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1064.2 290
   000292         029500                                 PIC -9(9).9(9).                  NC1064.2
   000293         029600     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1064.2 290
   000294         029700     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1064.2 290
   000295         029800     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1064.2 290
   000296         029900     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1064.2 290
   000297         030000         04 COMPUTED-18V0                    PIC -9(18).          NC1064.2
   000298         030100         04 FILLER                           PIC X.               NC1064.2
   000299         030200     03 FILLER PIC X(50) VALUE SPACE.                             NC1064.2 IMP
   000300         030300 01  TEST-CORRECT.                                                NC1064.2
   000301         030400     02 FILLER PIC X(30) VALUE SPACE.                             NC1064.2 IMP
   000302         030500     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1064.2
   000303         030600     02 CORRECT-X.                                                NC1064.2
   000304         030700     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1064.2 IMP
   000305         030800     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1064.2 304
   000306         030900     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1064.2 304
   000307         031000     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1064.2 304
   000308         031100     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1064.2 304
   000309         031200     03      CR-18V0 REDEFINES CORRECT-A.                         NC1064.2 304
   000310         031300         04 CORRECT-18V0                     PIC -9(18).          NC1064.2
   000311         031400         04 FILLER                           PIC X.               NC1064.2
   000312         031500     03 FILLER PIC X(2) VALUE SPACE.                              NC1064.2 IMP
   000313         031600     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1064.2 IMP
   000314         031700 01  CCVS-C-1.                                                    NC1064.2
   000315         031800     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1064.2
   000316         031900-    "SS  PARAGRAPH-NAME                                          NC1064.2
   000317         032000-    "       REMARKS".                                            NC1064.2
   000318         032100     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1064.2 IMP
   000319         032200 01  CCVS-C-2.                                                    NC1064.2
   000320         032300     02 FILLER                     PIC X        VALUE SPACE.      NC1064.2 IMP
   000321         032400     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1064.2
   000322         032500     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1064.2 IMP
   000323         032600     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1064.2
   000324         032700     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1064.2 IMP
   000325         032800 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1064.2 IMP
   000326         032900 01  REC-CT                        PIC 99       VALUE ZERO.       NC1064.2 IMP
   000327         033000 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1064.2 IMP
   000328         033100 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1064.2 IMP
   000329         033200 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1064.2 IMP
   000330         033300 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1064.2 IMP
   000331         033400 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1064.2 IMP
   000332         033500 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1064.2 IMP
   000333         033600 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1064.2 IMP
   000334         033700 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1064.2 IMP
   000335         033800 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1064.2 IMP
   000336         033900 01  CCVS-H-1.                                                    NC1064.2
   000337         034000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1064.2 IMP
   000338         034100     02  FILLER                    PIC X(42)    VALUE             NC1064.2
   000339         034200     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1064.2 IMP
   000341         034400 01  CCVS-H-2A.                                                   NC1064.2
   000342         034500   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1064.2 IMP
   000343         034600   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1064.2
   000344         034700   02  FILLER                        PIC XXXX   VALUE             NC1064.2
   000345         034800     "4.2 ".                                                      NC1064.2
   000346         034900   02  FILLER                        PIC X(28)  VALUE             NC1064.2
   000347         035000            " COPY - NOT FOR DISTRIBUTION".                       NC1064.2
   000348         035100   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1064.2 IMP
   000349         035200                                                                  NC1064.2
   000350         035300 01  CCVS-H-2B.                                                   NC1064.2
   000351         035400   02  FILLER                        PIC X(15)  VALUE             NC1064.2
   000352         035500            "TEST RESULT OF ".                                    NC1064.2
   000353         035600   02  TEST-ID                       PIC X(9).                    NC1064.2
   000354         035700   02  FILLER                        PIC X(4)   VALUE             NC1064.2
   000355         035800            " IN ".                                               NC1064.2
   000356         035900   02  FILLER                        PIC X(12)  VALUE             NC1064.2
   000357         036000     " HIGH       ".                                              NC1064.2
   000358         036100   02  FILLER                        PIC X(22)  VALUE             NC1064.2
   000359         036200            " LEVEL VALIDATION FOR ".                             NC1064.2
   000360         036300   02  FILLER                        PIC X(58)  VALUE             NC1064.2
   000361         036400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1064.2
   000362         036500 01  CCVS-H-3.                                                    NC1064.2
   000363         036600     02  FILLER                      PIC X(34)  VALUE             NC1064.2
   000364         036700            " FOR OFFICIAL USE ONLY    ".                         NC1064.2
   000365         036800     02  FILLER                      PIC X(58)  VALUE             NC1064.2
   000366         036900     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1064.2
   000367         037000     02  FILLER                      PIC X(28)  VALUE             NC1064.2
   000368         037100            "  COPYRIGHT   1985 ".                                NC1064.2
   000369         037200 01  CCVS-E-1.                                                    NC1064.2
   000370         037300     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1064.2 IMP
   000371         037400     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1064.2
   000372         037500     02 ID-AGAIN                     PIC X(9).                    NC1064.2
   000373         037600     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1064.2 IMP
   000374         037700 01  CCVS-E-2.                                                    NC1064.2
   000375         037800     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1064.2 IMP
   000376         037900     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1064.2 IMP
   000377         038000     02 CCVS-E-2-2.                                               NC1064.2
   000378         038100         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1064.2 IMP
   000379         038200         03 FILLER                   PIC X      VALUE SPACE.      NC1064.2 IMP
   000380         038300         03 ENDER-DESC               PIC X(44)  VALUE             NC1064.2
   000381         038400            "ERRORS ENCOUNTERED".                                 NC1064.2
   000382         038500 01  CCVS-E-3.                                                    NC1064.2
   000383         038600     02  FILLER                      PIC X(22)  VALUE             NC1064.2
   000384         038700            " FOR OFFICIAL USE ONLY".                             NC1064.2
   000385         038800     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1064.2 IMP
   000386         038900     02  FILLER                      PIC X(58)  VALUE             NC1064.2
   000387         039000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1064.2
   000388         039100     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1064.2 IMP
   000389         039200     02 FILLER                       PIC X(15)  VALUE             NC1064.2
   000390         039300             " COPYRIGHT 1985".                                   NC1064.2
   000391         039400 01  CCVS-E-4.                                                    NC1064.2
   000392         039500     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1064.2 IMP
   000393         039600     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1064.2
   000394         039700     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1064.2 IMP
   000395         039800     02 FILLER                       PIC X(40)  VALUE             NC1064.2
   000396         039900      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000 01  XXINFO.                                                      NC1064.2
   000398         040100     02 FILLER                       PIC X(19)  VALUE             NC1064.2
   000399         040200            "*** INFORMATION ***".                                NC1064.2
   000400         040300     02 INFO-TEXT.                                                NC1064.2
   000401         040400       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1064.2 IMP
   000402         040500       04 XXCOMPUTED                 PIC X(20).                   NC1064.2
   000403         040600       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1064.2 IMP
   000404         040700       04 XXCORRECT                  PIC X(20).                   NC1064.2
   000405         040800     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1064.2
   000406         040900 01  HYPHEN-LINE.                                                 NC1064.2
   000407         041000     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1064.2 IMP
   000408         041100     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1064.2
   000409         041200-    "*****************************************".                 NC1064.2
   000410         041300     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1064.2
   000411         041400-    "******************************".                            NC1064.2
   000412         041500 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1064.2
   000413         041600     "NC106A".                                                    NC1064.2
   000414         041700 PROCEDURE DIVISION.                                              NC1064.2
   000415         041800 CCVS1 SECTION.                                                   NC1064.2
   000416         041900 OPEN-FILES.                                                      NC1064.2
   000417         042000     OPEN     OUTPUT PRINT-FILE.                                  NC1064.2 36
   000418         042100     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1064.2 412 353 412 372
   000419         042200     MOVE    SPACE TO TEST-RESULTS.                               NC1064.2 IMP 273
   000420         042300     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1064.2 445 450
   000421         042400     GO TO CCVS1-EXIT.                                            NC1064.2 532
   000422         042500 CLOSE-FILES.                                                     NC1064.2
   000423         042600     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1064.2 454 475 36
   000424         042700 TERMINATE-CCVS.                                                  NC1064.2
   000425         042800     EXIT PROGRAM.                                                NC1064.2
   000426         042900 TERMINATE-CALL.                                                  NC1064.2
   000427         043000     STOP     RUN.                                                NC1064.2
   000428         043100 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1064.2 277 329
   000429         043200 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1064.2 277 330
   000430         043300 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1064.2 277 328
   000431         043400 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1064.2 277 327
   000432         043500     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1064.2 284
   000433         043600 PRINT-DETAIL.                                                    NC1064.2
   000434         043700     IF REC-CT NOT EQUAL TO ZERO                                  NC1064.2 326 IMP
   000435      1  043800             MOVE "." TO PARDOT-X                                 NC1064.2 281
   000436      1  043900             MOVE REC-CT TO DOTVALUE.                             NC1064.2 326 282
   000437         044000     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1064.2 273 37 487
   000438         044100     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1064.2 277 487
   000439      1  044200        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1064.2 508 522
   000440      1  044300          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1064.2 523 531
   000441         044400     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1064.2 IMP 277 IMP 289
   000442         044500     MOVE SPACE TO CORRECT-X.                                     NC1064.2 IMP 303
   000443         044600     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1064.2 326 IMP IMP 279
   000444         044700     MOVE     SPACE TO RE-MARK.                                   NC1064.2 IMP 284
   000445         044800 HEAD-ROUTINE.                                                    NC1064.2
   000446         044900     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1064.2 336 38 487
   000447         045000     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1064.2 341 38 487
   000448         045100     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1064.2 350 38 487
   000449         045200     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1064.2 362 38 487
   000450         045300 COLUMN-NAMES-ROUTINE.                                            NC1064.2
   000451         045400     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1064.2 314 38 487
   000452         045500     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1064.2 319 38 487
   000453         045600     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1064.2 406 38 487
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700 END-ROUTINE.                                                     NC1064.2
   000455         045800     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1064.2 406 38 487
   000456         045900 END-RTN-EXIT.                                                    NC1064.2
   000457         046000     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1064.2 369 38 487
   000458         046100 END-ROUTINE-1.                                                   NC1064.2
   000459         046200      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1064.2 328 332 329
   000460         046300      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1064.2 332 327 332
   000461         046400      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1064.2 330 332
   000462         046500*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1064.2
   000463         046600      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1064.2 330 392
   000464         046700      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1064.2 332 394
   000465         046800      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1064.2 391 377
   000466         046900      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1064.2 374 38 487
   000467         047000  END-ROUTINE-12.                                                 NC1064.2
   000468         047100      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1064.2 380
   000469         047200     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1064.2 328 IMP
   000470      1  047300         MOVE "NO " TO ERROR-TOTAL                                NC1064.2 378
   000471         047400         ELSE                                                     NC1064.2
   000472      1  047500         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1064.2 328 378
   000473         047600     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1064.2 374 38
   000474         047700     PERFORM WRITE-LINE.                                          NC1064.2 487
   000475         047800 END-ROUTINE-13.                                                  NC1064.2
   000476         047900     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1064.2 327 IMP
   000477      1  048000         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1064.2 378
   000478      1  048100         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1064.2 327 378
   000479         048200     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1064.2 380
   000480         048300     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1064.2 374 38 487
   000481         048400      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1064.2 329 IMP
   000482      1  048500          MOVE "NO " TO ERROR-TOTAL                               NC1064.2 378
   000483      1  048600      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1064.2 329 378
   000484         048700      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1064.2 380
   000485         048800      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1064.2 374 38 487
   000486         048900     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1064.2 382 38 487
   000487         049000 WRITE-LINE.                                                      NC1064.2
   000488         049100     ADD 1 TO RECORD-COUNT.                                       NC1064.2 334
   000489         049200     IF RECORD-COUNT GREATER 42                                   NC1064.2 334
   000490      1  049300         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1064.2 38 333
   000491      1  049400         MOVE SPACE TO DUMMY-RECORD                               NC1064.2 IMP 38
   000492      1  049500         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1064.2 38
   000493      1  049600         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1064.2 336 38 503
   000494      1  049700         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1064.2 341 38 503
   000495      1  049800         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1064.2 350 38 503
   000496      1  049900         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1064.2 362 38 503
   000497      1  050000         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1064.2 314 38 503
   000498      1  050100         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1064.2 319 38 503
   000499      1  050200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1064.2 406 38 503
   000500      1  050300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1064.2 333 38
   000501      1  050400         MOVE ZERO TO RECORD-COUNT.                               NC1064.2 IMP 334
   000502         050500     PERFORM WRT-LN.                                              NC1064.2 503
   000503         050600 WRT-LN.                                                          NC1064.2
   000504         050700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1064.2 38
   000505         050800     MOVE SPACE TO DUMMY-RECORD.                                  NC1064.2 IMP 38
   000506         050900 BLANK-LINE-PRINT.                                                NC1064.2
   000507         051000     PERFORM WRT-LN.                                              NC1064.2 503
   000508         051100 FAIL-ROUTINE.                                                    NC1064.2
   000509         051200     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1064.2 289 IMP
   000510      1  051300            GO TO FAIL-ROUTINE-WRITE.                             NC1064.2 517
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1064.2 303 IMP 517
   000512         051500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1064.2 335 405
   000513         051600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1064.2 400
   000514         051700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1064.2 397 38 487
   000515         051800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1064.2 IMP 405
   000516         051900     GO TO  FAIL-ROUTINE-EX.                                      NC1064.2 522
   000517         052000 FAIL-ROUTINE-WRITE.                                              NC1064.2
   000518         052100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1064.2 285 37 487
   000519         052200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1064.2 335 313
   000520         052300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1064.2 300 37 487
   000521         052400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1064.2 IMP 313
   000522         052500 FAIL-ROUTINE-EX. EXIT.                                           NC1064.2
   000523         052600 BAIL-OUT.                                                        NC1064.2
   000524         052700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1064.2 290 IMP 526
   000525         052800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1064.2 304 IMP 531
   000526         052900 BAIL-OUT-WRITE.                                                  NC1064.2
   000527         053000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1064.2 304 404 290 402
   000528         053100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1064.2 335 405
   000529         053200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1064.2 397 38 487
   000530         053300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1064.2 IMP 405
   000531         053400 BAIL-OUT-EX. EXIT.                                               NC1064.2
   000532         053500 CCVS1-EXIT.                                                      NC1064.2
   000533         053600     EXIT.                                                        NC1064.2
   000534         053700 SECT-NC106A-001 SECTION.                                         NC1064.2
   000535         053800 SUB-INIT-F1-1.                                                   NC1064.2
   000536         053900     MOVE "SUBTRACT" TO FEATURE.                                  NC1064.2 275
   000537         054000     MOVE "VI-134 6.25.4 GR1" TO ANSI-REFERENCE.                  NC1064.2 335
   000538         054100 SUB-TEST-F1-1.                                                   NC1064.2
   000539         054200     SUBTRACT 1 FROM N-5.                                         NC1064.2 220
   000540         054300     IF       N-5 EQUAL TO 0                                      NC1064.2 220
   000541      1  054400              PERFORM PASS                                        NC1064.2 429
   000542      1  054500              GO TO SUB-WRITE-F1-1.                               NC1064.2 551
   000543         054600     GO TO    SUB-FAIL-F1-1.                                      NC1064.2 547
   000544         054700 SUB-DELETE-F1-1.                                                 NC1064.2
   000545         054800     PERFORM  DE-LETE.                                            NC1064.2 431
   000546         054900     GO TO    SUB-WRITE-F1-1.                                     NC1064.2 551
   000547         055000 SUB-FAIL-F1-1.                                                   NC1064.2
   000548         055100     MOVE     N-5 TO COMPUTED-N.                                  NC1064.2 220 291
   000549         055200     MOVE     0 TO CORRECT-N.                                     NC1064.2 305
   000550         055300     PERFORM  FAIL.                                               NC1064.2 430
   000551         055400 SUB-WRITE-F1-1.                                                  NC1064.2
   000552         055500     MOVE "SUB-TEST-F1-1 " TO PAR-NAME.                           NC1064.2 279
   000553         055600     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000554         055700 SUB-TEST-F1-2.                                                   NC1064.2
   000555         055800     SUBTRACT N-17 FROM N-18 ROUNDED.                             NC1064.2 235 237
   000556         055900     IF       N-18 EQUAL TO -9                                    NC1064.2 237
   000557      1  056000              PERFORM PASS                                        NC1064.2 429
   000558      1  056100              GO TO SUB-WRITE-F1-2.                               NC1064.2 567
   000559         056200     GO TO    SUB-FAIL-F1-2.                                      NC1064.2 563
   000560         056300 SUB-DELETE-F1-2.                                                 NC1064.2
   000561         056400     PERFORM  DE-LETE.                                            NC1064.2 431
   000562         056500     GO TO    SUB-WRITE-F1-2.                                     NC1064.2 567
   000563         056600 SUB-FAIL-F1-2.                                                   NC1064.2
   000564         056700     MOVE     N-18 TO COMPUTED-N.                                 NC1064.2 237 291
   000565         056800     MOVE     -9 TO CORRECT-N.                                    NC1064.2 305
   000566         056900     PERFORM  FAIL.                                               NC1064.2 430
   000567         057000 SUB-WRITE-F1-2.                                                  NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE "SUB-TEST-F1-2 " TO PAR-NAME.                           NC1064.2 279
   000569         057200     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000570         057300 SUB-INIT-F1-3.                                                   NC1064.2
   000571         057400     MOVE     -00001 TO N-10.                                     NC1064.2 225
   000572         057500     MOVE      99999 TO N-13.                                     NC1064.2 229
   000573         057600 SUB-TEST-F1-3-0.                                                 NC1064.2
   000574         057700     SUBTRACT N-10 FROM N-13 ON SIZE ERROR                        NC1064.2 225 229
   000575      1  057800              PERFORM PASS                                        NC1064.2 429
   000576      1  057900              GO TO SUB-WRITE-F1-3-1.                             NC1064.2 585
   000577         058000     GO TO    SUB-FAIL-F1-3-1.                                    NC1064.2 581
   000578         058100 SUB-DELETE-F1-3-1.                                               NC1064.2
   000579         058200     PERFORM  DE-LETE.                                            NC1064.2 431
   000580         058300     GO TO    SUB-WRITE-F1-3-1.                                   NC1064.2 585
   000581         058400 SUB-FAIL-F1-3-1.                                                 NC1064.2
   000582         058500     MOVE     N-13 TO COMPUTED-N.                                 NC1064.2 229 291
   000583         058600     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1064.2 284
   000584         058700     PERFORM  FAIL.                                               NC1064.2 430
   000585         058800 SUB-WRITE-F1-3-1.                                                NC1064.2
   000586         058900     MOVE "SUB-TEST-F1-3-1 " TO PAR-NAME.                         NC1064.2 279
   000587         059000     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000588         059100 SUB-TEST-F1-3-2.                                                 NC1064.2
   000589         059200     IF       N-13 = 99999                                        NC1064.2 229
   000590      1  059300              PERFORM PASS                                        NC1064.2 429
   000591      1  059400              GO TO SUB-WRITE-F1-3-2.                             NC1064.2 601
   000592         059500     GO TO    SUB-FAIL-F1-3-2.                                    NC1064.2 596
   000593         059600 SUB-DELETE-F1-3-2.                                               NC1064.2
   000594         059700     PERFORM  DE-LETE.                                            NC1064.2 431
   000595         059800     GO TO    SUB-WRITE-F1-3-2.                                   NC1064.2 601
   000596         059900 SUB-FAIL-F1-3-2.                                                 NC1064.2
   000597         060000     MOVE     N-13  TO COMPUTED-N.                                NC1064.2 229 291
   000598         060100     MOVE     99999 TO CORRECT-N.                                 NC1064.2 305
   000599         060200     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC1064.2 284
   000600         060300     PERFORM  FAIL.                                               NC1064.2 430
   000601         060400 SUB-WRITE-F1-3-2.                                                NC1064.2
   000602         060500     MOVE "SUB-TEST-F1-3-2 " TO PAR-NAME.                         NC1064.2 279
   000603         060600     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000604         060700 SUB-INIT-F1-4-1.                                                 NC1064.2
   000605         060800     MOVE  -999999999 TO N-20.                                    NC1064.2 240
   000606         060900 SUB-TEST-F1-4-1.                                                 NC1064.2
   000607         061000     SUBTRACT .7 FROM N-20 ROUNDED ON SIZE ERROR                  NC1064.2 240
   000608      1  061100              PERFORM PASS                                        NC1064.2 429
   000609      1  061200              GO TO SUB-WRITE-F1-4-1.                             NC1064.2 619
   000610         061300     GO TO    SUB-FAIL-F1-4-1.                                    NC1064.2 614
   000611         061400 SUB-DELETE-F1-4-1.                                               NC1064.2
   000612         061500     PERFORM  DE-LETE.                                            NC1064.2 431
   000613         061600     GO TO    SUB-WRITE-F1-4-1.                                   NC1064.2 619
   000614         061700 SUB-FAIL-F1-4-1.                                                 NC1064.2
   000615         061800     MOVE     N-20 TO COMPUTED-N.                                 NC1064.2 240 291
   000616         061900     MOVE     -999999999 TO CORRECT-N.                            NC1064.2 305
   000617         062000     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1064.2 284
   000618         062100     PERFORM  FAIL.                                               NC1064.2 430
   000619         062200 SUB-WRITE-F1-4-1.                                                NC1064.2
   000620         062300     MOVE "SUB-TEST-F1-4-1 " TO PAR-NAME.                         NC1064.2 279
   000621         062400     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000622         062500 SUB-TEST-F1-4-2.                                                 NC1064.2
   000623         062600     IF       N-20 = -999999999                                   NC1064.2 240
   000624      1  062700              PERFORM PASS                                        NC1064.2 429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062800              GO TO SUB-WRITE-F1-4-2.                             NC1064.2 635
   000626         062900     GO TO    SUB-FAIL-F1-4-2.                                    NC1064.2 630
   000627         063000 SUB-DELETE-F1-4-2.                                               NC1064.2
   000628         063100     PERFORM  DE-LETE.                                            NC1064.2 431
   000629         063200     GO TO    SUB-WRITE-F1-4-2.                                   NC1064.2 635
   000630         063300 SUB-FAIL-F1-4-2.                                                 NC1064.2
   000631         063400     MOVE     N-20 TO COMPUTED-N.                                 NC1064.2 240 291
   000632         063500     MOVE     -999999999 TO CORRECT-N.                            NC1064.2 305
   000633         063600     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC1064.2 284
   000634         063700     PERFORM  FAIL.                                               NC1064.2 430
   000635         063800 SUB-WRITE-F1-4-2.                                                NC1064.2
   000636         063900     MOVE "SUB-TEST-F1-4-2 " TO PAR-NAME.                         NC1064.2 279
   000637         064000     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000638         064100 SUB-INIT-F1-5.                                                   NC1064.2
   000639         064200     MOVE     "SUBTRACT ---" TO FEATURE.                          NC1064.2 275
   000640         064300     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000641         064400     MOVE     "  FROM" TO FEATURE.                                NC1064.2 275
   000642         064500 SUB-TEST-F1-5.                                                   NC1064.2
   000643         064600     MOVE     A18TWOS-DS-18V00 TO WRK-DS-18V00.                   NC1064.2 129 141
   000644         064700     SUBTRACT A18ONES-DS-18V00 FROM WRK-DS-18V00.                 NC1064.2 131 141
   000645         064800     IF       WRK-DS-18V00 EQUAL TO 111111111111111111            NC1064.2 141
   000646      1  064900              PERFORM PASS GO TO SUB-WRITE-F1-5.                  NC1064.2 429 655
   000647         065000     GO       TO SUB-FAIL-F1-5.                                   NC1064.2 651
   000648         065100 SUB-DELETE-F1-5.                                                 NC1064.2
   000649         065200     PERFORM  DE-LETE.                                            NC1064.2 431
   000650         065300     GO       TO SUB-WRITE-F1-5.                                  NC1064.2 655
   000651         065400 SUB-FAIL-F1-5.                                                   NC1064.2
   000652         065500     MOVE     WRK-DS-18V00 TO COMPUTED-18V0.                      NC1064.2 141 297
   000653         065600     MOVE     111111111111111111 TO CORRECT-18V0.                 NC1064.2 310
   000654         065700     PERFORM  FAIL.                                               NC1064.2 430
   000655         065800 SUB-WRITE-F1-5.                                                  NC1064.2
   000656         065900     MOVE     "SUB-TEST-F1-5" TO PAR-NAME.                        NC1064.2 279
   000657         066000     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000658         066100 SUB-TEST-F1-6.                                                   NC1064.2
   000659         066200     MOVE     A12THREES-DS-06V06 TO WRK-DS-06V06.                 NC1064.2 145 147
   000660         066300     SUBTRACT A05ONES-DS-05V00                                    NC1064.2 136
   000661         066400              A05ONES-DS-00V05                                    NC1064.2 150
   000662         066500              A06ONES-DS-03V03 FROM WRK-DS-06V06.                 NC1064.2 163 147
   000663         066600     IF       WRK-DS-06V06 EQUAL TO 322111.111223                 NC1064.2 147
   000664      1  066700              PERFORM PASS GO TO SUB-WRITE-F1-6.                  NC1064.2 429 673
   000665         066800     GO       TO SUB-FAIL-F1-6.                                   NC1064.2 669
   000666         066900 SUB-DELETE-F1-6.                                                 NC1064.2
   000667         067000     PERFORM  DE-LETE.                                            NC1064.2 431
   000668         067100     GO       TO SUB-WRITE-F1-6.                                  NC1064.2 673
   000669         067200 SUB-FAIL-F1-6.                                                   NC1064.2
   000670         067300     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1064.2 147 291
   000671         067400     MOVE     322111.111223 TO CORRECT-N.                         NC1064.2 305
   000672         067500     PERFORM  FAIL.                                               NC1064.2 430
   000673         067600 SUB-WRITE-F1-6.                                                  NC1064.2
   000674         067700     MOVE     "SUB-TEST-F1-6" TO PAR-NAME.                        NC1064.2 279
   000675         067800     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000676         067900 SUB-INIT-F1-7.                                                   NC1064.2
   000677         068000     MOVE     "  ROUNDED" TO FEATURE.                             NC1064.2 275
   000678         068100 SUB-TEST-F1-7.                                                   NC1064.2
   000679         068200     MOVE     ZERO TO WRK-DS-0201P.                               NC1064.2 IMP 175
   000680         068300     SUBTRACT A99-DS-02V00 FROM WRK-DS-0201P ROUNDED.             NC1064.2 159 175
   000681         068400     IF       WRK-DS-0201P EQUAL TO -100                          NC1064.2 175
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682      1  068500              PERFORM PASS GO TO SUB-WRITE-F1-7.                  NC1064.2 429 691
   000683         068600     GO       TO SUB-FAIL-F1-7.                                   NC1064.2 687
   000684         068700 SUB-DELETE-F1-7.                                                 NC1064.2
   000685         068800     PERFORM  DE-LETE.                                            NC1064.2 431
   000686         068900     GO       TO SUB-WRITE-F1-7.                                  NC1064.2 691
   000687         069000 SUB-FAIL-F1-7.                                                   NC1064.2
   000688         069100     MOVE     WRK-DS-0201P TO COMPUTED-N.                         NC1064.2 175 291
   000689         069200     MOVE    -100 TO CORRECT-N.                                   NC1064.2 305
   000690         069300     PERFORM  FAIL.                                               NC1064.2 430
   000691         069400 SUB-WRITE-F1-7.                                                  NC1064.2
   000692         069500     MOVE     "SUB-TEST-F1-7" TO PAR-NAME.                        NC1064.2 279
   000693         069600     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000694         069700 SUB-INIT-F1-8-1.                                                 NC1064.2
   000695         069800     MOVE     "  SIZE ERROR" TO FEATURE.                          NC1064.2 275
   000696         069900     MOVE     -11 TO WRK-DS-02V00.                                NC1064.2 153
   000697         070000 SUB-TEST-F1-8-1.                                                 NC1064.2
   000698         070100     SUBTRACT A99-DS-02V00 FROM WRK-DS-02V00 ON SIZE ERROR        NC1064.2 159 153
   000699      1  070200              PERFORM PASS GO TO SUB-WRITE-F1-8-1.                NC1064.2 429 707
   000700         070300     GO       TO SUB-FAIL-F1-8-1.                                 NC1064.2 704
   000701         070400 SUB-DELETE-F1-8-1.                                               NC1064.2
   000702         070500     PERFORM  DE-LETE.                                            NC1064.2 431
   000703         070600     GO       TO SUB-WRITE-F1-8-1.                                NC1064.2 707
   000704         070700 SUB-FAIL-F1-8-1.                                                 NC1064.2
   000705         070800     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1064.2 284
   000706         070900     PERFORM  FAIL.                                               NC1064.2 430
   000707         071000 SUB-WRITE-F1-8-1.                                                NC1064.2
   000708         071100     MOVE     "SUB-TEST-F1-8-1" TO PAR-NAME.                      NC1064.2 279
   000709         071200     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000710         071300 SUB-TEST-F1-8-2.                                                 NC1064.2
   000711         071400     IF       WRK-DS-02V00 EQUAL TO -11                           NC1064.2 153
   000712      1  071500              PERFORM PASS GO TO SUB-WRITE-F1-8-2.                NC1064.2 429 723
   000713         071600*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F1-8-1   NC1064.2
   000714         071700     GO       TO SUB-FAIL-F1-8-2.                                 NC1064.2 718
   000715         071800 SUB-DELETE-F1-8-2.                                               NC1064.2
   000716         071900     PERFORM  DE-LETE.                                            NC1064.2 431
   000717         072000     GO       TO SUB-WRITE-F1-8-2.                                NC1064.2 723
   000718         072100 SUB-FAIL-F1-8-2.                                                 NC1064.2
   000719         072200     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1064.2 284
   000720         072300     MOVE     WRK-DS-02V00 TO COMPUTED-N.                         NC1064.2 153 291
   000721         072400     MOVE     -11 TO CORRECT-N.                                   NC1064.2 305
   000722         072500     PERFORM  FAIL.                                               NC1064.2 430
   000723         072600 SUB-WRITE-F1-8-2.                                                NC1064.2
   000724         072700     MOVE     "SUB-TEST-F1-8-2" TO PAR-NAME.                      NC1064.2 279
   000725         072800     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000726         072900 SUB-INIT-F1-9-1.                                                 NC1064.2
   000727         073000     MOVE     "  ROUNDED,SIZE ERROR" TO FEATURE.                  NC1064.2 275
   000728         073100 SUB-TEST-F1-9-1.                                                 NC1064.2
   000729         073200     MOVE     ZERO TO WRK-DS-05V00.                               NC1064.2 IMP 152
   000730         073300     SUBTRACT 33333                                               NC1064.2
   000731         073400              A06THREES-DS-03V03                                  NC1064.2 143
   000732         073500              A12THREES-DS-06V06                                  NC1064.2 145
   000733         073600              FROM WRK-DS-05V00 ROUNDED ON SIZE ERROR             NC1064.2 152
   000734      1  073700              PERFORM PASS GO TO SUB-WRITE-F1-9-1.                NC1064.2 429 742
   000735         073800     GO       TO SUB-FAIL-F1-9-1.                                 NC1064.2 739
   000736         073900 SUB-DELETE-F1-9-1.                                               NC1064.2
   000737         074000     PERFORM  DE-LETE.                                            NC1064.2 431
   000738         074100     GO       TO SUB-WRITE-F1-9-1.                                NC1064.2 742
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074200 SUB-FAIL-F1-9-1.                                                 NC1064.2
   000740         074300     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1064.2 284
   000741         074400     PERFORM  FAIL.                                               NC1064.2 430
   000742         074500 SUB-WRITE-F1-9-1.                                                NC1064.2
   000743         074600     MOVE     "SUB-TEST-F1-9-1" TO PAR-NAME.                      NC1064.2 279
   000744         074700     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000745         074800 SUB-TEST-F1-9-2.                                                 NC1064.2
   000746         074900     IF       WRK-DS-05V00 EQUAL TO ZERO                          NC1064.2 152 IMP
   000747      1  075000              PERFORM PASS GO TO SUB-WRITE-F1-9-2.                NC1064.2 429 758
   000748         075100*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F1-9-1   NC1064.2
   000749         075200     GO       TO SUB-FAIL-F1-9-2.                                 NC1064.2 753
   000750         075300 SUB-DELETE-F1-9-2.                                               NC1064.2
   000751         075400     PERFORM  DE-LETE.                                            NC1064.2 431
   000752         075500     GO       TO SUB-WRITE-F1-9-2.                                NC1064.2 758
   000753         075600 SUB-FAIL-F1-9-2.                                                 NC1064.2
   000754         075700     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1064.2 284
   000755         075800     MOVE     WRK-DS-05V00 TO COMPUTED-N.                         NC1064.2 152 291
   000756         075900     MOVE     ZERO TO CORRECT-N.                                  NC1064.2 IMP 305
   000757         076000     PERFORM  FAIL.                                               NC1064.2 430
   000758         076100 SUB-WRITE-F1-9-2.                                                NC1064.2
   000759         076200     MOVE     "SUB-TEST-F1-9-2" TO PAR-NAME.                      NC1064.2 279
   000760         076300     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000761         076400 SUB-INIT-F1-10.                                                  NC1064.2
   000762         076500     MOVE     ZERO TO WRK-DS-06V06.                               NC1064.2 IMP 147
   000763         076600 SUB-TEST-F1-10-1.                                                NC1064.2
   000764         076700     SUBTRACT A12THREES-DS-06V06                                  NC1064.2 145
   000765         076800              333333                                              NC1064.2
   000766         076900              A06THREES-DS-03V03                                  NC1064.2 143
   000767         077000              -0000009                                            NC1064.2
   000768         077100              FROM WRK-DS-06V06 ROUNDED ON SIZE ERROR             NC1064.2 147
   000769      1  077200              GO TO SUB-FAIL-F1-10-1.                             NC1064.2 775
   000770         077300     PERFORM  PASS.                                               NC1064.2 429
   000771         077400     GO       TO SUB-WRITE-F1-10-1.                               NC1064.2 778
   000772         077500 SUB-DELETE-F1-10-1.                                              NC1064.2
   000773         077600     PERFORM  DE-LETE.                                            NC1064.2 431
   000774         077700     GO       TO SUB-WRITE-F1-10-1.                               NC1064.2 778
   000775         077800 SUB-FAIL-F1-10-1.                                                NC1064.2
   000776         077900     MOVE     "SIZE ERR SHOULD NOT EXECUTE" TO RE-MARK.           NC1064.2 284
   000777         078000     PERFORM  FAIL.                                               NC1064.2 430
   000778         078100 SUB-WRITE-F1-10-1.                                               NC1064.2
   000779         078200     MOVE     "SUB-TEST-F1-10-1" TO PAR-NAME.                     NC1064.2 279
   000780         078300     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000781         078400 SUB-TEST-F1-10-2.                                                NC1064.2
   000782         078500     IF       WRK-DS-06V06 EQUAL TO -666990.666333                NC1064.2 147
   000783      1  078600              PERFORM PASS GO TO SUB-WRITE-F1-10-2.               NC1064.2 429 793
   000784         078700*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F1-10-1  NC1064.2
   000785         078800     GO       TO SUB-FAIL-F1-10-2.                                NC1064.2 789
   000786         078900 SUB-DELETE-F1-10-2.                                              NC1064.2
   000787         079000     PERFORM  DE-LETE.                                            NC1064.2 431
   000788         079100     GO       TO SUB-WRITE-F1-10-2.                               NC1064.2 793
   000789         079200 SUB-FAIL-F1-10-2.                                                NC1064.2
   000790         079300     MOVE     WRK-DS-06V06 TO COMPUTED-N.                         NC1064.2 147 291
   000791         079400     MOVE     -666990.666333 TO CORRECT-N.                        NC1064.2 305
   000792         079500     PERFORM  FAIL.                                               NC1064.2 430
   000793         079600 SUB-WRITE-F1-10-2.                                               NC1064.2
   000794         079700     MOVE     "SUB-TEST-F1-10-2" TO PAR-NAME.                     NC1064.2 279
   000795         079800     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         079900 SUB-INIT-F1-11.                                                  NC1064.2
   000797         080000     MOVE     "  COMP VS. DISPLAY" TO FEATURE.                    NC1064.2 275
   000798         080100 SUB-TEST-F1-11.                                                  NC1064.2
   000799         080200     MOVE     ZERO TO WRK-CS-18V00                                NC1064.2 IMP 169
   000800         080300     SUBTRACT A18ONES-DS-18V00 FROM WRK-CS-18V00.                 NC1064.2 131 169
   000801         080400     IF       WRK-CS-18V00 EQUAL TO -111111111111111111           NC1064.2 169
   000802      1  080500              PERFORM PASS GO TO SUB-WRITE-F1-11.                 NC1064.2 429 811
   000803         080600     GO       TO SUB-FAIL-F1-11.                                  NC1064.2 807
   000804         080700 SUB-DELETE-F1-11.                                                NC1064.2
   000805         080800     PERFORM  DE-LETE.                                            NC1064.2 431
   000806         080900     GO       TO SUB-WRITE-F1-11.                                 NC1064.2 811
   000807         081000 SUB-FAIL-F1-11.                                                  NC1064.2
   000808         081100     MOVE     WRK-CS-18V00 TO COMPUTED-18V0.                      NC1064.2 169 297
   000809         081200     MOVE     -111111111111111111 TO CORRECT-18V0.                NC1064.2 310
   000810         081300     PERFORM  FAIL.                                               NC1064.2 430
   000811         081400 SUB-WRITE-F1-11.                                                 NC1064.2
   000812         081500     MOVE     "SUB-TEST-F1-11" TO PAR-NAME.                       NC1064.2 279
   000813         081600     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000814         081700 SUB-TEST-F1-12.                                                  NC1064.2
   000815         081800     MOVE     ZERO TO WRK-DS-18V00.                               NC1064.2 IMP 141
   000816         081900     SUBTRACT A18ONES-CS-18V00 FROM WRK-DS-18V00.                 NC1064.2 170 141
   000817         082000     IF       WRK-DS-18V00 EQUAL TO -111111111111111111           NC1064.2 141
   000818      1  082100              PERFORM PASS GO TO SUB-WRITE-F1-12.                 NC1064.2 429 827
   000819         082200     GO       TO SUB-FAIL-F1-12.                                  NC1064.2 823
   000820         082300 SUB-DELETE-F1-12.                                                NC1064.2
   000821         082400     PERFORM  DE-LETE.                                            NC1064.2 431
   000822         082500     GO       TO SUB-WRITE-F1-12.                                 NC1064.2 827
   000823         082600 SUB-FAIL-F1-12.                                                  NC1064.2
   000824         082700     MOVE     WRK-DS-18V00 TO COMPUTED-18V0.                      NC1064.2 141 297
   000825         082800     MOVE     -111111111111111111 TO CORRECT-18V0.                NC1064.2 310
   000826         082900     PERFORM  FAIL.                                               NC1064.2 430
   000827         083000 SUB-WRITE-F1-12.                                                 NC1064.2
   000828         083100     MOVE     "SUB-TEST-F1-12" TO PAR-NAME.                       NC1064.2 279
   000829         083200     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000830         083300 SUB-TEST-F1-13.                                                  NC1064.2
   000831         083400     MOVE     ZERO TO WRK-CS-02V02.                               NC1064.2 IMP 172
   000832         083500     SUBTRACT A99-CS-02V00 FROM WRK-CS-02V02.                     NC1064.2 173 172
   000833         083600     IF       WRK-CS-02V02 EQUAL TO -99.00                        NC1064.2 172
   000834      1  083700              PERFORM PASS GO TO SUB-WRITE-F1-13.                 NC1064.2 429 843
   000835         083800     GO       TO SUB-FAIL-F1-13.                                  NC1064.2 839
   000836         083900 SUB-DELETE-F1-13.                                                NC1064.2
   000837         084000     PERFORM  DE-LETE.                                            NC1064.2 431
   000838         084100     GO       TO SUB-WRITE-F1-13.                                 NC1064.2 843
   000839         084200 SUB-FAIL-F1-13.                                                  NC1064.2
   000840         084300     MOVE     WRK-CS-02V02 TO COMPUTED-N.                         NC1064.2 172 291
   000841         084400     MOVE     -99.00 TO CORRECT-N.                                NC1064.2 305
   000842         084500     PERFORM  FAIL.                                               NC1064.2 430
   000843         084600 SUB-WRITE-F1-13.                                                 NC1064.2
   000844         084700     MOVE     "SUB-TEST-F1-13" TO PAR-NAME.                       NC1064.2 279
   000845         084800     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000846         084900 SUB-TEST-F1-14-1.                                                NC1064.2
   000847         085000     MOVE     A99-CS-02V00 TO WRK-CS-02V02.                       NC1064.2 173 172
   000848         085100     SUBTRACT -99 FROM WRK-CS-02V02 ON SIZE ERROR                 NC1064.2 172
   000849      1  085200              PERFORM PASS GO TO SUB-WRITE-F1-14-1.               NC1064.2 429 857
   000850         085300     GO       TO SUB-FAIL-F1-14-1.                                NC1064.2 854
   000851         085400 SUB-DELETE-F1-14-1.                                              NC1064.2
   000852         085500     PERFORM  DE-LETE.                                            NC1064.2 431
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085600     GO       TO SUB-WRITE-F1-14-1.                               NC1064.2 857
   000854         085700 SUB-FAIL-F1-14-1.                                                NC1064.2
   000855         085800     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1064.2 284
   000856         085900     PERFORM  FAIL.                                               NC1064.2 430
   000857         086000 SUB-WRITE-F1-14-1.                                               NC1064.2
   000858         086100     MOVE     "SUB-TEST-F1-14-1" TO PAR-NAME.                     NC1064.2 279
   000859         086200     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000860         086300 SUB-TEST-F1-14-2.                                                NC1064.2
   000861         086400     IF       WRK-CS-02V02 EQUAL TO 99                            NC1064.2 172
   000862      1  086500              PERFORM PASS GO TO SUB-WRITE-F1-14-2.               NC1064.2 429 873
   000863         086600*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F1-14-1  NC1064.2
   000864         086700     GO       TO SUB-FAIL-F1-14-2.                                NC1064.2 868
   000865         086800 SUB-DELETE-F1-14-2.                                              NC1064.2
   000866         086900     PERFORM  DE-LETE.                                            NC1064.2 431
   000867         087000     GO       TO SUB-WRITE-F1-14-2.                               NC1064.2 873
   000868         087100 SUB-FAIL-F1-14-2.                                                NC1064.2
   000869         087200     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1064.2 284
   000870         087300     MOVE     WRK-CS-02V02 TO COMPUTED-N.                         NC1064.2 172 291
   000871         087400     MOVE     99 TO CORRECT-N.                                    NC1064.2 305
   000872         087500     PERFORM  FAIL.                                               NC1064.2 430
   000873         087600 SUB-WRITE-F1-14-2.                                               NC1064.2
   000874         087700     MOVE     "SUB-TEST-F1-14-2" TO PAR-NAME.                     NC1064.2 279
   000875         087800     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000876         087900 SUB-TEST-F1-15.                                                  NC1064.2
   000877         088000     SUBTRACT SUBTR-1 SUBTR-3 FROM SUBTR-7.                       NC1064.2 207 209 213
   000878         088100     IF       SUBTR-7 EQUAL TO 99                                 NC1064.2 213
   000879      1  088200              PERFORM PASS GO TO SUB-WRITE-F1-15.                 NC1064.2 429 888
   000880         088300     GO       TO SUB-FAIL-F1-15.                                  NC1064.2 884
   000881         088400 SUB-DELETE-F1-15.                                                NC1064.2
   000882         088500     PERFORM DE-LETE.                                             NC1064.2 431
   000883         088600     GO       TO SUB-WRITE-F1-15.                                 NC1064.2 888
   000884         088700 SUB-FAIL-F1-15.                                                  NC1064.2
   000885         088800     MOVE     SUBTR-7 TO COMPUTED-N.                              NC1064.2 213 291
   000886         088900     MOVE     99        TO CORRECT-N.                             NC1064.2 305
   000887         089000     PERFORM FAIL.                                                NC1064.2 430
   000888         089100 SUB-WRITE-F1-15.                                                 NC1064.2
   000889         089200     MOVE     "SUB-TEST-F1-15" TO PAR-NAME.                       NC1064.2 279
   000890         089300     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   000891         089400 SUB-TEST-F1-16.                                                  NC1064.2
   000892         089500     SUBTRACT SUBTR-5 -98 SUBTR-3 -1 FROM SUBTR-10.               NC1064.2 211 209 215
   000893         089600     IF       SUBTR-10 EQUAL TO 100                               NC1064.2 215
   000894      1  089700              PERFORM PASS GO TO SUB-WRITE-F1-16.                 NC1064.2 429 903
   000895         089800     GO       TO SUB-FAIL-F1-16.                                  NC1064.2 899
   000896         089900 SUB-DELETE-F1-16.                                                NC1064.2
   000897         090000     PERFORM DE-LETE.                                             NC1064.2 431
   000898         090100     GO       TO SUB-WRITE-F1-16.                                 NC1064.2 903
   000899         090200 SUB-FAIL-F1-16.                                                  NC1064.2
   000900         090300     MOVE     SUBTR-10  TO COMPUTED-N.                            NC1064.2 215 291
   000901         090400     MOVE     100       TO CORRECT-N.                             NC1064.2 305
   000902         090500     PERFORM FAIL.                                                NC1064.2 430
   000903         090600 SUB-WRITE-F1-16.                                                 NC1064.2
   000904         090700     MOVE     "SUB-TEST-F1-16" TO PAR-NAME.                       NC1064.2 279
   000905         090800     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   000906         090900 SUB-TEST-F1-17.                                                  NC1064.2
   000907         091000     SUBTRACT SUBTR-4 FROM SUBTR-6 ROUNDED.                       NC1064.2 210 212
   000908         091100     IF       SUBTR-6 EQUAL TO 1                                  NC1064.2 212
   000909      1  091200              PERFORM PASS GO TO SUB-WRITE-F1-17.                 NC1064.2 429 918
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     GO       TO SUB-FAIL-F1-17.                                  NC1064.2 914
   000911         091400 SUB-DELETE-F1-17.                                                NC1064.2
   000912         091500     PERFORM DE-LETE.                                             NC1064.2 431
   000913         091600     GO       TO SUB-WRITE-F1-17.                                 NC1064.2 918
   000914         091700 SUB-FAIL-F1-17.                                                  NC1064.2
   000915         091800     MOVE     SUBTR-6   TO COMPUTED-N.                            NC1064.2 212 291
   000916         091900     MOVE     1         TO CORRECT-N.                             NC1064.2 305
   000917         092000     PERFORM FAIL.                                                NC1064.2 430
   000918         092100 SUB-WRITE-F1-17.                                                 NC1064.2
   000919         092200     MOVE     "SUB-TEST-F1-17" TO PAR-NAME.                       NC1064.2 279
   000920         092300     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   000921         092400 SUB-TEST-F1-18-1.                                                NC1064.2
   000922         092500     SUBTRACT .01 FROM SUBTR-8 ON SIZE ERROR                      NC1064.2 214
   000923      1  092600              PERFORM PASS GO TO SUB-WRITE-F1-18-1.               NC1064.2 429 931
   000924         092700     GO       TO SUB-FAIL-F1-18-1.                                NC1064.2 928
   000925         092800 SUB-DELETE-F1-18-1.                                              NC1064.2
   000926         092900     PERFORM DE-LETE.                                             NC1064.2 431
   000927         093000     GO       TO SUB-WRITE-F1-18-1.                               NC1064.2 931
   000928         093100 SUB-FAIL-F1-18-1.                                                NC1064.2
   000929         093200     MOVE     "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.            NC1064.2 284
   000930         093300     PERFORM FAIL.                                                NC1064.2 430
   000931         093400 SUB-WRITE-F1-18-1.                                               NC1064.2
   000932         093500     MOVE     "SUB-TEST-F1-18-1" TO PAR-NAME.                     NC1064.2 279
   000933         093600     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   000934         093700 SUB-TEST-F1-18-2.                                                NC1064.2
   000935         093800     IF       SUBTR-8 EQUAL TO -9.99                              NC1064.2 214
   000936      1  093900              PERFORM PASS GO TO SUB-WRITE-F1-18-2.               NC1064.2 429 947
   000937         094000*    NOTE: THIS TEST DEPENDS UPON THE RESULT OF SUB-TEST-F1-18-1  NC1064.2
   000938         094100     GO       TO SUB-FAIL-F1-18-2.                                NC1064.2 942
   000939         094200 SUB-DELETE-F1-18-2.                                              NC1064.2
   000940         094300     PERFORM DE-LETE.                                             NC1064.2 431
   000941         094400     GO       TO SUB-WRITE-F1-18-2.                               NC1064.2 947
   000942         094500 SUB-FAIL-F1-18-2.                                                NC1064.2
   000943         094600     MOVE    "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.         NC1064.2 284
   000944         094700     MOVE     SUBTR-8   TO COMPUTED-N.                            NC1064.2 214 291
   000945         094800     MOVE     -9.99     TO CORRECT-N.                             NC1064.2 305
   000946         094900     PERFORM FAIL.                                                NC1064.2 430
   000947         095000 SUB-WRITE-F1-18-2.                                               NC1064.2
   000948         095100     MOVE     "SUB-TEST-F1-18-2" TO PAR-NAME.                     NC1064.2 279
   000949         095200     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   000950         095300 SUB-TEST-F1-19.                                                  NC1064.2
   000951         095400     MOVE A18FIVES-CS-18V00 TO WRK-CS-18V00.                      NC1064.2 196 169
   000952         095500     SUBTRACT A18THREES-CS-18V00 FROM WRK-CS-18V00.               NC1064.2 203 169
   000953         095600     IF WRK-CS-18V00 EQUAL TO -222222222222222222                 NC1064.2 169
   000954      1  095700         PERFORM PASS                                             NC1064.2 429
   000955      1  095800         GO TO SUB-WRITE-F1-19.                                   NC1064.2 962
   000956         095900     MOVE WRK-CS-18V00 TO COMPUTED-18V0.                          NC1064.2 169 297
   000957         096000     MOVE -222222222222222222 TO CORRECT-18V0.                    NC1064.2 310
   000958         096100     PERFORM FAIL.                                                NC1064.2 430
   000959         096200     GO TO SUB-WRITE-F1-19.                                       NC1064.2 962
   000960         096300 SUB-DELETE-F1-19.                                                NC1064.2
   000961         096400     PERFORM DE-LETE.                                             NC1064.2 431
   000962         096500 SUB-WRITE-F1-19.                                                 NC1064.2
   000963         096600     MOVE "SUB-TEST-F1-19 " TO PAR-NAME.                          NC1064.2 279
   000964         096700     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   000965         096800 SUB-TEST-F1-20.                                                  NC1064.2
   000966         096900     MOVE     -980 TO WRK-CS-03V00.                               NC1064.2 205
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097000     MOVE     SPACE TO SIZE-ERR.                                  NC1064.2 IMP 125
   000968         097100*        NOTE IN THIS TEST, 1 IS SUBTRACTED FROM A 3-DIGIT COMP   NC1064.2
   000969         097200*             SYNC FIELD UNTIL A SIZE ERROR OCCURS --- IF THE     NC1064.2
   000970         097300*             VALUE OF THE FIELD REACHES -1180 WITHOUT A SIZE     NC1064.2
   000971         097400*             ERROR, THEN THE ATTEMPTED SUBTRACTIONS ARE STOPPED. NC1064.2
   000972         097500     PERFORM  SUB-A-F1-20 THRU SUB-B-F1-20 200 TIMES.             NC1064.2 988 992
   000973         097600     IF       SIZE-ERR EQUAL TO SPACE                             NC1064.2 125 IMP
   000974      1  097700              MOVE "SIZE ERROR NOT ENCOUNTERED" TO RE-MARK        NC1064.2 284
   000975      1  097800              MOVE "-1180 OR LESS" TO COMPUTED-A                  NC1064.2 290
   000976      1  097900              MOVE "-999 IN S999 FIELD" TO CORRECT-A              NC1064.2 304
   000977      1  098000              PERFORM FAIL                                        NC1064.2 430
   000978      1  098100              GO TO SUB-WRITE-F1-20.                              NC1064.2 994
   000979         098200     IF       WRK-CS-03V00 EQUAL TO -999                          NC1064.2 205
   000980      1  098300              PERFORM PASS GO TO SUB-WRITE-F1-20.                 NC1064.2 429 994
   000981         098400     PERFORM  FAIL.                                               NC1064.2 430
   000982         098500     MOVE     WRK-CS-03V00 TO COMPUTED-N.                         NC1064.2 205 291
   000983         098600     MOVE     -999 TO CORRECT-N.                                  NC1064.2 305
   000984         098700     GO       TO SUB-WRITE-F1-20.                                 NC1064.2 994
   000985         098800 SUB-DELETE-F1-20.                                                NC1064.2
   000986         098900     PERFORM  DE-LETE.                                            NC1064.2 431
   000987         099000     GO       TO SUB-WRITE-F1-20.                                 NC1064.2 994
   000988         099100 SUB-A-F1-20.                                                     NC1064.2
   000989         099200     IF       SIZE-ERR EQUAL TO "E" GO TO SUB-B-F1-20.            NC1064.2 125 992
   000990         099300     SUBTRACT 1 FROM WRK-CS-03V00 ON SIZE ERROR                   NC1064.2 205
   000991      1  099400              MOVE "E" TO SIZE-ERR.                               NC1064.2 125
   000992         099500 SUB-B-F1-20.                                                     NC1064.2
   000993         099600     EXIT.                                                        NC1064.2
   000994         099700 SUB-WRITE-F1-20.                                                 NC1064.2
   000995         099800     MOVE     "SUBT, COMP, SIZE ERR" TO FEATURE.                  NC1064.2 275
   000996         099900     MOVE     "SUB-TEST-F1-20" TO PAR-NAME.                       NC1064.2 279
   000997         100000     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   000998         100100*                                                                 NC1064.2
   000999         100200 SUB-INIT-F1-21.                                                  NC1064.2
   001000         100300*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1064.2
   001001         100400     MOVE     "VI-67 6.4.2" TO ANSI-REFERENCE.                    NC1064.2 335
   001002         100500     MOVE     -11 TO WRK-DS-02V00.                                NC1064.2 153
   001003         100600 SUB-TEST-F1-21.                                                  NC1064.2
   001004         100700     SUBTRACT A99-DS-02V00 FROM WRK-DS-02V00                      NC1064.2 159 153
   001005         100800          NOT ON SIZE ERROR                                       NC1064.2
   001006      1  100900              GO TO SUB-FAIL-F1-21.                               NC1064.2 1011
   001007         101000     PERFORM  PASS GO TO SUB-WRITE-F1-21.                         NC1064.2 429 1014
   001008         101100 SUB-DELETE-F1-21.                                                NC1064.2
   001009         101200     PERFORM  DE-LETE.                                            NC1064.2 431
   001010         101300     GO       TO SUB-WRITE-F1-21.                                 NC1064.2 1014
   001011         101400 SUB-FAIL-F1-21.                                                  NC1064.2
   001012         101500     MOVE  "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED" TO RE-MARK. NC1064.2 284
   001013         101600     PERFORM  FAIL.                                               NC1064.2 430
   001014         101700 SUB-WRITE-F1-21.                                                 NC1064.2
   001015         101800     MOVE     "SUB-TEST-F1-21" TO PAR-NAME.                       NC1064.2 279
   001016         101900     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   001017         102000*                                                                 NC1064.2
   001018         102100 SUB-INIT-F1-22.                                                  NC1064.2
   001019         102200*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1064.2
   001020         102300     MOVE     "VI-67 6.4.2" TO ANSI-REFERENCE.                    NC1064.2 335
   001021         102400     MOVE     ZERO TO WRK-DS-06V06.                               NC1064.2 IMP 147
   001022         102500 SUB-TEST-F1-22.                                                  NC1064.2
   001023         102600     SUBTRACT A12THREES-DS-06V06                                  NC1064.2 145
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102700              333333                                              NC1064.2
   001025         102800              A06THREES-DS-03V03                                  NC1064.2 143
   001026         102900              -0000009                                            NC1064.2
   001027         103000              FROM WRK-DS-06V06 ROUNDED                           NC1064.2 147
   001028         103100          NOT ON SIZE ERROR                                       NC1064.2
   001029      1  103200              PERFORM PASS                                        NC1064.2 429
   001030      1  103300              GO TO   SUB-WRITE-F1-22.                            NC1064.2 1038
   001031         103400     GO TO    SUB-FAIL-F1-22.                                     NC1064.2 1035
   001032         103500 SUB-DELETE-F1-22.                                                NC1064.2
   001033         103600     PERFORM  DE-LETE.                                            NC1064.2 431
   001034         103700     GO       TO SUB-WRITE-F1-22.                                 NC1064.2 1038
   001035         103800 SUB-FAIL-F1-22.                                                  NC1064.2
   001036         103900     MOVE     "NOT ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.  NC1064.2 284
   001037         104000     PERFORM  FAIL.                                               NC1064.2 430
   001038         104100 SUB-WRITE-F1-22.                                                 NC1064.2
   001039         104200     MOVE     "SUB-TEST-F1-22" TO PAR-NAME.                       NC1064.2 279
   001040         104300     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   001041         104400*                                                                 NC1064.2
   001042         104500 SUB-INIT-F1-23.                                                  NC1064.2
   001043         104600*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1064.2
   001044         104700     MOVE     "VI-67 6.4.2" TO ANSI-REFERENCE.                    NC1064.2 335
   001045         104800     MOVE     -11 TO WRK-DS-02V00.                                NC1064.2 153
   001046         104900 SUB-TEST-F1-23.                                                  NC1064.2
   001047         105000     SUBTRACT A99-DS-02V00 FROM WRK-DS-02V00                      NC1064.2 159 153
   001048         105100              ON SIZE ERROR                                       NC1064.2
   001049      1  105200              PERFORM  PASS GO TO SUB-WRITE-F1-23                 NC1064.2 429 1058
   001050         105300          NOT ON SIZE ERROR                                       NC1064.2
   001051      1  105400              GO TO SUB-FAIL-F1-23.                               NC1064.2 1055
   001052         105500 SUB-DELETE-F1-23.                                                NC1064.2
   001053         105600     PERFORM  DE-LETE.                                            NC1064.2 431
   001054         105700     GO       TO SUB-WRITE-F1-23.                                 NC1064.2 1058
   001055         105800 SUB-FAIL-F1-23.                                                  NC1064.2
   001056         105900     MOVE  "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.         NC1064.2 284
   001057         106000     PERFORM  FAIL.                                               NC1064.2 430
   001058         106100 SUB-WRITE-F1-23.                                                 NC1064.2
   001059         106200     MOVE     "SUB-TEST-F1-23" TO PAR-NAME.                       NC1064.2 279
   001060         106300     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   001061         106400*                                                                 NC1064.2
   001062         106500 SUB-INIT-F1-24.                                                  NC1064.2
   001063         106600*    ==-->  NEW SIZE ERROR TESTS  <--==                           NC1064.2
   001064         106700     MOVE     "VI-67 6.4.2" TO ANSI-REFERENCE.                    NC1064.2 335
   001065         106800     MOVE     ZERO TO WRK-DS-06V06.                               NC1064.2 IMP 147
   001066         106900 SUB-TEST-F1-24.                                                  NC1064.2
   001067         107000     SUBTRACT A12THREES-DS-06V06                                  NC1064.2 145
   001068         107100              333333                                              NC1064.2
   001069         107200              A06THREES-DS-03V03                                  NC1064.2 143
   001070         107300              -0000009                                            NC1064.2
   001071         107400              FROM WRK-DS-06V06 ROUNDED                           NC1064.2 147
   001072         107500              ON SIZE ERROR                                       NC1064.2
   001073      1  107600              GO TO    SUB-FAIL-F1-24                             NC1064.2 1080
   001074         107700          NOT ON SIZE ERROR                                       NC1064.2
   001075      1  107800              PERFORM PASS                                        NC1064.2 429
   001076      1  107900              GO TO    SUB-WRITE-F1-24.                           NC1064.2 1083
   001077         108000 SUB-DELETE-F1-24.                                                NC1064.2
   001078         108100     PERFORM  DE-LETE.                                            NC1064.2 431
   001079         108200     GO       TO SUB-WRITE-F1-24.                                 NC1064.2 1083
   001080         108300 SUB-FAIL-F1-24.                                                  NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400     MOVE     "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.      NC1064.2 284
   001082         108500     PERFORM  FAIL.                                               NC1064.2 430
   001083         108600 SUB-WRITE-F1-24.                                                 NC1064.2
   001084         108700     MOVE     "SUB-TEST-F1-24" TO PAR-NAME.                       NC1064.2 279
   001085         108800     PERFORM  PRINT-DETAIL.                                       NC1064.2 433
   001086         108900*                                                                 NC1064.2
   001087         109000 SUB-INIT-F1-25.                                                  NC1064.2
   001088         109100*    ==-->  MULTIPLE OPERANDS  <--==                              NC1064.2
   001089         109200     MOVE "VI-67 6.4.2" TO ANSI-REFERENCE.                        NC1064.2 335
   001090         109300     MOVE "SUBTR LIMIT TESTS " TO FEATURE.                        NC1064.2 275
   001091         109400     MOVE  1 TO DNAME1   DNAME2   DNAME3   DNAME4   DNAME5.       NC1064.2 83 84 85 86 87
   001092         109500     MOVE  1 TO DNAME6   DNAME7   DNAME8   DNAME9   DNAME10.      NC1064.2 88 89 90 91 92
   001093         109600     MOVE  1 TO DNAME11  DNAME12  DNAME13  DNAME14  DNAME14.      NC1064.2 93 94 95 96 96
   001094         109700     MOVE  1 TO DNAME16  DNAME17  DNAME18  DNAME19  DNAME20.      NC1064.2 98 99 100 101 102
   001095         109800     MOVE  1 TO DNAME21.                                          NC1064.2 103
   001096         109900     MOVE 21 TO DNAME22  DNAME23  DNAME24  DNAME25  DNAME26.      NC1064.2 104 105 106 107 108
   001097         110000     MOVE 21 TO DNAME27  DNAME28  DNAME29  DNAME30  DNAME31.      NC1064.2 109 110 111 112 113
   001098         110100     MOVE 21 TO DNAME32  DNAME33  DNAME34  DNAME35  DNAME36.      NC1064.2 114 115 116 117 118
   001099         110200     MOVE 21 TO DNAME37  DNAME38  DNAME39  DNAME40  DNAME41.      NC1064.2 119 120 121 122 123
   001100         110300     MOVE 21 TO DNAME42.                                          NC1064.2 124
   001101         110400*    THE FOLLOWING 22 TESTS VERIFY THE ABILITY OF THE COMPILER    NC1064.2
   001102         110500*    TO HANDLE A MAXIMUM OF 42 OPERANDS IN A SUBTRACT STATEMENT.  NC1064.2
   001103         110600*    A DELETION IN THIS PARAGRAPH WILL SKIP THE LIMIT TESTS.      NC1064.2
   001104         110700     GO TO SUB-TEST-F1-25-0.                                      NC1064.2 1112
   001105         110800 SUB-DELETE-F1-25-0.                                              NC1064.2
   001106         110900     PERFORM DE-LETE.                                             NC1064.2 431
   001107         111000     MOVE "SUB-TEST-F1-25 - 26 " TO PAR-NAME.                     NC1064.2 279
   001108         111100     MOVE "SUBTR LIMITS TESTS " TO FEATURE.                       NC1064.2 275
   001109         111200     ADD 21 TO DELETE-COUNTER.                                    NC1064.2 327
   001110         111300     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001111         111400     GO TO SUB-INIT-F1-26.                                        NC1064.2 1148
   001112         111500 SUB-TEST-F1-25-0.                                                NC1064.2
   001113         111600     SUBTRACT DNAME1                                              NC1064.2 83
   001114         111700              DNAME2                                              NC1064.2 84
   001115         111800              DNAME3                                              NC1064.2 85
   001116         111900              DNAME4                                              NC1064.2 86
   001117         112000              DNAME5                                              NC1064.2 87
   001118         112100              DNAME6                                              NC1064.2 88
   001119         112200              DNAME7                                              NC1064.2 89
   001120         112300              DNAME8                                              NC1064.2 90
   001121         112400              DNAME9                                              NC1064.2 91
   001122         112500              DNAME10                                             NC1064.2 92
   001123         112600              DNAME11                                             NC1064.2 93
   001124         112700              DNAME12                                             NC1064.2 94
   001125         112800              DNAME13                                             NC1064.2 95
   001126         112900              DNAME14                                             NC1064.2 96
   001127         113000              DNAME15                                             NC1064.2 97
   001128         113100              DNAME16                                             NC1064.2 98
   001129         113200              DNAME17                                             NC1064.2 99
   001130         113300              DNAME18                                             NC1064.2 100
   001131         113400              DNAME19                                             NC1064.2 101
   001132         113500              DNAME20                                             NC1064.2 102
   001133         113600              DNAME21                                             NC1064.2 103
   001134         113700         FROM DNAME22.                                            NC1064.2 104
   001135         113800 SUB-TEST-F1-25-1.                                                NC1064.2
   001136         113900     IF DNAME22 EQUAL TO ZERO                                     NC1064.2 104 IMP
   001137      1  114000         PERFORM PASS                                             NC1064.2 429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114100         GO TO SUB-WRITE-F1-25.                                   NC1064.2 1145
   001139         114200     MOVE DNAME22 TO COMPUTED-18V0.                               NC1064.2 104 297
   001140         114300     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001141         114400     PERFORM FAIL.                                                NC1064.2 430
   001142         114500     GO TO SUB-WRITE-F1-25.                                       NC1064.2 1145
   001143         114600 SUB-DELETE-F1-25.                                                NC1064.2
   001144         114700     PERFORM DE-LETE.                                             NC1064.2 431
   001145         114800 SUB-WRITE-F1-25.                                                 NC1064.2
   001146         114900     MOVE   "SUB-TEST-F1-25" TO PAR-NAME.                         NC1064.2 279
   001147         115000     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001148         115100 SUB-INIT-F1-26.                                                  NC1064.2
   001149         115200     MOVE 21 TO DNAME22  DNAME23  DNAME24  DNAME25  DNAME26.      NC1064.2 104 105 106 107 108
   001150         115300     MOVE 21 TO DNAME27  DNAME28  DNAME29  DNAME30  DNAME31.      NC1064.2 109 110 111 112 113
   001151         115400     MOVE 21 TO DNAME32  DNAME33  DNAME34  DNAME35  DNAME36.      NC1064.2 114 115 116 117 118
   001152         115500     MOVE 21 TO DNAME37  DNAME38  DNAME39  DNAME40  DNAME41.      NC1064.2 119 120 121 122 123
   001153         115600     MOVE 21 TO DNAME42.                                          NC1064.2 124
   001154         115700 SUB-TEST-F1-26-0.                                                NC1064.2
   001155         115800     SUBTRACT DNAME1                                              NC1064.2 83
   001156         115900              DNAME2                                              NC1064.2 84
   001157         116000              DNAME3                                              NC1064.2 85
   001158         116100              DNAME4                                              NC1064.2 86
   001159         116200              DNAME5                                              NC1064.2 87
   001160         116300              DNAME6                                              NC1064.2 88
   001161         116400              DNAME7                                              NC1064.2 89
   001162         116500              DNAME8                                              NC1064.2 90
   001163         116600              DNAME9                                              NC1064.2 91
   001164         116700              DNAME10                                             NC1064.2 92
   001165         116800              DNAME11                                             NC1064.2 93
   001166         116900              DNAME12                                             NC1064.2 94
   001167         117000              DNAME13                                             NC1064.2 95
   001168         117100              DNAME14                                             NC1064.2 96
   001169         117200              DNAME15                                             NC1064.2 97
   001170         117300              DNAME16                                             NC1064.2 98
   001171         117400              DNAME17                                             NC1064.2 99
   001172         117500              DNAME18                                             NC1064.2 100
   001173         117600              DNAME19                                             NC1064.2 101
   001174         117700              DNAME20                                             NC1064.2 102
   001175         117800              DNAME21                                             NC1064.2 103
   001176         117900         FROM DNAME22                                             NC1064.2 104
   001177         118000              DNAME23                                             NC1064.2 105
   001178         118100              DNAME24                                             NC1064.2 106
   001179         118200              DNAME25                                             NC1064.2 107
   001180         118300              DNAME26                                             NC1064.2 108
   001181         118400              DNAME27                                             NC1064.2 109
   001182         118500              DNAME28                                             NC1064.2 110
   001183         118600              DNAME29                                             NC1064.2 111
   001184         118700              DNAME30                                             NC1064.2 112
   001185         118800              DNAME31                                             NC1064.2 113
   001186         118900              DNAME32                                             NC1064.2 114
   001187         119000              DNAME33                                             NC1064.2 115
   001188         119100              DNAME34                                             NC1064.2 116
   001189         119200              DNAME35                                             NC1064.2 117
   001190         119300              DNAME36                                             NC1064.2 118
   001191         119400              DNAME37                                             NC1064.2 119
   001192         119500              DNAME38                                             NC1064.2 120
   001193         119600              DNAME39                                             NC1064.2 121
   001194         119700              DNAME40                                             NC1064.2 122
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800              DNAME41                                             NC1064.2 123
   001196         119900              DNAME42.                                            NC1064.2 124
   001197         120000 SUB-TEST-F1-26-1.                                                NC1064.2
   001198         120100     IF DNAME22 EQUAL TO ZERO                                     NC1064.2 104 IMP
   001199      1  120200         PERFORM PASS                                             NC1064.2 429
   001200      1  120300         GO TO SUB-WRITE-F1-26-1.                                 NC1064.2 1207
   001201         120400     MOVE DNAME22 TO COMPUTED-18V0.                               NC1064.2 104 297
   001202         120500     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001203         120600     PERFORM FAIL.                                                NC1064.2 430
   001204         120700     GO TO SUB-WRITE-F1-26-1.                                     NC1064.2 1207
   001205         120800 SUB-DELETE-F1-26-1.                                              NC1064.2
   001206         120900     PERFORM DE-LETE.                                             NC1064.2 431
   001207         121000 SUB-WRITE-F1-26-1.                                               NC1064.2
   001208         121100     MOVE "SUB-TEST-F1-26-1" TO PAR-NAME.                         NC1064.2 279
   001209         121200     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001210         121300 SUB-TEST-F1-26-2.                                                NC1064.2
   001211         121400     IF DNAME23 EQUAL TO ZERO                                     NC1064.2 105 IMP
   001212      1  121500         PERFORM PASS                                             NC1064.2 429
   001213      1  121600         GO TO SUB-WRITE-F1-26-2.                                 NC1064.2 1220
   001214         121700     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001215         121800     MOVE DNAME23 TO COMPUTED-18V0.                               NC1064.2 105 297
   001216         121900     PERFORM FAIL.                                                NC1064.2 430
   001217         122000     GO TO SUB-WRITE-F1-26-2.                                     NC1064.2 1220
   001218         122100 SUB-DELETE-F1-26-2.                                              NC1064.2
   001219         122200     PERFORM DE-LETE.                                             NC1064.2 431
   001220         122300 SUB-WRITE-F1-26-2.                                               NC1064.2
   001221         122400     MOVE "SUB-TEST-F1-26-2 " TO PAR-NAME.                        NC1064.2 279
   001222         122500     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001223         122600 SUB-TEST-F1-26-3.                                                NC1064.2
   001224         122700     IF DNAME24 EQUAL TO ZERO                                     NC1064.2 106 IMP
   001225      1  122800         PERFORM PASS                                             NC1064.2 429
   001226      1  122900         GO TO SUB-WRITE-F1-26-3.                                 NC1064.2 1233
   001227         123000     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001228         123100     MOVE DNAME24 TO COMPUTED-18V0.                               NC1064.2 106 297
   001229         123200     PERFORM FAIL.                                                NC1064.2 430
   001230         123300     GO TO SUB-WRITE-F1-26-3.                                     NC1064.2 1233
   001231         123400 SUB-DELETE-F1-26-3.                                              NC1064.2
   001232         123500     PERFORM DE-LETE.                                             NC1064.2 431
   001233         123600 SUB-WRITE-F1-26-3.                                               NC1064.2
   001234         123700     MOVE "SUB-TEST-F1-26-3 " TO PAR-NAME.                        NC1064.2 279
   001235         123800     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001236         123900 SUB-TEST-F1-26-4.                                                NC1064.2
   001237         124000     IF DNAME25 EQUAL TO ZERO                                     NC1064.2 107 IMP
   001238      1  124100         PERFORM PASS                                             NC1064.2 429
   001239      1  124200         GO TO SUB-WRITE-F1-26-4.                                 NC1064.2 1246
   001240         124300     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001241         124400     MOVE DNAME25 TO COMPUTED-18V0.                               NC1064.2 107 297
   001242         124500     PERFORM FAIL.                                                NC1064.2 430
   001243         124600     GO TO SUB-WRITE-F1-26-4.                                     NC1064.2 1246
   001244         124700 SUB-DELETE-F1-26-4.                                              NC1064.2
   001245         124800     PERFORM DE-LETE.                                             NC1064.2 431
   001246         124900 SUB-WRITE-F1-26-4.                                               NC1064.2
   001247         125000     MOVE "SUB-TEST-F1-26-4 " TO PAR-NAME.                        NC1064.2 279
   001248         125100     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001249         125200 SUB-TEST-F1-26-5.                                                NC1064.2
   001250         125300     IF DNAME26 EQUAL TO ZERO                                     NC1064.2 108 IMP
   001251      1  125400         PERFORM PASS                                             NC1064.2 429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252      1  125500         GO TO SUB-WRITE-F1-26-5.                                 NC1064.2 1259
   001253         125600     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001254         125700     MOVE DNAME26 TO COMPUTED-18V0.                               NC1064.2 108 297
   001255         125800     PERFORM FAIL.                                                NC1064.2 430
   001256         125900     GO TO SUB-WRITE-F1-26-5.                                     NC1064.2 1259
   001257         126000 SUB-DELETE-F1-26-5.                                              NC1064.2
   001258         126100     PERFORM DE-LETE.                                             NC1064.2 431
   001259         126200 SUB-WRITE-F1-26-5.                                               NC1064.2
   001260         126300     MOVE "SUB-TEST-F1-26-5 " TO PAR-NAME.                        NC1064.2 279
   001261         126400     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001262         126500 SUB-TEST-F1-26-6.                                                NC1064.2
   001263         126600     IF DNAME27 EQUAL TO ZERO                                     NC1064.2 109 IMP
   001264      1  126700         PERFORM PASS                                             NC1064.2 429
   001265      1  126800         GO TO SUB-WRITE-F1-26-6.                                 NC1064.2 1272
   001266         126900     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001267         127000     MOVE DNAME27 TO COMPUTED-18V0.                               NC1064.2 109 297
   001268         127100     PERFORM FAIL.                                                NC1064.2 430
   001269         127200     GO TO SUB-WRITE-F1-26-6.                                     NC1064.2 1272
   001270         127300 SUB-DELETE-F1-26-6.                                              NC1064.2
   001271         127400     PERFORM DE-LETE.                                             NC1064.2 431
   001272         127500 SUB-WRITE-F1-26-6.                                               NC1064.2
   001273         127600     MOVE "SUB-TEST-F1-26-6 " TO PAR-NAME.                        NC1064.2 279
   001274         127700     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001275         127800 SUB-TEST-F1-26-7.                                                NC1064.2
   001276         127900     IF DNAME28 EQUAL TO ZERO                                     NC1064.2 110 IMP
   001277      1  128000         PERFORM PASS                                             NC1064.2 429
   001278      1  128100         GO TO SUB-WRITE-F1-26-7.                                 NC1064.2 1285
   001279         128200     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001280         128300     MOVE DNAME28 TO COMPUTED-18V0.                               NC1064.2 110 297
   001281         128400     PERFORM FAIL.                                                NC1064.2 430
   001282         128500     GO TO SUB-WRITE-F1-26-7.                                     NC1064.2 1285
   001283         128600 SUB-DELETE-F1-26-7.                                              NC1064.2
   001284         128700     PERFORM DE-LETE.                                             NC1064.2 431
   001285         128800 SUB-WRITE-F1-26-7.                                               NC1064.2
   001286         128900     MOVE "SUB-TEST-F1-26-7 " TO PAR-NAME.                        NC1064.2 279
   001287         129000     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001288         129100 SUB-TEST-F1-26-8.                                                NC1064.2
   001289         129200     IF DNAME29 EQUAL TO ZERO                                     NC1064.2 111 IMP
   001290      1  129300         PERFORM PASS                                             NC1064.2 429
   001291      1  129400         GO TO SUB-WRITE-F1-26-8.                                 NC1064.2 1298
   001292         129500     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001293         129600     MOVE DNAME29 TO COMPUTED-18V0.                               NC1064.2 111 297
   001294         129700     PERFORM FAIL.                                                NC1064.2 430
   001295         129800     GO TO SUB-WRITE-F1-26-8.                                     NC1064.2 1298
   001296         129900 SUB-DELETE-F1-26-8.                                              NC1064.2
   001297         130000     PERFORM DE-LETE.                                             NC1064.2 431
   001298         130100 SUB-WRITE-F1-26-8.                                               NC1064.2
   001299         130200     MOVE "SUB-TEST-F1-26-8 " TO PAR-NAME.                        NC1064.2 279
   001300         130300     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001301         130400 SUB-TEST-F1-26-9.                                                NC1064.2
   001302         130500     IF DNAME30 EQUAL TO ZERO                                     NC1064.2 112 IMP
   001303      1  130600         PERFORM PASS                                             NC1064.2 429
   001304      1  130700         GO TO SUB-WRITE-F1-26-9.                                 NC1064.2 1311
   001305         130800     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001306         130900     MOVE DNAME30 TO COMPUTED-18V0.                               NC1064.2 112 297
   001307         131000     PERFORM FAIL.                                                NC1064.2 430
   001308         131100     GO TO SUB-WRITE-F1-26-9.                                     NC1064.2 1311
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131200 SUB-DELETE-F1-26-9.                                              NC1064.2
   001310         131300     PERFORM DE-LETE.                                             NC1064.2 431
   001311         131400 SUB-WRITE-F1-26-9.                                               NC1064.2
   001312         131500     MOVE "SUB-TEST-F1-26-9 " TO PAR-NAME.                        NC1064.2 279
   001313         131600     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001314         131700 SUB-TEST-F1-26-10.                                               NC1064.2
   001315         131800     IF DNAME31 EQUAL TO ZERO                                     NC1064.2 113 IMP
   001316      1  131900         PERFORM PASS                                             NC1064.2 429
   001317      1  132000         GO TO SUB-WRITE-F1-26-10.                                NC1064.2 1324
   001318         132100     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001319         132200     MOVE DNAME31 TO COMPUTED-18V0.                               NC1064.2 113 297
   001320         132300     PERFORM FAIL.                                                NC1064.2 430
   001321         132400     GO TO SUB-WRITE-F1-26-10.                                    NC1064.2 1324
   001322         132500 SUB-DELETE-F1-26-10.                                             NC1064.2
   001323         132600     PERFORM DE-LETE.                                             NC1064.2 431
   001324         132700 SUB-WRITE-F1-26-10.                                              NC1064.2
   001325         132800     MOVE "SUB-TEST-F1-26-10 " TO PAR-NAME.                       NC1064.2 279
   001326         132900     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001327         133000 SUB-TEST-F1-26-11.                                               NC1064.2
   001328         133100     IF DNAME32 EQUAL TO ZERO                                     NC1064.2 114 IMP
   001329      1  133200         PERFORM PASS                                             NC1064.2 429
   001330      1  133300         GO TO SUB-WRITE-F1-26-11.                                NC1064.2 1337
   001331         133400     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001332         133500     MOVE DNAME32 TO COMPUTED-18V0.                               NC1064.2 114 297
   001333         133600     PERFORM FAIL.                                                NC1064.2 430
   001334         133700     GO TO SUB-WRITE-F1-26-11.                                    NC1064.2 1337
   001335         133800 SUB-DELETE-F1-26-11.                                             NC1064.2
   001336         133900     PERFORM DE-LETE.                                             NC1064.2 431
   001337         134000 SUB-WRITE-F1-26-11.                                              NC1064.2
   001338         134100     MOVE "SUB-TEST-F1-26-11 " TO PAR-NAME.                       NC1064.2 279
   001339         134200     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001340         134300 SUB-TEST-F1-26-12.                                               NC1064.2
   001341         134400     IF DNAME33 EQUAL TO ZERO                                     NC1064.2 115 IMP
   001342      1  134500         PERFORM PASS                                             NC1064.2 429
   001343      1  134600         GO TO SUB-WRITE-F1-26-12.                                NC1064.2 1350
   001344         134700     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001345         134800     MOVE DNAME33 TO COMPUTED-18V0.                               NC1064.2 115 297
   001346         134900     PERFORM FAIL.                                                NC1064.2 430
   001347         135000     GO TO SUB-WRITE-F1-26-12.                                    NC1064.2 1350
   001348         135100 SUB-DELETE-F1-26-12.                                             NC1064.2
   001349         135200     PERFORM DE-LETE.                                             NC1064.2 431
   001350         135300 SUB-WRITE-F1-26-12.                                              NC1064.2
   001351         135400     MOVE "SUB-TEST-F1-26-12 " TO PAR-NAME.                       NC1064.2 279
   001352         135500     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001353         135600 SUB-TEST-F1-26-13.                                               NC1064.2
   001354         135700     IF DNAME34 EQUAL TO ZERO                                     NC1064.2 116 IMP
   001355      1  135800         PERFORM PASS                                             NC1064.2 429
   001356      1  135900         GO TO SUB-WRITE-F1-26-13.                                NC1064.2 1363
   001357         136000     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001358         136100     MOVE DNAME34 TO COMPUTED-18V0.                               NC1064.2 116 297
   001359         136200     PERFORM FAIL.                                                NC1064.2 430
   001360         136300     GO TO SUB-WRITE-F1-26-13.                                    NC1064.2 1363
   001361         136400 SUB-DELETE-F1-26-13.                                             NC1064.2
   001362         136500     PERFORM DE-LETE.                                             NC1064.2 431
   001363         136600 SUB-WRITE-F1-26-13.                                              NC1064.2
   001364         136700     MOVE "SUB-TEST-F1-26-13 " TO PAR-NAME.                       NC1064.2 279
   001365         136800     PERFORM PRINT-DETAIL.                                        NC1064.2 433
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         136900 SUB-TEST-F1-26-14.                                               NC1064.2
   001367         137000     IF DNAME35 EQUAL TO ZERO                                     NC1064.2 117 IMP
   001368      1  137100         PERFORM PASS                                             NC1064.2 429
   001369      1  137200         GO TO SUB-WRITE-F1-26-14.                                NC1064.2 1376
   001370         137300     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001371         137400     MOVE DNAME35 TO COMPUTED-18V0.                               NC1064.2 117 297
   001372         137500     PERFORM FAIL.                                                NC1064.2 430
   001373         137600     GO TO SUB-WRITE-F1-26-14.                                    NC1064.2 1376
   001374         137700 SUB-DELETE-F1-26-14.                                             NC1064.2
   001375         137800     PERFORM DE-LETE.                                             NC1064.2 431
   001376         137900 SUB-WRITE-F1-26-14.                                              NC1064.2
   001377         138000     MOVE "SUB-TEST-F1-26-14 " TO PAR-NAME.                       NC1064.2 279
   001378         138100     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001379         138200 SUB-TEST-F1-26-15.                                               NC1064.2
   001380         138300     IF DNAME36 EQUAL TO ZERO                                     NC1064.2 118 IMP
   001381      1  138400         PERFORM PASS                                             NC1064.2 429
   001382      1  138500         GO TO SUB-WRITE-F1-26-15.                                NC1064.2 1389
   001383         138600     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001384         138700     MOVE DNAME36 TO COMPUTED-18V0.                               NC1064.2 118 297
   001385         138800     PERFORM FAIL.                                                NC1064.2 430
   001386         138900     GO TO SUB-WRITE-F1-26-15.                                    NC1064.2 1389
   001387         139000 SUB-DELETE-F1-26-15.                                             NC1064.2
   001388         139100     PERFORM DE-LETE.                                             NC1064.2 431
   001389         139200 SUB-WRITE-F1-26-15.                                              NC1064.2
   001390         139300     MOVE "SUB-TEST-F1-26-15 " TO PAR-NAME.                       NC1064.2 279
   001391         139400     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001392         139500 SUB-TEST-F1-26-16.                                               NC1064.2
   001393         139600     IF DNAME37 EQUAL TO ZERO                                     NC1064.2 119 IMP
   001394      1  139700         PERFORM PASS                                             NC1064.2 429
   001395      1  139800         GO TO SUB-WRITE-F1-26-16.                                NC1064.2 1402
   001396         139900     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001397         140000     MOVE DNAME37 TO COMPUTED-18V0.                               NC1064.2 119 297
   001398         140100     PERFORM FAIL.                                                NC1064.2 430
   001399         140200     GO TO SUB-WRITE-F1-26-16.                                    NC1064.2 1402
   001400         140300 SUB-DELETE-F1-26-16.                                             NC1064.2
   001401         140400     PERFORM DE-LETE.                                             NC1064.2 431
   001402         140500 SUB-WRITE-F1-26-16.                                              NC1064.2
   001403         140600     MOVE "SUB-TEST-F1-26-16 " TO PAR-NAME.                       NC1064.2 279
   001404         140700     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001405         140800 SUB-TEST-F1-26-17.                                               NC1064.2
   001406         140900     IF DNAME38 EQUAL TO ZERO                                     NC1064.2 120 IMP
   001407      1  141000         PERFORM PASS                                             NC1064.2 429
   001408      1  141100         GO TO SUB-WRITE-F1-26-17.                                NC1064.2 1415
   001409         141200     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001410         141300     MOVE DNAME38 TO COMPUTED-18V0.                               NC1064.2 120 297
   001411         141400     PERFORM FAIL.                                                NC1064.2 430
   001412         141500     GO TO SUB-WRITE-F1-26-17.                                    NC1064.2 1415
   001413         141600 SUB-DELETE-F1-26-17.                                             NC1064.2
   001414         141700     PERFORM DE-LETE.                                             NC1064.2 431
   001415         141800 SUB-WRITE-F1-26-17.                                              NC1064.2
   001416         141900     MOVE "SUB-TEST-F1-26-17 " TO PAR-NAME.                       NC1064.2 279
   001417         142000     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001418         142100 SUB-TEST-F1-26-18.                                               NC1064.2
   001419         142200     IF DNAME39 EQUAL TO ZERO                                     NC1064.2 121 IMP
   001420      1  142300         PERFORM PASS                                             NC1064.2 429
   001421      1  142400         GO TO SUB-WRITE-F1-26-18.                                NC1064.2 1428
   001422         142500     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142600     MOVE DNAME39 TO COMPUTED-18V0.                               NC1064.2 121 297
   001424         142700     PERFORM FAIL.                                                NC1064.2 430
   001425         142800     GO TO SUB-WRITE-F1-26-18.                                    NC1064.2 1428
   001426         142900 SUB-DELETE-F1-26-18.                                             NC1064.2
   001427         143000     PERFORM DE-LETE.                                             NC1064.2 431
   001428         143100 SUB-WRITE-F1-26-18.                                              NC1064.2
   001429         143200     MOVE "SUB-TEST-F1-26-18 " TO PAR-NAME.                       NC1064.2 279
   001430         143300     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001431         143400 SUB-TEST-F1-26-19.                                               NC1064.2
   001432         143500     IF DNAME40 EQUAL TO ZERO                                     NC1064.2 122 IMP
   001433      1  143600         PERFORM PASS                                             NC1064.2 429
   001434      1  143700         GO TO SUB-WRITE-F1-26-19.                                NC1064.2 1441
   001435         143800     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001436         143900     MOVE DNAME40 TO COMPUTED-18V0.                               NC1064.2 122 297
   001437         144000     PERFORM FAIL.                                                NC1064.2 430
   001438         144100     GO TO SUB-WRITE-F1-26-19.                                    NC1064.2 1441
   001439         144200 SUB-DELETE-F1-26-19.                                             NC1064.2
   001440         144300     PERFORM DE-LETE.                                             NC1064.2 431
   001441         144400 SUB-WRITE-F1-26-19.                                              NC1064.2
   001442         144500     MOVE "SUB-TEST-F1-26-19 " TO PAR-NAME.                       NC1064.2 279
   001443         144600     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001444         144700 SUB-TEST-F1-26-20.                                               NC1064.2
   001445         144800     IF DNAME41 EQUAL TO ZERO                                     NC1064.2 123 IMP
   001446      1  144900     PERFORM PASS                                                 NC1064.2 429
   001447      1  145000         GO TO SUB-WRITE-F1-26-20.                                NC1064.2 1454
   001448         145100     MOVE DNAME41 TO COMPUTED-18V0.                               NC1064.2 123 297
   001449         145200     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001450         145300     PERFORM FAIL.                                                NC1064.2 430
   001451         145400     GO TO SUB-WRITE-F1-26-20.                                    NC1064.2 1454
   001452         145500 SUB-DELETE-F1-26-20.                                             NC1064.2
   001453         145600     PERFORM DE-LETE.                                             NC1064.2 431
   001454         145700 SUB-WRITE-F1-26-20.                                              NC1064.2
   001455         145800     MOVE "SUB-TEST-F1-26-20 " TO PAR-NAME.                       NC1064.2 279
   001456         145900     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001457         146000 SUB-TEST-F1-26-21.                                               NC1064.2
   001458         146100     IF DNAME42 EQUAL TO ZERO                                     NC1064.2 124 IMP
   001459      1  146200     PERFORM PASS                                                 NC1064.2 429
   001460      1  146300         GO TO SUB-WRITE-F1-26-21.                                NC1064.2 1467
   001461         146400     MOVE DNAME42 TO COMPUTED-18V0.                               NC1064.2 124 297
   001462         146500     MOVE ZERO TO CORRECT-18V0.                                   NC1064.2 IMP 310
   001463         146600     PERFORM FAIL.                                                NC1064.2 430
   001464         146700     GO TO SUB-WRITE-F1-26-21.                                    NC1064.2 1467
   001465         146800 SUB-DELETE-F1-26-21.                                             NC1064.2
   001466         146900     PERFORM DE-LETE.                                             NC1064.2 431
   001467         147000 SUB-WRITE-F1-26-21.                                              NC1064.2
   001468         147100     MOVE "SUB-TEST-F1-26-21 " TO PAR-NAME.                       NC1064.2 279
   001469         147200     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001470         147300*                                                                 NC1064.2
   001471         147400 SUB-INIT-F1-27.                                                  NC1064.2
   001472         147500*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1064.2
   001473         147600     MOVE   "VI-134 6.25.4 GR1" TO ANSI-REFERENCE.                NC1064.2 335
   001474         147700     MOVE   "SUB-TEST-F1-27" TO PAR-NAME.                         NC1064.2 279
   001475         147800     MOVE    ZERO  TO REC-CT.                                     NC1064.2 IMP 326
   001476         147900     MOVE    10    TO WRK-DU-2V0-1.                               NC1064.2 57
   001477         148000     MOVE    .3    TO WRK-DU-0V1-1.                               NC1064.2 46
   001478         148100     MOVE    12.34 TO WRK-DU-2V2-1.                               NC1064.2 63
   001479         148200     MOVE    ZERO  TO WRK-DS-2V2-1.                               NC1064.2 IMP 79
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148300     MOVE   -12.34 TO WRK-DS-2V2-2.                               NC1064.2 80
   001481         148400     MOVE    22.33 TO WRK-DU-2V2-2.                               NC1064.2 64
   001482         148500     MOVE   -9999999999999999.99 TO WRK-DS-16V2-1.                NC1064.2 81
   001483         148600     MOVE    9999999999999999.99 TO WRK-DU-16V2-1.                NC1064.2 73
   001484         148700 SUB-TEST-F1-27-0.                                                NC1064.2
   001485         148800     SUBTRACT WRK-DU-2V0-1 2 WRK-DU-0V1-1 .04 FROM WRK-DU-2V2-1   NC1064.2 57 46 63
   001486         148900         WRK-DS-2V2-1 ROUNDED WRK-DS-2V2-2 WRK-DU-2V2-2           NC1064.2 79 80 64
   001487         149000         ROUNDED WRK-DU-16V2-1.                                   NC1064.2 73
   001488         149100     GO TO   SUB-TEST-F1-27-1.                                    NC1064.2 1493
   001489         149200 SUB-DELETE-F1-27.                                                NC1064.2
   001490         149300     PERFORM DE-LETE.                                             NC1064.2 431
   001491         149400     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001492         149500     GO TO   SUB-INIT-F1-28.                                      NC1064.2 1530
   001493         149600 SUB-TEST-F1-27-1.                                                NC1064.2
   001494         149700     MOVE    "SUB-TEST-F1-27-1" TO PAR-NAME.                      NC1064.2 279
   001495         149800     MOVE 1 TO REC-CT.                                            NC1064.2 326
   001496         149900     IF WRK-DU-2V2-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1064.2 63 IMP 429 433
   001497         150000     ELSE                                                         NC1064.2
   001498      1  150100     PERFORM FAIL MOVE WRK-DU-2V2-1 TO COMPUTED-N MOVE ZERO       NC1064.2 430 63 291 IMP
   001499      1  150200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001500         150300     ADD 1 TO REC-CT.                                             NC1064.2 326
   001501         150400 SUB-TEST-F1-27-2.                                                NC1064.2
   001502         150500     MOVE    "SUB-TEST-F1-27-2" TO PAR-NAME.                      NC1064.2 279
   001503         150600     IF WRK-DS-2V2-1 = -12.34 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 79 429 433
   001504         150700     ELSE                                                         NC1064.2
   001505      1  150800     PERFORM FAIL MOVE WRK-DS-2V2-1 TO COMPUTED-N MOVE -12.34     NC1064.2 430 79 291
   001506      1  150900     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001507         151000     ADD 1 TO REC-CT.                                             NC1064.2 326
   001508         151100 SUB-TEST-F1-27-3.                                                NC1064.2
   001509         151200     MOVE    "SUB-TEST-F1-27-3" TO PAR-NAME.                      NC1064.2 279
   001510         151300     IF WRK-DS-2V2-2 = -24.68 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 80 429 433
   001511         151400     ELSE                                                         NC1064.2
   001512      1  151500     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE -24.68     NC1064.2 430 80 291
   001513      1  151600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001514         151700     ADD 1 TO REC-CT.                                             NC1064.2 326
   001515         151800 SUB-TEST-F1-27-4.                                                NC1064.2
   001516         151900     MOVE    "SUB-TEST-F1-27-4" TO PAR-NAME.                      NC1064.2 279
   001517         152000     IF WRK-DU-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1064.2 64 429 433
   001518         152100     ELSE                                                         NC1064.2
   001519      1  152200     PERFORM FAIL MOVE WRK-DU-2V2-2 TO COMPUTED-N MOVE 09.99      NC1064.2 430 64 291
   001520      1  152300     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001521         152400     ADD 1 TO REC-CT.                                             NC1064.2 326
   001522         152500 SUB-TEST-F1-27-5.                                                NC1064.2
   001523         152600     MOVE    "SUB-TEST-F1-27-5" TO PAR-NAME.                      NC1064.2 279
   001524         152700     IF WRK-DU-16V2-1 = 9999999999999987.65 PERFORM PASS          NC1064.2 73 429
   001525      1  152800     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001526      1  152900     PERFORM FAIL MOVE WRK-DU-16V2-1 TO WRK-NE-X-1                NC1064.2 430 73 40
   001527      1  153000     MOVE WRK-NE-X-1 TO COMPUTED-A                                NC1064.2 40 290
   001528      1  153100     MOVE "9999999999999987.65" TO CORRECT-A PERFORM PRINT-DETAIL.NC1064.2 304 433
   001529         153200*                                                                 NC1064.2
   001530         153300 SUB-INIT-F1-28.                                                  NC1064.2
   001531         153400*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1064.2
   001532         153500*    ==-->      NO SIZE ERROR       <--==                         NC1064.2
   001533         153600     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1064.2 335
   001534         153700     MOVE   "SUB-TEST-F1-28" TO PAR-NAME.                         NC1064.2 279
   001535         153800     MOVE    ZERO  TO REC-CT.                                     NC1064.2 IMP 326
   001536         153900     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001537         154000     MOVE    10    TO WRK-DU-2V0-1.                               NC1064.2 57
   001538         154100     MOVE    .3    TO WRK-DU-0V1-1.                               NC1064.2 46
   001539         154200     MOVE    12.34 TO WRK-DU-2V2-1.                               NC1064.2 63
   001540         154300     MOVE    ZERO  TO WRK-DS-2V2-1.                               NC1064.2 IMP 79
   001541         154400     MOVE   -12.34 TO WRK-DS-2V2-2.                               NC1064.2 80
   001542         154500     MOVE    22.33 TO WRK-DU-2V2-2.                               NC1064.2 64
   001543         154600     MOVE   -8888888888888888.88 TO WRK-DS-16V2-1.                NC1064.2 81
   001544         154700     MOVE    9999999999999999.99 TO WRK-DU-16V2-1.                NC1064.2 73
   001545         154800 SUB-TEST-F1-28-0.                                                NC1064.2
   001546         154900     SUBTRACT WRK-DU-2V0-1 2 WRK-DU-0V1-1 .04 FROM WRK-DU-2V2-1   NC1064.2 57 46 63
   001547         155000         WRK-DS-2V2-1 ROUNDED WRK-DS-2V2-2 WRK-DU-2V2-2           NC1064.2 79 80 64
   001548         155100         ROUNDED WRK-DU-16V2-1 WRK-DS-16V2-1                      NC1064.2 73 81
   001549         155200          ON SIZE ERROR                                           NC1064.2
   001550      1  155300             MOVE "A" TO SIZE-ERR2.                               NC1064.2 126
   001551         155400     GO TO   SUB-TEST-F1-28-1.                                    NC1064.2 1556
   001552         155500 SUB-DELETE-F1-28.                                                NC1064.2
   001553         155600     PERFORM DE-LETE.                                             NC1064.2 431
   001554         155700     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001555         155800     GO TO   SUB-INIT-F1-29.                                      NC1064.2 1615
   001556         155900 SUB-TEST-F1-28-1.                                                NC1064.2
   001557         156000     MOVE    "SUB-TEST-F1-28-1" TO PAR-NAME.                      NC1064.2 279
   001558         156100     MOVE 1 TO REC-CT.                                            NC1064.2 326
   001559         156200     IF WRK-DU-2V2-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1064.2 63 IMP 429 433
   001560         156300     ELSE                                                         NC1064.2
   001561      1  156400     PERFORM FAIL MOVE WRK-DU-2V2-1 TO COMPUTED-N MOVE ZERO       NC1064.2 430 63 291 IMP
   001562      1  156500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001563         156600     ADD 1 TO REC-CT.                                             NC1064.2 326
   001564         156700 SUB-TEST-F1-28-2.                                                NC1064.2
   001565         156800     MOVE    "SUB-TEST-F1-28-2" TO PAR-NAME.                      NC1064.2 279
   001566         156900     IF WRK-DS-2V2-1 = -12.34 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 79 429 433
   001567         157000     ELSE                                                         NC1064.2
   001568      1  157100     PERFORM FAIL MOVE WRK-DS-2V2-1 TO COMPUTED-N MOVE -12.34     NC1064.2 430 79 291
   001569      1  157200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001570         157300     ADD 1 TO REC-CT.                                             NC1064.2 326
   001571         157400 SUB-TEST-F1-28-3.                                                NC1064.2
   001572         157500     MOVE    "SUB-TEST-F1-28-3" TO PAR-NAME.                      NC1064.2 279
   001573         157600     IF WRK-DS-2V2-2 = -24.68 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 80 429 433
   001574         157700     ELSE                                                         NC1064.2
   001575      1  157800     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE -24.68     NC1064.2 430 80 291
   001576      1  157900     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001577         158000     ADD 1 TO REC-CT.                                             NC1064.2 326
   001578         158100 SUB-TEST-F1-28-4.                                                NC1064.2
   001579         158200     MOVE    "SUB-TEST-F1-28-4" TO PAR-NAME.                      NC1064.2 279
   001580         158300     IF WRK-DU-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1064.2 64 429 433
   001581         158400     ELSE                                                         NC1064.2
   001582      1  158500     PERFORM FAIL MOVE WRK-DU-2V2-2 TO COMPUTED-N MOVE 09.99      NC1064.2 430 64 291
   001583      1  158600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001584         158700     ADD 1 TO REC-CT.                                             NC1064.2 326
   001585         158800 SUB-TEST-F1-28-5.                                                NC1064.2
   001586         158900     MOVE    "SUB-TEST-F1-28-5" TO PAR-NAME.                      NC1064.2 279
   001587         159000     IF WRK-DU-16V2-1 = 9999999999999987.65 PERFORM PASS          NC1064.2 73 429
   001588      1  159100     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001589      1  159200     PERFORM FAIL MOVE WRK-DU-16V2-1 TO WRK-NE-X-1                NC1064.2 430 73 40
   001590      1  159300     MOVE WRK-NE-X-1 TO COMPUTED-A                                NC1064.2 40 290
   001591      1  159400     MOVE "9999999999999987.65" TO CORRECT-A PERFORM PRINT-DETAIL.NC1064.2 304 433
   001592         159500     ADD 1 TO REC-CT.                                             NC1064.2 326
   001593         159600 SUB-TEST-F1-28-6.                                                NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001594         159700     MOVE    "SUB-TEST-F1-28-6" TO PAR-NAME.                      NC1064.2 279
   001595         159800     IF WRK-DS-16V2-1 = -8888888888888901.22 PERFORM PASS         NC1064.2 81 429
   001596      1  159900     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001597      1  160000     PERFORM FAIL MOVE WRK-DS-16V2-1 TO WRK-NE-X-2                NC1064.2 430 81 41
   001598      1  160100     MOVE WRK-NE-X-2 TO COMPUTED-A                                NC1064.2 41 290
   001599      1  160200     MOVE "-8888888888888901.22" TO CORRECT-A                     NC1064.2 304
   001600      1  160300     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001601         160400     ADD 1 TO REC-CT.                                             NC1064.2 326
   001602         160500 SUB-TEST-F1-28-7.                                                NC1064.2
   001603         160600     MOVE   "SUB-TEST-F1-28-7" TO PAR-NAME.                       NC1064.2 279
   001604         160700     IF      SIZE-ERR2 = SPACE                                    NC1064.2 126 IMP
   001605      1  160800             PERFORM PASS                                         NC1064.2 429
   001606      1  160900             PERFORM PRINT-DETAIL                                 NC1064.2 433
   001607         161000     ELSE                                                         NC1064.2
   001608      1  161100             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1064.2
   001609      1  161200                  TO RE-MARK                                      NC1064.2 284
   001610      1  161300             MOVE    SPACE     TO CORRECT-X                       NC1064.2 IMP 303
   001611      1  161400             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   001612      1  161500             PERFORM FAIL                                         NC1064.2 430
   001613      1  161600             PERFORM PRINT-DETAIL.                                NC1064.2 433
   001614         161700*                                                                 NC1064.2
   001615         161800 SUB-INIT-F1-29.                                                  NC1064.2
   001616         161900*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1064.2
   001617         162000*    ==-->       SIZE ERROR         <--==                         NC1064.2
   001618         162100     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1064.2 335
   001619         162200     MOVE   "SUB-TEST-F1-29" TO PAR-NAME.                         NC1064.2 279
   001620         162300     MOVE    ZERO  TO REC-CT.                                     NC1064.2 IMP 326
   001621         162400     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   001622         162500     MOVE    10    TO WRK-DU-2V0-1.                               NC1064.2 57
   001623         162600     MOVE    .3    TO WRK-DU-0V1-1.                               NC1064.2 46
   001624         162700     MOVE    12.34 TO WRK-DU-2V2-1.                               NC1064.2 63
   001625         162800     MOVE    ZERO  TO WRK-DS-2V2-1.                               NC1064.2 IMP 79
   001626         162900     MOVE   -12.34 TO WRK-DS-2V2-2.                               NC1064.2 80
   001627         163000     MOVE    22.33 TO WRK-DU-2V2-2.                               NC1064.2 64
   001628         163100     MOVE   -9999999999999999.99 TO WRK-DS-16V2-1.                NC1064.2 81
   001629         163200     MOVE    9999999999999999.99 TO WRK-DU-16V2-1.                NC1064.2 73
   001630         163300 SUB-TEST-F1-29-0.                                                NC1064.2
   001631         163400     SUBTRACT WRK-DU-2V0-1 2 WRK-DU-0V1-1 .04 FROM WRK-DU-2V2-1   NC1064.2 57 46 63
   001632         163500         WRK-DS-2V2-1 ROUNDED WRK-DS-2V2-2 WRK-DU-2V2-2           NC1064.2 79 80 64
   001633         163600         ROUNDED WRK-DU-16V2-1 WRK-DS-16V2-1                      NC1064.2 73 81
   001634         163700          ON SIZE ERROR                                           NC1064.2
   001635      1  163800             MOVE "A" TO SIZE-ERR2.                               NC1064.2 126
   001636         163900     GO TO   SUB-TEST-F1-29-1.                                    NC1064.2 1641
   001637         164000 SUB-DELETE-F1-29.                                                NC1064.2
   001638         164100     PERFORM DE-LETE.                                             NC1064.2 431
   001639         164200     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001640         164300     GO TO   SUB-INIT-F1-30.                                      NC1064.2 1700
   001641         164400 SUB-TEST-F1-29-1.                                                NC1064.2
   001642         164500     MOVE    "SUB-TEST-F1-29-1" TO PAR-NAME.                      NC1064.2 279
   001643         164600     MOVE 1 TO REC-CT.                                            NC1064.2 326
   001644         164700     IF WRK-DU-2V2-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1064.2 63 IMP 429 433
   001645         164800     ELSE                                                         NC1064.2
   001646      1  164900     PERFORM FAIL MOVE WRK-DU-2V2-1 TO COMPUTED-N MOVE ZERO       NC1064.2 430 63 291 IMP
   001647      1  165000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001648         165100     ADD 1 TO REC-CT.                                             NC1064.2 326
   001649         165200 SUB-TEST-F1-29-2.                                                NC1064.2
   001650         165300     MOVE    "SUB-TEST-F1-29-2" TO PAR-NAME.                      NC1064.2 279
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001651         165400     IF WRK-DS-2V2-1 = -12.34 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 79 429 433
   001652         165500     ELSE                                                         NC1064.2
   001653      1  165600     PERFORM FAIL MOVE WRK-DS-2V2-1 TO COMPUTED-N MOVE -12.34     NC1064.2 430 79 291
   001654      1  165700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001655         165800     ADD 1 TO REC-CT.                                             NC1064.2 326
   001656         165900 SUB-TEST-F1-29-3.                                                NC1064.2
   001657         166000     MOVE    "SUB-TEST-F1-29-3" TO PAR-NAME.                      NC1064.2 279
   001658         166100     IF WRK-DS-2V2-2 = -24.68 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 80 429 433
   001659         166200     ELSE                                                         NC1064.2
   001660      1  166300     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE -24.68     NC1064.2 430 80 291
   001661      1  166400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001662         166500     ADD 1 TO REC-CT.                                             NC1064.2 326
   001663         166600 SUB-TEST-F1-29-4.                                                NC1064.2
   001664         166700     MOVE    "SUB-TEST-F1-29-4" TO PAR-NAME.                      NC1064.2 279
   001665         166800     IF WRK-DU-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1064.2 64 429 433
   001666         166900     ELSE                                                         NC1064.2
   001667      1  167000     PERFORM FAIL MOVE WRK-DU-2V2-2 TO COMPUTED-N MOVE 09.99      NC1064.2 430 64 291
   001668      1  167100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001669         167200     ADD 1 TO REC-CT.                                             NC1064.2 326
   001670         167300 SUB-TEST-F1-29-5.                                                NC1064.2
   001671         167400     MOVE    "SUB-TEST-F1-29-5" TO PAR-NAME.                      NC1064.2 279
   001672         167500     IF WRK-DU-16V2-1 = 9999999999999987.65 PERFORM PASS          NC1064.2 73 429
   001673      1  167600     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001674      1  167700     PERFORM FAIL MOVE WRK-DU-16V2-1 TO WRK-NE-X-1                NC1064.2 430 73 40
   001675      1  167800     MOVE WRK-NE-X-1 TO COMPUTED-A                                NC1064.2 40 290
   001676      1  167900     MOVE "9999999999999987.65" TO CORRECT-A PERFORM PRINT-DETAIL.NC1064.2 304 433
   001677         168000     ADD 1 TO REC-CT.                                             NC1064.2 326
   001678         168100 SUB-TEST-F1-29-6.                                                NC1064.2
   001679         168200     MOVE    "SUB-TEST-F1-29-6" TO PAR-NAME.                      NC1064.2 279
   001680         168300     IF WRK-DS-16V2-1 = -9999999999999999.99 PERFORM PASS         NC1064.2 81 429
   001681      1  168400     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001682      1  168500     PERFORM FAIL MOVE WRK-DS-16V2-1 TO WRK-NE-X-2                NC1064.2 430 81 41
   001683      1  168600     MOVE WRK-NE-X-2 TO COMPUTED-A                                NC1064.2 41 290
   001684      1  168700     MOVE "-9999999999999999.99" TO CORRECT-A                     NC1064.2 304
   001685      1  168800     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001686         168900     ADD 1 TO REC-CT.                                             NC1064.2 326
   001687         169000 SUB-TEST-F1-29-7.                                                NC1064.2
   001688         169100     MOVE   "SUB-TEST-F1-29-7" TO PAR-NAME.                       NC1064.2 279
   001689         169200     IF      SIZE-ERR2 = "A"                                      NC1064.2 126
   001690      1  169300             PERFORM PASS                                         NC1064.2 429
   001691      1  169400             PERFORM PRINT-DETAIL                                 NC1064.2 433
   001692         169500     ELSE                                                         NC1064.2
   001693      1  169600             MOVE   "ON SIZE ERROR SHOULD HAVE OCCURED"           NC1064.2
   001694      1  169700                  TO RE-MARK                                      NC1064.2 284
   001695      1  169800             MOVE   "A"        TO CORRECT-X                       NC1064.2 303
   001696      1  169900             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   001697      1  170000             PERFORM FAIL                                         NC1064.2 430
   001698      1  170100             PERFORM PRINT-DETAIL.                                NC1064.2 433
   001699         170200*                                                                 NC1064.2
   001700         170300 SUB-INIT-F1-30.                                                  NC1064.2
   001701         170400*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1064.2
   001702         170500*    ==-->      NO SIZE ERROR       <--==                         NC1064.2
   001703         170600     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1064.2 335
   001704         170700     MOVE   "SUB-TEST-F1-30" TO PAR-NAME.                         NC1064.2 279
   001705         170800     MOVE    ZERO  TO REC-CT.                                     NC1064.2 IMP 326
   001706         170900     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   001707         171000     MOVE    10    TO WRK-DU-2V0-1.                               NC1064.2 57
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001708         171100     MOVE    .3    TO WRK-DU-0V1-1.                               NC1064.2 46
   001709         171200     MOVE    12.34 TO WRK-DU-2V2-1.                               NC1064.2 63
   001710         171300     MOVE    ZERO  TO WRK-DS-2V2-1.                               NC1064.2 IMP 79
   001711         171400     MOVE   -12.34 TO WRK-DS-2V2-2.                               NC1064.2 80
   001712         171500     MOVE    22.33 TO WRK-DU-2V2-2.                               NC1064.2 64
   001713         171600     MOVE   -8888888888888888.88 TO WRK-DS-16V2-1.                NC1064.2 81
   001714         171700     MOVE    9999999999999999.99 TO WRK-DU-16V2-1.                NC1064.2 73
   001715         171800 SUB-TEST-F1-30-0.                                                NC1064.2
   001716         171900     SUBTRACT WRK-DU-2V0-1 2 WRK-DU-0V1-1 .04 FROM WRK-DU-2V2-1   NC1064.2 57 46 63
   001717         172000         WRK-DS-2V2-1 ROUNDED WRK-DS-2V2-2 WRK-DU-2V2-2           NC1064.2 79 80 64
   001718         172100         ROUNDED WRK-DU-16V2-1 WRK-DS-16V2-1                      NC1064.2 73 81
   001719         172200      NOT ON SIZE ERROR                                           NC1064.2
   001720      1  172300             MOVE "A" TO SIZE-ERR2.                               NC1064.2 126
   001721         172400     GO TO   SUB-TEST-F1-30-1.                                    NC1064.2 1726
   001722         172500 SUB-DELETE-F1-30.                                                NC1064.2
   001723         172600     PERFORM DE-LETE.                                             NC1064.2 431
   001724         172700     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001725         172800     GO TO   SUB-INIT-F1-31.                                      NC1064.2 1785
   001726         172900 SUB-TEST-F1-30-1.                                                NC1064.2
   001727         173000     MOVE    "SUB-TEST-F1-30-1" TO PAR-NAME.                      NC1064.2 279
   001728         173100     MOVE 1 TO REC-CT.                                            NC1064.2 326
   001729         173200     IF WRK-DU-2V2-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1064.2 63 IMP 429 433
   001730         173300     ELSE                                                         NC1064.2
   001731      1  173400     PERFORM FAIL MOVE WRK-DU-2V2-1 TO COMPUTED-N MOVE ZERO       NC1064.2 430 63 291 IMP
   001732      1  173500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001733         173600     ADD 1 TO REC-CT.                                             NC1064.2 326
   001734         173700 SUB-TEST-F1-30-2.                                                NC1064.2
   001735         173800     MOVE    "SUB-TEST-F1-30-2" TO PAR-NAME.                      NC1064.2 279
   001736         173900     IF WRK-DS-2V2-1 = -12.34 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 79 429 433
   001737         174000     ELSE                                                         NC1064.2
   001738      1  174100     PERFORM FAIL MOVE WRK-DS-2V2-1 TO COMPUTED-N MOVE -12.34     NC1064.2 430 79 291
   001739      1  174200     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001740         174300     ADD 1 TO REC-CT.                                             NC1064.2 326
   001741         174400 SUB-TEST-F1-30-3.                                                NC1064.2
   001742         174500     MOVE    "SUB-TEST-F1-30-3" TO PAR-NAME.                      NC1064.2 279
   001743         174600     IF WRK-DS-2V2-2 = -24.68 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 80 429 433
   001744         174700     ELSE                                                         NC1064.2
   001745      1  174800     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE -24.68     NC1064.2 430 80 291
   001746      1  174900     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001747         175000     ADD 1 TO REC-CT.                                             NC1064.2 326
   001748         175100 SUB-TEST-F1-30-4.                                                NC1064.2
   001749         175200     MOVE    "SUB-TEST-F1-30-4" TO PAR-NAME.                      NC1064.2 279
   001750         175300     IF WRK-DU-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1064.2 64 429 433
   001751         175400     ELSE                                                         NC1064.2
   001752      1  175500     PERFORM FAIL MOVE WRK-DU-2V2-2 TO COMPUTED-N MOVE 09.99      NC1064.2 430 64 291
   001753      1  175600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001754         175700     ADD 1 TO REC-CT.                                             NC1064.2 326
   001755         175800 SUB-TEST-F1-30-5.                                                NC1064.2
   001756         175900     MOVE    "SUB-TEST-F1-30-5" TO PAR-NAME.                      NC1064.2 279
   001757         176000     IF WRK-DU-16V2-1 = 9999999999999987.65 PERFORM PASS          NC1064.2 73 429
   001758      1  176100     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001759      1  176200     PERFORM FAIL MOVE WRK-DU-16V2-1 TO WRK-NE-X-1                NC1064.2 430 73 40
   001760      1  176300     MOVE WRK-NE-X-1 TO COMPUTED-A                                NC1064.2 40 290
   001761      1  176400     MOVE "9999999999999987.65" TO CORRECT-A PERFORM PRINT-DETAIL.NC1064.2 304 433
   001762         176500     ADD 1 TO REC-CT.                                             NC1064.2 326
   001763         176600 SUB-TEST-F1-30-6.                                                NC1064.2
   001764         176700     MOVE    "SUB-TEST-F1-30-6" TO PAR-NAME.                      NC1064.2 279
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001765         176800     IF WRK-DS-16V2-1 = -8888888888888901.22 PERFORM PASS         NC1064.2 81 429
   001766      1  176900     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001767      1  177000     PERFORM FAIL MOVE WRK-DS-16V2-1 TO WRK-NE-X-2                NC1064.2 430 81 41
   001768      1  177100     MOVE WRK-NE-X-2 TO COMPUTED-A                                NC1064.2 41 290
   001769      1  177200     MOVE "-8888888888888901.22" TO CORRECT-A                     NC1064.2 304
   001770      1  177300     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001771         177400     ADD 1 TO REC-CT.                                             NC1064.2 326
   001772         177500 SUB-TEST-F1-30-7.                                                NC1064.2
   001773         177600     MOVE   "SUB-TEST-F1-30-7" TO PAR-NAME.                       NC1064.2 279
   001774         177700     IF      SIZE-ERR2 = "A"                                      NC1064.2 126
   001775      1  177800             PERFORM PASS                                         NC1064.2 429
   001776      1  177900             PERFORM PRINT-DETAIL                                 NC1064.2 433
   001777         178000     ELSE                                                         NC1064.2
   001778      1  178100             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1064.2
   001779      1  178200                  TO RE-MARK                                      NC1064.2 284
   001780      1  178300             MOVE   "A"        TO CORRECT-X                       NC1064.2 303
   001781      1  178400             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   001782      1  178500             PERFORM FAIL                                         NC1064.2 430
   001783      1  178600             PERFORM PRINT-DETAIL.                                NC1064.2 433
   001784         178700*                                                                 NC1064.2
   001785         178800 SUB-INIT-F1-31.                                                  NC1064.2
   001786         178900*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1064.2
   001787         179000*    ==-->       SIZE ERROR         <--==                         NC1064.2
   001788         179100     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1064.2 335
   001789         179200     MOVE   "SUB-TEST-F1-31" TO PAR-NAME.                         NC1064.2 279
   001790         179300     MOVE    ZERO  TO REC-CT.                                     NC1064.2 IMP 326
   001791         179400     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   001792         179500     MOVE    10    TO WRK-DU-2V0-1.                               NC1064.2 57
   001793         179600     MOVE    .3    TO WRK-DU-0V1-1.                               NC1064.2 46
   001794         179700     MOVE    12.34 TO WRK-DU-2V2-1.                               NC1064.2 63
   001795         179800     MOVE    ZERO  TO WRK-DS-2V2-1.                               NC1064.2 IMP 79
   001796         179900     MOVE   -12.34 TO WRK-DS-2V2-2.                               NC1064.2 80
   001797         180000     MOVE    22.33 TO WRK-DU-2V2-2.                               NC1064.2 64
   001798         180100     MOVE   -9999999999999999.99 TO WRK-DS-16V2-1.                NC1064.2 81
   001799         180200     MOVE    9999999999999999.99 TO WRK-DU-16V2-1.                NC1064.2 73
   001800         180300 SUB-TEST-F1-31-0.                                                NC1064.2
   001801         180400     SUBTRACT WRK-DU-2V0-1 2 WRK-DU-0V1-1 .04 FROM WRK-DU-2V2-1   NC1064.2 57 46 63
   001802         180500         WRK-DS-2V2-1 ROUNDED WRK-DS-2V2-2 WRK-DU-2V2-2           NC1064.2 79 80 64
   001803         180600         ROUNDED WRK-DU-16V2-1 WRK-DS-16V2-1                      NC1064.2 73 81
   001804         180700      NOT ON SIZE ERROR                                           NC1064.2
   001805      1  180800             MOVE "A" TO SIZE-ERR2.                               NC1064.2 126
   001806         180900     GO TO   SUB-TEST-F1-31-1.                                    NC1064.2 1811
   001807         181000 SUB-DELETE-F1-31.                                                NC1064.2
   001808         181100     PERFORM DE-LETE.                                             NC1064.2 431
   001809         181200     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001810         181300     GO TO   SUB-INIT-F1-32.                                      NC1064.2 1870
   001811         181400 SUB-TEST-F1-31-1.                                                NC1064.2
   001812         181500     MOVE    "SUB-TEST-F1-31-1" TO PAR-NAME.                      NC1064.2 279
   001813         181600     MOVE 1 TO REC-CT.                                            NC1064.2 326
   001814         181700     IF WRK-DU-2V2-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1064.2 63 IMP 429 433
   001815         181800     ELSE                                                         NC1064.2
   001816      1  181900     PERFORM FAIL MOVE WRK-DU-2V2-1 TO COMPUTED-N MOVE ZERO       NC1064.2 430 63 291 IMP
   001817      1  182000     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001818         182100     ADD 1 TO REC-CT.                                             NC1064.2 326
   001819         182200 SUB-TEST-F1-31-2.                                                NC1064.2
   001820         182300     MOVE    "SUB-TEST-F1-31-2" TO PAR-NAME.                      NC1064.2 279
   001821         182400     IF WRK-DS-2V2-1 = -12.34 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 79 429 433
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001822         182500     ELSE                                                         NC1064.2
   001823      1  182600     PERFORM FAIL MOVE WRK-DS-2V2-1 TO COMPUTED-N MOVE -12.34     NC1064.2 430 79 291
   001824      1  182700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001825         182800     ADD 1 TO REC-CT.                                             NC1064.2 326
   001826         182900 SUB-TEST-F1-31-3.                                                NC1064.2
   001827         183000     MOVE    "SUB-TEST-F1-31-3" TO PAR-NAME.                      NC1064.2 279
   001828         183100     IF WRK-DS-2V2-2 = -24.68 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 80 429 433
   001829         183200     ELSE                                                         NC1064.2
   001830      1  183300     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE -24.68     NC1064.2 430 80 291
   001831      1  183400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001832         183500     ADD 1 TO REC-CT.                                             NC1064.2 326
   001833         183600 SUB-TEST-F1-31-4.                                                NC1064.2
   001834         183700     MOVE    "SUB-TEST-F1-31-4" TO PAR-NAME.                      NC1064.2 279
   001835         183800     IF WRK-DU-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1064.2 64 429 433
   001836         183900     ELSE                                                         NC1064.2
   001837      1  184000     PERFORM FAIL MOVE WRK-DU-2V2-2 TO COMPUTED-N MOVE 09.99      NC1064.2 430 64 291
   001838      1  184100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001839         184200     ADD 1 TO REC-CT.                                             NC1064.2 326
   001840         184300 SUB-TEST-F1-31-5.                                                NC1064.2
   001841         184400     MOVE    "SUB-TEST-F1-31-5" TO PAR-NAME.                      NC1064.2 279
   001842         184500     IF WRK-DU-16V2-1 = 9999999999999987.65 PERFORM PASS          NC1064.2 73 429
   001843      1  184600     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001844      1  184700     PERFORM FAIL MOVE WRK-DU-16V2-1 TO WRK-NE-X-1                NC1064.2 430 73 40
   001845      1  184800     MOVE WRK-NE-X-1 TO COMPUTED-A                                NC1064.2 40 290
   001846      1  184900     MOVE "9999999999999987.65" TO CORRECT-A PERFORM PRINT-DETAIL.NC1064.2 304 433
   001847         185000     ADD 1 TO REC-CT.                                             NC1064.2 326
   001848         185100 SUB-TEST-F1-31-6.                                                NC1064.2
   001849         185200     MOVE    "SUB-TEST-F1-31-6" TO PAR-NAME.                      NC1064.2 279
   001850         185300     IF WRK-DS-16V2-1 = -9999999999999999.99 PERFORM PASS         NC1064.2 81 429
   001851      1  185400     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001852      1  185500     PERFORM FAIL MOVE WRK-DS-16V2-1 TO WRK-NE-X-2                NC1064.2 430 81 41
   001853      1  185600     MOVE WRK-NE-X-2 TO COMPUTED-A                                NC1064.2 41 290
   001854      1  185700     MOVE "-9999999999999999.99" TO CORRECT-A                     NC1064.2 304
   001855      1  185800     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001856         185900     ADD 1 TO REC-CT.                                             NC1064.2 326
   001857         186000 SUB-TEST-F1-31-7.                                                NC1064.2
   001858         186100     MOVE   "SUB-TEST-F1-31-7" TO PAR-NAME.                       NC1064.2 279
   001859         186200     IF      SIZE-ERR2 = SPACE                                    NC1064.2 126 IMP
   001860      1  186300             PERFORM PASS                                         NC1064.2 429
   001861      1  186400             PERFORM PRINT-DETAIL                                 NC1064.2 433
   001862         186500     ELSE                                                         NC1064.2
   001863      1  186600             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1064.2
   001864      1  186700                  TO RE-MARK                                      NC1064.2 284
   001865      1  186800             MOVE    SPACE     TO CORRECT-X                       NC1064.2 IMP 303
   001866      1  186900             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   001867      1  187000             PERFORM FAIL                                         NC1064.2 430
   001868      1  187100             PERFORM PRINT-DETAIL.                                NC1064.2 433
   001869         187200*                                                                 NC1064.2
   001870         187300 SUB-INIT-F1-32.                                                  NC1064.2
   001871         187400*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1064.2
   001872         187500*    ==-->      NO SIZE ERROR       <--==                         NC1064.2
   001873         187600     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1064.2 335
   001874         187700     MOVE   "SUB-TEST-F1-32" TO PAR-NAME.                         NC1064.2 279
   001875         187800     MOVE    ZERO  TO REC-CT.                                     NC1064.2 IMP 326
   001876         187900     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   001877         188000     MOVE    10    TO WRK-DU-2V0-1.                               NC1064.2 57
   001878         188100     MOVE    .3    TO WRK-DU-0V1-1.                               NC1064.2 46
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001879         188200     MOVE    12.34 TO WRK-DU-2V2-1.                               NC1064.2 63
   001880         188300     MOVE    ZERO  TO WRK-DS-2V2-1.                               NC1064.2 IMP 79
   001881         188400     MOVE   -12.34 TO WRK-DS-2V2-2.                               NC1064.2 80
   001882         188500     MOVE    22.33 TO WRK-DU-2V2-2.                               NC1064.2 64
   001883         188600     MOVE   -8888888888888888.88 TO WRK-DS-16V2-1.                NC1064.2 81
   001884         188700     MOVE    9999999999999999.99 TO WRK-DU-16V2-1.                NC1064.2 73
   001885         188800 SUB-TEST-F1-32-0.                                                NC1064.2
   001886         188900     SUBTRACT WRK-DU-2V0-1 2 WRK-DU-0V1-1 .04 FROM WRK-DU-2V2-1   NC1064.2 57 46 63
   001887         189000         WRK-DS-2V2-1 ROUNDED WRK-DS-2V2-2 WRK-DU-2V2-2           NC1064.2 79 80 64
   001888         189100         ROUNDED WRK-DU-16V2-1 WRK-DS-16V2-1                      NC1064.2 73 81
   001889         189200          ON SIZE ERROR                                           NC1064.2
   001890      1  189300             MOVE "Z" TO SIZE-ERR2                                NC1064.2 126
   001891         189400      NOT ON SIZE ERROR                                           NC1064.2
   001892      1  189500             MOVE "A" TO SIZE-ERR2.                               NC1064.2 126
   001893         189600     GO TO   SUB-TEST-F1-32-1.                                    NC1064.2 1898
   001894         189700 SUB-DELETE-F1-32.                                                NC1064.2
   001895         189800     PERFORM DE-LETE.                                             NC1064.2 431
   001896         189900     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001897         190000     GO TO   SUB-INIT-F1-33.                                      NC1064.2 1957
   001898         190100 SUB-TEST-F1-32-1.                                                NC1064.2
   001899         190200     MOVE    "SUB-TEST-F1-32-1" TO PAR-NAME.                      NC1064.2 279
   001900         190300     MOVE 1 TO REC-CT.                                            NC1064.2 326
   001901         190400     IF WRK-DU-2V2-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1064.2 63 IMP 429 433
   001902         190500     ELSE                                                         NC1064.2
   001903      1  190600     PERFORM FAIL MOVE WRK-DU-2V2-1 TO COMPUTED-N MOVE ZERO       NC1064.2 430 63 291 IMP
   001904      1  190700     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001905         190800     ADD 1 TO REC-CT.                                             NC1064.2 326
   001906         190900 SUB-TEST-F1-32-2.                                                NC1064.2
   001907         191000     MOVE    "SUB-TEST-F1-32-2" TO PAR-NAME.                      NC1064.2 279
   001908         191100     IF WRK-DS-2V2-1 = -12.34 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 79 429 433
   001909         191200     ELSE                                                         NC1064.2
   001910      1  191300     PERFORM FAIL MOVE WRK-DS-2V2-1 TO COMPUTED-N MOVE -12.34     NC1064.2 430 79 291
   001911      1  191400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001912         191500     ADD 1 TO REC-CT.                                             NC1064.2 326
   001913         191600 SUB-TEST-F1-32-3.                                                NC1064.2
   001914         191700     MOVE    "SUB-TEST-F1-32-3" TO PAR-NAME.                      NC1064.2 279
   001915         191800     IF WRK-DS-2V2-2 = -24.68 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 80 429 433
   001916         191900     ELSE                                                         NC1064.2
   001917      1  192000     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE -24.68     NC1064.2 430 80 291
   001918      1  192100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001919         192200     ADD 1 TO REC-CT.                                             NC1064.2 326
   001920         192300 SUB-TEST-F1-32-4.                                                NC1064.2
   001921         192400     MOVE    "SUB-TEST-F1-32-4" TO PAR-NAME.                      NC1064.2 279
   001922         192500     IF WRK-DU-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1064.2 64 429 433
   001923         192600     ELSE                                                         NC1064.2
   001924      1  192700     PERFORM FAIL MOVE WRK-DU-2V2-2 TO COMPUTED-N MOVE 09.99      NC1064.2 430 64 291
   001925      1  192800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001926         192900     ADD 1 TO REC-CT.                                             NC1064.2 326
   001927         193000 SUB-TEST-F1-32-5.                                                NC1064.2
   001928         193100     MOVE    "SUB-TEST-F1-32-5" TO PAR-NAME.                      NC1064.2 279
   001929         193200     IF WRK-DU-16V2-1 = 9999999999999987.65 PERFORM PASS          NC1064.2 73 429
   001930      1  193300     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001931      1  193400     PERFORM FAIL MOVE WRK-DU-16V2-1 TO WRK-NE-X-1                NC1064.2 430 73 40
   001932      1  193500     MOVE WRK-NE-X-1 TO COMPUTED-A                                NC1064.2 40 290
   001933      1  193600     MOVE "9999999999999987.65" TO CORRECT-A PERFORM PRINT-DETAIL.NC1064.2 304 433
   001934         193700     ADD 1 TO REC-CT.                                             NC1064.2 326
   001935         193800 SUB-TEST-F1-32-6.                                                NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001936         193900     MOVE    "SUB-TEST-F1-32-6" TO PAR-NAME.                      NC1064.2 279
   001937         194000     IF WRK-DS-16V2-1 = -8888888888888901.22 PERFORM PASS         NC1064.2 81 429
   001938      1  194100     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   001939      1  194200     PERFORM FAIL MOVE WRK-DS-16V2-1 TO WRK-NE-X-2                NC1064.2 430 81 41
   001940      1  194300     MOVE WRK-NE-X-2 TO COMPUTED-A                                NC1064.2 41 290
   001941      1  194400     MOVE "-8888888888888901.22" TO CORRECT-A                     NC1064.2 304
   001942      1  194500     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001943         194600     ADD 1 TO REC-CT.                                             NC1064.2 326
   001944         194700 SUB-TEST-F1-32-7.                                                NC1064.2
   001945         194800     MOVE   "SUB-TEST-F1-32-7" TO PAR-NAME.                       NC1064.2 279
   001946         194900     IF      SIZE-ERR2 = "A"                                      NC1064.2 126
   001947      1  195000             PERFORM PASS                                         NC1064.2 429
   001948      1  195100             PERFORM PRINT-DETAIL                                 NC1064.2 433
   001949         195200     ELSE                                                         NC1064.2
   001950      1  195300             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1064.2
   001951      1  195400                  TO RE-MARK                                      NC1064.2 284
   001952      1  195500             MOVE   "A"        TO CORRECT-X                       NC1064.2 303
   001953      1  195600             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   001954      1  195700             PERFORM FAIL                                         NC1064.2 430
   001955      1  195800             PERFORM PRINT-DETAIL.                                NC1064.2 433
   001956         195900*                                                                 NC1064.2
   001957         196000 SUB-INIT-F1-33.                                                  NC1064.2
   001958         196100*    ==-->  MULTIPLE RESULT FIELDS  <--==                         NC1064.2
   001959         196200*    ==-->       SIZE ERROR         <--==                         NC1064.2
   001960         196300     MOVE   "VI-67 6.4.2" TO ANSI-REFERENCE.                      NC1064.2 335
   001961         196400     MOVE   "SUB-TEST-F1-33" TO PAR-NAME.                         NC1064.2 279
   001962         196500     MOVE    ZERO  TO REC-CT.                                     NC1064.2 IMP 326
   001963         196600     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   001964         196700     MOVE    10    TO WRK-DU-2V0-1.                               NC1064.2 57
   001965         196800     MOVE    .3    TO WRK-DU-0V1-1.                               NC1064.2 46
   001966         196900     MOVE    12.34 TO WRK-DU-2V2-1.                               NC1064.2 63
   001967         197000     MOVE    ZERO  TO WRK-DS-2V2-1.                               NC1064.2 IMP 79
   001968         197100     MOVE   -12.34 TO WRK-DS-2V2-2.                               NC1064.2 80
   001969         197200     MOVE    22.33 TO WRK-DU-2V2-2.                               NC1064.2 64
   001970         197300     MOVE   -9999999999999999.99 TO WRK-DS-16V2-1.                NC1064.2 81
   001971         197400     MOVE    9999999999999999.99 TO WRK-DU-16V2-1.                NC1064.2 73
   001972         197500 SUB-TEST-F1-33-0.                                                NC1064.2
   001973         197600     SUBTRACT WRK-DU-2V0-1 2 WRK-DU-0V1-1 .04 FROM WRK-DU-2V2-1   NC1064.2 57 46 63
   001974         197700         WRK-DS-2V2-1 ROUNDED WRK-DS-2V2-2 WRK-DU-2V2-2           NC1064.2 79 80 64
   001975         197800         ROUNDED WRK-DU-16V2-1 WRK-DS-16V2-1                      NC1064.2 73 81
   001976         197900          ON SIZE ERROR                                           NC1064.2
   001977      1  198000             MOVE "A" TO SIZE-ERR2                                NC1064.2 126
   001978         198100      NOT ON SIZE ERROR                                           NC1064.2
   001979      1  198200             MOVE "Z" TO SIZE-ERR2.                               NC1064.2 126
   001980         198300     GO TO   SUB-TEST-F1-33-1.                                    NC1064.2 1985
   001981         198400 SUB-DELETE-F1-33.                                                NC1064.2
   001982         198500     PERFORM DE-LETE.                                             NC1064.2 431
   001983         198600     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   001984         198700     GO TO   SUB-INIT-F1-34.                                      NC1064.2 2044
   001985         198800 SUB-TEST-F1-33-1.                                                NC1064.2
   001986         198900     MOVE    "SUB-TEST-F1-33-1" TO PAR-NAME.                      NC1064.2 279
   001987         199000     MOVE 1 TO REC-CT.                                            NC1064.2 326
   001988         199100     IF WRK-DU-2V2-1 = ZERO PERFORM PASS PERFORM PRINT-DETAIL     NC1064.2 63 IMP 429 433
   001989         199200     ELSE                                                         NC1064.2
   001990      1  199300     PERFORM FAIL MOVE WRK-DU-2V2-1 TO COMPUTED-N MOVE ZERO       NC1064.2 430 63 291 IMP
   001991      1  199400     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001992         199500     ADD 1 TO REC-CT.                                             NC1064.2 326
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001993         199600 SUB-TEST-F1-33-2.                                                NC1064.2
   001994         199700     MOVE    "SUB-TEST-F1-33-2" TO PAR-NAME.                      NC1064.2 279
   001995         199800     IF WRK-DS-2V2-1 = -12.34 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 79 429 433
   001996         199900     ELSE                                                         NC1064.2
   001997      1  200000     PERFORM FAIL MOVE WRK-DS-2V2-1 TO COMPUTED-N MOVE -12.34     NC1064.2 430 79 291
   001998      1  200100     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   001999         200200     ADD 1 TO REC-CT.                                             NC1064.2 326
   002000         200300 SUB-TEST-F1-33-3.                                                NC1064.2
   002001         200400     MOVE    "SUB-TEST-F1-33-3" TO PAR-NAME.                      NC1064.2 279
   002002         200500     IF WRK-DS-2V2-2 = -24.68 PERFORM PASS PERFORM PRINT-DETAIL   NC1064.2 80 429 433
   002003         200600     ELSE                                                         NC1064.2
   002004      1  200700     PERFORM FAIL MOVE WRK-DS-2V2-2 TO COMPUTED-N MOVE -24.68     NC1064.2 430 80 291
   002005      1  200800     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   002006         200900     ADD 1 TO REC-CT.                                             NC1064.2 326
   002007         201000 SUB-TEST-F1-33-4.                                                NC1064.2
   002008         201100     MOVE    "SUB-TEST-F1-33-4" TO PAR-NAME.                      NC1064.2 279
   002009         201200     IF WRK-DU-2V2-2 = 09.99 PERFORM PASS PERFORM PRINT-DETAIL    NC1064.2 64 429 433
   002010         201300     ELSE                                                         NC1064.2
   002011      1  201400     PERFORM FAIL MOVE WRK-DU-2V2-2 TO COMPUTED-N MOVE 09.99      NC1064.2 430 64 291
   002012      1  201500     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC1064.2 305 433
   002013         201600     ADD 1 TO REC-CT.                                             NC1064.2 326
   002014         201700 SUB-TEST-F1-33-5.                                                NC1064.2
   002015         201800     MOVE    "SUB-TEST-F1-33-5" TO PAR-NAME.                      NC1064.2 279
   002016         201900     IF WRK-DU-16V2-1 = 9999999999999987.65 PERFORM PASS          NC1064.2 73 429
   002017      1  202000     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   002018      1  202100     PERFORM FAIL MOVE WRK-DU-16V2-1 TO WRK-NE-X-1                NC1064.2 430 73 40
   002019      1  202200     MOVE WRK-NE-X-1 TO COMPUTED-A                                NC1064.2 40 290
   002020      1  202300     MOVE "9999999999999987.65" TO CORRECT-A PERFORM PRINT-DETAIL.NC1064.2 304 433
   002021         202400     ADD 1 TO REC-CT.                                             NC1064.2 326
   002022         202500 SUB-TEST-F1-33-6.                                                NC1064.2
   002023         202600     MOVE    "SUB-TEST-F1-33-6" TO PAR-NAME.                      NC1064.2 279
   002024         202700     IF WRK-DS-16V2-1 = -9999999999999999.99 PERFORM PASS         NC1064.2 81 429
   002025      1  202800     PERFORM PRINT-DETAIL ELSE                                    NC1064.2 433
   002026      1  202900     PERFORM FAIL MOVE WRK-DS-16V2-1 TO WRK-NE-X-2                NC1064.2 430 81 41
   002027      1  203000     MOVE WRK-NE-X-2 TO COMPUTED-A                                NC1064.2 41 290
   002028      1  203100     MOVE "-9999999999999999.99" TO CORRECT-A                     NC1064.2 304
   002029      1  203200     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   002030         203300     ADD 1 TO REC-CT.                                             NC1064.2 326
   002031         203400 SUB-TEST-F1-33-7.                                                NC1064.2
   002032         203500     MOVE   "SUB-TEST-F1-33-7" TO PAR-NAME.                       NC1064.2 279
   002033         203600     IF      SIZE-ERR2 = "A"                                      NC1064.2 126
   002034      1  203700             PERFORM PASS                                         NC1064.2 429
   002035      1  203800             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002036         203900     ELSE                                                         NC1064.2
   002037      1  204000             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1064.2
   002038      1  204100                  TO RE-MARK                                      NC1064.2 284
   002039      1  204200             MOVE   "A"        TO CORRECT-X                       NC1064.2 303
   002040      1  204300             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   002041      1  204400             PERFORM FAIL                                         NC1064.2 430
   002042      1  204500             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002043         204600*                                                                 NC1064.2
   002044         204700 SUB-INIT-F1-34.                                                  NC1064.2
   002045         204800*    ==-->  EXPLICIT SCOPE TERMINATOR <--==                       NC1064.2
   002046         204900*    ==-->          SIZE ERROR        <--==                       NC1064.2
   002047         205000     MOVE   "IV-41 6.4.3"       TO ANSI-REFERENCE.                NC1064.2 335
   002048         205100     MOVE     -11 TO WRK-DS-02V00.                                NC1064.2 153
   002049         205200     MOVE    SPACE TO WRK-XN-00001.                               NC1064.2 IMP 42
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002050         205300     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   002051         205400     MOVE    SPACE TO SIZE-ERR3.                                  NC1064.2 IMP 127
   002052         205500     MOVE    SPACE TO SIZE-ERR4.                                  NC1064.2 IMP 128
   002053         205600     MOVE    1  TO REC-CT.                                        NC1064.2 326
   002054         205700 SUB-TEST-F1-34-0.                                                NC1064.2
   002055         205800     SUBTRACT A99-DS-02V00 FROM WRK-DS-02V00                      NC1064.2 159 153
   002056         205900          ON SIZE ERROR                                           NC1064.2
   002057      1  206000             MOVE   "1" TO WRK-XN-00001                           NC1064.2 42
   002058      1  206100             MOVE   "A" TO SIZE-ERR2                              NC1064.2 126
   002059      1  206200             MOVE   "B" TO SIZE-ERR3                              NC1064.2 127
   002060         206300     END-SUBTRACT                                                 NC1064.2
   002061         206400     MOVE   "C" TO SIZE-ERR4.                                     NC1064.2 128
   002062         206500     GO TO   SUB-TEST-F1-34-1.                                    NC1064.2 2067
   002063         206600 SUB-DELETE-F1-34.                                                NC1064.2
   002064         206700     PERFORM DE-LETE.                                             NC1064.2 431
   002065         206800     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   002066         206900     GO TO   SUB-INIT-F1-35.                                      NC1064.2 2132
   002067         207000 SUB-TEST-F1-34-1.                                                NC1064.2
   002068         207100     MOVE   "SUB-TEST-F1-34-1" TO PAR-NAME.                       NC1064.2 279
   002069         207200     IF      WRK-XN-00001 = "1"                                   NC1064.2 42
   002070      1  207300             PERFORM PASS                                         NC1064.2 429
   002071      1  207400             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002072         207500     ELSE                                                         NC1064.2
   002073      1  207600             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1064.2
   002074      1  207700                  TO RE-MARK                                      NC1064.2 284
   002075      1  207800             MOVE   "1"           TO CORRECT-X                    NC1064.2 303
   002076      1  207900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1064.2 42 289
   002077      1  208000             PERFORM FAIL                                         NC1064.2 430
   002078      1  208100             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002079         208200     ADD     1 TO REC-CT.                                         NC1064.2 326
   002080         208300 SUB-TEST-F1-34-2.                                                NC1064.2
   002081         208400     MOVE   "SUB-TEST-F1-34-2" TO PAR-NAME.                       NC1064.2 279
   002082         208500     IF      SIZE-ERR2 = "A"                                      NC1064.2 126
   002083      1  208600             PERFORM PASS                                         NC1064.2 429
   002084      1  208700             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002085         208800     ELSE                                                         NC1064.2
   002086      1  208900             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1064.2
   002087      1  209000                  TO RE-MARK                                      NC1064.2 284
   002088      1  209100             MOVE   "A"        TO CORRECT-X                       NC1064.2 303
   002089      1  209200             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   002090      1  209300             PERFORM FAIL                                         NC1064.2 430
   002091      1  209400             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002092         209500     ADD     1 TO REC-CT.                                         NC1064.2 326
   002093         209600 SUB-TEST-F1-34-3.                                                NC1064.2
   002094         209700     MOVE   "SUB-TEST-F1-34-3" TO PAR-NAME.                       NC1064.2 279
   002095         209800     IF      SIZE-ERR3 = "B"                                      NC1064.2 127
   002096      1  209900             PERFORM PASS                                         NC1064.2 429
   002097      1  210000             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002098         210100     ELSE                                                         NC1064.2
   002099      1  210200             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1064.2
   002100      1  210300                  TO RE-MARK                                      NC1064.2 284
   002101      1  210400             MOVE   "B"        TO CORRECT-X                       NC1064.2 303
   002102      1  210500             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1064.2 127 289
   002103      1  210600             PERFORM FAIL                                         NC1064.2 430
   002104      1  210700             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002105         210800     ADD     1 TO REC-CT.                                         NC1064.2 326
   002106         210900 SUB-TEST-F1-34-4.                                                NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002107         211000     MOVE   "SUB-TEST-F1-34-4" TO PAR-NAME.                       NC1064.2 279
   002108         211100     IF      SIZE-ERR4 = "C"                                      NC1064.2 128
   002109      1  211200             PERFORM PASS                                         NC1064.2 429
   002110      1  211300             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002111         211400     ELSE                                                         NC1064.2
   002112      1  211500             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1064.2
   002113      1  211600                  TO RE-MARK                                      NC1064.2 284
   002114      1  211700             MOVE   "C"        TO CORRECT-X                       NC1064.2 303
   002115      1  211800             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1064.2 128 289
   002116      1  211900             PERFORM FAIL                                         NC1064.2 430
   002117      1  212000             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002118         212100     ADD     1 TO REC-CT.                                         NC1064.2 326
   002119         212200 SUB-TEST-F1-34-5.                                                NC1064.2
   002120         212300     MOVE   "SUB-TEST-F1-34-5" TO PAR-NAME.                       NC1064.2 279
   002121         212400     IF      WRK-DS-02V00 = -11                                   NC1064.2 153
   002122      1  212500             PERFORM PASS                                         NC1064.2 429
   002123      1  212600             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002124         212700     ELSE                                                         NC1064.2
   002125      1  212800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1064.2
   002126      1  212900                  TO RE-MARK                                      NC1064.2 284
   002127      1  213000             MOVE    -11          TO CORRECT-N                    NC1064.2 305
   002128      1  213100             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1064.2 153 291
   002129      1  213200             PERFORM FAIL                                         NC1064.2 430
   002130      1  213300             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002131         213400*                                                                 NC1064.2
   002132         213500 SUB-INIT-F1-35.                                                  NC1064.2
   002133         213600*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1064.2
   002134         213700     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1064.2 335
   002135         213800     MOVE   "SUB-TEST-F1-35"  TO PAR-NAME.                        NC1064.2 279
   002136         213900     MOVE    SPACE TO WRK-XN-00001.                               NC1064.2 IMP 42
   002137         214000     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   002138         214100     MOVE    SPACE TO SIZE-ERR3.                                  NC1064.2 IMP 127
   002139         214200     MOVE    SPACE TO SIZE-ERR4.                                  NC1064.2 IMP 128
   002140         214300     MOVE    ZERO  TO WRK-DS-06V06.                               NC1064.2 IMP 147
   002141         214400     MOVE    1     TO REC-CT.                                     NC1064.2 326
   002142         214500 SUB-TEST-F1-35-0.                                                NC1064.2
   002143         214600     SUBTRACT A12THREES-DS-06V06                                  NC1064.2 145
   002144         214700              333333                                              NC1064.2
   002145         214800              A06THREES-DS-03V03                                  NC1064.2 143
   002146         214900              -0000009                                            NC1064.2
   002147         215000              FROM WRK-DS-06V06 ROUNDED                           NC1064.2 147
   002148         215100          ON SIZE ERROR                                           NC1064.2
   002149      1  215200             MOVE   "1" TO WRK-XN-00001                           NC1064.2 42
   002150      1  215300             MOVE   "A" TO SIZE-ERR2                              NC1064.2 126
   002151      1  215400             MOVE   "B" TO SIZE-ERR3                              NC1064.2 127
   002152         215500     END-SUBTRACT                                                 NC1064.2
   002153         215600     MOVE   "C" TO SIZE-ERR4.                                     NC1064.2 128
   002154         215700     GO TO   SUB-TEST-F1-35-1.                                    NC1064.2 2159
   002155         215800 SUB-DELETE-F1-35.                                                NC1064.2
   002156         215900     PERFORM DE-LETE.                                             NC1064.2 431
   002157         216000     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   002158         216100     GO TO   SUB-INIT-F1-36.                                      NC1064.2 2224
   002159         216200 SUB-TEST-F1-35-1.                                                NC1064.2
   002160         216300     MOVE   "SUB-TEST-F1-35-1" TO PAR-NAME.                       NC1064.2 279
   002161         216400     IF      WRK-XN-00001 = SPACE                                 NC1064.2 42 IMP
   002162      1  216500             PERFORM PASS                                         NC1064.2 429
   002163      1  216600             PERFORM PRINT-DETAIL                                 NC1064.2 433
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002164         216700     ELSE                                                         NC1064.2
   002165      1  216800             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1064.2
   002166      1  216900                  TO RE-MARK                                      NC1064.2 284
   002167      1  217000             MOVE    SPACE        TO CORRECT-X                    NC1064.2 IMP 303
   002168      1  217100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1064.2 42 289
   002169      1  217200             PERFORM FAIL                                         NC1064.2 430
   002170      1  217300             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002171         217400     ADD     1 TO REC-CT.                                         NC1064.2 326
   002172         217500 SUB-TEST-F1-35-2.                                                NC1064.2
   002173         217600     MOVE   "SUB-TEST-F1-35-2" TO PAR-NAME.                       NC1064.2 279
   002174         217700     IF      SIZE-ERR2 = SPACE                                    NC1064.2 126 IMP
   002175      1  217800             PERFORM PASS                                         NC1064.2 429
   002176      1  217900             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002177         218000     ELSE                                                         NC1064.2
   002178      1  218100             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1064.2
   002179      1  218200                  TO RE-MARK                                      NC1064.2 284
   002180      1  218300             MOVE    SPACE     TO CORRECT-X                       NC1064.2 IMP 303
   002181      1  218400             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   002182      1  218500             PERFORM FAIL                                         NC1064.2 430
   002183      1  218600             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002184         218700     ADD     1 TO REC-CT.                                         NC1064.2 326
   002185         218800 SUB-TEST-F1-35-3.                                                NC1064.2
   002186         218900     MOVE   "SUB-TEST-F1-35-3" TO PAR-NAME.                       NC1064.2 279
   002187         219000     IF      SIZE-ERR3 = SPACE                                    NC1064.2 127 IMP
   002188      1  219100             PERFORM PASS                                         NC1064.2 429
   002189      1  219200             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002190         219300     ELSE                                                         NC1064.2
   002191      1  219400             MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"        NC1064.2
   002192      1  219500                  TO RE-MARK                                      NC1064.2 284
   002193      1  219600             MOVE    SPACE     TO CORRECT-X                       NC1064.2 IMP 303
   002194      1  219700             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1064.2 127 289
   002195      1  219800             PERFORM FAIL                                         NC1064.2 430
   002196      1  219900             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002197         220000     ADD     1 TO REC-CT.                                         NC1064.2 326
   002198         220100 SUB-TEST-F1-35-4.                                                NC1064.2
   002199         220200     MOVE   "SUB-TEST-F1-35-4" TO PAR-NAME.                       NC1064.2 279
   002200         220300     IF      SIZE-ERR4 = "C"                                      NC1064.2 128
   002201      1  220400             PERFORM PASS                                         NC1064.2 429
   002202      1  220500             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002203         220600     ELSE                                                         NC1064.2
   002204      1  220700             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1064.2
   002205      1  220800                  TO RE-MARK                                      NC1064.2 284
   002206      1  220900             MOVE   "C"        TO CORRECT-X                       NC1064.2 303
   002207      1  221000             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1064.2 128 289
   002208      1  221100             PERFORM FAIL                                         NC1064.2 430
   002209      1  221200             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002210         221300     ADD     1 TO REC-CT.                                         NC1064.2 326
   002211         221400 SUB-TEST-F1-35-5.                                                NC1064.2
   002212         221500     MOVE   "SUB-TEST-F1-35-5" TO PAR-NAME.                       NC1064.2 279
   002213         221600     IF      WRK-DS-06V06 = -666990.666333                        NC1064.2 147
   002214      1  221700             PERFORM PASS                                         NC1064.2 429
   002215      1  221800             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002216         221900     ELSE                                                         NC1064.2
   002217      1  222000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1064.2
   002218      1  222100                  TO RE-MARK                                      NC1064.2 284
   002219      1  222200             MOVE   -666990.666333 TO CORRECT-N                   NC1064.2 305
   002220      1  222300             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1064.2 147 291
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002221      1  222400             PERFORM FAIL                                         NC1064.2 430
   002222      1  222500             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002223         222600*                                                                 NC1064.2
   002224         222700 SUB-INIT-F1-36.                                                  NC1064.2
   002225         222800*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1064.2
   002226         222900     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1064.2 335
   002227         223000     MOVE   "SUB-TEST-F1-36"  TO PAR-NAME.                        NC1064.2 279
   002228         223100     MOVE   SPACE TO WRK-XN-00001.                                NC1064.2 IMP 42
   002229         223200     MOVE   SPACE TO SIZE-ERR2.                                   NC1064.2 IMP 126
   002230         223300     MOVE   SPACE TO SIZE-ERR3.                                   NC1064.2 IMP 127
   002231         223400     MOVE   SPACE TO SIZE-ERR4.                                   NC1064.2 IMP 128
   002232         223500     MOVE   -11   TO WRK-DS-02V00.                                NC1064.2 153
   002233         223600     MOVE       1 TO REC-CT.                                      NC1064.2 326
   002234         223700 SUB-TEST-F1-36-0.                                                NC1064.2
   002235         223800     SUBTRACT A99-DS-02V00 FROM WRK-DS-02V00                      NC1064.2 159 153
   002236         223900         NOT ON SIZE ERROR                                        NC1064.2
   002237      1  224000             MOVE   "1" TO WRK-XN-00001                           NC1064.2 42
   002238      1  224100             MOVE   "A" TO SIZE-ERR2                              NC1064.2 126
   002239      1  224200             MOVE   "B" TO SIZE-ERR3                              NC1064.2 127
   002240         224300     END-SUBTRACT                                                 NC1064.2
   002241         224400     MOVE   "C" TO SIZE-ERR4.                                     NC1064.2 128
   002242         224500     GO TO   SUB-TEST-F1-36-1.                                    NC1064.2 2247
   002243         224600 SUB-DELETE-F1-36.                                                NC1064.2
   002244         224700     PERFORM DE-LETE.                                             NC1064.2 431
   002245         224800     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   002246         224900     GO      TO SUB-INIT-F1-37.                                   NC1064.2 2312
   002247         225000 SUB-TEST-F1-36-1.                                                NC1064.2
   002248         225100     MOVE   "SUB-TEST-F1-36-1" TO PAR-NAME.                       NC1064.2 279
   002249         225200     IF      WRK-XN-00001 = SPACE                                 NC1064.2 42 IMP
   002250      1  225300             PERFORM PASS                                         NC1064.2 429
   002251      1  225400             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002252         225500     ELSE                                                         NC1064.2
   002253      1  225600             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1064.2
   002254      1  225700                  TO RE-MARK                                      NC1064.2 284
   002255      1  225800             MOVE    SPACE        TO CORRECT-X                    NC1064.2 IMP 303
   002256      1  225900             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1064.2 42 289
   002257      1  226000             PERFORM FAIL                                         NC1064.2 430
   002258      1  226100             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002259         226200     ADD     1 TO REC-CT.                                         NC1064.2 326
   002260         226300 SUB-TEST-F1-36-2.                                                NC1064.2
   002261         226400     MOVE   "SUB-TEST-F1-36-2" TO PAR-NAME.                       NC1064.2 279
   002262         226500     IF      SIZE-ERR2 = SPACE                                    NC1064.2 126 IMP
   002263      1  226600             PERFORM PASS                                         NC1064.2 429
   002264      1  226700             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002265         226800     ELSE                                                         NC1064.2
   002266      1  226900             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1064.2
   002267      1  227000                  TO RE-MARK                                      NC1064.2 284
   002268      1  227100             MOVE    SPACE     TO CORRECT-X                       NC1064.2 IMP 303
   002269      1  227200             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   002270      1  227300             PERFORM FAIL                                         NC1064.2 430
   002271      1  227400             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002272         227500     ADD     1 TO REC-CT.                                         NC1064.2 326
   002273         227600 SUB-TEST-F1-36-3.                                                NC1064.2
   002274         227700     MOVE   "SUB-TEST-F1-36-3" TO PAR-NAME.                       NC1064.2 279
   002275         227800     IF      SIZE-ERR3 = SPACE                                    NC1064.2 127 IMP
   002276      1  227900             PERFORM PASS                                         NC1064.2 429
   002277      1  228000             PERFORM PRINT-DETAIL                                 NC1064.2 433
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002278         228100     ELSE                                                         NC1064.2
   002279      1  228200             MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"    NC1064.2
   002280      1  228300                  TO RE-MARK                                      NC1064.2 284
   002281      1  228400             MOVE    SPACE     TO CORRECT-X                       NC1064.2 IMP 303
   002282      1  228500             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1064.2 127 289
   002283      1  228600             PERFORM FAIL                                         NC1064.2 430
   002284      1  228700             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002285      1  228800     ADD     1 TO REC-CT.                                         NC1064.2 326
   002286         228900 SUB-TEST-F1-36-4.                                                NC1064.2
   002287         229000     MOVE   "SUB-TEST-F1-36-4" TO PAR-NAME.                       NC1064.2 279
   002288         229100     IF      SIZE-ERR4 = "C"                                      NC1064.2 128
   002289      1  229200             PERFORM PASS                                         NC1064.2 429
   002290      1  229300             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002291         229400     ELSE                                                         NC1064.2
   002292      1  229500             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1064.2
   002293      1  229600                  TO RE-MARK                                      NC1064.2 284
   002294      1  229700             MOVE   "C"        TO CORRECT-X                       NC1064.2 303
   002295      1  229800             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1064.2 128 289
   002296      1  229900             PERFORM FAIL                                         NC1064.2 430
   002297      1  230000             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002298         230100     ADD     1 TO REC-CT.                                         NC1064.2 326
   002299         230200 SUB-TEST-F1-36-5.                                                NC1064.2
   002300         230300     MOVE   "SUB-TEST-F1-36-5" TO PAR-NAME.                       NC1064.2 279
   002301         230400     IF      WRK-DS-02V00 = -11                                   NC1064.2 153
   002302      1  230500             PERFORM PASS                                         NC1064.2 429
   002303      1  230600             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002304         230700     ELSE                                                         NC1064.2
   002305      1  230800             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1064.2
   002306      1  230900                  TO RE-MARK                                      NC1064.2 284
   002307      1  231000             MOVE    -11          TO CORRECT-N                    NC1064.2 305
   002308      1  231100             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1064.2 153 291
   002309      1  231200             PERFORM FAIL                                         NC1064.2 430
   002310      1  231300             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002311         231400*                                                                 NC1064.2
   002312         231500 SUB-INIT-F1-37.                                                  NC1064.2
   002313         231600*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1064.2
   002314         231700     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1064.2 335
   002315         231800     MOVE   "SUB-TEST-F1-37"  TO PAR-NAME.                        NC1064.2 279
   002316         231900     MOVE    SPACE TO WRK-XN-00001.                               NC1064.2 IMP 42
   002317         232000     MOVE    SPACE TO SIZE-ERR2.                                  NC1064.2 IMP 126
   002318         232100     MOVE    SPACE TO SIZE-ERR3.                                  NC1064.2 IMP 127
   002319         232200     MOVE    SPACE TO SIZE-ERR4.                                  NC1064.2 IMP 128
   002320         232300     MOVE    ZERO  TO WRK-DS-06V06.                               NC1064.2 IMP 147
   002321         232400     MOVE    1     TO REC-CT.                                     NC1064.2 326
   002322         232500 SUB-TEST-F1-37-0.                                                NC1064.2
   002323         232600     SUBTRACT A12THREES-DS-06V06                                  NC1064.2 145
   002324         232700              333333                                              NC1064.2
   002325         232800              A06THREES-DS-03V03                                  NC1064.2 143
   002326         232900              -0000009                                            NC1064.2
   002327         233000              FROM WRK-DS-06V06 ROUNDED                           NC1064.2 147
   002328         233100         NOT ON SIZE ERROR                                        NC1064.2
   002329      1  233200             MOVE   "1" TO WRK-XN-00001                           NC1064.2 42
   002330      1  233300             MOVE   "A" TO SIZE-ERR2                              NC1064.2 126
   002331      1  233400             MOVE   "B" TO SIZE-ERR3                              NC1064.2 127
   002332         233500     END-SUBTRACT                                                 NC1064.2
   002333         233600     MOVE   "C" TO SIZE-ERR4.                                     NC1064.2 128
   002334         233700     GO TO   SUB-TEST-F1-37-1.                                    NC1064.2 2339
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002335         233800 SUB-DELETE-F1-37.                                                NC1064.2
   002336         233900     PERFORM DE-LETE.                                             NC1064.2 431
   002337         234000     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   002338         234100     GO TO   SUB-INIT-F1-38.                                      NC1064.2 2404
   002339         234200 SUB-TEST-F1-37-1.                                                NC1064.2
   002340         234300     MOVE   "SUB-TEST-F1-37-1" TO PAR-NAME.                       NC1064.2 279
   002341         234400     IF      WRK-XN-00001 = "1"                                   NC1064.2 42
   002342      1  234500             PERFORM PASS                                         NC1064.2 429
   002343      1  234600             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002344         234700     ELSE                                                         NC1064.2
   002345      1  234800             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1064.2
   002346      1  234900                  TO RE-MARK                                      NC1064.2 284
   002347      1  235000             MOVE   "1"           TO CORRECT-X                    NC1064.2 303
   002348      1  235100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1064.2 42 289
   002349      1  235200             PERFORM FAIL                                         NC1064.2 430
   002350      1  235300             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002351         235400     ADD     1 TO REC-CT.                                         NC1064.2 326
   002352         235500 SUB-TEST-F1-37-2.                                                NC1064.2
   002353         235600     MOVE   "SUB-TEST-F1-37-2" TO PAR-NAME.                       NC1064.2 279
   002354         235700     IF      SIZE-ERR2 = "A"                                      NC1064.2 126
   002355      1  235800             PERFORM PASS                                         NC1064.2 429
   002356      1  235900             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002357         236000     ELSE                                                         NC1064.2
   002358      1  236100             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1064.2
   002359      1  236200                  TO RE-MARK                                      NC1064.2 284
   002360      1  236300             MOVE   "A"        TO CORRECT-X                       NC1064.2 303
   002361      1  236400             MOVE    SIZE-ERR2 TO COMPUTED-X                      NC1064.2 126 289
   002362      1  236500             PERFORM FAIL                                         NC1064.2 430
   002363      1  236600             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002364         236700     ADD     1 TO REC-CT.                                         NC1064.2 326
   002365         236800 SUB-TEST-F1-37-3.                                                NC1064.2
   002366         236900     MOVE   "SUB-TEST-F1-37-3" TO PAR-NAME.                       NC1064.2 279
   002367         237000     IF      SIZE-ERR3 = "B"                                      NC1064.2 127
   002368      1  237100             PERFORM PASS                                         NC1064.2 429
   002369      1  237200             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002370         237300     ELSE                                                         NC1064.2
   002371      1  237400             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1064.2
   002372      1  237500                  TO RE-MARK                                      NC1064.2 284
   002373      1  237600             MOVE   "B"        TO CORRECT-X                       NC1064.2 303
   002374      1  237700             MOVE    SIZE-ERR3 TO COMPUTED-X                      NC1064.2 127 289
   002375      1  237800             PERFORM FAIL                                         NC1064.2 430
   002376      1  237900             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002377         238000     ADD     1 TO REC-CT.                                         NC1064.2 326
   002378         238100 SUB-TEST-F1-37-4.                                                NC1064.2
   002379         238200     MOVE   "SUB-TEST-F1-37-4" TO PAR-NAME.                       NC1064.2 279
   002380         238300     IF      SIZE-ERR4 = "C"                                      NC1064.2 128
   002381      1  238400             PERFORM PASS                                         NC1064.2 429
   002382      1  238500             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002383         238600     ELSE                                                         NC1064.2
   002384      1  238700             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1064.2
   002385      1  238800                  TO RE-MARK                                      NC1064.2 284
   002386      1  238900             MOVE   "C"        TO CORRECT-X                       NC1064.2 303
   002387      1  239000             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1064.2 128 289
   002388      1  239100             PERFORM FAIL                                         NC1064.2 430
   002389      1  239200             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002390         239300     ADD     1 TO REC-CT.                                         NC1064.2 326
   002391         239400 SUB-TEST-F1-37-5.                                                NC1064.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002392         239500     MOVE   "SUB-TEST-F1-37-5" TO PAR-NAME.                       NC1064.2 279
   002393         239600     IF      WRK-DS-06V06 = -666990.666333                        NC1064.2 147
   002394      1  239700             PERFORM PASS                                         NC1064.2 429
   002395      1  239800             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002396         239900     ELSE                                                         NC1064.2
   002397      1  240000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1064.2
   002398      1  240100                  TO RE-MARK                                      NC1064.2 284
   002399      1  240200             MOVE   -666990.666333 TO CORRECT-N                   NC1064.2 305
   002400      1  240300             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1064.2 147 291
   002401      1  240400             PERFORM FAIL                                         NC1064.2 430
   002402      1  240500             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002403         240600*                                                                 NC1064.2
   002404         240700 SUB-INIT-F1-38.                                                  NC1064.2
   002405         240800*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1064.2
   002406         240900     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1064.2 335
   002407         241000     MOVE   "SUB-TEST-F1-38"  TO PAR-NAME.                        NC1064.2 279
   002408         241100     MOVE   "0"   TO WRK-XN-00001.                                NC1064.2 42
   002409         241200     MOVE   "0"   TO SIZE-ERR4.                                   NC1064.2 128
   002410         241300     MOVE    -11  TO WRK-DS-02V00.                                NC1064.2 153
   002411         241400     MOVE    1    TO REC-CT.                                      NC1064.2 326
   002412         241500 SUB-TEST-F1-38-0.                                                NC1064.2
   002413         241600     SUBTRACT A99-DS-02V00 FROM WRK-DS-02V00                      NC1064.2 159 153
   002414         241700          ON SIZE ERROR                                           NC1064.2
   002415      1  241800             MOVE   SPACE TO WRK-XN-00001                         NC1064.2 IMP 42
   002416         241900      NOT ON SIZE ERROR                                           NC1064.2
   002417      1  242000             MOVE   "1" TO WRK-XN-00001                           NC1064.2 42
   002418         242100     END-SUBTRACT                                                 NC1064.2
   002419         242200     MOVE   "C" TO SIZE-ERR4.                                     NC1064.2 128
   002420         242300     GO TO   SUB-TEST-F1-38-1.                                    NC1064.2 2425
   002421         242400 SUB-DELETE-F1-38.                                                NC1064.2
   002422         242500     PERFORM DE-LETE.                                             NC1064.2 431
   002423         242600     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   002424         242700     GO TO   SUB-INIT-F1-39.                                      NC1064.2 2464
   002425         242800 SUB-TEST-F1-38-1.                                                NC1064.2
   002426         242900     MOVE   "SUB-TEST-F1-38-1" TO PAR-NAME.                       NC1064.2 279
   002427         243000     IF      WRK-XN-00001 = SPACE                                 NC1064.2 42 IMP
   002428      1  243100             PERFORM PASS                                         NC1064.2 429
   002429      1  243200             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002430         243300     ELSE                                                         NC1064.2
   002431      1  243400             MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"            NC1064.2
   002432      1  243500                  TO RE-MARK                                      NC1064.2 284
   002433      1  243600             MOVE    SPACE        TO CORRECT-X                    NC1064.2 IMP 303
   002434      1  243700             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1064.2 42 289
   002435      1  243800             PERFORM FAIL                                         NC1064.2 430
   002436      1  243900             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002437         244000     ADD     1 TO REC-CT.                                         NC1064.2 326
   002438         244100 SUB-TEST-F1-38-2.                                                NC1064.2
   002439         244200     MOVE   "SUB-TEST-F1-38-2" TO PAR-NAME.                       NC1064.2 279
   002440         244300     IF      SIZE-ERR4 = "C"                                      NC1064.2 128
   002441      1  244400             PERFORM PASS                                         NC1064.2 429
   002442      1  244500             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002443         244600     ELSE                                                         NC1064.2
   002444      1  244700             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1064.2
   002445      1  244800                  TO RE-MARK                                      NC1064.2 284
   002446      1  244900             MOVE   "C"        TO CORRECT-X                       NC1064.2 303
   002447      1  245000             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1064.2 128 289
   002448      1  245100             PERFORM FAIL                                         NC1064.2 430
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    46
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002449      1  245200             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002450         245300     ADD     1 TO REC-CT.                                         NC1064.2 326
   002451         245400 SUB-TEST-F1-38-3.                                                NC1064.2
   002452         245500     MOVE   "SUB-TEST-F1-38-3" TO PAR-NAME.                       NC1064.2 279
   002453         245600     IF      WRK-DS-02V00 = -11                                   NC1064.2 153
   002454      1  245700             PERFORM PASS                                         NC1064.2 429
   002455      1  245800             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002456         245900     ELSE                                                         NC1064.2
   002457      1  246000             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1064.2
   002458      1  246100                  TO RE-MARK                                      NC1064.2 284
   002459      1  246200             MOVE    -11          TO CORRECT-N                    NC1064.2 305
   002460      1  246300             MOVE    WRK-DS-02V00 TO COMPUTED-N                   NC1064.2 153 291
   002461      1  246400             PERFORM FAIL                                         NC1064.2 430
   002462      1  246500             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002463         246600*                                                                 NC1064.2
   002464         246700 SUB-INIT-F1-39.                                                  NC1064.2
   002465         246800*    ==--> EXPLICIT SCOPE TERMINATOR<--==                         NC1064.2
   002466         246900     MOVE   "IV-41 6.4.3"     TO ANSI-REFERENCE.                  NC1064.2 335
   002467         247000     MOVE   "SUB-TEST-F1-39"  TO PAR-NAME.                        NC1064.2 279
   002468         247100     MOVE    SPACE TO WRK-XN-00001.                               NC1064.2 IMP 42
   002469         247200     MOVE    SPACE TO SIZE-ERR4.                                  NC1064.2 IMP 128
   002470         247300     MOVE    ZERO  TO WRK-DS-06V06.                               NC1064.2 IMP 147
   002471         247400     MOVE    1     TO REC-CT.                                     NC1064.2 326
   002472         247500 SUB-TEST-F1-39-0.                                                NC1064.2
   002473         247600     SUBTRACT A12THREES-DS-06V06                                  NC1064.2 145
   002474         247700              333333                                              NC1064.2
   002475         247800              A06THREES-DS-03V03                                  NC1064.2 143
   002476         247900              -0000009                                            NC1064.2
   002477         248000        FROM WRK-DS-06V06 ROUNDED                                 NC1064.2 147
   002478         248100             ON SIZE ERROR                                        NC1064.2
   002479      1  248200             MOVE   "X" TO WRK-XN-00001                           NC1064.2 42
   002480         248300         NOT ON SIZE ERROR                                        NC1064.2
   002481      1  248400             MOVE   "1" TO WRK-XN-00001                           NC1064.2 42
   002482         248500     END-SUBTRACT                                                 NC1064.2
   002483         248600     MOVE   "C" TO SIZE-ERR4.                                     NC1064.2 128
   002484         248700     GO TO   SUB-TEST-F1-39-1.                                    NC1064.2 2489
   002485         248800 SUB-DELETE-F1-39.                                                NC1064.2
   002486         248900     PERFORM DE-LETE.                                             NC1064.2 431
   002487         249000     PERFORM PRINT-DETAIL.                                        NC1064.2 433
   002488         249100     GO TO   CCVS-EXIT.                                           NC1064.2 2528
   002489         249200 SUB-TEST-F1-39-1.                                                NC1064.2
   002490         249300     MOVE   "SUB-TEST-F1-39-1" TO PAR-NAME.                       NC1064.2 279
   002491         249400     IF      WRK-XN-00001 = "1"                                   NC1064.2 42
   002492      1  249500             PERFORM PASS                                         NC1064.2 429
   002493      1  249600             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002494         249700     ELSE                                                         NC1064.2
   002495      1  249800             MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"        NC1064.2
   002496      1  249900                  TO RE-MARK                                      NC1064.2 284
   002497      1  250000             MOVE   "1"           TO CORRECT-X                    NC1064.2 303
   002498      1  250100             MOVE    WRK-XN-00001 TO COMPUTED-X                   NC1064.2 42 289
   002499      1  250200             PERFORM FAIL                                         NC1064.2 430
   002500      1  250300             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002501         250400     ADD     1 TO REC-CT.                                         NC1064.2 326
   002502         250500 SUB-TEST-F1-39-2.                                                NC1064.2
   002503         250600     MOVE   "SUB-TEST-F1-39-2" TO PAR-NAME.                       NC1064.2 279
   002504         250700     IF      SIZE-ERR4 = "C"                                      NC1064.2 128
   002505      1  250800             PERFORM PASS                                         NC1064.2 429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    47
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002506      1  250900             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002507         251000     ELSE                                                         NC1064.2
   002508      1  251100             MOVE   "SCOPE TERMINATOR IGNORED"                    NC1064.2
   002509      1  251200                  TO RE-MARK                                      NC1064.2 284
   002510      1  251300             MOVE   "C"        TO CORRECT-X                       NC1064.2 303
   002511      1  251400             MOVE    SIZE-ERR4 TO COMPUTED-X                      NC1064.2 128 289
   002512      1  251500             PERFORM FAIL                                         NC1064.2 430
   002513      1  251600             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002514         251700     ADD     1 TO REC-CT.                                         NC1064.2 326
   002515         251800 SUB-TEST-F1-39-3.                                                NC1064.2
   002516         251900     MOVE   "SUB-TEST-F1-39-3" TO PAR-NAME.                       NC1064.2 279
   002517         252000     IF      WRK-DS-06V06 = -666990.666333                        NC1064.2 147
   002518      1  252100             PERFORM PASS                                         NC1064.2 429
   002519      1  252200             PERFORM PRINT-DETAIL                                 NC1064.2 433
   002520         252300     ELSE                                                         NC1064.2
   002521      1  252400             MOVE   "WRONGLY AFFECTED BY SIZE ERROR"              NC1064.2
   002522      1  252500                  TO RE-MARK                                      NC1064.2 284
   002523      1  252600             MOVE   -666990.666333 TO CORRECT-N                   NC1064.2 305
   002524      1  252700             MOVE    WRK-DS-06V06  TO COMPUTED-N                  NC1064.2 147 291
   002525      1  252800             PERFORM FAIL                                         NC1064.2 430
   002526      1  252900             PERFORM PRINT-DETAIL.                                NC1064.2 433
   002527         253000*                                                                 NC1064.2
   002528         253100 CCVS-EXIT SECTION.                                               NC1064.2
   002529         253200 CCVS-999999.                                                     NC1064.2
   002530         253300     GO TO CLOSE-FILES.                                           NC1064.2 422
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    48
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      184   ADD-12
      185   ADD-13
      186   ADD-14
      335   ANSI-REFERENCE . . . . . . . .  512 519 528 M537 M1001 M1020 M1044 M1064 M1089 M1473 M1533 M1618 M1703 M1788
                                            M1873 M1960 M2047 M2134 M2226 M2314 M2406 M2466
      177   AZERO-DS-05V05
      167   A01ONE-DS-P0801
      138   A02ONES-DS-02V00
      161   A03ONES-DS-02V01
      150   A05ONES-DS-00V05 . . . . . . .  661
      136   A05ONES-DS-05V00 . . . . . . .  660
      163   A06ONES-DS-03V03 . . . . . . .  662
      143   A06THREES-DS-03V03 . . . . . .  731 766 1025 1069 2145 2325 2475
      165   A08TWOS-DS-02V06
      134   A10ONES-DS-10V00
      154   A12ONES-DS-12V00
      200   A12SEVENS-CU-18V00
      192   A12THREES-CU-18V00
      145   A12THREES-DS-06V06 . . . . . .  659 732 764 1023 1067 2143 2323 2473
      190   A14TWOS-CS-18V00
      194   A16FOURS-CS-18V00
      188   A18EIGHTS-CS-18V00
      196   A18FIVES-CS-18V00. . . . . . .  951
      170   A18ONES-CS-18V00 . . . . . . .  816
      131   A18ONES-DS-18V00 . . . . . . .  644 800
      198   A18SIXES-CS-18V00
      203   A18THREES-CS-18V00 . . . . . .  952
      129   A18TWOS-DS-18V00 . . . . . . .  643
      173   A99-CS-02V00 . . . . . . . . .  832 847
      159   A99-DS-02V00 . . . . . . . . .  680 698 1004 1047 2055 2235 2413
      314   CCVS-C-1 . . . . . . . . . . .  451 497
      319   CCVS-C-2 . . . . . . . . . . .  452 498
      369   CCVS-E-1 . . . . . . . . . . .  457
      374   CCVS-E-2 . . . . . . . . . . .  466 473 480 485
      377   CCVS-E-2-2 . . . . . . . . . .  M465
      382   CCVS-E-3 . . . . . . . . . . .  486
      391   CCVS-E-4 . . . . . . . . . . .  465
      392   CCVS-E-4-1 . . . . . . . . . .  M463
      394   CCVS-E-4-2 . . . . . . . . . .  M464
      336   CCVS-H-1 . . . . . . . . . . .  446 493
      341   CCVS-H-2A. . . . . . . . . . .  447 494
      350   CCVS-H-2B. . . . . . . . . . .  448 495
      362   CCVS-H-3 . . . . . . . . . . .  449 496
      412   CCVS-PGM-ID. . . . . . . . . .  418 418
      296   CM-18V0
      290   COMPUTED-A . . . . . . . . . .  291 293 294 295 296 524 527 M975 M1527 M1590 M1598 M1675 M1683 M1760 M1768 M1845
                                            M1853 M1932 M1940 M2019 M2027
      291   COMPUTED-N . . . . . . . . . .  M548 M564 M582 M597 M615 M631 M670 M688 M720 M755 M790 M840 M870 M885 M900 M915
                                            M944 M982 M1498 M1505 M1512 M1519 M1561 M1568 M1575 M1582 M1646 M1653 M1660 M1667
                                            M1731 M1738 M1745 M1752 M1816 M1823 M1830 M1837 M1903 M1910 M1917 M1924 M1990
                                            M1997 M2004 M2011 M2128 M2220 M2308 M2400 M2460 M2524
      289   COMPUTED-X . . . . . . . . . .  M441 509 M1611 M1696 M1781 M1866 M1953 M2040 M2076 M2089 M2102 M2115 M2168 M2181
                                            M2194 M2207 M2256 M2269 M2282 M2295 M2348 M2361 M2374 M2387 M2434 M2447 M2498
                                            M2511
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    49
0 Defined   Cross-reference of data names   References

0     293   COMPUTED-0V18
      295   COMPUTED-14V4
      297   COMPUTED-18V0. . . . . . . . .  M652 M808 M824 M956 M1139 M1201 M1215 M1228 M1241 M1254 M1267 M1280 M1293 M1306
                                            M1319 M1332 M1345 M1358 M1371 M1384 M1397 M1410 M1423 M1436 M1448 M1461
      294   COMPUTED-4V14
      313   COR-ANSI-REFERENCE . . . . . .  M519 M521
      304   CORRECT-A. . . . . . . . . . .  305 306 307 308 309 525 527 M976 M1528 M1591 M1599 M1676 M1684 M1761 M1769 M1846
                                            M1854 M1933 M1941 M2020 M2028
      305   CORRECT-N. . . . . . . . . . .  M549 M565 M598 M616 M632 M671 M689 M721 M756 M791 M841 M871 M886 M901 M916 M945
                                            M983 M1499 M1506 M1513 M1520 M1562 M1569 M1576 M1583 M1647 M1654 M1661 M1668
                                            M1732 M1739 M1746 M1753 M1817 M1824 M1831 M1838 M1904 M1911 M1918 M1925 M1991
                                            M1998 M2005 M2012 M2127 M2219 M2307 M2399 M2459 M2523
      303   CORRECT-X. . . . . . . . . . .  M442 511 M1610 M1695 M1780 M1865 M1952 M2039 M2075 M2088 M2101 M2114 M2167 M2180
                                            M2193 M2206 M2255 M2268 M2281 M2294 M2347 M2360 M2373 M2386 M2433 M2446 M2497
                                            M2510
      306   CORRECT-0V18
      308   CORRECT-14V4
      310   CORRECT-18V0 . . . . . . . . .  M653 M809 M825 M957 M1140 M1202 M1214 M1227 M1240 M1253 M1266 M1279 M1292 M1305
                                            M1318 M1331 M1344 M1357 M1370 M1383 M1396 M1409 M1422 M1435 M1449 M1462
      307   CORRECT-4V14
      309   CR-18V0
      272   DECMAL-FIELD
      327   DELETE-COUNTER . . . . . . . .  M431 460 476 478 M1109
       83   DNAME1 . . . . . . . . . . . .  M1091 1113 1155
       92   DNAME10. . . . . . . . . . . .  M1092 1122 1164
       93   DNAME11. . . . . . . . . . . .  M1093 1123 1165
       94   DNAME12. . . . . . . . . . . .  M1093 1124 1166
       95   DNAME13. . . . . . . . . . . .  M1093 1125 1167
       96   DNAME14. . . . . . . . . . . .  M1093 M1093 1126 1168
       97   DNAME15. . . . . . . . . . . .  1127 1169
       98   DNAME16. . . . . . . . . . . .  M1094 1128 1170
       99   DNAME17. . . . . . . . . . . .  M1094 1129 1171
      100   DNAME18. . . . . . . . . . . .  M1094 1130 1172
      101   DNAME19. . . . . . . . . . . .  M1094 1131 1173
       84   DNAME2 . . . . . . . . . . . .  M1091 1114 1156
      102   DNAME20. . . . . . . . . . . .  M1094 1132 1174
      103   DNAME21. . . . . . . . . . . .  M1095 1133 1175
      104   DNAME22. . . . . . . . . . . .  M1096 M1134 1136 1139 M1149 M1176 1198 1201
      105   DNAME23. . . . . . . . . . . .  M1096 M1149 M1177 1211 1215
      106   DNAME24. . . . . . . . . . . .  M1096 M1149 M1178 1224 1228
      107   DNAME25. . . . . . . . . . . .  M1096 M1149 M1179 1237 1241
      108   DNAME26. . . . . . . . . . . .  M1096 M1149 M1180 1250 1254
      109   DNAME27. . . . . . . . . . . .  M1097 M1150 M1181 1263 1267
      110   DNAME28. . . . . . . . . . . .  M1097 M1150 M1182 1276 1280
      111   DNAME29. . . . . . . . . . . .  M1097 M1150 M1183 1289 1293
       85   DNAME3 . . . . . . . . . . . .  M1091 1115 1157
      112   DNAME30. . . . . . . . . . . .  M1097 M1150 M1184 1302 1306
      113   DNAME31. . . . . . . . . . . .  M1097 M1150 M1185 1315 1319
      114   DNAME32. . . . . . . . . . . .  M1098 M1151 M1186 1328 1332
      115   DNAME33. . . . . . . . . . . .  M1098 M1151 M1187 1341 1345
      116   DNAME34. . . . . . . . . . . .  M1098 M1151 M1188 1354 1358
      117   DNAME35. . . . . . . . . . . .  M1098 M1151 M1189 1367 1371
      118   DNAME36. . . . . . . . . . . .  M1098 M1151 M1190 1380 1384
      119   DNAME37. . . . . . . . . . . .  M1099 M1152 M1191 1393 1397
      120   DNAME38. . . . . . . . . . . .  M1099 M1152 M1192 1406 1410
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    50
0 Defined   Cross-reference of data names   References

0     121   DNAME39. . . . . . . . . . . .  M1099 M1152 M1193 1419 1423
       86   DNAME4 . . . . . . . . . . . .  M1091 1116 1158
      122   DNAME40. . . . . . . . . . . .  M1099 M1152 M1194 1432 1436
      123   DNAME41. . . . . . . . . . . .  M1099 M1152 M1195 1445 1448
      124   DNAME42. . . . . . . . . . . .  M1100 M1153 M1196 1458 1461
       87   DNAME5 . . . . . . . . . . . .  M1091 1117 1159
       88   DNAME6 . . . . . . . . . . . .  M1092 1118 1160
       89   DNAME7 . . . . . . . . . . . .  M1092 1119 1161
       90   DNAME8 . . . . . . . . . . . .  M1092 1120 1162
       91   DNAME9 . . . . . . . . . . . .  M1092 1121 1163
      282   DOTVALUE . . . . . . . . . . .  M436
      333   DUMMY-HOLD . . . . . . . . . .  M490 500
       38   DUMMY-RECORD . . . . . . . . .  M446 M447 M448 M449 M451 M452 M453 M455 M457 M466 M473 M480 M485 M486 490 M491
                                            492 M493 M494 M495 M496 M497 M498 M499 M500 504 M505 M514 M529
      380   ENDER-DESC . . . . . . . . . .  M468 M479 M484
      328   ERROR-COUNTER. . . . . . . . .  M430 459 469 472
      332   ERROR-HOLD . . . . . . . . . .  M459 M460 M460 M461 464
      378   ERROR-TOTAL. . . . . . . . . .  M470 M472 M477 M478 M482 M483
      263   EVEN-NAME1
      268   EVEN-NAME2
      275   FEATURE. . . . . . . . . . . .  M536 M639 M641 M677 M695 M727 M797 M995 M1090 M1108
      406   HYPHEN-LINE. . . . . . . . . .  453 455 499
      372   ID-AGAIN . . . . . . . . . . .  M418
      405   INF-ANSI-REFERENCE . . . . . .  M512 M515 M528 M530
      400   INFO-TEXT. . . . . . . . . . .  M513
      329   INSPECT-COUNTER. . . . . . . .  M428 459 481 483
      260   MINUS-NAMES
      261   MINUS-NAME1
      262   MINUS-NAME2
      266   MINUS-NAME3
      267   MINUS-NAME4
      225   N-10 . . . . . . . . . . . . .  M571 574
      227   N-11
      228   N-12
      229   N-13 . . . . . . . . . . . . .  M572 M574 582 589 597
      231   N-14
      232   N-15
      233   N-16
      235   N-17 . . . . . . . . . . . . .  555
      237   N-18 . . . . . . . . . . . . .  M555 556 564
      239   N-19
      240   N-20 . . . . . . . . . . . . .  M605 M607 615 623 631
      242   N-21
      243   N-22
      245   N-23
      246   N-25
      247   N-26
      248   N-27
      250   N-28
      217   N-3
      218   N-4
      251   N-40
      253   N-41
      255   N-42
      257   N-43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    51
0 Defined   Cross-reference of data names   References

0     258   N-44
      259   N-45
      220   N-5. . . . . . . . . . . . . .  M539 540 548
      222   N-7. . . . . . . . . . . . . .  224
      179   NDATA-DS-09V09
      277   P-OR-F . . . . . . . . . . . .  M428 M429 M430 M431 438 M441
      279   PAR-NAME . . . . . . . . . . .  M443 M552 M568 M586 M602 M620 M636 M656 M674 M692 M708 M724 M743 M759 M779 M794
                                            M812 M828 M844 M858 M874 M889 M904 M919 M932 M948 M963 M996 M1015 M1039 M1059
                                            M1084 M1107 M1146 M1208 M1221 M1234 M1247 M1260 M1273 M1286 M1299 M1312 M1325
                                            M1338 M1351 M1364 M1377 M1390 M1403 M1416 M1429 M1442 M1455 M1468 M1474 M1494
                                            M1502 M1509 M1516 M1523 M1534 M1557 M1565 M1572 M1579 M1586 M1594 M1603 M1619
                                            M1642 M1650 M1657 M1664 M1671 M1679 M1688 M1704 M1727 M1735 M1742 M1749 M1756
                                            M1764 M1773 M1789 M1812 M1820 M1827 M1834 M1841 M1849 M1858 M1874 M1899 M1907
                                            M1914 M1921 M1928 M1936 M1945 M1961 M1986 M1994 M2001 M2008 M2015 M2023 M2032
                                            M2068 M2081 M2094 M2107 M2120 M2135 M2160 M2173 M2186 M2199 M2212 M2227 M2248
                                            M2261 M2274 M2287 M2300 M2315 M2340 M2353 M2366 M2379 M2392 M2407 M2426 M2439
                                            M2452 M2467 M2490 M2503 M2516
      281   PARDOT-X . . . . . . . . . . .  M435
      330   PASS-COUNTER . . . . . . . . .  M429 461 463
      264   PLUS-NAME1
      265   PLUS-NAME2
      269   PLUS-NAME3
      270   PLUS-NAME4
       36   PRINT-FILE . . . . . . . . . .  32 417 423
       37   PRINT-REC. . . . . . . . . . .  M437 M518 M520
      284   RE-MARK. . . . . . . . . . . .  M432 M444 M583 M599 M617 M633 M705 M719 M740 M754 M776 M855 M869 M929 M943 M974
                                            M1012 M1036 M1056 M1081 M1609 M1694 M1779 M1864 M1951 M2038 M2074 M2087 M2100
                                            M2113 M2126 M2166 M2179 M2192 M2205 M2218 M2254 M2267 M2280 M2293 M2306 M2346
                                            M2359 M2372 M2385 M2398 M2432 M2445 M2458 M2496 M2509 M2522
      326   REC-CT . . . . . . . . . . . .  434 436 443 M1475 M1495 M1500 M1507 M1514 M1521 M1535 M1558 M1563 M1570 M1577
                                            M1584 M1592 M1601 M1620 M1643 M1648 M1655 M1662 M1669 M1677 M1686 M1705 M1728
                                            M1733 M1740 M1747 M1754 M1762 M1771 M1790 M1813 M1818 M1825 M1832 M1839 M1847
                                            M1856 M1875 M1900 M1905 M1912 M1919 M1926 M1934 M1943 M1962 M1987 M1992 M1999
                                            M2006 M2013 M2021 M2030 M2053 M2079 M2092 M2105 M2118 M2141 M2171 M2184 M2197
                                            M2210 M2233 M2259 M2272 M2285 M2298 M2321 M2351 M2364 M2377 M2390 M2411 M2437
                                            M2450 M2471 M2501 M2514
      325   REC-SKL-SUB
      334   RECORD-COUNT . . . . . . . . .  M488 489 M501
      125   SIZE-ERR . . . . . . . . . . .  M967 973 989 M991
      126   SIZE-ERR2. . . . . . . . . . .  M1536 M1550 1604 1611 M1621 M1635 1689 1696 M1706 M1720 1774 1781 M1791 M1805
                                            1859 1866 M1876 M1890 M1892 1946 1953 M1963 M1977 M1979 2033 2040 M2050 M2058
                                            2082 2089 M2137 M2150 2174 2181 M2229 M2238 2262 2269 M2317 M2330 2354 2361
      127   SIZE-ERR3. . . . . . . . . . .  M2051 M2059 2095 2102 M2138 M2151 2187 2194 M2230 M2239 2275 2282 M2318 M2331
                                            2367 2374
      128   SIZE-ERR4. . . . . . . . . . .  M2052 M2061 2108 2115 M2139 M2153 2200 2207 M2231 M2241 2288 2295 M2319 M2333
                                            2380 2387 M2409 M2419 2440 2447 M2469 M2483 2504 2511
      207   SUBTR-1. . . . . . . . . . . .  877
      215   SUBTR-10 . . . . . . . . . . .  M892 893 900
      216   SUBTR-11
      208   SUBTR-2
      209   SUBTR-3. . . . . . . . . . . .  877 892
      210   SUBTR-4. . . . . . . . . . . .  907
      211   SUBTR-5. . . . . . . . . . . .  892
      212   SUBTR-6. . . . . . . . . . . .  M907 908 915
      213   SUBTR-7. . . . . . . . . . . .  M877 878 885
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    52
0 Defined   Cross-reference of data names   References

0     214   SUBTR-8. . . . . . . . . . . .  M922 935 944
      206   SUBTRACT-DATA
      285   TEST-COMPUTED. . . . . . . . .  518
      300   TEST-CORRECT . . . . . . . . .  520
      353   TEST-ID. . . . . . . . . . . .  M418
      273   TEST-RESULTS . . . . . . . . .  M419 437
      331   TOTAL-ERROR
      256   TRUNC-DATA
      271   WHOLE-FIELD
       44   WRK-AN-X-18-1
      172   WRK-CS-02V02 . . . . . . . . .  M831 M832 833 840 M847 M848 861 870
      205   WRK-CS-03V00 . . . . . . . . .  M966 979 982 M990
      169   WRK-CS-18V00 . . . . . . . . .  M799 M800 801 808 M951 M952 953 956
      187   WRK-CU-18V00
      153   WRK-DS-02V00 . . . . . . . . .  M696 M698 711 720 M1002 M1004 M1045 M1047 M2048 M2055 2121 2128 M2232 M2235 2301
                                            2308 M2410 M2413 2453 2460
      175   WRK-DS-0201P . . . . . . . . .  M679 M680 681 688
      156   WRK-DS-03V10 . . . . . . . . .  157
      152   WRK-DS-05V00 . . . . . . . . .  M729 M733 746 755
      176   WRK-DS-06V00
      147   WRK-DS-06V06 . . . . . . . . .  148 M659 M662 663 670 M762 M768 782 790 M1021 M1027 M1065 M1071 M2140 M2147 2213
                                            2220 M2320 M2327 2393 2400 M2470 M2477 2517 2524
      140   WRK-DS-09V09 . . . . . . . . .  141
       74   WRK-DS-1V0-1
       75   WRK-DS-1V0-2
       76   WRK-DS-1V2-1
      133   WRK-DS-10V00
      148   WRK-DS-12V00-S
      157   WRK-DS-13V00-S
       81   WRK-DS-16V2-1. . . . . . . . .  M1482 M1543 M1548 1595 1597 M1628 M1633 1680 1682 M1713 M1718 1765 1767 M1798
                                            M1803 1850 1852 M1883 M1888 1937 1939 M1970 M1975 2024 2026
      141   WRK-DS-18V00 . . . . . . . . .  M643 M644 645 652 M815 M816 817 824
       77   WRK-DS-2V0-1
       78   WRK-DS-2V1-1
       79   WRK-DS-2V2-1 . . . . . . . . .  M1479 M1486 1503 1505 M1540 M1547 1566 1568 M1625 M1632 1651 1653 M1710 M1717
                                            1736 1738 M1795 M1802 1821 1823 M1880 M1887 1908 1910 M1967 M1974 1995 1997
       80   WRK-DS-2V2-2 . . . . . . . . .  M1480 M1486 1510 1512 M1541 M1547 1573 1575 M1626 M1632 1658 1660 M1711 M1717
                                            1743 1745 M1796 M1802 1828 1830 M1881 M1887 1915 1917 M1968 M1974 2002 2004
       45   WRK-DU-X-18V0-1
       46   WRK-DU-0V1-1 . . . . . . . . .  M1477 1485 M1538 1546 M1623 1631 M1708 1716 M1793 1801 M1878 1886 M1965 1973
       48   WRK-DU-0V12-1
       47   WRK-DU-0V2-1
       49   WRK-DU-1V0-1
       50   WRK-DU-1V1-1
       51   WRK-DU-1V1-2
       55   WRK-DU-1V17-1
       52   WRK-DU-1V3-1
       53   WRK-DU-1V3-2
       54   WRK-DU-1V5-1
       73   WRK-DU-16V2-1. . . . . . . . .  M1483 M1487 1524 1526 M1544 M1548 1587 1589 M1629 M1633 1672 1674 M1714 M1718
                                            1757 1759 M1799 M1803 1842 1844 M1884 M1888 1929 1931 M1971 M1975 2016 2018
      202   WRK-DU-18V00
       56   WRK-DU-2P6-1
       57   WRK-DU-2V0-1 . . . . . . . . .  M1476 1485 M1537 1546 M1622 1631 M1707 1716 M1792 1801 M1877 1886 M1964 1973
       58   WRK-DU-2V0-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    53
0 Defined   Cross-reference of data names   References

0      59   WRK-DU-2V0-3
       60   WRK-DU-2V1-1
       61   WRK-DU-2V1-2
       62   WRK-DU-2V1-3
       63   WRK-DU-2V2-1 . . . . . . . . .  M1478 M1485 1496 1498 M1539 M1546 1559 1561 M1624 M1631 1644 1646 M1709 M1716
                                            1729 1731 M1794 M1801 1814 1816 M1879 M1886 1901 1903 M1966 M1973 1988 1990
       64   WRK-DU-2V2-2 . . . . . . . . .  M1481 M1486 1517 1519 M1542 M1547 1580 1582 M1627 M1632 1665 1667 M1712 M1717
                                            1750 1752 M1797 M1802 1835 1837 M1882 M1887 1922 1924 M1969 M1974 2009 2011
       65   WRK-DU-2V2-3
       66   WRK-DU-2V2-4
       67   WRK-DU-2V2-5
       68   WRK-DU-2V5-1
       69   WRK-DU-4P1-1
       70   WRK-DU-5V1-1
       71   WRK-DU-6V0-1
       72   WRK-DU-6V0-2
       40   WRK-NE-X-1 . . . . . . . . . .  M1526 1527 M1589 1590 M1674 1675 M1759 1760 M1844 1845 M1931 1932 M2018 2019
       41   WRK-NE-X-2 . . . . . . . . . .  M1597 1598 M1682 1683 M1767 1768 M1852 1853 M1939 1940 M2026 2027
       42   WRK-XN-00001 . . . . . . . . .  M2049 M2057 2069 2076 M2136 M2149 2161 2168 M2228 M2237 2249 2256 M2316 M2329
                                            2341 2348 M2408 M2415 M2417 2427 2434 M2468 M2479 M2481 2491 2498
      183   WRK-XN-00018
       43   WRK-XN-18-1. . . . . . . . . .  44 45
      224   X-8
      181   XDATA-XN-00018
      402   XXCOMPUTED . . . . . . . . . .  M527
      404   XXCORRECT. . . . . . . . . . .  M527
      397   XXINFO . . . . . . . . . . . .  514 529
       82   42-DATANAMES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    54
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

      523   BAIL-OUT . . . . . . . . . . .  P440
      531   BAIL-OUT-EX. . . . . . . . . .  E440 G525
      526   BAIL-OUT-WRITE . . . . . . . .  G524
      506   BLANK-LINE-PRINT
     2528   CCVS-EXIT. . . . . . . . . . .  G2488
     2529   CCVS-999999
      415   CCVS1
      532   CCVS1-EXIT . . . . . . . . . .  G421
      422   CLOSE-FILES. . . . . . . . . .  G2530
      450   COLUMN-NAMES-ROUTINE . . . . .  E420
      431   DE-LETE. . . . . . . . . . . .  P545 P561 P579 P594 P612 P628 P649 P667 P685 P702 P716 P737 P751 P773 P787 P805
                                            P821 P837 P852 P866 P882 P897 P912 P926 P940 P961 P986 P1009 P1033 P1053 P1078
                                            P1106 P1144 P1206 P1219 P1232 P1245 P1258 P1271 P1284 P1297 P1310 P1323 P1336
                                            P1349 P1362 P1375 P1388 P1401 P1414 P1427 P1440 P1453 P1466 P1490 P1553 P1638
                                            P1723 P1808 P1895 P1982 P2064 P2156 P2244 P2336 P2422 P2486
      454   END-ROUTINE. . . . . . . . . .  P423
      458   END-ROUTINE-1
      467   END-ROUTINE-12
      475   END-ROUTINE-13 . . . . . . . .  E423
      456   END-RTN-EXIT
      430   FAIL . . . . . . . . . . . . .  P550 P566 P584 P600 P618 P634 P654 P672 P690 P706 P722 P741 P757 P777 P792 P810
                                            P826 P842 P856 P872 P887 P902 P917 P930 P946 P958 P977 P981 P1013 P1037 P1057
                                            P1082 P1141 P1203 P1216 P1229 P1242 P1255 P1268 P1281 P1294 P1307 P1320 P1333
                                            P1346 P1359 P1372 P1385 P1398 P1411 P1424 P1437 P1450 P1463 P1498 P1505 P1512
                                            P1519 P1526 P1561 P1568 P1575 P1582 P1589 P1597 P1612 P1646 P1653 P1660 P1667
                                            P1674 P1682 P1697 P1731 P1738 P1745 P1752 P1759 P1767 P1782 P1816 P1823 P1830
                                            P1837 P1844 P1852 P1867 P1903 P1910 P1917 P1924 P1931 P1939 P1954 P1990 P1997
                                            P2004 P2011 P2018 P2026 P2041 P2077 P2090 P2103 P2116 P2129 P2169 P2182 P2195
                                            P2208 P2221 P2257 P2270 P2283 P2296 P2309 P2349 P2362 P2375 P2388 P2401 P2435
                                            P2448 P2461 P2499 P2512 P2525
      508   FAIL-ROUTINE . . . . . . . . .  P439
      522   FAIL-ROUTINE-EX. . . . . . . .  E439 G516
      517   FAIL-ROUTINE-WRITE . . . . . .  G510 G511
      445   HEAD-ROUTINE . . . . . . . . .  P420
      428   INSPT
      416   OPEN-FILES
      429   PASS . . . . . . . . . . . . .  P541 P557 P575 P590 P608 P624 P646 P664 P682 P699 P712 P734 P747 P770 P783 P802
                                            P818 P834 P849 P862 P879 P894 P909 P923 P936 P954 P980 P1007 P1029 P1049 P1075
                                            P1137 P1199 P1212 P1225 P1238 P1251 P1264 P1277 P1290 P1303 P1316 P1329 P1342
                                            P1355 P1368 P1381 P1394 P1407 P1420 P1433 P1446 P1459 P1496 P1503 P1510 P1517
                                            P1524 P1559 P1566 P1573 P1580 P1587 P1595 P1605 P1644 P1651 P1658 P1665 P1672
                                            P1680 P1690 P1729 P1736 P1743 P1750 P1757 P1765 P1775 P1814 P1821 P1828 P1835
                                            P1842 P1850 P1860 P1901 P1908 P1915 P1922 P1929 P1937 P1947 P1988 P1995 P2002
                                            P2009 P2016 P2024 P2034 P2070 P2083 P2096 P2109 P2122 P2162 P2175 P2188 P2201
                                            P2214 P2250 P2263 P2276 P2289 P2302 P2342 P2355 P2368 P2381 P2394 P2428 P2441
                                            P2454 P2492 P2505 P2518
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    55
0 Defined   Cross-reference of procedures   References

0     433   PRINT-DETAIL . . . . . . . . .  P553 P569 P587 P603 P621 P637 P640 P657 P675 P693 P709 P725 P744 P760 P780 P795
                                            P813 P829 P845 P859 P875 P890 P905 P920 P933 P949 P964 P997 P1016 P1040 P1060
                                            P1085 P1110 P1147 P1209 P1222 P1235 P1248 P1261 P1274 P1287 P1300 P1313 P1326
                                            P1339 P1352 P1365 P1378 P1391 P1404 P1417 P1430 P1443 P1456 P1469 P1491 P1496
                                            P1499 P1503 P1506 P1510 P1513 P1517 P1520 P1525 P1528 P1554 P1559 P1562 P1566
                                            P1569 P1573 P1576 P1580 P1583 P1588 P1591 P1596 P1600 P1606 P1613 P1639 P1644
                                            P1647 P1651 P1654 P1658 P1661 P1665 P1668 P1673 P1676 P1681 P1685 P1691 P1698
                                            P1724 P1729 P1732 P1736 P1739 P1743 P1746 P1750 P1753 P1758 P1761 P1766 P1770
                                            P1776 P1783 P1809 P1814 P1817 P1821 P1824 P1828 P1831 P1835 P1838 P1843 P1846
                                            P1851 P1855 P1861 P1868 P1896 P1901 P1904 P1908 P1911 P1915 P1918 P1922 P1925
                                            P1930 P1933 P1938 P1942 P1948 P1955 P1983 P1988 P1991 P1995 P1998 P2002 P2005
                                            P2009 P2012 P2017 P2020 P2025 P2029 P2035 P2042 P2065 P2071 P2078 P2084 P2091
                                            P2097 P2104 P2110 P2117 P2123 P2130 P2157 P2163 P2170 P2176 P2183 P2189 P2196
                                            P2202 P2209 P2215 P2222 P2245 P2251 P2258 P2264 P2271 P2277 P2284 P2290 P2297
                                            P2303 P2310 P2337 P2343 P2350 P2356 P2363 P2369 P2376 P2382 P2389 P2395 P2402
                                            P2423 P2429 P2436 P2442 P2449 P2455 P2462 P2487 P2493 P2500 P2506 P2513 P2519
                                            P2526
      534   SECT-NC106A-001
      988   SUB-A-F1-20. . . . . . . . . .  P972
      992   SUB-B-F1-20. . . . . . . . . .  E972 G989
      544   SUB-DELETE-F1-1
      772   SUB-DELETE-F1-10-1
      786   SUB-DELETE-F1-10-2
      804   SUB-DELETE-F1-11
      820   SUB-DELETE-F1-12
      836   SUB-DELETE-F1-13
      851   SUB-DELETE-F1-14-1
      865   SUB-DELETE-F1-14-2
      881   SUB-DELETE-F1-15
      896   SUB-DELETE-F1-16
      911   SUB-DELETE-F1-17
      925   SUB-DELETE-F1-18-1
      939   SUB-DELETE-F1-18-2
      960   SUB-DELETE-F1-19
      560   SUB-DELETE-F1-2
      985   SUB-DELETE-F1-20
     1008   SUB-DELETE-F1-21
     1032   SUB-DELETE-F1-22
     1052   SUB-DELETE-F1-23
     1077   SUB-DELETE-F1-24
     1143   SUB-DELETE-F1-25
     1105   SUB-DELETE-F1-25-0
     1205   SUB-DELETE-F1-26-1
     1322   SUB-DELETE-F1-26-10
     1335   SUB-DELETE-F1-26-11
     1348   SUB-DELETE-F1-26-12
     1361   SUB-DELETE-F1-26-13
     1374   SUB-DELETE-F1-26-14
     1387   SUB-DELETE-F1-26-15
     1400   SUB-DELETE-F1-26-16
     1413   SUB-DELETE-F1-26-17
     1426   SUB-DELETE-F1-26-18
     1439   SUB-DELETE-F1-26-19
     1218   SUB-DELETE-F1-26-2
     1452   SUB-DELETE-F1-26-20
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    56
0 Defined   Cross-reference of procedures   References

0    1465   SUB-DELETE-F1-26-21
     1231   SUB-DELETE-F1-26-3
     1244   SUB-DELETE-F1-26-4
     1257   SUB-DELETE-F1-26-5
     1270   SUB-DELETE-F1-26-6
     1283   SUB-DELETE-F1-26-7
     1296   SUB-DELETE-F1-26-8
     1309   SUB-DELETE-F1-26-9
     1489   SUB-DELETE-F1-27
     1552   SUB-DELETE-F1-28
     1637   SUB-DELETE-F1-29
      578   SUB-DELETE-F1-3-1
      593   SUB-DELETE-F1-3-2
     1722   SUB-DELETE-F1-30
     1807   SUB-DELETE-F1-31
     1894   SUB-DELETE-F1-32
     1981   SUB-DELETE-F1-33
     2063   SUB-DELETE-F1-34
     2155   SUB-DELETE-F1-35
     2243   SUB-DELETE-F1-36
     2335   SUB-DELETE-F1-37
     2421   SUB-DELETE-F1-38
     2485   SUB-DELETE-F1-39
      611   SUB-DELETE-F1-4-1
      627   SUB-DELETE-F1-4-2
      648   SUB-DELETE-F1-5
      666   SUB-DELETE-F1-6
      684   SUB-DELETE-F1-7
      701   SUB-DELETE-F1-8-1
      715   SUB-DELETE-F1-8-2
      736   SUB-DELETE-F1-9-1
      750   SUB-DELETE-F1-9-2
      547   SUB-FAIL-F1-1. . . . . . . . .  G543
      775   SUB-FAIL-F1-10-1 . . . . . . .  G769
      789   SUB-FAIL-F1-10-2 . . . . . . .  G785
      807   SUB-FAIL-F1-11 . . . . . . . .  G803
      823   SUB-FAIL-F1-12 . . . . . . . .  G819
      839   SUB-FAIL-F1-13 . . . . . . . .  G835
      854   SUB-FAIL-F1-14-1 . . . . . . .  G850
      868   SUB-FAIL-F1-14-2 . . . . . . .  G864
      884   SUB-FAIL-F1-15 . . . . . . . .  G880
      899   SUB-FAIL-F1-16 . . . . . . . .  G895
      914   SUB-FAIL-F1-17 . . . . . . . .  G910
      928   SUB-FAIL-F1-18-1 . . . . . . .  G924
      942   SUB-FAIL-F1-18-2 . . . . . . .  G938
      563   SUB-FAIL-F1-2. . . . . . . . .  G559
     1011   SUB-FAIL-F1-21 . . . . . . . .  G1006
     1035   SUB-FAIL-F1-22 . . . . . . . .  G1031
     1055   SUB-FAIL-F1-23 . . . . . . . .  G1051
     1080   SUB-FAIL-F1-24 . . . . . . . .  G1073
      581   SUB-FAIL-F1-3-1. . . . . . . .  G577
      596   SUB-FAIL-F1-3-2. . . . . . . .  G592
      614   SUB-FAIL-F1-4-1. . . . . . . .  G610
      630   SUB-FAIL-F1-4-2. . . . . . . .  G626
      651   SUB-FAIL-F1-5. . . . . . . . .  G647
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    57
0 Defined   Cross-reference of procedures   References

0     669   SUB-FAIL-F1-6. . . . . . . . .  G665
      687   SUB-FAIL-F1-7. . . . . . . . .  G683
      704   SUB-FAIL-F1-8-1. . . . . . . .  G700
      718   SUB-FAIL-F1-8-2. . . . . . . .  G714
      739   SUB-FAIL-F1-9-1. . . . . . . .  G735
      753   SUB-FAIL-F1-9-2. . . . . . . .  G749
      535   SUB-INIT-F1-1
      761   SUB-INIT-F1-10
      796   SUB-INIT-F1-11
      999   SUB-INIT-F1-21
     1018   SUB-INIT-F1-22
     1042   SUB-INIT-F1-23
     1062   SUB-INIT-F1-24
     1087   SUB-INIT-F1-25
     1148   SUB-INIT-F1-26 . . . . . . . .  G1111
     1471   SUB-INIT-F1-27
     1530   SUB-INIT-F1-28 . . . . . . . .  G1492
     1615   SUB-INIT-F1-29 . . . . . . . .  G1555
      570   SUB-INIT-F1-3
     1700   SUB-INIT-F1-30 . . . . . . . .  G1640
     1785   SUB-INIT-F1-31 . . . . . . . .  G1725
     1870   SUB-INIT-F1-32 . . . . . . . .  G1810
     1957   SUB-INIT-F1-33 . . . . . . . .  G1897
     2044   SUB-INIT-F1-34 . . . . . . . .  G1984
     2132   SUB-INIT-F1-35 . . . . . . . .  G2066
     2224   SUB-INIT-F1-36 . . . . . . . .  G2158
     2312   SUB-INIT-F1-37 . . . . . . . .  G2246
     2404   SUB-INIT-F1-38 . . . . . . . .  G2338
     2464   SUB-INIT-F1-39 . . . . . . . .  G2424
      604   SUB-INIT-F1-4-1
      638   SUB-INIT-F1-5
      676   SUB-INIT-F1-7
      694   SUB-INIT-F1-8-1
      726   SUB-INIT-F1-9-1
      538   SUB-TEST-F1-1
      763   SUB-TEST-F1-10-1
      781   SUB-TEST-F1-10-2
      798   SUB-TEST-F1-11
      814   SUB-TEST-F1-12
      830   SUB-TEST-F1-13
      846   SUB-TEST-F1-14-1
      860   SUB-TEST-F1-14-2
      876   SUB-TEST-F1-15
      891   SUB-TEST-F1-16
      906   SUB-TEST-F1-17
      921   SUB-TEST-F1-18-1
      934   SUB-TEST-F1-18-2
      950   SUB-TEST-F1-19
      554   SUB-TEST-F1-2
      965   SUB-TEST-F1-20
     1003   SUB-TEST-F1-21
     1022   SUB-TEST-F1-22
     1046   SUB-TEST-F1-23
     1066   SUB-TEST-F1-24
     1112   SUB-TEST-F1-25-0 . . . . . . .  G1104
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    58
0 Defined   Cross-reference of procedures   References

0    1135   SUB-TEST-F1-25-1
     1154   SUB-TEST-F1-26-0
     1197   SUB-TEST-F1-26-1
     1314   SUB-TEST-F1-26-10
     1327   SUB-TEST-F1-26-11
     1340   SUB-TEST-F1-26-12
     1353   SUB-TEST-F1-26-13
     1366   SUB-TEST-F1-26-14
     1379   SUB-TEST-F1-26-15
     1392   SUB-TEST-F1-26-16
     1405   SUB-TEST-F1-26-17
     1418   SUB-TEST-F1-26-18
     1431   SUB-TEST-F1-26-19
     1210   SUB-TEST-F1-26-2
     1444   SUB-TEST-F1-26-20
     1457   SUB-TEST-F1-26-21
     1223   SUB-TEST-F1-26-3
     1236   SUB-TEST-F1-26-4
     1249   SUB-TEST-F1-26-5
     1262   SUB-TEST-F1-26-6
     1275   SUB-TEST-F1-26-7
     1288   SUB-TEST-F1-26-8
     1301   SUB-TEST-F1-26-9
     1484   SUB-TEST-F1-27-0
     1493   SUB-TEST-F1-27-1 . . . . . . .  G1488
     1501   SUB-TEST-F1-27-2
     1508   SUB-TEST-F1-27-3
     1515   SUB-TEST-F1-27-4
     1522   SUB-TEST-F1-27-5
     1545   SUB-TEST-F1-28-0
     1556   SUB-TEST-F1-28-1 . . . . . . .  G1551
     1564   SUB-TEST-F1-28-2
     1571   SUB-TEST-F1-28-3
     1578   SUB-TEST-F1-28-4
     1585   SUB-TEST-F1-28-5
     1593   SUB-TEST-F1-28-6
     1602   SUB-TEST-F1-28-7
     1630   SUB-TEST-F1-29-0
     1641   SUB-TEST-F1-29-1 . . . . . . .  G1636
     1649   SUB-TEST-F1-29-2
     1656   SUB-TEST-F1-29-3
     1663   SUB-TEST-F1-29-4
     1670   SUB-TEST-F1-29-5
     1678   SUB-TEST-F1-29-6
     1687   SUB-TEST-F1-29-7
      573   SUB-TEST-F1-3-0
      588   SUB-TEST-F1-3-2
     1715   SUB-TEST-F1-30-0
     1726   SUB-TEST-F1-30-1 . . . . . . .  G1721
     1734   SUB-TEST-F1-30-2
     1741   SUB-TEST-F1-30-3
     1748   SUB-TEST-F1-30-4
     1755   SUB-TEST-F1-30-5
     1763   SUB-TEST-F1-30-6
     1772   SUB-TEST-F1-30-7
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    59
0 Defined   Cross-reference of procedures   References

0    1800   SUB-TEST-F1-31-0
     1811   SUB-TEST-F1-31-1 . . . . . . .  G1806
     1819   SUB-TEST-F1-31-2
     1826   SUB-TEST-F1-31-3
     1833   SUB-TEST-F1-31-4
     1840   SUB-TEST-F1-31-5
     1848   SUB-TEST-F1-31-6
     1857   SUB-TEST-F1-31-7
     1885   SUB-TEST-F1-32-0
     1898   SUB-TEST-F1-32-1 . . . . . . .  G1893
     1906   SUB-TEST-F1-32-2
     1913   SUB-TEST-F1-32-3
     1920   SUB-TEST-F1-32-4
     1927   SUB-TEST-F1-32-5
     1935   SUB-TEST-F1-32-6
     1944   SUB-TEST-F1-32-7
     1972   SUB-TEST-F1-33-0
     1985   SUB-TEST-F1-33-1 . . . . . . .  G1980
     1993   SUB-TEST-F1-33-2
     2000   SUB-TEST-F1-33-3
     2007   SUB-TEST-F1-33-4
     2014   SUB-TEST-F1-33-5
     2022   SUB-TEST-F1-33-6
     2031   SUB-TEST-F1-33-7
     2054   SUB-TEST-F1-34-0
     2067   SUB-TEST-F1-34-1 . . . . . . .  G2062
     2080   SUB-TEST-F1-34-2
     2093   SUB-TEST-F1-34-3
     2106   SUB-TEST-F1-34-4
     2119   SUB-TEST-F1-34-5
     2142   SUB-TEST-F1-35-0
     2159   SUB-TEST-F1-35-1 . . . . . . .  G2154
     2172   SUB-TEST-F1-35-2
     2185   SUB-TEST-F1-35-3
     2198   SUB-TEST-F1-35-4
     2211   SUB-TEST-F1-35-5
     2234   SUB-TEST-F1-36-0
     2247   SUB-TEST-F1-36-1 . . . . . . .  G2242
     2260   SUB-TEST-F1-36-2
     2273   SUB-TEST-F1-36-3
     2286   SUB-TEST-F1-36-4
     2299   SUB-TEST-F1-36-5
     2322   SUB-TEST-F1-37-0
     2339   SUB-TEST-F1-37-1 . . . . . . .  G2334
     2352   SUB-TEST-F1-37-2
     2365   SUB-TEST-F1-37-3
     2378   SUB-TEST-F1-37-4
     2391   SUB-TEST-F1-37-5
     2412   SUB-TEST-F1-38-0
     2425   SUB-TEST-F1-38-1 . . . . . . .  G2420
     2438   SUB-TEST-F1-38-2
     2451   SUB-TEST-F1-38-3
     2472   SUB-TEST-F1-39-0
     2489   SUB-TEST-F1-39-1 . . . . . . .  G2484
     2502   SUB-TEST-F1-39-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    60
0 Defined   Cross-reference of procedures   References

0    2515   SUB-TEST-F1-39-3
      606   SUB-TEST-F1-4-1
      622   SUB-TEST-F1-4-2
      642   SUB-TEST-F1-5
      658   SUB-TEST-F1-6
      678   SUB-TEST-F1-7
      697   SUB-TEST-F1-8-1
      710   SUB-TEST-F1-8-2
      728   SUB-TEST-F1-9-1
      745   SUB-TEST-F1-9-2
      551   SUB-WRITE-F1-1 . . . . . . . .  G542 G546
      778   SUB-WRITE-F1-10-1. . . . . . .  G771 G774
      793   SUB-WRITE-F1-10-2. . . . . . .  G783 G788
      811   SUB-WRITE-F1-11. . . . . . . .  G802 G806
      827   SUB-WRITE-F1-12. . . . . . . .  G818 G822
      843   SUB-WRITE-F1-13. . . . . . . .  G834 G838
      857   SUB-WRITE-F1-14-1. . . . . . .  G849 G853
      873   SUB-WRITE-F1-14-2. . . . . . .  G862 G867
      888   SUB-WRITE-F1-15. . . . . . . .  G879 G883
      903   SUB-WRITE-F1-16. . . . . . . .  G894 G898
      918   SUB-WRITE-F1-17. . . . . . . .  G909 G913
      931   SUB-WRITE-F1-18-1. . . . . . .  G923 G927
      947   SUB-WRITE-F1-18-2. . . . . . .  G936 G941
      962   SUB-WRITE-F1-19. . . . . . . .  G955 G959
      567   SUB-WRITE-F1-2 . . . . . . . .  G558 G562
      994   SUB-WRITE-F1-20. . . . . . . .  G978 G980 G984 G987
     1014   SUB-WRITE-F1-21. . . . . . . .  G1007 G1010
     1038   SUB-WRITE-F1-22. . . . . . . .  G1030 G1034
     1058   SUB-WRITE-F1-23. . . . . . . .  G1049 G1054
     1083   SUB-WRITE-F1-24. . . . . . . .  G1076 G1079
     1145   SUB-WRITE-F1-25. . . . . . . .  G1138 G1142
     1207   SUB-WRITE-F1-26-1. . . . . . .  G1200 G1204
     1324   SUB-WRITE-F1-26-10 . . . . . .  G1317 G1321
     1337   SUB-WRITE-F1-26-11 . . . . . .  G1330 G1334
     1350   SUB-WRITE-F1-26-12 . . . . . .  G1343 G1347
     1363   SUB-WRITE-F1-26-13 . . . . . .  G1356 G1360
     1376   SUB-WRITE-F1-26-14 . . . . . .  G1369 G1373
     1389   SUB-WRITE-F1-26-15 . . . . . .  G1382 G1386
     1402   SUB-WRITE-F1-26-16 . . . . . .  G1395 G1399
     1415   SUB-WRITE-F1-26-17 . . . . . .  G1408 G1412
     1428   SUB-WRITE-F1-26-18 . . . . . .  G1421 G1425
     1441   SUB-WRITE-F1-26-19 . . . . . .  G1434 G1438
     1220   SUB-WRITE-F1-26-2. . . . . . .  G1213 G1217
     1454   SUB-WRITE-F1-26-20 . . . . . .  G1447 G1451
     1467   SUB-WRITE-F1-26-21 . . . . . .  G1460 G1464
     1233   SUB-WRITE-F1-26-3. . . . . . .  G1226 G1230
     1246   SUB-WRITE-F1-26-4. . . . . . .  G1239 G1243
     1259   SUB-WRITE-F1-26-5. . . . . . .  G1252 G1256
     1272   SUB-WRITE-F1-26-6. . . . . . .  G1265 G1269
     1285   SUB-WRITE-F1-26-7. . . . . . .  G1278 G1282
     1298   SUB-WRITE-F1-26-8. . . . . . .  G1291 G1295
     1311   SUB-WRITE-F1-26-9. . . . . . .  G1304 G1308
      585   SUB-WRITE-F1-3-1 . . . . . . .  G576 G580
      601   SUB-WRITE-F1-3-2 . . . . . . .  G591 G595
      619   SUB-WRITE-F1-4-1 . . . . . . .  G609 G613
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    61
0 Defined   Cross-reference of procedures   References

0     635   SUB-WRITE-F1-4-2 . . . . . . .  G625 G629
      655   SUB-WRITE-F1-5 . . . . . . . .  G646 G650
      673   SUB-WRITE-F1-6 . . . . . . . .  G664 G668
      691   SUB-WRITE-F1-7 . . . . . . . .  G682 G686
      707   SUB-WRITE-F1-8-1 . . . . . . .  G699 G703
      723   SUB-WRITE-F1-8-2 . . . . . . .  G712 G717
      742   SUB-WRITE-F1-9-1 . . . . . . .  G734 G738
      758   SUB-WRITE-F1-9-2 . . . . . . .  G747 G752
      426   TERMINATE-CALL
      424   TERMINATE-CCVS
      487   WRITE-LINE . . . . . . . . . .  P437 P438 P446 P447 P448 P449 P451 P452 P453 P455 P457 P466 P474 P480 P485 P486
                                            P514 P518 P520 P529
      503   WRT-LN . . . . . . . . . . . .  P493 P494 P495 P496 P497 P498 P499 P502 P507
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    62
0 Defined   Cross-reference of programs     References

        3   NC106A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC106A    Date 06/04/2022  Time 12:00:48   Page    63
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC106A:
 *    Source records = 2530
 *    Data Division statements = 253
 *    Procedure Division statements = 1695
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1728
0End of compilation 1,  program NC106A,  highest severity 0.
0Return code 0
