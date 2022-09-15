1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:15   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:15   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2024.2
   000002         000200 PROGRAM-ID.                                                      NC2024.2
   000003         000300     NC202A.                                                      NC2024.2
   000004         000400                                                                  NC2024.2
   000005         000600*                                                              *  NC2024.2
   000006         000700*    VALIDATION FOR:-                                          *  NC2024.2
   000007         000800*                                                              *  NC2024.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2024.2
   000009         001000*                                                              *  NC2024.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2024.2
   000011         001200*                                                              *  NC2024.2
   000012         001400*                                                              *  NC2024.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2024.2
   000014         001600*                                                              *  NC2024.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC2024.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC2024.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC2024.2
   000018         002000*                                                              *  NC2024.2
   000019         002200*                                                                 NC2024.2
   000020         002300*    PROGRAM NC202A TESTS FORMAT3 OF THE ADD STATEMENT.           NC2024.2
   000021         002400*                                                                 NC2024.2
   000022         002500 ENVIRONMENT DIVISION.                                            NC2024.2
   000023         002600 CONFIGURATION SECTION.                                           NC2024.2
   000024         002700 SOURCE-COMPUTER.                                                 NC2024.2
   000025         002800     XXXXX082.                                                    NC2024.2
   000026         002900 OBJECT-COMPUTER.                                                 NC2024.2
   000027         003000     XXXXX083.                                                    NC2024.2
   000028         003100 INPUT-OUTPUT SECTION.                                            NC2024.2
   000029         003200 FILE-CONTROL.                                                    NC2024.2
   000030         003300     SELECT PRINT-FILE ASSIGN TO                                  NC2024.2 34
   000031         003400     XXXXX055.                                                    NC2024.2
   000032         003500 DATA DIVISION.                                                   NC2024.2
   000033         003600 FILE SECTION.                                                    NC2024.2
   000034         003700 FD  PRINT-FILE.                                                  NC2024.2

 ==000034==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000035         003800 01  PRINT-REC PICTURE X(120).                                    NC2024.2
   000036         003900 01  DUMMY-RECORD PICTURE X(120).                                 NC2024.2
   000037         004000 WORKING-STORAGE SECTION.                                         NC2024.2
   000038         004100 01  TABLE1.                                                      NC2024.2
   000039         004200     02  RECORD1                 PICTURE 99.                      NC2024.2
   000040         004300     02  RECORD2                 PICTURE 99                       NC2024.2
   000041         004400                                 OCCURS 2 TIMES                   NC2024.2
   000042         004500                                 INDEXED BY INDEX1.               NC2024.2
   000043         004600     02  RECORD3                 PICTURE 99.                      NC2024.2
   000044         004700 01  TABLE2.                                                      NC2024.2
   000045         004800     02  RECORD1                 PICTURE 99.                      NC2024.2
   000046         004900     02  RECORD2                 PICTURE 99                       NC2024.2
   000047         005000                                 OCCURS 2 TIMES                   NC2024.2
   000048         005100                                 INDEXED BY INDEX2.               NC2024.2
   000049         005200     02  RECORD3                 PICTURE 99.                      NC2024.2
   000050         005300 77  WRK-AN-00001                PICTURE X.                       NC2024.2
   000051         005400 77  WRK-XN-00001                PICTURE X.                       NC2024.2
   000052         005500 77  WRK-DS-01V00                PICTURE S9.                      NC2024.2
   000053         005600 77  WRK-DS-02V00                PICTURE S99.                     NC2024.2
   000054         005700 77  WRK-DS-06V06                PICTURE S9(6)V9(6).              NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  WRK-DS-05V00                PICTURE S9(5).                   NC2024.2
   000056         005900 77  AZERO-DS-05V05              PICTURE S9(5)V9(5) VALUE ZERO.   NC2024.2 IMP
   000057         006000 77  WRK-DS-09V09                PICTURE S9(9)V9(9).              NC2024.2
   000058         006100 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09 PICTURE S9(18).        NC2024.2 57
   000059         006200 77  A18ONES-DS-09V09            PICTURE S9(9)V9(9)               NC2024.2
   000060         006300                                 VALUE 111111111.111111111.       NC2024.2
   000061         006400 77  WRK-DS-18V00       PICTURE S9(18) VALUE 111111111111111111.  NC2024.2
   000062         006500 77  A05ONES-DS-05V00            PICTURE S9(5) VALUE 11111.       NC2024.2
   000063         006600 77  A99-DS-02V00                PICTURE S99   VALUE 99.          NC2024.2
   000064         006700 77  WRK-DS-03V00                PICTURE S999.                    NC2024.2
   000065         006800 77  WRK-DS-06V00                PICTURE S9(6).                   NC2024.2
   000066         006900 77  WRK-DS-0201P                PICTURE S99P.                    NC2024.2
   000067         007000 77  WRK-DS-03V10                PICTURE S9(3)V9(10).             NC2024.2
   000068         007100 77  ADD-1                   PICTURE S9(8)V99  VALUE 1.           NC2024.2
   000069         007200 77  ADD-2                   PICTURE S9(6)V9(4) VALUE 1.          NC2024.2
   000070         007300 77  ADD-3                   PICTURE S9(5)     VALUE -1.          NC2024.2
   000071         007400 77  ADD-4                   PICTURE 9         VALUE 9.           NC2024.2
   000072         007500 77  ADD-5                   PICTURE 9         VALUE 9.           NC2024.2
   000073         007600 77  ADD-6                   PICTURE 9(5)      VALUE 99999.       NC2024.2
   000074         007700 77  ADD-7                   PICTURE 9         VALUE 1.           NC2024.2
   000075         007800 77  ADD-8                   PICTURE 9.                           NC2024.2
   000076         007900 77  ADD-9                   PICTURE S9(8)V99  VALUE 5.9.         NC2024.2
   000077         008000 77  ADD-10                  PICTURE 9(5)      VALUE 52800.       NC2024.2
   000078         008100 77  ADD-11                  PICTURE 99999.                       NC2024.2
   000079         008200 77  ADD-12                  PICTURE PP9       VALUE .001.        NC2024.2
   000080         008300 77  ADD-13                  PICTURE 9PP       VALUE 100.         NC2024.2
   000081         008400 77  ADD-14                  PICTURE 999V999.                     NC2024.2
   000082         008500 77  W-1                     PICTURE IS 9.                        NC2024.2
   000083         008600 77  W-2                     PICTURE IS 99.                       NC2024.2
   000084         008700 77  W-3                     PICTURE IS 999.                      NC2024.2
   000085         008800 77  W-4                PICTURE 9  VALUE 0.                       NC2024.2
   000086         008900 77  W-6                     PICTURE IS 999    VALUE IS ZERO.     NC2024.2 IMP
   000087         009000 77  W-9                     PICTURE 999.                         NC2024.2
   000088         009100 77  D-5                PICTURE S999  VALUE -1.                   NC2024.2
   000089         009200 77  D-9                PICTURE 9(4)V9(4)  VALUE 111.1189.        NC2024.2
   000090         009300 77  ONE                PICTURE 9  VALUE 1.                       NC2024.2
   000091         009400 77  TWO                PICTURE S9  VALUE 2.                      NC2024.2
   000092         009500 77  THREE              PICTURE S9  VALUE 3.                      NC2024.2
   000093         009600 77  FOUR               PICTURE S9  VALUE 4.                      NC2024.2
   000094         009700 77  FIVE               PICTURE S9  VALUE 5.                      NC2024.2
   000095         009800 77  SIX                PICTURE S9  VALUE 6.                      NC2024.2
   000096         009900 77  SEVEN              PICTURE S9  VALUE 7.                      NC2024.2
   000097         010000 77  EIGHT              PICTURE 9  VALUE 8.                       NC2024.2
   000098         010100 77  NINE               PICTURE S9  VALUE 9.                      NC2024.2
   000099         010200 77  TEN                PICTURE S99  VALUE 10.                    NC2024.2
   000100         010300 77  FIFTEEN            PICTURE S99  VALUE 15.                    NC2024.2
   000101         010400 77  TWENTY             PICTURE S99  VALUE 20.                    NC2024.2
   000102         010500 77  TWENTY-5           PICTURE S99  VALUE 25.                    NC2024.2
   000103         010600 01  WRK-DS-09V00                 PICTURE S9(9)  VALUE ZERO.      NC2024.2 IMP
   000104         010700 01  GRP-FOR-ADD-CORR-1.                                          NC2024.2
   000105         010800     02  GRP-SUBTRACT-CORR-1.                                     NC2024.2
   000106         010900     03  FILLER                  PICTURE S99  VALUE 91.           NC2024.2
   000107         011000     03  ADD-CORR-2              PICTURE S99  VALUE 22.           NC2024.2
   000108         011100     03  ADD-CORR-1              PICTURE S99 VALUE 11.            NC2024.2
   000109         011200     03  ADD-CORR-A              PICTURE S99 VALUE 93.            NC2024.2
   000110         011300     03  ADD-CORR-4              PICTURE S99 VALUE 44.            NC2024.2
   000111         011400     03  ADD-CORR-3              PICTURE S99 VALUE 33.            NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     03  ADD-CORR-6              PICTURE S99 VALUE 66.            NC2024.2
   000113         011600     03  ADD-CORR-5              PICTURE S99 VALUE 55.            NC2024.2
   000114         011700     03  ADD-CORR-8              PICTURE S99 VALUE 88.            NC2024.2
   000115         011800     03  ADD-CORR-7              PICTURE S99 VALUE 77.            NC2024.2
   000116         011900     03  ADD-CORR-9              PICTURE S99 VALUE 99.            NC2024.2
   000117         012000 01  GRP-FOR-ADD-CORR-R.                                          NC2024.2
   000118         012100     02  GRP-SUBTRACT-CORR-1.                                     NC2024.2
   000119         012200     05  ADD-CORR-1              PICTURE 99.                      NC2024.2
   000120         012300     05  ADD-CORR-2              PICTURE 99.                      NC2024.2
   000121         012400     05  ADD-CORR-3              PICTURE 99.                      NC2024.2
   000122         012500     05  ADD-CORR-4              PICTURE 99.                      NC2024.2
   000123         012600     05  ADD-CORR-5              PICTURE 9P.                      NC2024.2
   000124         012700     05  ADD-CORR-6              PICTURE 999.                     NC2024.2
   000125         012800     05  ADD-CORR-7              PICTURE 99.                      NC2024.2
   000126         012900     05  ADD-CORR-8              PICTURE 99.                      NC2024.2
   000127         013000     05  ADD-CORR-9              PICTURE 99.                      NC2024.2
   000128         013100     05  FILLER                  PICTURE 99.                      NC2024.2
   000129         013200 01  GRP-FOR-ADD-CORR-2.                                          NC2024.2
   000130         013300     02  GRP-ADD-SUB-CORR.                                        NC2024.2
   000131         013400     03  GRP-SUBTRACT-CORR-1.                                     NC2024.2
   000132         013500     04  ADD-CORR-1              PICTURE S99  VALUE 11.           NC2024.2
   000133         013600     04  ADD-CORR-2              PICTURE S99  VALUE 22.           NC2024.2
   000134         013700     04  ADD-CORR-5              PICTURE S99  VALUE 55.           NC2024.2
   000135         013800     04  ADD-CORR-4              PICTURE S99  VALUE 44.           NC2024.2
   000136         013900     04  ADD-CORR-3              PICTURE S99  VALUE 33.           NC2024.2
   000137         014000     04  ADD-CORR-6              PICTURE S99  VALUE 66.           NC2024.2
   000138         014100     04  ADD-CORR-7              PICTURE S99  VALUE 77.           NC2024.2
   000139         014200     04  ADD-CORR-8              PICTURE S99  VALUE 88.           NC2024.2
   000140         014300     04  ADD-CORR-9              PICTURE S99  VALUE 99.           NC2024.2
   000141         014400     04  ADD-CORR-B              PICTURE S99  VALUE 92.           NC2024.2
   000142         014500     04  ADD-CORR-0              PICTURE S99  VALUE 00.           NC2024.2
   000143         014600 01  GRP-FOR-ADD-CORR-A.                                          NC2024.2
   000144         014700     02  GRP-SUBTRACT-CORR-3.                                     NC2024.2
   000145         014800         03  GRP-SUBTRACT-CORR-1.                                 NC2024.2
   000146         014900             05  ADD-CORR-4      PICTURE S999   VALUE 044.        NC2024.2
   000147         015000             05  ADD-CORR-3      PICTURE S999   VALUE 033.        NC2024.2
   000148         015100             05  ADD-CORR-2      PICTURE S999   VALUE 022.        NC2024.2
   000149         015200             05  ADD-CORR-1      PICTURE S999   VALUE 111.        NC2024.2
   000150         015300 01  ADD-15.                                                      NC2024.2
   000151         015400     02 FIELD1               PICTURE 99999     VALUE 1.           NC2024.2
   000152         015500     02 FIELD2               PICTURE 999V99    VALUE 32.1.        NC2024.2
   000153         015600     02 FIELD3               PICTURE 999V9     VALUE 123.4.       NC2024.2
   000154         015700 01  ADD-16.                                                      NC2024.2
   000155         015800     02 FIELD1               PICTURE 99999     VALUE 99999.       NC2024.2
   000156         015900     02 FIELD2               PICTURE 999V99    VALUE 745.67.      NC2024.2
   000157         016000     02 FIELD3               PICTURE 999V9     VALUE 432.1.       NC2024.2
   000158         016100 01  SUBTRACT-DATA.                                               NC2024.2
   000159         016200     02 SUBTR-1              PICTURE 9         VALUE 1.           NC2024.2
   000160         016300     02 SUBTR-2              PICTURE S99       VALUE 99.          NC2024.2
   000161         016400     02 SUBTR-3              PICTURE S9V99     VALUE -1.          NC2024.2
   000162         016500     02 SUBTR-4              PICTURE SPP9      VALUE .001.        NC2024.2
   000163         016600     02 SUBTR-5              PICTURE S9PP      VALUE 100.         NC2024.2
   000164         016700     02  SUBTR-6                  PICTURE 9 VALUE 1.              NC2024.2
   000165         016800     02  SUBTR-7                  PICTURE S99  VALUE 99.          NC2024.2
   000166         016900     02  SUBTR-8                  PICTURE S9V99  VALUE -9.99.     NC2024.2
   000167         017000     02 SUBTR-9              PICTURE SV999.                       NC2024.2
   000168         017100     02  SUBTR-10                 PICTURE S999  VALUE 100.        NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200     02 SUBTR-11             PICTURE S999V999.                    NC2024.2
   000170         017300     02 SUBTR-12.                                                 NC2024.2
   000171         017400     03 SUBTR-13             PICTURE 9         VALUE 1.           NC2024.2
   000172         017500     03 SUBTR-14             PICTURE S9V999    VALUE -1.725.      NC2024.2
   000173         017600     03 SUBTR-15             PICTURE S99V99    VALUE 76.76.       NC2024.2
   000174         017700     02 SUBTR-16.                                                 NC2024.2
   000175         017800     03 SUBTR-13             PICTURE 9         VALUE 2.           NC2024.2
   000176         017900     03 SUBTR-14             PICTURE S9V99     VALUE .23.         NC2024.2
   000177         018000     03 SUBTR-15             PICTURE S9V99     VALUE 1.           NC2024.2
   000178         018100 01  CORR-DATA-1.                                                 NC2024.2
   000179         018200     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000180         018300     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000181         018400     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000182         018500     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000183         018600     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000184         018700     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000185         018800 01  CORR-DATA-2.                                                 NC2024.2
   000186         018900     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000187         019000     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000188         019100     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000189         019200     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000190         019300     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000191         019400     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000192         019500 01  CORR-DATA-3.                                                 NC2024.2
   000193         019600     03 XYZ-4                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000194         019700     03 XYZ-3                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000195         019800     03 XYZ-6                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000196         019900     03 XYZ-5                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000197         020000     03 XYZ-2                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000198         020100     03 XYZ-1                PICTURE IS 99     VALUE IS ZERO.     NC2024.2 IMP
   000199         020200 01  CORR-DATA-4.                                                 NC2024.2
   000200         020300     03 XYZ-11               PICTURE IS 99.                       NC2024.2
   000201         020400     03 XYZ-12               PICTURE IS 99.                       NC2024.2
   000202         020500     03 XYZ-13               PICTURE IS 99.                       NC2024.2
   000203         020600     03 XYZ-14               PICTURE IS 99.                       NC2024.2
   000204         020700     03 XYZ-15               PICTURE IS 99.                       NC2024.2
   000205         020800     03 XYZ-16               PICTURE IS 99.                       NC2024.2
   000206         020900 01  CORR-DATA-5.                                                 NC2024.2
   000207         021000     03 XYZ-1                PICTURE 99.                          NC2024.2
   000208         021100     03 XYZ-2                PICTURE 99.                          NC2024.2
   000209         021200     03 XYZ-13               PICTURE IS 99.                       NC2024.2
   000210         021300     03 XYZ-14               PICTURE IS 99.                       NC2024.2
   000211         021400     03 FILLER               PICTURE IS 99.                       NC2024.2
   000212         021500     03 XYZ-11               PICTURE IS 99.                       NC2024.2
   000213         021600     03 XYZ-12               PICTURE IS 99.                       NC2024.2
   000214         021700 01  CORR-DATA-6.                                                 NC2024.2
   000215         021800     03 XYZ-11               PICTURE IS 99.                       NC2024.2
   000216         021900     03 XYZ-12               PICTURE IS 99.                       NC2024.2
   000217         022000     03 FILLER               PICTURE IS 99.                       NC2024.2
   000218         022100     03 XYZ-1                PICTURE IS 99.                       NC2024.2
   000219         022200     03 XYZ-2                PICTURE IS 9(2).                     NC2024.2
   000220         022300     03 FILLER               PICTURE IS 99.                       NC2024.2
   000221         022400 01  CORR-DATA-7.                                                 NC2024.2
   000222         022500     02 XYZ-1                PICTURE 99V99     VALUE 10.45.       NC2024.2
   000223         022600     02 XYZ-6                PICTURE 999V9     VALUE 100.5.       NC2024.2
   000224         022700     02 XYZ-11               PICTURE 99V9      VALUE ZERO.        NC2024.2 IMP
   000225         022800     02 XYZ-2                PICTURE 99V9      VALUE 0.9.         NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 01  42-DATANAMES.                                                NC2024.2
   000227         023000     02  DNAME1   PICTURE 9      VALUE 1        COMPUTATIONAL.    NC2024.2
   000228         023100     02  DNAME2   PICTURE 99      VALUE 1  COMPUTATIONAL.         NC2024.2
   000229         023200     02  DNAME3   PICTURE 999     VALUE 1  COMPUTATIONAL.         NC2024.2
   000230         023300     02  DNAME4   PICTURE 9(4)    VALUE 1  COMPUTATIONAL.         NC2024.2
   000231         023400     02  DNAME5   PICTURE 9(5)    VALUE 1  COMPUTATIONAL.         NC2024.2
   000232         023500     02  DNAME6   PICTURE 9(6)    VALUE 1  COMPUTATIONAL.         NC2024.2
   000233         023600     02  DNAME7   PICTURE 9(7)    VALUE 1  COMPUTATIONAL.         NC2024.2
   000234         023700     02  DNAME8   PICTURE 9(8)    VALUE 1  COMPUTATIONAL.         NC2024.2
   000235         023800     02  DNAME9   PICTURE 9(9)    VALUE 1  COMPUTATIONAL.         NC2024.2
   000236         023900     02  DNAME10  PICTURE 9(10)   VALUE 1.                        NC2024.2
   000237         024000     02  DNAME11  PICTURE 9(11)   VALUE 1.                        NC2024.2
   000238         024100     02  DNAME12  PICTURE 9(12)   VALUE 1.                        NC2024.2
   000239         024200     02  DNAME13  PICTURE 9(13)   VALUE 1.                        NC2024.2
   000240         024300     02  DNAME14  PICTURE 9(14)   VALUE 1.                        NC2024.2
   000241         024400     02  DNAME15  PICTURE 9(15)   VALUE 1.                        NC2024.2
   000242         024500     02  DNAME16  PICTURE 9(16)   VALUE 1.                        NC2024.2
   000243         024600     02  DNAME17  PICTURE 9(17)   VALUE 1.                        NC2024.2
   000244         024700     02  DNAME18  PICTURE 9(18)   VALUE 1.                        NC2024.2
   000245         024800     02  DNAME19  PICTURE 9       VALUE 1.                        NC2024.2
   000246         024900     02  DNAME20  PICTURE 99      VALUE 1.                        NC2024.2
   000247         025000     02  DNAME21  PICTURE 999     VALUE 1.                        NC2024.2
   000248         025100     02  DNAME22  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000249         025200     02  DNAME23  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000250         025300     02  DNAME24  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000251         025400     02  DNAME25  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000252         025500     02  DNAME26  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000253         025600     02  DNAME27  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000254         025700     02  DNAME28  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000255         025800     02  DNAME29  PICTURE 9(18)  VALUE ZERO.                      NC2024.2 IMP
   000256         025900     02  DNAME30   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000257         026000     02  DNAME31   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000258         026100     02  DNAME32   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000259         026200     02  DNAME33   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000260         026300     02  DNAME34   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000261         026400     02  DNAME35   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000262         026500     02  DNAME36   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000263         026600     02  DNAME37   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000264         026700     02  DNAME38   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000265         026800     02  DNAME39   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000266         026900     02  DNAME40   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000267         027000     02  DNAME41   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000268         027100     02  DNAME42   PICTURE 9(18)  VALUE ZERO COMPUTATIONAL.       NC2024.2 IMP
   000269         027200 01  TEST-RESULTS.                                                NC2024.2
   000270         027300     02 FILLER                   PIC X      VALUE SPACE.          NC2024.2 IMP
   000271         027400     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2024.2 IMP
   000272         027500     02 FILLER                   PIC X      VALUE SPACE.          NC2024.2 IMP
   000273         027600     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2024.2 IMP
   000274         027700     02 FILLER                   PIC X      VALUE SPACE.          NC2024.2 IMP
   000275         027800     02  PAR-NAME.                                                NC2024.2
   000276         027900       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2024.2 IMP
   000277         028000       03  PARDOT-X              PIC X      VALUE SPACE.          NC2024.2 IMP
   000278         028100       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2024.2 IMP
   000279         028200     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2024.2 IMP
   000280         028300     02 RE-MARK                  PIC X(61).                       NC2024.2
   000281         028400 01  TEST-COMPUTED.                                               NC2024.2
   000282         028500     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2024.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     02 FILLER                   PIC X(17)  VALUE                 NC2024.2
   000284         028700            "       COMPUTED=".                                   NC2024.2
   000285         028800     02 COMPUTED-X.                                               NC2024.2
   000286         028900     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2024.2 IMP
   000287         029000     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2024.2 286
   000288         029100                                 PIC -9(9).9(9).                  NC2024.2
   000289         029200     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2024.2 286
   000290         029300     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2024.2 286
   000291         029400     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2024.2 286
   000292         029500     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2024.2 286
   000293         029600         04 COMPUTED-18V0                    PIC -9(18).          NC2024.2
   000294         029700         04 FILLER                           PIC X.               NC2024.2
   000295         029800     03 FILLER PIC X(50) VALUE SPACE.                             NC2024.2 IMP
   000296         029900 01  TEST-CORRECT.                                                NC2024.2
   000297         030000     02 FILLER PIC X(30) VALUE SPACE.                             NC2024.2 IMP
   000298         030100     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2024.2
   000299         030200     02 CORRECT-X.                                                NC2024.2
   000300         030300     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2024.2 IMP
   000301         030400     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2024.2 300
   000302         030500     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2024.2 300
   000303         030600     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2024.2 300
   000304         030700     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2024.2 300
   000305         030800     03      CR-18V0 REDEFINES CORRECT-A.                         NC2024.2 300
   000306         030900         04 CORRECT-18V0                     PIC -9(18).          NC2024.2
   000307         031000         04 FILLER                           PIC X.               NC2024.2
   000308         031100     03 FILLER PIC X(2) VALUE SPACE.                              NC2024.2 IMP
   000309         031200     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2024.2 IMP
   000310         031300 01  CCVS-C-1.                                                    NC2024.2
   000311         031400     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2024.2
   000312         031500-    "SS  PARAGRAPH-NAME                                          NC2024.2
   000313         031600-    "       REMARKS".                                            NC2024.2
   000314         031700     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2024.2 IMP
   000315         031800 01  CCVS-C-2.                                                    NC2024.2
   000316         031900     02 FILLER                     PIC X        VALUE SPACE.      NC2024.2 IMP
   000317         032000     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2024.2
   000318         032100     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2024.2 IMP
   000319         032200     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2024.2
   000320         032300     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2024.2 IMP
   000321         032400 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2024.2 IMP
   000322         032500 01  REC-CT                        PIC 99       VALUE ZERO.       NC2024.2 IMP
   000323         032600 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2024.2 IMP
   000324         032700 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2024.2 IMP
   000325         032800 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2024.2 IMP
   000326         032900 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2024.2 IMP
   000327         033000 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2024.2 IMP
   000328         033100 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2024.2 IMP
   000329         033200 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2024.2 IMP
   000330         033300 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2024.2 IMP
   000331         033400 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2024.2 IMP
   000332         033500 01  CCVS-H-1.                                                    NC2024.2
   000333         033600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2024.2 IMP
   000334         033700     02  FILLER                    PIC X(42)    VALUE             NC2024.2
   000335         033800     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2024.2
   000336         033900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2024.2 IMP
   000337         034000 01  CCVS-H-2A.                                                   NC2024.2
   000338         034100   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2024.2 IMP
   000339         034200   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300   02  FILLER                        PIC XXXX   VALUE             NC2024.2
   000341         034400     "4.2 ".                                                      NC2024.2
   000342         034500   02  FILLER                        PIC X(28)  VALUE             NC2024.2
   000343         034600            " COPY - NOT FOR DISTRIBUTION".                       NC2024.2
   000344         034700   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2024.2 IMP
   000345         034800                                                                  NC2024.2
   000346         034900 01  CCVS-H-2B.                                                   NC2024.2
   000347         035000   02  FILLER                        PIC X(15)  VALUE             NC2024.2
   000348         035100            "TEST RESULT OF ".                                    NC2024.2
   000349         035200   02  TEST-ID                       PIC X(9).                    NC2024.2
   000350         035300   02  FILLER                        PIC X(4)   VALUE             NC2024.2
   000351         035400            " IN ".                                               NC2024.2
   000352         035500   02  FILLER                        PIC X(12)  VALUE             NC2024.2
   000353         035600     " HIGH       ".                                              NC2024.2
   000354         035700   02  FILLER                        PIC X(22)  VALUE             NC2024.2
   000355         035800            " LEVEL VALIDATION FOR ".                             NC2024.2
   000356         035900   02  FILLER                        PIC X(58)  VALUE             NC2024.2
   000357         036000     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2024.2
   000358         036100 01  CCVS-H-3.                                                    NC2024.2
   000359         036200     02  FILLER                      PIC X(34)  VALUE             NC2024.2
   000360         036300            " FOR OFFICIAL USE ONLY    ".                         NC2024.2
   000361         036400     02  FILLER                      PIC X(58)  VALUE             NC2024.2
   000362         036500     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2024.2
   000363         036600     02  FILLER                      PIC X(28)  VALUE             NC2024.2
   000364         036700            "  COPYRIGHT   1985 ".                                NC2024.2
   000365         036800 01  CCVS-E-1.                                                    NC2024.2
   000366         036900     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2024.2 IMP
   000367         037000     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2024.2
   000368         037100     02 ID-AGAIN                     PIC X(9).                    NC2024.2
   000369         037200     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2024.2 IMP
   000370         037300 01  CCVS-E-2.                                                    NC2024.2
   000371         037400     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2024.2 IMP
   000372         037500     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2024.2 IMP
   000373         037600     02 CCVS-E-2-2.                                               NC2024.2
   000374         037700         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2024.2 IMP
   000375         037800         03 FILLER                   PIC X      VALUE SPACE.      NC2024.2 IMP
   000376         037900         03 ENDER-DESC               PIC X(44)  VALUE             NC2024.2
   000377         038000            "ERRORS ENCOUNTERED".                                 NC2024.2
   000378         038100 01  CCVS-E-3.                                                    NC2024.2
   000379         038200     02  FILLER                      PIC X(22)  VALUE             NC2024.2
   000380         038300            " FOR OFFICIAL USE ONLY".                             NC2024.2
   000381         038400     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2024.2 IMP
   000382         038500     02  FILLER                      PIC X(58)  VALUE             NC2024.2
   000383         038600     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2024.2
   000384         038700     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2024.2 IMP
   000385         038800     02 FILLER                       PIC X(15)  VALUE             NC2024.2
   000386         038900             " COPYRIGHT 1985".                                   NC2024.2
   000387         039000 01  CCVS-E-4.                                                    NC2024.2
   000388         039100     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2024.2 IMP
   000389         039200     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2024.2
   000390         039300     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2024.2 IMP
   000391         039400     02 FILLER                       PIC X(40)  VALUE             NC2024.2
   000392         039500      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2024.2
   000393         039600 01  XXINFO.                                                      NC2024.2
   000394         039700     02 FILLER                       PIC X(19)  VALUE             NC2024.2
   000395         039800            "*** INFORMATION ***".                                NC2024.2
   000396         039900     02 INFO-TEXT.                                                NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2024.2 IMP
   000398         040100       04 XXCOMPUTED                 PIC X(20).                   NC2024.2
   000399         040200       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2024.2 IMP
   000400         040300       04 XXCORRECT                  PIC X(20).                   NC2024.2
   000401         040400     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2024.2
   000402         040500 01  HYPHEN-LINE.                                                 NC2024.2
   000403         040600     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2024.2 IMP
   000404         040700     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2024.2
   000405         040800-    "*****************************************".                 NC2024.2
   000406         040900     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2024.2
   000407         041000-    "******************************".                            NC2024.2
   000408         041100 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2024.2
   000409         041200     "NC202A".                                                    NC2024.2
   000410         041300 PROCEDURE DIVISION.                                              NC2024.2
   000411         041400 CCVS1 SECTION.                                                   NC2024.2
   000412         041500 OPEN-FILES.                                                      NC2024.2
   000413         041600     OPEN     OUTPUT PRINT-FILE.                                  NC2024.2 34
   000414         041700     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2024.2 408 349 408 368
   000415         041800     MOVE    SPACE TO TEST-RESULTS.                               NC2024.2 IMP 269
   000416         041900     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2024.2 441 446
   000417         042000     GO TO CCVS1-EXIT.                                            NC2024.2 523
   000418         042100 CLOSE-FILES.                                                     NC2024.2
   000419         042200     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2024.2 450 471 34
   000420         042300 TERMINATE-CCVS.                                                  NC2024.2
   000421         042400     EXIT PROGRAM.                                                NC2024.2
   000422         042500 TERMINATE-CALL.                                                  NC2024.2
   000423         042600     STOP     RUN.                                                NC2024.2
   000424         042700 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2024.2 273 325
   000425         042800 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2024.2 273 326
   000426         042900 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2024.2 273 324
   000427         043000 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2024.2 273 323
   000428         043100     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2024.2 280
   000429         043200 PRINT-DETAIL.                                                    NC2024.2
   000430         043300     IF REC-CT NOT EQUAL TO ZERO                                  NC2024.2 322 IMP
   000431      1  043400             MOVE "." TO PARDOT-X                                 NC2024.2 277
   000432      1  043500             MOVE REC-CT TO DOTVALUE.                             NC2024.2 322 278
   000433         043600     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2024.2 269 35 483
   000434         043700     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2024.2 273 483
   000435      1  043800        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2024.2 500 513
   000436      1  043900          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2024.2 514 522
   000437         044000     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2024.2 IMP 273 IMP 285
   000438         044100     MOVE SPACE TO CORRECT-X.                                     NC2024.2 IMP 299
   000439         044200     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2024.2 322 IMP IMP 275
   000440         044300     MOVE     SPACE TO RE-MARK.                                   NC2024.2 IMP 280
   000441         044400 HEAD-ROUTINE.                                                    NC2024.2
   000442         044500     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2024.2 332 36 483
   000443         044600     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2024.2 337 36 483
   000444         044700     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2024.2 346 36 483
   000445         044800     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2024.2 358 36 483
   000446         044900 COLUMN-NAMES-ROUTINE.                                            NC2024.2
   000447         045000     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2024.2 310 36 483
   000448         045100     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2024.2 315 36 483
   000449         045200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2024.2 402 36 483
   000450         045300 END-ROUTINE.                                                     NC2024.2
   000451         045400     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2024.2 402 36 483
   000452         045500 END-RTN-EXIT.                                                    NC2024.2
   000453         045600     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2024.2 365 36 483
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700 END-ROUTINE-1.                                                   NC2024.2
   000455         045800      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2024.2 324 328 325
   000456         045900      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2024.2 328 323 328
   000457         046000      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2024.2 326 328
   000458         046100*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2024.2
   000459         046200      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2024.2 326 388
   000460         046300      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2024.2 328 390
   000461         046400      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2024.2 387 373
   000462         046500      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2024.2 370 36 483
   000463         046600  END-ROUTINE-12.                                                 NC2024.2
   000464         046700      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2024.2 376
   000465         046800     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2024.2 324 IMP
   000466      1  046900         MOVE "NO " TO ERROR-TOTAL                                NC2024.2 374
   000467         047000         ELSE                                                     NC2024.2
   000468      1  047100         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2024.2 324 374
   000469         047200     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2024.2 370 36
   000470         047300     PERFORM WRITE-LINE.                                          NC2024.2 483
   000471         047400 END-ROUTINE-13.                                                  NC2024.2
   000472         047500     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2024.2 323 IMP
   000473      1  047600         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2024.2 374
   000474      1  047700         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2024.2 323 374
   000475         047800     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2024.2 376
   000476         047900     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2024.2 370 36 483
   000477         048000      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2024.2 325 IMP
   000478      1  048100          MOVE "NO " TO ERROR-TOTAL                               NC2024.2 374
   000479      1  048200      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2024.2 325 374
   000480         048300      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2024.2 376
   000481         048400      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2024.2 370 36 483
   000482         048500     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2024.2 378 36 483
   000483         048600 WRITE-LINE.                                                      NC2024.2
   000484         048700     ADD 1 TO RECORD-COUNT.                                       NC2024.2 330
   000485         048800     IF RECORD-COUNT GREATER 50                                   NC2024.2 330
   000486      1  048900         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2024.2 36 329
   000487      1  049000         MOVE SPACE TO DUMMY-RECORD                               NC2024.2 IMP 36
   000488      1  049100         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2024.2 36
   000489      1  049200         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2024.2 310 36 495
   000490      1  049300         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2024.2 315 36 495
   000491      1  049400         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2024.2 402 36 495
   000492      1  049500         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2024.2 329 36
   000493      1  049600         MOVE ZERO TO RECORD-COUNT.                               NC2024.2 IMP 330
   000494         049700     PERFORM WRT-LN.                                              NC2024.2 495
   000495         049800 WRT-LN.                                                          NC2024.2
   000496         049900     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2024.2 36
   000497         050000     MOVE SPACE TO DUMMY-RECORD.                                  NC2024.2 IMP 36
   000498         050100 BLANK-LINE-PRINT.                                                NC2024.2
   000499         050200     PERFORM WRT-LN.                                              NC2024.2 495
   000500         050300 FAIL-ROUTINE.                                                    NC2024.2
   000501         050400     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2024.2 285 IMP 508
   000502         050500     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2024.2 299 IMP 508
   000503         050600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2024.2 331 401
   000504         050700     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2024.2 396
   000505         050800     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2024.2 393 36 483
   000506         050900     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2024.2 IMP 401
   000507         051000     GO TO  FAIL-ROUTINE-EX.                                      NC2024.2 513
   000508         051100 FAIL-ROUTINE-WRITE.                                              NC2024.2
   000509         051200     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2024.2 281 35 483
   000510         051300     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2024.2 331 309
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2024.2 296 35 483
   000512         051500     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2024.2 IMP 309
   000513         051600 FAIL-ROUTINE-EX. EXIT.                                           NC2024.2
   000514         051700 BAIL-OUT.                                                        NC2024.2
   000515         051800     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2024.2 286 IMP 517
   000516         051900     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2024.2 300 IMP 522
   000517         052000 BAIL-OUT-WRITE.                                                  NC2024.2
   000518         052100     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2024.2 300 400 286 398
   000519         052200     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2024.2 331 401
   000520         052300     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2024.2 393 36 483
   000521         052400     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2024.2 IMP 401
   000522         052500 BAIL-OUT-EX. EXIT.                                               NC2024.2
   000523         052600 CCVS1-EXIT.                                                      NC2024.2
   000524         052700     EXIT.                                                        NC2024.2
   000525         052800 SECT-NC202A-001 SECTION.                                         NC2024.2
   000526         052900 ADD-INIT-F3-1.                                                   NC2024.2
   000527         053000     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000528         053100     MOVE "ADD CORRESPONDING " TO FEATURE.                        NC2024.2 271
   000529         053200     MOVE "ADD-TEST-F3-1" TO PAR-NAME.                            NC2024.2 275
   000530         053300     MOVE ZERO TO GRP-FOR-ADD-CORR-R.                             NC2024.2 IMP 117
   000531         053400     MOVE   11  TO  ADD-CORR-1 OF GRP-FOR-ADD-CORR-1.             NC2024.2 108 104
   000532         053500     MOVE   22  TO  ADD-CORR-2 OF GRP-FOR-ADD-CORR-1.             NC2024.2 107 104
   000533         053600     MOVE   33  TO  ADD-CORR-3 OF GRP-FOR-ADD-CORR-1.             NC2024.2 111 104
   000534         053700     MOVE   44  TO  ADD-CORR-4 OF GRP-FOR-ADD-CORR-1.             NC2024.2 110 104
   000535         053800     MOVE   55  TO  ADD-CORR-5 OF GRP-FOR-ADD-CORR-1.             NC2024.2 113 104
   000536         053900     MOVE   66  TO  ADD-CORR-6 OF GRP-FOR-ADD-CORR-1.             NC2024.2 112 104
   000537         054000     MOVE   77  TO  ADD-CORR-7 OF GRP-FOR-ADD-CORR-1.             NC2024.2 115 104
   000538         054100     MOVE   88  TO  ADD-CORR-8 OF GRP-FOR-ADD-CORR-1.             NC2024.2 114 104
   000539         054200     MOVE   99  TO  ADD-CORR-9 OF GRP-FOR-ADD-CORR-1.             NC2024.2 116 104
   000540         054300 ADD-TEST-F3-1.                                                   NC2024.2
   000541         054400     ADD CORRESPONDING GRP-FOR-ADD-CORR-1 TO GRP-FOR-ADD-CORR-R.  NC2024.2 104 117

 ==000541==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "FILLER" within
                         "GRP-FOR-ADD-CORR-1" did not qualify according to the rules for the
                         "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   000542         054500     IF GRP-FOR-ADD-CORR-R EQUAL TO "11223344506677889900"        NC2024.2 117
   000543      1  054600         PERFORM PASS                                             NC2024.2 425
   000544      1  054700         GO TO ADD-WRITE-F3-1.                                    NC2024.2 553
   000545         054800     GO TO ADD-FAIL-F3-1.                                         NC2024.2 549
   000546         054900 ADD-DELETE-F3-1.                                                 NC2024.2
   000547         055000     PERFORM DE-LETE.                                             NC2024.2 427
   000548         055100     GO TO ADD-WRITE-F3-1.                                        NC2024.2 553
   000549         055200 ADD-FAIL-F3-1.                                                   NC2024.2
   000550         055300     MOVE GRP-FOR-ADD-CORR-R TO COMPUTED-A.                       NC2024.2 117 286
   000551         055400     MOVE "11223344506677889900" TO CORRECT-A.                    NC2024.2 300
   000552         055500     PERFORM FAIL.                                                NC2024.2 426
   000553         055600 ADD-WRITE-F3-1.                                                  NC2024.2
   000554         055700     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000555         055800*                                                                 NC2024.2
   000556         055900 ADD-INIT-F3-2.                                                   NC2024.2
   000557         056000     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000558         056100     MOVE "ADD-TEST-F3-2" TO PAR-NAME.                            NC2024.2 275
   000559         056200     MOVE ZERO TO GRP-FOR-ADD-CORR-R.                             NC2024.2 IMP 117
   000560         056300     MOVE   11  TO  ADD-CORR-1 OF GRP-ADD-SUB-CORR.               NC2024.2 132 130
   000561         056400     MOVE   22  TO  ADD-CORR-2 OF GRP-ADD-SUB-CORR.               NC2024.2 133 130
   000562         056500     MOVE   33  TO  ADD-CORR-3 OF GRP-ADD-SUB-CORR.               NC2024.2 136 130
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000563         056600     MOVE   44  TO  ADD-CORR-4 OF GRP-ADD-SUB-CORR.               NC2024.2 135 130
   000564         056700     MOVE   55  TO  ADD-CORR-5 OF GRP-ADD-SUB-CORR.               NC2024.2 134 130
   000565         056800     MOVE   66  TO  ADD-CORR-6 OF GRP-ADD-SUB-CORR.               NC2024.2 137 130
   000566         056900     MOVE   77  TO  ADD-CORR-7 OF GRP-ADD-SUB-CORR.               NC2024.2 138 130
   000567         057000     MOVE   88  TO  ADD-CORR-8 OF GRP-ADD-SUB-CORR.               NC2024.2 139 130
   000568         057100     MOVE   99  TO  ADD-CORR-9 OF GRP-ADD-SUB-CORR.               NC2024.2 140 130
   000569         057200 ADD-TEST-F3-2.                                                   NC2024.2
   000570         057300     ADD CORRESPONDING GRP-ADD-SUB-CORR TO                        NC2024.2 130
   000571         057400         GRP-FOR-ADD-CORR-R ROUNDED.                              NC2024.2 117
   000572         057500     IF GRP-FOR-ADD-CORR-R EQUAL TO "11223344606677889900"        NC2024.2 117
   000573      1  057600               PERFORM PASS                                       NC2024.2 425
   000574      1  057700               GO TO ADD-WRITE-F3-2.                              NC2024.2 583
   000575         057800     GO TO ADD-FAIL-F3-2.                                         NC2024.2 579
   000576         057900 ADD-DELETE-F3-2.                                                 NC2024.2
   000577         058000     PERFORM DE-LETE.                                             NC2024.2 427
   000578         058100     GO TO ADD-WRITE-F3-2.                                        NC2024.2 583
   000579         058200 ADD-FAIL-F3-2.                                                   NC2024.2
   000580         058300     MOVE GRP-FOR-ADD-CORR-R TO COMPUTED-A.                       NC2024.2 117 286
   000581         058400     MOVE "11223344606677889900" TO CORRECT-A.                    NC2024.2 300
   000582         058500     PERFORM FAIL.                                                NC2024.2 426
   000583         058600 ADD-WRITE-F3-2.                                                  NC2024.2
   000584         058700     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000585         058800*                                                                 NC2024.2
   000586         058900 ADD-INIT-F3-3.                                                   NC2024.2
   000587         059000     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000588         059100     MOVE ZERO TO GRP-FOR-ADD-CORR-R,  WRK-XN-00001.              NC2024.2 IMP 117 51
   000589         059200     MOVE 111    TO  ADD-CORR-1 OF GRP-SUBTRACT-CORR-3.           NC2024.2 149 144
   000590         059300     MOVE  22    TO  ADD-CORR-2 OF GRP-SUBTRACT-CORR-3.           NC2024.2 148 144
   000591         059400     MOVE  33    TO  ADD-CORR-3 OF GRP-SUBTRACT-CORR-3.           NC2024.2 147 144
   000592         059500     MOVE  44    TO  ADD-CORR-4 OF GRP-SUBTRACT-CORR-3.           NC2024.2 146 144
   000593         059600 ADD-INIT-F3-3-1.                                                 NC2024.2
   000594         059700     MOVE "ADD-TEST-F3-3-1" TO PAR-NAME.                          NC2024.2 275
   000595         059800 ADD-TEST-F3-3-1.                                                 NC2024.2
   000596         059900     ADD CORRESPONDING GRP-SUBTRACT-CORR-3 TO GRP-FOR-ADD-CORR-R  NC2024.2 144 117
   000597      1  060000         ON SIZE ERROR MOVE "1" TO WRK-XN-00001.                  NC2024.2 51
   000598         060100     IF GRP-FOR-ADD-CORR-R EQUAL TO "00223344000000000000"        NC2024.2 117
   000599      1  060200                   PERFORM PASS                                   NC2024.2 425
   000600      1  060300                   GO TO ADD-WRITE-F3-3-1.                        NC2024.2 609
   000601         060400     GO TO ADD-FAIL-F3-3-1.                                       NC2024.2 605
   000602         060500 ADD-DELETE-F3-3-1.                                               NC2024.2
   000603         060600     PERFORM DE-LETE.                                             NC2024.2 427
   000604         060700     GO TO ADD-WRITE-F3-3-1.                                      NC2024.2 609
   000605         060800 ADD-FAIL-F3-3-1.                                                 NC2024.2
   000606         060900     MOVE "00223344000000000000" TO CORRECT-A.                    NC2024.2 300
   000607         061000     MOVE GRP-FOR-ADD-CORR-R TO COMPUTED-A.                       NC2024.2 117 286
   000608         061100     PERFORM FAIL.                                                NC2024.2 426
   000609         061200 ADD-WRITE-F3-3-1.                                                NC2024.2
   000610         061300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000611         061400*                                                                 NC2024.2
   000612         061500 ADD-INIT-F3-3-2.                                                 NC2024.2
   000613         061600     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000614         061700     MOVE "ADD-TEST-F3-3-2" TO PAR-NAME.                          NC2024.2 275
   000615         061800 ADD-TEST-F3-3-2.                                                 NC2024.2
   000616         061900     IF       WRK-XN-00001 EQUAL TO "1"                           NC2024.2 51
   000617      1  062000               PERFORM PASS                                       NC2024.2 425
   000618      1  062100               GO TO ADD-WRITE-F3-3-2.                            NC2024.2 627
   000619         062200     GO TO ADD-FAIL-F3-3-2.                                       NC2024.2 623
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000620         062300 ADD-DELETE-F3-3-2.                                               NC2024.2
   000621         062400     PERFORM DE-LETE.                                             NC2024.2 427
   000622         062500     GO TO ADD-WRITE-F3-3-2.                                      NC2024.2 627
   000623         062600 ADD-FAIL-F3-3-2.                                                 NC2024.2
   000624         062700     MOVE 1 TO CORRECT-A.                                         NC2024.2 300
   000625         062800     MOVE WRK-XN-00001 TO COMPUTED-A.                             NC2024.2 51 286
   000626         062900     PERFORM FAIL.                                                NC2024.2 426
   000627         063000 ADD-WRITE-F3-3-2.                                                NC2024.2
   000628         063100     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000629         063200*                                                                 NC2024.2
   000630         063300 ADD-INIT-F3-4.                                                   NC2024.2
   000631         063400     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000632         063500     MOVE "ADD-TEST-F3-4" TO PAR-NAME.                            NC2024.2 275
   000633         063600     MOVE ZERO TO GRP-FOR-ADD-CORR-R.                             NC2024.2 IMP 117
   000634         063700     MOVE ZERO TO ADD-CORR-1 OF GRP-FOR-ADD-CORR-A.               NC2024.2 IMP 149 143
   000635         063800 ADD-TEST-F3-4.                                                   NC2024.2
   000636         063900     ADD CORRESPONDING GRP-SUBTRACT-CORR-1 OF GRP-SUBTRACT-CORR-3 NC2024.2 145 144
   000637         064000             TO GRP-SUBTRACT-CORR-1 OF GRP-FOR-ADD-CORR-R.        NC2024.2 118 117
   000638         064100     IF GRP-FOR-ADD-CORR-R EQUAL TO "00223344000000000000"        NC2024.2 117
   000639      1  064200                  PERFORM PASS                                    NC2024.2 425
   000640      1  064300                  GO TO ADD-WRITE-F3-4.                           NC2024.2 649
   000641         064400     GO TO ADD-FAIL-F3-4.                                         NC2024.2 645
   000642         064500 ADD-DELETE-F3-4.                                                 NC2024.2
   000643         064600     PERFORM DE-LETE.                                             NC2024.2 427
   000644         064700     GO TO ADD-WRITE-F3-4.                                        NC2024.2 649
   000645         064800 ADD-FAIL-F3-4.                                                   NC2024.2
   000646         064900     MOVE "00223344000000000000" TO CORRECT-A.                    NC2024.2 300
   000647         065000     MOVE GRP-FOR-ADD-CORR-R TO COMPUTED-A.                       NC2024.2 117 286
   000648         065100     PERFORM FAIL.                                                NC2024.2 426
   000649         065200 ADD-WRITE-F3-4.                                                  NC2024.2
   000650         065300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000651         065400*                                                                 NC2024.2
   000652         065500 ADD-INIT-F3-5-1.                                                 NC2024.2
   000653         065600     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000654         065700     MOVE "ADD-TEST-F3-5-1" TO PAR-NAME.                          NC2024.2 275
   000655         065800     MOVE     1    TO FIELD1 OF ADD-15.                           NC2024.2 151 150
   000656         065900     MOVE    32.1  TO FIELD2 OF ADD-15.                           NC2024.2 152 150
   000657         066000     MOVE   123.4  TO FIELD3 OF ADD-15.                           NC2024.2 153 150
   000658         066100     MOVE 99999    TO FIELD1 OF ADD-16.                           NC2024.2 155 154
   000659         066200     MOVE   745.67 TO FIELD2 OF ADD-16.                           NC2024.2 156 154
   000660         066300     MOVE   432.1  TO FIELD3 OF ADD-16.                           NC2024.2 157 154
   000661         066400 ADD-TEST-F3-5-1.                                                 NC2024.2
   000662         066500     ADD CORRESPONDING ADD-15 TO ADD-16 ON SIZE ERROR             NC2024.2 150 154
   000663      1  066600               PERFORM PASS                                       NC2024.2 425
   000664      1  066700               GO TO ADD-WRITE-F3-5-1.                            NC2024.2 672
   000665         066800     GO TO ADD-FAIL-F3-5-1.                                       NC2024.2 669
   000666         066900 ADD-DELETE-F3-5-1.                                               NC2024.2
   000667         067000     PERFORM DE-LETE.                                             NC2024.2 427
   000668         067100     GO TO ADD-WRITE-F3-5-1.                                      NC2024.2 672
   000669         067200 ADD-FAIL-F3-5-1.                                                 NC2024.2
   000670         067300     PERFORM FAIL.                                                NC2024.2 426
   000671         067400     MOVE "ON SIZE ERROR NOT EXECUTED" TO RE-MARK.                NC2024.2 280
   000672         067500 ADD-WRITE-F3-5-1.                                                NC2024.2
   000673         067600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000674         067700*                                                                 NC2024.2
   000675         067800 ADD-INIT-F3-5-2.                                                 NC2024.2
   000676         067900     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000677         068000     MOVE "ADD-TEST-F3-5-2" TO PAR-NAME.                          NC2024.2 275
   000678         068100 ADD-TEST-F3-5-2.                                                 NC2024.2
   000679         068200     IF       FIELD1 OF ADD-16 EQUAL TO 99999                     NC2024.2 155 154
   000680      1  068300              PERFORM PASS                                        NC2024.2 425
   000681      1  068400              GO TO ADD-WRITE-F3-5-2.                             NC2024.2 690
   000682         068500     GO TO ADD-FAIL-F3-5-2.                                       NC2024.2 686
   000683         068600 ADD-DELETE-F3-5-2.                                               NC2024.2
   000684         068700     PERFORM DE-LETE.                                             NC2024.2 427
   000685         068800     GO TO ADD-WRITE-F3-5-2.                                      NC2024.2 690
   000686         068900 ADD-FAIL-F3-5-2.                                                 NC2024.2
   000687         069000     MOVE FIELD1 OF ADD-16 TO COMPUTED-N.                         NC2024.2 155 154 287
   000688         069100     MOVE     99999 TO CORRECT-N.                                 NC2024.2 301
   000689         069200     PERFORM FAIL.                                                NC2024.2 426
   000690         069300 ADD-WRITE-F3-5-2.                                                NC2024.2
   000691         069400     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000692         069500*                                                                 NC2024.2
   000693         069600 ADD-INIT-F3-5-3.                                                 NC2024.2
   000694         069700     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000695         069800     MOVE "ADD-TEST-F3-5-3" TO PAR-NAME.                          NC2024.2 275
   000696         069900 ADD-TEST-F3-5-3.                                                 NC2024.2
   000697         070000     IF FIELD2 OF ADD-16 IS EQUAL TO 777.77                       NC2024.2 156 154
   000698      1  070100            PERFORM PASS                                          NC2024.2 425
   000699      1  070200            GO TO ADD-WRITE-F3-5-3.                               NC2024.2 708
   000700         070300     GO TO ADD-FAIL-F3-5-3.                                       NC2024.2 704
   000701         070400 ADD-DELETE-F3-5-3.                                               NC2024.2
   000702         070500     PERFORM DE-LETE.                                             NC2024.2 427
   000703         070600     GO TO ADD-WRITE-F3-5-3.                                      NC2024.2 708
   000704         070700 ADD-FAIL-F3-5-3.                                                 NC2024.2
   000705         070800     PERFORM FAIL.                                                NC2024.2 426
   000706         070900     MOVE FIELD2 OF ADD-16 TO COMPUTED-N.                         NC2024.2 156 154 287
   000707         071000     MOVE "+777.77" TO CORRECT-A.                                 NC2024.2 300
   000708         071100 ADD-WRITE-F3-5-3.                                                NC2024.2
   000709         071200     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000710         071300*                                                                 NC2024.2
   000711         071400 ADD-INIT-F3-5-4.                                                 NC2024.2
   000712         071500     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000713         071600     MOVE "ADD-TEST-F3-5-4" TO PAR-NAME.                          NC2024.2 275
   000714         071700 ADD-TEST-F3-5-4.                                                 NC2024.2
   000715         071800     IF FIELD3 OF ADD-16 IS EQUAL TO 555.5                        NC2024.2 157 154
   000716      1  071900                  PERFORM PASS                                    NC2024.2 425
   000717      1  072000                  GO TO ADD-WRITE-F3-5-4.                         NC2024.2 726
   000718         072100     GO TO ADD-FAIL-F3-5-4.                                       NC2024.2 722
   000719         072200 ADD-DELETE-F3-5-4.                                               NC2024.2
   000720         072300     PERFORM DE-LETE.                                             NC2024.2 427
   000721         072400     GO TO ADD-WRITE-F3-5-4.                                      NC2024.2 726
   000722         072500 ADD-FAIL-F3-5-4.                                                 NC2024.2
   000723         072600     PERFORM FAIL.                                                NC2024.2 426
   000724         072700     MOVE FIELD3 OF ADD-16 TO COMPUTED-N.                         NC2024.2 157 154 287
   000725         072800     MOVE 555.5 TO CORRECT-N.                                     NC2024.2 301
   000726         072900 ADD-WRITE-F3-5-4.                                                NC2024.2
   000727         073000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000728         073100*                                                                 NC2024.2
   000729         073200 ADD-INIT-F3-6.                                                   NC2024.2
   000730         073300     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000731         073400     MOVE "ADD-TEST-F3-6" TO PAR-NAME.                            NC2024.2 275
   000732         073500     MOVE "ADD CORRESPONDING   " TO FEATURE.                      NC2024.2 271
   000733         073600     MOVE 03   TO XYZ-1 OF CORR-DATA-1.                           NC2024.2 179 178
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000734         073700     MOVE 04   TO XYZ-2 OF CORR-DATA-1                            NC2024.2 180 178
   000735         073800     MOVE TEN  TO XYZ-3 OF CORR-DATA-1.                           NC2024.2 99 181 178
   000736         073900     MOVE ZERO TO XYZ-4 OF CORR-DATA-1.                           NC2024.2 IMP 182 178
   000737         074000     MOVE 01   TO XYZ-5 OF CORR-DATA-1.                           NC2024.2 183 178
   000738         074100     MOVE 00   TO XYZ-6 OF CORR-DATA-1.                           NC2024.2 184 178
   000739         074200     MOVE ZEROES TO CORR-DATA-2.                                  NC2024.2 IMP 185
   000740         074300 ADD-TEST-F3-6.                                                   NC2024.2
   000741         074400     ADD CORRESPONDING CORR-DATA-1 TO CORR-DATA-2.                NC2024.2 178 185
   000742         074500     IF XYZ-4 OF CORR-DATA-2 EQUAL TO ZERO                        NC2024.2 189 185 IMP
   000743      1  074600                PERFORM PASS                                      NC2024.2 425
   000744      1  074700                GO TO ADD-WRITE-F3-6.                             NC2024.2 753
   000745         074800     GO TO ADD-FAIL-F3-6.                                         NC2024.2 749
   000746         074900 ADD-DELETE-F3-6.                                                 NC2024.2
   000747         075000     PERFORM DE-LETE.                                             NC2024.2 427
   000748         075100     GO TO ADD-WRITE-F3-6.                                        NC2024.2 753
   000749         075200 ADD-FAIL-F3-6.                                                   NC2024.2
   000750         075300     PERFORM FAIL.                                                NC2024.2 426
   000751         075400     MOVE XYZ-4 OF CORR-DATA-2 TO COMPUTED-A.                     NC2024.2 189 185 286
   000752         075500     MOVE 00 TO CORRECT-A.                                        NC2024.2 300
   000753         075600 ADD-WRITE-F3-6.                                                  NC2024.2
   000754         075700     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000755         075800*                                                                 NC2024.2
   000756         075900 ADD-INIT-F3-7.                                                   NC2024.2
   000757         076000     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000758         076100     MOVE 03   TO XYZ-1 OF CORR-DATA-1.                           NC2024.2 179 178
   000759         076200     MOVE 04   TO XYZ-2 OF CORR-DATA-1                            NC2024.2 180 178
   000760         076300     MOVE TEN  TO XYZ-3 OF CORR-DATA-1.                           NC2024.2 99 181 178
   000761         076400     MOVE ZERO TO XYZ-4 OF CORR-DATA-1.                           NC2024.2 IMP 182 178
   000762         076500     MOVE 01   TO XYZ-5 OF CORR-DATA-1.                           NC2024.2 183 178
   000763         076600     MOVE 00   TO XYZ-6 OF CORR-DATA-1.                           NC2024.2 184 178
   000764         076700     MOVE 060820000200 TO CORR-DATA-2.                            NC2024.2 185
   000765         076800 ADD-INIT-F3-7-1.                                                 NC2024.2
   000766         076900     MOVE "ADD-TEST-F3-7-1" TO PAR-NAME.                          NC2024.2 275
   000767         077000 ADD-TEST-F3-7-1.                                                 NC2024.2
   000768         077100     ADD CORRESPONDING CORR-DATA-1 TO CORR-DATA-2.                NC2024.2 178 185
   000769         077200     IF XYZ-1 OF CORR-DATA-2 EQUAL TO 09                          NC2024.2 186 185
   000770      1  077300                 PERFORM PASS                                     NC2024.2 425
   000771      1  077400                 GO TO ADD-WRITE-F3-7-1.                          NC2024.2 780
   000772         077500     GO TO ADD-FAIL-F3-7-1.                                       NC2024.2 776
   000773         077600 ADD-DELETE-F3-7-1.                                               NC2024.2
   000774         077700     PERFORM DE-LETE.                                             NC2024.2 427
   000775         077800     GO TO ADD-WRITE-F3-7-1.                                      NC2024.2 780
   000776         077900 ADD-FAIL-F3-7-1.                                                 NC2024.2
   000777         078000     PERFORM FAIL.                                                NC2024.2 426
   000778         078100     MOVE XYZ-1 OF CORR-DATA-2 TO COMPUTED-A.                     NC2024.2 186 185 286
   000779         078200     MOVE "09" TO CORRECT-A.                                      NC2024.2 300
   000780         078300 ADD-WRITE-F3-7-1.                                                NC2024.2
   000781         078400     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000782         078500*                                                                 NC2024.2
   000783         078600 ADD-INIT-F3-7-2.                                                 NC2024.2
   000784         078700     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000785         078800     MOVE "ADD-TEST-F3-7-2" TO PAR-NAME.                          NC2024.2 275
   000786         078900 ADD-TEST-F3-7-2.                                                 NC2024.2
   000787         079000     IF XYZ-2 OF CORR-DATA-2 EQUAL TO 12                          NC2024.2 187 185
   000788      1  079100                 PERFORM PASS                                     NC2024.2 425
   000789      1  079200                 GO TO ADD-WRITE-F3-7-2.                          NC2024.2 798
   000790         079300     GO TO ADD-FAIL-F3-7-2.                                       NC2024.2 794
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000791         079400 ADD-DELETE-F3-7-2.                                               NC2024.2
   000792         079500     PERFORM DE-LETE.                                             NC2024.2 427
   000793         079600     GO TO ADD-WRITE-F3-7-2.                                      NC2024.2 798
   000794         079700 ADD-FAIL-F3-7-2.                                                 NC2024.2
   000795         079800     PERFORM FAIL.                                                NC2024.2 426
   000796         079900     MOVE XYZ-2 OF CORR-DATA-2 TO COMPUTED-A.                     NC2024.2 187 185 286
   000797         080000     MOVE "12" TO CORRECT-A.                                      NC2024.2 300
   000798         080100 ADD-WRITE-F3-7-2.                                                NC2024.2
   000799         080200     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000800         080300*                                                                 NC2024.2
   000801         080400 ADD-INIT-F3-7-3.                                                 NC2024.2
   000802         080500     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000803         080600     MOVE "ADD-TEST-F3-7-3" TO PAR-NAME.                          NC2024.2 275
   000804         080700 ADD-TEST-F3-7-3.                                                 NC2024.2
   000805         080800     IF XYZ-3 OF CORR-DATA-2 EQUAL TO 30                          NC2024.2 188 185
   000806      1  080900                 PERFORM PASS                                     NC2024.2 425
   000807      1  081000                 GO TO ADD-WRITE-F3-7-3.                          NC2024.2 816
   000808         081100     GO TO ADD-FAIL-F3-7-3.                                       NC2024.2 812
   000809         081200 ADD-DELETE-F3-7-3.                                               NC2024.2
   000810         081300     PERFORM DE-LETE.                                             NC2024.2 427
   000811         081400     GO TO ADD-WRITE-F3-7-3.                                      NC2024.2 816
   000812         081500 ADD-FAIL-F3-7-3.                                                 NC2024.2
   000813         081600     PERFORM FAIL.                                                NC2024.2 426
   000814         081700     MOVE XYZ-3 OF CORR-DATA-2 TO COMPUTED-A.                     NC2024.2 188 185 286
   000815         081800     MOVE "30" TO CORRECT-A.                                      NC2024.2 300
   000816         081900 ADD-WRITE-F3-7-3.                                                NC2024.2
   000817         082000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000818         082100*                                                                 NC2024.2
   000819         082200 ADD-INIT-F3-7-4.                                                 NC2024.2
   000820         082300     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000821         082400     MOVE "ADD-TEST-F3-7-4" TO PAR-NAME.                          NC2024.2 275
   000822         082500 ADD-TEST-F3-7-4.                                                 NC2024.2
   000823         082600     IF XYZ-4 OF CORR-DATA-2 EQUAL TO 00                          NC2024.2 189 185
   000824      1  082700                 PERFORM PASS                                     NC2024.2 425
   000825      1  082800                 GO TO ADD-WRITE-F3-7-4.                          NC2024.2 834
   000826         082900     GO TO ADD-FAIL-F3-7-4.                                       NC2024.2 830
   000827         083000 ADD-DELETE-F3-7-4.                                               NC2024.2
   000828         083100     PERFORM DE-LETE.                                             NC2024.2 427
   000829         083200     GO TO ADD-WRITE-F3-7-4.                                      NC2024.2 834
   000830         083300 ADD-FAIL-F3-7-4.                                                 NC2024.2
   000831         083400     PERFORM FAIL.                                                NC2024.2 426
   000832         083500     MOVE XYZ-4 OF CORR-DATA-2 TO COMPUTED-A.                     NC2024.2 189 185 286
   000833         083600     MOVE "00" TO CORRECT-A.                                      NC2024.2 300
   000834         083700 ADD-WRITE-F3-7-4.                                                NC2024.2
   000835         083800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000836         083900*                                                                 NC2024.2
   000837         084000 ADD-INIT-F3-7-5.                                                 NC2024.2
   000838         084100     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000839         084200     MOVE "ADD-TEST-F3-7-5" TO PAR-NAME.                          NC2024.2 275
   000840         084300 ADD-TEST-F3-7-5.                                                 NC2024.2
   000841         084400     IF XYZ-5 IN CORR-DATA-2 EQUAL TO 03                          NC2024.2 190 185
   000842      1  084500               PERFORM PASS                                       NC2024.2 425
   000843      1  084600               GO TO ADD-WRITE-F3-7-5.                            NC2024.2 852
   000844         084700     GO TO ADD-FAIL-F3-7-5.                                       NC2024.2 848
   000845         084800 DELETE-F3-7-5.                                                   NC2024.2
   000846         084900     PERFORM DE-LETE.                                             NC2024.2 427
   000847         085000     GO TO ADD-WRITE-F3-7-5.                                      NC2024.2 852
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000848         085100 ADD-FAIL-F3-7-5.                                                 NC2024.2
   000849         085200     MOVE XYZ-5 OF CORR-DATA-2 TO COMPUTED-A.                     NC2024.2 190 185 286
   000850         085300     MOVE "03" TO CORRECT-A.                                      NC2024.2 300
   000851         085400     PERFORM FAIL.                                                NC2024.2 426
   000852         085500 ADD-WRITE-F3-7-5.                                                NC2024.2
   000853         085600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000854         085700*                                                                 NC2024.2
   000855         085800 ADD-INIT-F3-8.                                                   NC2024.2
   000856         085900     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000857         086000     MOVE ZERO TO WRK-AN-00001.                                   NC2024.2 IMP 50
   000858         086100     MOVE 03   TO XYZ-1 OF CORR-DATA-1.                           NC2024.2 179 178
   000859         086200     MOVE 04   TO XYZ-2 OF CORR-DATA-1                            NC2024.2 180 178
   000860         086300     MOVE TEN  TO XYZ-3 OF CORR-DATA-1.                           NC2024.2 99 181 178
   000861         086400     MOVE ZERO TO XYZ-4 OF CORR-DATA-1.                           NC2024.2 IMP 182 178
   000862         086500     MOVE 01   TO XYZ-5 OF CORR-DATA-1.                           NC2024.2 183 178
   000863         086600     MOVE 00   TO XYZ-6 OF CORR-DATA-1.                           NC2024.2 184 178
   000864         086700     MOVE 999999999999 TO CORR-DATA-2.                            NC2024.2 185
   000865         086800 ADD-INIT-F3-8-1.                                                 NC2024.2
   000866         086900     MOVE "ADD-TEST-F3-8-1" TO PAR-NAME.                          NC2024.2 275
   000867         087000 ADD-TEST-F3-8-1.                                                 NC2024.2
   000868         087100     ADD CORRESPONDING CORR-DATA-1 TO CORR-DATA-2 ON SIZE ERROR   NC2024.2 178 185
   000869      1  087200              MOVE 4 TO WRK-AN-00001.                             NC2024.2 50
   000870         087300     IF WRK-AN-00001 EQUAL TO "4"                                 NC2024.2 50
   000871      1  087400              PERFORM PASS                                        NC2024.2 425
   000872      1  087500              GO TO ADD-WRITE-F3-8-1.                             NC2024.2 881
   000873         087600     GO TO ADD-FAIL-F3-8-1.                                       NC2024.2 877
   000874         087700 ADD-DELETE-F3-8-1.                                               NC2024.2
   000875         087800     PERFORM DE-LETE.                                             NC2024.2 427
   000876         087900     GO TO ADD-WRITE-F3-8-1.                                      NC2024.2 881
   000877         088000 ADD-FAIL-F3-8-1.                                                 NC2024.2
   000878         088100     PERFORM FAIL.                                                NC2024.2 426
   000879         088200     MOVE WRK-AN-00001 TO COMPUTED-A.                             NC2024.2 50 286
   000880         088300     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC2024.2 280
   000881         088400 ADD-WRITE-F3-8-1.                                                NC2024.2
   000882         088500     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000883         088600*                                                                 NC2024.2
   000884         088700 ADD-INIT-F3-8-2.                                                 NC2024.2
   000885         088800     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000886         088900     MOVE "ADD-TEST-F3-8-2" TO PAR-NAME.                          NC2024.2 275
   000887         089000 ADD-TEST-F3-8-2.                                                 NC2024.2
   000888         089100     IF CORR-DATA-2 EQUAL TO "999999999999"                       NC2024.2 185
   000889      1  089200                 PERFORM PASS                                     NC2024.2 425
   000890      1  089300                 GO TO ADD-WRITE-F3-8-2.                          NC2024.2 900
   000891         089400     GO TO ADD-FAIL-F3-8-2.                                       NC2024.2 895
   000892         089500 ADD-DELETE-F3-8-2.                                               NC2024.2
   000893         089600     PERFORM DE-LETE.                                             NC2024.2 427
   000894         089700     GO TO ADD-WRITE-F3-8-2.                                      NC2024.2 900
   000895         089800 ADD-FAIL-F3-8-2.                                                 NC2024.2
   000896         089900     PERFORM FAIL.                                                NC2024.2 426
   000897         090000     MOVE CORR-DATA-2 TO COMPUTED-A.                              NC2024.2 185 286
   000898         090100     MOVE "999999999999" TO CORRECT-A.                            NC2024.2 300
   000899         090200     MOVE "WRONGLY AFFECTED BY SIZE ERROR" TO RE-MARK.            NC2024.2 280
   000900         090300 ADD-WRITE-F3-8-2.                                                NC2024.2
   000901         090400     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000902         090500*                                                                 NC2024.2
   000903         090600 ADD-INIT-F3-9-1.                                                 NC2024.2
   000904         090700     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000905         090800     MOVE "ADD-TEST-F3-9-1" TO PAR-NAME.                          NC2024.2 275
   000906         090900     MOVE ZEROES TO CORR-DATA-5.                                  NC2024.2 IMP 206
   000907         091000     MOVE 222222222222 TO CORR-DATA-1.                            NC2024.2 178
   000908         091100 ADD-TEST-F3-9-1.                                                 NC2024.2
   000909         091200     ADD CORRESPONDING CORR-DATA-1 TO CORR-DATA-5.                NC2024.2 178 206
   000910         091300     IF XYZ-1 OF CORR-DATA-5 EQUAL TO 22                          NC2024.2 207 206
   000911      1  091400                PERFORM PASS                                      NC2024.2 425
   000912      1  091500                GO TO ADD-WRITE-F3-9-1.                           NC2024.2 921
   000913         091600     GO TO ADD-FAIL-F3-9-1.                                       NC2024.2 917
   000914         091700 ADD-DELETE-F3-9-1.                                               NC2024.2
   000915         091800     PERFORM DE-LETE.                                             NC2024.2 427
   000916         091900     GO TO ADD-WRITE-F3-9-1.                                      NC2024.2 921
   000917         092000 ADD-FAIL-F3-9-1.                                                 NC2024.2
   000918         092100     MOVE XYZ-1 OF CORR-DATA-5 TO COMPUTED-A.                     NC2024.2 207 206 286
   000919         092200     MOVE "22" TO CORRECT-A.                                      NC2024.2 300
   000920         092300     PERFORM FAIL.                                                NC2024.2 426
   000921         092400 ADD-WRITE-F3-9-1.                                                NC2024.2
   000922         092500     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000923         092600*                                                                 NC2024.2
   000924         092700 ADD-INIT-F3-9-2.                                                 NC2024.2
   000925         092800     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000926         092900     MOVE "ADD-TEST-F3-9-2" TO PAR-NAME.                          NC2024.2 275
   000927         093000 ADD-TEST-F3-9-2.                                                 NC2024.2
   000928         093100     IF XYZ-13 OF CORR-DATA-5 EQUAL TO 00                         NC2024.2 209 206
   000929      1  093200              PERFORM PASS                                        NC2024.2 425
   000930      1  093300              GO TO ADD-WRITE-F3-9-2.                             NC2024.2 939
   000931         093400     GO TO ADD-FAIL-F3-9-2.                                       NC2024.2 935
   000932         093500 ADD-DELETE-F3-9-2.                                               NC2024.2
   000933         093600     PERFORM DE-LETE.                                             NC2024.2 427
   000934         093700     GO TO ADD-WRITE-F3-9-2.                                      NC2024.2 939
   000935         093800 ADD-FAIL-F3-9-2.                                                 NC2024.2
   000936         093900     MOVE XYZ-13 OF CORR-DATA-5 TO COMPUTED-A.                    NC2024.2 209 206 286
   000937         094000     MOVE "00" TO CORRECT-A.                                      NC2024.2 300
   000938         094100     PERFORM FAIL.                                                NC2024.2 426
   000939         094200 ADD-WRITE-F3-9-2.                                                NC2024.2
   000940         094300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000941         094400*                                                                 NC2024.2
   000942         094500 ADD-INIT-F3-9-3.                                                 NC2024.2
   000943         094600     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000944         094700     MOVE "ADD-TEST-F3-9-3" TO PAR-NAME.                          NC2024.2 275
   000945         094800 ADD-TEST-F3-9-3.                                                 NC2024.2
   000946         094900     IF XYZ-11 OF CORR-DATA-5 EQUAL TO 00                         NC2024.2 212 206
   000947      1  095000                  PERFORM PASS                                    NC2024.2 425
   000948      1  095100                  GO TO ADD-WRITE-F3-9-3.                         NC2024.2 957
   000949         095200     GO TO ADD-FAIL-F3-9-3.                                       NC2024.2 953
   000950         095300 ADD-DELETE-F3-9-3.                                               NC2024.2
   000951         095400     PERFORM DE-LETE.                                             NC2024.2 427
   000952         095500     GO TO ADD-WRITE-F3-9-3.                                      NC2024.2 957
   000953         095600 ADD-FAIL-F3-9-3.                                                 NC2024.2
   000954         095700     MOVE XYZ-11 OF CORR-DATA-5 TO COMPUTED-A.                    NC2024.2 212 206 286
   000955         095800     MOVE "00" TO CORRECT-A.                                      NC2024.2 300
   000956         095900     PERFORM FAIL.                                                NC2024.2 426
   000957         096000 ADD-WRITE-F3-9-3.                                                NC2024.2
   000958         096100     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000959         096200*                                                                 NC2024.2
   000960         096300 ADD-INIT-F3-10.                                                  NC2024.2
   000961         096400     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000962         096500     MOVE ZERO  TO           CORR-DATA-5.                         NC2024.2 IMP 206
   000963         096600     MOVE 10    TO XYZ-1  OF CORR-DATA-5.                         NC2024.2 207 206
   000964         096700     MOVE 98    TO XYZ-2  OF CORR-DATA-5.                         NC2024.2 208 206
   000965         096800     MOVE 01    TO XYZ-11 OF CORR-DATA-5.                         NC2024.2 212 206
   000966         096900     MOVE 10.45 TO XYZ-1  OF CORR-DATA-7.                         NC2024.2 222 221
   000967         097000     MOVE  0.9  TO XYZ-2  OF CORR-DATA-7.                         NC2024.2 225 221
   000968         097100     MOVE ZERO  TO XYZ-11 OF CORR-DATA-7.                         NC2024.2 IMP 224 221
   000969         097200 ADD-INIT-F3-10-1.                                                NC2024.2
   000970         097300     MOVE "ADD-TEST-F3-10-1" TO PAR-NAME.                         NC2024.2 275
   000971         097400 ADD-TEST-F3-10-1.                                                NC2024.2
   000972         097500     ADD CORRESPONDING CORR-DATA-7 TO CORR-DATA-5.                NC2024.2 221 206
   000973         097600     IF XYZ-1 IN CORR-DATA-5 EQUAL TO 20                          NC2024.2 207 206
   000974      1  097700                 PERFORM PASS                                     NC2024.2 425
   000975      1  097800                 GO TO ADD-WRITE-F3-10-1.                         NC2024.2 984
   000976         097900     GO TO ADD-FAIL-F3-10-1.                                      NC2024.2 980
   000977         098000 ADD-DELETE-F3-10-1.                                              NC2024.2
   000978         098100     PERFORM DE-LETE.                                             NC2024.2 427
   000979         098200     GO TO ADD-WRITE-F3-10-1.                                     NC2024.2 984
   000980         098300 ADD-FAIL-F3-10-1.                                                NC2024.2
   000981         098400     PERFORM FAIL.                                                NC2024.2 426
   000982         098500     MOVE XYZ-1 OF CORR-DATA-5 TO COMPUTED-N.                     NC2024.2 207 206 287
   000983         098600     MOVE "+20.0000" TO CORRECT-A.                                NC2024.2 300
   000984         098700 ADD-WRITE-F3-10-1.                                               NC2024.2
   000985         098800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   000986         098900*                                                                 NC2024.2
   000987         099000 ADD-INIT-F3-10-2.                                                NC2024.2
   000988         099100     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   000989         099200     MOVE "ADD-TEST-F3-10-2" TO PAR-NAME.                         NC2024.2 275
   000990         099300 ADD-TEST-F3-10-2.                                                NC2024.2
   000991         099400     IF XYZ-2 IN CORR-DATA-5 EQUAL TO 98                          NC2024.2 208 206
   000992      1  099500                 PERFORM PASS                                     NC2024.2 425
   000993      1  099600                 GO TO ADD-WRITE-F3-10-2.                         NC2024.2 1002
   000994         099700     GO TO ADD-FAIL-F3-10-2.                                      NC2024.2 998
   000995         099800 ADD-DELETE-F3-10-2.                                              NC2024.2
   000996         099900     PERFORM DE-LETE.                                             NC2024.2 427
   000997         100000     GO TO ADD-WRITE-F3-10-2.                                     NC2024.2 1002
   000998         100100 ADD-FAIL-F3-10-2.                                                NC2024.2
   000999         100200     PERFORM FAIL.                                                NC2024.2 426
   001000         100300     MOVE XYZ-2 OF CORR-DATA-5 TO COMPUTED-N.                     NC2024.2 208 206 287
   001001         100400     MOVE "98.0000" TO CORRECT-A.                                 NC2024.2 300
   001002         100500 ADD-WRITE-F3-10-2.                                               NC2024.2
   001003         100600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001004         100700*                                                                 NC2024.2
   001005         100800 ADD-INIT-F3-10-3.                                                NC2024.2
   001006         100900     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   001007         101000     MOVE "ADD-TEST-F3-10-3" TO PAR-NAME.                         NC2024.2 275
   001008         101100 ADD-TEST-F3-10-3.                                                NC2024.2
   001009         101200     IF XYZ-11 OF CORR-DATA-5 EQUAL TO 01                         NC2024.2 212 206
   001010      1  101300                  PERFORM PASS                                    NC2024.2 425
   001011      1  101400                  GO TO ADD-WRITE-F3-10-3.                        NC2024.2 1020
   001012         101500     GO TO ADD-FAIL-F3-10-3.                                      NC2024.2 1016
   001013         101600 ADD-DELETE-F3-10-3.                                              NC2024.2
   001014         101700     PERFORM DE-LETE.                                             NC2024.2 427
   001015         101800     GO TO ADD-WRITE-F3-10-3.                                     NC2024.2 1020
   001016         101900 ADD-FAIL-F3-10-3.                                                NC2024.2
   001017         102000     PERFORM FAIL.                                                NC2024.2 426
   001018         102100     MOVE XYZ-11 OF CORR-DATA-5 TO COMPUTED-N.                    NC2024.2 212 206 287
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001019         102200     MOVE "+01.0000" TO CORRECT-A.                                NC2024.2 300
   001020         102300 ADD-WRITE-F3-10-3.                                               NC2024.2
   001021         102400     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001022         102500*                                                                 NC2024.2
   001023         102600 ADD-INIT-F3-11.                                                  NC2024.2
   001024         102700     MOVE ZERO  TO           CORR-DATA-5.                         NC2024.2 IMP 206
   001025         102800     MOVE 10    TO XYZ-1  OF CORR-DATA-5.                         NC2024.2 207 206
   001026         102900     MOVE 98    TO XYZ-2  OF CORR-DATA-5.                         NC2024.2 208 206
   001027         103000     MOVE 01    TO XYZ-11 OF CORR-DATA-5.                         NC2024.2 212 206
   001028         103100     MOVE 10.45 TO XYZ-1  OF CORR-DATA-7.                         NC2024.2 222 221
   001029         103200     MOVE  0.9  TO XYZ-2  OF CORR-DATA-7.                         NC2024.2 225 221
   001030         103300     MOVE ZERO  TO XYZ-11 OF CORR-DATA-7.                         NC2024.2 IMP 224 221
   001031         103400 ADD-INIT-F3-11-1.                                                NC2024.2
   001032         103500     MOVE "ADD-TEST-F3-11-1" TO PAR-NAME.                         NC2024.2 275
   001033         103600 ADD-TEST-F3-11-1.                                                NC2024.2
   001034         103700     ADD CORRESPONDING CORR-DATA-7 TO CORR-DATA-5 ROUNDED.        NC2024.2 221 206
   001035         103800     IF XYZ-1 OF CORR-DATA-5 EQUAL TO 20                          NC2024.2 207 206
   001036      1  103900                 PERFORM PASS                                     NC2024.2 425
   001037      1  104000                 GO TO ADD-WRITE-F3-11-1.                         NC2024.2 1046
   001038         104100     GO TO ADD-FAIL-F3-11-1.                                      NC2024.2 1042
   001039         104200 ADD-DELETE-F3-11-1.                                              NC2024.2
   001040         104300     PERFORM DE-LETE.                                             NC2024.2 427
   001041         104400     GO TO ADD-WRITE-F3-11-1.                                     NC2024.2 1046
   001042         104500 ADD-FAIL-F3-11-1.                                                NC2024.2
   001043         104600     PERFORM FAIL.                                                NC2024.2 426
   001044         104700     MOVE XYZ-1 OF CORR-DATA-5 TO COMPUTED-N.                     NC2024.2 207 206 287
   001045         104800     MOVE 20.0000 TO CORRECT-N.                                   NC2024.2 301
   001046         104900 ADD-WRITE-F3-11-1.                                               NC2024.2
   001047         105000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001048         105100*                                                                 NC2024.2
   001049         105200 ADD-INIT-F3-11-2.                                                NC2024.2
   001050         105300     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   001051         105400     MOVE "ADD-TEST-F3-11-2" TO PAR-NAME.                         NC2024.2 275
   001052         105500 ADD-TEST-F3-11-2.                                                NC2024.2
   001053         105600     IF XYZ-2 OF CORR-DATA-5 EQUAL TO 99                          NC2024.2 208 206
   001054      1  105700                 PERFORM PASS                                     NC2024.2 425
   001055      1  105800                 GO TO ADD-WRITE-F3-11-2.                         NC2024.2 1064
   001056         105900     GO TO ADD-FAIL-F3-11-2.                                      NC2024.2 1060
   001057         106000 ADD-DELETE-F3-11-2.                                              NC2024.2
   001058         106100     PERFORM DE-LETE.                                             NC2024.2 427
   001059         106200     GO TO ADD-WRITE-F3-11-2.                                     NC2024.2 1064
   001060         106300 ADD-FAIL-F3-11-2.                                                NC2024.2
   001061         106400     MOVE XYZ-2 OF CORR-DATA-5 TO COMPUTED-N.                     NC2024.2 208 206 287
   001062         106500     MOVE "+99.0000" TO CORRECT-A.                                NC2024.2 300
   001063         106600     PERFORM FAIL.                                                NC2024.2 426
   001064         106700 ADD-WRITE-F3-11-2.                                               NC2024.2
   001065         106800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001066         106900*                                                                 NC2024.2
   001067         107000 ADD-INIT-F3-12.                                                  NC2024.2
   001068         107100     MOVE   "VI-74 6.6.4 GR3" TO ANSI-REFERENCE.                  NC2024.2 331
   001069         107200     MOVE "ADD-TEST-F3-12" TO PAR-NAME.                           NC2024.2 275
   001070         107300     MOVE ZERO  TO           CORR-DATA-5.                         NC2024.2 IMP 206
   001071         107400     MOVE 10    TO XYZ-1  OF CORR-DATA-5.                         NC2024.2 207 206
   001072         107500     MOVE 99    TO XYZ-2  OF CORR-DATA-5.                         NC2024.2 208 206
   001073         107600     MOVE 01    TO XYZ-11 OF CORR-DATA-5.                         NC2024.2 212 206
   001074         107700     MOVE 10.45 TO XYZ-1  OF CORR-DATA-7.                         NC2024.2 222 221
   001075         107800     MOVE  0.9  TO XYZ-2  OF CORR-DATA-7.                         NC2024.2 225 221
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001076         107900     MOVE ZERO  TO XYZ-11 OF CORR-DATA-7.                         NC2024.2 IMP 224 221
   001077         108000     MOVE SPACE TO WRK-AN-00001.                                  NC2024.2 IMP 50
   001078         108100 ADD-TEST-F3-12.                                                  NC2024.2
   001079         108200     ADD CORRESPONDING CORR-DATA-7 TO CORR-DATA-5 ROUNDED         NC2024.2 221 206
   001080      1  108300       ON SIZE ERROR MOVE "W" TO WRK-AN-00001.                    NC2024.2 50
   001081         108400     IF WRK-AN-00001 EQUAL TO "W"                                 NC2024.2 50
   001082      1  108500                  PERFORM PASS                                    NC2024.2 425
   001083      1  108600                  GO TO ADD-WRITE-F3-12.                          NC2024.2 1091
   001084         108700     GO TO ADD-FAIL-F3-12.                                        NC2024.2 1088
   001085         108800 ADD-DELETE-F3-12.                                                NC2024.2
   001086         108900     PERFORM DE-LETE.                                             NC2024.2 427
   001087         109000     GO TO ADD-WRITE-F3-12.                                       NC2024.2 1091
   001088         109100 ADD-FAIL-F3-12.                                                  NC2024.2
   001089         109200     PERFORM FAIL.                                                NC2024.2 426
   001090         109300     MOVE "ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.          NC2024.2 280
   001091         109400 ADD-WRITE-F3-12.                                                 NC2024.2
   001092         109500     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001093         109600*                                                                 NC2024.2
   001094         109700 ADD-INIT-F3-13.                                                  NC2024.2
   001095         109800     MOVE "ADD-TEST-F3-13" TO PAR-NAME.                           NC2024.2 275
   001096         109900     MOVE   "VI-74 6.6.4" TO ANSI-REFERENCE.                      NC2024.2 331
   001097         110000     MOVE  "ADD CORRESPONDING" TO FEATURE.                        NC2024.2 271
   001098         110100 BUILD-TABLE1.                                                    NC2024.2
   001099         110200     MOVE 06 TO RECORD1 OF TABLE1.                                NC2024.2 39 38
   001100         110300     MOVE 01 TO RECORD2 OF TABLE1 (1).                            NC2024.2 40 38
   001101         110400     MOVE 02 TO RECORD2 OF TABLE1 (2).                            NC2024.2 40 38
   001102         110500     MOVE 07 TO RECORD3 OF TABLE1.                                NC2024.2 43 38
   001103         110600 BUILD-TABLE2.                                                    NC2024.2
   001104         110700     MOVE 08 TO RECORD1 OF TABLE2.                                NC2024.2 45 44
   001105         110800     MOVE 03 TO RECORD2 OF TABLE2 (1).                            NC2024.2 46 44
   001106         110900     MOVE 04 TO RECORD2 OF TABLE2 (2).                            NC2024.2 46 44
   001107         111000     MOVE 09 TO RECORD3 OF TABLE2.                                NC2024.2 49 44
   001108         111100 ADD-TEST-F3-13.                                                  NC2024.2
   001109         111200     ADD CORRESPONDING TABLE1 TO TABLE2.                          NC2024.2 38 44

 ==001109==> IGYPS2168-W "CORRESPONDING" was specified, but subordinate item "RECORD2" within
                         "TABLE1" did not qualify according to the rules for the "CORRESPONDING"
                         phrase.  Subordinate item "RECORD2" was ignored.

   001110         111300     IF RECORD1 OF TABLE2 = 14 AND                                NC2024.2 45 44
   001111         111400        RECORD2 OF TABLE2 (1) = 03 AND                            NC2024.2 46 44
   001112         111500        RECORD2 OF TABLE2 (2) = 04 AND                            NC2024.2 46 44
   001113         111600        RECORD3 OF TABLE2 = 16                                    NC2024.2 49 44
   001114      1  111700           PERFORM PASS                                           NC2024.2 425
   001115      1  111800           GO TO ADD-WRITE-F3-13.                                 NC2024.2 1124
   001116         111900     GO TO ADD-FAIL-F3-13.                                        NC2024.2 1120
   001117         112000 ADD-DELETE-F3-13.                                                NC2024.2
   001118         112100     PERFORM DE-LETE.                                             NC2024.2 427
   001119         112200     GO TO ADD-WRITE-F3-13.                                       NC2024.2 1124
   001120         112300 ADD-FAIL-F3-13.                                                  NC2024.2
   001121         112400     PERFORM FAIL.                                                NC2024.2 426
   001122         112500     MOVE TABLE2 TO COMPUTED-A.                                   NC2024.2 44 286
   001123         112600     MOVE "14030416" TO CORRECT-A.                                NC2024.2 300
   001124         112700 ADD-WRITE-F3-13.                                                 NC2024.2
   001125         112800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001126         112900*                                                                 NC2024.2
   001127         113000 ADD-INIT-F3-14.                                                  NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001128         113100     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001129         113200*    ===-->  NO SIZE ERROR  <--===                                NC2024.2
   001130         113300     MOVE    1 TO REC-CT.                                         NC2024.2 322
   001131         113400     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001132         113500     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001133         113600     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001134         113700     MOVE    88888  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001135         113800     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001136         113900     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001137         114000     MOVE   "ADD-TEST-F3-14-0" TO PAR-NAME.                       NC2024.2 275
   001138         114100 ADD-TEST-F3-14-1.                                                NC2024.2
   001139         114200     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001140         114300             ON SIZE ERROR                                        NC2024.2
   001141      1  114400             GO TO ADD-FAIL-F3-14-1.                              NC2024.2 1147
   001142         114500     PERFORM PASS.                                                NC2024.2 425
   001143         114600     GO TO   ADD-WRITE-F3-14-1.                                   NC2024.2 1151
   001144         114700 ADD-DELETE-F3-14-1.                                              NC2024.2
   001145         114800     PERFORM DE-LETE.                                             NC2024.2 427
   001146         114900     GO TO ADD-WRITE-F3-14-1.                                     NC2024.2 1151
   001147         115000 ADD-FAIL-F3-14-1.                                                NC2024.2
   001148         115100     MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"                NC2024.2
   001149         115200            TO RE-MARK                                            NC2024.2 280
   001150         115300     PERFORM FAIL.                                                NC2024.2 426
   001151         115400 ADD-WRITE-F3-14-1.                                               NC2024.2
   001152         115500     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001153         115600*                                                                 NC2024.2
   001154         115700 ADD-INIT-F3-14-2.                                                NC2024.2
   001155         115800     MOVE   "ADD-TEST-F3-14-2" TO PAR-NAME.                       NC2024.2 275
   001156         115900     ADD     1 TO REC-CT.                                         NC2024.2 322
   001157         116000 ADD-TEST-F3-14-2.                                                NC2024.2
   001158         116100     IF      FIELD1 OF ADD-16 EQUAL TO 88889                      NC2024.2 155 154
   001159      1  116200             PERFORM PASS                                         NC2024.2 425
   001160      1  116300             GO TO ADD-WRITE-F3-14-2.                             NC2024.2 1169
   001161         116400     GO TO ADD-FAIL-F3-14-2.                                      NC2024.2 1165
   001162         116500 ADD-DELETE-F3-14-2.                                              NC2024.2
   001163         116600     PERFORM DE-LETE                                              NC2024.2 427
   001164         116700     GO TO ADD-WRITE-F3-14-2.                                     NC2024.2 1169
   001165         116800 ADD-FAIL-F3-14-2.                                                NC2024.2
   001166         116900     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001167         117000     MOVE    88889 TO CORRECT-N                                   NC2024.2 301
   001168         117100     PERFORM FAIL.                                                NC2024.2 426
   001169         117200 ADD-WRITE-F3-14-2.                                               NC2024.2
   001170         117300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001171         117400*                                                                 NC2024.2
   001172         117500 ADD-INIT-F3-14-3.                                                NC2024.2
   001173         117600     MOVE   "ADD-TEST-F3-14-3" TO PAR-NAME.                       NC2024.2 275
   001174         117700     ADD     1 TO REC-CT.                                         NC2024.2 322
   001175         117800 ADD-TEST-F3-14-3.                                                NC2024.2
   001176         117900     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001177      1  118000             PERFORM PASS                                         NC2024.2 425
   001178      1  118100             GO TO ADD-WRITE-F3-14-3.                             NC2024.2 1187
   001179         118200     GO TO ADD-FAIL-F3-14-3.                                      NC2024.2 1183
   001180         118300 ADD-DELETE-F3-14-3.                                              NC2024.2
   001181         118400     PERFORM DE-LETE.                                             NC2024.2 427
   001182         118500     GO TO ADD-WRITE-F3-14-3.                                     NC2024.2 1187
   001183         118600 ADD-FAIL-F3-14-3.                                                NC2024.2
   001184         118700     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001185         118800     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001186         118900     PERFORM FAIL.                                                NC2024.2 426
   001187         119000 ADD-WRITE-F3-14-3.                                               NC2024.2
   001188         119100     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001189         119200*                                                                 NC2024.2
   001190         119300 ADD-INIT-F3-14-4.                                                NC2024.2
   001191         119400     MOVE   "ADD-TEST-F3-14-4" TO PAR-NAME.                       NC2024.2 275
   001192         119500     ADD     1 TO REC-CT.                                         NC2024.2 322
   001193         119600 ADD-TEST-F3-14-4.                                                NC2024.2
   001194         119700     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001195      1  119800             PERFORM PASS                                         NC2024.2 425
   001196      1  119900             GO TO ADD-WRITE-F3-14-4.                             NC2024.2 1205
   001197         120000     GO TO ADD-FAIL-F3-14-4.                                      NC2024.2 1201
   001198         120100 ADD-DELETE-F3-14-4.                                              NC2024.2
   001199         120200     PERFORM DE-LETE.                                             NC2024.2 427
   001200         120300     GO TO ADD-WRITE-F3-14-4.                                     NC2024.2 1205
   001201         120400 ADD-FAIL-F3-14-4.                                                NC2024.2
   001202         120500     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001203         120600     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001204         120700     PERFORM FAIL.                                                NC2024.2 426
   001205         120800 ADD-WRITE-F3-14-4.                                               NC2024.2
   001206         120900     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001207         121000*                                                                 NC2024.2
   001208         121100 ADD-INIT-F3-15.                                                  NC2024.2
   001209         121200*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2024.2
   001210         121300*    ===-->      SIZE ERROR        <--===                         NC2024.2
   001211         121400     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001212         121500     MOVE    0 TO REC-CT.                                         NC2024.2 322
   001213         121600     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001214         121700     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001215         121800     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001216         121900     MOVE    99999  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001217         122000     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001218         122100     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001219         122200*                                                                 NC2024.2
   001220         122300 ADD-INIT-F3-15-1.                                                NC2024.2
   001221         122400     MOVE   "ADD-TEST-F3-15-1" TO PAR-NAME.                       NC2024.2 275
   001222         122500     ADD     1 TO REC-CT.                                         NC2024.2 322
   001223         122600 ADD-TEST-F3-15-1.                                                NC2024.2
   001224         122700     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001225         122800         NOT ON SIZE ERROR                                        NC2024.2
   001226      1  122900             GO TO ADD-FAIL-F3-15-1.                              NC2024.2 1232
   001227         123000     PERFORM PASS.                                                NC2024.2 425
   001228         123100     GO TO ADD-WRITE-F3-15-1.                                     NC2024.2 1236
   001229         123200 ADD-DELETE-F3-15-1.                                              NC2024.2
   001230         123300     PERFORM DE-LETE.                                             NC2024.2 427
   001231         123400     GO TO   ADD-WRITE-F3-15-1.                                   NC2024.2 1236
   001232         123500 ADD-FAIL-F3-15-1.                                                NC2024.2
   001233         123600     MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"            NC2024.2
   001234         123700     TO RE-MARK                                                   NC2024.2 280
   001235         123800     PERFORM FAIL.                                                NC2024.2 426
   001236         123900 ADD-WRITE-F3-15-1.                                               NC2024.2
   001237         124000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001238         124100*                                                                 NC2024.2
   001239         124200 ADD-INIT-F3-15-2.                                                NC2024.2
   001240         124300     MOVE   "ADD-TEST-F3-15-2" TO PAR-NAME.                       NC2024.2 275
   001241         124400     ADD     1 TO REC-CT.                                         NC2024.2 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001242         124500 ADD-TEST-F3-15-2.                                                NC2024.2
   001243         124600     IF      FIELD1 OF ADD-16 EQUAL TO 99999                      NC2024.2 155 154
   001244      1  124700             PERFORM PASS                                         NC2024.2 425
   001245      1  124800             GO TO ADD-WRITE-F3-15-2.                             NC2024.2 1254
   001246         124900     GO TO ADD-FAIL-F3-15-2.                                      NC2024.2 1250
   001247         125000 ADD-DELETE-F3-15-2.                                              NC2024.2
   001248         125100     PERFORM DE-LETE.                                             NC2024.2 427
   001249         125200     GO TO ADD-WRITE-F3-15-2.                                     NC2024.2 1254
   001250         125300 ADD-FAIL-F3-15-2.                                                NC2024.2
   001251         125400     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001252         125500     MOVE    99999 TO CORRECT-N                                   NC2024.2 301
   001253         125600     PERFORM FAIL.                                                NC2024.2 426
   001254         125700 ADD-WRITE-F3-15-2.                                               NC2024.2
   001255         125800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001256         125900*                                                                 NC2024.2
   001257         126000 ADD-INIT-F3-15-3.                                                NC2024.2
   001258         126100     MOVE   "ADD-TEST-F3-15-3" TO PAR-NAME.                       NC2024.2 275
   001259         126200     ADD     1 TO REC-CT.                                         NC2024.2 322
   001260         126300 ADD-TEST-F3-15-3.                                                NC2024.2
   001261         126400     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001262      1  126500             PERFORM PASS                                         NC2024.2 425
   001263      1  126600             GO TO ADD-WRITE-F3-15-3.                             NC2024.2 1272
   001264         126700     GO TO ADD-FAIL-F3-15-3.                                      NC2024.2 1268
   001265         126800 ADD-DELETE-F3-15-3.                                              NC2024.2
   001266         126900     PERFORM DE-LETE.                                             NC2024.2 427
   001267         127000     GO TO ADD-WRITE-F3-15-3.                                     NC2024.2 1272
   001268         127100 ADD-FAIL-F3-15-3.                                                NC2024.2
   001269         127200     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001270         127300     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001271         127400     PERFORM FAIL.                                                NC2024.2 426
   001272         127500 ADD-WRITE-F3-15-3.                                               NC2024.2
   001273         127600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001274         127700*                                                                 NC2024.2
   001275         127800 ADD-INIT-F3-15-4.                                                NC2024.2
   001276         127900     MOVE   "ADD-TEST-F3-15-4" TO PAR-NAME.                       NC2024.2 275
   001277         128000     ADD     1 TO REC-CT.                                         NC2024.2 322
   001278         128100 ADD-TEST-F3-15-4.                                                NC2024.2
   001279         128200     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001280      1  128300             PERFORM PASS                                         NC2024.2 425
   001281      1  128400             GO TO ADD-WRITE-F3-15-4.                             NC2024.2 1290
   001282         128500     GO TO ADD-FAIL-F3-15-4.                                      NC2024.2 1286
   001283         128600 ADD-DELETE-F3-15-4.                                              NC2024.2
   001284         128700     PERFORM DE-LETE.                                             NC2024.2 427
   001285         128800     GO TO ADD-WRITE-F3-15-4.                                     NC2024.2 1290
   001286         128900 ADD-FAIL-F3-15-4.                                                NC2024.2
   001287         129000     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001288         129100     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001289         129200     PERFORM FAIL.                                                NC2024.2 426
   001290         129300 ADD-WRITE-F3-15-4.                                               NC2024.2
   001291         129400             PERFORM PRINT-DETAIL.                                NC2024.2 429
   001292         129500*                                                                 NC2024.2
   001293         129600 ADD-INIT-F3-16.                                                  NC2024.2
   001294         129700*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2024.2
   001295         129800*    ===-->   NO SIZE ERROR        <--===                         NC2024.2
   001296         129900     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001297         130000     MOVE    1 TO REC-CT.                                         NC2024.2 322
   001298         130100     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001299         130200     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001300         130300     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001301         130400     MOVE    88888  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001302         130500     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001303         130600     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001304         130700 ADD-INIT-F3-16-1.                                                NC2024.2
   001305         130800     MOVE   "ADD-TEST-F3-16-1" TO PAR-NAME.                       NC2024.2 275
   001306         130900 ADD-TEST-F3-16-1.                                                NC2024.2
   001307         131000     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001308         131100         NOT ON SIZE ERROR                                        NC2024.2
   001309      1  131200             PERFORM PASS                                         NC2024.2 425
   001310      1  131300             GO TO ADD-WRITE-F3-16-1.                             NC2024.2 1318
   001311         131400     GO TO   ADD-FAIL-F3-16-1.                                    NC2024.2 1315
   001312         131500 ADD-DELETE-F3-16-1.                                              NC2024.2
   001313         131600     PERFORM DE-LETE.                                             NC2024.2 427
   001314         131700     GO TO ADD-WRITE-F3-16-1.                                     NC2024.2 1318
   001315         131800 ADD-FAIL-F3-16-1.                                                NC2024.2
   001316         131900     MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED" TO RE-MARK.    NC2024.2 280
   001317         132000     PERFORM FAIL.                                                NC2024.2 426
   001318         132100 ADD-WRITE-F3-16-1.                                               NC2024.2
   001319         132200     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001320         132300*                                                                 NC2024.2
   001321         132400 ADD-INIT-F3-16-2.                                                NC2024.2
   001322         132500     MOVE   "ADD-TEST-F3-16-2" TO PAR-NAME.                       NC2024.2 275
   001323         132600     ADD     1 TO REC-CT.                                         NC2024.2 322
   001324         132700 ADD-TEST-F3-16-2.                                                NC2024.2
   001325         132800     IF      FIELD1 OF ADD-16 EQUAL TO 88889                      NC2024.2 155 154
   001326      1  132900             PERFORM PASS                                         NC2024.2 425
   001327      1  133000             GO TO ADD-WRITE-F3-16-2.                             NC2024.2 1336
   001328         133100     GO TO ADD-FAIL-F3-16-2.                                      NC2024.2 1332
   001329         133200 ADD-DELETE-F3-16-2.                                              NC2024.2
   001330         133300     PERFORM DE-LETE.                                             NC2024.2 427
   001331         133400     GO TO ADD-WRITE-F3-16-2.                                     NC2024.2 1336
   001332         133500 ADD-FAIL-F3-16-2.                                                NC2024.2
   001333         133600     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001334         133700     MOVE    88889 TO CORRECT-N                                   NC2024.2 301
   001335         133800     PERFORM FAIL.                                                NC2024.2 426
   001336         133900 ADD-WRITE-F3-16-2.                                               NC2024.2
   001337         134000             PERFORM PRINT-DETAIL.                                NC2024.2 429
   001338         134100*                                                                 NC2024.2
   001339         134200 ADD-INIT-F3-16-3.                                                NC2024.2
   001340         134300     MOVE   "ADD-TEST-F3-16-3" TO PAR-NAME.                       NC2024.2 275
   001341         134400     ADD     1 TO REC-CT.                                         NC2024.2 322
   001342         134500 ADD-TEST-F3-16-3.                                                NC2024.2
   001343         134600     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001344      1  134700             PERFORM PASS                                         NC2024.2 425
   001345      1  134800             GO TO ADD-WRITE-F3-16-3.                             NC2024.2 1354
   001346         134900     GO TO ADD-FAIL-F3-16-3.                                      NC2024.2 1350
   001347         135000 ADD-DELETE-F3-16-3.                                              NC2024.2
   001348         135100     PERFORM DE-LETE.                                             NC2024.2 427
   001349         135200     GO TO ADD-WRITE-F3-16-3.                                     NC2024.2 1354
   001350         135300 ADD-FAIL-F3-16-3.                                                NC2024.2
   001351         135400     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001352         135500     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001353         135600     PERFORM FAIL.                                                NC2024.2 426
   001354         135700 ADD-WRITE-F3-16-3.                                               NC2024.2
   001355         135800             PERFORM PRINT-DETAIL.                                NC2024.2 429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001356         135900*                                                                 NC2024.2
   001357         136000 ADD-INIT-F3-16-4.                                                NC2024.2
   001358         136100     MOVE   "ADD-TEST-F3-16-4" TO PAR-NAME.                       NC2024.2 275
   001359         136200     ADD     1 TO REC-CT.                                         NC2024.2 322
   001360         136300 ADD-TEST-F3-16-4.                                                NC2024.2
   001361         136400     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001362      1  136500             PERFORM PASS                                         NC2024.2 425
   001363      1  136600             GO TO ADD-WRITE-F3-16-4.                             NC2024.2 1372
   001364         136700     GO TO ADD-FAIL-F3-16-4.                                      NC2024.2 1368
   001365         136800 ADD-DELETE-F3-16-4.                                              NC2024.2
   001366         136900     PERFORM DE-LETE.                                             NC2024.2 427
   001367         137000     GO TO ADD-WRITE-F3-16-4.                                     NC2024.2 1372
   001368         137100 ADD-FAIL-F3-16-4.                                                NC2024.2
   001369         137200     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001370         137300     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001371         137400     PERFORM FAIL.                                                NC2024.2 426
   001372         137500 ADD-WRITE-F3-16-4.                                               NC2024.2
   001373         137600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001374         137700*                                                                 NC2024.2
   001375         137800 ADD-INIT-F3-17.                                                  NC2024.2
   001376         137900*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2024.2
   001377         138000*    ===-->      SIZE ERROR        <--===                         NC2024.2
   001378         138100     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001379         138200     MOVE    1 TO REC-CT.                                         NC2024.2 322
   001380         138300     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001381         138400     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001382         138500     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001383         138600     MOVE    99999  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001384         138700     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001385         138800     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001386         138900 ADD-INIT-F3-17-1.                                                NC2024.2
   001387         139000     MOVE   "ADD-TEST-F3-17-1" TO PAR-NAME.                       NC2024.2 275
   001388         139100 ADD-TEST-F3-17-1.                                                NC2024.2
   001389         139200     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001390         139300             ON SIZE ERROR                                        NC2024.2
   001391      1  139400             PERFORM PASS                                         NC2024.2 425
   001392      1  139500             GO TO ADD-WRITE-F3-17-1                              NC2024.2 1402
   001393         139600         NOT ON SIZE ERROR                                        NC2024.2
   001394      1  139700             GO TO ADD-FAIL-F3-17-1.                              NC2024.2 1398
   001395         139800 ADD-DELETE-F3-17.                                                NC2024.2
   001396         139900     PERFORM DE-LETE.                                             NC2024.2 427
   001397         140000     GO TO   ADD-WRITE-F3-17-1.                                   NC2024.2 1402
   001398         140100 ADD-FAIL-F3-17-1.                                                NC2024.2
   001399         140200     MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"                    NC2024.2
   001400         140300          TO RE-MARK                                              NC2024.2 280
   001401         140400     PERFORM FAIL.                                                NC2024.2 426
   001402         140500 ADD-WRITE-F3-17-1.                                               NC2024.2
   001403         140600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001404         140700*                                                                 NC2024.2
   001405         140800 ADD-INIT-F3-17-2.                                                NC2024.2
   001406         140900     MOVE   "ADD-TEST-F3-17-2" TO PAR-NAME.                       NC2024.2 275
   001407         141000     ADD     1 TO REC-CT.                                         NC2024.2 322
   001408         141100 ADD-TEST-F3-17-2.                                                NC2024.2
   001409         141200     IF      FIELD1 OF ADD-16 EQUAL TO 99999                      NC2024.2 155 154
   001410      1  141300             PERFORM PASS                                         NC2024.2 425
   001411      1  141400             GO TO ADD-WRITE-F3-17-2.                             NC2024.2 1420
   001412         141500     GO TO ADD-FAIL-F3-17-2.                                      NC2024.2 1416
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001413         141600 ADD-DELETE-F3-17-2.                                              NC2024.2
   001414         141700     PERFORM DE-LETE.                                             NC2024.2 427
   001415         141800     GO TO ADD-WRITE-F3-17-2.                                     NC2024.2 1420
   001416         141900 ADD-FAIL-F3-17-2.                                                NC2024.2
   001417         142000     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001418         142100     MOVE    99999 TO CORRECT-N                                   NC2024.2 301
   001419         142200     PERFORM FAIL.                                                NC2024.2 426
   001420         142300 ADD-WRITE-F3-17-2.                                               NC2024.2
   001421         142400     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001422         142500*                                                                 NC2024.2
   001423         142600 ADD-INIT-F3-17-3.                                                NC2024.2
   001424         142700     MOVE   "ADD-TEST-F3-17-3" TO PAR-NAME.                       NC2024.2 275
   001425         142800     ADD     1 TO REC-CT.                                         NC2024.2 322
   001426         142900 ADD-TEST-F3-17-3.                                                NC2024.2
   001427         143000     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001428      1  143100             PERFORM PASS                                         NC2024.2 425
   001429      1  143200             GO TO ADD-WRITE-F3-17-3.                             NC2024.2 1438
   001430         143300     GO TO ADD-FAIL-F3-17-3.                                      NC2024.2 1434
   001431         143400 ADD-DELETE-F3-17-3.                                              NC2024.2
   001432         143500     PERFORM DE-LETE.                                             NC2024.2 427
   001433         143600     GO TO ADD-WRITE-F3-17-3.                                     NC2024.2 1438
   001434         143700 ADD-FAIL-F3-17-3.                                                NC2024.2
   001435         143800     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001436         143900     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001437         144000     PERFORM FAIL.                                                NC2024.2 426
   001438         144100 ADD-WRITE-F3-17-3.                                               NC2024.2
   001439         144200     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001440         144300*                                                                 NC2024.2
   001441         144400 ADD-INIT-F3-17-4.                                                NC2024.2
   001442         144500     MOVE   "ADD-TEST-F3-17-4" TO PAR-NAME.                       NC2024.2 275
   001443         144600     ADD     1 TO REC-CT.                                         NC2024.2 322
   001444         144700 ADD-TEST-F3-17-4.                                                NC2024.2
   001445         144800     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001446      1  144900             PERFORM PASS                                         NC2024.2 425
   001447      1  145000             GO TO ADD-WRITE-F3-17-4.                             NC2024.2 1456
   001448         145100     GO TO ADD-FAIL-F3-17-4.                                      NC2024.2 1452
   001449         145200 ADD-DELETE-F3-17-4.                                              NC2024.2
   001450         145300     PERFORM DE-LETE.                                             NC2024.2 427
   001451         145400     GO TO ADD-WRITE-F3-17-4.                                     NC2024.2 1456
   001452         145500 ADD-FAIL-F3-17-4.                                                NC2024.2
   001453         145600     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001454         145700     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001455         145800     PERFORM FAIL.                                                NC2024.2 426
   001456         145900 ADD-WRITE-F3-17-4.                                               NC2024.2
   001457         146000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001458         146100*                                                                 NC2024.2
   001459         146200 ADD-INIT-F3-18.                                                  NC2024.2
   001460         146300*    ===-->  NEW SIZE ERROR TESTS  <--===                         NC2024.2
   001461         146400*    ===-->   NO SIZE ERROR        <--===                         NC2024.2
   001462         146500     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001463         146600     MOVE    1 TO REC-CT.                                         NC2024.2 322
   001464         146700     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001465         146800     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001466         146900     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001467         147000     MOVE    88888  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001468         147100     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001469         147200     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001470         147300 ADD-INIT-F3-18-1.                                                NC2024.2
   001471         147400     MOVE   "ADD-TEST-F3-18-1" TO PAR-NAME.                       NC2024.2 275
   001472         147500 ADD-TEST-F3-18-1.                                                NC2024.2
   001473         147600     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001474         147700             ON SIZE ERROR                                        NC2024.2
   001475      1  147800             GO TO ADD-FAIL-F3-18-1                               NC2024.2 1482
   001476         147900         NOT ON SIZE ERROR                                        NC2024.2
   001477      1  148000             PERFORM PASS                                         NC2024.2 425
   001478      1  148100             GO TO ADD-WRITE-F3-18-1.                             NC2024.2 1486
   001479         148200 ADD-DELETE-F3-18-1.                                              NC2024.2
   001480         148300     PERFORM DE-LETE.                                             NC2024.2 427
   001481         148400     GO TO ADD-WRITE-F3-18-1.                                     NC2024.2 1486
   001482         148500 ADD-FAIL-F3-18-1.                                                NC2024.2
   001483         148600     MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"                NC2024.2
   001484         148700         TO RE-MARK                                               NC2024.2 280
   001485         148800     PERFORM FAIL.                                                NC2024.2 426
   001486         148900 ADD-WRITE-F3-18-1.                                               NC2024.2
   001487         149000             PERFORM PRINT-DETAIL.                                NC2024.2 429
   001488         149100*                                                                 NC2024.2
   001489         149200 ADD-INIT-F3-18-2.                                                NC2024.2
   001490         149300     MOVE   "ADD-TEST-F3-18-2" TO PAR-NAME.                       NC2024.2 275
   001491         149400     ADD     1 TO REC-CT.                                         NC2024.2 322
   001492         149500 ADD-TEST-F3-18-2.                                                NC2024.2
   001493         149600     IF      FIELD1 OF ADD-16 EQUAL TO 88889                      NC2024.2 155 154
   001494      1  149700             PERFORM PASS                                         NC2024.2 425
   001495      1  149800             GO TO ADD-WRITE-F3-18-2.                             NC2024.2 1504
   001496         149900     GO TO ADD-FAIL-F3-18-2.                                      NC2024.2 1500
   001497         150000 ADD-DELETE-F3-18-2.                                              NC2024.2
   001498         150100     PERFORM DE-LETE                                              NC2024.2 427
   001499         150200     GO TO ADD-WRITE-F3-18-2.                                     NC2024.2 1504
   001500         150300 ADD-FAIL-F3-18-2.                                                NC2024.2
   001501         150400     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001502         150500     MOVE    88889 TO CORRECT-N                                   NC2024.2 301
   001503         150600     PERFORM FAIL.                                                NC2024.2 426
   001504         150700 ADD-WRITE-F3-18-2.                                               NC2024.2
   001505         150800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001506         150900*                                                                 NC2024.2
   001507         151000 ADD-INIT-F3-18-3.                                                NC2024.2
   001508         151100     MOVE   "ADD-TEST-F3-18-3" TO PAR-NAME.                       NC2024.2 275
   001509         151200     ADD     1 TO REC-CT.                                         NC2024.2 322
   001510         151300 ADD-TEST-F3-18-3.                                                NC2024.2
   001511         151400     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001512      1  151500             PERFORM PASS                                         NC2024.2 425
   001513      1  151600             GO TO ADD-WRITE-F3-18-3.                             NC2024.2 1522
   001514         151700     GO TO ADD-FAIL-F3-18-3.                                      NC2024.2 1518
   001515         151800 ADD-DELETE-F3-18-3.                                              NC2024.2
   001516         151900     PERFORM DE-LETE.                                             NC2024.2 427
   001517         152000     GO TO ADD-WRITE-F3-18-3.                                     NC2024.2 1522
   001518         152100 ADD-FAIL-F3-18-3.                                                NC2024.2
   001519         152200     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001520         152300     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001521         152400     PERFORM FAIL.                                                NC2024.2 426
   001522         152500 ADD-WRITE-F3-18-3.                                               NC2024.2
   001523         152600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001524         152700*                                                                 NC2024.2
   001525         152800 ADD-INIT-F3-18-4.                                                NC2024.2
   001526         152900     MOVE   "ADD-TEST-F3-18-4" TO PAR-NAME.                       NC2024.2 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001527         153000     ADD     1 TO REC-CT.                                         NC2024.2 322
   001528         153100 ADD-TEST-F3-18-4.                                                NC2024.2
   001529         153200     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001530      1  153300             PERFORM PASS                                         NC2024.2 425
   001531      1  153400             GO TO ADD-WRITE-F3-18-4.                             NC2024.2 1540
   001532         153500     GO TO ADD-FAIL-F3-18-4.                                      NC2024.2 1536
   001533         153600 ADD-DELETE-F3-18-4.                                              NC2024.2
   001534         153700     PERFORM DE-LETE.                                             NC2024.2 427
   001535         153800     GO TO ADD-WRITE-F3-18-4.                                     NC2024.2 1540
   001536         153900 ADD-FAIL-F3-18-4.                                                NC2024.2
   001537         154000     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001538         154100     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001539         154200     PERFORM FAIL.                                                NC2024.2 426
   001540         154300 ADD-WRITE-F3-18-4.                                               NC2024.2
   001541         154400     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001542         154500*                                                                 NC2024.2
   001543         154600 ADD-INIT-F3-19.                                                  NC2024.2
   001544         154700*    ===-->  EXPLICIT SCOPE TERMINATOR<--===                      NC2024.2
   001545         154800*    ===-->        SIZE ERROR         <--===                      NC2024.2
   001546         154900     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001547         155000     MOVE    SPACE  TO WRK-XN-00001.                              NC2024.2 IMP 51
   001548         155100     MOVE    SPACE  TO WRK-AN-00001.                              NC2024.2 IMP 50
   001549         155200     MOVE    0      TO REC-CT.                                    NC2024.2 322
   001550         155300     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001551         155400     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001552         155500     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001553         155600     MOVE    99999  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001554         155700     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001555         155800     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001556         155900     MOVE   "ADD-TEST-F3-19-0" TO PAR-NAME.                       NC2024.2 275
   001557         156000 ADD-TEST-F3-19-0.                                                NC2024.2
   001558         156100     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001559         156200             ON SIZE ERROR                                        NC2024.2
   001560      1  156300             MOVE   "A" TO WRK-AN-00001                           NC2024.2 50
   001561         156400     END-ADD                                                      NC2024.2
   001562         156500     MOVE   "B" TO WRK-XN-00001.                                  NC2024.2 51
   001563         156600*                                                                 NC2024.2
   001564         156700 ADD-INIT-F3-19-1.                                                NC2024.2
   001565         156800     MOVE   "ADD-TEST-F3-19-1" TO PAR-NAME.                       NC2024.2 275
   001566         156900     ADD     1 TO REC-CT.                                         NC2024.2 322
   001567         157000 ADD-TEST-F3-19-1.                                                NC2024.2
   001568         157100     IF      FIELD1 OF ADD-16 EQUAL TO 99999                      NC2024.2 155 154
   001569      1  157200             PERFORM PASS                                         NC2024.2 425
   001570      1  157300             GO TO ADD-WRITE-F3-19-1.                             NC2024.2 1579
   001571         157400     GO TO ADD-FAIL-F3-19-1.                                      NC2024.2 1575
   001572         157500 ADD-DELETE-F3-19-1.                                              NC2024.2
   001573         157600     PERFORM DE-LETE.                                             NC2024.2 427
   001574         157700     GO TO ADD-WRITE-F3-19-1.                                     NC2024.2 1579
   001575         157800 ADD-FAIL-F3-19-1.                                                NC2024.2
   001576         157900     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001577         158000     MOVE    99999 TO CORRECT-N                                   NC2024.2 301
   001578         158100     PERFORM FAIL.                                                NC2024.2 426
   001579         158200 ADD-WRITE-F3-19-1.                                               NC2024.2
   001580         158300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001581         158400*                                                                 NC2024.2
   001582         158500 ADD-INIT-F3-19-2.                                                NC2024.2
   001583         158600     MOVE   "ADD-TEST-F3-19-2" TO PAR-NAME.                       NC2024.2 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001584         158700     ADD     1 TO REC-CT.                                         NC2024.2 322
   001585         158800 ADD-TEST-F3-19-2.                                                NC2024.2
   001586         158900     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001587      1  159000             PERFORM PASS                                         NC2024.2 425
   001588      1  159100             GO TO ADD-WRITE-F3-19-2.                             NC2024.2 1597
   001589         159200     GO TO ADD-FAIL-F3-19-2.                                      NC2024.2 1593
   001590         159300 ADD-DELETE-F3-19-2.                                              NC2024.2
   001591         159400     PERFORM DE-LETE.                                             NC2024.2 427
   001592         159500     GO TO ADD-WRITE-F3-19-2.                                     NC2024.2 1597
   001593         159600 ADD-FAIL-F3-19-2.                                                NC2024.2
   001594         159700     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001595         159800     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001596         159900     PERFORM FAIL.                                                NC2024.2 426
   001597         160000 ADD-WRITE-F3-19-2.                                               NC2024.2
   001598         160100     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001599         160200*                                                                 NC2024.2
   001600         160300 ADD-INIT-F3-19-3.                                                NC2024.2
   001601         160400     MOVE   "ADD-TEST-F3-19-3" TO PAR-NAME.                       NC2024.2 275
   001602         160500     ADD     1 TO REC-CT.                                         NC2024.2 322
   001603         160600 ADD-TEST-F3-19-3.                                                NC2024.2
   001604         160700     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001605      1  160800             PERFORM PASS                                         NC2024.2 425
   001606      1  160900             GO TO ADD-WRITE-F3-19-3.                             NC2024.2 1615
   001607         161000     GO TO ADD-FAIL-F3-19-3.                                      NC2024.2 1611
   001608         161100 ADD-DELETE-F3-19-3.                                              NC2024.2
   001609         161200     PERFORM DE-LETE.                                             NC2024.2 427
   001610         161300     GO TO ADD-WRITE-F3-19-3.                                     NC2024.2 1615
   001611         161400 ADD-FAIL-F3-19-3.                                                NC2024.2
   001612         161500     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001613         161600     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001614         161700     PERFORM FAIL.                                                NC2024.2 426
   001615         161800 ADD-WRITE-F3-19-3.                                               NC2024.2
   001616         161900     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001617         162000*                                                                 NC2024.2
   001618         162100 ADD-INIT-F3-19-4.                                                NC2024.2
   001619         162200     MOVE   "ADD-TEST-F3-19-4" TO PAR-NAME.                       NC2024.2 275
   001620         162300     ADD     1 TO REC-CT.                                         NC2024.2 322
   001621         162400 ADD-TEST-F3-19-4.                                                NC2024.2
   001622         162500     IF      WRK-AN-00001 = SPACE                                 NC2024.2 50 IMP
   001623      1  162600             GO TO ADD-FAIL-F3-19-4.                              NC2024.2 1629
   001624         162700     PERFORM PASS                                                 NC2024.2 425
   001625         162800     GO TO ADD-WRITE-F3-19-4.                                     NC2024.2 1635
   001626         162900 ADD-DELETE-F3-19-4.                                              NC2024.2
   001627         163000     PERFORM DE-LETE.                                             NC2024.2 427
   001628         163100     GO TO ADD-WRITE-F3-19-4.                                     NC2024.2 1635
   001629         163200 ADD-FAIL-F3-19-4.                                                NC2024.2
   001630         163300     MOVE   "ON SIZE ERROR SHOULD BE EXECUTED"                    NC2024.2
   001631         163400          TO RE-MARK                                              NC2024.2 280
   001632         163500     MOVE   "A"   TO COMPUTED-X                                   NC2024.2 285
   001633         163600     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2024.2 50 299
   001634         163700     PERFORM FAIL.                                                NC2024.2 426
   001635         163800 ADD-WRITE-F3-19-4.                                               NC2024.2
   001636         163900     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001637         164000*                                                                 NC2024.2
   001638         164100 ADD-INIT-F3-19-5.                                                NC2024.2
   001639         164200     MOVE   "ADD-TEST-F3-19-5" TO PAR-NAME.                       NC2024.2 275
   001640         164300     ADD     1 TO REC-CT.                                         NC2024.2 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001641         164400 ADD-TEST-F3-19-5.                                                NC2024.2
   001642         164500     IF      WRK-XN-00001 = SPACE                                 NC2024.2 51 IMP
   001643      1  164600             GO TO ADD-FAIL-F3-19-5.                              NC2024.2 1649
   001644         164700     PERFORM PASS                                                 NC2024.2 425
   001645         164800     GO TO ADD-WRITE-F3-19-5.                                     NC2024.2 1654
   001646         164900 ADD-DELETE-F3-19-5.                                              NC2024.2
   001647         165000     PERFORM DE-LETE.                                             NC2024.2 427
   001648         165100     GO TO ADD-WRITE-F3-19-5.                                     NC2024.2 1654
   001649         165200 ADD-FAIL-F3-19-5.                                                NC2024.2
   001650         165300     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2024.2 280
   001651         165400     MOVE   "B"   TO COMPUTED-X                                   NC2024.2 285
   001652         165500     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2024.2 50 299
   001653         165600     PERFORM FAIL.                                                NC2024.2 426
   001654         165700 ADD-WRITE-F3-19-5.                                               NC2024.2
   001655         165800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001656         165900*                                                                 NC2024.2
   001657         166000 ADD-INIT-F3-20.                                                  NC2024.2
   001658         166100*    ===-->  EXPLICIT SCOPE TERMINATOR<--===                      NC2024.2
   001659         166200*    ===-->     NO SIZE ERROR         <--===                      NC2024.2
   001660         166300     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001661         166400     MOVE   "ADD-TEST-F3-20-0" TO PAR-NAME.                       NC2024.2 275
   001662         166500     MOVE    SPACE  TO WRK-XN-00001.                              NC2024.2 IMP 51
   001663         166600     MOVE    SPACE  TO WRK-AN-00001.                              NC2024.2 IMP 50
   001664         166700     MOVE    0      TO REC-CT.                                    NC2024.2 322
   001665         166800     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001666         166900     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001667         167000     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001668         167100     MOVE    88888  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001669         167200     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001670         167300     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001671         167400 ADD-TEST-F3-20-0.                                                NC2024.2
   001672         167500     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001673         167600             ON SIZE ERROR                                        NC2024.2
   001674      1  167700             MOVE   "A" TO WRK-AN-00001                           NC2024.2 50
   001675         167800     END-ADD                                                      NC2024.2
   001676         167900     MOVE   "B" TO WRK-XN-00001.                                  NC2024.2 51
   001677         168000*                                                                 NC2024.2
   001678         168100 ADD-INIT-F3-20-1.                                                NC2024.2
   001679         168200     MOVE   "ADD-TEST-F3-20-1" TO PAR-NAME.                       NC2024.2 275
   001680         168300     ADD     1 TO REC-CT.                                         NC2024.2 322
   001681         168400 ADD-TEST-F3-20-1.                                                NC2024.2
   001682         168500     IF      FIELD1 OF ADD-16 EQUAL TO 88889                      NC2024.2 155 154
   001683      1  168600             PERFORM PASS                                         NC2024.2 425
   001684      1  168700             GO TO ADD-WRITE-F3-20-1.                             NC2024.2 1693
   001685         168800     GO TO ADD-FAIL-F3-20-1.                                      NC2024.2 1689
   001686         168900 ADD-DELETE-F3-20-1.                                              NC2024.2
   001687         169000     PERFORM DE-LETE.                                             NC2024.2 427
   001688         169100     GO TO ADD-WRITE-F3-20-1.                                     NC2024.2 1693
   001689         169200 ADD-FAIL-F3-20-1.                                                NC2024.2
   001690         169300     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001691         169400     MOVE    88889 TO CORRECT-N                                   NC2024.2 301
   001692         169500     PERFORM FAIL.                                                NC2024.2 426
   001693         169600 ADD-WRITE-F3-20-1.                                               NC2024.2
   001694         169700     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001695         169800*                                                                 NC2024.2
   001696         169900 ADD-INIT-F3-20-2.                                                NC2024.2
   001697         170000     MOVE   "ADD-TEST-F3-20-2" TO PAR-NAME.                       NC2024.2 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001698         170100     ADD     1 TO REC-CT.                                         NC2024.2 322
   001699         170200 ADD-TEST-F3-20-2.                                                NC2024.2
   001700         170300     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001701      1  170400             PERFORM PASS                                         NC2024.2 425
   001702      1  170500             GO TO ADD-WRITE-F3-20-2.                             NC2024.2 1711
   001703         170600     GO TO ADD-FAIL-F3-20-2.                                      NC2024.2 1707
   001704         170700 ADD-DELETE-F3-20-2.                                              NC2024.2
   001705         170800     PERFORM DE-LETE.                                             NC2024.2 427
   001706         170900     GO TO ADD-WRITE-F3-20-2.                                     NC2024.2 1711
   001707         171000 ADD-FAIL-F3-20-2.                                                NC2024.2
   001708         171100     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001709         171200     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001710         171300     PERFORM FAIL.                                                NC2024.2 426
   001711         171400 ADD-WRITE-F3-20-2.                                               NC2024.2
   001712         171500     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001713         171600*                                                                 NC2024.2
   001714         171700 ADD-INIT-F3-20-3.                                                NC2024.2
   001715         171800     MOVE   "ADD-TEST-F3-20-3" TO PAR-NAME.                       NC2024.2 275
   001716         171900     ADD     1 TO REC-CT.                                         NC2024.2 322
   001717         172000 ADD-TEST-F3-20-3.                                                NC2024.2
   001718         172100     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001719      1  172200             PERFORM PASS                                         NC2024.2 425
   001720      1  172300             GO TO ADD-WRITE-F3-20-3.                             NC2024.2 1729
   001721         172400     GO TO ADD-FAIL-F3-20-3.                                      NC2024.2 1725
   001722         172500 ADD-DELETE-F3-20-3.                                              NC2024.2
   001723         172600     PERFORM DE-LETE.                                             NC2024.2 427
   001724         172700     GO TO ADD-WRITE-F3-20-3.                                     NC2024.2 1729
   001725         172800 ADD-FAIL-F3-20-3.                                                NC2024.2
   001726         172900     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001727         173000     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001728         173100     PERFORM FAIL.                                                NC2024.2 426
   001729         173200 ADD-WRITE-F3-20-3.                                               NC2024.2
   001730         173300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001731         173400*                                                                 NC2024.2
   001732         173500 ADD-INIT-F3-20-4.                                                NC2024.2
   001733         173600     MOVE   "ADD-TEST-F3-20-4" TO PAR-NAME.                       NC2024.2 275
   001734         173700     ADD     1 TO REC-CT.                                         NC2024.2 322
   001735         173800 ADD-TEST-F3-20-4.                                                NC2024.2
   001736         173900     IF      WRK-AN-00001 = SPACE                                 NC2024.2 50 IMP
   001737      1  174000             PERFORM PASS                                         NC2024.2 425
   001738      1  174100             GO TO ADD-WRITE-F3-20-4.                             NC2024.2 1749
   001739         174200     GO TO ADD-FAIL-F3-20-4.                                      NC2024.2 1743
   001740         174300 ADD-DELETE-F3-20-4.                                              NC2024.2
   001741         174400     PERFORM DE-LETE.                                             NC2024.2 427
   001742         174500     GO TO ADD-WRITE-F3-20-4.                                     NC2024.2 1749
   001743         174600 ADD-FAIL-F3-20-4.                                                NC2024.2
   001744         174700     MOVE   "ON SIZE ERROR SHOULD NOT BE EXECUTED"                NC2024.2
   001745         174800          TO RE-MARK.                                             NC2024.2 280
   001746         174900     MOVE    SPACE TO CORRECT-X.                                  NC2024.2 IMP 299
   001747         175000     MOVE    WRK-AN-00001  TO COMPUTED-X.                         NC2024.2 50 285
   001748         175100     PERFORM FAIL.                                                NC2024.2 426
   001749         175200 ADD-WRITE-F3-20-4.                                               NC2024.2
   001750         175300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001751         175400*                                                                 NC2024.2
   001752         175500 ADD-INIT-F3-20-5.                                                NC2024.2
   001753         175600     MOVE   "ADD-TEST-F3-20-5" TO PAR-NAME.                       NC2024.2 275
   001754         175700     ADD     1 TO REC-CT.                                         NC2024.2 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001755         175800 ADD-TEST-F3-20-5.                                                NC2024.2
   001756         175900     IF      WRK-XN-00001 = SPACE                                 NC2024.2 51 IMP
   001757      1  176000             GO TO ADD-FAIL-F3-20-5.                              NC2024.2 1763
   001758         176100     PERFORM PASS                                                 NC2024.2 425
   001759         176200     GO TO ADD-WRITE-F3-20-5.                                     NC2024.2 1768
   001760         176300 ADD-DELETE-F3-20-5.                                              NC2024.2
   001761         176400     PERFORM DE-LETE.                                             NC2024.2 427
   001762         176500     GO TO ADD-WRITE-F3-20-5.                                     NC2024.2 1768
   001763         176600 ADD-FAIL-F3-20-5.                                                NC2024.2
   001764         176700     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2024.2 280
   001765         176800     MOVE   "B"   TO COMPUTED-X                                   NC2024.2 285
   001766         176900     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2024.2 50 299
   001767         177000     PERFORM FAIL.                                                NC2024.2 426
   001768         177100 ADD-WRITE-F3-20-5.                                               NC2024.2
   001769         177200     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001770         177300*                                                                 NC2024.2
   001771         177400 ADD-INIT-F3-21.                                                  NC2024.2
   001772         177500*    ===-->  EXPLICIT SCOPE TERMINATOR<--===                      NC2024.2
   001773         177600*    ===-->        SIZE ERROR         <--===                      NC2024.2
   001774         177700     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001775         177800     MOVE   "ADD-TEST-F3-21-0" TO PAR-NAME.                       NC2024.2 275
   001776         177900     MOVE    SPACE  TO WRK-XN-00001.                              NC2024.2 IMP 51
   001777         178000     MOVE    SPACE  TO WRK-AN-00001.                              NC2024.2 IMP 50
   001778         178100     MOVE    1      TO REC-CT.                                    NC2024.2 322
   001779         178200     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001780         178300     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001781         178400     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001782         178500     MOVE    99999  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001783         178600     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001784         178700     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001785         178800 ADD-TEST-F3-21-0.                                                NC2024.2
   001786         178900     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001787         179000         NOT ON SIZE ERROR                                        NC2024.2
   001788      1  179100             MOVE   "A" TO WRK-AN-00001                           NC2024.2 50
   001789         179200     END-ADD                                                      NC2024.2
   001790         179300     MOVE   "B" TO WRK-XN-00001.                                  NC2024.2 51
   001791         179400*                                                                 NC2024.2
   001792         179500 ADD-INIT-F3-21-1.                                                NC2024.2
   001793         179600     MOVE   "ADD-TEST-F3-21-1" TO PAR-NAME.                       NC2024.2 275
   001794         179700     ADD     1 TO REC-CT.                                         NC2024.2 322
   001795         179800 ADD-TEST-F3-21-1.                                                NC2024.2
   001796         179900     IF      FIELD1 OF ADD-16 EQUAL TO 99999                      NC2024.2 155 154
   001797      1  180000             PERFORM PASS                                         NC2024.2 425
   001798      1  180100             GO TO ADD-WRITE-F3-21-1.                             NC2024.2 1807
   001799         180200     GO TO ADD-FAIL-F3-21-1.                                      NC2024.2 1803
   001800         180300 ADD-DELETE-F3-21-1.                                              NC2024.2
   001801         180400     PERFORM DE-LETE.                                             NC2024.2 427
   001802         180500     GO TO ADD-WRITE-F3-21-1.                                     NC2024.2 1807
   001803         180600 ADD-FAIL-F3-21-1.                                                NC2024.2
   001804         180700     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001805         180800     MOVE    99999 TO CORRECT-N                                   NC2024.2 301
   001806         180900     PERFORM FAIL.                                                NC2024.2 426
   001807         181000 ADD-WRITE-F3-21-1.                                               NC2024.2
   001808         181100     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001809         181200*                                                                 NC2024.2
   001810         181300 ADD-INIT-F3-21-2.                                                NC2024.2
   001811         181400     MOVE   "ADD-TEST-F3-21-2" TO PAR-NAME.                       NC2024.2 275
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001812         181500     ADD     1 TO REC-CT.                                         NC2024.2 322
   001813         181600 ADD-TEST-F3-21-2.                                                NC2024.2
   001814         181700     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001815      1  181800             PERFORM PASS                                         NC2024.2 425
   001816      1  181900             GO TO ADD-WRITE-F3-21-2.                             NC2024.2 1825
   001817         182000     GO TO ADD-FAIL-F3-21-2.                                      NC2024.2 1821
   001818         182100 ADD-DELETE-F3-21-2.                                              NC2024.2
   001819         182200     PERFORM DE-LETE.                                             NC2024.2 427
   001820         182300     GO TO ADD-WRITE-F3-21-2.                                     NC2024.2 1825
   001821         182400 ADD-FAIL-F3-21-2.                                                NC2024.2
   001822         182500     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001823         182600     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001824         182700     PERFORM FAIL.                                                NC2024.2 426
   001825         182800 ADD-WRITE-F3-21-2.                                               NC2024.2
   001826         182900     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001827         183000*                                                                 NC2024.2
   001828         183100 ADD-INIT-F3-21-3.                                                NC2024.2
   001829         183200     MOVE   "ADD-TEST-F3-21-3" TO PAR-NAME.                       NC2024.2 275
   001830         183300     ADD     1 TO REC-CT.                                         NC2024.2 322
   001831         183400 ADD-TEST-F3-21-3.                                                NC2024.2
   001832         183500     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001833      1  183600             PERFORM PASS                                         NC2024.2 425
   001834      1  183700             GO TO ADD-WRITE-F3-21-3.                             NC2024.2 1843
   001835         183800     GO TO ADD-FAIL-F3-21-3.                                      NC2024.2 1839
   001836         183900 ADD-DELETE-F3-21-3.                                              NC2024.2
   001837         184000     PERFORM DE-LETE.                                             NC2024.2 427
   001838         184100     GO TO ADD-WRITE-F3-21-3.                                     NC2024.2 1843
   001839         184200 ADD-FAIL-F3-21-3.                                                NC2024.2
   001840         184300             MOVE FIELD3 OF ADD-16 TO COMPUTED-N                  NC2024.2 157 154 287
   001841         184400             MOVE 555.5 TO CORRECT-N                              NC2024.2 301
   001842         184500             PERFORM FAIL.                                        NC2024.2 426
   001843         184600 ADD-WRITE-F3-21-3.                                               NC2024.2
   001844         184700             PERFORM PRINT-DETAIL.                                NC2024.2 429
   001845         184800*                                                                 NC2024.2
   001846         184900 ADD-INIT-F3-21-4.                                                NC2024.2
   001847         185000     MOVE   "ADD-TEST-F3-21-4" TO PAR-NAME.                       NC2024.2 275
   001848         185100     ADD     1 TO REC-CT.                                         NC2024.2 322
   001849         185200 ADD-TEST-F3-21-4.                                                NC2024.2
   001850         185300     IF      WRK-AN-00001 = "A"                                   NC2024.2 50
   001851      1  185400             GO TO ADD-FAIL-F3-21-4.                              NC2024.2 1857
   001852         185500     PERFORM PASS                                                 NC2024.2 425
   001853         185600     GO TO ADD-WRITE-F3-21-4.                                     NC2024.2 1863
   001854         185700 ADD-DELETE-F3-21-4.                                              NC2024.2
   001855         185800     PERFORM DE-LETE.                                             NC2024.2 427
   001856         185900     GO TO ADD-WRITE-F3-21-4.                                     NC2024.2 1863
   001857         186000 ADD-FAIL-F3-21-4.                                                NC2024.2
   001858         186100     MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"            NC2024.2
   001859         186200          TO RE-MARK                                              NC2024.2 280
   001860         186300     MOVE    SPACE TO COMPUTED-X                                  NC2024.2 IMP 285
   001861         186400     MOVE    WRK-AN-00001  TO CORRECT-X                           NC2024.2 50 299
   001862         186500     PERFORM FAIL.                                                NC2024.2 426
   001863         186600 ADD-WRITE-F3-21-4.                                               NC2024.2
   001864         186700     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001865         186800*                                                                 NC2024.2
   001866         186900 ADD-INIT-F3-21-5.                                                NC2024.2
   001867         187000     MOVE   "ADD-TEST-F3-21-5" TO PAR-NAME.                       NC2024.2 275
   001868         187100     ADD     1 TO REC-CT.                                         NC2024.2 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001869         187200 ADD-TEST-F3-21-5.                                                NC2024.2
   001870         187300     IF      WRK-XN-00001 = SPACE                                 NC2024.2 51 IMP
   001871      1  187400             GO TO ADD-FAIL-F3-21-5.                              NC2024.2 1877
   001872         187500     PERFORM PASS                                                 NC2024.2 425
   001873         187600     GO TO ADD-WRITE-F3-21-5.                                     NC2024.2 1882
   001874         187700 ADD-DELETE-F3-21-5.                                              NC2024.2
   001875         187800     PERFORM DE-LETE.                                             NC2024.2 427
   001876         187900     GO TO ADD-WRITE-F3-21-5.                                     NC2024.2 1882
   001877         188000 ADD-FAIL-F3-21-5.                                                NC2024.2
   001878         188100     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2024.2 280
   001879         188200     MOVE   "B"   TO COMPUTED-X                                   NC2024.2 285
   001880         188300     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2024.2 50 299
   001881         188400     PERFORM FAIL.                                                NC2024.2 426
   001882         188500 ADD-WRITE-F3-21-5.                                               NC2024.2
   001883         188600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001884         188700*                                                                 NC2024.2
   001885         188800 ADD-INIT-F3-22.                                                  NC2024.2
   001886         188900*    ===-->  EXPLICIT SCOPE TERMINATOR<--===                      NC2024.2
   001887         189000*    ===-->     NO SIZE ERROR         <--===                      NC2024.2
   001888         189100     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001889         189200     MOVE   "ADD-TEST-F3-22-0" TO PAR-NAME.                       NC2024.2 275
   001890         189300     MOVE    SPACE  TO WRK-XN-00001.                              NC2024.2 IMP 51
   001891         189400     MOVE    SPACE  TO WRK-AN-00001.                              NC2024.2 IMP 50
   001892         189500     MOVE    0      TO REC-CT.                                    NC2024.2 322
   001893         189600     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001894         189700     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001895         189800     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001896         189900     MOVE    88888  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001897         190000     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001898         190100     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001899         190200 ADD-TEST-F3-22-0.                                                NC2024.2
   001900         190300     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001901         190400         NOT ON SIZE ERROR                                        NC2024.2
   001902      1  190500             MOVE   "A" TO WRK-AN-00001                           NC2024.2 50
   001903      1  190600             PERFORM PASS                                         NC2024.2 425
   001904      1  190700             PERFORM PRINT-DETAIL                                 NC2024.2 429
   001905         190800     END-ADD                                                      NC2024.2
   001906         190900     MOVE   "B" TO WRK-XN-00001.                                  NC2024.2 51
   001907         191000*                                                                 NC2024.2
   001908         191100 ADD-INIT-F3-22-1.                                                NC2024.2
   001909         191200     MOVE   "ADD-TEST-F3-22-1" TO PAR-NAME.                       NC2024.2 275
   001910         191300     ADD     1 TO REC-CT.                                         NC2024.2 322
   001911         191400 ADD-TEST-F3-22-1.                                                NC2024.2
   001912         191500     IF      FIELD1 OF ADD-16 EQUAL TO 88889                      NC2024.2 155 154
   001913      1  191600             PERFORM PASS                                         NC2024.2 425
   001914      1  191700             GO TO ADD-WRITE-F3-22-1.                             NC2024.2 1923
   001915         191800     GO TO ADD-FAIL-F3-22-1.                                      NC2024.2 1919
   001916         191900 ADD-DELETE-F3-22-1.                                              NC2024.2
   001917         192000     PERFORM DE-LETE.                                             NC2024.2 427
   001918         192100     GO TO ADD-WRITE-F3-22-1.                                     NC2024.2 1923
   001919         192200 ADD-FAIL-F3-22-1.                                                NC2024.2
   001920         192300     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   001921         192400     MOVE    88889 TO CORRECT-N                                   NC2024.2 301
   001922         192500     PERFORM FAIL.                                                NC2024.2 426
   001923         192600 ADD-WRITE-F3-22-1.                                               NC2024.2
   001924         192700     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001925         192800*                                                                 NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001926         192900 ADD-INIT-F3-22-2.                                                NC2024.2
   001927         193000     MOVE   "ADD-TEST-F3-22-2" TO PAR-NAME.                       NC2024.2 275
   001928         193100     ADD     1 TO REC-CT.                                         NC2024.2 322
   001929         193200 ADD-TEST-F3-22-2.                                                NC2024.2
   001930         193300     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   001931      1  193400             PERFORM PASS                                         NC2024.2 425
   001932      1  193500             GO TO ADD-WRITE-F3-22-2.                             NC2024.2 1941
   001933         193600     GO TO ADD-FAIL-F3-22-2.                                      NC2024.2 1937
   001934         193700 ADD-DELETE-F3-22-2.                                              NC2024.2
   001935         193800     PERFORM DE-LETE.                                             NC2024.2 427
   001936         193900     GO TO ADD-WRITE-F3-22-2.                                     NC2024.2 1941
   001937         194000 ADD-FAIL-F3-22-2.                                                NC2024.2
   001938         194100     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   001939         194200     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   001940         194300     PERFORM FAIL.                                                NC2024.2 426
   001941         194400 ADD-WRITE-F3-22-2.                                               NC2024.2
   001942         194500     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001943         194600*                                                                 NC2024.2
   001944         194700 ADD-INIT-F3-22-3.                                                NC2024.2
   001945         194800     MOVE   "ADD-TEST-F3-22-3" TO PAR-NAME.                       NC2024.2 275
   001946         194900     ADD     1 TO REC-CT.                                         NC2024.2 322
   001947         195000 ADD-TEST-F3-22-3.                                                NC2024.2
   001948         195100     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   001949      1  195200             PERFORM PASS                                         NC2024.2 425
   001950      1  195300             GO TO ADD-WRITE-F3-22-3.                             NC2024.2 1959
   001951         195400     GO TO ADD-FAIL-F3-22-3.                                      NC2024.2 1955
   001952         195500 ADD-DELETE-F3-22-3.                                              NC2024.2
   001953         195600     PERFORM DE-LETE.                                             NC2024.2 427
   001954         195700     GO TO ADD-WRITE-F3-22-3.                                     NC2024.2 1959
   001955         195800 ADD-FAIL-F3-22-3.                                                NC2024.2
   001956         195900     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   001957         196000     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   001958         196100     PERFORM FAIL.                                                NC2024.2 426
   001959         196200 ADD-WRITE-F3-22-3.                                               NC2024.2
   001960         196300     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001961         196400*                                                                 NC2024.2
   001962         196500 ADD-INIT-F3-22-4.                                                NC2024.2
   001963         196600     MOVE   "ADD-TEST-F3-22-4" TO PAR-NAME.                       NC2024.2 275
   001964         196700     ADD     1 TO REC-CT.                                         NC2024.2 322
   001965         196800 ADD-TEST-F3-22-4.                                                NC2024.2
   001966         196900     IF      WRK-XN-00001 = SPACE                                 NC2024.2 51 IMP
   001967      1  197000             GO TO ADD-FAIL-F3-22-4.                              NC2024.2 1973
   001968         197100     PERFORM PASS                                                 NC2024.2 425
   001969         197200     GO TO ADD-WRITE-F3-22-4.                                     NC2024.2 1978
   001970         197300 ADD-DELETE-F3-22-4.                                              NC2024.2
   001971         197400     PERFORM DE-LETE.                                             NC2024.2 427
   001972         197500     GO TO ADD-WRITE-F3-22-4.                                     NC2024.2 1978
   001973         197600 ADD-FAIL-F3-22-4.                                                NC2024.2
   001974         197700     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2024.2 280
   001975         197800     MOVE   "B"   TO COMPUTED-X                                   NC2024.2 285
   001976         197900     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2024.2 50 299
   001977         198000     PERFORM FAIL.                                                NC2024.2 426
   001978         198100 ADD-WRITE-F3-22-4.                                               NC2024.2
   001979         198200     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   001980         198300*                                                                 NC2024.2
   001981         198400 ADD-INIT-F3-23.                                                  NC2024.2
   001982         198500*    ===-->  EXPLICIT SCOPE TERMINATOR<--===                      NC2024.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001983         198600*    ===-->        SIZE ERROR         <--===                      NC2024.2
   001984         198700     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   001985         198800     MOVE   "ADD-TEST-F3-23-0" TO PAR-NAME.                       NC2024.2 275
   001986         198900     MOVE    SPACE  TO WRK-XN-00001.                              NC2024.2 IMP 51
   001987         199000     MOVE    SPACE  TO WRK-AN-00001.                              NC2024.2 IMP 50
   001988         199100     MOVE    0      TO REC-CT.                                    NC2024.2 322
   001989         199200     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   001990         199300     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   001991         199400     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   001992         199500     MOVE    99999  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   001993         199600     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   001994         199700     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   001995         199800 ADD-TEST-F3-23-0.                                                NC2024.2
   001996         199900     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   001997         200000             ON SIZE ERROR                                        NC2024.2
   001998      1  200100             MOVE   "A" TO WRK-AN-00001                           NC2024.2 50
   001999         200200         NOT ON SIZE ERROR                                        NC2024.2
   002000      1  200300             MOVE   "B" TO WRK-AN-00001                           NC2024.2 50
   002001         200400     END-ADD                                                      NC2024.2
   002002         200500     MOVE   "B" TO WRK-XN-00001.                                  NC2024.2 51
   002003         200600     GO TO   ADD-TEST-F3-23-1.                                    NC2024.2 2008
   002004         200700*                                                                 NC2024.2
   002005         200800 ADD-INIT-F3-23-1.                                                NC2024.2
   002006         200900     MOVE   "ADD-TEST-F3-23-1" TO PAR-NAME.                       NC2024.2 275
   002007         201000     ADD     1 TO REC-CT.                                         NC2024.2 322
   002008         201100 ADD-TEST-F3-23-1.                                                NC2024.2
   002009         201200     IF      FIELD1 OF ADD-16 EQUAL TO 99999                      NC2024.2 155 154
   002010      1  201300             PERFORM PASS                                         NC2024.2 425
   002011      1  201400             GO TO ADD-WRITE-F3-23-1.                             NC2024.2 2020
   002012         201500     GO TO ADD-FAIL-F3-23-1.                                      NC2024.2 2016
   002013         201600 ADD-DELETE-F3-23-1.                                              NC2024.2
   002014         201700     PERFORM DE-LETE                                              NC2024.2 427
   002015         201800     GO TO ADD-WRITE-F3-23-1.                                     NC2024.2 2020
   002016         201900 ADD-FAIL-F3-23-1.                                                NC2024.2
   002017         202000     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   002018         202100     MOVE    99999 TO CORRECT-N                                   NC2024.2 301
   002019         202200     PERFORM FAIL.                                                NC2024.2 426
   002020         202300 ADD-WRITE-F3-23-1.                                               NC2024.2
   002021         202400     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002022         202500*                                                                 NC2024.2
   002023         202600 ADD-INIT-F3-23-2.                                                NC2024.2
   002024         202700     MOVE   "ADD-TEST-F3-23-2" TO PAR-NAME.                       NC2024.2 275
   002025         202800     ADD     1 TO REC-CT.                                         NC2024.2 322
   002026         202900 ADD-TEST-F3-23-2.                                                NC2024.2
   002027         203000     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   002028      1  203100             PERFORM PASS                                         NC2024.2 425
   002029      1  203200             GO TO ADD-WRITE-F3-23-2.                             NC2024.2 2038
   002030         203300     GO TO ADD-FAIL-F3-23-2.                                      NC2024.2 2034
   002031         203400 ADD-DELETE-F3-23-2.                                              NC2024.2
   002032         203500     PERFORM DE-LETE.                                             NC2024.2 427
   002033         203600     GO TO ADD-WRITE-F3-23-2.                                     NC2024.2 2038
   002034         203700 ADD-FAIL-F3-23-2.                                                NC2024.2
   002035         203800     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   002036         203900     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   002037         204000     PERFORM FAIL.                                                NC2024.2 426
   002038         204100 ADD-WRITE-F3-23-2.                                               NC2024.2
   002039         204200     PERFORM PRINT-DETAIL.                                        NC2024.2 429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002040         204300*                                                                 NC2024.2
   002041         204400 ADD-INIT-F3-23-3.                                                NC2024.2
   002042         204500     MOVE   "ADD-TEST-F3-23-3" TO PAR-NAME.                       NC2024.2 275
   002043         204600     ADD     1 TO REC-CT.                                         NC2024.2 322
   002044         204700 ADD-TEST-F3-23-3.                                                NC2024.2
   002045         204800     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   002046      1  204900             PERFORM PASS                                         NC2024.2 425
   002047      1  205000             GO TO ADD-WRITE-F3-23-3.                             NC2024.2 2056
   002048         205100     GO TO ADD-FAIL-F3-23-3.                                      NC2024.2 2052
   002049         205200 ADD-DELETE-F3-23-3.                                              NC2024.2
   002050         205300     PERFORM DE-LETE.                                             NC2024.2 427
   002051         205400     GO TO ADD-WRITE-F3-23-3.                                     NC2024.2 2056
   002052         205500 ADD-FAIL-F3-23-3.                                                NC2024.2
   002053         205600     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   002054         205700     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   002055         205800     PERFORM FAIL.                                                NC2024.2 426
   002056         205900 ADD-WRITE-F3-23-3.                                               NC2024.2
   002057         206000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002058         206100*                                                                 NC2024.2
   002059         206200 ADD-INIT-F3-23-4.                                                NC2024.2
   002060         206300     MOVE   "ADD-TEST-F3-23-4" TO PAR-NAME.                       NC2024.2 275
   002061         206400     ADD     1 TO REC-CT.                                         NC2024.2 322
   002062         206500 ADD-TEST-F3-23-4.                                                NC2024.2
   002063         206600     IF      WRK-AN-00001 = "B"                                   NC2024.2 50
   002064      1  206700             GO TO ADD-FAIL-F3-23-4.                              NC2024.2 2070
   002065         206800     PERFORM PASS                                                 NC2024.2 425
   002066         206900     GO TO ADD-WRITE-F3-23-4.                                     NC2024.2 2076
   002067         207000 ADD-DELETE-F3-23-4.                                              NC2024.2
   002068         207100     PERFORM DE-LETE.                                             NC2024.2 427
   002069         207200     GO TO ADD-WRITE-F3-23-4.                                     NC2024.2 2076
   002070         207300 ADD-FAIL-F3-23-4.                                                NC2024.2
   002071         207400     MOVE   "NOT ON SIZE ERROR SHOULD NOT BE EXECUTED"            NC2024.2
   002072         207500          TO RE-MARK                                              NC2024.2 280
   002073         207600     MOVE   "B"    TO COMPUTED-X                                  NC2024.2 285
   002074         207700     MOVE    WRK-AN-00001  TO CORRECT-X                           NC2024.2 50 299
   002075         207800     PERFORM FAIL.                                                NC2024.2 426
   002076         207900 ADD-WRITE-F3-23-4.                                               NC2024.2
   002077         208000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002078         208100*                                                                 NC2024.2
   002079         208200 ADD-INIT-F3-23-5.                                                NC2024.2
   002080         208300     MOVE   "ADD-TEST-F3-23-5" TO PAR-NAME.                       NC2024.2 275
   002081         208400     ADD     1 TO REC-CT.                                         NC2024.2 322
   002082         208500 ADD-TEST-F3-23-5.                                                NC2024.2
   002083         208600     IF      WRK-XN-00001 = SPACE                                 NC2024.2 51 IMP
   002084      1  208700             GO TO ADD-FAIL-F3-23-5.                              NC2024.2 2090
   002085         208800     PERFORM PASS                                                 NC2024.2 425
   002086         208900     GO TO ADD-WRITE-F3-23-5.                                     NC2024.2 2095
   002087         209000 ADD-DELETE-F3-23-5.                                              NC2024.2
   002088         209100     PERFORM DE-LETE.                                             NC2024.2 427
   002089         209200     GO TO ADD-WRITE-F3-23-5.                                     NC2024.2 2095
   002090         209300 ADD-FAIL-F3-23-5.                                                NC2024.2
   002091         209400     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2024.2 280
   002092         209500     MOVE   "B"   TO COMPUTED-X                                   NC2024.2 285
   002093         209600     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2024.2 50 299
   002094         209700     PERFORM FAIL.                                                NC2024.2 426
   002095         209800 ADD-WRITE-F3-23-5.                                               NC2024.2
   002096         209900     PERFORM PRINT-DETAIL.                                        NC2024.2 429
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002097         210000*                                                                 NC2024.2
   002098         210100 ADD-INIT-F3-24.                                                  NC2024.2
   002099         210200*    ===-->  EXPLICIT SCOPE TERMINATOR<--===                      NC2024.2
   002100         210300*    ===-->     NO SIZE ERROR         <--===                      NC2024.2
   002101         210400     MOVE   "VI-73 6.6" TO ANSI-REFERENCE.                        NC2024.2 331
   002102         210500     MOVE   "ADD-TEST-F3-24-0" TO PAR-NAME.                       NC2024.2 275
   002103         210600     MOVE    SPACE  TO WRK-XN-00001.                              NC2024.2 IMP 51
   002104         210700     MOVE    SPACE  TO WRK-AN-00001.                              NC2024.2 IMP 50
   002105         210800     MOVE    0      TO REC-CT.                                    NC2024.2 322
   002106         210900     MOVE    1      TO FIELD1 OF ADD-15.                          NC2024.2 151 150
   002107         211000     MOVE    32.1   TO FIELD2 OF ADD-15.                          NC2024.2 152 150
   002108         211100     MOVE    123.4  TO FIELD3 OF ADD-15.                          NC2024.2 153 150
   002109         211200     MOVE    88888  TO FIELD1 OF ADD-16.                          NC2024.2 155 154
   002110         211300     MOVE    745.67 TO FIELD2 OF ADD-16.                          NC2024.2 156 154
   002111         211400     MOVE    432.1  TO FIELD3 OF ADD-16.                          NC2024.2 157 154
   002112         211500 ADD-TEST-F3-24-0.                                                NC2024.2
   002113         211600     ADD     CORRESPONDING ADD-15 TO ADD-16                       NC2024.2 150 154
   002114         211700             ON SIZE ERROR                                        NC2024.2
   002115      1  211800             MOVE   "A" TO WRK-AN-00001                           NC2024.2 50
   002116         211900         NOT ON SIZE ERROR                                        NC2024.2
   002117      1  212000             MOVE   "B" TO WRK-AN-00001                           NC2024.2 50
   002118         212100     END-ADD                                                      NC2024.2
   002119         212200     MOVE   "B" TO WRK-XN-00001.                                  NC2024.2 51
   002120         212300*                                                                 NC2024.2
   002121         212400 ADD-INIT-F3-24-1.                                                NC2024.2
   002122         212500     MOVE   "ADD-TEST-F3-24-1" TO PAR-NAME.                       NC2024.2 275
   002123         212600     ADD     1 TO REC-CT.                                         NC2024.2 322
   002124         212700 ADD-TEST-F3-24-1.                                                NC2024.2
   002125         212800     IF      FIELD1 OF ADD-16 EQUAL TO 88889                      NC2024.2 155 154
   002126      1  212900             PERFORM PASS                                         NC2024.2 425
   002127      1  213000             GO TO ADD-WRITE-F3-24-1.                             NC2024.2 2136
   002128         213100     GO TO ADD-FAIL-F3-24-1.                                      NC2024.2 2132
   002129         213200 ADD-DELETE-F3-24-1.                                              NC2024.2
   002130         213300     PERFORM DE-LETE.                                             NC2024.2 427
   002131         213400     GO TO ADD-WRITE-F3-24-1.                                     NC2024.2 2136
   002132         213500 ADD-FAIL-F3-24-1.                                                NC2024.2
   002133         213600     MOVE    FIELD1 OF ADD-16 TO COMPUTED-N                       NC2024.2 155 154 287
   002134         213700     MOVE    88889 TO CORRECT-N                                   NC2024.2 301
   002135         213800     PERFORM FAIL.                                                NC2024.2 426
   002136         213900 ADD-WRITE-F3-24-1.                                               NC2024.2
   002137         214000     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002138         214100*                                                                 NC2024.2
   002139         214200 ADD-INIT-F3-24-2.                                                NC2024.2
   002140         214300     MOVE   "ADD-TEST-F3-24-2" TO PAR-NAME.                       NC2024.2 275
   002141         214400     ADD     1 TO REC-CT.                                         NC2024.2 322
   002142         214500 ADD-TEST-F3-24-2.                                                NC2024.2
   002143         214600     IF      FIELD2 OF ADD-16 IS EQUAL TO 777.77                  NC2024.2 156 154
   002144      1  214700             PERFORM PASS                                         NC2024.2 425
   002145      1  214800             GO TO ADD-WRITE-F3-24-2.                             NC2024.2 2154
   002146         214900     GO TO ADD-FAIL-F3-24-2.                                      NC2024.2 2150
   002147         215000 ADD-DELETE-F3-24-2.                                              NC2024.2
   002148         215100     PERFORM DE-LETE.                                             NC2024.2 427
   002149         215200     GO TO ADD-WRITE-F3-24-2.                                     NC2024.2 2154
   002150         215300 ADD-FAIL-F3-24-2.                                                NC2024.2
   002151         215400     MOVE    FIELD2 OF ADD-16 TO COMPUTED-N                       NC2024.2 156 154 287
   002152         215500     MOVE   "+777.77" TO CORRECT-A                                NC2024.2 300
   002153         215600     PERFORM FAIL.                                                NC2024.2 426
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002154         215700 ADD-WRITE-F3-24-2.                                               NC2024.2
   002155         215800     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002156         215900*                                                                 NC2024.2
   002157         216000 ADD-INIT-F3-24-3.                                                NC2024.2
   002158         216100     MOVE   "ADD-TEST-F3-24-3" TO PAR-NAME.                       NC2024.2 275
   002159         216200     ADD     1 TO REC-CT.                                         NC2024.2 322
   002160         216300 ADD-TEST-F3-24-3.                                                NC2024.2
   002161         216400     IF      FIELD3 OF ADD-16 IS EQUAL TO 555.5                   NC2024.2 157 154
   002162      1  216500             PERFORM PASS                                         NC2024.2 425
   002163      1  216600             GO TO ADD-WRITE-F3-24-3.                             NC2024.2 2172
   002164         216700     GO TO ADD-FAIL-F3-24-3.                                      NC2024.2 2168
   002165         216800 ADD-DELETE-F3-24-3.                                              NC2024.2
   002166         216900     PERFORM DE-LETE.                                             NC2024.2 427
   002167         217000     GO TO ADD-WRITE-F3-24-3.                                     NC2024.2 2172
   002168         217100 ADD-FAIL-F3-24-3.                                                NC2024.2
   002169         217200     MOVE FIELD3 OF ADD-16 TO COMPUTED-N                          NC2024.2 157 154 287
   002170         217300     MOVE 555.5 TO CORRECT-N                                      NC2024.2 301
   002171         217400     PERFORM FAIL.                                                NC2024.2 426
   002172         217500 ADD-WRITE-F3-24-3.                                               NC2024.2
   002173         217600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002174         217700*                                                                 NC2024.2
   002175         217800 ADD-INIT-F3-24-4.                                                NC2024.2
   002176         217900     MOVE   "ADD-TEST-F3-24-4" TO PAR-NAME.                       NC2024.2 275
   002177         218000     ADD     1 TO REC-CT.                                         NC2024.2 322
   002178         218100 ADD-TEST-F3-24-4.                                                NC2024.2
   002179         218200     IF      WRK-AN-00001 = "B"                                   NC2024.2 50
   002180      1  218300             PERFORM PASS                                         NC2024.2 425
   002181      1  218400             GO TO ADD-WRITE-F3-24-4.                             NC2024.2 2192
   002182         218500     GO TO ADD-FAIL-F3-24-4.                                      NC2024.2 2186
   002183         218600 ADD-DELETE-F3-24-4.                                              NC2024.2
   002184         218700     PERFORM DE-LETE.                                             NC2024.2 427
   002185         218800     GO TO ADD-WRITE-F3-24-4.                                     NC2024.2 2192
   002186         218900 ADD-FAIL-F3-24-4.                                                NC2024.2
   002187         219000     MOVE   "NOT ON SIZE ERROR SHOULD BE EXECUTED"                NC2024.2
   002188         219100          TO RE-MARK                                              NC2024.2 280
   002189         219200     MOVE   "B"    TO COMPUTED-X                                  NC2024.2 285
   002190         219300     MOVE    WRK-AN-00001  TO CORRECT-X                           NC2024.2 50 299
   002191         219400     PERFORM FAIL.                                                NC2024.2 426
   002192         219500 ADD-WRITE-F3-24-4.                                               NC2024.2
   002193         219600     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002194         219700*                                                                 NC2024.2
   002195         219800 ADD-INIT-F3-24-5.                                                NC2024.2
   002196         219900     MOVE   "ADD-TEST-F3-24-5" TO PAR-NAME.                       NC2024.2 275
   002197         220000     ADD     1 TO REC-CT.                                         NC2024.2 322
   002198         220100 ADD-TEST-F3-24-5.                                                NC2024.2
   002199         220200     IF      WRK-XN-00001 = SPACE                                 NC2024.2 51 IMP
   002200      1  220300             GO TO ADD-FAIL-F3-24-5.                              NC2024.2 2206
   002201         220400     PERFORM PASS                                                 NC2024.2 425
   002202         220500     GO TO ADD-WRITE-F3-24-5.                                     NC2024.2 2211
   002203         220600 ADD-DELETE-F3-24-5.                                              NC2024.2
   002204         220700     PERFORM DE-LETE.                                             NC2024.2 427
   002205         220800     GO TO ADD-WRITE-F3-24-5.                                     NC2024.2 2211
   002206         220900 ADD-FAIL-F3-24-5.                                                NC2024.2
   002207         221000     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2024.2 280
   002208         221100     MOVE   "B"   TO COMPUTED-X                                   NC2024.2 285
   002209         221200     MOVE    WRK-AN-00001 TO CORRECT-X                            NC2024.2 50 299
   002210         221300     PERFORM FAIL.                                                NC2024.2 426
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002211         221400 ADD-WRITE-F3-24-5.                                               NC2024.2
   002212         221500     PERFORM PRINT-DETAIL.                                        NC2024.2 429
   002213         221600*                                                                 NC2024.2
   002214         221700 CCVS-EXIT SECTION.                                               NC2024.2
   002215         221800 CCVS-999999.                                                     NC2024.2
   002216         221900     GO TO CLOSE-FILES.                                           NC2024.2 418
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    43
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      109   ADD-CORR-A
      141   ADD-CORR-B
      142   ADD-CORR-0
      108   ADD-CORR-1 . . . . . . . . . .  M531 541
      119   ADD-CORR-1 . . . . . . . . . .  M541 M571 M596 M637
      132   ADD-CORR-1 . . . . . . . . . .  M560 571
      149   ADD-CORR-1 . . . . . . . . . .  M589 596 M634 637
      107   ADD-CORR-2 . . . . . . . . . .  M532 541
      120   ADD-CORR-2 . . . . . . . . . .  M541 M571 M596 M637
      133   ADD-CORR-2 . . . . . . . . . .  M561 571
      148   ADD-CORR-2 . . . . . . . . . .  M590 596 637
      111   ADD-CORR-3 . . . . . . . . . .  M533 541
      121   ADD-CORR-3 . . . . . . . . . .  M541 M571 M596 M637
      136   ADD-CORR-3 . . . . . . . . . .  M562 571
      147   ADD-CORR-3 . . . . . . . . . .  M591 596 637
      110   ADD-CORR-4 . . . . . . . . . .  M534 541
      122   ADD-CORR-4 . . . . . . . . . .  M541 M571 M596 M637
      135   ADD-CORR-4 . . . . . . . . . .  M563 571
      146   ADD-CORR-4 . . . . . . . . . .  M592 596 637
      113   ADD-CORR-5 . . . . . . . . . .  M535 541
      123   ADD-CORR-5 . . . . . . . . . .  M541 M571
      134   ADD-CORR-5 . . . . . . . . . .  M564 571
      112   ADD-CORR-6 . . . . . . . . . .  M536 541
      124   ADD-CORR-6 . . . . . . . . . .  M541 M571
      137   ADD-CORR-6 . . . . . . . . . .  M565 571
      115   ADD-CORR-7 . . . . . . . . . .  M537 541
      125   ADD-CORR-7 . . . . . . . . . .  M541 M571
      138   ADD-CORR-7 . . . . . . . . . .  M566 571
      114   ADD-CORR-8 . . . . . . . . . .  M538 541
      126   ADD-CORR-8 . . . . . . . . . .  M541 M571
      139   ADD-CORR-8 . . . . . . . . . .  M567 571
      116   ADD-CORR-9 . . . . . . . . . .  M539 541
      127   ADD-CORR-9 . . . . . . . . . .  M541 M571
      140   ADD-CORR-9 . . . . . . . . . .  M568 571
       68   ADD-1
       77   ADD-10
       78   ADD-11
       79   ADD-12
       80   ADD-13
       81   ADD-14
      150   ADD-15 . . . . . . . . . . . .  655 656 657 662 1131 1132 1133 1139 1213 1214 1215 1224 1298 1299 1300 1307 1380
                                            1381 1382 1389 1464 1465 1466 1473 1550 1551 1552 1558 1665 1666 1667 1672 1779
                                            1780 1781 1786 1893 1894 1895 1900 1989 1990 1991 1996 2106 2107 2108 2113
      154   ADD-16 . . . . . . . . . . . .  658 659 660 M662 679 687 697 706 715 724 1134 1135 1136 M1139 1158 1166 1176
                                            1184 1194 1202 1216 1217 1218 M1224 1243 1251 1261 1269 1279 1287 1301 1302 1303
                                            M1307 1325 1333 1343 1351 1361 1369 1383 1384 1385 M1389 1409 1417 1427 1435
                                            1445 1453 1467 1468 1469 M1473 1493 1501 1511 1519 1529 1537 1553 1554 1555 M1558
                                            1568 1576 1586 1594 1604 1612 1668 1669 1670 M1672 1682 1690 1700 1708 1718 1726
                                            1782 1783 1784 M1786 1796 1804 1814 1822 1832 1840 1896 1897 1898 M1900 1912
                                            1920 1930 1938 1948 1956 1992 1993 1994 M1996 2009 2017 2027 2035 2045 2053 2109
                                            2110 2111 M2113 2125 2133 2143 2151 2161 2169
       69   ADD-2
       70   ADD-3
       71   ADD-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    44
0 Defined   Cross-reference of data names   References

0      72   ADD-5
       73   ADD-6
       74   ADD-7
       75   ADD-8
       76   ADD-9
      331   ANSI-REFERENCE . . . . . . . .  503 510 519 M527 M557 M587 M613 M631 M653 M676 M694 M712 M730 M757 M784 M802
                                            M820 M838 M856 M885 M904 M925 M943 M961 M988 M1006 M1050 M1068 M1096 M1128 M1211
                                            M1296 M1378 M1462 M1546 M1660 M1774 M1888 M1984 M2101
       56   AZERO-DS-05V05
       62   A05ONES-DS-05V00
       59   A18ONES-DS-09V09
       63   A99-DS-02V00
      310   CCVS-C-1 . . . . . . . . . . .  447 489
      315   CCVS-C-2 . . . . . . . . . . .  448 490
      365   CCVS-E-1 . . . . . . . . . . .  453
      370   CCVS-E-2 . . . . . . . . . . .  462 469 476 481
      373   CCVS-E-2-2 . . . . . . . . . .  M461
      378   CCVS-E-3 . . . . . . . . . . .  482
      387   CCVS-E-4 . . . . . . . . . . .  461
      388   CCVS-E-4-1 . . . . . . . . . .  M459
      390   CCVS-E-4-2 . . . . . . . . . .  M460
      332   CCVS-H-1 . . . . . . . . . . .  442
      337   CCVS-H-2A. . . . . . . . . . .  443
      346   CCVS-H-2B. . . . . . . . . . .  444
      358   CCVS-H-3 . . . . . . . . . . .  445
      408   CCVS-PGM-ID. . . . . . . . . .  414 414
      292   CM-18V0
      286   COMPUTED-A . . . . . . . . . .  287 289 290 291 292 515 518 M550 M580 M607 M625 M647 M751 M778 M796 M814 M832
                                            M849 M879 M897 M918 M936 M954 M1122
      287   COMPUTED-N . . . . . . . . . .  M687 M706 M724 M982 M1000 M1018 M1044 M1061 M1166 M1184 M1202 M1251 M1269 M1287
                                            M1333 M1351 M1369 M1417 M1435 M1453 M1501 M1519 M1537 M1576 M1594 M1612 M1690
                                            M1708 M1726 M1804 M1822 M1840 M1920 M1938 M1956 M2017 M2035 M2053 M2133 M2151
                                            M2169
      285   COMPUTED-X . . . . . . . . . .  M437 501 M1632 M1651 M1747 M1765 M1860 M1879 M1975 M2073 M2092 M2189 M2208
      289   COMPUTED-0V18
      291   COMPUTED-14V4
      293   COMPUTED-18V0
      290   COMPUTED-4V14
      309   COR-ANSI-REFERENCE . . . . . .  M510 M512
      178   CORR-DATA-1. . . . . . . . . .  733 734 735 736 737 738 741 758 759 760 761 762 763 768 858 859 860 861 862 863
                                            868 M907 909
      185   CORR-DATA-2. . . . . . . . . .  M739 M741 742 751 M764 M768 769 778 787 796 805 814 823 832 841 849 M864 M868
                                            888 897
      192   CORR-DATA-3
      199   CORR-DATA-4
      206   CORR-DATA-5. . . . . . . . . .  M906 M909 910 918 928 936 946 954 M962 963 964 965 M972 973 982 991 1000 1009
                                            1018 M1024 1025 1026 1027 M1034 1035 1044 1053 1061 M1070 1071 1072 1073 M1079
      214   CORR-DATA-6
      221   CORR-DATA-7. . . . . . . . . .  966 967 968 972 1028 1029 1030 1034 1074 1075 1076 1079
      300   CORRECT-A. . . . . . . . . . .  301 302 303 304 305 516 518 M551 M581 M606 M624 M646 M707 M752 M779 M797 M815
                                            M833 M850 M898 M919 M937 M955 M983 M1001 M1019 M1062 M1123 M1185 M1270 M1352
                                            M1436 M1520 M1595 M1709 M1823 M1939 M2036 M2152
      301   CORRECT-N. . . . . . . . . . .  M688 M725 M1045 M1167 M1203 M1252 M1288 M1334 M1370 M1418 M1454 M1502 M1538 M1577
                                            M1613 M1691 M1727 M1805 M1841 M1921 M1957 M2018 M2054 M2134 M2170
      299   CORRECT-X. . . . . . . . . . .  M438 502 M1633 M1652 M1746 M1766 M1861 M1880 M1976 M2074 M2093 M2190 M2209
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    45
0 Defined   Cross-reference of data names   References

0     302   CORRECT-0V18
      304   CORRECT-14V4
      306   CORRECT-18V0
      303   CORRECT-4V14
      305   CR-18V0
       88   D-5
       89   D-9
      323   DELETE-COUNTER . . . . . . . .  M427 456 472 474
      227   DNAME1
      236   DNAME10
      237   DNAME11
      238   DNAME12
      239   DNAME13
      240   DNAME14
      241   DNAME15
      242   DNAME16
      243   DNAME17
      244   DNAME18
      245   DNAME19
      228   DNAME2
      246   DNAME20
      247   DNAME21
      248   DNAME22
      249   DNAME23
      250   DNAME24
      251   DNAME25
      252   DNAME26
      253   DNAME27
      254   DNAME28
      255   DNAME29
      229   DNAME3
      256   DNAME30
      257   DNAME31
      258   DNAME32
      259   DNAME33
      260   DNAME34
      261   DNAME35
      262   DNAME36
      263   DNAME37
      264   DNAME38
      265   DNAME39
      230   DNAME4
      266   DNAME40
      267   DNAME41
      268   DNAME42
      231   DNAME5
      232   DNAME6
      233   DNAME7
      234   DNAME8
      235   DNAME9
      278   DOTVALUE . . . . . . . . . . .  M432
      329   DUMMY-HOLD . . . . . . . . . .  M486 492
       36   DUMMY-RECORD . . . . . . . . .  M442 M443 M444 M445 M447 M448 M449 M451 M453 M462 M469 M476 M481 M482 486 M487
                                            488 M489 M490 M491 M492 496 M497 M505 M520
       97   EIGHT
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    46
0 Defined   Cross-reference of data names   References

0     376   ENDER-DESC . . . . . . . . . .  M464 M475 M480
      324   ERROR-COUNTER. . . . . . . . .  M426 455 465 468
      328   ERROR-HOLD . . . . . . . . . .  M455 M456 M456 M457 460
      374   ERROR-TOTAL. . . . . . . . . .  M466 M468 M473 M474 M478 M479
      271   FEATURE. . . . . . . . . . . .  M528 M732 M1097
      151   FIELD1 . . . . . . . . . . . .  M655 662 M1131 1139 M1213 1224 M1298 1307 M1380 1389 M1464 1473 M1550 1558 M1665
                                            1672 M1779 1786 M1893 1900 M1989 1996 M2106 2113
      155   FIELD1 . . . . . . . . . . . .  M658 M662 679 687 M1134 M1139 1158 1166 M1216 M1224 1243 1251 M1301 M1307 1325
                                            1333 M1383 M1389 1409 1417 M1467 M1473 1493 1501 M1553 M1558 1568 1576 M1668
                                            M1672 1682 1690 M1782 M1786 1796 1804 M1896 M1900 1912 1920 M1992 M1996 2009
                                            2017 M2109 M2113 2125 2133
      152   FIELD2 . . . . . . . . . . . .  M656 662 M1132 1139 M1214 1224 M1299 1307 M1381 1389 M1465 1473 M1551 1558 M1666
                                            1672 M1780 1786 M1894 1900 M1990 1996 M2107 2113
      156   FIELD2 . . . . . . . . . . . .  M659 M662 697 706 M1135 M1139 1176 1184 M1217 M1224 1261 1269 M1302 M1307 1343
                                            1351 M1384 M1389 1427 1435 M1468 M1473 1511 1519 M1554 M1558 1586 1594 M1669
                                            M1672 1700 1708 M1783 M1786 1814 1822 M1897 M1900 1930 1938 M1993 M1996 2027
                                            2035 M2110 M2113 2143 2151
      153   FIELD3 . . . . . . . . . . . .  M657 662 M1133 1139 M1215 1224 M1300 1307 M1382 1389 M1466 1473 M1552 1558 M1667
                                            1672 M1781 1786 M1895 1900 M1991 1996 M2108 2113
      157   FIELD3 . . . . . . . . . . . .  M660 M662 715 724 M1136 M1139 1194 1202 M1218 M1224 1279 1287 M1303 M1307 1361
                                            1369 M1385 M1389 1445 1453 M1469 M1473 1529 1537 M1555 M1558 1604 1612 M1670
                                            M1672 1718 1726 M1784 M1786 1832 1840 M1898 M1900 1948 1956 M1994 M1996 2045
                                            2053 M2111 M2113 2161 2169
      100   FIFTEEN
       94   FIVE
       93   FOUR
      130   GRP-ADD-SUB-CORR . . . . . . .  560 561 562 563 564 565 566 567 568 570
      143   GRP-FOR-ADD-CORR-A . . . . . .  634
      117   GRP-FOR-ADD-CORR-R . . . . . .  M530 M541 542 550 M559 M571 572 580 M588 M596 598 607 M633 637 638 647
      104   GRP-FOR-ADD-CORR-1 . . . . . .  531 532 533 534 535 536 537 538 539 541
      129   GRP-FOR-ADD-CORR-2
      105   GRP-SUBTRACT-CORR-1
      118   GRP-SUBTRACT-CORR-1. . . . . .  M637
      131   GRP-SUBTRACT-CORR-1
      145   GRP-SUBTRACT-CORR-1. . . . . .  636
      144   GRP-SUBTRACT-CORR-3. . . . . .  589 590 591 592 596 636
      402   HYPHEN-LINE. . . . . . . . . .  449 451 491
      368   ID-AGAIN . . . . . . . . . . .  M414
       42   INDEX1
       48   INDEX2
      401   INF-ANSI-REFERENCE . . . . . .  M503 M506 M519 M521
      396   INFO-TEXT. . . . . . . . . . .  M504
      325   INSPECT-COUNTER. . . . . . . .  M424 455 477 479
       98   NINE
       90   ONE
      273   P-OR-F . . . . . . . . . . . .  M424 M425 M426 M427 434 M437
      275   PAR-NAME . . . . . . . . . . .  M439 M529 M558 M594 M614 M632 M654 M677 M695 M713 M731 M766 M785 M803 M821 M839
                                            M866 M886 M905 M926 M944 M970 M989 M1007 M1032 M1051 M1069 M1095 M1137 M1155
                                            M1173 M1191 M1221 M1240 M1258 M1276 M1305 M1322 M1340 M1358 M1387 M1406 M1424
                                            M1442 M1471 M1490 M1508 M1526 M1556 M1565 M1583 M1601 M1619 M1639 M1661 M1679
                                            M1697 M1715 M1733 M1753 M1775 M1793 M1811 M1829 M1847 M1867 M1889 M1909 M1927
                                            M1945 M1963 M1985 M2006 M2024 M2042 M2060 M2080 M2102 M2122 M2140 M2158 M2176
                                            M2196
      277   PARDOT-X . . . . . . . . . . .  M431
      326   PASS-COUNTER . . . . . . . . .  M425 457 459
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    47
0 Defined   Cross-reference of data names   References

0      34   PRINT-FILE . . . . . . . . . .  30 413 419
       35   PRINT-REC. . . . . . . . . . .  M433 M509 M511
      280   RE-MARK. . . . . . . . . . . .  M428 M440 M671 M880 M899 M1090 M1149 M1234 M1316 M1400 M1484 M1631 M1650 M1745
                                            M1764 M1859 M1878 M1974 M2072 M2091 M2188 M2207
      322   REC-CT . . . . . . . . . . . .  430 432 439 M1130 M1156 M1174 M1192 M1212 M1222 M1241 M1259 M1277 M1297 M1323
                                            M1341 M1359 M1379 M1407 M1425 M1443 M1463 M1491 M1509 M1527 M1549 M1566 M1584
                                            M1602 M1620 M1640 M1664 M1680 M1698 M1716 M1734 M1754 M1778 M1794 M1812 M1830
                                            M1848 M1868 M1892 M1910 M1928 M1946 M1964 M1988 M2007 M2025 M2043 M2061 M2081
                                            M2105 M2123 M2141 M2159 M2177 M2197
      321   REC-SKL-SUB
      330   RECORD-COUNT . . . . . . . . .  M484 485 M493
       39   RECORD1. . . . . . . . . . . .  M1099 1109
       45   RECORD1. . . . . . . . . . . .  M1104 M1109 1110
       40   RECORD2. . . . . . . . . . . .  M1100 M1101
       46   RECORD2. . . . . . . . . . . .  M1105 M1106 1111 1112
       43   RECORD3. . . . . . . . . . . .  M1102 1109
       49   RECORD3. . . . . . . . . . . .  M1107 M1109 1113
       96   SEVEN
       95   SIX
      159   SUBTR-1
      168   SUBTR-10
      169   SUBTR-11
      170   SUBTR-12
      171   SUBTR-13
      175   SUBTR-13
      172   SUBTR-14
      176   SUBTR-14
      173   SUBTR-15
      177   SUBTR-15
      174   SUBTR-16
      160   SUBTR-2
      161   SUBTR-3
      162   SUBTR-4
      163   SUBTR-5
      164   SUBTR-6
      165   SUBTR-7
      166   SUBTR-8
      167   SUBTR-9
      158   SUBTRACT-DATA
       38   TABLE1 . . . . . . . . . . . .  1099 1100 1101 1102 1109
       44   TABLE2 . . . . . . . . . . . .  1104 1105 1106 1107 M1109 1110 1111 1112 1113 1122
       99   TEN. . . . . . . . . . . . . .  735 760 860
      281   TEST-COMPUTED. . . . . . . . .  509
      296   TEST-CORRECT . . . . . . . . .  511
      349   TEST-ID. . . . . . . . . . . .  M414
      269   TEST-RESULTS . . . . . . . . .  M415 433
       92   THREE
      327   TOTAL-ERROR
      101   TWENTY
      102   TWENTY-5
       91   TWO
       82   W-1
       83   W-2
       84   W-3
       85   W-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    48
0 Defined   Cross-reference of data names   References

0      86   W-6
       87   W-9
       50   WRK-AN-00001 . . . . . . . . .  M857 M869 870 879 M1077 M1080 1081 M1548 M1560 1622 1633 1652 M1663 M1674 1736
                                            1747 1766 M1777 M1788 1850 1861 1880 M1891 M1902 1976 M1987 M1998 M2000 2063
                                            2074 2093 M2104 M2115 M2117 2179 2190 2209
       52   WRK-DS-01V00
       53   WRK-DS-02V00
       66   WRK-DS-0201P
       64   WRK-DS-03V00
       67   WRK-DS-03V10
       55   WRK-DS-05V00
       65   WRK-DS-06V00
       54   WRK-DS-06V06
      103   WRK-DS-09V00
       57   WRK-DS-09V09 . . . . . . . . .  58
       61   WRK-DS-18V00
       58   WRK-DS-18V00-S
       51   WRK-XN-00001 . . . . . . . . .  M588 M597 616 625 M1547 M1562 1642 M1662 M1676 1756 M1776 M1790 1870 M1890 M1906
                                            1966 M1986 M2002 2083 M2103 M2119 2199
      398   XXCOMPUTED . . . . . . . . . .  M518
      400   XXCORRECT. . . . . . . . . . .  M518
      393   XXINFO . . . . . . . . . . . .  505 520
      179   XYZ-1. . . . . . . . . . . . .  M733 741 M758 768 M858 868 909
      186   XYZ-1. . . . . . . . . . . . .  M741 M768 769 778 M868
      198   XYZ-1
      207   XYZ-1. . . . . . . . . . . . .  M909 910 918 M963 M972 973 982 M1025 M1034 1035 1044 M1071 M1079
      218   XYZ-1
      222   XYZ-1. . . . . . . . . . . . .  M966 972 M1028 1034 M1074 1079
      200   XYZ-11
      212   XYZ-11 . . . . . . . . . . . .  946 954 M965 M972 1009 1018 M1027 M1034 M1073 M1079
      215   XYZ-11
      224   XYZ-11 . . . . . . . . . . . .  M968 972 M1030 1034 M1076 1079
      201   XYZ-12
      213   XYZ-12
      216   XYZ-12
      202   XYZ-13
      209   XYZ-13 . . . . . . . . . . . .  928 936
      203   XYZ-14
      210   XYZ-14
      204   XYZ-15
      205   XYZ-16
      180   XYZ-2. . . . . . . . . . . . .  M734 741 M759 768 M859 868 909
      187   XYZ-2. . . . . . . . . . . . .  M741 M768 787 796 M868
      197   XYZ-2
      208   XYZ-2. . . . . . . . . . . . .  M909 M964 M972 991 1000 M1026 M1034 1053 1061 M1072 M1079
      219   XYZ-2
      225   XYZ-2. . . . . . . . . . . . .  M967 972 M1029 1034 M1075 1079
      181   XYZ-3. . . . . . . . . . . . .  M735 741 M760 768 M860 868
      188   XYZ-3. . . . . . . . . . . . .  M741 M768 805 814 M868
      194   XYZ-3
      182   XYZ-4. . . . . . . . . . . . .  M736 741 M761 768 M861 868
      189   XYZ-4. . . . . . . . . . . . .  M741 742 751 M768 823 832 M868
      193   XYZ-4
      183   XYZ-5. . . . . . . . . . . . .  M737 741 M762 768 M862 868
      190   XYZ-5. . . . . . . . . . . . .  M741 M768 841 849 M868
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    49
0 Defined   Cross-reference of data names   References

0     196   XYZ-5
      184   XYZ-6. . . . . . . . . . . . .  M738 741 M763 768 M863 868
      191   XYZ-6. . . . . . . . . . . . .  M741 M768 M868
      195   XYZ-6
      223   XYZ-6
      226   42-DATANAMES
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    50
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

      546   ADD-DELETE-F3-1
      977   ADD-DELETE-F3-10-1
      995   ADD-DELETE-F3-10-2
     1013   ADD-DELETE-F3-10-3
     1039   ADD-DELETE-F3-11-1
     1057   ADD-DELETE-F3-11-2
     1085   ADD-DELETE-F3-12
     1117   ADD-DELETE-F3-13
     1144   ADD-DELETE-F3-14-1
     1162   ADD-DELETE-F3-14-2
     1180   ADD-DELETE-F3-14-3
     1198   ADD-DELETE-F3-14-4
     1229   ADD-DELETE-F3-15-1
     1247   ADD-DELETE-F3-15-2
     1265   ADD-DELETE-F3-15-3
     1283   ADD-DELETE-F3-15-4
     1312   ADD-DELETE-F3-16-1
     1329   ADD-DELETE-F3-16-2
     1347   ADD-DELETE-F3-16-3
     1365   ADD-DELETE-F3-16-4
     1395   ADD-DELETE-F3-17
     1413   ADD-DELETE-F3-17-2
     1431   ADD-DELETE-F3-17-3
     1449   ADD-DELETE-F3-17-4
     1479   ADD-DELETE-F3-18-1
     1497   ADD-DELETE-F3-18-2
     1515   ADD-DELETE-F3-18-3
     1533   ADD-DELETE-F3-18-4
     1572   ADD-DELETE-F3-19-1
     1590   ADD-DELETE-F3-19-2
     1608   ADD-DELETE-F3-19-3
     1626   ADD-DELETE-F3-19-4
     1646   ADD-DELETE-F3-19-5
      576   ADD-DELETE-F3-2
     1686   ADD-DELETE-F3-20-1
     1704   ADD-DELETE-F3-20-2
     1722   ADD-DELETE-F3-20-3
     1740   ADD-DELETE-F3-20-4
     1760   ADD-DELETE-F3-20-5
     1800   ADD-DELETE-F3-21-1
     1818   ADD-DELETE-F3-21-2
     1836   ADD-DELETE-F3-21-3
     1854   ADD-DELETE-F3-21-4
     1874   ADD-DELETE-F3-21-5
     1916   ADD-DELETE-F3-22-1
     1934   ADD-DELETE-F3-22-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    51
0 Defined   Cross-reference of procedures   References

0    1952   ADD-DELETE-F3-22-3
     1970   ADD-DELETE-F3-22-4
     2013   ADD-DELETE-F3-23-1
     2031   ADD-DELETE-F3-23-2
     2049   ADD-DELETE-F3-23-3
     2067   ADD-DELETE-F3-23-4
     2087   ADD-DELETE-F3-23-5
     2129   ADD-DELETE-F3-24-1
     2147   ADD-DELETE-F3-24-2
     2165   ADD-DELETE-F3-24-3
     2183   ADD-DELETE-F3-24-4
     2203   ADD-DELETE-F3-24-5
      602   ADD-DELETE-F3-3-1
      620   ADD-DELETE-F3-3-2
      642   ADD-DELETE-F3-4
      666   ADD-DELETE-F3-5-1
      683   ADD-DELETE-F3-5-2
      701   ADD-DELETE-F3-5-3
      719   ADD-DELETE-F3-5-4
      746   ADD-DELETE-F3-6
      773   ADD-DELETE-F3-7-1
      791   ADD-DELETE-F3-7-2
      809   ADD-DELETE-F3-7-3
      827   ADD-DELETE-F3-7-4
      874   ADD-DELETE-F3-8-1
      892   ADD-DELETE-F3-8-2
      914   ADD-DELETE-F3-9-1
      932   ADD-DELETE-F3-9-2
      950   ADD-DELETE-F3-9-3
      549   ADD-FAIL-F3-1. . . . . . . . .  G545
      980   ADD-FAIL-F3-10-1 . . . . . . .  G976
      998   ADD-FAIL-F3-10-2 . . . . . . .  G994
     1016   ADD-FAIL-F3-10-3 . . . . . . .  G1012
     1042   ADD-FAIL-F3-11-1 . . . . . . .  G1038
     1060   ADD-FAIL-F3-11-2 . . . . . . .  G1056
     1088   ADD-FAIL-F3-12 . . . . . . . .  G1084
     1120   ADD-FAIL-F3-13 . . . . . . . .  G1116
     1147   ADD-FAIL-F3-14-1 . . . . . . .  G1141
     1165   ADD-FAIL-F3-14-2 . . . . . . .  G1161
     1183   ADD-FAIL-F3-14-3 . . . . . . .  G1179
     1201   ADD-FAIL-F3-14-4 . . . . . . .  G1197
     1232   ADD-FAIL-F3-15-1 . . . . . . .  G1226
     1250   ADD-FAIL-F3-15-2 . . . . . . .  G1246
     1268   ADD-FAIL-F3-15-3 . . . . . . .  G1264
     1286   ADD-FAIL-F3-15-4 . . . . . . .  G1282
     1315   ADD-FAIL-F3-16-1 . . . . . . .  G1311
     1332   ADD-FAIL-F3-16-2 . . . . . . .  G1328
     1350   ADD-FAIL-F3-16-3 . . . . . . .  G1346
     1368   ADD-FAIL-F3-16-4 . . . . . . .  G1364
     1398   ADD-FAIL-F3-17-1 . . . . . . .  G1394
     1416   ADD-FAIL-F3-17-2 . . . . . . .  G1412
     1434   ADD-FAIL-F3-17-3 . . . . . . .  G1430
     1452   ADD-FAIL-F3-17-4 . . . . . . .  G1448
     1482   ADD-FAIL-F3-18-1 . . . . . . .  G1475
     1500   ADD-FAIL-F3-18-2 . . . . . . .  G1496
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    52
0 Defined   Cross-reference of procedures   References

0    1518   ADD-FAIL-F3-18-3 . . . . . . .  G1514
     1536   ADD-FAIL-F3-18-4 . . . . . . .  G1532
     1575   ADD-FAIL-F3-19-1 . . . . . . .  G1571
     1593   ADD-FAIL-F3-19-2 . . . . . . .  G1589
     1611   ADD-FAIL-F3-19-3 . . . . . . .  G1607
     1629   ADD-FAIL-F3-19-4 . . . . . . .  G1623
     1649   ADD-FAIL-F3-19-5 . . . . . . .  G1643
      579   ADD-FAIL-F3-2. . . . . . . . .  G575
     1689   ADD-FAIL-F3-20-1 . . . . . . .  G1685
     1707   ADD-FAIL-F3-20-2 . . . . . . .  G1703
     1725   ADD-FAIL-F3-20-3 . . . . . . .  G1721
     1743   ADD-FAIL-F3-20-4 . . . . . . .  G1739
     1763   ADD-FAIL-F3-20-5 . . . . . . .  G1757
     1803   ADD-FAIL-F3-21-1 . . . . . . .  G1799
     1821   ADD-FAIL-F3-21-2 . . . . . . .  G1817
     1839   ADD-FAIL-F3-21-3 . . . . . . .  G1835
     1857   ADD-FAIL-F3-21-4 . . . . . . .  G1851
     1877   ADD-FAIL-F3-21-5 . . . . . . .  G1871
     1919   ADD-FAIL-F3-22-1 . . . . . . .  G1915
     1937   ADD-FAIL-F3-22-2 . . . . . . .  G1933
     1955   ADD-FAIL-F3-22-3 . . . . . . .  G1951
     1973   ADD-FAIL-F3-22-4 . . . . . . .  G1967
     2016   ADD-FAIL-F3-23-1 . . . . . . .  G2012
     2034   ADD-FAIL-F3-23-2 . . . . . . .  G2030
     2052   ADD-FAIL-F3-23-3 . . . . . . .  G2048
     2070   ADD-FAIL-F3-23-4 . . . . . . .  G2064
     2090   ADD-FAIL-F3-23-5 . . . . . . .  G2084
     2132   ADD-FAIL-F3-24-1 . . . . . . .  G2128
     2150   ADD-FAIL-F3-24-2 . . . . . . .  G2146
     2168   ADD-FAIL-F3-24-3 . . . . . . .  G2164
     2186   ADD-FAIL-F3-24-4 . . . . . . .  G2182
     2206   ADD-FAIL-F3-24-5 . . . . . . .  G2200
      605   ADD-FAIL-F3-3-1. . . . . . . .  G601
      623   ADD-FAIL-F3-3-2. . . . . . . .  G619
      645   ADD-FAIL-F3-4. . . . . . . . .  G641
      669   ADD-FAIL-F3-5-1. . . . . . . .  G665
      686   ADD-FAIL-F3-5-2. . . . . . . .  G682
      704   ADD-FAIL-F3-5-3. . . . . . . .  G700
      722   ADD-FAIL-F3-5-4. . . . . . . .  G718
      749   ADD-FAIL-F3-6. . . . . . . . .  G745
      776   ADD-FAIL-F3-7-1. . . . . . . .  G772
      794   ADD-FAIL-F3-7-2. . . . . . . .  G790
      812   ADD-FAIL-F3-7-3. . . . . . . .  G808
      830   ADD-FAIL-F3-7-4. . . . . . . .  G826
      848   ADD-FAIL-F3-7-5. . . . . . . .  G844
      877   ADD-FAIL-F3-8-1. . . . . . . .  G873
      895   ADD-FAIL-F3-8-2. . . . . . . .  G891
      917   ADD-FAIL-F3-9-1. . . . . . . .  G913
      935   ADD-FAIL-F3-9-2. . . . . . . .  G931
      953   ADD-FAIL-F3-9-3. . . . . . . .  G949
      526   ADD-INIT-F3-1
      960   ADD-INIT-F3-10
      969   ADD-INIT-F3-10-1
      987   ADD-INIT-F3-10-2
     1005   ADD-INIT-F3-10-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    53
0 Defined   Cross-reference of procedures   References

0    1023   ADD-INIT-F3-11
     1031   ADD-INIT-F3-11-1
     1049   ADD-INIT-F3-11-2
     1067   ADD-INIT-F3-12
     1094   ADD-INIT-F3-13
     1127   ADD-INIT-F3-14
     1154   ADD-INIT-F3-14-2
     1172   ADD-INIT-F3-14-3
     1190   ADD-INIT-F3-14-4
     1208   ADD-INIT-F3-15
     1220   ADD-INIT-F3-15-1
     1239   ADD-INIT-F3-15-2
     1257   ADD-INIT-F3-15-3
     1275   ADD-INIT-F3-15-4
     1293   ADD-INIT-F3-16
     1304   ADD-INIT-F3-16-1
     1321   ADD-INIT-F3-16-2
     1339   ADD-INIT-F3-16-3
     1357   ADD-INIT-F3-16-4
     1375   ADD-INIT-F3-17
     1386   ADD-INIT-F3-17-1
     1405   ADD-INIT-F3-17-2
     1423   ADD-INIT-F3-17-3
     1441   ADD-INIT-F3-17-4
     1459   ADD-INIT-F3-18
     1470   ADD-INIT-F3-18-1
     1489   ADD-INIT-F3-18-2
     1507   ADD-INIT-F3-18-3
     1525   ADD-INIT-F3-18-4
     1543   ADD-INIT-F3-19
     1564   ADD-INIT-F3-19-1
     1582   ADD-INIT-F3-19-2
     1600   ADD-INIT-F3-19-3
     1618   ADD-INIT-F3-19-4
     1638   ADD-INIT-F3-19-5
      556   ADD-INIT-F3-2
     1657   ADD-INIT-F3-20
     1678   ADD-INIT-F3-20-1
     1696   ADD-INIT-F3-20-2
     1714   ADD-INIT-F3-20-3
     1732   ADD-INIT-F3-20-4
     1752   ADD-INIT-F3-20-5
     1771   ADD-INIT-F3-21
     1792   ADD-INIT-F3-21-1
     1810   ADD-INIT-F3-21-2
     1828   ADD-INIT-F3-21-3
     1846   ADD-INIT-F3-21-4
     1866   ADD-INIT-F3-21-5
     1885   ADD-INIT-F3-22
     1908   ADD-INIT-F3-22-1
     1926   ADD-INIT-F3-22-2
     1944   ADD-INIT-F3-22-3
     1962   ADD-INIT-F3-22-4
     1981   ADD-INIT-F3-23
     2005   ADD-INIT-F3-23-1
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    54
0 Defined   Cross-reference of procedures   References

0    2023   ADD-INIT-F3-23-2
     2041   ADD-INIT-F3-23-3
     2059   ADD-INIT-F3-23-4
     2079   ADD-INIT-F3-23-5
     2098   ADD-INIT-F3-24
     2121   ADD-INIT-F3-24-1
     2139   ADD-INIT-F3-24-2
     2157   ADD-INIT-F3-24-3
     2175   ADD-INIT-F3-24-4
     2195   ADD-INIT-F3-24-5
      586   ADD-INIT-F3-3
      593   ADD-INIT-F3-3-1
      612   ADD-INIT-F3-3-2
      630   ADD-INIT-F3-4
      652   ADD-INIT-F3-5-1
      675   ADD-INIT-F3-5-2
      693   ADD-INIT-F3-5-3
      711   ADD-INIT-F3-5-4
      729   ADD-INIT-F3-6
      756   ADD-INIT-F3-7
      765   ADD-INIT-F3-7-1
      783   ADD-INIT-F3-7-2
      801   ADD-INIT-F3-7-3
      819   ADD-INIT-F3-7-4
      837   ADD-INIT-F3-7-5
      855   ADD-INIT-F3-8
      865   ADD-INIT-F3-8-1
      884   ADD-INIT-F3-8-2
      903   ADD-INIT-F3-9-1
      924   ADD-INIT-F3-9-2
      942   ADD-INIT-F3-9-3
      540   ADD-TEST-F3-1
      971   ADD-TEST-F3-10-1
      990   ADD-TEST-F3-10-2
     1008   ADD-TEST-F3-10-3
     1033   ADD-TEST-F3-11-1
     1052   ADD-TEST-F3-11-2
     1078   ADD-TEST-F3-12
     1108   ADD-TEST-F3-13
     1138   ADD-TEST-F3-14-1
     1157   ADD-TEST-F3-14-2
     1175   ADD-TEST-F3-14-3
     1193   ADD-TEST-F3-14-4
     1223   ADD-TEST-F3-15-1
     1242   ADD-TEST-F3-15-2
     1260   ADD-TEST-F3-15-3
     1278   ADD-TEST-F3-15-4
     1306   ADD-TEST-F3-16-1
     1324   ADD-TEST-F3-16-2
     1342   ADD-TEST-F3-16-3
     1360   ADD-TEST-F3-16-4
     1388   ADD-TEST-F3-17-1
     1408   ADD-TEST-F3-17-2
     1426   ADD-TEST-F3-17-3
     1444   ADD-TEST-F3-17-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    55
0 Defined   Cross-reference of procedures   References

0    1472   ADD-TEST-F3-18-1
     1492   ADD-TEST-F3-18-2
     1510   ADD-TEST-F3-18-3
     1528   ADD-TEST-F3-18-4
     1557   ADD-TEST-F3-19-0
     1567   ADD-TEST-F3-19-1
     1585   ADD-TEST-F3-19-2
     1603   ADD-TEST-F3-19-3
     1621   ADD-TEST-F3-19-4
     1641   ADD-TEST-F3-19-5
      569   ADD-TEST-F3-2
     1671   ADD-TEST-F3-20-0
     1681   ADD-TEST-F3-20-1
     1699   ADD-TEST-F3-20-2
     1717   ADD-TEST-F3-20-3
     1735   ADD-TEST-F3-20-4
     1755   ADD-TEST-F3-20-5
     1785   ADD-TEST-F3-21-0
     1795   ADD-TEST-F3-21-1
     1813   ADD-TEST-F3-21-2
     1831   ADD-TEST-F3-21-3
     1849   ADD-TEST-F3-21-4
     1869   ADD-TEST-F3-21-5
     1899   ADD-TEST-F3-22-0
     1911   ADD-TEST-F3-22-1
     1929   ADD-TEST-F3-22-2
     1947   ADD-TEST-F3-22-3
     1965   ADD-TEST-F3-22-4
     1995   ADD-TEST-F3-23-0
     2008   ADD-TEST-F3-23-1 . . . . . . .  G2003
     2026   ADD-TEST-F3-23-2
     2044   ADD-TEST-F3-23-3
     2062   ADD-TEST-F3-23-4
     2082   ADD-TEST-F3-23-5
     2112   ADD-TEST-F3-24-0
     2124   ADD-TEST-F3-24-1
     2142   ADD-TEST-F3-24-2
     2160   ADD-TEST-F3-24-3
     2178   ADD-TEST-F3-24-4
     2198   ADD-TEST-F3-24-5
      595   ADD-TEST-F3-3-1
      615   ADD-TEST-F3-3-2
      635   ADD-TEST-F3-4
      661   ADD-TEST-F3-5-1
      678   ADD-TEST-F3-5-2
      696   ADD-TEST-F3-5-3
      714   ADD-TEST-F3-5-4
      740   ADD-TEST-F3-6
      767   ADD-TEST-F3-7-1
      786   ADD-TEST-F3-7-2
      804   ADD-TEST-F3-7-3
      822   ADD-TEST-F3-7-4
      840   ADD-TEST-F3-7-5
      867   ADD-TEST-F3-8-1
      887   ADD-TEST-F3-8-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    56
0 Defined   Cross-reference of procedures   References

0     908   ADD-TEST-F3-9-1
      927   ADD-TEST-F3-9-2
      945   ADD-TEST-F3-9-3
      553   ADD-WRITE-F3-1 . . . . . . . .  G544 G548
      984   ADD-WRITE-F3-10-1. . . . . . .  G975 G979
     1002   ADD-WRITE-F3-10-2. . . . . . .  G993 G997
     1020   ADD-WRITE-F3-10-3. . . . . . .  G1011 G1015
     1046   ADD-WRITE-F3-11-1. . . . . . .  G1037 G1041
     1064   ADD-WRITE-F3-11-2. . . . . . .  G1055 G1059
     1091   ADD-WRITE-F3-12. . . . . . . .  G1083 G1087
     1124   ADD-WRITE-F3-13. . . . . . . .  G1115 G1119
     1151   ADD-WRITE-F3-14-1. . . . . . .  G1143 G1146
     1169   ADD-WRITE-F3-14-2. . . . . . .  G1160 G1164
     1187   ADD-WRITE-F3-14-3. . . . . . .  G1178 G1182
     1205   ADD-WRITE-F3-14-4. . . . . . .  G1196 G1200
     1236   ADD-WRITE-F3-15-1. . . . . . .  G1228 G1231
     1254   ADD-WRITE-F3-15-2. . . . . . .  G1245 G1249
     1272   ADD-WRITE-F3-15-3. . . . . . .  G1263 G1267
     1290   ADD-WRITE-F3-15-4. . . . . . .  G1281 G1285
     1318   ADD-WRITE-F3-16-1. . . . . . .  G1310 G1314
     1336   ADD-WRITE-F3-16-2. . . . . . .  G1327 G1331
     1354   ADD-WRITE-F3-16-3. . . . . . .  G1345 G1349
     1372   ADD-WRITE-F3-16-4. . . . . . .  G1363 G1367
     1402   ADD-WRITE-F3-17-1. . . . . . .  G1392 G1397
     1420   ADD-WRITE-F3-17-2. . . . . . .  G1411 G1415
     1438   ADD-WRITE-F3-17-3. . . . . . .  G1429 G1433
     1456   ADD-WRITE-F3-17-4. . . . . . .  G1447 G1451
     1486   ADD-WRITE-F3-18-1. . . . . . .  G1478 G1481
     1504   ADD-WRITE-F3-18-2. . . . . . .  G1495 G1499
     1522   ADD-WRITE-F3-18-3. . . . . . .  G1513 G1517
     1540   ADD-WRITE-F3-18-4. . . . . . .  G1531 G1535
     1579   ADD-WRITE-F3-19-1. . . . . . .  G1570 G1574
     1597   ADD-WRITE-F3-19-2. . . . . . .  G1588 G1592
     1615   ADD-WRITE-F3-19-3. . . . . . .  G1606 G1610
     1635   ADD-WRITE-F3-19-4. . . . . . .  G1625 G1628
     1654   ADD-WRITE-F3-19-5. . . . . . .  G1645 G1648
      583   ADD-WRITE-F3-2 . . . . . . . .  G574 G578
     1693   ADD-WRITE-F3-20-1. . . . . . .  G1684 G1688
     1711   ADD-WRITE-F3-20-2. . . . . . .  G1702 G1706
     1729   ADD-WRITE-F3-20-3. . . . . . .  G1720 G1724
     1749   ADD-WRITE-F3-20-4. . . . . . .  G1738 G1742
     1768   ADD-WRITE-F3-20-5. . . . . . .  G1759 G1762
     1807   ADD-WRITE-F3-21-1. . . . . . .  G1798 G1802
     1825   ADD-WRITE-F3-21-2. . . . . . .  G1816 G1820
     1843   ADD-WRITE-F3-21-3. . . . . . .  G1834 G1838
     1863   ADD-WRITE-F3-21-4. . . . . . .  G1853 G1856
     1882   ADD-WRITE-F3-21-5. . . . . . .  G1873 G1876
     1923   ADD-WRITE-F3-22-1. . . . . . .  G1914 G1918
     1941   ADD-WRITE-F3-22-2. . . . . . .  G1932 G1936
     1959   ADD-WRITE-F3-22-3. . . . . . .  G1950 G1954
     1978   ADD-WRITE-F3-22-4. . . . . . .  G1969 G1972
     2020   ADD-WRITE-F3-23-1. . . . . . .  G2011 G2015
     2038   ADD-WRITE-F3-23-2. . . . . . .  G2029 G2033
     2056   ADD-WRITE-F3-23-3. . . . . . .  G2047 G2051
     2076   ADD-WRITE-F3-23-4. . . . . . .  G2066 G2069
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    57
0 Defined   Cross-reference of procedures   References

0    2095   ADD-WRITE-F3-23-5. . . . . . .  G2086 G2089
     2136   ADD-WRITE-F3-24-1. . . . . . .  G2127 G2131
     2154   ADD-WRITE-F3-24-2. . . . . . .  G2145 G2149
     2172   ADD-WRITE-F3-24-3. . . . . . .  G2163 G2167
     2192   ADD-WRITE-F3-24-4. . . . . . .  G2181 G2185
     2211   ADD-WRITE-F3-24-5. . . . . . .  G2202 G2205
      609   ADD-WRITE-F3-3-1 . . . . . . .  G600 G604
      627   ADD-WRITE-F3-3-2 . . . . . . .  G618 G622
      649   ADD-WRITE-F3-4 . . . . . . . .  G640 G644
      672   ADD-WRITE-F3-5-1 . . . . . . .  G664 G668
      690   ADD-WRITE-F3-5-2 . . . . . . .  G681 G685
      708   ADD-WRITE-F3-5-3 . . . . . . .  G699 G703
      726   ADD-WRITE-F3-5-4 . . . . . . .  G717 G721
      753   ADD-WRITE-F3-6 . . . . . . . .  G744 G748
      780   ADD-WRITE-F3-7-1 . . . . . . .  G771 G775
      798   ADD-WRITE-F3-7-2 . . . . . . .  G789 G793
      816   ADD-WRITE-F3-7-3 . . . . . . .  G807 G811
      834   ADD-WRITE-F3-7-4 . . . . . . .  G825 G829
      852   ADD-WRITE-F3-7-5 . . . . . . .  G843 G847
      881   ADD-WRITE-F3-8-1 . . . . . . .  G872 G876
      900   ADD-WRITE-F3-8-2 . . . . . . .  G890 G894
      921   ADD-WRITE-F3-9-1 . . . . . . .  G912 G916
      939   ADD-WRITE-F3-9-2 . . . . . . .  G930 G934
      957   ADD-WRITE-F3-9-3 . . . . . . .  G948 G952
      514   BAIL-OUT . . . . . . . . . . .  P436
      522   BAIL-OUT-EX. . . . . . . . . .  E436 G516
      517   BAIL-OUT-WRITE . . . . . . . .  G515
      498   BLANK-LINE-PRINT
     1098   BUILD-TABLE1
     1103   BUILD-TABLE2
     2214   CCVS-EXIT
     2215   CCVS-999999
      411   CCVS1
      523   CCVS1-EXIT . . . . . . . . . .  G417
      418   CLOSE-FILES. . . . . . . . . .  G2216
      446   COLUMN-NAMES-ROUTINE . . . . .  E416
      427   DE-LETE. . . . . . . . . . . .  P547 P577 P603 P621 P643 P667 P684 P702 P720 P747 P774 P792 P810 P828 P846 P875
                                            P893 P915 P933 P951 P978 P996 P1014 P1040 P1058 P1086 P1118 P1145 P1163 P1181
                                            P1199 P1230 P1248 P1266 P1284 P1313 P1330 P1348 P1366 P1396 P1414 P1432 P1450
                                            P1480 P1498 P1516 P1534 P1573 P1591 P1609 P1627 P1647 P1687 P1705 P1723 P1741
                                            P1761 P1801 P1819 P1837 P1855 P1875 P1917 P1935 P1953 P1971 P2014 P2032 P2050
                                            P2068 P2088 P2130 P2148 P2166 P2184 P2204
      845   DELETE-F3-7-5
      450   END-ROUTINE. . . . . . . . . .  P419
      454   END-ROUTINE-1
      463   END-ROUTINE-12
      471   END-ROUTINE-13 . . . . . . . .  E419
      452   END-RTN-EXIT
      426   FAIL . . . . . . . . . . . . .  P552 P582 P608 P626 P648 P670 P689 P705 P723 P750 P777 P795 P813 P831 P851 P878
                                            P896 P920 P938 P956 P981 P999 P1017 P1043 P1063 P1089 P1121 P1150 P1168 P1186
                                            P1204 P1235 P1253 P1271 P1289 P1317 P1335 P1353 P1371 P1401 P1419 P1437 P1455
                                            P1485 P1503 P1521 P1539 P1578 P1596 P1614 P1634 P1653 P1692 P1710 P1728 P1748
                                            P1767 P1806 P1824 P1842 P1862 P1881 P1922 P1940 P1958 P1977 P2019 P2037 P2055
                                            P2075 P2094 P2135 P2153 P2171 P2191 P2210
      500   FAIL-ROUTINE . . . . . . . . .  P435
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    58
0 Defined   Cross-reference of procedures   References

0     513   FAIL-ROUTINE-EX. . . . . . . .  E435 G507
      508   FAIL-ROUTINE-WRITE . . . . . .  G501 G502
      441   HEAD-ROUTINE . . . . . . . . .  P416
      424   INSPT
      412   OPEN-FILES
      425   PASS . . . . . . . . . . . . .  P543 P573 P599 P617 P639 P663 P680 P698 P716 P743 P770 P788 P806 P824 P842 P871
                                            P889 P911 P929 P947 P974 P992 P1010 P1036 P1054 P1082 P1114 P1142 P1159 P1177
                                            P1195 P1227 P1244 P1262 P1280 P1309 P1326 P1344 P1362 P1391 P1410 P1428 P1446
                                            P1477 P1494 P1512 P1530 P1569 P1587 P1605 P1624 P1644 P1683 P1701 P1719 P1737
                                            P1758 P1797 P1815 P1833 P1852 P1872 P1903 P1913 P1931 P1949 P1968 P2010 P2028
                                            P2046 P2065 P2085 P2126 P2144 P2162 P2180 P2201
      429   PRINT-DETAIL . . . . . . . . .  P554 P584 P610 P628 P650 P673 P691 P709 P727 P754 P781 P799 P817 P835 P853 P882
                                            P901 P922 P940 P958 P985 P1003 P1021 P1047 P1065 P1092 P1125 P1152 P1170 P1188
                                            P1206 P1237 P1255 P1273 P1291 P1319 P1337 P1355 P1373 P1403 P1421 P1439 P1457
                                            P1487 P1505 P1523 P1541 P1580 P1598 P1616 P1636 P1655 P1694 P1712 P1730 P1750
                                            P1769 P1808 P1826 P1844 P1864 P1883 P1904 P1924 P1942 P1960 P1979 P2021 P2039
                                            P2057 P2077 P2096 P2137 P2155 P2173 P2193 P2212
      525   SECT-NC202A-001
      422   TERMINATE-CALL
      420   TERMINATE-CCVS
      483   WRITE-LINE . . . . . . . . . .  P433 P434 P442 P443 P444 P445 P447 P448 P449 P451 P453 P462 P470 P476 P481 P482
                                            P505 P509 P511 P520
      495   WRT-LN . . . . . . . . . . . .  P489 P490 P491 P494 P499
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    59
0 Defined   Cross-reference of programs     References

        3   NC202A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC202A    Date 06/04/2022  Time 12:00:15   Page    60
0LineID  Message code  Message text

     34  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    541  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "FILLER" within "GRP-FOR-ADD-CORR-1" did not qualify
                       according to the rules for the "CORRESPONDING" phrase.  Subordinate item "FILLER" was ignored.

   1109  IGYPS2168-W   "CORRESPONDING" was specified, but subordinate item "RECORD2" within "TABLE1" did not qualify according to the
                       rules for the "CORRESPONDING" phrase.  Subordinate item "RECORD2" was ignored.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       3           1              2
-* Statistics for COBOL program NC202A:
 *    Source records = 2216
 *    Data Division statements = 284
 *    Procedure Division statements = 1274
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1295
0End of compilation 1,  program NC202A,  highest severity 4.
0Return code 4
