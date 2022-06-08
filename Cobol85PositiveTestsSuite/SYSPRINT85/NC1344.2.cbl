1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:39   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 11:59:39   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1344.2
   000002         000200 PROGRAM-ID.                                                      NC1344.2
   000003         000300     NC134A.                                                      NC1344.2
   000004         000500*                                                              *  NC1344.2
   000005         000600*    VALIDATION FOR:-                                          *  NC1344.2
   000006         000700*                                                              *  NC1344.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1344.2
   000008         000900*                                                              *  NC1344.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1344.2
   000010         001100*                                                              *  NC1344.2
   000011         001300*                                                              *  NC1344.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1344.2
   000013         001500*                                                              *  NC1344.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC1344.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC1344.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC1344.2
   000017         001900*                                                              *  NC1344.2
   000018         002100*                                                                 NC1344.2
   000019         002200*   PROGRAM NC134A TESTS THE ACCESSING OF A THREE-DIMENSIONAL     NC1344.2
   000020         002300*   TABLE USING NUMERIC LITERALS AND DATA-NAMES AS SUBSCRIPTS.    NC1344.2
   000021         002400*   RELATIVE SUBSCRIPTING IS ALSO USED.                           NC1344.2
   000022         002500*                                                                 NC1344.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1344.2
   000024         002700 CONFIGURATION SECTION.                                           NC1344.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1344.2
   000026         002900     XXXXX082.                                                    NC1344.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1344.2
   000028         003100     XXXXX083.                                                    NC1344.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1344.2
   000030         003300 FILE-CONTROL.                                                    NC1344.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1344.2 35
   000032         003500     XXXXX055.                                                    NC1344.2
   000033         003600 DATA DIVISION.                                                   NC1344.2
   000034         003700 FILE SECTION.                                                    NC1344.2
   000035         003800 FD  PRINT-FILE.                                                  NC1344.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1344.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1344.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1344.2
   000039         004200 77  A-NAME-30-CHARACTERS-IN-LENGTH PICTURE IS XXX VALUE IS "END".NC1344.2
   000040         004300 77  LONG-PICTURE PICTURE IS XXXXXXXXXXXXXXXXXXXXXXXXXXXXX.       NC1344.2
   000041         004400 77  ONE      PICTURE IS 9 VALUE IS 1 USAGE IS COMPUTATIONAL.     NC1344.2
   000042         004500 77  TWO      PICTURE IS 9 VALUE IS 2 USAGE IS COMPUTATIONAL.     NC1344.2
   000043         004600 77  THREE    PICTURE IS 9 VALUE IS 3 COMPUTATIONAL.              NC1344.2
   000044         004700 77  FOUR     PICTURE IS 9 VALUE IS 4 COMPUTATIONAL.              NC1344.2
   000045         004800 77  FIVE     PICTURE IS 9 VALUE IS 5 COMPUTATIONAL.              NC1344.2
   000046         004900 77  SIX      PICTURE IS 9 VALUE IS 6 COMPUTATIONAL.              NC1344.2
   000047         005000 77  SEVEN    PICTURE IS 9 VALUE IS 7 COMPUTATIONAL.              NC1344.2
   000048         005100 77  EIGHT    PICTURE IS 9 VALUE    8 COMPUTATIONAL.              NC1344.2
   000049         005200 77  NINE     PICTURE IS 9 VALUE    9 USAGE IS COMPUTATIONAL.     NC1344.2
   000050         005300 77  TEN      PICTURE   99 VALUE   10 USAGE COMPUTATIONAL.        NC1344.2
   000051         005400 77  FIFTEEN  PICTURE   99 VALUE   15 USAGE COMPUTATIONAL.        NC1344.2
   000052         005500 77  TWENTY   PICTURE   99 VALUE   20 USAGE IS COMPUTATIONAL.     NC1344.2
   000053         005600 77  TWENTY-5 PICTURE   99 VALUE   25.                            NC1344.2
   000054         005700 77  D-1 PICTURE IS S9V99 VALUE IS 1.06.                          NC1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 77  D-2 PICTURE IS S9V99 VALUE IS -1.06.                         NC1344.2
   000056         005900 77  D-3 PICTURE IS 9(18) VALUE IS 979797979797979798.            NC1344.2
   000057         006000 77  D-4 PICTURE IS S99V99 VALUE IS +10.1.                        NC1344.2
   000058         006100 77  D-5 PICTURE IS S999 VALUE IS -1.                             NC1344.2
   000059         006200 77  D-6 PICTURE IS S999P VALUE IS 10.                            NC1344.2
   000060         006300 77  D-7 PICTURE IS S99V99 VALUE IS 1.09.                         NC1344.2
   000061         006400 77  D-8 PICTURE IS S999V9 VALUE 175.                             NC1344.2
   000062         006500 77  D-9 PICTURE IS 9(4)V9(4) VALUE IS 111.1189.                  NC1344.2
   000063         006600 77  D-10 PICTURE 999 VALUE 100.                                  NC1344.2
   000064         006700 77  D-11 PICTURE 999 VALUE 300.                                  NC1344.2
   000065         006800 77  D-12 PICTURE 999 VALUE 900.                                  NC1344.2
   000066         006900 77  W-1 PICTURE IS 9.                                            NC1344.2
   000067         007000 77  W-2 PICTURE IS 99.                                           NC1344.2
   000068         007100 77  W-3 PICTURE IS 999.                                          NC1344.2
   000069         007200 77  W-4 PICTURE IS 9 VALUE IS ZERO.                              NC1344.2 IMP
   000070         007300 77  W-5 PICTURE IS 99 VALUE IS ZERO.                             NC1344.2 IMP
   000071         007400 77  W-6 PICTURE IS 999 VALUE IS ZERO.                            NC1344.2 IMP
   000072         007500 77  W-7 PICTURE IS 9.                                            NC1344.2
   000073         007600 77  W-8 PICTURE    99 BLANK ZERO.                                NC1344.2
   000074         007700 77  W-9 PICTURE    999.                                          NC1344.2
   000075         007800 77  W-10 PICTURE 99V9.                                           NC1344.2
   000076         007900 77  W-11 PICTURE S99V9.                                          NC1344.2
   000077         008000 77  W-12 PICTURE S9V99.                                          NC1344.2
   000078         008100 77  W-13 PICTURE S9(2)V9(2).                                     NC1344.2
   000079         008200 77  W-14 PICTURE IS S99V99.                                      NC1344.2
   000080         008300 77  XRAY PICTURE IS 9.                                           NC1344.2
   000081         008400 77  CTR-1 PICTURE IS 999.                                        NC1344.2
   000082         008500 77  SUBSCRIPT-1 PICTURE IS 999.                                  NC1344.2
   000083         008600 77  SUBSCRIPT-2 PICTURE IS 999.                                  NC1344.2
   000084         008700 77  SUBSCRIPT-3  PICTURE IS 999.                                 NC1344.2
   000085         008800 01  TABLE-10.                                                    NC1344.2
   000086         008900     02 STATE-1 OCCURS 10 TIMES.                                  NC1344.2
   000087         009000       03  YEAR-1 OCCURS 10 TIMES.                                NC1344.2
   000088         009100         04 ANIMAL PICTURE IS 999 OCCURS 03 TIMES.                NC1344.2
   000089         009200 01  NUMBER-LIST.                                                 NC1344.2
   000090         009300     02 FILLER PICTURE IS X VALUE IS SPACE.                       NC1344.2 IMP
   000091         009400     02 LINE-1 OCCURS 20 TIMES.                                   NC1344.2
   000092         009500       03 BLANKSPACE PICTURE IS XX.                               NC1344.2
   000093         009600       03 PRINT-ELE PICTURE IS 999.                               NC1344.2
   000094         009700 01  TABLE-1.                                                     NC1344.2
   000095         009800     02  TAB-ELE PICTURE IS 999 OCCURS 100 TIMES.                 NC1344.2
   000096         009900 01  TEST-RESULTS.                                                NC1344.2
   000097         010000     02 FILLER                   PIC X      VALUE SPACE.          NC1344.2 IMP
   000098         010100     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1344.2 IMP
   000099         010200     02 FILLER                   PIC X      VALUE SPACE.          NC1344.2 IMP
   000100         010300     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1344.2 IMP
   000101         010400     02 FILLER                   PIC X      VALUE SPACE.          NC1344.2 IMP
   000102         010500     02  PAR-NAME.                                                NC1344.2
   000103         010600       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1344.2 IMP
   000104         010700       03  PARDOT-X              PIC X      VALUE SPACE.          NC1344.2 IMP
   000105         010800       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1344.2 IMP
   000106         010900     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1344.2 IMP
   000107         011000     02 RE-MARK                  PIC X(61).                       NC1344.2
   000108         011100 01  TEST-COMPUTED.                                               NC1344.2
   000109         011200     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1344.2 IMP
   000110         011300     02 FILLER                   PIC X(17)  VALUE                 NC1344.2
   000111         011400            "       COMPUTED=".                                   NC1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 COMPUTED-X.                                               NC1344.2
   000113         011600     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1344.2 IMP
   000114         011700     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1344.2 113
   000115         011800                                 PIC -9(9).9(9).                  NC1344.2
   000116         011900     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1344.2 113
   000117         012000     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1344.2 113
   000118         012100     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1344.2 113
   000119         012200     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1344.2 113
   000120         012300         04 COMPUTED-18V0                    PIC -9(18).          NC1344.2
   000121         012400         04 FILLER                           PIC X.               NC1344.2
   000122         012500     03 FILLER PIC X(50) VALUE SPACE.                             NC1344.2 IMP
   000123         012600 01  TEST-CORRECT.                                                NC1344.2
   000124         012700     02 FILLER PIC X(30) VALUE SPACE.                             NC1344.2 IMP
   000125         012800     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1344.2
   000126         012900     02 CORRECT-X.                                                NC1344.2
   000127         013000     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1344.2 IMP
   000128         013100     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1344.2 127
   000129         013200     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1344.2 127
   000130         013300     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1344.2 127
   000131         013400     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1344.2 127
   000132         013500     03      CR-18V0 REDEFINES CORRECT-A.                         NC1344.2 127
   000133         013600         04 CORRECT-18V0                     PIC -9(18).          NC1344.2
   000134         013700         04 FILLER                           PIC X.               NC1344.2
   000135         013800     03 FILLER PIC X(2) VALUE SPACE.                              NC1344.2 IMP
   000136         013900     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1344.2 IMP
   000137         014000 01  CCVS-C-1.                                                    NC1344.2
   000138         014100     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1344.2
   000139         014200-    "SS  PARAGRAPH-NAME                                          NC1344.2
   000140         014300-    "       REMARKS".                                            NC1344.2
   000141         014400     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1344.2 IMP
   000142         014500 01  CCVS-C-2.                                                    NC1344.2
   000143         014600     02 FILLER                     PIC X        VALUE SPACE.      NC1344.2 IMP
   000144         014700     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1344.2
   000145         014800     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1344.2 IMP
   000146         014900     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1344.2
   000147         015000     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1344.2 IMP
   000148         015100 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1344.2 IMP
   000149         015200 01  REC-CT                        PIC 99       VALUE ZERO.       NC1344.2 IMP
   000150         015300 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1344.2 IMP
   000151         015400 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1344.2 IMP
   000152         015500 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1344.2 IMP
   000153         015600 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1344.2 IMP
   000154         015700 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1344.2 IMP
   000155         015800 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1344.2 IMP
   000156         015900 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1344.2 IMP
   000157         016000 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1344.2 IMP
   000158         016100 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1344.2 IMP
   000159         016200 01  CCVS-H-1.                                                    NC1344.2
   000160         016300     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1344.2 IMP
   000161         016400     02  FILLER                    PIC X(42)    VALUE             NC1344.2
   000162         016500     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1344.2
   000163         016600     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1344.2 IMP
   000164         016700 01  CCVS-H-2A.                                                   NC1344.2
   000165         016800   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1344.2 IMP
   000166         016900   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1344.2
   000167         017000   02  FILLER                        PIC XXXX   VALUE             NC1344.2
   000168         017100     "4.2 ".                                                      NC1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200   02  FILLER                        PIC X(28)  VALUE             NC1344.2
   000170         017300            " COPY - NOT FOR DISTRIBUTION".                       NC1344.2
   000171         017400   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1344.2 IMP
   000172         017500                                                                  NC1344.2
   000173         017600 01  CCVS-H-2B.                                                   NC1344.2
   000174         017700   02  FILLER                        PIC X(15)  VALUE             NC1344.2
   000175         017800            "TEST RESULT OF ".                                    NC1344.2
   000176         017900   02  TEST-ID                       PIC X(9).                    NC1344.2
   000177         018000   02  FILLER                        PIC X(4)   VALUE             NC1344.2
   000178         018100            " IN ".                                               NC1344.2
   000179         018200   02  FILLER                        PIC X(12)  VALUE             NC1344.2
   000180         018300     " HIGH       ".                                              NC1344.2
   000181         018400   02  FILLER                        PIC X(22)  VALUE             NC1344.2
   000182         018500            " LEVEL VALIDATION FOR ".                             NC1344.2
   000183         018600   02  FILLER                        PIC X(58)  VALUE             NC1344.2
   000184         018700     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1344.2
   000185         018800 01  CCVS-H-3.                                                    NC1344.2
   000186         018900     02  FILLER                      PIC X(34)  VALUE             NC1344.2
   000187         019000            " FOR OFFICIAL USE ONLY    ".                         NC1344.2
   000188         019100     02  FILLER                      PIC X(58)  VALUE             NC1344.2
   000189         019200     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1344.2
   000190         019300     02  FILLER                      PIC X(28)  VALUE             NC1344.2
   000191         019400            "  COPYRIGHT   1985 ".                                NC1344.2
   000192         019500 01  CCVS-E-1.                                                    NC1344.2
   000193         019600     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1344.2 IMP
   000194         019700     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1344.2
   000195         019800     02 ID-AGAIN                     PIC X(9).                    NC1344.2
   000196         019900     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1344.2 IMP
   000197         020000 01  CCVS-E-2.                                                    NC1344.2
   000198         020100     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1344.2 IMP
   000199         020200     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1344.2 IMP
   000200         020300     02 CCVS-E-2-2.                                               NC1344.2
   000201         020400         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1344.2 IMP
   000202         020500         03 FILLER                   PIC X      VALUE SPACE.      NC1344.2 IMP
   000203         020600         03 ENDER-DESC               PIC X(44)  VALUE             NC1344.2
   000204         020700            "ERRORS ENCOUNTERED".                                 NC1344.2
   000205         020800 01  CCVS-E-3.                                                    NC1344.2
   000206         020900     02  FILLER                      PIC X(22)  VALUE             NC1344.2
   000207         021000            " FOR OFFICIAL USE ONLY".                             NC1344.2
   000208         021100     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1344.2 IMP
   000209         021200     02  FILLER                      PIC X(58)  VALUE             NC1344.2
   000210         021300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1344.2
   000211         021400     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1344.2 IMP
   000212         021500     02 FILLER                       PIC X(15)  VALUE             NC1344.2
   000213         021600             " COPYRIGHT 1985".                                   NC1344.2
   000214         021700 01  CCVS-E-4.                                                    NC1344.2
   000215         021800     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1344.2 IMP
   000216         021900     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1344.2
   000217         022000     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1344.2 IMP
   000218         022100     02 FILLER                       PIC X(40)  VALUE             NC1344.2
   000219         022200      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1344.2
   000220         022300 01  XXINFO.                                                      NC1344.2
   000221         022400     02 FILLER                       PIC X(19)  VALUE             NC1344.2
   000222         022500            "*** INFORMATION ***".                                NC1344.2
   000223         022600     02 INFO-TEXT.                                                NC1344.2
   000224         022700       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1344.2 IMP
   000225         022800       04 XXCOMPUTED                 PIC X(20).                   NC1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1344.2 IMP
   000227         023000       04 XXCORRECT                  PIC X(20).                   NC1344.2
   000228         023100     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1344.2
   000229         023200 01  HYPHEN-LINE.                                                 NC1344.2
   000230         023300     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1344.2 IMP
   000231         023400     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1344.2
   000232         023500-    "*****************************************".                 NC1344.2
   000233         023600     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1344.2
   000234         023700-    "******************************".                            NC1344.2
   000235         023800 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1344.2
   000236         023900     "NC134A".                                                    NC1344.2
   000237         024000 PROCEDURE DIVISION.                                              NC1344.2
   000238         024100 CCVS1 SECTION.                                                   NC1344.2
   000239         024200 OPEN-FILES.                                                      NC1344.2
   000240         024300     OPEN     OUTPUT PRINT-FILE.                                  NC1344.2 35
   000241         024400     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1344.2 235 176 235 195
   000242         024500     MOVE    SPACE TO TEST-RESULTS.                               NC1344.2 IMP 96
   000243         024600     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1344.2 268 273
   000244         024700     GO TO CCVS1-EXIT.                                            NC1344.2 355
   000245         024800 CLOSE-FILES.                                                     NC1344.2
   000246         024900     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1344.2 277 298 35
   000247         025000 TERMINATE-CCVS.                                                  NC1344.2
   000248         025100     EXIT PROGRAM.                                                NC1344.2
   000249         025200 TERMINATE-CALL.                                                  NC1344.2
   000250         025300     STOP     RUN.                                                NC1344.2
   000251         025400 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1344.2 100 152
   000252         025500 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1344.2 100 153
   000253         025600 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1344.2 100 151
   000254         025700 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1344.2 100 150
   000255         025800     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1344.2 107
   000256         025900 PRINT-DETAIL.                                                    NC1344.2
   000257         026000     IF REC-CT NOT EQUAL TO ZERO                                  NC1344.2 149 IMP
   000258      1  026100             MOVE "." TO PARDOT-X                                 NC1344.2 104
   000259      1  026200             MOVE REC-CT TO DOTVALUE.                             NC1344.2 149 105
   000260         026300     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1344.2 96 36 310
   000261         026400     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1344.2 100 310
   000262      1  026500        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1344.2 331 345
   000263      1  026600          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1344.2 346 354
   000264         026700     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1344.2 IMP 100 IMP 112
   000265         026800     MOVE SPACE TO CORRECT-X.                                     NC1344.2 IMP 126
   000266         026900     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1344.2 149 IMP IMP 102
   000267         027000     MOVE     SPACE TO RE-MARK.                                   NC1344.2 IMP 107
   000268         027100 HEAD-ROUTINE.                                                    NC1344.2
   000269         027200     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1344.2 159 37 310
   000270         027300     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1344.2 164 37 310
   000271         027400     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1344.2 173 37 310
   000272         027500     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1344.2 185 37 310
   000273         027600 COLUMN-NAMES-ROUTINE.                                            NC1344.2
   000274         027700     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1344.2 137 37 310
   000275         027800     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1344.2 142 37 310
   000276         027900     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1344.2 229 37 310
   000277         028000 END-ROUTINE.                                                     NC1344.2
   000278         028100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1344.2 229 37 310
   000279         028200 END-RTN-EXIT.                                                    NC1344.2
   000280         028300     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1344.2 192 37 310
   000281         028400 END-ROUTINE-1.                                                   NC1344.2
   000282         028500      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1344.2 151 155 152
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1344.2 155 150 155
   000284         028700      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1344.2 153 155
   000285         028800*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1344.2
   000286         028900      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1344.2 153 215
   000287         029000      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1344.2 155 217
   000288         029100      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1344.2 214 200
   000289         029200      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1344.2 197 37 310
   000290         029300  END-ROUTINE-12.                                                 NC1344.2
   000291         029400      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1344.2 203
   000292         029500     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1344.2 151 IMP
   000293      1  029600         MOVE "NO " TO ERROR-TOTAL                                NC1344.2 201
   000294         029700         ELSE                                                     NC1344.2
   000295      1  029800         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1344.2 151 201
   000296         029900     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1344.2 197 37
   000297         030000     PERFORM WRITE-LINE.                                          NC1344.2 310
   000298         030100 END-ROUTINE-13.                                                  NC1344.2
   000299         030200     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1344.2 150 IMP
   000300      1  030300         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1344.2 201
   000301      1  030400         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1344.2 150 201
   000302         030500     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1344.2 203
   000303         030600     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1344.2 197 37 310
   000304         030700      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1344.2 152 IMP
   000305      1  030800          MOVE "NO " TO ERROR-TOTAL                               NC1344.2 201
   000306      1  030900      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1344.2 152 201
   000307         031000      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1344.2 203
   000308         031100      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1344.2 197 37 310
   000309         031200     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1344.2 205 37 310
   000310         031300 WRITE-LINE.                                                      NC1344.2
   000311         031400     ADD 1 TO RECORD-COUNT.                                       NC1344.2 157
   000312         031500     IF RECORD-COUNT GREATER 42                                   NC1344.2 157
   000313      1  031600         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1344.2 37 156
   000314      1  031700         MOVE SPACE TO DUMMY-RECORD                               NC1344.2 IMP 37
   000315      1  031800         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1344.2 37
   000316      1  031900         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1344.2 159 37 326
   000317      1  032000         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1344.2 164 37 326
   000318      1  032100         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1344.2 173 37 326
   000319      1  032200         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1344.2 185 37 326
   000320      1  032300         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1344.2 137 37 326
   000321      1  032400         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1344.2 142 37 326
   000322      1  032500         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1344.2 229 37 326
   000323      1  032600         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1344.2 156 37
   000324      1  032700         MOVE ZERO TO RECORD-COUNT.                               NC1344.2 IMP 157
   000325         032800     PERFORM WRT-LN.                                              NC1344.2 326
   000326         032900 WRT-LN.                                                          NC1344.2
   000327         033000     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1344.2 37
   000328         033100     MOVE SPACE TO DUMMY-RECORD.                                  NC1344.2 IMP 37
   000329         033200 BLANK-LINE-PRINT.                                                NC1344.2
   000330         033300     PERFORM WRT-LN.                                              NC1344.2 326
   000331         033400 FAIL-ROUTINE.                                                    NC1344.2
   000332         033500     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1344.2 112 IMP
   000333      1  033600            GO TO FAIL-ROUTINE-WRITE.                             NC1344.2 340
   000334         033700     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1344.2 126 IMP 340
   000335         033800     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1344.2 158 228
   000336         033900     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1344.2 223
   000337         034000     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1344.2 220 37 310
   000338         034100     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1344.2 IMP 228
   000339         034200     GO TO  FAIL-ROUTINE-EX.                                      NC1344.2 345
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300 FAIL-ROUTINE-WRITE.                                              NC1344.2
   000341         034400     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1344.2 108 36 310
   000342         034500     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1344.2 158 136
   000343         034600     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1344.2 123 36 310
   000344         034700     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1344.2 IMP 136
   000345         034800 FAIL-ROUTINE-EX. EXIT.                                           NC1344.2
   000346         034900 BAIL-OUT.                                                        NC1344.2
   000347         035000     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1344.2 113 IMP 349
   000348         035100     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1344.2 127 IMP 354
   000349         035200 BAIL-OUT-WRITE.                                                  NC1344.2
   000350         035300     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1344.2 127 227 113 225
   000351         035400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1344.2 158 228
   000352         035500     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1344.2 220 37 310
   000353         035600     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1344.2 IMP 228
   000354         035700 BAIL-OUT-EX. EXIT.                                               NC1344.2
   000355         035800 CCVS1-EXIT.                                                      NC1344.2
   000356         035900     EXIT.                                                        NC1344.2
   000357         036000 SECT-NC134A-001 SECTION.                                         NC1344.2
   000358         036100 NC-05-001.                                                       NC1344.2
   000359         036200     MOVE "IV-21 4.3.8.2" TO ANSI-REFERENCE.                      NC1344.2 158
   000360         036300     MOVE 1 TO SUBSCRIPT-1.                                       NC1344.2 82
   000361         036400     MOVE 1 TO W-3.                                               NC1344.2 68
   000362         036500     PERFORM BUILD-TABLE 100 TIMES.                               NC1344.2 401
   000363         036600*    NOTE TABLE IS CONSTRUCTED WITH VALUES FROM 1 TO 100.         NC1344.2
   000364         036700     MOVE "SUBSCRIPTING" TO FEATURE.                              NC1344.2 98
   000365         036800 TEST-1.                                                          NC1344.2
   000366         036900     IF TAB-ELE (50) EQUAL TO 50 PERFORM PASS ELSE GO TO TST-11.  NC1344.2 95 252 368
   000367         037000     GO TO TST-12.                                                NC1344.2 372
   000368         037100 TST-11.                                                          NC1344.2
   000369         037200     PERFORM FAIL.                                                NC1344.2 253
   000370         037300     MOVE TAB-ELE (50) TO COMPUTED-A.                             NC1344.2 95 113
   000371         037400     MOVE "50" TO CORRECT-A.                                      NC1344.2 127
   000372         037500 TST-12.                                                          NC1344.2
   000373         037600     MOVE "TEST-1" TO PAR-NAME.                                   NC1344.2 102
   000374         037700     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000375         037800 TEST-2.                                                          NC1344.2
   000376         037900     IF TAB-ELE (TWENTY-5) EQUAL TO 25 PERFORM PASS ELSE GO TO    NC1344.2 95 53 252
   000377         038000     TST-21.                                                      NC1344.2 379
   000378         038100     GO TO TST-22.                                                NC1344.2 383
   000379         038200 TST-21.                                                          NC1344.2
   000380         038300     PERFORM FAIL.                                                NC1344.2 253
   000381         038400     MOVE TAB-ELE (TWENTY-5) TO COMPUTED-A.                       NC1344.2 95 53 113
   000382         038500     MOVE "25" TO CORRECT-A.                                      NC1344.2 127
   000383         038600 TST-22.                                                          NC1344.2
   000384         038700     MOVE "TEST-2" TO PAR-NAME.                                   NC1344.2 102
   000385         038800     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000386         038900 TEST-3.                                                          NC1344.2
   000387         039000     IF TAB-ELE (99) EQUAL TO 99 PERFORM PASS ELSE GO TO TST-31.  NC1344.2 95 252 389
   000388         039100     GO TO TST-32.                                                NC1344.2 393
   000389         039200 TST-31.                                                          NC1344.2
   000390         039300     PERFORM FAIL.                                                NC1344.2 253
   000391         039400     MOVE TAB-ELE (99) TO COMPUTED-A.                             NC1344.2 95 113
   000392         039500     MOVE "99" TO CORRECT-A.                                      NC1344.2 127
   000393         039600 TST-32.                                                          NC1344.2
   000394         039700     MOVE "TEST-3" TO PAR-NAME.                                   NC1344.2 102
   000395         039800     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000396         039900 WRITE-TABLE-OUT.                                                 NC1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397         040000     MOVE 1 TO SUBSCRIPT-2.                                       NC1344.2 83
   000398         040100     MOVE 1 TO CTR-1.                                             NC1344.2 81
   000399         040200     PERFORM TABLE-WRITE THRU END-OF 100 TIMES.                   NC1344.2 405 411
   000400         040300     GO TO CONSTRUCTION.                                          NC1344.2 418
   000401         040400 BUILD-TABLE.                                                     NC1344.2
   000402         040500     MOVE W-3 TO TAB-ELE (SUBSCRIPT-1).                           NC1344.2 68 95 82
   000403         040600     ADD 1 TO SUBSCRIPT-1.                                        NC1344.2 82
   000404         040700     ADD 1 TO W-3.                                                NC1344.2 68
   000405         040800 TABLE-WRITE.                                                     NC1344.2
   000406         040900     MOVE TAB-ELE (SUBSCRIPT-2) TO PRINT-ELE (CTR-1)              NC1344.2 95 83 93 81
   000407         041000     MOVE SPACE TO BLANKSPACE (CTR-1).                            NC1344.2 IMP 92 81
   000408         041100     ADD 1 TO SUBSCRIPT-2.                                        NC1344.2 83
   000409         041200     ADD 1 TO CTR-1.                                              NC1344.2 81
   000410         041300     IF CTR-1 IS EQUAL TO 21 PERFORM TABLE-DUMP.                  NC1344.2 81 413
   000411         041400 END-OF.                                                          NC1344.2
   000412         041500     EXIT.                                                        NC1344.2
   000413         041600 TABLE-DUMP.                                                      NC1344.2
   000414         041700     MOVE SPACE TO PRINT-REC.                                     NC1344.2 IMP 36
   000415         041800     MOVE NUMBER-LIST TO PRINT-REC.                               NC1344.2 89 36
   000416         041900     PERFORM WRITE-LINE.                                          NC1344.2 310
   000417         042000     MOVE 01 TO CTR-1.                                            NC1344.2 81
   000418         042100 CONSTRUCTION.                                                    NC1344.2
   000419         042200     MOVE 1    TO SUBSCRIPT-1.                                    NC1344.2 82
   000420         042300     MOVE 1    TO SUBSCRIPT-2.                                    NC1344.2 83
   000421         042400     MOVE 1 TO SUBSCRIPT-3.                                       NC1344.2 84
   000422         042500     MOVE 1 TO W-3.                                               NC1344.2 68
   000423         042600     PERFORM TABLE-BUILD-2 THROUGH FINE 300 TIMES.                NC1344.2 690 703
   000424         042700 TABTEST-1.                                                       NC1344.2
   000425         042800     IF ANIMAL (1  1  1) EQUAL TO 1 PERFORM PASS ELSE GO TO       NC1344.2 88 252
   000426         042900     TTST-11.                                                     NC1344.2 428
   000427         043000     GO TO TTST-12.                                               NC1344.2 432
   000428         043100 TTST-11.                                                         NC1344.2
   000429         043200     PERFORM FAIL.                                                NC1344.2 253
   000430         043300     MOVE ANIMAL (1  1  1) TO COMPUTED-A.                         NC1344.2 88 113
   000431         043400     MOVE "001" TO CORRECT-A.                                     NC1344.2 127
   000432         043500 TTST-12.                                                         NC1344.2
   000433         043600     MOVE "TABTEST-1" TO PAR-NAME.                                NC1344.2 102
   000434         043700     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000435         043800 TABTEST-2.                                                       NC1344.2
   000436         043900     MOVE 1 TO W-1.                                               NC1344.2 66
   000437         044000     MOVE 1 TO W-2.                                               NC1344.2 67
   000438         044100     MOVE 1 TO W-3.                                               NC1344.2 68
   000439         044200     IF ANIMAL (W-1  W-2  W-3)  EQUAL TO 1   PERFORM PASS ELSE GO NC1344.2 88 66 67 68 252
   000440         044300     TO TTST-21.                                                  NC1344.2 442
   000441         044400     GO TO TTST-22.                                               NC1344.2 446
   000442         044500 TTST-21.                                                         NC1344.2
   000443         044600     PERFORM FAIL.                                                NC1344.2 253
   000444         044700     MOVE ANIMAL (W-1  W-2  W-3) TO COMPUTED-A.                   NC1344.2 88 66 67 68 113
   000445         044800     MOVE "001" TO CORRECT-A.                                     NC1344.2 127
   000446         044900 TTST-22.                                                         NC1344.2
   000447         045000     MOVE "TABTEST-2" TO PAR-NAME.                                NC1344.2 102
   000448         045100     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000449         045200 TABTEST-3.                                                       NC1344.2
   000450         045300     MOVE 3 TO W-3.                                               NC1344.2 68
   000451         045400     MOVE 3 TO W-2.                                               NC1344.2 67
   000452         045500     MOVE 1 TO W-1.                                               NC1344.2 66
   000453         045600     IF ANIMAL (W-1  W-2  W-3) EQUAL TO 9 PERFORM PASS ELSE GO    NC1344.2 88 66 67 68 252
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045700     TO TTST-31.                                                  NC1344.2 456
   000455         045800     GO TO TTST-32.                                               NC1344.2 460
   000456         045900 TTST-31.                                                         NC1344.2
   000457         046000     PERFORM FAIL.                                                NC1344.2 253
   000458         046100     MOVE ANIMAL (W-1  W-2  W-3) TO COMPUTED-A.                   NC1344.2 88 66 67 68 113
   000459         046200     MOVE "009" TO CORRECT-A.                                     NC1344.2 127
   000460         046300 TTST-32.                                                         NC1344.2
   000461         046400     MOVE "TABTEST-3" TO PAR-NAME.                                NC1344.2 102
   000462         046500     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000463         046600 TABTEST-4.                                                       NC1344.2
   000464         046700     IF ANIMAL (10  10  1)    EQUAL TO 298 PERFORM PASS ELSE GO TONC1344.2 88 252
   000465         046800     TTST-41.                                                     NC1344.2 467
   000466         046900     GO TO TTST-42.                                               NC1344.2 471
   000467         047000 TTST-41.                                                         NC1344.2
   000468         047100     PERFORM FAIL.                                                NC1344.2 253
   000469         047200     MOVE ANIMAL (10  10  1) TO COMPUTED-A.                       NC1344.2 88 113
   000470         047300     MOVE "298" TO CORRECT-A.                                     NC1344.2 127
   000471         047400 TTST-42.                                                         NC1344.2
   000472         047500     MOVE "TABTEST-4" TO PAR-NAME.                                NC1344.2 102
   000473         047600     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000474         047700 TABTEST-5.                                                       NC1344.2
   000475         047800     MOVE 3 TO W-1.                                               NC1344.2 66
   000476         047900     MOVE 10 TO W-2.                                              NC1344.2 67
   000477         048000     MOVE 10 TO W-3.                                              NC1344.2 68
   000478         048100     IF ANIMAL (W-3  W-2  W-1) EQUAL TO 300 PERFORM PASS ELSE GO  NC1344.2 88 68 67 66 252
   000479         048200     TO TTST-51.                                                  NC1344.2 481
   000480         048300     GO TO TTST-52.                                               NC1344.2 485
   000481         048400 TTST-51.                                                         NC1344.2
   000482         048500     PERFORM FAIL.                                                NC1344.2 253
   000483         048600     MOVE ANIMAL (W-3  W-2  W-1) TO COMPUTED-A.                   NC1344.2 88 68 67 66 113
   000484         048700     MOVE "300" TO CORRECT-A.                                     NC1344.2 127
   000485         048800 TTST-52.                                                         NC1344.2
   000486         048900     MOVE "TABTEST-5" TO PAR-NAME.                                NC1344.2 102
   000487         049000     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000488         049100 TABTEST-6.                                                       NC1344.2
   000489         049200      IF YEAR-1 (1  1) EQUAL TO "001002003" PERFORM PASS ELSE GO  NC1344.2 87 252
   000490         049300     TO TTST-61.                                                  NC1344.2 492
   000491         049400     GO TO TTST-62.                                               NC1344.2 496
   000492         049500 TTST-61.                                                         NC1344.2
   000493         049600     PERFORM FAIL.                                                NC1344.2 253
   000494         049700     MOVE YEAR-1 (1  1) TO COMPUTED-A.                            NC1344.2 87 113
   000495         049800     MOVE "001002003" TO CORRECT-A.                               NC1344.2 127
   000496         049900 TTST-62.                                                         NC1344.2
   000497         050000     MOVE "TABTEST-6" TO PAR-NAME.                                NC1344.2 102
   000498         050100     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000499         050200 TABTEST-7.                                                       NC1344.2
   000500         050300      IF YEAR-1 (10  10) EQUAL TO "298299300" PERFORM PASS ELSE GONC1344.2 87 252
   000501         050400     TO TTST-71.                                                  NC1344.2 503
   000502         050500     GO TO TTST-72.                                               NC1344.2 507
   000503         050600 TTST-71.                                                         NC1344.2
   000504         050700     MOVE YEAR-1 (10  10) TO COMPUTED-A.                          NC1344.2 87 113
   000505         050800     MOVE "298299300" TO CORRECT-A.                               NC1344.2 127
   000506         050900     PERFORM FAIL.                                                NC1344.2 253
   000507         051000 TTST-72.                                                         NC1344.2
   000508         051100     MOVE "TABTEST-7" TO PAR-NAME.                                NC1344.2 102
   000509         051200     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000510         051300 TABTEST-8.                                                       NC1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511         051400     MOVE 02 TO W-1.                                              NC1344.2 66
   000512         051500     MOVE 07  TO W-2.                                             NC1344.2 67
   000513         051600     IF ANIMAL (W-1  W-2  1) EQUAL TO 49 PERFORM PASS ELSE GO TO  NC1344.2 88 66 67 252
   000514         051700     TTST-81.                                                     NC1344.2 516
   000515         051800     GO TO TTST-82.                                               NC1344.2 520
   000516         051900 TTST-81.                                                         NC1344.2
   000517         052000     PERFORM FAIL.                                                NC1344.2 253
   000518         052100     MOVE ANIMAL (W-1  W-2  1) TO COMPUTED-A.                     NC1344.2 88 66 67 113
   000519         052200     MOVE "049" TO CORRECT-A.                                     NC1344.2 127
   000520         052300 TTST-82.                                                         NC1344.2
   000521         052400     MOVE "TABTEST-8" TO PAR-NAME.                                NC1344.2 102
   000522         052500     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000523         052600 TABTEST-9.                                                       NC1344.2
   000524         052700     MOVE 08 TO W-1.                                              NC1344.2 66
   000525         052800     MOVE 03 TO W-3.                                              NC1344.2 68
   000526         052900     IF ANIMAL (W-1  1  W-3) EQUAL TO 213 PERFORM PASS ELSE GO TO NC1344.2 88 66 68 252
   000527         053000     TTST-91.                                                     NC1344.2 529
   000528         053100     GO TO TTST-92.                                               NC1344.2 533
   000529         053200 TTST-91.                                                         NC1344.2
   000530         053300     PERFORM FAIL.                                                NC1344.2 253
   000531         053400     MOVE ANIMAL (W-1  1  W-3) TO COMPUTED-A.                     NC1344.2 88 66 68 113
   000532         053500     MOVE "213" TO CORRECT-A.                                     NC1344.2 127
   000533         053600 TTST-92.                                                         NC1344.2
   000534         053700     MOVE "TABTEST-9" TO PAR-NAME.                                NC1344.2 102
   000535         053800     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000536         053900 TABTEST-10.                                                      NC1344.2
   000537         054000     MOVE 5 TO W-1.                                               NC1344.2 66
   000538         054100     IF YEAR-1 (W-1  10) EQUAL TO "148149150" PERFORM PASS ELSE   NC1344.2 87 66 252
   000539      1  054200     GO TO TTST-101.                                              NC1344.2 541
   000540         054300     GO TO TTST-102.                                              NC1344.2 545
   000541         054400 TTST-101.                                                        NC1344.2
   000542         054500     PERFORM FAIL.                                                NC1344.2 253
   000543         054600     MOVE     YEAR-1 (W-1  10) TO COMPUTED-A.                     NC1344.2 87 66 113
   000544         054700     MOVE "148149150" TO CORRECT-A.                               NC1344.2 127
   000545         054800 TTST-102.                                                        NC1344.2
   000546         054900     MOVE "TABTEST-10" TO PAR-NAME.                               NC1344.2 102
   000547         055000     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000548         055100 TABTEST-11.                                                      NC1344.2
   000549         055200     IF YEAR-1 (+10  +10) EQUAL TO "298299300"                    NC1344.2 87
   000550      1  055300             PERFORM PASS                                         NC1344.2 252
   000551      1  055400             GO TO TABTEST-11B.                                   NC1344.2 558
   000552         055500     MOVE YEAR-1 (+10  +10) TO COMPUTED-A.                        NC1344.2 87 113
   000553         055600     MOVE "298299300" TO CORRECT-A.                               NC1344.2 127
   000554         055700     PERFORM FAIL.                                                NC1344.2 253
   000555         055800     GO TO TABTEST-11B.                                           NC1344.2 558
   000556         055900 TABTEST-11A.                                                     NC1344.2
   000557         056000     PERFORM DE-LETE.                                             NC1344.2 254
   000558         056100 TABTEST-11B.                                                     NC1344.2
   000559         056200     MOVE "TABTEST-11" TO PAR-NAME.                               NC1344.2 102
   000560         056300*    NOTE SIGNED NUMERIC LITERALS AS SUBSCRIPTS.                  NC1344.2
   000561         056400     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000562         056500 TABTEST-12.                                                      NC1344.2
   000563         056600     MOVE 1 TO W-1.                                               NC1344.2 66
   000564         056700     IF YEAR-1 (W-1  +1) EQUAL TO "001002003"                     NC1344.2 87 66
   000565      1  056800             PERFORM PASS                                         NC1344.2 252
   000566      1  056900             GO TO TABTEST-12B.                                   NC1344.2 573
   000567         057000     MOVE YEAR-1 (W-1  +1) TO COMPUTED-A.                         NC1344.2 87 66 113
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057100     MOVE "001002003" TO CORRECT-A.                               NC1344.2 127
   000569         057200     PERFORM FAIL.                                                NC1344.2 253
   000570         057300     GO TO TABTEST-12B.                                           NC1344.2 573
   000571         057400 TABTEST-12A.                                                     NC1344.2
   000572         057500     PERFORM DE-LETE.                                             NC1344.2 254
   000573         057600 TABTEST-12B.                                                     NC1344.2
   000574         057700     MOVE "TABTEST-12" TO PAR-NAME.                               NC1344.2 102
   000575         057800*    NOTE SIGNED NUMERIC LITERAL AND                              NC1344.2
   000576         057900*          UNSIGNED NUMERIC ITEM AS SUBSCRIPTS.                   NC1344.2
   000577         058000     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000578         058100 TABTEST-13.                                                      NC1344.2
   000579         058200     IF ANIMAL (+8  +1  +3) EQUAL TO 213                          NC1344.2 88
   000580      1  058300             PERFORM PASS                                         NC1344.2 252
   000581      1  058400             GO TO TABTEST-13B.                                   NC1344.2 588
   000582         058500     MOVE ANIMAL (+8  +1   +3) TO COMPUTED-A.                     NC1344.2 88 113
   000583         058600     MOVE "213" TO CORRECT-A.                                     NC1344.2 127
   000584         058700     PERFORM FAIL.                                                NC1344.2 253
   000585         058800     GO TO TABTEST-13B.                                           NC1344.2 588
   000586         058900 TABTEST-13A.                                                     NC1344.2
   000587         059000     PERFORM DE-LETE.                                             NC1344.2 254
   000588         059100 TABTEST-13B.                                                     NC1344.2
   000589         059200     MOVE "TABTEST-13" TO PAR-NAME.                               NC1344.2 102
   000590         059300*    NOTE SIGNED NUMERIC LITERALS AS SUBSCRIPTS.                  NC1344.2
   000591         059400     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000592         059500 TABTEST-14.                                                      NC1344.2
   000593         059600     MOVE 1 TO W-2.                                               NC1344.2 67
   000594         059700     IF ANIMAL (+8  W-2  +3) EQUAL TO 213                         NC1344.2 88 67
   000595      1  059800             PERFORM PASS                                         NC1344.2 252
   000596      1  059900             GO TO TABTEST-14B.                                   NC1344.2 603
   000597         060000     MOVE ANIMAL (+8  W-2  +3) TO COMPUTED-A.                     NC1344.2 88 67 113
   000598         060100     MOVE "213" TO CORRECT-A.                                     NC1344.2 127
   000599         060200     PERFORM FAIL.                                                NC1344.2 253
   000600         060300     GO TO TABTEST-14B.                                           NC1344.2 603
   000601         060400 TABTEST-14A.                                                     NC1344.2
   000602         060500     PERFORM DE-LETE.                                             NC1344.2 254
   000603         060600 TABTEST-14B.                                                     NC1344.2
   000604         060700     MOVE "TABTEST-14" TO PAR-NAME.                               NC1344.2 102
   000605         060800*    NOTE SIGNED NUMERIC LITERALS AND                             NC1344.2
   000606         060900*         UNSIGNED NUMERIC ITEM AS SUBSCRIPTS.                    NC1344.2
   000607         061000     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000608         061100 TABTEST-15.                                                      NC1344.2
   000609         061200     MOVE 8 TO W-1.                                               NC1344.2 66
   000610         061300     MOVE 3 TO W-3.                                               NC1344.2 68
   000611         061400     IF ANIMAL (W-1  +1  W-3) EQUAL TO 213                        NC1344.2 88 66 68
   000612      1  061500             PERFORM PASS                                         NC1344.2 252
   000613      1  061600             GO TO TABTEST-15B.                                   NC1344.2 620
   000614         061700     MOVE ANIMAL (W-1  +1  W-3) TO COMPUTED-A.                    NC1344.2 88 66 68 113
   000615         061800     MOVE "213" TO CORRECT-A.                                     NC1344.2 127
   000616         061900     PERFORM FAIL.                                                NC1344.2 253
   000617         062000     GO TO TABTEST-15B.                                           NC1344.2 620
   000618         062100 TABTEST-15A.                                                     NC1344.2
   000619         062200     PERFORM DE-LETE.                                             NC1344.2 254
   000620         062300 TABTEST-15B.                                                     NC1344.2
   000621         062400     MOVE "TABTEST-15" TO PAR-NAME.                               NC1344.2 102
   000622         062500*    NOTE UNSIGNED NUMERIC ITEMS AND SIGNED NUMERIC LITERAL       NC1344.2
   000623         062600     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000624         062700 TABINIT-16.                                                      NC1344.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062800*    ==-->  RELATIVE SUBSCRIPTING  <--==                          NC1344.2
   000626         062900     MOVE   "IV-22 4.3.8.4 GR4" TO ANSI-REFERENCE.                NC1344.2 158
   000627         063000     MOVE 1  TO W-1.                                              NC1344.2 66
   000628         063100     MOVE 20 TO W-2.                                              NC1344.2 67
   000629         063200     MOVE 5  TO W-3.                                              NC1344.2 68
   000630         063300 TABTEST-16.                                                      NC1344.2
   000631         063400     IF      ANIMAL (W-3 + 5  W-2 - 10  W-1 + 2) = 300            NC1344.2 88 68 67 66
   000632      1  063500             PERFORM PASS                                         NC1344.2 252
   000633         063600     ELSE                                                         NC1344.2
   000634      1  063700             GO TO TTST-161.                                      NC1344.2 636
   000635         063800     GO TO TTST-162.                                              NC1344.2 640
   000636         063900 TTST-161.                                                        NC1344.2
   000637         064000     PERFORM FAIL.                                                NC1344.2 253
   000638         064100     MOVE    ANIMAL (W-3 + 5  W-2 - 10  W-1 + 2) TO COMPUTED-A.   NC1344.2 88 68 67 66 113
   000639         064200     MOVE "300" TO CORRECT-A.                                     NC1344.2 127
   000640         064300 TTST-162.                                                        NC1344.2
   000641         064400     MOVE "TABTEST-16" TO PAR-NAME.                               NC1344.2 102
   000642         064500     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000643         064600 TABINIT-17.                                                      NC1344.2
   000644         064700*    ==-->  RELATIVE SUBSCRIPTING  <--==                          NC1344.2
   000645         064800     MOVE   "IV-22 4.3.8.4 GR4" TO ANSI-REFERENCE.                NC1344.2 158
   000646         064900     MOVE   9 TO W-1.                                             NC1344.2 66
   000647         065000     MOVE   6 TO W-2.                                             NC1344.2 67
   000648         065100     MOVE 999 TO W-3.                                             NC1344.2 68
   000649         065200 TABTEST-17.                                                      NC1344.2
   000650         065300     IF      ANIMAL (W-1 - 7  W-2 + 1 W-3 - 998) EQUAL TO 49      NC1344.2 88 66 67 68
   000651      1  065400             PERFORM PASS                                         NC1344.2 252
   000652         065500     ELSE                                                         NC1344.2
   000653      1  065600             GO TO   TTST-171.                                    NC1344.2 655
   000654         065700     GO TO   TTST-172.                                            NC1344.2 659
   000655         065800 TTST-171.                                                        NC1344.2
   000656         065900     PERFORM FAIL.                                                NC1344.2 253
   000657         066000     MOVE    ANIMAL (W-1 - 7  W-2 + 1 W-3 - 998) TO COMPUTED-A.   NC1344.2 88 66 67 68 113
   000658         066100     MOVE "049" TO CORRECT-A.                                     NC1344.2 127
   000659         066200 TTST-172.                                                        NC1344.2
   000660         066300     MOVE "TABTEST-17" TO PAR-NAME.                               NC1344.2 102
   000661         066400     PERFORM PRINT-DETAIL.                                        NC1344.2 256
   000662         066500*    USED AS SUBSCRIPT.                                           NC1344.2
   000663         066600 WRITE-TABLE.                                                     NC1344.2
   000664         066700     PERFORM BLANK-LINE-PRINT 2 TIMES.                            NC1344.2 329
   000665         066800     MOVE 1 TO SUBSCRIPT-3                                        NC1344.2 84
   000666         066900     MOVE  1  TO SUBSCRIPT-2.                                     NC1344.2 83
   000667         067000     MOVE  1  TO  SUBSCRIPT-1.                                    NC1344.2 82
   000668         067100     MOVE 1 TO CTR-1                                              NC1344.2 81
   000669         067200     PERFORM PRINT-TABLE THROUGH END-TAB 300 TIMES.               NC1344.2 673 687
   000670         067300     GO TO EXIT-NOTE.                                             NC1344.2 671
   000671         067400 EXIT-NOTE.                                                       NC1344.2
   000672         067500     GO TO FIN-WRAPUP.                                            NC1344.2 705
   000673         067600 PRINT-TABLE.                                                     NC1344.2
   000674         067700     MOVE ANIMAL (SUBSCRIPT-1  SUBSCRIPT-2  SUBSCRIPT-3) TO       NC1344.2 88 82 83 84
   000675         067800     PRINT-ELE (CTR-1).                                           NC1344.2 93 81
   000676         067900     ADD 1 TO CTR-1                                               NC1344.2 81
   000677         068000     IF CTR-1 EQUAL TO 21 PERFORM TABLE-DUMP.                     NC1344.2 81 413
   000678         068100     ADD 1 TO SUBSCRIPT-3.                                        NC1344.2 84
   000679         068200     IF SUBSCRIPT-3 GREATER THAN 3 GO TO CCCC ELSE GO TO END-TAB. NC1344.2 84 680 687
   000680         068300 CCCC.                                                            NC1344.2
   000681         068400     ADD 1 TO  SUBSCRIPT-2                                        NC1344.2 83
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068500     MOVE 1 TO SUBSCRIPT-3.                                       NC1344.2 84
   000683         068600     IF SUBSCRIPT-2 GREATER THAN 10 GO TO DDD ELSE GO TO END-TAB. NC1344.2 83 684 687
   000684         068700 DDD.                                                             NC1344.2
   000685         068800     ADD 1 TO SUBSCRIPT-1.                                        NC1344.2 82
   000686         068900     MOVE 1 TO SUBSCRIPT-2.                                       NC1344.2 83
   000687         069000 END-TAB.                                                         NC1344.2
   000688         069100     EXIT.                                                        NC1344.2
   000689         069200                                                                  NC1344.2
   000690         069300 TABLE-BUILD-2.                                                   NC1344.2
   000691         069400     MOVE W-3 TO ANIMAL (SUBSCRIPT-1  SUBSCRIPT-2  SUBSCRIPT-3).  NC1344.2 68 88 82 83 84
   000692         069500     ADD 01 TO W-3.                                               NC1344.2 68
   000693         069600     ADD 01 TO SUBSCRIPT-3.                                       NC1344.2 84
   000694         069700     IF SUBSCRIPT-3 IS GREATER THAN 3 GO TO   AAAA ELSE GO TO     NC1344.2 84 696
   000695         069800     FINE.                                                        NC1344.2 703
   000696         069900 AAAA.                                                            NC1344.2
   000697         070000     ADD 1 TO SUBSCRIPT-2.                                        NC1344.2 83
   000698         070100     MOVE  1   TO SUBSCRIPT-3.                                    NC1344.2 84
   000699         070200     IF SUBSCRIPT-2 IS GREATER THAN 10 GO TO BBB ELSE GO TO FINE. NC1344.2 83 700 703
   000700         070300 BBB.                                                             NC1344.2
   000701         070400     ADD 1 TO SUBSCRIPT-1.                                        NC1344.2 82
   000702         070500     MOVE   1   TO  SUBSCRIPT-2.                                  NC1344.2 83
   000703         070600 FINE.                                                            NC1344.2
   000704         070700     EXIT.                                                        NC1344.2
   000705         070800 FIN-WRAPUP.                                                      NC1344.2
   000706         070900     EXIT.                                                        NC1344.2
   000707         071000 END-JOB.                                                         NC1344.2
   000708         071100 CCVS-EXIT SECTION.                                               NC1344.2

 ==000708==> IGYPS2015-I The paragraph or section prior to paragraph or section "CCVS-EXIT" did
                         not contain any statements.

   000709         071200 CCVS-999999.                                                     NC1344.2
   000710         071300     GO TO CLOSE-FILES.                                           NC1344.2 245
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    16
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       39   A-NAME-30-CHARACTERS-IN-LENGTH
       88   ANIMAL . . . . . . . . . . . .  425 430 439 444 453 458 464 469 478 483 513 518 526 531 579 582 594 597 611 614
                                            631 638 650 657 674 M691
      158   ANSI-REFERENCE . . . . . . . .  335 342 351 M359 M626 M645
       92   BLANKSPACE . . . . . . . . . .  M407
      137   CCVS-C-1 . . . . . . . . . . .  274 320
      142   CCVS-C-2 . . . . . . . . . . .  275 321
      192   CCVS-E-1 . . . . . . . . . . .  280
      197   CCVS-E-2 . . . . . . . . . . .  289 296 303 308
      200   CCVS-E-2-2 . . . . . . . . . .  M288
      205   CCVS-E-3 . . . . . . . . . . .  309
      214   CCVS-E-4 . . . . . . . . . . .  288
      215   CCVS-E-4-1 . . . . . . . . . .  M286
      217   CCVS-E-4-2 . . . . . . . . . .  M287
      159   CCVS-H-1 . . . . . . . . . . .  269 316
      164   CCVS-H-2A. . . . . . . . . . .  270 317
      173   CCVS-H-2B. . . . . . . . . . .  271 318
      185   CCVS-H-3 . . . . . . . . . . .  272 319
      235   CCVS-PGM-ID. . . . . . . . . .  241 241
      119   CM-18V0
      113   COMPUTED-A . . . . . . . . . .  114 116 117 118 119 347 350 M370 M381 M391 M430 M444 M458 M469 M483 M494 M504
                                            M518 M531 M543 M552 M567 M582 M597 M614 M638 M657
      114   COMPUTED-N
      112   COMPUTED-X . . . . . . . . . .  M264 332
      116   COMPUTED-0V18
      118   COMPUTED-14V4
      120   COMPUTED-18V0
      117   COMPUTED-4V14
      136   COR-ANSI-REFERENCE . . . . . .  M342 M344
      127   CORRECT-A. . . . . . . . . . .  128 129 130 131 132 348 350 M371 M382 M392 M431 M445 M459 M470 M484 M495 M505
                                            M519 M532 M544 M553 M568 M583 M598 M615 M639 M658
      128   CORRECT-N
      126   CORRECT-X. . . . . . . . . . .  M265 334
      129   CORRECT-0V18
      131   CORRECT-14V4
      133   CORRECT-18V0
      130   CORRECT-4V14
      132   CR-18V0
       81   CTR-1. . . . . . . . . . . . .  M398 406 407 M409 410 M417 M668 675 M676 677
       54   D-1
       63   D-10
       64   D-11
       65   D-12
       55   D-2
       56   D-3
       57   D-4
       58   D-5
       59   D-6
       60   D-7
       61   D-8
       62   D-9
      150   DELETE-COUNTER . . . . . . . .  M254 283 299 301
      105   DOTVALUE . . . . . . . . . . .  M259
      156   DUMMY-HOLD . . . . . . . . . .  M313 323
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    17
0 Defined   Cross-reference of data names   References

0      37   DUMMY-RECORD . . . . . . . . .  M269 M270 M271 M272 M274 M275 M276 M278 M280 M289 M296 M303 M308 M309 313 M314
                                            315 M316 M317 M318 M319 M320 M321 M322 M323 327 M328 M337 M352
       48   EIGHT
      203   ENDER-DESC . . . . . . . . . .  M291 M302 M307
      151   ERROR-COUNTER. . . . . . . . .  M253 282 292 295
      155   ERROR-HOLD . . . . . . . . . .  M282 M283 M283 M284 287
      201   ERROR-TOTAL. . . . . . . . . .  M293 M295 M300 M301 M305 M306
       98   FEATURE. . . . . . . . . . . .  M364
       51   FIFTEEN
       45   FIVE
       44   FOUR
      229   HYPHEN-LINE. . . . . . . . . .  276 278 322
      195   ID-AGAIN . . . . . . . . . . .  M241
      228   INF-ANSI-REFERENCE . . . . . .  M335 M338 M351 M353
      223   INFO-TEXT. . . . . . . . . . .  M336
      152   INSPECT-COUNTER. . . . . . . .  M251 282 304 306
       91   LINE-1
       40   LONG-PICTURE
       49   NINE
       89   NUMBER-LIST. . . . . . . . . .  415
       41   ONE
      100   P-OR-F . . . . . . . . . . . .  M251 M252 M253 M254 261 M264
      102   PAR-NAME . . . . . . . . . . .  M266 M373 M384 M394 M433 M447 M461 M472 M486 M497 M508 M521 M534 M546 M559 M574
                                            M589 M604 M621 M641 M660
      104   PARDOT-X . . . . . . . . . . .  M258
      153   PASS-COUNTER . . . . . . . . .  M252 284 286
       93   PRINT-ELE. . . . . . . . . . .  M406 M675
       35   PRINT-FILE . . . . . . . . . .  31 240 246
       36   PRINT-REC. . . . . . . . . . .  M260 M341 M343 M414 M415
      107   RE-MARK. . . . . . . . . . . .  M255 M267
      149   REC-CT . . . . . . . . . . . .  257 259 266
      148   REC-SKL-SUB
      157   RECORD-COUNT . . . . . . . . .  M311 312 M324
       47   SEVEN
       46   SIX
       86   STATE-1
       82   SUBSCRIPT-1. . . . . . . . . .  M360 402 M403 M419 M667 674 M685 691 M701
       83   SUBSCRIPT-2. . . . . . . . . .  M397 406 M408 M420 M666 674 M681 683 M686 691 M697 699 M702
       84   SUBSCRIPT-3. . . . . . . . . .  M421 M665 674 M678 679 M682 691 M693 694 M698
       95   TAB-ELE. . . . . . . . . . . .  366 370 376 381 387 391 M402 406
       94   TABLE-1
       85   TABLE-10
       50   TEN
      108   TEST-COMPUTED. . . . . . . . .  341
      123   TEST-CORRECT . . . . . . . . .  343
      176   TEST-ID. . . . . . . . . . . .  M241
       96   TEST-RESULTS . . . . . . . . .  M242 260
       43   THREE
      154   TOTAL-ERROR
       52   TWENTY
       53   TWENTY-5 . . . . . . . . . . .  376 381
       42   TWO
       66   W-1. . . . . . . . . . . . . .  M436 439 444 M452 453 458 M475 478 483 M511 513 518 M524 526 531 M537 538 543
                                            M563 564 567 M609 611 614 M627 631 638 M646 650 657
       75   W-10
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    18
0 Defined   Cross-reference of data names   References

0      76   W-11
       77   W-12
       78   W-13
       79   W-14
       67   W-2. . . . . . . . . . . . . .  M437 439 444 M451 453 458 M476 478 483 M512 513 518 M593 594 597 M628 631 638
                                            M647 650 657
       68   W-3. . . . . . . . . . . . . .  M361 402 M404 M422 M438 439 444 M450 453 458 M477 478 483 M525 526 531 M610 611
                                            614 M629 631 638 M648 650 657 691 M692
       69   W-4
       70   W-5
       71   W-6
       72   W-7
       73   W-8
       74   W-9
       80   XRAY
      225   XXCOMPUTED . . . . . . . . . .  M350
      227   XXCORRECT. . . . . . . . . . .  M350
      220   XXINFO . . . . . . . . . . . .  337 352
       87   YEAR-1 . . . . . . . . . . . .  489 494 500 504 538 543 549 552 564 567
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    19
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

      696   AAAA . . . . . . . . . . . . .  G694
      346   BAIL-OUT . . . . . . . . . . .  P263
      354   BAIL-OUT-EX. . . . . . . . . .  E263 G348
      349   BAIL-OUT-WRITE . . . . . . . .  G347
      700   BBB. . . . . . . . . . . . . .  G699
      329   BLANK-LINE-PRINT . . . . . . .  P664
      401   BUILD-TABLE. . . . . . . . . .  P362
      680   CCCC . . . . . . . . . . . . .  G679
      708   CCVS-EXIT
      709   CCVS-999999
      238   CCVS1
      355   CCVS1-EXIT . . . . . . . . . .  G244
      245   CLOSE-FILES. . . . . . . . . .  G710
      273   COLUMN-NAMES-ROUTINE . . . . .  E243
      418   CONSTRUCTION . . . . . . . . .  G400
      684   DDD. . . . . . . . . . . . . .  G683
      254   DE-LETE. . . . . . . . . . . .  P557 P572 P587 P602 P619
      707   END-JOB
      411   END-OF . . . . . . . . . . . .  E399
      277   END-ROUTINE. . . . . . . . . .  P246
      281   END-ROUTINE-1
      290   END-ROUTINE-12
      298   END-ROUTINE-13 . . . . . . . .  E246
      279   END-RTN-EXIT
      687   END-TAB. . . . . . . . . . . .  E669 G679 G683
      671   EXIT-NOTE. . . . . . . . . . .  G670
      253   FAIL . . . . . . . . . . . . .  P369 P380 P390 P429 P443 P457 P468 P482 P493 P506 P517 P530 P542 P554 P569 P584
                                            P599 P616 P637 P656
      331   FAIL-ROUTINE . . . . . . . . .  P262
      345   FAIL-ROUTINE-EX. . . . . . . .  E262 G339
      340   FAIL-ROUTINE-WRITE . . . . . .  G333 G334
      705   FIN-WRAPUP . . . . . . . . . .  G672
      703   FINE . . . . . . . . . . . . .  E423 G695 G699
      268   HEAD-ROUTINE . . . . . . . . .  P243
      251   INSPT
      358   NC-05-001
      239   OPEN-FILES
      252   PASS . . . . . . . . . . . . .  P366 P376 P387 P425 P439 P453 P464 P478 P489 P500 P513 P526 P538 P550 P565 P580
                                            P595 P612 P632 P651
      256   PRINT-DETAIL . . . . . . . . .  P374 P385 P395 P434 P448 P462 P473 P487 P498 P509 P522 P535 P547 P561 P577 P591
                                            P607 P623 P642 P661
      673   PRINT-TABLE. . . . . . . . . .  P669
      357   SECT-NC134A-001
      624   TABINIT-16
      643   TABINIT-17
      690   TABLE-BUILD-2. . . . . . . . .  P423
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    20
0 Defined   Cross-reference of procedures   References

0     413   TABLE-DUMP . . . . . . . . . .  P410 P677
      405   TABLE-WRITE. . . . . . . . . .  P399
      424   TABTEST-1
      536   TABTEST-10
      548   TABTEST-11
      556   TABTEST-11A
      558   TABTEST-11B. . . . . . . . . .  G551 G555
      562   TABTEST-12
      571   TABTEST-12A
      573   TABTEST-12B. . . . . . . . . .  G566 G570
      578   TABTEST-13
      586   TABTEST-13A
      588   TABTEST-13B. . . . . . . . . .  G581 G585
      592   TABTEST-14
      601   TABTEST-14A
      603   TABTEST-14B. . . . . . . . . .  G596 G600
      608   TABTEST-15
      618   TABTEST-15A
      620   TABTEST-15B. . . . . . . . . .  G613 G617
      630   TABTEST-16
      649   TABTEST-17
      435   TABTEST-2
      449   TABTEST-3
      463   TABTEST-4
      474   TABTEST-5
      488   TABTEST-6
      499   TABTEST-7
      510   TABTEST-8
      523   TABTEST-9
      249   TERMINATE-CALL
      247   TERMINATE-CCVS
      365   TEST-1
      375   TEST-2
      386   TEST-3
      368   TST-11 . . . . . . . . . . . .  G366
      372   TST-12 . . . . . . . . . . . .  G367
      379   TST-21 . . . . . . . . . . . .  G377
      383   TST-22 . . . . . . . . . . . .  G378
      389   TST-31 . . . . . . . . . . . .  G387
      393   TST-32 . . . . . . . . . . . .  G388
      541   TTST-101 . . . . . . . . . . .  G539
      545   TTST-102 . . . . . . . . . . .  G540
      428   TTST-11. . . . . . . . . . . .  G426
      432   TTST-12. . . . . . . . . . . .  G427
      636   TTST-161 . . . . . . . . . . .  G634
      640   TTST-162 . . . . . . . . . . .  G635
      655   TTST-171 . . . . . . . . . . .  G653
      659   TTST-172 . . . . . . . . . . .  G654
      442   TTST-21. . . . . . . . . . . .  G440
      446   TTST-22. . . . . . . . . . . .  G441
      456   TTST-31. . . . . . . . . . . .  G454
      460   TTST-32. . . . . . . . . . . .  G455
      467   TTST-41. . . . . . . . . . . .  G465
      471   TTST-42. . . . . . . . . . . .  G466
      481   TTST-51. . . . . . . . . . . .  G479
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    21
0 Defined   Cross-reference of procedures   References

0     485   TTST-52. . . . . . . . . . . .  G480
      492   TTST-61. . . . . . . . . . . .  G490
      496   TTST-62. . . . . . . . . . . .  G491
      503   TTST-71. . . . . . . . . . . .  G501
      507   TTST-72. . . . . . . . . . . .  G502
      516   TTST-81. . . . . . . . . . . .  G514
      520   TTST-82. . . . . . . . . . . .  G515
      529   TTST-91. . . . . . . . . . . .  G527
      533   TTST-92. . . . . . . . . . . .  G528
      310   WRITE-LINE . . . . . . . . . .  P260 P261 P269 P270 P271 P272 P274 P275 P276 P278 P280 P289 P297 P303 P308 P309
                                            P337 P341 P343 P352 P416
      663   WRITE-TABLE
      396   WRITE-TABLE-OUT
      326   WRT-LN . . . . . . . . . . . .  P316 P317 P318 P319 P320 P321 P322 P325 P330
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    22
0 Defined   Cross-reference of programs     References

        3   NC134A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC134A    Date 06/04/2022  Time 11:59:39   Page    23
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    708  IGYPS2015-I   The paragraph or section prior to paragraph or section "CCVS-EXIT" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       2           2
-* Statistics for COBOL program NC134A:
 *    Source records = 710
 *    Data Division statements = 119
 *    Procedure Division statements = 414
 *    Generated COBOL statements = 0
 *    Program complexity factor = 421
0End of compilation 1,  program NC134A,  highest severity 0.
0Return code 0
