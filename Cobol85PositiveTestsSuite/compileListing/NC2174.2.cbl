1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:51   Page     1
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314                 Date 06/04/2022  Time 12:00:51   Page     2
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
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page     3
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000001         000100 IDENTIFICATION DIVISION.                                         NC2174.2
   000002         000200 PROGRAM-ID.                                                      NC2174.2
   000003         000300     NC217A.                                                      NC2174.2
   000004         000500*                                                              *  NC2174.2
   000005         000600*    VALIDATION FOR:-                                          *  NC2174.2
   000006         000700*                                                              *  NC2174.2
   000007         000800*    "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2174.2
   000008         000900*                                                              *  NC2174.2
   000009         001000*    "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2174.2
   000010         001100*                                                              *  NC2174.2
   000011         001300*                                                              *  NC2174.2
   000012         001400*      X-CARDS USED BY THIS PROGRAM ARE :-                     *  NC2174.2
   000013         001500*                                                              *  NC2174.2
   000014         001600*        X-55  - SYSTEM PRINTER NAME.                          *  NC2174.2
   000015         001700*        X-82  - SOURCE COMPUTER NAME.                         *  NC2174.2
   000016         001800*        X-83  - OBJECT COMPUTER NAME.                         *  NC2174.2
   000017         001900*                                                              *  NC2174.2
   000018         002100*                                                              *  NC2174.2
   000019         002200*    PROGRAM NC217A TESTS THE USE OF THE "STRING" STATEMENT,   *  NC2174.2
   000020         002300*    INCLUDING THE OPTIONAL PHRASES "POINTER", "OVERFLOW",     *  NC2174.2
   000021         002400*    "NOT OVERFLOW" AND "END-STRING".                          *  NC2174.2
   000022         002500*                                                              *  NC2174.2
   000023         002600*                                                              *  NC2174.2
   000024         002800 ENVIRONMENT DIVISION.                                            NC2174.2
   000025         002900 CONFIGURATION SECTION.                                           NC2174.2
   000026         003000 SOURCE-COMPUTER.                                                 NC2174.2
   000027         003100     XXXXX082.                                                    NC2174.2
   000028         003200 OBJECT-COMPUTER.                                                 NC2174.2
   000029         003300     XXXXX083.                                                    NC2174.2
   000030         003400 INPUT-OUTPUT SECTION.                                            NC2174.2
   000031         003500 FILE-CONTROL.                                                    NC2174.2
   000032         003600     SELECT PRINT-FILE ASSIGN TO                                  NC2174.2 36
   000033         003700     XXXXX055.                                                    NC2174.2
   000034         003800 DATA DIVISION.                                                   NC2174.2
   000035         003900 FILE SECTION.                                                    NC2174.2
   000036         004000 FD  PRINT-FILE.                                                  NC2174.2

 ==000036==> IGYGR1216-I A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

   000037         004100 01  PRINT-REC PICTURE X(120).                                    NC2174.2
   000038         004200 01  DUMMY-RECORD PICTURE X(120).                                 NC2174.2
   000039         004300 WORKING-STORAGE SECTION.                                         NC2174.2
   000040         004400 01  WRK-XN-00001-1     PIC X.                                    NC2174.2
   000041         004500 01  WRK-XN-00001-2     PIC X.                                    NC2174.2
   000042         004600 01  WRK-XN-00001-3     PIC X.                                    NC2174.2
   000043         004700 01  ID8-DU-2V0 PIC 99.                                           NC2174.2
   000044         004800 01  ISUB-DU-2V0 PIC 99.                                          NC2174.2
   000045         004900 01  MY-BOSS-DU-2V0 PIC 99 VALUE ZERO.                            NC2174.2 IMP
   000046         005000 01  ID1-DS-LS-4 PIC S9(4) VALUE +1001 SIGN IS LEADING SEPARATE.  NC2174.2
   000047         005100 01  ID1-DS-TS-4 PIC S9(4) VALUE +1001 SIGN IS TRAILING SEPARATE. NC2174.2
   000048         005200 01  ID1-XN-25 PIC X(25) VALUE                                    NC2174.2
   000049         005300     "A2345B2345C2345D2345E2345".                                 NC2174.2
   000050         005400 01  ID1-XN-X-25 REDEFINES ID1-XN-25.                             NC2174.2 48
   000051         005500     10 ID1-1 PIC X OCCURS 5 TIMES.                               NC2174.2
   000052         005600     10 ID1-2 PIC X OCCURS 5 TIMES.                               NC2174.2
   000053         005700     10 ID1-3 PIC X OCCURS 5 TIMES.                               NC2174.2
   000054         005800     10 ID1-4 PIC X OCCURS 5 TIMES.                               NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page     4
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000055         005900     10 ID1-5 PIC X OCCURS 5 TIMES.                               NC2174.2
   000056         006000 01  ZEROX-XN-1 PIC X VALUE ZERO.                                 NC2174.2 IMP
   000057         006100 01  A-XN-1 PIC X VALUE "A".                                      NC2174.2
   000058         006200 01  B-XN-1 PIC X VALUE "B".                                      NC2174.2
   000059         006300 01  AB-XN-2 PIC XX VALUE "AB".                                   NC2174.2
   000060         006400 01  ID7-XN-5 PIC X(5).                                           NC2174.2
   000061         006500 01  ASTER-XN-5 PIC X(5) VALUE "*****".                           NC2174.2
   000062         006600 01  ANS-XN-5-1.                                                  NC2174.2
   000063         006700     10 FILLER PIC X VALUE LOW-VALUE.                             NC2174.2 IMP
   000064         006800     10 FILLER PIC X(4) VALUE "ABCD".                             NC2174.2
   000065         006900 01  ANS-XN-5-2.                                                  NC2174.2
   000066         007000     10 FILLER PIC X VALUE HIGH-VALUE.                            NC2174.2 IMP
   000067         007100     10 FILLER PIC X(4) VALUE "****".                             NC2174.2
   000068         007200 01  DELIM-TABLE-XN-5 PIC X(5) VALUE "CDEFF".                     NC2174.2
   000069         007300 01  DELIM-XN-X-1 REDEFINES DELIM-TABLE-XN-5.                     NC2174.2 68
   000070         007400     10 ID3-XN-1 PIC X OCCURS 5 TIMES.                            NC2174.2
   000071         007500 01  ABCDEFG-XN-7 PIC X(7) VALUE "ABCDEFG".                       NC2174.2
   000072         007600 01  ID7-XN-15  PIC X(15) VALUE SPACES.                           NC2174.2 IMP
   000073         007700 01  WISH-LIST-XN-37 PIC X(37) VALUE SPACES.                      NC2174.2 IMP
   000074         007800 01  ANS-XN-37 PIC X(37) VALUE                                    NC2174.2
   000075         007900     "GEE I WISH I WAS A FORTRAN PROGRAMMER".                     NC2174.2
   000076         008000 01  TEST-21-GROUP.                                               NC2174.2
   000077         008100   03  TEST-21-A                 PIC XX.                          NC2174.2
   000078         008200   03  TEST-21-B                 PIC XX.                          NC2174.2
   000079         008300   03  TEST-21-C                 PIC X.                           NC2174.2
   000080         008400                                                                  NC2174.2
   000081         008500 01  TEST-RESULTS.                                                NC2174.2
   000082         008600     02 FILLER                   PIC X      VALUE SPACE.          NC2174.2 IMP
   000083         008700     02 FEATURE                  PIC X(20)  VALUE SPACE.          NC2174.2 IMP
   000084         008800     02 FILLER                   PIC X      VALUE SPACE.          NC2174.2 IMP
   000085         008900     02 P-OR-F                   PIC X(5)   VALUE SPACE.          NC2174.2 IMP
   000086         009000     02 FILLER                   PIC X      VALUE SPACE.          NC2174.2 IMP
   000087         009100     02  PAR-NAME.                                                NC2174.2
   000088         009200       03 FILLER                 PIC X(19)  VALUE SPACE.          NC2174.2 IMP
   000089         009300       03  PARDOT-X              PIC X      VALUE SPACE.          NC2174.2 IMP
   000090         009400       03 DOTVALUE               PIC 99     VALUE ZERO.           NC2174.2 IMP
   000091         009500     02 FILLER                   PIC X(8)   VALUE SPACE.          NC2174.2 IMP
   000092         009600     02 RE-MARK                  PIC X(61).                       NC2174.2
   000093         009700 01  TEST-COMPUTED.                                               NC2174.2
   000094         009800     02 FILLER                   PIC X(30)  VALUE SPACE.          NC2174.2 IMP
   000095         009900     02 FILLER                   PIC X(17)  VALUE                 NC2174.2
   000096         010000            "       COMPUTED=".                                   NC2174.2
   000097         010100     02 COMPUTED-X.                                               NC2174.2
   000098         010200     03 COMPUTED-A               PIC X(20)  VALUE SPACE.          NC2174.2 IMP
   000099         010300     03 COMPUTED-N               REDEFINES COMPUTED-A             NC2174.2 98
   000100         010400                                 PIC -9(9).9(9).                  NC2174.2
   000101         010500     03 COMPUTED-0V18 REDEFINES COMPUTED-A   PIC -.9(18).         NC2174.2 98
   000102         010600     03 COMPUTED-4V14 REDEFINES COMPUTED-A   PIC -9(4).9(14).     NC2174.2 98
   000103         010700     03 COMPUTED-14V4 REDEFINES COMPUTED-A   PIC -9(14).9(4).     NC2174.2 98
   000104         010800     03       CM-18V0 REDEFINES COMPUTED-A.                       NC2174.2 98
   000105         010900         04 COMPUTED-18V0                    PIC -9(18).          NC2174.2
   000106         011000         04 FILLER                           PIC X.               NC2174.2
   000107         011100     03 FILLER PIC X(50) VALUE SPACE.                             NC2174.2 IMP
   000108         011200 01  TEST-CORRECT.                                                NC2174.2
   000109         011300     02 FILLER PIC X(30) VALUE SPACE.                             NC2174.2 IMP
   000110         011400     02 FILLER PIC X(17) VALUE "       CORRECT =".                NC2174.2
   000111         011500     02 CORRECT-X.                                                NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page     5
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000112         011600     03 CORRECT-A                  PIC X(20) VALUE SPACE.         NC2174.2 IMP
   000113         011700     03 CORRECT-N    REDEFINES CORRECT-A     PIC -9(9).9(9).      NC2174.2 112
   000114         011800     03 CORRECT-0V18 REDEFINES CORRECT-A     PIC -.9(18).         NC2174.2 112
   000115         011900     03 CORRECT-4V14 REDEFINES CORRECT-A     PIC -9(4).9(14).     NC2174.2 112
   000116         012000     03 CORRECT-14V4 REDEFINES CORRECT-A     PIC -9(14).9(4).     NC2174.2 112
   000117         012100     03      CR-18V0 REDEFINES CORRECT-A.                         NC2174.2 112
   000118         012200         04 CORRECT-18V0                     PIC -9(18).          NC2174.2
   000119         012300         04 FILLER                           PIC X.               NC2174.2
   000120         012400     03 FILLER PIC X(2) VALUE SPACE.                              NC2174.2 IMP
   000121         012500     03 COR-ANSI-REFERENCE             PIC X(48) VALUE SPACE.     NC2174.2 IMP
   000122         012600 01  CCVS-C-1.                                                    NC2174.2
   000123         012700     02 FILLER  PIC IS X(99)    VALUE IS " FEATURE              PANC2174.2
   000124         012800-    "SS  PARAGRAPH-NAME                                          NC2174.2
   000125         012900-    "       REMARKS".                                            NC2174.2
   000126         013000     02 FILLER                     PIC X(20)    VALUE SPACE.      NC2174.2 IMP
   000127         013100 01  CCVS-C-2.                                                    NC2174.2
   000128         013200     02 FILLER                     PIC X        VALUE SPACE.      NC2174.2 IMP
   000129         013300     02 FILLER                     PIC X(6)     VALUE "TESTED".   NC2174.2
   000130         013400     02 FILLER                     PIC X(15)    VALUE SPACE.      NC2174.2 IMP
   000131         013500     02 FILLER                     PIC X(4)     VALUE "FAIL".     NC2174.2
   000132         013600     02 FILLER                     PIC X(94)    VALUE SPACE.      NC2174.2 IMP
   000133         013700 01  REC-SKL-SUB                   PIC 9(2)     VALUE ZERO.       NC2174.2 IMP
   000134         013800 01  REC-CT                        PIC 99       VALUE ZERO.       NC2174.2 IMP
   000135         013900 01  DELETE-COUNTER                PIC 999      VALUE ZERO.       NC2174.2 IMP
   000136         014000 01  ERROR-COUNTER                 PIC 999      VALUE ZERO.       NC2174.2 IMP
   000137         014100 01  INSPECT-COUNTER               PIC 999      VALUE ZERO.       NC2174.2 IMP
   000138         014200 01  PASS-COUNTER                  PIC 999      VALUE ZERO.       NC2174.2 IMP
   000139         014300 01  TOTAL-ERROR                   PIC 999      VALUE ZERO.       NC2174.2 IMP
   000140         014400 01  ERROR-HOLD                    PIC 999      VALUE ZERO.       NC2174.2 IMP
   000141         014500 01  DUMMY-HOLD                    PIC X(120)   VALUE SPACE.      NC2174.2 IMP
   000142         014600 01  RECORD-COUNT                  PIC 9(5)     VALUE ZERO.       NC2174.2 IMP
   000143         014700 01  ANSI-REFERENCE                PIC X(48)    VALUE SPACES.     NC2174.2 IMP
   000144         014800 01  CCVS-H-1.                                                    NC2174.2
   000145         014900     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2174.2 IMP
   000146         015000     02  FILLER                    PIC X(42)    VALUE             NC2174.2
   000147         015100     "OFFICIAL COBOL COMPILER VALIDATION SYSTEM".                 NC2174.2
   000148         015200     02  FILLER                    PIC X(39)    VALUE SPACES.     NC2174.2 IMP
   000149         015300 01  CCVS-H-2A.                                                   NC2174.2
   000150         015400   02  FILLER                        PIC X(40)  VALUE SPACE.      NC2174.2 IMP
   000151         015500   02  FILLER                        PIC X(7)   VALUE "CCVS85 ".  NC2174.2
   000152         015600   02  FILLER                        PIC XXXX   VALUE             NC2174.2
   000153         015700     "4.2 ".                                                      NC2174.2
   000154         015800   02  FILLER                        PIC X(28)  VALUE             NC2174.2
   000155         015900            " COPY - NOT FOR DISTRIBUTION".                       NC2174.2
   000156         016000   02  FILLER                        PIC X(41)  VALUE SPACE.      NC2174.2 IMP
   000157         016100                                                                  NC2174.2
   000158         016200 01  CCVS-H-2B.                                                   NC2174.2
   000159         016300   02  FILLER                        PIC X(15)  VALUE             NC2174.2
   000160         016400            "TEST RESULT OF ".                                    NC2174.2
   000161         016500   02  TEST-ID                       PIC X(9).                    NC2174.2
   000162         016600   02  FILLER                        PIC X(4)   VALUE             NC2174.2
   000163         016700            " IN ".                                               NC2174.2
   000164         016800   02  FILLER                        PIC X(12)  VALUE             NC2174.2
   000165         016900     " HIGH       ".                                              NC2174.2
   000166         017000   02  FILLER                        PIC X(22)  VALUE             NC2174.2
   000167         017100            " LEVEL VALIDATION FOR ".                             NC2174.2
   000168         017200   02  FILLER                        PIC X(58)  VALUE             NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page     6
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000169         017300     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2174.2
   000170         017400 01  CCVS-H-3.                                                    NC2174.2
   000171         017500     02  FILLER                      PIC X(34)  VALUE             NC2174.2
   000172         017600            " FOR OFFICIAL USE ONLY    ".                         NC2174.2
   000173         017700     02  FILLER                      PIC X(58)  VALUE             NC2174.2
   000174         017800     "COBOL 85 VERSION 4.2, Apr  1993 SSVG                      ".NC2174.2
   000175         017900     02  FILLER                      PIC X(28)  VALUE             NC2174.2
   000176         018000            "  COPYRIGHT   1985 ".                                NC2174.2
   000177         018100 01  CCVS-E-1.                                                    NC2174.2
   000178         018200     02 FILLER                       PIC X(52)  VALUE SPACE.      NC2174.2 IMP
   000179         018300     02 FILLER  PIC X(14) VALUE IS "END OF TEST-  ".              NC2174.2
   000180         018400     02 ID-AGAIN                     PIC X(9).                    NC2174.2
   000181         018500     02 FILLER                       PIC X(45)  VALUE SPACES.     NC2174.2 IMP
   000182         018600 01  CCVS-E-2.                                                    NC2174.2
   000183         018700     02  FILLER                      PIC X(31)  VALUE SPACE.      NC2174.2 IMP
   000184         018800     02  FILLER                      PIC X(21)  VALUE SPACE.      NC2174.2 IMP
   000185         018900     02 CCVS-E-2-2.                                               NC2174.2
   000186         019000         03 ERROR-TOTAL              PIC XXX    VALUE SPACE.      NC2174.2 IMP
   000187         019100         03 FILLER                   PIC X      VALUE SPACE.      NC2174.2 IMP
   000188         019200         03 ENDER-DESC               PIC X(44)  VALUE             NC2174.2
   000189         019300            "ERRORS ENCOUNTERED".                                 NC2174.2
   000190         019400 01  CCVS-E-3.                                                    NC2174.2
   000191         019500     02  FILLER                      PIC X(22)  VALUE             NC2174.2
   000192         019600            " FOR OFFICIAL USE ONLY".                             NC2174.2
   000193         019700     02  FILLER                      PIC X(12)  VALUE SPACE.      NC2174.2 IMP
   000194         019800     02  FILLER                      PIC X(58)  VALUE             NC2174.2
   000195         019900     "ON-SITE VALIDATION, NATIONAL INSTITUTE OF STD & TECH.     ".NC2174.2
   000196         020000     02  FILLER                      PIC X(13)  VALUE SPACE.      NC2174.2 IMP
   000197         020100     02 FILLER                       PIC X(15)  VALUE             NC2174.2
   000198         020200             " COPYRIGHT 1985".                                   NC2174.2
   000199         020300 01  CCVS-E-4.                                                    NC2174.2
   000200         020400     02 CCVS-E-4-1                   PIC XXX    VALUE SPACE.      NC2174.2 IMP
   000201         020500     02 FILLER                       PIC X(4)   VALUE " OF ".     NC2174.2
   000202         020600     02 CCVS-E-4-2                   PIC XXX    VALUE SPACE.      NC2174.2 IMP
   000203         020700     02 FILLER                       PIC X(40)  VALUE             NC2174.2
   000204         020800      "  TESTS WERE EXECUTED SUCCESSFULLY".                       NC2174.2
   000205         020900 01  XXINFO.                                                      NC2174.2
   000206         021000     02 FILLER                       PIC X(19)  VALUE             NC2174.2
   000207         021100            "*** INFORMATION ***".                                NC2174.2
   000208         021200     02 INFO-TEXT.                                                NC2174.2
   000209         021300       04 FILLER                     PIC X(8)   VALUE SPACE.      NC2174.2 IMP
   000210         021400       04 XXCOMPUTED                 PIC X(20).                   NC2174.2
   000211         021500       04 FILLER                     PIC X(5)   VALUE SPACE.      NC2174.2 IMP
   000212         021600       04 XXCORRECT                  PIC X(20).                   NC2174.2
   000213         021700     02 INF-ANSI-REFERENCE           PIC X(48).                   NC2174.2
   000214         021800 01  HYPHEN-LINE.                                                 NC2174.2
   000215         021900     02 FILLER  PIC IS X VALUE IS SPACE.                          NC2174.2 IMP
   000216         022000     02 FILLER  PIC IS X(65)    VALUE IS "************************NC2174.2
   000217         022100-    "*****************************************".                 NC2174.2
   000218         022200     02 FILLER  PIC IS X(54)    VALUE IS "************************NC2174.2
   000219         022300-    "******************************".                            NC2174.2
   000220         022400 01  CCVS-PGM-ID                     PIC X(9)   VALUE             NC2174.2
   000221         022500     "NC217A".                                                    NC2174.2
   000222         022600 PROCEDURE DIVISION.                                              NC2174.2
   000223         022700 CCVS1 SECTION.                                                   NC2174.2
   000224         022800 OPEN-FILES.                                                      NC2174.2
   000225         022900     OPEN     OUTPUT PRINT-FILE.                                  NC2174.2 36
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page     7
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000226         023000     MOVE CCVS-PGM-ID TO TEST-ID. MOVE CCVS-PGM-ID TO ID-AGAIN.   NC2174.2 220 161 220 180
   000227         023100     MOVE    SPACE TO TEST-RESULTS.                               NC2174.2 IMP 81
   000228         023200     PERFORM  HEAD-ROUTINE THRU COLUMN-NAMES-ROUTINE.             NC2174.2 253 258
   000229         023300     GO TO CCVS1-EXIT.                                            NC2174.2 335
   000230         023400 CLOSE-FILES.                                                     NC2174.2
   000231         023500     PERFORM END-ROUTINE THRU END-ROUTINE-13. CLOSE PRINT-FILE.   NC2174.2 262 283 36
   000232         023600 TERMINATE-CCVS.                                                  NC2174.2
   000233         023700     EXIT PROGRAM.                                                NC2174.2
   000234         023800 TERMINATE-CALL.                                                  NC2174.2
   000235         023900     STOP     RUN.                                                NC2174.2
   000236         024000 INSPT. MOVE "INSPT" TO P-OR-F. ADD 1 TO INSPECT-COUNTER.         NC2174.2 85 137
   000237         024100 PASS.  MOVE "PASS " TO P-OR-F.  ADD 1 TO PASS-COUNTER.           NC2174.2 85 138
   000238         024200 FAIL.  MOVE "FAIL*" TO P-OR-F.  ADD 1 TO ERROR-COUNTER.          NC2174.2 85 136
   000239         024300 DE-LETE.  MOVE "*****" TO P-OR-F.  ADD 1 TO DELETE-COUNTER.      NC2174.2 85 135
   000240         024400     MOVE "****TEST DELETED****" TO RE-MARK.                      NC2174.2 92
   000241         024500 PRINT-DETAIL.                                                    NC2174.2
   000242         024600     IF REC-CT NOT EQUAL TO ZERO                                  NC2174.2 134 IMP
   000243      1  024700             MOVE "." TO PARDOT-X                                 NC2174.2 89
   000244      1  024800             MOVE REC-CT TO DOTVALUE.                             NC2174.2 134 90
   000245         024900     MOVE     TEST-RESULTS TO PRINT-REC. PERFORM WRITE-LINE.      NC2174.2 81 37 295
   000246         025000     IF P-OR-F EQUAL TO "FAIL*"  PERFORM WRITE-LINE               NC2174.2 85 295
   000247      1  025100        PERFORM FAIL-ROUTINE THRU FAIL-ROUTINE-EX                 NC2174.2 312 325
   000248      1  025200          ELSE PERFORM BAIL-OUT THRU BAIL-OUT-EX.                 NC2174.2 326 334
   000249         025300     MOVE SPACE TO P-OR-F. MOVE SPACE TO COMPUTED-X.              NC2174.2 IMP 85 IMP 97
   000250         025400     MOVE SPACE TO CORRECT-X.                                     NC2174.2 IMP 111
   000251         025500     IF     REC-CT EQUAL TO ZERO  MOVE SPACE TO PAR-NAME.         NC2174.2 134 IMP IMP 87
   000252         025600     MOVE     SPACE TO RE-MARK.                                   NC2174.2 IMP 92
   000253         025700 HEAD-ROUTINE.                                                    NC2174.2
   000254         025800     MOVE CCVS-H-1  TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2174.2 144 38 295
   000255         025900     MOVE CCVS-H-2A TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.  NC2174.2 149 38 295
   000256         026000     MOVE CCVS-H-2B TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2174.2 158 38 295
   000257         026100     MOVE CCVS-H-3  TO DUMMY-RECORD. PERFORM WRITE-LINE 3 TIMES.  NC2174.2 170 38 295
   000258         026200 COLUMN-NAMES-ROUTINE.                                            NC2174.2
   000259         026300     MOVE CCVS-C-1 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2174.2 122 38 295
   000260         026400     MOVE CCVS-C-2 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2174.2 127 38 295
   000261         026500     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE.        NC2174.2 214 38 295
   000262         026600 END-ROUTINE.                                                     NC2174.2
   000263         026700     MOVE HYPHEN-LINE TO DUMMY-RECORD. PERFORM WRITE-LINE 5 TIMES.NC2174.2 214 38 295
   000264         026800 END-RTN-EXIT.                                                    NC2174.2
   000265         026900     MOVE CCVS-E-1 TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2174.2 177 38 295
   000266         027000 END-ROUTINE-1.                                                   NC2174.2
   000267         027100      ADD ERROR-COUNTER TO ERROR-HOLD ADD INSPECT-COUNTER TO      NC2174.2 136 140 137
   000268         027200      ERROR-HOLD. ADD DELETE-COUNTER TO ERROR-HOLD.               NC2174.2 140 135 140
   000269         027300      ADD PASS-COUNTER TO ERROR-HOLD.                             NC2174.2 138 140
   000270         027400*     IF PASS-COUNTER EQUAL TO ERROR-HOLD GO TO END-ROUTINE-12.   NC2174.2
   000271         027500      MOVE PASS-COUNTER TO CCVS-E-4-1.                            NC2174.2 138 200
   000272         027600      MOVE ERROR-HOLD TO CCVS-E-4-2.                              NC2174.2 140 202
   000273         027700      MOVE CCVS-E-4 TO CCVS-E-2-2.                                NC2174.2 199 185
   000274         027800      MOVE CCVS-E-2 TO DUMMY-RECORD PERFORM WRITE-LINE.           NC2174.2 182 38 295
   000275         027900  END-ROUTINE-12.                                                 NC2174.2
   000276         028000      MOVE "TEST(S) FAILED" TO ENDER-DESC.                        NC2174.2 188
   000277         028100     IF       ERROR-COUNTER IS EQUAL TO ZERO                      NC2174.2 136 IMP
   000278      1  028200         MOVE "NO " TO ERROR-TOTAL                                NC2174.2 186
   000279         028300         ELSE                                                     NC2174.2
   000280      1  028400         MOVE ERROR-COUNTER TO ERROR-TOTAL.                       NC2174.2 136 186
   000281         028500     MOVE     CCVS-E-2 TO DUMMY-RECORD.                           NC2174.2 182 38
   000282         028600     PERFORM WRITE-LINE.                                          NC2174.2 295
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page     8
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000283         028700 END-ROUTINE-13.                                                  NC2174.2
   000284         028800     IF DELETE-COUNTER IS EQUAL TO ZERO                           NC2174.2 135 IMP
   000285      1  028900         MOVE "NO " TO ERROR-TOTAL  ELSE                          NC2174.2 186
   000286      1  029000         MOVE DELETE-COUNTER TO ERROR-TOTAL.                      NC2174.2 135 186
   000287         029100     MOVE "TEST(S) DELETED     " TO ENDER-DESC.                   NC2174.2 188
   000288         029200     MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2174.2 182 38 295
   000289         029300      IF   INSPECT-COUNTER EQUAL TO ZERO                          NC2174.2 137 IMP
   000290      1  029400          MOVE "NO " TO ERROR-TOTAL                               NC2174.2 186
   000291      1  029500      ELSE MOVE INSPECT-COUNTER TO ERROR-TOTAL.                   NC2174.2 137 186
   000292         029600      MOVE "TEST(S) REQUIRE INSPECTION" TO ENDER-DESC.            NC2174.2 188
   000293         029700      MOVE CCVS-E-2 TO DUMMY-RECORD. PERFORM WRITE-LINE.          NC2174.2 182 38 295
   000294         029800     MOVE CCVS-E-3 TO DUMMY-RECORD. PERFORM WRITE-LINE.           NC2174.2 190 38 295
   000295         029900 WRITE-LINE.                                                      NC2174.2
   000296         030000     ADD 1 TO RECORD-COUNT.                                       NC2174.2 142
   000297         030100     IF RECORD-COUNT GREATER 50                                   NC2174.2 142
   000298      1  030200         MOVE DUMMY-RECORD TO DUMMY-HOLD                          NC2174.2 38 141
   000299      1  030300         MOVE SPACE TO DUMMY-RECORD                               NC2174.2 IMP 38
   000300      1  030400         WRITE DUMMY-RECORD AFTER ADVANCING PAGE                  NC2174.2 38
   000301      1  030500         MOVE CCVS-C-1 TO DUMMY-RECORD PERFORM WRT-LN             NC2174.2 122 38 307
   000302      1  030600         MOVE CCVS-C-2 TO DUMMY-RECORD PERFORM WRT-LN 2 TIMES     NC2174.2 127 38 307
   000303      1  030700         MOVE HYPHEN-LINE TO DUMMY-RECORD PERFORM WRT-LN          NC2174.2 214 38 307
   000304      1  030800         MOVE DUMMY-HOLD TO DUMMY-RECORD                          NC2174.2 141 38
   000305      1  030900         MOVE ZERO TO RECORD-COUNT.                               NC2174.2 IMP 142
   000306         031000     PERFORM WRT-LN.                                              NC2174.2 307
   000307         031100 WRT-LN.                                                          NC2174.2
   000308         031200     WRITE    DUMMY-RECORD AFTER ADVANCING 1 LINES.               NC2174.2 38
   000309         031300     MOVE SPACE TO DUMMY-RECORD.                                  NC2174.2 IMP 38
   000310         031400 BLANK-LINE-PRINT.                                                NC2174.2
   000311         031500     PERFORM WRT-LN.                                              NC2174.2 307
   000312         031600 FAIL-ROUTINE.                                                    NC2174.2
   000313         031700     IF   COMPUTED-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE. NC2174.2 97 IMP 320
   000314         031800     IF     CORRECT-X NOT EQUAL TO SPACE GO TO FAIL-ROUTINE-WRITE.NC2174.2 111 IMP 320
   000315         031900     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2174.2 143 213
   000316         032000     MOVE  "NO FURTHER INFORMATION, SEE PROGRAM." TO INFO-TEXT.   NC2174.2 208
   000317         032100     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2174.2 205 38 295
   000318         032200     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2174.2 IMP 213
   000319         032300     GO TO  FAIL-ROUTINE-EX.                                      NC2174.2 325
   000320         032400 FAIL-ROUTINE-WRITE.                                              NC2174.2
   000321         032500     MOVE   TEST-COMPUTED TO PRINT-REC PERFORM WRITE-LINE         NC2174.2 93 37 295
   000322         032600     MOVE   ANSI-REFERENCE TO COR-ANSI-REFERENCE.                 NC2174.2 143 121
   000323         032700     MOVE   TEST-CORRECT TO PRINT-REC PERFORM WRITE-LINE 2 TIMES. NC2174.2 108 37 295
   000324         032800     MOVE   SPACES TO COR-ANSI-REFERENCE.                         NC2174.2 IMP 121
   000325         032900 FAIL-ROUTINE-EX. EXIT.                                           NC2174.2
   000326         033000 BAIL-OUT.                                                        NC2174.2
   000327         033100     IF     COMPUTED-A NOT EQUAL TO SPACE GO TO BAIL-OUT-WRITE.   NC2174.2 98 IMP 329
   000328         033200     IF     CORRECT-A EQUAL TO SPACE GO TO BAIL-OUT-EX.           NC2174.2 112 IMP 334
   000329         033300 BAIL-OUT-WRITE.                                                  NC2174.2
   000330         033400     MOVE CORRECT-A TO XXCORRECT. MOVE COMPUTED-A TO XXCOMPUTED.  NC2174.2 112 212 98 210
   000331         033500     MOVE   ANSI-REFERENCE TO INF-ANSI-REFERENCE.                 NC2174.2 143 213
   000332         033600     MOVE   XXINFO TO DUMMY-RECORD. PERFORM WRITE-LINE 2 TIMES.   NC2174.2 205 38 295
   000333         033700     MOVE   SPACES TO INF-ANSI-REFERENCE.                         NC2174.2 IMP 213
   000334         033800 BAIL-OUT-EX. EXIT.                                               NC2174.2
   000335         033900 CCVS1-EXIT.                                                      NC2174.2
   000336         034000     EXIT.                                                        NC2174.2
   000337         034100 SECT-NC217A-001 SECTION.                                         NC2174.2
   000338         034200 STR-INIT-GF-1.                                                   NC2174.2
   000339         034300     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page     9
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000340         034400     MOVE   "STR-TEST-GF-1" TO PAR-NAME.                          NC2174.2 87
   000341         034500     MOVE   "LIT DEL BY SIZE" TO FEATURE.                         NC2174.2 83
   000342         034600     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000343         034700     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000344         034800     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000345         034900 STR-TEST-GF-1.                                                   NC2174.2
   000346         035000     STRING "ABCDEF" DELIMITED BY SIZE INTO ID7-XN-5              NC2174.2 60
   000347         035100         WITH POINTER ID8-DU-2V0.                                 NC2174.2 43
   000348         035200     GO TO STR-TEST-GF-1-1.                                       NC2174.2 353
   000349         035300 STR-DELETE-GF-1.                                                 NC2174.2
   000350         035400     PERFORM DE-LETE.                                             NC2174.2 239
   000351         035500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000352         035600     GO      TO STR-INIT-GF-2.                                    NC2174.2 386
   000353         035700 STR-TEST-GF-1-1.                                                 NC2174.2
   000354         035800     IF ID7-XN-5 = "ABCDE"                                        NC2174.2 60
   000355      1  035900         PERFORM PASS                                             NC2174.2 237
   000356      1  036000         GO TO STR-WRITE-GF-1-1                                   NC2174.2 366
   000357         036100     ELSE                                                         NC2174.2
   000358      1  036200         GO TO STR-FAIL-GF-1-1.                                   NC2174.2 362
   000359         036300 STR-DELETE-GF-1-1.                                               NC2174.2
   000360         036400     PERFORM DE-LETE.                                             NC2174.2 239
   000361         036500     GO TO STR-WRITE-GF-1-1.                                      NC2174.2 366
   000362         036600 STR-FAIL-GF-1-1.                                                 NC2174.2
   000363         036700     PERFORM FAIL                                                 NC2174.2 238
   000364         036800     MOVE ID7-XN-5 TO COMPUTED-A                                  NC2174.2 60 98
   000365         036900     MOVE "ABCDE" TO CORRECT-A.                                   NC2174.2 112
   000366         037000 STR-WRITE-GF-1-1.                                                NC2174.2
   000367         037100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000368         037200*                                                                 NC2174.2
   000369         037300 STR-TEST-GF-1-2.                                                 NC2174.2
   000370         037400     ADD 1 TO REC-CT.                                             NC2174.2 134
   000371         037500     IF ID8-DU-2V0 = 6                                            NC2174.2 43
   000372      1  037600         PERFORM PASS                                             NC2174.2 237
   000373      1  037700         GO TO STR-WRITE-GF-1-2                                   NC2174.2 383
   000374         037800     ELSE                                                         NC2174.2
   000375      1  037900         GO TO STR-FAIL-GF-1-2.                                   NC2174.2 379
   000376         038000 STR-DELETE-GF-1-2.                                               NC2174.2
   000377         038100     PERFORM DE-LETE.                                             NC2174.2 239
   000378         038200     GO TO STR-WRITE-GF-1-2.                                      NC2174.2 383
   000379         038300 STR-FAIL-GF-1-2.                                                 NC2174.2
   000380         038400     PERFORM FAIL                                                 NC2174.2 238
   000381         038500     MOVE ID8-DU-2V0 TO COMPUTED-N                                NC2174.2 43 99
   000382         038600     MOVE 6 TO CORRECT-N.                                         NC2174.2 113
   000383         038700 STR-WRITE-GF-1-2.                                                NC2174.2
   000384         038800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000385         038900*                                                                 NC2174.2
   000386         039000 STR-INIT-GF-2.                                                   NC2174.2
   000387         039100     MOVE   "STR-TEST-GF-2" TO PAR-NAME.                          NC2174.2 87
   000388         039200     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000389         039300     MOVE   "LIT DEL BY LIT" TO FEATURE.                          NC2174.2 83
   000390         039400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000391         039500     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000392         039600     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000393         039700 STR-TEST-GF-2-0.                                                 NC2174.2
   000394         039800     STRING "ABCDEF" DELIMITED BY "ABCDEFG"                       NC2174.2
   000395         039900             INTO ID7-XN-5 WITH POINTER ID8-DU-2V0                NC2174.2 60 43
   000396      1  040000             ON OVERFLOW PERFORM PASS                             NC2174.2 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    10
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000397      1  040100                         GO TO STR-WRITE-GF-2-1.                  NC2174.2 411
   000398         040200     GO      TO STR-FAIL-GF-2-1.                                  NC2174.2 408
   000399         040300 STR-DELETE-GF-2.                                                 NC2174.2
   000400         040400     PERFORM DE-LETE.                                             NC2174.2 239
   000401         040500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000402         040600     GO      TO STR-INIT-GF-3.                                    NC2174.2 448
   000403         040700 STR-TEST-GF-2-1.                                                 NC2174.2
   000404         040800*    THIS IS THE BLOCK TO WHICH CONTROL WILL BE SENT BY           NC2174.2
   000405         040900*    PARAGRAPH "STR-TEST-GF-2-0".                                 NC2174.2
   000406         041000 STR-DELETE-GF-2-1.                                               NC2174.2

 ==000406==> IGYPS2015-I The paragraph or section prior to paragraph or section
                         "STR-DELETE-GF-2-1" did not contain any statements.

   000407         041100*    GO TO STR-DELETE-GF-2.                                       NC2174.2
   000408         041200 STR-FAIL-GF-2-1.                                                 NC2174.2

 ==000408==> IGYPS2015-I The paragraph or section prior to paragraph or section "STR-FAIL-GF-2-1"
                         did not contain any statements.

   000409         041300     PERFORM FAIL.                                                NC2174.2 238
   000410         041400     MOVE    "OVERFLOW SHOULD OCCUR" TO RE-MARK.                  NC2174.2 92
   000411         041500 STR-WRITE-GF-2-1.                                                NC2174.2
   000412         041600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000413         041700*                                                                 NC2174.2
   000414         041800 STR-TEST-GF-2-2.                                                 NC2174.2
   000415         041900     ADD 1 TO REC-CT.                                             NC2174.2 134
   000416         042000     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   000417      1  042100          PERFORM PASS                                            NC2174.2 237
   000418      1  042200          GO TO STR-WRITE-GF-2-2                                  NC2174.2 428
   000419         042300     ELSE                                                         NC2174.2
   000420      1  042400          GO TO STR-FAIL-GF-2-2.                                  NC2174.2 424
   000421         042500 STR-DELETE-GF-2-2.                                               NC2174.2
   000422         042600     PERFORM DE-LETE.                                             NC2174.2 239
   000423         042700     GO TO STR-WRITE-GF-2-2.                                      NC2174.2 428
   000424         042800 STR-FAIL-GF-2-2.                                                 NC2174.2
   000425         042900     PERFORM FAIL                                                 NC2174.2 238
   000426         043000     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000427         043100     MOVE    "ABCDE" TO CORRECT-A.                                NC2174.2 112
   000428         043200 STR-WRITE-GF-2-2.                                                NC2174.2
   000429         043300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000430         043400*                                                                 NC2174.2
   000431         043500 STR-TEST-GF-2-3.                                                 NC2174.2
   000432         043600     ADD     1 TO REC-CT.                                         NC2174.2 134
   000433         043700     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   000434      1  043800          PERFORM PASS                                            NC2174.2 237
   000435      1  043900          GO TO STR-WRITE-GF-2-3                                  NC2174.2 445
   000436         044000     ELSE                                                         NC2174.2
   000437      1  044100          GO TO STR-FAIL-GF-2-3.                                  NC2174.2 441
   000438         044200 STR-DELETE-GF-2-3.                                               NC2174.2
   000439         044300     PERFORM DE-LETE.                                             NC2174.2 239
   000440         044400     GO TO STR-WRITE-GF-2-3.                                      NC2174.2 445
   000441         044500 STR-FAIL-GF-2-3.                                                 NC2174.2
   000442         044600     PERFORM FAIL                                                 NC2174.2 238
   000443         044700     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000444         044800     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   000445         044900 STR-WRITE-GF-2-3.                                                NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    11
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000446         045000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000447         045100*                                                                 NC2174.2
   000448         045200 STR-INIT-GF-3.                                                   NC2174.2
   000449         045300     MOVE   "STR-TEST-GF-3" TO PAR-NAME.                          NC2174.2 87
   000450         045400     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000451         045500     MOVE    "ID DEL BY QUAL ID" TO FEATURE.                      NC2174.2 83
   000452         045600     MOVE "*****" TO ID7-XN-5.                                    NC2174.2 60
   000453         045700     MOVE 1 TO ID8-DU-2V0.                                        NC2174.2 43
   000454         045800     MOVE    5 TO ISUB-DU-2V0.                                    NC2174.2 44
   000455         045900     MOVE 1 TO REC-CT.                                            NC2174.2 134
   000456         046000*                                                                 NC2174.2
   000457         046100 STR-TEST-GF-3.                                                   NC2174.2
   000458         046200     STRING  ABCDEFG-XN-7 DELIMITED BY ID3-XN-1 (ISUB-DU-2V0)     NC2174.2 71 70 44
   000459         046300             INTO ID7-XN-5 POINTER ID8-DU-2V0.                    NC2174.2 60 43
   000460         046400     GO      TO STR-TEST-GF-3-1.                                  NC2174.2 466
   000461         046500 STR-DELETE-GF-3.                                                 NC2174.2
   000462         046600     PERFORM DE-LETE.                                             NC2174.2 239
   000463         046700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000464         046800     GO      TO STRING-INIT-4.                                    NC2174.2 499
   000465         046900*                                                                 NC2174.2
   000466         047000 STR-TEST-GF-3-1.                                                 NC2174.2
   000467         047100     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   000468      1  047200          PERFORM PASS                                            NC2174.2 237
   000469      1  047300          GO TO STR-WRITE-GF-3-1                                  NC2174.2 479
   000470         047400     ELSE                                                         NC2174.2
   000471      1  047500          GO TO STR-FAIL-GF-3-1.                                  NC2174.2 475
   000472         047600 STR-DELETE-GF-3-1.                                               NC2174.2
   000473         047700     PERFORM DE-LETE.                                             NC2174.2 239
   000474         047800     GO TO STR-WRITE-GF-3-1.                                      NC2174.2 479
   000475         047900 STR-FAIL-GF-3-1.                                                 NC2174.2
   000476         048000     PERFORM FAIL                                                 NC2174.2 238
   000477         048100     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000478         048200     MOVE    "ABCDE" TO CORRECT-A.                                NC2174.2 112
   000479         048300 STR-WRITE-GF-3-1.                                                NC2174.2
   000480         048400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000481         048500*                                                                 NC2174.2
   000482         048600 STR-TEST-GF-3-2.                                                 NC2174.2
   000483         048700     ADD     1 TO REC-CT.                                         NC2174.2 134
   000484         048800     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   000485      1  048900          PERFORM PASS                                            NC2174.2 237
   000486      1  049000          GO TO STR-WRITE-GF-3-2                                  NC2174.2 496
   000487         049100     ELSE                                                         NC2174.2
   000488      1  049200          GO TO STR-FAIL-GF-3-2.                                  NC2174.2 492
   000489         049300 STR-DELETE-GF-3-2.                                               NC2174.2
   000490         049400     PERFORM DE-LETE.                                             NC2174.2 239
   000491         049500     GO TO STR-WRITE-GF-3-2.                                      NC2174.2 496
   000492         049600 STR-FAIL-GF-3-2.                                                 NC2174.2
   000493         049700     PERFORM FAIL                                                 NC2174.2 238
   000494         049800     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000495         049900     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   000496         050000 STR-WRITE-GF-3-2.                                                NC2174.2
   000497         050100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000498         050200*                                                                 NC2174.2
   000499         050300 STRING-INIT-4.                                                   NC2174.2
   000500         050400     MOVE    "STR-TEST-GF-4" TO PAR-NAME.                         NC2174.2 87
   000501         050500     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000502         050600     MOVE    "SUBSCRIPTED IDS" TO FEATURE.                        NC2174.2 83
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    12
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000503         050700     MOVE "*****" TO ID7-XN-5.                                    NC2174.2 60
   000504         050800     MOVE 1 TO ID8-DU-2V0.                                        NC2174.2 43
   000505         050900     MOVE    ZERO TO REC-CT.                                      NC2174.2 IMP 134
   000506         051000     MOVE    "**** " TO P-OR-F.                                   NC2174.2 85
   000507         051100*                                                                 NC2174.2
   000508         051200 STRING-TEST-4.                                                   NC2174.2
   000509         051300*    STRING  ID1-1 OF ID1-XN-X-25 (ID8-DU-2V0)                    NC2174.2
   000510         051400*            ID1-2 OF ID1-XN-X-25 (ID8-DU-2V0)                    NC2174.2
   000511         051500*            ID1-3 OF ID1-XN-X-25 (ID8-DU-2V0)                    NC2174.2
   000512         051600*            ID1-4 OF ID1-XN-X-25 (ID8-DU-2V0)                    NC2174.2
   000513         051700*            ID1-5 OF ID1-XN-X-25 (ID8-DU-2V0)                    NC2174.2
   000514         051800*            DELIMITED BY SIZE INTO ID7-XN-5                      NC2174.2
   000515         051900*            POINTER ID8-DU-2V0.                                  NC2174.2
   000516         052000*    GO      TO STRING-TEST-4-1.                                  NC2174.2
   000517         052100 STRING-DELETE-4.                                                 NC2174.2

 ==000517==> IGYPS2015-I The paragraph or section prior to paragraph or section "STRING-DELETE-4"
                         did not contain any statements.

   000518         052200     PERFORM DE-LETE.                                             NC2174.2 239
   000519         052300     MOVE    "*DELETED - ANSC INTERPRETATION*" TO RE-MARK.        NC2174.2 92
   000520         052400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000521         052500     GO      TO STR-INIT-GF-5.                                    NC2174.2 542
   000522         052600 STRING-TEST-4-1.                                                 NC2174.2
   000523         052700     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   000524      1  052800     PERFORM PASS                                                 NC2174.2 237
   000525      1  052900     PERFORM PRINT-DETAIL                                         NC2174.2 241
   000526         053000     ELSE                                                         NC2174.2
   000527      1  053100     PERFORM FAIL                                                 NC2174.2 238
   000528      1  053200     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000529      1  053300     MOVE    "ABCDE" TO CORRECT-A                                 NC2174.2 112
   000530      1  053400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000531         053500     ADD     1 TO REC-CT.                                         NC2174.2 134
   000532         053600 STRING-TEST-4-2.                                                 NC2174.2
   000533         053700     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   000534      1  053800     PERFORM PASS                                                 NC2174.2 237
   000535      1  053900     PERFORM PRINT-DETAIL                                         NC2174.2 241
   000536         054000     ELSE                                                         NC2174.2
   000537      1  054100     PERFORM FAIL                                                 NC2174.2 238
   000538      1  054200     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000539      1  054300     MOVE    6 TO CORRECT-N                                       NC2174.2 113
   000540      1  054400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000541         054500*                                                                 NC2174.2
   000542         054600 STR-INIT-GF-5.                                                   NC2174.2
   000543         054700     MOVE    "STR-TEST-GF-5" TO PAR-NAME.                         NC2174.2 87
   000544         054800     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000545         054900     MOVE    "IMMEDIATE OVERFLOW" TO FEATURE.                     NC2174.2 83
   000546         055000     MOVE "*****" TO ID7-XN-5.                                    NC2174.2 60
   000547         055100     MOVE "*****" TO ASTER-XN-5.                                  NC2174.2 61
   000548         055200* NOTE THAT THE POINTER IS SET TO A VALUE GREATER THAN            NC2174.2
   000549         055300*    THE LENGTH OF THE RECEIVING ITEM ID7-XN-5..........          NC2174.2
   000550         055400     MOVE    7 TO ID8-DU-2V0.                                     NC2174.2 43
   000551         055500     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000552         055600*                                                                 NC2174.2
   000553         055700 STR-TEST-GF-5-1.                                                 NC2174.2
   000554         055800     STRING  "ABCDE" DELIMITED BY ABCDEFG-XN-7 INTO ID7-XN-5      NC2174.2 71 60
   000555         055900             POINTER ID8-DU-2V0                                   NC2174.2 43
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    13
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000556      1  056000                     ON OVERFLOW PERFORM PASS                     NC2174.2 237
   000557      1  056100                                 GO TO STR-WRITE-GF-5-1.          NC2174.2 566
   000558         056200     GO      TO STR-FAIL-GF-5-1.                                  NC2174.2 563
   000559         056300 STR-DELETE-GF-5-1.                                               NC2174.2
   000560         056400     PERFORM DE-LETE.                                             NC2174.2 239
   000561         056500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000562         056600     GO TO STR-INIT-GF-6.                                         NC2174.2 603
   000563         056700 STR-FAIL-GF-5-1.                                                 NC2174.2
   000564         056800     PERFORM FAIL.                                                NC2174.2 238
   000565         056900     MOVE    "OVERFLOW SHOULD OCCUR" TO RE-MARK.                  NC2174.2 92
   000566         057000 STR-WRITE-GF-5-1.                                                NC2174.2
   000567         057100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000568         057200*                                                                 NC2174.2
   000569         057300 STR-TEST-GF-5-2.                                                 NC2174.2
   000570         057400     ADD 1 TO REC-CT.                                             NC2174.2 134
   000571         057500     IF      ID7-XN-5 = ASTER-XN-5                                NC2174.2 60 61
   000572      1  057600          PERFORM PASS                                            NC2174.2 237
   000573      1  057700          GO TO STR-WRITE-GF-5-2                                  NC2174.2 583
   000574         057800     ELSE                                                         NC2174.2
   000575      1  057900          GO TO STR-FAIL-GF-5-2.                                  NC2174.2 579
   000576         058000 STR-DELETE-GF-5-2.                                               NC2174.2
   000577         058100     PERFORM DE-LETE.                                             NC2174.2 239
   000578         058200     GO TO STR-WRITE-GF-5-2.                                      NC2174.2 583
   000579         058300 STR-FAIL-GF-5-2.                                                 NC2174.2
   000580         058400     PERFORM FAIL                                                 NC2174.2 238
   000581         058500     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000582         058600     MOVE    "*****" TO CORRECT-A.                                NC2174.2 112
   000583         058700 STR-WRITE-GF-5-2.                                                NC2174.2
   000584         058800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000585         058900*                                                                 NC2174.2
   000586         059000 STR-TEST-GF-5-3.                                                 NC2174.2
   000587         059100     ADD     1 TO REC-CT.                                         NC2174.2 134
   000588         059200     IF      ID8-DU-2V0 = 7                                       NC2174.2 43
   000589      1  059300          PERFORM PASS                                            NC2174.2 237
   000590      1  059400          GO TO STR-WRITE-GF-5-3                                  NC2174.2 600
   000591         059500     ELSE                                                         NC2174.2
   000592      1  059600          GO TO STR-FAIL-GF-5-3.                                  NC2174.2 596
   000593         059700 STR-DELETE-GF-5-3.                                               NC2174.2
   000594         059800     PERFORM DE-LETE.                                             NC2174.2 239
   000595         059900     GO TO STR-WRITE-GF-5-3.                                      NC2174.2 600
   000596         060000 STR-FAIL-GF-5-3.                                                 NC2174.2
   000597         060100     PERFORM FAIL                                                 NC2174.2 238
   000598         060200     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000599         060300     MOVE    7 TO CORRECT-N.                                      NC2174.2 113
   000600         060400 STR-WRITE-GF-5-3.                                                NC2174.2
   000601         060500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000602         060600*                                                                 NC2174.2
   000603         060700 STR-INIT-GF-6.                                                   NC2174.2
   000604         060800     MOVE    "STR-TEST-GF-6" TO PAR-NAME.                         NC2174.2 87
   000605         060900     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000606         061000     MOVE    "SPACE LIT OVERFLOWS" TO FEATURE.                    NC2174.2 83
   000607         061100     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000608         061200     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000609         061300     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000610         061400*                                                                 NC2174.2
   000611         061500 STR-TEST-GF-6-1.                                                 NC2174.2
   000612         061600     STRING  SPACE "ABCDE" DELIMITED BY " ABCDE"                  NC2174.2 IMP
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    14
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000613      1  061700             INTO ID7-XN-5 OVERFLOW PERFORM PASS                  NC2174.2 60 237
   000614      1  061800                                    GO TO STR-WRITE-GF-6-1.       NC2174.2 623
   000615         061900     GO      TO STR-FAIL-GF-6-1.                                  NC2174.2 620
   000616         062000 STR-DELETE-GF-6-1.                                               NC2174.2
   000617         062100     PERFORM DE-LETE.                                             NC2174.2 239
   000618         062200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000619         062300     GO      TO STR-INIT-GF-7.                                    NC2174.2 643
   000620         062400 STR-FAIL-GF-6-1.                                                 NC2174.2
   000621         062500     PERFORM FAIL.                                                NC2174.2 238
   000622         062600     MOVE    "OVERFLOW SHOULD OCCUR" TO RE-MARK.                  NC2174.2 92
   000623         062700 STR-WRITE-GF-6-1.                                                NC2174.2
   000624         062800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000625         062900*                                                                 NC2174.2
   000626         063000 STR-TEST-GF-6-2.                                                 NC2174.2
   000627         063100     ADD 1 TO REC-CT.                                             NC2174.2 134
   000628         063200     IF      ID7-XN-5 = " ABCD"                                   NC2174.2 60
   000629      1  063300          PERFORM PASS                                            NC2174.2 237
   000630      1  063400          GO TO STR-WRITE-GF-6-2                                  NC2174.2 640
   000631         063500     ELSE                                                         NC2174.2
   000632      1  063600          GO TO STR-FAIL-GF-6-2.                                  NC2174.2 636
   000633         063700 STR-DELETE-GF-6-2.                                               NC2174.2
   000634         063800     PERFORM DE-LETE.                                             NC2174.2 239
   000635         063900     GO TO STR-WRITE-GF-6-2.                                      NC2174.2 640
   000636         064000 STR-FAIL-GF-6-2.                                                 NC2174.2
   000637         064100     PERFORM FAIL                                                 NC2174.2 238
   000638         064200     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000639         064300     MOVE    " ABCD" TO CORRECT-A.                                NC2174.2 112
   000640         064400 STR-WRITE-GF-6-2.                                                NC2174.2
   000641         064500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000642         064600*                                                                 NC2174.2
   000643         064700 STR-INIT-GF-7.                                                   NC2174.2
   000644         064800     MOVE    "STR-TEST-GF-7" TO PAR-NAME.                         NC2174.2 87
   000645         064900     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000646         065000     MOVE    "LITERAL SERIES" TO FEATURE.                         NC2174.2 83
   000647         065100     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000648         065200     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000649         065300     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000650         065400*                                                                 NC2174.2
   000651         065500 STR-TEST-GF-7-1.                                                 NC2174.2
   000652         065600     STRING  "A" "B" "C" "D" "E" DELIMITED "ABCDE" INTO ID7-XN-5  NC2174.2 60
   000653      1  065700             POINTER ID8-DU-2V0 OVERFLOW GO TO STR-FAIL-GF-7-1.   NC2174.2 43 660
   000654         065800     PERFORM PASS.                                                NC2174.2 237
   000655         065900     GO TO STR-WRITE-GF-7-1.                                      NC2174.2 663
   000656         066000 STR-DELETE-GF-7-1.                                               NC2174.2
   000657         066100     PERFORM DE-LETE.                                             NC2174.2 239
   000658         066200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000659         066300     GO      TO STR-INIT-GF-8.                                    NC2174.2 700
   000660         066400 STR-FAIL-GF-7-1.                                                 NC2174.2
   000661         066500     PERFORM FAIL.                                                NC2174.2 238
   000662         066600     MOVE    "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK.              NC2174.2 92
   000663         066700 STR-WRITE-GF-7-1.                                                NC2174.2
   000664         066800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000665         066900*                                                                 NC2174.2
   000666         067000 STR-TEST-GF-7-2.                                                 NC2174.2
   000667         067100     ADD     1 TO REC-CT.                                         NC2174.2 134
   000668         067200     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   000669      1  067300          PERFORM PASS                                            NC2174.2 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    15
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000670      1  067400          GO TO STR-WRITE-GF-7-2                                  NC2174.2 680
   000671         067500     ELSE                                                         NC2174.2
   000672      1  067600          GO TO STR-FAIL-GF-7-2.                                  NC2174.2 676
   000673         067700 STR-DELETE-GF-7-2.                                               NC2174.2
   000674         067800     PERFORM DE-LETE.                                             NC2174.2 239
   000675         067900     GO TO STR-WRITE-GF-7-2.                                      NC2174.2 680
   000676         068000 STR-FAIL-GF-7-2.                                                 NC2174.2
   000677         068100     PERFORM FAIL                                                 NC2174.2 238
   000678         068200     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000679         068300     MOVE    "ABCDE" TO CORRECT-A.                                NC2174.2 112
   000680         068400 STR-WRITE-GF-7-2.                                                NC2174.2
   000681         068500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000682         068600*                                                                 NC2174.2
   000683         068700 STR-TEST-GF-7-3.                                                 NC2174.2
   000684         068800     ADD     1 TO REC-CT.                                         NC2174.2 134
   000685         068900     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   000686      1  069000          PERFORM PASS                                            NC2174.2 237
   000687      1  069100          GO TO STR-WRITE-GF-7-3                                  NC2174.2 697
   000688         069200     ELSE                                                         NC2174.2
   000689      1  069300          GO TO STR-FAIL-GF-7-3.                                  NC2174.2 693
   000690         069400 STR-DELETE-GF-7-3.                                               NC2174.2
   000691         069500     PERFORM DE-LETE.                                             NC2174.2 239
   000692         069600     GO TO STR-WRITE-GF-7-3.                                      NC2174.2 697
   000693         069700 STR-FAIL-GF-7-3.                                                 NC2174.2
   000694         069800     PERFORM FAIL                                                 NC2174.2 238
   000695         069900     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000696         070000     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   000697         070100 STR-WRITE-GF-7-3.                                                NC2174.2
   000698         070200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000699         070300*                                                                 NC2174.2
   000700         070400 STR-INIT-GF-8.                                                   NC2174.2
   000701         070500     MOVE    "STR-TEST-GF-8" TO PAR-NAME.                         NC2174.2 87
   000702         070600     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000703         070700     MOVE    "LOW-VALUE OVERFLOW" TO FEATURE.                     NC2174.2 83
   000704         070800     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000705         070900     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000706         071000     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000707         071100*                                                                 NC2174.2
   000708         071200 STR-TEST-GF-8-1.                                                 NC2174.2
   000709         071300     STRING  LOW-VALUE "ABCDE" DELIMITED BY SIZE INTO ID7-XN-5    NC2174.2 IMP 60
   000710         071400             WITH POINTER ID8-DU-2V0                              NC2174.2 43
   000711      1  071500                  ON OVERFLOW PERFORM PASS                        NC2174.2 237
   000712      1  071600                              GO TO STR-WRITE-GF-8-1.             NC2174.2 721
   000713         071700     GO      TO STR-FAIL-GF-8-1.                                  NC2174.2 718
   000714         071800 STR-DELETE-GF-8-1.                                               NC2174.2
   000715         071900     PERFORM DE-LETE.                                             NC2174.2 239
   000716         072000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000717         072100     GO      TO STR-INIT-GF-9.                                    NC2174.2 758
   000718         072200 STR-FAIL-GF-8-1.                                                 NC2174.2
   000719         072300     PERFORM FAIL.                                                NC2174.2 238
   000720         072400     MOVE    "OVERFLOW SHOULD OCCUR" TO RE-MARK.                  NC2174.2 92
   000721         072500 STR-WRITE-GF-8-1.                                                NC2174.2
   000722         072600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000723         072700*                                                                 NC2174.2
   000724         072800 STR-TEST-GF-8-2.                                                 NC2174.2
   000725         072900     ADD     1 TO REC-CT.                                         NC2174.2 134
   000726         073000     IF      ID7-XN-5 = ANS-XN-5-1                                NC2174.2 60 62
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    16
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000727      1  073100          PERFORM PASS                                            NC2174.2 237
   000728      1  073200          GO TO STR-WRITE-GF-8-2                                  NC2174.2 738
   000729         073300     ELSE                                                         NC2174.2
   000730      1  073400          GO TO STR-FAIL-GF-8-2.                                  NC2174.2 734
   000731         073500 STR-DELETE-GF-8-2.                                               NC2174.2
   000732         073600     PERFORM DE-LETE.                                             NC2174.2 239
   000733         073700     GO TO STR-WRITE-GF-8-2.                                      NC2174.2 738
   000734         073800 STR-FAIL-GF-8-2.                                                 NC2174.2
   000735         073900     PERFORM FAIL                                                 NC2174.2 238
   000736         074000     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000737         074100     MOVE    ANS-XN-5-1 TO CORRECT-A.                             NC2174.2 62 112
   000738         074200 STR-WRITE-GF-8-2.                                                NC2174.2
   000739         074300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000740         074400*                                                                 NC2174.2
   000741         074500 STR-TEST-GF-8-3.                                                 NC2174.2
   000742         074600     ADD     1 TO REC-CT.                                         NC2174.2 134
   000743         074700     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   000744      1  074800          PERFORM PASS                                            NC2174.2 237
   000745      1  074900          GO TO STR-WRITE-GF-8-3                                  NC2174.2 755
   000746         075000     ELSE                                                         NC2174.2
   000747      1  075100          GO TO STR-FAIL-GF-8-3.                                  NC2174.2 751
   000748         075200 STR-DELETE-GF-8-3.                                               NC2174.2
   000749         075300     PERFORM DE-LETE.                                             NC2174.2 239
   000750         075400     GO TO STR-WRITE-GF-8-3.                                      NC2174.2 755
   000751         075500 STR-FAIL-GF-8-3.                                                 NC2174.2
   000752         075600     PERFORM FAIL                                                 NC2174.2 238
   000753         075700     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000754         075800     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   000755         075900 STR-WRITE-GF-8-3.                                                NC2174.2
   000756         076000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000757         076100*                                                                 NC2174.2
   000758         076200 STR-INIT-GF-9.                                                   NC2174.2
   000759         076300     MOVE    "STR-TEST-GF-9" TO PAR-NAME.                         NC2174.2 87
   000760         076400     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000761         076500     MOVE    "HIGH-VALUE DEL SIZE" TO FEATURE.                    NC2174.2 83
   000762         076600     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000763         076700     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000764         076800     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000765         076900*                                                                 NC2174.2
   000766         077000 STR-TEST-GF-9-1.                                                 NC2174.2
   000767         077100     STRING  HIGH-VALUE DELIMITED BY SIZE INTO ID7-XN-5           NC2174.2 IMP 60
   000768         077200             POINTER ID8-DU-2V0                                   NC2174.2 43
   000769      1  077300                   OVERFLOW GO TO STR-FAIL-GF-9-1.                NC2174.2 776
   000770         077400     PERFORM PASS.                                                NC2174.2 237
   000771         077500     GO TO STR-WRITE-GF-9-1.                                      NC2174.2 779
   000772         077600 STR-DELETE-GF-9-1.                                               NC2174.2
   000773         077700     PERFORM DE-LETE.                                             NC2174.2 239
   000774         077800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000775         077900     GO      TO STR-INIT-GF-10.                                   NC2174.2 816
   000776         078000 STR-FAIL-GF-9-1.                                                 NC2174.2
   000777         078100     PERFORM FAIL.                                                NC2174.2 238
   000778         078200     MOVE    "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK.              NC2174.2 92
   000779         078300 STR-WRITE-GF-9-1.                                                NC2174.2
   000780         078400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000781         078500*                                                                 NC2174.2
   000782         078600 STR-TEST-GF-9-2.                                                 NC2174.2
   000783         078700     ADD     1 TO REC-CT.                                         NC2174.2 134
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    17
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000784         078800     IF      ID7-XN-5 = ANS-XN-5-2                                NC2174.2 60 65
   000785      1  078900          PERFORM PASS                                            NC2174.2 237
   000786      1  079000          GO TO STR-WRITE-GF-9-2                                  NC2174.2 796
   000787         079100     ELSE                                                         NC2174.2
   000788      1  079200          GO TO STR-FAIL-GF-9-2.                                  NC2174.2 792
   000789         079300 STR-DELETE-GF-9-2.                                               NC2174.2
   000790         079400     PERFORM DE-LETE.                                             NC2174.2 239
   000791         079500     GO TO STR-WRITE-GF-9-2.                                      NC2174.2 796
   000792         079600 STR-FAIL-GF-9-2.                                                 NC2174.2
   000793         079700     PERFORM FAIL                                                 NC2174.2 238
   000794         079800     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000795         079900     MOVE    ANS-XN-5-2 TO CORRECT-A.                             NC2174.2 65 112
   000796         080000 STR-WRITE-GF-9-2.                                                NC2174.2
   000797         080100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000798         080200*                                                                 NC2174.2
   000799         080300 STR-TEST-GF-9-3.                                                 NC2174.2
   000800         080400     ADD     1 TO REC-CT.                                         NC2174.2 134
   000801         080500     IF      ID8-DU-2V0 = 2                                       NC2174.2 43
   000802      1  080600          PERFORM PASS                                            NC2174.2 237
   000803      1  080700          GO TO STR-WRITE-GF-9-3                                  NC2174.2 813
   000804         080800     ELSE                                                         NC2174.2
   000805      1  080900          GO TO STR-FAIL-GF-9-3.                                  NC2174.2 809
   000806         081000 STR-DELETE-GF-9-3.                                               NC2174.2
   000807         081100     PERFORM DE-LETE.                                             NC2174.2 239
   000808         081200     GO TO STR-WRITE-GF-9-3.                                      NC2174.2 813
   000809         081300 STR-FAIL-GF-9-3.                                                 NC2174.2
   000810         081400     PERFORM FAIL                                                 NC2174.2 238
   000811         081500     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000812         081600     MOVE    2 TO CORRECT-N.                                      NC2174.2 113
   000813         081700 STR-WRITE-GF-9-3.                                                NC2174.2
   000814         081800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000815         081900*                                                                 NC2174.2
   000816         082000 STR-INIT-GF-10.                                                  NC2174.2
   000817         082100     MOVE    "STR-TEST-GF-10" TO PAR-NAME.                        NC2174.2 87
   000818         082200     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000819         082300     MOVE    "LIT DEL ZERO" TO FEATURE.                           NC2174.2 83
   000820         082400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000821         082500     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000822         082600     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000823         082700*                                                                 NC2174.2
   000824         082800 STR-TEST-GF-10-0.                                                NC2174.2
   000825         082900     STRING  "A0" "B0D" "C0LKJSD" "D0321" "E0987LKJALKJKLLKJSD"   NC2174.2
   000826         083000             DELIMITED BY ZERO INTO ID7-XN-5 POINTER ID8-DU-2V0.  NC2174.2 IMP 60 43
   000827         083100     GO      TO STR-TEST-GF-10-1.                                 NC2174.2 833
   000828         083200 STR-DELETE-GF-10.                                                NC2174.2
   000829         083300     PERFORM DE-LETE.                                             NC2174.2 239
   000830         083400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000831         083500     GO      TO STR-INIT-GF-11.                                   NC2174.2 866
   000832         083600*                                                                 NC2174.2
   000833         083700 STR-TEST-GF-10-1.                                                NC2174.2
   000834         083800     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   000835      1  083900             PERFORM PASS                                         NC2174.2 237
   000836      1  084000             GO TO STR-WRITE-GF-10-1                              NC2174.2 846
   000837         084100     ELSE                                                         NC2174.2
   000838      1  084200             GO TO STR-FAIL-GF-10-1.                              NC2174.2 842
   000839         084300 STR-DELETE-GF-10-1.                                              NC2174.2
   000840         084400     PERFORM DE-LETE.                                             NC2174.2 239
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    18
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000841         084500     GO TO STR-WRITE-GF-10-1.                                     NC2174.2 846
   000842         084600 STR-FAIL-GF-10-1.                                                NC2174.2
   000843         084700     PERFORM FAIL                                                 NC2174.2 238
   000844         084800     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000845         084900     MOVE    "ABCDE" TO CORRECT-A.                                NC2174.2 112
   000846         085000 STR-WRITE-GF-10-1.                                               NC2174.2
   000847         085100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000848         085200*                                                                 NC2174.2
   000849         085300 STR-TEST-GF-10-2.                                                NC2174.2
   000850         085400     ADD     1 TO REC-CT.                                         NC2174.2 134
   000851         085500     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   000852      1  085600             PERFORM PASS                                         NC2174.2 237
   000853      1  085700             GO TO STR-WRITE-GF-10-2                              NC2174.2 863
   000854         085800     ELSE                                                         NC2174.2
   000855      1  085900             GO TO STR-FAIL-GF-10-2.                              NC2174.2 859
   000856         086000 STR-DELETE-GF-10-2.                                              NC2174.2
   000857         086100     PERFORM DE-LETE.                                             NC2174.2 239
   000858         086200     GO TO STR-WRITE-GF-10-2.                                     NC2174.2 863
   000859         086300 STR-FAIL-GF-10-2.                                                NC2174.2
   000860         086400     PERFORM FAIL                                                 NC2174.2 238
   000861         086500     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000862         086600     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   000863         086700 STR-WRITE-GF-10-2.                                               NC2174.2
   000864         086800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000865         086900*                                                                 NC2174.2
   000866         087000 STR-INIT-GF-11.                                                  NC2174.2
   000867         087100     MOVE    "STR-TEST-GF-11" TO PAR-NAME.                        NC2174.2 87
   000868         087200     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000869         087300     MOVE    "LIT DEL BY QUOTE" TO FEATURE.                       NC2174.2 83
   000870         087400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000871         087500     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000872         087600     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000873         087700*                                                                 NC2174.2
   000874         087800 STR-TEST-GF-11.                                                  NC2174.2
   000875         087900     STRING  "A""" "B""KJHSF" "C""321654987LLKJHAF" "D""=,l."     NC2174.2
   000876         088000             "E""********" DELIMITED BY QUOTE INTO ID7-XN-5       NC2174.2 IMP 60
   000877         088100             POINTER ID8-DU-2V0.                                  NC2174.2 43
   000878         088200     GO      TO STR-TEST-GF-11-1.                                 NC2174.2 884
   000879         088300 STR-DELETE-GF-11-0.                                              NC2174.2
   000880         088400     PERFORM DE-LETE.                                             NC2174.2 239
   000881         088500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000882         088600     GO      TO STR-INIT-GF-12.                                   NC2174.2 917
   000883         088700*                                                                 NC2174.2
   000884         088800 STR-TEST-GF-11-1.                                                NC2174.2
   000885         088900     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   000886      1  089000             PERFORM PASS                                         NC2174.2 237
   000887      1  089100             GO TO STR-WRITE-GF-11-1                              NC2174.2 897
   000888         089200     ELSE                                                         NC2174.2
   000889      1  089300             GO TO STR-FAIL-GF-11-1.                              NC2174.2 893
   000890         089400 STR-DELETE-GF-11-1.                                              NC2174.2
   000891         089500     PERFORM DE-LETE.                                             NC2174.2 239
   000892         089600     GO TO STR-WRITE-GF-11-1.                                     NC2174.2 897
   000893         089700 STR-FAIL-GF-11-1.                                                NC2174.2
   000894         089800     PERFORM FAIL                                                 NC2174.2 238
   000895         089900     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000896         090000     MOVE    "ABCDE" TO CORRECT-A.                                NC2174.2 112
   000897         090100 STR-WRITE-GF-11-1.                                               NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    19
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000898         090200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000899         090300     ADD     1 TO REC-CT.                                         NC2174.2 134
   000900         090400*                                                                 NC2174.2
   000901         090500 STR-TEST-GF-11-2.                                                NC2174.2
   000902         090600     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   000903      1  090700             PERFORM PASS                                         NC2174.2 237
   000904      1  090800             GO TO STR-WRITE-GF-11-2                              NC2174.2 914
   000905         090900     ELSE                                                         NC2174.2
   000906      1  091000             GO TO STR-FAIL-GF-11-2.                              NC2174.2 910
   000907         091100 STR-DELETE-GF-11-2.                                              NC2174.2
   000908         091200     PERFORM DE-LETE.                                             NC2174.2 239
   000909         091300     GO TO STR-WRITE-GF-11-2.                                     NC2174.2 914
   000910         091400 STR-FAIL-GF-11-2.                                                NC2174.2
   000911         091500     PERFORM FAIL                                                 NC2174.2 238
   000912         091600     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   000913         091700     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   000914         091800 STR-WRITE-GF-11-2.                                               NC2174.2
   000915         091900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000916         092000*                                                                 NC2174.2
   000917         092100 STR-INIT-GF-12.                                                  NC2174.2
   000918         092200     MOVE    "STR-TEST-GF-12" TO PAR-NAME.                        NC2174.2 87
   000919         092300     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000920         092400     MOVE    "ZERO ID DEL SIZE" TO FEATURE.                       NC2174.2 83
   000921         092500     MOVE    0 TO REC-CT.                                         NC2174.2 134
   000922         092600     MOVE    ALL "*" TO ID7-XN-15.                                NC2174.2 72
   000923         092700*                                                                 NC2174.2
   000924         092800 STR-TEST-GF-12-1.                                                NC2174.2
   000925         092900     STRING  ZERO ABCDEFG-XN-7 DELIMITED BY SIZE ZERO ABCDEFG-XN-7NC2174.2 IMP 71 IMP 71
   000926         093000             DELIMITED BY SIZE INTO ID7-XN-15.                    NC2174.2 72
   000927         093100     IF      ID7-XN-15 = "0ABCDEFG0ABCDEF"                        NC2174.2 72
   000928      1  093200             PERFORM PASS                                         NC2174.2 237
   000929      1  093300             GO TO STR-WRITE-GF-12-1                              NC2174.2 939
   000930         093400     ELSE                                                         NC2174.2
   000931      1  093500             GO TO STR-FAIL-GF-12-1.                              NC2174.2 935
   000932         093600 STR-DELETE-GF-12-1.                                              NC2174.2
   000933         093700     PERFORM DE-LETE.                                             NC2174.2 239
   000934         093800     GO TO STR-WRITE-GF-12-1.                                     NC2174.2 939
   000935         093900 STR-FAIL-GF-12-1.                                                NC2174.2
   000936         094000     PERFORM FAIL                                                 NC2174.2 238
   000937         094100     MOVE    ID7-XN-15 TO COMPUTED-A                              NC2174.2 72 98
   000938         094200     MOVE    "0ABCDEFG0ABCDEF" TO CORRECT-A.                      NC2174.2 112
   000939         094300 STR-WRITE-GF-12-1.                                               NC2174.2
   000940         094400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000941         094500*                                                                 NC2174.2
   000942         094600 STR-INIT-GF-13.                                                  NC2174.2
   000943         094700     MOVE    "STR-TEST-GF-13" TO PAR-NAME.                        NC2174.2 87
   000944         094800     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000945         094900     MOVE    "LITERAL SERIES" TO FEATURE.                         NC2174.2 83
   000946         095000     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000947         095100*                                                                 NC2174.2
   000948         095200 STR-TEST-GF-13.                                                  NC2174.2
   000949         095300     STRING  "A" "B" "C" DELIMITED BY SIZE "D" "E" "F"  DELIMITED NC2174.2
   000950         095400             BY SIZE INTO ID7-XN-5.                               NC2174.2 60
   000951         095500     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   000952      1  095600             PERFORM PASS                                         NC2174.2 237
   000953      1  095700             GO TO STR-WRITE-GF-13                                NC2174.2 963
   000954         095800     ELSE                                                         NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    20
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  000955      1  095900             GO TO STR-FAIL-GF-13.                                NC2174.2 959
   000956         096000 STR-DELETE-GF-13.                                                NC2174.2
   000957         096100     PERFORM DE-LETE.                                             NC2174.2 239
   000958         096200     GO TO STR-WRITE-GF-13.                                       NC2174.2 963
   000959         096300 STR-FAIL-GF-13.                                                  NC2174.2
   000960         096400     PERFORM FAIL                                                 NC2174.2 238
   000961         096500     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000962         096600     MOVE    "ABCDE" TO CORRECT-A.                                NC2174.2 112
   000963         096700 STR-WRITE-GF-13.                                                 NC2174.2
   000964         096800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000965         096900*                                                                 NC2174.2
   000966         097000 STR-INIT-GF-14.                                                  NC2174.2
   000967         097100     MOVE    "STR-TEST-GF-14" TO PAR-NAME.                        NC2174.2 87
   000968         097200     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000969         097300     MOVE    "IDENTIFIER SERIES" TO FEATURE.                      NC2174.2 83
   000970         097400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000971         097500*                                                                 NC2174.2
   000972         097600 STR-TEST-GF-14.                                                  NC2174.2
   000973         097700     STRING  AB-XN-2 AB-XN-2 AB-XN-2 DELIMITED BY B-XN-1          NC2174.2 59 59 59 58
   000974         097800     AB-XN-2 AB-XN-2 DELIMITED BY B-XN-1 INTO ID7-XN-5.           NC2174.2 59 59 58 60
   000975         097900     IF      ID7-XN-5 = "AAAAA"                                   NC2174.2 60
   000976      1  098000             PERFORM PASS                                         NC2174.2 237
   000977      1  098100             GO TO STR-WRITE-GF-14                                NC2174.2 987
   000978         098200     ELSE                                                         NC2174.2
   000979      1  098300             GO TO STR-FAIL-GF-14.                                NC2174.2 983
   000980         098400 STR-DELETE-GF-14.                                                NC2174.2
   000981         098500     PERFORM DE-LETE.                                             NC2174.2 239
   000982         098600     GO TO STR-WRITE-GF-14.                                       NC2174.2 987
   000983         098700 STR-FAIL-GF-14.                                                  NC2174.2
   000984         098800     PERFORM FAIL                                                 NC2174.2 238
   000985         098900     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   000986         099000     MOVE "AAAAA" TO CORRECT-A.                                   NC2174.2 112
   000987         099100 STR-WRITE-GF-14.                                                 NC2174.2
   000988         099200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   000989         099300*                                                                 NC2174.2
   000990         099400 STR-INIT-GF-15.                                                  NC2174.2
   000991         099500     MOVE    "STR-TEST-GF-15" TO PAR-NAME.                        NC2174.2 87
   000992         099600     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   000993         099700     MOVE    "SIGN LEADING" TO FEATURE.                           NC2174.2 83
   000994         099800     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   000995         099900     MOVE    +1001 TO ID1-DS-LS-4.                                NC2174.2 46
   000996         100000     MOVE    ZERO TO ZEROX-XN-1.                                  NC2174.2 IMP 56
   000997         100100     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   000998         100200     MOVE    1 TO REC-CT.                                         NC2174.2 134
   000999         100300*                                                                 NC2174.2
   001000         100400 STR-TEST-GF-15-0.                                                NC2174.2
   001001         100500     STRING  ID1-DS-LS-4 DELIMITED BY ZEROX-XN-1 SPACE DELIMITED  NC2174.2 46 56 IMP
   001002         100600             BY SIZE ID1-DS-LS-4 DELIMITED "0" INTO               NC2174.2 46
   001003         100700             ID7-XN-5 POINTER ID8-DU-2V0.                         NC2174.2 60 43
   001004         100800     GO      TO STR-TEST-GF-15-1.                                 NC2174.2 1010
   001005         100900 STR-DELETE-GF-15.                                                NC2174.2
   001006         101000     PERFORM DE-LETE.                                             NC2174.2 239
   001007         101100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001008         101200     GO      TO STR-INIT-GF-16.                                   NC2174.2 1043
   001009         101300*                                                                 NC2174.2
   001010         101400 STR-TEST-GF-15-1.                                                NC2174.2
   001011         101500     IF      ID7-XN-5 = "+1 +1"                                   NC2174.2 60
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    21
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001012      1  101600             PERFORM PASS                                         NC2174.2 237
   001013      1  101700             GO TO STR-WRITE-GF-15-1                              NC2174.2 1023
   001014         101800     ELSE                                                         NC2174.2
   001015      1  101900             GO TO STR-FAIL-GF-15-1.                              NC2174.2 1019
   001016         102000 STR-DELETE-GF-15-1.                                              NC2174.2
   001017         102100     PERFORM DE-LETE.                                             NC2174.2 239
   001018         102200     GO TO STR-WRITE-GF-15-1.                                     NC2174.2 1023
   001019         102300 STR-FAIL-GF-15-1.                                                NC2174.2
   001020         102400     PERFORM FAIL                                                 NC2174.2 238
   001021         102500     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001022         102600     MOVE    "+1 +1" TO CORRECT-A.                                NC2174.2 112
   001023         102700 STR-WRITE-GF-15-1.                                               NC2174.2
   001024         102800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001025         102900*                                                                 NC2174.2
   001026         103000 STR-TEST-GF-15-2.                                                NC2174.2
   001027         103100     ADD     1 TO REC-CT.                                         NC2174.2 134
   001028         103200     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001029      1  103300             PERFORM PASS                                         NC2174.2 237
   001030      1  103400             GO TO STR-WRITE-GF-15-2                              NC2174.2 1040
   001031         103500     ELSE                                                         NC2174.2
   001032      1  103600             GO TO STR-FAIL-GF-15-2.                              NC2174.2 1036
   001033         103700 STR-DELETE-GF-15-2.                                              NC2174.2
   001034         103800     PERFORM DE-LETE.                                             NC2174.2 239
   001035         103900     GO TO STR-WRITE-GF-15-2.                                     NC2174.2 1040
   001036         104000 STR-FAIL-GF-15-2.                                                NC2174.2
   001037         104100     PERFORM FAIL                                                 NC2174.2 238
   001038         104200     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001039         104300     MOVE 6 TO CORRECT-N.                                         NC2174.2 113
   001040         104400 STR-WRITE-GF-15-2.                                               NC2174.2
   001041         104500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001042         104600*                                                                 NC2174.2
   001043         104700 STR-INIT-GF-16.                                                  NC2174.2
   001044         104800     MOVE    "STR-TEST-GF-16" TO PAR-NAME.                        NC2174.2 87
   001045         104900     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   001046         105000     MOVE    "SIGN LEADING" TO FEATURE.                           NC2174.2 83
   001047         105100     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001048         105200     MOVE    +1001 TO ID1-DS-LS-4.                                NC2174.2 46
   001049         105300     MOVE    ZERO TO ZEROX-XN-1.                                  NC2174.2 IMP 56
   001050         105400     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001051         105500     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001052         105600*                                                                 NC2174.2
   001053         105700 STR-TEST-GF-16-0.                                                NC2174.2
   001054         105800     STRING  ID1-DS-LS-4 DELIMITED "0" " " DELIMITED BY SIZE      NC2174.2 46
   001055         105900             ID1-DS-LS-4 DELIMITED BY ZEROX-XN-1 INTO ID7-XN-5    NC2174.2 46 56 60
   001056         106000             POINTER ID8-DU-2V0.                                  NC2174.2 43
   001057         106100     GO      TO STR-TEST-GF-16-1.                                 NC2174.2 1063
   001058         106200 STR-DELETE-GF-16.                                                NC2174.2
   001059         106300     PERFORM DE-LETE.                                             NC2174.2 239
   001060         106400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001061         106500     GO      TO STR-INIT-GF-17.                                   NC2174.2 1096
   001062         106600*                                                                 NC2174.2
   001063         106700 STR-TEST-GF-16-1.                                                NC2174.2
   001064         106800     IF      ID7-XN-5 = "+1 +1"                                   NC2174.2 60
   001065      1  106900             PERFORM PASS                                         NC2174.2 237
   001066      1  107000             GO TO STR-WRITE-GF-16-1                              NC2174.2 1076
   001067         107100     ELSE                                                         NC2174.2
   001068      1  107200             GO TO STR-FAIL-GF-16-1.                              NC2174.2 1072
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    22
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001069         107300 STR-DELETE-GF-16-1.                                              NC2174.2
   001070         107400     PERFORM DE-LETE.                                             NC2174.2 239
   001071         107500     GO TO STR-WRITE-GF-16-1.                                     NC2174.2 1076
   001072         107600 STR-FAIL-GF-16-1.                                                NC2174.2
   001073         107700     PERFORM FAIL                                                 NC2174.2 238
   001074         107800     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001075         107900     MOVE    "+1 +1" TO CORRECT-A.                                NC2174.2 112
   001076         108000 STR-WRITE-GF-16-1.                                               NC2174.2
   001077         108100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001078         108200*                                                                 NC2174.2
   001079         108300 STR-TEST-GF-16-2.                                                NC2174.2
   001080         108400     ADD     1 TO REC-CT.                                         NC2174.2 134
   001081         108500     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001082      1  108600             PERFORM PASS                                         NC2174.2 237
   001083      1  108700             GO TO STR-WRITE-GF-16-2                              NC2174.2 1093
   001084         108800     ELSE                                                         NC2174.2
   001085      1  108900             GO TO STR-FAIL-GF-16-2.                              NC2174.2 1089
   001086         109000 STR-DELETE-GF-16-2.                                              NC2174.2
   001087         109100     PERFORM DE-LETE.                                             NC2174.2 239
   001088         109200     GO TO STR-WRITE-GF-16-2.                                     NC2174.2 1093
   001089         109300 STR-FAIL-GF-16-2.                                                NC2174.2
   001090         109400     PERFORM FAIL                                                 NC2174.2 238
   001091         109500     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001092         109600     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001093         109700 STR-WRITE-GF-16-2.                                               NC2174.2
   001094         109800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001095         109900*                                                                 NC2174.2
   001096         110000 STR-INIT-GF-17.                                                  NC2174.2
   001097         110100     MOVE    "STR-TEST-GF-17" TO PAR-NAME.                        NC2174.2 87
   001098         110200     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   001099         110300     MOVE    "SIGN TRAILING" TO FEATURE.                          NC2174.2 83
   001100         110400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001101         110500     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001102         110600     MOVE    +1001 TO ID1-DS-TS-4.                                NC2174.2 47
   001103         110700     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001104         110800*                                                                 NC2174.2
   001105         110900 STR-TEST-GF-17-0.                                                NC2174.2
   001106         111000     STRING  ID1-DS-TS-4 DELIMITED BY SIZE SPACE DELIMITED SIZE   NC2174.2 47 IMP
   001107         111100             ID1-DS-TS-4 DELIMITED BY SIZE                        NC2174.2 47
   001108         111200             INTO ID7-XN-5 POINTER ID8-DU-2V0.                    NC2174.2 60 43
   001109         111300     GO      TO STR-TEST-GF-17-1.                                 NC2174.2 1115
   001110         111400 STR-DELETE-GF-17.                                                NC2174.2
   001111         111500     PERFORM DE-LETE.                                             NC2174.2 239
   001112         111600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001113         111700     GO      TO STR-INIT-GF-18.                                   NC2174.2 1148
   001114         111800*                                                                 NC2174.2
   001115         111900 STR-TEST-GF-17-1.                                                NC2174.2
   001116         112000     IF      ID7-XN-5 = "1001+"                                   NC2174.2 60
   001117      1  112100             PERFORM PASS                                         NC2174.2 237
   001118      1  112200             GO TO STR-WRITE-GF-17-1                              NC2174.2 1128
   001119         112300     ELSE                                                         NC2174.2
   001120      1  112400             GO TO STR-FAIL-GF-17-1.                              NC2174.2 1124
   001121         112500 STR-DELETE-GF-17-1.                                              NC2174.2
   001122         112600     PERFORM DE-LETE.                                             NC2174.2 239
   001123         112700     GO TO STR-WRITE-GF-17-1.                                     NC2174.2 1128
   001124         112800 STR-FAIL-GF-17-1.                                                NC2174.2
   001125         112900     PERFORM FAIL                                                 NC2174.2 238
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    23
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001126         113000     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001127         113100     MOVE    "1001+" TO CORRECT-A.                                NC2174.2 112
   001128         113200 STR-WRITE-GF-17-1.                                               NC2174.2
   001129         113300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001130         113400*                                                                 NC2174.2
   001131         113500 STR-TEST-GF-17-2.                                                NC2174.2
   001132         113600     ADD     1 TO REC-CT.                                         NC2174.2 134
   001133         113700     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001134      1  113800             PERFORM PASS                                         NC2174.2 237
   001135      1  113900             GO TO STR-WRITE-GF-17-2                              NC2174.2 1145
   001136         114000     ELSE                                                         NC2174.2
   001137      1  114100             GO TO STR-FAIL-GF-17-2.                              NC2174.2 1141
   001138         114200 STR-DELETE-GF-17-2.                                              NC2174.2
   001139         114300     PERFORM DE-LETE.                                             NC2174.2 239
   001140         114400     GO TO STR-WRITE-GF-17-2.                                     NC2174.2 1145
   001141         114500 STR-FAIL-GF-17-2.                                                NC2174.2
   001142         114600     PERFORM FAIL                                                 NC2174.2 238
   001143         114700     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001144         114800     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001145         114900 STR-WRITE-GF-17-2.                                               NC2174.2
   001146         115000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001147         115100*                                                                 NC2174.2
   001148         115200 STR-INIT-GF-18.                                                  NC2174.2
   001149         115300     MOVE    "STR-TEST-GF-18" TO PAR-NAME.                        NC2174.2 87
   001150         115400     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   001151         115500     MOVE    "NEG LEADING SEPARATE" TO FEATURE.                   NC2174.2 83
   001152         115600     MOVE    -1001 TO ID1-DS-LS-4.                                NC2174.2 46
   001153         115700     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001154         115800     MOVE    ZERO TO ZEROX-XN-1.                                  NC2174.2 IMP 56
   001155         115900     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001156         116000     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001157         116100*                                                                 NC2174.2
   001158         116200 STR-TEST-GF-18-0.                                                NC2174.2
   001159         116300     STRING  ID1-DS-LS-4 DELIMITED BY ZEROX-XN-1 SPACE DELIMITED  NC2174.2 46 56 IMP
   001160         116400             BY SIZE ID1-DS-LS-4 DELIMITED BY "0" INTO            NC2174.2 46
   001161         116500             ID7-XN-5 POINTER ID8-DU-2V0.                         NC2174.2 60 43
   001162         116600     GO      TO STR-TEST-GF-18-1.                                 NC2174.2 1168
   001163         116700 STR-DELETE-GF-18.                                                NC2174.2
   001164         116800     PERFORM DE-LETE.                                             NC2174.2 239
   001165         116900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001166         117000     GO      TO STR-INIT-GF-19.                                   NC2174.2 1201
   001167         117100*                                                                 NC2174.2
   001168         117200 STR-TEST-GF-18-1.                                                NC2174.2
   001169         117300     IF      ID7-XN-5 = "-1 -1"                                   NC2174.2 60
   001170      1  117400             PERFORM PASS                                         NC2174.2 237
   001171      1  117500             GO TO STR-WRITE-GF-18-1                              NC2174.2 1181
   001172         117600     ELSE                                                         NC2174.2
   001173      1  117700             GO TO STR-FAIL-GF-18-1.                              NC2174.2 1177
   001174         117800 STR-DELETE-GF-18-1.                                              NC2174.2
   001175         117900     PERFORM DE-LETE.                                             NC2174.2 239
   001176         118000     GO TO STR-WRITE-GF-18-1.                                     NC2174.2 1181
   001177         118100 STR-FAIL-GF-18-1.                                                NC2174.2
   001178         118200     PERFORM FAIL                                                 NC2174.2 238
   001179         118300     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001180         118400     MOVE    "-1 -1" TO CORRECT-A.                                NC2174.2 112
   001181         118500 STR-WRITE-GF-18-1.                                               NC2174.2
   001182         118600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    24
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001183         118700*                                                                 NC2174.2
   001184         118800 STR-TEST-GF-18-2.                                                NC2174.2
   001185         118900     ADD     1 TO REC-CT.                                         NC2174.2 134
   001186         119000     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001187      1  119100             PERFORM PASS                                         NC2174.2 237
   001188      1  119200             GO TO STR-WRITE-GF-18-2                              NC2174.2 1198
   001189         119300     ELSE                                                         NC2174.2
   001190      1  119400             GO TO STR-FAIL-GF-18-2.                              NC2174.2 1194
   001191         119500 STR-DELETE-GF-18-2.                                              NC2174.2
   001192         119600     PERFORM DE-LETE.                                             NC2174.2 239
   001193         119700     GO TO STR-WRITE-GF-18-2.                                     NC2174.2 1198
   001194         119800 STR-FAIL-GF-18-2.                                                NC2174.2
   001195         119900     PERFORM FAIL                                                 NC2174.2 238
   001196         120000     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001197         120100     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001198         120200 STR-WRITE-GF-18-2.                                               NC2174.2
   001199         120300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001200         120400*                                                                 NC2174.2
   001201         120500 STR-INIT-GF-19.                                                  NC2174.2
   001202         120600     MOVE    "STR-TEST-GF-19" TO PAR-NAME.                        NC2174.2 87
   001203         120700     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   001204         120800     MOVE    "NEGATIVE SIGN TRAIL" TO FEATURE.                    NC2174.2 83
   001205         120900     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001206         121000     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001207         121100     MOVE    -1001 TO ID1-DS-TS-4.                                NC2174.2 47
   001208         121200     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001209         121300*                                                                 NC2174.2
   001210         121400 STR-TEST-GF-19-0.                                                NC2174.2
   001211         121500     STRING  ID1-DS-TS-4 DELIMITED BY SIZE SPACE DELIMITED SIZE   NC2174.2 47 IMP
   001212         121600             ID1-DS-TS-4 DELIMITED BY SIZE INTO ID7-XN-5          NC2174.2 47 60
   001213         121700             POINTER ID8-DU-2V0.                                  NC2174.2 43
   001214         121800     GO      TO STR-TEST-GF-19-1.                                 NC2174.2 1220
   001215         121900 STR-DELETE-GF-19.                                                NC2174.2
   001216         122000     PERFORM DE-LETE.                                             NC2174.2 239
   001217         122100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001218         122200     GO      TO STR-INIT-GF-20.                                   NC2174.2 1253
   001219         122300*                                                                 NC2174.2
   001220         122400 STR-TEST-GF-19-1.                                                NC2174.2
   001221         122500     IF      ID7-XN-5 = "1001-"                                   NC2174.2 60
   001222      1  122600             PERFORM PASS                                         NC2174.2 237
   001223      1  122700             GO TO STR-WRITE-GF-19-1                              NC2174.2 1233
   001224         122800     ELSE                                                         NC2174.2
   001225      1  122900             GO TO STR-FAIL-GF-19-1.                              NC2174.2 1229
   001226         123000 STR-DELETE-GF-19-1.                                              NC2174.2
   001227         123100     PERFORM DE-LETE.                                             NC2174.2 239
   001228         123200     GO TO STR-WRITE-GF-19-1.                                     NC2174.2 1233
   001229         123300 STR-FAIL-GF-19-1.                                                NC2174.2
   001230         123400     PERFORM FAIL                                                 NC2174.2 238
   001231         123500     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001232         123600     MOVE    "1001-" TO CORRECT-A.                                NC2174.2 112
   001233         123700 STR-WRITE-GF-19-1.                                               NC2174.2
   001234         123800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001235         123900*                                                                 NC2174.2
   001236         124000 STR-TEST-GF-19-2.                                                NC2174.2
   001237         124100     ADD     1 TO REC-CT.                                         NC2174.2 134
   001238         124200     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001239      1  124300             PERFORM PASS                                         NC2174.2 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    25
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001240      1  124400             GO TO STR-WRITE-GF-19-2                              NC2174.2 1250
   001241         124500     ELSE                                                         NC2174.2
   001242      1  124600             GO TO STR-FAIL-GF-19-2.                              NC2174.2 1246
   001243         124700 STR-DELETE-GF-19-2.                                              NC2174.2
   001244         124800     PERFORM DE-LETE.                                             NC2174.2 239
   001245         124900     GO TO STR-WRITE-GF-19-2.                                     NC2174.2 1250
   001246         125000 STR-FAIL-GF-19-2.                                                NC2174.2
   001247         125100     PERFORM FAIL                                                 NC2174.2 238
   001248         125200     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001249         125300     MOVE 6 TO CORRECT-N.                                         NC2174.2 113
   001250         125400 STR-WRITE-GF-19-2.                                               NC2174.2
   001251         125500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001252         125600*                                                                 NC2174.2
   001253         125700 STR-INIT-GF-20.                                                  NC2174.2
   001254         125800     MOVE    "STR-TEST-GF-20" TO PAR-NAME.                        NC2174.2 87
   001255         125900     MOVE   "VI-130 6.24.3+4" TO ANSI-REFERENCE.                  NC2174.2 143
   001256         126000     MOVE    "LITERAL SERIES" TO FEATURE.                         NC2174.2 83
   001257         126100     MOVE ALL "*" TO WISH-LIST-XN-37.                             NC2174.2 73
   001258         126200     MOVE "GEE I WISH I WAS A FORTRAN PROGRAMMER" TO ANS-XN-37.   NC2174.2 74
   001259         126300     MOVE    1 TO MY-BOSS-DU-2V0.                                 NC2174.2 45
   001260         126400     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001261         126500*                                                                 NC2174.2
   001262         126600 STR-TEST-GF-20-1.                                                NC2174.2
   001263         126700     STRING  "GEE" SPACE "I WISH I" SPACES "WAS A FORTRAN" " "    NC2174.2 IMP IMP
   001264         126800             "PROGRAMMER"                                         NC2174.2
   001265         126900             DELIMITED BY SIZE INTO WISH-LIST-XN-37               NC2174.2 73
   001266         127000             WITH POINTER MY-BOSS-DU-2V0                          NC2174.2 45
   001267      1  127100             ON OVERFLOW GO TO STR-FAIL-GF-20-1.                  NC2174.2 1274
   001268         127200     PERFORM PASS.                                                NC2174.2 237
   001269         127300     GO TO STR-WRITE-GF-20-1.                                     NC2174.2 1277
   001270         127400 STR-DELETE-GF-20.                                                NC2174.2
   001271         127500     PERFORM DE-LETE.                                             NC2174.2 239
   001272         127600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001273         127700     GO TO   STR-INIT-GF-21.                                      NC2174.2 1316
   001274         127800 STR-FAIL-GF-20-1.                                                NC2174.2
   001275         127900     PERFORM FAIL.                                                NC2174.2 238
   001276         128000     MOVE    "OVERFLOW SHOULD NOT OCCUR" TO RE-MARK.              NC2174.2 92
   001277         128100 STR-WRITE-GF-20-1.                                               NC2174.2
   001278         128200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001279         128300*                                                                 NC2174.2
   001280         128400 STR-TEST-GF-20-2.                                                NC2174.2
   001281         128500     MOVE    "STR-TEST-GF-20" TO PAR-NAME.                        NC2174.2 87
   001282         128600     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001283         128700     IF      WISH-LIST-XN-37 = ANS-XN-37                          NC2174.2 73 74
   001284      1  128800             PERFORM PASS                                         NC2174.2 237
   001285      1  128900             GO TO STR-WRITE-GF-20-2                              NC2174.2 1295
   001286         129000     ELSE                                                         NC2174.2
   001287      1  129100             GO TO STR-FAIL-GF-20-2.                              NC2174.2 1291
   001288         129200 STR-DELETE-GF-20-2.                                              NC2174.2
   001289         129300     PERFORM DE-LETE.                                             NC2174.2 239
   001290         129400     GO TO STR-WRITE-GF-20-2.                                     NC2174.2 1295
   001291         129500 STR-FAIL-GF-20-2.                                                NC2174.2
   001292         129600     PERFORM FAIL                                                 NC2174.2 238
   001293         129700     MOVE    WISH-LIST-XN-37 TO COMPUTED-A                        NC2174.2 73 98
   001294         129800     MOVE    ANS-XN-37 TO CORRECT-A.                              NC2174.2 74 112
   001295         129900 STR-WRITE-GF-20-2.                                               NC2174.2
   001296         130000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    26
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001297         130100*                                                                 NC2174.2
   001298         130200 STR-TEST-GF-20-3.                                                NC2174.2
   001299         130300     ADD     1 TO REC-CT.                                         NC2174.2 134
   001300         130400     IF      MY-BOSS-DU-2V0 = 38                                  NC2174.2 45
   001301      1  130500             PERFORM PASS                                         NC2174.2 237
   001302      1  130600             GO TO STR-WRITE-GF-20-3                              NC2174.2 1312
   001303         130700     ELSE                                                         NC2174.2
   001304      1  130800             GO TO STR-FAIL-GF-20-3.                              NC2174.2 1308
   001305         130900 STR-DELETE-GF-20-3.                                              NC2174.2
   001306         131000     PERFORM DE-LETE.                                             NC2174.2 239
   001307         131100     GO TO STR-WRITE-GF-20-3.                                     NC2174.2 1312
   001308         131200 STR-FAIL-GF-20-3.                                                NC2174.2
   001309         131300     PERFORM FAIL                                                 NC2174.2 238
   001310         131400     MOVE    MY-BOSS-DU-2V0 TO COMPUTED-N                         NC2174.2 45 99
   001311         131500     MOVE    38 TO CORRECT-N.                                     NC2174.2 113
   001312         131600 STR-WRITE-GF-20-3.                                               NC2174.2
   001313         131700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001314         131800*                                                                 NC2174.2
   001315         131900*                                                                 NC2174.2
   001316         132000 STR-INIT-GF-21.                                                  NC2174.2
   001317         132100*    ===-->  INTO GROUP FIELD  <--===                             NC2174.2
   001318         132200     MOVE   "VI-130 6.24.3 GR4" TO ANSI-REFERENCE.                NC2174.2 143
   001319         132300     MOVE   "STR-TEST-GF-21" TO PAR-NAME.                         NC2174.2 87
   001320         132400     MOVE   "LIT DEL BY SIZE" TO FEATURE.                         NC2174.2 83
   001321         132500     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001322         132600     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001323         132700     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001324         132800*                                                                 NC2174.2
   001325         132900 STR-TEST-GF-21-0.                                                NC2174.2
   001326         133000     STRING "ABCDEF" DELIMITED BY SIZE INTO TEST-21-GROUP         NC2174.2 76
   001327         133100             WITH POINTER ID8-DU-2V0.                             NC2174.2 43
   001328         133200     GO TO   STR-TEST-GF-21-1.                                    NC2174.2 1334
   001329         133300 STR-DELETE-GF-21.                                                NC2174.2
   001330         133400     PERFORM DE-LETE.                                             NC2174.2 239
   001331         133500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001332         133600     GO TO   STR-INIT-GF-22.                                      NC2174.2 1367
   001333         133700*                                                                 NC2174.2
   001334         133800 STR-TEST-GF-21-1.                                                NC2174.2
   001335         133900     IF      TEST-21-GROUP = "ABCDE"                              NC2174.2 76
   001336      1  134000             PERFORM PASS                                         NC2174.2 237
   001337      1  134100             GO TO STR-WRITE-GF-21-1                              NC2174.2 1347
   001338         134200     ELSE                                                         NC2174.2
   001339      1  134300             GO TO STR-FAIL-GF-21-1.                              NC2174.2 1343
   001340         134400 STR-DELETE-GF-21-1.                                              NC2174.2
   001341         134500     PERFORM DE-LETE.                                             NC2174.2 239
   001342         134600     GO TO STR-WRITE-GF-21-1.                                     NC2174.2 1347
   001343         134700 STR-FAIL-GF-21-1.                                                NC2174.2
   001344         134800     PERFORM FAIL                                                 NC2174.2 238
   001345         134900     MOVE    TEST-21-GROUP TO COMPUTED-A                          NC2174.2 76 98
   001346         135000     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001347         135100 STR-WRITE-GF-21-1.                                               NC2174.2
   001348         135200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001349         135300*                                                                 NC2174.2
   001350         135400 STR-TEST-GF-21-2.                                                NC2174.2
   001351         135500     ADD 1 TO REC-CT.                                             NC2174.2 134
   001352         135600     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001353      1  135700             PERFORM PASS                                         NC2174.2 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    27
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001354      1  135800             GO TO STR-WRITE-GF-21-2                              NC2174.2 1364
   001355         135900     ELSE                                                         NC2174.2
   001356      1  136000             GO TO STR-FAIL-GF-21-2.                              NC2174.2 1360
   001357         136100 STR-DELETE-GF-21-2.                                              NC2174.2
   001358         136200     PERFORM DE-LETE.                                             NC2174.2 239
   001359         136300     GO TO STR-WRITE-GF-21-2.                                     NC2174.2 1364
   001360         136400 STR-FAIL-GF-21-2.                                                NC2174.2
   001361         136500     PERFORM FAIL                                                 NC2174.2 238
   001362         136600     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001363         136700     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001364         136800 STR-WRITE-GF-21-2.                                               NC2174.2
   001365         136900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001366         137000*                                                                 NC2174.2
   001367         137100 STR-INIT-GF-22.                                                  NC2174.2
   001368         137200*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2174.2
   001369         137300     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   001370         137400     MOVE   "STR-TEST-GF-22" TO PAR-NAME.                         NC2174.2 87
   001371         137500     MOVE   "LIT DEL BY LIT" TO FEATURE.                          NC2174.2 83
   001372         137600     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001373         137700     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001374         137800     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001375         137900*                                                                 NC2174.2
   001376         138000 STR-TEST-GF-22-1.                                                NC2174.2
   001377         138100     STRING "ABCDEF" DELIMITED BY "ABCDEFG"                       NC2174.2
   001378         138200             INTO ID7-XN-5 WITH POINTER ID8-DU-2V0                NC2174.2 60 43
   001379      1  138300         NOT ON OVERFLOW GO TO STR-FAIL-GF-22-1.                  NC2174.2 1386
   001380         138400     PERFORM PASS.                                                NC2174.2 237
   001381         138500     GO TO STR-WRITE-GF-22-1.                                     NC2174.2 1389
   001382         138600 STR-DELETE-GF-22.                                                NC2174.2
   001383         138700     PERFORM DE-LETE.                                             NC2174.2 239
   001384         138800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001385         138900     GO      TO STR-INIT-GF-23.                                   NC2174.2 1426
   001386         139000 STR-FAIL-GF-22-1.                                                NC2174.2
   001387         139100     PERFORM FAIL.                                                NC2174.2 238
   001388         139200     MOVE    "NOT ON OVERFLOW SHOULD NOT OCCUR" TO RE-MARK.       NC2174.2 92
   001389         139300 STR-WRITE-GF-22-1.                                               NC2174.2
   001390         139400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001391         139500*                                                                 NC2174.2
   001392         139600 STR-TEST-GF-22-2.                                                NC2174.2
   001393         139700     ADD     1 TO REC-CT.                                         NC2174.2 134
   001394         139800     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001395      1  139900             PERFORM PASS                                         NC2174.2 237
   001396      1  140000             GO TO STR-WRITE-GF-22-2                              NC2174.2 1406
   001397         140100     ELSE                                                         NC2174.2
   001398      1  140200             GO TO STR-FAIL-GF-22-2.                              NC2174.2 1402
   001399         140300 STR-DELETE-GF-22-2.                                              NC2174.2
   001400         140400     PERFORM DE-LETE.                                             NC2174.2 239
   001401         140500     GO TO STR-WRITE-GF-22-2.                                     NC2174.2 1406
   001402         140600 STR-FAIL-GF-22-2.                                                NC2174.2
   001403         140700     PERFORM FAIL.                                                NC2174.2 238
   001404         140800     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001405         140900     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001406         141000 STR-WRITE-GF-22-2.                                               NC2174.2
   001407         141100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001408         141200*                                                                 NC2174.2
   001409         141300 STR-TEST-GF-22-3.                                                NC2174.2
   001410         141400     ADD     1 TO REC-CT.                                         NC2174.2 134
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    28
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001411         141500     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001412      1  141600             PERFORM PASS                                         NC2174.2 237
   001413      1  141700             GO TO STR-WRITE-GF-22-3                              NC2174.2 1423
   001414         141800     ELSE                                                         NC2174.2
   001415      1  141900             GO TO STR-FAIL-GF-22-3.                              NC2174.2 1419
   001416         142000 STR-DELETE-GF-22-3.                                              NC2174.2
   001417         142100     PERFORM DE-LETE.                                             NC2174.2 239
   001418         142200     GO TO STR-WRITE-GF-22-3.                                     NC2174.2 1423
   001419         142300 STR-FAIL-GF-22-3.                                                NC2174.2
   001420         142400     PERFORM FAIL                                                 NC2174.2 238
   001421         142500     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001422         142600     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001423         142700 STR-WRITE-GF-22-3.                                               NC2174.2
   001424         142800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001425         142900*                                                                 NC2174.2
   001426         143000 STR-INIT-GF-23.                                                  NC2174.2
   001427         143100*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2174.2
   001428         143200     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   001429         143300     MOVE   "STR-TEST-GF-23" TO PAR-NAME.                         NC2174.2 87
   001430         143400     MOVE   "LITERAL SERIES" TO FEATURE.                          NC2174.2 83
   001431         143500     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001432         143600     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001433         143700     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001434         143800*                                                                 NC2174.2
   001435         143900 STR-TEST-GF-23-1.                                                NC2174.2
   001436         144000     STRING "A" "B" "C" "D" "E" DELIMITED "ABCDE" INTO ID7-XN-5   NC2174.2 60
   001437         144100             POINTER ID8-DU-2V0                                   NC2174.2 43
   001438      1  144200         NOT ON OVERFLOW PERFORM PASS                             NC2174.2 237
   001439      1  144300                         GO TO   STR-WRITE-GF-23-1.               NC2174.2 1448
   001440         144400     GO TO   STR-FAIL-GF-23-1.                                    NC2174.2 1445
   001441         144500 STR-DELETE-GF-23.                                                NC2174.2
   001442         144600     PERFORM DE-LETE.                                             NC2174.2 239
   001443         144700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001444         144800     GO TO   STR-INIT-GF-24.                                      NC2174.2 1485
   001445         144900 STR-FAIL-GF-23-1.                                                NC2174.2
   001446         145000     PERFORM FAIL.                                                NC2174.2 238
   001447         145100     MOVE   "NOT ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK.    NC2174.2 92
   001448         145200 STR-WRITE-GF-23-1.                                               NC2174.2
   001449         145300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001450         145400*                                                                 NC2174.2
   001451         145500 STR-TEST-GF-23-2.                                                NC2174.2
   001452         145600     ADD     1 TO REC-CT.                                         NC2174.2 134
   001453         145700     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001454      1  145800             PERFORM PASS                                         NC2174.2 237
   001455      1  145900             GO TO STR-WRITE-GF-23-2                              NC2174.2 1465
   001456         146000     ELSE                                                         NC2174.2
   001457      1  146100             GO TO STR-FAIL-GF-23-2.                              NC2174.2 1461
   001458         146200 STR-DELETE-GF-23-2.                                              NC2174.2
   001459         146300     PERFORM DE-LETE.                                             NC2174.2 239
   001460         146400     GO TO STR-WRITE-GF-23-2.                                     NC2174.2 1465
   001461         146500 STR-FAIL-GF-23-2.                                                NC2174.2
   001462         146600     PERFORM FAIL                                                 NC2174.2 238
   001463         146700     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001464         146800     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001465         146900 STR-WRITE-GF-23-2.                                               NC2174.2
   001466         147000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001467         147100*                                                                 NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    29
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001468         147200 STR-TEST-GF-23-3.                                                NC2174.2
   001469         147300     ADD     1 TO REC-CT.                                         NC2174.2 134
   001470         147400     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001471      1  147500             PERFORM PASS                                         NC2174.2 237
   001472      1  147600             GO TO STR-WRITE-GF-23-3                              NC2174.2 1482
   001473         147700     ELSE                                                         NC2174.2
   001474      1  147800             GO TO STR-FAIL-GF-23-3.                              NC2174.2 1478
   001475         147900 STR-DELETE-GF-23-3.                                              NC2174.2
   001476         148000     PERFORM DE-LETE.                                             NC2174.2 239
   001477         148100     GO TO STR-WRITE-GF-23-3.                                     NC2174.2 1482
   001478         148200 STR-FAIL-GF-23-3.                                                NC2174.2
   001479         148300     PERFORM FAIL                                                 NC2174.2 238
   001480         148400     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001481         148500     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001482         148600 STR-WRITE-GF-23-3.                                               NC2174.2
   001483         148700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001484         148800*                                                                 NC2174.2
   001485         148900 STR-INIT-GF-24.                                                  NC2174.2
   001486         149000*    ===-->  BOTH "OVERFLOW" PHRASES  <--===                      NC2174.2
   001487         149100     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   001488         149200     MOVE   "STR-TEST-GF-24" TO PAR-NAME.                         NC2174.2 87
   001489         149300     MOVE   "LIT DEL BY LIT" TO FEATURE.                          NC2174.2 83
   001490         149400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001491         149500     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001492         149600     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001493         149700*                                                                 NC2174.2
   001494         149800 STR-TEST-GF-24-1.                                                NC2174.2
   001495         149900     STRING "ABCDEF" DELIMITED BY "ABCDEFG"                       NC2174.2
   001496         150000             INTO ID7-XN-5 WITH POINTER ID8-DU-2V0                NC2174.2 60 43
   001497      1  150100             ON OVERFLOW PERFORM PASS                             NC2174.2 237
   001498      1  150200                         GO TO STR-WRITE-GF-24-1                  NC2174.2 1507
   001499      1  150300         NOT ON OVERFLOW GO TO STR-FAIL-GF-24-1.                  NC2174.2 1504
   001500         150400 STR-DELETE-GF-24.                                                NC2174.2
   001501         150500     PERFORM DE-LETE.                                             NC2174.2 239
   001502         150600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001503         150700     GO      TO STR-INIT-GF-25.                                   NC2174.2 1544
   001504         150800 STR-FAIL-GF-24-1.                                                NC2174.2
   001505         150900     PERFORM FAIL.                                                NC2174.2 238
   001506         151000     MOVE    "NOT ON OVERFLOW SHOULD NOT OCCUR" TO RE-MARK.       NC2174.2 92
   001507         151100 STR-WRITE-GF-24-1.                                               NC2174.2
   001508         151200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001509         151300*                                                                 NC2174.2
   001510         151400 STR-TEST-GF-24-2.                                                NC2174.2
   001511         151500     ADD     1 TO REC-CT.                                         NC2174.2 134
   001512         151600     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001513      1  151700             PERFORM PASS                                         NC2174.2 237
   001514      1  151800             GO TO STR-WRITE-GF-24-2                              NC2174.2 1524
   001515         151900     ELSE                                                         NC2174.2
   001516      1  152000             GO TO STR-FAIL-GF-24-2.                              NC2174.2 1520
   001517         152100 STR-DELETE-GF-24-2.                                              NC2174.2
   001518         152200     PERFORM DE-LETE.                                             NC2174.2 239
   001519         152300     GO TO STR-WRITE-GF-24-2.                                     NC2174.2 1524
   001520         152400 STR-FAIL-GF-24-2.                                                NC2174.2
   001521         152500     PERFORM FAIL                                                 NC2174.2 238
   001522         152600     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001523         152700     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001524         152800 STR-WRITE-GF-24-2.                                               NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    30
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001525         152900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001526         153000*                                                                 NC2174.2
   001527         153100 STR-TEST-GF-24-3.                                                NC2174.2
   001528         153200     ADD     1 TO REC-CT.                                         NC2174.2 134
   001529         153300     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001530      1  153400             PERFORM PASS                                         NC2174.2 237
   001531      1  153500             GO TO STR-WRITE-GF-24-3                              NC2174.2 1541
   001532         153600     ELSE                                                         NC2174.2
   001533      1  153700             GO TO STR-FAIL-GF-24-3.                              NC2174.2 1537
   001534         153800 STR-DELETE-GF-24-3.                                              NC2174.2
   001535         153900     PERFORM DE-LETE.                                             NC2174.2 239
   001536         154000     GO TO STR-WRITE-GF-24-3.                                     NC2174.2 1541
   001537         154100 STR-FAIL-GF-24-3.                                                NC2174.2
   001538         154200     PERFORM FAIL                                                 NC2174.2 238
   001539         154300     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001540         154400     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001541         154500 STR-WRITE-GF-24-3.                                               NC2174.2
   001542         154600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001543         154700*                                                                 NC2174.2
   001544         154800 STR-INIT-GF-25.                                                  NC2174.2
   001545         154900*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2174.2
   001546         155000     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   001547         155100     MOVE   "STR-TEST-GF-25" TO PAR-NAME.                         NC2174.2 87
   001548         155200     MOVE   "LITERAL SERIES" TO FEATURE.                          NC2174.2 83
   001549         155300     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001550         155400     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001551         155500     MOVE    ZERO TO REC-CT.                                      NC2174.2 IMP 134
   001552         155600*                                                                 NC2174.2
   001553         155700 STR-TEST-GF-25-1.                                                NC2174.2
   001554         155800     STRING "A" "B" "C" "D" "E" DELIMITED "ABCDE" INTO ID7-XN-5   NC2174.2 60
   001555         155900             POINTER ID8-DU-2V0                                   NC2174.2 43
   001556      1  156000             ON OVERFLOW GO TO STR-FAIL-GF-25-1                   NC2174.2 1563
   001557      1  156100         NOT ON OVERFLOW PERFORM PASS                             NC2174.2 237
   001558      1  156200                         GO TO STR-WRITE-GF-25-1.                 NC2174.2 1566
   001559         156300 STR-DELETE-GF-25-1.                                              NC2174.2
   001560         156400     PERFORM DE-LETE.                                             NC2174.2 239
   001561         156500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001562         156600     GO TO   STR-INIT-GF-26.                                      NC2174.2 1604
   001563         156700 STR-FAIL-GF-25-1.                                                NC2174.2
   001564         156800     PERFORM FAIL.                                                NC2174.2 238
   001565         156900     MOVE   "ON OVERFLOW SHOULD NOT HAVE EXECUTED" TO RE-MARK.    NC2174.2 92
   001566         157000 STR-WRITE-GF-25-1.                                               NC2174.2
   001567         157100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001568         157200*                                                                 NC2174.2
   001569         157300 STR-TEST-GF-25-2.                                                NC2174.2
   001570         157400     MOVE   "STR-TEST-GF-25-1" TO PAR-NAME.                       NC2174.2 87
   001571         157500     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001572         157600     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001573      1  157700             PERFORM PASS                                         NC2174.2 237
   001574      1  157800             GO TO STR-WRITE-GF-25-2                              NC2174.2 1584
   001575         157900     ELSE                                                         NC2174.2
   001576      1  158000             GO TO STR-FAIL-GF-25-2.                              NC2174.2 1580
   001577         158100 STR-DELETE-GF-25-2.                                              NC2174.2
   001578         158200     PERFORM DE-LETE.                                             NC2174.2 239
   001579         158300     GO TO STR-WRITE-GF-25-2.                                     NC2174.2 1584
   001580         158400 STR-FAIL-GF-25-2.                                                NC2174.2
   001581         158500     PERFORM FAIL                                                 NC2174.2 238
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    31
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001582         158600     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001583         158700     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001584         158800 STR-WRITE-GF-25-2.                                               NC2174.2
   001585         158900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001586         159000*                                                                 NC2174.2
   001587         159100 STR-TEST-GF-25-3.                                                NC2174.2
   001588         159200     ADD     1 TO REC-CT.                                         NC2174.2 134
   001589         159300     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001590      1  159400             PERFORM PASS                                         NC2174.2 237
   001591      1  159500             GO TO STR-WRITE-GF-25-3                              NC2174.2 1601
   001592         159600     ELSE                                                         NC2174.2
   001593      1  159700             GO TO STR-FAIL-GF-25-3.                              NC2174.2 1597
   001594         159800 STR-DELETE-GF-25-3.                                              NC2174.2
   001595         159900     PERFORM DE-LETE.                                             NC2174.2 239
   001596         160000     GO TO STR-WRITE-GF-25-3.                                     NC2174.2 1601
   001597         160100 STR-FAIL-GF-25-3.                                                NC2174.2
   001598         160200     PERFORM FAIL                                                 NC2174.2 238
   001599         160300     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001600         160400     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001601         160500 STR-WRITE-GF-25-3.                                               NC2174.2
   001602         160600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001603         160700*                                                                 NC2174.2
   001604         160800 STR-INIT-GF-26.                                                  NC2174.2
   001605         160900*    ===-->  EXPLICIT SCOPE TERMINATOR  <--===                    NC2174.2
   001606         161000     MOVE   "VI-132 6.24.4 GR11" TO ANSI-REFERENCE.               NC2174.2 143
   001607         161100     MOVE   "STR-TEST-GF-26" TO PAR-NAME.                         NC2174.2 87
   001608         161200     MOVE   "LIT DEL BY LIT" TO FEATURE.                          NC2174.2 83
   001609         161300     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001610         161400     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001611         161500     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001612         161600     MOVE    SPACE TO WRK-XN-00001-1.                             NC2174.2 IMP 40
   001613         161700     MOVE    SPACE TO WRK-XN-00001-2.                             NC2174.2 IMP 41
   001614         161800     MOVE    SPACE TO WRK-XN-00001-3.                             NC2174.2 IMP 42
   001615         161900*                                                                 NC2174.2
   001616         162000 STR-TEST-GF-26-0.                                                NC2174.2
   001617         162100     STRING "ABCDEF" DELIMITED BY "ABCDEFG"                       NC2174.2
   001618         162200             INTO ID7-XN-5 WITH POINTER ID8-DU-2V0                NC2174.2 60 43
   001619         162300             ON OVERFLOW                                          NC2174.2
   001620      1  162400             MOVE "A" TO WRK-XN-00001-1                           NC2174.2 40
   001621      1  162500             MOVE "B" TO WRK-XN-00001-2                           NC2174.2 41
   001622         162600         NOT ON OVERFLOW                                          NC2174.2
   001623      1  162700             MOVE "C" TO WRK-XN-00001-1                           NC2174.2 40
   001624      1  162800             MOVE "D" TO WRK-XN-00001-2                           NC2174.2 41
   001625         162900     END-STRING                                                   NC2174.2
   001626         163000     MOVE   "Z" TO WRK-XN-00001-3.                                NC2174.2 42
   001627         163100     GO TO   STR-TEST-GF-26-1.                                    NC2174.2 1633
   001628         163200 STR-DELETE-GF-26.                                                NC2174.2
   001629         163300     PERFORM DE-LETE.                                             NC2174.2 239
   001630         163400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001631         163500     GO      TO STR-INIT-GF-27.                                   NC2174.2 1721
   001632         163600*                                                                 NC2174.2
   001633         163700 STR-TEST-GF-26-1.                                                NC2174.2
   001634         163800     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001635      1  163900             PERFORM PASS                                         NC2174.2 237
   001636      1  164000             GO TO STR-WRITE-GF-26-1                              NC2174.2 1646
   001637         164100     ELSE                                                         NC2174.2
   001638      1  164200             GO TO STR-FAIL-GF-26-1.                              NC2174.2 1642
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    32
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001639         164300 STR-DELETE-GF-26-1.                                              NC2174.2
   001640         164400     PERFORM DE-LETE.                                             NC2174.2 239
   001641         164500     GO TO STR-WRITE-GF-26-1.                                     NC2174.2 1646
   001642         164600 STR-FAIL-GF-26-1.                                                NC2174.2
   001643         164700     PERFORM FAIL                                                 NC2174.2 238
   001644         164800     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001645         164900     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001646         165000 STR-WRITE-GF-26-1.                                               NC2174.2
   001647         165100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001648         165200*                                                                 NC2174.2
   001649         165300 STR-TEST-GF-26-2.                                                NC2174.2
   001650         165400     ADD     1 TO REC-CT.                                         NC2174.2 134
   001651         165500     MOVE   "STR-TEST-GF-26-2" TO PAR-NAME.                       NC2174.2 87
   001652         165600     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001653      1  165700             PERFORM PASS                                         NC2174.2 237
   001654      1  165800             GO TO STR-WRITE-GF-26-2                              NC2174.2 1664
   001655         165900     ELSE                                                         NC2174.2
   001656      1  166000             GO TO STR-FAIL-GF-26-2.                              NC2174.2 1660
   001657         166100 STR-DELETE-GF-26-2.                                              NC2174.2
   001658         166200     PERFORM DE-LETE.                                             NC2174.2 239
   001659         166300     GO TO STR-WRITE-GF-26-2.                                     NC2174.2 1664
   001660         166400 STR-FAIL-GF-26-2.                                                NC2174.2
   001661         166500     PERFORM FAIL                                                 NC2174.2 238
   001662         166600     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001663         166700     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001664         166800 STR-WRITE-GF-26-2.                                               NC2174.2
   001665         166900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001666         167000*                                                                 NC2174.2
   001667         167100 STR-TEST-GF-26-3.                                                NC2174.2
   001668         167200     ADD     1 TO REC-CT.                                         NC2174.2 134
   001669         167300     IF      WRK-XN-00001-1 = "A"                                 NC2174.2 40
   001670      1  167400             PERFORM PASS                                         NC2174.2 237
   001671      1  167500             GO TO STR-WRITE-GF-26-3                              NC2174.2 1682
   001672         167600     ELSE                                                         NC2174.2
   001673      1  167700             GO TO STR-FAIL-GF-26-3.                              NC2174.2 1677
   001674         167800 STR-DELETE-GF-26-3.                                              NC2174.2
   001675         167900     PERFORM DE-LETE.                                             NC2174.2 239
   001676         168000     GO TO STR-WRITE-GF-26-3.                                     NC2174.2 1682
   001677         168100 STR-FAIL-GF-26-3.                                                NC2174.2
   001678         168200     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2174.2 40 97
   001679         168300     MOVE   "A" TO CORRECT-X                                      NC2174.2 111
   001680         168400     MOVE   "ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK         NC2174.2 92
   001681         168500     PERFORM FAIL.                                                NC2174.2 238
   001682         168600 STR-WRITE-GF-26-3.                                               NC2174.2
   001683         168700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001684         168800*                                                                 NC2174.2
   001685         168900 STR-TEST-GF-26-4.                                                NC2174.2
   001686         169000     ADD     1 TO REC-CT.                                         NC2174.2 134
   001687         169100     IF      WRK-XN-00001-2 = "B"                                 NC2174.2 41
   001688      1  169200             PERFORM PASS                                         NC2174.2 237
   001689      1  169300             GO TO STR-WRITE-GF-26-4                              NC2174.2 1700
   001690         169400     ELSE                                                         NC2174.2
   001691      1  169500             GO TO STR-FAIL-GF-26-4.                              NC2174.2 1695
   001692         169600 STR-DELETE-GF-26-4.                                              NC2174.2
   001693         169700     PERFORM DE-LETE.                                             NC2174.2 239
   001694         169800     GO TO STR-WRITE-GF-26-4.                                     NC2174.2 1700
   001695         169900 STR-FAIL-GF-26-4.                                                NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    33
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001696         170000     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2174.2 41 97
   001697         170100     MOVE   "B" TO CORRECT-X                                      NC2174.2 111
   001698         170200     MOVE   "ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK         NC2174.2 92
   001699         170300     PERFORM FAIL.                                                NC2174.2 238
   001700         170400 STR-WRITE-GF-26-4.                                               NC2174.2
   001701         170500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001702         170600*                                                                 NC2174.2
   001703         170700 STR-TEST-GF-26-5.                                                NC2174.2
   001704         170800     ADD     1 TO REC-CT.                                         NC2174.2 134
   001705         170900     IF      WRK-XN-00001-3 = "Z"                                 NC2174.2 42
   001706      1  171000             PERFORM PASS                                         NC2174.2 237
   001707      1  171100             GO TO STR-WRITE-GF-26-5                              NC2174.2 1718
   001708         171200     ELSE                                                         NC2174.2
   001709      1  171300             GO TO STR-FAIL-GF-26-5.                              NC2174.2 1713
   001710         171400 STR-DELETE-GF-26-5.                                              NC2174.2
   001711         171500     PERFORM DE-LETE.                                             NC2174.2 239
   001712         171600     GO TO STR-WRITE-GF-26-5.                                     NC2174.2 1718
   001713         171700 STR-FAIL-GF-26-5.                                                NC2174.2
   001714         171800     MOVE    WRK-XN-00001-3 TO COMPUTED-X                         NC2174.2 42 97
   001715         171900     MOVE   "Z" TO CORRECT-X                                      NC2174.2 111
   001716         172000     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2174.2 92
   001717         172100     PERFORM FAIL.                                                NC2174.2 238
   001718         172200 STR-WRITE-GF-26-5.                                               NC2174.2
   001719         172300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001720         172400*                                                                 NC2174.2
   001721         172500 STR-INIT-GF-27.                                                  NC2174.2
   001722         172600*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2174.2
   001723         172700     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   001724         172800     MOVE   "STR-TEST-GF-27" TO PAR-NAME.                         NC2174.2 87
   001725         172900     MOVE   "LIT DEL BY LIT" TO FEATURE.                          NC2174.2 83
   001726         173000     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001727         173100     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001728         173200     MOVE    ZERO TO REC-CT.                                      NC2174.2 IMP 134
   001729         173300     MOVE    SPACE TO WRK-XN-00001-1.                             NC2174.2 IMP 40
   001730         173400     MOVE    SPACE TO WRK-XN-00001-2.                             NC2174.2 IMP 41
   001731         173500     MOVE    SPACE TO WRK-XN-00001-3.                             NC2174.2 IMP 42
   001732         173600*                                                                 NC2174.2
   001733         173700 STR-TEST-GF-27-0.                                                NC2174.2
   001734         173800     STRING "ABCDEF" DELIMITED BY "ABCDEFG"                       NC2174.2
   001735         173900             INTO ID7-XN-5 WITH POINTER ID8-DU-2V0                NC2174.2 60 43
   001736         174000             ON OVERFLOW                                          NC2174.2
   001737      1  174100             MOVE "A" TO WRK-XN-00001-1                           NC2174.2 40
   001738      1  174200             MOVE "B" TO WRK-XN-00001-2                           NC2174.2 41
   001739         174300     END-STRING                                                   NC2174.2
   001740         174400     MOVE   "Z" TO WRK-XN-00001-3.                                NC2174.2 42
   001741         174500     GO TO   STR-TEST-GF-27-1.                                    NC2174.2 1747
   001742         174600 STR-DELETE-GF-27.                                                NC2174.2
   001743         174700     PERFORM DE-LETE.                                             NC2174.2 239
   001744         174800     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001745         174900     GO TO   STR-INIT-GF-28.                                      NC2174.2 1835
   001746         175000*                                                                 NC2174.2
   001747         175100 STR-TEST-GF-27-1.                                                NC2174.2
   001748         175200     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001749         175300     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001750      1  175400             PERFORM PASS                                         NC2174.2 237
   001751      1  175500             GO TO STR-WRITE-GF-27-1                              NC2174.2 1761
   001752         175600     ELSE                                                         NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    34
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001753      1  175700             GO TO STR-FAIL-GF-27-1.                              NC2174.2 1757
   001754         175800 STR-DELETE-GF-27-1.                                              NC2174.2
   001755         175900     PERFORM DE-LETE.                                             NC2174.2 239
   001756         176000     GO TO STR-WRITE-GF-27-1.                                     NC2174.2 1761
   001757         176100 STR-FAIL-GF-27-1.                                                NC2174.2
   001758         176200     PERFORM FAIL                                                 NC2174.2 238
   001759         176300     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001760         176400     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001761         176500 STR-WRITE-GF-27-1.                                               NC2174.2
   001762         176600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001763         176700*                                                                 NC2174.2
   001764         176800 STR-TEST-GF-27-2.                                                NC2174.2
   001765         176900     ADD     1 TO REC-CT.                                         NC2174.2 134
   001766         177000     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001767      1  177100             PERFORM PASS                                         NC2174.2 237
   001768      1  177200             GO TO STR-WRITE-GF-27-2                              NC2174.2 1778
   001769         177300     ELSE                                                         NC2174.2
   001770      1  177400             GO TO STR-FAIL-GF-27-2.                              NC2174.2 1774
   001771         177500 STR-DELETE-GF-27-2.                                              NC2174.2
   001772         177600     PERFORM DE-LETE.                                             NC2174.2 239
   001773         177700     GO TO STR-WRITE-GF-27-2.                                     NC2174.2 1778
   001774         177800 STR-FAIL-GF-27-2.                                                NC2174.2
   001775         177900             PERFORM FAIL                                         NC2174.2 238
   001776         178000             MOVE    ID8-DU-2V0 TO COMPUTED-N                     NC2174.2 43 99
   001777         178100             MOVE    6 TO CORRECT-N.                              NC2174.2 113
   001778         178200 STR-WRITE-GF-27-2.                                               NC2174.2
   001779         178300             PERFORM PRINT-DETAIL.                                NC2174.2 241
   001780         178400*                                                                 NC2174.2
   001781         178500 STR-TEST-GF-27-3.                                                NC2174.2
   001782         178600     ADD     1 TO REC-CT.                                         NC2174.2 134
   001783         178700     IF      WRK-XN-00001-1 = "A"                                 NC2174.2 40
   001784      1  178800             PERFORM PASS                                         NC2174.2 237
   001785      1  178900             GO TO STR-WRITE-GF-27-3                              NC2174.2 1796
   001786         179000     ELSE                                                         NC2174.2
   001787      1  179100             GO TO STR-FAIL-GF-27-3.                              NC2174.2 1791
   001788         179200 STR-DELETE-GF-27-3.                                              NC2174.2
   001789         179300     PERFORM DE-LETE.                                             NC2174.2 239
   001790         179400     GO TO STR-WRITE-GF-27-3.                                     NC2174.2 1796
   001791         179500 STR-FAIL-GF-27-3.                                                NC2174.2
   001792         179600     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2174.2 40 97
   001793         179700     MOVE   "A"    TO CORRECT-X                                   NC2174.2 111
   001794         179800     MOVE   "ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK         NC2174.2 92
   001795         179900     PERFORM FAIL.                                                NC2174.2 238
   001796         180000 STR-WRITE-GF-27-3.                                               NC2174.2
   001797         180100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001798         180200*                                                                 NC2174.2
   001799         180300 STR-TEST-GF-27-4.                                                NC2174.2
   001800         180400     ADD     1 TO REC-CT.                                         NC2174.2 134
   001801         180500     IF      WRK-XN-00001-2 = "B"                                 NC2174.2 41
   001802      1  180600             PERFORM PASS                                         NC2174.2 237
   001803      1  180700             GO TO STR-WRITE-GF-27-4                              NC2174.2 1814
   001804         180800     ELSE                                                         NC2174.2
   001805      1  180900             GO TO STR-FAIL-GF-27-4.                              NC2174.2 1809
   001806         181000 STR-DELETE-GF-27-4.                                              NC2174.2
   001807         181100     PERFORM DE-LETE.                                             NC2174.2 239
   001808         181200     GO TO STR-WRITE-GF-27-4.                                     NC2174.2 1814
   001809         181300 STR-FAIL-GF-27-4.                                                NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    35
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001810         181400     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2174.2 41 97
   001811         181500     MOVE   "B" TO CORRECT-X                                      NC2174.2 111
   001812         181600     MOVE   "ON OVERFLOW SHOULD HAVE EXECUTED" TO RE-MARK         NC2174.2 92
   001813         181700     PERFORM FAIL.                                                NC2174.2 238
   001814         181800 STR-WRITE-GF-27-4.                                               NC2174.2
   001815         181900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001816         182000*                                                                 NC2174.2
   001817         182100 STR-TEST-GF-27-5.                                                NC2174.2
   001818         182200     ADD     1 TO REC-CT.                                         NC2174.2 134
   001819         182300     IF      WRK-XN-00001-3 = "Z"                                 NC2174.2 42
   001820      1  182400             PERFORM PASS                                         NC2174.2 237
   001821      1  182500             GO TO STR-WRITE-GF-27-5                              NC2174.2 1832
   001822         182600     ELSE                                                         NC2174.2
   001823      1  182700             GO TO STR-FAIL-GF-27-5.                              NC2174.2 1827
   001824         182800 STR-DELETE-GF-27-5.                                              NC2174.2
   001825         182900     PERFORM DE-LETE.                                             NC2174.2 239
   001826         183000     GO TO STR-WRITE-GF-27-5.                                     NC2174.2 1832
   001827         183100 STR-FAIL-GF-27-5.                                                NC2174.2
   001828         183200     MOVE    WRK-XN-00001-3 TO COMPUTED-X                         NC2174.2 42 97
   001829         183300     MOVE   "Z" TO CORRECT-X                                      NC2174.2 111
   001830         183400     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2174.2 92
   001831         183500     PERFORM FAIL.                                                NC2174.2 238
   001832         183600 STR-WRITE-GF-27-5.                                               NC2174.2
   001833         183700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001834         183800*                                                                 NC2174.2
   001835         183900 STR-INIT-GF-28.                                                  NC2174.2
   001836         184000*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2174.2
   001837         184100     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   001838         184200     MOVE   "STR-TEST-GF-28" TO PAR-NAME.                         NC2174.2 87
   001839         184300     MOVE   "LITERAL SERIES" TO FEATURE.                          NC2174.2 83
   001840         184400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001841         184500     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001842         184600     MOVE    ZERO TO REC-CT.                                      NC2174.2 IMP 134
   001843         184700     MOVE    SPACE TO WRK-XN-00001-1.                             NC2174.2 IMP 40
   001844         184800     MOVE    SPACE TO WRK-XN-00001-2.                             NC2174.2 IMP 41
   001845         184900     MOVE    SPACE TO WRK-XN-00001-3.                             NC2174.2 IMP 42
   001846         185000*                                                                 NC2174.2
   001847         185100 STR-TEST-GF-28-0.                                                NC2174.2
   001848         185200     STRING "A" "B" "C" "D" "E" DELIMITED "ABCDE" INTO ID7-XN-5   NC2174.2 60
   001849         185300             POINTER ID8-DU-2V0                                   NC2174.2 43
   001850         185400             ON OVERFLOW                                          NC2174.2
   001851      1  185500             MOVE "A" TO WRK-XN-00001-1                           NC2174.2 40
   001852      1  185600             MOVE "B" TO WRK-XN-00001-2                           NC2174.2 41
   001853         185700     END-STRING                                                   NC2174.2
   001854         185800     MOVE   "Z" TO WRK-XN-00001-3.                                NC2174.2 42
   001855         185900     GO TO   STR-TEST-GF-28-1.                                    NC2174.2 1861
   001856         186000 STR-DELETE-GF-28.                                                NC2174.2
   001857         186100     PERFORM DE-LETE.                                             NC2174.2 239
   001858         186200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001859         186300     GO TO   STR-INIT-GF-29.                                      NC2174.2 1949
   001860         186400*                                                                 NC2174.2
   001861         186500 STR-TEST-GF-28-1.                                                NC2174.2
   001862         186600     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001863         186700     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001864      1  186800             PERFORM PASS                                         NC2174.2 237
   001865      1  186900             GO TO STR-WRITE-GF-28-1                              NC2174.2 1875
   001866         187000     ELSE                                                         NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    36
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001867      1  187100             GO TO STR-FAIL-GF-28-1.                              NC2174.2 1871
   001868         187200 STR-DELETE-GF-28-1.                                              NC2174.2
   001869         187300     PERFORM DE-LETE.                                             NC2174.2 239
   001870         187400     GO TO STR-WRITE-GF-28-1.                                     NC2174.2 1875
   001871         187500 STR-FAIL-GF-28-1.                                                NC2174.2
   001872         187600     PERFORM FAIL                                                 NC2174.2 238
   001873         187700     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001874         187800     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001875         187900 STR-WRITE-GF-28-1.                                               NC2174.2
   001876         188000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001877         188100*                                                                 NC2174.2
   001878         188200 STR-TEST-GF-28-2.                                                NC2174.2
   001879         188300     ADD     1 TO REC-CT.                                         NC2174.2 134
   001880         188400     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001881      1  188500             PERFORM PASS                                         NC2174.2 237
   001882      1  188600             GO TO STR-WRITE-GF-28-2                              NC2174.2 1892
   001883         188700     ELSE                                                         NC2174.2
   001884      1  188800             GO TO STR-FAIL-GF-28-2.                              NC2174.2 1888
   001885         188900 STR-DELETE-GF-28-2.                                              NC2174.2
   001886         189000     PERFORM DE-LETE.                                             NC2174.2 239
   001887         189100     GO TO STR-WRITE-GF-28-2.                                     NC2174.2 1892
   001888         189200 STR-FAIL-GF-28-2.                                                NC2174.2
   001889         189300     PERFORM FAIL                                                 NC2174.2 238
   001890         189400     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   001891         189500     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   001892         189600 STR-WRITE-GF-28-2.                                               NC2174.2
   001893         189700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001894         189800*                                                                 NC2174.2
   001895         189900 STR-TEST-GF-28-3.                                                NC2174.2
   001896         190000     ADD     1 TO REC-CT.                                         NC2174.2 134
   001897         190100     IF      WRK-XN-00001-1 = SPACE                               NC2174.2 40 IMP
   001898      1  190200             PERFORM PASS                                         NC2174.2 237
   001899      1  190300             GO TO STR-WRITE-GF-28-3                              NC2174.2 1910
   001900         190400     ELSE                                                         NC2174.2
   001901      1  190500             GO TO STR-FAIL-GF-28-3.                              NC2174.2 1905
   001902         190600 STR-DELETE-GF-28-3.                                              NC2174.2
   001903         190700     PERFORM DE-LETE.                                             NC2174.2 239
   001904         190800     GO TO STR-WRITE-GF-28-3.                                     NC2174.2 1910
   001905         190900 STR-FAIL-GF-28-3.                                                NC2174.2
   001906         191000     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2174.2 40 97
   001907         191100     MOVE    SPACE TO CORRECT-X                                   NC2174.2 IMP 111
   001908         191200     MOVE   "ON OVERFLOW SHOULD NOT HAVE EXECUTED" TO RE-MARK     NC2174.2 92
   001909         191300     PERFORM FAIL.                                                NC2174.2 238
   001910         191400 STR-WRITE-GF-28-3.                                               NC2174.2
   001911         191500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001912         191600*                                                                 NC2174.2
   001913         191700 STR-TEST-GF-28-4.                                                NC2174.2
   001914         191800     ADD     1 TO REC-CT.                                         NC2174.2 134
   001915         191900     IF      WRK-XN-00001-2 =  SPACE                              NC2174.2 41 IMP
   001916      1  192000             PERFORM PASS                                         NC2174.2 237
   001917      1  192100             GO TO STR-WRITE-GF-28-4                              NC2174.2 1928
   001918         192200     ELSE                                                         NC2174.2
   001919      1  192300             GO TO STR-FAIL-GF-28-4.                              NC2174.2 1923
   001920         192400 STR-DELETE-GF-28-4.                                              NC2174.2
   001921         192500     PERFORM DE-LETE.                                             NC2174.2 239
   001922         192600     GO TO STR-WRITE-GF-28-4.                                     NC2174.2 1928
   001923         192700 STR-FAIL-GF-28-4.                                                NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    37
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001924         192800     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2174.2 41 97
   001925         192900     MOVE    SPACE TO CORRECT-X                                   NC2174.2 IMP 111
   001926         193000     MOVE   "ON OVERFLOW SHOULD NOT HAVE EXECUTED" TO RE-MARK     NC2174.2 92
   001927         193100     PERFORM FAIL.                                                NC2174.2 238
   001928         193200 STR-WRITE-GF-28-4.                                               NC2174.2
   001929         193300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001930         193400*                                                                 NC2174.2
   001931         193500 STR-TEST-GF-28-5.                                                NC2174.2
   001932         193600     ADD     1 TO REC-CT.                                         NC2174.2 134
   001933         193700     IF      WRK-XN-00001-3 = "Z"                                 NC2174.2 42
   001934      1  193800             PERFORM PASS                                         NC2174.2 237
   001935      1  193900             GO TO STR-WRITE-GF-28-5                              NC2174.2 1946
   001936         194000     ELSE                                                         NC2174.2
   001937      1  194100             GO TO STR-FAIL-GF-28-5.                              NC2174.2 1941
   001938         194200 STR-DELETE-GF-28-5.                                              NC2174.2
   001939         194300     PERFORM DE-LETE.                                             NC2174.2 239
   001940         194400     GO TO STR-WRITE-GF-28-5.                                     NC2174.2 1946
   001941         194500 STR-FAIL-GF-28-5.                                                NC2174.2
   001942         194600     MOVE    WRK-XN-00001-3 TO COMPUTED-X                         NC2174.2 42 97
   001943         194700     MOVE   "Z" TO CORRECT-X                                      NC2174.2 111
   001944         194800     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2174.2 92
   001945         194900     PERFORM FAIL.                                                NC2174.2 238
   001946         195000 STR-WRITE-GF-28-5.                                               NC2174.2
   001947         195100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001948         195200*                                                                 NC2174.2
   001949         195300 STR-INIT-GF-29.                                                  NC2174.2
   001950         195400*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2174.2
   001951         195500     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   001952         195600     MOVE   "STR-TEST-GF-29" TO PAR-NAME.                         NC2174.2 87
   001953         195700     MOVE   "LIT DEL BY LIT" TO FEATURE.                          NC2174.2 83
   001954         195800     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   001955         195900     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   001956         196000     MOVE    ZERO TO REC-CT.                                      NC2174.2 IMP 134
   001957         196100     MOVE    SPACE TO WRK-XN-00001-1.                             NC2174.2 IMP 40
   001958         196200     MOVE    SPACE TO WRK-XN-00001-2.                             NC2174.2 IMP 41
   001959         196300     MOVE    SPACE TO WRK-XN-00001-3.                             NC2174.2 IMP 42
   001960         196400*                                                                 NC2174.2
   001961         196500 STR-TEST-GF-29.                                                  NC2174.2
   001962         196600     STRING "ABCDEF" DELIMITED BY "ABCDEFG"                       NC2174.2
   001963         196700             INTO ID7-XN-5 WITH POINTER ID8-DU-2V0                NC2174.2 60 43
   001964         196800         NOT ON OVERFLOW                                          NC2174.2
   001965      1  196900             MOVE "A" TO WRK-XN-00001-1                           NC2174.2 40
   001966      1  197000             MOVE "B" TO WRK-XN-00001-2                           NC2174.2 41
   001967         197100     END-STRING                                                   NC2174.2
   001968         197200     MOVE   "Z" TO WRK-XN-00001-3.                                NC2174.2 42
   001969         197300     GO TO   STR-TEST-GF-29-1.                                    NC2174.2 1975
   001970         197400 STR-DELETE-GF-29.                                                NC2174.2
   001971         197500     PERFORM DE-LETE.                                             NC2174.2 239
   001972         197600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001973         197700     GO TO   STR-INIT-GF-30.                                      NC2174.2 2065
   001974         197800*                                                                 NC2174.2
   001975         197900 STR-TEST-GF-29-1.                                                NC2174.2
   001976         198000     MOVE    1 TO REC-CT.                                         NC2174.2 134
   001977         198100     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   001978      1  198200             PERFORM PASS                                         NC2174.2 237
   001979      1  198300             GO TO STR-WRITE-GF-29-1                              NC2174.2 1989
   001980         198400     ELSE                                                         NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    38
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  001981      1  198500             GO TO STR-FAIL-GF-29-1.                              NC2174.2 1985
   001982         198600 STR-DELETE-GF-29-1.                                              NC2174.2
   001983         198700     PERFORM DE-LETE.                                             NC2174.2 239
   001984         198800     GO TO STR-WRITE-GF-29-1.                                     NC2174.2 1989
   001985         198900 STR-FAIL-GF-29-1.                                                NC2174.2
   001986         199000     PERFORM FAIL                                                 NC2174.2 238
   001987         199100     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   001988         199200     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   001989         199300 STR-WRITE-GF-29-1.                                               NC2174.2
   001990         199400     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   001991         199500*                                                                 NC2174.2
   001992         199600 STR-TEST-GF-29-2.                                                NC2174.2
   001993         199700     ADD     1 TO REC-CT.                                         NC2174.2 134
   001994         199800     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   001995      1  199900             PERFORM PASS                                         NC2174.2 237
   001996      1  200000             GO TO STR-WRITE-GF-29-2                              NC2174.2 2006
   001997         200100     ELSE                                                         NC2174.2
   001998      1  200200             GO TO STR-FAIL-GF-29-2.                              NC2174.2 2002
   001999         200300 STR-DELETE-GF-29-2.                                              NC2174.2
   002000         200400     PERFORM DE-LETE.                                             NC2174.2 239
   002001         200500     GO TO STR-WRITE-GF-29-2.                                     NC2174.2 2006
   002002         200600 STR-FAIL-GF-29-2.                                                NC2174.2
   002003         200700     PERFORM FAIL                                                 NC2174.2 238
   002004         200800     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   002005         200900     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   002006         201000 STR-WRITE-GF-29-2.                                               NC2174.2
   002007         201100     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002008         201200*                                                                 NC2174.2
   002009         201300 STR-TEST-GF-29-3.                                                NC2174.2
   002010         201400     ADD     1 TO REC-CT.                                         NC2174.2 134
   002011         201500     IF      WRK-XN-00001-1 = SPACE                               NC2174.2 40 IMP
   002012      1  201600             PERFORM PASS                                         NC2174.2 237
   002013      1  201700             GO TO STR-WRITE-GF-29-3                              NC2174.2 2025
   002014         201800     ELSE                                                         NC2174.2
   002015      1  201900             GO TO STR-FAIL-GF-29-3.                              NC2174.2 2019
   002016         202000 STR-DELETE-GF-29-3.                                              NC2174.2
   002017         202100     PERFORM DE-LETE.                                             NC2174.2 239
   002018         202200     GO TO STR-WRITE-GF-29-3.                                     NC2174.2 2025
   002019         202300 STR-FAIL-GF-29-3.                                                NC2174.2
   002020         202400     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2174.2 40 97
   002021         202500     MOVE    SPACE TO CORRECT-X                                   NC2174.2 IMP 111
   002022         202600     MOVE   "NOT ON OVERFLOW SHOULD NOT HAVE EXECUTED"            NC2174.2
   002023         202700          TO RE-MARK                                              NC2174.2 92
   002024         202800     PERFORM FAIL.                                                NC2174.2 238
   002025         202900 STR-WRITE-GF-29-3.                                               NC2174.2
   002026         203000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002027         203100*                                                                 NC2174.2
   002028         203200 STR-TEST-GF-29-4.                                                NC2174.2
   002029         203300     ADD     1 TO REC-CT.                                         NC2174.2 134
   002030         203400     IF      WRK-XN-00001-2 = SPACE                               NC2174.2 41 IMP
   002031      1  203500             PERFORM PASS                                         NC2174.2 237
   002032      1  203600             GO TO STR-WRITE-GF-29-4                              NC2174.2 2044
   002033         203700     ELSE                                                         NC2174.2
   002034      1  203800             GO TO STR-FAIL-GF-29-4.                              NC2174.2 2038
   002035         203900 STR-DELETE-GF-29-4.                                              NC2174.2
   002036         204000     PERFORM DE-LETE.                                             NC2174.2 239
   002037         204100     GO TO STR-WRITE-GF-29-4.                                     NC2174.2 2044
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    39
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002038         204200 STR-FAIL-GF-29-4.                                                NC2174.2
   002039         204300     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2174.2 41 97
   002040         204400     MOVE    SPACE TO CORRECT-X                                   NC2174.2 IMP 111
   002041         204500     MOVE   "NOT ON OVERFLOW SHOULD NOT HAVE EXECUTED"            NC2174.2
   002042         204600          TO RE-MARK                                              NC2174.2 92
   002043         204700     PERFORM FAIL.                                                NC2174.2 238
   002044         204800 STR-WRITE-GF-29-4.                                               NC2174.2
   002045         204900     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002046         205000*                                                                 NC2174.2
   002047         205100 STR-TEST-GF-29-5.                                                NC2174.2
   002048         205200     ADD     1 TO REC-CT.                                         NC2174.2 134
   002049         205300     IF      WRK-XN-00001-3 = "Z"                                 NC2174.2 42
   002050      1  205400             PERFORM PASS                                         NC2174.2 237
   002051      1  205500             GO TO STR-WRITE-GF-29-5                              NC2174.2 2062
   002052         205600     ELSE                                                         NC2174.2
   002053      1  205700             GO TO STR-FAIL-GF-29-5.                              NC2174.2 2057
   002054         205800 STR-DELETE-GF-29-5.                                              NC2174.2
   002055         205900     PERFORM DE-LETE.                                             NC2174.2 239
   002056         206000     GO TO STR-WRITE-GF-29-5.                                     NC2174.2 2062
   002057         206100 STR-FAIL-GF-29-5.                                                NC2174.2
   002058         206200     MOVE    WRK-XN-00001-3 TO COMPUTED-X                         NC2174.2 42 97
   002059         206300     MOVE   "Z" TO CORRECT-X                                      NC2174.2 111
   002060         206400     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2174.2 92
   002061         206500     PERFORM FAIL.                                                NC2174.2 238
   002062         206600 STR-WRITE-GF-29-5.                                               NC2174.2
   002063         206700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002064         206800*                                                                 NC2174.2
   002065         206900 STR-INIT-GF-30.                                                  NC2174.2
   002066         207000*    ===--> "NOT ON OVERFLOW" PHRASE  <--===                      NC2174.2
   002067         207100     MOVE   "VI-132 6.24.4 GR9, 10" TO ANSI-REFERENCE.            NC2174.2 143
   002068         207200     MOVE   "STR-TEST-GF-30" TO PAR-NAME.                         NC2174.2 87
   002069         207300     MOVE   "LITERAL SERIES" TO FEATURE.                          NC2174.2 83
   002070         207400     MOVE    "*****" TO ID7-XN-5.                                 NC2174.2 60
   002071         207500     MOVE    1 TO ID8-DU-2V0.                                     NC2174.2 43
   002072         207600     MOVE    ZERO TO REC-CT.                                      NC2174.2 IMP 134
   002073         207700     MOVE    SPACE TO WRK-XN-00001-1.                             NC2174.2 IMP 40
   002074         207800     MOVE    SPACE TO WRK-XN-00001-2.                             NC2174.2 IMP 41
   002075         207900     MOVE    SPACE TO WRK-XN-00001-3.                             NC2174.2 IMP 42
   002076         208000*                                                                 NC2174.2
   002077         208100 STR-TEST-GF-30.                                                  NC2174.2
   002078         208200     STRING "A" "B" "C" "D" "E" DELIMITED "ABCDE" INTO ID7-XN-5   NC2174.2 60
   002079         208300             POINTER ID8-DU-2V0                                   NC2174.2 43
   002080         208400         NOT ON OVERFLOW                                          NC2174.2
   002081      1  208500             MOVE "A" TO WRK-XN-00001-1                           NC2174.2 40
   002082      1  208600             MOVE "B" TO WRK-XN-00001-2                           NC2174.2 41
   002083         208700     END-STRING                                                   NC2174.2
   002084         208800     MOVE   "Z" TO WRK-XN-00001-3.                                NC2174.2 42
   002085         208900     GO TO   STR-TEST-GF-30-1.                                    NC2174.2 2091
   002086         209000 STR-DELETE-GF-30.                                                NC2174.2
   002087         209100     PERFORM DE-LETE.                                             NC2174.2 239
   002088         209200     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002089         209300     GO TO   CCVS-EXIT.                                           NC2174.2 2181
   002090         209400*                                                                 NC2174.2
   002091         209500 STR-TEST-GF-30-1.                                                NC2174.2
   002092         209600     MOVE    1 TO REC-CT.                                         NC2174.2 134
   002093         209700     IF      ID7-XN-5 = "ABCDE"                                   NC2174.2 60
   002094      1  209800             PERFORM PASS                                         NC2174.2 237
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    40
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002095      1  209900             GO TO STR-WRITE-GF-30-1                              NC2174.2 2105
   002096         210000     ELSE                                                         NC2174.2
   002097      1  210100             GO TO STR-FAIL-GF-30-1.                              NC2174.2 2101
   002098         210200 STR-DELETE-GF-30-1.                                              NC2174.2
   002099         210300     PERFORM DE-LETE.                                             NC2174.2 239
   002100         210400     GO TO STR-WRITE-GF-30-1.                                     NC2174.2 2105
   002101         210500 STR-FAIL-GF-30-1.                                                NC2174.2
   002102         210600     PERFORM FAIL                                                 NC2174.2 238
   002103         210700     MOVE    ID7-XN-5 TO COMPUTED-A                               NC2174.2 60 98
   002104         210800     MOVE   "ABCDE" TO CORRECT-A.                                 NC2174.2 112
   002105         210900 STR-WRITE-GF-30-1.                                               NC2174.2
   002106         211000     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002107         211100*                                                                 NC2174.2
   002108         211200 STR-TEST-GF-30-2.                                                NC2174.2
   002109         211300     ADD     1 TO REC-CT.                                         NC2174.2 134
   002110         211400     IF      ID8-DU-2V0 = 6                                       NC2174.2 43
   002111      1  211500             PERFORM PASS                                         NC2174.2 237
   002112      1  211600             GO TO STR-WRITE-GF-30-2                              NC2174.2 2122
   002113         211700     ELSE                                                         NC2174.2
   002114      1  211800             GO TO STR-FAIL-GF-30-2.                              NC2174.2 2118
   002115         211900 STR-DELETE-GF-30-2.                                              NC2174.2
   002116         212000     PERFORM DE-LETE.                                             NC2174.2 239
   002117         212100     GO TO STR-WRITE-GF-30-2.                                     NC2174.2 2122
   002118         212200 STR-FAIL-GF-30-2.                                                NC2174.2
   002119         212300     PERFORM FAIL                                                 NC2174.2 238
   002120         212400     MOVE    ID8-DU-2V0 TO COMPUTED-N                             NC2174.2 43 99
   002121         212500     MOVE    6 TO CORRECT-N.                                      NC2174.2 113
   002122         212600 STR-WRITE-GF-30-2.                                               NC2174.2
   002123         212700     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002124         212800*                                                                 NC2174.2
   002125         212900 STR-TEST-GF-30-3.                                                NC2174.2
   002126         213000     ADD     1 TO REC-CT.                                         NC2174.2 134
   002127         213100     IF      WRK-XN-00001-1 = "A"                                 NC2174.2 40
   002128      1  213200             PERFORM PASS                                         NC2174.2 237
   002129      1  213300             GO TO STR-WRITE-GF-30-3                              NC2174.2 2141
   002130         213400     ELSE                                                         NC2174.2
   002131      1  213500             GO TO STR-FAIL-GF-30-3.                              NC2174.2 2135
   002132         213600 STR-DELETE-GF-30-3.                                              NC2174.2
   002133         213700     PERFORM DE-LETE.                                             NC2174.2 239
   002134         213800     GO TO STR-WRITE-GF-30-3.                                     NC2174.2 2141
   002135         213900 STR-FAIL-GF-30-3.                                                NC2174.2
   002136         214000     MOVE    WRK-XN-00001-1 TO COMPUTED-X                         NC2174.2 40 97
   002137         214100     MOVE   "A"    TO CORRECT-X                                   NC2174.2 111
   002138         214200     MOVE   "NOT ON OVERFLOW SHOULD HAVE EXECUTED"                NC2174.2
   002139         214300          TO RE-MARK                                              NC2174.2 92
   002140         214400     PERFORM FAIL.                                                NC2174.2 238
   002141         214500 STR-WRITE-GF-30-3.                                               NC2174.2
   002142         214600     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002143         214700*                                                                 NC2174.2
   002144         214800 STR-TEST-GF-30-4.                                                NC2174.2
   002145         214900     ADD     1 TO REC-CT.                                         NC2174.2 134
   002146         215000     IF      WRK-XN-00001-2 =  "B"                                NC2174.2 41
   002147      1  215100             PERFORM PASS                                         NC2174.2 237
   002148      1  215200             GO TO STR-WRITE-GF-30-4                              NC2174.2 2160
   002149         215300     ELSE                                                         NC2174.2
   002150      1  215400             GO TO STR-FAIL-GF-30-4.                              NC2174.2 2154
   002151         215500 STR-DELETE-GF-30-4.                                              NC2174.2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    41
   LineID  PL SL  ----+-*A-1-B--+----2----+----3----+----4----+----5----+----6----+----7-|--+----8 Map and Cross Reference
0  002152         215600     PERFORM DE-LETE.                                             NC2174.2 239
   002153         215700     GO TO STR-WRITE-GF-30-4.                                     NC2174.2 2160
   002154         215800 STR-FAIL-GF-30-4.                                                NC2174.2
   002155         215900     MOVE    WRK-XN-00001-2 TO COMPUTED-X                         NC2174.2 41 97
   002156         216000     MOVE   "B"    TO CORRECT-X                                   NC2174.2 111
   002157         216100     MOVE   "NOT ON OVERFLOW SHOULD HAVE EXECUTED"                NC2174.2
   002158         216200          TO RE-MARK                                              NC2174.2 92
   002159         216300     PERFORM FAIL.                                                NC2174.2 238
   002160         216400 STR-WRITE-GF-30-4.                                               NC2174.2
   002161         216500     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002162         216600*                                                                 NC2174.2
   002163         216700 STR-TEST-GF-30-5.                                                NC2174.2
   002164         216800     ADD     1 TO REC-CT.                                         NC2174.2 134
   002165         216900     IF      WRK-XN-00001-3 = "Z"                                 NC2174.2 42
   002166      1  217000             PERFORM PASS                                         NC2174.2 237
   002167      1  217100             GO TO STR-WRITE-GF-30-5                              NC2174.2 2178
   002168         217200     ELSE                                                         NC2174.2
   002169      1  217300             GO TO STR-FAIL-GF-30-5.                              NC2174.2 2173
   002170         217400 STR-DELETE-GF-30-5.                                              NC2174.2
   002171         217500     PERFORM DE-LETE.                                             NC2174.2 239
   002172         217600     GO TO STR-WRITE-GF-30-5.                                     NC2174.2 2178
   002173         217700 STR-FAIL-GF-30-5.                                                NC2174.2
   002174         217800     MOVE    WRK-XN-00001-3 TO COMPUTED-X                         NC2174.2 42 97
   002175         217900     MOVE   "Z" TO CORRECT-X                                      NC2174.2 111
   002176         218000     MOVE   "SCOPE TERMINATOR IGNORED" TO RE-MARK                 NC2174.2 92
   002177         218100     PERFORM FAIL.                                                NC2174.2 238
   002178         218200 STR-WRITE-GF-30-5.                                               NC2174.2
   002179         218300     PERFORM PRINT-DETAIL.                                        NC2174.2 241
   002180         218400*                                                                 NC2174.2
   002181         218500 CCVS-EXIT SECTION.                                               NC2174.2
   002182         218600 CCVS-999999.                                                     NC2174.2
   002183         218700     GO TO CLOSE-FILES.                                           NC2174.2 230
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    42
0An "M" preceding a data-name reference indicates that the data-name is modified by this reference.

  Defined   Cross-reference of data names   References

       57   A-XN-1
       59   AB-XN-2. . . . . . . . . . . .  973 973 973 974 974
       71   ABCDEFG-XN-7 . . . . . . . . .  458 554 925 925
       74   ANS-XN-37. . . . . . . . . . .  M1258 1283 1294
       62   ANS-XN-5-1 . . . . . . . . . .  726 737
       65   ANS-XN-5-2 . . . . . . . . . .  784 795
      143   ANSI-REFERENCE . . . . . . . .  315 322 331 M339 M388 M450 M501 M544 M605 M645 M702 M760 M818 M868 M919 M944
                                            M968 M992 M1045 M1098 M1150 M1203 M1255 M1318 M1369 M1428 M1487 M1546 M1606 M1723
                                            M1837 M1951 M2067
       61   ASTER-XN-5 . . . . . . . . . .  M547 571
       58   B-XN-1 . . . . . . . . . . . .  973 974
      122   CCVS-C-1 . . . . . . . . . . .  259 301
      127   CCVS-C-2 . . . . . . . . . . .  260 302
      177   CCVS-E-1 . . . . . . . . . . .  265
      182   CCVS-E-2 . . . . . . . . . . .  274 281 288 293
      185   CCVS-E-2-2 . . . . . . . . . .  M273
      190   CCVS-E-3 . . . . . . . . . . .  294
      199   CCVS-E-4 . . . . . . . . . . .  273
      200   CCVS-E-4-1 . . . . . . . . . .  M271
      202   CCVS-E-4-2 . . . . . . . . . .  M272
      144   CCVS-H-1 . . . . . . . . . . .  254
      149   CCVS-H-2A. . . . . . . . . . .  255
      158   CCVS-H-2B. . . . . . . . . . .  256
      170   CCVS-H-3 . . . . . . . . . . .  257
      220   CCVS-PGM-ID. . . . . . . . . .  226 226
      104   CM-18V0
       98   COMPUTED-A . . . . . . . . . .  99 101 102 103 104 327 330 M364 M426 M477 M528 M581 M638 M678 M736 M794 M844
                                            M895 M937 M961 M985 M1021 M1074 M1126 M1179 M1231 M1293 M1345 M1404 M1463 M1522
                                            M1582 M1644 M1759 M1873 M1987 M2103
       99   COMPUTED-N . . . . . . . . . .  M381 M443 M494 M538 M598 M695 M753 M811 M861 M912 M1038 M1091 M1143 M1196 M1248
                                            M1310 M1362 M1421 M1480 M1539 M1599 M1662 M1776 M1890 M2004 M2120
       97   COMPUTED-X . . . . . . . . . .  M249 313 M1678 M1696 M1714 M1792 M1810 M1828 M1906 M1924 M1942 M2020 M2039 M2058
                                            M2136 M2155 M2174
      101   COMPUTED-0V18
      103   COMPUTED-14V4
      105   COMPUTED-18V0
      102   COMPUTED-4V14
      121   COR-ANSI-REFERENCE . . . . . .  M322 M324
      112   CORRECT-A. . . . . . . . . . .  113 114 115 116 117 328 330 M365 M427 M478 M529 M582 M639 M679 M737 M795 M845
                                            M896 M938 M962 M986 M1022 M1075 M1127 M1180 M1232 M1294 M1346 M1405 M1464 M1523
                                            M1583 M1645 M1760 M1874 M1988 M2104
      113   CORRECT-N. . . . . . . . . . .  M382 M444 M495 M539 M599 M696 M754 M812 M862 M913 M1039 M1092 M1144 M1197 M1249
                                            M1311 M1363 M1422 M1481 M1540 M1600 M1663 M1777 M1891 M2005 M2121
      111   CORRECT-X. . . . . . . . . . .  M250 314 M1679 M1697 M1715 M1793 M1811 M1829 M1907 M1925 M1943 M2021 M2040 M2059
                                            M2137 M2156 M2175
      114   CORRECT-0V18
      116   CORRECT-14V4
      118   CORRECT-18V0
      115   CORRECT-4V14
      117   CR-18V0
      135   DELETE-COUNTER . . . . . . . .  M239 268 284 286
       68   DELIM-TABLE-XN-5 . . . . . . .  69
       69   DELIM-XN-X-1
       90   DOTVALUE . . . . . . . . . . .  M244
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    43
0 Defined   Cross-reference of data names   References

0     141   DUMMY-HOLD . . . . . . . . . .  M298 304
       38   DUMMY-RECORD . . . . . . . . .  M254 M255 M256 M257 M259 M260 M261 M263 M265 M274 M281 M288 M293 M294 298 M299
                                            300 M301 M302 M303 M304 308 M309 M317 M332
      188   ENDER-DESC . . . . . . . . . .  M276 M287 M292
      136   ERROR-COUNTER. . . . . . . . .  M238 267 277 280
      140   ERROR-HOLD . . . . . . . . . .  M267 M268 M268 M269 272
      186   ERROR-TOTAL. . . . . . . . . .  M278 M280 M285 M286 M290 M291
       83   FEATURE. . . . . . . . . . . .  M341 M389 M451 M502 M545 M606 M646 M703 M761 M819 M869 M920 M945 M969 M993 M1046
                                            M1099 M1151 M1204 M1256 M1320 M1371 M1430 M1489 M1548 M1608 M1725 M1839 M1953
                                            M2069
      214   HYPHEN-LINE. . . . . . . . . .  261 263 303
      180   ID-AGAIN . . . . . . . . . . .  M226
       46   ID1-DS-LS-4. . . . . . . . . .  M995 1001 1002 M1048 1054 1055 M1152 1159 1160
       47   ID1-DS-TS-4. . . . . . . . . .  M1102 1106 1107 M1207 1211 1212
       50   ID1-XN-X-25
       48   ID1-XN-25. . . . . . . . . . .  50
       51   ID1-1
       52   ID1-2
       53   ID1-3
       54   ID1-4
       55   ID1-5
       70   ID3-XN-1 . . . . . . . . . . .  458
       72   ID7-XN-15. . . . . . . . . . .  M922 M926 927 937
       60   ID7-XN-5 . . . . . . . . . . .  M342 M346 354 364 M390 M395 416 426 M452 M459 467 477 M503 523 528 M546 M554
                                            571 581 M607 M613 628 638 M647 M652 668 678 M704 M709 726 736 M762 M767 784 794
                                            M820 M826 834 844 M870 M876 885 895 M946 M950 951 961 M970 M974 975 985 M994
                                            M1003 1011 1021 M1047 M1055 1064 1074 M1100 M1108 1116 1126 M1153 M1161 1169
                                            1179 M1205 M1212 1221 1231 M1321 M1372 M1378 1394 1404 M1431 M1436 1453 1463
                                            M1490 M1496 1512 1522 M1549 M1554 1572 1582 M1609 M1618 1634 1644 M1726 M1735
                                            1749 1759 M1840 M1848 1863 1873 M1954 M1963 1977 1987 M2070 M2078 2093 2103
       43   ID8-DU-2V0 . . . . . . . . . .  M343 M347 371 381 M391 M395 433 443 M453 M459 484 494 M504 533 538 M550 M555
                                            588 598 M608 M648 M653 685 695 M705 M710 743 753 M763 M768 801 811 M821 M826
                                            851 861 M871 M877 902 912 M997 M1003 1028 1038 M1050 M1056 1081 1091 M1101 M1108
                                            1133 1143 M1155 M1161 1186 1196 M1206 M1213 1238 1248 M1322 M1327 1352 1362 M1373
                                            M1378 1411 1421 M1432 M1437 1470 1480 M1491 M1496 1529 1539 M1550 M1555 1589
                                            1599 M1610 M1618 1652 1662 M1727 M1735 1766 1776 M1841 M1849 1880 1890 M1955
                                            M1963 1994 2004 M2071 M2079 2110 2120
      213   INF-ANSI-REFERENCE . . . . . .  M315 M318 M331 M333
      208   INFO-TEXT. . . . . . . . . . .  M316
      137   INSPECT-COUNTER. . . . . . . .  M236 267 289 291
       44   ISUB-DU-2V0. . . . . . . . . .  M454 458
       45   MY-BOSS-DU-2V0 . . . . . . . .  M1259 M1266 1300 1310
       85   P-OR-F . . . . . . . . . . . .  M236 M237 M238 M239 246 M249 M506
       87   PAR-NAME . . . . . . . . . . .  M251 M340 M387 M449 M500 M543 M604 M644 M701 M759 M817 M867 M918 M943 M967 M991
                                            M1044 M1097 M1149 M1202 M1254 M1281 M1319 M1370 M1429 M1488 M1547 M1570 M1607
                                            M1651 M1724 M1838 M1952 M2068
       89   PARDOT-X . . . . . . . . . . .  M243
      138   PASS-COUNTER . . . . . . . . .  M237 269 271
       36   PRINT-FILE . . . . . . . . . .  32 225 231
       37   PRINT-REC. . . . . . . . . . .  M245 M321 M323
       92   RE-MARK. . . . . . . . . . . .  M240 M252 M410 M519 M565 M622 M662 M720 M778 M1276 M1388 M1447 M1506 M1565 M1680
                                            M1698 M1716 M1794 M1812 M1830 M1908 M1926 M1944 M2023 M2042 M2060 M2139 M2158
                                            M2176
      134   REC-CT . . . . . . . . . . . .  242 244 251 M344 M370 M392 M415 M432 M455 M483 M505 M531 M551 M570 M587 M609
                                            M627 M649 M667 M684 M706 M725 M742 M764 M783 M800 M822 M850 M872 M899 M921 M998
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    44
0 Defined   Cross-reference of data names   References

0                                           M1027 M1051 M1080 M1103 M1132 M1156 M1185 M1208 M1237 M1260 M1282 M1299 M1323
                                            M1351 M1374 M1393 M1410 M1433 M1452 M1469 M1492 M1511 M1528 M1551 M1571 M1588
                                            M1611 M1650 M1668 M1686 M1704 M1728 M1748 M1765 M1782 M1800 M1818 M1842 M1862
                                            M1879 M1896 M1914 M1932 M1956 M1976 M1993 M2010 M2029 M2048 M2072 M2092 M2109
                                            M2126 M2145 M2164
      133   REC-SKL-SUB
      142   RECORD-COUNT . . . . . . . . .  M296 297 M305
       93   TEST-COMPUTED. . . . . . . . .  321
      108   TEST-CORRECT . . . . . . . . .  323
      161   TEST-ID. . . . . . . . . . . .  M226
       81   TEST-RESULTS . . . . . . . . .  M227 245
       77   TEST-21-A
       78   TEST-21-B
       79   TEST-21-C
       76   TEST-21-GROUP. . . . . . . . .  M1326 1335 1345
      139   TOTAL-ERROR
       73   WISH-LIST-XN-37. . . . . . . .  M1257 M1265 1283 1293
       40   WRK-XN-00001-1 . . . . . . . .  M1612 M1620 M1623 1669 1678 M1729 M1737 1783 1792 M1843 M1851 1897 1906 M1957
                                            M1965 2011 2020 M2073 M2081 2127 2136
       41   WRK-XN-00001-2 . . . . . . . .  M1613 M1621 M1624 1687 1696 M1730 M1738 1801 1810 M1844 M1852 1915 1924 M1958
                                            M1966 2030 2039 M2074 M2082 2146 2155
       42   WRK-XN-00001-3 . . . . . . . .  M1614 M1626 1705 1714 M1731 M1740 1819 1828 M1845 M1854 1933 1942 M1959 M1968
                                            2049 2058 M2075 M2084 2165 2174
      210   XXCOMPUTED . . . . . . . . . .  M330
      212   XXCORRECT. . . . . . . . . . .  M330
      205   XXINFO . . . . . . . . . . . .  317 332
       56   ZEROX-XN-1 . . . . . . . . . .  M996 1001 M1049 1055 M1154 1159
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    45
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

      326   BAIL-OUT . . . . . . . . . . .  P248
      334   BAIL-OUT-EX. . . . . . . . . .  E248 G328
      329   BAIL-OUT-WRITE . . . . . . . .  G327
      310   BLANK-LINE-PRINT
     2181   CCVS-EXIT. . . . . . . . . . .  G2089
     2182   CCVS-999999
      223   CCVS1
      335   CCVS1-EXIT . . . . . . . . . .  G229
      230   CLOSE-FILES. . . . . . . . . .  G2183
      258   COLUMN-NAMES-ROUTINE . . . . .  E228
      239   DE-LETE. . . . . . . . . . . .  P350 P360 P377 P400 P422 P439 P462 P473 P490 P518 P560 P577 P594 P617 P634 P657
                                            P674 P691 P715 P732 P749 P773 P790 P807 P829 P840 P857 P880 P891 P908 P933 P957
                                            P981 P1006 P1017 P1034 P1059 P1070 P1087 P1111 P1122 P1139 P1164 P1175 P1192
                                            P1216 P1227 P1244 P1271 P1289 P1306 P1330 P1341 P1358 P1383 P1400 P1417 P1442
                                            P1459 P1476 P1501 P1518 P1535 P1560 P1578 P1595 P1629 P1640 P1658 P1675 P1693
                                            P1711 P1743 P1755 P1772 P1789 P1807 P1825 P1857 P1869 P1886 P1903 P1921 P1939
                                            P1971 P1983 P2000 P2017 P2036 P2055 P2087 P2099 P2116 P2133 P2152 P2171
      262   END-ROUTINE. . . . . . . . . .  P231
      266   END-ROUTINE-1
      275   END-ROUTINE-12
      283   END-ROUTINE-13 . . . . . . . .  E231
      264   END-RTN-EXIT
      238   FAIL . . . . . . . . . . . . .  P363 P380 P409 P425 P442 P476 P493 P527 P537 P564 P580 P597 P621 P637 P661 P677
                                            P694 P719 P735 P752 P777 P793 P810 P843 P860 P894 P911 P936 P960 P984 P1020 P1037
                                            P1073 P1090 P1125 P1142 P1178 P1195 P1230 P1247 P1275 P1292 P1309 P1344 P1361
                                            P1387 P1403 P1420 P1446 P1462 P1479 P1505 P1521 P1538 P1564 P1581 P1598 P1643
                                            P1661 P1681 P1699 P1717 P1758 P1775 P1795 P1813 P1831 P1872 P1889 P1909 P1927
                                            P1945 P1986 P2003 P2024 P2043 P2061 P2102 P2119 P2140 P2159 P2177
      312   FAIL-ROUTINE . . . . . . . . .  P247
      325   FAIL-ROUTINE-EX. . . . . . . .  E247 G319
      320   FAIL-ROUTINE-WRITE . . . . . .  G313 G314
      253   HEAD-ROUTINE . . . . . . . . .  P228
      236   INSPT
      224   OPEN-FILES
      237   PASS . . . . . . . . . . . . .  P355 P372 P396 P417 P434 P468 P485 P524 P534 P556 P572 P589 P613 P629 P654 P669
                                            P686 P711 P727 P744 P770 P785 P802 P835 P852 P886 P903 P928 P952 P976 P1012 P1029
                                            P1065 P1082 P1117 P1134 P1170 P1187 P1222 P1239 P1268 P1284 P1301 P1336 P1353
                                            P1380 P1395 P1412 P1438 P1454 P1471 P1497 P1513 P1530 P1557 P1573 P1590 P1635
                                            P1653 P1670 P1688 P1706 P1750 P1767 P1784 P1802 P1820 P1864 P1881 P1898 P1916
                                            P1934 P1978 P1995 P2012 P2031 P2050 P2094 P2111 P2128 P2147 P2166
      241   PRINT-DETAIL . . . . . . . . .  P351 P367 P384 P401 P412 P429 P446 P463 P480 P497 P520 P525 P530 P535 P540 P561
                                            P567 P584 P601 P618 P624 P641 P658 P664 P681 P698 P716 P722 P739 P756 P774 P780
                                            P797 P814 P830 P847 P864 P881 P898 P915 P940 P964 P988 P1007 P1024 P1041 P1060
                                            P1077 P1094 P1112 P1129 P1146 P1165 P1182 P1199 P1217 P1234 P1251 P1272 P1278
                                            P1296 P1313 P1331 P1348 P1365 P1384 P1390 P1407 P1424 P1443 P1449 P1466 P1483
                                            P1502 P1508 P1525 P1542 P1561 P1567 P1585 P1602 P1630 P1647 P1665 P1683 P1701
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    46
0 Defined   Cross-reference of procedures   References

0                                           P1719 P1744 P1762 P1779 P1797 P1815 P1833 P1858 P1876 P1893 P1911 P1929 P1947
                                            P1972 P1990 P2007 P2026 P2045 P2063 P2088 P2106 P2123 P2142 P2161 P2179
      337   SECT-NC217A-001
      349   STR-DELETE-GF-1
      359   STR-DELETE-GF-1-1
      376   STR-DELETE-GF-1-2
      828   STR-DELETE-GF-10
      839   STR-DELETE-GF-10-1
      856   STR-DELETE-GF-10-2
      879   STR-DELETE-GF-11-0
      890   STR-DELETE-GF-11-1
      907   STR-DELETE-GF-11-2
      932   STR-DELETE-GF-12-1
      956   STR-DELETE-GF-13
      980   STR-DELETE-GF-14
     1005   STR-DELETE-GF-15
     1016   STR-DELETE-GF-15-1
     1033   STR-DELETE-GF-15-2
     1058   STR-DELETE-GF-16
     1069   STR-DELETE-GF-16-1
     1086   STR-DELETE-GF-16-2
     1110   STR-DELETE-GF-17
     1121   STR-DELETE-GF-17-1
     1138   STR-DELETE-GF-17-2
     1163   STR-DELETE-GF-18
     1174   STR-DELETE-GF-18-1
     1191   STR-DELETE-GF-18-2
     1215   STR-DELETE-GF-19
     1226   STR-DELETE-GF-19-1
     1243   STR-DELETE-GF-19-2
      399   STR-DELETE-GF-2
      406   STR-DELETE-GF-2-1
      421   STR-DELETE-GF-2-2
      438   STR-DELETE-GF-2-3
     1270   STR-DELETE-GF-20
     1288   STR-DELETE-GF-20-2
     1305   STR-DELETE-GF-20-3
     1329   STR-DELETE-GF-21
     1340   STR-DELETE-GF-21-1
     1357   STR-DELETE-GF-21-2
     1382   STR-DELETE-GF-22
     1399   STR-DELETE-GF-22-2
     1416   STR-DELETE-GF-22-3
     1441   STR-DELETE-GF-23
     1458   STR-DELETE-GF-23-2
     1475   STR-DELETE-GF-23-3
     1500   STR-DELETE-GF-24
     1517   STR-DELETE-GF-24-2
     1534   STR-DELETE-GF-24-3
     1559   STR-DELETE-GF-25-1
     1577   STR-DELETE-GF-25-2
     1594   STR-DELETE-GF-25-3
     1628   STR-DELETE-GF-26
     1639   STR-DELETE-GF-26-1
     1657   STR-DELETE-GF-26-2
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    47
0 Defined   Cross-reference of procedures   References

0    1674   STR-DELETE-GF-26-3
     1692   STR-DELETE-GF-26-4
     1710   STR-DELETE-GF-26-5
     1742   STR-DELETE-GF-27
     1754   STR-DELETE-GF-27-1
     1771   STR-DELETE-GF-27-2
     1788   STR-DELETE-GF-27-3
     1806   STR-DELETE-GF-27-4
     1824   STR-DELETE-GF-27-5
     1856   STR-DELETE-GF-28
     1868   STR-DELETE-GF-28-1
     1885   STR-DELETE-GF-28-2
     1902   STR-DELETE-GF-28-3
     1920   STR-DELETE-GF-28-4
     1938   STR-DELETE-GF-28-5
     1970   STR-DELETE-GF-29
     1982   STR-DELETE-GF-29-1
     1999   STR-DELETE-GF-29-2
     2016   STR-DELETE-GF-29-3
     2035   STR-DELETE-GF-29-4
     2054   STR-DELETE-GF-29-5
      461   STR-DELETE-GF-3
      472   STR-DELETE-GF-3-1
      489   STR-DELETE-GF-3-2
     2086   STR-DELETE-GF-30
     2098   STR-DELETE-GF-30-1
     2115   STR-DELETE-GF-30-2
     2132   STR-DELETE-GF-30-3
     2151   STR-DELETE-GF-30-4
     2170   STR-DELETE-GF-30-5
      559   STR-DELETE-GF-5-1
      576   STR-DELETE-GF-5-2
      593   STR-DELETE-GF-5-3
      616   STR-DELETE-GF-6-1
      633   STR-DELETE-GF-6-2
      656   STR-DELETE-GF-7-1
      673   STR-DELETE-GF-7-2
      690   STR-DELETE-GF-7-3
      714   STR-DELETE-GF-8-1
      731   STR-DELETE-GF-8-2
      748   STR-DELETE-GF-8-3
      772   STR-DELETE-GF-9-1
      789   STR-DELETE-GF-9-2
      806   STR-DELETE-GF-9-3
      362   STR-FAIL-GF-1-1. . . . . . . .  G358
      379   STR-FAIL-GF-1-2. . . . . . . .  G375
      842   STR-FAIL-GF-10-1 . . . . . . .  G838
      859   STR-FAIL-GF-10-2 . . . . . . .  G855
      893   STR-FAIL-GF-11-1 . . . . . . .  G889
      910   STR-FAIL-GF-11-2 . . . . . . .  G906
      935   STR-FAIL-GF-12-1 . . . . . . .  G931
      959   STR-FAIL-GF-13 . . . . . . . .  G955
      983   STR-FAIL-GF-14 . . . . . . . .  G979
     1019   STR-FAIL-GF-15-1 . . . . . . .  G1015
     1036   STR-FAIL-GF-15-2 . . . . . . .  G1032
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    48
0 Defined   Cross-reference of procedures   References

0    1072   STR-FAIL-GF-16-1 . . . . . . .  G1068
     1089   STR-FAIL-GF-16-2 . . . . . . .  G1085
     1124   STR-FAIL-GF-17-1 . . . . . . .  G1120
     1141   STR-FAIL-GF-17-2 . . . . . . .  G1137
     1177   STR-FAIL-GF-18-1 . . . . . . .  G1173
     1194   STR-FAIL-GF-18-2 . . . . . . .  G1190
     1229   STR-FAIL-GF-19-1 . . . . . . .  G1225
     1246   STR-FAIL-GF-19-2 . . . . . . .  G1242
      408   STR-FAIL-GF-2-1. . . . . . . .  G398
      424   STR-FAIL-GF-2-2. . . . . . . .  G420
      441   STR-FAIL-GF-2-3. . . . . . . .  G437
     1274   STR-FAIL-GF-20-1 . . . . . . .  G1267
     1291   STR-FAIL-GF-20-2 . . . . . . .  G1287
     1308   STR-FAIL-GF-20-3 . . . . . . .  G1304
     1343   STR-FAIL-GF-21-1 . . . . . . .  G1339
     1360   STR-FAIL-GF-21-2 . . . . . . .  G1356
     1386   STR-FAIL-GF-22-1 . . . . . . .  G1379
     1402   STR-FAIL-GF-22-2 . . . . . . .  G1398
     1419   STR-FAIL-GF-22-3 . . . . . . .  G1415
     1445   STR-FAIL-GF-23-1 . . . . . . .  G1440
     1461   STR-FAIL-GF-23-2 . . . . . . .  G1457
     1478   STR-FAIL-GF-23-3 . . . . . . .  G1474
     1504   STR-FAIL-GF-24-1 . . . . . . .  G1499
     1520   STR-FAIL-GF-24-2 . . . . . . .  G1516
     1537   STR-FAIL-GF-24-3 . . . . . . .  G1533
     1563   STR-FAIL-GF-25-1 . . . . . . .  G1556
     1580   STR-FAIL-GF-25-2 . . . . . . .  G1576
     1597   STR-FAIL-GF-25-3 . . . . . . .  G1593
     1642   STR-FAIL-GF-26-1 . . . . . . .  G1638
     1660   STR-FAIL-GF-26-2 . . . . . . .  G1656
     1677   STR-FAIL-GF-26-3 . . . . . . .  G1673
     1695   STR-FAIL-GF-26-4 . . . . . . .  G1691
     1713   STR-FAIL-GF-26-5 . . . . . . .  G1709
     1757   STR-FAIL-GF-27-1 . . . . . . .  G1753
     1774   STR-FAIL-GF-27-2 . . . . . . .  G1770
     1791   STR-FAIL-GF-27-3 . . . . . . .  G1787
     1809   STR-FAIL-GF-27-4 . . . . . . .  G1805
     1827   STR-FAIL-GF-27-5 . . . . . . .  G1823
     1871   STR-FAIL-GF-28-1 . . . . . . .  G1867
     1888   STR-FAIL-GF-28-2 . . . . . . .  G1884
     1905   STR-FAIL-GF-28-3 . . . . . . .  G1901
     1923   STR-FAIL-GF-28-4 . . . . . . .  G1919
     1941   STR-FAIL-GF-28-5 . . . . . . .  G1937
     1985   STR-FAIL-GF-29-1 . . . . . . .  G1981
     2002   STR-FAIL-GF-29-2 . . . . . . .  G1998
     2019   STR-FAIL-GF-29-3 . . . . . . .  G2015
     2038   STR-FAIL-GF-29-4 . . . . . . .  G2034
     2057   STR-FAIL-GF-29-5 . . . . . . .  G2053
      475   STR-FAIL-GF-3-1. . . . . . . .  G471
      492   STR-FAIL-GF-3-2. . . . . . . .  G488
     2101   STR-FAIL-GF-30-1 . . . . . . .  G2097
     2118   STR-FAIL-GF-30-2 . . . . . . .  G2114
     2135   STR-FAIL-GF-30-3 . . . . . . .  G2131
     2154   STR-FAIL-GF-30-4 . . . . . . .  G2150
     2173   STR-FAIL-GF-30-5 . . . . . . .  G2169
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    49
0 Defined   Cross-reference of procedures   References

0     563   STR-FAIL-GF-5-1. . . . . . . .  G558
      579   STR-FAIL-GF-5-2. . . . . . . .  G575
      596   STR-FAIL-GF-5-3. . . . . . . .  G592
      620   STR-FAIL-GF-6-1. . . . . . . .  G615
      636   STR-FAIL-GF-6-2. . . . . . . .  G632
      660   STR-FAIL-GF-7-1. . . . . . . .  G653
      676   STR-FAIL-GF-7-2. . . . . . . .  G672
      693   STR-FAIL-GF-7-3. . . . . . . .  G689
      718   STR-FAIL-GF-8-1. . . . . . . .  G713
      734   STR-FAIL-GF-8-2. . . . . . . .  G730
      751   STR-FAIL-GF-8-3. . . . . . . .  G747
      776   STR-FAIL-GF-9-1. . . . . . . .  G769
      792   STR-FAIL-GF-9-2. . . . . . . .  G788
      809   STR-FAIL-GF-9-3. . . . . . . .  G805
      338   STR-INIT-GF-1
      816   STR-INIT-GF-10 . . . . . . . .  G775
      866   STR-INIT-GF-11 . . . . . . . .  G831
      917   STR-INIT-GF-12 . . . . . . . .  G882
      942   STR-INIT-GF-13
      966   STR-INIT-GF-14
      990   STR-INIT-GF-15
     1043   STR-INIT-GF-16 . . . . . . . .  G1008
     1096   STR-INIT-GF-17 . . . . . . . .  G1061
     1148   STR-INIT-GF-18 . . . . . . . .  G1113
     1201   STR-INIT-GF-19 . . . . . . . .  G1166
      386   STR-INIT-GF-2. . . . . . . . .  G352
     1253   STR-INIT-GF-20 . . . . . . . .  G1218
     1316   STR-INIT-GF-21 . . . . . . . .  G1273
     1367   STR-INIT-GF-22 . . . . . . . .  G1332
     1426   STR-INIT-GF-23 . . . . . . . .  G1385
     1485   STR-INIT-GF-24 . . . . . . . .  G1444
     1544   STR-INIT-GF-25 . . . . . . . .  G1503
     1604   STR-INIT-GF-26 . . . . . . . .  G1562
     1721   STR-INIT-GF-27 . . . . . . . .  G1631
     1835   STR-INIT-GF-28 . . . . . . . .  G1745
     1949   STR-INIT-GF-29 . . . . . . . .  G1859
      448   STR-INIT-GF-3. . . . . . . . .  G402
     2065   STR-INIT-GF-30 . . . . . . . .  G1973
      542   STR-INIT-GF-5. . . . . . . . .  G521
      603   STR-INIT-GF-6. . . . . . . . .  G562
      643   STR-INIT-GF-7. . . . . . . . .  G619
      700   STR-INIT-GF-8. . . . . . . . .  G659
      758   STR-INIT-GF-9. . . . . . . . .  G717
      345   STR-TEST-GF-1
      353   STR-TEST-GF-1-1. . . . . . . .  G348
      369   STR-TEST-GF-1-2
      824   STR-TEST-GF-10-0
      833   STR-TEST-GF-10-1 . . . . . . .  G827
      849   STR-TEST-GF-10-2
      874   STR-TEST-GF-11
      884   STR-TEST-GF-11-1 . . . . . . .  G878
      901   STR-TEST-GF-11-2
      924   STR-TEST-GF-12-1
      948   STR-TEST-GF-13
      972   STR-TEST-GF-14
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    50
0 Defined   Cross-reference of procedures   References

0    1000   STR-TEST-GF-15-0
     1010   STR-TEST-GF-15-1 . . . . . . .  G1004
     1026   STR-TEST-GF-15-2
     1053   STR-TEST-GF-16-0
     1063   STR-TEST-GF-16-1 . . . . . . .  G1057
     1079   STR-TEST-GF-16-2
     1105   STR-TEST-GF-17-0
     1115   STR-TEST-GF-17-1 . . . . . . .  G1109
     1131   STR-TEST-GF-17-2
     1158   STR-TEST-GF-18-0
     1168   STR-TEST-GF-18-1 . . . . . . .  G1162
     1184   STR-TEST-GF-18-2
     1210   STR-TEST-GF-19-0
     1220   STR-TEST-GF-19-1 . . . . . . .  G1214
     1236   STR-TEST-GF-19-2
      393   STR-TEST-GF-2-0
      403   STR-TEST-GF-2-1
      414   STR-TEST-GF-2-2
      431   STR-TEST-GF-2-3
     1262   STR-TEST-GF-20-1
     1280   STR-TEST-GF-20-2
     1298   STR-TEST-GF-20-3
     1325   STR-TEST-GF-21-0
     1334   STR-TEST-GF-21-1 . . . . . . .  G1328
     1350   STR-TEST-GF-21-2
     1376   STR-TEST-GF-22-1
     1392   STR-TEST-GF-22-2
     1409   STR-TEST-GF-22-3
     1435   STR-TEST-GF-23-1
     1451   STR-TEST-GF-23-2
     1468   STR-TEST-GF-23-3
     1494   STR-TEST-GF-24-1
     1510   STR-TEST-GF-24-2
     1527   STR-TEST-GF-24-3
     1553   STR-TEST-GF-25-1
     1569   STR-TEST-GF-25-2
     1587   STR-TEST-GF-25-3
     1616   STR-TEST-GF-26-0
     1633   STR-TEST-GF-26-1 . . . . . . .  G1627
     1649   STR-TEST-GF-26-2
     1667   STR-TEST-GF-26-3
     1685   STR-TEST-GF-26-4
     1703   STR-TEST-GF-26-5
     1733   STR-TEST-GF-27-0
     1747   STR-TEST-GF-27-1 . . . . . . .  G1741
     1764   STR-TEST-GF-27-2
     1781   STR-TEST-GF-27-3
     1799   STR-TEST-GF-27-4
     1817   STR-TEST-GF-27-5
     1847   STR-TEST-GF-28-0
     1861   STR-TEST-GF-28-1 . . . . . . .  G1855
     1878   STR-TEST-GF-28-2
     1895   STR-TEST-GF-28-3
     1913   STR-TEST-GF-28-4
     1931   STR-TEST-GF-28-5
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    51
0 Defined   Cross-reference of procedures   References

0    1961   STR-TEST-GF-29
     1975   STR-TEST-GF-29-1 . . . . . . .  G1969
     1992   STR-TEST-GF-29-2
     2009   STR-TEST-GF-29-3
     2028   STR-TEST-GF-29-4
     2047   STR-TEST-GF-29-5
      457   STR-TEST-GF-3
      466   STR-TEST-GF-3-1. . . . . . . .  G460
      482   STR-TEST-GF-3-2
     2077   STR-TEST-GF-30
     2091   STR-TEST-GF-30-1 . . . . . . .  G2085
     2108   STR-TEST-GF-30-2
     2125   STR-TEST-GF-30-3
     2144   STR-TEST-GF-30-4
     2163   STR-TEST-GF-30-5
      553   STR-TEST-GF-5-1
      569   STR-TEST-GF-5-2
      586   STR-TEST-GF-5-3
      611   STR-TEST-GF-6-1
      626   STR-TEST-GF-6-2
      651   STR-TEST-GF-7-1
      666   STR-TEST-GF-7-2
      683   STR-TEST-GF-7-3
      708   STR-TEST-GF-8-1
      724   STR-TEST-GF-8-2
      741   STR-TEST-GF-8-3
      766   STR-TEST-GF-9-1
      782   STR-TEST-GF-9-2
      799   STR-TEST-GF-9-3
      366   STR-WRITE-GF-1-1 . . . . . . .  G356 G361
      383   STR-WRITE-GF-1-2 . . . . . . .  G373 G378
      846   STR-WRITE-GF-10-1. . . . . . .  G836 G841
      863   STR-WRITE-GF-10-2. . . . . . .  G853 G858
      897   STR-WRITE-GF-11-1. . . . . . .  G887 G892
      914   STR-WRITE-GF-11-2. . . . . . .  G904 G909
      939   STR-WRITE-GF-12-1. . . . . . .  G929 G934
      963   STR-WRITE-GF-13. . . . . . . .  G953 G958
      987   STR-WRITE-GF-14. . . . . . . .  G977 G982
     1023   STR-WRITE-GF-15-1. . . . . . .  G1013 G1018
     1040   STR-WRITE-GF-15-2. . . . . . .  G1030 G1035
     1076   STR-WRITE-GF-16-1. . . . . . .  G1066 G1071
     1093   STR-WRITE-GF-16-2. . . . . . .  G1083 G1088
     1128   STR-WRITE-GF-17-1. . . . . . .  G1118 G1123
     1145   STR-WRITE-GF-17-2. . . . . . .  G1135 G1140
     1181   STR-WRITE-GF-18-1. . . . . . .  G1171 G1176
     1198   STR-WRITE-GF-18-2. . . . . . .  G1188 G1193
     1233   STR-WRITE-GF-19-1. . . . . . .  G1223 G1228
     1250   STR-WRITE-GF-19-2. . . . . . .  G1240 G1245
      411   STR-WRITE-GF-2-1 . . . . . . .  G397
      428   STR-WRITE-GF-2-2 . . . . . . .  G418 G423
      445   STR-WRITE-GF-2-3 . . . . . . .  G435 G440
     1277   STR-WRITE-GF-20-1. . . . . . .  G1269
     1295   STR-WRITE-GF-20-2. . . . . . .  G1285 G1290
     1312   STR-WRITE-GF-20-3. . . . . . .  G1302 G1307
     1347   STR-WRITE-GF-21-1. . . . . . .  G1337 G1342
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    52
0 Defined   Cross-reference of procedures   References

0    1364   STR-WRITE-GF-21-2. . . . . . .  G1354 G1359
     1389   STR-WRITE-GF-22-1. . . . . . .  G1381
     1406   STR-WRITE-GF-22-2. . . . . . .  G1396 G1401
     1423   STR-WRITE-GF-22-3. . . . . . .  G1413 G1418
     1448   STR-WRITE-GF-23-1. . . . . . .  G1439
     1465   STR-WRITE-GF-23-2. . . . . . .  G1455 G1460
     1482   STR-WRITE-GF-23-3. . . . . . .  G1472 G1477
     1507   STR-WRITE-GF-24-1. . . . . . .  G1498
     1524   STR-WRITE-GF-24-2. . . . . . .  G1514 G1519
     1541   STR-WRITE-GF-24-3. . . . . . .  G1531 G1536
     1566   STR-WRITE-GF-25-1. . . . . . .  G1558
     1584   STR-WRITE-GF-25-2. . . . . . .  G1574 G1579
     1601   STR-WRITE-GF-25-3. . . . . . .  G1591 G1596
     1646   STR-WRITE-GF-26-1. . . . . . .  G1636 G1641
     1664   STR-WRITE-GF-26-2. . . . . . .  G1654 G1659
     1682   STR-WRITE-GF-26-3. . . . . . .  G1671 G1676
     1700   STR-WRITE-GF-26-4. . . . . . .  G1689 G1694
     1718   STR-WRITE-GF-26-5. . . . . . .  G1707 G1712
     1761   STR-WRITE-GF-27-1. . . . . . .  G1751 G1756
     1778   STR-WRITE-GF-27-2. . . . . . .  G1768 G1773
     1796   STR-WRITE-GF-27-3. . . . . . .  G1785 G1790
     1814   STR-WRITE-GF-27-4. . . . . . .  G1803 G1808
     1832   STR-WRITE-GF-27-5. . . . . . .  G1821 G1826
     1875   STR-WRITE-GF-28-1. . . . . . .  G1865 G1870
     1892   STR-WRITE-GF-28-2. . . . . . .  G1882 G1887
     1910   STR-WRITE-GF-28-3. . . . . . .  G1899 G1904
     1928   STR-WRITE-GF-28-4. . . . . . .  G1917 G1922
     1946   STR-WRITE-GF-28-5. . . . . . .  G1935 G1940
     1989   STR-WRITE-GF-29-1. . . . . . .  G1979 G1984
     2006   STR-WRITE-GF-29-2. . . . . . .  G1996 G2001
     2025   STR-WRITE-GF-29-3. . . . . . .  G2013 G2018
     2044   STR-WRITE-GF-29-4. . . . . . .  G2032 G2037
     2062   STR-WRITE-GF-29-5. . . . . . .  G2051 G2056
      479   STR-WRITE-GF-3-1 . . . . . . .  G469 G474
      496   STR-WRITE-GF-3-2 . . . . . . .  G486 G491
     2105   STR-WRITE-GF-30-1. . . . . . .  G2095 G2100
     2122   STR-WRITE-GF-30-2. . . . . . .  G2112 G2117
     2141   STR-WRITE-GF-30-3. . . . . . .  G2129 G2134
     2160   STR-WRITE-GF-30-4. . . . . . .  G2148 G2153
     2178   STR-WRITE-GF-30-5. . . . . . .  G2167 G2172
      566   STR-WRITE-GF-5-1 . . . . . . .  G557
      583   STR-WRITE-GF-5-2 . . . . . . .  G573 G578
      600   STR-WRITE-GF-5-3 . . . . . . .  G590 G595
      623   STR-WRITE-GF-6-1 . . . . . . .  G614
      640   STR-WRITE-GF-6-2 . . . . . . .  G630 G635
      663   STR-WRITE-GF-7-1 . . . . . . .  G655
      680   STR-WRITE-GF-7-2 . . . . . . .  G670 G675
      697   STR-WRITE-GF-7-3 . . . . . . .  G687 G692
      721   STR-WRITE-GF-8-1 . . . . . . .  G712
      738   STR-WRITE-GF-8-2 . . . . . . .  G728 G733
      755   STR-WRITE-GF-8-3 . . . . . . .  G745 G750
      779   STR-WRITE-GF-9-1 . . . . . . .  G771
      796   STR-WRITE-GF-9-2 . . . . . . .  G786 G791
      813   STR-WRITE-GF-9-3 . . . . . . .  G803 G808
      517   STRING-DELETE-4
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    53
0 Defined   Cross-reference of procedures   References

0     499   STRING-INIT-4. . . . . . . . .  G464
      508   STRING-TEST-4
      522   STRING-TEST-4-1
      532   STRING-TEST-4-2
      234   TERMINATE-CALL
      232   TERMINATE-CCVS
      295   WRITE-LINE . . . . . . . . . .  P245 P246 P254 P255 P256 P257 P259 P260 P261 P263 P265 P274 P282 P288 P293 P294
                                            P317 P321 P323 P332
      307   WRT-LN . . . . . . . . . . . .  P301 P302 P303 P306 P311
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    54
0 Defined   Cross-reference of programs     References

        3   NC217A
1PP 5655-EC6 IBM Enterprise COBOL for z/OS  6.3.0 P220314       NC217A    Date 06/04/2022  Time 12:00:51   Page    55
0LineID  Message code  Message text

     36  IGYGR1216-I   A "RECORDING MODE" of "F" was assumed for file "PRINT-FILE".

    406  IGYPS2015-I   The paragraph or section prior to paragraph or section "STR-DELETE-GF-2-1" did not contain any statements.

    408  IGYPS2015-I   The paragraph or section prior to paragraph or section "STR-FAIL-GF-2-1" did not contain any statements.

    517  IGYPS2015-I   The paragraph or section prior to paragraph or section "STRING-DELETE-4" did not contain any statements.
-Messages    Total    Informational    Warning    Error    Severe    Terminating
0Printed:       4           4
-* Statistics for COBOL program NC217A:
 *    Source records = 2183
 *    Data Division statements = 97
 *    Procedure Division statements = 1317
 *    Generated COBOL statements = 0
 *    Program complexity factor = 1327
0End of compilation 1,  program NC217A,  highest severity 0.
0Return code 0
