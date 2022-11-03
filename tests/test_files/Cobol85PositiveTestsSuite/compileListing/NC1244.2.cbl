1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:43   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:43   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC1244.2
   000002         000200 PROGRAM-ID.                                                      NC1244.2
   000003         000300                                                                  NC1244.2
   000004         000400     NC124A.                                                      NC1244.2
   000005         000600*                                                              *  NC1244.2
   000006         000700*    VALIDATION FOR:-                                          *  NC1244.2
   000007         000800*                                                              *  NC1244.2
   000008         000900*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1244.2
   000009         001000*                                                              *  NC1244.2
   000010         001100*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1244.2
   000011         001200*                                                              *  NC1244.2
   000012         001400*                                                              *  NC1244.2
   000013         001500*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC1244.2
   000014         001600*                                                              *  NC1244.2
   000015         001700*        X-55  - SYSTEM PRINTER NAME.                          *  NC1244.2
   000016         001800*        X-82  - SOURCE COMPUTER NAME.                         *  NC1244.2
   000017         001900*        X-83  - OBJECT COMPUTER NAME.                         *  NC1244.2
   000018         002000*                                                              *  NC1244.2
   000019         002200*                                                                 NC1244.2
   000020         002300*               PROGRAM NC124A TESTS THE USE OF                   NC1244.2
   000021         002400*            PICTURE CHARACTERS P, S, +, -, Z AND *.              NC1244.2
   000022         002500*                                                                 NC1244.2
   000023         002600 ENVIRONMENT DIVISION.                                            NC1244.2
   000024         002700 CONFIGURATION SECTION.                                           NC1244.2
   000025         002800 SOURCE-COMPUTER.                                                 NC1244.2
   000026         002900     XXXXX082.                                                    NC1244.2
   000027         003000 OBJECT-COMPUTER.                                                 NC1244.2
   000028         003100     XXXXX083.                                                    NC1244.2
   000029         003200 INPUT-OUTPUT SECTION.                                            NC1244.2
   000030         003300 FILE-CONTROL.                                                    NC1244.2
   000031         003400     SELECT PRINT-FILE ASSIGN TO                                  NC1244.2 35
   000032         003500     XXXXX055.                                                    NC1244.2
   000033         003600 DATA DIVISION.                                                   NC1244.2
   000034         003700 FILE SECTION.                                                    NC1244.2
   000035         003800 FD  PRINT-FILE.                                                  NC1244.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         003900 01  PRINT-REC PICTURE X(120).                                    NC1244.2
   000037         004000 01  DUMMY-RECORD PICTURE X(120).                                 NC1244.2
   000038         004100 WORKING-STORAGE SECTION.                                         NC1244.2
   000039         004200 01  WORK-AREA-1                 PICTURE 9       VALUE 0.         NC1244.2
   000040         004300 01  WORK-AREA-2                 PICTURE 99      VALUE 12.        NC1244.2
   000041         004400 01  WORK-AREA-3                 PICTURE S99     VALUE -12.       NC1244.2
   000042         004500 01  WORK-AREA-4                 PICTURE S999    VALUE 123.       NC1244.2
   000043         004600 01  WORK-AREA-5                 PICTURE S999    VALUE -123.      NC1244.2
   000044         004700 01  WORK-AREA-6                 PICTURE 9999    VALUE 1234.      NC1244.2
   000045         004800 01  WORK-AREA-7                 PICTURE S9999   VALUE -1234.     NC1244.2
   000046         004900 01  WORK-AREA-8                 PICTURE S99V99  VALUE 12.34.     NC1244.2
   000047         005000 01  WORK-AREA-9                 PICTURE S99V99  VALUE -12.34.    NC1244.2
   000048         005100 01  WORK-AREA-10                PICTURE 9       VALUE 0.         NC1244.2
   000049         005200 01  WORK-AREA-11                PICTURE V99     VALUE .02.       NC1244.2
   000050         005300 01  WORK-AREA-12                PICTURE 99      VALUE 12.        NC1244.2
   000051         005400 01  WORK-AREA-13                PICTURE 99V99   VALUE 12.34.     NC1244.2
   000052         005500 01  WORK-AREA-14                PICTURE 9999    VALUE 1234.      NC1244.2
   000053         005600 01  WORK-AREA-15                PICTURE 9999V99 VALUE 1234.56.   NC1244.2
   000054         005700 01  WORK-AREA-16                PICTURE 9       VALUE 0.         NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005800 01  WORK-AREA-17                PICTURE 99      VALUE 13.        NC1244.2
   000056         005900 01  WORK-AREA-18                PICTURE 999     VALUE 123.       NC1244.2
   000057         006000 01  WORK-AREA-19                PICTURE 9999    VALUE 2010.      NC1244.2
   000058         006100 01  WORK-AREA-20                PICTURE 9999V9  VALUE 1010.2.    NC1244.2
   000059         006200 01  WORK-AREA-21                PICTURE V99     VALUE .01.       NC1244.2
   000060         006300 01  WORK-AREA-22                PICTURE 9       VALUE 0.         NC1244.2
   000061         006400 01  WORK-AREA-23                PICTURE 9V99    VALUE 1.01.      NC1244.2
   000062         006500 01  WORK-AREA-24                PICTURE 999V    VALUE 217.       NC1244.2
   000063         006600 01  WORK-AREA-25                PICTURE 9999V99 VALUE 1010.20.   NC1244.2
   000064         006700 01  WORK-AREA-26                PICTURE V99     VALUE .01.       NC1244.2
   000065         006800 01  WORK-AREA-27                PICTURE S9PP    VALUE 200.       NC1244.2
   000066         006900 01  WORK-AREA-27A               PICTURE X(3)    VALUE SPACE.     NC1244.2 IMP
   000067         007000 01  WORK-AREA-28                PICTURE 999     VALUE 567.       NC1244.2
   000068         007100 01  WORK-AREA-28A               PICTURE S9PP    VALUE ZERO.      NC1244.2 IMP
   000069         007200 01  WORK-AREA-29                PICTURE 999     VALUE 123.       NC1244.2
   000070         007300 01  WORK-AREA-29A               PICTURE 9PP     VALUE ZERO.      NC1244.2 IMP
   000071         007400 01  WORK-AREA-29B               PICTURE X(3)    VALUE SPACE.     NC1244.2 IMP
   000072         007500 01  WORK-AREA-30                PICTURE 999PP   VALUE 00900.     NC1244.2
   000073         007600 01  WORK-AREA-30A               PICTURE ZZZPP   VALUE ZERO.      NC1244.2 IMP
   000074         007700 01  WORK-AREA-31                PICTURE 999PP   VALUE 01200.     NC1244.2
   000075         007800 01  WORK-AREA-31A               PICTURE ZZZPP   VALUE ZERO.      NC1244.2 IMP
   000076         007900 01  WORK-AREA-31B               PICTURE X(5)    VALUE SPACE.     NC1244.2 IMP
   000077         008000 01  WORK-AREA-32                PICTURE PP9     VALUE .001.      NC1244.2
   000078         008100 01  WORK-AREA-32A               PICTURE V999    VALUE ZERO.      NC1244.2 IMP
   000079         008200 01  WORK-AREA-33                PICTURE V999    VALUE .567.      NC1244.2
   000080         008300 01  WORK-AREA-33A               PICTURE PP9     VALUE ZERO.      NC1244.2 IMP
   000081         008400 01  WORK-AREA-34                PICTURE V999    VALUE .123.      NC1244.2
   000082         008500 01  WORK-AREA-34A               PICTURE PP9     VALUE ZERO.      NC1244.2 IMP
   000083         008600 01  WORK-AREA-34B               PICTURE V999    VALUE ZERO.      NC1244.2 IMP
   000084         008700 01  EDIT-AREA-1                 PICTURE +9999.                   NC1244.2
   000085         008800 01  EDIT-AREA-2                 PICTURE -9999.                   NC1244.2
   000086         008900 01  EDIT-AREA-3                 PICTURE ++++9.                   NC1244.2
   000087         009000 01  EDIT-AREA-4                 PICTURE ----9.                   NC1244.2
   000088         009100 01  EDIT-AREA-5                 PICTURE +++++.                   NC1244.2
   000089         009200 01  EDIT-AREA-6                 PICTURE -----.                   NC1244.2
   000090         009300 01  EDIT-AREA-7                 PICTURE +++++.++.                NC1244.2
   000091         009400 01  EDIT-AREA-8                 PICTURE --,---.--.               NC1244.2
   000092         009500 01  EDIT-AREA-9                 PICTURE $$99.                    NC1244.2
   000093         009600 01  EDIT-AREA-10                PICTURE $$$$9.                   NC1244.2
   000094         009700 01  EDIT-AREA-11                PICTURE $$$$$.99.                NC1244.2
   000095         009800 01  EDIT-AREA-12                PICTURE $$,$$$.$$.               NC1244.2
   000096         009900 01  EDIT-AREA-13                PICTURE *999.                    NC1244.2
   000097         010000 01  EDIT-AREA-14                PICTURE **99.                    NC1244.2
   000098         010100 01  EDIT-AREA-15                PICTURE ***9.                    NC1244.2
   000099         010200 01  EDIT-AREA-16                PICTURE **.**.                   NC1244.2
   000100         010300 01  EDIT-AREA-17                PICTURE *,***.**.                NC1244.2
   000101         010400 01  EDIT-AREA-18                PICTURE 9999.                    NC1244.2
   000102         010500 01  EDIT-AREA-19                PICTURE Z999.                    NC1244.2
   000103         010600 01  EDIT-AREA-20                PICTURE ZZ99.                    NC1244.2
   000104         010700 01  EDIT-AREA-21                PICTURE ZZZ9.                    NC1244.2
   000105         010800 01  EDIT-AREA-22                PICTURE ZZZZ.                    NC1244.2
   000106         010900 01  EDIT-AREA-23                PICTURE ZZ.ZZ.                   NC1244.2
   000107         011000 01  EDIT-AREA-24                PICTURE Z,ZZZ.                   NC1244.2
   000108         011100 01  TEST-RESULTS.                                                NC1244.2
   000109         011200     02 FILLER                   PIC X      VALUE SPACE.          NC1244.2 IMP
   000110         011300     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC1244.2 IMP
   000111         011400     02 FILLER                   PIC X      VALUE SPACE.          NC1244.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011500     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC1244.2 IMP
   000113         011600     02 FILLER                   PIC X      VALUE SPACE.          NC1244.2 IMP
   000114         011700     02  PAR-NAME.                                                NC1244.2
   000115         011800       03 FILLER                 PIC X(19)  VALUE SPACE.          NC1244.2 IMP
   000116         011900       03  PARDOT-X              PIC X      VALUE SPACE.          NC1244.2 IMP
   000117         012000       03 DOTVALUE               PIC 99     VALUE ZERO.           NC1244.2 IMP
   000118         012100     02 FILLER                   PIC X(8)   VALUE SPACE.          NC1244.2 IMP
   000119         012200     02 RE-MARK                  PIC X(61).                       NC1244.2
   000120         012300 01  TEST-COMPUTED.                                               NC1244.2
   000121         012400     02 FILLER                   PIC X(30)  VALUE SPACE.          NC1244.2 IMP
   000122         012500     02 FILLER                   PIC X(17)  VALUE                 NC1244.2
   000123         012600            "       COMPUTED=".                                   NC1244.2
   000124         012700     02 COMPUTED-X.                                               NC1244.2
   000125         012800     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC1244.2 IMP
   000126         012900     03 COMPUTED-N               REDEFINES COMPUTED-A             NC1244.2 125
   000127         013000                                 PIC -9(9).9(9).                  NC1244.2
   000128         013100     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC1244.2 125
   000129         013200     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC1244.2 125
   000130         013300     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC1244.2 125
   000131         013400     03       CM-18V0 REDEFINES COMPUTED-A.                       NC1244.2 125
   000132         013500         04 COMPUTED-18V0                    PIC -9(18).          NC1244.2
   000133         013600         04 FILLER                           PIC X.               NC1244.2
   000134         013700     03 FILLER PIC X(50) VALUE SPACE.                             NC1244.2 IMP
   000135         013800 01  TEST-CORRECT.                                                NC1244.2
   000136         013900     02 FILLER PIC X(30) VALUE SPACE.                             NC1244.2 IMP
   000137         014000     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC1244.2
   000138         014100     02 CORRECT-X.                                                NC1244.2
   000139         014200     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC1244.2 IMP
   000140         014300     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC1244.2 139
   000141         014400     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC1244.2 139
   000142         014500     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC1244.2 139
   000143         014600     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC1244.2 139
   000144         014700     03      CR-18V0 REDEFINES CORRECT-A.                         NC1244.2 139
   000145         014800         04 CORRECT-18V0                     PIC -9(18).          NC1244.2
   000146         014900         04 FILLER                           PIC X.               NC1244.2
   000147         015000     03 FILLER PIC X(2) VALUE SPACE.                              NC1244.2 IMP
   000148         015100     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC1244.2 IMP
   000149         015200 01  CCVS-C-1.                                                    NC1244.2
   000150         015300     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC1244.2
   000151         015400-    "SS  PARAGRAPH-NAME                                          NC1244.2
   000152         015500-    "       REMARKS".                                            NC1244.2
   000153         015600     02 FILLER                     PIC X(20)    VALUE SPACE.      NC1244.2 IMP
   000154         015700 01  CCVS-C-2.                                                    NC1244.2
   000155         015800     02 FILLER                     PIC X        VALUE SPACE.      NC1244.2 IMP
   000156         015900     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC1244.2
   000157         016000     02 FILLER                     PIC X(15)    VALUE SPACE.      NC1244.2 IMP
   000158         016100     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC1244.2
   000159         016200     02 FILLER                     PIC X(94)    VALUE SPACE.      NC1244.2 IMP
   000160         016300 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC1244.2 IMP
   000161         016400 01  REC-CT                        PIC 99       VALUE ZERO.       NC1244.2 IMP
   000162         016500 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC1244.2 IMP
   000163         016600 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC1244.2 IMP
   000164         016700 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC1244.2 IMP
   000165         016800 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC1244.2 IMP
   000166         016900 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC1244.2 IMP
   000167         017000 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC1244.2 IMP
   000168         017100 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC1244.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017200 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC1244.2 IMP
   000170         017300 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC1244.2 IMP
   000171         017400 01  CCVS-H-1.                                                    NC1244.2
   000172         017500     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1244.2 IMP
   000173         017600     02  FILLER                    PIC X(42)    VALUE             NC1244.2
   000174         017700     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC1244.2
   000175         017800     02  FILLER                    PIC X(39)    VALUE SPACES.     NC1244.2 IMP
   000176         017900 01  CCVS-H-2A.                                                   NC1244.2
   000177         018000   02  FILLER                        PIC X(40)  VALUE SPACE.      NC1244.2 IMP
   000178         018100   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC1244.2
   000179         018200   02  FILLER                        PIC XXXX   VALUE             NC1244.2
   000180         018300     "4.2 ".                                                      NC1244.2
   000181         018400   02  FILLER                        PIC X(28)  VALUE             NC1244.2
   000182         018500            " COPY - NOT FOR DISTRIBUTION".                       NC1244.2
   000183         018600   02  FILLER                        PIC X(41)  VALUE SPACE.      NC1244.2 IMP
   000184         018700                                                                  NC1244.2
   000185         018800 01  CCVS-H-2B.                                                   NC1244.2
   000186         018900   02  FILLER                        PIC X(15)  VALUE             NC1244.2
   000187         019000            "TEST RESULT OF ".                                    NC1244.2
   000188         019100   02  TEST-ID                       PIC X(9).                    NC1244.2
   000189         019200   02  FILLER                        PIC X(4)   VALUE             NC1244.2
   000190         019300            " IN ".                                               NC1244.2
   000191         019400   02  FILLER                        PIC X(12)  VALUE             NC1244.2
   000192         019500     " HIGH       ".                                              NC1244.2
   000193         019600   02  FILLER                        PIC X(22)  VALUE             NC1244.2
   000194         019700            " LEVEL VALIDATION FOR ".                             NC1244.2
   000195         019800   02  FILLER                        PIC X(58)  VALUE             NC1244.2
   000196         019900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1244.2
   000197         020000 01  CCVS-H-3.                                                    NC1244.2
   000198         020100     02  FILLER                      PIC X(34)  VALUE             NC1244.2
   000199         020200            " FOR OFFICIAL USE ONLY    ".                         NC1244.2
   000200         020300     02  FILLER                      PIC X(58)  VALUE             NC1244.2
   000201         020400     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC1244.2
   000202         020500     02  FILLER                      PIC X(28)  VALUE             NC1244.2
   000203         020600            "  COPYRIGHT   1985 ".                                NC1244.2
   000204         020700 01  CCVS-E-1.                                                    NC1244.2
   000205         020800     02 FILLER                       PIC X(52)  VALUE SPACE.      NC1244.2 IMP
   000206         020900     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC1244.2
   000207         021000     02 ID-AGAIN                     PIC X(9).                    NC1244.2
   000208         021100     02 FILLER                       PIC X(45)  VALUE SPACES.     NC1244.2 IMP
   000209         021200 01  CCVS-E-2.                                                    NC1244.2
   000210         021300     02  FILLER                      PIC X(31)  VALUE SPACE.      NC1244.2 IMP
   000211         021400     02  FILLER                      PIC X(21)  VALUE SPACE.      NC1244.2 IMP
   000212         021500     02 CCVS-E-2-2.                                               NC1244.2
   000213         021600         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC1244.2 IMP
   000214         021700         03 FILLER                   PIC X      VALUE SPACE.      NC1244.2 IMP
   000215         021800         03 ENDER-DESC               PIC X(44)  VALUE             NC1244.2
   000216         021900            "ERRORS ENCOUNTERED".                                 NC1244.2
   000217         022000 01  CCVS-E-3.                                                    NC1244.2
   000218         022100     02  FILLER                      PIC X(22)  VALUE             NC1244.2
   000219         022200            " FOR OFFICIAL USE ONLY".                             NC1244.2
   000220         022300     02  FILLER                      PIC X(12)  VALUE SPACE.      NC1244.2 IMP
   000221         022400     02  FILLER                      PIC X(58)  VALUE             NC1244.2
   000222         022500     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC1244.2
   000223         022600     02  FILLER                      PIC X(13)  VALUE SPACE.      NC1244.2 IMP
   000224         022700     02 FILLER                       PIC X(15)  VALUE             NC1244.2
   000225         022800             " COPYRIGHT 1985".                                   NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         022900 01  CCVS-E-4.                                                    NC1244.2
   000227         023000     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC1244.2 IMP
   000228         023100     02 FILLER                       PIC X(4)   VALUE " OF ".     NC1244.2
   000229         023200     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC1244.2 IMP
   000230         023300     02 FILLER                       PIC X(40)  VALUE             NC1244.2
   000231         023400      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC1244.2
   000232         023500 01  XXINFO.                                                      NC1244.2
   000233         023600     02 FILLER                       PIC X(19)  VALUE             NC1244.2
   000234         023700            "*** INFORMATION ***".                                NC1244.2
   000235         023800     02 INFO-TEXT.                                                NC1244.2
   000236         023900       04 FILLER                     PIC X(8)   VALUE SPACE.      NC1244.2 IMP
   000237         024000       04 XXCOMPUTED                 PIC X(20).                   NC1244.2
   000238         024100       04 FILLER                     PIC X(5)   VALUE SPACE.      NC1244.2 IMP
   000239         024200       04 XXCORRECT                  PIC X(20).                   NC1244.2
   000240         024300     02 INF-ANSI-REFERENCE           PIC X(48).                   NC1244.2
   000241         024400 01  HYPHEN-LINE.                                                 NC1244.2
   000242         024500     02 FILLER  PIC IS X VALUE IS SPACE.                          NC1244.2 IMP
   000243         024600     02 FILLER  PIC IS X(65)    VALUE IS "************************NC1244.2
   000244         024700-    "*****************************************".                 NC1244.2
   000245         024800     02 FILLER  PIC IS X(54)    VALUE IS "************************NC1244.2
   000246         024900-    "******************************".                            NC1244.2
   000247         025000 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC1244.2
   000248         025100     "NC124A".                                                    NC1244.2
   000249         025200 PROCEDURE DIVISION.                                              NC1244.2
   000250         025300 CCVS1 SECTION.                                                   NC1244.2
   000251         025400 OPEN-FILES.                                                      NC1244.2
   000252         025500     OPEN     OUTPUT PRINT-FILE.                                  NC1244.2 35
   000253         025600     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC1244.2 247 188 247 207
   000254         025700     MOVE    SPACE TO TEST-RESULTS.                               NC1244.2 IMP 108
   000255         025800     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC1244.2 280 285
   000256         025900     GO TO CCVS1-EXIT.                                            NC1244.2 367
   000257         026000 CLOSE-FILES.                                                     NC1244.2
   000258         026100     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC1244.2 289 310 35
   000259         026200 TERMINATE-CCVS.                                                  NC1244.2
   000260         026300     EXIT PROGRAM.                                                NC1244.2
   000261         026400 TERMINATE-CALL.                                                  NC1244.2
   000262         026500     STOP     RUN.                                                NC1244.2
   000263         026600 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC1244.2 112 164
   000264         026700 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC1244.2 112 165
   000265         026800 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC1244.2 112 163
   000266         026900 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC1244.2 112 162
   000267         027000     MOVE "****TEST DELETED****" TO RE-MARK.                      NC1244.2 119
   000268         027100 PRINT-DETAIL.                                                    NC1244.2
   000269         027200     IF REC-CT NOT EQUAL TO ZERO                                  NC1244.2 161 IMP
   000270      1  027300             MOVE "." TO PARDOT-X                                 NC1244.2 116
   000271      1  027400             MOVE REC-CT TO DOTVALUE.                             NC1244.2 161 117
   000272         027500     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC1244.2 108 36 322
   000273         027600     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC1244.2 112 322
   000274      1  027700        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC1244.2 343 357
   000275      1  027800          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC1244.2 358 366
   000276         027900     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC1244.2 IMP 112 IMP 124
   000277         028000     MOVE SPACE TO CORRECT-X.                                     NC1244.2 IMP 138
   000278         028100     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC1244.2 161 IMP IMP 114
   000279         028200     MOVE     SPACE TO RE-MARK.                                   NC1244.2 IMP 119
   000280         028300 HEAD-ROUTINE.                                                    NC1244.2
   000281         028400     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1244.2 171 37 322
   000282         028500     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC1244.2 176 37 322
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028600     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1244.2 185 37 322
   000284         028700     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC1244.2 197 37 322
   000285         028800 COLUMN-NAMES-ROUTINE.                                            NC1244.2
   000286         028900     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1244.2 149 37 322
   000287         029000     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1244.2 154 37 322
   000288         029100     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC1244.2 241 37 322
   000289         029200 END-ROUTINE.                                                     NC1244.2
   000290         029300     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC1244.2 241 37 322
   000291         029400 END-RTN-EXIT.                                                    NC1244.2
   000292         029500     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1244.2 204 37 322
   000293         029600 END-ROUTINE-1.                                                   NC1244.2
   000294         029700      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC1244.2 163 167 164
   000295         029800      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC1244.2 167 162 167
   000296         029900      ADD PASS-COUNTER TO ERROR-HOLD.                             NC1244.2 165 167
   000297         030000*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC1244.2
   000298         030100      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC1244.2 165 227
   000299         030200      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC1244.2 167 229
   000300         030300      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC1244.2 226 212
   000301         030400      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC1244.2 209 37 322
   000302         030500  END-ROUTINE-12.                                                 NC1244.2
   000303         030600      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC1244.2 215
   000304         030700     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC1244.2 163 IMP
   000305      1  030800         MOVE "NO " TO ERROR-TOTAL                                NC1244.2 213
   000306         030900         ELSE                                                     NC1244.2
   000307      1  031000         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC1244.2 163 213
   000308         031100     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC1244.2 209 37
   000309         031200     PERFORM WRITE-LINE.                                          NC1244.2 322
   000310         031300 END-ROUTINE-13.                                                  NC1244.2
   000311         031400     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC1244.2 162 IMP
   000312      1  031500         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC1244.2 213
   000313      1  031600         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC1244.2 162 213
   000314         031700     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC1244.2 215
   000315         031800     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1244.2 209 37 322
   000316         031900      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC1244.2 164 IMP
   000317      1  032000          MOVE "NO " TO ERROR-TOTAL                               NC1244.2 213
   000318      1  032100      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC1244.2 164 213
   000319         032200      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC1244.2 215
   000320         032300      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC1244.2 209 37 322
   000321         032400     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC1244.2 217 37 322
   000322         032500 WRITE-LINE.                                                      NC1244.2
   000323         032600     ADD 1 TO RECORD-COUNT.                                       NC1244.2 169
   000324         032700     IF RECORD-COUNT GREATER 42                                   NC1244.2 169
   000325      1  032800         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC1244.2 37 168
   000326      1  032900         MOVE SPACE TO DUMMY-RECORD                               NC1244.2 IMP 37
   000327      1  033000         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC1244.2 37
   000328      1  033100         MOVE CCVS-H-1  TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1244.2 171 37 338
   000329      1  033200         MOVE CCVS-H-2A TO DUMMY-RECORD  PERFORM WRT-LN 2 TIMES   NC1244.2 176 37 338
   000330      1  033300         MOVE CCVS-H-2B TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1244.2 185 37 338
   000331      1  033400         MOVE CCVS-H-3  TO DUMMY-RECORD  PERFORM WRT-LN 3 TIMES   NC1244.2 197 37 338
   000332      1  033500         MOVE CCVS-C-1  TO DUMMY-RECORD  PERFORM WRT-LN           NC1244.2 149 37 338
   000333      1  033600         MOVE CCVS-C-2  TO DUMMY-RECORD  PERFORM WRT-LN           NC1244.2 154 37 338
   000334      1  033700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC1244.2 241 37 338
   000335      1  033800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC1244.2 168 37
   000336      1  033900         MOVE ZERO TO RECORD-COUNT.                               NC1244.2 IMP 169
   000337         034000     PERFORM WRT-LN.                                              NC1244.2 338
   000338         034100 WRT-LN.                                                          NC1244.2
   000339         034200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC1244.2 37
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034300     MOVE SPACE TO DUMMY-RECORD.                                  NC1244.2 IMP 37
   000341         034400 BLANK-LINE-PRINT.                                                NC1244.2
   000342         034500     PERFORM WRT-LN.                                              NC1244.2 338
   000343         034600 FAIL-ROUTINE.                                                    NC1244.2
   000344         034700     IF     COMPUTED-X NOT EQUAL TO SPACE                         NC1244.2 124 IMP
   000345      1  034800            GO TO FAIL-ROUTINE-WRITE.                             NC1244.2 352
   000346         034900     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC1244.2 138 IMP 352
   000347         035000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1244.2 170 240
   000348         035100     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC1244.2 235
   000349         035200     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1244.2 232 37 322
   000350         035300     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1244.2 IMP 240
   000351         035400     GO TO  FAIL-ROUTINE-EX.                                      NC1244.2 357
   000352         035500 FAIL-ROUTINE-WRITE.                                              NC1244.2
   000353         035600     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC1244.2 120 36 322
   000354         035700     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC1244.2 170 148
   000355         035800     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC1244.2 135 36 322
   000356         035900     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC1244.2 IMP 148
   000357         036000 FAIL-ROUTINE-EX. EXIT.                                           NC1244.2
   000358         036100 BAIL-OUT.                                                        NC1244.2
   000359         036200     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC1244.2 125 IMP 361
   000360         036300     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC1244.2 139 IMP 366
   000361         036400 BAIL-OUT-WRITE.                                                  NC1244.2
   000362         036500     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC1244.2 139 239 125 237
   000363         036600     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC1244.2 170 240
   000364         036700     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC1244.2 232 37 322
   000365         036800     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC1244.2 IMP 240
   000366         036900 BAIL-OUT-EX. EXIT.                                               NC1244.2
   000367         037000 CCVS1-EXIT.                                                      NC1244.2
   000368         037100     EXIT.                                                        NC1244.2
   000369         037200 PICTURE-INIT-1.                                                  NC1244.2
   000370         037300     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000371         037400     MOVE "PICTRE-TST-1"    TO PAR-NAME.                          NC1244.2 114
   000372         037500     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000373         037600     MOVE  0                TO WORK-AREA-1.                       NC1244.2 39
   000374         037700     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000375         037800 PICTURE-TEST-1.                                                  NC1244.2
   000376         037900     MOVE WORK-AREA-1 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 39 84 85 86
   000377         038000                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000378         038100                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000379         038200     GO TO PICTURE-TEST-1-A.                                      NC1244.2 384
   000380         038300 PICTURE-DELETE-1.                                                NC1244.2
   000381         038400     PERFORM DE-LETE.                                             NC1244.2 266
   000382         038500     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000383         038600     GO TO PICTURE-INIT-2.                                        NC1244.2 455
   000384         038700 PICTURE-TEST-1-A.                                                NC1244.2
   000385         038800     IF EDIT-AREA-1 EQUAL TO "+0000"                              NC1244.2 84
   000386      1  038900        PERFORM PASS                                              NC1244.2 264
   000387      1  039000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000388      1  039100        ELSE PERFORM FAIL                                         NC1244.2 265
   000389      1  039200        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000390      1  039300        MOVE "+0000" TO CORRECT-A                                 NC1244.2 139
   000391      1  039400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000392         039500     ADD 1 TO REC-CT.                                             NC1244.2 161
   000393         039600 PICTURE-TEST-1-B.                                                NC1244.2
   000394         039700     IF EDIT-AREA-2 EQUAL TO " 0000"                              NC1244.2 85
   000395      1  039800        PERFORM PASS                                              NC1244.2 264
   000396      1  039900        PERFORM PRINT-DETAIL                                      NC1244.2 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040000        ELSE PERFORM FAIL                                         NC1244.2 265
   000398      1  040100        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   000399      1  040200        MOVE " 0000" TO CORRECT-A                                 NC1244.2 139
   000400      1  040300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000401         040400     ADD 1 TO REC-CT.                                             NC1244.2 161
   000402         040500 PICTURE-TEST-1-C.                                                NC1244.2
   000403         040600     IF EDIT-AREA-3 EQUAL TO "   +0"                              NC1244.2 86
   000404      1  040700        PERFORM PASS                                              NC1244.2 264
   000405      1  040800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000406      1  040900        ELSE PERFORM FAIL                                         NC1244.2 265
   000407      1  041000        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   000408      1  041100        MOVE "   +0" TO CORRECT-A                                 NC1244.2 139
   000409      1  041200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000410         041300     ADD 1 TO REC-CT.                                             NC1244.2 161
   000411         041400 PICTURE-TEST-1-D.                                                NC1244.2
   000412         041500     IF EDIT-AREA-4 EQUAL TO "    0"                              NC1244.2 87
   000413      1  041600        PERFORM PASS                                              NC1244.2 264
   000414      1  041700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000415      1  041800        ELSE PERFORM FAIL                                         NC1244.2 265
   000416      1  041900        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   000417      1  042000        MOVE "    0" TO CORRECT-A                                 NC1244.2 139
   000418      1  042100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000419         042200     ADD 1 TO REC-CT.                                             NC1244.2 161
   000420         042300 PICTURE-TEST-1-E.                                                NC1244.2
   000421         042400     IF EDIT-AREA-5 EQUAL TO "     "                              NC1244.2 88
   000422      1  042500        PERFORM PASS                                              NC1244.2 264
   000423      1  042600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000424      1  042700        ELSE PERFORM FAIL                                         NC1244.2 265
   000425      1  042800        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   000426      1  042900        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   000427      1  043000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000428         043100     ADD 1 TO REC-CT.                                             NC1244.2 161
   000429         043200 PICTURE-TEST-1-F.                                                NC1244.2
   000430         043300     IF EDIT-AREA-6 EQUAL TO "      "                             NC1244.2 89
   000431      1  043400        PERFORM PASS                                              NC1244.2 264
   000432      1  043500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000433      1  043600        ELSE PERFORM FAIL                                         NC1244.2 265
   000434      1  043700        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   000435      1  043800        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   000436      1  043900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000437         044000     ADD 1 TO REC-CT.                                             NC1244.2 161
   000438         044100 PICTURE-TEST-1-G.                                                NC1244.2
   000439         044200     IF EDIT-AREA-7 EQUAL TO "        "                           NC1244.2 90
   000440      1  044300        PERFORM PASS                                              NC1244.2 264
   000441      1  044400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000442      1  044500        ELSE PERFORM FAIL                                         NC1244.2 265
   000443      1  044600        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   000444      1  044700        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   000445      1  044800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000446         044900     ADD 1 TO REC-CT.                                             NC1244.2 161
   000447         045000 PICTURE-TEST-1-H.                                                NC1244.2
   000448         045100     IF EDIT-AREA-8 EQUAL TO "         "                          NC1244.2 91
   000449      1  045200        PERFORM PASS                                              NC1244.2 264
   000450      1  045300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000451      1  045400        ELSE PERFORM FAIL                                         NC1244.2 265
   000452      1  045500        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   000453      1  045600        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454      1  045700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000455         045800 PICTURE-INIT-2.                                                  NC1244.2
   000456         045900     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000457         046000     MOVE "PICTRE-TST-2" TO PAR-NAME.                             NC1244.2 114
   000458         046100     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000459         046200     MOVE  12               TO WORK-AREA-2.                       NC1244.2 40
   000460         046300     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000461         046400 PICTURE-TEST-2.                                                  NC1244.2
   000462         046500     MOVE WORK-AREA-2 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 40 84 85 86
   000463         046600                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000464         046700                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000465         046800     GO TO PICTURE-TEST-2-A.                                      NC1244.2 470
   000466         046900 PICTURE-DELETE-2.                                                NC1244.2
   000467         047000     PERFORM DE-LETE.                                             NC1244.2 266
   000468         047100     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000469         047200     GO TO PICTURE-INIT-3.                                        NC1244.2 541
   000470         047300 PICTURE-TEST-2-A.                                                NC1244.2
   000471         047400     IF EDIT-AREA-1 EQUAL TO "+0012"                              NC1244.2 84
   000472      1  047500        PERFORM PASS                                              NC1244.2 264
   000473      1  047600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000474      1  047700        ELSE PERFORM FAIL                                         NC1244.2 265
   000475      1  047800        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000476      1  047900        MOVE "+0012" TO CORRECT-A                                 NC1244.2 139
   000477      1  048000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000478         048100     ADD 1 TO REC-CT.                                             NC1244.2 161
   000479         048200 PICTURE-TEST-2-B.                                                NC1244.2
   000480         048300     IF EDIT-AREA-2 EQUAL TO " 0012"                              NC1244.2 85
   000481      1  048400        PERFORM PASS                                              NC1244.2 264
   000482      1  048500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000483      1  048600        ELSE PERFORM FAIL                                         NC1244.2 265
   000484      1  048700        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   000485      1  048800        MOVE " 0012" TO CORRECT-A                                 NC1244.2 139
   000486      1  048900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000487         049000     ADD 1 TO REC-CT.                                             NC1244.2 161
   000488         049100 PICTURE-TEST-2-C.                                                NC1244.2
   000489         049200     IF EDIT-AREA-3 EQUAL TO "  +12"                              NC1244.2 86
   000490      1  049300        PERFORM PASS                                              NC1244.2 264
   000491      1  049400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000492      1  049500        ELSE PERFORM FAIL                                         NC1244.2 265
   000493      1  049600        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   000494      1  049700        MOVE "  +12" TO CORRECT-A                                 NC1244.2 139
   000495      1  049800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000496         049900     ADD 1 TO REC-CT.                                             NC1244.2 161
   000497         050000 PICTURE-TEST-2-D.                                                NC1244.2
   000498         050100     IF EDIT-AREA-4 EQUAL TO "   12"                              NC1244.2 87
   000499      1  050200        PERFORM PASS                                              NC1244.2 264
   000500      1  050300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000501      1  050400        ELSE PERFORM FAIL                                         NC1244.2 265
   000502      1  050500        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   000503      1  050600        MOVE "   12" TO CORRECT-A                                 NC1244.2 139
   000504      1  050700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000505         050800     ADD 1 TO REC-CT.                                             NC1244.2 161
   000506         050900 PICTURE-TEST-2-E.                                                NC1244.2
   000507         051000     IF EDIT-AREA-5 EQUAL TO "  +12"                              NC1244.2 88
   000508      1  051100        PERFORM PASS                                              NC1244.2 264
   000509      1  051200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000510      1  051300        ELSE PERFORM FAIL                                         NC1244.2 265
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051400        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   000512      1  051500        MOVE "  +12" TO CORRECT-A                                 NC1244.2 139
   000513      1  051600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000514         051700     ADD 1 TO REC-CT.                                             NC1244.2 161
   000515         051800 PICTURE-TEST-2-F.                                                NC1244.2
   000516         051900     IF EDIT-AREA-6 EQUAL TO "   12"                              NC1244.2 89
   000517      1  052000        PERFORM PASS                                              NC1244.2 264
   000518      1  052100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000519      1  052200        ELSE PERFORM FAIL                                         NC1244.2 265
   000520      1  052300        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   000521      1  052400        MOVE "   12" TO CORRECT-A                                 NC1244.2 139
   000522      1  052500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000523         052600     ADD 1 TO REC-CT.                                             NC1244.2 161
   000524         052700 PICTURE-TEST-2-G.                                                NC1244.2
   000525         052800     IF EDIT-AREA-7 EQUAL TO "  +12.00"                           NC1244.2 90
   000526      1  052900        PERFORM PASS                                              NC1244.2 264
   000527      1  053000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000528      1  053100        ELSE PERFORM FAIL                                         NC1244.2 265
   000529      1  053200        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   000530      1  053300        MOVE "  +12.00" TO CORRECT-A                              NC1244.2 139
   000531      1  053400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000532         053500     ADD 1 TO REC-CT.                                             NC1244.2 161
   000533         053600 PICTURE-TEST-2-H.                                                NC1244.2
   000534         053700     IF EDIT-AREA-8 EQUAL TO "    12.00"                          NC1244.2 91
   000535      1  053800        PERFORM PASS                                              NC1244.2 264
   000536      1  053900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000537      1  054000        ELSE PERFORM FAIL                                         NC1244.2 265
   000538      1  054100        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   000539      1  054200        MOVE "    12.00" TO CORRECT-A                             NC1244.2 139
   000540      1  054300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000541         054400 PICTURE-INIT-3.                                                  NC1244.2
   000542         054500     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000543         054600     MOVE "PICTRE-TST-3" TO PAR-NAME.                             NC1244.2 114
   000544         054700     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000545         054800     MOVE  -12              TO WORK-AREA-3.                       NC1244.2 41
   000546         054900     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000547         055000 PICTURE-TEST-3.                                                  NC1244.2
   000548         055100     MOVE WORK-AREA-3 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 41 84 85 86
   000549         055200                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000550         055300                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000551         055400     GO TO PICTURE-TEST-3-A.                                      NC1244.2 556
   000552         055500 PICTURE-DELETE-3.                                                NC1244.2
   000553         055600     PERFORM DE-LETE.                                             NC1244.2 266
   000554         055700     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000555         055800     GO TO PICTURE-INIT-4.                                        NC1244.2 627
   000556         055900 PICTURE-TEST-3-A.                                                NC1244.2
   000557         056000     IF EDIT-AREA-1 EQUAL TO "-0012"                              NC1244.2 84
   000558      1  056100        PERFORM PASS                                              NC1244.2 264
   000559      1  056200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000560      1  056300        ELSE PERFORM FAIL                                         NC1244.2 265
   000561      1  056400        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000562      1  056500        MOVE "-0012" TO CORRECT-A                                 NC1244.2 139
   000563      1  056600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000564         056700     ADD 1 TO REC-CT.                                             NC1244.2 161
   000565         056800 PICTURE-TEST-3-B.                                                NC1244.2
   000566         056900     IF EDIT-AREA-2 EQUAL TO "-0012"                              NC1244.2 85
   000567      1  057000        PERFORM PASS                                              NC1244.2 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568      1  057100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000569      1  057200        ELSE PERFORM FAIL                                         NC1244.2 265
   000570      1  057300        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   000571      1  057400        MOVE "-0012" TO CORRECT-A                                 NC1244.2 139
   000572      1  057500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000573         057600     ADD 1 TO REC-CT.                                             NC1244.2 161
   000574         057700 PICTURE-TEST-3-C.                                                NC1244.2
   000575         057800     IF EDIT-AREA-3 EQUAL TO "  -12"                              NC1244.2 86
   000576      1  057900        PERFORM PASS                                              NC1244.2 264
   000577      1  058000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000578      1  058100        ELSE PERFORM FAIL                                         NC1244.2 265
   000579      1  058200        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   000580      1  058300        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   000581      1  058400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000582         058500     ADD 1 TO REC-CT.                                             NC1244.2 161
   000583         058600 PICTURE-TEST-3-D.                                                NC1244.2
   000584         058700     IF EDIT-AREA-4 EQUAL TO "  -12"                              NC1244.2 87
   000585      1  058800        PERFORM PASS                                              NC1244.2 264
   000586      1  058900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000587      1  059000        ELSE PERFORM FAIL                                         NC1244.2 265
   000588      1  059100        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   000589      1  059200        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   000590      1  059300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000591         059400     ADD 1 TO REC-CT.                                             NC1244.2 161
   000592         059500 PICTURE-TEST-3-E.                                                NC1244.2
   000593         059600     IF EDIT-AREA-5 EQUAL TO "  -12"                              NC1244.2 88
   000594      1  059700        PERFORM PASS                                              NC1244.2 264
   000595      1  059800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000596      1  059900        ELSE PERFORM FAIL                                         NC1244.2 265
   000597      1  060000        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   000598      1  060100        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   000599      1  060200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000600         060300     ADD 1 TO REC-CT.                                             NC1244.2 161
   000601         060400 PICTURE-TEST-3-F.                                                NC1244.2
   000602         060500     IF EDIT-AREA-6 EQUAL TO "  -12"                              NC1244.2 89
   000603      1  060600        PERFORM PASS                                              NC1244.2 264
   000604      1  060700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000605      1  060800        ELSE PERFORM FAIL                                         NC1244.2 265
   000606      1  060900        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   000607      1  061000        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   000608      1  061100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000609         061200     ADD 1 TO REC-CT.                                             NC1244.2 161
   000610         061300 PICTURE-TEST-3-G.                                                NC1244.2
   000611         061400     IF EDIT-AREA-7 EQUAL TO "  -12.00"                           NC1244.2 90
   000612      1  061500        PERFORM PASS                                              NC1244.2 264
   000613      1  061600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000614      1  061700        ELSE PERFORM FAIL                                         NC1244.2 265
   000615      1  061800        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   000616      1  061900        MOVE "  -12.00" TO CORRECT-A                              NC1244.2 139
   000617      1  062000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000618         062100     ADD 1 TO REC-CT.                                             NC1244.2 161
   000619         062200 PICTURE-TEST-3-H.                                                NC1244.2
   000620         062300     IF EDIT-AREA-8 EQUAL TO "   -12.00"                          NC1244.2 91
   000621      1  062400        PERFORM PASS                                              NC1244.2 264
   000622      1  062500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000623      1  062600        ELSE PERFORM FAIL                                         NC1244.2 265
   000624      1  062700        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625      1  062800        MOVE "   -12.00" TO CORRECT-A                             NC1244.2 139
   000626      1  062900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000627         063000 PICTURE-INIT-4.                                                  NC1244.2
   000628         063100     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000629         063200     MOVE "PICTRE-TST-4" TO PAR-NAME.                             NC1244.2 114
   000630         063300     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000631         063400     MOVE  123              TO WORK-AREA-4.                       NC1244.2 42
   000632         063500     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000633         063600 PICTURE-TEST-4.                                                  NC1244.2
   000634         063700     MOVE WORK-AREA-4 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 42 84 85 86
   000635         063800                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000636         063900                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000637         064000     GO TO PICTURE-TEST-4-A.                                      NC1244.2 642
   000638         064100 PICTURE-DELETE-4.                                                NC1244.2
   000639         064200     PERFORM DE-LETE.                                             NC1244.2 266
   000640         064300     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000641         064400     GO TO PICTURE-INIT-5.                                        NC1244.2 713
   000642         064500 PICTURE-TEST-4-A.                                                NC1244.2
   000643         064600     IF EDIT-AREA-1 EQUAL TO "+0123"                              NC1244.2 84
   000644      1  064700        PERFORM PASS                                              NC1244.2 264
   000645      1  064800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000646      1  064900        ELSE PERFORM FAIL                                         NC1244.2 265
   000647      1  065000        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000648      1  065100        MOVE "+0123" TO CORRECT-A                                 NC1244.2 139
   000649      1  065200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000650         065300     ADD 1 TO REC-CT.                                             NC1244.2 161
   000651         065400 PICTURE-TEST-4-B.                                                NC1244.2
   000652         065500     IF EDIT-AREA-2 EQUAL TO " 0123"                              NC1244.2 85
   000653      1  065600        PERFORM PASS                                              NC1244.2 264
   000654      1  065700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000655      1  065800        ELSE PERFORM FAIL                                         NC1244.2 265
   000656      1  065900        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   000657      1  066000        MOVE " 0123" TO CORRECT-A                                 NC1244.2 139
   000658      1  066100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000659         066200     ADD 1 TO REC-CT.                                             NC1244.2 161
   000660         066300 PICTURE-TEST-4-C.                                                NC1244.2
   000661         066400     IF EDIT-AREA-3 EQUAL TO " +123"                              NC1244.2 86
   000662      1  066500        PERFORM PASS                                              NC1244.2 264
   000663      1  066600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000664      1  066700        ELSE PERFORM FAIL                                         NC1244.2 265
   000665      1  066800        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   000666      1  066900        MOVE " +123" TO CORRECT-A                                 NC1244.2 139
   000667      1  067000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000668         067100     ADD 1 TO REC-CT.                                             NC1244.2 161
   000669         067200 PICTURE-TEST-4-D.                                                NC1244.2
   000670         067300     IF EDIT-AREA-4 EQUAL TO "  123"                              NC1244.2 87
   000671      1  067400        PERFORM PASS                                              NC1244.2 264
   000672      1  067500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000673      1  067600        ELSE PERFORM FAIL                                         NC1244.2 265
   000674      1  067700        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   000675      1  067800        MOVE "  123" TO CORRECT-A                                 NC1244.2 139
   000676      1  067900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000677         068000     ADD 1 TO REC-CT.                                             NC1244.2 161
   000678         068100 PICTURE-TEST-4-E.                                                NC1244.2
   000679         068200     IF EDIT-AREA-5 EQUAL TO " +123"                              NC1244.2 88
   000680      1  068300        PERFORM PASS                                              NC1244.2 264
   000681      1  068400        PERFORM PRINT-DETAIL                                      NC1244.2 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682      1  068500        ELSE PERFORM FAIL                                         NC1244.2 265
   000683      1  068600        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   000684      1  068700        MOVE " +123" TO CORRECT-A                                 NC1244.2 139
   000685      1  068800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000686         068900     ADD 1 TO REC-CT.                                             NC1244.2 161
   000687         069000 PICTURE-TEST-4-F.                                                NC1244.2
   000688         069100     IF EDIT-AREA-6 EQUAL TO "  123"                              NC1244.2 89
   000689      1  069200        PERFORM PASS                                              NC1244.2 264
   000690      1  069300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000691      1  069400        ELSE PERFORM FAIL                                         NC1244.2 265
   000692      1  069500        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   000693      1  069600        MOVE "  123" TO CORRECT-A                                 NC1244.2 139
   000694      1  069700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000695         069800     ADD 1 TO REC-CT.                                             NC1244.2 161
   000696         069900 PICTURE-TEST-4-G.                                                NC1244.2
   000697         070000     IF EDIT-AREA-7 EQUAL TO " +123.00"                           NC1244.2 90
   000698      1  070100        PERFORM PASS                                              NC1244.2 264
   000699      1  070200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000700      1  070300        ELSE PERFORM FAIL                                         NC1244.2 265
   000701      1  070400        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   000702      1  070500        MOVE " +123.00" TO CORRECT-A                              NC1244.2 139
   000703      1  070600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000704         070700     ADD 1 TO REC-CT.                                             NC1244.2 161
   000705         070800 PICTURE-TEST-4-H.                                                NC1244.2
   000706         070900     IF EDIT-AREA-8 EQUAL TO "   123.00"                          NC1244.2 91
   000707      1  071000        PERFORM PASS                                              NC1244.2 264
   000708      1  071100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000709      1  071200        ELSE PERFORM FAIL                                         NC1244.2 265
   000710      1  071300        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   000711      1  071400        MOVE "   123.00" TO CORRECT-A                             NC1244.2 139
   000712      1  071500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000713         071600 PICTURE-INIT-5.                                                  NC1244.2
   000714         071700     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000715         071800     MOVE "PICTRE-TST-5" TO PAR-NAME.                             NC1244.2 114
   000716         071900     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000717         072000     MOVE  -123             TO WORK-AREA-5.                       NC1244.2 43
   000718         072100     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000719         072200 PICTURE-TEST-5.                                                  NC1244.2
   000720         072300     MOVE WORK-AREA-5 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 43 84 85 86
   000721         072400                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000722         072500                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000723         072600     GO TO PICTURE-TEST-5-A.                                      NC1244.2 728
   000724         072700 PICTURE-DELETE-5.                                                NC1244.2
   000725         072800     PERFORM DE-LETE.                                             NC1244.2 266
   000726         072900     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000727         073000     GO TO PICTURE-INIT-6.                                        NC1244.2 799
   000728         073100 PICTURE-TEST-5-A.                                                NC1244.2
   000729         073200     IF EDIT-AREA-1 EQUAL TO "-0123"                              NC1244.2 84
   000730      1  073300        PERFORM PASS                                              NC1244.2 264
   000731      1  073400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000732      1  073500        ELSE PERFORM FAIL                                         NC1244.2 265
   000733      1  073600        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000734      1  073700        MOVE "-0123" TO CORRECT-A                                 NC1244.2 139
   000735      1  073800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000736         073900     ADD 1 TO REC-CT.                                             NC1244.2 161
   000737         074000 PICTURE-TEST-5-B.                                                NC1244.2
   000738         074100     IF EDIT-AREA-2 EQUAL TO "-0123"                              NC1244.2 85
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739      1  074200        PERFORM PASS                                              NC1244.2 264
   000740      1  074300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000741      1  074400        ELSE PERFORM FAIL                                         NC1244.2 265
   000742      1  074500        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   000743      1  074600        MOVE "-0123" TO CORRECT-A                                 NC1244.2 139
   000744      1  074700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000745         074800     ADD 1 TO REC-CT.                                             NC1244.2 161
   000746         074900 PICTURE-TEST-5-C.                                                NC1244.2
   000747         075000     IF EDIT-AREA-3 EQUAL TO " -123"                              NC1244.2 86
   000748      1  075100        PERFORM PASS                                              NC1244.2 264
   000749      1  075200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000750      1  075300        ELSE PERFORM FAIL                                         NC1244.2 265
   000751      1  075400        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   000752      1  075500        MOVE " -123" TO CORRECT-A                                 NC1244.2 139
   000753      1  075600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000754         075700     ADD 1 TO REC-CT.                                             NC1244.2 161
   000755         075800 PICTURE-TEST-5-D.                                                NC1244.2
   000756         075900     IF EDIT-AREA-4 EQUAL TO " -123"                              NC1244.2 87
   000757      1  076000        PERFORM PASS                                              NC1244.2 264
   000758      1  076100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000759      1  076200        ELSE PERFORM FAIL                                         NC1244.2 265
   000760      1  076300        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   000761      1  076400        MOVE " -123" TO CORRECT-A                                 NC1244.2 139
   000762      1  076500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000763         076600     ADD 1 TO REC-CT.                                             NC1244.2 161
   000764         076700 PICTURE-TEST-5-E.                                                NC1244.2
   000765         076800     IF EDIT-AREA-5 EQUAL TO " -123"                              NC1244.2 88
   000766      1  076900        PERFORM PASS                                              NC1244.2 264
   000767      1  077000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000768      1  077100        ELSE PERFORM FAIL                                         NC1244.2 265
   000769      1  077200        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   000770      1  077300        MOVE " -123" TO CORRECT-A                                 NC1244.2 139
   000771      1  077400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000772         077500     ADD 1 TO REC-CT.                                             NC1244.2 161
   000773         077600 PICTURE-TEST-5-F.                                                NC1244.2
   000774         077700     IF EDIT-AREA-6 EQUAL TO " -123"                              NC1244.2 89
   000775      1  077800        PERFORM PASS                                              NC1244.2 264
   000776      1  077900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000777      1  078000        ELSE PERFORM FAIL                                         NC1244.2 265
   000778      1  078100        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   000779      1  078200        MOVE " -123" TO CORRECT-A                                 NC1244.2 139
   000780      1  078300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000781         078400     ADD 1 TO REC-CT.                                             NC1244.2 161
   000782         078500 PICTURE-TEST-5-G.                                                NC1244.2
   000783         078600     IF EDIT-AREA-7 EQUAL TO " -123.00"                           NC1244.2 90
   000784      1  078700        PERFORM PASS                                              NC1244.2 264
   000785      1  078800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000786      1  078900        ELSE PERFORM FAIL                                         NC1244.2 265
   000787      1  079000        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   000788      1  079100        MOVE " -123.00" TO CORRECT-A                              NC1244.2 139
   000789      1  079200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000790         079300     ADD 1 TO REC-CT.                                             NC1244.2 161
   000791         079400 PICTURE-TEST-5-H.                                                NC1244.2
   000792         079500     IF EDIT-AREA-8 EQUAL TO "  -123.00"                          NC1244.2 91
   000793      1  079600        PERFORM PASS                                              NC1244.2 264
   000794      1  079700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000795      1  079800        ELSE PERFORM FAIL                                         NC1244.2 265
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796      1  079900        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   000797      1  080000        MOVE "  -123.00" TO CORRECT-A                             NC1244.2 139
   000798      1  080100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000799         080200 PICTURE-INIT-6.                                                  NC1244.2
   000800         080300     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000801         080400     MOVE "PICTRE-TST-6" TO PAR-NAME.                             NC1244.2 114
   000802         080500     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000803         080600     MOVE  1234             TO WORK-AREA-6.                       NC1244.2 44
   000804         080700     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000805         080800 PICTURE-TEST-6.                                                  NC1244.2
   000806         080900     MOVE WORK-AREA-6 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 44 84 85 86
   000807         081000                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000808         081100                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000809         081200     GO TO PICTURE-TEST-6-A.                                      NC1244.2 814
   000810         081300 PICTURE-DELETE-6.                                                NC1244.2
   000811         081400     PERFORM DE-LETE.                                             NC1244.2 266
   000812         081500     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000813         081600     GO TO PICTURE-INIT-7.                                        NC1244.2 885
   000814         081700 PICTURE-TEST-6-A.                                                NC1244.2
   000815         081800     IF EDIT-AREA-1 EQUAL TO "+1234"                              NC1244.2 84
   000816      1  081900        PERFORM PASS                                              NC1244.2 264
   000817      1  082000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000818      1  082100        ELSE PERFORM FAIL                                         NC1244.2 265
   000819      1  082200        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000820      1  082300        MOVE "+1234" TO CORRECT-A                                 NC1244.2 139
   000821      1  082400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000822         082500     ADD 1 TO REC-CT.                                             NC1244.2 161
   000823         082600 PICTURE-TEST-6-B.                                                NC1244.2
   000824         082700     IF EDIT-AREA-2 EQUAL TO " 1234"                              NC1244.2 85
   000825      1  082800        PERFORM PASS                                              NC1244.2 264
   000826      1  082900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000827      1  083000        ELSE PERFORM FAIL                                         NC1244.2 265
   000828      1  083100        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   000829      1  083200        MOVE " 1234" TO CORRECT-A                                 NC1244.2 139
   000830      1  083300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000831         083400     ADD 1 TO REC-CT.                                             NC1244.2 161
   000832         083500 PICTURE-TEST-6-C.                                                NC1244.2
   000833         083600     IF EDIT-AREA-3 EQUAL TO "+1234"                              NC1244.2 86
   000834      1  083700        PERFORM PASS                                              NC1244.2 264
   000835      1  083800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000836      1  083900        ELSE PERFORM FAIL                                         NC1244.2 265
   000837      1  084000        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   000838      1  084100        MOVE "+1234" TO CORRECT-A                                 NC1244.2 139
   000839      1  084200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000840         084300     ADD 1 TO REC-CT.                                             NC1244.2 161
   000841         084400 PICTURE-TEST-6-D.                                                NC1244.2
   000842         084500     IF EDIT-AREA-4 EQUAL TO " 1234"                              NC1244.2 87
   000843      1  084600        PERFORM PASS                                              NC1244.2 264
   000844      1  084700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000845      1  084800        ELSE PERFORM FAIL                                         NC1244.2 265
   000846      1  084900        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   000847      1  085000        MOVE " 1234" TO CORRECT-A                                 NC1244.2 139
   000848      1  085100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000849         085200     ADD 1 TO REC-CT.                                             NC1244.2 161
   000850         085300 PICTURE-TEST-6-E.                                                NC1244.2
   000851         085400     IF EDIT-AREA-5 EQUAL TO "+1234"                              NC1244.2 88
   000852      1  085500        PERFORM PASS                                              NC1244.2 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853      1  085600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000854      1  085700        ELSE PERFORM FAIL                                         NC1244.2 265
   000855      1  085800        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   000856      1  085900        MOVE "+1234" TO CORRECT-A                                 NC1244.2 139
   000857      1  086000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000858         086100     ADD 1 TO REC-CT.                                             NC1244.2 161
   000859         086200 PICTURE-TEST-6-F.                                                NC1244.2
   000860         086300     IF EDIT-AREA-6 EQUAL TO " 1234"                              NC1244.2 89
   000861      1  086400        PERFORM PASS                                              NC1244.2 264
   000862      1  086500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000863      1  086600        ELSE PERFORM FAIL                                         NC1244.2 265
   000864      1  086700        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   000865      1  086800        MOVE " 1234" TO CORRECT-A                                 NC1244.2 139
   000866      1  086900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000867         087000     ADD 1 TO REC-CT.                                             NC1244.2 161
   000868         087100 PICTURE-TEST-6-G.                                                NC1244.2
   000869         087200     IF EDIT-AREA-7 EQUAL TO "+1234.00"                           NC1244.2 90
   000870      1  087300        PERFORM PASS                                              NC1244.2 264
   000871      1  087400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000872      1  087500        ELSE PERFORM FAIL                                         NC1244.2 265
   000873      1  087600        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   000874      1  087700        MOVE "+1234.00" TO CORRECT-A                              NC1244.2 139
   000875      1  087800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000876         087900     ADD 1 TO REC-CT.                                             NC1244.2 161
   000877         088000 PICTURE-TEST-6-H.                                                NC1244.2
   000878         088100     IF EDIT-AREA-8 EQUAL TO " 1,234.00"                          NC1244.2 91
   000879      1  088200        PERFORM PASS                                              NC1244.2 264
   000880      1  088300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000881      1  088400        ELSE PERFORM FAIL                                         NC1244.2 265
   000882      1  088500        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   000883      1  088600        MOVE " 1,234.00" TO CORRECT-A                             NC1244.2 139
   000884      1  088700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000885         088800 PICTURE-INIT-7.                                                  NC1244.2
   000886         088900     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000887         089000     MOVE "PICTRE-TST-7" TO PAR-NAME.                             NC1244.2 114
   000888         089100     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000889         089200     MOVE  -1234           TO WORK-AREA-7.                        NC1244.2 45
   000890         089300     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000891         089400 PICTURE-TEST-7.                                                  NC1244.2
   000892         089500     MOVE WORK-AREA-7 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 45 84 85 86
   000893         089600                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000894         089700                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000895         089800     GO TO PICTURE-TEST-7-A.                                      NC1244.2 900
   000896         089900 PICTURE-DELETE-7.                                                NC1244.2
   000897         090000     PERFORM DE-LETE.                                             NC1244.2 266
   000898         090100     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000899         090200     GO TO PICTURE-INIT-8.                                        NC1244.2 971
   000900         090300 PICTURE-TEST-7-A.                                                NC1244.2
   000901         090400     IF EDIT-AREA-1 EQUAL TO "-1234"                              NC1244.2 84
   000902      1  090500        PERFORM PASS                                              NC1244.2 264
   000903      1  090600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000904      1  090700        ELSE PERFORM FAIL                                         NC1244.2 265
   000905      1  090800        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000906      1  090900        MOVE "-1234" TO CORRECT-A                                 NC1244.2 139
   000907      1  091000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000908         091100     ADD 1 TO REC-CT.                                             NC1244.2 161
   000909         091200 PICTURE-TEST-7-B.                                                NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091300     IF EDIT-AREA-2 EQUAL TO "-1234"                              NC1244.2 85
   000911      1  091400        PERFORM PASS                                              NC1244.2 264
   000912      1  091500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000913      1  091600        ELSE PERFORM FAIL                                         NC1244.2 265
   000914      1  091700        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   000915      1  091800        MOVE "-1234" TO CORRECT-A                                 NC1244.2 139
   000916      1  091900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000917         092000     ADD 1 TO REC-CT.                                             NC1244.2 161
   000918         092100 PICTURE-TEST-7-C.                                                NC1244.2
   000919         092200     IF EDIT-AREA-3 EQUAL TO "-1234"                              NC1244.2 86
   000920      1  092300        PERFORM PASS                                              NC1244.2 264
   000921      1  092400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000922      1  092500        ELSE PERFORM FAIL                                         NC1244.2 265
   000923      1  092600        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   000924      1  092700        MOVE "-1234" TO CORRECT-A                                 NC1244.2 139
   000925      1  092800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000926         092900     ADD 1 TO REC-CT.                                             NC1244.2 161
   000927         093000 PICTURE-TEST-7-D.                                                NC1244.2
   000928         093100     IF EDIT-AREA-4 EQUAL TO "-1234"                              NC1244.2 87
   000929      1  093200        PERFORM PASS                                              NC1244.2 264
   000930      1  093300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000931      1  093400        ELSE PERFORM FAIL                                         NC1244.2 265
   000932      1  093500        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   000933      1  093600        MOVE "-1234" TO CORRECT-A                                 NC1244.2 139
   000934      1  093700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000935         093800     ADD 1 TO REC-CT.                                             NC1244.2 161
   000936         093900 PICTURE-TEST-7-E.                                                NC1244.2
   000937         094000     IF EDIT-AREA-5 EQUAL TO "-1234"                              NC1244.2 88
   000938      1  094100        PERFORM PASS                                              NC1244.2 264
   000939      1  094200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000940      1  094300        ELSE PERFORM FAIL                                         NC1244.2 265
   000941      1  094400        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   000942      1  094500        MOVE "-1234" TO CORRECT-A                                 NC1244.2 139
   000943      1  094600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000944         094700     ADD 1 TO REC-CT.                                             NC1244.2 161
   000945         094800 PICTURE-TEST-7-F.                                                NC1244.2
   000946         094900     IF EDIT-AREA-6 EQUAL TO "-1234"                              NC1244.2 89
   000947      1  095000        PERFORM PASS                                              NC1244.2 264
   000948      1  095100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000949      1  095200        ELSE PERFORM FAIL                                         NC1244.2 265
   000950      1  095300        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   000951      1  095400        MOVE "-1234" TO CORRECT-A                                 NC1244.2 139
   000952      1  095500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000953         095600     ADD 1 TO REC-CT.                                             NC1244.2 161
   000954         095700 PICTURE-TEST-7-G.                                                NC1244.2
   000955         095800     IF EDIT-AREA-7 EQUAL TO "-1234.00"                           NC1244.2 90
   000956      1  095900        PERFORM PASS                                              NC1244.2 264
   000957      1  096000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000958      1  096100        ELSE PERFORM FAIL                                         NC1244.2 265
   000959      1  096200        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   000960      1  096300        MOVE "-1234.00" TO CORRECT-A                              NC1244.2 139
   000961      1  096400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000962         096500     ADD 1 TO REC-CT.                                             NC1244.2 161
   000963         096600 PICTURE-TEST-7-H.                                                NC1244.2
   000964         096700     IF EDIT-AREA-8 EQUAL TO "-1,234.00"                          NC1244.2 91
   000965      1  096800        PERFORM PASS                                              NC1244.2 264
   000966      1  096900        PERFORM PRINT-DETAIL                                      NC1244.2 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967      1  097000        ELSE PERFORM FAIL                                         NC1244.2 265
   000968      1  097100        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   000969      1  097200        MOVE "-1,234.00" TO CORRECT-A                             NC1244.2 139
   000970      1  097300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000971         097400 PICTURE-INIT-8.                                                  NC1244.2
   000972         097500     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   000973         097600     MOVE "PICTRE-TST-8" TO PAR-NAME.                             NC1244.2 114
   000974         097700     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   000975         097800     MOVE  12.34           TO WORK-AREA-8.                        NC1244.2 46
   000976         097900     MOVE 1 TO REC-CT.                                            NC1244.2 161
   000977         098000 PICTURE-TEST-8.                                                  NC1244.2
   000978         098100     MOVE WORK-AREA-8 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 46 84 85 86
   000979         098200                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   000980         098300                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   000981         098400     GO TO PICTURE-TEST-8-A.                                      NC1244.2 986
   000982         098500 PICTURE-DELETE-8.                                                NC1244.2
   000983         098600     PERFORM DE-LETE.                                             NC1244.2 266
   000984         098700     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   000985         098800     GO TO PICTURE-INIT-9.                                        NC1244.2 1057
   000986         098900 PICTURE-TEST-8-A.                                                NC1244.2
   000987         099000     IF EDIT-AREA-1 EQUAL TO "+0012"                              NC1244.2 84
   000988      1  099100        PERFORM PASS                                              NC1244.2 264
   000989      1  099200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000990      1  099300        ELSE PERFORM FAIL                                         NC1244.2 265
   000991      1  099400        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   000992      1  099500        MOVE "+0012" TO CORRECT-A                                 NC1244.2 139
   000993      1  099600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   000994         099700     ADD 1 TO REC-CT.                                             NC1244.2 161
   000995         099800 PICTURE-TEST-8-B.                                                NC1244.2
   000996         099900     IF EDIT-AREA-2 EQUAL TO " 0012"                              NC1244.2 85
   000997      1  100000        PERFORM PASS                                              NC1244.2 264
   000998      1  100100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   000999      1  100200        ELSE PERFORM FAIL                                         NC1244.2 265
   001000      1  100300        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   001001      1  100400        MOVE " 0012" TO CORRECT-A                                 NC1244.2 139
   001002      1  100500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001003         100600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001004         100700 PICTURE-TEST-8-C.                                                NC1244.2
   001005         100800     IF EDIT-AREA-3 EQUAL TO "  +12"                              NC1244.2 86
   001006      1  100900        PERFORM PASS                                              NC1244.2 264
   001007      1  101000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001008      1  101100        ELSE PERFORM FAIL                                         NC1244.2 265
   001009      1  101200        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   001010      1  101300        MOVE "  +12" TO CORRECT-A                                 NC1244.2 139
   001011      1  101400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001012         101500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001013         101600 PICTURE-TEST-8-D.                                                NC1244.2
   001014         101700     IF EDIT-AREA-4 EQUAL TO "   12"                              NC1244.2 87
   001015      1  101800        PERFORM PASS                                              NC1244.2 264
   001016      1  101900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001017      1  102000        ELSE PERFORM FAIL                                         NC1244.2 265
   001018      1  102100        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   001019      1  102200        MOVE "   12" TO CORRECT-A                                 NC1244.2 139
   001020      1  102300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001021         102400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001022         102500 PICTURE-TEST-8-E.                                                NC1244.2
   001023         102600     IF EDIT-AREA-5 EQUAL TO "  +12"                              NC1244.2 88
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024      1  102700        PERFORM PASS                                              NC1244.2 264
   001025      1  102800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001026      1  102900        ELSE PERFORM FAIL                                         NC1244.2 265
   001027      1  103000        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   001028      1  103100        MOVE "  +12" TO CORRECT-A                                 NC1244.2 139
   001029      1  103200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001030         103300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001031         103400 PICTURE-TEST-8-F.                                                NC1244.2
   001032         103500     IF EDIT-AREA-6 EQUAL TO "   12"                              NC1244.2 89
   001033      1  103600        PERFORM PASS                                              NC1244.2 264
   001034      1  103700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001035      1  103800        ELSE PERFORM FAIL                                         NC1244.2 265
   001036      1  103900        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   001037      1  104000        MOVE "   12" TO CORRECT-A                                 NC1244.2 139
   001038      1  104100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001039         104200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001040         104300 PICTURE-TEST-8-G.                                                NC1244.2
   001041         104400     IF EDIT-AREA-7 EQUAL TO "  +12.34"                           NC1244.2 90
   001042      1  104500        PERFORM PASS                                              NC1244.2 264
   001043      1  104600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001044      1  104700        ELSE PERFORM FAIL                                         NC1244.2 265
   001045      1  104800        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   001046      1  104900        MOVE "  +12.34" TO CORRECT-A                              NC1244.2 139
   001047      1  105000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001048         105100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001049         105200 PICTURE-TEST-8-H.                                                NC1244.2
   001050         105300     IF EDIT-AREA-8 EQUAL TO "    12.34"                          NC1244.2 91
   001051      1  105400        PERFORM PASS                                              NC1244.2 264
   001052      1  105500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001053      1  105600        ELSE PERFORM FAIL                                         NC1244.2 265
   001054      1  105700        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   001055      1  105800        MOVE "    12.34" TO CORRECT-A                             NC1244.2 139
   001056      1  105900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001057         106000 PICTURE-INIT-9.                                                  NC1244.2
   001058         106100     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001059         106200     MOVE "PICTRE-TST-9" TO PAR-NAME.                             NC1244.2 114
   001060         106300     MOVE "PICTURE + AND -" TO FEATURE.                           NC1244.2 110
   001061         106400     MOVE -12.34           TO WORK-AREA-9.                        NC1244.2 47
   001062         106500     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001063         106600 PICTURE-TEST-9.                                                  NC1244.2
   001064         106700     MOVE WORK-AREA-9 TO EDIT-AREA-1  EDIT-AREA-2  EDIT-AREA-3    NC1244.2 47 84 85 86
   001065         106800                         EDIT-AREA-4  EDIT-AREA-5  EDIT-AREA-6    NC1244.2 87 88 89
   001066         106900                         EDIT-AREA-7  EDIT-AREA-8.                NC1244.2 90 91
   001067         107000     GO TO PICTURE-TEST-9-A.                                      NC1244.2 1072
   001068         107100 PICTURE-DELETE-9.                                                NC1244.2
   001069         107200     PERFORM DE-LETE.                                             NC1244.2 266
   001070         107300     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001071         107400     GO TO PICTURE-INIT-10.                                       NC1244.2 1143
   001072         107500 PICTURE-TEST-9-A.                                                NC1244.2
   001073         107600     IF EDIT-AREA-1 EQUAL TO "-0012"                              NC1244.2 84
   001074      1  107700        PERFORM PASS                                              NC1244.2 264
   001075      1  107800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001076      1  107900        ELSE PERFORM FAIL                                         NC1244.2 265
   001077      1  108000        MOVE EDIT-AREA-1 TO COMPUTED-A                            NC1244.2 84 125
   001078      1  108100        MOVE "-0012" TO CORRECT-A                                 NC1244.2 139
   001079      1  108200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001080         108300     ADD 1 TO REC-CT.                                             NC1244.2 161
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108400 PICTURE-TEST-9-B.                                                NC1244.2
   001082         108500     IF EDIT-AREA-2 EQUAL TO "-0012"                              NC1244.2 85
   001083      1  108600        PERFORM PASS                                              NC1244.2 264
   001084      1  108700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001085      1  108800        ELSE PERFORM FAIL                                         NC1244.2 265
   001086      1  108900        MOVE EDIT-AREA-2 TO COMPUTED-A                            NC1244.2 85 125
   001087      1  109000        MOVE "-0012" TO CORRECT-A                                 NC1244.2 139
   001088      1  109100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001089         109200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001090         109300 PICTURE-TEST-9-C.                                                NC1244.2
   001091         109400     IF EDIT-AREA-3 EQUAL TO "  -12"                              NC1244.2 86
   001092      1  109500        PERFORM PASS                                              NC1244.2 264
   001093      1  109600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001094      1  109700        ELSE PERFORM FAIL                                         NC1244.2 265
   001095      1  109800        MOVE EDIT-AREA-3 TO COMPUTED-A                            NC1244.2 86 125
   001096      1  109900        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   001097      1  110000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001098         110100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001099         110200 PICTURE-TEST-9-D.                                                NC1244.2
   001100         110300     IF EDIT-AREA-4 EQUAL TO "  -12"                              NC1244.2 87
   001101      1  110400        PERFORM PASS                                              NC1244.2 264
   001102      1  110500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001103      1  110600        ELSE PERFORM FAIL                                         NC1244.2 265
   001104      1  110700        MOVE EDIT-AREA-4 TO COMPUTED-A                            NC1244.2 87 125
   001105      1  110800        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   001106      1  110900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001107         111000     ADD 1 TO REC-CT.                                             NC1244.2 161
   001108         111100 PICTURE-TEST-9-E.                                                NC1244.2
   001109         111200     IF EDIT-AREA-5 EQUAL TO "  -12"                              NC1244.2 88
   001110      1  111300        PERFORM PASS                                              NC1244.2 264
   001111      1  111400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001112      1  111500        ELSE PERFORM FAIL                                         NC1244.2 265
   001113      1  111600        MOVE EDIT-AREA-5 TO COMPUTED-A                            NC1244.2 88 125
   001114      1  111700        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   001115      1  111800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001116         111900     ADD 1 TO REC-CT.                                             NC1244.2 161
   001117         112000 PICTURE-TEST-9-F.                                                NC1244.2
   001118         112100     IF EDIT-AREA-6 EQUAL TO "  -12"                              NC1244.2 89
   001119      1  112200        PERFORM PASS                                              NC1244.2 264
   001120      1  112300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001121      1  112400        ELSE PERFORM FAIL                                         NC1244.2 265
   001122      1  112500        MOVE EDIT-AREA-6 TO COMPUTED-A                            NC1244.2 89 125
   001123      1  112600        MOVE "  -12" TO CORRECT-A                                 NC1244.2 139
   001124      1  112700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001125         112800     ADD 1 TO REC-CT.                                             NC1244.2 161
   001126         112900 PICTURE-TEST-9-G.                                                NC1244.2
   001127         113000     IF EDIT-AREA-7 EQUAL TO "  -12.34"                           NC1244.2 90
   001128      1  113100        PERFORM PASS                                              NC1244.2 264
   001129      1  113200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001130      1  113300        ELSE PERFORM FAIL                                         NC1244.2 265
   001131      1  113400        MOVE EDIT-AREA-7 TO COMPUTED-A                            NC1244.2 90 125
   001132      1  113500        MOVE "  -12.34" TO CORRECT-A                              NC1244.2 139
   001133      1  113600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001134         113700     ADD 1 TO REC-CT.                                             NC1244.2 161
   001135         113800 PICTURE-TEST-9-H.                                                NC1244.2
   001136         113900     IF EDIT-AREA-8 EQUAL TO "   -12.34"                          NC1244.2 91
   001137      1  114000        PERFORM PASS                                              NC1244.2 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138      1  114100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001139      1  114200        ELSE PERFORM FAIL                                         NC1244.2 265
   001140      1  114300        MOVE EDIT-AREA-8 TO COMPUTED-A                            NC1244.2 91 125
   001141      1  114400        MOVE "   -12.34" TO CORRECT-A                             NC1244.2 139
   001142      1  114500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001143         114600 PICTURE-INIT-10.                                                 NC1244.2
   001144         114700     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001145         114800     MOVE "PCTRE-TST-10" TO PAR-NAME.                             NC1244.2 114
   001146         114900     MOVE "PICTURE CHARACTER l" TO FEATURE.                       NC1244.2 110
   001147         115000     MOVE  0               TO WORK-AREA-10.                       NC1244.2 48
   001148         115100     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001149         115200 PICTURE-TEST-10.                                                 NC1244.2
   001150         115300     MOVE WORK-AREA-10 TO EDIT-AREA-9  EDIT-AREA-10               NC1244.2 48 92 93
   001151         115400                          EDIT-AREA-11  EDIT-AREA-12.             NC1244.2 94 95
   001152         115500     GO TO PICTURE-TEST-10-A.                                     NC1244.2 1157
   001153         115600 PICTURE-DELETE-10.                                               NC1244.2
   001154         115700     PERFORM DE-LETE.                                             NC1244.2 266
   001155         115800     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001156         115900     GO TO PICTURE-INIT-11.                                       NC1244.2 1192
   001157         116000 PICTURE-TEST-10-A.                                               NC1244.2
   001158         116100     IF EDIT-AREA-9 EQUAL TO " $00"                               NC1244.2 92
   001159      1  116200        PERFORM PASS                                              NC1244.2 264
   001160      1  116300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001161      1  116400        ELSE PERFORM FAIL                                         NC1244.2 265
   001162      1  116500        MOVE EDIT-AREA-9 TO COMPUTED-A                            NC1244.2 92 125
   001163      1  116600        MOVE " $00" TO CORRECT-A                                  NC1244.2 139
   001164      1  116700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001165         116800     ADD 1 TO REC-CT.                                             NC1244.2 161
   001166         116900 PICTURE-TEST-10-B.                                               NC1244.2
   001167         117000     IF EDIT-AREA-10 EQUAL TO "   $0"                             NC1244.2 93
   001168      1  117100        PERFORM PASS                                              NC1244.2 264
   001169      1  117200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001170      1  117300        ELSE PERFORM FAIL                                         NC1244.2 265
   001171      1  117400        MOVE EDIT-AREA-10 TO COMPUTED-A                           NC1244.2 93 125
   001172      1  117500        MOVE "   $0" TO CORRECT-A                                 NC1244.2 139
   001173      1  117600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001174         117700     ADD 1 TO REC-CT.                                             NC1244.2 161
   001175         117800 PICTURE-TEST-10-C.                                               NC1244.2
   001176         117900     IF EDIT-AREA-11 EQUAL TO "    $.00"                          NC1244.2 94
   001177      1  118000        PERFORM PASS                                              NC1244.2 264
   001178      1  118100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001179      1  118200        ELSE PERFORM FAIL                                         NC1244.2 265
   001180      1  118300        MOVE EDIT-AREA-11 TO COMPUTED-A                           NC1244.2 94 125
   001181      1  118400        MOVE "    $.00" TO CORRECT-A                              NC1244.2 139
   001182      1  118500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001183         118600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001184         118700 PICTURE-TEST-10-D.                                               NC1244.2
   001185         118800     IF EDIT-AREA-12 EQUAL TO "         "                         NC1244.2 95
   001186      1  118900        PERFORM PASS                                              NC1244.2 264
   001187      1  119000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001188      1  119100        ELSE PERFORM FAIL                                         NC1244.2 265
   001189      1  119200        MOVE EDIT-AREA-12 TO COMPUTED-A                           NC1244.2 95 125
   001190      1  119300        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   001191      1  119400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001192         119500 PICTURE-INIT-11.                                                 NC1244.2
   001193         119600     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001194         119700     MOVE "PCTRE-TST-11" TO PAR-NAME.                             NC1244.2 114
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119800     MOVE "PICTURE CHARACTER l" TO FEATURE.                       NC1244.2 110
   001196         119900     MOVE  .02                  TO WORK-AREA-11.                  NC1244.2 49
   001197         120000     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001198         120100 PICTURE-TEST-11.                                                 NC1244.2
   001199         120200     MOVE WORK-AREA-11 TO EDIT-AREA-9  EDIT-AREA-10               NC1244.2 49 92 93

 ==001199==> IGYPA3087-W "WORK-AREA-11 (NUMERIC NON-INTEGER)" and "EDIT-AREA-9 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==001199==> IGYPA3087-W "WORK-AREA-11 (NUMERIC NON-INTEGER)" and "EDIT-AREA-10 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

   001200         120300                          EDIT-AREA-11  EDIT-AREA-12.             NC1244.2 94 95
   001201         120400     GO TO PICTURE-TEST-11-A.                                     NC1244.2 1206
   001202         120500 PICTURE-DELETE-11.                                               NC1244.2
   001203         120600     PERFORM DE-LETE.                                             NC1244.2 266
   001204         120700     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001205         120800     GO TO PICTURE-INIT-12.                                       NC1244.2 1241
   001206         120900 PICTURE-TEST-11-A.                                               NC1244.2
   001207         121000     IF EDIT-AREA-9 EQUAL TO " $00"                               NC1244.2 92
   001208      1  121100        PERFORM PASS                                              NC1244.2 264
   001209      1  121200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001210      1  121300        ELSE PERFORM FAIL                                         NC1244.2 265
   001211      1  121400        MOVE EDIT-AREA-9 TO COMPUTED-A                            NC1244.2 92 125
   001212      1  121500        MOVE " $00" TO CORRECT-A                                  NC1244.2 139
   001213      1  121600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001214         121700     ADD 1 TO REC-CT.                                             NC1244.2 161
   001215         121800 PICTURE-TEST-11-B.                                               NC1244.2
   001216         121900     IF EDIT-AREA-10 EQUAL TO "   $0"                             NC1244.2 93
   001217      1  122000        PERFORM PASS                                              NC1244.2 264
   001218      1  122100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001219      1  122200        ELSE PERFORM FAIL                                         NC1244.2 265
   001220      1  122300        MOVE EDIT-AREA-10 TO COMPUTED-A                           NC1244.2 93 125
   001221      1  122400        MOVE "   $0" TO CORRECT-A                                 NC1244.2 139
   001222      1  122500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001223         122600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001224         122700 PICTURE-TEST-11-C.                                               NC1244.2
   001225         122800     IF EDIT-AREA-11 EQUAL TO "    $.02"                          NC1244.2 94
   001226      1  122900        PERFORM PASS                                              NC1244.2 264
   001227      1  123000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001228      1  123100        ELSE PERFORM FAIL                                         NC1244.2 265
   001229      1  123200        MOVE EDIT-AREA-11 TO COMPUTED-A                           NC1244.2 94 125
   001230      1  123300        MOVE "    $.02" TO CORRECT-A                              NC1244.2 139
   001231      1  123400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001232         123500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001233         123600 PICTURE-TEST-11-D.                                               NC1244.2
   001234         123700     IF EDIT-AREA-12 EQUAL TO "     $.02"                         NC1244.2 95
   001235      1  123800        PERFORM PASS                                              NC1244.2 264
   001236      1  123900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001237      1  124000        ELSE PERFORM FAIL                                         NC1244.2 265
   001238      1  124100        MOVE EDIT-AREA-12 TO COMPUTED-A                           NC1244.2 95 125
   001239      1  124200        MOVE "     $.02" TO CORRECT-A                             NC1244.2 139
   001240      1  124300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001241         124400 PICTURE-INIT-12.                                                 NC1244.2
   001242         124500     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001243         124600     MOVE "PCTRE-TST-12" TO PAR-NAME.                             NC1244.2 114
   001244         124700     MOVE "PICTURE CHARACTER l" TO FEATURE.                       NC1244.2 110
   001245         124800     MOVE  12                   TO WORK-AREA-12.                  NC1244.2 50
   001246         124900     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001247         125000 PICTURE-TEST-12.                                                 NC1244.2
   001248         125100     MOVE WORK-AREA-12 TO EDIT-AREA-9  EDIT-AREA-10               NC1244.2 50 92 93
   001249         125200                          EDIT-AREA-11  EDIT-AREA-12.             NC1244.2 94 95
   001250         125300     GO TO PICTURE-TEST-12-A.                                     NC1244.2 1255
   001251         125400 PICTURE-DELETE-12.                                               NC1244.2
   001252         125500     PERFORM DE-LETE.                                             NC1244.2 266
   001253         125600     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001254         125700     GO TO PICTURE-INIT-13.                                       NC1244.2 1290
   001255         125800 PICTURE-TEST-12-A.                                               NC1244.2
   001256         125900     IF EDIT-AREA-9 EQUAL TO " $12"                               NC1244.2 92
   001257      1  126000        PERFORM PASS                                              NC1244.2 264
   001258      1  126100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001259      1  126200        ELSE PERFORM FAIL                                         NC1244.2 265
   001260      1  126300        MOVE EDIT-AREA-9 TO COMPUTED-A                            NC1244.2 92 125
   001261      1  126400        MOVE " $12" TO CORRECT-A                                  NC1244.2 139
   001262      1  126500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001263         126600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001264         126700 PICTURE-TEST-12-B.                                               NC1244.2
   001265         126800     IF EDIT-AREA-10 EQUAL TO "  $12"                             NC1244.2 93
   001266      1  126900        PERFORM PASS                                              NC1244.2 264
   001267      1  127000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001268      1  127100        ELSE PERFORM FAIL                                         NC1244.2 265
   001269      1  127200        MOVE EDIT-AREA-10 TO COMPUTED-A                           NC1244.2 93 125
   001270      1  127300        MOVE "  $12" TO CORRECT-A                                 NC1244.2 139
   001271      1  127400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001272         127500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001273         127600 PICTURE-TEST-12-C.                                               NC1244.2
   001274         127700     IF EDIT-AREA-11 EQUAL TO "  $12.00"                          NC1244.2 94
   001275      1  127800        PERFORM PASS                                              NC1244.2 264
   001276      1  127900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001277      1  128000        ELSE PERFORM FAIL                                         NC1244.2 265
   001278      1  128100        MOVE EDIT-AREA-11 TO COMPUTED-A                           NC1244.2 94 125
   001279      1  128200        MOVE "  $12.00" TO CORRECT-A                              NC1244.2 139
   001280      1  128300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001281         128400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001282         128500 PICTURE-TEST-12-D.                                               NC1244.2
   001283         128600     IF EDIT-AREA-12 EQUAL TO "   $12.00"                         NC1244.2 95
   001284      1  128700        PERFORM PASS                                              NC1244.2 264
   001285      1  128800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001286      1  128900        ELSE PERFORM FAIL                                         NC1244.2 265
   001287      1  129000        MOVE EDIT-AREA-12 TO COMPUTED-A                           NC1244.2 95 125
   001288      1  129100        MOVE "   $12.00" TO CORRECT-A                             NC1244.2 139
   001289      1  129200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001290         129300 PICTURE-INIT-13.                                                 NC1244.2
   001291         129400     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001292         129500     MOVE "PCTRE-TST-13" TO PAR-NAME.                             NC1244.2 114
   001293         129600     MOVE "PICTURE CHARACTER l" TO FEATURE.                       NC1244.2 110
   001294         129700     MOVE  12.34                TO WORK-AREA-13.                  NC1244.2 51
   001295         129800     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001296         129900 PICTURE-TEST-13.                                                 NC1244.2
   001297         130000     MOVE WORK-AREA-13 TO EDIT-AREA-9  EDIT-AREA-10               NC1244.2 51 92 93
   001298         130100                          EDIT-AREA-11  EDIT-AREA-12.             NC1244.2 94 95
   001299         130200     GO TO PICTURE-TEST-13-A.                                     NC1244.2 1304
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001300         130300 PICTURE-DELETE-13.                                               NC1244.2
   001301         130400     PERFORM DE-LETE.                                             NC1244.2 266
   001302         130500     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001303         130600     GO TO PICTURE-INIT-14.                                       NC1244.2 1339
   001304         130700 PICTURE-TEST-13-A.                                               NC1244.2
   001305         130800     IF EDIT-AREA-9 EQUAL TO " $12"                               NC1244.2 92
   001306      1  130900        PERFORM PASS                                              NC1244.2 264
   001307      1  131000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001308      1  131100        ELSE PERFORM FAIL                                         NC1244.2 265
   001309      1  131200        MOVE EDIT-AREA-9 TO COMPUTED-A                            NC1244.2 92 125
   001310      1  131300        MOVE " $12" TO CORRECT-A                                  NC1244.2 139
   001311      1  131400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001312         131500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001313         131600 PICTURE-TEST-13-B.                                               NC1244.2
   001314         131700     IF EDIT-AREA-10 EQUAL TO "  $12"                             NC1244.2 93
   001315      1  131800        PERFORM PASS                                              NC1244.2 264
   001316      1  131900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001317      1  132000        ELSE PERFORM FAIL                                         NC1244.2 265
   001318      1  132100        MOVE EDIT-AREA-10 TO COMPUTED-A                           NC1244.2 93 125
   001319      1  132200        MOVE "  $12" TO CORRECT-A                                 NC1244.2 139
   001320      1  132300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001321         132400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001322         132500 PICTURE-TEST-13-C.                                               NC1244.2
   001323         132600     IF EDIT-AREA-11 EQUAL TO "  $12.34"                          NC1244.2 94
   001324      1  132700        PERFORM PASS                                              NC1244.2 264
   001325      1  132800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001326      1  132900        ELSE PERFORM FAIL                                         NC1244.2 265
   001327      1  133000        MOVE EDIT-AREA-11 TO COMPUTED-A                           NC1244.2 94 125
   001328      1  133100        MOVE "  $12.34" TO CORRECT-A                              NC1244.2 139
   001329      1  133200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001330         133300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001331         133400 PICTURE-TEST-13-D.                                               NC1244.2
   001332         133500     IF EDIT-AREA-12 EQUAL TO "   $12.34"                         NC1244.2 95
   001333      1  133600        PERFORM PASS                                              NC1244.2 264
   001334      1  133700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001335      1  133800        ELSE PERFORM FAIL                                         NC1244.2 265
   001336      1  133900        MOVE EDIT-AREA-12 TO COMPUTED-A                           NC1244.2 95 125
   001337      1  134000        MOVE "   $12.34" TO CORRECT-A                             NC1244.2 139
   001338      1  134100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001339         134200 PICTURE-INIT-14.                                                 NC1244.2
   001340         134300     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001341         134400     MOVE "PCTRE-TST-14" TO PAR-NAME.                             NC1244.2 114
   001342         134500     MOVE "PICTURE CHARACTER l" TO FEATURE.                       NC1244.2 110
   001343         134600     MOVE  1234                 TO WORK-AREA-14.                  NC1244.2 52
   001344         134700     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001345         134800 PICTURE-TEST-14.                                                 NC1244.2
   001346         134900     MOVE WORK-AREA-14 TO EDIT-AREA-9  EDIT-AREA-10               NC1244.2 52 92 93
   001347         135000                          EDIT-AREA-11  EDIT-AREA-12.             NC1244.2 94 95
   001348         135100     GO TO PICTURE-TEST-14-A.                                     NC1244.2 1353
   001349         135200 PICTURE-DELETE-14.                                               NC1244.2
   001350         135300     PERFORM DE-LETE.                                             NC1244.2 266
   001351         135400     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001352         135500     GO TO PICTURE-INIT-15.                                       NC1244.2 1388
   001353         135600 PICTURE-TEST-14-A.                                               NC1244.2
   001354         135700     IF EDIT-AREA-9 EQUAL TO "$234"                               NC1244.2 92
   001355      1  135800        PERFORM PASS                                              NC1244.2 264
   001356      1  135900        PERFORM PRINT-DETAIL                                      NC1244.2 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001357      1  136000        ELSE PERFORM FAIL                                         NC1244.2 265
   001358      1  136100        MOVE EDIT-AREA-9 TO COMPUTED-A                            NC1244.2 92 125
   001359      1  136200        MOVE "$234" TO CORRECT-A                                  NC1244.2 139
   001360      1  136300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001361         136400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001362         136500 PICTURE-TEST-14-B.                                               NC1244.2
   001363         136600     IF EDIT-AREA-10 EQUAL TO "$1234"                             NC1244.2 93
   001364      1  136700        PERFORM PASS                                              NC1244.2 264
   001365      1  136800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001366      1  136900        ELSE PERFORM FAIL                                         NC1244.2 265
   001367      1  137000        MOVE EDIT-AREA-10 TO COMPUTED-A                           NC1244.2 93 125
   001368      1  137100        MOVE "$1234" TO CORRECT-A                                 NC1244.2 139
   001369      1  137200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001370         137300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001371         137400 PICTURE-TEST-14-C.                                               NC1244.2
   001372         137500     IF EDIT-AREA-11 EQUAL TO "$1234.00"                          NC1244.2 94
   001373      1  137600        PERFORM PASS                                              NC1244.2 264
   001374      1  137700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001375      1  137800        ELSE PERFORM FAIL                                         NC1244.2 265
   001376      1  137900        MOVE EDIT-AREA-11 TO COMPUTED-A                           NC1244.2 94 125
   001377      1  138000        MOVE "$1234.00" TO CORRECT-A                              NC1244.2 139
   001378      1  138100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001379         138200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001380         138300 PICTURE-TEST-14-D.                                               NC1244.2
   001381         138400     IF EDIT-AREA-12 EQUAL TO "$1,234.00"                         NC1244.2 95
   001382      1  138500        PERFORM PASS                                              NC1244.2 264
   001383      1  138600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001384      1  138700        ELSE PERFORM FAIL                                         NC1244.2 265
   001385      1  138800        MOVE EDIT-AREA-12 TO COMPUTED-A                           NC1244.2 95 125
   001386      1  138900        MOVE "$1,234.00" TO CORRECT-A                             NC1244.2 139
   001387      1  139000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001388         139100 PICTURE-INIT-15.                                                 NC1244.2
   001389         139200     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001390         139300     MOVE "PCTRE-TST-15" TO PAR-NAME.                             NC1244.2 114
   001391         139400     MOVE "PICTURE CHARACTER l" TO FEATURE.                       NC1244.2 110
   001392         139500     MOVE  1234.56              TO WORK-AREA-15.                  NC1244.2 53
   001393         139600     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001394         139700 PICTURE-TEST-15.                                                 NC1244.2
   001395         139800     MOVE WORK-AREA-15 TO EDIT-AREA-9  EDIT-AREA-10               NC1244.2 53 92 93
   001396         139900                          EDIT-AREA-11  EDIT-AREA-12.             NC1244.2 94 95
   001397         140000     GO TO PICTURE-TEST-15-A.                                     NC1244.2 1402
   001398         140100 PICTURE-DELETE-15.                                               NC1244.2
   001399         140200     PERFORM DE-LETE.                                             NC1244.2 266
   001400         140300     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001401         140400     GO TO PICTURE-INIT-16.                                       NC1244.2 1437
   001402         140500 PICTURE-TEST-15-A.                                               NC1244.2
   001403         140600     IF EDIT-AREA-9 EQUAL TO "$234"                               NC1244.2 92
   001404      1  140700        PERFORM PASS                                              NC1244.2 264
   001405      1  140800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001406      1  140900        ELSE PERFORM FAIL                                         NC1244.2 265
   001407      1  141000        MOVE EDIT-AREA-9 TO COMPUTED-A                            NC1244.2 92 125
   001408      1  141100        MOVE "$234" TO CORRECT-A                                  NC1244.2 139
   001409      1  141200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001410         141300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001411         141400 PICTURE-TEST-15-B.                                               NC1244.2
   001412         141500     IF EDIT-AREA-10 EQUAL TO "$1234"                             NC1244.2 93
   001413      1  141600        PERFORM PASS                                              NC1244.2 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001414      1  141700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001415      1  141800        ELSE PERFORM FAIL                                         NC1244.2 265
   001416      1  141900        MOVE EDIT-AREA-10 TO COMPUTED-A                           NC1244.2 93 125
   001417      1  142000        MOVE "$1234" TO CORRECT-A                                 NC1244.2 139
   001418      1  142100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001419         142200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001420         142300 PICTURE-TEST-15-C.                                               NC1244.2
   001421         142400     IF EDIT-AREA-11 EQUAL TO "$1234.56"                          NC1244.2 94
   001422      1  142500        PERFORM PASS                                              NC1244.2 264
   001423      1  142600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001424      1  142700        ELSE PERFORM FAIL                                         NC1244.2 265
   001425      1  142800        MOVE EDIT-AREA-11 TO COMPUTED-A                           NC1244.2 94 125
   001426      1  142900        MOVE "$1234.56" TO CORRECT-A                              NC1244.2 139
   001427      1  143000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001428         143100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001429         143200 PICTURE-TEST-15-D.                                               NC1244.2
   001430         143300     IF EDIT-AREA-12 EQUAL TO "$1,234.56"                         NC1244.2 95
   001431      1  143400        PERFORM PASS                                              NC1244.2 264
   001432      1  143500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001433      1  143600        ELSE PERFORM FAIL                                         NC1244.2 265
   001434      1  143700        MOVE EDIT-AREA-12 TO COMPUTED-A                           NC1244.2 95 125
   001435      1  143800        MOVE "$1,234.56" TO CORRECT-A                             NC1244.2 139
   001436      1  143900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001437         144000 PICTURE-INIT-16.                                                 NC1244.2
   001438         144100     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001439         144200     MOVE "PCTRE-TST-16" TO PAR-NAME.                             NC1244.2 114
   001440         144300     MOVE "PICTURE CHARACTER *" TO FEATURE.                       NC1244.2 110
   001441         144400     MOVE  0                    TO WORK-AREA-16.                  NC1244.2 54
   001442         144500     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001443         144600 PICTURE-TEST-16.                                                 NC1244.2
   001444         144700     MOVE WORK-AREA-16 TO EDIT-AREA-13  EDIT-AREA-14  EDIT-AREA-15NC1244.2 54 96 97 98
   001445         144800                          EDIT-AREA-16  EDIT-AREA-17.             NC1244.2 99 100
   001446         144900     GO TO PICTURE-TEST-16-A.                                     NC1244.2 1451
   001447         145000 PICTURE-DELETE-16.                                               NC1244.2
   001448         145100     PERFORM DE-LETE.                                             NC1244.2 266
   001449         145200     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001450         145300     GO TO PICTURE-INIT-17.                                       NC1244.2 1495
   001451         145400 PICTURE-TEST-16-A.                                               NC1244.2
   001452         145500     IF EDIT-AREA-13 EQUAL TO "*000"                              NC1244.2 96
   001453      1  145600        PERFORM PASS                                              NC1244.2 264
   001454      1  145700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001455      1  145800        ELSE PERFORM FAIL                                         NC1244.2 265
   001456      1  145900        MOVE EDIT-AREA-13 TO COMPUTED-A                           NC1244.2 96 125
   001457      1  146000        MOVE "*000" TO CORRECT-A                                  NC1244.2 139
   001458      1  146100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001459         146200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001460         146300 PICTURE-TEST-16-B.                                               NC1244.2
   001461         146400     IF EDIT-AREA-14 EQUAL TO "**00"                              NC1244.2 97
   001462      1  146500        PERFORM PASS                                              NC1244.2 264
   001463      1  146600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001464      1  146700        ELSE PERFORM FAIL                                         NC1244.2 265
   001465      1  146800        MOVE EDIT-AREA-14 TO COMPUTED-A                           NC1244.2 97 125
   001466      1  146900        MOVE "**00" TO CORRECT-A                                  NC1244.2 139
   001467      1  147000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001468         147100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001469         147200 PICTURE-TEST-16-C.                                               NC1244.2
   001470         147300     IF EDIT-AREA-15 EQUAL TO "***0"                              NC1244.2 98
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001471      1  147400        PERFORM PASS                                              NC1244.2 264
   001472      1  147500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001473      1  147600        ELSE PERFORM FAIL                                         NC1244.2 265
   001474      1  147700        MOVE EDIT-AREA-15 TO COMPUTED-A                           NC1244.2 98 125
   001475      1  147800        MOVE "***0" TO CORRECT-A                                  NC1244.2 139
   001476      1  147900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001477         148000     ADD 1 TO REC-CT.                                             NC1244.2 161
   001478         148100 PICTURE-TEST-16-D.                                               NC1244.2
   001479         148200     IF EDIT-AREA-16 EQUAL TO "**.**"                             NC1244.2 99
   001480      1  148300        PERFORM PASS                                              NC1244.2 264
   001481      1  148400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001482      1  148500        ELSE PERFORM FAIL                                         NC1244.2 265
   001483      1  148600        MOVE EDIT-AREA-16 TO COMPUTED-A                           NC1244.2 99 125
   001484      1  148700        MOVE "**.**" TO CORRECT-A                                 NC1244.2 139
   001485      1  148800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001486         148900     ADD 1 TO REC-CT.                                             NC1244.2 161
   001487         149000 PICTURE-TEST-16-E.                                               NC1244.2
   001488         149100     IF EDIT-AREA-17 EQUAL TO "*****.**"                          NC1244.2 100
   001489      1  149200        PERFORM PASS                                              NC1244.2 264
   001490      1  149300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001491      1  149400        ELSE PERFORM FAIL                                         NC1244.2 265
   001492      1  149500        MOVE EDIT-AREA-17 TO COMPUTED-A                           NC1244.2 100 125
   001493      1  149600        MOVE "*****.**" TO CORRECT-A                              NC1244.2 139
   001494      1  149700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001495         149800 PICTURE-INIT-17.                                                 NC1244.2
   001496         149900     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001497         150000     MOVE "PCTRE-TST-17" TO PAR-NAME.                             NC1244.2 114
   001498         150100     MOVE "PICTURE CHARACTER *" TO FEATURE.                       NC1244.2 110
   001499         150200     MOVE  13                   TO WORK-AREA-17.                  NC1244.2 55
   001500         150300     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001501         150400 PICTURE-TEST-17.                                                 NC1244.2
   001502         150500     MOVE WORK-AREA-17 TO EDIT-AREA-13  EDIT-AREA-14  EDIT-AREA-15NC1244.2 55 96 97 98
   001503         150600                          EDIT-AREA-16  EDIT-AREA-17.             NC1244.2 99 100
   001504         150700     GO TO PICTURE-TEST-17-A.                                     NC1244.2 1509
   001505         150800 PICTURE-DELETE-17.                                               NC1244.2
   001506         150900     PERFORM DE-LETE.                                             NC1244.2 266
   001507         151000     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001508         151100     GO TO PICTURE-INIT-18.                                       NC1244.2 1553
   001509         151200 PICTURE-TEST-17-A.                                               NC1244.2
   001510         151300     IF EDIT-AREA-13 EQUAL TO "*013"                              NC1244.2 96
   001511      1  151400        PERFORM PASS                                              NC1244.2 264
   001512      1  151500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001513      1  151600        ELSE PERFORM FAIL                                         NC1244.2 265
   001514      1  151700        MOVE EDIT-AREA-13 TO COMPUTED-A                           NC1244.2 96 125
   001515      1  151800        MOVE "*013" TO CORRECT-A                                  NC1244.2 139
   001516      1  151900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001517         152000     ADD 1 TO REC-CT.                                             NC1244.2 161
   001518         152100 PICTURE-TEST-17-B.                                               NC1244.2
   001519         152200     IF EDIT-AREA-14 EQUAL TO "**13"                              NC1244.2 97
   001520      1  152300        PERFORM PASS                                              NC1244.2 264
   001521      1  152400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001522      1  152500        ELSE PERFORM FAIL                                         NC1244.2 265
   001523      1  152600        MOVE EDIT-AREA-14 TO COMPUTED-A                           NC1244.2 97 125
   001524      1  152700        MOVE "**13" TO CORRECT-A                                  NC1244.2 139
   001525      1  152800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001526         152900     ADD 1 TO REC-CT.                                             NC1244.2 161
   001527         153000 PICTURE-TEST-17-C.                                               NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001528         153100     IF EDIT-AREA-15 EQUAL TO "**13"                              NC1244.2 98
   001529      1  153200        PERFORM PASS                                              NC1244.2 264
   001530      1  153300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001531      1  153400        ELSE PERFORM FAIL                                         NC1244.2 265
   001532      1  153500        MOVE EDIT-AREA-15 TO COMPUTED-A                           NC1244.2 98 125
   001533      1  153600        MOVE "**13" TO CORRECT-A                                  NC1244.2 139
   001534      1  153700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001535         153800     ADD 1 TO REC-CT.                                             NC1244.2 161
   001536         153900 PICTURE-TEST-17-D.                                               NC1244.2
   001537         154000     IF EDIT-AREA-16 EQUAL TO "13.00"                             NC1244.2 99
   001538      1  154100        PERFORM PASS                                              NC1244.2 264
   001539      1  154200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001540      1  154300        ELSE PERFORM FAIL                                         NC1244.2 265
   001541      1  154400        MOVE EDIT-AREA-16 TO COMPUTED-A                           NC1244.2 99 125
   001542      1  154500        MOVE "13.00" TO CORRECT-A                                 NC1244.2 139
   001543      1  154600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001544         154700     ADD 1 TO REC-CT.                                             NC1244.2 161
   001545         154800 PICTURE-TEST-17-E.                                               NC1244.2
   001546         154900     IF EDIT-AREA-17 EQUAL TO "***13.00"                          NC1244.2 100
   001547      1  155000        PERFORM PASS                                              NC1244.2 264
   001548      1  155100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001549      1  155200        ELSE PERFORM FAIL                                         NC1244.2 265
   001550      1  155300        MOVE EDIT-AREA-17 TO COMPUTED-A                           NC1244.2 100 125
   001551      1  155400        MOVE "***13.00" TO CORRECT-A                              NC1244.2 139
   001552      1  155500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001553         155600 PICTURE-INIT-18.                                                 NC1244.2
   001554         155700     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001555         155800     MOVE "PCTRE-TST-18" TO PAR-NAME.                             NC1244.2 114
   001556         155900     MOVE "PICTURE CHARACTER *" TO FEATURE.                       NC1244.2 110
   001557         156000     MOVE  123   TO WORK-AREA-18.                                 NC1244.2 56
   001558         156100     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001559         156200 PICTURE-TEST-18.                                                 NC1244.2
   001560         156300     MOVE WORK-AREA-18 TO EDIT-AREA-13  EDIT-AREA-14  EDIT-AREA-15NC1244.2 56 96 97 98
   001561         156400                          EDIT-AREA-16  EDIT-AREA-17.             NC1244.2 99 100
   001562         156500     GO TO PICTURE-TEST-18-A.                                     NC1244.2 1567
   001563         156600 PICTURE-DELETE-18.                                               NC1244.2
   001564         156700     PERFORM DE-LETE.                                             NC1244.2 266
   001565         156800     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001566         156900     GO TO PICTURE-INIT-19.                                       NC1244.2 1611
   001567         157000 PICTURE-TEST-18-A.                                               NC1244.2
   001568         157100     IF EDIT-AREA-13 EQUAL TO "*123"                              NC1244.2 96
   001569      1  157200        PERFORM PASS                                              NC1244.2 264
   001570      1  157300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001571      1  157400        ELSE PERFORM FAIL                                         NC1244.2 265
   001572      1  157500        MOVE EDIT-AREA-13 TO COMPUTED-A                           NC1244.2 96 125
   001573      1  157600        MOVE "*123" TO CORRECT-A                                  NC1244.2 139
   001574      1  157700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001575         157800     ADD 1 TO REC-CT.                                             NC1244.2 161
   001576         157900 PICTURE-TEST-18-B.                                               NC1244.2
   001577         158000     IF EDIT-AREA-14 EQUAL TO "*123"                              NC1244.2 97
   001578      1  158100        PERFORM PASS                                              NC1244.2 264
   001579      1  158200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001580      1  158300        ELSE PERFORM FAIL                                         NC1244.2 265
   001581      1  158400        MOVE EDIT-AREA-14 TO COMPUTED-A                           NC1244.2 97 125
   001582      1  158500        MOVE "*123" TO CORRECT-A                                  NC1244.2 139
   001583      1  158600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001584         158700     ADD 1 TO REC-CT.                                             NC1244.2 161
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001585         158800 PICTURE-TEST-18-C.                                               NC1244.2
   001586         158900     IF EDIT-AREA-15 EQUAL TO "*123"                              NC1244.2 98
   001587      1  159000        PERFORM PASS                                              NC1244.2 264
   001588      1  159100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001589      1  159200        ELSE PERFORM FAIL                                         NC1244.2 265
   001590      1  159300        MOVE EDIT-AREA-15 TO COMPUTED-A                           NC1244.2 98 125
   001591      1  159400        MOVE "*123" TO CORRECT-A                                  NC1244.2 139
   001592      1  159500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001593         159600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001594         159700 PICTURE-TEST-18-D.                                               NC1244.2
   001595         159800     IF EDIT-AREA-16 EQUAL TO "23.00"                             NC1244.2 99
   001596      1  159900        PERFORM PASS                                              NC1244.2 264
   001597      1  160000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001598      1  160100        ELSE PERFORM FAIL                                         NC1244.2 265
   001599      1  160200        MOVE EDIT-AREA-16 TO COMPUTED-A                           NC1244.2 99 125
   001600      1  160300        MOVE "23.00" TO CORRECT-A                                 NC1244.2 139
   001601      1  160400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001602         160500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001603         160600 PICTURE-TEST-18-E.                                               NC1244.2
   001604         160700     IF EDIT-AREA-17 EQUAL TO "**123.00"                          NC1244.2 100
   001605      1  160800        PERFORM PASS                                              NC1244.2 264
   001606      1  160900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001607      1  161000        ELSE PERFORM FAIL                                         NC1244.2 265
   001608      1  161100        MOVE EDIT-AREA-17 TO COMPUTED-A                           NC1244.2 100 125
   001609      1  161200        MOVE "**123.00" TO CORRECT-A                              NC1244.2 139
   001610      1  161300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001611         161400 PICTURE-INIT-19.                                                 NC1244.2
   001612         161500     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001613         161600     MOVE "PCTRE-TST-19" TO PAR-NAME.                             NC1244.2 114
   001614         161700     MOVE "PICTURE CHARACTER *" TO FEATURE.                       NC1244.2 110
   001615         161800     MOVE  2010  TO WORK-AREA-19.                                 NC1244.2 57
   001616         161900     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001617         162000 PICTURE-TEST-19.                                                 NC1244.2
   001618         162100     MOVE WORK-AREA-19 TO EDIT-AREA-13  EDIT-AREA-14  EDIT-AREA-15NC1244.2 57 96 97 98
   001619         162200                          EDIT-AREA-16  EDIT-AREA-17.             NC1244.2 99 100
   001620         162300     GO TO PICTURE-TEST-19-A.                                     NC1244.2 1625
   001621         162400 PICTURE-DELETE-19.                                               NC1244.2
   001622         162500     PERFORM DE-LETE.                                             NC1244.2 266
   001623         162600     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001624         162700     GO TO PICTURE-INIT-20.                                       NC1244.2 1669
   001625         162800 PICTURE-TEST-19-A.                                               NC1244.2
   001626         162900     IF EDIT-AREA-13 EQUAL TO "2010"                              NC1244.2 96
   001627      1  163000        PERFORM PASS                                              NC1244.2 264
   001628      1  163100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001629      1  163200        ELSE PERFORM FAIL                                         NC1244.2 265
   001630      1  163300        MOVE EDIT-AREA-13 TO COMPUTED-A                           NC1244.2 96 125
   001631      1  163400        MOVE "2010" TO CORRECT-A                                  NC1244.2 139
   001632      1  163500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001633         163600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001634         163700 PICTURE-TEST-19-B.                                               NC1244.2
   001635         163800     IF EDIT-AREA-14 EQUAL TO "2010"                              NC1244.2 97
   001636      1  163900        PERFORM PASS                                              NC1244.2 264
   001637      1  164000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001638      1  164100        ELSE PERFORM FAIL                                         NC1244.2 265
   001639      1  164200        MOVE EDIT-AREA-14 TO COMPUTED-A                           NC1244.2 97 125
   001640      1  164300        MOVE "2010" TO CORRECT-A                                  NC1244.2 139
   001641      1  164400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001642         164500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001643         164600 PICTURE-TEST-19-C.                                               NC1244.2
   001644         164700     IF EDIT-AREA-15 EQUAL TO "2010"                              NC1244.2 98
   001645      1  164800        PERFORM PASS                                              NC1244.2 264
   001646      1  164900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001647      1  165000        ELSE PERFORM FAIL                                         NC1244.2 265
   001648      1  165100        MOVE EDIT-AREA-15 TO COMPUTED-A                           NC1244.2 98 125
   001649      1  165200        MOVE "2010" TO CORRECT-A                                  NC1244.2 139
   001650      1  165300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001651         165400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001652         165500 PICTURE-TEST-19-D.                                               NC1244.2
   001653         165600     IF EDIT-AREA-16 EQUAL TO "10.00"                             NC1244.2 99
   001654      1  165700        PERFORM PASS                                              NC1244.2 264
   001655      1  165800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001656      1  165900        ELSE PERFORM FAIL                                         NC1244.2 265
   001657      1  166000        MOVE EDIT-AREA-16 TO COMPUTED-A                           NC1244.2 99 125
   001658      1  166100        MOVE "10.00" TO CORRECT-A                                 NC1244.2 139
   001659      1  166200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001660         166300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001661         166400 PICTURE-TEST-19-E.                                               NC1244.2
   001662         166500     IF EDIT-AREA-17 EQUAL TO "2,010.00"                          NC1244.2 100
   001663      1  166600        PERFORM PASS                                              NC1244.2 264
   001664      1  166700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001665      1  166800        ELSE PERFORM FAIL                                         NC1244.2 265
   001666      1  166900        MOVE EDIT-AREA-17 TO COMPUTED-A                           NC1244.2 100 125
   001667      1  167000        MOVE "2,010.00" TO CORRECT-A                              NC1244.2 139
   001668      1  167100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001669         167200 PICTURE-INIT-20.                                                 NC1244.2
   001670         167300     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001671         167400     MOVE "PCTRE-TST-20" TO PAR-NAME.                             NC1244.2 114
   001672         167500     MOVE "PICTURE CHARACTER *" TO FEATURE.                       NC1244.2 110
   001673         167600     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001674         167700     MOVE  1010.2 TO WORK-AREA-20.                                NC1244.2 58
   001675         167800 PICTURE-TEST-20.                                                 NC1244.2
   001676         167900     MOVE WORK-AREA-20 TO EDIT-AREA-13  EDIT-AREA-14  EDIT-AREA-15NC1244.2 58 96 97 98
   001677         168000                          EDIT-AREA-16  EDIT-AREA-17.             NC1244.2 99 100
   001678         168100     GO TO PICTURE-TEST-20-A.                                     NC1244.2 1683
   001679         168200 PICTURE-DELETE-20.                                               NC1244.2
   001680         168300     PERFORM DE-LETE.                                             NC1244.2 266
   001681         168400     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001682         168500     GO TO PICTURE-INIT-21.                                       NC1244.2 1727
   001683         168600 PICTURE-TEST-20-A.                                               NC1244.2
   001684         168700     IF EDIT-AREA-13 EQUAL TO "1010"                              NC1244.2 96
   001685      1  168800        PERFORM PASS                                              NC1244.2 264
   001686      1  168900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001687      1  169000        ELSE PERFORM FAIL                                         NC1244.2 265
   001688      1  169100        MOVE EDIT-AREA-13 TO COMPUTED-A                           NC1244.2 96 125
   001689      1  169200        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
   001690      1  169300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001691         169400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001692         169500 PICTURE-TEST-20-B.                                               NC1244.2
   001693         169600     IF EDIT-AREA-14 EQUAL TO "1010"                              NC1244.2 97
   001694      1  169700        PERFORM PASS                                              NC1244.2 264
   001695      1  169800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001696      1  169900        ELSE PERFORM FAIL                                         NC1244.2 265
   001697      1  170000        MOVE EDIT-AREA-14 TO COMPUTED-A                           NC1244.2 97 125
   001698      1  170100        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001699      1  170200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001700         170300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001701         170400 PICTURE-TEST-20-C.                                               NC1244.2
   001702         170500     IF EDIT-AREA-15 EQUAL TO "1010"                              NC1244.2 98
   001703      1  170600        PERFORM PASS                                              NC1244.2 264
   001704      1  170700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001705      1  170800        ELSE PERFORM FAIL                                         NC1244.2 265
   001706      1  170900        MOVE EDIT-AREA-15 TO COMPUTED-A                           NC1244.2 98 125
   001707      1  171000        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
   001708      1  171100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001709         171200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001710         171300 PICTURE-TEST-20-D.                                               NC1244.2
   001711         171400     IF EDIT-AREA-16 EQUAL TO "10.20"                             NC1244.2 99
   001712      1  171500        PERFORM PASS                                              NC1244.2 264
   001713      1  171600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001714      1  171700        ELSE PERFORM FAIL                                         NC1244.2 265
   001715      1  171800        MOVE EDIT-AREA-16 TO COMPUTED-A                           NC1244.2 99 125
   001716      1  171900        MOVE "10.20" TO CORRECT-A                                 NC1244.2 139
   001717      1  172000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001718         172100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001719         172200 PICTURE-TEST-20-E.                                               NC1244.2
   001720         172300     IF EDIT-AREA-17 EQUAL TO "1,010.20"                          NC1244.2 100
   001721      1  172400        PERFORM PASS                                              NC1244.2 264
   001722      1  172500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001723      1  172600        ELSE PERFORM FAIL                                         NC1244.2 265
   001724      1  172700        MOVE EDIT-AREA-17 TO COMPUTED-A                           NC1244.2 100 125
   001725      1  172800        MOVE "1,010.20" TO CORRECT-A                              NC1244.2 139
   001726      1  172900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001727         173000 PICTURE-INIT-21.                                                 NC1244.2
   001728         173100     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001729         173200     MOVE "PCTRE-TST-21" TO PAR-NAME.                             NC1244.2 114
   001730         173300     MOVE "PICTURE CHARACTER *" TO FEATURE.                       NC1244.2 110
   001731         173400     MOVE  .01    TO WORK-AREA-21.                                NC1244.2 59
   001732         173500     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001733         173600 PICTURE-TEST-21.                                                 NC1244.2
   001734         173700     MOVE WORK-AREA-21 TO EDIT-AREA-13  EDIT-AREA-14  EDIT-AREA-15NC1244.2 59 96 97 98

 ==001734==> IGYPA3087-W "WORK-AREA-21 (NUMERIC NON-INTEGER)" and "EDIT-AREA-13 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==001734==> IGYPA3087-W "WORK-AREA-21 (NUMERIC NON-INTEGER)" and "EDIT-AREA-14 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==001734==> IGYPA3087-W "WORK-AREA-21 (NUMERIC NON-INTEGER)" and "EDIT-AREA-15 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

   001735         173800                          EDIT-AREA-16  EDIT-AREA-17.             NC1244.2 99 100
   001736         173900     GO TO PICTURE-TEST-21-A.                                     NC1244.2 1741
   001737         174000 PICTURE-DELETE-21.                                               NC1244.2
   001738         174100     PERFORM DE-LETE.                                             NC1244.2 266
   001739         174200     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001740         174300     GO TO PICTURE-INIT-22.                                       NC1244.2 1785
   001741         174400 PICTURE-TEST-21-A.                                               NC1244.2
   001742         174500     IF EDIT-AREA-13 EQUAL TO "*000"                              NC1244.2 96
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001743      1  174600        PERFORM PASS                                              NC1244.2 264
   001744      1  174700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001745      1  174800        ELSE PERFORM FAIL                                         NC1244.2 265
   001746      1  174900        MOVE EDIT-AREA-13 TO COMPUTED-A                           NC1244.2 96 125
   001747      1  175000        MOVE "*000" TO CORRECT-A                                  NC1244.2 139
   001748      1  175100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001749         175200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001750         175300 PICTURE-TEST-21-B.                                               NC1244.2
   001751         175400     IF EDIT-AREA-14 EQUAL TO "**00"                              NC1244.2 97
   001752      1  175500        PERFORM PASS                                              NC1244.2 264
   001753      1  175600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001754      1  175700        ELSE PERFORM FAIL                                         NC1244.2 265
   001755      1  175800        MOVE EDIT-AREA-14 TO COMPUTED-A                           NC1244.2 97 125
   001756      1  175900        MOVE "**00" TO CORRECT-A                                  NC1244.2 139
   001757      1  176000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001758         176100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001759         176200 PICTURE-TEST-21-C.                                               NC1244.2
   001760         176300     IF EDIT-AREA-15 EQUAL TO "***0"                              NC1244.2 98
   001761      1  176400        PERFORM PASS                                              NC1244.2 264
   001762      1  176500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001763      1  176600        ELSE PERFORM FAIL                                         NC1244.2 265
   001764      1  176700        MOVE EDIT-AREA-15 TO COMPUTED-A                           NC1244.2 98 125
   001765      1  176800        MOVE "***0" TO CORRECT-A                                  NC1244.2 139
   001766      1  176900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001767         177000     ADD 1 TO REC-CT.                                             NC1244.2 161
   001768         177100 PICTURE-TEST-21-D.                                               NC1244.2
   001769         177200     IF EDIT-AREA-16 EQUAL TO "**.01"                             NC1244.2 99
   001770      1  177300        PERFORM PASS                                              NC1244.2 264
   001771      1  177400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001772      1  177500        ELSE PERFORM FAIL                                         NC1244.2 265
   001773      1  177600        MOVE EDIT-AREA-16 TO COMPUTED-A                           NC1244.2 99 125
   001774      1  177700        MOVE "**.01" TO CORRECT-A                                 NC1244.2 139
   001775      1  177800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001776         177900     ADD 1 TO REC-CT.                                             NC1244.2 161
   001777         178000 PICTURE-TEST-21-E.                                               NC1244.2
   001778         178100     IF EDIT-AREA-17 EQUAL TO "*****.01"                          NC1244.2 100
   001779      1  178200        PERFORM PASS                                              NC1244.2 264
   001780      1  178300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001781      1  178400        ELSE PERFORM FAIL                                         NC1244.2 265
   001782      1  178500        MOVE EDIT-AREA-17 TO COMPUTED-A                           NC1244.2 100 125
   001783      1  178600        MOVE "*****.01" TO CORRECT-A                              NC1244.2 139
   001784      1  178700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001785         178800 PICTURE-INIT-22.                                                 NC1244.2
   001786         178900     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001787         179000     MOVE "PCTRE-TST-22" TO PAR-NAME.                             NC1244.2 114
   001788         179100     MOVE "PICTURE CHARACTER Z" TO FEATURE.                       NC1244.2 110
   001789         179200     MOVE  0      TO WORK-AREA-22.                                NC1244.2 60
   001790         179300     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001791         179400 PICTURE-TEST-22.                                                 NC1244.2
   001792         179500     MOVE WORK-AREA-22 TO EDIT-AREA-18  EDIT-AREA-19  EDIT-AREA-20NC1244.2 60 101 102 103
   001793         179600                          EDIT-AREA-21  EDIT-AREA-22  EDIT-AREA-23NC1244.2 104 105 106
   001794         179700                          EDIT-AREA-24.                           NC1244.2 107
   001795         179800     GO TO PICTURE-TEST-22-A.                                     NC1244.2 1800
   001796         179900 PICTURE-DELETE-22.                                               NC1244.2
   001797         180000     PERFORM DE-LETE.                                             NC1244.2 266
   001798         180100     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001799         180200     GO TO PICTURE-INIT-23.                                       NC1244.2 1862
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001800         180300 PICTURE-TEST-22-A.                                               NC1244.2
   001801         180400     IF EDIT-AREA-18 EQUAL TO "0000"                              NC1244.2 101
   001802      1  180500        PERFORM PASS                                              NC1244.2 264
   001803      1  180600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001804      1  180700        ELSE PERFORM FAIL                                         NC1244.2 265
   001805      1  180800        MOVE EDIT-AREA-18 TO COMPUTED-A                           NC1244.2 101 125
   001806      1  180900        MOVE "0000" TO CORRECT-A                                  NC1244.2 139
   001807      1  181000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001808         181100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001809         181200 PICTURE-TEST-22-B.                                               NC1244.2
   001810         181300     IF EDIT-AREA-19 EQUAL TO " 000"                              NC1244.2 102
   001811      1  181400        PERFORM PASS                                              NC1244.2 264
   001812      1  181500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001813      1  181600        ELSE PERFORM FAIL                                         NC1244.2 265
   001814      1  181700        MOVE EDIT-AREA-19 TO COMPUTED-A                           NC1244.2 102 125
   001815      1  181800        MOVE " 000" TO CORRECT-A                                  NC1244.2 139
   001816      1  181900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001817         182000     ADD 1 TO REC-CT.                                             NC1244.2 161
   001818         182100 PICTURE-TEST-22-C.                                               NC1244.2
   001819         182200     IF EDIT-AREA-20 EQUAL TO "  00"                              NC1244.2 103
   001820      1  182300        PERFORM PASS                                              NC1244.2 264
   001821      1  182400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001822      1  182500        ELSE PERFORM FAIL                                         NC1244.2 265
   001823      1  182600        MOVE EDIT-AREA-20 TO COMPUTED-A                           NC1244.2 103 125
   001824      1  182700        MOVE "  00" TO CORRECT-A                                  NC1244.2 139
   001825      1  182800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001826         182900     ADD 1 TO REC-CT.                                             NC1244.2 161
   001827         183000 PICTURE-TEST-22-D.                                               NC1244.2
   001828         183100     IF EDIT-AREA-21 EQUAL TO "   0"                              NC1244.2 104
   001829      1  183200        PERFORM PASS                                              NC1244.2 264
   001830      1  183300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001831      1  183400        ELSE PERFORM FAIL                                         NC1244.2 265
   001832      1  183500        MOVE EDIT-AREA-21 TO COMPUTED-A                           NC1244.2 104 125
   001833      1  183600        MOVE "   0" TO CORRECT-A                                  NC1244.2 139
   001834      1  183700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001835         183800     ADD 1 TO REC-CT.                                             NC1244.2 161
   001836         183900 PICTURE-TEST-22-E.                                               NC1244.2
   001837         184000     IF EDIT-AREA-22 EQUAL TO "    "                              NC1244.2 105
   001838      1  184100        PERFORM PASS                                              NC1244.2 264
   001839      1  184200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001840      1  184300        ELSE PERFORM FAIL                                         NC1244.2 265
   001841      1  184400        MOVE EDIT-AREA-22 TO COMPUTED-A                           NC1244.2 105 125
   001842      1  184500        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   001843      1  184600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001844         184700     ADD 1 TO REC-CT.                                             NC1244.2 161
   001845         184800 PICTURE-TEST-22-F.                                               NC1244.2
   001846         184900     IF EDIT-AREA-23 EQUAL TO "     "                             NC1244.2 106
   001847      1  185000        PERFORM PASS                                              NC1244.2 264
   001848      1  185100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001849      1  185200        ELSE PERFORM FAIL                                         NC1244.2 265
   001850      1  185300        MOVE EDIT-AREA-23 TO COMPUTED-A                           NC1244.2 106 125
   001851      1  185400        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   001852      1  185500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001853         185600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001854         185700 PICTURE-TEST-22-G.                                               NC1244.2
   001855         185800     IF EDIT-AREA-24 EQUAL TO "     "                             NC1244.2 107
   001856      1  185900        PERFORM PASS                                              NC1244.2 264
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001857      1  186000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001858      1  186100        ELSE PERFORM FAIL                                         NC1244.2 265
   001859      1  186200        MOVE EDIT-AREA-24 TO COMPUTED-A                           NC1244.2 107 125
   001860      1  186300        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   001861      1  186400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001862         186500 PICTURE-INIT-23.                                                 NC1244.2
   001863         186600     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001864         186700     MOVE "PCTRE-TST-23" TO PAR-NAME.                             NC1244.2 114
   001865         186800     MOVE "PICTURE CHARACTER Z" TO FEATURE.                       NC1244.2 110
   001866         186900     MOVE  1.01   TO WORK-AREA-23.                                NC1244.2 61
   001867         187000     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001868         187100 PICTURE-TEST-23.                                                 NC1244.2
   001869         187200     MOVE WORK-AREA-23 TO EDIT-AREA-18  EDIT-AREA-19  EDIT-AREA-20NC1244.2 61 101 102 103
   001870         187300                          EDIT-AREA-21  EDIT-AREA-22  EDIT-AREA-23NC1244.2 104 105 106
   001871         187400                          EDIT-AREA-24.                           NC1244.2 107
   001872         187500     GO TO PICTURE-TEST-23-A.                                     NC1244.2 1877
   001873         187600 PICTURE-DELETE-23.                                               NC1244.2
   001874         187700     PERFORM DE-LETE.                                             NC1244.2 266
   001875         187800     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001876         187900     GO TO PICTURE-INIT-24.                                       NC1244.2 1939
   001877         188000 PICTURE-TEST-23-A.                                               NC1244.2
   001878         188100     IF EDIT-AREA-18 EQUAL TO "0001"                              NC1244.2 101
   001879      1  188200        PERFORM PASS                                              NC1244.2 264
   001880      1  188300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001881      1  188400        ELSE PERFORM FAIL                                         NC1244.2 265
   001882      1  188500        MOVE EDIT-AREA-18 TO COMPUTED-A                           NC1244.2 101 125
   001883      1  188600        MOVE "0001" TO CORRECT-A                                  NC1244.2 139
   001884      1  188700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001885         188800     ADD 1 TO REC-CT.                                             NC1244.2 161
   001886         188900 PICTURE-TEST-23-B.                                               NC1244.2
   001887         189000     IF EDIT-AREA-19 EQUAL TO " 001"                              NC1244.2 102
   001888      1  189100        PERFORM PASS                                              NC1244.2 264
   001889      1  189200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001890      1  189300        ELSE PERFORM FAIL                                         NC1244.2 265
   001891      1  189400        MOVE EDIT-AREA-19 TO COMPUTED-A                           NC1244.2 102 125
   001892      1  189500        MOVE " 001" TO CORRECT-A                                  NC1244.2 139
   001893      1  189600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001894         189700     ADD 1 TO REC-CT.                                             NC1244.2 161
   001895         189800 PICTURE-TEST-23-C.                                               NC1244.2
   001896         189900     IF EDIT-AREA-20 EQUAL TO "  01"                              NC1244.2 103
   001897      1  190000        PERFORM PASS                                              NC1244.2 264
   001898      1  190100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001899      1  190200        ELSE PERFORM FAIL                                         NC1244.2 265
   001900      1  190300        MOVE EDIT-AREA-20 TO COMPUTED-A                           NC1244.2 103 125
   001901      1  190400        MOVE "  01" TO CORRECT-A                                  NC1244.2 139
   001902      1  190500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001903         190600     ADD 1 TO REC-CT.                                             NC1244.2 161
   001904         190700 PICTURE-TEST-23-D.                                               NC1244.2
   001905         190800     IF EDIT-AREA-21 EQUAL TO "   1"                              NC1244.2 104
   001906      1  190900        PERFORM PASS                                              NC1244.2 264
   001907      1  191000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001908      1  191100        ELSE PERFORM FAIL                                         NC1244.2 265
   001909      1  191200        MOVE EDIT-AREA-21 TO COMPUTED-A                           NC1244.2 104 125
   001910      1  191300        MOVE "   1" TO CORRECT-A                                  NC1244.2 139
   001911      1  191400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001912         191500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001913         191600 PICTURE-TEST-23-E.                                               NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001914         191700     IF EDIT-AREA-22 EQUAL TO "   1"                              NC1244.2 105
   001915      1  191800        PERFORM PASS                                              NC1244.2 264
   001916      1  191900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001917      1  192000        ELSE PERFORM FAIL                                         NC1244.2 265
   001918      1  192100        MOVE EDIT-AREA-22 TO COMPUTED-A                           NC1244.2 105 125
   001919      1  192200        MOVE "   1" TO CORRECT-A                                  NC1244.2 139
   001920      1  192300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001921         192400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001922         192500 PICTURE-TEST-23-F.                                               NC1244.2
   001923         192600     IF EDIT-AREA-23 EQUAL TO " 1.01"                             NC1244.2 106
   001924      1  192700        PERFORM PASS                                              NC1244.2 264
   001925      1  192800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001926      1  192900        ELSE PERFORM FAIL                                         NC1244.2 265
   001927      1  193000        MOVE EDIT-AREA-23 TO COMPUTED-A                           NC1244.2 106 125
   001928      1  193100        MOVE " 1.01" TO CORRECT-A                                 NC1244.2 139
   001929      1  193200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001930         193300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001931         193400 PICTURE-TEST-23-G.                                               NC1244.2
   001932         193500     IF EDIT-AREA-24 EQUAL TO "    1"                             NC1244.2 107
   001933      1  193600        PERFORM PASS                                              NC1244.2 264
   001934      1  193700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001935      1  193800        ELSE PERFORM FAIL                                         NC1244.2 265
   001936      1  193900        MOVE EDIT-AREA-24 TO COMPUTED-A                           NC1244.2 107 125
   001937      1  194000        MOVE "    1" TO CORRECT-A                                 NC1244.2 139
   001938      1  194100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001939         194200 PICTURE-INIT-24.                                                 NC1244.2
   001940         194300     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   001941         194400     MOVE "PCTRE-TST-24" TO PAR-NAME.                             NC1244.2 114
   001942         194500     MOVE "PICTURE CHARACTER Z" TO FEATURE.                       NC1244.2 110
   001943         194600     MOVE  217    TO WORK-AREA-24.                                NC1244.2 62
   001944         194700     MOVE 1 TO REC-CT.                                            NC1244.2 161
   001945         194800 PICTURE-TEST-24.                                                 NC1244.2
   001946         194900     MOVE WORK-AREA-24 TO EDIT-AREA-18  EDIT-AREA-19  EDIT-AREA-20NC1244.2 62 101 102 103
   001947         195000                          EDIT-AREA-21  EDIT-AREA-22  EDIT-AREA-23NC1244.2 104 105 106
   001948         195100                          EDIT-AREA-24.                           NC1244.2 107
   001949         195200     GO TO PICTURE-TEST-24-A.                                     NC1244.2 1954
   001950         195300 PICTURE-DELETE-24.                                               NC1244.2
   001951         195400     PERFORM DE-LETE.                                             NC1244.2 266
   001952         195500     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   001953         195600     GO TO PICTURE-INIT-25.                                       NC1244.2 2016
   001954         195700 PICTURE-TEST-24-A.                                               NC1244.2
   001955         195800     IF EDIT-AREA-18 EQUAL TO "0217"                              NC1244.2 101
   001956      1  195900        PERFORM PASS                                              NC1244.2 264
   001957      1  196000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001958      1  196100        ELSE PERFORM FAIL                                         NC1244.2 265
   001959      1  196200        MOVE EDIT-AREA-18 TO COMPUTED-A                           NC1244.2 101 125
   001960      1  196300        MOVE "0217" TO CORRECT-A                                  NC1244.2 139
   001961      1  196400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001962         196500     ADD 1 TO REC-CT.                                             NC1244.2 161
   001963         196600 PICTURE-TEST-24-B.                                               NC1244.2
   001964         196700     IF EDIT-AREA-19 EQUAL TO " 217"                              NC1244.2 102
   001965      1  196800        PERFORM PASS                                              NC1244.2 264
   001966      1  196900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001967      1  197000        ELSE PERFORM FAIL                                         NC1244.2 265
   001968      1  197100        MOVE EDIT-AREA-19 TO COMPUTED-A                           NC1244.2 102 125
   001969      1  197200        MOVE " 217" TO CORRECT-A                                  NC1244.2 139
   001970      1  197300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001971         197400     ADD 1 TO REC-CT.                                             NC1244.2 161
   001972         197500 PICTURE-TEST-24-C.                                               NC1244.2
   001973         197600     IF EDIT-AREA-20 EQUAL TO " 217"                              NC1244.2 103
   001974      1  197700        PERFORM PASS                                              NC1244.2 264
   001975      1  197800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001976      1  197900        ELSE PERFORM FAIL                                         NC1244.2 265
   001977      1  198000        MOVE EDIT-AREA-20 TO COMPUTED-A                           NC1244.2 103 125
   001978      1  198100        MOVE " 217" TO CORRECT-A                                  NC1244.2 139
   001979      1  198200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001980         198300     ADD 1 TO REC-CT.                                             NC1244.2 161
   001981         198400 PICTURE-TEST-24-D.                                               NC1244.2
   001982         198500     IF EDIT-AREA-21 EQUAL TO " 217"                              NC1244.2 104
   001983      1  198600        PERFORM PASS                                              NC1244.2 264
   001984      1  198700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001985      1  198800        ELSE PERFORM FAIL                                         NC1244.2 265
   001986      1  198900        MOVE EDIT-AREA-21 TO COMPUTED-A                           NC1244.2 104 125
   001987      1  199000        MOVE " 217" TO CORRECT-A                                  NC1244.2 139
   001988      1  199100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001989         199200     ADD 1 TO REC-CT.                                             NC1244.2 161
   001990         199300 PICTURE-TEST-24-E.                                               NC1244.2
   001991         199400     IF EDIT-AREA-22 EQUAL TO " 217"                              NC1244.2 105
   001992      1  199500        PERFORM PASS                                              NC1244.2 264
   001993      1  199600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   001994      1  199700        ELSE PERFORM FAIL                                         NC1244.2 265
   001995      1  199800        MOVE EDIT-AREA-22 TO COMPUTED-A                           NC1244.2 105 125
   001996      1  199900        MOVE " 217" TO CORRECT-A                                  NC1244.2 139
   001997      1  200000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   001998         200100     ADD 1 TO REC-CT.                                             NC1244.2 161
   001999         200200 PICTURE-TEST-24-F.                                               NC1244.2
   002000         200300     IF EDIT-AREA-23 EQUAL TO "17.00"                             NC1244.2 106
   002001      1  200400        PERFORM PASS                                              NC1244.2 264
   002002      1  200500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002003      1  200600        ELSE PERFORM FAIL                                         NC1244.2 265
   002004      1  200700        MOVE EDIT-AREA-23 TO COMPUTED-A                           NC1244.2 106 125
   002005      1  200800        MOVE "17.00" TO CORRECT-A                                 NC1244.2 139
   002006      1  200900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002007         201000     ADD 1 TO REC-CT.                                             NC1244.2 161
   002008         201100 PICTURE-TEST-24-G.                                               NC1244.2
   002009         201200     IF EDIT-AREA-24 EQUAL TO "  217"                             NC1244.2 107
   002010      1  201300        PERFORM PASS                                              NC1244.2 264
   002011      1  201400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002012      1  201500        ELSE PERFORM FAIL                                         NC1244.2 265
   002013      1  201600        MOVE EDIT-AREA-24 TO COMPUTED-A                           NC1244.2 107 125
   002014      1  201700        MOVE "  217" TO CORRECT-A                                 NC1244.2 139
   002015      1  201800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002016         201900 PICTURE-INIT-25.                                                 NC1244.2
   002017         202000     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002018         202100     MOVE "PCTRE-TST-25" TO PAR-NAME.                             NC1244.2 114
   002019         202200     MOVE "PICTURE CHARACTER Z" TO FEATURE.                       NC1244.2 110
   002020         202300     MOVE  1010.20 TO WORK-AREA-25.                               NC1244.2 63
   002021         202400     MOVE 1 TO REC-CT.                                            NC1244.2 161
   002022         202500 PICTURE-TEST-25.                                                 NC1244.2
   002023         202600     MOVE WORK-AREA-25 TO EDIT-AREA-18  EDIT-AREA-19  EDIT-AREA-20NC1244.2 63 101 102 103
   002024         202700                          EDIT-AREA-21  EDIT-AREA-22  EDIT-AREA-23NC1244.2 104 105 106
   002025         202800                          EDIT-AREA-24.                           NC1244.2 107
   002026         202900     GO TO PICTURE-TEST-25-A.                                     NC1244.2 2031
   002027         203000 PICTURE-DELETE-25.                                               NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002028         203100     PERFORM DE-LETE.                                             NC1244.2 266
   002029         203200     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002030         203300     GO TO PICTURE-INIT-26.                                       NC1244.2 2093
   002031         203400 PICTURE-TEST-25-A.                                               NC1244.2
   002032         203500     IF EDIT-AREA-18 EQUAL TO "1010"                              NC1244.2 101
   002033      1  203600        PERFORM PASS                                              NC1244.2 264
   002034      1  203700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002035      1  203800        ELSE PERFORM FAIL                                         NC1244.2 265
   002036      1  203900        MOVE EDIT-AREA-18 TO COMPUTED-A                           NC1244.2 101 125
   002037      1  204000        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
   002038      1  204100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002039         204200     ADD 1 TO REC-CT.                                             NC1244.2 161
   002040         204300 PICTURE-TEST-25-B.                                               NC1244.2
   002041         204400     IF EDIT-AREA-19 EQUAL TO "1010"                              NC1244.2 102
   002042      1  204500        PERFORM PASS                                              NC1244.2 264
   002043      1  204600        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002044      1  204700        ELSE PERFORM FAIL                                         NC1244.2 265
   002045      1  204800        MOVE EDIT-AREA-19 TO COMPUTED-A                           NC1244.2 102 125
   002046      1  204900        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
   002047      1  205000        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002048         205100     ADD 1 TO REC-CT.                                             NC1244.2 161
   002049         205200 PICTURE-TEST-25-C.                                               NC1244.2
   002050         205300     IF EDIT-AREA-20 EQUAL TO "1010"                              NC1244.2 103
   002051      1  205400        PERFORM PASS                                              NC1244.2 264
   002052      1  205500        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002053      1  205600        ELSE PERFORM FAIL                                         NC1244.2 265
   002054      1  205700        MOVE EDIT-AREA-20 TO COMPUTED-A                           NC1244.2 103 125
   002055      1  205800        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
   002056      1  205900        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002057         206000     ADD 1 TO REC-CT.                                             NC1244.2 161
   002058         206100 PICTURE-TEST-25-D.                                               NC1244.2
   002059         206200     IF EDIT-AREA-21 EQUAL TO "1010"                              NC1244.2 104
   002060      1  206300        PERFORM PASS                                              NC1244.2 264
   002061      1  206400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002062      1  206500        ELSE PERFORM FAIL                                         NC1244.2 265
   002063      1  206600        MOVE EDIT-AREA-21 TO COMPUTED-A                           NC1244.2 104 125
   002064      1  206700        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
   002065      1  206800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002066         206900     ADD 1 TO REC-CT.                                             NC1244.2 161
   002067         207000 PICTURE-TEST-25-E.                                               NC1244.2
   002068         207100     IF EDIT-AREA-22 EQUAL TO "1010"                              NC1244.2 105
   002069      1  207200        PERFORM PASS                                              NC1244.2 264
   002070      1  207300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002071      1  207400        ELSE PERFORM FAIL                                         NC1244.2 265
   002072      1  207500        MOVE EDIT-AREA-22 TO COMPUTED-A                           NC1244.2 105 125
   002073      1  207600        MOVE "1010" TO CORRECT-A                                  NC1244.2 139
   002074      1  207700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002075         207800     ADD 1 TO REC-CT.                                             NC1244.2 161
   002076         207900 PICTURE-TEST-25-F.                                               NC1244.2
   002077         208000     IF EDIT-AREA-23 EQUAL TO "10.20"                             NC1244.2 106
   002078      1  208100        PERFORM PASS                                              NC1244.2 264
   002079      1  208200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002080      1  208300        ELSE PERFORM FAIL                                         NC1244.2 265
   002081      1  208400        MOVE EDIT-AREA-23 TO COMPUTED-A                           NC1244.2 106 125
   002082      1  208500        MOVE "10.20" TO CORRECT-A                                 NC1244.2 139
   002083      1  208600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002084         208700     ADD 1 TO REC-CT.                                             NC1244.2 161
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002085         208800 PICTURE-TEST-25-G.                                               NC1244.2
   002086         208900     IF EDIT-AREA-24 EQUAL TO "1,010"                             NC1244.2 107
   002087      1  209000        PERFORM PASS                                              NC1244.2 264
   002088      1  209100        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002089      1  209200        ELSE PERFORM FAIL                                         NC1244.2 265
   002090      1  209300        MOVE EDIT-AREA-24 TO COMPUTED-A                           NC1244.2 107 125
   002091      1  209400        MOVE "1,010" TO CORRECT-A                                 NC1244.2 139
   002092      1  209500        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002093         209600 PICTURE-INIT-26.                                                 NC1244.2
   002094         209700     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002095         209800     MOVE "PCTRE-TST-26" TO PAR-NAME.                             NC1244.2 114
   002096         209900     MOVE "PICTURE CHARACTER Z" TO FEATURE.                       NC1244.2 110
   002097         210000     MOVE  .01     TO WORK-AREA-26.                               NC1244.2 64
   002098         210100     MOVE 1 TO REC-CT.                                            NC1244.2 161
   002099         210200 PICTURE-TEST-26.                                                 NC1244.2
   002100         210300     MOVE WORK-AREA-26 TO EDIT-AREA-18  EDIT-AREA-19  EDIT-AREA-20NC1244.2 64 101 102 103

 ==002100==> IGYPA3087-W "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-18 (NUMERIC INTEGER)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==002100==> IGYPA3087-W "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-19 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==002100==> IGYPA3087-W "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-20 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==002100==> IGYPA3087-W "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-21 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==002100==> IGYPA3087-W "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-22 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

 ==002100==> IGYPA3087-W "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-24 (NUMERIC-EDITED)"
                         had no digit positions in common.  The receiver will be set to zero at
                         execution time.

   002101         210400                          EDIT-AREA-21  EDIT-AREA-22  EDIT-AREA-23NC1244.2 104 105 106
   002102         210500                          EDIT-AREA-24.                           NC1244.2 107
   002103         210600     GO TO PICTURE-TEST-26-A.                                     NC1244.2 2108
   002104         210700 PICTURE-DELETE-26.                                               NC1244.2
   002105         210800     PERFORM DE-LETE.                                             NC1244.2 266
   002106         210900     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002107         211000     GO TO PICTURE-INIT-27.                                       NC1244.2 2169
   002108         211100 PICTURE-TEST-26-A.                                               NC1244.2
   002109         211200     IF EDIT-AREA-18 EQUAL TO "0000"                              NC1244.2 101
   002110      1  211300        PERFORM PASS                                              NC1244.2 264
   002111      1  211400        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002112      1  211500        ELSE PERFORM FAIL                                         NC1244.2 265
   002113      1  211600        MOVE EDIT-AREA-18 TO COMPUTED-A                           NC1244.2 101 125
   002114      1  211700        MOVE "0000" TO CORRECT-A                                  NC1244.2 139
   002115      1  211800        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002116         211900     ADD 1 TO REC-CT.                                             NC1244.2 161
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002117         212000 PICTURE-TEST-26-B.                                               NC1244.2
   002118         212100     IF EDIT-AREA-19 EQUAL TO " 000"                              NC1244.2 102
   002119      1  212200        PERFORM PASS                                              NC1244.2 264
   002120      1  212300        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002121      1  212400        ELSE PERFORM FAIL                                         NC1244.2 265
   002122      1  212500        MOVE EDIT-AREA-19 TO COMPUTED-A                           NC1244.2 102 125
   002123      1  212600        MOVE " 000" TO CORRECT-A                                  NC1244.2 139
   002124      1  212700        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002125         212800     ADD 1 TO REC-CT.                                             NC1244.2 161
   002126         212900 PICTURE-TEST-26-C.                                               NC1244.2
   002127         213000     IF EDIT-AREA-20 EQUAL TO "  00"                              NC1244.2 103
   002128      1  213100        PERFORM PASS                                              NC1244.2 264
   002129      1  213200        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002130      1  213300        ELSE PERFORM FAIL                                         NC1244.2 265
   002131      1  213400        MOVE EDIT-AREA-20 TO COMPUTED-A                           NC1244.2 103 125
   002132      1  213500        MOVE "  00" TO CORRECT-A                                  NC1244.2 139
   002133      1  213600        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002134         213700     ADD 1 TO REC-CT.                                             NC1244.2 161
   002135         213800     IF EDIT-AREA-21 EQUAL TO "   0"                              NC1244.2 104
   002136      1  213900        PERFORM PASS                                              NC1244.2 264
   002137      1  214000        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002138      1  214100        ELSE PERFORM FAIL                                         NC1244.2 265
   002139      1  214200        MOVE EDIT-AREA-21 TO COMPUTED-A                           NC1244.2 104 125
   002140      1  214300        MOVE "   0" TO CORRECT-A                                  NC1244.2 139
   002141      1  214400        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002142         214500     ADD 1 TO REC-CT.                                             NC1244.2 161
   002143         214600 PICTURE-TEST-26-E.                                               NC1244.2
   002144         214700     IF EDIT-AREA-22 EQUAL TO "    "                              NC1244.2 105
   002145      1  214800        PERFORM PASS                                              NC1244.2 264
   002146      1  214900        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002147      1  215000        ELSE PERFORM FAIL                                         NC1244.2 265
   002148      1  215100        MOVE EDIT-AREA-22 TO COMPUTED-A                           NC1244.2 105 125
   002149      1  215200        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   002150      1  215300        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002151         215400     ADD 1 TO REC-CT.                                             NC1244.2 161
   002152         215500 PICTURE-TEST-26-F.                                               NC1244.2
   002153         215600     IF EDIT-AREA-23 EQUAL TO "  .01"                             NC1244.2 106
   002154      1  215700        PERFORM PASS                                              NC1244.2 264
   002155      1  215800        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002156      1  215900        ELSE PERFORM FAIL                                         NC1244.2 265
   002157      1  216000        MOVE EDIT-AREA-23 TO COMPUTED-A                           NC1244.2 106 125
   002158      1  216100        MOVE "  .01" TO CORRECT-A                                 NC1244.2 139
   002159      1  216200        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002160         216300     ADD 1 TO REC-CT.                                             NC1244.2 161
   002161         216400 PICTURE-TEST-26-G.                                               NC1244.2
   002162         216500     IF EDIT-AREA-24 EQUAL TO "     "                             NC1244.2 107
   002163      1  216600        PERFORM PASS                                              NC1244.2 264
   002164      1  216700        PERFORM PRINT-DETAIL                                      NC1244.2 268
   002165      1  216800        ELSE PERFORM FAIL                                         NC1244.2 265
   002166      1  216900        MOVE EDIT-AREA-24 TO COMPUTED-A                           NC1244.2 107 125
   002167      1  217000        MOVE "SPACES" TO CORRECT-A                                NC1244.2 139
   002168      1  217100        PERFORM PRINT-DETAIL.                                     NC1244.2 268
   002169         217200 PICTURE-INIT-27.                                                 NC1244.2
   002170         217300     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002171         217400     MOVE ZERO TO REC-CT.                                         NC1244.2 IMP 161
   002172         217500     MOVE  200     TO WORK-AREA-27.                               NC1244.2 65
   002173         217600     MOVE  SPACE   TO WORK-AREA-27A.                              NC1244.2 IMP 66
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002174         217700     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002175         217800 PICTURE-TEST-27-0.                                               NC1244.2
   002176         217900     MOVE WORK-AREA-27 TO WORK-AREA-27A.                          NC1244.2 65 66
   002177         218000 PICTURE-TEST-27-1.                                               NC1244.2
   002178         218100     IF WORK-AREA-27A EQUAL TO "200"                              NC1244.2 66
   002179      1  218200        PERFORM PASS                                              NC1244.2 264
   002180      1  218300        ELSE GO TO PICTURE-FAIL-27.                               NC1244.2 2185
   002181         218400     GO TO PICTURE-WRITE-27.                                      NC1244.2 2189
   002182         218500 PICTURE-DELETE-27.                                               NC1244.2
   002183         218600     PERFORM DE-LETE.                                             NC1244.2 266
   002184         218700     GO TO PICTURE-WRITE-27.                                      NC1244.2 2189
   002185         218800 PICTURE-FAIL-27.                                                 NC1244.2
   002186         218900     PERFORM FAIL.                                                NC1244.2 265
   002187         219000     MOVE WORK-AREA-27A TO COMPUTED-A.                            NC1244.2 66 125
   002188         219100     MOVE "200" TO CORRECT-A.                                     NC1244.2 139
   002189         219200 PICTURE-WRITE-27.                                                NC1244.2
   002190         219300     MOVE "PICTURE-TEST-27" TO PAR-NAME.                          NC1244.2 114
   002191         219400     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002192         219500 PICTURE-INIT-28.                                                 NC1244.2
   002193         219600     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002194         219700     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002195         219800     MOVE  567     TO WORK-AREA-28.                               NC1244.2 67
   002196         219900     MOVE  ZERO    TO WORK-AREA-28A.                              NC1244.2 IMP 68
   002197         220000 PICTURE-TEST-28-0.                                               NC1244.2
   002198         220100     MOVE WORK-AREA-28 TO WORK-AREA-28A.                          NC1244.2 67 68
   002199         220200 PICTURE-TEST-28-1.                                               NC1244.2
   002200         220300     IF WORK-AREA-28A EQUAL TO 500                                NC1244.2 68
   002201      1  220400        PERFORM PASS                                              NC1244.2 264
   002202      1  220500        ELSE GO TO PICTURE-FAIL-28.                               NC1244.2 2207
   002203         220600     GO TO PICTURE-WRITE-28.                                      NC1244.2 2211
   002204         220700 PICTURE-DELETE-28.                                               NC1244.2
   002205         220800     PERFORM DE-LETE.                                             NC1244.2 266
   002206         220900     GO TO PICTURE-WRITE-28.                                      NC1244.2 2211
   002207         221000 PICTURE-FAIL-28.                                                 NC1244.2
   002208         221100     PERFORM FAIL.                                                NC1244.2 265
   002209         221200     MOVE WORK-AREA-28A TO COMPUTED-A.                            NC1244.2 68 125
   002210         221300     MOVE 500 TO CORRECT-18V0.                                    NC1244.2 145
   002211         221400 PICTURE-WRITE-28.                                                NC1244.2
   002212         221500     MOVE "PICTURE-TEST-28" TO PAR-NAME.                          NC1244.2 114
   002213         221600     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002214         221700 PICTURE-INIT-29.                                                 NC1244.2
   002215         221800     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002216         221900     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002217         222000     MOVE  123     TO WORK-AREA-29.                               NC1244.2 69
   002218         222100     MOVE  ZERO    TO WORK-AREA-29A.                              NC1244.2 IMP 70
   002219         222200     MOVE  SPACE   TO WORK-AREA-29B.                              NC1244.2 IMP 71
   002220         222300 PICTURE-TEST-29.                                                 NC1244.2
   002221         222400     MOVE WORK-AREA-29 TO WORK-AREA-29A.                          NC1244.2 69 70
   002222         222500     MOVE WORK-AREA-29A TO WORK-AREA-29B.                         NC1244.2 70 71
   002223         222600     IF WORK-AREA-29B EQUAL TO "100"                              NC1244.2 71
   002224      1  222700        PERFORM PASS                                              NC1244.2 264
   002225      1  222800        ELSE GO TO PICTURE-FAIL-29.                               NC1244.2 2230
   002226         222900     GO TO PICTURE-WRITE-29.                                      NC1244.2 2234
   002227         223000 PICTURE-DELETE-29.                                               NC1244.2
   002228         223100     PERFORM DE-LETE.                                             NC1244.2 266
   002229         223200     GO TO PICTURE-WRITE-29.                                      NC1244.2 2234
   002230         223300 PICTURE-FAIL-29.                                                 NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002231         223400     PERFORM FAIL.                                                NC1244.2 265
   002232         223500     MOVE WORK-AREA-29B TO COMPUTED-A.                            NC1244.2 71 125
   002233         223600     MOVE "100" TO CORRECT-A.                                     NC1244.2 139
   002234         223700 PICTURE-WRITE-29.                                                NC1244.2
   002235         223800     MOVE "PICTURE-TEST-29" TO PAR-NAME.                          NC1244.2 114
   002236         223900     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002237         224000 PICTURE-INIT-30.                                                 NC1244.2
   002238         224100     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002239         224200     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002240         224300     MOVE  00900   TO WORK-AREA-30.                               NC1244.2 72
   002241         224400     MOVE  ZERO    TO WORK-AREA-30A.                              NC1244.2 IMP 73
   002242         224500 PICTURE-TEST-30-0.                                               NC1244.2
   002243         224600     MOVE WORK-AREA-30 TO WORK-AREA-30A.                          NC1244.2 72 73
   002244         224700 PICTURE-TEST-30-1.                                               NC1244.2
   002245         224800     IF WORK-AREA-30A EQUAL TO "  9"                              NC1244.2 73
   002246      1  224900        PERFORM PASS                                              NC1244.2 264
   002247      1  225000        ELSE GO TO PICTURE-FAIL-30.                               NC1244.2 2252
   002248         225100     GO TO PICTURE-WRITE-30.                                      NC1244.2 2256
   002249         225200 PICTURE-DELETE-30.                                               NC1244.2
   002250         225300     PERFORM DE-LETE.                                             NC1244.2 266
   002251         225400     GO TO PICTURE-WRITE-30.                                      NC1244.2 2256
   002252         225500 PICTURE-FAIL-30.                                                 NC1244.2
   002253         225600     PERFORM FAIL.                                                NC1244.2 265
   002254         225700     MOVE WORK-AREA-30A TO COMPUTED-A.                            NC1244.2 73 125
   002255         225800     MOVE "  9" TO CORRECT-A.                                     NC1244.2 139
   002256         225900 PICTURE-WRITE-30.                                                NC1244.2
   002257         226000     MOVE "PICTURE-TEST-30" TO PAR-NAME.                          NC1244.2 114
   002258         226100     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002259         226200 PICTURE-INIT-31.                                                 NC1244.2
   002260         226300     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002261         226400     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002262         226500     MOVE  01200   TO WORK-AREA-31.                               NC1244.2 74
   002263         226600     MOVE  ZERO    TO WORK-AREA-31A.                              NC1244.2 IMP 75
   002264         226700     MOVE  SPACE   TO WORK-AREA-31B.                              NC1244.2 IMP 76
   002265         226800 PICTURE-TEST-31.                                                 NC1244.2
   002266         226900     MOVE WORK-AREA-31 TO WORK-AREA-31A.                          NC1244.2 74 75
   002267         227000     MOVE WORK-AREA-31A TO WORK-AREA-31B.                         NC1244.2 75 76
   002268         227100     IF WORK-AREA-31B EQUAL TO " 12  "                            NC1244.2 76
   002269      1  227200        PERFORM PASS                                              NC1244.2 264
   002270      1  227300        ELSE GO TO PICTURE-FAIL-31.                               NC1244.2 2275
   002271         227400     GO TO PICTURE-WRITE-31.                                      NC1244.2 2279
   002272         227500 PICTURE-DELETE-31.                                               NC1244.2
   002273         227600     PERFORM DE-LETE.                                             NC1244.2 266
   002274         227700     GO TO PICTURE-WRITE-31.                                      NC1244.2 2279
   002275         227800 PICTURE-FAIL-31.                                                 NC1244.2
   002276         227900     PERFORM FAIL.                                                NC1244.2 265
   002277         228000     MOVE WORK-AREA-31B TO COMPUTED-A.                            NC1244.2 76 125
   002278         228100     MOVE " 12  " TO CORRECT-A.                                   NC1244.2 139
   002279         228200 PICTURE-WRITE-31.                                                NC1244.2
   002280         228300     MOVE "PICTURE-TEST-31" TO PAR-NAME.                          NC1244.2 114
   002281         228400     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002282         228500 PICTURE-INIT-32.                                                 NC1244.2
   002283         228600     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002284         228700     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002285         228800     MOVE  .001    TO WORK-AREA-32.                               NC1244.2 77
   002286         228900     MOVE  ZERO    TO WORK-AREA-32A.                              NC1244.2 IMP 78
   002287         229000 PICTURE-TEST-32-0.                                               NC1244.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002288         229100     MOVE WORK-AREA-32 TO WORK-AREA-32A.                          NC1244.2 77 78
   002289         229200 PICTURE-TEST-32-1.                                               NC1244.2
   002290         229300     IF WORK-AREA-32A EQUAL TO .001                               NC1244.2 78
   002291      1  229400        PERFORM PASS                                              NC1244.2 264
   002292      1  229500        ELSE GO TO PICTURE-FAIL-32.                               NC1244.2 2297
   002293         229600     GO TO PICTURE-WRITE-32.                                      NC1244.2 2301
   002294         229700 PICTURE-DELETE-32.                                               NC1244.2
   002295         229800     PERFORM DE-LETE.                                             NC1244.2 266
   002296         229900     GO TO PICTURE-WRITE-32.                                      NC1244.2 2301
   002297         230000 PICTURE-FAIL-32.                                                 NC1244.2
   002298         230100     PERFORM FAIL.                                                NC1244.2 265
   002299         230200     MOVE WORK-AREA-32A TO COMPUTED-0V18.                         NC1244.2 78 128
   002300         230300     MOVE .001 TO CORRECT-0V18.                                   NC1244.2 141
   002301         230400 PICTURE-WRITE-32.                                                NC1244.2
   002302         230500     MOVE "PICTURE-TEST-32" TO PAR-NAME.                          NC1244.2 114
   002303         230600     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002304         230700 PICTURE-INIT-33.                                                 NC1244.2
   002305         230800     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002306         230900     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002307         231000     MOVE  .567    TO WORK-AREA-33.                               NC1244.2 79
   002308         231100     MOVE  ZERO    TO WORK-AREA-33A.                              NC1244.2 IMP 80
   002309         231200 PICTURE-TEST-33-0.                                               NC1244.2
   002310         231300     MOVE WORK-AREA-33 TO WORK-AREA-33A.                          NC1244.2 79 80
   002311         231400 PICTURE-TEST-33-1.                                               NC1244.2
   002312         231500     IF WORK-AREA-33A EQUAL TO .007                               NC1244.2 80
   002313      1  231600        PERFORM PASS                                              NC1244.2 264
   002314      1  231700        ELSE GO TO PICTURE-FAIL-33.                               NC1244.2 2319
   002315         231800     GO TO PICTURE-WRITE-33.                                      NC1244.2 2323
   002316         231900 PICTURE-DELETE-33.                                               NC1244.2
   002317         232000     PERFORM DE-LETE.                                             NC1244.2 266
   002318         232100     GO TO PICTURE-WRITE-33.                                      NC1244.2 2323
   002319         232200 PICTURE-FAIL-33.                                                 NC1244.2
   002320         232300     PERFORM FAIL.                                                NC1244.2 265
   002321         232400     MOVE WORK-AREA-33A TO COMPUTED-0V18.                         NC1244.2 80 128
   002322         232500     MOVE .007 TO CORRECT-0V18.                                   NC1244.2 141
   002323         232600 PICTURE-WRITE-33.                                                NC1244.2
   002324         232700     MOVE "PICTURE-TEST-33" TO PAR-NAME.                          NC1244.2 114
   002325         232800     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002326         232900 PICTURE-INIT-34.                                                 NC1244.2
   002327         233000     MOVE "VI-31"           TO ANSI-REFERENCE.                    NC1244.2 170
   002328         233100     MOVE "PICTURE CHARACTER P" TO FEATURE.                       NC1244.2 110
   002329         233200     MOVE  .123    TO WORK-AREA-34.                               NC1244.2 81
   002330         233300     MOVE  ZERO    TO WORK-AREA-34A.                              NC1244.2 IMP 82
   002331         233400     MOVE  ZERO    TO WORK-AREA-34B.                              NC1244.2 IMP 83
   002332         233500 PICTURE-TEST-34.                                                 NC1244.2
   002333         233600     MOVE WORK-AREA-34 TO WORK-AREA-34A.                          NC1244.2 81 82
   002334         233700     MOVE WORK-AREA-34A TO WORK-AREA-34B.                         NC1244.2 82 83
   002335         233800     IF WORK-AREA-34B EQUAL TO .003                               NC1244.2 83
   002336      1  233900        PERFORM PASS                                              NC1244.2 264
   002337      1  234000        ELSE GO TO PICTURE-FAIL-34.                               NC1244.2 2342
   002338         234100     GO TO PICTURE-WRITE-34.                                      NC1244.2 2346
   002339         234200 PICTURE-DELETE-34.                                               NC1244.2
   002340         234300     PERFORM DE-LETE.                                             NC1244.2 266
   002341         234400     GO TO PICTURE-WRITE-34.                                      NC1244.2 2346
   002342         234500 PICTURE-FAIL-34.                                                 NC1244.2
   002343         234600     PERFORM FAIL.                                                NC1244.2 265
   002344         234700     MOVE WORK-AREA-34B TO COMPUTED-0V18.                         NC1244.2 83 128
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002345         234800     MOVE .003 TO CORRECT-0V18.                                   NC1244.2 141
   002346         234900 PICTURE-WRITE-34.                                                NC1244.2
   002347         235000     MOVE "PICTURE-TEST-34" TO PAR-NAME.                          NC1244.2 114
   002348         235100     PERFORM PRINT-DETAIL.                                        NC1244.2 268
   002349         235200 CCVS-EXIT SECTION.                                               NC1244.2
   002350         235300 CCVS-999999.                                                     NC1244.2
   002351         235400     GO TO CLOSE-FILES.                                           NC1244.2 257
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    46
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      170   ANSI-REFERENCE . . . . . . . .  347 354 363 M370 M456 M542 M628 M714 M800 M886 M972 M1058 M1144 M1193 M1242 M1291
                                            M1340 M1389 M1438 M1496 M1554 M1612 M1670 M1728 M1786 M1863 M1940 M2017 M2094
                                            M2170 M2193 M2215 M2238 M2260 M2283 M2305 M2327
      149   CCVS-C-1 . . . . . . . . . . .  286 332
      154   CCVS-C-2 . . . . . . . . . . .  287 333
      204   CCVS-E-1 . . . . . . . . . . .  292
      209   CCVS-E-2 . . . . . . . . . . .  301 308 315 320
      212   CCVS-E-2-2 . . . . . . . . . .  M300
      217   CCVS-E-3 . . . . . . . . . . .  321
      226   CCVS-E-4 . . . . . . . . . . .  300
      227   CCVS-E-4-1 . . . . . . . . . .  M298
      229   CCVS-E-4-2 . . . . . . . . . .  M299
      171   CCVS-H-1 . . . . . . . . . . .  281 328
      176   CCVS-H-2A. . . . . . . . . . .  282 329
      185   CCVS-H-2B. . . . . . . . . . .  283 330
      197   CCVS-H-3 . . . . . . . . . . .  284 331
      247   CCVS-PGM-ID. . . . . . . . . .  253 253
      131   CM-18V0
      125   COMPUTED-A . . . . . . . . . .  126 128 129 130 131 359 362 M389 M398 M407 M416 M425 M434 M443 M452 M475 M484
                                            M493 M502 M511 M520 M529 M538 M561 M570 M579 M588 M597 M606 M615 M624 M647 M656
                                            M665 M674 M683 M692 M701 M710 M733 M742 M751 M760 M769 M778 M787 M796 M819 M828
                                            M837 M846 M855 M864 M873 M882 M905 M914 M923 M932 M941 M950 M959 M968 M991 M1000
                                            M1009 M1018 M1027 M1036 M1045 M1054 M1077 M1086 M1095 M1104 M1113 M1122 M1131
                                            M1140 M1162 M1171 M1180 M1189 M1211 M1220 M1229 M1238 M1260 M1269 M1278 M1287
                                            M1309 M1318 M1327 M1336 M1358 M1367 M1376 M1385 M1407 M1416 M1425 M1434 M1456
                                            M1465 M1474 M1483 M1492 M1514 M1523 M1532 M1541 M1550 M1572 M1581 M1590 M1599
                                            M1608 M1630 M1639 M1648 M1657 M1666 M1688 M1697 M1706 M1715 M1724 M1746 M1755
                                            M1764 M1773 M1782 M1805 M1814 M1823 M1832 M1841 M1850 M1859 M1882 M1891 M1900
                                            M1909 M1918 M1927 M1936 M1959 M1968 M1977 M1986 M1995 M2004 M2013 M2036 M2045
                                            M2054 M2063 M2072 M2081 M2090 M2113 M2122 M2131 M2139 M2148 M2157 M2166 M2187
                                            M2209 M2232 M2254 M2277
      126   COMPUTED-N
      124   COMPUTED-X . . . . . . . . . .  M276 344
      128   COMPUTED-0V18. . . . . . . . .  M2299 M2321 M2344
      130   COMPUTED-14V4
      132   COMPUTED-18V0
      129   COMPUTED-4V14
      148   COR-ANSI-REFERENCE . . . . . .  M354 M356
      139   CORRECT-A. . . . . . . . . . .  140 141 142 143 144 360 362 M390 M399 M408 M417 M426 M435 M444 M453 M476 M485
                                            M494 M503 M512 M521 M530 M539 M562 M571 M580 M589 M598 M607 M616 M625 M648 M657
                                            M666 M675 M684 M693 M702 M711 M734 M743 M752 M761 M770 M779 M788 M797 M820 M829
                                            M838 M847 M856 M865 M874 M883 M906 M915 M924 M933 M942 M951 M960 M969 M992 M1001
                                            M1010 M1019 M1028 M1037 M1046 M1055 M1078 M1087 M1096 M1105 M1114 M1123 M1132
                                            M1141 M1163 M1172 M1181 M1190 M1212 M1221 M1230 M1239 M1261 M1270 M1279 M1288
                                            M1310 M1319 M1328 M1337 M1359 M1368 M1377 M1386 M1408 M1417 M1426 M1435 M1457
                                            M1466 M1475 M1484 M1493 M1515 M1524 M1533 M1542 M1551 M1573 M1582 M1591 M1600
                                            M1609 M1631 M1640 M1649 M1658 M1667 M1689 M1698 M1707 M1716 M1725 M1747 M1756
                                            M1765 M1774 M1783 M1806 M1815 M1824 M1833 M1842 M1851 M1860 M1883 M1892 M1901
                                            M1910 M1919 M1928 M1937 M1960 M1969 M1978 M1987 M1996 M2005 M2014 M2037 M2046
                                            M2055 M2064 M2073 M2082 M2091 M2114 M2123 M2132 M2140 M2149 M2158 M2167 M2188
                                            M2233 M2255 M2278
      140   CORRECT-N
      138   CORRECT-X. . . . . . . . . . .  M277 346
      141   CORRECT-0V18 . . . . . . . . .  M2300 M2322 M2345
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    47
0 Defined   Cross-reference of data names   References

0     143   CORRECT-14V4
      145   CORRECT-18V0 . . . . . . . . .  M2210
      142   CORRECT-4V14
      144   CR-18V0
      162   DELETE-COUNTER . . . . . . . .  M266 295 311 313
      117   DOTVALUE . . . . . . . . . . .  M271
      168   DUMMY-HOLD . . . . . . . . . .  M325 335
       37   DUMMY-RECORD . . . . . . . . .  M281 M282 M283 M284 M286 M287 M288 M290 M292 M301 M308 M315 M320 M321 325 M326
                                            327 M328 M329 M330 M331 M332 M333 M334 M335 339 M340 M349 M364
       84   EDIT-AREA-1. . . . . . . . . .  M376 385 389 M462 471 475 M548 557 561 M634 643 647 M720 729 733 M806 815 819
                                            M892 901 905 M978 987 991 M1064 1073 1077
       93   EDIT-AREA-10 . . . . . . . . .  M1150 1167 1171 M1199 1216 1220 M1248 1265 1269 M1297 1314 1318 M1346 1363 1367
                                            M1395 1412 1416
       94   EDIT-AREA-11 . . . . . . . . .  M1151 1176 1180 M1200 1225 1229 M1249 1274 1278 M1298 1323 1327 M1347 1372 1376
                                            M1396 1421 1425
       95   EDIT-AREA-12 . . . . . . . . .  M1151 1185 1189 M1200 1234 1238 M1249 1283 1287 M1298 1332 1336 M1347 1381 1385
                                            M1396 1430 1434
       96   EDIT-AREA-13 . . . . . . . . .  M1444 1452 1456 M1502 1510 1514 M1560 1568 1572 M1618 1626 1630 M1676 1684 1688
                                            M1734 1742 1746
       97   EDIT-AREA-14 . . . . . . . . .  M1444 1461 1465 M1502 1519 1523 M1560 1577 1581 M1618 1635 1639 M1676 1693 1697
                                            M1734 1751 1755
       98   EDIT-AREA-15 . . . . . . . . .  M1444 1470 1474 M1502 1528 1532 M1560 1586 1590 M1618 1644 1648 M1676 1702 1706
                                            M1734 1760 1764
       99   EDIT-AREA-16 . . . . . . . . .  M1445 1479 1483 M1503 1537 1541 M1561 1595 1599 M1619 1653 1657 M1677 1711 1715
                                            M1735 1769 1773
      100   EDIT-AREA-17 . . . . . . . . .  M1445 1488 1492 M1503 1546 1550 M1561 1604 1608 M1619 1662 1666 M1677 1720 1724
                                            M1735 1778 1782
      101   EDIT-AREA-18 . . . . . . . . .  M1792 1801 1805 M1869 1878 1882 M1946 1955 1959 M2023 2032 2036 M2100 2109 2113
      102   EDIT-AREA-19 . . . . . . . . .  M1792 1810 1814 M1869 1887 1891 M1946 1964 1968 M2023 2041 2045 M2100 2118 2122
       85   EDIT-AREA-2. . . . . . . . . .  M376 394 398 M462 480 484 M548 566 570 M634 652 656 M720 738 742 M806 824 828
                                            M892 910 914 M978 996 1000 M1064 1082 1086
      103   EDIT-AREA-20 . . . . . . . . .  M1792 1819 1823 M1869 1896 1900 M1946 1973 1977 M2023 2050 2054 M2100 2127 2131
      104   EDIT-AREA-21 . . . . . . . . .  M1793 1828 1832 M1870 1905 1909 M1947 1982 1986 M2024 2059 2063 M2101 2135 2139
      105   EDIT-AREA-22 . . . . . . . . .  M1793 1837 1841 M1870 1914 1918 M1947 1991 1995 M2024 2068 2072 M2101 2144 2148
      106   EDIT-AREA-23 . . . . . . . . .  M1793 1846 1850 M1870 1923 1927 M1947 2000 2004 M2024 2077 2081 M2101 2153 2157
      107   EDIT-AREA-24 . . . . . . . . .  M1794 1855 1859 M1871 1932 1936 M1948 2009 2013 M2025 2086 2090 M2102 2162 2166
       86   EDIT-AREA-3. . . . . . . . . .  M376 403 407 M462 489 493 M548 575 579 M634 661 665 M720 747 751 M806 833 837
                                            M892 919 923 M978 1005 1009 M1064 1091 1095
       87   EDIT-AREA-4. . . . . . . . . .  M377 412 416 M463 498 502 M549 584 588 M635 670 674 M721 756 760 M807 842 846
                                            M893 928 932 M979 1014 1018 M1065 1100 1104
       88   EDIT-AREA-5. . . . . . . . . .  M377 421 425 M463 507 511 M549 593 597 M635 679 683 M721 765 769 M807 851 855
                                            M893 937 941 M979 1023 1027 M1065 1109 1113
       89   EDIT-AREA-6. . . . . . . . . .  M377 430 434 M463 516 520 M549 602 606 M635 688 692 M721 774 778 M807 860 864
                                            M893 946 950 M979 1032 1036 M1065 1118 1122
       90   EDIT-AREA-7. . . . . . . . . .  M378 439 443 M464 525 529 M550 611 615 M636 697 701 M722 783 787 M808 869 873
                                            M894 955 959 M980 1041 1045 M1066 1127 1131
       91   EDIT-AREA-8. . . . . . . . . .  M378 448 452 M464 534 538 M550 620 624 M636 706 710 M722 792 796 M808 878 882
                                            M894 964 968 M980 1050 1054 M1066 1136 1140
       92   EDIT-AREA-9. . . . . . . . . .  M1150 1158 1162 M1199 1207 1211 M1248 1256 1260 M1297 1305 1309 M1346 1354 1358
                                            M1395 1403 1407
      215   ENDER-DESC . . . . . . . . . .  M303 M314 M319
      163   ERROR-COUNTER. . . . . . . . .  M265 294 304 307
      167   ERROR-HOLD . . . . . . . . . .  M294 M295 M295 M296 299
      213   ERROR-TOTAL. . . . . . . . . .  M305 M307 M312 M313 M317 M318
      110   FEATURE. . . . . . . . . . . .  M372 M458 M544 M630 M716 M802 M888 M974 M1060 M1146 M1195 M1244 M1293 M1342 M1391
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    48
0 Defined   Cross-reference of data names   References

0                                           M1440 M1498 M1556 M1614 M1672 M1730 M1788 M1865 M1942 M2019 M2096 M2174 M2194
                                            M2216 M2239 M2261 M2284 M2306 M2328
      241   HYPHEN-LINE. . . . . . . . . .  288 290 334
      207   ID-AGAIN . . . . . . . . . . .  M253
      240   INF-ANSI-REFERENCE . . . . . .  M347 M350 M363 M365
      235   INFO-TEXT. . . . . . . . . . .  M348
      164   INSPECT-COUNTER. . . . . . . .  M263 294 316 318
      112   P-OR-F . . . . . . . . . . . .  M263 M264 M265 M266 273 M276
      114   PAR-NAME . . . . . . . . . . .  M278 M371 M457 M543 M629 M715 M801 M887 M973 M1059 M1145 M1194 M1243 M1292 M1341
                                            M1390 M1439 M1497 M1555 M1613 M1671 M1729 M1787 M1864 M1941 M2018 M2095 M2190
                                            M2212 M2235 M2257 M2280 M2302 M2324 M2347
      116   PARDOT-X . . . . . . . . . . .  M270
      165   PASS-COUNTER . . . . . . . . .  M264 296 298
       35   PRINT-FILE . . . . . . . . . .  31 252 258
       36   PRINT-REC. . . . . . . . . . .  M272 M353 M355
      119   RE-MARK. . . . . . . . . . . .  M267 M279
      161   REC-CT . . . . . . . . . . . .  269 271 278 M374 M392 M401 M410 M419 M428 M437 M446 M460 M478 M487 M496 M505
                                            M514 M523 M532 M546 M564 M573 M582 M591 M600 M609 M618 M632 M650 M659 M668 M677
                                            M686 M695 M704 M718 M736 M745 M754 M763 M772 M781 M790 M804 M822 M831 M840 M849
                                            M858 M867 M876 M890 M908 M917 M926 M935 M944 M953 M962 M976 M994 M1003 M1012
                                            M1021 M1030 M1039 M1048 M1062 M1080 M1089 M1098 M1107 M1116 M1125 M1134 M1148
                                            M1165 M1174 M1183 M1197 M1214 M1223 M1232 M1246 M1263 M1272 M1281 M1295 M1312
                                            M1321 M1330 M1344 M1361 M1370 M1379 M1393 M1410 M1419 M1428 M1442 M1459 M1468
                                            M1477 M1486 M1500 M1517 M1526 M1535 M1544 M1558 M1575 M1584 M1593 M1602 M1616
                                            M1633 M1642 M1651 M1660 M1673 M1691 M1700 M1709 M1718 M1732 M1749 M1758 M1767
                                            M1776 M1790 M1808 M1817 M1826 M1835 M1844 M1853 M1867 M1885 M1894 M1903 M1912
                                            M1921 M1930 M1944 M1962 M1971 M1980 M1989 M1998 M2007 M2021 M2039 M2048 M2057
                                            M2066 M2075 M2084 M2098 M2116 M2125 M2134 M2142 M2151 M2160 M2171
      160   REC-SKL-SUB
      169   RECORD-COUNT . . . . . . . . .  M323 324 M336
      120   TEST-COMPUTED. . . . . . . . .  353
      135   TEST-CORRECT . . . . . . . . .  355
      188   TEST-ID. . . . . . . . . . . .  M253
      108   TEST-RESULTS . . . . . . . . .  M254 272
      166   TOTAL-ERROR
       39   WORK-AREA-1. . . . . . . . . .  M373 376
       48   WORK-AREA-10 . . . . . . . . .  M1147 1150
       49   WORK-AREA-11 . . . . . . . . .  M1196 1199
       50   WORK-AREA-12 . . . . . . . . .  M1245 1248
       51   WORK-AREA-13 . . . . . . . . .  M1294 1297
       52   WORK-AREA-14 . . . . . . . . .  M1343 1346
       53   WORK-AREA-15 . . . . . . . . .  M1392 1395
       54   WORK-AREA-16 . . . . . . . . .  M1441 1444
       55   WORK-AREA-17 . . . . . . . . .  M1499 1502
       56   WORK-AREA-18 . . . . . . . . .  M1557 1560
       57   WORK-AREA-19 . . . . . . . . .  M1615 1618
       40   WORK-AREA-2. . . . . . . . . .  M459 462
       58   WORK-AREA-20 . . . . . . . . .  M1674 1676
       59   WORK-AREA-21 . . . . . . . . .  M1731 1734
       60   WORK-AREA-22 . . . . . . . . .  M1789 1792
       61   WORK-AREA-23 . . . . . . . . .  M1866 1869
       62   WORK-AREA-24 . . . . . . . . .  M1943 1946
       63   WORK-AREA-25 . . . . . . . . .  M2020 2023
       64   WORK-AREA-26 . . . . . . . . .  M2097 2100
       65   WORK-AREA-27 . . . . . . . . .  M2172 2176
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    49
0 Defined   Cross-reference of data names   References

0      66   WORK-AREA-27A. . . . . . . . .  M2173 M2176 2178 2187
       67   WORK-AREA-28 . . . . . . . . .  M2195 2198
       68   WORK-AREA-28A. . . . . . . . .  M2196 M2198 2200 2209
       69   WORK-AREA-29 . . . . . . . . .  M2217 2221
       70   WORK-AREA-29A. . . . . . . . .  M2218 M2221 2222
       71   WORK-AREA-29B. . . . . . . . .  M2219 M2222 2223 2232
       41   WORK-AREA-3. . . . . . . . . .  M545 548
       72   WORK-AREA-30 . . . . . . . . .  M2240 2243
       73   WORK-AREA-30A. . . . . . . . .  M2241 M2243 2245 2254
       74   WORK-AREA-31 . . . . . . . . .  M2262 2266
       75   WORK-AREA-31A. . . . . . . . .  M2263 M2266 2267
       76   WORK-AREA-31B. . . . . . . . .  M2264 M2267 2268 2277
       77   WORK-AREA-32 . . . . . . . . .  M2285 2288
       78   WORK-AREA-32A. . . . . . . . .  M2286 M2288 2290 2299
       79   WORK-AREA-33 . . . . . . . . .  M2307 2310
       80   WORK-AREA-33A. . . . . . . . .  M2308 M2310 2312 2321
       81   WORK-AREA-34 . . . . . . . . .  M2329 2333
       82   WORK-AREA-34A. . . . . . . . .  M2330 M2333 2334
       83   WORK-AREA-34B. . . . . . . . .  M2331 M2334 2335 2344
       42   WORK-AREA-4. . . . . . . . . .  M631 634
       43   WORK-AREA-5. . . . . . . . . .  M717 720
       44   WORK-AREA-6. . . . . . . . . .  M803 806
       45   WORK-AREA-7. . . . . . . . . .  M889 892
       46   WORK-AREA-8. . . . . . . . . .  M975 978
       47   WORK-AREA-9. . . . . . . . . .  M1061 1064
      237   XXCOMPUTED . . . . . . . . . .  M362
      239   XXCORRECT. . . . . . . . . . .  M362
      232   XXINFO . . . . . . . . . . . .  349 364
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    50
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

      358   BAIL-OUT . . . . . . . . . . .  P275
      366   BAIL-OUT-EX. . . . . . . . . .  E275 G360
      361   BAIL-OUT-WRITE . . . . . . . .  G359
      341   BLANK-LINE-PRINT
     2349   CCVS-EXIT
     2350   CCVS-999999
      250   CCVS1
      367   CCVS1-EXIT . . . . . . . . . .  G256
      257   CLOSE-FILES. . . . . . . . . .  G2351
      285   COLUMN-NAMES-ROUTINE . . . . .  E255
      266   DE-LETE. . . . . . . . . . . .  P381 P467 P553 P639 P725 P811 P897 P983 P1069 P1154 P1203 P1252 P1301 P1350 P1399
                                            P1448 P1506 P1564 P1622 P1680 P1738 P1797 P1874 P1951 P2028 P2105 P2183 P2205
                                            P2228 P2250 P2273 P2295 P2317 P2340
      289   END-ROUTINE. . . . . . . . . .  P258
      293   END-ROUTINE-1
      302   END-ROUTINE-12
      310   END-ROUTINE-13 . . . . . . . .  E258
      291   END-RTN-EXIT
      265   FAIL . . . . . . . . . . . . .  P388 P397 P406 P415 P424 P433 P442 P451 P474 P483 P492 P501 P510 P519 P528 P537
                                            P560 P569 P578 P587 P596 P605 P614 P623 P646 P655 P664 P673 P682 P691 P700 P709
                                            P732 P741 P750 P759 P768 P777 P786 P795 P818 P827 P836 P845 P854 P863 P872 P881
                                            P904 P913 P922 P931 P940 P949 P958 P967 P990 P999 P1008 P1017 P1026 P1035 P1044
                                            P1053 P1076 P1085 P1094 P1103 P1112 P1121 P1130 P1139 P1161 P1170 P1179 P1188
                                            P1210 P1219 P1228 P1237 P1259 P1268 P1277 P1286 P1308 P1317 P1326 P1335 P1357
                                            P1366 P1375 P1384 P1406 P1415 P1424 P1433 P1455 P1464 P1473 P1482 P1491 P1513
                                            P1522 P1531 P1540 P1549 P1571 P1580 P1589 P1598 P1607 P1629 P1638 P1647 P1656
                                            P1665 P1687 P1696 P1705 P1714 P1723 P1745 P1754 P1763 P1772 P1781 P1804 P1813
                                            P1822 P1831 P1840 P1849 P1858 P1881 P1890 P1899 P1908 P1917 P1926 P1935 P1958
                                            P1967 P1976 P1985 P1994 P2003 P2012 P2035 P2044 P2053 P2062 P2071 P2080 P2089
                                            P2112 P2121 P2130 P2138 P2147 P2156 P2165 P2186 P2208 P2231 P2253 P2276 P2298
                                            P2320 P2343
      343   FAIL-ROUTINE . . . . . . . . .  P274
      357   FAIL-ROUTINE-EX. . . . . . . .  E274 G351
      352   FAIL-ROUTINE-WRITE . . . . . .  G345 G346
      280   HEAD-ROUTINE . . . . . . . . .  P255
      263   INSPT
      251   OPEN-FILES
      264   PASS . . . . . . . . . . . . .  P386 P395 P404 P413 P422 P431 P440 P449 P472 P481 P490 P499 P508 P517 P526 P535
                                            P558 P567 P576 P585 P594 P603 P612 P621 P644 P653 P662 P671 P680 P689 P698 P707
                                            P730 P739 P748 P757 P766 P775 P784 P793 P816 P825 P834 P843 P852 P861 P870 P879
                                            P902 P911 P920 P929 P938 P947 P956 P965 P988 P997 P1006 P1015 P1024 P1033 P1042
                                            P1051 P1074 P1083 P1092 P1101 P1110 P1119 P1128 P1137 P1159 P1168 P1177 P1186
                                            P1208 P1217 P1226 P1235 P1257 P1266 P1275 P1284 P1306 P1315 P1324 P1333 P1355
                                            P1364 P1373 P1382 P1404 P1413 P1422 P1431 P1453 P1462 P1471 P1480 P1489 P1511
                                            P1520 P1529 P1538 P1547 P1569 P1578 P1587 P1596 P1605 P1627 P1636 P1645 P1654
                                            P1663 P1685 P1694 P1703 P1712 P1721 P1743 P1752 P1761 P1770 P1779 P1802 P1811
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    51
0 Defined   Cross-reference of procedures   References

0                                           P1820 P1829 P1838 P1847 P1856 P1879 P1888 P1897 P1906 P1915 P1924 P1933 P1956
                                            P1965 P1974 P1983 P1992 P2001 P2010 P2033 P2042 P2051 P2060 P2069 P2078 P2087
                                            P2110 P2119 P2128 P2136 P2145 P2154 P2163 P2179 P2201 P2224 P2246 P2269 P2291
                                            P2313 P2336
      380   PICTURE-DELETE-1
     1153   PICTURE-DELETE-10
     1202   PICTURE-DELETE-11
     1251   PICTURE-DELETE-12
     1300   PICTURE-DELETE-13
     1349   PICTURE-DELETE-14
     1398   PICTURE-DELETE-15
     1447   PICTURE-DELETE-16
     1505   PICTURE-DELETE-17
     1563   PICTURE-DELETE-18
     1621   PICTURE-DELETE-19
      466   PICTURE-DELETE-2
     1679   PICTURE-DELETE-20
     1737   PICTURE-DELETE-21
     1796   PICTURE-DELETE-22
     1873   PICTURE-DELETE-23
     1950   PICTURE-DELETE-24
     2027   PICTURE-DELETE-25
     2104   PICTURE-DELETE-26
     2182   PICTURE-DELETE-27
     2204   PICTURE-DELETE-28
     2227   PICTURE-DELETE-29
      552   PICTURE-DELETE-3
     2249   PICTURE-DELETE-30
     2272   PICTURE-DELETE-31
     2294   PICTURE-DELETE-32
     2316   PICTURE-DELETE-33
     2339   PICTURE-DELETE-34
      638   PICTURE-DELETE-4
      724   PICTURE-DELETE-5
      810   PICTURE-DELETE-6
      896   PICTURE-DELETE-7
      982   PICTURE-DELETE-8
     1068   PICTURE-DELETE-9
     2185   PICTURE-FAIL-27. . . . . . . .  G2180
     2207   PICTURE-FAIL-28. . . . . . . .  G2202
     2230   PICTURE-FAIL-29. . . . . . . .  G2225
     2252   PICTURE-FAIL-30. . . . . . . .  G2247
     2275   PICTURE-FAIL-31. . . . . . . .  G2270
     2297   PICTURE-FAIL-32. . . . . . . .  G2292
     2319   PICTURE-FAIL-33. . . . . . . .  G2314
     2342   PICTURE-FAIL-34. . . . . . . .  G2337
      369   PICTURE-INIT-1
     1143   PICTURE-INIT-10. . . . . . . .  G1071
     1192   PICTURE-INIT-11. . . . . . . .  G1156
     1241   PICTURE-INIT-12. . . . . . . .  G1205
     1290   PICTURE-INIT-13. . . . . . . .  G1254
     1339   PICTURE-INIT-14. . . . . . . .  G1303
     1388   PICTURE-INIT-15. . . . . . . .  G1352
     1437   PICTURE-INIT-16. . . . . . . .  G1401
     1495   PICTURE-INIT-17. . . . . . . .  G1450
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    52
0 Defined   Cross-reference of procedures   References

0    1553   PICTURE-INIT-18. . . . . . . .  G1508
     1611   PICTURE-INIT-19. . . . . . . .  G1566
      455   PICTURE-INIT-2 . . . . . . . .  G383
     1669   PICTURE-INIT-20. . . . . . . .  G1624
     1727   PICTURE-INIT-21. . . . . . . .  G1682
     1785   PICTURE-INIT-22. . . . . . . .  G1740
     1862   PICTURE-INIT-23. . . . . . . .  G1799
     1939   PICTURE-INIT-24. . . . . . . .  G1876
     2016   PICTURE-INIT-25. . . . . . . .  G1953
     2093   PICTURE-INIT-26. . . . . . . .  G2030
     2169   PICTURE-INIT-27. . . . . . . .  G2107
     2192   PICTURE-INIT-28
     2214   PICTURE-INIT-29
      541   PICTURE-INIT-3 . . . . . . . .  G469
     2237   PICTURE-INIT-30
     2259   PICTURE-INIT-31
     2282   PICTURE-INIT-32
     2304   PICTURE-INIT-33
     2326   PICTURE-INIT-34
      627   PICTURE-INIT-4 . . . . . . . .  G555
      713   PICTURE-INIT-5 . . . . . . . .  G641
      799   PICTURE-INIT-6 . . . . . . . .  G727
      885   PICTURE-INIT-7 . . . . . . . .  G813
      971   PICTURE-INIT-8 . . . . . . . .  G899
     1057   PICTURE-INIT-9 . . . . . . . .  G985
      375   PICTURE-TEST-1
      384   PICTURE-TEST-1-A . . . . . . .  G379
      393   PICTURE-TEST-1-B
      402   PICTURE-TEST-1-C
      411   PICTURE-TEST-1-D
      420   PICTURE-TEST-1-E
      429   PICTURE-TEST-1-F
      438   PICTURE-TEST-1-G
      447   PICTURE-TEST-1-H
     1149   PICTURE-TEST-10
     1157   PICTURE-TEST-10-A. . . . . . .  G1152
     1166   PICTURE-TEST-10-B
     1175   PICTURE-TEST-10-C
     1184   PICTURE-TEST-10-D
     1198   PICTURE-TEST-11
     1206   PICTURE-TEST-11-A. . . . . . .  G1201
     1215   PICTURE-TEST-11-B
     1224   PICTURE-TEST-11-C
     1233   PICTURE-TEST-11-D
     1247   PICTURE-TEST-12
     1255   PICTURE-TEST-12-A. . . . . . .  G1250
     1264   PICTURE-TEST-12-B
     1273   PICTURE-TEST-12-C
     1282   PICTURE-TEST-12-D
     1296   PICTURE-TEST-13
     1304   PICTURE-TEST-13-A. . . . . . .  G1299
     1313   PICTURE-TEST-13-B
     1322   PICTURE-TEST-13-C
     1331   PICTURE-TEST-13-D
     1345   PICTURE-TEST-14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    53
0 Defined   Cross-reference of procedures   References

0    1353   PICTURE-TEST-14-A. . . . . . .  G1348
     1362   PICTURE-TEST-14-B
     1371   PICTURE-TEST-14-C
     1380   PICTURE-TEST-14-D
     1394   PICTURE-TEST-15
     1402   PICTURE-TEST-15-A. . . . . . .  G1397
     1411   PICTURE-TEST-15-B
     1420   PICTURE-TEST-15-C
     1429   PICTURE-TEST-15-D
     1443   PICTURE-TEST-16
     1451   PICTURE-TEST-16-A. . . . . . .  G1446
     1460   PICTURE-TEST-16-B
     1469   PICTURE-TEST-16-C
     1478   PICTURE-TEST-16-D
     1487   PICTURE-TEST-16-E
     1501   PICTURE-TEST-17
     1509   PICTURE-TEST-17-A. . . . . . .  G1504
     1518   PICTURE-TEST-17-B
     1527   PICTURE-TEST-17-C
     1536   PICTURE-TEST-17-D
     1545   PICTURE-TEST-17-E
     1559   PICTURE-TEST-18
     1567   PICTURE-TEST-18-A. . . . . . .  G1562
     1576   PICTURE-TEST-18-B
     1585   PICTURE-TEST-18-C
     1594   PICTURE-TEST-18-D
     1603   PICTURE-TEST-18-E
     1617   PICTURE-TEST-19
     1625   PICTURE-TEST-19-A. . . . . . .  G1620
     1634   PICTURE-TEST-19-B
     1643   PICTURE-TEST-19-C
     1652   PICTURE-TEST-19-D
     1661   PICTURE-TEST-19-E
      461   PICTURE-TEST-2
      470   PICTURE-TEST-2-A . . . . . . .  G465
      479   PICTURE-TEST-2-B
      488   PICTURE-TEST-2-C
      497   PICTURE-TEST-2-D
      506   PICTURE-TEST-2-E
      515   PICTURE-TEST-2-F
      524   PICTURE-TEST-2-G
      533   PICTURE-TEST-2-H
     1675   PICTURE-TEST-20
     1683   PICTURE-TEST-20-A. . . . . . .  G1678
     1692   PICTURE-TEST-20-B
     1701   PICTURE-TEST-20-C
     1710   PICTURE-TEST-20-D
     1719   PICTURE-TEST-20-E
     1733   PICTURE-TEST-21
     1741   PICTURE-TEST-21-A. . . . . . .  G1736
     1750   PICTURE-TEST-21-B
     1759   PICTURE-TEST-21-C
     1768   PICTURE-TEST-21-D
     1777   PICTURE-TEST-21-E
     1791   PICTURE-TEST-22
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    54
0 Defined   Cross-reference of procedures   References

0    1800   PICTURE-TEST-22-A. . . . . . .  G1795
     1809   PICTURE-TEST-22-B
     1818   PICTURE-TEST-22-C
     1827   PICTURE-TEST-22-D
     1836   PICTURE-TEST-22-E
     1845   PICTURE-TEST-22-F
     1854   PICTURE-TEST-22-G
     1868   PICTURE-TEST-23
     1877   PICTURE-TEST-23-A. . . . . . .  G1872
     1886   PICTURE-TEST-23-B
     1895   PICTURE-TEST-23-C
     1904   PICTURE-TEST-23-D
     1913   PICTURE-TEST-23-E
     1922   PICTURE-TEST-23-F
     1931   PICTURE-TEST-23-G
     1945   PICTURE-TEST-24
     1954   PICTURE-TEST-24-A. . . . . . .  G1949
     1963   PICTURE-TEST-24-B
     1972   PICTURE-TEST-24-C
     1981   PICTURE-TEST-24-D
     1990   PICTURE-TEST-24-E
     1999   PICTURE-TEST-24-F
     2008   PICTURE-TEST-24-G
     2022   PICTURE-TEST-25
     2031   PICTURE-TEST-25-A. . . . . . .  G2026
     2040   PICTURE-TEST-25-B
     2049   PICTURE-TEST-25-C
     2058   PICTURE-TEST-25-D
     2067   PICTURE-TEST-25-E
     2076   PICTURE-TEST-25-F
     2085   PICTURE-TEST-25-G
     2099   PICTURE-TEST-26
     2108   PICTURE-TEST-26-A. . . . . . .  G2103
     2117   PICTURE-TEST-26-B
     2126   PICTURE-TEST-26-C
     2143   PICTURE-TEST-26-E
     2152   PICTURE-TEST-26-F
     2161   PICTURE-TEST-26-G
     2175   PICTURE-TEST-27-0
     2177   PICTURE-TEST-27-1
     2197   PICTURE-TEST-28-0
     2199   PICTURE-TEST-28-1
     2220   PICTURE-TEST-29
      547   PICTURE-TEST-3
      556   PICTURE-TEST-3-A . . . . . . .  G551
      565   PICTURE-TEST-3-B
      574   PICTURE-TEST-3-C
      583   PICTURE-TEST-3-D
      592   PICTURE-TEST-3-E
      601   PICTURE-TEST-3-F
      610   PICTURE-TEST-3-G
      619   PICTURE-TEST-3-H
     2242   PICTURE-TEST-30-0
     2244   PICTURE-TEST-30-1
     2265   PICTURE-TEST-31
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    55
0 Defined   Cross-reference of procedures   References

0    2287   PICTURE-TEST-32-0
     2289   PICTURE-TEST-32-1
     2309   PICTURE-TEST-33-0
     2311   PICTURE-TEST-33-1
     2332   PICTURE-TEST-34
      633   PICTURE-TEST-4
      642   PICTURE-TEST-4-A . . . . . . .  G637
      651   PICTURE-TEST-4-B
      660   PICTURE-TEST-4-C
      669   PICTURE-TEST-4-D
      678   PICTURE-TEST-4-E
      687   PICTURE-TEST-4-F
      696   PICTURE-TEST-4-G
      705   PICTURE-TEST-4-H
      719   PICTURE-TEST-5
      728   PICTURE-TEST-5-A . . . . . . .  G723
      737   PICTURE-TEST-5-B
      746   PICTURE-TEST-5-C
      755   PICTURE-TEST-5-D
      764   PICTURE-TEST-5-E
      773   PICTURE-TEST-5-F
      782   PICTURE-TEST-5-G
      791   PICTURE-TEST-5-H
      805   PICTURE-TEST-6
      814   PICTURE-TEST-6-A . . . . . . .  G809
      823   PICTURE-TEST-6-B
      832   PICTURE-TEST-6-C
      841   PICTURE-TEST-6-D
      850   PICTURE-TEST-6-E
      859   PICTURE-TEST-6-F
      868   PICTURE-TEST-6-G
      877   PICTURE-TEST-6-H
      891   PICTURE-TEST-7
      900   PICTURE-TEST-7-A . . . . . . .  G895
      909   PICTURE-TEST-7-B
      918   PICTURE-TEST-7-C
      927   PICTURE-TEST-7-D
      936   PICTURE-TEST-7-E
      945   PICTURE-TEST-7-F
      954   PICTURE-TEST-7-G
      963   PICTURE-TEST-7-H
      977   PICTURE-TEST-8
      986   PICTURE-TEST-8-A . . . . . . .  G981
      995   PICTURE-TEST-8-B
     1004   PICTURE-TEST-8-C
     1013   PICTURE-TEST-8-D
     1022   PICTURE-TEST-8-E
     1031   PICTURE-TEST-8-F
     1040   PICTURE-TEST-8-G
     1049   PICTURE-TEST-8-H
     1063   PICTURE-TEST-9
     1072   PICTURE-TEST-9-A . . . . . . .  G1067
     1081   PICTURE-TEST-9-B
     1090   PICTURE-TEST-9-C
     1099   PICTURE-TEST-9-D
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    56
0 Defined   Cross-reference of procedures   References

0    1108   PICTURE-TEST-9-E
     1117   PICTURE-TEST-9-F
     1126   PICTURE-TEST-9-G
     1135   PICTURE-TEST-9-H
     2189   PICTURE-WRITE-27 . . . . . . .  G2181 G2184
     2211   PICTURE-WRITE-28 . . . . . . .  G2203 G2206
     2234   PICTURE-WRITE-29 . . . . . . .  G2226 G2229
     2256   PICTURE-WRITE-30 . . . . . . .  G2248 G2251
     2279   PICTURE-WRITE-31 . . . . . . .  G2271 G2274
     2301   PICTURE-WRITE-32 . . . . . . .  G2293 G2296
     2323   PICTURE-WRITE-33 . . . . . . .  G2315 G2318
     2346   PICTURE-WRITE-34 . . . . . . .  G2338 G2341
      268   PRINT-DETAIL . . . . . . . . .  P382 P387 P391 P396 P400 P405 P409 P414 P418 P423 P427 P432 P436 P441 P445 P450
                                            P454 P468 P473 P477 P482 P486 P491 P495 P500 P504 P509 P513 P518 P522 P527 P531
                                            P536 P540 P554 P559 P563 P568 P572 P577 P581 P586 P590 P595 P599 P604 P608 P613
                                            P617 P622 P626 P640 P645 P649 P654 P658 P663 P667 P672 P676 P681 P685 P690 P694
                                            P699 P703 P708 P712 P726 P731 P735 P740 P744 P749 P753 P758 P762 P767 P771 P776
                                            P780 P785 P789 P794 P798 P812 P817 P821 P826 P830 P835 P839 P844 P848 P853 P857
                                            P862 P866 P871 P875 P880 P884 P898 P903 P907 P912 P916 P921 P925 P930 P934 P939
                                            P943 P948 P952 P957 P961 P966 P970 P984 P989 P993 P998 P1002 P1007 P1011 P1016
                                            P1020 P1025 P1029 P1034 P1038 P1043 P1047 P1052 P1056 P1070 P1075 P1079 P1084
                                            P1088 P1093 P1097 P1102 P1106 P1111 P1115 P1120 P1124 P1129 P1133 P1138 P1142
                                            P1155 P1160 P1164 P1169 P1173 P1178 P1182 P1187 P1191 P1204 P1209 P1213 P1218
                                            P1222 P1227 P1231 P1236 P1240 P1253 P1258 P1262 P1267 P1271 P1276 P1280 P1285
                                            P1289 P1302 P1307 P1311 P1316 P1320 P1325 P1329 P1334 P1338 P1351 P1356 P1360
                                            P1365 P1369 P1374 P1378 P1383 P1387 P1400 P1405 P1409 P1414 P1418 P1423 P1427
                                            P1432 P1436 P1449 P1454 P1458 P1463 P1467 P1472 P1476 P1481 P1485 P1490 P1494
                                            P1507 P1512 P1516 P1521 P1525 P1530 P1534 P1539 P1543 P1548 P1552 P1565 P1570
                                            P1574 P1579 P1583 P1588 P1592 P1597 P1601 P1606 P1610 P1623 P1628 P1632 P1637
                                            P1641 P1646 P1650 P1655 P1659 P1664 P1668 P1681 P1686 P1690 P1695 P1699 P1704
                                            P1708 P1713 P1717 P1722 P1726 P1739 P1744 P1748 P1753 P1757 P1762 P1766 P1771
                                            P1775 P1780 P1784 P1798 P1803 P1807 P1812 P1816 P1821 P1825 P1830 P1834 P1839
                                            P1843 P1848 P1852 P1857 P1861 P1875 P1880 P1884 P1889 P1893 P1898 P1902 P1907
                                            P1911 P1916 P1920 P1925 P1929 P1934 P1938 P1952 P1957 P1961 P1966 P1970 P1975
                                            P1979 P1984 P1988 P1993 P1997 P2002 P2006 P2011 P2015 P2029 P2034 P2038 P2043
                                            P2047 P2052 P2056 P2061 P2065 P2070 P2074 P2079 P2083 P2088 P2092 P2106 P2111
                                            P2115 P2120 P2124 P2129 P2133 P2137 P2141 P2146 P2150 P2155 P2159 P2164 P2168
                                            P2191 P2213 P2236 P2258 P2281 P2303 P2325 P2348
      261   TERMINATE-CALL
      259   TERMINATE-CCVS
      322   WRITE-LINE . . . . . . . . . .  P272 P273 P281 P282 P283 P284 P286 P287 P288 P290 P292 P301 P309 P315 P320 P321
                                            P349 P353 P355 P364
      338   WRT-LN . . . . . . . . . . . .  P328 P329 P330 P331 P332 P333 P334 P337 P342
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    57
0 Defined   Cross-reference of programs     References

        4   NC124A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC124A    Date 06/04/2022  Time 12:00:43   Page    58
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   1199  IGYPA3087-W   "WORK-AREA-11 (NUMERIC NON-INTEGER)" and "EDIT-AREA-9 (NUMERIC-EDITED)" had no digit positions in common.  The
                       receiver will be set to zero at execution time.

   1199  IGYPA3087-W   "WORK-AREA-11 (NUMERIC NON-INTEGER)" and "EDIT-AREA-10 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   1734  IGYPA3087-W   "WORK-AREA-21 (NUMERIC NON-INTEGER)" and "EDIT-AREA-13 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   1734  IGYPA3087-W   "WORK-AREA-21 (NUMERIC NON-INTEGER)" and "EDIT-AREA-14 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   1734  IGYPA3087-W   "WORK-AREA-21 (NUMERIC NON-INTEGER)" and "EDIT-AREA-15 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   2100  IGYPA3087-W   "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-18 (NUMERIC INTEGER)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   2100  IGYPA3087-W   "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-19 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   2100  IGYPA3087-W   "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-20 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   2100  IGYPA3087-W   "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-21 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   2100  IGYPA3087-W   "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-22 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.

   2100  IGYPA3087-W   "WORK-AREA-26 (NUMERIC NON-INTEGER)" and "EDIT-AREA-24 (NUMERIC-EDITED)" had no digit positions in common.
                       The receiver will be set to zero at execution time.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:      12           1             11
-* Statistics for COBOL program NC124A:
 *    Source records = 2351
 *    Data Division statements = 132
 *    Procedure Division statements = 1793
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1815
0End of compilation 1,  program NC124A,  highest severity 4.
0Return code 4
