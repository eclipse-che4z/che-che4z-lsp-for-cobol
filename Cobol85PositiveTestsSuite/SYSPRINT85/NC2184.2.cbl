1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:54   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:54   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2184.2
   000002         000200 PROGRAM-ID.                                                      NC2184.2
   000003         000300     NC218A.                                                      NC2184.2
   000004         000500*                                                              *  NC2184.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2184.2
   000006         000700*                                                              *  NC2184.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2184.2
   000008         000900*                                                              *  NC2184.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2184.2
   000010         001100*                                                              *  NC2184.2
   000011         001300*                                                              *  NC2184.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2184.2
   000013         001500*                                                              *  NC2184.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2184.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2184.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2184.2
   000017         001900*                                                              *  NC2184.2
   000018         002100*                                                              *  NC2184.2
   000019         002200*    PROGRAM NC218A TESTS TYHE USE OF THE "UNSTRING" STATEMENT *  NC2184.2
   000020         002300*    INCLUDING THE OPTIONAL PHRASES "POINTER", "TALLYING",     *  NC2184.2
   000021         002400*    "OVERFLOW", "NOT OVERFLOW" AND "END-STRING".              *  NC2184.2
   000022         002500*                                                              *  NC2184.2
   000023         002700 ENVIRONMENT DIVISION.                                            NC2184.2
   000024         002800 CONFIGURATION SECTION.                                           NC2184.2
   000025         002900 SOURCE-COMPUTER.                                                 NC2184.2
   000026         003000     XXXXX082.                                                    NC2184.2
   000027         003100 OBJECT-COMPUTER.                                                 NC2184.2
   000028         003200     XXXXX083.                                                    NC2184.2
   000029         003300 INPUT-OUTPUT SECTION.                                            NC2184.2
   000030         003400 FILE-CONTROL.                                                    NC2184.2
   000031         003500     SELECT PRINT-FILE ASSIGN TO                                  NC2184.2 35
   000032         003600     XXXXX055.                                                    NC2184.2
   000033         003700 DATA DIVISION.                                                   NC2184.2
   000034         003800 FILE SECTION.                                                    NC2184.2
   000035         003900 FD  PRINT-FILE.                                                  NC2184.2

 ==000035==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000036         004000 01  PRINT-REC PICTURE X(120).                                    NC2184.2
   000037         004100 01  DUMMY-RECORD PICTURE X(120).                                 NC2184.2
   000038         004200 WORKING-STORAGE SECTION.                                         NC2184.2
   000039         004300 01  WRK-XN-00001-1       PIC X.                                  NC2184.2
   000040         004400 01  WRK-XN-00001-2       PIC X.                                  NC2184.2
   000041         004500 01  WRK-XN-00001-3       PIC X.                                  NC2184.2
   000042         004600 01  ZERO-XN-1 PIC X VALUE "0".                                   NC2184.2
   000043         004700 01  GRP1-XN-6 PIC X(6) VALUE "ABCDEF".                           NC2184.2
   000044         004800 01  ID1-XN-7 PIC X(7) VALUE "1200000".                           NC2184.2
   000045         004900 01  GRP1-XN-7 PIC X(7) VALUE "ABCDEFG".                          NC2184.2
   000046         005000 01  GRP1-XN-10 PIC X(10) VALUE "ABCDEFGHIJ".                     NC2184.2
   000047         005100 01  ID1-XN-12 PIC X(12) VALUE "ABCDEFGHIJKL".                    NC2184.2
   000048         005200 01  GRP1-XN-36 PIC X(36) VALUE                                   NC2184.2
   000049         005300     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".                      NC2184.2
   000050         005400 01  GRP1-XN-X-36 REDEFINES GRP1-XN-36.                           NC2184.2 48
   000051         005500     10 ID1 PIC X(6) OCCURS 6 TIMES.                              NC2184.2
   000052         005600 01  GRP2-XN-2 PIC XX VALUE "CE".                                 NC2184.2
   000053         005700 01  GRP2-XN-X-2 REDEFINES GRP2-XN-2.                             NC2184.2 52
   000054         005800     10 ID2A PIC X OCCURS 2 TIMES.                                NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900 01  GRP2-XN-7 PIC X(7) VALUE "BCDEFGH".                          NC2184.2
   000056         006000 01  GRP2-XN-X-7 REDEFINES GRP2-XN-7.                             NC2184.2 55
   000057         006100     10 ID2 PIC X OCCURS 7 TIMES.                                 NC2184.2
   000058         006200 01  ID4-X PIC X VALUE SPACE.                                     NC2184.2 IMP
   000059         006300 01  ID4-XJ PIC X JUSTIFIED RIGHT VALUE SPACE.                    NC2184.2 IMP
   000060         006400 01  ID4-XXX  PIC XXX VALUE SPACES.                               NC2184.2 IMP
   000061         006500 01  ID4-XXXJ PIC XXX JUST RIGHT VALUE SPACES.                    NC2184.2 IMP
   000062         006600 01  ID4-DU-1V0 PIC 9 VALUE ZERO.                                 NC2184.2 IMP
   000063         006700 01  ID4-DS-1V0 PIC S9 VALUE ZERO.                                NC2184.2 IMP
   000064         006800 01  ID4-DU-2V0 PIC 99 VALUE ZERO.                                NC2184.2 IMP
   000065         006900 01  ID4-DS-2V0 PIC S99 VALUE ZERO.                               NC2184.2 IMP
   000066         007000 01  ID4-DS-TS-1V0 PIC S9 TRAILING VALUE ZERO.                    NC2184.2 IMP
   000067         007100 01  ID4-DS-LS-1V0 PIC S9 LEADING VALUE ZERO.                     NC2184.2 IMP
   000068         007200 01  GRP4-XN-6.                                                   NC2184.2
   000069         007300     10 ID4A-XXXXX PIC X(5).                                      NC2184.2
   000070         007400     10 ID4B-X PIC X.                                             NC2184.2
   000071         007500 01  ID4C-XXXX PIC X(4) VALUE SPACES.                             NC2184.2 IMP
   000072         007600 01  ID4D-X PIC X VALUE SPACE.                                    NC2184.2 IMP
   000073         007700 01  GRP4-XN-10.                                                  NC2184.2
   000074         007800     10 ID4A-X PIC X.                                             NC2184.2
   000075         007900     10 ID4B-XX PIC XX.                                           NC2184.2
   000076         008000     10 ID4C-XXX PIC XXX.                                         NC2184.2
   000077         008100     10 ID4D-XXXX PIC XXXX.                                       NC2184.2
   000078         008200 01  ASTER-XN-4 PIC X(4) VALUE "****".                            NC2184.2
   000079         008300 01  ID5-XN-4 PIC X(4) VALUE SPACES.                              NC2184.2 IMP
   000080         008400 01  ID5-XN-4-2 PIC X(4) VALUE SPACES.                            NC2184.2 IMP
   000081         008500 01  ID5-XN-6 PIC X(6) VALUE SPACES.                              NC2184.2 IMP
   000082         008600 01  ID6-DU-2V0 PIC 99 VALUE ZERO.                                NC2184.2 IMP
   000083         008700 01  ID6-DU-2V0-2  PIC 99 VALUE ZERO.                             NC2184.2 IMP
   000084         008800 01  ID10-DU-2V0 PIC 99 VALUE ZERO.                               NC2184.2 IMP
   000085         008900 01  ID11-DU-2V0 PIC 99 VALUE ZERO.                               NC2184.2 IMP
   000086         009000 01  TEST-RESULTS.                                                NC2184.2
   000087         009100     02 FILLER                   PIC X      VALUE SPACE.          NC2184.2 IMP
   000088         009200     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2184.2 IMP
   000089         009300     02 FILLER                   PIC X      VALUE SPACE.          NC2184.2 IMP
   000090         009400     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2184.2 IMP
   000091         009500     02 FILLER                   PIC X      VALUE SPACE.          NC2184.2 IMP
   000092         009600     02  PAR-NAME.                                                NC2184.2
   000093         009700       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2184.2 IMP
   000094         009800       03  PARDOT-X              PIC X      VALUE SPACE.          NC2184.2 IMP
   000095         009900       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2184.2 IMP
   000096         010000     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2184.2 IMP
   000097         010100     02 RE-MARK                  PIC X(61).                       NC2184.2
   000098         010200 01  TEST-COMPUTED.                                               NC2184.2
   000099         010300     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2184.2 IMP
   000100         010400     02 FILLER                   PIC X(17)  VALUE                 NC2184.2
   000101         010500            "       COMPUTED=".                                   NC2184.2
   000102         010600     02 COMPUTED-X.                                               NC2184.2
   000103         010700     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2184.2 IMP
   000104         010800     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2184.2 103
   000105         010900                                 PIC -9(9).9(9).                  NC2184.2
   000106         011000     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2184.2 103
   000107         011100     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2184.2 103
   000108         011200     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2184.2 103
   000109         011300     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2184.2 103
   000110         011400         04 COMPUTED-18V0                    PIC -9(18).          NC2184.2
   000111         011500         04 FILLER                           PIC X.               NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     03 FILLER PIC X(50) VALUE SPACE.                             NC2184.2 IMP
   000113         011700 01  TEST-CORRECT.                                                NC2184.2
   000114         011800     02 FILLER PIC X(30) VALUE SPACE.                             NC2184.2 IMP
   000115         011900     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2184.2
   000116         012000     02 CORRECT-X.                                                NC2184.2
   000117         012100     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2184.2 IMP
   000118         012200     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2184.2 117
   000119         012300     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2184.2 117
   000120         012400     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2184.2 117
   000121         012500     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2184.2 117
   000122         012600     03      CR-18V0 REDEFINES CORRECT-A.                         NC2184.2 117
   000123         012700         04 CORRECT-18V0                     PIC -9(18).          NC2184.2
   000124         012800         04 FILLER                           PIC X.               NC2184.2
   000125         012900     03 FILLER PIC X(2) VALUE SPACE.                              NC2184.2 IMP
   000126         013000     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2184.2 IMP
   000127         013100 01  CCVS-C-1.                                                    NC2184.2
   000128         013200     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2184.2
   000129         013300-    "SS  PARAGRAPH-NAME                                          NC2184.2
   000130         013400-    "       REMARKS".                                            NC2184.2
   000131         013500     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2184.2 IMP
   000132         013600 01  CCVS-C-2.                                                    NC2184.2
   000133         013700     02 FILLER                     PIC X        VALUE SPACE.      NC2184.2 IMP
   000134         013800     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2184.2
   000135         013900     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2184.2 IMP
   000136         014000     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2184.2
   000137         014100     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2184.2 IMP
   000138         014200 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2184.2 IMP
   000139         014300 01  REC-CT                        PIC 99       VALUE ZERO.       NC2184.2 IMP
   000140         014400 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2184.2 IMP
   000141         014500 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2184.2 IMP
   000142         014600 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2184.2 IMP
   000143         014700 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2184.2 IMP
   000144         014800 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2184.2 IMP
   000145         014900 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2184.2 IMP
   000146         015000 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2184.2 IMP
   000147         015100 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2184.2 IMP
   000148         015200 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2184.2 IMP
   000149         015300 01  CCVS-H-1.                                                    NC2184.2
   000150         015400     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2184.2 IMP
   000151         015500     02  FILLER                    PIC X(42)    VALUE             NC2184.2
   000152         015600     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2184.2
   000153         015700     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2184.2 IMP
   000154         015800 01  CCVS-H-2A.                                                   NC2184.2
   000155         015900   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2184.2 IMP
   000156         016000   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2184.2
   000157         016100   02  FILLER                        PIC XXXX   VALUE             NC2184.2
   000158         016200     "4.2 ".                                                      NC2184.2
   000159         016300   02  FILLER                        PIC X(28)  VALUE             NC2184.2
   000160         016400            " COPY - NOT FOR DISTRIBUTION".                       NC2184.2
   000161         016500   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2184.2 IMP
   000162         016600                                                                  NC2184.2
   000163         016700 01  CCVS-H-2B.                                                   NC2184.2
   000164         016800   02  FILLER                        PIC X(15)  VALUE             NC2184.2
   000165         016900            "TEST RESULT OF ".                                    NC2184.2
   000166         017000   02  TEST-ID                       PIC X(9).                    NC2184.2
   000167         017100   02  FILLER                        PIC X(4)   VALUE             NC2184.2
   000168         017200            " IN ".                                               NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300   02  FILLER                        PIC X(12)  VALUE             NC2184.2
   000170         017400     " HIGH       ".                                              NC2184.2
   000171         017500   02  FILLER                        PIC X(22)  VALUE             NC2184.2
   000172         017600            " LEVEL VALIDATION FOR ".                             NC2184.2
   000173         017700   02  FILLER                        PIC X(58)  VALUE             NC2184.2
   000174         017800     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2184.2
   000175         017900 01  CCVS-H-3.                                                    NC2184.2
   000176         018000     02  FILLER                      PIC X(34)  VALUE             NC2184.2
   000177         018100            " FOR OFFICIAL USE ONLY    ".                         NC2184.2
   000178         018200     02  FILLER                      PIC X(58)  VALUE             NC2184.2
   000179         018300     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2184.2
   000180         018400     02  FILLER                      PIC X(28)  VALUE             NC2184.2
   000181         018500            "  COPYRIGHT   1985 ".                                NC2184.2
   000182         018600 01  CCVS-E-1.                                                    NC2184.2
   000183         018700     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2184.2 IMP
   000184         018800     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2184.2
   000185         018900     02 ID-AGAIN                     PIC X(9).                    NC2184.2
   000186         019000     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2184.2 IMP
   000187         019100 01  CCVS-E-2.                                                    NC2184.2
   000188         019200     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2184.2 IMP
   000189         019300     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2184.2 IMP
   000190         019400     02 CCVS-E-2-2.                                               NC2184.2
   000191         019500         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2184.2 IMP
   000192         019600         03 FILLER                   PIC X      VALUE SPACE.      NC2184.2 IMP
   000193         019700         03 ENDER-DESC               PIC X(44)  VALUE             NC2184.2
   000194         019800            "ERRORS ENCOUNTERED".                                 NC2184.2
   000195         019900 01  CCVS-E-3.                                                    NC2184.2
   000196         020000     02  FILLER                      PIC X(22)  VALUE             NC2184.2
   000197         020100            " FOR OFFICIAL USE ONLY".                             NC2184.2
   000198         020200     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2184.2 IMP
   000199         020300     02  FILLER                      PIC X(58)  VALUE             NC2184.2
   000200         020400     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2184.2
   000201         020500     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2184.2 IMP
   000202         020600     02 FILLER                       PIC X(15)  VALUE             NC2184.2
   000203         020700             " COPYRIGHT 1985".                                   NC2184.2
   000204         020800 01  CCVS-E-4.                                                    NC2184.2
   000205         020900     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2184.2 IMP
   000206         021000     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2184.2
   000207         021100     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2184.2 IMP
   000208         021200     02 FILLER                       PIC X(40)  VALUE             NC2184.2
   000209         021300      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2184.2
   000210         021400 01  XXINFO.                                                      NC2184.2
   000211         021500     02 FILLER                       PIC X(19)  VALUE             NC2184.2
   000212         021600            "*** INFORMATION ***".                                NC2184.2
   000213         021700     02 INFO-TEXT.                                                NC2184.2
   000214         021800       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2184.2 IMP
   000215         021900       04 XXCOMPUTED                 PIC X(20).                   NC2184.2
   000216         022000       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2184.2 IMP
   000217         022100       04 XXCORRECT                  PIC X(20).                   NC2184.2
   000218         022200     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2184.2
   000219         022300 01  HYPHEN-LINE.                                                 NC2184.2
   000220         022400     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2184.2 IMP
   000221         022500     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2184.2
   000222         022600-    "*****************************************".                 NC2184.2
   000223         022700     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2184.2
   000224         022800-    "******************************".                            NC2184.2
   000225         022900 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     "NC218A".                                                    NC2184.2
   000227         023100 PROCEDURE DIVISION.                                              NC2184.2
   000228         023200 CCVS1 SECTION.                                                   NC2184.2
   000229         023300 OPEN-FILES.                                                      NC2184.2
   000230         023400     OPEN     OUTPUT PRINT-FILE.                                  NC2184.2 35
   000231         023500     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2184.2 225 166 225 185
   000232         023600     MOVE    SPACE TO TEST-RESULTS.                               NC2184.2 IMP 86
   000233         023700     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2184.2 258 263
   000234         023800     GO TO CCVS1-EXIT.                                            NC2184.2 340
   000235         023900 CLOSE-FILES.                                                     NC2184.2
   000236         024000     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2184.2 267 288 35
   000237         024100 TERMINATE-CCVS.                                                  NC2184.2
   000238         024200     EXIT PROGRAM.                                                NC2184.2
   000239         024300 TERMINATE-CALL.                                                  NC2184.2
   000240         024400     STOP     RUN.                                                NC2184.2
   000241         024500 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2184.2 90 142
   000242         024600 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2184.2 90 143
   000243         024700 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2184.2 90 141
   000244         024800 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2184.2 90 140
   000245         024900     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2184.2 97
   000246         025000 PRINT-DETAIL.                                                    NC2184.2
   000247         025100     IF REC-CT NOT EQUAL TO ZERO                                  NC2184.2 139 IMP
   000248      1  025200             MOVE "." TO PARDOT-X                                 NC2184.2 94
   000249      1  025300             MOVE REC-CT TO DOTVALUE.                             NC2184.2 139 95
   000250         025400     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2184.2 86 36 300
   000251         025500     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2184.2 90 300
   000252      1  025600        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2184.2 317 330
   000253      1  025700          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2184.2 331 339
   000254         025800     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2184.2 IMP 90 IMP 102
   000255         025900     MOVE SPACE TO CORRECT-X.                                     NC2184.2 IMP 116
   000256         026000     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2184.2 139 IMP IMP 92
   000257         026100     MOVE     SPACE TO RE-MARK.                                   NC2184.2 IMP 97
   000258         026200 HEAD-ROUTINE.                                                    NC2184.2
   000259         026300     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2184.2 149 37 300
   000260         026400     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2184.2 154 37 300
   000261         026500     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2184.2 163 37 300
   000262         026600     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2184.2 175 37 300
   000263         026700 COLUMN-NAMES-ROUTINE.                                            NC2184.2
   000264         026800     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2184.2 127 37 300
   000265         026900     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2184.2 132 37 300
   000266         027000     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2184.2 219 37 300
   000267         027100 END-ROUTINE.                                                     NC2184.2
   000268         027200     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2184.2 219 37 300
   000269         027300 END-RTN-EXIT.                                                    NC2184.2
   000270         027400     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2184.2 182 37 300
   000271         027500 END-ROUTINE-1.                                                   NC2184.2
   000272         027600      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2184.2 141 145 142
   000273         027700      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2184.2 145 140 145
   000274         027800      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2184.2 143 145
   000275         027900*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2184.2
   000276         028000      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2184.2 143 205
   000277         028100      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2184.2 145 207
   000278         028200      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2184.2 204 190
   000279         028300      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2184.2 187 37 300
   000280         028400  END-ROUTINE-12.                                                 NC2184.2
   000281         028500      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2184.2 193
   000282         028600     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2184.2 141 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283      1  028700         MOVE "NO " TO ERROR-TOTAL                                NC2184.2 191
   000284         028800         ELSE                                                     NC2184.2
   000285      1  028900         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2184.2 141 191
   000286         029000     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2184.2 187 37
   000287         029100     PERFORM WRITE-LINE.                                          NC2184.2 300
   000288         029200 END-ROUTINE-13.                                                  NC2184.2
   000289         029300     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2184.2 140 IMP
   000290      1  029400         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2184.2 191
   000291      1  029500         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2184.2 140 191
   000292         029600     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2184.2 193
   000293         029700     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2184.2 187 37 300
   000294         029800      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2184.2 142 IMP
   000295      1  029900          MOVE "NO " TO ERROR-TOTAL                               NC2184.2 191
   000296      1  030000      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2184.2 142 191
   000297         030100      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2184.2 193
   000298         030200      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2184.2 187 37 300
   000299         030300     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2184.2 195 37 300
   000300         030400 WRITE-LINE.                                                      NC2184.2
   000301         030500     ADD 1 TO RECORD-COUNT.                                       NC2184.2 147
   000302         030600     IF RECORD-COUNT GREATER 50                                   NC2184.2 147
   000303      1  030700         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2184.2 37 146
   000304      1  030800         MOVE SPACE TO DUMMY-RECORD                               NC2184.2 IMP 37
   000305      1  030900         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2184.2 37
   000306      1  031000         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2184.2 127 37 312
   000307      1  031100         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2184.2 132 37 312
   000308      1  031200         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2184.2 219 37 312
   000309      1  031300         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2184.2 146 37
   000310      1  031400         MOVE ZERO TO RECORD-COUNT.                               NC2184.2 IMP 147
   000311         031500     PERFORM WRT-LN.                                              NC2184.2 312
   000312         031600 WRT-LN.                                                          NC2184.2
   000313         031700     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2184.2 37
   000314         031800     MOVE SPACE TO DUMMY-RECORD.                                  NC2184.2 IMP 37
   000315         031900 BLANK-LINE-PRINT.                                                NC2184.2
   000316         032000     PERFORM WRT-LN.                                              NC2184.2 312
   000317         032100 FAIL-ROUTINE.                                                    NC2184.2
   000318         032200     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2184.2 102 IMP 325
   000319         032300     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2184.2 116 IMP 325
   000320         032400     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2184.2 148 218
   000321         032500     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2184.2 213
   000322         032600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2184.2 210 37 300
   000323         032700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2184.2 IMP 218
   000324         032800     GO TO  FAIL-ROUTINE-EX.                                      NC2184.2 330
   000325         032900 FAIL-ROUTINE-WRITE.                                              NC2184.2
   000326         033000     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2184.2 98 36 300
   000327         033100     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2184.2 148 126
   000328         033200     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2184.2 113 36 300
   000329         033300     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2184.2 IMP 126
   000330         033400 FAIL-ROUTINE-EX. EXIT.                                           NC2184.2
   000331         033500 BAIL-OUT.                                                        NC2184.2
   000332         033600     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2184.2 103 IMP 334
   000333         033700     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2184.2 117 IMP 339
   000334         033800 BAIL-OUT-WRITE.                                                  NC2184.2
   000335         033900     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2184.2 117 217 103 215
   000336         034000     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2184.2 148 218
   000337         034100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2184.2 210 37 300
   000338         034200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2184.2 IMP 218
   000339         034300 BAIL-OUT-EX. EXIT.                                               NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400 CCVS1-EXIT.                                                      NC2184.2
   000341         034500     EXIT.                                                        NC2184.2
   000342         034600 SECT-NC218A-001 SECTION.                                         NC2184.2
   000343         034700                                                                  NC2184.2
   000344         034800 UST-INIT-GF-1.                                                   NC2184.2
   000345         034900     MOVE   "VI-135" TO ANSI-REFERENCE.                           NC2184.2 148
   000346         035000     MOVE   "UST-TEST-GF-1" TO PAR-NAME.                          NC2184.2 92
   000347         035100     MOVE   "PIC X " TO FEATURE.                                  NC2184.2 88
   000348         035200     MOVE    ZERO TO ID4-X.                                       NC2184.2 IMP 58
   000349         035300     MOVE   "1200000" TO ID1-XN-7.                                NC2184.2 44
   000350         035400     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   000351         035500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   000352         035600     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   000353         035700     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   000354         035800     MOVE    1 TO REC-CT.                                         NC2184.2 139
   000355         035900 UST-TEST-GF-1.                                                   NC2184.2
   000356         036000     UNSTRING ID1-XN-7 DELIMITED BY ZERO                          NC2184.2 44 IMP
   000357         036100              INTO ID4-X DELIMITER IN ID5-XN-4                    NC2184.2 58 79
   000358         036200              COUNT IN ID6-DU-2V0                                 NC2184.2 82
   000359         036300              WITH POINTER ID10-DU-2V0                            NC2184.2 84
   000360         036400              TALLYING ID11-DU-2V0                                NC2184.2 85
   000361      1  036500              ON OVERFLOW  PERFORM PASS                           NC2184.2 242
   000362      1  036600                           GO TO UST-WRITE-GF-1.                  NC2184.2 371
   000363         036700     GO TO UST-FAIL-GF-1.                                         NC2184.2 368
   000364         036800 UST-DELETE-GF-1.                                                 NC2184.2
   000365         036900     PERFORM DE-LETE.                                             NC2184.2 244
   000366         037000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000367         037100     GO      TO UST-INIT-GF-2.                                    NC2184.2 459
   000368         037200 UST-FAIL-GF-1.                                                   NC2184.2
   000369         037300     PERFORM FAIL.                                                NC2184.2 243
   000370         037400     MOVE    "OVERFLOW SHOULD OCCUR" TO RE-MARK.                  NC2184.2 97
   000371         037500 UST-WRITE-GF-1.                                                  NC2184.2
   000372         037600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000373         037700*                                                                 NC2184.2
   000374         037800 UST-TEST-GF-1-1.                                                 NC2184.2
   000375         037900     ADD     1 TO REC-CT.                                         NC2184.2 139
   000376         038000     IF      ID4-X = "1"                                          NC2184.2 58
   000377      1  038100             PERFORM PASS                                         NC2184.2 242
   000378      1  038200             GO TO UST-WRITE-GF-1-1                               NC2184.2 388
   000379         038300     ELSE                                                         NC2184.2
   000380      1  038400             GO TO UST-FAIL-GF-1-1.                               NC2184.2 384
   000381         038500 UST-DELETE-GF-1-1.                                               NC2184.2
   000382         038600     PERFORM DE-LETE.                                             NC2184.2 244
   000383         038700     GO TO UST-WRITE-GF-1-1.                                      NC2184.2 388
   000384         038800 UST-FAIL-GF-1-1.                                                 NC2184.2
   000385         038900     PERFORM FAIL                                                 NC2184.2 243
   000386         039000     MOVE    ID4-X TO COMPUTED-A                                  NC2184.2 58 103
   000387         039100     MOVE    "1" TO CORRECT-A.                                    NC2184.2 117
   000388         039200 UST-WRITE-GF-1-1.                                                NC2184.2
   000389         039300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000390         039400*                                                                 NC2184.2
   000391         039500 UST-TEST-GF-1-2.                                                 NC2184.2
   000392         039600     ADD     1 TO REC-CT.                                         NC2184.2 139
   000393         039700     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   000394      1  039800             PERFORM PASS                                         NC2184.2 242
   000395      1  039900             GO TO UST-WRITE-GF-1-2                               NC2184.2 405
   000396         040000     ELSE                                                         NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100             GO TO UST-FAIL-GF-1-2.                               NC2184.2 401
   000398         040200 UST-DELETE-GF-1-2.                                               NC2184.2
   000399         040300     PERFORM DE-LETE.                                             NC2184.2 244
   000400         040400     GO TO UST-WRITE-GF-1-2.                                      NC2184.2 405
   000401         040500 UST-FAIL-GF-1-2.                                                 NC2184.2
   000402         040600     PERFORM FAIL                                                 NC2184.2 243
   000403         040700     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   000404         040800     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   000405         040900 UST-WRITE-GF-1-2.                                                NC2184.2
   000406         041000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000407         041100*                                                                 NC2184.2
   000408         041200 UST-TEST-GF-1-3.                                                 NC2184.2
   000409         041300     ADD     1 TO REC-CT.                                         NC2184.2 139
   000410         041400     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   000411      1  041500             PERFORM PASS                                         NC2184.2 242
   000412      1  041600             GO TO UST-WRITE-GF-1-3                               NC2184.2 422
   000413         041700     ELSE                                                         NC2184.2
   000414      1  041800             GO TO UST-FAIL-GF-1-3.                               NC2184.2 418
   000415         041900 UST-DELETE-GF-1-3.                                               NC2184.2
   000416         042000     PERFORM DE-LETE.                                             NC2184.2 244
   000417         042100     GO TO UST-WRITE-GF-1-3.                                      NC2184.2 422
   000418         042200 UST-FAIL-GF-1-3.                                                 NC2184.2
   000419         042300     PERFORM FAIL                                                 NC2184.2 243
   000420         042400     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   000421         042500     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   000422         042600 UST-WRITE-GF-1-3.                                                NC2184.2
   000423         042700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000424         042800*                                                                 NC2184.2
   000425         042900 UST-TEST-GF-1-4.                                                 NC2184.2
   000426         043000     ADD     1 TO REC-CT.                                         NC2184.2 139
   000427         043100     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   000428      1  043200             PERFORM PASS                                         NC2184.2 242
   000429      1  043300             GO TO UST-WRITE-GF-1-4                               NC2184.2 439
   000430         043400     ELSE                                                         NC2184.2
   000431      1  043500             GO TO UST-FAIL-GF-1-4.                               NC2184.2 435
   000432         043600 UST-DELETE-GF-1-4.                                               NC2184.2
   000433         043700     PERFORM DE-LETE.                                             NC2184.2 244
   000434         043800     GO TO UST-WRITE-GF-1-4.                                      NC2184.2 439
   000435         043900 UST-FAIL-GF-1-4.                                                 NC2184.2
   000436         044000     PERFORM FAIL                                                 NC2184.2 243
   000437         044100     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   000438         044200     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   000439         044300 UST-WRITE-GF-1-4.                                                NC2184.2
   000440         044400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000441         044500*                                                                 NC2184.2
   000442         044600 UST-TEST-GF-1-5.                                                 NC2184.2
   000443         044700     ADD     1 TO REC-CT.                                         NC2184.2 139
   000444         044800     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   000445      1  044900             PERFORM PASS                                         NC2184.2 242
   000446      1  045000             GO TO UST-WRITE-GF-1-5                               NC2184.2 456
   000447         045100     ELSE                                                         NC2184.2
   000448      1  045200             GO TO UST-FAIL-GF-1-5.                               NC2184.2 452
   000449         045300 UST-DELETE-GF-1-5.                                               NC2184.2
   000450         045400     PERFORM DE-LETE.                                             NC2184.2 244
   000451         045500     GO TO UST-WRITE-GF-1-5.                                      NC2184.2 456
   000452         045600 UST-FAIL-GF-1-5.                                                 NC2184.2
   000453         045700     PERFORM FAIL                                                 NC2184.2 243
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000454         045800     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   000455         045900     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   000456         046000 UST-WRITE-GF-1-5.                                                NC2184.2
   000457         046100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000458         046200*                                                                 NC2184.2
   000459         046300 UST-INIT-GF-2.                                                   NC2184.2
   000460         046400     MOVE    "UST-TEST-GF-2" TO PAR-NAME.                         NC2184.2 92
   000461         046500     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   000462         046600     MOVE    "PIC X JUST" TO FEATURE.                             NC2184.2 88
   000463         046700     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   000464         046800     MOVE    ZERO TO ID4-XJ.                                      NC2184.2 IMP 59
   000465         046900     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   000466         047000     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   000467         047100     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   000468         047200     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   000469         047300     MOVE    1 TO REC-CT.                                         NC2184.2 139
   000470         047400*                                                                 NC2184.2
   000471         047500 UST-TEST-GF-2.                                                   NC2184.2
   000472         047600     UNSTRING ID1-XN-7 DELIMITED ZERO INTO ID4-XJ                 NC2184.2 44 IMP 59
   000473         047700             DELIMITER ID5-XN-4                                   NC2184.2 79
   000474         047800             COUNT ID6-DU-2V0                                     NC2184.2 82
   000475         047900             POINTER ID10-DU-2V0                                  NC2184.2 84
   000476         048000             TALLYING ID11-DU-2V0                                 NC2184.2 85
   000477      1  048100             OVERFLOW PERFORM PASS                                NC2184.2 242
   000478      1  048200                      GO TO UST-WRITE-GF-2.                       NC2184.2 487
   000479         048300     GO TO UST-FAIL-GF-2.                                         NC2184.2 484
   000480         048400 UST-DELETE-GF-2.                                                 NC2184.2
   000481         048500     PERFORM DE-LETE.                                             NC2184.2 244
   000482         048600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000483         048700     GO      TO UST-INIT-GF-3.                                    NC2184.2 575
   000484         048800 UST-FAIL-GF-2.                                                   NC2184.2
   000485         048900     PERFORM FAIL.                                                NC2184.2 243
   000486         049000     MOVE    "OVERFLOW SHOULD HAVE OCCURED" TO RE-MARK.           NC2184.2 97
   000487         049100 UST-WRITE-GF-2.                                                  NC2184.2
   000488         049200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000489         049300*                                                                 NC2184.2
   000490         049400 UST-TEST-GF-2-1.                                                 NC2184.2
   000491         049500     ADD     1 TO REC-CT.                                         NC2184.2 139
   000492         049600     IF      ID4-XJ = "2"                                         NC2184.2 59
   000493      1  049700             PERFORM PASS                                         NC2184.2 242
   000494      1  049800             GO TO UST-WRITE-GF-2-1                               NC2184.2 504
   000495         049900     ELSE                                                         NC2184.2
   000496      1  050000             GO TO UST-FAIL-GF-2-1.                               NC2184.2 500
   000497         050100 UST-DELETE-GF-2-1.                                               NC2184.2
   000498         050200     PERFORM DE-LETE.                                             NC2184.2 244
   000499         050300     GO TO UST-WRITE-GF-2-1.                                      NC2184.2 504
   000500         050400 UST-FAIL-GF-2-1.                                                 NC2184.2
   000501         050500     PERFORM FAIL                                                 NC2184.2 243
   000502         050600     MOVE    ID4-XJ TO COMPUTED-A                                 NC2184.2 59 103
   000503         050700     MOVE    "2" TO CORRECT-A.                                    NC2184.2 117
   000504         050800 UST-WRITE-GF-2-1.                                                NC2184.2
   000505         050900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000506         051000*                                                                 NC2184.2
   000507         051100 UST-TEST-GF-2-2.                                                 NC2184.2
   000508         051200     ADD     1 TO REC-CT.                                         NC2184.2 139
   000509         051300     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   000510      1  051400             PERFORM PASS                                         NC2184.2 242
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000511      1  051500             GO TO UST-WRITE-GF-2-2                               NC2184.2 521
   000512         051600     ELSE                                                         NC2184.2
   000513      1  051700             GO TO UST-FAIL-GF-2-2.                               NC2184.2 517
   000514         051800 UST-DELETE-GF-2-2.                                               NC2184.2
   000515         051900     PERFORM DE-LETE.                                             NC2184.2 244
   000516         052000     GO TO UST-WRITE-GF-2-2.                                      NC2184.2 521
   000517         052100 UST-FAIL-GF-2-2.                                                 NC2184.2
   000518         052200     PERFORM FAIL                                                 NC2184.2 243
   000519         052300     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   000520         052400     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   000521         052500 UST-WRITE-GF-2-2.                                                NC2184.2
   000522         052600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000523         052700*                                                                 NC2184.2
   000524         052800 UST-TEST-GF-2-3.                                                 NC2184.2
   000525         052900     ADD     1 TO REC-CT.                                         NC2184.2 139
   000526         053000     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   000527      1  053100             PERFORM PASS                                         NC2184.2 242
   000528      1  053200             GO TO UST-WRITE-GF-2-3                               NC2184.2 538
   000529         053300     ELSE                                                         NC2184.2
   000530      1  053400             GO TO UST-FAIL-GF-2-3.                               NC2184.2 534
   000531         053500 UST-DELETE-GF-2-3.                                               NC2184.2
   000532         053600     PERFORM DE-LETE.                                             NC2184.2 244
   000533         053700     GO TO UST-WRITE-GF-2-3.                                      NC2184.2 538
   000534         053800 UST-FAIL-GF-2-3.                                                 NC2184.2
   000535         053900     PERFORM FAIL                                                 NC2184.2 243
   000536         054000     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   000537         054100     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   000538         054200 UST-WRITE-GF-2-3.                                                NC2184.2
   000539         054300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000540         054400*                                                                 NC2184.2
   000541         054500 UST-TEST-GF-2-4.                                                 NC2184.2
   000542         054600     ADD     1 TO REC-CT.                                         NC2184.2 139
   000543         054700     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   000544      1  054800             PERFORM PASS                                         NC2184.2 242
   000545      1  054900             GO TO UST-WRITE-GF-2-4                               NC2184.2 555
   000546         055000     ELSE                                                         NC2184.2
   000547      1  055100             GO TO UST-FAIL-GF-2-4.                               NC2184.2 551
   000548         055200 UST-DELETE-GF-2-4.                                               NC2184.2
   000549         055300     PERFORM DE-LETE.                                             NC2184.2 244
   000550         055400     GO TO UST-WRITE-GF-2-4.                                      NC2184.2 555
   000551         055500 UST-FAIL-GF-2-4.                                                 NC2184.2
   000552         055600     PERFORM FAIL                                                 NC2184.2 243
   000553         055700     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   000554         055800     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   000555         055900 UST-WRITE-GF-2-4.                                                NC2184.2
   000556         056000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000557         056100*                                                                 NC2184.2
   000558         056200 UST-TEST-GF-2-5.                                                 NC2184.2
   000559         056300     ADD     1 TO REC-CT.                                         NC2184.2 139
   000560         056400     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   000561      1  056500             PERFORM PASS                                         NC2184.2 242
   000562      1  056600             GO TO UST-WRITE-GF-2-5                               NC2184.2 572
   000563         056700     ELSE                                                         NC2184.2
   000564      1  056800             GO TO UST-FAIL-GF-2-5.                               NC2184.2 568
   000565         056900 UST-DELETE-GF-2-5.                                               NC2184.2
   000566         057000     PERFORM DE-LETE.                                             NC2184.2 244
   000567         057100     GO TO UST-WRITE-GF-2-5.                                      NC2184.2 572
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000568         057200 UST-FAIL-GF-2-5.                                                 NC2184.2
   000569         057300     PERFORM FAIL                                                 NC2184.2 243
   000570         057400     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   000571         057500     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   000572         057600 UST-WRITE-GF-2-5.                                                NC2184.2
   000573         057700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000574         057800*                                                                 NC2184.2
   000575         057900 UST-INIT-GF-3.                                                   NC2184.2
   000576         058000     MOVE    "UST-TEST-GF-3" TO PAR-NAME.                         NC2184.2 92
   000577         058100     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   000578         058200     MOVE    "PIC XXX" TO FEATURE.                                NC2184.2 88
   000579         058300     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   000580         058400     MOVE    ZERO TO ID4-XXX.                                     NC2184.2 IMP 60
   000581         058500     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   000582         058600     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   000583         058700     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   000584         058800     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   000585         058900     MOVE    1 TO REC-CT.                                         NC2184.2 139
   000586         059000*                                                                 NC2184.2
   000587         059100 UST-TEST-GF-3.                                                   NC2184.2
   000588         059200     UNSTRING ID1-XN-7 DELIMITED "0" INTO ID4-XXX                 NC2184.2 44 60
   000589         059300              DELIMITER ID5-XN-4                                  NC2184.2 79
   000590         059400              COUNT ID6-DU-2V0                                    NC2184.2 82
   000591         059500              POINTER ID10-DU-2V0                                 NC2184.2 84
   000592         059600              TALLYING ID11-DU-2V0.                               NC2184.2 85
   000593         059700     GO TO UST-TEST-GF-3-1.                                       NC2184.2 599
   000594         059800 UST-DELETE-GF-3.                                                 NC2184.2
   000595         059900     PERFORM DE-LETE.                                             NC2184.2 244
   000596         060000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000597         060100     GO      TO UST-INIT-GF-4.                                    NC2184.2 683
   000598         060200*                                                                 NC2184.2
   000599         060300 UST-TEST-GF-3-1.                                                 NC2184.2
   000600         060400     IF      ID4-XXX = "12  "                                     NC2184.2 60
   000601      1  060500             PERFORM PASS                                         NC2184.2 242
   000602      1  060600             GO TO UST-WRITE-GF-3-1                               NC2184.2 612
   000603         060700     ELSE                                                         NC2184.2
   000604      1  060800             GO TO UST-FAIL-GF-3-1.                               NC2184.2 608
   000605         060900 UST-DELETE-GF-3-1.                                               NC2184.2
   000606         061000     PERFORM DE-LETE.                                             NC2184.2 244
   000607         061100     GO TO UST-WRITE-GF-3-1.                                      NC2184.2 612
   000608         061200 UST-FAIL-GF-3-1.                                                 NC2184.2
   000609         061300     PERFORM FAIL                                                 NC2184.2 243
   000610         061400     MOVE    ID4-XXX TO COMPUTED-A                                NC2184.2 60 103
   000611         061500     MOVE    "12  " TO CORRECT-A.                                 NC2184.2 117
   000612         061600 UST-WRITE-GF-3-1.                                                NC2184.2
   000613         061700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000614         061800*                                                                 NC2184.2
   000615         061900 UST-TEST-GF-3-2.                                                 NC2184.2
   000616         062000     ADD     1 TO REC-CT.                                         NC2184.2 139
   000617         062100     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   000618      1  062200             PERFORM PASS                                         NC2184.2 242
   000619      1  062300             GO TO UST-WRITE-GF-3-2                               NC2184.2 629
   000620         062400     ELSE                                                         NC2184.2
   000621      1  062500             GO TO UST-FAIL-GF-3-2.                               NC2184.2 625
   000622         062600 UST-DELETE-GF-3-2.                                               NC2184.2
   000623         062700     PERFORM DE-LETE.                                             NC2184.2 244
   000624         062800     GO TO UST-WRITE-GF-3-2.                                      NC2184.2 629
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000625         062900 UST-FAIL-GF-3-2.                                                 NC2184.2
   000626         063000     PERFORM FAIL                                                 NC2184.2 243
   000627         063100     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   000628         063200     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   000629         063300 UST-WRITE-GF-3-2.                                                NC2184.2
   000630         063400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000631         063500*                                                                 NC2184.2
   000632         063600 UST-TEST-GF-3-3.                                                 NC2184.2
   000633         063700     ADD     1 TO REC-CT.                                         NC2184.2 139
   000634         063800     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   000635      1  063900             PERFORM PASS                                         NC2184.2 242
   000636      1  064000             GO TO UST-WRITE-GF-3-3                               NC2184.2 646
   000637         064100     ELSE                                                         NC2184.2
   000638      1  064200             GO TO UST-FAIL-GF-3-3.                               NC2184.2 642
   000639         064300 UST-DELETE-GF-3-3.                                               NC2184.2
   000640         064400     PERFORM DE-LETE.                                             NC2184.2 244
   000641         064500     GO TO UST-WRITE-GF-3-3.                                      NC2184.2 646
   000642         064600 UST-FAIL-GF-3-3.                                                 NC2184.2
   000643         064700     PERFORM FAIL                                                 NC2184.2 243
   000644         064800     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   000645         064900     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   000646         065000 UST-WRITE-GF-3-3.                                                NC2184.2
   000647         065100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000648         065200*                                                                 NC2184.2
   000649         065300 UST-TEST-GF-3-4.                                                 NC2184.2
   000650         065400     ADD     1 TO REC-CT.                                         NC2184.2 139
   000651         065500     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   000652      1  065600             PERFORM PASS                                         NC2184.2 242
   000653      1  065700             GO TO UST-WRITE-GF-3-4                               NC2184.2 663
   000654         065800     ELSE                                                         NC2184.2
   000655      1  065900             GO TO UST-FAIL-GF-3-4.                               NC2184.2 659
   000656         066000 UST-DELETE-GF-3-4.                                               NC2184.2
   000657         066100     PERFORM DE-LETE.                                             NC2184.2 244
   000658         066200     GO TO UST-WRITE-GF-3-4.                                      NC2184.2 663
   000659         066300 UST-FAIL-GF-3-4.                                                 NC2184.2
   000660         066400     PERFORM FAIL                                                 NC2184.2 243
   000661         066500     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   000662         066600     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   000663         066700 UST-WRITE-GF-3-4.                                                NC2184.2
   000664         066800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000665         066900*                                                                 NC2184.2
   000666         067000 UST-TEST-GF-3-5.                                                 NC2184.2
   000667         067100     ADD     1 TO REC-CT.                                         NC2184.2 139
   000668         067200     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   000669      1  067300             PERFORM PASS                                         NC2184.2 242
   000670      1  067400             GO TO UST-WRITE-GF-3-5                               NC2184.2 680
   000671         067500     ELSE                                                         NC2184.2
   000672      1  067600             GO TO UST-FAIL-GF-3-5.                               NC2184.2 676
   000673         067700 UST-DELETE-GF-3-5.                                               NC2184.2
   000674         067800     PERFORM DE-LETE.                                             NC2184.2 244
   000675         067900     GO TO UST-WRITE-GF-3-5.                                      NC2184.2 680
   000676         068000 UST-FAIL-GF-3-5.                                                 NC2184.2
   000677         068100     PERFORM FAIL                                                 NC2184.2 243
   000678         068200     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   000679         068300     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   000680         068400 UST-WRITE-GF-3-5.                                                NC2184.2
   000681         068500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000682         068600*                                                                 NC2184.2
   000683         068700 UST-INIT-GF-4.                                                   NC2184.2
   000684         068800     MOVE    "UST-TEST-GF-4" TO PAR-NAME.                         NC2184.2 92
   000685         068900     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   000686         069000     MOVE    "PIC XXX JUST" TO FEATURE.                           NC2184.2 88
   000687         069100     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   000688         069200     MOVE    "0" TO ZERO-XN-1.                                    NC2184.2 42
   000689         069300     MOVE    ZERO TO ID4-XXXJ.                                    NC2184.2 IMP 61
   000690         069400     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   000691         069500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   000692         069600     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   000693         069700     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   000694         069800     MOVE    1 TO REC-CT.                                         NC2184.2 139
   000695         069900*                                                                 NC2184.2
   000696         070000 UST-TEST-GF-4.                                                   NC2184.2
   000697         070100     UNSTRING ID1-XN-7 DELIMITED BY ZERO-XN-1 INTO ID4-XXXJ       NC2184.2 44 42 61
   000698         070200              DELIMITER ID5-XN-4                                  NC2184.2 79
   000699         070300              COUNT IN ID6-DU-2V0                                 NC2184.2 82
   000700         070400              POINTER ID10-DU-2V0                                 NC2184.2 84
   000701         070500              TALLYING IN ID11-DU-2V0.                            NC2184.2 85
   000702         070600     GO TO UST-TEST-GF-4-1.                                       NC2184.2 708
   000703         070700 UST-DELETE-GF-4.                                                 NC2184.2
   000704         070800     PERFORM DE-LETE.                                             NC2184.2 244
   000705         070900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000706         071000     GO      TO UST-INIT-GF-5.                                    NC2184.2 792
   000707         071100*                                                                 NC2184.2
   000708         071200 UST-TEST-GF-4-1.                                                 NC2184.2
   000709         071300     IF      ID4-XXXJ = " 12"                                     NC2184.2 61
   000710      1  071400             PERFORM PASS                                         NC2184.2 242
   000711      1  071500             GO TO UST-WRITE-GF-4-1                               NC2184.2 721
   000712         071600     ELSE                                                         NC2184.2
   000713      1  071700             GO TO UST-FAIL-GF-4-1.                               NC2184.2 717
   000714         071800 UST-DELETE-GF-4-1.                                               NC2184.2
   000715         071900     PERFORM DE-LETE.                                             NC2184.2 244
   000716         072000     GO TO UST-WRITE-GF-4-1.                                      NC2184.2 721
   000717         072100 UST-FAIL-GF-4-1.                                                 NC2184.2
   000718         072200     PERFORM FAIL                                                 NC2184.2 243
   000719         072300     MOVE    ID4-XXXJ TO COMPUTED-A                               NC2184.2 61 103
   000720         072400     MOVE    " 12" TO CORRECT-A.                                  NC2184.2 117
   000721         072500 UST-WRITE-GF-4-1.                                                NC2184.2
   000722         072600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000723         072700*                                                                 NC2184.2
   000724         072800 UST-TEST-GF-4-2.                                                 NC2184.2
   000725         072900     ADD     1 TO REC-CT.                                         NC2184.2 139
   000726         073000     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   000727      1  073100             PERFORM PASS                                         NC2184.2 242
   000728      1  073200             GO TO UST-WRITE-GF-4-2                               NC2184.2 738
   000729         073300     ELSE                                                         NC2184.2
   000730      1  073400             GO TO UST-FAIL-GF-4-2.                               NC2184.2 734
   000731         073500 UST-DELETE-GF-4-2.                                               NC2184.2
   000732         073600     PERFORM DE-LETE.                                             NC2184.2 244
   000733         073700     GO TO UST-WRITE-GF-4-2.                                      NC2184.2 738
   000734         073800 UST-FAIL-GF-4-2.                                                 NC2184.2
   000735         073900     PERFORM FAIL                                                 NC2184.2 243
   000736         074000     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   000737         074100     MOVE "0   " TO CORRECT-A.                                    NC2184.2 117
   000738         074200 UST-WRITE-GF-4-2.                                                NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000739         074300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000740         074400*                                                                 NC2184.2
   000741         074500 UST-TEST-GF-4-3.                                                 NC2184.2
   000742         074600     ADD     1 TO REC-CT.                                         NC2184.2 139
   000743         074700     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   000744      1  074800             PERFORM PASS                                         NC2184.2 242
   000745      1  074900             GO TO UST-WRITE-GF-4-3                               NC2184.2 755
   000746         075000     ELSE                                                         NC2184.2
   000747      1  075100             GO TO UST-FAIL-GF-4-3.                               NC2184.2 751
   000748         075200 UST-DELETE-GF-4-3.                                               NC2184.2
   000749         075300     PERFORM DE-LETE.                                             NC2184.2 244
   000750         075400     GO TO UST-WRITE-GF-4-3.                                      NC2184.2 755
   000751         075500 UST-FAIL-GF-4-3.                                                 NC2184.2
   000752         075600     PERFORM FAIL                                                 NC2184.2 243
   000753         075700     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   000754         075800     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   000755         075900 UST-WRITE-GF-4-3.                                                NC2184.2
   000756         076000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000757         076100*                                                                 NC2184.2
   000758         076200 UST-TEST-GF-4-4.                                                 NC2184.2
   000759         076300     ADD     1 TO REC-CT.                                         NC2184.2 139
   000760         076400     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   000761      1  076500             PERFORM PASS                                         NC2184.2 242
   000762      1  076600             GO TO UST-WRITE-GF-4-4                               NC2184.2 772
   000763         076700     ELSE                                                         NC2184.2
   000764      1  076800             GO TO UST-FAIL-GF-4-4.                               NC2184.2 768
   000765         076900 UST-DELETE-GF-4-4.                                               NC2184.2
   000766         077000     PERFORM DE-LETE.                                             NC2184.2 244
   000767         077100     GO TO UST-WRITE-GF-4-4.                                      NC2184.2 772
   000768         077200 UST-FAIL-GF-4-4.                                                 NC2184.2
   000769         077300     PERFORM FAIL                                                 NC2184.2 243
   000770         077400     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   000771         077500     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   000772         077600 UST-WRITE-GF-4-4.                                                NC2184.2
   000773         077700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000774         077800*                                                                 NC2184.2
   000775         077900 UST-TEST-GF-4-5.                                                 NC2184.2
   000776         078000     ADD     1 TO REC-CT.                                         NC2184.2 139
   000777         078100     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   000778      1  078200             PERFORM PASS                                         NC2184.2 242
   000779      1  078300             GO TO UST-WRITE-GF-4-5                               NC2184.2 789
   000780         078400     ELSE                                                         NC2184.2
   000781      1  078500             GO TO UST-FAIL-GF-4-5.                               NC2184.2 785
   000782         078600 UST-DELETE-GF-4-5.                                               NC2184.2
   000783         078700     PERFORM DE-LETE.                                             NC2184.2 244
   000784         078800     GO TO UST-WRITE-GF-4-5.                                      NC2184.2 789
   000785         078900 UST-FAIL-GF-4-5.                                                 NC2184.2
   000786         079000     PERFORM FAIL                                                 NC2184.2 243
   000787         079100     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   000788         079200     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   000789         079300 UST-WRITE-GF-4-5.                                                NC2184.2
   000790         079400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000791         079500*                                                                 NC2184.2
   000792         079600 UST-INIT-GF-5.                                                   NC2184.2
   000793         079700     MOVE    "UST-TEST-GF-5" TO PAR-NAME.                         NC2184.2 92
   000794         079800     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   000795         079900     MOVE    "PIC 9" TO FEATURE.                                  NC2184.2 88
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000796         080000     MOVE    ZERO TO ID4-DU-1V0.                                  NC2184.2 IMP 62
   000797         080100     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   000798         080200     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   000799         080300     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   000800         080400     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   000801         080500     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   000802         080600     MOVE    1 TO REC-CT.                                         NC2184.2 139
   000803         080700*                                                                 NC2184.2
   000804         080800 UST-TEST-GF-5.                                                   NC2184.2
   000805         080900     UNSTRING ID1-XN-7 DELIMITED "0" INTO ID4-DU-1V0              NC2184.2 44 62
   000806         081000              DELIMITER IN ID5-XN-4                               NC2184.2 79
   000807         081100              COUNT ID6-DU-2V0                                    NC2184.2 82
   000808         081200              WITH POINTER ID10-DU-2V0                            NC2184.2 84
   000809         081300              TALLYING ID11-DU-2V0.                               NC2184.2 85
   000810         081400     GO TO UST-TEST-GF-5-1.                                       NC2184.2 816
   000811         081500 UST-DELETE-GF-5.                                                 NC2184.2
   000812         081600     PERFORM DE-LETE.                                             NC2184.2 244
   000813         081700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000814         081800     GO      TO UST-INIT-GF-6.                                    NC2184.2 900
   000815         081900*                                                                 NC2184.2
   000816         082000 UST-TEST-GF-5-1.                                                 NC2184.2
   000817         082100     IF      ID4-DU-1V0 = 2                                       NC2184.2 62
   000818      1  082200             PERFORM PASS                                         NC2184.2 242
   000819      1  082300             GO TO UST-WRITE-GF-5-1                               NC2184.2 829
   000820         082400     ELSE                                                         NC2184.2
   000821      1  082500             GO TO UST-FAIL-GF-5-1.                               NC2184.2 825
   000822         082600 UST-DELETE-GF-5-1.                                               NC2184.2
   000823         082700     PERFORM DE-LETE.                                             NC2184.2 244
   000824         082800     GO TO UST-WRITE-GF-5-1.                                      NC2184.2 829
   000825         082900 UST-FAIL-GF-5-1.                                                 NC2184.2
   000826         083000     PERFORM FAIL                                                 NC2184.2 243
   000827         083100     MOVE    ID4-DU-1V0 TO COMPUTED-N                             NC2184.2 62 104
   000828         083200     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   000829         083300 UST-WRITE-GF-5-1.                                                NC2184.2
   000830         083400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000831         083500*                                                                 NC2184.2
   000832         083600 UST-TEST-GF-5-2.                                                 NC2184.2
   000833         083700     ADD     1 TO REC-CT.                                         NC2184.2 139
   000834         083800     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   000835      1  083900             PERFORM PASS                                         NC2184.2 242
   000836      1  084000             GO TO UST-WRITE-GF-5-2                               NC2184.2 846
   000837         084100     ELSE                                                         NC2184.2
   000838      1  084200             GO TO UST-FAIL-GF-5-2.                               NC2184.2 842
   000839         084300 UST-DELETE-GF-5-2.                                               NC2184.2
   000840         084400     PERFORM DE-LETE.                                             NC2184.2 244
   000841         084500     GO TO UST-WRITE-GF-5-2.                                      NC2184.2 846
   000842         084600 UST-FAIL-GF-5-2.                                                 NC2184.2
   000843         084700     PERFORM FAIL                                                 NC2184.2 243
   000844         084800     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   000845         084900     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   000846         085000 UST-WRITE-GF-5-2.                                                NC2184.2
   000847         085100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000848         085200*                                                                 NC2184.2
   000849         085300 UST-TEST-GF-5-3.                                                 NC2184.2
   000850         085400     ADD     1 TO REC-CT.                                         NC2184.2 139
   000851         085500     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   000852      1  085600             PERFORM PASS                                         NC2184.2 242
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000853      1  085700             GO TO UST-WRITE-GF-5-3                               NC2184.2 863
   000854         085800     ELSE                                                         NC2184.2
   000855      1  085900             GO TO UST-FAIL-GF-5-3.                               NC2184.2 859
   000856         086000 UST-DELETE-GF-5-3.                                               NC2184.2
   000857         086100     PERFORM DE-LETE.                                             NC2184.2 244
   000858         086200     GO TO UST-WRITE-GF-5-3.                                      NC2184.2 863
   000859         086300 UST-FAIL-GF-5-3.                                                 NC2184.2
   000860         086400     PERFORM FAIL                                                 NC2184.2 243
   000861         086500     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   000862         086600     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   000863         086700 UST-WRITE-GF-5-3.                                                NC2184.2
   000864         086800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000865         086900*                                                                 NC2184.2
   000866         087000 UST-TEST-GF-5-4.                                                 NC2184.2
   000867         087100     ADD     1 TO REC-CT.                                         NC2184.2 139
   000868         087200     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   000869      1  087300             PERFORM PASS                                         NC2184.2 242
   000870      1  087400             GO TO UST-WRITE-GF-5-4                               NC2184.2 880
   000871         087500     ELSE                                                         NC2184.2
   000872      1  087600             GO TO UST-FAIL-GF-5-4.                               NC2184.2 876
   000873         087700 UST-DELETE-GF-5-4.                                               NC2184.2
   000874         087800     PERFORM DE-LETE.                                             NC2184.2 244
   000875         087900     GO TO UST-WRITE-GF-5-4.                                      NC2184.2 880
   000876         088000 UST-FAIL-GF-5-4.                                                 NC2184.2
   000877         088100     PERFORM FAIL                                                 NC2184.2 243
   000878         088200     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   000879         088300     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   000880         088400 UST-WRITE-GF-5-4.                                                NC2184.2
   000881         088500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000882         088600*                                                                 NC2184.2
   000883         088700 UST-TEST-GF-5-5.                                                 NC2184.2
   000884         088800     ADD     1 TO REC-CT.                                         NC2184.2 139
   000885         088900     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   000886      1  089000             PERFORM PASS                                         NC2184.2 242
   000887      1  089100             GO TO UST-WRITE-GF-5-5                               NC2184.2 897
   000888         089200     ELSE                                                         NC2184.2
   000889      1  089300             GO TO UST-FAIL-GF-5-5.                               NC2184.2 893
   000890         089400 UST-DELETE-GF-5-5.                                               NC2184.2
   000891         089500     PERFORM DE-LETE.                                             NC2184.2 244
   000892         089600     GO TO UST-WRITE-GF-5-5.                                      NC2184.2 897
   000893         089700 UST-FAIL-GF-5-5.                                                 NC2184.2
   000894         089800     PERFORM FAIL                                                 NC2184.2 243
   000895         089900     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   000896         090000     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   000897         090100 UST-WRITE-GF-5-5.                                                NC2184.2
   000898         090200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000899         090300*                                                                 NC2184.2
   000900         090400 UST-INIT-GF-6.                                                   NC2184.2
   000901         090500     MOVE    "UST-TEST-GF-6" TO PAR-NAME.                         NC2184.2 92
   000902         090600     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   000903         090700     MOVE    "PIC S9" TO FEATURE.                                 NC2184.2 88
   000904         090800     MOVE    ZERO TO ID4-DS-1V0.                                  NC2184.2 IMP 63
   000905         090900     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   000906         091000     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   000907         091100     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   000908         091200     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   000909         091300     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000910         091400     MOVE    1 TO REC-CT.                                         NC2184.2 139
   000911         091500*                                                                 NC2184.2
   000912         091600 UST-TEST-GF-6.                                                   NC2184.2
   000913         091700     UNSTRING ID1-XN-7 DELIMITED BY ALL ZERO INTO ID4-DS-1V0      NC2184.2 44 IMP 63
   000914         091800              DELIMITER ID5-XN-4                                  NC2184.2 79
   000915         091900              COUNT ID6-DU-2V0                                    NC2184.2 82
   000916         092000              POINTER ID10-DU-2V0                                 NC2184.2 84
   000917         092100              TALLYING ID11-DU-2V0.                               NC2184.2 85
   000918         092200     GO TO UST-TEST-GF-6-1.                                       NC2184.2 924
   000919         092300 UST-DELETE-GF-6.                                                 NC2184.2
   000920         092400     PERFORM DE-LETE.                                             NC2184.2 244
   000921         092500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000922         092600     GO      TO UST-INIT-GF-7.                                    NC2184.2 1008
   000923         092700*                                                                 NC2184.2
   000924         092800 UST-TEST-GF-6-1.                                                 NC2184.2
   000925         092900     IF      ID4-DS-1V0 = +2                                      NC2184.2 63
   000926      1  093000             PERFORM PASS                                         NC2184.2 242
   000927      1  093100             GO TO UST-WRITE-GF-6-1                               NC2184.2 937
   000928         093200     ELSE                                                         NC2184.2
   000929      1  093300             GO TO UST-FAIL-GF-6-1.                               NC2184.2 933
   000930         093400 UST-DELETE-GF-6-1.                                               NC2184.2
   000931         093500     PERFORM DE-LETE.                                             NC2184.2 244
   000932         093600     GO TO UST-WRITE-GF-6-1.                                      NC2184.2 937
   000933         093700 UST-FAIL-GF-6-1.                                                 NC2184.2
   000934         093800     PERFORM FAIL                                                 NC2184.2 243
   000935         093900     MOVE    ID4-DS-1V0 TO COMPUTED-N                             NC2184.2 63 104
   000936         094000     MOVE    +2 TO CORRECT-N.                                     NC2184.2 118
   000937         094100 UST-WRITE-GF-6-1.                                                NC2184.2
   000938         094200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000939         094300*                                                                 NC2184.2
   000940         094400 UST-TEST-GF-6-2.                                                 NC2184.2
   000941         094500     ADD     1 TO REC-CT.                                         NC2184.2 139
   000942         094600     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   000943      1  094700             PERFORM PASS                                         NC2184.2 242
   000944      1  094800             GO TO UST-WRITE-GF-6-2                               NC2184.2 954
   000945         094900     ELSE                                                         NC2184.2
   000946      1  095000             GO TO UST-FAIL-GF-6-2.                               NC2184.2 950
   000947         095100 UST-DELETE-GF-6-2.                                               NC2184.2
   000948         095200     PERFORM DE-LETE.                                             NC2184.2 244
   000949         095300     GO TO UST-WRITE-GF-6-2.                                      NC2184.2 954
   000950         095400 UST-FAIL-GF-6-2.                                                 NC2184.2
   000951         095500     PERFORM FAIL                                                 NC2184.2 243
   000952         095600     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   000953         095700     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   000954         095800 UST-WRITE-GF-6-2.                                                NC2184.2
   000955         095900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000956         096000*                                                                 NC2184.2
   000957         096100 UST-TEST-GF-6-3.                                                 NC2184.2
   000958         096200     ADD     1 TO REC-CT.                                         NC2184.2 139
   000959         096300     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   000960      1  096400             PERFORM PASS                                         NC2184.2 242
   000961      1  096500             GO TO UST-WRITE-GF-6-3                               NC2184.2 971
   000962         096600     ELSE                                                         NC2184.2
   000963      1  096700             GO TO UST-FAIL-GF-6-3.                               NC2184.2 967
   000964         096800 UST-DELETE-GF-6-3.                                               NC2184.2
   000965         096900     PERFORM DE-LETE.                                             NC2184.2 244
   000966         097000     GO TO UST-WRITE-GF-6-3.                                      NC2184.2 971
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000967         097100 UST-FAIL-GF-6-3.                                                 NC2184.2
   000968         097200     PERFORM FAIL                                                 NC2184.2 243
   000969         097300     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   000970         097400     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   000971         097500 UST-WRITE-GF-6-3.                                                NC2184.2
   000972         097600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000973         097700*                                                                 NC2184.2
   000974         097800 UST-TEST-GF-6-4.                                                 NC2184.2
   000975         097900     ADD     1 TO REC-CT.                                         NC2184.2 139
   000976         098000     IF      ID10-DU-2V0 = 8                                      NC2184.2 84
   000977      1  098100             PERFORM PASS                                         NC2184.2 242
   000978      1  098200             GO TO UST-WRITE-GF-6-4                               NC2184.2 988
   000979         098300     ELSE                                                         NC2184.2
   000980      1  098400             GO TO UST-FAIL-GF-6-4.                               NC2184.2 984
   000981         098500 UST-DELETE-GF-6-4.                                               NC2184.2
   000982         098600     PERFORM DE-LETE.                                             NC2184.2 244
   000983         098700     GO TO UST-WRITE-GF-6-4.                                      NC2184.2 988
   000984         098800 UST-FAIL-GF-6-4.                                                 NC2184.2
   000985         098900     PERFORM FAIL                                                 NC2184.2 243
   000986         099000     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   000987         099100     MOVE    8 TO CORRECT-N.                                      NC2184.2 118
   000988         099200 UST-WRITE-GF-6-4.                                                NC2184.2
   000989         099300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   000990         099400*                                                                 NC2184.2
   000991         099500 UST-TEST-GF-6-5.                                                 NC2184.2
   000992         099600     ADD     1 TO REC-CT.                                         NC2184.2 139
   000993         099700     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   000994      1  099800             PERFORM PASS                                         NC2184.2 242
   000995      1  099900             GO TO UST-WRITE-GF-6-5                               NC2184.2 1005
   000996         100000     ELSE                                                         NC2184.2
   000997      1  100100             GO TO UST-FAIL-GF-6-5.                               NC2184.2 1001
   000998         100200 UST-DELETE-GF-6-5.                                               NC2184.2
   000999         100300     PERFORM DE-LETE.                                             NC2184.2 244
   001000         100400     GO TO UST-WRITE-GF-6-5.                                      NC2184.2 1005
   001001         100500 UST-FAIL-GF-6-5.                                                 NC2184.2
   001002         100600     PERFORM FAIL                                                 NC2184.2 243
   001003         100700     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   001004         100800     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   001005         100900 UST-WRITE-GF-6-5.                                                NC2184.2
   001006         101000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001007         101100*                                                                 NC2184.2
   001008         101200 UST-INIT-GF-7.                                                   NC2184.2
   001009         101300     MOVE    "UST-TEST-GF-7" TO PAR-NAME.                         NC2184.2 92
   001010         101400     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001011         101500     MOVE    "PIC 99" TO FEATURE.                                 NC2184.2 88
   001012         101600     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   001013         101700     MOVE    ZERO TO ID4-DU-2V0.                                  NC2184.2 IMP 64
   001014         101800     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001015         101900     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001016         102000     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001017         102100     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001018         102200     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001019         102300*                                                                 NC2184.2
   001020         102400 UST-TEST-GF-7.                                                   NC2184.2
   001021         102500     UNSTRING ID1-XN-7 DELIMITED ALL "0" INTO ID4-DU-2V0          NC2184.2 44 64
   001022         102600             DELIMITER ID5-XN-4                                   NC2184.2 79
   001023         102700             COUNT ID6-DU-2V0                                     NC2184.2 82
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001024         102800             POINTER ID10-DU-2V0                                  NC2184.2 84
   001025         102900             TALLYING ID11-DU-2V0.                                NC2184.2 85
   001026         103000     GO      TO UST-TEST-GF-7-1.                                  NC2184.2 1032
   001027         103100 UST-DELETE-GF-7.                                                 NC2184.2
   001028         103200     PERFORM DE-LETE.                                             NC2184.2 244
   001029         103300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001030         103400     GO      TO UST-INIT-GF-8.                                    NC2184.2 1116
   001031         103500*                                                                 NC2184.2
   001032         103600 UST-TEST-GF-7-1.                                                 NC2184.2
   001033         103700     IF      ID4-DU-2V0 = 12                                      NC2184.2 64
   001034      1  103800             PERFORM PASS                                         NC2184.2 242
   001035      1  103900             GO TO UST-WRITE-GF-7-1                               NC2184.2 1045
   001036         104000     ELSE                                                         NC2184.2
   001037      1  104100             GO TO UST-FAIL-GF-7-1.                               NC2184.2 1041
   001038         104200 UST-DELETE-GF-7-1.                                               NC2184.2
   001039         104300     PERFORM DE-LETE.                                             NC2184.2 244
   001040         104400     GO TO UST-WRITE-GF-7-1.                                      NC2184.2 1045
   001041         104500 UST-FAIL-GF-7-1.                                                 NC2184.2
   001042         104600     PERFORM FAIL                                                 NC2184.2 243
   001043         104700     MOVE    ID4-DU-2V0 TO COMPUTED-N                             NC2184.2 64 104
   001044         104800     MOVE    12 TO CORRECT-N.                                     NC2184.2 118
   001045         104900 UST-WRITE-GF-7-1.                                                NC2184.2
   001046         105000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001047         105100*                                                                 NC2184.2
   001048         105200 UST-TEST-GF-7-2.                                                 NC2184.2
   001049         105300     ADD     1 TO REC-CT.                                         NC2184.2 139
   001050         105400     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   001051      1  105500             PERFORM PASS                                         NC2184.2 242
   001052      1  105600             GO TO UST-WRITE-GF-7-2                               NC2184.2 1062
   001053         105700     ELSE                                                         NC2184.2
   001054      1  105800             GO TO UST-FAIL-GF-7-2.                               NC2184.2 1058
   001055         105900 UST-DELETE-GF-7-2.                                               NC2184.2
   001056         106000     PERFORM DE-LETE.                                             NC2184.2 244
   001057         106100     GO TO UST-WRITE-GF-7-2.                                      NC2184.2 1062
   001058         106200 UST-FAIL-GF-7-2.                                                 NC2184.2
   001059         106300     PERFORM FAIL                                                 NC2184.2 243
   001060         106400     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   001061         106500     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   001062         106600 UST-WRITE-GF-7-2.                                                NC2184.2
   001063         106700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001064         106800*                                                                 NC2184.2
   001065         106900 UST-TEST-GF-7-3.                                                 NC2184.2
   001066         107000     ADD     1 TO REC-CT.                                         NC2184.2 139
   001067         107100     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   001068      1  107200             PERFORM PASS                                         NC2184.2 242
   001069      1  107300             GO TO UST-WRITE-GF-7-3                               NC2184.2 1079
   001070         107400     ELSE                                                         NC2184.2
   001071      1  107500             GO TO UST-FAIL-GF-7-3.                               NC2184.2 1075
   001072         107600 UST-DELETE-GF-7-3.                                               NC2184.2
   001073         107700     PERFORM DE-LETE.                                             NC2184.2 244
   001074         107800     GO TO UST-WRITE-GF-7-3.                                      NC2184.2 1079
   001075         107900 UST-FAIL-GF-7-3.                                                 NC2184.2
   001076         108000     PERFORM FAIL                                                 NC2184.2 243
   001077         108100     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   001078         108200     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   001079         108300 UST-WRITE-GF-7-3.                                                NC2184.2
   001080         108400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001081         108500*                                                                 NC2184.2
   001082         108600 UST-TEST-GF-7-4.                                                 NC2184.2
   001083         108700     ADD     1 TO REC-CT.                                         NC2184.2 139
   001084         108800     IF      ID10-DU-2V0 = 8                                      NC2184.2 84
   001085      1  108900             PERFORM PASS                                         NC2184.2 242
   001086      1  109000             GO TO UST-WRITE-GF-7-4                               NC2184.2 1096
   001087         109100     ELSE                                                         NC2184.2
   001088      1  109200             GO TO UST-FAIL-GF-7-4.                               NC2184.2 1092
   001089         109300 UST-DELETE-GF-7-4.                                               NC2184.2
   001090         109400     PERFORM DE-LETE.                                             NC2184.2 244
   001091         109500     GO TO UST-WRITE-GF-7-4.                                      NC2184.2 1096
   001092         109600 UST-FAIL-GF-7-4.                                                 NC2184.2
   001093         109700     PERFORM FAIL                                                 NC2184.2 243
   001094         109800     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   001095         109900     MOVE    8 TO CORRECT-N.                                      NC2184.2 118
   001096         110000 UST-WRITE-GF-7-4.                                                NC2184.2
   001097         110100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001098         110200*                                                                 NC2184.2
   001099         110300 UST-TEST-GF-7-5.                                                 NC2184.2
   001100         110400     ADD     1 TO REC-CT.                                         NC2184.2 139
   001101         110500     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   001102      1  110600             PERFORM PASS                                         NC2184.2 242
   001103      1  110700             GO TO UST-WRITE-GF-7-5                               NC2184.2 1113
   001104         110800     ELSE                                                         NC2184.2
   001105      1  110900             GO TO UST-FAIL-GF-7-5.                               NC2184.2 1109
   001106         111000 UST-DELETE-GF-7-5.                                               NC2184.2
   001107         111100     PERFORM DE-LETE.                                             NC2184.2 244
   001108         111200     GO TO UST-WRITE-GF-7-5.                                      NC2184.2 1113
   001109         111300 UST-FAIL-GF-7-5.                                                 NC2184.2
   001110         111400     PERFORM FAIL                                                 NC2184.2 243
   001111         111500     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   001112         111600     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   001113         111700 UST-WRITE-GF-7-5.                                                NC2184.2
   001114         111800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001115         111900*                                                                 NC2184.2
   001116         112000 UST-INIT-GF-8.                                                   NC2184.2
   001117         112100     MOVE    "UST-TEST-GF-8" TO PAR-NAME.                         NC2184.2 92
   001118         112200     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001119         112300     MOVE    "PIC S99" TO FEATURE.                                NC2184.2 88
   001120         112400     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   001121         112500     MOVE    ZERO TO ID4-DS-2V0.                                  NC2184.2 IMP 65
   001122         112600     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001123         112700     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001124         112800     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001125         112900     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001126         113000     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001127         113100*                                                                 NC2184.2
   001128         113200 UST-TEST-GF-8.                                                   NC2184.2
   001129         113300     UNSTRING ID1-XN-7 DELIMITED ZERO-XN-1 INTO ID4-DS-2V0        NC2184.2 44 42 65
   001130         113400             DELIMITER ID5-XN-4                                   NC2184.2 79
   001131         113500             COUNT ID6-DU-2V0                                     NC2184.2 82
   001132         113600             POINTER ID10-DU-2V0                                  NC2184.2 84
   001133         113700             TALLYING IN ID11-DU-2V0.                             NC2184.2 85
   001134         113800     GO TO UST-TEST-GF-8-1.                                       NC2184.2 1140
   001135         113900 UST-DELETE-GF-8.                                                 NC2184.2
   001136         114000     PERFORM DE-LETE.                                             NC2184.2 244
   001137         114100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001138         114200     GO      TO UST-INIT-GF-9.                                    NC2184.2 1224
   001139         114300*                                                                 NC2184.2
   001140         114400 UST-TEST-GF-8-1.                                                 NC2184.2
   001141         114500     IF      ID4-DS-2V0 = +12                                     NC2184.2 65
   001142      1  114600             PERFORM PASS                                         NC2184.2 242
   001143      1  114700             GO TO UST-WRITE-GF-8-1                               NC2184.2 1153
   001144         114800     ELSE                                                         NC2184.2
   001145      1  114900             GO TO UST-FAIL-GF-8-1.                               NC2184.2 1149
   001146         115000 UST-DELETE-GF-8-1.                                               NC2184.2
   001147         115100     PERFORM DE-LETE.                                             NC2184.2 244
   001148         115200     GO TO UST-WRITE-GF-8-1.                                      NC2184.2 1153
   001149         115300 UST-FAIL-GF-8-1.                                                 NC2184.2
   001150         115400     PERFORM FAIL                                                 NC2184.2 243
   001151         115500     MOVE    ID4-DS-2V0 TO COMPUTED-N                             NC2184.2 65 104
   001152         115600     MOVE    +12 TO CORRECT-N.                                    NC2184.2 118
   001153         115700 UST-WRITE-GF-8-1.                                                NC2184.2
   001154         115800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001155         115900*                                                                 NC2184.2
   001156         116000 UST-TEST-GF-8-2.                                                 NC2184.2
   001157         116100     ADD     1 TO REC-CT.                                         NC2184.2 139
   001158         116200     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   001159      1  116300             PERFORM PASS                                         NC2184.2 242
   001160      1  116400             GO TO UST-WRITE-GF-8-2                               NC2184.2 1170
   001161         116500     ELSE                                                         NC2184.2
   001162      1  116600             GO TO UST-FAIL-GF-8-2.                               NC2184.2 1166
   001163         116700 UST-DELETE-GF-8-2.                                               NC2184.2
   001164         116800     PERFORM DE-LETE.                                             NC2184.2 244
   001165         116900     GO TO UST-WRITE-GF-8-2.                                      NC2184.2 1170
   001166         117000 UST-FAIL-GF-8-2.                                                 NC2184.2
   001167         117100     PERFORM FAIL                                                 NC2184.2 243
   001168         117200     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   001169         117300     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   001170         117400 UST-WRITE-GF-8-2.                                                NC2184.2
   001171         117500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001172         117600*                                                                 NC2184.2
   001173         117700 UST-TEST-GF-8-3.                                                 NC2184.2
   001174         117800     ADD     1 TO REC-CT.                                         NC2184.2 139
   001175         117900     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   001176      1  118000             PERFORM PASS                                         NC2184.2 242
   001177      1  118100             GO TO UST-WRITE-GF-8-3                               NC2184.2 1187
   001178         118200     ELSE                                                         NC2184.2
   001179      1  118300             GO TO UST-FAIL-GF-8-3.                               NC2184.2 1183
   001180         118400 UST-DELETE-GF-8-3.                                               NC2184.2
   001181         118500     PERFORM DE-LETE.                                             NC2184.2 244
   001182         118600     GO TO UST-WRITE-GF-8-3.                                      NC2184.2 1187
   001183         118700 UST-FAIL-GF-8-3.                                                 NC2184.2
   001184         118800     PERFORM FAIL                                                 NC2184.2 243
   001185         118900     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   001186         119000     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   001187         119100 UST-WRITE-GF-8-3.                                                NC2184.2
   001188         119200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001189         119300*                                                                 NC2184.2
   001190         119400 UST-TEST-GF-8-4.                                                 NC2184.2
   001191         119500     ADD     1 TO REC-CT.                                         NC2184.2 139
   001192         119600     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   001193      1  119700             PERFORM PASS                                         NC2184.2 242
   001194      1  119800             GO TO UST-WRITE-GF-8-4                               NC2184.2 1204
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001195         119900     ELSE                                                         NC2184.2
   001196      1  120000             GO TO UST-FAIL-GF-8-4.                               NC2184.2 1200
   001197         120100 UST-DELETE-GF-8-4.                                               NC2184.2
   001198         120200     PERFORM DE-LETE.                                             NC2184.2 244
   001199         120300     GO TO UST-WRITE-GF-8-4.                                      NC2184.2 1204
   001200         120400 UST-FAIL-GF-8-4.                                                 NC2184.2
   001201         120500     PERFORM FAIL                                                 NC2184.2 243
   001202         120600     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   001203         120700     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   001204         120800 UST-WRITE-GF-8-4.                                                NC2184.2
   001205         120900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001206         121000*                                                                 NC2184.2
   001207         121100 UST-TEST-GF-8-5.                                                 NC2184.2
   001208         121200     ADD     1 TO REC-CT.                                         NC2184.2 139
   001209         121300     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   001210      1  121400             PERFORM PASS                                         NC2184.2 242
   001211      1  121500             GO TO UST-WRITE-GF-8-5                               NC2184.2 1221
   001212         121600     ELSE                                                         NC2184.2
   001213      1  121700             GO TO UST-FAIL-GF-8-5.                               NC2184.2 1217
   001214         121800 UST-DELETE-GF-8-5.                                               NC2184.2
   001215         121900     PERFORM DE-LETE.                                             NC2184.2 244
   001216         122000     GO TO UST-WRITE-GF-8-5.                                      NC2184.2 1221
   001217         122100 UST-FAIL-GF-8-5.                                                 NC2184.2
   001218         122200     PERFORM FAIL                                                 NC2184.2 243
   001219         122300     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   001220         122400     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   001221         122500 UST-WRITE-GF-8-5.                                                NC2184.2
   001222         122600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001223         122700*                                                                 NC2184.2
   001224         122800 UST-INIT-GF-9.                                                   NC2184.2
   001225         122900     MOVE    "UST-TEST-GF-9" TO PAR-NAME.                         NC2184.2 92
   001226         123000     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001227         123100     MOVE    "PIC S9 TRAIL SEP" TO FEATURE.                       NC2184.2 88
   001228         123200     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   001229         123300     MOVE    ZERO TO ID4-DS-TS-1V0.                               NC2184.2 IMP 66
   001230         123400     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001231         123500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001232         123600     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001233         123700     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001234         123800     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001235         123900*                                                                 NC2184.2
   001236         124000 UST-TEST-GF-9.                                                   NC2184.2
   001237         124100     UNSTRING ID1-XN-7 DELIMITED ALL ZERO-XN-1 INTO ID4-DS-TS-1V0 NC2184.2 44 42 66
   001238         124200             DELIMITER ID5-XN-4                                   NC2184.2 79
   001239         124300             COUNT ID6-DU-2V0                                     NC2184.2 82
   001240         124400             POINTER ID10-DU-2V0                                  NC2184.2 84
   001241         124500             TALLYING IN ID11-DU-2V0.                             NC2184.2 85
   001242         124600     GO TO UST-TEST-GF-9-1.                                       NC2184.2 1248
   001243         124700 UST-DELETE-GF-9.                                                 NC2184.2
   001244         124800     PERFORM DE-LETE.                                             NC2184.2 244
   001245         124900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001246         125000     GO      TO UST-INIT-GF-10.                                   NC2184.2 1331
   001247         125100*                                                                 NC2184.2
   001248         125200 UST-TEST-GF-9-1.                                                 NC2184.2
   001249         125300     IF      ID4-DS-TS-1V0 = +2                                   NC2184.2 66
   001250      1  125400             PERFORM PASS                                         NC2184.2 242
   001251      1  125500             GO TO UST-WRITE-GF-9-1                               NC2184.2 1261
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001252         125600     ELSE                                                         NC2184.2
   001253      1  125700             GO TO UST-FAIL-GF-9-1.                               NC2184.2 1257
   001254         125800 UST-DELETE-GF-9-1.                                               NC2184.2
   001255         125900     PERFORM DE-LETE.                                             NC2184.2 244
   001256         126000     GO TO UST-WRITE-GF-9-1.                                      NC2184.2 1261
   001257         126100 UST-FAIL-GF-9-1.                                                 NC2184.2
   001258         126200     PERFORM FAIL                                                 NC2184.2 243
   001259         126300     MOVE    ID4-DS-TS-1V0 TO COMPUTED-N                          NC2184.2 66 104
   001260         126400     MOVE    +2 TO CORRECT-N.                                     NC2184.2 118
   001261         126500 UST-WRITE-GF-9-1.                                                NC2184.2
   001262         126600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001263         126700*                                                                 NC2184.2
   001264         126800 UST-TEST-GF-9-2.                                                 NC2184.2
   001265         126900     ADD     1 TO REC-CT.                                         NC2184.2 139
   001266         127000     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   001267      1  127100             PERFORM PASS                                         NC2184.2 242
   001268      1  127200             GO TO UST-WRITE-GF-9-2                               NC2184.2 1278
   001269         127300     ELSE                                                         NC2184.2
   001270      1  127400             GO TO UST-FAIL-GF-9-2.                               NC2184.2 1274
   001271         127500 UST-DELETE-GF-9-2.                                               NC2184.2
   001272         127600     PERFORM DE-LETE.                                             NC2184.2 244
   001273         127700     GO TO UST-WRITE-GF-9-2.                                      NC2184.2 1278
   001274         127800 UST-FAIL-GF-9-2.                                                 NC2184.2
   001275         127900     PERFORM FAIL                                                 NC2184.2 243
   001276         128000     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   001277         128100     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   001278         128200 UST-WRITE-GF-9-2.                                                NC2184.2
   001279         128300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001280         128400*                                                                 NC2184.2
   001281         128500 UST-TEST-GF-9-3.                                                 NC2184.2
   001282         128600     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   001283      1  128700             PERFORM PASS                                         NC2184.2 242
   001284      1  128800             GO TO UST-WRITE-GF-9-3                               NC2184.2 1294
   001285         128900     ELSE                                                         NC2184.2
   001286      1  129000             GO TO UST-FAIL-GF-9-3.                               NC2184.2 1290
   001287         129100 UST-DELETE-GF-9-3.                                               NC2184.2
   001288         129200     PERFORM DE-LETE.                                             NC2184.2 244
   001289         129300     GO TO UST-WRITE-GF-9-3.                                      NC2184.2 1294
   001290         129400 UST-FAIL-GF-9-3.                                                 NC2184.2
   001291         129500     PERFORM FAIL                                                 NC2184.2 243
   001292         129600     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   001293         129700     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   001294         129800 UST-WRITE-GF-9-3.                                                NC2184.2
   001295         129900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001296         130000*                                                                 NC2184.2
   001297         130100 UST-TEST-GF-9-4.                                                 NC2184.2
   001298         130200     ADD     1 TO REC-CT.                                         NC2184.2 139
   001299         130300     IF      ID10-DU-2V0 = 8                                      NC2184.2 84
   001300      1  130400             PERFORM PASS                                         NC2184.2 242
   001301      1  130500             GO TO UST-WRITE-GF-9-4                               NC2184.2 1311
   001302         130600     ELSE                                                         NC2184.2
   001303      1  130700             GO TO UST-FAIL-GF-9-4.                               NC2184.2 1307
   001304         130800 UST-DELETE-GF-9-4.                                               NC2184.2
   001305         130900     PERFORM DE-LETE.                                             NC2184.2 244
   001306         131000     GO TO UST-WRITE-GF-9-4.                                      NC2184.2 1311
   001307         131100 UST-FAIL-GF-9-4.                                                 NC2184.2
   001308         131200     PERFORM FAIL                                                 NC2184.2 243
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001309         131300     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   001310         131400     MOVE    8 TO CORRECT-N.                                      NC2184.2 118
   001311         131500 UST-WRITE-GF-9-4.                                                NC2184.2
   001312         131600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001313         131700*                                                                 NC2184.2
   001314         131800 UST-TEST-GF-9-5.                                                 NC2184.2
   001315         131900     ADD     1 TO REC-CT.                                         NC2184.2 139
   001316         132000     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   001317      1  132100             PERFORM PASS                                         NC2184.2 242
   001318      1  132200             GO TO UST-WRITE-GF-9-5                               NC2184.2 1328
   001319         132300     ELSE                                                         NC2184.2
   001320      1  132400             GO TO UST-FAIL-GF-9-5.                               NC2184.2 1324
   001321         132500 UST-DELETE-GF-9-5.                                               NC2184.2
   001322         132600     PERFORM DE-LETE.                                             NC2184.2 244
   001323         132700     GO TO UST-WRITE-GF-9-5.                                      NC2184.2 1328
   001324         132800 UST-FAIL-GF-9-5.                                                 NC2184.2
   001325         132900     PERFORM FAIL                                                 NC2184.2 243
   001326         133000     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   001327         133100     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   001328         133200 UST-WRITE-GF-9-5.                                                NC2184.2
   001329         133300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001330         133400*                                                                 NC2184.2
   001331         133500 UST-INIT-GF-10.                                                  NC2184.2
   001332         133600     MOVE    "UST-TEST-GF-10" TO PAR-NAME.                        NC2184.2 92
   001333         133700     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001334         133800     MOVE    "PIC S9 LEAD SEP" TO FEATURE.                        NC2184.2 88
   001335         133900     MOVE    "1200000" TO ID1-XN-7.                               NC2184.2 44
   001336         134000     MOVE    ZERO TO ID4-DS-LS-1V0.                               NC2184.2 IMP 67
   001337         134100     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001338         134200     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001339         134300     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001340         134400     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001341         134500     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001342         134600*                                                                 NC2184.2
   001343         134700 UST-TEST-GF-10.                                                  NC2184.2
   001344         134800     UNSTRING ID1-XN-7 DELIMITED BY "0" INTO ID4-DS-LS-1V0        NC2184.2 44 67
   001345         134900             DELIMITER ID5-XN-4                                   NC2184.2 79
   001346         135000             COUNT ID6-DU-2V0                                     NC2184.2 82
   001347         135100             POINTER ID10-DU-2V0                                  NC2184.2 84
   001348         135200             TALLYING ID11-DU-2V0.                                NC2184.2 85
   001349         135300     GO TO UST-TEST-GF-10-1.                                      NC2184.2 1355
   001350         135400 UST-DELETE-GF-10.                                                NC2184.2
   001351         135500     PERFORM DE-LETE.                                             NC2184.2 244
   001352         135600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001353         135700     GO      TO UST-INIT-GF-11.                                   NC2184.2 1439
   001354         135800*                                                                 NC2184.2
   001355         135900 UST-TEST-GF-10-1.                                                NC2184.2
   001356         136000     IF      ID4-DS-LS-1V0 = +2                                   NC2184.2 67
   001357      1  136100             PERFORM PASS                                         NC2184.2 242
   001358      1  136200             GO TO UST-WRITE-GF-10-1                              NC2184.2 1368
   001359         136300     ELSE                                                         NC2184.2
   001360      1  136400             GO TO UST-FAIL-GF-10-1.                              NC2184.2 1364
   001361         136500 UST-DELETE-GF-10-1.                                              NC2184.2
   001362         136600     PERFORM DE-LETE.                                             NC2184.2 244
   001363         136700     GO TO UST-WRITE-GF-10-1.                                     NC2184.2 1368
   001364         136800 UST-FAIL-GF-10-1.                                                NC2184.2
   001365         136900     PERFORM FAIL                                                 NC2184.2 243
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001366         137000     MOVE    ID4-DS-LS-1V0 TO COMPUTED-N                          NC2184.2 67 104
   001367         137100     MOVE    +2 TO CORRECT-N.                                     NC2184.2 118
   001368         137200 UST-WRITE-GF-10-1.                                               NC2184.2
   001369         137300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001370         137400*                                                                 NC2184.2
   001371         137500 UST-TEST-GF-10-2.                                                NC2184.2
   001372         137600     ADD     1 TO REC-CT.                                         NC2184.2 139
   001373         137700     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   001374      1  137800             PERFORM PASS                                         NC2184.2 242
   001375      1  137900             GO TO UST-WRITE-GF-10-2                              NC2184.2 1385
   001376         138000     ELSE                                                         NC2184.2
   001377      1  138100             GO TO UST-FAIL-GF-10-2.                              NC2184.2 1381
   001378         138200 UST-DELETE-GF-10-2.                                              NC2184.2
   001379         138300     PERFORM DE-LETE.                                             NC2184.2 244
   001380         138400     GO TO UST-WRITE-GF-10-2.                                     NC2184.2 1385
   001381         138500 UST-FAIL-GF-10-2.                                                NC2184.2
   001382         138600     PERFORM FAIL                                                 NC2184.2 243
   001383         138700     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   001384         138800     MOVE    "0   " TO CORRECT-A.                                 NC2184.2 117
   001385         138900 UST-WRITE-GF-10-2.                                               NC2184.2
   001386         139000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001387         139100*                                                                 NC2184.2
   001388         139200 UST-TEST-GF-10-3.                                                NC2184.2
   001389         139300     ADD     1 TO REC-CT.                                         NC2184.2 139
   001390         139400     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   001391      1  139500             PERFORM PASS                                         NC2184.2 242
   001392      1  139600             GO TO UST-WRITE-GF-10-3                              NC2184.2 1402
   001393         139700     ELSE                                                         NC2184.2
   001394      1  139800             GO TO UST-FAIL-GF-10-3.                              NC2184.2 1398
   001395         139900 UST-DELETE-GF-10-3.                                              NC2184.2
   001396         140000     PERFORM DE-LETE.                                             NC2184.2 244
   001397         140100     GO TO UST-WRITE-GF-10-3.                                     NC2184.2 1402
   001398         140200 UST-FAIL-GF-10-3.                                                NC2184.2
   001399         140300     PERFORM FAIL                                                 NC2184.2 243
   001400         140400     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   001401         140500     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   001402         140600 UST-WRITE-GF-10-3.                                               NC2184.2
   001403         140700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001404         140800*                                                                 NC2184.2
   001405         140900 UST-TEST-GF-10-4.                                                NC2184.2
   001406         141000     ADD     1 TO REC-CT.                                         NC2184.2 139
   001407         141100     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   001408      1  141200             PERFORM PASS                                         NC2184.2 242
   001409      1  141300             GO TO UST-WRITE-GF-10-4                              NC2184.2 1419
   001410         141400     ELSE                                                         NC2184.2
   001411      1  141500             GO TO UST-FAIL-GF-10-4.                              NC2184.2 1415
   001412         141600 UST-DELETE-GF-10-4.                                              NC2184.2
   001413         141700     PERFORM DE-LETE.                                             NC2184.2 244
   001414         141800     GO TO UST-WRITE-GF-10-4.                                     NC2184.2 1419
   001415         141900 UST-FAIL-GF-10-4.                                                NC2184.2
   001416         142000     PERFORM FAIL                                                 NC2184.2 243
   001417         142100     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   001418         142200     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   001419         142300 UST-WRITE-GF-10-4.                                               NC2184.2
   001420         142400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001421         142500*                                                                 NC2184.2
   001422         142600 UST-TEST-GF-10-5.                                                NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001423         142700     ADD     1 TO REC-CT.                                         NC2184.2 139
   001424         142800     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   001425      1  142900             PERFORM PASS                                         NC2184.2 242
   001426      1  143000             GO TO UST-WRITE-GF-10-5                              NC2184.2 1436
   001427         143100     ELSE                                                         NC2184.2
   001428      1  143200             GO TO UST-FAIL-GF-10-5.                              NC2184.2 1432
   001429         143300 UST-DELETE-GF-10-5.                                              NC2184.2
   001430         143400     PERFORM DE-LETE.                                             NC2184.2 244
   001431         143500     GO TO UST-WRITE-GF-10-5.                                     NC2184.2 1436
   001432         143600 UST-FAIL-GF-10-5.                                                NC2184.2
   001433         143700     PERFORM FAIL                                                 NC2184.2 243
   001434         143800     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   001435         143900     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   001436         144000 UST-WRITE-GF-10-5.                                               NC2184.2
   001437         144100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001438         144200*                                                                 NC2184.2
   001439         144300 UST-INIT-GF-11.                                                  NC2184.2
   001440         144400     MOVE    "UST-TEST-GF-11" TO PAR-NAME.                        NC2184.2 92
   001441         144500     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001442         144600     MOVE    "GROUP BOTTOM UP" TO FEATURE.                        NC2184.2 88
   001443         144700     MOVE    "ABCDEFGHIJ" TO GRP1-XN-10.                          NC2184.2 46
   001444         144800     MOVE    SPACES TO GRP4-XN-10.                                NC2184.2 IMP 73
   001445         144900     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001446         145000     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001447         145100     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001448         145200     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001449         145300     MOVE    ZERO TO REC-CT.                                      NC2184.2 IMP 139
   001450         145400*                                                                 NC2184.2
   001451         145500 UST-TEST-GF-11.                                                  NC2184.2
   001452         145600     UNSTRING GRP1-XN-10 INTO ID4D-XXXX ID4C-XXX ID4B-XX ID4A-X.  NC2184.2 46 77 76 75 74
   001453         145700     IF      GRP4-XN-10 = "JHIEFGABCD"                            NC2184.2 73
   001454      1  145800             PERFORM PASS                                         NC2184.2 242
   001455      1  145900             GO TO UST-WRITE-GF-11-1                              NC2184.2 1465
   001456         146000     ELSE                                                         NC2184.2
   001457      1  146100             GO TO UST-FAIL-GF-11-1.                              NC2184.2 1461
   001458         146200 UST-DELETE-GF-11-1.                                              NC2184.2
   001459         146300     PERFORM DE-LETE.                                             NC2184.2 244
   001460         146400     GO TO UST-WRITE-GF-11-1.                                     NC2184.2 1465
   001461         146500 UST-FAIL-GF-11-1.                                                NC2184.2
   001462         146600     PERFORM FAIL                                                 NC2184.2 243
   001463         146700     MOVE    GRP4-XN-10 TO COMPUTED-A                             NC2184.2 73 103
   001464         146800     MOVE    "JHIEFGABCD" TO CORRECT-A.                           NC2184.2 117
   001465         146900 UST-WRITE-GF-11-1.                                               NC2184.2
   001466         147000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001467         147100*                                                                 NC2184.2
   001468         147200 UST-INIT-GF-12.                                                  NC2184.2
   001469         147300     MOVE   "UST-TEST-GF-12" TO PAR-NAME.                         NC2184.2 92
   001470         147400     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001471         147500     MOVE   "OVERFLOW TEST" TO FEATURE.                           NC2184.2 88
   001472         147600     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   001473         147700     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001474         147800     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001475         147900     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001476         148000     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001477         148100     MOVE    "ABCDEF" TO GRP1-XN-6.                               NC2184.2 43
   001478         148200     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001479         148300*                                                                 NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001480         148400 UST-TEST-GF-12-1.                                                NC2184.2
   001481         148500     UNSTRING GRP1-XN-6  INTO ID4A-XXXXX ID4B-X                   NC2184.2 43 69 70

 ==001481==> IGYPG3230-W An overflow condition will never occur in the "UNSTRING" statement.

   001482      1  148600             ON OVERFLOW GO TO UST-FAIL-GF-12-1.                  NC2184.2 1489
   001483         148700     PERFORM PASS.                                                NC2184.2 242
   001484         148800     GO TO UST-WRITE-GF-12-1.                                     NC2184.2 1492
   001485         148900 UST-DELETE-GF-12-1.                                              NC2184.2
   001486         149000     PERFORM DE-LETE.                                             NC2184.2 244
   001487         149100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001488         149200     GO      TO UST-INIT-GF-13.                                   NC2184.2 1513
   001489         149300 UST-FAIL-GF-12-1.                                                NC2184.2
   001490         149400     PERFORM FAIL.                                                NC2184.2 243
   001491         149500     MOVE    "OVERFLOW SHOULD NOT HAVE OCCURED" TO RE-MARK.       NC2184.2 97
   001492         149600 UST-WRITE-GF-12-1.                                               NC2184.2
   001493         149700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001494         149800*                                                                 NC2184.2
   001495         149900 UST-TEST-GF-12-2.                                                NC2184.2
   001496         150000     MOVE    "UST-TEST-GF-12" TO PAR-NAME.                        NC2184.2 92
   001497         150100     ADD     1 TO REC-CT.                                         NC2184.2 139
   001498         150200     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   001499      1  150300             PERFORM PASS                                         NC2184.2 242
   001500      1  150400             GO TO UST-WRITE-GF-12-2                              NC2184.2 1510
   001501         150500     ELSE                                                         NC2184.2
   001502      1  150600             GO TO UST-FAIL-GF-12-2.                              NC2184.2 1506
   001503         150700 UST-DELETE-GF-12-2.                                              NC2184.2
   001504         150800     PERFORM DE-LETE.                                             NC2184.2 244
   001505         150900     GO TO UST-WRITE-GF-12-2.                                     NC2184.2 1510
   001506         151000 UST-FAIL-GF-12-2.                                                NC2184.2
   001507         151100     PERFORM FAIL                                                 NC2184.2 243
   001508         151200     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   001509         151300     MOVE    "ABCDEF" TO CORRECT-A.                               NC2184.2 117
   001510         151400 UST-WRITE-GF-12-2.                                               NC2184.2
   001511         151500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001512         151600*                                                                 NC2184.2
   001513         151700 UST-INIT-GF-13.                                                  NC2184.2
   001514         151800     MOVE    "UST-TEST-GF-13" TO PAR-NAME.                        NC2184.2 92
   001515         151900     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001516         152000     MOVE    "OVERFLOW EXPECTED" TO FEATURE.                      NC2184.2 88
   001517         152100     MOVE    "ABCDEF" TO GRP1-XN-6.                               NC2184.2 43
   001518         152200     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   001519         152300     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001520         152400     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001521         152500     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001522         152600     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001523         152700     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001524         152800 UST-TEST-GF-13-1.                                                NC2184.2
   001525         152900     UNSTRING GRP1-XN-6 INTO ID4A-XXXXX OVERFLOW PERFORM PASS     NC2184.2 43 69 242

 ==001525==> IGYPG3229-W An overflow condition will always occur in the "UNSTRING" statement.

   001526      1  153000                                        GO TO UST-WRITE-GF-13-1.  NC2184.2 1535
   001527         153100     GO      TO UST-FAIL-GF-13-1.                                 NC2184.2 1532
   001528         153200 UST-DELETE-GF-13-1.                                              NC2184.2
   001529         153300     PERFORM DE-LETE.                                             NC2184.2 244
   001530         153400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001531         153500     GO      TO UST-INIT-GF-14.                                   NC2184.2 1555
   001532         153600 UST-FAIL-GF-13-1.                                                NC2184.2
   001533         153700     PERFORM FAIL.                                                NC2184.2 243
   001534         153800     MOVE    "OVERFLOW SHOULD HAVE OCCURED" TO RE-MARK.           NC2184.2 97
   001535         153900 UST-WRITE-GF-13-1.                                               NC2184.2
   001536         154000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001537         154100*                                                                 NC2184.2
   001538         154200 UST-TEST-GF-13-2.                                                NC2184.2
   001539         154300     ADD     1 TO REC-CT.                                         NC2184.2 139
   001540         154400     IF      GRP4-XN-6 = "ABCDE "                                 NC2184.2 68
   001541      1  154500             PERFORM PASS                                         NC2184.2 242
   001542      1  154600             GO TO UST-WRITE-GF-13-2                              NC2184.2 1552
   001543         154700     ELSE                                                         NC2184.2
   001544      1  154800             GO TO UST-FAIL-GF-13-2.                              NC2184.2 1548
   001545         154900 UST-DELETE-GF-13-2.                                              NC2184.2
   001546         155000     PERFORM DE-LETE.                                             NC2184.2 244
   001547         155100     GO TO UST-WRITE-GF-13-2.                                     NC2184.2 1552
   001548         155200 UST-FAIL-GF-13-2.                                                NC2184.2
   001549         155300     PERFORM FAIL                                                 NC2184.2 243
   001550         155400     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   001551         155500     MOVE    "ABCDE " TO CORRECT-A.                               NC2184.2 117
   001552         155600 UST-WRITE-GF-13-2.                                               NC2184.2
   001553         155700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001554         155800*                                                                 NC2184.2
   001555         155900 UST-INIT-GF-14.                                                  NC2184.2
   001556         156000     MOVE    "UST-TEST-GF-14" TO PAR-NAME.                        NC2184.2 92
   001557         156100     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001558         156200     MOVE    "INSTANT OVERFLOW" TO FEATURE.                       NC2184.2 88
   001559         156300     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   001560         156400     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001561         156500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001562         156600     MOVE    7 TO ID10-DU-2V0.                                    NC2184.2 84
   001563         156700     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001564         156800     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001565         156900*                                                                 NC2184.2
   001566         157000 UST-TEST-GF-14-1.                                                NC2184.2
   001567         157100     UNSTRING GRP1-XN-6 INTO ID4A-XXXXX ID4B-X POINTER ID10-DU-2V0NC2184.2 43 69 70 84
   001568      1  157200             OVERFLOW PERFORM PASS                                NC2184.2 242
   001569      1  157300                      GO TO UST-WRITE-GF-14-1.                    NC2184.2 1578
   001570         157400     GO      TO UST-FAIL-GF-14-1.                                 NC2184.2 1575
   001571         157500 UST-DELETE-GF-14-1.                                              NC2184.2
   001572         157600     PERFORM DE-LETE.                                             NC2184.2 244
   001573         157700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001574         157800     GO      TO UST-INIT-GF-15.                                   NC2184.2 1616
   001575         157900 UST-FAIL-GF-14-1.                                                NC2184.2
   001576         158000     PERFORM FAIL.                                                NC2184.2 243
   001577         158100     MOVE    "OVERFLOW SHOULD HAVE OCCURED" TO RE-MARK.           NC2184.2 97
   001578         158200 UST-WRITE-GF-14-1.                                               NC2184.2
   001579         158300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001580         158400*                                                                 NC2184.2
   001581         158500 UST-TEST-GF-14-2.                                                NC2184.2
   001582         158600     MOVE    "UST-TEST-GF-14" TO PAR-NAME.                        NC2184.2 92
   001583         158700     ADD     1 TO REC-CT.                                         NC2184.2 139
   001584         158800     IF      GRP4-XN-6 = SPACES                                   NC2184.2 68 IMP
   001585      1  158900             PERFORM PASS                                         NC2184.2 242
   001586      1  159000             GO TO UST-WRITE-GF-14-2                              NC2184.2 1596
   001587         159100     ELSE                                                         NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001588      1  159200             GO TO UST-FAIL-GF-14-2.                              NC2184.2 1592
   001589         159300 UST-DELETE-GF-14-2.                                              NC2184.2
   001590         159400     PERFORM DE-LETE.                                             NC2184.2 244
   001591         159500     GO TO UST-WRITE-GF-14-2.                                     NC2184.2 1596
   001592         159600 UST-FAIL-GF-14-2.                                                NC2184.2
   001593         159700     PERFORM FAIL                                                 NC2184.2 243
   001594         159800     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   001595         159900     MOVE    "ALL SPACES" TO CORRECT-A.                           NC2184.2 117
   001596         160000 UST-WRITE-GF-14-2.                                               NC2184.2
   001597         160100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001598         160200*                                                                 NC2184.2
   001599         160300 UST-TEST-GF-14-3.                                                NC2184.2
   001600         160400     ADD     1 TO REC-CT.                                         NC2184.2 139
   001601         160500     IF      ID10-DU-2V0 = 7                                      NC2184.2 84
   001602      1  160600             PERFORM PASS                                         NC2184.2 242
   001603      1  160700             GO TO UST-WRITE-GF-14-3                              NC2184.2 1613
   001604         160800     ELSE                                                         NC2184.2
   001605      1  160900             GO TO UST-FAIL-GF-14-3.                              NC2184.2 1609
   001606         161000 UST-DELETE-GF-14-3.                                              NC2184.2
   001607         161100     PERFORM DE-LETE.                                             NC2184.2 244
   001608         161200     GO TO UST-WRITE-GF-14-3.                                     NC2184.2 1613
   001609         161300 UST-FAIL-GF-14-3.                                                NC2184.2
   001610         161400     PERFORM FAIL                                                 NC2184.2 243
   001611         161500     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   001612         161600     MOVE    7 TO CORRECT-N.                                      NC2184.2 118
   001613         161700 UST-WRITE-GF-14-3.                                               NC2184.2
   001614         161800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001615         161900*                                                                 NC2184.2
   001616         162000 UST-INIT-GF-15.                                                  NC2184.2
   001617         162100     MOVE    "UST-TEST-GF-15" TO PAR-NAME.                        NC2184.2 92
   001618         162200     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001619         162300     MOVE    "POINTER NOT = 1" TO FEATURE.                        NC2184.2 88
   001620         162400     MOVE    "ABCDEF" TO GRP1-XN-6.                               NC2184.2 43
   001621         162500     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   001622         162600     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001623         162700     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001624         162800     MOVE    3 TO ID10-DU-2V0.                                    NC2184.2 84
   001625         162900     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001626         163000     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001627         163100*                                                                 NC2184.2
   001628         163200 UST-TEST-GF-15-1.                                                NC2184.2
   001629         163300     UNSTRING GRP1-XN-6 INTO ID4A-XXXXX ID4B-X POINTER ID10-DU-2V0NC2184.2 43 69 70 84
   001630      1  163400             OVERFLOW GO TO UST-FAIL-GF-15-1.                     NC2184.2 1637
   001631         163500     PERFORM PASS                                                 NC2184.2 242
   001632         163600     GO TO UST-WRITE-GF-15-1.                                     NC2184.2 1640
   001633         163700 UST-DELETE-GF-15-1.                                              NC2184.2
   001634         163800     PERFORM DE-LETE.                                             NC2184.2 244
   001635         163900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001636         164000     GO      TO UST-INIT-GF-16.                                   NC2184.2 1677
   001637         164100 UST-FAIL-GF-15-1.                                                NC2184.2
   001638         164200     PERFORM FAIL.                                                NC2184.2 243
   001639         164300     MOVE    "OVERFLOW SHOULD NOT HAVE OCCURED" TO RE-MARK.       NC2184.2 97
   001640         164400 UST-WRITE-GF-15-1.                                               NC2184.2
   001641         164500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001642         164600*                                                                 NC2184.2
   001643         164700 UST-TEST-GF-15-2.                                                NC2184.2
   001644         164800     ADD     1 TO REC-CT.                                         NC2184.2 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001645         164900     IF      GRP4-XN-6 = "CDEF  "                                 NC2184.2 68
   001646      1  165000             PERFORM PASS                                         NC2184.2 242
   001647      1  165100             GO TO UST-WRITE-GF-15-2                              NC2184.2 1657
   001648         165200     ELSE                                                         NC2184.2
   001649      1  165300             GO TO UST-FAIL-GF-15-2.                              NC2184.2 1653
   001650         165400 UST-DELETE-GF-15-2.                                              NC2184.2
   001651         165500     PERFORM DE-LETE.                                             NC2184.2 244
   001652         165600     GO TO UST-WRITE-GF-15-2.                                     NC2184.2 1657
   001653         165700 UST-FAIL-GF-15-2.                                                NC2184.2
   001654         165800     PERFORM FAIL                                                 NC2184.2 243
   001655         165900     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   001656         166000     MOVE    "CDEF  " TO CORRECT-A.                               NC2184.2 117
   001657         166100 UST-WRITE-GF-15-2.                                               NC2184.2
   001658         166200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001659         166300*                                                                 NC2184.2
   001660         166400 UST-TEST-GF-15-3.                                                NC2184.2
   001661         166500     ADD     1 TO REC-CT.                                         NC2184.2 139
   001662         166600     IF      ID10-DU-2V0 = 7                                      NC2184.2 84
   001663      1  166700             PERFORM PASS                                         NC2184.2 242
   001664      1  166800             GO TO UST-WRITE-GF-15-3                              NC2184.2 1674
   001665         166900     ELSE                                                         NC2184.2
   001666      1  167000             GO TO UST-FAIL-GF-15-3.                              NC2184.2 1670
   001667         167100 UST-DELETE-GF-15-3.                                              NC2184.2
   001668         167200     PERFORM DE-LETE.                                             NC2184.2 244
   001669         167300     GO TO UST-WRITE-GF-15-3.                                     NC2184.2 1674
   001670         167400 UST-FAIL-GF-15-3.                                                NC2184.2
   001671         167500     PERFORM FAIL                                                 NC2184.2 243
   001672         167600     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   001673         167700     MOVE    7 TO CORRECT-N.                                      NC2184.2 118
   001674         167800 UST-WRITE-GF-15-3.                                               NC2184.2
   001675         167900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001676         168000*                                                                 NC2184.2
   001677         168100 UST-INIT-GF-16.                                                  NC2184.2
   001678         168200     MOVE    "UST-TEST-GF-16" TO PAR-NAME.                        NC2184.2 92
   001679         168300     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001680         168400     MOVE    "TALLY 3 FIELDS TEST" TO FEATURE.                    NC2184.2 88
   001681         168500     MOVE    "ABCDEF" TO GRP1-XN-6.                               NC2184.2 43
   001682         168600     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   001683         168700     MOVE    "****" TO ID4C-XXXX.                                 NC2184.2 71
   001684         168800     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001685         168900     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001686         169000     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001687         169100     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001688         169200     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001689         169300*                                                                 NC2184.2
   001690         169400 UST-TEST-GF-16-0.                                                NC2184.2
   001691         169500     UNSTRING GRP1-XN-6 INTO ID4A-XXXXX ID4B-X ID4C-XXXX          NC2184.2 43 69 70 71
   001692         169600             TALLYING ID11-DU-2V0.                                NC2184.2 85
   001693         169700     GO      TO UST-TEST-GF-16-1.                                 NC2184.2 1699
   001694         169800 UST-DELETE-GF-16.                                                NC2184.2
   001695         169900     PERFORM DE-LETE.                                             NC2184.2 244
   001696         170000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001697         170100     GO      TO UST-INIT-GF-17.                                   NC2184.2 1749
   001698         170200*                                                                 NC2184.2
   001699         170300 UST-TEST-GF-16-1.                                                NC2184.2
   001700         170400     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   001701      1  170500             PERFORM PASS                                         NC2184.2 242
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001702      1  170600             GO TO UST-WRITE-GF-16-1                              NC2184.2 1712
   001703         170700     ELSE                                                         NC2184.2
   001704      1  170800             GO TO UST-FAIL-GF-16-1.                              NC2184.2 1708
   001705         170900 UST-DELETE-GF-16-1.                                              NC2184.2
   001706         171000     PERFORM DE-LETE.                                             NC2184.2 244
   001707         171100     GO TO UST-WRITE-GF-16-1.                                     NC2184.2 1712
   001708         171200 UST-FAIL-GF-16-1.                                                NC2184.2
   001709         171300     PERFORM FAIL                                                 NC2184.2 243
   001710         171400     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   001711         171500     MOVE    "ABCDEF" TO CORRECT-A.                               NC2184.2 117
   001712         171600 UST-WRITE-GF-16-1.                                               NC2184.2
   001713         171700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001714         171800*                                                                 NC2184.2
   001715         171900 UST-TEST-GF-16-2.                                                NC2184.2
   001716         172000     ADD     1 TO REC-CT.                                         NC2184.2 139
   001717         172100     IF      ID4C-XXXX = "****"                                   NC2184.2 71
   001718      1  172200             PERFORM PASS                                         NC2184.2 242
   001719      1  172300             GO TO UST-WRITE-GF-16-2                              NC2184.2 1729
   001720         172400     ELSE                                                         NC2184.2
   001721      1  172500             GO TO UST-FAIL-GF-16-2.                              NC2184.2 1725
   001722         172600 UST-DELETE-GF-16-2.                                              NC2184.2
   001723         172700     PERFORM DE-LETE.                                             NC2184.2 244
   001724         172800     GO TO UST-WRITE-GF-16-2.                                     NC2184.2 1729
   001725         172900 UST-FAIL-GF-16-2.                                                NC2184.2
   001726         173000     PERFORM FAIL                                                 NC2184.2 243
   001727         173100     MOVE    ID4C-XXXX TO COMPUTED-A                              NC2184.2 71 103
   001728         173200     MOVE    "****" TO CORRECT-A.                                 NC2184.2 117
   001729         173300 UST-WRITE-GF-16-2.                                               NC2184.2
   001730         173400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001731         173500*                                                                 NC2184.2
   001732         173600 UST-TEST-GF-16-3.                                                NC2184.2
   001733         173700     ADD     1 TO REC-CT.                                         NC2184.2 139
   001734         173800     IF      ID11-DU-2V0 = 2                                      NC2184.2 85
   001735      1  173900             PERFORM PASS                                         NC2184.2 242
   001736      1  174000             GO TO UST-WRITE-GF-16-3                              NC2184.2 1746
   001737         174100     ELSE                                                         NC2184.2
   001738      1  174200             GO TO UST-FAIL-GF-16-3.                              NC2184.2 1742
   001739         174300 UST-DELETE-GF-16-3.                                              NC2184.2
   001740         174400     PERFORM DE-LETE.                                             NC2184.2 244
   001741         174500     GO TO UST-WRITE-GF-16-3.                                     NC2184.2 1746
   001742         174600 UST-FAIL-GF-16-3.                                                NC2184.2
   001743         174700     PERFORM FAIL                                                 NC2184.2 243
   001744         174800     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   001745         174900     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   001746         175000 UST-WRITE-GF-16-3.                                               NC2184.2
   001747         175100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001748         175200*                                                                 NC2184.2
   001749         175300 UST-INIT-GF-17.                                                  NC2184.2
   001750         175400     MOVE    "UST-TEST-GF-17" TO PAR-NAME.                        NC2184.2 92
   001751         175500     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   001752         175600     MOVE    "QUAL DEL BY POINT" TO FEATURE.                      NC2184.2 88
   001753         175700     MOVE    "ABCDEFG" TO GRP1-XN-7.                              NC2184.2 45
   001754         175800     MOVE    "BCDEFGH" TO GRP2-XN-7.                              NC2184.2 55
   001755         175900     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   001756         176000     MOVE    ALL "*" TO ID5-XN-6.                                 NC2184.2 81
   001757         176100     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001758         176200     MOVE    2 TO ID10-DU-2V0.                                    NC2184.2 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001759         176300     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   001760         176400     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001761         176500*                                                                 NC2184.2
   001762         176600 UST-TEST-GF-17.                                                  NC2184.2
   001763         176700     UNSTRING GRP1-XN-7 DELIMITED BY ID2 (ID10-DU-2V0)            NC2184.2 45 57 84
   001764         176800             INTO GRP4-XN-6                                       NC2184.2 68
   001765         176900             DELIMITER IN ID5-XN-6                                NC2184.2 81
   001766         177000             COUNT ID6-DU-2V0                                     NC2184.2 82
   001767         177100             POINTER ID10-DU-2V0.                                 NC2184.2 84
   001768         177200     GO TO UST-TEST-GF-17-1.                                      NC2184.2 1774
   001769         177300 UST-DELETE-GF-17.                                                NC2184.2
   001770         177400     PERFORM DE-LETE.                                             NC2184.2 244
   001771         177500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001772         177600     GO      TO UST-INIT-GF-18.                                   NC2184.2 1841
   001773         177700*                                                                 NC2184.2
   001774         177800 UST-TEST-GF-17-1.                                                NC2184.2
   001775         177900     IF      GRP4-XN-6 = "B     "                                 NC2184.2 68
   001776      1  178000             PERFORM PASS                                         NC2184.2 242
   001777      1  178100             GO TO UST-WRITE-GF-17-1                              NC2184.2 1787
   001778         178200     ELSE                                                         NC2184.2
   001779      1  178300             GO TO UST-FAIL-GF-17-1.                              NC2184.2 1783
   001780         178400 UST-DELETE-GF-17-1.                                              NC2184.2
   001781         178500     PERFORM DE-LETE.                                             NC2184.2 244
   001782         178600     GO TO UST-WRITE-GF-17-1.                                     NC2184.2 1787
   001783         178700 UST-FAIL-GF-17-1.                                                NC2184.2
   001784         178800     PERFORM FAIL                                                 NC2184.2 243
   001785         178900     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   001786         179000     MOVE    "B     " TO CORRECT-A.                               NC2184.2 117
   001787         179100 UST-WRITE-GF-17-1.                                               NC2184.2
   001788         179200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001789         179300*                                                                 NC2184.2
   001790         179400 UST-TEST-GF-17-2.                                                NC2184.2
   001791         179500     ADD     1 TO REC-CT.                                         NC2184.2 139
   001792         179600     IF      ID5-XN-6 = "C     "                                  NC2184.2 81
   001793      1  179700             PERFORM PASS                                         NC2184.2 242
   001794      1  179800             GO TO UST-WRITE-GF-17-2                              NC2184.2 1804
   001795         179900     ELSE                                                         NC2184.2
   001796      1  180000             GO TO UST-FAIL-GF-17-2.                              NC2184.2 1800
   001797         180100 UST-DELETE-GF-17-2.                                              NC2184.2
   001798         180200     PERFORM DE-LETE.                                             NC2184.2 244
   001799         180300     GO TO UST-WRITE-GF-17-2.                                     NC2184.2 1804
   001800         180400 UST-FAIL-GF-17-2.                                                NC2184.2
   001801         180500     PERFORM FAIL                                                 NC2184.2 243
   001802         180600     MOVE    ID5-XN-6 TO COMPUTED-A                               NC2184.2 81 103
   001803         180700     MOVE    "C     " TO CORRECT-A.                               NC2184.2 117
   001804         180800 UST-WRITE-GF-17-2.                                               NC2184.2
   001805         180900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001806         181000*                                                                 NC2184.2
   001807         181100 UST-TEST-GF-17-3.                                                NC2184.2
   001808         181200     ADD     1 TO REC-CT.                                         NC2184.2 139
   001809         181300     IF      ID6-DU-2V0 = 1                                       NC2184.2 82
   001810      1  181400             PERFORM PASS                                         NC2184.2 242
   001811      1  181500             GO TO UST-WRITE-GF-17-3                              NC2184.2 1821
   001812         181600     ELSE                                                         NC2184.2
   001813      1  181700             GO TO UST-FAIL-GF-17-3.                              NC2184.2 1817
   001814         181800 UST-DELETE-GF-17-3.                                              NC2184.2
   001815         181900     PERFORM DE-LETE.                                             NC2184.2 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001816         182000     GO TO UST-WRITE-GF-17-3.                                     NC2184.2 1821
   001817         182100 UST-FAIL-GF-17-3.                                                NC2184.2
   001818         182200     PERFORM FAIL                                                 NC2184.2 243
   001819         182300     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   001820         182400     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   001821         182500 UST-WRITE-GF-17-3.                                               NC2184.2
   001822         182600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001823         182700*                                                                 NC2184.2
   001824         182800 UST-TEST-GF-17-4.                                                NC2184.2
   001825         182900     ADD     1 TO REC-CT.                                         NC2184.2 139
   001826         183000     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   001827      1  183100             PERFORM PASS                                         NC2184.2 242
   001828      1  183200             GO TO UST-WRITE-GF-17-4                              NC2184.2 1838
   001829         183300     ELSE                                                         NC2184.2
   001830      1  183400             GO TO UST-FAIL-GF-17-4.                              NC2184.2 1834
   001831         183500 UST-DELETE-GF-17-4.                                              NC2184.2
   001832         183600     PERFORM DE-LETE.                                             NC2184.2 244
   001833         183700     GO TO UST-WRITE-GF-17-4.                                     NC2184.2 1838
   001834         183800 UST-FAIL-GF-17-4.                                                NC2184.2
   001835         183900     PERFORM FAIL                                                 NC2184.2 243
   001836         184000     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   001837         184100     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   001838         184200 UST-WRITE-GF-17-4.                                               NC2184.2
   001839         184300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001840         184400*                                                                 NC2184.2
   001841         184500 UST-INIT-GF-18.                                                  NC2184.2
   001842         184600     ADD     1 TO REC-CT.                                         NC2184.2 139
   001843         184700     MOVE    "UST-TEST-GF-18" TO PAR-NAME.                        NC2184.2 92
   001844         184800     MOVE    "VI-136" TO ANSI-REFERENCE.                          NC2184.2 148
   001845         184900     MOVE    "QUAL DEL BY TALLY" TO FEATURE.                      NC2184.2 88
   001846         185000     MOVE    "ABCDEFG" TO GRP1-XN-7.                              NC2184.2 45
   001847         185100     MOVE    "CE" TO GRP2-XN-2.                                   NC2184.2 52
   001848         185200     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   001849         185300     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   001850         185400     MOVE    "****" TO ID5-XN-4-2.                                NC2184.2 80
   001851         185500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   001852         185600     MOVE    ZERO TO ID6-DU-2V0-2.                                NC2184.2 IMP 83
   001853         185700     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   001854         185800     MOVE    1 TO ID11-DU-2V0.                                    NC2184.2 85
   001855         185900     MOVE    1 TO REC-CT.                                         NC2184.2 139
   001856         186000*                                                                 NC2184.2
   001857         186100 UST-TEST-GF-18.                                                  NC2184.2
   001858         186200     UNSTRING GRP1-XN-7 DELIMITED ID2A (ID10-DU-2V0)              NC2184.2 45 54 84
   001859         186300              INTO ID4A-XXXXX                                     NC2184.2 69
   001860         186400              DELIMITER IN ID5-XN-4                               NC2184.2 79
   001861         186500              COUNT ID6-DU-2V0                                    NC2184.2 82
   001862         186600             ID4B-X DELIMITER IN ID5-XN-4-2                       NC2184.2 70 80
   001863         186700              COUNT ID6-DU-2V0-2                                  NC2184.2 83
   001864         186800              TALLYING ID11-DU-2V0.                               NC2184.2 85
   001865         186900     GO TO UST-TEST-GF-18-1.                                      NC2184.2 1871
   001866         187000 UST-DELETE-GF-18.                                                NC2184.2
   001867         187100     PERFORM DE-LETE.                                             NC2184.2 244
   001868         187200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001869         187300     GO      TO UST-INIT-GF-19.                                   NC2184.2 1972
   001870         187400*                                                                 NC2184.2
   001871         187500 UST-TEST-GF-18-1.                                                NC2184.2
   001872         187600     IF      GRP4-XN-6 = "AB   D"                                 NC2184.2 68
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001873      1  187700             PERFORM PASS                                         NC2184.2 242
   001874      1  187800             GO TO UST-WRITE-GF-18-1                              NC2184.2 1884
   001875         187900     ELSE                                                         NC2184.2
   001876      1  188000             GO TO UST-FAIL-GF-18-1.                              NC2184.2 1880
   001877         188100 UST-DELETE-GF-18-1.                                              NC2184.2
   001878         188200     PERFORM DE-LETE.                                             NC2184.2 244
   001879         188300     GO TO UST-WRITE-GF-18-1.                                     NC2184.2 1884
   001880         188400 UST-FAIL-GF-18-1.                                                NC2184.2
   001881         188500     PERFORM FAIL                                                 NC2184.2 243
   001882         188600     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   001883         188700     MOVE    "AB   D" TO CORRECT-A.                               NC2184.2 117
   001884         188800 UST-WRITE-GF-18-1.                                               NC2184.2
   001885         188900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001886         189000*                                                                 NC2184.2
   001887         189100 UST-TEST-GF-18-2.                                                NC2184.2
   001888         189200     ADD     1 TO REC-CT.                                         NC2184.2 139
   001889         189300     IF      ID5-XN-4 = "C   "                                    NC2184.2 79
   001890      1  189400             PERFORM PASS                                         NC2184.2 242
   001891      1  189500             GO TO UST-WRITE-GF-18-2                              NC2184.2 1901
   001892         189600     ELSE                                                         NC2184.2
   001893      1  189700             GO TO UST-FAIL-GF-18-2.                              NC2184.2 1897
   001894         189800 UST-DELETE-GF-18-2.                                              NC2184.2
   001895         189900     PERFORM DE-LETE.                                             NC2184.2 244
   001896         190000     GO TO UST-WRITE-GF-18-2.                                     NC2184.2 1901
   001897         190100 UST-FAIL-GF-18-2.                                                NC2184.2
   001898         190200     PERFORM FAIL                                                 NC2184.2 243
   001899         190300     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   001900         190400     MOVE    "C   " TO CORRECT-A.                                 NC2184.2 117
   001901         190500 UST-WRITE-GF-18-2.                                               NC2184.2
   001902         190600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001903         190700*                                                                 NC2184.2
   001904         190800 UST-TEST-GF-18-3.                                                NC2184.2
   001905         190900     ADD     1 TO REC-CT.                                         NC2184.2 139
   001906         191000     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   001907      1  191100             PERFORM PASS                                         NC2184.2 242
   001908      1  191200             GO TO UST-WRITE-GF-18-3                              NC2184.2 1918
   001909         191300     ELSE                                                         NC2184.2
   001910      1  191400             GO TO UST-FAIL-GF-18-3.                              NC2184.2 1914
   001911         191500 UST-DELETE-GF-18-3.                                              NC2184.2
   001912         191600     PERFORM DE-LETE.                                             NC2184.2 244
   001913         191700     GO TO UST-WRITE-GF-18-3.                                     NC2184.2 1918
   001914         191800 UST-FAIL-GF-18-3.                                                NC2184.2
   001915         191900     PERFORM FAIL                                                 NC2184.2 243
   001916         192000     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   001917         192100     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   001918         192200 UST-WRITE-GF-18-3.                                               NC2184.2
   001919         192300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001920         192400*                                                                 NC2184.2
   001921         192500 UST-TEST-GF-18-4.                                                NC2184.2
   001922         192600     ADD     1 TO REC-CT.                                         NC2184.2 139
   001923         192700     IF      ID6-DU-2V0-2 EQUAL TO 4                              NC2184.2 83
   001924      1  192800             PERFORM PASS                                         NC2184.2 242
   001925      1  192900             GO TO UST-WRITE-GF-18-4                              NC2184.2 1935
   001926         193000     ELSE                                                         NC2184.2
   001927      1  193100             GO TO UST-FAIL-GF-18-4.                              NC2184.2 1931
   001928         193200 UST-DELETE-GF-18-4.                                              NC2184.2
   001929         193300     PERFORM DE-LETE.                                             NC2184.2 244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001930         193400     GO TO UST-WRITE-GF-18-4.                                     NC2184.2 1935
   001931         193500 UST-FAIL-GF-18-4.                                                NC2184.2
   001932         193600     PERFORM FAIL                                                 NC2184.2 243
   001933         193700     MOVE    ID6-DU-2V0-2 TO COMPUTED-N                           NC2184.2 83 104
   001934         193800     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   001935         193900 UST-WRITE-GF-18-4.                                               NC2184.2
   001936         194000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001937         194100*                                                                 NC2184.2
   001938         194200 UST-TEST-GF-18-5.                                                NC2184.2
   001939         194300     ADD     1 TO REC-CT.                                         NC2184.2 139
   001940         194400     IF      ID11-DU-2V0 = 3                                      NC2184.2 85
   001941      1  194500             PERFORM PASS                                         NC2184.2 242
   001942      1  194600             GO TO UST-WRITE-GF-18-5                              NC2184.2 1952
   001943         194700     ELSE                                                         NC2184.2
   001944      1  194800             GO TO UST-FAIL-GF-18-5.                              NC2184.2 1948
   001945         194900 UST-DELETE-GF-18-5.                                              NC2184.2
   001946         195000     PERFORM DE-LETE.                                             NC2184.2 244
   001947         195100     GO TO UST-WRITE-GF-18-5.                                     NC2184.2 1952
   001948         195200 UST-FAIL-GF-18-5.                                                NC2184.2
   001949         195300     PERFORM FAIL                                                 NC2184.2 243
   001950         195400     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   001951         195500     MOVE    3 TO CORRECT-N.                                      NC2184.2 118
   001952         195600 UST-WRITE-GF-18-5.                                               NC2184.2
   001953         195700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001954         195800*                                                                 NC2184.2
   001955         195900 UST-TEST-GF-18-6.                                                NC2184.2
   001956         196000     ADD     1 TO REC-CT.                                         NC2184.2 139
   001957         196100     IF      ID5-XN-4-2 = SPACES  AND  ID6-DU-2V0-2 = 4           NC2184.2 80 IMP 83
   001958      1  196200             PERFORM PASS                                         NC2184.2 242
   001959      1  196300             GO TO UST-WRITE-GF-18-6                              NC2184.2 1969
   001960         196400     ELSE                                                         NC2184.2
   001961      1  196500             GO TO UST-FAIL-GF-18-6.                              NC2184.2 1965
   001962         196600 UST-DELETE-GF-18-6.                                              NC2184.2
   001963         196700     PERFORM DE-LETE.                                             NC2184.2 244
   001964         196800     GO TO UST-WRITE-GF-18-6.                                     NC2184.2 1969
   001965         196900 UST-FAIL-GF-18-6.                                                NC2184.2
   001966         197000     PERFORM FAIL                                                 NC2184.2 243
   001967         197100     MOVE    ID5-XN-4-2   TO COMPUTED-A                           NC2184.2 80 103
   001968         197200     MOVE    4 TO CORRECT-A.                                      NC2184.2 117
   001969         197300 UST-WRITE-GF-18-6.                                               NC2184.2
   001970         197400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001971         197500*                                                                 NC2184.2
   001972         197600 UST-INIT-GF-19.                                                  NC2184.2
   001973         197700     MOVE "UST-TEST-GF-19" TO PAR-NAME.                           NC2184.2 92
   001974         197800     MOVE "VI-135" TO ANSI-REFERENCE.                             NC2184.2 148
   001975         197900     MOVE "QUALIFIED ID1" TO FEATURE.                             NC2184.2 88
   001976         198000     MOVE "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" TO GRP1-XN-X-36. NC2184.2 50
   001977         198100     MOVE SPACES TO GRP4-XN-6.                                    NC2184.2 IMP 68
   001978         198200     MOVE "****" TO ID5-XN-4.                                     NC2184.2 79
   001979         198300     MOVE ZERO TO ID6-DU-2V0.                                     NC2184.2 IMP 82
   001980         198400     MOVE 1 TO ID10-DU-2V0.                                       NC2184.2 84
   001981         198500     MOVE ZERO TO ID11-DU-2V0.                                    NC2184.2 IMP 85
   001982         198600     MOVE 1 TO REC-CT.                                            NC2184.2 139
   001983         198700*                                                                 NC2184.2
   001984         198800 UST-TEST-GF-19-0.                                                NC2184.2
   001985         198900     UNSTRING ID1 OF GRP1-XN-X-36 (ID10-DU-2V0) INTO GRP4-XN-6    NC2184.2 51 50 84 68
   001986         199000             POINTER ID10-DU-2V0.                                 NC2184.2 84
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001987         199100     GO TO UST-TEST-GF-19-1.                                      NC2184.2 1993
   001988         199200 UST-DELETE-GF-19.                                                NC2184.2
   001989         199300     PERFORM DE-LETE.                                             NC2184.2 244
   001990         199400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   001991         199500     GO TO UST-INIT-GF-20.                                        NC2184.2 2043
   001992         199600*                                                                 NC2184.2
   001993         199700 UST-TEST-GF-19-1.                                                NC2184.2
   001994         199800     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   001995      1  199900             PERFORM PASS                                         NC2184.2 242
   001996      1  200000             GO TO UST-WRITE-GF-19-1                              NC2184.2 2006
   001997         200100     ELSE                                                         NC2184.2
   001998      1  200200             GO TO UST-FAIL-GF-19-1.                              NC2184.2 2002
   001999         200300 UST-DELETE-GF-19-1.                                              NC2184.2
   002000         200400     PERFORM DE-LETE.                                             NC2184.2 244
   002001         200500     GO TO UST-WRITE-GF-19-1.                                     NC2184.2 2006
   002002         200600 UST-FAIL-GF-19-1.                                                NC2184.2
   002003         200700     PERFORM FAIL                                                 NC2184.2 243
   002004         200800     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   002005         200900     MOVE    "ABCDEF" TO CORRECT-A.                               NC2184.2 117
   002006         201000 UST-WRITE-GF-19-1.                                               NC2184.2
   002007         201100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002008         201200*                                                                 NC2184.2
   002009         201300 UST-TEST-GF-19-2.                                                NC2184.2
   002010         201400     ADD     1 TO REC-CT.                                         NC2184.2 139
   002011         201500     IF      ID10-DU-2V0 = 7                                      NC2184.2 84
   002012      1  201600             PERFORM PASS                                         NC2184.2 242
   002013      1  201700             GO TO UST-WRITE-GF-19-2                              NC2184.2 2023
   002014         201800     ELSE                                                         NC2184.2
   002015      1  201900             GO TO UST-FAIL-GF-19-2.                              NC2184.2 2019
   002016         202000 UST-DELETE-GF-19-2.                                              NC2184.2
   002017         202100     PERFORM DE-LETE.                                             NC2184.2 244
   002018         202200     GO TO UST-WRITE-GF-19-2.                                     NC2184.2 2023
   002019         202300 UST-FAIL-GF-19-2.                                                NC2184.2
   002020         202400     PERFORM FAIL                                                 NC2184.2 243
   002021         202500     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   002022         202600     MOVE    7 TO CORRECT-N.                                      NC2184.2 118
   002023         202700 UST-WRITE-GF-19-2.                                               NC2184.2
   002024         202800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002025         202900*                                                                 NC2184.2
   002026         203000 UST-TEST-GF-19-3.                                                NC2184.2
   002027         203100     ADD     1 TO REC-CT.                                         NC2184.2 139
   002028         203200     IF      ID11-DU-2V0 = ZERO                                   NC2184.2 85 IMP
   002029      1  203300             PERFORM PASS                                         NC2184.2 242
   002030      1  203400             GO TO UST-WRITE-GF-19-3                              NC2184.2 2040
   002031         203500     ELSE                                                         NC2184.2
   002032      1  203600             GO TO UST-FAIL-GF-19-3.                              NC2184.2 2036
   002033         203700 UST-DELETE-GF-19-3.                                              NC2184.2
   002034         203800     PERFORM DE-LETE.                                             NC2184.2 244
   002035         203900     GO TO UST-WRITE-GF-19-3.                                     NC2184.2 2040
   002036         204000 UST-FAIL-GF-19-3.                                                NC2184.2
   002037         204100     PERFORM FAIL                                                 NC2184.2 243
   002038         204200     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   002039         204300     MOVE    ZERO TO CORRECT-N.                                   NC2184.2 IMP 118
   002040         204400 UST-WRITE-GF-19-3.                                               NC2184.2
   002041         204500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002042         204600*                                                                 NC2184.2
   002043         204700 UST-INIT-GF-20.                                                  NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002044         204800     MOVE    "UST-TEST-GF-20" TO PAR-NAME.                        NC2184.2 92
   002045         204900     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   002046         205000     MOVE    "MULT RECEIVE AREAS" TO FEATURE.                     NC2184.2 88
   002047         205100     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   002048         205200     MOVE    "****" TO ID4C-XXXX.                                 NC2184.2 71
   002049         205300     MOVE    "*" TO ID4D-X.                                       NC2184.2 72
   002050         205400     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002051         205500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002052         205600     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002053         205700     MOVE    1 TO ID11-DU-2V0.                                    NC2184.2 85
   002054         205800     MOVE    1 TO REC-CT.                                         NC2184.2 139
   002055         205900*                                                                 NC2184.2
   002056         206000 UST-TEST-GF-20.                                                  NC2184.2
   002057         206100     UNSTRING ID1 OF GRP1-XN-X-36 (ID11-DU-2V0)                   NC2184.2 51 50 85
   002058         206200              INTO ID4A-XXXXX ID4B-X ID4C-XXXX ID4D-X             NC2184.2 69 70 71 72
   002059         206300              TALLYING ID11-DU-2V0.                               NC2184.2 85
   002060         206400     GO TO UST-TEST-GF-20-1.                                      NC2184.2 2066
   002061         206500 UST-DELETE-GF-20.                                                NC2184.2
   002062         206600     PERFORM DE-LETE.                                             NC2184.2 244
   002063         206700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002064         206800     GO      TO UST-INIT-GF-21.                                   NC2184.2 2133
   002065         206900*                                                                 NC2184.2
   002066         207000 UST-TEST-GF-20-1.                                                NC2184.2
   002067         207100     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   002068      1  207200             PERFORM PASS                                         NC2184.2 242
   002069      1  207300             GO TO UST-WRITE-GF-20-1                              NC2184.2 2079
   002070         207400     ELSE                                                         NC2184.2
   002071      1  207500             GO TO UST-FAIL-GF-20-1.                              NC2184.2 2075
   002072         207600 UST-DELETE-GF-20-1.                                              NC2184.2
   002073         207700     PERFORM DE-LETE.                                             NC2184.2 244
   002074         207800     GO TO UST-WRITE-GF-20-1.                                     NC2184.2 2079
   002075         207900 UST-FAIL-GF-20-1.                                                NC2184.2
   002076         208000     PERFORM FAIL                                                 NC2184.2 243
   002077         208100     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   002078         208200     MOVE    "ABCDEF" TO CORRECT-A.                               NC2184.2 117
   002079         208300 UST-WRITE-GF-20-1.                                               NC2184.2
   002080         208400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002081         208500*                                                                 NC2184.2
   002082         208600 UST-TEST-GF-20-2.                                                NC2184.2
   002083         208700     ADD     1 TO REC-CT.                                         NC2184.2 139
   002084         208800     IF      ID4C-XXXX = "****"                                   NC2184.2 71
   002085      1  208900             PERFORM PASS                                         NC2184.2 242
   002086      1  209000             GO TO UST-WRITE-GF-20-2                              NC2184.2 2096
   002087         209100     ELSE                                                         NC2184.2
   002088      1  209200             GO TO UST-FAIL-GF-20-2.                              NC2184.2 2092
   002089         209300 UST-DELETE-GF-20-2.                                              NC2184.2
   002090         209400     PERFORM DE-LETE.                                             NC2184.2 244
   002091         209500     GO TO UST-WRITE-GF-20-2.                                     NC2184.2 2096
   002092         209600 UST-FAIL-GF-20-2.                                                NC2184.2
   002093         209700     PERFORM FAIL                                                 NC2184.2 243
   002094         209800     MOVE    ID4C-XXXX TO COMPUTED-A                              NC2184.2 71 103
   002095         209900     MOVE    "****" TO CORRECT-A.                                 NC2184.2 117
   002096         210000 UST-WRITE-GF-20-2.                                               NC2184.2
   002097         210100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002098         210200*                                                                 NC2184.2
   002099         210300 UST-TEST-GF-20-3.                                                NC2184.2
   002100         210400     ADD     1 TO REC-CT.                                         NC2184.2 139
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002101         210500     IF      ID4D-X = "*"                                         NC2184.2 72
   002102      1  210600             PERFORM PASS                                         NC2184.2 242
   002103      1  210700             GO TO UST-WRITE-GF-20-3                              NC2184.2 2113
   002104         210800     ELSE                                                         NC2184.2
   002105      1  210900             GO TO UST-FAIL-GF-20-3.                              NC2184.2 2109
   002106         211000 UST-DELETE-GF-20-3.                                              NC2184.2
   002107         211100     PERFORM DE-LETE.                                             NC2184.2 244
   002108         211200     GO TO UST-WRITE-GF-20-3.                                     NC2184.2 2113
   002109         211300 UST-FAIL-GF-20-3.                                                NC2184.2
   002110         211400     PERFORM FAIL                                                 NC2184.2 243
   002111         211500     MOVE    ID4D-X TO COMPUTED-A                                 NC2184.2 72 103
   002112         211600     MOVE    "*" TO CORRECT-A.                                    NC2184.2 117
   002113         211700 UST-WRITE-GF-20-3.                                               NC2184.2
   002114         211800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002115         211900*                                                                 NC2184.2
   002116         212000 UST-TEST-GF-20-4.                                                NC2184.2
   002117         212100     ADD     1 TO REC-CT.                                         NC2184.2 139
   002118         212200     IF      ID11-DU-2V0 = 3                                      NC2184.2 85
   002119      1  212300             PERFORM PASS                                         NC2184.2 242
   002120      1  212400             GO TO UST-WRITE-GF-20-4                              NC2184.2 2130
   002121         212500     ELSE                                                         NC2184.2
   002122      1  212600             GO TO UST-FAIL-GF-20-4.                              NC2184.2 2126
   002123         212700 UST-DELETE-GF-20-4.                                              NC2184.2
   002124         212800     PERFORM DE-LETE.                                             NC2184.2 244
   002125         212900     GO TO UST-WRITE-GF-20-4.                                     NC2184.2 2130
   002126         213000 UST-FAIL-GF-20-4.                                                NC2184.2
   002127         213100     PERFORM FAIL                                                 NC2184.2 243
   002128         213200     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   002129         213300     MOVE    3 TO CORRECT-N.                                      NC2184.2 118
   002130         213400 UST-WRITE-GF-20-4.                                               NC2184.2
   002131         213500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002132         213600*                                                                 NC2184.2
   002133         213700 UST-INIT-GF-21.                                                  NC2184.2
   002134         213800     MOVE    "UST-TEST-GF-21" TO PAR-NAME.                        NC2184.2 92
   002135         213900     MOVE    "VI-135" TO ANSI-REFERENCE.                          NC2184.2 148
   002136         214000     MOVE    "TRUNCATION CHECKS" TO FEATURE.                      NC2184.2 88
   002137         214100     MOVE    "ABCDEFGHIJKL" TO ID1-XN-12.                         NC2184.2 47
   002138         214200     MOVE    ALL "*" TO GRP4-XN-10.                               NC2184.2 73
   002139         214300     MOVE    1 TO  ID11-DU-2V0.                                   NC2184.2 85
   002140         214400     MOVE    1 TO REC-CT.                                         NC2184.2 139
   002141         214500*                                                                 NC2184.2
   002142         214600 UST-TEST-GF-21.                                                  NC2184.2
   002143         214700     UNSTRING ID1-XN-12                                           NC2184.2 47
   002144         214800             DELIMITED BY "E" OR "H" OR "K" OR "L"                NC2184.2
   002145         214900             INTO ID4C-XXX ID4B-XX ID4A-X                         NC2184.2 76 75 74
   002146         215000             TALLYING IN ID11-DU-2V0.                             NC2184.2 85
   002147         215100     GO      TO UST-TEST-GF-21-1.                                 NC2184.2 2153
   002148         215200 UNSTRING-DELETE.                                                 NC2184.2
   002149         215300     PERFORM  DE-LETE.                                            NC2184.2 244
   002150         215400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002151         215500     GO TO UST-INIT-GF-22.                                        NC2184.2 2220
   002152         215600*                                                                 NC2184.2
   002153         215700 UST-TEST-GF-21-1.                                                NC2184.2
   002154         215800     IF      ID4C-XXX = "ABC"                                     NC2184.2 76
   002155      1  215900             PERFORM PASS                                         NC2184.2 242
   002156      1  216000             GO TO UST-WRITE-GF-21-1                              NC2184.2 2166
   002157         216100     ELSE                                                         NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002158      1  216200             GO TO UST-FAIL-GF-21-1.                              NC2184.2 2162
   002159         216300 UST-DELETE-GF-21-1.                                              NC2184.2
   002160         216400     PERFORM DE-LETE.                                             NC2184.2 244
   002161         216500     GO TO UST-WRITE-GF-21-1.                                     NC2184.2 2166
   002162         216600 UST-FAIL-GF-21-1.                                                NC2184.2
   002163         216700     PERFORM FAIL                                                 NC2184.2 243
   002164         216800     MOVE    ID4C-XXX TO COMPUTED-A                               NC2184.2 76 103
   002165         216900     MOVE    "ABC" TO CORRECT-A.                                  NC2184.2 117
   002166         217000 UST-WRITE-GF-21-1.                                               NC2184.2
   002167         217100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002168         217200*                                                                 NC2184.2
   002169         217300 UST-TEST-GF-21-2.                                                NC2184.2
   002170         217400     ADD     1 TO REC-CT.                                         NC2184.2 139
   002171         217500     IF      ID4B-XX = "FG"                                       NC2184.2 75
   002172      1  217600             PERFORM PASS                                         NC2184.2 242
   002173      1  217700             GO TO UST-WRITE-GF-21-2                              NC2184.2 2183
   002174         217800     ELSE                                                         NC2184.2
   002175      1  217900             GO TO UST-FAIL-GF-21-2.                              NC2184.2 2179
   002176         218000 UST-DELETE-GF-21-2.                                              NC2184.2
   002177         218100     PERFORM DE-LETE.                                             NC2184.2 244
   002178         218200     GO TO UST-WRITE-GF-21-2.                                     NC2184.2 2183
   002179         218300 UST-FAIL-GF-21-2.                                                NC2184.2
   002180         218400     PERFORM FAIL                                                 NC2184.2 243
   002181         218500     MOVE    ID4B-XX  TO COMPUTED-A                               NC2184.2 75 103
   002182         218600     MOVE    "FG" TO CORRECT-A.                                   NC2184.2 117
   002183         218700 UST-WRITE-GF-21-2.                                               NC2184.2
   002184         218800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002185         218900*                                                                 NC2184.2
   002186         219000 UST-TEST-GF-21-3.                                                NC2184.2
   002187         219100     ADD     1 TO REC-CT.                                         NC2184.2 139
   002188         219200     IF      ID4A-X = "I"                                         NC2184.2 74
   002189      1  219300             PERFORM PASS                                         NC2184.2 242
   002190      1  219400             GO TO UST-WRITE-GF-21-3                              NC2184.2 2200
   002191         219500     ELSE                                                         NC2184.2
   002192      1  219600             GO TO UST-FAIL-GF-21-3.                              NC2184.2 2196
   002193         219700 UST-DELETE-GF-21-3.                                              NC2184.2
   002194         219800     PERFORM DE-LETE.                                             NC2184.2 244
   002195         219900     GO TO UST-WRITE-GF-21-3.                                     NC2184.2 2200
   002196         220000 UST-FAIL-GF-21-3.                                                NC2184.2
   002197         220100     PERFORM FAIL                                                 NC2184.2 243
   002198         220200     MOVE    ID4A-X   TO COMPUTED-A                               NC2184.2 74 103
   002199         220300     MOVE    "I" TO CORRECT-A.                                    NC2184.2 117
   002200         220400 UST-WRITE-GF-21-3.                                               NC2184.2
   002201         220500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002202         220600*                                                                 NC2184.2
   002203         220700 UST-TEST-GF-21-4.                                                NC2184.2
   002204         220800     ADD     1 TO REC-CT.                                         NC2184.2 139
   002205         220900     IF       ID11-DU-2V0 = 4                                     NC2184.2 85
   002206      1  221000             PERFORM PASS                                         NC2184.2 242
   002207      1  221100             GO TO UST-WRITE-GF-21-4                              NC2184.2 2217
   002208         221200     ELSE                                                         NC2184.2
   002209      1  221300             GO TO UST-FAIL-GF-21-4.                              NC2184.2 2213
   002210         221400 UST-DELETE-GF-21-4.                                              NC2184.2
   002211         221500     PERFORM DE-LETE.                                             NC2184.2 244
   002212         221600     GO TO UST-WRITE-GF-21-4.                                     NC2184.2 2217
   002213         221700 UST-FAIL-GF-21-4.                                                NC2184.2
   002214         221800     PERFORM FAIL                                                 NC2184.2 243
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    42
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002215         221900     MOVE     ID11-DU-2V0 TO COMPUTED-N                           NC2184.2 85 104
   002216         222000     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   002217         222100 UST-WRITE-GF-21-4.                                               NC2184.2
   002218         222200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002219         222300*                                                                 NC2184.2
   002220         222400 UST-INIT-GF-22.                                                  NC2184.2
   002221         222500*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2184.2
   002222         222600     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
   002223         222700     MOVE   "UST-TEST-GF-22" TO PAR-NAME.                         NC2184.2 92
   002224         222800     MOVE   "PIC X " TO FEATURE.                                  NC2184.2 88
   002225         222900     MOVE    ZERO TO ID4-X.                                       NC2184.2 IMP 58
   002226         223000     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002227         223100     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002228         223200     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002229         223300     MOVE ZERO TO ID11-DU-2V0.                                    NC2184.2 IMP 85
   002230         223400     MOVE    1 TO REC-CT.                                         NC2184.2 139
   002231         223500*                                                                 NC2184.2
   002232         223600 UST-TEST-GF-22-1.                                                NC2184.2
   002233         223700     UNSTRING ID1-XN-7 DELIMITED BY ZERO INTO ID4-X DELIMITER IN  NC2184.2 44 IMP 58
   002234         223800             ID5-XN-4 COUNT IN ID6-DU-2V0 WITH POINTER ID10-DU-2V0NC2184.2 79 82 84
   002235         223900             TALLYING ID11-DU-2V0                                 NC2184.2 85
   002236      1  224000         NOT ON OVERFLOW  GO TO UST-FAIL-GF-22-1.                 NC2184.2 2243
   002237         224100     PERFORM PASS.                                                NC2184.2 242
   002238         224200     GO TO UST-WRITE-GF-22-1.                                     NC2184.2 2246
   002239         224300 UST-DELETE-GF-22-1.                                              NC2184.2
   002240         224400     PERFORM DE-LETE.                                             NC2184.2 244
   002241         224500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002242         224600     GO TO   UST-INIT-GF-23.                                      NC2184.2 2334
   002243         224700 UST-FAIL-GF-22-1.                                                NC2184.2
   002244         224800     PERFORM FAIL.                                                NC2184.2 243
   002245         224900     MOVE   "NOT ON OVERFLOW SHOULD NOT HAVE EXECUTED" TO RE-MARK.NC2184.2 97
   002246         225000 UST-WRITE-GF-22-1.                                               NC2184.2
   002247         225100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002248         225200*                                                                 NC2184.2
   002249         225300 UST-TEST-GF-22-2.                                                NC2184.2
   002250         225400     ADD     1 TO REC-CT.                                         NC2184.2 139
   002251         225500     IF      ID4-X = "1"                                          NC2184.2 58
   002252      1  225600             PERFORM PASS                                         NC2184.2 242
   002253      1  225700             GO TO UST-WRITE-GF-22-2                              NC2184.2 2263
   002254         225800     ELSE                                                         NC2184.2
   002255      1  225900             GO TO UST-FAIL-GF-22-2.                              NC2184.2 2259
   002256         226000 UST-DELETE-GF-22-2.                                              NC2184.2
   002257         226100     PERFORM DE-LETE.                                             NC2184.2 244
   002258         226200     GO TO UST-WRITE-GF-22-2.                                     NC2184.2 2263
   002259         226300 UST-FAIL-GF-22-2.                                                NC2184.2
   002260         226400     PERFORM FAIL                                                 NC2184.2 243
   002261         226500     MOVE    ID4-X TO COMPUTED-A                                  NC2184.2 58 103
   002262         226600     MOVE    "1" TO CORRECT-A.                                    NC2184.2 117
   002263         226700 UST-WRITE-GF-22-2.                                               NC2184.2
   002264         226800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002265         226900*                                                                 NC2184.2
   002266         227000 UST-TEST-GF-22-3.                                                NC2184.2
   002267         227100     ADD     1 TO REC-CT.                                         NC2184.2 139
   002268         227200     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   002269      1  227300             PERFORM PASS                                         NC2184.2 242
   002270      1  227400             GO TO UST-WRITE-GF-22-3                              NC2184.2 2280
   002271         227500     ELSE                                                         NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    43
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002272      1  227600             GO TO UST-FAIL-GF-22-3.                              NC2184.2 2276
   002273         227700 UST-DELETE-GF-22-3.                                              NC2184.2
   002274         227800     PERFORM DE-LETE.                                             NC2184.2 244
   002275         227900     GO TO UST-WRITE-GF-22-3.                                     NC2184.2 2280
   002276         228000 UST-FAIL-GF-22-3.                                                NC2184.2
   002277         228100     PERFORM FAIL                                                 NC2184.2 243
   002278         228200     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   002279         228300     MOVE   "0   " TO CORRECT-A.                                  NC2184.2 117
   002280         228400 UST-WRITE-GF-22-3.                                               NC2184.2
   002281         228500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002282         228600*                                                                 NC2184.2
   002283         228700 UST-TEST-GF-22-4.                                                NC2184.2
   002284         228800     ADD     1 TO REC-CT.                                         NC2184.2 139
   002285         228900     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   002286      1  229000             PERFORM PASS                                         NC2184.2 242
   002287      1  229100             GO TO UST-WRITE-GF-22-4                              NC2184.2 2297
   002288         229200     ELSE                                                         NC2184.2
   002289      1  229300             GO TO UST-FAIL-GF-22-4.                              NC2184.2 2293
   002290         229400 UST-DELETE-GF-22-4.                                              NC2184.2
   002291         229500     PERFORM DE-LETE.                                             NC2184.2 244
   002292         229600     GO TO UST-WRITE-GF-22-4.                                     NC2184.2 2297
   002293         229700 UST-FAIL-GF-22-4.                                                NC2184.2
   002294         229800     PERFORM FAIL                                                 NC2184.2 243
   002295         229900     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   002296         230000     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   002297         230100 UST-WRITE-GF-22-4.                                               NC2184.2
   002298         230200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002299         230300*                                                                 NC2184.2
   002300         230400 UST-TEST-GF-22-5.                                                NC2184.2
   002301         230500     ADD     1 TO REC-CT.                                         NC2184.2 139
   002302         230600     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   002303      1  230700             PERFORM PASS                                         NC2184.2 242
   002304      1  230800             GO TO UST-WRITE-GF-22-5                              NC2184.2 2314
   002305         230900     ELSE                                                         NC2184.2
   002306      1  231000             GO TO UST-FAIL-GF-22-5.                              NC2184.2 2310
   002307         231100 UST-DELETE-GF-22-5.                                              NC2184.2
   002308         231200     PERFORM DE-LETE.                                             NC2184.2 244
   002309         231300     GO TO UST-WRITE-GF-22-5.                                     NC2184.2 2314
   002310         231400 UST-FAIL-GF-22-5.                                                NC2184.2
   002311         231500     PERFORM FAIL                                                 NC2184.2 243
   002312         231600     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   002313         231700     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   002314         231800 UST-WRITE-GF-22-5.                                               NC2184.2
   002315         231900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002316         232000*                                                                 NC2184.2
   002317         232100 UST-TEST-GF-22-6.                                                NC2184.2
   002318         232200     ADD     1 TO REC-CT.                                         NC2184.2 139
   002319         232300     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   002320      1  232400             PERFORM PASS                                         NC2184.2 242
   002321      1  232500             GO TO UST-WRITE-GF-22-6                              NC2184.2 2331
   002322         232600     ELSE                                                         NC2184.2
   002323      1  232700             GO TO UST-FAIL-GF-22-6.                              NC2184.2 2327
   002324         232800 UST-DELETE-GF-22-6.                                              NC2184.2
   002325         232900     PERFORM DE-LETE.                                             NC2184.2 244
   002326         233000     GO TO UST-WRITE-GF-22-6.                                     NC2184.2 2331
   002327         233100 UST-FAIL-GF-22-6.                                                NC2184.2
   002328         233200     PERFORM FAIL                                                 NC2184.2 243
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    44
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002329         233300     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   002330         233400     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   002331         233500 UST-WRITE-GF-22-6.                                               NC2184.2
   002332         233600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002333         233700*                                                                 NC2184.2
   002334         233800 UST-INIT-GF-23.                                                  NC2184.2
   002335         233900*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2184.2
   002336         234000     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
   002337         234100     MOVE   "UST-TEST-GF-23" TO PAR-NAME.                         NC2184.2 92
   002338         234200     MOVE   "OVERFLOW TEST" TO FEATURE.                           NC2184.2 88
   002339         234300     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   002340         234400     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002341         234500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002342         234600     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002343         234700     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   002344         234800     MOVE    1 TO REC-CT.                                         NC2184.2 139
   002345         234900*                                                                 NC2184.2
   002346         235000 UST-TEST-GF-23-1.                                                NC2184.2
   002347         235100     UNSTRING GRP1-XN-6  INTO ID4A-XXXXX ID4B-X                   NC2184.2 43 69 70

 ==002347==> IGYPG3230-W An overflow condition will never occur in the "UNSTRING" statement.

   002348      1  235200         NOT ON OVERFLOW PERFORM PASS                             NC2184.2 242
   002349      1  235300                         GO TO UST-WRITE-GF-23-1.                 NC2184.2 2358
   002350         235400     GO TO   UST-FAIL-GF-23-1.                                    NC2184.2 2355
   002351         235500 UST-DELETE-GF-23-1.                                              NC2184.2
   002352         235600     PERFORM DE-LETE.                                             NC2184.2 244
   002353         235700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002354         235800     GO      TO UST-INIT-GF-24.                                   NC2184.2 2378
   002355         235900 UST-FAIL-GF-23-1.                                                NC2184.2
   002356         236000     PERFORM FAIL.                                                NC2184.2 243
   002357         236100     MOVE    "OVERFLOW SHOULD NOT HAVE OCCURED" TO RE-MARK.       NC2184.2 97
   002358         236200 UST-WRITE-GF-23-1.                                               NC2184.2
   002359         236300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002360         236400*                                                                 NC2184.2
   002361         236500 UST-TEST-GF-23-2.                                                NC2184.2
   002362         236600     ADD     1 TO REC-CT.                                         NC2184.2 139
   002363         236700     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   002364      1  236800             PERFORM PASS                                         NC2184.2 242
   002365      1  236900             GO TO UST-WRITE-GF-23-2                              NC2184.2 2375
   002366         237000     ELSE                                                         NC2184.2
   002367      1  237100             GO TO UST-FAIL-GF-23-2.                              NC2184.2 2371
   002368         237200 UST-DELETE-GF-23-2.                                              NC2184.2
   002369         237300     PERFORM DE-LETE.                                             NC2184.2 244
   002370         237400     GO TO UST-WRITE-GF-23-2.                                     NC2184.2 2375
   002371         237500 UST-FAIL-GF-23-2.                                                NC2184.2
   002372         237600     PERFORM FAIL                                                 NC2184.2 243
   002373         237700     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   002374         237800     MOVE   "ABCDEF" TO CORRECT-A.                                NC2184.2 117
   002375         237900 UST-WRITE-GF-23-2.                                               NC2184.2
   002376         238000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002377         238100*                                                                 NC2184.2
   002378         238200 UST-INIT-GF-24.                                                  NC2184.2
   002379         238300*    ===-->  BOTH "OVERFLOW" PHRASES  <--===                      NC2184.2
   002380         238400     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
   002381         238500     MOVE   "UST-TEST-GF-24" TO PAR-NAME.                         NC2184.2 92
   002382         238600     MOVE   "PIC X " TO FEATURE.                                  NC2184.2 88
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    45
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002383         238700     MOVE    ZERO TO ID4-X.                                       NC2184.2 IMP 58
   002384         238800     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002385         238900     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002386         239000     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002387         239100     MOVE ZERO TO ID11-DU-2V0.                                    NC2184.2 IMP 85
   002388         239200     MOVE    1 TO REC-CT.                                         NC2184.2 139
   002389         239300*                                                                 NC2184.2
   002390         239400 UST-TEST-GF-24-1.                                                NC2184.2
   002391         239500     UNSTRING ID1-XN-7 DELIMITED BY ZERO INTO ID4-X               NC2184.2 44 IMP 58
   002392         239600             DELIMITER IN ID5-XN-4                                NC2184.2 79
   002393         239700             COUNT IN ID6-DU-2V0                                  NC2184.2 82
   002394         239800             WITH POINTER ID10-DU-2V0                             NC2184.2 84
   002395         239900             TALLYING ID11-DU-2V0                                 NC2184.2 85
   002396      1  240000             ON OVERFLOW  PERFORM PASS                            NC2184.2 242
   002397      1  240100                          GO TO UST-WRITE-GF-24-1                 NC2184.2 2406
   002398      1  240200         NOT ON OVERFLOW  GO TO UST-FAIL-GF-24-1.                 NC2184.2 2403
   002399         240300 UST-DELETE-GF-24-1.                                              NC2184.2
   002400         240400     PERFORM DE-LETE.                                             NC2184.2 244
   002401         240500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002402         240600     GO TO   UST-INIT-GF-25.                                      NC2184.2 2494
   002403         240700 UST-FAIL-GF-24-1.                                                NC2184.2
   002404         240800     PERFORM FAIL.                                                NC2184.2 243
   002405         240900     MOVE   "ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK.        NC2184.2 97
   002406         241000 UST-WRITE-GF-24-1.                                               NC2184.2
   002407         241100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002408         241200*                                                                 NC2184.2
   002409         241300 UST-TEST-GF-24-2.                                                NC2184.2
   002410         241400     ADD     1 TO REC-CT.                                         NC2184.2 139
   002411         241500     IF      ID4-X = "1"                                          NC2184.2 58
   002412      1  241600             PERFORM PASS                                         NC2184.2 242
   002413      1  241700             GO TO UST-WRITE-GF-24-2                              NC2184.2 2423
   002414         241800     ELSE                                                         NC2184.2
   002415      1  241900             GO TO UST-FAIL-GF-24-2.                              NC2184.2 2419
   002416         242000 UST-DELETE-GF-24-2.                                              NC2184.2
   002417         242100     PERFORM DE-LETE.                                             NC2184.2 244
   002418         242200     GO TO UST-WRITE-GF-24-2.                                     NC2184.2 2423
   002419         242300 UST-FAIL-GF-24-2.                                                NC2184.2
   002420         242400     PERFORM FAIL                                                 NC2184.2 243
   002421         242500     MOVE    ID4-X TO COMPUTED-A                                  NC2184.2 58 103
   002422         242600     MOVE    "1" TO CORRECT-A.                                    NC2184.2 117
   002423         242700 UST-WRITE-GF-24-2.                                               NC2184.2
   002424         242800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002425         242900*                                                                 NC2184.2
   002426         243000 UST-TEST-GF-24-3.                                                NC2184.2
   002427         243100     ADD     1 TO REC-CT.                                         NC2184.2 139
   002428         243200     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   002429      1  243300             PERFORM PASS                                         NC2184.2 242
   002430      1  243400             GO TO UST-WRITE-GF-24-3                              NC2184.2 2440
   002431         243500     ELSE                                                         NC2184.2
   002432      1  243600             GO TO UST-FAIL-GF-24-3.                              NC2184.2 2436
   002433         243700 UST-DELETE-GF-24-3.                                              NC2184.2
   002434         243800     PERFORM DE-LETE.                                             NC2184.2 244
   002435         243900     GO TO UST-WRITE-GF-24-3.                                     NC2184.2 2440
   002436         244000 UST-FAIL-GF-24-3.                                                NC2184.2
   002437         244100     PERFORM FAIL                                                 NC2184.2 243
   002438         244200     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   002439         244300     MOVE   "0   " TO CORRECT-A.                                  NC2184.2 117
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    46
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002440         244400 UST-WRITE-GF-24-3.                                               NC2184.2
   002441         244500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002442         244600*                                                                 NC2184.2
   002443         244700 UST-TEST-GF-24-4.                                                NC2184.2
   002444         244800     ADD     1 TO REC-CT.                                         NC2184.2 139
   002445         244900     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   002446      1  245000             PERFORM PASS                                         NC2184.2 242
   002447      1  245100             GO TO UST-WRITE-GF-24-4                              NC2184.2 2457
   002448         245200     ELSE                                                         NC2184.2
   002449      1  245300             GO TO UST-FAIL-GF-24-4.                              NC2184.2 2453
   002450         245400 UST-DELETE-GF-24-4.                                              NC2184.2
   002451         245500     PERFORM DE-LETE.                                             NC2184.2 244
   002452         245600     GO TO UST-WRITE-GF-24-4.                                     NC2184.2 2457
   002453         245700 UST-FAIL-GF-24-4.                                                NC2184.2
   002454         245800     PERFORM FAIL                                                 NC2184.2 243
   002455         245900     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   002456         246000     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   002457         246100 UST-WRITE-GF-24-4.                                               NC2184.2
   002458         246200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002459         246300*                                                                 NC2184.2
   002460         246400 UST-TEST-GF-24-5.                                                NC2184.2
   002461         246500     ADD     1 TO REC-CT.                                         NC2184.2 139
   002462         246600     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   002463      1  246700             PERFORM PASS                                         NC2184.2 242
   002464      1  246800             GO TO UST-WRITE-GF-24-5                              NC2184.2 2474
   002465         246900     ELSE                                                         NC2184.2
   002466      1  247000             GO TO UST-FAIL-GF-24-5.                              NC2184.2 2470
   002467         247100 UST-DELETE-GF-24-5.                                              NC2184.2
   002468         247200     PERFORM DE-LETE.                                             NC2184.2 244
   002469         247300     GO TO UST-WRITE-GF-24-5.                                     NC2184.2 2474
   002470         247400 UST-FAIL-GF-24-5.                                                NC2184.2
   002471         247500     PERFORM FAIL                                                 NC2184.2 243
   002472         247600     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   002473         247700     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   002474         247800 UST-WRITE-GF-24-5.                                               NC2184.2
   002475         247900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002476         248000*                                                                 NC2184.2
   002477         248100 UST-TEST-GF-24-6.                                                NC2184.2
   002478         248200     ADD     1 TO REC-CT.                                         NC2184.2 139
   002479         248300     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   002480      1  248400             PERFORM PASS                                         NC2184.2 242
   002481      1  248500             GO TO UST-WRITE-GF-24-6                              NC2184.2 2491
   002482         248600     ELSE                                                         NC2184.2
   002483      1  248700             GO TO UST-FAIL-GF-24-6.                              NC2184.2 2487
   002484         248800 UST-DELETE-GF-24-6.                                              NC2184.2
   002485         248900     PERFORM DE-LETE.                                             NC2184.2 244
   002486         249000     GO TO UST-WRITE-GF-24-6.                                     NC2184.2 2491
   002487         249100 UST-FAIL-GF-24-6.                                                NC2184.2
   002488         249200     PERFORM FAIL                                                 NC2184.2 243
   002489         249300     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   002490         249400     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   002491         249500 UST-WRITE-GF-24-6.                                               NC2184.2
   002492         249600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002493         249700*                                                                 NC2184.2
   002494         249800 UST-INIT-GF-25.                                                  NC2184.2
   002495         249900*    ===-->  BOTH "OVERFLOW" PHRASES  <--===                      NC2184.2
   002496         250000     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    47
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002497         250100     MOVE   "UST-TEST-GF-25" TO PAR-NAME.                         NC2184.2 92
   002498         250200     MOVE   "OVERFLOW TEST" TO FEATURE.                           NC2184.2 88
   002499         250300     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   002500         250400     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002501         250500     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002502         250600     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002503         250700     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   002504         250800     MOVE    1 TO REC-CT.                                         NC2184.2 139
   002505         250900*                                                                 NC2184.2
   002506         251000 UST-TEST-GF-25-1.                                                NC2184.2
   002507         251100     UNSTRING GRP1-XN-6  INTO ID4A-XXXXX ID4B-X                   NC2184.2 43 69 70

 ==002507==> IGYPG3230-W An overflow condition will never occur in the "UNSTRING" statement.

   002508      1  251200             ON OVERFLOW GO TO UST-FAIL-GF-25-1                   NC2184.2 2515
   002509      1  251300         NOT ON OVERFLOW PERFORM PASS                             NC2184.2 242
   002510      1  251400                         GO TO UST-WRITE-GF-25-1.                 NC2184.2 2518
   002511         251500 UST-DELETE-GF-25-1.                                              NC2184.2
   002512         251600     PERFORM DE-LETE.                                             NC2184.2 244
   002513         251700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002514         251800     GO      TO UST-INIT-GF-26.                                   NC2184.2 2538
   002515         251900 UST-FAIL-GF-25-1.                                                NC2184.2
   002516         252000     PERFORM FAIL.                                                NC2184.2 243
   002517         252100     MOVE    "ON OVERFLOW SHOULD NOT HAVE EXECUTED" TO RE-MARK.   NC2184.2 97
   002518         252200 UST-WRITE-GF-25-1.                                               NC2184.2
   002519         252300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002520         252400*                                                                 NC2184.2
   002521         252500 UST-TEST-GF-25-2.                                                NC2184.2
   002522         252600     ADD     1 TO REC-CT.                                         NC2184.2 139
   002523         252700     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   002524      1  252800             PERFORM PASS                                         NC2184.2 242
   002525      1  252900             GO TO UST-WRITE-GF-25-2                              NC2184.2 2535
   002526         253000     ELSE                                                         NC2184.2
   002527      1  253100             GO TO UST-FAIL-GF-25-2.                              NC2184.2 2531
   002528         253200 UST-DELETE-GF-25-2.                                              NC2184.2
   002529         253300     PERFORM DE-LETE.                                             NC2184.2 244
   002530         253400     GO TO UST-WRITE-GF-25-2.                                     NC2184.2 2535
   002531         253500 UST-FAIL-GF-25-2.                                                NC2184.2
   002532         253600     PERFORM FAIL                                                 NC2184.2 243
   002533         253700     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   002534         253800     MOVE   "ABCDEF" TO CORRECT-A.                                NC2184.2 117
   002535         253900 UST-WRITE-GF-25-2.                                               NC2184.2
   002536         254000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002537         254100*                                                                 NC2184.2
   002538         254200 UST-INIT-GF-26.                                                  NC2184.2
   002539         254300*    ===-->  EXPLICIT SCOPE TERMINATOR  <--===                    NC2184.2
   002540         254400     MOVE   "VI-138 6.26.4 GR19" TO ANSI-REFERENCE.               NC2184.2 148
   002541         254500     MOVE   "ABCDEF" TO GRP1-XN-6.                                NC2184.2 43
   002542         254600     MOVE    SPACE TO WRK-XN-00001-1.                             NC2184.2 IMP 39
   002543         254700     MOVE    SPACE TO WRK-XN-00001-2.                             NC2184.2 IMP 40
   002544         254800     MOVE    SPACE TO WRK-XN-00001-3.                             NC2184.2 IMP 41
   002545         254900     MOVE    ZERO TO REC-CT.                                      NC2184.2 IMP 139
   002546         255000*                                                                 NC2184.2
   002547         255100 UST-TEST-GF-26-0.                                                NC2184.2
   002548         255200     UNSTRING GRP1-XN-6  INTO ID4A-XXXXX ID4B-X                   NC2184.2 43 69 70

 ==002548==> IGYPG3230-W An overflow condition will never occur in the "UNSTRING" statement.
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    48
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0
   002549         255300             ON OVERFLOW                                          NC2184.2
   002550      1  255400                     MOVE "A" TO WRK-XN-00001-1                   NC2184.2 39
   002551      1  255500                     MOVE "B" TO WRK-XN-00001-2                   NC2184.2 40
   002552         255600         NOT ON OVERFLOW                                          NC2184.2
   002553      1  255700                     MOVE "C" TO WRK-XN-00001-1                   NC2184.2 39
   002554      1  255800                     MOVE "D" TO WRK-XN-00001-2                   NC2184.2 40
   002555         255900     END-UNSTRING                                                 NC2184.2
   002556         256000     MOVE   "Z"  TO WRK-XN-00001-3.                               NC2184.2 41
   002557         256100     GO TO   UST-TEST-GF-26-1.                                    NC2184.2 2563
   002558         256200 UST-DELETE-GF-26.                                                NC2184.2
   002559         256300     PERFORM DE-LETE.                                             NC2184.2 244
   002560         256400     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002561         256500     GO      TO UST-INIT-GF-27.                                   NC2184.2 2634
   002562         256600*                                                                 NC2184.2
   002563         256700 UST-TEST-GF-26-1.                                                NC2184.2
   002564         256800     ADD     1 TO REC-CT.                                         NC2184.2 139
   002565         256900     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   002566      1  257000             PERFORM PASS                                         NC2184.2 242
   002567      1  257100             GO TO UST-WRITE-GF-26-1                              NC2184.2 2577
   002568         257200     ELSE                                                         NC2184.2
   002569      1  257300             GO TO UST-FAIL-GF-26-1.                              NC2184.2 2573
   002570         257400 UST-DELETE-GF-26-1.                                              NC2184.2
   002571         257500     PERFORM DE-LETE.                                             NC2184.2 244
   002572         257600     GO TO UST-WRITE-GF-26-1.                                     NC2184.2 2577
   002573         257700 UST-FAIL-GF-26-1.                                                NC2184.2
   002574         257800     PERFORM FAIL                                                 NC2184.2 243
   002575         257900     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   002576         258000     MOVE   "ABCDEF" TO CORRECT-A.                                NC2184.2 117
   002577         258100 UST-WRITE-GF-26-1.                                               NC2184.2
   002578         258200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002579         258300*                                                                 NC2184.2
   002580         258400 UST-TEST-GF-26-2.                                                NC2184.2
   002581         258500     ADD     1 TO REC-CT.                                         NC2184.2 139
   002582         258600     IF      WRK-XN-00001-1 = "C"                                 NC2184.2 39
   002583      1  258700             PERFORM PASS                                         NC2184.2 242
   002584      1  258800             GO TO UST-WRITE-GF-26-2                              NC2184.2 2595
   002585         258900     ELSE                                                         NC2184.2
   002586      1  259000             GO TO UST-FAIL-GF-26-2.                              NC2184.2 2590
   002587         259100 UST-DELETE-GF-26-2.                                              NC2184.2
   002588         259200     PERFORM DE-LETE.                                             NC2184.2 244
   002589         259300     GO TO UST-WRITE-GF-26-2.                                     NC2184.2 2595
   002590         259400 UST-FAIL-GF-26-2.                                                NC2184.2
   002591         259500     MOVE    WRK-XN-00001-1 TO COMPUTED-A                         NC2184.2 39 103
   002592         259600     MOVE   "C" TO CORRECT-A.                                     NC2184.2 117
   002593         259700     MOVE   "NOT ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK     NC2184.2 97
   002594         259800     PERFORM FAIL.                                                NC2184.2 243
   002595         259900 UST-WRITE-GF-26-2.                                               NC2184.2
   002596         260000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002597         260100*                                                                 NC2184.2
   002598         260200 UST-TEST-GF-26-3.                                                NC2184.2
   002599         260300     ADD     1 TO REC-CT.                                         NC2184.2 139
   002600         260400     IF      WRK-XN-00001-2 = "D"                                 NC2184.2 40
   002601      1  260500             PERFORM PASS                                         NC2184.2 242
   002602      1  260600             GO TO UST-WRITE-GF-26-3                              NC2184.2 2613
   002603         260700     ELSE                                                         NC2184.2
   002604      1  260800             GO TO UST-FAIL-GF-26-3.                              NC2184.2 2608
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    49
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002605         260900 UST-DELETE-GF-26-3.                                              NC2184.2
   002606         261000     PERFORM DE-LETE.                                             NC2184.2 244
   002607         261100     GO TO UST-WRITE-GF-26-3.                                     NC2184.2 2613
   002608         261200 UST-FAIL-GF-26-3.                                                NC2184.2
   002609         261300     MOVE    WRK-XN-00001-2 TO COMPUTED-A                         NC2184.2 40 103
   002610         261400     MOVE   "D" TO CORRECT-A.                                     NC2184.2 117
   002611         261500     MOVE   "NOT ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK     NC2184.2 97
   002612         261600     PERFORM FAIL.                                                NC2184.2 243
   002613         261700 UST-WRITE-GF-26-3.                                               NC2184.2
   002614         261800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002615         261900*                                                                 NC2184.2
   002616         262000 UST-TEST-GF-26-4.                                                NC2184.2
   002617         262100     ADD     1 TO REC-CT.                                         NC2184.2 139
   002618         262200     IF      WRK-XN-00001-3 = "Z"                                 NC2184.2 41
   002619      1  262300             PERFORM PASS                                         NC2184.2 242
   002620      1  262400             GO TO UST-WRITE-GF-26-4                              NC2184.2 2631
   002621         262500     ELSE                                                         NC2184.2
   002622      1  262600             GO TO UST-FAIL-GF-26-4.                              NC2184.2 2626
   002623         262700 UST-DELETE-GF-26-4.                                              NC2184.2
   002624         262800     PERFORM DE-LETE.                                             NC2184.2 244
   002625         262900     GO TO UST-WRITE-GF-26-4.                                     NC2184.2 2631
   002626         263000 UST-FAIL-GF-26-4.                                                NC2184.2
   002627         263100     MOVE    WRK-XN-00001-3 TO COMPUTED-A                         NC2184.2 41 103
   002628         263200     MOVE   "Z" TO CORRECT-A.                                     NC2184.2 117
   002629         263300     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2184.2 97
   002630         263400     PERFORM FAIL.                                                NC2184.2 243
   002631         263500 UST-WRITE-GF-26-4.                                               NC2184.2
   002632         263600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002633         263700*                                                                 NC2184.2
   002634         263800 UST-INIT-GF-27.                                                  NC2184.2
   002635         263900*    ===-->  EXPLICIT SCOPE TERMINATOR  <--===                    NC2184.2
   002636         264000     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
   002637         264100     MOVE   "UST-TEST-GF-27" TO PAR-NAME.                         NC2184.2 92
   002638         264200     MOVE   "PIC X " TO FEATURE.                                  NC2184.2 88
   002639         264300     MOVE   "1200000" TO ID1-XN-7.                                NC2184.2 44
   002640         264400     MOVE    ZERO TO ID4-X.                                       NC2184.2 IMP 58
   002641         264500     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002642         264600     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002643         264700     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002644         264800     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   002645         264900     MOVE    ZERO TO REC-CT.                                      NC2184.2 IMP 139
   002646         265000     MOVE    SPACE TO WRK-XN-00001-1.                             NC2184.2 IMP 39
   002647         265100     MOVE    SPACE TO WRK-XN-00001-2.                             NC2184.2 IMP 40
   002648         265200     MOVE    SPACE TO WRK-XN-00001-3.                             NC2184.2 IMP 41
   002649         265300*                                                                 NC2184.2
   002650         265400 UST-TEST-GF-27-0.                                                NC2184.2
   002651         265500     UNSTRING ID1-XN-7 DELIMITED BY ZERO INTO ID4-X               NC2184.2 44 IMP 58
   002652         265600             DELIMITER IN ID5-XN-4                                NC2184.2 79
   002653         265700             COUNT IN ID6-DU-2V0                                  NC2184.2 82
   002654         265800             WITH POINTER ID10-DU-2V0                             NC2184.2 84
   002655         265900             TALLYING ID11-DU-2V0                                 NC2184.2 85
   002656         266000             ON OVERFLOW                                          NC2184.2
   002657      1  266100                     MOVE "A" TO WRK-XN-00001-1                   NC2184.2 39
   002658      1  266200                     MOVE "B" TO WRK-XN-00001-2                   NC2184.2 40
   002659         266300     END-UNSTRING                                                 NC2184.2
   002660         266400     MOVE   "Z"  TO WRK-XN-00001-3.                               NC2184.2 41
   002661         266500     GO TO   UST-TEST-GF-27-1.                                    NC2184.2 2667
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    50
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002662         266600 UST-DELETE-GF-27.                                                NC2184.2
   002663         266700     PERFORM DE-LETE.                                             NC2184.2 244
   002664         266800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002665         266900     GO TO   UST-INIT-GF-28.                                      NC2184.2 2751
   002666         267000*                                                                 NC2184.2
   002667         267100 UST-TEST-GF-27-1.                                                NC2184.2
   002668         267200     ADD     1 TO REC-CT.                                         NC2184.2 139
   002669         267300     IF      ID4-X = "1"                                          NC2184.2 58
   002670      1  267400             PERFORM PASS                                         NC2184.2 242
   002671      1  267500             GO TO UST-WRITE-GF-27-1                              NC2184.2 2681
   002672         267600     ELSE                                                         NC2184.2
   002673      1  267700             GO TO UST-FAIL-GF-27-1.                              NC2184.2 2677
   002674         267800 UST-DELETE-GF-27-1.                                              NC2184.2
   002675         267900     PERFORM DE-LETE.                                             NC2184.2 244
   002676         268000     GO TO UST-WRITE-GF-27-1.                                     NC2184.2 2681
   002677         268100 UST-FAIL-GF-27-1.                                                NC2184.2
   002678         268200     PERFORM FAIL                                                 NC2184.2 243
   002679         268300     MOVE    ID4-X TO COMPUTED-A                                  NC2184.2 58 103
   002680         268400     MOVE    "1" TO CORRECT-A.                                    NC2184.2 117
   002681         268500 UST-WRITE-GF-27-1.                                               NC2184.2
   002682         268600     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002683         268700*                                                                 NC2184.2
   002684         268800 UST-TEST-GF-27-2.                                                NC2184.2
   002685         268900     ADD     1 TO REC-CT.                                         NC2184.2 139
   002686         269000     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   002687      1  269100             PERFORM PASS                                         NC2184.2 242
   002688      1  269200             GO TO UST-WRITE-GF-27-2                              NC2184.2 2698
   002689         269300     ELSE                                                         NC2184.2
   002690      1  269400             GO TO UST-FAIL-GF-27-2.                              NC2184.2 2694
   002691         269500 UST-DELETE-GF-27-2.                                              NC2184.2
   002692         269600     PERFORM DE-LETE.                                             NC2184.2 244
   002693         269700     GO TO UST-WRITE-GF-27-2.                                     NC2184.2 2698
   002694         269800 UST-FAIL-GF-27-2.                                                NC2184.2
   002695         269900     PERFORM FAIL                                                 NC2184.2 243
   002696         270000     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   002697         270100     MOVE   "0   " TO CORRECT-A.                                  NC2184.2 117
   002698         270200 UST-WRITE-GF-27-2.                                               NC2184.2
   002699         270300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002700         270400*                                                                 NC2184.2
   002701         270500 UST-TEST-GF-27-3.                                                NC2184.2
   002702         270600     ADD     1 TO REC-CT.                                         NC2184.2 139
   002703         270700     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   002704      1  270800             PERFORM PASS                                         NC2184.2 242
   002705      1  270900             GO TO UST-WRITE-GF-27-3                              NC2184.2 2715
   002706         271000     ELSE                                                         NC2184.2
   002707      1  271100             GO TO UST-FAIL-GF-27-3.                              NC2184.2 2711
   002708         271200 UST-DELETE-GF-27-3.                                              NC2184.2
   002709         271300     PERFORM DE-LETE.                                             NC2184.2 244
   002710         271400     GO TO UST-WRITE-GF-27-3.                                     NC2184.2 2715
   002711         271500 UST-FAIL-GF-27-3.                                                NC2184.2
   002712         271600     PERFORM FAIL                                                 NC2184.2 243
   002713         271700     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   002714         271800     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   002715         271900 UST-WRITE-GF-27-3.                                               NC2184.2
   002716         272000     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002717         272100*                                                                 NC2184.2
   002718         272200 UST-TEST-GF-27-4.                                                NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    51
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002719         272300     ADD     1 TO REC-CT.                                         NC2184.2 139
   002720         272400     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   002721      1  272500             PERFORM PASS                                         NC2184.2 242
   002722      1  272600             GO TO UST-WRITE-GF-27-4                              NC2184.2 2732
   002723         272700     ELSE                                                         NC2184.2
   002724      1  272800             GO TO UST-FAIL-GF-27-4.                              NC2184.2 2728
   002725         272900 UST-DELETE-GF-27-4.                                              NC2184.2
   002726         273000     PERFORM DE-LETE.                                             NC2184.2 244
   002727         273100     GO TO UST-WRITE-GF-27-4.                                     NC2184.2 2732
   002728         273200 UST-FAIL-GF-27-4.                                                NC2184.2
   002729         273300     PERFORM FAIL                                                 NC2184.2 243
   002730         273400     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   002731         273500     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   002732         273600 UST-WRITE-GF-27-4.                                               NC2184.2
   002733         273700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002734         273800*                                                                 NC2184.2
   002735         273900 UST-TEST-GF-27-5.                                                NC2184.2
   002736         274000     ADD     1 TO REC-CT.                                         NC2184.2 139
   002737         274100     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   002738      1  274200             PERFORM PASS                                         NC2184.2 242
   002739      1  274300             GO TO UST-WRITE-GF-27-5                              NC2184.2 2749
   002740         274400     ELSE                                                         NC2184.2
   002741      1  274500             GO TO UST-FAIL-GF-27-5.                              NC2184.2 2745
   002742         274600 UST-DELETE-GF-27-5.                                              NC2184.2
   002743         274700     PERFORM DE-LETE.                                             NC2184.2 244
   002744         274800     GO TO UST-WRITE-GF-27-5.                                     NC2184.2 2749
   002745         274900 UST-FAIL-GF-27-5.                                                NC2184.2
   002746         275000     PERFORM FAIL                                                 NC2184.2 243
   002747         275100     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   002748         275200     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   002749         275300 UST-WRITE-GF-27-5.                                               NC2184.2
   002750         275400*                                                                 NC2184.2
   002751         275500 UST-INIT-GF-28.                                                  NC2184.2

 ==002751==> IGYPS2015-I The paragraph or section prior to paragraph or section "UST-INIT-GF-28"
                         did not contain any statements.

   002752         275600*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2184.2
   002753         275700     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
   002754         275800     MOVE   "UST-TEST-GF-28" TO PAR-NAME.                         NC2184.2 92
   002755         275900     MOVE   "OVERFLOW TEST" TO FEATURE.                           NC2184.2 88
   002756         276000     MOVE   "ABCDEF" TO GRP1-XN-6.                                NC2184.2 43
   002757         276100     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   002758         276200     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002759         276300     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002760         276400     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002761         276500     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   002762         276600     MOVE    ZERO TO REC-CT.                                      NC2184.2 IMP 139
   002763         276700     MOVE    SPACE TO WRK-XN-00001-1.                             NC2184.2 IMP 39
   002764         276800     MOVE    SPACE TO WRK-XN-00001-2.                             NC2184.2 IMP 40
   002765         276900     MOVE    SPACE TO WRK-XN-00001-3.                             NC2184.2 IMP 41
   002766         277000*                                                                 NC2184.2
   002767         277100 UST-TEST-GF-28-0.                                                NC2184.2
   002768         277200     UNSTRING GRP1-XN-6  INTO ID4A-XXXXX ID4B-X                   NC2184.2 43 69 70

 ==002768==> IGYPG3230-W An overflow condition will never occur in the "UNSTRING" statement.

1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    52
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002769         277300             ON OVERFLOW                                          NC2184.2
   002770      1  277400                     MOVE "A" TO WRK-XN-00001-1                   NC2184.2 39
   002771      1  277500                     MOVE "B" TO WRK-XN-00001-2                   NC2184.2 40
   002772         277600     END-UNSTRING                                                 NC2184.2
   002773         277700     MOVE   "Z"  TO WRK-XN-00001-3.                               NC2184.2 41
   002774         277800     GO TO   UST-TEST-GF-28-1.                                    NC2184.2 2780
   002775         277900 UST-DELETE-GF-28.                                                NC2184.2
   002776         278000     PERFORM DE-LETE.                                             NC2184.2 244
   002777         278100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002778         278200     GO      TO UST-INIT-GF-29.                                   NC2184.2 2798
   002779         278300*                                                                 NC2184.2
   002780         278400 UST-TEST-GF-28-1.                                                NC2184.2
   002781         278500     ADD     1 TO REC-CT.                                         NC2184.2 139
   002782         278600     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   002783      1  278700             PERFORM PASS                                         NC2184.2 242
   002784      1  278800             GO TO UST-WRITE-GF-28-1                              NC2184.2 2794
   002785         278900     ELSE                                                         NC2184.2
   002786      1  279000             GO TO UST-FAIL-GF-28-1.                              NC2184.2 2790
   002787         279100 UST-DELETE-GF-28-1.                                              NC2184.2
   002788         279200     PERFORM DE-LETE.                                             NC2184.2 244
   002789         279300     GO TO UST-WRITE-GF-28-1.                                     NC2184.2 2794
   002790         279400 UST-FAIL-GF-28-1.                                                NC2184.2
   002791         279500     PERFORM FAIL                                                 NC2184.2 243
   002792         279600     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   002793         279700     MOVE   "ABCDEF" TO CORRECT-A.                                NC2184.2 117
   002794         279800 UST-WRITE-GF-28-1.                                               NC2184.2
   002795         279900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002796         280000*                                                                 NC2184.2
   002797         280100*                                                                 NC2184.2
   002798         280200 UST-INIT-GF-29.                                                  NC2184.2
   002799         280300*    ===-->  EXPLICIT SCOPE TERMINATOR  <--===                    NC2184.2
   002800         280400     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
   002801         280500     MOVE   "UST-TEST-GF-29" TO PAR-NAME.                         NC2184.2 92
   002802         280600     MOVE   "PIC X " TO FEATURE.                                  NC2184.2 88
   002803         280700     MOVE   "1200000" TO ID1-XN-7.                                NC2184.2 44
   002804         280800     MOVE    ZERO TO ID4-X.                                       NC2184.2 IMP 58
   002805         280900     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002806         281000     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002807         281100     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002808         281200     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   002809         281300     MOVE    ZERO TO REC-CT.                                      NC2184.2 IMP 139
   002810         281400     MOVE    SPACE TO WRK-XN-00001-1.                             NC2184.2 IMP 39
   002811         281500     MOVE    SPACE TO WRK-XN-00001-2.                             NC2184.2 IMP 40
   002812         281600     MOVE    SPACE TO WRK-XN-00001-3.                             NC2184.2 IMP 41
   002813         281700*                                                                 NC2184.2
   002814         281800 UST-TEST-GF-29-0.                                                NC2184.2
   002815         281900     UNSTRING ID1-XN-7 DELIMITED BY ZERO INTO ID4-X               NC2184.2 44 IMP 58
   002816         282000             DELIMITER IN ID5-XN-4                                NC2184.2 79
   002817         282100             COUNT IN ID6-DU-2V0                                  NC2184.2 82
   002818         282200             WITH POINTER ID10-DU-2V0                             NC2184.2 84
   002819         282300             TALLYING ID11-DU-2V0                                 NC2184.2 85
   002820         282400         NOT ON OVERFLOW                                          NC2184.2
   002821      1  282500                     MOVE "A" TO WRK-XN-00001-1                   NC2184.2 39
   002822      1  282600                     MOVE "B" TO WRK-XN-00001-2                   NC2184.2 40
   002823         282700     END-UNSTRING                                                 NC2184.2
   002824         282800     MOVE   "Z"  TO WRK-XN-00001-3.                               NC2184.2 41
   002825         282900     GO TO   UST-TEST-GF-29-1.                                    NC2184.2 2831
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    53
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002826         283000 UST-DELETE-GF-29.                                                NC2184.2
   002827         283100     PERFORM DE-LETE.                                             NC2184.2 244
   002828         283200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002829         283300     GO TO   UST-INIT-GF-30.                                      NC2184.2 2971
   002830         283400*                                                                 NC2184.2
   002831         283500 UST-TEST-GF-29-1.                                                NC2184.2
   002832         283600     MOVE   "UST-TEST-GF-29-1" TO PAR-NAME.                       NC2184.2 92
   002833         283700     ADD     1 TO REC-CT.                                         NC2184.2 139
   002834         283800     IF      ID4-X = "1"                                          NC2184.2 58
   002835      1  283900             PERFORM PASS                                         NC2184.2 242
   002836      1  284000             GO TO UST-WRITE-GF-29-1                              NC2184.2 2846
   002837         284100     ELSE                                                         NC2184.2
   002838      1  284200             GO TO UST-FAIL-GF-29-1.                              NC2184.2 2842
   002839         284300 UST-DELETE-GF-29-1.                                              NC2184.2
   002840         284400     PERFORM DE-LETE.                                             NC2184.2 244
   002841         284500     GO TO UST-WRITE-GF-29-1.                                     NC2184.2 2846
   002842         284600 UST-FAIL-GF-29-1.                                                NC2184.2
   002843         284700     PERFORM FAIL                                                 NC2184.2 243
   002844         284800     MOVE    ID4-X TO COMPUTED-A                                  NC2184.2 58 103
   002845         284900     MOVE    "1" TO CORRECT-A.                                    NC2184.2 117
   002846         285000 UST-WRITE-GF-29-1.                                               NC2184.2
   002847         285100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002848         285200*                                                                 NC2184.2
   002849         285300 UST-TEST-GF-29-2.                                                NC2184.2
   002850         285400     ADD     1 TO REC-CT.                                         NC2184.2 139
   002851         285500     IF      ID5-XN-4 = "0   "                                    NC2184.2 79
   002852      1  285600             PERFORM PASS                                         NC2184.2 242
   002853      1  285700             GO TO UST-WRITE-GF-29-2                              NC2184.2 2863
   002854         285800     ELSE                                                         NC2184.2
   002855      1  285900             GO TO UST-FAIL-GF-29-2.                              NC2184.2 2859
   002856         286000 UST-DELETE-GF-29-2.                                              NC2184.2
   002857         286100     PERFORM DE-LETE.                                             NC2184.2 244
   002858         286200     GO TO UST-WRITE-GF-29-2.                                     NC2184.2 2863
   002859         286300 UST-FAIL-GF-29-2.                                                NC2184.2
   002860         286400     PERFORM FAIL                                                 NC2184.2 243
   002861         286500     MOVE    ID5-XN-4 TO COMPUTED-A                               NC2184.2 79 103
   002862         286600     MOVE   "0   " TO CORRECT-A.                                  NC2184.2 117
   002863         286700 UST-WRITE-GF-29-2.                                               NC2184.2
   002864         286800     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002865         286900*                                                                 NC2184.2
   002866         287000 UST-TEST-GF-29-3.                                                NC2184.2
   002867         287100     ADD     1 TO REC-CT.                                         NC2184.2 139
   002868         287200     IF      ID6-DU-2V0 = 2                                       NC2184.2 82
   002869      1  287300             PERFORM PASS                                         NC2184.2 242
   002870      1  287400             GO TO UST-WRITE-GF-29-3                              NC2184.2 2880
   002871         287500     ELSE                                                         NC2184.2
   002872      1  287600             GO TO UST-FAIL-GF-29-3.                              NC2184.2 2876
   002873         287700 UST-DELETE-GF-29-3.                                              NC2184.2
   002874         287800     PERFORM DE-LETE.                                             NC2184.2 244
   002875         287900     GO TO UST-WRITE-GF-29-3.                                     NC2184.2 2880
   002876         288000 UST-FAIL-GF-29-3.                                                NC2184.2
   002877         288100     PERFORM FAIL                                                 NC2184.2 243
   002878         288200     MOVE    ID6-DU-2V0 TO COMPUTED-N                             NC2184.2 82 104
   002879         288300     MOVE    2 TO CORRECT-N.                                      NC2184.2 118
   002880         288400 UST-WRITE-GF-29-3.                                               NC2184.2
   002881         288500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002882         288600*                                                                 NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    54
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002883         288700 UST-TEST-GF-29-4.                                                NC2184.2
   002884         288800     ADD     1 TO REC-CT.                                         NC2184.2 139
   002885         288900     IF      ID10-DU-2V0 = 4                                      NC2184.2 84
   002886      1  289000             PERFORM PASS                                         NC2184.2 242
   002887      1  289100             GO TO UST-WRITE-GF-29-4                              NC2184.2 2897
   002888         289200     ELSE                                                         NC2184.2
   002889      1  289300             GO TO UST-FAIL-GF-29-4.                              NC2184.2 2893
   002890         289400 UST-DELETE-GF-29-4.                                              NC2184.2
   002891         289500     PERFORM DE-LETE.                                             NC2184.2 244
   002892         289600     GO TO UST-WRITE-GF-29-4.                                     NC2184.2 2897
   002893         289700 UST-FAIL-GF-29-4.                                                NC2184.2
   002894         289800     PERFORM FAIL                                                 NC2184.2 243
   002895         289900     MOVE    ID10-DU-2V0 TO COMPUTED-N                            NC2184.2 84 104
   002896         290000     MOVE    4 TO CORRECT-N.                                      NC2184.2 118
   002897         290100 UST-WRITE-GF-29-4.                                               NC2184.2
   002898         290200     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002899         290300*                                                                 NC2184.2
   002900         290400 UST-TEST-GF-29-5.                                                NC2184.2
   002901         290500     ADD     1 TO REC-CT.                                         NC2184.2 139
   002902         290600     IF      ID11-DU-2V0 = 1                                      NC2184.2 85
   002903      1  290700             PERFORM PASS                                         NC2184.2 242
   002904      1  290800             GO TO UST-WRITE-GF-29-5                              NC2184.2 2914
   002905         290900     ELSE                                                         NC2184.2
   002906      1  291000             GO TO UST-FAIL-GF-29-5.                              NC2184.2 2910
   002907         291100 UST-DELETE-GF-29-5.                                              NC2184.2
   002908         291200     PERFORM DE-LETE.                                             NC2184.2 244
   002909         291300     GO TO UST-WRITE-GF-29-5.                                     NC2184.2 2914
   002910         291400 UST-FAIL-GF-29-5.                                                NC2184.2
   002911         291500     PERFORM FAIL                                                 NC2184.2 243
   002912         291600     MOVE    ID11-DU-2V0 TO COMPUTED-N                            NC2184.2 85 104
   002913         291700     MOVE    1 TO CORRECT-N.                                      NC2184.2 118
   002914         291800 UST-WRITE-GF-29-5.                                               NC2184.2
   002915         291900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002916         292000*                                                                 NC2184.2
   002917         292100 UST-TEST-GF-29-6.                                                NC2184.2
   002918         292200     ADD     1 TO REC-CT.                                         NC2184.2 139
   002919         292300     IF      WRK-XN-00001-1 = SPACE                               NC2184.2 39 IMP
   002920      1  292400             PERFORM PASS                                         NC2184.2 242
   002921      1  292500             GO TO UST-WRITE-GF-29-6                              NC2184.2 2932
   002922         292600     ELSE                                                         NC2184.2
   002923      1  292700             GO TO UST-FAIL-GF-29-6.                              NC2184.2 2927
   002924         292800 UST-DELETE-GF-29-6.                                              NC2184.2
   002925         292900     PERFORM DE-LETE.                                             NC2184.2 244
   002926         293000     GO TO UST-WRITE-GF-29-6.                                     NC2184.2 2932
   002927         293100 UST-FAIL-GF-29-6.                                                NC2184.2
   002928         293200     MOVE    WRK-XN-00001-1 TO COMPUTED-A                         NC2184.2 39 103
   002929         293300     MOVE    SPACE TO CORRECT-A.                                  NC2184.2 IMP 117
   002930         293400     MOVE "NOT ON OVERFLOW SHOULD NOT HAVE EXECUTED" TO RE-MARK   NC2184.2 97
   002931         293500     PERFORM FAIL.                                                NC2184.2 243
   002932         293600 UST-WRITE-GF-29-6.                                               NC2184.2
   002933         293700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002934         293800*                                                                 NC2184.2
   002935         293900 UST-TEST-GF-29-7.                                                NC2184.2
   002936         294000     ADD     1 TO REC-CT.                                         NC2184.2 139
   002937         294100     IF      WRK-XN-00001-2 = SPACE                               NC2184.2 40 IMP
   002938      1  294200             PERFORM PASS                                         NC2184.2 242
   002939      1  294300             GO TO UST-WRITE-GF-29-7                              NC2184.2 2950
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    55
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002940         294400     ELSE                                                         NC2184.2
   002941      1  294500             GO TO UST-FAIL-GF-29-7.                              NC2184.2 2945
   002942         294600 UST-DELETE-GF-29-7.                                              NC2184.2
   002943         294700     PERFORM DE-LETE.                                             NC2184.2 244
   002944         294800     GO TO UST-WRITE-GF-29-7.                                     NC2184.2 2950
   002945         294900 UST-FAIL-GF-29-7.                                                NC2184.2
   002946         295000     MOVE    WRK-XN-00001-2 TO COMPUTED-A                         NC2184.2 40 103
   002947         295100     MOVE    SPACE TO CORRECT-A.                                  NC2184.2 IMP 117
   002948         295200     MOVE "NOT ON OVERFLOW SHOULD NOT HAVE EXECUTED" TO RE-MARK.  NC2184.2 97
   002949         295300     PERFORM FAIL.                                                NC2184.2 243
   002950         295400 UST-WRITE-GF-29-7.                                               NC2184.2
   002951         295500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002952         295600*                                                                 NC2184.2
   002953         295700 UST-TEST-GF-29-8.                                                NC2184.2
   002954         295800     ADD     1 TO REC-CT.                                         NC2184.2 139
   002955         295900     IF      WRK-XN-00001-3 = "Z"                                 NC2184.2 41
   002956      1  296000             PERFORM PASS                                         NC2184.2 242
   002957      1  296100             GO TO UST-WRITE-GF-29-8                              NC2184.2 2968
   002958         296200     ELSE                                                         NC2184.2
   002959      1  296300             GO TO UST-FAIL-GF-29-8.                              NC2184.2 2963
   002960         296400 UST-DELETE-GF-29-8.                                              NC2184.2
   002961         296500     PERFORM DE-LETE.                                             NC2184.2 244
   002962         296600     GO TO UST-WRITE-GF-29-8.                                     NC2184.2 2968
   002963         296700 UST-FAIL-GF-29-8.                                                NC2184.2
   002964         296800     MOVE    WRK-XN-00001-3 TO COMPUTED-A                         NC2184.2 41 103
   002965         296900     MOVE   "Z" TO CORRECT-A.                                     NC2184.2 117
   002966         297000     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2184.2 97
   002967         297100     PERFORM FAIL.                                                NC2184.2 243
   002968         297200 UST-WRITE-GF-29-8.                                               NC2184.2
   002969         297300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002970         297400*                                                                 NC2184.2
   002971         297500 UST-INIT-GF-30.                                                  NC2184.2
   002972         297600*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2184.2
   002973         297700     MOVE   "VI-138 6.26.4 GR17" TO ANSI-REFERENCE.               NC2184.2 148
   002974         297800     MOVE   "UST-TEST-GF-30" TO PAR-NAME.                         NC2184.2 92
   002975         297900     MOVE   "OVERFLOW TEST" TO FEATURE.                           NC2184.2 88
   002976         298000     MOVE   "ABCDEF" TO GRP1-XN-6.                                NC2184.2 43
   002977         298100     MOVE    SPACES TO GRP4-XN-6.                                 NC2184.2 IMP 68
   002978         298200     MOVE    "****" TO ID5-XN-4.                                  NC2184.2 79
   002979         298300     MOVE    ZERO TO ID6-DU-2V0.                                  NC2184.2 IMP 82
   002980         298400     MOVE    1 TO ID10-DU-2V0.                                    NC2184.2 84
   002981         298500     MOVE    ZERO TO ID11-DU-2V0.                                 NC2184.2 IMP 85
   002982         298600     MOVE    ZERO TO REC-CT.                                      NC2184.2 IMP 139
   002983         298700     MOVE    SPACE TO WRK-XN-00001-1.                             NC2184.2 IMP 39
   002984         298800     MOVE    SPACE TO WRK-XN-00001-2.                             NC2184.2 IMP 40
   002985         298900     MOVE    SPACE TO WRK-XN-00001-3.                             NC2184.2 IMP 41
   002986         299000*                                                                 NC2184.2
   002987         299100 UST-TEST-GF-30-0.                                                NC2184.2
   002988         299200     UNSTRING GRP1-XN-6  INTO ID4A-XXXXX ID4B-X                   NC2184.2 43 69 70

 ==002988==> IGYPG3230-W An overflow condition will never occur in the "UNSTRING" statement.

   002989         299300         NOT ON OVERFLOW                                          NC2184.2
   002990      1  299400                     MOVE "A" TO WRK-XN-00001-1                   NC2184.2 39
   002991      1  299500                     MOVE "B" TO WRK-XN-00001-2                   NC2184.2 40
   002992         299600     END-UNSTRING                                                 NC2184.2
   002993         299700     MOVE   "Z"  TO WRK-XN-00001-3.                               NC2184.2 41
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    56
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002994         299800     GO TO   UST-TEST-GF-30-1.                                    NC2184.2 3000
   002995         299900 UST-DELETE-GF-30.                                                NC2184.2
   002996         300000     PERFORM DE-LETE.                                             NC2184.2 244
   002997         300100     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   002998         300200     GO      TO CCVS-EXIT.                                        NC2184.2 3071
   002999         300300*                                                                 NC2184.2
   003000         300400 UST-TEST-GF-30-1.                                                NC2184.2
   003001         300500     MOVE    1 TO REC-CT.                                         NC2184.2 139
   003002         300600     IF      GRP4-XN-6 = "ABCDEF"                                 NC2184.2 68
   003003      1  300700             PERFORM PASS                                         NC2184.2 242
   003004      1  300800             GO TO UST-WRITE-GF-30-1                              NC2184.2 3014
   003005         300900     ELSE                                                         NC2184.2
   003006      1  301000             GO TO UST-FAIL-GF-30-1.                              NC2184.2 3010
   003007         301100 UST-DELETE-GF-30-1.                                              NC2184.2
   003008         301200     PERFORM DE-LETE.                                             NC2184.2 244
   003009         301300     GO TO UST-WRITE-GF-30-1.                                     NC2184.2 3014
   003010         301400 UST-FAIL-GF-30-1.                                                NC2184.2
   003011         301500     PERFORM FAIL                                                 NC2184.2 243
   003012         301600     MOVE    GRP4-XN-6 TO COMPUTED-A                              NC2184.2 68 103
   003013         301700     MOVE   "ABCDEF" TO CORRECT-A.                                NC2184.2 117
   003014         301800 UST-WRITE-GF-30-1.                                               NC2184.2
   003015         301900     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   003016         302000*                                                                 NC2184.2
   003017         302100 UST-TEST-GF-30-2.                                                NC2184.2
   003018         302200     ADD     1 TO REC-CT.                                         NC2184.2 139
   003019         302300     IF      WRK-XN-00001-1 = "A"                                 NC2184.2 39
   003020      1  302400             PERFORM PASS                                         NC2184.2 242
   003021      1  302500             GO TO UST-WRITE-GF-30-2                              NC2184.2 3032
   003022         302600     ELSE                                                         NC2184.2
   003023      1  302700             GO TO UST-FAIL-GF-30-2.                              NC2184.2 3027
   003024         302800 UST-DELETE-GF-30-2.                                              NC2184.2
   003025         302900     PERFORM DE-LETE.                                             NC2184.2 244
   003026         303000     GO TO UST-WRITE-GF-30-2.                                     NC2184.2 3032
   003027         303100 UST-FAIL-GF-30-2.                                                NC2184.2
   003028         303200     MOVE    WRK-XN-00001-1 TO COMPUTED-A                         NC2184.2 39 103
   003029         303300     MOVE   "A"    TO CORRECT-A.                                  NC2184.2 117
   003030         303400     MOVE   "NOT ON OVERFLOW SHOULD HAVE EXECUTED"  TO RE-MARK.   NC2184.2 97
   003031         303500     PERFORM FAIL.                                                NC2184.2 243
   003032         303600 UST-WRITE-GF-30-2.                                               NC2184.2
   003033         303700     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   003034         303800*                                                                 NC2184.2
   003035         303900 UST-TEST-GF-30-3.                                                NC2184.2
   003036         304000     ADD     1 TO REC-CT.                                         NC2184.2 139
   003037         304100     IF      WRK-XN-00001-2 = "B"                                 NC2184.2 40
   003038      1  304200             PERFORM PASS                                         NC2184.2 242
   003039      1  304300             GO TO UST-WRITE-GF-30-3                              NC2184.2 3050
   003040         304400     ELSE                                                         NC2184.2
   003041      1  304500             GO TO UST-FAIL-GF-30-3.                              NC2184.2 3045
   003042         304600 UST-DELETE-GF-30-3.                                              NC2184.2
   003043         304700     PERFORM DE-LETE.                                             NC2184.2 244
   003044         304800     GO TO UST-WRITE-GF-30-3.                                     NC2184.2 3050
   003045         304900 UST-FAIL-GF-30-3.                                                NC2184.2
   003046         305000     MOVE    WRK-XN-00001-2 TO COMPUTED-A                         NC2184.2 40 103
   003047         305100     MOVE   "B"    TO CORRECT-A.                                  NC2184.2 117
   003048         305200     MOVE   "NOT ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK.    NC2184.2 97
   003049         305300     PERFORM FAIL.                                                NC2184.2 243
   003050         305400 UST-WRITE-GF-30-3.                                               NC2184.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    57
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  003051         305500     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   003052         305600*                                                                 NC2184.2
   003053         305700 UST-TEST-GF-30-4.                                                NC2184.2
   003054         305800     ADD     1 TO REC-CT.                                         NC2184.2 139
   003055         305900     IF      WRK-XN-00001-3 = "Z"                                 NC2184.2 41
   003056      1  306000             PERFORM PASS                                         NC2184.2 242
   003057      1  306100             GO TO UST-WRITE-GF-30-4                              NC2184.2 3068
   003058         306200     ELSE                                                         NC2184.2
   003059      1  306300             GO TO UST-FAIL-GF-30-4.                              NC2184.2 3063
   003060         306400 UST-DELETE-GF-30-4.                                              NC2184.2
   003061         306500     PERFORM DE-LETE.                                             NC2184.2 244
   003062         306600     GO TO UST-WRITE-GF-30-4.                                     NC2184.2 3068
   003063         306700 UST-FAIL-GF-30-4.                                                NC2184.2
   003064         306800     MOVE    WRK-XN-00001-3 TO COMPUTED-A                         NC2184.2 41 103
   003065         306900     MOVE   "Z" TO CORRECT-A.                                     NC2184.2 117
   003066         307000     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2184.2 97
   003067         307100     PERFORM FAIL.                                                NC2184.2 243
   003068         307200 UST-WRITE-GF-30-4.                                               NC2184.2
   003069         307300     PERFORM PRINT-DETAIL.                                        NC2184.2 246
   003070         307400*                                                                 NC2184.2
   003071         307500 CCVS-EXIT SECTION.                                               NC2184.2
   003072         307600 CCVS-999999.                                                     NC2184.2
   003073         307700     GO TO CLOSE-FILES.                                           NC2184.2 235
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    58
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

      148   ANSI-REFERENCE . . . . . . . .  320 327 336 M345 M461 M577 M685 M794 M902 M1010 M1118 M1226 M1333 M1441 M1470
                                            M1515 M1557 M1618 M1679 M1751 M1844 M1974 M2045 M2135 M2222 M2336 M2380 M2496
                                            M2540 M2636 M2753 M2800 M2973
       78   ASTER-XN-4
      127   CCVS-C-1 . . . . . . . . . . .  264 306
      132   CCVS-C-2 . . . . . . . . . . .  265 307
      182   CCVS-E-1 . . . . . . . . . . .  270
      187   CCVS-E-2 . . . . . . . . . . .  279 286 293 298
      190   CCVS-E-2-2 . . . . . . . . . .  M278
      195   CCVS-E-3 . . . . . . . . . . .  299
      204   CCVS-E-4 . . . . . . . . . . .  278
      205   CCVS-E-4-1 . . . . . . . . . .  M276
      207   CCVS-E-4-2 . . . . . . . . . .  M277
      149   CCVS-H-1 . . . . . . . . . . .  259
      154   CCVS-H-2A. . . . . . . . . . .  260
      163   CCVS-H-2B. . . . . . . . . . .  261
      175   CCVS-H-3 . . . . . . . . . . .  262
      225   CCVS-PGM-ID. . . . . . . . . .  231 231
      109   CM-18V0
      103   COMPUTED-A . . . . . . . . . .  104 106 107 108 109 332 335 M386 M403 M502 M519 M610 M627 M719 M736 M844 M952
                                            M1060 M1168 M1276 M1383 M1463 M1508 M1550 M1594 M1655 M1710 M1727 M1785 M1802
                                            M1882 M1899 M1967 M2004 M2077 M2094 M2111 M2164 M2181 M2198 M2261 M2278 M2373
                                            M2421 M2438 M2533 M2575 M2591 M2609 M2627 M2679 M2696 M2792 M2844 M2861 M2928
                                            M2946 M2964 M3012 M3028 M3046 M3064
      104   COMPUTED-N . . . . . . . . . .  M420 M437 M454 M536 M553 M570 M644 M661 M678 M753 M770 M787 M827 M861 M878 M895
                                            M935 M969 M986 M1003 M1043 M1077 M1094 M1111 M1151 M1185 M1202 M1219 M1259 M1292
                                            M1309 M1326 M1366 M1400 M1417 M1434 M1611 M1672 M1744 M1819 M1836 M1916 M1933
                                            M1950 M2021 M2038 M2128 M2215 M2295 M2312 M2329 M2455 M2472 M2489 M2713 M2730
                                            M2747 M2878 M2895 M2912
      102   COMPUTED-X . . . . . . . . . .  M254 318
      106   COMPUTED-0V18
      108   COMPUTED-14V4
      110   COMPUTED-18V0
      107   COMPUTED-4V14
      126   COR-ANSI-REFERENCE . . . . . .  M327 M329
      117   CORRECT-A. . . . . . . . . . .  118 119 120 121 122 333 335 M387 M404 M503 M520 M611 M628 M720 M737 M845 M953
                                            M1061 M1169 M1277 M1384 M1464 M1509 M1551 M1595 M1656 M1711 M1728 M1786 M1803
                                            M1883 M1900 M1968 M2005 M2078 M2095 M2112 M2165 M2182 M2199 M2262 M2279 M2374
                                            M2422 M2439 M2534 M2576 M2592 M2610 M2628 M2680 M2697 M2793 M2845 M2862 M2929
                                            M2947 M2965 M3013 M3029 M3047 M3065
      118   CORRECT-N. . . . . . . . . . .  M421 M438 M455 M537 M554 M571 M645 M662 M679 M754 M771 M788 M828 M862 M879 M896
                                            M936 M970 M987 M1004 M1044 M1078 M1095 M1112 M1152 M1186 M1203 M1220 M1260 M1293
                                            M1310 M1327 M1367 M1401 M1418 M1435 M1612 M1673 M1745 M1820 M1837 M1917 M1934
                                            M1951 M2022 M2039 M2129 M2216 M2296 M2313 M2330 M2456 M2473 M2490 M2714 M2731
                                            M2748 M2879 M2896 M2913
      116   CORRECT-X. . . . . . . . . . .  M255 319
      119   CORRECT-0V18
      121   CORRECT-14V4
      123   CORRECT-18V0
      120   CORRECT-4V14
      122   CR-18V0
      140   DELETE-COUNTER . . . . . . . .  M244 273 289 291
       95   DOTVALUE . . . . . . . . . . .  M249
      146   DUMMY-HOLD . . . . . . . . . .  M303 309
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    59
0 Defined   Cross-reference of data names   References

0      37   DUMMY-RECORD . . . . . . . . .  M259 M260 M261 M262 M264 M265 M266 M268 M270 M279 M286 M293 M298 M299 303 M304
                                            305 M306 M307 M308 M309 313 M314 M322 M337
      193   ENDER-DESC . . . . . . . . . .  M281 M292 M297
      141   ERROR-COUNTER. . . . . . . . .  M243 272 282 285
      145   ERROR-HOLD . . . . . . . . . .  M272 M273 M273 M274 277
      191   ERROR-TOTAL. . . . . . . . . .  M283 M285 M290 M291 M295 M296
       88   FEATURE. . . . . . . . . . . .  M347 M462 M578 M686 M795 M903 M1011 M1119 M1227 M1334 M1442 M1471 M1516 M1558
                                            M1619 M1680 M1752 M1845 M1975 M2046 M2136 M2224 M2338 M2382 M2498 M2638 M2755
                                            M2802 M2975
       50   GRP1-XN-X-36 . . . . . . . . .  M1976 1985 2057
       46   GRP1-XN-10 . . . . . . . . . .  M1443 1452
       48   GRP1-XN-36 . . . . . . . . . .  50
       43   GRP1-XN-6. . . . . . . . . . .  M1477 1481 M1517 1525 1567 M1620 1629 M1681 1691 2347 2507 M2541 2548 M2756 2768
                                            M2976 2988
       45   GRP1-XN-7. . . . . . . . . . .  M1753 1763 M1846 1858
       53   GRP2-XN-X-2
       56   GRP2-XN-X-7
       52   GRP2-XN-2. . . . . . . . . . .  53 M1847
       55   GRP2-XN-7. . . . . . . . . . .  56 M1754
       73   GRP4-XN-10 . . . . . . . . . .  M1444 1453 1463 M2138
       68   GRP4-XN-6. . . . . . . . . . .  M1472 1498 1508 M1518 1540 1550 M1559 1584 1594 M1621 1645 1655 M1682 1700 1710
                                            M1755 M1764 1775 1785 M1848 1872 1882 M1977 M1985 1994 2004 M2047 2067 2077 M2339
                                            2363 2373 M2499 2523 2533 2565 2575 M2757 2782 2792 M2977 3002 3012
      219   HYPHEN-LINE. . . . . . . . . .  266 268 308
      185   ID-AGAIN . . . . . . . . . . .  M231
       51   ID1. . . . . . . . . . . . . .  1985 2057
       47   ID1-XN-12. . . . . . . . . . .  M2137 2143
       44   ID1-XN-7 . . . . . . . . . . .  M349 356 M463 472 M579 588 M687 697 M799 805 M907 913 M1012 1021 M1120 1129 M1228
                                            1237 M1335 1344 2233 2391 M2639 2651 M2803 2815
       84   ID10-DU-2V0. . . . . . . . . .  M352 M359 427 437 M467 M475 543 553 M583 M591 651 661 M692 M700 760 770 M800
                                            M808 868 878 M908 M916 976 986 M1016 M1024 1084 1094 M1124 M1132 1192 1202 M1232
                                            M1240 1299 1309 M1339 M1347 1407 1417 M1447 M1475 M1521 M1562 M1567 1601 1611
                                            M1624 M1629 1662 1672 M1686 M1758 1763 M1767 1826 1836 M1853 1858 M1980 1985
                                            M1986 2011 2021 M2052 M2228 M2234 2302 2312 M2342 M2386 M2394 2462 2472 M2502
                                            M2643 M2654 2720 2730 M2760 M2807 M2818 2885 2895 M2980
       85   ID11-DU-2V0. . . . . . . . . .  M353 M360 444 454 M468 M476 560 570 M584 M592 668 678 M693 M701 777 787 M801
                                            M809 885 895 M909 M917 993 1003 M1017 M1025 1101 1111 M1125 M1133 1209 1219 M1233
                                            M1241 1316 1326 M1340 M1348 1424 1434 M1448 M1476 M1522 M1563 M1625 M1687 M1692
                                            1734 1744 M1759 M1854 M1864 1940 1950 M1981 2028 2038 M2053 2057 M2059 2118 2128
                                            M2139 M2146 2205 2215 M2229 M2235 2319 2329 M2343 M2387 M2395 2479 2489 M2503
                                            M2644 M2655 2737 2747 M2761 M2808 M2819 2902 2912 M2981
       57   ID2. . . . . . . . . . . . . .  1763
       54   ID2A . . . . . . . . . . . . .  1858
       67   ID4-DS-LS-1V0. . . . . . . . .  M1336 M1344 1356 1366
       66   ID4-DS-TS-1V0. . . . . . . . .  M1229 M1237 1249 1259
       63   ID4-DS-1V0 . . . . . . . . . .  M904 M913 925 935
       65   ID4-DS-2V0 . . . . . . . . . .  M1121 M1129 1141 1151
       62   ID4-DU-1V0 . . . . . . . . . .  M796 M805 817 827
       64   ID4-DU-2V0 . . . . . . . . . .  M1013 M1021 1033 1043
       58   ID4-X. . . . . . . . . . . . .  M348 M357 376 386 M2225 M2233 2251 2261 M2383 M2391 2411 2421 M2640 M2651 2669
                                            2679 M2804 M2815 2834 2844
       59   ID4-XJ . . . . . . . . . . . .  M464 M472 492 502
       60   ID4-XXX. . . . . . . . . . . .  M580 M588 600 610
       61   ID4-XXXJ . . . . . . . . . . .  M689 M697 709 719
       74   ID4A-X . . . . . . . . . . . .  M1452 M2145 2188 2198
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    60
0 Defined   Cross-reference of data names   References

0      69   ID4A-XXXXX . . . . . . . . . .  M1481 M1525 M1567 M1629 M1691 M1859 M2058 M2347 M2507 M2548 M2768 M2988
       70   ID4B-X . . . . . . . . . . . .  M1481 M1567 M1629 M1691 M1862 M2058 M2347 M2507 M2548 M2768 M2988
       75   ID4B-XX. . . . . . . . . . . .  M1452 M2145 2171 2181
       76   ID4C-XXX . . . . . . . . . . .  M1452 M2145 2154 2164
       71   ID4C-XXXX. . . . . . . . . . .  M1683 M1691 1717 1727 M2048 M2058 2084 2094
       72   ID4D-X . . . . . . . . . . . .  M2049 M2058 2101 2111
       77   ID4D-XXXX. . . . . . . . . . .  M1452
       79   ID5-XN-4 . . . . . . . . . . .  M350 M357 393 403 M465 M473 509 519 M581 M589 617 627 M690 M698 726 736 M797
                                            M806 834 844 M905 M914 942 952 M1014 M1022 1050 1060 M1122 M1130 1158 1168 M1230
                                            M1238 1266 1276 M1337 M1345 1373 1383 M1445 M1473 M1519 M1560 M1622 M1684 M1849
                                            M1860 1889 1899 M1978 M2050 M2226 M2234 2268 2278 M2340 M2384 M2392 2428 2438
                                            M2500 M2641 M2652 2686 2696 M2758 M2805 M2816 2851 2861 M2978
       80   ID5-XN-4-2 . . . . . . . . . .  M1850 M1862 1957 1967
       81   ID5-XN-6 . . . . . . . . . . .  M1756 M1765 1792 1802
       82   ID6-DU-2V0 . . . . . . . . . .  M351 M358 410 420 M466 M474 526 536 M582 M590 634 644 M691 M699 743 753 M798
                                            M807 851 861 M906 M915 959 969 M1015 M1023 1067 1077 M1123 M1131 1175 1185 M1231
                                            M1239 1282 1292 M1338 M1346 1390 1400 M1446 M1474 M1520 M1561 M1623 M1685 M1757
                                            M1766 1809 1819 M1851 M1861 1906 1916 M1979 M2051 M2227 M2234 2285 2295 M2341
                                            M2385 M2393 2445 2455 M2501 M2642 M2653 2703 2713 M2759 M2806 M2817 2868 2878
                                            M2979
       83   ID6-DU-2V0-2 . . . . . . . . .  M1852 M1863 1923 1933 1957
      218   INF-ANSI-REFERENCE . . . . . .  M320 M323 M336 M338
      213   INFO-TEXT. . . . . . . . . . .  M321
      142   INSPECT-COUNTER. . . . . . . .  M241 272 294 296
       90   P-OR-F . . . . . . . . . . . .  M241 M242 M243 M244 251 M254
       92   PAR-NAME . . . . . . . . . . .  M256 M346 M460 M576 M684 M793 M901 M1009 M1117 M1225 M1332 M1440 M1469 M1496
                                            M1514 M1556 M1582 M1617 M1678 M1750 M1843 M1973 M2044 M2134 M2223 M2337 M2381
                                            M2497 M2637 M2754 M2801 M2832 M2974
       94   PARDOT-X . . . . . . . . . . .  M248
      143   PASS-COUNTER . . . . . . . . .  M242 274 276
       35   PRINT-FILE . . . . . . . . . .  31 230 236
       36   PRINT-REC. . . . . . . . . . .  M250 M326 M328
       97   RE-MARK. . . . . . . . . . . .  M245 M257 M370 M486 M1491 M1534 M1577 M1639 M2245 M2357 M2405 M2517 M2593 M2611
                                            M2629 M2930 M2948 M2966 M3030 M3048 M3066
      139   REC-CT . . . . . . . . . . . .  247 249 256 M354 M375 M392 M409 M426 M443 M469 M491 M508 M525 M542 M559 M585
                                            M616 M633 M650 M667 M694 M725 M742 M759 M776 M802 M833 M850 M867 M884 M910 M941
                                            M958 M975 M992 M1018 M1049 M1066 M1083 M1100 M1126 M1157 M1174 M1191 M1208 M1234
                                            M1265 M1298 M1315 M1341 M1372 M1389 M1406 M1423 M1449 M1478 M1497 M1523 M1539
                                            M1564 M1583 M1600 M1626 M1644 M1661 M1688 M1716 M1733 M1760 M1791 M1808 M1825
                                            M1842 M1855 M1888 M1905 M1922 M1939 M1956 M1982 M2010 M2027 M2054 M2083 M2100
                                            M2117 M2140 M2170 M2187 M2204 M2230 M2250 M2267 M2284 M2301 M2318 M2344 M2362
                                            M2388 M2410 M2427 M2444 M2461 M2478 M2504 M2522 M2545 M2564 M2581 M2599 M2617
                                            M2645 M2668 M2685 M2702 M2719 M2736 M2762 M2781 M2809 M2833 M2850 M2867 M2884
                                            M2901 M2918 M2936 M2954 M2982 M3001 M3018 M3036 M3054
      138   REC-SKL-SUB
      147   RECORD-COUNT . . . . . . . . .  M301 302 M310
       98   TEST-COMPUTED. . . . . . . . .  326
      113   TEST-CORRECT . . . . . . . . .  328
      166   TEST-ID. . . . . . . . . . . .  M231
       86   TEST-RESULTS . . . . . . . . .  M232 250
      144   TOTAL-ERROR
       39   WRK-XN-00001-1 . . . . . . . .  M2542 M2550 M2553 2582 2591 M2646 M2657 M2763 M2770 M2810 M2821 2919 2928 M2983
                                            M2990 3019 3028
       40   WRK-XN-00001-2 . . . . . . . .  M2543 M2551 M2554 2600 2609 M2647 M2658 M2764 M2771 M2811 M2822 2937 2946 M2984
                                            M2991 3037 3046
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    61
0 Defined   Cross-reference of data names   References

0      41   WRK-XN-00001-3 . . . . . . . .  M2544 M2556 2618 2627 M2648 M2660 M2765 M2773 M2812 M2824 2955 2964 M2985 M2993
                                            3055 3064
      215   XXCOMPUTED . . . . . . . . . .  M335
      217   XXCORRECT. . . . . . . . . . .  M335
      210   XXINFO . . . . . . . . . . . .  322 337
       42   ZERO-XN-1. . . . . . . . . . .  M688 697 1129 1237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    62
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

      331   BAIL-OUT . . . . . . . . . . .  P253
      339   BAIL-OUT-EX. . . . . . . . . .  E253 G333
      334   BAIL-OUT-WRITE . . . . . . . .  G332
      315   BLANK-LINE-PRINT
     3071   CCVS-EXIT. . . . . . . . . . .  G2998
     3072   CCVS-999999
      228   CCVS1
      340   CCVS1-EXIT . . . . . . . . . .  G234
      235   CLOSE-FILES. . . . . . . . . .  G3073
      263   COLUMN-NAMES-ROUTINE . . . . .  E233
      244   DE-LETE. . . . . . . . . . . .  P365 P382 P399 P416 P433 P450 P481 P498 P515 P532 P549 P566 P595 P606 P623 P640
                                            P657 P674 P704 P715 P732 P749 P766 P783 P812 P823 P840 P857 P874 P891 P920 P931
                                            P948 P965 P982 P999 P1028 P1039 P1056 P1073 P1090 P1107 P1136 P1147 P1164 P1181
                                            P1198 P1215 P1244 P1255 P1272 P1288 P1305 P1322 P1351 P1362 P1379 P1396 P1413
                                            P1430 P1459 P1486 P1504 P1529 P1546 P1572 P1590 P1607 P1634 P1651 P1668 P1695
                                            P1706 P1723 P1740 P1770 P1781 P1798 P1815 P1832 P1867 P1878 P1895 P1912 P1929
                                            P1946 P1963 P1989 P2000 P2017 P2034 P2062 P2073 P2090 P2107 P2124 P2149 P2160
                                            P2177 P2194 P2211 P2240 P2257 P2274 P2291 P2308 P2325 P2352 P2369 P2400 P2417
                                            P2434 P2451 P2468 P2485 P2512 P2529 P2559 P2571 P2588 P2606 P2624 P2663 P2675
                                            P2692 P2709 P2726 P2743 P2776 P2788 P2827 P2840 P2857 P2874 P2891 P2908 P2925
                                            P2943 P2961 P2996 P3008 P3025 P3043 P3061
      267   END-ROUTINE. . . . . . . . . .  P236
      271   END-ROUTINE-1
      280   END-ROUTINE-12
      288   END-ROUTINE-13 . . . . . . . .  E236
      269   END-RTN-EXIT
      243   FAIL . . . . . . . . . . . . .  P369 P385 P402 P419 P436 P453 P485 P501 P518 P535 P552 P569 P609 P626 P643 P660
                                            P677 P718 P735 P752 P769 P786 P826 P843 P860 P877 P894 P934 P951 P968 P985 P1002
                                            P1042 P1059 P1076 P1093 P1110 P1150 P1167 P1184 P1201 P1218 P1258 P1275 P1291
                                            P1308 P1325 P1365 P1382 P1399 P1416 P1433 P1462 P1490 P1507 P1533 P1549 P1576
                                            P1593 P1610 P1638 P1654 P1671 P1709 P1726 P1743 P1784 P1801 P1818 P1835 P1881
                                            P1898 P1915 P1932 P1949 P1966 P2003 P2020 P2037 P2076 P2093 P2110 P2127 P2163
                                            P2180 P2197 P2214 P2244 P2260 P2277 P2294 P2311 P2328 P2356 P2372 P2404 P2420
                                            P2437 P2454 P2471 P2488 P2516 P2532 P2574 P2594 P2612 P2630 P2678 P2695 P2712
                                            P2729 P2746 P2791 P2843 P2860 P2877 P2894 P2911 P2931 P2949 P2967 P3011 P3031
                                            P3049 P3067
      317   FAIL-ROUTINE . . . . . . . . .  P252
      330   FAIL-ROUTINE-EX. . . . . . . .  E252 G324
      325   FAIL-ROUTINE-WRITE . . . . . .  G318 G319
      258   HEAD-ROUTINE . . . . . . . . .  P233
      241   INSPT
      229   OPEN-FILES
      242   PASS . . . . . . . . . . . . .  P361 P377 P394 P411 P428 P445 P477 P493 P510 P527 P544 P561 P601 P618 P635 P652
                                            P669 P710 P727 P744 P761 P778 P818 P835 P852 P869 P886 P926 P943 P960 P977 P994
                                            P1034 P1051 P1068 P1085 P1102 P1142 P1159 P1176 P1193 P1210 P1250 P1267 P1283
                                            P1300 P1317 P1357 P1374 P1391 P1408 P1425 P1454 P1483 P1499 P1525 P1541 P1568
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    63
0 Defined   Cross-reference of procedures   References

0                                           P1585 P1602 P1631 P1646 P1663 P1701 P1718 P1735 P1776 P1793 P1810 P1827 P1873
                                            P1890 P1907 P1924 P1941 P1958 P1995 P2012 P2029 P2068 P2085 P2102 P2119 P2155
                                            P2172 P2189 P2206 P2237 P2252 P2269 P2286 P2303 P2320 P2348 P2364 P2396 P2412
                                            P2429 P2446 P2463 P2480 P2509 P2524 P2566 P2583 P2601 P2619 P2670 P2687 P2704
                                            P2721 P2738 P2783 P2835 P2852 P2869 P2886 P2903 P2920 P2938 P2956 P3003 P3020
                                            P3038 P3056
      246   PRINT-DETAIL . . . . . . . . .  P366 P372 P389 P406 P423 P440 P457 P482 P488 P505 P522 P539 P556 P573 P596 P613
                                            P630 P647 P664 P681 P705 P722 P739 P756 P773 P790 P813 P830 P847 P864 P881 P898
                                            P921 P938 P955 P972 P989 P1006 P1029 P1046 P1063 P1080 P1097 P1114 P1137 P1154
                                            P1171 P1188 P1205 P1222 P1245 P1262 P1279 P1295 P1312 P1329 P1352 P1369 P1386
                                            P1403 P1420 P1437 P1466 P1487 P1493 P1511 P1530 P1536 P1553 P1573 P1579 P1597
                                            P1614 P1635 P1641 P1658 P1675 P1696 P1713 P1730 P1747 P1771 P1788 P1805 P1822
                                            P1839 P1868 P1885 P1902 P1919 P1936 P1953 P1970 P1990 P2007 P2024 P2041 P2063
                                            P2080 P2097 P2114 P2131 P2150 P2167 P2184 P2201 P2218 P2241 P2247 P2264 P2281
                                            P2298 P2315 P2332 P2353 P2359 P2376 P2401 P2407 P2424 P2441 P2458 P2475 P2492
                                            P2513 P2519 P2536 P2560 P2578 P2596 P2614 P2632 P2664 P2682 P2699 P2716 P2733
                                            P2777 P2795 P2828 P2847 P2864 P2881 P2898 P2915 P2933 P2951 P2969 P2997 P3015
                                            P3033 P3051 P3069
      342   SECT-NC218A-001
      239   TERMINATE-CALL
      237   TERMINATE-CCVS
     2148   UNSTRING-DELETE
      364   UST-DELETE-GF-1
      381   UST-DELETE-GF-1-1
      398   UST-DELETE-GF-1-2
      415   UST-DELETE-GF-1-3
      432   UST-DELETE-GF-1-4
      449   UST-DELETE-GF-1-5
     1350   UST-DELETE-GF-10
     1361   UST-DELETE-GF-10-1
     1378   UST-DELETE-GF-10-2
     1395   UST-DELETE-GF-10-3
     1412   UST-DELETE-GF-10-4
     1429   UST-DELETE-GF-10-5
     1458   UST-DELETE-GF-11-1
     1485   UST-DELETE-GF-12-1
     1503   UST-DELETE-GF-12-2
     1528   UST-DELETE-GF-13-1
     1545   UST-DELETE-GF-13-2
     1571   UST-DELETE-GF-14-1
     1589   UST-DELETE-GF-14-2
     1606   UST-DELETE-GF-14-3
     1633   UST-DELETE-GF-15-1
     1650   UST-DELETE-GF-15-2
     1667   UST-DELETE-GF-15-3
     1694   UST-DELETE-GF-16
     1705   UST-DELETE-GF-16-1
     1722   UST-DELETE-GF-16-2
     1739   UST-DELETE-GF-16-3
     1769   UST-DELETE-GF-17
     1780   UST-DELETE-GF-17-1
     1797   UST-DELETE-GF-17-2
     1814   UST-DELETE-GF-17-3
     1831   UST-DELETE-GF-17-4
     1866   UST-DELETE-GF-18
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    64
0 Defined   Cross-reference of procedures   References

0    1877   UST-DELETE-GF-18-1
     1894   UST-DELETE-GF-18-2
     1911   UST-DELETE-GF-18-3
     1928   UST-DELETE-GF-18-4
     1945   UST-DELETE-GF-18-5
     1962   UST-DELETE-GF-18-6
     1988   UST-DELETE-GF-19
     1999   UST-DELETE-GF-19-1
     2016   UST-DELETE-GF-19-2
     2033   UST-DELETE-GF-19-3
      480   UST-DELETE-GF-2
      497   UST-DELETE-GF-2-1
      514   UST-DELETE-GF-2-2
      531   UST-DELETE-GF-2-3
      548   UST-DELETE-GF-2-4
      565   UST-DELETE-GF-2-5
     2061   UST-DELETE-GF-20
     2072   UST-DELETE-GF-20-1
     2089   UST-DELETE-GF-20-2
     2106   UST-DELETE-GF-20-3
     2123   UST-DELETE-GF-20-4
     2159   UST-DELETE-GF-21-1
     2176   UST-DELETE-GF-21-2
     2193   UST-DELETE-GF-21-3
     2210   UST-DELETE-GF-21-4
     2239   UST-DELETE-GF-22-1
     2256   UST-DELETE-GF-22-2
     2273   UST-DELETE-GF-22-3
     2290   UST-DELETE-GF-22-4
     2307   UST-DELETE-GF-22-5
     2324   UST-DELETE-GF-22-6
     2351   UST-DELETE-GF-23-1
     2368   UST-DELETE-GF-23-2
     2399   UST-DELETE-GF-24-1
     2416   UST-DELETE-GF-24-2
     2433   UST-DELETE-GF-24-3
     2450   UST-DELETE-GF-24-4
     2467   UST-DELETE-GF-24-5
     2484   UST-DELETE-GF-24-6
     2511   UST-DELETE-GF-25-1
     2528   UST-DELETE-GF-25-2
     2558   UST-DELETE-GF-26
     2570   UST-DELETE-GF-26-1
     2587   UST-DELETE-GF-26-2
     2605   UST-DELETE-GF-26-3
     2623   UST-DELETE-GF-26-4
     2662   UST-DELETE-GF-27
     2674   UST-DELETE-GF-27-1
     2691   UST-DELETE-GF-27-2
     2708   UST-DELETE-GF-27-3
     2725   UST-DELETE-GF-27-4
     2742   UST-DELETE-GF-27-5
     2775   UST-DELETE-GF-28
     2787   UST-DELETE-GF-28-1
     2826   UST-DELETE-GF-29
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    65
0 Defined   Cross-reference of procedures   References

0    2839   UST-DELETE-GF-29-1
     2856   UST-DELETE-GF-29-2
     2873   UST-DELETE-GF-29-3
     2890   UST-DELETE-GF-29-4
     2907   UST-DELETE-GF-29-5
     2924   UST-DELETE-GF-29-6
     2942   UST-DELETE-GF-29-7
     2960   UST-DELETE-GF-29-8
      594   UST-DELETE-GF-3
      605   UST-DELETE-GF-3-1
      622   UST-DELETE-GF-3-2
      639   UST-DELETE-GF-3-3
      656   UST-DELETE-GF-3-4
      673   UST-DELETE-GF-3-5
     2995   UST-DELETE-GF-30
     3007   UST-DELETE-GF-30-1
     3024   UST-DELETE-GF-30-2
     3042   UST-DELETE-GF-30-3
     3060   UST-DELETE-GF-30-4
      703   UST-DELETE-GF-4
      714   UST-DELETE-GF-4-1
      731   UST-DELETE-GF-4-2
      748   UST-DELETE-GF-4-3
      765   UST-DELETE-GF-4-4
      782   UST-DELETE-GF-4-5
      811   UST-DELETE-GF-5
      822   UST-DELETE-GF-5-1
      839   UST-DELETE-GF-5-2
      856   UST-DELETE-GF-5-3
      873   UST-DELETE-GF-5-4
      890   UST-DELETE-GF-5-5
      919   UST-DELETE-GF-6
      930   UST-DELETE-GF-6-1
      947   UST-DELETE-GF-6-2
      964   UST-DELETE-GF-6-3
      981   UST-DELETE-GF-6-4
      998   UST-DELETE-GF-6-5
     1027   UST-DELETE-GF-7
     1038   UST-DELETE-GF-7-1
     1055   UST-DELETE-GF-7-2
     1072   UST-DELETE-GF-7-3
     1089   UST-DELETE-GF-7-4
     1106   UST-DELETE-GF-7-5
     1135   UST-DELETE-GF-8
     1146   UST-DELETE-GF-8-1
     1163   UST-DELETE-GF-8-2
     1180   UST-DELETE-GF-8-3
     1197   UST-DELETE-GF-8-4
     1214   UST-DELETE-GF-8-5
     1243   UST-DELETE-GF-9
     1254   UST-DELETE-GF-9-1
     1271   UST-DELETE-GF-9-2
     1287   UST-DELETE-GF-9-3
     1304   UST-DELETE-GF-9-4
     1321   UST-DELETE-GF-9-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    66
0 Defined   Cross-reference of procedures   References

0     368   UST-FAIL-GF-1. . . . . . . . .  G363
      384   UST-FAIL-GF-1-1. . . . . . . .  G380
      401   UST-FAIL-GF-1-2. . . . . . . .  G397
      418   UST-FAIL-GF-1-3. . . . . . . .  G414
      435   UST-FAIL-GF-1-4. . . . . . . .  G431
      452   UST-FAIL-GF-1-5. . . . . . . .  G448
     1364   UST-FAIL-GF-10-1 . . . . . . .  G1360
     1381   UST-FAIL-GF-10-2 . . . . . . .  G1377
     1398   UST-FAIL-GF-10-3 . . . . . . .  G1394
     1415   UST-FAIL-GF-10-4 . . . . . . .  G1411
     1432   UST-FAIL-GF-10-5 . . . . . . .  G1428
     1461   UST-FAIL-GF-11-1 . . . . . . .  G1457
     1489   UST-FAIL-GF-12-1 . . . . . . .  G1482
     1506   UST-FAIL-GF-12-2 . . . . . . .  G1502
     1532   UST-FAIL-GF-13-1 . . . . . . .  G1527
     1548   UST-FAIL-GF-13-2 . . . . . . .  G1544
     1575   UST-FAIL-GF-14-1 . . . . . . .  G1570
     1592   UST-FAIL-GF-14-2 . . . . . . .  G1588
     1609   UST-FAIL-GF-14-3 . . . . . . .  G1605
     1637   UST-FAIL-GF-15-1 . . . . . . .  G1630
     1653   UST-FAIL-GF-15-2 . . . . . . .  G1649
     1670   UST-FAIL-GF-15-3 . . . . . . .  G1666
     1708   UST-FAIL-GF-16-1 . . . . . . .  G1704
     1725   UST-FAIL-GF-16-2 . . . . . . .  G1721
     1742   UST-FAIL-GF-16-3 . . . . . . .  G1738
     1783   UST-FAIL-GF-17-1 . . . . . . .  G1779
     1800   UST-FAIL-GF-17-2 . . . . . . .  G1796
     1817   UST-FAIL-GF-17-3 . . . . . . .  G1813
     1834   UST-FAIL-GF-17-4 . . . . . . .  G1830
     1880   UST-FAIL-GF-18-1 . . . . . . .  G1876
     1897   UST-FAIL-GF-18-2 . . . . . . .  G1893
     1914   UST-FAIL-GF-18-3 . . . . . . .  G1910
     1931   UST-FAIL-GF-18-4 . . . . . . .  G1927
     1948   UST-FAIL-GF-18-5 . . . . . . .  G1944
     1965   UST-FAIL-GF-18-6 . . . . . . .  G1961
     2002   UST-FAIL-GF-19-1 . . . . . . .  G1998
     2019   UST-FAIL-GF-19-2 . . . . . . .  G2015
     2036   UST-FAIL-GF-19-3 . . . . . . .  G2032
      484   UST-FAIL-GF-2. . . . . . . . .  G479
      500   UST-FAIL-GF-2-1. . . . . . . .  G496
      517   UST-FAIL-GF-2-2. . . . . . . .  G513
      534   UST-FAIL-GF-2-3. . . . . . . .  G530
      551   UST-FAIL-GF-2-4. . . . . . . .  G547
      568   UST-FAIL-GF-2-5. . . . . . . .  G564
     2075   UST-FAIL-GF-20-1 . . . . . . .  G2071
     2092   UST-FAIL-GF-20-2 . . . . . . .  G2088
     2109   UST-FAIL-GF-20-3 . . . . . . .  G2105
     2126   UST-FAIL-GF-20-4 . . . . . . .  G2122
     2162   UST-FAIL-GF-21-1 . . . . . . .  G2158
     2179   UST-FAIL-GF-21-2 . . . . . . .  G2175
     2196   UST-FAIL-GF-21-3 . . . . . . .  G2192
     2213   UST-FAIL-GF-21-4 . . . . . . .  G2209
     2243   UST-FAIL-GF-22-1 . . . . . . .  G2236
     2259   UST-FAIL-GF-22-2 . . . . . . .  G2255
     2276   UST-FAIL-GF-22-3 . . . . . . .  G2272
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    67
0 Defined   Cross-reference of procedures   References

0    2293   UST-FAIL-GF-22-4 . . . . . . .  G2289
     2310   UST-FAIL-GF-22-5 . . . . . . .  G2306
     2327   UST-FAIL-GF-22-6 . . . . . . .  G2323
     2355   UST-FAIL-GF-23-1 . . . . . . .  G2350
     2371   UST-FAIL-GF-23-2 . . . . . . .  G2367
     2403   UST-FAIL-GF-24-1 . . . . . . .  G2398
     2419   UST-FAIL-GF-24-2 . . . . . . .  G2415
     2436   UST-FAIL-GF-24-3 . . . . . . .  G2432
     2453   UST-FAIL-GF-24-4 . . . . . . .  G2449
     2470   UST-FAIL-GF-24-5 . . . . . . .  G2466
     2487   UST-FAIL-GF-24-6 . . . . . . .  G2483
     2515   UST-FAIL-GF-25-1 . . . . . . .  G2508
     2531   UST-FAIL-GF-25-2 . . . . . . .  G2527
     2573   UST-FAIL-GF-26-1 . . . . . . .  G2569
     2590   UST-FAIL-GF-26-2 . . . . . . .  G2586
     2608   UST-FAIL-GF-26-3 . . . . . . .  G2604
     2626   UST-FAIL-GF-26-4 . . . . . . .  G2622
     2677   UST-FAIL-GF-27-1 . . . . . . .  G2673
     2694   UST-FAIL-GF-27-2 . . . . . . .  G2690
     2711   UST-FAIL-GF-27-3 . . . . . . .  G2707
     2728   UST-FAIL-GF-27-4 . . . . . . .  G2724
     2745   UST-FAIL-GF-27-5 . . . . . . .  G2741
     2790   UST-FAIL-GF-28-1 . . . . . . .  G2786
     2842   UST-FAIL-GF-29-1 . . . . . . .  G2838
     2859   UST-FAIL-GF-29-2 . . . . . . .  G2855
     2876   UST-FAIL-GF-29-3 . . . . . . .  G2872
     2893   UST-FAIL-GF-29-4 . . . . . . .  G2889
     2910   UST-FAIL-GF-29-5 . . . . . . .  G2906
     2927   UST-FAIL-GF-29-6 . . . . . . .  G2923
     2945   UST-FAIL-GF-29-7 . . . . . . .  G2941
     2963   UST-FAIL-GF-29-8 . . . . . . .  G2959
      608   UST-FAIL-GF-3-1. . . . . . . .  G604
      625   UST-FAIL-GF-3-2. . . . . . . .  G621
      642   UST-FAIL-GF-3-3. . . . . . . .  G638
      659   UST-FAIL-GF-3-4. . . . . . . .  G655
      676   UST-FAIL-GF-3-5. . . . . . . .  G672
     3010   UST-FAIL-GF-30-1 . . . . . . .  G3006
     3027   UST-FAIL-GF-30-2 . . . . . . .  G3023
     3045   UST-FAIL-GF-30-3 . . . . . . .  G3041
     3063   UST-FAIL-GF-30-4 . . . . . . .  G3059
      717   UST-FAIL-GF-4-1. . . . . . . .  G713
      734   UST-FAIL-GF-4-2. . . . . . . .  G730
      751   UST-FAIL-GF-4-3. . . . . . . .  G747
      768   UST-FAIL-GF-4-4. . . . . . . .  G764
      785   UST-FAIL-GF-4-5. . . . . . . .  G781
      825   UST-FAIL-GF-5-1. . . . . . . .  G821
      842   UST-FAIL-GF-5-2. . . . . . . .  G838
      859   UST-FAIL-GF-5-3. . . . . . . .  G855
      876   UST-FAIL-GF-5-4. . . . . . . .  G872
      893   UST-FAIL-GF-5-5. . . . . . . .  G889
      933   UST-FAIL-GF-6-1. . . . . . . .  G929
      950   UST-FAIL-GF-6-2. . . . . . . .  G946
      967   UST-FAIL-GF-6-3. . . . . . . .  G963
      984   UST-FAIL-GF-6-4. . . . . . . .  G980
     1001   UST-FAIL-GF-6-5. . . . . . . .  G997
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    68
0 Defined   Cross-reference of procedures   References

0    1041   UST-FAIL-GF-7-1. . . . . . . .  G1037
     1058   UST-FAIL-GF-7-2. . . . . . . .  G1054
     1075   UST-FAIL-GF-7-3. . . . . . . .  G1071
     1092   UST-FAIL-GF-7-4. . . . . . . .  G1088
     1109   UST-FAIL-GF-7-5. . . . . . . .  G1105
     1149   UST-FAIL-GF-8-1. . . . . . . .  G1145
     1166   UST-FAIL-GF-8-2. . . . . . . .  G1162
     1183   UST-FAIL-GF-8-3. . . . . . . .  G1179
     1200   UST-FAIL-GF-8-4. . . . . . . .  G1196
     1217   UST-FAIL-GF-8-5. . . . . . . .  G1213
     1257   UST-FAIL-GF-9-1. . . . . . . .  G1253
     1274   UST-FAIL-GF-9-2. . . . . . . .  G1270
     1290   UST-FAIL-GF-9-3. . . . . . . .  G1286
     1307   UST-FAIL-GF-9-4. . . . . . . .  G1303
     1324   UST-FAIL-GF-9-5. . . . . . . .  G1320
      344   UST-INIT-GF-1
     1331   UST-INIT-GF-10 . . . . . . . .  G1246
     1439   UST-INIT-GF-11 . . . . . . . .  G1353
     1468   UST-INIT-GF-12
     1513   UST-INIT-GF-13 . . . . . . . .  G1488
     1555   UST-INIT-GF-14 . . . . . . . .  G1531
     1616   UST-INIT-GF-15 . . . . . . . .  G1574
     1677   UST-INIT-GF-16 . . . . . . . .  G1636
     1749   UST-INIT-GF-17 . . . . . . . .  G1697
     1841   UST-INIT-GF-18 . . . . . . . .  G1772
     1972   UST-INIT-GF-19 . . . . . . . .  G1869
      459   UST-INIT-GF-2. . . . . . . . .  G367
     2043   UST-INIT-GF-20 . . . . . . . .  G1991
     2133   UST-INIT-GF-21 . . . . . . . .  G2064
     2220   UST-INIT-GF-22 . . . . . . . .  G2151
     2334   UST-INIT-GF-23 . . . . . . . .  G2242
     2378   UST-INIT-GF-24 . . . . . . . .  G2354
     2494   UST-INIT-GF-25 . . . . . . . .  G2402
     2538   UST-INIT-GF-26 . . . . . . . .  G2514
     2634   UST-INIT-GF-27 . . . . . . . .  G2561
     2751   UST-INIT-GF-28 . . . . . . . .  G2665
     2798   UST-INIT-GF-29 . . . . . . . .  G2778
      575   UST-INIT-GF-3. . . . . . . . .  G483
     2971   UST-INIT-GF-30 . . . . . . . .  G2829
      683   UST-INIT-GF-4. . . . . . . . .  G597
      792   UST-INIT-GF-5. . . . . . . . .  G706
      900   UST-INIT-GF-6. . . . . . . . .  G814
     1008   UST-INIT-GF-7. . . . . . . . .  G922
     1116   UST-INIT-GF-8. . . . . . . . .  G1030
     1224   UST-INIT-GF-9. . . . . . . . .  G1138
      355   UST-TEST-GF-1
      374   UST-TEST-GF-1-1
      391   UST-TEST-GF-1-2
      408   UST-TEST-GF-1-3
      425   UST-TEST-GF-1-4
      442   UST-TEST-GF-1-5
     1343   UST-TEST-GF-10
     1355   UST-TEST-GF-10-1 . . . . . . .  G1349
     1371   UST-TEST-GF-10-2
     1388   UST-TEST-GF-10-3
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    69
0 Defined   Cross-reference of procedures   References

0    1405   UST-TEST-GF-10-4
     1422   UST-TEST-GF-10-5
     1451   UST-TEST-GF-11
     1480   UST-TEST-GF-12-1
     1495   UST-TEST-GF-12-2
     1524   UST-TEST-GF-13-1
     1538   UST-TEST-GF-13-2
     1566   UST-TEST-GF-14-1
     1581   UST-TEST-GF-14-2
     1599   UST-TEST-GF-14-3
     1628   UST-TEST-GF-15-1
     1643   UST-TEST-GF-15-2
     1660   UST-TEST-GF-15-3
     1690   UST-TEST-GF-16-0
     1699   UST-TEST-GF-16-1 . . . . . . .  G1693
     1715   UST-TEST-GF-16-2
     1732   UST-TEST-GF-16-3
     1762   UST-TEST-GF-17
     1774   UST-TEST-GF-17-1 . . . . . . .  G1768
     1790   UST-TEST-GF-17-2
     1807   UST-TEST-GF-17-3
     1824   UST-TEST-GF-17-4
     1857   UST-TEST-GF-18
     1871   UST-TEST-GF-18-1 . . . . . . .  G1865
     1887   UST-TEST-GF-18-2
     1904   UST-TEST-GF-18-3
     1921   UST-TEST-GF-18-4
     1938   UST-TEST-GF-18-5
     1955   UST-TEST-GF-18-6
     1984   UST-TEST-GF-19-0
     1993   UST-TEST-GF-19-1 . . . . . . .  G1987
     2009   UST-TEST-GF-19-2
     2026   UST-TEST-GF-19-3
      471   UST-TEST-GF-2
      490   UST-TEST-GF-2-1
      507   UST-TEST-GF-2-2
      524   UST-TEST-GF-2-3
      541   UST-TEST-GF-2-4
      558   UST-TEST-GF-2-5
     2056   UST-TEST-GF-20
     2066   UST-TEST-GF-20-1 . . . . . . .  G2060
     2082   UST-TEST-GF-20-2
     2099   UST-TEST-GF-20-3
     2116   UST-TEST-GF-20-4
     2142   UST-TEST-GF-21
     2153   UST-TEST-GF-21-1 . . . . . . .  G2147
     2169   UST-TEST-GF-21-2
     2186   UST-TEST-GF-21-3
     2203   UST-TEST-GF-21-4
     2232   UST-TEST-GF-22-1
     2249   UST-TEST-GF-22-2
     2266   UST-TEST-GF-22-3
     2283   UST-TEST-GF-22-4
     2300   UST-TEST-GF-22-5
     2317   UST-TEST-GF-22-6
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    70
0 Defined   Cross-reference of procedures   References

0    2346   UST-TEST-GF-23-1
     2361   UST-TEST-GF-23-2
     2390   UST-TEST-GF-24-1
     2409   UST-TEST-GF-24-2
     2426   UST-TEST-GF-24-3
     2443   UST-TEST-GF-24-4
     2460   UST-TEST-GF-24-5
     2477   UST-TEST-GF-24-6
     2506   UST-TEST-GF-25-1
     2521   UST-TEST-GF-25-2
     2547   UST-TEST-GF-26-0
     2563   UST-TEST-GF-26-1 . . . . . . .  G2557
     2580   UST-TEST-GF-26-2
     2598   UST-TEST-GF-26-3
     2616   UST-TEST-GF-26-4
     2650   UST-TEST-GF-27-0
     2667   UST-TEST-GF-27-1 . . . . . . .  G2661
     2684   UST-TEST-GF-27-2
     2701   UST-TEST-GF-27-3
     2718   UST-TEST-GF-27-4
     2735   UST-TEST-GF-27-5
     2767   UST-TEST-GF-28-0
     2780   UST-TEST-GF-28-1 . . . . . . .  G2774
     2814   UST-TEST-GF-29-0
     2831   UST-TEST-GF-29-1 . . . . . . .  G2825
     2849   UST-TEST-GF-29-2
     2866   UST-TEST-GF-29-3
     2883   UST-TEST-GF-29-4
     2900   UST-TEST-GF-29-5
     2917   UST-TEST-GF-29-6
     2935   UST-TEST-GF-29-7
     2953   UST-TEST-GF-29-8
      587   UST-TEST-GF-3
      599   UST-TEST-GF-3-1. . . . . . . .  G593
      615   UST-TEST-GF-3-2
      632   UST-TEST-GF-3-3
      649   UST-TEST-GF-3-4
      666   UST-TEST-GF-3-5
     2987   UST-TEST-GF-30-0
     3000   UST-TEST-GF-30-1 . . . . . . .  G2994
     3017   UST-TEST-GF-30-2
     3035   UST-TEST-GF-30-3
     3053   UST-TEST-GF-30-4
      696   UST-TEST-GF-4
      708   UST-TEST-GF-4-1. . . . . . . .  G702
      724   UST-TEST-GF-4-2
      741   UST-TEST-GF-4-3
      758   UST-TEST-GF-4-4
      775   UST-TEST-GF-4-5
      804   UST-TEST-GF-5
      816   UST-TEST-GF-5-1. . . . . . . .  G810
      832   UST-TEST-GF-5-2
      849   UST-TEST-GF-5-3
      866   UST-TEST-GF-5-4
      883   UST-TEST-GF-5-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    71
0 Defined   Cross-reference of procedures   References

0     912   UST-TEST-GF-6
      924   UST-TEST-GF-6-1. . . . . . . .  G918
      940   UST-TEST-GF-6-2
      957   UST-TEST-GF-6-3
      974   UST-TEST-GF-6-4
      991   UST-TEST-GF-6-5
     1020   UST-TEST-GF-7
     1032   UST-TEST-GF-7-1. . . . . . . .  G1026
     1048   UST-TEST-GF-7-2
     1065   UST-TEST-GF-7-3
     1082   UST-TEST-GF-7-4
     1099   UST-TEST-GF-7-5
     1128   UST-TEST-GF-8
     1140   UST-TEST-GF-8-1. . . . . . . .  G1134
     1156   UST-TEST-GF-8-2
     1173   UST-TEST-GF-8-3
     1190   UST-TEST-GF-8-4
     1207   UST-TEST-GF-8-5
     1236   UST-TEST-GF-9
     1248   UST-TEST-GF-9-1. . . . . . . .  G1242
     1264   UST-TEST-GF-9-2
     1281   UST-TEST-GF-9-3
     1297   UST-TEST-GF-9-4
     1314   UST-TEST-GF-9-5
      371   UST-WRITE-GF-1 . . . . . . . .  G362
      388   UST-WRITE-GF-1-1 . . . . . . .  G378 G383
      405   UST-WRITE-GF-1-2 . . . . . . .  G395 G400
      422   UST-WRITE-GF-1-3 . . . . . . .  G412 G417
      439   UST-WRITE-GF-1-4 . . . . . . .  G429 G434
      456   UST-WRITE-GF-1-5 . . . . . . .  G446 G451
     1368   UST-WRITE-GF-10-1. . . . . . .  G1358 G1363
     1385   UST-WRITE-GF-10-2. . . . . . .  G1375 G1380
     1402   UST-WRITE-GF-10-3. . . . . . .  G1392 G1397
     1419   UST-WRITE-GF-10-4. . . . . . .  G1409 G1414
     1436   UST-WRITE-GF-10-5. . . . . . .  G1426 G1431
     1465   UST-WRITE-GF-11-1. . . . . . .  G1455 G1460
     1492   UST-WRITE-GF-12-1. . . . . . .  G1484
     1510   UST-WRITE-GF-12-2. . . . . . .  G1500 G1505
     1535   UST-WRITE-GF-13-1. . . . . . .  G1526
     1552   UST-WRITE-GF-13-2. . . . . . .  G1542 G1547
     1578   UST-WRITE-GF-14-1. . . . . . .  G1569
     1596   UST-WRITE-GF-14-2. . . . . . .  G1586 G1591
     1613   UST-WRITE-GF-14-3. . . . . . .  G1603 G1608
     1640   UST-WRITE-GF-15-1. . . . . . .  G1632
     1657   UST-WRITE-GF-15-2. . . . . . .  G1647 G1652
     1674   UST-WRITE-GF-15-3. . . . . . .  G1664 G1669
     1712   UST-WRITE-GF-16-1. . . . . . .  G1702 G1707
     1729   UST-WRITE-GF-16-2. . . . . . .  G1719 G1724
     1746   UST-WRITE-GF-16-3. . . . . . .  G1736 G1741
     1787   UST-WRITE-GF-17-1. . . . . . .  G1777 G1782
     1804   UST-WRITE-GF-17-2. . . . . . .  G1794 G1799
     1821   UST-WRITE-GF-17-3. . . . . . .  G1811 G1816
     1838   UST-WRITE-GF-17-4. . . . . . .  G1828 G1833
     1884   UST-WRITE-GF-18-1. . . . . . .  G1874 G1879
     1901   UST-WRITE-GF-18-2. . . . . . .  G1891 G1896
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    72
0 Defined   Cross-reference of procedures   References

0    1918   UST-WRITE-GF-18-3. . . . . . .  G1908 G1913
     1935   UST-WRITE-GF-18-4. . . . . . .  G1925 G1930
     1952   UST-WRITE-GF-18-5. . . . . . .  G1942 G1947
     1969   UST-WRITE-GF-18-6. . . . . . .  G1959 G1964
     2006   UST-WRITE-GF-19-1. . . . . . .  G1996 G2001
     2023   UST-WRITE-GF-19-2. . . . . . .  G2013 G2018
     2040   UST-WRITE-GF-19-3. . . . . . .  G2030 G2035
      487   UST-WRITE-GF-2 . . . . . . . .  G478
      504   UST-WRITE-GF-2-1 . . . . . . .  G494 G499
      521   UST-WRITE-GF-2-2 . . . . . . .  G511 G516
      538   UST-WRITE-GF-2-3 . . . . . . .  G528 G533
      555   UST-WRITE-GF-2-4 . . . . . . .  G545 G550
      572   UST-WRITE-GF-2-5 . . . . . . .  G562 G567
     2079   UST-WRITE-GF-20-1. . . . . . .  G2069 G2074
     2096   UST-WRITE-GF-20-2. . . . . . .  G2086 G2091
     2113   UST-WRITE-GF-20-3. . . . . . .  G2103 G2108
     2130   UST-WRITE-GF-20-4. . . . . . .  G2120 G2125
     2166   UST-WRITE-GF-21-1. . . . . . .  G2156 G2161
     2183   UST-WRITE-GF-21-2. . . . . . .  G2173 G2178
     2200   UST-WRITE-GF-21-3. . . . . . .  G2190 G2195
     2217   UST-WRITE-GF-21-4. . . . . . .  G2207 G2212
     2246   UST-WRITE-GF-22-1. . . . . . .  G2238
     2263   UST-WRITE-GF-22-2. . . . . . .  G2253 G2258
     2280   UST-WRITE-GF-22-3. . . . . . .  G2270 G2275
     2297   UST-WRITE-GF-22-4. . . . . . .  G2287 G2292
     2314   UST-WRITE-GF-22-5. . . . . . .  G2304 G2309
     2331   UST-WRITE-GF-22-6. . . . . . .  G2321 G2326
     2358   UST-WRITE-GF-23-1. . . . . . .  G2349
     2375   UST-WRITE-GF-23-2. . . . . . .  G2365 G2370
     2406   UST-WRITE-GF-24-1. . . . . . .  G2397
     2423   UST-WRITE-GF-24-2. . . . . . .  G2413 G2418
     2440   UST-WRITE-GF-24-3. . . . . . .  G2430 G2435
     2457   UST-WRITE-GF-24-4. . . . . . .  G2447 G2452
     2474   UST-WRITE-GF-24-5. . . . . . .  G2464 G2469
     2491   UST-WRITE-GF-24-6. . . . . . .  G2481 G2486
     2518   UST-WRITE-GF-25-1. . . . . . .  G2510
     2535   UST-WRITE-GF-25-2. . . . . . .  G2525 G2530
     2577   UST-WRITE-GF-26-1. . . . . . .  G2567 G2572
     2595   UST-WRITE-GF-26-2. . . . . . .  G2584 G2589
     2613   UST-WRITE-GF-26-3. . . . . . .  G2602 G2607
     2631   UST-WRITE-GF-26-4. . . . . . .  G2620 G2625
     2681   UST-WRITE-GF-27-1. . . . . . .  G2671 G2676
     2698   UST-WRITE-GF-27-2. . . . . . .  G2688 G2693
     2715   UST-WRITE-GF-27-3. . . . . . .  G2705 G2710
     2732   UST-WRITE-GF-27-4. . . . . . .  G2722 G2727
     2749   UST-WRITE-GF-27-5. . . . . . .  G2739 G2744
     2794   UST-WRITE-GF-28-1. . . . . . .  G2784 G2789
     2846   UST-WRITE-GF-29-1. . . . . . .  G2836 G2841
     2863   UST-WRITE-GF-29-2. . . . . . .  G2853 G2858
     2880   UST-WRITE-GF-29-3. . . . . . .  G2870 G2875
     2897   UST-WRITE-GF-29-4. . . . . . .  G2887 G2892
     2914   UST-WRITE-GF-29-5. . . . . . .  G2904 G2909
     2932   UST-WRITE-GF-29-6. . . . . . .  G2921 G2926
     2950   UST-WRITE-GF-29-7. . . . . . .  G2939 G2944
     2968   UST-WRITE-GF-29-8. . . . . . .  G2957 G2962
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    73
0 Defined   Cross-reference of procedures   References

0     612   UST-WRITE-GF-3-1 . . . . . . .  G602 G607
      629   UST-WRITE-GF-3-2 . . . . . . .  G619 G624
      646   UST-WRITE-GF-3-3 . . . . . . .  G636 G641
      663   UST-WRITE-GF-3-4 . . . . . . .  G653 G658
      680   UST-WRITE-GF-3-5 . . . . . . .  G670 G675
     3014   UST-WRITE-GF-30-1. . . . . . .  G3004 G3009
     3032   UST-WRITE-GF-30-2. . . . . . .  G3021 G3026
     3050   UST-WRITE-GF-30-3. . . . . . .  G3039 G3044
     3068   UST-WRITE-GF-30-4. . . . . . .  G3057 G3062
      721   UST-WRITE-GF-4-1 . . . . . . .  G711 G716
      738   UST-WRITE-GF-4-2 . . . . . . .  G728 G733
      755   UST-WRITE-GF-4-3 . . . . . . .  G745 G750
      772   UST-WRITE-GF-4-4 . . . . . . .  G762 G767
      789   UST-WRITE-GF-4-5 . . . . . . .  G779 G784
      829   UST-WRITE-GF-5-1 . . . . . . .  G819 G824
      846   UST-WRITE-GF-5-2 . . . . . . .  G836 G841
      863   UST-WRITE-GF-5-3 . . . . . . .  G853 G858
      880   UST-WRITE-GF-5-4 . . . . . . .  G870 G875
      897   UST-WRITE-GF-5-5 . . . . . . .  G887 G892
      937   UST-WRITE-GF-6-1 . . . . . . .  G927 G932
      954   UST-WRITE-GF-6-2 . . . . . . .  G944 G949
      971   UST-WRITE-GF-6-3 . . . . . . .  G961 G966
      988   UST-WRITE-GF-6-4 . . . . . . .  G978 G983
     1005   UST-WRITE-GF-6-5 . . . . . . .  G995 G1000
     1045   UST-WRITE-GF-7-1 . . . . . . .  G1035 G1040
     1062   UST-WRITE-GF-7-2 . . . . . . .  G1052 G1057
     1079   UST-WRITE-GF-7-3 . . . . . . .  G1069 G1074
     1096   UST-WRITE-GF-7-4 . . . . . . .  G1086 G1091
     1113   UST-WRITE-GF-7-5 . . . . . . .  G1103 G1108
     1153   UST-WRITE-GF-8-1 . . . . . . .  G1143 G1148
     1170   UST-WRITE-GF-8-2 . . . . . . .  G1160 G1165
     1187   UST-WRITE-GF-8-3 . . . . . . .  G1177 G1182
     1204   UST-WRITE-GF-8-4 . . . . . . .  G1194 G1199
     1221   UST-WRITE-GF-8-5 . . . . . . .  G1211 G1216
     1261   UST-WRITE-GF-9-1 . . . . . . .  G1251 G1256
     1278   UST-WRITE-GF-9-2 . . . . . . .  G1268 G1273
     1294   UST-WRITE-GF-9-3 . . . . . . .  G1284 G1289
     1311   UST-WRITE-GF-9-4 . . . . . . .  G1301 G1306
     1328   UST-WRITE-GF-9-5 . . . . . . .  G1318 G1323
      300   WRITE-LINE . . . . . . . . . .  P250 P251 P259 P260 P261 P262 P264 P265 P266 P268 P270 P279 P287 P293 P298 P299
                                            P322 P326 P328 P337
      312   WRT-LN . . . . . . . . . . . .  P306 P307 P308 P311 P316
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    74
0 Defined   Cross-reference of programs     References

        3   NC218A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC218A    Date 06/04/2022  Time 12:00:54   Page    75
0LineID  Message code  Message text

     35  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   1481  IGYPG3230-W   An overflow condition will never occur in the "UNSTRING" statement.

                       Same message on line:   2347   2507   2548   2768   2988

   1525  IGYPG3229-W   An overflow condition will always occur in the "UNSTRING" statement.

   2751  IGYPS2015-I   The paragraph or section prior to paragraph or section "UST-INIT-GF-28" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       9           2              7
-* Statistics for COBOL program NC218A:
 *    Source records = 3073
 *    Data Division statements = 109
 *    Procedure Division statements = 1909
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1925
0End of compilation 1,  program NC218A,  highest severity 4.
0Return code 4
