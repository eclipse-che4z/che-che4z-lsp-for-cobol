1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:23   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:23   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2514.2
   000002         000200 PROGRAM-ID.                                                      NC2514.2
   000003         000300     NC251A.                                                      NC2514.2
   000004         000500*                                                              *  NC2514.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2514.2
   000006         000700*                                                              *  NC2514.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2514.2
   000008         000900*                                                              *  NC2514.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2514.2
   000010         001100*                                                              *  NC2514.2
   000011         001300*                                                              *  NC2514.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2514.2
   000013         001500*                                                              *  NC2514.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2514.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2514.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2514.2
   000017         001900*                                                              *  NC2514.2
   000018         002100*                                                              *  NC2514.2
   000019         002200*    THIS PROGRAM TESTS FORMAT 5 OF THE DIVIDE STATEMENT.      *  NC2514.2
   000020         002300*                                                              *  NC2514.2
   000021         002500 ENVIRONMENT DIVISION.                                            NC2514.2
   000022         002600 CONFIGURATION SECTION.                                           NC2514.2
   000023         002700 SOURCE-COMPUTER.                                                 NC2514.2
   000024         002800     XXXXX082.                                                    NC2514.2
   000025         002900 OBJECT-COMPUTER.                                                 NC2514.2
   000026         003000     XXXXX083.                                                    NC2514.2
   000027         003100 INPUT-OUTPUT SECTION.                                            NC2514.2
   000028         003200 FILE-CONTROL.                                                    NC2514.2
   000029         003300     SELECT PRINT-FILE ASSIGN TO                                  NC2514.2 33
   000030         003400     XXXXX055.                                                    NC2514.2
   000031         003500 DATA DIVISION.                                                   NC2514.2
   000032         003600 FILE SECTION.                                                    NC2514.2
   000033         003700 FD  PRINT-FILE.                                                  NC2514.2

 ==000033==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000034         003800 01  PRINT-REC PICTURE X(120).                                    NC2514.2
   000035         003900 01  DUMMY-RECORD PICTURE X(120).                                 NC2514.2
   000036         004000 WORKING-STORAGE SECTION.                                         NC2514.2
   000037         004100 01  WRK-DU-1V17-1 PIC 9V9(17) VALUE 3.14159265358979323.         NC2514.2
   000038         004200 01  WRK-DU-1V5-1 PIC 9V9(5).                                     NC2514.2
   000039         004300 01  WRK-NE-1 PIC .9999/99999,99999,99.                           NC2514.2
   000040         004400 01  WS-REMAINDERS.                                               NC2514.2
   000041         004500   03  WS-REM                    PIC 99 OCCURS 20.                NC2514.2
   000042         004600 01  WRK-XN-00001-1              PIC X.                           NC2514.2
   000043         004700 01  WRK-XN-00001-2              PIC X.                           NC2514.2
   000044         004800 01  WS-46.                                                       NC2514.2
   000045         004900   03  WS-1-20                   PIC X(20).                       NC2514.2
   000046         005000   03  WS-21-40                  PIC X(20).                       NC2514.2
   000047         005100   03  WS-41-46                  PIC X(6).                        NC2514.2
   000048         005200 77  11A                PICTURE 9999  VALUE 9.                    NC2514.2
   000049         005300 77  11B   PICTURE 99; VALUE 8.                                   NC2514.2
   000050         005400 77  1111C PICTURE 99 VALUE 9.                                    NC2514.2
   000051         005500 77  WRK-DS-02V00                 PICTURE S99.                    NC2514.2
   000052         005600     88 TEST-2NUC-COND-99         VALUE 99.                       NC2514.2
   000053         005700 77  A99-DS-02V00                 PICTURE S99    VALUE 99.        NC2514.2
   000054         005800 77  WRK-DS-18V00                 PICTURE S9(18).                 NC2514.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 77  WRK-DU-2V1-1                 PICTURE S99V9.                  NC2514.2
   000056         006000 77  A18ONES-DS-18V00             PICTURE S9(18)                  NC2514.2
   000057         006100                                  VALUE 111111111111111111.       NC2514.2
   000058         006200 77  A18TWOS-DS-18V00             PICTURE S9(18)                  NC2514.2
   000059         006300                                  VALUE 222222222222222222.       NC2514.2
   000060         006400 77  WRK-DS-05V00                 PICTURE S9(5).                  NC2514.2
   000061         006500 77  A02TWOS-DU-02V00             PICTURE 99     VALUE 22.        NC2514.2
   000062         006600 77  A02TWOS-DS-03V02             PICTURE S999V99 VALUE +022.00.  NC2514.2
   000063         006700 77  ATWO-DS-01V00                PICTURE S9     VALUE 2.         NC2514.2
   000064         006800 77  AZERO-DS-05V05               PICTURE S9(5)V9(5) VALUE ZERO.  NC2514.2 IMP
   000065         006900 77  WRK-DS-06V06                 PICTURE S9(6)V9(6).             NC2514.2
   000066         007000 77  WRK-DS-0201P                 PICTURE S99P.                   NC2514.2
   000067         007100 77  A05ONES-DS-05V00             PICTURE S9(5)  VALUE 11111.     NC2514.2
   000068         007200 77  WRK-DS-09V00                 PICTURE S9(9).                  NC2514.2
   000069         007300 77  WRK-DS-09V09                 PICTURE S9(9)V9(9).             NC2514.2
   000070         007400 77  WRK-DS-18V00-S REDEFINES WRK-DS-09V09                        NC2514.2 69
   000071         007500                                  PICTURE S9(18).                 NC2514.2
   000072         007600 77  XRAY                    PICTURE IS X.                        NC2514.2
   000073         007700 77  W-1                     PICTURE IS 9.                        NC2514.2
   000074         007800 77  W-2                     PICTURE IS 99.                       NC2514.2
   000075         007900 77  W-3                     PICTURE IS 999.                      NC2514.2
   000076         008000 77  W-5                PICTURE 99  VALUE ZERO.                   NC2514.2 IMP
   000077         008100 77  W-9                     PICTURE 999.                         NC2514.2
   000078         008200 77  W-11               PICTURE S99V9.                            NC2514.2
   000079         008300 77  D-1                PICTURE S9V99  VALUE 1.06.                NC2514.2
   000080         008400 77  D-7                PICTURE S99V99  VALUE 1.09.               NC2514.2
   000081         008500 77  ONE                     PICTURE IS 9      VALUE IS 1.        NC2514.2
   000082         008600 77  TWO                     PICTURE IS S9     VALUE IS 2.        NC2514.2
   000083         008700 77  THREE                   PICTURE IS S9     VALUE IS 3.        NC2514.2
   000084         008800 77  FOUR                    PICTURE IS S9     VALUE IS 4.        NC2514.2
   000085         008900 77  FIVE                    PICTURE IS S9     VALUE IS 5.        NC2514.2
   000086         009000 77  SIX                     PICTURE IS S9     VALUE IS 6.        NC2514.2
   000087         009100 77  SEVEN                   PICTURE IS S9     VALUE IS 7.        NC2514.2
   000088         009200 77  EIGHT                   PICTURE IS 9      VALUE IS 8.        NC2514.2
   000089         009300 77  NINE                    PICTURE IS S9     VALUE IS 9.        NC2514.2
   000090         009400 77  TEN                     PICTURE IS S99    VALUE IS 10.       NC2514.2
   000091         009500 77  FIFTEEN                 PICTURE IS S99    VALUE IS 15.       NC2514.2
   000092         009600 77  TWENTY                  PICTURE IS S99    VALUE IS 20.       NC2514.2
   000093         009700 77  TWENTY-5                PICTURE IS S99    VALUE IS 25.       NC2514.2
   000094         009800 77  25COUNT PICTURE 999 VALUE ZERO.                              NC2514.2 IMP
   000095         009900 77  25ANS PICTURE  99 VALUE ZERO.                                NC2514.2 IMP
   000096         010000 77  25REM PICTURE 99 VALUE ZERO.                                 NC2514.2 IMP
   000097         010100 77  DIV-30-Y1 PICTURE 999 USAGE COMP SYNC RIGHT VALUE 31.        NC2514.2
   000098         010200 77  DIV-30-Y2 PICTURE 999 USAGE COMP VALUE 54.                   NC2514.2
   000099         010300 77  DIV-30-Y3 PICTURE 999 VALUE 151.                             NC2514.2
   000100         010400 77  DIV-30-Y4         PICTURE 9(4) SYNC RIGHT VALUE 1010.        NC2514.2
   000101         010500 77  DIV-Z1-30 PICTURE 999 USAGE COMP VALUE ZERO.                 NC2514.2 IMP
   000102         010600 77  DIV-Z2-30 PICTURE 999 SYNC RIGHT VALUE ZERO.                 NC2514.2 IMP
   000103         010700 77  DIV-Z3-30 PICTURE 999 USAGE COMP SYNC RIGHT VALUE ZERO.      NC2514.2 IMP
   000104         010800 77  DIV-Z4-30 PICTURE 999 VALUE ZERO.                            NC2514.2 IMP
   000105         010900 77  DIV-30-A1 PICTURE 999 SYNC RIGHT VALUE ZERO.                 NC2514.2 IMP
   000106         011000 77  DIV-30-A2 PICTURE 999 VALUE ZERO.                            NC2514.2 IMP
   000107         011100 77  DIV-30-A3 PICTURE 999 USAGE COMP SYNC RIGHT VALUE ZERO.      NC2514.2 IMP
   000108         011200 77  DIV-30-A4 PICTURE 999 USAGE COMP VALUE ZERO.                 NC2514.2 IMP
   000109         011300 01  DIV-ENTRIES.                                                 NC2514.2
   000110         011400     02 DIV11                PICTURE 999       VALUE 105.         NC2514.2
   000111         011500     02 DIV12                PICTURE 9999      VALUE 1000.        NC2514.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     02 DIV13                PICTURE 999.                         NC2514.2
   000113         011700     02 DIV14                PICTURE 99.                          NC2514.2
   000114         011800     02 DIV15                PICTURE 9V9       VALUE 1.1.         NC2514.2
   000115         011900     02 DIV16                PICTURE 99V99     VALUE 89.10.       NC2514.2
   000116         012000     02 DIV17                PICTURE 99V99.                       NC2514.2
   000117         012100     02 DIV18                PICTURE 9999.                        NC2514.2
   000118         012200     02 DIV19                PICTURE 99        VALUE 14.          NC2514.2
   000119         012300     02 DIV20                PICTURE 9999      VALUE 2147.        NC2514.2
   000120         012400     02 DIV21                PICTURE 999.                         NC2514.2
   000121         012500     02 DIV22                     PICTURE 99.                     NC2514.2
   000122         012600 01  WRK-DU-05V00-0001            PIC 9(5).                       NC2514.2
   000123         012700 01  WRK-DS-05V00-0002            PIC S9(5).                      NC2514.2
   000124         012800 01  WRK-CS-05V00-0003            PIC S9(5) COMP.                 NC2514.2
   000125         012900 01  WRK-DU-04V02-0004            PIC 9(4)V9(2).                  NC2514.2
   000126         013000 01  WRK-DS-04V01-0005            PIC S9(4)V9.                    NC2514.2
   000127         013100 01  NE-0008                      PIC $9(4).99-.                  NC2514.2
   000128         013200 01  NE-0009                      PIC ***99.                      NC2514.2
   000129         013300 01  NE-04V01-0006     PIC ****.9.                                NC2514.2
   000130         013400 01  GRP-0010.                                                    NC2514.2
   000131         013500     02 WRK-DU-03V00-L-0011       PIC 9(03) SYNC LEFT.            NC2514.2
   000132         013600     02 WRK-O005F-0012        OCCURS   5  TIMES.                  NC2514.2
   000133         013700        03 WRK-O003F-0013     OCCURS   3  TIMES.                  NC2514.2
   000134         013800           05 WRK-DS-03V04-O003F-0014 PIC S9(3)V9999              NC2514.2
   000135         013900                                            OCCURS 3 TIMES.       NC2514.2
   000136         014000 01  DS-02V00-0001                PIC S99  VALUE  16.             NC2514.2
   000137         014100 01  DS-03V00-0002                PIC S999 VALUE  174.            NC2514.2
   000138         014200 01  CS-05V00-0003                PIC S9(5) COMP  VALUE 10.       NC2514.2
   000139         014300 01    TA--X           PIC 9(5)  COMP VALUE ZERO.                 NC2514.2 IMP
   000140         014400 01  MINUS-NAMES.                                                 NC2514.2
   000141         014500     02  WHOLE-FIELD              PICTURE S9(18).                 NC2514.2
   000142         014600     02  PLUS-NAME1  PICTURE S9(18) VALUE +333333333333333333.    NC2514.2
   000143         014700     02  EVEN-NAME1  PICTURE S9(18) VALUE +1.                     NC2514.2
   000144         014800     02  PLUS-NAME2  PICTURE S9(18) VALUE +999999999999999999.    NC2514.2
   000145         014900     02  ALPHA-LIT                PICTURE X(5)  VALUE SPACE.      NC2514.2 IMP
   000146         015000     02  SNEG-LIT2                PICTURE S9(5)  VALUE -70718.    NC2514.2
   000147         015100 01  TEST-RESULTS.                                                NC2514.2
   000148         015200     02 FILLER                   PIC X      VALUE SPACE.          NC2514.2 IMP
   000149         015300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2514.2 IMP
   000150         015400     02 FILLER                   PIC X      VALUE SPACE.          NC2514.2 IMP
   000151         015500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2514.2 IMP
   000152         015600     02 FILLER                   PIC X      VALUE SPACE.          NC2514.2 IMP
   000153         015700     02  PAR-NAME.                                                NC2514.2
   000154         015800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2514.2 IMP
   000155         015900       03  PARDOT-X              PIC X      VALUE SPACE.          NC2514.2 IMP
   000156         016000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2514.2 IMP
   000157         016100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2514.2 IMP
   000158         016200     02 RE-MARK                  PIC X(61).                       NC2514.2
   000159         016300 01  TEST-COMPUTED.                                               NC2514.2
   000160         016400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2514.2 IMP
   000161         016500     02 FILLER                   PIC X(17)  VALUE                 NC2514.2
   000162         016600            "       COMPUTED=".                                   NC2514.2
   000163         016700     02 COMPUTED-X.                                               NC2514.2
   000164         016800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2514.2 IMP
   000165         016900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2514.2 164
   000166         017000                                 PIC -9(9).9(9).                  NC2514.2
   000167         017100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2514.2 164
   000168         017200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2514.2 164
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2514.2 164
   000170         017400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2514.2 164
   000171         017500         04 COMPUTED-18V0                    PIC -9(18).          NC2514.2
   000172         017600         04 FILLER                           PIC X.               NC2514.2
   000173         017700     03 FILLER PIC X(50) VALUE SPACE.                             NC2514.2 IMP
   000174         017800 01  TEST-CORRECT.                                                NC2514.2
   000175         017900     02 FILLER PIC X(30) VALUE SPACE.                             NC2514.2 IMP
   000176         018000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2514.2
   000177         018100     02 CORRECT-X.                                                NC2514.2
   000178         018200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2514.2 IMP
   000179         018300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2514.2 178
   000180         018400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2514.2 178
   000181         018500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2514.2 178
   000182         018600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2514.2 178
   000183         018700     03      CR-18V0 REDEFINES CORRECT-A.                         NC2514.2 178
   000184         018800         04 CORRECT-18V0                     PIC -9(18).          NC2514.2
   000185         018900         04 FILLER                           PIC X.               NC2514.2
   000186         019000     03 FILLER PIC X(2) VALUE SPACE.                              NC2514.2 IMP
   000187         019100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2514.2 IMP
   000188         019200 01  CCVS-C-1.                                                    NC2514.2
   000189         019300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2514.2
   000190         019400-    "SS  PARAGRAPH-NAME                                          NC2514.2
   000191         019500-    "       REMARKS".                                            NC2514.2
   000192         019600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2514.2 IMP
   000193         019700 01  CCVS-C-2.                                                    NC2514.2
   000194         019800     02 FILLER                     PIC X        VALUE SPACE.      NC2514.2 IMP
   000195         019900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2514.2
   000196         020000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2514.2 IMP
   000197         020100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2514.2
   000198         020200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2514.2 IMP
   000199         020300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2514.2 IMP
   000200         020400 01  REC-CT                        PIC 99       VALUE ZERO.       NC2514.2 IMP
   000201         020500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2514.2 IMP
   000202         020600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2514.2 IMP
   000203         020700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2514.2 IMP
   000204         020800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2514.2 IMP
   000205         020900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2514.2 IMP
   000206         021000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2514.2 IMP
   000207         021100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2514.2 IMP
   000208         021200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2514.2 IMP
   000209         021300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2514.2 IMP
   000210         021400 01  CCVS-H-1.                                                    NC2514.2
   000211         021500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2514.2 IMP
   000212         021600     02  FILLER                    PIC X(42)    VALUE             NC2514.2
   000213         021700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2514.2
   000214         021800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2514.2 IMP
   000215         021900 01  CCVS-H-2A.                                                   NC2514.2
   000216         022000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2514.2 IMP
   000217         022100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2514.2
   000218         022200   02  FILLER                        PIC XXXX   VALUE             NC2514.2
   000219         022300     "4.2 ".                                                      NC2514.2
   000220         022400   02  FILLER                        PIC X(28)  VALUE             NC2514.2
   000221         022500            " COPY - NOT FOR DISTRIBUTION".                       NC2514.2
   000222         022600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2514.2 IMP
   000223         022700                                                                  NC2514.2
   000224         022800 01  CCVS-H-2B.                                                   NC2514.2
   000225         022900   02  FILLER                        PIC X(15)  VALUE             NC2514.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000            "TEST RESULT OF ".                                    NC2514.2
   000227         023100   02  TEST-ID                       PIC X(9).                    NC2514.2
   000228         023200   02  FILLER                        PIC X(4)   VALUE             NC2514.2
   000229         023300            " IN ".                                               NC2514.2
   000230         023400   02  FILLER                        PIC X(12)  VALUE             NC2514.2
   000231         023500     " HIGH       ".                                              NC2514.2
   000232         023600   02  FILLER                        PIC X(22)  VALUE             NC2514.2
   000233         023700            " LEVEL VALIDATION FOR ".                             NC2514.2
   000234         023800   02  FILLER                        PIC X(58)  VALUE             NC2514.2
   000235         023900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2514.2
   000236         024000 01  CCVS-H-3.                                                    NC2514.2
   000237         024100     02  FILLER                      PIC X(34)  VALUE             NC2514.2
   000238         024200            " FOR OFFICIAL USE ONLY    ".                         NC2514.2
   000239         024300     02  FILLER                      PIC X(58)  VALUE             NC2514.2
   000240         024400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2514.2
   000241         024500     02  FILLER                      PIC X(28)  VALUE             NC2514.2
   000242         024600            "  COPYRIGHT   1985 ".                                NC2514.2
   000243         024700 01  CCVS-E-1.                                                    NC2514.2
   000244         024800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2514.2 IMP
   000245         024900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2514.2
   000246         025000     02 ID-AGAIN                     PIC X(9).                    NC2514.2
   000247         025100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2514.2 IMP
   000248         025200 01  CCVS-E-2.                                                    NC2514.2
   000249         025300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2514.2 IMP
   000250         025400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2514.2 IMP
   000251         025500     02 CCVS-E-2-2.                                               NC2514.2
   000252         025600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2514.2 IMP
   000253         025700         03 FILLER                   PIC X      VALUE SPACE.      NC2514.2 IMP
   000254         025800         03 ENDER-DESC               PIC X(44)  VALUE             NC2514.2
   000255         025900            "ERRORS ENCOUNTERED".                                 NC2514.2
   000256         026000 01  CCVS-E-3.                                                    NC2514.2
   000257         026100     02  FILLER                      PIC X(22)  VALUE             NC2514.2
   000258         026200            " FOR OFFICIAL USE ONLY".                             NC2514.2
   000259         026300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2514.2 IMP
   000260         026400     02  FILLER                      PIC X(58)  VALUE             NC2514.2
   000261         026500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2514.2
   000262         026600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2514.2 IMP
   000263         026700     02 FILLER                       PIC X(15)  VALUE             NC2514.2
   000264         026800             " COPYRIGHT 1985".                                   NC2514.2
   000265         026900 01  CCVS-E-4.                                                    NC2514.2
   000266         027000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2514.2 IMP
   000267         027100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2514.2
   000268         027200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2514.2 IMP
   000269         027300     02 FILLER                       PIC X(40)  VALUE             NC2514.2
   000270         027400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2514.2
   000271         027500 01  XXINFO.                                                      NC2514.2
   000272         027600     02 FILLER                       PIC X(19)  VALUE             NC2514.2
   000273         027700            "*** INFORMATION ***".                                NC2514.2
   000274         027800     02 INFO-TEXT.                                                NC2514.2
   000275         027900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2514.2 IMP
   000276         028000       04 XXCOMPUTED                 PIC X(20).                   NC2514.2
   000277         028100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2514.2 IMP
   000278         028200       04 XXCORRECT                  PIC X(20).                   NC2514.2
   000279         028300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2514.2
   000280         028400 01  HYPHEN-LINE.                                                 NC2514.2
   000281         028500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2514.2 IMP
   000282         028600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2514.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700-    "*****************************************".                 NC2514.2
   000284         028800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2514.2
   000285         028900-    "******************************".                            NC2514.2
   000286         029000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2514.2
   000287         029100     "NC251A".                                                    NC2514.2
   000288         029200 PROCEDURE DIVISION.                                              NC2514.2
   000289         029300 CCVS1 SECTION.                                                   NC2514.2
   000290         029400 OPEN-FILES.                                                      NC2514.2
   000291         029500     OPEN     OUTPUT PRINT-FILE.                                  NC2514.2 33
   000292         029600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2514.2 286 227 286 246
   000293         029700     MOVE    SPACE TO TEST-RESULTS.                               NC2514.2 IMP 147
   000294         029800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2514.2 319 324
   000295         029900     GO TO CCVS1-EXIT.                                            NC2514.2 401
   000296         030000 CLOSE-FILES.                                                     NC2514.2
   000297         030100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2514.2 328 349 33
   000298         030200 TERMINATE-CCVS.                                                  NC2514.2
   000299         030300     EXIT PROGRAM.                                                NC2514.2
   000300         030400 TERMINATE-CALL.                                                  NC2514.2
   000301         030500     STOP     RUN.                                                NC2514.2
   000302         030600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2514.2 151 203
   000303         030700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2514.2 151 204
   000304         030800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2514.2 151 202
   000305         030900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2514.2 151 201
   000306         031000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2514.2 158
   000307         031100 PRINT-DETAIL.                                                    NC2514.2
   000308         031200     IF REC-CT NOT EQUAL TO ZERO                                  NC2514.2 200 IMP
   000309      1  031300             MOVE "." TO PARDOT-X                                 NC2514.2 155
   000310      1  031400             MOVE REC-CT TO DOTVALUE.                             NC2514.2 200 156
   000311         031500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2514.2 147 34 361
   000312         031600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2514.2 151 361
   000313      1  031700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2514.2 378 391
   000314      1  031800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2514.2 392 400
   000315         031900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2514.2 IMP 151 IMP 163
   000316         032000     MOVE SPACE TO CORRECT-X.                                     NC2514.2 IMP 177
   000317         032100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2514.2 200 IMP IMP 153
   000318         032200     MOVE     SPACE TO RE-MARK.                                   NC2514.2 IMP 158
   000319         032300 HEAD-ROUTINE.                                                    NC2514.2
   000320         032400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2514.2 210 35 361
   000321         032500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2514.2 215 35 361
   000322         032600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2514.2 224 35 361
   000323         032700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2514.2 236 35 361
   000324         032800 COLUMN-NAMES-ROUTINE.                                            NC2514.2
   000325         032900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2514.2 188 35 361
   000326         033000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2514.2 193 35 361
   000327         033100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2514.2 280 35 361
   000328         033200 END-ROUTINE.                                                     NC2514.2
   000329         033300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2514.2 280 35 361
   000330         033400 END-RTN-EXIT.                                                    NC2514.2
   000331         033500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2514.2 243 35 361
   000332         033600 END-ROUTINE-1.                                                   NC2514.2
   000333         033700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2514.2 202 206 203
   000334         033800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2514.2 206 201 206
   000335         033900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2514.2 204 206
   000336         034000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2514.2
   000337         034100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2514.2 204 266
   000338         034200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2514.2 206 268
   000339         034300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2514.2 265 251
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2514.2 248 35 361
   000341         034500  END-ROUTINE-12.                                                 NC2514.2
   000342         034600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2514.2 254
   000343         034700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2514.2 202 IMP
   000344      1  034800         MOVE "NO " TO ERROR-TOTAL                                NC2514.2 252
   000345         034900         ELSE                                                     NC2514.2
   000346      1  035000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2514.2 202 252
   000347         035100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2514.2 248 35
   000348         035200     PERFORM WRITE-LINE.                                          NC2514.2 361
   000349         035300 END-ROUTINE-13.                                                  NC2514.2
   000350         035400     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2514.2 201 IMP
   000351      1  035500         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2514.2 252
   000352      1  035600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2514.2 201 252
   000353         035700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2514.2 254
   000354         035800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2514.2 248 35 361
   000355         035900      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2514.2 203 IMP
   000356      1  036000          MOVE "NO " TO ERROR-TOTAL                               NC2514.2 252
   000357      1  036100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2514.2 203 252
   000358         036200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2514.2 254
   000359         036300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2514.2 248 35 361
   000360         036400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2514.2 256 35 361
   000361         036500 WRITE-LINE.                                                      NC2514.2
   000362         036600     ADD 1 TO RECORD-COUNT.                                       NC2514.2 208
   000363         036700     IF RECORD-COUNT GREATER 50                                   NC2514.2 208
   000364      1  036800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2514.2 35 207
   000365      1  036900         MOVE SPACE TO DUMMY-RECORD                               NC2514.2 IMP 35
   000366      1  037000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2514.2 35
   000367      1  037100         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2514.2 188 35 373
   000368      1  037200         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2514.2 193 35 373
   000369      1  037300         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2514.2 280 35 373
   000370      1  037400         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2514.2 207 35
   000371      1  037500         MOVE ZERO TO RECORD-COUNT.                               NC2514.2 IMP 208
   000372         037600     PERFORM WRT-LN.                                              NC2514.2 373
   000373         037700 WRT-LN.                                                          NC2514.2
   000374         037800     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2514.2 35
   000375         037900     MOVE SPACE TO DUMMY-RECORD.                                  NC2514.2 IMP 35
   000376         038000 BLANK-LINE-PRINT.                                                NC2514.2
   000377         038100     PERFORM WRT-LN.                                              NC2514.2 373
   000378         038200 FAIL-ROUTINE.                                                    NC2514.2
   000379         038300     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2514.2 163 IMP 386
   000380         038400     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2514.2 177 IMP 386
   000381         038500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2514.2 209 279
   000382         038600     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2514.2 274
   000383         038700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2514.2 271 35 361
   000384         038800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2514.2 IMP 279
   000385         038900     GO TO  FAIL-ROUTINE-EX.                                      NC2514.2 391
   000386         039000 FAIL-ROUTINE-WRITE.                                              NC2514.2
   000387         039100     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2514.2 159 34 361
   000388         039200     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2514.2 209 187
   000389         039300     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2514.2 174 34 361
   000390         039400     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2514.2 IMP 187
   000391         039500 FAIL-ROUTINE-EX. EXIT.                                           NC2514.2
   000392         039600 BAIL-OUT.                                                        NC2514.2
   000393         039700     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2514.2 164 IMP 395
   000394         039800     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2514.2 178 IMP 400
   000395         039900 BAIL-OUT-WRITE.                                                  NC2514.2
   000396         040000     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2514.2 178 278 164 276
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040100     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2514.2 209 279
   000398         040200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2514.2 271 35 361
   000399         040300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2514.2 IMP 279
   000400         040400 BAIL-OUT-EX. EXIT.                                               NC2514.2
   000401         040500 CCVS1-EXIT.                                                      NC2514.2
   000402         040600     EXIT.                                                        NC2514.2
   000403         040700 SECT-NC251A-001 SECTION.                                         NC2514.2
   000404         040800 DIV-TEST-4.                                                      NC2514.2
   000405         040900     DIVIDE DIV16 BY DIV15 GIVING DIV17 REMAINDER DIV18.          NC2514.2 115 114 116 117
   000406         041000     IF DIV18 IS EQUAL TO ZERO                                    NC2514.2 117 IMP
   000407      1  041100              PERFORM PASS                                        NC2514.2 303
   000408      1  041200              GO TO DIV-WRITE-4.                                  NC2514.2 415
   000409         041300     PERFORM FAIL.                                                NC2514.2 304
   000410         041400     MOVE DIV18 TO COMPUTED-N.                                    NC2514.2 117 165
   000411         041500     MOVE "0000" TO CORRECT-A.                                    NC2514.2 178
   000412         041600     GO TO DIV-WRITE-4.                                           NC2514.2 415
   000413         041700 DIV-DELETE-4.                                                    NC2514.2
   000414         041800     PERFORM DE-LETE.                                             NC2514.2 305
   000415         041900 DIV-WRITE-4.                                                     NC2514.2
   000416         042000     MOVE "DIV-TEST-4" TO PAR-NAME.                               NC2514.2 153
   000417         042100     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000418         042200 DIV-TEST-5.                                                      NC2514.2
   000419         042300     MOVE ZERO TO DIV21.                                          NC2514.2 IMP 120
   000420         042400     MOVE ZERO TO DIV22.                                          NC2514.2 IMP 121
   000421         042500     DIVIDE DIV20 BY DIV19 GIVING DIV21 ROUNDED REMAINDER         NC2514.2 119 118 120
   000422         042600     DIV22.                                                       NC2514.2 121
   000423         042700     IF DIV22 IS EQUAL TO 05                                      NC2514.2 121
   000424      1  042800              PERFORM PASS                                        NC2514.2 303
   000425      1  042900              GO TO DIV-WRITE-5.                                  NC2514.2 432
   000426         043000     PERFORM FAIL.                                                NC2514.2 304
   000427         043100     MOVE DIV22 TO COMPUTED-N.                                    NC2514.2 121 165
   000428         043200     MOVE "+05" TO CORRECT-A.                                     NC2514.2 178
   000429         043300     GO TO DIV-WRITE-5.                                           NC2514.2 432
   000430         043400 DIV-DELETE-5.                                                    NC2514.2
   000431         043500     PERFORM DE-LETE.                                             NC2514.2 305
   000432         043600 DIV-WRITE-5.                                                     NC2514.2
   000433         043700     MOVE "DIV-TEST-5" TO PAR-NAME.                               NC2514.2 153
   000434         043800     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000435         043900*                                                                 NC2514.2
   000436         044000 DIV-INIT-F5-3.                                                   NC2514.2
   000437         044100     MOVE   "VI-82 6.11.4 GR4" TO ANSI-REFERENCE.                 NC2514.2 209
   000438         044200     MOVE   "DIV-TEST-F5-3-0"  TO PAR-NAME.                       NC2514.2 153
   000439         044300     MOVE    40   TO 25COUNT.                                     NC2514.2 94
   000440         044400     MOVE    ZERO TO 25ANS.                                       NC2514.2 IMP 95
   000441         044500     MOVE    ZERO TO 25REM.                                       NC2514.2 IMP 96
   000442         044600     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000443         044700 DIV-TEST-F5-3-0.                                                 NC2514.2
   000444         044800     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000445         044900             ON SIZE ERROR                                        NC2514.2
   000446      1  045000             MOVE   "SIZE ERROR SHOULD NOT HAVE OCCURED"          NC2514.2
   000447      1  045100                  TO RE-MARK                                      NC2514.2 158
   000448      1  045200             PERFORM FAIL                                         NC2514.2 304
   000449      1  045300             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000450      1  045400             GO TO   DIV-TEST-F5-3-1.                             NC2514.2 458
   000451         045500     PERFORM PASS.                                                NC2514.2 303
   000452         045600     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000453         045700     GO TO   DIV-TEST-F5-3-1.                                     NC2514.2 458
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800 DIV-DELETE-F5-3.                                                 NC2514.2
   000455         045900     PERFORM DE-LETE.                                             NC2514.2 305
   000456         046000     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000457         046100     GO TO   DIV-INIT-F5-4.                                       NC2514.2 483
   000458         046200 DIV-TEST-F5-3-1.                                                 NC2514.2
   000459         046300     MOVE   "DIV-TEST-F5-3-1" TO PAR-NAME.                        NC2514.2 153
   000460         046400     ADD     1 TO REC-CT.                                         NC2514.2 200
   000461         046500     IF      25ANS NOT = 2                                        NC2514.2 95
   000462      1  046600             MOVE    2 TO CORRECT-N                               NC2514.2 179
   000463      1  046700             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000464      1  046800             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000465      1  046900             PERFORM FAIL                                         NC2514.2 304
   000466      1  047000             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000467         047100     ELSE                                                         NC2514.2
   000468      1  047200             PERFORM PASS                                         NC2514.2 303
   000469      1  047300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000470         047400 DIV-TEST-F5-3-2.                                                 NC2514.2
   000471         047500     MOVE   "DIV-TEST-F5-3-2" TO PAR-NAME.                        NC2514.2 153
   000472         047600     ADD     1 TO REC-CT.                                         NC2514.2 200
   000473         047700     IF      25REM NOT = 20                                       NC2514.2 96
   000474      1  047800             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   000475      1  047900             MOVE    20    TO CORRECT-N                           NC2514.2 179
   000476      1  048000             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000477      1  048100             PERFORM FAIL                                         NC2514.2 304
   000478      1  048200             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000479         048300     ELSE                                                         NC2514.2
   000480      1  048400             PERFORM PASS                                         NC2514.2 303
   000481      1  048500             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000482         048600*                                                                 NC2514.2
   000483         048700 DIV-INIT-F5-4.                                                   NC2514.2
   000484         048800     MOVE   "VI-82 6.11.4 GR4" TO ANSI-REFERENCE.                 NC2514.2 209
   000485         048900     MOVE   "DIV-TEST-F5-4-0"  TO PAR-NAME.                       NC2514.2 153
   000486         049000     MOVE    ZERO TO 25COUNT.                                     NC2514.2 IMP 94
   000487         049100     MOVE    ZERO TO 25ANS.                                       NC2514.2 IMP 95
   000488         049200     MOVE    ZERO TO 25REM.                                       NC2514.2 IMP 96
   000489         049300     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000490         049400 DIV-TEST-F5-4-0.                                                 NC2514.2
   000491         049500     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000492         049600             ON SIZE ERROR                                        NC2514.2
   000493      1  049700             PERFORM PASS                                         NC2514.2 303
   000494      1  049800             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000495      1  049900             GO TO   DIV-TEST-F5-4-1.                             NC2514.2 504
   000496         050000     MOVE   "ON SIZE ERROR SHOULD HAVE OCCURRED" TO RE-MARK.      NC2514.2 158
   000497         050100     PERFORM FAIL.                                                NC2514.2 304
   000498         050200     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000499         050300     GO TO   DIV-TEST-F5-4-1.                                     NC2514.2 504
   000500         050400 DIV-DELETE-F5-4.                                                 NC2514.2
   000501         050500     PERFORM DE-LETE.                                             NC2514.2 305
   000502         050600     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000503         050700     GO TO   DIV-INIT-F5-5.                                       NC2514.2 529
   000504         050800 DIV-TEST-F5-4-1.                                                 NC2514.2
   000505         050900     MOVE   "DIV-TEST-F5-4-1" TO PAR-NAME.                        NC2514.2 153
   000506         051000     ADD     1 TO REC-CT.                                         NC2514.2 200
   000507         051100     IF      25ANS NOT = 0                                        NC2514.2 95
   000508      1  051200             MOVE    0 TO CORRECT-N                               NC2514.2 179
   000509      1  051300             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000510      1  051400             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051500             PERFORM FAIL                                         NC2514.2 304
   000512      1  051600             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000513         051700     ELSE                                                         NC2514.2
   000514      1  051800             PERFORM PASS                                         NC2514.2 303
   000515      1  051900             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000516         052000 DIV-TEST-F5-4-2.                                                 NC2514.2
   000517         052100     MOVE   "DIV-TEST-F5-4-2" TO PAR-NAME.                        NC2514.2 153
   000518         052200     ADD     1 TO REC-CT.                                         NC2514.2 200
   000519         052300     IF      25REM NOT = ZERO                                     NC2514.2 96 IMP
   000520      1  052400             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   000521      1  052500             MOVE    ZERO  TO CORRECT-N                           NC2514.2 IMP 179
   000522      1  052600             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000523      1  052700             PERFORM FAIL                                         NC2514.2 304
   000524      1  052800             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000525         052900     ELSE                                                         NC2514.2
   000526      1  053000             PERFORM PASS                                         NC2514.2 303
   000527      1  053100             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000528         053200*                                                                 NC2514.2
   000529         053300 DIV-INIT-F5-5.                                                   NC2514.2
   000530         053400     MOVE   "VI-82 6.11.4 GR4" TO ANSI-REFERENCE.                 NC2514.2 209
   000531         053500     MOVE   "DIV-TEST-F5-5-0"  TO PAR-NAME.                       NC2514.2 153
   000532         053600     MOVE    3    TO 25COUNT.                                     NC2514.2 94
   000533         053700     MOVE    ZERO TO 25ANS.                                       NC2514.2 IMP 95
   000534         053800     MOVE    ZERO TO 25REM.                                       NC2514.2 IMP 96
   000535         053900     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000536         054000 DIV-TEST-F5-5-0.                                                 NC2514.2
   000537         054100     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000538         054200             ON SIZE ERROR                                        NC2514.2
   000539      1  054300             MOVE   "SIZE ERROR SHOULD NOT HAVE OCCURED"          NC2514.2
   000540      1  054400                  TO RE-MARK                                      NC2514.2 158
   000541      1  054500             PERFORM FAIL                                         NC2514.2 304
   000542      1  054600             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000543      1  054700             GO TO   DIV-TEST-F5-5-1.                             NC2514.2 551
   000544         054800     PERFORM PASS.                                                NC2514.2 303
   000545         054900     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000546         055000     GO TO   DIV-TEST-F5-5-1.                                     NC2514.2 551
   000547         055100 DIV-DELETE-F5-5.                                                 NC2514.2
   000548         055200     PERFORM DE-LETE.                                             NC2514.2 305
   000549         055300     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000550         055400     GO TO   DIV-TEST-12.                                         NC2514.2 576
   000551         055500 DIV-TEST-F5-5-1.                                                 NC2514.2
   000552         055600     MOVE   "DIV-TEST-F5-5-1" TO PAR-NAME.                        NC2514.2 153
   000553         055700     ADD     1 TO REC-CT.                                         NC2514.2 200
   000554         055800     IF      25ANS NOT = 33                                       NC2514.2 95
   000555      1  055900             MOVE    33    TO CORRECT-N                           NC2514.2 179
   000556      1  056000             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000557      1  056100             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000558      1  056200             PERFORM FAIL                                         NC2514.2 304
   000559      1  056300             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000560         056400     ELSE                                                         NC2514.2
   000561      1  056500             PERFORM PASS                                         NC2514.2 303
   000562      1  056600             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000563         056700 DIV-TEST-F5-5-2.                                                 NC2514.2
   000564         056800     MOVE   "DIV-TEST-F5-5-2" TO PAR-NAME.                        NC2514.2 153
   000565         056900     ADD     1 TO REC-CT.                                         NC2514.2 200
   000566         057000     IF      25REM NOT = 1                                        NC2514.2 96
   000567      1  057100             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057200             MOVE    1     TO CORRECT-N                           NC2514.2 179
   000569      1  057300             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000570      1  057400             PERFORM FAIL                                         NC2514.2 304
   000571      1  057500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000572         057600     ELSE                                                         NC2514.2
   000573      1  057700             PERFORM PASS                                         NC2514.2 303
   000574      1  057800             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000575         057900*                                                                 NC2514.2
   000576         058000 DIV-TEST-12.                                                     NC2514.2
   000577         058100     DIVIDE 230 BY DIV-30-Y2 GIVING DIV-Z2-30 REMAINDER           NC2514.2 98 102
   000578         058200     DIV-30-A2.                                                   NC2514.2 106
   000579         058300     IF DIV-Z2-30 EQUAL TO 4 AND DIV-30-A2 EQUAL TO 14            NC2514.2 102 106
   000580      1  058400              PERFORM PASS                                        NC2514.2 303
   000581      1  058500              GO TO DIV-WRITE-12.                                 NC2514.2 588
   000582         058600     PERFORM FAIL.                                                NC2514.2 304
   000583         058700     MOVE   4 TO CORRECT-N.                                       NC2514.2 179
   000584         058800     MOVE DIV-30-A3 TO COMPUTED-N.                                NC2514.2 107 165
   000585         058900     GO TO DIV-WRITE-12.                                          NC2514.2 588
   000586         059000 DIV-DELETE-12.                                                   NC2514.2
   000587         059100     PERFORM DE-LETE.                                             NC2514.2 305
   000588         059200 DIV-WRITE-12.                                                    NC2514.2
   000589         059300     MOVE "DIV-TEST-12" TO PAR-NAME.                              NC2514.2 153
   000590         059400     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000591         059500*                                                                 NC2514.2
   000592         059600 DIV-INIT-F5-7.                                                   NC2514.2
   000593         059700     MOVE   "VI-82 6.11.4 GR4" TO ANSI-REFERENCE.                 NC2514.2 209
   000594         059800     MOVE   "DIV-TEST-F5-7-0"  TO PAR-NAME.                       NC2514.2 153
   000595         059900     MOVE    151  TO DIV-30-Y3.                                   NC2514.2 99
   000596         060000     MOVE    ZERO TO DIV-Z3-30.                                   NC2514.2 IMP 103
   000597         060100     MOVE    ZERO TO DIV-30-A3.                                   NC2514.2 IMP 107
   000598         060200     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000599         060300 DIV-TEST-F5-7-0.                                                 NC2514.2
   000600         060400     DIVIDE 681 BY DIV-30-Y3 GIVING DIV-Z3-30 REMAINDER           NC2514.2 99 103
   000601         060500     DIV-30-A3.                                                   NC2514.2 107
   000602         060600     GO TO   DIV-TEST-F5-7-1.                                     NC2514.2 607
   000603         060700 DIV-DELETE-F5-7.                                                 NC2514.2
   000604         060800     PERFORM DE-LETE.                                             NC2514.2 305
   000605         060900     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000606         061000     GO TO   DIV-INIT-F5-8.                                       NC2514.2 632
   000607         061100 DIV-TEST-F5-7-1.                                                 NC2514.2
   000608         061200     MOVE   "DIV-TEST-F5-7-1" TO PAR-NAME.                        NC2514.2 153
   000609         061300     ADD     1 TO REC-CT.                                         NC2514.2 200
   000610         061400     IF      DIV-Z3-30 NOT EQUAL TO 4                             NC2514.2 103
   000611      1  061500             MOVE    4     TO CORRECT-N                           NC2514.2 179
   000612      1  061600             MOVE    DIV-Z3-30 TO COMPUTED-N                      NC2514.2 103 165
   000613      1  061700             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000614      1  061800             PERFORM FAIL                                         NC2514.2 304
   000615      1  061900             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000616         062000     ELSE                                                         NC2514.2
   000617      1  062100             PERFORM PASS                                         NC2514.2 303
   000618      1  062200             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000619         062300 DIV-TEST-F5-7-2.                                                 NC2514.2
   000620         062400     MOVE   "DIV-TEST-F5-7-2" TO PAR-NAME.                        NC2514.2 153
   000621         062500     ADD     1 TO REC-CT.                                         NC2514.2 200
   000622         062600     IF      DIV-30-A3 NOT EQUAL TO 77                            NC2514.2 107
   000623      1  062700             MOVE    DIV-30-A3 TO COMPUTED-N                      NC2514.2 107 165
   000624      1  062800             MOVE    77    TO CORRECT-N                           NC2514.2 179
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062900             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000626      1  063000             PERFORM FAIL                                         NC2514.2 304
   000627      1  063100             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000628         063200     ELSE                                                         NC2514.2
   000629      1  063300             PERFORM PASS                                         NC2514.2 303
   000630      1  063400             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000631         063500*                                                                 NC2514.2
   000632         063600 DIV-INIT-F5-8.                                                   NC2514.2
   000633         063700     MOVE   "VI-82 6.11.4 GR4" TO ANSI-REFERENCE.                 NC2514.2 209
   000634         063800     MOVE   "DIV-TEST-F5-8-0"  TO PAR-NAME.                       NC2514.2 153
   000635         063900     MOVE    1010 TO DIV-30-Y4.                                   NC2514.2 100
   000636         064000     MOVE    ZERO TO DIV-Z4-30.                                   NC2514.2 IMP 104
   000637         064100     MOVE    ZERO TO DIV-30-A4.                                   NC2514.2 IMP 108
   000638         064200     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000639         064300 DIV-TEST-F5-8-0.                                                 NC2514.2
   000640         064400     DIVIDE  4150 BY DIV-30-Y4 GIVING DIV-Z4-30 REMAINDER         NC2514.2 100 104
   000641         064500     DIV-30-A4.                                                   NC2514.2 108
   000642         064600     GO TO   DIV-TEST-F5-8-1.                                     NC2514.2 647
   000643         064700 DIV-DELETE-F5-8.                                                 NC2514.2
   000644         064800     PERFORM DE-LETE.                                             NC2514.2 305
   000645         064900     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000646         065000     GO TO   DIV-INIT-F5-9.                                       NC2514.2 673
   000647         065100 DIV-TEST-F5-8-1.                                                 NC2514.2
   000648         065200     MOVE   "DIV-TEST-F5-8-1" TO PAR-NAME.                        NC2514.2 153
   000649         065300     ADD     1 TO REC-CT.                                         NC2514.2 200
   000650         065400     IF      DIV-Z4-30 NOT EQUAL TO 4                             NC2514.2 104
   000651      1  065500             MOVE    4     TO CORRECT-N                           NC2514.2 179
   000652      1  065600             MOVE    DIV-Z4-30 TO COMPUTED-N                      NC2514.2 104 165
   000653      1  065700             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000654      1  065800             PERFORM FAIL                                         NC2514.2 304
   000655      1  065900             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000656         066000     ELSE                                                         NC2514.2
   000657      1  066100             PERFORM PASS                                         NC2514.2 303
   000658      1  066200             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000659         066300 DIV-TEST-F5-8-2.                                                 NC2514.2
   000660         066400     MOVE   "DIV-TEST-F5-8-2" TO PAR-NAME.                        NC2514.2 153
   000661         066500     ADD     1 TO REC-CT.                                         NC2514.2 200
   000662         066600     IF      DIV-30-A4 NOT EQUAL TO 110                           NC2514.2 108
   000663      1  066700             MOVE    DIV-30-A4 TO COMPUTED-N                      NC2514.2 108 165
   000664      1  066800             MOVE    110   TO CORRECT-N                           NC2514.2 179
   000665      1  066900             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000666      1  067000             PERFORM FAIL                                         NC2514.2 304
   000667      1  067100             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000668         067200     ELSE                                                         NC2514.2
   000669      1  067300             PERFORM PASS                                         NC2514.2 303
   000670      1  067400             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000671         067500*                                                                 NC2514.2
   000672         067600*                                                                 NC2514.2
   000673         067700 DIV-INIT-F5-9.                                                   NC2514.2
   000674         067800     MOVE   "VI-82 6.11.4 GR4" TO ANSI-REFERENCE.                 NC2514.2 209
   000675         067900     MOVE   "DIV-TEST-F5-9-0"  TO PAR-NAME.                       NC2514.2 153
   000676         068000     MOVE    31   TO DIV-30-Y1.                                   NC2514.2 97
   000677         068100     MOVE    ZERO TO DIV-Z1-30.                                   NC2514.2 IMP 101
   000678         068200     MOVE    ZERO TO DIV-30-A1.                                   NC2514.2 IMP 105
   000679         068300     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000680         068400 DIV-TEST-F5-9-0.                                                 NC2514.2
   000681         068500     DIVIDE 150 BY DIV-30-Y1 GIVING DIV-Z1-30 REMAINDER DIV-30-A1.NC2514.2 97 101 105
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600     GO TO   DIV-TEST-F5-9-1.                                     NC2514.2 687
   000683         068700 DIV-DELETE-F5-9.                                                 NC2514.2
   000684         068800     PERFORM DE-LETE.                                             NC2514.2 305
   000685         068900     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000686         069000     GO TO   DIV-INIT-F5-10.                                      NC2514.2 712
   000687         069100 DIV-TEST-F5-9-1.                                                 NC2514.2
   000688         069200     MOVE   "DIV-TEST-F5-9-1" TO PAR-NAME.                        NC2514.2 153
   000689         069300     ADD     1 TO REC-CT.                                         NC2514.2 200
   000690         069400     IF      DIV-Z1-30 NOT EQUAL TO 4                             NC2514.2 101
   000691      1  069500             MOVE    4     TO CORRECT-N                           NC2514.2 179
   000692      1  069600             MOVE    DIV-Z1-30 TO COMPUTED-N                      NC2514.2 101 165
   000693      1  069700             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000694      1  069800             PERFORM FAIL                                         NC2514.2 304
   000695      1  069900             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000696         070000     ELSE                                                         NC2514.2
   000697      1  070100             PERFORM PASS                                         NC2514.2 303
   000698      1  070200             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000699         070300 DIV-TEST-F5-9-2.                                                 NC2514.2
   000700         070400     MOVE   "DIV-TEST-F5-9-2" TO PAR-NAME.                        NC2514.2 153
   000701         070500     ADD     1 TO REC-CT.                                         NC2514.2 200
   000702         070600     IF      DIV-30-A1 NOT EQUAL TO 26                            NC2514.2 105
   000703      1  070700             MOVE    DIV-30-A4 TO COMPUTED-N                      NC2514.2 108 165
   000704      1  070800             MOVE    26    TO CORRECT-N                           NC2514.2 179
   000705      1  070900             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000706      1  071000             PERFORM FAIL                                         NC2514.2 304
   000707      1  071100             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000708         071200     ELSE                                                         NC2514.2
   000709      1  071300             PERFORM PASS                                         NC2514.2 303
   000710      1  071400             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000711         071500*                                                                 NC2514.2
   000712         071600 DIV-INIT-F5-10.                                                  NC2514.2
   000713         071700     MOVE   "VI-82 6.11.4 GR8" TO ANSI-REFERENCE.                 NC2514.2 209
   000714         071800     MOVE   "DIV-TEST-F5-10-0" TO PAR-NAME.                       NC2514.2 153
   000715         071900     MOVE    40   TO 25COUNT.                                     NC2514.2 94
   000716         072000     MOVE    ZERO TO 25ANS.                                       NC2514.2 IMP 95
   000717         072100     MOVE    ZERO TO 25REM.                                       NC2514.2 IMP 96
   000718         072200     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000719         072300 DIV-TEST-F5-10-0.                                                NC2514.2
   000720         072400     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000721         072500         NOT ON SIZE ERROR                                        NC2514.2
   000722      1  072600             PERFORM PASS                                         NC2514.2 303
   000723      1  072700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000724      1  072800             GO TO   DIV-TEST-F5-10-1.                            NC2514.2 733
   000725         072900     MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED" TO RE-MARK.  NC2514.2 158
   000726         073000     PERFORM FAIL.                                                NC2514.2 304
   000727         073100     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000728         073200     GO TO   DIV-TEST-F5-10-1.                                    NC2514.2 733
   000729         073300 DIV-DELETE-F5-10.                                                NC2514.2
   000730         073400     PERFORM DE-LETE.                                             NC2514.2 305
   000731         073500     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000732         073600     GO TO   DIV-INIT-F5-11.                                      NC2514.2 758
   000733         073700 DIV-TEST-F5-10-1.                                                NC2514.2
   000734         073800     MOVE   "DIV-TEST-F5-10-1" TO PAR-NAME.                       NC2514.2 153
   000735         073900     ADD     1 TO REC-CT.                                         NC2514.2 200
   000736         074000     IF      25ANS NOT = 2                                        NC2514.2 95
   000737      1  074100             MOVE    2 TO CORRECT-N                               NC2514.2 179
   000738      1  074200             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  074300             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000740      1  074400             PERFORM FAIL                                         NC2514.2 304
   000741      1  074500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000742         074600     ELSE                                                         NC2514.2
   000743      1  074700             PERFORM PASS                                         NC2514.2 303
   000744      1  074800             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000745         074900 DIV-TEST-F5-10-2.                                                NC2514.2
   000746         075000     MOVE   "DIV-TEST-F5-10-2" TO PAR-NAME.                       NC2514.2 153
   000747         075100     ADD     1 TO REC-CT.                                         NC2514.2 200
   000748         075200     IF      25REM NOT = 20                                       NC2514.2 96
   000749      1  075300             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   000750      1  075400             MOVE    20    TO CORRECT-N                           NC2514.2 179
   000751      1  075500             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000752      1  075600             PERFORM FAIL                                         NC2514.2 304
   000753      1  075700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000754         075800     ELSE                                                         NC2514.2
   000755      1  075900             PERFORM PASS                                         NC2514.2 303
   000756      1  076000             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000757         076100*                                                                 NC2514.2
   000758         076200 DIV-INIT-F5-11.                                                  NC2514.2
   000759         076300     MOVE   "VI-82 6.11.4 GR8" TO ANSI-REFERENCE.                 NC2514.2 209
   000760         076400     MOVE   "DIV-TEST-F5-11-0"  TO PAR-NAME.                      NC2514.2 153
   000761         076500     MOVE    ZERO TO 25COUNT.                                     NC2514.2 IMP 94
   000762         076600     MOVE    ZERO TO 25ANS.                                       NC2514.2 IMP 95
   000763         076700     MOVE    ZERO TO 25REM.                                       NC2514.2 IMP 96
   000764         076800     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000765         076900 DIV-TEST-F5-11-0.                                                NC2514.2
   000766         077000     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000767         077100         NOT ON SIZE ERROR                                        NC2514.2
   000768      1  077200             MOVE   "NOT ON SIZE ERROR SHOULD NOT HAVE EXECUTED"  NC2514.2
   000769      1  077300                  TO RE-MARK                                      NC2514.2 158
   000770      1  077400             PERFORM FAIL                                         NC2514.2 304
   000771      1  077500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000772      1  077600             GO TO   DIV-TEST-F5-11-1.                            NC2514.2 780
   000773         077700     PERFORM PASS.                                                NC2514.2 303
   000774         077800     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000775         077900     GO TO   DIV-TEST-F5-11-1.                                    NC2514.2 780
   000776         078000 DIV-DELETE-F5-11.                                                NC2514.2
   000777         078100     PERFORM DE-LETE.                                             NC2514.2 305
   000778         078200     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000779         078300     GO TO   DIV-INIT-F5-12.                                      NC2514.2 805
   000780         078400 DIV-TEST-F5-11-1.                                                NC2514.2
   000781         078500     MOVE   "DIV-TEST-F5-11-1" TO PAR-NAME.                       NC2514.2 153
   000782         078600     ADD     1 TO REC-CT.                                         NC2514.2 200
   000783         078700     IF      25ANS NOT = 0                                        NC2514.2 95
   000784      1  078800             MOVE    0 TO CORRECT-N                               NC2514.2 179
   000785      1  078900             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000786      1  079000             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000787      1  079100             PERFORM FAIL                                         NC2514.2 304
   000788      1  079200             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000789         079300     ELSE                                                         NC2514.2
   000790      1  079400             PERFORM PASS                                         NC2514.2 303
   000791      1  079500             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000792         079600 DIV-TEST-F5-11-2.                                                NC2514.2
   000793         079700     MOVE   "DIV-TEST-F5-11-2" TO PAR-NAME.                       NC2514.2 153
   000794         079800     ADD     1 TO REC-CT.                                         NC2514.2 200
   000795         079900     IF      25REM NOT = ZERO                                     NC2514.2 96 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796      1  080000             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   000797      1  080100             MOVE    ZERO  TO CORRECT-N                           NC2514.2 IMP 179
   000798      1  080200             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000799      1  080300             PERFORM FAIL                                         NC2514.2 304
   000800      1  080400             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000801         080500     ELSE                                                         NC2514.2
   000802      1  080600             PERFORM PASS                                         NC2514.2 303
   000803      1  080700             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000804         080800*                                                                 NC2514.2
   000805         080900 DIV-INIT-F5-12.                                                  NC2514.2
   000806         081000     MOVE   "VI-82 6.11.4 GR8" TO ANSI-REFERENCE.                 NC2514.2 209
   000807         081100     MOVE   "DIV-TEST-F5-12-0" TO PAR-NAME.                       NC2514.2 153
   000808         081200     MOVE    40   TO 25COUNT.                                     NC2514.2 94
   000809         081300     MOVE    ZERO TO 25ANS.                                       NC2514.2 IMP 95
   000810         081400     MOVE    ZERO TO 25REM.                                       NC2514.2 IMP 96
   000811         081500     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000812         081600 DIV-TEST-F5-12-0.                                                NC2514.2
   000813         081700     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000814         081800             ON SIZE ERROR                                        NC2514.2
   000815      1  081900             MOVE   "ON SIZE ERROR SHOULD NOT HAVE EXECUTED"      NC2514.2
   000816      1  082000                  TO RE-MARK                                      NC2514.2 158
   000817      1  082100             PERFORM FAIL                                         NC2514.2 304
   000818      1  082200             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000819      1  082300             GO TO   DIV-TEST-F5-12-1                             NC2514.2 828
   000820         082400         NOT ON SIZE ERROR                                        NC2514.2
   000821      1  082500             PERFORM PASS                                         NC2514.2 303
   000822      1  082600             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000823      1  082700             GO TO   DIV-TEST-F5-12-1.                            NC2514.2 828
   000824         082800 DIV-DELETE-F5-12.                                                NC2514.2
   000825         082900     PERFORM DE-LETE.                                             NC2514.2 305
   000826         083000     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000827         083100     GO TO   DIV-INIT-F5-13.                                      NC2514.2 853
   000828         083200 DIV-TEST-F5-12-1.                                                NC2514.2
   000829         083300     MOVE   "DIV-TEST-F5-12-1" TO PAR-NAME.                       NC2514.2 153
   000830         083400     ADD     1 TO REC-CT.                                         NC2514.2 200
   000831         083500     IF      25ANS NOT = 2                                        NC2514.2 95
   000832      1  083600             MOVE    2 TO CORRECT-N                               NC2514.2 179
   000833      1  083700             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000834      1  083800             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000835      1  083900             PERFORM FAIL                                         NC2514.2 304
   000836      1  084000             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000837         084100     ELSE                                                         NC2514.2
   000838      1  084200             PERFORM PASS                                         NC2514.2 303
   000839      1  084300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000840         084400 DIV-TEST-F5-12-2.                                                NC2514.2
   000841         084500     MOVE   "DIV-TEST-F5-12-2" TO PAR-NAME.                       NC2514.2 153
   000842         084600     ADD     1 TO REC-CT.                                         NC2514.2 200
   000843         084700     IF      25REM NOT = 20                                       NC2514.2 96
   000844      1  084800             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   000845      1  084900             MOVE    20    TO CORRECT-N                           NC2514.2 179
   000846      1  085000             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000847      1  085100             PERFORM FAIL                                         NC2514.2 304
   000848      1  085200             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000849         085300     ELSE                                                         NC2514.2
   000850      1  085400             PERFORM PASS                                         NC2514.2 303
   000851      1  085500             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000852         085600*                                                                 NC2514.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853         085700 DIV-INIT-F5-13.                                                  NC2514.2
   000854         085800     MOVE   "VI-82 6.11.4 GR8" TO ANSI-REFERENCE.                 NC2514.2 209
   000855         085900     MOVE   "DIV-TEST-F5-13-0"  TO PAR-NAME.                      NC2514.2 153
   000856         086000     MOVE    ZERO TO 25COUNT.                                     NC2514.2 IMP 94
   000857         086100     MOVE    ZERO TO 25ANS.                                       NC2514.2 IMP 95
   000858         086200     MOVE    ZERO TO 25REM.                                       NC2514.2 IMP 96
   000859         086300     MOVE    1    TO REC-CT.                                      NC2514.2 200
   000860         086400 DIV-TEST-F5-13-0.                                                NC2514.2
   000861         086500     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000862         086600             ON SIZE ERROR                                        NC2514.2
   000863      1  086700             PERFORM PASS                                         NC2514.2 303
   000864      1  086800             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000865      1  086900             GO TO   DIV-TEST-F5-13-1                             NC2514.2 876
   000866         087000         NOT ON SIZE ERROR                                        NC2514.2
   000867      1  087100             MOVE   "NOT ON SIZE ERROR SHOULD NOT HAVE EXECUTED"  NC2514.2
   000868      1  087200                  TO RE-MARK                                      NC2514.2 158
   000869      1  087300             PERFORM FAIL                                         NC2514.2 304
   000870      1  087400             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000871      1  087500             GO TO   DIV-TEST-F5-13-1.                            NC2514.2 876
   000872         087600 DIV-DELETE-F5-13.                                                NC2514.2
   000873         087700     PERFORM DE-LETE.                                             NC2514.2 305
   000874         087800     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000875         087900     GO TO   DIV-INIT-F5-14.                                      NC2514.2 901
   000876         088000 DIV-TEST-F5-13-1.                                                NC2514.2
   000877         088100     MOVE   "DIV-TEST-F5-13-1" TO PAR-NAME.                       NC2514.2 153
   000878         088200     ADD     1 TO REC-CT.                                         NC2514.2 200
   000879         088300     IF      25ANS NOT = 0                                        NC2514.2 95
   000880      1  088400             MOVE    0 TO CORRECT-N                               NC2514.2 179
   000881      1  088500             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000882      1  088600             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000883      1  088700             PERFORM FAIL                                         NC2514.2 304
   000884      1  088800             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000885         088900     ELSE                                                         NC2514.2
   000886      1  089000             PERFORM PASS                                         NC2514.2 303
   000887      1  089100             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000888         089200 DIV-TEST-F5-13-2.                                                NC2514.2
   000889         089300     MOVE   "DIV-TEST-F5-13-2" TO PAR-NAME.                       NC2514.2 153
   000890         089400     ADD     1 TO REC-CT.                                         NC2514.2 200
   000891         089500     IF      25REM NOT = ZERO                                     NC2514.2 96 IMP
   000892      1  089600             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   000893      1  089700             MOVE    ZERO  TO CORRECT-N                           NC2514.2 IMP 179
   000894      1  089800             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000895      1  089900             PERFORM FAIL                                         NC2514.2 304
   000896      1  090000             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000897         090100     ELSE                                                         NC2514.2
   000898      1  090200             PERFORM PASS                                         NC2514.2 303
   000899      1  090300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000900         090400*                                                                 NC2514.2
   000901         090500 DIV-INIT-F5-14.                                                  NC2514.2
   000902         090600     MOVE   "VI-82 6.11.4 GR9" TO ANSI-REFERENCE.                 NC2514.2 209
   000903         090700     MOVE   "DIV-TEST-F5-14-0" TO PAR-NAME.                       NC2514.2 153
   000904         090800     MOVE    40    TO 25COUNT.                                    NC2514.2 94
   000905         090900     MOVE    ZERO  TO 25ANS.                                      NC2514.2 IMP 95
   000906         091000     MOVE    ZERO  TO 25REM.                                      NC2514.2 IMP 96
   000907         091100     MOVE    1     TO REC-CT.                                     NC2514.2 200
   000908         091200     MOVE    SPACE TO WRK-XN-00001-1.                             NC2514.2 IMP 42
   000909         091300     MOVE    SPACE TO WRK-XN-00001-2.                             NC2514.2 IMP 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400 DIV-TEST-F5-14-0.                                                NC2514.2
   000911         091500     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000912         091600             ON SIZE ERROR                                        NC2514.2
   000913      1  091700             MOVE   "A" TO WRK-XN-00001-1                         NC2514.2 42
   000914         091800     END-DIVIDE                                                   NC2514.2
   000915         091900     MOVE   "B" TO WRK-XN-00001-2.                                NC2514.2 43
   000916         092000     GO TO   DIV-TEST-F5-14-1.                                    NC2514.2 921
   000917         092100 DIV-DELETE-F5-14.                                                NC2514.2
   000918         092200     PERFORM DE-LETE.                                             NC2514.2 305
   000919         092300     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000920         092400     GO TO   DIV-INIT-F5-15.                                      NC2514.2 971
   000921         092500 DIV-TEST-F5-14-1.                                                NC2514.2
   000922         092600     MOVE   "DIV-TEST-F5-14-1" TO PAR-NAME.                       NC2514.2 153
   000923         092700     ADD     1 TO REC-CT.                                         NC2514.2 200
   000924         092800     IF      25ANS NOT = 2                                        NC2514.2 95
   000925      1  092900             MOVE    2 TO CORRECT-N                               NC2514.2 179
   000926      1  093000             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000927      1  093100             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000928      1  093200             PERFORM FAIL                                         NC2514.2 304
   000929      1  093300             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000930         093400     ELSE                                                         NC2514.2
   000931      1  093500             PERFORM PASS                                         NC2514.2 303
   000932      1  093600             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000933         093700 DIV-TEST-F5-14-2.                                                NC2514.2
   000934         093800     MOVE   "DIV-TEST-F5-14-2" TO PAR-NAME.                       NC2514.2 153
   000935         093900     ADD     1 TO REC-CT.                                         NC2514.2 200
   000936         094000     IF      25REM NOT = 20                                       NC2514.2 96
   000937      1  094100             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   000938      1  094200             MOVE    20    TO CORRECT-N                           NC2514.2 179
   000939      1  094300             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   000940      1  094400             PERFORM FAIL                                         NC2514.2 304
   000941      1  094500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000942         094600     ELSE                                                         NC2514.2
   000943      1  094700             PERFORM PASS                                         NC2514.2 303
   000944      1  094800             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000945         094900 DIV-TEST-F5-14-3.                                                NC2514.2
   000946         095000     MOVE   "DIV-TEST-F5-14-3" TO PAR-NAME.                       NC2514.2 153
   000947         095100     ADD     1 TO REC-CT.                                         NC2514.2 200
   000948         095200     IF      WRK-XN-00001-1 = SPACE                               NC2514.2 42 IMP
   000949      1  095300             PERFORM PASS                                         NC2514.2 303
   000950      1  095400             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000951         095500     ELSE                                                         NC2514.2
   000952      1  095600             MOVE   "ON SIZE ERROR SHOULD NOT HAVE EXECUTED"      NC2514.2
   000953      1  095700                  TO RE-MARK                                      NC2514.2 158
   000954      1  095800             MOVE    SPACE TO CORRECT-A                           NC2514.2 IMP 178
   000955      1  095900             MOVE    WRK-XN-00001-1 TO COMPUTED-A                 NC2514.2 42 164
   000956      1  096000             PERFORM FAIL                                         NC2514.2 304
   000957      1  096100             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000958         096200 DIV-TEST-F5-14-4.                                                NC2514.2
   000959         096300     MOVE   "DIV-TEST-F5-14-4" TO PAR-NAME.                       NC2514.2 153
   000960         096400     ADD     1 TO REC-CT.                                         NC2514.2 200
   000961         096500     IF      WRK-XN-00001-2 = "B"                                 NC2514.2 43
   000962      1  096600             PERFORM PASS                                         NC2514.2 303
   000963      1  096700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   000964         096800     ELSE                                                         NC2514.2
   000965      1  096900             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2514.2 158
   000966      1  097000             MOVE   "B" TO CORRECT-A                              NC2514.2 178
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097100             MOVE    WRK-XN-00001-2 TO COMPUTED-A                 NC2514.2 43 164
   000968      1  097200             PERFORM FAIL                                         NC2514.2 304
   000969      1  097300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   000970         097400*                                                                 NC2514.2
   000971         097500 DIV-INIT-F5-15.                                                  NC2514.2
   000972         097600     MOVE   "VI-82 6.11.4 GR9" TO ANSI-REFERENCE.                 NC2514.2 209
   000973         097700     MOVE   "DIV-TEST-F5-15-0"  TO PAR-NAME.                      NC2514.2 153
   000974         097800     MOVE    ZERO  TO 25COUNT.                                    NC2514.2 IMP 94
   000975         097900     MOVE    ZERO  TO 25ANS.                                      NC2514.2 IMP 95
   000976         098000     MOVE    ZERO  TO 25REM.                                      NC2514.2 IMP 96
   000977         098100     MOVE    SPACE TO WRK-XN-00001-1.                             NC2514.2 IMP 42
   000978         098200     MOVE    SPACE TO WRK-XN-00001-2.                             NC2514.2 IMP 43
   000979         098300     MOVE    1     TO REC-CT.                                     NC2514.2 200
   000980         098400 DIV-TEST-F5-15-0.                                                NC2514.2
   000981         098500     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   000982         098600             ON SIZE ERROR                                        NC2514.2
   000983      1  098700             MOVE   "A" TO WRK-XN-00001-1                         NC2514.2 42
   000984         098800     END-DIVIDE                                                   NC2514.2
   000985         098900     MOVE   "B" TO WRK-XN-00001-2.                                NC2514.2 43
   000986         099000     GO TO   DIV-TEST-F5-15-1.                                    NC2514.2 991
   000987         099100 DIV-DELETE-F5-15.                                                NC2514.2
   000988         099200     PERFORM DE-LETE.                                             NC2514.2 305
   000989         099300     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   000990         099400     GO TO   DIV-INIT-F5-16.                                      NC2514.2 1041
   000991         099500 DIV-TEST-F5-15-1.                                                NC2514.2
   000992         099600     MOVE   "DIV-TEST-F5-15-1" TO PAR-NAME.                       NC2514.2 153
   000993         099700     ADD     1 TO REC-CT.                                         NC2514.2 200
   000994         099800     IF      25ANS NOT = 0                                        NC2514.2 95
   000995      1  099900             MOVE    0 TO CORRECT-N                               NC2514.2 179
   000996      1  100000             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   000997      1  100100             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   000998      1  100200             PERFORM FAIL                                         NC2514.2 304
   000999      1  100300             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001000         100400     ELSE                                                         NC2514.2
   001001      1  100500             PERFORM PASS                                         NC2514.2 303
   001002      1  100600             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001003         100700 DIV-TEST-F5-15-2.                                                NC2514.2
   001004         100800     MOVE   "DIV-TEST-F5-15-2" TO PAR-NAME.                       NC2514.2 153
   001005         100900     ADD     1 TO REC-CT.                                         NC2514.2 200
   001006         101000     IF      25REM NOT = ZERO                                     NC2514.2 96 IMP
   001007      1  101100             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   001008      1  101200             MOVE    ZERO  TO CORRECT-N                           NC2514.2 IMP 179
   001009      1  101300             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   001010      1  101400             PERFORM FAIL                                         NC2514.2 304
   001011      1  101500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001012         101600     ELSE                                                         NC2514.2
   001013      1  101700             PERFORM PASS                                         NC2514.2 303
   001014      1  101800             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001015         101900 DIV-TEST-F5-15-3.                                                NC2514.2
   001016         102000     MOVE   "DIV-TEST-F5-15-3" TO PAR-NAME.                       NC2514.2 153
   001017         102100     ADD     1 TO REC-CT.                                         NC2514.2 200
   001018         102200     IF      WRK-XN-00001-1 = "A"                                 NC2514.2 42
   001019      1  102300             PERFORM PASS                                         NC2514.2 303
   001020      1  102400             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001021         102500     ELSE                                                         NC2514.2
   001022      1  102600             MOVE   "ON SIZE ERROR SHOULD HAVE EXECUTED"          NC2514.2
   001023      1  102700                  TO RE-MARK                                      NC2514.2 158
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102800             MOVE   "A" TO CORRECT-A                              NC2514.2 178
   001025      1  102900             MOVE    WRK-XN-00001-1 TO COMPUTED-A                 NC2514.2 42 164
   001026      1  103000             PERFORM FAIL                                         NC2514.2 304
   001027      1  103100             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001028         103200 DIV-TEST-F5-15-4.                                                NC2514.2
   001029         103300     MOVE   "DIV-TEST-F5-15-4" TO PAR-NAME.                       NC2514.2 153
   001030         103400     ADD     1 TO REC-CT.                                         NC2514.2 200
   001031         103500     IF      WRK-XN-00001-2 = "B"                                 NC2514.2 43
   001032      1  103600             PERFORM PASS                                         NC2514.2 303
   001033      1  103700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001034         103800     ELSE                                                         NC2514.2
   001035      1  103900             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2514.2 158
   001036      1  104000             MOVE    SPACE TO CORRECT-A                           NC2514.2 IMP 178
   001037      1  104100             MOVE    WRK-XN-00001-1 TO COMPUTED-A                 NC2514.2 42 164
   001038      1  104200             PERFORM FAIL                                         NC2514.2 304
   001039      1  104300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001040         104400*                                                                 NC2514.2
   001041         104500 DIV-INIT-F5-16.                                                  NC2514.2
   001042         104600     MOVE   "VI-82 6.11.4 GR9" TO ANSI-REFERENCE.                 NC2514.2 209
   001043         104700     MOVE   "DIV-TEST-F5-16-0" TO PAR-NAME.                       NC2514.2 153
   001044         104800     MOVE    40    TO 25COUNT.                                    NC2514.2 94
   001045         104900     MOVE    ZERO  TO 25ANS.                                      NC2514.2 IMP 95
   001046         105000     MOVE    ZERO  TO 25REM.                                      NC2514.2 IMP 96
   001047         105100     MOVE    1     TO REC-CT.                                     NC2514.2 200
   001048         105200     MOVE    SPACE TO WRK-XN-00001-1.                             NC2514.2 IMP 42
   001049         105300     MOVE    SPACE TO WRK-XN-00001-2.                             NC2514.2 IMP 43
   001050         105400 DIV-TEST-F5-16-0.                                                NC2514.2
   001051         105500     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   001052         105600         NOT ON SIZE ERROR                                        NC2514.2
   001053      1  105700             MOVE   "A" TO WRK-XN-00001-1                         NC2514.2 42
   001054         105800     END-DIVIDE                                                   NC2514.2
   001055         105900     MOVE   "B" TO WRK-XN-00001-2.                                NC2514.2 43
   001056         106000     GO TO   DIV-TEST-F5-16-1.                                    NC2514.2 1061
   001057         106100 DIV-DELETE-F5-16.                                                NC2514.2
   001058         106200     PERFORM DE-LETE.                                             NC2514.2 305
   001059         106300     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001060         106400     GO TO   DIV-INIT-F5-17.                                      NC2514.2 1111
   001061         106500 DIV-TEST-F5-16-1.                                                NC2514.2
   001062         106600     MOVE   "DIV-TEST-F5-16-1" TO PAR-NAME.                       NC2514.2 153
   001063         106700     ADD     1 TO REC-CT.                                         NC2514.2 200
   001064         106800     IF      25ANS NOT = 2                                        NC2514.2 95
   001065      1  106900             MOVE    2 TO CORRECT-N                               NC2514.2 179
   001066      1  107000             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   001067      1  107100             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   001068      1  107200             PERFORM FAIL                                         NC2514.2 304
   001069      1  107300             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001070         107400     ELSE                                                         NC2514.2
   001071      1  107500             PERFORM PASS                                         NC2514.2 303
   001072      1  107600             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001073         107700 DIV-TEST-F5-16-2.                                                NC2514.2
   001074         107800     MOVE   "DIV-TEST-F5-16-2" TO PAR-NAME.                       NC2514.2 153
   001075         107900     ADD     1 TO REC-CT.                                         NC2514.2 200
   001076         108000     IF      25REM NOT = 20                                       NC2514.2 96
   001077      1  108100             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   001078      1  108200             MOVE    20    TO CORRECT-N                           NC2514.2 179
   001079      1  108300             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   001080      1  108400             PERFORM FAIL                                         NC2514.2 304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081      1  108500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001082         108600     ELSE                                                         NC2514.2
   001083      1  108700             PERFORM PASS                                         NC2514.2 303
   001084      1  108800             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001085         108900 DIV-TEST-F5-16-3.                                                NC2514.2
   001086         109000     MOVE   "DIV-TEST-F5-16-3" TO PAR-NAME.                       NC2514.2 153
   001087         109100     ADD     1 TO REC-CT.                                         NC2514.2 200
   001088         109200     IF      WRK-XN-00001-1 = "A"                                 NC2514.2 42
   001089      1  109300             PERFORM PASS                                         NC2514.2 303
   001090      1  109400             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001091         109500     ELSE                                                         NC2514.2
   001092      1  109600             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC2514.2
   001093      1  109700                  TO RE-MARK                                      NC2514.2 158
   001094      1  109800             MOVE   "A" TO CORRECT-A                              NC2514.2 178
   001095      1  109900             MOVE    WRK-XN-00001-1 TO COMPUTED-A                 NC2514.2 42 164
   001096      1  110000             PERFORM FAIL                                         NC2514.2 304
   001097      1  110100             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001098         110200 DIV-TEST-F5-16-4.                                                NC2514.2
   001099         110300     MOVE   "DIV-TEST-F5-16-4" TO PAR-NAME.                       NC2514.2 153
   001100         110400     ADD     1 TO REC-CT.                                         NC2514.2 200
   001101         110500     IF      WRK-XN-00001-2 = "B"                                 NC2514.2 43
   001102      1  110600             PERFORM PASS                                         NC2514.2 303
   001103      1  110700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001104         110800     ELSE                                                         NC2514.2
   001105      1  110900             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2514.2 158
   001106      1  111000             MOVE   "B" TO CORRECT-A                              NC2514.2 178
   001107      1  111100             MOVE    WRK-XN-00001-2 TO COMPUTED-A                 NC2514.2 43 164
   001108      1  111200             PERFORM FAIL                                         NC2514.2 304
   001109      1  111300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001110         111400*                                                                 NC2514.2
   001111         111500 DIV-INIT-F5-17.                                                  NC2514.2
   001112         111600     MOVE   "VI-82 6.11.4 GR9" TO ANSI-REFERENCE.                 NC2514.2 209
   001113         111700     MOVE   "DIV-TEST-F5-17-0"  TO PAR-NAME.                      NC2514.2 153
   001114         111800     MOVE    ZERO  TO 25COUNT.                                    NC2514.2 IMP 94
   001115         111900     MOVE    ZERO  TO 25ANS.                                      NC2514.2 IMP 95
   001116         112000     MOVE    ZERO  TO 25REM.                                      NC2514.2 IMP 96
   001117         112100     MOVE    SPACE TO WRK-XN-00001-1.                             NC2514.2 IMP 42
   001118         112200     MOVE    SPACE TO WRK-XN-00001-2.                             NC2514.2 IMP 43
   001119         112300     MOVE    1     TO REC-CT.                                     NC2514.2 200
   001120         112400 DIV-TEST-F5-17-0.                                                NC2514.2
   001121         112500     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   001122         112600         NOT ON SIZE ERROR                                        NC2514.2
   001123      1  112700             MOVE   "A" TO WRK-XN-00001-1                         NC2514.2 42
   001124         112800     END-DIVIDE                                                   NC2514.2
   001125         112900     MOVE   "B" TO WRK-XN-00001-2.                                NC2514.2 43
   001126         113000     GO TO   DIV-TEST-F5-17-1.                                    NC2514.2 1131
   001127         113100 DIV-DELETE-F5-17.                                                NC2514.2
   001128         113200     PERFORM DE-LETE.                                             NC2514.2 305
   001129         113300     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001130         113400     GO TO   DIV-INIT-F5-18.                                      NC2514.2 1181
   001131         113500 DIV-TEST-F5-17-1.                                                NC2514.2
   001132         113600     MOVE   "DIV-TEST-F5-17-1" TO PAR-NAME.                       NC2514.2 153
   001133         113700     ADD     1 TO REC-CT.                                         NC2514.2 200
   001134         113800     IF      25ANS NOT = 0                                        NC2514.2 95
   001135      1  113900             MOVE    0 TO CORRECT-N                               NC2514.2 179
   001136      1  114000             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   001137      1  114100             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114200             PERFORM FAIL                                         NC2514.2 304
   001139      1  114300             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001140         114400     ELSE                                                         NC2514.2
   001141      1  114500             PERFORM PASS                                         NC2514.2 303
   001142      1  114600             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001143         114700 DIV-TEST-F5-17-2.                                                NC2514.2
   001144         114800     MOVE   "DIV-TEST-F5-17-2" TO PAR-NAME.                       NC2514.2 153
   001145         114900     ADD     1 TO REC-CT.                                         NC2514.2 200
   001146         115000     IF      25REM NOT = ZERO                                     NC2514.2 96 IMP
   001147      1  115100             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   001148      1  115200             MOVE    ZERO  TO CORRECT-N                           NC2514.2 IMP 179
   001149      1  115300             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   001150      1  115400             PERFORM FAIL                                         NC2514.2 304
   001151      1  115500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001152         115600     ELSE                                                         NC2514.2
   001153      1  115700             PERFORM PASS                                         NC2514.2 303
   001154      1  115800             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001155         115900 DIV-TEST-F5-17-3.                                                NC2514.2
   001156         116000     MOVE   "DIV-TEST-F5-17-3" TO PAR-NAME.                       NC2514.2 153
   001157         116100     ADD     1 TO REC-CT.                                         NC2514.2 200
   001158         116200     IF      WRK-XN-00001-1 = SPACE                               NC2514.2 42 IMP
   001159      1  116300             PERFORM PASS                                         NC2514.2 303
   001160      1  116400             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001161         116500     ELSE                                                         NC2514.2
   001162      1  116600             MOVE   "NOT ON SIZE ERROR SHOULD NOT HAVE EXECUTED"  NC2514.2
   001163      1  116700                  TO RE-MARK                                      NC2514.2 158
   001164      1  116800             MOVE    SPACE TO CORRECT-A                           NC2514.2 IMP 178
   001165      1  116900             MOVE    WRK-XN-00001-1 TO COMPUTED-A                 NC2514.2 42 164
   001166      1  117000             PERFORM FAIL                                         NC2514.2 304
   001167      1  117100             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001168         117200 DIV-TEST-F5-17-4.                                                NC2514.2
   001169         117300     MOVE   "DIV-TEST-F5-17-4" TO PAR-NAME.                       NC2514.2 153
   001170         117400     ADD     1 TO REC-CT.                                         NC2514.2 200
   001171         117500     IF      WRK-XN-00001-2 = "B"                                 NC2514.2 43
   001172      1  117600             PERFORM PASS                                         NC2514.2 303
   001173      1  117700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001174         117800     ELSE                                                         NC2514.2
   001175      1  117900             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2514.2 158
   001176      1  118000             MOVE   "B" TO CORRECT-A                              NC2514.2 178
   001177      1  118100             MOVE    WRK-XN-00001-2 TO COMPUTED-A                 NC2514.2 43 164
   001178      1  118200             PERFORM FAIL                                         NC2514.2 304
   001179      1  118300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001180         118400*                                                                 NC2514.2
   001181         118500 DIV-INIT-F5-18.                                                  NC2514.2
   001182         118600     MOVE   "VI-82 6.11.4 GR8" TO ANSI-REFERENCE.                 NC2514.2 209
   001183         118700     MOVE   "DIV-TEST-F5-18-0" TO PAR-NAME.                       NC2514.2 153
   001184         118800     MOVE    40   TO 25COUNT.                                     NC2514.2 94
   001185         118900     MOVE    ZERO  TO 25ANS.                                      NC2514.2 IMP 95
   001186         119000     MOVE    ZERO  TO 25REM.                                      NC2514.2 IMP 96
   001187         119100     MOVE    1     TO REC-CT.                                     NC2514.2 200
   001188         119200     MOVE    SPACE TO WRK-XN-00001-1.                             NC2514.2 IMP 42
   001189         119300     MOVE    SPACE TO WRK-XN-00001-2.                             NC2514.2 IMP 43
   001190         119400 DIV-TEST-F5-18-0.                                                NC2514.2
   001191         119500     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   001192         119600             ON SIZE ERROR                                        NC2514.2
   001193      1  119700             MOVE   "A" TO WRK-XN-00001-1                         NC2514.2 42
   001194         119800         NOT ON SIZE ERROR                                        NC2514.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195      1  119900             MOVE   "B" TO WRK-XN-00001-1                         NC2514.2 42
   001196         120000     END-DIVIDE                                                   NC2514.2
   001197         120100     MOVE   "C" TO WRK-XN-00001-2.                                NC2514.2 43
   001198         120200     GO TO   DIV-TEST-F5-18-1.                                    NC2514.2 1203
   001199         120300 DIV-DELETE-F5-18.                                                NC2514.2
   001200         120400     PERFORM DE-LETE.                                             NC2514.2 305
   001201         120500     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001202         120600     GO TO   DIV-INIT-F5-19.                                      NC2514.2 1253
   001203         120700 DIV-TEST-F5-18-1.                                                NC2514.2
   001204         120800     MOVE   "DIV-TEST-F5-18-1" TO PAR-NAME.                       NC2514.2 153
   001205         120900     ADD     1 TO REC-CT.                                         NC2514.2 200
   001206         121000     IF      25ANS NOT = 2                                        NC2514.2 95
   001207      1  121100             MOVE    2 TO CORRECT-N                               NC2514.2 179
   001208      1  121200             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   001209      1  121300             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   001210      1  121400             PERFORM FAIL                                         NC2514.2 304
   001211      1  121500             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001212         121600     ELSE                                                         NC2514.2
   001213      1  121700             PERFORM PASS                                         NC2514.2 303
   001214      1  121800             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001215         121900 DIV-TEST-F5-18-2.                                                NC2514.2
   001216         122000     MOVE   "DIV-TEST-F5-18-2" TO PAR-NAME.                       NC2514.2 153
   001217         122100     ADD     1 TO REC-CT.                                         NC2514.2 200
   001218         122200     IF      25REM NOT = 20                                       NC2514.2 96
   001219      1  122300             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   001220      1  122400             MOVE    20    TO CORRECT-N                           NC2514.2 179
   001221      1  122500             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   001222      1  122600             PERFORM FAIL                                         NC2514.2 304
   001223      1  122700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001224         122800     ELSE                                                         NC2514.2
   001225      1  122900             PERFORM PASS                                         NC2514.2 303
   001226      1  123000             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001227         123100 DIV-TEST-F5-18-3.                                                NC2514.2
   001228         123200     MOVE   "DIV-TEST-F5-18-3" TO PAR-NAME.                       NC2514.2 153
   001229         123300     ADD     1 TO REC-CT.                                         NC2514.2 200
   001230         123400     IF      WRK-XN-00001-1 = "B"                                 NC2514.2 42
   001231      1  123500             PERFORM PASS                                         NC2514.2 303
   001232      1  123600             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001233         123700     ELSE                                                         NC2514.2
   001234      1  123800             MOVE   "NOT ON SIZE ERROR SHOULD HAVE EXECUTED"      NC2514.2
   001235      1  123900                  TO RE-MARK                                      NC2514.2 158
   001236      1  124000             MOVE   "B" TO CORRECT-A                              NC2514.2 178
   001237      1  124100             MOVE    WRK-XN-00001-1 TO COMPUTED-A                 NC2514.2 42 164
   001238      1  124200             PERFORM FAIL                                         NC2514.2 304
   001239      1  124300             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001240         124400 DIV-TEST-F5-18-4.                                                NC2514.2
   001241         124500     MOVE   "DIV-TEST-F5-18-4" TO PAR-NAME.                       NC2514.2 153
   001242         124600     ADD     1 TO REC-CT.                                         NC2514.2 200
   001243         124700     IF      WRK-XN-00001-2 = "C"                                 NC2514.2 43
   001244      1  124800             PERFORM PASS                                         NC2514.2 303
   001245      1  124900             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001246         125000     ELSE                                                         NC2514.2
   001247      1  125100             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2514.2 158
   001248      1  125200             MOVE   "C"    TO CORRECT-A                           NC2514.2 178
   001249      1  125300             MOVE    WRK-XN-00001-2 TO COMPUTED-A                 NC2514.2 43 164
   001250      1  125400             PERFORM FAIL                                         NC2514.2 304
   001251      1  125500             PERFORM PRINT-DETAIL.                                NC2514.2 307
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125600*                                                                 NC2514.2
   001253         125700 DIV-INIT-F5-19.                                                  NC2514.2
   001254         125800     MOVE   "VI-82 6.11.4 GR8" TO ANSI-REFERENCE.                 NC2514.2 209
   001255         125900     MOVE   "DIV-TEST-F5-19-0"  TO PAR-NAME.                      NC2514.2 153
   001256         126000     MOVE    ZERO  TO 25COUNT.                                    NC2514.2 IMP 94
   001257         126100     MOVE    ZERO  TO 25ANS.                                      NC2514.2 IMP 95
   001258         126200     MOVE    ZERO  TO 25REM.                                      NC2514.2 IMP 96
   001259         126300     MOVE    1     TO REC-CT.                                     NC2514.2 200
   001260         126400     MOVE    SPACE TO WRK-XN-00001-1.                             NC2514.2 IMP 42
   001261         126500     MOVE    SPACE TO WRK-XN-00001-2.                             NC2514.2 IMP 43
   001262         126600 DIV-TEST-F5-19-0.                                                NC2514.2
   001263         126700     DIVIDE  100 BY 25COUNT GIVING 25ANS REMAINDER 25REM          NC2514.2 94 95 96
   001264         126800             ON SIZE ERROR                                        NC2514.2
   001265      1  126900             MOVE   "A" TO WRK-XN-00001-1                         NC2514.2 42
   001266         127000         NOT ON SIZE ERROR                                        NC2514.2
   001267      1  127100             MOVE   "B" TO WRK-XN-00001-1                         NC2514.2 42
   001268         127200     END-DIVIDE                                                   NC2514.2
   001269         127300     MOVE   "C" TO WRK-XN-00001-2.                                NC2514.2 43
   001270         127400     GO TO   DIV-TEST-F5-19-1.                                    NC2514.2 1275
   001271         127500 DIV-DELETE-F5-19.                                                NC2514.2
   001272         127600     PERFORM DE-LETE.                                             NC2514.2 305
   001273         127700     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001274         127800     GO TO   DIV-INIT-F5-20.                                      NC2514.2 1325
   001275         127900 DIV-TEST-F5-19-1.                                                NC2514.2
   001276         128000     MOVE   "DIV-TEST-F5-19-1" TO PAR-NAME.                       NC2514.2 153
   001277         128100     ADD     1 TO REC-CT.                                         NC2514.2 200
   001278         128200     IF      25ANS NOT = 0                                        NC2514.2 95
   001279      1  128300             MOVE    0 TO CORRECT-N                               NC2514.2 179
   001280      1  128400             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   001281      1  128500             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   001282      1  128600             PERFORM FAIL                                         NC2514.2 304
   001283      1  128700             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001284         128800     ELSE                                                         NC2514.2
   001285      1  128900             PERFORM PASS                                         NC2514.2 303
   001286      1  129000             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001287         129100 DIV-TEST-F5-19-2.                                                NC2514.2
   001288         129200     MOVE   "DIV-TEST-F5-19-2" TO PAR-NAME.                       NC2514.2 153
   001289         129300     ADD     1 TO REC-CT.                                         NC2514.2 200
   001290         129400     IF      25REM NOT = ZERO                                     NC2514.2 96 IMP
   001291      1  129500             MOVE    25REM TO COMPUTED-N                          NC2514.2 96 165
   001292      1  129600             MOVE    ZERO  TO CORRECT-N                           NC2514.2 IMP 179
   001293      1  129700             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   001294      1  129800             PERFORM FAIL                                         NC2514.2 304
   001295      1  129900             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001296         130000     ELSE                                                         NC2514.2
   001297      1  130100             PERFORM PASS                                         NC2514.2 303
   001298      1  130200             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001299         130300 DIV-TEST-F5-19-3.                                                NC2514.2
   001300         130400     MOVE   "DIV-TEST-F5-19-3" TO PAR-NAME.                       NC2514.2 153
   001301         130500     ADD     1 TO REC-CT.                                         NC2514.2 200
   001302         130600     IF      WRK-XN-00001-1 = "A"                                 NC2514.2 42
   001303      1  130700             PERFORM PASS                                         NC2514.2 303
   001304      1  130800             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001305         130900     ELSE                                                         NC2514.2
   001306      1  131000             MOVE   "ON SIZE ERROR SHOULD HAVE EXECUTED"          NC2514.2
   001307      1  131100                  TO RE-MARK                                      NC2514.2 158
   001308      1  131200             MOVE   "A" TO CORRECT-A                              NC2514.2 178
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309      1  131300             MOVE    WRK-XN-00001-1 TO COMPUTED-A                 NC2514.2 42 164
   001310      1  131400             PERFORM FAIL                                         NC2514.2 304
   001311      1  131500             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001312         131600 DIV-TEST-F5-19-4.                                                NC2514.2
   001313         131700     MOVE   "DIV-TEST-F5-19-4" TO PAR-NAME.                       NC2514.2 153
   001314         131800     ADD     1 TO REC-CT.                                         NC2514.2 200
   001315         131900     IF      WRK-XN-00001-2 = "C"                                 NC2514.2 43
   001316      1  132000             PERFORM PASS                                         NC2514.2 303
   001317      1  132100             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001318         132200     ELSE                                                         NC2514.2
   001319      1  132300             MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK         NC2514.2 158
   001320      1  132400             MOVE   "C"    TO CORRECT-A                           NC2514.2 178
   001321      1  132500             MOVE    WRK-XN-00001-2 TO COMPUTED-A                 NC2514.2 43 164
   001322      1  132600             PERFORM FAIL                                         NC2514.2 304
   001323      1  132700             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001324         132800*                                                                 NC2514.2
   001325         132900 DIV-INIT-F5-20.                                                  NC2514.2
   001326         133000     MOVE   "VI-82 6.11.4 GR4" TO ANSI-REFERENCE.                 NC2514.2 209
   001327         133100     MOVE   "DIV-TEST-F5-20-0"  TO PAR-NAME.                      NC2514.2 153
   001328         133200     MOVE ZERO TO 25ANS.                                          NC2514.2 IMP 95
   001329         133300     MOVE ZERO TO 25REM.                                          NC2514.2 IMP 96
   001330         133400     MOVE ZERO TO WS-REMAINDERS.                                  NC2514.2 IMP 40
   001331         133500     MOVE 6    TO 25COUNT.                                        NC2514.2 94
   001332         133600     MOVE 1    TO REC-CT.                                         NC2514.2 200
   001333         133700 DIV-TEST-F5-20-0.                                                NC2514.2
   001334         133800     DIVIDE  100 BY 25COUNT GIVING 25ANS                          NC2514.2 94 95
   001335         133900             REMAINDER WS-REM (25ANS)                             NC2514.2 41 95
   001336         134000             ON SIZE ERROR                                        NC2514.2
   001337      1  134100             MOVE   "SIZE ERROR SHOULD NOT HAVE OCCURED"          NC2514.2
   001338      1  134200                  TO RE-MARK                                      NC2514.2 158
   001339      1  134300             PERFORM FAIL                                         NC2514.2 304
   001340      1  134400             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001341      1  134500             GO TO   DIV-TEST-F5-20-1.                            NC2514.2 1349
   001342         134600     PERFORM PASS.                                                NC2514.2 303
   001343         134700     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001344         134800     GO TO   DIV-TEST-F5-20-1.                                    NC2514.2 1349
   001345         134900 DIV-DELETE-F5-20.                                                NC2514.2
   001346         135000     PERFORM DE-LETE.                                             NC2514.2 305
   001347         135100     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001348         135200     GO TO   CCVS-EXIT.                                           NC2514.2 1411
   001349         135300 DIV-TEST-F5-20-1.                                                NC2514.2
   001350         135400     MOVE   "DIV-TEST-F5-20-1" TO PAR-NAME.                       NC2514.2 153
   001351         135500     ADD     1 TO REC-CT.                                         NC2514.2 200
   001352         135600     IF      25ANS NOT = 16                                       NC2514.2 95
   001353      1  135700             MOVE    16 TO CORRECT-N                              NC2514.2 179
   001354      1  135800             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   001355      1  135900             MOVE   "INVALID QUOTIENT" TO RE-MARK                 NC2514.2 158
   001356      1  136000             PERFORM FAIL                                         NC2514.2 304
   001357      1  136100             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001358         136200     ELSE                                                         NC2514.2
   001359      1  136300             PERFORM PASS                                         NC2514.2 303
   001360      1  136400             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001361         136500 DIV-TEST-F5-20-2.                                                NC2514.2
   001362         136600     MOVE   "DIV-TEST-F5-20-2" TO PAR-NAME.                       NC2514.2 153
   001363         136700     ADD     1 TO REC-CT.                                         NC2514.2 200
   001364         136800     IF      WS-REM (25ANS) NOT = 4                               NC2514.2 41 95
   001365      1  136900             MOVE    WS-REM (25ANS) TO COMPUTED-N                 NC2514.2 41 95 165
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366      1  137000             MOVE    4     TO CORRECT-N                           NC2514.2 179
   001367      1  137100             MOVE   "INVALID REMAINDER" TO RE-MARK                NC2514.2 158
   001368      1  137200             PERFORM FAIL                                         NC2514.2 304
   001369      1  137300             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001370      1  137400             ADD     1 TO REC-CT                                  NC2514.2 200
   001371      1  137500             MOVE    25ANS TO COMPUTED-N                          NC2514.2 95 165
   001372      1  137600             MOVE    16    TO CORRECT-N                           NC2514.2 179
   001373      1  137700             MOVE   "INVALID SUBSCRIPT FOR REMAINDER" TO RE-MARK  NC2514.2 158
   001374      1  137800             PERFORM FAIL                                         NC2514.2 304
   001375      1  137900             PERFORM PRINT-DETAIL                                 NC2514.2 307
   001376         138000     ELSE                                                         NC2514.2
   001377      1  138100             PERFORM PASS                                         NC2514.2 303
   001378      1  138200             PERFORM PRINT-DETAIL.                                NC2514.2 307
   001379         138300*                                                                 NC2514.2
   001380         138400 DIV-INIT-F5-21.                                                  NC2514.2
   001381         138500     MOVE "DIV-TEST-F5-21" TO PAR-NAME.                           NC2514.2 153
   001382         138600     MOVE 10.0 TO WRK-DU-2V1-1.                                   NC2514.2 55
   001383         138700     MOVE    ZERO TO REC-CT.                                      NC2514.2 IMP 200
   001384         138800 DIVIDE-REMAINDER-TEST-7.                                         NC2514.2
   001385         138900     DIVIDE WRK-DU-1V17-1 BY WRK-DU-2V1-1 GIVING WRK-DU-1V5-1     NC2514.2 37 55 38
   001386      1  139000     REMAINDER WRK-NE-1 ON SIZE ERROR GO TO DIV-FAIL-F5-21.       NC2514.2 39 1392
   001387         139100     GO TO DIV-TEST-F5-21-1.                                      NC2514.2 1396
   001388         139200 DIV-DELETE-F5-21.                                                NC2514.2
   001389         139300     PERFORM DE-LETE.                                             NC2514.2 305
   001390         139400     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001391         139500     GO TO CCVS-EXIT.                                             NC2514.2 1411
   001392         139600 DIV-FAIL-F5-21.                                                  NC2514.2
   001393         139700     PERFORM FAIL.                                                NC2514.2 304
   001394         139800     MOVE "SIZE ERROR BAD" TO RE-MARK.                            NC2514.2 158
   001395         139900     PERFORM PRINT-DETAIL.                                        NC2514.2 307
   001396         140000 DIV-TEST-F5-21-1.                                                NC2514.2
   001397         140100     MOVE "DIV-TEST-F5-21-1" TO ANSI-REFERENCE.                   NC2514.2 209
   001398         140200     MOVE 1 TO REC-CT.                                            NC2514.2 200
   001399         140300     IF WRK-DU-1V5-1 = 0.31415 PERFORM PASS PERFORM PRINT-DETAIL  NC2514.2 38 303 307
   001400         140400     ELSE                                                         NC2514.2
   001401      1  140500     PERFORM FAIL MOVE WRK-DU-1V5-1 TO COMPUTED-N MOVE 0.31415    NC2514.2 304 38 165
   001402      1  140600     TO CORRECT-N PERFORM PRINT-DETAIL.                           NC2514.2 179 307
   001403         140700     ADD 1 TO REC-CT.                                             NC2514.2 200
   001404         140800 DIV-TEST-F5-21-2.                                                NC2514.2
   001405         140900     MOVE "DIV-TEST-F5-21-2" TO ANSI-REFERENCE.                   NC2514.2 209
   001406         141000     IF WRK-NE-1 = ".0000/92653,58979,32"  PERFORM PASS           NC2514.2 39 303
   001407      1  141100     PERFORM PRINT-DETAIL ELSE                                    NC2514.2 307
   001408      1  141200     PERFORM FAIL MOVE WRK-NE-1 TO COMPUTED-A MOVE                NC2514.2 304 39 164
   001409      1  141300     ".0000/92653,58979,32"  TO CORRECT-A PERFORM PRINT-DETAIL.   NC2514.2 178 307
   001410         141400*                                                                 NC2514.2
   001411         141500 CCVS-EXIT SECTION.                                               NC2514.2
   001412         141600 CCVS-999999.                                                     NC2514.2
   001413         141700     GO TO CLOSE-FILES.                                           NC2514.2 296
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    28
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      145   ALPHA-LIT
      209   ANSI-REFERENCE . . . . . . . .  381 388 397 M437 M484 M530 M593 M633 M674 M713 M759 M806 M854 M902 M972 M1042
                                            M1112 M1182 M1254 M1326 M1397 M1405
       63   ATWO-DS-01V00
       64   AZERO-DS-05V05
       62   A02TWOS-DS-03V02
       61   A02TWOS-DU-02V00
       67   A05ONES-DS-05V00
       56   A18ONES-DS-18V00
       58   A18TWOS-DS-18V00
       53   A99-DS-02V00
      188   CCVS-C-1 . . . . . . . . . . .  325 367
      193   CCVS-C-2 . . . . . . . . . . .  326 368
      243   CCVS-E-1 . . . . . . . . . . .  331
      248   CCVS-E-2 . . . . . . . . . . .  340 347 354 359
      251   CCVS-E-2-2 . . . . . . . . . .  M339
      256   CCVS-E-3 . . . . . . . . . . .  360
      265   CCVS-E-4 . . . . . . . . . . .  339
      266   CCVS-E-4-1 . . . . . . . . . .  M337
      268   CCVS-E-4-2 . . . . . . . . . .  M338
      210   CCVS-H-1 . . . . . . . . . . .  320
      215   CCVS-H-2A. . . . . . . . . . .  321
      224   CCVS-H-2B. . . . . . . . . . .  322
      236   CCVS-H-3 . . . . . . . . . . .  323
      286   CCVS-PGM-ID. . . . . . . . . .  292 292
      170   CM-18V0
      164   COMPUTED-A . . . . . . . . . .  165 167 168 169 170 393 396 M955 M967 M1025 M1037 M1095 M1107 M1165 M1177 M1237
                                            M1249 M1309 M1321 M1408
      165   COMPUTED-N . . . . . . . . . .  M410 M427 M463 M474 M509 M520 M556 M567 M584 M612 M623 M652 M663 M692 M703 M738
                                            M749 M785 M796 M833 M844 M881 M892 M926 M937 M996 M1007 M1066 M1077 M1136 M1147
                                            M1208 M1219 M1280 M1291 M1354 M1365 M1371 M1401
      163   COMPUTED-X . . . . . . . . . .  M315 379
      167   COMPUTED-0V18
      169   COMPUTED-14V4
      171   COMPUTED-18V0
      168   COMPUTED-4V14
      187   COR-ANSI-REFERENCE . . . . . .  M388 M390
      178   CORRECT-A. . . . . . . . . . .  179 180 181 182 183 394 396 M411 M428 M954 M966 M1024 M1036 M1094 M1106 M1164
                                            M1176 M1236 M1248 M1308 M1320 M1409
      179   CORRECT-N. . . . . . . . . . .  M462 M475 M508 M521 M555 M568 M583 M611 M624 M651 M664 M691 M704 M737 M750 M784
                                            M797 M832 M845 M880 M893 M925 M938 M995 M1008 M1065 M1078 M1135 M1148 M1207 M1220
                                            M1279 M1292 M1353 M1366 M1372 M1402
      177   CORRECT-X. . . . . . . . . . .  M316 380
      180   CORRECT-0V18
      182   CORRECT-14V4
      184   CORRECT-18V0
      181   CORRECT-4V14
      183   CR-18V0
      138   CS-05V00-0003
       79   D-1
       80   D-7
      201   DELETE-COUNTER . . . . . . . .  M305 334 350 352
      109   DIV-ENTRIES
      101   DIV-Z1-30. . . . . . . . . . .  M677 M681 690 692
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    29
0 Defined   Cross-reference of data names   References

0     102   DIV-Z2-30. . . . . . . . . . .  M577 579
      103   DIV-Z3-30. . . . . . . . . . .  M596 M600 610 612
      104   DIV-Z4-30. . . . . . . . . . .  M636 M640 650 652
      105   DIV-30-A1. . . . . . . . . . .  M678 M681 702
      106   DIV-30-A2. . . . . . . . . . .  M578 579
      107   DIV-30-A3. . . . . . . . . . .  584 M597 M601 622 623
      108   DIV-30-A4. . . . . . . . . . .  M637 M641 662 663 703
       97   DIV-30-Y1. . . . . . . . . . .  M676 681
       98   DIV-30-Y2. . . . . . . . . . .  577
       99   DIV-30-Y3. . . . . . . . . . .  M595 600
      100   DIV-30-Y4. . . . . . . . . . .  M635 640
      110   DIV11
      111   DIV12
      112   DIV13
      113   DIV14
      114   DIV15. . . . . . . . . . . . .  405
      115   DIV16. . . . . . . . . . . . .  405
      116   DIV17. . . . . . . . . . . . .  M405
      117   DIV18. . . . . . . . . . . . .  M405 406 410
      118   DIV19. . . . . . . . . . . . .  421
      119   DIV20. . . . . . . . . . . . .  421
      120   DIV21. . . . . . . . . . . . .  M419 M421
      121   DIV22. . . . . . . . . . . . .  M420 M422 423 427
      156   DOTVALUE . . . . . . . . . . .  M310
      136   DS-02V00-0001
      137   DS-03V00-0002
      207   DUMMY-HOLD . . . . . . . . . .  M364 370
       35   DUMMY-RECORD . . . . . . . . .  M320 M321 M322 M323 M325 M326 M327 M329 M331 M340 M347 M354 M359 M360 364 M365
                                            366 M367 M368 M369 M370 374 M375 M383 M398
       88   EIGHT
      254   ENDER-DESC . . . . . . . . . .  M342 M353 M358
      202   ERROR-COUNTER. . . . . . . . .  M304 333 343 346
      206   ERROR-HOLD . . . . . . . . . .  M333 M334 M334 M335 338
      252   ERROR-TOTAL. . . . . . . . . .  M344 M346 M351 M352 M356 M357
      143   EVEN-NAME1
      149   FEATURE
       91   FIFTEEN
       85   FIVE
       84   FOUR
      130   GRP-0010
      280   HYPHEN-LINE. . . . . . . . . .  327 329 369
      246   ID-AGAIN . . . . . . . . . . .  M292
      279   INF-ANSI-REFERENCE . . . . . .  M381 M384 M397 M399
      274   INFO-TEXT. . . . . . . . . . .  M382
      203   INSPECT-COUNTER. . . . . . . .  M302 333 355 357
      140   MINUS-NAMES
      127   NE-0008
      128   NE-0009
      129   NE-04V01-0006
       89   NINE
       81   ONE
      151   P-OR-F . . . . . . . . . . . .  M302 M303 M304 M305 312 M315
      153   PAR-NAME . . . . . . . . . . .  M317 M416 M433 M438 M459 M471 M485 M505 M517 M531 M552 M564 M589 M594 M608 M620
                                            M634 M648 M660 M675 M688 M700 M714 M734 M746 M760 M781 M793 M807 M829 M841 M855
                                            M877 M889 M903 M922 M934 M946 M959 M973 M992 M1004 M1016 M1029 M1043 M1062 M1074
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    30
0 Defined   Cross-reference of data names   References

0                                           M1086 M1099 M1113 M1132 M1144 M1156 M1169 M1183 M1204 M1216 M1228 M1241 M1255
                                            M1276 M1288 M1300 M1313 M1327 M1350 M1362 M1381
      155   PARDOT-X . . . . . . . . . . .  M309
      204   PASS-COUNTER . . . . . . . . .  M303 335 337
      142   PLUS-NAME1
      144   PLUS-NAME2
       33   PRINT-FILE . . . . . . . . . .  29 291 297
       34   PRINT-REC. . . . . . . . . . .  M311 M387 M389
      158   RE-MARK. . . . . . . . . . . .  M306 M318 M447 M464 M476 M496 M510 M522 M540 M557 M569 M613 M625 M653 M665 M693
                                            M705 M725 M739 M751 M769 M786 M798 M816 M834 M846 M868 M882 M894 M927 M939 M953
                                            M965 M997 M1009 M1023 M1035 M1067 M1079 M1093 M1105 M1137 M1149 M1163 M1175 M1209
                                            M1221 M1235 M1247 M1281 M1293 M1307 M1319 M1338 M1355 M1367 M1373 M1394
      200   REC-CT . . . . . . . . . . . .  308 310 317 M442 M460 M472 M489 M506 M518 M535 M553 M565 M598 M609 M621 M638
                                            M649 M661 M679 M689 M701 M718 M735 M747 M764 M782 M794 M811 M830 M842 M859 M878
                                            M890 M907 M923 M935 M947 M960 M979 M993 M1005 M1017 M1030 M1047 M1063 M1075 M1087
                                            M1100 M1119 M1133 M1145 M1157 M1170 M1187 M1205 M1217 M1229 M1242 M1259 M1277
                                            M1289 M1301 M1314 M1332 M1351 M1363 M1370 M1383 M1398 M1403
      199   REC-SKL-SUB
      208   RECORD-COUNT . . . . . . . . .  M362 363 M371
       87   SEVEN
       86   SIX
      146   SNEG-LIT2
      139   TA--X
       90   TEN
      159   TEST-COMPUTED. . . . . . . . .  387
      174   TEST-CORRECT . . . . . . . . .  389
      227   TEST-ID. . . . . . . . . . . .  M292
      147   TEST-RESULTS . . . . . . . . .  M293 311
       52   TEST-2NUC-COND-99
       83   THREE
      205   TOTAL-ERROR
       92   TWENTY
       93   TWENTY-5
       82   TWO
       73   W-1
       78   W-11
       74   W-2
       75   W-3
       76   W-5
       77   W-9
      141   WHOLE-FIELD
      124   WRK-CS-05V00-0003
       51   WRK-DS-02V00
       66   WRK-DS-0201P
      134   WRK-DS-03V04-O003F-0014
      126   WRK-DS-04V01-0005
       60   WRK-DS-05V00
      123   WRK-DS-05V00-0002
       65   WRK-DS-06V06
       68   WRK-DS-09V00
       69   WRK-DS-09V09 . . . . . . . . .  70
       54   WRK-DS-18V00
       70   WRK-DS-18V00-S
      131   WRK-DU-03V00-L-0011
      125   WRK-DU-04V02-0004
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    31
0 Defined   Cross-reference of data names   References

0     122   WRK-DU-05V00-0001
       37   WRK-DU-1V17-1. . . . . . . . .  1385
       38   WRK-DU-1V5-1 . . . . . . . . .  M1385 1399 1401
       55   WRK-DU-2V1-1 . . . . . . . . .  M1382 1385
       39   WRK-NE-1 . . . . . . . . . . .  M1386 1406 1408
      133   WRK-O003F-0013
      132   WRK-O005F-0012
       42   WRK-XN-00001-1 . . . . . . . .  M908 M913 948 955 M977 M983 1018 1025 1037 M1048 M1053 1088 1095 M1117 M1123
                                            1158 1165 M1188 M1193 M1195 1230 1237 M1260 M1265 M1267 1302 1309
       43   WRK-XN-00001-2 . . . . . . . .  M909 M915 961 967 M978 M985 1031 M1049 M1055 1101 1107 M1118 M1125 1171 1177
                                            M1189 M1197 1243 1249 M1261 M1269 1315 1321
       41   WS-REM . . . . . . . . . . . .  M1335 1364 1365
       40   WS-REMAINDERS. . . . . . . . .  M1330
       45   WS-1-20
       46   WS-21-40
       47   WS-41-46
       44   WS-46
       72   XRAY
      276   XXCOMPUTED . . . . . . . . . .  M396
      278   XXCORRECT. . . . . . . . . . .  M396
      271   XXINFO . . . . . . . . . . . .  383 398
       48   11A
       49   11B
       50   1111C
       95   25ANS. . . . . . . . . . . . .  M440 M444 461 463 M487 M491 507 509 M533 M537 554 556 M716 M720 736 738 M762
                                            M766 783 785 M809 M813 831 833 M857 M861 879 881 M905 M911 924 926 M975 M981
                                            994 996 M1045 M1051 1064 1066 M1115 M1121 1134 1136 M1185 M1191 1206 1208 M1257
                                            M1263 1278 1280 M1328 M1334 1335 1352 1354 1364 1365 1371
       94   25COUNT. . . . . . . . . . . .  M439 444 M486 491 M532 537 M715 720 M761 766 M808 813 M856 861 M904 911 M974
                                            981 M1044 1051 M1114 1121 M1184 1191 M1256 1263 M1331 1334
       96   25REM. . . . . . . . . . . . .  M441 M444 473 474 M488 M491 519 520 M534 M537 566 567 M717 M720 748 749 M763
                                            M766 795 796 M810 M813 843 844 M858 M861 891 892 M906 M911 936 937 M976 M981
                                            1006 1007 M1046 M1051 1076 1077 M1116 M1121 1146 1147 M1186 M1191 1218 1219 M1258
                                            M1263 1290 1291 M1329
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    32
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

      392   BAIL-OUT . . . . . . . . . . .  P314
      400   BAIL-OUT-EX. . . . . . . . . .  E314 G394
      395   BAIL-OUT-WRITE . . . . . . . .  G393
      376   BLANK-LINE-PRINT
     1411   CCVS-EXIT. . . . . . . . . . .  G1348 G1391
     1412   CCVS-999999
      289   CCVS1
      401   CCVS1-EXIT . . . . . . . . . .  G295
      296   CLOSE-FILES. . . . . . . . . .  G1413
      324   COLUMN-NAMES-ROUTINE . . . . .  E294
      305   DE-LETE. . . . . . . . . . . .  P414 P431 P455 P501 P548 P587 P604 P644 P684 P730 P777 P825 P873 P918 P988 P1058
                                            P1128 P1200 P1272 P1346 P1389
      729   DIV-DELETE-F5-10
      776   DIV-DELETE-F5-11
      824   DIV-DELETE-F5-12
      872   DIV-DELETE-F5-13
      917   DIV-DELETE-F5-14
      987   DIV-DELETE-F5-15
     1057   DIV-DELETE-F5-16
     1127   DIV-DELETE-F5-17
     1199   DIV-DELETE-F5-18
     1271   DIV-DELETE-F5-19
     1345   DIV-DELETE-F5-20
     1388   DIV-DELETE-F5-21
      454   DIV-DELETE-F5-3
      500   DIV-DELETE-F5-4
      547   DIV-DELETE-F5-5
      603   DIV-DELETE-F5-7
      643   DIV-DELETE-F5-8
      683   DIV-DELETE-F5-9
      586   DIV-DELETE-12
      413   DIV-DELETE-4
      430   DIV-DELETE-5
     1392   DIV-FAIL-F5-21 . . . . . . . .  G1386
      712   DIV-INIT-F5-10 . . . . . . . .  G686
      758   DIV-INIT-F5-11 . . . . . . . .  G732
      805   DIV-INIT-F5-12 . . . . . . . .  G779
      853   DIV-INIT-F5-13 . . . . . . . .  G827
      901   DIV-INIT-F5-14 . . . . . . . .  G875
      971   DIV-INIT-F5-15 . . . . . . . .  G920
     1041   DIV-INIT-F5-16 . . . . . . . .  G990
     1111   DIV-INIT-F5-17 . . . . . . . .  G1060
     1181   DIV-INIT-F5-18 . . . . . . . .  G1130
     1253   DIV-INIT-F5-19 . . . . . . . .  G1202
     1325   DIV-INIT-F5-20 . . . . . . . .  G1274
     1380   DIV-INIT-F5-21
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    33
0 Defined   Cross-reference of procedures   References

0     436   DIV-INIT-F5-3
      483   DIV-INIT-F5-4. . . . . . . . .  G457
      529   DIV-INIT-F5-5. . . . . . . . .  G503
      592   DIV-INIT-F5-7
      632   DIV-INIT-F5-8. . . . . . . . .  G606
      673   DIV-INIT-F5-9. . . . . . . . .  G646
      719   DIV-TEST-F5-10-0
      733   DIV-TEST-F5-10-1 . . . . . . .  G724 G728
      745   DIV-TEST-F5-10-2
      765   DIV-TEST-F5-11-0
      780   DIV-TEST-F5-11-1 . . . . . . .  G772 G775
      792   DIV-TEST-F5-11-2
      812   DIV-TEST-F5-12-0
      828   DIV-TEST-F5-12-1 . . . . . . .  G819 G823
      840   DIV-TEST-F5-12-2
      860   DIV-TEST-F5-13-0
      876   DIV-TEST-F5-13-1 . . . . . . .  G865 G871
      888   DIV-TEST-F5-13-2
      910   DIV-TEST-F5-14-0
      921   DIV-TEST-F5-14-1 . . . . . . .  G916
      933   DIV-TEST-F5-14-2
      945   DIV-TEST-F5-14-3
      958   DIV-TEST-F5-14-4
      980   DIV-TEST-F5-15-0
      991   DIV-TEST-F5-15-1 . . . . . . .  G986
     1003   DIV-TEST-F5-15-2
     1015   DIV-TEST-F5-15-3
     1028   DIV-TEST-F5-15-4
     1050   DIV-TEST-F5-16-0
     1061   DIV-TEST-F5-16-1 . . . . . . .  G1056
     1073   DIV-TEST-F5-16-2
     1085   DIV-TEST-F5-16-3
     1098   DIV-TEST-F5-16-4
     1120   DIV-TEST-F5-17-0
     1131   DIV-TEST-F5-17-1 . . . . . . .  G1126
     1143   DIV-TEST-F5-17-2
     1155   DIV-TEST-F5-17-3
     1168   DIV-TEST-F5-17-4
     1190   DIV-TEST-F5-18-0
     1203   DIV-TEST-F5-18-1 . . . . . . .  G1198
     1215   DIV-TEST-F5-18-2
     1227   DIV-TEST-F5-18-3
     1240   DIV-TEST-F5-18-4
     1262   DIV-TEST-F5-19-0
     1275   DIV-TEST-F5-19-1 . . . . . . .  G1270
     1287   DIV-TEST-F5-19-2
     1299   DIV-TEST-F5-19-3
     1312   DIV-TEST-F5-19-4
     1333   DIV-TEST-F5-20-0
     1349   DIV-TEST-F5-20-1 . . . . . . .  G1341 G1344
     1361   DIV-TEST-F5-20-2
     1396   DIV-TEST-F5-21-1 . . . . . . .  G1387
     1404   DIV-TEST-F5-21-2
      443   DIV-TEST-F5-3-0
      458   DIV-TEST-F5-3-1. . . . . . . .  G450 G453
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    34
0 Defined   Cross-reference of procedures   References

0     470   DIV-TEST-F5-3-2
      490   DIV-TEST-F5-4-0
      504   DIV-TEST-F5-4-1. . . . . . . .  G495 G499
      516   DIV-TEST-F5-4-2
      536   DIV-TEST-F5-5-0
      551   DIV-TEST-F5-5-1. . . . . . . .  G543 G546
      563   DIV-TEST-F5-5-2
      599   DIV-TEST-F5-7-0
      607   DIV-TEST-F5-7-1. . . . . . . .  G602
      619   DIV-TEST-F5-7-2
      639   DIV-TEST-F5-8-0
      647   DIV-TEST-F5-8-1. . . . . . . .  G642
      659   DIV-TEST-F5-8-2
      680   DIV-TEST-F5-9-0
      687   DIV-TEST-F5-9-1. . . . . . . .  G682
      699   DIV-TEST-F5-9-2
      576   DIV-TEST-12. . . . . . . . . .  G550
      404   DIV-TEST-4
      418   DIV-TEST-5
      588   DIV-WRITE-12 . . . . . . . . .  G581 G585
      415   DIV-WRITE-4. . . . . . . . . .  G408 G412
      432   DIV-WRITE-5. . . . . . . . . .  G425 G429
     1384   DIVIDE-REMAINDER-TEST-7
      328   END-ROUTINE. . . . . . . . . .  P297
      332   END-ROUTINE-1
      341   END-ROUTINE-12
      349   END-ROUTINE-13 . . . . . . . .  E297
      330   END-RTN-EXIT
      304   FAIL . . . . . . . . . . . . .  P409 P426 P448 P465 P477 P497 P511 P523 P541 P558 P570 P582 P614 P626 P654 P666
                                            P694 P706 P726 P740 P752 P770 P787 P799 P817 P835 P847 P869 P883 P895 P928 P940
                                            P956 P968 P998 P1010 P1026 P1038 P1068 P1080 P1096 P1108 P1138 P1150 P1166 P1178
                                            P1210 P1222 P1238 P1250 P1282 P1294 P1310 P1322 P1339 P1356 P1368 P1374 P1393
                                            P1401 P1408
      378   FAIL-ROUTINE . . . . . . . . .  P313
      391   FAIL-ROUTINE-EX. . . . . . . .  E313 G385
      386   FAIL-ROUTINE-WRITE . . . . . .  G379 G380
      319   HEAD-ROUTINE . . . . . . . . .  P294
      302   INSPT
      290   OPEN-FILES
      303   PASS . . . . . . . . . . . . .  P407 P424 P451 P468 P480 P493 P514 P526 P544 P561 P573 P580 P617 P629 P657 P669
                                            P697 P709 P722 P743 P755 P773 P790 P802 P821 P838 P850 P863 P886 P898 P931 P943
                                            P949 P962 P1001 P1013 P1019 P1032 P1071 P1083 P1089 P1102 P1141 P1153 P1159 P1172
                                            P1213 P1225 P1231 P1244 P1285 P1297 P1303 P1316 P1342 P1359 P1377 P1399 P1406
      307   PRINT-DETAIL . . . . . . . . .  P417 P434 P449 P452 P456 P466 P469 P478 P481 P494 P498 P502 P512 P515 P524 P527
                                            P542 P545 P549 P559 P562 P571 P574 P590 P605 P615 P618 P627 P630 P645 P655 P658
                                            P667 P670 P685 P695 P698 P707 P710 P723 P727 P731 P741 P744 P753 P756 P771 P774
                                            P778 P788 P791 P800 P803 P818 P822 P826 P836 P839 P848 P851 P864 P870 P874 P884
                                            P887 P896 P899 P919 P929 P932 P941 P944 P950 P957 P963 P969 P989 P999 P1002 P1011
                                            P1014 P1020 P1027 P1033 P1039 P1059 P1069 P1072 P1081 P1084 P1090 P1097 P1103
                                            P1109 P1129 P1139 P1142 P1151 P1154 P1160 P1167 P1173 P1179 P1201 P1211 P1214
                                            P1223 P1226 P1232 P1239 P1245 P1251 P1273 P1283 P1286 P1295 P1298 P1304 P1311
                                            P1317 P1323 P1340 P1343 P1347 P1357 P1360 P1369 P1375 P1378 P1390 P1395 P1399
                                            P1402 P1407 P1409
      403   SECT-NC251A-001
      300   TERMINATE-CALL
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    35
0 Defined   Cross-reference of procedures   References

0     298   TERMINATE-CCVS
      361   WRITE-LINE . . . . . . . . . .  P311 P312 P320 P321 P322 P323 P325 P326 P327 P329 P331 P340 P348 P354 P359 P360
                                            P383 P387 P389 P398
      373   WRT-LN . . . . . . . . . . . .  P367 P368 P369 P372 P377
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    36
0 Defined   Cross-reference of programs     References

        3   NC251A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC251A    Date 06/04/2022  Time 12:00:23   Page    37
0LineID  Message code  Message text

     33  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       1           1
-* Statistics for COBOL program NC251A:
 *    Source records = 1413
 *    Data Division statements = 169
 *    Procedure Division statements = 921
 *    Generated COBOL statements = 0
 *    Program complexity factor = 934
0End of compilation 1,  program NC251A,  highest severity 0.
0Return code 0
