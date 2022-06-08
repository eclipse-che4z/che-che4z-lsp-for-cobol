1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:35   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:35   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2534.2
   000002         000200 PROGRAM-ID.                                                      NC2534.2
   000003         000300     NC253A.                                                      NC2534.2
   000004         000500*                                                              *  NC2534.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2534.2
   000006         000700*                                                              *  NC2534.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2534.2
   000008         000900*                                                              *  NC2534.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2534.2
   000010         001100*                                                              *  NC2534.2
   000011         001300*                                                              *  NC2534.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2534.2
   000013         001500*                                                              *  NC2534.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2534.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2534.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2534.2
   000017         001900*                                                              *  NC2534.2
   000018         002100                                                                  NC2534.2
   000019         002200*                                                                 NC2534.2
   000020         002300*    PROGRAM NC202A TESTS FORMAT3 OF THE SUBTRACT STATEMENT.      NC2534.2
   000021         002400*                                                                 NC2534.2
   000022         002500*                                                                 NC2534.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC2534.2
   000024         002700 CONFIGURATION SECTION.                                           NC2534.2
   000025         002800 SOURCE-COMPUTER.                                                 NC2534.2
   000026         002900     XXXXX082.                                                    NC2534.2
   000027         003000 OBJECT-COMPUTER.                                                 NC2534.2
   000028         003100     XXXXX083.                                                    NC2534.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC2534.2
   000030         003300 FILE-CONTROL.                                                    NC2534.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC2534.2 35
   000032         003500     XXXXX055.                                                    NC2534.2
   000033         003600 DATA DIVISION.                                                   NC2534.2
   000034         003700 FILE SECTION.                                                    NC2534.2
   000035         003800 FD  PRINT-FILE.                                                  NC2534.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC2534.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC2534.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC2534.2
   000039         004200 01  TABLE1.                                                      NC2534.2
   000040         004300     02  RECORD1                 PICTURE 99.                      NC2534.2
   000041         004400     02  RECORD2                 PICTURE 99                       NC2534.2
   000042         004500                                 OCCURS 2 TIMES                   NC2534.2
   000043         004600                                 INDEXED BY INDEX1.               NC2534.2
   000044         004700     02  RECORD3                 PICTURE 99.                      NC2534.2
   000045         004800 01  TABLE2.                                                      NC2534.2
   000046         004900     02  RECORD1                 PICTURE 99.                      NC2534.2
   000047         005000     02  RECORD2                 PICTURE 99                       NC2534.2
   000048         005100                                 OCCURS 2 TIMES                   NC2534.2
   000049         005200                                 INDEXED BY INDEX2.               NC2534.2
   000050         005300     02  RECORD3                 PICTURE 99.                      NC2534.2
   000051         005400 77  WRK-AN-00001                PICTURE A.                       NC2534.2
   000052         005500 77  WRK-XN-00001                PICTURE X.                       NC2534.2
   000053         005600 77  WRK-DS-01V00                PICTURE S9.                      NC2534.2
   000054         005700 77  WRK-DS-02V00                PICTURE S99.                     NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC2534.2
   000056         005900 77  WRK-DS-05V00                PICTURE S9(5).                   NC2534.2
   000057         006000 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC2534.2 IMP
   000058         006100 77  WRK-DS-09V09                PICTURE S9(9)V9(9).              NC2534.2
   000059         006200 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC2534.2 58
   000060         006300 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC2534.2
   000061         006400                                 VALUE 111111111.111111111.       NC2534.2
   000062         006500 77  WRK-DS-18V00       PICTURE S9(18) VALUE 111111111111111111.  NC2534.2
   000063         006600 77  A05ONES-DS-05V00            PICTURE S9(5) VALUE 11111.       NC2534.2
   000064         006700 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC2534.2
   000065         006800 77  WRK-DS-03V00                PICTURE S999.                    NC2534.2
   000066         006900 77  WRK-DS-06V00                PICTURE S9(6).                   NC2534.2
   000067         007000 77  WRK-DS-0201P                PICTURE S99P.                    NC2534.2
   000068         007100 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC2534.2
   000069         007200 77  ADD-1                   PICTURE S9(8)V99  VALUE 1.           NC2534.2
   000070         007300 77  ADD-2                   PICTURE S9(6)V9(4) VALUE 1.          NC2534.2
   000071         007400 77  ADD-3                   PICTURE S9(5)     VALUE -1.          NC2534.2
   000072         007500 77  ADD-4                   PICTURE 9         VALUE 9.           NC2534.2
   000073         007600 77  ADD-5                   PICTURE 9         VALUE 9.           NC2534.2
   000074         007700 77  ADD-6                   PICTURE 9(5)      VALUE 99999.       NC2534.2
   000075         007800 77  ADD-7                   PICTURE 9         VALUE 1.           NC2534.2
   000076         007900 77  ADD-8                   PICTURE 9.                           NC2534.2
   000077         008000 77  ADD-9                   PICTURE S9(8)V99  VALUE 5.9.         NC2534.2
   000078         008100 77  ADD-10                  PICTURE 9(5)      VALUE 52800.       NC2534.2
   000079         008200 77  ADD-11                  PICTURE 99999.                       NC2534.2
   000080         008300 77  ADD-12                  PICTURE PP9       VALUE .001.        NC2534.2
   000081         008400 77  ADD-13                  PICTURE 9PP       VALUE 100.         NC2534.2
   000082         008500 77  ADD-14                  PICTURE 999V999.                     NC2534.2
   000083         008600 77  W-1                     PICTURE IS 9.                        NC2534.2
   000084         008700 77  W-2                     PICTURE IS 99.                       NC2534.2
   000085         008800 77  W-3                     PICTURE IS 999.                      NC2534.2
   000086         008900 77  W-4                PICTURE 9  VALUE 0.                       NC2534.2
   000087         009000 77  W-6                     PICTURE IS 999    VALUE IS ZERO.     NC2534.2 IMP
   000088         009100 77  W-9                     PICTURE 999.                         NC2534.2
   000089         009200 77  D-5                PICTURE S999  VALUE -1.                   NC2534.2
   000090         009300 77  D-9                PICTURE 9(4)V9(4)  VALUE 111.1189.        NC2534.2
   000091         009400 77  ONE                PICTURE 9  VALUE 1.                       NC2534.2
   000092         009500 77  TWO                PICTURE S9  VALUE 2.                      NC2534.2
   000093         009600 77  THREE              PICTURE S9  VALUE 3.                      NC2534.2
   000094         009700 77  FOUR               PICTURE S9  VALUE 4.                      NC2534.2
   000095         009800 77  FIVE               PICTURE S9  VALUE 5.                      NC2534.2
   000096         009900 77  SIX                PICTURE S9  VALUE 6.                      NC2534.2
   000097         010000 77  SEVEN              PICTURE S9  VALUE 7.                      NC2534.2
   000098         010100 77  EIGHT              PICTURE 9  VALUE 8.                       NC2534.2
   000099         010200 77  NINE               PICTURE S9  VALUE 9.                      NC2534.2
   000100         010300 77  TEN                PICTURE S99  VALUE 10.                    NC2534.2
   000101         010400 77  FIFTEEN            PICTURE S99  VALUE 15.                    NC2534.2
   000102         010500 77  TWENTY             PICTURE S99  VALUE 20.                    NC2534.2
   000103         010600 77  TWENTY-5           PICTURE S99  VALUE 25.                    NC2534.2
   000104         010700 01  WRK-DS-09V00                 PICTURE S9(9)  VALUE ZERO.      NC2534.2 IMP
   000105         010800 01  GRP-FOR-ADD-CORR-1.                                          NC2534.2
   000106         010900     02  GRP-SUBTRACT-CORR-1.                                     NC2534.2
   000107         011000     03  FILLER                  PICTURE S99  VALUE 91.           NC2534.2
   000108         011100     03  ADD-CORR-2              PICTURE S99  VALUE 22.           NC2534.2
   000109         011200     03  ADD-CORR-1              PICTURE S99 VALUE 11.            NC2534.2
   000110         011300     03  ADD-CORR-A              PICTURE S99 VALUE 93.            NC2534.2
   000111         011400     03  ADD-CORR-4              PICTURE S99 VALUE 44.            NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     03  ADD-CORR-3              PICTURE S99 VALUE 33.            NC2534.2
   000113         011600     03  ADD-CORR-6              PICTURE S99 VALUE 66.            NC2534.2
   000114         011700     03  ADD-CORR-5              PICTURE S99 VALUE 55.            NC2534.2
   000115         011800     03  ADD-CORR-8              PICTURE S99 VALUE 88.            NC2534.2
   000116         011900     03  ADD-CORR-7              PICTURE S99 VALUE 77.            NC2534.2
   000117         012000     03  ADD-CORR-9              PICTURE S99 VALUE 99.            NC2534.2
   000118         012100 01  GRP-FOR-ADD-CORR-R.                                          NC2534.2
   000119         012200     02  GRP-SUBTRACT-CORR-1.                                     NC2534.2
   000120         012300     05  ADD-CORR-1              PICTURE 99.                      NC2534.2
   000121         012400     05  ADD-CORR-2              PICTURE 99.                      NC2534.2
   000122         012500     05  ADD-CORR-3              PICTURE 99.                      NC2534.2
   000123         012600     05  ADD-CORR-4              PICTURE 99.                      NC2534.2
   000124         012700     05  ADD-CORR-5              PICTURE 9P.                      NC2534.2
   000125         012800     05  ADD-CORR-6              PICTURE 999.                     NC2534.2
   000126         012900     05  ADD-CORR-7              PICTURE 99.                      NC2534.2
   000127         013000     05  ADD-CORR-8              PICTURE 99.                      NC2534.2
   000128         013100     05  ADD-CORR-9              PICTURE 99.                      NC2534.2
   000129         013200     05  FILLER                  PICTURE 99.                      NC2534.2
   000130         013300 01  GRP-FOR-ADD-CORR-2.                                          NC2534.2
   000131         013400     02  GRP-ADD-SUB-CORR.                                        NC2534.2
   000132         013500     03  GRP-SUBTRACT-CORR-1.                                     NC2534.2
   000133         013600     04  ADD-CORR-1              PICTURE S99  VALUE 11.           NC2534.2
   000134         013700     04  ADD-CORR-2              PICTURE S99  VALUE 22.           NC2534.2
   000135         013800     04  ADD-CORR-5              PICTURE S99  VALUE 55.           NC2534.2
   000136         013900     04  ADD-CORR-4              PICTURE S99  VALUE 44.           NC2534.2
   000137         014000     04  ADD-CORR-3              PICTURE S99  VALUE 33.           NC2534.2
   000138         014100     04  ADD-CORR-6              PICTURE S99  VALUE 66.           NC2534.2
   000139         014200     04  ADD-CORR-7              PICTURE S99  VALUE 77.           NC2534.2
   000140         014300     04  ADD-CORR-8              PICTURE S99  VALUE 88.           NC2534.2
   000141         014400     04  ADD-CORR-9              PICTURE S99  VALUE 99.           NC2534.2
   000142         014500     04  ADD-CORR-B              PICTURE S99  VALUE 92.           NC2534.2
   000143         014600     04  ADD-CORR-0              PICTURE S99  VALUE 00.           NC2534.2
   000144         014700 01  GRP-FOR-ADD-CORR-A.                                          NC2534.2
   000145         014800     02  GRP-SUBTRACT-CORR-3.                                     NC2534.2
   000146         014900         03  GRP-SUBTRACT-CORR-1.                                 NC2534.2
   000147         015000             05  ADD-CORR-4      PICTURE S999   VALUE 044.        NC2534.2
   000148         015100             05  ADD-CORR-3      PICTURE S999   VALUE 033.        NC2534.2
   000149         015200             05  ADD-CORR-2      PICTURE S999   VALUE 022.        NC2534.2
   000150         015300             05  ADD-CORR-1      PICTURE S999   VALUE 111.        NC2534.2
   000151         015400 01  ADD-15.                                                      NC2534.2
   000152         015500     02 FIELD1               PICTURE 99999     VALUE 1.           NC2534.2
   000153         015600     02 FIELD2               PICTURE 999V99    VALUE 32.1.        NC2534.2
   000154         015700     02 FIELD3               PICTURE 999V9     VALUE 123.4.       NC2534.2
   000155         015800 01  ADD-16.                                                      NC2534.2
   000156         015900     02 FIELD1               PICTURE 99999     VALUE 99999.       NC2534.2
   000157         016000     02 FIELD2               PICTURE 999V99    VALUE 745.67.      NC2534.2
   000158         016100     02 FIELD3               PICTURE 999V9     VALUE 432.1.       NC2534.2
   000159         016200 01  SUBTRACT-DATA.                                               NC2534.2
   000160         016300     02 SUBTR-1              PICTURE 9         VALUE 1.           NC2534.2
   000161         016400     02 SUBTR-2              PICTURE S99       VALUE 99.          NC2534.2
   000162         016500     02 SUBTR-3              PICTURE S9V99     VALUE -1.          NC2534.2
   000163         016600     02 SUBTR-4              PICTURE SPP9      VALUE .001.        NC2534.2
   000164         016700     02 SUBTR-5              PICTURE S9PP      VALUE 100.         NC2534.2
   000165         016800     02  SUBTR-6                  PICTURE 9 VALUE 1.              NC2534.2
   000166         016900     02  SUBTR-7                  PICTURE S99  VALUE 99.          NC2534.2
   000167         017000     02  SUBTR-8                  PICTURE S9V99  VALUE -9.99.     NC2534.2
   000168         017100     02 SUBTR-9              PICTURE SV999.                       NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02  SUBTR-10                 PICTURE S999  VALUE 100.        NC2534.2
   000170         017300     02 SUBTR-11             PICTURE S999V999.                    NC2534.2
   000171         017400     02 SUBTR-12.                                                 NC2534.2
   000172         017500     03 SUBTR-13             PICTURE 9         VALUE 1.           NC2534.2
   000173         017600     03 SUBTR-14             PICTURE S9V999    VALUE -1.725.      NC2534.2
   000174         017700     03 SUBTR-15             PICTURE S99V99    VALUE 76.76.       NC2534.2
   000175         017800     02 SUBTR-16.                                                 NC2534.2
   000176         017900     03 SUBTR-13             PICTURE 9         VALUE 2.           NC2534.2
   000177         018000     03 SUBTR-14             PICTURE S9V99     VALUE .23.         NC2534.2
   000178         018100     03 SUBTR-15             PICTURE S9V99     VALUE 1.           NC2534.2
   000179         018200 01  CORR-DATA-1.                                                 NC2534.2
   000180         018300     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000181         018400     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000182         018500     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000183         018600     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000184         018700     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000185         018800     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000186         018900 01  CORR-DATA-2.                                                 NC2534.2
   000187         019000     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000188         019100     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000189         019200     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000190         019300     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000191         019400     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000192         019500     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000193         019600 01  CORR-DATA-3.                                                 NC2534.2
   000194         019700     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000195         019800     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000196         019900     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000197         020000     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000198         020100     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000199         020200     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2534.2 IMP
   000200         020300 01  CORR-DATA-4.                                                 NC2534.2
   000201         020400     03 XYZ-11               PICTURE IS 99.                       NC2534.2
   000202         020500     03 XYZ-12               PICTURE IS 99.                       NC2534.2
   000203         020600     03 XYZ-13               PICTURE IS 99.                       NC2534.2
   000204         020700     03 XYZ-14               PICTURE IS 99.                       NC2534.2
   000205         020800     03 XYZ-15               PICTURE IS 99.                       NC2534.2
   000206         020900     03 XYZ-16               PICTURE IS 99.                       NC2534.2
   000207         021000 01  CORR-DATA-5.                                                 NC2534.2
   000208         021100     03 XYZ-1                PICTURE 99.                          NC2534.2
   000209         021200     03 XYZ-2                PICTURE 99.                          NC2534.2
   000210         021300     03 XYZ-13               PICTURE IS 99.                       NC2534.2
   000211         021400     03 XYZ-14               PICTURE IS 99.                       NC2534.2
   000212         021500     03 FILLER               PICTURE IS 99.                       NC2534.2
   000213         021600     03 XYZ-11               PICTURE IS 99.                       NC2534.2
   000214         021700     03 XYZ-12               PICTURE IS 99.                       NC2534.2
   000215         021800 01  CORR-DATA-6.                                                 NC2534.2
   000216         021900     03 XYZ-11               PICTURE IS 99.                       NC2534.2
   000217         022000     03 XYZ-12               PICTURE IS 99.                       NC2534.2
   000218         022100     03 FILLER               PICTURE IS 99.                       NC2534.2
   000219         022200     03 XYZ-1                PICTURE IS 99.                       NC2534.2
   000220         022300     03 XYZ-2                PICTURE IS 9(2).                     NC2534.2
   000221         022400     03 FILLER               PICTURE IS 99.                       NC2534.2
   000222         022500 01  CORR-DATA-7.                                                 NC2534.2
   000223         022600     02 XYZ-1                PICTURE 99V99     VALUE 10.45.       NC2534.2
   000224         022700     02 XYZ-6                PICTURE 999V9     VALUE 100.5.       NC2534.2
   000225         022800     02 XYZ-11               PICTURE 99V9      VALUE ZERO.        NC2534.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900     02 XYZ-2                PICTURE 99V9      VALUE 0.9.         NC2534.2
   000227         023000 01  42-DATANAMES.                                                NC2534.2
   000228         023100     02  DNAME1   PICTURE 9      VALUE 1        COMPUTATIONAL.    NC2534.2
   000229         023200     02  DNAME2   PICTURE 99      VALUE 1  COMPUTATIONAL.         NC2534.2
   000230         023300     02  DNAME3   PICTURE 999     VALUE 1  COMPUTATIONAL.         NC2534.2
   000231         023400     02  DNAME4   PICTURE 9(4)    VALUE 1  COMPUTATIONAL.         NC2534.2
   000232         023500     02  DNAME5   PICTURE 9(5)    VALUE 1  COMPUTATIONAL.         NC2534.2
   000233         023600     02  DNAME6   PICTURE 9(6)    VALUE 1  COMPUTATIONAL.         NC2534.2
   000234         023700     02  DNAME7   PICTURE 9(7)    VALUE 1  COMPUTATIONAL.         NC2534.2
   000235         023800     02  DNAME8   PICTURE 9(8)    VALUE 1  COMPUTATIONAL.         NC2534.2
   000236         023900     02  DNAME9   PICTURE 9(9)    VALUE 1  COMPUTATIONAL.         NC2534.2
   000237         024000     02  DNAME10  PICTURE 9(10)   VALUE 1.                        NC2534.2
   000238         024100     02  DNAME11  PICTURE 9(11)   VALUE 1.                        NC2534.2
   000239         024200     02  DNAME12  PICTURE 9(12)   VALUE 1.                        NC2534.2
   000240         024300     02  DNAME13  PICTURE 9(13)   VALUE 1.                        NC2534.2
   000241         024400     02  DNAME14  PICTURE 9(14)   VALUE 1.                        NC2534.2
   000242         024500     02  DNAME15  PICTURE 9(15)   VALUE 1.                        NC2534.2
   000243         024600     02  DNAME16  PICTURE 9(16)   VALUE 1.                        NC2534.2
   000244         024700     02  DNAME17  PICTURE 9(17)   VALUE 1.                        NC2534.2
   000245         024800     02  DNAME18  PICTURE 9(18)   VALUE 1.                        NC2534.2
   000246         024900     02  DNAME19  PICTURE 9       VALUE 1.                        NC2534.2
   000247         025000     02  DNAME20  PICTURE 99      VALUE 1.                        NC2534.2
   000248         025100     02  DNAME21  PICTURE 999     VALUE 1.                        NC2534.2
   000249         025200     02  DNAME22  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000250         025300     02  DNAME23  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000251         025400     02  DNAME24  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000252         025500     02  DNAME25  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000253         025600     02  DNAME26  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000254         025700     02  DNAME27  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000255         025800     02  DNAME28  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000256         025900     02  DNAME29  PICTURE 9(18)  VALUE ZERO.                      NC2534.2 IMP
   000257         026000     02  DNAME30   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000258         026100     02  DNAME31   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000259         026200     02  DNAME32   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000260         026300     02  DNAME33   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000261         026400     02  DNAME34   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000262         026500     02  DNAME35   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000263         026600     02  DNAME36   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000264         026700     02  DNAME37   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000265         026800     02  DNAME38   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000266         026900     02  DNAME39   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000267         027000     02  DNAME40   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000268         027100     02  DNAME41   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000269         027200     02  DNAME42   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2534.2 IMP
   000270         027300 01  TEST-RESULTS.                                                NC2534.2
   000271         027400     02 FILLER                   PIC X      VALUE SPACE.          NC2534.2 IMP
   000272         027500     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2534.2 IMP
   000273         027600     02 FILLER                   PIC X      VALUE SPACE.          NC2534.2 IMP
   000274         027700     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2534.2 IMP
   000275         027800     02 FILLER                   PIC X      VALUE SPACE.          NC2534.2 IMP
   000276         027900     02  PAR-NAME.                                                NC2534.2
   000277         028000       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2534.2 IMP
   000278         028100       03  PARDOT-X              PIC X      VALUE SPACE.          NC2534.2 IMP
   000279         028200       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2534.2 IMP
   000280         028300     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2534.2 IMP
   000281         028400     02 RE-MARK                  PIC X(61).                       NC2534.2
   000282         028500 01  TEST-COMPUTED.                                               NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2534.2 IMP
   000284         028700     02 FILLER                   PIC X(17)  VALUE                 NC2534.2
   000285         028800            "       COMPUTED=".                                   NC2534.2
   000286         028900     02 COMPUTED-X.                                               NC2534.2
   000287         029000     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2534.2 IMP
   000288         029100     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2534.2 287
   000289         029200                                 PIC -9(9).9(9).                  NC2534.2
   000290         029300     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2534.2 287
   000291         029400     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2534.2 287
   000292         029500     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2534.2 287
   000293         029600     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2534.2 287
   000294         029700         04 COMPUTED-18V0                    PIC -9(18).          NC2534.2
   000295         029800         04 FILLER                           PIC X.               NC2534.2
   000296         029900     03 FILLER PIC X(50) VALUE SPACE.                             NC2534.2 IMP
   000297         030000 01  TEST-CORRECT.                                                NC2534.2
   000298         030100     02 FILLER PIC X(30) VALUE SPACE.                             NC2534.2 IMP
   000299         030200     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2534.2
   000300         030300     02 CORRECT-X.                                                NC2534.2
   000301         030400     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2534.2 IMP
   000302         030500     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2534.2 301
   000303         030600     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2534.2 301
   000304         030700     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2534.2 301
   000305         030800     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2534.2 301
   000306         030900     03      CR-18V0 REDEFINES CORRECT-A.                         NC2534.2 301
   000307         031000         04 CORRECT-18V0                     PIC -9(18).          NC2534.2
   000308         031100         04 FILLER                           PIC X.               NC2534.2
   000309         031200     03 FILLER PIC X(2) VALUE SPACE.                              NC2534.2 IMP
   000310         031300     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2534.2 IMP
   000311         031400 01  CCVS-C-1.                                                    NC2534.2
   000312         031500     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2534.2
   000313         031600-    "SS  PARAGRAPH-NAME                                          NC2534.2
   000314         031700-    "       REMARKS".                                            NC2534.2
   000315         031800     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2534.2 IMP
   000316         031900 01  CCVS-C-2.                                                    NC2534.2
   000317         032000     02 FILLER                     PIC X        VALUE SPACE.      NC2534.2 IMP
   000318         032100     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2534.2
   000319         032200     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2534.2 IMP
   000320         032300     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2534.2
   000321         032400     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2534.2 IMP
   000322         032500 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2534.2 IMP
   000323         032600 01  REC-CT                        PIC 99       VALUE ZERO.       NC2534.2 IMP
   000324         032700 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2534.2 IMP
   000325         032800 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2534.2 IMP
   000326         032900 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2534.2 IMP
   000327         033000 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2534.2 IMP
   000328         033100 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2534.2 IMP
   000329         033200 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2534.2 IMP
   000330         033300 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2534.2 IMP
   000331         033400 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2534.2 IMP
   000332         033500 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2534.2 IMP
   000333         033600 01  CCVS-H-1.                                                    NC2534.2
   000334         033700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2534.2 IMP
   000335         033800     02  FILLER                    PIC X(42)    VALUE             NC2534.2
   000336         033900     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2534.2
   000337         034000     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2534.2 IMP
   000338         034100 01  CCVS-H-2A.                                                   NC2534.2
   000339         034200   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2534.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2534.2
   000341         034400   02  FILLER                        PIC XXXX   VALUE             NC2534.2
   000342         034500     "4.2 ".                                                      NC2534.2
   000343         034600   02  FILLER                        PIC X(28)  VALUE             NC2534.2
   000344         034700            " COPY - NOT FOR DISTRIBUTION".                       NC2534.2
   000345         034800   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2534.2 IMP
   000346         034900                                                                  NC2534.2
   000347         035000 01  CCVS-H-2B.                                                   NC2534.2
   000348         035100   02  FILLER                        PIC X(15)  VALUE             NC2534.2
   000349         035200            "TEST RESULT OF ".                                    NC2534.2
   000350         035300   02  TEST-ID                       PIC X(9).                    NC2534.2
   000351         035400   02  FILLER                        PIC X(4)   VALUE             NC2534.2
   000352         035500            " IN ".                                               NC2534.2
   000353         035600   02  FILLER                        PIC X(12)  VALUE             NC2534.2
   000354         035700     " HIGH       ".                                              NC2534.2
   000355         035800   02  FILLER                        PIC X(22)  VALUE             NC2534.2
   000356         035900            " LEVEL VALIDATION FOR ".                             NC2534.2
   000357         036000   02  FILLER                        PIC X(58)  VALUE             NC2534.2
   000358         036100     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2534.2
   000359         036200 01  CCVS-H-3.                                                    NC2534.2
   000360         036300     02  FILLER                      PIC X(34)  VALUE             NC2534.2
   000361         036400            " FOR OFFICIAL USE ONLY    ".                         NC2534.2
   000362         036500     02  FILLER                      PIC X(58)  VALUE             NC2534.2
   000363         036600     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2534.2
   000364         036700     02  FILLER                      PIC X(28)  VALUE             NC2534.2
   000365         036800            "  COPYRIGHT   1985 ".                                NC2534.2
   000366         036900 01  CCVS-E-1.                                                    NC2534.2
   000367         037000     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2534.2 IMP
   000368         037100     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2534.2
   000369         037200     02 ID-AGAIN                     PIC X(9).                    NC2534.2
   000370         037300     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2534.2 IMP
   000371         037400 01  CCVS-E-2.                                                    NC2534.2
   000372         037500     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2534.2 IMP
   000373         037600     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2534.2 IMP
   000374         037700     02 CCVS-E-2-2.                                               NC2534.2
   000375         037800         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2534.2 IMP
   000376         037900         03 FILLER                   PIC X      VALUE SPACE.      NC2534.2 IMP
   000377         038000         03 ENDER-DESC               PIC X(44)  VALUE             NC2534.2
   000378         038100            "ERRORS ENCOUNTERED".                                 NC2534.2
   000379         038200 01  CCVS-E-3.                                                    NC2534.2
   000380         038300     02  FILLER                      PIC X(22)  VALUE             NC2534.2
   000381         038400            " FOR OFFICIAL USE ONLY".                             NC2534.2
   000382         038500     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2534.2 IMP
   000383         038600     02  FILLER                      PIC X(58)  VALUE             NC2534.2
   000384         038700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2534.2
   000385         038800     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2534.2 IMP
   000386         038900     02 FILLER                       PIC X(15)  VALUE             NC2534.2
   000387         039000             " COPYRIGHT 1985".                                   NC2534.2
   000388         039100 01  CCVS-E-4.                                                    NC2534.2
   000389         039200     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2534.2 IMP
   000390         039300     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2534.2
   000391         039400     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2534.2 IMP
   000392         039500     02 FILLER                       PIC X(40)  VALUE             NC2534.2
   000393         039600      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2534.2
   000394         039700 01  XXINFO.                                                      NC2534.2
   000395         039800     02 FILLER                       PIC X(19)  VALUE             NC2534.2
   000396         039900            "*** INFORMATION ***".                                NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     02 INFO-TEXT.                                                NC2534.2
   000398         040100       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2534.2 IMP
   000399         040200       04 XXCOMPUTED                 PIC X(20).                   NC2534.2
   000400         040300       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2534.2 IMP
   000401         040400       04 XXCORRECT                  PIC X(20).                   NC2534.2
   000402         040500     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2534.2
   000403         040600 01  HYPHEN-LINE.                                                 NC2534.2
   000404         040700     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2534.2 IMP
   000405         040800     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2534.2
   000406         040900-    "*****************************************".                 NC2534.2
   000407         041000     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2534.2
   000408         041100-    "******************************".                            NC2534.2
   000409         041200 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2534.2
   000410         041300     "NC253A".                                                    NC2534.2
   000411         041400 PROCEDURE DIVISION.                                              NC2534.2
   000412         041500 CCVS1 SECTION.                                                   NC2534.2
   000413         041600 OPEN-FILES.                                                      NC2534.2
   000414         041700     OPEN     OUTPUT PRINT-FILE.                                  NC2534.2 35
   000415         041800     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2534.2 409 350 409 369
   000416         041900     MOVE    SPACE TO TEST-RESULTS.                               NC2534.2 IMP 270
   000417         042000     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2534.2 442 447
   000418         042100     GO TO CCVS1-EXIT.                                            NC2534.2 524
   000419         042200 CLOSE-FILES.                                                     NC2534.2
   000420         042300     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2534.2 451 472 35
   000421         042400 TERMINATE-CCVS.                                                  NC2534.2
   000422         042500     EXIT PROGRAM.                                                NC2534.2
   000423         042600 TERMINATE-CALL.                                                  NC2534.2
   000424         042700     STOP     RUN.                                                NC2534.2
   000425         042800 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2534.2 274 326
   000426         042900 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2534.2 274 327
   000427         043000 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2534.2 274 325
   000428         043100 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2534.2 274 324
   000429         043200     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2534.2 281
   000430         043300 PRINT-DETAIL.                                                    NC2534.2
   000431         043400     IF REC-CT NOT EQUAL TO ZERO                                  NC2534.2 323 IMP
   000432      1  043500             MOVE "." TO PARDOT-X                                 NC2534.2 278
   000433      1  043600             MOVE REC-CT TO DOTVALUE.                             NC2534.2 323 279
   000434         043700     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2534.2 270 36 484
   000435         043800     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2534.2 274 484
   000436      1  043900        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2534.2 501 514
   000437      1  044000          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2534.2 515 523
   000438         044100     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2534.2 IMP 274 IMP 286
   000439         044200     MOVE SPACE TO CORRECT-X.                                     NC2534.2 IMP 300
   000440         044300     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2534.2 323 IMP IMP 276
   000441         044400     MOVE     SPACE TO RE-MARK.                                   NC2534.2 IMP 281
   000442         044500 HEAD-ROUTINE.                                                    NC2534.2
   000443         044600     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2534.2 333 37 484
   000444         044700     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2534.2 338 37 484
   000445         044800     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2534.2 347 37 484
   000446         044900     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2534.2 359 37 484
   000447         045000 COLUMN-NAMES-ROUTINE.                                            NC2534.2
   000448         045100     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2534.2 311 37 484
   000449         045200     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2534.2 316 37 484
   000450         045300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2534.2 403 37 484
   000451         045400 END-ROUTINE.                                                     NC2534.2
   000452         045500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2534.2 403 37 484
   000453         045600 END-RTN-EXIT.                                                    NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2534.2 366 37 484
   000455         045800 END-ROUTINE-1.                                                   NC2534.2
   000456         045900      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2534.2 325 329 326
   000457         046000      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2534.2 329 324 329
   000458         046100      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2534.2 327 329
   000459         046200*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2534.2
   000460         046300      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2534.2 327 389
   000461         046400      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2534.2 329 391
   000462         046500      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2534.2 388 374
   000463         046600      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2534.2 371 37 484
   000464         046700  END-ROUTINE-12.                                                 NC2534.2
   000465         046800      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2534.2 377
   000466         046900     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2534.2 325 IMP
   000467      1  047000         MOVE "NO " TO ERROR-TOTAL                                NC2534.2 375
   000468         047100         ELSE                                                     NC2534.2
   000469      1  047200         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2534.2 325 375
   000470         047300     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2534.2 371 37
   000471         047400     PERFORM WRITE-LINE.                                          NC2534.2 484
   000472         047500 END-ROUTINE-13.                                                  NC2534.2
   000473         047600     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2534.2 324 IMP
   000474      1  047700         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2534.2 375
   000475      1  047800         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2534.2 324 375
   000476         047900     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2534.2 377
   000477         048000     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2534.2 371 37 484
   000478         048100      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2534.2 326 IMP
   000479      1  048200          MOVE "NO " TO ERROR-TOTAL                               NC2534.2 375
   000480      1  048300      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2534.2 326 375
   000481         048400      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2534.2 377
   000482         048500      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2534.2 371 37 484
   000483         048600     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2534.2 379 37 484
   000484         048700 WRITE-LINE.                                                      NC2534.2
   000485         048800     ADD 1 TO RECORD-COUNT.                                       NC2534.2 331
   000486         048900     IF RECORD-COUNT GREATER 50                                   NC2534.2 331
   000487      1  049000         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2534.2 37 330
   000488      1  049100         MOVE SPACE TO DUMMY-RECORD                               NC2534.2 IMP 37
   000489      1  049200         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2534.2 37
   000490      1  049300         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2534.2 311 37 496
   000491      1  049400         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2534.2 316 37 496
   000492      1  049500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2534.2 403 37 496
   000493      1  049600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2534.2 330 37
   000494      1  049700         MOVE ZERO TO RECORD-COUNT.                               NC2534.2 IMP 331
   000495         049800     PERFORM WRT-LN.                                              NC2534.2 496
   000496         049900 WRT-LN.                                                          NC2534.2
   000497         050000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2534.2 37
   000498         050100     MOVE SPACE TO DUMMY-RECORD.                                  NC2534.2 IMP 37
   000499         050200 BLANK-LINE-PRINT.                                                NC2534.2
   000500         050300     PERFORM WRT-LN.                                              NC2534.2 496
   000501         050400 FAIL-ROUTINE.                                                    NC2534.2
   000502         050500     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2534.2 286 IMP 509
   000503         050600     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2534.2 300 IMP 509
   000504         050700     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2534.2 332 402
   000505         050800     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2534.2 397
   000506         050900     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2534.2 394 37 484
   000507         051000     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2534.2 IMP 402
   000508         051100     GO TO  FAIL-ROUTINE-EX.                                      NC2534.2 514
   000509         051200 FAIL-ROUTINE-WRITE.                                              NC2534.2
   000510         051300     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2534.2 282 36 484
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2534.2 332 310
   000512         051500     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2534.2 297 36 484
   000513         051600     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2534.2 IMP 310
   000514         051700 FAIL-ROUTINE-EX. EXIT.                                           NC2534.2
   000515         051800 BAIL-OUT.                                                        NC2534.2
   000516         051900     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2534.2 287 IMP 518
   000517         052000     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2534.2 301 IMP 523
   000518         052100 BAIL-OUT-WRITE.                                                  NC2534.2
   000519         052200     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2534.2 301 401 287 399
   000520         052300     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2534.2 332 402
   000521         052400     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2534.2 394 37 484
   000522         052500     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2534.2 IMP 402
   000523         052600 BAIL-OUT-EX. EXIT.                                               NC2534.2
   000524         052700 CCVS1-EXIT.                                                      NC2534.2
   000525         052800     EXIT.                                                        NC2534.2
   000526         052900*                                                                 NC2534.2
   000527         053000 SECT-NC253A-001 SECTION.                                         NC2534.2
   000528         053100 BUILD-TABLE1.                                                    NC2534.2
   000529         053200     MOVE 06 TO RECORD1 OF TABLE1.                                NC2534.2 40 39
   000530         053300     MOVE 01 TO RECORD2 OF TABLE1 (1).                            NC2534.2 41 39
   000531         053400     MOVE 02 TO RECORD2 OF TABLE1 (2).                            NC2534.2 41 39
   000532         053500     MOVE 07 TO RECORD3 OF TABLE1.                                NC2534.2 44 39
   000533         053600 BUILD-TABLE2.                                                    NC2534.2
   000534         053700     MOVE 08 TO RECORD1 OF TABLE2.                                NC2534.2 46 45
   000535         053800     MOVE 03 TO RECORD2 OF TABLE2 (1).                            NC2534.2 47 45
   000536         053900     MOVE 04 TO RECORD2 OF TABLE2 (2).                            NC2534.2 47 45
   000537         054000     MOVE 09 TO RECORD3 OF TABLE2.                                NC2534.2 50 45
   000538         054100*                                                                 NC2534.2
   000539         054200 SUB-INIT-F3-1.                                                   NC2534.2
   000540         054300     PERFORM END-ROUTINE.                                         NC2534.2 451
   000541         054400     MOVE "SUB-TEST-F3-1" TO PAR-NAME.                            NC2534.2 276
   000542         054500     MOVE   "VI-134 6.25.4 GR3" TO ANSI-REFERENCE.                NC2534.2 332
   000543         054600     MOVE   "SUBTRACT SERIES " TO FEATURE.                        NC2534.2 272
   000544         054700     MOVE ZERO TO GRP-FOR-ADD-CORR-R.                             NC2534.2 IMP 118
   000545         054800     MOVE   11  TO  ADD-CORR-1 OF GRP-FOR-ADD-CORR-1.             NC2534.2 109 105
   000546         054900     MOVE   22  TO  ADD-CORR-2 OF GRP-FOR-ADD-CORR-1.             NC2534.2 108 105
   000547         055000     MOVE   33  TO  ADD-CORR-3 OF GRP-FOR-ADD-CORR-1.             NC2534.2 112 105
   000548         055100     MOVE   44  TO  ADD-CORR-4 OF GRP-FOR-ADD-CORR-1.             NC2534.2 111 105
   000549         055200     MOVE   55  TO  ADD-CORR-5 OF GRP-FOR-ADD-CORR-1.             NC2534.2 114 105
   000550         055300     MOVE   66  TO  ADD-CORR-6 OF GRP-FOR-ADD-CORR-1.             NC2534.2 113 105
   000551         055400     MOVE   77  TO  ADD-CORR-7 OF GRP-FOR-ADD-CORR-1.             NC2534.2 116 105
   000552         055500     MOVE   88  TO  ADD-CORR-8 OF GRP-FOR-ADD-CORR-1.             NC2534.2 115 105
   000553         055600     MOVE   99  TO  ADD-CORR-9 OF GRP-FOR-ADD-CORR-1.             NC2534.2 117 105
   000554         055700 SUB-TEST-F3-1.                                                   NC2534.2
   000555         055800     SUBTRACT CORRESPONDING GRP-FOR-ADD-CORR-1 FROM               NC2534.2 105

 ==000555==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
                         "GRP-FOR-ADD-CORR-1" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   000556         055900         GRP-FOR-ADD-CORR-R.                                      NC2534.2 118
   000557         056000     IF GRP-FOR-ADD-CORR-R EQUAL TO "11223344506677889900"        NC2534.2 118
   000558      1  056100         PERFORM PASS                                             NC2534.2 426
   000559      1  056200         GO TO SUB-WRITE-F3-1.                                    NC2534.2 568
   000560         056300     GO TO SUB-FAIL-F3-1.                                         NC2534.2 564
   000561         056400 SUB-DELETE-F3-1.                                                 NC2534.2
   000562         056500     PERFORM DE-LETE.                                             NC2534.2 428
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000563         056600     GO TO SUB-WRITE-F3-1.                                        NC2534.2 568
   000564         056700 SUB-FAIL-F3-1.                                                   NC2534.2
   000565         056800     MOVE GRP-FOR-ADD-CORR-R TO COMPUTED-A.                       NC2534.2 118 287
   000566         056900     MOVE "11223344506677889900" TO CORRECT-A.                    NC2534.2 301
   000567         057000     PERFORM FAIL.                                                NC2534.2 427
   000568         057100 SUB-WRITE-F3-1.                                                  NC2534.2
   000569         057200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000570         057300*                                                                 NC2534.2
   000571         057400 SUB-INIT-F3-2.                                                   NC2534.2
   000572         057500     MOVE "SUB-TEST-F3-2" TO PAR-NAME.                            NC2534.2 276
   000573         057600     MOVE ZERO TO GRP-FOR-ADD-CORR-R.                             NC2534.2 IMP 118
   000574         057700 SUB-TEST-F3-2.                                                   NC2534.2
   000575         057800     SUBTRACT CORRESPONDING GRP-ADD-SUB-CORR FROM                 NC2534.2 131
   000576         057900         GRP-FOR-ADD-CORR-R ROUNDED.                              NC2534.2 118
   000577         058000     IF GRP-FOR-ADD-CORR-R EQUAL TO "11223344606677889900"        NC2534.2 118
   000578      1  058100         PERFORM PASS                                             NC2534.2 426
   000579      1  058200         GO TO SUB-WRITE-F3-2.                                    NC2534.2 588
   000580         058300     GO TO SUB-FAIL-F3-2.                                         NC2534.2 584
   000581         058400 SUB-DELETE-F3-2.                                                 NC2534.2
   000582         058500     PERFORM DE-LETE.                                             NC2534.2 428
   000583         058600     GO TO SUB-WRITE-F3-2.                                        NC2534.2 588
   000584         058700 SUB-FAIL-F3-2.                                                   NC2534.2
   000585         058800     MOVE GRP-FOR-ADD-CORR-R TO COMPUTED-A.                       NC2534.2 118 287
   000586         058900     MOVE "11223344606677889900" TO CORRECT-A.                    NC2534.2 301
   000587         059000     PERFORM FAIL.                                                NC2534.2 427
   000588         059100 SUB-WRITE-F3-2.                                                  NC2534.2
   000589         059200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000590         059300*                                                                 NC2534.2
   000591         059400 SUB-INIT-F3-3.                                                   NC2534.2
   000592         059500     MOVE  1      TO SUBTR-13 OF SUBTR-12.                        NC2534.2 172 171
   000593         059600     MOVE -1.725  TO SUBTR-14 OF SUBTR-12.                        NC2534.2 173 171
   000594         059700     MOVE 76.76   TO SUBTR-15 OF SUBTR-12.                        NC2534.2 174 171
   000595         059800     MOVE  2      TO SUBTR-13 OF SUBTR-16.                        NC2534.2 176 175
   000596         059900     MOVE  0.23   TO SUBTR-14 OF SUBTR-16.                        NC2534.2 177 175
   000597         060000     MOVE  1      TO SUBTR-15 OF SUBTR-16.                        NC2534.2 178 175
   000598         060100 SUB-INIT-F3-3-1.                                                 NC2534.2
   000599         060200     MOVE "SUB-TEST-F3-3-1" TO PAR-NAME.                          NC2534.2 276
   000600         060300     MOVE SPACE TO WRK-AN-00001.                                  NC2534.2 IMP 51
   000601         060400 SUB-TEST-F3-3-1.                                                 NC2534.2
   000602         060500     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED ON     NC2534.2 171 175
   000603         060600     SIZE ERROR                                                   NC2534.2
   000604      1  060700           MOVE "G" TO WRK-AN-00001.                              NC2534.2 51
   000605         060800     IF WRK-AN-00001 EQUAL TO "G"                                 NC2534.2 51
   000606      1  060900           PERFORM PASS                                           NC2534.2 426
   000607      1  061000           GO TO SUB-WRITE-F3-3-1.                                NC2534.2 615
   000608         061100     GO TO SUB-FAIL-F3-3-1.                                       NC2534.2 612
   000609         061200 SUB-DELETE-F3-3-1.                                               NC2534.2
   000610         061300     PERFORM DE-LETE.                                             NC2534.2 428
   000611         061400     GO TO SUB-WRITE-F3-3-1.                                      NC2534.2 615
   000612         061500 SUB-FAIL-F3-3-1.                                                 NC2534.2
   000613         061600     PERFORM FAIL.                                                NC2534.2 427
   000614         061700     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC2534.2 281
   000615         061800 SUB-WRITE-F3-3-1.                                                NC2534.2
   000616         061900     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000617         062000*                                                                 NC2534.2
   000618         062100 SUB-INIT-F3-3-2.                                                 NC2534.2
   000619         062200     MOVE "SUB-TEST-F3-3-2" TO PAR-NAME.                          NC2534.2 276
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000620         062300 SUB-TEST-F3-3-2.                                                 NC2534.2
   000621         062400     IF SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                       NC2534.2 176 175
   000622      1  062500             GO TO SUB-FAIL-F3-3-2.                               NC2534.2 628
   000623         062600     PERFORM PASS.                                                NC2534.2 426
   000624         062700     GO TO SUB-WRITE-F3-3-2.                                      NC2534.2 634
   000625         062800 SUB-DELETE-F3-3-2.                                               NC2534.2
   000626         062900     PERFORM DE-LETE.                                             NC2534.2 428
   000627         063000     GO TO SUB-WRITE-F3-3-2.                                      NC2534.2 634
   000628         063100 SUB-FAIL-F3-3-2.                                                 NC2534.2
   000629         063200     PERFORM FAIL.                                                NC2534.2 427
   000630         063300     MOVE SUBTR-13 OF SUBTR-16 TO COMPUTED-N.                     NC2534.2 176 175 288
   000631         063400     MOVE "+1" TO CORRECT-A.                                      NC2534.2 301
   000632         063500     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   000633         063600        TO RE-MARK.                                               NC2534.2 281
   000634         063700 SUB-WRITE-F3-3-2.                                                NC2534.2
   000635         063800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000636         063900*                                                                 NC2534.2
   000637         064000 SUB-INIT-F3-3-3.                                                 NC2534.2
   000638         064100     MOVE "SUB-TEST-F3-3-3" TO PAR-NAME.                          NC2534.2 276
   000639         064200 SUB-TEST-F3-3-3.                                                 NC2534.2
   000640         064300     IF SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96                 NC2534.2 177 175
   000641      1  064400             GO TO SUB-FAIL-F3-3-3.                               NC2534.2 647
   000642         064500     PERFORM PASS.                                                NC2534.2 426
   000643         064600     GO TO SUB-WRITE-F3-3-3.                                      NC2534.2 653
   000644         064700 SUB-DELETE-F3-3-3.                                               NC2534.2
   000645         064800     PERFORM DE-LETE.                                             NC2534.2 428
   000646         064900     GO TO SUB-WRITE-F3-3-3.                                      NC2534.2 653
   000647         065000 SUB-FAIL-F3-3-3.                                                 NC2534.2
   000648         065100     PERFORM FAIL.                                                NC2534.2 427
   000649         065200     MOVE SUBTR-14 OF SUBTR-16 TO COMPUTED-N.                     NC2534.2 177 175 288
   000650         065300     MOVE "+1.96" TO CORRECT-A.                                   NC2534.2 301
   000651         065400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   000652         065500        TO RE-MARK.                                               NC2534.2 281
   000653         065600 SUB-WRITE-F3-3-3.                                                NC2534.2
   000654         065700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000655         065800*                                                                 NC2534.2
   000656         065900 SUB-INIT-3-3-4.                                                  NC2534.2
   000657         066000     MOVE "SUB-TEST-3-3-4" TO PAR-NAME.                           NC2534.2 276
   000658         066100 SUB-TEST-3-3-4.                                                  NC2534.2
   000659         066200     IF SUBTR-15 OF SUBTR-16 NOT EQUAL TO 1                       NC2534.2 178 175
   000660      1  066300            GO TO SUB-FAIL-3-3-4.                                 NC2534.2 666
   000661         066400     PERFORM PASS                                                 NC2534.2 426
   000662         066500     GO TO SUB-WRITE-3-3-4.                                       NC2534.2 671
   000663         066600 SUB-DELETE-3-3-4.                                                NC2534.2
   000664         066700     PERFORM DE-LETE.                                             NC2534.2 428
   000665         066800     GO TO SUB-WRITE-3-3-4.                                       NC2534.2 671
   000666         066900 SUB-FAIL-3-3-4.                                                  NC2534.2
   000667         067000     PERFORM FAIL.                                                NC2534.2 427
   000668         067100     MOVE SUBTR-15 OF SUBTR-16 TO COMPUTED-N.                     NC2534.2 178 175 288
   000669         067200     MOVE "+1" TO CORRECT-A.                                      NC2534.2 301
   000670         067300     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC2534.2 281
   000671         067400 SUB-WRITE-3-3-4.                                                 NC2534.2
   000672         067500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000673         067600*                                                                 NC2534.2
   000674         067700 SUB-INIT-F3-4.                                                   NC2534.2
   000675         067800     MOVE "SUB-TEST-F3-4" TO PAR-NAME.                            NC2534.2 276
   000676         067900     MOVE "050506060000" TO CORR-DATA-2.                          NC2534.2 186
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000677         068000     MOVE "999999999999" TO CORR-DATA-3.                          NC2534.2 193
   000678         068100 SUB-TEST-F3-4.                                                   NC2534.2
   000679         068200     SUBTRACT CORRESPONDING CORR-DATA-2 FROM CORR-DATA-3.         NC2534.2 186 193
   000680         068300     IF CORR-DATA-3 EQUAL TO "939399999494"                       NC2534.2 193
   000681      1  068400         PERFORM PASS                                             NC2534.2 426
   000682      1  068500         GO TO SUB-WRITE-F3-4.                                    NC2534.2 691
   000683         068600     GO TO SUB-FAIL-F3-4.                                         NC2534.2 687
   000684         068700 SUB-DELETE-F3-4.                                                 NC2534.2
   000685         068800     PERFORM DE-LETE.                                             NC2534.2 428
   000686         068900     GO TO SUB-WRITE-F3-4.                                        NC2534.2 691
   000687         069000 SUB-FAIL-F3-4.                                                   NC2534.2
   000688         069100     MOVE 939399999494 TO CORRECT-A.                              NC2534.2 301
   000689         069200     MOVE CORR-DATA-3 TO COMPUTED-A.                              NC2534.2 193 287
   000690         069300     PERFORM FAIL.                                                NC2534.2 427
   000691         069400 SUB-WRITE-F3-4.                                                  NC2534.2
   000692         069500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000693         069600*                                                                 NC2534.2
   000694         069700 SUB-INIT-F3-5.                                                   NC2534.2
   000695         069800     MOVE "SUB-TEST-F3-5" TO PAR-NAME.                            NC2534.2 276
   000696         069900     MOVE 999955995511 TO CORR-DATA-1.                            NC2534.2 179
   000697         070000     MOVE 123456107890 TO CORR-DATA-6.                            NC2534.2 215
   000698         070100 SUB-TEST-F3-5.                                                   NC2534.2
   000699         070200     SUBTRACT CORRESPONDING CORR-DATA-6 FROM CORR-DATA-1.         NC2534.2 215 179

 ==000699==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
                         "CORR-DATA-6" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

 ==000699==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
                         "CORR-DATA-6" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   000700         070300     IF CORR-DATA-1 EQUAL TO "892155995511"                       NC2534.2 179
   000701      1  070400         PERFORM PASS                                             NC2534.2 426
   000702      1  070500         GO TO SUB-WRITE-F3-5.                                    NC2534.2 711
   000703         070600     GO TO SUB-FAIL-F3-5.                                         NC2534.2 707
   000704         070700 SUB-DELETE-F3-5.                                                 NC2534.2
   000705         070800     PERFORM DE-LETE.                                             NC2534.2 428
   000706         070900     GO TO SUB-WRITE-F3-5.                                        NC2534.2 711
   000707         071000 SUB-FAIL-F3-5.                                                   NC2534.2
   000708         071100     MOVE 892155995511 TO CORRECT-A.                              NC2534.2 301
   000709         071200     MOVE CORR-DATA-1 TO COMPUTED-A.                              NC2534.2 179 287
   000710         071300     PERFORM FAIL.                                                NC2534.2 427
   000711         071400 SUB-WRITE-F3-5.                                                  NC2534.2
   000712         071500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000713         071600*                                                                 NC2534.2
   000714         071700 SUB-INIT-F3-6.                                                   NC2534.2
   000715         071800     MOVE "555555000055" TO CORR-DATA-6.                          NC2534.2 215
   000716         071900     MOVE "SUB-TEST-F3-6" TO PAR-NAME.                            NC2534.2 276
   000717         072000 SUB-TEST-F3-6.                                                   NC2534.2
   000718         072100     SUBTRACT CORRESPONDING CORR-DATA-6 FROM CORR-DATA-1          NC2534.2 215 179

 ==000718==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
                         "CORR-DATA-6" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

 ==000718==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0                        "CORR-DATA-6" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   000719         072200     IF CORR-DATA-1 EQUAL TO 892155995511                         NC2534.2 179
   000720      1  072300         PERFORM PASS                                             NC2534.2 426
   000721      1  072400         GO TO SUB-WRITE-F3-6.                                    NC2534.2 730
   000722         072500     GO TO SUB-FAIL-F3-6.                                         NC2534.2 726
   000723         072600 SUB-DELETE-F3-6.                                                 NC2534.2
   000724         072700     PERFORM DE-LETE.                                             NC2534.2 428
   000725         072800     GO TO SUB-WRITE-F3-6.                                        NC2534.2 730
   000726         072900 SUB-FAIL-F3-6.                                                   NC2534.2
   000727         073000     MOVE 892155995511 TO CORRECT-A.                              NC2534.2 301
   000728         073100     MOVE CORR-DATA-1 TO COMPUTED-A.                              NC2534.2 179 287
   000729         073200     PERFORM FAIL.                                                NC2534.2 427
   000730         073300 SUB-WRITE-F3-6.                                                  NC2534.2
   000731         073400     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000732         073500*                                                                 NC2534.2
   000733         073600 SUB-INIT-F3-7.                                                   NC2534.2
   000734         073700     MOVE "SUB-TEST-F3-7" TO PAR-NAME.                            NC2534.2 276
   000735         073800     MOVE 99999999999999 TO CORR-DATA-5.                          NC2534.2 207
   000736         073900     MOVE 111111111111 TO CORR-DATA-1.                            NC2534.2 179
   000737         074000 SUB-TEST-F3-7.                                                   NC2534.2
   000738         074100     SUBTRACT CORRESPONDING CORR-DATA-1 FROM CORR-DATA-5.         NC2534.2 179 207
   000739         074200     IF CORR-DATA-5 EQUAL TO "88889999999999"                     NC2534.2 207
   000740      1  074300         PERFORM PASS                                             NC2534.2 426
   000741      1  074400         GO TO SUB-WRITE-F3-7.                                    NC2534.2 750
   000742         074500     GO TO SUB-FAIL-F3-7.                                         NC2534.2 746
   000743         074600 SUB-DELETE-F3-7.                                                 NC2534.2
   000744         074700     PERFORM DE-LETE.                                             NC2534.2 428
   000745         074800     GO TO SUB-WRITE-F3-7.                                        NC2534.2 750
   000746         074900 SUB-FAIL-F3-7.                                                   NC2534.2
   000747         075000     PERFORM FAIL.                                                NC2534.2 427
   000748         075100     MOVE CORR-DATA-5 TO COMPUTED-A.                              NC2534.2 207 287
   000749         075200     MOVE "88889999999999" TO CORRECT-A.                          NC2534.2 301
   000750         075300 SUB-WRITE-F3-7.                                                  NC2534.2
   000751         075400     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000752         075500*                                                                 NC2534.2
   000753         075600 SUB-INIT-F3-8.                                                   NC2534.2
   000754         075700     MOVE   "SUB-TEST-F3-8" TO PAR-NAME.                          NC2534.2 276
   000755         075800     MOVE   "VI-134 6.25.4 GR3" TO ANSI-REFERENCE.                NC2534.2 332
   000756         075900     PERFORM BUILD-TABLE1.                                        NC2534.2 528
   000757         076000     PERFORM BUILD-TABLE2.                                        NC2534.2 533
   000758         076100 SUB-TEST-F3-8-0.                                                 NC2534.2
   000759         076200     SUBTRACT CORRESPONDING TABLE1 FROM TABLE2.                   NC2534.2 39 45

 ==000759==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "RECORD2" within
                         "TABLE1" did not qualify according to the rules for the "CORRESPONDING"
                         phrase.  Subordinate item "RECORD2" was ignored.

   000760         076300 SUB-TEST-F3-8-1.                                                 NC2534.2
   000761         076400     IF      RECORD1 OF TABLE2 = 02                               NC2534.2 46 45
   000762         076500         AND RECORD2 OF TABLE2 (1) = 03                           NC2534.2 47 45
   000763         076600         AND RECORD2 OF TABLE2 (2) = 04                           NC2534.2 47 45
   000764         076700         AND RECORD3 OF TABLE2 = 02                               NC2534.2 50 45
   000765      1  076800             PERFORM PASS                                         NC2534.2 426
   000766      1  076900             GO TO  SUB-WRITE-F3-8.                               NC2534.2 775
   000767         077000     GO TO   SUB-FAIL-F3-8.                                       NC2534.2 771
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000768         077100 SUB-DELETE-F3-8.                                                 NC2534.2
   000769         077200     PERFORM DE-LETE.                                             NC2534.2 428
   000770         077300     GO TO   SUB-WRITE-F3-8.                                      NC2534.2 775
   000771         077400 SUB-FAIL-F3-8.                                                   NC2534.2
   000772         077500     PERFORM FAIL.                                                NC2534.2 427
   000773         077600     MOVE    TABLE2 TO COMPUTED-A.                                NC2534.2 45 287
   000774         077700     MOVE  "02030402" TO CORRECT-A.                               NC2534.2 301
   000775         077800 SUB-WRITE-F3-8.                                                  NC2534.2
   000776         077900     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000777         078000*                                                                 NC2534.2
   000778         078100 SUB-INIT-F3-9.                                                   NC2534.2
   000779         078200*    ===-->  NO SIZE ERROR  <--===                                NC2534.2
   000780         078300     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   000781         078400     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   000782         078500     MOVE    0      TO REC-CT.                                    NC2534.2 323
   000783         078600     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   000784         078700     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   000785         078800     MOVE    6.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   000786         078900     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   000787         079000     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   000788         079100     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   000789         079200 SUB-TEST-F3-9-0.                                                 NC2534.2
   000790         079300     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   000791         079400             ON SIZE ERROR                                        NC2534.2
   000792      1  079500             MOVE   "G" TO WRK-AN-00001.                          NC2534.2 51
   000793         079600*                                                                 NC2534.2
   000794         079700 SUB-INIT-F3-9-1.                                                 NC2534.2
   000795         079800     MOVE   "SUB-TEST-F3-9-1" TO PAR-NAME.                        NC2534.2 276
   000796         079900     ADD     1 TO REC-CT.                                         NC2534.2 323
   000797         080000 SUB-TEST-F3-9-1.                                                 NC2534.2
   000798         080100     IF      WRK-AN-00001    NOT = SPACE                          NC2534.2 51 IMP
   000799      1  080200             GO TO SUB-FAIL-F3-9-1.                               NC2534.2 805
   000800         080300     PERFORM PASS                                                 NC2534.2 426
   000801         080400     GO TO SUB-WRITE-F3-9-1.                                      NC2534.2 811
   000802         080500 SUB-DELETE-F3-9-1.                                               NC2534.2
   000803         080600     PERFORM DE-LETE.                                             NC2534.2 428
   000804         080700     GO TO SUB-WRITE-F3-9-1.                                      NC2534.2 811
   000805         080800 SUB-FAIL-F3-9-1.                                                 NC2534.2
   000806         080900     MOVE   "SUBTRACT CORRESPONDING FAILED"                       NC2534.2
   000807         081000          TO RE-MARK                                              NC2534.2 281
   000808         081100     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   000809         081200     MOVE    SPACE TO CORRECT-X                                   NC2534.2 IMP 300
   000810         081300     PERFORM FAIL.                                                NC2534.2 427
   000811         081400 SUB-WRITE-F3-9-1.                                                NC2534.2
   000812         081500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000813         081600*                                                                 NC2534.2
   000814         081700 SUB-INIT-F3-9-2.                                                 NC2534.2
   000815         081800     MOVE  "SUB-TEST-F3-9-2" TO PAR-NAME.                         NC2534.2 276
   000816         081900     ADD    1 TO REC-CT.                                          NC2534.2 323
   000817         082000 SUB-TEST-F3-9-2.                                                 NC2534.2
   000818         082100     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   000819      1  082200            GO TO SUB-FAIL-F3-9-2.                                NC2534.2 825
   000820         082300     PERFORM PASS                                                 NC2534.2 426
   000821         082400     GO TO SUB-WRITE-F3-9-2.                                      NC2534.2 831
   000822         082500 SUB-DELETE-F3-9-2.                                               NC2534.2
   000823         082600     PERFORM DE-LETE.                                             NC2534.2 428
   000824         082700     GO TO SUB-WRITE-F3-9-2.                                      NC2534.2 831
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000825         082800 SUB-FAIL-F3-9-2.                                                 NC2534.2
   000826         082900     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   000827         083000     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   000828         083100     MOVE "SUBTRACT CORRESPONDING FAILED"                         NC2534.2
   000829         083200           TO RE-MARK                                             NC2534.2 281
   000830         083300     PERFORM FAIL.                                                NC2534.2 427
   000831         083400 SUB-WRITE-F3-9-2.                                                NC2534.2
   000832         083500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000833         083600*                                                                 NC2534.2
   000834         083700 SUB-INIT-F3-9-3.                                                 NC2534.2
   000835         083800     MOVE  "SUB-TEST-F3-9-3" TO PAR-NAME.                         NC2534.2 276
   000836         083900     ADD    1 TO REC-CT.                                          NC2534.2 323
   000837         084000 SUB-TEST-F3-9-3.                                                 NC2534.2
   000838         084100     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   000839      1  084200            GO TO SUB-FAIL-F3-9-3.                                NC2534.2 845
   000840         084300     PERFORM PASS                                                 NC2534.2 426
   000841         084400     GO TO SUB-WRITE-F3-9-3.                                      NC2534.2 851
   000842         084500 SUB-DELETE-F3-9-3.                                               NC2534.2
   000843         084600     PERFORM DE-LETE.                                             NC2534.2 428
   000844         084700     GO TO SUB-WRITE-F3-9-3.                                      NC2534.2 851
   000845         084800 SUB-FAIL-F3-9-3.                                                 NC2534.2
   000846         084900     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   000847         085000     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   000848         085100     MOVE "SUBTRACT CORRESPONDING FAILED"                         NC2534.2
   000849         085200          TO RE-MARK                                              NC2534.2 281
   000850         085300     PERFORM FAIL.                                                NC2534.2 427
   000851         085400 SUB-WRITE-F3-9-3.                                                NC2534.2
   000852         085500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000853         085600*                                                                 NC2534.2
   000854         085700 SUB-INIT-F3-9-4.                                                 NC2534.2
   000855         085800     MOVE  "SUB-TEST-F3-9-4" TO PAR-NAME.                         NC2534.2 276
   000856         085900     ADD    1 TO REC-CT.                                          NC2534.2 323
   000857         086000 SUB-TEST-F3-9-4.                                                 NC2534.2
   000858         086100     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO -5.76               NC2534.2 178 175
   000859      1  086200            GO TO SUB-FAIL-F3-9-4.                                NC2534.2 865
   000860         086300     PERFORM PASS                                                 NC2534.2 426
   000861         086400     GO TO SUB-WRITE-F3-9-4.                                      NC2534.2 871
   000862         086500 SUB-DELETE-F3-9-4.                                               NC2534.2
   000863         086600     PERFORM DE-LETE.                                             NC2534.2 428
   000864         086700     GO TO SUB-WRITE-F3-9-4.                                      NC2534.2 871
   000865         086800 SUB-FAIL-F3-9-4.                                                 NC2534.2
   000866         086900     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   000867         087000     MOVE   "-5.76" TO CORRECT-A                                  NC2534.2 301
   000868         087100     MOVE "SUBRACT CORRESPONDING FAILED"                          NC2534.2
   000869         087200          TO RE-MARK                                              NC2534.2 281
   000870         087300     PERFORM FAIL.                                                NC2534.2 427
   000871         087400 SUB-WRITE-F3-9-4.                                                NC2534.2
   000872         087500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000873         087600*                                                                 NC2534.2
   000874         087700 SUB-INIT-F3-10.                                                  NC2534.2
   000875         087800*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   000876         087900*    ===-->      SIZE ERROR        <--===                         NC2534.2
   000877         088000     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   000878         088100     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   000879         088200     MOVE    0      TO REC-CT.                                    NC2534.2 323
   000880         088300     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   000881         088400     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000882         088500     MOVE   76.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   000883         088600     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   000884         088700     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   000885         088800     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   000886         088900 SUB-TEST-F3-10-0.                                                NC2534.2
   000887         089000     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   000888         089100         NOT ON SIZE ERROR                                        NC2534.2
   000889      1  089200             MOVE   "G" TO WRK-AN-00001.                          NC2534.2 51
   000890         089300*                                                                 NC2534.2
   000891         089400 SUB-INIT-F3-10-1.                                                NC2534.2
   000892         089500     MOVE   "SUB-TEST-F3-10-1" TO PAR-NAME.                       NC2534.2 276
   000893         089600     ADD     1 TO REC-CT.                                         NC2534.2 323
   000894         089700 SUB-TEST-F3-10-1.                                                NC2534.2
   000895         089800     IF      WRK-AN-00001 EQUAL TO "G"                            NC2534.2 51
   000896      1  089900             GO TO SUB-FAIL-F3-10-1.                              NC2534.2 902
   000897         090000     PERFORM PASS                                                 NC2534.2 426
   000898         090100     GO TO SUB-WRITE-F3-10-1.                                     NC2534.2 908
   000899         090200 SUB-DELETE-F3-10-1.                                              NC2534.2
   000900         090300     PERFORM DE-LETE.                                             NC2534.2 428
   000901         090400     GO TO SUB-WRITE-F3-10-1.                                     NC2534.2 908
   000902         090500 SUB-FAIL-F3-10-1.                                                NC2534.2
   000903         090600     MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"            NC2534.2
   000904         090700          TO RE-MARK                                              NC2534.2 281
   000905         090800     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   000906         090900     MOVE    SPACE TO CORRECT-X                                   NC2534.2 IMP 300
   000907         091000     PERFORM FAIL.                                                NC2534.2 427
   000908         091100 SUB-WRITE-F3-10-1.                                               NC2534.2
   000909         091200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000910         091300*                                                                 NC2534.2
   000911         091400 SUB-INIT-F3-10-2.                                                NC2534.2
   000912         091500     MOVE  "SUB-TEST-F3-10-2" TO PAR-NAME.                        NC2534.2 276
   000913         091600     ADD    1 TO REC-CT.                                          NC2534.2 323
   000914         091700 SUB-TEST-F3-10-2.                                                NC2534.2
   000915         091800     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   000916      1  091900            GO TO SUB-FAIL-F3-10-2.                               NC2534.2 922
   000917         092000     PERFORM PASS                                                 NC2534.2 426
   000918         092100     GO TO SUB-WRITE-F3-10-2.                                     NC2534.2 928
   000919         092200 SUB-DELETE-F3-10-2.                                              NC2534.2
   000920         092300     PERFORM DE-LETE.                                             NC2534.2 428
   000921         092400     GO TO SUB-WRITE-F3-10-2.                                     NC2534.2 928
   000922         092500 SUB-FAIL-F3-10-2.                                                NC2534.2
   000923         092600     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   000924         092700     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   000925         092800     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   000926         092900          TO RE-MARK                                              NC2534.2 281
   000927         093000     PERFORM FAIL.                                                NC2534.2 427
   000928         093100 SUB-WRITE-F3-10-2.                                               NC2534.2
   000929         093200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000930         093300*                                                                 NC2534.2
   000931         093400 SUB-INIT-F3-10-3.                                                NC2534.2
   000932         093500     MOVE  "SUB-TEST-F3-10-3" TO PAR-NAME.                        NC2534.2 276
   000933         093600     ADD    1 TO REC-CT.                                          NC2534.2 323
   000934         093700 SUB-TEST-F3-10-3.                                                NC2534.2
   000935         093800     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   000936      1  093900            GO TO SUB-FAIL-F3-10-3.                               NC2534.2 942
   000937         094000     PERFORM PASS                                                 NC2534.2 426
   000938         094100     GO TO SUB-WRITE-F3-10-3.                                     NC2534.2 948
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000939         094200 SUB-DELETE-F3-10-3.                                              NC2534.2
   000940         094300     PERFORM DE-LETE.                                             NC2534.2 428
   000941         094400     GO TO SUB-WRITE-F3-10-3.                                     NC2534.2 948
   000942         094500 SUB-FAIL-F3-10-3.                                                NC2534.2
   000943         094600     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   000944         094700     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   000945         094800     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   000946         094900          TO RE-MARK                                              NC2534.2 281
   000947         095000     PERFORM FAIL.                                                NC2534.2 427
   000948         095100 SUB-WRITE-F3-10-3.                                               NC2534.2
   000949         095200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000950         095300*                                                                 NC2534.2
   000951         095400 SUB-INIT-F3-10-4.                                                NC2534.2
   000952         095500     MOVE  "SUB-TEST-F3-10-4" TO PAR-NAME.                        NC2534.2 276
   000953         095600     ADD    1 TO REC-CT.                                          NC2534.2 323
   000954         095700 SUB-TEST-F3-10-4.                                                NC2534.2
   000955         095800     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 178 175
   000956      1  095900            GO TO SUB-FAIL-F3-10-4.                               NC2534.2 962
   000957         096000     PERFORM PASS                                                 NC2534.2 426
   000958         096100     GO TO SUB-WRITE-F3-10-4.                                     NC2534.2 967
   000959         096200 SUB-DELETE-F3-10-4.                                              NC2534.2
   000960         096300     PERFORM DE-LETE.                                             NC2534.2 428
   000961         096400     GO TO SUB-WRITE-F3-10-4.                                     NC2534.2 967
   000962         096500 SUB-FAIL-F3-10-4.                                                NC2534.2
   000963         096600     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   000964         096700     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   000965         096800     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK             NC2534.2 281
   000966         096900     PERFORM FAIL.                                                NC2534.2 427
   000967         097000 SUB-WRITE-F3-10-4.                                               NC2534.2
   000968         097100     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   000969         097200*                                                                 NC2534.2
   000970         097300 SUB-INIT-F3-11.                                                  NC2534.2
   000971         097400*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   000972         097500*    ===-->   NO SIZE ERROR        <--===                         NC2534.2
   000973         097600     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   000974         097700     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   000975         097800     MOVE    0      TO REC-CT.                                    NC2534.2 323
   000976         097900     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   000977         098000     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   000978         098100     MOVE    6.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   000979         098200     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   000980         098300     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   000981         098400     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   000982         098500 SUB-TEST-F3-11-0.                                                NC2534.2
   000983         098600     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   000984         098700         NOT ON SIZE ERROR                                        NC2534.2
   000985      1  098800             MOVE   "G" TO WRK-AN-00001.                          NC2534.2 51
   000986         098900*                                                                 NC2534.2
   000987         099000 SUB-INIT-F3-11-1.                                                NC2534.2
   000988         099100     MOVE   "SUB-TEST-F3-11-1" TO PAR-NAME.                       NC2534.2 276
   000989         099200     ADD     1 TO REC-CT.                                         NC2534.2 323
   000990         099300 SUB-TEST-F3-11-1.                                                NC2534.2
   000991         099400     IF      WRK-AN-00001 EQUAL TO SPACE                          NC2534.2 51 IMP
   000992      1  099500             GO TO SUB-FAIL-F3-11-1.                              NC2534.2 998
   000993         099600     PERFORM PASS                                                 NC2534.2 426
   000994         099700     GO TO SUB-WRITE-F3-11-1.                                     NC2534.2 1004
   000995         099800 SUB-DELETE-F3-11-1.                                              NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000996         099900     PERFORM DE-LETE.                                             NC2534.2 428
   000997         100000     GO TO SUB-WRITE-F3-11-1.                                     NC2534.2 1004
   000998         100100 SUB-FAIL-F3-11-1.                                                NC2534.2
   000999         100200     MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"                NC2534.2
   001000         100300           TO RE-MARK                                             NC2534.2 281
   001001         100400     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001002         100500     MOVE   "G"    TO CORRECT-X                                   NC2534.2 300
   001003         100600     PERFORM FAIL.                                                NC2534.2 427
   001004         100700 SUB-WRITE-F3-11-1.                                               NC2534.2
   001005         100800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001006         100900*                                                                 NC2534.2
   001007         101000 SUB-INIT-F3-11-2.                                                NC2534.2
   001008         101100     MOVE  "SUB-TEST-F3-11-1" TO PAR-NAME.                        NC2534.2 276
   001009         101200     ADD    1 TO REC-CT.                                          NC2534.2 323
   001010         101300 SUB-TEST-F3-11-2.                                                NC2534.2
   001011         101400     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001012      1  101500            GO TO SUB-FAIL-F3-11-2.                               NC2534.2 1018
   001013         101600     PERFORM PASS                                                 NC2534.2 426
   001014         101700     GO TO SUB-WRITE-F3-11-2.                                     NC2534.2 1024
   001015         101800 SUB-DELETE-F3-11-2.                                              NC2534.2
   001016         101900     PERFORM DE-LETE.                                             NC2534.2 428
   001017         102000     GO TO SUB-WRITE-F3-11-2.                                     NC2534.2 1024
   001018         102100 SUB-FAIL-F3-11-2.                                                NC2534.2
   001019         102200     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001020         102300     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001021         102400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001022         102500          TO RE-MARK                                              NC2534.2 281
   001023         102600     PERFORM FAIL.                                                NC2534.2 427
   001024         102700 SUB-WRITE-F3-11-2.                                               NC2534.2
   001025         102800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001026         102900*                                                                 NC2534.2
   001027         103000 SUB-INIT-F3-11-3.                                                NC2534.2
   001028         103100     MOVE  "SUB-TEST-F3-11-3" TO PAR-NAME.                        NC2534.2 276
   001029         103200     ADD    1 TO REC-CT.                                          NC2534.2 323
   001030         103300 SUB-TEST-F3-11-3.                                                NC2534.2
   001031         103400     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001032      1  103500            GO TO SUB-FAIL-F3-11-3.                               NC2534.2 1038
   001033         103600     PERFORM PASS                                                 NC2534.2 426
   001034         103700     GO TO SUB-WRITE-F3-11-3.                                     NC2534.2 1044
   001035         103800 SUB-DELETE-F3-11-3.                                              NC2534.2
   001036         103900     PERFORM DE-LETE.                                             NC2534.2 428
   001037         104000     GO TO SUB-WRITE-F3-11-3.                                     NC2534.2 1044
   001038         104100 SUB-FAIL-F3-11-3.                                                NC2534.2
   001039         104200     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001040         104300     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001041         104400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001042         104500          TO RE-MARK                                              NC2534.2 281
   001043         104600     PERFORM FAIL.                                                NC2534.2 427
   001044         104700 SUB-WRITE-F3-11-3.                                               NC2534.2
   001045         104800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001046         104900*                                                                 NC2534.2
   001047         105000 SUB-INIT-F3-11-4.                                                NC2534.2
   001048         105100     MOVE  "SUB-TEST-F3-11-4" TO PAR-NAME.                        NC2534.2 276
   001049         105200     ADD    1 TO REC-CT.                                          NC2534.2 323
   001050         105300 SUB-TEST-F3-11-4.                                                NC2534.2
   001051         105400     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO -5.76               NC2534.2 178 175
   001052      1  105500            GO TO SUB-FAIL-F3-11-4.                               NC2534.2 1058
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001053         105600     PERFORM PASS                                                 NC2534.2 426
   001054         105700     GO TO SUB-WRITE-F3-11-4.                                     NC2534.2 1064
   001055         105800 SUB-DELETE-F3-11-4.                                              NC2534.2
   001056         105900     PERFORM DE-LETE.                                             NC2534.2 428
   001057         106000     GO TO SUB-WRITE-F3-11-4.                                     NC2534.2 1064
   001058         106100 SUB-FAIL-F3-11-4.                                                NC2534.2
   001059         106200     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001060         106300     MOVE   "-5.76" TO CORRECT-A                                  NC2534.2 301
   001061         106400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001062         106500          TO RE-MARK                                              NC2534.2 281
   001063         106600     PERFORM FAIL.                                                NC2534.2 427
   001064         106700 SUB-WRITE-F3-11-4.                                               NC2534.2
   001065         106800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001066         106900*                                                                 NC2534.2
   001067         107000 SUB-INIT-F3-12.                                                  NC2534.2
   001068         107100*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   001069         107200*    ===-->      SIZE ERROR        <--===                         NC2534.2
   001070         107300     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001071         107400     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001072         107500     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001073         107600     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   001074         107700     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001075         107800     MOVE   76.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001076         107900     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001077         108000     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001078         108100     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001079         108200 SUB-TEST-F3-12-0.                                                NC2534.2
   001080         108300     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001081         108400             ON SIZE ERROR                                        NC2534.2
   001082      1  108500             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001083         108600         NOT ON SIZE ERROR                                        NC2534.2
   001084      1  108700             MOVE   "B" TO WRK-AN-00001.                          NC2534.2 51
   001085         108800*                                                                 NC2534.2
   001086         108900 SUB-INIT-F3-12-1.                                                NC2534.2
   001087         109000     MOVE   "SUB-TEST-F3-12-1" TO PAR-NAME.                       NC2534.2 276
   001088         109100     ADD     1 TO REC-CT.                                         NC2534.2 323
   001089         109200 SUB-TEST-F3-12-1.                                                NC2534.2
   001090         109300     IF      WRK-AN-00001    NOT = "A"                            NC2534.2 51
   001091      1  109400             GO TO SUB-FAIL-F3-12-1.                              NC2534.2 1097
   001092         109500     PERFORM PASS                                                 NC2534.2 426
   001093         109600     GO TO SUB-WRITE-F3-12-1.                                     NC2534.2 1103
   001094         109700 SUB-DELETE-F3-12-1.                                              NC2534.2
   001095         109800     PERFORM DE-LETE.                                             NC2534.2 428
   001096         109900     GO TO SUB-WRITE-F3-12-1.                                     NC2534.2 1103
   001097         110000 SUB-FAIL-F3-12-1.                                                NC2534.2
   001098         110100     MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"                    NC2534.2
   001099         110200          TO RE-MARK                                              NC2534.2 281
   001100         110300     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001101         110400     MOVE   "A"    TO CORRECT-X                                   NC2534.2 300
   001102         110500     PERFORM FAIL.                                                NC2534.2 427
   001103         110600 SUB-WRITE-F3-12-1.                                               NC2534.2
   001104         110700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001105         110800*                                                                 NC2534.2
   001106         110900 SUB-INIT-F3-12-2.                                                NC2534.2
   001107         111000     MOVE  "SUB-TEST-F3-12-2" TO PAR-NAME.                        NC2534.2 276
   001108         111100     ADD    1 TO REC-CT.                                          NC2534.2 323
   001109         111200 SUB-TEST-F3-12-2.                                                NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001110         111300     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001111      1  111400            GO TO SUB-FAIL-F3-12-2.                               NC2534.2 1117
   001112         111500     PERFORM PASS                                                 NC2534.2 426
   001113         111600     GO TO SUB-WRITE-F3-12-2.                                     NC2534.2 1123
   001114         111700 SUB-DELETE-F3-12-2.                                              NC2534.2
   001115         111800     PERFORM DE-LETE.                                             NC2534.2 428
   001116         111900     GO TO SUB-WRITE-F3-12-2.                                     NC2534.2 1123
   001117         112000 SUB-FAIL-F3-12-2.                                                NC2534.2
   001118         112100     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001119         112200     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001120         112300     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001121         112400          TO RE-MARK                                              NC2534.2 281
   001122         112500     PERFORM FAIL.                                                NC2534.2 427
   001123         112600 SUB-WRITE-F3-12-2.                                               NC2534.2
   001124         112700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001125         112800*                                                                 NC2534.2
   001126         112900 SUB-INIT-F3-12-3.                                                NC2534.2
   001127         113000     MOVE  "SUB-TEST-F3-12-3" TO PAR-NAME.                        NC2534.2 276
   001128         113100     ADD    1 TO REC-CT.                                          NC2534.2 323
   001129         113200 SUB-TEST-F3-12-3.                                                NC2534.2
   001130         113300     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001131      1  113400            GO TO SUB-FAIL-F3-12-3.                               NC2534.2 1137
   001132         113500     PERFORM PASS                                                 NC2534.2 426
   001133         113600     GO TO SUB-WRITE-F3-12-3.                                     NC2534.2 1143
   001134         113700 SUB-DELETE-F3-12-3.                                              NC2534.2
   001135         113800     PERFORM DE-LETE.                                             NC2534.2 428
   001136         113900     GO TO SUB-WRITE-F3-12-3.                                     NC2534.2 1143
   001137         114000 SUB-FAIL-F3-12-3.                                                NC2534.2
   001138         114100     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001139         114200     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001140         114300     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001141         114400          TO RE-MARK                                              NC2534.2 281
   001142         114500     PERFORM FAIL.                                                NC2534.2 427
   001143         114600 SUB-WRITE-F3-12-3.                                               NC2534.2
   001144         114700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001145         114800*                                                                 NC2534.2
   001146         114900 SUB-INIT-F3-12-4.                                                NC2534.2
   001147         115000     MOVE  "SUB-TEST-F3-12-4" TO PAR-NAME.                        NC2534.2 276
   001148         115100     ADD    1 TO REC-CT.                                          NC2534.2 323
   001149         115200 SUB-TEST-F3-12-4.                                                NC2534.2
   001150         115300     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 178 175
   001151      1  115400            GO TO SUB-FAIL-F3-12-4.                               NC2534.2 1157
   001152         115500     PERFORM PASS                                                 NC2534.2 426
   001153         115600     GO TO SUB-WRITE-F3-12-4.                                     NC2534.2 1162
   001154         115700 SUB-DELETE-F3-12-4.                                              NC2534.2
   001155         115800     PERFORM DE-LETE.                                             NC2534.2 428
   001156         115900     GO TO SUB-WRITE-F3-12-4.                                     NC2534.2 1162
   001157         116000 SUB-FAIL-F3-12-4.                                                NC2534.2
   001158         116100     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001159         116200     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001160         116300     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK             NC2534.2 281
   001161         116400     PERFORM FAIL.                                                NC2534.2 427
   001162         116500 SUB-WRITE-F3-12-4.                                               NC2534.2
   001163         116600     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001164         116700*                                                                 NC2534.2
   001165         116800 SUB-INIT-F3-13.                                                  NC2534.2
   001166         116900*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001167         117000*    ===-->   NO SIZE ERROR        <--===                         NC2534.2
   001168         117100     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001169         117200     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001170         117300     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001171         117400     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   001172         117500     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001173         117600     MOVE    6.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001174         117700     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001175         117800     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001176         117900     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001177         118000 SUB-TEST-F3-13-0.                                                NC2534.2
   001178         118100     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001179         118200             ON SIZE ERROR                                        NC2534.2
   001180      1  118300             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001181         118400         NOT ON SIZE ERROR                                        NC2534.2
   001182      1  118500             MOVE   "B" TO WRK-AN-00001.                          NC2534.2 51
   001183         118600*                                                                 NC2534.2
   001184         118700 SUB-INIT-F3-13-1.                                                NC2534.2
   001185         118800     MOVE   "SUB-TEST-F3-13-1" TO PAR-NAME.                       NC2534.2 276
   001186         118900     ADD     1 TO REC-CT.                                         NC2534.2 323
   001187         119000 SUB-TEST-F3-13-1.                                                NC2534.2
   001188         119100     IF      WRK-AN-00001    NOT = "B"                            NC2534.2 51
   001189      1  119200             GO TO SUB-FAIL-F3-13-1.                              NC2534.2 1195
   001190         119300     PERFORM PASS                                                 NC2534.2 426
   001191         119400     GO TO SUB-WRITE-F3-13-1.                                     NC2534.2 1201
   001192         119500 SUB-DELETE-F3-13-1.                                              NC2534.2
   001193         119600     PERFORM DE-LETE.                                             NC2534.2 428
   001194         119700     GO TO SUB-WRITE-F3-13-1.                                     NC2534.2 1201
   001195         119800 SUB-FAIL-F3-13-1.                                                NC2534.2
   001196         119900     MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"                NC2534.2
   001197         120000           TO RE-MARK                                             NC2534.2 281
   001198         120100     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001199         120200     MOVE   "B"    TO CORRECT-X                                   NC2534.2 300
   001200         120300     PERFORM FAIL.                                                NC2534.2 427
   001201         120400 SUB-WRITE-F3-13-1.                                               NC2534.2
   001202         120500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001203         120600*                                                                 NC2534.2
   001204         120700 SUB-INIT-F3-13-2.                                                NC2534.2
   001205         120800     MOVE  "SUB-TEST-F3-13-2" TO PAR-NAME.                        NC2534.2 276
   001206         120900     ADD    1 TO REC-CT.                                          NC2534.2 323
   001207         121000 SUB-TEST-F3-13-2.                                                NC2534.2
   001208         121100     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001209      1  121200            GO TO SUB-FAIL-F3-13-2.                               NC2534.2 1215
   001210         121300     PERFORM PASS                                                 NC2534.2 426
   001211         121400     GO TO SUB-WRITE-F3-13-2.                                     NC2534.2 1221
   001212         121500 SUB-DELETE-F3-13-2.                                              NC2534.2
   001213         121600     PERFORM DE-LETE.                                             NC2534.2 428
   001214         121700     GO TO SUB-WRITE-F3-13-2.                                     NC2534.2 1221
   001215         121800 SUB-FAIL-F3-13-2.                                                NC2534.2
   001216         121900            MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N            NC2534.2 176 175 288
   001217         122000            MOVE   "+1" TO CORRECT-A                              NC2534.2 301
   001218         122100            MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"NC2534.2
   001219         122200                 TO RE-MARK                                       NC2534.2 281
   001220         122300            PERFORM FAIL.                                         NC2534.2 427
   001221         122400 SUB-WRITE-F3-13-2.                                               NC2534.2
   001222         122500            PERFORM PRINT-DETAIL.                                 NC2534.2 430
   001223         122600*                                                                 NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001224         122700 SUB-INIT-F3-13-3.                                                NC2534.2
   001225         122800     MOVE  "SUB-TEST-F3-13-3" TO PAR-NAME.                        NC2534.2 276
   001226         122900     ADD    1 TO REC-CT.                                          NC2534.2 323
   001227         123000 SUB-TEST-F3-13-3.                                                NC2534.2
   001228         123100     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001229      1  123200            GO TO SUB-FAIL-F3-13-3.                               NC2534.2 1235
   001230         123300     PERFORM PASS                                                 NC2534.2 426
   001231         123400     GO TO SUB-WRITE-F3-13-3.                                     NC2534.2 1241
   001232         123500 SUB-DELETE-F3-13-3.                                              NC2534.2
   001233         123600     PERFORM DE-LETE.                                             NC2534.2 428
   001234         123700     GO TO SUB-WRITE-F3-13-3.                                     NC2534.2 1241
   001235         123800 SUB-FAIL-F3-13-3.                                                NC2534.2
   001236         123900     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001237         124000     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001238         124100     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001239         124200          TO RE-MARK                                              NC2534.2 281
   001240         124300     PERFORM FAIL.                                                NC2534.2 427
   001241         124400 SUB-WRITE-F3-13-3.                                               NC2534.2
   001242         124500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001243         124600*                                                                 NC2534.2
   001244         124700 SUB-INIT-F3-13-4.                                                NC2534.2
   001245         124800     MOVE  "SUB-TEST-F3-13-4" TO PAR-NAME.                        NC2534.2 276
   001246         124900     ADD    1 TO REC-CT.                                          NC2534.2 323
   001247         125000 SUB-TEST-F3-13-4.                                                NC2534.2
   001248         125100     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO -5.76               NC2534.2 178 175
   001249      1  125200            GO TO SUB-FAIL-F3-13-4.                               NC2534.2 1252
   001250         125300     PERFORM PASS                                                 NC2534.2 426
   001251         125400     GO TO SUB-WRITE-F3-13-4.                                     NC2534.2 1258
   001252         125500 SUB-FAIL-F3-13-4.                                                NC2534.2
   001253         125600     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001254         125700     MOVE   "-5.76" TO CORRECT-A                                  NC2534.2 301
   001255         125800     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001256         125900        TO RE-MARK                                                NC2534.2 281
   001257         126000     PERFORM FAIL.                                                NC2534.2 427
   001258         126100 SUB-WRITE-F3-13-4.                                               NC2534.2
   001259         126200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001260         126300*                                                                 NC2534.2
   001261         126400 SUB-INIT-F3-14.                                                  NC2534.2
   001262         126500*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   001263         126600*    ===-->      SIZE ERROR        <--===                         NC2534.2
   001264         126700     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001265         126800     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001266         126900     MOVE    SPACE  TO WRK-XN-00001.                              NC2534.2 IMP 52
   001267         127000     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001268         127100     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   001269         127200     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001270         127300     MOVE   76.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001271         127400     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001272         127500     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001273         127600     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001274         127700 SUB-TEST-F3-14-0.                                                NC2534.2
   001275         127800     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001276         127900             ON SIZE ERROR                                        NC2534.2
   001277      1  128000             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001278         128100     END-SUBTRACT                                                 NC2534.2
   001279         128200     MOVE   "Z"  TO WRK-XN-00001.                                 NC2534.2 52
   001280         128300*                                                                 NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001281         128400 SUB-INIT-F3-14-1.                                                NC2534.2
   001282         128500     MOVE   "SUB-TEST-F3-14-1" TO PAR-NAME.                       NC2534.2 276
   001283         128600     ADD     1 TO REC-CT.                                         NC2534.2 323
   001284         128700 SUB-TEST-F3-14-1.                                                NC2534.2
   001285         128800     IF      WRK-AN-00001    NOT = "A"                            NC2534.2 51
   001286      1  128900             GO TO SUB-FAIL-F3-14-1.                              NC2534.2 1292
   001287         129000     PERFORM PASS                                                 NC2534.2 426
   001288         129100     GO TO SUB-WRITE-F3-14-1.                                     NC2534.2 1298
   001289         129200 SUB-DELETE-F3-14-1.                                              NC2534.2
   001290         129300     PERFORM DE-LETE.                                             NC2534.2 428
   001291         129400     GO TO SUB-WRITE-F3-14-1.                                     NC2534.2 1298
   001292         129500 SUB-FAIL-F3-14-1.                                                NC2534.2
   001293         129600     MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"                    NC2534.2
   001294         129700          TO RE-MARK                                              NC2534.2 281
   001295         129800     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001296         129900     MOVE   "A"    TO CORRECT-X                                   NC2534.2 300
   001297         130000     PERFORM FAIL.                                                NC2534.2 427
   001298         130100 SUB-WRITE-F3-14-1.                                               NC2534.2
   001299         130200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001300         130300*                                                                 NC2534.2
   001301         130400 SUB-INIT-F3-14-2.                                                NC2534.2
   001302         130500     MOVE  "SUB-TEST-F3-14-2" TO PAR-NAME.                        NC2534.2 276
   001303         130600     ADD    1 TO REC-CT.                                          NC2534.2 323
   001304         130700 SUB-TEST-F3-14-2.                                                NC2534.2
   001305         130800     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001306      1  130900            GO TO SUB-FAIL-F3-14-2.                               NC2534.2 1312
   001307         131000     PERFORM PASS                                                 NC2534.2 426
   001308         131100     GO TO SUB-WRITE-F3-14-2.                                     NC2534.2 1318
   001309         131200 SUB-DELETE-F3-14-2.                                              NC2534.2
   001310         131300     PERFORM DE-LETE.                                             NC2534.2 428
   001311         131400     GO TO SUB-WRITE-F3-14-2.                                     NC2534.2 1318
   001312         131500 SUB-FAIL-F3-14-2.                                                NC2534.2
   001313         131600     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001314         131700     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001315         131800     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001316         131900          TO RE-MARK                                              NC2534.2 281
   001317         132000     PERFORM FAIL.                                                NC2534.2 427
   001318         132100 SUB-WRITE-F3-14-2.                                               NC2534.2
   001319         132200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001320         132300*                                                                 NC2534.2
   001321         132400 SUB-INIT-F3-14-3.                                                NC2534.2
   001322         132500     MOVE  "SUB-TEST-F3-14-3" TO PAR-NAME.                        NC2534.2 276
   001323         132600     ADD    1 TO REC-CT.                                          NC2534.2 323
   001324         132700 SUB-TEST-F3-14-3.                                                NC2534.2
   001325         132800     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001326      1  132900            GO TO SUB-FAIL-F3-14-3.                               NC2534.2 1332
   001327         133000     PERFORM PASS                                                 NC2534.2 426
   001328         133100     GO TO SUB-WRITE-F3-14-3.                                     NC2534.2 1338
   001329         133200 SUB-DELETE-F3-14-3.                                              NC2534.2
   001330         133300     PERFORM DE-LETE.                                             NC2534.2 428
   001331         133400     GO TO SUB-WRITE-F3-14-3.                                     NC2534.2 1338
   001332         133500 SUB-FAIL-F3-14-3.                                                NC2534.2
   001333         133600     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001334         133700     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001335         133800     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001336         133900          TO RE-MARK                                              NC2534.2 281
   001337         134000     PERFORM FAIL.                                                NC2534.2 427
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001338         134100 SUB-WRITE-F3-14-3.                                               NC2534.2
   001339         134200     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001340         134300*                                                                 NC2534.2
   001341         134400 SUB-INIT-F3-14-4.                                                NC2534.2
   001342         134500     MOVE  "SUB-TEST-F3-14-4" TO PAR-NAME.                        NC2534.2 276
   001343         134600     ADD     1 TO REC-CT.                                         NC2534.2 323
   001344         134700 SUB-TEST-F3-14-4.                                                NC2534.2
   001345         134800     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 178 175
   001346      1  134900            GO TO SUB-FAIL-F3-14-4.                               NC2534.2 1352
   001347         135000     PERFORM PASS                                                 NC2534.2 426
   001348         135100     GO TO SUB-WRITE-F3-14-4.                                     NC2534.2 1357
   001349         135200 SUB-DELETE-F3-14-4.                                              NC2534.2
   001350         135300     PERFORM DE-LETE.                                             NC2534.2 428
   001351         135400     GO TO SUB-WRITE-F3-14-4.                                     NC2534.2 1357
   001352         135500 SUB-FAIL-F3-14-4.                                                NC2534.2
   001353         135600     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001354         135700     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001355         135800     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK           NC2534.2 281
   001356         135900     PERFORM FAIL.                                                NC2534.2 427
   001357         136000 SUB-WRITE-F3-14-4.                                               NC2534.2
   001358         136100     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001359         136200*                                                                 NC2534.2
   001360         136300 SUB-INIT-F3-14-5.                                                NC2534.2
   001361         136400     MOVE   "SUB-TEST-F3-14-5" TO PAR-NAME.                       NC2534.2 276
   001362         136500     ADD     1 TO REC-CT.                                         NC2534.2 323
   001363         136600 SUB-TEST-F3-14-5.                                                NC2534.2
   001364         136700     IF      WRK-XN-00001 NOT = "Z"                               NC2534.2 52
   001365      1  136800             GO TO SUB-FAIL-F3-14-5.                              NC2534.2 1371
   001366         136900     PERFORM PASS                                                 NC2534.2 426
   001367         137000     GO TO SUB-WRITE-F3-14-5.                                     NC2534.2 1376
   001368         137100 SUB-DELETE-F3-14-5.                                              NC2534.2
   001369         137200     PERFORM DE-LETE.                                             NC2534.2 428
   001370         137300     GO TO SUB-WRITE-F3-14-5.                                     NC2534.2 1376
   001371         137400 SUB-FAIL-F3-14-5.                                                NC2534.2
   001372         137500     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2534.2 281
   001373         137600     MOVE   "Z"   TO COMPUTED-X                                   NC2534.2 286
   001374         137700     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2534.2 51 300
   001375         137800     PERFORM FAIL.                                                NC2534.2 427
   001376         137900 SUB-WRITE-F3-14-5.                                               NC2534.2
   001377         138000     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001378         138100*                                                                 NC2534.2
   001379         138200 SUB-INIT-F3-15.                                                  NC2534.2
   001380         138300*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   001381         138400*    ===-->   NO SIZE ERROR        <--===                         NC2534.2
   001382         138500     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001383         138600     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001384         138700     MOVE    SPACE  TO WRK-XN-00001.                              NC2534.2 IMP 52
   001385         138800     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001386         138900     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   001387         139000     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001388         139100     MOVE    6.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001389         139200     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001390         139300     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001391         139400     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001392         139500 SUB-TEST-F3-15-0.                                                NC2534.2
   001393         139600     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001394         139700             ON SIZE ERROR                                        NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001395      1  139800             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001396         139900     END-SUBTRACT                                                 NC2534.2
   001397         140000     MOVE   "Z"  TO WRK-XN-00001.                                 NC2534.2 52
   001398         140100*                                                                 NC2534.2
   001399         140200 SUB-INIT-F3-15-1.                                                NC2534.2
   001400         140300     MOVE   "SUB-TEST-F3-15-1" TO PAR-NAME.                       NC2534.2 276
   001401         140400     ADD     1 TO REC-CT.                                         NC2534.2 323
   001402         140500 SUB-TEST-F3-15-1.                                                NC2534.2
   001403         140600     IF      WRK-AN-00001    = "A"                                NC2534.2 51
   001404      1  140700             GO TO SUB-FAIL-F3-15-1.                              NC2534.2 1407
   001405         140800     PERFORM PASS                                                 NC2534.2 426
   001406         140900     GO TO SUB-WRITE-F3-15-1.                                     NC2534.2 1413
   001407         141000 SUB-FAIL-F3-15-1.                                                NC2534.2
   001408         141100     MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"                NC2534.2
   001409         141200          TO RE-MARK                                              NC2534.2 281
   001410         141300     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001411         141400     MOVE    SPACE TO CORRECT-X                                   NC2534.2 IMP 300
   001412         141500     PERFORM FAIL.                                                NC2534.2 427
   001413         141600 SUB-WRITE-F3-15-1.                                               NC2534.2
   001414         141700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001415         141800*                                                                 NC2534.2
   001416         141900 SUB-INIT-F3-15-2.                                                NC2534.2
   001417         142000     MOVE  "SUB-TEST-F3-15-2" TO PAR-NAME.                        NC2534.2 276
   001418         142100     ADD    1 TO REC-CT.                                          NC2534.2 323
   001419         142200 SUB-TEST-F3-15-2.                                                NC2534.2
   001420         142300     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001421      1  142400            GO TO SUB-FAIL-F3-15-2.                               NC2534.2 1427
   001422         142500     PERFORM PASS                                                 NC2534.2 426
   001423         142600     GO TO SUB-WRITE-F3-15-2.                                     NC2534.2 1433
   001424         142700 SUB-DELETE-F3-15-2.                                              NC2534.2
   001425         142800     PERFORM DE-LETE.                                             NC2534.2 428
   001426         142900     GO TO SUB-WRITE-F3-15-2.                                     NC2534.2 1433
   001427         143000 SUB-FAIL-F3-15-2.                                                NC2534.2
   001428         143100     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001429         143200     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001430         143300     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001431         143400          TO RE-MARK                                              NC2534.2 281
   001432         143500     PERFORM FAIL.                                                NC2534.2 427
   001433         143600 SUB-WRITE-F3-15-2.                                               NC2534.2
   001434         143700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001435         143800*                                                                 NC2534.2
   001436         143900 SUB-INIT-F3-15-3.                                                NC2534.2
   001437         144000     MOVE  "SUB-TEST-F3-15-3" TO PAR-NAME.                        NC2534.2 276
   001438         144100     ADD    1 TO REC-CT.                                          NC2534.2 323
   001439         144200 SUB-TEST-F3-15-3.                                                NC2534.2
   001440         144300     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001441      1  144400            GO TO SUB-FAIL-F3-15-3.                               NC2534.2 1447
   001442         144500     PERFORM PASS                                                 NC2534.2 426
   001443         144600     GO TO SUB-WRITE-F3-15-3.                                     NC2534.2 1453
   001444         144700 SUB-DELETE-F3-15-3.                                              NC2534.2
   001445         144800     PERFORM DE-LETE.                                             NC2534.2 428
   001446         144900     GO TO SUB-WRITE-F3-15-3.                                     NC2534.2 1453
   001447         145000 SUB-FAIL-F3-15-3.                                                NC2534.2
   001448         145100     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001449         145200     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001450         145300     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001451         145400          TO RE-MARK                                              NC2534.2 281
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001452         145500     PERFORM FAIL.                                                NC2534.2 427
   001453         145600 SUB-WRITE-F3-15-3.                                               NC2534.2
   001454         145700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001455         145800*                                                                 NC2534.2
   001456         145900 SUB-INIT-F3-15-4.                                                NC2534.2
   001457         146000     MOVE  "SUB-TEST-F3-15-4" TO PAR-NAME.                        NC2534.2 276
   001458         146100     ADD     1 TO REC-CT.                                         NC2534.2 323
   001459         146200 SUB-TEST-F3-15-4.                                                NC2534.2
   001460         146300     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO -5.76               NC2534.2 178 175
   001461      1  146400            GO TO SUB-FAIL-F3-15-4.                               NC2534.2 1467
   001462         146500     PERFORM PASS                                                 NC2534.2 426
   001463         146600     GO TO SUB-WRITE-F3-15-4.                                     NC2534.2 1473
   001464         146700 SUB-DELETE-F3-15-4.                                              NC2534.2
   001465         146800     PERFORM DE-LETE.                                             NC2534.2 428
   001466         146900     GO TO SUB-WRITE-F3-15-4.                                     NC2534.2 1473
   001467         147000 SUB-FAIL-F3-15-4.                                                NC2534.2
   001468         147100     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001469         147200     MOVE   "-5.76" TO CORRECT-A                                  NC2534.2 301
   001470         147300     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001471         147400          TO RE-MARK                                              NC2534.2 281
   001472         147500     PERFORM FAIL.                                                NC2534.2 427
   001473         147600 SUB-WRITE-F3-15-4.                                               NC2534.2
   001474         147700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001475         147800*                                                                 NC2534.2
   001476         147900 SUB-INIT-F3-15-5.                                                NC2534.2
   001477         148000     MOVE   "SUB-TEST-F3-15-5" TO PAR-NAME.                       NC2534.2 276
   001478         148100     ADD     1 TO REC-CT.                                         NC2534.2 323
   001479         148200 SUB-TEST-F3-15-5.                                                NC2534.2
   001480         148300     IF      WRK-XN-00001 NOT = "Z"                               NC2534.2 52
   001481      1  148400             GO TO SUB-FAIL-F3-15-5.                              NC2534.2 1487
   001482         148500     PERFORM PASS                                                 NC2534.2 426
   001483         148600     GO TO SUB-WRITE-F3-15-5.                                     NC2534.2 1492
   001484         148700 SUB-DELETE-F3-15-5.                                              NC2534.2
   001485         148800     PERFORM DE-LETE.                                             NC2534.2 428
   001486         148900     GO TO SUB-WRITE-F3-15-5.                                     NC2534.2 1492
   001487         149000 SUB-FAIL-F3-15-5.                                                NC2534.2
   001488         149100     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2534.2 281
   001489         149200     MOVE   "Z"   TO COMPUTED-X                                   NC2534.2 286
   001490         149300     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2534.2 51 300
   001491         149400     PERFORM FAIL.                                                NC2534.2 427
   001492         149500 SUB-WRITE-F3-15-5.                                               NC2534.2
   001493         149600     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001494         149700*                                                                 NC2534.2
   001495         149800 SUB-INIT-F3-16.                                                  NC2534.2
   001496         149900*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   001497         150000*    ===-->      SIZE ERROR        <--===                         NC2534.2
   001498         150100     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001499         150200     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001500         150300     MOVE    SPACE  TO WRK-XN-00001.                              NC2534.2 IMP 52
   001501         150400     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001502         150500     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   001503         150600     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001504         150700     MOVE   76.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001505         150800     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001506         150900     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001507         151000     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001508         151100 SUB-TEST-F3-16-0.                                                NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001509         151200     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001510         151300             ON SIZE ERROR                                        NC2534.2
   001511      1  151400             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001512         151500         NOT ON SIZE ERROR                                        NC2534.2
   001513      1  151600             MOVE   "B" TO WRK-AN-00001                           NC2534.2 51
   001514         151700     END-SUBTRACT                                                 NC2534.2
   001515         151800     MOVE   "Z" TO WRK-XN-00001.                                  NC2534.2 52
   001516         151900*                                                                 NC2534.2
   001517         152000 SUB-INIT-F3-16-1.                                                NC2534.2
   001518         152100     MOVE   "SUB-TEST-F3-16-1" TO PAR-NAME.                       NC2534.2 276
   001519         152200     ADD     1 TO REC-CT.                                         NC2534.2 323
   001520         152300 SUB-TEST-F3-16-1.                                                NC2534.2
   001521         152400     IF      WRK-AN-00001    NOT = "A"                            NC2534.2 51
   001522      1  152500             GO TO SUB-FAIL-F3-16-1.                              NC2534.2 1528
   001523         152600     PERFORM PASS                                                 NC2534.2 426
   001524         152700     GO TO SUB-WRITE-F3-16-1.                                     NC2534.2 1534
   001525         152800 SUB-DELETE-F3-16-1.                                              NC2534.2
   001526         152900     PERFORM DE-LETE.                                             NC2534.2 428
   001527         153000     GO TO SUB-WRITE-F3-16-1.                                     NC2534.2 1534
   001528         153100 SUB-FAIL-F3-16-1.                                                NC2534.2
   001529         153200     MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"                    NC2534.2
   001530         153300          TO RE-MARK                                              NC2534.2 281
   001531         153400     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001532         153500     MOVE   "A"    TO CORRECT-X                                   NC2534.2 300
   001533         153600     PERFORM FAIL.                                                NC2534.2 427
   001534         153700 SUB-WRITE-F3-16-1.                                               NC2534.2
   001535         153800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001536         153900*                                                                 NC2534.2
   001537         154000 SUB-INIT-F3-16-2.                                                NC2534.2
   001538         154100     MOVE  "SUB-TEST-F3-16-2" TO PAR-NAME.                        NC2534.2 276
   001539         154200     ADD    1 TO REC-CT.                                          NC2534.2 323
   001540         154300 SUB-TEST-F3-16-2.                                                NC2534.2
   001541         154400     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001542      1  154500            GO TO SUB-FAIL-F3-16-2.                               NC2534.2 1548
   001543         154600     PERFORM PASS                                                 NC2534.2 426
   001544         154700     GO TO SUB-WRITE-F3-16-2.                                     NC2534.2 1554
   001545         154800 SUB-DELETE-F3-16-2.                                              NC2534.2
   001546         154900     PERFORM DE-LETE.                                             NC2534.2 428
   001547         155000     GO TO SUB-WRITE-F3-16-2.                                     NC2534.2 1554
   001548         155100 SUB-FAIL-F3-16-2.                                                NC2534.2
   001549         155200     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001550         155300     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001551         155400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001552         155500          TO RE-MARK                                              NC2534.2 281
   001553         155600     PERFORM FAIL.                                                NC2534.2 427
   001554         155700 SUB-WRITE-F3-16-2.                                               NC2534.2
   001555         155800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001556         155900*                                                                 NC2534.2
   001557         156000 SUB-INIT-F3-16-3.                                                NC2534.2
   001558         156100     MOVE  "SUB-TEST-F3-16-3" TO PAR-NAME.                        NC2534.2 276
   001559         156200     ADD    1 TO REC-CT.                                          NC2534.2 323
   001560         156300 SUB-TEST-F3-16-3.                                                NC2534.2
   001561         156400     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001562      1  156500            GO TO SUB-FAIL-F3-16-3.                               NC2534.2 1568
   001563         156600     PERFORM PASS                                                 NC2534.2 426
   001564         156700     GO TO SUB-WRITE-F3-16-3.                                     NC2534.2 1574
   001565         156800 SUB-DELETE-F3-16-3.                                              NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001566         156900     PERFORM DE-LETE.                                             NC2534.2 428
   001567         157000     GO TO SUB-WRITE-F3-16-3.                                     NC2534.2 1574
   001568         157100 SUB-FAIL-F3-16-3.                                                NC2534.2
   001569         157200     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001570         157300     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001571         157400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001572         157500          TO RE-MARK                                              NC2534.2 281
   001573         157600     PERFORM FAIL.                                                NC2534.2 427
   001574         157700 SUB-WRITE-F3-16-3.                                               NC2534.2
   001575         157800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001576         157900*                                                                 NC2534.2
   001577         158000 SUB-INIT-F3-16-4.                                                NC2534.2
   001578         158100     MOVE  "SUB-TEST-F3-16-4" TO PAR-NAME.                        NC2534.2 276
   001579         158200     ADD     1 TO REC-CT.                                         NC2534.2 323
   001580         158300 SUB-TEST-F3-16-4.                                                NC2534.2
   001581         158400     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 178 175
   001582      1  158500            GO TO SUB-FAIL-F3-16-4.                               NC2534.2 1588
   001583         158600     PERFORM PASS                                                 NC2534.2 426
   001584         158700     GO TO SUB-WRITE-F3-16-4.                                     NC2534.2 1593
   001585         158800 SUB-DELETE-F3-16-4.                                              NC2534.2
   001586         158900     PERFORM DE-LETE.                                             NC2534.2 428
   001587         159000     GO TO SUB-WRITE-F3-16-4.                                     NC2534.2 1593
   001588         159100 SUB-FAIL-F3-16-4.                                                NC2534.2
   001589         159200     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001590         159300     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001591         159400     MOVE   "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK           NC2534.2 281
   001592         159500     PERFORM FAIL.                                                NC2534.2 427
   001593         159600 SUB-WRITE-F3-16-4.                                               NC2534.2
   001594         159700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001595         159800*                                                                 NC2534.2
   001596         159900 SUB-INIT-F3-16-5.                                                NC2534.2
   001597         160000     MOVE   "SUB-TEST-F3-16-5" TO PAR-NAME.                       NC2534.2 276
   001598         160100     ADD     1 TO REC-CT.                                         NC2534.2 323
   001599         160200 SUB-TEST-F3-16-5.                                                NC2534.2
   001600         160300     IF      WRK-XN-00001 NOT = "Z"                               NC2534.2 52
   001601      1  160400             GO TO SUB-FAIL-F3-16-5.                              NC2534.2 1607
   001602         160500     PERFORM PASS                                                 NC2534.2 426
   001603         160600     GO TO SUB-WRITE-F3-16-5.                                     NC2534.2 1612
   001604         160700 SUB-DELETE-F3-16-5.                                              NC2534.2
   001605         160800     PERFORM DE-LETE.                                             NC2534.2 428
   001606         160900     GO TO SUB-WRITE-F3-16-5.                                     NC2534.2 1612
   001607         161000 SUB-FAIL-F3-16-5.                                                NC2534.2
   001608         161100     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2534.2 281
   001609         161200     MOVE   "Z"   TO COMPUTED-X                                   NC2534.2 286
   001610         161300     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2534.2 51 300
   001611         161400     PERFORM FAIL.                                                NC2534.2 427
   001612         161500 SUB-WRITE-F3-16-5.                                               NC2534.2
   001613         161600     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001614         161700*                                                                 NC2534.2
   001615         161800 SUB-INIT-F3-17.                                                  NC2534.2
   001616         161900*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   001617         162000*    ===-->   NO SIZE ERROR        <--===                         NC2534.2
   001618         162100     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001619         162200     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001620         162300     MOVE    SPACE  TO WRK-XN-00001.                              NC2534.2 IMP 52
   001621         162400     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001622         162500     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001623         162600     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001624         162700     MOVE    6.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001625         162800     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001626         162900     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001627         163000     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001628         163100 SUB-TEST-F3-17-0.                                                NC2534.2
   001629         163200     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001630         163300             ON SIZE ERROR                                        NC2534.2
   001631      1  163400             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001632         163500         NOT ON SIZE ERROR                                        NC2534.2
   001633      1  163600             MOVE   "B" TO WRK-AN-00001                           NC2534.2 51
   001634         163700     END-SUBTRACT                                                 NC2534.2
   001635         163800     MOVE   "Z" TO WRK-XN-00001.                                  NC2534.2 52
   001636         163900*                                                                 NC2534.2
   001637         164000 SUB-INIT-F3-17-1.                                                NC2534.2
   001638         164100     MOVE   "SUB-TEST-F3-17-1" TO PAR-NAME.                       NC2534.2 276
   001639         164200     ADD     1 TO REC-CT.                                         NC2534.2 323
   001640         164300 SUB-TEST-F3-17-1.                                                NC2534.2
   001641         164400     IF      WRK-AN-00001    NOT = "B"                            NC2534.2 51
   001642      1  164500             GO TO SUB-FAIL-F3-17-1.                              NC2534.2 1648
   001643         164600     PERFORM PASS                                                 NC2534.2 426
   001644         164700     GO TO SUB-WRITE-F3-17-1.                                     NC2534.2 1654
   001645         164800 SUB-DELETE-F3-17-1.                                              NC2534.2
   001646         164900     PERFORM DE-LETE.                                             NC2534.2 428
   001647         165000     GO TO SUB-WRITE-F3-17-1.                                     NC2534.2 1654
   001648         165100 SUB-FAIL-F3-17-1.                                                NC2534.2
   001649         165200     MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"                NC2534.2
   001650         165300           TO RE-MARK                                             NC2534.2 281
   001651         165400     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001652         165500     MOVE   "B"    TO CORRECT-X                                   NC2534.2 300
   001653         165600     PERFORM FAIL.                                                NC2534.2 427
   001654         165700 SUB-WRITE-F3-17-1.                                               NC2534.2
   001655         165800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001656         165900*                                                                 NC2534.2
   001657         166000 SUB-INIT-F3-17-2.                                                NC2534.2
   001658         166100     MOVE  "SUB-TEST-F3-17-2" TO PAR-NAME.                        NC2534.2 276
   001659         166200     ADD    1 TO REC-CT.                                          NC2534.2 323
   001660         166300 SUB-TEST-F3-17-2.                                                NC2534.2
   001661         166400     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001662      1  166500            GO TO SUB-FAIL-F3-17-2.                               NC2534.2 1668
   001663         166600     PERFORM PASS                                                 NC2534.2 426
   001664         166700     GO TO SUB-WRITE-F3-17-2.                                     NC2534.2 1674
   001665         166800 SUB-DELETE-F3-17-2.                                              NC2534.2
   001666         166900     PERFORM DE-LETE.                                             NC2534.2 428
   001667         167000     GO TO SUB-WRITE-F3-17-2.                                     NC2534.2 1674
   001668         167100 SUB-FAIL-F3-17-2.                                                NC2534.2
   001669         167200     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001670         167300     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001671         167400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001672         167500          TO RE-MARK                                              NC2534.2 281
   001673         167600     PERFORM FAIL.                                                NC2534.2 427
   001674         167700 SUB-WRITE-F3-17-2.                                               NC2534.2
   001675         167800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001676         167900*                                                                 NC2534.2
   001677         168000 SUB-INIT-F3-17-3.                                                NC2534.2
   001678         168100     MOVE  "SUB-TEST-F3-17-3" TO PAR-NAME.                        NC2534.2 276
   001679         168200     ADD    1 TO REC-CT.                                          NC2534.2 323
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001680         168300 SUB-TEST-F3-17-3.                                                NC2534.2
   001681         168400     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001682      1  168500            GO TO SUB-FAIL-F3-17-3.                               NC2534.2 1688
   001683         168600     PERFORM PASS                                                 NC2534.2 426
   001684         168700     GO TO SUB-WRITE-F3-17-3.                                     NC2534.2 1694
   001685         168800 SUB-DELETE-F3-17-3.                                              NC2534.2
   001686         168900     PERFORM DE-LETE.                                             NC2534.2 428
   001687         169000     GO TO SUB-WRITE-F3-17-3.                                     NC2534.2 1694
   001688         169100 SUB-FAIL-F3-17-3.                                                NC2534.2
   001689         169200     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001690         169300     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001691         169400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001692         169500          TO RE-MARK                                              NC2534.2 281
   001693         169600     PERFORM FAIL.                                                NC2534.2 427
   001694         169700 SUB-WRITE-F3-17-3.                                               NC2534.2
   001695         169800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001696         169900*                                                                 NC2534.2
   001697         170000 SUB-INIT-F3-17-4.                                                NC2534.2
   001698         170100     MOVE  "SUB-TEST-F3-17-4" TO PAR-NAME.                        NC2534.2 276
   001699         170200     ADD     1 TO REC-CT.                                         NC2534.2 323
   001700         170300 SUB-TEST-F3-17-4.                                                NC2534.2
   001701         170400     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO -5.76               NC2534.2 178 175
   001702      1  170500            GO TO SUB-FAIL-F3-17-4.                               NC2534.2 1708
   001703         170600     PERFORM PASS                                                 NC2534.2 426
   001704         170700     GO TO SUB-WRITE-F3-17-4.                                     NC2534.2 1714
   001705         170800 SUB-DELETE-F3-17-4.                                              NC2534.2
   001706         170900     PERFORM DE-LETE.                                             NC2534.2 428
   001707         171000     GO TO SUB-WRITE-F3-17-4.                                     NC2534.2 1714
   001708         171100 SUB-FAIL-F3-17-4.                                                NC2534.2
   001709         171200     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001710         171300     MOVE   "-5.76" TO CORRECT-A                                  NC2534.2 301
   001711         171400     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001712         171500          TO RE-MARK                                              NC2534.2 281
   001713         171600     PERFORM FAIL.                                                NC2534.2 427
   001714         171700 SUB-WRITE-F3-17-4.                                               NC2534.2
   001715         171800     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001716         171900*                                                                 NC2534.2
   001717         172000 SUB-INIT-F3-17-5.                                                NC2534.2
   001718         172100     MOVE   "SUB-TEST-F3-17-5" TO PAR-NAME.                       NC2534.2 276
   001719         172200     ADD     1 TO REC-CT.                                         NC2534.2 323
   001720         172300 SUB-TEST-F3-17-5.                                                NC2534.2
   001721         172400     IF      WRK-XN-00001 NOT = "Z"                               NC2534.2 52
   001722      1  172500             GO TO SUB-FAIL-F3-17-5.                              NC2534.2 1728
   001723         172600     PERFORM PASS                                                 NC2534.2 426
   001724         172700     GO TO SUB-WRITE-F3-17-5.                                     NC2534.2 1733
   001725         172800 SUB-DELETE-F3-17-5.                                              NC2534.2
   001726         172900     PERFORM DE-LETE.                                             NC2534.2 428
   001727         173000     GO TO SUB-WRITE-F3-17-5.                                     NC2534.2 1733
   001728         173100 SUB-FAIL-F3-17-5.                                                NC2534.2
   001729         173200     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2534.2 281
   001730         173300     MOVE   "Z"   TO COMPUTED-X                                   NC2534.2 286
   001731         173400     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2534.2 51 300
   001732         173500     PERFORM FAIL.                                                NC2534.2 427
   001733         173600 SUB-WRITE-F3-17-5.                                               NC2534.2
   001734         173700     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001735         173800*                                                                 NC2534.2
   001736         173900 SUB-INIT-F3-18.                                                  NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001737         174000*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   001738         174100*    ===-->      SIZE ERROR        <--===                         NC2534.2
   001739         174200     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001740         174300     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001741         174400     MOVE    SPACE  TO WRK-XN-00001.                              NC2534.2 IMP 52
   001742         174500     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001743         174600     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   001744         174700     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001745         174800     MOVE   76.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001746         174900     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001747         175000     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001748         175100     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001749         175200 SUB-TEST-F3-18-0.                                                NC2534.2
   001750         175300     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001751         175400             ON SIZE ERROR                                        NC2534.2
   001752      1  175500             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001753         175600         NOT ON SIZE ERROR                                        NC2534.2
   001754      1  175700             MOVE   "B" TO WRK-AN-00001                           NC2534.2 51
   001755         175800     END-SUBTRACT                                                 NC2534.2
   001756         175900     MOVE   "Z" TO WRK-XN-00001.                                  NC2534.2 52
   001757         176000*                                                                 NC2534.2
   001758         176100 SUB-INIT-F3-18-1.                                                NC2534.2
   001759         176200     MOVE   "SUB-TEST-F3-18-1" TO PAR-NAME.                       NC2534.2 276
   001760         176300     ADD     1 TO REC-CT.                                         NC2534.2 323
   001761         176400 SUB-TEST-F3-18-1.                                                NC2534.2
   001762         176500     IF      WRK-AN-00001    NOT = "A"                            NC2534.2 51
   001763      1  176600             GO TO SUB-FAIL-F3-18-1.                              NC2534.2 1769
   001764         176700     PERFORM PASS                                                 NC2534.2 426
   001765         176800     GO TO SUB-WRITE-F3-18-1.                                     NC2534.2 1775
   001766         176900 SUB-DELETE-F3-18-1.                                              NC2534.2
   001767         177000     PERFORM DE-LETE.                                             NC2534.2 428
   001768         177100     GO TO SUB-WRITE-F3-18-1.                                     NC2534.2 1775
   001769         177200 SUB-FAIL-F3-18-1.                                                NC2534.2
   001770         177300     MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"                    NC2534.2
   001771         177400          TO RE-MARK                                              NC2534.2 281
   001772         177500     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001773         177600     MOVE   "A"    TO CORRECT-X                                   NC2534.2 300
   001774         177700     PERFORM FAIL.                                                NC2534.2 427
   001775         177800 SUB-WRITE-F3-18-1.                                               NC2534.2
   001776         177900     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001777         178000*                                                                 NC2534.2
   001778         178100 SUB-INIT-F3-18-2.                                                NC2534.2
   001779         178200     MOVE  "SUB-TEST-F3-18-2" TO PAR-NAME.                        NC2534.2 276
   001780         178300     ADD    1 TO REC-CT.                                          NC2534.2 323
   001781         178400 SUB-TEST-F3-18-2.                                                NC2534.2
   001782         178500     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001783      1  178600            GO TO SUB-FAIL-F3-18-2.                               NC2534.2 1786
   001784         178700     PERFORM PASS                                                 NC2534.2 426
   001785         178800     GO TO SUB-WRITE-F3-18-2.                                     NC2534.2 1792
   001786         178900 SUB-FAIL-F3-18-2.                                                NC2534.2
   001787         179000     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001788         179100     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001789         179200     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001790         179300          TO RE-MARK                                              NC2534.2 281
   001791         179400     PERFORM FAIL.                                                NC2534.2 427
   001792         179500 SUB-WRITE-F3-18-2.                                               NC2534.2
   001793         179600     PERFORM PRINT-DETAIL.                                        NC2534.2 430
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001794         179700*                                                                 NC2534.2
   001795         179800 SUB-INIT-F3-18-3.                                                NC2534.2
   001796         179900     MOVE  "SUB-TEST-F3-18-3" TO PAR-NAME.                        NC2534.2 276
   001797         180000     ADD    1 TO REC-CT.                                          NC2534.2 323
   001798         180100 SUB-TEST-F3-18-3.                                                NC2534.2
   001799         180200     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001800      1  180300            GO TO SUB-FAIL-F3-18-3.                               NC2534.2 1806
   001801         180400     PERFORM PASS                                                 NC2534.2 426
   001802         180500     GO TO SUB-WRITE-F3-18-3.                                     NC2534.2 1812
   001803         180600 SUB-DELETE-F3-18-3.                                              NC2534.2
   001804         180700     PERFORM DE-LETE.                                             NC2534.2 428
   001805         180800     GO TO SUB-WRITE-F3-18-3.                                     NC2534.2 1812
   001806         180900 SUB-FAIL-F3-18-3.                                                NC2534.2
   001807         181000     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001808         181100     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001809         181200     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001810         181300          TO RE-MARK                                              NC2534.2 281
   001811         181400     PERFORM FAIL.                                                NC2534.2 427
   001812         181500 SUB-WRITE-F3-18-3.                                               NC2534.2
   001813         181600     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001814         181700*                                                                 NC2534.2
   001815         181800 SUB-INIT-F3-18-4.                                                NC2534.2
   001816         181900     MOVE  "SUB-TEST-F3-18-4" TO PAR-NAME.                        NC2534.2 276
   001817         182000     ADD     1 TO REC-CT.                                         NC2534.2 323
   001818         182100 SUB-TEST-F3-18-4.                                                NC2534.2
   001819         182200     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 178 175
   001820      1  182300            GO TO SUB-FAIL-F3-18-4.                               NC2534.2 1826
   001821         182400     PERFORM PASS                                                 NC2534.2 426
   001822         182500     GO TO SUB-WRITE-F3-18-4.                                     NC2534.2 1831
   001823         182600 SUB-DELETE-F3-18-4.                                              NC2534.2
   001824         182700     PERFORM DE-LETE.                                             NC2534.2 428
   001825         182800     GO TO SUB-WRITE-F3-18-4.                                     NC2534.2 1831
   001826         182900 SUB-FAIL-F3-18-4.                                                NC2534.2
   001827         183000     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001828         183100     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
   001829         183200     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK             NC2534.2 281
   001830         183300     PERFORM FAIL.                                                NC2534.2 427
   001831         183400 SUB-WRITE-F3-18-4.                                               NC2534.2
   001832         183500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001833         183600*                                                                 NC2534.2
   001834         183700 SUB-INIT-F3-18-5.                                                NC2534.2
   001835         183800     MOVE   "SUB-TEST-F3-18-5" TO PAR-NAME.                       NC2534.2 276
   001836         183900     ADD     1 TO REC-CT.                                         NC2534.2 323
   001837         184000 SUB-TEST-F3-18-5.                                                NC2534.2
   001838         184100     IF      WRK-XN-00001 NOT = "Z"                               NC2534.2 52
   001839      1  184200             GO TO SUB-FAIL-F3-18-5.                              NC2534.2 1845
   001840         184300     PERFORM PASS                                                 NC2534.2 426
   001841         184400     GO TO SUB-WRITE-F3-18-5.                                     NC2534.2 1850
   001842         184500 SUB-DELETE-F3-18-5.                                              NC2534.2
   001843         184600     PERFORM DE-LETE.                                             NC2534.2 428
   001844         184700     GO TO SUB-WRITE-F3-18-5.                                     NC2534.2 1850
   001845         184800 SUB-FAIL-F3-18-5.                                                NC2534.2
   001846         184900     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2534.2 281
   001847         185000     MOVE   "Z"   TO COMPUTED-X                                   NC2534.2 286
   001848         185100     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2534.2 51 300
   001849         185200     PERFORM FAIL.                                                NC2534.2 427
   001850         185300 SUB-WRITE-F3-18-5.                                               NC2534.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001851         185400     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001852         185500*                                                                 NC2534.2
   001853         185600 SUB-INIT-F3-19.                                                  NC2534.2
   001854         185700*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2534.2
   001855         185800*    ===-->   NO SIZE ERROR        <--===                         NC2534.2
   001856         185900     MOVE   "VI-133 6.25" TO ANSI-REFERENCE.                      NC2534.2 332
   001857         186000     MOVE    SPACE  TO WRK-AN-00001.                              NC2534.2 IMP 51
   001858         186100     MOVE    0      TO REC-CT.                                    NC2534.2 323
   001859         186200     MOVE    1      TO SUBTR-13 OF SUBTR-12.                      NC2534.2 172 171
   001860         186300     MOVE   -1.725  TO SUBTR-14 OF SUBTR-12.                      NC2534.2 173 171
   001861         186400     MOVE    6.76   TO SUBTR-15 OF SUBTR-12.                      NC2534.2 174 171
   001862         186500     MOVE    2      TO SUBTR-13 OF SUBTR-16.                      NC2534.2 176 175
   001863         186600     MOVE     .23   TO SUBTR-14 OF SUBTR-16.                      NC2534.2 177 175
   001864         186700     MOVE    1      TO SUBTR-15 OF SUBTR-16.                      NC2534.2 178 175
   001865         186800 SUB-TEST-F3-19-0.                                                NC2534.2
   001866         186900     SUBTRACT CORRESPONDING SUBTR-12 FROM SUBTR-16 ROUNDED        NC2534.2 171 175
   001867         187000             ON SIZE ERROR                                        NC2534.2
   001868      1  187100             MOVE   "A" TO WRK-AN-00001                           NC2534.2 51
   001869         187200         NOT ON SIZE ERROR                                        NC2534.2
   001870      1  187300             MOVE   "B" TO WRK-AN-00001                           NC2534.2 51
   001871         187400     END-SUBTRACT                                                 NC2534.2
   001872         187500     MOVE   "Z" TO WRK-XN-00001.                                  NC2534.2 52
   001873         187600*                                                                 NC2534.2
   001874         187700 SUB-INIT-F3-19-1.                                                NC2534.2
   001875         187800     MOVE   "SUB-TEST-F3-19-1" TO PAR-NAME.                       NC2534.2 276
   001876         187900     ADD     1 TO REC-CT.                                         NC2534.2 323
   001877         188000 SUB-TEST-F3-19-1.                                                NC2534.2
   001878         188100     IF      WRK-AN-00001    NOT = "B"                            NC2534.2 51
   001879      1  188200             GO TO SUB-FAIL-F3-19-1.                              NC2534.2 1885
   001880         188300     PERFORM PASS                                                 NC2534.2 426
   001881         188400     GO TO SUB-WRITE-F3-19-1.                                     NC2534.2 1891
   001882         188500 SUB-DELETE-F3-19-1.                                              NC2534.2
   001883         188600     PERFORM DE-LETE.                                             NC2534.2 428
   001884         188700     GO TO SUB-WRITE-F3-19-1.                                     NC2534.2 1891
   001885         188800 SUB-FAIL-F3-19-1.                                                NC2534.2
   001886         188900     MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"                NC2534.2
   001887         189000                TO RE-MARK                                        NC2534.2 281
   001888         189100     MOVE    WRK-AN-00001  TO COMPUTED-X                          NC2534.2 51 286
   001889         189200     MOVE   "B"    TO CORRECT-X                                   NC2534.2 300
   001890         189300     PERFORM FAIL.                                                NC2534.2 427
   001891         189400 SUB-WRITE-F3-19-1.                                               NC2534.2
   001892         189500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001893         189600*                                                                 NC2534.2
   001894         189700 SUB-INIT-F3-19-2.                                                NC2534.2
   001895         189800     MOVE  "SUB-TEST-F3-19-2" TO PAR-NAME.                        NC2534.2 276
   001896         189900     ADD    1 TO REC-CT.                                          NC2534.2 323
   001897         190000 SUB-TEST-F3-19-2.                                                NC2534.2
   001898         190100     IF     SUBTR-13 OF SUBTR-16 NOT EQUAL TO 1                   NC2534.2 176 175
   001899      1  190200            GO TO SUB-FAIL-F3-19-2.                               NC2534.2 1905
   001900         190300     PERFORM PASS                                                 NC2534.2 426
   001901         190400     GO TO SUB-WRITE-F3-19-2.                                     NC2534.2 1911
   001902         190500 SUB-DELETE-F3-19-2.                                              NC2534.2
   001903         190600     PERFORM DE-LETE.                                             NC2534.2 428
   001904         190700     GO TO SUB-WRITE-F3-19-2.                                     NC2534.2 1911
   001905         190800 SUB-FAIL-F3-19-2.                                                NC2534.2
   001906         190900     MOVE    SUBTR-13 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 176 175 288
   001907         191000     MOVE   "+1" TO CORRECT-A                                     NC2534.2 301
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001908         191100     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001909         191200          TO RE-MARK                                              NC2534.2 281
   001910         191300     PERFORM FAIL.                                                NC2534.2 427
   001911         191400 SUB-WRITE-F3-19-2.                                               NC2534.2
   001912         191500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001913         191600*                                                                 NC2534.2
   001914         191700 SUB-INIT-F3-19-3.                                                NC2534.2
   001915         191800     MOVE  "SUB-TEST-F3-19-3" TO PAR-NAME.                        NC2534.2 276
   001916         191900     ADD    1 TO REC-CT.                                          NC2534.2 323
   001917         192000 SUB-TEST-F3-19-3.                                                NC2534.2
   001918         192100     IF     SUBTR-14 OF SUBTR-16 IS NOT EQUAL TO 1.96             NC2534.2 177 175
   001919      1  192200            GO TO SUB-FAIL-F3-19-3.                               NC2534.2 1925
   001920         192300     PERFORM PASS                                                 NC2534.2 426
   001921         192400     GO TO SUB-WRITE-F3-19-3.                                     NC2534.2 1931
   001922         192500 SUB-DELETE-F3-19-3.                                              NC2534.2
   001923         192600     PERFORM DE-LETE.                                             NC2534.2 428
   001924         192700     GO TO SUB-WRITE-F3-19-3.                                     NC2534.2 1931
   001925         192800 SUB-FAIL-F3-19-3.                                                NC2534.2
   001926         192900     MOVE   SUBTR-14 OF SUBTR-16 TO COMPUTED-N                    NC2534.2 177 175 288
   001927         193000     MOVE   "+1.96" TO CORRECT-A                                  NC2534.2 301
   001928         193100     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001929         193200          TO RE-MARK                                              NC2534.2 281
   001930         193300     PERFORM FAIL.                                                NC2534.2 427
   001931         193400 SUB-WRITE-F3-19-3.                                               NC2534.2
   001932         193500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001933         193600*                                                                 NC2534.2
   001934         193700 SUB-INIT-F3-19-4.                                                NC2534.2
   001935         193800     MOVE  "SUB-TEST-F3-19-4" TO PAR-NAME.                        NC2534.2 276
   001936         193900     ADD     1 TO REC-CT.                                         NC2534.2 323
   001937         194000 SUB-TEST-F3-19-4.                                                NC2534.2
   001938         194100     IF     SUBTR-15 OF SUBTR-16 NOT EQUAL TO -5.76               NC2534.2 178 175
   001939      1  194200            GO TO SUB-FAIL-F3-19-4.                               NC2534.2 1945
   001940         194300     PERFORM PASS                                                 NC2534.2 426
   001941         194400     GO TO SUB-WRITE-F3-19-4.                                     NC2534.2 1951
   001942         194500 SUB-DELETE-F3-19-4.                                              NC2534.2
   001943         194600     PERFORM DE-LETE.                                             NC2534.2 428
   001944         194700     GO TO SUB-WRITE-F3-19-4.                                     NC2534.2 1951
   001945         194800 SUB-FAIL-F3-19-4.                                                NC2534.2
   001946         194900     MOVE    SUBTR-15 OF SUBTR-16 TO COMPUTED-N                   NC2534.2 178 175 288
   001947         195000     MOVE   "-5.76" TO CORRECT-A                                  NC2534.2 301
   001948         195100     MOVE "WRONGLY AFFECTED BY SIZE ERROR ON OTHER OPERAND"       NC2534.2
   001949         195200          TO RE-MARK                                              NC2534.2 281
   001950         195300     PERFORM FAIL.                                                NC2534.2 427
   001951         195400 SUB-WRITE-F3-19-4.                                               NC2534.2
   001952         195500     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001953         195600*                                                                 NC2534.2
   001954         195700 SUB-INIT-F3-19-5.                                                NC2534.2
   001955         195800     MOVE   "SUB-TEST-F3-19-5" TO PAR-NAME.                       NC2534.2 276
   001956         195900     ADD     1 TO REC-CT.                                         NC2534.2 323
   001957         196000 SUB-TEST-F3-19-5.                                                NC2534.2
   001958         196100     IF      WRK-XN-00001 NOT = "Z"                               NC2534.2 52
   001959      1  196200             GO TO SUB-FAIL-F3-19-5.                              NC2534.2 1965
   001960         196300     PERFORM PASS                                                 NC2534.2 426
   001961         196400     GO TO SUB-WRITE-F3-19-5.                                     NC2534.2 1970
   001962         196500 SUB-DELETE-F3-19-5.                                              NC2534.2
   001963         196600     PERFORM DE-LETE.                                             NC2534.2 428
   001964         196700     GO TO SUB-WRITE-F3-19-5.                                     NC2534.2 1970
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001965         196800 SUB-FAIL-F3-19-5.                                                NC2534.2
   001966         196900     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2534.2 281
   001967         197000     MOVE   "Z"   TO COMPUTED-X                                   NC2534.2 286
   001968         197100     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2534.2 51 300
   001969         197200     PERFORM FAIL.                                                NC2534.2 427
   001970         197300 SUB-WRITE-F3-19-5.                                               NC2534.2
   001971         197400     PERFORM PRINT-DETAIL.                                        NC2534.2 430
   001972         197500*                                                                 NC2534.2
   001973         197600 CCVS-EXIT SECTION.                                               NC2534.2
   001974         197700 CCVS-999999.                                                     NC2534.2
   001975         197800     GO TO CLOSE-FILES.                                           NC2534.2 419
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    39
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      110   ADD-CORR-A
      142   ADD-CORR-B
      143   ADD-CORR-0
      109   ADD-CORR-1 . . . . . . . . . .  M545 556
      120   ADD-CORR-1 . . . . . . . . . .  M556 M576
      133   ADD-CORR-1 . . . . . . . . . .  576
      150   ADD-CORR-1
      108   ADD-CORR-2 . . . . . . . . . .  M546 556
      121   ADD-CORR-2 . . . . . . . . . .  M556 M576
      134   ADD-CORR-2 . . . . . . . . . .  576
      149   ADD-CORR-2
      112   ADD-CORR-3 . . . . . . . . . .  M547 556
      122   ADD-CORR-3 . . . . . . . . . .  M556 M576
      137   ADD-CORR-3 . . . . . . . . . .  576
      148   ADD-CORR-3
      111   ADD-CORR-4 . . . . . . . . . .  M548 556
      123   ADD-CORR-4 . . . . . . . . . .  M556 M576
      136   ADD-CORR-4 . . . . . . . . . .  576
      147   ADD-CORR-4
      114   ADD-CORR-5 . . . . . . . . . .  M549 556
      124   ADD-CORR-5 . . . . . . . . . .  M556 M576
      135   ADD-CORR-5 . . . . . . . . . .  576
      113   ADD-CORR-6 . . . . . . . . . .  M550 556
      125   ADD-CORR-6 . . . . . . . . . .  M556 M576
      138   ADD-CORR-6 . . . . . . . . . .  576
      116   ADD-CORR-7 . . . . . . . . . .  M551 556
      126   ADD-CORR-7 . . . . . . . . . .  M556 M576
      139   ADD-CORR-7 . . . . . . . . . .  576
      115   ADD-CORR-8 . . . . . . . . . .  M552 556
      127   ADD-CORR-8 . . . . . . . . . .  M556 M576
      140   ADD-CORR-8 . . . . . . . . . .  576
      117   ADD-CORR-9 . . . . . . . . . .  M553 556
      128   ADD-CORR-9 . . . . . . . . . .  M556 M576
      141   ADD-CORR-9 . . . . . . . . . .  576
       69   ADD-1
       78   ADD-10
       79   ADD-11
       80   ADD-12
       81   ADD-13
       82   ADD-14
      151   ADD-15
      155   ADD-16
       70   ADD-2
       71   ADD-3
       72   ADD-4
       73   ADD-5
       74   ADD-6
       75   ADD-7
       76   ADD-8
       77   ADD-9
      332   ANSI-REFERENCE . . . . . . . .  504 511 520 M542 M755 M780 M877 M973 M1070 M1168 M1264 M1382 M1498 M1618 M1739
                                            M1856
       57   AZERO-DS-05V05
       63   A05ONES-DS-05V00
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    40
0 Defined   Cross-reference of data names   References

0      60   A18ONES-DS-09V09
       64   A99-DS-02V00
      311   CCVS-C-1 . . . . . . . . . . .  448 490
      316   CCVS-C-2 . . . . . . . . . . .  449 491
      366   CCVS-E-1 . . . . . . . . . . .  454
      371   CCVS-E-2 . . . . . . . . . . .  463 470 477 482
      374   CCVS-E-2-2 . . . . . . . . . .  M462
      379   CCVS-E-3 . . . . . . . . . . .  483
      388   CCVS-E-4 . . . . . . . . . . .  462
      389   CCVS-E-4-1 . . . . . . . . . .  M460
      391   CCVS-E-4-2 . . . . . . . . . .  M461
      333   CCVS-H-1 . . . . . . . . . . .  443
      338   CCVS-H-2A. . . . . . . . . . .  444
      347   CCVS-H-2B. . . . . . . . . . .  445
      359   CCVS-H-3 . . . . . . . . . . .  446
      409   CCVS-PGM-ID. . . . . . . . . .  415 415
      293   CM-18V0
      287   COMPUTED-A . . . . . . . . . .  288 290 291 292 293 516 519 M565 M585 M689 M709 M728 M748 M773
      288   COMPUTED-N . . . . . . . . . .  M630 M649 M668 M826 M846 M866 M923 M943 M963 M1019 M1039 M1059 M1118 M1138 M1158
                                            M1216 M1236 M1253 M1313 M1333 M1353 M1428 M1448 M1468 M1549 M1569 M1589 M1669
                                            M1689 M1709 M1787 M1807 M1827 M1906 M1926 M1946
      286   COMPUTED-X . . . . . . . . . .  M438 502 M808 M905 M1001 M1100 M1198 M1295 M1373 M1410 M1489 M1531 M1609 M1651
                                            M1730 M1772 M1847 M1888 M1967
      290   COMPUTED-0V18
      292   COMPUTED-14V4
      294   COMPUTED-18V0
      291   COMPUTED-4V14
      310   COR-ANSI-REFERENCE . . . . . .  M511 M513
      179   CORR-DATA-1. . . . . . . . . .  M696 M699 700 709 M718 719 728 M736 738
      186   CORR-DATA-2. . . . . . . . . .  M676 679
      193   CORR-DATA-3. . . . . . . . . .  M677 M679 680 689
      200   CORR-DATA-4
      207   CORR-DATA-5. . . . . . . . . .  M735 M738 739 748
      215   CORR-DATA-6. . . . . . . . . .  M697 699 M715 718
      222   CORR-DATA-7
      301   CORRECT-A. . . . . . . . . . .  302 303 304 305 306 517 519 M566 M586 M631 M650 M669 M688 M708 M727 M749 M774
                                            M827 M847 M867 M924 M944 M964 M1020 M1040 M1060 M1119 M1139 M1159 M1217 M1237
                                            M1254 M1314 M1334 M1354 M1429 M1449 M1469 M1550 M1570 M1590 M1670 M1690 M1710
                                            M1788 M1808 M1828 M1907 M1927 M1947
      302   CORRECT-N
      300   CORRECT-X. . . . . . . . . . .  M439 503 M809 M906 M1002 M1101 M1199 M1296 M1374 M1411 M1490 M1532 M1610 M1652
                                            M1731 M1773 M1848 M1889 M1968
      303   CORRECT-0V18
      305   CORRECT-14V4
      307   CORRECT-18V0
      304   CORRECT-4V14
      306   CR-18V0
       89   D-5
       90   D-9
      324   DELETE-COUNTER . . . . . . . .  M428 457 473 475
      228   DNAME1
      237   DNAME10
      238   DNAME11
      239   DNAME12
      240   DNAME13
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    41
0 Defined   Cross-reference of data names   References

0     241   DNAME14
      242   DNAME15
      243   DNAME16
      244   DNAME17
      245   DNAME18
      246   DNAME19
      229   DNAME2
      247   DNAME20
      248   DNAME21
      249   DNAME22
      250   DNAME23
      251   DNAME24
      252   DNAME25
      253   DNAME26
      254   DNAME27
      255   DNAME28
      256   DNAME29
      230   DNAME3
      257   DNAME30
      258   DNAME31
      259   DNAME32
      260   DNAME33
      261   DNAME34
      262   DNAME35
      263   DNAME36
      264   DNAME37
      265   DNAME38
      266   DNAME39
      231   DNAME4
      267   DNAME40
      268   DNAME41
      269   DNAME42
      232   DNAME5
      233   DNAME6
      234   DNAME7
      235   DNAME8
      236   DNAME9
      279   DOTVALUE . . . . . . . . . . .  M433
      330   DUMMY-HOLD . . . . . . . . . .  M487 493
       37   DUMMY-RECORD . . . . . . . . .  M443 M444 M445 M446 M448 M449 M450 M452 M454 M463 M470 M477 M482 M483 487 M488
                                            489 M490 M491 M492 M493 497 M498 M506 M521
       98   EIGHT
      377   ENDER-DESC . . . . . . . . . .  M465 M476 M481
      325   ERROR-COUNTER. . . . . . . . .  M427 456 466 469
      329   ERROR-HOLD . . . . . . . . . .  M456 M457 M457 M458 461
      375   ERROR-TOTAL. . . . . . . . . .  M467 M469 M474 M475 M479 M480
      272   FEATURE. . . . . . . . . . . .  M543
      152   FIELD1
      156   FIELD1
      153   FIELD2
      157   FIELD2
      154   FIELD3
      158   FIELD3
      101   FIFTEEN
       95   FIVE
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    42
0 Defined   Cross-reference of data names   References

0      94   FOUR
      131   GRP-ADD-SUB-CORR . . . . . . .  575
      144   GRP-FOR-ADD-CORR-A
      118   GRP-FOR-ADD-CORR-R . . . . . .  M544 M556 557 565 M573 M576 577 585
      105   GRP-FOR-ADD-CORR-1 . . . . . .  545 546 547 548 549 550 551 552 553 555
      130   GRP-FOR-ADD-CORR-2
      106   GRP-SUBTRACT-CORR-1
      119   GRP-SUBTRACT-CORR-1
      132   GRP-SUBTRACT-CORR-1
      146   GRP-SUBTRACT-CORR-1
      145   GRP-SUBTRACT-CORR-3
      403   HYPHEN-LINE. . . . . . . . . .  450 452 492
      369   ID-AGAIN . . . . . . . . . . .  M415
       43   INDEX1
       49   INDEX2
      402   INF-ANSI-REFERENCE . . . . . .  M504 M507 M520 M522
      397   INFO-TEXT. . . . . . . . . . .  M505
      326   INSPECT-COUNTER. . . . . . . .  M425 456 478 480
       99   NINE
       91   ONE
      274   P-OR-F . . . . . . . . . . . .  M425 M426 M427 M428 435 M438
      276   PAR-NAME . . . . . . . . . . .  M440 M541 M572 M599 M619 M638 M657 M675 M695 M716 M734 M754 M795 M815 M835 M855
                                            M892 M912 M932 M952 M988 M1008 M1028 M1048 M1087 M1107 M1127 M1147 M1185 M1205
                                            M1225 M1245 M1282 M1302 M1322 M1342 M1361 M1400 M1417 M1437 M1457 M1477 M1518
                                            M1538 M1558 M1578 M1597 M1638 M1658 M1678 M1698 M1718 M1759 M1779 M1796 M1816
                                            M1835 M1875 M1895 M1915 M1935 M1955
      278   PARDOT-X . . . . . . . . . . .  M432
      327   PASS-COUNTER . . . . . . . . .  M426 458 460
       35   PRINT-FILE . . . . . . . . . .  31 414 420
       36   PRINT-REC. . . . . . . . . . .  M434 M510 M512
      281   RE-MARK. . . . . . . . . . . .  M429 M441 M614 M633 M652 M670 M807 M829 M849 M869 M904 M926 M946 M965 M1000 M1022
                                            M1042 M1062 M1099 M1121 M1141 M1160 M1197 M1219 M1239 M1256 M1294 M1316 M1336
                                            M1355 M1372 M1409 M1431 M1451 M1471 M1488 M1530 M1552 M1572 M1591 M1608 M1650
                                            M1672 M1692 M1712 M1729 M1771 M1790 M1810 M1829 M1846 M1887 M1909 M1929 M1949
                                            M1966
      323   REC-CT . . . . . . . . . . . .  431 433 440 M782 M796 M816 M836 M856 M879 M893 M913 M933 M953 M975 M989 M1009
                                            M1029 M1049 M1072 M1088 M1108 M1128 M1148 M1170 M1186 M1206 M1226 M1246 M1267
                                            M1283 M1303 M1323 M1343 M1362 M1385 M1401 M1418 M1438 M1458 M1478 M1501 M1519
                                            M1539 M1559 M1579 M1598 M1621 M1639 M1659 M1679 M1699 M1719 M1742 M1760 M1780
                                            M1797 M1817 M1836 M1858 M1876 M1896 M1916 M1936 M1956
      322   REC-SKL-SUB
      331   RECORD-COUNT . . . . . . . . .  M485 486 M494
       40   RECORD1. . . . . . . . . . . .  M529 759
       46   RECORD1. . . . . . . . . . . .  M534 M759 761
       41   RECORD2. . . . . . . . . . . .  M530 M531
       47   RECORD2. . . . . . . . . . . .  M535 M536 762 763
       44   RECORD3. . . . . . . . . . . .  M532 759
       50   RECORD3. . . . . . . . . . . .  M537 M759 764
       97   SEVEN
       96   SIX
      160   SUBTR-1
      169   SUBTR-10
      170   SUBTR-11
      171   SUBTR-12 . . . . . . . . . . .  592 593 594 602 783 784 785 790 880 881 882 887 976 977 978 983 1073 1074 1075
                                            1080 1171 1172 1173 1178 1268 1269 1270 1275 1386 1387 1388 1393 1502 1503 1504
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    43
0 Defined   Cross-reference of data names   References

0                                           1509 1622 1623 1624 1629 1743 1744 1745 1750 1859 1860 1861 1866
      172   SUBTR-13 . . . . . . . . . . .  M592 602 M783 790 M880 887 M976 983 M1073 1080 M1171 1178 M1268 1275 M1386 1393
                                            M1502 1509 M1622 1629 M1743 1750 M1859 1866
      176   SUBTR-13 . . . . . . . . . . .  M595 M602 621 630 M786 M790 818 826 M883 M887 915 923 M979 M983 1011 1019 M1076
                                            M1080 1110 1118 M1174 M1178 1208 1216 M1271 M1275 1305 1313 M1389 M1393 1420
                                            1428 M1505 M1509 1541 1549 M1625 M1629 1661 1669 M1746 M1750 1782 1787 M1862
                                            M1866 1898 1906
      173   SUBTR-14 . . . . . . . . . . .  M593 602 M784 790 M881 887 M977 983 M1074 1080 M1172 1178 M1269 1275 M1387 1393
                                            M1503 1509 M1623 1629 M1744 1750 M1860 1866
      177   SUBTR-14 . . . . . . . . . . .  M596 M602 640 649 M787 M790 838 846 M884 M887 935 943 M980 M983 1031 1039 M1077
                                            M1080 1130 1138 M1175 M1178 1228 1236 M1272 M1275 1325 1333 M1390 M1393 1440
                                            1448 M1506 M1509 1561 1569 M1626 M1629 1681 1689 M1747 M1750 1799 1807 M1863
                                            M1866 1918 1926
      174   SUBTR-15 . . . . . . . . . . .  M594 602 M785 790 M882 887 M978 983 M1075 1080 M1173 1178 M1270 1275 M1388 1393
                                            M1504 1509 M1624 1629 M1745 1750 M1861 1866
      178   SUBTR-15 . . . . . . . . . . .  M597 M602 659 668 M788 M790 858 866 M885 M887 955 963 M981 M983 1051 1059 M1078
                                            M1080 1150 1158 M1176 M1178 1248 1253 M1273 M1275 1345 1353 M1391 M1393 1460
                                            1468 M1507 M1509 1581 1589 M1627 M1629 1701 1709 M1748 M1750 1819 1827 M1864
                                            M1866 1938 1946
      175   SUBTR-16 . . . . . . . . . . .  595 596 597 M602 621 630 640 649 659 668 786 787 788 M790 818 826 838 846 858
                                            866 883 884 885 M887 915 923 935 943 955 963 979 980 981 M983 1011 1019 1031
                                            1039 1051 1059 1076 1077 1078 M1080 1110 1118 1130 1138 1150 1158 1174 1175 1176
                                            M1178 1208 1216 1228 1236 1248 1253 1271 1272 1273 M1275 1305 1313 1325 1333
                                            1345 1353 1389 1390 1391 M1393 1420 1428 1440 1448 1460 1468 1505 1506 1507 M1509
                                            1541 1549 1561 1569 1581 1589 1625 1626 1627 M1629 1661 1669 1681 1689 1701 1709
                                            1746 1747 1748 M1750 1782 1787 1799 1807 1819 1827 1862 1863 1864 M1866 1898
                                            1906 1918 1926 1938 1946
      161   SUBTR-2
      162   SUBTR-3
      163   SUBTR-4
      164   SUBTR-5
      165   SUBTR-6
      166   SUBTR-7
      167   SUBTR-8
      168   SUBTR-9
      159   SUBTRACT-DATA
       39   TABLE1 . . . . . . . . . . . .  529 530 531 532 759
       45   TABLE2 . . . . . . . . . . . .  534 535 536 537 M759 761 762 763 764 773
      100   TEN
      282   TEST-COMPUTED. . . . . . . . .  510
      297   TEST-CORRECT . . . . . . . . .  512
      350   TEST-ID. . . . . . . . . . . .  M415
      270   TEST-RESULTS . . . . . . . . .  M416 434
       93   THREE
      328   TOTAL-ERROR
      102   TWENTY
      103   TWENTY-5
       92   TWO
       83   W-1
       84   W-2
       85   W-3
       86   W-4
       87   W-6
       88   W-9
       51   WRK-AN-00001 . . . . . . . . .  M600 M604 605 M781 M792 798 808 M878 M889 895 905 M974 M985 991 1001 M1071 M1082
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    44
0 Defined   Cross-reference of data names   References

0                                           M1084 1090 1100 M1169 M1180 M1182 1188 1198 M1265 M1277 1285 1295 1374 M1383
                                            M1395 1403 1410 1490 M1499 M1511 M1513 1521 1531 1610 M1619 M1631 M1633 1641
                                            1651 1731 M1740 M1752 M1754 1762 1772 1848 M1857 M1868 M1870 1878 1888 1968
       53   WRK-DS-01V00
       54   WRK-DS-02V00
       67   WRK-DS-0201P
       65   WRK-DS-03V00
       68   WRK-DS-03V10
       56   WRK-DS-05V00
       66   WRK-DS-06V00
       55   WRK-DS-06V06
      104   WRK-DS-09V00
       58   WRK-DS-09V09 . . . . . . . . .  59
       62   WRK-DS-18V00
       59   WRK-DS-18V00-S
       52   WRK-XN-00001 . . . . . . . . .  M1266 M1279 1364 M1384 M1397 1480 M1500 M1515 1600 M1620 M1635 1721 M1741 M1756
                                            1838 M1872 1958
      399   XXCOMPUTED . . . . . . . . . .  M519
      401   XXCORRECT. . . . . . . . . . .  M519
      394   XXINFO . . . . . . . . . . . .  506 521
      180   XYZ-1. . . . . . . . . . . . .  M699 M718 738
      187   XYZ-1. . . . . . . . . . . . .  679
      199   XYZ-1. . . . . . . . . . . . .  M679
      208   XYZ-1. . . . . . . . . . . . .  M738
      219   XYZ-1. . . . . . . . . . . . .  699 718
      223   XYZ-1
      201   XYZ-11
      213   XYZ-11
      216   XYZ-11
      225   XYZ-11
      202   XYZ-12
      214   XYZ-12
      217   XYZ-12
      203   XYZ-13
      210   XYZ-13
      204   XYZ-14
      211   XYZ-14
      205   XYZ-15
      206   XYZ-16
      181   XYZ-2. . . . . . . . . . . . .  M699 M718 738
      188   XYZ-2. . . . . . . . . . . . .  679
      198   XYZ-2. . . . . . . . . . . . .  M679
      209   XYZ-2. . . . . . . . . . . . .  M738
      220   XYZ-2. . . . . . . . . . . . .  699 718
      226   XYZ-2
      182   XYZ-3
      189   XYZ-3. . . . . . . . . . . . .  679
      195   XYZ-3. . . . . . . . . . . . .  M679
      183   XYZ-4
      190   XYZ-4. . . . . . . . . . . . .  679
      194   XYZ-4. . . . . . . . . . . . .  M679
      184   XYZ-5
      191   XYZ-5. . . . . . . . . . . . .  679
      197   XYZ-5. . . . . . . . . . . . .  M679
      185   XYZ-6
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    45
0 Defined   Cross-reference of data names   References

0     192   XYZ-6. . . . . . . . . . . . .  679
      196   XYZ-6. . . . . . . . . . . . .  M679
      224   XYZ-6
      227   42-DATANAMES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    46
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

      515   BAIL-OUT . . . . . . . . . . .  P437
      523   BAIL-OUT-EX. . . . . . . . . .  E437 G517
      518   BAIL-OUT-WRITE . . . . . . . .  G516
      499   BLANK-LINE-PRINT
      528   BUILD-TABLE1 . . . . . . . . .  P756
      533   BUILD-TABLE2 . . . . . . . . .  P757
     1973   CCVS-EXIT
     1974   CCVS-999999
      412   CCVS1
      524   CCVS1-EXIT . . . . . . . . . .  G418
      419   CLOSE-FILES. . . . . . . . . .  G1975
      447   COLUMN-NAMES-ROUTINE . . . . .  E417
      428   DE-LETE. . . . . . . . . . . .  P562 P582 P610 P626 P645 P664 P685 P705 P724 P744 P769 P803 P823 P843 P863 P900
                                            P920 P940 P960 P996 P1016 P1036 P1056 P1095 P1115 P1135 P1155 P1193 P1213 P1233
                                            P1290 P1310 P1330 P1350 P1369 P1425 P1445 P1465 P1485 P1526 P1546 P1566 P1586
                                            P1605 P1646 P1666 P1686 P1706 P1726 P1767 P1804 P1824 P1843 P1883 P1903 P1923
                                            P1943 P1963
      451   END-ROUTINE. . . . . . . . . .  P420 P540
      455   END-ROUTINE-1
      464   END-ROUTINE-12
      472   END-ROUTINE-13 . . . . . . . .  E420
      453   END-RTN-EXIT
      427   FAIL . . . . . . . . . . . . .  P567 P587 P613 P629 P648 P667 P690 P710 P729 P747 P772 P810 P830 P850 P870 P907
                                            P927 P947 P966 P1003 P1023 P1043 P1063 P1102 P1122 P1142 P1161 P1200 P1220 P1240
                                            P1257 P1297 P1317 P1337 P1356 P1375 P1412 P1432 P1452 P1472 P1491 P1533 P1553
                                            P1573 P1592 P1611 P1653 P1673 P1693 P1713 P1732 P1774 P1791 P1811 P1830 P1849
                                            P1890 P1910 P1930 P1950 P1969
      501   FAIL-ROUTINE . . . . . . . . .  P436
      514   FAIL-ROUTINE-EX. . . . . . . .  E436 G508
      509   FAIL-ROUTINE-WRITE . . . . . .  G502 G503
      442   HEAD-ROUTINE . . . . . . . . .  P417
      425   INSPT
      413   OPEN-FILES
      426   PASS . . . . . . . . . . . . .  P558 P578 P606 P623 P642 P661 P681 P701 P720 P740 P765 P800 P820 P840 P860 P897
                                            P917 P937 P957 P993 P1013 P1033 P1053 P1092 P1112 P1132 P1152 P1190 P1210 P1230
                                            P1250 P1287 P1307 P1327 P1347 P1366 P1405 P1422 P1442 P1462 P1482 P1523 P1543
                                            P1563 P1583 P1602 P1643 P1663 P1683 P1703 P1723 P1764 P1784 P1801 P1821 P1840
                                            P1880 P1900 P1920 P1940 P1960
      430   PRINT-DETAIL . . . . . . . . .  P569 P589 P616 P635 P654 P672 P692 P712 P731 P751 P776 P812 P832 P852 P872 P909
                                            P929 P949 P968 P1005 P1025 P1045 P1065 P1104 P1124 P1144 P1163 P1202 P1222 P1242
                                            P1259 P1299 P1319 P1339 P1358 P1377 P1414 P1434 P1454 P1474 P1493 P1535 P1555
                                            P1575 P1594 P1613 P1655 P1675 P1695 P1715 P1734 P1776 P1793 P1813 P1832 P1851
                                            P1892 P1912 P1932 P1952 P1971
      527   SECT-NC253A-001
      561   SUB-DELETE-F3-1
      899   SUB-DELETE-F3-10-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    47
0 Defined   Cross-reference of procedures   References

0     919   SUB-DELETE-F3-10-2
      939   SUB-DELETE-F3-10-3
      959   SUB-DELETE-F3-10-4
      995   SUB-DELETE-F3-11-1
     1015   SUB-DELETE-F3-11-2
     1035   SUB-DELETE-F3-11-3
     1055   SUB-DELETE-F3-11-4
     1094   SUB-DELETE-F3-12-1
     1114   SUB-DELETE-F3-12-2
     1134   SUB-DELETE-F3-12-3
     1154   SUB-DELETE-F3-12-4
     1192   SUB-DELETE-F3-13-1
     1212   SUB-DELETE-F3-13-2
     1232   SUB-DELETE-F3-13-3
     1289   SUB-DELETE-F3-14-1
     1309   SUB-DELETE-F3-14-2
     1329   SUB-DELETE-F3-14-3
     1349   SUB-DELETE-F3-14-4
     1368   SUB-DELETE-F3-14-5
     1424   SUB-DELETE-F3-15-2
     1444   SUB-DELETE-F3-15-3
     1464   SUB-DELETE-F3-15-4
     1484   SUB-DELETE-F3-15-5
     1525   SUB-DELETE-F3-16-1
     1545   SUB-DELETE-F3-16-2
     1565   SUB-DELETE-F3-16-3
     1585   SUB-DELETE-F3-16-4
     1604   SUB-DELETE-F3-16-5
     1645   SUB-DELETE-F3-17-1
     1665   SUB-DELETE-F3-17-2
     1685   SUB-DELETE-F3-17-3
     1705   SUB-DELETE-F3-17-4
     1725   SUB-DELETE-F3-17-5
     1766   SUB-DELETE-F3-18-1
     1803   SUB-DELETE-F3-18-3
     1823   SUB-DELETE-F3-18-4
     1842   SUB-DELETE-F3-18-5
     1882   SUB-DELETE-F3-19-1
     1902   SUB-DELETE-F3-19-2
     1922   SUB-DELETE-F3-19-3
     1942   SUB-DELETE-F3-19-4
     1962   SUB-DELETE-F3-19-5
      581   SUB-DELETE-F3-2
      609   SUB-DELETE-F3-3-1
      625   SUB-DELETE-F3-3-2
      644   SUB-DELETE-F3-3-3
      684   SUB-DELETE-F3-4
      704   SUB-DELETE-F3-5
      723   SUB-DELETE-F3-6
      743   SUB-DELETE-F3-7
      768   SUB-DELETE-F3-8
      802   SUB-DELETE-F3-9-1
      822   SUB-DELETE-F3-9-2
      842   SUB-DELETE-F3-9-3
      862   SUB-DELETE-F3-9-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    48
0 Defined   Cross-reference of procedures   References

0     663   SUB-DELETE-3-3-4
      564   SUB-FAIL-F3-1. . . . . . . . .  G560
      902   SUB-FAIL-F3-10-1 . . . . . . .  G896
      922   SUB-FAIL-F3-10-2 . . . . . . .  G916
      942   SUB-FAIL-F3-10-3 . . . . . . .  G936
      962   SUB-FAIL-F3-10-4 . . . . . . .  G956
      998   SUB-FAIL-F3-11-1 . . . . . . .  G992
     1018   SUB-FAIL-F3-11-2 . . . . . . .  G1012
     1038   SUB-FAIL-F3-11-3 . . . . . . .  G1032
     1058   SUB-FAIL-F3-11-4 . . . . . . .  G1052
     1097   SUB-FAIL-F3-12-1 . . . . . . .  G1091
     1117   SUB-FAIL-F3-12-2 . . . . . . .  G1111
     1137   SUB-FAIL-F3-12-3 . . . . . . .  G1131
     1157   SUB-FAIL-F3-12-4 . . . . . . .  G1151
     1195   SUB-FAIL-F3-13-1 . . . . . . .  G1189
     1215   SUB-FAIL-F3-13-2 . . . . . . .  G1209
     1235   SUB-FAIL-F3-13-3 . . . . . . .  G1229
     1252   SUB-FAIL-F3-13-4 . . . . . . .  G1249
     1292   SUB-FAIL-F3-14-1 . . . . . . .  G1286
     1312   SUB-FAIL-F3-14-2 . . . . . . .  G1306
     1332   SUB-FAIL-F3-14-3 . . . . . . .  G1326
     1352   SUB-FAIL-F3-14-4 . . . . . . .  G1346
     1371   SUB-FAIL-F3-14-5 . . . . . . .  G1365
     1407   SUB-FAIL-F3-15-1 . . . . . . .  G1404
     1427   SUB-FAIL-F3-15-2 . . . . . . .  G1421
     1447   SUB-FAIL-F3-15-3 . . . . . . .  G1441
     1467   SUB-FAIL-F3-15-4 . . . . . . .  G1461
     1487   SUB-FAIL-F3-15-5 . . . . . . .  G1481
     1528   SUB-FAIL-F3-16-1 . . . . . . .  G1522
     1548   SUB-FAIL-F3-16-2 . . . . . . .  G1542
     1568   SUB-FAIL-F3-16-3 . . . . . . .  G1562
     1588   SUB-FAIL-F3-16-4 . . . . . . .  G1582
     1607   SUB-FAIL-F3-16-5 . . . . . . .  G1601
     1648   SUB-FAIL-F3-17-1 . . . . . . .  G1642
     1668   SUB-FAIL-F3-17-2 . . . . . . .  G1662
     1688   SUB-FAIL-F3-17-3 . . . . . . .  G1682
     1708   SUB-FAIL-F3-17-4 . . . . . . .  G1702
     1728   SUB-FAIL-F3-17-5 . . . . . . .  G1722
     1769   SUB-FAIL-F3-18-1 . . . . . . .  G1763
     1786   SUB-FAIL-F3-18-2 . . . . . . .  G1783
     1806   SUB-FAIL-F3-18-3 . . . . . . .  G1800
     1826   SUB-FAIL-F3-18-4 . . . . . . .  G1820
     1845   SUB-FAIL-F3-18-5 . . . . . . .  G1839
     1885   SUB-FAIL-F3-19-1 . . . . . . .  G1879
     1905   SUB-FAIL-F3-19-2 . . . . . . .  G1899
     1925   SUB-FAIL-F3-19-3 . . . . . . .  G1919
     1945   SUB-FAIL-F3-19-4 . . . . . . .  G1939
     1965   SUB-FAIL-F3-19-5 . . . . . . .  G1959
      584   SUB-FAIL-F3-2. . . . . . . . .  G580
      612   SUB-FAIL-F3-3-1. . . . . . . .  G608
      628   SUB-FAIL-F3-3-2. . . . . . . .  G622
      647   SUB-FAIL-F3-3-3. . . . . . . .  G641
      687   SUB-FAIL-F3-4. . . . . . . . .  G683
      707   SUB-FAIL-F3-5. . . . . . . . .  G703
      726   SUB-FAIL-F3-6. . . . . . . . .  G722
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    49
0 Defined   Cross-reference of procedures   References

0     746   SUB-FAIL-F3-7. . . . . . . . .  G742
      771   SUB-FAIL-F3-8. . . . . . . . .  G767
      805   SUB-FAIL-F3-9-1. . . . . . . .  G799
      825   SUB-FAIL-F3-9-2. . . . . . . .  G819
      845   SUB-FAIL-F3-9-3. . . . . . . .  G839
      865   SUB-FAIL-F3-9-4. . . . . . . .  G859
      666   SUB-FAIL-3-3-4 . . . . . . . .  G660
      539   SUB-INIT-F3-1
      874   SUB-INIT-F3-10
      891   SUB-INIT-F3-10-1
      911   SUB-INIT-F3-10-2
      931   SUB-INIT-F3-10-3
      951   SUB-INIT-F3-10-4
      970   SUB-INIT-F3-11
      987   SUB-INIT-F3-11-1
     1007   SUB-INIT-F3-11-2
     1027   SUB-INIT-F3-11-3
     1047   SUB-INIT-F3-11-4
     1067   SUB-INIT-F3-12
     1086   SUB-INIT-F3-12-1
     1106   SUB-INIT-F3-12-2
     1126   SUB-INIT-F3-12-3
     1146   SUB-INIT-F3-12-4
     1165   SUB-INIT-F3-13
     1184   SUB-INIT-F3-13-1
     1204   SUB-INIT-F3-13-2
     1224   SUB-INIT-F3-13-3
     1244   SUB-INIT-F3-13-4
     1261   SUB-INIT-F3-14
     1281   SUB-INIT-F3-14-1
     1301   SUB-INIT-F3-14-2
     1321   SUB-INIT-F3-14-3
     1341   SUB-INIT-F3-14-4
     1360   SUB-INIT-F3-14-5
     1379   SUB-INIT-F3-15
     1399   SUB-INIT-F3-15-1
     1416   SUB-INIT-F3-15-2
     1436   SUB-INIT-F3-15-3
     1456   SUB-INIT-F3-15-4
     1476   SUB-INIT-F3-15-5
     1495   SUB-INIT-F3-16
     1517   SUB-INIT-F3-16-1
     1537   SUB-INIT-F3-16-2
     1557   SUB-INIT-F3-16-3
     1577   SUB-INIT-F3-16-4
     1596   SUB-INIT-F3-16-5
     1615   SUB-INIT-F3-17
     1637   SUB-INIT-F3-17-1
     1657   SUB-INIT-F3-17-2
     1677   SUB-INIT-F3-17-3
     1697   SUB-INIT-F3-17-4
     1717   SUB-INIT-F3-17-5
     1736   SUB-INIT-F3-18
     1758   SUB-INIT-F3-18-1
     1778   SUB-INIT-F3-18-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    50
0 Defined   Cross-reference of procedures   References

0    1795   SUB-INIT-F3-18-3
     1815   SUB-INIT-F3-18-4
     1834   SUB-INIT-F3-18-5
     1853   SUB-INIT-F3-19
     1874   SUB-INIT-F3-19-1
     1894   SUB-INIT-F3-19-2
     1914   SUB-INIT-F3-19-3
     1934   SUB-INIT-F3-19-4
     1954   SUB-INIT-F3-19-5
      571   SUB-INIT-F3-2
      591   SUB-INIT-F3-3
      598   SUB-INIT-F3-3-1
      618   SUB-INIT-F3-3-2
      637   SUB-INIT-F3-3-3
      674   SUB-INIT-F3-4
      694   SUB-INIT-F3-5
      714   SUB-INIT-F3-6
      733   SUB-INIT-F3-7
      753   SUB-INIT-F3-8
      778   SUB-INIT-F3-9
      794   SUB-INIT-F3-9-1
      814   SUB-INIT-F3-9-2
      834   SUB-INIT-F3-9-3
      854   SUB-INIT-F3-9-4
      656   SUB-INIT-3-3-4
      554   SUB-TEST-F3-1
      886   SUB-TEST-F3-10-0
      894   SUB-TEST-F3-10-1
      914   SUB-TEST-F3-10-2
      934   SUB-TEST-F3-10-3
      954   SUB-TEST-F3-10-4
      982   SUB-TEST-F3-11-0
      990   SUB-TEST-F3-11-1
     1010   SUB-TEST-F3-11-2
     1030   SUB-TEST-F3-11-3
     1050   SUB-TEST-F3-11-4
     1079   SUB-TEST-F3-12-0
     1089   SUB-TEST-F3-12-1
     1109   SUB-TEST-F3-12-2
     1129   SUB-TEST-F3-12-3
     1149   SUB-TEST-F3-12-4
     1177   SUB-TEST-F3-13-0
     1187   SUB-TEST-F3-13-1
     1207   SUB-TEST-F3-13-2
     1227   SUB-TEST-F3-13-3
     1247   SUB-TEST-F3-13-4
     1274   SUB-TEST-F3-14-0
     1284   SUB-TEST-F3-14-1
     1304   SUB-TEST-F3-14-2
     1324   SUB-TEST-F3-14-3
     1344   SUB-TEST-F3-14-4
     1363   SUB-TEST-F3-14-5
     1392   SUB-TEST-F3-15-0
     1402   SUB-TEST-F3-15-1
     1419   SUB-TEST-F3-15-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    51
0 Defined   Cross-reference of procedures   References

0    1439   SUB-TEST-F3-15-3
     1459   SUB-TEST-F3-15-4
     1479   SUB-TEST-F3-15-5
     1508   SUB-TEST-F3-16-0
     1520   SUB-TEST-F3-16-1
     1540   SUB-TEST-F3-16-2
     1560   SUB-TEST-F3-16-3
     1580   SUB-TEST-F3-16-4
     1599   SUB-TEST-F3-16-5
     1628   SUB-TEST-F3-17-0
     1640   SUB-TEST-F3-17-1
     1660   SUB-TEST-F3-17-2
     1680   SUB-TEST-F3-17-3
     1700   SUB-TEST-F3-17-4
     1720   SUB-TEST-F3-17-5
     1749   SUB-TEST-F3-18-0
     1761   SUB-TEST-F3-18-1
     1781   SUB-TEST-F3-18-2
     1798   SUB-TEST-F3-18-3
     1818   SUB-TEST-F3-18-4
     1837   SUB-TEST-F3-18-5
     1865   SUB-TEST-F3-19-0
     1877   SUB-TEST-F3-19-1
     1897   SUB-TEST-F3-19-2
     1917   SUB-TEST-F3-19-3
     1937   SUB-TEST-F3-19-4
     1957   SUB-TEST-F3-19-5
      574   SUB-TEST-F3-2
      601   SUB-TEST-F3-3-1
      620   SUB-TEST-F3-3-2
      639   SUB-TEST-F3-3-3
      678   SUB-TEST-F3-4
      698   SUB-TEST-F3-5
      717   SUB-TEST-F3-6
      737   SUB-TEST-F3-7
      758   SUB-TEST-F3-8-0
      760   SUB-TEST-F3-8-1
      789   SUB-TEST-F3-9-0
      797   SUB-TEST-F3-9-1
      817   SUB-TEST-F3-9-2
      837   SUB-TEST-F3-9-3
      857   SUB-TEST-F3-9-4
      658   SUB-TEST-3-3-4
      568   SUB-WRITE-F3-1 . . . . . . . .  G559 G563
      908   SUB-WRITE-F3-10-1. . . . . . .  G898 G901
      928   SUB-WRITE-F3-10-2. . . . . . .  G918 G921
      948   SUB-WRITE-F3-10-3. . . . . . .  G938 G941
      967   SUB-WRITE-F3-10-4. . . . . . .  G958 G961
     1004   SUB-WRITE-F3-11-1. . . . . . .  G994 G997
     1024   SUB-WRITE-F3-11-2. . . . . . .  G1014 G1017
     1044   SUB-WRITE-F3-11-3. . . . . . .  G1034 G1037
     1064   SUB-WRITE-F3-11-4. . . . . . .  G1054 G1057
     1103   SUB-WRITE-F3-12-1. . . . . . .  G1093 G1096
     1123   SUB-WRITE-F3-12-2. . . . . . .  G1113 G1116
     1143   SUB-WRITE-F3-12-3. . . . . . .  G1133 G1136
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    52
0 Defined   Cross-reference of procedures   References

0    1162   SUB-WRITE-F3-12-4. . . . . . .  G1153 G1156
     1201   SUB-WRITE-F3-13-1. . . . . . .  G1191 G1194
     1221   SUB-WRITE-F3-13-2. . . . . . .  G1211 G1214
     1241   SUB-WRITE-F3-13-3. . . . . . .  G1231 G1234
     1258   SUB-WRITE-F3-13-4. . . . . . .  G1251
     1298   SUB-WRITE-F3-14-1. . . . . . .  G1288 G1291
     1318   SUB-WRITE-F3-14-2. . . . . . .  G1308 G1311
     1338   SUB-WRITE-F3-14-3. . . . . . .  G1328 G1331
     1357   SUB-WRITE-F3-14-4. . . . . . .  G1348 G1351
     1376   SUB-WRITE-F3-14-5. . . . . . .  G1367 G1370
     1413   SUB-WRITE-F3-15-1. . . . . . .  G1406
     1433   SUB-WRITE-F3-15-2. . . . . . .  G1423 G1426
     1453   SUB-WRITE-F3-15-3. . . . . . .  G1443 G1446
     1473   SUB-WRITE-F3-15-4. . . . . . .  G1463 G1466
     1492   SUB-WRITE-F3-15-5. . . . . . .  G1483 G1486
     1534   SUB-WRITE-F3-16-1. . . . . . .  G1524 G1527
     1554   SUB-WRITE-F3-16-2. . . . . . .  G1544 G1547
     1574   SUB-WRITE-F3-16-3. . . . . . .  G1564 G1567
     1593   SUB-WRITE-F3-16-4. . . . . . .  G1584 G1587
     1612   SUB-WRITE-F3-16-5. . . . . . .  G1603 G1606
     1654   SUB-WRITE-F3-17-1. . . . . . .  G1644 G1647
     1674   SUB-WRITE-F3-17-2. . . . . . .  G1664 G1667
     1694   SUB-WRITE-F3-17-3. . . . . . .  G1684 G1687
     1714   SUB-WRITE-F3-17-4. . . . . . .  G1704 G1707
     1733   SUB-WRITE-F3-17-5. . . . . . .  G1724 G1727
     1775   SUB-WRITE-F3-18-1. . . . . . .  G1765 G1768
     1792   SUB-WRITE-F3-18-2. . . . . . .  G1785
     1812   SUB-WRITE-F3-18-3. . . . . . .  G1802 G1805
     1831   SUB-WRITE-F3-18-4. . . . . . .  G1822 G1825
     1850   SUB-WRITE-F3-18-5. . . . . . .  G1841 G1844
     1891   SUB-WRITE-F3-19-1. . . . . . .  G1881 G1884
     1911   SUB-WRITE-F3-19-2. . . . . . .  G1901 G1904
     1931   SUB-WRITE-F3-19-3. . . . . . .  G1921 G1924
     1951   SUB-WRITE-F3-19-4. . . . . . .  G1941 G1944
     1970   SUB-WRITE-F3-19-5. . . . . . .  G1961 G1964
      588   SUB-WRITE-F3-2 . . . . . . . .  G579 G583
      615   SUB-WRITE-F3-3-1 . . . . . . .  G607 G611
      634   SUB-WRITE-F3-3-2 . . . . . . .  G624 G627
      653   SUB-WRITE-F3-3-3 . . . . . . .  G643 G646
      691   SUB-WRITE-F3-4 . . . . . . . .  G682 G686
      711   SUB-WRITE-F3-5 . . . . . . . .  G702 G706
      730   SUB-WRITE-F3-6 . . . . . . . .  G721 G725
      750   SUB-WRITE-F3-7 . . . . . . . .  G741 G745
      775   SUB-WRITE-F3-8 . . . . . . . .  G766 G770
      811   SUB-WRITE-F3-9-1 . . . . . . .  G801 G804
      831   SUB-WRITE-F3-9-2 . . . . . . .  G821 G824
      851   SUB-WRITE-F3-9-3 . . . . . . .  G841 G844
      871   SUB-WRITE-F3-9-4 . . . . . . .  G861 G864
      671   SUB-WRITE-3-3-4. . . . . . . .  G662 G665
      423   TERMINATE-CALL
      421   TERMINATE-CCVS
      484   WRITE-LINE . . . . . . . . . .  P434 P435 P443 P444 P445 P446 P448 P449 P450 P452 P454 P463 P471 P477 P482 P483
                                            P506 P510 P512 P521
      496   WRT-LN . . . . . . . . . . . .  P490 P491 P492 P495 P500
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    53
0 Defined   Cross-reference of programs     References

        3   NC253A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC253A    Date 06/04/2022  Time 12:00:35   Page    54
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    555  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "FILLER" within "GRP-FOR-ADD-CORR-1" did not qualify
                       according to the rules for the "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

    699  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "FILLER" within "CORR-DATA-6" did not qualify according to
                       the rules for the "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

                       Same message on line:    699    718    718

    759  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "RECORD2" within "TABLE1" did not qualify according to the
                       rules for the "CORRESPONDING" phrase.  Subordinate item "RECORD2" was ignored.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       7           1              6
-* Statistics for COBOL program NC253A:
 *    Source records = 1975
 *    Data Division statements = 284
 *    Procedure Division statements = 1081
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1100
0End of compilation 1,  program NC253A,  highest severity 4.
0Return code 4
